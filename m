Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D690BAC8D46
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000712.1380928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySK-00085w-2z; Fri, 30 May 2025 12:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000712.1380928; Fri, 30 May 2025 12:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySJ-00083b-Vd; Fri, 30 May 2025 12:03:23 +0000
Received: by outflank-mailman (input) for mailman id 1000712;
 Fri, 30 May 2025 12:03:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySH-0007de-SC
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:21 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20613.outbound.protection.outlook.com
 [2a01:111:f403:2407::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1088ca3f-3d4e-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 14:03:15 +0200 (CEST)
Received: from CH0PR04CA0058.namprd04.prod.outlook.com (2603:10b6:610:77::33)
 by BY5PR12MB4226.namprd12.prod.outlook.com (2603:10b6:a03:203::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 12:03:12 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::c9) by CH0PR04CA0058.outlook.office365.com
 (2603:10b6:610:77::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Fri,
 30 May 2025 12:03:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:11 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:06 -0500
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
X-Inumbo-ID: 1088ca3f-3d4e-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9fILf8M2WvUdjS8LUbLf+SMstpv1/TRiUDL6C93fcjdmMXw5GzsazJdL8RJ6OtWEzgwY8V7qpU2sc6SYQ+7T8sa0DYjpS7pEQzU7+CCA+JVfMF4EVN74cZ39bsSXMt7N2oFetu0OteXin5FtDUyOq0YatiYnNF5KfIOLSdBGMAtyeDYoBzKxjOOcYpaFWJK1Zkdf1EyzyqiWwFVS4dmt7c/TYH3cepJjM1qzhBZEPnNfOf8/QIDEDahxoa0KUm+fwlHMf9D6sTfWpE74MH8xcxx0Sjiq/18pd+1vWT18d/0eJf1VNSaHmrPwaSNuTLBg98j1H2WX08Bfm1P6uemUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/xCzdlcj7D1GVkyCv6SYm+nmyW2Z3DgicYLAF7U5oA=;
 b=Kg68PhFHHQrDGi8f1LoC/72ywUP9pDxsvfYvSKOrdXHZ4ShIeLUKwqvvdDy5UEqgsiLFEw0k3bt+3EFmJfTFEcEiZiesNfGMmFbZBXx33Xh1L3GD2duZU0lq3vOfNoZdpwtB0fUmIniQ5mm6WGo4UJPWOI71qKjIi0WBhyjUTKPwPgzMDjd7FTkXdzyFMPM2KoXnSPuLk39Vw+MEf4ZqzkOysqod5MNZ7Pkxf+k395FEJ8/xb69NNVxSyoAb/KFC7/pbGlXNZXm4mny8nyDyIexS5tPRlddAxjfTg94eHVJ7ocRRHYjlATYBsi4EhAcccaPNfP+yeQuyBBJv3SzC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/xCzdlcj7D1GVkyCv6SYm+nmyW2Z3DgicYLAF7U5oA=;
 b=o6Gb8rYw3IHwnCLUx01SBCN7ZtrBjSctURWLH5NaLKVGpRhY4KBIMpzMp/kV/7R/75gVLpBQixuvL5BGZ21UCprA9YVMzl14Toz9Idq8mlKFWnDhl+El+at1zWcFog7C+mWyTGHI8eNaQR7TShFfQrbaP7MOZRjp/+HonpHt0qM=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 01/19] licence: Add missing SPDX line to bootfdt.h
Date: Fri, 30 May 2025 14:02:09 +0200
Message-ID: <20250530120242.39398-2-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|BY5PR12MB4226:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ecac68e-9117-4176-cc4b-08dd9f71f33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2lnKy2gPzt/cWyMX9RTH8PfSz3g4MPpyFPd3+BIcmrdqUmnn4ZI6YKuBHAD8?=
 =?us-ascii?Q?/+VIkuFfR6UIN/+r3Ydt4kLWh6fbjveaUleGGoiKzOET0yESLRrmfRMRq0I9?=
 =?us-ascii?Q?H7TwyqKMkNN2CNjMJWg+NI/O5bdIE+SeJW6IUQ6qDR5Z4U0q+n9dnI3HX52y?=
 =?us-ascii?Q?rSEoosCBw9B9qbOrbxCW8qjUnaZDRMBtUROhFY27iA6KeskqgYE1vB5Mfx+E?=
 =?us-ascii?Q?eVz9D0tjBmYnHZw92lswBB0t8sqrmxrt7K9V6FVtjnJOp6gSMEozme0eAS+5?=
 =?us-ascii?Q?8LcBX7ij099yj2ohbVdqUtSzS5SGRH39TXAzFMunvsXrSBZQ6RoBsGeKb9KE?=
 =?us-ascii?Q?OG0pWQX0vBV45Dm2LxIUL0GgLq8K1nFN/4kbjz9Aa63ESSxBANPUJSpgFeLo?=
 =?us-ascii?Q?ULFUFE7twZC7ThOQ7uIHCw45KEU4Rs+YiBYfMYlQkwlemsiuNZ1Slk6S3yFF?=
 =?us-ascii?Q?ulrU4XeWB9liUO//75vPnwalozchmTKSLAjLqoYLiXFVsSot1rh+blCn7Pm2?=
 =?us-ascii?Q?BPDljhWpIbxS+stwYM7rAHBSXJKbH30ohWoUlLCYPNfDi9uDj2r6Qu4nmnZz?=
 =?us-ascii?Q?s6B6TBjnS6qOdjnqiDQQVzQk6mseAjjGSxS/ET0RX+hPvxmutR5ePA3CwObW?=
 =?us-ascii?Q?YhLdrSLuebI76bbsHX8dMswPWLiKExe2p518uTNwp6AK18YJvmQQkm8b7xJ6?=
 =?us-ascii?Q?Ha6ngNIfgvp32daoiJi1+Y89y+AGblSlZ5emCotKnTJsS29QUIrJpKWPBeIt?=
 =?us-ascii?Q?KwILVfiQ0T8x7FO9oAg0+qdNNnzG/SlY9ElJNXxawarS+I+0lsfeUNF+ILi5?=
 =?us-ascii?Q?kj7xLJ4G4BnSCo04frq9dGAwnATV/0LRavbEeVxQez0zFzHjkXcIIWgubu5S?=
 =?us-ascii?Q?jgJ2fzF63BRqM6MPT/sSfkd4gmsLecwCB1wOROA43a7k8IX/tWEAzGpa/R3p?=
 =?us-ascii?Q?SyuMF6NQUyOb+d6oalWkYGiahucoAlYH2F8YuitX5dzKl0qBOw6eNB18v+gv?=
 =?us-ascii?Q?ucJwsxMg8ELdsU8o6DEgwp5d3/7SuQ1DKvT5VY2ft9Eyaw/ZZ+m5HkHVVhzP?=
 =?us-ascii?Q?vK4YDBOVvxLQP9I5jGCaUJw9NpLLbxPZmbLDcE2EJf7nsG0IZSXNay4pIuVg?=
 =?us-ascii?Q?rCtpwkCh17FpXMQbjlrgZSvpccWXvYIDvjSLTU/6wAakfl4tcf+TaEFGKiyK?=
 =?us-ascii?Q?3tsCKTZglU0xmsjejEIC1Oh/ZpKUHK7U2ndNNRW0jiE5WsQqNRoI6GpyKwTM?=
 =?us-ascii?Q?eeH8xHIxvajotWE8Jh4j78Ua/IoyWMDqmNsLf6HTUN152E+Fj/G+IaGPe5Y7?=
 =?us-ascii?Q?qRvdXIAm7L+CUquVyaUFGVrHCHaB09N34AWtg14pM7IqI+9E1aU2VESUGWZH?=
 =?us-ascii?Q?T67MvbMYgQBZ26YI+9OqKCRLnk57YUVjxKhrGV5xD5FhIAtq18K7HGWGXoAe?=
 =?us-ascii?Q?2sPXbdv8IghOw+GnQNXOWU0KMe6b/jVhVZpHUPFUpVULkj6JiopljJ6VGhhe?=
 =?us-ascii?Q?//H257qXUS/gCNPp3WfWF0JLjyylIZJNy+Tx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:11.6781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecac68e-9117-4176-cc4b-08dd9f71f33a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4226

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/include/xen/bootfdt.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index 80a90e53c0..847f019559 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef XEN_BOOTFDT_H
 #define XEN_BOOTFDT_H
 
-- 
2.43.0


