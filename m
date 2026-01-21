Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFHFMeOUcGlyYgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 09:57:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13853F2E
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 09:57:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209449.1521442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viU0k-0002aF-SJ; Wed, 21 Jan 2026 08:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209449.1521442; Wed, 21 Jan 2026 08:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viU0k-0002XC-Nw; Wed, 21 Jan 2026 08:56:22 +0000
Received: by outflank-mailman (input) for mailman id 1209449;
 Wed, 21 Jan 2026 08:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZBm=72=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viU0j-0002X3-Lo
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 08:56:21 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c20b97b-f6a7-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 09:56:19 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB7009.namprd03.prod.outlook.com (2603:10b6:303:1a4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Wed, 21 Jan
 2026 08:56:14 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Wed, 21 Jan 2026
 08:56:14 +0000
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
X-Inumbo-ID: 0c20b97b-f6a7-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbG3NOaG8MUQdUXZE5skW/K/L+Sb7A46ZmbV/ar+0IJaww+yaHdN4eHzo3rMMOXAFszx8TwxnYnihmeOyGafCIEOCFQeMce1+LEtn/q6zJlGIaCpYRTi7OHpUMSDPzqi63vMSrl6WNLAIWOTxYEB+EVzslWYPDAih0BXz4MRTOy2lXiVDw+jytokaayvd/IpqYo3b9v1UfewnZV6MxBlLv78lWoOQNmQNfemWBihSJ/pG4sqt3vcWEQG6MIbGVI8Eg71XXnNpv2wDZur1qx/s653wax7ktmYiMZZXL6HmeUQj1HlE1lp5ov28qnw2Un20ph4z3rVT/+rMwCd9BX8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsFM0pb1Rf2vqmhsegcRTSqeECXcMspiYcNU1CZRN14=;
 b=nsNY2jvScyqdiz76yyM1Oc+/8NJ05oCK2Au+FoC3TNV/xaX3B/RifoSoMv2tgaGzoq/0bKYDwsXwb/B3SdNXyXxNFExS2TDlJIzWUdgjSRQNsZ4QrhRhXyH1XFg4MmuDgpGCA0VO0DGM/Bwaube7ZqLk0boUBKRAVag6pKsO7H+TIR2bCtTK0YIt5LsQSZxSzeqQiIRt18d65ZIr1iWzzrmtLkETgPhStt5MCgNZkBPZC+ZKBv8J01nn6T0Ec7itiINS8CwHQYMh4K7VgsXpvZqvqNouvJR8Te039G3MooBWOaE3IgA0LGcASg71E1DrG7KnFANohjLx0NICurJyVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsFM0pb1Rf2vqmhsegcRTSqeECXcMspiYcNU1CZRN14=;
 b=md6DPJs8qLUGXMjrMEeOAy8zbTNsxt6CsRrhgmf+uYy+3oE3pkD/dlS0iqJQpH0jrPRW5SsmuSkr+B0/aemg2dPWkHldcHxu12KPmF9dD5bIPj31MmGQnxuKVN8KnaxXzGIxsLi3Mrs8RFDriGagVi8ItNLglQv1AO38WhVy5HY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 21 Jan 2026 09:56:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [RESEND PATCH v12 2/3] vpci/msi: Implement cleanup function for
 MSI
Message-ID: <aXCUq0R8eONzga5c@Mac.lan>
References: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
 <20251208081815.3105930-3-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208081815.3105930-3-Jiqian.Chen@amd.com>
X-ClientProxiedBy: MA3P292CA0037.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f4b9e16-1246-4f07-d405-08de58caee76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wk4rY2NsTnJtLzZTcHNXY0NGcW5mS2dNaUppeHVvWHRYRnZFQjB2SlNBTmhr?=
 =?utf-8?B?ZHkvZ0hKVFVrUHN5ZWg5a3dtNTVUcGRNRCtTY0JZRFVDQ2wwVlE1cndsVmcr?=
 =?utf-8?B?TWxReGl6KzBVZGNkcVZnWFcxbE5CL0RSN3ZiUlBFK3RWdm1ma1JXYWxnSEJz?=
 =?utf-8?B?SnZvTW5yNDNvN29RNnBNU0txeVM3ZUVWQ2Myd251WENucVpxbHpodHhDajlk?=
 =?utf-8?B?LzNPUkRKaVZ4WnlBck4ydzJtS0J1a283V1hGbEdsdFUxaFR2eFRuTFBwY0lj?=
 =?utf-8?B?RkFZNjZEVXovMXovalhtbk1JNy80WkFUT044OTYwOGF1Q2JsMnVSbHlxM0Jn?=
 =?utf-8?B?RTRodWRES3R4dEJoM1JIZ1ZDVXZYMHVURXJ6Yi9aUXVPR0hFQW5pTm5XU1lR?=
 =?utf-8?B?TlI1WG13aUd0MVlwdWJnL2dQZEpKMVFqcDhnT2RNeGpTY3lsMUVRRUtZUVFy?=
 =?utf-8?B?UUJxYzk0M2Uwb2hSU0ZCeERiT3hHU1VMNW01Y3o1amtXTEFXN3grOTNLNXda?=
 =?utf-8?B?QTlLd1NGdHpYWmpXMlNNNTU5VDZtaEJkVHpmVFVxV045emNQMmtXWnhoT3Y4?=
 =?utf-8?B?TWZ5MjJ2TnNzZkd1N2Z2N0hIRjZPRHFOd1pZcnVIVUIxaGIvM20vNWxlQWlY?=
 =?utf-8?B?U2FTRThrZ2ZNUUF4MDdqVzNyZ0k2cUZRZGNBdjZjM3FDdEIwVVR3TW54OHNW?=
 =?utf-8?B?b3dFTkJnVE1Qc3h1QjVJN2RORlZEY1VHb0lmeVJIZ0tZVDc0YW9wQmZMcHdv?=
 =?utf-8?B?UHVSN0hFazRzTVV6Y295ZnBLdWVrN2djbjk3clZxS1pXNmRud01NZkpPblRl?=
 =?utf-8?B?Qnp4NEJEOHpJYTRLU2RiSmZhbDkwMmx0R2ExbE5EdVptRVA1c3lkc1BVWHNp?=
 =?utf-8?B?RTRWUVdlOEZxcjUzc0xMSE9KWEdEYjE3UjBrbUlrNm00VzJiN3A4bGJBdFBU?=
 =?utf-8?B?dSs1b1VqQ01Cd0x4V1RvQjZzWjNoeXBXb2wrbEJMVmJXaGpyZm1ZTVNhM0xv?=
 =?utf-8?B?cEd1VDZlbkJmRGhkMlY1YVRlYUFQdDB2QW1aYmxSSDI0b1VhNjR5MUxJemtG?=
 =?utf-8?B?YTdwSjFaOXlMTmVmZm5JbncyeExjNGpuL3ZjeGJXcFNlY3NJU1dxR1JRQVdT?=
 =?utf-8?B?NFNiU2N3TE9LSDJsZDI2a3VpS0xtWWI4LzEyaVdSWWRhZ1hNblBOMFFXU2d3?=
 =?utf-8?B?eFJaK2FIVVZLYkVZWldHYWtWQlFTYktWV2lIU0E3NC9NSVpMVjRyb01qRm50?=
 =?utf-8?B?bENCVno4d2ZSU3h3RkI4YXhiRTRXYVhISGtJcmJxdmN3UGtMc29mYzJON242?=
 =?utf-8?B?SGVhVWNNNDJMUEs3VURRWUtlOW1malhFKzFrb0Z5Ri8zbWdoZXVxM1JEQ2Fx?=
 =?utf-8?B?aytMYjdZZU1xcktKYWp6TkpzK21OSlhyY2VxOGozbXBPR3dVWHBwSU50bHM0?=
 =?utf-8?B?OCtXNkZ1ZElqRi9QZ0hxNzFKcGlWdHd6ejFCVjdMRlI1bFN5cWE0OVltOGJi?=
 =?utf-8?B?ZVJ3N2d4Y1pEbFk5czRLbDBmNlA3aDN0SWxaTSs0NlNKMGxjOUNzcFltenpy?=
 =?utf-8?B?aFlSNjVQMUZndG5WbTdvRVpEVFZ2aVZ5ZmUyS2F0VGtkNm1zUW1ZZC9EaEpC?=
 =?utf-8?B?UUZlaW9zeXNrTkRUZFdlTlcvUDI1SmtzMVdBSUIybkpJbXRlMWlDZ29FbW5o?=
 =?utf-8?B?TktKSUg2dDFJQUpUYTlYN1llVENYdzVJT2JwQ0FKZms1MFQzaEg2V1RRMWhh?=
 =?utf-8?B?R1JTdi9WV0NISG94RkYrYlZremh3OWRzNythdEVkMk5nWlhmbmRQcXhDcGJm?=
 =?utf-8?B?S0VkYmpuWlNmQlJxbEJNRWdUdVRDek5jL3hVZ0NwaUhGMW9HeXdKRVpFZDhL?=
 =?utf-8?B?K3dUeHhkTDBjOGx6NVU5cXRGcDBaVDZtT2tWSWR5U2ZOM0FyKyt1NGhNSHNi?=
 =?utf-8?B?dWNpQzFBWFdkWTRaSldNV3FjeWdDRDRGamFSR3YwKzE4R0RrNTR6U2VTLzB5?=
 =?utf-8?B?M0dDV2xNSktZWUVLV2xCcUNobVVMem1IcjVDanZjU2ZlbU95Z3JjQThMcGZv?=
 =?utf-8?B?dTlHSXNYQkhWc0g5MWxGZkxOQ1ltd1R1STRscnIyN3dWMVIxckxvY25OdzYw?=
 =?utf-8?Q?mN4o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amxVRjZBYlJ2N2VYSkF4MTJPU01Wc2dQMXZodjhhZHhsaWN3ZjBwaU9Fc3Q1?=
 =?utf-8?B?RGI4YWswVHk5eFZkL3dqcFU1Vk1UcmxjMHdtZkludVRGb0NUOHlET2I0NW9x?=
 =?utf-8?B?OGtkVzA1V1d1a0tGWEZWNG1leCtURmNBckVvWTE1ZjRTdld2dEZlMmREMVEw?=
 =?utf-8?B?azVSd0tvdEpBOCtFMlU4SERZN0h4Ykg2VEMvLzFURFpJQlBNU1ZXVkJjMlU3?=
 =?utf-8?B?dTAwVUJVVW45amJZdS9IdGFHN2puWkVUZ1k3L0JpL2hrQkE2czljcVExcWYr?=
 =?utf-8?B?ekswektEbjNTR2dScXA3bXBlUFB2T3M1VWk1MGFMem9BRXFTRGt2ZW4rWS90?=
 =?utf-8?B?NllLazNlZE5KL2pId3Z2V2E4RC9ZYWN6NE1kMWF4aEE4Q21OU0JmNXJBT3h6?=
 =?utf-8?B?cGdCanJLZGlyblJXbU54b284Zk1zb2tnbVZ3TExXc0oyVXZCR2RFZm5jVklH?=
 =?utf-8?B?c1B3UTNQZkhhU0hSaXltSlgrZjFDVHEwTkFoSVNpVnRYTVJFKzB2SHc2N25H?=
 =?utf-8?B?WjhTOWJ2N214S3FkdC85bitaMHVUa0FMc2RCNWZQRExYT2liZ3R3OExwVTlm?=
 =?utf-8?B?cnllbEZRajRmYUJTTlJGL3ZjankxcEtEVUc4Z01qYm9QdWxkenJhM1RoNjYw?=
 =?utf-8?B?ME1GRDNpd1ozS20rVjY3T1pHYkJSMlY2NWRvY3JaUUNBZkxHdTNQdURidWp3?=
 =?utf-8?B?THdhd05VWE9QV25yMTZCc2VGdG5TWEI4QmxWSVQ1bmo2QWppMmZwU3JrYWdq?=
 =?utf-8?B?STdkMzhBQlFMYzhPbTArZDE3eHNWazlVN0U0QUl1UjByV3RaRFF5UmdvZmR1?=
 =?utf-8?B?YjUwajdoY2dmSmwxVDgrYkNydjVlWTA1STRFNDZiZE5IUC90OE5aOEpUUVl0?=
 =?utf-8?B?K005QU5sT2NBWjVjNTZXaUZTZ24xNkJ6Y2plRWR1cnVUb1BiQjRJdkgrOUsw?=
 =?utf-8?B?TGQ1UWFUdVJpR3ZqVjVFYXgvV3BhNmhwN3lHRGJsa2Z2YVZrdnl1VklzNm9z?=
 =?utf-8?B?K0p6L3JqeUNBenpacU1LYVg0U3pueTNXT2tDdWFOK1I4UVY5RnFtNHpWMkhr?=
 =?utf-8?B?Z2ZuZGQ4RmN3NlVJYmJUR1NVNG9ZRDcvdWxldFdlZFA3S3d3Q04waU1oZXJu?=
 =?utf-8?B?Y1V1TGg5K0dwMVBQVXdsb1hNa2ZOWWFhQmNSUVA1UkxDaDFaWFJEM1JGY3l6?=
 =?utf-8?B?VnBQaFM5aDc2Q05uTE1pTW1lMUhBYWhrT3o4MHR5cnp5cVU0MGpha0s2TjIr?=
 =?utf-8?B?M05xV1d2QkR4K3JTdzRyMnhubCs2Z0k5V1V6dGxvb3drZ0Q2WUpzc3oyNGxh?=
 =?utf-8?B?YWY4U1ZySDFsZGozd2x3YmRiTWNCMm1NTGVCYTMwSllscjVTckJRNUJmbnE3?=
 =?utf-8?B?aGVzNTdTOVMzM3BOKzk5V1QralNOUnEwL3lybHVMczNJbG0ySW5FREdmSFRU?=
 =?utf-8?B?QzlWZVJEcFErc3QrRVpLU0JsekxCbi8yWkxLRTd0OWNHRFVFTGlNd3hSRUNE?=
 =?utf-8?B?cmNBZzVpRU96SFg2aHFKbVBZT3ZPdXU2Mzk0bGkrR2hDcXVpbzhla0QrZXlq?=
 =?utf-8?B?NGh5eitOV2Y0a09YWGErcmZVZ29nNnVveHFtRkwrdWs1MmdvTE1ra3F2RjZr?=
 =?utf-8?B?cTh3RTEzdElJdnd5MmJuRG1XYTZCOGxCOFYzS3dkYmZSd1Awc2svMGhIcHZj?=
 =?utf-8?B?ZGJ0elFmejVFT1dWajM0M2k0KzcrN215ZUplTlIyM3FPNDdhSzNUZThhOE1C?=
 =?utf-8?B?b2JkRy92QlhsZnFHVlJuVGZidllMY0hMQ25pMUY2aU5xTzN5MGt4N0NUMjZw?=
 =?utf-8?B?UStaemFSbUpLOEhEOTh3b3haM3lCa3VkZndmSjRqdEk1RHBURCtvbHlwaDJO?=
 =?utf-8?B?bEVWeWJCVWoxTkVlL05NTVN4ZzJ0blhUU2VLZk5ObEhLd3RET05LQm9YYUJM?=
 =?utf-8?B?UmtSWGpoVzNKbW55enBBNWxna0hLWlF6VlgrRjNObDhJU21LY1RnaUx3S292?=
 =?utf-8?B?ZzQ2VHp0eENaVEZZMWlaWTdvRTc5N21BT3lmT0szTTZweEtHZEJYT01UNXo5?=
 =?utf-8?B?L3gzRVBVQ3B5OC9xb1lkN0dKWkNkbFNJVGgzK0I3Vy9oeCt4Yk8zS1ZvNkVH?=
 =?utf-8?B?ZEV5MlQ3WDU3S2R1eFNzdWJxWCs5VlBUTDkxMURNeERadkpLS3dHQ3VvY0ph?=
 =?utf-8?B?Qjg2eDFIaFlnRnpWeXFiUWhnZVNuOVJOVXZ2M2tpSHc1NWpRUm5nbE55UkFU?=
 =?utf-8?B?NFczSU40K2dDamREZkoycHNlUDQ1c3pYZGs5eGxRdVdyZ2NCcGU2cnFaZVUr?=
 =?utf-8?B?TnRJaDlkQWkzQldUMndwMlE0RXQzbHRNdk81SlBqUDBXcUpZQUZuQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f4b9e16-1246-4f07-d405-08de58caee76
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:56:14.3081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5vsz8oq8ggld0EyBbCZTgcWUJ5MsXh1hDGE3ycQ8sLcuK8usraGx3Ga9+6lj8scPWNNMOysuhuHkMjCQk4hhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB7009
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Jiqian.Chen@amd.com,m:xen-devel@lists.xenproject.org,m:ray.huang@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:email,citrix.com:dkim,Mac.lan:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0C13853F2E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Dec 08, 2025 at 04:18:14PM +0800, Jiqian Chen wrote:
> When MSI initialization fails, vPCI hides the capability, but
> removing handlers and datas won't be performed until the device is
> deassigned. So, implement MSI cleanup hook that will be called to
> cleanup MSI related handlers and free it's associated data when
> initialization fails.
> 
> Since cleanup function of MSI is implemented, delete the open-code
> in vpci_deassign_device().
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v11->v12 changes:
> * In cleanup_msi(), move "if ( !hide )" above vpci_remove_registers()
>   since deassign device will do removing registers itself.
> * Read address64 and mask info from hardware since they are not reliable
>   when init_msi fails.
> 
> v10->v11 changes:
> * Add hide paratemer to cleanup_msi().
> * Check hide, if false return directly instead of letting ctrl RO.
> * Delete xfree(pdev->vpci->msi); in vpci_deassign_device().
> * Remove Roger's Reviewed-by since patch change.
> 
> v9->v10 changes:
> No.
> 
> v8->v9 changes:
> * Add Roger's Reviewed-by.
> 
> v7->v8 changes:
> * Add a comment to describe why "-2" in cleanup_msi().
> * Given the code in vpci_remove_registers() an error in the removal of
>   registers would likely imply memory corruption, at which point it's
>   best to fully disable the device. So, Rollback the last two modifications of v7.
> 
> v6->v7 changes:
> * Change the pointer parameter of cleanup_msi() to be const.
> * When vpci_remove_registers() in cleanup_msi() fails, not to return
>   directly, instead try to free msi and re-add ctrl handler.
> * Pass pdev->vpci into vpci_add_register() instead of pdev->vpci->msi in
>   init_msi() since we need that every handler realize that msi is NULL
>   when msi is free but handlers are still in there.
> 
> v5->v6 changes:
> No.
> 
> v4->v5 changes:
> * Change definition "static void cleanup_msi" to "static int cf_check cleanup_msi"
>   since cleanup hook is changed to be int.
> * Add a read-only register for MSI Control Register in the end of cleanup_msi.
> 
> v3->v4 changes:
> * Change function name from fini_msi() to cleanup_msi().
> * Remove unnecessary comment.
> * Change to use XFREE to free vpci->msi.
> 
> v2->v3 changes:
> * Remove all fail path, and use fini_msi() hook instead.
> * Change the method to calculating the size of msi registers.
> 
> v1->v2 changes:
> * Added a new function fini_msi to free all MSI resources instead of using an array
>   to record registered registers.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/msi.c  | 55 ++++++++++++++++++++++++++++++++++++++++-
>  xen/drivers/vpci/vpci.c |  1 -
>  2 files changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index c3eba4e14870..181ec902dffb 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -193,6 +193,59 @@ static void cf_check mask_write(
>      msi->mask = val;
>  }
>  
> +static int cf_check cleanup_msi(const struct pci_dev *pdev, bool hide)
> +{
> +    int rc;
> +    unsigned int end;

Nit: I think you could narrow the scope of end and define it inside
the if ( vpci->msi ) { ... } block?

> +    struct vpci *vpci = pdev->vpci;
> +    const unsigned int msi_pos = pdev->msi_pos;
> +    const unsigned int ctrl = msi_control_reg(msi_pos);
> +
> +    if ( !hide )
> +    {
> +        XFREE(vpci->msi);
> +        return 0;
> +    }
> +
> +    if ( vpci->msi )
> +    {
> +        uint16_t control = pci_conf_read16(pdev->sbdf, ctrl);
> +        bool address64 = is_64bit_address(control);
> +
> +        if ( is_mask_bit_support(control) )
> +            end = msi_pending_bits_reg(msi_pos, address64);
> +        else
> +            /*
> +            * "-2" here is to cut the reserved 2 bytes of Message Data when
> +            * there is no masking support.
> +            */
> +            end = msi_mask_bits_reg(msi_pos, address64) - 2;
> +
> +        rc = vpci_remove_registers(vpci, ctrl, end - ctrl);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "%pd %pp: fail to remove MSI handlers rc=%d\n",
> +                pdev->domain, &pdev->sbdf, rc);
> +            ASSERT_UNREACHABLE();
> +            return rc;
> +        }
> +
> +        XFREE(vpci->msi);
> +    }
> +
> +    /*
> +     * The driver may not traverse the capability list and think device
> +     * supports MSI by default. So here let the control register of MSI
> +     * be Read-Only is to ensure MSI disabled.
> +     */
> +    rc = vpci_add_register(vpci, vpci_hw_read16, NULL, ctrl, 2, NULL);
> +    if ( rc )
> +        printk(XENLOG_ERR "%pd %pp: fail to add MSI ctrl handler rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);

Strictly speaking (also in the previous patch), we only need to do
this hiding for the hardware domain.  For domUs access to the control
register would be ignored by default.

Would you be OK to add an:

if ( !is_hardware_domain(pdev->domain) )
    return 0;

Ahead of the call to add the vpci_hw_read16 trap register?

Thanks, Roger.

