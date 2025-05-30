Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C0AC8D4E
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:03:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000713.1380934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySK-0008DA-El; Fri, 30 May 2025 12:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000713.1380934; Fri, 30 May 2025 12:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySK-000866-BR; Fri, 30 May 2025 12:03:24 +0000
Received: by outflank-mailman (input) for mailman id 1000713;
 Fri, 30 May 2025 12:03:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySH-00076q-SG
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2412::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14673029-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:21 +0200 (CEST)
Received: from MW4P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::33)
 by MN0PR12MB5810.namprd12.prod.outlook.com (2603:10b6:208:376::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Fri, 30 May
 2025 12:03:17 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::57) by MW4P222CA0028.outlook.office365.com
 (2603:10b6:303:114::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Fri,
 30 May 2025 12:03:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:16 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:14 -0500
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
X-Inumbo-ID: 14673029-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrAflS6M7rXsLjmUvpnGe6cZBX6i09cxKrt8Cp8BmyNjdXLasPOTMGvFnnAym++Pykc404PHW6U/BLT9n8qO1eD193oCkAI8QNfpRD9A3+GCv+9tPfjSUM/Wq35RCO4C1bW3xSzGJTPaYayQqAt76INHU3pOPqIQ9GiH9xlmoLPHpcmUcDuZvCvzH0k9J3NJM0+xm335GZ9BlI8tSDi4EM3OLMS6Qc42N8l1A4a3dbhwYEKWilTmbCBgqTld0pTiAP5AW3NkeneR7tJyQlopmr3vN87LV+UouJrxbEKweT4Rdo4njEO6RwEDU7TG0jNibNv4xMu3BtZDrkDigX93ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CB6uSAbe+0xw4xE8YOobIV7kviFvgyyKz9p/QbVCOyc=;
 b=j51PQMdVuI2uHeHKp5V1YAoNHUBq9AuGVn8n7GBnXjrVVNoo+TgExz4AYC69SWoGDmgWYjEATfVEIRwL9d0krLm5wXbGIWUxIQbFFXNLvcQOdLPSVxnFB20V65l7ZdmKP9R4LM90I7txjXzBFuVimJmC6ppm1rdTyOGBmaG9SVDt03EaD2E2FOgpxVoKbK2dijiX1qLI+93XXbsbpQ6pEiIERxa/SJjXI7OMxIwjhP7xtZRdrGswEkpZfcy4l4NbpppXOmNQQbOtKVuzKyMH74Te3rP0dkNfPuSJNuAq3Wxzh1vhKc/jrzjjws6xOU83MchpE3RQMKQd/a19LJedGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CB6uSAbe+0xw4xE8YOobIV7kviFvgyyKz9p/QbVCOyc=;
 b=2kGgJxFG6CYcegwJ9h1zp3X11/+JAmtA4LP/grKbQ4wK4qD+007gfMBI1g8Vi/p/pE2w5gphvICuMcDaQ7P2RVz72oZi87Coy2cXDftV3khP59j02qPY7y9a8hXwZqSu0r4d5XfIeve6RRZnQq1752MYxeGwEwaWDwL3g0i0QPQ=
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
Subject: [PATCH 05/19] arm: Remove dependencies with membank(s) definitions from setup.h
Date: Fri, 30 May 2025 14:02:13 +0200
Message-ID: <20250530120242.39398-6-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|MN0PR12MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 524d2aa7-efad-4b14-274f-08dd9f71f632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Bae3R9cVDxLgMYyelWZPlaFhIZ6LzxqbpiOur0bJ5iDAPjTKKHCRVl7olOaI?=
 =?us-ascii?Q?5bgakf4vF+c9dqnaYNcpTftx7+NL+H7E0+feKGugf9hzfKQ9PYGd/BVAvinX?=
 =?us-ascii?Q?hWxj6NUZkU1Y5186sRbGB3oWbGq60qKUKXRgUAdDYZRIROMuA2FV1RsLWnt0?=
 =?us-ascii?Q?QIIlJVyIcxBkLx4Ok4L83GB70gPOrmicu5a7XWzANcQZBpIY7GXJygssojGT?=
 =?us-ascii?Q?71ihAysAwfAuT49lmoosoMA4y6oed5QikfezQCZF7whBftpOUwdeHKRfBhYI?=
 =?us-ascii?Q?3VNxZKMgdFakxI9+RWe2obCoZ/RqMp1YhnRUc8EhoWRNu1Z1Zr8fZFm06/IF?=
 =?us-ascii?Q?XC/cnwr+CUX7DVm9gABYKnNMa9oWz48ESfOx/PLeNx1iqfZxC6Lz9WJROhCK?=
 =?us-ascii?Q?X0zE+Z3Ow/FTASBnsg0AK6KpSYN9Kjuz4/FM7ZPi5V0kfqskYygPnkZZ90ft?=
 =?us-ascii?Q?EjRviZOs9Y2lEeTjw6r59kR8clkxLLgCWm7NQk0fymvlQmMszBT4WGOHXrNo?=
 =?us-ascii?Q?56tN5WipHlPtA6MlygF4mMjT7HDNjPCWNU1j79w8mGD1TA/qkWnBLv5guZSN?=
 =?us-ascii?Q?M+sIDQXdaFVIY7UPPEYZV3tAm4jl3KoO99461baJ6Rzi94Bp2vekywlQ8SCy?=
 =?us-ascii?Q?MwQrBF1n9YhcVZ4IM0B0scdAae63wQNaZlfXb+LoqfEfWvw+QtRv7zQv6CjM?=
 =?us-ascii?Q?xqhrm3KPV/ZhN9BJDSiZC3HY/1IweU3/sX1auF5AkVlv8pl+eHiPWW0WS6Zl?=
 =?us-ascii?Q?6o2VZXsBDjShRrUWZ1JiYWTXTjn3bgS2VgQDuVWaMtvsXlY6NHFbGTRXYZy5?=
 =?us-ascii?Q?G6M+e+kmvMgNNh9c+O10kliNJ7eZ30P6VY2DvMpLKCJCDSoewnQ2uRG1K/YY?=
 =?us-ascii?Q?4IMKXNgz6vBiDhH9lIO4aoCl1/IMb/3kxjTvJ3yC0OJRtda9/oaZcMoJE1uO?=
 =?us-ascii?Q?sFPAyfR5T12ZAGjBHo5awfA001K4dd4Rd659+l2x+H88MIKyWDbg/eWHDg6z?=
 =?us-ascii?Q?Xuot+RnkOF3FHLsBirItSeQucU7slbE6SLA6SKRgWmuFHBlDFnRtw55MVe4f?=
 =?us-ascii?Q?a2Ps10vB3UZKQCK2Ws+s5jIJF/tXx0o6TvsA0O91Cpn8D4WBeY/XkCsn+pr1?=
 =?us-ascii?Q?qEs7nIhIYFx7pWoZf+RFS/tsNZFC1ILtQiJJZ8EjqBdJz97kpzcooO5sGQxf?=
 =?us-ascii?Q?wTl0vqkSwdSILuWsgOSLdEHHWwGacx6429lTCkNoqPxudE6/dEfxcvrHTjeZ?=
 =?us-ascii?Q?w3udC8UM0h0TQGrTaUW3XEklChlEW1FKa11cBYVkGKdMRecM8cFe99pRJKpu?=
 =?us-ascii?Q?oSN5BHDm4kyJ7WoJ/huB83+rvK9fzwzOZ8xgYk9kDKGYdPht1vjcxXSW8drE?=
 =?us-ascii?Q?Yf3iOuIm3953NYpwKno2ejRca8J0uri8cnkLZ1+XBM3pOfIhn773roRM/9qW?=
 =?us-ascii?Q?qaT4ufumC1DXKg2Ba1h0K0//d4brYgPR3XIiV89NoTO3cyvYf1ewz+5a0Ar8?=
 =?us-ascii?Q?EqxG44R+sWQZ+EtIhz1QPMLemk9VLpoOb9Cj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:16.6504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 524d2aa7-efad-4b14-274f-08dd9f71f632
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5810

... as they can be forward-declared changing arrays for pointers in the function
declarations.

No functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/arm/include/asm/setup.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 6cf272c160..0f9e531a34 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -3,7 +3,6 @@
 
 #include <public/version.h>
 #include <asm/p2m.h>
-#include <xen/bootfdt.h>
 #include <xen/device_tree.h>
 
 #if defined(CONFIG_MMU)
@@ -14,6 +13,9 @@
 
 #define MAX_FDT_SIZE SZ_2M
 
+struct membank;
+struct membanks;
+
 struct map_range_data
 {
     struct domain *d;
@@ -32,13 +34,13 @@ void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 size_t estimate_efi_size(unsigned int mem_nr_banks);
 
 void acpi_create_efi_system_table(struct domain *d,
-                                  struct membank tbl_add[]);
+                                  struct membank *tbl_add);
 
 void acpi_create_efi_mmap_table(struct domain *d,
                                 const struct membanks *mem,
-                                struct membank tbl_add[]);
+                                struct membank *tbl_add);
 
-int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
+int acpi_make_efi_nodes(void *fdt, struct membank *tbl_add);
 
 void create_dom0(void);
 
-- 
2.43.0


