 import java.io.*; 
 import java.util.*;
 import java.servlet.*;
 import org.apache.commons.fileupload.*;
 import org.apache.commons.fileupload.disk.*;
 import org.apache.commons.fileupload.servlet.*;
 import org.apache.commons.io.output.*;
 
 public class UploadServlet extends HttpServlet{
   
   public void doGet(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, java.io.IOException {
      try
      {
          File file ;
          int maxFileSize = 5000 * 1024;
          int maxMemSize = 5000 * 1024;
          ServletContext context = pageContext.getServletContext();
          String filePath = context.getInitParameter("file-upload");

         // Verify the content type
         String contentType = request.getContentType();
         if ((contentType.indexOf("multipart/form-data") >= 0)) {

         DiskFileItemFactory factory = new DiskFileItemFactory();
         // maximum size that will be stored in memory
         factory.setSizeThreshold(maxMemSize);
         // Location to save data that is larger than maxMemSize.
         factory.setRepository(new File("c:\\temp"));

         // Create a new file upload handler
         ServletFileUpload upload = new ServletFileUpload(factory);
         // maximum file size to be uploaded.
         upload.setSizeMax( maxFileSize );
         try{ 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

            while ( i.hasNext () ) 
            {
               FileItem fi = (FileItem)i.next();
               if ( !fi.isFormField () )	
               {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
               // Write the file
               if( fileName.lastIndexOf("\\") >= 0 ){
               file = new File( filePath + 
               fileName.substring( fileName.lastIndexOf("\\"))) ;
               }else{
               file = new File( filePath + 
               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               }
               fi.write( file ) ;
               }
            }
         }catch(Exception ex) {
            System.out.println(ex);
         }
         }

   catch (Throwable ex)
   {
      System.out.println(ex);
   }
 }      
}
}
          
 
