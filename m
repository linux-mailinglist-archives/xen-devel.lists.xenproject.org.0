Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4038D7E04
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 11:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734760.1140830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE3af-0004d2-0M; Mon, 03 Jun 2024 09:02:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734760.1140830; Mon, 03 Jun 2024 09:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE3ae-0004aW-Th; Mon, 03 Jun 2024 09:02:52 +0000
Received: by outflank-mailman (input) for mailman id 734760;
 Mon, 03 Jun 2024 09:02:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvE+=NF=epam.com=prvs=288473a65a=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sE3ad-0004aM-Th
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 09:02:51 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c6d2e70-2188-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 11:02:49 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4534IhaH011508;
 Mon, 3 Jun 2024 09:02:39 GMT
Received: from eur02-am0-obe.outbound.protection.outlook.com
 (mail-am0eur02lp2237.outbound.protection.outlook.com [104.47.11.237])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3yfw1aukg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2024 09:02:39 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PA4PR03MB7150.eurprd03.prod.outlook.com (2603:10a6:102:f1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16; Mon, 3 Jun
 2024 09:02:35 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7611.013; Mon, 3 Jun 2024
 09:02:34 +0000
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
X-Inumbo-ID: 0c6d2e70-2188-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFwoM2KAG/4EOR02PdIIlpS0mlyOw43405iTrZVT2Ma1sF8ySahcP5R90FHWTVEMl7QHkFJlDCgLfzZL4LGSzUNvEBGmGo/8glWXgoXYEwB/ZhK4b6QtZkKaQYb5nIJ4VxoJElAmPYjLspFaV9fUpWBBHj+YlXSwMOJ8DB4yI+A9g2TLOBifqmJ4qVnIGNpvgKvvBqflNWfl+ahvEuqhplrPBCHgK4ta8xZkyQ7GNT/SoP8jEd7mwv7s95tYC/p82x+L9soTcHwcDnICKmI9yoRjkU+R3L55OTienyqQb92Fp4d9qr0lzKeXd9TOWOE+y23MFZSWCPuYwTKmX5iznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tr1UsH59RERn1t6O2Gk4PbDW3lgQNTG2cS6treYQbdE=;
 b=XB+exh92lYsV6YT7adGkiYc2U6YQoHCsFCYmr+VZMFMFEl/vwmVuooGcieaR67BHYNx5hN+JspVdbCVJKTETWweT8B9lYXNK0ij9Xp7rGuj6LR71h8FFzF5mSEuLJTIetKaRyEv8kCDVYlqUb/Zroo3utNZnJ7muTjpqWKbOjYLjBjfO6+qcEDr9FRpGZZPFJ0iRz+O3C44SclcOqM2J6L2xNVJAZemwPMZwOjhRdpL7o5VQcedIbj1G3m5RJEBwMOXbGNYgxyVYmxBG4hJFibycG2SCmglyFl6llsdBstivLwnsbHYlUbP9WCDB82ljaVt0k3H+yMyVUjrr6n7G+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tr1UsH59RERn1t6O2Gk4PbDW3lgQNTG2cS6treYQbdE=;
 b=c+sZUGkiCbT+yWrqYRVFYcAx53fSHkw5y7zhgZyxBXz0SZOpWs4F+rp4LiBtWFwgf+0InbGxqnfg3Y8zIYCzapC1eGXe8uUe6s1Ps7AwBY2HLeWuWmuQxJSWHwrcA0HgNwztgaR8v8+8nrOGuEJJvPFMp7w7+egdXtKee9ez6cs0tHEIBRpWrb7ULfXiWjhFwKp3vs51sVi3UMQjdzQC+FMZBeNhmrS8+plbDmfXfNGZqGMB+P0BKZHWdlCxxJCT3aF6clFFdDEAwxYvpDey5I+rNV6OXHaQb5AhiAk79WY0CpmX84VwA/kGPFyA4ttIYbu23iDIy0LxFIhTNEC8Lw==
Message-ID: <f7ef0b65-4c16-4590-9122-99d61bddc544@epam.com>
Date: Mon, 3 Jun 2024 12:02:32 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 08/15] x86/vpmu: guard vmx/svm calls with
 cpu_has_{vmx,svm}
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <fbd17194026a7e61bac2198e3b468d498f45d064.1715761386.git.Sergiy_Kibrik@epam.com>
 <7d780eff-a64f-40dd-a377-2af05bbd2eee@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <7d780eff-a64f-40dd-a377-2af05bbd2eee@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0032.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::21) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PA4PR03MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: c85eea43-fcf4-40c1-f3ac-08dc83abe8bd
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cUJCT09weU83bThZdHlwbkpreGIrUGdQS2NyRWFTdkxnVFVYYjRvV3Rra1Ju?=
 =?utf-8?B?MWdFN2FZQkFTbzRBcWpkSGtTbGZuZ2xQb0xOQnI1dkxsdHhra0VJcWJ2KzdY?=
 =?utf-8?B?bFNuRDQ3dGd3M0doS3RzdStqMUsyNzNkZEMxMXJjcW1neENQSXFycW1lbVNW?=
 =?utf-8?B?SlJuU1J3MDEyS0QyUy9pYThrSWd3M0dNdnFUb1gyeENicUh5NzRjL1ZHRnpn?=
 =?utf-8?B?ejZsclZ6LzhyVHFoTWszdHRMbW8rQmVRSUVCNEhEcXRzRFphZ3lybUlVbzR4?=
 =?utf-8?B?RUNvUW5rMWxzazgrbGh0Z2RxZFgxRnRsSm5YK3Avd3MyS3NWNGVQYXgwb0l2?=
 =?utf-8?B?Rmhnd2N5elpXSHpEdU9WdVFlNFVvRTBMbHMza0JqbmRYZzFqeHYxOFNiditJ?=
 =?utf-8?B?WkM4ZDRpN3lrYVlxV056cFgwWGcySnZpYWUzajVQY1YyNU1iRjFiamlsblRN?=
 =?utf-8?B?TFNFYVlqbE1NVERSVTRlUFZ0WDdKYm04OCtHcDAxeml5MVAvQmtyZUV2ZnZu?=
 =?utf-8?B?SGoxM1BVMlpXQWtCNFEvQ3FHcC9HL3VrQkh5YWJwdXNCK1k4TmFLV05lN3gv?=
 =?utf-8?B?WHRoY25HQndiaDNIVnVnTG1GU2ZIVVVPNnRLMDB4WUxNR0dEV1o4dngyMTRO?=
 =?utf-8?B?Q3ROZ3VkMXpOL1NUQXk0STlEeGZYTzBNSzJYc2JDaGhxUXR1b3VJaWlmUnhR?=
 =?utf-8?B?NTF4ODBWdWxiZjRnTjR3TjRhenhqd2YzWnBPSzFqQjI1bVpNSXFvZkhnK0Zx?=
 =?utf-8?B?QTFwMHp5V0dmc2RtYy9qMUZoVElzLzZreVNBRnRWWVp3VGgyejVBd1F4V2t6?=
 =?utf-8?B?TitkZGNOL05xSnVnY1c1NnlZVkxuVDZYQUJiTkVOdjE1Ly9xbkhUcFlmaWpq?=
 =?utf-8?B?dGJNTU85dGJSdXJsc2FzL3ZiTE1RV0xHU3dPN3pLbXpyQ0JCMzhGbXExOXlR?=
 =?utf-8?B?VXZyUEFXZk9lbEtkVEpUVGtORHU5RER3blBkd20vMjJCbFM5bzBCMzl5UE1w?=
 =?utf-8?B?UlM4VUR3Tyt6NVJiLzZrMTJTalJGM2tUVWtqcUlKYTVKWXc5Z1EwVmRNUHdF?=
 =?utf-8?B?VHkzb1V3K20xaVRwUS9TWU14NEtzbkZwZ2JNWUsyNENScytIVTdiU3hSM1ht?=
 =?utf-8?B?U1Z5UklPdytTdHN4VDU4UHJPSTVOWllEMXpad3Myc0twUmNXQ3ROZm9oL01O?=
 =?utf-8?B?M3hXSHBiUFdQVFB5T0graURJdHoxbDkyelNQcGFobnVLaEhyZWpkTlFDMlFZ?=
 =?utf-8?B?YitYSmp4bDFDMWJZSVlTMlc5K2NTM1JFaU9hTmN5a3BFUDRUMlFHMU1pRnBt?=
 =?utf-8?B?Z0JJMGN2TWVsenhTMjFJVkhDaWI5UzNNNHU5M3J6R0lyNDM4dVp3TnVlUFZN?=
 =?utf-8?B?SVpTNEFtN0RLUW1xN0xZWThpdkhHU0c5N1R3Tyt6dko1TlczcW9QWHpXemNu?=
 =?utf-8?B?RkJCNytlb09xMFU4Yk9YR3h6T3NMWnZIM0t0T0p0bENLMWRHU2hlVmZJNG0v?=
 =?utf-8?B?Q2hpYXFRazVCMktaL2Y3MnE3Z0hNcVU4d0ltU3pxbzljQXpvSTYxZjliREwx?=
 =?utf-8?B?anJuZ0w0cjJ1N3JjVFhmcW81OE9lY0NJUWt4WkdYRHZqYVZwbVdNWUt2UjhX?=
 =?utf-8?B?bDVQVVVFdDhmZUNXK2pNNFBLMStHaUlkT0hZdW1rYnFUanRwQ0lBV3MwbHZT?=
 =?utf-8?B?SkpZL0J1dmVXS29QMmVHdkJwQ1czdUNoT3lSSkJhMzVvR1A5Z01hVHpRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R1RZaVV6MExnNWVpc2VHdDhqL0VxbGs1ZW5ybmE0bHp2elFBcmtGcHZqUVlT?=
 =?utf-8?B?Mks5VElrU1JrZnNlbTZzR2drZVpMMzdlM0xBSlZSVGVaTlZsQTYxdkxPdkRD?=
 =?utf-8?B?bkc3QnN6K0lZL0NkOHRZMmhMM0J2UmlmR3NPWFlpeTlBVnk4Y0JlWmk4WU5X?=
 =?utf-8?B?UTBOS3RTMTVQMGZTSVE4TWEyVE9hWUhqV2czaE0weWZyM3hGYlFSSFhyMHhT?=
 =?utf-8?B?TTQ5M2k2bjQxQjEyM3BmRzVrQVVVUkZFTW5FbmFNUlRoeVlBdGtRWVIremx1?=
 =?utf-8?B?TzRPUWg2Q0g3S2gxVEVnSDFmNHZQbTI4djNhb3NZbFlhSnRxLzg1cDE1N2th?=
 =?utf-8?B?b3dZemhucGowQmpqUlZPK3FBclZKc3ZXc1ZDZi9ZamRFdUNsRHBEeWxnb0xl?=
 =?utf-8?B?TVJuUENmUHhNQ0k0Wk14T1Y1K2dYZW9tREtOaXRKMHJtNkYwMVp2V24vZ3l5?=
 =?utf-8?B?MXNJcGVCUEtNWGYyZFAxTks1WCtXTFk1aUU3L0ZCdFFNMDRjS25VK0tLYi9t?=
 =?utf-8?B?RUNCaGFSYUhvQXFubG1BaE9uM3NZeCsrYzRZYlVzV2dKWG5NZVkyQWhxZlpq?=
 =?utf-8?B?WWxTejI3azNzMTVSak84NWY1bEM5ZXh3YXJraW1qcjB5TjlHaytWVWcrc3BF?=
 =?utf-8?B?QTV1MERpR0NadjB6NUhqZ0dSSGR1SHF6ajlSdTdHczFuOWtCTE5CYVJnSW94?=
 =?utf-8?B?NUFoQnZkbks2bC9tY050TkQzNlE4dHhFVjZ4L0J5RDNMTjZCQWtoNnladkhs?=
 =?utf-8?B?LzlXOHlVOGxSS2hVanN3Y2VsZUIxeXF2UW9tZjVpb0ltYnVBelhMazV2Z2Yw?=
 =?utf-8?B?NUlSYWxPeGo5QzJ1S0NBaWhvN0E3azNldGRuNU1ONjFPRlF2MlNIRmVTaWMy?=
 =?utf-8?B?b0V5aHBxRzF3b3hyQXVLY3QxSzhRYWd2RjlKSGtQYjFZaE4zMWdWVk5WeVFN?=
 =?utf-8?B?RWRGZDlrZU14ZjFyamduWW5uZ2tLejlBVnRURTFmZ0UySjBYS0d5eWo0U2p3?=
 =?utf-8?B?S25GUWsyVGExekYrZjdVVzRjSFBRVVF6VXA1aVJjbk1lc1pDdWY3S3R2dU1N?=
 =?utf-8?B?Q3RhR2FWeGcwLzRrWGp6Q2EzT2NzK2JMd2tiR1Ntc3oxOW5GS212aFNUaStE?=
 =?utf-8?B?WmtabzVjeXQzSGZtY25pOUFRbUxmWGV5SnVCMEZqd1c1cUJvV1plcUQyeGJS?=
 =?utf-8?B?TnNvUHpkV0VYQ0FieW03cStVRWhQMWxzZllNSFpZUVlTcTlSa0tqdDAxMUdK?=
 =?utf-8?B?TTdzZmNES3U2RTJhV3RKZWJjeW9peEZYRzhML29EUHA1SmNNMEdsWnN4azhp?=
 =?utf-8?B?bHF0VXpYSlRWMzhLdXhTc0RUTDVtR3BBRTQvMGpqYVJFSFNLQ0FBS1g1bVlL?=
 =?utf-8?B?TkpJL2NqWnZvNjN1Z3E5R3hqbTJmY0lycHhhZUxpeEpnekd0Tmh0VlhzMjd0?=
 =?utf-8?B?V1d3am53Q3QrWFZ2NjJhODh1c1VGVkNidFhSNEduaFlJcmNGdkY4YnFvUk91?=
 =?utf-8?B?MlZqeDlNcG1HWGN1UWtDVlZrSXJJZUJtZWpFT1VVaGlWUHhPL01IQzAxOCtZ?=
 =?utf-8?B?Snk1MU5iNUhyT0ZGeHZrMmFwSFk2Rms2QXMrUjhibFpKVE1aemE4YzM2Znpo?=
 =?utf-8?B?WEZSR0F0Ri9RSGFoY2thUUprbE9wc1U2RUNZY0tkM3I4Y1V5K3dQYWR4Nk41?=
 =?utf-8?B?RUpETEJuSDRndHRBN01sZC9zMU5yeVdXWS9WZFdHTm4vVU9jTCtsNnJjb0I4?=
 =?utf-8?B?ZVJMOHFoSTN1S1h2RnJiM3NyT3BPLzAwengzMHhGVEk2aUg1ZjBGOWQzam5t?=
 =?utf-8?B?WFZ4WDRSKzBBb0wxSEhjWWFVVFRiRUxvV0hTTkQyS2ZrNjVkTk5jTDBkclFY?=
 =?utf-8?B?eHQwdS9nMUk3WnJ4dHZET3A4bFphb0xsTmtzeEtXbCtRQlQ0ZUhmM2N2bmM2?=
 =?utf-8?B?TmJ1ZDhvb0RXK1ZJSWRQL01kdDRUMXRva1RLVHAzWElZL1hjZ1IvK1J6SVRw?=
 =?utf-8?B?K0dwVzFzM3NrM2Q2M0tMWldTSG5iYUl5M1hPT2k1dlQwTE9HSHY2cSs0WkE1?=
 =?utf-8?B?N0tYaEUrcWlhU0RJR2VNdW9wY2ZlMXB0M0dKYzJMUDkvd1lZVm15Nys5L1lq?=
 =?utf-8?Q?jyjiFo5mgnh6GYW/rhh6mo6yu?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c85eea43-fcf4-40c1-f3ac-08dc83abe8bd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 09:02:34.8924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LW5fUS2n+AvFTuw2TqDISOwpqha016JR7KP2eKvRHwoFUnrsMqokFdrsq4pFOwVsLUTH9/HiI0O6/+79yEmCnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7150
X-Proofpoint-ORIG-GUID: FESrUTUyzQsXyE8DI0jhjsaoeZI_K1Zk
X-Proofpoint-GUID: FESrUTUyzQsXyE8DI0jhjsaoeZI_K1Zk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030075

16.05.24 14:23, Jan Beulich:
> On 15.05.2024 11:14, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/cpu/vpmu_amd.c
>> +++ b/xen/arch/x86/cpu/vpmu_amd.c
>> @@ -290,7 +290,7 @@ static int cf_check amd_vpmu_save(struct vcpu *v,  bool to_guest)
>>       context_save(v);
>>   
>>       if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_hvm_vcpu(v) &&
>> -         is_msr_bitmap_on(vpmu) )
>> +         is_msr_bitmap_on(vpmu) && cpu_has_svm )
>>           amd_vpmu_unset_msr_bitmap(v);
> 
> Assuming the change in the earlier patch can actually be established to be
> safe, along the lines of an earlier comment from Stefano the addition may
> want to move earlier in the overall conditionals (here and below). In fact
> I wonder whether it wouldn't be neater to have
> 
> #define is_svm_vcpu(v) (cpu_has_svm && is_hvm_vcpu(v))
> 
> at the top of the file, and then use that throughout to replace is_hvm_vcpu().
> Same on the Intel side then, obviously.
> 

sure, will do

>> @@ -288,7 +288,7 @@ static int cf_check core2_vpmu_save(struct vcpu *v, bool to_guest)
>>   
>>       /* Unset PMU MSR bitmap to trap lazy load. */
>>       if ( !vpmu_is_set(vpmu, VPMU_RUNNING) && is_hvm_vcpu(v) &&
>> -         cpu_has_vmx_msr_bitmap )
>> +         cpu_has_vmx && cpu_has_vmx_msr_bitmap )
> 
> Aren't you elsewhere adding IS_ENABLED() to cpu_has_vmx_*, rendering this (and
> similar changes further down) redundant?
> 

indeed, I can move this change later in the series & reuse checks 
provided by cpu_has_vmx_msr_bitmap

   -Sergiy

