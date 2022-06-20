Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC65511A3
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352538.579398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzi-0004S7-66; Mon, 20 Jun 2022 07:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352538.579398; Mon, 20 Jun 2022 07:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzh-0004K1-Mv; Mon, 20 Jun 2022 07:38:45 +0000
Received: by outflank-mailman (input) for mailman id 352538;
 Mon, 20 Jun 2022 07:38:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hycu=W3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3Bze-0002ZE-KT
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:38:42 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc822beb-f06b-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 09:38:34 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4217C21BC8;
 Mon, 20 Jun 2022 07:38:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 09A63134CA;
 Mon, 20 Jun 2022 07:38:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mPnvAPkjsGI3DAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Jun 2022 07:38:33 +0000
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
X-Inumbo-ID: fc822beb-f06b-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655710713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vgB6fTgQL43gcxc48HlbOD3FwW8e0Wc8cOsNTfGA2fM=;
	b=pFYN5R+LFVNfPmEVSqYvHvqQvriSnnGqsviLHmWLZN+qbOrSZmjz5jINkVb2suyJKZcFXs
	T5H17S/1T20lJ1HvSBtEMJLpaUw9kQpJ+694TjSPAMvGxs7+QMLRr6wWvX9FRJTLfon+eD
	i/XDrNOXTMWFH7sHC3hsj4X3ZoJ3p2o=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/8] mini-os: apply coding style to xenbus.c
Date: Mon, 20 Jun 2022 09:38:14 +0200
Message-Id: <20220620073820.9336-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>
References: <20220620073820.9336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make xenbus.c coding style compliant.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xenbus.c | 510 +++++++++++++++++++++++++++++++++----------------------
 1 file changed, 303 insertions(+), 207 deletions(-)

diff --git a/xenbus.c b/xenbus.c
index b687678f..aa1fe7bf 100644
--- a/xenbus.c
+++ b/xenbus.c
@@ -1,15 +1,15 @@
-/* 
+/*
  ****************************************************************************
  * (C) 2006 - Cambridge University
  ****************************************************************************
  *
  *        File: xenbus.c
- *      Author: Steven Smith (sos22@cam.ac.uk) 
+ *      Author: Steven Smith (sos22@cam.ac.uk)
  *     Changes: Grzegorz Milos (gm281@cam.ac.uk)
  *     Changes: John D. Ramsdell
- *              
+ *
  *        Date: Jun 2006, chages Aug 2005
- * 
+ *
  * Environment: Xen Minimal OS
  * Description: Minimal implementation of xenbus
  *
@@ -32,10 +32,10 @@
 #include <mini-os/semaphore.h>
 
 #define min(x,y) ({                       \
-        typeof(x) tmpx = (x);                 \
-        typeof(y) tmpy = (y);                 \
-        tmpx < tmpy ? tmpx : tmpy;            \
-        })
+    typeof(x) tmpx = (x);                 \
+    typeof(y) tmpy = (y);                 \
+    tmpx < tmpy ? tmpx : tmpy;            \
+    })
 
 #ifdef XENBUS_DEBUG
 #define DEBUG(_f, _a...) \
@@ -56,7 +56,8 @@ static struct watch {
     xenbus_event_queue *events;
     struct watch *next;
 } *watches;
-struct xenbus_req_info 
+
+struct xenbus_req_info
 {
     int in_use:1;
     struct wait_queue_head waitq;
@@ -93,14 +94,12 @@ void get_xenbus(void *p)
 }
 #endif
 
-static void memcpy_from_ring(const void *Ring,
-        void *Dest,
-        int off,
-        int len)
+static void memcpy_from_ring(const void *Ring, void *Dest, int off, int len)
 {
     int c1, c2;
     const char *ring = Ring;
     char *dest = Dest;
+
     c1 = min(len, XENSTORE_RING_SIZE - off);
     c2 = len - c1;
     memcpy(dest, ring + off, c1);
@@ -111,24 +110,28 @@ char **xenbus_wait_for_watch_return(xenbus_event_queue *queue)
 {
     struct xenbus_event *event;
     DEFINE_WAIT(w);
-    if (!queue)
+
+    if ( !queue )
         queue = &xenbus_events;
-    while (!(event = *queue)) {
+    while ( !(event = *queue) )
+    {
         add_waiter(w, xenbus_watch_queue);
         schedule();
     }
     remove_waiter(w, xenbus_watch_queue);
     *queue = event->next;
+
     return &event->path;
 }
 
 void xenbus_wait_for_watch(xenbus_event_queue *queue)
 {
     char **ret;
-    if (!queue)
+
+    if ( !queue )
         queue = &xenbus_events;
     ret = xenbus_wait_for_watch_return(queue);
-    if (ret)
+    if ( ret )
         free(ret);
     else
         printk("unexpected path returned by watch\n");
@@ -137,33 +140,39 @@ void xenbus_wait_for_watch(xenbus_event_queue *queue)
 void xenbus_release_wait_for_watch(xenbus_event_queue *queue)
 {
     struct xenbus_event *event = malloc(sizeof(*event));
+
     event->next = *queue;
     *queue = event;
     wake_up(&xenbus_watch_queue);
 }
 
-char* xenbus_wait_for_value(const char* path, const char* value, xenbus_event_queue *queue)
+char *xenbus_wait_for_value(const char *path, const char *value,
+                            xenbus_event_queue *queue)
 {
-    if (!queue)
+    if ( !queue )
         queue = &xenbus_events;
-    for(;;)
+
+    for( ;; )
     {
         char *res, *msg;
         int r;
 
         msg = xenbus_read(XBT_NIL, path, &res);
-        if(msg) return msg;
+        if ( msg )
+            return msg;
 
         r = strcmp(value,res);
         free(res);
 
-        if(r==0) break;
-        else xenbus_wait_for_watch(queue);
+        if ( r==0 )
+            return NULL;
+
+        xenbus_wait_for_watch(queue);
     }
-    return NULL;
 }
 
-char *xenbus_switch_state(xenbus_transaction_t xbt, const char* path, XenbusState state)
+char *xenbus_switch_state(xenbus_transaction_t xbt, const char *path,
+                          XenbusState state)
 {
     char *current_state;
     char *msg = NULL;
@@ -174,18 +183,22 @@ char *xenbus_switch_state(xenbus_transaction_t xbt, const char* path, XenbusStat
     int retry = 0;
 
     do {
-        if (xbt == XBT_NIL) {
+        if ( xbt == XBT_NIL )
+        {
             msg = xenbus_transaction_start(&xbt);
-            if (msg) goto exit;
+            if ( msg )
+                goto exit;
             xbt_flag = 1;
         }
 
         msg = xenbus_read(xbt, path, &current_state);
-        if (msg) goto exit;
+        if ( msg )
+            goto exit;
 
         rs = (XenbusState) (current_state[0] - '0');
         free(current_state);
-        if (rs == state) {
+        if ( rs == state )
+        {
             msg = NULL;
             goto exit;
         }
@@ -194,37 +207,42 @@ char *xenbus_switch_state(xenbus_transaction_t xbt, const char* path, XenbusStat
         msg = xenbus_write(xbt, path, value);
 
 exit:
-        if (xbt_flag) {
+        if ( xbt_flag )
+        {
             msg2 = xenbus_transaction_end(xbt, 0, &retry);
             xbt = XBT_NIL;
         }
-        if (msg == NULL && msg2 != NULL)
+        if ( msg == NULL && msg2 != NULL )
             msg = msg2;
         else
             free(msg2);
-    } while (retry);
+    } while ( retry );
 
     return msg;
 }
 
-char *xenbus_wait_for_state_change(const char* path, XenbusState *state, xenbus_event_queue *queue)
+char *xenbus_wait_for_state_change(const char *path, XenbusState *state,
+                                   xenbus_event_queue *queue)
 {
-    if (!queue)
+    if ( !queue )
         queue = &xenbus_events;
-    for(;;)
+
+    for( ;; )
     {
         char *res, *msg;
         XenbusState rs;
 
         msg = xenbus_read(XBT_NIL, path, &res);
-        if(msg) return msg;
+        if ( msg )
+            return msg;
 
-        rs = (XenbusState) (res[0] - 48);
+        rs = (XenbusState)(res[0] - 48);
         free(res);
 
-        if (rs == *state)
+        if ( rs == *state )
             xenbus_wait_for_watch(queue);
-        else {
+        else
+        {
             *state = rs;
             break;
         }
@@ -232,14 +250,13 @@ char *xenbus_wait_for_state_change(const char* path, XenbusState *state, xenbus_
     return NULL;
 }
 
-
 static void xenbus_read_data(char *buf, unsigned int len)
 {
     unsigned int off = 0;
     unsigned int prod, cons;
     unsigned int size;
 
-    while (off != len)
+    while ( off != len )
     {
         wait_event(xb_waitq, xenstore_buf->rsp_prod != xenstore_buf->rsp_cons);
 
@@ -255,7 +272,7 @@ static void xenbus_read_data(char *buf, unsigned int len)
         mb();    /* memcpy() and rsp_cons update must not be reordered. */
         xenstore_buf->rsp_cons += size;
         mb();    /* rsp_cons must be visible before we look at rsp_prod. */
-        if (xenstore_buf->rsp_prod - cons >= XENSTORE_RING_SIZE)
+        if ( xenstore_buf->rsp_prod - cons >= XENSTORE_RING_SIZE )
             notify_remote_via_evtchn(xenbus_evtchn);
     }
 }
@@ -265,30 +282,35 @@ static void xenbus_thread_func(void *ign)
     struct xsd_sockmsg msg;
     char *data;
 
-    for (;;) {
+    for ( ;; )
+    {
         xenbus_read_data((char *)&msg, sizeof(msg));
         DEBUG("Msg len %d, %d avail, id %d.\n", msg.len + sizeof(msg),
               xenstore_buf->rsp_prod - xenstore_buf->rsp_cons, msg.req_id);
 
-        if (msg.len > XENSTORE_PAYLOAD_MAX) {
+        if ( msg.len > XENSTORE_PAYLOAD_MAX )
+        {
             printk("Xenstore violates protocol, message longer than allowed.\n");
             return;
         }
 
-        if (msg.type == XS_WATCH_EVENT) {
+        if ( msg.type == XS_WATCH_EVENT )
+        {
             struct xenbus_event *event = malloc(sizeof(*event) + msg.len);
             xenbus_event_queue *events = NULL;
             struct watch *watch;
             char *c;
             int zeroes = 0;
 
-            data = (char*)event + sizeof(*event);
+            data = (char *)event + sizeof(*event);
             xenbus_read_data(data, msg.len);
 
-            for (c = data; c < data + msg.len; c++)
-                if (!*c)
+            for ( c = data; c < data + msg.len; c++ )
+                if ( !*c )
                     zeroes++;
-            if (zeroes != 2) {
+
+            if ( zeroes != 2 )
+            {
                 printk("Xenstore: illegal watch event data\n");
                 free(event);
                 continue;
@@ -297,17 +319,21 @@ static void xenbus_thread_func(void *ign)
             event->path = data;
             event->token = event->path + strlen(event->path) + 1;
 
-            for (watch = watches; watch; watch = watch->next)
-                if (!strcmp(watch->token, event->token)) {
+            for ( watch = watches; watch; watch = watch->next )
+                if ( !strcmp(watch->token, event->token) )
+                {
                     events = watch->events;
                     break;
                 }
 
-            if (events) {
+            if ( events )
+            {
                 event->next = *events;
                 *events = event;
                 wake_up(&xenbus_watch_queue);
-            } else {
+            }
+            else
+            {
                 printk("Xenstore: unexpected watch token %s\n", event->token);
                 free(event);
             }
@@ -319,7 +345,8 @@ static void xenbus_thread_func(void *ign)
         memcpy(data, &msg, sizeof(msg));
         xenbus_read_data(data + sizeof(msg), msg.len);
 
-        if (msg.req_id >= NR_REQS || !req_info[msg.req_id].in_use) {
+        if ( msg.req_id >= NR_REQS || !req_info[msg.req_id].in_use )
+        {
             printk("Xenstore: illegal request id %d\n", msg.req_id);
             free(data);
             continue;
@@ -334,7 +361,7 @@ static void xenbus_thread_func(void *ign)
 }
 
 static void xenbus_evtchn_handler(evtchn_port_t port, struct pt_regs *regs,
-				  void *ign)
+                                  void *ign)
 {
     wake_up(&xb_waitq);
 }
@@ -347,12 +374,15 @@ static DECLARE_WAIT_QUEUE_HEAD(req_wq);
 static void release_xenbus_id(int id)
 {
     BUG_ON(!req_info[id].in_use);
+
     spin_lock(&req_lock);
+
     req_info[id].in_use = 0;
     nr_live_reqs--;
     req_info[id].in_use = 0;
-    if (nr_live_reqs == 0 || nr_live_reqs == NR_REQS - 1)
+    if ( nr_live_reqs == 0 || nr_live_reqs == NR_REQS - 1 )
         wake_up(&req_wq);
+
     spin_unlock(&req_lock);
 }
 
@@ -363,27 +393,27 @@ static int allocate_xenbus_id(void)
     static int probe;
     int o_probe;
 
-    while (1) 
+    while ( 1 )
     {
         spin_lock(&req_lock);
-        if (nr_live_reqs < NR_REQS)
+        if ( nr_live_reqs < NR_REQS )
             break;
         spin_unlock(&req_lock);
-        wait_event(req_wq, (nr_live_reqs < NR_REQS));
+        wait_event(req_wq, nr_live_reqs < NR_REQS);
     }
 
     o_probe = probe;
-    for (;;) 
+    while ( req_info[o_probe].in_use )
     {
-        if (!req_info[o_probe].in_use)
-            break;
         o_probe = (o_probe + 1) % NR_REQS;
         BUG_ON(o_probe == probe);
     }
     nr_live_reqs++;
     req_info[o_probe].in_use = 1;
     probe = (o_probe + 1) % NR_REQS;
+
     spin_unlock(&req_lock);
+
     init_waitqueue_head(&req_info[o_probe].waitq);
 
     return o_probe;
@@ -393,6 +423,7 @@ static int allocate_xenbus_id(void)
 void init_xenbus(void)
 {
     int err;
+
     DEBUG("init_xenbus called.\n");
     create_thread("xenstore", xenbus_thread_func, NULL);
     DEBUG("buf at %p.\n", xenstore_buf);
@@ -408,13 +439,13 @@ void fini_xenbus(void)
 void suspend_xenbus(void)
 {
     /* Check for live requests and wait until they finish */
-    while (1)
+    while ( 1 )
     {
         spin_lock(&req_lock);
-        if (nr_live_reqs == 0)
+        if ( nr_live_reqs == 0 )
             break;
         spin_unlock(&req_lock);
-        wait_event(req_wq, (nr_live_reqs == 0));
+        wait_event(req_wq, nr_live_reqs == 0);
     }
 
     mask_evtchn(xenbus_evtchn);
@@ -436,8 +467,10 @@ void resume_xenbus(int canceled)
 #endif
     unmask_evtchn(xenbus_evtchn);
 
-    if (!canceled) {
-        for (watch = watches; watch; watch = watch->next) {
+    if ( !canceled )
+    {
+        for ( watch = watches; watch; watch = watch->next )
+        {
             req[0].data = watch->path;
             req[0].len = strlen(watch->path) + 1;
             req[1].data = watch->token;
@@ -445,10 +478,12 @@ void resume_xenbus(int canceled)
 
             rep = xenbus_msg_reply(XS_WATCH, XBT_NIL, req, ARRAY_SIZE(req));
             msg = errmsg(rep);
-            if (msg) {
+            if ( msg )
+            {
                 xprintk("error on XS_WATCH: %s\n", msg);
                 free(msg);
-            } else
+            }
+            else
                 free(rep);
         }
     }
@@ -456,12 +491,14 @@ void resume_xenbus(int canceled)
     notify_remote_via_evtchn(xenbus_evtchn);
 }
 
-/* Send data to xenbus.  This can block.  All of the requests are seen
-   by xenbus as if sent atomically.  The header is added
-   automatically, using type %type, req_id %req_id, and trans_id
-   %trans_id. */
+/*
+ * Send data to xenbus.  This can block.  All of the requests are seen
+ * by xenbus as if sent atomically.  The header is added
+ * automatically, using type %type, req_id %req_id, and trans_id
+ * %trans_id.
+ */
 static void xb_write(int type, int req_id, xenbus_transaction_t trans_id,
-		     const struct write_req *req, int nr_reqs)
+                     const struct write_req *req, int nr_reqs)
 {
     XENSTORE_RING_IDX prod;
     int r;
@@ -470,12 +507,12 @@ static void xb_write(int type, int req_id, xenbus_transaction_t trans_id,
     int req_off;
     int total_off;
     int this_chunk;
-    struct xsd_sockmsg m = {.type = type, .req_id = req_id,
-        .tx_id = trans_id };
+    struct xsd_sockmsg m = {.type = type, .req_id = req_id, .tx_id = trans_id };
     struct write_req header_req = { &m, sizeof(m) };
 
-    for (r = 0; r < nr_reqs; r++)
+    for ( r = 0; r < nr_reqs; r++ )
         len += req[r].len;
+
     m.len = len;
     len += sizeof(m);
 
@@ -489,10 +526,10 @@ static void xb_write(int type, int req_id, xenbus_transaction_t trans_id,
     /* Send the message in chunks using free ring space when available. */
     total_off = 0;
     req_off = 0;
-    while (total_off < len)
+    while ( total_off < len )
     {
         prod = xenstore_buf->req_prod;
-        if (prod - xenstore_buf->req_cons >= XENSTORE_RING_SIZE)
+        if ( prod - xenstore_buf->req_cons >= XENSTORE_RING_SIZE )
         {
             /* Send evtchn to notify remote */
             notify_remote_via_evtchn(xenbus_evtchn);
@@ -514,10 +551,10 @@ static void xb_write(int type, int req_id, xenbus_transaction_t trans_id,
         prod += this_chunk;
         req_off += this_chunk;
         total_off += this_chunk;
-        if (req_off == cur_req->len)
+        if ( req_off == cur_req->len )
         {
             req_off = 0;
-            if (cur_req == &header_req)
+            if ( cur_req == &header_req )
                 cur_req = req;
             else
                 cur_req++;
@@ -538,14 +575,13 @@ static void xb_write(int type, int req_id, xenbus_transaction_t trans_id,
     up(&xb_write_sem);
 }
 
-/* Send a mesasge to xenbus, in the same fashion as xb_write, and
-   block waiting for a reply.  The reply is malloced and should be
-   freed by the caller. */
-struct xsd_sockmsg *
-xenbus_msg_reply(int type,
-		 xenbus_transaction_t trans,
-		 struct write_req *io,
-		 int nr_reqs)
+/*
+ * Send a mesasge to xenbus, in the same fashion as xb_write, and
+ * block waiting for a reply.  The reply is malloced and should be
+ * freed by the caller.
+ */
+struct xsd_sockmsg *xenbus_msg_reply(int type, xenbus_transaction_t trans,
+                                     struct write_req *io, int nr_reqs)
 {
     int id;
     DEFINE_WAIT(w);
@@ -563,29 +599,36 @@ xenbus_msg_reply(int type,
     rep = req_info[id].reply;
     BUG_ON(rep->req_id != id);
     release_xenbus_id(id);
+
     return rep;
 }
 
 static char *errmsg(struct xsd_sockmsg *rep)
 {
     char *res;
-    if (!rep) {
-	char msg[] = "No reply";
-	size_t len = strlen(msg) + 1;
-	return memcpy(malloc(len), msg, len);
+
+    if ( !rep )
+    {
+        char msg[] = "No reply";
+        size_t len = strlen(msg) + 1;
+        return memcpy(malloc(len), msg, len);
     }
-    if (rep->type != XS_ERROR)
-	return NULL;
+    if ( rep->type != XS_ERROR )
+        return NULL;
+
     res = malloc(rep->len + 1);
     memcpy(res, rep + 1, rep->len);
     res[rep->len] = 0;
     free(rep);
+
     return res;
 }
 
-/* List the contents of a directory.  Returns a malloc()ed array of
-   pointers to malloc()ed strings.  The array is NULL terminated.  May
-   block. */
+/*
+ * List the contents of a directory.  Returns a malloc()ed array of
+ * pointers to malloc()ed strings.  The array is NULL terminated.  May
+ * block.
+ */
 char *xenbus_ls(xenbus_transaction_t xbt, const char *pre, char ***contents)
 {
     struct xsd_sockmsg *reply, *repmsg;
@@ -595,23 +638,30 @@ char *xenbus_ls(xenbus_transaction_t xbt, const char *pre, char ***contents)
 
     repmsg = xenbus_msg_reply(XS_DIRECTORY, xbt, req, ARRAY_SIZE(req));
     msg = errmsg(repmsg);
-    if (msg) {
-	*contents = NULL;
-	return msg;
+    if ( msg )
+    {
+        *contents = NULL;
+        return msg;
     }
+
     reply = repmsg + 1;
-    for (x = nr_elems = 0; x < repmsg->len; x++)
+    for ( x = nr_elems = 0; x < repmsg->len; x++ )
         nr_elems += (((char *)reply)[x] == 0);
+
     res = malloc(sizeof(res[0]) * (nr_elems + 1));
-    for (x = i = 0; i < nr_elems; i++) {
+    for ( x = i = 0; i < nr_elems; i++ )
+    {
         int l = strlen((char *)reply + x);
+
         res[i] = malloc(l + 1);
         memcpy(res[i], (char *)reply + x, l + 1);
         x += l + 1;
     }
+
     res[i] = NULL;
     free(repmsg);
     *contents = res;
+
     return NULL;
 }
 
@@ -620,49 +670,56 @@ char *xenbus_read(xenbus_transaction_t xbt, const char *path, char **value)
     struct write_req req[] = { {path, strlen(path) + 1} };
     struct xsd_sockmsg *rep;
     char *res, *msg;
+
     rep = xenbus_msg_reply(XS_READ, xbt, req, ARRAY_SIZE(req));
     msg = errmsg(rep);
-    if (msg) {
-	*value = NULL;
-	return msg;
+    if ( msg )
+    {
+        *value = NULL;
+        return msg;
     }
+
     res = malloc(rep->len + 1);
     memcpy(res, rep + 1, rep->len);
     res[rep->len] = 0;
     free(rep);
     *value = res;
+
     return NULL;
 }
 
-char *xenbus_write(xenbus_transaction_t xbt, const char *path, const char *value)
+char *xenbus_write(xenbus_transaction_t xbt, const char *path,
+                   const char *value)
 {
-    struct write_req req[] = { 
-	{path, strlen(path) + 1},
-	{value, strlen(value)},
+    struct write_req req[] = {
+        {path, strlen(path) + 1},
+        {value, strlen(value)},
     };
     struct xsd_sockmsg *rep;
     char *msg;
+
     rep = xenbus_msg_reply(XS_WRITE, xbt, req, ARRAY_SIZE(req));
     msg = errmsg(rep);
-    if (msg) return msg;
+    if ( msg )
+        return msg;
+
     free(rep);
+
     return NULL;
 }
 
-char* xenbus_watch_path_token( xenbus_transaction_t xbt, const char *path, const char *token, xenbus_event_queue *events)
+char* xenbus_watch_path_token(xenbus_transaction_t xbt, const char *path,
+                              const char *token, xenbus_event_queue *events)
 {
     struct xsd_sockmsg *rep;
-
-    struct write_req req[] = { 
+    struct write_req req[] = {
         {path, strlen(path) + 1},
-	{token, strlen(token) + 1},
+        {token, strlen(token) + 1},
     };
-
     struct watch *watch = malloc(sizeof(*watch));
-
     char *msg;
 
-    if (!events)
+    if ( !events )
         events = &xenbus_events;
 
     watch->token = strdup(token);
@@ -674,33 +731,37 @@ char* xenbus_watch_path_token( xenbus_transaction_t xbt, const char *path, const
     rep = xenbus_msg_reply(XS_WATCH, xbt, req, ARRAY_SIZE(req));
 
     msg = errmsg(rep);
-    if (msg) return msg;
+    if ( msg )
+        return msg;
+
     free(rep);
 
     return NULL;
 }
 
-char* xenbus_unwatch_path_token( xenbus_transaction_t xbt, const char *path, const char *token)
+char* xenbus_unwatch_path_token(xenbus_transaction_t xbt, const char *path,
+                                const char *token)
 {
     struct xsd_sockmsg *rep;
-
-    struct write_req req[] = { 
+    struct write_req req[] = {
         {path, strlen(path) + 1},
-	{token, strlen(token) + 1},
+        {token, strlen(token) + 1},
     };
-
     struct watch *watch, **prev;
-
     char *msg;
 
     rep = xenbus_msg_reply(XS_UNWATCH, xbt, req, ARRAY_SIZE(req));
 
     msg = errmsg(rep);
-    if (msg) return msg;
+    if ( msg )
+        return msg;
+
     free(rep);
 
-    for (prev = &watches, watch = *prev; watch; prev = &watch->next, watch = *prev)
-        if (!strcmp(watch->token, token)) {
+    for ( prev = &watches, watch = *prev; watch;
+          prev = &watch->next, watch = *prev)
+        if ( !strcmp(watch->token, token) )
+        {
             free(watch->token);
             free(watch->path);
             *prev = watch->next;
@@ -716,11 +777,14 @@ char *xenbus_rm(xenbus_transaction_t xbt, const char *path)
     struct write_req req[] = { {path, strlen(path) + 1} };
     struct xsd_sockmsg *rep;
     char *msg;
+
     rep = xenbus_msg_reply(XS_RM, xbt, req, ARRAY_SIZE(req));
     msg = errmsg(rep);
-    if (msg)
-	return msg;
+    if ( msg )
+        return msg;
+
     free(rep);
+
     return NULL;
 }
 
@@ -729,59 +793,70 @@ char *xenbus_get_perms(xenbus_transaction_t xbt, const char *path, char **value)
     struct write_req req[] = { {path, strlen(path) + 1} };
     struct xsd_sockmsg *rep;
     char *res, *msg;
+
     rep = xenbus_msg_reply(XS_GET_PERMS, xbt, req, ARRAY_SIZE(req));
     msg = errmsg(rep);
-    if (msg) {
-	*value = NULL;
-	return msg;
+    if ( msg )
+    {
+        *value = NULL;
+        return msg;
     }
+
     res = malloc(rep->len + 1);
     memcpy(res, rep + 1, rep->len);
     res[rep->len] = 0;
     free(rep);
     *value = res;
+
     return NULL;
 }
 
 #define PERM_MAX_SIZE 32
-char *xenbus_set_perms(xenbus_transaction_t xbt, const char *path, domid_t dom, char perm)
+char *xenbus_set_perms(xenbus_transaction_t xbt, const char *path, domid_t dom,
+                       char perm)
 {
     char value[PERM_MAX_SIZE];
-    struct write_req req[] = { 
-	{path, strlen(path) + 1},
-	{value, 0},
+    struct write_req req[] = {
+        {path, strlen(path) + 1},
+        {value, 0},
     };
     struct xsd_sockmsg *rep;
     char *msg;
+
     snprintf(value, PERM_MAX_SIZE, "%c%hu", perm, dom);
     req[1].len = strlen(value) + 1;
     rep = xenbus_msg_reply(XS_SET_PERMS, xbt, req, ARRAY_SIZE(req));
     msg = errmsg(rep);
-    if (msg)
-	return msg;
+    if ( msg )
+        return msg;
+
     free(rep);
+
     return NULL;
 }
 
 char *xenbus_transaction_start(xenbus_transaction_t *xbt)
 {
-    /* xenstored becomes angry if you send a length 0 message, so just
-       shove a nul terminator on the end */
+    /*
+     * xenstored becomes angry if you send a length 0 message, so just
+     * shove a nul terminator on the end
+     */
     struct write_req req = { "", 1};
     struct xsd_sockmsg *rep;
     char *err;
 
     rep = xenbus_msg_reply(XS_TRANSACTION_START, 0, &req, 1);
     err = errmsg(rep);
-    if (err)
-	return err;
+    if ( err )
+        return err;
+
     sscanf((char *)(rep + 1), "%lu", xbt);
     free(rep);
+
     return NULL;
 }
 
-char *
-xenbus_transaction_end(xenbus_transaction_t t, int abort, int *retry)
+char *xenbus_transaction_end(xenbus_transaction_t t, int abort, int *retry)
 {
     struct xsd_sockmsg *rep;
     struct write_req req;
@@ -793,16 +868,19 @@ xenbus_transaction_end(xenbus_transaction_t t, int abort, int *retry)
     req.len = 2;
     rep = xenbus_msg_reply(XS_TRANSACTION_END, t, &req, 1);
     err = errmsg(rep);
-    if (err) {
-	if (!strcmp(err, "EAGAIN")) {
-	    *retry = 1;
-	    free(err);
-	    return NULL;
-	} else {
-	    return err;
-	}
+    if ( err )
+    {
+        if ( !strcmp(err, "EAGAIN") )
+        {
+            *retry = 1;
+            free(err);
+            return NULL;
+        }
+        else
+            return err;
     }
     free(rep);
+
     return NULL;
 }
 
@@ -812,46 +890,54 @@ int xenbus_read_integer(const char *path)
     int t;
 
     res = xenbus_read(XBT_NIL, path, &buf);
-    if (res) {
-	printk("Failed to read %s.\n", path);
-	free(res);
-	return -1;
+    if ( res )
+    {
+        printk("Failed to read %s.\n", path);
+        free(res);
+        return -1;
     }
+
     sscanf(buf, "%d", &t);
     free(buf);
+
     return t;
 }
 
-int xenbus_read_uuid(const char* path, unsigned char uuid[16]) {
-   char * res, *buf;
-   res = xenbus_read(XBT_NIL, path, &buf);
-   if(res) {
-      printk("Failed to read %s.\n", path);
-      free(res);
-      return 0;
-   }
-   if(strlen(buf) != ((2*16)+4) /* 16 hex bytes and 4 hyphens */
-         || sscanf(buf,
-            "%2hhx%2hhx%2hhx%2hhx-"
-            "%2hhx%2hhx-"
-            "%2hhx%2hhx-"
-            "%2hhx%2hhx-"
-            "%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx",
-            uuid, uuid + 1, uuid + 2, uuid + 3,
-            uuid + 4, uuid + 5, uuid + 6, uuid + 7,
-            uuid + 8, uuid + 9, uuid + 10, uuid + 11,
-            uuid + 12, uuid + 13, uuid + 14, uuid + 15) != 16) {
-      printk("Xenbus path %s value %s is not a uuid!\n", path, buf);
-      free(buf);
-      return 0;
-   }
-   free(buf);
-   return 1;
-}
-
-char* xenbus_printf(xenbus_transaction_t xbt,
-                                  const char* node, const char* path,
-                                  const char* fmt, ...)
+int xenbus_read_uuid(const char *path, unsigned char uuid[16])
+{
+    char *res, *buf;
+
+    res = xenbus_read(XBT_NIL, path, &buf);
+    if ( res )
+    {
+       printk("Failed to read %s.\n", path);
+       free(res);
+       return 0;
+    }
+
+    if ( strlen(buf) != ((2 * 16) + 4) /* 16 hex bytes and 4 hyphens */ ||
+         sscanf(buf, "%2hhx%2hhx%2hhx%2hhx-"
+                     "%2hhx%2hhx-"
+                     "%2hhx%2hhx-"
+                     "%2hhx%2hhx-"
+                     "%2hhx%2hhx%2hhx%2hhx%2hhx%2hhx",
+                uuid, uuid + 1, uuid + 2, uuid + 3,
+                uuid + 4, uuid + 5, uuid + 6, uuid + 7,
+                uuid + 8, uuid + 9, uuid + 10, uuid + 11,
+                uuid + 12, uuid + 13, uuid + 14, uuid + 15) != 16)
+    {
+        printk("Xenbus path %s value %s is not a uuid!\n", path, buf);
+        free(buf);
+        return 0;
+    }
+
+    free(buf);
+
+    return 1;
+}
+
+char *xenbus_printf(xenbus_transaction_t xbt, const char* node,
+                    const char* path, const char* fmt, ...)
 {
 #define BUFFER_SIZE 256
     char fullpath[BUFFER_SIZE];
@@ -863,6 +949,7 @@ char* xenbus_printf(xenbus_transaction_t xbt,
     va_start(args, fmt);
     vsprintf(val, fmt, args);
     va_end(args);
+
     return xenbus_write(xbt,fullpath,val);
 }
 
@@ -890,7 +977,7 @@ static void xenbus_debug_msg(const char *msg)
 
     reply = xenbus_msg_reply(XS_DEBUG, 0, req, ARRAY_SIZE(req));
     printk("Got a reply, type %d, id %d, len %d.\n",
-            reply->type, reply->req_id, reply->len);
+           reply->type, reply->req_id, reply->len);
 }
 
 static void do_ls_test(const char *pre)
@@ -900,28 +987,33 @@ static void do_ls_test(const char *pre)
 
     printk("ls %s...\n", pre);
     msg = xenbus_ls(XBT_NIL, pre, &dirs);
-    if (msg) {
-	printk("Error in xenbus ls: %s\n", msg);
-	free(msg);
-	return;
+    if ( msg )
+    {
+        printk("Error in xenbus ls: %s\n", msg);
+        free(msg);
+        return;
     }
-    for (x = 0; dirs[x]; x++) 
+
+    for ( x = 0; dirs[x]; x++ )
     {
         printk("ls %s[%d] -> %s\n", pre, x, dirs[x]);
         free(dirs[x]);
     }
+
     free(dirs);
 }
 
 static void do_read_test(const char *path)
 {
     char *res, *msg;
+
     printk("Read %s...\n", path);
     msg = xenbus_read(XBT_NIL, path, &res);
-    if (msg) {
-	printk("Error in xenbus read: %s\n", msg);
-	free(msg);
-	return;
+    if ( msg )
+    {
+        printk("Error in xenbus read: %s\n", msg);
+        free(msg);
+        return;
     }
     printk("Read %s -> %s.\n", path, res);
     free(res);
@@ -930,27 +1022,31 @@ static void do_read_test(const char *path)
 static void do_write_test(const char *path, const char *val)
 {
     char *msg;
+
     printk("Write %s to %s...\n", val, path);
     msg = xenbus_write(XBT_NIL, path, val);
-    if (msg) {
-	printk("Result %s\n", msg);
-	free(msg);
-    } else {
-	printk("Success.\n");
+    if ( msg )
+    {
+        printk("Result %s\n", msg);
+        free(msg);
     }
+    else
+        printk("Success.\n");
 }
 
 static void do_rm_test(const char *path)
 {
     char *msg;
+
     printk("rm %s...\n", path);
     msg = xenbus_rm(XBT_NIL, path);
-    if (msg) {
-	printk("Result %s\n", msg);
-	free(msg);
-    } else {
-	printk("Success.\n");
+    if ( msg )
+    {
+        printk("Result %s\n", msg);
+        free(msg);
     }
+    else
+        printk("Success.\n");
 }
 
 /* Simple testing thing */
-- 
2.35.3


