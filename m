Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJxIGcWNqGmbvgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DF82073BF
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245953.1545301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHe-00006k-LF; Wed, 04 Mar 2026 19:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245953.1545301; Wed, 04 Mar 2026 19:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHe-0008Vb-HC; Wed, 04 Mar 2026 19:53:26 +0000
Received: by outflank-mailman (input) for mailman id 1245953;
 Wed, 04 Mar 2026 19:53:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfWr=BE=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vxsHc-0007ik-Ij
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 19:53:24 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbc687e3-1803-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 20:53:21 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DM4PR03MB6079.namprd03.prod.outlook.com (2603:10b6:5:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:53:19 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:53:19 +0000
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
X-Inumbo-ID: cbc687e3-1803-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5FrXUw11Ok8BT/ZirIWInhg8jIoCMqChP+Mdj0FNLx6nVrL751YhteT3kxSwQDuGNltMj325E5Bqmb9T0ovY/MayWb5kQsF1+E6YtJW/SyDd1Nzv6JLTfim5uFoooXKzh459c+qco1qB9R6KWv2VKEKhhQKipPPQEIukRtSltrSu6mMo2ZEkuKMgHfeJhIWYAvVMCD6Rr1BDw9V2WjnaAgI6F4afyFU9NHIeGJT4LMUPqkyioMWP2wq3MzIHRpmvmbmEPeV7IXSvVzHivHMlF+K8WeSYXttqW6kFpj6X4soOJ9VOIPNhge6Zs52IvxZGKlci3SVtKdPEcJ8vbV1NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPANznstjJv8a9l5wYBDzqoZVdkqO/BbwSmXViXUd2M=;
 b=YyJrn3+kt4mDci4QBEH91laDIxS3iNx/MfYWBAfF24sgIWLIDAUtgrs5x8ZvbgXFV4p9FXZww5eiijiRduQdJXvixKkve+jwWRK3qSBhUMNqo2jz1QtBvINGGMa9YQ/sIPWE0zSgJ38Tkf9ePghRoLExDAZjzqtSRC9nAhJq5K1FBC7o0344i2H862E+BqlIZf1B+lx0Uq9Sl/EtYTbQoGFHqup6/5W8NaL5RrwL6TF52BmElhtmQ55iZ6J/fjauo4sFlHc4N4wdVMW5Fdt0f44j660QqwS+LI30hdhZpkh23TmvR6Mq+jNO5AkIBBuU1tRxB87R2RHMVVU+oWyTlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPANznstjJv8a9l5wYBDzqoZVdkqO/BbwSmXViXUd2M=;
 b=vJE1UHM+LcISvaiBLa8bM8rUKsyid+in/M49mGCISkYfndKn5S3AiQgfjr4cRlQ8LdkfdAcfr5ro3pFbST3wVnwKT7fzbdlD3nk4tBryHsSsMCcGfdKANOewpHpFnduKmknbp8Ggzm7dWf/TEK59poq8zpHvZgrEQMaVFV8kWRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 3/6] x86: Remove x86 prefixed names from hvm code
Date: Wed,  4 Mar 2026 19:53:47 +0000
Message-ID: <20260304195350.837593-4-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260304195350.837593-1-kevin.lampis@citrix.com>
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0253.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::6) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DM4PR03MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: b8014dc9-3350-4c69-eec3-08de7a27af22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	2CAuK6Ta2xQG8FFIkVwmA1OW0T8qcdUgcDjHDkbvX7uoP1f399dDiT6rVReeFdiJv6he3HICQto3/5WjcgbLQTJDp+SiJzSJFAitAWZtRY29EuVFtwtQgbR89U0/SfcDlrwbpVASnw2QgYDWLiJWKf5xIIYlExfZxpCekEhSj+0WRMZzVpdC6eXgKHt7rD9Pz+9Ht78JldWBk5s5cIjlhkKfritxIfVXKZ/8BGTwTJYhrDtoPC2bQD0nGVkueIDu8ld/sWqax5KAU1FmWkb9QD+Dk1+BtZD14LAzptN7LU0H6P4WghuerNwBUvatf1vBQa/Z7yzqJShkz5XifpMor7Lz58JsvuokXf91gbrRMAKlT0wH4nhGDFiHWyI9g5P4Cf52kJ9LoEHNQtrpheo3VrkUwAjFOddm9wavmGhHMvMFwmLPwl5OsAemV1rr3tRv+XeXnV34qzvnnDApW4uTa8y1TCY109PUUvh38ywWuYzz2Bp8k7sb/xF4FUyRPr5tTmDRHURwbrt+PbtvREHF05L+H8imkNNDhXWx264xaK7mEUBYTfyDdUkUJ6uE2BwRMfi9EfIaQw70GaVoqhjPTBOFlEAuk7M62OxNg6opRbMmuLW1Y5YgdElQZEPuKu9vyPlw4bfZ3Z7BMAsZxAk+gE7ZENAtfwo3RhpGV8TNWQYKeMAl3yMTD/wNnxTfwLcX8tdEqacyS0UdSEhA95wuAB24YNuehuL5RbFuNnx6RlU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GB/rLf23iHYAU491efqXTTjy5o7BYoMk2OTog9on5JtU4Gv/8RVpTzNQKajF?=
 =?us-ascii?Q?1d6pAm0i9PWaM4yI4ZOG4bTNXw1OexDUrXAcpsqPqBLU7fVnNzU46HaA1K1e?=
 =?us-ascii?Q?V1C3wj6odnvQ6w4uZmV0JWigUoz6AOq1n813gVmLGNNYryKYTIaB5/hAecj1?=
 =?us-ascii?Q?9k9Z2kk9zsRWjKAUP+iYscC7AF5Q3SkkdXbDprzEuBDT2camFzOilI/Q2kSj?=
 =?us-ascii?Q?bABsewMik4PvsF5oymnP46hZI1R46+8ngVYBrgqys1v8Y/YjMQzP3BbRdeY0?=
 =?us-ascii?Q?5OQJVohnCaD8SpWj9tdrcNfPXBC835CYdJhAXhA9ATYZ3jdZSwjBfYPmaspb?=
 =?us-ascii?Q?2gKR2QB9e1j1BUX+1SD+ZRqvkBWzPUwdy2kagugT93AEmPY27dGcTMXbHoVf?=
 =?us-ascii?Q?RvqmC0NuNv2W882ztxIZ/uRUuoFse87Tm2CyXvqPuehSLG+Qzjw8DU1O4djR?=
 =?us-ascii?Q?x0HGChN4txa9ddbalP2UXyurSV+kXacCyU/IAke+CAtPZBbQGrbtyfg/9nSJ?=
 =?us-ascii?Q?OsuAffG0lqI5r94gDTXdksK55H/4+sJ04csyMGGNLiNOFuFxkmWaC1ckuB3T?=
 =?us-ascii?Q?NNTvXW/XmpIENQveu4ynSrzwBzo1TGTt8aGaQYE4bkikOqQUR7g2K03vpuWG?=
 =?us-ascii?Q?gOrHDmH28CZW5nyAoJGksdFkoouZaqrNCyBt4Tvlf6YwUYF567M0OBTbWyYJ?=
 =?us-ascii?Q?0V4Bk0DqlUcz9GGBTnn3burYNXf16lvell4ncnh2acx9G3P+pnd1FRWXbDgj?=
 =?us-ascii?Q?M7DSVNsCJN4+TVL3L276cGrOfhF37jegWsHxH4iHHhDo5uZpFsVs5SHGxS8X?=
 =?us-ascii?Q?sy2L2iLLkUVLN2htcOpmRFkNFDrP3umNl6I3JcDXdE5+gPBLUH6VyaAat64b?=
 =?us-ascii?Q?Y+JiJRGpU9qKLH+1f8Nsd5oHaByWsVaSV25IezrWgGIEmgvzdjc9UIEQLTRQ?=
 =?us-ascii?Q?a0oQAO2qQKqF1yNnnTS66pIgp+gSX03R1wECn1vEtMn4Qohm309QCZp8dk1i?=
 =?us-ascii?Q?G+LTNqwo5C1DoVk+i0aZOOVORBo8M/RiO07T41+k7wM35qsFs+A++C1G1x3v?=
 =?us-ascii?Q?uDsl69k97t3GmjU3dMY1Qj+OJJxuUMm7vkZV/Xh6PEqEUvhI8t/JXthApEkD?=
 =?us-ascii?Q?BsWTefivYbCJTwiM4xVoWGSJAE4n1h/1PEgePh7XE5XDgkBfHN9H2qTMLsgL?=
 =?us-ascii?Q?+y6XOWvwoDn5+fM2XTOrMLvsjlJxuVhrd1ARnl4sqw65ME9mbVLQPKAJjclZ?=
 =?us-ascii?Q?30vTAVWoJByc9qSZHSEwiU8CL3AayxiY7zgDo8QW2QI2F8USSeUKGwU/ubd8?=
 =?us-ascii?Q?AXZVjHajuRs89YBLRnzQXiBeEBeRbuYzaLX+CyH2fW+Lnx12re+VrSFzTDM7?=
 =?us-ascii?Q?RevQwajg5Xg7es9wKfSHSZa9NENRrQD3QFMP2pfIF/OQvrgBZleaORSMJZF9?=
 =?us-ascii?Q?XWuhpIGABAP9UkmpfrQQZ9Zp0gZRWU4Ufc4HhpMTxbIQ3wAB3r5HPexklLgR?=
 =?us-ascii?Q?btbFYcR5nB+jLD8Jo44cgsHskzHulu5lSU0Jkbe12HJ6LI2dTTeWnqiEdhUt?=
 =?us-ascii?Q?uKYTO7YQpXX6hh30Li7C0QZfPKDzJSG2A4BHoQX5XuscJxeh5+ETSC4zPE3H?=
 =?us-ascii?Q?B5N+sxfiOfpU31KJcodoY1P+oEgkWfego1OMpoIcecVP33REE6aLKVKEHBNS?=
 =?us-ascii?Q?H/g8gxOS64ucS1/YqGiW50HQjj65wNcEZb3+MrzBkOUeZKaAXeX4a8pEMrl3?=
 =?us-ascii?Q?Cez9/GU0JA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8014dc9-3350-4c69-eec3-08de7a27af22
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:53:19.4529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3S66BRmQPtyJSh2XTrtx4MJay7sB+zAsVyT5GJeU3hXvs5IR5NgAilpXyAPylW4jUz3lWpAeZSeFu0gduvrRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6079
X-Rspamd-Queue-Id: F1DF82073BF
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
I couldn't find any information about these Intel family 6 processors:
  model 0x5d: /* SoFIA 3G Granite/ES2.1 */
  model 0x65: /* SoFIA LTE AOSP */
  model 0x6e: /* Cougar Mountain */
Should I add them to intel-family.h?
---
 xen/arch/x86/hvm/hvm.c      |   2 +-
 xen/arch/x86/hvm/svm/svm.c  |   6 +-
 xen/arch/x86/hvm/vmx/vmcs.c |   4 +-
 xen/arch/x86/hvm/vmx/vmx.c  | 278 ++++++++++++++++++------------------
 4 files changed, 144 insertions(+), 146 deletions(-)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57..6ad52e1197 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3850,7 +3850,7 @@ void hvm_ud_intercept(struct cpu_user_regs *regs)
 {
     struct vcpu *cur = current;
     bool should_emulate =
-        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor;
+        cur->domain->arch.cpuid->x86_vendor != boot_cpu_data.vendor;
     struct hvm_emulate_ctxt ctxt;
 
     hvm_emulate_init_once(&ctxt, opt_hvm_fep ? NULL : is_cross_vendor, regs);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738..1320abe392 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -590,7 +590,7 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
     u32 bitmap = vmcb_get_exception_intercepts(vmcb);
 
     if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.vendor) )
         bitmap |= (1U << X86_EXC_UD);
     else
         bitmap &= ~(1U << X86_EXC_UD);
@@ -1057,7 +1057,7 @@ static void svm_guest_osvw_init(struct domain *d)
      * be conservative here and therefore we tell the guest that erratum 298
      * is present (because we really don't know).
      */
-    if ( osvw_length == 0 && boot_cpu_data.x86 == 0x10 )
+    if ( osvw_length == 0 && boot_cpu_data.family == 0x10 )
         svm->osvw.status |= 1;
 
     spin_unlock(&osvw_lock);
@@ -1791,7 +1791,7 @@ static int cf_check svm_msr_read_intercept(
         if ( !rdmsr_safe(msr, msr_content) )
             break;
 
-        if ( boot_cpu_data.x86 == 0xf )
+        if ( boot_cpu_data.family == 0xf )
         {
             /*
              * Win2k8 x64 reads this MSR on revF chips, where it wasn't
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index c2e7f9aed3..d3b1730f1d 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -26,6 +26,7 @@
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vmx/vvmx.h>
 #include <asm/idt.h>
+#include <asm/intel-family.h>
 #include <asm/monitor.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
@@ -2163,8 +2164,7 @@ int __init vmx_vmcs_init(void)
 
     if ( opt_ept_ad < 0 )
         /* Work around Erratum AVR41 on Avoton processors. */
-        opt_ept_ad = !(boot_cpu_data.x86 == 6 &&
-                       boot_cpu_data.x86_model == 0x4d);
+        opt_ept_ad = !(boot_cpu_data.vfm == INTEL_ATOM_SILVERMONT_D);
 
     ret = _vmx_cpu_up(true);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 82c55f49ae..c332d5078d 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -34,6 +34,7 @@
 #include <asm/hvm/vmx/vmcs.h>
 #include <asm/hvm/vmx/vmx.h>
 #include <asm/hvm/vpt.h>
+#include <asm/intel-family.h>
 #include <asm/io.h>
 #include <asm/iocap.h>
 #include <asm/mce.h>
@@ -502,72 +503,75 @@ static const struct lbr_info *__ro_after_init model_specific_lbr;
 
 static const struct lbr_info *__init get_model_specific_lbr(void)
 {
-    switch ( boot_cpu_data.x86 )
+    switch ( boot_cpu_data.vfm )
     {
-    case 6:
-        switch ( boot_cpu_data.x86_model )
-        {
-        /* Core2 Duo */
-        case 0x0f:
-        /* Enhanced Core */
-        case 0x17:
-        /* Xeon 7400 */
-        case 0x1d:
-            return c2_lbr;
-        /* Nehalem */
-        case 0x1a: case 0x1e: case 0x1f: case 0x2e:
-        /* Westmere */
-        case 0x25: case 0x2c: case 0x2f:
-        /* Sandy Bridge */
-        case 0x2a: case 0x2d:
-        /* Ivy Bridge */
-        case 0x3a: case 0x3e:
-        /* Haswell */
-        case 0x3c: case 0x3f: case 0x45: case 0x46:
-        /* Broadwell */
-        case 0x3d: case 0x47: case 0x4f: case 0x56:
-            return nh_lbr;
-        /* Skylake */
-        case 0x4e: case 0x5e:
-        /* Xeon Scalable */
-        case 0x55:
-        /* Cannon Lake */
-        case 0x66:
-        /* Goldmont Plus */
-        case 0x7a:
-        /* Ice Lake */
-        case 0x6a: case 0x6c: case 0x7d: case 0x7e:
-        /* Tiger Lake */
-        case 0x8c: case 0x8d:
-        /* Tremont */
-        case 0x86:
-        /* Kaby Lake */
-        case 0x8e: case 0x9e:
-        /* Comet Lake */
-        case 0xa5: case 0xa6:
-            return sk_lbr;
-        /* Atom */
-        case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:
-            return at_lbr;
-        /* Silvermont */
-        case 0x37: case 0x4a: case 0x4d: case 0x5a: case 0x5d:
-        /* Airmont */
-        case 0x4c:
-            return sm_lbr;
-        /* Goldmont */
-        case 0x5c: case 0x5f:
-            return gm_lbr;
-        }
-        break;
-
-    case 15:
-        switch ( boot_cpu_data.x86_model )
-        {
-        /* Pentium4/Xeon with em64t */
-        case 3: case 4: case 6:
-            return p4_lbr;
-        }
-        break;
+    case INTEL_CORE2_DUNNINGTON:
+    case INTEL_CORE2_MEROM:
+    case INTEL_CORE2_PENRYN:
+        return c2_lbr;
+
+    case INTEL_NEHALEM:
+    case INTEL_NEHALEM_EP:
+    case INTEL_NEHALEM_EX:
+    case INTEL_NEHALEM_G:
+    case INTEL_WESTMERE:
+    case INTEL_WESTMERE_EP:
+    case INTEL_WESTMERE_EX:
+    case INTEL_SANDYBRIDGE:
+    case INTEL_SANDYBRIDGE_X:
+    case INTEL_IVYBRIDGE:
+    case INTEL_IVYBRIDGE_X:
+    case INTEL_HASWELL:
+    case INTEL_HASWELL_G:
+    case INTEL_HASWELL_L:
+    case INTEL_HASWELL_X:
+    case INTEL_BROADWELL:
+    case INTEL_BROADWELL_D:
+    case INTEL_BROADWELL_G:
+    case INTEL_BROADWELL_X:
+        return nh_lbr;
+
+    case INTEL_SKYLAKE:
+    case INTEL_SKYLAKE_L:
+    case INTEL_SKYLAKE_X:
+    case INTEL_CANNONLAKE_L:
+    case INTEL_ATOM_GOLDMONT_PLUS:
+    case INTEL_ICELAKE:
+    case INTEL_ICELAKE_D:
+    case INTEL_ICELAKE_L:
+    case INTEL_ICELAKE_X:
+    case INTEL_TIGERLAKE:
+    case INTEL_TIGERLAKE_L:
+    case INTEL_ATOM_TREMONT_D:
+    case INTEL_KABYLAKE:
+    case INTEL_KABYLAKE_L:
+    case INTEL_COMETLAKE:
+    case INTEL_COMETLAKE_L:
+        return sk_lbr;
+
+    case INTEL_ATOM_BONNELL:
+    case INTEL_ATOM_BONNELL_MID:
+    case INTEL_ATOM_SALTWELL:
+    case INTEL_ATOM_SALTWELL_MID:
+    case INTEL_ATOM_SALTWELL_TABLET:
+        return at_lbr;
+
+    case INTEL_ATOM_SILVERMONT:
+    case INTEL_ATOM_SILVERMONT_MID:
+    case INTEL_ATOM_SILVERMONT_D:
+    case INTEL_ATOM_SILVERMONT_MID2:
+    //case 0x5d: // XXX
+    case INTEL_ATOM_AIRMONT:
+        return sm_lbr;
+
+    case INTEL_ATOM_GOLDMONT:
+    case INTEL_ATOM_GOLDMONT_D:
+        return gm_lbr;
+
+    case INTEL_P4_PRESCOTT:
+    case INTEL_P4_PRESCOTT_2M:
+    case INTEL_P4_CEDARMILL:
+        return p4_lbr;
     }
 
     return NULL;
@@ -804,7 +808,7 @@ static void cf_check vmx_cpuid_policy_changed(struct vcpu *v)
     int rc = 0;
 
     if ( opt_hvm_fep ||
-         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.x86_vendor) )
+         (v->domain->arch.cpuid->x86_vendor != boot_cpu_data.vendor) )
         v->arch.hvm.vmx.exception_bitmap |= (1U << X86_EXC_UD);
     else
         v->arch.hvm.vmx.exception_bitmap &= ~(1U << X86_EXC_UD);
@@ -3073,71 +3077,71 @@ static bool __init has_if_pschange_mc(void)
      * IF_PSCHANGE_MC is only known to affect Intel Family 6 processors at
      * this time.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return false;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.vfm )
     {
         /*
          * Core processors since at least Nehalem are vulnerable.
          */
-    case 0x1f: /* Auburndale / Havendale */
-    case 0x1e: /* Nehalem */
-    case 0x1a: /* Nehalem EP */
-    case 0x2e: /* Nehalem EX */
-    case 0x25: /* Westmere */
-    case 0x2c: /* Westmere EP */
-    case 0x2f: /* Westmere EX */
-    case 0x2a: /* SandyBridge */
-    case 0x2d: /* SandyBridge EP/EX */
-    case 0x3a: /* IvyBridge */
-    case 0x3e: /* IvyBridge EP/EX */
-    case 0x3c: /* Haswell */
-    case 0x3f: /* Haswell EX/EP */
-    case 0x45: /* Haswell D */
-    case 0x46: /* Haswell H */
-    case 0x3d: /* Broadwell */
-    case 0x47: /* Broadwell H */
-    case 0x4f: /* Broadwell EP/EX */
-    case 0x56: /* Broadwell D */
-    case 0x4e: /* Skylake M */
-    case 0x5e: /* Skylake D */
-    case 0x55: /* Skylake-X / Cascade Lake */
-    case 0x7d: /* Ice Lake */
-    case 0x7e: /* Ice Lake */
-    case 0x8e: /* Kaby / Coffee / Whiskey Lake M */
-    case 0x9e: /* Kaby / Coffee / Whiskey Lake D */
-    case 0xa5: /* Comet Lake H/S */
-    case 0xa6: /* Comet Lake U */
+    case INTEL_NEHALEM_G:
+    case INTEL_NEHALEM:
+    case INTEL_NEHALEM_EP:
+    case INTEL_NEHALEM_EX:
+    case INTEL_WESTMERE:
+    case INTEL_WESTMERE_EP:
+    case INTEL_WESTMERE_EX:
+    case INTEL_SANDYBRIDGE:
+    case INTEL_SANDYBRIDGE_X:
+    case INTEL_IVYBRIDGE:
+    case INTEL_IVYBRIDGE_X:
+    case INTEL_HASWELL:
+    case INTEL_HASWELL_X:
+    case INTEL_HASWELL_L:
+    case INTEL_HASWELL_G:
+    case INTEL_BROADWELL:
+    case INTEL_BROADWELL_G:
+    case INTEL_BROADWELL_X:
+    case INTEL_BROADWELL_D:
+    case INTEL_SKYLAKE_L:
+    case INTEL_SKYLAKE:
+    case INTEL_SKYLAKE_X:
+    case INTEL_ICELAKE:
+    case INTEL_ICELAKE_L:
+    case INTEL_KABYLAKE_L:
+    case INTEL_KABYLAKE:
+    case INTEL_COMETLAKE:
+    case INTEL_COMETLAKE_L:
         return true;
 
         /*
          * Atom processors are not vulnerable.
          */
-    case 0x1c: /* Pineview */
-    case 0x26: /* Lincroft */
-    case 0x27: /* Penwell */
-    case 0x35: /* Cloverview */
-    case 0x36: /* Cedarview */
-    case 0x37: /* Baytrail / Valleyview (Silvermont) */
-    case 0x4d: /* Avaton / Rangely (Silvermont) */
-    case 0x4c: /* Cherrytrail / Brasswell */
-    case 0x4a: /* Merrifield */
-    case 0x5a: /* Moorefield */
-    case 0x5c: /* Goldmont */
-    case 0x5d: /* SoFIA 3G Granite/ES2.1 */
-    case 0x65: /* SoFIA LTE AOSP */
-    case 0x5f: /* Denverton */
-    case 0x6e: /* Cougar Mountain */
-    case 0x75: /* Lightning Mountain */
-    case 0x7a: /* Gemini Lake */
-    case 0x86: /* Jacobsville */
+    case INTEL_ATOM_BONNELL:
+    case INTEL_ATOM_BONNELL_MID:
+    case INTEL_ATOM_SALTWELL_MID:
+    case INTEL_ATOM_SALTWELL_TABLET:
+    case INTEL_ATOM_SALTWELL:
+    case INTEL_ATOM_SILVERMONT:
+    case INTEL_ATOM_SILVERMONT_D:
+    case INTEL_ATOM_AIRMONT:
+    case INTEL_ATOM_SILVERMONT_MID:
+    case INTEL_ATOM_SILVERMONT_MID2:
+    case INTEL_ATOM_GOLDMONT:
+    //case 0x5d: /* SoFIA 3G Granite/ES2.1 */ // XXX ???
+    //case 0x65: /* SoFIA LTE AOSP */         // XXX ???
+    case INTEL_ATOM_GOLDMONT_D:
+    //case 0x6e: /* Cougar Mountain */        // XXX ???
+    case INTEL_ATOM_AIRMONT_NP:
+    case INTEL_ATOM_GOLDMONT_PLUS:
+    case INTEL_ATOM_TREMONT_D:
         return false;
 
     default:
         printk("Unrecognised CPU model %#x - assuming vulnerable to IF_PSCHANGE_MC\n",
-               boot_cpu_data.x86_model);
+               boot_cpu_data.model);
         return true;
     }
 }
@@ -3431,23 +3435,20 @@ static void __init lbr_tsx_fixup_check(void)
      * fixed up as well.
      */
     if ( cpu_has_hle || cpu_has_rtm ||
-         boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+         boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.vfm )
     {
-    case 0x3c: /* HSM182, HSD172 - 4th gen Core */
-    case 0x3f: /* HSE117 - Xeon E5 v3 */
-    case 0x45: /* HSM182 - 4th gen Core */
-    case 0x46: /* HSM182, HSD172 - 4th gen Core (GT3) */
-    case 0x3d: /* BDM127 - 5th gen Core */
-    case 0x47: /* BDD117 - 5th gen Core (GT3)
-                  BDW117 - Xeon E3-1200 v4 */
-    case 0x4f: /* BDF85  - Xeon E5-2600 v4
-                  BDH75  - Core-i7 for LGA2011-v3 Socket
-                  BDX88  - Xeon E7-x800 v4 */
-    case 0x56: /* BDE105 - Xeon D-1500 */
+    case INTEL_HASWELL:
+    case INTEL_HASWELL_X:
+    case INTEL_HASWELL_L:
+    case INTEL_HASWELL_G:
+    case INTEL_BROADWELL:
+    case INTEL_BROADWELL_G:
+    case INTEL_BROADWELL_X:
+    case INTEL_BROADWELL_D:
         break;
     default:
         return;
@@ -3476,19 +3477,16 @@ static void __init ler_to_fixup_check(void)
      * that are not equal to bit[47].  Attempting to context switch this value
      * may cause a #GP.  Software should sign extend the MSR.
      */
-    if ( boot_cpu_data.x86_vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.x86 != 6 )
+    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
+         boot_cpu_data.family != 6 )
         return;
 
-    switch ( boot_cpu_data.x86_model )
+    switch ( boot_cpu_data.vfm )
     {
-    case 0x3d: /* BDM131 - 5th gen Core */
-    case 0x47: /* BDD??? - 5th gen Core (H-Processor line)
-                  BDW120 - Xeon E3-1200 v4 */
-    case 0x4f: /* BDF93  - Xeon E5-2600 v4
-                  BDH80  - Core-i7 for LGA2011-v3 Socket
-                  BDX93  - Xeon E7-x800 v4 */
-    case 0x56: /* BDE??? - Xeon D-1500 */
+    case INTEL_BROADWELL:
+    case INTEL_BROADWELL_G:
+    case INTEL_BROADWELL_X:
+    case INTEL_BROADWELL_D:
         ler_to_fixup_needed = true;
         break;
     }
-- 
2.51.1


