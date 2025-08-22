Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89374B315D3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 12:53:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089852.1447328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPO5-0008KA-Gs; Fri, 22 Aug 2025 10:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089852.1447328; Fri, 22 Aug 2025 10:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPO5-0008Iq-Ad; Fri, 22 Aug 2025 10:52:49 +0000
Received: by outflank-mailman (input) for mailman id 1089852;
 Fri, 22 Aug 2025 10:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPO3-0008I9-RT
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:52:47 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2416::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23649005-7f46-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 12:52:46 +0200 (CEST)
Received: from BN0PR07CA0002.namprd07.prod.outlook.com (2603:10b6:408:141::17)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 10:52:42 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:141:cafe::7b) by BN0PR07CA0002.outlook.office365.com
 (2603:10b6:408:141::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.17 via Frontend Transport; Fri,
 22 Aug 2025 10:52:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:52:42 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:52:40 -0500
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
X-Inumbo-ID: 23649005-7f46-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uFl2CKCd2RMsm6zLQ39Nm33dfiqGqrkB9ZB5pV0ED6toXltL9y6M03a/KaPIPezL5yBxb3VwR+8HF8YATfFBbYzjda+sxG2ebzUM5vx6X6JGt1YB/hSYhLoux1+Oat0aqyq1iV+vH2CDZtDm8W6uwbvggwxq7NZczNXHwYFhe6CvHL/q4YigB2+ZyLl2burOIB6jeNfDoBdgG42Z/DABBDveMO5inVwTUYLwioYkT4XWiTfzAtyoFPRuaJYCNN2IDn3uhLFUneSpD4NxaeByKK7XxzYHZC+VYpyLfZgNYevfURy/mGWz8eLq25Tv7VOxI2XbhZdTKEOcsdv/xGgXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ea65rT/DwyBU36yPgoQNYnqUqzGgkzRL5+oGvZ7QCIY=;
 b=B3FBw0spx9jMavEfkRg0NO+Q/4/i4K3IW3F3wGrofwUmKJ6GmQcZw/FK4PNdlepAswc5om0++X4qy5eT/xwBdts8bjMSx4d2UMbUx8C0SCPGXzP0/8zFf5wfOVeGIbly4Yl55Lx818zlnTU4+tIKAcypr2LzhAq7lhInww9tNA2YbU3FTpCLDB4iUcAPD7N1wIyo5vb8Za54SwO2exAWxpgjEfT8f8TpG7JO2qOfIBVM+a+0DVZB732m5rUpCBnrZW5bU3wrWdL91QWEDWmngIQswl0SYQCOJI/P9HOdGCQsyFWMAHjjPmyROGtCF2Y7b4L2qwP9hxfVe+SuIqdZIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ea65rT/DwyBU36yPgoQNYnqUqzGgkzRL5+oGvZ7QCIY=;
 b=eGhtFjTCOd7tXIpjmedFFyp8wBuCxzQK8Z6wj15ROM6JNF+7wbqoBfmHmnxqbsc4NG62D2NGcPuc9qDyELphcjOnVaz/AUfzUgkBubPPZ6vfdu6mWKaOtaN47VJk3PRMrXf/rik4b9Q3v/mxnCrGzgfW0uo3xxecpOZmiqzvwuQ=
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
Subject: [PATCH v7 03/13] tools: fix help info for "xenpm set-cpufreq-cppc"
Date: Fri, 22 Aug 2025 18:52:08 +0800
Message-ID: <20250822105218.3601273-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822105218.3601273-1-Penny.Zheng@amd.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|SA0PR12MB4367:EE_
X-MS-Office365-Filtering-Correlation-Id: a82ab959-c026-42ba-d53e-08dde16a0511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/YB2P3MrvBTOBCcRy+2YE2SCamW8bStiXuxhBTuHEXQIjDV3EFpv5B3OkaZJ?=
 =?us-ascii?Q?cFdecT/yJAnFmaZvJzqlqxCD2ERg+wd7IO6a9uAa7g8ieRfnDBrKfeXEhy1N?=
 =?us-ascii?Q?ee0gQ/7K3MdxqKMibRLeLw6qEkSIpjuElNwwzVd9TJfZ6JxJDyonoE2+iqoR?=
 =?us-ascii?Q?PxjDFWQVWNpivpZ3TogJDOWX1Mqq1eiP08HPIxkJNB2OjM3KK+CC8PmioNXb?=
 =?us-ascii?Q?WclqTS5axM43sx/WJrhFEP1xlZRiiW6P9srcScwqsFV7QkUQQVc8qb5Kon2L?=
 =?us-ascii?Q?hwzeXFu2BxwEOd9DRlbkc7Y4BfZFICE8uB4AF9VcUsvk8UZmLTakBmfK6HpX?=
 =?us-ascii?Q?Z+aGiaiFHfY8xJyPy1GGFZVCyrl75cx1AAmHsrvgL7Efj4+Ahq9eDA8KalMi?=
 =?us-ascii?Q?IFeX8xBYPRPw34RZQ4wxZSh1adR5DNem1sXmHGiL2sBsSXqkVj3mIURZgIhQ?=
 =?us-ascii?Q?0SAkA85kSdabJLDXoRKFmaXgYFr3G9o5AKm+pD6+s/QuzE5RYuwpR1Cuuw4i?=
 =?us-ascii?Q?xv2gpOvey5BQ59XIOpXOmzQLYVWThAuPBucV4Y8ZRkR7mJRfAfwPCvqzAGYK?=
 =?us-ascii?Q?xkB6rcfNCvEkqFt4rbx8v+GUb3O7WGKnkQNqH0pc1dcAuiZfhcVqqdBgF35O?=
 =?us-ascii?Q?AmIWG265HCOMAhAme8+y1tyK4G6g/XWdWHYf9nhntArMEAv8qIxJzZxQr5u8?=
 =?us-ascii?Q?3Zl8BACPjdsWKb5CNxt2ux79by7DXlSc1aqeCYsXywPsn3pP8rxF8eAi3XPN?=
 =?us-ascii?Q?aC9MigTmoQhDGZ7exomgcSL19mFYZf5DQHN62G5sY+dPWVCYd/tvlDxellKq?=
 =?us-ascii?Q?j+/AIy1nN6+m1akf5zcY2Mg2wLz/MczreoqXzxVm7q88Wvxu74NL9zuoHTpO?=
 =?us-ascii?Q?TgA/xo1C8cRl/0McJUufJn1CnBgAVLit45CvbIg3tZxxEwypWYMavd7Uv/1B?=
 =?us-ascii?Q?4Mb6xZ6HxJN6TaKYU06Vm4rXtU+uOzn7Bv4SkxpLdeo8tkmutAAsm1DW4e7I?=
 =?us-ascii?Q?UG2snuHRtYDtmwpjI7DjkL0b3eRVchcoY3caEb2RusfIzaTLXdn4JO5axSNL?=
 =?us-ascii?Q?ZhPpP0jM61fQdk79NRcWyX2ebOLZSnW4yqsuPmbfUlQvjf9oZTs5PoD7IFG5?=
 =?us-ascii?Q?qSndqQT+XlMkcukrBFLrSJz7VpYGntfq6boAKykd6gfD6M1tX2027nHJ3w6l?=
 =?us-ascii?Q?agtD5lEuaHBSB85EoZo2dKrPGTkMhoa62INN9lTcAM1hBq65pLe2WFiGbEmY?=
 =?us-ascii?Q?cbzPMrSG7gOL87naY0gyJpf1Dfe0HjIknLDMbrasACf3M5LugHX08+zQd8C2?=
 =?us-ascii?Q?2wrYvW0lmubehJOKj7r2/mZBQpW25WghewJl4Pt/xb9zkQZr3CcAR9BWZ+LI?=
 =?us-ascii?Q?PEtkzE3mrhfcWKIT14j0QlOoWVSOVjYG/K5HOsl0sSZUQ6g2TS2bqxr1wvmo?=
 =?us-ascii?Q?tZVkmdFC5ZmNf16khdZ3Hyhq04ETgE+0aSAZHgDYTVXwN57hGYsLZ6LCzZBc?=
 =?us-ascii?Q?pa3xOiy43Wo2SG8kFE8ICfeao3wDYfkuUwzP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:52:42.3883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a82ab959-c026-42ba-d53e-08dde16a0511
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367

Change "balance" to "ondemand" in help info for "xenpm set-cpufreq-cppc"

Fixes: 81ce87fc5e36 (xen/cpufreq: rename cppc preset name to "XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND")
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v6 -> v7:
- new commit
---
 tools/misc/xenpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 6ba7cb2302..6b054b10a4 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -69,7 +69,7 @@ void show_help(void)
             " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
             "                                     set the C-State limitation (<num> >= 0) and\n"
             "                                     optionally the C-sub-state limitation (<num2> >= 0)\n"
-            " set-cpufreq-cppc      [cpuid] [balance|performance|powersave] <param:val>*\n"
+            " set-cpufreq-cppc      [cpuid] [ondemand|performance|powersave] <param:val>*\n"
             "                                     set Hardware P-State (HWP) parameters\n"
             "                                     on CPU <cpuid> or all if omitted.\n"
             "                                     optionally a preset of one of:\n"
-- 
2.34.1


