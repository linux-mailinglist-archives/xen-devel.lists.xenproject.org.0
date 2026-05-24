Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLiPDz9AEmpFxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E78885C0EA0
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318214.1586650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJ5-0006GX-Jj; Sun, 24 May 2026 00:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318214.1586650; Sun, 24 May 2026 00:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJ5-0006D8-DS; Sun, 24 May 2026 00:03:03 +0000
Received: by outflank-mailman (input) for mailman id 1318214;
 Sun, 24 May 2026 00:03:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwJ3-00064q-SO
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:03:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwJ3-005yId-8f
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:03:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12400e-2eae-0a2a0a5409dd-0a2a4504c06e-20
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:01 +0200
Received: from [52.101.125.126]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124032-1dec-0a2a45040019-34657d7e3800-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:00 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:57 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:57 +0000
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
 b=YQH/wlxKECsi9JaiDpa4H5C2e/Tc0UHzUeYMeWpt7PVnpIf51zx3DAvIyJ/ZliRBxiKrOH5W5gGsieidRqTM65gXbRg1vCWE4lJWrD2ZecGEAs+nkqfiRWipehJHbWlSMsXuoFPKOMmgCJGNd9CLvhL/rKUsdPdeB7uQyT1z75ttU4ZwcISFNUVlkkuMW4p3jt19KOAAfs+RZjaJYQUXz54ZRzPhlQJHq05yM/RI7fU0ZGqXqetJaJk15FwlPeTwIkKYtjs8SzpRV9uCU4Nk0v9rypEXOKed/w2IskMLznkuEmPqJH/oxyJRnpgVGkal6j2xYAU+/tk36tP82Gx6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blu4oOd7tpGPVUBQPLctq+uqUO6TNkR+RChL3tWjD80=;
 b=UW38uiKJ7CT9NDilJO3jMNm6lIz7dxIcAlizc4SaYvqx7qW5HS71OlKC8Y8Unq1niBCDH+gk1ZC8WyIw6rsYOk1T6rtQKonCn1FWddlQ6FS/ZF4A+Pl/aniZUfb8TeFu3oVBhusunMrr6JKI+jt71Xo+rQ4v74u92U3hMxkwhVpaLsVeDiblSy63U8clnl8X6KgvnWUCoqjleyrBtBAYlVSL7ikd8vrDI+2q/pNdvpWTmOFfTCoetNAQJAYLSjVFH7E3QJ0/OkRAFKUtOTE07/3Kj5j+gNAPXvLcBN2GpmQqVClltKX2sCNFm6nZ6gqWpjWB5cy5YqD+1sLyS/na+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=blu4oOd7tpGPVUBQPLctq+uqUO6TNkR+RChL3tWjD80=;
 b=rdmA9BUL9vjRZlo4RhpHxqDzfamWF2Pb9aU786Fu36QUjR1uFZFxk1fGMalwj4DTIA4JrVU5RbFVMxxF08z7fq9sqF6BM4U2gWEhqAeYTpKSncpuno6CDY+VFC1bYp0WIGKJQt+WBln3zwzLE0j1Z9w2uxLDlKWt4KjOR7or4GM=
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
Subject: [PATCH 14/21] xen/arm: Set Domain-0 node affinity from dom0_nodes option
Date: Sun, 24 May 2026 09:02:02 +0900
Message-ID: <20260524000209.292370-15-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b99f45-8beb-447e-7c86-08deb927cfe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	gxwkfaTMKAqlQEEnXHj4KvcQRB0OLOPgWkw+aGwZz37itZOg62wyRn+fXoUniWBfkQgiDe1T5u8yJI5JiHNjgjAYtlPZMxhjpBq8lFtAhslI2JOvKuwEU70VMjxK4iw4OtTlaYTkiPmMXCy9dlc5GwhO2edDdupBt+nJRBNhaFqBiX7keyWeF2Kq5Y8nTCtfdAUUD429wIZfuKcxYokT2dXwWLZBYIhJA5oH+2BtCoLFHvr9f/HYIZBoEqmzTlO++O++Xq8R7+lPgV4rLSYA51IwFZT3BaceBTfmP7qaRN4cmt0eKyWqcBVO7Qow+To97YOuFdyrwiv2AXdBoh+0E/y62dl2grRUqtR+fKF4YHdxfXfexRSaGhKWuLD9YuExtDIE9IARXklShwvEMe4RejaiE/Q102WTty9tcSH8nFScyQtgvpTGwJocWd8N4VWIpUkKdUk6BRMY/DyNSs1VzZx8v71G3OyPny/iiXzJoGfe0G62aYi0Gky1AK+Z49tm6yFzMnnMf7vrsOKz7DodqRWOee719MlGHvRsuAFr6ch2WtgXmOAgCX9qwmcXS8tTFGelDAh3xM452w4z2Pp3AVg23/+/uMPLPUYBLyFljPgvphpYgxF5X51WTMdr31UXBBOIgBC9qPwb/kJnJxEJNMNMzNl0DdkntOk/wHpgClxDmVp7S53YTOwnQ6Xf7Ibo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eZhrmdJ2IMwteR9gnQzkJudDtJZI7LA8IjsxR8dIXzYWwpl78hvldT21Akv+?=
 =?us-ascii?Q?mWm9nYDgwW0Xg/y+kBo54keXhJyXLoIbLwRmJALxXSPEfW8O3CHFbSQtta3i?=
 =?us-ascii?Q?Nf2zJI+G24EXcQGQ+uhKO+VOkeWkbyF+VstqSwc9/jrLWhULFj/vrYRYwJ6x?=
 =?us-ascii?Q?E5Q8T7Kn4udr5t4FbV0qQegea/kMdP/iZwOd6lyn6HLQqcptkOt0rsTvMAfU?=
 =?us-ascii?Q?C6hnQKdQPkTbR8qEWC71HsRioDg2Q5gg3By7va/XPCnAryZZ8V0BRaUWsnCG?=
 =?us-ascii?Q?kkL+Zq8l6jtUavbV8TGrBYd7CuyDNym7JeZDqh4+j/IPiy2qPrps0Z4aHf6h?=
 =?us-ascii?Q?2PvY8KBRcIzYrKL23pFX0qFBWU07AGw0/VZf8TSl/GVr0gKwnmU013rRgqf9?=
 =?us-ascii?Q?3cuKjzchnXvCG0fqZGY4ZSY9FPGJ4kHyRxj3NsUWaK1LpXGaHPeKWpvX5PXH?=
 =?us-ascii?Q?YIgBUntJWLZeoHmvaBzqwQQCIa4oRwcIUlbtL7n6o5krEeIc9aveunfmc7pO?=
 =?us-ascii?Q?WkU94IzpLPV+UMkP5Ge112mTFXqMb5CiplzV6O+hrIw7/9kkAW6eq4yTFb1k?=
 =?us-ascii?Q?DAnjmNCZY6DSnxvWbHpIrYN39ndMdiryeBs9VPvU32c27Z2v9rf9A2bmuUzj?=
 =?us-ascii?Q?XNVwTaLLq+iYhJcFbNryQUhUoT9KyOqALsRcKBPGdVMt8PYl8zBrc+uJqexC?=
 =?us-ascii?Q?3rAMkB0iOoGPUi3c58+tcJAucZUmYDVnqBApkUJgl7nmI2LqzK4rgKz7dc8L?=
 =?us-ascii?Q?aflohRX77DBFIJcetxog+w1BueHYjkPKUpwRZIuauwZVQk4g9GrhBBH/p/6R?=
 =?us-ascii?Q?qRx48qK0MzDo87/SMZ0vA4byiZFLmmdVypUR322jXF9ECtNH9cwoVGBu4uwe?=
 =?us-ascii?Q?UE5f2OWwfbPqfPKobr1LU9qYlIWUyjs0Ga0czx2z/oknGxbDw+W+BC8zsYXO?=
 =?us-ascii?Q?BrN77bzgpwb387/7Yf0/CZj9YjfBUpPrwTaxOv6218ZjB+/7hsyDwJFM3YUy?=
 =?us-ascii?Q?hIXFgymFrg20OE/RfHShGUVWfjEJpgXX950d39rfp6SxcQqLavud6U/oGwyI?=
 =?us-ascii?Q?m6vYwbhiQluAx//Pce6keFztGytfvJv12tMPA4PjhigQoLnV5cRFylHGy7Ku?=
 =?us-ascii?Q?TB1hmJqtpuPo3NidKT+vmi96IJIMmFFubcr6LLK7JC/1Kb87qaTFe0cQkiLs?=
 =?us-ascii?Q?rcKOaFdAgD9kiTVK+ZAveymkzYHHzv6Ndd0FGbIWwx9SHbS86QNqTX9eXobz?=
 =?us-ascii?Q?VrDqXo3Ibx1K8jSFdvrtUigXZeskJYOydc8yn9SLP78zDpAEOCjTS4Dgn4oa?=
 =?us-ascii?Q?nSU22bc+w7jpswMqDvICxS1o1hh+H+NaahxeE4U07BG8QO7JKWRTjPgCelv9?=
 =?us-ascii?Q?Nl/AVuXy5ZSCLkI/EPUIDVf7XrJEveypDJwDkezO3Rrg+9GMEffjcVslWuO0?=
 =?us-ascii?Q?bU1EIwweHkoVtQgRbb+U65CkEBq1W1yZBXJk21NFtVYPbxz9i31iTkZsvXz3?=
 =?us-ascii?Q?EehLEY4GC81PvnhkuPFlqtKEMREyfFyDm5xt/02BzrOkf7KDxwyC2BxQZFkR?=
 =?us-ascii?Q?hojrPvIdfOJnx9KtukIxJqtKMg0bdyreJUgDc0UBZqmzlmwdU3A+RiDCzoBF?=
 =?us-ascii?Q?d+ksn0y0b/JHX6KlzaF461t0O0E931OiRPneou4QltWTOeXToH7t5VNZ7MUQ?=
 =?us-ascii?Q?atcXyMVC5g5/hDojpWsXGLpyWzIZmFJMRzAOIv0+jj9hhPRy+HLYRqAD1c4X?=
 =?us-ascii?Q?NBC14Fhuacx26Sfi87DI7lW9SOQNSZ/5OFQfk6ixPrMKPs9Knzav9l6r/duE?=
X-MS-Exchange-AntiSpam-MessageData-1: fbQEOer6YPHR+A==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b99f45-8beb-447e-7c86-08deb927cfe9
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:57.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UM3aiVynNIoeaZMQJIMysXytLRT8ZOJACWBV3UsJp4I3FvL4Sm+7rm4igSaqfJjkrkxv+V9AKGcgXUNeBRxHMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-ebf023/1779580981-291763FF-D3526000/0/0
X-purgate-type: clean
X-purgate-size: 1124
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
X-Rspamd-Queue-Id: E78885C0EA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Set Domain-0's node affinity to run on the NUMA nodes specified via the
'dom0_nodes' boot command line option. If the option is omitted, the
node affinity is configured to use all available NUMA nodes managed by
Xen. When Xen is built with CONFIG_NUMA disabled, the node affinity
falls back to using only NUMA node 0.
---
 xen/arch/arm/domain_build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f4187512b0..2518909ed0 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2027,6 +2027,13 @@ void __init create_dom0(void)
     if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
         panic("Error initializing LLC coloring for %pd (rc = %d)\n", dom0, rc);
 
+    nodes_and(dom0_nodes, dom0_nodes, node_online_map);
+    if ( nodes_empty(dom0_nodes) )
+        dom0_nodes = node_online_map;
+
+    dom0->node_affinity = dom0_nodes;
+    dom0->auto_node_affinity = false;
+
     if ( vcpu_create(dom0, 0) == NULL )
         panic("Error creating %pdv0\n", dom0);
 
-- 
2.43.0


