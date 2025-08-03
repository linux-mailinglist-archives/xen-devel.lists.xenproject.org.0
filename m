Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F60B19342
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068346.1432369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKP-0006yF-BZ; Sun, 03 Aug 2025 09:48:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068346.1432369; Sun, 03 Aug 2025 09:48:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKP-0006vo-6A; Sun, 03 Aug 2025 09:48:29 +0000
Received: by outflank-mailman (input) for mailman id 1068346;
 Sun, 03 Aug 2025 09:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKN-0005K3-9t
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:27 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2409::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 005b4c65-704f-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:26 +0200 (CEST)
Received: from SJ0PR03CA0244.namprd03.prod.outlook.com (2603:10b6:a03:3a0::9)
 by DS7PR12MB6359.namprd12.prod.outlook.com (2603:10b6:8:94::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Sun, 3 Aug
 2025 09:48:21 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::99) by SJ0PR03CA0244.outlook.office365.com
 (2603:10b6:a03:3a0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Sun,
 3 Aug 2025 09:48:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:21 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:18 -0500
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
X-Inumbo-ID: 005b4c65-704f-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HmSVrZMz97TpVBqP7OWNa5NuAtZURB4JO4BKd/y3F9MPZ5HAm5H9owi5Z9FA9lvG9aHoMUKPLWiZRnfqFeRDj88V3SV4XGXVOw5DmGSH9smLRZtur9A9dGTF2d3GEUhVlGXEGNEyMI0KxgLYlxJTPeKEZtEjABmrima1KaIsypE3zYOXAFg5crKvowlhsI6ZDabVz11wgAhDB5/pK+v9qbqU9VKUnBL+RVZoB3Fvji3+0yWl7WFeVYIATnZQ0yaE4UAgFf6aqabWV/Vz7cdRil8BU9QsjYvFmjELEr6Urc3Ay4ehI5OVBlnae1sAJDvKBpA9mnfRl1Dmfg626CxWPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HO40SAHo2CYI1R0WwB9j6q9Tlw1qyPHypuso9zukZM0=;
 b=xbDIUVuIkKL7y+0cuhjcUKveN/rNX1AqoOe8uSB9fJuYUBSDhom3sLubKJ0lfhAFXlYBAYNCua+7eS2TCnVnxaSwGjI1mukbgnLn7EtsTVABIE5M7ZguV6MjOFBa98qvVvEi7OXySQECtFCWYJe7FOUOLaq/QN88+H9ISeh+Ghwv84uWtzGX+smpnA20r5+EFjCbxNmZxRzTljeE/vgy1zJdVv257cNeqWhTK8rwANsZ177FETUKxj3OL9Yu+zgAvJNgVDNOMX0D1jFWQe8NCWsCmHb08VpZU9vI0aufbiTduP2Qh2bZEWrVcFLAqCRZr7IQ/UpelqI8zzk7shy1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HO40SAHo2CYI1R0WwB9j6q9Tlw1qyPHypuso9zukZM0=;
 b=tWrQle79UKwn0UtRPGJ3TmzeNDygBexGbPj9vH0sIh5St6kVEoiPXtLHMbIFdVp4pYt9YFEqiPVk8gxVmYwokN6o0i+tfdf1Y+uZ6rQb1IN/fA9+TsntEaNzSIPA/xF2G/gzTwlcqzQ7ILSQIPVc/pEA+6aDFGGsOP2KvO13knc=
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
Subject: [PATCH v1 07/25] xen/domctl: wrap around XEN_DOMCTL_pausedomain
Date: Sun, 3 Aug 2025 17:47:20 +0800
Message-ID: <20250803094738.3625269-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|DS7PR12MB6359:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c85368e-2432-4eb3-949a-08ddd272e1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zfXpkMfbUF3rNNxLa5V9THJNvcUUNQWrJBLG+kCSEFRSgIoukr9aj31asYJ2?=
 =?us-ascii?Q?lpZqevDxvhlsLMMJD7omdwzyliIfE4hJkQRRT3FC03ij0n4st4BynuUaUHkt?=
 =?us-ascii?Q?TUW3qbjHZUE7FNA5T7PV0/MK5JusfUPcjJeY/chEQFmpNV8VKo6jTZDVTZMs?=
 =?us-ascii?Q?wcem5y807Y5VwAV/a6/T/K7HhtsS/JA3GK/O1IZoc92PvlMTOgjDQyUFXyUu?=
 =?us-ascii?Q?iD/1koEId0xQbIp9ijAgbnG/SIUas8n8aH/v3MI9HYbuaZKakYXEWkH+bmwN?=
 =?us-ascii?Q?3ebk3UOWeBOWShJ1U+vrXUQM+GjYC7AUWtINlpR3gRleJvE08U8ctEHrr4i5?=
 =?us-ascii?Q?omhAeWdhR41Lc9NYx5eGMKh4CA6DbbX1pD/VrTk5M6k245r9sqWjCireVCP2?=
 =?us-ascii?Q?ckCIT01AipPi7a7xE4U9U4UIDhOk27k7cA6oiv8f+Gw64elFE1vtqU9iqbiI?=
 =?us-ascii?Q?n1D4ktBKok1/cmZ8ibD9ETwCodZ5QuNO2KyVam2++b4V/G+IZBdx0xXhdom3?=
 =?us-ascii?Q?0hbbZTJURIahK4kk8+IY6k31l02hBo/e9WJZjqtyK06HZsKE3WMZDwwQIK15?=
 =?us-ascii?Q?QPKmeVRDHiihfecIolzBpUe2M8elD/H9BH60vpe457bxWzQSWbmOmzez5k27?=
 =?us-ascii?Q?jBFQaHFNPdvRCTp11iCpmVz7ywVjeqTQ73+IX1qcSKDML3B3SKkvmNnT94NG?=
 =?us-ascii?Q?NSihfylv4TP36Xpn1ky0Rxz6g8AVblUHFoYl6ggw//rBjb3LX+Et7TVhjw5e?=
 =?us-ascii?Q?oA7y6shrEZhVsiHOnp/aIVS3RfqhuGniZxsfEXqHUEm7LNgd/PGN9N4FFsG6?=
 =?us-ascii?Q?NzprYo6MznxcIK2QlXL2ZaDzo8z11ml1Z3xCCeasWvTbZJOjGWNTvDdEUd8r?=
 =?us-ascii?Q?m47P5mPqoNEujtrYFdxjfLfF6BvfK4NmlfDnRJX7dISOzG8vXmV9VTklsGgX?=
 =?us-ascii?Q?92yC8cJyNh/bW8Vjm/5cjgPTVBijLR+NBFtO3v2dHnW3GnLMDxnolrP+9dTv?=
 =?us-ascii?Q?8EccGlMgTgA07tVDwiZ9iSZpQoEzT+9EDFp0DBu8yfDnHn9WwqBVN0/INPnU?=
 =?us-ascii?Q?Omoly1d1DyRUYQIV1KdVvgAZB+LzIaUY60IwfghmiPe71RBza44gABwqxFJ7?=
 =?us-ascii?Q?mvt/OJe0PXBdBYSZeDpQSvd/pk1WIAz8XBGyAwYk1WhTSWu3ytZoyC/J7w3F?=
 =?us-ascii?Q?sJ/P3BlLCLQB+TgERUGgEE3owTQnFinVVylSj8o/bpBx8Ap+lUoPn5lzRTA+?=
 =?us-ascii?Q?K7XmlI/NqrOHhKIG3rDekyyczECBLH/2XJnIeFgGmMR2MRp5Y0oaLIBaO0fA?=
 =?us-ascii?Q?GprPOG+F6h8xTyQRPdeet2RvWv7L0UUDcEuwBlkrdFk1bIxuhgPMpr5qGTKC?=
 =?us-ascii?Q?KMUPAFlXqjgo5r36pzGaaTm2kTmyCdmT3fNw3DJjx0uTvKwRe4cUaOjAvLLK?=
 =?us-ascii?Q?J1ISntk2Uw9uSlTavANFwKq59sRU+NVM5R+7SvM6N+7vAudm4HeK+fL8T5nV?=
 =?us-ascii?Q?F3arql3SSMrzMpTzX79gGsPSl/iMQe5thuzq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:21.1703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c85368e-2432-4eb3-949a-08ddd272e1cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6359

Function domain_pause_by_systemcontroller() is responsible for
XEN_DOMCTL_pausedomain domctl-op, and shall be wrapped around with
CONFIG_DOMCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/domain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 5241a1629e..e20fe2d40d 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1598,10 +1598,12 @@ static int _domain_pause_by_systemcontroller(struct domain *d, bool sync)
     return 0;
 }
 
+#ifdef CONFIG_DOMCTL
 int domain_pause_by_systemcontroller(struct domain *d)
 {
     return _domain_pause_by_systemcontroller(d, true /* sync */);
 }
+#endif /* CONFIG_DOMCTL */
 
 int domain_pause_by_systemcontroller_nosync(struct domain *d)
 {
-- 
2.34.1


