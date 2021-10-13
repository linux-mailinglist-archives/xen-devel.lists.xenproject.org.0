Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2B42BFC5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208338.364432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madFG-00068A-2r; Wed, 13 Oct 2021 12:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208338.364432; Wed, 13 Oct 2021 12:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1madFF-00065s-VO; Wed, 13 Oct 2021 12:20:29 +0000
Received: by outflank-mailman (input) for mailman id 208338;
 Wed, 13 Oct 2021 12:20:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kt2p=PB=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1madFE-000649-KQ
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:20:28 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6c87281f-582c-4b85-ae17-24c6f53c5e19;
 Wed, 13 Oct 2021 12:20:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A5451FB;
 Wed, 13 Oct 2021 05:20:27 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80BD43F70D;
 Wed, 13 Oct 2021 05:20:26 -0700 (PDT)
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
X-Inumbo-ID: 6c87281f-582c-4b85-ae17-24c6f53c5e19
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/docs: Clarify legacy DT bindings on UEFI
Date: Wed, 13 Oct 2021 13:19:29 +0100
Message-Id: <20211013121929.30784-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

Legacy compatible strings for dom0 modules are not
supported when booting using UEFI, the documentation
doesn't mention that.

Add a phrase to docs/misc/arm/device-tree/booting.txt
to clarify it.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index c6a775f4e8..017c0f13eb 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -51,6 +51,8 @@ Each node contains the following properties:
 	Xen 4.4 supported a different set of legacy compatible strings
 	which remain supported such that systems supporting both 4.4
 	and later can use a single DTB.
+	However when booting Xen using UEFI and Device Tree, the legacy
+	compatible strings are not supported.
 
 	- "xen,multiboot-module" equivalent to "multiboot,module"
 	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
-- 
2.17.1


