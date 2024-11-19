Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82229D2528
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 12:53:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840011.1255796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDMmD-0004KA-Cc; Tue, 19 Nov 2024 11:52:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840011.1255796; Tue, 19 Nov 2024 11:52:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDMmD-0004H2-8E; Tue, 19 Nov 2024 11:52:13 +0000
Received: by outflank-mailman (input) for mailman id 840011;
 Tue, 19 Nov 2024 11:52:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=neHs=SO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tDMmC-0004Gu-18
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 11:52:12 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2412::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2240f17-a66c-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 12:52:06 +0100 (CET)
Received: from BYAPR11CA0080.namprd11.prod.outlook.com (2603:10b6:a03:f4::21)
 by SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Tue, 19 Nov
 2024 11:52:01 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:f4:cafe::d3) by BYAPR11CA0080.outlook.office365.com
 (2603:10b6:a03:f4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22 via Frontend
 Transport; Tue, 19 Nov 2024 11:52:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 19 Nov 2024 11:52:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 05:51:59 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Nov
 2024 05:51:59 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 19 Nov 2024 05:51:57 -0600
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
X-Inumbo-ID: b2240f17-a66c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjIxIiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImIyMjQwZjE3LWE2NmMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDE3MTI2LjMzMjE2OCwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpGvROoYf48QwT75cHi0ceBOESrnYJUVcCk9nrRIm4AfRfq9IJ1ewrzr5UvJ6myiRP3aNck/TxQHjLIc1fHpwEkZcBXLlNUt+kZp/PmZ/pNfwZ0U0wz7FbsPJBcNkkZjEEGmLTWHW9aT7AEdQ3BbrVPcgijofmCrRvi70XJRRk9hADEv5+fiM1n0D9c1LhKuM1dbpV/DITnlEewt13sHupZL/57pfMcVrploGoD4MK155qIY++6+66zDz8M1cHkmJY9NK2Ox+gV09SZUg2wRtrDIBsQA4gPJmsdCsRtU37/RLA8x0naGjWTEC9KMom/xgSmyunE5gZmUOy3a5GXjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDZr6HYKgYn4piSi0T7rQP20QVZ0vgRurNpnxLL5qj0=;
 b=Q+bOVReoNnGmtviE4lYrnPKOHjW3O++UVmo9+uUG3W9NNrWsHNWwIkgr6/vo9WGqIAA90eULEJ2IQb98B9M/uWfFYZQGu+91fQ6dHqwYNvE3PuI+jtWKaGv5naxwvJyF/w/1io2CmDUwzO9ok/Ku4O18X4T26Bb4MafdDVBx8h0zkWM3VX+CZnWylSQXwISGRCwb9HrVlGmSc5pm69YJsJE4miePTEf0b1he2igV2eR5BchVKyWAzPA/Xvdp7lAijWNhKidwkbWLe3BfePapnXpco2AMDB5v/YHgamlv4V2Ip//qyYT0yA20TaBtrE98gaGWQgjaer16nm135y1dEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDZr6HYKgYn4piSi0T7rQP20QVZ0vgRurNpnxLL5qj0=;
 b=b8sjZgWTJ9nfFRnGV1U2OJ7GLrXEEJlPuHiyLUmQWeXfWAUy1IypxkMgYRbZGlZ5dRTaGCJSquajr9P8SR6vaRS0vW5J0ijufHAC8R0G5Ki34dIla9LiP2qmwi5VBqcclb6xJpasyLd3DrvWNUpLPlKZ2CVAJExwh4pLiM4wmr8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH] bootfdt: Unify early printing of memory ranges endpoints
Date: Tue, 19 Nov 2024 12:51:41 +0100
Message-ID: <20241119115141.72770-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|SJ1PR12MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e5f4a0-9c6d-4f3c-53c3-08dd089093ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r/5nO4ZLzTqcUX3zM9dryAj/X5C2aYtUT3rw4UbK9IL5+jvmAu/3QrpkXU8m?=
 =?us-ascii?Q?kTnl6q+LhatiqBsmoBwLXgX7GSRfz0YZoGygtC+pUtfe5uo6Kjll9zu+B71n?=
 =?us-ascii?Q?uAlgk9X8W3AKuGCCdPCArHjyC1Jz3cTTJEDDgZ+ZNDM8DCRzQ3kTu5uhHVeK?=
 =?us-ascii?Q?AdD0ja8wq8SgcL0WCY7MMQlvyqMG3+NggR6uw1nl6JdKHc6flURFCjzdEJyT?=
 =?us-ascii?Q?mTkrCKAqELB2KrHC6FCJfKemlXHaNq/HM0sZiwUf0wbzDg+appEav7NQxq3t?=
 =?us-ascii?Q?5n51kqY3sGu6fjfLnUD75ePuupDgUyZPCl+pk2cdOt/q/UwuHxFWCxS0Cgmr?=
 =?us-ascii?Q?udlKL1SkFDkxsvzrRfarTk1VD5KWKuJQjyP9aHxNmrC5W+UnfLL9uzfcl3X9?=
 =?us-ascii?Q?nXLxp+2UrIlIlnhDvovmgeCG5WB+aXcXg2FB5lJHXiA42mMMRV6mxxQ+KJyL?=
 =?us-ascii?Q?a7CA2uf1lLRUswEL7/3ySMfldBz8x6tIuTbemVVzhArwnKIHQHmD4oa15Zj3?=
 =?us-ascii?Q?jVuesB8Vxjr2B7bvrzO0nVWtHZH2/5MbQHwldfAAtQKesuqQ7vvnJUqbP/QA?=
 =?us-ascii?Q?t/IZpyjxu9ENH4oeHrnwSKHEB+B//Ol2vimtJ1vi7HoK3Sz+6Je406HAAFtq?=
 =?us-ascii?Q?VVJUfVG+QSR/AOZ3vHvTt9fDTJxVvCQ5RhNgxxS7WkFWtqzYdR9BjDQJxb9A?=
 =?us-ascii?Q?ELClmsMkCpLOamEYprJo0zWB/ZE/aLc8DctLEymU9/oLZRj8Cc7Fx2QMX4NZ?=
 =?us-ascii?Q?nnyXout400k/isANnquqIXGQA3aJWT1L8NGSXRgt5GCqFRapTMbmmm6uUma5?=
 =?us-ascii?Q?2txn/k9oc/vwwWII7GEWnmcagmYlepu9Z3mLrp0QWGFcsCcIxLesb0P5qyEz?=
 =?us-ascii?Q?swnRdC8IlHpl6oWe1wfSj+0Yerb58oFAERBkTTBI2lBIGmWZ02omQsQaotG3?=
 =?us-ascii?Q?UQ/oPitJdX+zDPcbNjXLd1D/wkwHtLrQYBG/UCxtnWJ4pUySAzBfQnZgYIMS?=
 =?us-ascii?Q?/4Z8L0tFfMY8cu3eLKaEqO05PvkJxqJVXBZ1tSek445zfSIiSxRIljjGQQvq?=
 =?us-ascii?Q?gUJaXFCNdW9usURzS8vktuUpuxni5QaVzFW0GqRovt57jqJcpPkj36dolvN+?=
 =?us-ascii?Q?FxcOoi1fuRkjSbHvo69HqOq/Bj5Pm98uTpskUCabIz5NrEj8RnRcIhlRAeEY?=
 =?us-ascii?Q?GUGOs1re+zTOCiDTAArmu3QY4QS2fJTz6luLybaVmM/lnpezs6xZLgM+Mo4v?=
 =?us-ascii?Q?nxlBStCgI/vIhS/CoWIWwFKzgg6FR0mKuRjXF0/fkOquXA4DXmY8IQ6y05mU?=
 =?us-ascii?Q?AhovTrsQD3VtelvAgTnVH29qf+QzJ0kuyOz5rpLYQT2MGOUQX3sI+gws+jas?=
 =?us-ascii?Q?Te2ZCvd2UEFpBTSqqjCAnYrUNWpBhOrYpJcRubRtYfAYNlukpg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 11:52:00.2582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e5f4a0-9c6d-4f3c-53c3-08dd089093ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6124

At the moment, when printing memory ranges during early boot, endpoints
of some ranges are printed as inclusive (RAM, RESVD, SHMEM) and some
as exclusive (Initrd, MODULE). Make the behavior consistent and print
all the endpoints as inclusive.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/bootfdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 927f59c64b0d..480644b4b421 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -439,7 +439,7 @@ static int __init process_chosen_node(const void *fdt, int node,
         return -EINVAL;
     }
 
-    printk("Initrd %"PRIpaddr"-%"PRIpaddr"\n", start, end);
+    printk("Initrd %"PRIpaddr"-%"PRIpaddr"\n", start, end - 1);
 
     add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
 
@@ -524,7 +524,7 @@ static void __init early_print_info(void)
         printk("MODULE[%d]: %"PRIpaddr" - %"PRIpaddr" %-12s\n",
                 i,
                 mods->module[i].start,
-                mods->module[i].start + mods->module[i].size,
+                mods->module[i].start + mods->module[i].size - 1,
                 boot_module_kind_as_string(mods->module[i].kind));
 
     for ( i = 0; i < mem_resv->nr_banks; i++ )
-- 
2.25.1


