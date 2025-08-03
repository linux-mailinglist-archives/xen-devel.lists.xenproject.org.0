Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC27B19355
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068425.1432516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMo-0006Pb-8Q; Sun, 03 Aug 2025 09:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068425.1432516; Sun, 03 Aug 2025 09:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVMn-0006E0-UF; Sun, 03 Aug 2025 09:50:57 +0000
Received: by outflank-mailman (input) for mailman id 1068425;
 Sun, 03 Aug 2025 09:50:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKZ-0005K3-Pw
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:39 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20605.outbound.protection.outlook.com
 [2a01:111:f403:2414::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 078dab3e-704f-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:38 +0200 (CEST)
Received: from BYAPR11CA0046.namprd11.prod.outlook.com (2603:10b6:a03:80::23)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:33 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:80:cafe::7b) by BYAPR11CA0046.outlook.office365.com
 (2603:10b6:a03:80::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.19 via Frontend Transport; Sun,
 3 Aug 2025 09:48:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:32 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:29 -0500
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
X-Inumbo-ID: 078dab3e-704f-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ew588I2azHyNP52LSvymHHJMI01ouCIAeK1roc713xDrAlA2W302kUVzH5atW+mtpaCQWN3r07tKgibx4S2buJSJfz2W0ot0S8MzzpzcFZyVuqtuTvA8ziwVMRxMTJnsmZFirNnJio4r96+ZeBLRZwue/cRnTF2+fhNBLw4hW/+KAWd5rtPTfaffANVk7DoXBaEnAttkgDlSRcphJP7/eeFzBHlHfZPIql2CfUX+2VOJ9/eFvEyzuqLunyO7G1g4o3ErDZo7QxVvsmc5DEhZYq5zDzzyY4LHX6HQ8iDrTZ8ZLFHML+dpAJY0jimogQwWaGbLnJOQ7ZEpNtmboIL5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjKk5H6CerbuMm5ScZNoQuw4IXN+Kw8YIwQRV0fVnL0=;
 b=E0Gc6dItEIq8jNgwQpbhh5+XEA0c1RuqJFN8eAadlOXOYYSq94t2+3hpOqwr8b6LBr8+crbPnUdBPI85ITe10ng7+eUDUHcFt2BrqIg/dAA9SO5p5OjSZsTKN5O4gbs2ogNOaex4WsZ7FFYcmwr3Ulr5Z6DMidzE+S7MeDsdPo7TNPXSXbUU9ic5QeElrTdpXVvqQlex7oKs6GUmmkl1Ny5cboJZpbREAX+z3Usjfxc63ne307BNZYYJNFbWQdB7yC9aSph705BNANPtZiNqXDCR5nn2VDbQVKjS6S67JB72LoiE5BeqbK1vO8/Pm3nmmMJZ3piaa6/hKqUuUVlzog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjKk5H6CerbuMm5ScZNoQuw4IXN+Kw8YIwQRV0fVnL0=;
 b=RHKx9g86QuSQCO/XzLxDDvwWDQVlfnNBD9jx/UDUMrZHzKFMJLCpWt3wDGHBw+RozU34RRVjBN/dRABsTivcK+JPd7DRrm8iJ/WWEPZTmb9kSe+yRKgpuaNyBnN55B5qK9pVb1SqSJWQubnoriEas/xGuFruvLFE+BwTGivgkS4=
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
Subject: [PATCH v1 10/25] xen/domctl: wrap around XEN_DOMCTL_setnodeaffinity
Date: Sun, 3 Aug 2025 17:47:23 +0800
Message-ID: <20250803094738.3625269-11-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: fae9d576-6f7b-4258-ad12-08ddd272e8a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fFyzD7CB+PBrKDYb1cUOS+HEhlEAIhPu5/KZA2AX9vSQzuj67E5mAF5kCBCI?=
 =?us-ascii?Q?ItOsdm4eGyOPi8+HGxbNKmrYSwP6ze2COQvMwZOstzc2mLhVzaPbvkzYIx1T?=
 =?us-ascii?Q?Fw3SaQBXS1TRvN6wG5X4bueRff4L+rCMLhHYwKEhIl6RVPoQ7KHzCsv7J+jq?=
 =?us-ascii?Q?g+Hdw28QMW4EcL4LkNqfKjkZtFIR75F4ebi1ejoBSB4CWbTQO1+2zMncYAid?=
 =?us-ascii?Q?71N8EDBwc/UmZWrC70nUzBkEe1gFIAHt41w32mQxV5nO88A3dmPRJoxoh7FM?=
 =?us-ascii?Q?QM+rVsnfK9fjKPWcsQhxMOAyiCM4f98AEBE+SFYqHFaPZ+qkJCi4SpJccQLK?=
 =?us-ascii?Q?gIUvCnSQoMTJasiouTbQJc9V8Mc/p4bLjimaLfPSscVFUk7M64YBhcw9qqAr?=
 =?us-ascii?Q?tEQp7f2uGIF5f6EE56MpAb3Gc0uMrv+oxzVgfJ3DgR4OvIfoCM+XxRgbULpI?=
 =?us-ascii?Q?xTWwbNlD+R8PvWLtqyTlVcb7jlYysTOavbE/LzmXrIMdl6ZEsgj+tWUyxUfX?=
 =?us-ascii?Q?UDx7bzHBAOms6AYJ2YBfI8nPg06CvJ9h8TV7IZD5u1SIFJhESDSrzYl4bvsQ?=
 =?us-ascii?Q?iW7rYAhyuo48NoiiKBWQtNh6IVfM+axSTh/NehCMNM95eKSB2o5Mn2LAiznX?=
 =?us-ascii?Q?dSBMowt16mMMWqlQtkWuPWDY9HT4IY3iSm3vKqjoMLxEjImzebWYuXNMGdCf?=
 =?us-ascii?Q?5D8/rhzaTlGKmQT8SdKdmNhFh23uOTmMQODrojGUHfpD9zbA4kAdMfTF3Q0t?=
 =?us-ascii?Q?L9rFe0wAsJ4Rk2L/PktMoahk3rMsnFlk2aCG1QH4sejjJIxZ/6LnXk3X6y7b?=
 =?us-ascii?Q?qkzRgRZ5gQHPWb3wdH7RwYin8iDo5znIXvAEp7ruFmfiQuJCCT7IoUdR+hLm?=
 =?us-ascii?Q?ktcBKDgFNN+vBKmLI5etc20aBG+Sfi9AvyMwBppdON0WtDSnJiCp4kIZzRrX?=
 =?us-ascii?Q?tZpd2U62uoAJg0JhprYe3L516cDDX9XapnC2o1tDUEBAGPBj+8Pdbju5I6i0?=
 =?us-ascii?Q?2naSymv+z4Dh0EZyysLYd78k0Zp70WHX0/3coZ1+VxkDL3sdRwUI8NYUrFYo?=
 =?us-ascii?Q?Dyapi2kbKZdKu/yB0Xe9HZeg98vDUaUhrJYT6SAOPuonrOpvyRzO6ovP1LxF?=
 =?us-ascii?Q?xrk5VAepD/O8X6QPVlaZ+O/EVmxmli34kACkMVLRQzb5hlklRQ5TPp4crn5p?=
 =?us-ascii?Q?KwDFI1NSscZ62dPJkzv/DA5jChjLAeaXu1F7yyqfIVNVmpYQrqg5zGdUntLw?=
 =?us-ascii?Q?Hs1Pn445NRYCmRH6wRKsOGE+nE/Qe9BGkZEUO5OUKcopAeBTzT0nCs+Z/7Ul?=
 =?us-ascii?Q?xkYRfI924uOveW/7Fq71KXbMS0uCtcgNaAeWjJTWCEJ/a1MyYq9fuRpu5DQx?=
 =?us-ascii?Q?ABNGumMyTJVRQs49L9znmmQD2jkk62I3VOw02oCiLJjvpG/FAzJSzPmHjM8S?=
 =?us-ascii?Q?GI55rXjSgwacFbRhPugbwe7s2UVjze1E85oSGYpREvG8IngcQC6Sn3ekb0FS?=
 =?us-ascii?Q?31AeRn7OP2lPRoFXo8HhCFz0dsLWlI8Etazb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:32.6151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fae9d576-6f7b-4258-ad12-08ddd272e8a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772

Function domain_set_node_affinity() is responsible for
XEN_DOMCTL_setnodeaffinity domctl-op, and shall be wrapped with CONFIG_DOMCTL

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/common/domain.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index be722c9f09..22313d761b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -1097,6 +1097,7 @@ void __init setup_system_domains(void)
 #endif
 }
 
+#ifdef CONFIG_DOMCTL
 int domain_set_node_affinity(struct domain *d, const nodemask_t *affinity)
 {
     /* Being disjoint with the system is just wrong. */
@@ -1125,6 +1126,7 @@ out:
 
     return 0;
 }
+#endif /* CONFIG_DOMCTL */
 
 /* rcu_read_lock(&domlist_read_lock) must be held. */
 static struct domain *domid_to_domain(domid_t dom)
-- 
2.34.1


