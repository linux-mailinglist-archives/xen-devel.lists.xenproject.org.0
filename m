Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFC5511A4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 09:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352537.579394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzh-0004Jx-IV; Mon, 20 Jun 2022 07:38:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352537.579394; Mon, 20 Jun 2022 07:38:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o3Bzg-0004Ab-Sx; Mon, 20 Jun 2022 07:38:44 +0000
Received: by outflank-mailman (input) for mailman id 352537;
 Mon, 20 Jun 2022 07:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hycu=W3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o3Bze-0002ZD-CF
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 07:38:42 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc8da548-f06b-11ec-b725-ed86ccbb4733;
 Mon, 20 Jun 2022 09:38:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DD1BF1F965;
 Mon, 20 Jun 2022 07:38:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0F56134CA;
 Mon, 20 Jun 2022 07:38:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6IjTKfkjsGI3DAAAMHmgww
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
X-Inumbo-ID: fc8da548-f06b-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655710713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6bMt+f3pFpdaJuWe2kNv32ADnt11PKGb5MGFZlNFfI=;
	b=VNs992xF2rRY/4TMpQS+AdsE1pIJcmbTPoytwq4AOuNVmc26FTTOceKPDsUytjkrUUe5or
	xJCnyoidGJMJbREy2Sg6fuYDJKx2nYd5nER40PXa1lL3dItCmAAGwF60c79bNec8yLZAoD
	k0aoUd+Uj+aBwVu0esc/XZxdkxlsQiA=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 5/8] mini-os: apply coding style to consfront.c
Date: Mon, 20 Jun 2022 09:38:17 +0200
Message-Id: <20220620073820.9336-6-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220620073820.9336-1-jgross@suse.com>
References: <20220620073820.9336-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make consfront.c coding style compliant.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 consfront.c | 97 +++++++++++++++++++++++++++++------------------------
 1 file changed, 53 insertions(+), 44 deletions(-)

diff --git a/consfront.c b/consfront.c
index 73659656..dfe6a3f0 100644
--- a/consfront.c
+++ b/consfront.c
@@ -15,26 +15,30 @@
 
 void free_consfront(struct consfront_dev *dev)
 {
-    char* err = NULL;
+    char *err = NULL;
     XenbusState state;
-
     char path[strlen(dev->backend) + strlen("/state") + 1];
     char nodename[strlen(dev->nodename) + strlen("/state") + 1];
 
     snprintf(path, sizeof(path), "%s/state", dev->backend);
     snprintf(nodename, sizeof(nodename), "%s/state", dev->nodename);
 
-    if ((err = xenbus_switch_state(XBT_NIL, nodename, XenbusStateClosing)) != NULL) {
+    if ( (err = xenbus_switch_state(XBT_NIL, nodename, XenbusStateClosing)) !=
+         NULL )
+    {
         printk("free_consfront: error changing state to %d: %s\n",
                 XenbusStateClosing, err);
         goto close;
     }
+
     state = xenbus_read_integer(path);
-    while (err == NULL && state < XenbusStateClosing)
+    while ( err == NULL && state < XenbusStateClosing )
         err = xenbus_wait_for_state_change(path, &state, &dev->events);
     free(err);
 
-    if ((err = xenbus_switch_state(XBT_NIL, nodename, XenbusStateClosed)) != NULL) {
+    if ( (err = xenbus_switch_state(XBT_NIL, nodename, XenbusStateClosed)) !=
+         NULL)
+    {
         printk("free_consfront: error changing state to %d: %s\n",
                 XenbusStateClosed, err);
         goto close;
@@ -59,19 +63,22 @@ close:
 struct consfront_dev *init_consfront(char *_nodename)
 {
     xenbus_transaction_t xbt;
-    char* err = NULL;
-    char* message=NULL;
-    int retry=0;
-    char* msg = NULL;
+    char *err = NULL;
+    char *message = NULL;
+    int retry = 0;
+    char *msg = NULL;
     char nodename[256];
     char path[256];
+    XenbusState state;
     static int consfrontends = 3;
     struct consfront_dev *dev;
     int res;
 
-    if (!_nodename)
-        snprintf(nodename, sizeof(nodename), "device/console/%d", consfrontends);
-    else {
+    if ( !_nodename )
+        snprintf(nodename, sizeof(nodename), "device/console/%d",
+                 consfrontends);
+    else
+    {
         strncpy(nodename, _nodename, sizeof(nodename) - 1);
         nodename[sizeof(nodename) - 1] = 0;
     }
@@ -87,13 +94,13 @@ struct consfront_dev *init_consfront(char *_nodename)
 #endif
 
     snprintf(path, sizeof(path), "%s/backend-id", nodename);
-    if ((res = xenbus_read_integer(path)) < 0) 
+    if ( (res = xenbus_read_integer(path)) < 0 )
         goto error;
     else
         dev->dom = res;
     evtchn_alloc_unbound(dev->dom, console_handle_input, dev, &dev->evtchn);
 
-    dev->ring = (struct xencons_interface *) alloc_page();
+    dev->ring = (struct xencons_interface *)alloc_page();
     memset(dev->ring, 0, PAGE_SIZE);
     dev->ring_ref = gnttab_grant_access(dev->dom, virt_to_mfn(dev->ring), 0);
 
@@ -101,33 +108,36 @@ struct consfront_dev *init_consfront(char *_nodename)
 
 again:
     err = xenbus_transaction_start(&xbt);
-    if (err) {
+    if ( err )
+    {
         printk("starting transaction\n");
         free(err);
     }
 
-    err = xenbus_printf(xbt, nodename, "ring-ref","%u",
-                dev->ring_ref);
-    if (err) {
+    err = xenbus_printf(xbt, nodename, "ring-ref","%u", dev->ring_ref);
+    if ( err )
+    {
         message = "writing ring-ref";
         goto abort_transaction;
     }
-    err = xenbus_printf(xbt, nodename,
-                "port", "%u", dev->evtchn);
-    if (err) {
+    err = xenbus_printf(xbt, nodename, "port", "%u", dev->evtchn);
+    if ( err )
+    {
         message = "writing event-channel";
         goto abort_transaction;
     }
-    err = xenbus_printf(xbt, nodename,
-                "protocol", "%s", XEN_IO_PROTO_ABI_NATIVE);
-    if (err) {
+    err = xenbus_printf(xbt, nodename, "protocol", "%s",
+                        XEN_IO_PROTO_ABI_NATIVE);
+    if ( err )
+    {
         message = "writing protocol";
         goto abort_transaction;
     }
 
     snprintf(path, sizeof(path), "%s/state", nodename);
     err = xenbus_switch_state(xbt, path, XenbusStateConnected);
-    if (err) {
+    if ( err )
+    {
         message = "switching state";
         goto abort_transaction;
     }
@@ -135,8 +145,9 @@ again:
 
     err = xenbus_transaction_end(xbt, 0, &retry);
     free(err);
-    if (retry) {
-            goto again;
+    if ( retry )
+    {
+        goto again;
         printk("completing transaction\n");
     }
 
@@ -149,31 +160,28 @@ abort_transaction:
     goto error;
 
 done:
-
     snprintf(path, sizeof(path), "%s/backend", nodename);
     msg = xenbus_read(XBT_NIL, path, &dev->backend);
-    if (msg) {
+    if ( msg )
+    {
         printk("Error %s when reading the backend path %s\n", msg, path);
         goto error;
     }
 
     printk("backend at %s\n", dev->backend);
+    snprintf(path, sizeof(path), "%s/state", dev->backend);
+
+    free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
+    msg = NULL;
+    state = xenbus_read_integer(path);
+    while ( msg == NULL && state < XenbusStateConnected )
+        msg = xenbus_wait_for_state_change(path, &state, &dev->events);
 
+    if ( msg != NULL || state != XenbusStateConnected )
     {
-        XenbusState state;
-        char path[strlen(dev->backend) + strlen("/state") + 1];
-        snprintf(path, sizeof(path), "%s/state", dev->backend);
-        
-	free(xenbus_watch_path_token(XBT_NIL, path, path, &dev->events));
-        msg = NULL;
-        state = xenbus_read_integer(path);
-        while (msg == NULL && state < XenbusStateConnected)
-            msg = xenbus_wait_for_state_change(path, &state, &dev->events);
-        if (msg != NULL || state != XenbusStateConnected) {
-            printk("backend not available, state=%d\n", state);
-            err = xenbus_unwatch_path_token(XBT_NIL, path, path);
-            goto error;
-        }
+        printk("backend not available, state=%d\n", state);
+        err = xenbus_unwatch_path_token(XBT_NIL, path, path);
+        goto error;
     }
     unmask_evtchn(dev->evtchn);
 
@@ -190,7 +198,8 @@ error:
 
 void fini_consfront(struct consfront_dev *dev)
 {
-    if (dev) free_consfront(dev);
+    if ( dev )
+        free_consfront(dev);
 }
 
 #ifdef HAVE_LIBC
-- 
2.35.3


