Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E5F9BF923
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 23:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831383.1246673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8oNF-0007aN-VK; Wed, 06 Nov 2024 22:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831383.1246673; Wed, 06 Nov 2024 22:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8oNF-0007YN-S7; Wed, 06 Nov 2024 22:19:37 +0000
Received: by outflank-mailman (input) for mailman id 831383;
 Wed, 06 Nov 2024 22:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEZf=SB=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t8oNE-0007YF-3q
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 22:19:36 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2406::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31c7ade0-9c8d-11ef-99a3-01e77a169b0f;
 Wed, 06 Nov 2024 23:19:32 +0100 (CET)
Received: from SA1P222CA0054.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::29)
 by MW4PR12MB7359.namprd12.prod.outlook.com (2603:10b6:303:222::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 22:19:25 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:2d0:cafe::7b) by SA1P222CA0054.outlook.office365.com
 (2603:10b6:806:2d0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Wed, 6 Nov 2024 22:19:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Wed, 6 Nov 2024 22:19:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 16:19:25 -0600
Received: from [172.31.40.161] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 6 Nov 2024 16:19:24 -0600
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
X-Inumbo-ID: 31c7ade0-9c8d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQwNjo6NjE4IiwiaGVsbyI6Ik5BTTAyLVNOMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjMxYzdhZGUwLTljOGQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTMxNTcyLjI5NzcxNCwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9wJVTs0hNsTHlxO891MiuztQDQshJ/djKY4yGaBCEMZJErw7lxS8sIpwt3szpymhfvUB8j1rd1stnNtHhoClgA7X5+AYLZ2KppRrzyFqcHjL5+xXH0G8Rw11ZWsWCyJ2GAfGnE3F4F3oGzLPAx1rz45cDCWnVHslUA11zqEaHVbcJoQulGxuZy19VG4nWg8gM+JxQvS3E/Zt96J3hC59qPG52Oi0daLnlI+E44bEOXHWQrzHf3OCG0NF6giIMfQMyShiNjI7TI+xWPSXNpGbmzU1ZN6DgdjNJ223yOCa+mTcnl7FG65/W2HpyFxxXfs1n+ytdJc6fgompGGnmHBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVL/XZ/2Jxc2pMkp+egjwkW+G6EnxLlH0GSd0uYX6fI=;
 b=yv43rptnvXqdDpK1oXnkADQ4zQQQ3bR3IL1hXC3tubOIzRqRdGDIEr6QL4FRSCDEsBzpdQ37IQv8UUX6L2wpF8Re8EfP4DEEmNBZy2Hr3osfTqHEA3JKLWMOWVTpEyKKijF9SGM3KE2VPFgc19ZtwCMBMpOPiyCepVIN8eoYT61ylvw/AaBpUtAWliJfBnXtqhkm+cqhAe/Gc0MW1ewzeJeQzL9bp41lo0sErBzRTDyiy3mTGr967moy7RF5RIeA5LE9JnOx5n5kdWYKfocZ2ANvTMdicPZ3Nl5uqU+gbD24ytUg0xZs8YSu7mwArzhQZFELVVX0rJIE01VHM/H+BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVL/XZ/2Jxc2pMkp+egjwkW+G6EnxLlH0GSd0uYX6fI=;
 b=tamIVEkpMQwcArw9WjASDU/WfkL3S/sMp+7CvlSYL81yHtPSgOUWMr2V7/QbZZTbNXVPmXH2avgqGkDXSZhr7f9DcxxDCm8ES/ozOh3kaPFe59F2WGWj7nO2IMbESgT9HcwnERidyL712RBxRTo/kqXbNxIXbIxN75ToDcKw9qM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <95af4f8e-585c-4bd6-a3fc-c7234e9cce83@amd.com>
Date: Wed, 6 Nov 2024 17:19:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] x86/boot: add cmdline_pa to struct boot_module
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-8-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241102172551.17233-8-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|MW4PR12MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb19493-eb34-47ad-a7be-08dcfeb112aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmxBL3ROTDFaMytpUGhkYllZNlZxOStLbFNqbUJPQmJxZWlnTEpVYkpWdFNN?=
 =?utf-8?B?UHdZYmJZWm0zeE5LUFNwZEd0WHV0c3R6VzdEQnMvd2p6QmUyZDVtWXZNZXNE?=
 =?utf-8?B?NDA5bEtnekU2YVRGb2p6V3NXR1Z2Uzh0ZVRxM01tOTkzY09BOS9nc3ZiWWxo?=
 =?utf-8?B?K0RyamVBdjQxVWxxNDM4UlRhVUpDSDdjTzRtYzlzbDVyTTh1M3huOGlUb0Yr?=
 =?utf-8?B?Z3RXcnhLcnNjTUZnSVA4RHhXTGlxcTd6UkoxeE5Yd0Y4Z1JJME5BQkswZkkx?=
 =?utf-8?B?ekFtb0djRXdITWIwRzl6MTlhQ1dOd0FGTFc0YXUzMmdSY0JYRzJTaWxXUmp3?=
 =?utf-8?B?U21zMStSWTNLbE5Dc2F2Z0RWaXVINDVFcE5aajZ4RXBCZ3VEZzlTV0owRjV5?=
 =?utf-8?B?STBwZGFHbFNMdlhSL1l0WEl3Mk9QZGlxbW1tam5tbUFmZFBQZlRqOHRITDVL?=
 =?utf-8?B?TVpSREozVVZWSHdjTDNGOEJuTHhJbzlvOGFMcmk5bEVQRGFCMlBjak1hL0FK?=
 =?utf-8?B?L0VhQXFBU1ZScnAwanFQVlVyZGs4aldsRDBXVTB4ejFQdlVJQW1OUnUzWmJs?=
 =?utf-8?B?R0NHZVJKeU5PcktHbkd1aTlGanBxRlhXdTJ0cDRFU2RkbjVDRS9mNjk2VjRY?=
 =?utf-8?B?RmJXYS9ueTU5SWhHZGxFdndmaGRIL1lsWENvcDIxakpZUTVudmRGOVBUQ1B0?=
 =?utf-8?B?dG5YQ3JkWngvTGNqVzFTcFRiQXJSVEl2ZC9jOHdKTy9ncFZ5emNVdzNzNmow?=
 =?utf-8?B?M244THNIaTQydmVzYjVPaEduR1BYVkttTzBmTDB0QllHWHVheklIQjhtR1hP?=
 =?utf-8?B?RjRUWi9NdXNVN3RmZkh4TW92cTRWamQwVlZBcm5iUmZ6dGdVVVhLd3JwbEFk?=
 =?utf-8?B?MmNCYUlYcVdzMldENXVYZ2REVWtVQjdjS0NUNXBTTmVGNVNtTCt4c2xtN3A2?=
 =?utf-8?B?emV5Ymp6RWEvTVhrQWdVckN2V09SUForSGZUZ2hnUGZ2TGQ3T0ZtWWp1NThJ?=
 =?utf-8?B?eGl6Q3JRTmFBbmtVM1IvK2pUekhzTGcweWQyNzE2NjdIVnlmRlBmQm5zQWNJ?=
 =?utf-8?B?R050TXBBcUtUZ0dGYUhUTnNOSmNid2lUV3hJVUJjTTc0YzJrZ1dXUVp1MzVE?=
 =?utf-8?B?enZiTHdYVUl6elRjYVNrQ1pxMTVnTy9IdDV2YTJWdXUwOG9jUEZIdllycGZo?=
 =?utf-8?B?bFdzZ1MzaVZPS2dpZ3ZoazhUNlAvQXVhYXRJWEd2RVI0dFBVZWNBZkw2Z09n?=
 =?utf-8?B?dlhjV1VyS2daMEtYd0ZLcjBGM2lvbm5UQXdwMk1Ya0pMQUxzM1B3STllTlJE?=
 =?utf-8?B?d0FXcVpPdS84L2hKeXNmS2pqY3NEcGM0M3Q2blBCcEY3bGh2R3ZVVjF5Q2th?=
 =?utf-8?B?SmRGaDFFaTl5amZ0UzlmMjMwVytNVEhBOXpRNExKa2tzVDhWT0RsRjBzblpG?=
 =?utf-8?B?bjdXVjV6NXBtRTJoenkxNWdHNVdwS0R4YjhWaS9maVN2dmdaQzBLWlN5Nnpp?=
 =?utf-8?B?K0ZsaUh2RXBsTC9ldldhM25aNkxjVkwvNzEzeFhIempWbTlISjIrcm1rRzgx?=
 =?utf-8?B?ZlNEOHZnOWt4YldjTkNLOGZUU2preG5RSjd5Rkp3U2Q1Vjc1NjV1dGNsSjQv?=
 =?utf-8?B?Z1hkM3dwZUtCbGlUTGJ0STVZaGJENlVBUHRpWm56TXJ1T1dYSFJUWlU5MDFW?=
 =?utf-8?B?QXFIbnFNZVhTMElnc2xWVlBOU1dGbWZycmNOaXlKY2NCZU1ibk9aN2lPVVBj?=
 =?utf-8?B?a3hkWjRHbk5iU28rZWN3YkJoVklvU204V2UzV2lnL2lya2dNR29iMWs4bjB0?=
 =?utf-8?B?akEzSDhhcTAvQUhHRVFRYlZTWm1icXZ1MVpVSXlaSVh3UzZiaEFoWmxUQ2lB?=
 =?utf-8?B?anVtWFJjemI0TXdKakhJQkZIM3BnRHB0NHg1M3VDc0dHNkE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 22:19:25.4826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb19493-eb34-47ad-a7be-08dcfeb112aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7359

On 2024-11-02 13:25, Daniel P. Smith wrote:
> Add an address field, cmdline_pa, to struct boot_module to hold the address of
> the string field from struct mod.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

