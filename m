Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E913446855
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 19:20:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222586.384875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj3oT-0006VT-4c; Fri, 05 Nov 2021 18:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222586.384875; Fri, 05 Nov 2021 18:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mj3oS-0006Sq-Rp; Fri, 05 Nov 2021 18:19:40 +0000
Received: by outflank-mailman (input) for mailman id 222586;
 Fri, 05 Nov 2021 18:19:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0iX8=PY=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mj3oQ-0005tM-2l
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 18:19:38 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e88::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec7ff0f4-3e64-11ec-a9d2-d9f7a1cc8784;
 Fri, 05 Nov 2021 19:19:34 +0100 (CET)
Received: from SN4PR0501CA0044.namprd05.prod.outlook.com
 (2603:10b6:803:41::21) by DM5PR0201MB3494.namprd02.prod.outlook.com
 (2603:10b6:4:78::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 5 Nov
 2021 18:19:27 +0000
Received: from SN1NAM02FT0015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:41:cafe::e7) by SN4PR0501CA0044.outlook.office365.com
 (2603:10b6:803:41::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.4 via Frontend
 Transport; Fri, 5 Nov 2021 18:19:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0015.mail.protection.outlook.com (10.97.5.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Fri, 5 Nov 2021 18:19:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 5 Nov 2021 11:19:24 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 5 Nov 2021 11:19:24 -0700
Received: from [172.19.2.115] (port=34588 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mj3oC-0006lr-Jr; Fri, 05 Nov 2021 11:19:24 -0700
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
X-Inumbo-ID: ec7ff0f4-3e64-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MI9DajOVbIK07Kcbx/0IqDIhjAVoSfTzwnDhoLfmoJuYy8Ryi3RjimbNaLdjMmtRpMn9jLqNadqFoNwVf2bNpKuDoGDdab8+hLxG5nSzMKW+bzWnosF7YggPnsOtcK1kaLMFBuu59uqV+NOn0zs1plI9V/y4MElpCajdwrgyYsukgWR1j3htY8GBM4vfSDuUOgtNAWzaunrp8dYylnwyQ8h6j/K/z2T7zw4VjLwLd0e4oUChRMOlzvIQPy+jhp1OTEJS8Ji+lYYJaWb3LdCv+EWdAhtcyyYlFq6QtsTbGjHZHToJnwSyISfUjg5exl7iu0ePRVAJf1//9r99UKGjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgZvHw/01BnrytZEHvdfbwRRnX8uErXChj69kvgJxH4=;
 b=Bf4PGY0FiBtUTRdpa2lgv6fHJPvya4j57qYbvOb9qV8Q65bESWF8/VIKNpLqYo5B8c4LhDWMRZ9ApIPcdAo/oh4vtUa5kcSr5wAQLQ+KGU6HeI4kMFxQeyoKwMxRkkjYyRS96FLtKc2JBdKCqmD4LQs1bu53jwTpzKLHtVitwAg0dLTgCv+Q/pKIXEJTXuRFLl+KUO3Jg5BrH/Wv896sJSI+KLiIE+Br+Jh8mBi4CN3hGTA/K0oHA/cXUlnyRWD/94A/Fk6XXrQwJjRLzgS9wZpnXU9FIhLrpaM7WGui4e2ICpvEvCvfAvSBd7BweU+N1hhmFm71wcOlIsLkQkmKCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgZvHw/01BnrytZEHvdfbwRRnX8uErXChj69kvgJxH4=;
 b=Ad7EbpQG8+erfP3XWi5cqR0XGmNWyppx+zqDFn7H8hASHFTNU7cXqiR8RRuO8uXHu0am94hdb8z0N7UfpGo4/co5ll2NJDonRlk60UTXb6AIH024Sdz2jMvMPH4zzrW9EhOnQMRQ9h4ZoWo6zY1MyqYPRLEjRPRhpGz8L+QId6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<volodymyr_babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>
Subject: [XEN][PATCH 1/2] Update libfdt to v1.6.1
Date: Fri, 5 Nov 2021 11:19:13 -0700
Message-ID: <1636136354-68413-2-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636136354-68413-1-git-send-email-fnu.vikram@xilinx.com>
References: <1636136354-68413-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9418ed0-70e0-419c-0d53-08d9a088cd48
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3494:
X-Microsoft-Antispam-PRVS:
	<DM5PR0201MB3494DDFD71E4C30B26415118BC8E9@DM5PR0201MB3494.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HvqKy6EzMfXAr1VYXNMIdjSjt//D4GRlEEeyI9wLbzEHb8xxXAYhzZ4EXhXp8WQIc3bNWVmnU7AtCrbCtLIGeHNXUBMwaL175wpFxPgcWDibzKlald1CgpTp45A7Jo0QoDUWOnEiRBUfuibRY9rHBrOsnvQMBdWN8ji4I+riv+WTSMrAjNbH2y4b2kKXLbG7pNaNVjH2hcR189sUdoVye8+/iuKcABSXw+IfD3hn7G79oPTlJ0lFpvx7nMtqNrdBg2Wyb9mClcEHeA1m+YApdTF1XUqCZ8wG/sUCX5Y7oqNC4zWyNjo8igoiAzsb1LoCrmyolYYf3FRZ9ZnMzRoYvADzHNe0cXUHaBJJqcRMCp1kDFf9KqmCsLhL2dXVmXWVYAbyRtxZjk9MaJbUXkNYJAdb8Ceoi+49jye1CheEKnTwC0KIrVBKdKOLb8kXyiQkuMpFm3mADQIx6Sl/sgGmlhjG0U1ulsODeblaLKnGvtjhER9wAlofz5rvHqs1JylIc+FaKAHVN8KrOoKFkXrIeBTf8v79LXxF1DxVfDN+i+U+Xld4paRDwh+BT6zhWqSkt07kUgWntX+MIqRwsX9in7cBUGjVOcrDn2nbCNeC9EG+cJFrB3oVh/K220z00OzZgFeHUdTTAXJO/UhJUGwcXpxlS9iWJWnfjrfPjKVhmYgQokJVVDtZBKaBopAAQ7HBKuTD+P1Y/8Uouk5pDVGsOuRxx/abcvkLwTYmXMMsriLNxoF6DS7RuKZobngMkB3zE5xg1ULuFInx5uZ3qCJ5x2yWpIs6+yht0PbCihBSn/zgswchpQrPbtieMix4iBFxuuCmGTiJCAOyekJw2QLDw2kpi7m1f3/gMYJTS7A/ZpQ=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(2906002)(83380400001)(4326008)(2616005)(6916009)(36860700001)(426003)(15650500001)(8936002)(82310400003)(7696005)(356005)(47076005)(70586007)(54906003)(508600001)(5660300002)(70206006)(7636003)(9786002)(36756003)(316002)(186003)(36906005)(336012)(26005)(6666004)(107886003)(30864003)(8676002)(102446001)(46800400005)(2004002)(559001)(579004);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 18:19:26.8813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9418ed0-70e0-419c-0d53-08d9a088cd48
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3494

Update libfdt to v1.6.1 of libfdt taken from git://github.com/dgibson/dtc.
This update is done to support device tree overlays.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/common/libfdt/Makefile.libfdt   |  10 +-
 xen/common/libfdt/fdt.c             | 226 ++++++---
 xen/common/libfdt/fdt_addresses.c   | 101 +++++
 xen/common/libfdt/fdt_check.c       |  93 ++++
 xen/common/libfdt/fdt_empty_tree.c  |  46 +-
 xen/common/libfdt/fdt_overlay.c     | 882 ++++++++++++++++++++++++++++++++++++
 xen/common/libfdt/fdt_ro.c          | 514 ++++++++++++++++-----
 xen/common/libfdt/fdt_rw.c          | 249 +++++-----
 xen/common/libfdt/fdt_strerror.c    |  55 +--
 xen/common/libfdt/fdt_sw.c          | 312 +++++++++----
 xen/common/libfdt/fdt_wip.c         |  88 ++--
 xen/common/libfdt/libfdt_internal.h | 223 ++++++---
 xen/include/xen/libfdt/fdt.h        |  51 +--
 xen/include/xen/libfdt/libfdt.h     | 868 +++++++++++++++++++++++++++++------
 xen/include/xen/libfdt/libfdt_env.h | 108 ++++-
 15 files changed, 3031 insertions(+), 795 deletions(-)
 create mode 100644 xen/common/libfdt/fdt_addresses.c
 create mode 100644 xen/common/libfdt/fdt_check.c
 create mode 100644 xen/common/libfdt/fdt_overlay.c

diff --git a/xen/common/libfdt/Makefile.libfdt b/xen/common/libfdt/Makefile.libfdt
index 91126c0..b6d8fc0 100644
--- a/xen/common/libfdt/Makefile.libfdt
+++ b/xen/common/libfdt/Makefile.libfdt
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 # Makefile.libfdt
 #
 # This is not a complete Makefile of itself.  Instead, it is designed to
@@ -6,5 +7,12 @@
 LIBFDT_soname = libfdt.$(SHAREDLIB_EXT).1
 LIBFDT_INCLUDES = fdt.h libfdt.h libfdt_env.h
 LIBFDT_VERSION = version.lds
-LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c
+LIBFDT_SRCS = fdt.c fdt_ro.c fdt_wip.c fdt_sw.c fdt_rw.c fdt_strerror.c fdt_empty_tree.c \
+	fdt_addresses.c fdt_overlay.c fdt_check.c
 LIBFDT_OBJS = $(LIBFDT_SRCS:%.c=%.o)
+LIBFDT_LIB = libfdt-$(DTC_VERSION).$(SHAREDLIB_EXT)
+
+libfdt_clean:
+	@$(VECHO) CLEAN "(libfdt)"
+	rm -f $(STD_CLEANFILES:%=$(LIBFDT_dir)/%)
+	rm -f $(LIBFDT_dir)/$(LIBFDT_soname)
diff --git a/xen/common/libfdt/fdt.c b/xen/common/libfdt/fdt.c
index bbc7717..9fe7cf4 100644
--- a/xen/common/libfdt/fdt.c
+++ b/xen/common/libfdt/fdt.c
@@ -1,50 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
- *
- * libfdt is dual licensed: you can use it either under the terms of
- * the GPL, or the BSD license, at your option.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Alternatively,
- *
- *  b) Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *     1. Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *     2. Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
- *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
- *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
- *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
- *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include "libfdt_env.h"
 
@@ -53,40 +10,156 @@
 
 #include "libfdt_internal.h"
 
-int fdt_check_header(const void *fdt)
+/*
+ * Minimal sanity check for a read-only tree. fdt_ro_probe_() checks
+ * that the given buffer contains what appears to be a flattened
+ * device tree with sane information in its header.
+ */
+int32_t fdt_ro_probe_(const void *fdt)
 {
+	uint32_t totalsize = fdt_totalsize(fdt);
+
+	if (can_assume(VALID_DTB))
+		return totalsize;
+
+	/* The device tree must be at an 8-byte aligned address */
+	if ((uintptr_t)fdt & 7)
+		return -FDT_ERR_ALIGNMENT;
+
 	if (fdt_magic(fdt) == FDT_MAGIC) {
 		/* Complete tree */
-		if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
-			return -FDT_ERR_BADVERSION;
-		if (fdt_last_comp_version(fdt) > FDT_LAST_SUPPORTED_VERSION)
-			return -FDT_ERR_BADVERSION;
+		if (!can_assume(LATEST)) {
+			if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
+				return -FDT_ERR_BADVERSION;
+			if (fdt_last_comp_version(fdt) >
+					FDT_LAST_SUPPORTED_VERSION)
+				return -FDT_ERR_BADVERSION;
+		}
 	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
 		/* Unfinished sequential-write blob */
-		if (fdt_size_dt_struct(fdt) == 0)
+		if (!can_assume(VALID_INPUT) && fdt_size_dt_struct(fdt) == 0)
 			return -FDT_ERR_BADSTATE;
 	} else {
 		return -FDT_ERR_BADMAGIC;
 	}
 
+	if (totalsize < INT32_MAX)
+		return totalsize;
+	else
+		return -FDT_ERR_TRUNCATED;
+}
+
+static int check_off_(uint32_t hdrsize, uint32_t totalsize, uint32_t off)
+{
+	return (off >= hdrsize) && (off <= totalsize);
+}
+
+static int check_block_(uint32_t hdrsize, uint32_t totalsize,
+			uint32_t base, uint32_t size)
+{
+	if (!check_off_(hdrsize, totalsize, base))
+		return 0; /* block start out of bounds */
+	if ((base + size) < base)
+		return 0; /* overflow */
+	if (!check_off_(hdrsize, totalsize, base + size))
+		return 0; /* block end out of bounds */
+	return 1;
+}
+
+size_t fdt_header_size_(uint32_t version)
+{
+	if (version <= 1)
+		return FDT_V1_SIZE;
+	else if (version <= 2)
+		return FDT_V2_SIZE;
+	else if (version <= 3)
+		return FDT_V3_SIZE;
+	else if (version <= 16)
+		return FDT_V16_SIZE;
+	else
+		return FDT_V17_SIZE;
+}
+
+size_t fdt_header_size(const void *fdt)
+{
+	return can_assume(LATEST) ? FDT_V17_SIZE :
+		fdt_header_size_(fdt_version(fdt));
+}
+
+int fdt_check_header(const void *fdt)
+{
+	size_t hdrsize;
+
+	/* The device tree must be at an 8-byte aligned address */
+	if ((uintptr_t)fdt & 7)
+		return -FDT_ERR_ALIGNMENT;
+
+	if (fdt_magic(fdt) != FDT_MAGIC)
+		return -FDT_ERR_BADMAGIC;
+	if (!can_assume(LATEST)) {
+		if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
+		    || (fdt_last_comp_version(fdt) >
+			FDT_LAST_SUPPORTED_VERSION))
+			return -FDT_ERR_BADVERSION;
+		if (fdt_version(fdt) < fdt_last_comp_version(fdt))
+			return -FDT_ERR_BADVERSION;
+	}
+	hdrsize = fdt_header_size(fdt);
+	if (!can_assume(VALID_DTB)) {
+
+		if ((fdt_totalsize(fdt) < hdrsize)
+		    || (fdt_totalsize(fdt) > INT_MAX))
+			return -FDT_ERR_TRUNCATED;
+
+		/* Bounds check memrsv block */
+		if (!check_off_(hdrsize, fdt_totalsize(fdt),
+				fdt_off_mem_rsvmap(fdt)))
+			return -FDT_ERR_TRUNCATED;
+	}
+
+	if (!can_assume(VALID_DTB)) {
+		/* Bounds check structure block */
+		if (!can_assume(LATEST) && fdt_version(fdt) < 17) {
+			if (!check_off_(hdrsize, fdt_totalsize(fdt),
+					fdt_off_dt_struct(fdt)))
+				return -FDT_ERR_TRUNCATED;
+		} else {
+			if (!check_block_(hdrsize, fdt_totalsize(fdt),
+					  fdt_off_dt_struct(fdt),
+					  fdt_size_dt_struct(fdt)))
+				return -FDT_ERR_TRUNCATED;
+		}
+
+		/* Bounds check strings block */
+		if (!check_block_(hdrsize, fdt_totalsize(fdt),
+				  fdt_off_dt_strings(fdt),
+				  fdt_size_dt_strings(fdt)))
+			return -FDT_ERR_TRUNCATED;
+	}
+
 	return 0;
 }
 
 const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int len)
 {
-	unsigned absoffset = offset + fdt_off_dt_struct(fdt);
+	unsigned int uoffset = offset;
+	unsigned int absoffset = offset + fdt_off_dt_struct(fdt);
 
-	if ((absoffset < offset)
-	    || ((absoffset + len) < absoffset)
-	    || (absoffset + len) > fdt_totalsize(fdt))
+	if (offset < 0)
 		return NULL;
 
-	if (fdt_version(fdt) >= 0x11)
-		if (((offset + len) < offset)
+	if (!can_assume(VALID_INPUT))
+		if ((absoffset < uoffset)
+		    || ((absoffset + len) < absoffset)
+		    || (absoffset + len) > fdt_totalsize(fdt))
+			return NULL;
+
+	if (can_assume(LATEST) || fdt_version(fdt) >= 0x11)
+		if (((uoffset + len) < uoffset)
 		    || ((offset + len) > fdt_size_dt_struct(fdt)))
 			return NULL;
 
-	return _fdt_offset_ptr(fdt, offset);
+	return fdt_offset_ptr_(fdt, offset);
 }
 
 uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
@@ -98,7 +171,7 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 
 	*nextoffset = -FDT_ERR_TRUNCATED;
 	tagp = fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
-	if (!tagp)
+	if (!can_assume(VALID_DTB) && !tagp)
 		return FDT_END; /* premature end */
 	tag = fdt32_to_cpu(*tagp);
 	offset += FDT_TAGSIZE;
@@ -110,17 +183,21 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 		do {
 			p = fdt_offset_ptr(fdt, offset++, 1);
 		} while (p && (*p != '\0'));
-		if (!p)
+		if (!can_assume(VALID_DTB) && !p)
 			return FDT_END; /* premature end */
 		break;
 
 	case FDT_PROP:
 		lenp = fdt_offset_ptr(fdt, offset, sizeof(*lenp));
-		if (!lenp)
+		if (!can_assume(VALID_DTB) && !lenp)
 			return FDT_END; /* premature end */
 		/* skip-name offset, length and value */
 		offset += sizeof(struct fdt_property) - FDT_TAGSIZE
 			+ fdt32_to_cpu(*lenp);
+		if (!can_assume(LATEST) &&
+		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >= 8 &&
+		    ((offset - fdt32_to_cpu(*lenp)) % 8) != 0)
+			offset += 4;
 		break;
 
 	case FDT_END:
@@ -139,19 +216,25 @@ uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset)
 	return tag;
 }
 
-int _fdt_check_node_offset(const void *fdt, int offset)
+int fdt_check_node_offset_(const void *fdt, int offset)
 {
-	if ((offset < 0) || (offset % FDT_TAGSIZE)
-	    || (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE))
+	if (!can_assume(VALID_INPUT)
+	    && ((offset < 0) || (offset % FDT_TAGSIZE)))
+		return -FDT_ERR_BADOFFSET;
+
+	if (fdt_next_tag(fdt, offset, &offset) != FDT_BEGIN_NODE)
 		return -FDT_ERR_BADOFFSET;
 
 	return offset;
 }
 
-int _fdt_check_prop_offset(const void *fdt, int offset)
+int fdt_check_prop_offset_(const void *fdt, int offset)
 {
-	if ((offset < 0) || (offset % FDT_TAGSIZE)
-	    || (fdt_next_tag(fdt, offset, &offset) != FDT_PROP))
+	if (!can_assume(VALID_INPUT)
+	    && ((offset < 0) || (offset % FDT_TAGSIZE)))
+		return -FDT_ERR_BADOFFSET;
+
+	if (fdt_next_tag(fdt, offset, &offset) != FDT_PROP)
 		return -FDT_ERR_BADOFFSET;
 
 	return offset;
@@ -163,7 +246,7 @@ int fdt_next_node(const void *fdt, int offset, int *depth)
 	uint32_t tag;
 
 	if (offset >= 0)
-		if ((nextoffset = _fdt_check_node_offset(fdt, offset)) < 0)
+		if ((nextoffset = fdt_check_node_offset_(fdt, offset)) < 0)
 			return nextoffset;
 
 	do {
@@ -225,7 +308,7 @@ int fdt_next_subnode(const void *fdt, int offset)
 	return offset;
 }
 
-const char *_fdt_find_string(const char *strtab, int tabsize, const char *s)
+const char *fdt_find_string_(const char *strtab, int tabsize, const char *s)
 {
 	int len = strlen(s) + 1;
 	const char *last = strtab + tabsize - len;
@@ -239,9 +322,12 @@ const char *_fdt_find_string(const char *strtab, int tabsize, const char *s)
 
 int fdt_move(const void *fdt, void *buf, int bufsize)
 {
-	FDT_CHECK_HEADER(fdt);
+	if (!can_assume(VALID_INPUT) && bufsize < 0)
+		return -FDT_ERR_NOSPACE;
+
+	FDT_RO_PROBE(fdt);
 
-	if (fdt_totalsize(fdt) > bufsize)
+	if (fdt_totalsize(fdt) > (unsigned int)bufsize)
 		return -FDT_ERR_NOSPACE;
 
 	memmove(buf, fdt, fdt_totalsize(fdt));
diff --git a/xen/common/libfdt/fdt_addresses.c b/xen/common/libfdt/fdt_addresses.c
new file mode 100644
index 0000000..9a82cd0
--- /dev/null
+++ b/xen/common/libfdt/fdt_addresses.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * libfdt - Flat Device Tree manipulation
+ * Copyright (C) 2014 David Gibson <david@gibson.dropbear.id.au>
+ * Copyright (C) 2018 embedded brains GmbH
+ */
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+static int fdt_cells(const void *fdt, int nodeoffset, const char *name)
+{
+	const fdt32_t *c;
+	uint32_t val;
+	int len;
+
+	c = fdt_getprop(fdt, nodeoffset, name, &len);
+	if (!c)
+		return len;
+
+	if (len != sizeof(*c))
+		return -FDT_ERR_BADNCELLS;
+
+	val = fdt32_to_cpu(*c);
+	if (val > FDT_MAX_NCELLS)
+		return -FDT_ERR_BADNCELLS;
+
+	return (int)val;
+}
+
+int fdt_address_cells(const void *fdt, int nodeoffset)
+{
+	int val;
+
+	val = fdt_cells(fdt, nodeoffset, "#address-cells");
+	if (val == 0)
+		return -FDT_ERR_BADNCELLS;
+	if (val == -FDT_ERR_NOTFOUND)
+		return 2;
+	return val;
+}
+
+int fdt_size_cells(const void *fdt, int nodeoffset)
+{
+	int val;
+
+	val = fdt_cells(fdt, nodeoffset, "#size-cells");
+	if (val == -FDT_ERR_NOTFOUND)
+		return 1;
+	return val;
+}
+
+/* This function assumes that [address|size]_cells is 1 or 2 */
+int fdt_appendprop_addrrange(void *fdt, int parent, int nodeoffset,
+			     const char *name, uint64_t addr, uint64_t size)
+{
+	int addr_cells, size_cells, ret;
+	uint8_t data[sizeof(fdt64_t) * 2], *prop;
+
+	ret = fdt_address_cells(fdt, parent);
+	if (ret < 0)
+		return ret;
+	addr_cells = ret;
+
+	ret = fdt_size_cells(fdt, parent);
+	if (ret < 0)
+		return ret;
+	size_cells = ret;
+
+	/* check validity of address */
+	prop = data;
+	if (addr_cells == 1) {
+		if ((addr > UINT32_MAX) || ((UINT32_MAX + 1 - addr) < size))
+			return -FDT_ERR_BADVALUE;
+
+		fdt32_st(prop, (uint32_t)addr);
+	} else if (addr_cells == 2) {
+		fdt64_st(prop, addr);
+	} else {
+		return -FDT_ERR_BADNCELLS;
+	}
+
+	/* check validity of size */
+	prop += addr_cells * sizeof(fdt32_t);
+	if (size_cells == 1) {
+		if (size > UINT32_MAX)
+			return -FDT_ERR_BADVALUE;
+
+		fdt32_st(prop, (uint32_t)size);
+	} else if (size_cells == 2) {
+		fdt64_st(prop, size);
+	} else {
+		return -FDT_ERR_BADNCELLS;
+	}
+
+	return fdt_appendprop(fdt, nodeoffset, name, data,
+			      (addr_cells + size_cells) * sizeof(fdt32_t));
+}
diff --git a/xen/common/libfdt/fdt_check.c b/xen/common/libfdt/fdt_check.c
new file mode 100644
index 0000000..fa410a8
--- /dev/null
+++ b/xen/common/libfdt/fdt_check.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * libfdt - Flat Device Tree manipulation
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
+ */
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+int fdt_check_full(const void *fdt, size_t bufsize)
+{
+	int err;
+	int num_memrsv;
+	int offset, nextoffset = 0;
+	uint32_t tag;
+	unsigned int depth = 0;
+	const void *prop;
+	const char *propname;
+	bool expect_end = false;
+
+	if (bufsize < FDT_V1_SIZE)
+		return -FDT_ERR_TRUNCATED;
+	if (bufsize < fdt_header_size(fdt))
+		return -FDT_ERR_TRUNCATED;
+	err = fdt_check_header(fdt);
+	if (err != 0)
+		return err;
+	if (bufsize < fdt_totalsize(fdt))
+		return -FDT_ERR_TRUNCATED;
+
+	num_memrsv = fdt_num_mem_rsv(fdt);
+	if (num_memrsv < 0)
+		return num_memrsv;
+
+	while (1) {
+		offset = nextoffset;
+		tag = fdt_next_tag(fdt, offset, &nextoffset);
+
+		if (nextoffset < 0)
+			return nextoffset;
+
+		/* If we see two root nodes, something is wrong */
+		if (expect_end && tag != FDT_END)
+			return -FDT_ERR_BADSTRUCTURE;
+
+		switch (tag) {
+		case FDT_NOP:
+			break;
+
+		case FDT_END:
+			if (depth != 0)
+				return -FDT_ERR_BADSTRUCTURE;
+			return 0;
+
+		case FDT_BEGIN_NODE:
+			depth++;
+			if (depth > INT_MAX)
+				return -FDT_ERR_BADSTRUCTURE;
+
+			/* The root node must have an empty name */
+			if (depth == 1) {
+				const char *name;
+				int len;
+
+				name = fdt_get_name(fdt, offset, &len);
+				if (*name || len)
+					return -FDT_ERR_BADSTRUCTURE;
+			}
+			break;
+
+		case FDT_END_NODE:
+			if (depth == 0)
+				return -FDT_ERR_BADSTRUCTURE;
+			depth--;
+			if (depth == 0)
+				expect_end = true;
+			break;
+
+		case FDT_PROP:
+			prop = fdt_getprop_by_offset(fdt, offset, &propname,
+						     &err);
+			if (!prop)
+				return err;
+			break;
+
+		default:
+			return -FDT_ERR_INTERNAL;
+		}
+	}
+}
diff --git a/xen/common/libfdt/fdt_empty_tree.c b/xen/common/libfdt/fdt_empty_tree.c
index d505611..49d54d4 100644
--- a/xen/common/libfdt/fdt_empty_tree.c
+++ b/xen/common/libfdt/fdt_empty_tree.c
@@ -1,50 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2012 David Gibson, IBM Corporation.
- *
- * libfdt is dual licensed: you can use it either under the terms of
- * the GPL, or the BSD license, at your option.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Alternatively,
- *
- *  b) Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *     1. Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *     2. Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
- *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
- *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
- *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
- *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include "libfdt_env.h"
 
@@ -79,4 +36,3 @@ int fdt_create_empty_tree(void *buf, int bufsize)
 
 	return fdt_open_into(buf, buf, bufsize);
 }
-
diff --git a/xen/common/libfdt/fdt_overlay.c b/xen/common/libfdt/fdt_overlay.c
new file mode 100644
index 0000000..d217e79
--- /dev/null
+++ b/xen/common/libfdt/fdt_overlay.c
@@ -0,0 +1,882 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
+/*
+ * libfdt - Flat Device Tree manipulation
+ * Copyright (C) 2016 Free Electrons
+ * Copyright (C) 2016 NextThing Co.
+ */
+#include "libfdt_env.h"
+
+#include <fdt.h>
+#include <libfdt.h>
+
+#include "libfdt_internal.h"
+
+/**
+ * overlay_get_target_phandle - retrieves the target phandle of a fragment
+ * @fdto: pointer to the device tree overlay blob
+ * @fragment: node offset of the fragment in the overlay
+ *
+ * overlay_get_target_phandle() retrieves the target phandle of an
+ * overlay fragment when that fragment uses a phandle (target
+ * property) instead of a path (target-path property).
+ *
+ * returns:
+ *      the phandle pointed by the target property
+ *      0, if the phandle was not found
+ *	-1, if the phandle was malformed
+ */
+static uint32_t overlay_get_target_phandle(const void *fdto, int fragment)
+{
+	const fdt32_t *val;
+	int len;
+
+	val = fdt_getprop(fdto, fragment, "target", &len);
+	if (!val)
+		return 0;
+
+	if ((len != sizeof(*val)) || (fdt32_to_cpu(*val) == (uint32_t)-1))
+		return (uint32_t)-1;
+
+	return fdt32_to_cpu(*val);
+}
+
+/**
+ * overlay_get_target - retrieves the offset of a fragment's target
+ * @fdt: Base device tree blob
+ * @fdto: Device tree overlay blob
+ * @fragment: node offset of the fragment in the overlay
+ * @pathp: pointer which receives the path of the target (or NULL)
+ *
+ * overlay_get_target() retrieves the target offset in the base
+ * device tree of a fragment, no matter how the actual targeting is
+ * done (through a phandle or a path)
+ *
+ * returns:
+ *      the targeted node offset in the base device tree
+ *      Negative error code on error
+ */
+static int overlay_get_target(const void *fdt, const void *fdto,
+			      int fragment, char const **pathp)
+{
+	uint32_t phandle;
+	const char *path = NULL;
+	int path_len = 0, ret;
+
+	/* Try first to do a phandle based lookup */
+	phandle = overlay_get_target_phandle(fdto, fragment);
+	if (phandle == (uint32_t)-1)
+		return -FDT_ERR_BADPHANDLE;
+
+	/* no phandle, try path */
+	if (!phandle) {
+		/* And then a path based lookup */
+		path = fdt_getprop(fdto, fragment, "target-path", &path_len);
+		if (path)
+			ret = fdt_path_offset(fdt, path);
+		else
+			ret = path_len;
+	} else
+		ret = fdt_node_offset_by_phandle(fdt, phandle);
+
+	/*
+	* If we haven't found either a target or a
+	* target-path property in a node that contains a
+	* __overlay__ subnode (we wouldn't be called
+	* otherwise), consider it a improperly written
+	* overlay
+	*/
+	if (ret < 0 && path_len == -FDT_ERR_NOTFOUND)
+		ret = -FDT_ERR_BADOVERLAY;
+
+	/* return on error */
+	if (ret < 0)
+		return ret;
+
+	/* return pointer to path (if available) */
+	if (pathp)
+		*pathp = path ? path : NULL;
+
+	return ret;
+}
+
+/**
+ * overlay_phandle_add_offset - Increases a phandle by an offset
+ * @fdt: Base device tree blob
+ * @node: Device tree overlay blob
+ * @name: Name of the property to modify (phandle or linux,phandle)
+ * @delta: offset to apply
+ *
+ * overlay_phandle_add_offset() increments a node phandle by a given
+ * offset.
+ *
+ * returns:
+ *      0 on success.
+ *      Negative error code on error
+ */
+static int overlay_phandle_add_offset(void *fdt, int node,
+				      const char *name, uint32_t delta)
+{
+	const fdt32_t *val;
+	uint32_t adj_val;
+	int len;
+
+	val = fdt_getprop(fdt, node, name, &len);
+	if (!val)
+		return len;
+
+	if (len != sizeof(*val))
+		return -FDT_ERR_BADPHANDLE;
+
+	adj_val = fdt32_to_cpu(*val);
+	if ((adj_val + delta) < adj_val)
+		return -FDT_ERR_NOPHANDLES;
+
+	adj_val += delta;
+	if (adj_val == (uint32_t)-1)
+		return -FDT_ERR_NOPHANDLES;
+
+	return fdt_setprop_inplace_u32(fdt, node, name, adj_val);
+}
+
+/**
+ * overlay_adjust_node_phandles - Offsets the phandles of a node
+ * @fdto: Device tree overlay blob
+ * @node: Offset of the node we want to adjust
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_adjust_node_phandles() adds a constant to all the phandles
+ * of a given node. This is mainly use as part of the overlay
+ * application process, when we want to update all the overlay
+ * phandles to not conflict with the overlays of the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_adjust_node_phandles(void *fdto, int node,
+					uint32_t delta)
+{
+	int child;
+	int ret;
+
+	ret = overlay_phandle_add_offset(fdto, node, "phandle", delta);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+
+	ret = overlay_phandle_add_offset(fdto, node, "linux,phandle", delta);
+	if (ret && ret != -FDT_ERR_NOTFOUND)
+		return ret;
+
+	fdt_for_each_subnode(child, fdto, node) {
+		ret = overlay_adjust_node_phandles(fdto, child, delta);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_adjust_local_phandles - Adjust the phandles of a whole overlay
+ * @fdto: Device tree overlay blob
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_adjust_local_phandles() adds a constant to all the
+ * phandles of an overlay. This is mainly use as part of the overlay
+ * application process, when we want to update all the overlay
+ * phandles to not conflict with the overlays of the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
+{
+	/*
+	 * Start adjusting the phandles from the overlay root
+	 */
+	return overlay_adjust_node_phandles(fdto, 0, delta);
+}
+
+/**
+ * overlay_update_local_node_references - Adjust the overlay references
+ * @fdto: Device tree overlay blob
+ * @tree_node: Node offset of the node to operate on
+ * @fixup_node: Node offset of the matching local fixups node
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_update_local_nodes_references() update the phandles
+ * pointing to a node within the device tree overlay by adding a
+ * constant delta.
+ *
+ * This is mainly used as part of a device tree application process,
+ * where you want the device tree overlays phandles to not conflict
+ * with the ones from the base device tree before merging them.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_update_local_node_references(void *fdto,
+						int tree_node,
+						int fixup_node,
+						uint32_t delta)
+{
+	int fixup_prop;
+	int fixup_child;
+	int ret;
+
+	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
+		const fdt32_t *fixup_val;
+		const char *tree_val;
+		const char *name;
+		int fixup_len;
+		int tree_len;
+		int i;
+
+		fixup_val = fdt_getprop_by_offset(fdto, fixup_prop,
+						  &name, &fixup_len);
+		if (!fixup_val)
+			return fixup_len;
+
+		if (fixup_len % sizeof(uint32_t))
+			return -FDT_ERR_BADOVERLAY;
+		fixup_len /= sizeof(uint32_t);
+
+		tree_val = fdt_getprop(fdto, tree_node, name, &tree_len);
+		if (!tree_val) {
+			if (tree_len == -FDT_ERR_NOTFOUND)
+				return -FDT_ERR_BADOVERLAY;
+
+			return tree_len;
+		}
+
+		for (i = 0; i < fixup_len; i++) {
+			fdt32_t adj_val;
+			uint32_t poffset;
+
+			poffset = fdt32_to_cpu(fixup_val[i]);
+
+			/*
+			 * phandles to fixup can be unaligned.
+			 *
+			 * Use a memcpy for the architectures that do
+			 * not support unaligned accesses.
+			 */
+			memcpy(&adj_val, tree_val + poffset, sizeof(adj_val));
+
+			adj_val = cpu_to_fdt32(fdt32_to_cpu(adj_val) + delta);
+
+			ret = fdt_setprop_inplace_namelen_partial(fdto,
+								  tree_node,
+								  name,
+								  strlen(name),
+								  poffset,
+								  &adj_val,
+								  sizeof(adj_val));
+			if (ret == -FDT_ERR_NOSPACE)
+				return -FDT_ERR_BADOVERLAY;
+
+			if (ret)
+				return ret;
+		}
+	}
+
+	fdt_for_each_subnode(fixup_child, fdto, fixup_node) {
+		const char *fixup_child_name = fdt_get_name(fdto, fixup_child,
+							    NULL);
+		int tree_child;
+
+		tree_child = fdt_subnode_offset(fdto, tree_node,
+						fixup_child_name);
+		if (tree_child == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_BADOVERLAY;
+		if (tree_child < 0)
+			return tree_child;
+
+		ret = overlay_update_local_node_references(fdto,
+							   tree_child,
+							   fixup_child,
+							   delta);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_update_local_references - Adjust the overlay references
+ * @fdto: Device tree overlay blob
+ * @delta: Offset to shift the phandles of
+ *
+ * overlay_update_local_references() update all the phandles pointing
+ * to a node within the device tree overlay by adding a constant
+ * delta to not conflict with the base overlay.
+ *
+ * This is mainly used as part of a device tree application process,
+ * where you want the device tree overlays phandles to not conflict
+ * with the ones from the base device tree before merging them.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_update_local_references(void *fdto, uint32_t delta)
+{
+	int fixups;
+
+	fixups = fdt_path_offset(fdto, "/__local_fixups__");
+	if (fixups < 0) {
+		/* There's no local phandles to adjust, bail out */
+		if (fixups == -FDT_ERR_NOTFOUND)
+			return 0;
+
+		return fixups;
+	}
+
+	/*
+	 * Update our local references from the root of the tree
+	 */
+	return overlay_update_local_node_references(fdto, 0, fixups,
+						    delta);
+}
+
+/**
+ * overlay_fixup_one_phandle - Set an overlay phandle to the base one
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @symbols_off: Node offset of the symbols node in the base device tree
+ * @path: Path to a node holding a phandle in the overlay
+ * @path_len: number of path characters to consider
+ * @name: Name of the property holding the phandle reference in the overlay
+ * @name_len: number of name characters to consider
+ * @poffset: Offset within the overlay property where the phandle is stored
+ * @label: Label of the node referenced by the phandle
+ *
+ * overlay_fixup_one_phandle() resolves an overlay phandle pointing to
+ * a node in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when
+ * you want all the phandles in the overlay to point to the actual
+ * base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_one_phandle(void *fdt, void *fdto,
+				     int symbols_off,
+				     const char *path, uint32_t path_len,
+				     const char *name, uint32_t name_len,
+				     int poffset, const char *label)
+{
+	const char *symbol_path;
+	uint32_t phandle;
+	fdt32_t phandle_prop;
+	int symbol_off, fixup_off;
+	int prop_len;
+
+	if (symbols_off < 0)
+		return symbols_off;
+
+	symbol_path = fdt_getprop(fdt, symbols_off, label,
+				  &prop_len);
+	if (!symbol_path)
+		return prop_len;
+
+	symbol_off = fdt_path_offset(fdt, symbol_path);
+	if (symbol_off < 0)
+		return symbol_off;
+
+	phandle = fdt_get_phandle(fdt, symbol_off);
+	if (!phandle)
+		return -FDT_ERR_NOTFOUND;
+
+	fixup_off = fdt_path_offset_namelen(fdto, path, path_len);
+	if (fixup_off == -FDT_ERR_NOTFOUND)
+		return -FDT_ERR_BADOVERLAY;
+	if (fixup_off < 0)
+		return fixup_off;
+
+	phandle_prop = cpu_to_fdt32(phandle);
+	return fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
+						   name, name_len, poffset,
+						   &phandle_prop,
+						   sizeof(phandle_prop));
+};
+
+/**
+ * overlay_fixup_phandle - Set an overlay phandle to the base one
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ * @symbols_off: Node offset of the symbols node in the base device tree
+ * @property: Property offset in the overlay holding the list of fixups
+ *
+ * overlay_fixup_phandle() resolves all the overlay phandles pointed
+ * to in a __fixups__ property, and updates them to match the phandles
+ * in use in the base device tree.
+ *
+ * This is part of the device tree overlay application process, when
+ * you want all the phandles in the overlay to point to the actual
+ * base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
+				 int property)
+{
+	const char *value;
+	const char *label;
+	int len;
+
+	value = fdt_getprop_by_offset(fdto, property,
+				      &label, &len);
+	if (!value) {
+		if (len == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_INTERNAL;
+
+		return len;
+	}
+
+	do {
+		const char *path, *name, *fixup_end;
+		const char *fixup_str = value;
+		uint32_t path_len, name_len;
+		uint32_t fixup_len;
+		char *sep, *endptr;
+		int poffset, ret;
+
+		fixup_end = memchr(value, '\0', len);
+		if (!fixup_end)
+			return -FDT_ERR_BADOVERLAY;
+		fixup_len = fixup_end - fixup_str;
+
+		len -= fixup_len + 1;
+		value += fixup_len + 1;
+
+		path = fixup_str;
+		sep = memchr(fixup_str, ':', fixup_len);
+		if (!sep || *sep != ':')
+			return -FDT_ERR_BADOVERLAY;
+
+		path_len = sep - path;
+		if (path_len == (fixup_len - 1))
+			return -FDT_ERR_BADOVERLAY;
+
+		fixup_len -= path_len + 1;
+		name = sep + 1;
+		sep = memchr(name, ':', fixup_len);
+		if (!sep || *sep != ':')
+			return -FDT_ERR_BADOVERLAY;
+
+		name_len = sep - name;
+		if (!name_len)
+			return -FDT_ERR_BADOVERLAY;
+
+		poffset = strtoul(sep + 1, &endptr, 10);
+		if ((*endptr != '\0') || (endptr <= (sep + 1)))
+			return -FDT_ERR_BADOVERLAY;
+
+		ret = overlay_fixup_one_phandle(fdt, fdto, symbols_off,
+						path, path_len, name, name_len,
+						poffset, label);
+		if (ret)
+			return ret;
+	} while (len > 0);
+
+	return 0;
+}
+
+/**
+ * overlay_fixup_phandles - Resolve the overlay phandles to the base
+ *                          device tree
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_fixup_phandles() resolves all the overlay phandles pointing
+ * to nodes in the base device tree.
+ *
+ * This is one of the steps of the device tree overlay application
+ * process, when you want all the phandles in the overlay to point to
+ * the actual base dt nodes.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_fixup_phandles(void *fdt, void *fdto)
+{
+	int fixups_off, symbols_off;
+	int property;
+
+	/* We can have overlays without any fixups */
+	fixups_off = fdt_path_offset(fdto, "/__fixups__");
+	if (fixups_off == -FDT_ERR_NOTFOUND)
+		return 0; /* nothing to do */
+	if (fixups_off < 0)
+		return fixups_off;
+
+	/* And base DTs without symbols */
+	symbols_off = fdt_path_offset(fdt, "/__symbols__");
+	if ((symbols_off < 0 && (symbols_off != -FDT_ERR_NOTFOUND)))
+		return symbols_off;
+
+	fdt_for_each_property_offset(property, fdto, fixups_off) {
+		int ret;
+
+		ret = overlay_fixup_phandle(fdt, fdto, symbols_off, property);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_apply_node - Merges a node into the base device tree
+ * @fdt: Base Device Tree blob
+ * @target: Node offset in the base device tree to apply the fragment to
+ * @fdto: Device tree overlay blob
+ * @node: Node offset in the overlay holding the changes to merge
+ *
+ * overlay_apply_node() merges a node into a target base device tree
+ * node pointed.
+ *
+ * This is part of the final step in the device tree overlay
+ * application process, when all the phandles have been adjusted and
+ * resolved and you just have to merge overlay into the base device
+ * tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_apply_node(void *fdt, int target,
+			      void *fdto, int node)
+{
+	int property;
+	int subnode;
+
+	fdt_for_each_property_offset(property, fdto, node) {
+		const char *name;
+		const void *prop;
+		int prop_len;
+		int ret;
+
+		prop = fdt_getprop_by_offset(fdto, property, &name,
+					     &prop_len);
+		if (prop_len == -FDT_ERR_NOTFOUND)
+			return -FDT_ERR_INTERNAL;
+		if (prop_len < 0)
+			return prop_len;
+
+		ret = fdt_setprop(fdt, target, name, prop, prop_len);
+		if (ret)
+			return ret;
+	}
+
+	fdt_for_each_subnode(subnode, fdto, node) {
+		const char *name = fdt_get_name(fdto, subnode, NULL);
+		int nnode;
+		int ret;
+
+		nnode = fdt_add_subnode(fdt, target, name);
+		if (nnode == -FDT_ERR_EXISTS) {
+			nnode = fdt_subnode_offset(fdt, target, name);
+			if (nnode == -FDT_ERR_NOTFOUND)
+				return -FDT_ERR_INTERNAL;
+		}
+
+		if (nnode < 0)
+			return nnode;
+
+		ret = overlay_apply_node(fdt, nnode, fdto, subnode);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * overlay_merge - Merge an overlay into its base device tree
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_merge() merges an overlay into its base device tree.
+ *
+ * This is the next to last step in the device tree overlay application
+ * process, when all the phandles have been adjusted and resolved and
+ * you just have to merge overlay into the base device tree.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_merge(void *fdt, void *fdto)
+{
+	int fragment;
+
+	fdt_for_each_subnode(fragment, fdto, 0) {
+		int overlay;
+		int target;
+		int ret;
+
+		/*
+		 * Each fragments will have an __overlay__ node. If
+		 * they don't, it's not supposed to be merged
+		 */
+		overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
+		if (overlay == -FDT_ERR_NOTFOUND)
+			continue;
+
+		if (overlay < 0)
+			return overlay;
+
+		target = overlay_get_target(fdt, fdto, fragment, NULL);
+		if (target < 0)
+			return target;
+
+		ret = overlay_apply_node(fdt, target, fdto, overlay);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int get_path_len(const void *fdt, int nodeoffset)
+{
+	int len = 0, namelen;
+	const char *name;
+
+	FDT_RO_PROBE(fdt);
+
+	for (;;) {
+		name = fdt_get_name(fdt, nodeoffset, &namelen);
+		if (!name)
+			return namelen;
+
+		/* root? we're done */
+		if (namelen == 0)
+			break;
+
+		nodeoffset = fdt_parent_offset(fdt, nodeoffset);
+		if (nodeoffset < 0)
+			return nodeoffset;
+		len += namelen + 1;
+	}
+
+	/* in case of root pretend it's "/" */
+	if (len == 0)
+		len++;
+	return len;
+}
+
+/**
+ * overlay_symbol_update - Update the symbols of base tree after a merge
+ * @fdt: Base Device Tree blob
+ * @fdto: Device tree overlay blob
+ *
+ * overlay_symbol_update() updates the symbols of the base tree with the
+ * symbols of the applied overlay
+ *
+ * This is the last step in the device tree overlay application
+ * process, allowing the reference of overlay symbols by subsequent
+ * overlay operations.
+ *
+ * returns:
+ *      0 on success
+ *      Negative error code on failure
+ */
+static int overlay_symbol_update(void *fdt, void *fdto)
+{
+	int root_sym, ov_sym, prop, path_len, fragment, target;
+	int len, frag_name_len, ret, rel_path_len;
+	const char *s, *e;
+	const char *path;
+	const char *name;
+	const char *frag_name;
+	const char *rel_path;
+	const char *target_path;
+	char *buf;
+	void *p;
+
+	ov_sym = fdt_subnode_offset(fdto, 0, "__symbols__");
+
+	/* if no overlay symbols exist no problem */
+	if (ov_sym < 0)
+		return 0;
+
+	root_sym = fdt_subnode_offset(fdt, 0, "__symbols__");
+
+	/* it no root symbols exist we should create them */
+	if (root_sym == -FDT_ERR_NOTFOUND)
+		root_sym = fdt_add_subnode(fdt, 0, "__symbols__");
+
+	/* any error is fatal now */
+	if (root_sym < 0)
+		return root_sym;
+
+	/* iterate over each overlay symbol */
+	fdt_for_each_property_offset(prop, fdto, ov_sym) {
+		path = fdt_getprop_by_offset(fdto, prop, &name, &path_len);
+		if (!path)
+			return path_len;
+
+		/* verify it's a string property (terminated by a single \0) */
+		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
+			return -FDT_ERR_BADVALUE;
+
+		/* keep end marker to avoid strlen() */
+		e = path + path_len;
+
+		if (*path != '/')
+			return -FDT_ERR_BADVALUE;
+
+		/* get fragment name first */
+		s = strchr(path + 1, '/');
+		if (!s) {
+			/* Symbol refers to something that won't end
+			 * up in the target tree */
+			continue;
+		}
+
+		frag_name = path + 1;
+		frag_name_len = s - path - 1;
+
+		/* verify format; safe since "s" lies in \0 terminated prop */
+		len = sizeof("/__overlay__/") - 1;
+		if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
+			/* /<fragment-name>/__overlay__/<relative-subnode-path> */
+			rel_path = s + len;
+			rel_path_len = e - rel_path - 1;
+		} else if ((e - s) == len
+			   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
+			/* /<fragment-name>/__overlay__ */
+			rel_path = "";
+			rel_path_len = 0;
+		} else {
+			/* Symbol refers to something that won't end
+			 * up in the target tree */
+			continue;
+		}
+
+		/* find the fragment index in which the symbol lies */
+		ret = fdt_subnode_offset_namelen(fdto, 0, frag_name,
+					       frag_name_len);
+		/* not found? */
+		if (ret < 0)
+			return -FDT_ERR_BADOVERLAY;
+		fragment = ret;
+
+		/* an __overlay__ subnode must exist */
+		ret = fdt_subnode_offset(fdto, fragment, "__overlay__");
+		if (ret < 0)
+			return -FDT_ERR_BADOVERLAY;
+
+		/* get the target of the fragment */
+		ret = overlay_get_target(fdt, fdto, fragment, &target_path);
+		if (ret < 0)
+			return ret;
+		target = ret;
+
+		/* if we have a target path use */
+		if (!target_path) {
+			ret = get_path_len(fdt, target);
+			if (ret < 0)
+				return ret;
+			len = ret;
+		} else {
+			len = strlen(target_path);
+		}
+
+		ret = fdt_setprop_placeholder(fdt, root_sym, name,
+				len + (len > 1) + rel_path_len + 1, &p);
+		if (ret < 0)
+			return ret;
+
+		if (!target_path) {
+			/* again in case setprop_placeholder changed it */
+			ret = overlay_get_target(fdt, fdto, fragment, &target_path);
+			if (ret < 0)
+				return ret;
+			target = ret;
+		}
+
+		buf = p;
+		if (len > 1) { /* target is not root */
+			if (!target_path) {
+				ret = fdt_get_path(fdt, target, buf, len + 1);
+				if (ret < 0)
+					return ret;
+			} else
+				memcpy(buf, target_path, len + 1);
+
+		} else
+			len--;
+
+		buf[len] = '/';
+		memcpy(buf + len + 1, rel_path, rel_path_len);
+		buf[len + 1 + rel_path_len] = '\0';
+	}
+
+	return 0;
+}
+
+int fdt_overlay_apply(void *fdt, void *fdto)
+{
+	uint32_t delta;
+	int ret;
+
+	FDT_RO_PROBE(fdt);
+	FDT_RO_PROBE(fdto);
+
+	ret = fdt_find_max_phandle(fdt, &delta);
+	if (ret)
+		goto err;
+
+	ret = overlay_adjust_local_phandles(fdto, delta);
+	if (ret)
+		goto err;
+
+	ret = overlay_update_local_references(fdto, delta);
+	if (ret)
+		goto err;
+
+	ret = overlay_fixup_phandles(fdt, fdto);
+	if (ret)
+		goto err;
+
+	ret = overlay_merge(fdt, fdto);
+	if (ret)
+		goto err;
+
+	ret = overlay_symbol_update(fdt, fdto);
+	if (ret)
+		goto err;
+
+	/*
+	 * The overlay has been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	return 0;
+
+err:
+	/*
+	 * The overlay might have been damaged, erase its magic.
+	 */
+	fdt_set_magic(fdto, ~0);
+
+	/*
+	 * The base device tree might have been damaged, erase its
+	 * magic.
+	 */
+	fdt_set_magic(fdt, ~0);
+
+	return ret;
+}
diff --git a/xen/common/libfdt/fdt_ro.c b/xen/common/libfdt/fdt_ro.c
index 36f9b48..17584da 100644
--- a/xen/common/libfdt/fdt_ro.c
+++ b/xen/common/libfdt/fdt_ro.c
@@ -1,50 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
- *
- * libfdt is dual licensed: you can use it either under the terms of
- * the GPL, or the BSD license, at your option.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Alternatively,
- *
- *  b) Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *     1. Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *     2. Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
- *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
- *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
- *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
- *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include "libfdt_env.h"
 
@@ -53,12 +10,13 @@
 
 #include "libfdt_internal.h"
 
-static int _fdt_nodename_eq(const void *fdt, int offset,
+static int fdt_nodename_eq_(const void *fdt, int offset,
 			    const char *s, int len)
 {
-	const char *p = fdt_offset_ptr(fdt, offset + FDT_TAGSIZE, len+1);
+	int olen;
+	const char *p = fdt_get_name(fdt, offset, &olen);
 
-	if (! p)
+	if (!p || olen < len)
 		/* short match */
 		return 0;
 
@@ -73,37 +31,174 @@ static int _fdt_nodename_eq(const void *fdt, int offset,
 		return 0;
 }
 
+const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
+{
+	int32_t totalsize;
+	uint32_t absoffset;
+	size_t len;
+	int err;
+	const char *s, *n;
+
+	if (can_assume(VALID_INPUT)) {
+		s = (const char *)fdt + fdt_off_dt_strings(fdt) + stroffset;
+
+		if (lenp)
+			*lenp = strlen(s);
+		return s;
+	}
+	totalsize = fdt_ro_probe_(fdt);
+	err = totalsize;
+	if (totalsize < 0)
+		goto fail;
+
+	err = -FDT_ERR_BADOFFSET;
+	absoffset = stroffset + fdt_off_dt_strings(fdt);
+	if (absoffset >= (unsigned)totalsize)
+		goto fail;
+	len = totalsize - absoffset;
+
+	if (fdt_magic(fdt) == FDT_MAGIC) {
+		if (stroffset < 0)
+			goto fail;
+		if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
+			if ((unsigned)stroffset >= fdt_size_dt_strings(fdt))
+				goto fail;
+			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
+				len = fdt_size_dt_strings(fdt) - stroffset;
+		}
+	} else if (fdt_magic(fdt) == FDT_SW_MAGIC) {
+		unsigned int sw_stroffset = -stroffset;
+
+		if ((stroffset >= 0) ||
+		    (sw_stroffset > fdt_size_dt_strings(fdt)))
+			goto fail;
+		if (sw_stroffset < len)
+			len = sw_stroffset;
+	} else {
+		err = -FDT_ERR_INTERNAL;
+		goto fail;
+	}
+
+	s = (const char *)fdt + absoffset;
+	n = memchr(s, '\0', len);
+	if (!n) {
+		/* missing terminating NULL */
+		err = -FDT_ERR_TRUNCATED;
+		goto fail;
+	}
+
+	if (lenp)
+		*lenp = n - s;
+	return s;
+
+fail:
+	if (lenp)
+		*lenp = err;
+	return NULL;
+}
+
 const char *fdt_string(const void *fdt, int stroffset)
 {
-	return (const char *)fdt + fdt_off_dt_strings(fdt) + stroffset;
+	return fdt_get_string(fdt, stroffset, NULL);
 }
 
-static int _fdt_string_eq(const void *fdt, int stroffset,
+static int fdt_string_eq_(const void *fdt, int stroffset,
 			  const char *s, int len)
 {
-	const char *p = fdt_string(fdt, stroffset);
+	int slen;
+	const char *p = fdt_get_string(fdt, stroffset, &slen);
+
+	return p && (slen == len) && (memcmp(p, s, len) == 0);
+}
+
+int fdt_find_max_phandle(const void *fdt, uint32_t *phandle)
+{
+	uint32_t max = 0;
+	int offset = -1;
+
+	while (true) {
+		uint32_t value;
+
+		offset = fdt_next_node(fdt, offset, NULL);
+		if (offset < 0) {
+			if (offset == -FDT_ERR_NOTFOUND)
+				break;
+
+			return offset;
+		}
+
+		value = fdt_get_phandle(fdt, offset);
+
+		if (value > max)
+			max = value;
+	}
+
+	if (phandle)
+		*phandle = max;
+
+	return 0;
+}
+
+int fdt_generate_phandle(const void *fdt, uint32_t *phandle)
+{
+	uint32_t max;
+	int err;
+
+	err = fdt_find_max_phandle(fdt, &max);
+	if (err < 0)
+		return err;
+
+	if (max == FDT_MAX_PHANDLE)
+		return -FDT_ERR_NOPHANDLES;
+
+	if (phandle)
+		*phandle = max + 1;
+
+	return 0;
+}
 
-	return (strlen(p) == len) && (memcmp(p, s, len) == 0);
+static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int n)
+{
+	unsigned int offset = n * sizeof(struct fdt_reserve_entry);
+	unsigned int absoffset = fdt_off_mem_rsvmap(fdt) + offset;
+
+	if (!can_assume(VALID_INPUT)) {
+		if (absoffset < fdt_off_mem_rsvmap(fdt))
+			return NULL;
+		if (absoffset > fdt_totalsize(fdt) -
+		    sizeof(struct fdt_reserve_entry))
+			return NULL;
+	}
+	return fdt_mem_rsv_(fdt, n);
 }
 
 int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size)
 {
-	FDT_CHECK_HEADER(fdt);
-	*address = fdt64_to_cpu(_fdt_mem_rsv(fdt, n)->address);
-	*size = fdt64_to_cpu(_fdt_mem_rsv(fdt, n)->size);
+	const struct fdt_reserve_entry *re;
+
+	FDT_RO_PROBE(fdt);
+	re = fdt_mem_rsv(fdt, n);
+	if (!can_assume(VALID_INPUT) && !re)
+		return -FDT_ERR_BADOFFSET;
+
+	*address = fdt64_ld_(&re->address);
+	*size = fdt64_ld_(&re->size);
 	return 0;
 }
 
 int fdt_num_mem_rsv(const void *fdt)
 {
-	int i = 0;
+	int i;
+	const struct fdt_reserve_entry *re;
 
-	while (fdt64_to_cpu(_fdt_mem_rsv(fdt, i)->size) != 0)
-		i++;
-	return i;
+	for (i = 0; (re = fdt_mem_rsv(fdt, i)) != NULL; i++) {
+		if (fdt64_ld_(&re->size) == 0)
+			return i;
+	}
+	return -FDT_ERR_TRUNCATED;
 }
 
-static int _nextprop(const void *fdt, int offset)
+static int nextprop_(const void *fdt, int offset)
 {
 	uint32_t tag;
 	int nextoffset;
@@ -132,13 +227,13 @@ int fdt_subnode_offset_namelen(const void *fdt, int offset,
 {
 	int depth;
 
-	FDT_CHECK_HEADER(fdt);
+	FDT_RO_PROBE(fdt);
 
 	for (depth = 0;
 	     (offset >= 0) && (depth >= 0);
 	     offset = fdt_next_node(fdt, offset, &depth))
 		if ((depth == 1)
-		    && _fdt_nodename_eq(fdt, offset, name, namelen))
+		    && fdt_nodename_eq_(fdt, offset, name, namelen))
 			return offset;
 
 	if (depth < 0)
@@ -152,17 +247,17 @@ int fdt_subnode_offset(const void *fdt, int parentoffset,
 	return fdt_subnode_offset_namelen(fdt, parentoffset, name, strlen(name));
 }
 
-int fdt_path_offset(const void *fdt, const char *path)
+int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen)
 {
-	const char *end = path + strlen(path);
+	const char *end = path + namelen;
 	const char *p = path;
 	int offset = 0;
 
-	FDT_CHECK_HEADER(fdt);
+	FDT_RO_PROBE(fdt);
 
 	/* see if we have an alias */
 	if (*path != '/') {
-		const char *q = strchr(path, '/');
+		const char *q = memchr(path, '/', end - p);
 
 		if (!q)
 			q = end;
@@ -175,14 +270,15 @@ int fdt_path_offset(const void *fdt, const char *path)
 		p = q;
 	}
 
-	while (*p) {
+	while (p < end) {
 		const char *q;
 
-		while (*p == '/')
+		while (*p == '/') {
 			p++;
-		if (! *p)
-			return offset;
-		q = strchr(p, '/');
+			if (p == end)
+				return offset;
+		}
+		q = memchr(p, '/', end - p);
 		if (! q)
 			q = end;
 
@@ -196,19 +292,42 @@ int fdt_path_offset(const void *fdt, const char *path)
 	return offset;
 }
 
+int fdt_path_offset(const void *fdt, const char *path)
+{
+	return fdt_path_offset_namelen(fdt, path, strlen(path));
+}
+
 const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
 {
-	const struct fdt_node_header *nh = _fdt_offset_ptr(fdt, nodeoffset);
+	const struct fdt_node_header *nh = fdt_offset_ptr_(fdt, nodeoffset);
+	const char *nameptr;
 	int err;
 
-	if (((err = fdt_check_header(fdt)) != 0)
-	    || ((err = _fdt_check_node_offset(fdt, nodeoffset)) < 0))
+	if (((err = fdt_ro_probe_(fdt)) < 0)
+	    || ((err = fdt_check_node_offset_(fdt, nodeoffset)) < 0))
+			goto fail;
+
+	nameptr = nh->name;
+
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
+		/*
+		 * For old FDT versions, match the naming conventions of V16:
+		 * give only the leaf name (after all /). The actual tree
+		 * contents are loosely checked.
+		 */
+		const char *leaf;
+		leaf = strrchr(nameptr, '/');
+		if (leaf == NULL) {
+			err = -FDT_ERR_BADSTRUCTURE;
 			goto fail;
+		}
+		nameptr = leaf+1;
+	}
 
 	if (len)
-		*len = strlen(nh->name);
+		*len = strlen(nameptr);
 
-	return nh->name;
+	return nameptr;
 
  fail:
 	if (len)
@@ -220,58 +339,81 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset)
 {
 	int offset;
 
-	if ((offset = _fdt_check_node_offset(fdt, nodeoffset)) < 0)
+	if ((offset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
 		return offset;
 
-	return _nextprop(fdt, offset);
+	return nextprop_(fdt, offset);
 }
 
 int fdt_next_property_offset(const void *fdt, int offset)
 {
-	if ((offset = _fdt_check_prop_offset(fdt, offset)) < 0)
+	if ((offset = fdt_check_prop_offset_(fdt, offset)) < 0)
 		return offset;
 
-	return _nextprop(fdt, offset);
+	return nextprop_(fdt, offset);
 }
 
-const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
-						      int offset,
-						      int *lenp)
+static const struct fdt_property *fdt_get_property_by_offset_(const void *fdt,
+						              int offset,
+						              int *lenp)
 {
 	int err;
 	const struct fdt_property *prop;
 
-	if ((err = _fdt_check_prop_offset(fdt, offset)) < 0) {
+	if (!can_assume(VALID_INPUT) &&
+	    (err = fdt_check_prop_offset_(fdt, offset)) < 0) {
 		if (lenp)
 			*lenp = err;
 		return NULL;
 	}
 
-	prop = _fdt_offset_ptr(fdt, offset);
+	prop = fdt_offset_ptr_(fdt, offset);
 
 	if (lenp)
-		*lenp = fdt32_to_cpu(prop->len);
+		*lenp = fdt32_ld_(&prop->len);
 
 	return prop;
 }
 
-const struct fdt_property *fdt_get_property_namelen(const void *fdt,
-						    int offset,
-						    const char *name,
-						    int namelen, int *lenp)
+const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
+						      int offset,
+						      int *lenp)
+{
+	/* Prior to version 16, properties may need realignment
+	 * and this API does not work. fdt_getprop_*() will, however. */
+
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
+		if (lenp)
+			*lenp = -FDT_ERR_BADVERSION;
+		return NULL;
+	}
+
+	return fdt_get_property_by_offset_(fdt, offset, lenp);
+}
+
+static const struct fdt_property *fdt_get_property_namelen_(const void *fdt,
+						            int offset,
+						            const char *name,
+						            int namelen,
+							    int *lenp,
+							    int *poffset)
 {
 	for (offset = fdt_first_property_offset(fdt, offset);
 	     (offset >= 0);
 	     (offset = fdt_next_property_offset(fdt, offset))) {
 		const struct fdt_property *prop;
 
-		if (!(prop = fdt_get_property_by_offset(fdt, offset, lenp))) {
+		prop = fdt_get_property_by_offset_(fdt, offset, lenp);
+		if (!can_assume(LIBFDT_FLAWLESS) && !prop) {
 			offset = -FDT_ERR_INTERNAL;
 			break;
 		}
-		if (_fdt_string_eq(fdt, fdt32_to_cpu(prop->nameoff),
-				   name, namelen))
+		if (fdt_string_eq_(fdt, fdt32_ld_(&prop->nameoff),
+				   name, namelen)) {
+			if (poffset)
+				*poffset = offset;
 			return prop;
+		}
 	}
 
 	if (lenp)
@@ -279,6 +421,25 @@ const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 	return NULL;
 }
 
+
+const struct fdt_property *fdt_get_property_namelen(const void *fdt,
+						    int offset,
+						    const char *name,
+						    int namelen, int *lenp)
+{
+	/* Prior to version 16, properties may need realignment
+	 * and this API does not work. fdt_getprop_*() will, however. */
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
+		if (lenp)
+			*lenp = -FDT_ERR_BADVERSION;
+		return NULL;
+	}
+
+	return fdt_get_property_namelen_(fdt, offset, name, namelen, lenp,
+					 NULL);
+}
+
+
 const struct fdt_property *fdt_get_property(const void *fdt,
 					    int nodeoffset,
 					    const char *name, int *lenp)
@@ -290,12 +451,18 @@ const struct fdt_property *fdt_get_property(const void *fdt,
 const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 				const char *name, int namelen, int *lenp)
 {
+	int poffset;
 	const struct fdt_property *prop;
 
-	prop = fdt_get_property_namelen(fdt, nodeoffset, name, namelen, lenp);
-	if (! prop)
+	prop = fdt_get_property_namelen_(fdt, nodeoffset, name, namelen, lenp,
+					 &poffset);
+	if (!prop)
 		return NULL;
 
+	/* Handle realignment */
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
+	    (poffset + sizeof(*prop)) % 8 && fdt32_ld_(&prop->len) >= 8)
+		return prop->data + 4;
 	return prop->data;
 }
 
@@ -304,11 +471,31 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
 {
 	const struct fdt_property *prop;
 
-	prop = fdt_get_property_by_offset(fdt, offset, lenp);
+	prop = fdt_get_property_by_offset_(fdt, offset, lenp);
 	if (!prop)
 		return NULL;
-	if (namep)
-		*namep = fdt_string(fdt, fdt32_to_cpu(prop->nameoff));
+	if (namep) {
+		const char *name;
+		int namelen;
+
+		if (!can_assume(VALID_INPUT)) {
+			name = fdt_get_string(fdt, fdt32_ld_(&prop->nameoff),
+					      &namelen);
+			if (!name) {
+				if (lenp)
+					*lenp = namelen;
+				return NULL;
+			}
+			*namep = name;
+		} else {
+			*namep = fdt_string(fdt, fdt32_ld_(&prop->nameoff));
+		}
+	}
+
+	/* Handle realignment */
+	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
+	    (offset + sizeof(*prop)) % 8 && fdt32_ld_(&prop->len) >= 8)
+		return prop->data + 4;
 	return prop->data;
 }
 
@@ -332,7 +519,7 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
 			return 0;
 	}
 
-	return fdt32_to_cpu(*php);
+	return fdt32_ld_(php);
 }
 
 const char *fdt_get_alias_namelen(const void *fdt,
@@ -358,7 +545,7 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen)
 	int offset, depth, namelen;
 	const char *name;
 
-	FDT_CHECK_HEADER(fdt);
+	FDT_RO_PROBE(fdt);
 
 	if (buflen < 2)
 		return -FDT_ERR_NOSPACE;
@@ -410,7 +597,7 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
 	int offset, depth;
 	int supernodeoffset = -FDT_ERR_INTERNAL;
 
-	FDT_CHECK_HEADER(fdt);
+	FDT_RO_PROBE(fdt);
 
 	if (supernodedepth < 0)
 		return -FDT_ERR_NOTFOUND;
@@ -432,10 +619,12 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
 		}
 	}
 
-	if ((offset == -FDT_ERR_NOTFOUND) || (offset >= 0))
-		return -FDT_ERR_BADOFFSET;
-	else if (offset == -FDT_ERR_BADOFFSET)
-		return -FDT_ERR_BADSTRUCTURE;
+	if (!can_assume(VALID_INPUT)) {
+		if ((offset == -FDT_ERR_NOTFOUND) || (offset >= 0))
+			return -FDT_ERR_BADOFFSET;
+		else if (offset == -FDT_ERR_BADOFFSET)
+			return -FDT_ERR_BADSTRUCTURE;
+	}
 
 	return offset; /* error from fdt_next_node() */
 }
@@ -447,7 +636,8 @@ int fdt_node_depth(const void *fdt, int nodeoffset)
 
 	err = fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
 	if (err)
-		return (err < 0) ? err : -FDT_ERR_INTERNAL;
+		return (can_assume(LIBFDT_FLAWLESS) || err < 0) ? err :
+			-FDT_ERR_INTERNAL;
 	return nodedepth;
 }
 
@@ -469,7 +659,7 @@ int fdt_node_offset_by_prop_value(const void *fdt, int startoffset,
 	const void *val;
 	int len;
 
-	FDT_CHECK_HEADER(fdt);
+	FDT_RO_PROBE(fdt);
 
 	/* FIXME: The algorithm here is pretty horrible: we scan each
 	 * property of a node in fdt_getprop(), then if that didn't
@@ -492,10 +682,10 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
 {
 	int offset;
 
-	if ((phandle == 0) || (phandle == -1))
+	if ((phandle == 0) || (phandle == ~0U))
 		return -FDT_ERR_BADPHANDLE;
 
-	FDT_CHECK_HEADER(fdt);
+	FDT_RO_PROBE(fdt);
 
 	/* FIXME: The algorithm here is pretty horrible: we
 	 * potentially scan each property of a node in
@@ -530,6 +720,106 @@ int fdt_stringlist_contains(const char *strlist, int listlen, const char *str)
 	return 0;
 }
 
+int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property)
+{
+	const char *list, *end;
+	int length, count = 0;
+
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
+	if (!list)
+		return length;
+
+	end = list + length;
+
+	while (list < end) {
+		length = strnlen(list, end - list) + 1;
+
+		/* Abort if the last string isn't properly NUL-terminated. */
+		if (list + length > end)
+			return -FDT_ERR_BADVALUE;
+
+		list += length;
+		count++;
+	}
+
+	return count;
+}
+
+int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
+			  const char *string)
+{
+	int length, len, idx = 0;
+	const char *list, *end;
+
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
+	if (!list)
+		return length;
+
+	len = strlen(string) + 1;
+	end = list + length;
+
+	while (list < end) {
+		length = strnlen(list, end - list) + 1;
+
+		/* Abort if the last string isn't properly NUL-terminated. */
+		if (list + length > end)
+			return -FDT_ERR_BADVALUE;
+
+		if (length == len && memcmp(list, string, length) == 0)
+			return idx;
+
+		list += length;
+		idx++;
+	}
+
+	return -FDT_ERR_NOTFOUND;
+}
+
+const char *fdt_stringlist_get(const void *fdt, int nodeoffset,
+			       const char *property, int idx,
+			       int *lenp)
+{
+	const char *list, *end;
+	int length;
+
+	list = fdt_getprop(fdt, nodeoffset, property, &length);
+	if (!list) {
+		if (lenp)
+			*lenp = length;
+
+		return NULL;
+	}
+
+	end = list + length;
+
+	while (list < end) {
+		length = strnlen(list, end - list) + 1;
+
+		/* Abort if the last string isn't properly NUL-terminated. */
+		if (list + length > end) {
+			if (lenp)
+				*lenp = -FDT_ERR_BADVALUE;
+
+			return NULL;
+		}
+
+		if (idx == 0) {
+			if (lenp)
+				*lenp = length - 1;
+
+			return list;
+		}
+
+		list += length;
+		idx--;
+	}
+
+	if (lenp)
+		*lenp = -FDT_ERR_NOTFOUND;
+
+	return NULL;
+}
+
 int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 			      const char *compatible)
 {
@@ -539,10 +829,8 @@ int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 	prop = fdt_getprop(fdt, nodeoffset, "compatible", &len);
 	if (!prop)
 		return len;
-	if (fdt_stringlist_contains(prop, len, compatible))
-		return 0;
-	else
-		return 1;
+
+	return !fdt_stringlist_contains(prop, len, compatible);
 }
 
 int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
@@ -550,7 +838,7 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
 {
 	int offset, err;
 
-	FDT_CHECK_HEADER(fdt);
+	FDT_RO_PROBE(fdt);
 
 	/* FIXME: The algorithm here is pretty horrible: we scan each
 	 * property of a node in fdt_node_check_compatible(), then if
diff --git a/xen/common/libfdt/fdt_rw.c b/xen/common/libfdt/fdt_rw.c
index 8b8cd25..3621d36 100644
--- a/xen/common/libfdt/fdt_rw.c
+++ b/xen/common/libfdt/fdt_rw.c
@@ -1,50 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
- *
- * libfdt is dual licensed: you can use it either under the terms of
- * the GPL, or the BSD license, at your option.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Alternatively,
- *
- *  b) Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *     1. Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *     2. Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
- *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
- *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
- *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
- *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include "libfdt_env.h"
 
@@ -53,8 +10,8 @@
 
 #include "libfdt_internal.h"
 
-static int _fdt_blocks_misordered(const void *fdt,
-			      int mem_rsv_size, int struct_size)
+static int fdt_blocks_misordered_(const void *fdt,
+				  int mem_rsv_size, int struct_size)
 {
 	return (fdt_off_mem_rsvmap(fdt) < FDT_ALIGN(sizeof(struct fdt_header), 8))
 		|| (fdt_off_dt_struct(fdt) <
@@ -65,40 +22,44 @@ static int _fdt_blocks_misordered(const void *fdt,
 		    (fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt)));
 }
 
-static int _fdt_rw_check_header(void *fdt)
+static int fdt_rw_probe_(void *fdt)
 {
-	FDT_CHECK_HEADER(fdt);
+	if (can_assume(VALID_DTB))
+		return 0;
+	FDT_RO_PROBE(fdt);
 
-	if (fdt_version(fdt) < 17)
+	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
 		return -FDT_ERR_BADVERSION;
-	if (_fdt_blocks_misordered(fdt, sizeof(struct fdt_reserve_entry),
+	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
 				   fdt_size_dt_struct(fdt)))
 		return -FDT_ERR_BADLAYOUT;
-	if (fdt_version(fdt) > 17)
+	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
 		fdt_set_version(fdt, 17);
 
 	return 0;
 }
 
-#define FDT_RW_CHECK_HEADER(fdt) \
+#define FDT_RW_PROBE(fdt) \
 	{ \
-		int err; \
-		if ((err = _fdt_rw_check_header(fdt)) != 0) \
-			return err; \
+		int err_; \
+		if ((err_ = fdt_rw_probe_(fdt)) != 0) \
+			return err_; \
 	}
 
-static inline unsigned int _fdt_data_size(void *fdt)
+static inline unsigned int fdt_data_size_(void *fdt)
 {
 	return fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt);
 }
 
-static int _fdt_splice(void *fdt, void *splicepoint, int oldlen, int newlen)
+static int fdt_splice_(void *fdt, void *splicepoint, int oldlen, int newlen)
 {
 	char *p = splicepoint;
-	unsigned int dsize = _fdt_data_size(fdt);
+	unsigned int dsize = fdt_data_size_(fdt);
 	size_t soff = p - (char *)fdt;
 
-	if (oldlen < 0 || soff + oldlen < soff || soff + oldlen > dsize)
+	if ((oldlen < 0) || (soff + oldlen < soff) || (soff + oldlen > dsize))
+		return -FDT_ERR_BADOFFSET;
+	if ((p < (char *)fdt) || (dsize + newlen < (unsigned)oldlen))
 		return -FDT_ERR_BADOFFSET;
 	if (dsize - oldlen + newlen > fdt_totalsize(fdt))
 		return -FDT_ERR_NOSPACE;
@@ -106,12 +67,12 @@ static int _fdt_splice(void *fdt, void *splicepoint, int oldlen, int newlen)
 	return 0;
 }
 
-static int _fdt_splice_mem_rsv(void *fdt, struct fdt_reserve_entry *p,
+static int fdt_splice_mem_rsv_(void *fdt, struct fdt_reserve_entry *p,
 			       int oldn, int newn)
 {
 	int delta = (newn - oldn) * sizeof(*p);
 	int err;
-	err = _fdt_splice(fdt, p, oldn * sizeof(*p), newn * sizeof(*p));
+	err = fdt_splice_(fdt, p, oldn * sizeof(*p), newn * sizeof(*p));
 	if (err)
 		return err;
 	fdt_set_off_dt_struct(fdt, fdt_off_dt_struct(fdt) + delta);
@@ -119,13 +80,13 @@ static int _fdt_splice_mem_rsv(void *fdt, struct fdt_reserve_entry *p,
 	return 0;
 }
 
-static int _fdt_splice_struct(void *fdt, void *p,
+static int fdt_splice_struct_(void *fdt, void *p,
 			      int oldlen, int newlen)
 {
 	int delta = newlen - oldlen;
 	int err;
 
-	if ((err = _fdt_splice(fdt, p, oldlen, newlen)))
+	if ((err = fdt_splice_(fdt, p, oldlen, newlen)))
 		return err;
 
 	fdt_set_size_dt_struct(fdt, fdt_size_dt_struct(fdt) + delta);
@@ -133,20 +94,37 @@ static int _fdt_splice_struct(void *fdt, void *p,
 	return 0;
 }
 
-static int _fdt_splice_string(void *fdt, int newlen)
+/* Must only be used to roll back in case of error */
+static void fdt_del_last_string_(void *fdt, const char *s)
+{
+	int newlen = strlen(s) + 1;
+
+	fdt_set_size_dt_strings(fdt, fdt_size_dt_strings(fdt) - newlen);
+}
+
+static int fdt_splice_string_(void *fdt, int newlen)
 {
 	void *p = (char *)fdt
 		+ fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt);
 	int err;
 
-	if ((err = _fdt_splice(fdt, p, 0, newlen)))
+	if ((err = fdt_splice_(fdt, p, 0, newlen)))
 		return err;
 
 	fdt_set_size_dt_strings(fdt, fdt_size_dt_strings(fdt) + newlen);
 	return 0;
 }
 
-static int _fdt_find_add_string(void *fdt, const char *s)
+/**
+ * fdt_find_add_string_() - Find or allocate a string
+ *
+ * @fdt: pointer to the device tree to check/adjust
+ * @s: string to find/add
+ * @allocated: Set to 0 if the string was found, 1 if not found and so
+ *	allocated. Ignored if can_assume(NO_ROLLBACK)
+ * @return offset of string in the string table (whether found or added)
+ */
+static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
 {
 	char *strtab = (char *)fdt + fdt_off_dt_strings(fdt);
 	const char *p;
@@ -154,16 +132,22 @@ static int _fdt_find_add_string(void *fdt, const char *s)
 	int len = strlen(s) + 1;
 	int err;
 
-	p = _fdt_find_string(strtab, fdt_size_dt_strings(fdt), s);
+	if (!can_assume(NO_ROLLBACK))
+		*allocated = 0;
+
+	p = fdt_find_string_(strtab, fdt_size_dt_strings(fdt), s);
 	if (p)
 		/* found it */
 		return (p - strtab);
 
 	new = strtab + fdt_size_dt_strings(fdt);
-	err = _fdt_splice_string(fdt, len);
+	err = fdt_splice_string_(fdt, len);
 	if (err)
 		return err;
 
+	if (!can_assume(NO_ROLLBACK))
+		*allocated = 1;
+
 	memcpy(new, s, len);
 	return (new - strtab);
 }
@@ -173,10 +157,10 @@ int fdt_add_mem_rsv(void *fdt, uint64_t address, uint64_t size)
 	struct fdt_reserve_entry *re;
 	int err;
 
-	FDT_RW_CHECK_HEADER(fdt);
+	FDT_RW_PROBE(fdt);
 
-	re = _fdt_mem_rsv_w(fdt, fdt_num_mem_rsv(fdt));
-	err = _fdt_splice_mem_rsv(fdt, re, 0, 1);
+	re = fdt_mem_rsv_w_(fdt, fdt_num_mem_rsv(fdt));
+	err = fdt_splice_mem_rsv_(fdt, re, 0, 1);
 	if (err)
 		return err;
 
@@ -187,31 +171,27 @@ int fdt_add_mem_rsv(void *fdt, uint64_t address, uint64_t size)
 
 int fdt_del_mem_rsv(void *fdt, int n)
 {
-	struct fdt_reserve_entry *re = _fdt_mem_rsv_w(fdt, n);
-	int err;
+	struct fdt_reserve_entry *re = fdt_mem_rsv_w_(fdt, n);
 
-	FDT_RW_CHECK_HEADER(fdt);
+	FDT_RW_PROBE(fdt);
 
 	if (n >= fdt_num_mem_rsv(fdt))
 		return -FDT_ERR_NOTFOUND;
 
-	err = _fdt_splice_mem_rsv(fdt, re, 1, 0);
-	if (err)
-		return err;
-	return 0;
+	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
 }
 
-static int _fdt_resize_property(void *fdt, int nodeoffset, const char *name,
+static int fdt_resize_property_(void *fdt, int nodeoffset, const char *name,
 				int len, struct fdt_property **prop)
 {
 	int oldlen;
 	int err;
 
 	*prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
-	if (! (*prop))
+	if (!*prop)
 		return oldlen;
 
-	if ((err = _fdt_splice_struct(fdt, (*prop)->data, FDT_TAGALIGN(oldlen),
+	if ((err = fdt_splice_struct_(fdt, (*prop)->data, FDT_TAGALIGN(oldlen),
 				      FDT_TAGALIGN(len))))
 		return err;
 
@@ -219,27 +199,32 @@ static int _fdt_resize_property(void *fdt, int nodeoffset, const char *name,
 	return 0;
 }
 
-static int _fdt_add_property(void *fdt, int nodeoffset, const char *name,
+static int fdt_add_property_(void *fdt, int nodeoffset, const char *name,
 			     int len, struct fdt_property **prop)
 {
 	int proplen;
 	int nextoffset;
 	int namestroff;
 	int err;
+	int allocated;
 
-	if ((nextoffset = _fdt_check_node_offset(fdt, nodeoffset)) < 0)
+	if ((nextoffset = fdt_check_node_offset_(fdt, nodeoffset)) < 0)
 		return nextoffset;
 
-	namestroff = _fdt_find_add_string(fdt, name);
+	namestroff = fdt_find_add_string_(fdt, name, &allocated);
 	if (namestroff < 0)
 		return namestroff;
 
-	*prop = _fdt_offset_ptr_w(fdt, nextoffset);
+	*prop = fdt_offset_ptr_w_(fdt, nextoffset);
 	proplen = sizeof(**prop) + FDT_TAGALIGN(len);
 
-	err = _fdt_splice_struct(fdt, *prop, 0, proplen);
-	if (err)
+	err = fdt_splice_struct_(fdt, *prop, 0, proplen);
+	if (err) {
+		/* Delete the string if we failed to add it */
+		if (!can_assume(NO_ROLLBACK) && allocated)
+			fdt_del_last_string_(fdt, name);
 		return err;
+	}
 
 	(*prop)->tag = cpu_to_fdt32(FDT_PROP);
 	(*prop)->nameoff = cpu_to_fdt32(namestroff);
@@ -253,7 +238,7 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name)
 	int oldlen, newlen;
 	int err;
 
-	FDT_RW_CHECK_HEADER(fdt);
+	FDT_RW_PROBE(fdt);
 
 	namep = (char *)(uintptr_t)fdt_get_name(fdt, nodeoffset, &oldlen);
 	if (!namep)
@@ -261,7 +246,7 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name)
 
 	newlen = strlen(name);
 
-	err = _fdt_splice_struct(fdt, namep, FDT_TAGALIGN(oldlen+1),
+	err = fdt_splice_struct_(fdt, namep, FDT_TAGALIGN(oldlen+1),
 				 FDT_TAGALIGN(newlen+1));
 	if (err)
 		return err;
@@ -270,21 +255,36 @@ int fdt_set_name(void *fdt, int nodeoffset, const char *name)
 	return 0;
 }
 
-int fdt_setprop(void *fdt, int nodeoffset, const char *name,
-		const void *val, int len)
+int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
+			    int len, void **prop_data)
 {
 	struct fdt_property *prop;
 	int err;
 
-	FDT_RW_CHECK_HEADER(fdt);
+	FDT_RW_PROBE(fdt);
 
-	err = _fdt_resize_property(fdt, nodeoffset, name, len, &prop);
+	err = fdt_resize_property_(fdt, nodeoffset, name, len, &prop);
 	if (err == -FDT_ERR_NOTFOUND)
-		err = _fdt_add_property(fdt, nodeoffset, name, len, &prop);
+		err = fdt_add_property_(fdt, nodeoffset, name, len, &prop);
+	if (err)
+		return err;
+
+	*prop_data = prop->data;
+	return 0;
+}
+
+int fdt_setprop(void *fdt, int nodeoffset, const char *name,
+		const void *val, int len)
+{
+	void *prop_data;
+	int err;
+
+	err = fdt_setprop_placeholder(fdt, nodeoffset, name, len, &prop_data);
 	if (err)
 		return err;
 
-	memcpy(prop->data, val, len);
+	if (len)
+		memcpy(prop_data, val, len);
 	return 0;
 }
 
@@ -294,12 +294,12 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 	struct fdt_property *prop;
 	int err, oldlen, newlen;
 
-	FDT_RW_CHECK_HEADER(fdt);
+	FDT_RW_PROBE(fdt);
 
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
 	if (prop) {
 		newlen = len + oldlen;
-		err = _fdt_splice_struct(fdt, prop->data,
+		err = fdt_splice_struct_(fdt, prop->data,
 					 FDT_TAGALIGN(oldlen),
 					 FDT_TAGALIGN(newlen));
 		if (err)
@@ -307,7 +307,7 @@ int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
 		prop->len = cpu_to_fdt32(newlen);
 		memcpy(prop->data + oldlen, val, len);
 	} else {
-		err = _fdt_add_property(fdt, nodeoffset, name, len, &prop);
+		err = fdt_add_property_(fdt, nodeoffset, name, len, &prop);
 		if (err)
 			return err;
 		memcpy(prop->data, val, len);
@@ -320,14 +320,14 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name)
 	struct fdt_property *prop;
 	int len, proplen;
 
-	FDT_RW_CHECK_HEADER(fdt);
+	FDT_RW_PROBE(fdt);
 
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
-	if (! prop)
+	if (!prop)
 		return len;
 
 	proplen = sizeof(*prop) + FDT_TAGALIGN(len);
-	return _fdt_splice_struct(fdt, prop, proplen, 0);
+	return fdt_splice_struct_(fdt, prop, proplen, 0);
 }
 
 int fdt_add_subnode_namelen(void *fdt, int parentoffset,
@@ -340,7 +340,7 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 	uint32_t tag;
 	fdt32_t *endtag;
 
-	FDT_RW_CHECK_HEADER(fdt);
+	FDT_RW_PROBE(fdt);
 
 	offset = fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen);
 	if (offset >= 0)
@@ -349,16 +349,19 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 		return offset;
 
 	/* Try to place the new node after the parent's properties */
-	fdt_next_tag(fdt, parentoffset, &nextoffset); /* skip the BEGIN_NODE */
+	tag = fdt_next_tag(fdt, parentoffset, &nextoffset);
+	/* the fdt_subnode_offset_namelen() should ensure this never hits */
+	if (!can_assume(LIBFDT_FLAWLESS) && (tag != FDT_BEGIN_NODE))
+		return -FDT_ERR_INTERNAL;
 	do {
 		offset = nextoffset;
 		tag = fdt_next_tag(fdt, offset, &nextoffset);
 	} while ((tag == FDT_PROP) || (tag == FDT_NOP));
 
-	nh = _fdt_offset_ptr_w(fdt, offset);
+	nh = fdt_offset_ptr_w_(fdt, offset);
 	nodelen = sizeof(*nh) + FDT_TAGALIGN(namelen+1) + FDT_TAGSIZE;
 
-	err = _fdt_splice_struct(fdt, nh, 0, nodelen);
+	err = fdt_splice_struct_(fdt, nh, 0, nodelen);
 	if (err)
 		return err;
 
@@ -380,18 +383,20 @@ int fdt_del_node(void *fdt, int nodeoffset)
 {
 	int endoffset;
 
-	FDT_RW_CHECK_HEADER(fdt);
+	FDT_RW_PROBE(fdt);
 
-	endoffset = _fdt_node_end_offset(fdt, nodeoffset);
+	endoffset = fdt_node_end_offset_(fdt, nodeoffset);
 	if (endoffset < 0)
 		return endoffset;
 
-	return _fdt_splice_struct(fdt, _fdt_offset_ptr_w(fdt, nodeoffset),
+	return fdt_splice_struct_(fdt, fdt_offset_ptr_w_(fdt, nodeoffset),
 				  endoffset - nodeoffset, 0);
 }
 
-static void _fdt_packblocks(const char *old, char *new,
-			    int mem_rsv_size, int struct_size)
+static void fdt_packblocks_(const char *old, char *new,
+			    int mem_rsv_size,
+			    int struct_size,
+			    int strings_size)
 {
 	int mem_rsv_off, struct_off, strings_off;
 
@@ -406,8 +411,7 @@ static void _fdt_packblocks(const char *old, char *new,
 	fdt_set_off_dt_struct(new, struct_off);
 	fdt_set_size_dt_struct(new, struct_size);
 
-	memmove(new + strings_off, old + fdt_off_dt_strings(old),
-		fdt_size_dt_strings(old));
+	memmove(new + strings_off, old + fdt_off_dt_strings(old), strings_size);
 	fdt_set_off_dt_strings(new, strings_off);
 	fdt_set_size_dt_strings(new, fdt_size_dt_strings(old));
 }
@@ -421,22 +425,25 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 	const char *fdtend = fdtstart + fdt_totalsize(fdt);
 	char *tmp;
 
-	FDT_CHECK_HEADER(fdt);
+	FDT_RO_PROBE(fdt);
 
 	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
 		* sizeof(struct fdt_reserve_entry);
 
-	if (fdt_version(fdt) >= 17) {
+	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
 		struct_size = fdt_size_dt_struct(fdt);
-	} else {
+	} else if (fdt_version(fdt) == 16) {
 		struct_size = 0;
 		while (fdt_next_tag(fdt, struct_size, &struct_size) != FDT_END)
 			;
 		if (struct_size < 0)
 			return struct_size;
+	} else {
+		return -FDT_ERR_BADVERSION;
 	}
 
-	if (!_fdt_blocks_misordered(fdt, mem_rsv_size, struct_size)) {
+	if (can_assume(LIBFDT_ORDER) ||
+	    !fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
 		/* no further work necessary */
 		err = fdt_move(fdt, buf, bufsize);
 		if (err)
@@ -464,7 +471,8 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 			return -FDT_ERR_NOSPACE;
 	}
 
-	_fdt_packblocks(fdt, tmp, mem_rsv_size, struct_size);
+	fdt_packblocks_(fdt, tmp, mem_rsv_size, struct_size,
+			fdt_size_dt_strings(fdt));
 	memmove(buf, tmp, newsize);
 
 	fdt_set_magic(buf, FDT_MAGIC);
@@ -480,12 +488,13 @@ int fdt_pack(void *fdt)
 {
 	int mem_rsv_size;
 
-	FDT_RW_CHECK_HEADER(fdt);
+	FDT_RW_PROBE(fdt);
 
 	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
 		* sizeof(struct fdt_reserve_entry);
-	_fdt_packblocks(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt));
-	fdt_set_totalsize(fdt, _fdt_data_size(fdt));
+	fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt),
+			fdt_size_dt_strings(fdt));
+	fdt_set_totalsize(fdt, fdt_data_size_(fdt));
 
 	return 0;
 }
diff --git a/xen/common/libfdt/fdt_strerror.c b/xen/common/libfdt/fdt_strerror.c
index 8d0289c..b435693 100644
--- a/xen/common/libfdt/fdt_strerror.c
+++ b/xen/common/libfdt/fdt_strerror.c
@@ -1,49 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
- *
- * libfdt is dual licensed: you can use it either under the terms of
- * the GPL, or the BSD license, at your option.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Alternatively,
- *
- *  b) Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *     1. Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *     2. Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
- *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
- *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
- *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
  *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include "libfdt_env.h"
@@ -67,6 +25,7 @@ static struct fdt_errtabent fdt_errtable[] = {
 
 	FDT_ERRTABENT(FDT_ERR_BADOFFSET),
 	FDT_ERRTABENT(FDT_ERR_BADPATH),
+	FDT_ERRTABENT(FDT_ERR_BADPHANDLE),
 	FDT_ERRTABENT(FDT_ERR_BADSTATE),
 
 	FDT_ERRTABENT(FDT_ERR_TRUNCATED),
@@ -74,8 +33,14 @@ static struct fdt_errtabent fdt_errtable[] = {
 	FDT_ERRTABENT(FDT_ERR_BADVERSION),
 	FDT_ERRTABENT(FDT_ERR_BADSTRUCTURE),
 	FDT_ERRTABENT(FDT_ERR_BADLAYOUT),
+	FDT_ERRTABENT(FDT_ERR_INTERNAL),
+	FDT_ERRTABENT(FDT_ERR_BADNCELLS),
+	FDT_ERRTABENT(FDT_ERR_BADVALUE),
+	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
+	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
+	FDT_ERRTABENT(FDT_ERR_BADFLAGS),
 };
-#define FDT_ERRTABSIZE	(sizeof(fdt_errtable) / sizeof(fdt_errtable[0]))
+#define FDT_ERRTABSIZE	((int)(sizeof(fdt_errtable) / sizeof(fdt_errtable[0])))
 
 const char *fdt_strerror(int errval)
 {
@@ -83,7 +48,7 @@ const char *fdt_strerror(int errval)
 		return "<valid offset/length>";
 	else if (errval == 0)
 		return "<no error>";
-	else if (errval > -FDT_ERRTABSIZE) {
+	else if (-errval < FDT_ERRTABSIZE) {
 		const char *s = fdt_errtable[-errval].str;
 
 		if (s)
diff --git a/xen/common/libfdt/fdt_sw.c b/xen/common/libfdt/fdt_sw.c
index c7d93d3..4c569ee 100644
--- a/xen/common/libfdt/fdt_sw.c
+++ b/xen/common/libfdt/fdt_sw.c
@@ -1,50 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
- *
- * libfdt is dual licensed: you can use it either under the terms of
- * the GPL, or the BSD license, at your option.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Alternatively,
- *
- *  b) Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *     1. Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *     2. Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
- *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
- *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
- *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
- *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include "libfdt_env.h"
 
@@ -53,25 +10,91 @@
 
 #include "libfdt_internal.h"
 
-static int _fdt_sw_check_header(void *fdt)
+static int fdt_sw_probe_(void *fdt)
+{
+	if (!can_assume(VALID_INPUT)) {
+		if (fdt_magic(fdt) == FDT_MAGIC)
+			return -FDT_ERR_BADSTATE;
+		else if (fdt_magic(fdt) != FDT_SW_MAGIC)
+			return -FDT_ERR_BADMAGIC;
+	}
+
+	return 0;
+}
+
+#define FDT_SW_PROBE(fdt) \
+	{ \
+		int err; \
+		if ((err = fdt_sw_probe_(fdt)) != 0) \
+			return err; \
+	}
+
+/* 'memrsv' state:	Initial state after fdt_create()
+ *
+ * Allowed functions:
+ *	fdt_add_reservemap_entry()
+ *	fdt_finish_reservemap()		[moves to 'struct' state]
+ */
+static int fdt_sw_probe_memrsv_(void *fdt)
+{
+	int err = fdt_sw_probe_(fdt);
+	if (err)
+		return err;
+
+	if (!can_assume(VALID_INPUT) && fdt_off_dt_strings(fdt) != 0)
+		return -FDT_ERR_BADSTATE;
+	return 0;
+}
+
+#define FDT_SW_PROBE_MEMRSV(fdt) \
+	{ \
+		int err; \
+		if ((err = fdt_sw_probe_memrsv_(fdt)) != 0) \
+			return err; \
+	}
+
+/* 'struct' state:	Enter this state after fdt_finish_reservemap()
+ *
+ * Allowed functions:
+ *	fdt_begin_node()
+ *	fdt_end_node()
+ *	fdt_property*()
+ *	fdt_finish()			[moves to 'complete' state]
+ */
+static int fdt_sw_probe_struct_(void *fdt)
 {
-	if (fdt_magic(fdt) != FDT_SW_MAGIC)
-		return -FDT_ERR_BADMAGIC;
-	/* FIXME: should check more details about the header state */
+	int err = fdt_sw_probe_(fdt);
+	if (err)
+		return err;
+
+	if (!can_assume(VALID_INPUT) &&
+	    fdt_off_dt_strings(fdt) != fdt_totalsize(fdt))
+		return -FDT_ERR_BADSTATE;
 	return 0;
 }
 
-#define FDT_SW_CHECK_HEADER(fdt) \
+#define FDT_SW_PROBE_STRUCT(fdt) \
 	{ \
 		int err; \
-		if ((err = _fdt_sw_check_header(fdt)) != 0) \
+		if ((err = fdt_sw_probe_struct_(fdt)) != 0) \
 			return err; \
 	}
 
-static void *_fdt_grab_space(void *fdt, size_t len)
+static inline uint32_t sw_flags(void *fdt)
 {
-	int offset = fdt_size_dt_struct(fdt);
-	int spaceleft;
+	/* assert: (fdt_magic(fdt) == FDT_SW_MAGIC) */
+	return fdt_last_comp_version(fdt);
+}
+
+/* 'complete' state:	Enter this state after fdt_finish()
+ *
+ * Allowed functions: none
+ */
+
+static void *fdt_grab_space_(void *fdt, size_t len)
+{
+	unsigned int offset = fdt_size_dt_struct(fdt);
+	unsigned int spaceleft;
 
 	spaceleft = fdt_totalsize(fdt) - fdt_off_dt_struct(fdt)
 		- fdt_size_dt_strings(fdt);
@@ -80,27 +103,84 @@ static void *_fdt_grab_space(void *fdt, size_t len)
 		return NULL;
 
 	fdt_set_size_dt_struct(fdt, offset + len);
-	return _fdt_offset_ptr_w(fdt, offset);
+	return fdt_offset_ptr_w_(fdt, offset);
 }
 
-int fdt_create(void *buf, int bufsize)
+int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags)
 {
+	const int hdrsize = FDT_ALIGN(sizeof(struct fdt_header),
+				      sizeof(struct fdt_reserve_entry));
 	void *fdt = buf;
 
-	if (bufsize < sizeof(struct fdt_header))
+	if (bufsize < hdrsize)
 		return -FDT_ERR_NOSPACE;
 
+	if (flags & ~FDT_CREATE_FLAGS_ALL)
+		return -FDT_ERR_BADFLAGS;
+
 	memset(buf, 0, bufsize);
 
+	/*
+	 * magic and last_comp_version keep intermediate state during the fdt
+	 * creation process, which is replaced with the proper FDT format by
+	 * fdt_finish().
+	 *
+	 * flags should be accessed with sw_flags().
+	 */
 	fdt_set_magic(fdt, FDT_SW_MAGIC);
 	fdt_set_version(fdt, FDT_LAST_SUPPORTED_VERSION);
-	fdt_set_last_comp_version(fdt, FDT_FIRST_SUPPORTED_VERSION);
+	fdt_set_last_comp_version(fdt, flags);
+
 	fdt_set_totalsize(fdt,  bufsize);
 
-	fdt_set_off_mem_rsvmap(fdt, FDT_ALIGN(sizeof(struct fdt_header),
-					      sizeof(struct fdt_reserve_entry)));
+	fdt_set_off_mem_rsvmap(fdt, hdrsize);
 	fdt_set_off_dt_struct(fdt, fdt_off_mem_rsvmap(fdt));
-	fdt_set_off_dt_strings(fdt, bufsize);
+	fdt_set_off_dt_strings(fdt, 0);
+
+	return 0;
+}
+
+int fdt_create(void *buf, int bufsize)
+{
+	return fdt_create_with_flags(buf, bufsize, 0);
+}
+
+int fdt_resize(void *fdt, void *buf, int bufsize)
+{
+	size_t headsize, tailsize;
+	char *oldtail, *newtail;
+
+	FDT_SW_PROBE(fdt);
+
+	if (bufsize < 0)
+		return -FDT_ERR_NOSPACE;
+
+	headsize = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
+	tailsize = fdt_size_dt_strings(fdt);
+
+	if (!can_assume(VALID_DTB) &&
+	    headsize + tailsize > fdt_totalsize(fdt))
+		return -FDT_ERR_INTERNAL;
+
+	if ((headsize + tailsize) > (unsigned)bufsize)
+		return -FDT_ERR_NOSPACE;
+
+	oldtail = (char *)fdt + fdt_totalsize(fdt) - tailsize;
+	newtail = (char *)buf + bufsize - tailsize;
+
+	/* Two cases to avoid clobbering data if the old and new
+	 * buffers partially overlap */
+	if (buf <= fdt) {
+		memmove(buf, fdt, headsize);
+		memmove(newtail, oldtail, tailsize);
+	} else {
+		memmove(newtail, oldtail, tailsize);
+		memmove(buf, fdt, headsize);
+	}
+
+	fdt_set_totalsize(buf, bufsize);
+	if (fdt_off_dt_strings(buf))
+		fdt_set_off_dt_strings(buf, bufsize);
 
 	return 0;
 }
@@ -110,10 +190,7 @@ int fdt_add_reservemap_entry(void *fdt, uint64_t addr, uint64_t size)
 	struct fdt_reserve_entry *re;
 	int offset;
 
-	FDT_SW_CHECK_HEADER(fdt);
-
-	if (fdt_size_dt_struct(fdt))
-		return -FDT_ERR_BADSTATE;
+	FDT_SW_PROBE_MEMRSV(fdt);
 
 	offset = fdt_off_dt_struct(fdt);
 	if ((offset + sizeof(*re)) > fdt_totalsize(fdt))
@@ -130,17 +207,24 @@ int fdt_add_reservemap_entry(void *fdt, uint64_t addr, uint64_t size)
 
 int fdt_finish_reservemap(void *fdt)
 {
-	return fdt_add_reservemap_entry(fdt, 0, 0);
+	int err = fdt_add_reservemap_entry(fdt, 0, 0);
+
+	if (err)
+		return err;
+
+	fdt_set_off_dt_strings(fdt, fdt_totalsize(fdt));
+	return 0;
 }
 
 int fdt_begin_node(void *fdt, const char *name)
 {
 	struct fdt_node_header *nh;
-	int namelen = strlen(name) + 1;
+	int namelen;
 
-	FDT_SW_CHECK_HEADER(fdt);
+	FDT_SW_PROBE_STRUCT(fdt);
 
-	nh = _fdt_grab_space(fdt, sizeof(*nh) + FDT_TAGALIGN(namelen));
+	namelen = strlen(name) + 1;
+	nh = fdt_grab_space_(fdt, sizeof(*nh) + FDT_TAGALIGN(namelen));
 	if (! nh)
 		return -FDT_ERR_NOSPACE;
 
@@ -153,9 +237,9 @@ int fdt_end_node(void *fdt)
 {
 	fdt32_t *en;
 
-	FDT_SW_CHECK_HEADER(fdt);
+	FDT_SW_PROBE_STRUCT(fdt);
 
-	en = _fdt_grab_space(fdt, FDT_TAGSIZE);
+	en = fdt_grab_space_(fdt, FDT_TAGSIZE);
 	if (! en)
 		return -FDT_ERR_NOSPACE;
 
@@ -163,48 +247,90 @@ int fdt_end_node(void *fdt)
 	return 0;
 }
 
-static int _fdt_find_add_string(void *fdt, const char *s)
+static int fdt_add_string_(void *fdt, const char *s)
 {
 	char *strtab = (char *)fdt + fdt_totalsize(fdt);
-	const char *p;
+	unsigned int strtabsize = fdt_size_dt_strings(fdt);
+	unsigned int len = strlen(s) + 1;
+	unsigned int struct_top, offset;
+
+	offset = strtabsize + len;
+	struct_top = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
+	if (fdt_totalsize(fdt) - offset < struct_top)
+		return 0; /* no more room :( */
+
+	memcpy(strtab - offset, s, len);
+	fdt_set_size_dt_strings(fdt, strtabsize + len);
+	return -offset;
+}
+
+/* Must only be used to roll back in case of error */
+static void fdt_del_last_string_(void *fdt, const char *s)
+{
 	int strtabsize = fdt_size_dt_strings(fdt);
 	int len = strlen(s) + 1;
-	int struct_top, offset;
 
-	p = _fdt_find_string(strtab - strtabsize, strtabsize, s);
+	fdt_set_size_dt_strings(fdt, strtabsize - len);
+}
+
+static int fdt_find_add_string_(void *fdt, const char *s, int *allocated)
+{
+	char *strtab = (char *)fdt + fdt_totalsize(fdt);
+	int strtabsize = fdt_size_dt_strings(fdt);
+	const char *p;
+
+	*allocated = 0;
+
+	p = fdt_find_string_(strtab - strtabsize, strtabsize, s);
 	if (p)
 		return p - strtab;
 
-	/* Add it */
-	offset = -strtabsize - len;
-	struct_top = fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
-	if (fdt_totalsize(fdt) + offset < struct_top)
-		return 0; /* no more room :( */
+	*allocated = 1;
 
-	memcpy(strtab + offset, s, len);
-	fdt_set_size_dt_strings(fdt, strtabsize + len);
-	return offset;
+	return fdt_add_string_(fdt, s);
 }
 
-int fdt_property(void *fdt, const char *name, const void *val, int len)
+int fdt_property_placeholder(void *fdt, const char *name, int len, void **valp)
 {
 	struct fdt_property *prop;
 	int nameoff;
+	int allocated;
 
-	FDT_SW_CHECK_HEADER(fdt);
+	FDT_SW_PROBE_STRUCT(fdt);
 
-	nameoff = _fdt_find_add_string(fdt, name);
+	/* String de-duplication can be slow, _NO_NAME_DEDUP skips it */
+	if (sw_flags(fdt) & FDT_CREATE_FLAG_NO_NAME_DEDUP) {
+		allocated = 1;
+		nameoff = fdt_add_string_(fdt, name);
+	} else {
+		nameoff = fdt_find_add_string_(fdt, name, &allocated);
+	}
 	if (nameoff == 0)
 		return -FDT_ERR_NOSPACE;
 
-	prop = _fdt_grab_space(fdt, sizeof(*prop) + FDT_TAGALIGN(len));
-	if (! prop)
+	prop = fdt_grab_space_(fdt, sizeof(*prop) + FDT_TAGALIGN(len));
+	if (! prop) {
+		if (allocated)
+			fdt_del_last_string_(fdt, name);
 		return -FDT_ERR_NOSPACE;
+	}
 
 	prop->tag = cpu_to_fdt32(FDT_PROP);
 	prop->nameoff = cpu_to_fdt32(nameoff);
 	prop->len = cpu_to_fdt32(len);
-	memcpy(prop->data, val, len);
+	*valp = prop->data;
+	return 0;
+}
+
+int fdt_property(void *fdt, const char *name, const void *val, int len)
+{
+	void *ptr;
+	int ret;
+
+	ret = fdt_property_placeholder(fdt, name, len, &ptr);
+	if (ret)
+		return ret;
+	memcpy(ptr, val, len);
 	return 0;
 }
 
@@ -216,10 +342,10 @@ int fdt_finish(void *fdt)
 	uint32_t tag;
 	int offset, nextoffset;
 
-	FDT_SW_CHECK_HEADER(fdt);
+	FDT_SW_PROBE_STRUCT(fdt);
 
 	/* Add terminator */
-	end = _fdt_grab_space(fdt, sizeof(*end));
+	end = fdt_grab_space_(fdt, sizeof(*end));
 	if (! end)
 		return -FDT_ERR_NOSPACE;
 	*end = cpu_to_fdt32(FDT_END);
@@ -235,7 +361,7 @@ int fdt_finish(void *fdt)
 	while ((tag = fdt_next_tag(fdt, offset, &nextoffset)) != FDT_END) {
 		if (tag == FDT_PROP) {
 			struct fdt_property *prop =
-				_fdt_offset_ptr_w(fdt, offset);
+				fdt_offset_ptr_w_(fdt, offset);
 			int nameoff;
 
 			nameoff = fdt32_to_cpu(prop->nameoff);
@@ -249,6 +375,10 @@ int fdt_finish(void *fdt)
 
 	/* Finally, adjust the header */
 	fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));
+
+	/* And fix up fields that were keeping intermediate state. */
+	fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);
 	fdt_set_magic(fdt, FDT_MAGIC);
+
 	return 0;
 }
diff --git a/xen/common/libfdt/fdt_wip.c b/xen/common/libfdt/fdt_wip.c
index 2d1cac0..c2d7566 100644
--- a/xen/common/libfdt/fdt_wip.c
+++ b/xen/common/libfdt/fdt_wip.c
@@ -1,50 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
- *
- * libfdt is dual licensed: you can use it either under the terms of
- * the GPL, or the BSD license, at your option.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Alternatively,
- *
- *  b) Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *     1. Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *     2. Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
- *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
- *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
- *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
- *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include "libfdt_env.h"
 
@@ -53,24 +10,45 @@
 
 #include "libfdt_internal.h"
 
+int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
+					const char *name, int namelen,
+					uint32_t idx, const void *val,
+					int len)
+{
+	void *propval;
+	int proplen;
+
+	propval = fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
+					&proplen);
+	if (!propval)
+		return proplen;
+
+	if ((unsigned)proplen < (len + idx))
+		return -FDT_ERR_NOSPACE;
+
+	memcpy((char *)propval + idx, val, len);
+	return 0;
+}
+
 int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
 			const void *val, int len)
 {
-	void *propval;
+	const void *propval;
 	int proplen;
 
-	propval = fdt_getprop_w(fdt, nodeoffset, name, &proplen);
-	if (! propval)
+	propval = fdt_getprop(fdt, nodeoffset, name, &proplen);
+	if (!propval)
 		return proplen;
 
 	if (proplen != len)
 		return -FDT_ERR_NOSPACE;
 
-	memcpy(propval, val, len);
-	return 0;
+	return fdt_setprop_inplace_namelen_partial(fdt, nodeoffset, name,
+						   strlen(name), 0,
+						   val, len);
 }
 
-static void _fdt_nop_region(void *start, int len)
+static void fdt_nop_region_(void *start, int len)
 {
 	fdt32_t *p;
 
@@ -84,15 +62,15 @@ int fdt_nop_property(void *fdt, int nodeoffset, const char *name)
 	int len;
 
 	prop = fdt_get_property_w(fdt, nodeoffset, name, &len);
-	if (! prop)
+	if (!prop)
 		return len;
 
-	_fdt_nop_region(prop, len + sizeof(*prop));
+	fdt_nop_region_(prop, len + sizeof(*prop));
 
 	return 0;
 }
 
-int _fdt_node_end_offset(void *fdt, int offset)
+int fdt_node_end_offset_(void *fdt, int offset)
 {
 	int depth = 0;
 
@@ -106,11 +84,11 @@ int fdt_nop_node(void *fdt, int nodeoffset)
 {
 	int endoffset;
 
-	endoffset = _fdt_node_end_offset(fdt, nodeoffset);
+	endoffset = fdt_node_end_offset_(fdt, nodeoffset);
 	if (endoffset < 0)
 		return endoffset;
 
-	_fdt_nop_region(fdt_offset_ptr_w(fdt, nodeoffset, 0),
+	fdt_nop_region_(fdt_offset_ptr_w(fdt, nodeoffset, 0),
 			endoffset - nodeoffset);
 	return 0;
 }
diff --git a/xen/common/libfdt/libfdt_internal.h b/xen/common/libfdt/libfdt_internal.h
index d50c4e1..16bda19 100644
--- a/xen/common/libfdt/libfdt_internal.h
+++ b/xen/common/libfdt/libfdt_internal.h
@@ -1,81 +1,39 @@
-#ifndef _LIBFDT_INTERNAL_H
-#define _LIBFDT_INTERNAL_H
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef LIBFDT_INTERNAL_H
+#define LIBFDT_INTERNAL_H
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
- *
- * libfdt is dual licensed: you can use it either under the terms of
- * the GPL, or the BSD license, at your option.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Alternatively,
- *
- *  b) Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *     1. Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *     2. Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
- *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
- *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
- *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
- *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 #include <fdt.h>
 
 #define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
 #define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
 
-#define FDT_CHECK_HEADER(fdt) \
-	{ \
-		int err; \
-		if ((err = fdt_check_header(fdt)) != 0) \
-			return err; \
+int32_t fdt_ro_probe_(const void *fdt);
+#define FDT_RO_PROBE(fdt)					\
+	{							\
+		int32_t totalsize_;				\
+		if ((totalsize_ = fdt_ro_probe_(fdt)) < 0)	\
+			return totalsize_;			\
 	}
 
-int _fdt_check_node_offset(const void *fdt, int offset);
-int _fdt_check_prop_offset(const void *fdt, int offset);
-const char *_fdt_find_string(const char *strtab, int tabsize, const char *s);
-int _fdt_node_end_offset(void *fdt, int nodeoffset);
+int fdt_check_node_offset_(const void *fdt, int offset);
+int fdt_check_prop_offset_(const void *fdt, int offset);
+const char *fdt_find_string_(const char *strtab, int tabsize, const char *s);
+int fdt_node_end_offset_(void *fdt, int nodeoffset);
 
-static inline const void *_fdt_offset_ptr(const void *fdt, int offset)
+static inline const void *fdt_offset_ptr_(const void *fdt, int offset)
 {
 	return (const char *)fdt + fdt_off_dt_struct(fdt) + offset;
 }
 
-static inline void *_fdt_offset_ptr_w(void *fdt, int offset)
+static inline void *fdt_offset_ptr_w_(void *fdt, int offset)
 {
-	return (void *)(uintptr_t)_fdt_offset_ptr(fdt, offset);
+	return (void *)(uintptr_t)fdt_offset_ptr_(fdt, offset);
 }
 
-static inline const struct fdt_reserve_entry *_fdt_mem_rsv(const void *fdt, int n)
+static inline const struct fdt_reserve_entry *fdt_mem_rsv_(const void *fdt, int n)
 {
 	const struct fdt_reserve_entry *rsv_table =
 		(const struct fdt_reserve_entry *)
@@ -83,11 +41,152 @@ static inline const struct fdt_reserve_entry *_fdt_mem_rsv(const void *fdt, int
 
 	return rsv_table + n;
 }
-static inline struct fdt_reserve_entry *_fdt_mem_rsv_w(void *fdt, int n)
+static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(void *fdt, int n)
+{
+	return (void *)(uintptr_t)fdt_mem_rsv_(fdt, n);
+}
+
+/*
+ * Internal helpers to access tructural elements of the device tree
+ * blob (rather than for exaple reading integers from within property
+ * values).  We assume that we are either given a naturally aligned
+ * address for the platform or if we are not, we are on a platform
+ * where unaligned memory reads will be handled in a graceful manner.
+ * If not the external helpers fdtXX_ld() from libfdt.h can be used
+ * instead.
+ */
+static inline uint32_t fdt32_ld_(const fdt32_t *p)
 {
-	return (void *)(uintptr_t)_fdt_mem_rsv(fdt, n);
+	return fdt32_to_cpu(*p);
+}
+
+static inline uint64_t fdt64_ld_(const fdt64_t *p)
+{
+	return fdt64_to_cpu(*p);
 }
 
 #define FDT_SW_MAGIC		(~FDT_MAGIC)
 
-#endif /* _LIBFDT_INTERNAL_H */
+/**********************************************************************/
+/* Checking controls                                                  */
+/**********************************************************************/
+
+#ifndef FDT_ASSUME_MASK
+#define FDT_ASSUME_MASK 0
+#endif
+
+/*
+ * Defines assumptions which can be enabled. Each of these can be enabled
+ * individually. For maximum safety, don't enable any assumptions!
+ *
+ * For minimal code size and no safety, use ASSUME_PERFECT at your own risk.
+ * You should have another method of validating the device tree, such as a
+ * signature or hash check before using libfdt.
+ *
+ * For situations where security is not a concern it may be safe to enable
+ * ASSUME_SANE.
+ */
+enum {
+	/*
+	 * This does essentially no checks. Only the latest device-tree
+	 * version is correctly handled. Inconsistencies or errors in the device
+	 * tree may cause undefined behaviour or crashes. Invalid parameters
+	 * passed to libfdt may do the same.
+	 *
+	 * If an error occurs when modifying the tree it may leave the tree in
+	 * an intermediate (but valid) state. As an example, adding a property
+	 * where there is insufficient space may result in the property name
+	 * being added to the string table even though the property itself is
+	 * not added to the struct section.
+	 *
+	 * Only use this if you have a fully validated device tree with
+	 * the latest supported version and wish to minimise code size.
+	 */
+	ASSUME_PERFECT		= 0xff,
+
+	/*
+	 * This assumes that the device tree is sane. i.e. header metadata
+	 * and basic hierarchy are correct.
+	 *
+	 * With this assumption enabled, normal device trees produced by libfdt
+	 * and the compiler should be handled safely. Malicious device trees and
+	 * complete garbage may cause libfdt to behave badly or crash. Truncated
+	 * device trees (e.g. those only partially loaded) can also cause
+	 * problems.
+	 *
+	 * Note: Only checks that relate exclusively to the device tree itself
+	 * (not the parameters passed to libfdt) are disabled by this
+	 * assumption. This includes checking headers, tags and the like.
+	 */
+	ASSUME_VALID_DTB	= 1 << 0,
+
+	/*
+	 * This builds on ASSUME_VALID_DTB and further assumes that libfdt
+	 * functions are called with valid parameters, i.e. not trigger
+	 * FDT_ERR_BADOFFSET or offsets that are out of bounds. It disables any
+	 * extensive checking of parameters and the device tree, making various
+	 * assumptions about correctness.
+	 *
+	 * It doesn't make sense to enable this assumption unless
+	 * ASSUME_VALID_DTB is also enabled.
+	 */
+	ASSUME_VALID_INPUT	= 1 << 1,
+
+	/*
+	 * This disables checks for device-tree version and removes all code
+	 * which handles older versions.
+	 *
+	 * Only enable this if you know you have a device tree with the latest
+	 * version.
+	 */
+	ASSUME_LATEST		= 1 << 2,
+
+	/*
+	 * This assumes that it is OK for a failed addition to the device tree,
+	 * due to lack of space or some other problem, to skip any rollback
+	 * steps (such as dropping the property name from the string table).
+	 * This is safe to enable in most circumstances, even though it may
+	 * leave the tree in a sub-optimal state.
+	 */
+	ASSUME_NO_ROLLBACK	= 1 << 3,
+
+	/*
+	 * This assumes that the device tree components appear in a 'convenient'
+	 * order, i.e. the memory reservation block first, then the structure
+	 * block and finally the string block.
+	 *
+	 * This order is not specified by the device-tree specification,
+	 * but is expected by libfdt. The device-tree compiler always created
+	 * device trees with this order.
+	 *
+	 * This assumption disables a check in fdt_open_into() and removes the
+	 * ability to fix the problem there. This is safe if you know that the
+	 * device tree is correctly ordered. See fdt_blocks_misordered_().
+	 */
+	ASSUME_LIBFDT_ORDER	= 1 << 4,
+
+	/*
+	 * This assumes that libfdt itself does not have any internal bugs. It
+	 * drops certain checks that should never be needed unless libfdt has an
+	 * undiscovered bug.
+	 *
+	 * This can generally be considered safe to enable.
+	 */
+	ASSUME_LIBFDT_FLAWLESS	= 1 << 5,
+};
+
+/**
+ * can_assume_() - check if a particular assumption is enabled
+ *
+ * @mask: Mask to check (ASSUME_...)
+ * @return true if that assumption is enabled, else false
+ */
+static inline bool can_assume_(int mask)
+{
+	return FDT_ASSUME_MASK & mask;
+}
+
+/** helper macros for checking assumptions */
+#define can_assume(_assume)	can_assume_(ASSUME_ ## _assume)
+
+#endif /* LIBFDT_INTERNAL_H */
diff --git a/xen/include/xen/libfdt/fdt.h b/xen/include/xen/libfdt/fdt.h
index f460b0d..f2e6880 100644
--- a/xen/include/xen/libfdt/fdt.h
+++ b/xen/include/xen/libfdt/fdt.h
@@ -1,53 +1,10 @@
-#ifndef _FDT_H
-#define _FDT_H
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef FDT_H
+#define FDT_H
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
  * Copyright 2012 Kim Phillips, Freescale Semiconductor.
- *
- * libfdt is dual licensed: you can use it either under the terms of
- * the GPL, or the BSD license, at your option.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Alternatively,
- *
- *  b) Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *     1. Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *     2. Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
- *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
- *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
- *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
- *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  */
 
 #ifndef __ASSEMBLY__
@@ -106,4 +63,4 @@ struct fdt_property {
 #define FDT_V16_SIZE	FDT_V3_SIZE
 #define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
 
-#endif /* _FDT_H */
+#endif /* FDT_H */
diff --git a/xen/include/xen/libfdt/libfdt.h b/xen/include/xen/libfdt/libfdt.h
index 7c75688..73467f7 100644
--- a/xen/include/xen/libfdt/libfdt.h
+++ b/xen/include/xen/libfdt/libfdt.h
@@ -1,65 +1,27 @@
-#ifndef _LIBFDT_H
-#define _LIBFDT_H
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef LIBFDT_H
+#define LIBFDT_H
 /*
  * libfdt - Flat Device Tree manipulation
  * Copyright (C) 2006 David Gibson, IBM Corporation.
- *
- * libfdt is dual licensed: you can use it either under the terms of
- * the GPL, or the BSD license, at your option.
- *
- *  a) This library is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of the
- *     License, or (at your option) any later version.
- *
- *     This library is distributed in the hope that it will be useful,
- *     but WITHOUT ANY WARRANTY; without even the implied warranty of
- *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *     GNU General Public License for more details.
- *
- *     You should have received a copy of the GNU General Public
- *     License along with this library; If not, see <http://www.gnu.org/licenses/>.
- *
- * Alternatively,
- *
- *  b) Redistribution and use in source and binary forms, with or
- *     without modification, are permitted provided that the following
- *     conditions are met:
- *
- *     1. Redistributions of source code must retain the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer.
- *     2. Redistributions in binary form must reproduce the above
- *        copyright notice, this list of conditions and the following
- *        disclaimer in the documentation and/or other materials
- *        provided with the distribution.
- *
- *     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
- *     CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
- *     INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
- *     MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- *     DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
- *     CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *     SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *     NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- *     LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
- *     HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
- *     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
- *     OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
- *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-#include <xen/libfdt/libfdt_env.h>
-#include <xen/libfdt/fdt.h>
-
-#define FDT_FIRST_SUPPORTED_VERSION	0x10
+ */
+
+#include <libfdt_env.h>
+#include <fdt.h>
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define FDT_FIRST_SUPPORTED_VERSION	0x02
+#define FDT_LAST_COMPATIBLE_VERSION 0x10
 #define FDT_LAST_SUPPORTED_VERSION	0x11
 
 /* Error codes: informative error codes */
 #define FDT_ERR_NOTFOUND	1
 	/* FDT_ERR_NOTFOUND: The requested node or property does not exist */
 #define FDT_ERR_EXISTS		2
-	/* FDT_ERR_EXISTS: Attemped to create a node or property which
+	/* FDT_ERR_EXISTS: Attempted to create a node or property which
 	 * already exists */
 #define FDT_ERR_NOSPACE		3
 	/* FDT_ERR_NOSPACE: Operation needed to expand the device
@@ -77,8 +39,10 @@
 	 * (e.g. missing a leading / for a function which requires an
 	 * absolute path) */
 #define FDT_ERR_BADPHANDLE	6
-	/* FDT_ERR_BADPHANDLE: Function was passed an invalid phandle
-	 * value.  phandle values of 0 and -1 are not permitted. */
+	/* FDT_ERR_BADPHANDLE: Function was passed an invalid phandle.
+	 * This can be caused either by an invalid phandle property
+	 * length, or the phandle value was either 0 or -1, which are
+	 * not permitted. */
 #define FDT_ERR_BADSTATE	7
 	/* FDT_ERR_BADSTATE: Function was passed an incomplete device
 	 * tree created by the sequential-write functions, which is
@@ -86,8 +50,9 @@
 
 /* Error codes: codes for bad device tree blobs */
 #define FDT_ERR_TRUNCATED	8
-	/* FDT_ERR_TRUNCATED: Structure block of the given device tree
-	 * ends without an FDT_END tag. */
+	/* FDT_ERR_TRUNCATED: FDT or a sub-block is improperly
+	 * terminated (overflows, goes outside allowed bounds, or
+	 * isn't properly terminated).  */
 #define FDT_ERR_BADMAGIC	9
 	/* FDT_ERR_BADMAGIC: Given "device tree" appears not to be a
 	 * device tree at all - it is missing the flattened device
@@ -114,13 +79,46 @@
 	 * Should never be returned, if it is, it indicates a bug in
 	 * libfdt itself. */
 
-#define FDT_ERR_MAX		13
+/* Errors in device tree content */
+#define FDT_ERR_BADNCELLS	14
+	/* FDT_ERR_BADNCELLS: Device tree has a #address-cells, #size-cells
+	 * or similar property with a bad format or value */
+
+#define FDT_ERR_BADVALUE	15
+	/* FDT_ERR_BADVALUE: Device tree has a property with an unexpected
+	 * value. For example: a property expected to contain a string list
+	 * is not NUL-terminated within the length of its value. */
+
+#define FDT_ERR_BADOVERLAY	16
+	/* FDT_ERR_BADOVERLAY: The device tree overlay, while
+	 * correctly structured, cannot be applied due to some
+	 * unexpected or missing value, property or node. */
+
+#define FDT_ERR_NOPHANDLES	17
+	/* FDT_ERR_NOPHANDLES: The device tree doesn't have any
+	 * phandle available anymore without causing an overflow */
+
+#define FDT_ERR_BADFLAGS	18
+	/* FDT_ERR_BADFLAGS: The function was passed a flags field that
+	 * contains invalid flags or an invalid combination of flags. */
+
+#define FDT_ERR_ALIGNMENT	19
+	/* FDT_ERR_ALIGNMENT: The device tree base address is not 8-byte
+	 * aligned. */
+
+#define FDT_ERR_MAX		19
+
+/* constants */
+#define FDT_MAX_PHANDLE 0xfffffffe
+	/* Valid values for phandles range from 1 to 2^32-2. */
 
 /**********************************************************************/
 /* Low-level functions (you probably don't need these)                */
 /**********************************************************************/
 
+#ifndef SWIG /* This function is not useful in Python */
 const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int checklen);
+#endif
 static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
 {
 	return (void *)(uintptr_t)fdt_offset_ptr(fdt, offset, checklen);
@@ -128,6 +126,59 @@ static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checklen)
 
 uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
 
+/*
+ * External helpers to access words from a device tree blob. They're built
+ * to work even with unaligned pointers on platforms (such as ARMv5) that don't
+ * like unaligned loads and stores.
+ */
+static inline uint32_t fdt32_ld(const fdt32_t *p)
+{
+	const uint8_t *bp = (const uint8_t *)p;
+
+	return ((uint32_t)bp[0] << 24)
+		| ((uint32_t)bp[1] << 16)
+		| ((uint32_t)bp[2] << 8)
+		| bp[3];
+}
+
+static inline void fdt32_st(void *property, uint32_t value)
+{
+	uint8_t *bp = (uint8_t *)property;
+
+	bp[0] = value >> 24;
+	bp[1] = (value >> 16) & 0xff;
+	bp[2] = (value >> 8) & 0xff;
+	bp[3] = value & 0xff;
+}
+
+static inline uint64_t fdt64_ld(const fdt64_t *p)
+{
+	const uint8_t *bp = (const uint8_t *)p;
+
+	return ((uint64_t)bp[0] << 56)
+		| ((uint64_t)bp[1] << 48)
+		| ((uint64_t)bp[2] << 40)
+		| ((uint64_t)bp[3] << 32)
+		| ((uint64_t)bp[4] << 24)
+		| ((uint64_t)bp[5] << 16)
+		| ((uint64_t)bp[6] << 8)
+		| bp[7];
+}
+
+static inline void fdt64_st(void *property, uint64_t value)
+{
+	uint8_t *bp = (uint8_t *)property;
+
+	bp[0] = value >> 56;
+	bp[1] = (value >> 48) & 0xff;
+	bp[2] = (value >> 40) & 0xff;
+	bp[3] = (value >> 32) & 0xff;
+	bp[4] = (value >> 24) & 0xff;
+	bp[5] = (value >> 16) & 0xff;
+	bp[6] = (value >> 8) & 0xff;
+	bp[7] = value & 0xff;
+}
+
 /**********************************************************************/
 /* Traversal functions                                                */
 /**********************************************************************/
@@ -136,74 +187,118 @@ int fdt_next_node(const void *fdt, int offset, int *depth);
 
 /**
  * fdt_first_subnode() - get offset of first direct subnode
- *
  * @fdt:	FDT blob
  * @offset:	Offset of node to check
- * @return offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
+ *
+ * Return: offset of first subnode, or -FDT_ERR_NOTFOUND if there is none
  */
 int fdt_first_subnode(const void *fdt, int offset);
 
 /**
  * fdt_next_subnode() - get offset of next direct subnode
+ * @fdt:	FDT blob
+ * @offset:	Offset of previous subnode
  *
  * After first calling fdt_first_subnode(), call this function repeatedly to
  * get direct subnodes of a parent node.
  *
- * @fdt:	FDT blob
- * @offset:	Offset of previous subnode
- * @return offset of next subnode, or -FDT_ERR_NOTFOUND if there are no more
- * subnodes
+ * Return: offset of next subnode, or -FDT_ERR_NOTFOUND if there are no more
+ *         subnodes
  */
 int fdt_next_subnode(const void *fdt, int offset);
 
+/**
+ * fdt_for_each_subnode - iterate over all subnodes of a parent
+ *
+ * @node:	child node (int, lvalue)
+ * @fdt:	FDT blob (const void *)
+ * @parent:	parent node (int)
+ *
+ * This is actually a wrapper around a for loop and would be used like so:
+ *
+ *	fdt_for_each_subnode(node, fdt, parent) {
+ *		Use node
+ *		...
+ *	}
+ *
+ *	if ((node < 0) && (node != -FDT_ERR_NOTFOUND)) {
+ *		Error handling
+ *	}
+ *
+ * Note that this is implemented as a macro and @node is used as
+ * iterator in the loop. The parent variable be constant or even a
+ * literal.
+ */
+#define fdt_for_each_subnode(node, fdt, parent)		\
+	for (node = fdt_first_subnode(fdt, parent);	\
+	     node >= 0;					\
+	     node = fdt_next_subnode(fdt, node))
+
 /**********************************************************************/
 /* General functions                                                  */
 /**********************************************************************/
-
 #define fdt_get_header(fdt, field) \
-	(fdt32_to_cpu(((const struct fdt_header *)(fdt))->field))
-#define fdt_magic(fdt) 			(fdt_get_header(fdt, magic))
+	(fdt32_ld(&((const struct fdt_header *)(fdt))->field))
+#define fdt_magic(fdt)			(fdt_get_header(fdt, magic))
 #define fdt_totalsize(fdt)		(fdt_get_header(fdt, totalsize))
 #define fdt_off_dt_struct(fdt)		(fdt_get_header(fdt, off_dt_struct))
 #define fdt_off_dt_strings(fdt)		(fdt_get_header(fdt, off_dt_strings))
 #define fdt_off_mem_rsvmap(fdt)		(fdt_get_header(fdt, off_mem_rsvmap))
 #define fdt_version(fdt)		(fdt_get_header(fdt, version))
-#define fdt_last_comp_version(fdt) 	(fdt_get_header(fdt, last_comp_version))
-#define fdt_boot_cpuid_phys(fdt) 	(fdt_get_header(fdt, boot_cpuid_phys))
-#define fdt_size_dt_strings(fdt) 	(fdt_get_header(fdt, size_dt_strings))
+#define fdt_last_comp_version(fdt)	(fdt_get_header(fdt, last_comp_version))
+#define fdt_boot_cpuid_phys(fdt)	(fdt_get_header(fdt, boot_cpuid_phys))
+#define fdt_size_dt_strings(fdt)	(fdt_get_header(fdt, size_dt_strings))
 #define fdt_size_dt_struct(fdt)		(fdt_get_header(fdt, size_dt_struct))
 
-#define __fdt_set_hdr(name) \
+#define fdt_set_hdr_(name) \
 	static inline void fdt_set_##name(void *fdt, uint32_t val) \
 	{ \
-		struct fdt_header *fdth = (struct fdt_header*)fdt; \
+		struct fdt_header *fdth = (struct fdt_header *)fdt; \
 		fdth->name = cpu_to_fdt32(val); \
 	}
-__fdt_set_hdr(magic);
-__fdt_set_hdr(totalsize);
-__fdt_set_hdr(off_dt_struct);
-__fdt_set_hdr(off_dt_strings);
-__fdt_set_hdr(off_mem_rsvmap);
-__fdt_set_hdr(version);
-__fdt_set_hdr(last_comp_version);
-__fdt_set_hdr(boot_cpuid_phys);
-__fdt_set_hdr(size_dt_strings);
-__fdt_set_hdr(size_dt_struct);
-#undef __fdt_set_hdr
-
-/**
- * fdt_check_header - sanity check a device tree or possible device tree
+fdt_set_hdr_(magic);
+fdt_set_hdr_(totalsize);
+fdt_set_hdr_(off_dt_struct);
+fdt_set_hdr_(off_dt_strings);
+fdt_set_hdr_(off_mem_rsvmap);
+fdt_set_hdr_(version);
+fdt_set_hdr_(last_comp_version);
+fdt_set_hdr_(boot_cpuid_phys);
+fdt_set_hdr_(size_dt_strings);
+fdt_set_hdr_(size_dt_struct);
+#undef fdt_set_hdr_
+
+/**
+ * fdt_header_size - return the size of the tree's header
+ * @fdt: pointer to a flattened device tree
+ *
+ * Return: size of DTB header in bytes
+ */
+size_t fdt_header_size(const void *fdt);
+
+/**
+ * fdt_header_size_ - internal function to get header size from a version number
+ * @version: devicetree version number
+ *
+ * Return: size of DTB header in bytes
+ */
+size_t fdt_header_size_(uint32_t version);
+
+/**
+ * fdt_check_header - sanity check a device tree header
  * @fdt: pointer to data which might be a flattened device tree
  *
  * fdt_check_header() checks that the given buffer contains what
- * appears to be a flattened device tree with sane information in its
- * header.
+ * appears to be a flattened device tree, and that the header contains
+ * valid information (to the extent that can be determined from the
+ * header alone).
  *
  * returns:
  *     0, if the buffer appears to contain a valid device tree
  *     -FDT_ERR_BADMAGIC,
  *     -FDT_ERR_BADVERSION,
- *     -FDT_ERR_BADSTATE, standard meanings, as above
+ *     -FDT_ERR_BADSTATE,
+ *     -FDT_ERR_TRUNCATED, standard meanings, as above
  */
 int fdt_check_header(const void *fdt);
 
@@ -232,6 +327,24 @@ int fdt_move(const void *fdt, void *buf, int bufsize);
 /* Read-only functions                                                */
 /**********************************************************************/
 
+int fdt_check_full(const void *fdt, size_t bufsize);
+
+/**
+ * fdt_get_string - retrieve a string from the strings block of a device tree
+ * @fdt: pointer to the device tree blob
+ * @stroffset: offset of the string within the strings block (native endian)
+ * @lenp: optional pointer to return the string's length
+ *
+ * fdt_get_string() retrieves a pointer to a single string from the
+ * strings block of the device tree blob at fdt, and optionally also
+ * returns the string's length in *lenp.
+ *
+ * returns:
+ *     a pointer to the string, on success
+ *     NULL, if stroffset is out of bounds, or doesn't point to a valid string
+ */
+const char *fdt_get_string(const void *fdt, int stroffset, int *lenp);
+
 /**
  * fdt_string - retrieve a string from the strings block of a device tree
  * @fdt: pointer to the device tree blob
@@ -242,11 +355,66 @@ int fdt_move(const void *fdt, void *buf, int bufsize);
  *
  * returns:
  *     a pointer to the string, on success
- *     NULL, if stroffset is out of bounds
+ *     NULL, if stroffset is out of bounds, or doesn't point to a valid string
  */
 const char *fdt_string(const void *fdt, int stroffset);
 
 /**
+ * fdt_find_max_phandle - find and return the highest phandle in a tree
+ * @fdt: pointer to the device tree blob
+ * @phandle: return location for the highest phandle value found in the tree
+ *
+ * fdt_find_max_phandle() finds the highest phandle value in the given device
+ * tree. The value returned in @phandle is only valid if the function returns
+ * success.
+ *
+ * returns:
+ *     0 on success or a negative error code on failure
+ */
+int fdt_find_max_phandle(const void *fdt, uint32_t *phandle);
+
+/**
+ * fdt_get_max_phandle - retrieves the highest phandle in a tree
+ * @fdt: pointer to the device tree blob
+ *
+ * fdt_get_max_phandle retrieves the highest phandle in the given
+ * device tree. This will ignore badly formatted phandles, or phandles
+ * with a value of 0 or -1.
+ *
+ * This function is deprecated in favour of fdt_find_max_phandle().
+ *
+ * returns:
+ *      the highest phandle on success
+ *      0, if no phandle was found in the device tree
+ *      -1, if an error occurred
+ */
+static inline uint32_t fdt_get_max_phandle(const void *fdt)
+{
+	uint32_t phandle;
+	int err;
+
+	err = fdt_find_max_phandle(fdt, &phandle);
+	if (err < 0)
+		return (uint32_t)-1;
+
+	return phandle;
+}
+
+/**
+ * fdt_generate_phandle - return a new, unused phandle for a device tree blob
+ * @fdt: pointer to the device tree blob
+ * @phandle: return location for the new phandle
+ *
+ * Walks the device tree blob and looks for the highest phandle value. On
+ * success, the new, unused phandle value (one higher than the previously
+ * highest phandle value in the device tree blob) will be returned in the
+ * @phandle parameter.
+ *
+ * Return: 0 on success or a negative error-code on failure
+ */
+int fdt_generate_phandle(const void *fdt, uint32_t *phandle);
+
+/**
  * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
  * @fdt: pointer to the device tree blob
  *
@@ -262,9 +430,11 @@ int fdt_num_mem_rsv(const void *fdt);
 /**
  * fdt_get_mem_rsv - retrieve one memory reserve map entry
  * @fdt: pointer to the device tree blob
- * @address, @size: pointers to 64-bit variables
+ * @n: index of reserve map entry
+ * @address: pointer to 64-bit variable to hold the start address
+ * @size: pointer to 64-bit variable to hold the size of the entry
  *
- * On success, *address and *size will contain the address and size of
+ * On success, @address and @size will contain the address and size of
  * the n-th reserve map entry from the device tree blob, in
  * native-endian format.
  *
@@ -287,9 +457,13 @@ int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t *size);
  * namelen characters of name for matching the subnode name.  This is
  * useful for finding subnodes based on a portion of a larger string,
  * such as a full path.
+ *
+ * Return: offset of the subnode or -FDT_ERR_NOTFOUND if name not found.
  */
+#ifndef SWIG /* Not available in Python */
 int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
 			       const char *name, int namelen);
+#endif
 /**
  * fdt_subnode_offset - find a subnode of a given node
  * @fdt: pointer to the device tree blob
@@ -306,8 +480,9 @@ int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
  * returns:
  *	structure block offset of the requested subnode (>=0), on success
  *	-FDT_ERR_NOTFOUND, if the requested subnode does not exist
- *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE tag
- *      -FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE
+ *		tag
+ *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
  *	-FDT_ERR_BADSTRUCTURE,
@@ -316,6 +491,21 @@ int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
 int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
 
 /**
+ * fdt_path_offset_namelen - find a tree node by its full path
+ * @fdt: pointer to the device tree blob
+ * @path: full path of the node to locate
+ * @namelen: number of characters of path to consider
+ *
+ * Identical to fdt_path_offset(), but only consider the first namelen
+ * characters of path as the path name.
+ *
+ * Return: offset of the node or negative libfdt error value otherwise
+ */
+#ifndef SWIG /* Not available in Python */
+int fdt_path_offset_namelen(const void *fdt, const char *path, int namelen);
+#endif
+
+/**
  * fdt_path_offset - find a tree node by its full path
  * @fdt: pointer to the device tree blob
  * @path: full path of the node to locate
@@ -328,7 +518,8 @@ int fdt_subnode_offset(const void *fdt, int parentoffset, const char *name);
  * address).
  *
  * returns:
- *	structure block offset of the node with the requested path (>=0), on success
+ *	structure block offset of the node with the requested path (>=0), on
+ *		success
  *	-FDT_ERR_BADPATH, given path does not begin with '/' or is invalid
  *	-FDT_ERR_NOTFOUND, if the requested node does not exist
  *      -FDT_ERR_BADMAGIC,
@@ -352,10 +543,12 @@ int fdt_path_offset(const void *fdt, const char *path);
  *
  * returns:
  *	pointer to the node's name, on success
- *		If lenp is non-NULL, *lenp contains the length of that name (>=0)
+ *		If lenp is non-NULL, *lenp contains the length of that name
+ *			(>=0)
  *	NULL, on error
  *		if lenp is non-NULL *lenp contains an error code (<0):
- *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
+ *			tag
  *		-FDT_ERR_BADMAGIC,
  *		-FDT_ERR_BADVERSION,
  *		-FDT_ERR_BADSTATE, standard meanings
@@ -404,6 +597,33 @@ int fdt_first_property_offset(const void *fdt, int nodeoffset);
 int fdt_next_property_offset(const void *fdt, int offset);
 
 /**
+ * fdt_for_each_property_offset - iterate over all properties of a node
+ *
+ * @property:	property offset (int, lvalue)
+ * @fdt:	FDT blob (const void *)
+ * @node:	node offset (int)
+ *
+ * This is actually a wrapper around a for loop and would be used like so:
+ *
+ *	fdt_for_each_property_offset(property, fdt, node) {
+ *		Use property
+ *		...
+ *	}
+ *
+ *	if ((property < 0) && (property != -FDT_ERR_NOTFOUND)) {
+ *		Error handling
+ *	}
+ *
+ * Note that this is implemented as a macro and property is used as
+ * iterator in the loop. The node variable can be constant or even a
+ * literal.
+ */
+#define fdt_for_each_property_offset(property, fdt, node)	\
+	for (property = fdt_first_property_offset(fdt, node);	\
+	     property >= 0;					\
+	     property = fdt_next_property_offset(fdt, property))
+
+/**
  * fdt_get_property_by_offset - retrieve the property at a given offset
  * @fdt: pointer to the device tree blob
  * @offset: offset of the property to retrieve
@@ -414,6 +634,9 @@ int fdt_next_property_offset(const void *fdt, int offset);
  * offset.  If lenp is non-NULL, the length of the property value is
  * also returned, in the integer pointed to by lenp.
  *
+ * Note that this code only works on device tree versions >= 16. fdt_getprop()
+ * works on all versions.
+ *
  * returns:
  *	pointer to the structure representing the property
  *		if lenp is non-NULL, *lenp contains the length of the property
@@ -439,13 +662,18 @@ const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
  * @namelen: number of characters of name to consider
  * @lenp: pointer to an integer variable (will be overwritten) or NULL
  *
- * Identical to fdt_get_property_namelen(), but only examine the first
- * namelen characters of name for matching the property name.
+ * Identical to fdt_get_property(), but only examine the first namelen
+ * characters of name for matching the property name.
+ *
+ * Return: pointer to the structure representing the property, or NULL
+ *         if not found
  */
+#ifndef SWIG /* Not available in Python */
 const struct fdt_property *fdt_get_property_namelen(const void *fdt,
 						    int nodeoffset,
 						    const char *name,
 						    int namelen, int *lenp);
+#endif
 
 /**
  * fdt_get_property - find a given property in a given node
@@ -467,7 +695,8 @@ const struct fdt_property *fdt_get_property_namelen(const void *fdt,
  *	NULL, on error
  *		if lenp is non-NULL, *lenp contains an error code (<0):
  *		-FDT_ERR_NOTFOUND, node does not have named property
- *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
+ *			tag
  *		-FDT_ERR_BADMAGIC,
  *		-FDT_ERR_BADVERSION,
  *		-FDT_ERR_BADSTATE,
@@ -487,7 +716,7 @@ static inline struct fdt_property *fdt_get_property_w(void *fdt, int nodeoffset,
 /**
  * fdt_getprop_by_offset - retrieve the value of a property at a given offset
  * @fdt: pointer to the device tree blob
- * @ffset: offset of the property to read
+ * @offset: offset of the property to read
  * @namep: pointer to a string variable (will be overwritten) or NULL
  * @lenp: pointer to an integer variable (will be overwritten) or NULL
  *
@@ -515,8 +744,10 @@ static inline struct fdt_property *fdt_get_property_w(void *fdt, int nodeoffset,
  *		-FDT_ERR_BADSTRUCTURE,
  *		-FDT_ERR_TRUNCATED, standard meanings
  */
+#ifndef SWIG /* This function is not useful in Python */
 const void *fdt_getprop_by_offset(const void *fdt, int offset,
 				  const char **namep, int *lenp);
+#endif
 
 /**
  * fdt_getprop_namelen - get property value based on substring
@@ -528,9 +759,20 @@ const void *fdt_getprop_by_offset(const void *fdt, int offset,
  *
  * Identical to fdt_getprop(), but only examine the first namelen
  * characters of name for matching the property name.
+ *
+ * Return: pointer to the property's value or NULL on error
  */
+#ifndef SWIG /* Not available in Python */
 const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
 				const char *name, int namelen, int *lenp);
+static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
+					  const char *name, int namelen,
+					  int *lenp)
+{
+	return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, name,
+						      namelen, lenp);
+}
+#endif
 
 /**
  * fdt_getprop - retrieve the value of a given property
@@ -540,10 +782,10 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
  * @lenp: pointer to an integer variable (will be overwritten) or NULL
  *
  * fdt_getprop() retrieves a pointer to the value of the property
- * named 'name' of the node at offset nodeoffset (this will be a
+ * named @name of the node at offset @nodeoffset (this will be a
  * pointer to within the device blob itself, not a copy of the value).
- * If lenp is non-NULL, the length of the property value is also
- * returned, in the integer pointed to by lenp.
+ * If @lenp is non-NULL, the length of the property value is also
+ * returned, in the integer pointed to by @lenp.
  *
  * returns:
  *	pointer to the property's value
@@ -552,7 +794,8 @@ const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
  *	NULL, on error
  *		if lenp is non-NULL, *lenp contains an error code (<0):
  *		-FDT_ERR_NOTFOUND, node does not have named property
- *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
+ *			tag
  *		-FDT_ERR_BADMAGIC,
  *		-FDT_ERR_BADVERSION,
  *		-FDT_ERR_BADSTATE,
@@ -587,11 +830,16 @@ uint32_t fdt_get_phandle(const void *fdt, int nodeoffset);
  * @name: name of the alias th look up
  * @namelen: number of characters of name to consider
  *
- * Identical to fdt_get_alias(), but only examine the first namelen
- * characters of name for matching the alias name.
+ * Identical to fdt_get_alias(), but only examine the first @namelen
+ * characters of @name for matching the alias name.
+ *
+ * Return: a pointer to the expansion of the alias named @name, if it exists,
+ *	   NULL otherwise
  */
+#ifndef SWIG /* Not available in Python */
 const char *fdt_get_alias_namelen(const void *fdt,
 				  const char *name, int namelen);
+#endif
 
 /**
  * fdt_get_alias - retrieve the path referenced by a given alias
@@ -599,7 +847,7 @@ const char *fdt_get_alias_namelen(const void *fdt,
  * @name: name of the alias th look up
  *
  * fdt_get_alias() retrieves the value of a given alias.  That is, the
- * value of the property named 'name' in the node /aliases.
+ * value of the property named @name in the node /aliases.
  *
  * returns:
  *	a pointer to the expansion of the alias named 'name', if it exists
@@ -624,7 +872,7 @@ const char *fdt_get_alias(const void *fdt, const char *name);
  *	0, on success
  *		buf contains the absolute path of the node at
  *		nodeoffset, as a NUL-terminated string.
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_NOSPACE, the path of the given node is longer than (bufsize-1)
  *		characters and will not fit in the given buffer.
  *	-FDT_ERR_BADMAGIC,
@@ -654,11 +902,11 @@ int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen);
  * structure from the start to nodeoffset.
  *
  * returns:
-
  *	structure block offset of the node at node offset's ancestor
  *		of depth supernodedepth (>=0), on success
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
-*	-FDT_ERR_NOTFOUND, supernodedepth was greater than the depth of nodeoffset
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_NOTFOUND, supernodedepth was greater than the depth of
+ *		nodeoffset
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -680,7 +928,7 @@ int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
  *
  * returns:
  *	depth of the node at nodeoffset (>=0), on success
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -703,7 +951,7 @@ int fdt_node_depth(const void *fdt, int nodeoffset);
  * returns:
  *	structure block offset of the parent of the node at nodeoffset
  *		(>=0), on success
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -743,7 +991,7 @@ int fdt_parent_offset(const void *fdt, int nodeoffset);
  *		 on success
  *	-FDT_ERR_NOTFOUND, no node matching the criterion exists in the
  *		tree after startoffset
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -775,14 +1023,13 @@ int fdt_node_offset_by_prop_value(const void *fdt, int startoffset,
 int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle);
 
 /**
- * fdt_node_check_compatible: check a node's compatible property
+ * fdt_node_check_compatible - check a node's compatible property
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of a tree node
  * @compatible: string to match against
  *
- *
  * fdt_node_check_compatible() returns 0 if the given node contains a
- * 'compatible' property with the given string as one of its elements,
+ * @compatible property with the given string as one of its elements,
  * it returns non-zero otherwise, or on error.
  *
  * returns:
@@ -790,7 +1037,7 @@ int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle);
  *	1, if the node has a 'compatible' property, but it does not list
  *		the given string
  *	-FDT_ERR_NOTFOUND, if the given node has no 'compatible' property
- * 	-FDT_ERR_BADOFFSET, if nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, if nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -827,7 +1074,7 @@ int fdt_node_check_compatible(const void *fdt, int nodeoffset,
  *		 on success
  *	-FDT_ERR_NOTFOUND, no node matching the criterion exists in the
  *		tree after startoffset
- * 	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
  *	-FDT_ERR_BADMAGIC,
  *	-FDT_ERR_BADVERSION,
  *	-FDT_ERR_BADSTATE,
@@ -846,15 +1093,160 @@ int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
  * one or more strings, each terminated by \0, as is found in a device tree
  * "compatible" property.
  *
- * @return: 1 if the string is found in the list, 0 not found, or invalid list
+ * Return: 1 if the string is found in the list, 0 not found, or invalid list
  */
 int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
 
+/**
+ * fdt_stringlist_count - count the number of strings in a string list
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @property: name of the property containing the string list
+ *
+ * Return:
+ *   the number of strings in the given property
+ *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *   -FDT_ERR_NOTFOUND if the property does not exist
+ */
+int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *property);
+
+/**
+ * fdt_stringlist_search - find a string in a string list and return its index
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @property: name of the property containing the string list
+ * @string: string to look up in the string list
+ *
+ * Note that it is possible for this function to succeed on property values
+ * that are not NUL-terminated. That's because the function will stop after
+ * finding the first occurrence of @string. This can for example happen with
+ * small-valued cell properties, such as #address-cells, when searching for
+ * the empty string.
+ *
+ * return:
+ *   the index of the string in the list of strings
+ *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *   -FDT_ERR_NOTFOUND if the property does not exist or does not contain
+ *                     the given string
+ */
+int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *property,
+			  const char *string);
+
+/**
+ * fdt_stringlist_get() - obtain the string at a given index in a string list
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of a tree node
+ * @property: name of the property containing the string list
+ * @index: index of the string to return
+ * @lenp: return location for the string length or an error code on failure
+ *
+ * Note that this will successfully extract strings from properties with
+ * non-NUL-terminated values. For example on small-valued cell properties
+ * this function will return the empty string.
+ *
+ * If non-NULL, the length of the string (on success) or a negative error-code
+ * (on failure) will be stored in the integer pointer to by lenp.
+ *
+ * Return:
+ *   A pointer to the string at the given index in the string list or NULL on
+ *   failure. On success the length of the string will be stored in the memory
+ *   location pointed to by the lenp parameter, if non-NULL. On failure one of
+ *   the following negative error codes will be returned in the lenp parameter
+ *   (if non-NULL):
+ *     -FDT_ERR_BADVALUE if the property value is not NUL-terminated
+ *     -FDT_ERR_NOTFOUND if the property does not exist
+ */
+const char *fdt_stringlist_get(const void *fdt, int nodeoffset,
+			       const char *property, int index,
+			       int *lenp);
+
+/**********************************************************************/
+/* Read-only functions (addressing related)                           */
+/**********************************************************************/
+
+/**
+ * FDT_MAX_NCELLS - maximum value for #address-cells and #size-cells
+ *
+ * This is the maximum value for #address-cells, #size-cells and
+ * similar properties that will be processed by libfdt.  IEE1275
+ * requires that OF implementations handle values up to 4.
+ * Implementations may support larger values, but in practice higher
+ * values aren't used.
+ */
+#define FDT_MAX_NCELLS		4
+
+/**
+ * fdt_address_cells - retrieve address size for a bus represented in the tree
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node to find the address size for
+ *
+ * When the node has a valid #address-cells property, returns its value.
+ *
+ * returns:
+ *	0 <= n < FDT_MAX_NCELLS, on success
+ *      2, if the node has no #address-cells property
+ *      -FDT_ERR_BADNCELLS, if the node has a badly formatted or invalid
+ *		#address-cells property
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_address_cells(const void *fdt, int nodeoffset);
+
+/**
+ * fdt_size_cells - retrieve address range size for a bus represented in the
+ *                  tree
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node to find the address range size for
+ *
+ * When the node has a valid #size-cells property, returns its value.
+ *
+ * returns:
+ *	0 <= n < FDT_MAX_NCELLS, on success
+ *      1, if the node has no #size-cells property
+ *      -FDT_ERR_BADNCELLS, if the node has a badly formatted or invalid
+ *		#size-cells property
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_size_cells(const void *fdt, int nodeoffset);
+
+
 /**********************************************************************/
 /* Write-in-place functions                                           */
 /**********************************************************************/
 
 /**
+ * fdt_setprop_inplace_namelen_partial - change a property's value,
+ *                                       but not its size
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @namelen: number of characters of name to consider
+ * @idx: index of the property to change in the array
+ * @val: pointer to data to replace the property value with
+ * @len: length of the property value
+ *
+ * Identical to fdt_setprop_inplace(), but modifies the given property
+ * starting from the given index, and using only the first characters
+ * of the name. It is useful when you want to manipulate only one value of
+ * an array and you have a string that doesn't end with \0.
+ *
+ * Return: 0 on success, negative libfdt error value otherwise
+ */
+#ifndef SWIG /* Not available in Python */
+int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
+					const char *name, int namelen,
+					uint32_t idx, const void *val,
+					int len);
+#endif
+
+/**
  * fdt_setprop_inplace - change a property's value, but not its size
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node whose property to change
@@ -882,8 +1274,10 @@ int fdt_stringlist_contains(const char *strlist, int listlen, const char *str);
  *	-FDT_ERR_BADSTRUCTURE,
  *	-FDT_ERR_TRUNCATED, standard meanings
  */
+#ifndef SWIG /* Not available in Python */
 int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
 			const void *val, int len);
+#endif
 
 /**
  * fdt_setprop_inplace_u32 - change the value of a 32-bit integer property
@@ -957,8 +1351,13 @@ static inline int fdt_setprop_inplace_u64(void *fdt, int nodeoffset,
 
 /**
  * fdt_setprop_inplace_cell - change the value of a single-cell property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node containing the property
+ * @name: name of the property to change the value of
+ * @val: new value of the 32-bit cell
  *
  * This is an alternative name for fdt_setprop_inplace_u32()
+ * Return: 0 on success, negative libfdt error number otherwise.
  */
 static inline int fdt_setprop_inplace_cell(void *fdt, int nodeoffset,
 					   const char *name, uint32_t val)
@@ -1020,7 +1419,46 @@ int fdt_nop_node(void *fdt, int nodeoffset);
 /* Sequential write functions                                         */
 /**********************************************************************/
 
+/* fdt_create_with_flags flags */
+#define FDT_CREATE_FLAG_NO_NAME_DEDUP 0x1
+	/* FDT_CREATE_FLAG_NO_NAME_DEDUP: Do not try to de-duplicate property
+	 * names in the fdt. This can result in faster creation times, but
+	 * a larger fdt. */
+
+#define FDT_CREATE_FLAGS_ALL	(FDT_CREATE_FLAG_NO_NAME_DEDUP)
+
+/**
+ * fdt_create_with_flags - begin creation of a new fdt
+ * @buf: pointer to memory allocated where fdt will be created
+ * @bufsize: size of the memory space at fdt
+ * @flags: a valid combination of FDT_CREATE_FLAG_ flags, or 0.
+ *
+ * fdt_create_with_flags() begins the process of creating a new fdt with
+ * the sequential write interface.
+ *
+ * fdt creation process must end with fdt_finished() to produce a valid fdt.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, bufsize is insufficient for a minimal fdt
+ *	-FDT_ERR_BADFLAGS, flags is not valid
+ */
+int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags);
+
+/**
+ * fdt_create - begin creation of a new fdt
+ * @buf: pointer to memory allocated where fdt will be created
+ * @bufsize: size of the memory space at fdt
+ *
+ * fdt_create() is equivalent to fdt_create_with_flags() with flags=0.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, bufsize is insufficient for a minimal fdt
+ */
 int fdt_create(void *buf, int bufsize);
+
+int fdt_resize(void *fdt, void *buf, int bufsize);
 int fdt_add_reservemap_entry(void *fdt, uint64_t addr, uint64_t size);
 int fdt_finish_reservemap(void *fdt);
 int fdt_begin_node(void *fdt, const char *name);
@@ -1035,10 +1473,29 @@ static inline int fdt_property_u64(void *fdt, const char *name, uint64_t val)
 	fdt64_t tmp = cpu_to_fdt64(val);
 	return fdt_property(fdt, name, &tmp, sizeof(tmp));
 }
+
+#ifndef SWIG /* Not available in Python */
 static inline int fdt_property_cell(void *fdt, const char *name, uint32_t val)
 {
 	return fdt_property_u32(fdt, name, val);
 }
+#endif
+
+/**
+ * fdt_property_placeholder - add a new property and return a ptr to its value
+ *
+ * @fdt: pointer to the device tree blob
+ * @name: name of property to add
+ * @len: length of property value in bytes
+ * @valp: returns a pointer to where where the value should be placed
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_NOSPACE, standard meanings
+ */
+int fdt_property_placeholder(void *fdt, const char *name, int len, void **valp);
+
 #define fdt_property_string(fdt, name, str) \
 	fdt_property(fdt, name, str, strlen(str)+1)
 int fdt_end_node(void *fdt);
@@ -1055,7 +1512,8 @@ int fdt_pack(void *fdt);
 /**
  * fdt_add_mem_rsv - add one memory reserve map entry
  * @fdt: pointer to the device tree blob
- * @address, @size: 64-bit values (native endian)
+ * @address: 64-bit start address of the reserve map entry
+ * @size: 64-bit size of the reserved region
  *
  * Adds a reserve map entry to the given blob reserving a region at
  * address address of length size.
@@ -1158,6 +1616,37 @@ int fdt_setprop(void *fdt, int nodeoffset, const char *name,
 		const void *val, int len);
 
 /**
+ * fdt_setprop_placeholder - allocate space for a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @len: length of the property value
+ * @prop_data: return pointer to property data
+ *
+ * fdt_setprop_placeholer() allocates the named property in the given node.
+ * If the property exists it is resized. In either case a pointer to the
+ * property data is returned.
+ *
+ * This function may insert or delete data from the blob, and will
+ * therefore change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name,
+			    int len, void **prop_data);
+
+/**
  * fdt_setprop_u32 - set a property to a 32-bit integer
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node whose property to change
@@ -1229,8 +1718,14 @@ static inline int fdt_setprop_u64(void *fdt, int nodeoffset, const char *name,
 
 /**
  * fdt_setprop_cell - set a property to a single cell value
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @val: 32-bit integer value for the property (native endian)
  *
  * This is an alternative name for fdt_setprop_u32()
+ *
+ * Return: 0 on success, negative libfdt error value otherwise.
  */
 static inline int fdt_setprop_cell(void *fdt, int nodeoffset, const char *name,
 				   uint32_t val)
@@ -1269,6 +1764,36 @@ static inline int fdt_setprop_cell(void *fdt, int nodeoffset, const char *name,
 #define fdt_setprop_string(fdt, nodeoffset, name, str) \
 	fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
 
+
+/**
+ * fdt_setprop_empty - set a property to an empty value
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ *
+ * fdt_setprop_empty() sets the value of the named property in the
+ * given node to an empty (zero length) value, or creates a new empty
+ * property if it does not already exist.
+ *
+ * This function may insert or delete data from the blob, and will
+ * therefore change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain the new property value
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+#define fdt_setprop_empty(fdt, nodeoffset, name) \
+	fdt_setprop((fdt), (nodeoffset), (name), NULL, 0)
+
 /**
  * fdt_appendprop - append to or create a property
  * @fdt: pointer to the device tree blob
@@ -1371,8 +1896,14 @@ static inline int fdt_appendprop_u64(void *fdt, int nodeoffset,
 
 /**
  * fdt_appendprop_cell - append a single cell value to a property
+ * @fdt: pointer to the device tree blob
+ * @nodeoffset: offset of the node whose property to change
+ * @name: name of the property to change
+ * @val: 32-bit integer value to append to the property (native endian)
  *
  * This is an alternative name for fdt_appendprop_u32()
+ *
+ * Return: 0 on success, negative libfdt error value otherwise.
  */
 static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
 				      const char *name, uint32_t val)
@@ -1411,6 +1942,43 @@ static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
 	fdt_appendprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
 
 /**
+ * fdt_appendprop_addrrange - append a address range property
+ * @fdt: pointer to the device tree blob
+ * @parent: offset of the parent node
+ * @nodeoffset: offset of the node to add a property at
+ * @name: name of property
+ * @addr: start address of a given range
+ * @size: size of a given range
+ *
+ * fdt_appendprop_addrrange() appends an address range value (start
+ * address and size) to the value of the named property in the given
+ * node, or creates a new property with that value if it does not
+ * already exist.
+ * If "name" is not specified, a default "reg" is used.
+ * Cell sizes are determined by parent's #address-cells and #size-cells.
+ *
+ * This function may insert data into the blob, and will therefore
+ * change the offsets of some existing nodes.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADNCELLS, if the node has a badly formatted or invalid
+ *		#address-cells property
+ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADVALUE, addr or size doesn't fit to respective cells size
+ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
+ *		contain a new property
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_appendprop_addrrange(void *fdt, int parent, int nodeoffset,
+			     const char *name, uint64_t addr, uint64_t size);
+
+/**
  * fdt_delprop - delete a property
  * @fdt: pointer to the device tree blob
  * @nodeoffset: offset of the node whose property to nop
@@ -1438,16 +2006,21 @@ int fdt_delprop(void *fdt, int nodeoffset, const char *name);
  * fdt_add_subnode_namelen - creates a new node based on substring
  * @fdt: pointer to the device tree blob
  * @parentoffset: structure block offset of a node
- * @name: name of the subnode to locate
+ * @name: name of the subnode to create
  * @namelen: number of characters of name to consider
  *
- * Identical to fdt_add_subnode(), but use only the first namelen
- * characters of name as the name of the new node.  This is useful for
+ * Identical to fdt_add_subnode(), but use only the first @namelen
+ * characters of @name as the name of the new node.  This is useful for
  * creating subnodes based on a portion of a larger string, such as a
  * full path.
+ *
+ * Return: structure block offset of the created subnode (>=0),
+ *	   negative libfdt error value otherwise
  */
+#ifndef SWIG /* Not available in Python */
 int fdt_add_subnode_namelen(void *fdt, int parentoffset,
 			    const char *name, int namelen);
+#endif
 
 /**
  * fdt_add_subnode - creates a new node
@@ -1461,11 +2034,13 @@ int fdt_add_subnode_namelen(void *fdt, int parentoffset,
  *
  * This function will insert data into the blob, and will therefore
  * change the offsets of some existing nodes.
-
+ *
  * returns:
- *	structure block offset of the created nodeequested subnode (>=0), on success
+ *	structure block offset of the created nodeequested subnode (>=0), on
+ *		success
  *	-FDT_ERR_NOTFOUND, if the requested subnode does not exist
- *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE tag
+ *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NODE
+ *		tag
  *	-FDT_ERR_EXISTS, if the node at parentoffset already has a subnode of
  *		the given name
  *	-FDT_ERR_NOSPACE, if there is insufficient free space in the
@@ -1503,10 +2078,45 @@ int fdt_add_subnode(void *fdt, int parentoffset, const char *name);
  */
 int fdt_del_node(void *fdt, int nodeoffset);
 
+/**
+ * fdt_overlay_apply - Applies a DT overlay on a base DT
+ * @fdt: pointer to the base device tree blob
+ * @fdto: pointer to the device tree overlay blob
+ *
+ * fdt_overlay_apply() will apply the given device tree overlay on the
+ * given base device tree.
+ *
+ * Expect the base device tree to be modified, even if the function
+ * returns an error.
+ *
+ * returns:
+ *	0, on success
+ *	-FDT_ERR_NOSPACE, there's not enough space in the base device tree
+ *	-FDT_ERR_NOTFOUND, the overlay points to some inexistant nodes or
+ *		properties in the base DT
+ *	-FDT_ERR_BADPHANDLE,
+ *	-FDT_ERR_BADOVERLAY,
+ *	-FDT_ERR_NOPHANDLES,
+ *	-FDT_ERR_INTERNAL,
+ *	-FDT_ERR_BADLAYOUT,
+ *	-FDT_ERR_BADMAGIC,
+ *	-FDT_ERR_BADOFFSET,
+ *	-FDT_ERR_BADPATH,
+ *	-FDT_ERR_BADVERSION,
+ *	-FDT_ERR_BADSTRUCTURE,
+ *	-FDT_ERR_BADSTATE,
+ *	-FDT_ERR_TRUNCATED, standard meanings
+ */
+int fdt_overlay_apply(void *fdt, void *fdto);
+
 /**********************************************************************/
 /* Debugging / informational functions                                */
 /**********************************************************************/
 
 const char *fdt_strerror(int errval);
 
-#endif /* _LIBFDT_H */
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* LIBFDT_H */
diff --git a/xen/include/xen/libfdt/libfdt_env.h b/xen/include/xen/libfdt/libfdt_env.h
index 035bf75..73b6d40 100644
--- a/xen/include/xen/libfdt/libfdt_env.h
+++ b/xen/include/xen/libfdt/libfdt_env.h
@@ -1,22 +1,96 @@
-#ifndef _LIBFDT_ENV_H
-#define _LIBFDT_ENV_H
+/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
+#ifndef LIBFDT_ENV_H
+#define LIBFDT_ENV_H
+/*
+ * libfdt - Flat Device Tree manipulation
+ * Copyright (C) 2006 David Gibson, IBM Corporation.
+ * Copyright 2012 Kim Phillips, Freescale Semiconductor.
+ */
 
-#include <xen/types.h>
-#include <xen/string.h>
-#include <asm/byteorder.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <limits.h>
 
-typedef uint16_t fdt16_t;
-typedef uint32_t fdt32_t;
-typedef uint64_t fdt64_t;
+#ifdef __CHECKER__
+#define FDT_FORCE __attribute__((force))
+#define FDT_BITWISE __attribute__((bitwise))
+#else
+#define FDT_FORCE
+#define FDT_BITWISE
+#endif
 
-#define fdt16_to_cpu(x) be16_to_cpu(x)
-#define cpu_to_fdt16(x) cpu_to_be16(x)
-#define fdt32_to_cpu(x) be32_to_cpu(x)
-#define cpu_to_fdt32(x) cpu_to_be32(x)
-#define fdt64_to_cpu(x) be64_to_cpu(x)
-#define cpu_to_fdt64(x) cpu_to_be64(x)
+typedef uint16_t FDT_BITWISE fdt16_t;
+typedef uint32_t FDT_BITWISE fdt32_t;
+typedef uint64_t FDT_BITWISE fdt64_t;
 
-/* Xen-specific libfdt error code. */
-#define FDT_ERR_XEN(err) (FDT_ERR_MAX + (err))
+#define EXTRACT_BYTE(x, n)	((unsigned long long)((uint8_t *)&x)[n])
+#define CPU_TO_FDT16(x) ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1))
+#define CPU_TO_FDT32(x) ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, 1) << 16) | \
+			 (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
+#define CPU_TO_FDT64(x) ((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, 1) << 48) | \
+			 (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
+			 (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
+			 (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
 
-#endif /* _LIBFDT_ENV_H */
+static inline uint16_t fdt16_to_cpu(fdt16_t x)
+{
+	return (FDT_FORCE uint16_t)CPU_TO_FDT16(x);
+}
+static inline fdt16_t cpu_to_fdt16(uint16_t x)
+{
+	return (FDT_FORCE fdt16_t)CPU_TO_FDT16(x);
+}
+
+static inline uint32_t fdt32_to_cpu(fdt32_t x)
+{
+	return (FDT_FORCE uint32_t)CPU_TO_FDT32(x);
+}
+static inline fdt32_t cpu_to_fdt32(uint32_t x)
+{
+	return (FDT_FORCE fdt32_t)CPU_TO_FDT32(x);
+}
+
+static inline uint64_t fdt64_to_cpu(fdt64_t x)
+{
+	return (FDT_FORCE uint64_t)CPU_TO_FDT64(x);
+}
+static inline fdt64_t cpu_to_fdt64(uint64_t x)
+{
+	return (FDT_FORCE fdt64_t)CPU_TO_FDT64(x);
+}
+#undef CPU_TO_FDT64
+#undef CPU_TO_FDT32
+#undef CPU_TO_FDT16
+#undef EXTRACT_BYTE
+
+#ifdef __APPLE__
+#include <AvailabilityMacros.h>
+
+/* strnlen() is not available on Mac OS < 10.7 */
+# if !defined(MAC_OS_X_VERSION_10_7) || (MAC_OS_X_VERSION_MAX_ALLOWED < \
+                                         MAC_OS_X_VERSION_10_7)
+
+#define strnlen fdt_strnlen
+
+/*
+ * fdt_strnlen: returns the length of a string or max_count - which ever is
+ * smallest.
+ * Input 1 string: the string whose size is to be determined
+ * Input 2 max_count: the maximum value returned by this function
+ * Output: length of the string or max_count (the smallest of the two)
+ */
+static inline size_t fdt_strnlen(const char *string, size_t max_count)
+{
+    const char *p = memchr(string, 0, max_count);
+    return p ? p - string : max_count;
+}
+
+#endif /* !defined(MAC_OS_X_VERSION_10_7) || (MAC_OS_X_VERSION_MAX_ALLOWED <
+          MAC_OS_X_VERSION_10_7) */
+
+#endif /* __APPLE__ */
+
+#endif /* LIBFDT_ENV_H */
-- 
2.7.4


