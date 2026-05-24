Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM8iMT5AEmo7xAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B17E95C0E8A
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318185.1586587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIo-0003Ou-FQ; Sun, 24 May 2026 00:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318185.1586587; Sun, 24 May 2026 00:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIo-0003M8-At; Sun, 24 May 2026 00:02:46 +0000
Received: by outflank-mailman (input) for mailman id 1318185;
 Sun, 24 May 2026 00:02:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIm-00036w-Ki
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIm-000m7t-0p
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a123fbd-bab6-0a2a0a5309dd-0a2a4505ca84-34
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:44 +0200
Received: from [52.101.125.103]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124020-aaa8-0a2a45050019-34657d67f7b1-4
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:43 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:41 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:41 +0000
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
 b=ja6y0onw41r2rJDQOemoDSgy66eGM6ASzMkFlWk6Y23mauRNldBo5Z/xQ1NL4lOT39TavGtlHrjHupmnHwxYbekGXf4dgNfQGNxzz3RRYvSDZ+26kbGqJEvkIA3rSeAHt9rBbGkVYhGB4fiQYtbCCjSQDgbrdvO0qaeLcKESxkh7nrWY+shUy54TO/NXZCwfQVIxaeIzZlFYIkkNuuN/VGMy8nTFPdDEkInYAEQVI8xEk6uwMzhIwmw+kQomLFQUotA1EAvnVnvnhjwWdgw4IKW8GEXPvp7OXErdudjTjZH8rXCMY5VJlY9Zp1W/n+KFwKZF03O83fmUgBwQRlT+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCyLbL/Ss/VTqlq+c6wx572rq1avvD+OA4b+ce+lLNM=;
 b=OVcEObM3eBJqrvT3cQ5fX8J5arpp3wKcO+P2K2QglREiNLTeLUDh060xMd3mZ7NPvG19jOLYlgslEST/NCyZdKpjX5k9SF1GQpUTbvf4Ecj7JUvuHoegUBHjn99LPW0+8oh6BOtX59GoQ0MhXzmRa3PUinLlfgZ549nV80/c5hKRmpr5m3I2El34ja27NNnNXRADx7c9o5EEqcwhS0/Zi0FI9UjgLT/gz1ncKPUf/nX7dvfXhhwcEY2Z/lQKAZlzrfiPsV2Sw6WRwZ0vwYQ8WtVu4uVy4uODVw60kNj9uFxMVew9uTExHEncwGC/w5GUMMRIE7cNzCxwkJxMn/Ki7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sCyLbL/Ss/VTqlq+c6wx572rq1avvD+OA4b+ce+lLNM=;
 b=L4uR4YZLcx3QU99GSq/y3fpfW7DNrZqD2wzC1cFkHO3jYV+6Jok9aP7tDm86n3eTX3L1Y6llnaVKjz0wG7BMrvwhYpodvJuhxuPE4+G4kpQj0pZyuvNKq+pQQdWBpkGcv+VsAqyVwcXp0pzj2XcGsI/K6zFpPV3buAyn5tQJq0M=
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
Subject: [PATCH 07/21] xen/device-tree: Parse 'cpu-map' node for CPU topology exploration
Date: Sun, 24 May 2026 09:01:55 +0900
Message-ID: <20260524000209.292370-8-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0058.jpnprd01.prod.outlook.com
 (2603:1096:405:2::22) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6e3ec9-e9d5-43c7-9c5c-08deb927c62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	9+AtnXuPwiaWQwBp1gS6f+BubTb4nVKWoanPLq7VX5E7onJ0W5YqXcD6OvHTOgj6HW7TCvAj1q/Ft6pDx4z9IvL9Gsng1GF2UdwQ+m3ML2smy3x6p830n70na81za5oa8L7QiZcZ+m5EtxQADlzj+O925tcex+5A9f3peRqkyfzLFh/pakGa0Neh8NxQqhBG6KE99LWLiyATN6VIaKV1tg/ZurGMTD8c3JOB1OYnwPCte86xcPdmVX+kanQiMEIGdoDvAFEfOT9tzX+IyUyNnegkPj/AFe1h7bYSJuJBRtBwjmAC5MDl5H3eb0uh45OSYJ+KbSHIcrfyrPNlbcuNi/UuO3DIDSDPJkArNsMHlGJE5O3oZZFYOHrgjpvJ5ct7NTB/H/WPf2ErXBtgyj/2/LpNn9ubEoxUFwPMNH6nhrwGIv5yEZkAbRr1oWRuvBq1nKod2W6oOcHOjxE5EJU/DB1JgHflZlHekN5lB5QNpPcRGEEnzoEoswPzVaRJxcTk4RsYm2S97cTf0xNqM+MkyMvsE/jfU+KLAdIM+WKLqzSKCl6ksTFw98IN7Sjszi2s22d2m9eUqX3pqhdKczUWD4tlH3Ipd9C0NxPVdbBw2JjeE2gJAwXGGfppYRmbc9QnPLKCZWc10Z0JV9IXHRb7q6t53c6fdHV9jrByEomvdra2VRCHlg8IalReb2Ls7VkJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V45Bg0Ux4QSwCqNXINfuJmlgxB7vc4csiSTXjRdgxZzW3vY+TV/DSCBZtqRj?=
 =?us-ascii?Q?IylJeHjoo6o+DuwAF7mu4GmdyBW8gscXHbGdVHQWWa+qCJcEfIWIlOUR9E+7?=
 =?us-ascii?Q?2kYCxOSKEen/OAPEu6PLXXYrq/e8++1ILY5mBVQDtgxZSswoeLAf5Ne0gJE+?=
 =?us-ascii?Q?4IR3UGPqP2gD4hb7zoEJ4N1Qw0N83NB+zZVp+FOoZT1RVmKIDtT8mY8D1bR5?=
 =?us-ascii?Q?gGfJuvdwVepq2HqU7i+7JEAzbUA62/qy09Va9MwpHJJZMgFOw1x56y/jkarR?=
 =?us-ascii?Q?LcdrExqH9h43XWXz+R6qkndKpRzy5jRxeZ9nB5//V0kjrOEbh3aCU+TgSYJR?=
 =?us-ascii?Q?xzux/X2OP6coBh6/t6vHsi0vjptT1mh/efls8+gi9cGL4hLTFgkn7QVOJ9nQ?=
 =?us-ascii?Q?J4ufDQ1yMCny74IlpH5lftUQ/4zUIC1aFGb+QsGLMY3nyYE84Jw6bT0rIN1e?=
 =?us-ascii?Q?LE43JaA3DUoIx5D4gg5dazBPG3HyOOHwEFTCN4QMokx9Qv9QR1n0v8WvoYJy?=
 =?us-ascii?Q?brMLfFDKCWZzNHU7caGrG57UcuLfB8n5oZx5kAi4remeKA2jVjdofEgmk4C+?=
 =?us-ascii?Q?z3BZa9GkJWqMIDMlY3z9tnnHfMshj9v4ra7QDREz7+cdmNnZ+wOeotS+rx2b?=
 =?us-ascii?Q?EG4mNCEOEKw2mtDA4TkZjK3YmjcMYPMhqIaczGdQXYhu/mvzt/BUyISLNqes?=
 =?us-ascii?Q?HZu88APkASyKu7fn/z9+0sU4qYw6g3wJhzARyHFgkGZQV8GYOFOvUvC5A3e2?=
 =?us-ascii?Q?AMCn1e3FogzjdHaEZQ3nnxgT2iMuTWoXOB/pBg/dNrH3gYbE2XaQVHDxtN5N?=
 =?us-ascii?Q?AB6EcZtqm62+JfV1AcuEtd2q+cZPN+17Lt7bjb79mCNyt/Y0LIbsaVy8bhI1?=
 =?us-ascii?Q?tDLOUjwy984ASO9J25qzM7F8/NPGKsnG+FsUHRGXwkAIjY052t5KxJ+gW5Bm?=
 =?us-ascii?Q?afsfjFvconAGts1pHnqxnGTm8Dnus9S95livqKkyw1v1zjhiTKyEA32NBk6y?=
 =?us-ascii?Q?LbiMdadpcUz3ciKJ+RlG+Rx4bzCoCM14IGrqFTVTY3F+6nTpOcXIRBJ3yTIN?=
 =?us-ascii?Q?jhK1ahl2Nf9q6HW/dtkg/vyr2xWK9+jWcglPfH1mUs0N/95PkRidVgHKZ/43?=
 =?us-ascii?Q?REd8zM0hi6rSBwzr7ngCjoSRq87bBG860J0tL5MDcfaBOIo76B94oN5FiGYp?=
 =?us-ascii?Q?9T9n+QObLOTmf4B5MayiLPdnkqh9ae3zzJ0RJ5Cq67VT/S2sS+sd3Vl08RaZ?=
 =?us-ascii?Q?0Y3dMYc3zB/q4woc6iNbO+NQ4WLiiwQOUHIME7q1juCNbtkoeS34BgQz8xGX?=
 =?us-ascii?Q?sY010bFtqHy3RLc0nwousvnCKRd+4mStQ+YDNx/B5rIwEKMD+7Yr5XGHXPoN?=
 =?us-ascii?Q?VrUjf9TFqTeZIM4zH6CVWi+klvSmnBOCHWMXB5ybtxX0e7eZp2ZFTPUaQtEf?=
 =?us-ascii?Q?rY6RAWjdyxq1OkDhhkWTytr5h/dfnvmIi7sYy8aF32kRVWjZsemcNwrTAWqF?=
 =?us-ascii?Q?8Pm7wkUYGIOCJSwZu8Pbsy+I1qRyxIOynLzflgfRFai55FlDbLjQqx8edDy4?=
 =?us-ascii?Q?yUdGbC/GIBXRXsrJWgMp6aTltNw9VOeYcOg3AtF60J9lV9kT0+CKkWXvanTv?=
 =?us-ascii?Q?RN47B9DFyMsDEzalPM5KcxjTLHCo1OEgDGPrK/Qhom5WW9bzVs26hxFPd02j?=
 =?us-ascii?Q?wxBfmDXguR3/biaCYGntz7oC6MJ8Wtc8dYR5VJWdYeHmR3o1YfZK4nUjR5M/?=
 =?us-ascii?Q?9ZIagqSh1tMudbt0wMxk3BuaCJ3PqFPWjcAcqjiy1h7CZF8UimC2IM4+y0Zl?=
X-MS-Exchange-AntiSpam-MessageData-1: Ed+gpsSLsS6cYw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6e3ec9-e9d5-43c7-9c5c-08deb927c62b
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:41.3843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8YvAu3End5j1ygY6z1D0x/OaVUm80512H4Nt/nIQgxP7Tt5aC5j33rPJyDGEnWMx0A9l2Of04hfoaXJ7ygCgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-c201ff/1779580963-DBB60443-DEC13C0F/0/0
X-purgate-type: clean
X-purgate-size: 12305
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
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B17E95C0E8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Parse the 'cpu-map' node in the Device Tree to extract CPU topology
information. If the 'cpu-map' node is absent, fall back to
generating the topology data from the NUMA information. This
generation assumes exactly one socket per NUMA node and that SMT
is unsupported.
---
 xen/arch/arm/smpboot.c                |   6 +
 xen/common/Kconfig                    |   7 +
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/cpu_topology.c | 307 ++++++++++++++++++++++++++
 xen/include/xen/cpu_topology.h        |  42 ++++
 5 files changed, 363 insertions(+)
 create mode 100644 xen/common/device-tree/cpu_topology.c
 create mode 100644 xen/include/xen/cpu_topology.h

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index eafa195504..ff8b0d07e9 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -24,6 +24,7 @@
 #include <xen/warning.h>
 #include <xen/irq.h>
 #include <xen/console.h>
+#include <xen/cpu_topology.h>
 #include <asm/cpuerrata.h>
 #include <asm/gic.h>
 #include <asm/procinfo.h>
@@ -248,6 +249,8 @@ static void __init dt_smp_init_cpus(void)
         else
             tmp_map[i] = hwid;
 
+        map_cpuid_to_node(i, cpu); /* pass the info to dt_init_cpu_topology() */
+
 #ifdef CONFIG_DEVICE_TREE_NUMA
         if ( tmp_map[i] != MPIDR_INVALID )
         {
@@ -294,7 +297,10 @@ void __init smp_init_cpus(void)
     }
 
     if ( acpi_disabled )
+    {
         dt_smp_init_cpus();
+        dt_init_cpu_topology();
+    }
     else
         acpi_smp_init_cpus();
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 2365b421bf..014192b2cd 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -188,6 +188,13 @@ config VM_EVENT
 config NEEDS_LIBELF
 	bool
 
+config DT_CPU_TOPOLOGY
+       bool "Device tree based CPU topology support (UNSUPPORTED)" if UNSUPPORTED && ARM
+       depends on HAS_DEVICE_TREE_DISCOVERY
+       help
+         Retrieve CPU topology information from the device tree to optimize
+         virtual CPU scheduling.
+
 config DEVICE_TREE_NUMA
 	bool "Device tree based NUMA support (UNSUPPORTED)" if UNSUPPORTED && ARM
 	depends on HAS_DEVICE_TREE_DISCOVERY
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index fab038d357..dbfce294fb 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -11,4 +11,5 @@ obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
 obj-$(CONFIG_STATIC_EVTCHN) += static-evtchn.init.o
 obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
 obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
+obj-$(CONFIG_DT_CPU_TOPOLOGY) += cpu_topology.o
 obj-$(CONFIG_DEVICE_TREE_NUMA) += numa.o
diff --git a/xen/common/device-tree/cpu_topology.c b/xen/common/device-tree/cpu_topology.c
new file mode 100644
index 0000000000..6c78a74778
--- /dev/null
+++ b/xen/common/device-tree/cpu_topology.c
@@ -0,0 +1,307 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Derived from Linux kernel 7.0's $drivers/base/arch_topology.c
+ * Parse cpu topology information.
+ *
+ * Copyright (c) 2026 VA Linux Systems Japan K.K.
+ * Author: Hirokazu Takahashi <taka@valinux.co.jp>
+ */
+
+#include <xen/cpu.h>
+#include <xen/cpumask.h>
+#include <xen/delay.h>
+#include <xen/device_tree.h>
+#include <xen/cpu_topology.h>
+#include <xen/numa.h>
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+
+static struct dt_device_node * __initdata dt_cpu_table[NR_CPUS];
+
+struct cpu_topology __ro_after_init cpu_topology[NR_CPUS] = {
+    [0 ... NR_CPUS-1] = {-1, -1, -1, 0}
+};
+
+static void __init setup_siblings_masks(unsigned int cpuid)
+{
+    struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
+    int cpu;
+
+    /* update core and thread sibling masks */
+    for_each_possible_cpu(cpu) {
+        cpu_topo = &cpu_topology[cpu];
+
+        if (cpuid_topo->package_id != cpu_topo->package_id)
+            continue;
+
+        cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
+        cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+        if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
+            continue;
+
+        if (cpuid_topo->cluster_id >= 0) {
+            cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
+            cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
+        }
+
+        if (cpuid_topo->core_id != cpu_topo->core_id)
+            continue;
+
+        cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
+        cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
+    }
+}
+
+static struct dt_device_node * __init dt_find_child_node_by_name(struct dt_device_node *from, const char *name)
+{
+    struct dt_device_node *np;
+    struct dt_device_node *dt = from;
+
+    dt_for_each_child_node(dt, np)
+        if ( np->name && (dt_node_cmp(np->name, name) == 0) )
+            break;
+
+    return np;
+}
+
+void __init map_cpuid_to_node(u32 cpuid, struct dt_device_node *cpu_node)
+{
+    dt_cpu_table[cpuid] = cpu_node;
+}
+
+static int __init cpu_node_to_id(struct dt_device_node *cpu_node)
+{
+    int cpu;
+    bool found = false;
+
+    for_each_possible_cpu(cpu) {
+        found = (cpu_node == dt_cpu_table[cpu]);
+        if (found)
+            return cpu;
+    }
+
+    return -ENODEV;
+}
+
+/*
+ * This function returns the logic cpu number of the node.
+ */
+static int __init get_cpu_for_node(struct dt_device_node *node)
+{
+    struct dt_device_node *cpu_node = dt_parse_phandle(node, "cpu", 0);
+
+    if (!cpu_node)
+        return -ENOENT;
+
+    return cpu_node_to_id(cpu_node);
+}
+
+static int __init parse_core(struct dt_device_node *core, int package_id,
+                int cluster_id, int core_id)
+{
+    char name[20];
+    bool leaf = true;
+    int i = 0;
+    int cpu;
+
+    do {
+        struct dt_device_node *t;
+
+        snprintf(name, sizeof(name), "thread%d", i);
+        t = dt_find_child_node_by_name(core, name);
+
+        if (!t)
+            break;
+
+        leaf = false;
+        cpu = get_cpu_for_node(t);
+        if (cpu >= 0) {
+            cpu_topology[cpu].package_id = package_id;
+            cpu_topology[cpu].cluster_id = cluster_id;
+            cpu_topology[cpu].core_id = core_id;
+            cpu_topology[cpu].thread_id = i;
+        } else if (cpu != -ENODEV) {
+            printk(XENLOG_ERR "ERROR: %pOF: Can't get CPU for thread\n", t);
+            return -EINVAL;
+        }
+        i++;
+    } while (1);
+
+    cpu = get_cpu_for_node(core);
+    if (cpu >= 0) {
+        if (!leaf) {
+            printk(XENLOG_ERR "ERROR: %pOF: Core has both threads and CPU\n",
+                   core);
+            return -EINVAL;
+        }
+
+        cpu_topology[cpu].package_id = package_id;
+        cpu_topology[cpu].cluster_id = cluster_id;
+        cpu_topology[cpu].core_id = core_id;
+    } else if (leaf && cpu != -ENODEV) {
+        printk(XENLOG_ERR "ERROR: %pOF: Can't get CPU for leaf core\n", core);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static int __init parse_cluster(struct dt_device_node *cluster, int package_id,
+                int cluster_id, int depth)
+{
+    char name[20];
+    bool leaf = true;
+    bool has_cores = false;
+    int core_id = 0;
+    int i, ret;
+
+    /*
+     * First check for child clusters; we currently ignore any
+     * information about the nesting of clusters and present the
+     * scheduler with a flat list of them.
+     */
+    i = 0;
+    do {
+        struct dt_device_node *c;
+
+        snprintf(name, sizeof(name), "cluster%d", i);
+        c = dt_find_child_node_by_name(cluster, name);
+
+        if (!c)
+            break;
+
+        leaf = false;
+        ret = parse_cluster(c, package_id, i, depth + 1);
+        if (depth > 0)
+            printk(XENLOG_WARNING "WARNING: Topology for clusters of clusters not yet supported\n");
+        if (ret != 0)
+            return ret;
+        i++;
+    } while (1);
+
+    /* Now check for cores */
+    i = 0;
+    do {
+        struct dt_device_node *c;
+
+        snprintf(name, sizeof(name), "core%d", i);
+        c = dt_find_child_node_by_name(cluster, name);
+
+        if (!c)
+            break;
+
+        has_cores = true;
+
+        if (depth == 0) {
+            printk(XENLOG_ERR "ERROR: %pOF: cpu-map children should be clusters\n", c);
+            return -EINVAL;
+        }
+
+        if (leaf) {
+            ret = parse_core(c, package_id, cluster_id, core_id++);
+            if (ret != 0)
+                return ret;
+        } else {
+            printk(XENLOG_ERR "ERROR: %pOF: Non-leaf cluster with core %s\n",
+                   cluster, name);
+            return -EINVAL;
+        }
+
+        i++;
+    } while (1);
+
+    if (leaf && !has_cores)
+        printk(XENLOG_WARNING "WARNING: %pOF: empty cluster\n", cluster);
+
+    return 0;
+}
+
+static int __init parse_socket(struct dt_device_node *socket)
+{
+    char name[20];
+    bool has_socket = false;
+    int package_id = 0, ret;
+
+    do {
+        struct dt_device_node *c;
+
+        snprintf(name, sizeof(name), "socket%d", package_id);
+        c = dt_find_child_node_by_name(socket, name);
+
+        if (!c)
+            break;
+
+        has_socket = true;
+        ret = parse_cluster(c, package_id, -1, 0);
+        if (ret != 0)
+            return ret;
+
+        package_id++;
+    } while (1);
+
+    if (!has_socket)
+        ret = parse_cluster(socket, 0, -1, 0);
+
+    return ret;
+}
+
+/*
+ * Generate cpu topology information when cpu-map node doesn't exist.
+ * It assumes that the cpu doesn't have SMT and all CPUs on a NUMA
+ * node belong to the same socket.
+ */
+static void __init fixup_topology(void)
+{
+    int cpu;
+    int clid = 0;
+    int pkgid = 0;
+
+    for_each_possible_cpu(cpu)
+    {
+        struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+
+        cpu_topo->package_id = cpu_to_node(cpu);
+        if (cpu_topo->package_id != pkgid)
+        {
+            pkgid = cpu_topo->package_id;
+            clid = 0;
+        }
+        cpu_topo->cluster_id = clid++;
+        cpu_topo->core_id = 0;
+        cpu_topo->thread_id = 0;
+    }
+}
+
+
+int __init parse_dt_topology(void)
+{
+    struct dt_device_node *cpus;
+    struct dt_device_node *map;
+
+    cpus = dt_find_node_by_path("/cpus");
+
+    if ( !cpus )
+    {
+        printk(XENLOG_ERR "ERROR: No CPU information found in DT\n");
+        return -EINVAL;
+    }
+
+    map = dt_find_child_node_by_name(cpus, "cpu-map");
+    if ( !map )
+        return -ENOENT;
+
+    return parse_socket(map);
+}
+
+void __init dt_init_cpu_topology(void)
+{
+    int cpu;
+
+    if (parse_dt_topology())
+        fixup_topology();
+
+    for_each_possible_cpu(cpu)
+        setup_siblings_masks(cpu);
+}
diff --git a/xen/include/xen/cpu_topology.h b/xen/include/xen/cpu_topology.h
new file mode 100644
index 0000000000..0cdceb9bd0
--- /dev/null
+++ b/xen/include/xen/cpu_topology.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_CPU_TOPOLOGY_H
+#define XEN_CPU_TOPOLOGY_H
+
+#include <xen/types.h>
+#include <xen/device_tree.h>
+
+struct cpu_topology {
+    int thread_id;
+    int core_id;
+    int cluster_id;
+    int package_id;
+    cpumask_t thread_sibling;
+    cpumask_t core_sibling;
+    cpumask_t cluster_sibling;
+};
+
+
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+extern struct cpu_topology cpu_topology[NR_CPUS];
+
+void map_cpuid_to_node(u32 cpuid, struct dt_device_node *cpu_node);
+void dt_init_cpu_topology(void);
+
+#else /* CONFIG_DT_CPU_TOPOLOGY */
+
+static inline void map_cpuid_to_node(u32 cpuid, struct dt_device_node *cpu_node) {}
+static inline void dt_init_cpu_topology(void) {}
+
+#endif /* CONFIG_DT_CPU_TOPOLOGY */
+
+#endif /* XEN_CPU_TOPOLOGY_H */
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


