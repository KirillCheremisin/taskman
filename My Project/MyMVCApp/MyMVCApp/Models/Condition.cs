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
    
    public partial class Condition
    {
        public Condition()
        {
            this.Task = new HashSet<Task>();
        }
    
        public int ConditionID { get; set; }
        public string ConditionName { get; set; }
    
        public virtual ICollection<Task> Task { get; set; }
    }
}
