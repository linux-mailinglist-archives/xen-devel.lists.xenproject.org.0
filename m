Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MDVNT5AEmo+xAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A085C0E8B
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318176.1586534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIZ-0001pd-JO; Sun, 24 May 2026 00:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318176.1586534; Sun, 24 May 2026 00:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIZ-0001nG-Fv; Sun, 24 May 2026 00:02:31 +0000
Received: by outflank-mailman (input) for mailman id 1318176;
 Sun, 24 May 2026 00:02:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIY-0001mv-1y
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIX-005yAt-EY
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:29 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a123fa3-2eae-0a2a0a5409dd-0a2a450c9d92-42
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:29 +0200
Received: from [52.101.125.127]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124013-62f1-0a2a450c0019-34657d7f2312-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:29 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:25 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:25 +0000
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
 b=agJ/ND/peAeVtvwhCsYcDGuWxyPh/2NOwN8LwMb83rInm4PMF3FIOk+s/mdc2qZvV08ZXaQz4Y048sVRJOxORFFgIKaHLMzH6H5L4yve9xhC7ZbLlzsLxrbCKT6nIi7ePghupCIGpyyHsUs6ObaoucFlY1at1ByuNiLs+pMhvs2XO8otaUa+ojUMOXMiciMLWnZvbmu0CgpFk09sG6PNAW7ChetV+kb9wqU88ChpPthxibRlLtCooai+xA8FmGbiJqPHLPLvHqk5YfZAsys2gAtbRl7HoeHJyY3e3aA1orQK/M+lIk08pJfumM1cvsoZrC/2ko0kHr/5ukxNO2P3tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/R21pUJg6pY8bZJcj1ewVHTTXMBNM9XTiez4FJ+LVc=;
 b=OD0m26qk+b5WiVUDH5sBBr50shkiW6fcScqBirI7ksNKJVq9taoJUPO4rJcyngq/VJHR9gGPRtvrhOzhVPDEO0S/eKcKwR03PlfWYYUqoGiVhq01qJ0xPKSQDqVoO8QdNPqgwVJxtOohJJn3spfa19RifevlWa4Rve2FgyyQwxX1WbkdX9TxXTJKkW28av3ga5t1EPgYVYwAf0eUWm5NCRXNGeVlDfsq965vnPUYua2TgcutErl3cUhHjPGlyTs2q4AobNuhQDiwNA4T1b/0ZwRPAl6TPxm6iqN9CyiGinObgQNFR9FKrbrFqrc0xZmiC6YGHzn4wpXb3iyHHsX1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/R21pUJg6pY8bZJcj1ewVHTTXMBNM9XTiez4FJ+LVc=;
 b=kqkbkU6nCwFAk30Ufv+coBPb4DyJrzfpZdim5O/xidmDEGOrnuVLy0IUutMbpHxi5a0vGjazgTigf2vEUOMZ/KoCWhfx4P39HnF/eKT7m3MoA9ZNSz35+h4pk/F7+W7wn6oiIxGbPqNmZQO8MTxhaloaS2VMsMt1k4s/cZp8kxc=
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
Subject: [PATCH 01/21] xen/device-tree: Initial framework for Device Tree NUMA support
Date: Sun, 24 May 2026 09:01:49 +0900
Message-ID: <20260524000209.292370-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0364.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::8) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 78fb19ea-ed55-4dbc-a178-08deb927bce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	8yha/SU0sh9sBC5zOwGdVHT+FXrkUFEJMjSbUGIlhS8Zc3nLxG1lZ1NNmpng3UNDf43nrL1O/DR4/ZLUsN4+Yy/DxtTqp56XfLfdYihH5veYxsz2szL/IE/AVCeIPD4oCLEiXOnfgO8IIECIdB4JecZ2+u5t97sQKneoG0iLEYmH+0TAxNKZjrnmTfrxB2/0jRSP4qpxh47SzkipjcOH+lVx2KNzEeF6w1PFfBH6XGio1Fitqf4AdF0vU0V7L/fWj8aCIEOm3fheQY8aC/2XPlM0hAsXJkR1gRgIHLQ6V/Hj5gz6BdxX6zVjgDgmD0we+s8ZFUywtNsHVon64peDfemzxQss6uaPYoyQtWNYmOIFMUTKvw3/DZSlF7YdBTmb+aDGaqxraBb8pTNOHme8KruD+A7H63X1XHOyBbyR9w3adifcpnJtXIqAjhHmpNb/ifg2q/oIr+ghx9IpvQssvJJ7uBo06B1uuJbo7whlwguFCQDCbo1ba6anlmQ5XBAUSaXph3MDdGgyWVZLY4eE///Hh0re9YHY9I556O5Q46G0xpmhNHUFkZkD0V0ahlu8Pk+s5xYXjBVHNMITwSAJCbgXHvebD18Lcfask4PC2T9XpUEZe9kuoxvSIKAHSSD9opB9RbRSB3/4mDYtUqqVC0jJ4rce+tHxdO4Z7qjkjQgy3bgvYFeg7X/a8BmPlClc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mrhEAorlqh/4TDqVBqxcYMpIib4vcGYiWkZKJ3w9fEnZhzz9ZzJyeNmrw+jw?=
 =?us-ascii?Q?Nn+cYeEu+2JvpkawJpv+TWBcCZqjoGqrdGoEo7NGtrQIsqjqx/BXZBmpQE43?=
 =?us-ascii?Q?tDLSbO0PCIGMxnxELrbfBMQVMDdkRSs4vKUUXnATlclqK3wLQHoEm4LMHkfB?=
 =?us-ascii?Q?hGWtBxQYEff00ZYI1Nd7woEFIsIlbEJf+vUwxrp3B15qmutQRxBm770slVPs?=
 =?us-ascii?Q?dLEnH7jQ28Kb2s1a/4nvr0xwMoJcw1+gWCHYi+Ex8MJjfZR8HOVe+GnwmrG+?=
 =?us-ascii?Q?3uP/HsHExocdXUyYMUfjU0ElObVW+tgifcPRxU/K+ivXbvHXS5LlR4bV2PSJ?=
 =?us-ascii?Q?dGl5trhOL7r7kMNJMvgGaU+pcL7u21FcgvBZMAMUp7fVaQ/rQVlLuDoFKUlG?=
 =?us-ascii?Q?MQN9tn5PFSmXrUy8GNMxKG5KaYu7pZYkRBK3aCopzMAFKkSG1kasQwOmCJYT?=
 =?us-ascii?Q?gU89cnllUgtVcxtQqT6Bi6IsgCzPO3inDJnGA4xVjyPn7gHPutrVs2DPetM2?=
 =?us-ascii?Q?yw9PkFP89hDkmV3LjNA0D/rvGVrPUACS2BukHC6Lw7WqZMaqCoteOtJ3zv1D?=
 =?us-ascii?Q?CA8fiSGRwcLi7m2/JA4XjO28bUKeztEW7K6fnZXErb76HDNkcE96JicQ1K7B?=
 =?us-ascii?Q?FcRrC2GcRX2O/TLKwIfFX/s9WGF00m95rrGczCxACNPl8S5o9HVa0L/wQrG4?=
 =?us-ascii?Q?TAMlHb8F4UALNM1uEYCzDvYWYt9y1Gs3k4d+gfhSkuyjkh/si+OuGeudRZmG?=
 =?us-ascii?Q?43OZW/vGBFju38cvtxavUwTYfAnx0FF0IIV3iv+HXXgsLiFiB0zicAyqPgWl?=
 =?us-ascii?Q?b2qznQkKP1u64U/Q62gVNcgsgKgm/mYdTwRFIo86snw4tY8AKJZuHw4CyoYV?=
 =?us-ascii?Q?urozAC/9CKwUmuMjCCS6telVnc4CfAn8TuAYyHlwWwDCRfnybie+4oJP/s88?=
 =?us-ascii?Q?TdiUnrNm5JEXixmpFf5KYu/Zr4j0S22pNThgPrmrKC33torWBEYX2WEFFL8Q?=
 =?us-ascii?Q?b0/7kgCbTFNKEdFhHhkGUxb7A2lz9rzyXauLP40DHbakTQJQvMQ94O+nlSMp?=
 =?us-ascii?Q?sS94jLzv9Zti3tTQmY+BvvDiX2VFx4lylavb20s4VEGBwgtUAH/PrbvK6jXM?=
 =?us-ascii?Q?3EpFwdUXi66Yxp5OuZD1LOX66jLNECYzmYa34ohvLlBtUT9+MF6KDpKnwbpN?=
 =?us-ascii?Q?pl///N484TnM/AMdvlmmsJBGBtoIvNFovPzDXAkj5hoGC6Y7lRW4RRNExuQ5?=
 =?us-ascii?Q?zLhTzTRjg6/4UpRluybsgLHcZj6nt2lLDHfkpWBjDjk8++i+uuQkEb+Adh8W?=
 =?us-ascii?Q?Y9s2SDmhqIlnTq1RddiLh7DXmrINRbTDWQJ71pBYxVnYRd0/v/1L3tzMGk1X?=
 =?us-ascii?Q?WDRuu6vdqj+Z6YhjcfzkDhm1AmmOG+/N9UJag1lkHaRQr/EJgPcElL6/0dK1?=
 =?us-ascii?Q?sQ+xgKs8FiVE5m8kd2mXB4nDzvJ+YsIPByk7WjnYIxWcm+sau2fjP/nqM+gd?=
 =?us-ascii?Q?hBMk18ttVI9ttZNGNtioTH+lCuoxIiY29JNUWn0/IFKFH1M/jcbZJZNUNEd9?=
 =?us-ascii?Q?O0yC3Q+ail2Z2Hc2fTetUDYN3iO30Oak9hOmhiXU6TrOY6X5zBaRP+cfikLY?=
 =?us-ascii?Q?oAx0NYxUAE8lp9Z/682CyiiiU3Xpz5+YxZXcedqtAbPfKc/MV0To1jnAGAOZ?=
 =?us-ascii?Q?IW3976yhWaAz4gVpEknxYgkiuqEdmqVBIibQ5Yp0+I0A9B+hkAZU+V43IFKU?=
 =?us-ascii?Q?nZzE5c/DkGAWym8MNp9x5mGwOfHvh/Tuvtzz14Yi9OXqXli8uc38OnoDCIjd?=
X-MS-Exchange-AntiSpam-MessageData-1: zVtW4WOSeMgZ0Q==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fb19ea-ed55-4dbc-a178-08deb927bce4
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:25.8066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfaCjo6Be4I0oc/uUobKmx7o4I1VYJ+lfwMqQjN2WSUYgeXZPmUip2irHvQw3sLzQgTauEIBU65qwyy19g0VeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-d25034/1779580949-DAF72CF5-DA201144/0/0
X-purgate-type: clean
X-purgate-size: 3423
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
X-Rspamd-Queue-Id: 85A085C0E8B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce the initial framework for Device Tree-based NUMA support
on ARM Xen. This patch adds the required Device Tree-dependent
helper functions needed for NUMA configuration. Note that some
functions currently contain stub implementations.
---
 xen/common/device-tree/Makefile |  1 +
 xen/common/device-tree/numa.c   | 24 ++++++++++++++++++++++++
 xen/include/xen/bootinfo.h      | 14 ++++++++++++++
 xen/include/xen/dt-numa.h       | 29 +++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 xen/common/device-tree/numa.c
 create mode 100644 xen/include/xen/dt-numa.h

diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 9036e455d6..fab038d357 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
+obj-$(CONFIG_DEVICE_TREE_NUMA) += numa.o
diff --git a/xen/common/device-tree/numa.c b/xen/common/device-tree/numa.c
new file mode 100644
index 0000000000..06f2c8b102
--- /dev/null
+++ b/xen/common/device-tree/numa.c
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/bootinfo.h>
+#include <xen/device_tree.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/bootfdt.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+
+#define LOCAL_DISTANCE      10
+#define REMOTE_DISTANCE     20
+
+/*
+ * Get the distance between node 'a' and node 'b'.
+ */
+u8 dt_node_distance(u8 a, u8 b)
+{
+    if ( a != b )
+        return REMOTE_DISTANCE;
+    return LOCAL_DISTANCE;
+}
+
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index dbf492c2e3..7923be2b38 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -6,6 +6,7 @@
 #include <xen/kernel.h>
 #include <xen/macros.h>
 #include <xen/xmalloc.h>
+#include <xen/errno.h>
 
 #define NR_MEM_BANKS 256
 #define NR_SHMEM_BANKS 32
@@ -214,4 +215,17 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
                            void (*cb)(paddr_t ps, paddr_t pe),
                            unsigned int first);
 
+static inline int bootinfo_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    struct membanks *mem = bootinfo_get_mem();
+
+    if ( idx >= mem->nr_banks)
+        return -ENOENT;
+
+    *start = mem->bank[idx].start;
+    *end = *start + mem->bank[idx].size;
+
+    return 0;
+}
+
 #endif /* XEN_BOOTINFO_H */
diff --git a/xen/include/xen/dt-numa.h b/xen/include/xen/dt-numa.h
new file mode 100644
index 0000000000..721e8955fa
--- /dev/null
+++ b/xen/include/xen/dt-numa.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_DT_NUMA_H
+#define XEN_DT_NUMA_H
+
+#include <xen/types.h>
+#include <xen/device_tree.h>
+
+static inline unsigned int numa_node_to_dt_nid(u32 n)
+{
+    return n;
+}
+
+#ifdef CONFIG_DEVICE_TREE_NUMA
+
+u8 dt_node_distance(u8 a, u8 b);
+
+#endif /* CONFIG_DEVICE_TREE_NUMA */
+
+#endif /* XEN_DT_NUMA_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


