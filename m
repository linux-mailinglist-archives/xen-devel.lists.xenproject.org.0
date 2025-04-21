Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC53A94C7F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960835.1352497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVD-0005IH-Nx; Mon, 21 Apr 2025 06:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960835.1352497; Mon, 21 Apr 2025 06:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVD-0005CF-Gl; Mon, 21 Apr 2025 06:19:35 +0000
Received: by outflank-mailman (input) for mailman id 960835;
 Mon, 21 Apr 2025 06:19:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVC-00057u-Fr
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [2a01:111:f403:2416::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 939cfaf2-1e78-11f0-9ffb-bf95429c2676;
 Mon, 21 Apr 2025 08:19:28 +0200 (CEST)
Received: from PH7P220CA0109.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::11)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Mon, 21 Apr
 2025 06:19:22 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:510:32d:cafe::1e) by PH7P220CA0109.outlook.office365.com
 (2603:10b6:510:32d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 06:19:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:21 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:18 -0500
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
X-Inumbo-ID: 939cfaf2-1e78-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZ129VGkzxPiFxxvFB57gYMHtXl0LgwWTBVNTvpWMEeptOoovRkRAO8y2HRKQ29rqqnC2XM6FSnN8Ylg41MHIBlbRBNFHv+1FwPPEFnrogqlxsySoC6B0iy86eaXwLyZ7l70j2wx5eZwlSeJqANklOW9nAHTO2ZysScuStRl4IaYyPlGjttTB4Jg351IWVsICF5PFCV2EvL4ILN1BIomy114DteVpr3N8G+PU7pV9TEEIWl90sBflzq/kqcsEN67I3y/DdpNcOJ9wQeIHNQ4/6e4cS2sSZD8ksHFDoydL5uKWV+5MXJZKPUr7kHeVt/MaIG2cU3L/V52xFRdymU1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VDTgeIvmCxGe9tqyXSiSHeXMpWYHb1zgl16pTf7OIo=;
 b=MOyXwmKNbIaPsQsZolzA+eGiuMLTsV4ir008BbMJKhGEReGooeT9G34MiHEl/leImDW34TCgQ74Z+9+BgfZRjWowD+UdTl8bzO5bbBzJeEHOfcg/o7rgWK0cRCG68YOGtEYsVs25c3mascX1kA6Si2SBosZD0F/4FmZ/7E+5Nks16Ecl2T5VhgfjyWeGucEJjqUWxN9dXWl7+XdF8RftbHiFXdYCoNai6E8LpwDxk8cpQlHDgyXNSPJ+xqDqMviBVkSMHTodSRkVBpYvzidJmVHncjiMV5g8qbmlmI5OONk+/ggQO61NVeX2H2QNZxLGGo5P/p3ZaDuboNVCKAc0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VDTgeIvmCxGe9tqyXSiSHeXMpWYHb1zgl16pTf7OIo=;
 b=B3D3o6HPN06Oap0lnyZMeuxylV7tFSBop0hkqLeyUxeheawLPiBMF3yaHyj+VsQ/RpNtMO2BSgI660IMoH4kbec9RL81BQ5wGKLkAtOvkj53JmLD2IEoC+7G6NvG9hqdZwVIWEjTcquOU6sMQBTsUmL+S+qSfqrTNrgs7PSL0es=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 00/11] Support hiding capability when its initialization fails
Date: Mon, 21 Apr 2025 14:18:52 +0800
Message-ID: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|DM4PR12MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ba1833-949f-4c95-a090-08dd809c749e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vm96OWNETFA2SjJJWlZrRXg0UHQ3NWNHbS9nSzlNUXhyQmxjaTNPMGR2T3ZL?=
 =?utf-8?B?dUUwNmhqQUxTcG5DQUJsZkJjc1VQQ0FuczhnYzBWeXZkNUZBMlpoemNrS1pN?=
 =?utf-8?B?dmtML3pnOEN4UVI5YlV4V29VOEdtOVNiVlZnbjBkcGhqTHJOSnIydG5pdFVF?=
 =?utf-8?B?bllWSmxFUUU2LzFGZDdaMEdaN0k4aTNuVU5tUHhsR2ZrZUhyQjV6Z1hMeiti?=
 =?utf-8?B?WUFYeXJueHZLZ0c4TWc1VTgzblIvckYwZzF6OFpaRFlZeTE1aXdNenlhRnA4?=
 =?utf-8?B?eDMwMmNWNlgvK0hnZFYySWY5MlZ6RGZVWFE2aHVmQllvdFVkUE0xeE5FSlVK?=
 =?utf-8?B?c3JaY2N1ZVFtQTAxeHJCY2o4QklvcmFLekFlM3hFNFJwWDYrNkRLeElUQVNF?=
 =?utf-8?B?d21rTW9wNWc2dzBVZkU1cGFtK205c2JXbDlZQ0RsdHc5N1UzTUIzclZHTkhP?=
 =?utf-8?B?ODBPanorVTBrNFJBcDhUMWpTSk5oVTlscFB4RFhJdFMxMHduYXdJYXJmSWha?=
 =?utf-8?B?dDZqaU13dlNWUXhEMzgvcWpGejFobjNxdzFjcUlSZVRnL2lvTS9Tb3pZNzln?=
 =?utf-8?B?TUJGbVBkZ0JHWTVrT1d1OEQ5eSttU2tUeVNrcVBFYURjYUJlc2FLN2RwNmI0?=
 =?utf-8?B?aUlvNnFoQU8wU09XdHVoWG53Lzg3OVR3MXZHOFVlV1ozbHpETW8rWExlQVJ2?=
 =?utf-8?B?andScjF0VUl0ZlZIOTlBQ2JlTHFoNXFKM0NVVXZwczZ3bWNOK2tDNHVnbjJD?=
 =?utf-8?B?QlBBa3IyS3JZTVBwUWlDUEdaNHVTWEFNSm1kWjhFL3E3WVYvRlBKRXhULzVL?=
 =?utf-8?B?UWFXWWxQUGdOcUVTbEJZSFlZUTZ5NVltb0tONkt3OXpWYXFsOENPMjhNT3Bp?=
 =?utf-8?B?MG9yUDRuMU1QUFRvYkhzcmZ6M3UxRGdFb2ZLMkU5WnRnNW9LeWpOWlNCWVNv?=
 =?utf-8?B?L0dlRXUzbENSNnBoRktSL2JYb215WTJ5SDlEdDVJalpLL2RVdk41Vk1mMmxw?=
 =?utf-8?B?Nk9WYTY5SXZzK2lUa3V1d3hpRFVVR21acXhwdFBLZmg4aS8xT0FmRWc0Z3E0?=
 =?utf-8?B?MTdGeHhsU2QyWFBrWEJLb1JnbUtWcHRyL3NUZkpxU0p5blZYK3REVkFrc3hS?=
 =?utf-8?B?SXBqZE4vWjFSR1hlU3FZck45TnRSR2RBSUxMTm9vbHFEUlA4NXVnN1NzeUtU?=
 =?utf-8?B?QWZ4Sk5VNGgyTjJWYm9uRUhCYkQ0bTBhVkVJZ3JmNlRyQlNsb1g2QUE3ZkJH?=
 =?utf-8?B?dDVvcFpBY3puaXdvV3M1VFdFaHY2b0t4RGpUellTbkFNd3hJZFFXUE1PZldH?=
 =?utf-8?B?VkIrTmJ1YUNUV3hjR3I0SSt3cGJRY1B0dDFDM01vL2ZxSjdwQk1RdHNEOVhK?=
 =?utf-8?B?UUdEcGRUVTdpc3VQUVI3dDM0em5DdlI3MUlSd2RLY3h2K2FmM3haWmlzT0Iy?=
 =?utf-8?B?OHNXQi9LbWoxelB3SUh6WDdaVDg3RjNkSTZDYWRVSVplTUllQzNXSkNKVGYr?=
 =?utf-8?B?N0UwL2FCUG1TZ05iVGJXa1R4ZFdmNW1TMlRVT0l4ZVFQdkJBRzQzNVBMeS9Y?=
 =?utf-8?B?a3FBMklneFhKeFd5d1lxY0FTUnM1UzlQZEhFemVMOE5FejlpaVVHZ0M1VXg4?=
 =?utf-8?B?OEhxSk0xK3JvMWRKaGpSUW1QL283TE1oT0ZaQUtpckhzb253RmwrZFQ0ZndM?=
 =?utf-8?B?MlJCU280V1A5YzFwcUZ6Rk1xQmo1eEpncVBzeTB3Z080dm5vQXFSSVJqMTNq?=
 =?utf-8?B?cTE1OS8wcHVZbmd5VVI4MUlUMWphNHREaTg4QTcyVVFabklxWnRmakVDTFdV?=
 =?utf-8?B?N3J3bmJjOTFrRW5kdU9FT0xXYnJLY2F3d3FnOC9YV1l5MFdPWTBISys4WVpC?=
 =?utf-8?B?eWlHbURab29YSjZBME5oU0VVeEg5ZDZ2VmlLY1NjVDh5VVhxUWZQejVRSzc5?=
 =?utf-8?B?RlRtUDJaYjhabG5jbFg0RE5vT2Q4bThGQ2VlQzJ6S1ZZcjBkSFNpQ2d6UmxS?=
 =?utf-8?B?SElqejlLa1JuRHZnNEY5eWI4RmozVExWTktJZndlMDB2QU4zVjJYb3BLc2xp?=
 =?utf-8?Q?HJJwCF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:21.5034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ba1833-949f-4c95-a090-08dd809c749e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844

Hi,

This series is to
emulate legacy and extended capability list for dom0, including patch #1, #2, #3, #4.
hide legacy and extended capability when its initialization fails, including patch #5, #6, #7.
remove all related registers and other resources when initializing capability fails, including patch #8, #9, #10, #11.

Best regards,
Jiqian Chen.
---
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
Jiqian Chen (11):
  vpci/header: Move emulating cap list logic into new function
  driver/pci: Get next capability without passing caps
  vpci/header: Emulate legacy capability list for dom0
  vpci/header: Emulate extended capability list for dom0
  vpci: Refactor REGISTER_VPCI_INIT
  vpci: Hide legacy capability when it fails to initialize
  vpci: Hide extended capability when it fails to initialize
  vpci: Refactor vpci_remove_register to remove matched registers
  vpci/rebar: Remove registers when init_rebar() fails
  vpci/msi: Free MSI resources when init_msi() fails
  vpci/msix: Add function to clean MSIX resources

 tools/tests/vpci/main.c    |   4 +-
 xen/drivers/pci/pci.c      |   3 +
 xen/drivers/vpci/header.c  | 174 +++++++++++++---------
 xen/drivers/vpci/msi.c     |  28 +++-
 xen/drivers/vpci/msix.c    |  27 +++-
 xen/drivers/vpci/rebar.c   |  35 +++--
 xen/drivers/vpci/vpci.c    | 290 ++++++++++++++++++++++++++++++++-----
 xen/include/xen/pci_regs.h |   1 +
 xen/include/xen/vpci.h     |  34 +++--
 xen/include/xen/xen.lds.h  |   2 +-
 10 files changed, 459 insertions(+), 139 deletions(-)

-- 
2.34.1


