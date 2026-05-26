Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O/mBgOVFWp8WgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EFA5D5B29
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319825.1587295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5q-0005VS-FD; Tue, 26 May 2026 12:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319825.1587295; Tue, 26 May 2026 12:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5q-0005Se-Bz; Tue, 26 May 2026 12:41:10 +0000
Received: by outflank-mailman (input) for mailman id 1319825;
 Tue, 26 May 2026 12:41:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wRr5o-0005QT-QR
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 12:41:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRr5o-00GcAj-6G
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:41:08 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594de-2eae-0a2a0a5409dd-0a2a45098b5e-22
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:41:08 +0200
Received: from [40.107.201.37]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594e2-2497-0a2a45090019-286bc92566b8-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:41:07 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB7128.namprd03.prod.outlook.com (2603:10b6:a03:4e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 12:41:04 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:41:04 +0000
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
 b=Op0gFC2V2eld7JPhwXkzp6y+LZFytW8eSyBzdDXTm6Qhwy2S/v23u8TPk5vBs82PYLZdodiTPJtA1KomSR0NU20o3QUDkf1IliWMgew2AVWfIF4FM2pL8kzzl9EvEA923BkahKUiV2vU0VHqBJjowPXQlBJUK8L7LhHLYJIjmDVb608RuxT2tsIFuQ5UJn3jpgCJH4PtPp0mZSq52+QIb9761liuSupbKyMZ+DtL87ThqGKCUBwtjyyILZzQL/bIJQEVJY/T9yEm4ZoN0MDCLi7rLW7004FkhxsqCIFq1VH5X5u8QWgPE0CHXWRAYdBIlWHe3tW4QYVhJ2iESltHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spydKjB3Jw/7++KbEizvwyVUj7TxzOpGw0J0LXRy+Sc=;
 b=JfSnWBZpdzxeUKDwnG93MN+MAG7GKPoWK8rTx76rup5IZgqDKNQyG/2ppan2OeTbWebsz7CneKZ4aTz+LDcXnv/5VxnhnQB3JuOXVidcrCpzdSYmv5PzKFjFGGBLEjaR5KvfH09MAzJORUIBQKRmiSJlqdAi5qG4QkTFAvqVtPMSMQfG7egtQft5HPWI/eLoMyGfjnsuwLgPypsUcXdHwwdMJDXnSPVkGJg4AV94NN6xCzPpgPRo4wb5tG6m3d0BzrK1kuxVh1NRCM3ETip02meJYszGhwoStKcacKcf0KsAqNmqhyjsLOHhfHO0a5nASEXEl8+iLRZNY420lpN5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spydKjB3Jw/7++KbEizvwyVUj7TxzOpGw0J0LXRy+Sc=;
 b=eXPzIysh6evTQGFjWMu3TvDAaBy9HruCPDHgviLIQTGnuZwe7cruagynirbom6HOvX1Loo6W4aQuDkqaiiPJCGaKBAnzAP9iev7PzX+6NQRNLBLFPFC08enHa3UUSUSTTxx6MR7O13Jg5zbhLCKcf5TXeJIp+fx80BZsU+RxpTI=
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
Subject: [PATCH v1 4/6] nestedsvm: Set GIF during VMRUN if vGIF is enabled
Date: Tue, 26 May 2026 13:40:25 +0100
Message-ID: <20260526124027.573412-5-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526124027.573412-1-ross.lagerwall@citrix.com>
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0370.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd43961-d9f4-44a1-7366-08debb240ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Zk5R5fyxfCVFvSrQ7A496NvMsyYFXRva6rZBhWOdl/VjRlB6dB71LqYmJ6UF4QxOB8YmgjbepdVdDga+EmVUmNqPOwMbwKDqROyNjQh8EBfQhg8cHej6tJwAT1gktAwBoXEU6F3/fvW5Nq92CyxJtTiV8ON32AxvYfC63oSxwt6xJucPcQ8alJgnnLd5MvCOeG5ZGgfpzaOnRBQLjBbTrJjHwvKZTqIISSVEGQ4rFmev8kF4lC7GsZ4D3SVs8gEDdkh00OZtxvS/EgSiQCVJ+sFm7xqXTiSCnLZwKQ2xhOyzFkN8BR+b1eN5gLd03dnoLaHq8KnvhyvauCe5OxhT1DplptrKhcHCxKveeSlbchRfNGJ79zD4f8RfvYrsv0llEWkEo/iAWKTbfhGgdUPPzIMawuAvyvPLR+a0kUfVK/zb09rr/83mprNnAmC3nnIeV48Ele6LP1nqATf8aLldi2w4u3tN/YxVOExaFaShtYq2LfC+BShVw+A+OrcWsr+3asNPK4LbiZkkH9/70J73qJfpxYeA8dh62D8uYYZevo/h6lxICWr63LYxz5E8hjFCZaXU3ghe1wPD5kR9SPvN4pQmoyNLPqFACONTYpxdku4Xw9CNqDi5vgm2jowZ+vf5eoDWQg9R8kJM4kGxqIxh9EOOdyzjYggeZceMFBSWl3/btD30FnbUq2EHB/G822Cc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uZGPRHuZSKuKsUaz0vnzK3g1KJPj37gNuIzMnGw9Z/EL57WjWHsiJXoJjv88?=
 =?us-ascii?Q?LeIBf91lMJ6Rjz/mJHAIKuUpC0OJF7cJ13KyFMPfZ2Kd5G5zFVMkXAZ0cl8p?=
 =?us-ascii?Q?mRVPjJkI0ARysepkRGoamhPk3IK3VsBo0MRxxOwdEy2vcCUKBE0Kkrdp0wHp?=
 =?us-ascii?Q?4PmmwAzdQJcvYBQQLTDj5qRdvD2wpgAKaBW9dXa6IengcCwwhHSGm1hTsOlB?=
 =?us-ascii?Q?J46se0CPe92dXOD1X0KF/NcsfaHxFVFznKWYgPRjQtWQcz7j/d77EKq9Eq8w?=
 =?us-ascii?Q?5wZrobZoC5bbwUth5k+AXQueNs5/oOVv+XlPjTq9DyGzqfyFBL+GglI/SYEX?=
 =?us-ascii?Q?MPWeIGoSZQAV1VKNNs+Go6t/MTtlMuqlSVqBcXIeqPPJuxznO4ps8RhlSPDI?=
 =?us-ascii?Q?FuSHGkCfzfozoI0q12p+TBUSoq2EE0nXA6rp688RwIBH3jMfcCJtZrv/KpPJ?=
 =?us-ascii?Q?1Q5jKAffdA+wbdcD40syPeDJVh60FRx6j2ayMD+4dQ2cJz2Y0oflDR6oKf5n?=
 =?us-ascii?Q?dFe6u/lBhhovvXEjfUr+N2r+tcTvoaiXga0oDC8Af/ZkjV9aGBLaTtMQnNAH?=
 =?us-ascii?Q?m0hfJO2wYVlOmZpNDAM4QAKvn3C+aWhFyUil04xxu8iG7XMZA5C9vGUecquZ?=
 =?us-ascii?Q?IrU9CJ3JobvnHWX5WzY6RXBGPldxeJbHILxWOfSwpuOuS6TYPC3mMpFI9GzY?=
 =?us-ascii?Q?UuTx3Zc4Omw6okzC6/R6M6X+3ScDw93TYMJomh/9HLpuPHOiCnMfsINir+iZ?=
 =?us-ascii?Q?IgcmLl6RZapKOx68ox6o5+ohoVnYl+8o5vsC028Swjx3OWzDHLw5FLcyydRp?=
 =?us-ascii?Q?OneqH338jAIRSHSYu9Ack/hIyOXDnz7nKA8bj0U9HUu7IQ5aqT+ecWoZ0tbB?=
 =?us-ascii?Q?PBk20Pd7sgfNNp3dtyp7ZMgVe8PDhXdrvQD6MHmE1OK/gdgfPlcK0hFMyTSR?=
 =?us-ascii?Q?dLNVuJm7Xc0F8XrKUI0ifTSNtz3xgX6UF37v/ep1siDlsFPnAyVi65I45HzQ?=
 =?us-ascii?Q?vzcbp0jagz1eJHlBajfXEiybOoTJ3hdJPmNa1JAiZs1TkeiAkf27LDAL+OoZ?=
 =?us-ascii?Q?Twy5fZ9zTnPWUDp81upMfZkVv1Vnx+U9QAry4YZUtQ8BqTYVvCVsW9YSYfoA?=
 =?us-ascii?Q?aBQQLo5w1r9M+4VYGBqNHip/ofgJef4dW6MTCduP+DXYnB1qYjlJHcQtGX/K?=
 =?us-ascii?Q?rxt1hSGsZNVoct3iCNRB+EoCRgGsDvSdFPX2JsB6yC6vnJok6zxuLPHcrllL?=
 =?us-ascii?Q?Q91n6KnhEygx3bpK+gXF7Q1xtK3H4w5RSGTeH5tFIYpVlnP7ZdsGRETUJv8Z?=
 =?us-ascii?Q?lf2Jq59yQ4xJp7fT/7J1xJoa2pesEFzyXSaMH89+h2TFLKTPufl014kQaD7K?=
 =?us-ascii?Q?a/NO2+qpfpxKiK+MH1RVAbKH6DT0qttQ/AfXst22iiir/lScLzdKKjA5Kgv1?=
 =?us-ascii?Q?QCC0GRQrZEgNRtLpf3moc7jAdNqDCTkSftiQBpSruN7YhuDg0eq/lEl75gZM?=
 =?us-ascii?Q?28/gyWjBonVpHPRnTF6sQDRFvyKhlYd/BIhAtJAuE+qhihIfLTMF1KN9n6Nr?=
 =?us-ascii?Q?QMRUVYc/QxTqjTcz/d5+fc8UoDYTM/uemQJLDffI546xyqBQqoIFDfuQu67W?=
 =?us-ascii?Q?DPYYSDZxaxm9IC4/LA6qqbLhMp0gmzknMHu1ptzQmVpqJqxOUXt9S6xXO+i4?=
 =?us-ascii?Q?tkYEBFyuqqJsrNV0AZ7l1oV0m2b2AM3krtqRcR1SigaeLSuznrcurG2cSCeu?=
 =?us-ascii?Q?Xrw50+YoQnTzqxB+U+nUlkLWxD+Dzx4=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd43961-d9f4-44a1-7366-08debb240ce5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:41:04.3441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvOYQ/oDE6tm1SIh/h5Y4ntS1RVjHKC+IMCsY2wGK2PFw2Tv/GQbEpIemCDmIjf03yOte6zGtieOHcKK7j9PCKVFJ9DlQZLFm+kxh5QV+UI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7128
X-purgate-ID: tlsNG-bad1c0/1779799268-4216DA53-2F6BB9B7/0/0
X-purgate-type: clean
X-purgate-size: 1403
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
X-Rspamd-Queue-Id: B6EFA5D5B29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During a VMRUN, the GIF is set by the processor so when Xen emulates
VMRUN, it should set the flag too. This was already handled for !vGIF so
handle it for the vGIF case too.

Fixes: 4cd0fad64590 ("x86/svm: Add virtual GIF support")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index dca07d27d923..9b0bd0358ce4 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -603,10 +603,12 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     int ret;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *ns_vmcb;
+    struct vmcb_struct *ns_vmcb, *n1vmcb;
 
     ns_vmcb = nv->nv_vvmcx;
+    n1vmcb = nv->nv_n1vmcx;
     ASSERT(ns_vmcb != NULL);
+    ASSERT(n1vmcb != NULL);
     ASSERT(nv->nv_n2vmcx != NULL);
     ASSERT(nv->nv_n2vmcx_pa != INVALID_PADDR);
 
@@ -651,7 +653,10 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
         return ret;
     }
 
-    svm->ns_gif = 1;
+    if ( n1vmcb->_vintr.fields.vgif_enable )
+        n1vmcb->_vintr.fields.vgif = 1;
+    else
+        svm->ns_gif = 1;
     return 0;
 }
 
-- 
2.53.0


