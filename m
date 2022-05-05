Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4601D51B4A0
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 02:23:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321228.542182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPGw-0004t2-Dm; Thu, 05 May 2022 00:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321228.542182; Thu, 05 May 2022 00:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPGw-0004qL-7X; Thu, 05 May 2022 00:23:10 +0000
Received: by outflank-mailman (input) for mailman id 321228;
 Thu, 05 May 2022 00:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmPGu-0004pS-NF
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 00:23:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 890976fb-cc09-11ec-a406-831a346695d4;
 Thu, 05 May 2022 02:23:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84DB761D47;
 Thu,  5 May 2022 00:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9000C385A5;
 Thu,  5 May 2022 00:23:05 +0000 (UTC)
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
X-Inumbo-ID: 890976fb-cc09-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651710185;
	bh=HFLLzAtqSAhevBTNCZk3OMTL3poJMeEW0dWOHMZLBNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BQp06t9UrtZbQwSSdyMAde3poqr3W4rwIegP9HDgHxNqJwYhUJclsMyS7/BSekUYN
	 eMLtojNJl4Gl+cxR2pHBW++i9NV6nEO4TIBpp3NBTcq+h8T4qq3VixHHkRIUl0JY/B
	 xE8gD9+bHb5Yx6gOQA0xmQS3Y10kx5vu74flOWV4OCyO5VYcdfXSYCYJMtBeK5Stko
	 Cb8keVZzu9OWU955B6ZfAPvyYdPa4zI4tyzVCJebjcZ1jvtyMiaj3JfZ6SPB2YoCt7
	 al93Oe2uPdGzBU1l3hSUy8gvyJVHXv/xmAwFO5cQgrxFKyrZ5xFlZzxKdm94jzRFFv
	 bscsu/OK1DzQA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v4 1/2] xen: sync xs_wire.h header with upstream xen
Date: Wed,  4 May 2022 17:23:03 -0700
Message-Id: <20220505002304.401417-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Sync the xs_wire.h header file in Linux with the one in Xen.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 include/xen/interface/io/xs_wire.h | 34 +++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/include/xen/interface/io/xs_wire.h b/include/xen/interface/io/xs_wire.h
index d40a44f09b16..04dca77abc45 100644
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
@@ -87,9 +93,31 @@ struct xenstore_domain_interface {
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


