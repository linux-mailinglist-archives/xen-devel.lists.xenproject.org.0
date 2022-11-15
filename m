Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C50A629048
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 04:00:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443690.698437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oumBh-0007uo-5A; Tue, 15 Nov 2022 03:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443690.698437; Tue, 15 Nov 2022 03:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oumBg-0007pv-Vp; Tue, 15 Nov 2022 03:00:36 +0000
Received: by outflank-mailman (input) for mailman id 443690;
 Tue, 15 Nov 2022 03:00:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4s-0000BJ-UM
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:53:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b0baba22-6490-11ed-91b6-6bf2151ebd3b;
 Tue, 15 Nov 2022 03:53:32 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 146CE11FB;
 Mon, 14 Nov 2022 18:53:38 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 25DE13F73B;
 Mon, 14 Nov 2022 18:53:27 -0800 (PST)
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
X-Inumbo-ID: b0baba22-6490-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 13/13] xen: make static shared memory supported in SUPPORT.md
Date: Tue, 15 Nov 2022 10:52:35 +0800
Message-Id: <20221115025235.1378931-14-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After patching previous commits, we could make feature of "static shared memory"
supported in SUPPORT.md.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 SUPPORT.md           | 2 +-
 xen/arch/arm/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index ab71464cf6..c9fe7daf56 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -316,7 +316,7 @@ Allow sharing of identical pages between guests
 Allow to statically set up shared memory on dom0less system,
 enabling domains to do shm-based communication
 
-    Status, ARM: Tech Preview
+    Status, ARM: Supported
 
 ### Memory Paging
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 52a05f704d..e0ea6e1762 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -141,7 +141,7 @@ config TEE
 source "arch/arm/tee/Kconfig"
 
 config STATIC_SHM
-	bool "Statically shared memory on a dom0less system" if UNSUPPORTED
+	bool "Statically shared memory on a dom0less system"
 	depends on STATIC_MEMORY
 	help
 	  This option enables statically shared memory on a dom0less system.
-- 
2.25.1


