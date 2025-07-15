Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1B7B06402
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 18:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044544.1414710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiG9-0000kP-Ur; Tue, 15 Jul 2025 16:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044544.1414710; Tue, 15 Jul 2025 16:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubiG9-0000hA-Oi; Tue, 15 Jul 2025 16:12:01 +0000
Received: by outflank-mailman (input) for mailman id 1044544;
 Tue, 15 Jul 2025 16:12:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRri=Z4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ubiG8-0005t5-AD
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 16:12:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20620.outbound.protection.outlook.com
 [2a01:111:f403:2413::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6da09987-6196-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 18:11:57 +0200 (CEST)
Received: from MW4P220CA0007.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::12)
 by PH7PR12MB6466.namprd12.prod.outlook.com (2603:10b6:510:1f6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 16:11:52 +0000
Received: from CO1PEPF000075F3.namprd03.prod.outlook.com
 (2603:10b6:303:115:cafe::48) by MW4P220CA0007.outlook.office365.com
 (2603:10b6:303:115::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.30 via Frontend Transport; Tue,
 15 Jul 2025 16:11:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F3.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 16:11:51 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Jul
 2025 11:11:50 -0500
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
X-Inumbo-ID: 6da09987-6196-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEL4YFL5w4DgN+h+HjCjMDUxvHBL8OViR8P5OGH5jWz6pEDn+jZR6krSHTGY+FI349EWpwMm2+vFhGMMXNxmmTd7im91s2d5xiH8Dud52LnkI1jDKY/5iEYwIf03g8eDm4+En8qNZT8eP6fj7hNGOg2ofoEiDXdYhFCt/idHBH6GXrOtoyjC0A7zEDXYkiwaAPASJrSPVYAYWFgts6H8NC60JEgWINUgKQfUCXT+TUdpyI0142kCM0NYK0crjn4bLe/7dQ4ATzZ0C9LFNsD9KV2zH67TZUYx8IblXC1ypQORrOGakN9YjTJIG/Y8gBs51Rtz79A4SmSwfX1Sw/62XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olMgXBZZBVPXG3tpGWy4AbjtlnK0U3v7Xn2F33nMav0=;
 b=S45iLuZOWzq1+vHsT17iRYxJgPk8LM1vAI6G+b31LM3055/JLeErJDq8KwsUY+YLRf0E/jy2PtzQjcSJneQCWbcLcrm6yLTAfN0HoEyeRuFjuZrphEZKwpz870juETd6wyjyzQEl6qw0K+BGObk2WZYkULyfwTkr9INmXPa/J/tqHztaGbPrq9Xni8wE5THm3zJSCzd3Na0Y9sKJH6MNZGV6MVezi6wOVvS916K48jtJ2+EAn7xKB3rx6mViWCxI2N7Row8j7lHG4fWIRV4OUXrpamGI17p/cuxQEk2SRWJdXQQRdxOt2QqFu/LxOIgsN2i6vnIZlq5YPdTaf4737g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olMgXBZZBVPXG3tpGWy4AbjtlnK0U3v7Xn2F33nMav0=;
 b=dcBs9EJpJztG7F0iWGrcFdMsm2Xxqk0mGwlrSRPfb48kYLjIgE/Di/Zdh8SD2q7nm/wsNHDDAfzS8CO+NA1QE/ChukUrfUzVLQ9S8SUVMpdajaIDuZwsNbRPNUpXKRDfiHBuA1aCHYpGtwZfblsaY2tZmHdjrus1ihd5cUwPhjg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v7 10/11] xen/dt: ifdef out DEV_DT-related bits from device_tree.{c,h}
Date: Tue, 15 Jul 2025 18:11:05 +0200
Message-ID: <20250715161108.141126-11-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
References: <20250715161108.141126-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F3:EE_|PH7PR12MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 152c03d7-7e9d-466d-7eec-08ddc3ba4f77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qO50V0t30OPf57ImkchnWsnSiCrT9KUSdJe5s85Ar5yAbdJprMbSjNjihWX4?=
 =?us-ascii?Q?euQadtoVN/dHvcIgRYKrKdJcE/lRqkgjO9P+L6BqkEToxLxVxtVOTeVcEPOV?=
 =?us-ascii?Q?XXdm0ytF2GoDsEZuamkidzwKYLWOSF6erDFyGOYLUSu9CxJY1KDEG0Yyhr5Y?=
 =?us-ascii?Q?2Fa/MYo+pI4XK0Ur5OX2Sd1cSXnw1hljpvC5bCg++YYMLxOPdZrCNv7530Gn?=
 =?us-ascii?Q?pLyKdRtZcNA+eqhMxLYP9ODzYbuomjC7r7FNEUhkTZHjB1jSSKZQ0RWtWNiC?=
 =?us-ascii?Q?yAa4V8Bq1iLNBeTkG+mVcoG5i8lZMB1/t5i/8AQ544Blsz4AznLCTnUisY3Z?=
 =?us-ascii?Q?XfSW69Xb37sn4HKcSxQz2plYDOfYr7DdIrXjehHCS/aN2vuUHKeR/BC3obFk?=
 =?us-ascii?Q?ZGXWpKbMYcSg5iFBs47ifhVDuBWYw1JgCL/Rh/fxLRciBddvbYmwuLgRwg5f?=
 =?us-ascii?Q?jT0Pa0qxcdI2UQvSZ8cgRkHuGyk0nxtQPeaSRFxpFI/YTuWlmwh6+ZWhMMVd?=
 =?us-ascii?Q?/ol9jhyqQqLSeaL0m9xT8q7eMEpVbRbXsghlENQnQ4/TKlNMWMyxJ3CFNBvt?=
 =?us-ascii?Q?aUtQ/fjTHY9UnbtccFtGqb5/TTw+M9rdVItPRk0AY/I/zmV52en4moTxvT1a?=
 =?us-ascii?Q?2X5mFYDF/d79Tp3pCYYk1o2q/bbr6dlihwFHRNVVlSkG8FOwsPYKYSSFOOWl?=
 =?us-ascii?Q?38zJLg8DSUty7yJmvBKyszt8jfV/fFfme2Rfz0jQctyUrefAhkbji0nb9WK5?=
 =?us-ascii?Q?7yCf8Q927rgnlVFvf1fvKbYifJ+VY6PnRGA8S03HuKJK52Z8y5WtSukBCRhe?=
 =?us-ascii?Q?SzM1x4A/Qbr8ydlrs7pFPQ7POb/H67d+TLPA2hsEMItp/ymrbUhk2/L0WqYX?=
 =?us-ascii?Q?DjIUXKRo5piKPqomM0gjet9SQZozx4W7CCpcdj8fCQwdl8T2C7/PFDMbgsbw?=
 =?us-ascii?Q?7EhM9TXtj43aOknLXVQc2QZM0qo2uud24DgEj68XyV2ewUyQII5kOddbcMXZ?=
 =?us-ascii?Q?oG/UZyYNkc4gwHXcI0h9Y1Vp28ErPPnr+awZEsZIytge5hrtC4oBwrYHLeZ8?=
 =?us-ascii?Q?5vwWo6RYpJxjlqkZVUXuAJCeBcJxBwT80shFXs/cC0VSeVlHrjcA/h5iBccQ?=
 =?us-ascii?Q?UWoYuSc3HeKsnrMsw4fALesd+BW/hfQVBgS36dbIYF+BI11zzkVrEegdpPFj?=
 =?us-ascii?Q?VlQCY9KyEXhzU5Y9s7jV0TEAdLkPLXuiwLpX2HSoXasjMtu8NO1Ogw2h1O7y?=
 =?us-ascii?Q?J0fuEnazc9/AIfrMF02IPUnCoSt9zePjIrPqwliov0tzoLBEu3yVDXLJxI3h?=
 =?us-ascii?Q?x9EyE9PGtQe+Yhn/R8m91eGRyq7T5ngRm0oLFmX+77PjgRnT8F1Zod8z/UJe?=
 =?us-ascii?Q?DrWsRy1aqI9Yf0A2+Oog6uAn6qvfjXHOprGLw5IYLa+bcQaI9Tm9RLIcqWnL?=
 =?us-ascii?Q?qNDq69SAvYc+VTDEfxkoU6qmNBY9ARcO2/IZxDlou8tvse/+X81EWoZBugc5?=
 =?us-ascii?Q?06d8tkLRfzdqVzXNax9NJmZcYuiWzb3LMiCB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 16:11:51.9628
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 152c03d7-7e9d-466d-7eec-08ddc3ba4f77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6466

Architectures that don't discover devices via DT may skip anything to
do with device_t during the DT unflattening phase. Make device-tree.c
stop requiring CONFIG_HAS_DEVICE_TREE_DISCOVERY so it may function with
CONFIG_DEVICE_TREE_PARSE alone.

This allows CONFIG_DEVICE_TREE_PARSE to unflatten a DT ignoring its
devices if CONFIG_HAS_DEVICE_TREE_DISCOVERY is not selected.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/device-tree/device-tree.c | 2 ++
 xen/include/xen/device_tree.h        | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 4ebdb2e52e..84daa3f0ed 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -2030,9 +2030,11 @@ static unsigned long unflatten_dt_node(const void *fdt,
             ((char *)pp->value)[sz - 1] = 0;
             dt_dprintk("fixed up name for %s -> %s\n", pathp,
                        (char *)pp->value);
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
             /* Generic device initialization */
             np->dev.type = DEV_DT;
             np->dev.of_node = np;
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
         }
     }
     if ( allnextpp )
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 8a39a60c54..06d7643622 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -108,9 +108,12 @@ struct dt_device_node {
      */
     struct list_head domain_list;
 
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
     struct device dev;
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 };
 
+#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
 #define dt_to_dev(dt_node)  (&(dt_node)->dev)
 
 static inline struct dt_device_node *dev_to_dt(struct device *dev)
@@ -119,6 +122,7 @@ static inline struct dt_device_node *dev_to_dt(struct device *dev)
 
     return container_of(dev, struct dt_device_node, dev);
 }
+#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
 
 #define MAX_PHANDLE_ARGS 16
 struct dt_phandle_args {
-- 
2.43.0


