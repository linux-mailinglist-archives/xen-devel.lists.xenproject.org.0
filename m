Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C898C3DDB
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2024 11:13:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720774.1123684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Rif-0001hT-2e; Mon, 13 May 2024 09:11:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720774.1123684; Mon, 13 May 2024 09:11:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6Rie-0001eK-T2; Mon, 13 May 2024 09:11:40 +0000
Received: by outflank-mailman (input) for mailman id 720774;
 Mon, 13 May 2024 09:11:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QNkj=MQ=epam.com=prvs=1863cc35df=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1s6Ric-0001eE-Ty
 for xen-devel@lists.xenproject.org; Mon, 13 May 2024 09:11:39 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc434f10-1108-11ef-909d-e314d9c70b13;
 Mon, 13 May 2024 11:11:36 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44D72ehT028825;
 Mon, 13 May 2024 09:11:32 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3y1yafvutg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 May 2024 09:11:32 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by VI1PR03MB9987.eurprd03.prod.outlook.com (2603:10a6:800:1c7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.22; Mon, 13 May
 2024 09:11:28 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%5]) with mapi id 15.20.7587.015; Mon, 13 May 2024
 09:11:28 +0000
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
X-Inumbo-ID: cc434f10-1108-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZXLEMzQeJQTp6DQq2/fnMquD0jg83NA7Jm/eXDemoCXf/cooAMHa0yqVwpg+FC0nfuQQ60ui6VQf3oIh0pyF4cKtKBh1/48YRtCXtvJxSucoq/37QfplYWP73cwYbJ5veVdcGFq5mdvKVlAZQ9nyBRiZfSqvyqAqBQq4uH8CgrXwjSHbbev2Wvr+sqUQYDAWrlwNcgVGMf1n8GNdPyvUh6rMG/uMrQfdtZy7FPs5PXqmz+1FuEryGxGgPsjYjCL6iU4t8spX3TVE19NgnBj9bLC8TzVQpiJTO0ZqNOpV2WigcWsvoVJWpz0vYh/Jj3Dr+My0kGIS6HxjLduKi2deeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KFEwE20wNiNRdhe7S74RnbY5GaK8qhweDQOMEVT7IQ=;
 b=Qw0d3jPlCiUa/E9Jm2esejCTtMVKERqBi1pDWijAkx/BocsGUYewPbwAfF8BXB/rJ8RaSUkzN8xa25vpZIROQuwws5AXhorAooNjxPud2Vj4/aovXDyYx9xkxueEmdd7fVmDPjt1xwHVCLbNXR4uWoqj9T1S1wCzsX0WSRsIIPUPJ8U5t86irqt6I2LcfmWjjcRxCCaDidqVo3a2E7VU0I8747tpw1OS7fT0t0B09Zh6IlE9S0mhC1s0B4OaK94rgrGFvRiY1Uvm6Id4Z7uTJBHmAhp4uFyNQzl7a1gASeypvyI9IcTSgNOOT1HjYD2WrlKHHbiKkpV4mFQPYgRA7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KFEwE20wNiNRdhe7S74RnbY5GaK8qhweDQOMEVT7IQ=;
 b=PI4uTEXs/r/w+15BNavFfS7zsa9qzQMmfSHgP+ITLOex1kKM/e75wND6Vr61AIDBYu9fMXsFRQ2QpLGGHnxSAYsYbD24YoID2YmwhG/xWZC+1HOL/AX5U4j+WuZRaUUPN8ez2cksQothVoOyWRRTqiF2lb13AFuHEypYEPs8V9p7QyEuJ+nTPj46shNZ01trM6rSltGJslchMcR1DX71Ju6g/R0lpwikZpR2P+vP+52XicWX18uoPXJFnmc1np/d5wtOxnrU+4SZd18YrA3YpAH53jDZEaEAkGQzpCego7fbvj0DdabjzQLitTj6F9pDe5DHlZa1dYKnzzoSpweRoA==
Message-ID: <63dc5c56-19e4-405d-a016-03175dd704bf@epam.com>
Date: Mon, 13 May 2024 12:11:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 5/5] x86/MCE: optional build of AMD/Intel MCE code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1714640459.git.Sergiy_Kibrik@epam.com>
 <47d32ecff7b915bd23b6d13b76cedf4b39db71a2.1714640459.git.Sergiy_Kibrik@epam.com>
 <dc14d45e-b2b2-4414-a937-ae95115aa2cd@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <dc14d45e-b2b2-4414-a937-ae95115aa2cd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0013.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::16) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|VI1PR03MB9987:EE_
X-MS-Office365-Filtering-Correlation-Id: 7116f5ca-ef1b-4240-b40d-08dc732cac06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Yk92eGdPTlNyZldqOHYxSHQxK3FVcHdEMVg1OGNhOStpc2swUFhRdk95U0Ur?=
 =?utf-8?B?RFNvVDZhZHU4TEhwdkxqQUtCUFc2elE2SW9vdnJiZ3ZQR2tWNS9OL2hMWTk5?=
 =?utf-8?B?M0JJejZWdTZXOG9SckIyOWRxVHUxVnArQnNqUk9xcDBuMjhoU1pqK0luc1dF?=
 =?utf-8?B?TnJsTTR6WHdlTTFraW5TYnJmMWJDOHZjR1JLd3BieFhqc3ZKUzB5dVhZNDF5?=
 =?utf-8?B?dG9kdWlUQTZ4STVYbVd0RnM5eXNRdHg3NWNTakNiTi9NUzlVSmtnd1JucXEr?=
 =?utf-8?B?R0ZpbDJxSDdsdVQ1SEh5N3ZucXJuRlBnY0ZUQkQwMHZtS1NDQ3dPeXc5amRX?=
 =?utf-8?B?TmNIaHlCZGI2eGJBQy9HaGNuNmtveDBxRkU2Lzh5NTZ5cWd6OUNkZUkyTDVQ?=
 =?utf-8?B?aGJyalpKS0VQUnc4VUxzdk5jcnduOFJIdVdTSFluUGJFcGlRRjE5aHNLb0My?=
 =?utf-8?B?ZUEwWm83WnRocVRLTjFWR0pxZ3Q3K3JFd2dzdGlpRGpDOHpWVGhSaWE1SGtT?=
 =?utf-8?B?c0VGSkRwTkRWeVFTeDd0K0NYajdXTFJ0TUxoekFNdTJXNmt3REpmYnIxSGZX?=
 =?utf-8?B?eGdCSFREbkJtWWM4UFFmM0Zwa3c0RitXcGNRaGlRODRQRWliTThYbDUvTU81?=
 =?utf-8?B?Q1ZxMXhZMjF3aFZRaFYydVNKOTZ4d2k3TU5oYzVqZUtxTkp5bTlNUEFKT0F4?=
 =?utf-8?B?M1FaNE1Bb2U5VFVZbkZST1RuNVIxN1MzMkcxR2RQYTlnOEJYU3lVK3NDS21L?=
 =?utf-8?B?Q2dycG0walVsMzZjSFcwamVhb2JLODg0L05TdzBNN2d6djNVeXM3WDRpbDlM?=
 =?utf-8?B?OXF4ekxQVHJsc05ZQk5HVlZDeG5RTUlWNm9XdWxPTVloaE81UXpTZWRRbUgx?=
 =?utf-8?B?YzhYaXNJanJjU3RSTFFHTlluemRGUjg0bGpQRTdNWWpDZ3RxS1F2NkpDSzRu?=
 =?utf-8?B?YmtPb0VnVFk1U0hHY3NadjVNTTdTMkFib0tSS3NXMzJxd2FwZ1ZyVk83Y0t0?=
 =?utf-8?B?NXNoL3hSOUsvejBZZFN2TjhsQU1vendtdTFXVEY2TjZCcWJUVHBBbmszYTEy?=
 =?utf-8?B?clNrVVExa3ZYR3RwQloxQWNOZUxtZSt2UVd1bXB2cCtkVmVOTjhiOVZmcnQ1?=
 =?utf-8?B?YkQ0ZDFpdGc1TU9LTGRWY0V1QkdqU2h0VjhCS05Kc3o1SThzZVRQU0dRYXNy?=
 =?utf-8?B?QXlZY3g5aEt2SU81aFVTRWpmMzMvcEk1UFZ5UlRHa0lDcVVPUnJwcnU2dWx5?=
 =?utf-8?B?NzYzOStWdW5LRFMwVm5BV05hY0pQWEZURTlRVDYwMGg2dWY3VzlkdVRiaEY3?=
 =?utf-8?B?a0RhYThGWVJ1SHE0KzRia3Nqb1Q1VlZDd1ZTaG1PTXE2QlFtU3R5MDR6eXlB?=
 =?utf-8?B?OEZlaXdtYUVKRTdHaGlVc3NpV05NblBiVUJ3MGVsT0FzWWF2MFhQZE9jbWR3?=
 =?utf-8?B?L0thY01odFVvUFVnTi9qZGplOXhFVmFWYmhEWU1XdUtPb1JzV1hnM09VM2s5?=
 =?utf-8?B?MUpFVVdUdjNJY3h5Ukd6WWJpbU0rRnlnZTBRRSs5akRCemNhMGFXbWhvd2oz?=
 =?utf-8?B?WmpBWVBnV3cvMDF1TzUwclplYkc3SHgralMvV2NaRUFNT0xabjVKNUZrOVg4?=
 =?utf-8?B?Y2x6TnM0KzVMS29mNTFSUWVVUk5jbXp5cnVJczhTK2k1ZlpPRWY3V0ZZeENn?=
 =?utf-8?B?UXpLSU5pQ1k5VWhvdHNwaHJTRGp0R1NYYUczMzVOWWZsYnlLSEp0cmN3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WmFsa3JMOEZGK0N2RE43WlZyUk9iUGVEWEl5S0U5b1NnVFJlZE0zenpEdlRB?=
 =?utf-8?B?bWFacTZtYWh0dkt0N0ZOOUt6Tks1cnlqVWtGTm1KbVUyYkZxUlJodEUyMzZz?=
 =?utf-8?B?Z1pEZ0RCY0EvTHovUll0YzdRQSt0blc5L2R6a0RhRER0VURtWEpJZmhUYnd1?=
 =?utf-8?B?OEhxTGJuOGgra0VrWEVwV3pRYTJFVDZMYVVpS041MzRSM3BHU2p2aDZNQllG?=
 =?utf-8?B?U0g3K044Vll1RGFkRldjd09oOFRCdkk0VEFnbTFVbDA2TW1ZQUJ5SEsySEo2?=
 =?utf-8?B?bDhvOVFzRkF0aVBzVWpmM1dVU2diMlR3eS9QSDdjMHhMVU51VFdTdnVhMUFW?=
 =?utf-8?B?alZhWUUzekZrTE9IRVo2ZmU5blJlMUZaUldSbFd6bmZUMHJtR2l5dlFDdGhM?=
 =?utf-8?B?STlocWNJc0QrR3B1ck5jbngwUVdqcnEyODlJeldKZElpaGlBT1VvYjBRNnBt?=
 =?utf-8?B?OGk3elN5dXZQbDM0a1ZUZ0g4VXJIRzI0YUhyc1RzTnZEUFNTV21vcGtPYkRO?=
 =?utf-8?B?T2Z3MEdpNmVCcU82ZFNtTWF1ZXZoeFhsR2ZlcEtyM2xrYWhpSlFWMDk0UVN3?=
 =?utf-8?B?RGFkamxUM3pyZlVvQlBrajhlODlPWjU1b3g5endWRzVKV2M2MC83T2lIeWpB?=
 =?utf-8?B?Y2dSb2ZVaEgwZlRmRDZ4M3Z3YlFoY0drQjZiN3VCeHl4WnBqV3N2VHBNMUdR?=
 =?utf-8?B?YmxRUHdSV3ZFaUQzQmVDVUFRU0piTkJvVlZrSXk2NzYxakNFK29RSzQ4K1E1?=
 =?utf-8?B?b1hpRDRnakM0M013U1FHN0UyV2FOS3h6VjAvRGxqeGtudEtYcE9TOVpwVHJw?=
 =?utf-8?B?YzFsWlY4OXdqZmxsTjd6Z0l0eTI5Yk9FelRwelVlZms5QktnUnFockV1ZEd6?=
 =?utf-8?B?Ym9qSGpNRUd4OWZQNnF3R2xqbWNxbjN6amVUb0F4Y25OQVhNb0hQb1JTT1hm?=
 =?utf-8?B?dUdKRWFydE4xdm5FV1hXUkJxZjVWeldJRlhrYzl3alBsYmk2cDAzVHgwYXZ4?=
 =?utf-8?B?UG5rUXBlQkV0L0JpemptbFFJaHlET01rYklDVkc2aGdFQk5FN2lmODFzVFR6?=
 =?utf-8?B?U0RlMndvRjVnZkFwOUJMeWJLOFRNVGpwSGxjVmZpalJsUGpIU1ZzQU5NVlEv?=
 =?utf-8?B?LysySlFmTndwd0JqNjgvR1Jmbk1YNExvQmhCbm85ZGRYQ2l0bmRNREMvRmZF?=
 =?utf-8?B?SGVxUUNyYktweEs3bGUycEZtMW5oRjVsTENtUFVxMzFPMnlvNFlVVU5yTzM3?=
 =?utf-8?B?Ylp4RGJ4TUZXSGdXc2FkcjQwNldRVWNxQSttSFg1Y1Z0QUFOL0RpQkppWUY0?=
 =?utf-8?B?SFRKdGtRWHBxWXNadGhlVkxycGJBdHJkYm1KUEozdkdzWldJTUk1RGJvOVRP?=
 =?utf-8?B?N2Y3c1JpVkZmZVhjYjBnTzFTNk5NbEd5UTdGZ2tqR0pqZ0dwUzFQTXFhbVdY?=
 =?utf-8?B?clpsN0drdWZZTEtNb1hRYmZIODQxQTdjY3pXVGZacjVHelFkaG0rMUVHUno2?=
 =?utf-8?B?MTZDY2hKQjB0emZiUm1ybjRjNVphazIyczJ5SDE3aW9qK3FQcDY1bmFiWGlv?=
 =?utf-8?B?b2RYU2g3UUhUMzJKNHdOUi9uR2dkV1RiK2ZNNmxuVGJlZzBvelZiKzFYQ1Bh?=
 =?utf-8?B?MnhidHczL2V6bitRRGo0bWh4Tm02b1RJMjdXVDRKNDQxR1hRaGpoOWZ2Q0Mx?=
 =?utf-8?B?eGNHQ2VsaERXYXdWNGVJcHQvQThFRUhRY3Y4clI2NW5vamZnYW5lM0dTbEJq?=
 =?utf-8?B?WkJhdENwdFk1djhseTl5V0RLYlJNdThESFpCa2pPOXlUM09OZmkySEcweHl2?=
 =?utf-8?B?NXNyQ1owelVSMGdWS3RiWFIxMC9BeHdNNWpDdUVobzkyZkFqYVQ0ZmdYZzl4?=
 =?utf-8?B?N1JHVnBNVDMrUkp5UktTbzJVNzRQaFFIMXBMZFRvZXlGVHJUL3h5N2lFclQr?=
 =?utf-8?B?amEyU1VFV2FOaXB1bDZtQXdqSW9uS3U5ZkZ3RS93YVZ3b1pnZnBkWFZRTmVH?=
 =?utf-8?B?NjNpeUZEa1hGQ3RXRGpaSnVXMzV4NStDS2swYkFaMTg0S0VucWFIZFVhSEls?=
 =?utf-8?B?ZFM5c3dIWVdpZForMnFyM3RCVmVmM3FUSG1BbEdJMURPaVd5YUxGVStqOGda?=
 =?utf-8?Q?2j5OM+2ioNhbAHMrGQ1mYmPyn?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7116f5ca-ef1b-4240-b40d-08dc732cac06
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 09:11:28.2716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIAEU22IHVa8Q+TH5M/cbNmx3MdDOsqxpRF3Vb8+lvKIB0xma5bs3/oL/l9jGiZ1RhltacCyph/bfqF+EOwDGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9987
X-Proofpoint-GUID: DqYP8XzZFZiD_2eIBeIXxnCxWqaHz0Gm
X-Proofpoint-ORIG-GUID: DqYP8XzZFZiD_2eIBeIXxnCxWqaHz0Gm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130056

06.05.24 14:32, Jan Beulich:
> On 02.05.2024 11:21, Sergiy Kibrik wrote:
>> Separate Intel/AMD-specific MCE code using CONFIG_{INTEL,AMD} config options.
>> Now we can avoid build of mcheck code if support for specific platform is
>> intentionally disabled by configuration.
>>
>> Add default return value to init_nonfatal_mce_checker() routine -- in case
>> of a build with both AMD and INTEL options are off (e.g. randconfig).
> 
> I'm afraid that, as before, I can't accept this as a justification for the
> addition. The addition likely is wanted, but perhaps in a separate up-front
> patch and explaining what's wrong when that's missing.

sure, I'll do separate patch for that.

> 
>> Also global Intel-specific variables lmce_support & cmci_support have to be
>> redefined if !INTEL, as they get checked in common code.
> 
> Them being checked in common code may have different resolution strategies.
> The justification here imo is that, right now, both variables are only ever
> written by mce_intel.c. As mentioned for vmce_has_lmce(), there's nothing
> fundamentally preventing MCG_CAP from having respective bits set on a non-
> Intel CPU.
> 

so could these global variables just be moved to common code then? Like 
arch/x86/cpu/mcheck/mce.c ?

   -Sergiy

