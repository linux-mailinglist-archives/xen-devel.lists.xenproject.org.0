Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334EA9D0E84
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 11:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839236.1255058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCyzp-0006dl-Fd; Mon, 18 Nov 2024 10:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839236.1255058; Mon, 18 Nov 2024 10:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCyzp-0006ax-Cg; Mon, 18 Nov 2024 10:28:41 +0000
Received: by outflank-mailman (input) for mailman id 839236;
 Mon, 18 Nov 2024 10:28:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1K7B=SN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tCyzo-0006ap-0O
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 10:28:40 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2412::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd3d0a69-a597-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 11:28:35 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by MN2PR12MB4045.namprd12.prod.outlook.com (2603:10b6:208:1d6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Mon, 18 Nov
 2024 10:28:30 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 10:28:30 +0000
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
X-Inumbo-ID: dd3d0a69-a597-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjI2IiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImRkM2QwYTY5LWE1OTctMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTI1NzE1LjkwMDE3OSwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9esWYeMF02ZQQVAGN3Qla3ShK8E4aaWCaAPlZR3Zw5dRS0VTAP0RvdRbT5VD0QbP5dmfYFAP0Lke+E03XbuI5HjcE8cXTpvFSCqG/b162PhM7VLWBFRMADkAmZkQ3+KpSYeyDtjpKtgeJGp65hKME4cJUZ1qmpkDHiT97drtwo1lRA3PYjo6Nxbp6mvyW/V4UYSQhWP5kHPI2ioZDzNLimRThPS/GcPtQ0hCyUNE0jkO8EwgDy2hk/ilZol1/FxlksljehL8Z3oSvtLCZ+fppeDvLwU1fTumCb7JRlAEjPgVCUdC5W8CTIHMuH4X2HhKWSY6koonkfSDr/UtLqpbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqGvwZQ7+umrPK+0Vf2LsN3A3AWRRUWpNDEZg93tmL8=;
 b=DtBXHSZbMb1zUAER/NpGbiNXbs6P+hAfvXdkYnsDkJjclEXJaz/c1tJI5RIYdirZg7Ob8nYgy8nqLAx7lp44uqF8CEnbYgWMZPLYH9o7KoH/uMWq59x8gARWa6i0Ujo6bwlRufQTSvyCvbqlD2d8mE3D0iGnS+9a6On+oMJOWuUeofEg6Wperu6aVqr5qe8bGaF5SvLM6lRSBDVP1OlJ48bEHLPooZN4n2vjXHiOxuHh7hKx1eb8Uba/r4KOuTj57zFIxcoj7WL8LpJDEJOwy/wnPyXZvKH+7UBQYb/n1LCgIkKo7QJ0oHYYPx9BtP/2FCvTGIVOyYMVmsu+iT/bQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqGvwZQ7+umrPK+0Vf2LsN3A3AWRRUWpNDEZg93tmL8=;
 b=Id7ltdowU39sPHfBXuLXdjsh3q+qW5XQV7hukrJvWYQfqrmmyA+QzwXsV1rw8DhiZNH+f4TXSXmIdf+P0bQgurb4XQRyv8WdstqlBQxR3NqLqyIC8ch7IUQFOwRgfLMONNXUR0HMSMsmNFsYeXVjIERmtb3pEvJJo3eZrVzrjUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <bcf90dad-b9af-498a-be81-6288db5175ff@amd.com>
Date: Mon, 18 Nov 2024 10:28:25 +0000
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
 <22282f26-5c66-444b-b63a-d5442e6fcdad@amd.com>
 <04a358de-ed76-46b4-bc09-f3f343e09186@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <04a358de-ed76-46b4-bc09-f3f343e09186@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::16) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|MN2PR12MB4045:EE_
X-MS-Office365-Filtering-Correlation-Id: 41d80ea5-c326-4d48-fef1-08dd07bbbf17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1l2NDk2UHNvQzQwckwzZ3o2Z1V6Qi80TWVXZ1VJUHVmYlZUbWFPSzY2TFdl?=
 =?utf-8?B?QVhxaXYvNndnb2FTOTQ4NE8rVEtsYTJCOHpDV0VMZUZvL3FCR3ErdWJPUHJ1?=
 =?utf-8?B?bGkrWFhFSWhFV2dRUWRoVVlqUkhkaEdrOHhwTzJDdXltODJPZmpUd0lSd2Rp?=
 =?utf-8?B?TGZuMGJTOHEzQTViVWpINjVyRXhpZDlZcy9jZEtlQ2FDaFNFT3ROWXUvZkpw?=
 =?utf-8?B?Z0Z2WjhFdExKMUtBQnZDZFo3MjdRWjAxOE42SkprV29xWkdrclBGZUVXSHNn?=
 =?utf-8?B?bEpobHRRRmFJU2tIQ1hrS0luV0hRWjZSOTlBMmt2QU9ETTZIM0MveGhDaXVq?=
 =?utf-8?B?d2htbFBxbTUxbUNSNnJ1QjA3cVVzaGN3em1SR1B3Q0pLLzU0MnFyWmhXRUFq?=
 =?utf-8?B?dGhDQzJMdGIxd3JSaHpaTXdHVDNmNVhQa2xCL3gvRHRxa0s0N1V5TEF3RERk?=
 =?utf-8?B?alZhUGxUZWhsc1VrbTdmSit0OGJmc2RNVkFjUFRJT2cyVjhtU2RKR3NiK3R2?=
 =?utf-8?B?T3VDaTQ2TllUc3lnbk1sQ0x3YlpiV1Q2SUNCOGIxZ2pKck1NajhGTmNINkc0?=
 =?utf-8?B?cG9nNElkMnBBMC9qVkFkNFVSYldmOC8wWm1OVXBmMEt0WVArS1lmekJyOGU5?=
 =?utf-8?B?RDFHOHFicGJLZHk5bWJnbEtpU0pDVStlQlgyZGpLbEpjVmF2Ykx6ditnYmcw?=
 =?utf-8?B?NWNsN2FJRFNDSzZ6ZiszekJoWDNqSnNsUm5jaUtUcGxwSlRCdnhQYlNBanZO?=
 =?utf-8?B?NHY2cWZSUlJDVTRqQzF4MnB5N3haTVVoTXNLQ3BmcXVUY2FWNE1MSUZzZzBY?=
 =?utf-8?B?cVk0R3Roa0lsRU1wMnJ6V3VDRzVTOVRaaU5ldkQ5NDEwTEJ1L2RVYnpJZHV5?=
 =?utf-8?B?Um93dU1JSTNvdDE1Z3B2azdueDZoZVVoclFjckR3djZQK1dlU2U1THhjUGli?=
 =?utf-8?B?bGxxMWR5Q2NrOXdVNnArM0dpbGtzUkYySDBJQkJBMUJWWG5nTy9wL0U5TmRj?=
 =?utf-8?B?TFRqVGh4czVEZlplRER0QXZ5MzluelRGNW5Vc3drcEtzdkhtRTZuVEk5aGtK?=
 =?utf-8?B?MUxHSzVNODhLWlJmVThVc1hsRG4zN05zM2tYL0M1MFovUjJHWVEzNSt6SFly?=
 =?utf-8?B?SmNhb3o1cmdPL1NBOVFIT1Z5Mk9XRS9Hb0EyNWtEZjJlTkZCWnplL0lobS8x?=
 =?utf-8?B?QzZLNWZNaFB2NWZzMkhGN3NuT0tQRlF6VTI1RGNGSEYxNjBrMGRVLzJRcGFW?=
 =?utf-8?B?RzBFNUQzM3FxZ01MaWRhcEwrYzVpTVlTSjF6RlBDR25Kdk1GYm9oMDVpSlRV?=
 =?utf-8?B?UVdGU3ZlSVN1UjhtbjU3ZGtoZHY2V3FYR3JsR1F0NnFtVHRzWmM4L09Rd3ZP?=
 =?utf-8?B?M21QV1lxNnpNWWNtdkY0TkFsMFVoSTVVcG1QSmpQVnFTUzJ3VzFDMGc4T0Iw?=
 =?utf-8?B?SDNRenBuTTNORWc2Z251N25xbXlRS2ZiWGdsREVQVEMvYU9LQ1IwSytrMnNv?=
 =?utf-8?B?azJYQ1cxT0pRUG1PWjZTaENXdEtJK3pUODQxNi94elZxSFl1R1NFQXhJZDlx?=
 =?utf-8?B?dFVwYjhtWDNKc2dmVFFuRlpVcHhKVWNjR256S1Zsa2Zab2x4cjV2R1Y5dEZX?=
 =?utf-8?B?S3RLWjNKcEZteHhsd0gxNzVvNWlYdmlMQXZDY3pvWnVkOFYxOVcySnNTS3Ex?=
 =?utf-8?B?ZzJvcVNnTmdReFNJY2FXamwxYTJCMkdSbGlaZVpVUFZEQzNJK3lHeGRSL3Zu?=
 =?utf-8?Q?edp4FLkugNVlYgBa97zUTOUMQtqxT2EQlWVuWhr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjlSVUhjYWV1bU9ZZC9hUGUwcWpqSEYwQVRSOFFUcmYyZ3hBc2hFc0xQYzVj?=
 =?utf-8?B?YnFoL2d3R1ZWd1FxWGpkMWdtcWRPYzVLMGlCMkp1WDM5c0hZUlpVN1pZdjk1?=
 =?utf-8?B?eTkvcmNaNm9ETWFibGFjck85Z2dIbkxwemY5RW8xdjlHeHpGSjEvV2JRYkc2?=
 =?utf-8?B?TlBPZXJDN0c5emk5RVdocUJwVFdwZEJtcEYxZE1BbUt0OGJyNUVJdTdUTm9H?=
 =?utf-8?B?WWhOZzgxYXZId05nQ1pvVzBGZHMwQUE2UHN4TVE2NjZsNGV2enBzWGVBeGQv?=
 =?utf-8?B?eVYwS2ZmdXIwZmZ3OGFEYzlhWUhHQzZYbGc1akZrRlRsMDBHSG5jNWpEc0Jt?=
 =?utf-8?B?UTQ4VkJEWk1PMWRBRXhKcVJUbG5WQ0xJOW1JQ0RhNW51d1lNc240S0MweEpH?=
 =?utf-8?B?cGpJT05zSDExWG9nMDd6aTRzR2FDeml4bkVSVDVUVkp1R2hQOExaaHl2bjdO?=
 =?utf-8?B?aXVJZmhHQVVxL1NEUlcvaWEzSEFzYVRjaitpT3NGemFrZEdRY2tDbk1rcW9Y?=
 =?utf-8?B?RnlxbWlRYWhHZDA1Ukt6c1o1T0RxLzZmTllJVXJ5NzBlVnJpSjUwZXJsdjNq?=
 =?utf-8?B?d2ZzYzZnUVQ4cmtRclRZS3N4V2VTeW56NTJWYmo1SUE2cFFTZGpDeTVFK3Ri?=
 =?utf-8?B?bzhsVjA3S3QrWVkzdkNXMXJpbVlJckcwaXEzMy9lcUxodFJhRjZWVVNINHZq?=
 =?utf-8?B?czZaa1AwL2wycmVpZlVtR3IxY1lyU1pyQjVFTC92L2ZiQTE5K0VPMTZPdGU1?=
 =?utf-8?B?Y0l6dkU3bU5jV1BLUHBoZ0pHTTlvWVg5QmZqVlQzb3M5aG9wN05jU1RXVUdq?=
 =?utf-8?B?YnY0emVLV2VCWkFiZW9SRnlIWHlvSUJTdWdHb1Voa3JDcWF3UU51Y2FJNEVN?=
 =?utf-8?B?Z1BSd2w5VGtZVjdKTzM3N0xFMk50eXRHSENFa2VEalV2TmV3bWFNL3JPWmhm?=
 =?utf-8?B?Vk0vd0VuNVdad21zK0h5Wml4VW9OdGpxQTJERGxXaHZxMzNjV0NzK1FUQkVr?=
 =?utf-8?B?b0xIcjVZd09VeGFzK0dpKzArOUdlLzN6djA5MmE2d0Z1VkZIbk9BOGZ3VmI5?=
 =?utf-8?B?ZTFEMEowZUxPSDlhcmNIdGlDRS9FRXZnM0N1ZEZjeVljTDVNVC9QM3hEWERv?=
 =?utf-8?B?eXd4bDduNWRUSHcxMDZteWR5WFVja0tXL2JIUTFDRGF5SFNoSFZObVhZMFEr?=
 =?utf-8?B?L3NXOUx0U1FEY1BpVDAzS3VVVlFGNG9nN1ZJRUQxZjdITmplbUU1Ynl5ckZV?=
 =?utf-8?B?aitmVDN6SXRRUGdSWng4cTJBSUlTcy9QWFU3Z1RtTGhuNUllNUpQVktVaHl4?=
 =?utf-8?B?RGI2blZMS2wzeGZLS2ZWclBycnQyaWJESHlIYVY5NStrNHNmRmZrRGlVK0I5?=
 =?utf-8?B?eWtGTkdXTVd5R0REQ0d3bXN1TFdyMGVDSnA4YXJzbVo2TVJiVjlhL1EvU1Vt?=
 =?utf-8?B?ME9reVBwUFhyUFZzY01JRDBKVTcrZVIvMUxSWXpCNVNzelc1MFRpZmNwZDI2?=
 =?utf-8?B?dDNFWGlSbEozZ0ttMEhXN296eEpLL0VsMjU1cWx0T0RnemlnL3N5SWpIaVhY?=
 =?utf-8?B?T0RDOGk5bWM3VFBzeU5YVkZzWW8zeEJzaUR2QUw2UVhSZ0p0YjZhSFFPM3Y0?=
 =?utf-8?B?N2tlSENZZG82Vlh0Sk16OG1mTkNOb3BRa2VuRTRERVpKcDBEMitmZDRBM3hJ?=
 =?utf-8?B?YlNjY0diYkdtQUkzUzN1Y2w5RlFTamNDZzBOMis4UmpvWlR6OENFcE5SeFhD?=
 =?utf-8?B?M2RiSFBUSWZKdzR3YTMvUFhvODQycjk0MFltaFlycE1kYmRyb2x6NTRiemk4?=
 =?utf-8?B?UkNmWUkyNi81THBNMnV5QkU3Vmo4UlRib3VZUlB4WDJBdmVhZitvSkNLZjRh?=
 =?utf-8?B?VXZWUG5ZbDAxUWNtRkJYSk0rTFJ0ZTRGM3NoZnJwMUxNVjRjUnV0NWRNdzZh?=
 =?utf-8?B?aHVlVTVkeDFQRisyOTcvRXdmWFpBci9rZUZDemlCV1RncWhXSFlDa2ZZVTV2?=
 =?utf-8?B?TTRYZjRGUjhXb1hlSWdiZnkvWHYxd1FwRTJYN1dYNmtaTXduWGxZTlRjMG5M?=
 =?utf-8?B?eVRObThUdnZubm9MU056V2NRYU5LZXZabHltMzkvTzZYRXVYcERmclIzelZn?=
 =?utf-8?Q?WlzEd47cpXJbHgvZAsYSgY51C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41d80ea5-c326-4d48-fef1-08dd07bbbf17
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 10:28:30.4380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f58/GswhQAUJnnzp5steevXCHLocUKotfFXZQ6SFb7svvfq0nqlV8R/3VGIZGDg8sE5VNaPCMDVGWK9KHmuyUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4045


On 16/11/2024 09:57, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 15/11/2024 18:53, Ayan Kumar Halder wrote:
>>>> +Assign vCPUs from CPU pool
>>>> +--------------------------
>>>> +
>>>> +`XenSwdgn~arm64_assign_vcpus_cpu_pool~1`
>>>> +
>>>> +Description:
>>>> +Xen shall assign vCPUs to a domain from a CPU pool.
>>>
>>> Same remark about the wording. You create a domain with N vCPUs and 
>>> *assign* a CPU pool to a domain. 
>>
>> Ok, so all the previous 3 requirements can be merged into
>>
>> Xen shall create a domain with N vCPUs and assign a CPU pool to a 
>> domain.
>>
>> Or
>>
>> Xen shall create a domain with N vCPUs.
>
> I think this one is better because it is not mandatory for the user to 
> select a CPU pool and you will have it ...
Ok, I will keep this.
>
>>
>> (which of the two looks better to you if we keep the next requirement ?)
>
> ... by the next one.
>
>>
>> Comments:
>>
>> Here N is determined by the device tree configuration provided by the 
>> user.
>>
>>> You also assign pCPU to a CPU pool.
>>>
>>> But I am not sure about if this requirement is actually necessary 
>>> given ...
>>>
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~static_domains_configuration~1`
>>>> +
>>>> +Specify CPU pool scheduler
>>>> +--------------------------
>>>> +
>>>> +`XenSwdgn~arm64_specify_cpu_pool_scheduler~1`
>>>> +
>>>> +Description:
>>>> +Xen shall assign a CPU pool scheduler to a domain.
>>>
>>> ... you have th is one.
>> So, we can keep it as it is.
>>>
>>>> +
>>>> +Rationale:
>>>> +
>>>> +Comments:
>>>> +
>>>> +Covers:
>>>> + - `XenProd~static_domains_configuration~1`
>>>> +
>>>> +Assign virtual UART
>>>> +-------------------
>>>> +
>>>> +`XenSwdgn~arm64_assign_virtual_uart~1`
>>>> +
>>>> +Description:
>>>> +Xen shall assign a virtual UART to a domain.
>>>
>>> Are we talking about the virtual PL011 or the fake emulation of the 
>>> real UART we do?
>> virtual PL011.
>
> Is it possible to specify it in the market requirements?

We are talking about Xen's ability to **specify** virtual PL011 to a domain.

So, it should be a part of design requirement. Please see further ...

>
> [...]
>
>>>> +
>>>> +Static VM definition
>>>> +--------------------
>>>> +
>>>> +`XenMkt~static_vm_definition~1`
>>>> +
>>>> +Description:
>>>> +Xen shall support specifying resources for a domain.
>>>
>>> Compare to the other requirements, this is quite a vague. Should we 
>>> list the resources?
>>
>> The list of resources depends on what the user has provided in the 
>> device tree configuration.
>>
>> But the requirement is correct as it is. Xen allows direct assignment 
>> of devices to domains (ie passthrough).
>>
>> How do you want to write it ?
>
> This is probably a better question for Bertrand. I don't know how 
> market requirements are usually described. I was making a comparison 
> with the other where you explicitely listed the expected resources 
> (e.g. CPU, Memory, device).

In this case, the market requirement is "Xen shall support *specifying* 
resources for a domain".

Here, it doesn't really matter what the resources are. What matters, is 
Xen's ability to specify resources for creating a domain.

Now, if you look at the design requirements, we say Xen shall support 
specifying uImage, zImage, vpl011, ramdisk, no of spis, etc. So these 
are the resources that can be specified.

Tomorrow, we can add more resources which will imply that new design 
requirements will be created/modified. However, the market requirement 
stays the same.

Please let me know if it makes sense ?

- Ayan

