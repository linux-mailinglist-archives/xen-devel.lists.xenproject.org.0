Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELulEWcms2kMSwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:47:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8E32798AF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 21:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1253046.1549463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mwI-0001UO-4C; Thu, 12 Mar 2026 20:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1253046.1549463; Thu, 12 Mar 2026 20:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0mwI-0001RC-0I; Thu, 12 Mar 2026 20:47:26 +0000
Received: by outflank-mailman (input) for mailman id 1253046;
 Thu, 12 Mar 2026 20:47:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBWs=BM=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1w0mtJ-0006Bj-Ri
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 20:44:21 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ebe399f-1e54-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 21:44:21 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by PH0PR03MB6979.namprd03.prod.outlook.com (2603:10b6:510:169::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 20:44:18 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 20:44:18 +0000
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
X-Inumbo-ID: 3ebe399f-1e54-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jm1T4zb/POnqnOUD0H0yjBgtkrb0ewgECKYD5Ctn7e+ioCVZgij/DaEp97a0ikN/zCmdpFAgtkZTWALB6imv1aOlbZ5BS2h2zbZCeQxmket5qwwWFE8TwyyjhFW1jX+5QztFSWkgXJMdDpSVVlevVcIS/zHETDEKB4Dz3OWp3H9xbHwzDufNwt3ZY4iOTRHH+yhcerYmSwOleQwddRRXx17a3+V0oz7pLybq3p5Ws81YHYtmL8o0ZYyHk7JH6HdpFrF2YXmpwtp6RJ/NhYpBQ9Sa9zvOk59fbpWhPlc5C6I0cf8zO71JLg0L2iWJfGvIHIYUBBQrJ4sXPunqo765IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkexYGptCHbgLndtPlhEQnAVvgf8/mTkKb/te38N9IQ=;
 b=gFAxtI7kWRhoLvKn69JokvtWXRdTugfINxrGGYZo1EbIO1ZOiO6MviNYoOTELLNKdTWpsnQLhZXyglnFPEx7LIuufuO0Ypsd2LaZf8DdlzmSAqNV0NLkVGEHGITloyYPdpMBhwUqr7uU0gJmOgiqO2gNgEwQ4zDgbEacaTj2tDAtkmc1BexP6OK5gKprSqJvgv33n4PB3yYSYwtQjyKDFg4obtwywLsZfcZg87rMNRuq3IaNcigiJ/nFfIwodvbyXKtrEFBBZJb4j7yCQwpENuw4jLynaK1c/8TUKLfNwWJvT7r99rGu4mGhbNUtWnQTv3i4VqztRHMnOXTKZtE6lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkexYGptCHbgLndtPlhEQnAVvgf8/mTkKb/te38N9IQ=;
 b=aaYnpm4hx66R4qehByBCcYn786JTN71LoB7QkiFaXTLo0LjfeLHe3G7nxU8oPmCC55FzAmOreO8zW+As75+KtvN7tO4GLClj7MUY6Dwe+lYIsGjGwkytKeIZ2lUfH/H4/Csd5iFJPyHOOUF1FCQDsD2vZ9MgRNBYdEnzvLBKgew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v v2 7/7] x86: relax some CPU checks for non-64 bit CPUs
Date: Thu, 12 Mar 2026 20:43:39 +0000
Message-ID: <20260312204339.740403-8-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260312204339.740403-1-kevin.lampis@citrix.com>
References: <20260312204339.740403-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0397.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::6) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|PH0PR03MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: 336731d1-0c8c-4079-c365-08de807821e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VYU0VFfgG1ayuXg3aofDvX0H0O8tsINDkbSa9GsFzFLtRLlUEOSLDtCud4vnHaijCec8eeXU1iDOdAPFrkyOah9QdPoYCePtzjGi72DZVQJAQsto0tO2hsxwJHrbHz++WL3BY5D8RhL6ckYkHyZJCYip1Yl9oLEi+D1YxBGgU9ted0o6641kFTw3P7+TflCnZU/v7ZJ2ZRRs8k5ZUr8cBWYfjQKMax74NUYoV2l8ANORHrvMto4Ejb1ueLGWNwa/7CQy+ceswl6SMB0YjOBaKMlB1Ns6NhN1xP/3YaKLZEASR6R3dG98Gi7vVqUIGaiWSBcDX2NsNGTpZi4mLllb8woNkIi99KmI7EhuSmRjpg5fYWCwogFjU9T8aiikAtt1Vh9KfbTjWUBabmCMy11tx7WGDxeHDqVI551Q6sxVYH3w0UCR9jA9V/n56bGi54q2npScYWxyN/K9UFZ3SaCkn4jhnhL+yIsIgPi6xsrweQ85FHj1g4rGd0EkaeqBSlmQx5GnV0PJKyzuts5md0MsXYLkCKGtNCU1YXh+peDIDUxNhPQhLROo/w578TaZ1qos9Ejsb18eMUk5Z2QBKkGh1b+DmUh7xOtdBAztfDu2n+dRnk4/SAe635sHlHWq06lARp6jFX4TGZRRnOUHEOEbYhhtNYOT527fKxPkpvuCJF4Wj+A5jw63V7cYfmD4Q6yYPWm28kucF9sSg19qGVWQ6tRp9qPekhnUvzrr50MUjJc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r2NY/es+XDL5AP9usvG06HXvhNHipNGL+bwqxPTWFKOFSDteNWwx+LBDOn9S?=
 =?us-ascii?Q?4QSH1n0Ii4KLb8PwvyV37lzui+jGuO8RyBdLpKxDVGyb3vc5T3LYUTLpU3oY?=
 =?us-ascii?Q?l8C9KSby4vujArD8o1TwyhJFiqCTf+KqOwGnz2Kx+bRQhojpWCMSGtHcj7uf?=
 =?us-ascii?Q?ZZBwaL4tuej1nJHe8MtpeaIrTFAHo+cYfByoXPHunlvTnGKUzN8mvgB0qnq/?=
 =?us-ascii?Q?GZfCGGsZ3sIkKVT+5oiHkMdSIrLOkyUR3cN/RlMjQOQGLWWrziou6XI7T7Y5?=
 =?us-ascii?Q?KAN8rJmbNlUwYbyXxfJXDYYfGjAfsjwOPL3AshCAqitQu1o87Q5tK52UBI6L?=
 =?us-ascii?Q?ZYEhZ9YjKV2mL54C3lC4BXNRSsvk2Lbr0YVX16++2/1KwIw64Z5dVOmQcWTO?=
 =?us-ascii?Q?8VpRd7sqIicVXHqmcjhvBrGooqINidGk8FESJjJ8mRhrcxYu4sMhnpONME3j?=
 =?us-ascii?Q?W4RlvT5rMWPE1wkFzZNtDwZuCJZb0cCZrCGpG0TtIshgcr+JSXIUnoaIiTMW?=
 =?us-ascii?Q?3tzNQcb79jkViBnMrkVjGyKnfz+/IjN70GyJagtm+yOVbVdH/lLvlrZUNjsQ?=
 =?us-ascii?Q?Nxw1GudgsIJhy2sT0+7YeeNnB0husr9IPHbF/2wxaO5XqVR/i2n0mNOQ6MmL?=
 =?us-ascii?Q?3ZeYPwkR+2Fg/xyIPd2yXaoQE/79pSVjq9MbCdH6u07kiSHemUZXOsw8H+xo?=
 =?us-ascii?Q?BDSEyrY+nG6RaWNnlM1BlQCRT7fsPENfbY/e1H7A7eX67TFnuV2TTz5shqVq?=
 =?us-ascii?Q?icvTGtkQZ2vAncWfSOx4R4nYn3FF85NkpF34g9Rm8K6qUMAE/Wkj0GYTsbmP?=
 =?us-ascii?Q?GJDZJWGv8ffGcEV5HoFL1Y5C6/4Q3h8LWwPUd56zQ4AiMtbRbWasmZtZHv05?=
 =?us-ascii?Q?NugN8FPs6Zc/Lnk2eOl8vAdPBPcwHHi9uQwp5/NpAp3jrEBIMCL8NF9BCBEU?=
 =?us-ascii?Q?EU01YmPaIdmS2ZJv+yX2DZzu1lc5HkGPTyDDGBgzy42Lij6Ze06Pu3ijLXYN?=
 =?us-ascii?Q?D4BGSZ79EO0ZNAw6NjiOu4fpI01kMMGvC3r1ZSkdPDOEKDMnLBsBEKbPpyJW?=
 =?us-ascii?Q?oNQqDeGxB3QqxNFhLcpZwsvTxEoMztJa0ch3ujqdCwtCE0nov2D5tq4pSjaK?=
 =?us-ascii?Q?iWYAJPXzDcZAHy8XnoCb/H48HJzQ4nb/LqiNi9bolBqRlfdIUcdXPOKra1yc?=
 =?us-ascii?Q?ze5pUNo0FFQg4Vhc5+vgG3d/d+wN2UpH8JRooO3NIBRJtFxVXhURfJ3rEyOp?=
 =?us-ascii?Q?LFATrIUOeKpgiANQtTH97jurovwFu/63NdWKbc18xP2x+9iUKB2fV4ysMi73?=
 =?us-ascii?Q?5fEU2Eeo/b0ajgnOUUs6NtF3ZASNa2TYZB8sIwDXjtwa+mD/rs5J0Lj64gfC?=
 =?us-ascii?Q?IJP6n4+Hwrw8y7ZQEtmWvdXiUS9ZJOqSE6lbc4mZEb7DjWAw+5JKZ7b90LpD?=
 =?us-ascii?Q?Fz/sxC6f8I9c5Nr0FsJj4gxGzZpHQKJQkV0nKvn18sH2OoYOszfyB+ydC7aR?=
 =?us-ascii?Q?zjdEOSn3ncdVSjx/RBXcMPexGiVpa2g+rr1SORohJS6EA0mHjKuxWrb5UAyf?=
 =?us-ascii?Q?GR8eteV/gr1kJKM6Bmh5J+Ssfu3bImvWnRB92Up7Y6hrVdpcBwDO5MWDA7UN?=
 =?us-ascii?Q?PktziG1jrVKeMGyLwfALg9dZ6bI/89tonvJEfjMyTSidRxUVCNhoUJq3YANX?=
 =?us-ascii?Q?UsI99jlsG7bSu2P4q/g2kpKonF2rJ5EfJHfklklrQaNPDzUkS0GnnKdhNyEO?=
 =?us-ascii?Q?LLco3ENkgA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336731d1-0c8c-4079-c365-08de807821e7
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 20:44:18.7532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/TJmI2lvtRfRZ9fkGCWh7cB7QO+E5xeFwXDD0JMMN7uzvH5UruxqOQVmYXk0lTgLYfJ8hgm1DNWR1wwWTt/eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6979
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
X-Rspamd-Queue-Id: AB8E32798AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These old non-64 bit CPU models are not supported by Xen anymore so the
checks are no longer needed.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v2:
- New patch based on review comments
---
 xen/arch/x86/acpi/cpu_idle.c    | 2 +-
 xen/arch/x86/cpu/mcheck/mce.c   | 8 +-------
 xen/arch/x86/cpu/mtrr/generic.c | 3 +--
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 6622965ace..640935c40c 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1059,7 +1059,7 @@ static void acpi_processor_power_init_bm_check(struct acpi_processor_flags *flag
      * is not required while entering C3 type state on
      * P4, Core and beyond CPUs
      */
-    if ( c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH )
+    if ( c->vendor == X86_VENDOR_INTEL )
             flags->bm_control = 0;
 }
 
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 8a41116aa4..9f45ca5be1 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -777,13 +777,7 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
 
 #ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
-        switch ( c->family )
-        {
-        case 6:
-        case 15:
-            inited = intel_mcheck_init(c, bsp);
-            break;
-        }
+        inited = intel_mcheck_init(c, bsp);
         break;
 #endif
 
diff --git a/xen/arch/x86/cpu/mtrr/generic.c b/xen/arch/x86/cpu/mtrr/generic.c
index 190be7f1b4..23c279eb9a 100644
--- a/xen/arch/x86/cpu/mtrr/generic.c
+++ b/xen/arch/x86/cpu/mtrr/generic.c
@@ -218,8 +218,7 @@ static void __init print_mtrr_state(const char *level)
 			printk("%s  %u disabled\n", level, i);
 	}
 
-	if ((boot_cpu_data.vendor == X86_VENDOR_AMD &&
-	     boot_cpu_data.family >= 0xf) ||
+	if (boot_cpu_data.vendor == X86_VENDOR_AMD ||
 	     boot_cpu_data.vendor == X86_VENDOR_HYGON) {
 		uint64_t syscfg, tom2;
 
-- 
2.51.1


