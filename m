Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E606B1ACF1
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 05:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069923.1433599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8g5-0000kJ-OX; Tue, 05 Aug 2025 03:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069923.1433599; Tue, 05 Aug 2025 03:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uj8g5-0000hk-L5; Tue, 05 Aug 2025 03:49:29 +0000
Received: by outflank-mailman (input) for mailman id 1069923;
 Tue, 05 Aug 2025 03:49:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSY8=2R=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uj8g4-0000he-TP
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 03:49:28 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20623.outbound.protection.outlook.com
 [2a01:111:f403:2418::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ede75c6-71af-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 05:49:26 +0200 (CEST)
Received: from CH0PR03CA0217.namprd03.prod.outlook.com (2603:10b6:610:e7::12)
 by IA1PR12MB6018.namprd12.prod.outlook.com (2603:10b6:208:3d6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Tue, 5 Aug
 2025 03:49:22 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:e7:cafe::7f) by CH0PR03CA0217.outlook.office365.com
 (2603:10b6:610:e7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 03:49:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 03:49:22 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 4 Aug
 2025 22:49:20 -0500
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
X-Inumbo-ID: 2ede75c6-71af-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZVcV8fnXDZyLZAx8V7ZnDbi3ygpEPWeQYwuhbpHvxX4uO4Pm/SXwphEq2vHLPbpRjIslvuFVh9ET7X6AlM2lGSdnSedcaq5p/0p1a4GlutyhBimmmufteSjBMDB3Id5i6XNWXFFQEWqZgSeDuizDeTYK+I7E3V4VINEm46r0EtpXmA2qxj8XCQ5sgXE4TlzflINAeSCnPT8iWB41B/VLxP4f9wLNnm+lzYp16+foTYZMMfk/fRdTshVpFifSAdhm31cvjLU09iB0Q0jcqf7wzQ3q5anF1ZC/2d/ewRVmWQ32K27xuj+wjS1LO1d3aqCAKP3A9jYU3XkfsNxovoHsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIvdSMN2omhfq0yx+IJ8lJOiSVYj9P8CbuCC0fJlf7g=;
 b=lmTOIEFqlzLt+BByJz+IfR4u3KuBHUFChCB6tRXApwSsCI6ryvRDEXxJAmXUYnS23+7rVF1lM6znlZXZ7A92Xty0mYsa0jTebwJ7rRDndtbYc7mCXVEtheb0nRt2JK+tG4BRNy0T5+ur1MYAD3Z5A+8zWHLSLPLnExsx8YbfqYSN6C8se+QpwQpf0n3xri65XFGjMferZRkJRDd5FhQRaPA7Al3WoCuAbeh4AXBEZUpJo1SletHE5kZ4bZjWbQ/CQiiHoruGU1K7pMWUwZH//UmiIIMnpm3YOYSYWTlx33Ym1RH5WCy7pOCzcVsqFJvg9BK8vGB1PAfOLx85ZWNZjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIvdSMN2omhfq0yx+IJ8lJOiSVYj9P8CbuCC0fJlf7g=;
 b=KDZJ7K5Zu0da6haFblnGO/6WS8Kp6nxl/KZlwB1LdiWaJoAcKFmPnapop1rtEh1zdyFBfKDXrGqsa+sFJJdUPCrdDYXDy7iqK1A/3VAJLis7ReAN25td0hHvoa+IaEFsNDikF5WE2ib6fk7wlo9Dbh9sdcpXm/lm2T7Wk2fC0nk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v10 0/4] Support hiding capability when its initialization fails
Date: Tue, 5 Aug 2025 11:49:02 +0800
Message-ID: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|IA1PR12MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: f920b90c-d8d0-4480-f61d-08ddd3d31059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Rk10ZUlTK1dUZUNVYkxDYlBrT0swaWN0WG5ydWd1eVBPSXhxN0JUd2Y3clFB?=
 =?utf-8?B?UDVIc2EyUTdyaERIN1ZlRGNFd09WVEtIRUw1WURBekpINHpmdnBUUXJHclF3?=
 =?utf-8?B?ZVY4WDkzcVMzS0YvM0psaVdOTWZJMHZCU2JKQW1PYm4waElvZmx1em1OOXNk?=
 =?utf-8?B?UnJqY2hVT3ZVMUd2VWtibUl3aG56OWowK0RiY0FlMjdQVU1mZ2QyaGZUV1Vz?=
 =?utf-8?B?a0ZBYjZJWmowM1NJVTkzME9ieFVQUnl0TmMrQWlqeEpTcUF1SGs2QVdzVjdp?=
 =?utf-8?B?RitXNzFQNUljM1VtWTRoOW5CSjNGMkhvMHVEZjhWTHBqZzMxWmJlODdwTjVm?=
 =?utf-8?B?QVZIZXl0ZWMxMGlBK2lja0RCNkhHNnFzaHk5R003VmdwZlV6bVVEOEpOamN2?=
 =?utf-8?B?U3RaSHRjb0R1N0hoQVVIS3AwZVBWV3Z6ajA1K1B6UHhCMXFoRmR4UGt3emJF?=
 =?utf-8?B?Q2k2U2FLTGJZK0c2eVljTHNTRzJiRzhsV3pjTFJMSkFEUXNvTEVEZWw2S0Nt?=
 =?utf-8?B?Z1RVenFBVE5RcllJMHlsU1IvSjV4ajdzbGpINHVlVHFSeDM1QXprcEdMT3lm?=
 =?utf-8?B?a2FEbnUrV3JRTnFnVENhN2FyR21uYWtrQ0diNllaOWdBdUNVRXlyU1pZd3Ba?=
 =?utf-8?B?SjRBdC9yOGpmcEVJRUUyU3U1U0xJd2w1TGpRa1NoVGVDZXdyb3Ewc0NoMHR2?=
 =?utf-8?B?WmVQV0hSdDAvb3p3UTdwNjRvSEIrdFJud2tUMURFVzBycnVlR2VkREx0VWs0?=
 =?utf-8?B?OFhCMjcvMFNwRUk4eHVpVXk2QVNWUVJhcHhGa2M0TTh5MWNMZ0Q3SHNVRUJ1?=
 =?utf-8?B?cEtCM1RXa2ZPT3JxVCtZYVVFQ252czZhcDNZak0wNFFSbDFjU0hRZzYxZWRN?=
 =?utf-8?B?MHRFL0Y2ZXpwNXJmenBBWG51bkhoVE9NTWlWVTlnS0o1cVh6My9DUnVmQlY1?=
 =?utf-8?B?TWplQnJ3ZTMvckFtVmtvZ251dmloZXByOG1LdnhKM0c1b3EyUFdUSzVIQ0FP?=
 =?utf-8?B?NzFiSngwMEpOSnRRQ0NUUmtEZW5NbnVLaEtqVWpoN0U0aGZUNEplTzBRNE9x?=
 =?utf-8?B?TVBrc1B0Z3IwL2QxdmtNY2krcGhZMGhVMGVNWnlCeXRkY1k1ZFhEMEVhSXFp?=
 =?utf-8?B?aHptKzdDeEhvSG5YbkZ1azdLeUNmUUoxc1JjVWU2NTNkYmVtN2hkb0hCaE9s?=
 =?utf-8?B?c0JYaTlPRHhiQktqRGFpS1U4MVJUVm1XSUF5c29yN1BHSUVVNmpWVzdYR3BO?=
 =?utf-8?B?SnpWOUNIVmZQOTRjYUxkbjFsK2xtdkRLQW11V2RMRTU1RkgzUEE0clBCVTVZ?=
 =?utf-8?B?T01vVVlVNkx6Zyt2a3JNRDZqZnF1d3NRQlpHemUzeW9kR2w5cWpTQk5ycjJ4?=
 =?utf-8?B?U1B5aExZQjZpT1FvVHZ3MFl6Sk1XVVltcHFpd29RNGFKNCtHdGRySEgrZjRU?=
 =?utf-8?B?YUJnc2FZR3JtZmR3Z2VPUEJjWmlMNkdSU1FaR3o1dE9RdlpnWmhSajVZVGxn?=
 =?utf-8?B?Z29VKzh4WVFLTjZBUjNGaDk2UXBuSDQwUWE4VEV0ZlhscjRKTnl0SnZjUG4z?=
 =?utf-8?B?TFF5WTVDUzhJMVc0bE9CTTk4clVRK0s2RmgwVmJtaVhiWFYwR3dRUlUrSkM2?=
 =?utf-8?B?bXZoZVliNjVRQnQ4Z0xUQkI5L3hsMGgveERuK1lLcmc3MFJVR254a0RmZjNU?=
 =?utf-8?B?cUtvR1h6QkpOR05QY29qdUkvZ0xxblVKZkJFK3VhL25lejBkSmY2VXhIalIv?=
 =?utf-8?B?YzAzTExCbmQ5WEUxQkRSR1dSSmtGVVU0a2szemxpL2pvUnUwaTVTYk92UU1L?=
 =?utf-8?B?bWxzaHdaYWhtUVIyV3NLdDdNZGgyVDMwQWkyRVNvZzhmVXN6aW1aNjYrV1Nw?=
 =?utf-8?B?SExoaTBHRks4YnlOY0g0RXpGV1FZa1RBaEszK2xWN1lUdUhDUFBkOTZGMUdw?=
 =?utf-8?B?TEMybzRxbHViRTNocTlDNFZtcFhYTUFxendQKzlHcWFoQUZEaTNsK3BKUUIz?=
 =?utf-8?B?MWRxbUdaMVErUHJPSDFvUmxqQnNTRngvWkVhejNvcEduUXAxZS9oMHlFUW5u?=
 =?utf-8?Q?BmnJsX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:49:22.1825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f920b90c-d8d0-4480-f61d-08ddd3d31059
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6018

Hi,

This series is to
emulate extended capability list for dom0;
hide legacy and extended capability when its initialization fails;
above two parts had been merged.
remove all related registers and other resources when initializing capability fails, including patch #1, #2, #3, #4.

Best regards,
Jiqian Chen.
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
---
Jiqian Chen (4):
  vpci: Refactor vpci_remove_register to remove matched registers
  vpci/rebar: Free Rebar resources when init_rebar() fails
  vpci/msi: Free MSI resources when init_msi() fails
  vpci/msix: Free MSIX resources when init_msix() fails

 tools/tests/vpci/main.c  |  8 ++---
 xen/drivers/vpci/msi.c   | 46 ++++++++++++++++++++++++++-
 xen/drivers/vpci/msix.c  | 44 +++++++++++++++++++++++++-
 xen/drivers/vpci/rebar.c | 41 +++++++++++++++++-------
 xen/drivers/vpci/vpci.c  | 68 ++++++++++++++++++++++++----------------
 xen/include/xen/vpci.h   |  4 +--
 6 files changed, 165 insertions(+), 46 deletions(-)

-- 
2.34.1


