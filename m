Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bUF/Nti6HGqSRwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F366182AA
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323452.1589132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox0-0003xc-Ui; Sun, 31 May 2026 22:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323452.1589132; Sun, 31 May 2026 22:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wTox0-0003tW-Qq; Sun, 31 May 2026 22:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1323452;
 Sun, 31 May 2026 22:48:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wTowy-0003rw-F8
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wTowx-008Rpn-S8
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-e002-0a2a0a5209dd-0a2a45059030-12
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:07 +0200
Received: from [40.107.74.122]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbaa2-aaa8-0a2a45050019-286b4a7acd57-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:07 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:01 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:01 +0000
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
 b=eQCVtYYVuhSPpNYC88ZGBCI9MtoOZ9N85ROzpSNBfBJLokcwW37lFMscE7AQ25ApUObg0rrl2oZWOv98NO1KVNO7pTc3W28ae3N4gBlQPOmKRZFza6XPXIj/CeS4CHwrxdOx3zH/nKE707DQSc3gdZXgZVI0f5XcgG2UMeauMuw4sSLyTmnBbJbzC+ahRmyrONi2fuqE7Ti0FR+WOpjxd4GruumZSvojKEwZDl1791dX/ZMFTW0UgECDWmM7a9Ora1eVroz3TAWPgCVIh/QPRQdyJHBO7/MbuODK8ARRQk6+JNj+kO85BVu8XRNVx+LO4lUoTCWCSaYXbxJHw+g0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt03HDs8D0xUaaPxP9GLmlyiOrzESbIR6gnC5yHUmes=;
 b=ZyO/Qd4RgG9dcolUrdzdIlWychMtdEH/4BZCPBOPnHEPCyBKW876x+dOvN3RlJPC17KaGqt387i9kf8PBYrG5pEg4H9lC+E1hW9KTRP5ChnmIRoO8O/EutQftelgBZtIhVvBrctQgbTwSyoaDOC0oqKe1hrmlk41+ibglnhfikYy2m3I06dxc7qu2UBjbob3K3xlIF3khT3NHoYgLNQJM6H/fIa0Y2mdXZYHKPzUb2i0T23VDX2oMPgJ+4JZU/Z1E3Tjoy+rwNEflnEwgX91kvPTeQC+e+/ekXlET+7bkzI8Eoxv11DHfde2YdFF8aCnss6N4RpAvxclH1qv4ss5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt03HDs8D0xUaaPxP9GLmlyiOrzESbIR6gnC5yHUmes=;
 b=G2E4VAFQzhwNLQRetHN+SDJZ1BT5rznuC4o41YujOnExhS0y9dYj78oTDX5tCsduruI6cxJMMOvO3IsDltzAD0bESPkDobjvdax0I0f19smQZpcEgLnvCWPhZZ5TLJihibP1J3Ewi9MhHAXMP9/FeD4//GXJbRkdjj6m9j5pQgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 01/24] xen/device-tree: Initial framework for Device Tree NUMA support
Date: Mon,  1 Jun 2026 07:47:31 +0900
Message-ID: <20260531224755.9481-2-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e71857-fbb7-438c-e09d-08debf66ab5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	//OE2mbAY0u5fSfPy1uMFaPDBnXdInI6fTTd/h2Jzj8GtQeJreR5hQNb3y++55h7mID0sQ0zNsKbxR8zrfYxUGFx72wAw/93Wmx6u3ks/A4bRkUaveUL1YZv5ddSy83rp5US+rrLcJlDsExjdc3IvXjY3N0Imo7v/N1X6WEvXx52buYThdu5bGE9qwAYnj6AgD0EEmsnp/4/atjDM1zKdAmhVBxBoGpWYQhN7c8guGPTivfY6kv6eS4LudFU4tuR5mfR+wZtX4360g3C6U9NHug0P2dE05FyUyhDpEuauDD+va3EQKsShvcJp43Uy1c7woDHf/slKeMUdGdb67CYRuj+5aNGDwQp43UwwvfMpGinixv3QIuuzsbni8cOwm97MRPGX8qaJlsm7vTQFWZu5ygo048Kihz/J0wziXafpifkwv3XMxyhYfJGD/0xebSwQSis47zapwmyCUE+n+cA9r+njz2xaKUTEGr69mDyGM5TGL0W9y4n1sn855oMjdAZS0U0TwWEiHmYJZAmBltkgoN9HEUyAU6jefw32MLWPYv8a4CzKO9pagUoP8BzNvd7JFbljVVF54F6UKdqmW/7IuJeVht6keBrajjGK2LxRQR1a9ag2Yb1V4n4KqL58vptiNZV2DOSGlMZP/f7votnP6R4k1Sff+ZYrJT3n6Z4la3A536SINLBFKjk91w++erJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dpFHFvt3MTHjMT52nWH0VWP5zCH2m/SoGsgRwT/tiXBCYmoziWXEs0saOdnq?=
 =?us-ascii?Q?xcl4wEwd7A1cR1NGoMWWwnHONHNX96Ehc4Z2iEp0YJzMGefSf1fEBge9MN3r?=
 =?us-ascii?Q?hin8oIcFLw8l+tnAUWYT1ZsOL+Oj67T+6pTpUmAFVQiS7j+Tz7yl7IzYDrjN?=
 =?us-ascii?Q?wbGzDFU/5PuffUNCy1JMU4PJn4ylA+LaOYBBZalyAkqzoSaUa+XMf6Ou/2XH?=
 =?us-ascii?Q?e2RSmSkEy1HIxzmc8ALagokUWXo8gY74/YbDtEJqEqSfvUJkCLV6i9e4IYsi?=
 =?us-ascii?Q?6eHLgRDcDG30Sjw0zgNyVz+rMZIZjGOdsE4okLrhCrWCwsSfF7/1mCT+YmSl?=
 =?us-ascii?Q?agfqdzyrYPUGd/eXAzsTuTEiFZXKwZE+K4xuu+LM3HsN9Pm3TN190ssiyXWU?=
 =?us-ascii?Q?D7cMPPwaDcjCnbrlbhPnI25d1Yr3U4ll2+ED07aM4ld49dTYj718jtucbS2R?=
 =?us-ascii?Q?325Tc5lvbv5MG43U43SIztJKWbwb999VKOHpbobKHDsrBHarHObisM6U3nDo?=
 =?us-ascii?Q?xPI9uzf66qosO85BpLvYur8FFK1PxSN6nzOaMbi1CYFIqu00Pajqto3v9hym?=
 =?us-ascii?Q?TXOr9N60nRGhV5NRoO1q3ETFAdDN4JuqH8KJYzo5QuKCBNy2V2/ay/7hHLO1?=
 =?us-ascii?Q?YSQB/LRwJ70P1lkO1tz+MrPvYAeSm23LaY708vwOrRvw8gxYFD4Ic0fvgzTy?=
 =?us-ascii?Q?ONkwjpfkpBsD5cMNJX3ya4sMJ5BQQbxCJBPH4svdG0+0J2bSpT4aLUgTakWv?=
 =?us-ascii?Q?tWGL6Igvm29mHCD+QrcCR3R7F7bE74HwjG7+TCEV6G4YPcn6pGbVZ6S7ue1e?=
 =?us-ascii?Q?kz660K8yvfe1xmNfTQl5RHucprJAvJtUz8/B2ghxCHzX+5xPYoKp8jN6bV2L?=
 =?us-ascii?Q?ExtSByImggZq3LamIapJ727M08KjrXPbS+7iDVRpXHpqh/0BQSmT2w2eEqcT?=
 =?us-ascii?Q?q6UizEnxadQUbJ1y+tV8R94O0wgdXvuznsmjRg+A4CD90gJZx426EhPOIsLj?=
 =?us-ascii?Q?iys7DL6OKR3OkRUejYMybzF3fGVaL2GM1bEfTyzyQnTIOh4qSJsLEQBFKvjK?=
 =?us-ascii?Q?YhzjsdW3dlR2id/1TsN0map2aqNqbQd9EG44qKP42dIif8yOS0HP2Jy4Z1mW?=
 =?us-ascii?Q?QRXn5zf3NJKCCfHVpLKRhoZ5mW3kvezbnrwpq6u1gQYbcBkgoYoo3Wb3Xx3t?=
 =?us-ascii?Q?C568bhitBpAuxMh4NQfncyWPc1C8t+6wJm1r/3Wh+LFMytBk4xXaYFgm9tKX?=
 =?us-ascii?Q?86AeQAKB4YjY89vpz1oguNb6UqSrNjgCH36uEyPDDFVHnOH0JHIF5FVynDsH?=
 =?us-ascii?Q?wrDtF98G+CTnsxkVS1Q4gfeULv7+hgMEKhmyXIatBWZCdW92bn5JLwL2A7z3?=
 =?us-ascii?Q?YuliYiWWWuiCmB0BxgDlPUqkuME7cofFmzXti2fIC7uOYPktJr/z7ZFpjvsV?=
 =?us-ascii?Q?u9NjVVr5vg1JnH4B83+6jF3BH+9OAo/dC3Cg5JRsedVVcSz+fcWPjVBc3JfA?=
 =?us-ascii?Q?Twakytzge/jm05XbgwR5PfgRsbFu5Ywr+h3SF4f2bLy3V5qlUKHsAsrbDfuX?=
 =?us-ascii?Q?Y0xtXkLKpikjWDGJAe66fm2sun0Ttk7avqAuLX8PkgvUAX9wkIQxlV9ucNkW?=
 =?us-ascii?Q?NL/cO5wPM4qVIMWBcVEbAMoNIKr6MdTEV4GLCc9MiIt8wvHtZPXX5eg1Vztg?=
 =?us-ascii?Q?giK0gj9dZQO6ONAc9kk8SKCgaU4N7iSbpzp64X5l6GVyEZGzJ71MlSDj+vZH?=
 =?us-ascii?Q?zf+7W1+CGnaq11IO80RBsHiCtX4f6zj12I0tumXagFWcNZ0E0b5Kni8GvGka?=
X-MS-Exchange-AntiSpam-MessageData-1: gHnrNTusqsqJXw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e71857-fbb7-438c-e09d-08debf66ab5f
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:01.6503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L8kambpaFA462cFEIKVfLFRXkCh/w8caekcgxiHyBIsm+Ck6CMbO4yJdmi8zsqqduLSVFY6lMAIO4zbwoGwg4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-c201ff/1780267687-DAF6E443-B1A0FBC4/0/0
X-purgate-type: clean
X-purgate-size: 3575
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 68F366182AA
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
index 9036e455d6..658aa293c4 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-bindings.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
+obj-$(CONFIG_DEVICE_TREE_NUMA) += numa.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
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


