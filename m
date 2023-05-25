Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB5710783
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 10:34:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539376.840201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26QM-0005uX-MA; Thu, 25 May 2023 08:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539376.840201; Thu, 25 May 2023 08:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q26QM-0005qh-IQ; Thu, 25 May 2023 08:34:18 +0000
Received: by outflank-mailman (input) for mailman id 539376;
 Thu, 25 May 2023 08:34:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmzE=BO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1q26QL-0005ld-5H
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 08:34:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ece9717e-fad6-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 10:34:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFA9B15DB;
 Thu, 25 May 2023 01:34:58 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4B0B3F67D;
 Thu, 25 May 2023 01:34:12 -0700 (PDT)
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
X-Inumbo-ID: ece9717e-fad6-11ed-8611-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 3/3] maintainers: Add Xen MISRA Analysis Tools section
Date: Thu, 25 May 2023 09:34:01 +0100
Message-Id: <20230525083401.3838462-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525083401.3838462-1-luca.fancellu@arm.com>
References: <20230525083401.3838462-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a section for the Xen MISRA Analysis Tools.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v2:
 - New patch, suggested by Stefano:
   https://lore.kernel.org/all/alpine.DEB.2.22.394.2305171232440.128889@ubuntu-linux-20-04-desktop/
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2f1881b32cc..c5b2dc2b024c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -667,6 +667,16 @@ F:	tools/xentrace/
 F:	xen/common/trace.c
 F:	xen/include/xen/trace.h
 
+XEN MISRA ANALYSIS TOOLS
+M:	Luca Fancellu <luca.fancellu@arm.com>
+S:	Supported
+F:	xen/scripts/xen_analysis/
+F:	xen/scripts/xen-analysis.py
+F:	xen/scripts/diff-report.py
+F:	xen/tools/cppcheck-plat/
+F:	xen/tools/convert_misra_doc.py
+F:	xen/tools/cppcheck-cc.sh
+
 XSM/FLASK
 M:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Supported
-- 
2.34.1


