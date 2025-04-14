Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6509DA87973
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 09:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949257.1345863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ecy-0000gV-IE; Mon, 14 Apr 2025 07:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949257.1345863; Mon, 14 Apr 2025 07:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ecy-0000f2-FL; Mon, 14 Apr 2025 07:53:12 +0000
Received: by outflank-mailman (input) for mailman id 949257;
 Mon, 14 Apr 2025 07:53:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQal=XA=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u4ES9-0008Gw-4R
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 07:42:01 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2414::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee69063e-1903-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 09:41:53 +0200 (CEST)
Received: from CH2PR10CA0027.namprd10.prod.outlook.com (2603:10b6:610:4c::37)
 by LV2PR12MB5821.namprd12.prod.outlook.com (2603:10b6:408:17a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Mon, 14 Apr
 2025 07:41:49 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::b5) by CH2PR10CA0027.outlook.office365.com
 (2603:10b6:610:4c::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Mon,
 14 Apr 2025 07:41:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 07:41:49 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Apr 2025 02:41:47 -0500
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
X-Inumbo-ID: ee69063e-1903-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpWKGnbx8H0C1gEOaMKkwAmKZPMz4c/ffzsiMCO7TyfLVxHoVFnccua0cLQEiqJcL3xeEhCcCA/pLV5yPu2/z2Z9EvDQzcMLWy3xWKuClmTO/fEnbPQYVW+ZjU3tjbU8w3+zQPcaG8B2To5n691ac9sAZuWAKV42VspbDWDpOyJJkg/F3HBeYYLpPDqmaZqMBgCDutJpqJTWP6daDk4Ery7YVm62y4UegDb81NUX+THUI8Y1RlHHT1Q3kGeI0W+6NiebnGlVvrh9sqtwNU2waQoQ10epG/RioQ20ZukHENvRxx/tVPx71Q+LaOYVGEyAIKGrb2aqvEl3rCovhh3Srw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQ6IKFwoOiNVPqUnYMNxWzVc31zW/m6vlk2dZys3K5Q=;
 b=tMYu42lpZ7chyjhHHS7HW/yLeNpUPUdGlVVme48umsGGmkmVDYJ3ljMWabg1j+CxDg0rK2nEVpLxbeLGMFGUCCjyGnIkhAOs/KqtTJlPg3isOApVOZKhlSqFUzUOW/AZsUnVo8NXr04mtC/eHiD7RwWCNfji6n9zREobJ3D5z2X58k2SGX4tzVluaQzv42BrYWdS1oJSJZ2+bymr1GMF2pqgcFUe/hc4/3Dolxz4W59ajAaGCLcZkkEw2Nv/7XrM10ebobBHwadNYnP2DFGdAhiv2kYnBp158SnPOj4SLv8ogU93OtUdVg2vnrhfWC6cSVx8zTv5a7oGDPiLTHu3bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQ6IKFwoOiNVPqUnYMNxWzVc31zW/m6vlk2dZys3K5Q=;
 b=Id9zIId1p+qRHDUb9RldAz0CZCnd163Kqrg3cThKYS3YQmWvIOreA83b76A38HP39RxT8Xn6T3kWtUS+V2KeWheeWpP68W2hqHahXkKJMX7v3xat+dEB1/g+T0gihWGxAfuWK8Jfu0TBFzgXbSg/xDqNw6h1dPSiclJgjXi5D0o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v4 14/15] tools/xenpm: remove px_cap dependency check for average frequency
Date: Mon, 14 Apr 2025 15:40:55 +0800
Message-ID: <20250414074056.3696888-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250414074056.3696888-1-Penny.Zheng@amd.com>
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|LV2PR12MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 678c420f-26bf-4cc7-ba00-08dd7b27d0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5SZxmmSOoZG1p3ARfzPgCl+QQf1W1JX8TAhY0qYhWUfl0XXJi01uAK0NsuHh?=
 =?us-ascii?Q?Hqpf4HVq/zUGXmqHSzrX74mc9x4KM0tFhWY7yk0r9JgdA65voi2JXxA5K7VD?=
 =?us-ascii?Q?1KBlq6mo2yWTlwJJRoX4L2Tf0o9Z1v+wk+KRkdJ8WDtNQs6Xsz9jfEVT1FIE?=
 =?us-ascii?Q?hkD+OmoJ83FViZ4jBzuaSsArXVHzZl00ufcGoBsgPlhRJaFMU1ySENs7b1Ca?=
 =?us-ascii?Q?XdCbZxk70IFu8i71u1ZX6RSzO/7AIMCuZNkLG88s+J7HOlU25Is7oQ48K6XW?=
 =?us-ascii?Q?r/51CdqBH2wiO2G2WiwP80Pn1DHleW168T93uc+erEv91lSZcjyAyPizgCNe?=
 =?us-ascii?Q?1OgH7c4HhT9bAUEKJ6iAycw0oQcm/6UZyY0lO8GzCBjl5cfc1p5nGMKfAJHK?=
 =?us-ascii?Q?qtzGdDeKPAj7rJ5DSCfjRORxISBV7g6dr9yoZDhGDwanvc3UEaFAeH8nk/Yh?=
 =?us-ascii?Q?5wnQlNN0luNCQeS3Z5bHzTy/4IeznZFrCagz7t67NdUGohV8BLuWhibg9CEP?=
 =?us-ascii?Q?A6uIg8CelcqRBC2W7LKRlV9g+qyY2Td7hzslnw/MwH+GnyG27+uFuko4t0By?=
 =?us-ascii?Q?Zi2MVFy3CzSKPO9B0uebUJ5h5ZtK5FOJk+T7jKvZp5/x2LFhruXcLyomMmFC?=
 =?us-ascii?Q?DZ4k0wYYSYiEuu/2k7Q7h4BT3IxTrrOsfIxf6HO+dfvs1BVGUAhBilZn7/Mk?=
 =?us-ascii?Q?rQif9+LBYz53gyUgXeuE/yWb+3mJoeJxejmk4p4eY4ESAtj85FT1Ng/xlaHr?=
 =?us-ascii?Q?phRBgpvZ+i5NLWPGnThTXp7rFzaUJyWrSiLHC8jkxdysqQXj1ZcXcWw7As8C?=
 =?us-ascii?Q?aViTu45D2aJnw36qtMhyqu7+ICUQGWJ5W91NJUQgLlvcAO74NlZciUe6n8ZV?=
 =?us-ascii?Q?+uXqiCwqZ2yHvUmmBHFDUQfCPNdz8nD7NNxYpWM84QdAhlpa6+kYASTp94ot?=
 =?us-ascii?Q?ihKgxHzPuBlUYiEpn/sOTNKw9avddcvR4cR01yLS/5rSoVrcjLqFfi9ip9Nc?=
 =?us-ascii?Q?DFVnl7OvT++jTUSTM67TLREARcHbe9qjRyxy2jF99U7MsrjcljUqaBwlTr/D?=
 =?us-ascii?Q?oI+vTpqwg7tP19uz/4lAHVtKi4wRvAGAc0ImVFnVj0Nmv5ELmOn36fgfDh3B?=
 =?us-ascii?Q?MwIeUI3DQyOse5aZTiWKsBXgRYvnUJFi6kOfMNvEnkbLWk4dBfLPQjfYWMw/?=
 =?us-ascii?Q?Njuid0NJe2Z92ZNJ0AZUd9Iaze3dsYr9OguPtBrk6FRQFBgXG6GFVRNHVbxU?=
 =?us-ascii?Q?z9T7ue3kNcHJQrFecGE6YTx6gXdFyj1qQG5iXjBIlea6MhNKC+sj2wCNNkDq?=
 =?us-ascii?Q?K6OD1TlKcZvSF51Nzi26Zdy3us6TDoZ//prqR5LGKa0zwtVEs9RyQvQVBkBO?=
 =?us-ascii?Q?71Q8JpEJs6lGje0Bn/XXR28assJD1MEYNPdPQbMneukg37eGWjUMCHxpeEG4?=
 =?us-ascii?Q?E0OigxnQwQE7rFETbtMNIlQJPlAfn31kUOmQmvSWG/AJHINTw1v/zAcReOux?=
 =?us-ascii?Q?uZaDP4akKL51/vxxsZQdqkmCDuQOAkF9Cs7p?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 07:41:49.5730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 678c420f-26bf-4cc7-ba00-08dd7b27d0fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5821

In `xenpm start` command, the monitor of average frequency shall
not depend on the existence of legacy P-states, so removing "px_cap"
dependancy check.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- new commit
---
 tools/misc/xenpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 29fffebebd..b823e5c433 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -539,7 +539,7 @@ static void signal_int_handler(int signo)
                         res / 1000000UL, 100UL * res / (double)sum_px[i]);
             }
         }
-        if ( px_cap && avgfreq[i] )
+        if ( avgfreq[i] )
             printf("  Avg freq\t%d\tKHz\n", avgfreq[i]);
     }
 
-- 
2.34.1


