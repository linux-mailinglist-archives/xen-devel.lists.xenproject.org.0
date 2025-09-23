Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BFFB943D2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 06:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128134.1468656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uoF-0002cg-2I; Tue, 23 Sep 2025 04:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128134.1468656; Tue, 23 Sep 2025 04:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uoE-0002aD-Sk; Tue, 23 Sep 2025 04:39:22 +0000
Received: by outflank-mailman (input) for mailman id 1128134;
 Tue, 23 Sep 2025 04:39:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt6+=4C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v0uoD-0000c8-G3
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 04:39:21 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4475362e-9837-11f0-9809-7dc792cee155;
 Tue, 23 Sep 2025 06:39:20 +0200 (CEST)
Received: from SJ0PR03CA0361.namprd03.prod.outlook.com (2603:10b6:a03:3a1::6)
 by DS7PR12MB9504.namprd12.prod.outlook.com (2603:10b6:8:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 04:39:15 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::47) by SJ0PR03CA0361.outlook.office365.com
 (2603:10b6:a03:3a1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 04:39:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Tue, 23 Sep 2025 04:39:13 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 21:39:11 -0700
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
X-Inumbo-ID: 4475362e-9837-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMCuuInmbuamk9pOmLikTSoVcGfXLZfioVcGYZ1G8XPtY7cB5KHsMK7Zkezyz/dAhi9SE52J72w+yQfBCdZ5CAj87PEjXu90KzXuWnwOjN3ejoQDha9p0be5+AetFBnMf2LIlgtLs3s3ydNGeOSC27J+3qhLTdoNve7aF8ToxSP1Yn2qmL6Tge5Yf8n3EeWdRf7E1GyBnQ/wRO0Izo90d+j60X79jR46YtHBpaVr+EpEXoQCZPoyW6FUKTejR/BrPAIaQsjA4Bxtxzytrd/XWek0AJ/kVqfepzzPDnDENnJyynZB3Z7DqbEVru/w0p0Nr89bu2S9BI+HfRAhCPfGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHSBHsvRkf7cyjctVbYI9tR84Fi9705tET1QVUrA2lg=;
 b=RWQc7fS4etCpAO52vDgkxYSSC7PLE+kM2K+4clS/ahHD4xJso+Che4PLrlA+fciQMBJw/zZFCZ2w1erl7H8oRHAk6koaWkiM801cs81XLbyN7kCv88YvZ1A4+Q4dQK43Jver7E4pfXc9WCIXu02YGlpCxyrU9yXzclmKacO5XXhDOjN/sPTRzoGWoQ4sSdcrz+1fQJOPucisdSd+C0xrLyFs8wCgT2w78ufRmCHPLKvtnHyWFrhw9aFJwgIrag5YwY3b7B6NALDiwZvbXO7mjqGrAnautqdkw4Y4wIz6LoWRCKMoCs7AsQfY/IjY9EFyckWLcmKCoklFm9EdMyIyrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHSBHsvRkf7cyjctVbYI9tR84Fi9705tET1QVUrA2lg=;
 b=RtWaNKMXpvqkK4JgHd6bvuv2Gjp0nQj7+CBlEwfeP1+EJBOpH65Hat46xiGmd0oiTd7mI1B1tFzAUg+Grste3Om3V8sAANmrmVGfi5foll+xbaIdgQ3oQ5qQpr58pSyX3iPowCsKLVxzuSLQW29PSgqWFAu1vqzUWgSPQuTImTQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v10 8/8] CHANGELOG.md: add amd-cppc/amd-cppc-epp cpufreq driver support
Date: Tue, 23 Sep 2025 12:38:26 +0800
Message-ID: <20250923043826.3831957-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923043826.3831957-1-Penny.Zheng@amd.com>
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|DS7PR12MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: 945c1050-1902-4975-cd52-08ddfa5b25c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DV2wq/6a7htnZ1kQFolniRfI3bTrPvgpnDb/U/pK4YGr75e6v26QvKYASbIp?=
 =?us-ascii?Q?BlcGYARtCxI1/u7cK39CtBrxyOOyyOCvhY9YlNLivGuXkriTuWOmS39CH9GJ?=
 =?us-ascii?Q?cU7BgrZlx8f3gD6ogo0IBD5xtw175J+M6dWGRlfWOXa8gFYR2km1qvd7+/n0?=
 =?us-ascii?Q?PXRObi0B6Gfcs+QB+LCraIJFK/mXj3TBTjgpEldQC/sqPjIC9GQkE8+GAleL?=
 =?us-ascii?Q?JSXXj9n7/8RP8+YVfARg7aWybdsxsiOU/IxvbI9Q4gEM6JyNPpWtKih1wzV7?=
 =?us-ascii?Q?EfYbRH2lB3frE4US+S809t3dgCBDKwcXgKZIjss3qqczxV0KQKTJ2ljNGmtw?=
 =?us-ascii?Q?e8qwCLYR65DBDkd85wINUwaAzkYmwh/rQ+iSTF5umnTrnqiViqpYuPDVAWb5?=
 =?us-ascii?Q?H8vys6miiJhEga2I2q586fK3AT2uBonL83rB5H3hInVX1p8HDiWqxW/euvfq?=
 =?us-ascii?Q?cM8m+e+5P7z8H4mUb998DJ9n8mfVDMy0LPwAJ//Hd2AUjwP8USZn3IvXPN26?=
 =?us-ascii?Q?IXBM6T1bNDaMLSS5cOCLLZxbpZH/LwSZ3FWnYnAkOivtmTnLz68iWKvoHdlK?=
 =?us-ascii?Q?EgpTM6jfqnHY1DAAHgOfAJtb0ve63VKHf7FENjUlhDbHKvb/j2WKn1FSoHd6?=
 =?us-ascii?Q?9lKEA2KztIKXZ77IbbLFzuqBzX7+03dK69OvZPXG89pHIwlU2MlxXfS/dNiQ?=
 =?us-ascii?Q?fUDRLpurLQBgHzYhybJnqH2iLrHH62KWcVya9mLIiTLaGHfCOjCeyfa0UPS5?=
 =?us-ascii?Q?nmYBCMdcSA6JIQdvSvEkzp9ZGv/Kvr7y7J8dq0EtS+5A/AUKyB8QDaZhaH+q?=
 =?us-ascii?Q?fwcaalojecec62lQhS5zWJt2LMZ102lEjlC1iVmhSTkkUCauXQwfwfUqipNl?=
 =?us-ascii?Q?F8qLFzxFxpu01SDz+bvcJYx5K2YqCcf4zqjyc10FfM1wwV2OnrfyFYqncqvB?=
 =?us-ascii?Q?jY1aRPeiPsjMD796mo/FGlh9u1lBqLTEYgTOsVkhqoGCf7GPLmU4WgxLLgUz?=
 =?us-ascii?Q?RCvuI0dYA+HRozYmIQidzj2cuRKSOdzjPISsiSXS3GFbiTyTvMBuRERh6Rt/?=
 =?us-ascii?Q?8pHiDHMDiw0TtxGPBDZqpWYNKN7+acs4gW+0KohNnovgshVA50DqizFuQS7t?=
 =?us-ascii?Q?X/06Yp0jZoXVa7mFpl1q5IBogcDsNhigrs7EW+lVt0XEIMUsrXtLXwH6sCTk?=
 =?us-ascii?Q?U6sGUv/9chT9Gpf1vTlwC12+4xDQL1l38umqlJk448jJBP5KhImwesRgqHlW?=
 =?us-ascii?Q?hbwry+qIjJVVUHBYRxi6zJUO2HxW3ptjd0803udGQX6psiGHZejkkaCrK8tl?=
 =?us-ascii?Q?cSR+61Nt1VjcIl2YpwTBkqeKkR4bbBPggmW2A1KchdyJ5x0t9qz2tylaYDzy?=
 =?us-ascii?Q?skQFs0wqhjbP9cQWXafD3H5lgjHpz6NVbPvS3f/gecW1lejktXAGPO5A1GGO?=
 =?us-ascii?Q?sG/hVnE6T8EulD7BvLxdecWx5pwaxci617P8POp5wuQTkWAJCSL8Uw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 04:39:13.7379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 945c1050-1902-4975-cd52-08ddfa5b25c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9504

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v9 -> v10:
- s/Support/New/ and add a full stop at the end
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ca1b43b940..7b9518ff08 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -36,6 +36,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
      Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
      and 28 (Temperature Probe).
+   - New amd-cppc/amd-cppc-epp cpufreq driver.
 
  - On Arm:
     - Ability to enable stack protector
-- 
2.34.1


