Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66273526C42
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 23:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328857.552021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npchM-0003GI-GU; Fri, 13 May 2022 21:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328857.552021; Fri, 13 May 2022 21:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npchM-0003E5-Cw; Fri, 13 May 2022 21:19:44 +0000
Received: by outflank-mailman (input) for mailman id 328857;
 Fri, 13 May 2022 21:19:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npchK-0002hA-VF
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 21:19:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66e8a839-d302-11ec-b8b8-f95467ff1ed0;
 Fri, 13 May 2022 23:19:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA6A061F5C;
 Fri, 13 May 2022 21:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCFE4C34100;
 Fri, 13 May 2022 21:19:39 +0000 (UTC)
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
X-Inumbo-ID: 66e8a839-d302-11ec-b8b8-f95467ff1ed0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652476780;
	bh=1seN4daKntnM5guSKJ74plZIHGGLz1D4C2nyHZd8PjU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PyX6D3o+LcpMEojSPU6QoJvVWNdFER/RInuyzYrME0iuwcfoHomkF4rgUh39/EBz0
	 yh35ljGKyg8E+PRKhsBjMTCKaEMiIy+f7Yaq690OMbJlEbYiJ7tIiAYPxwWbd1CGow
	 zwbPXMY1k6z+8zZ7Q1hqwUoZP0wpXdKJr8g7lhFj1DzpJp4eKYcN+1GzHskwmOJm1a
	 dUF+l73LJRxF9IbjSs2yCsvNFhlWjMArLq0fpuqKxxzA6KiWaCtT0J5soYIvVuIB8h
	 q29xlpsEKKuRGNIgSaODizJ0kxB1EKd4IVVYcJPvajUmxZKzojjuf9NxTiOn1hKJ1g
	 /06N/9EaxYvew==
From: Stefano Stabellini <sstabellini@kernel.org>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH LINUX v5 1/2] xen: sync xs_wire.h header with upstream xen
Date: Fri, 13 May 2022 14:19:37 -0700
Message-Id: <20220513211938.719341-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205131417320.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205131417320.3842@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Sync the xs_wire.h header file in Linux with the one in Xen.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

---
Changes in v5:
- add XSD_ERROR(E2BIG)
- Boris gave his reviewed-by but due to this change I removed it
---
 include/xen/interface/io/xs_wire.h | 37 ++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/include/xen/interface/io/xs_wire.h b/include/xen/interface/io/xs_wire.h
index d40a44f09b16..b62365478ac0 100644
--- a/include/xen/interface/io/xs_wire.h
+++ b/include/xen/interface/io/xs_wire.h
@@ -10,7 +10,8 @@
 
 enum xsd_sockmsg_type
 {
-    XS_DEBUG,
+    XS_CONTROL,
+#define XS_DEBUG XS_CONTROL
     XS_DIRECTORY,
     XS_READ,
     XS_GET_PERMS,
@@ -30,8 +31,13 @@ enum xsd_sockmsg_type
     XS_IS_DOMAIN_INTRODUCED,
     XS_RESUME,
     XS_SET_TARGET,
-    XS_RESTRICT,
-    XS_RESET_WATCHES,
+    /* XS_RESTRICT has been removed */
+    XS_RESET_WATCHES = XS_SET_TARGET + 2,
+    XS_DIRECTORY_PART,
+
+    XS_TYPE_COUNT,      /* Number of valid types. */
+
+    XS_INVALID = 0xffff /* Guaranteed to remain an invalid type */
 };
 
 #define XS_WRITE_NONE "NONE"
@@ -59,7 +65,8 @@ static struct xsd_errors xsd_errors[] __attribute__((unused)) = {
     XSD_ERROR(EROFS),
     XSD_ERROR(EBUSY),
     XSD_ERROR(EAGAIN),
-    XSD_ERROR(EISCONN)
+    XSD_ERROR(EISCONN),
+    XSD_ERROR(E2BIG)
 };
 
 struct xsd_sockmsg
@@ -87,9 +94,31 @@ struct xenstore_domain_interface {
     char rsp[XENSTORE_RING_SIZE]; /* Replies and async watch events. */
     XENSTORE_RING_IDX req_cons, req_prod;
     XENSTORE_RING_IDX rsp_cons, rsp_prod;
+    uint32_t server_features; /* Bitmap of features supported by the server */
+    uint32_t connection;
+    uint32_t error;
 };
 
 /* Violating this is very bad.  See docs/misc/xenstore.txt. */
 #define XENSTORE_PAYLOAD_MAX 4096
 
+/* Violating these just gets you an error back */
+#define XENSTORE_ABS_PATH_MAX 3072
+#define XENSTORE_REL_PATH_MAX 2048
+
+/* The ability to reconnect a ring */
+#define XENSTORE_SERVER_FEATURE_RECONNECTION 1
+/* The presence of the "error" field in the ring page */
+#define XENSTORE_SERVER_FEATURE_ERROR        2
+
+/* Valid values for the connection field */
+#define XENSTORE_CONNECTED 0 /* the steady-state */
+#define XENSTORE_RECONNECT 1 /* guest has initiated a reconnect */
+
+/* Valid values for the error field */
+#define XENSTORE_ERROR_NONE    0 /* No error */
+#define XENSTORE_ERROR_COMM    1 /* Communication problem */
+#define XENSTORE_ERROR_RINGIDX 2 /* Invalid ring index */
+#define XENSTORE_ERROR_PROTO   3 /* Protocol violation (payload too long) */
+
 #endif /* _XS_WIRE_H */
-- 
2.25.1


