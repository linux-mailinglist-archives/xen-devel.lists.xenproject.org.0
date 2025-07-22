Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EC5B0CE8E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051779.1420251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0WE-0006z9-3m; Tue, 22 Jul 2025 00:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051779.1420251; Tue, 22 Jul 2025 00:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0WD-0006wE-UQ; Tue, 22 Jul 2025 00:06:05 +0000
Received: by outflank-mailman (input) for mailman id 1051779;
 Tue, 22 Jul 2025 00:06:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ue0WB-0005Mp-Rw
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:06:03 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2412::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a68da8e3-668f-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 02:06:02 +0200 (CEST)
Received: from BN8PR15CA0071.namprd15.prod.outlook.com (2603:10b6:408:80::48)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Tue, 22 Jul
 2025 00:05:56 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:80:cafe::ad) by BN8PR15CA0071.outlook.office365.com
 (2603:10b6:408:80::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Tue,
 22 Jul 2025 00:05:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:05:56 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:05:54 -0500
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
X-Inumbo-ID: a68da8e3-668f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXcaiFAy58m13WYydu5X5TWFEd6nWJI2oPKFH0DKxt4GC04HLM58DSBr07+gKveiXvqndHCyAQkRo48vSISkqt1nUBH/2+epZRXj9XZwU9zVsHRGIr11T0qbU6p1Wux8beC909mNjw/1uagHNaVzA9/APnLilKMQvv3LrWwfCnSE2MsEMoLUMY77DIiNHWTQk4zdH2kwZjtlvjDaVlOGw6NWa80wXmp+B3tJrs9Nuw+C9+4LL6uXh9jNYZdfBRTDoFucALX/n+ARZq6PD1VeZQoF3FRwlkC6qnDQEySIivD3190JWkH37XGGoVjG8cTDtb1apzKSpDk7TBqfrnbPng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcJUu8FbvsQyOG8SGblhyV+uh/13+P9WHXWz0ZjRk3Q=;
 b=bkWXFA7tem72UK3hwQhCiVYnN1pLmvDjvP2jdtypX4W7wlmk8+vqbrI8LkczEKOcFD56v2kok3tMe1LA/6kjeArrn3AEENy9YGiT9CsivMCB9fcEACbRB7rN4441TiOXD2rPSQsy4p8WfPEBNG/948GntJJ5KUFUkFth6+C3mIzlNwX8zN4KaK2Kn6a4KhQpLqocvUIkD5LgBkznT9L4LxWSKcg42z+OIzGrm4NFLORrb/NwdVWJhbZW7LkTIx8kxeFLLmA9Phb7xQ6xcOQIsfmIy4E/Z/xtdXFoy3bwXTWyMnwJFDzN4jRR1hmvm7MrqPBEpSBSEJ1/xeH86iumwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcJUu8FbvsQyOG8SGblhyV+uh/13+P9WHXWz0ZjRk3Q=;
 b=EnL5DHv0YRUOrbTIFwKuZfgEm5Id5QfMPlCKu+GnlZdfwDUDuVeiaXXiZ2RoFv/855IvIaopTUFQnU+bDBAKQGjwqe8/Yh7u+aKJFs9OtftMFRhSVwjmK/a9bJTUoA+JcR60V+wEsh6BnBJL6AB9pBbSPpnV1yp7yA1PNpYO83k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v8 06/11] xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
Date: Tue, 22 Jul 2025 02:05:18 +0200
Message-ID: <20250722000525.7247-7-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
References: <20250722000525.7247-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: f1f1424a-4a8e-4684-e4b9-08ddc8b38807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Teq0ZgbWMKelzoUrpN43OtBgWhoiP+2mTZER4V5d+eZVOW4VVuSW2vH0zbdG?=
 =?us-ascii?Q?2rqUfysOwoxTGcMnYk9rFV5cp4XclxO5+rtyv9Omw3gzUtqhwH6V5U3BVxCt?=
 =?us-ascii?Q?6maZCl2xwAx8IDENKki5sCfPiSr+698/Ksxk2AZHy7lprEWInC2ciN1mcbAz?=
 =?us-ascii?Q?Tukr6OhZNwHsdIYIUoNJZ9BQTVCSH/gDG8cNY6oiwdRCorXDJQOk5uOQHtpQ?=
 =?us-ascii?Q?wlF9rUdZoAaIXpstsXWFjTF8yVGVWRb84m7gJHIPFW9I8IENfOwx+mmmQOyU?=
 =?us-ascii?Q?XMHhBuUiE4/y3DRWa7ItfY4ZwDD7xwXJYD7wiQFCotPnEhd/3GKlL4yZFIyP?=
 =?us-ascii?Q?QaMCxj3Z25Uj+OHe3bR1+NCAUKTx/8KmVjbAcHSyH2oqUuIXSed4vZLUmk3g?=
 =?us-ascii?Q?si9RgY7R1NR46JzCcshTBgGruXPg8rZxLfEbSHE5Jym7bIB1FTHIOy/GP69y?=
 =?us-ascii?Q?/LwE2gn9i1OGY1hRXnhXaX2QJDKuIlofbYfRMddF1GOtQYgbdqkgjIH9U1hp?=
 =?us-ascii?Q?yRwAJ5qCEc09iFuPYreJg1JFhAzZnQvzQ1/VtfuC9apMwOR7tOO1U7Ql2jVl?=
 =?us-ascii?Q?xCe587ILUClk0GHw/Nex/SQlgFRtBhsvg/RjB/7n3NoBc2wh9zKP/wzRTc0x?=
 =?us-ascii?Q?klNraIk4fwEdG9jO6RHdIoU4EXL1rfSSqXhJ9JGmCRdde3udwIGm0b3uqV8s?=
 =?us-ascii?Q?uvXI7yDtakFoDwdhvRC+r4Kkbv1F6ARn6zIYB6A9/ynOfpOFK33TRZgb53+T?=
 =?us-ascii?Q?bBoq7Dc7+FEvFk95XSHWuf45Rf/CA4G5ja2QSIE8CrQXwjDjyRpCg77MGq9W?=
 =?us-ascii?Q?UA5jzyA+/WzUW6ZI5N8IDq1Ba0Guzc/Xy9FOOLMM4YWRlsl+h0FNsASp0Bkc?=
 =?us-ascii?Q?XIFoHbD/mAndu7HQE69reo2Js2hZuZgFvsjGYt+cv2oOoQ5hiqtGg11hq1w6?=
 =?us-ascii?Q?XfUqgAkchumpoSDDAxW6DNwyHO8zKFbSZhOLrXF6EivWhNWM48/m+piMyJPz?=
 =?us-ascii?Q?upcOej8vIuOTwBNqVvOKYQCsGxO/xiZ0jqxIsrKVeb9Rcq6QuITRzH96x+9a?=
 =?us-ascii?Q?jCUabA8KqUIOYKIg/dbtl1/ZsRjNGhjVXZpBU+zsbU5meuloQKrWZmwoup4l?=
 =?us-ascii?Q?fxS5a1OrI0HrKSLKaXSMBuf1luGnkjhAnkoDAw6+svnmuAlKjnSRyW43JyCT?=
 =?us-ascii?Q?/2l7QbQ+Ilt5UgnwHA1NJPXJpXmZcsyssB2VaHvFLgDr/bZoNo2+qY/yp6v/?=
 =?us-ascii?Q?RyCW6AYAKEzemrapP6uzP1Y+f9GXU34bpQWIyfovuravSOQUtrRhX4VUl7pk?=
 =?us-ascii?Q?AFmmZz/MV56KyVG6XvgxyjZ2pmpqwWjyGgD4ngLnxzfxVppb70zsscCWbvJc?=
 =?us-ascii?Q?JxdvRlvQd6LIUZg0nN5cBn1ztcZ4GZmC+h//FxyXf3DTXpiAgcaEb+o4799R?=
 =?us-ascii?Q?53tJOeemDYEN/cou75zPVEjTrrfnVv9kWntjscDjy/VxDD5RKB5F78VGQfFs?=
 =?us-ascii?Q?atl96czdcrZcyxW+c6LBlvmxszMuArQQtCDS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:05:56.2925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1f1424a-4a8e-4684-e4b9-08ddc8b38807
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163

bootinfo-fdt.c will eventually contain bootfdt helpers that make heavy
use of bootinfo. To simplify git history do the rename here explicitly.
A later patch extracts bootinfo-independent helpers into bootfdt.c.

Doing so here would needlessly pollute the diffs.

Not a functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/device-tree/Makefile                      | 2 +-
 xen/common/device-tree/{bootfdt.c => bootinfo-fdt.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename xen/common/device-tree/{bootfdt.c => bootinfo-fdt.c} (100%)

diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 13127296cb..8a3f2be89e 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,4 +1,4 @@
-obj-y += bootfdt.init.o
+obj-y += bootinfo-fdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootinfo-fdt.c
similarity index 100%
rename from xen/common/device-tree/bootfdt.c
rename to xen/common/device-tree/bootinfo-fdt.c
-- 
2.43.0


