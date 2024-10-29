Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6009B4F29
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 17:21:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827689.1242355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5oxH-0004ZT-8F; Tue, 29 Oct 2024 16:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827689.1242355; Tue, 29 Oct 2024 16:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5oxH-0004WK-4j; Tue, 29 Oct 2024 16:20:27 +0000
Received: by outflank-mailman (input) for mailman id 827689;
 Tue, 29 Oct 2024 16:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2qgp=RZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t5oxF-0004Vj-PP
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 16:20:25 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2414::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1aeaeb7-9611-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 17:20:22 +0100 (CET)
Received: from MW4PR12MB7334.namprd12.prod.outlook.com (2603:10b6:303:219::21)
 by IA1PR12MB6412.namprd12.prod.outlook.com (2603:10b6:208:3af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 16:20:17 +0000
Received: from MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8]) by MW4PR12MB7334.namprd12.prod.outlook.com
 ([fe80::2e77:557:17d5:86f8%5]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 16:20:17 +0000
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
X-Inumbo-ID: b1aeaeb7-9611-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNDo6NjI2IiwiaGVsbyI6Ik5BTTExLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImIxYWVhZWI3LTk2MTEtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjE4ODIyLjAzMTE5Miwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhS6OJMp8q1+Aa54oEtXgBWmVmAVQ1yutDS4JDqjJ3RH322d8gGc2pccYxry9ghUw1057q/WKbz5cFNGPE4cm6r11Nts/0mrbP8SW3RUQPLBXrIaPpo4vtKmilKLFDlHcsSquT9CxPsiSld0y/xmyeFnAsiV3c2PHEUItO75lvWP+l6DiKVVXLHMpG1wrXxRcZVRs2yRyj7ELe868JKlNue6BC+PIaHBZAUEzb0sxoHNryJtwnmHSs8ufVwyjnfj7ICA0DpgfKIVDJm5QP09DM08uDkR2FpRoXC8C9AojYyc4BhgIN3b5huqvT/vXSVHAat2sq4rufcCCs4xTvnABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJ1+1QQy836vtwCYOT5RDel9iZEQesj1maGKGYFs6vk=;
 b=GYfmsURrczm/qhSpBpwafFPsWVVmgJBcEKaqswEnPsI7PjdZYlC/TpdYfw31zRrH3kRHsaKkmIoOwuAb5ir4jAEAb7crxUP5bJMx9wNwldrMji9MVXZ2NWdn8PNJ/HWjn9NpZQbTnBlPSEvo8Qi+sua9mM8NsYUbbHX7EhM6+qo2vCZZkosNFUk3tBHX0EsbFAuaS4oQOJ0zSmN8CAY0FWnHasyLWud+RdKdhcZThJMRXxTSRjkvd6Kvj9X6mdiGqiq/h6HiJ4ZqLruXaL37oKS2g8qE0Fc20hSfUJAiDbubOCVIpuxXHFKpBR2606gqYcFghzRjbrXsGanzYerrWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJ1+1QQy836vtwCYOT5RDel9iZEQesj1maGKGYFs6vk=;
 b=cHx6cAlHQJPcRIWK6Ypnld70NJrPioOy4GdQ2z3H8JAsmJ5izTIw1ip5p6eGbOY8jZEAxUchA6Ttwkpk5Y9KiRjlVRoYanxC4d0pS8l6CLIMKoMnimXc1xyPN7BohzaYixRQcBXQKHEV8+FSn7HtERWuW8TVSVsDdeQhZtk9/nM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <820c83dd-b632-4350-b117-5325d793464b@amd.com>
Date: Tue, 29 Oct 2024 16:20:11 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
 <DE7DF8D0-2843-4572-A53E-E65D8CB8358B@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <DE7DF8D0-2843-4572-A53E-E65D8CB8358B@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0628.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::6) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB7334:EE_|IA1PR12MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: 356b546c-9234-461b-2b47-08dcf835930d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3pZR0xlTU5FeWtPaWJxbE95SzY3SWU2b3VQR2Q5bVBNSSt4VTV1aUhUTUdx?=
 =?utf-8?B?QlVDd0NxSkhtbEJjSUhsd01UUENrbnZ2UFl4dVRiYTNRZXNFcG9QK0hmNm1P?=
 =?utf-8?B?SjF0VUlrcUFOS2dPTGx1SGdla3RLRjd3RVVlQnlhL2RMYWxKaUs2UDVhYlVl?=
 =?utf-8?B?MXBaSHdDbFVjL29DT1MrREJpNmJCTlloMG9lQmZCRngwWnNyNlhrZFp2VW9h?=
 =?utf-8?B?M0lGVm1CUm03Rm43VXNNVU9BZnByR0FvWkxTK3VBRXFWMUVYSXhZSVU3M3hW?=
 =?utf-8?B?S21WMW1iZnczWUNLVTBhYlQxMVM5M213RnduaWdZeDFuSHBjRlJOUmtua2dQ?=
 =?utf-8?B?akJ6V0hUaFhkbnFZeDV0WDdtU0FLRERxNElQM2FkSDloVTZBZTFrRndZc2hM?=
 =?utf-8?B?QVh6dDJlVytudi9DQjhGb3RTUU1naUpuNkpjdVZLNm00WUtSTmZLNTdWc2pG?=
 =?utf-8?B?clNybE1DNDRxdFBjRkJCRW51a3h1Ujc2M0NHUkZoMVo2NGNqUVVIVHdaNXNM?=
 =?utf-8?B?Szd4Ny9KSnVYY3VvSjZJQ2d5SE1IQkQ1TkF3WmkzK29oaDd1eGVESjJncnls?=
 =?utf-8?B?WStETkZoR2NpYnhBQVRqMFdtWGFwQ3ZRRnV5WDVwMmd6b1Z0by9xMi94RFlZ?=
 =?utf-8?B?RUZzcnVIQ3JlTndQajJYeVRSMlh5dks2SGdNZVIwVmFaWFUwODRpZlRrc1Vp?=
 =?utf-8?B?QmIzVENNQU9GNGxBTnVsT1lEUU5MVUExMndHTFBLNkRxZWFSTXNzTzlFSk93?=
 =?utf-8?B?Z3ZWN0s1R29mV3Y5SCtVbHFLZWlyekpJa0lvRERibXAyTDMzVDNVU1JsdUVG?=
 =?utf-8?B?NWw2dEFFSTRLQjVucHY3dGtHOFZkRUpuNUFUVFlKTnVPMmZpdzltS3ppcVRO?=
 =?utf-8?B?bExJd05QcE4wajZyeU5aNUljNUxNOEQ2bzJhc1YzbzhGd01LWGtkVGgzd3Zv?=
 =?utf-8?B?eVVwVnl6dVQ2Y1hKK3hieHhxemNrTE1iK1lBZzJJaEtQWTd0R3BDaHRmM3cy?=
 =?utf-8?B?N0FTR3VUSm1WTU5KSTk5RHAyMVZ0U0tpdmNpcFZVbkV4ZHE3VkJvemYxWDAx?=
 =?utf-8?B?Uk41c3FUaHk1QjFJZjZFR2NldDFFMFpMOVJRb0RpMTQzTm5Wck5tSFFmSnpH?=
 =?utf-8?B?OVNmZXp3SnhvUHVkWndHVjV1ZHVMRTJrS21CZnQvZ0srODloTTNseXQvd0Fl?=
 =?utf-8?B?QnNiODlsczdPWFUzbVRuWTRUQjVnN081b3FhZ3V4ODhNc3BqNjRWWXdiTzdZ?=
 =?utf-8?B?eWZjVklYaHRWSUpIa0xxUlhEQWliaXNaRk1PT3JVNjJibzErdE9vclJsR0t1?=
 =?utf-8?B?dC8yNEVxcnNZU0JLSDRDLzRRNDhIZEY5aGExUWgrVTJRR2k0QkZjTTFpUWFY?=
 =?utf-8?B?MDBJRDZvWENpQVJaSmdOUXVBRzByREx4cjZxZGlTSWROSXB6aFFaYTRJeDZx?=
 =?utf-8?B?WFk4SkdLRENXUWoyYUpIV1BRcER4TkZ3NkE5aVVOMGdZUGo0NU55OGthSTg4?=
 =?utf-8?B?VU5DaGU0WUwweXNUdUhZd096RWpWbUJHNDdtL3NOTnA5NGhra3lhR3g4WlZK?=
 =?utf-8?B?ZXpXTXJ4RXAvQWRWeGVDendtNEJ1WHJaeHZ5aW9kQk5jd1FhM3BnVDRmWHVG?=
 =?utf-8?B?akpuVVVEQWFTRGVlaWJLN3BwK1VBazhRbDQzUWtmOHNnMlV6M0pFRFJrMEVE?=
 =?utf-8?B?VVg3WXVwdEl2aE43elFDN0ZkZUh6WCtsTUh1UGl6eEZWcnZyWWh5NDRmSHFK?=
 =?utf-8?Q?h/8heu7b9ZyPWmTT+NbV3KTFlKCbqGYYfb0wZ0u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB7334.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU5sT2NmNjVNSWV3dGZsTVg1SGJvYkxyNG5iVTlvR05FUzlVYWNaRndPWW1n?=
 =?utf-8?B?eU9ncFNFQTkyOGgyTUtST3lkY2doek02MDVDbldKemlpWENmdGFQeXRLU1BF?=
 =?utf-8?B?R1lGMWZNeWhNR21ZRXR4d0FPRExxVHRYRGRwanVCNlVEVllOVUFWZDl1djZP?=
 =?utf-8?B?blBnOE0rQzVZQmtnWE9HMWQ0VnhHWEFIdGdHeEFQOXloSVlmQjhqRVJacjh2?=
 =?utf-8?B?ZFR6OUI2WWhkekx0VmJjZWpXMEhCcEZvcWVZR1FTQlJBNVNHOHUzUkF0NVlu?=
 =?utf-8?B?OWpwZDVvOEdhTkNYSnJzL1J6aXo5Ujk3YjBxa1ZCS1JJUFhnRkY0T25ONFgx?=
 =?utf-8?B?ZCtySkUwb2dZNkVJaHgzK1hINDZpUXF4NWI4cUIvUnd2ZVlzM0FUTGZCbG5W?=
 =?utf-8?B?N1JFNWlVUG1COTQ3M2EzS1FtUlc5YlZQY1hZL1JzenM3YUc5MlZOZjVSU3FL?=
 =?utf-8?B?Rk5saFB5VjV6eUdpMjgwbVV5eFlwcmlhaW4rTk1BWFp5ajA3TzZFWFNhbElS?=
 =?utf-8?B?dEY4U0RDWUxkRE1XRVBOTUNxaDlVU3lqUG1EMFNPR1JlaVRCTkpuRm1BVE1v?=
 =?utf-8?B?Q2JWc05sZlRlbm5NaGJQc0NoM3FGQjhwcG14dmk1bFY1cUxia2dMRFFJNjJB?=
 =?utf-8?B?WFl3YnE5UTB6N29Kc0RqZkxTdVJIODg1aEduQThScDVEUHdkK1lpbWhsaVBK?=
 =?utf-8?B?VUJOZ3dxK2V4RW0vMk14L0VlNitGSHdQQm85TmtzVTdFRms0VmlpUDZrZDNy?=
 =?utf-8?B?QnVYSCtxdmVMSHYvVE5LWmVxc0V3ajJPTGhBUndkbk5FZHV1L0hvYWdIVXdU?=
 =?utf-8?B?NGJZYzVOcVo3b0JHaElkQ1Q4NzBRdWgrazZpQWJ1MHVNTlRiS3Z1cUR6YmJ3?=
 =?utf-8?B?NXpnNmxNVlNZYXllV0VSZERJbWdqbDJ4VFdHZlVtcHRzM1hLU214K3R4bU9l?=
 =?utf-8?B?VWFyaG9yc0U1MFJDOUg3a3ZISXZwK0hSV1I0a2IxL3gyS0VSMnFqQytKOFdl?=
 =?utf-8?B?Skp1UTVwVFFhc0tmUkZscmlnK2V3MmxWV0I5aGRSbTVWMVdGSGZEeWNITC9X?=
 =?utf-8?B?REFNR1Y2d1d2WllVTUZwOElQcEdadGZWMlptK2pJZDlOWTE2NTQzVmFsOHVK?=
 =?utf-8?B?elpNVkRUS0ZCWU1mWStsd2ZvTXFHMmFJWFZXRGw3MDNKNmtLbVpRSWMvMWNy?=
 =?utf-8?B?cmd4ZUdPMXZtRFNlNW5GQTYzTktsZ0dGRkdOMWRZdzFJbWoyamhSYUhqbFV0?=
 =?utf-8?B?RkhoODBIaG1YUjNzdHovd0JqejNIL0FBK1J2UENLU3JVVjM5SjMwS2lOU05l?=
 =?utf-8?B?cS9IRzhISk9BeXdHK0ZlQ3Zwa0JJRGFNdWFvSk5UZUM0YnBtS05qS0ZRRFlz?=
 =?utf-8?B?elNCLzBTYTd4Q2tWYldBQVQvaTdWMkVYdlU2b3NnbGZZSnNtWEFjTzZVNzdZ?=
 =?utf-8?B?Q0ZVaGhJdnNIRWgrQXdDalRXY2QveFhsS01aV1JQR2VwSm1CL2FmRHM0Y3Rh?=
 =?utf-8?B?VmpzSkRCbXRsdVd5WDNSN3ZwZ0pScmtmZkZEWDR3RkVDUXd6YjBvVGNkcnFT?=
 =?utf-8?B?MDBDb1d1M3R1dnh4ZFk5YitsR1d0VkRDN0lDRmNRRzM3MWZqTGpoSWEwTXpZ?=
 =?utf-8?B?akNHL2V4TXpYUElwRGM5ZU1EYlJ1SkdMZ01CNHErK1JHcmN3V295ZEIyZWRW?=
 =?utf-8?B?eEMvRDljQU9NYTJUSFRIZ0QrR2xpSXViZjA0NXZrOGFlK0UydGM0TGdUWDVJ?=
 =?utf-8?B?WVhINDZja1RLNzZ4VWw2VzVKUkZKTTFxN0JsUmwwKzZXN1VSS2V3cjdGRm1w?=
 =?utf-8?B?aVhiYVdkQ25INDRsSDI2c0V5dlEwSFlaYkgweGVadTZJeHpaTndJUnZIUWRK?=
 =?utf-8?B?ZTgvRGR5MWVlT3hGYmVJK0l2SkNwVU9yRmVvYXJBdGJpNGM1U21uUUVGRXF4?=
 =?utf-8?B?bUo1K05YaWJnTm54QVZEY2hjOCs4Ry9STDNob0hvUHBMOHpLZVo3RjRQeFlX?=
 =?utf-8?B?emwzZ01BVG5ESmtsWVlLclJ6RWxoOFVqZ1pjTnB3ZGVVbWozMWsvVEthUlBw?=
 =?utf-8?B?Z0VpMjJkZFkweUd1Y1FLak1GTXp5M1lnYWdaclBXWmRJclhxOS9xVnBCaGZz?=
 =?utf-8?Q?e81CqAtGqxgj1OEWxGH9rcVpb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356b546c-9234-461b-2b47-08dcf835930d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 16:20:17.7700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLsTNzJAeF6+p5KS3+6gp6RQJtLcLSeVkOSOcUkeFvrtuuLFQhmgayhngEnnkg/Akac8A3RFJRfmYLtLolDucQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6412


On 28/10/2024 15:14, Luca Fancellu wrote:
> Hi Ayan,
Hi Luca,
>
>> On 28 Oct 2024, at 12:45, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wrote:
>>
>> Define enable_boot_cpu_mm() for the AArch64-V8R system.
> Could you use here "Armv8-R AArch64” instead of “AArch64-V8R"
Yes.
>
>> Like boot-time page table in MMU system, we need a boot-time MPU protection
>> region configuration in MPU system so Xen can fetch code and data from normal
>> memory.
>>
>> To do this, Xen maps the following sections of the binary as separate regions
>> (with permissions) :-
>> 1. Text (Read only at EL2, execution is permitted)
>> 2. RO data (Read only at EL2)
>> 3. RO after init data and RW data (Read/Write at EL2)
>> 4. Init Text (Read only at EL2, execution is permitted)
>> 5. Init data and BSS (Read/Write at EL2)
>>
>> Before creating a region, we check if the count exceeds the number defined in
>> MPUIR_EL2. If so, then the boot fails.
>>
>> Also we check if the region is empty or not. IOW, if the start and end address
>> are same, we skip mapping the region.
>>
>> To map a region, Xen uses the PRBAR_EL2, PRLAR_EL2 and PRSELR_EL2 registers.
>> One can refer to ARM DDI 0600B.a ID062922 G1.3  "General System Control
>> Registers", to get the definitions of these registers. Also, refer to G1.2
>> "Accessing MPU memory region registers", the following
>>
>> ```
>> The MPU provides two register interfaces to program the MPU regions:
>> - Access to any of the MPU regions via PRSELR_ELx, PRBAR<n>_ELx, and
>> PRLAR<n>_ELx.
>> ```
>>
>> We use the above mechanism to create the MPU memory regions.
>>
>> MPU specific registers are defined in
>> xen/arch/arm/include/asm/arm64/mpu/sysregs.h.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>>
>> v1 - 1. Instead of mapping a (XEN_START_ADDRESS + 2MB) as a single MPU region,
>> we have separate MPU regions for different parts of the Xen binary. The reason
>> being different regions will nned different permissions (as mentioned in the
>> linker script).
>>
>> 2. Introduced a label (__init_data_begin) to mark the beginning of the init data
>> section.
>>
>> 3. Moved MPU specific register definitions to mpu/sysregs.h.
>>
>> 4. Fixed coding style issues.
>>
>> 5. Included page.h in mpu/head.S as page.h includes sysregs.h.
>> I haven't seen sysregs.h included directly from head.S or mmu/head.S.
>> (Outstanding comment not addressed).
>>
>> v2 - 1. Extracted "enable_mpu()" in a separate patch.
>>
>> 2. Removed alignment for limit address.
>>
>> 3. Merged some of the sections for preparing the early boot regions.
>>
>> 4. Checked for the max limit of MPU regions before creating a new region.
>>
>> 5. Checked for empty regions.
>>
>> v3 :- 1. Modified prepare_xen_region() so that we check for empty region within
>> this. Also, index of regions (to be programmed in PRSELR_EL2) should start from
>> 0.
>>
>> 2. Removed load_paddr() as the offset is 0.
>>
>> 3. Introduced fail_insufficient_regions() to handle failure caused when the
>> number of regions to be allocated is not sufficient.
>>
>> xen/arch/arm/arm64/mpu/Makefile              |   1 +
>> xen/arch/arm/arm64/mpu/head.S                | 122 +++++++++++++++++++
>> xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 ++++
>> xen/arch/arm/include/asm/mm.h                |   2 +
>> xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 ++++
>> xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
>> xen/arch/arm/xen.lds.S                       |   1 +
>> 7 files changed, 195 insertions(+)
>> create mode 100644 xen/arch/arm/arm64/mpu/head.S
>> create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
>> create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
>> create mode 100644 xen/arch/arm/include/asm/mpu/mm.h
>>
>> diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
>> index b18cec4836..a8a750a3d0 100644
>> --- a/xen/arch/arm/arm64/mpu/Makefile
>> +++ b/xen/arch/arm/arm64/mpu/Makefile
>> @@ -1 +1,2 @@
>> +obj-y += head.o
>> obj-y += mm.o
>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
>> new file mode 100644
>> index 0000000000..9377ae778c
>> --- /dev/null
>> +++ b/xen/arch/arm/arm64/mpu/head.S
>> @@ -0,0 +1,122 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Start-of-day code for an Armv8-R MPU system.
>> + */
>> +
>> +#include <asm/mm.h>
>> +#include <asm/arm64/mpu/sysregs.h>
>> +
>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> NIT: alignment
>
>> +
>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>> +
>> +/*
>> + * Macro to prepare and set a EL2 MPU memory region.
>> + * We will also create an according MPU memory region entry, which
>> + * is a structure of pr_t,  in table \prmap.
>> + *
>> + * Inputs:
>> + * sel:         region selector
>> + * base:        reg storing base address (should be page-aligned)
>> + * limit:       reg storing limit address
>> + * prbar:       store computed PRBAR_EL2 value
>> + * prlar:       store computed PRLAR_EL2 value
>> + * maxcount:    maximum number of EL2 regions supported
>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be
>> + *              REGION_DATA_PRBAR
>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be
>> + *              REGION_NORMAL_PRLAR
> NIT: shall we also align the text after the colon?
>
>> + */
>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>> +    /* Check if the region is empty */
>> +    cmp   \base, \limit
>> +    beq   1f
>> +
>> +    /* Check if the number of regions exceeded the count specified in MPUIR_EL2 */
>> +    cmp   \sel, \maxcount
>> +    bge   fail_insufficient_regions
>> +
>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>> +    and   \base, \base, #MPU_REGION_MASK
>> +    mov   \prbar, #\attr_prbar
>> +    orr   \prbar, \prbar, \base
>> +
>> +    /* Limit address should be inclusive */
>> +    sub   \limit, \limit, #1
>> +    and   \limit, \limit, #MPU_REGION_MASK
>> +    mov   \prlar, #\attr_prlar
>> +    orr   \prlar, \prlar, \limit
>> +
>> +    msr   PRSELR_EL2, \sel
>> +    isb
>> +    msr   PRBAR_EL2, \prbar
>> +    msr   PRLAR_EL2, \prlar
>> +    dsb   sy
>> +    isb
>> +
>> +1:
>> +.endm
>> +
>> +/*
>> + * Failure caused due to insufficient MPU regions.
>> + */
>> +FUNC_LOCAL(fail_insufficient_regions)
>> +    PRINT("- Number of MPU regions set in MPUIR_EL2 is too less -\r\n")
> MPUIR_ELx is a read only register, so I would rephrase this message in something like:
>
> “Selected MPU region is above the implemented number in MPUIR_EL2"
Ack.
>
>> +1:  wfe
>> +    b   1b
>> +END(fail_insufficient_regions)
>> +
>> +/*
>> + * Maps the various sections of Xen (described in xen.lds.S) as different MPU
>> + * regions.
>> + *
>> + * Inputs:
>> + *   lr : Address to return to.
>> + *
>> + * Clobbers x0 - x5
>> + *
>> + */
>> +FUNC(enable_boot_cpu_mm)
>> +
>> +    /* Get the number of regions specified in MPUIR_EL2 */
>> +    mrs   x5, MPUIR_EL2
>> +
>> +    /* x0: region sel */
>> +    mov   x0, xzr
>> +    /* Xen text section. */
>> +    ldr   x1, =_stext
>> +    ldr   x2, =_etext
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
> After this region is written, there is no code to increment x0, so all the subsequent will override the
> region 0.
Ah yes, you are correct. I should increment \sel in prepare_xen_region().
>
>> +
>> +    /* Xen read-only data section. */
>> +    ldr   x1, =_srodata
>> +    ldr   x2, =_erodata
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
>> +
>> +    /* Xen read-only after init and data section. (RW data) */
>> +    ldr   x1, =__ro_after_init_start
>> +    ldr   x2, =__init_begin
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5
>> +
>> +    /* Xen code section. */
>> +    ldr   x1, =__init_begin
>> +    ldr   x2, =__init_data_begin
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen data and BSS section. */
>> +    ldr   x1, =__init_data_begin
>> +    ldr   x2, =__bss_end
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5
>> +
>> +    ret
>> +
>> +END(enable_boot_cpu_mm)
> The rest looks on to me

Thanks.

- Ayan


