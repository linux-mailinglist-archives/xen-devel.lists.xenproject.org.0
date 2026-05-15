Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHf2AzydBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B92E549260
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309487.1580540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjud-0004DL-Bc; Fri, 15 May 2026 04:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309487.1580540; Fri, 15 May 2026 04:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjud-0004AN-8G; Fri, 15 May 2026 04:12:35 +0000
Received: by outflank-mailman (input) for mailman id 1309487;
 Fri, 15 May 2026 04:12:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjua-0003vL-Qx
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:12:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjua-0052Pz-75
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:12:32 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069d2c-e002-0a2a0a5209dd-0a2a4502d878-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:12:32 +0200
Received: from [40.107.74.73]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c3a-af86-0a2a45020019-286b4a49ea93-6
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:31 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB3981.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:28 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:28 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ADdA8lA+st7vdzuVbZ6B8RfzwI9Nj9yXkNnkeUN86DSaagZDbscBYPZ/5CspMyWT4ErNCPCzWMoDKVE3YbsQg921+4A9tKJ1RHwF9dQ3586tjjQvMOV7GYQNc74GEFwed3G7X9hJFyPKewC3yhwDZhXlw1vNjGKgwXct/3sBmhmpT1A5PcUBzG3T22v77tdo187Cq5OGn+ZKLfQkA+oSkr4cQLOmTZL+/CpzpMwMBN8lSeNRpA+wrWuJIP6gWSuldRfBGGdNgZEcwkU3rVXW1UrW1iIpNYF5fPBJJlsyzVkVgK7Lj/ftGIvZqKwYFymZAR4kjyhtJeLqqn0MVaH3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nR9DiFmmPQZJPSPKu4GBPDG2fdbX8kmCXfKAod/+QeY=;
 b=VFs3f8WtuM2ad+k1nVQSQ3Vf/SZfhc8W+5Nimc6j+Zya2ZcoHqoE91r0KJ2Y8V9LhUSm8EaTAdJEwtUFUXFLNVhAGR0XMTxZoLgb3MjmkroFXV9YdTQwYgCcYK3PkA91WF/KBq1N0F1Fq/Hh8kQ4uS75dPZMK7hjxaZkXeX+AkURNRGOY11QYxyqTYUlVt0rGdnaypORDrE1NSYuXHCQheJRAmXVr1tYImrXt4TLtKGsrMl7Qsm287kQPE04bQNDw9TBQZUaMWO2nOqFibsJh988Nt7vrqyQx/6cX04CDu9WU5kl12142BEy7FCBF/HCkMM0l44WupByrHpNwmKGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR9DiFmmPQZJPSPKu4GBPDG2fdbX8kmCXfKAod/+QeY=;
 b=gdsMSSanjL4Ds/BIYGQIrS1NdIh8JDpvA2cbut3/EmYFxWjXRZ0JL0u9OFIBtza0eG7BWS6L4IVRh3a+1zWfPK1lItEriIRZ/7kGj1CPySRSFl59E6f0t7rLZv9qijevvEcdMTulehQOtXL5srJf1rvA30JGtVvBHuClSWcFBkg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 12/26] xen/arm/cca: tear down Realm DATA and RTT granules
Date: Fri, 15 May 2026 13:07:58 +0900
Message-ID: <20260515040812.983626-13-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0096.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB3981:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8b003f-a497-497f-e704-08deb2379e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	gLs4JSF9KlZ6fGcmNHutlgG8cEnBP7TPg0UPZmVJ1PUPh+oj61GuEhHAHo63Gg2ey5RN7tMf7ZyzftdQuMWrzsDeG50bHjOzUpiaQv3JRNfuJzAHwSj6+h1noQ6ScKX33wT9V/bOpAWQegEsDZwZgXhveFaHQBMW74vVpB/EFN4/g/5aqsH9fDqwtrIVrPMRkr0CJATIQGhCHjchgGW+s0N9uhviauIEyjN+pbHYQqdhUrbdDw5/qBO3IaZGTVGkJcaMCq064bJmcs92dZ93hNbUtebW2XinFdrThER9iSgoBSzQ5VfWCFCaIvt2M2kUUcoRzAVvHlnJvbTe61012z0DcLuVmQ2gKdtNAZIJRFEoCbldlvmiyYakya4p+6M1H4Ug0Q38BKVD7i/4ipCmmhn5zIJTj8WIVIrt/xpaRQZBeWY2FRYnSUtPAcBkDSKJ1kGKt1nbL1SR+WChn8Iz2wbES4tQ6RPfzWFkSLw1v+KyWBxHbL9hcY8zEL6CLPmXr8HNX6f5st2FLpToqiLewkflGj0++BWZ+4d33DGVAacb/fG4420jtkaY0dWY5XNK8QD4qqPUnMIYF1vtC9q1CcDy6MG7l25I58xv1CtG7QAcznnkXPiPQ8MqjO42RM5Tfy9mnJYCN4iyaRzcyQcdmnbztKeQj2fMQ4HRMTqecw0uzj+n7ubsWMcqYSkkTiHh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lih3DwsJS3IwLNS7F1KI8M70+8B35CleiPsRTz+a/GCojAufujRYe5VaqZBB?=
 =?us-ascii?Q?2j/qiR7QcIi2ky9ZCMd/pEGkDxGhJp6zDBOxNCU6oT/rACYElarNwUl0XqTT?=
 =?us-ascii?Q?v++SKuuFDJyrSlX2/XjObpDCUjGTDF+ZUupobe/L8mGIbYlilGrKJRmoeur1?=
 =?us-ascii?Q?ceAiBpzKslZApn1wQXzyHVevYPXj541XTvAnNO+K92EAVjjVYXRpNE96/S/V?=
 =?us-ascii?Q?R1siwjMX69M/Skgkh/q7O4qq3dnZQgfg3EQ8zF5FfaI4AEBNLObz/2geZkfi?=
 =?us-ascii?Q?L1guICqCRq706BKKIdlJWpuW31btNhZxinTGpjdX2s2k8THZGsC8UvncDnDR?=
 =?us-ascii?Q?5t6fvPgE8mq0fgXQBtk5+kl31d9F1tzG/bqRCsNxR+ZsrM2Nrk8f9P50n+kf?=
 =?us-ascii?Q?6ngkMHldRUhUzXDzIbjoAW7AGno8/7DRIF4EmvJkRiuPSclBN6W0s+hb3Ugv?=
 =?us-ascii?Q?95oCBcyNrTQ6BBGwBnZAJjbdcGjeo0UBUJ3+0OUgKk0KLtiPleEkO62cprXS?=
 =?us-ascii?Q?auvAYGanFrnkmrXLj5WBfznWNaEATOd1X2XZ6HLcMzADA/Z5t5HQAEdFoeca?=
 =?us-ascii?Q?B+Fx5vSb2uomJnAt53zkLTq+yeI+IAjxuyBoENBsOoRyMlY0mCzzQO5LUK7j?=
 =?us-ascii?Q?VxaIBAuJuf6xuKMC/Gw8IYj5PL1e/znDQV3kYDXYt8SAN6kfzOKqjX7ww4Ap?=
 =?us-ascii?Q?Bi+ibK2zSajG+pNBP6sLzwI+XoSKTXcKw61RI3VhxAv5Mt2ZUEApRirZmJVu?=
 =?us-ascii?Q?Nbzdvo8ioN4aF43XmcoDOokaCp4Ty2+EtbYR7g2FMC5gQ4VIC/ciIKK1attH?=
 =?us-ascii?Q?MTr4MVhwjWBrHWWSnU5kR8s1SFjSBKjqzswZ0y1CWwqbhx3oPnYBjBl94h8a?=
 =?us-ascii?Q?p8hhoZELu2UVqkaiuSLWSSovSOIOuPBQD2JsHqSfibtU4fFpvBHlUoVXFydM?=
 =?us-ascii?Q?dxDsXY49rvn5OtkIZHKBUmsGDcKGW4dLzwobvR1KlM43I2lda3W2kNlCfiEV?=
 =?us-ascii?Q?gdb7NLdgF6PWK3Uvs9TL9syjWTPisZ7KgPiJr4FhPryXfnOqE2wuwAqqlShf?=
 =?us-ascii?Q?safzCci+7P07naVBwr94IH5RJIDbVs+Z6xAcboiUEd3FBV+mBOl6Wlaq1zyF?=
 =?us-ascii?Q?wYLAoDt08NZR+iHtiGEOBZLo+h0loHdsapyWrb42hTr0sLFaGpELf3xHqFqo?=
 =?us-ascii?Q?QMuAAsSZEcO2mG4ifcTquxqBxhxy4cM1md0Z4CCII0GwXQVidnmbWxnHdZxe?=
 =?us-ascii?Q?sr6fesXph91gukq6q2i4jSz0N0vPK4e2peMxHNK9bn69fwYlfbbkuI+dkJP8?=
 =?us-ascii?Q?IHTbrAmSCvfsY8NGrV19LV/G9jt7Hwb3Hku2HIkjsH4AVvSyO3iCbMby6uH7?=
 =?us-ascii?Q?vQ1oIy7rMbBFn0otYu45r/egAIEMeJyltF5LdgHx+QET+XZy/EFfdrrOlRLg?=
 =?us-ascii?Q?R8/yeka0O0DOzXN7W+icLvDVSu6zzBGiNRTjLpHI5HuNKEyGmBODvPZTuKC3?=
 =?us-ascii?Q?pCgwspJvuek6AP/LtlDaWEpEbfw3ON7MyQ9B4CyicEKVRK194O07by/yWqql?=
 =?us-ascii?Q?TOVg4QyNjFhvdGElECEE9d4p7Om+NoVat3E3+IHFfOxzDdA5MWs/b0jfkA+K?=
 =?us-ascii?Q?nGDaH2l9cWQER8f+vIKxapaGbxGSmKvXJrWeOcLeKfTJh3CBY0s9djShOrUh?=
 =?us-ascii?Q?5xXhXZ7b10PhZxED7Cvfwh6CXwdtOmwIvVynSjaEnolLWjbadBvUcHaGMlfL?=
 =?us-ascii?Q?vl5VqUlaeG5Yj+HjFR4uDkXNiZV+yWkib0v2tZ8O+OQgMaeX7FAI?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8b003f-a497-497f-e704-08deb2379e40
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:28.1878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4REczytb2XUah3DTTIi+PnbzuhhRK/HSDjXd6NzXqLI47BCOTuSBBsZjFJPBASSPZqDRFwtUVQXaBZZCkQ05cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3981
X-purgate-ID: tlsNG-720697/1778818111-8316D161-5CFB326C/0/0
X-purgate-type: clean
X-purgate-size: 6505
X-Rspamd-Queue-Id: 9B92E549260
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Tear down mapped DATA granules and the RTT hierarchy before returning
the backing pages to Xen.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/state.c       | 151 +++++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/cca.h |   1 +
 2 files changed, 152 insertions(+)

diff --git a/xen/arch/arm/cca/state.c b/xen/arch/arm/cca/state.c
index e58e261265f3..c85ef56a1297 100644
--- a/xen/arch/arm/cca/state.c
+++ b/xen/arch/arm/cca/state.c
@@ -1,15 +1,19 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/errno.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/xmalloc.h>
 
 #include <asm/cca.h>
+#include <asm/event.h>
 
 #include "rmi.h"
 #include "sro.h"
 
+#define ARM_CCA_RTT_DATA_UNMAP_BATCH 1024UL
+
 static void arm_cca_reset_domain_state(struct domain *d)
 {
     unsigned int i;
@@ -26,6 +30,7 @@ static void arm_cca_reset_domain_state(struct domain *d)
     d->arch.cca.nr_rtts = 0;
     d->arch.cca.data_pages = NULL;
     d->arch.cca.nr_data_pages = 0;
+    d->arch.cca.relinquish_data_idx = 0;
     d->arch.cca.realm_terminate_done = false;
 
     for ( i = 0; i < ARRAY_SIZE(d->arch.cca.realm_sro_pages); ++i )
@@ -51,6 +56,37 @@ void arm_cca_domain_init(struct domain *d)
     arm_cca_reset_domain_state(d);
 }
 
+static int
+arm_cca_rtt_data_unmap_4k(paddr_t rd,
+                          const struct arm_cca_data_page_record *rec)
+{
+    struct arm_smccc_res res;
+    paddr_t top = rec->ipa + PAGE_SIZE;
+    uint64_t desc;
+    int rc;
+
+    /*
+     * DEN0137 2.0-bet1 marks SINGLE oaddr as SBZ, and TF-RMM does not use it,
+     * so keep X5 zero here.
+     */
+    rc = arm_cca_rmi_rtt_data_unmap(rd, rec->ipa, top,
+                                    ARM_CCA_RMI_ADDR_TYPE_SINGLE, 0, &res);
+    if ( rc != 0 )
+        return rc;
+
+    desc = res.a2;
+
+    if ( res.a1 != top ||
+         arm_cca_rmi_addr_desc_4k_pa(desc) != rec->pa ||
+         arm_cca_rmi_addr_desc_4k_size(desc) != ARM_CCA_RMI_PAGE_L3 ||
+         arm_cca_rmi_addr_desc_4k_count(desc) != 1 ||
+         arm_cca_rmi_addr_desc_4k_state(desc) !=
+         ARM_CCA_RMI_OP_MEM_DELEGATED )
+        return -EIO;
+
+    return 0;
+}
+
 static void arm_cca_domain_free_metadata(struct domain *d)
 {
     xfree(d->arch.cca.data_pages);
@@ -104,6 +140,68 @@ static int arm_cca_rmi_realm_destroy_complete(struct domain *d)
     return rc;
 }
 
+static int arm_cca_teardown_data_pages(struct domain *d)
+{
+    unsigned long i;
+    int rc;
+
+    if ( !d->arch.cca.data_pages )
+        return 0;
+
+    for ( i = d->arch.cca.relinquish_data_idx;
+          i < d->arch.cca.nr_data_pages; ++i )
+    {
+        struct arm_cca_data_page_record *rec = &d->arch.cca.data_pages[i];
+
+        if ( rec->pa == INVALID_PADDR )
+            continue;
+
+        if ( rec->ipa != INVALID_PADDR )
+        {
+            if ( d->arch.cca.rd == INVALID_PADDR )
+                return -EIO;
+
+            rc = arm_cca_rtt_data_unmap_4k(d->arch.cca.rd, rec);
+            if ( rc != 0 )
+            {
+                d->arch.cca.relinquish_data_idx = i;
+                return rc;
+            }
+
+            /*
+             * The RTTE no longer owns this DATA granule.  Keep rec->pa so a
+             * later retry can finish the host-side undelegation.
+             */
+            rec->ipa = INVALID_PADDR;
+        }
+
+        rc = arm_cca_undelegate_granule(rec->pa);
+        if ( rc != 0 )
+        {
+            d->arch.cca.relinquish_data_idx = i;
+            return rc;
+        }
+
+        /*
+         * The page remains owned by the domain and on d->page_list so the
+         * generic relinquish path can free it later.
+         */
+        rec->pa = INVALID_PADDR;
+
+        if ( ((i + 1) % ARM_CCA_RTT_DATA_UNMAP_BATCH) == 0 &&
+             hypercall_preempt_check() )
+        {
+            d->arch.cca.relinquish_data_idx = i + 1;
+            return -ERESTART;
+        }
+    }
+
+    d->arch.cca.nr_data_pages = 0;
+    d->arch.cca.relinquish_data_idx = 0;
+
+    return 0;
+}
+
 static int arm_cca_terminate_realm(struct domain *d)
 {
     struct arm_smccc_res res;
@@ -126,6 +224,51 @@ static int arm_cca_terminate_realm(struct domain *d)
     return 0;
 }
 
+static int arm_cca_teardown_rtts(struct domain *d)
+{
+    struct arm_smccc_res res;
+    int rc;
+
+    while ( d->arch.cca.nr_rtts != 0 )
+    {
+        struct arm_cca_rtt_record *rec =
+            &d->arch.cca.rtts[d->arch.cca.nr_rtts - 1];
+
+        if ( rec->pa == INVALID_PADDR )
+        {
+            d->arch.cca.nr_rtts--;
+            continue;
+        }
+
+        if ( rec->ipa != INVALID_PADDR )
+        {
+            if ( d->arch.cca.rd == INVALID_PADDR )
+                return -EIO;
+
+            rc = arm_cca_rmi_rtt_destroy(d->arch.cca.rd, rec->ipa,
+                                         rec->level, &res);
+            if ( rc != 0 )
+                return rc;
+
+            /*
+             * The RMM object is gone.  Keep rec->pa so a later retry can
+             * finish the host-side undelegation.
+             */
+            rec->ipa = INVALID_PADDR;
+        }
+
+        rc = arm_cca_undelegate_granule(rec->pa);
+        if ( rc != 0 )
+            return rc;
+
+        free_domheap_page(maddr_to_page(rec->pa));
+        rec->pa = INVALID_PADDR;
+        d->arch.cca.nr_rtts--;
+    }
+
+    return 0;
+}
+
 static int arm_cca_destroy_realm(struct domain *d)
 {
     int rc;
@@ -179,6 +322,14 @@ int arm_cca_domain_relinquish_resources(struct domain *d)
     if ( rc != 0 )
         return rc;
 
+    rc = arm_cca_teardown_data_pages(d);
+    if ( rc != 0 )
+        return rc;
+
+    rc = arm_cca_teardown_rtts(d);
+    if ( rc != 0 )
+        return rc;
+
     rc = arm_cca_destroy_realm(d);
     if ( rc != 0 )
         return rc;
diff --git a/xen/arch/arm/include/asm/cca.h b/xen/arch/arm/include/asm/cca.h
index b135dd176751..d69e95a10010 100644
--- a/xen/arch/arm/include/asm/cca.h
+++ b/xen/arch/arm/include/asm/cca.h
@@ -68,6 +68,7 @@ struct arm_cca_domain_state {
     unsigned long nr_data_pages;
 
     /* Realm destruction state for domain_relinquish_resources(). */
+    unsigned long relinquish_data_idx;
     bool realm_terminate_done;
 };
 
-- 
2.51.0


