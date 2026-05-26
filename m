Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3LTXLgCVFWp8WgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123EC5D5B11
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319823.1587287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5m-0005Br-7o; Tue, 26 May 2026 12:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319823.1587287; Tue, 26 May 2026 12:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5m-00059I-3u; Tue, 26 May 2026 12:41:06 +0000
Received: by outflank-mailman (input) for mailman id 1319823;
 Tue, 26 May 2026 12:41:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wRr5l-00058d-Bw
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 12:41:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRr5k-00ClXI-OC
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:41:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594d7-bab6-0a2a0a5309dd-0a2a4505e7ba-34
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:41:04 +0200
Received: from [40.93.194.56]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594de-aaa8-0a2a45050019-285dc2381ef9-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:41:04 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB7128.namprd03.prod.outlook.com (2603:10b6:a03:4e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 12:41:01 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:41:01 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DX4hnhIhUMzH5xJYI8n4exErVPF2hrtHGzSLqRW4LBf1UwpFR4Jq+Kbg8cEmLC4xOt2l2FgekUo+iYSTk/nxrh+0qsF4PlNmDsadgOgznxmsCA8SrFfFym3z1i+rVR1/1R/vLYpGoGoFFfuiqTxNpuQdZ//qSnLtXWxsyHRQxMn6IcwoZmhMUutqlUAzdm6Kx58QYQCTELKw0NomZvurFJJPuCsEyCOmtl9pxU1HSnBz62mfKHzeZPFkd59A5k0pkz/H58uwbaultan2nLTjJDahdv2QZtQas5sN1dlKcefy2RBZ//hZeU5WCG6MZfbE/LWe++RZsUY/vjHR06D3mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWMikWuNE1CofULtcpk66E7js8YBw9GYbEL8d8M+Jwk=;
 b=BKFBD70v8EQ92fjfcn8JRNVi8LhSHWv3xbhYQ+2XRA4Qvv3ymjf0D0fMq+1W00cZ59UDo+7O2/HqnXghp9E6c9Klt1yMI/5q+OLsi1OZaSAkhKPrLLG0TnL2kbeKhTxnestUE4m1eHNUAXoD0CDooeDbl4qAinbNxQ4zjrsGSvy14kLOf17mVUD6AYLxoYN0W5xhxcWMaAEhHsVErz8RgzLAioSvGWCLr9SIth4MhKpYfDU4e7sfQyg+iKcgwBzwpf6T4kckaAUkUXYVemCQnHynmpUs0jQflPJAIbOrdDcwczaR03gPhOAik/7t+3CqKY103yv1dW1coocPzLu77Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWMikWuNE1CofULtcpk66E7js8YBw9GYbEL8d8M+Jwk=;
 b=mg2IEcZmmSw2ZsRxO9Ak050kZC948GIhcluM2gCc26Wh1Ugle2LayEYH8ttaIsTbKbp/jfU2mPp+7bnXADHAiCRRTIMugIu3a0SDnIA4ImcTRe6i7QwayBI8UU29jU8e92eQ7KVucv3V0h9JILHec/uwxjuRWM8OgInNPWpMwzo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v1 3/6] nestedsvm: Use the correct VMCB for vGIF
Date: Tue, 26 May 2026 13:40:24 +0100
Message-ID: <20260526124027.573412-4-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526124027.573412-1-ross.lagerwall@citrix.com>
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0368.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::13) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7efee9-8faa-4788-cdcd-08debb240ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jx1QlFg6BU3KPd6wIcPxLg/EsPngwF32BXKTTXtR0mzXORvPb4n8pff8yz/TMiYBwXoMdbovPcGbrLUGINnHhj0QA0ppiYQYfYDHN+VCWPDfnuQf2KswQrtR9fLb8077Vq0J29+JKrsQlrFE9/+hnDpc78MQssRmltPaANct4uYQBmOTwH6vodbF9q7KbQ4meiuInlR1XuJVz3K3T1FBK3jSvXzDreAqv/Bdk3cF9VPPbhn5JYpiFB2jMG/Eyg1j2w4OyL9TsQKtJrX9Kd+/T7ZYL+R1CgnySeyiHxZofK1Eb5okqxzD06D6ZZ8PiTW1T8dtv9LB91bYhoEHJlgDqOXHFKJsvq2F2RxW08R5KP6N9GEQ7WFZ9GcYrSLidVceit/wO1WN+T6hd05ucw0q/DpA9weyozN6KXkB+/FQHv/FOfpIm/m4J7LUgWgkfRkt8sp9ENLAZk8KJG5uoUW47qvtRaPBkeCySt98QO9aJ2CWa+qYroLLl78BhsEHkW1aZPDmS8chzILtIMPLYD8PPIV2EcSu/4HlBYHSWrjq6fpDEXrbLJY8WUzyrtjio6NiCQ7YTXQtAVxAo0DELC3mUxxi7i9amWIJWMjD/H56jzdLcj5Af4E3bldM926zrw6PrVZVJgjcflsfUcnYtKFnhr7GjuVIP0+/MHlIHKsvK0fI8AMaHfPmifUb2tTUeDXg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fwAcbmN2pp5v9cDEwIAm5DqZhytA5zwBeir5nqiuEOW0e+D3zwH9hzrbrvFC?=
 =?us-ascii?Q?U2++nKvdotopu+YKnBZN5n9NiMYgV8j3RamoAgwOAYGlBFkeDXJMG5at2w+p?=
 =?us-ascii?Q?alYFp0VSkplGLAC5gVqW7jfPW4lmmb+1ydS0bSm6ENJRnXdoJwy8tRlEBor3?=
 =?us-ascii?Q?Kv2NBs9ggziN4diEUxondbNmTcFRIMwN+qqU+s+vfX9JJHvXIpGsKekRvlqs?=
 =?us-ascii?Q?cPY3yGQZicD92YgB4qfgNtsTNGZm24icsgPC5L3nrQ+aEjF7f0YSGF6AxBuU?=
 =?us-ascii?Q?xk9mdZbAWlOvloJAgVFJL+vQgx0zxuOg8wkrXSRiEuTAj/vLzicvibyTMRMy?=
 =?us-ascii?Q?TuJ54jBUFeCiyWaCJlSpXF7+5izxkvasyHEJp0J+CBl8Of9O/AE5kZfO7uDd?=
 =?us-ascii?Q?uiS/cRRsUV1Gvzaea9O+uf4juTyKNuOAYvOIFvqpll3eaXRXP8yjQIbXq8qf?=
 =?us-ascii?Q?tp0YOCuh7yjmKU7Qpr4NsBsiR4lOwxB1rpK/TwxMdubTyzLssjV3LbuFb/WM?=
 =?us-ascii?Q?2uGvN34ynybE80lzx2ojHfTvbLd7uKCFr7p6yXV9D7qUinNrSMGMsPrVrz/6?=
 =?us-ascii?Q?MPSHcHBGQdGtrxcyTxsUhNf4c7NiExOArjWL6I0LHmp+wcGxMlMQoZHnG8aV?=
 =?us-ascii?Q?6FYIJkLf4YzNWHNDDuSpEF/5o6KizYiQsSJcPnYoq0gfRBydQ0Q0uxTZJkXt?=
 =?us-ascii?Q?V9pGBxDn1khwUju9BA9wMAKbld3/ZhQm7BzMdCheg5AsbpsPmSIiOPQs1dhG?=
 =?us-ascii?Q?6HSCsenNxpVYHBsPpMIpOg7d/CXcuzI6O2dgGkU0J6tpbqlYiegqv6rDPbPy?=
 =?us-ascii?Q?NYhpDquY4EFyNEQ7+BcZemt66Pjx8X3kwN9Bu+Xj9G3LEwBkWA/aEMNpftEV?=
 =?us-ascii?Q?J9jyQOMng7ul4FhYVN0soJbLavi3iIELZzVoV2hDcLLq3mjr/Fxr9E6vslNJ?=
 =?us-ascii?Q?8MvkPBHLgdIMx/vDuP45AZ5YtZh0x6O3FXvnOTrBUS5lwDnAIKSY4FC9CsWV?=
 =?us-ascii?Q?TjDaiwHypLRWldh1LRb6fvclvsCwrBmMeGzK+KrKpjG7y47dsg+9QnKYG4cQ?=
 =?us-ascii?Q?sH9RQud837ERYWeQPsN9jfh64/ziigMOHwXWXhlFhz/Y/FTYe1KxG+Q2YJx0?=
 =?us-ascii?Q?MoH1m8/uC6gGZp2igpSqaM+uLC3ErFEjBgztvgldO9YihskORteqAxWbG09V?=
 =?us-ascii?Q?l8pDp8LXiU2k/aAlzZJ2RBODQ784TzD5UzgYhT9T5DQWfT1JWES8hcFpo4uQ?=
 =?us-ascii?Q?ieQMJWXSLS0mFQEW2xRXSOu7sJknCer6Lo+MpSGWZxG+Z1QWd5dxbCQX0wRm?=
 =?us-ascii?Q?oTWZ1/I9in76odia5PebBtY3a2SGXjtH+EK04a9CDpHBH1ssdEV3dxTvEENt?=
 =?us-ascii?Q?mwRwGCg0i5By5ybLANR+2N6ca9mTpZs8guYhiv5CsWM7xsJSX3AanttzyjfS?=
 =?us-ascii?Q?lQTgS2SGEFJBaJLKwcrAPH18bR+9h+0h0XTcTX5RKOg8OsYYHP/Jpbfn6Wga?=
 =?us-ascii?Q?l/w4qFXHM5AAHs+G0OpBFSv2f2WsSwlU/fPSpBbRimSODFwpnKalDCd/Kx7z?=
 =?us-ascii?Q?OsCreXz8GzYANuZqt4gpLUP6UDozm98Kpzwa/xfE0HxV52JoN0wfVci2LIFr?=
 =?us-ascii?Q?VrtqWCze5geT/GXd3lkX+EXIrKDnfoR6U90NKxwsSjOca00qos+CUP1LJkWT?=
 =?us-ascii?Q?97k4BsGepPKWpCQ2NPCEzqe048mxGl8UKiOsbMSSHqblzmyf0aZwQi71YAc6?=
 =?us-ascii?Q?G2wVaCjhNsDOF2m+xR5bA0W9eyEKrI4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7efee9-8faa-4788-cdcd-08debb240ae3
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:41:01.0668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yf2tge2yOi2dLbQSe9IrtUHIMagP0Zrx6gCGiSdeWl+fcHb0vUdAasqV7f4UHQ/jP8YzS27HwXo7CACEl/GhdjpCYgWwE9F7GKjZBVzwDQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7128
X-purgate-ID: tlsNG-c201ff/1779799264-DA76A443-5B74A907/0/0
X-purgate-type: clean
X-purgate-size: 1908
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 123EC5D5B11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In some cases, Xen uses the current VMCB to check/change the state of
vGIF but the current VMCB might be VMCB(0-2). Adjust the cases to use
VMCB(1) instead.

L0 may use vGIF to speed up L1 but whether L2 uses vGIF is the L1
hypervisor's choice and L0 should never need to check/change it.

Fixes: 4cd0fad64590 ("x86/svm: Add virtual GIF support")
Fixes: 05bb1116b8c1 ("x86/svm: update VGIF support")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 9899cb2147b1..dca07d27d923 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1193,10 +1193,11 @@ nestedsvm_vmexit_defer(struct vcpu *v,
     uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct nestedvcpu *nv = &vcpu_nestedhvm(v);
+    struct vmcb_struct *n1vmcb = nv->nv_n1vmcx;
 
-    if ( vmcb->_vintr.fields.vgif_enable )
-        vmcb->_vintr.fields.vgif = 0;
+    if ( n1vmcb->_vintr.fields.vgif_enable )
+        n1vmcb->_vintr.fields.vgif = 0;
     else
         svm->ns_gif = 0;
 
@@ -1460,11 +1461,12 @@ bool
 nestedsvm_gif_isset(struct vcpu *v)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct nestedvcpu *nv = &vcpu_nestedhvm(v);
+    struct vmcb_struct *n1vmcb = nv->nv_n1vmcx;
 
     /* get the vmcb gif value if using vgif */
-    if ( vmcb->_vintr.fields.vgif_enable )
-        return vmcb->_vintr.fields.vgif;
+    if ( n1vmcb->_vintr.fields.vgif_enable )
+        return n1vmcb->_vintr.fields.vgif;
     else
         return svm->ns_gif;
 }
-- 
2.53.0


