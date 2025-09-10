Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07353B50FA6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117586.1463687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQV-0007Me-QP; Wed, 10 Sep 2025 07:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117586.1463687; Wed, 10 Sep 2025 07:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQV-0007Iw-Mh; Wed, 10 Sep 2025 07:39:35 +0000
Received: by outflank-mailman (input) for mailman id 1117586;
 Wed, 10 Sep 2025 07:39:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQU-0005yo-1J
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2416::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49a78e28-8e19-11f0-9809-7dc792cee155;
 Wed, 10 Sep 2025 09:39:32 +0200 (CEST)
Received: from BYAPR11CA0048.namprd11.prod.outlook.com (2603:10b6:a03:80::25)
 by SN7PR12MB8818.namprd12.prod.outlook.com (2603:10b6:806:34b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:28 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::18) by BYAPR11CA0048.outlook.office365.com
 (2603:10b6:a03:80::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.23 via Frontend Transport; Wed,
 10 Sep 2025 07:39:27 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:27 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:10 -0700
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
X-Inumbo-ID: 49a78e28-8e19-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrorcKgFR778dOLrJ3ol+bAKBo0iSROGYB+mxKgpOSb9AayDrMH1WbJvcVDZFEpJfycRjHJnjMppYDRVypDCKr4Xr/tG4mYKseAfb2cuwxi4XTV4k9WbP5FloxGNhhFVc0ds4SK5kwYiFlYqcx6JIBsXEExBzdhRvNHhqMzMPE0sMTafWf8w8aGO+dEjJjIzBNb8ZjIgaGkuiVxT2aD+d0+nTPIOwtCEUymp2AyqnpzgZ/9Zh7BDd9H3hn7KKrzQcuTiO4iSeHNOG0+kMYXwdKFves0kgQaP7g6j1/b4J7z9jhAtTtQI8Tncun42nrvWH/Tpwu7PewZ76U8ybO2RdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCvTZoNSvyoMqZzxIQR/q/ai6c9ycQYKWaEiuV+fVAQ=;
 b=grPz6vCAPR9yTtltcUtjAquTuRWQ00Ol2vhrpKgMYNSCbOkKeVYvSS75H1q/bzg9sOAsaT1hhR3NmlqN9tyqdxPp7nSxoXVapus1p+Sy+9ro8wm4v/cUX5Jt4qwLGJ/k+A4JNJnC3NVNINBRSKtiyFVq58LT56etTCkxm+pWgyVAqUlhOK/Js90loNJIkEkmjWs4A+mF/XHv3/YLN6BQZ1I6x2QyHP8SxPEKNR6xl3f1GpZb2m+xujqT+iCTvVwW+tDs0iFMl3iQivdB59nia0NggtPPyiJtz/77z/kgWb2SJH4j/izsdsq68fISK2zC3TQzZwXcLzRG4dURAuckjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCvTZoNSvyoMqZzxIQR/q/ai6c9ycQYKWaEiuV+fVAQ=;
 b=icQM2M3KvL69lpINYC5BGdkniBKJfJ8hdIJBYTODmdNZsdMdUWqUbbVUwFDccox0HyrnUB9FhtlujnromDnuMcARkX5vVor5JwLTYg3Ut8rK0lEdtXEZOeHe3p+bldAL4Pxdao0WWrkUs0JFn798TlqCxy5UIYKL96iGTzBV7rI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 05/26] xen/x86: make VM_EVENT depend on CONFIG_MGMT_HYPERCALLS
Date: Wed, 10 Sep 2025 15:38:06 +0800
Message-ID: <20250910073827.3622177-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SN7PR12MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: a6bdd730-d856-4003-5e23-08ddf03d2c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tkKWckCL/rzUqz5rahUPinHjfkjStkZThLscodxhVZ6Y6Apf1X2LeV6ygtSO?=
 =?us-ascii?Q?by/83KWX65qJfycm28Z766ZUUP017kLu9/5QXFWl36/GhHoVN1qbLMMOm3IO?=
 =?us-ascii?Q?o9xLDzPbr8SDjBFc1d/fAySbvzrrEXvAxAFneGhTZDonmk/OXx51JiDmd0fF?=
 =?us-ascii?Q?yJao8yQsZUOG0BqNY8Vtm384jphq9HFqeOPPoAdTn+VSh33aiXL7yThk8Joz?=
 =?us-ascii?Q?Xv5N/tCVteMdd1Ja4PR3Fm3N6Ld7nSG2kfUTg1GWuyRGI9iChuuxEnT2KYoj?=
 =?us-ascii?Q?G+pVKrtcUkYjGyFD2SYfacHLr1/EuBVdso3t2f1X+CXd01KGdkU4UYpypYeV?=
 =?us-ascii?Q?sfy72332UtkC4GG1Eya8/BeljiJv9lZKdS7jg13i3kPk4FQAzTcQBab8SaxN?=
 =?us-ascii?Q?es1vHPalmxgNz1Ebmnkj6B2sSC9lyU6wmGtTAb8tXrB+d/faf6/4/v0pdIyQ?=
 =?us-ascii?Q?DudmZ+gaKQ8KQdz/Rhdps3topvYAk3lJbCZwLs5CzNDfa2mqtVUlU6qCA9As?=
 =?us-ascii?Q?8HlYw6HW0M8EDm0CYgX9a9lTFyS4TvAW8PUX9o2+pjlXV3ou0ooZWKobeXKO?=
 =?us-ascii?Q?+bq3cVBuzaPg6WsOSDexNxvqWiQoWDnw/3n7kHnDkI4WV/tcof3Zja2fSyDX?=
 =?us-ascii?Q?U4T954vfMci3NuAe6XdWi9BESbUvrZqmlrcXOB7w2eoI4ojOSdoDME+iKl3a?=
 =?us-ascii?Q?cUCneZQ3K6ZmBwxoJJyNlgS6cAqHaUatcwksnhbqYaUf7aqsSv0sxovIams+?=
 =?us-ascii?Q?kVqMCBnkqgCyILKbNS96cMhkM8PI+pAAdtuelK6bnDtigpFEwHUWTJKEWjaJ?=
 =?us-ascii?Q?2DPtGYMt3gW7BqpSbmmF/XvvXjCcNMP17siBxlXFJBwUlfFvEuVjQOKnkp/X?=
 =?us-ascii?Q?TgKBD8nl1yQQLDivRM4fWcPJlIZqyQ79Lhm3ozJaPShgeHsg2Hp8FPkf6C13?=
 =?us-ascii?Q?bqgmfag2WaEk/R7fuqkPTIIKl50WqKI9wbHvWGcjGMkhJc8pmTHg3ZkZNHRu?=
 =?us-ascii?Q?gIBOTB16KdMXBzv8V8/r5JY0472tTC0PDnv52v6qAAXBypofG2Tq9GGbCyHI?=
 =?us-ascii?Q?Bo4DeNuanchrZrJK3W3lZzeU6C56iTW7b3VB+cxnmcLjbXrVasw5Zv093+pY?=
 =?us-ascii?Q?PHEhrQoi+SDHs08TjRuX/kp4xulaVEdI9tgHC+r69srq4PGpV5z0nKrMcxNo?=
 =?us-ascii?Q?AHhCwrPWxabeITtUKqWDlkfbvrcfS/KieUJ/1E2CxWl25nPwHzhbMBytOo8J?=
 =?us-ascii?Q?2b+GzIBV+y90GavPIugIDE4ftulkDJmtHoiaiZbJ/yppA0FAQpmrcqEM7IoO?=
 =?us-ascii?Q?ZD7YgMxvhKbxfJlTkYzB3Vp77Qlsnx3JtQokUDX/ioTJBbIM1qBwh6HtXRBt?=
 =?us-ascii?Q?kWXD8yMuDxcke3H3vFuN29VUwFZiHcjQUuW8pjAVYI100kSC0awwihhO4Spz?=
 =?us-ascii?Q?RIwultnzrnQ+Xzia2AFj9Zo6HctuvFbPINdfWUtyU6cyZt2gjosTxekfWyD2?=
 =?us-ascii?Q?LMRHvkRJedhoPL26Ow0wIboGHpThkJuPygN6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:27.7824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6bdd730-d856-4003-5e23-08ddf03d2c02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8818

VM event could only be enabled/disabled via vm_event domctl-op, so
CONFIG_VM_EVENT shall depend on CONFIG_MGMT_HYPERCALLS

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- adapt to changes of "unify DOMCTL to MGMT_HYPERCALLS"
---
 xen/common/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index c1571377d3..1aedd00b12 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -176,7 +176,7 @@ config MEM_ACCESS_ALWAYS_ON
 config VM_EVENT
 	def_bool MEM_ACCESS_ALWAYS_ON
 	prompt "Memory Access and VM events" if !MEM_ACCESS_ALWAYS_ON
-	depends on HVM
+	depends on HVM && MGMT_HYPERCALLS
 	help
 
 	  Framework to configure memory access types for guests and receive
-- 
2.34.1


