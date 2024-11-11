Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610BA9C424E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 17:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833999.1249343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAWr0-0000SF-00; Mon, 11 Nov 2024 16:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833999.1249343; Mon, 11 Nov 2024 16:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAWqz-0000PU-TA; Mon, 11 Nov 2024 16:01:25 +0000
Received: by outflank-mailman (input) for mailman id 833999;
 Mon, 11 Nov 2024 16:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHe6=SG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tAWqy-0000PO-OJ
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 16:01:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2412::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f288485-a046-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 17:01:18 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA1PR12MB8119.namprd12.prod.outlook.com (2603:10b6:806:337::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Mon, 11 Nov
 2024 16:01:12 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 16:01:12 +0000
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
X-Inumbo-ID: 2f288485-a046-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjEzIiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjJmMjg4NDg1LWEwNDYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzQwODc4LjgwNzA4Mywic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmqale9EYP10343BV+Mq62eacDCoHWvhDjt0DznmU4OsDiVEdm35hvPLljq0yhtvmDj6Q3CHFon1AeG1HRFeLqdpoTgEJ/3AzAmcDYFYwcqhRzsJjFDv+0g1M0NVC8KjgtwWBU2PaIjGMN673KAi/BA91m1p/XBsuOKm+9TFgEAYCVBvqrDXqR14wUijK/AFEcnB3pLJsca1N96AX+xJ15kYlpSVOg2QdIsQsddLAJ59G6tXu56+PzWRTMD5VbW+sBS8PN3aPFQJNNiqfzZyfOaYGAmH30kOWiTYxdC4sqPT5SuIgmPqfLpP//IC0mUScP2+Cj//y0ZBEBlqJcUsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77dwYmiSAKS7gANXteFEPKiFGOY8ENhgnwTG/vsviX8=;
 b=oJ7ARS2SApfnDJpd0hpi9elTdoRWcfBrSqAIeP5tKbl/7UOZ+oiUjueV1WlFa4+zpIJehFc/eVwAyTIaSW4HN44IJ/cHH/f1wW53siMACx5VV4w9Dij2GLkHflomTvYJVHFof0PlYJf8sz++pyOg1qVBm8hq/ZeGr4Y4bFl6lMRafb9kryS7iZ8QbrFeEQquvjnpa564rwM0YxswcEb84h/1wmJpk2ds92i6mhTADUpkZ2iZjbv9AFoScNa929ESjjlrLA+kHp/4EXHbG6LkGdjtCA4Qy5B4DOVCE7KNg/4oBjZInRkBuHoXmm+KM3UwxXNJuU1yjzTNP5GWrIn6aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77dwYmiSAKS7gANXteFEPKiFGOY8ENhgnwTG/vsviX8=;
 b=JewtLnuGPdGxhR5ghUJs9oAVty/U7GJ8psUsUj33F8o5nDYGqMhpDbrlGfLOWyO/Xy5AQSpfXLBmkvJC2CvP1W7pxoyXTSMcSCJFdFIcXR5YrsLBGPcv+/D+FrpL56TM29Qmrjwp/pWq6RnluWlVfeNa/08AP0UuTDT7IB5c/bQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <86862f6e-caf3-4a5a-a650-b9bac74b83d3@amd.com>
Date: Mon, 11 Nov 2024 16:00:50 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20241108195918.856412-1-ayan.kumar.halder@amd.com>
 <80ac1e78-5259-43d2-8b18-d5bd3abdca1b@xen.org>
 <2ca98e9c-1a4b-43a2-b707-097dc5093e39@amd.com>
 <6dc2ebd8-d206-479b-ac3a-83ed59c7109f@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <6dc2ebd8-d206-479b-ac3a-83ed59c7109f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0469.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3dc::18) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA1PR12MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b16a0f6-d8fc-4439-52a8-08dd026a1074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QW1ST2FRSTd4RHdOTDlkQVFaejNtMkFhOW0rTTFxcTVuZjFydkpGcUhvd21x?=
 =?utf-8?B?ckhOSlJxYjQ1QktWM2k5RXFXYVFlNWh0WTRwYTFhdnErS2dRdE5mdlgvTEdx?=
 =?utf-8?B?R0dtSHpXd2hSODRwZGtwcVduSG8yajJPZlNpQXhlSDI0VkJ3YzJpZFpzZElI?=
 =?utf-8?B?ZzgxUHdUaUNpMThZWmdCdGhnTWF4UzNkcUZuck5BOWZjRlE4TWYrdWQ1clFi?=
 =?utf-8?B?Vk9pYkM1dlQvMitLc0d0S01pYnRUZ1JTYzhWU0RPTldDQ0hCaDBPYUhPZUdy?=
 =?utf-8?B?Y2lnY0pxaWhXenJxMmlMcStxS2YrU2JpMzdXZnB5UTROUXVSeURvYVJMMm5B?=
 =?utf-8?B?SHlGL0lPeHZJU2kvemlITnRwYUh4NGU0YUxUZVFhTVdRTGt6MndkNDhaWmRx?=
 =?utf-8?B?U2hodU1hNzYvSWVKeUQxVnJFNlZCcGZzOVMwMjlBNjdVSjJCK28xUVl1T2M0?=
 =?utf-8?B?bGRrRG1sNHhHR0pWMk53QTJ2d0VFVUVGMm5GWHJyNzg4dFBLNWErZ3d4M1hx?=
 =?utf-8?B?S0dZT1pWTzlLNThydXZCN1I5UlI4U0V1c3VaRGlmQXhENVN1a1JENS9sakdr?=
 =?utf-8?B?T0NOU0djby9RWDRZSFVzK3FGQXpIazBqc3M4R0tGRituQitFYlZxT2JqcUln?=
 =?utf-8?B?VGl3aWZmL0dOREFBVld1SHFwSUN4RzRMaW5sQUhyK0ZQQkdXVWt1cVJadjVu?=
 =?utf-8?B?cVF4TVVnbjF6eWY0dks2NVFoeFhyNkovNllvREJxUXNTMXQ1WUYySEpCR3Bu?=
 =?utf-8?B?QStpYnAvU2x1YkJjdzNjN0J2SDlPNzA0SUNKU3RQd1FaSUNJc1V6SUl1ekVV?=
 =?utf-8?B?S3hJTVFKb0R6S2p6T3pJV1gzN2twYUVQNXJHd3hJaTZiQldWTlNYdFdkN2xk?=
 =?utf-8?B?V2xzdDRBelNOdlBMY3laYm96a1ZONmRCVDFjUTNLOTdEYldSNFJ5dWg4VStl?=
 =?utf-8?B?T2tNcVFzTWZjOUxvazNPczBGbEZpMWN0cXRNVm9PL25lODdzVHEwYnB3T0F0?=
 =?utf-8?B?MlVoQU5lRWZiaS8vdFo3UHhPU0s0UlNJTVVLZGpGYlp0blovUkFJeTZsR2Ja?=
 =?utf-8?B?VFZtL3I1alkvV01WU2NJVFJBM20zU2tUaTg3OVdsQmtZQXgyZUw1WVhrc2gw?=
 =?utf-8?B?Y1ZFUXZndnNuOVc4bTR6TVhNQ0g1YVkyNEFzRzB5YlRlOFVnbzdIcFdpcDJM?=
 =?utf-8?B?dk00T1NzWmFIMEdWdTNpNFgvaHlpUVB0Rjd6TEhOWFk5YmZZZUl5aGhzZGtZ?=
 =?utf-8?B?MVlYeXBWcXBaRGZGaFM4RloyQm1VOUVIQmExYit2dmhnbTZSdXFpR01ZL1hD?=
 =?utf-8?B?UnJEMzJ1R2ZxTTFMb0hVaTZnZTVtZFFXN2VxVk9NbVR4VVh1TW1oUlNoMDNz?=
 =?utf-8?B?bnBzL1c1d1lyekhoRDJSZGFGelZJMFVBZFNKQmJIbXVyR0xUT3JMUlBIT0FV?=
 =?utf-8?B?RGpqc0c1RHYzTndGNG5aVFZxUFozcy96c1Uyc1NOUWdIZkh5Wkw2NUJPcVVn?=
 =?utf-8?B?c0ozTk1qR2N1NkdTcm0rNmR0L3ErazVEcEQyTmlqb3RlN1dkaFY1QWo0QXNy?=
 =?utf-8?B?NEc0aEhDRUVzVXBMaFU5djhHT3pkbnkxWk1adksyTk14YlJWQTNrWGpOUkJL?=
 =?utf-8?B?WE1OTTlXYnd6SStVZHF2RGQ0dGVEOSthWGxsUGxGMU1TeldDa2FXMkw1Rm8v?=
 =?utf-8?B?enp2czAzejZKMFY3c05VdW5YZ3NKSG1UMWpmM3R2NDVCVFloMGFyaFVmRHNY?=
 =?utf-8?Q?xJjuwxKD0KOhWBBeXtgR+yeVQvzhO4aSX+bdXBn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rmthc3FRdGNUTDBIblNLaTdDVWRsQVcxUW1MQnQyME16a01pK1RoaTVmUjJY?=
 =?utf-8?B?bS9GVUlIUGxISmw1S0M3NWFLcUloRVNVR3pTZ1pXTHQrdHJmd3ZhUVRDT1BG?=
 =?utf-8?B?UkNUaWtaVks5YkQxNjJzZHBSUklvZFhja3Nzam1Bak5HZTFZSWQxVnFjbmxi?=
 =?utf-8?B?YmFXYkJPbXVsajBRNXJEaThoa09FMnh6a0tIYjFKaU1zdCtrNGZQOTR2MUF2?=
 =?utf-8?B?bVcxZnExNkVKMFNQT3UxVnNaK1RUSnpBYVM2ZTZZdmZzYkZCMUlZZGpFVFpL?=
 =?utf-8?B?bkNQSGdpVnMyMnRYS09zamZ6ckZzUTMyMWMzYUJvSnZMNURCKzhWR2VBTHJS?=
 =?utf-8?B?bUVxME1kNXEvNUdGdFpIRm1Wb0s4NUZkaSs5SDFvUGozbmFZUVEwaVBYLzJC?=
 =?utf-8?B?THA2eXZlc2ovclh4MDhtdXhPZWR1NHVCb1JBOUQrZmFnTFd2b2lORWtXMkhy?=
 =?utf-8?B?TUdTczZhb3Q4eDUya0dPbXdjN1V3U2FCS0VFZHVsTnFibFJmaWd1am8yRkJh?=
 =?utf-8?B?TlFpUW9Ob3ZZYzZGb1k1Z2xaUnVmRVJXNFh4YTFTaXJ6TWF3N0s3NHIzejFu?=
 =?utf-8?B?TkNqR3NNaGpoTzhXYWFoRGd3Lzl5MDRwSytsMnNRVy94RENHUXlKZjMxNENM?=
 =?utf-8?B?ajZ4L0J4ZUsyN0EwUk52QTdjbDlGdmZKN3M3cmpzeCtIZ3BxSFd4dDhza3U5?=
 =?utf-8?B?MlhFZ2JJcHJsN2tveEw5Vmk4QTlPUHkwNjh6ZjBJc0F1aDFRN0VMQzZUSmVJ?=
 =?utf-8?B?cVBWQ0JQY3dLQUc0Qy9pVnF5NW11VUdBdUd2aGJ5K01EMzU2Wlgwc1gxbkNp?=
 =?utf-8?B?b3VVdEowOEpDdVdhRDBtSnFiR1h2MWpEYU1Wb0FaYnpsRFVHSTBIWGo1ZVRN?=
 =?utf-8?B?WVZJSUh2R3JWUTdvU2tqdEZ3Q3dlS0pBUHNSQmZ3dHdpdmFIVjhkK3lRMVdG?=
 =?utf-8?B?NU82OG92YjY2OWdlZERkSVBENEszK0dpZGxjdTVHaHNNRFlzNDZ2Snhidzhz?=
 =?utf-8?B?dEtSRmw1dmRYZ28rRlNBdS92dmNvQ0wxaERYMGNNL2xna21EcDMzOTJlZmtm?=
 =?utf-8?B?d2swbWpycFRiRWNGUWFyb0pkdnA0bTcvR0xvbVkvdnJPYWowZjlXdWxkOExu?=
 =?utf-8?B?UVB3VjlnOThSenovR0N3NWhrNkoxUDdiVGpBektXQzNIMExKVGtaMzBtMmps?=
 =?utf-8?B?bm9CTE1FanppV2lZNEREL2JuYjNWOFJjVDN6K01jQklDb3ZWb2drQXF2WDlz?=
 =?utf-8?B?MWVYU1NrYzgrRk1NZTQydDdUay82U294WDNMOE8zWExZYU80VDdXa24wc2o3?=
 =?utf-8?B?cG13aGg1dnRPdWJ3MWZoU2I4elBQKzBsbm5sbG11NzhxZTM3WnE2S295azdw?=
 =?utf-8?B?dXcvZGgwNEJsdHArOHlDY243bEZ5aDNOQm4yYkQzbmRDN1I4U3FGaGVEYkRS?=
 =?utf-8?B?WnkrM0VaemJoNjNUYm5wcnJrcGFuZ0R1SHA5aVloelkydXB6SFdzdytCNVgz?=
 =?utf-8?B?VlMvNHdsL3k2cnA5cHNZdXhPTy95N0RvVDF6dk1QSjMvNEpWMFFXSUc2QXkx?=
 =?utf-8?B?aVgwS25BMnZvQ3pHSEVUZk9UUzlUMlNiZ21YMzk4Zi9oYkJyOGQzL0ZJWEdh?=
 =?utf-8?B?c3ZTa1Z3bnVraVByOEVjd1k2OUJPZjVLZ0tuZmF1ZXUwUXV1ekVjL0JBdEZH?=
 =?utf-8?B?TjE5Qmx5dncyUnJ0TDhzK3RyZHd5QUhxZjZaVUNqNmZvS2x5Yi9ibHV0dEZ0?=
 =?utf-8?B?YmlwRURhbHRQR2RJQlRHN05XbGRlTXVNZUo3cnVPekpFWDQzMFEybEEySHI2?=
 =?utf-8?B?WDdPSWY0d09iVjRGOERWWVJFOFhicUxZUmxBUm1YSmpTcUdUaWRVMTFTTGNj?=
 =?utf-8?B?Qzl0ZXVvSTUvUGNiSVBYZUEyRVBHbDVjdVNrZzZsMFZtZElIMWJpMndIVS81?=
 =?utf-8?B?RnpLQVkzRnU2NHZVS1gvcVpVQ095bjRlQnU0WEhPeWszSkhGN2lDZFdnVmM2?=
 =?utf-8?B?ZlB3NXBSMkhQd1I5eUxVSGtNck1GSGFFOFV6c25ha0E4VTlIVkt3OHVOekQ4?=
 =?utf-8?B?YXdjQXlNT2hTVmg1bHNTeWFFL3B6aHk4dzltazczczF0TnV1NnhCa0xFUERp?=
 =?utf-8?Q?zStOf5FItvD/BLFJGf55DLWwm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b16a0f6-d8fc-4439-52a8-08dd026a1074
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 16:01:12.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emi4/dNOxtfGyTVMDu0K5bdGDDja4ItRSMDm/dQyttyP95+k+SqeWMcMiJ7WDN2SAWCuuBbm8iMuOKajVn32aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8119


On 11/11/2024 13:45, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 11/11/2024 13:24, Ayan Kumar Halder wrote:
>> On 11/11/2024 11:12, Julien Grall wrote:
>>> Hi,
>> Hi Julien,
>>>
>>> On 08/11/2024 19:59, Ayan Kumar Halder wrote:
>>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>>
>>>> In Xen, SMMU subsystem is supported for MMU system only. The reason 
>>>> being SMMU
>>>> driver uses the same page tables as MMU.
>>>> Thus, we make it dependent on CONFIG_MMU.
>>>>
>>>> Signed-off-by: Penny Zheng <Penny.Zheng@arm.com>
>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>> ---
>>>>   xen/arch/arm/Kconfig            | 2 +-
>>>>   xen/drivers/passthrough/Kconfig | 3 ++-
>>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>> index 15b2e4a227..3699e148e9 100644
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -16,7 +16,7 @@ config ARM
>>>>       select HAS_DEVICE_TREE
>>>>       select HAS_PASSTHROUGH
>>>>       select HAS_UBSAN
>>>> -    select IOMMU_FORCE_PT_SHARE
>>>> +    select IOMMU_FORCE_PT_SHARE if MMU
>>>
>>> Realistically, everything under drivers/passthrough is MMU specific. 
>>> So does it actually make any sense to select HAS_PASSTHROUGH right now?
>>
>> Actually we are able to assign devices to different DomUs (eg UART1 
>> to domU1) as long as the device isn't behind an IOMMU. So in our 
>> case, the passthrough device tree has this node
>>
>>          uart@9c0b0000 {
>>              compatible = "arm,pl011\0arm,primecell";
>>              reg = <0x00 0x9c0b0000 0x00 0x10000>;
>>              interrupt-parent = <0x01>;
>>              interrupts = <0x00 0x07 0x04>;
>>              clock-names = "uartclk\0apb_pclk";
>>              clocks = <0x06 0x07>;
>>              xen,path = "/uart@9c0b0000";
>>              xen,reg = <0x00 0x9c0b0000 0x00 0x10000 0x00 0x9c0b0000>;
>>              xen,force-assign-without-iommu;
>
> So how devices will be protected on an MPU systems?
>
> >          };> So, should we still disable HAS_PASSTHROUGH for MPU ?
>
> While it may work, a lot of code in drivers/passthrough is IOMMU 
> specific (see all the function named iommu_*). So I find really odd 
> that you disable IOMMU_FORCE_PT_SHARE but all the rest is still 
> present...
>
> I think we need some consistency. If you are planning to do device 
> passthrough without any protection, then I don't think you need any 
> code within drivers/passthrough/ (at least for platform devices).
>
> Overall, for this patch, I think it would be better to simply select 
> HAS_PASSTHROUGH when MMU is enabled. We can revisit device passthrough 
> once we have the patches on the ML.
Yes, this makes sense. I will wait for Luca to confirm as well.
>
> BTW, I think it should be move under the Kconfig MMU rather than using 
> "if MMU".

Yes. So for now this should be sufficient.

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 15b2e4a227..adebf8d5ca 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -14,9 +14,7 @@ config ARM
         select FUNCTION_ALIGNMENT_4B
         select HAS_ALTERNATIVE if HAS_VMAP
         select HAS_DEVICE_TREE
-       select HAS_PASSTHROUGH
         select HAS_UBSAN
-       select IOMMU_FORCE_PT_SHARE

  config ARCH_DEFCONFIG
         string
@@ -78,6 +76,8 @@ config MMU
         bool "MMU"
         select HAS_PMAP
         select HAS_VMAP
+       select HAS_PASSTHROUGH
+       select IOMMU_FORCE_PT_SHARE
         help
           Select it if you plan to run Xen on A-profile Armv7+

- Ayan


>
> Cheers,
>

