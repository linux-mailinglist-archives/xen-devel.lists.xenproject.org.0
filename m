Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A7BCB7D3D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 05:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184896.1507214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQW-0008IR-0H; Fri, 12 Dec 2025 04:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184896.1507214; Fri, 12 Dec 2025 04:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTuQV-0008FQ-Tc; Fri, 12 Dec 2025 04:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1184896;
 Fri, 12 Dec 2025 04:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oKBw=6S=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1vTuQU-0007Dl-NJ
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 04:06:42 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6a96121-d70f-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 05:06:42 +0100 (CET)
Received: from BN9PR03CA0943.namprd03.prod.outlook.com (2603:10b6:408:108::18)
 by DM4PR12MB5866.namprd12.prod.outlook.com (2603:10b6:8:65::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.10; Fri, 12 Dec 2025 04:06:38 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::3a) by BN9PR03CA0943.outlook.office365.com
 (2603:10b6:408:108::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Fri,
 12 Dec 2025 04:06:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 04:06:37 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Dec 2025 22:06:34 -0600
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
X-Inumbo-ID: f6a96121-d70f-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=neiIUiL8+UYO6+/iz5uvzP81WNLMOtxqUO1/FCIpzC8bbvx6Mosx2HPRdvw3G8kOiTgXFKDlOWZKva9mxRORADMA2+mXKxm/kTA40aPWHraljd6C/9ivsSnZCUMoNpyCzKW6D3BXx3ebIqUlWefEoGbvH2OCJZE8EJLfP0kRv6FLL50S61LrD6UWa9rSFGFA1FsrwYByzkY3nlD2zveYWgMfOivXdpssztMny+MUZgfLKfkqL9YT0Ow+1Ccx/aecoW29O1VYjgniUevKPHo5UxzfUSpejazWTOj9fjA05muw1bqCuumz49fO7xYaVZThS7oj0wmG65i+DJk9jWu4zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tU7WN++E8sGJQqM5bzkULDc4QRrCLty/nbwKRMgzHgo=;
 b=JTGtbPxCrtSAv18NAbG+gObbQ5fZrlC7YnSTWBVWYLCaMOgMbdAvfPuyXDcU5xnavVOkYr5ikqK1okDLLVEZEqs9RWqt9ioXd9MeEfCodDqY7HsAdTzQffNCzXpL5jFJq1zTDCLNa5ombuxFOFaRTzwS7rTe5Llbz0Jt+EsKvs4xUNUER041ltGaBS53IxSGIgKMojVISREDxZi6U0hPIe73CgYQXh95OBMi2rkrkJM15P9U3WL57xd0n/zuPU6sMa2q2Sh7X1uaBQNIRJ41aJMIWLog7wu8MuubHsltDpKyNvsTAJibdYSVySawX1/rXXvvKaiHZr22KFmYCtntWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tU7WN++E8sGJQqM5bzkULDc4QRrCLty/nbwKRMgzHgo=;
 b=xZwjR93WzkxPezJuHGwgNlyfg0T6srouPfiRbORvmb7zK3naUgyrVjrtHnUxmGfaEyY/VCU14H2wtcFCD1/20+4kbnW9f9nw0U0Ss7GggDTrhdOumqT3G+6wU5kBE7uq3Trg3lJk4zsep9Aoa9IqD8QC647GEnaAO1HgytS6DMk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, <grygorii_strashko@epam.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v5 05/24] xen/domctl: make MGMT_HYPERCALLS transiently def_bool
Date: Fri, 12 Dec 2025 12:01:50 +0800
Message-ID: <20251212040209.1970553-6-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251212040209.1970553-1-Penny.Zheng@amd.com>
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|DM4PR12MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: bf747ca1-ffb7-4408-451d-08de3933d8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fgQ+bFyE48U+ki6H4xhXvAV526BPcTEStVHotJakbpoBXhJCbD9QCaWXQvGD?=
 =?us-ascii?Q?yuRpCF4jzJnLANxTrqmcovkF/kjIeeiH2UYUfHRbOGWlJ8hqDQAxYPId70Wp?=
 =?us-ascii?Q?waQjXq03YgfgnZ37s1+4EgyPtAJ53Lofk+VEY0qc+EJ9i1Fo5Znb1kYICPdt?=
 =?us-ascii?Q?NfxXXxeIlTiIFQdlv149KCIhJ4YxcZpj3jSO1PbFdIMuXNua4Gg+TvHfhKDb?=
 =?us-ascii?Q?k+7td068mNfuR5I3ERmr4RenLfTVdBj8iPcRt19rj9Ne4DuKnt15KQDC8WXc?=
 =?us-ascii?Q?fEc+HF1ZBCjbl9juX2kErGhMUrDRaKwLLdq86txdMA5nmkqwa6kvLsT0Wfbi?=
 =?us-ascii?Q?1w/X1vkVcp7fvbhkKa6dvJgcpoEecyGk3x2jg8l1nNapXym+W4bZf1hQ1uWa?=
 =?us-ascii?Q?k1hc4l6472wYV217PBO+NaGgiZLclxfToe1HQisKh6h+r1HZJGSSf7POj+RY?=
 =?us-ascii?Q?MdqUKmSWESdONlePvpNjEfJne9Ri3oBOj1uwiXIl1vXI+MIwoqj2czv14Im9?=
 =?us-ascii?Q?nmBgeZ78/nYgl17+QQll6iVoBLJCBnDO2gZ5PtT1ijBTZeZJahfY8xRHvQtB?=
 =?us-ascii?Q?MQyiNdOxDVjqBAxj+17CwowQHR+ioo/6Jp+rfdk48UpE78bRHy9pptXQJ7kA?=
 =?us-ascii?Q?XCGnf4fIYJ2UIF+24djdIgDdn5j+ARpUXea79yfYRxzpOAKKLoFRqnOha5Sz?=
 =?us-ascii?Q?SalHQ6V+Ergcq+7FhP+Hvn2PjaukL4MLYfITC9RV+0Bi0aeNKGdaVo2CJ7wd?=
 =?us-ascii?Q?ts26gnuciX5sGuYSAM/5f12xpLOcdCiYKmszfF4timPECt48iipKLcOzESbl?=
 =?us-ascii?Q?nOLwcO/opQBXMl2Q3ELpRrgSxREKvyz8ZT3GQPteCNS/BWQyIjWpk5yu7mqp?=
 =?us-ascii?Q?WfUS9DSuA+S9l0TNCcJGZxOTJWvu585YaFFrzP1SDhbOIYcS+MV/5LeVvvNd?=
 =?us-ascii?Q?TUtqhCb4ebTTxPTkxBZu//E7SRU/3YP0O7ByCBNQ5zQhPtfvwrHqmVem2Wbp?=
 =?us-ascii?Q?Ib8yj5H4/bk9pAqXFpZcKvyThJ27U40m+TZWR2auW3oLnk4oP0wG0OOHY4D8?=
 =?us-ascii?Q?dIlBliOXhI/J9AJwk9WpzkLO5z9D4qqvV8Dp53ZYp8J30BPoHqdfz9c9xRnp?=
 =?us-ascii?Q?/Jmm1FTzyneIsNqKMs8leFafaGsMs5mbpykrdki6tD02O6vP4yEDnMtZqCVR?=
 =?us-ascii?Q?MgKjsROCO6x6mXdUrNKbcCkT/ARZ4ezyfPJblQIDyKqQUBoIokpgsTFyRB4a?=
 =?us-ascii?Q?OtX7HhaKLGtYRG4NT3j+bUpKe05dHwMAC/1VCGzz2+vVzSeMiLWgqHNFBqE+?=
 =?us-ascii?Q?bZ4Il7H3G/EL241jGdkyhXWT6a2bTgvZD45BbxF6Eh4BzKsf3ZrUNYeWb+Rs?=
 =?us-ascii?Q?E81t2hk7YHMIn7ujb7+KDYAUrrLwJw9MSbFhAybym956BP8rdUQQEGh2z1+L?=
 =?us-ascii?Q?2kRoQpNz8w8WfkbXPTWoRwh8udGVk4E/nS4qlDbYVaT4cCMn+fgIW7c7WWlr?=
 =?us-ascii?Q?FDKva19tZgAGR7uLCCnMAGg5y2Arb++GH0vcpb07KQ5qWtGYxdbXLXvj+cQV?=
 =?us-ascii?Q?5wlmtoe8eS+dlMNNLbE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 04:06:37.5148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf747ca1-ffb7-4408-451d-08de3933d8bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5866

In order to asist in reviewing/developing disabling domctl-op patch serie,
we will transiently make MGMT_HYPERCALLS def_bool. And it will become
optional at the last of domctl-op patch serie, where common/domctl.o's
building as a whole becomes dependent upon that setting.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
v4 -> v5:
- Remove "bool xxx" is to actually remove prompt
---
 xen/common/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6709c3c95c..7f7ed62f78 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -652,9 +652,8 @@ menu "Supported hypercall interfaces"
 	visible if EXPERT
 
 config MGMT_HYPERCALLS
-	bool "Enable privileged hypercalls for system management"
+	def_bool y
 	depends on !PV_SHIM_EXCLUSIVE
-	default y
 	help
 	  This option shall only be disabled on some dom0less systems, or
 	  PV shim on x86, to reduce Xen footprint via managing unnessary
-- 
2.34.1


