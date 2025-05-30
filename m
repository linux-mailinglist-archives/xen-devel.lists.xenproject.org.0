Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A3AC8D4F
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000709.1380899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySE-0007MU-AU; Fri, 30 May 2025 12:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000709.1380899; Fri, 30 May 2025 12:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySE-0007Kb-7Y; Fri, 30 May 2025 12:03:18 +0000
Received: by outflank-mailman (input) for mailman id 1000709;
 Fri, 30 May 2025 12:03:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySC-00076q-SS
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [2a01:111:f403:2415::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 110c29ae-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:16 +0200 (CEST)
Received: from MW4P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::25)
 by IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 12:03:12 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::22) by MW4P222CA0020.outlook.office365.com
 (2603:10b6:303:114::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 30 May 2025 12:03:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:11 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:08 -0500
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
X-Inumbo-ID: 110c29ae-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GElndKOkiJUAUW/w1FNZ82qllyMNIKHwCZ2eAoLTdN9/qNzHTunAr8MpDFSEeaGW4wZ4JpZeISFTy0mA6LaHYbbXXUQoiiXSVjfoacPvLS5fC5h9c4WMn8Z6+UmFE/IsUilpMG9jt5uuswQsA7Uc6D/5XzVTwmizHaPCpt7/ocJBqgpM99XwWNy8tBkOC6AgB671qITGOURF0MLi7H1ItFfBgEOm4kBAhlQjCtdhCdlvmIHzLqYgOWBifeK1qP8OGxdN0qfG5qUwHlotnDpKmrroTp4cNBx/5zxQAq0uVUsxeKqTGsAA2ofzU9wvf8Accdn6IeRolvZpjC0836RwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7W+IdG09q2V5cYYJHkwKMYlqTJGKHIna1geSKV6F7AA=;
 b=GLS/xmZdvkTdoz+qKAUeT+Vf0kiFv7EmuMgXOO4LEngiJbyQDP9j1hYZrErCafuRv3b0VpgLwgoCNoSChoHjkdhvCuBoCbFrQkA4/IxcW5H2TReGHVLi88b5ZWBYKKNskd3KN2VlKw+pO6Hz+yu0ixqZC6dWYKuC6eBgWwNd9f2LpYDqzMJL7vHnXxdUKEooiAXx2aUJE2/kOA/+AP0NDODx1JGimPoMzcqFnDRudVlpmGCSGBPGIvYwvY96t6R1X2BKUOPoYaf+WMCOOSc4nnp08oNahc3QCupGkCbzw3rTTJf2Rxl7/1KZMSx7vrPJFxAEPSpSg/psecuDqbmHzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7W+IdG09q2V5cYYJHkwKMYlqTJGKHIna1geSKV6F7AA=;
 b=e48aPTwUY+D4EjXB9BApGt6oqm47vsWjhydVbHcVcFxIALuNqhFjzaxsPS98yIIhyyYxR7Bt7llTtKah25y0EOiBQDdq+c0lIRIDarXx5YUT1Wjy/MZbn8hB/tOk48SOzOx3GtAef9ry4giI87ZAeEqjUsF6WLGWoeDNhpLZi+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 02/19] x86: Add missing pci_dev forward declaration in asm/pci.h
Date: Fri, 30 May 2025 14:02:10 +0200
Message-ID: <20250530120242.39398-3-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530120242.39398-1-agarciav@amd.com>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: bed11e48-bb67-4927-65ab-08dd9f71f34e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UKIMEIcjSWF/2ZKSXm0OXI7R9bWaB5oopy71E8ISHADMJmCf/5FEvCjyJBEA?=
 =?us-ascii?Q?Ii011HVmJWZHKbSvZKGPF6e/fSomdvyYS8Ro4eeYyc3ImvAXUuAvKpgnrEIw?=
 =?us-ascii?Q?N4OauvoFQbuatXpRpGdlJ0nnOtbC1CLlx7hwgsjoPFsHbT6nKQVtFKB9yQS5?=
 =?us-ascii?Q?nY4DPh+Rht9b1VgNWJck9hLGNM2Aqdxt1VNcp+/4hE5GvpzRfB2jEZ3Ff7Of?=
 =?us-ascii?Q?zy+MgzQyn4MT3szx1l/7KE9Cx6ugMZw8bwFoYijvCabo+bTKsJijEFZgk/jN?=
 =?us-ascii?Q?vOjaFfM8YIgJWzmzSobFRSv6Sx3YRFyhvVKN4V1jmgAJMzVVDevq2GLazDui?=
 =?us-ascii?Q?/+vOcHsB/0zPLIKmqqWbuqnpNS6H2QPEk85iN5Fkw2KAjbp8/GUo0q0AboTJ?=
 =?us-ascii?Q?uR71DSx5AyvHvXGGYogKVFU0iCyS5sPmQWXytqmzoGzyX5KYzGnykGy+amTB?=
 =?us-ascii?Q?vvGXA/47H9NARbzuSthiAmXiZ35Ub+TDBQOQIq/hOiPH0fxt5J2a2KgxY7qz?=
 =?us-ascii?Q?89aRFl5IVY+EQtAqR0n6xNE81J500+K2fr33hbHeO+D2GNIUMaVbVfYDoNC/?=
 =?us-ascii?Q?qRvW59v10ftqKBTUn2dILXuCH8deV5XStb6ovXRaJCXzXdKn0z6XO4w9d8wu?=
 =?us-ascii?Q?NsMqquXzDUzA0sd2hf8Pb8KfhuxVR1gO2FNtFfKMXH24aKtCYomGig45K6ds?=
 =?us-ascii?Q?lvF0moSOrOLURe5W6yCuwEonHBqqtiiFgS4VOA3W007h5V9SqfiYr6PEW59J?=
 =?us-ascii?Q?xxecOCCOtP0Yah7BMdTA0X4AQRAavms77OwSz+lPFtnHbkEdIdf2JwUxx97f?=
 =?us-ascii?Q?ZHS0+DcPtOSsjKbiEXOom6kXphbl7WqJBrc7zjwxGIOhA3I25+Ci5BHBo/JH?=
 =?us-ascii?Q?bkqN2bf5a6OxjNSlZVbGkVVP8yJkpMzhBb7zPKud7MpsIfBBOop1OKxa/tk3?=
 =?us-ascii?Q?IOCuzs3z/Y5s/LSPuVGNknw8vErH3L6Chw4oufe65dAwVrXitHagkYNhsAtl?=
 =?us-ascii?Q?3gj94QzNHtkRHp/O44M5N/vZiiv4fhoFk48J/IU70S4+iTp/TxoHSPVmBFao?=
 =?us-ascii?Q?mFqA8q0P0xNFE5L7L5GF41rTi4Sf54RFwBo7vJXZdcSVdm/pNarvm75AkcUA?=
 =?us-ascii?Q?/bBsN/2+ECLb2FGcgOcAa247KiyginBDhU6XaxTtj7KMQqswDExbfg8A38Pr?=
 =?us-ascii?Q?md4smBEh/Rqmwi48+iOTROrXwpjMqmXMj9bsm4iF0AIOslXLKzQGflN1RcUo?=
 =?us-ascii?Q?IlYW6fZBMLmMUyxzJq1uan02CgImkzkcKltJHhDXygNFqwO7PJbSjMIgshM5?=
 =?us-ascii?Q?lxWPfDc7KNNEs/0bfydVe/bs6xc4c6hyQfur3xD7Nyq8qA4Tl1o0hZT8B20G?=
 =?us-ascii?Q?cJnw7cNOYvQSfkp8aZnmjsDkoKwpli93Tb129rCVSVQniGOxGfpDZ5AcLrtK?=
 =?us-ascii?Q?WSwS/v+NKYfT4UiqKx+eXcr72fqlaKJYRGI27R0CpmdsRHiOIEkozJmhf5zr?=
 =?us-ascii?Q?OowJcdYeuS+bPHN7AjNiL6fcmI6STeTWe2DI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:11.8064
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bed11e48-bb67-4927-65ab-08dd9f71f34e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/x86/include/asm/pci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index bed99437cc..2e67cba8b9 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -13,6 +13,8 @@
                         || (id) == 0x01128086 || (id) == 0x01228086 \
                         || (id) == 0x010A8086 )
 
+struct pci_dev;
+
 struct arch_pci_dev {
     vmask_t used_vectors;
     /*
-- 
2.43.0


