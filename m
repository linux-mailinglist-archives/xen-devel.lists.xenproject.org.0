Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F589CDE52
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 13:37:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837468.1253398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvZC-00011T-Cv; Fri, 15 Nov 2024 12:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837468.1253398; Fri, 15 Nov 2024 12:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBvZC-0000zv-9F; Fri, 15 Nov 2024 12:36:50 +0000
Received: by outflank-mailman (input) for mailman id 837468;
 Fri, 15 Nov 2024 12:36:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QP11=SK=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1tBvZA-0000zh-Mi
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 12:36:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2614::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46711e65-a34e-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 13:36:46 +0100 (CET)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PR3PR03MB6379.eurprd03.prod.outlook.com (2603:10a6:102:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Fri, 15 Nov
 2024 12:36:43 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.8137.018; Fri, 15 Nov 2024
 12:36:42 +0000
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
X-Inumbo-ID: 46711e65-a34e-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjJkIiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ2NzExZTY1LWEzNGUtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjc0MjA2LjAzNzMyMiwic2VuZGVyIjoic2VyZ2l5X2tpYnJpa0BlcGFtLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCbVUUgmeC+pEHkekeydAR2gNUUjPhTM3ckQ92l8F4acIXcHeAI+9BDDDVFvXYdBfwq6jTQ221GFKk6YDSCaudERYH4Em6aDnyYeeOctN/4nCm6ntpHhlI14ROVh8s6IvnJ9MXRXv3/k0cOamiMrXIo6S6EiYJICqeA2IkqeiFezifbw2jXieQ+7qZbgdflPAqvfYbgTh1XBg4XAOsnQrzAHy4r9C2ERWFxqmVpQ3IwH9Asy0y5xvHS2JjHSLlEwZoeHPgE0Yatdq3tZesUf/vZ8T9WeXrm/ptloYWkX/98k7u35RZeCzB8eFtV7xxw3KFabTCAgptC1LQlaTC7qfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DASaRIAJVrZrvn/Z6uAd7V1+6ZMQnN/Vqe9U0sm36n8=;
 b=pWcGrtUAL+GZ6YbegfOPun02xHGFy1ECqzT62HHvUjauytHsadx9wZE+9mj+R0ipO98Pk0aNFlSNK6Wj6LY6pSkSl8ROs9WTgQybq8/pwAOMKYsgW1QoPx+vOHxoHlVuC097u4LF2Zze61bW9txcZrLRZCwGInT9AWF8r1/FImkTWLY4qhri5RoCmK7Q58n7JnphIoTGCySDe7Dfk74nHaEuU1Uafu/cFJIWQHVUqSNcLG/rni2ig1ga0lSUgAsPi0iW2jj/fCGA5FPXMvNu1BI1MyJWXzqBvCgHq04qNf3xO2IO0OuFhVW8uBv6LmBKVOjeQi1KqfwL4fQ9R+rCeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DASaRIAJVrZrvn/Z6uAd7V1+6ZMQnN/Vqe9U0sm36n8=;
 b=W7XepZiwbID7ucraK3ErIF2MXiZfJwmwXqSHbIj1iGA1wXhfAC04KwWMVN1DPF1shcdnZCbrhMg1c+/q96A+eBmfPI3C0C5yVznu8qaDCuv0/C2XkL6DiB5Clp61l7ET0HCJ0xeiIEtFCpYBiCQK1geeRDdFvd4rkfSUVI0K0B0ZsdNLShHnW5l9zxARJ8SDfjiki/lz6cGm3bzY398Zx3ED/d96YzXjoGvOXVJwmh3F+fa5V3226EWE0aJQHgvbUEj5KOUIhMVv8NW1eFk53BCIJq+R/hYSMalGH7+DAON/qpOF3Ygf0/5DelVNKDw2e9S9p8IUSQf14OEP5bSBrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <2285d21d-25e7-4682-aed9-1f569ff7d6d2@epam.com>
Date: Fri, 15 Nov 2024 14:36:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/2] x86/hvm: introduce config option for ACPI PM
 timer
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1730887415.git.Sergiy_Kibrik@epam.com>
 <da2758bba96e247027106e13129c87ae31193e97.1730887415.git.Sergiy_Kibrik@epam.com>
 <34a2d071-59a8-46eb-a9fd-516cce801343@suse.com>
 <505e0790-10b9-4468-994b-1a3890eaef46@epam.com>
 <c565ae31-26a3-405a-b4a3-191be95b38ce@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <c565ae31-26a3-405a-b4a3-191be95b38ce@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0367.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::18) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PR3PR03MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c34037-5a0c-4d78-c183-08dd057228e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDJGcFgrMzdzR1ZrNDZXNENTcDlOQTBBNE5WckJ5VlNaUncxRDBTTGRtRGRo?=
 =?utf-8?B?Yk5mUDJUR1d1WVVtSFlYTURWcXFNV3BGUFJlbFJaempYSWNJSjhHUHE1UWdz?=
 =?utf-8?B?SkUrNzNlMUdPeGt5TU90Mmg1a2RwanF6MjNIOFI4VXJVNENDTm5aV1lJeU8z?=
 =?utf-8?B?TE5nZVAxbEpxY1ZpMklXSHFLM2lwbXBYU3AzMU1SaDUydjhwNERWd0YrLzBn?=
 =?utf-8?B?OU1KYWNCaC9OWi96NWt3V2x4K1dSVnhqSENZdlVQSnBHbXlqb2hwMHF1eEJG?=
 =?utf-8?B?czNPMzc4Rm1jY1FNeWE0dnhFeFltK28zZjQybndnRHZTa0RodnVhMHd4dzFL?=
 =?utf-8?B?Q01WSjU1TGFQRzRJUkZ5Rk10TzdGendaYmYxVTJBQVkxVTNJczV4Nldzc2FH?=
 =?utf-8?B?T3NFMnRMbWErRGQvdFovK1BXSVdYZ0JreEgxcXF5WEFNOXFkRjFKQ3A0c3VC?=
 =?utf-8?B?eExpUlpzVEt1dFJHbDNJa1p1SmJseVIvU1hBR0pZUG9wOFBaSldJZ2Z4YVdD?=
 =?utf-8?B?bEJMeGYwWnByYXZXWUVPdmV5T1BJMWl0YzVMN0tOZWxMSW0zWTNPSlpOdmVC?=
 =?utf-8?B?TlA5a1o5eDlrdjllTDhoaU9VekNWS1FSdlJ6TnF0bXVkWDE1TjJ5TmZLVXN6?=
 =?utf-8?B?VXltNGFHTk45UXRpb09UNmp0RTdxK3VUUUdxZmFOVlBIbzFaSlplckVmTG9n?=
 =?utf-8?B?c1FrdUloZEMrbk5QTWRqQVlESzJyM0V3SGJMMEU0ZXRpSWNPUkFIY2pndzVY?=
 =?utf-8?B?bElNMVNqQjhXRll3ckh3aUVoVGs3QXFhUFBaeS92K0hReGV5ZGxoL1Fkby85?=
 =?utf-8?B?bTdyTVIzYndmMnorMDdvUGJKcVd4Rm1xd2tZNzRpQzgrMVZVamhxZHpTZjRt?=
 =?utf-8?B?OTRGMXBHdndUV0NpRG05S2krand4d0RNM0YvckhPYW9Oa1RJT2FUZndXRlg4?=
 =?utf-8?B?U0xSaXBscjl1cG50azI2NzZTRmhKbnpjaGpMMnY2T3YvSHFjU3ZsMkR0dVhv?=
 =?utf-8?B?ekZ2RC9YNWV5TEJldzZ1M0dTaDE3YjYrOFlvZGloV1ZKcTg4NlFPOUJoSFZ4?=
 =?utf-8?B?Rk9sd2NzTGVaeFYzOXN4eUtHQXY4ZCtQR1UvcHhUNWE3TkJqQUVIRmIyUUxD?=
 =?utf-8?B?bS9FV0o2UUtBRElRNk0zdnI2Qi9FSTBsc2lVOHJ0TVZZMW1nRExlRHFzbUQr?=
 =?utf-8?B?N1YySXRZRTFoMGs5clZ6ZTlraUdxa0V1blQxUGJwU2NQRHY3eXpUZkNVS0JW?=
 =?utf-8?B?SFQ3aklIdWlxVGhTbTBJMVVkZHBzVGI4a1V0Z05RdEtmTUJwN0pzQkdSZTg1?=
 =?utf-8?B?ejZ1Z3dqYW53bWlBd1hwZ2tQejlGZ1JicGo1cExWT0dEdDFxeFZZTXdBWFZT?=
 =?utf-8?B?bTJ2VUdPNTdWWnptRU1XVHJWdE11bGx2L3NGZHYzY01LSGZNSVMzbE9WUkcy?=
 =?utf-8?B?R3VZNzJwQW5Rc1RReVJJcktVVG5lRURDd1dKTG1QQ1dnZ1YxTlAvbnVkYUZH?=
 =?utf-8?B?K0N2Q0gyalVid09YR1hPR0N4TlorVHJzb1BRa3Nzb3FzblVoTTRDZWpnUEFz?=
 =?utf-8?B?c0g3YmZmTWpqL1l1Sy83aWJtOTd1bkpYV0ViVTR4WkpWZmJMVTBoSnlrTHl2?=
 =?utf-8?B?N2ZEWitsYTdhb1BzZjB4TnEwVnVLOXIzRmlwZElhem1vTDJkS2d3dHVnOGxS?=
 =?utf-8?B?SERqZndaS2xsbFcwUUZZbm9xOGpDdXkrckFFSndYbVh3WmErMno4MUxyT2ZH?=
 =?utf-8?Q?7vWIHAw1uuYaKK9olrrA4mTGLL4PbRIMgNMpA/n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFRBRWVsbWZjU3c2cWpFcEZOUlNsQXJXczZLd250cG9ZbGY1Yi9TbVBTRElK?=
 =?utf-8?B?dm5Wc0c2bmI0NEU5ODlwNTdKMldFeDQrdlpITWMwbGhIdXUvZkJkVCsydFdp?=
 =?utf-8?B?NUxMYXU4aWhjQXJqdndIK0xNUWVzNnBCNXZQVEIxa1Rpd3Foazc3alNlZ2wz?=
 =?utf-8?B?N0Q4Tk1KcHprYlhVRUsreDUxV25STFlCUTN2NlRlMUpkMEUxOGNINm1FT1dl?=
 =?utf-8?B?OGZnMVhZY3JzQU5nYnhneXptOWRkR0FLWGtmdnZUaCtVb0NZdmFLRnZ0a0R6?=
 =?utf-8?B?RmhhNnJqc1BkQmcwMkF6NldzU2hXSjhpU0RvbmlqSlRpQk94TUx4UjB5R3F3?=
 =?utf-8?B?SDhnWHJOWUt4aHNZdDRqdFBIZFlQYitwQjJiTE52MUNpVDdxNlBUaTkxcjFZ?=
 =?utf-8?B?TFQwblpPbTFqOW01bU5TdTdlS1pmWEEwbmEwcnlzRStqTjc5K2V1MlpuSHpW?=
 =?utf-8?B?N2UySkRrT1I1TG1TQUI1THN4L2dwRmVtVTJMVzE5OHFqL3BYOHpIaUxBN2Q4?=
 =?utf-8?B?R1YvRzBLRm5qRFRRdnREQjh6U0FueWlTb1NMbDNRZ0FqbUowUDBkLzBEODJJ?=
 =?utf-8?B?SXc2c3FyU2U2UC9Obk5tU0NqdzVmZWpBeGFkN1VjQ1Bpd3Yzc3ZoSVR1SW9j?=
 =?utf-8?B?SnFIOU01WXdxN29OWUx1dUJiaVhXUHNTNDJxQlBJS2ZLL3hnbzJENWJLRm9y?=
 =?utf-8?B?aDNYTm9wSlBEVzdnSVRUanVxVGxFQ2w1Z2JGMkJldng2anRheThLL2t3emdC?=
 =?utf-8?B?YmNCdUJkeWIrWXk2bDkyTUxGUk9nYUliRlB5aUxKTUdEVUZJa3BOdTBMMVZr?=
 =?utf-8?B?bnIzWXczZzVCTDFETllEU3FLUFZaMHAyYUJUTmRuMWN4aWZuNXc1U08rc1VL?=
 =?utf-8?B?QmFyTzNGQVNxVVc0Z0V4Q3dPUG1tYWFBTGNNQnVLKzlvMk52dmJUanBpTTJo?=
 =?utf-8?B?cmxleTFxSnZXa1o3RUFheXV4NktUTDhxQ3hYTlU0d2YzK2tNQnNtZERyUHV4?=
 =?utf-8?B?V1p0YkErWGFCcDVzMGdCVXlqeUU1ZXJ0RS9qbWUxcm1tbGlqSFRUOTRsM0Uy?=
 =?utf-8?B?bUhROHIzZ05sbXVJQTY0WWtkZWRoNmVXWkJnRkxvNVVsWHI1cWkyZktLVlJa?=
 =?utf-8?B?bWJFK1FBSE52aGFnNXgza0FDUEc4VWtMMklNQ284dVhreFA1L0NiVml4R3ZC?=
 =?utf-8?B?endWR1VwS3hjWFhtNU1lbCtwaGttSGdaaitJUk9uT2NEOXdrY1JDWFJiQ0sw?=
 =?utf-8?B?UGxOM3VLUzZ4MUpGK0JEcy9qMmZKVkxDdnoxQmdGN3VaSWNURGVONnh4bVBH?=
 =?utf-8?B?Zk9vczFscjZ1eDVUYjJBR00vWUNIUzBZWlRLZ1hqOEZzQjJxQUlYNVozYUJH?=
 =?utf-8?B?Z081SUwvYzhwYVFhUmVKNWh4RHoydloydG5xT3hZL3YrOVVjZmZ4Wlg4REs2?=
 =?utf-8?B?L1MyQTBxMlRtdm0yUTJsczR2Tm5zZEtnakl6S3Y5MUx0SWxHNTdWekZySCtO?=
 =?utf-8?B?U2tzNmk5cWhqWGFrOHRYOWUvQk0zRzluM3FqdDUxMmpEYXNCSEJveVhMTVdQ?=
 =?utf-8?B?dHNKZitnaG53eTg0UnhnT1oxUHRNL21lOTI1UHlsNkZ0bnFkOUowRlI5Ymdu?=
 =?utf-8?B?cW12MVU4cnIvOXB0S0Y4RTgvTUg0OUY4RXp6dk43dzhaR1ZyUkR5SURVSlBy?=
 =?utf-8?B?SzJmWmxidjl2bFdQV21YUXU4ZHVCcnNFL2N2VXQrYklHTTlFRHFsaWl6UlBp?=
 =?utf-8?B?SG1zaG9GWUNKYmgzcldhZjdZbkdTWk53NmQyWmlVaVhLcG80eTRjdFFlV1la?=
 =?utf-8?B?aXBJUi9FTTFzSCtyU09mWWlLQ1Q4ajlHcWtmSTFTU0Z0OU1JS2YwSTIvOUN2?=
 =?utf-8?B?QnZ0MXVQd28xcTllV2o1SWtzQ2ZsL1p1TThyMGNJZk5FYWtWTFNSUTB0a2g1?=
 =?utf-8?B?aDhFTWtDLy9yNERFbmRIOE4vU29KVVlFNUZ6SVp2YWRubG05MDY1ZVpxSW1K?=
 =?utf-8?B?RkNyVGJmbXdDSUpUc24vSWpyTlJxTDFtVEdmeVpsQ3RxdnRZZ2RPK2QwRWhW?=
 =?utf-8?B?cWEyM1NWc0hHZjNZcFo5QzRDTURtSkxHMUw4a0JlcUtZMFBIMFJOS3d5ZlFp?=
 =?utf-8?B?eTFvWTZiTm1zOFhCbWRKVzNBN1dFZWJibFY3ejBnakhpdEJ4aVF2eGg3MGpK?=
 =?utf-8?B?NkE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c34037-5a0c-4d78-c183-08dd057228e4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 12:36:42.8572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bo5PRsvnYETtLQmsgxwPPg8S1/CoVTF0YDFWWoSgYDggM2LayZX8Mf5NXSzMaI4qyXPtbOcfMY0Z3m+S8mtcPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6379

11.11.24 14:05, Jan Beulich:
[..]>>> What exactly was it that Roger suggested? I don't think it was 
what the patch
>>> does overall, but just _how_ it is being done? That makes quite a bit of a
>>> difference, as the former could be read as kind of an implicit ack to what is
>>> being done here (and also in the other patch). Issue is: I remain unconvinced
>>> that this conditionalizing is actually something we really want/need.
>>
>> about a half of this patch is what Roger suggested. These changes were
>> in a separate patch, which Roger suggested to be merged into other
>> patches. What tag should be put in this case then?
> 
> The tag itself is fine, but could do with clarifying by way of attaching
> "# <brief>", like we also permit for R-b and A-b. Alternatively a post-
> commit-message remark would help during review (but notably not once the
> change would have been committed, e.g. for archaeologists).

can the tag look like the following?:

   Suggested-by: Name <email> # domain.h,domain.c

> 
>>>> --- a/xen/arch/x86/Kconfig
>>>> +++ b/xen/arch/x86/Kconfig
>>>> @@ -144,6 +144,19 @@ config INTEL_VMX
>>>>    	  If your system includes a processor with Intel VT-x support, say Y.
>>>>    	  If in doubt, say Y.
>>>>    
>>>> +menu "Emulated HVM devices support"
>>>> +       visible if EXPERT
>>>> +       depends on HVM
>>>> +
>>>> +config X86_HVM_PMTIMER
>>>> +	bool "ACPI PM timer emulation support"
>>>> +	default y
>>>> +	help
>>>> +	  Build pmtimer driver that emulates ACPI PM timer for HVM/PVH guests.
>>>
>>> Does this really affect PVH guests? Isn't the whole point of the change
>>> that in a PVH-only environment this wouldn't be needed in Xen?
>>
>> PVH guest may (depending on its configuration) still use PM timer, so
>> I'd say the point is in a PVH-only environment this driver becomes optional.
> 
> Hmm, the way I look at emulation_flags_ok() it doesn't look to permit this
> as optional. The PVH case is "emflags == X86_EMU_LAPIC".

I see, will drop PVH mentioning then

   -Sergiy


