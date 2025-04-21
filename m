Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 914E3A94D4F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 09:38:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961003.1352655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6ljE-0000p7-Vx; Mon, 21 Apr 2025 07:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961003.1352655; Mon, 21 Apr 2025 07:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6ljE-0000m2-Ru; Mon, 21 Apr 2025 07:38:08 +0000
Received: by outflank-mailman (input) for mailman id 961003;
 Mon, 21 Apr 2025 07:38:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kh51=XH=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1u6ljD-0000OX-EL
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 07:38:07 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20618.outbound.protection.outlook.com
 [2a01:111:f403:240a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ec3fd21-1e83-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 09:38:05 +0200 (CEST)
Received: from BL1P221CA0044.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::16)
 by DS0PR12MB7728.namprd12.prod.outlook.com (2603:10b6:8:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Mon, 21 Apr
 2025 07:37:58 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:208:5b5:cafe::5c) by BL1P221CA0044.outlook.office365.com
 (2603:10b6:208:5b5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Mon,
 21 Apr 2025 07:37:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.1 via Frontend Transport; Mon, 21 Apr 2025 07:37:58 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Apr 2025 02:37:55 -0500
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
X-Inumbo-ID: 8ec3fd21-1e83-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYe3Nu3Pe/Y/iGxyZfhfQUPpneQ+sjrPWdpKOhkqfRiACYdGAthQxo61yAIvXv3z86hpuVmi/YSPE3FucVP2BCsTYCEPbM35801+8uVmD7srUgl5pACg5kE2IMNkWRi+HkGFgu0c/J5U8bBe5gIR0rQfrTGMJK6qNbeUUoS38K6sK5gvwA9t3T9bOS75BaoxHpfpg9GfJWeph3Baea7mm+UKlFNaUkKugopzILGifHwJpFLJJGdY06T2eoIkPpSRqDEvP2IiMEl07bwkxZ/O3c1WSFq1jmWqghHiLTo3DShnwhws/V1ZA+ZGH86NVvCTYBeYPGBXkhVN1pf0CDYmXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hilgACvHl4Syp1ch7k42+lgpwN4ZWXDPUPo+Y2KEs6A=;
 b=lpsNgkEF6UVj9M9Z2RC6XGPn143jLiVxSb0Xez8jFSQAAxOOFXTUYJT/FNk0aO7bZiGwYDwn+Qf9pkZEOlNZgQjkSaTAZuUNXGJ3uwS7RWZFqQUwYtOBjH7mP+uyLp+ji8eLmubVlBFw6h0cLuqvsSFfJFXtvxlQqVzedVNOf8Iz4H4WgBB9O8CDiGoSLBco6RIrmlRKgrpZzwQw5qBTOg51Y27kvUqkABhLlxM4jrEiCcybrq8NB4Y1s3izHC4uE+0UR9W9B2/Y4ReyM6Dxitre8dph+HlEDUmxK1bIHIIJA+HLeiQ/jBtTfutNjIYbGS+i8rX8gzlltKLictseQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hilgACvHl4Syp1ch7k42+lgpwN4ZWXDPUPo+Y2KEs6A=;
 b=aGfUGUUyZoU9YMKqoWMfDi7SSlRu0BiqfgnIoqAVjwD4hzQBPMYB3zrNt5CgZN07CCSnNGdRgLTYZcsun9xhvDvuxAEUi5cT+dXpe/VvKIB0KpcHDA8FsZPLWi2DR1ZoSjInUK+E3qET/NMVOMbW+5oBjdRbJAAdo68+cIvO094=
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
Subject: [PATCH v3 05/20] xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
Date: Mon, 21 Apr 2025 15:37:08 +0800
Message-ID: <20250421073723.3863060-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421073723.3863060-1-Penny.Zheng@amd.com>
References: <20250421073723.3863060-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|DS0PR12MB7728:EE_
X-MS-Office365-Filtering-Correlation-Id: a9840dbe-20a1-450e-4ff5-08dd80a76ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7rbKJpHLB2raXc4o/xd4oenxGdI1LzvweJGCvZHQwKFDyOVeo7+lAqkO6RXi?=
 =?us-ascii?Q?0JzgI8nf7+dCu7tVcL/Qyo+dQ3crRqy5nu3pyFMbQ0TL/XC0hOezfe6n53iv?=
 =?us-ascii?Q?TxbAvtO2kjZ6MNSM5O+YAGNT1PVDewqDCZOGtz+VkZhbdy4zgaPUpwNm7XZb?=
 =?us-ascii?Q?D9osFqvTPouIHSEG7Fgz3Mmu7P+f/xnhqU1uWxh03gBHz8Lb4Vf0uP/DZAb5?=
 =?us-ascii?Q?JSovbWbCxL+zqf/2WwKHB0vKcE9cqeQ6E96c7069paZl5P3oIwT6vCxyE2Wu?=
 =?us-ascii?Q?2xaJLsgecDFMlGLN/PAuSPjIOuKkJA3A4KWW5+VnKGh0cNjNGuUQoq6FkgR7?=
 =?us-ascii?Q?v834ClhJ1A05ogAjd7Bif4rd4YEjmB6e1RQCeN8KU+ix/niDSwk0MdafeVHD?=
 =?us-ascii?Q?WFn5HIlGZKxDG79IGSR5IwStYSvrTcfHDmrChlJ66PMy327PMH+zPwism2nV?=
 =?us-ascii?Q?GY/hun1VrcKWBY6xZvguiBFZ0m6momtKm/+rqWjqrBpEm2yBePdonfJQdebu?=
 =?us-ascii?Q?RZpYaMkLcAhrgQITg8KQi83JHkPWsEyKfGnhvmAOrvs5sLioDiSfEtoH6HNv?=
 =?us-ascii?Q?vpu3aoiiK/dotbJ0L59PlYMOqhCrXoQokkaPO3pj6MKnvsOxNVlnIB3/5rqo?=
 =?us-ascii?Q?Kq0HimqNk/6y33JGn5SUTb5uumhJK8/pF97N0U7pzvH3jaE6iArk0C6n2x5F?=
 =?us-ascii?Q?EHyeEJpPYvzQo7idkQDZ0pOKaP8gH9mB1oJD3iB7F5TQu3DtDoweFeL4upZ0?=
 =?us-ascii?Q?i/wGl5ybAJYMIRM0qMr7RY1BnQLBwEmODcLk6aMZitwkx36VAiHkCR5OW2wN?=
 =?us-ascii?Q?ZSc6gHeZjPwcsFidblzbR+q/BNrGGlr4YQC3keCzaXMucj2ZvBkQCvMjiJQJ?=
 =?us-ascii?Q?cOzKXc487UkZyL1pAUYmsQ0CPLsKQ3IDKtcHFakrSbpFDdSyRiz9cS22/qzU?=
 =?us-ascii?Q?sO8j557OR25tBKJLdLSXawh/Vy7f2bgcCaFVBZa5N0LZq+n9cGwOd36oUzd9?=
 =?us-ascii?Q?YLwC0WWN2ltuUzRRv2/v5w1zn1BFMJpjF+dT8lvldr83eXlKRAB4ANZKeeHf?=
 =?us-ascii?Q?TSeux80tPCHZCMMwnlS1v9CuFmGbGamDJwPCCyYU8HqGLlf0dNe+XH0/+cBl?=
 =?us-ascii?Q?E/ns/otIswPEv6dVk9DSF23yj3/u66IGDA49lcFcu2iuaUlYFZx+37g9jDQY?=
 =?us-ascii?Q?Mux0r/SWks9syeJEqbXBoNDZSkBB+iOERtOqwqldKAp4u8Vs/1F8GMRPPo5Q?=
 =?us-ascii?Q?JjRt4dkASzWe1xTvNgNYN/MRVwLdAp1id9nkg3LeOrHSRt4N3FJkQA8sz8F4?=
 =?us-ascii?Q?VnTRNvf0XI1ARgRopx721U8zAaKXbssw9epahipHiz+Tf23B4EJtejpHJQC+?=
 =?us-ascii?Q?1vokTeICxd/EBKOvJ5KVEb5zgo/cIBEcdGxvB8qh3s9UaRCeosG+965Q+hZy?=
 =?us-ascii?Q?fVgSD60zmsLo9QLSwEuIAssHhlamIbJxHsOiCAz/NNPQRNiI51rRDxAcjvpM?=
 =?us-ascii?Q?ae4NUPKwUhmS2zg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:37:58.2823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9840dbe-20a1-450e-4ff5-08dd80a76ffd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7728

Users could only access trace buffers via hypercal XEN_SYSCTL_tbuf_op,
so this commit makes CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d89e9ede77..9cccc37232 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -549,6 +549,7 @@ config DTB_FILE
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT
 	default y
+	depends on SYSCTL
 	help
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
 	  This will allow live information about Xen's execution and performance
-- 
2.34.1


