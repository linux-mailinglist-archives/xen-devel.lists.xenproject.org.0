Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMMZI0emqmlTVAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:02:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5621E5F7
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 11:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247543.1546118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyS0v-0007Eq-PN; Fri, 06 Mar 2026 10:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247543.1546118; Fri, 06 Mar 2026 10:02:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyS0v-0007Cu-M9; Fri, 06 Mar 2026 10:02:33 +0000
Received: by outflank-mailman (input) for mailman id 1247543;
 Fri, 06 Mar 2026 10:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOhc=BG=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vyS0u-0007Co-Cg
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 10:02:32 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9591fa2a-1943-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 11:02:30 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV9PR03MB8440.namprd03.prod.outlook.com (2603:10b6:408:377::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 10:02:26 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 10:02:26 +0000
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
X-Inumbo-ID: 9591fa2a-1943-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHRB4tOHW8NkU8SE62QanmkqP14nmWvWPwhtYJo9PYcBWmrP/WBPen2G8OiE9NCMsadBBrMskVWsohTVjGE4eeRCSl+IJvl7Mox+76635D06frJmXILETd+VCxbG67Q5NFUT7N6R4QzBp7h7K8wkHs8QBaiAx6GoF4PN3KO8Q/Uxu5c4JCkcLTbBx/IctBXuKj1bP8h+Gay2qb8b7QEXKdRHc0Isqmie///IU6/tNHe9epuAYr8WVL0/jalkc5u/yeJ7A88QwJvcIemsuock4jv9KuI6xEW0ar1VC7AQULMIUqz9z2kg4sN9eE3eU0FY+eMSYgJSnHSA5av6t9iemA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5hzusVCfC0hMW+mRZ01vIshdf1XTGt3KIlNr3V9kfM=;
 b=Mpt85slZvWSkbZdrm/zE6NTLI8h06TgORQkLwSgBrXd+xQKDLet/oiL9xI08sASUzF+VAtV7sR4uLdlj2VpY7aJUL08fg4QOL7Am251nbKIWr9E1/a623r+33Za4jStaAF4bqYQWm7w5k8+u3HIJMGWVvHNxjvU6/+nFQeWQ+o5xZOmdRWFrxbSkTbJMRMb6p4mGQmhcJ546P27FPKfQTmJrGDAiA18wlP8l8t8Cj7P49zG6Xy//KVtgHPS2ty9X1KeTBcXvSNutLe6P0+6pcRD1KOe6Rs7rRZglEgjEkXBq897GrEwNhxL0Iq+VaLwxNrrYvhR7FUDfk8OoZPrfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5hzusVCfC0hMW+mRZ01vIshdf1XTGt3KIlNr3V9kfM=;
 b=T+ElyaP8PcqFI08SQIyRJwEt5nDVvJ38yDzB+SJeMKuJxnEKaVQA8kmSP1c70nGegUcSCPsUGagELJ6Z+aiuVDb+LSlkUB7M4RFCx5TaFXZcriqWqjB5ViygtsfjAwv01APnL0NSJxiYSOszNOE11pTc+xpFkWpZFGq3i6LHeSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <03c91d39-86af-43c4-a14f-c6514b778344@citrix.com>
Date: Fri, 6 Mar 2026 10:02:22 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] arm/gic: Optimize lr_mask type based on GIC version
To: "Halder, Ayan Kumar" <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <20260305195745.2595017-1-ayan.kumar.halder@amd.com>
 <4d81d177-f1ce-49e6-8a40-fd16c0b4e0b9@citrix.com>
 <a28b7631-f760-44d1-ae66-3f957e9b04b5@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a28b7631-f760-44d1-ae66-3f957e9b04b5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0075.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::8) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV9PR03MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c9f36b1-7463-4df6-9000-08de7b677843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	aPXok5+vfju6rsWsidpcO989lkNYcwJ6dXSJTAY+bkTujqFj7sTrvTZyqed9sSWE78NLQJ37xoLPReD4Jptnm0NTXac5GRm5zQz9URdDf2iNXr7MsqvIF7QiS0Jw9OvkuBrvepr0nSjZhJQrm1h4JdmAFvkaZVa/EWGnr1DkZXYrK/SQbzRuLHccvZax71l0EVCiYt/jC6z954Lru4ovR9cq/ec64THCCbVI1lUEQire70/Bzajdx3cEv6/Du9VOYL19otNupBADKbw61B7XgoyaIq5qLy6o8yZE0s8C+KIEVeG3hr8K7sVz+Jc5FmsmPDg44CI+bUDuZCzKXJvMpExFFr/l5O1tOYO27hiBfwl+eda4QVLUcJdAXlOYrLW02+SSGYvi16gDIaYXEVxORQYuM/7dVpDbjEpBxtUMmk6dZu60XPYGJnovmri676o++jtk2A35vjXcbJlvpZ7DORM4HwlzYe4qiR4hCaQgCvqFexSmavLmfEyc0YmVyseEqob7DC1Vv/3RRxp48p/GErAPRGYVriBy9SbyU8Oc4grsGb0GsEFm7qaFXo6rtNVLhXFIupoKTheFBPNhIkB165nSuGe9I/7EjcZYtQHT0XL7B5QfKEZNg4SE+HISr0ZnuA8hg/5hvnev4DP1Zk8RLjseQSE5pSBiwo5IjMONd/06gUPu7JZfpdABjZKK/YsyeIIMcdO/nvCHbDhdoEWA4V8oKAt9uUAAgfaPHL95MgA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWlaSERWall5MCt3Qmo5WnZQTHVCeUc4Njg0MGNMenpUREJPTFpxNURFeVFr?=
 =?utf-8?B?WWY4V3hyN0doek4xcGxjZ2R1cG1BVGVQV2xudmp4NlBQeVpzOVpxMDg0NzM5?=
 =?utf-8?B?Y0QrTkQwdUVoUWVLOGJVOFNkYzFhN2ZuOWE5ZDhpai9vTnFyNlpZZTMwZGpH?=
 =?utf-8?B?b3lJZHNjZUNGcmg1Zit6TG94Z0hzOFMwbEQ2djZnY3FtbUJ1dzZ5aHI0NVFi?=
 =?utf-8?B?b3hYbWdOOGZ1UWlqTnZFQlVWSEovS3JiSTV1VkVYVUdvdGwrK2xZd0JLaXZ5?=
 =?utf-8?B?dHhLcm5SYlliZTNLR3pLNTg3UVRWL1Z3aE9jdmVoTWZOT0lqbkxZUm9mMUVp?=
 =?utf-8?B?d2Zmdm9QRVRzbFpFN1hjRk4vdngvVTRSNFJxekJVSkMzcjUyTjlGMmdKTUdm?=
 =?utf-8?B?Z1lWUnM3bUJlVlRFL2luVXB6ZG4zNVZ3bGE1VUgrQWtOY1Azem1XaTdENDh4?=
 =?utf-8?B?eXVZeUNWTytLRUp2UDVIaXpGZGtGV0RKcFZkQ0hHRWZPUk9HR3VkWFZMaWJi?=
 =?utf-8?B?bHlCQjU3NVZsVmFuM1RlMytMbTZ0cDNycE5ka0k2SG5Uc0NIYVNnYmVWVko1?=
 =?utf-8?B?Q0VUc2NiSGVxalk0MTZ1eDU1S1F0bFlNSkJ2QXM2K3M0MDJ1ckw4b0VWM2E2?=
 =?utf-8?B?VEZNWFFmSFNaVlJwUnJXNG9aUng3T2xqMUsvY2o1ME5hTS9zRU5sQnRNNncw?=
 =?utf-8?B?ZWVwaWRuUFhRUk1nZjFJWlNpanVOTmVhQUZXeFNZY3JpRnlFY0RjQkZtSUF6?=
 =?utf-8?B?dCtjamdhQkJXbmZmTEx0TmJnbzlRZWhZamRPcDRLSmY4Q3REMjBHZm9NQ2Ro?=
 =?utf-8?B?ajk3Y0kwR0F1d21HSDdsbGQ3OVZxTk9UcWlqNVAzSldYOHJiQXU4Y2UwNG8r?=
 =?utf-8?B?TFhodGplazVFN2hCMUxQcXRlU1pkSkRJaERPTVJpY04rOGhQTXo4TVNyS0dH?=
 =?utf-8?B?UzR6R3dvM0xKVGZYbzNYZktyeWlRS09TYzVjMko5dFRMczZVNXhkM0F5aXg0?=
 =?utf-8?B?M3hqeFgwdExtQXhZZVhSUDJ5anE4aGhXSTRucDF1UDR3N0cwNnc5UlN2dlF5?=
 =?utf-8?B?dUJCWnp2V0RmOGcwY1NIbTNONHliQXVsQUZiQXczYi9oVXpIR2lRczE3T1FR?=
 =?utf-8?B?Z3J6TTJZNGdUSmxBbklLc1hPdHVMY0xlNWs1RGFNa3JOME9ETXNsUm05RnFi?=
 =?utf-8?B?SFhWTFhrK3orUGQ5S0JLR3lMTnBtcEVPdFNvSnJBTUpnSHFmZDg0K1lXcm5K?=
 =?utf-8?B?aGVXeXZBN2Rza1FtY2xHNlFTa2FqY2MrSWdDZ3lHYkFKUmQ1a2hGZHUvSnVm?=
 =?utf-8?B?TFk2cFlIdXQ0UEpyejVWOUxPOGdiMVd5SnJST1l5YXllclB3dks1M2RHSHVU?=
 =?utf-8?B?NHJNRlUxZlBXZ29zWlplQ0ozb3F6TFpIMDRXSDBLanpaNFBoYWRzeDlVZVBE?=
 =?utf-8?B?RmdpMmJZUlZDVlZJL3c2R0ZuMGNVSEZQSCthRURxNkQyL0JJdDNkRi9IYURG?=
 =?utf-8?B?UVBnV3ArZnpjZ3hhSWNqYUMwL2tqWWRLNVNTVzJwbFVUVldxejUwUkZIUGF4?=
 =?utf-8?B?UjV5RmNmcGdERzNTbUNtS29tSGhFUElLZytHODAwY3J0ckhKc1hOdHNvUkN5?=
 =?utf-8?B?TVBBdzVrSGZrUEdRT2licTNYQ3hKaEloM2VHSzNCUnorVlI0SW9QY3NaVzZw?=
 =?utf-8?B?UE41WkhaelJQQkJCOUkzSnA4QUMvSjFSMjJOMEMvOFA0c0hobEtvbE53a05z?=
 =?utf-8?B?T0NQa2RLOU9tdWJYUzYrdjJZS0FOblp2UEJ6eTA5TXZET1R3UUZvWk1nY3g0?=
 =?utf-8?B?L3U1V2t5WnRUSVAxTHB4dWhFckVuME9aelBwMDR5dk5HZGhNS3VHakk2Ykc1?=
 =?utf-8?B?ZGVsbU82ZmRLL3pjT2pGdFVxdXVPVm0ySmtQdjFUeVhzK2xxckM5K21SZUFK?=
 =?utf-8?B?ODdCZHZIRHpzTm9NaTJYRUt5NStPNm5vdFpkckdkUzV2czNPbVd3amUrRUlv?=
 =?utf-8?B?dWlpR0VoQXNtMEFqRkRzaGFMUzFJSDFmR0RDU3A1aHZzUk9EOHEyc2l6emxC?=
 =?utf-8?B?TTh3bjRZS3RyWGl3dmJ1Tnc2VFNYcXdTR1dNbFBuK21Ub2lNbi9UNXpIRGFB?=
 =?utf-8?B?M1dkeFRHTEtnUWliYitKN0FaZFdpdXlhS25oRGtXUmVobDVPR21PY1BZeStu?=
 =?utf-8?B?WFErMVhQSTNQZUhnZ1RQK1lGUHNkb0pOVHgvT01rWlJLalFINWpyY3NRYlQz?=
 =?utf-8?B?NU1xcGFwalNjcVNObDhmWDNqSTNGS0lsNXR6TFJtTVJ0MHRJYjBtMXFaYnRB?=
 =?utf-8?B?U21iMVg2TmJ0YkFJY0lwQ2VIYkRrLzJLUXdFMkFHS1VCWjNrU1Mwdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c9f36b1-7463-4df6-9000-08de7b677843
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:02:26.3661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HPPeqjwUpsb930aQ/lxv95JigdMnuihVkqegyRmRX7mHL89K87uXI6bSEGMc25SY2uwc70JBqrzVAmr4wh/C+bdnN4BOx3bt5VdCljlH3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8440
X-Rspamd-Queue-Id: E6F5621E5F7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:ayankuma@amd.com,m:ayan.kumar.halder@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 06/03/2026 9:59 am, Halder, Ayan Kumar wrote:
> Hi Andrew,
>
> On 05/03/2026 23:01, Andrew Cooper wrote:
>> On 05/03/2026 7:57 pm, Ayan Kumar Halder wrote:
>>> The lr_mask bitmap tracks which List Registers (LRs) are in use for
>>> virtual interrupt injection. Previously, lr_mask always used uint64_t
>>> (8 bytes) to support the maximum number of LRs across both GIC
>>> versions.
>>>
>>> However, GICv2 and GICv3 have different hardware limits:
>>> - GICv3: ICH_VTR_EL2[3:0] encodes LR count -> max 16 LRs (4 bits)
>>> - GICv2: GICH_VTR[5:0] encodes LR count -> max 64 LRs (6 bits)
>>>
>>> This patch introduces conditional compilation to optimize lr_mask size:
>>> - CONFIG_GICV3=y: Use uint16_t (2 bytes) - sufficient for 16 LRs
>>> - CONFIG_GICV3=n: Use uint64_t (8 bytes) - required for 64 LRs
>>>
>>> With this, parameter 'lr' in gicv3_ich_read_lr(), gicv3_ich_write_lr()
>>> cannot have a value > 15. Thus, it should not possible to hit the
>>> BUG() in the default case.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> What does this actually get you?
>>
>> Because it doesn't actually eliminate the BUG()s you reference.
>
> As lr is obtained from lr_mask, see the snippet from gic_find_unused_lr()
>
>         for_each_set_bit ( used_lr, *lr_mask )
>         {
>             struct gic_lr lr_val;
>
>             gic_hw_ops->read_lr(used_lr, &lr_val);
>             if ( lr_val.virq == p->irq )
>                 return used_lr;
>         }
>
> If lr_mask is 16 bits, then used_lr should not exceed 15. That is my
> thinking.

Sure, but what does that actually get you?

It doesn't get you a compiled difference.  It can't DCE the boundary checks.

So right now, it looks like it's complexity for no gain.

~Andrew

