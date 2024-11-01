Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 154FA9B964C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 18:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829241.1244333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6vBP-0001Kc-US; Fri, 01 Nov 2024 17:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829241.1244333; Fri, 01 Nov 2024 17:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6vBP-0001Hc-RS; Fri, 01 Nov 2024 17:11:35 +0000
Received: by outflank-mailman (input) for mailman id 829241;
 Fri, 01 Nov 2024 17:11:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1/Ab=R4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t6vBO-0001HW-Ic
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 17:11:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2416::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5660d3db-9874-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 18:11:31 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by PH8PR12MB6986.namprd12.prod.outlook.com (2603:10b6:510:1bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.22; Fri, 1 Nov
 2024 17:11:25 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8114.023; Fri, 1 Nov 2024
 17:11:25 +0000
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
X-Inumbo-ID: 5660d3db-9874-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjJkIiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU2NjBkM2RiLTk4NzQtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDgxMDkxLjk4NzAwMywic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQbk6xBRlyBxltaLefY+u+0r15U7uYftSUF60T7n4PXhF0Q7gCObLvCqEzqJA1qCATw5dXFmjNcmoyw3tQDTvkCoaYpavU1q7Xtxt3aje6MxQc+O4/bDTQAqMmONyixVaskeErkmsZ2eIT0oUcvevrG70iiqofPKlxTkO7Ne4t3M+suG38mxaWIA5N+tQVuXMc5l4d0Yqo8Prjyt+ydBTc6H6W9msdVSpFLxneClNHo3h1/d1GiTYlhU5DDhlZf9JloyZd2nA86pOziZcGhwzGeYzQ94VcczmxBRTIpdExH2WTdmlsLMNTTMx3x9eb+D80J7l/xPh4kbkRUzmKVb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKNiRUoJBh34OOIZZDdDLUarzzN4O5cpl4UDR701yvU=;
 b=q8/ObKWUgqOSVW9Qro72sLqcY7bXisxLHwau/2pgrPIsg9BoooTHKSATmvygA4bhxVewdaIXeJaTBehFLFoBWbLKEqDgOzqy21+hfbM9t5Wo/Zv07rA+89WI6bGMkJG7J+YrU4gelicS1qfTSiT3THqFVc66tpYm+03sPng9BBKyePwWEwWpMx8U5a+IemVrmSoXtjIsUYc19zZvHoPWBHqUXAuU1SqXOfiEQD8ydEyyZ50NzoZwhF5UVVfq0Hj6VQ69M0veKpdsVqRKdcSzbiQh7NZYqdog1dpbf5nlpCUpOXmr6WR5UZEX2TiDDwrHL7Vpv/KO2bWW/MlaSRrUHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKNiRUoJBh34OOIZZDdDLUarzzN4O5cpl4UDR701yvU=;
 b=B+HR4u8U/ySaoEbh/2fbE0U3b+LAY6JSetC8ZO3IiYRt5YWL9RDmzT4w0eNevLDoftdPtLkntK7f7YTZ6O9yj5KQr/lDwYvRLH4EtGnnnJQMbWDv0fnqf2s6yVSaSc1pvQyorhBVNLnWD0ciEqnSjlJsmedYEz+/JRfEf56f7Xs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5f7f261c-142d-4778-826c-aaba6c656568@amd.com>
Date: Fri, 1 Nov 2024 17:11:20 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
 <dcfb8c04-78c6-46b4-868b-96bf24d1493d@xen.org>
 <cb90cbaa-2b1b-4f9c-b475-39214e471d18@amd.com>
In-Reply-To: <cb90cbaa-2b1b-4f9c-b475-39214e471d18@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::16) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|PH8PR12MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: fe36cc51-78eb-4d2c-51b8-08dcfa983730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEZTUk5rcTk5emplTlBuQXFOYVVVemJTRXM3QVcxYUw1STBXRVdMSVo3SUNw?=
 =?utf-8?B?QnluN05GZEJRWGQwZzluYXNkOVgwdVU5T0phVjJ1R0JwRmRBN2VRSFE1bENQ?=
 =?utf-8?B?K0FuMnRWVGVRS3RIMXplWXFiSGRYdVRhd2dZOXFzdWYrNjUvUURoY091eFF0?=
 =?utf-8?B?em1BUnl1SFY4SDh6RHJrVVg1bGJ6Y0JGZUV2SjkrZ3luby84Sk1ZOWJNa0Iz?=
 =?utf-8?B?dlpBTU5yakV5dHRKSG9vcTNXelRJekZRUUNndXFibDhsbnZJK3JOR2FPTXhZ?=
 =?utf-8?B?MSsva1diOUVNN1hoUkVjdmdwZDFWZWZlSThyYWt4dUhLd2dZdnJockxWOHZl?=
 =?utf-8?B?S1lWbEJaZXN4L3hCODNFZVB0TzZyQ1hPbTZCeSsxZnJ2Lzl4TithV1dPNysx?=
 =?utf-8?B?QzY5SWRqaEVnQlp3N3NuQTFhWEd4bnFhM2NCYWZPSW1FRFZZc0tqZFNYSlZK?=
 =?utf-8?B?dk4rR1pjd0NnY1lQWFBDQXBIK3ZMNmVyS1Zsd3FLN2FtWTQzRUlBUHYyV1FS?=
 =?utf-8?B?aHBLaThscDN0N2NPcjNHanViK1FhVVZobTA3SHptYWNYRFZSZWdkTFlSVWlu?=
 =?utf-8?B?bnU1UHVKeUhaOFNhSzdZYlcwNkVKSjBUTkgxb2VDZyt6SGgzR3J2WE1TK2Yr?=
 =?utf-8?B?djV5MElRY1EvUWhtTG1RMDZsMFQ0ZWpteU5vTVJaRWxzZ1dCbnBQTi9pZXI2?=
 =?utf-8?B?WEo3UGljU2VRanV1eWk0aElLUTIyUENMSXJuMVM5dVh3bDZzRm92QmozeVRi?=
 =?utf-8?B?YlR4RmlLTlIvOTdab3YrRXc3SjRKVjZ3ZjNZb1NEbUVtMjZpK1NOVTJXWjYv?=
 =?utf-8?B?dDViNkZmeGwxZDJVYVVPa1lXYzQrZmhKOWIwajBBUC9aYWFsbFFtWU02V3FZ?=
 =?utf-8?B?Tk5lb3lVT2x5S2RVMnJiLzRGKzU5VXZMbThXQklCa1g0Y2xCVnhJWDF5Y0R1?=
 =?utf-8?B?S1o0eURXNjFXdW45WVRLamI5SXVUR2xEem1JaFBXMTY3Rkd6SXBLdVBOQUx0?=
 =?utf-8?B?NFJDZGdEU1BxTitPNTlwUHJpaHcyU0xHV2w1d3RhSThmSGg3RVlxYnQzaUUx?=
 =?utf-8?B?ZUZCTlJ0ZURXRHRuQVY1WVhydEpjakM0VHJrMElvRTVhZGw1clNLU1R5SDB0?=
 =?utf-8?B?eFp3cHNIemhscmFVejV1aERQRHllMlh4MXRGVUF0cEptME1peGM0QXNWQ094?=
 =?utf-8?B?UTgxSFVaUFlvVDh5YUt0Qno2SUI3cjdxRG5LVTZzSm1MY1BGN003SzAxcFVq?=
 =?utf-8?B?OVJvRTE1UDhaM3Q4ZDI0ajFwNDZKODhRSkdxb3pMR2IycTEyQXA3NVlTVEJt?=
 =?utf-8?B?T3FkNXdDME5ZcFF1Q0NNWFliaXVoMnB6eXVqSHc0OE5nRGFlM3ZiKys2dkxI?=
 =?utf-8?B?eEMrSlhCUFVhWkRkK1VFQ1VKbis1dmFEcVluajBGSGkrSHpPQWtLVy9xU0Uy?=
 =?utf-8?B?STJPdU80YzFnUW9vUlB0R2twR1FibVF5Um8xbDhYMW03dFJ3Rys0eTBpekZi?=
 =?utf-8?B?YnhDcytQSWVHaS92U3lQRTljUmZPZHdYMWdaVWxGTW54Z0h5RkdWRVBQVlF2?=
 =?utf-8?B?bWRqQkJjcnRZdGdiNDBlcC9HNU1SRys3N2VWbEFFQnBoUTNrOTNzN0V4RHkv?=
 =?utf-8?B?cEdrSVhpWGI2YWtBTG9tUnkyY3U4U0RTVjY2Z0RVTCtsY0MwR2t1QWprZEwr?=
 =?utf-8?B?WUphcUJXSGpiZFRxOU9lc3ZGWURRK0ZwbWlhTzFNRVEwdVhjQ1drNDRZUGVS?=
 =?utf-8?Q?mngG9q/YTf+5lyP4JfvS61ebu6slTwt0K8e+2os?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDlqYyt1MUJNdkNVaGcxWng2enhDNjFNb094Q0lZM0xqOTZDZDFkU2V2dDVk?=
 =?utf-8?B?TkNvRk1lNmkvTXV0WE8yREg5dlJPbENISTFIVTUyS1hWc0d2OGE0a0lTVUEx?=
 =?utf-8?B?Vmxta0NQWDRna3l6RmdZTnVKSTFvQU5zNlBwUVQxcmpsVm81YVZRK2sxNG5P?=
 =?utf-8?B?dHRlbWJxd2UyVXpOTFc3M01tODA0WnE0V3k0eTIyalRLc0xNbGlnbTVWSzJ5?=
 =?utf-8?B?R3hZRFM2b0RnT2YyY3VxanNud1RYb1EzOWJtZmxoK3FBaGFZTzMzMUtCVDhS?=
 =?utf-8?B?WFBuNEJFaGVRU2VBUmI3RFNCVmNmTW1QVXZwMkZBTGROWHhxZkczNkM1TjhG?=
 =?utf-8?B?V25KTUZzNk5Fc0FsZDFyL3FScHVjR2NoelZKSzRxL3g2WFZlRERLZVZ5UVY4?=
 =?utf-8?B?cS9rd1NhSFlTVjM4eW1scWRGdzBKNjFyYmdCbGFIZTZ2WCtUSVdtWGxPRmtU?=
 =?utf-8?B?WUZvT3J0QW5VdmhWWk9VQWxLL2V1V2xjVDZtZjRieWg1bnIrV2I1R1lMTEJ6?=
 =?utf-8?B?VzNoUi95T3p0TVFQWGtDRngrajAzcTZ1cFZBMEZZTUhDZDRZRzJ3L1pXQ3I5?=
 =?utf-8?B?S0tZRDJrTmltTUNKaU9ueTR2b0lvREE3MXhLT3RzaXp2V25FQVhFdzVtZnBH?=
 =?utf-8?B?MmVhTGxENXV0NStJckU4c2k2T1pGRkFzVENCUCtESElacUxOaXVIYkJjeG55?=
 =?utf-8?B?VUo4YnRrdlRtV29wSTJ3TFkvejBxbWpFSXNqRDhrS0VYZzhJVUM2ZHE3cEls?=
 =?utf-8?B?VVppK3V5b2NtcEJkY3F0TjE3ZDhrOXFHRkVrK21xU2F0NUdYaW1VS2VRc0Ru?=
 =?utf-8?B?R25lYzJZcmpsdFVRVlY0N2xRK3RrdnBWS2l6TjFLZHlSNUdQUEcvcFErUkVP?=
 =?utf-8?B?UjZyckVyeWFzSi95R2pGa1B1bCtZRkIyZnhscWFYYkZCTzJpZ0M0TWkvOVRH?=
 =?utf-8?B?K2dIZEJVWUxXZkhnaWdZNmpYWXN5ZjFrWnQxZXoyem1aaytXbUwxN0dlcTdX?=
 =?utf-8?B?cjNrN2h5b0U4OU53VU9yZ29jc3lWcFN3akw1SnJHc0t3WThRU1c3S3VUZ2lM?=
 =?utf-8?B?NkEzb3A4dEdFQmpDV1UvWHpyQWV2V3lSemp3RjViNGNVM2NXN1c1S2lvMlZa?=
 =?utf-8?B?KytOQzZwVU5jZ2dHcmhjdjNNWlFtSnZJSmYySTgzWk5CUkdSL0lEWkVjV2dq?=
 =?utf-8?B?b3pRZjBLQmZCSVdqdkhIRXp1UnFRQkM2MUNFNnIzcTFDd1NwRHE2MjBVUnpY?=
 =?utf-8?B?cHVEcC9QblZHLzhOd2Iyd1d2empZeGhVc3FNVW00UGpJdWVZRnIzN2RENlhu?=
 =?utf-8?B?b3FObE1FdnhuSjlWTUdBd3hwcGpvZEk2K1dhQnRXMGZYelpZRTRISGp3cVlN?=
 =?utf-8?B?U3ZWRlRJSEorTGxSUlNmL3c1MzF4Q052aGFqOXgvN3lrTVo2V0xtU3NyRmUv?=
 =?utf-8?B?aS96a013VzlOdFNlK2tCNGdkaStvWURFSTdQbEZqUVRJZDBwbmFqWmNFV2hL?=
 =?utf-8?B?dzVvUlRIdWJvM0tZUXlIRzZXY21LNS83ME5BeU1XMUhNdWtqbU40M05OZktD?=
 =?utf-8?B?ZnZwbkFUQTJNQnBvZnorc0JiZ3RDenk3SGlkMlRaWGNmbnRwQ05CNThjWk9C?=
 =?utf-8?B?ckJaOW12RGVOT3BNcWJVck5QWkpiL2kzNlV6UnZnNW9sUm9jK3drbTk4czlt?=
 =?utf-8?B?Rlhxd1lVOHhuaXhHbnlZZk9hWFVnMUdEcFFPWnNuZFA2V21OT3V5SnFUNC9v?=
 =?utf-8?B?SEhEYkdTV3oyNU5Ib296QXNiU241ZHZBbDBFbnh4bzRiMHZCV3RpcXJkd2hw?=
 =?utf-8?B?aUl5Ny80dExacDlCTWNVL0ZqKzd1WDkxY0NVWVBLM3lZaHBtR1lHeHM3S0J3?=
 =?utf-8?B?K211Mkh4ZGgxRkltNktMRXh2RDVoRzFlVVpUMjdDWlg1R0g1ckVhNjZxcWFU?=
 =?utf-8?B?ZnhkejhLOFNuUGRzRjVQTnFQREQ2N0svUXM2bld0dkRza0pVWElCalkwKzdU?=
 =?utf-8?B?aGUyQVRpdDdlNzBCZXlabWVFOUNFamxZeEpQeVNLQTdPOXNtdm93YlVkNG5S?=
 =?utf-8?B?R1pQMGhXSTVOT2JCZWF5Y2JjQWx2czJPK1crWGRoYThJSXF2TmhHUXNSanZE?=
 =?utf-8?Q?vKcUuFvp6KSKAx1SEQbLUvd2p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe36cc51-78eb-4d2c-51b8-08dcfa983730
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 17:11:24.9961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UCgzxKDCjaiu6xOeI+LUTiiwzA5Pu3MDMUAS/oicDJfk0U+FxNeSBgK8E5DxjZhLlnIxqRYc7chMAcBCuoAgjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6986


On 01/11/2024 17:08, Ayan Kumar Halder wrote:
>
> On 01/11/2024 14:11, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,

> Yes, you are correct. We need the following change.
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -9,7 +9,11 @@ CFLAGS-$(CONFIG_ARM_32) += -msoft-float
  CFLAGS-$(CONFIG_ARM_32) += -mcpu=cortex-a15
  CFLAGS-$(CONFIG_ARM_32) += -mno-unaligned-access

+ifeq ($(CONFIG_MPU),y)
+CFLAGS-$(CONFIG_ARM_64) += -march=armv8-r
+else
  CFLAGS-$(CONFIG_ARM_64) += -mcpu=generic
+endif
  CFLAGS-$(CONFIG_ARM_64) += -mgeneral-regs-only # No fp registers etc
  $(call cc-option-add,CFLAGS-$(CONFIG_ARM_64),CC,-mno-outline-atomics)


(Sorry for the misformatted snippet in the previous mail)

- Ayan



