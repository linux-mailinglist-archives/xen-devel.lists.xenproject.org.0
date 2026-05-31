Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAK9Bdq6HGp/RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C21AB6182DE
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323460.1589205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxD-0005r2-Jz; Sun, 31 May 2026 22:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323460.1589205; Sun, 31 May 2026 22:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxD-0005oQ-EP; Sun, 31 May 2026 22:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1323460;
 Sun, 31 May 2026 22:48:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxC-0005ku-AC
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxB-00261G-N8
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:21 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba69-2eae-0a2a0a5409dd-0a2a45099642-38
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:21 +0200
Received: from [52.101.229.101]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbab2-2497-0a2a45090019-3465e565b3a6-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:21 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYWP286MB2972.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fe::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Sun, 31 May
 2026 22:48:17 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:17 +0000
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
 b=ohfPRdR+DVcOyI93eBauyov+S9fRpwaii4znDrTYZZEJroSAXE6pUaT+HobRrZpKC9hB0yEcPfnOrjX9b9zTApi6+SfpRCuPvh35mae0YF0tUjhX4swVxaPVjPdyl3en6A1iRGJkmAScypY2FaWgJ0wY16l2R1qMWHICLDOdDW8blj3N3m4HVW19sACOvWWmTNcSjo/jx4jV1PbS0t8ydVqKF3eQBGuAQSXXpVdOKUGH3u2wC0eR5IK1/IzFpBssyEj6xWkSSfg1esCVE8sTNpo4mBMFczYQ6ogDfqaJ+tf8xOAO8/gZaJuAKGV4/uu1eIEQ1kwG1ZYvok63Hfp8/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0PpIfsctPCeglWGS7bD14KTjXcY3vIaW0HpDsgassk=;
 b=Zue7N3Sfdif3xL3VuJWG7sgLbqmO2UKEF6oxestLTsd+DDbrNrugNOJciG93uNJis8ceEJwMyNVKGCOOW+YMM+X+wB+vXhphzrD/Eif8CWQ+b5979cAXRax2l+u8lI9q+v51I5bZsYnI1vlNnA7EqEylcGFoPcHDtQBAVk7lL80uQ7OPnCdLSeB/j+6pSGIlZeUNZgYDiHH7vi8lKDDeNeYxqiLrNniPb8iv340BtU7NlF7Hvb7sdbh97JTaQ6ETe7i8p0dfRnO8vrQ0M6ZgOkaX1J2DoJJW7dt3/yAbl15bBjDIwiTiBznD57406FreSNwhwK1xFznjfX5uXHTGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0PpIfsctPCeglWGS7bD14KTjXcY3vIaW0HpDsgassk=;
 b=XgdTMtviog72np0uBqJGRHikrwjNj1DQeo3Nd4B+8syvu62g4FA3bYGTMT5IhzaqJvWpm5LS020obutqzDYH5Yb9oYSwu5xNXEBXdEuV6y1kOMUfDpPigW4xEbiLLWuUsYA27W0R5wBLVChBgLHpEPniX93SanC8rv40Uxm1U/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH v2 09/24] xen/sched: Make cpu_nr_siblings() architecture-specific
Date: Mon,  1 Jun 2026 07:47:39 +0900
Message-ID: <20260531224755.9481-10-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::17) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYWP286MB2972:EE_
X-MS-Office365-Filtering-Correlation-Id: f19261bc-7b32-4371-f53d-08debf66b50f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Xn1qSIhhHBHjber0T3MeDCV+Bm+L3NRx+x3hO40cLxG9G5gQFfmQ9WqZ7mJ3avs7w1RIpAZBvVBYOpJ2CFCklugJXYxMAFK5qxfMtMKqI90lFzo/M2TRozChpUdgHE4uBgV2SvfCTtJuBjY+ErLBYHwjxePX7vgn3MoZcZp6HlyDf3C5Cv0/k7Mmkm7UutONqrJzJ2pupfn7dRccoHcU+ijNCQubIqeXe94C2hD6F1hIQNVRwiweSc8ZLMVR8dcgMA3ieRBYZVMOEOGEy+fmzNp3sY8SAIQOlNfwQc+Oe7bmqRz9DLPhUdwHOS+NXR9U8YA4AcdpaWCwW9lirrgXtogRceEhXL/WGVzS+A9EHKOUpXNid1fdoyx1gQ9nXwXV0XBnJMsNNlvNZFCLyz8K8pslAnohnni/47QwovNz5oTXAExV6JIrsAhwWdeNgxuz7FvMjqrrCWjoEJQ0AzwXLhpjzYayeF0Oh/4CvmfkjMrweFikjh9I4D8DUcpWgsBNKNvD09gyu9ON5BmrE+vnAIaUm9npZ07zgOfzO4fevz56EKU/nbEgNAwQ0wRIPzwmCS2vMKN9HQ32KfQ0ULChqTa4NTfM58poxzrvGYXkGqcKr4OdtNH3RlbZKnT8rBCOGzOZkFpngn3Xi2acUJlsPkhe3TsoEO4YqTITmrTTWfFze31VC/YomXUqxS1UaHrC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ujh9yeE1qwYBs+bUUAjw3i4eC+Mk0FQqmklwqRGY2u0dxfSnB/um3TLVLsNv?=
 =?us-ascii?Q?YuGpRCTbRkeAYX/riTDifxQCmeSeYXirWEB5Amg3aE4LnsO1HzLKfkLV56Rc?=
 =?us-ascii?Q?wTGhKwFKLVaslg0c0tgcjm0ezNWq+rs0rvMh8PY7wQB9d7+LJCml1m6WqAud?=
 =?us-ascii?Q?VG2s30m/TDKr5/IcB9Mfay+JAe7DFdk0N5W+MOAMtmYCtPLdW0tToAhmltDJ?=
 =?us-ascii?Q?c8Lx5bzxlDXkEWIOvabaONK15n+NsHeGbd10lr/9byT0+c1usM8CiUK/2j5z?=
 =?us-ascii?Q?hUIqy2rJU8rmUVx97OKWKRbeeW5Assz0gKR8HUieafAUY87MIl2bUMhqZArr?=
 =?us-ascii?Q?BJBp4bF9NtuVhzOzT4oeqiVfPgiU4pPJfLpdtbom3Z3968tKLz6XhS8X4ZSD?=
 =?us-ascii?Q?WNMzYHKch1UZtR/Ly11LxgbTAOR13g26tNWE9k86iZt4R0K4HgaeXjvJaWbR?=
 =?us-ascii?Q?Uq9wpWKDqwyNTtgSpgUyGG0Z5MMg3g3ldbL0NqK6olUsGYBScArTo8FM3cmp?=
 =?us-ascii?Q?/77vq3c/Mtmct3XXGtb9ndXvuf/MxRLR+37aemyJfHSm6rnuqqPe8iW16svy?=
 =?us-ascii?Q?qLbbBwfDwZZiC6dNDO2nfkjWSpgxBbxKYHMuzSRey0zikSKGHN1bb+D1aWmg?=
 =?us-ascii?Q?ADGZ9zzIqdM9KEFnSiib04Nder2EJ7/X3RJAXK5vWhK4H+9Gf6p70m/i4Ts1?=
 =?us-ascii?Q?deLYcxQQAORs+FnkQK04/B5C/hHuGut15dIPNFIBFHU3efiGEsbOu6rGKGhn?=
 =?us-ascii?Q?Z5IFxerewY17BHbNd9Cx4B4bW9yTUF2qreuK5EvbAC0i67e+csTXLiJI1vct?=
 =?us-ascii?Q?AisPs+fjqVOuFw1HiA+RQqtigOXFZaEsyaFoxtKNEw/msqA9EMQu1WQxAPB+?=
 =?us-ascii?Q?Qwh6mYNDwfPEakG9tXhgRS8ZvLZke0b0Vu/6/9Gaga3C1o8SzUhwe2yQl+sg?=
 =?us-ascii?Q?NVQSPLTdcpdW77UeXCZ9QL0qcub51LfVQQvKnCWpx2nzr+JAJEEUA7QOVUYJ?=
 =?us-ascii?Q?RaYAw6w7XpdF6Ft1LA8PkV3h/dOgfNgwkjwuUVKdmLJFdsLXBPmdpUQMo0Z/?=
 =?us-ascii?Q?iA18o40r+rnrOGDA2M6N3w2tjU6KM9hlqi+EPPYzPJn15Y9J6LkhebLxYijI?=
 =?us-ascii?Q?8QQ7a6LOgcD7zT5lRWqEWkVXWj0r8vP3z4C0QVZ4zjyzq5tUYpS8uZ5teiRN?=
 =?us-ascii?Q?S6eGVYKD1tuce6nImW4dZL9F/veTmCXhg74wuELGrMVw7m+sayILgMdPotQC?=
 =?us-ascii?Q?shfxsy8O6ToEcqIfEqwap+1QYgeN3p+gSF6y90TLbXyBfQYLe38aexHSmeE6?=
 =?us-ascii?Q?RZfVOQDAMNy3IKV36+ds0eNSAuYv/p4ib49RJKLfRhz8E/2PAz9rNqo+Hvgl?=
 =?us-ascii?Q?LFxkpu2kbnLoPdbeCBFMXDgFQMWc3wsnSvQ9WeFpdKq4hNt7pm9fU9cqKqPj?=
 =?us-ascii?Q?5ATdILKO35b1wcUDPnQUE4pJPzgBKa5hq4FYmwVYCr09z4D8dNdKcAo8ZWVH?=
 =?us-ascii?Q?m3lX8S0nqDfcQfQfNkEiyIIunHILT8BJK/AdPtVcsPqOo0dM+w0srDX9wl3x?=
 =?us-ascii?Q?2gJQlRywfoZGfwU7jZ78uZ+lFLpv/Eqxr21rLa9aqXV7hjrjZwM85kKWjBsC?=
 =?us-ascii?Q?NhrUETZEhyFSp4ZeOWGG0GB5kmjEJHC3STvpb7xGqhI0mLUSyuzid2bFdn4T?=
 =?us-ascii?Q?zSp5lUZpvq3g9ZVknrLFOZDx+UyJtFPnGRjIc/ru9br1l5JAlO/CPdiEZ0a8?=
 =?us-ascii?Q?C8C651UnNhOxNhORboFR8ADIvkzKNClwrVAnD638q3P6C48gJ2SMUG+/ZM3H?=
X-MS-Exchange-AntiSpam-MessageData-1: FNVXF+qQz7LQ+Q==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f19261bc-7b32-4371-f53d-08debf66b50f
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:17.9022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2RaMKLTcpMGUlOoqckVxZK2OXiWxf189Hlsr/TiBV9puDgclMZ+7YfurvYGluW02B2+GiCCv3nJiQtvjOlzng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2972
X-purgate-ID: tlsNG-bad1c0/1780267701-4357BA53-B1B77CDE/0/0
X-purgate-type: clean
X-purgate-size: 2502
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C21AB6182DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Make cpu_nr_siblings() an architecture-specific function.
This patch provides the implementation for x86 and a common
version for Device Tree-based architectures.
---
 xen/arch/x86/include/asm/processor.h |  1 +
 xen/common/sched/credit2.c           | 23 +++++------------------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index c37bd7a176..3cd19e6d9c 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -106,6 +106,7 @@ extern void intel_init_arat(void);
 
 #define cpu_to_core(_cpu)   (cpu_data[_cpu].cpu_core_id)
 #define cpu_to_socket(_cpu) (cpu_data[_cpu].phys_proc_id)
+#define cpu_nr_siblings(_cpu) (cpu_data[_cpu].x86_num_siblings)
 
 unsigned int apicid_to_socket(unsigned int apicid);
 
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index dcce1e361f..2d93944824 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -29,22 +29,6 @@
 /* #define d2printk printk */
 #define d2printk(x...)
 
-/*
- * TODO: Abstract this properly, and figure out what Credit2 wants to do with
- *       the fact that x86_num_siblings doesn't even have the same meaning
- *       between x86 vendors.
- */
-static unsigned int cpu_nr_siblings(unsigned int cpu)
-{
-#ifdef CONFIG_X86
-    return cpu_data[cpu].x86_num_siblings;
-#elif CONFIG_DT_CPU_TOPOLOGY
-    return cpu_topology[cpu].num_siblings;
-#else
-    return 1;
-#endif
-}
-
 /*
  * Credit2 tracing events ("only" 512 available!). Check
  * include/public/trace.h for more details.
@@ -884,8 +868,11 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
  * Additional checks, to avoid separating siblings in different runqueues.
  * This deals with both Intel's HTs and AMD's CUs. An arch that does not have
  * any similar concept will just have cpu_nr_siblings() always return 1, and
- * setup the cpu_sibling_mask-s acordingly (as currently does ARM), and things
- * will just work as well.
+ * setup the cpu_sibling_mask-s acordingly, and things will just work as well.
+ *
+ * TODO: Abstract cpu_nr_siblings properly, and figure out what Credit2 wants
+ *       to do with the fact that x86_num_siblings doesn't even have the same
+ *       meaning between x86 vendors.
  */
 static bool
 cpu_runqueue_siblings_match(const struct csched2_runqueue_data *rqd,
-- 
2.43.0


