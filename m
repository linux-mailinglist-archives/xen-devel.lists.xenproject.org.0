Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305DB6EDD70
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 09:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525785.817245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDZo-0001vo-Js; Tue, 25 Apr 2023 07:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525785.817245; Tue, 25 Apr 2023 07:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDZo-0001rp-F6; Tue, 25 Apr 2023 07:59:04 +0000
Received: by outflank-mailman (input) for mailman id 525785;
 Tue, 25 Apr 2023 07:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xGP=AQ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prDYw-0005uB-IE
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 07:58:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id eae4ecbe-e33e-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 09:58:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50CE84B3;
 Tue, 25 Apr 2023 00:58:52 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CF703F587;
 Tue, 25 Apr 2023 00:58:05 -0700 (PDT)
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
X-Inumbo-ID: eae4ecbe-e33e-11ed-8611-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v4 17/17] docs: update numa command line to support Arm
Date: Tue, 25 Apr 2023 15:56:55 +0800
Message-Id: <20230425075655.4037980-18-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230425075655.4037980-1-Henry.Wang@arm.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Current numa command in documentation is x86 only. Remove
x86 from numa command's arch limitation in this patch.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v3 -> v4:
1. No change.
v2 -> v3:
1. Add the Acked-by tag from Jan.
v1 -> v2:
1. Update Arm NUMA status in SUPPORT.md to "Tech Preview".
---
 SUPPORT.md                        | 1 +
 docs/misc/xen-command-line.pandoc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index aa1940e55f..da4e3b9aa2 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -401,6 +401,7 @@ on embedded platforms and the x86 PV shim.
 Enables NUMA aware scheduling in Xen
 
     Status, x86: Supported
+    Status, Arm: Tech Preview
 
 ## Scalability
 
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index e0b89b7d33..2fea22dd70 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1890,7 +1890,7 @@ i.e. a limit on the number of guests it is possible to start each having
 assigned a device sharing a common interrupt line.  Accepts values between
 1 and 255.
 
-### numa (x86)
+### numa
 > `= on | off | fake=<integer> | noacpi`
 
 > Default: `on`
-- 
2.25.1


