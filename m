Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPBwLACVFWpSWgcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1185E5D5B0F
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 14:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319821.1587269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5g-0004hw-KK; Tue, 26 May 2026 12:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319821.1587269; Tue, 26 May 2026 12:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRr5g-0004fM-Gh; Tue, 26 May 2026 12:41:00 +0000
Received: by outflank-mailman (input) for mailman id 1319821;
 Tue, 26 May 2026 12:40:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wRr5e-0004ez-RY
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 12:40:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRr5e-003dxT-7e
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 14:40:58 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594d7-e002-0a2a0a5209dd-0a2a450be716-6
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:40:58 +0200
Received: from [40.93.194.29]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a1594d8-212f-0a2a450b0019-285dc21d8874-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 14:40:57 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SJ0PR03MB7128.namprd03.prod.outlook.com (2603:10b6:a03:4e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 26 May
 2026 12:40:53 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 12:40:53 +0000
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
 b=PklUqcutca3orV9sKL2JtB7bZBfySLrrMYfH5NCky0rOBExpX9LjPLnbOJ+E54FLBXYllwnDFiq/EAdiQsZ5/EO0D94Xw5E1PunYoibYB4I/ZyrN6Z0Idl6O50OKqnpIEUWkNTkiIDr26P3mrOB4V3uon4kASx6FKudn1KTXjWjA6+E7nBtArUiCfoiC1SNNDnK5mRduUgVnsdVGft2NAxZdcdNYomrribGnBJeWEali4/lsz3A1Ni+kBQ0Rg+LOKe/E6/m6BZVO4uMaNVjc9rWIGvw+FmtYyeXUJb7BX+UV9hWofohLlK+5sZCpBsirkru0ARn0B9P4dz2wfZovhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sv/Y4EwXju23E48lt//vpB4H/fw+tt8XO+BDmxPLuYM=;
 b=h8Izpc5aQItdrjFV8Dmm2b1ZzFmmIuPbglTZbPDlEVtsIU4Yaq6ipMEj5AbLfqz8D1idLdFOckKxZJ0ETzyX7zqkaW8UyfUrTo6FO+9K8OSu+oPLXj2j6WOVk1uM2lIJQcCwt1STkHg02/k7M/b53MFmN8cYq0aQ4545knD6hYbDgWjrGbMIH0w/bk7HGJO2+R3O7ri/ywzZi+Bl0r4/uUN5QZxZXPBLx0kg+t9Ihvurpprfk+62yU1XehkNAVxjkOf8UMlgo65mJofhAwUC1rJACYDEemjt9Nin7xZmASPuH9ROK6HK2my1vPXnV35x12V4FdEKwEsK7uMWiJiLwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sv/Y4EwXju23E48lt//vpB4H/fw+tt8XO+BDmxPLuYM=;
 b=b0XfpjTh0MsqD8LKGu3kk4R5tCxkRxG+jcv3aUcPRL8q6uibLOlJymNftPx6faoSyGKnLQ6BQX2hEoddb20wE4ZTgN+X1DYsNNa0RD+cpmkacnbd06YTikZ2QObIlIsdKrzWZS7Pj1TGC16iiFRBUO2CLhiQNCP/Xu77KMKwP5w=
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
Subject: [PATCH v1 1/6] nestedsvm: Fix CR3 MBZ check
Date: Tue, 26 May 2026 13:40:22 +0100
Message-ID: <20260526124027.573412-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526124027.573412-1-ross.lagerwall@citrix.com>
References: <20260526124027.573412-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0137.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::16) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SJ0PR03MB7128:EE_
X-MS-Office365-Filtering-Correlation-Id: 5997556c-bde6-4c69-0138-08debb240657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jyMjjIS4xdyJfayBCgN5iX4ToNs28nFEzdFVGkRymFbxGlqewwUNZVl+cL+gKK8eua08j2pqm2+nrzgmMu7PeFtugMwaIVjCTewjP7Jo91RAmmro5Kc3xylB03CIPpG7G3EWSmc5U/UgE2td180JvIrWk1nZJh6Ql8W354/VcYJSju2hTLtELgtOkWguT01JVJDFEYChhGr2c6rOMhqeyiseqME+fUScrQg1eGfHIQvFJnojz6Qitsbwl071JHoj6an9k9ik7+eqgWyUv8lp6+BNH2yjYIR30Bw0KJpi1EKVoBwwbw4mHrayhyI+4ahim+mI+E+uu/MPilxGUFB/edP6gyScw38ZCz5QSdrthf4+gR4rfjVeMhhWdpdRwYeubu8Xe2B0ExeXCIP49ZRX2J/9P5No5sbdmXq0KP7PpQHKt7/Q4Eiw4cIVsLK7G+weHGKWeVH/+Cm3mWze0QuoO6e6KBjNVOOQ50MBPUXgDEXwH/VbbAmN7OPjTWBxtBpRCwDeQKAa56aeqgkyt3G0HxapehwAYPLMC5AaptQMP8d5bqApR3GKY/RK++vNO8L+dbTSOAyDdOX6qbusKFGArmb8pI9FGaQ9GoH0g/5eXoLzKi1kA7uwRWIYdbkUekfMHAcQFuNiAu3dQsg6GPeAESCLxLAb+75+1dUJz7FaNWh51VUq5LO8CYPDmSr5dkrL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Dl5SprOFAqCnahMOWjF5Ic8Nc8LyIOGR58sG6F4nZEf06UdTVKrv5v/50MAT?=
 =?us-ascii?Q?6/ie1WjNo7L0LxJlyk/GaZR36TXFxVknsB+UsOPgeyrHmOF+rL3ZliQJ6ywl?=
 =?us-ascii?Q?oZcUmaACrVpzhPzLSMLhfs131I/WXyxz1mlMqFEqK0y0jL5e0B+n4Hubaru/?=
 =?us-ascii?Q?AWInu0BLaVMXciQD5Vi3dCF+CfNTGrQw/0iiHmBDeJ4PSmOVjfFreBzbrhib?=
 =?us-ascii?Q?dPR4or1B5iAIThy1Gb2JHD8K4SA9YA/aED4T2xz5p9BspD1Z6dzF5z/Igbwa?=
 =?us-ascii?Q?fuF+AMzN66bAMF0zQHRmrMpgf2iUxkGDHAA+aBMWbvQ+rg+wDfN7c8MF9CHs?=
 =?us-ascii?Q?ID/K8j5ZCbxtEvr2CqI64MAIgF1lbb5XLI0RKvG1crGH/YUvbXzd+9PEHXJ8?=
 =?us-ascii?Q?F3jVeiQV0BIGRwZ+PUePzjQToQSHC9lEOJDhRwDDmXV1Ej/9HtNDw78YlUuU?=
 =?us-ascii?Q?83HguOWiAGKtTzj3V6+J6ZhpU6BB8REuMbIWCDdW2HVbsIdGMK+98JQNvR5a?=
 =?us-ascii?Q?wwzXpIp5U3PPm+NGqHa2xQUtPCvFRtntDQaQRQkDj2jm4J7bMRL2EyTSk5Ke?=
 =?us-ascii?Q?TucHt3c7mnTcU4NhPU0oGaR8L5FplBKt16uEA9G8wZVkpEQSTskK7/bFTvwj?=
 =?us-ascii?Q?S+5F4hkuUmrSXJ7jDLA1sqGY8AXcqYw7sgNSQtf/0NYtVfD5M0d3LHjLxOru?=
 =?us-ascii?Q?qARpIsaLiD9hM7TBTDd74Hk34T+ilECj4WQVpmaAaH/RKt9T5QMRUmZRmOss?=
 =?us-ascii?Q?2ZICP80eQsVbMIbCnfBe907Zpe9f+kGSU/70AvK53zr+V3m2GEnzl+DGnPbp?=
 =?us-ascii?Q?5IoClCXwwwHPYC6f18DNANhwo8hKtBlVGhHMtdeWC3ZtfpUrhzVjhsKdBZ5s?=
 =?us-ascii?Q?fF2Xjp9ifsOdk4Nlp4w+BsjKT2D2dypaYBVIJ4DcxgFukaSD65knKlMdDdLM?=
 =?us-ascii?Q?M5ws2wkIms+084c2m/6JnY9/bxfMZEAQY8QTuvG7eZ057jOAEJy31YbqiChg?=
 =?us-ascii?Q?+qXnlfrmQ2C8Hh3LSwYWu/ss52b0T8/aZ8hPBpknVkuOX8JhWoWaZgZ/0Utj?=
 =?us-ascii?Q?/peYIHM1B/dzvLnOEtkSMEwx7e4jqLF9K6KZiD/tTm2WrgnaAuOkm7+2L2h5?=
 =?us-ascii?Q?yuHLrCcyeMYdPUQAxXVJR/XopVLay4mBAOgzHBaP6EmgPV6fc6/U7K5ld9v5?=
 =?us-ascii?Q?2iErfwxcTmWq4vT9H9Q6dGdaT1N0/cXyxQwdLbdgH9wSwO64XMnbxdPcPq1/?=
 =?us-ascii?Q?wQF74zK9HwXC6Z9GDEN/+ahEiVfMUB1tgjthCMPpp/Jf4KJdiHxbT9psZzrB?=
 =?us-ascii?Q?glWKd+4Ur8axCCdxGuWVKnmFMBBQwdQrk0GUNRXE+zzsqBMjYOrEzhlFuTpB?=
 =?us-ascii?Q?UEJh/LJkRq1a7zYlVggbUr7mEtjcOQxy2eURyqdvTWFELiGw7cdrvMp3Bbpq?=
 =?us-ascii?Q?jdSbm/ZWVQ+u9CZ8HlEajWbQOBLqQQTb+I1RHnydZukzL04SBgF2dEGmDw8I?=
 =?us-ascii?Q?RnZnRnlguorirbRSVgh1ugNi2Imv+9sYc7l8MB3xWPxL+PDJxmNf8rL4IMBm?=
 =?us-ascii?Q?gqTuLZJ6xiQ7MWgz4y29081Yig2EPDNXlkrErF0dTnQ9HmAa31Yuo6T6knbX?=
 =?us-ascii?Q?BfLHE/aIAjWh0ZvDALBL2ue4RhIQ0Lx8Z4kmSxBkjWq5k6yBfpNlejPguZs5?=
 =?us-ascii?Q?de3Onw8Eoa9b2TuDDoUilwOL7p3pRQ/bHlTHfWFWV5dWXJ6I7a5qhu9Zxnnk?=
 =?us-ascii?Q?cglYGp60EcHEhpsGY7i7Dq4TMjFsnzg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5997556c-bde6-4c69-0138-08debb240657
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 12:40:53.3316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12HP3vTnGghJrlZMQrHwBk2ty9rW3Wlr3mMsv/w7ALKFh79x+eL+0lSq64EZDyTiZLFbm9ic4KtVpzPGb1sTalT/H/ljvEKRJv7yX/FtZZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7128
X-purgate-ID: tlsNG-42698a/1779799258-1AD77F3B-4C585748/0/0
X-purgate-type: clean
X-purgate-size: 1263
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
X-Rspamd-Queue-Id: 1185E5D5B0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The existing code checks for any reserved bit set while the APM only
considers it invalid if an MBZ bit is set. Relax the check to match the
APM and hardware.

Some of the reserved bits were observed to be set running Rocky Linux
10.1 on Xen on Xen.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/vmcb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 975a1eaef806..9ada491e57db 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -347,10 +347,8 @@ bool svm_vmcb_isvalid(
         PRINTF("CR0: bits [63:32] are not zero (%#"PRIx64")\n", cr0);
 
     if ( (cr0 & X86_CR0_PG) &&
-         ((cr3 & 7) ||
-          ((!(cr4 & X86_CR4_PAE) || (efer & EFER_LMA)) && (cr3 & 0xfe0)) ||
-          ((efer & EFER_LMA) &&
-           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr))) )
+         ((efer & EFER_LMA) &&
+           (cr3 >> v->domain->arch.cpuid->extd.maxphysaddr)) )
         PRINTF("CR3: MBZ bits are set (%#"PRIx64")\n", cr3);
 
     valid = hvm_cr4_guest_valid_bits(v->domain);
-- 
2.53.0


