Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B88B19340
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:48:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068343.1432354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKJ-0006QR-Sp; Sun, 03 Aug 2025 09:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068343.1432354; Sun, 03 Aug 2025 09:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKJ-0006MP-Ne; Sun, 03 Aug 2025 09:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1068343;
 Sun, 03 Aug 2025 09:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKI-0005K3-Nl
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:22 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2413::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd6bfe01-704e-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:22 +0200 (CEST)
Received: from MW4PR04CA0217.namprd04.prod.outlook.com (2603:10b6:303:87::12)
 by PH7PR12MB9128.namprd12.prod.outlook.com (2603:10b6:510:2f7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Sun, 3 Aug
 2025 09:48:17 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:303:87:cafe::38) by MW4PR04CA0217.outlook.office365.com
 (2603:10b6:303:87::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Sun,
 3 Aug 2025 09:48:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:16 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:12 -0500
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
X-Inumbo-ID: fd6bfe01-704e-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2+draGIXiUULd4BuJxjDr+4UJlN7cxXC3Tn5t+XlYPu9v6aQs9d2lSbHn9VldwLNVtApluQd1a4GrHSXdcXTnHwBQfgDJhq1ou+CTdAo4ov1kpiLgwLOHilYhAANr+BhJMNeIJihNUWg6sYc2GEWL67/aBluijWISVtOtAk3PY+O0f5BZpDU0nLHADq7GrYMWlDVNNHn0DBZ5Fr46PytPteJShVRgzpkvddqj2O49RmAXKGebF2bL46KpU9Byo++iMOo+nhgcsEaZ76pmP3i8FMDzx2ETzS7k15L3ago/8uEqUJgHHO1HV6LSL67wRC09HRvTBTOF+QVUhexGLMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gZBfEkYMoH4wrGRGa6I6ddzO0izCEguxFLEC949T/Ek=;
 b=vsT2c54aR0eOkD7O1pmKJzOHikxrszrSvuDhfcT0rcdJsUQZxK6XpNGMLFDYQMLfIR/2/JvrhXZf4AMnmBiaHEJc1xDa7jQTvtu4UpDg91+vBPTggn8/biqUCUgVKsqQG8r7KKAWIUZQk9+RB2g/AIETbpGvtrCKv0ObPoogvFGHkhKzHYqSaeTK2/BhmLYkkoBxq6rnxtVxAPtsEb2vwGfaHBMr3zWnujCEnCOZHUetgvuMYmGO8TWkiZeJUzWpVHKkl8OrqOqOZ0n+IF8Aoruo45HBtCHWNpEuF7qdDQdCdhD0RhEco8cmFGAKB/QivoStZoELn8yQQf1iOvZ8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZBfEkYMoH4wrGRGa6I6ddzO0izCEguxFLEC949T/Ek=;
 b=2fFa88aa5Z/QTrK3feO7pUGQVUCEYSj6k0QYAkEpcvQt7UxCFWfBSuCKpNWDG40Hu2ITVxQugXIGYyg4/FW7VhET8tOeqJjgN5dr2nuA8mabSbcXg1Di6PzjT+V5e3C1+O/g6Sfd3dcLvjLIneOKaEv7MherRsjUebTFSitWcT4=
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
Subject: [PATCH v1 05/25] xen: introduce CONFIG_DOMCTL
Date: Sun, 3 Aug 2025 17:47:18 +0800
Message-ID: <20250803094738.3625269-6-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|PH7PR12MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 0720f6ed-de54-471a-7313-08ddd272dedd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/ySx1zFFV57UAI72ebIdhCRo2PifHZ7MB9W9IgPd9wBnOlk+A0vyTZDAn8td?=
 =?us-ascii?Q?c6XNP6Egmj0ZbAmitpAUERRunsoddDdQTnG/qJTktz1glD8UGvTDAIga3Zq9?=
 =?us-ascii?Q?3AcW5+uCHpk31fxxCatRn7y05bBvE6WiDLykNdnPE0CAutikAmBsYuQdG6/e?=
 =?us-ascii?Q?llm46P1w3p6h6zoe0yQoWVvl5602WlcD4mYwNA/pCSUlnJ/QdtIfJHs6GjR1?=
 =?us-ascii?Q?5KNt3K2R5nDxrWEjm7CHxiCqq5POjcHX1/GBcWsO4+g8XHQwZUUJjEer2gv6?=
 =?us-ascii?Q?3QOt1UxRuI0x2RGAFWv9/oI8dMn2ZiPdSlEtaiJ7ISBp9Xpfgs10ZODe2mIx?=
 =?us-ascii?Q?c06W0GE6sPoseSn5Mb5Y2gda/uaNR2f0Gy9Ucc6poS4qv+16JsLvbOZjx6CY?=
 =?us-ascii?Q?iqHPr9kGWpmJrcF/2sWzSacNixao22XgGDxFY15hLthA9rgfid4JzD/KapOs?=
 =?us-ascii?Q?wldS4y0g2EXX+X6rsHok+1Lgj+AF8gOlCwSha/Yx6GyWIJ6awlvgUw4TFGMb?=
 =?us-ascii?Q?w5aFLyn+3+cFhzIhM0o/IxiSAzUu0AC/lXByOP6Sh/c6FXDwH+2Fq4+emRMe?=
 =?us-ascii?Q?cnB8iZc1x+3a9tQsKfYeuCKk13cEYU0JlmPpp/5lUPdF+pWQLf2zQ59Qvh1I?=
 =?us-ascii?Q?AGU12MAvi/7p8L6uotHVjB07a2E2kQRlQ4oayuBVCnhwmV0TtUExx/+CzWIt?=
 =?us-ascii?Q?4S35zbStiWkw/0crAFtA91gJy/dTgmXOqeqgcQxbkTOuPuzzMh82Z5iOdpAv?=
 =?us-ascii?Q?xMQ9Sjxm4lG1TtFWdP1TzEeAs2CY0IBGyUU4MbXd6SozPirz29CJdIyyM/GY?=
 =?us-ascii?Q?WrTCecQLvKpRsSlLuIfCqUtyKYYO4Ar0VnFOHiB+ALihq91hVjG+ZKlJzc/7?=
 =?us-ascii?Q?W9msbIXNv6/mOISW575g4ccSH4u4EctFd2IMimw7gxGqqBKMtYDugRbCZaiE?=
 =?us-ascii?Q?Hlg9YliibFeUdKYESoFr7V2WTQVhDnYhG9B7PquawYQzCT+DwHFiZR9mAbE1?=
 =?us-ascii?Q?a+SQmuK/1f9c14cNE46lCsAIA8z4TQXQr/JvnWJOyEn4p7dtHiWCvea56M3i?=
 =?us-ascii?Q?pWw1rDDE7Pr4etmQS0Xsenjyr0HCXWSpnaB5TQToGLOdtjXbLGM8n3PCuw0P?=
 =?us-ascii?Q?gEAQkvub5uq+RtwMbn4jQgviKkKX9ugWc89BGGVYPVwRPlj7MHUYoEUjaUba?=
 =?us-ascii?Q?n7r+dgVriXi4roe8PJ45Bc1uFDZ5y5NUgg7POXfNPM/rGxoIhDPpzHTLFIB/?=
 =?us-ascii?Q?XCoQbym65oGw71inER9sfC+A+ofSOQu406jIm7j9nRODp/9mg1ICwXoIlOfW?=
 =?us-ascii?Q?k24cIEguB88dtSadF2kbC8EG/RzXM2B/Al6vRGXGkGZOK0whp5CXb+HxnStE?=
 =?us-ascii?Q?43MVsEbOYwAIt/GJe5VSsPoTHC+oTiQ3Lzfc5Uh1ppXeWCxWxpP7IbXXRi+V?=
 =?us-ascii?Q?4Y9EwVU/pjCFmIx76BPsOWjof5Ygkb+ufqBYTA1jlDwWo8ZwY75iX7kbt6Ba?=
 =?us-ascii?Q?xCPi2vCGrYttl1AxLM8dms9eTpARl0FJ3GKn?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:16.2300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0720f6ed-de54-471a-7313-08ddd272dedd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9128

We introduce a new Kconfig CONFIG_DOMCTL, which shall only be disabled
on some dom0less systems or PV shim on x86, to reduce Xen footprint.

Making DOMCTL without prompt is transient and it will be adjusted in the final
patch. And the consequence of introducing "CONFIG_DOMCTL=y" in .config file
generated from pvshim_defconfig is transient too, which will also be adjusted
in the final patch.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 16936418a6..bf1850c154 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -627,6 +627,10 @@ config SYSCTL
 	  This option shall only be disabled on some dom0less systems, or
 	  PV shim on x86, to reduce Xen footprint.
 
+config DOMCTL
+	bool "Enable domctl hypercall"
+	def_bool y
+
 endmenu
 
 config PM_OP
-- 
2.34.1


