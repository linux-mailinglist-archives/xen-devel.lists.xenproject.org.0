Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CD8AD90F0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 17:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014453.1392546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ690-0000RZ-4B; Fri, 13 Jun 2025 15:16:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014453.1392546; Fri, 13 Jun 2025 15:16:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ68z-0000Mz-Vj; Fri, 13 Jun 2025 15:16:37 +0000
Received: by outflank-mailman (input) for mailman id 1014453;
 Fri, 13 Jun 2025 15:16:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwl9=Y4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uQ68y-0000Kb-SM
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 15:16:36 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2413::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6553298b-4869-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 17:16:35 +0200 (CEST)
Received: from DS7P220CA0025.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::22) by
 DM4PR12MB6110.namprd12.prod.outlook.com (2603:10b6:8:ad::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.19; Fri, 13 Jun 2025 15:16:32 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:8:223:cafe::88) by DS7P220CA0025.outlook.office365.com
 (2603:10b6:8:223::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 15:16:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Fri, 13 Jun 2025 15:16:31 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Jun
 2025 10:16:29 -0500
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
X-Inumbo-ID: 6553298b-4869-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR0Lv8cfYYhQPMwywuQ1v9Ug90Whgk520nAaWu+rMZgLUTjkpmDD2ARH9Hgz0kR6DOpIxAcLU44ylDb/K+NMqAq4nDlR20MfPlc5kYDuQYBrwe1dmP86a6GueynivJ8RnMmh1AvgfL1kaDsOK6vVDFik76C4SgEXsTSeCaRGo12WtWyPk6swVzyZMKYCtxHe54XGLnRiF7JZUAg4O+qRbgHR2QoVODIpRx/wZtq+ePdXWArvLcgcUN1pFJ/ib2a417A411Yw+BfoKwDszpgQYwmffApIpzOG/kchP9KfivPMT86J36JYxqzMLLMI/FPX0khfN497lH/Th2rjqz8GgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5OnCJJNwcHtcsp/MXejjMQBlQ9XSoV2j6h/sCF/MRg=;
 b=AlbIV8o9R4sJc2jSLlfR/iN5G34YQoPclSiul2G7KMFFyVYYZYKaeLbzULJIcMdMCJrn2waka5g4urTBQzR7BwjSJQhSwuH/vkjQ/ikXiEQYO3Ct7KVIReHPHyJh3zij4ZuJmng6SQwa4/WXA3llan3rw5MT6R4PO15Og6Du+ZXBMRceF2m/IOSmEY/7J0ZRGpN5J+HHESSk+uvzicJLXdflyiTXT9xKV/EQNLQGJX9r9x8VKierPN/7G2BDhFs8pJP1NxeZ0gO4Q6lt6A/KwMwYyuy+HZqikOC46Nw1nVwct5IzFTiv2rzsOMaZ22H/wTe5Ho7OtHTLR0s9XeG8cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5OnCJJNwcHtcsp/MXejjMQBlQ9XSoV2j6h/sCF/MRg=;
 b=gdDpoKSCRMVN+PJ7B2fVhKYLGd4FrIeATHlag8dUA2bqgiXFbD3BpX1oY/3AwvXJ6H6WSZxbs2G9FdHghBHdLJ+jkWwqEGt9JqMWkkqGwjWjnk7fiSBlnwO5RaEY/vNhIojnntK/7WVVZQXpjaLHZQaCAxCmnUdoYg1uZFksEnk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v3 01/14] arm/gnttab: Remove xen/grant_table.h cyclic include
Date: Fri, 13 Jun 2025 17:13:10 +0200
Message-ID: <20250613151612.754222-2-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613151612.754222-1-agarciav@amd.com>
References: <20250613151612.754222-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|DM4PR12MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 358b5fa8-b885-4f14-001e-08ddaa8d470c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YgySIpcr0kMOrRXEAp3vl3WqdCHHi3Kt3NQ8A+/iDrYgG2ELCKxDl+jK1wJs?=
 =?us-ascii?Q?VJ73PghczHCjodcaNTyCO6AkFssiRDn1m9hmhvaD6AYavtmaKL5BNkKzEnYg?=
 =?us-ascii?Q?TE4oIk+vk4PufSbXai0FImoQvshBkQSM77rKMdOOyT/81AJSat5yuRWEwF1i?=
 =?us-ascii?Q?92PHozg6vRAf3F0Odlc1e4lwDlzyoxGZZUK01xLaI4U76Wt9UDd9YZSww/7f?=
 =?us-ascii?Q?Z1ujmiRXGAttPGJ4azM9YZ2LNXmuVQKV93JS/wrm1QQluvN+9ZOlMK2UCnu7?=
 =?us-ascii?Q?vuxiqCApNUfykuFHD23ZOq+R00/YLxiuUCA20PUNisFCU6/SSwaMGzYLDhNz?=
 =?us-ascii?Q?DmxBIgf63VQ9UePJP7JCR+rFEGWV4oHRbbAF5UTOx2AJovTO2xNGVTk6scOP?=
 =?us-ascii?Q?6xA34kw2rocpCslBIAqEclbxTkEmOpJXjbk/x659l7KTfhFnIOP/5AFqaq2j?=
 =?us-ascii?Q?Y6R6L4YWIzkmXdr8TRlyxVY+fWHZHCKT+1KwUZV3YuQf+KtKrjXFO+GjYne7?=
 =?us-ascii?Q?WBbrgSnVqG6InQD9QtI7SGcj9pfJLetYoj1sdDbezXYMFUuNWEYw3+uUpgyV?=
 =?us-ascii?Q?Tx/psNh3T/o6kNf74KxvN9ylFOSb8bi42hOQ+uBTYVa9wIIQL/S6L1c/kioX?=
 =?us-ascii?Q?nDukbP2kzxHi8xu+QIoeHpJLSPNlk/IWBEy7OnGX3awC3bBYBurfv6CVn8K2?=
 =?us-ascii?Q?OGHt9SqwXGFeE49oEb1IxOb63FUvZ2onbHj8Qwq4GoWOcPB38GT4Ksds55QS?=
 =?us-ascii?Q?95hvPCFx2NOJyyrVWDHLV/NNw0GuYemdiNKixyd3Y62r8Ixb8UQ1SIs/ftqp?=
 =?us-ascii?Q?3cbQuZrGiNVNRxsDw3JqDxbLXowp9jlVMJqX/E15YMoALWCI452uuFNQ0zjZ?=
 =?us-ascii?Q?e88STDAQw5JJbHA0H1uNaQU0/FQyfCIdn5TQ0Ad1RtpcyU1x3hH2JoBupZuT?=
 =?us-ascii?Q?4GwOqOjaliILLPhbATlbkOr3kZIu0X0YdbQappaf+NmqpMo9r34G8YhB8kL0?=
 =?us-ascii?Q?7ZL4r+jpkJTwazCag6/Z1NTFhI6pSMAERLGBvk4an20vxvq/q5mb99ShNd+7?=
 =?us-ascii?Q?3lUzU8HU1ZCckNWb9FZ2AUVdPXx29YXgimP/wz8CziLv/dD9CdL26KU2uIBR?=
 =?us-ascii?Q?dbwEHAnFI0L0Dx4xilPuOceCJUig/t1DKK1q723OND0Wdn6PfuOFIZDwS3yU?=
 =?us-ascii?Q?Yt9Ram98TjfJUCECxv8KajsXVmJSXhZ3mMh9yGOfsqI/2ulKcNxi6az2ljsd?=
 =?us-ascii?Q?VA8UvmadLtevGEuaYDsQFmbeCL9a1CXeCO2dVaEPlwWpMr9Dk2X1qacIVQog?=
 =?us-ascii?Q?oM0zQwiViDkVzExzsBkc9/U14vTJNPYe82ciWo6esldtrGipxBfBWqI3EHr/?=
 =?us-ascii?Q?MHVrsLRi2yX4lkGpdA6aalywpvwDoI9wVUPnGiSyj0ZDFaO5IhvnZ7pAVrOQ?=
 =?us-ascii?Q?XiZ9VjrS6hiHzhYK/bZfRp2GX5dGEClLRZ93j8M5ZF9Nnk/jWJz1frUdJksh?=
 =?us-ascii?Q?QJ8VYemK/XeWIy+3vHh/rxv4Qum0g6JFjmNe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 15:16:31.4753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 358b5fa8-b885-4f14-001e-08ddaa8d470c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6110

The way they currently include each other, with one of the includes
being conditional on CONFIG_GRANT_TABLE, makes it hard to know which
contents are included when.

Break the cycle by removing the asm/grant_table.h include.

Not a functional change because.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v3:
  * Strictly remove the cycle in asm/grant_table.h
    (Keeping the conditional include is a terrible idea, IMO)
---
 xen/arch/arm/include/asm/grant_table.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
index c5d87b60c4..c47058a3a0 100644
--- a/xen/arch/arm/include/asm/grant_table.h
+++ b/xen/arch/arm/include/asm/grant_table.h
@@ -1,7 +1,6 @@
 #ifndef __ASM_GRANT_TABLE_H__
 #define __ASM_GRANT_TABLE_H__
 
-#include <xen/grant_table.h>
 #include <xen/kernel.h>
 #include <xen/pfn.h>
 #include <xen/sched.h>
-- 
2.43.0


