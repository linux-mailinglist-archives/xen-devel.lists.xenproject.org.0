Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDwZE7Yls2nMSgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A6B279819
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252992.1549409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0msp-0006RX-PW; Thu, 12 Mar 2026 20:43:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252992.1549409; Thu, 12 Mar 2026 20:43:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0msp-0006PJ-MN; Thu, 12 Mar 2026 20:43:51 +0000
Received: by outflank-mailman (input) for mailman id 1252992;
 Thu, 12 Mar 2026 20:43:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBWs=BM=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w0mso-0006Bj-R5
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 20:43:50 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c12d2c9-1e54-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 21:43:50 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH0PR03MB6870.namprd03.prod.outlook.com (2603:10b6:510:167::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 20:43:47 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 20:43:47 +0000
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
X-Inumbo-ID: 2c12d2c9-1e54-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zC4N0+KpIErUAGBoiI1IzbDaWDTfqrMxTAoB7JOBmgWwh6R+8l6Mo3UL3xD23IbTl0AD912geiIXd/Cbxta01vG8wr3RhBxU3PdiR3bJZ+NqbpUfUe0vAEWpmpWd39AKn7ZF5BQsCLVTWsW8nMVWzWayK7GR4ZEoIxVQzUje7K++QKQ3IXIP51AZ6Ueh0A/hCLycOwsL7bQzjp7N2oy/XHv+zdXlAGqigzU/BVNpTbD1CGdRVF5ngMKNBOk9AHHH5xduOfdXKRC3JrxDmuHqrs441weWHz9W//WQGda69D1fkaTFQd9CrTToW7u08sSvgxKPFPp2e06xrogHCpZm3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SdfTNX5aLajDFtunCfhU7/bkqi/fSCRzyyG5ed6hYgM=;
 b=gOcumTv6tP9a3c52t5OM9HxH3Plhg/KDVPqgeKxXWd9n4cyCmnkVhXpkconrpkzxga551F5p1M43Bzt3KGcS2SUumEzgwqFj8FAiaEpaj84dIGaNaAmIdUTeUkYiJ+6Ns6TsPQS+A1g43/s88+Sm+1E0tNypyQKy2mQ4EjtEZWwOh2lkOYNTIixWX70SUEMFFpM0bIb9kxMho+PR+/MJ3uclYmg7L7DOvjGuVr/ZaiRfTD8/k+HPPV+J4DyoeuR8Mqp3rZjpYYZA99prtUGIyeNM4lvrnF1Y+PBR/IcXbwWNWoLpvUkt1MTKgvBdIf9+vi0xeFWuVELgrw7JRbPixQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SdfTNX5aLajDFtunCfhU7/bkqi/fSCRzyyG5ed6hYgM=;
 b=tmawjSc5Q6O0USlm1pR+VoHlEPaT6VS5hrixJngMP8zRNNP5Ana0IZpi++CzZhETZOU2oDWvf5S3qYMPtuHZavS5//3tfDEGmbv6dkZ7iy4g9nVLq9NARi8+5F3VSMMWK7zvJTropumenQooksEF3EldBAeF1tkAL67vkpFMPGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v2 1/7] x86: Remove x86 prefixed names from mcheck code
Date: Thu, 12 Mar 2026 20:43:33 +0000
Message-ID: <20260312204339.740403-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260312204339.740403-1-kevin.lampis@citrix.com>
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0565.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::19) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH0PR03MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: bca96d51-6321-4ce1-6cd2-08de80780ef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	VD3EYehW3wOntt3z82QG80344ixukKX2Q9HKkPZffZwRQv538tsZSKlk1pfJCEuvgJzVlsX4ivApLAc2XWLGO1gQ+hx7iV9IhVkB/UXGbZDLohSqxGS2FVLRZmy2acTrReByFLpqUlg1cPHwUti1lf1OuBKRhki2NUtR8OVfExOxJGdUsdSH9rhoTnne9UlfxIjkPP5MixtF3Jq6E1MmFgT3HGNAqHqJqXKmp59u2k5UfKwq3ZijZMb+wzOj5SFG+cvSrp3759vJOyhXiZIdyHwrbVHcsxmGzEgppzBS+zEI7wubwY9/hGeqDxYQHkbkwwEaY8VwRx5VFH1wJYT5ePhJdg5dG0HQzKXJpAJyjPVpxDnwrG1nTak0MDThh2v2Eg6BUiEAq8tUS+pIC3QbizaOsViwSbqP31dOiHiscnCCF3e8kXQDxIyjEgE92KNt6sjR2/Rhf0G3WNxlrDiqG6uCQNJxqmnC18CMX1/EWz1fA8iJaQTGKtdwSFILnWBOGyuWFhVO7vdnZPIL1OiLsuj12ib2/pOBBQMmyuu5gLCeEiL75mn8ORLINC34Zpd+GuuCy2YsVEDTwYTWzAhsL4dYB5K8Yff4P1Qfpj/rp/BdKxoNt1m++x+QE5UQNcaMnTi0mGjEZJQ44s3EuIzPYBYhL9O7ORGCKUqmFK7wiB7xCD+1MXWltZHaxIhikZ4a70bLugFb/QcQLKxLsflGyfWMmylMDoQp2NGGoOcpJ5A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EUUqLP0RU25jXdaNrkvjf9trJ0/kaKLDVLfmKoYVzf7KF9AveFIkrrEQPHED?=
 =?us-ascii?Q?n1n9CwpKSff9luN3bR5K5RDBBtoy+G1LZ8MSXrc54jCEt6xbydfufCqsSuuO?=
 =?us-ascii?Q?Xf9WW5/5qY16fp1yotZs2q5wzcxCnkyOfxmh1pJSx+lSeeCszfFkJi/vecwu?=
 =?us-ascii?Q?WwLNTXmg053EkVnK5FyfV5rP7YXm1rGPGCmBJzMOlrBGSrU7+L0EXPT4ewsS?=
 =?us-ascii?Q?J1Uuh5uHIttorKgYlNgQJHIv8bhVdS2n07uzhaA5XQYMwpnTFYyGeoWQBTFg?=
 =?us-ascii?Q?VjI7YP/zo8Hz8oObF4tJKGConAiTUSIb1V0O3MIfk6YX5NsgdAKWE+JzHnym?=
 =?us-ascii?Q?xeeaxU0Ec4tVB+jVQApM0zLwGKfCwlV3JUwyaYbbkgLBlvMKrAq5qQidZ021?=
 =?us-ascii?Q?Ev/OXjuRBppwPGSOTsEWVOtQYZB9mbZf4Wk5t2kls7PQpdEeBQ1uPwqUbMVJ?=
 =?us-ascii?Q?HwOJ6nDe3CbZ2wBDxvfpv4+/7/7ZrkhiN09Theccby9/qH5XggWS9H2wBIob?=
 =?us-ascii?Q?zJHsdcsIcdnlPTq2tLSDwEjYAz/lFlMpo8VVQ8XeTfdZcfGQDmt8JTLw3uq4?=
 =?us-ascii?Q?gN9+r0S5nM7SdZbtJ6IjU98UkTWFNrhybwo6tIfVTlxE7oZUwa5c8BP9dBly?=
 =?us-ascii?Q?t80/zGJPKO8E/fQ6gTJ9cdZi3hrpDR/fEIqYmclAW6gufZdxipCDyPuR+ulw?=
 =?us-ascii?Q?ZuIlib1TpwGBXrux2khgih+3iX2vPDeDD2bB6o97SLXFJ6LvZUJk2n9fHMhX?=
 =?us-ascii?Q?N0WUQKTPB/hSdOrYFhdHQvZhj4jE8oyK5eQkOrvV02FQH82dTKgz4RrIcRwH?=
 =?us-ascii?Q?118wPZaWuf+a86aHtLFYEqyztMUM8pPth6WoM/jI7tQRURrii9djvlfORBPV?=
 =?us-ascii?Q?p8sQy7ThKXabcKdwiaiNkgRk0tK6qelxNenX79Yw2KhsdLJ9Uz5OA/2Ay4EB?=
 =?us-ascii?Q?O7aXttNKF7JP2QrEkm5ccM6uMIzh11ji1glm+mAiXkv7c6MvZbAqwK9KXdix?=
 =?us-ascii?Q?gTqpLUcveVgLsOf0B1r2O00N6JVvGDIzWu3tdiRc1bCzAyNxjXj3u3XTH7s0?=
 =?us-ascii?Q?f9dffUX4uPNELSspLAJ7ejVdnkXf/aQLHyg6nx5IS/xyXmzGdj4YBY5Yw78J?=
 =?us-ascii?Q?X5rWBdWT8LNnR/LAjHKcgHvD/TuGA9FDqpn6mQUH2AfSIBFjlNCwPjzr8Mt1?=
 =?us-ascii?Q?nCMlKIWTrqXtoSymCBaTnkWiTLaSi1tEHQEvQLJ3fpbvyGn2i1FwgYLPA9Ky?=
 =?us-ascii?Q?o6k5oWBRD9uWRxzBz1zSNZv9kEQ9mzdtk1B308w8gkmERqmuJR4sqolS3t2g?=
 =?us-ascii?Q?/4lfoAm+hXwUI5Fbjng2rxqQJt7TQMIF05fOa4T7ZgT5fRt70UxVW/QteT1y?=
 =?us-ascii?Q?pF8izdM/mfBNwCPmwzFah4K4DEIDD00rxFRvZLI80rQ2EStuYaijVTlyVRPr?=
 =?us-ascii?Q?FWOR7xjatddEEWUDSjoYyQvBtC5MBRsS+tvdSzt+ERM94AJgtEN212X7wEgd?=
 =?us-ascii?Q?LLifs4E911C+NAcM9owZaMoVdzJTIMT6KzxbeBDuAG8YqX3l/H4EBzbSAzXC?=
 =?us-ascii?Q?+vuNuhhAdkB6AKs9dc/cmWwqXJEACZiLnDRYyV4FgiI3TzItenSuYEk+LqsO?=
 =?us-ascii?Q?mHv9gyeSVCLf1WtPAhenvEPd5cZOYIjJ1ahmC/gN2zw20RmNXnrv8FsXi967?=
 =?us-ascii?Q?M+XJZWXReP4af1rRBfJcUC9fJpedbWOzkN6tsc+9lX4FMBoIWY5XRXFcGB3g?=
 =?us-ascii?Q?6ZWjPAVblg=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca96d51-6321-4ce1-6cd2-08de80780ef1
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:43:46.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKgmWZnB5gShpFhVefocRZg2VGBJR57qN4MteWsYvW4xHV0rNS+lLVU/PCjC4RM7OhVOKCV63b67VkpaftYu1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6870
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D8A6B279819
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

This work is part of making Xen safe for Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- Undo the family != 5 check in mcheck_init()
- Change model range check in mce_firstbank()
---
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c     |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c          | 30 +++++++++++++-------------
 xen/arch/x86/cpu/mcheck/mce.h          |  2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c      | 16 +++++++-------
 xen/arch/x86/cpu/mcheck/mce_intel.c    |  5 +----
 xen/arch/x86/cpu/mcheck/non-fatal.c    |  2 +-
 xen/arch/x86/cpu/mcheck/vmce.c         |  8 +++----
 8 files changed, 32 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index 7d48c9ab5f..fb52639e13 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -191,7 +191,7 @@ static void cf_check mce_amd_work_fn(void *data)
 
 void __init amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c)
 {
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!(c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		return;
 
 	/* Assume we are on K8 or newer AMD or Hygon CPU here */
diff --git a/xen/arch/x86/cpu/mcheck/mcaction.c b/xen/arch/x86/cpu/mcheck/mcaction.c
index bf7a0de965..236424569a 100644
--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -101,7 +101,7 @@ mc_memerr_dhandler(struct mca_binfo *binfo,
                       * not always precise. In that case, fallback to broadcast.
                       */
                      global->mc_domid != bank->mc_domid ||
-                     (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+                     (boot_cpu_data.vendor == X86_VENDOR_INTEL &&
                       (!(global->mc_gstatus & MCG_STATUS_LMCE) ||
                        !(d->vcpu[mc_vcpuid]->arch.vmce.mcg_ext_ctl &
                          MCG_EXT_CTL_LMCE_EN))) )
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 9a91807cfb..8a41116aa4 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -23,6 +23,7 @@
 #include <asm/apic.h>
 #include <asm/msr.h>
 #include <asm/p2m.h>
+#include <asm/intel-family.h>
 
 #include "mce.h"
 #include "barrier.h"
@@ -334,7 +335,7 @@ mcheck_mca_logout(enum mca_source who, struct mca_banks *bankmask,
                 mca_init_global(mc_flags, mig);
                 /* A hook here to get global extended msrs */
                 if ( IS_ENABLED(CONFIG_INTEL) &&
-                     boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+                     boot_cpu_data.vendor == X86_VENDOR_INTEL )
                     intel_get_extended_msrs(mig, mci);
             }
         }
@@ -564,8 +565,7 @@ bool mce_available(const struct cpuinfo_x86 *c)
  */
 unsigned int mce_firstbank(struct cpuinfo_x86 *c)
 {
-    return c->x86 == 6 &&
-           c->x86_vendor == X86_VENDOR_INTEL && c->x86_model < 0x1a;
+    return c->vendor == X86_VENDOR_INTEL && c->vfm < INTEL_NEHALEM_EP;
 }
 
 static int show_mca_info(int inited, struct cpuinfo_x86 *c)
@@ -596,7 +596,7 @@ static int show_mca_info(int inited, struct cpuinfo_x86 *c)
         case mcheck_amd_famXX:
         case mcheck_hygon:
             printk("%s%s Fam%xh machine check reporting enabled\n",
-                   prefix, type_str[inited], c->x86);
+                   prefix, type_str[inited], c->family);
             break;
 
         case mcheck_none:
@@ -766,7 +766,7 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
     else if ( cpu_bank_alloc(cpu) )
         panic("Insufficient memory for MCE bank allocations\n");
 
-    switch ( c->x86_vendor )
+    switch ( c->vendor )
     {
 #ifdef CONFIG_AMD
     case X86_VENDOR_AMD:
@@ -777,7 +777,7 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
 
 #ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
-        switch ( c->x86 )
+        switch ( c->family )
         {
         case 6:
         case 15:
@@ -882,7 +882,7 @@ static void x86_mcinfo_apei_save(
     memset(&m, 0, sizeof(struct mce));
 
     m.cpu = mc_global->mc_coreid;
-    m.cpuvendor = xen2linux_vendor(boot_cpu_data.x86_vendor);
+    m.cpuvendor = xen2linux_vendor(boot_cpu_data.vendor);
     m.cpuid = cpuid_eax(1);
     m.socketid = mc_global->mc_socketid;
     m.apicid = mc_global->mc_apicid;
@@ -983,10 +983,10 @@ static void cf_check __maybe_unused do_mc_get_cpu_info(void *v)
                         &xcp->mc_apicid, &xcp->mc_ncores,
                         &xcp->mc_ncores_active, &xcp->mc_nthreads);
     xcp->mc_cpuid_level = c->cpuid_level;
-    xcp->mc_family = c->x86;
-    xcp->mc_vendor = xen2linux_vendor(c->x86_vendor);
-    xcp->mc_model = c->x86_model;
-    xcp->mc_step = c->x86_mask;
+    xcp->mc_family = c->family;
+    xcp->mc_vendor = xen2linux_vendor(c->vendor);
+    xcp->mc_model = c->model;
+    xcp->mc_step = c->stepping;
     xcp->mc_cache_size = c->x86_cache_size;
     xcp->mc_cache_alignment = c->x86_cache_alignment;
     memcpy(xcp->mc_vendorid, c->x86_vendor_id, sizeof xcp->mc_vendorid);
@@ -1142,7 +1142,7 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
 
         if ( IS_MCA_BANKREG(reg, mci->mcinj_cpunr) )
         {
-            if ( c->x86_vendor == X86_VENDOR_AMD )
+            if ( c->vendor == X86_VENDOR_AMD )
             {
                 /*
                  * On AMD we can set MCi_STATUS_WREN in the
@@ -1177,15 +1177,15 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
             case MSR_F10_MC4_MISC1:
             case MSR_F10_MC4_MISC2:
             case MSR_F10_MC4_MISC3:
-                if ( c->x86_vendor != X86_VENDOR_AMD )
+                if ( c->vendor != X86_VENDOR_AMD )
                     reason = "only supported on AMD";
-                else if ( c->x86 < 0x10 )
+                else if ( c->family < 0x10 )
                     reason = "only supported on AMD Fam10h+";
                 break;
 
             /* MSRs that the HV will take care of */
             case MSR_K8_HWCR:
-                if ( c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+                if ( c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
                     reason = "HV will operate HWCR";
                 else
                     reason = "only supported on AMD or Hygon";
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index 920b075355..3b61b12487 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -137,7 +137,7 @@ void x86_mcinfo_dump(struct mc_info *mi);
 
 static inline int mce_vendor_bank_msr(const struct vcpu *v, uint32_t msr)
 {
-    switch (boot_cpu_data.x86_vendor) {
+    switch (boot_cpu_data.vendor) {
     case X86_VENDOR_INTEL:
         if (msr >= MSR_IA32_MC0_CTL2 &&
             msr < MSR_IA32_MCx_CTL2(v->arch.vmce.mcg_cap & MCG_CAP_COUNT) )
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 25c29eb3d2..2d17832d9c 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -160,17 +160,17 @@ mcequirk_lookup_amd_quirkdata(const struct cpuinfo_x86 *c)
 {
     unsigned int i;
 
-    BUG_ON(c->x86_vendor != X86_VENDOR_AMD);
+    BUG_ON(c->vendor != X86_VENDOR_AMD);
 
     for ( i = 0; i < ARRAY_SIZE(mce_amd_quirks); i++ )
     {
-        if ( c->x86 != mce_amd_quirks[i].cpu_family )
+        if ( c->family != mce_amd_quirks[i].cpu_family )
             continue;
         if ( (mce_amd_quirks[i].cpu_model != ANY) &&
-             (mce_amd_quirks[i].cpu_model != c->x86_model) )
+             (mce_amd_quirks[i].cpu_model != c->model) )
             continue;
         if ( (mce_amd_quirks[i].cpu_stepping != ANY) &&
-             (mce_amd_quirks[i].cpu_stepping != c->x86_mask) )
+             (mce_amd_quirks[i].cpu_stepping != c->stepping) )
                 continue;
         return mce_amd_quirks[i].quirk;
     }
@@ -291,13 +291,13 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
     uint32_t i;
     enum mcequirk_amd_flags quirkflag = 0;
 
-    if ( c->x86_vendor != X86_VENDOR_HYGON )
+    if ( c->vendor != X86_VENDOR_HYGON )
         quirkflag = mcequirk_lookup_amd_quirkdata(c);
 
     /* Assume that machine check support is available.
      * The minimum provided support is at least the K8. */
     if ( bsp )
-        mce_handler_init(c->x86 == 0xf ? &k8_callbacks : &k10_callbacks);
+        mce_handler_init(c->family == 0xf ? &k8_callbacks : &k10_callbacks);
 
     for ( i = 0; i < this_cpu(nr_mce_banks); i++ )
     {
@@ -311,7 +311,7 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
         }
     }
 
-    if ( c->x86 == 0xf )
+    if ( c->family == 0xf )
         return mcheck_amd_k8;
 
     if ( quirkflag == MCEQUIRK_F10_GART )
@@ -337,6 +337,6 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
             ppin_msr = MSR_AMD_PPIN;
     }
 
-    return c->x86_vendor == X86_VENDOR_HYGON ?
+    return c->vendor == X86_VENDOR_HYGON ?
             mcheck_hygon : mcheck_amd_famXX;
 }
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 839a0e5ba9..4d6b7d588e 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -711,10 +711,7 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
      * DisplayFamily_DisplayModel encoding of 06H_EH and above,
      * a MCA signal is broadcast to all logical processors in the system
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
-         c->x86_model >= 0xe )
-        return true;
-    return false;
+    return c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH;
 }
 
 static bool intel_enable_lmce(void)
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
index a9ee9bb94f..4e7c64abef 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -23,7 +23,7 @@ static int __init cf_check init_nonfatal_mce_checker(void)
 	/*
 	 * Check for non-fatal errors every MCE_RATE s
 	 */
-	switch (c->x86_vendor) {
+	switch (c->vendor) {
 #ifdef CONFIG_AMD
 	case X86_VENDOR_AMD:
 	case X86_VENDOR_HYGON:
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 1a7e92506a..84776aeec8 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -45,7 +45,7 @@ void vmce_init_vcpu(struct vcpu *v)
     int i;
 
     /* global MCA MSRs init */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         v->arch.vmce.mcg_cap = INTEL_GUEST_MCG_CAP;
     else
         v->arch.vmce.mcg_cap = AMD_GUEST_MCG_CAP;
@@ -63,7 +63,7 @@ int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt)
 {
     unsigned long guest_mcg_cap;
 
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         guest_mcg_cap = INTEL_GUEST_MCG_CAP | MCG_LMCE_P;
     else
         guest_mcg_cap = AMD_GUEST_MCG_CAP;
@@ -136,7 +136,7 @@ static int bank_mce_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     default:
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( boot_cpu_data.vendor )
         {
 #ifdef CONFIG_INTEL
         case X86_VENDOR_CENTAUR:
@@ -273,7 +273,7 @@ static int bank_mce_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         break;
 
     default:
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( boot_cpu_data.vendor )
         {
 #ifdef CONFIG_INTEL
         case X86_VENDOR_INTEL:
-- 
2.51.1


