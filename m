Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8813AC658C
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 11:18:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999070.1379839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCvL-0003aY-5v; Wed, 28 May 2025 09:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999070.1379839; Wed, 28 May 2025 09:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKCvL-0003VK-0E; Wed, 28 May 2025 09:18:11 +0000
Received: by outflank-mailman (input) for mailman id 999070;
 Wed, 28 May 2025 09:18:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4yDH=YM=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uKCvJ-0001jE-9I
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 09:18:09 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [2a01:111:f403:2417::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a97c655d-3ba4-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 11:18:06 +0200 (CEST)
Received: from SN7PR18CA0001.namprd18.prod.outlook.com (2603:10b6:806:f3::15)
 by DS0PR12MB8574.namprd12.prod.outlook.com (2603:10b6:8:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 28 May
 2025 09:18:01 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::a7) by SN7PR18CA0001.outlook.office365.com
 (2603:10b6:806:f3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.23 via Frontend Transport; Wed,
 28 May 2025 09:18:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 09:18:00 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 May 2025 04:17:56 -0500
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
X-Inumbo-ID: a97c655d-3ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXF9U7y6lzDyogwcLUNAtbUQwiZ6wmZ9odE0a0nKmTFrqRkQYXWmWoiogAW/O7kGcb1to+LN4xPTfbCGUcBDzaxdlxjlu90+XSNHWcdrpaRXgcb5/RTn9ZqAxCcSkYSESmIiJMjlcKQyhfxy9tBFuowqNVKNz/heYmcEt3vgqA1Z/opNqTTlWEuUA6L3/rFMia7t0rvdU81tcNn2teHYRU6VZMdqr6hdIjV/CgX8ndeUgArcM+GFPFl+jJV5LZOlhXsAWGozxtkvBdO8ZHCV5nmHPRnKDOo0ekWcwQtsU7acP3VvtNtJ+H2QUAvULxG2ZuVONjZHuz+qZ/Z3jLNAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70fq929cQ9GiOjsrnLMlQKa27q483NDF8TNgSR1MjVQ=;
 b=B3jIKwNTW0L1vOV/gdsNnvjS5Ke7ccX4mlKYJqg8dOvdudJvDaJXlrN9MGF+FBtUauYcpB3Pvv4mnDijmqH2bq7zeYUzIV5ZwggLI738jqwVUfPTgmuO/lrP1d6AVr8lzSDaLRs+70YUQdZa82W+WkrzJUiH5Ld7R/F6uaseFiFVvUVaYu4FOb/yC9lHcm41kEFeNABRBdydZot7TIlWBEvl7vjfVlKbe7OHfluOe3Zztai+cZSUx7ErV0gwX72hvBDn9HzxSvTxy1shXJ4i5C9PQTYgoQtEm1gFTX51S6wFXWHIIwMrMiWtDuozooNjX8tgnSjaxhQw0kHha6n+/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70fq929cQ9GiOjsrnLMlQKa27q483NDF8TNgSR1MjVQ=;
 b=UlLoxdgv82JA9wp4x1vfPBJkMENBX5hgfTxdRsA8/Ofv+dsexLkJDioElUBii8nIL5pn68xHV0WS0/iIpvWC5MmX5nZ0af4RqaHMQ2CN6DzF3FKf4ar0YRdneuYENJcMGthxMmS99N2++dwG6VDBR86QTWUfLumhYPR3v2dSRpo=
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
Subject: [PATCH v4 07/20] xen/sysctl: make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL
Date: Wed, 28 May 2025 17:16:55 +0800
Message-ID: <20250528091708.390767-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528091708.390767-1-Penny.Zheng@amd.com>
References: <20250528091708.390767-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|DS0PR12MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: 62911c85-73b2-4c7b-8aea-08dd9dc88b0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jJ/upueOVX+P5yogIG7XRKTgTazZSeNT8MvayBtU19/m+sjQpb7NHeFSEudP?=
 =?us-ascii?Q?IxU1NoxpB7U1GLezmGk+bgx6vqr0Upnks1nqKQIzlF+Op8mGlhd0MjxhwMkr?=
 =?us-ascii?Q?QiTkUrwRks1iIFMfOM3jnnGCqnrrYQB95l0FScGR9bSyKxGl4kYYXw7Da8wj?=
 =?us-ascii?Q?l+n5V88l34lL5LbsvADqNW4oEXcO7qssXhu/d572/zR6HGTPbphGCgGrSg9y?=
 =?us-ascii?Q?A1blFY0mKlsv4oZsV+VtOR3RcZeSNsif+3w99pnaNfnVJdy2NVf1g9/urIR8?=
 =?us-ascii?Q?jx1lZUj2sHezm3b/fqzEVlhMyzaImJXMollY4yY679v8dfMUwrg1kJWP5z58?=
 =?us-ascii?Q?DTmMynCIOPvDESLAgI1wtpxiqlZ5GR1nPlbyR8oSZTe9MAcFYVh2gBFTbMj2?=
 =?us-ascii?Q?51rwWdvJCfh7rTc2jb9HTOpc5kA4+EfbPxaRDzi9K9ZL93UnxKvBDSPOgk/u?=
 =?us-ascii?Q?lf/GJkqdkXMW7E3QISEMd0/+juh2zh1DeOhIy5k1/Npns/L6wdJsyV3/n0HB?=
 =?us-ascii?Q?jy81vAJWJHMPfFANEHb54VWSY00hLw+OVvOtznHi/FCq2fNyg0yrCOWfzCkK?=
 =?us-ascii?Q?twQcg5w8BykjoIGybFjCEWW/d7LH9SaYcXxnZyaHqHSQYHfwVMteRqNhiU6L?=
 =?us-ascii?Q?QlyO4c6f1I7T5X82Wy5z4tU1qSSDeY1e3+P3wxvbyTWXGBJHadUQKDKjLdX/?=
 =?us-ascii?Q?Aa5+mkovT2ZVISAy+MOvi+dAQynvtEgwjsEySSUYBDb0cMOXacZADrIzIb/f?=
 =?us-ascii?Q?gsRPHUYyR3VnAA8/QP6dVjdtYQR6c/uNZtbFamMRhWszgBU2mN03megLdMin?=
 =?us-ascii?Q?/GroBXfaXUCMmOQZvbw4M/GiS0hmH013r2koNYJZm17WPDSqW27ifNJZ+UvN?=
 =?us-ascii?Q?z6gxZpDWUm3KEaawT/KH2OpehHsnTAC8Baj9FAtVN/Uf3kngvp9SG1t/cTcT?=
 =?us-ascii?Q?ctYuSALiUdQW6079ueCnSG92DAOeOhyaYo3t1t7DcSnbwj9xpfiYFKmSThfM?=
 =?us-ascii?Q?7Hh0QksfR3RauTkZBKrUNldvhtPEJYqEcqTFmx7dzm30lclKayP4rtRJg2v4?=
 =?us-ascii?Q?tSFoimVbuqIKsIOP+s9EuRSZBv/SEWp/uVAzmD/U3THla3Blavh5V67Rj17G?=
 =?us-ascii?Q?d13ZuKf6J1dqp1l8gL/qfYUAEdGik+3Fp2x0CTJWIQwcj6N3sABZUxKIyHDk?=
 =?us-ascii?Q?0kKkAxEaGdZpIgVAGLJuEs5aHSlEXSpfpTL0hhUHSjPjFK+wchsU8bG3pDhu?=
 =?us-ascii?Q?dUv0VLHfFoqg7j4pdOX2nxNRXtj2jkJ2AVgQIQ+XqeydN2V7AHiSADfjiAVS?=
 =?us-ascii?Q?alv8BuZcynLZKlwgQQtH3shXEaaPFEKg+XNFaMjMcDg5PUnqHpn8Gt8g3ChF?=
 =?us-ascii?Q?hPeTU750SfWDDecMj+iuKc8a+mneXPVRFz5GgXOfYA2Wb5KOYAcoBDhCivur?=
 =?us-ascii?Q?RZrpdLqOCQXwUU9e16k5yaO554n+VSnVxco8+5PrnEJSU0Bc/VqU44AswfpG?=
 =?us-ascii?Q?t9SUzUmyOCXZnPHTOphNJfjLTOBnjmhm0ZS2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 09:18:00.7643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62911c85-73b2-4c7b-8aea-08dd9dc88b0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8574

Users could only access trace buffers via hypercall XEN_SYSCTL_tbuf_op,
so we shall make CONFIG_TRACEBUFFER depend on CONFIG_SYSCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 28e6ac2142..d84906df24 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -547,6 +547,7 @@ config DTB_FILE
 config TRACEBUFFER
 	bool "Enable tracing infrastructure" if EXPERT
 	default y
+	depends on SYSCTL
 	help
 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
 	  This will allow live information about Xen's execution and performance
-- 
2.34.1


