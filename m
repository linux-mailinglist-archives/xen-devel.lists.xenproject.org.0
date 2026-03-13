Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U9yxFCc9tGlljgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:36:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBEC287230
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2026 17:36:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253993.1549994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VH-0004en-Rb; Fri, 13 Mar 2026 16:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253993.1549994; Fri, 13 Mar 2026 16:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w15VH-0004c2-NS; Fri, 13 Mar 2026 16:36:47 +0000
Received: by outflank-mailman (input) for mailman id 1253993;
 Fri, 13 Mar 2026 16:36:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc6w=BN=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w15VG-00040A-Na
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 16:36:46 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2764de2-1efa-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Mar 2026 17:36:44 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by CH2PR03MB5271.namprd03.prod.outlook.com (2603:10b6:610:95::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 16:36:36 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 16:36:40 +0000
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
X-Inumbo-ID: d2764de2-1efa-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+8w5R6bbjtk9ltBsUD9vjpqPsSlxbpVs7WjEbFjLrojnUhb2xjlR2j776VTh4OixIZXscQh3b1oJKNymLuDDNVv3SSktQDVO05Wwr0HGGw3O5xIJsJGosIVDdMjiSrS7dOeB095tGQNFCG6I2I9Nz1mHmfzK2eIL5Pad/HkGcP3H5VFW8NvNO02Yz/zWHOovyE+Xc/1v5c2a+Mcv1ilSamcnIUUOpAw11OXkCOKR+cGTvXeB7gj4c01vV9a5JvHFF987/oepxeVZEbjTtmu76zUlFq8APN2US9gINB+eqrhEPqSqbqcbfm8/JfccLjzwaeGb4hEtA94wPpPLMP4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbVxtmV6Qv5YAYFByzMFnBP2CUWtNib/VVmLwmUb988=;
 b=lblLao2AccfUN4dul18vK6aw9p5TgW004l6UgOulOCSOgu1joZ4dE8lBZCVxVEIeb8HNYeSvBWAvOeBMTtJOKIbwOEm9vfRuuX11aXiQ4Ln/YRlX+TSrLlCK4glImsBnsDDYJhO7V7kh0MSuSWbaR2weO4AMZc/qFoDuYU+jbhN1IDUJor9w3jR6wAKyMhMVHyvKD9bcp3KThpNLlYhHk8XabGG3C7zQd3rJgvQUI1bO80flVXTcfJhsi7dV/nf5KdCGeh1KsO2wWjj3Vb73ltwb+l7v8z0Amu21G2V48Vo45u3Hxr7k3y6c1QVpGemBr2sLmXL+CCmnG2KiDQJnQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mbVxtmV6Qv5YAYFByzMFnBP2CUWtNib/VVmLwmUb988=;
 b=MEA9/POROVpXmsZjvgxgWRPVnjBgxg0644WTxkmXCICH2x6wsnvZsAujVzrXtdeEk6CJ176Zgi4zMpA2kOcwJPV83HEROpDwhKGdewhRyqtMDvXxwcEfmA+syZkQf8qK6/RekbZUANlbTGmaEIQ7Ro8uGATpHV7P93/R6B+MhOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v3 2/7] x86: Remove x86 prefixed names from mcheck code
Date: Fri, 13 Mar 2026 16:36:25 +0000
Message-ID: <20260313163630.1073019-3-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260313163630.1073019-1-kevin.lampis@citrix.com>
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0484.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::9) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|CH2PR03MB5271:EE_
X-MS-Office365-Filtering-Correlation-Id: d404ed38-6d7d-40b9-eb3f-08de811eb3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7F1TQW57bwjFKfMgxhrsXR78SuRZD3fvzvowm4QX6nGqLRZs/7it+BIZI3FKKIyzl24V96hgkxuhZjAOCGkYoiObZVyIUHeNEFbwtsmhB8X0nrpALPkow9CikLm6nD3gLBy+4qCfBmHnjM8HPWrJOEgZzm3VmixIdFqJHAys2gxWjAudG8TT8LUPzc+6cp9m2GHZ/oKZFoZb0BWix02bxIc7gHBehoEkAxiv+tpAz1LFo9xerP4pzMKtuxYBvwCwrJ97Mpb1ZAiEoenTiU0hf78tNG62hqulmomL+3KA6rQAn4g8UR84IJHH2CU+L1vEvm0ukCzNwQe75S4haz1/lGwPejAi6w8ocPt7TFNnegkI7bqLwrb+yBYwvz4gvRYfvk/wrLQ8l7czcnPqekfOYMdMIiM+OTQiT2VPsUGtr0gc7CR/1wtKttd2iQ997YaiEKpkVT4C9NmvOv4xlgZdjkrV/aC4wOYmouh/gmxZCp5wgM0Oni0tCnCGNMeFGe3FUnT6V31p7JAn0Y02ji4SP1a+HFu1PLB3D/iy/gt1dIO9SEdLsR7Te/DSM4l8V3TNambfHcgweJRbtJZiKJu6EqY2X44Xq34/WClt/uhq72HFw7p0GUJJo51NIqtSzP6hEicGavK+uHaf6D82iCkq/bhqURZwZ8yEIrkysrnAdsY/HhV4B85JfYJJwAqxYQUYrPJYLhojkO8OtLhtaqAqQH1mMN62itwkiJEdywaj9MA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I0hTehMrJOxSc24LsWRtBms4RBWGMBjl6mS4PJDIdg1f2phCsmAjggeqfj6f?=
 =?us-ascii?Q?CMdxSjOiYZvXy69MjpIOayjaUZlFDjRP5qArWjex44aTVK0x/Y78TYtos7N8?=
 =?us-ascii?Q?zieWECW9EExaklxVj8Fe8S3G1Pe2uKZuIiri0dOOKI3jDQ9iQl65ibaKnU8m?=
 =?us-ascii?Q?fLETDQX6HhLX+vCNwZ0qmX9ut7U59KkjkGBTB3cRUJOzLJtYPde5zEWVJtMr?=
 =?us-ascii?Q?hDPeCkrGlGlB4IX01yVzukfe0HKz2vjVbM+mWl3II0F/3X7e09fB8NFHf57G?=
 =?us-ascii?Q?jXu6JvELmZxSqybKy0tRr46zbPyJ/vXJ2EKXv/dRtVkrBksx3Qx+MjruXam7?=
 =?us-ascii?Q?l4P3TO/EU9JXTQ+LFnnVR1evxrJ+4ZLhYQjzqPDbEvYwgU/FNsCTaWtV8Yih?=
 =?us-ascii?Q?m9zk6fxXYu88NmQBmZTSNLlehuDJzjaxqdzeBUNimEbDEA30sNXXrTWJNgQc?=
 =?us-ascii?Q?1famdjARVY/NGu7DBOhNYkD0gJZns09+6Cb9yk2wKNE42UdDbNoQa3ZC8jxr?=
 =?us-ascii?Q?9XkBBnZ50LYF71OAjphxdWnwSsDAX5hRcdBG5ylaf1/HsZ1GXSK28SfMh4MG?=
 =?us-ascii?Q?Nhse+WYjbUVMU4sCSU6J7gG6iv1SzQzAnu+b8HVtO69/h1ZsEunnnBFnLFz4?=
 =?us-ascii?Q?RLn0lGCyLeuJapnBeKHoFRlovwzRZI67jmUZNOHpP8WZB9bc2knLe5DRjhns?=
 =?us-ascii?Q?7kiGw3na9MiCv7AGY9fr9ygqBKJZvKXlhpVDz5j+IONo7M9mACKkfD9SzEB9?=
 =?us-ascii?Q?Se43jTBaloYn9M+jMOxO4kHEO+mvt8Qd2RN3niBNhjnGKeSFLl7Y/RfianFy?=
 =?us-ascii?Q?U0+/gsgKR3IovcGoQrlHKv293C0KL9YlKvL3chQ0PYBiFi5+ujiNwXWxUQFb?=
 =?us-ascii?Q?ihcMK4kcso3xK3kdCwgu6AhugdwufK7QJT/cJ3BeIhx/t6NY1Ue13XVNCSag?=
 =?us-ascii?Q?oenXg3+e9UCeCu45cMLqGZkNrRVf30OukuVqYMN3AdMGNQNfKFaQIj+RECQu?=
 =?us-ascii?Q?y39BMM/ovhX7umS3fu8LuV4wvmkbCnz2285sG9mwoLwAUZApmXkhfnzZhj6/?=
 =?us-ascii?Q?9UjTAn3kVH5PZQw3K2CMqkiSbO8OxXIraFc9Jvnrz0vz8k0Q98GJOZL98FzO?=
 =?us-ascii?Q?05HNQMWZYNVzgvU1TTRYKda6WuOPb4VtfBTbbF3+p199q/RWVCUKR858PUxg?=
 =?us-ascii?Q?2DEbzcsr83fzv3o81QjdLVOfCwai6IYcMg95EslAN5VFy7CZdReCyT8ShTCR?=
 =?us-ascii?Q?okHLMKPXfUBzFzjXpRGsszlhWa66hvVX3m3GSkWhA6IjNNZgcUOcFB+TmY5z?=
 =?us-ascii?Q?A/IeIiWkH7kM5cFkfbMWRLrWxyC88Jq762ae3xB83wRLuotBrGVhTFkSNqNA?=
 =?us-ascii?Q?HgBe4Qhu9RB1pfe9mEwxL0vREk1HygfCmMmnBHtkn/Vfdr8NfrQbzHhEIVF+?=
 =?us-ascii?Q?H0LxFYmTmFsEiP2CQ3KZUfuxoCyh2J8vdG8xX2jlsmuCPyA2jZrcdtBilxB7?=
 =?us-ascii?Q?UZ34CLXUn90FifsHFzKqwdsA35x2ICm6BlpbAnyDt/yCfcdRFxNgY66HX5ng?=
 =?us-ascii?Q?Jc8nJ/K3/U9pSmoB9NQOJj52F4H3UioJQgREKL1f8HQqc5M5PPPKsx/a3dvv?=
 =?us-ascii?Q?xVhMPdGkcqit0ku3QQC7rG1h7T7EK3cGlLn6grtTB+7IF9uae+gVAgNGI0iY?=
 =?us-ascii?Q?5IoSUp8ar8MtID4SPmddQVYKZl4f6QtK5f6kGFSuzgKQW4wyBImfhHYS5VuH?=
 =?us-ascii?Q?vkzzMwnwHQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d404ed38-6d7d-40b9-eb3f-08de811eb3f5
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:36:40.2441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmrzYPO357iTOqQha9SWm7tIG7Qr481LCA4cz3LsvNzeTBtBRwo18QWj8VZyioDpZdeHLbTac/MAnDPpEiO1Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5271
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DFBEC287230
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

Changes in v3:
- In check for family != 0xf in mce_is_broadcast()
---
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c     |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c          | 28 +++++++++++++-------------
 xen/arch/x86/cpu/mcheck/mce.h          |  2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c      | 16 +++++++--------
 xen/arch/x86/cpu/mcheck/mce_intel.c    |  5 +----
 xen/arch/x86/cpu/mcheck/non-fatal.c    |  2 +-
 xen/arch/x86/cpu/mcheck/vmce.c         |  8 ++++----
 8 files changed, 31 insertions(+), 34 deletions(-)

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
index c4b3b687a2..2c70964a82 100644
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
+    return c->vfm >= INTEL_PENTIUM_PRO && c->vfm < INTEL_NEHALEM_EP;
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
@@ -876,7 +876,7 @@ static void x86_mcinfo_apei_save(
     memset(&m, 0, sizeof(struct mce));
 
     m.cpu = mc_global->mc_coreid;
-    m.cpuvendor = xen2linux_vendor(boot_cpu_data.x86_vendor);
+    m.cpuvendor = xen2linux_vendor(boot_cpu_data.vendor);
     m.cpuid = cpuid_eax(1);
     m.socketid = mc_global->mc_socketid;
     m.apicid = mc_global->mc_apicid;
@@ -977,10 +977,10 @@ static void cf_check __maybe_unused do_mc_get_cpu_info(void *v)
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
@@ -1136,7 +1136,7 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
 
         if ( IS_MCA_BANKREG(reg, mci->mcinj_cpunr) )
         {
-            if ( c->x86_vendor == X86_VENDOR_AMD )
+            if ( c->vendor == X86_VENDOR_AMD )
             {
                 /*
                  * On AMD we can set MCi_STATUS_WREN in the
@@ -1171,15 +1171,15 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
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
index 839a0e5ba9..d49737f24a 100644
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
+    return c->vendor == X86_VENDOR_INTEL && c->family != 0xf;
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


