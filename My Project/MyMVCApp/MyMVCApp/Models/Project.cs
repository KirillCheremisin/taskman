//------------------------------------------------------------------------------
// <auto-generated>
//    Этот код был создан из шаблона.
//
//    Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//    Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MyMVCApp.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Project
    {
        public Project()
        {
            this.Task = new HashSet<Task>();
        }
    
        public int ProjectID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public System.DateTime CrateDate { get; set; }
        public int AuthorID { get; set; }
    
        public virtual ICollection<Task> Task { get; set; }
        public virtual Employee Employee { get; set; }
    }
}
