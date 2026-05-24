Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id I1+aKD5AEmo+xAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A02385C0E86
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318177.1586542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIa-000233-TW; Sun, 24 May 2026 00:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318177.1586542; Sun, 24 May 2026 00:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIa-00020j-QO; Sun, 24 May 2026 00:02:32 +0000
Received: by outflank-mailman (input) for mailman id 1318177;
 Sun, 24 May 2026 00:02:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIZ-0001n8-35
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIY-005yAt-FY
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:30 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a123fa3-2eae-0a2a0a5409dd-0a2a450c9d92-46
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:30 +0200
Received: from [52.101.125.127]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124013-62f1-0a2a450c0019-34657d7f2312-4
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:30 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:28 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:28 +0000
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
 b=KFr1mfrAx7rNqF+hvL6SYtx52/aMH2athAbZg12Q65BcKhPerre+70If0MTRJ0yakbs3TQG1CKpKa/aZyBeoQFJA324jddF3fr6wF1GqVoncZSHHxRZmPfDc1h6hmE2N7X5ZTUFsOZ/X8B79HAThBGwUi7oNEKXhkGjF3IbgFLd8iFVKPjNufpy1Ef2WWmowWvCtI0mMXSTBnhHODoM60pJx7/2DjWxx5p6z04Q49925nbY1/C1/d1KznbXK9ObQN0W8UfvjDQKBYBOws7nGVb94iW+jplrmdlOCb6QG35BXqW8Hy9NeEj6O7+GXzszPH+jTK8dYDUCe8uL2gcXVow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2UfY/3UMMggWHpVy8hTvzn9Q/XVS99ND9b9p8Gen/A8=;
 b=R+nv58p/w2FBN7x+0o/VBUN5tKnZ9zKAf8fkll0bo5tPdXl/xJZhOQaaC8OZ6Jov7PUZlgpqY5q1eebKOyaCG/2AOXs+B5NFFtZpvLY1ZqqW3yiIm/QGaRJMhvdeT6Jdxm9hK7smtLf2ypVIgZWD5IZzYGl1o/mJt8KSJfkHNkSAxktSQ4sDUO9TkZkF74lESWVmRuuou22nrBC8xvXVGlxXQpKibDKFCWk7j1GGtxVAbE9NwkTlhygLwi+tjypa/F8hbC5Sxp6noAE9r0p2vL8sTdegNN2C7fpfMQALb37kto3fQLFYjIoCTGWIlXGdpzFRy2oTAXKcDNyG+ijYCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UfY/3UMMggWHpVy8hTvzn9Q/XVS99ND9b9p8Gen/A8=;
 b=idq0Xw8FXNUNpAylWnYEsWot+JrpoHNK1mVK/F9o/GKpt+7nfm9TWFJNm0UJU2tWg4RafIakP6JODVl/TRVji7popEFYcKp4qKedQ3wzP6X2SyBuLt9zVRbBfkJbD0scIM9NqqBShtinlwPeOfz52Hzmhl66twXNDObf2vDUo6U=
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
Subject: [PATCH 02/21] xen/arm: NUMA helper functions via Device Tree helpers
Date: Sun, 24 May 2026 09:01:50 +0900
Message-ID: <20260524000209.292370-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0362.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::16) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: df9bbf5e-7fda-4f2b-7e7d-08deb927be96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	MDNCcxtxK0T2M49WJme8aLzQgtWjoM7ulHUY74PoPexnCPzJabwdncCJI4gzgz3XAVxjcIdSne2WCEGV5bqTqqUH3LVzjoYoZBG9BF2lBqh9CJZq8GJxFEz5tBQ77ag8qW9x9cZvSarAge8CJ63EUdemnxqajSwNNO3/gtBDmgNSF7M31vVDwc7Y/WwbawxA6rNmftq4sJ4ndE9RBSSzR3vH9bZKQfSjOLQxK80LSB1a0YI+F1wfB9mTAmf2sqYSaZvZx/xmnCksplq6iYvRsEnN1xlRHRGhKFbTFNXZChFnS82vXnR21SKC6CDpSXHWc5mEeDmAog3BvaMHwzrg93u9xVwCUcbiPfsbhKai0Z6hwSMnSVZ65nReqVdk7hrCfJQRRRiu4FLg+jwTtcbCDIRw7mhZzwM+++DUwlSmKjq/0koZYJUfitv8YCOl85bbDoAChCBlLcW29Oynhx8m++MYdzyb0pAu8JdbioyAw3nflRyk1r7cCD72Hm6lNzFoPxPuM3v3gDOL/HFbX+UjJgub/RwjBO7Ojp+saPkj0YCfW5xw8da1U0dfLuFxq+gwLbj6i3naNS6ywBMKV+8Vs4H/ScLVxj/rLJKXLRVJX61eASa9Dt5nei9X2oN80IlNBYZeK+IvJRJFivw2UlnoaqZNLiYqp8cT5sVM6aRf1fGiY4IWql/fQrKxo7xQ1fYX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xBjJUdMFMY2sxBaqThQafBvuvY41q7wOhHhlGA9vHKGIqAJf1ra5iPqbLrvy?=
 =?us-ascii?Q?veFEsaOFoGxRo9aCIHzrj09vL1NbDC5ULBVF2Alscu9bFwQe7TLDjub25j59?=
 =?us-ascii?Q?vwUuFQW90PN0QIatyFRHmrPcqgZ1VhKNuewpwtEJSjxouC6NlRRhbnqRIp3i?=
 =?us-ascii?Q?M8UruoWv40xK36fdB9NmpSHlT5Z5UODuWBBrz3Un4v8VbNI/0xkGOW2LDAHD?=
 =?us-ascii?Q?pInzs06KoSUJS7JryyusYOIhTPE2jE9mLPGcN9Fs37d4wB3rbmLxnuOaUt0q?=
 =?us-ascii?Q?OgbKL2y18bNjAhg+ghuCxBXNHYy59mrQQBV8e2x8xUkITp67naQHN3lK0NgP?=
 =?us-ascii?Q?z3srmDzDynJ7teRAZMHd3IdRCOi2S/ruddNhUA42dt6qmYO46qNJg6ZfpQZS?=
 =?us-ascii?Q?V4/T7TsXxTWTZbabQYBVB8b43a4Jz9JMCe45Ct8Wi+bfU21+cr8Drw3vhi12?=
 =?us-ascii?Q?HymLYw1NfxeRKYG7zJE5Y6fwaatc4DuH0zjHotCn0fgvoa0Rq0xM10f6A8bs?=
 =?us-ascii?Q?O1DM3eD5P5Z5xsC1ifsNogfsVOBkH7lFlzWw+V/ykExWNbCOfF4Bm2GzVdHg?=
 =?us-ascii?Q?yN5kCWu7Yzu/lpoM+0gRMdfA5FlaBE40QE1WIUsFqchcsbatKruEHa5lS0iJ?=
 =?us-ascii?Q?T4ec8Fe93PMQVUhFOt+OQSmP7wOsOrULUJEAJF6WklE+ndby9zqHBLxh3MOM?=
 =?us-ascii?Q?OutbVn/uELTTZJRUR38z+QGHoWFMNDO5/i0s7FNhc5pjrrGQztHjuWIaubJ3?=
 =?us-ascii?Q?RS2A/eAXnHaelmnH3+4Ir0EIdGgtnQnnyT3r3+CJJv6Urtpp93kWcu0qNS+i?=
 =?us-ascii?Q?0x8U1Gd44azrS+V6aVXGy7v9ht/OLX28RpVC5A6tIaPBbiDojtufCuXYwChU?=
 =?us-ascii?Q?0GFXAz/bQ5WkAAAF56nKI3FKWiV6FzQ3loDJCn7q8o2smrm5EvucXJBE7xzW?=
 =?us-ascii?Q?rfFf19FNs5Nxft5j5/hCSP0Cd/0oNs8KubGrGo6zAFbEkoMGtkKzdIbRLtCz?=
 =?us-ascii?Q?cBeq1pPxJL3IxXoNEhzHuFkpryoN7a4EFDtE1AdP8D7KtWi9yU85GIvQnWNT?=
 =?us-ascii?Q?QkPq9NhR7gTrgfNSdD1AjEL7/tQKqLZfoD8ZG2apa6UqN4dqlvwvcjITzj33?=
 =?us-ascii?Q?hfw1aUsZdO3NJu48/wTvyTDmPzoM+2l3r82CHbGgt7ZLVyhO8gf0va6En5VQ?=
 =?us-ascii?Q?kyqL/8116FXEEuUd3ki/OVpxbl27P2ZZijx8SaBG9uT219zwshyyygFFIKTv?=
 =?us-ascii?Q?ZeOYegLsZn0TQxBnBs/h2Z2ixVT0rskkePMVrb6q88YAAymseQBcE1WkiuWK?=
 =?us-ascii?Q?rEW6GSM3f/34g4vkS7+NYvda0DOPjXsTy93+foSdwySmTbCPb9iaS9gXv+gp?=
 =?us-ascii?Q?Xx2KxUiI9OLczKBBFqj4bQu7jnqpR1NtxYl+5JuMF2/32ZA96oLvMbNEsMVx?=
 =?us-ascii?Q?FBu5RKFYFXoVFdxeDC364qgTYYc0XaAKCn4bR89h4JFVOFcxBVImkxXTETmK?=
 =?us-ascii?Q?aIt2LbNDVJhOjMQ1KPeOUnP2BcSTz/yyIeyJoafbyfHxQk7Xy3PwBEWKVU2Y?=
 =?us-ascii?Q?0AKoWiVt1058TiPNm153nRoRhm50Q1HCbM4B3GWrUwcY22+wqgIDBe+vO0AN?=
 =?us-ascii?Q?AAjMeWijit5zFyxdDaMCw+gGe74j7hqYqOgZuSl+wq75l+8f0FtjjFWykUoA?=
 =?us-ascii?Q?cF39ADzBxUiAjlp55umyn2PZwvTAu6VQyo0/kc+oNVGmrES/hg3FvgMftDP2?=
 =?us-ascii?Q?vCMY1ka42A7crobhwXNRCL3I4iSxDqSqWSDHpdRvByInWXtm+G6rF+A/zGp+?=
X-MS-Exchange-AntiSpam-MessageData-1: rH2jOF8uG9UzAQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: df9bbf5e-7fda-4f2b-7e7d-08deb927be96
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:28.6628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: am0fyNu7DBvXQXk9xWtx4Pwz73oA+e9rNhxrG57p1JHBU2sFe46eqij5blOWpD1oIwCrJoyKqHexCuonuRPsWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-d25034/1779580950-F4A7ACF5-FAAA2D2F/0/0
X-purgate-type: clean
X-purgate-size: 2693
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
X-Rspamd-Queue-Id: A02385C0E86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Implement the NUMA helper functions for ARM Xen by invoking
the Device Tree-based NUMA helper functions.
---
 xen/arch/arm/Makefile           |  1 +
 xen/arch/arm/include/asm/numa.h | 18 +++++++++++
 xen/arch/arm/numa.c             | 53 +++++++++++++++++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/numa.h
 create mode 100644 xen/arch/arm/numa.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 982c6c396a..d732918dac 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,6 +51,7 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
new file mode 100644
index 0000000000..a1fa54f2e7
--- /dev/null
+++ b/xen/arch/arm/include/asm/numa.h
@@ -0,0 +1,18 @@
+#ifndef _ASM_ARM_NUMA_H
+#define _ASM_ARM_NUMA_H 1
+
+#include <xen/cpumask.h>
+#include <xen/vmap.h>
+#include <xen/dt-numa.h>
+
+typedef u8 nodeid_t;
+
+#define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
+
+extern bool numa_disabled(void);
+extern unsigned int numa_node_to_arch_nid(nodeid_t n);
+extern u8 __node_distance(nodeid_t a, nodeid_t b);
+
+#define arch_want_default_dmazone() (num_online_nodes() > 1)
+
+#endif /* _ASM_ARM_NUMA_H */
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
new file mode 100644
index 0000000000..080d7892ae
--- /dev/null
+++ b/xen/arch/arm/numa.c
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Helper functions for ARM NUMA.
+ *
+ * Copyright (c) 2026 VA Linux Systems Japan K.K.
+ * Author: Hirokazu Takahashi <taka@valinux.co.jp>
+ */
+
+#include <xen/bootinfo.h>
+#include <xen/init.h>
+#include <xen/numa.h>
+
+#if CONFIG_ACPI_NUMA
+#error "ACPI NUMA isn't supported yet."
+#endif /* CONFIG_ACPI_NUMA */
+
+
+bool arch_numa_disabled(void)
+{
+    return false;
+}
+
+unsigned int numa_node_to_arch_nid(nodeid_t n)
+{
+    return numa_node_to_dt_nid(n);
+}
+
+u8 __node_distance(nodeid_t a, nodeid_t b)
+{
+    return dt_node_distance(a, b);
+}
+
+int __init arch_numa_setup(const char *opt)
+{
+    /* parse "numa=" option */
+    return 0;
+}
+
+int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    return bootinfo_get_ram_range(idx, start, end);
+}
+
+bool __init arch_numa_unavailable(void)
+{
+    return false;
+}
+
+void __init numa_fw_bad(void)
+{
+    printk(KERN_ERR "%s NUMA info is broken.\n", numa_fw_nid_name);
+}
+
-- 
2.43.0


