Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE43DD2385E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204474.1519127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfE-0007Py-DC; Thu, 15 Jan 2026 09:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204474.1519127; Thu, 15 Jan 2026 09:29:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJfE-0007MH-8D; Thu, 15 Jan 2026 09:29:12 +0000
Received: by outflank-mailman (input) for mailman id 1204474;
 Thu, 15 Jan 2026 09:29:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7XDq=7U=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vgJfD-0007JZ-0t
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:29:11 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a573d807-f1f4-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 10:29:10 +0100 (CET)
Received: from DM6PR02CA0129.namprd02.prod.outlook.com (2603:10b6:5:1b4::31)
 by MN0PR12MB5713.namprd12.prod.outlook.com (2603:10b6:208:370::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 09:29:05 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:1b4:cafe::d6) by DM6PR02CA0129.outlook.office365.com
 (2603:10b6:5:1b4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 09:29:02 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 09:29:04 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 15 Jan 2026 03:29:02 -0600
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
X-Inumbo-ID: a573d807-f1f4-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/VYPWQQqXTj+MQs9iE5XVgq5sStcxOgYO7AyB864rnceOZeICLWOxCfZYlx8yMtzIgW9jyjgTfepqUxjok+7WKWF/QFaiCDhWTLxHKDY5kVWqxJ0A5+248KbvwnZbxq+ao00Pu0dxcb8IMg7t3bDij65/+OXxrX7pnVZoCJYbCh3ehJFjSGQzFvXH5Gy2B8QJueMJywYW3FOqo73k4bPT1tAydyPqrZyyp1jUJxiwjO/gAxnddb6ICsiXXyzA+PW5LRAJO7s98S5nnbkzl4KTrwkSGiE3qBQ3z4aCh2Pgf/2S1jYgOJzj3URU9GEGzHTCsgQU/IUhOAPVzUAwbyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrxm4Ssb4DNyh7hnIccW9NVrE+CVSNJj7c6CdihhrWg=;
 b=BLEuXsOrG2XRuUe9UcJlkUCFRD9OI4KSeG8y4SJ0modUXtZreF/AChWodFUnyi2VVrQ6KSG1daH8W/TObFvKg6+cjaAO5Dmz2BJa2DWfxXOX8HDRKPy2yvkthPjVnQsIxqAdTTsO07eFSbi3PvZ/7xNDL+XRnmvN6U0C+8cEC7dTnIXW1wzBZ+fWAyzkH9Jl4otbDn9vzwnxiiMBMqDXw+ejeKVdb2DmgBk75QlSF7zgeOzldmPFowWGg6giB6AuzShS2ewUFnm5R5ASRaE+8DFlisD5Ndc1k0+C+EJYfzFi1i3SrlHK+TkKgNlkYW31qRtl95RD0jVzBJH/etPOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrxm4Ssb4DNyh7hnIccW9NVrE+CVSNJj7c6CdihhrWg=;
 b=4XlQnKyGI5cL+Sretnc21lqAdnOKoPd7rgu6ISUCD8bJNbFSAYQC0NZw0k2jvZejuNipd697RFC89luEWg9Xrg2fMQIsaUx42lLI91jI0evp9kXBBecJPLwKi9XEdqbtWiCTENn8T8B+NZu2IrScRYKjqZtXUUgfjb8HFJoExys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>, <jason.andryuk@amd.com>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>
Subject: [PATCH v4 1/6] xen/x86: move declaration from mem_access.h to altp2m.h
Date: Thu, 15 Jan 2026 17:28:36 +0800
Message-ID: <20260115092841.2651224-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092841.2651224-1-Penny.Zheng@amd.com>
References: <20260115092841.2651224-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|MN0PR12MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 17b824c0-9c38-4f12-948f-08de5418869f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NoVPenieFXp3FJykhzA9UtvkCoOkczR70Y4EtyYslrrN7GzgNnm//fp0N1CT?=
 =?us-ascii?Q?2ixttBYgKDDLVuA1xS7EqmiIoopeBsnr1zP7JHL1KxtOpMvEqWCcRJ/ulELB?=
 =?us-ascii?Q?Wk2t73U/LoNrpC6E0iIiEaHxaUDcFCtCAkYIi4rj/jticoxv8LYTu1drtzh1?=
 =?us-ascii?Q?49zevOoD3DvNmvomt7w9MbMWd3C2GJ52TPWGvLWhhznAD2u+2u5CdE7FvGl+?=
 =?us-ascii?Q?2nN9Wk7BPIubl5zPIWh43ckE+oWaYmD1Jy0ubUgcE+wqglImcZH5gf8GOgaO?=
 =?us-ascii?Q?JH6Kp5IzLcm7vEc9MOpE89nUS/y/aumMe9YZPAyF4ckqIyLOs6sBgP7yGpFn?=
 =?us-ascii?Q?+MAqNGnaNMH0k6t6erx0jg034PLGUZTIdIwHMb3yhfLZzlyetLSRV8O7/Av9?=
 =?us-ascii?Q?AZU06zbmgiKWoR9NZRDbTnHbOGeh6dULOR300aAHiHsPm8Bym6/eaqJVekDR?=
 =?us-ascii?Q?mH7uFzJ8epUdbDyoVP9fGFTIzCcB9b1x3WQ3NO+X02SZNvsn0cFt78xiUdwQ?=
 =?us-ascii?Q?Z+R71LlfhlFSrXeYoZ0eyoJCJtbLz1RtwAn+il4Ye32HOZsKs+fcirjRW3Dw?=
 =?us-ascii?Q?grWVxHfpULGuFNADre3JjCd3LEZcZ+ZcCyZrXlWhpwUMM6lk4rfyQhSZO55a?=
 =?us-ascii?Q?Kq1f3QrU61JNGLwGpj9EKweijM7YP/MGv92LENNAQUN3QZSJ3mV/lMmg82z6?=
 =?us-ascii?Q?ZRCxQxCtPw47ESFn75XWjW86mDRnvLjNNg5HdNBIt5uKqaaEWdsEYvTVb9ON?=
 =?us-ascii?Q?19TekgMvRiGwKMoeidgoVWGW4OlGCZ4U0AIPZ2M9g16MUhMvrrTKa5LqmgDF?=
 =?us-ascii?Q?wJqMjcbi5fwtz4PP4DwtS1F+ma77Vze29iHvYrHElOob/f6QGG4FXknFEoPf?=
 =?us-ascii?Q?MNgro65kp8LH7GoN6ls06gAKGPxkSTpa5XZJJv1QCqltXlAC9tG6wuhhN5dq?=
 =?us-ascii?Q?Ub+9TybjvkOY2GO09Dasdg4wK4gNq1NOwmXpM37sr5txLK4uQJk5JcJaDz5r?=
 =?us-ascii?Q?fo+oEYcKvDowQOqoaDOEB3Zt1zb6M+jUiJa+8JQsNRX0irHYEngqV+tMmaVl?=
 =?us-ascii?Q?SjkndqXwD1pSx95Deo3V73A3IwrQc/lKvUOXG2aO7n9FgeYqdAqw3QL5sgwr?=
 =?us-ascii?Q?uuqutOR20nV9DzVV/DzwluzgtU9tph34HZ3FCMZYQNt7tBkZ7qRQfTT9sv3c?=
 =?us-ascii?Q?ZaV48oUY3sg+L2SfGIn67JxKSc6wqWSuaAd5TXI48p8TX7baxrlcSxnu95/P?=
 =?us-ascii?Q?uvTizE8AJw+RW9tNNuD/D4Vm2k7+V7Xme/wAt4T6gKS9/kKPUs5Uw11S8Ghf?=
 =?us-ascii?Q?G3CPZgsv6TrerjsO4X/HCKuB3PpKdLFirZGwNKwenR+gy4HJphbjuWttAZb/?=
 =?us-ascii?Q?n6Er7fGjwsfVSppCh4TaRZZwcqLKaskZOppwGSXrzHyccav95noYnR8FFagA?=
 =?us-ascii?Q?Ud96BjQ6CLuEk96Y5BXWvjyJGD4YMxGBZ8hnvzotgWAlfWNqbTdLlltv3NI9?=
 =?us-ascii?Q?303NvQiOdVyP/wuKVHzJuHEw5CkRW6S3v23PZAD5ucLSuk/1rgMqRVvkyNDg?=
 =?us-ascii?Q?RD0kBb2djlIJlnxc3RmAMcjLeZFvmzXrmP4Yun9Tdw/rKedl4Rx1OHRxM9yF?=
 =?us-ascii?Q?Hs4VZx70WmgSwKUKvVjflo+wuRYcpJM8bxvugTLcmIDprxyWrguVbilv229J?=
 =?us-ascii?Q?lTR3iQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:29:04.7311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17b824c0-9c38-4f12-948f-08de5418869f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5713

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


