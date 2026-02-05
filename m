Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFg6D1/rhGkj6gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 20:11:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F97FF6BBA
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 20:11:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222448.1530356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo4kT-0006a1-Tf; Thu, 05 Feb 2026 19:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222448.1530356; Thu, 05 Feb 2026 19:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo4kT-0006XT-Qb; Thu, 05 Feb 2026 19:10:41 +0000
Received: by outflank-mailman (input) for mailman id 1222448;
 Thu, 05 Feb 2026 19:10:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kBVW=AJ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vo4kS-0006XN-3L
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 19:10:40 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58641c7a-02c6-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 20:10:34 +0100 (CET)
Received: from BLAPR03CA0125.namprd03.prod.outlook.com (2603:10b6:208:32e::10)
 by IA1PR12MB8587.namprd12.prod.outlook.com (2603:10b6:208:450::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 19:10:29 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:32e:cafe::b0) by BLAPR03CA0125.outlook.office365.com
 (2603:10b6:208:32e::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Thu,
 5 Feb 2026 19:10:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.0 via Frontend Transport; Thu, 5 Feb 2026 19:10:29 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 13:10:27 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 13:01:31 -0600
Received: from ubuntu (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Thu, 5 Feb
 2026 13:01:29 -0600
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
X-Inumbo-ID: 58641c7a-02c6-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dgE30Q9Q9fX/hHkzdUdjpssxu13J+1dvlooZo37aRdexNqlmR6M5g84RGoWreHwqaj3S2297tNXnJyA/QVpQ71lFKF5E0L0wa9SBcU8Cd1MKjXIFZOVxvF2QFJkwawrL4heYmDocX6U1baLVINafWCJQgtqoSr4C++sVO6JjFQWB5sk2tb3aytQR02S3HPH6ub2beMlMkvKsTzHIZNhG5D6u0qng2t6RRNc6vlcTm4C+kV6XZUHF6P1wQsiP6LgJlIPusF7BqRnUERYiegqUg4czimdmaI0LSz51XlAvYfDD02w3gzbKsHeyNNMoBzMHWxk1x2x+8saih/mz6Ow4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pkHT7YoWrdILM2KZRf860iYhK0mFrQlm9u5hTlgGD0=;
 b=PhSAR8YREbhU3iCLZ23AadrxwLOtDp1ZT/4OjUWG+kxIdFN9bsH7Ekvi6+gQW1wwTqe8ilMueld1UjoF8eKkyINsU+78No5dPPo22MlLHaD320h3lR0/nDefFSZW+U8YGitUv357/R9gAx18Iz38bolTnvbCQi14y0G+HIB+U6x7DvyAv7RhsExf8gZ7UVtmW3MgQfjx5eIpKPIT4r7SphT7g4sxv/GqZqlee8rbmfFAobNEvUbW9KewCGch5QrrXd7UKBGhXcc0UxNuwxJJ4M4c50mpXq3K8m7VUXfIS8JZFSIaZ7oCpId/MQsutpcRSk0pCz7boPJNe1EblPMfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pkHT7YoWrdILM2KZRf860iYhK0mFrQlm9u5hTlgGD0=;
 b=Qr35koLQ7CXLVmoKfJdsZHNaqQg8nFtZZijgCf+aQV0ZRLxCWf3eXqTxY164LLou/7Pw/8M728sknPAEIp8BiUiFoTjO3Lwuu0AU1JOkArJUMfS66ZuTXhRkRgsZGIhIXftgszQX0MiHRTsgds5tVJX+axrj4t6V6lW4UBr/vAI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: fix unmapped access trapping on GICv2 hardware
Date: Thu, 5 Feb 2026 14:01:27 -0500
Message-ID: <20260205190128.38716-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|IA1PR12MB8587:EE_
X-MS-Office365-Filtering-Correlation-Id: cb3923c0-f86b-4019-62d1-08de64ea39f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pBalMKYHX5a4Z1gkHiTkzuZsJuBxNUcqrISTEn3zW1nOeTOyacwLEAsrToQk?=
 =?us-ascii?Q?E6wmpNa/vWdQeCjG0QvwEpY6KeO0Xvtt6dKWCCOry0aY4HPyeVRaN+7r2LJg?=
 =?us-ascii?Q?X1DmPoNSISQeFPzqjNKeg9Mc3bRKkkxTYVEYlcFC8vlj0wJaqxZtBr94HhwB?=
 =?us-ascii?Q?vnpJzanR02KnscPkvvlCO5SC+bqZxr31hinXAKR8PYEDGxvZavd/ED1ot7QO?=
 =?us-ascii?Q?vMxqZ6IrjpHlZvYQj4vaDZfe2u+hxA7d+ixIa8AYuIxaV30ge5lCOpV7Ikjr?=
 =?us-ascii?Q?RnV35wKKU+wicpu3ulTcRt9OernLZcOV1cxYtBxIUCC/nEfFo17u7MHurJYF?=
 =?us-ascii?Q?Z+oLCPF731HamdiL5vR/8W290p3O4sStpP6usrLSwXcYeg4IQjVtUro9iaJd?=
 =?us-ascii?Q?NoYCXJbLNX2wIDwTuu+vc6TNojpSgj1Ov2mLcp00uSMSVh7G80ASuUtQtiSR?=
 =?us-ascii?Q?qTd+B6TQcZ25WVpZqDFFH/i74KYLq9mjqZabNdE+W7diggWRmSR9PPPLXcBP?=
 =?us-ascii?Q?Ckh+5FNBg/ptg3/UY6NHYDlxJRzameMbcr5Ua0QLJUvr6W5rBcjUfm1jsvML?=
 =?us-ascii?Q?2oJORH3PxDbtCpWa5TkNZLBRV80hKrOt0t1zM9Wd4ZLRr3xp+5zsZyh7kZaH?=
 =?us-ascii?Q?iVkF9IsjAch3s79M6oMjukA3f3TB+QErY1b1w9qT+7JG8I8osDVOFYTwg4hl?=
 =?us-ascii?Q?hWEqWekL4lYhrfJGiiLMYqGgpRrw3eMYoWnZ+6BI0RhqHguKQ0KbnQ2LhGza?=
 =?us-ascii?Q?63eu+/xlYWpUpu65eEPDztJmfU67+VlCVGUyvGxPCiXQ3SANacsd6aTVrwq2?=
 =?us-ascii?Q?3jftte8H45orvFM1KW3VI8GHxPk+nLeBWRajJVLW8UYlXsfjnpZg0ZDeIxON?=
 =?us-ascii?Q?d8IO67DQ9BsHJeGaz4kqJPr0qyqOjabSZNfxW6USWx+/nUyYfVEYJYxg6Nle?=
 =?us-ascii?Q?ppaZWoCpUZ3wQgRRwfauNtH/Vog6Ui6jHZ7eogzYGC3Oti73zw4v4xR1+ocK?=
 =?us-ascii?Q?pbjZiYWgRXhX0Iz0MfJnvvenHD6kHf+HMPhp02IPJpRDRfs8R0v0H4kfos/X?=
 =?us-ascii?Q?lZFW1cAVlNGGkafgnRacGao2Cjdn8p5MNCPWToKaritXChdgd75PLSTEo/36?=
 =?us-ascii?Q?iVdU/1FZ2+xTZisDd6k27i8P4ZsHyGSQblZaaawr/HzAMrDUgrw4MunCwf5M?=
 =?us-ascii?Q?6XvYvQk8E23FFca+32B43CXPqNwuxYIg6nyFiOHIDWvyhgvJbAss1oekS3Ds?=
 =?us-ascii?Q?NiqZdMXfBaWivXl8/i89vfSMz/H6e/tWPjVVB/URaW6DbZkvmH2nCcI+YU2G?=
 =?us-ascii?Q?PaafD7WNwlEPtauLCe0I8ecl58H8t59QgwwSbiwcOMfAKHqJ8wlNuDcc3OGT?=
 =?us-ascii?Q?UL7Ryl+FYItAi2fDaDfL+SG7HOhN/atkq9SS8Nr/xtl7fl/YPRChK1S7ofvk?=
 =?us-ascii?Q?QpSXi60g68fvy8lhdXaolQqhKZGFW8lGTcV9u7V1H/iktOMDbb2GNd6Y7lVG?=
 =?us-ascii?Q?kRqFeje6GKScq2tcQwBDvCP8KAg2cz9L9N2rbtE4otjcEiRwoDYzvIpBmy3p?=
 =?us-ascii?Q?a8L0RisjpeJPESOYdbhTalVLk7sl7Z8d7G2jiPpXyd1OybC+VeNRFD3PlE3x?=
 =?us-ascii?Q?lQk3kPXQs1hwSw87kVI1hr+W1zkIr505KBM8cNvQdfnK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oZZpie3V3KMD0f0CVryaanGX7cHG58JPTYYYVb56to3KzcHp35Z0UILNlAUCkaxXaKYQWiwsUpVU25EQAU8rWlzTMvz+fKaGatQB4eG37GTn7ItBZZszpQlWbZolxtWPTExtXmfdrefY6no4Cw/XIHZdPIsDtmXE04Acz2gcDq2xyQTi2fIcr6GBgZWN/0DbC3G0D0eFOOIFIoxz2t0xCZ/LF4o7h6KWjGu4qM/yXXqv4G4AJqQkZDWLFQoE6LXQeRpPTcxVxJpG9txLMEGqJCZHhDrWdXyBRH21OTtFLt8/GoUSJfEL3TS5cFzv6zXNVRzBeVR0rpVYPIaCd+U1LpCN+tlzPeqEkeBZusl5cd/8S0eFU4tnFj9XwBJVw6dYaqsL31DM3aIA9aSjiT25ZK1/iTiSIEvimdDngHhsZxxwOsB257mXpOaZtBX+Z75q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 19:10:29.0285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb3923c0-f86b-4019-62d1-08de64ea39f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8587
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8F97FF6BBA
X-Rspamd-Action: no action

Since 4dbcb0653621, the vGICv2 CPU interface is mapped in a deferred
manner. On domains with XEN_DOMCTL_CDF_trap_unmapped_accesses unset on
GICv2 hardware, the vGICv2 CPU interface fails to be mapped. A visible
symptom is that a domU gets stuck at:

  [    0.177983] smp: Bringing up secondary CPUs ...

Move the 2nd check_p2m earlier so it's prioritized over try_handle_mmio.

Fixes: 980aff4e8fcd ("xen/arm: Add way to disable traps on accesses to unmapped addresses")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
This should be backported to 4.21.

Pipeline: https://gitlab.com/xen-project/people/stewarthildebrand/xen/-/pipelines/2010469665
---
 xen/arch/arm/traps.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 040c0f2e0db1..0c01f37ad6b4 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1915,6 +1915,14 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
         if ( info.dabt_instr.state == INSTR_ERROR )
             goto inject_abt;
 
+        /*
+         * If the instruction syndrome was invalid, then we already checked if
+         * this was due to a P2M fault. So no point to check again as the result
+         * will be the same.
+         */
+        if ( (info.dabt_instr.state == INSTR_VALID) && check_p2m(is_data, gpa) )
+            return;
+
         state = try_handle_mmio(regs, &info);
 
         switch ( state )
@@ -1939,14 +1947,6 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
                 break;
         }
 
-        /*
-         * If the instruction syndrome was invalid, then we already checked if
-         * this was due to a P2M fault. So no point to check again as the result
-         * will be the same.
-         */
-        if ( (info.dabt_instr.state == INSTR_VALID) && check_p2m(is_data, gpa) )
-            return;
-
         break;
     }
     default:
-- 
2.52.0


