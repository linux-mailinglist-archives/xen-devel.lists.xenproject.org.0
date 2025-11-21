Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 279AFC78157
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 10:16:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1168462.1494477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNFw-00082K-6k; Fri, 21 Nov 2025 09:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1168462.1494477; Fri, 21 Nov 2025 09:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMNFw-0007xD-2K; Fri, 21 Nov 2025 09:16:40 +0000
Received: by outflank-mailman (input) for mailman id 1168462;
 Fri, 21 Nov 2025 09:16:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1uM0=55=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vMNFu-0007sJ-N3
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 09:16:38 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c773250b-c6ba-11f0-9d18-b5c5bf9af7f9;
 Fri, 21 Nov 2025 10:16:36 +0100 (CET)
Received: from CH5P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::20)
 by CY3PR12MB9654.namprd12.prod.outlook.com (2603:10b6:930:ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 09:16:29 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::1b) by CH5P220CA0023.outlook.office365.com
 (2603:10b6:610:1ef::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.14 via Frontend Transport; Fri,
 21 Nov 2025 09:16:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 09:16:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 21 Nov 2025 01:16:25 -0800
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
X-Inumbo-ID: c773250b-c6ba-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXuicZn20cwROm06hGiu9icp+GJ+KwcHpOK3IwV75MoP97cXBKPwXRqeonJocVytmflSQQUAtIRZZ772g1K3HLKuiioALzypBnLxCH+gPuLb5lTF9gCKl8a9R83Nv9GaZhSg7FkqiOKs+K7CklITukGcf/t74RRKDfufUZM9pqooOTK/hp4VwdSxvfReDEdKdmmldLofJwgfVoUKrZfd0E8mBSI6k6goSAc5Y4D8iBhYnlXTR0Q0453Ft08PsRnDACxmC8w39OeKYoLQLDKbl21Xql+SDN1XQRrOwOAQnRgUOfcKcvq3qUaroSx8UDylHp+SXw3gGsbsjUIyzyxOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrxm4Ssb4DNyh7hnIccW9NVrE+CVSNJj7c6CdihhrWg=;
 b=QlvuPnbtFC6oj2GvAHaG/Ki6hktGQ+lvZetMHC27U8ju6ObqR8pOaLyViBGR9fO/V2G3Uhnmpdlstig+qKy4q0oLIPCQW5NsrUIbRCaV+4viim2Ce+eg6A7YZZ1CwEXidbr2HAjUTtveJYaisr05aTv4BtazFQyKZQnLa279I3GC/RWDQX99BXN/nVj0ew9sM5gmmBI6HBQoshWELJ+6EzvERGhSlgW+R/Mkxzspzh23cu2XT/aqbvQ9nz9sJ4/zP2DpgTNUOR7snMnQvTRa/TKJgK3UZukXJbkytIPpdX1xwhCQ6kNiHWVXwsKMpr403kNoV9UJa9lAVcmWOVB2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrxm4Ssb4DNyh7hnIccW9NVrE+CVSNJj7c6CdihhrWg=;
 b=nCY/RHZQ+9u1dSfr/nBAMStXK9RySpo2g2LfP6ysl/7x9OKQFoCQzH3eA95MD/aLeSHeS61Mj5tBO1Cqy7fnq8R+UaVi9PVMrIw8YBABZE99diVBqolfMathigc6DVf5n2UfZzahaORgclztJftCAQSMU1fItYRJq/NHHCw8R1I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, "Alexandru
 Isaila" <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 1/7] xen/x86: move declaration from mem_access.h to altp2m.h
Date: Fri, 21 Nov 2025 17:15:48 +0800
Message-ID: <20251121091554.1003315-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251121091554.1003315-1-Penny.Zheng@amd.com>
References: <20251121091554.1003315-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|CY3PR12MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: a9675beb-fe93-4c99-6e5a-08de28dea76d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lBMHq4zw7R0lwJ82glo7SUKm1lOTFA0w7VjcqDCksNW6XIP4uczK9/dao3a8?=
 =?us-ascii?Q?iOZVLdzDETqNqLNbcN6zhi8x/D8C90b53AmI/TU0eaqDmCRiNHn1wgNWiSew?=
 =?us-ascii?Q?nFZ45Oq7e+gyWmbUrlRGdIbr+9bAXhFLP9jZkhXDEvGuqhwVrQtqyobTcoW9?=
 =?us-ascii?Q?UNhxJx8gX1zr2W57yLv67W2tsMkSv4TpLXW79gLBy7gfXn2VJg5BV8KD0RPj?=
 =?us-ascii?Q?20AAT7LOhZMsYKQi503SR24XfO6gIbmdC5PJH2dc+cztToj7Csay5LFYhQcD?=
 =?us-ascii?Q?wtWkz5atYUZ6Twzuts2YkJO0WF5lkZlc6j0Zg7QnID6OvO3Q2F6oHcNkJwp0?=
 =?us-ascii?Q?nzBKWA47hbABuBHmKMhGByxN0ieKdrJq6jUZb+lL3HlJWVv1+fn5zm06u+xS?=
 =?us-ascii?Q?Biekr2xy1nXPiyT7+sAR3HSxkl30xawuM8rNZIEN7oDQUXBHLBa5pkTKApHs?=
 =?us-ascii?Q?RoJwbdjEZCUjxiHYYYADgFaIdmEj9HhaK1qatrRaPoiO0tL+PqCdZJgn9DJW?=
 =?us-ascii?Q?hlfofA09maSbvluMi1o9mpjE2/1AqvSPW2vt+7WSjh6tXeUoX+KOX07zOpSp?=
 =?us-ascii?Q?GZo44YfvRJAwkjaFxxYGTNJdkaOVU1xFNjhfdaHNqfqBXi3CtkPbXExSFBO1?=
 =?us-ascii?Q?GBODKmXAEX3wITHn8CfG63bGaS5LXcZ7JU+9XcS7W8xkLA92vX+T+FuYTkvA?=
 =?us-ascii?Q?4x/WmEDSV/K2obTV9pwIkdPi7mSHebMOR84/DAI7PaEwynUTYIQSVw049Qij?=
 =?us-ascii?Q?KatX0lfskDiUMrXQiLQci22VensUQ7NFqhkO0EqGf/k422OcaVhLIOnyxQq6?=
 =?us-ascii?Q?4iX4qQoKP/Lpoi+B0F3NR+pDDUuF7/rqyBnJypCj5sLgEZnxKHFM2CcRBQLt?=
 =?us-ascii?Q?sJNadLA8I2N9Tgk7ymv0EZnr81T3uSj0IbVLTtb8KmLbKPBiXxcFjbFvTpHB?=
 =?us-ascii?Q?0w7bsQmLCfWGR4KXtg+hxWrbOHs2HeX/sQahaDYeSxijGnpzlltvlBuUDJ2D?=
 =?us-ascii?Q?RYunrIjv5j0jxY2U5gApIHuTSRymMeoKMIGiitD8tADdRjEGnw2sBA24oAXx?=
 =?us-ascii?Q?Nkzz3nsG+nhK8MX+mQ2SiDMXN6WntU7MRuLeUEMhNR4g0dJxi4ig8g/84ufK?=
 =?us-ascii?Q?ShuBQmnOVj4L+4eRM+3oRGtSY59m7JldpnvyHcBIKanGaBU8Lp8YyfxlAQah?=
 =?us-ascii?Q?Ui5ivFsymWg4DdizIB7hePFeHEOqQcxQ6/omZCNBdfNbd83Q0j2l904MsTLZ?=
 =?us-ascii?Q?IylhOECVcbA0yuaanoEI11nTPxS+DSIQdjaew1iuwHf+vrlvDxR3DJG56UzK?=
 =?us-ascii?Q?hvRCJkvlec+i2FNRClK3ux18CoEwX+Yc1Q9Y0wjTH/NPon9hhGw6i23hh5iE?=
 =?us-ascii?Q?eXzGkHLSWu+TqtTj8kK92fpc8vvrcKNra8vy7QsWABatZ21iMt+4wdW2RoqM?=
 =?us-ascii?Q?wajFvh/tu0BSyzLurWu1AAzbFZF0HeIsguibxXT4nNPfn1kb3uxigc9+Lcey?=
 =?us-ascii?Q?3l45+SxXyENnaDHyMeX7i2ruMLlVmr5TyvyC+h1G0s/eJbq3+zFHLOo3szfI?=
 =?us-ascii?Q?lPZMn34v5gwP505L1YQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 09:16:28.9211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9675beb-fe93-4c99-6e5a-08de28dea76d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9654

Memory access and ALTP2M are two seperate features, and each could be
controlled via VM_EVENT or ALTP2M. In order to avoid implicit declaration
when ALTP2M=y and VM_EVENT=n on compiling hvm.o/altp2m.o, we move declaration
of the following functions from <asm/mem_access.h> to <asm/altp2m.h>:
- p2m_set_suppress_ve
- p2m_set_suppress_ve_multi
- p2m_get_suppress_ve
Potential error on altp2m.c also breaks Misra Rule 8.4.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/include/asm/altp2m.h     | 10 ++++++++++
 xen/arch/x86/include/asm/mem_access.h | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/include/asm/altp2m.h b/xen/arch/x86/include/asm/altp2m.h
index 8ecd74f363..9c1ac3cc26 100644
--- a/xen/arch/x86/include/asm/altp2m.h
+++ b/xen/arch/x86/include/asm/altp2m.h
@@ -46,6 +46,16 @@ void altp2m_vcpu_destroy(struct vcpu *v);
 int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
 void altp2m_vcpu_disable_ve(struct vcpu *v);
 
+int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
+                        unsigned int altp2m_idx);
+
+struct xen_hvm_altp2m_suppress_ve_multi;
+int p2m_set_suppress_ve_multi(struct domain *d,
+                              struct xen_hvm_altp2m_suppress_ve_multi *sve);
+
+int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
+                        unsigned int altp2m_idx);
+
 #else
 
 static inline bool altp2m_is_eptp_valid(const struct domain *d,
diff --git a/xen/arch/x86/include/asm/mem_access.h b/xen/arch/x86/include/asm/mem_access.h
index 1a52a10322..257ed33de1 100644
--- a/xen/arch/x86/include/asm/mem_access.h
+++ b/xen/arch/x86/include/asm/mem_access.h
@@ -34,16 +34,6 @@ bool p2m_mem_access_emulate_check(struct vcpu *v,
 /* Sanity check for mem_access hardware support */
 bool p2m_mem_access_sanity_check(const struct domain *d);
 
-int p2m_set_suppress_ve(struct domain *d, gfn_t gfn, bool suppress_ve,
-                        unsigned int altp2m_idx);
-
-struct xen_hvm_altp2m_suppress_ve_multi;
-int p2m_set_suppress_ve_multi(struct domain *d,
-                              struct xen_hvm_altp2m_suppress_ve_multi *sve);
-
-int p2m_get_suppress_ve(struct domain *d, gfn_t gfn, bool *suppress_ve,
-                        unsigned int altp2m_idx);
-
 #endif /*__ASM_X86_MEM_ACCESS_H__ */
 
 /*
-- 
2.34.1


