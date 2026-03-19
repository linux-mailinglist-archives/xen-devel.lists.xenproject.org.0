Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PVKjD1j6u2nYqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:30:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D592CC017
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257122.1551598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRf-0006B2-Kl; Thu, 19 Mar 2026 13:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257122.1551598; Thu, 19 Mar 2026 13:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRf-000692-GW; Thu, 19 Mar 2026 13:29:51 +0000
Received: by outflank-mailman (input) for mailman id 1257122;
 Thu, 19 Mar 2026 13:29:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl8P=BT=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3DRd-0004oN-F8
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:29:49 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2f2930f-2397-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:29:47 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by SA5PR03MB989126.namprd03.prod.outlook.com (2603:10b6:806:4d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 13:29:45 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 13:29:45 +0000
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
X-Inumbo-ID: b2f2930f-2397-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExD+OMXRCvsZguSFISVx2VoyHSRdpClxcaRMulIYjyRZR7x3P99OWvn9cp2IaAR9uPlKFCQF3e6JYkVFWooz3HBQbrRJwc9S8mi+HrZzYsZkTbqTLRavXj1YM3hHztzKimo3U/W5sEe6DsoQGgirN/+voJeS0jlj6NQLtu2MnVC+15JrVEtDz2bBL8BE9n3+s0hYReJH463nMy6t7J6bSluyYOcSjwxIU/SVI67fw4hXSxzWOSeTlit2cqaqSm1gy9TJO/VcjIg/Oumed3lPIIxypaUldBJkMw3foQZcA0S1WL2KfqGK2iQlLu7hWJba1HVDFlZcSRThF4t+G//UIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7cITq8S4SbzEQfFivGFMCvfmxslS6DmBYa6hzW1TBw=;
 b=HOhXpVtU8Jf1vEVxYbivCTOGWvGAQZZjQBAyRrVlqrW4RrYXOEgoDbcn9Zas3IF+e/CchhD3rfIMuB5OcvUsajo9EmMWEAkhYS0vCAyT493PcoHdPJ3hztWnbpTbj6SKt741uq+UXgZwFiAgV+0o0HxzWWFYYhFnp2I2VdXPzONhWg5Vu2lT2S1V4P0Ch1/gvhO5NJuPpAQupnoltoOs3FDGythl5J/x/nx3zPmI/xXExqfZUcJcKBJ3thkZYKfsVQs2SmRis4SkVihWD9cdHcU9+qoTrLIUamPKVSiK04bqO8vAvGwwrqpHmCHCiEXItNYmGMdEIDYpTJ3An8q0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7cITq8S4SbzEQfFivGFMCvfmxslS6DmBYa6hzW1TBw=;
 b=H4Jtu5/tSZbu9IMX1uC53tiyYT0EvnmuS4CwB8PPd2qQ3ljFLCbFMYYvGyjrqsThkBNXK8mo9oJcRUFBzMfvCvy2jGEk9X/yUhEa6XsnjYep4pgX4Kgiuvt4TNtdSgoAGEnMBTZN/6bWxfZwB+tBP1oZcaYI6x/UjBJG1hOtrBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v1 5/8] x86: Remove fully_eager_fpu
Date: Thu, 19 Mar 2026 13:29:21 +0000
Message-ID: <20260319132924.1469809-6-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0494.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::13) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|SA5PR03MB989126:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6808b9-8a3a-4e6e-79e6-08de85bb9618
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7Jk04xFgYjszEZVIDtFHs2cmUlo3r3ALY3aqBq4y6jcMUhrCOU8hMTlNpQffq5hG+nCN3xdN3isircb+wyKiLUb89Y7CClwOOEpUEgsA/ZAPEHki2JKUxugY/cMUq3MbjOtaDthOHdB4tN+p/KUKpqUIB3oXygV8rs1mV8stqilFIg6A9km2AsdY1pIc4FR98DIqjQGYCdOB4W8meu+b0TX1I12zyGt1vvarxSNM9JeLzVo8ZtlGeyhLC9EhEaNJBuaT/HyFij3cyVIWt0CHMUvVrJcfQcb5rtEQZkJy2K8Oh4oDSC02zeyPFe8HLV89/OK1rIEe5dLRtyFHxvIFcofD954UsQ4xKxFL4qLxfGruMMUlxV3Q3WoBcStrDEwvO1PXENIyarsi5WCLZIVPAg1pcsgLoy3HCZN8eVUcTz5LalDm1yhpQ8GqBZm3afjw8we9fr83qv5byvLwcrB0ronpYCPC/KyME76j1zzYruFkd2B3XX2rEzNb47ORm23krFyHPn5a+4O+swDOf7NUNVnXudV2HO2819YUIvej38kWMhSedIMbY8FHUsl+EudVlBJ8Y1ev6z4dKpCT5VAwJgEiR0ACoHdHKWV+TZ/ml4tCDtyAkXtg+mB8wTYZE0pLwFgqUrkDlRQCODT9VnA3XBYorrikte7ajcr3E7qyrY9TIG1KZpEfP1W6icK5MCv1wbygqPMsJszh711c183SQ1euTnQyuhkXfGj5nSbeSPM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d4cq1yecXGPMg8X+4c2mQcTUeVubIGrdcdNODUP9qEBAW3qKziL6MO1ouc41?=
 =?us-ascii?Q?WYjFTNyXFd+GCv94lDwVW4HNwL/2v1jDvOJY6KAy9ImcIC0aJG/eDqEak/0O?=
 =?us-ascii?Q?e9yA1D9ryKfIgQPpMFg9bALCSfxOWg7CO9oI9w2Z8S6+yQYa328qGKL02FWR?=
 =?us-ascii?Q?HZbofEpIO4u1H6fUJspRswac6NeViJHGTQVyqLbTFR+so3xHUpzQQqWj95th?=
 =?us-ascii?Q?tGk9QRAZUdwBGNx8gDH064m2Nm/CUp7ExFIwLSTSN2/nN1Ksrz3BfcfYEDMz?=
 =?us-ascii?Q?zWrGpExBZW/W5tlaJ3oRYdRI/CiZ4uhn51GkIDouyqh966ELkflg48gGUaQp?=
 =?us-ascii?Q?dlVY0pwHJMbrXn3Y6apPY8Q4V2aa6ShsAOP9R/xboenh117cXbMWimyn2gZY?=
 =?us-ascii?Q?Sz+MA3xPIoaGbZItqea9wuRwW8iyEuQgsl66AmanoO38h01T0h27XbLRd2ra?=
 =?us-ascii?Q?o7xQNyQVW1HfDOneD8RzyMRdguhkz7JpV9sz/6aYCVwDkd6oBewu0yJNy6Is?=
 =?us-ascii?Q?HaPQdI5RxcGUX+h9Rw1DrFH6upAEtdr6GVtgqaIMNrIoI1/veZey4aqRZvOH?=
 =?us-ascii?Q?RKRt+SgG034ovg8zPlRCsx6PL8U/VMoP3IOzYV2w66W907+uf72bgoqAxhLA?=
 =?us-ascii?Q?TnstaNp5EHXigqRLy2s6Zg8Hg6mvxjr0JDDYCgXgMy52b4koiDY+S4hGgLjs?=
 =?us-ascii?Q?EHnBlo4k7bEqLjIVQ6hm3nsRCxYMcW5n1mwtxR/VhctzGSW6hJ2vuMGRKpsw?=
 =?us-ascii?Q?xNnJMw2LI5UfPKpengDNWp3zpDhbd3hIFmxcXvQ42BWEVLSH9KXLZJ6N6TR5?=
 =?us-ascii?Q?1a7HI3OCEzD8N0y6d++fIpoWE5gT43681rCx/IvYYtr1ZELTOA46o7568uZz?=
 =?us-ascii?Q?9xw7VDBJXH7Km9g0S5cPodFxqZSekDiLg3KQOve+PgRdN3whe06VCokKe3QN?=
 =?us-ascii?Q?OUZ7/THcfsDJGN/GbYWDGpF1Jz57KNTOZCHJN+o0Hcionr6e/iR2hZZfvXqo?=
 =?us-ascii?Q?Zj6YOuHTu//44VEqdc94JXyHSdiHx6GqxfhenX3N+9HAfWD/hYM6xlI/T0oi?=
 =?us-ascii?Q?2cdWrA51jyfQLcUFYWPTANomgPz5mU4A8znn2v1xAePtha+HvM1s9NvoDqu7?=
 =?us-ascii?Q?5bIG82IjpAaBLNIl5aPj9ikSX7mX0+hyKzH+sFcXUJuKQMZpsedNKUvvubNF?=
 =?us-ascii?Q?IBL4fULcPOXkg7o5UJYO5snZhouBtgdM/qm9mZjMI3kulVaHzqJYvz5YTbc5?=
 =?us-ascii?Q?hMnAc0yiTJrV/Nc2YFDGJhdpnETE9/Yn/JUmuvEqOVoJn4xYqfD4bWwuUBHB?=
 =?us-ascii?Q?NhHdnv6FqfybIDEHFGQlrWIKCBBShgR62axryLvbwpElnQMNLDkYnJQdYA7d?=
 =?us-ascii?Q?6hVF8WeMjurl+EVb6VQNerqg9VXW7f1O/zHCjiqBTYl3bF8tCYzML6M3BKap?=
 =?us-ascii?Q?rB+LhlLutb2tWunscOJU5+x0+n3S0RJ7+EqAaoEJefJYiHsW9jsLgKKnpmaJ?=
 =?us-ascii?Q?1rg/HgxMgJUEPG+d7atVbvkp6QsTcn1ih9bnKTdC8L2d+KVe9y9i8Lx3XhQg?=
 =?us-ascii?Q?3bVVE+E5zVG/3A0Y5jwZgaVkZbECfVDA4bbQCTaSZS6TOGdSa8U06S1IRzCY?=
 =?us-ascii?Q?MRTYpZ1nWkZoDyexm4jiF9ZO/pxeEQlPXEY9EP8h8aWtgXZdNFA+3SsT/sAA?=
 =?us-ascii?Q?KK40rrIiDcv4Crycf6tx0f1W48r/tRzSP0bMDpCkWBhNTs6H0sYf+Xc5x9Nu?=
 =?us-ascii?Q?54OLPsjUoMXvRCYaw36PETGzKwz1G5M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6808b9-8a3a-4e6e-79e6-08de85bb9618
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:29:45.7544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txuoZf9Aril+4VuINNKll+Y/P6NjvCL/QWhglpl/CUSpC9Q/EOZXE4wJueSy2HeClDIMohpIGdlxnLEKUdRwAG9w+D9zwo+MwbSeaCzqFX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989126
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C6D592CC017
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Since fully_eager_fpu is always true, remove it and adjust the code
accordingly. At the same time, rename vcpu_restore_fpu_nonlazy since it
always does the full restore.

No functional change intended.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/domain.c              |  2 +-
 xen/arch/x86/hvm/emulate.c         | 18 +--------------
 xen/arch/x86/i387.c                | 35 ++++++++----------------------
 xen/arch/x86/include/asm/domain.h  |  3 ---
 xen/arch/x86/include/asm/hvm/hvm.h |  2 --
 xen/arch/x86/include/asm/i387.h    |  2 +-
 xen/common/efi/runtime.c           |  2 +-
 7 files changed, 13 insertions(+), 51 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 4664264b2f5d..a68b7a583294 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2125,7 +2125,7 @@ static void __context_switch(void)
             if ( cpu_has_xsaves && is_hvm_vcpu(n) )
                 set_msr_xss(n->arch.msrs->xss.raw);
         }
-        vcpu_restore_fpu_nonlazy(n, false);
+        vcpu_restore_fpu(n);
         nd->arch.ctxt_switch->to(n);
     }
 
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 86b1f7535668..2daea084f15c 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2630,23 +2630,7 @@ static void cf_check hvmemul_put_fpu(
     }
 
     if ( backout == X86EMUL_FPU_fpu )
-    {
-        /*
-         * To back out changes to the register file
-         * - in fully eager mode, restore original state immediately,
-         * - in lazy mode, simply adjust state such that upon next FPU insn
-         *   use by the guest we'll reload the state saved (or freshly loaded)
-         *   by hvmemul_get_fpu().
-         */
-        if ( curr->arch.fully_eager_fpu )
-            vcpu_restore_fpu_nonlazy(curr, false);
-        else
-        {
-            curr->fpu_dirtied = false;
-            stts();
-            alternative_vcall(hvm_funcs.fpu_leave, curr);
-        }
-    }
+        vcpu_restore_fpu(curr);
 }
 
 static int cf_check hvmemul_tlb_op(
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 7da731865f73..88018397b1ad 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -194,12 +194,8 @@ static inline void fpu_fxsave(struct vcpu *v)
 /*       VCPU FPU Functions    */
 /*******************************/
 /* Restore FPU state whenever VCPU is schduled in. */
-void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
+void vcpu_restore_fpu(struct vcpu *v)
 {
-    /* Restore nonlazy extended state (i.e. parts not tracked by CR0.TS). */
-    if ( !v->arch.fully_eager_fpu && !v->arch.nonlazy_xstate_used )
-        goto maybe_stts;
-
     ASSERT(!is_idle_vcpu(v));
 
     /* Avoid recursion */
@@ -210,27 +206,16 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
      * above) we also need to restore full state, to prevent subsequently
      * saving state belonging to another vCPU.
      */
-    if ( v->arch.fully_eager_fpu || xstate_all(v) )
-    {
-        if ( cpu_has_xsave )
-            fpu_xrstor(v, XSTATE_ALL);
-        else
-            fpu_fxrstor(v);
-
-        v->fpu_initialised = 1;
-        v->fpu_dirtied = 1;
-
-        /* Xen doesn't need TS set, but the guest might. */
-        need_stts = is_pv_vcpu(v) && (v->arch.pv.ctrlreg[0] & X86_CR0_TS);
-    }
+    if ( cpu_has_xsave )
+        fpu_xrstor(v, XSTATE_ALL);
     else
-    {
-        fpu_xrstor(v, XSTATE_NONLAZY);
-        need_stts = true;
-    }
+        fpu_fxrstor(v);
 
- maybe_stts:
-    if ( need_stts )
+    v->fpu_initialised = 1;
+    v->fpu_dirtied = 1;
+
+    /* Xen doesn't need TS set, but the guest might. */
+    if ( is_pv_vcpu(v) && (v->arch.pv.ctrlreg[0] & X86_CR0_TS) )
         stts();
 }
 
@@ -273,8 +258,6 @@ void save_fpu_enable(void)
 /* Initialize FPU's context save area */
 int vcpu_init_fpu(struct vcpu *v)
 {
-    v->arch.fully_eager_fpu = true;
-
     return xstate_alloc_save_area(v);
 }
 
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index ad7f6adb2cb9..bd7b02085ef8 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -671,9 +671,6 @@ struct arch_vcpu
      * and thus should be saved/restored. */
     bool nonlazy_xstate_used;
 
-    /* Restore all FPU state (lazy and non-lazy state) on context switch? */
-    bool fully_eager_fpu;
-
     struct vmce vmce;
 
     struct paging_vcpu paging;
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 7d9774df59fe..a9425c8cffe8 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -160,8 +160,6 @@ struct hvm_function_table {
 
     void (*cpuid_policy_changed)(struct vcpu *v);
 
-    void (*fpu_leave)(struct vcpu *v);
-
     int  (*get_guest_pat)(struct vcpu *v, uint64_t *gpat);
     int  (*set_guest_pat)(struct vcpu *v, uint64_t gpat);
 
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index da0c7e945f95..fe5e4419b6f4 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -27,7 +27,7 @@ struct ix87_env {
     uint16_t fds, _res6;
 };
 
-void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts);
+void vcpu_restore_fpu(struct vcpu *v);
 void vcpu_save_fpu(struct vcpu *v);
 void save_fpu_enable(void);
 int vcpu_init_fpu(struct vcpu *v);
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index ba27c62132d2..982e42e8f341 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -157,7 +157,7 @@ void efi_rs_leave(struct efi_rs_state *state)
     irq_exit();
     efi_rs_on_cpu = NR_CPUS;
     spin_unlock(&efi_rs_lock);
-    vcpu_restore_fpu_nonlazy(curr, true);
+    vcpu_restore_fpu(curr);
 }
 
 bool efi_rs_using_pgtables(void)
-- 
2.53.0


