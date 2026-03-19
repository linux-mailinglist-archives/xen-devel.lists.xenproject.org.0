Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFbnL1X6u2mzqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6973E2CC00F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:29:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257121.1551589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRe-0005vC-7z; Thu, 19 Mar 2026 13:29:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257121.1551589; Thu, 19 Mar 2026 13:29:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRe-0005tD-3l; Thu, 19 Mar 2026 13:29:50 +0000
Received: by outflank-mailman (input) for mailman id 1257121;
 Thu, 19 Mar 2026 13:29:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl8P=BT=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3DRc-0004oN-Ep
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:29:48 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1c9c9a4-2397-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:29:46 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by SA5PR03MB989126.namprd03.prod.outlook.com (2603:10b6:806:4d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 13:29:42 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 13:29:42 +0000
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
X-Inumbo-ID: b1c9c9a4-2397-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwRf3gmv76rdVLHpa0GIDyEnYtyc10wzUaRbgJQMrIaIBFC+A4nxbRWBo0GLkDYVavBviU5OHM4n2ijFn17C69BtsB/bC6TCnY2j1tvOgjquywXfeKaXlWU2pMGJj3f57aSxq1GJ/Z0Dw/4HKwbYyC6V2g4YiAVfVTuYge2p76oJHXRTKYwRLoEZylv21v+Kmi3hPmEFcxOFYN2qLUhLh1Zw2l6h53pU9CfZPsKq4aiFtSEm6zNGF0P6ExiQEllu9P6q2BsgyF7VIx5vIsRc9d1K+J8f0IQ7rIGAClRQ5n4lWKWF4yAwd6Fh2exDNKmmswxxu04DTHKLupOHFN+AxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YfnAkxzcQ0xAkcNwPMSQuPca6ipQMOuXmrZeqRZo4U=;
 b=SC1Q/g2tdKwK9fBk9Y4k0W2qJ/+f64DFlFy/iChzKGvGfErnLRZHffv1tWkRivFpsQEwiTPCA85tRn+NNzgR0UMunurIzut4lSM5F1aguvFkK1FxMxcAiDWrldXBFwIErNjfe0mSsnSAa/y7V3a65pRoxOuYuncr67iveWap9vPHWkJ7oKZzMjRGtWG4Ooqs61k9Sm2tmwxxUWgAIH5oGVpFXgX+QHRSeuE9rpjTFMLFI7h8JLhBKCLULuieX639qjqdQaCwYaB0SQ0S0UdY2R+XBKCxkBRWo4iE0le8DIgomF6nLhGTY2/H8G9Q81eON7D8xh5Ji4Bb9NnX4NVLYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YfnAkxzcQ0xAkcNwPMSQuPca6ipQMOuXmrZeqRZo4U=;
 b=OufuCu5jCXq9rCLQRHCM7SVwrOwU3h+eNy4CjrvpJgMSHAgcfKNTNA2jNVgbyDObTmoKF3rQgQptsKLXNik6/i8oYqG16LeAzyDh5pu4rbWHo/1rMA2z1rOzOiY/O94aRJGUHKuQ1PTSNpPby9595A5aiMmXI+pvGwHrA3ZzRNE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v1 4/8] x86/traps: Remove lazy FPU support
Date: Thu, 19 Mar 2026 13:29:20 +0000
Message-ID: <20260319132924.1469809-5-ross.lagerwall@citrix.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4520b830-22bd-43a4-b853-08de85bb942a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	b5Gj8vIGpIoMXqJp4RR9DdeWW/LVVZpqJSo1jinLK+f3r9UFIBO8dwNA3YKnF6gHqGuQ72Xm2wRbhpnd8PhFbAKvDndougL9YQ4xwFfEPm8CQqsJ8vvMolxxTCDqu2wmOuRRASJBl6GqvthRSUe+IFCw6ZJj6/zqqSwdM/HkxIJWgWCCVAVdJwsNUeXBVTFSHEvdG/hCaMwubrDQJilyTDHK9JNa4jdOOIgaVgRjpHFaCk0frN25xEqQBimdS7nBRB3nktek5pk4rxn6gjC0GU+9Iv5CSeYDBStzpfmMnuL8ndL6ASsCD+V7WvPVDjEKWiwI3r8FT1kdjiNXqlcfOWcsm4BIRIs2JMQuAooaxYRs7GuhdrJw0CirFDnJDocYVIcJ+VlWR4/m7oG7u9U45kRdVR2cH380Y+XuTEXH3nBaHwFJpcev2P99nS1g4wfDydSp9oYVkXaAP9RDt5olSPsJ+W6Myg6kc23TmSzlBvv+v3ZprxqzlVZuIoC3ERXko3Z/I4aFa1ILYb/WeIAVrFwEip8kM5Mytu0p2BiSrun6dBz2GHn05xZ8plwFD5Hrf7+yliFZzeM2iFCs8K9tcV/lCwsxHcm9yC121vXXJkkyYiJ23zdWlzqXuNNEZJlyiXC1ZfNITa421964eaifyjng/uPxZOgS0GEdatuXowB1Kq1E9B6jmotVi9QR804T1hr+FO6YfncUg1FCCO8quoBGK/LZbSZRpLD6Vpe29U4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nhVsvC44KngzlTcjqHrT+99Cf3G60h9FhnNswlExRvUZBtzFLd8aCTdhvrAF?=
 =?us-ascii?Q?DQumn5B1JGFB8elFtxUQR1zNORrvADoOyhdEnegXVZhXKepJ4F4KKZFN9So0?=
 =?us-ascii?Q?Qmk3zaDiTFF9BY9tV7/XY0aU1wN2pvTZTwy7BmlZ9/TdDmIoV1rvShZesCff?=
 =?us-ascii?Q?io3n+LBFpvxA/h/O5Vl+2SisjdFi07hnSIF6nxFA/5+J6u2uEUuBdk+KR+dA?=
 =?us-ascii?Q?tjISGa4nferibHkFTNJebd28RRPXRJrA9DoTUEnO7FXjLTn3k8oM+At0qYYK?=
 =?us-ascii?Q?LeP9DdXNjKzV83NKYuA846DHVeX8D6gW3fulE80Nd9mFwbZSwQ0+/LuwCLxp?=
 =?us-ascii?Q?O6ZtnKg8gU2JaU+VAt8YX5CxISkL2/dJzKaD9DTTys38A7qlaj0TdzT08L0D?=
 =?us-ascii?Q?WzS+NGpCX+UcNwhW8RAWzylCtG0Yfwq+OGZagFPKlAwXrYMqra5EvrsssEG+?=
 =?us-ascii?Q?eW6SqyAt8bUdU9H9cPj2QWKqwNI2Zr2MdIpGUu0eCVoRkw0wRwxHdbU99GtQ?=
 =?us-ascii?Q?hqakUoLOvRdvza3lcsaoPdPFu9Pv7NZnZXtHNH92QCD41NFLLh8LqY790EF0?=
 =?us-ascii?Q?zRdMjs0FQmV6J5pSmR0Q/alM0jQtykZKhkKVBzMG9yAkLh+yleHLijFUEBiM?=
 =?us-ascii?Q?Uk6UGj5uUsmeoN+ILB1dLfk3mRf+xiqgnwt6jkbC/Asb/3u4vqNgIHo/R2J5?=
 =?us-ascii?Q?K1THPRTsznhIX2A6h+k2oefROYDJKDgP5ofZqwMHeTdwh89wxKMmd3dCX+oW?=
 =?us-ascii?Q?sWCY4e9f4edecFDPRN7Uee+Rq06sNnjE5UHeC+7go46Xt+1EoZqCAZ27lFBd?=
 =?us-ascii?Q?AIV6TORnL7jV0Z+3bn/gazwQcG3JcbJYWij2mcoiyqlLTInzMfHZL+XEng5t?=
 =?us-ascii?Q?4Z+JWpKp03cXdcWjdiyizszKAXKI40D2NFkEsUBYJINnGHkFW8x+T/w+Zax2?=
 =?us-ascii?Q?zNoRLsd0+sqjX7q9PlR6RgKj8fzr+dXdDL5nLJzhGKhQWWg3+EcvDczyRbZT?=
 =?us-ascii?Q?WgWMqPRI/8nLnlv/H+MPgu7qEv9h6FmmBGBGcG6Bdf1Jpu3+GY9aT0ZM4zuM?=
 =?us-ascii?Q?wGBMsGuRCmgkW13+/zivy4SHtKLknU8lJUMJOmAsNMUde8iXjA/j6aHgXrZ5?=
 =?us-ascii?Q?p9CJrNU9m3oGOE9KhWaw1FjYSL+qv/Oh9rRzEg6OiMN9rY3F7Touk8iJEAct?=
 =?us-ascii?Q?RXF9Q9z8Q8it+ruA2hefl7oogvHCDzIgGEJaJc0xnle4X4vDj0135cou/NvC?=
 =?us-ascii?Q?9litSRaYRgQmFkCSWGfVk26NPGrSiTzrHbgoSDIZjlIz5UjsEaQUqQGag/PI?=
 =?us-ascii?Q?Ood9Y/anAkuYXay6sJefJVJ/VddJYwLnkAno6AhUWKsOHKx6IDoPKiwd/k6v?=
 =?us-ascii?Q?23ERrjwJMU/i0PFZAVu1ByM7zB/T1P3gfEAyvvPi5u5m6QO2IVG7C4xCus/x?=
 =?us-ascii?Q?AfNrSYuyTjiaN9B2PFe+30kQvQxezGc1ojBC5Oeg70wjyep36yTu+QkREI50?=
 =?us-ascii?Q?MZVagIH1oMPsU1BQB0p03OVkJ9lVXONOrzSIgnDKlMV8fsQm/f/OmCE/lqqC?=
 =?us-ascii?Q?sAnrEJXZOzR5bmEbWq+rbyPniN8RCnAWxQOkZVSm5GVFzcITL5Eld4OYaWgF?=
 =?us-ascii?Q?TnWQl13KVyE+zSdFk2D6qt66m2oCMpadPMbuejjQWsoqNkr9LXb1YPnXpNH9?=
 =?us-ascii?Q?KEs4GLOzD2QfrIUQGxtnBjThjqF5eE5BYM/wN5i2j3cnhfgiL5u3SKBQBipU?=
 =?us-ascii?Q?H27onJxm3FTldw/na1vt5FFPQjv1oWc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4520b830-22bd-43a4-b853-08de85bb942a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:29:42.7179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3lGzq/pau+W9wGQ65S8GjPRosaJSN2j/Kvvp55Wpag8TPmTGJ67WqfKtlNOgP5WujEPVIMRoNqhSGMqwGzKVmFcSKCnlHafy9PdrscPW7Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989126
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6973E2CC00F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Wei Liu <wei.liu2@citrix.com>

Remove lazy FPU support from the #DNA exception handler used by PV
guests since fully_eager_fpu is now always true.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Wei Liu <wei.liu2@citrix.com>
---
 xen/arch/x86/i387.c               | 24 ------------------------
 xen/arch/x86/include/asm/i387.h   |  1 -
 xen/arch/x86/pv/misc-hypercalls.c |  3 +--
 xen/arch/x86/traps.c              | 18 ++++++++++--------
 4 files changed, 11 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 954ba3b1799b..7da731865f73 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -234,30 +234,6 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
         stts();
 }
 
-/* 
- * Restore FPU state when #NM is triggered.
- */
-void vcpu_restore_fpu_lazy(struct vcpu *v)
-{
-    ASSERT(!is_idle_vcpu(v));
-
-    /* Avoid recursion. */
-    clts();
-
-    if ( v->fpu_dirtied )
-        return;
-
-    ASSERT(!v->arch.fully_eager_fpu);
-
-    if ( cpu_has_xsave )
-        fpu_xrstor(v, XSTATE_LAZY);
-    else
-        fpu_fxrstor(v);
-
-    v->fpu_initialised = 1;
-    v->fpu_dirtied = 1;
-}
-
 /* 
  * On each context switch, save the necessary FPU info of VCPU being switch 
  * out. It dispatches saving operation based on CPU's capability.
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index 652d7ad2deb6..da0c7e945f95 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -28,7 +28,6 @@ struct ix87_env {
 };
 
 void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts);
-void vcpu_restore_fpu_lazy(struct vcpu *v);
 void vcpu_save_fpu(struct vcpu *v);
 void save_fpu_enable(void);
 int vcpu_init_fpu(struct vcpu *v);
diff --git a/xen/arch/x86/pv/misc-hypercalls.c b/xen/arch/x86/pv/misc-hypercalls.c
index 7e915d86b724..34a0717540a9 100644
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -42,8 +42,7 @@ long do_fpu_taskswitch(int set)
     else
     {
         v->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
-        if ( v->fpu_dirtied )
-            clts();
+        clts();
     }
 
     return 0;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index b6b119769722..fb1b94245850 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -2045,15 +2045,17 @@ void asmlinkage do_device_not_available(struct cpu_user_regs *regs)
     }
 
 #ifdef CONFIG_PV
-    vcpu_restore_fpu_lazy(curr);
+    BUG_ON(!(curr->arch.pv.ctrlreg[0] & X86_CR0_TS));
 
-    if ( curr->arch.pv.ctrlreg[0] & X86_CR0_TS )
-    {
-        pv_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
-        curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
-    }
-    else
-        TRACE_TIME(TRC_PV_MATH_STATE_RESTORE);
+    /*
+     * PV ABI QUIRK: Classic Xen kernels (2.6.18 and SLES 11 SP4's
+     * 3.0) rely on Xen to clear TS. PVOPS kernels (3.0, 3.16 and 4.15
+     * are checked) always clear TS themselves.
+     */
+    clts();
+
+    pv_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
+    curr->arch.pv.ctrlreg[0] &= ~X86_CR0_TS;
 #else
     ASSERT_UNREACHABLE();
 #endif
-- 
2.53.0


