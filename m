Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F7F9C7EC5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 00:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836002.1251882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBMks-0001XK-RW; Wed, 13 Nov 2024 23:26:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836002.1251882; Wed, 13 Nov 2024 23:26:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBMks-0001Vp-OY; Wed, 13 Nov 2024 23:26:34 +0000
Received: by outflank-mailman (input) for mailman id 836002;
 Wed, 13 Nov 2024 23:26:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKVH=SI=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tBMkr-0001Vj-Kd
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 23:26:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20629.outbound.protection.outlook.com
 [2a01:111:f403:2417::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b58b0447-a216-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 00:26:30 +0100 (CET)
Received: from PH8PR07CA0024.namprd07.prod.outlook.com (2603:10b6:510:2cd::8)
 by DM4PR12MB5964.namprd12.prod.outlook.com (2603:10b6:8:6b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.29; Wed, 13 Nov 2024 23:26:26 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:2cd:cafe::35) by PH8PR07CA0024.outlook.office365.com
 (2603:10b6:510:2cd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Wed, 13 Nov 2024 23:26:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 23:26:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 17:26:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 17:26:23 -0600
Received: from [172.17.143.135] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 17:26:22 -0600
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
X-Inumbo-ID: b58b0447-a216-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNzo6NjI5IiwiaGVsbyI6Ik5BTTEyLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImI1OGIwNDQ3LWEyMTYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTQwMzkwLjI3NzE3OCwic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rODCbbFs4mZtHIg+BFoYImQPeeyTUvlfW4gHyQ/jfWjvdY9m+R/OmU8JokDrG6B6sTvHrQm7CDnuZUENMgp1WRV4zVWPRexS6o4+yNH1Y+FmL5dcGS3Pe05Y24rdpTPBcCu1u0w1nWoC3Pf4cCCApIgVf2xsIhs9SINDIdD4NRks9LdVfcT1rpUH7R8wt4/pSC9IyHVLIo69on76ed8z4oIIaqAtOW+URdE3pTFPj44A08GJtxUP3BSQPNYQxG51mGz06vTmsG5auPcNBAZRdOTHMD78M3OybBP1LxhZZ2NYXN+dCPdgJJQlBUD+3ByvsoyCZGH3+3MtMfIurIRciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5d21rHYg7E/Icz6+TA9Ifx9+NlcM6BtYysVcmtRmQq0=;
 b=NZgjJGYwJJbfJyRGLFY3ECNSRFZpeSFoEKxrlEE6NYcjmsm/Ai0YNToy9jp41pM/paz53ioYnjls/SzzFt2qwzYyzzck7lQ19QK8MUXtv9l5yMEbfFLiFFSv5QrFy6kj6AmGUf3fYVK9lFh+bHlkNHJAVLkcKCCaPXo6fyVPOpCpPc+SECSuf8HUXI5ODX3s54rIpCF3CRpcIcXhkCy1LLE0M8/RK6pfgEw0omCIgBGCorF82HH4mMsGg4nSlP0qMntDD+dB8pTbjniNeKU0Wlb4RF3PgeFooKEkm4k50AENGIN3P44mSaeJ5TghcFv5BCfML/n3dQBI1q6PR+4XUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5d21rHYg7E/Icz6+TA9Ifx9+NlcM6BtYysVcmtRmQq0=;
 b=IMANg+R8f+9B2ny9ua9vgZA4YS1AkczSSSJEKeBauUF+yYyrro1apuZYtmrgK34p1shpaaHVcAaJqMcUFVlM5IUIR1tY2fHw/3dlpx0v8FAgws866XDd4A1fFzD2QYPcsSWsTfqiueahnaB/c3ReiniKvzaQkd2f8A7XBUPD/do=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <45596908-061f-4123-9612-23bc7acd5d25@amd.com>
Date: Wed, 13 Nov 2024 18:26:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/multiboot: Make headers be standalone
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20241113185118.1786703-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20241113185118.1786703-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DM4PR12MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0f5047-5419-4d54-d130-08dd043a976e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YnhNZ1RSdXU5UDBWMmVaVzBLMXJ1S0R1cG8yaGpOellLWGVLRnNEQU10aFhM?=
 =?utf-8?B?K0dOSDFITlROb2I2SDJwOU1JOVd3aGI1RE5PZDR2a1FkelUrUEp6RlhNQjh5?=
 =?utf-8?B?eHpUT3NTbmd5VWFwY1YvL1JKVU1TZ0YydEJkWXE4Rk9hQmRGTjlMa1E0eDIx?=
 =?utf-8?B?a1owUmJxK25vZnhUOXVQVWlDTWlEQVVLWnJDQWxsdCtZNzFmMVBJNFBuMWRO?=
 =?utf-8?B?a3MxWmpNK3pLN2hWODFXS3ppUHlsUGY5N3ZsTGFRTWFLVmw2LzRIKzlKay9Y?=
 =?utf-8?B?UytTUzU1MWkzbEJjeHkzVXBPakloQkhQMkl1SnBuZER6cFZ1NEV1azFtWjZ6?=
 =?utf-8?B?bUpXSGhQbCsrS01tM0loZTRwckJsWDNTRUpZWkVxRG0vbmxVRTRoeE5LM1Fy?=
 =?utf-8?B?S01EWHI3RlNKK1RJR1RaZUtjeFczOWU3Rytkank2UThZbG93Q1FqZ2kwREpN?=
 =?utf-8?B?Y1hMUTN2U3Zybk8ycXpEUjQ2TFVNc1VGSkc1c28zM2ZvWkRuMVJSc1M4WE42?=
 =?utf-8?B?c1VTUUUvRnU1NGorckk2bUY3Z3VUeWtHMklQOERDcXhBcDUwTkhWbjNuRFQ0?=
 =?utf-8?B?VzdCd1JuNnhnWEE1R0lRbDN2Z255RTB6enlVZHNIVnRLUlpaK3RzeEpOUG1U?=
 =?utf-8?B?eGwzOHlzSVJNdlp3OEdqZFUwRGpRT1FDK0ZhSktKNmtrYTI1cTV5aExxUjVn?=
 =?utf-8?B?TEtxWVJLdTdzRWc4ODloYit3MjZVME02SU1zT3haZS9PR2hqVjZZaldSYm5t?=
 =?utf-8?B?TjNBaTQybENCQlREWlV6dFFPekNHd0tRTHhvQnVtMFA3cEZ2c1pmUlNYTCs3?=
 =?utf-8?B?YTc2L2RKZ1FFelplaGNJcDFjdlZKeUhXaTVPdGlYaHdzR2paWVRscEE4bzBT?=
 =?utf-8?B?eFlNMFhiRk16MVhYYzZvSDNLSnBqSmZqb3pjcVMxK0ppTkJSem4zY0lMcmRE?=
 =?utf-8?B?VHJ3dXd2Z09FQS9KZFhFWG9uSlpoZHJESW03bGFWeXoyU3c3T04xZEhWZHlo?=
 =?utf-8?B?ZFFwalUzZFlUNWx1TVprNlgvMlNXRDVadm45SGpyMldkWDcyekNsZlM0S1ho?=
 =?utf-8?B?Y1Z5ZkUveWVQeHY5cFArVmI4OVZXS0FHbE5MMHExbGU2cE5HYU5nQVRpeHky?=
 =?utf-8?B?V3J3WmhibTBDRWsxVjdyY3R5aTllRS9TSSswc3FqSXNHZzRFNG1TcGZGVVpX?=
 =?utf-8?B?Y3VYYm9JMU9Md2FPdkEwSmR5UGtxMGNVWHpYMEFxa1ZuczR0YnV1dEhLNkRu?=
 =?utf-8?B?NisvdzZjZjl5NXFtWUtPb28rZWlmeThaWW1GdjRLampib2M1ZTJkZ1YrRG1p?=
 =?utf-8?B?S1V1WWVMNVB2dDdvaVlFY0FFQmg1c3RJbjd3eHNtWnVCTkxwZld5K1M0WEZX?=
 =?utf-8?B?R05jOTZQcUxCRVpUV09jRE5GeUN0cUlWbGJqSlB6NUQvZC84eVpZSGhQalFP?=
 =?utf-8?B?WENCVTdqV01CTkNkV1VQNEpaakVSWEh6MFpvSjd5bnRMZ2luQm5IeTV5NEdp?=
 =?utf-8?B?NDE4UTA1cXFnVWpMMzV5eXdEQVIxMnBpMXJDZ3h2RG5VY1NqZEdOeG5xbHhV?=
 =?utf-8?B?ejFuUHFUWEJoRys4d0xtaXNESHpNelRQK2J6eEVMS0RGcU5IVEVrd0JRSDht?=
 =?utf-8?B?Kzd4VVV2dDZ0cHdRdVJRTW5JV3Z4WXJiTVA3WDRuMGI0dWNUajZVWFhyRFFB?=
 =?utf-8?B?R01BRm51ZmhsRjc5L0pLL09jcW1VUXp0WFZXL0xFb3N2TVprZlpvR25RWjlo?=
 =?utf-8?B?VEpwallPdmJkV2NCSWdDRS91b0NPV3ZpWDVKL0UxMDRmOFFId0FJT2FWTC9a?=
 =?utf-8?B?dXNRbmF5VlR2QkppdW9zQ2tkZUVyNkZuc25EVkFFL1FiNnlscDNkZ2RMSkJK?=
 =?utf-8?B?ZHdUbjc4YXBJd0puYmVFc2RqUk04WElGWjRlWjVEV0l6QXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 23:26:24.8902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0f5047-5419-4d54-d130-08dd043a976e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5964

On 2024-11-13 13:51, Andrew Cooper wrote:
> Both require xen/types.h.
> 
> Change multiboot.h to include const.h by it's more normal path, and swap u32
> for uint32_t.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

