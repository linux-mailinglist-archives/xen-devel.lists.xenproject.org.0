Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1D17378B3
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 03:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552428.862510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBmc9-0000Bs-P2; Wed, 21 Jun 2023 01:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552428.862510; Wed, 21 Jun 2023 01:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBmc9-00009D-Lx; Wed, 21 Jun 2023 01:26:29 +0000
Received: by outflank-mailman (input) for mailman id 552428;
 Wed, 21 Jun 2023 01:26:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQ+K=CJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qBmc7-000097-Lq
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 01:26:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2244ed6-0fd2-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 03:26:24 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C942961236;
 Wed, 21 Jun 2023 01:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02AB1C433C0;
 Wed, 21 Jun 2023 01:26:20 +0000 (UTC)
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
X-Inumbo-ID: a2244ed6-0fd2-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687310782;
	bh=8gOIcCikqQLJ+3hXgXoSfZfuzAku+1OSc/K2C4b3ovA=;
	h=From:To:Cc:Subject:Date:From;
	b=cfRtoYRUsUWFUhPitkvkP16MCpbkfrH4r7+8DJLuQlqcpYs3y5hwj7wWcGmcstNlE
	 ghN5PA0e0iEFZ3vPZQRX3gUW3h/2wyNTrSd1l6KqCMpJP+pqfXM1gRDmkdhNgYbayl
	 GrLFdRB23cQo/Kan4aj/fzV8pGbWIvsx/mimTWLQNInyA3cZ2118wtFH6uKLs6uQTf
	 CNyiZ6w3R/+kK3gLh1p/pHtGPnYgqXHoRD14X1bUtwMUy6iRp/bm9IADaQGMCaUQYJ
	 meG8xxKJG7Q1H47sWYu4T3uvkVangQAkBuGPj4y3j6ijJo/AypfWDXGSPr2f46Bcz4
	 QRYSlaoRr1tuw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	jbeulich@suse.com,
	julien@xen.org,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	bertrand.marquis@arm.com,
	roberto.bagnara@bugseng.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] docs/misra: add Rules 8.2, 8.3, 8.14
Date: Tue, 20 Jun 2023 18:26:18 -0700
Message-Id: <20230621012618.2661337-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 docs/misra/rules.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index 11b9c42b70..9caf43968c 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -213,6 +213,17 @@ maintainers if you want to suggest a change.
      - Types shall be explicitly specified
      -
 
+   * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
+     - Required
+     - Function types shall be in prototype form with named parameters
+     -
+
+   * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_03.c>`_
+     - Required
+     - All declarations of an object or function shall use the same
+       names and type qualifiers
+     -
+
    * - `Rule 8.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_04.c>`_
      - Required
      - A compatible declaration shall be visible when an object or
@@ -248,6 +259,11 @@ maintainers if you want to suggest a change.
        enumeration constant shall be unique
      -
 
+   * - `Rule 8.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_14.c>`_
+     - Required
+     - The restrict type qualifier shall not be used
+     -
+
    * - `Rule 9.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_09_01.c>`_
      - Mandatory
      - The value of an object with automatic storage duration shall not
-- 
2.25.1


