Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DECFA5D502
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909773.1316703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQc-00066B-Ho; Wed, 12 Mar 2025 04:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909773.1316703; Wed, 12 Mar 2025 04:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQc-00062o-Dn; Wed, 12 Mar 2025 04:10:46 +0000
Received: by outflank-mailman (input) for mailman id 909773;
 Wed, 12 Mar 2025 04:10:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNe-0006o2-5P
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:42 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20624.outbound.protection.outlook.com
 [2a01:111:f403:2406::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89aa23cb-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:40 +0100 (CET)
Received: from BN9PR03CA0384.namprd03.prod.outlook.com (2603:10b6:408:f7::29)
 by MN0PR12MB6197.namprd12.prod.outlook.com (2603:10b6:208:3c6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:36 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:f7:cafe::6c) by BN9PR03CA0384.outlook.office365.com
 (2603:10b6:408:f7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Wed,
 12 Mar 2025 04:07:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:36 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:33 -0500
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
X-Inumbo-ID: 89aa23cb-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itR7QteuwxKPEia8dcRCK40yPIbtBGxfhP5Crmsu0vGLErgXVkTaaux2Dr3aGvCPn44mri5hxYoQye0qaefZaS4ymyw939jtvNr+vWEYCpQ8nKZ74Idlq/LyPwrmROJBZ/XqfiAg/BJX4VAMmseN8HnfAgcBMPp8jAiiFvjiV3o3JLgrJjoIXRnQQ9lXc6KAJeTnX7s0kqDE9HKyhZsfTfa4S9oXcUD4PoKsbv3ySC7B2xc+zBurZ6xKr8rKp0vylLwl4pnqzH9/rxKPgbHJwDhpva/LdEoRBZBMyqe2VImLmrTvyDtLa6UZ4GTgHh157zjKtd+m8FonokKnfP7eLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Lfzt+raLQwsUIbWUmBDKcqwG8irJJi6lS1tTorK6i0=;
 b=keHig/CwSJqCm+BygZsK/GalnoeGLCY0A1v7mKeNotf6LFz80y9vfXp4P6grqKoYBRXFvFhMPIgXP1jAfXZG1pW6aV6Z7uqtIqLyVyfZ8rKp0OTO5a/xMVUsJ717vQxAIPO0S7j0O94N+/I4NsiiXAVZSa5Dx6zSLkLudH4onE78sA0ELbjhuyZJUVXnOdIOhbfv7mFB2vasSM+hwKJa/mUVWe9RF9kzMysI4LmdR5OxqVa2Jeqs7HodQm/g+TJK33arZ7MZMoqvilQnGE9/7YI91L7xaoBHRo6XnLEbgRK7ZpaO7ULr6r39RmmsGagYO9X0aosDfeLWpqsEmrXEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Lfzt+raLQwsUIbWUmBDKcqwG8irJJi6lS1tTorK6i0=;
 b=mOfxOI1LZXPsPfL7bNBWfXYK4NoNM7DihLf/RSCFDWu9CN7wGP10iiNxzKwyesgJWRI6vBQAW7AoXbDl1nSTzMvLxbw8cOLL27p3V/96Yjq3gRgD/ub85UkIIrB/x0PxJYSFnePMx9QluxigvF5fUl7L/MKr06K1uynorMBo/p4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 14/19] xen: make avail_domheap_pages() static
Date: Wed, 12 Mar 2025 12:06:27 +0800
Message-ID: <20250312040632.2853485-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|MN0PR12MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 9587c83f-eec0-4cd3-cb44-08dd611b6c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HUPmlz1eWS0DCTohCTURpWavb8aMlGx2V7TUuvRFVyCge+BX8sgNOcUEOZyr?=
 =?us-ascii?Q?uWQcCJFAMzqB4RSD1X+QfTeYC65BTghr+z9f05ZutdIf3dBK+PW53tmdDUCs?=
 =?us-ascii?Q?j9OIDJM1v2wv3D0AHU+Yd4JelGbnj5XBYGY1MhKk/N2cvieJ9lB8L4Vi4uJw?=
 =?us-ascii?Q?wW5rQcQgbktJObwyXwDS/bxaNJHOE/bE12OSFJmcGkfO/0Qitx0nM09urQqk?=
 =?us-ascii?Q?eaw3jiEyd0InuTDGz8KOoVjNnvrysVbIoEkHCNAFey+qg1+jvJYehwXxNrD9?=
 =?us-ascii?Q?/Xv42SHq5yB13cRQjAlVppeJBXLmYbKFtyUxvKkMAQw4M7YHIX767HFcccE2?=
 =?us-ascii?Q?o9rO3TGxAQGWcxMMemG2xRh0ODA5sKS1yKnaw4RS+RI//Ehn/FO2DSP5QCGa?=
 =?us-ascii?Q?8Od+ZQ2wUE1IASyM2ufYuyqIwtlnQPbiuGXvxIiaDo9MB3GCr3jCW1rWQXeK?=
 =?us-ascii?Q?xcoo60ioviAbtgKsjVFBrvOStK+BLWzfDJW+4Y5hBWRSo7qXnh8Ehs95LeUa?=
 =?us-ascii?Q?do9B6JsUVjHQ0IwXJm4QWZc0vdgH0ywmYgpFrPwEzqSi3Ii59Za5/HHG9Oor?=
 =?us-ascii?Q?hjCqOMduM/FtEhEWVTZb3ggZyhr24r2hf4tEnpcEc72IPzeHhftlGVFf35tm?=
 =?us-ascii?Q?wAChu/RQOMJ/P0zz5tm1U3XLRrC4d+NqFaU7ZStH6v59zQxFZ2T9/ZQS8WYa?=
 =?us-ascii?Q?Ou0oYXzOCjTroZt3zhqPlRYhJqOpyRUYi7LPKH/IsKFQYQSlEGwFpvp3p1ym?=
 =?us-ascii?Q?dMwrrVZ6CARzQO9489Q9CGrfT4o6lfKsOGRF5TXL+zFFF3Fc7dfQ9XQ0a2W+?=
 =?us-ascii?Q?iQxU6x39q4xibPLMSeJV76j2Ttb+udvYx63VljpBVui11NLb4GakL37iTBEn?=
 =?us-ascii?Q?zc/xeDiCbaN/+FQ+yd8pfModBUUA7eOKNzBu7ENRgZGATHlz8QViLBMB/Hq3?=
 =?us-ascii?Q?gVVxlaroGAIzOXGhm/6OA8Y8YdPe92VzLtKxAySbzRs7KfVpQRWW46w2yZVe?=
 =?us-ascii?Q?BPRiWWCcfuTwv0Zhwkec4HklF+gTtBKW5g6qaFnroGrKmzQxZ2FgZC2xy8fu?=
 =?us-ascii?Q?SfoxTYJW0uJvnnxSG+MgiW7bWNWEXMOXBLKbJErNI5wKzkKQjWpEAWh4Fmz4?=
 =?us-ascii?Q?sGbB4ae1wogtfBIrlpVlj86sIeMl1fRXhwOwl+22rud/3PCERYLYmfPd/e30?=
 =?us-ascii?Q?5G807PIJquRS2j+Y1mOqS9ctXDkVGdexb29cdPYGy2BQztG2Rstmd6MGG8Gu?=
 =?us-ascii?Q?6/VAgWp7BhMuOf9lMCa1Y2lYje2GPF74Lhw1nWk5QyTVdoWakq2aApq1qMC8?=
 =?us-ascii?Q?1Om6nn3iiRe7eQGr6UD+gAff+Wk5bKZyM9lUGe9Yqxdox2mYCO4/9klUJyt/?=
 =?us-ascii?Q?AXXFxtmfFYtg4wgdjRatQVVcIIyxK+u2dI77b/Le8QcGLyILYOV5/wBMcb0F?=
 =?us-ascii?Q?zGvooMPze0TkCy/OUy/JVYKVQWfyb0gRfP4Ne0t/NDKCvVhXrcxVIMvCmI2S?=
 =?us-ascii?Q?EhgY8s9jwgON4E4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:36.2149
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9587c83f-eec0-4cd3-cb44-08dd611b6c23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6197

Function avail_domheap_pages() is only invoked by get_outstanding_claims(),
so it shall be static, no need to extern.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/page_alloc.c | 2 +-
 xen/include/xen/mm.h    | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 7476d37238..5e710cc9a1 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2796,7 +2796,7 @@ unsigned long avail_domheap_pages_region(
     return avail_heap_pages(zone_lo, zone_hi, node);
 }
 
-unsigned long avail_domheap_pages(void)
+static unsigned long avail_domheap_pages(void)
 {
     return avail_heap_pages(MEMZONE_XEN + 1,
                             NR_ZONES - 1,
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 86bbb15890..cbb9f2dfdb 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -140,7 +140,6 @@ struct page_info *alloc_domheap_pages(
 void free_domheap_pages(struct page_info *pg, unsigned int order);
 unsigned long avail_domheap_pages_region(
     unsigned int node, unsigned int min_width, unsigned int max_width);
-unsigned long avail_domheap_pages(void);
 unsigned long avail_node_heap_pages(unsigned int nodeid);
 #define alloc_domheap_page(d,f) (alloc_domheap_pages(d,0,f))
 #define free_domheap_page(p)  (free_domheap_pages(p,0))
-- 
2.34.1


