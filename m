Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE695AC8D48
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:03:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000711.1380919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySI-0007rO-S9; Fri, 30 May 2025 12:03:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000711.1380919; Fri, 30 May 2025 12:03:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKySI-0007os-OV; Fri, 30 May 2025 12:03:22 +0000
Received: by outflank-mailman (input) for mailman id 1000711;
 Fri, 30 May 2025 12:03:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U1Xx=YO=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uKySG-00076q-SG
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:03:20 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2416::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12ae4513-3d4e-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 14:03:19 +0200 (CEST)
Received: from MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::34)
 by LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 12:03:13 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::24) by MW4P222CA0029.outlook.office365.com
 (2603:10b6:303:114::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Fri,
 30 May 2025 12:03:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 12:03:12 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 30 May
 2025 07:03:09 -0500
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
X-Inumbo-ID: 12ae4513-3d4e-11f0-a2ff-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fH8lY6rYFICPAh85Yv7hUKk3kAZcmTlsdQ+W71qL5/ZaClYMcGQk3fg9IpS/YDrElNOYCJBSqmJIPWR9mPx7mpK4q1ngIMrz5c5TQneB0s2xKpwIv7QDl5wbySNJv1tjezVP7wWLvGF7nTGvs5YxgTrwjiwT5y4+TFHCy2KOvo3KPrlnvkWEyltsFJSzCbzCw/OdZgubu70lRwVLc/F23qrAAKcPPR2eXdOkviNqLz2K92d25peSNyp1OkYIgcINTc5MnXyK4v9geWEiwGb3pV/WFFIEdSnpcCVgGHgcdgj5wT6QytOQNjxgoPhnpfYkCrc4NpQiCU8Kn67zB3fL1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZlp56kikAIJRuj8HFFgKTWb6tROZzbFa119RYv3t1Q=;
 b=qiUZ6R3LgWKVsWjeU9ClafXqzE4Y8PxzsD3M5dn8UPn/2KCrzH5VS8Pd301kDPPoCKAWOwEkLcuCRbclTiUTo55yPkZLy9S87bSRswXgeMms36B2Voz/meEtiNWXOpqbz9tcnWPZ+h+1cWHcyVv8jQ6IPW+UE0GP7tCZlVJ5iNSOIOplZ48J0BVvldexhFzuuDsSpcVCsfjZDulCHvLB4gElGNjupPspc3iKNG/PGrRVZWLKmqyALfL/4Ve23eas3KH/v1vEAzrasrTCvRuZKYFe2C28gOTiW9mH24ypxF9Xg1wC0JOuVTNtf9PDh4KXV2ReKOfghl2rtBU+7fzv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZlp56kikAIJRuj8HFFgKTWb6tROZzbFa119RYv3t1Q=;
 b=ADP7h97ZDIjHxhQd7T9mZy3hG5BUX7rcv4zZPWbONiRpsohQWDs2Qik4wV4E8CFTtlSoRHHDixo2ZCKc27DZ07Mx/KVQZGawfZ9yPXDRiKuQysfv34tIDw94JmPlT9l0IrmiVvXJRBDCqNEVmpVlTUHlC9CZzLTubwgJAS6+To4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 03/19] riscv: Add missing forward declaration to intc.h
Date: Fri, 30 May 2025 14:02:11 +0200
Message-ID: <20250530120242.39398-4-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|LV3PR12MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: d6bab5d2-4c1e-4f26-a752-08dd9f71f3f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Uj2c/2s2+tSabQ6W/4uczojidzm8/lv83VbTkb3tzP1hCfWpuCt0i1bPvXB7?=
 =?us-ascii?Q?184u0CGn+g/dTbZnU0aY1GexqTVD3tXhUTIdGPyna5bN+9pQCezBwtYQ0sJJ?=
 =?us-ascii?Q?lK/ZARmUBCrXtK/xIL0NltmtA7vlQz66kZNXR0hUvX9CbyfVwNOFHnsg8JVE?=
 =?us-ascii?Q?p2SIC0gL78WKuIpGZjMrgjx+ZW+7MiXVxr9i7kJV147fvYSxfz9hZu7oV6zz?=
 =?us-ascii?Q?85MpMMA+i7JQTaZyL5X+N9busyTpy1WSLQZlEOkV+psPK6AMtj+377l+miYx?=
 =?us-ascii?Q?mER/+g4GHoBpeW3oyFb5nLa5GZLua5P5Gkiz/U4aw8LyKn2m/oMzGH8KlBdw?=
 =?us-ascii?Q?j7pKrgNe47HYVCMMzjkG+kFrCSPj6gHgGDK706Ozlv6Gkcwian/z9mhIRIno?=
 =?us-ascii?Q?5JZxqy+A/rFMmG5a4a1ds6genbGcy0ScrEMq0gmR5+n2eiBoRolj0lVsERFV?=
 =?us-ascii?Q?CbYfoKCcW0CUc9RvcJ69ikKunkjiydvSKPDHo1CDIMCXfWF7S0F7i3b8JU5G?=
 =?us-ascii?Q?r8fSjOPgmqzJ0N3kTytDfSy3MWjpbS+4CtAZE3iWG3K87BkK919uqGtVxzwU?=
 =?us-ascii?Q?egBBOMfbBVoFaFTnTPwjU0dfG2TYN99bgDTj99mygsbD1vhXd/V33VYlf5Xg?=
 =?us-ascii?Q?m9P5cXqVlTQvwOouNS0eYcVKFcFLugMd1Vn59Uo5XUM3oggNZV01y60wNcJW?=
 =?us-ascii?Q?o9U4JBfI3+hu8ZMTX5BKcr9NxYe6k9tSy9m0ttlWUAhhW4don2GL9UKtXOya?=
 =?us-ascii?Q?HLgQznxaAUWLVAw4NcboBlNirZ93JGxDKvYSiRzOv5KHfQQx0aJORLROAE31?=
 =?us-ascii?Q?CxmwJxH6l2sBZfkDmnu4nhPmsUEsdGnsz2ySf1+DueA+L6uHCDTnSeKi5/70?=
 =?us-ascii?Q?nzFuZyec355/EH1Z9CznmGD41lO/5CLIq/pvbixYGkYstSnjv2It2rswouxW?=
 =?us-ascii?Q?MGiiQp19qL8a3aaIsFQQwmUJ/tTSWCIoBXvwB3mw96nepooEblFqx1+mQlym?=
 =?us-ascii?Q?4jqEyR8oOt3QcQs6LlOWvOY7npZ+qR/WE5Lex57SvoE2bugHxLgZPKUK6V6z?=
 =?us-ascii?Q?X/iNqAgns58fKM+/Hr5ccgWD7NDqV7U89ikfS0U1CEyRJUfAiF4PBP389HWp?=
 =?us-ascii?Q?QAswLonkfdI8sIDOw3x6liCSkKHqbcdiGE03LkXRpazeJbojuykxOMpZCV/y?=
 =?us-ascii?Q?ljb9EVGXCAUqGHqZdv8LMLTHzs211m/T8cOf3LD84lfviJW93qQoJgf4l3XQ?=
 =?us-ascii?Q?/0VO6eMPeNUWIeBjXf580I01CYcE9RTvkUDZFatLQJBiQwwvtXAi7qsIHee9?=
 =?us-ascii?Q?6MQN07Vw8ZV6W0KDN3aRxiCnccvscyIMaR7T3nTtj6LfOj1IVqC86e2LSQVy?=
 =?us-ascii?Q?YEs93B7GAwupI1oz7L56QSSKeutEuWlAsOD5VzToLwB4aar+019mYKBmPmSW?=
 =?us-ascii?Q?AuxTMxW22/DS7Ks45jbEOhfMRSFvyQBHzGMUVpxhEmIyOHDEFjdAB0cwmoeG?=
 =?us-ascii?Q?QFym96r/MSUSKp16OkMT6QqEWdWA4Gs9NqJf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 12:03:12.9022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6bab5d2-4c1e-4f26-a752-08dd9f71f3f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9356

Very much not a functional change

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
 xen/arch/riscv/include/asm/intc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/riscv/include/asm/intc.h b/xen/arch/riscv/include/asm/intc.h
index 52ba196d87..81f74736ba 100644
--- a/xen/arch/riscv/include/asm/intc.h
+++ b/xen/arch/riscv/include/asm/intc.h
@@ -8,6 +8,8 @@
 #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
 #define ASM__RISCV__INTERRUPT_CONTOLLER_H
 
+struct dt_device_node;
+
 enum intc_version {
     INTC_APLIC,
 };
-- 
2.43.0


