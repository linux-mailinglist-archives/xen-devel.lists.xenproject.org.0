Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEXoN9bipWkvHgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 20:19:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF3D1DEC8E
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 20:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244524.1543973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx8mr-0005Jt-E8; Mon, 02 Mar 2026 19:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244524.1543973; Mon, 02 Mar 2026 19:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx8mr-0005Gs-8L; Mon, 02 Mar 2026 19:18:37 +0000
Received: by outflank-mailman (input) for mailman id 1244524;
 Mon, 02 Mar 2026 19:18:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vHUS=BC=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vx8mp-0005Gm-U5
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 19:18:36 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b128558-166c-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 20:18:34 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SA1PR03MB7032.namprd03.prod.outlook.com (2603:10b6:806:331::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Mon, 2 Mar
 2026 19:18:29 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 19:18:28 +0000
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
X-Inumbo-ID: 9b128558-166c-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRxj3OWcVp167CrvWLrOkbh1urCYOkHtCGMT7NL6SmsYPvGeKsbHe6skXXdFYgtvZBO50/lgjN03hbbjy0WpQ2Y7enitoctnxu7veTvXoK8DRfuERuSNMpWvx7uKwjuiTsQCTK9F+/QRxzlBsod5cXrULv8YlTygsMkDOW3p6uSM0Ila9pO7fog7cZuDjD6WOZK4FDQWIxpYBiwc9YKyUmCUelfjOi5GELjLqO3FW3w3fshYSAh7yuSNfxgB2X3+d98ZvgqcnbuF2RdrlxPPCjYexfxkbxMzCuXLRUy5vTohs/8rdROZxR/yqaHUibD4B3BSyLg99gRCaypHSzW9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCPhyc8uZGTS+6RkMDRkq18hqcIIjgjPFEAxZTbMplM=;
 b=StCtAzpLnMibWQmsrnr6WCAQDpzGcE95jJH4gc3Ti+7AEBZlgLBDy87mEfqJuUPs1fn38L15z7ERp1QDBObLue4kqjLWCZFO7yKms2eX3KYp35I6Yp6zpmGWRYwAe1Bki4EzLqta2cG/swPCUyIc+QdNOk22yAgF4Zq7tZ1pcP6Hw1dOnr2Z+EY9N3pD7efFgNWJe6/kRJosxOXWQrBFRXgz/a1x0fTd3zHcWlNSY3VYRT5q7kMvVh/unCIHLyHiuBcAxb1m4Wrd1sxL8wrmVGoloUR8RTJyATW/NyjdFKJve3CJuWXVL+FJ2BVVqrgj6Lrko7IUcDV5r2df69Bzgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCPhyc8uZGTS+6RkMDRkq18hqcIIjgjPFEAxZTbMplM=;
 b=OFb6wRkLyEgJX0VM+WAwqv3FU610h6z8T1QONpBZiDZPFNPLvxRQUp9w1aMM4RQj9LUYBAnWTu+IAHJdVR5ol77MukD4ijr8RrpnZJjpL/dCXisj4M+Kj9zFMhthOVLRmGMF7yfcf5zyj2xYRbmi14u4jRd81tk7J4X/rC4FHrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH] x86: Remove x86 prefixed names from mcheck code
Date: Mon,  2 Mar 2026 19:19:00 +0000
Message-ID: <20260302191900.672460-1-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0134.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::13) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SA1PR03MB7032:EE_
X-MS-Office365-Filtering-Correlation-Id: 2115c1ea-82ac-49f9-7993-08de78907c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	Ys7qrlY8M5N4bR9ZlicQWui/CePe3dyMM1BquGicMBT4Ixws7mGIH+jJQBOCcP82u94GGpCwf+ETNysZNmSbkH27VmM77ybnXoMSgpqs6qc219/ZcLeW0V7PMlH+nfGtDkrAN5e/ysfDg2SjOgRoI3uu6mykFKgBz14g8otOqpCMlGDVHaVdhJJqcsbuMisGkSMdsOH/S9bxbsLYtj7WAbjflhHB0O0dCP01bdHw3v69/aQrF9OoL8kPB/HevGbRX7PZGJeG/+LrVuC7vkbgBqqMjOnxqfzuyAIA+Vp+5YpmWDuXaswLFboIotiSt7eXKwEbUtM6PRfDZLgnXXSZ6qbTd1PreoiZTqXp9OGyIZ20Y86YX8bFFRVqE8BJrs7fHV5d7ipbZG7gvCZG4Buh5NCeyYxr89Z5XlcPM0nyffMtBwXY8FCBPL4Ol2d6t1mIpeHTCh6QBjFzCldWGVRlNmemfn7zcWHNT2CuBgbv+fQdNjYFjzb9XSgjtnLO23pajpDTK0MjRQGfuNiWjqFO8oMrJQpB9t9Wnjdavc/b4Xn1BtexazLJ0yDhudP8s9kjUIPadvXFijGTdUbXpaxptQYHzDrQZfiSrK3cUDMU3PWyJG+BgVKh7KYxa/ABPEv1FHM1fc4PlRSL5tOpul6eb8CEtNeyMOEeVRnhOKC71CglqjxKJ6QPxxDavLtKnZPNAEO4pvJD0LcZT5q1jVOWKuMCt3zM4ad7687Q+j3M+DY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rtBIzNxURKjXDzw3zt0fKebM+RSVmVUYQuH/pYaro5Ka5XRKAdFwVEvp0RHS?=
 =?us-ascii?Q?ebQc4U/cVDAOGMvZSDcc4zJD6n9x2ZrRC0+h1PZVn1MQxG2f7IejjqX+iTMf?=
 =?us-ascii?Q?lEwzaDXUan5cmXsPjB8Hzy9dTiyVRM6kaCeknqEF0ezMbWMfO17PyXG87qS5?=
 =?us-ascii?Q?ARweUkzRgG9liHHqwUvlOSd4LqRdOqJlfQZ5QvOeSmROCHLeX/tUTzuVBt5u?=
 =?us-ascii?Q?AwvUO9RqGI4NUWaZXt6GeCEr/a4B9Dm5sAcHKshM9d0SD79Ab18tzy9h9ATI?=
 =?us-ascii?Q?jAtAtutS7DLcctGaO1NtAbRPCWIqxKuOLgW5PqB3KFMSPFDxRcRB9cMSKyfv?=
 =?us-ascii?Q?mOWfdN2UKfyBWJ3zkA4i5PRu5cBwgJILl8zxwOeCT+G82ChYywDkidf/5elC?=
 =?us-ascii?Q?AGk5jrlbA8ykfYjJEWPB2cOmmY3eQU+KB1TvxwuwNpf4ubfARyjazNlp9Hs7?=
 =?us-ascii?Q?2w8I5HuBcf33jTc8GjMiB0lobJzWDXD6jsTnVHnauwXyE2edLm4exZrANXsK?=
 =?us-ascii?Q?LJ/XBhbLwjm7DZojWDQ4Xn7pa3hMcuVTA4TxWoW5DkdeC5kiKKzVktDGu108?=
 =?us-ascii?Q?2loxVsbzdTAHaW0jBmvKp4SYQcRVCUtQt6RXzCLKU82b/7JA/kNzeQKkma/N?=
 =?us-ascii?Q?q99WczZcHFWjUUUuDt5xGU14DEGauyphzDfVCRnboU0iyH50GOqR1LZnc2hi?=
 =?us-ascii?Q?YwkGGjw4/fHVKPDivvf8x5qg05o6atf7LKILvNGuvB+UJ2U2y9noTy07fuoz?=
 =?us-ascii?Q?fmL7BH+myLdxofTz2fXUr0S+2lAPPWMe/8t7w9R8TIa0AzqjqK3I+VKxdLfN?=
 =?us-ascii?Q?8l1jfDhmbzaNwk4FJNdrLa1H4CX7CUN2WJX8q4AhB8xrQeqh/aGqO13gpIIw?=
 =?us-ascii?Q?No6CTJweivyNF9L+8oTCWkJDLhERsZcvY3pksXIwtTrrbmGBxCuYeJuA0Qyl?=
 =?us-ascii?Q?9Csnb21DzreqUJuBv7VENKCAaB0HUyalGxhbC23KfCLx0lh74q7M7Uv+DvYs?=
 =?us-ascii?Q?qJKTsQ9MARsWFhn8wc7ukcOV5MjFeinA2NdUm+lf8UZe1hj+iK0JAbClM+Eb?=
 =?us-ascii?Q?O2EyEgjiJd9pIgucl1a2LOCYDFpjDJWYVGXMWpK4ZH9Aj/N+WB+H7EHAZ2fp?=
 =?us-ascii?Q?1zBbsdoqYr4hBmXAedc6NWWRVVhPtrcImdFylaB+lBHfUDTmxyNeIH+bjqGW?=
 =?us-ascii?Q?Ga7PuQ5OJXdS7JVTbhYwfWCU5bdn5rm5S8dD0S2B5zgWdm6aAjjyPoN+bd5q?=
 =?us-ascii?Q?M0mNnWVdr8FbMF8uuruAHBP1j9BN5+s9/xPdZPO5M3vmGEWHz/wv4+GQHK1g?=
 =?us-ascii?Q?+Xa4+4zR1fU6tCCPlnBKt8xcr5SjQFnbeSpm+g+1sbLfMWPoZBt3SU8OYzp6?=
 =?us-ascii?Q?Lzy0fw/E1+pBy21jb27LvSeQOucriCkW2b5bHiycrLryb5FlhfP9RCbkU7eA?=
 =?us-ascii?Q?hMYghYyNNuYVKjNMOgGdWh/djH1wt8pAuqTSisYcOaPd40YZE4HgYyE2Iw+U?=
 =?us-ascii?Q?/fBaPwOkBfBRlfT7vsbRtCJrblcZlGUiE/ViTRalLjgSLr+b9GbXhlfj72XQ?=
 =?us-ascii?Q?RKFecXkKL6mDo9r3yAunZpp4A5xkLRSJ+90urs2x2XQfrkFC0Q99l13BTnyJ?=
 =?us-ascii?Q?GWhD9Bkg5EG8wKBK1B/4UqToIY6khLfrhejaBVEESObfiNiS8P22CxnLal9c?=
 =?us-ascii?Q?/HcjMTnC2VdZp16f3H9ylHgTC3gozfVFDEwB9iiuWGFKXmtXJ6JdvMPwQnGa?=
 =?us-ascii?Q?z6jQ+tkywQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2115c1ea-82ac-49f9-7993-08de78907c2c
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:18:28.8354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlE2/SiN/RbdBKTniI7igoQVQ2ofys0i56xNKchH2BhCL9odwNZt4AdWhMoaaMdjt08Yofx3b+0F/4lAgUspXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7032
X-Rspamd-Queue-Id: 9EF3D1DEC8E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:dkim,citrix.com:email,citrix.com:mid];
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

In xen/arch/x86/cpu/mcheck/mce.c: mcheck_init(...)
Xen only calls `intel_mcheck_init(...)` if family is 6 or 15.

Linux only calls `mce_intel_feature_init(...)` if family != 5.

Do we need to do something like extend this switch statement in
`mcheck_init(...)` to include family 18 and 19?


In xen/arch/x86/cpu/mcheck/mce.c: mce_firstbank(...)
The check
  c->family == 6 && c->vendor == X86_VENDOR_INTEL && c->model < 0x1a

could be re-written as
  c->vfm >= INTEL_PENTIUM_PRO && c->vfm < INTEL_NEHALEM_EP

I don't know if that would be better.

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
index 9a91807cfb..10e826e3a6 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -334,7 +334,7 @@ mcheck_mca_logout(enum mca_source who, struct mca_banks *bankmask,
                 mca_init_global(mc_flags, mig);
                 /* A hook here to get global extended msrs */
                 if ( IS_ENABLED(CONFIG_INTEL) &&
-                     boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+                     boot_cpu_data.vendor == X86_VENDOR_INTEL )
                     intel_get_extended_msrs(mig, mci);
             }
         }
@@ -564,8 +564,8 @@ bool mce_available(const struct cpuinfo_x86 *c)
  */
 unsigned int mce_firstbank(struct cpuinfo_x86 *c)
 {
-    return c->x86 == 6 &&
-           c->x86_vendor == X86_VENDOR_INTEL && c->x86_model < 0x1a;
+    return c->family == 6 &&
+           c->vendor == X86_VENDOR_INTEL && c->model < 0x1a;
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
index 839a0e5ba9..9100ce0f6c 100644
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
+    return c->vfm >= INTEL_CORE_YONAH;
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


