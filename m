Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A249C6CE5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:31:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835307.1251171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAeq-00020v-1e; Wed, 13 Nov 2024 10:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835307.1251171; Wed, 13 Nov 2024 10:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAep-0001zE-U6; Wed, 13 Nov 2024 10:31:31 +0000
Received: by outflank-mailman (input) for mailman id 835307;
 Wed, 13 Nov 2024 10:31:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PyI9=SI=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1tBAeo-0000tb-PZ
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:31:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2614::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6fc0e36a-a1aa-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 11:31:27 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AM9PR03MB7265.eurprd03.prod.outlook.com (2603:10a6:20b:266::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 10:31:24 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8137.027; Wed, 13 Nov 2024
 10:31:23 +0000
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
X-Inumbo-ID: 6fc0e36a-a1aa-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjJiIiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjZmYzBlMzZhLWExYWEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDkzODg3LjUwMzUzOCwic2VuZGVyIjoiZ3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HA6cdt432cFgpK/U3ma9oKvolc4UefjTIQojaqr3Mv/urnGC0PJjUlXi1kiNdqPA6bftMhNmEwLykue45R6xKHV7JSrRm8sPd11tuXqx+NAlGfXQU8tHbBH/4iLNkyU/DNZSUCX9KF5m9sqy9eAF3QzdjmNPAZAvZtkzdFFrR/H+R+svGoZOus61n6bHuIWljtnpewMckfYNxPbhS9HDEPOLf+qj/p2H1cm6ciHz/OaPv9WmbBRdQQG61XfTqC6a59FdI+uLgH2tk3noLzO+Azl4zVeqsA6BLyy5enFkp837XLXRXVMx3Dx1OBCsMbH1QUxcVMDEfZW/CEuN+Zejcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ol3n3IPB8oiHzITVz5sjVJWYTXUqdNgKay4oswSQWPs=;
 b=TaqBjfh0Uor2wK0qcIV5q/6dnmEIQQwFVIDCE8ycnllf+T+CSx4nErIXtCmcOhMfUsP51yxEwPEbztq0Rb1Yy+ayRirTqfAQhBDhvLk9JNf575WUXlQw8csnq6TRsVfsfGOh2W4CEN54q4DrjmNIs+bQ5AuBOIShI/tcLo1MGyNxFjMOsrMKxeDa1k2HHSvP8H5uPssrvIpp3caC7QqsWsBY9yM1DFgICpYeY5Ky+RRHthxEti7ngXJ7077IUBrrwO0RWqpopAX1wj/QWh3bU2ViIOcAN1CTWHimEq5e0QCOa8PX/CIeSmGdxOa4M5uFf+QV7UFIinPPdkeqbO8oVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ol3n3IPB8oiHzITVz5sjVJWYTXUqdNgKay4oswSQWPs=;
 b=XZclcQdle/e3ESKkMJo2i2RLFTvZ7aLEvp63um7W6EQqaHjIpIakstp+muIX6p32X++0LQksLLrn69TnmAw8goRWoXqlIuh5G/rj5z4GptCrd1Em+ZGvm86oFnWfODF+1bEf487adwh+Zbxyz+ypVU2kO2i2Ya6MxBuourIESfZhsRCEekseH/c8sAf24gHUSxwWIiXFbdv0DhXjdaGZ1jH9TqnVsuH861XxCGaeOZKTw8JNmKpnkwc40jucy4NH2bLIZ13+BTcTsob6eOLfJnQO4jLKnVy4c+cuznesot5SyrConV2zMq3HRDepHNDG68Y6IA+9EXoQbRZoZeRK4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <bf174c22-cb2b-468a-b4df-1ea9ab5be198@epam.com>
Date: Wed, 13 Nov 2024 12:31:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <FA4FF581-69EA-46C0-A0D4-D327B167A4D6@arm.com>
 <e6bfae0a-4d8d-4d41-9046-30400da45cc0@epam.com>
Content-Language: en-US
In-Reply-To: <e6bfae0a-4d8d-4d41-9046-30400da45cc0@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0298.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::7) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AM9PR03MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5d141b-0139-44d7-f486-08dd03ce5250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dWx6UTlLUlArbEpPeWhmNHhmMExra1RTWHk4UUJwbXFZWUJzNnVuQzlMYmda?=
 =?utf-8?B?VDZuMTZGNFJ1dVE4WjljR2RNM2xkT2k2UEpMblhHSmNwdDQ0MjN4bE9WdGdJ?=
 =?utf-8?B?d01saWlsRTBBSDRMSldzR0prVkJpUEphTUlHTFlpdS82N1Vxbm8xTFU5MXlQ?=
 =?utf-8?B?NlN3WHVCOTBDSHlDdVIwRGN6eDVVZ1RWc2VmcE92dUpWTmJrMk9KbFYzblBx?=
 =?utf-8?B?cU83cVUvN01PWG1EUGI1czBkb1Rta3pudmw2K1I3T3BNRjkwVllSbjZ5bXpP?=
 =?utf-8?B?VXdWaDkzUlFlT1k2M3hWeFF5czdqTWNNU0tLY2xhZWlwNGUrZ1cyMTBHNm5q?=
 =?utf-8?B?a0NQVTJ0WEVlaGZ3Qjd5dXdUMVNNVUNra01UUG5ZQVE3T1RHOCt0dUMvV3lo?=
 =?utf-8?B?em1jSjlFYlRVeXdSdVFwZCtOSE8vakJQaVNzeHFaNC9sZDE3NllTWTJxMGJW?=
 =?utf-8?B?YWkrbVFJVEdNNTJtSWNZbEFEUUZYbGQ0NzNEQ2ZEaTdlTUgzOVBsbk9UNG1u?=
 =?utf-8?B?WU1HVXFabTRLeUE0VWVGcFcyWEFmSVF0bkU4ejNjUlFZUFVsRUtYamlwQU5h?=
 =?utf-8?B?NXZSOU1EZFE5K2tUSXV6RDRhRjBlWW5LbzBPNjg3UjE4S3VPVW10TitKSXIr?=
 =?utf-8?B?bzh6d2dMdkVrOGpDaEdsUlRoMDdZaGlhOWdZYUVEOWF1ZS9iUzQvbmo3VDlP?=
 =?utf-8?B?QnhNMXlFQlRNVjdaS0hHWXhPODNWQVFrNlU4U2U0RDJRdzJraHdmTEc1Q1Br?=
 =?utf-8?B?akRzVUJ0Nnc0WFlIY2pHKzJqRHBmUFdGaEsyU3JYbmNVcnlSMlJQa2EvSkZR?=
 =?utf-8?B?Y3pTUWxEL29BRnQyN1c2NUVQREFsYmhkQ1NjMDhzTFZJZ0YwdDFsSWs5OFoy?=
 =?utf-8?B?dzJxRkFqRXRNNjNFTXV6TmVYenNGd0tjQnBXcHZpblNCVW9ReEI1UXdZZytU?=
 =?utf-8?B?MHJkdHJaS3A2ZnNFV3ZkbFJucUFRRnBWTGVHd3NYTzROdlRPM2lGckExeEtP?=
 =?utf-8?B?U0JTcVJkWDhsN1IrZmx0T1Z4SGFPN0NtUklvUklyK25rQzF4TFBHS2lvWDNB?=
 =?utf-8?B?bDRYRHQrZnovdDZEN1BwZTJObkNuYTAvaXdyR3ppRGp4SGM4czVuaTN4M2pq?=
 =?utf-8?B?V0R4S3hmQ1NKZWpjNUZGeVhFdHRvM2sxQXlaM2tSWDdWbU1DTUdNOW5zeTNH?=
 =?utf-8?B?L2d6am1mYmNVU1J2Qk9EaDdJZTJEUmZvOFlCQVd5dnFkS0pTSm1SczJzNitL?=
 =?utf-8?B?QjhlajNDYmIveG9jN0JuOTFQNkFRL3Znd0xEd3ZhMStDVlV2MUpwNzNoZitM?=
 =?utf-8?B?NWNZQ0ZCV284NzVFRDA0R21QUU1oUlhYb1FPR1E0SzB2SnkzdXUvWjFhTEpV?=
 =?utf-8?B?QnJhMnFsN3ZDTlVqWG1HVVBMODJPSkZUNVBQNVg2eG9GOHlPd0dkVHp0eG5w?=
 =?utf-8?B?U1NVaFhxbWIvNTNTMFl1R215UUg2KzVZT1NXby8wUWoydG5SRFRpWmNyaFUw?=
 =?utf-8?B?TTYyVDNrZ2xtbFlYUDdxRkVld2FRN2o1UVNDcXdyWldaWC9yMGp3U2xUVENx?=
 =?utf-8?B?YjVZLzU1NkE2TGtUWkhsL3I4UDd3MWFZQVRRRGlrNlFUZDM5aWVyUmhaaEVj?=
 =?utf-8?B?blpVQncrTnprR1pOVGFucWJ4UkM1Z0ZwN3kyUWlPVTFDeitDRloveWhaN0hi?=
 =?utf-8?B?N0VIeFVqQWkvcStZUnJPOGRyWjFDOGFwS3gzSHBwNHRmR01zSDRDcWZkVDls?=
 =?utf-8?Q?GqomZSkpzOqIR81MHdHZddgGix/0l60sR5Tra6R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHBYWG5HMlpsaXdkRWwvN2w4QWFNRXQvbWp1Y1VMdnFIZXRGRzdqMUVKZFdP?=
 =?utf-8?B?NVdZSVBaUzRteUtoMnlLTis4K2ZQQzJxL1dEbG9lZkhjSjQvQzF4M2FMY25L?=
 =?utf-8?B?dnFiMW9MSVcwVXNHVHBFcHFFb3pta1AzUGE5ci9GcTlxK3VuSUNKOU1rR2Zy?=
 =?utf-8?B?NTU5RkhkR21wZk5rRVhLYWc0KzNobWdtSzdpZ0ZaNVBqRzMwWGZKNjBSN1g0?=
 =?utf-8?B?MjFnZkluSi9DRWVOaWlCYW10R2VoUEJOZFczVHgyb2x1Y3JkZnJxZFdRM0Yy?=
 =?utf-8?B?bVM4RVNnOXhucGtPY0pEcHVRM0dlODhTTXVPRDh0aHkwZXNBME9zdmpUUGo1?=
 =?utf-8?B?WWc4N2RWa0hTQ09PeUlCU3VHaWJxT2hoRUdPS3dqZVFseUc5NmpUQVZHYnVI?=
 =?utf-8?B?bFJzVldvK1IwQmtBZC82NWxma0Jwa0pWME15MU5EbXhTMXB4TTF0N0pnYVIv?=
 =?utf-8?B?RXFUeTRQNy9LV1NQRE91M3NYL0dxUEhWdXlGZlQ1bHBub2NPdXpIazNnenFs?=
 =?utf-8?B?SllYRFZ1SkRNbXN5MERGaGUxMERpeGtvVlo3TEpWUEEreHNjZGNrNklJeGxr?=
 =?utf-8?B?WVFPZzNpeU9LMG90ZGhyU1FMU0s4U2Q0V2phQnNjakxLeTc5ZlNNTmtPajJB?=
 =?utf-8?B?M3JDUE9uUHZ4S1hwNURFZFdKK1pNTVdYNGdBTUhCQXR1QWxGL21jcjA3eUc5?=
 =?utf-8?B?Z1dyZGNBS0NkM2MzUllDaHRUS1hYRkZvTlNJeFdBY1FJNlhVd2pQQ0FhdHZH?=
 =?utf-8?B?U1A2S0pPV0V3bUQ2aDFtOFE3amxkWGRkREloa3BMRTNQNVllUE1hM0RYbHZB?=
 =?utf-8?B?SDFxYXAyNWl2Vk04WlptRW5wTGpKK2tkL3d6a1JzSWFibEpRamkxMVY0WElq?=
 =?utf-8?B?VHRpTlNVK1c1M3BLMWtpR0hpN3ZUYU1QVTc5ZE1ya1l2U0Q2L1hSK0ZPamZr?=
 =?utf-8?B?OEFoL1ZlbTZtOUt6ekxpRURXV0hjNWpjVW1iM3ZYanZ2VkhEZU5mVkVEOVlp?=
 =?utf-8?B?ZzAxSWI4L21BMEZrYXBjMm91c0UvT3dnOVFtN2pPV3E3dTZaQkRtb1ZhL0pC?=
 =?utf-8?B?b25UcVhJVkhuemxmK3MrTnpKV1doVE1Nd2NWVjk1RDBBZm0zeEthZ3UzVVBh?=
 =?utf-8?B?c0Y0ajR6eGFMUkRVYjF5VHBvOWFQbDR2ZTUrU3JGWHMydmhpV0tPUGhzV0px?=
 =?utf-8?B?ek5YckMwQk54Y2V3VnNqWGcxMnoxSFFxbzYzQXFRZ1R1OEUvTWx1MWlhMU9F?=
 =?utf-8?B?WHRVUmYxY25vQmQ3Znp4dTdYUnRXSzc2NkVsVVA0cUs1VE9obGtLL1dWdGJV?=
 =?utf-8?B?QndTVXZ3THNSWHI1ZlowaC9nSHdUNTYzb0J1VElQeWsxUXVWZVhYZkFML056?=
 =?utf-8?B?WGhwOVlJZm9aVkt5dE03WGlWVy9sNWRia000S3VGNkNyL0lBWklQL0QzODZV?=
 =?utf-8?B?WFhXUEJ4WTJTbk9ialRtSHd2YmIxMmRPWTNTdFJzaXAyV1FvNGVrUW05amVm?=
 =?utf-8?B?VlZHZVEveGVPMUVXMWtSQ2x0NkxEQ2cwWTNQdUVOVm1HRkw3SHcrSmtDdFVX?=
 =?utf-8?B?Y3J2a2E2LzA3YzUyM3NBMUVEcE92S0N0RVl1RE5kakNNd3hnWmVKcGJSbVRh?=
 =?utf-8?B?V05RS20wV2swdkRmUGl2eXp3Ky9WR2ZFMWZXVkVSbjJsQlRFQlJQYjdYZzJk?=
 =?utf-8?B?VE9DU0hUN0VrclF6L0tnMGVYeFVrZFJRV3ExTzR1aGNrdWlzcDRZU0RSRnVU?=
 =?utf-8?B?WXordFZiUXlwb3RjTmdKcDN4UUVqNHpqM3FQZ1JkcDJ0RFVSOEFBYTk3T2Nk?=
 =?utf-8?B?N2FhWFR1NmtnYk1SWjZpdFZmckV3Snk3QnZaMlM4U0d5NG4vaUZuMldzR01i?=
 =?utf-8?B?c2FrOUFYbHkxb2ZteVUyLzFVMEZlWm42MEpQMU84aWZveGdLSkdmMGRobnpJ?=
 =?utf-8?B?M2lXSXROZHpkZ1Z5Y1ZIczNLcU9nZ1hXT040ZmMyMVdtWXNvOTVuS01pTXBt?=
 =?utf-8?B?K2I1YjVxT0t1QmZGbEwyYWNMcldIRUk0MEowVlVWeGlPbURwNlFocjNycVFE?=
 =?utf-8?B?V0lkSUlKdjNlVWwyeTFBaWU0eHBiRmllZFRJaTBhek5tWnFVc2I3NlhpblNM?=
 =?utf-8?B?alg2cnlHSjhGaWIwNHNMbEllRUxETlZYeENDQ3JtM0JDN3dmTVIzc24vR2dx?=
 =?utf-8?B?VHc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5d141b-0139-44d7-f486-08dd03ce5250
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:31:23.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1+ZotIiWVH1wWOp5mO4G8GpAHclWWneqSrFCVamlQDGq3ijOntrpHJnTPhmhpCmSqKjSaDKsuBhPTfRGJlLHQO9bVKxN+JtuKltErS5rvVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7265


Hi All,

On 07.11.24 11:42, Grygorii Strashko wrote:
> 
> 
> On 06.11.24 17:16, Luca Fancellu wrote:
>> Hi Michal,
>>
>>> So we have 2 separate issues. I don't particularly like the concept of introducing MEMBANK_NONE
>>> and the changes below look a bit too much for me, given that for boot modules we can only have
>>> /memreserve/ matching initrd.
>>>
>>> Shawn patch fixes the first issue. AFAICT the second issue can be fixed by below simple patch:
>>> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
>>> index 927f59c64b0d..d8bd8c44bd35 100644
>>> --- a/xen/common/device-tree/bootfdt.c
>>> +++ b/xen/common/device-tree/bootfdt.c
>>> @@ -586,6 +586,10 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>>>
>>>      add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
>>>
>>> +    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
>>> +    if ( ret )
>>> +        panic("Early FDT parsing failed (%d)\n", ret);
>>> +
>>>      nr_rsvd = fdt_num_mem_rsv(fdt);
>>>      if ( nr_rsvd < 0 )
>>>          panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
>>> @@ -594,10 +598,14 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
>>>      {
>>>          struct membank *bank;
>>>          paddr_t s, sz;
>>> +        const struct bootmodule *mod = boot_module_find_by_kind(BOOTMOD_RAMDISK);
>>>
>>>          if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
>>>              continue;
>>>
>>> +        if ( mod && (mod->start == s) && (mod->size == sz) )
>>> +            continue;
>>
>> Ok I see, we skip the /memreserve/ entry if it matches the ramdisk, fair enough, I don’t have
>> a strong opinion on how we do that, the important thing is just to unblock the users experiencing
>> this issue.
> 
> Don't know if my opinion would matter here, but Luca's patch looks more generic and logically solid for me.
> While handling only "ramdisk" somewhere in the middle  - looks more like a hack.
> 
> Any way, it's up to you.


Sorry, that I'm disturbing you, but is there going to be any conclusion regarding this patch?


Best regards,
-Grygorii



