Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A446E8B6EB5
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 11:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714682.1115956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1k0V-0004Cw-9C; Tue, 30 Apr 2024 09:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714682.1115956; Tue, 30 Apr 2024 09:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1k0V-0004BQ-6R; Tue, 30 Apr 2024 09:42:39 +0000
Received: by outflank-mailman (input) for mailman id 714682;
 Tue, 30 Apr 2024 09:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z1GF=MD=epam.com=prvs=18503a8626=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1s1k0U-0004BK-2O
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 09:42:38 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8f9abae-06d5-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 11:42:35 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U6KKTq006934;
 Tue, 30 Apr 2024 09:42:30 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3xt8fy4fgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Apr 2024 09:42:30 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM9PR03MB7759.eurprd03.prod.outlook.com (2603:10a6:20b:3dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.22; Tue, 30 Apr
 2024 09:42:25 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7544.018; Tue, 30 Apr 2024
 09:42:25 +0000
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
X-Inumbo-ID: f8f9abae-06d5-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J61Gjg1gZDUrbCWJUZ/trS8saNJYBaZGbP9/ix0HzKMrGUM6ygmaXZ4XVdw/EA+Z+WH9iKRYR+nvZ/dhSDwU90yh+M5ij6+qYHFP4K8ii3XHtkPqgvRsWgSiq1Acxk2A1e0sBhOFHMgBPO0CrrVsAEkRvtTJeeN30csw+BuhUX20Nf6ETKxVbuL1W3sNNvp/XRJIR75fUN33nJFiOxTOewA2dQCnUbXMlCnfgDcI1iCNEXxDge4XwHzOZPgPSOxUmiR6k+uLZysknvIJJoj5sU1dxwTmfusuS1mWTqNSTYlfkpqBnQ5GiGnkc0rH2Nv+mLsmfSX1aIHnYgWuyFOuVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ditHuX6z+IfdxOLMjl/YFMyXeFgvG7YgOVRNLPoIams=;
 b=kPAZGMuQPgBiHqtgKqde4aWRlmITCXH8CAI28J+0GcMl8GHzYH6MidMm5nytt3pGJRowDWwVlAKBI4bvc00LMMrWPaqXdJG4q9TPZ4TsdfH4pZn1+xLQLwwo9rUU5C4696iuE0QtoT0BBWRIyrxwjsuHH4ZWYNZhu3Tp3ytEL8ADHQcK4ESIT9nXDLgiPxZPIu5n/HahRLlzM312+7XfiCAFvTOEskKFj/0WXOaBJPxZlaFXcoKCJp8EcUFcNxjCe4dKVT/Ykb7YoHPUnfjKdgGt+X0g0owHGLHYzOWJtL6rrFVtPlF52ln3hyHqWl8etUBrV+zTVwu6OJONGB/O2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ditHuX6z+IfdxOLMjl/YFMyXeFgvG7YgOVRNLPoIams=;
 b=RZLiqgC4ZU43DgcRbb2psiGDUSKBfeuJ15Z8tkK3VSVLxFQRTXhVj58lP68g1qlMHhPg920N4b05MmS4VFh2Z94MP9xlXW/ODzsE/LUd9lgYafvIqiYH0A1cf14SsLq9ZZwV7nn+D/Ba3tXt7sNll2PpogxLOg4t/5eiqZ74nWavBn97R5oSC2XApq2xoZJRyxptZMPz19tO4X8EuKPThgZh0aRT6ZNBctiAoTE+CJCBBA2opsh03CK/TVTC1SPuDJUQsx9c311fPAAqK7PYPPsYDUKqpzb6rrMZBdglI+ShTCMoYsEz7Dj+lqHacG5kjKxX8QKsni1rMkOcofQJkg==
Message-ID: <b7838866-3c4b-4801-8656-4a4b19a60a3e@epam.com>
Date: Tue, 30 Apr 2024 12:42:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 2/7] x86/intel: guard vmce_has_lmce() with INTEL
 option
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <5e26895d84f8b7750799740ac2324b2cb92fa97e.1713860310.git.Sergiy_Kibrik@epam.com>
 <fd6bc6df-1b95-45fb-81ed-b0ccac1a0ad0@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <fd6bc6df-1b95-45fb-81ed-b0ccac1a0ad0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0009.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::9)
 To AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM9PR03MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: fd07f51c-3cac-4b92-7741-08dc68f9d7a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y2U2dXVWSmkxSmxSaDFKU1RGbkd3clo4YWpvSUQrK2Vrc3Zwd2NMQzJLOGRZ?=
 =?utf-8?B?dHFlTUZqMVJSa2l6VW1GSCtEK3hPM2I2bXNGL2d3SlNpWXdDWW5wWW0xZjRL?=
 =?utf-8?B?ZXZRQTg3OEtycklnZXlWUDBEMTlMbjlFQVJvaUl3OUlQcFc5S1l0d3Y2YUxC?=
 =?utf-8?B?dE9HUk1kRDhlc2tBU1FZUGJYRG1ub3FVdjZnV3kvREtTdWIxdHdwaFBUOGQx?=
 =?utf-8?B?VURobXJVVGswRFdHdTYzN0ROS3lvUkRCOUJuQnFRQnNyTy85bzdUcW5WUjVj?=
 =?utf-8?B?VkJaSW5neTc0eGtPbmQ1WGlMS3VCbnhDTW82cTh3R1JpL3hyNWRPQ1AzbXdI?=
 =?utf-8?B?RzkzUVlDY1lJY3Q4SHpKSzczazdBNUFoZVE5MnhReVNDNzFsT3ZSYnZJa3Js?=
 =?utf-8?B?UTNWdENLNlZwYTQ4R0RXQWpjbzVJbzBHanlWSnZYNWtJMnNheEc5dHRFUFNW?=
 =?utf-8?B?YU9tYXRaeWQwNmJ4TGxleEJIRWxRYWtBODZva3VWVXI4a1crY0VHczFucXZN?=
 =?utf-8?B?eWVZeXpwL2dGNkN5Wjk3WTRsbmxyL0xUN2VFME10RXo3R3p2TDJyNHJFdHdr?=
 =?utf-8?B?eHhadEt4dGZHcXp3M2taNnVsbWVHa1JiTnY3UlNOVGU2R0FUaS90Y3RGSElJ?=
 =?utf-8?B?VGZyVGpPSmErNExkMVRmUm5xa1FTMEF4SmljY2NEZ2M0WFBMYlIxK2lsaVVJ?=
 =?utf-8?B?ajhRdFNjZGwrOTFNN1dlN1p6dlZYdHpWYmoyTjFFb0lTaVhvZlR2QTdsN1pH?=
 =?utf-8?B?ZWlXWDE2ZkJxSDlnc0ZteXFuNGJBUmlyajh0Y2p3MlY0eUNOLytOdlVrU2lJ?=
 =?utf-8?B?djJZaEN6ZE85YS83Y3B5aDlyR1pBVFZNN3J2NTQ1N0ZXT1hUYXlqKzZHakdF?=
 =?utf-8?B?Mzl4L29CZEk4bldISHo1dGhncEJNTnAxY2ZqV1Y4Q0NaR254QU96UStYUzR1?=
 =?utf-8?B?U0NESVVsR3QxNXhCRFdqSFpPVkdqNi9RRDlaNjluR1JMWi9wbU51Vk8xZ1Bj?=
 =?utf-8?B?bE5MNWJ1WFE5MzZIUjlEMmJPVTI5Z0VveDdFUEdLTE9WTTJsZ05ZZzJoS0dP?=
 =?utf-8?B?V2xCbnlnNWFlQ0huVDBWelBnamhsOHdMSjVTYUJoV3d1dUVOZUVMU1JGNEp0?=
 =?utf-8?B?UHQ2b2VJSlhJYVFhanByWHNYTGk0WmsyT2VsY0J0eWFOR3JaNlNsSS92NEVa?=
 =?utf-8?B?Z0Z3NVFjYUxGOFRVYjFSdGVwSFVJYmxhTmtVNDE1WWZKbDVXcFdxYjRXL2FX?=
 =?utf-8?B?eEhlSUR3b0E3MjBUR0taOW1NcnRYS3FGLzhSRHlpTEtMV0Q4SWlTRXFxMitG?=
 =?utf-8?B?OTljbG8vYXhRcmZMQXkvTjJJUlFYWEswKzFQZVNoRmZDU2JuK0J4TkhJUzI5?=
 =?utf-8?B?YTJISnYxb0VDaEFTZHdORGNlRS9YRmpJaHBSdFQ4cFVXZURJcVhFZXBjMCs2?=
 =?utf-8?B?c3Q1QU0xK3BzVndrVXpZMm5oYjBtcFJLNXg3bVg2NUpILzhDQmFyRkkxWW9O?=
 =?utf-8?B?clJScDJyYVMxYzhRdTNHSGkwRjNmTFMwWnIzWGQ1MFdZelV1OVNlV2oyY0cw?=
 =?utf-8?B?OXN2VHQwMmo0V3NHT29icUhHTGZIekZ2eTluL3k2dHZxV215cFBwb0IrY3pF?=
 =?utf-8?B?Z3dLR05ITyszSDBBUUFpalRvdTVsT21EQlRRajlobDZIWU1LNWFkSWZkZVJ4?=
 =?utf-8?B?UmxreEFJUVlIekdhSXQzWXlJdDFZa0h0UjZYbWpDWjBFajFQOURHaUNRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RzVkQVpDRkpDTG9tWDFWeTREOHpYYVIzeFF5c1VDSXFhRmY0Y2syNzFhVkVJ?=
 =?utf-8?B?TnpPN3M3WUpiOFZvRVZqajU5OE5ZNU8raEVYNE5WRmJRMEZaQ0wvMVpDeThy?=
 =?utf-8?B?d3l3bXoyS2JLMnJSS3FWS3RhQk9uRjZadkgxMFd4MmtCYkpUYytCNlgzakdr?=
 =?utf-8?B?UXVseVdlMkc4Y0U3T0xwenJONm1FanFHL2R6bFpxeFY4RVBjR25tR1J0RHNE?=
 =?utf-8?B?dkozZktMcnlLbFBwTnhFTGQ3dkROSUk5RS8zSVk2ZUF0QmRNQ2dLTnhMdGND?=
 =?utf-8?B?TENmKzVVSitmbkRTb1YwVDkwYVZCS3oyazlheFpaL0pvVCtnQjhrRmtnN0hN?=
 =?utf-8?B?ZXJlMlVkL2pOKzVOazNYOEdyN25UV1FBZHQwUkgzT0hEbU0xUzdvQXFndnUv?=
 =?utf-8?B?T1pweEpCSUVQN0dIOFQwSS92TUJYeUoxWDZKVDY1WW8rc0N5Z0tqNGtpNGJa?=
 =?utf-8?B?M0RlTkJSd29PZjZYeWZTYi9UaGlkZktWZjV3SEwzbHhLWWIxTnovbDhsVTdZ?=
 =?utf-8?B?Z21PRnJaNGEzVGE2cWtIQ2lmYnBOVWROOWMwQVYwTzljcVBjNGhOeFMyQkNu?=
 =?utf-8?B?dTlVVG5YdWhKTXo1TXN3SXA4WUZNaHlVTTB1UTdna2ZiZ3hCTU83UVFNc2dB?=
 =?utf-8?B?M2JFUmhpQko4WHh6Z2ZHVEtMUE5IS0RldzNta0M1dGhTQXcvMVdjK21HYkRp?=
 =?utf-8?B?eUl3T2xwOWxpYjdDRmgxdnFWNUdaeUtLVGlBLzBtSERnYTNpdUNtTTgvV0Zo?=
 =?utf-8?B?aGZsV0JoN3J4bEMvTGlHdWVDOGVJZ0Jva0RBTmRwL3VjMVd2YW96cy91Zk9l?=
 =?utf-8?B?UzJ0OG42T1dUZkJ6NTVqaWQxRm9PdGl1TDZ1V21QNmhNbTUxY2p6cnBoeERu?=
 =?utf-8?B?Um5PMVRKVSszVUlha1Rodk1LRlVNN1BqWVB5T3V1Um43Y3BTRE9DRTB2cWxt?=
 =?utf-8?B?dzJGczc0Vy9sTTdKVnlvaTJLVm8wbW50a0IxZkxWWjZ5MlNNdDhkaFRneEw0?=
 =?utf-8?B?UC9Qa1NFblV3Y0MxaEE4eTFPbTB6QW5QL0Q5aDNWNSs4UE5FekVnVktKampD?=
 =?utf-8?B?L3psYkdHLzdYcktDdytoU3BPU0hyTnZGQXJrUnVzZkFaay9KeXdQeW5UTGZ6?=
 =?utf-8?B?cGdnUzdKMzdJdjZrTWNQeGUzemV5bkU3dURYdmVxNUtuTWI3U21OM1dIc2d4?=
 =?utf-8?B?SEcyNDB1UWFXbE1QdGY3RGFsejJIQzRKK2g3R1Q2bnltMW55TGFsUnVHWElR?=
 =?utf-8?B?OGdPMFJ0bFFrUmJFU2ZnRW1VdkJpUHRPOUZacCtMSGVubmQ4Wk9CTHpNQXM4?=
 =?utf-8?B?YTRvMnl5L3F3ZjdlRE5RM1FEK21aMnhVdzRlZnhtOFVZVy8xbWVEYnFhNmJn?=
 =?utf-8?B?eGxuMXJJMDRSL0ZjSzhjK2E0UzhOQUxzek5Mdm10TU1sNDdsQWNBVlo5V3J0?=
 =?utf-8?B?YnhCOXFpRmtrOUptVXI1TmdaY2pJdThZVW1YQ21vdHE4QXMvZWZXdm9ZRlc1?=
 =?utf-8?B?VlZzZ0IzNVhzVUJha0J1bE1TOU1LTFltaElnY2c4TUc1RWdQTzRjVWZ5OTJO?=
 =?utf-8?B?NUpCNGwrYnNvWWZBbFIyZnd2RzJZSzc3cjBZajNycU5JVXlrT3JVdzduVS81?=
 =?utf-8?B?OFBsZ1Z5VHFwanlmTFQ2VC8rR2k3c1F1MmVpV1lQdmVVQUJYQkUwT05xU1VB?=
 =?utf-8?B?amxWWTdlZkFXOC9oWmNZN0l3MlM4T2h3akV2YkwxbDRhK25zZUhVc24veFlO?=
 =?utf-8?B?VGF1TG1CZ3l0SGs4dXlpRnIyWnBmZTkzREdMc3FyaWlDODdNM1doOWpCQStV?=
 =?utf-8?B?ZVNkNUY0T2o3QVBaNjNyYi9PaU9wbkVTZkRtOG9udTc0UEFZN3NuWmdPMEtJ?=
 =?utf-8?B?N3dYVENPTTl2OE01azd2aUdNVjRQZ2xlbVFXNmlMMitKK1NTYXR0VGlJQjlF?=
 =?utf-8?B?cnNZM0VYZW5nQ283QWFOQWphcGsweDZ2RmllZ3laYTNoSFlud0VPaXRWOS96?=
 =?utf-8?B?Uko4emRqMWpLOGRDSFZyMHdkaFJJdEVCbE5EcWxDdW5RNk9lVzJTWGV4N2N3?=
 =?utf-8?B?OS9IUkIvc09GNDFGYW0xRlBWZCs1SkhuTmQ0UlI3QVB3djFFNGFhL0p3Qkpz?=
 =?utf-8?B?ZjVzZHV0dDh4TE9TSm5EUkVQdXlxWG5CM0xKMW1qcTVlS3BmWWhOUXAzZGFX?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd07f51c-3cac-4b92-7741-08dc68f9d7a5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 09:42:25.5364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHl6wM5urCRhewvstR2g1OFk2VKjCOOXVfbcE6QiscgJzpB4CPxLI2MqSAa9JcK+wypYEvVimd6WoInLc8YSbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7759
X-Proofpoint-ORIG-GUID: fx2M3_ulJS-hRfHM58vPknBSW5EiogJJ
X-Proofpoint-GUID: fx2M3_ulJS-hRfHM58vPknBSW5EiogJJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_04,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300070

29.04.24 18:34, Jan Beulich:
> On 23.04.2024 10:50, Sergiy Kibrik wrote:
>> Since MCG_LMCE_P bit is specific to Intel CPUs
> 
> That's the case now. It could change going forward, and an underlying hypervisor
> might also have (obscure?) reasons to surface it elsewhere.
> 
>> the code to check it can
>> possibly be excluded from build if !CONFIG_INTEL. With these guards
>> calls to vmce_has_lmce() are eliminated and mce_intel.c can end up
>> not being built.
>>
>> Also replace boilerplate code that checks for MCG_LMCE_P flag with
>> vmce_has_lmce(), which might contribute to readability a bit.
> 
> Alternatively, have you considered making that function an inline one in a
> suitable header? Besides addressing your build issue (I think), ...
> 
>> --- a/xen/arch/x86/cpu/mcheck/vmce.c
>> +++ b/xen/arch/x86/cpu/mcheck/vmce.c
>> @@ -199,7 +199,7 @@ int vmce_rdmsr(uint32_t msr, uint64_t *val)
>>            * bits are always set in guest MSR_IA32_FEATURE_CONTROL by Xen, so it
>>            * does not need to check them here.
>>            */
>> -        if ( cur->arch.vmce.mcg_cap & MCG_LMCE_P )
>> +        if ( IS_ENABLED(CONFIG_INTEL) && vmce_has_lmce(cur) )
> 
> ... doing so would alternatively also permit integrating the IS_ENABLED()
> into the function, rather than repeating the same ...
> 
>> @@ -324,7 +324,7 @@ int vmce_wrmsr(uint32_t msr, uint64_t val)
>>           break;
>>   
>>       case MSR_IA32_MCG_EXT_CTL:
>> -        if ( (cur->arch.vmce.mcg_cap & MCG_LMCE_P) &&
>> +        if ( IS_ENABLED(CONFIG_INTEL) && vmce_has_lmce(cur) &&
>>                !(val & ~MCG_EXT_CTL_LMCE_EN) )
>>               cur->arch.vmce.mcg_ext_ctl = val;
>>           else
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -86,7 +86,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
>>               goto gp_fault;
>>   
>>           *val = IA32_FEATURE_CONTROL_LOCK;
>> -        if ( vmce_has_lmce(v) )
>> +        if ( IS_ENABLED(CONFIG_INTEL) && vmce_has_lmce(v) )
>>               *val |= IA32_FEATURE_CONTROL_LMCE_ON;
>>           if ( cp->basic.vmx )
>>               *val |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
> 
> ... three times.
> 

I think I'll move vmce_has_lmce() to arch/x86/cpu/mcheck/mce.h then, if 
no objections.

   -Sergiy

