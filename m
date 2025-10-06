Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B62F1BBDB03
	for <lists+xen-devel@lfdr.de>; Mon, 06 Oct 2025 12:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1138039.1473814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5iS6-0001tV-O3; Mon, 06 Oct 2025 10:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1138039.1473814; Mon, 06 Oct 2025 10:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v5iS6-0001qk-L5; Mon, 06 Oct 2025 10:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1138039;
 Mon, 06 Oct 2025 10:28:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hel7=4P=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v5iS4-0001qe-Ll
 for xen-devel@lists.xenproject.org; Mon, 06 Oct 2025 10:28:20 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d438150-a29f-11f0-9d15-b5c5bf9af7f9;
 Mon, 06 Oct 2025 12:28:19 +0200 (CEST)
Received: from SJ0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:a03:33a::6)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Mon, 6 Oct
 2025 10:28:13 +0000
Received: from MWH0EPF000971E6.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::79) by SJ0PR03CA0001.outlook.office365.com
 (2603:10b6:a03:33a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 10:28:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E6.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Mon, 6 Oct 2025 10:28:11 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 6 Oct
 2025 03:28:10 -0700
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
X-Inumbo-ID: 2d438150-a29f-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZ5Cz2qcfPPn3KyPO+4YgWckrWtfphKGyOsEf8/WYnDeLa/MtFgyMHq5bdHkHTZvwNRFaNVXt84Ttm1E1+kdQZmF4datHwLn3O8JfYJQyKbHD2J9dmQVxiktHmi7jsmhz2gGVnV8u/VF4hBD0RFRCABxjRSlAmC2+kwt5GsR+jxDwMxf9FQeF/AbBol7xlD62DqhQzC9URfaD3RQsUpgC62uLTceTWVIGYIKzWmI65GKqWN0zzur8ZUz+jZiBRcdX8+JvgWuxXEF+ZKbTCFhMyz4/72W8wFlIfLppi7hlJEDNtZhDw3MR4ieIhlQKku38XBKL2kuQ9oeTjkP6zlV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr/SpR25R6LxwnFP2DHlTHWA9mjTBX2dtfDdenGL0XA=;
 b=a1EeXMr3/SwYJEn5OIKPo6OhYGKZ8TR6yF4t1LTda+vkuakFlWqVixNFTh6Poy9/g8Ojjr2GANNPjGPS/4R74Bmert5OBeqdyZxqiAOGhAN2TaZPVdHq5hJFx3BuWQWZpTXiEsFi9FtAnwUfVG4JegFQlT8B3i86AxebbQcuXJqjEnecf+rSMQC07aArQxntvqFPra3pC/P7VmFrZRGBunnNVH+Xoeb+QmgI0abmapqMz85nEzS5jL83kYTBq+QJTUABy77S5q84W5sYtb3ztRdc7BzPiQ6ZAh5mebDtkofPrVEb3F3+f9O/RHE2CRSVKE3zkxsoID1mD56zxwCGdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr/SpR25R6LxwnFP2DHlTHWA9mjTBX2dtfDdenGL0XA=;
 b=kPkBWmz9WY4dbPe7d4O8zALxI8MFgnP+8Y2pvP3nG7zF9eWKsZbxjfQRHw7h+QvzJsTVBjGtmId3sqvk9MNcCFRDC3wyjzsrNypbb7wJI2NVNpRNOdGRqhqzndWRYnuOaxR0IixRe3RDDZ0hILJwiiS1fkId+qHL86aSG3jW2mY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: [XTF PATCH v3 0/3] Remove Xen as a hard requirement to run XTF
Date: Mon, 6 Oct 2025 12:25:55 +0200
Message-ID: <20251006102743.3907-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E6:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f58ee25-56c5-4f5a-f0ba-08de04c30d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUtiRFkvYVF1MzVxV3lGMGtBbG0wdlp3cnlLUHZSUDg4c2FaSHVqbWFMSVBl?=
 =?utf-8?B?NXpOSHAwaWtlMCs4OTlEVHNKN2ZFME42OWFOakNNKzZLalpUelhOOGxYVFBr?=
 =?utf-8?B?Ny9tOVcxWjNjM2d2S2FGODh5SmxubW95MTZudmFVYVh0TXBiRFBiR0pVQjAw?=
 =?utf-8?B?SHpkMEwreVFxejM1SEVoWS82eXFBdWJ3MERNaHh1SDVFRi9ka0R1NE80MkRV?=
 =?utf-8?B?aUpGWEN4dGhuSHcvcU9uS2V1RURoczdmeXJlaXYwdm9RVHVGNEZzNHRSM2RX?=
 =?utf-8?B?S3YzYVFyR2ZaWTNZVVplWDNSUDNMZFBLeC9oSmVvNjNQVTgzS0crbVJqMmdD?=
 =?utf-8?B?MDdaQk5DalpMK0poM3JMWEdlakVwUUJuMzNadUpxN2NzTmFyeFVoRlYybGhB?=
 =?utf-8?B?UDIyeWh3dnd4N2dROW5qZVNIdUdwbUtGZXRmUVIwZDNZNld1YUtCWWRxVHJX?=
 =?utf-8?B?UDRRenlQQkU4d09GREU5eGFXZ1NlWk9rNjVMeSsrRVhOTHQrcXUyNDhlUitW?=
 =?utf-8?B?aTFaN2F5U2FKamNNSXdaajBBTTY3cVE5MmNmQzA2M2JBZndidVBodlBkRVNQ?=
 =?utf-8?B?QUhyTDFLN1UwSTg5ZXNPUUtvU1d4S2xuTXRmS3pnQTZHMWNEQ0dOTFdNL0tT?=
 =?utf-8?B?WFUwcWIyNEoxZnJ3cnNlU3A1SUhDTzJQdkhaNW9SSjEybHcvdWMvSGoyNURt?=
 =?utf-8?B?Y25UVWRobmE0ZUE3aE9ISXhqWS93MmJNdllSWnROM3hQRjY2b0xIdC8zTDFI?=
 =?utf-8?B?ZXVhalRQc3MzTjk4ZEhSdU1zdUZKdWo0QWJIMHkwNUZENE01V083NGh0MUpL?=
 =?utf-8?B?UjZvcEpyc085NU9pV2xYNXJYbEhkR0JYVjROeGhFbTFZYnlQbkVSZGdhdTZ6?=
 =?utf-8?B?ZDQrczBRcWtzenpWd2Rpb2s0eWZheW1yKzlwS0tCeUFLY3NMKzczcnNBMWVX?=
 =?utf-8?B?Wkp1eFJFRytuWnQ0VU4wSWVxYnlSQjFOczYxaERMTVlJRmE2N25GN0xyTWNi?=
 =?utf-8?B?MGN3ZXRTMTM5TlJqTS9KQVdKdHhqZDlwYmxqcUxCdENpSy9QZkNTejlUc2M1?=
 =?utf-8?B?Qy9kUy9jOC9uUXVTaW81Q0dzd2tiQm84V1ZmNGQ4aFV5Sk5oRW1YZWQxbDFx?=
 =?utf-8?B?WEZwREpqSjN0RytzbkVzNUFlT0RMYVpZWllacS9HS3UySmdJNHNTRXRzdHNo?=
 =?utf-8?B?UmQySVBwejE3RWdqV1lkYnVyV1duKzZDVCtEUktEWW0vN3ZJcFR6Z1RIbG12?=
 =?utf-8?B?elFwUUQ0alB4RDNhT3V4T3lhUGt3K1owVUxJbGtqWFpzU1BDNTJuTTAvanNM?=
 =?utf-8?B?VEd4elNLQXlTZlFOcGdPTldjREJzYzhUeFBvMjVSV0ZENXNPcTJNZldDeE0y?=
 =?utf-8?B?QkRNYjYrYW1YNHhuS2tyK3c2UnNtbmFnRjg4NVh3WGY4Yjg3eDJtaCtxZlJN?=
 =?utf-8?B?K2hYcjNoa2c2eDdzNFI0blNwNCtucUExR1lNTEhOZ0NqSGx5RGlXb1FUOFRK?=
 =?utf-8?B?Rmc2cytyY1lNNE9iczB5N3Y3enZaVDZnNkREc2hkTjZnSlcwbExDTUpEeVJv?=
 =?utf-8?B?bWtQdjdtT3FmeVZtNld0ZW1QT2VWMURWa09sbm16cU52WEhOQkdYWUtkUjU4?=
 =?utf-8?B?dUlCYmdmVVZVenNFdndkdXBwbXFFYmNkQXFNN0c2Rk95T2MxMnphWkt4YnZq?=
 =?utf-8?B?dkNoVElkYTBoazQ4L0ZRVGVMK25DbW0zZGt6YXlQTGpKbDBuTGxOR0h6K1lP?=
 =?utf-8?B?UmpOc3Z3dHRHUUw1blh4K0RRa3Z2TVRCdHY0OG9QcitMcXFLZFBkV0xoSUR1?=
 =?utf-8?B?Skw1NEo5R1EyVTM1TDRiblhuSGtzcGFPS1ZUVDBjeG5hOGxEYU9ramtSZVpS?=
 =?utf-8?B?bUQ4SjBWNHlYdkhoSUsySy81MGlYazZ3RGdzVzhISi9hQTVZNkk0d2lzcjFV?=
 =?utf-8?B?cHJTSkZJUnM5V2JFVUtxZnRqVWxaRDRGbmJzdnJSaXhyVXhwV1hRYXZTakJr?=
 =?utf-8?B?OWR4L3cydk5OclVEaWxaY0xTZFdnZ2VheDYreVFrKzRDYno3aCtPT0JtZ0ll?=
 =?utf-8?B?dGVtVEh0cDREVmRKamY5MkJyR3VUWkpBYlhqdGpYR2hwdmVOUk1tRXg2YnJ1?=
 =?utf-8?Q?Zwr4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 10:28:11.6161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f58ee25-56c5-4f5a-f0ba-08de04c30d07
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097

Hi,

This version includes gating access to the hypercall page on shutdown through
a new `cpu_has_xen` global boolean. I also implemented Rogers' suggestion to
poison the hypercall page with `int3` (opcode 0xcc).

Cheers,
Alejandro

Alejandro Vallejo (3):
  x86: Remove Xen as a hard requirement to run XTF.
  x86: Allow exiting QEMU in TCG/QEMU
  x86: Poison hypercall page with `int3` rather than `ret`

 arch/x86/hypercall_page.S     |  4 +--
 arch/x86/include/arch/cpuid.h |  2 ++
 arch/x86/setup.c              | 55 +++++++++++++++++++++++++----------
 arch/x86/traps.c              | 15 ++++++++++
 common/lib.c                  |  2 +-
 common/report.c               |  8 +++--
 include/xtf/framework.h       |  3 ++
 7 files changed, 68 insertions(+), 21 deletions(-)


base-commit: 453490df6f65fb503a39b1bddf0093441eece9ae
-- 
2.43.0


