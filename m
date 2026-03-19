Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGqdOlv6u2nYqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:30:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED732CC01E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:30:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257126.1551607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRk-0006Y5-1O; Thu, 19 Mar 2026 13:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257126.1551607; Thu, 19 Mar 2026 13:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DRj-0006Vr-Qe; Thu, 19 Mar 2026 13:29:55 +0000
Received: by outflank-mailman (input) for mailman id 1257126;
 Thu, 19 Mar 2026 13:29:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wl8P=BT=citrix.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1w3DRi-0004oN-S8
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:29:54 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b638309f-2397-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 14:29:54 +0100 (CET)
Received: from DS0PR03MB8272.namprd03.prod.outlook.com (2603:10b6:8:28f::23)
 by SA5PR03MB989126.namprd03.prod.outlook.com (2603:10b6:806:4d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 13:29:49 +0000
Received: from DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654]) by DS0PR03MB8272.namprd03.prod.outlook.com
 ([fe80::2e63:9a7a:3701:7654%5]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 13:29:49 +0000
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
X-Inumbo-ID: b638309f-2397-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iuxU5EzPq8b9FEN07aCeTs0ZKRVVB4AB11e7K7OH/Mn9SdJVi3BOQ3pFXDzekQUHa5C1iRUexuQDglsfhNQ7GSX8ClcKKTGZNt1yx6ngYbNneKaoPrK3y6bqjZx4H12Me5CV0rbWmDdR/iO499bXO25jgGdsPjr7VUGa72+9X0eO3hsKzBnr02jfVs1G8/nb9D7n2pzECiZMip+NtSXyMhgq6oB79+QhRWWi7Ymz2OclX6vKFqgCSovjIWz9tfGzEp/+rPLMCSEYAIF6LF2NKx/bwKah7cgL8kQSuyFQgS1Qz7r3G4I5X1hN5JgeFTuRV3EzUY6sKxgbguDLY3aI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mc/1C/5c7wG9Z7QnUUbSvdx08N7WHZhMNrFqZMOdkXk=;
 b=g/tITHJH1GgNjTdSpNgR79NPG8TWSBc5AaTyqMQ4Vgv2arzdWmOnlr6mXbMYf7fbzyBcFsxhaYgCyXx61zgplfjRFO4d8Gl1Vzd2LfzT5EiYsBZGyCSt0YO84SNfgamhF091ND4DAuy4pcCi1tBwRjF/vlzxa5U9fRbeIa5DmJSDp1MrlTryASCN3glYig4CWP/jJPDLMm6rfDX2SR1xcF4RAAQbJ9NbBwqXE/OxCrkQueZfX6GN0BcMZl+Qkf8U0StrVhG9nUs5PUBx3R5ptfGXRrwn93PeWusnD0600ySl4OMO/EdG7/G/1yiKWa/YOII6y4WWJs9D6+Ml3zH28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mc/1C/5c7wG9Z7QnUUbSvdx08N7WHZhMNrFqZMOdkXk=;
 b=TuMVa5poDHHcjxBfYFamvUwChRNCwrVbizOZ8w54aY1WodozQnXNWv+RUrIQX981a51lfPJiRDXZdzx+oa1taobNhucyxbdACd2WeyKUWcnbFP1Ae9EZ6d/hsNd2KzeIk8xThjSjpoT1CHvIXDy9DH1A3aVqvLD2w8sk7MXJwhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v1 6/8] x86: Remove fpu_initialised/fpu_dirty
Date: Thu, 19 Mar 2026 13:29:22 +0000
Message-ID: <20260319132924.1469809-7-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
References: <20260319132924.1469809-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::15) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR03MB8272:EE_|SA5PR03MB989126:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7470f2-0ee8-49ca-75de-08de85bb9866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J5wFkUfV6IQSNX2ltyu/I1L9Q91GRedvsX3oRI0vFQW7RKJAoLCHfAi37S/nOxnsCRbQea9a+QKLDv22NNn7yQIeJMVSGyaRZJNVC8VkkZj8CwdjAqoU2G3vMOkgi6+/vBPZxm2qI08/Yv80AAl7UYo5Z5KIXQ090hhDu6sNhUtx/H54kR8QHtgx3p60ulUzw2BWmV3oOqo3CJTzjACQ/7eN1R1vzry4FXSxlnE63lq02Fro19ly7G18gPKV3y6EVP7H8j1lPM4WrQm+EBOW9j97uB4y9WVnLYMtegLo6aFrkefCt02ThlgzJCm4iwrV0vtvEvxb72hgN5DbBTlwb7j9ih9k+KCyGG0QXNhYl63bktCMgtI2tLKZU/KNTtlQCIbHajIkw1J/lcMq2DKbA4bMEIRlz15m2Ar7sRmyjjuI8cv0ilno/VBDYZpnnCgZrn77aMq72A7KBLzUCwMmucItZ/NRzM067iTonaljt821KeWh9GvlSh/a9uXNcS4l2jU7n5eoupGk3q6OtzpTbcRSxOibDw7b3rm2bIYjqMErlnstRpz5+OM3nS42cYL80BBWSjtMuVP6s1yBtpOxVnu3kxMw7PDO1eatRBy8RZ+CW7ObuYOIK/Ec3OTIwmamJtL2YEZk0jc2/c83+Et0QMMrj/BmbP/op+wYMgbNXYWq2zpK3N6RVElK1yMt2jGz8BpSZNB4MvqK7gL+ntVhxr3n1yZ6vO0XDbi0qGiaQjE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR03MB8272.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JM94VrhCBzTCNjVJXkmcDm1W0c3zSInerd+iATvMQxFaUWAZReKeG3QQnmIC?=
 =?us-ascii?Q?jCRJUC8egbXzfAYza/WLgxV3FjsIg4U/9ub2EwFDqR4agOT/+3tPYZsz2SD2?=
 =?us-ascii?Q?rRZBIqg186TK7ADgGIc1PRFk5ZaAMa7nAXH362khGK3pVrfRRyLFoaQOUR3I?=
 =?us-ascii?Q?vHkdUgjiTeyihx3NojOtow70q/HXHiY3GeKFNVqx7HHKnyTa0TQf3ccMzsIC?=
 =?us-ascii?Q?Rx09AizQ6RB0IWFz0JjhsfioZ9pSqymnf4niZ/PhYirEpWxirDO2rdOvG4Qm?=
 =?us-ascii?Q?GqnyoCDRNXmDrbgHEptFv4qnDQr6jEJq3iDUM3XzQH9BnFZ7669xpsUel9w7?=
 =?us-ascii?Q?K9TE3k5v6FosgbhH/wZdwYo6Tuih03cNJRk2KS7I4FX6i4zKFVg8bAhzzJxT?=
 =?us-ascii?Q?Ahzu8BKFLeAiqtRnmLuaMH+xXjBX1k3NoEenXWCvTMYRwQQm+ZciQ9xGlbVg?=
 =?us-ascii?Q?xHvRzxvusYzmYcR121InVSTOsklnXZqj3vlf7J9rXNU9t/G4tPb+nwFRa9Ci?=
 =?us-ascii?Q?M44BXZOMr0TUXcSJwZoKY26sYXVxqNW/CNzi18AiN0RjmN8RWWK1jb7U8n2j?=
 =?us-ascii?Q?9v5R2jgJYaJ6eJB+ligackTZsWpAgBYo1eZW63l0eU+83a1mEhbfjq3EgIpF?=
 =?us-ascii?Q?3fJSvGhKkPYzZgRik+UgWaRqyDNnNpnm7vkIkQd6AOWdaHBAfJiW8WpdJQ7o?=
 =?us-ascii?Q?QORMZ6ysoilOaHqxqHVRn+EtCqEd1NckCST6bC5tlEAcNN//SJ1XnxP+d3rR?=
 =?us-ascii?Q?9kaj9I+C3J63dJV2Ph8L0fx1LoB9TSbqdG96ShGi+G3AQTw0xoIkS/1QkgUr?=
 =?us-ascii?Q?sjDBbnI1MYdcV9mMmbmuMuOW8B04J/WP3KM5JTIhKeJ1ZRWIu+FdkW/FnoG3?=
 =?us-ascii?Q?GJRi/g9NR31/8rGpFxMUNBxeTHUu2T9zzhR/CqBQt/pXeXsK1toR+pp/8DwN?=
 =?us-ascii?Q?8cGvowssUsuIZR5RUpiADNe8U9unNP7opCJ8DuX6PVGBWEchXGufx2JkkUrY?=
 =?us-ascii?Q?OqB47c3YqFyYyIBoTc9WM6VRvkJ4gubIWwMFJt2Een0GrjEeKbJrKGgkerRP?=
 =?us-ascii?Q?7t8+zK62I7KAFRw91b5bqbldqba4/m9J9zvLYKTUrsQZMkI6Kvch77CrmkO9?=
 =?us-ascii?Q?BTldWflzPZA4chXgesRytB1qC9lZbxVxz14dx5dSpAvdrGgr+rG1Sogju24d?=
 =?us-ascii?Q?m1Yd2uF3G9ChPl7UKXxzs+aYxyBqsLg8Rzo62mf+EZlMbIXt0pkQtim7fD8N?=
 =?us-ascii?Q?uloGtMQugjAaiDta7ADur06xdTnKIdagy/3x5UZ7bSi8hQYEzs1RR6TZxgrj?=
 =?us-ascii?Q?1Cl59tWKVjuG+lYXsZGxCnf79Kl28J0I4rZfKVjkoRkjkaEyDkisoLdkJj++?=
 =?us-ascii?Q?skfdq27FklcvjqImoDZ4hwNanKTQoSH8j0oF3SgcKaMQE2FNCFcCx5aswybl?=
 =?us-ascii?Q?Nh1Uq0W/tBZ0YAZlwEBW88Vy49elsuTfW/SRN/G8yhWs2xJTx9IXorbR89jQ?=
 =?us-ascii?Q?PRDe+chLr+b1OaZ4mF/pl8Ithsjxwsjj4sEhxPm7g6l3KowLvPVTgjLDHeyc?=
 =?us-ascii?Q?TtC1aAt5/WRV0yWcqwcKNZL4HD4kError9y5hg8NGP1w4TrAJUWoANxUNagu?=
 =?us-ascii?Q?kCp2q3svUZ8wxQF+VYlivPDvH2ccbciPrsPF5wgCnENAwLUBtB9dVKo4qGlJ?=
 =?us-ascii?Q?9U85qqPAAZBozD6CqzlMLfmLHN8Byv5GYmQOV0q7yCSw+Rx71CtXNUu9QtR1?=
 =?us-ascii?Q?E43s6FAERj2TmHZg68RV6wMIber3llU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7470f2-0ee8-49ca-75de-08de85bb9866
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 13:29:49.6922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TGpEV0HY4Q+q04PLAzr3bvTjcZeBNgtRDIorLo+34vy29ZFAMUo75lgqgvgunGzneobcEQhPsC5EXSaqLOV3RKCrV/DGnehMkNWih+fPpds=
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7ED732CC01E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With lazy FPU removed, fpu_initialised and fpu_dirty are always set to
true in vcpu_restore_fpu() so remove them and adjust the code
accordingly.

No functional change intended.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/domctl.c              |  3 +--
 xen/arch/x86/hvm/emulate.c         |  6 +-----
 xen/arch/x86/hvm/hvm.c             | 15 ++++++---------
 xen/arch/x86/hvm/vlapic.c          |  3 ---
 xen/arch/x86/i387.c                | 31 ++----------------------------
 xen/arch/x86/include/asm/hvm/hvm.h |  1 -
 xen/arch/x86/include/asm/xstate.h  | 11 -----------
 xen/arch/x86/xstate.c              | 21 +++++---------------
 xen/common/domain.c                |  2 --
 xen/include/xen/sched.h            |  4 ----
 10 files changed, 15 insertions(+), 82 deletions(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 942f41c584d4..d9b08182ac1d 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1409,8 +1409,7 @@ void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
         c(flags = v->arch.pv.vgc_flags & ~(VGCF_i387_valid|VGCF_in_kernel));
     else
         c(flags = 0);
-    if ( v->fpu_initialised )
-        c(flags |= VGCF_i387_valid);
+    c(flags |= VGCF_i387_valid);
     if ( !(v->pause_flags & VPF_down) )
         c(flags |= VGCF_online);
     if ( !compat )
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 2daea084f15c..48c7320360c7 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2517,9 +2517,7 @@ static int cf_check hvmemul_get_fpu(
 {
     struct vcpu *curr = current;
 
-    if ( !curr->fpu_dirtied )
-        alternative_vcall(hvm_funcs.fpu_dirty_intercept);
-    else if ( type == X86EMUL_FPU_fpu )
+    if ( type == X86EMUL_FPU_fpu )
     {
         /* Has a fastpath for `current`, so there's no actual map */
         const struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
@@ -2537,8 +2535,6 @@ static int cf_check hvmemul_get_fpu(
          * masking of all exceptions by FNSTENV.)
          */
         save_fpu_enable();
-        curr->fpu_initialised = true;
-        curr->fpu_dirtied = true;
         if ( (fpu_ctxt->fcw & 0x3f) != 0x3f )
         {
             uint16_t fcw;
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 4d37a93c57a5..d4ba82845146 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -866,6 +866,7 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
         .dr7 = v->arch.dr7,
         .msr_efer = v->arch.hvm.guest_efer,
     };
+    const struct xsave_struct *xsave_area;
 
     /*
      * We don't need to save state for a vcpu that is down; the restore
@@ -933,15 +934,11 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
     ctxt.ldtr_base = seg.base;
     ctxt.ldtr_arbytes = seg.attr;
 
-    if ( v->fpu_initialised )
-    {
-        const struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
-
-        BUILD_BUG_ON(sizeof(ctxt.fpu_regs) != sizeof(xsave_area->fpu_sse));
-        memcpy(ctxt.fpu_regs, &xsave_area->fpu_sse, sizeof(ctxt.fpu_regs));
-        VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
-        ctxt.flags = XEN_X86_FPU_INITIALISED;
-    }
+    xsave_area = VCPU_MAP_XSAVE_AREA(v);
+    BUILD_BUG_ON(sizeof(ctxt.fpu_regs) != sizeof(xsave_area->fpu_sse));
+    memcpy(ctxt.fpu_regs, &xsave_area->fpu_sse, sizeof(ctxt.fpu_regs));
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
+    ctxt.flags = XEN_X86_FPU_INITIALISED;
 
     return hvm_save_entry(CPU, v->vcpu_id, h, &ctxt);
 }
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 79697487ba90..885f5d304b2f 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -276,7 +276,6 @@ static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
     switch ( icr & APIC_DM_MASK )
     {
     case APIC_DM_INIT: {
-        bool fpu_initialised;
         int rc;
 
         /* No work on INIT de-assert for P4-type APIC. */
@@ -289,10 +288,8 @@ static void vlapic_init_sipi_one(struct vcpu *target, uint32_t icr)
         hvm_vcpu_down(target);
         domain_lock(target->domain);
         /* Reset necessary VCPU state. This does not include FPU state. */
-        fpu_initialised = target->fpu_initialised;
         rc = vcpu_reset(target);
         ASSERT(!rc);
-        target->fpu_initialised = fpu_initialised;
         vlapic_do_init(vcpu_vlapic(target));
         domain_unlock(target->domain);
         break;
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 88018397b1ad..5e893a2aab94 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -110,22 +110,7 @@ static inline void fpu_fxrstor(struct vcpu *v)
 
 static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
 {
-    if ( v->fpu_dirtied )
-        return v->arch.nonlazy_xstate_used ? XSTATE_ALL : XSTATE_LAZY;
-
-    ASSERT(v->arch.nonlazy_xstate_used);
-
-    /*
-     * The offsets of components which live in the extended region of
-     * compact xsave area are not fixed. Xsave area may be overwritten
-     * when a xsave with v->fpu_dirtied set is followed by one with
-     * v->fpu_dirtied clear.
-     * In such case, if hypervisor uses compact xsave area and guest
-     * has ever used lazy states (checking xcr0_accum excluding
-     * XSTATE_FP_SSE), vcpu_xsave_mask will return XSTATE_ALL. Otherwise
-     * return XSTATE_NONLAZY.
-     */
-    return xstate_all(v) ? XSTATE_ALL : XSTATE_NONLAZY;
+    return v->arch.nonlazy_xstate_used ? XSTATE_ALL : XSTATE_LAZY;
 }
 
 /* Save x87 extended state */
@@ -201,19 +186,11 @@ void vcpu_restore_fpu(struct vcpu *v)
     /* Avoid recursion */
     clts();
 
-    /*
-     * When saving full state even with !v->fpu_dirtied (see vcpu_xsave_mask()
-     * above) we also need to restore full state, to prevent subsequently
-     * saving state belonging to another vCPU.
-     */
     if ( cpu_has_xsave )
         fpu_xrstor(v, XSTATE_ALL);
     else
         fpu_fxrstor(v);
 
-    v->fpu_initialised = 1;
-    v->fpu_dirtied = 1;
-
     /* Xen doesn't need TS set, but the guest might. */
     if ( is_pv_vcpu(v) && (v->arch.pv.ctrlreg[0] & X86_CR0_TS) )
         stts();
@@ -225,7 +202,7 @@ void vcpu_restore_fpu(struct vcpu *v)
  */
 static bool _vcpu_save_fpu(struct vcpu *v)
 {
-    if ( !v->fpu_dirtied && !v->arch.nonlazy_xstate_used )
+    if ( !v->arch.nonlazy_xstate_used )
         return false;
 
     ASSERT(!is_idle_vcpu(v));
@@ -238,8 +215,6 @@ static bool _vcpu_save_fpu(struct vcpu *v)
     else
         fpu_fxsave(v);
 
-    v->fpu_dirtied = 0;
-
     return true;
 }
 
@@ -265,7 +240,6 @@ void vcpu_reset_fpu(struct vcpu *v)
 {
     struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
 
-    v->fpu_initialised = false;
     *xsave_area = (struct xsave_struct) {
         .xsave_hdr.xstate_bv = X86_XCR0_X87,
     };
@@ -282,7 +256,6 @@ void vcpu_setup_fpu(struct vcpu *v, const void *data)
 {
     struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(v);
 
-    v->fpu_initialised = true;
     *xsave_area = (struct xsave_struct) {
         .fpu_sse = *(const fpusse_t*)data,
         .xsave_hdr.xstate_bv = XSTATE_FP_SSE,
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index a9425c8cffe8..846b91ebefcc 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -184,7 +184,6 @@ struct hvm_function_table {
 
     /* Instruction intercepts: non-void return values are X86EMUL codes. */
     void (*wbinvd_intercept)(void);
-    void (*fpu_dirty_intercept)(void);
     int (*msr_read_intercept)(unsigned int msr, uint64_t *msr_content);
     int (*msr_write_intercept)(unsigned int msr, uint64_t msr_content);
     void (*handle_cd)(struct vcpu *v, unsigned long value);
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index e3b9745543d7..ca38c43ec1c3 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -132,17 +132,6 @@ xsave_area_compressed(const struct xsave_struct *xsave_area)
     return xsave_area->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED;
 }
 
-static inline bool xstate_all(const struct vcpu *v)
-{
-    /*
-     * XSTATE_FP_SSE may be excluded, because the offsets of XSTATE_FP_SSE
-     * (in the legacy region of xsave area) are fixed, so saving
-     * XSTATE_FP_SSE will not cause overwriting problem with XSAVES/XSAVEC.
-     */
-    return xsave_area_compressed(v->arch.xsave_area) &&
-           (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
-}
-
 /*
  * Fetch a pointer to a vCPU's XSAVE area
  *
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index e990abc9d18c..11d390cac985 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -994,28 +994,17 @@ int handle_xsetbv(u32 index, u64 new_bv)
     if ( new_bv & XSTATE_NONLAZY )
         curr->arch.nonlazy_xstate_used = 1;
 
-    mask &= curr->fpu_dirtied ? ~XSTATE_FP_SSE : XSTATE_NONLAZY;
+    mask &= ~XSTATE_FP_SSE;
     if ( mask )
     {
         unsigned long cr0 = read_cr0();
+        /* Has a fastpath for `current`, so there's no actual map */
+        struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
 
         clts();
-        if ( curr->fpu_dirtied )
-        {
-            /* Has a fastpath for `current`, so there's no actual map */
-            struct xsave_struct *xsave_area = VCPU_MAP_XSAVE_AREA(curr);
 
-            asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
-            VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
-        }
-        else if ( xstate_all(curr) )
-        {
-            /* See the comment in i387.c:vcpu_restore_fpu_eager(). */
-            mask |= XSTATE_LAZY;
-            curr->fpu_initialised = 1;
-            curr->fpu_dirtied = 1;
-            cr0 &= ~X86_CR0_TS;
-        }
+        asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
+        VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
         xrstor(curr, mask);
         if ( cr0 & X86_CR0_TS )
             write_cr0(cr0);
diff --git a/xen/common/domain.c b/xen/common/domain.c
index ab910fcf9306..30cfea30459a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1824,8 +1824,6 @@ int vcpu_reset(struct vcpu *v)
     clear_bit(v->vcpu_id, d->poll_mask);
     v->poll_evtchn = 0;
 
-    v->fpu_initialised = 0;
-    v->fpu_dirtied     = 0;
     v->is_initialised  = 0;
     if ( v->affinity_broken & VCPU_AFFINITY_OVERRIDE )
         vcpu_temporary_affinity(v, NR_CPUS, VCPU_AFFINITY_OVERRIDE);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 40a35fc15c65..212c7d765c3e 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -212,10 +212,6 @@ struct vcpu
     struct guest_area runstate_guest_area;
     unsigned int     new_state;
 
-    /* Has the FPU been initialised? */
-    bool             fpu_initialised;
-    /* Has the FPU been used since it was last saved? */
-    bool             fpu_dirtied;
     /* Initialization completed for this VCPU? */
     bool             is_initialised;
     /* Currently running on a CPU? */
-- 
2.53.0


