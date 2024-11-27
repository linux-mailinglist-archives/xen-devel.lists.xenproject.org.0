Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786F09DAD3F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 19:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845060.1260560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGMwk-0003nV-6s; Wed, 27 Nov 2024 18:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845060.1260560; Wed, 27 Nov 2024 18:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGMwk-0003gl-2v; Wed, 27 Nov 2024 18:39:30 +0000
Received: by outflank-mailman (input) for mailman id 845060;
 Wed, 27 Nov 2024 18:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UPyn=SW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tGMwi-0003ez-7t
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 18:39:28 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2413::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebcdb97f-acee-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 19:39:24 +0100 (CET)
Received: from MW4PR04CA0356.namprd04.prod.outlook.com (2603:10b6:303:8a::31)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Wed, 27 Nov
 2024 18:39:19 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::b) by MW4PR04CA0356.outlook.office365.com
 (2603:10b6:303:8a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12 via Frontend Transport; Wed,
 27 Nov 2024 18:39:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8207.12 via Frontend Transport; Wed, 27 Nov 2024 18:39:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Nov
 2024 12:39:18 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 27 Nov 2024 12:39:17 -0600
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
X-Inumbo-ID: ebcdb97f-acee-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMzo6NjA5IiwiaGVsbyI6Ik5BTTEwLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImViY2RiOTdmLWFjZWUtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzMyNzY0LjMwNjYxMSwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLe0If6WsONRtyEHmf5zDPeStyUrMubEhaPDMpvlxL9H5mR5LgoDCGJqxqbonIbFLwfCwsZk4durN71SU/k/lt/mlTSie0GTZF9yMqWafUq5U9GQSoICyOT0HScQI2fGZD/xDwOL7ecNi0hrNHJ3xJieQRJhh/JhrEa3egiYWSgzhCKaYU6A96f0RzLIm0NCJ7dFbxQTxpN42jjzruyPQ6/H32OqREDS19DxaGLvUcn0FXIChFL/Azx3dKfcvsJYcytwl4ols9mC+aF3L53237hru7ILABV5OxtBC6Tp+A1BXU5ylIjappGV/nFNN3UMeVHkHgdremtPTfS4rCYtjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jtdmgz0hp1h/Jnfpbux2OZYxEMLnlqEMOohpnY6AL4=;
 b=UJGwk+mrb1H9hkNr92oQTAbNSKQDk2Bud8Pm0HF9xQqIFCLDOgfU4tqRTOElxZ+7FUMEsn5Yx8sDNmFdo4KcWRg4+d/t0VZb4hkR3JjZqda3UXJiU+p4Hiyc2MTu2suGdkpchcKAleH02KzSHWciCAd8VTO5jsDDSnsgr6mtBnnwKP1H7PPTr5rS2SQxmiVV3p0XPs/bOtvQaeE+WslDL9WDSs4KxRWcuemjuZ+0gTaNuMFH4VvgruDaacv5ngQ9yUwu5sJobvipsIqSeRn7xUyZshZUx8f/95LNkuxdHgD+GYHTS17cU9lgxE0AvaZaKIChR4H8V3ImElwmLj0wIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jtdmgz0hp1h/Jnfpbux2OZYxEMLnlqEMOohpnY6AL4=;
 b=grjmfS3Mye3jyTIFQH7m10w6GZxpRAxE0JuFIiFWi0OQaDiPpwOA6A6PHnmiC1WrpW87IiwgvlDwQq0HwnJLibQGUR5XD0vcm/MtFgAcSkVDchL0Y/W63nN492Vf/2MTSLC7Y2kSMuCOsj4q5XHaQ1J7UXGcq3VA4lwX8mXb43g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [PATCH v2 2/2] xen/mmu: enable SMMU subsystem only in MMU
Date: Wed, 27 Nov 2024 18:39:06 +0000
Message-ID: <20241127183906.485824-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
References: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c96b7be-6899-4369-f778-08dd0f12cd96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fjMW/dXVnGdjTj6+wFY4rx4ME8wdk7IyA0QC5NInbW4/YO2ezYwlaY7NFunC?=
 =?us-ascii?Q?sUGuwtWyufai0OFVWO7qUF502WbTkpRAU9g8/viqk16HfsaAa/BSr4kzHTMV?=
 =?us-ascii?Q?NlsL9hiRxf/S/pPZ+SJXQhxY031Om71lm3UroFLj8rK55kt+99ZXvlws5j23?=
 =?us-ascii?Q?cwgu2Yyr0ySCVE+0+TzPAn9kThdxb8Ay8Y3WQJnZwe+rissdrETK1B4MclvM?=
 =?us-ascii?Q?fXjyK9Z0GqqiYmPbTzxmEOAjVaSARkSwhampqRNuIMCUg/EOMNBESWyb1tGs?=
 =?us-ascii?Q?gPHx0kZQAKCazrbyEewLOabXHE0rEVhKyOTjxteANGaiZpSZRr8cXsSZZgLZ?=
 =?us-ascii?Q?3ZeU9NI2LleyF1mT7zSu8KJ1+vZ5dp25tu64cSmxdxWo8w+R5QkuoevMgm64?=
 =?us-ascii?Q?dQubXIb3IKRYITppJowavG6qztmpd5LaSGN2swlxvXIzam8XhSo1zTGfZwal?=
 =?us-ascii?Q?T+VPExPk8C4G4zVoNTMXOEN6mpnJqHx9G6jj4vgyR4OHxiUFQZ2LFPNZGCpn?=
 =?us-ascii?Q?c/EHWv6xP6hIkHLgk3jpDOeCcMATKgBec+HKB9kZrBYq1nJu7UCzfRHzXAFG?=
 =?us-ascii?Q?US63A6sJE1TezWdiJxa1mrB4QAdAbVYC9b1aszuf0wxw5+rJ0yCbuF3UKjfc?=
 =?us-ascii?Q?qip9CJZonMCHw26GqzszXktb0D9WC2FOWslFF73u1pIAvtRaAipeVFPP4aUR?=
 =?us-ascii?Q?c7jAy2epaDbDe6RH/GolDD+qjfndgpxJVDjoqkxhAWuOzuucwt+AaCgvcP3Y?=
 =?us-ascii?Q?iNaYcmEhSLPodd9LK7lTqifCNUep6xL1RtCxIqGAYasc1n5PGgH2qh+k5WLr?=
 =?us-ascii?Q?rnS1lCQ6FEEv7WvcaK7zy8nqvFn1iHu323PZE7Ft5hZSzKlToU6B5xskQya9?=
 =?us-ascii?Q?874DXHpGzUwdfCUlM333cKIqmxm4a3lRgyMvosBGRBMOTNRzCtiz6WcHSSYu?=
 =?us-ascii?Q?ogwNvj/Hk/WhDVwc/nKz47JK6aKUHpBV5CucX1HPfdlBzQfE6MvGisWYgBEI?=
 =?us-ascii?Q?NMI1mtDYglj2ma0akve3G6hMTaJnbqDU9YyTdn2AwTayC7QCM2gyM2DRVF+U?=
 =?us-ascii?Q?rTngZ7rqwuLRD4ytiGeS6VQhujvEchAaB7hrDl5uKH8X57C2fcIzIxvoNmMV?=
 =?us-ascii?Q?BcPNxwV4lXKnK+lQHD6PWHbv6GpEiKM90wkOIcbSvO8JHiV2a2M9e2cmEif7?=
 =?us-ascii?Q?7FNOc3tO4P4Xe1FFLDJF2IvB7jNKfxFXiYl98TiOFrk+lPwQa6rolb/eiLSq?=
 =?us-ascii?Q?n9K+DNLfjiPpa9ESEPVWMozbUhEpe9FKm6kYk3R7mK14/RwpxOXf47MB+RlY?=
 =?us-ascii?Q?SDXL1ZFt5xrEzQEgqh6jckW5Qat0sFvY/oPosYzV9HT/KdzgDmweQR7ICA/O?=
 =?us-ascii?Q?AYkJKuHGCOhygnU6fqAeZ7ENGRaQ55vN/SJbhzXlNDAF+ZfazRVxn7LcBp7y?=
 =?us-ascii?Q?blf3untmMNWVdedPNZYYxw4zIZie3v91?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 18:39:18.7810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c96b7be-6899-4369-f778-08dd0f12cd96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115

From: Penny Zheng <Penny.Zheng@arm.com>

In Xen, SMMU subsystem is supported for MMU system only. The reason being SMMU
driver uses the same page tables as MMU.
Thus, we make it dependent on CONFIG_MMU.

Signed-off-by: Penny Zheng <Penny.Zheng@arm.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from 

v1 - 1. HAS_PASSTHROUGH is now enclosed within "config MMU".
There was a pending response on
"[PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU"
that it might introduce a bunch of #if-defs in arm specific common code.
However, there are alternative implementations possible to reduce
#if-defs. So, that can be decided at a later point in time and should
not block the current patch.

 xen/arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 15b2e4a227..adebf8d5ca 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -14,9 +14,7 @@ config ARM
 	select FUNCTION_ALIGNMENT_4B
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
-	select HAS_PASSTHROUGH
 	select HAS_UBSAN
-	select IOMMU_FORCE_PT_SHARE
 
 config ARCH_DEFCONFIG
 	string
@@ -78,6 +76,8 @@ config MMU
 	bool "MMU"
 	select HAS_PMAP
 	select HAS_VMAP
+	select HAS_PASSTHROUGH
+	select IOMMU_FORCE_PT_SHARE
 	help
 	  Select it if you plan to run Xen on A-profile Armv7+
 
-- 
2.25.1


