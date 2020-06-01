using System;
using System.Net;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Text;
using System.IO;

namespace WebApplication
{
    public partial class page : System.Web.UI.Page
    {
        private string BaseUri = "https://api.2loveyou.com:8443/";
        public string imgSrc = "";
        public string contentSrc = "";
        public string ogImgstr = "";
        public string ogContentstr = "";
        public string ogUrl = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0)
            {
                if (Request.QueryString["pid"] != null)
                {
                    string mapStr = "data/center/vipAdds/imgAndContent/";
                    string omimgStr = Get(mapStr + Request.QueryString["pid"].ToString());

                    JObject jObject = (JObject)JsonConvert.DeserializeObject(omimgStr);

                    string status = jObject["state"].ToString();
                    if (status == "1")
                    {
                        imgSrc = jObject["data"]["img"].ToString();
                        string s = jObject["data"]["content"].ToString();
                        contentSrc = s != "" ? s : contentSrc;
                        jObject = (JObject)JsonConvert.DeserializeObject(Get("data/center/vipAdds/click/" + Request.QueryString["pid"].ToString()));
                        if (jObject["state"].ToString() != "1")
                        {
                            Console.Write("物料ID：" + Request.QueryString["pid"].ToString() + "点击次数更新失败");
                        }
                    }
                }
                ogImgstr = "<meta property=\"og:image\" content=\"" + imgSrc + "\" />";
                ogContentstr = "<meta property =\"og:description\" content=\"" + contentSrc + "\" />";
                ogUrl ="<meta property =\"og:url\" content=\""+ Request.Url.AbsoluteUri + "\" />";
            }
        }
        #region Post请求

        string queryPlatDataOnlinePost(string strUrl, IDictionary<string, string> parameters, int timeout)
        {


            try
            {
                if (string.IsNullOrEmpty(strUrl))
                {
                    throw new ArgumentNullException("url");
                }

                HttpWebRequest request = WebRequest.Create(strUrl) as HttpWebRequest;
                request.ServicePoint.Expect100Continue = false;
                request.ServicePoint.UseNagleAlgorithm = false; //是否使用 Nagle 不使用 提高效率
                                                                //request.AllowWriteStreamBuffering = false; //数据是否缓冲 false 提高效率
                request.Method = "POST";
                request.ContentType = "application/x-www-form-urlencoded;charset=utf-8";//没效果
                request.Accept = "text/plain;charset=utf-8";   //该编码有效，可解决乱码问题 

                request.Timeout = timeout;


                Encoding requestEncoding = Encoding.GetEncoding("UTF-8");
                //如果需要POST数据  
                if (!(parameters == null || parameters.Count == 0))
                {


                    StringBuilder buffer = new StringBuilder();
                    int i = 0;
                    foreach (string key in parameters.Keys)
                    {
                        if (i > 0)
                        {
                            buffer.AppendFormat("&{0}={1}", key, parameters[key]);
                        }
                        else
                        {
                            buffer.AppendFormat("{0}={1}", key, parameters[key]);
                        }
                        i++;
                    }
                    byte[] data = requestEncoding.GetBytes(buffer.ToString());
                    using (Stream stream = request.GetRequestStream())
                    {
                        stream.Write(data, 0, data.Length);
                    }
                }


                //获取响应，并设置响应编码
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                string encoding = response.ContentEncoding;
                if (encoding == null || encoding.Length < 1)
                {
                    encoding = "UTF-8"; //默认编码
                }
                //读取响应流
                StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.GetEncoding(encoding));
                string returnData = reader.ReadToEnd();
                reader.Dispose();
                response.Close();
                return returnData;
            }
            catch (Exception ex)
            {
                //ScriptManager.RegisterStartupScript(UpdatePanel2, this.GetType(), "alert", "alert('" + ex.Message + "') ", true);
            }
            return "";
        }
        #endregion

        #region Post请求
        string Post(string data, string uri)
        {
            //先根据用户请求的uri构造请求地址
            string serviceUrl = string.Format("{0}/{1}", this.BaseUri, uri);
            //创建Web访问对象
            HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(serviceUrl);
            //把用户传过来的数据转成“UTF-8”的字节流
            byte[] buf = System.Text.Encoding.GetEncoding("UTF-8").GetBytes(data);

            myRequest.Method = "POST";
            myRequest.ContentLength = buf.Length;
            myRequest.ContentType = "application/json";
            myRequest.MaximumAutomaticRedirections = 1;
            myRequest.AllowAutoRedirect = true;
            //发送请求
            Stream stream = myRequest.GetRequestStream();
            stream.Write(buf, 0, buf.Length);
            stream.Close();

            //获取接口返回值
            //通过Web访问对象获取响应内容
            HttpWebResponse myResponse = (HttpWebResponse)myRequest.GetResponse();
            //通过响应内容流创建StreamReader对象，因为StreamReader更高级更快
            StreamReader reader = new StreamReader(myResponse.GetResponseStream(), Encoding.UTF8);
            //string returnXml = HttpUtility.UrlDecode(reader.ReadToEnd());//如果有编码问题就用这个方法
            string returnXml = reader.ReadToEnd();//利用StreamReader就可以从响应内容从头读到尾
            reader.Close();
            myResponse.Close();
            return returnXml;

        }
        #endregion

        #region Get请求
        string Get(string uri)
        {
            //先根据用户请求的uri构造请求地址
            string serviceUrl = string.Format("{0}/{1}", this.BaseUri, uri);
            //创建Web访问对  象
            HttpWebRequest myRequest = (HttpWebRequest)WebRequest.Create(serviceUrl);
            //通过Web访问对象获取响应内容
            HttpWebResponse myResponse = (HttpWebResponse)myRequest.GetResponse();
            //通过响应内容流创建StreamReader对象，因为StreamReader更高级更快
            StreamReader reader = new StreamReader(myResponse.GetResponseStream(), Encoding.UTF8);
            //string returnXml = HttpUtility.UrlDecode(reader.ReadToEnd());//如果有编码问题就用这个方法
            string returnXml = reader.ReadToEnd();//利用StreamReader就可以从响应内容从头读到尾
            reader.Close();
            myResponse.Close();
            return returnXml;
        }
        #endregion

        #region Json 操作

        #endregion
    }
}