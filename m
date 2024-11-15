Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776B69CF461
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 19:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837987.1253892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC1Rr-0005ps-Ok; Fri, 15 Nov 2024 18:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837987.1253892; Fri, 15 Nov 2024 18:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC1Rr-0005mk-Li; Fri, 15 Nov 2024 18:53:39 +0000
Received: by outflank-mailman (input) for mailman id 837987;
 Fri, 15 Nov 2024 18:53:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bZlB=SK=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tC1Rp-0005me-SM
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 18:53:37 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2412::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e813de19-a382-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 19:53:32 +0100 (CET)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by PH8PR12MB7230.namprd12.prod.outlook.com (2603:10b6:510:226::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 18:53:27 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%7]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 18:53:26 +0000
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
X-Inumbo-ID: e813de19-a382-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjJiIiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImU4MTNkZTE5LWEzODItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjk2ODEyLjU2NDY5LCJzZW5kZXIiOiJheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vv1wllQAGCYoczabib1wNcAVZohwWXDQ7kCMQWc04/xCXFJgkjswhMvmXkSiZYcCnltUmo7ccrc831I48kt1ceN3OCdJzpVmeRVqmdPaQDccWZG7fk8tkBX4HBKjZsxjr7bfDY7LL/i+wJjc/28zgYrnsfzL4O3yCgVkYNi2TQFwZPpMhuY4TCzAnOP2TXINexT0Nu/Tc6Cy4HN0i/P/zMTb/F1bA6jxowttcYr9r9rz1BUjG7de/FtlzwEs25CjhpFJeHmKLUrvU0yEjB6JGnSA4GeBTYSaxQi7wRP97B8/57FwoOTBRG6lWJWV6GjPN0UNTbtYFtl9h0HrUq16Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvewEK7Px6wTxXU/eqBVALT6CU1MMa8pYl23FC47WKY=;
 b=wDHYrQHtTe152LG7jBClR64e+dJY8pCAyU/5PcO8cN6eLeZyIiQqGef6+QRD7jSQSl7mE4aH8jQmPa7H3x8A4VHWpocR53BZsWNtemK+bUr+Hnm7uGIsDrSwtaEKpYZ4xAJYEDEeFByK/y3tYkPgun+ljvpIqvIslrY6ZW93dwjbD+K7Am5z+HBsztiaI9GryXym6f/W7zY6t+6akISZ7UnGzTr07CI0/jHNdohDkQD8UDwNi0TTKQOw5iVQngKh7Bf2VjGZ4hMVRF4V2+BqZUbKrk/Ru4Qt8IBhcaMrjHcPrPntzB938McMdHL8Zknyac6b5/36bfgI3KcM5oNbzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvewEK7Px6wTxXU/eqBVALT6CU1MMa8pYl23FC47WKY=;
 b=jZQ5yXWrsKvuALUjsFCbkykquWhgA3bcc58WzzaNDnMBLVIiZuK6IsfWnfq+toCkiOS+OS+6O7dTaMZsKlxLaZgeAEM+UIRxFL2qniWEu+yWra7cuG/s3jXh0Ka/tRJgdnBTEpR8UGUOfBK/OqaavajkzzOIv6Ha0DALgwdGSu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <22282f26-5c66-444b-b63a-d5442e6fcdad@amd.com>
Date: Fri, 15 Nov 2024 18:53:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add dom0less domain configuration
 requirements
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Munakata Hisao <hisao.munakata.vt@renesas.com>
References: <20241018155144.3433395-1-ayan.kumar.halder@amd.com>
 <4dbf2c4d-f7bd-4032-b52f-29c24e3ec055@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <4dbf2c4d-f7bd-4032-b52f-29c24e3ec055@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::6) To MW4PR12MB7334.namprd12.prod.outlook.com
 (2603:10b6:303:219::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|PH8PR12MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5e7fe3-c9c9-4eee-8e4a-08dd05a6c982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHBGVmE4TXpsOVdIMkJWSGI5SUtpUCtBQ203UXU5c21ldnExcThOM1dhMXZX?=
 =?utf-8?B?ODM0a1RDYnNUc3diNS8xZzJvZlVuTUVrT01jVXB3c1BUeXhjckZvSTdPaGEz?=
 =?utf-8?B?ZVdIZmQvNWRpR3Z3Z0g1T0FsenZwVE05TW41c0ErNXE0MXVEdzN4enlDTmgx?=
 =?utf-8?B?Vm4vdktzR3dXZnd0M2xMYnlrbkUxTDdnRSt2clZSQ1FkUVpWajQrYWJjN3JV?=
 =?utf-8?B?VHl4SmZubmtWVFp2d2lGUlRybDB3M2JlOW9TSHE0d0tXZ1FkVFV4RzJkL3dH?=
 =?utf-8?B?RmZJbjFQRVIrQURFR0llQ21DYnhkZUV2eWV0WXU0d2RSZjNBWVdaUGszTW9i?=
 =?utf-8?B?TTdOdndOS1NWNjBaMjAwZXFqbVFQSVZHQ3FmM05EeUVKa1BRc2xUR0IybVMz?=
 =?utf-8?B?Y1M2ckVtL3NSa0pSQmNKS21IQldMWEdIeWJTMU83VWVWR2ZycXVxWktUcU5F?=
 =?utf-8?B?cGpBbENlOUY2MlFQa3k5cURwU1lMRXJBUGdBM1ZZRXFId3BXY2JYQ21iUE96?=
 =?utf-8?B?bWxwemlJMWtwTFJnVjgwNDRMczJ3UmtPRUF4NnBsMlcrcG9paG84d2NjdHlm?=
 =?utf-8?B?SE80ZVZWOFZkSURNZ1VLNmdKS0tCWkEzdXAwMndqWmRrM2c3T01CVVF3ckw3?=
 =?utf-8?B?Z3cxTElJTlNnM0dYbXhJbUJLdk1kOG5NTnlScUFINXhTdkNoMURiYk9leVNE?=
 =?utf-8?B?S1laZlgyRjJ2amc4eW5wTFVCeUhmc0d6a291YnZwSmhHYVd3SWQ0T1h2SlRZ?=
 =?utf-8?B?UjNRVjR3bXJicm52VkhpaEgwUytyVTNqYVZPWnBiSnVPeXpXWXBGbjY5amJL?=
 =?utf-8?B?ako4cDRXVmRUZTJidkEyR0NVYUgzcERUNjVjbjRMMzZMK0dvSi9SSFc3VWdJ?=
 =?utf-8?B?WkNLUENsNExlbGFndWdvc1RPN2VMa2ZUbzJqUUh2eTk5VldqS1YvS3hVK2Zo?=
 =?utf-8?B?VWhIb3V0a3NnNktHMkwvL2luTTllREN2NldTcGlsQXErMVpoUkluakRaazBh?=
 =?utf-8?B?Ujg5ODJsM2JGSFdTU3djcWtxS1F5bXpxU2NsMkE3SzQ1VVY0YXJNUWdnSU5w?=
 =?utf-8?B?TFNyZTJkYndxcGw5RVNFV3FnN0VYV2Y3UmpMdTQ4WWo4Mmg4SkpTc0tlNHBM?=
 =?utf-8?B?TTE5NXhRWGo2TTBtdDNWeXJIN1ptN1J2SlJoWm1HTWN2RUVGamY5VDVaVkxs?=
 =?utf-8?B?N0VXV3UxZzhCMS9lRHpENCtJTnBNR3h1L1RqZHV3OTFVM2x6NHQyVHZtUUNP?=
 =?utf-8?B?dUZIbTRxbGQ4bEU2dTNZeGRHY01taDlJKy8rTm00YVZIcUVEYUcvVzhEaDV5?=
 =?utf-8?B?c21KQnNuNjBPSytIaGptVDdtT2lhQ0pQMUJub1dXby9jRkxPazhzQ3QzM3Er?=
 =?utf-8?B?d251RUxTeUI3WGFmVkhiY1JyckZaZmozdk4zN2JCTlpoWVArZlVUcXZ0N1Zr?=
 =?utf-8?B?ejlhTTFPWG1PWDM2Zms2bjdTNHNEVzBCZlExcDlPeFRRWFpXR3FnSFRsV0dR?=
 =?utf-8?B?TXlUUitIOWtlS080dTR1QXlIRVVQanVqTmZ0bDNzelRDQS9penVVMTROMmNQ?=
 =?utf-8?B?cysyeEtZbEU1eXprS1VIMUo0VTVwR1oxOHkyOFduaUxMc2kxVEhNNGpxRU5r?=
 =?utf-8?B?ZENWYTZZWUorT0dXeVJvNmtTYzR3YlBNQmh2N1F1YUJnNDNGb1FhWjJCSGcz?=
 =?utf-8?Q?jHS7kgv9Lv++BFglFxUq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1lyaUZkdXlpSG55N2s5L0JyV2hITDlzY2RPZWpBNlkrNGdlMHdzUTFEVnBp?=
 =?utf-8?B?YnRsaG96QThNRmZoTGhKQ2t2U2N6K2pVbC9aOWVnS1JJZm5NeHRnT1k2NTJL?=
 =?utf-8?B?U3E3bUM4Sk4xdW1iTGJPNHFhbkpLcXRJTjRVN3BRT2p0U1pIZ2VWK09HNkNR?=
 =?utf-8?B?TlBvMmYyT2U0azlCRWpNWGdsbEt0a3NwWHY0NHJQMWRNYTByN2NLRHBCay9D?=
 =?utf-8?B?aURDcTN0akhhaEZka0xFL3VHT0lKQVFrMFpzSDcvTkhUNUtsWTFKeGZFOFc5?=
 =?utf-8?B?ZFpGOVRGWWJINGpXb292cTRjelJqclczM2tMcEphaUZCMlFnVDBZQjAwRXVN?=
 =?utf-8?B?eElndGUvU1gxR05ldCszSXR0Y3BVb24rKzlTKzl0VkE5UGlhOExRQ1dEV0hZ?=
 =?utf-8?B?c1hNTFlPM2pYeXBWWEYxKy80QURXcmg0c2RxbEhId2t4bDM2RDNnMzdJZ0VE?=
 =?utf-8?B?ZVV3MkFKTWdlR1RpY0xDdFJ2NEh0QlkxNjMwTWg4bEpOZUIxQmxPSWt5MHI5?=
 =?utf-8?B?WHdzMXJyYkNmaFI0SEdRanZidmswMGNFYWFIMkY2UG9EZ0xiYVlSUnJuODNP?=
 =?utf-8?B?R0dEbm8vTVk3d0JlWDlCWENITlQvSk9xZ0FwSDdFUmRzN1FNckhkZ0EwdkFQ?=
 =?utf-8?B?Q2ZKQkVoQy9VdGtvd0ZKY2VGZmtsNWlYa0ltd1paUWFaZUFmNTMzaVQ0SVRR?=
 =?utf-8?B?T3lSTExQZ2R5b25lQitzaG1ZUXBYOVc5ZXZBbzlKVGtQR0huNVdJMUk5aWFk?=
 =?utf-8?B?dEE5MCtwMEpkRHFhUjg4eTYyTlhKOWxtS0ZyVzVXMUQrODk4TFo2L2ZqaFJv?=
 =?utf-8?B?WE1xbTlIL2pzRXUvUEcyV1d1UWhkTlBwVU92R0F3ZW9JcU8zTWtHL0ptVlM1?=
 =?utf-8?B?RThROVkvdTVtdmJ0WkM2cHpVOUVDZnpldG41WmcvUzAwQloxNHhUZysxVkIv?=
 =?utf-8?B?ejNwVE1Uc1VIaVlKNHJVRVdCUUNtdmtrRFRlTjMvaWdlaEtackgzdXFkeEJM?=
 =?utf-8?B?a3ZyWFAyeExWV3duNkVER3F6aDNCWDRiOWp1eGlSYTVxUnYrbE1zenlyTGRU?=
 =?utf-8?B?SlFaZ0xIdVJTcTFyR1BRdWpubVpZRTFZUFNPczRpSjVEajJWNklkbTFpQ0RD?=
 =?utf-8?B?Y0hYQU1BT001aVl0WHp2MmMrSlZtUVZodno0R09CYllLL2UxQnA5MmlvM3Jj?=
 =?utf-8?B?RUNFWk9QMVdVQUJRRDBRUEE1NzZmd3IvM244aXNRM1RSSW9KK1BtSk1VUU5u?=
 =?utf-8?B?N3ZNWWR6cmZGbjFoTVo3TE5jRXdobVFnTnRyZkQ4MDkrMmFSb3pjTVRlVFBp?=
 =?utf-8?B?cG1DbFFMOHZUa2xaRFhUd0djYkJXaFBSNytPaVBRdmdqNEVtb2FTNEFRM1BM?=
 =?utf-8?B?R1Y0UEFjaFRUWExSNnhwTjgvc054dTRqdWdKV0RWdDJmRFNKQy81MkhieXhZ?=
 =?utf-8?B?RzFTY0YrazhWRFR5a3cyQTJmR3ZtNnlaRm1aZlBjL0RlWFk1WXBmRG5DMHlH?=
 =?utf-8?B?WmwrVG1Xd2hNSEkzbVlLTmt2aWxVU0ZCRng4K0g4aXp6WmNRV1VPZG1mQkha?=
 =?utf-8?B?VlhzMDdhYzNXNGd5ZnRRVlplcE15N2VYaWgrTXk0b21iZVBMVjdJYUhsSndw?=
 =?utf-8?B?Y2prRTNTRkI1THJmY1VVS012M3cxczRQcUw2aFFUU0tYV0pyTDEzTVZQR1VG?=
 =?utf-8?B?MzNlR0cxblJoVkk3ekt1OHh6UmFGdzdmRVdGOVBEQk9XQlRHb0t5anFiS1pS?=
 =?utf-8?B?MmtwRjcyclh0Q2RwYThMeG11Wjl0OTNlVk5EbnBoNlVWLzRxcCtlSnppcE9l?=
 =?utf-8?B?N0JUdXp4UW50dTczRUxGdGllOWYzeW1MWmpBOWwxcVVVSHdIQkVWYVk3OFJr?=
 =?utf-8?B?NnhhYlh0M2drK01TZjRCeGw3T0xta2Z6b1VNQzYxL1plZWN4M0dXNjlYdm1M?=
 =?utf-8?B?bHloUS91Rk1WSnorMG4zSzYyY0NzZUN2ZHI3REl5ZEhNQnRrc095SXJBaDlF?=
 =?utf-8?B?amh0R0FzTnBGM0hPNkhaTlpoOXByclh5VHRobE0vSVNDd3crMGNNNDI0Rk5h?=
 =?utf-8?B?TXdlWVpFbmljbU45TUVSUHd0U3V5bm1JLy9UZjFtMmlTTVpXWW5oZDRuaEUz?=
 =?utf-8?Q?NRma/rj/rbDRvl9fePLGGuT5i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5e7fe3-c9c9-4eee-8e4a-08dd05a6c982
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7334.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 18:53:26.3052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RJAV5ckvxm7E3n+fmvc8AtfGJr+MpQNgeY/2WdZiF9ZqjxzXTMvvl+KblNe+pqJsf5emmKAYvJFJeqZGOfvKIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7230


On 13/11/2024 09:31, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 18/10/2024 16:51, Ayan Kumar Halder wrote:
>> From: Michal Orzel <michal.orzel@amd.com>
>>
>> Add requirements for dom0less domain creation.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   .../arm64/dom0less_domain_config.rst          | 267 ++++++++++++++++++
>>   docs/fusa/reqs/market-reqs/reqs.rst           |  15 +
>>   docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  20 ++
>>   3 files changed, 302 insertions(+)
>>   create mode 100644 
>> docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst
>>
>> diff --git 
>> a/docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst 
>> b/docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst
>> new file mode 100644
>> index 0000000000..17b5f8962c
>> --- /dev/null
>> +++ b/docs/fusa/reqs/design-reqs/arm64/dom0less_domain_config.rst
>> @@ -0,0 +1,267 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Dom0less Domain configuration requirements
>> +==========================================
>> +
>> +The following are the requirements related to dom0less domain 
>> configuration for
>> +Arm64 domains.
>> +
>> +Specify Arm64 Linux kernel image
>> +----------------------------------
>> +
>> +`XenSwdgn~arm64_specify_kernel_linux_image~1`
>> +
>> +Description:
>> +Xen shall create a domain with a Arm64 Linux kernel image.
>
> A link to the specification would be useful when you are referring to 
> an external format.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify Arm64 Gzip Linux kernel image
>> +---------------------------------------
>> +
>> +`XenSwdgn~arm64_specify_kernel_gzip_image~1`
>> +
>> +Description:
>> +Xen shall create a domain with a Arm64 Gzip compressed Linux kernel 
>> image.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify kernel with uImage header
>> +---------------------------------
>> +
>> +`XenSwdgn~arm64_specify_kernel_uimage~1`
>> +
>> +Description:
>> +Xen shall create a domain with a kernel containing uImage header.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify Gzip kernel with uImage header
>> +--------------------------------------
>> +
>> +`XenSwdgn~arm64_specify_gzip_kernel_uimage~1`
>> +
>> +Description:
>> +Xen shall create a domain with a Gzip compressed kernel containing 
>> uImage
>> +header.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify passthrough device tree
>> +-------------------------------
>> +
>> +`XenSwdgn~arm64_specify_passthrough_dt~1`
>> +
>> +Description:
>> +Xen shall support direct assignment of devices to a domain.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify kernel command line arguments
>> +-------------------------------------
>> +
>> +`XenSwdgn~arm64_specify_kernel_cmd_line_args~1`
>> +
>> +Description:
>> +Xen shall pass kernel command line arguments to a domain.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify initial ramdisk
>> +-----------------------
>> +
>> +`XenSwdgn~arm64_specify_initial_ramdisk~1`
>> +
>> +Description:
>> +Xen shall provide initial ramdisk to a domain.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify amount of memory
>> +------------------------
>> +
>> +`XenSwdgn~arm64_specify_memory~1`
>> +
>> +Description:
>> +Xen shall create a domain with specified amount of memory.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Assign a single vCPU
>> +--------------------
>> +
>> +`XenSwdgn~arm64_assign_single_vcpu~1`
>> +
>> +Description:
>> +Xen shall assign a single vCPU to a domain.
>
> This wording is a bit ambiguous. You don't assign a vCPU to a domain. 
> You create a domain with "N vCPUs". It is also not clear why we are 
> making the distinction between one and ...
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Assign multiple vCPUs
>> +---------------------
>> +
>> +`XenSwdgn~arm64_assign_multiple_vcpus~1`
>> +
>> +Description:
>> +Xen shall assign multiple vCPUs to a domain.
>
> ... multiple one. From Xen PoV there is no differences.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Assign vCPUs from CPU pool
>> +--------------------------
>> +
>> +`XenSwdgn~arm64_assign_vcpus_cpu_pool~1`
>> +
>> +Description:
>> +Xen shall assign vCPUs to a domain from a CPU pool.
>
> Same remark about the wording. You create a domain with N vCPUs and 
> *assign* a CPU pool to a domain. 

Ok, so all the previous 3 requirements can be merged into

Xen shall create a domain with N vCPUs and assign a CPU pool to a domain.

Or

Xen shall create a domain with N vCPUs.

(which of the two looks better to you if we keep the next requirement ?)

Comments:

Here N is determined by the device tree configuration provided by the user.

> You also assign pCPU to a CPU pool.
>
> But I am not sure about if this requirement is actually necessary 
> given ...
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify CPU pool scheduler
>> +--------------------------
>> +
>> +`XenSwdgn~arm64_specify_cpu_pool_scheduler~1`
>> +
>> +Description:
>> +Xen shall assign a CPU pool scheduler to a domain.
>
> ... you have th is one.
So, we can keep it as it is.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Assign virtual UART
>> +-------------------
>> +
>> +`XenSwdgn~arm64_assign_virtual_uart~1`
>> +
>> +Description:
>> +Xen shall assign a virtual UART to a domain.
>
> Are we talking about the virtual PL011 or the fake emulation of the 
> real UART we do?
virtual PL011.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify number of SPIs
>> +----------------------
>> +
>> +`XenSwdgn~arm64_specify_num_spis~1`
>> +
>> +Description:
>> +Xen shall allocate a specified number of shared peripheral 
>> interrupts for a
>> +domain.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify grant table version for a domain
>> +----------------------------------------
>> +
>> +`XenSwdgn~arm64_specify_grant_table_version~1`
>> +
>> +Description:
>> +Xen shall create a domain with a specified version of grant table 
>> structure
>
> Realistically grant table v2 is not supported for Arm and I am not 
> convinced it makes any sense for x86 in embedded system. It is mainly 
> useful when you have a guest with a large amount of address space 
> (IIRC > 4TB).
We can put this detail in comments.
>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify number of grant table frames for a domain
>> +-------------------------------------------------
>> +
>> +`XenSwdgn~arm64_specify_num_grant_table_frames~1`
>> +
>> +Description:
>> +Xen shall create a domain with a specified number of grant table 
>> frames.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +Specify number of grant maptrack frames for a domain
>> +----------------------------------------------------
>> +
>> +`XenSwdgn~arm64_specify_num_grant_maptrack_frames~1`
>> +
>> +Description:
>> +Xen shall create a domain with a specified number of grant maptrack 
>> frames.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Covers:
>> + - `XenProd~static_domains_configuration~1`
>> +
>> +| [1] 
>> https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt
>> +| [2] 
>> https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/cpupools.txt
>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst 
>> b/docs/fusa/reqs/market-reqs/reqs.rst
>> index f456788d96..ca020f9a33 100644
>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>> @@ -47,3 +47,18 @@ Comments:
>>     Needs:
>>    - XenProd
>> +
>> +Static VM definition
>> +--------------------
>> +
>> +`XenMkt~static_vm_definition~1`
>> +
>> +Description:
>> +Xen shall support specifying resources for a domain.
>
> Compare to the other requirements, this is quite a vague. Should we 
> list the resources?

The list of resources depends on what the user has provided in the 
device tree configuration.

But the requirement is correct as it is. Xen allows direct assignment of 
devices to domains (ie passthrough).

How do you want to write it ?

>
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Needs:
>> + - XenProd
>> \ No newline at end of file
>> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst 
>> b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>> index db91c47a02..0453dbb862 100644
>> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
>> @@ -40,3 +40,23 @@ Covers:
>>     Needs:
>>    - XenSwdgn
>> +
>> +Configure static domains
>> +------------------------
>> +
>> +`XenProd~static_domains_configuration~1`
>> +
>> +Description:
>> +Xen shall support specifying the resources required for a domain.
>> +
>> +Rationale:
>> +
>> +Comments:
>> +
>> +Rationale:
>> +
>> +Covers:
>> + - `XenMkt~static_vm_definition~1`
>> +
>> +Needs:
>> + - XenSwdgn
>> \ No newline at end of file
>
> Missing a newline.
- Ayan

