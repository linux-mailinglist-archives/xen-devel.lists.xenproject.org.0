Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA6F91D19C
	for <lists+xen-devel@lfdr.de>; Sun, 30 Jun 2024 14:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751116.1159029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtlI-0000ak-KP; Sun, 30 Jun 2024 12:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751116.1159029; Sun, 30 Jun 2024 12:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNtlI-0000WL-Cl; Sun, 30 Jun 2024 12:34:32 +0000
Received: by outflank-mailman (input) for mailman id 751116;
 Sun, 30 Jun 2024 12:34:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aV4l=OA=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1sNtlG-0007C1-Vp
 for xen-devel@lists.xenproject.org; Sun, 30 Jun 2024 12:34:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20614.outbound.protection.outlook.com
 [2a01:111:f403:2009::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18532fa6-36dd-11ef-90a3-e314d9c70b13;
 Sun, 30 Jun 2024 14:34:30 +0200 (CEST)
Received: from CH2PR07CA0006.namprd07.prod.outlook.com (2603:10b6:610:20::19)
 by DS0PR12MB9324.namprd12.prod.outlook.com (2603:10b6:8:1b6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sun, 30 Jun
 2024 12:34:23 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::78) by CH2PR07CA0006.outlook.office365.com
 (2603:10b6:610:20::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29 via Frontend
 Transport; Sun, 30 Jun 2024 12:34:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Sun, 30 Jun 2024 12:34:23 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Jun
 2024 07:34:19 -0500
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
X-Inumbo-ID: 18532fa6-36dd-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5KE5lmkOD+fbuNRjvVaRO4XuvsR85SCt2IPqhsPlxM0luPx7tJySuRqrqPXETcac1qIxOyvtHkHiWCWTxxe24SHxOBbC6TJvRMeAMsiaX33I8vAl3Sx2TuNTPLNO4DlMKW3MpVep97OKLngBzTDeI4lMWaMj3dY7+yXZkCqiVqR6B0FiDTYgEJMcVyNAjM4RujPjABlkjdP1t0ejyQfLcqcmW1y8VNLHZp8q3t80PHJ6BNJiqMMSSBsUldkhx+xOlF95pMK27gY5IYlFlidl8fVHxIW8YonMQKL/fb72Cs6Pak42lGdP/54Tl9T+foo7LEvHag0buXXy/Yygq49Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/A6f8iRXUzEPbO8B0mLZ/2d23qq0f+RU7w4EWufx0c=;
 b=Qjke6Ibo4hGRvkJ+whaZ97hQy+KNMgNsm6SBS05QxHALmaPyU74Vt+4PMKNMVuCMgg1SfrwDhXXjemRNt7PcgS+tzK14j3BmL7tUJpOvrUNq6+NTH4fUjBy2qbdQYLVbFjh0NrvtcsVr7duc70RWq+WK2f9nHQt/WGcp25TRJKE+jyGKggH/G5knLZFBMQG2P1TMDbp0dscEF+0M/35GOK9KGDNvTWScpdUbR0GkYPUMQIWH1qA1HCIDAxVzBL7ePgIkXYaOoMcGqZcI0y8WBrb1wF9o3QwMmLEQLMPBcV25M+eXWt65PJMH9N63hcl5A6G9BgHSoB6uNSjo4eAOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/A6f8iRXUzEPbO8B0mLZ/2d23qq0f+RU7w4EWufx0c=;
 b=Ys0CYFw3eGnVt3GTTyZid/dw7sNOeZvcoOHrPLwT6b12c6z76I6oZMxJZStvFVqA2Gc4+MpWB3HNQZw0FLuLamO+B6sJl1qWkYM3Er2X174As410Gv91CA03HpKFJR2yFWP+C5H3+BGWnMVeP0EPu4H311C8WrPWE+R2J3MqwqU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Juergen
 Gross" <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>, Huang Rui
	<Ray.Huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui
	<ray.huang@amd.com>
Subject: [XEN PATCH v11 6/8] tools/libxc: Allow gsi be mapped into a free pirq
Date: Sun, 30 Jun 2024 20:33:42 +0800
Message-ID: <20240630123344.20623-7-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630123344.20623-1-Jiqian.Chen@amd.com>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|DS0PR12MB9324:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7a08a3-11b2-4ea9-9d94-08dc9900f920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1lqTe4oKDSfpeo/Fu97gTNQKXXHVSXAjgNVlBTG+P0Qyo3TyLP7A+CJDtyel?=
 =?us-ascii?Q?T44JzQwdlZN0m9fqzk/WtpeHTX76zFMPj6TiCIV7n9mHCPAIx6QO5E31RMuh?=
 =?us-ascii?Q?a+7z9gh47SlSuaB6VmZocQLNBQ/6p2hq+/Aw1mzBtEChEz1sS8IMsbgIyRP+?=
 =?us-ascii?Q?i/t3ow5g5US46+gcwJFkmlSscCYnlEjPqMipN1MVXVHrAasHTA1KyO3A8lnz?=
 =?us-ascii?Q?+uDTXPtgecBfnMCGJzdzO6luXbduLf3GI9jXjdXJKSEmZOSm/No+Xj6Kf4MV?=
 =?us-ascii?Q?rxOw7VwrpJ15gwy1WJlcnO0X2FXzJKIuxBd/5I53HOLlvq+nIWwqNSKAVM+U?=
 =?us-ascii?Q?k0FLujajEjOVyQSLnrOfxYsHuO1IXlnTDkThruRLfG+tSaNoLgMYUbc82C1N?=
 =?us-ascii?Q?gfDproXTvuYksgsveTAFlK2vcCCoxzvCyqmqlBHz4+S4egfdfTCyxZeJ1pPZ?=
 =?us-ascii?Q?9QGOgrb/JjKlYI0UFtCi+/prZKM1VXRC8pXTy7U1Q/2eA7k5g0WU2D0hcvp2?=
 =?us-ascii?Q?y0BSO3niLYnYh3d7RBDRVz+64xYJhLekd+a5Oa+7MHgWnpVZhyxOSm+b3tNG?=
 =?us-ascii?Q?M+YS2PPbIzTVNzvxd5GVU63j0CCw+/M0/clS4LBX1XAm9c2hbs6Wopy7RPEA?=
 =?us-ascii?Q?30sMJBtcx4nowIJoI9YPooEyIAGhEcrNTORTPemoRu6ctypW/AuJOHL7vl8N?=
 =?us-ascii?Q?1gHNcgNfQNVk+PUWGQRsufGcNoVKMIX9GiwRIppCi8/blcrkk08uARi+Cf6Q?=
 =?us-ascii?Q?1BwyX71Thz6BnHwUxi/PNB8nlJnsvDvx4t5p8zVmZ+15TSAwgZt+ftNhT8if?=
 =?us-ascii?Q?nZUUn0/9jcLmWzo3KAEzTwohviIv/fsq5fwakWE2oiW20C80jPkE2Qbz51fd?=
 =?us-ascii?Q?v7DdrqbTx0KYQrEHHEBooo7wMAgfxBEsuXYSTLVTfVal4dPB8mJZnmK6NiAv?=
 =?us-ascii?Q?bCsf3/lb6a/h2laGrkeFqpCklbrIOhXwT03cktfGOpIoWksrw4N+5tZoYy58?=
 =?us-ascii?Q?hphp8msCzqoccaBOfXn7noyrQF/FZEJxuEdgsfn6pSFwwS0qOjmnNieR//av?=
 =?us-ascii?Q?Z0jD0tBaITQelbDHXqdWmWja0VLZgAgLx5an/gy+CsWKhd6z/fRe/LQ4SwXG?=
 =?us-ascii?Q?ArCLQGrm9UbrK6l3vTpzPeWFiH3neafoxnSlmaP/XEKpum026zc1Qt2jkjCZ?=
 =?us-ascii?Q?U+6SprDUi34GaP7PnpktsTzIo4aT2V63cP/6v+IJXCSrCaeCEN/LmozgJ0Uy?=
 =?us-ascii?Q?f/JlvQ/GTid8lig5pEpglyZ+1iFfWwN42qw5lUR/FPvktQI6RG1d1aUhVmrL?=
 =?us-ascii?Q?GLJv02rvZPq4GNP603uuosHsRj3+34KdKfvkpEuYE1VKg9/eN+xUAJejh4lS?=
 =?us-ascii?Q?zWpzWScMWEMuIAHerUgV/Ce5UpY56LY9IWOI/Nh4iyo73P/xXZFUVaVvPHgD?=
 =?us-ascii?Q?p8bQjaFhRs85bwQQ33ncUAxPS5279NT+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2024 12:34:23.7544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7a08a3-11b2-4ea9-9d94-08dc9900f920
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9324

Hypercall PHYSDEVOP_map_pirq support to map a gsi into a specific
pirq or a free pirq, it depends on the parameter pirq(>0 or <0).
But in current xc_physdev_map_pirq, it set *pirq=index when
parameter pirq is <0, it causes to force all cases to be mapped
to a specific pirq. That has some problems, one is caller can't
get a free pirq value, another is that once the pecific pirq was
already mapped to other gsi, then it will fail.

So, change xc_physdev_map_pirq to allow to pass negative parameter
in and then get a free pirq.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 tools/libs/ctrl/xc_physdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/ctrl/xc_physdev.c b/tools/libs/ctrl/xc_physdev.c
index 460a8e779ce8..e9fcd755fa62 100644
--- a/tools/libs/ctrl/xc_physdev.c
+++ b/tools/libs/ctrl/xc_physdev.c
@@ -50,7 +50,7 @@ int xc_physdev_map_pirq(xc_interface *xch,
     map.domid = domid;
     map.type = MAP_PIRQ_TYPE_GSI;
     map.index = index;
-    map.pirq = *pirq < 0 ? index : *pirq;
+    map.pirq = *pirq;
 
     rc = do_physdev_op(xch, PHYSDEVOP_map_pirq, &map, sizeof(map));
 
-- 
2.34.1


