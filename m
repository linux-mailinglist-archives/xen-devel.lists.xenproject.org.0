Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CBB9D4A8E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 11:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841271.1256759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4E2-0008Ab-Da; Thu, 21 Nov 2024 10:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841271.1256759; Thu, 21 Nov 2024 10:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE4E2-00088l-AB; Thu, 21 Nov 2024 10:15:50 +0000
Received: by outflank-mailman (input) for mailman id 841271;
 Thu, 21 Nov 2024 10:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7dD=SQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tE4E1-00088f-FE
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 10:15:49 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20613.outbound.protection.outlook.com
 [2a01:111:f403:2409::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 902acc19-a7f1-11ef-a0cc-8be0dac302b0;
 Thu, 21 Nov 2024 11:15:43 +0100 (CET)
Received: from SA1P222CA0130.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::21)
 by MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 10:15:38 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:806:3c2:cafe::fa) by SA1P222CA0130.outlook.office365.com
 (2603:10b6:806:3c2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Thu, 21 Nov 2024 10:15:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 10:15:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 04:15:36 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 21 Nov 2024 04:15:34 -0600
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
X-Inumbo-ID: 902acc19-a7f1-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwOTo6NjEzIiwiaGVsbyI6Ik5BTTA0LURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjkwMmFjYzE5LWE3ZjEtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMTg0MTQzLjQyODkxNiwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRLfN8ljKm1lKNErHdK5wMcfh3wL+evS/oIs4eouQmwMjHHkvak0qTa7Yza99qpTvTyIOhKc0ROoHov82XEEScv5hxAD5k2Bw/kbyQs7+D5YZHVLAHmRYNFs0/VGOc4kSLVG9AL0UTkeVF7GjhGFPxgyQPtorKs2FUA8ETlXCuda4+DBVgd4CZ010eMSYvEOAD+wolGJdpGFYDyGBKdNvNfQpdRLdbBqVl6ievCb/QDBKUQ72Lg7eQ0d42aIBJbsDIX8b3pjaDNye3dwFCxb6D1qNRnOdlRLmQB35U3sjTy3J8nDBN9LrigM5ZasAAcbDHxyWXwF9F2HaNXOGmsk8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVKJdkh0tJBUz2++OsFRnh1jMvQosXEbRL98KFukEo8=;
 b=T5oxtOito5z6pudK7IpoeTBMTsdcUXKk+wcR02WgRo8cs1QUCHuoTNDJ7OApyI1TGn3Fo/c4AnO09l6fxrzMUeG5Vb3fUdHHjBtqYlum3FMbjNdaf49VnZdggTBzXgALtZ3VpZKuf2vbTPd996uS+RHXGlayQx25J7aYVyRNnCxtZBHkPBz4wIyBwup6PDnTxgO4DnguSQTGWZFia+1z05nHI7b/FPkJaK7NnlDmZdq2LSc+dT00951H+gBHim+I2qN5jkX9NH3N9GsMoz2y7tXRzai/VYwyvmQyc0Rk8v+xZUv7Lfw7R39mrvUnMfQwUbrcg1Ld6+RD17wYKyfKFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.12) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=temperror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVKJdkh0tJBUz2++OsFRnh1jMvQosXEbRL98KFukEo8=;
 b=cbYCLyopHReDKJMRATRECS2fESIsfkrDidXxLwuj6Vu7CfyQdSr55mEz7sWJ/889hngYxJKHNXXm28z8fMeEnA0UsCUsPOR5CjtIqmeEef2xM4ZmuLD26m5KG5r7uoKvH0/GEtPWl34q6aBC6FbtD4l5e4DJETf99PTefRJ5NFE=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.12) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Message-ID: <5378bc2e-3cdc-4b5a-9a81-9f8346417fda@amd.com>
Date: Thu, 21 Nov 2024 11:15:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drivers/char: rename arm-uart.c to uart-init.c
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <f168e76eacc2fd2e6da559a38c33e187da515614.1732027276.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <f168e76eacc2fd2e6da559a38c33e187da515614.1732027276.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|MW6PR12MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e27894-c63e-4305-66c5-08dd0a157173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjJPVFFaRlB1TlU4R05XbjZjUEplRWx2Z0hhZDV4UC9rYjBMSzhRUzYzMHdp?=
 =?utf-8?B?Z05JSHV3YnNWYWpGSVBiYm94by9xT25vTzM5KzhVbkxtT05NUjJycVE3U2ZF?=
 =?utf-8?B?MVR4blp0VmlQL0FMdmpZTmJOY1dqcU9NcTJCc0lOdCtyajR6eWJBTnF6eTkx?=
 =?utf-8?B?VVhVQVBOZ1l3MjhEVXl3K3NVSXFuZUhQdmdSakdWYjNZVXE4T1BTU3RiMHoz?=
 =?utf-8?B?Nll3YjE5YzB1dVViN1ZCalBhN2lXVGhUQWt1NXl5WXR1Z0hTdDE4U3B2RUhm?=
 =?utf-8?B?WXBQVkhIZUpmcDhHL285TDlDNGlRRU5GL3ZRakVSekJiUW13amo1cVhFc05a?=
 =?utf-8?B?bmVQU0lTY05PS0o0OGZsRGgwMkh3c1ZtSjhZeHhuMFZKQnpJbWIxSEh6RGJH?=
 =?utf-8?B?aWF1L28xTVRQQVdHQ1p0Uk5WSUNFZUhIZnZUZFZJUDdqV0t2V0YzM09vZDkv?=
 =?utf-8?B?dm5ZRVpZdDN4LzcrM3Rta2p4MTRHa3d0TmMyUERjT0hFK1hCQUJiTHg3V0U4?=
 =?utf-8?B?Z0Nyb2VyWHRNSGplT3NWejBGWmVFWkJOOVZ5U3diQUp5NUlONlljck1BNGZt?=
 =?utf-8?B?ZlNKRkZuenZZcnlscUJHb21CMWZWWVl5Tk16cWEwYUgxbG1pUUhtOTdnclI4?=
 =?utf-8?B?ckowZURDWlVwbk1ZR0lrTzNNbFdzN0tvYlU2WG55ZkJhRmkyN3l1dldxaDMv?=
 =?utf-8?B?eXFYdlRYRXFRYnhmYkIwTEJ2N2ZpR0RIeEFEeDNMM2hBTCs0RnMvUUJCSUtI?=
 =?utf-8?B?dGhJeVVINzFXWUxnbUo3a2picDh0YlFnTnZLQ0xWVDNycW56cDFvRHVrbENk?=
 =?utf-8?B?VEFIUnFzYzhKbStSSmdPSnFCNmFYRlVrblJTTUEweWxtWlM0VlFkTWp3cEtE?=
 =?utf-8?B?UmU5eldMMWc5YjRWSE1Wd3hmMWM1eHk3VnFBNUJYRVNiaGJVTUxsUUsxVFNE?=
 =?utf-8?B?bytkVFpJcmNwRXpLUEE0S3lRVGNjeUl4WG9Ham5vY0NrdGhzZTdTaTdNTTd5?=
 =?utf-8?B?Qkdsbk1OSU56THBqOEpoT0NLYkg3Zk1uOTV1d3BjR2w3V0drZGZOZ2k2SkpX?=
 =?utf-8?B?NHRHYXY4VGJjeVRBdkU5NEVUem1Lb3FsVllIaXFFZE1ZWVFZVGpuWlIwZnFp?=
 =?utf-8?B?TDlZbW5tZHJSR01RazJlRGYvTVFNcWUyRTRRdCtKbVpYWTVkUXB3Nm9WbDVW?=
 =?utf-8?B?c0ZES3daWUNYb3RMSFZZNGJkL3dyTm9vK2VwMGdRaWRZb2J4Ri9xQkdSR1Vu?=
 =?utf-8?B?VVJ3Z1k2akw0dUc5K1ZLdzVKaVJ5cUNjTGIzRGVOUUR2cVdhZ0ovaG9sUDZW?=
 =?utf-8?B?d2EzT2xrVWJRZTI2UmQwN3RBWmgrTlF4SktvR2V6YlQyd0NjZlVaM0lBOVE0?=
 =?utf-8?B?RlhEMkZuVXZIWDU3bmVCT0htam9PRXUxV0xxNEN1M0lxczBiU0UvVFp1RHJj?=
 =?utf-8?B?NjN5NXJwT2dIYVN3c1RFWkpENmZhS21rV2xpeHZObU41YlBaK1VCL25lc0o3?=
 =?utf-8?B?RU56Njg4NTl0UzZvTXh6ZURTcTM2Vjlmcnc0ckdnZ1ZhRmZzTkdwcVZudWJP?=
 =?utf-8?B?OXVVOTZvM2lEaVNuNlBBS0RyWHBWbWZhRmJyUW5SODdSd3JYZ1gvUnE5cyt6?=
 =?utf-8?B?WDhZZkpLUTd4ZWJYOGxLdS9MK21jejVpYmpnb0NCS1JlSzl4bUU5d0hqQzhw?=
 =?utf-8?B?MEJkY2t4VW0wMk1VSmxYRjd4SC95cTlKcWFFZmR2SVNKaU5LcmdQbFFaUWU0?=
 =?utf-8?B?RTZTK1lKMlBCNWZVNEYrSHdvYzFCdWpwMFEydDFVMjFoUmNyZTFtcjFxTmwz?=
 =?utf-8?B?aUVENzdWZUtua1BFSngzOTNSVEdMS2lxZEdIcFhSaWNTMUxUS2U0RldsY2ly?=
 =?utf-8?B?WU80RWVrcWUwdkFiNGtMYTh4bXlTdnRDZzYwTWYzWGcvWGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 10:15:36.9520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e27894-c63e-4305-66c5-08dd0a157173
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8663



On 19/11/2024 15:55, Oleksii Kurochko wrote:
> 
> 
> Rename the file containing uart_init() to enable reuse across other
> architectures that utilize device trees or SPCR tables to locate UART
> information.
> After locating UART data, {acpi}_device_init() is called to initialize
> the UART.
> 
> arm_uart_init() is renamed to uart_init() to be reused by other
> architectures.
> 
> A new configuration option, CONFIG_GENERIC_UART_INIT, is introduced,
> currently available only for Arm. Enabling CONFIG_UART_INIT on additional
> architectures will require additional functionality, such as device tree
> mapping and unflattening, etc.
> 
> arm-uart.c is removed from "ARM (W/ VIRTUALIZATION EXTENSIONS) ARCHITECTURE"
> section in the MAINTAINERS file, as it is no longer Arm-specific and can
> now be maintained by maintainers of other architectures.
> 
> Use GENERIC_UART_INIT for CONFIG_ARM by adding `select GENERIC_UART_INIT`
> to CONFIG_ARM.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

