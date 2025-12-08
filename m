Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755D9CAC79B
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:18:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180064.1503314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWS8-0000eM-UE; Mon, 08 Dec 2025 08:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180064.1503314; Mon, 08 Dec 2025 08:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWS8-0000d7-RR; Mon, 08 Dec 2025 08:18:40 +0000
Received: by outflank-mailman (input) for mailman id 1180064;
 Mon, 08 Dec 2025 08:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmTq=6O=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1vSWS7-00007V-Fj
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:18:39 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f51d94a-d40e-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 09:18:38 +0100 (CET)
Received: from SJ0PR05CA0023.namprd05.prod.outlook.com (2603:10b6:a03:33b::28)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Mon, 8 Dec
 2025 08:18:33 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:33b:cafe::a7) by SJ0PR05CA0023.outlook.office365.com
 (2603:10b6:a03:33b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Mon, 8
 Dec 2025 08:18:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 08:18:33 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 8 Dec
 2025 02:18:30 -0600
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
X-Inumbo-ID: 7f51d94a-d40e-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPzqwb0MQgftHQ5ILhVOkl2abESmoF5IHGG7ohk6KTq3iIPiegxz5GTHQiKaLHGTCrU77MoJpHysr7gkfSk/I0wSQzBWogavA7P6Rsb4pJFnJFq6lQHWYkBCKH8KDClhZHXxA52dJaHrDu0gQhow6d+q7mbcT6IDAckohujo3eEHpWZyzeey7PFaanMOL8mIHBum7z1dKKsAa/bEwanNmv3wkUjjBeFHLe1B8Vd7KSjfFdfFjAcKBmxW24SukWa+D2+sHhWw7lFs1APfojH1qzk7IUD2OhusrTJj4Q0Q4G7k6qyG0Gw0H65CWnDGepqN50g5iaNrJtpjYVa9leHuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=if4zckH1ms1SlGimH4Cf44Gw9F5Qws+I7sFOZ7Lwb8c=;
 b=ax0zY2oU6QRfdXtBCACFzUco/r8gMP2qKeJxjSpIwpLu7p/ObVh8ufvnGqwl1okHspI/btLA/VvztCdkUCVvxCSfuC2OEcwQ0RTgqLihy6ENg7mNLL50Xkr6m0WWdz7gXByDidmcP0xJolFENrRYDfMsJLyKctnN8ZuqZU7/v3I5VkXatFzyAMktzlWSxNaUBjt4ZR6z5Toah/PV8/txWX89p0ofRDbncj2iyX9ZqiTyApknBYfxQPqmpQ2q0EQL6vEmnkOFlJUthAU3A75x+VaYmpe6co1LyE6LcOhfyvW6zvktLNqcY/smB07I7/V5UA4AbLInID3FqbQk827YEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=if4zckH1ms1SlGimH4Cf44Gw9F5Qws+I7sFOZ7Lwb8c=;
 b=UsYmmn5mCOqTy7LwZnlSSnPbon0Tw+dtDDO8fg+U6vJY/UsPmFlh5qJ31OzlWRLZYDl5fkVHr8pkyxdxwztepUxg5s4gVVNbDY1TOrCY+GrWHPLZaoBy0Eyb1NzWOuWuDmDMNkqxaIzKRRGo+wMO42Xnq5hdnwVEZxCa9Xg+Mk0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RESEND PATCH v12 0/3] Support hiding capability when its initialization fails
Date: Mon, 8 Dec 2025 16:18:12 +0800
Message-ID: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 76dc6d0d-e2bc-4713-28d7-08de363260df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2hhcEZDa1AycGUyMUZKVnVlenJHZWh1eUNuamNuR0o0TkxEMW5XN0FKTlFy?=
 =?utf-8?B?SGhCYzRNZm5BNVp2SXhaUGxySUdQdlBqSURwdnJQbUltVnpxMGNldkJTbFM5?=
 =?utf-8?B?SDhDNkg2bDVGYnBDTlZxc1N0ZUl5VFBBcGZpa090QWlKS1lNOHVUYVVwOXBu?=
 =?utf-8?B?K1JVYmhFdjVPQXY2Qjg3Q2dSL0Y1VG0zaVF0L2FaNEVHRnVuUENzVEhMTDVj?=
 =?utf-8?B?WmU0eTM4S29vM01sY1BNRllhbXY1VVN0Y0RjM2I2Q1BTS3krY2xQMzBmU1B3?=
 =?utf-8?B?elZqS3RyQXhHTU5vR2UvZzcveTFEcUF4SVo3YXNDUzJyL21uMVNQUWFmN0Y0?=
 =?utf-8?B?UWx4dEgwQklPYTYzMFErRDlFMHptWjFCMXJTNkIzNWFyTThDbmpEU2VnTDVD?=
 =?utf-8?B?TnBreE5YUThJdTBmdlkrOWhYQk9qUUNuTExDYVA3RWRTVXBVa1doemFQZGpQ?=
 =?utf-8?B?Z1BBamlYUGdjWE13eEo3UDlJdUt6eUFLMWFiN041SFZXL3dueVZYQnVlcmhS?=
 =?utf-8?B?YzVzcVVNVjg5MlE2WDIxeGJXUERhcVNsMVhMZTMyRWwvN0s2eHRhQVptMHVG?=
 =?utf-8?B?M0hEdHB1bWR3T2lOdmJ5c0luMGV2NGw0b21aRU5CeDFKWmQvS0l2STdXeUUy?=
 =?utf-8?B?b0dMVTZLTHhwUURlbU5DSTJiOGhPQXZNcTNhbFR3bDJkS3llT29COXhlVmdJ?=
 =?utf-8?B?dFlualVwcUxSNTFYSG11OVFzSE5CTFBpL0V3cUlhZWxDdnJSWU9zdFNINHR1?=
 =?utf-8?B?RzNCNk1pQkM2aktlT0t4V3kxZzczMWltZXg2S0kzSmYxOE9vVFl1YXdpbDk1?=
 =?utf-8?B?K0NTVFFPNjRzdHdoSFdtWHNIazR0NzkxOHdvcU5LTHdGa0gwOFl0SGdkVWNh?=
 =?utf-8?B?eU93RUdsdy9JSXRkZXFoa0tsY1RXRzgwcFNvSjRYTjlCYVEvZkZFVDlwZkhD?=
 =?utf-8?B?a0VFZUhMOEVMejdZdy92WWJTdlh3cVQxclgyK2VwRW05YXJTTktuOWp0d3da?=
 =?utf-8?B?ZFBvbk9IeFV4K3J6a3JhTGhaYis2WmJUWjNxci95MGhjOGVPdjdsSWwwc3Fl?=
 =?utf-8?B?RTFRWHF5d3RYUXFoNlpWWjREOXJKOTRkd0NNTENwY09sc25ObzFsYlRpdjVT?=
 =?utf-8?B?SWlENDgzc094cmIrYmlxTTNvcTFPem1MR1FsYjhWZXc1V3B5TExGUHdOTjNC?=
 =?utf-8?B?alhUTEF3U1Exb0J5WTR6SC83d0x6SWdpRFc1YVEwbHo2dm44eFJiN3J0cHIv?=
 =?utf-8?B?ZERBNDRRMzErbnpBUlYwb3pjcHhXVnhzaDhkSGRDeXRUaUkzTzY1MW4weHp6?=
 =?utf-8?B?RndmYVJFT0prT3llMStqTGR0Zm5JaE1MbUQ4dlViWXhKenRyYVc1eXc2WnMr?=
 =?utf-8?B?eGVLajFyZjN0UEZ0MDViMTc5UVFQRENSd3hNeTFXM0pQQ3FMeXZHU3lFRUI0?=
 =?utf-8?B?SllaamRhdWgzRFJjbDRUWXhYS1Q5Z3lOMWdObWhkRFJIeWpSRkZyMzEwbE56?=
 =?utf-8?B?QnJWRU5wZk1RejA4UVUveXhGZlI1dXVQM2ZmakliNFRWUXJwdk5PdnpoZHh6?=
 =?utf-8?B?WnN1eWFiTHUvaW1wNzZuZkZpRFladGFYaGg4eU5rc0FtTFNHQlhubEJRN2k2?=
 =?utf-8?B?U1NQU1BEelJsTGtaeFFRTFFpU1gyRjdPZmlLSVA1Ky91eit3TDZmL3F1bDBW?=
 =?utf-8?B?dG16VFBqdFFXeWFMWFhpZ0x6dnQ1VXk0YmUwZWFpUTdQK05mUFZEMmNYZUs5?=
 =?utf-8?B?V1lpZzBrb3VqNE53cDVQc3l2S1RSdSs5VWxwVGxQQkJJQkdKa0VDdFlkYkF6?=
 =?utf-8?B?NkFSUHJhalFyZklENWpRUUlXanZBSVVlaWhCa0dHamF4VlVldFc2QUV6YmEy?=
 =?utf-8?B?clJJOEs3Tldoa2M2OEUwQmQ3ekNRcmMvczhHRk01V3JHS0Q3RWUvTWRUQ1pr?=
 =?utf-8?B?cG5oS01JdHVIdmtDQ1EzUHJ5OHIxbFRtdmdsRG16ZjM4RkNNdVMwN0pkVnJj?=
 =?utf-8?B?Qi9XZnFWbXFFTU9jL3FZcXpvamZ3U0NTWmxMUnc1amlGa1JvTFFRMlZUN0NY?=
 =?utf-8?B?NHB6UlcxcEdGOS91NnBsOTYvb25iWXc2NDhLZVE5K1RDNjdaRVFueVc0OFhE?=
 =?utf-8?Q?bnaU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 08:18:33.3352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dc6d0d-e2bc-4713-28d7-08de363260df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627

Hi,

Re-send to review since last send didn't get response and passed months.

This series is to
emulate extended capability list for dom0;
hide legacy and extended capability when its initialization fails;
above two parts had been merged.
remove all related registers and other resources when initializing capability fails, including patch Rebar #1, MSI #2, MSIX #3.

Best regards,
Jiqian Chen.
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
Jiqian Chen (3):
  vpci/rebar: Implement cleanup function for Rebar
  vpci/msi: Implement cleanup function for MSI
  vpci/msix: Implement cleanup function for MSI-X

 xen/drivers/vpci/msi.c   | 55 ++++++++++++++++++++++++++++++++++++++-
 xen/drivers/vpci/msix.c  | 44 ++++++++++++++++++++++++++++++-
 xen/drivers/vpci/rebar.c | 56 +++++++++++++++++++++++++++++++++-------
 xen/drivers/vpci/vpci.c  |  9 -------
 4 files changed, 144 insertions(+), 20 deletions(-)

-- 
2.34.1


