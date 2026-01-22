Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD/NIOHncWkONAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:03:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D459F64299
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:03:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210534.1522181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqaz-0000of-KL; Thu, 22 Jan 2026 09:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210534.1522181; Thu, 22 Jan 2026 09:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqaz-0000m1-Gf; Thu, 22 Jan 2026 09:03:17 +0000
Received: by outflank-mailman (input) for mailman id 1210534;
 Thu, 22 Jan 2026 09:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=paBm=73=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viqax-0000ls-Qq
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:03:15 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e288429-f771-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 10:03:13 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SA1PR03MB6612.namprd03.prod.outlook.com (2603:10b6:806:1cb::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 09:03:09 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 09:03:09 +0000
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
X-Inumbo-ID: 2e288429-f771-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAM9SgQdpMJNGsi/A7/z9J6J0jblqrhlGBkVCgg75Wzk68ejr73WJgcofdEmsBfij7K54/CouYLRSWmuVXeECrrjYIji3GvqoFG8dTbLFUAep2YTFYW9GAOyuC3IUEHPT2qYugSB72aHGQoIPAawqKDeOyArtQAozWunJbL/DgGabdPuNWenTleHUimfLJHeoHuCF8Un41GvomaKgvTJlG5yAQYpwHncgM9AKefm3sphMYHwUj0y/O5qgd2+FgMlYErDWwC0r4lc+k4zL1Vk4lR9l+CZoXaALrgtOl/S+MOlGCreuEw6jCjydKLU9cOkN+HlAgk2r4c6HMOTnvX3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jnphzctb+7lIRKrxEX309Ls5U7f/H6HAe4WlzmKt08=;
 b=VK1NnD1203vaU6DBb8Vy+m7fcLmPnplnjnJwTwIF9t1uSxIcw4oQrV5q2EDEGR1IRWK+gWat1zbBS3KEYLO3mUV5GX6mltx9dkntFzxJGWRuHIy+l0u2C/bpUnSerf1nNOxtQAE4SUBKs9KIB/o9Y3aPcZ3/gRYZ+g+1rbZH9jOwf+Of25shm7mTxdfyEt8NVGZ8C4Kdxux1Y/CjEzJO9jQbKAxEv/GcV9/8Hj1GkFJZXwKLX2uvkIFdIhZ/qZ7AbKMFQ8cxJ898NuRfkSIFUyhQ2gkO+bIpY7HdGYVFZmHl4qUkATpiHm2ukPmYtalVHiTIeqlNmCVlYgpzW6ye6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jnphzctb+7lIRKrxEX309Ls5U7f/H6HAe4WlzmKt08=;
 b=pEc4GUWyDzbnVwfEWS+CMdDxRi211VzWW9rWL60Z7m6XEicZ0NVtc20ZuSCg3gCZuC0kRvlP8HgN5d3aTb3eQwDHDc3IpgU/R8HtbK/cJA7ZOkUhc0Km31fSXUxCKnrXy48KJnubKA9hmjIgQtu6AGk0QPheGeGx5Vow+fGclqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 22 Jan 2026 10:03:05 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 5/8] x86/HPET: drop "long timeout" handling from
 reprogram_hpet_evt_channel()
Message-ID: <aXHnybJfOmuyA3vK@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <54dbc592-93a6-47bb-9304-14addd41610f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54dbc592-93a6-47bb-9304-14addd41610f@suse.com>
X-ClientProxiedBy: MR1P264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::31) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SA1PR03MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: e6d0fe59-e9bf-44a1-d89c-08de59951037
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V285MGRBSGJuKzZ6SS9uMHgwRytOY01PT3N0a0FmOWNnMHBKZ1dMWmZSOFdU?=
 =?utf-8?B?WlozQ0ZOUmdrM0g1bFBOKzJXaEhzVjlOSlpzK3ZqckFuKzZXTXU4ZElnV2ps?=
 =?utf-8?B?QlpFbUlJOEhHKzFrUTgvem52OEZhMVZIVm1jWXJkWEtqVmZmb3AvQVpLRXRa?=
 =?utf-8?B?eWxva0JaY3RiVnRiNVMvRmZ3RURHd01YR1VOQUZPb3F1anlLQkZBaVZhWTlZ?=
 =?utf-8?B?RnAwZjloNEF2S3NXUEF0THVHUVRLWjFneHF6V0ZMdURjcG9pR242bGg2T2tP?=
 =?utf-8?B?WUw4RzVMMUJDcEdvbkI0V0dHZXlweUdvR09IWStPYStSV2FKTEt3RTZvcHlF?=
 =?utf-8?B?VlhwbzZaMzdDdXJsY2E1Y3lPRkdOVW9yWHI3VGxnWk9FYmZxeDh3NGY1VWpH?=
 =?utf-8?B?WEJZakdBSG1SZ2NDU1hpV1JjUVFsVTNTZXpQVm5SMzhrZ0NpZVNiT3c5OUxp?=
 =?utf-8?B?Yk5ZZU9Vdm1JaW12UzhQTG05MjlNTWh6Tml1SWRkWHNiRW9oRmZYSTN5WnNk?=
 =?utf-8?B?VmIwZ2gyVHJ0N1gyUUUzQlE1RUgycVNVeUFyRjVsSFJ3dEhMTlpZbDdBNmZ4?=
 =?utf-8?B?Y1BNb3VKVzBCelRSbERFWENNUVlBK3htS0dabFpDVGxGczZZOXhxbEMxbUtu?=
 =?utf-8?B?bEQzd1l3d2xhQVZwR1RhR3pEQlFicmlkclpUUE5qNklPeGNvOUxCUGRCWGx4?=
 =?utf-8?B?b2lUaXFpckRXZzVCd1IxTURhYy80OFUzNHI1Wlh6c1Jkb05MeGJ3Z25kVnE5?=
 =?utf-8?B?OW1hSVV0SENTQVlESDJlR0U0MTNxUnJyRUZZWDcxaWlrTk1RSTRHdGE4ckFo?=
 =?utf-8?B?WVdMaDJ2aXFyUVNWa3JxOTBBUEs5OHVFTWRwbUZtTmRaVEdqUU1KR3ZXWWgy?=
 =?utf-8?B?QjhsSER3OG14cUVqWkI0dk4xTFRML1JlYjhyT0JWRUc2eGR1QlRvMy9PakRx?=
 =?utf-8?B?byt4SkJ2ZWVTdlZ3RGdLU0hWR2doRXFZbWlMVFhJamkrRDlNMDdRelNUVUJr?=
 =?utf-8?B?dnNqdUt2ek5hYkNDb1R4YmNYN05iWEh4YUtMZGpJUGkyQ253YXhlVldiZU0x?=
 =?utf-8?B?SXpITFFZV201U3ZWMUlBT1RpSEN1b1JzOVdpWTZLOWRob1JQaEFyQlIvaGhH?=
 =?utf-8?B?ejE3YldxbytSV1R2d0p2MEhnS0hEcEIrNVMxcWJtQVVEV0VGaEZyaCt2TDlI?=
 =?utf-8?B?eHpFL1o5dmxoSUhoQitQY0Y0RFBTZHhrMTZ1eFZONGoxdVZNWm1UZlJEUTNG?=
 =?utf-8?B?d1N3MU1PYzltRHRhai91VGlaaFBzTDhRMCtPS1pWbnlCdGJrUXRGTlIwekRq?=
 =?utf-8?B?d05tTjBKRXN1azlXempMZzNJMG53RCsySFNJcFRhdTdjK2JwK1NrNHJHOFhE?=
 =?utf-8?B?amkzMit3eDFKTDZmOWhLWVBaUEtjcUtGTEhpT2ZFaW5sdHBSdGRlek9la0Nt?=
 =?utf-8?B?bXNuZ2Q2UWhuMjRuRWp0UnFhTU5XdE43QStRZHphSnFNdnoyRGRabDl5YlFy?=
 =?utf-8?B?VFpqQXlkQ2ZyZ3NHQVVSbWZSenRVWFRJMHBkZEYwQU4xd0R1R3R5NEhidjlq?=
 =?utf-8?B?TVJaQmxZTEVRRUFGbllVU1NOaThTaWtQUmUvMXBzNVllWUhSS09VZFRiTjFT?=
 =?utf-8?B?RWplUDhJUG1TY0hyM2p1K1VBY1hPSFJvUTJrMlluNXRLd1lrWG8zNjlXenM5?=
 =?utf-8?B?czZFdFprTTJGcDcrSnRkcHJWWXQ0L1ByaG1Kd2pvdDVMQVNmSFpmdGFxMjAy?=
 =?utf-8?B?dXVXaDgwMzhVYVVLNDc4RkJjNTdXSFY5V2U5QzlMS2NIWGdpb0tIT21HZlFs?=
 =?utf-8?B?eWZPK2d6SHVJUjFIMTJRNi9pRGVTRndZRVd5S2E0R2xIU1RjZ3NUNElJOWc0?=
 =?utf-8?B?M21wbmNNczBEWUdxZEdlVENubkRZZHF6QWljb1FEM2xmTnRrMUsweFVlb2or?=
 =?utf-8?B?QSt0NUxqOXozck1LTTF0SVpQWExtSlVPR2xTek1TMzNReElSMG1GTkV4aWpY?=
 =?utf-8?B?OU5LZDJUT0VhVEt2ZERFT2ZBRW1BQU9xU2Y1VDg3dng4OEZWL1FTZWFuVjkr?=
 =?utf-8?B?LzcxUSthTjJiSStwQzZxUXhrci9YRDJ4NXdwbTFBVmdJRnZSWXZIM3M0MmtZ?=
 =?utf-8?Q?HcSs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yis2Zm84S3dmcWpvcTI3NHdtOEZ2QmVHQzhmSUYwUHdXaG9PcHNjOElaZzZq?=
 =?utf-8?B?b1RkT2VqMVhIMjVEZmIrSThXL0dzSlBNYzdTZGN0WFlTVXZScTZIelp4YVFW?=
 =?utf-8?B?K2pCaUxMVnorYXNYRjdGWjN2UHRBekpZRlRCdmxyWEdUbXl1Zzl3TGdGR29O?=
 =?utf-8?B?dEtrZ2t5RFNVQzZqU0ZJbEgvUEZGK0pyTnFJeW5pNE9TeGtHdmpsbS9TbjZ1?=
 =?utf-8?B?UVUvbHl4Q2l5YjBXeVVORi9NVHlVdEpQWDljZkFYQWFDMlJLajBoU0xidUZP?=
 =?utf-8?B?MmNBUWFKTDR2WVB2cTBxeGNhcVNqLyt3eGhWVHZwTEcvOWplMEQxR3Vldldj?=
 =?utf-8?B?WFloclh6N0k3WmI1L0hObGIxcGR0cVM1U0xDVHRnQnVhSEhmQUFJUUZCQ00v?=
 =?utf-8?B?WVdUSTlQTHBFWTdtTGpKM1hMSWVudEtZMmJLVDVNbUs0c29qTjhuS1JnRTdB?=
 =?utf-8?B?MWQvZENuQXBSb0JUM21raW11dnNQL1F2S0lMT1g3NHhNUFBxZFlKUU8vdHM1?=
 =?utf-8?B?RUo1RmlxdUZGSnpmelQ5T0JwUHFEVHJabk1WMmx5clNGbUZrN1g0dlMwWUs1?=
 =?utf-8?B?UVRNcjQ0QjZ5K0RkSWpaTi94Q0JTdzJqd0V0cWJrQTBldSs1UFZUeTNIOHkw?=
 =?utf-8?B?ZjNTQ3oxUnVDb2hmL3BIaHAxRk54RFFSNVYweG1HWlBxNy9FeHk2eFo5MkZS?=
 =?utf-8?B?akhlUkY5ekcxUGVHV3Z2M1k2a0NLcG9YeDgzUW95Y2NUQjg1UHVXbU1zZUhz?=
 =?utf-8?B?Q3lZM0tIVVg1NUxNZ3hTTktSeEhBRjJiUGMvOFhlNWVGdFJXQW8xWEY3cmFl?=
 =?utf-8?B?QmFydVUvNER0cTJKNmoxc1BnamdkWm5kL0pNTkkxU3M4NHh4WFEydEFBQ1gy?=
 =?utf-8?B?UWRKWWoyWm5VNVgzMU1LM0kxNjBzcEQ4R3lKdHgyT3FRUVBVdFVGb1JDYzFm?=
 =?utf-8?B?a0RkTEppTFU1aUFKemIyWFJFRlBHcnAyMHBzUmRwTzJ5VzRxQktSQ0o0NVJ0?=
 =?utf-8?B?ZEhMSVpSZkZTNFEvSXRIVTJBMG9Xb3FRWlZiWXVYTFdmbE1HR0c2TVlKWm9M?=
 =?utf-8?B?UEdreGVmelBzdUtpTnVFSG1VWkR0SnVRWWlBc2VNTGpWaXptZnI1aFVHN3Fi?=
 =?utf-8?B?STdvd01uWGNEbE5ZQTd0VGtKL3ZLdmlsYk9mRENYM3JYZWt3RUgwM2hSTDl2?=
 =?utf-8?B?ZE8vT3hZNzJmSHpUMi9VbURaclRDTG8xS2xIZmVOMlhTaWkxVG03ZUVuSm9t?=
 =?utf-8?B?UHJWRjZ4cVErblJSbjFmTzN0NDl2SzNNTkJWU0V5Sjk2cmhTVjBKM25LVUpL?=
 =?utf-8?B?Q0wwbE1USXFidHp4Y0RjamxEUG4rRHNVOCtuYW5GOE5hcUhsdFF4QlNhS2JE?=
 =?utf-8?B?bjN1RVpna3VXRC9HUFNHTnBiVVZYdmVMMHVHTGxkUy9IdzB6aTZBcVRnRHNs?=
 =?utf-8?B?Qk8veHRpT1BMOG5FdklzbzNtYUhkR0NnN0Q2MlVDVkx0bkJucklCY0hlZGZz?=
 =?utf-8?B?M215Uk0rVk0vc1lkWklqK3o3RCsvYkpRUTdmeHJJQzRwYlA4SFF4UHpnSnJ1?=
 =?utf-8?B?d2FiSUhDdzhMcGhtRk9LTEtIbnQ1UWJoaXMxZE5aQTJIcHVXV21sM0lrSm9v?=
 =?utf-8?B?MDNvR2kyWTFTT3RaRXoyZTdqejFCc21aUlV3TTFTU2ZUcTlSSStCWjlZaVZx?=
 =?utf-8?B?N2xHcTZSaXRmOUZ3aUZmNEhscU9qWDFKd2pCaXpWQUZhbUNyZ3Y1aDFpbitF?=
 =?utf-8?B?ODA3QWVGYlBRTE90cG8wSU9HMW1wY2QrVXMrb2ZxdE5NRUZFRjhQaXF4VFIx?=
 =?utf-8?B?a2MwcDFZWGdpSGNZVEpQL2VPcnFvMTVxZG1LTEkxVWJ6Q3FrN0NZRTNDR2JV?=
 =?utf-8?B?czZ6VVgvQk5TUDg1WDBiZ1NERTNmaXlCeWhFcldkdGtSWSswZ2ZZQVhqZVFQ?=
 =?utf-8?B?M1I3RXYrZlN1TjB4VE5XOUI5cGtHckU5UWd3RnpzMk5NY3hwM1RJMUszbzlr?=
 =?utf-8?B?c0hkUWMzZUZPcXJ3RnRoMjBaUjdNNkIzREJsTCtxNVI5clRzMm5sN3lpVVpD?=
 =?utf-8?B?R2dZc1ducjF0ZFg5S0VVbzZtQkJkVWpjbGIwbGtvTFhoNDhUUXE5aGJkR09Q?=
 =?utf-8?B?NjBodXBCdjkxL2RhYWRoM1dzSEkzZ2VPbjhDVVJkczJ1NnUxN0ZJa1RXMjZu?=
 =?utf-8?B?Q0FpZDVmUGMwSmZybWVYRjF3V1R5emtnOVBGWjg2Ym5lbzBUbU0ya3VWYU1q?=
 =?utf-8?B?Qk1CbXFCRmRoaWdSOE44NXRuVmpYSGorUDUycEsxUzVIejJUYzZVSE9JeU95?=
 =?utf-8?B?Qnd1RFBVRGdHWWZ6TTFkdS85WVZJRThKZDgrV21kNEUwVE9QdU9PZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6d0fe59-e9bf-44a1-d89c-08de59951037
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 09:03:09.1479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cdlXjNkalCZnavuwhOboowEEAv6oUSuwSXskUmCZYTV6bcuhK8GEqtE1qYFRQddEx9XG+vu3QnMo236KZW3Clw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6612
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,Mac.lan:mid,citrix.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D459F64299
X-Rspamd-Action: no action

On Mon, Nov 17, 2025 at 03:39:03PM +0100, Jan Beulich wrote:
> Neither caller passes STIME_MAX, so (bogusly) handling the case isn't
> necessary.
> 
> "Bogusly" because with 32-bit counters, writing 0 means on average half
> the wrapping period until an interrupt would be raised, while of course
> in extreme cases an interrupt would be raised almost right away.
> 
> Amends: aa42fc0e9cd9 ("cpuidle: remove hpet access in hpet_broadcast_exit")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v3: Drop the code instead of adjusting it.
> 
> --- a/xen/arch/x86/hpet.c
> +++ b/xen/arch/x86/hpet.c
> @@ -162,13 +162,6 @@ static int reprogram_hpet_evt_channel(
>  
>      ch->next_event = expire;
>  
> -    if ( expire == STIME_MAX )
> -    {
> -        /* We assume it will take a long time for the timer to wrap. */
> -        hpet_write32(0, HPET_Tn_CMP(ch->idx));
> -        return 0;
> -    }

I wouldn't mind if you replaced this with an ASSERT(expire != STIME_MAX);

Thanks, Roger.

