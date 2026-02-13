Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id obG5FM9wj2nPQwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 19:43:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979A7139004
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 19:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231662.1536730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqy87-0003mx-UT; Fri, 13 Feb 2026 18:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231662.1536730; Fri, 13 Feb 2026 18:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqy87-0003jv-Rj; Fri, 13 Feb 2026 18:43:03 +0000
Received: by outflank-mailman (input) for mailman id 1231662;
 Fri, 13 Feb 2026 18:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/W2=AR=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vqy86-0003jp-02
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 18:43:02 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf1c1be3-090b-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 19:42:56 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH2PR03MB5366.namprd03.prod.outlook.com (2603:10b6:610:96::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 18:42:51 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.017; Fri, 13 Feb 2026
 18:42:51 +0000
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
X-Inumbo-ID: cf1c1be3-090b-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jexJNQSuqlqtXBHF5tzUigNPKNkyDdD+yuIXHP/yn80lkiWelFYhMcbVESv72eAKDywmRTPuMHopM69M6nDLvYtnlVuceUPNVeeUv/ipszQbbfATFfRCgzKomAf7RnIs4pv9X2bWpXRZDZpHP62avLF4A5o9uOqtGkd0vF3iyZ074TBNH616fBQLTcRpT2CIGYo603VVH/bU53SKI+/hX3XPnKcvpBoPMaDxVzVu+xEjv8x469cQFgFCzyo1Qcw+lwBsHYTPJVsiNo5KHjcQ+DD8zi0E66S2Ej6BAIzBsWuojGhOaRHMfjjzgtNXtJlD80PCPssmsxKtdKvRk5H21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4meaxsuWLoprTmwZZl+f6xnyyMeyMX19j3rlVZzJBLQ=;
 b=HtSwTEtOEz7oguQYH4XRnE8P+ht9+9ekhlT2li2c7m0WBsV4W5GrnMzujxv5K39z/6wiKJYZ+k80l9t1mlUveBZrlxqbSiVoY4Gm2o+77K71TSvCFvRIZbwGJqToxiSsfrHGAXo1Ku3SsL6tZq9DOTUN42/QSURpaXfNS6T+xqeNFP1l/F8WaB3S/2QffIzT8wSnoCDaYmAPk4Sa8OoF+k0CqtbpfRdeY/lbGuy+TcTJydq/qyiWadzoAgvBEIv/eBRYQrT+qWjMUx+6bi/mgWWHJjJeKqvdM6KymS3mAiPtznZ9ndkW7VQTg7yNpH8/K48YRhe8dEzTqJ7BrrsNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4meaxsuWLoprTmwZZl+f6xnyyMeyMX19j3rlVZzJBLQ=;
 b=YNxliJYsVr1kG35PPV7Snz/lB15Wlq13sVdyjxPdy3NSobwNIXivR3FCsmJqFTLdX+EBYWPAc9G8KWXix9KMJqUzz2WVhM/vDYcg12FWIdOtmw/fFwKI9pulbWEaOe7iRpgkenjGpPCU35/DLpWq+2dqZYoBOFw1euWT88Qkjjg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Feb 2026 19:42:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/2] x86: Force HAP to be enabled when PV and shadow
 paging are compiled out
Message-ID: <aY9wqBi9xKQv9tiQ@Mac.lan>
References: <20260213133732.132326-1-alejandro.garciavallejo@amd.com>
 <20260213133732.132326-3-alejandro.garciavallejo@amd.com>
 <aY8-wlXW6Y90vvOv@Mac.lan>
 <DGE0GZ9SPVXI.13JZK2Q4WWG8@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGE0GZ9SPVXI.13JZK2Q4WWG8@amd.com>
X-ClientProxiedBy: MA3P292CA0069.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::9) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH2PR03MB5366:EE_
X-MS-Office365-Filtering-Correlation-Id: 48edce7b-e5e3-4c33-f3e2-08de6b2fb13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QU1RVndBZ1dyVmhxMW9PN3FKUjdob2loZ1RPdkk4WVYwME1qeGUxdFhQV0F6?=
 =?utf-8?B?eSs2bjZKTVBwUmREc2x4enRMcE5nOVRWWFRpSEJXYWhUYTVsb0Y0aEV5NFpK?=
 =?utf-8?B?SU9jSXFHendKYy9KWW4yS09DUUpOcDlNZ0dmVHh0L2t3VW9mR2RUZG1NZzhE?=
 =?utf-8?B?cytEcXdwZ2hSZm15RXFSOFQ1ZUJPeEJmbzVWZEdJKzdseWxlY0Zib3N6dXRz?=
 =?utf-8?B?Rmo5NHVpbko5UTJWTkNhOVVsL1NmbGRiSy9hTXcyRHhrUUVFTkNjcEhQOWZw?=
 =?utf-8?B?eW96cFBTcDl4N3hDNVQxNTVidUEvc05XZnJwTEVyUGs5UXRQYzBJMzdIZ1N5?=
 =?utf-8?B?TUlxNHRCN3lINzJwZ2xYVmVtTkRVQWNlRGlyYWxyQStKQmdmWDFSSWhPc0xn?=
 =?utf-8?B?S3BrMDBMN0lJL1lvUWE4UUVPS0hIbzlRcDJmYU8wOE1sTW1ndXlKQ0gwUGZP?=
 =?utf-8?B?RUMyWTBuZktwMDRqMzNzcmF5d04reGdXTGxFRnJSTWU4dmNzUFFMelFYd2NF?=
 =?utf-8?B?VzFheFRWWnBLWWtTdkRPaHpub0JUN1dGQ3d4TXYrUU5ES3ZRSkdqWkN4MmpU?=
 =?utf-8?B?bmEwWjVHT1N2WGxvVlk4dEFqY2ZxeVovYnRJeGpObVJWNWZFRFlLdGlmOVhu?=
 =?utf-8?B?eU11M1YzZ1RxS09QUTVWczlaN0g2ZE5EemdGdkREVTlLd1pSZC9UTkJzMms2?=
 =?utf-8?B?QmNWUzlXRGJobkdUV0d1bWgwNWpOQ3o1VG0xd0J2Q1A4aEgzSHJtOVduVm9V?=
 =?utf-8?B?YWNxdU8xcmFDSk9ZRDhHaEhqcnoyWGxmSm1rOGdnMVozVzVDRm5JMnM5WVZQ?=
 =?utf-8?B?dElaMktxbkM1c3JISGEzRHhvMzQ4QjVwSDVvcVpTaVhaVWFNTUxLS2lVYSt4?=
 =?utf-8?B?YkNIcGIyT09HUitOditNNEJVL2w4U2ZYWXlxZEFESUpTTG5semlROHpZeGNu?=
 =?utf-8?B?dU16ZzhzRlR5TUNiNFkrVzdmekM0ajlUOW1IVnd1Q1hKemFzNlpsYjU1TVBL?=
 =?utf-8?B?TUM5YjhVWFdWb2JXVVJHclhtdjZuQ21zL1JacG5lank2bzd0Ly9Ma1h3TlA5?=
 =?utf-8?B?a2x3RVpva2tTNkJVd09MY1AxUDc2OVRaZU04V1NLRlQ4SGFKdDlwODN3U244?=
 =?utf-8?B?d1ZmWTRmZjlXUzFYK2xzdlBXQlJzWXJBd1A1eHNSVGh6S1hFQjR0bTJOaEVL?=
 =?utf-8?B?UFRDWm1XQ0pXR3h5b1p1RmFuMzZSdGRvZlhjejhQVlRDNzJwZ1AwVXBMTm9E?=
 =?utf-8?B?QjNHbHFtaVJuRllnWW5EVjFpTE1UTEFpMEVvaUlwaHNhWHdXMmgxUHpuTkNH?=
 =?utf-8?B?VGNWWDVwVUJVOG13dllyMUt2M2d1RnF1TmZsOHhheGN1WDdueTVMdXRkUWxE?=
 =?utf-8?B?N0tJaTJROUVabFlONFNhZnlBOUF6eU1qMEJEYkdSaTF2WlZ2WEg4T1lFbExq?=
 =?utf-8?B?VnhnanBIL1VRcjEwU2xBMnVVQTNocGx1R2NKTytFSWNzdlFteGo5RGlJTVBH?=
 =?utf-8?B?OUJBYWJCWTJ6RC9ZZFZuM1d3U0VlMmdpWm9ZRFEwS05TNjY3T3RXSGZRUWl0?=
 =?utf-8?B?Y3dVN256Y09uSnplVDh3djJMazZCY0RjemduWVBQa2FYczI2ZHZ4SVJrUzRX?=
 =?utf-8?B?Z2hhR2lUVzA4YnpWa0E4Z05OeDY0SDNOdWdEeUZHc2hCQUZTb3JEMnd4RU8x?=
 =?utf-8?B?c2xvNTMvUk9qcTdWTTEzZXZ0WkpMT0xFclpkUlhQL2J0bmNPMHUwblhNb3l2?=
 =?utf-8?B?R3kzTDFxbTNBOERUMzZvMnJDd25DOGRmQnUrM3N3MkZIS0d5UDFlSTllR0JG?=
 =?utf-8?B?NXY1WW9JcVdlZk0xQzgwYXRscHM3Q3EwZnZRaEpjU3N6eCtsV1dFbFYycHIy?=
 =?utf-8?B?blM0N0hqVHNrUmN4VG5NZlJzSy9wVHNZa0UraEFFdEtOV3JzUHJzaWJCWDF4?=
 =?utf-8?B?RFkybzUxbVdqSXpHR3B5NkFkY3V2OGVqSmhoWTM5dGtab2hxdEoxV3MvaHMv?=
 =?utf-8?B?VlViUU9NMXBBbnpzS2lWUEkvSkxIRTZidjVGc2EzNlFLMDRzb0RnQXFZT0lM?=
 =?utf-8?B?aGhuRnVuanBCTHZXOUxrUGZQYk4ybkxZQ2djdzdQRXhZeXo2NEdEUVVrSzBB?=
 =?utf-8?Q?paec=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTZIN1FxUG1EL3BlWUd2eG45V2cram90TUIvZ1ZRYjdOanZWYWRNb2pmSkdM?=
 =?utf-8?B?eG5tdjhFdmFaZzBQZDVIenNqTWx0VzV1Z3BVTll3UVF0RTFtNzdVeGoxbVFr?=
 =?utf-8?B?azlsZytZQnBMZ1lMNFFPQW9Tc2tRT283dzBjRlA5ak5xSXR1NWpXczVvUlNv?=
 =?utf-8?B?cVJHQUZObzFZNEl4R1o1UW1RM2hqam8vUUsxR2lJN3dINkordkVyM3FWZld1?=
 =?utf-8?B?NTRkWlFPWkVJQmd1L2lvU1dreEo3YklBdkoyQ3FMNTNEa3V6c0plOFdTczMr?=
 =?utf-8?B?cG1JeTBXRWphd0J4L0JzUU1VRWdZZjloSEtJL2NmbWROWm5XM09mMnhMOXY2?=
 =?utf-8?B?Qk93LzMwbllPNDZiVDhPb1Y4UmgxUmJaeEgvMEhreXliWTRuWkdhOStrdTFO?=
 =?utf-8?B?b2NyR3pzL1hzWWVpV2F0aVR1eVNzd3gxdzJCMHRXTUNkdlJrNi9mYVU2TGc0?=
 =?utf-8?B?M1dXYXJqa0Jnd29yc2I5TmJ0QzZGd1NHeFBlYnZFQno1bTIxbE96ZXhmMTR6?=
 =?utf-8?B?NnljNUVPSElXYVNrWW1aZVZVdVE1a1ZnRFRMSVdEQlBPMWpHcXhvYzRienNj?=
 =?utf-8?B?V0RqMmVpZllxM2pnSU9rNHhwZzZUUWdhZnRTYzZmR0dVeVBjWTByVEI0UDdn?=
 =?utf-8?B?SGRldjFiN1FIN2pJbUk4dzNERFMxaGM1b1B1OGZocEJPN0NwUit1djdrbXRF?=
 =?utf-8?B?bjIydzJVWVozSER6WXZxK1poYzk5QmtiTVJNSUZqWXVwd3lpWmlkVkVlTmMw?=
 =?utf-8?B?ZUN2UVFKT3Zxd1RPRmIyUXc1cEZxUE1NOUtaUGVsaXBBWDcrb1ZFR2ZFc25w?=
 =?utf-8?B?MjV4eUVmczF5eTlSL21SKzBCbWd6UGp3OG5kWWlYSGF0eStlRUVpalJuR25i?=
 =?utf-8?B?MmxjdVMzUi9JK3dZZGYwQWZyejFKMnJRdlUreldGZ1M1V05iQ0VuaTdaT0Uv?=
 =?utf-8?B?Njc2OG90MjFTV05HOGJ4RHZ3cnV6OVhMODZ3QjFuUEZTekhTLzV5eUJEWlFQ?=
 =?utf-8?B?MXY5ZWdoMmd5RmJjVXV1a2dhU3BVcVdSQ2tjZVFSUUp4QnpZYm9YdHVzRFVm?=
 =?utf-8?B?RHAvUkJmS2tyazUvOEhUZGRlNElpd2kvSVN4Sms2YWhnT285Z3FDSVloV0JN?=
 =?utf-8?B?VnhzdFRIaVpaUHhSL0tFOFc3OGlnYUtnOEZ5a09tcG1lMVZDMVZVejlpbVRX?=
 =?utf-8?B?dUZSNHVsL3Fad3N6U0p0d1lWQUFXRWJEZFlsaE1DenhnRlJZeU9VZk1pODRT?=
 =?utf-8?B?RkUzc0tkN3REcXF4UFhjUnFoT3c3N056ZDFSblppYmxiNitiRUpITitIbkxH?=
 =?utf-8?B?TDQ4TE5wY1o1Nm1heWxxUjF3S2tFYlJ6VmJKUFF0NGpEanlLQzQvQi9vTVBw?=
 =?utf-8?B?dStLL242SVhtTCtrdm4zalY4Rkt5d1h3ZjRJSFhTSFhnMjkyeDExeStBUVAv?=
 =?utf-8?B?emhqKzR1elJtNGZTVi91elMxdVZzZmlaaDNSSFp5d013emo3OFNTUlNwQk9X?=
 =?utf-8?B?WEF4bDBNNXhBT2RtSklVT2hWS1NXOS84eWVkU3V0dk5rVnhXTzF3S2R0L3Fa?=
 =?utf-8?B?SUg2ZjB1VlRmcE9UTHNKRGxDUEVoNW9RVlhXWmZ1d3BSeU5VOFEvYnVQRlpQ?=
 =?utf-8?B?RWdaS3VkMm5MVFRENHF1SFpoT1pPcDFodU15YndIMFUwYkJJYlFHQXR6bWJB?=
 =?utf-8?B?UVU1ZVQvUG9MQTdzUmt3eXRMcWJnMndJSU1kcUFlU3NOam5BNUdZUUgxeFJm?=
 =?utf-8?B?eG4vbExMRXNrWG56RmNNdlFOcXpkZVo2MUVkUUV4bkIyMXd0cGErT0t5ZzJm?=
 =?utf-8?B?TnFWajhxeURWeFRZRTY2QTRuMDVyaXg3TEFabENXamF5Y1pRNkFscElWdlpi?=
 =?utf-8?B?ejhtc1VsdUYxMVJhb2VvZnEzaW9FTXpwVmZpeFhzTVptQm9ETklqaDE3MlN6?=
 =?utf-8?B?aDNYOE1OWjZIYmMvNGlvcWx3Q2NZVlB6NERadmU5S2xoS0kxQk8zc1liNlFF?=
 =?utf-8?B?M094ejJNWmUwREZoekcyY21SckJmUXg4bisrZGhVZllTd1BqMWwzVU02WEFD?=
 =?utf-8?B?OG1WY0JlUURSOUNlN0lUTzBuanhQNGJTaXVYOHVsL1JtQVpIamJ4a3l5RXlv?=
 =?utf-8?B?bFNVTTUwUHFTa2lEQ1dBVzIwZUFaMTZXZXdMSm1HOHp5NnZUS0xpU3ZWNmdt?=
 =?utf-8?B?dktwMlJHUEl2c3NiMlo2RU5iV3JWVUVIcy8yM2lqSWQ4cGxKWjhpNVRYWDY1?=
 =?utf-8?B?OFlUUDM2MkFDeEJFeWh0Vk82cDBMWTBiT2hXV1RvaFpkYTB4d0d5ZnhIQ1cv?=
 =?utf-8?B?aEpoeWN4WkkzYVVIWjNDZWtPSG1BOGE3MW56TEFOMXVLOEpyMlU3QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48edce7b-e5e3-4c33-f3e2-08de6b2fb13d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 18:42:51.6497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jky0Uqofp/nq/jXgZwAvWHe7fB/LjQhwEHnynLyhdon2dH8C2ROuhG2SRh22Mgb9BQpszwsKeKiNC/n9K4dyHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5366
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 979A7139004
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 06:30:54PM +0100, Alejandro Vallejo wrote:
> On Fri Feb 13, 2026 at 4:09 PM CET, Roger Pau Monné wrote:
> > On Fri, Feb 13, 2026 at 02:37:30PM +0100, Alejandro Vallejo wrote:
> >> Makes hap_enabled() a compile-time constant. This removes a number
> >> of hooks that normally go reach onto shadow paging code, clears
> >> many branches in a number of places and generally improves codegen
> >> throughout.
> >> 
> >> Take the chance to fully remove the shadow/ folder as it's now fully
> >> compiled out.
> >> 
> >> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> >> ---
> >> bloat-o-meter against prior commit (defconfig:-pv,-shadow on both):
> >> 
> >>   add/remove: 0/12 grow/shrink: 2/31 up/down: 67/-1609 (-1542)
> >>   Function                                     old     new   delta
> >>   unmap_mmio_regions                          1340    1374     +34
> >>   map_mmio_regions                             211     244     +33
> >>   opt_hap_enabled                                1       -      -1
> >>   shadow_vcpu_init                               2       -      -2
> >>   __setup_str_opt_hap_enabled                    4       -      -4
> >>   _update_paging_modes                           6       -      -6
> >>   _toggle_log_dirty                              6       -      -6
> >>   _clean_dirty_bitmap                            6       -      -6
> >>   cpuid_viridian_leaves                        728     714     -14
> >>   iommu_domain_init                            291     276     -15
> >>   p2m_pt_change_entry_type_global              214     198     -16
> >>   paging_teardown                               91      74     -17
> >>   paging_set_allocation                        384     367     -17
> >>   paging_enable                                 76      59     -17
> >>   p2m_init_one                                 295     278     -17
> >>   ept_sync_domain                              201     184     -17
> >>   arch_set_paging_mempool_size                 437     420     -17
> >>   p2m_free_one                                  78      59     -19
> >>   paging_vcpu_teardown                          36      15     -21
> >>   p2m_pt_init                                  125     104     -21
> >>   p2m_pt_change_entry_type_range               218     197     -21
> >>   arch_do_physinfo                              76      53     -23
> >>   sh_none_ops                                   24       -     -24
> >>   paging_final_teardown                        134     110     -24
> >>   __setup_opt_hap_enabled                       24       -     -24
> >>   paging_vcpu_init                              41      15     -26
> >>   paging_domain_init                           167     141     -26
> >>   p2m_mem_access_sanity_check                   71      42     -29
> >>   hvm_enable                                   449     419     -30
> >>   init_guest_cpu_policies                     1247    1213     -34
> >>   paging_domctl                               3357    3318     -39
> >>   __start_xen                                 9456    9416     -40
> >>   arch_sanitise_domain_config                  794     747     -47
> >>   symbols_offsets                            29636   29588     -48
> >>   p2m_set_entry                                305     247     -58
> >>   guest_cpuid                                 1919    1858     -61
> >>   ept_dump_p2m_table                           817     751     -66
> >>   recalculate_cpuid_policy                     874     806     -68
> >>   shadow_domain_init                            71       -     -71
> >>   mmio_order                                    73       -     -73
> >>   hvm_shadow_max_featuremask                    76       -     -76
> >>   hvm_shadow_def_featuremask                    76       -     -76
> >>   dm_op                                       3594    3510     -84
> >>   symbols_sorted_offsets                     58464   58368     -96
> >>   symbols_names                             103425  103213    -212
> >>   Total: Before=3644618, After=3643076, chg -0.04%
> >> ---
> >>  xen/arch/x86/Kconfig               | 2 ++
> >>  xen/arch/x86/hvm/Kconfig           | 3 +++
> >>  xen/arch/x86/hvm/hvm.c             | 8 ++++++++
> >>  xen/arch/x86/include/asm/hvm/hvm.h | 2 +-
> >>  xen/arch/x86/mm/Makefile           | 2 +-
> >>  xen/include/xen/sched.h            | 3 +++
> >>  6 files changed, 18 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> >> index 2ce4747f6e..190f419720 100644
> >> --- a/xen/arch/x86/Kconfig
> >> +++ b/xen/arch/x86/Kconfig
> >> @@ -67,6 +67,7 @@ source "arch/Kconfig"
> >>  config PV
> >>  	def_bool y
> >>  	prompt "PV support"
> >> +	select OPT_HAP
> >>  	help
> >>  	  Interfaces to support PV domains. These require guest kernel support
> >>  	  to run as a PV guest, but don't require any specific hardware support.
> >> @@ -147,6 +148,7 @@ config SHADOW_PAGING
> >>  	bool "Shadow Paging"
> >>  	default !PV_SHIM_EXCLUSIVE
> >>  	depends on PV || HVM
> >> +	select OPT_HAP
> >>  	help
> >>  	  Shadow paging is a software alternative to hardware paging support
> >>  	  (Intel EPT, AMD NPT).
> >> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> >> index f32bf5cbb7..310e09847b 100644
> >> --- a/xen/arch/x86/hvm/Kconfig
> >> +++ b/xen/arch/x86/hvm/Kconfig
> >> @@ -92,4 +92,7 @@ config MEM_SHARING
> >>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
> >>  	depends on INTEL_VMX
> >>  
> >> +config OPT_HAP
> >> +	bool
> >
> > Can't you define this outside of Kconfig, like:
> >
> > #define HAP_ONLY_BUILD (!IS_ENABLED(CONFIG_PV) && !IS_ENABLED(CONFIG_SHADOW_PAGING))
> 
> Sure.
> 
> >
> > HAP_ONLY_BUILD is likely not the best name.  Maybe CONFIG_HAP_REQUIRED
> > or some such?  (Seeing the usage below)
> 
> Definitely not CONFIG_*, or it'd be an accident about to happen when mistakenly
> used on IS_ENABLED(). HAP_EXCLUSIVE?

I would prefer HAP_REQUIRED, but that's a question of taste.  Both
would be used in the same way.

We have some CONFIG_ defines that won't work with IS_ENABLED()
already, but let's not propagate that further.

> >
> > FWIW, with the current naming I've assume this was supposed to mean
> > "Option HAP" or some such, when is "HAP is Optional".  We usually use
> 
> It was. Originally it had a help message and a default, but I quickly noticed
> that served no purpose. It has that weird polarity so the build would remain
> with new options being additive only.
> 
> In retrospect it can go back to a more natural HAP_EXCLUSIVE that removes
> a bunch of !s in the code.
> 
> > "opt" as a shortcut for "option" in several places on the Xen code
> > base, like "opt_hap_enabled".  I also think using it in the positive
> > for so the variable meaning "required" instead of "optional" makes
> > some of the logic easier to follow below.
> 
> It does, but in Kconfig it's nicer if an option being enabled yields a strictly
> more capable hypervisor, I think. Makes allyesconfig and allnoconfig work as
> intended.

Oh, I see.  Moving it out of Kconfig makes even more sense I think.

> >> +
> >>          return false;
> >>      }
> >>  
> >> +#ifdef CONFIG_OPT_HAP
> >>      if ( !opt_hap_enabled )
> >
> > You could possibly do:
> >
> > #ifdef CONFIG_OPT_HAP
> > /* Xen command-line option to enable HAP */
> > static bool __initdata opt_hap_enabled = true;
> > boolean_param("hap", opt_hap_enabled);
> > #else /* CONFIG_OPT_HAP */
> > # define opt_hap_enabled true
> > #endif /* !CONFIG_OPT_HAP */
> >
> > Above, and avoid the ifdefs here?
> 
> Whatever poison you prefer. It's just ugliness motion.

Yeah, at least this keeps all the ifdefs mostly in the same visual
region.

> >
> >>      {
> >>          fns->caps.hap = false;
> >>          printk("HVM: Hardware Assisted Paging (HAP) detected but disabled\n");
> >>          return false;
> >>      }
> >> +#endif /* CONFIG_OPT_HAP */
> >>  
> >>      return true;
> >>  }
> >> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> >> index dc609bf4cb..b330d65d6d 100644
> >> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> >> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> >> @@ -703,7 +703,7 @@ static inline bool hvm_is_singlestep_supported(void)
> >>  
> >>  static inline bool hvm_hap_supported(void)
> >>  {
> >> -    return hvm_funcs.caps.hap;
> >> +    return !IS_ENABLED(CONFIG_OPT_HAP) ?: hvm_funcs.caps.hap;
> >
> > return CONFIG_HAP_REQUIRED ?: hvm_funcs.caps.hap;
> >
> > IMO is easier to read (same below for the hap_enabled() early return).
> >
> >>  }
> >>  
> >>  /* returns true if hardware supports alternate p2m's */
> >> diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
> >> index 960f6e8409..64fde82c50 100644
> >> --- a/xen/arch/x86/mm/Makefile
> >> +++ b/xen/arch/x86/mm/Makefile
> >> @@ -1,4 +1,4 @@
> >> -obj-y += shadow/
> >> +obj-$(CONFIG_OPT_HAP) += shadow/
> >
> > I think you can use:
> >
> > obj-$(findstring y,$(CONFIG_PV) $(CONFIG_SHADOW_PAGING)) += ...
> 
> Hmmm. I guess I shouldn't just include it twice, like we do for other .o files.

I see, so use:

obj-$(CONFIG_PV) += shadow/
obj-$(CONFIG_SHADOW_PAGING) += shadow/

Maybe that's simpler really, and it's a pattern we already use
elsewhere.

Thanks, Roger.

