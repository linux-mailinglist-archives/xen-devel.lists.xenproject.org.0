Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE19D9F9A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844046.1259599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tm-0000QG-9Y; Tue, 26 Nov 2024 23:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844046.1259599; Tue, 26 Nov 2024 23:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4tm-0000Ni-4j; Tue, 26 Nov 2024 23:23:14 +0000
Received: by outflank-mailman (input) for mailman id 844046;
 Tue, 26 Nov 2024 23:22:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sb-0000Ao-I9
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aa60ca8-ac4d-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 00:21:57 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8DBEA5C5C0D;
 Tue, 26 Nov 2024 23:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79CDAC4CEDD;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC62D66B89;
 Tue, 26 Nov 2024 23:21:55 +0000 (UTC)
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
X-Inumbo-ID: 3aa60ca8-ac4d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNhYTYwY2E4LWFjNGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjYzMzE4LjA5Nzk5Miwic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663315;
	bh=xRl/VI33XtcNQyJ8toSM7CxORY63SAcLHHhJDp/5VHE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RdupsLJVIRafQLWxJMPEhpP/XHYk4ho+6qgZbdxC8XWaZKfDeIdNdkxnFyp5JmVMD
	 bymk/6NP2NGllgK/rnULmAZNoSi9ArJupKYHrs8c7J4eOO87gCwDmpd+kP8TW7chPq
	 GPtg76P4sN/1vs8Wc3mg82ZjzroFo8mLGeCEzAjgM0OZ65hkvaaL8cKSGU9BT2t9tB
	 T8Q92HbKVu7M9XePQndcz3RfJ1J21soYc9KCRwMHiSmGY0C1Uc07qblTocMmoburKs
	 9Yy6Y9xAmpK+dwHCcX9WGZJZjUQUWe8kSEhqaBf9S/XeHwEfsdCpl/P9JTwfUGi8Aq
	 HFQgAR3Tfy4HA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:21:55 -0800
Subject: [PATCH 05/36] xen/xmalloc: add kmalloc() and kfree() aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-5-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=2077;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=izvZS5PqvGBio87RDretaNG85fhbAWhHk9N0az9Fz9c=;
 b=DxooxiraEmxSjKMVEBBQD4C5YYEkrJbAOK1wZaShOd6buUxM3dQFSSYYVIfElWUereMJvfwLg
 Wj8gFWn4yIjB0TL6qPikxL3D5RpBO5Qg26QYelUQogHdovGoR4kWouc
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Move existing aliases to a common header so those could be used in the new
code.

The code looks simpler w/ kmalloc(): type specification of the
object being allocated is not required, e.g.:
...
  struct my_obj_s *obj;

  obj = kmalloc(sizeof(*obj), 0);
...

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/passthrough/arm/smmu.c | 4 ----
 xen/include/xen/xmalloc.h          | 5 +++++
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index aa6a968b574dce7cc753e8070fad3a6e585cd9e7..b343dbc32282136ccb95654ae2756eaa8a51149f 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -136,11 +136,7 @@ typedef enum irqreturn irqreturn_t;
 #define dev_name(dev) dt_node_full_name(dev_to_dt(dev))
 
 /* Alias to Xen allocation helpers */
-#define kfree xfree
-#define kmalloc(size, flags)		_xmalloc(size, sizeof(void *))
-#define kzalloc(size, flags)		_xzalloc(size, sizeof(void *))
 #define devm_kzalloc(dev, size, flags)	_xzalloc(size, sizeof(void *))
-#define kmalloc_array(size, n, flags)	_xmalloc_array(size, sizeof(void *), n)
 #define devm_kcalloc(dev, n, size, flags)			\
 	_xzalloc_array(size, sizeof(void *), n)
 
diff --git a/xen/include/xen/xmalloc.h b/xen/include/xen/xmalloc.h
index b903fa2e26e198fc80fc6010c3165cc50b1197c7..eea8cced51d9fe784b558201a68648e1672d624f 100644
--- a/xen/include/xen/xmalloc.h
+++ b/xen/include/xen/xmalloc.h
@@ -16,6 +16,11 @@
 #define xmalloc(_type) ((_type *)_xmalloc(sizeof(_type), __alignof__(_type)))
 #define xzalloc(_type) ((_type *)_xzalloc(sizeof(_type), __alignof__(_type)))
 
+#define kfree                           xfree
+#define kmalloc(size, flags)            _xmalloc(size, sizeof(void *))
+#define kzalloc(size, flags)            _xzalloc(size, sizeof(void *))
+#define kmalloc_array(size, n, flags)   _xmalloc_array(size, sizeof(void *), n)
+
 /*
  * Allocate space for a typed object and copy an existing instance.
  *

-- 
2.34.1



