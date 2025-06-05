Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D138AACF856
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 21:50:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007485.1386819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGbW-0000Dl-9y; Thu, 05 Jun 2025 19:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007485.1386819; Thu, 05 Jun 2025 19:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNGbW-0000C8-6l; Thu, 05 Jun 2025 19:50:22 +0000
Received: by outflank-mailman (input) for mailman id 1007485;
 Thu, 05 Jun 2025 19:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNGbU-00009i-N4
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 19:50:20 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2406::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e66e888-4246-11f0-b894-0df219b8e170;
 Thu, 05 Jun 2025 21:50:19 +0200 (CEST)
Received: from BL1PR13CA0125.namprd13.prod.outlook.com (2603:10b6:208:2bb::10)
 by BL1PR12MB5947.namprd12.prod.outlook.com (2603:10b6:208:39a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.33; Thu, 5 Jun
 2025 19:50:10 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::3e) by BL1PR13CA0125.outlook.office365.com
 (2603:10b6:208:2bb::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.34 via Frontend Transport; Thu,
 5 Jun 2025 19:49:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.2 via Frontend Transport; Thu, 5 Jun 2025 19:49:10 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 14:49:04 -0500
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
X-Inumbo-ID: 4e66e888-4246-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZK944V3yBHApVJdZkCyK9nw9HInaDPiZKilwlKaw7UGEKFC+dEMLvS/SN3C8X6WYAjRaXy2cmFuKsuMdFticp4nBdk4t3hT7PR5n6eJG9hHMJthJTQxWwjMlCeUKBJ6ph5gTIg3eVV5Bo8RmyaYeVTMmNaGaypcVzphL2sG65gD4e2ZXQzj3OeOVjdlSp4MJXTQ4LREpXn7uPWJD130uAG0HpYSLC77xsyzTZQFkB78Dj10lfZTycBv9EhpAdT0oc9pE73iUVYK4GsOahomOdH1OlWMHUbff43RL9UH3ROm7Itso/IIu2R38dA/FmgkZNHMJyCLUmeOcJgdRbl69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brxUSyWoWAWqxgYUG8qaIMM7Yyx7/AEhfufohTwOIXw=;
 b=jL1ZPRRUjcDMvNYoil/hZsQ14reRfD3OWuYNUxM9dK5puA7A34IsP2HniQiVyAHEPAvMQo23rDMndAFqPYdl1CDYVksZzCJZk0q8m5iDFTZJXfCJLN3BJa4UfCWEpG5oEvzlJj9zcC84YiK9QVz3w6/K3nn1n6GZA2D+5RnZWlGewyH1D18fxU8KeiofvIeCT7Z4k3SWDWwDnybgYuWlmLl9qVW/HmBScj+MdUEeb8RoJk7z95yYTvGnNxKCz/Z75ejNsh20pKyGBFa4RiEKHRrf5vJwieVJ3iRiVf0ODsWtYMYelq76+GecBthDHHW2VmXZVrPnHz4IAF2h5iNKvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brxUSyWoWAWqxgYUG8qaIMM7Yyx7/AEhfufohTwOIXw=;
 b=Epz/+jZNSAX+VWNpa3IRKEBg81zXpzk06tE7BnZXxKXvv1XtPYeJBWnSC0saLm9Aorrka1NX6WaUE3LCgsTxjUs78HT7jkqY+0jTVpLqw1J+9t+rLn3mdrzp+PS7WUiIWb7TMjQNW4+EFDqsh+aJPSCo2mt1M5uStdMZPEfhLII=
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
Subject: [PATCH v2 13/15] xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
Date: Thu, 5 Jun 2025 21:48:05 +0200
Message-ID: <20250605194810.2782031-14-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605194810.2782031-1-agarciav@amd.com>
References: <20250605194810.2782031-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|BL1PR12MB5947:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4c0063-8ef4-4ba8-5d10-08dda46a0a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CcT0X+hGUGdt3k9SU8KUcL6xYFyNMFGzLj0B4lUNmtkGCPsjZqgcs4col1Gk?=
 =?us-ascii?Q?nfbQ3O/ZcX30a9EY1WNmUauvOk6UWHZD3mlztmobHrePSE55R8J3hHnBf7Rh?=
 =?us-ascii?Q?bQ6L4X1DbVod7F9yBR2Ko7w+oymZzSCvKEf75HltYxsyOwqc/kv67CJGxvs7?=
 =?us-ascii?Q?ZJX0bIZWdJhQHGQAGakx7/fScfwZz6nhJd1D8YH2h37yFnZV0iMJun9jE7YX?=
 =?us-ascii?Q?FLuBvy2U9finDwQ4ZCUxOprt8Pwe1Jr92hc71+f7fvDFS1/WGFtRNuoxI+8a?=
 =?us-ascii?Q?BtMVmZTR3RAGYqwMIarsSg+tbob3jV+eKK/rEJqfD3yH5GGrXGScaWsLC8M/?=
 =?us-ascii?Q?SzcEQ5XSrzjIFtaNOb0x9zu8Ron+QkqGADSUFsZPQ5rT30yyOKqTx82fK+eP?=
 =?us-ascii?Q?lvopN38HFrHDrnWxpxzoj0dQRS1HyRRe2vuD3vhpdeUOlpF5O6pywQyvRIUu?=
 =?us-ascii?Q?7I/B5SplFcUwaYIg0ja7zvzfynrXZCp6Y6MO0xIo+OV1SXMREBwdFqBXB2zQ?=
 =?us-ascii?Q?2MGzHzf0tQ0GFfLBaCdT5DsEAiVWm6ypTgY8pwqgWTDc5JcCRJduXgIxN2jU?=
 =?us-ascii?Q?qx8lHf8dLHXZPM/PCHg9kwTf+6KAEQAigquAZb6sg3xVutJyp72EGnimbSYB?=
 =?us-ascii?Q?qF2ZJ4Dd+BbqtTR+sFMcbuNzsQtVJKp1hrFemukL3yKo6fIVZgN/16XvL3Oy?=
 =?us-ascii?Q?ChNFZ7KkC/HPrGGO3mOJauzAVPTjv+jA57b0xfwGZg2medZadul0pdTZyqZD?=
 =?us-ascii?Q?1l238RQ8OKmRPIRqyML8bLf1tds1wZFDvgxuKi86H6iAtEPUfP3UkLWORB/2?=
 =?us-ascii?Q?ENf5jWGCoUq24sKLQLiFiVdOnpb6+AVvmGMRepoM6LBLYRlzqnj5aCfEoS/N?=
 =?us-ascii?Q?RroGgGh0HJzPIThtTUbWO3Q5zqtqREWZWfckEmy6Qe1oXDj3Bn9dbRWKAxKI?=
 =?us-ascii?Q?e4Fm+9jxpVco+G0vXI+kQXvRs+Wy5BPHiHXQ/BmQcZJJ2T/oYAosbtV1KjMv?=
 =?us-ascii?Q?OkoMQK6vwg0WU8QQa3wUvZzfUjZlm/F2FZSDdUPVBIsiuOEI0KA3ayju75RR?=
 =?us-ascii?Q?6TgEAgVUpg96wrOeGiJMlG0Ml0xKumF7PnQsk/5MsnXz8zUaiA5Cu+7Au18U?=
 =?us-ascii?Q?ejO2bFP3Jcw0cSwqZ2Hhu5Z9o/fwjxZcJEaqU5+CdZBxUajRMaETdRN4RRou?=
 =?us-ascii?Q?vYSJxDI6Vr7OphqtsP6qElBNwQKVyY0tF49jixdfDwNlFqQrZclhLhVN3wnQ?=
 =?us-ascii?Q?chCT4PJlx50S89AE2jSeLgky/L+jrvEZ8dqNKaje4O0BO6X66NBIiWbmwU2h?=
 =?us-ascii?Q?g87tvtdvjpGSwyoQq80HYvYxMhSLUTwJuFN0Qo343KTx5441rAd1QSYIWdIZ?=
 =?us-ascii?Q?rUimROQBXdPGqKoJ6Zn2BlqFJzekKbD59f8Dfy9oNEWstUp6UYb91Fm5JgYm?=
 =?us-ascii?Q?2wgrfRivGQSx5eT/A4uiOSI0mcFkELDsgAEWbCv7so3UTU8fY+VJmSFFLZzJ?=
 =?us-ascii?Q?i8lVzPmCuMCbWwQFPITmOgY2lqmqRxUkdGhe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 19:49:10.6453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4c0063-8ef4-4ba8-5d10-08dda46a0a8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5947

... which means, device-tree.c stops requiring strictly CONFIG_HAS_DEVICE_TREE
and may function without it.

Not a functional change on architectures that currently use these files,
as they already select CONFIG_HAS_DEVICE_TREE.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/common/device-tree/device-tree.c | 2 ++
 xen/include/xen/device_tree.h        | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 886e6c7712..c8a9c0e46a 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -2028,9 +2028,11 @@ static unsigned long unflatten_dt_node(const void *fdt,
             ((char *)pp->value)[sz - 1] = 0;
             dt_dprintk("fixed up name for %s -> %s\n", pathp,
                        (char *)pp->value);
+#ifdef CONFIG_HAS_DEVICE_TREE
             /* Generic device initialization */
             np->dev.type = DEV_DT;
             np->dev.of_node = np;
+#endif /* CONFIG_HAS_DEVICE_TREE */
         }
     }
     if ( allnextpp )
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 7d1c8bc305..641f24518d 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -109,9 +109,12 @@ struct dt_device_node {
      */
     struct list_head domain_list;
 
+#ifdef CONFIG_HAS_DEVICE_TREE
     struct device dev;
+#endif /* CONFIG_HAS_DEVICE_TREE */
 };
 
+#ifdef CONFIG_HAS_DEVICE_TREE
 #define dt_to_dev(dt_node)  (&(dt_node)->dev)
 
 static inline struct dt_device_node *dev_to_dt(struct device *dev)
@@ -120,6 +123,7 @@ static inline struct dt_device_node *dev_to_dt(struct device *dev)
 
     return container_of(dev, struct dt_device_node, dev);
 }
+#endif /* CONFIG_HAS_DEVICE_TREE */
 
 #define MAX_PHANDLE_ARGS 16
 struct dt_phandle_args {
-- 
2.43.0


