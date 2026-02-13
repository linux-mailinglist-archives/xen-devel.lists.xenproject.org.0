Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEkJNaAtj2nTLgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:56:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44D136C40
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 14:56:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231037.1536389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqter-0006V5-Cy; Fri, 13 Feb 2026 13:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231037.1536389; Fri, 13 Feb 2026 13:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqter-0006SV-9u; Fri, 13 Feb 2026 13:56:33 +0000
Received: by outflank-mailman (input) for mailman id 1231037;
 Fri, 13 Feb 2026 13:56:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqtep-0005zi-KW
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 13:56:31 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbffd8ae-08e3-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 14:56:30 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ0PR03MB6673.namprd03.prod.outlook.com (2603:10b6:a03:398::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 13:56:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 13:56:25 +0000
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
X-Inumbo-ID: cbffd8ae-08e3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YeMjk1pus56FBdhhD+FvTkMgUyTghOJFzpQYrJU6eFTORUm4Gk+joxkhNenoQR3n2vfw3wAuezB+1wHSSJhL0J7xHuXItWxyrqlEdlqcFGNSZb/kVNLCOR7mcRhiO/Fs2f0d8/PwkMgu52diAF9hMDCnkkX7e8osdhm2Jtww5ryPoYXz/IZMtyvcc4dTyPUSOaHqhLMuyVTstLWpkEu/HIKX8HEROrVi5A9rSgjwMmoGwXlEVC15uC3zLYFKbTevlLnyMloKlrSF5+9ambly7sO1wTLIbSnVouTG80mtmQje0PRbc4PI/49tVkNsHKT/TUcMBh8pErm4tKXKgmnWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6e9XKDp17m+e3nE3c73RDXKcJSz1yuYkM6ZLkwd094=;
 b=JaiTafasITTkino74wppYtIok6c+na+r4s1uSkHPyRFMxy0WSinICcPeyFaWmBT7WEFI/19dvZPv+p28RWyFv+4A3X0d+hUYOaabxnX09oU/Jpo3/RxvUu1yFdiin8OHfCB7zbLy6P8SAjWfjjeyScEF38+ztpn3UuCA8NpXbIvFae0pCFTDRvuPNHY0Xu8uBi+vpE55t37SrhMtPwot+FUvAr0YUz9Cf2/FVri3LtTzvU7dmNEvACjvMWBEKfPa0cMtZzDqQz7fgq4ktsRrvbwAAdNHUlkFcCystx+EzsDbMTfHGs8Xmf1nR9t75006MT9Jgus0C+LPqsPVCsK39Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6e9XKDp17m+e3nE3c73RDXKcJSz1yuYkM6ZLkwd094=;
 b=g0hQk/sm4YmA4ElAogyReN96ga/3fO7u7StYL/X1qCk34CCXX2Z/GG/WOXvdaYnntiQLZsF507IrOrw+FV4vgyNKGaS1BAy+YhN8EGcFDxPJim1gZ5wmc233O6h+aTdAaigb8exQc5p8MC3FLK+LGB1GI11xM1pAHyPCB4mDxTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen: add non-executable stack note uniformly
Date: Fri, 13 Feb 2026 14:56:14 +0100
Message-ID: <20260213135614.25842-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260213135614.25842-1-roger.pau@citrix.com>
References: <20260213135614.25842-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA4P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ0PR03MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: d0bf933b-9fb9-4940-c576-08de6b07ad30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXFJTXhCdnErSk9ub3V0SHEybTN2WXh6MSsrWDNEQTlid2NzN0taU21uKzFN?=
 =?utf-8?B?cE1aQ1hZdTZnTXJFYitvdVlCeSttd3VSdThNMUk4RnRpK3lkMFF3ZzFrUmNz?=
 =?utf-8?B?RktFSGtJZE1mM3JHSHpRTzNwNUpPYXorR1hhNW5adUN6U21qak9nV2QrSmJO?=
 =?utf-8?B?d1pzdDN6Y2RaWE4zSGlFV3RDUlFBWWtCa3NRVkIyZzNENjFZbityeU9ZZjJU?=
 =?utf-8?B?dk1xeXNRV3liQjJ5R3NKK3dxcVpWK0xSSm4xeEk3czYya2t4WkwwWnhhOWRk?=
 =?utf-8?B?bEh6QTdwUUx3c1dFdUxuWUwxeXlZWExHdHBWdWo2S29naXZBRWg2c3BaRG05?=
 =?utf-8?B?TmRHWUNMTEQ4NUJqOThVeG1rbE9UWkNRbWluRzFIMlJJM21KREhKeUp5dG5C?=
 =?utf-8?B?VnRXTjdJQS9YMXB5bDdiaXFtL3RFL1ZyRit2dG9iSytRZ2ozQXZuR3lnUFFL?=
 =?utf-8?B?MDcyMVorU05ZTTFlUldZZFdYNTRSdXQveTErcGtxUmM0b2pCVmRNYTdrMXlI?=
 =?utf-8?B?QUEvMWp0UWNrS24xeER2K2E2NkRpd3p1OU9VQm44bGt5UzNlVGFvSnF6d0pI?=
 =?utf-8?B?c3oxRDhxWUJkd3lmOGg5cDROV3QwSkdtN3Vhby9BL0YvSGg0SDdMWjdmbGRw?=
 =?utf-8?B?YkthcXRQNjg5a3c3ZHprNkI2TXhCbG52eVhBNWlBeG9xaE5EOG5NZmZjWUMx?=
 =?utf-8?B?bU5xR2FYbklhVXVsRmR2RThLaENzemVSeWpYVGtYYmVhMThzRUN6R2JYWUJo?=
 =?utf-8?B?NzdJT1ZVVG51WHdvamhKaGJ5UFJWRkYycktLQVBiMzJSRklEdGlCWnBKZFBq?=
 =?utf-8?B?SHk2MDh4WWxzckRQNmpXUUFNWjZPYlRJN1dFNllzVjBkWUNpWlNXalhpdWZO?=
 =?utf-8?B?b2Nmc21KYUd0em1jMVdvR21rYk5WbVlsZEExUjZVMzJ2QVVtNWRmMklLZmJV?=
 =?utf-8?B?Zyt4cXQxb21XWk52KzNIS3ZnVTY0eFhZQjRQQzQ3ZmpZTGhtSklyQUp0YytC?=
 =?utf-8?B?ZjB3ZVhzUnI4bDBKQzhRVDFWTmhvd2M1K3d2d3NpQW1hUzM2OTlpaXVwaUZh?=
 =?utf-8?B?TllEUCtHMXFBQy8rTG5KZ1pvTWVlOFNvdjVkenBFTXVwVllvL252aW9BbElQ?=
 =?utf-8?B?QWlIL3N0OGM1QTc3aXQwbjQwaDVjODZFbldsazk0SHdQZjNGYVdwMlVreEFY?=
 =?utf-8?B?OVpMTjNhTFNvYnpCVGVyT1ZIaElTUFZjT3d5S05melZEQTRRdUtZVXRIM0hl?=
 =?utf-8?B?K0R5TTZiYXBTNDd0MSt3QnN4NWtuNzFSazBBVU5aa3VQQTdiSzhJVUwyTlZ1?=
 =?utf-8?B?bTloU054WjBUajhyeUtGcEFWVlA4MUw2VzNQWkl1SmZsRUFUaVBTVFh6VFpG?=
 =?utf-8?B?Q2NCYUhNUVJHc1g5ODcyQzRHc3QyR2QrU3JvczM5NXlhMXduUjlWYnduZGxW?=
 =?utf-8?B?eVVRL3c0aHB3eVhiekpDVlV3d1FjWi9VYVptVFZlcWE1aDJnTjUybmlhdkZC?=
 =?utf-8?B?ZTcrYVlud040UGg2S01vRlFucC9ZZk9rZ0tESFlqOU9ncHAvNDhYWGFQMXhV?=
 =?utf-8?B?UjhNL29OV1o2ajRFK2tFcTVJdlVnS2ZJT1FpaCt1OEZzOFk4enlQVU9IZ05l?=
 =?utf-8?B?WlA5OWNrRmpOckJheE8yVXQya1lINXlLbEpXa3JvTGNGblNhOHNQQWxUOUN3?=
 =?utf-8?B?dmtveEs3bzhLR09mT3A4ZVRWb3BsUVdUSTNObnFoSC9MMGRFL2tIenQvaGxj?=
 =?utf-8?B?NDE1QmZ0RytjdHJOcFV1aVd6a2hIYW1sRFhjZlBuUUM3RWsveHp2bXBvMXBm?=
 =?utf-8?B?WVVENHoySjd1d0dnT2k1YkJqMU82MnlvSkJoNXhpOUdzeW10Rlp2U3ErczBv?=
 =?utf-8?B?M01ncmFBZ1ZHMFhrbGF2V2hjN25tQ1lvSW9qNlVSNU5UQjhsdXVXR2FITWVp?=
 =?utf-8?B?K0p5MDhGNGhjblNwVW5halpsRHg2MDFOY3ZGN1dCNlRyakc0RmxWb2ZvLzNa?=
 =?utf-8?B?d0RmSHY0a1RDRGU2WmhhblVKNWVvZVFzbHI1MytoM0xwTUM3MmJmNjRnT2kr?=
 =?utf-8?B?d1VPa245NHBQeURoaXZMdTk5SHcrdGlmKytvUTdzbFd5RWdZWDh3OG94Y0JB?=
 =?utf-8?Q?+o30=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW4vS0kxc1VhS09kU2p1VDExWjhrZGdQV0J4RnBpbVB5cW1ZSWxrc1pZNHBX?=
 =?utf-8?B?Sk9iR3NRb0EvTjZIbUp4dzN4L0xYWlQwQjRUNWR3STJSa2U3QXlnOUcrdTA0?=
 =?utf-8?B?b1I3aVNQdWI5bXBBOWp2Uytka0d0bHlKek5qdHlGOFgwT2RNdUFoRFpWOWty?=
 =?utf-8?B?SVlwVG1GSHZUT3lmcWR4WWZwYXFYMzVBS0NnV1lHdE13by9LdGx3OHpCMllD?=
 =?utf-8?B?R3hIdzV4bWQvRG1Ma2xsa3hkMXVBYmJwbjY3SGlhMTNINXMvTi9VeU9vOUJn?=
 =?utf-8?B?YmVSbWFQajV0ZWtNQkdOOE9zRkFTY2lZS3pQV1RZL3kyWkl6TWpZbXcyQUFJ?=
 =?utf-8?B?Zm5PQldhaHMxd3BCTmFVL0VXaE4wVzVLZUQ5MjNGZjJYS0E5c28vUHdCblcy?=
 =?utf-8?B?LzJhTU55TkYrVm9WYXRaK3hWejBXaEdsMW1KRFJoK2sxUkVoVWppNGZ3S1JI?=
 =?utf-8?B?YVpQQ0Y1M09VWlNUbE45S3dNYXRYL3VsUVZJQ0lmWWhOTDBWNEtQZm85b2M3?=
 =?utf-8?B?RWk1d3JGekZKbXRCd1RsWnNkeWtsSW5OMGtGZU9CbmVjNHl0M2lYRHIvUkpR?=
 =?utf-8?B?TUdpeGNseTd1b3p6aXB4dkE2emk4L3UyQzNwWnNYOWpvaGFRTTZKQW1xQzBk?=
 =?utf-8?B?NllFNkxyNFlLR2t0OS85OTcvOGN6SUd4RnY3RWJiWit5YWlDejFEVHE5a1Rv?=
 =?utf-8?B?TXN2RGMxWStlRTRWOWVKZjA1TzVPQ0lNNSt2bWlxbkJWbUxlMjdCTCtNMHA2?=
 =?utf-8?B?MHpXNG5DMFR2aG9GMExmN2JiRTFLYWtSbmFVQ3pZb1FkSjFIMW1GY084L2Jz?=
 =?utf-8?B?N3BKcStTVjk2bWR2dldBTlpXMk1uKzc5MVlJSkdNSllRV2Z4Ukhma2E1SGRw?=
 =?utf-8?B?ZXk2cjF6SzUvZldCUDFhUnFiOVpoYXNNTVUrbWI5bGVNMHlXRjFlRlR4VDdo?=
 =?utf-8?B?WHl1bTZ3M1p3OXFpRDNBLzV3M0U1TVk2M1lHcFloS0VaZWx6TjdsMERpcjFT?=
 =?utf-8?B?R0JhUEVZRVdhYlRTT0p6UFB6SkVJR3BYejBETEFuMmJWQW5KQ1VhOVA1UWFN?=
 =?utf-8?B?QnBEbnZneDkwTkoza2RIaEpFeVFzVG9HVVNnVjU4NUREY3VFZmZidnhGczlQ?=
 =?utf-8?B?MDM1TEU3VDZNQUhvUlRLWERWNUJkNEpUMHJUbk5yQTVmZ2pPcnNyVTNicExJ?=
 =?utf-8?B?WXhUMVVzM251Yjk4YldzMWFGNGJXQ3RURFJ2VmRaRTdJZmtNTEFtNGxBTkdT?=
 =?utf-8?B?N2U0NXNldlNuck9vV0pSdERscWJaYUJ1eEZJQlFpUjRLTGtCTklpdERoR1FZ?=
 =?utf-8?B?RTZWellmaUd6cmY5b0FCQmpHQjh5alR3S1QrSVVDbUJTR0FwUUZsZTA1OThx?=
 =?utf-8?B?ZWM5VU5uQWlTZkhmYldmWXFEZEpxbkdXa2pWWkZxanRubmFkcFk4Q0xwVjJk?=
 =?utf-8?B?ZnBGbE9BRlUySWEzd1VPS1dtTWxNR0oxdTlIcVJiWTVlN1FDVXd1aXpsMDhY?=
 =?utf-8?B?aFFIR256R2FnTkxVcWhkNXB4eEFjbjllTkY2QXYvWlZ2V01ramFxVTBHYk9B?=
 =?utf-8?B?VENKMElTckh2ZXMycXZMMUJ0UVJ0V1VaWFRCTUJyQmlnRW5GRHdOaXU4aU5i?=
 =?utf-8?B?NDV2Y0c3OU9pbEd1Rm41dFdLNzdDZHNxbm15UStjZG5rbUxXYldwK1ZwSVJj?=
 =?utf-8?B?b1JFcTNIY2lqVGEweUFRYjRYcVVqT1NQV2RnY0RPT25raXRxU3Y5bnV6QWY4?=
 =?utf-8?B?NDdXZStLOGo3c0tETFl6diswcUtmOFJyRlNhMjVvMGowaUhFSThydzU5UGQ2?=
 =?utf-8?B?eEQyS2wvR3RYVFNadkF4dllvWmZLUVNpams2dTJBRzEvRXRha254V0RaN0lk?=
 =?utf-8?B?VS92RW4wY0pCUzJab0ZLNU1vZHIrS2VDcjFiZ1lVbmQ0NlVVUVc5YVpVZ0sv?=
 =?utf-8?B?aDlFOUF2bnZDbFBLdEJaQ3hVMFM2MFJxUzZMZFYzelU0OVo2WTRlUDJCNVBZ?=
 =?utf-8?B?dkFHVVhrUjV2cE5WaGZhcEZzenpGaVMxK000UUwvSGhsQTdqZTlnN1ZJS1hY?=
 =?utf-8?B?c0t3SGh1T2xSaklFWnNXYXI2d3NSSS9WZElmTjRYM3BZamE4eVZnZzVnMjRB?=
 =?utf-8?B?bzhodHVGbGtlRzJwSVc0ejI0UDU0RTNCOFJLWGtkN0ZYVkZYVnVWcFVhKzJI?=
 =?utf-8?B?ZVhGSllicVdHcXBrV1NScnczSUdNUjZkQ3pBUTg1c1dZMWwrcHBGelZmdWNB?=
 =?utf-8?B?OEpQaGlhTHZHbGFacE5rcDR4QzhIRnJ4cWFxY3BReVV3RFB3Z2YxZkE1SWEz?=
 =?utf-8?B?cENGN3VUblBwbHdzai8yVS9JOUhJTkwzRC9jaUxuU3I1blBacUswQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0bf933b-9fb9-4940-c576-08de6b07ad30
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 13:56:24.9676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ePp66Ba7drYx517yscresOZYT/77u8tZuN5TJoUyiW5/eA1Soze8Ba4WNV1aKSfIwimsX9cMuRHoy8eMdHMJbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6673
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3B44D136C40
X-Rspamd-Action: no action

Currently the -Wa,--noexecstack parameter is only passed to the compiler
when building assembly files, as the assembler doesn't add such note for
stack attributes.

However, the default addition of the .note.GNU-stack section is dependent
on the ELF target used.  Adjust the passing of -Wa,--noexecstack so it's
added to CFLAGS instead of AFLAGS, and hence such section is also added to
object files generated from .c sources.  This fixes the complains from the
linker about missing .note.GNU-stack section when building x86-64 Xen on
Darwin platforms.

Note we could instead pass `-z noexecstack` to the linker, but that however
would mask any possible errors or unintended mismatches from previous
steps.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index a054315fa4a2..a2b442e76d5c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -413,7 +413,7 @@ ifneq ($(CONFIG_CC_IS_CLANG),y)
 CFLAGS += -Wa,--strip-local-absolute
 endif
 
-$(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--noexecstack)
+$(call cc-option-add,CFLAGS,CC,-Wa$$(comma)--noexecstack)
 
 LDFLAGS-$(call ld-option,--warn-rwx-segments) += --no-warn-rwx-segments
 
-- 
2.51.0


