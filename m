Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EO4WHTb8u2mzqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:37:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1356F2CC153
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:37:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257191.1551642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DYz-0002Fj-AA; Thu, 19 Mar 2026 13:37:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257191.1551642; Thu, 19 Mar 2026 13:37:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DYz-0002Da-6K; Thu, 19 Mar 2026 13:37:25 +0000
Received: by outflank-mailman (input) for mailman id 1257191;
 Thu, 19 Mar 2026 13:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl8P=BT=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3DRk-0004oN-QL
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:29:56 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b79c5a5e-2397-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:29:56 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by SA5PR03MB989126.namprd03.prod.outlook.com (2603:10b6:806:4d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 13:29:53 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 13:29:53 +0000
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
X-Inumbo-ID: b79c5a5e-2397-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzg/BRtkt2yFUu0yjB3bFWBRFf4qaCnQIssDCOelH+cxzfu7MZZEhupUcPsDbNscDfJjRmFJmXnvBVVGMoeT5Lto7GdxKSCAdpwZZstlOLE1PDavS0u5L1BXa9ritpmZd9c/9ZV6MjAVTTgGUCZEiJpiVtaxJKeB5oV16p0L92fUTYscbVX7qZuMbirwBbe4Cqf0oEvEfupRHhxsto2wIaT9sNKadTtvQNJTpVB0LAI7NyCtWuy6HTRHj5y1taoKNB7RdMVUBdBNxaKR5bnI3E2tTmFSdGsLr6uc/ofTppPyPz9gtWxRe9N6GuZJb9dxHLcOkhdQgc0ZpYlGPQs9VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elIA6dvdGp1tAzqHaCSWjimWB/eU8V8D3hrq8bZIfs4=;
 b=tz/KDJ0iMa1CzQk1ce1yjjwjxt6boKe7959nbpWDFZ5lgTyyNO2hgCB+PHKiaTTCPaChuMx4ZHcJNa2Zbtq4XZtWpV2RQDono7f97MdETuvmB9BxkQwU9ew/8HFYbuIKfFCA6jrCuIEKEeOOIcmKed0alA4GV0bBrSm1cwzMA+fROhWsP08S9af2QqrBfW+apNs+Pmm1HDoi88jtRhHlLmpoFxd+Oueppn7X8QA9i4zv7Sj8M6EQVwFGbFjULcgKtD2KftqEfRU+mR5SbYo+FMtXUUm+5hYx7kgv4ooB70aJG4eij4jDI126gVFUbIMN9dCQXdPZX3FdBuoPIljidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elIA6dvdGp1tAzqHaCSWjimWB/eU8V8D3hrq8bZIfs4=;
 b=aI2u9AkhtBtcTLeLdlohn56Xh0r1YrV3G4Enl3RaHXHg37XKSLPsiH0jmpfnnp/OEQf+D/04toAt4pPLujw02xAPDUQ2JRjR61rj1kTt84TM0EmWgb9aWXFe6xFYLHnNc2s3L/N6OXUvn/h0LrJ+TmZNfATtpieyUo6QQa1/Y10=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v1 7/8] x86/xstate: Stop tracking nonlazy xstate use
Date: Thu, 19 Mar 2026 13:29:23 +0000
Message-ID: <20260319132924.1469809-8-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0075.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::16) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|SA5PR03MB989126:EE_
X-MS-Office365-Filtering-Correlation-Id: 85cd2d53-48fa-476f-b6ff-08de85bb9ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	wAva+HpgSNLn0rRJzhsow25Rj8VZsutPQbxWQVQKWWQUtDow+m6olGmQi4Xtey1skjTr2SAMA4BPPn8tznLUOkMlnAak4jEkwFKkup1r5oGQX9Hn0AMYyBhqP7xfKCpI03L27xp/xoyo+aL51cq+vVuFhnrUiGUdrn2UCnKbeXYoyXT6K17hJKJ33NZvCjLVVvKHEu7zysEsyMj/xzfJTzXtip3egsuHllqsKqZh6bswUlm0uP2VKvggyYzbGFXQRpLBIQJP+DeKN7NENGvDJBvfZ4kJn7+LBoSFpMNGpFYO0QZXckBuDMfEwsGEhujnvavSJcGd+vAy2VibD64gS4yeH+5ePbOIgQLZY9Y6fDPuxXA8Y7tCiCK4QfIjVdQk4+x7EA0EhaJFW0Yr5iBhpV8RflsAeZhldtRDSuTkYxoHWAXWVHzdB07rDpDGJCZ1R3QQFbP5EUHot7mxXW43MIQhX3PBNaA5PK/UwFKRz/K+UzCsJ2FAWGi+YkxVvQa8pRhKs5fgFi6ZGlwd8HYqw5VxiM4vcQZUqz7OoHnns81XPuqLzOwm1OhQZvZmNJMEt4sOXmU3hIz1yPhpg+I7LLti68HG3rCc3Elhq9ZlJ8+mhh6VNRnrfO23biIMz6A9y5lMYh9M3BQ4LVsPVCRqx7q94UblcPp4SQEiogw1k5kgt/ylKWRRdp4G4VySksDMt7tF5aUsmI28CdyaGqHrFUjLdwlrc18rh5ExXrBBplI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UYKEo2T2pCVniwewGjkYq3ngC7TsYr6UisUN9B0Jbkj5NZZFa34KFKQhBS9J?=
 =?us-ascii?Q?f8ymMrdJ+HC7wsn+9KQOJ6BlUbMtTQNq50kCciyCHBLdBEYxt+PzXjYGfvXw?=
 =?us-ascii?Q?O0rmnDTxw5b59kSm5L1jS0n2T3VvL86cCLKN5W8ivi2x5am+5p3g7wPoGZmh?=
 =?us-ascii?Q?WejyZkpFMUt+8Qe2U7r/T+uU2NLZDJ46iOX+Cv1i0LKcwlL2Zg8rDjMq5+oR?=
 =?us-ascii?Q?N2Da3aIpCezoq6hXcWCXX1sycSZvYBIei/97/oniX7DENvDGjTKtTWbOUkvh?=
 =?us-ascii?Q?NJnIfXhS4/YPPd3lT/RL6txtEISGDspIbXjeSCksydpnSd4DW6Cz38by6VzF?=
 =?us-ascii?Q?df5aQyHGpFzJ8SNQAy/+L6ICBI/SdOEnlF8T661PZo6DhMguBduqFncuZIEn?=
 =?us-ascii?Q?ErHDVpZaKeDdOqcmz/I/wlWP49ZDIraQZmerrRtvykMkUH+iWnUiZDGUkWvZ?=
 =?us-ascii?Q?vuHpej10H1WlVDa/eL68UrekmmCnBVCkISQHFGORMvtWHssc9bzX2t+YCS+k?=
 =?us-ascii?Q?tKtayylSHX+4gxZKaoiHFbj7mKEn9gRaDCS404oeBYN8IZuM2j2iAYoF0U5s?=
 =?us-ascii?Q?Xj3AMMLlzfgZxuQYRMCk9GDg9qEVDGwrqlkVNhpniZvG8hrE0Bt7Y+fhcrxD?=
 =?us-ascii?Q?lKTmX1b8yjaAzEJ6hSVSrZddDQBRJGokmrxcZKJUdkKINR8wgx54I3cBwZau?=
 =?us-ascii?Q?nfmBS7dBjyO6x4SrOLXHeVmf60fTrQimqlrcyVBkITEZEB3dPSj+Kli0C+pV?=
 =?us-ascii?Q?/0OKKNtMyWtAYkRUDzpZkJ3b12BddnAUbEoLSIOze/r7FiTXYk4F3q8Rog30?=
 =?us-ascii?Q?k2HUiLuGyU40RPP6PJ8WO6OUyMLXCxqFIIwXcRpIK8dr4LPsnInf7/0Gvt8q?=
 =?us-ascii?Q?SH1U/Ou6rEZkv/1JeWxgzRhb3i18z/eiReHPNZKPYv+7axXUx7ahFBaMshWJ?=
 =?us-ascii?Q?IFp53/kQcZT7McZKqtgLrkWsABDY6ik4tNk81ypM5TNM7kEovcdlimTBp5l6?=
 =?us-ascii?Q?bjcf9o+38cL0Ab4EHOsx5LKX1jLCq2t2y2DAbPdpNeARN2t95o0LHjxMFhBn?=
 =?us-ascii?Q?US38DEiY3eVUrfjwDmo+zXEz45/5AgvwtnLQZhuy7d0jtLukGl78vP3WlWom?=
 =?us-ascii?Q?rrmC0oZw0AS04wOxbY4GBHrXBqETEfBdG4lDV4qYV0bzvvKyALF+IG2Jxwbq?=
 =?us-ascii?Q?zg63ATWoGMdgPnqC/oRfqbZVw7oFsXedTKu4J1BxUApfM+XUbZuN5zOvPa72?=
 =?us-ascii?Q?rAbJ+dCLxhbqcYk2L497LU1UGvZUXDrZrEN6sMbHNbX+w/46fgh5noqkW2Ol?=
 =?us-ascii?Q?bJPLrwwWlABA7bHLaejAyoxwZlcsxnyE6D6GhNJAu/idCv5piOobeXfQj7ld?=
 =?us-ascii?Q?VLuNE2Ekt4BXtOHi5PxRGrgAkcouElXklHVyOE7B2VEO4OXEROEhZCmYqhYW?=
 =?us-ascii?Q?Gf6p1MMUDQ/BCMV4Qvm+0tB3UhFmgrnXylyVXpUycD0wCM5Q1PYC7daScdIo?=
 =?us-ascii?Q?frcKZhyW7/p9Umyk3pHbW4JgxxCN7k6jf87k4DCNsg/GWGDsEAH5UMpBMu/T?=
 =?us-ascii?Q?tQd9zk2lW20zIclbNybKWvLJDktrZODYJRPL/bqmtFaj26kMStKV3YKu1SUv?=
 =?us-ascii?Q?lDYyLove6sK7aQjcaTh0nQqh5OD9+KgoVSu0YxuWZBZWoj8vNoJ+y2L/ssil?=
 =?us-ascii?Q?r8h5MfaA25lq06+mLAl13jw7a/tHtJGeRZ2YwkRuATEQL/PgTgAw/EawKW5Z?=
 =?us-ascii?Q?ewXPKuV7L9zgkFZI+/Se+SreNS2bIKk=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85cd2d53-48fa-476f-b6ff-08de85bb9ad4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:29:53.6959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MBUWIldycPuvcApCdX8Ol+TMq3v1iCP1j2GAHj9YKb3y5avpkuMWD4XaeZmcXG2m2Ey278CMwY1W27hCfdj/9ixr/j7Wqp+shGNOrIFug7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989126
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1356F2CC153
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the removal of lazy FPU, the full state is always restored on context
switch so stop tracking whether nonlazy xstate is used.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/domctl.c             |  1 -
 xen/arch/x86/hvm/hvm.c            |  1 -
 xen/arch/x86/i387.c               | 12 +-----------
 xen/arch/x86/include/asm/domain.h |  3 ---
 xen/arch/x86/include/asm/xstate.h |  6 ++----
 xen/arch/x86/xstate.c             |  3 ---
 6 files changed, 3 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index d9b08182ac1d..a9fbb2d405b7 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1013,7 +1013,6 @@ long arch_do_domctl(
 
                 v->arch.xcr0 = _xcr0;
                 v->arch.xcr0_accum = _xcr0_accum;
-                v->arch.nonlazy_xstate_used = _xcr0_accum & XSTATE_NONLAZY;
                 compress_xsave_states(v, _xsave_area,
                                       evc->size - PV_XSAVE_HDR_SIZE);
 
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index d4ba82845146..0e7b66d726ae 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1383,7 +1383,6 @@ static int cf_check hvm_load_cpu_xsave_states(
 
     v->arch.xcr0 = ctxt->xcr0;
     v->arch.xcr0_accum = ctxt->xcr0_accum;
-    v->arch.nonlazy_xstate_used = ctxt->xcr0_accum & XSTATE_NONLAZY;
     compress_xsave_states(v, &ctxt->save_area,
                           size - offsetof(struct hvm_hw_cpu_xsave, save_area));
 
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 5e893a2aab94..9acaaf4673df 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -108,25 +108,18 @@ static inline void fpu_fxrstor(struct vcpu *v)
 /*      FPU Save Functions     */
 /*******************************/
 
-static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
-{
-    return v->arch.nonlazy_xstate_used ? XSTATE_ALL : XSTATE_LAZY;
-}
-
 /* Save x87 extended state */
 static inline void fpu_xsave(struct vcpu *v)
 {
     bool ok;
-    uint64_t mask = vcpu_xsave_mask(v);
 
-    ASSERT(mask);
     /*
      * XCR0 normally represents what guest OS set. In case of Xen itself,
      * we set the accumulated feature mask before doing save/restore.
      */
     ok = set_xcr0(v->arch.xcr0_accum | XSTATE_FP_SSE);
     ASSERT(ok);
-    xsave(v, mask);
+    xsave(v, XSTATE_ALL);
     ok = set_xcr0(v->arch.xcr0 ?: XSTATE_FP_SSE);
     ASSERT(ok);
 }
@@ -202,9 +195,6 @@ void vcpu_restore_fpu(struct vcpu *v)
  */
 static bool _vcpu_save_fpu(struct vcpu *v)
 {
-    if ( !v->arch.nonlazy_xstate_used )
-        return false;
-
     ASSERT(!is_idle_vcpu(v));
 
     /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index bd7b02085ef8..385a6666dafa 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -667,9 +667,6 @@ struct arch_vcpu
      * it explicitly enables it via xcr0.
      */
     uint64_t xcr0_accum;
-    /* This variable determines whether nonlazy extended state has been used,
-     * and thus should be saved/restored. */
-    bool nonlazy_xstate_used;
 
     struct vmce vmce;
 
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index ca38c43ec1c3..c96d75e38b25 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -33,12 +33,10 @@ extern uint32_t mxcsr_mask;
 #define XSTATE_FP_SSE  (X86_XCR0_X87 | X86_XCR0_SSE)
 #define XCNTXT_MASK    (X86_XCR0_X87 | X86_XCR0_SSE | X86_XCR0_YMM | \
                         X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM | \
-                        XSTATE_NONLAZY)
+                        X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU | \
+                        X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA)
 
 #define XSTATE_ALL     (~(1ULL << 63))
-#define XSTATE_NONLAZY (X86_XCR0_BNDREGS | X86_XCR0_BNDCSR | X86_XCR0_PKRU | \
-                        X86_XCR0_TILE_CFG | X86_XCR0_TILE_DATA)
-#define XSTATE_LAZY    (XSTATE_ALL & ~XSTATE_NONLAZY)
 #define XSTATE_XSAVES_ONLY         0
 #define XSTATE_COMPACTION_ENABLED  (1ULL << 63)
 
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 11d390cac985..658f372b8c51 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -991,9 +991,6 @@ int handle_xsetbv(u32 index, u64 new_bv)
     curr->arch.xcr0 = new_bv;
     curr->arch.xcr0_accum |= new_bv;
 
-    if ( new_bv & XSTATE_NONLAZY )
-        curr->arch.nonlazy_xstate_used = 1;
-
     mask &= ~XSTATE_FP_SSE;
     if ( mask )
     {
-- 
2.53.0


