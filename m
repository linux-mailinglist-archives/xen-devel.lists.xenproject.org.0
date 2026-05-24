Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5OslLz5AEmpFxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF75C0E89
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318183.1586578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIn-0003AL-78; Sun, 24 May 2026 00:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318183.1586578; Sun, 24 May 2026 00:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIn-00037s-2l; Sun, 24 May 2026 00:02:45 +0000
Received: by outflank-mailman (input) for mailman id 1318183;
 Sun, 24 May 2026 00:02:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIl-00034j-JJ
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIk-000m7t-Vh
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a123fbd-bab6-0a2a0a5309dd-0a2a4505ca84-32
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:42 +0200
Received: from [52.101.125.103]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124020-aaa8-0a2a45050019-34657d67f7b1-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:42 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:38 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:38 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSNGXx45uWjRTdCWHP8vu0hNHuNQyJC4CKyRFibAR36on88tH5kPem342E2r9gyPHjCdBULx/Jrdj3uO0D+m3XbuwXPtb7KGqnLPPWwwgXjnYduQ5aqcP9J53y4HVONSmtyQN2TADeZKTERZNebVG14O/EbAiTgLs344E1AHIAVLZUUtISePCt4tEPBsRQGK0G91dDKBXOpZqGVN7sSILEoTruM31TeBKvM8o89ggnuQd1u72HqoaVsH4CMGBJRMoIdbBHC8xLiFbJEH0lBma/luD9zs+4roGvDibEOgquic8b5+/hR0d9cBliK8zIzsebNOmr3iYJWT4XPpl2Z0rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efsYPuOFBJuGq5l6y14uP1QzlvYcMA2MZ/bYJIg+6Cc=;
 b=ZW5gvFYg8G0deOojXSXDIAgILOC2eSY9FIaTE0FNZmhFkUe+o/A0cp0EPhyZNpCEdT+IK3vkQ8bE6oRfgxl2JXqiwD6eNARXI91L4++4jWJxDcUxmO/DlCpcdCYZBEnoTJft6gzk13fdpHUiOXh6kA/SYSkLmy+QP/t0YY5JUAChTGnyO/KtxFtpYnVtXJKvZH+fVdKlE4i67w1Y7Y5MsW1jffTQi1ATgUhPTiYTQG5QOUMQ6/+PnGWPDQGTByt8SiB9Ke1DFeqM9b8B88E5TXkJPtx+BwySiTph5xjpi2xATVsSXSEEte5InoNZiShUt7sB7zv+Se6PIQ4GJqLi+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efsYPuOFBJuGq5l6y14uP1QzlvYcMA2MZ/bYJIg+6Cc=;
 b=LRBdpmE4u/ReYoT8a9+I4bHSywMYP5Coa8RLK5AmI56USBpIrym9B0MbRXKmyxUH+vqQ9aa16HiKHa3rcKJvrKQ7R/xMJeJR+SOgxlkxRodL33PJCeogBP5mSKCErIUs6+d6rZfxuuwgs3OLVg8adXOd9KbJQd4VBdSdGnvhbFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH 06/21] xen/device-tree: Read NUMA node distance from Device Tree 'distance-map'
Date: Sun, 24 May 2026 09:01:54 +0900
Message-ID: <20260524000209.292370-7-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:405:2::17) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: a77c7827-6054-432b-ba32-08deb927c4b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	B21M9WJ9hrkSt36IbmSYY4mpxl7sNZvRzFvDrAPgF9rRmR483073cwVVgHvIxMHnh/sV57GRf5Y+W4sn0hcIaWLBls2ZH7452xuhDzu+nF9YZnMbODSmGdrV7hIC0mBOBQNxBnhUURTv0oHbZShO+T6FOw14NXG4FxukPSgm/2WdwK8oR59lqKTlN2oxDMNsIPBPjQY10Byz+W2ybP+NuTgnZ427RJjw0NN/MaeOGxT2QjIzB0cN3UgS8aSdMuyQlPET8b5vZr2d02/N5IoXLfcAU2rqGSNPbRDk3d3tArthOw86wOt03TCbMEIGc6XiUEHR1mdpVsvixmBo4YXR0k5ZFLCAOQaLaxlU7uEUhL3ArMJR1uIRN5+BWVnTMBAC4112uvt2cBnMnIhKwEeFbGAmXVNhmzkvpiPyxMS2qd9P8yV/PSl4KJSzWOnptQdwZqXAl7annzXsjB+i7wA/kGbtfgr7zxpr7Ot818eYac+CMY4B7q3iimV8S2Upk8iJzHlxGfkkRD1UIsYviTbQuoLMm8rDOaDPZjhERiPISIQB/KqZ6wY0m3Y1q5Sy6i/Cbch7bQzZQC+LtTaRo4hagUYbieW+h4WtLb+wBVbaJ3fSmEGrXcaGDIjpWQ0HcJev6djBiujFuiOB9vyiys4sKNWRaIuR9AImdegsfl1+p9YjYCbxj4OjUhrQL7LQDuHr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q6mpJoyCRZHzMlv0oqKoFgLLnUlkvv4HKRhQRoU8S6Sr+I6mb0hunG93v1H1?=
 =?us-ascii?Q?C5IvHvBMMvE8iWE8LSM6MFS/WObkee0cdnOk9EydGwbAyr6M6922LEwQ3cxy?=
 =?us-ascii?Q?WlTbZO38W8Fm2HBLqSXlaBEWN2DFRKi0iD86hCkjM8FgB3qaJjxIP4ygkSaQ?=
 =?us-ascii?Q?E4Be7ACK2VBgOGfsvBPuQ/g96y6tNR3Ol03rxu6VyA6PDQT8N9+3SonEGCR5?=
 =?us-ascii?Q?doRY/1ZrlSmpI6oKW4E4oJtcK70K6mrD/K0diPVfQop1G2bnIGlO2x4OXYZp?=
 =?us-ascii?Q?ai3nY4sf1/re7gCYW77taw3s9tO7WwQHIU/gDMESr+UsqqKi5cwg6cFGBNSR?=
 =?us-ascii?Q?zES3dArThGD5EB1gwf6DQxMt0RQ9o3MYWyd08Vnc2e/CNtthqBQGzWJ4Mlfm?=
 =?us-ascii?Q?T2SQi38e6VGn+6swdio3Km/fT7VreeBkuRSCs3t/Mzt5Kxj09bwOFjeX5yj4?=
 =?us-ascii?Q?4TSTXF0OX9eFZJzejs8/hS3eBjHnJyv+WmAC4GVI9xjuq5PRyylIqJb5zY9D?=
 =?us-ascii?Q?YHTbh0xkyDNZ9vwMvNAGQSGqaAU/56N7nBKXLXm1LFOZAjrMhzmWlqMwvrMJ?=
 =?us-ascii?Q?9u4XoXC3jyfR/E+kD3mMopWzAschhR2SZEiMuy6UZkeHCMyTDNwW2Ykveh3i?=
 =?us-ascii?Q?qPKIEX3jyhaASufitEAvj498MFn2ak6meZmfPf/fJKIXwsmW0Lnk8JiFosEe?=
 =?us-ascii?Q?q4d+wz57Kz2OUOAhRj3APRBluDBOPVosw41S9grEFvbmSXP03WkZNcLaijK9?=
 =?us-ascii?Q?tkyOSw2WukOsrW6ScYJ9knYCWXSHhXlsWf6oJgj/s/yY/GqdLIjuk8omyJXJ?=
 =?us-ascii?Q?JBQlRVpkdBVbz2ROvuBb3z7blYS4f1papyRoUCaAt4YtwdQFLzllJEnLCN1L?=
 =?us-ascii?Q?gN/a5CwApBwVSdljU5juL3Z/S1tUpoMKVYA/oGR/2Yj6f8BljuUrPWo+HdbF?=
 =?us-ascii?Q?N3G5xgEU3zx/YJVutOSBXXvwCHf9RKFjQvNAAMgusPXxe0VI/zUZLtxbKghV?=
 =?us-ascii?Q?4gq+G/6zM41KKdEM+nm+Whz8IQwlH8Vxhz6X1e5vnxMiXd52oawNvDAhIiK+?=
 =?us-ascii?Q?a/7xy8Wrdgi1sDZ2nrWr2iRR6mqBhHXKhO2lVCfviaX/cqrO0sGiYWE5s6AD?=
 =?us-ascii?Q?K1zi3LOnPa7ueQjl4OdHaEQbdsECrFYczQ8w9mAgUNhBZa2txwFZH65ucdji?=
 =?us-ascii?Q?iB2TCC2cNFtA8OiqJ6w9EjWRLiYd/5UQnvlf/ui3tn/MDOJhGTog9spUKpqj?=
 =?us-ascii?Q?lPQ3e0u0UjEoimGSi4bTl2kXyXKj0oKYAJ2QRYAc0TUsfBJGY1s+e/RbR4yn?=
 =?us-ascii?Q?OLJcpfhc7tGO+AcjXBinAvg99nyQBXDzAgyGZlSjuET6/Yle7JokT8MrQsHg?=
 =?us-ascii?Q?1IX7kV3L3PJTEN2JBshHgBRkJt3X/V4sT5FRNKMEBnoxMeIxePTv6XEfIdyY?=
 =?us-ascii?Q?41EyH6A8RSUR0Lm5GasURiKtq+IGZS0mezqAUXA23uKT5P9QTWOVG+Lq8sZ8?=
 =?us-ascii?Q?x4zNura9rlmYnUGgIh4HbTP7eWFr8S4hQmJhcjs4ZJSObiAZyeUohwpyxSt9?=
 =?us-ascii?Q?cOhxekXpKZWqkYUggZnRPLH6XRltMLpukvkMJqiKD+4n1zAe/+IL51U+udDA?=
 =?us-ascii?Q?JGYmwUwxGO9GGlHSNsd9wKZP8oLMymesmAfFbjz+z3gPmiXiYb2ycuKB7jY1?=
 =?us-ascii?Q?CN1ugoMwSWXgHJG8oFBzqEUQ1me99f984Z8YtEZrR449vgX5UV/ydbidiy/K?=
 =?us-ascii?Q?cVeTnOZYHbIJR3Q38D53fJ0bYea2cgmejdkaAqwZLkwwBO5y7TMR8hNk9QpK?=
X-MS-Exchange-AntiSpam-MessageData-1: xROGa/fQWha+Mg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a77c7827-6054-432b-ba32-08deb927c4b3
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:38.9077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWqR3oVj76jKGArSts1XAAJ3oqRE5VqXSsZ2auioPa2PFMmC+AVnlemTS0zryetbu/vJ1jTyzFKyk1xyty4t4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-c201ff/1779580962-E0063443-401E5445/0/0
X-purgate-type: clean
X-purgate-size: 4442
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ADBF75C0E89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Read the distance between NUMA nodes from the Device Tree's
'distance-map' node.
---
 xen/arch/arm/numa.c           |  2 +
 xen/common/device-tree/numa.c | 93 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/dt-numa.h     |  1 +
 3 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 15cad3d267..a7769b0c7d 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -41,6 +41,8 @@ void __init numa_memory_affinity_init(void)
     dt_numa_memory_affinity_init();
 
     numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+
+    dt_numa_distance_table_init();
 }
 
 int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
diff --git a/xen/common/device-tree/numa.c b/xen/common/device-tree/numa.c
index 539ddfccc5..6414806937 100644
--- a/xen/common/device-tree/numa.c
+++ b/xen/common/device-tree/numa.c
@@ -1,4 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from Linux kernel 7.0's $drivers/of/of_numa.c
+ * Parse 'distance-map'
+ *
+ * Copyright (c) 2026 VA Linux Systems Japan K.K.
+ * Author: Hirokazu Takahashi <taka@valinux.co.jp>
+ */
 
 #include <xen/bootinfo.h>
 #include <xen/device_tree.h>
@@ -12,14 +19,96 @@
 #define LOCAL_DISTANCE      10
 #define REMOTE_DISTANCE     20
 
+static u8 __ro_after_init numa_distance[MAX_NUMNODES][MAX_NUMNODES] = {
+    [0 ... MAX_NUMNODES-1][0 ... MAX_NUMNODES-1] = NUMA_NO_DISTANCE
+};
+
 /*
  * Get the distance between node 'a' and node 'b'.
  */
 u8 dt_node_distance(u8 a, u8 b)
 {
-    if ( a != b )
+    nodeid_t lastnode = last_node(node_online_map);
+
+    if (a > lastnode || b > lastnode)
         return REMOTE_DISTANCE;
-    return LOCAL_DISTANCE;
+
+    return numa_distance[a][b];
+}
+
+static void __init numa_set_distance(u8 from, u8 to, u8 distance)
+{
+    nodeid_t lastnode = last_node(node_online_map);
+
+    if (from <= lastnode && to <= lastnode)
+        numa_distance[from][to] = distance;
+}
+
+/*
+ * Parse the '/distance-map' node from the flattened device tree
+ * and extract the 3-tuple triplets <from, to, distance>.
+ */
+static void __init dt_numa_parse_distance_map(void)
+{
+    const void *fdt = device_tree_flattened;
+    const struct fdt_property *prop;
+    const __be32 *matrix;
+    int entry_count;
+    int node;
+    int len;
+    int i;
+
+    node = fdt_path_offset(fdt, "/distance-map");
+    if ( node < 0 )
+        return;
+
+    if (fdt_node_check_compatible(fdt, node, "numa-distance-map-v1"))
+        return;
+
+    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
+    if (!prop)
+        return;
+
+    matrix = (const __be32*)prop->data;
+    entry_count = len / sizeof(__be32);
+
+    if ( (entry_count <= 0) || (entry_count % 3) )
+        return;
+
+    for (i = 0; i + 2 < entry_count; i += 3)
+    {
+        u32 nodea, nodeb, distance;
+        nodea = dt_next_cell(1, &matrix);
+        nodeb = dt_next_cell(1, &matrix);
+        distance = dt_next_cell(1, &matrix);
+
+        if ((nodea == nodeb && distance != LOCAL_DISTANCE) ||
+            (nodea != nodeb && distance <= LOCAL_DISTANCE))
+        {
+            printk(XENLOG_WARNING "Invalid distance[node%d -> node%d] = %d\n",
+                   nodea, nodeb, distance);
+            continue;
+        }
+
+        numa_set_distance(nodea, nodeb, distance);
+
+        /* Set default distance of node B->A same as A->B */
+        if (nodeb > nodea)
+            numa_set_distance(nodeb, nodea, distance);
+    }
+}
+
+void __init dt_numa_distance_table_init(void)
+{
+    u32 lastnode = last_node(node_online_map);
+    u32 i, j;
+
+    /* fill with the default distances */
+    for (i = 0U; i <= lastnode; i++)
+        for (j = 0U; j <= lastnode; j++)
+            numa_distance[i][j] = i == j ? LOCAL_DISTANCE : REMOTE_DISTANCE;
+
+    dt_numa_parse_distance_map();
 }
 
 /*
diff --git a/xen/include/xen/dt-numa.h b/xen/include/xen/dt-numa.h
index c6939d0928..075d31cb89 100644
--- a/xen/include/xen/dt-numa.h
+++ b/xen/include/xen/dt-numa.h
@@ -15,6 +15,7 @@ static inline unsigned int numa_node_to_dt_nid(u32 n)
 
 u8 dt_node_distance(u8 a, u8 b);
 void dt_numa_memory_affinity_init(void);
+void dt_numa_distance_table_init(void);
 
 #endif /* CONFIG_DEVICE_TREE_NUMA */
 
-- 
2.43.0


