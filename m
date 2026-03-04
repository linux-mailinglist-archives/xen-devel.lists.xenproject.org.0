Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JmlL8mNqGmbvgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5124B2073DB
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245961.1545321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHo-0000vo-AI; Wed, 04 Mar 2026 19:53:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245961.1545321; Wed, 04 Mar 2026 19:53:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHo-0000uM-4h; Wed, 04 Mar 2026 19:53:36 +0000
Received: by outflank-mailman (input) for mailman id 1245961;
 Wed, 04 Mar 2026 19:53:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfWr=BE=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vxsHm-0007ik-2A
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 19:53:34 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1f4b33e-1803-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 20:53:32 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DM4PR03MB6079.namprd03.prod.outlook.com (2603:10b6:5:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:53:28 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:53:28 +0000
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
X-Inumbo-ID: d1f4b33e-1803-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBu/gcvu514ASS/FLMZkWnmlcogcqamezZYztaRFnhx2dRj+ASBIxo5gOyWVZsjDrO+Hb+m7pOa3CGkS+s4/fBDwcSqFY7eUjDraF1S4DFgTfNS2UPhjFdVHiXSeUoyBDoFyu71Qr21NINQzkbF5MZY149fHDr2gSAPH/JPb8E32CoaXzryDNbFBhO0/+ACcrcH5Gj1BV3IwMRqOh00FV+rBVSASB5iVB/c/60s5dtEB4lM3yioH/xJo+opSOwQkaFrR/7PxFI46DgSMgDMLbdfUguvbUMk9q6mxcnFSb0a6d0etbHqVlnAzG+UFnOkRxUx7NNKNQF6H61XgqHqyFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vihGUYdNoEcTWfXNkSEwuKOxDjEQZzvneznmn0lSWQc=;
 b=Ji1w94j17Aux3uK36xA/s3RbT8igmqKNIcbyzb1xWCucauSke6xSanasWq5NYFng+kWZwnZvIXVBVhYhS12Q+myrwAzqvTOIeWRRIG8j+D+ja39WBllxiF1fzaelUUbJppHYg+5xgxl0+V/aTme+UM4mopRGPLjEBu2bg0mSCy4WtR3gZ1BURxWq81PyU7kLf75P1DEIXES6iIQ7sohef7dRKxR5egiVRvqClbVE4weW8HOCfCMzjzThKPQ4XyCUqnILwT47vsWecMkEGSik0zmW3cSHstuz8Bxg+2YbxDIW4qScTqnGn5Xt5i6vvomPFHfEuf7XZGRPpxD3W3ueew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vihGUYdNoEcTWfXNkSEwuKOxDjEQZzvneznmn0lSWQc=;
 b=tSKsiaI3c6eFxQ6bBFnF/B+yclwvm52O2v6dDNhFn0EZMTKjHmnninqKdXlmbKXSa9NzwqHstAU1hePe7tMrJ00ZaFc5rvTs2aB5AswHNq5RIHsBIKrdBUgvGNGN6yRx9NqEiU7hKKo+56G+oWjHhUOkHa/2VV/+uOqAN8X7b+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 5/6] x86: Remove x86 prefixed names misc
Date: Wed,  4 Mar 2026 19:53:49 +0000
Message-ID: <20260304195350.837593-6-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260304195350.837593-1-kevin.lampis@citrix.com>
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::13) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DM4PR03MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f321e42-7525-474a-9432-08de7a27b470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	MZ+JnYsIJBZNMv6GEZCZKn6QC9Zs67wasgC3Qr5wbD+ybRJl78bF5Z9OmiZ274iL8s57PnZ/SIkh0uvrYGoFvxz3kO7W+sHdE95jQ1dK5O8iMqs0n0SKi39wHbuBtfw3TSYE6Lu3qVGq8X7MjejxpmCebG88+lM3PM2BuKAtmmgqC5WzHlN7HjRMhKFv+CawtL8qpjfGAC4KBYrcZLw/5JsWqaxdQnNZkoJZrymAORM5HLuNziCvtTGJcxYp7VuNHqDqBJQ/F1CfMwyodFIxa1b4YAIruy7SUSLHZBJk+gugldGyHmd1aUNQqR8oq8NXhCKAl4gdfZywyFs/OP76GgVF+KUzTZhFLsaytD0d3y57Rv4RNlBnrQYRWbUEFI0TSLJwHNtYve6VrwEPcFie7KTkt1CDmFmwBe1DGhKF59+0qwxxjpOMh3wlcUN6PitJgnm/HXomsHmhMlFU3cQukoTarncsBgNaUP8THRpyR5moBolJtZqKWMHzaD+uWOj2qu3Sf0xJo8PSuzlylOI7+HcUYQ4OUhYe5YglKz7yvLeDULS6Lq5knfHj5cXzh4yu0AXpi8UxGeOyNPhYRiJ4d8yoQidEFMbPDOv06rXl6YC0FN4AYY2g/Hjadje11hAUBLpbMt3bgwPYZNFYsEGaWfIUuWgTz6rYYgmH4q9GBJo3BIOCjmoiJ0jFNjC/TXuIHjEC52OLb902qM6PomeWrvfBLEuzDjQmQF3TA1nx+I4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p1WaoMyBpueLuya4zqEDf2Xk0rXsuXHgG1Oy/Iv5TlFEUswvPkzy4wUl0YRa?=
 =?us-ascii?Q?tyxeRWoAc/LaIdXSKWhky3KbcyctLwiTKsAj/7T1PAYkZAJWD4h51JoodPKB?=
 =?us-ascii?Q?tSzMTODKZO8C385oyTAvR2Hxwo9PytyAruNprRlZIfPDfswkKUDpke95o5rG?=
 =?us-ascii?Q?hqbX4adbHqvT6cmKEyDObx368Y+Z+oDjwHVCFgUwlYOL+T2ne1F1ht7PbsOH?=
 =?us-ascii?Q?IvubySTxB3zhEbXO0ebcTJDVel8287Sv86xIl0fJWpXH7E22PoM4duCxmTiD?=
 =?us-ascii?Q?npEgx5w4rbxGD9qG1TTnH+BWp+n9g8AraQ+rf6tir2HESSaHQeiHNLW0DlNx?=
 =?us-ascii?Q?asflRwSlGkCQKZ4lfmM+k50vL6wulya1v4uGEvDZmgP2m8BhKBjOcKLEdxKs?=
 =?us-ascii?Q?8xtJNIyQcp9ych20mmsL0YgC2TnoWI1EatUWTr249YXEO7n3+EwhlslMM14y?=
 =?us-ascii?Q?edeHGyX1r12VecsKwVEVQ03Xzij4Uq7haKEBXi544PtObE1Ds0xI88i0jlDH?=
 =?us-ascii?Q?BNsFe3ChT2tH+qG24I7cced99/HIcRJEEgrXIDCUm1YHp39KbhoOHSw2bNhG?=
 =?us-ascii?Q?JukGE/zV579j0+YOvkrILPgpwzgGG1qiu1ObTvId4SoXBc8DfK0CSJlSSr8f?=
 =?us-ascii?Q?2YA/9UQ+I6NfdFsQXqILvRdRkND792M+n8NT6j5o4YAkLxTo3yX9qDe4OoRX?=
 =?us-ascii?Q?Ydn0ykAlGNHhsjI3Hjs1ixYSJJ9fOiAsym4y2ssltj6J1o9QX+dTs+skPw4T?=
 =?us-ascii?Q?aN/ES06KOVAzN6QP5oYGghinfGoJ+JpYxiA17lhyCnWgldNv+W9Juf/Y6vpq?=
 =?us-ascii?Q?LVA7W6Ai1dOu+tYQR0eNWsSNTSNZLJwzFp4sRe/pJU3u1JumA6lBv+ge5rvV?=
 =?us-ascii?Q?K+XEfr3AktNDdOq4YQcPbpIwpIcbpNKovU3Ly8m/TxABFb8KpcZgv5ztUI3O?=
 =?us-ascii?Q?j0F9F9g0GlTlE4GzSpWPlhDK1DwyYOVzNqoxm4hO09tiAGr7q79woL8iEGn2?=
 =?us-ascii?Q?l/WtjRIl5b5ZsAD0dWnDmt55TcgxBOxI0+5tYlF9mnwGrW2b4AQppJvpufa9?=
 =?us-ascii?Q?eSAEUwXkziZT0w683ShfK32AfwrB9QdsrT/yWPr2LFLydadFa9Qxy3mCG6qm?=
 =?us-ascii?Q?+RgYqa8y8qFpAFxN1nabOQf0d2eg/aDo6MH3RwHrl8SWT8TocF1PHy5YzOFh?=
 =?us-ascii?Q?lhJcWzCDaf38+rpLrXhb+/qJKscvactSnoHMvY6ThHKn5hzQpbweWIYarSAH?=
 =?us-ascii?Q?2pPdugbBI4ebn9wyHSzwH8Np0atzr3Jj8qz14KnF+pE23ztxcn3PybZnzpHG?=
 =?us-ascii?Q?CV7HWMibsVL/nYnwzwKMVXnPRcu392eNsSyBxZGI03CImDSiM1H1413fJweE?=
 =?us-ascii?Q?QWavWCFKAFKyKLw+kh+Ys4gZOvUeMF910YQmF+AU2LbIkw4d0jZ+1xWVV6Ap?=
 =?us-ascii?Q?6EGiiC7NMKF59ALek3Y2dX8DgYguWe6ujfCLwpjD2Bn64erOyYK9nHMF+7LB?=
 =?us-ascii?Q?NPcGgvA9VVgTxW2JPXzojDOL+x004407BscKijpDmvXokK520norgcoaWHg1?=
 =?us-ascii?Q?pSdxmZkFDlRPDL8lOa09a3NfaW7U3oa9N5B7+aI6g/cnLmNaBesxVz1ecfnb?=
 =?us-ascii?Q?6R1cpPCH3L05zS1mc9pRi9gQPubis9hrOWNcxdHXNTaifulKfpHrXiOpv3v9?=
 =?us-ascii?Q?PvVklbwqsWapq1XzKQgqh5l/Y2++9Xe6o9Lu1jWO2M5CddwNIBC8nQidNjfp?=
 =?us-ascii?Q?s0MydMRlhA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f321e42-7525-474a-9432-08de7a27b470
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:53:28.3868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjpGxxJlbP2Lx8Yhu7eMd6Yuh+rfor4nZFl+B2VrNyCGYYKXmjptSEJp9RMQzQLmF3EkF9GGxRRIbowla7KpAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6079
X-Rspamd-Queue-Id: 5124B2073DB
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[boot_cpu_data.family:url];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

This work is part of making Xen safe for Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
 xen/arch/x86/alternative.c               |  8 ++++----
 xen/arch/x86/apic.c                      |  2 +-
 xen/arch/x86/cpuid.c                     |  2 +-
 xen/arch/x86/dom0_build.c                |  4 ++--
 xen/arch/x86/domain.c                    | 12 ++++++------
 xen/arch/x86/e820.c                      |  2 +-
 xen/arch/x86/i8259.c                     |  2 +-
 xen/arch/x86/irq.c                       |  4 ++--
 xen/arch/x86/mpparse.c                   |  6 +++---
 xen/arch/x86/msr.c                       |  4 ++--
 xen/arch/x86/nmi.c                       | 12 ++++++------
 xen/arch/x86/platform_hypercall.c        |  8 ++++----
 xen/arch/x86/pv/domain.c                 |  2 +-
 xen/arch/x86/setup.c                     |  6 +++---
 xen/arch/x86/traps-setup.c               |  4 ++--
 xen/arch/x86/tsx.c                       |  4 ++--
 xen/drivers/passthrough/amd/iommu_init.c |  6 +++---
 17 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 9f844241bc..5ed0c26725 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -89,7 +89,7 @@ static bool init_or_livepatch_read_mostly toolchain_nops_are_ideal;
 
 static void __init arch_init_ideal_nops(void)
 {
-    switch ( boot_cpu_data.x86_vendor )
+    switch ( boot_cpu_data.vendor )
     {
     case X86_VENDOR_INTEL:
         /*
@@ -97,10 +97,10 @@ static void __init arch_init_ideal_nops(void)
          * actually perform better with the "k8_nops" than with the SDM-
          * recommended NOPs.
          */
-        if ( boot_cpu_data.x86 != 6 )
+        if ( boot_cpu_data.family != 6 )
             break;
 
-        switch ( boot_cpu_data.x86_model )
+        switch ( boot_cpu_data.model )
         {
         case 0x0f ... 0x1b:
         case 0x1d ... 0x25:
@@ -111,7 +111,7 @@ static void __init arch_init_ideal_nops(void)
         break;
 
     case X86_VENDOR_AMD:
-        if ( boot_cpu_data.x86 <= 0xf )
+        if ( boot_cpu_data.family <= 0xf )
             ideal_nops = k8_nops;
         break;
     }
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index fb38be7ec3..d69ef9e16a 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -406,7 +406,7 @@ void __init init_bsp_APIC(void)
     value |= APIC_SPIV_APIC_ENABLED;
     
     /* This bit is reserved on P4/Xeon and should be cleared */
-    if ((boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) && (boot_cpu_data.x86 == 15))
+    if ((boot_cpu_data.vendor == X86_VENDOR_INTEL) && (boot_cpu_data.family == 15))
         value &= ~APIC_SPIV_FOCUS_DISABLED;
     else
         value |= APIC_SPIV_FOCUS_DISABLED;
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 5decfad8cd..6e9b15c9c3 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -437,7 +437,7 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 
     case 0xa:
         /* TODO: Rework vPMU control in terms of toolstack choices. */
-        if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
+        if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
              !vpmu_available(v) )
             *res = EMPTY_LEAF;
         else
diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index 0b467fd4a4..864dd9e53e 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -572,10 +572,10 @@ int __init dom0_setup_permissions(struct domain *d)
             rc |= iomem_deny_access(d, mfn, mfn);
     }
     /* HyperTransport range. */
-    if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+    if ( boot_cpu_data.vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
     {
         mfn = paddr_to_pfn(1UL <<
-                           (boot_cpu_data.x86 < 0x17 ? 40 : paddr_bits));
+                           (boot_cpu_data.family < 0x17 ? 40 : paddr_bits));
         rc |= iomem_deny_access(d, mfn - paddr_to_pfn(3UL << 32), mfn - 1);
     }
 
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 8eb1509782..b36e113724 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -319,7 +319,7 @@ void domain_cpu_policy_changed(struct domain *d)
             if ( cpu_has_htt )
                 edx |= cpufeat_mask(X86_FEATURE_HTT);
 
-            switch ( boot_cpu_data.x86_vendor )
+            switch ( boot_cpu_data.vendor )
             {
             case X86_VENDOR_INTEL:
                 /*
@@ -372,7 +372,7 @@ void domain_cpu_policy_changed(struct domain *d)
         {
             uint64_t mask = cpuidmask_defaults._6c;
 
-            if ( boot_cpu_data.x86_vendor == X86_VENDOR_AMD )
+            if ( boot_cpu_data.vendor == X86_VENDOR_AMD )
                 mask &= (~0ULL << 32) | p->basic.raw[6].c;
 
             d->arch.pv.cpuidmasks->_6c = mask;
@@ -387,7 +387,7 @@ void domain_cpu_policy_changed(struct domain *d)
              * wholesale from the policy, but clamp the features in 7[0].ebx
              * per usual.
              */
-            if ( boot_cpu_data.x86_vendor &
+            if ( boot_cpu_data.vendor &
                  (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
                 mask = (((uint64_t)p->feat.max_subleaf << 32) |
                         ((uint32_t)mask & p->feat._7b0));
@@ -400,7 +400,7 @@ void domain_cpu_policy_changed(struct domain *d)
             uint64_t mask = cpuidmask_defaults.Da1;
             uint32_t eax = p->xstate.Da1;
 
-            if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+            if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
                 mask &= (~0ULL << 32) | eax;
 
             d->arch.pv.cpuidmasks->Da1 = mask;
@@ -427,7 +427,7 @@ void domain_cpu_policy_changed(struct domain *d)
             if ( !(p->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
                 edx &= ~CPUID_COMMON_1D_FEATURES;
 
-            switch ( boot_cpu_data.x86_vendor )
+            switch ( boot_cpu_data.vendor )
             {
             case X86_VENDOR_INTEL:
                 mask &= ((uint64_t)edx << 32) | ecx;
@@ -457,7 +457,7 @@ void domain_cpu_policy_changed(struct domain *d)
         cpu_policy_updated(v);
 
         /* If PMU version is zero then the guest doesn't have VPMU */
-        if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+        if ( boot_cpu_data.vendor == X86_VENDOR_INTEL &&
              p->basic.pmu_version == 0 )
             vpmu_destroy(v);
     }
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index ca577c0bde..872208ab37 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -426,7 +426,7 @@ static uint64_t __init mtrr_top_of_ram(void)
 
     /* By default we check only Intel systems. */
     if ( e820_mtrr_clip == -1 )
-        e820_mtrr_clip = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
+        e820_mtrr_clip = boot_cpu_data.vendor == X86_VENDOR_INTEL;
 
     if ( !e820_mtrr_clip )
         return 0;
diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
index 5c7e21a751..d2a08661f8 100644
--- a/xen/arch/x86/i8259.c
+++ b/xen/arch/x86/i8259.c
@@ -419,7 +419,7 @@ void __init init_IRQ(void)
          * the interrupt.
          */
         cpumask_copy(desc->arch.cpu_mask,
-                     (boot_cpu_data.x86_vendor &
+                     (boot_cpu_data.vendor &
                       (X86_VENDOR_AMD | X86_VENDOR_HYGON) ? &cpumask_all
                                                           : cpumask_of(cpu)));
         desc->arch.vector = LEGACY_VECTOR(irq);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index cc2934bfca..739fc04bd1 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2011,8 +2011,8 @@ void do_IRQ(struct cpu_user_regs *regs)
                      * interrupts have been delivered to CPUs
                      * different than the BSP.
                      */
-                    (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
-                                                 X86_VENDOR_HYGON))) &&
+                    (boot_cpu_data.vendor & (X86_VENDOR_AMD |
+                                             X86_VENDOR_HYGON))) &&
                    bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
             {
                 printk("CPU%u: No irq handler for vector %02x (IRQ %d%s)\n",
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index c1171f7a3a..1b41aa573f 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -511,9 +511,9 @@ static inline void __init construct_default_ISA_mptable(int mpc_default_type)
 	/* Either an integrated APIC or a discrete 82489DX. */
 	processor.mpc_apicver = mpc_default_type > 4 ? 0x10 : 0x01;
 	processor.mpc_cpuflag = CPU_ENABLED;
-	processor.mpc_cpufeature = (boot_cpu_data.x86 << 8) |
-				   (boot_cpu_data.x86_model << 4) |
-				   boot_cpu_data.x86_mask;
+	processor.mpc_cpufeature = (boot_cpu_data.family << 8) |
+				   (boot_cpu_data.model << 4) |
+				   boot_cpu_data.stepping;
 	processor.mpc_featureflag =
             boot_cpu_data.x86_capability[FEATURESET_1d];
 	processor.mpc_reserved[0] = 0;
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ad75a2e108..6a97be59d5 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -170,7 +170,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 
     case MSR_IA32_PLATFORM_ID:
         if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
-             !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
+             !(boot_cpu_data.vendor & X86_VENDOR_INTEL) )
             goto gp_fault;
         rdmsrl(MSR_IA32_PLATFORM_ID, *val);
         break;
@@ -190,7 +190,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
          * the guest.
          */
         if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
-             !(boot_cpu_data.x86_vendor &
+             !(boot_cpu_data.vendor &
                (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
              rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
             goto gp_fault;
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index a0c9194ff0..447fac19d3 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -216,12 +216,12 @@ void disable_lapic_nmi_watchdog(void)
 {
     if (nmi_active <= 0)
         return;
-    switch (boot_cpu_data.x86_vendor) {
+    switch (boot_cpu_data.vendor) {
     case X86_VENDOR_AMD:
         wrmsrns(MSR_K7_EVNTSEL0, 0);
         break;
     case X86_VENDOR_INTEL:
-        switch (boot_cpu_data.x86) {
+        switch (boot_cpu_data.family) {
         case 6:
             wrmsrns(MSR_P6_EVNTSEL(0), 0);
             break;
@@ -362,7 +362,7 @@ static void setup_p4_watchdog(void)
         clear_msr_range(0x3F1, 2);
     /* MSR 0x3F0 seems to have a default value of 0xFC00, but current
        docs doesn't fully define it, so leave it alone for now. */
-    if (boot_cpu_data.x86_model >= 0x3) {
+    if (boot_cpu_data.model >= 0x3) {
         /* MSR_P4_IQ_ESCR0/1 (0x3ba/0x3bb) removed */
         clear_msr_range(0x3A0, 26);
         clear_msr_range(0x3BC, 3);
@@ -387,16 +387,16 @@ void setup_apic_nmi_watchdog(void)
     if ( nmi_watchdog == NMI_NONE )
         return;
 
-    switch ( boot_cpu_data.x86_vendor )
+    switch ( boot_cpu_data.vendor )
     {
     case X86_VENDOR_AMD:
         setup_k7_watchdog();
         break;
 
     case X86_VENDOR_INTEL:
-        switch (boot_cpu_data.x86) {
+        switch (boot_cpu_data.family) {
         case 6:
-            setup_p6_watchdog((boot_cpu_data.x86_model < 14) 
+            setup_p6_watchdog((boot_cpu_data.model < 14)
                               ? P6_EVENT_CPU_CLOCKS_NOT_HALTED
                               : CORE_EVENT_CPU_CLOCKS_NOT_HALTED);
             break;
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index cd4f0ae5e5..0431f875af 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -104,7 +104,7 @@ static bool msr_read_allowed(unsigned int msr)
      * the platform doesn't actually support this MSR.
      */
     case MSR_TEMPERATURE_TARGET:
-        return boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+        return boot_cpu_data.vendor == X86_VENDOR_INTEL &&
                host_cpu_policy.basic.digital_temp_sensor;
 
     case MSR_PACKAGE_THERM_STATUS:
@@ -688,9 +688,9 @@ ret_t do_platform_op(
             const struct cpuinfo_x86 *c = &cpu_data[ver->xen_cpuid];
 
             memcpy(ver->vendor_id, c->x86_vendor_id, sizeof(ver->vendor_id));
-            ver->family = c->x86;
-            ver->model = c->x86_model;
-            ver->stepping = c->x86_mask;
+            ver->family = c->family;
+            ver->model = c->model;
+            ver->stepping = c->stepping;
         }
 
         ver->max_present = cpumask_last(&cpu_present_map);
diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
index d16583a745..0fd05c7059 100644
--- a/xen/arch/x86/pv/domain.c
+++ b/xen/arch/x86/pv/domain.c
@@ -174,7 +174,7 @@ static int __init cf_check pge_init(void)
 {
     if ( opt_global_pages == -1 )
         opt_global_pages = !cpu_has_hypervisor ||
-                           !(boot_cpu_data.x86_vendor &
+                           !(boot_cpu_data.vendor &
                              (X86_VENDOR_AMD | X86_VENDOR_HYGON));
 
     return 0;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 27c63d1d97..e5f1b4b787 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1407,7 +1407,7 @@ void asmlinkage __init noreturn __start_xen(void)
          * supervisor shadow stacks are now safe to use.
          */
         bool cpu_has_bug_shstk_fracture =
-            boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+            boot_cpu_data.vendor == X86_VENDOR_INTEL &&
             !boot_cpu_has(X86_FEATURE_CET_SSS);
 
         /*
@@ -2038,10 +2038,10 @@ void asmlinkage __init noreturn __start_xen(void)
 
     /* Do not enable SMEP/SMAP in PV shim on AMD and Hygon by default */
     if ( opt_smep == -1 )
-        opt_smep = !pv_shim || !(boot_cpu_data.x86_vendor &
+        opt_smep = !pv_shim || !(boot_cpu_data.vendor &
                                  (X86_VENDOR_AMD | X86_VENDOR_HYGON));
     if ( opt_smap == -1 )
-        opt_smap = !pv_shim || !(boot_cpu_data.x86_vendor &
+        opt_smap = !pv_shim || !(boot_cpu_data.vendor &
                                  (X86_VENDOR_AMD | X86_VENDOR_HYGON));
 
     if ( !opt_smep )
diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
index d77be8f839..1aff0327dc 100644
--- a/xen/arch/x86/traps-setup.c
+++ b/xen/arch/x86/traps-setup.c
@@ -243,10 +243,10 @@ static void __init init_ler(void)
      * Intel Pentium 4 is the only known CPU to not use the architectural MSR
      * indicies.
      */
-    switch ( boot_cpu_data.x86_vendor )
+    switch ( boot_cpu_data.vendor )
     {
     case X86_VENDOR_INTEL:
-        if ( boot_cpu_data.x86 == 0xf )
+        if ( boot_cpu_data.family == 0xf )
         {
             msr = MSR_P4_LER_FROM_LIP;
             break;
diff --git a/xen/arch/x86/tsx.c b/xen/arch/x86/tsx.c
index fe9f0ab4f7..38371487b9 100644
--- a/xen/arch/x86/tsx.c
+++ b/xen/arch/x86/tsx.c
@@ -148,8 +148,8 @@ void tsx_init(void)
             {
                 printk(XENLOG_ERR
                        "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RTM_ALWAYS_ABORT vs RTM mismatch\n",
-                       boot_cpu_data.x86, boot_cpu_data.x86_model,
-                       boot_cpu_data.x86_mask, this_cpu(cpu_sig).rev);
+                       boot_cpu_data.family, boot_cpu_data.model,
+                       boot_cpu_data.stepping, this_cpu(cpu_sig).rev);
 
                 setup_clear_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);
                 setup_clear_cpu_cap(X86_FEATURE_TSX_FORCE_ABORT);
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 00d2c46cbc..d77dd85112 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -840,9 +840,9 @@ static void amd_iommu_erratum_746_workaround(struct amd_iommu *iommu)
 {
     u32 value;
 
-    if ( (boot_cpu_data.x86 != 0x15) ||
-         (boot_cpu_data.x86_model < 0x10) ||
-         (boot_cpu_data.x86_model > 0x1f) )
+    if ( (boot_cpu_data.family != 0x15) ||
+         (boot_cpu_data.model < 0x10) ||
+         (boot_cpu_data.model > 0x1f) )
         return;
 
     pci_conf_write32(iommu->sbdf, 0xf0, 0x90);
-- 
2.51.1


