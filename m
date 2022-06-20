Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5A35511A2
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352534.579377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzf-0003zT-GK; Mon, 20 Jun 2022 07:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352534.579377; Mon, 20 Jun 2022 07:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzf-0003sA-71; Mon, 20 Jun 2022 07:38:43 +0000
Received: by outflank-mailman (input) for mailman id 352534;
 Mon, 20 Jun 2022 07:38:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hycu=W3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3Bzc-0002ZE-KP
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:38:40 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd465502-f06b-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 09:38:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B6ED1F972;
 Mon, 20 Jun 2022 07:38:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 292A1134CA;
 Mon, 20 Jun 2022 07:38:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AKiuCPojsGI3DAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Jun 2022 07:38:34 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: fd465502-f06b-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655710714; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ij/l8vGwMUP3sj1l6oCVo+3lGirXIhChnHnYSjdN7M4=;
	b=iF7oXWL274QxV6P/YGQuE7yJf2FZ0UXUVsAp/+MPXoFykVPZWfIApaoD94IxzdB9eHBASW
	njBlkkiQQWfD4VEiQqxiOKMA4qCWqPyyhvost8/ERAPHX38leEth0ndXibttvUX81T0hpY
	deQXWgsSL9uNG4oH4OkMlGZriS7IVLY=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 7/8] mini-os: apply coding style to console.c
Date: Mon, 20 Jun 2022 09:38:19 +0200
Message-Id: <20220620073820.9336-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>
References: <20220620073820.9336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make console.c coding style compliant.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 console.c | 280 ++++++++++++++++++++++++++++--------------------------
 1 file changed, 145 insertions(+), 135 deletions(-)

diff --git a/console.c b/console.c
index 29277eac..5d205c7d 100644
--- a/console.c
+++ b/console.c
@@ -1,14 +1,14 @@
-/* 
+/*
  ****************************************************************************
  * (C) 2006 - Grzegorz Milos - Cambridge University
  ****************************************************************************
  *
  *        File: console.c
  *      Author: Grzegorz Milos
- *     Changes: 
- *              
+ *     Changes:
+ *
  *        Date: Mar 2006
- * 
+ *
  * Environment: Xen Minimal OS
  * Description: Console interface.
  *
@@ -21,19 +21,19 @@
  * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
  * sell copies of the Software, and to permit persons to whom the Software is
  * furnished to do so, subject to the following conditions:
- * 
+ *
  * The above copyright notice and this permission notice shall be included in
  * all copies or substantial portions of the Software.
- * 
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
- * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
  * DEALINGS IN THE SOFTWARE.
  */
- 
+
 #include <mini-os/types.h>
 #include <mini-os/wait.h>
 #include <mini-os/mm.h>
@@ -50,26 +50,24 @@
 #include <xen/io/ring.h>
 #include <xen/hvm/params.h>
 
-/* If console not initialised the printk will be sent to xen serial line 
-   NOTE: you need to enable verbose in xen/Rules.mk for it to work. */
 static struct consfront_dev* xen_console = NULL;
 static int console_initialised = 0;
 
-__attribute__((weak)) void console_input(char * buf, unsigned len)
+__attribute__((weak)) void console_input(char *buf, unsigned int len)
 {
-    if(len > 0)
+    if ( len > 0 )
     {
         /* Just repeat what's written */
         buf[len] = '\0';
         printk("%s", buf);
-        
-        if(buf[len-1] == '\r')
+
+        if ( buf[len - 1] == '\r' )
             printk("\nNo console input handler.\n");
     }
 }
 
 #ifndef HAVE_LIBC
-void xencons_rx(char *buf, unsigned len, struct pt_regs *regs)
+void xencons_rx(char *buf, unsigned int len, struct pt_regs *regs)
 {
     console_input(buf, len);
 }
@@ -80,88 +78,94 @@ void xencons_tx(void)
 }
 #endif
 
-
 void console_print(struct consfront_dev *dev, const char *data, int length)
 {
     char *curr_char, saved_char;
     char copied_str[length+1];
     char *copied_ptr;
     int part_len;
-    int (*ring_send_fn)(struct consfront_dev *dev, const char *data, unsigned length);
+    int (*ring_send_fn)(struct consfront_dev *dev, const char *data,
+                        unsigned int length);
 
-    if(!console_initialised)
+    if ( !console_initialised )
         ring_send_fn = xencons_ring_send_no_notify;
     else
         ring_send_fn = xencons_ring_send;
 
-    if (dev && dev->is_raw) {
+    if ( dev && dev->is_raw )
+    {
         ring_send_fn(dev, data, length);
         return;
     }
 
     copied_ptr = copied_str;
     memcpy(copied_ptr, data, length);
-    for(curr_char = copied_ptr; curr_char < copied_ptr+length-1; curr_char++)
+    for ( curr_char = copied_ptr; curr_char < copied_ptr + length - 1;
+          curr_char++ )
     {
-        if(*curr_char == '\n')
+        if ( *curr_char == '\n' )
         {
             *curr_char = '\r';
-            saved_char = *(curr_char+1);
-            *(curr_char+1) = '\n';
+            saved_char = *(curr_char + 1);
+            *(curr_char + 1) = '\n';
             part_len = curr_char - copied_ptr + 2;
             ring_send_fn(dev, copied_ptr, part_len);
-            *(curr_char+1) = saved_char;
-            copied_ptr = curr_char+1;
+            *(curr_char + 1) = saved_char;
+            copied_ptr = curr_char + 1;
             length -= part_len - 1;
         }
     }
 
-    if (copied_ptr[length-1] == '\n') {
-        copied_ptr[length-1] = '\r';
+    if ( copied_ptr[length - 1] == '\n')
+    {
+        copied_ptr[length - 1] = '\r';
         copied_ptr[length] = '\n';
         length++;
     }
-    
+
     ring_send_fn(dev, copied_ptr, length);
 }
 
 void print(int direct, const char *fmt, va_list args)
 {
     static char __print_buf[1024];
-    
+
     (void)vsnprintf(__print_buf, sizeof(__print_buf), fmt, args);
 
-    if(direct)
+    if ( direct )
     {
-        (void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(__print_buf), __print_buf);
+        (void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(__print_buf),
+                                    __print_buf);
         return;
-    } else {
-#ifndef CONFIG_USE_XEN_CONSOLE
-    if(!console_initialised)
-#endif    
-            (void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(__print_buf), __print_buf);
-        
-        console_print(NULL, __print_buf, strlen(__print_buf));
     }
+#ifndef CONFIG_USE_XEN_CONSOLE
+    if ( !console_initialised )
+#endif
+        (void)HYPERVISOR_console_io(CONSOLEIO_write, strlen(__print_buf),
+                                    __print_buf);
+
+    console_print(NULL, __print_buf, strlen(__print_buf));
 }
 
 void printk(const char *fmt, ...)
 {
-    va_list       args;
+    va_list args;
+
     va_start(args, fmt);
     print(0, fmt, args);
-    va_end(args);        
+    va_end(args);
 }
 
 void xprintk(const char *fmt, ...)
 {
-    va_list       args;
+    va_list args;
+
     va_start(args, fmt);
     print(1, fmt, args);
-    va_end(args);        
+    va_end(args);
 }
 void init_console(void)
-{   
+{
     printk("Initialising console ... ");
     xen_console = xencons_ring_init();
     console_initialised = 1;
@@ -186,7 +190,7 @@ DECLARE_WAIT_QUEUE_HEAD(console_queue);
 static struct xencons_interface *console_ring;
 uint32_t console_evtchn;
 
-static struct consfront_dev* resume_xen_console(struct consfront_dev* dev);
+static struct consfront_dev* resume_xen_console(struct consfront_dev *dev);
 
 #ifdef CONFIG_PARAVIRT
 void get_console(void *p)
@@ -201,11 +205,11 @@ void get_console(void *p)
 {
     uint64_t v = -1;
 
-    if (hvm_get_parameter(HVM_PARAM_CONSOLE_EVTCHN, &v))
+    if ( hvm_get_parameter(HVM_PARAM_CONSOLE_EVTCHN, &v) )
         BUG();
     console_evtchn = v;
 
-    if (hvm_get_parameter(HVM_PARAM_CONSOLE_PFN, &v))
+    if ( hvm_get_parameter(HVM_PARAM_CONSOLE_PFN, &v) )
         BUG();
     console_ring = (struct xencons_interface *)map_frame_virt(v);
 }
@@ -214,7 +218,7 @@ void get_console(void *p)
 static inline void notify_daemon(struct consfront_dev *dev)
 {
     /* Use evtchn: this is called early, before irq is set up. */
-    if (!dev)
+    if ( !dev )
         notify_remote_via_evtchn(console_evtchn);
     else
         notify_remote_via_evtchn(dev->evtchn);
@@ -223,36 +227,38 @@ static inline void notify_daemon(struct consfront_dev *dev)
 static inline struct xencons_interface *xencons_interface(void)
 {
     return console_evtchn ? console_ring : NULL;
-} 
- 
-int xencons_ring_send_no_notify(struct consfront_dev *dev, const char *data, unsigned len)
-{	
+}
+
+int xencons_ring_send_no_notify(struct consfront_dev *dev, const char *data,
+                                unsigned int len)
+{
     int sent = 0;
-	struct xencons_interface *intf;
-	XENCONS_RING_IDX cons, prod;
-
-	if (!dev)
-            intf = xencons_interface();
-        else
-            intf = dev->ring;
-        if (!intf)
-            return sent;
-
-	cons = intf->out_cons;
-	prod = intf->out_prod;
-	mb();
-	BUG_ON((prod - cons) > sizeof(intf->out));
-
-	while ((sent < len) && ((prod - cons) < sizeof(intf->out)))
-		intf->out[MASK_XENCONS_IDX(prod++, intf->out)] = data[sent++];
-
-	wmb();
-	intf->out_prod = prod;
-    
+    struct xencons_interface *intf;
+    XENCONS_RING_IDX cons, prod;
+
+    if ( !dev )
+        intf = xencons_interface();
+    else
+        intf = dev->ring;
+    if ( !intf )
+        return sent;
+
+    cons = intf->out_cons;
+    prod = intf->out_prod;
+    mb();
+    BUG_ON((prod - cons) > sizeof(intf->out));
+
+    while ( (sent < len) && ((prod - cons) < sizeof(intf->out)) )
+        intf->out[MASK_XENCONS_IDX(prod++, intf->out)] = data[sent++];
+
+    wmb();
+    intf->out_prod = prod;
+
     return sent;
 }
 
-int xencons_ring_send(struct consfront_dev *dev, const char *data, unsigned len)
+int xencons_ring_send(struct consfront_dev *dev, const char *data,
+                      unsigned int len)
 {
     int sent;
 
@@ -264,83 +270,85 @@ int xencons_ring_send(struct consfront_dev *dev, const char *data, unsigned len)
 
 void console_handle_input(evtchn_port_t port, struct pt_regs *regs, void *data)
 {
-	struct consfront_dev *dev = (struct consfront_dev *) data;
+    struct consfront_dev *dev = (struct consfront_dev *) data;
 #ifdef HAVE_LIBC
-        struct file *file = dev ? get_file_from_fd(dev->fd) : NULL;
+    struct file *file = dev ? get_file_from_fd(dev->fd) : NULL;
 
-        if ( file )
-            file->read = true;
+    if ( file )
+        file->read = true;
 
-        wake_up(&console_queue);
+    wake_up(&console_queue);
 #else
-	struct xencons_interface *intf = xencons_interface();
-	XENCONS_RING_IDX cons, prod;
+    struct xencons_interface *intf = xencons_interface();
+    XENCONS_RING_IDX cons, prod;
 
-	cons = intf->in_cons;
-	prod = intf->in_prod;
-	mb();
-	BUG_ON((prod - cons) > sizeof(intf->in));
+    cons = intf->in_cons;
+    prod = intf->in_prod;
+    mb();
+    BUG_ON((prod - cons) > sizeof(intf->in));
 
-	while (cons != prod) {
-		xencons_rx(intf->in+MASK_XENCONS_IDX(cons,intf->in), 1, regs);
-		cons++;
-	}
+    while ( cons != prod )
+    {
+        xencons_rx(intf->in + MASK_XENCONS_IDX(cons, intf->in), 1, regs);
+        cons++;
+    }
 
-	mb();
-	intf->in_cons = cons;
+    mb();
+    intf->in_cons = cons;
 
-	notify_daemon(dev);
+    notify_daemon(dev);
 
-	xencons_tx();
+    xencons_tx();
 #endif
 }
 
 #ifdef HAVE_LIBC
 int xencons_ring_avail(struct consfront_dev *dev)
 {
-	struct xencons_interface *intf;
-	XENCONS_RING_IDX cons, prod;
+    struct xencons_interface *intf;
+    XENCONS_RING_IDX cons, prod;
 
-        if (!dev)
-            intf = xencons_interface();
-        else
-            intf = dev->ring;
+    if ( !dev )
+        intf = xencons_interface();
+    else
+        intf = dev->ring;
 
-	cons = intf->in_cons;
-	prod = intf->in_prod;
-	mb();
-	BUG_ON((prod - cons) > sizeof(intf->in));
+    cons = intf->in_cons;
+    prod = intf->in_prod;
+    mb();
+    BUG_ON((prod - cons) > sizeof(intf->in));
 
-        return prod - cons;
+    return prod - cons;
 }
 
-int xencons_ring_recv(struct consfront_dev *dev, char *data, unsigned len)
+int xencons_ring_recv(struct consfront_dev *dev, char *data, unsigned int len)
 {
-	struct xencons_interface *intf;
-	XENCONS_RING_IDX cons, prod;
-        unsigned filled = 0;
+    struct xencons_interface *intf;
+    XENCONS_RING_IDX cons, prod;
+    unsigned int filled = 0;
 
-        if (!dev)
-            intf = xencons_interface();
-        else
-            intf = dev->ring;
+    if ( !dev )
+        intf = xencons_interface();
+    else
+        intf = dev->ring;
 
-	cons = intf->in_cons;
-	prod = intf->in_prod;
-	mb();
-	BUG_ON((prod - cons) > sizeof(intf->in));
+    cons = intf->in_cons;
+    prod = intf->in_prod;
+    mb();
+    BUG_ON((prod - cons) > sizeof(intf->in));
 
-        while (filled < len && cons + filled != prod) {
-                data[filled] = *(intf->in + MASK_XENCONS_IDX(cons + filled, intf->in));
-                filled++;
-	}
+    while ( filled < len && cons + filled != prod )
+    {
+        data[filled] = *(intf->in + MASK_XENCONS_IDX(cons + filled, intf->in));
+        filled++;
+    }
 
-	mb();
-        intf->in_cons = cons + filled;
+    mb();
+    intf->in_cons = cons + filled;
 
-	notify_daemon(dev);
+    notify_daemon(dev);
 
-        return filled;
+    return filled;
 }
 #endif
 
@@ -348,7 +356,7 @@ struct consfront_dev *xencons_ring_init(void)
 {
     struct consfront_dev *dev;
 
-    if (!console_evtchn)
+    if ( !console_evtchn )
         return 0;
 
     dev = malloc(sizeof(struct consfront_dev));
@@ -365,7 +373,7 @@ struct consfront_dev *xencons_ring_init(void)
     return resume_xen_console(dev);
 }
 
-static struct consfront_dev* resume_xen_console(struct consfront_dev* dev)
+static struct consfront_dev *resume_xen_console(struct consfront_dev *dev)
 {
     int err;
 
@@ -373,7 +381,8 @@ static struct consfront_dev* resume_xen_console(struct consfront_dev* dev)
     dev->ring = xencons_interface();
 
     err = bind_evtchn(dev->evtchn, console_handle_input, dev);
-    if (err <= 0) {
+    if ( err <= 0 )
+    {
         printk("XEN console request chn bind failed %i\n", err);
         free(dev);
         return NULL;
@@ -386,15 +395,16 @@ static struct consfront_dev* resume_xen_console(struct consfront_dev* dev)
     return dev;
 }
 
-void xencons_ring_fini(struct consfront_dev* dev)
+void xencons_ring_fini(struct consfront_dev *dev)
 {
-    if (dev)
+    if ( dev )
         mask_evtchn(dev->evtchn);
 }
 
-void xencons_ring_resume(struct consfront_dev* dev)
+void xencons_ring_resume(struct consfront_dev *dev)
 {
-    if (dev) {
+    if ( dev )
+    {
 #if CONFIG_PARAVIRT
         get_console(&start_info);
 #else
-- 
2.35.3


