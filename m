Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOxWEHpfg2mJlQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:02:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F89EE7C91
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220860.1529272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneOD-0006Ah-7f; Wed, 04 Feb 2026 15:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220860.1529272; Wed, 04 Feb 2026 15:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneOD-00069N-3Y; Wed, 04 Feb 2026 15:01:57 +0000
Received: by outflank-mailman (input) for mailman id 1220860;
 Wed, 04 Feb 2026 15:01:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vneOB-00069H-Ra
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 15:01:55 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70e78ed3-01da-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 16:01:53 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7071.namprd03.prod.outlook.com (2603:10b6:a03:4ff::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 15:01:50 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 15:01:49 +0000
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
X-Inumbo-ID: 70e78ed3-01da-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTpSMOCM59qiflITHG6wjMfCrA9KsyzfHcvpg1Tq7gyftkn19H1KlkBaNfyM0HwMpXuK2Ptn+s3asOAfrUR78M8OiXBlTm83ulQ//PA8dBJGMpuOi8oaTExi+TmuhDSvii8rF1BYE/EXBzysbj9tuuxcBlE3RgQT1WNHifqutx97alfK7tpeF3MULRG+v/2uJUoWF+wanFWrHGpNnms9MuMeBglEG6gvWV3NPkfOvKmBZj89tipMfu2coPcgc7T61zqcwbP9D69nGYrColntlfy3HvlwFp47cV9IowXOO4IvQ5fSAE5GRAI/x3PbQG5r7IWR/S+cY/b+f3MCy8HLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynWbV3pO0y2rBU+VdteV8O5wtRf5sMV0Lzl/CZ6GL9I=;
 b=CnmcEjb9PPR8k7jAFXBxwFsS1TN4T0X0bW8f0mqT7m4ReSRlmLfRwOTax3Amt1sv05Drv7iJWbFDcfzXe3eBbdJUrAEj1ds+0ylqrkC1qECJQp+nOsPHsK15G4NSKtelFEbKstMGYD1djDXW51tGvaDWij+KqlGpWfjPGhSwGfXUpukE5VKT+PmLOxjKLBVgu57xFnWJqeCP31DKYUPkI9r6nHWrcjnL7kjQfNPk1UrHuXq8qyGz3fCo2AazBbWePydA8U4gb+syDqHDJnAC3+5jxm33hugTBxp0qCQmp81/hzC+13OfHJcBNvqEK+WEuWG5FUAkiol1n4xPha6ccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynWbV3pO0y2rBU+VdteV8O5wtRf5sMV0Lzl/CZ6GL9I=;
 b=PYnBokY1foMC7uImkOoCQD+ePG8TL3v4tIY5q+P9HOZRLkc0DiHQ8Dds0C6r2KLtNqlLjFMM3o3TAQVu32zf4LcNosVrDstVQSQpQWiPgBF2QmewRGWMJZPW6LBPUkXFCAlSC1tUmAWZSuwChDUNnmiYV+TBCERZyxg1mIHmbZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 16:01:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
Message-ID: <aYNfVDgSgKCYd929@Mac.lan>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com>
X-ClientProxiedBy: MA3P292CA0008.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7071:EE_
X-MS-Office365-Filtering-Correlation-Id: 11bedc02-a5de-4665-147f-08de63fe5296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sk0rWXBnWWQ0b3ZsdGtZSjd3Wkl4UUt2VVZNUGlLRk5UVXIwNGhldGZ1RUpL?=
 =?utf-8?B?a3R6MGo0YVh5eWhHdUFDTmgrZU1Oa0pZbFFmMUNkSG53TjFRbnlhc0VEY3Ju?=
 =?utf-8?B?cHpSaW5jeXIrTHdkMXdDMkppRmxTaWZiNWVOMW0ydGJYWkc2WFFGNW85ZDhW?=
 =?utf-8?B?Uk9nRVNSSlBROFFvMkRkMzJRaHJRVTJxdk03T0ZPYTRTWlc0Rkg4TFdOSVVB?=
 =?utf-8?B?ZU9PNWtJZGZ2N2M0ekdqd1lLeUxOZVF0TThXOTJ3R2FQTzhMZVRsMjZMcjRF?=
 =?utf-8?B?dmJHT0VZQ2hBVWFsMldLcDJjRlhmN0ErbE51QUN2N0oxQXg4SkhPb2NxRGtO?=
 =?utf-8?B?NEFPZ1I0ajV1WTBhYzNoTWdibmpsL2RKb2IzYkRJcklVWlc1NjU4QVNqT1VD?=
 =?utf-8?B?R3pLczlIbStQcW9Yd29QcVlsb3FVOUVEdG9uR3MrZGRDcW5HZTV0UGErMi9r?=
 =?utf-8?B?NFRhZnVvSXc4YjNKUlAzenpXYjBrUHB3L3JtQmY3clJwVzNsL2M1OXluekNi?=
 =?utf-8?B?TEVtczBMUDRrbzJCVE5TREZCa04wd0tKVklFQWtxRW5TWExQclZ3L2hoV3NZ?=
 =?utf-8?B?cHBxY1JrbnRNYS9IOXZMN29YY3ZhU1Bia3VDWlhSQm1oa0tNN1NvemxvRC9S?=
 =?utf-8?B?czlpVVdLOXd0ZDgwZFpzbk5qdjJtMDdSWFljUXYvRy83aFVZaVFrVG9YWmFj?=
 =?utf-8?B?c1VNTTJoSCtkTDdwM1FNSHorT21GVmtqNDYwTHVIcUNqRHgzMFFqRXRwMC82?=
 =?utf-8?B?cVYyNVg0dk9lL0o5MHIzM2pxYWhycVRhRndyQmMvMnVGNENRSERWSkUxcG9n?=
 =?utf-8?B?WUdxV2xGNG1GSmZocEMxcnhHY3o2NjBxWTY3SmxpMGlwNDlzR2pKMEo2YXpI?=
 =?utf-8?B?clFaVm9Dc0pTUkZPanBMZ1lxL1FkR0JsKzREWkxKNGp6bmhjUVFxNVp6RytN?=
 =?utf-8?B?YmI1Z3c3ZU5saWhkTi9JeTg3ZTU2WkdSa3ZzTmx1cjYwaW10WEFYMzM1WkFQ?=
 =?utf-8?B?Rm1oSHJWVGlZZ25kbVoxLzJsWjk3RVNHVlQ1Y0sxZXluN1dSZW1VNThyTzlJ?=
 =?utf-8?B?a0tBK3ZraW5Ic0oyNGtjdURISnJoazdHMjJXYzFta1A5cDIvd0FsNHFFaVBr?=
 =?utf-8?B?OHNHMzhoMGJ0cE5zUk1tM0I0VmoyS1dWT21GUWpYdWptdi9Ba2t3WDQrY0RF?=
 =?utf-8?B?R2RnVU0xRmJDMVBwMGZXbTNOUHVBdjBtWVEvRjZLN3pYYkJnKyswYyt6c0hP?=
 =?utf-8?B?cVFqT1hSWUlIbXpJNXZaNDIvR05aUEQwaW85OVNwSGdsTzdrM3ZocUcyWGxW?=
 =?utf-8?B?WER0TDZkMnVDV1pJUmM3MXdBVVc5eFV3VXcyczVJMGNrUGhReGNrRll5Yzlh?=
 =?utf-8?B?bTErUURCWHVLUHpBclBpbVcwS3ZDRFQ2U0w0QS9rVFNYbGN1dU1WSW9ya1Zk?=
 =?utf-8?B?RGRZT1JJSWVuTkJvL05nMzNxekxVcmRTbnFXWGhvMmhGcWVOYkM1Wmx2SjNN?=
 =?utf-8?B?czR3V2RPUFVEQ3dSQWVkVWhkdEZSR21EVzBLNkh3QzZHVXB4b2J6YmNWL09W?=
 =?utf-8?B?c25jMUJ4K1p0cjd2bTd1cEFpV0lVK2QwQlFTbE5ZYisyTjVTejRwWW45UWw1?=
 =?utf-8?B?R1cyRTEzTld5QkVEQ0ZIRGIydTNqRFdNYzR2elZlWFpIUFpReFN1VTJkOHhP?=
 =?utf-8?B?bE5vVjJubXpncXZsczlZSHNFU042bUZhc0ZnSTgxY1c0Y0tYSG1SZUoxNzEy?=
 =?utf-8?B?dzhBY1liNXdDMlF5ZG9KM2k3SGk1eG01ZExTTXpFenN0c0lUOURlMkwvbGVC?=
 =?utf-8?B?MW9oakpNclM4Z3o3QU03VjBCNFdLdFVLaXl2bjh0eWlWUnZyUFRwTlhHbjc0?=
 =?utf-8?B?TzFGN1Y3c0ZFVWV1Y2wxbWYyOTk5dkxYSElkaXZjTkpPZnN0VkpqZytZYmRo?=
 =?utf-8?B?d0JvT3dPNGFzTkRnT1h6ajhDR0ZnQmJESU1kTTJlRzIrcVloa2tiZDVaM0Zk?=
 =?utf-8?B?SU5Rb09JQk9qTmFtdFNranM4TkRDSnVJbWxnbG9sY1h4UjA0WWQ4dG9iWnBu?=
 =?utf-8?B?Y3R5enVBRDNCd2lXRG9Hd3A1RG9UK1AyZEFEV2N4anlSdEs1YjhIS1R2dUhS?=
 =?utf-8?Q?Pqe8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWc2V3RyVGc5enQ0Y0pOeUkvRUF6UHB3Z0FJY3ovdzZYejdsVzl3UjhKK3g2?=
 =?utf-8?B?WVBJb0IwaHZQalUvaHJCVVVLcUZZLysyNXoyVzVKZmJHVHlFNHJVSXl0V2xR?=
 =?utf-8?B?S2twa1phK2J3L2NJRXVUcVJ1RnkxWHBlOUtPZklFMldReVg4WlFmandONlh1?=
 =?utf-8?B?WW1OcmFmeWhyd0U1QjdoendqTXVLM0d2TEQyeERrSWhOQmhuaG5xVmJzR0ZG?=
 =?utf-8?B?SmpCWEZ6V3prdUxzMUNaRjNGa1JPSU8wLzROOXB3STVOL25URTdaYlkzWTNi?=
 =?utf-8?B?STBxdUpac3R0SXU4ajF3dk5BTk9kL25sSk5zWXJESE15QjFmWGxIR1dFWHRz?=
 =?utf-8?B?TTZmMXU0eEhMZ2llQWdhYkcwV09rMDN1Z1VqVkloMThWT0hlWTZ5aEVVM0tG?=
 =?utf-8?B?cWx5TEpQczVuVW0rYzBWTTdzbG1UeXQweDAxejQyb1R6UkE5dVVrQjhoR2Qv?=
 =?utf-8?B?VDYzYXowaWZzREVmYnZXZk9BVHowY1dINkRKNWhPck1zdTl0MnZDNnF4ek1Q?=
 =?utf-8?B?ejAwRW0xU1VtNGRGNys4YnpFUENtRHZ6Zjc1UlRMMU82dnA4RVJSc3haRDVP?=
 =?utf-8?B?aVlWT3ZzcC9VMFk4QXNCUUovdmE5M1hROUIvb2ErLzdnbU4rVkVzdC94dE55?=
 =?utf-8?B?NzFXWGdLNEo5R0ZHdDVSUm5walhMbDJzOHFqaTM4Y1RWUWdsMFVFRnJiMXFS?=
 =?utf-8?B?b2crQlMySjQvWE1RSzMzTG5HSGZtamRuMnY1cSs5YlVWcnRyRVpzbXd4VXhW?=
 =?utf-8?B?Y0dGN0NtMXluRmFUeTcxYVBTSFZpSW80K2ZtemJUcHM2Qk55Rzc2YW9Zd29L?=
 =?utf-8?B?NWpZRkVaVmxpSGRZeFFoeFlUMFJ2K0FqNE4wc2djRTdmell1WWgzYldOQ0xx?=
 =?utf-8?B?ZkJ2ajRQaHZGVWlOd0VtYzNnKzBQeitEeTlOck93ZTFkSDA4cTJEVTRZQndt?=
 =?utf-8?B?ZEU5TkVTd1FlV1FNM1hhZGpBTGN4dzVaYzNzdE5JMS9SK1Z0ZCt1VVJqeitR?=
 =?utf-8?B?eDY0RUFFNlpzNENwemJ5SXVjOS80dUtZMjdqeUN3VSs5cW5JblVxK3hyZ3VH?=
 =?utf-8?B?NXRiNE0yQVFEUE1FditxSXA0dDl6T0RPeWxGV0J0RU5xQVVpZUxjU3VRVDFo?=
 =?utf-8?B?L0Nlai9LQ1lCQ0ZpbTZuN2YzajVQMkl0S04vVG1MR1BTdmpQRzZsZEFydnhQ?=
 =?utf-8?B?R0NBd0EvL2JUYWRpTVdyQUNBeVB6NkN6VkkxbzJwdUcwMW9YSTJDbGdMQ0oy?=
 =?utf-8?B?UHNmUUFicys3Q05RcFFiTEFzeEZlaTVqMG9COHoxMXpzSDlwZ3lUSmoyNFMr?=
 =?utf-8?B?eGxJYWVZdGJ0cnpRVUFRNk5rM3RLNHJjd3JrcHo0UzlnR1c2cEl3U05teXE4?=
 =?utf-8?B?bkhqSGJLSlpvU0EvNHBCdHBYYTZLN2NXbk1JU1k0c2RWOXZGbDdYMndwRHpR?=
 =?utf-8?B?eWhqQmI5N08waFpudGxwRHAyRlM1Q010NjNBWW5TKzdpK2lLNlRpb3FlUm9l?=
 =?utf-8?B?TVBUK29RYXBQdzliWXhsSEk0bjhPemxDSy9xUUIrSnJvSzJ6M09VKzlDa1Qy?=
 =?utf-8?B?TnZMN21vTmw1ZC9WY0lSNjJwd0FwakEzdWZsbVUrdkkrbE9wT0duMlcvUjJr?=
 =?utf-8?B?N2hRbU1WUmRmM2M0YnNVMUJSRjRubVdlYkVyaWlHWGE1YzdNNnJLUWJrOHlj?=
 =?utf-8?B?TzF1S0Q4dzVpdXllbUZ1UXo2YWdrS2Z4dS9XUFo4S0tLMmtob2xOVWRpUXFO?=
 =?utf-8?B?OEFUNEVDQzRZNG9HRUhMS2xEamcxWFV2ZFVKTXIxdjBXSGFScHpFbGVjb2dT?=
 =?utf-8?B?VzJDWm1qUU11bGFlR1VTMERZMHlkZy9VVEhFNVlidGN3c0VMNWJsbFVFak1Y?=
 =?utf-8?B?TFZ2WVp1N0xKTDhKUkFwR09kTDF6dGNoSDlJZy9CTE5KQUI1MlNReHJ2VXNy?=
 =?utf-8?B?alNPVTFIUWo5bnN6eFJNSGZlR1BjQllRWTFONUViSkg0ZXpIdzN5QlJRZUJk?=
 =?utf-8?B?WUV0bFk4N0RraFpWaXFuYUxVbk4zaEdac0xMTXAxTHo4YnVYYmpuMmdxUmlj?=
 =?utf-8?B?cUNGMGFUSUMraE1hU1FiVFNYTnExb2p5QTRiRExYWHcvc0x2M2tweG9nZjFL?=
 =?utf-8?B?VkE4dDJ3QVo1bXpLRGYrMDlqVkUwdlZYdDdKUUs0TXQzeEd1WnNsS1VLY1ll?=
 =?utf-8?B?NTNRL01WeEZGSjdjaWE2VHhhVyt4NENyM0NaczlwaHlncEY0MnBBS3V1K2tt?=
 =?utf-8?B?S1FiNG9CTU5Ua0dTYkt3TnlwWjRGWDZ4bHprMnFyQkpIVzFsQ2k3REltOU1W?=
 =?utf-8?B?UHk3cjhrc2xMNWVIcXBaZStoQnRUemVESVZoVkRVWkVpQTkxYVVQQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11bedc02-a5de-4665-147f-08de63fe5296
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:01:49.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZFzs5NT/N1jJwTPlvSz9EkQt41TG+4L4in4mX/HxVWtt066EBLVJbaCxCEe+hWgD7oDl1IomDC14A/23JXZqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7071
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6F89EE7C91
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 03:20:09PM +0100, Andrew Cooper wrote:
> On 04/02/2026 12:25 pm, Roger Pau Monne wrote:
> > The limitation of shared_info being allocated below 4G to fit in the
> > start_info field only applies to 32bit PV guests.  On 64bit PV guests the
> > start_info field is 64bits wide.  HVM guests don't use start_info at all.
> 
> All shared info?  HVM does use it, but doesn't see the MFN.

HVM guest use shared_info, but not start_info.  The issue is not with
shared_info itself, but the size of the field used to store
shared_info in start_info.

HVM doesn't use start_info, and hence doesn't care about the position
of shared_info in that regard.

> >
> > Drop the restriction in arch_domain_create() and instead free and
> > re-allocate the page from memory below 4G if needed in switch_compat(),
> > when the guest is set to run in 32bit PV mode.
> >
> > Fixes: 3cadc0469d5c ("x86_64: shared_info must be allocated below 4GB as it is advertised to 32-bit guests via a 32-bit machine address field in start_info.")
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/domain.c    |  7 ++++---
> >  xen/arch/x86/pv/domain.c | 20 ++++++++++++++++++++
> >  xen/common/domain.c      |  2 +-
> >  xen/include/xen/domain.h |  2 ++
> >  4 files changed, 27 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index edb76366b596..3e701f2146c9 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -882,10 +882,11 @@ int arch_domain_create(struct domain *d,
> >          goto fail;
> >  
> >      /*
> > -     * The shared_info machine address must fit in a 32-bit field within a
> > -     * 32-bit guest's start_info structure. Hence we specify MEMF_bits(32).
> > +     * For 32bit PV guests the shared_info machine address must fit in a 32-bit
> > +     * field within the guest's start_info structure.  We might need to free
> > +     * and allocate later if the guest turns out to be a 32bit PV one.
> >       */
> > -    if ( (d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32))) == NULL )
> > +    if ( (d->shared_info = alloc_xenheap_page()) == NULL )
> >          goto fail;
> >  
> 
> The comment is now out of place when the source is read naturally.  I'd
> suggest dropping the comment entirely, and ...
> 
> >      clear_page(d->shared_info);
> > diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> > index 01499582d2d6..8ced3d70a52f 100644
> > --- a/xen/arch/x86/pv/domain.c
> > +++ b/xen/arch/x86/pv/domain.c
> > @@ -247,6 +247,26 @@ int switch_compat(struct domain *d)
> >      d->arch.has_32bit_shinfo = 1;
> >      d->arch.pv.is_32bit = true;
> >  
> > +    /* Check whether the shared_info page needs to be moved below 4G. */
> 
> ... extending this one talking about the 32bit field.

Hm, yes, I've considered doing that.  Unless Jan objects I will move
the comment then, seeing as you also think it's best.

> > +    if ( virt_to_maddr(d->shared_info) >> 32 )
> > +    {
> > +        shared_info_t *prev = d->shared_info;
> > +
> > +        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
> > +        if ( !d->shared_info )
> > +        {
> > +            d->shared_info = prev;
> > +            rc = -ENOMEM;
> > +            goto undo_and_fail;
> > +        }
> > +        put_page(virt_to_page(prev));
> > +        clear_page(d->shared_info);
> 
> I think copy_page() would be more appropriate.  That way there are fewer
> implicit ordering dependencies.

Hm, I had a copy_page() initially, but I don't think it's appropriate
because (most of?) the fields will need translation.  I don't think
translation is feasible, but I could at least call
update_domain_wallclock_time() which is what hvm_latch_shinfo_size()
does when changing bitness.

> > +        share_xen_page_with_guest(virt_to_page(d->shared_info), d, SHARE_rw);
> > +        /* Ensure all references to the old shared_info page are dropped. */
> > +        for_each_vcpu( d, v )
> > +            vcpu_info_reset(v);
> 
> switch_compat() can only occur on a domain with no memory.  How can we
> have outstanding references?

As Jan pointed out, it's not references, but stashed pointers to the
previous shared_info page.  I've used the wrong wording here.

Thanks, Roger.

