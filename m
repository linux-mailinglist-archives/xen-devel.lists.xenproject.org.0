Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOjxAmv6u2nYqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:30:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE02CC044
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:30:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257143.1551616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRw-0008M8-DF; Thu, 19 Mar 2026 13:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257143.1551616; Thu, 19 Mar 2026 13:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRw-0008Iq-7h; Thu, 19 Mar 2026 13:30:08 +0000
Received: by outflank-mailman (input) for mailman id 1257143;
 Thu, 19 Mar 2026 13:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl8P=BT=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3DRu-0005xW-FU
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:30:06 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba7e7215-2397-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 14:30:01 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by SA5PR03MB989126.namprd03.prod.outlook.com (2603:10b6:806:4d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 13:29:56 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 13:29:57 +0000
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
X-Inumbo-ID: ba7e7215-2397-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBnJZqgSnRtO0bdrKgPa18PmnUWS77hc827QAUCsXVApARBzlqa22LbOOngP+nySDaa61FTpEI0x9oo/MRhBSM2Y2j24Ej08bc8fTm7N0O59gZ43f7wu8VTsqt8gGBwnDuJVhhsCUh0NhFwK7u0561F1pZXL/B/54uxES6Q1JZ5K1H+7YPHbp0vDkQ1wmOPe8f3QVPnmt9/mcZmjp9i6jv3Krk9/XVsSGBdAy34Ri/M2OTJz6DqKVTzE7XEynrZ6r5Shufua4tIBRWqjVYZCiU/48H91ihyTku0Mt2mbXRmQazc1YSRdWc9fufuWjKRNMea4lOvBxCQmEdm3lwLySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDL3Fzf65JF8lnT4GldiKUzpA+cDG9coVxidvC84mL8=;
 b=PH9xxObdw1vEakmzeBM9LlUllINs4lEC9zQhADSeeIck2KTScmcU2M1rCB2DwudK8jt0WWDfx2E6iiQNzHpLJ3MxSPvxxnC25SoSXPI20GE4l73A8aI+mXxlhOB1fB4ZkJoHanhpBk6Vp98y/bMpo6GsiEKCf7yntH7KXvNwx5O9Ohqq8xQkg0034XjYGtm5vXFM3t8Oidbn+DJszIQZijZQpjgH724KEnuxGcHzp8Uou0gEwtdgHqMIYE02vaLT1IpckL8AdDGwXcDJxlko881MVMuCd4cujwaW04XjfBkmqHtIm/r89vrMgUOi2KSgqxnsT14LUFO9B0F9ve+DDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDL3Fzf65JF8lnT4GldiKUzpA+cDG9coVxidvC84mL8=;
 b=P3jHAu1rl2Fpjxl0vmqtuwNugMdN8JnFhYKJ8KIboTrHRDWZJuT6q/1orR/AgYqRLyBvRskSsy3wXoeCmR4k9Y5Vu+ZAKWZbCw2MGZKwH3pM7avzRsW77ksVN9tpgzFYcn5VsqFIss3wbgNEYk0dzQ5noLUsQ1lwH6QYFPc4R1w=
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
Subject: [PATCH v1 8/8] x86: Cleanup cr0.TS flag handling
Date: Thu, 19 Mar 2026 13:29:24 +0000
Message-ID: <20260319132924.1469809-9-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0386.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::13) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|SA5PR03MB989126:EE_
X-MS-Office365-Filtering-Correlation-Id: d151aaed-d82d-476c-06b0-08de85bb9cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	K+D7OHr7VF72xv+793Yv9oP+I2jIrVZc459Fc6EpgKidupw4IEEzv6OgSf2+TNzdrQtoPrU+deL6ue7SsHs8L1Yw3+Lmkw/TPuiJEOAFv5bGuGZftthwHd89y+pvEoTHSpmaAkcceahPJK4zj9i6a6cGzCtt3Gyk5y3zIgk8LI14x+9KqJBTUU+o6zwqv5BpWrig490W134fhsrFx1WVc5Zp35Sb16L2uc2+cuuHPs6oHoVc1E+mzqw70v/czLp7ftaKE69/ovcMQnh9dU1uP1CTIiHsXuzFiYkZrEOePE95MFYXr+4LOSWcHm/y1xJAi1l6IPNn8brF9b8bpkYAmy11YqbIiwzPGFV+EnpypN58R3SoKBbONTU8ixcKvPsSqNc3/culPR10BEDiSO5KDevOO4vXscAChRPNQzpy+PVs2Ab1DUFU5w0jagGxG9lIYSr2j90FqJJkHE2lF5vCJyPn0CZyWhZxoySKJuFH8MDz1OeU1bvbOxlZxYDc/pvqu9DBjU6IFV8N+7r63rMAQcAJPqh1XUpb/L9FcCMb7OxlB2Wm6yr+wZpzXilGUi98FrxN3h+d3IhKpw13K7VBOPk6C6yhXuOfz+qfG0KPMBFZ/CJ4MWyyi09DHAJwIWpHbb1vvnryK2hn3MQEv9tnVaxHSy+HwdQu+pM3UYacBgkbA12auc5ejGObM48TK5IBntxT+/WnQbrZiUnFOu45yR9C1Efkqwm7IrxAP6da5xU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ef12OFxVfFFDQ1rOgTFtRAQxj+9czA+xQI1yjj7Bf5iGHS7mvsrP1L6QFgTr?=
 =?us-ascii?Q?cq1Tq5P5AdYG+pHWOYpZPKvxPWNEiF1qSnqLQeB+NkFKVYa/ZSDcgzhZ2+bc?=
 =?us-ascii?Q?Axm8rM29U01ucEF38lq6VVg4/p2jzNfAfn15w79PJn0fZ0KbDl1nXdI6oipM?=
 =?us-ascii?Q?qNGh4LaZegty0AxNTgQfL8T10MOroBCj1uy/gbVfxbuj25vHhyXzM8rEMg4A?=
 =?us-ascii?Q?w4CR6zPnUzVWAc+IiTp6/UbP4ekak3WS8C16O7v95f1eXWd25gRWc+E6aHrY?=
 =?us-ascii?Q?vGc0qFr74yp0XoBDa4yvFMjhmk3D0KF1bwOWbLisCBbrDYprmoFh0oDGlXvZ?=
 =?us-ascii?Q?vclhwiAMMpDhpoMVwxTbt8YMoxhWTU3CVemeYUdpXVxJf/gD59NPoPSbbjCg?=
 =?us-ascii?Q?hVZ4tP0grz507HsnrdBtoyRW8UQ3bsdyyz/dre+AP4eyDgt+Qd2f3zCe5mnJ?=
 =?us-ascii?Q?I5zmHnO4ycVDueIljLfjxzv8KF0frIAQnq75Sxu4AjbqPRRw4MALJoSL7Hfi?=
 =?us-ascii?Q?IB4O+9fWREXuQLMVQPlZgNth1uX5LKuBYhxA/wYF4c7lqU5SNSdrTAHLsuB8?=
 =?us-ascii?Q?0nkBa8G3M9U+ax5iLv4Hqvt48X2anxucDRC1kcF2S2Ls/UG/1q0vCmDIvdV6?=
 =?us-ascii?Q?srGIm7u7nc3EmJrNJTMANlIsUsI3JM0fsj2FDL91lb6yT1bXh/j22ObUMCfk?=
 =?us-ascii?Q?7q+WwvJnpUQmMdgEZgI3ILqjDrVNnY6GzCORwn57nkQKRabWZV8igI8IaMRM?=
 =?us-ascii?Q?/3sAvuhuP7Hf7SfWtrYl6zNitjld8fibinKlDbMfdIeuedSQ2A18nvmoOiLC?=
 =?us-ascii?Q?lJQ9+41dCXHZ26KA3ORmv9mhjq85CQsohQj8GxMb9Ll7JHDFkSwOvYw63GNB?=
 =?us-ascii?Q?jYPgDuphIIqVgV3YOxwKSMHr4iiJ/ZyC69rgnZX0PqQaILfEVe8PuA3sAaGP?=
 =?us-ascii?Q?xOq5HxpTShDuQYEka2Gt7j5F4uqa30HB++F9ukRuNQvtyRmVoxvLherFhtUP?=
 =?us-ascii?Q?KQ6u/HXuZZYVshkSNa+X/PfFPgHL7dqO3JTAy4vUjjT/HysaBavPT9y8e/Oa?=
 =?us-ascii?Q?+O/IZtBiM8Sz3j6K5Gb3CPN0a2qB+ENr7Eg/Ky1BXF0Mwcqe7S1wkCc7qEnF?=
 =?us-ascii?Q?aNniqvPQX8VVRTCY8b+nblhHvaKCBNsMLJ/3WsfvyFn9Qu53oKKiBtf4VSmy?=
 =?us-ascii?Q?WrWDbjyUkRQglFtZVfKf8fTWC7X855OAYtAMHZbPKktb2qEzzLYtB5TOFEcZ?=
 =?us-ascii?Q?Xtu1nX3t5wg732iHpoXQOuek89lCTG1jHrlsXt3lXX0Tq+tOwtby+yVyNBJH?=
 =?us-ascii?Q?iCqwllgOwRWKElOe/itpoflwlIGwaS6pM7zPghGTeyxqeIWD4ap7NDn+dBj9?=
 =?us-ascii?Q?N71exgO+DTicFCvZeA6raTfKH/AjfRNzESH3JHPobGjw4XSU5Veio+g5VKjQ?=
 =?us-ascii?Q?12HpI7+hnAubLyc0PhwXXVjYtcGCgktvgTmxsxrxDm4LtBOzXI875wCnoyEM?=
 =?us-ascii?Q?XTVT10RU36zOVymty0e/qeXkU98XKNl9k0yyBnxim4yOPUAT+MwMIYkpnZ4q?=
 =?us-ascii?Q?6nn5SyiG08+BRPs8S/pQ/fM0R+12hn5te3pyl40QTSJyz0HFMjudTLn8jJ7q?=
 =?us-ascii?Q?s7O4x8fLB+3k2xpON+Z95/ng5dnZLOLJPL8Vd+u/un6xBRYX7zppBFFb/Yrc?=
 =?us-ascii?Q?hDpDw1yYkEjLtqoWZ1+by9zb2Jpz4p6T2MwCxRZdYaART+2ZiEhwZX1KwYe5?=
 =?us-ascii?Q?Wr3+FO0o48SNaxx+mztfrzgYhsM6KOo=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d151aaed-d82d-476c-06b0-08de85bb9cea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:29:57.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTkdREKWE79enoV+NTP1i3SUmX4o2HOOz23zZiwtNAj43ot96hLoPnuNlj4BEAQD+g8tjymC1zbeU1A95b5DqpOUvva2L1AzK8HFsUMpaiU=
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
X-Rspamd-Queue-Id: 82AE02CC044
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With lazy FPU removed, Xen does not need to touch the cr0.TS flag on context
switch except when saving/restoring the FPU for a PV guest.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/cpu/common.c       |  3 ---
 xen/arch/x86/hvm/emulate.c      | 14 ++------------
 xen/arch/x86/i387.c             | 22 +++-------------------
 xen/arch/x86/include/asm/i387.h |  1 -
 xen/common/efi/runtime.c        |  2 +-
 5 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 5d0523a78b52..04a049f01c07 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -883,9 +883,6 @@ void cpu_init(void)
 	/* Install correct page table. */
 	write_ptbase(current);
 
-	/* Ensure FPU gets initialised for each domain. */
-	stts();
-
 	/* Reset debug registers: */
 	write_debugreg(0, 0);
 	write_debugreg(1, 0);
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 48c7320360c7..f3aae158e9f8 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2527,14 +2527,8 @@ static int cf_check hvmemul_get_fpu(
          * Latch current register state so that we can back out changes
          * if needed (namely when a memory write fails after register state
          * has already been updated).
-         * NB: We don't really need the "enable" part of the called function
-         * (->fpu_dirtied set implies CR0.TS clear), but the additional
-         * overhead should be low enough to not warrant introduction of yet
-         * another slightly different function. However, we need to undo the
-         * ->fpu_dirtied clearing the function does as well as the possible
-         * masking of all exceptions by FNSTENV.)
          */
-        save_fpu_enable();
+        vcpu_save_fpu(curr);
         if ( (fpu_ctxt->fcw & 0x3f) != 0x3f )
         {
             uint16_t fcw;
@@ -2572,12 +2566,8 @@ static void cf_check hvmemul_put_fpu(
          * Latch current register state so that we can replace FIP/FDP/FOP
          * (which have values resulting from our own invocation of the FPU
          * instruction during emulation).
-         * NB: See also the comment in hvmemul_get_fpu(); we don't need to
-         * set ->fpu_dirtied here as it is going to be cleared below, and
-         * we also don't need to reload FCW as we're forcing full state to
-         * be reloaded anyway.
          */
-        save_fpu_enable();
+        vcpu_save_fpu(curr);
 
         if ( boot_cpu_has(X86_FEATURE_FDP_EXCP_ONLY) &&
              !(fpu_ctxt->fsw & ~fpu_ctxt->fcw & 0x003f) )
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 9acaaf4673df..336bc83b6e13 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -176,9 +176,6 @@ void vcpu_restore_fpu(struct vcpu *v)
 {
     ASSERT(!is_idle_vcpu(v));
 
-    /* Avoid recursion */
-    clts();
-
     if ( cpu_has_xsave )
         fpu_xrstor(v, XSTATE_ALL);
     else
@@ -193,31 +190,18 @@ void vcpu_restore_fpu(struct vcpu *v)
  * On each context switch, save the necessary FPU info of VCPU being switch 
  * out. It dispatches saving operation based on CPU's capability.
  */
-static bool _vcpu_save_fpu(struct vcpu *v)
+void vcpu_save_fpu(struct vcpu *v)
 {
     ASSERT(!is_idle_vcpu(v));
 
     /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
-    clts();
+    if ( is_pv_vcpu(v) )
+        clts();
 
     if ( cpu_has_xsave )
         fpu_xsave(v);
     else
         fpu_fxsave(v);
-
-    return true;
-}
-
-void vcpu_save_fpu(struct vcpu *v)
-{
-    _vcpu_save_fpu(v);
-    stts();
-}
-
-void save_fpu_enable(void)
-{
-    if ( !_vcpu_save_fpu(current) )
-        clts();
 }
 
 /* Initialize FPU's context save area */
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index fe5e4419b6f4..0717005d31f0 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -29,7 +29,6 @@ struct ix87_env {
 
 void vcpu_restore_fpu(struct vcpu *v);
 void vcpu_save_fpu(struct vcpu *v);
-void save_fpu_enable(void);
 int vcpu_init_fpu(struct vcpu *v);
 void vcpu_destroy_fpu(struct vcpu *v);
 
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 982e42e8f341..0f1cc765ec5e 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -94,7 +94,7 @@ struct efi_rs_state efi_rs_enter(void)
         return state;
 
     state.cr3 = read_cr3();
-    save_fpu_enable();
+    vcpu_save_fpu(current);
     asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );
     asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );
 
-- 
2.53.0


