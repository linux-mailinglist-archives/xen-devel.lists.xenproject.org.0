Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPqwMWjOhGk45QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:07:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9ECF5AA0
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222271.1530268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2pB-0002mo-Cp; Thu, 05 Feb 2026 17:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222271.1530268; Thu, 05 Feb 2026 17:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2pB-0002jh-9Y; Thu, 05 Feb 2026 17:07:25 +0000
Received: by outflank-mailman (input) for mailman id 1222271;
 Thu, 05 Feb 2026 17:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqXU=AJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vo2p9-0002jb-G7
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 17:07:23 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ca27532-02b5-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 18:07:13 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Thu, 5 Feb
 2026 17:07:02 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 17:07:02 +0000
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
X-Inumbo-ID: 1ca27532-02b5-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=unDFw0e1gKno2sC/nGqDTVEP4RYSzF7ofLaIUqdgb3ZJH5hDGE0n6wTCzgYoa3vTnmSAHO3Q6WwYDpYRB3s3E+D5m3ltLt3jVbnyQBonTyZkeK/Zel2MIXKDcE/mfqcSetx/UrkS5uzgXM66Etm5vbYirmYxF9owMgsTWcsQyHOTRBVuTov3GpoGRnzNSfUoiFBq2bQIGhaOMtME1F6koWhmp1QJR/MVnncuDXFxu8xJ58C9QGavmsYIe3N0Mo73DKPPt1++3vDUb3nu6P4mcOEPgxUsLq0TDBTsey1+spB0s++B3NW0emZOPNkKKFF37pYB2Tp0McN8l44/zfd9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFe9E+J28HPWXB1sL4ayUNH0zJUfEmo73nL+XIVOAaU=;
 b=jYQnhJaNlLxpyhhmNt/xMuZMS8lUgc+BVLso1RbGp/qMJqlUzA/dN3ZQgJnGtJerPz7W0pb6tGPBoypxPZHOahiysRtpYLfWtDxWnDynQoKT7BSeinboiSX9NVz80gixPjau/m4mxXlg0VgD4nsPSG/3sW9r8F1+ZwoNAjTTzUPPaueJNDgieq5TDuEUUpNimgMWOhdWW+cnUUFKdn3t/72cj34UX0cU3/2E54b7HzRAzFLF+foer2Too0vu65fHRD23u0lNUp+a3w0Yx94g9RkL6zRee3k8ty1XAqUjzRnwuDMb4pIMQ5RGl11TJKjCFIWomO9AfW5VTnMzv0Xakg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFe9E+J28HPWXB1sL4ayUNH0zJUfEmo73nL+XIVOAaU=;
 b=TxRBcZssxPocN5LKxr7HnA24Eqv2i1recLttx54v/NxaQtpTVbCjodMSVq3dbRGxk2QsBJPwIpe30IKWTENK1JkSTvjKRC8QTnnDaZ4KBqqEPr8ED52Igs6T54gs4U8vkO5tW9hudgN+ENk9EYlOkVfvMM0KYoLC3l4pE7+EngM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 5 Feb 2026 18:07:00 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
Message-ID: <aYTONBslOYwyrFqM@Mac.lan>
References: <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
X-ClientProxiedBy: MA2P292CA0005.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::8)
 To CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DM4PR03MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: bda05559-9ee6-4b64-3437-08de64d8fb4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3lwbkhOeHVSTUJ6TXA0U2ZJenNEYXdVekNyMnZTOXRFVUp2aDQ4c0VyZmZv?=
 =?utf-8?B?REt1eEhLVjZpaHpyTDdEUG5sWG5Kbk8xRlR4ZTlUR0tnVzhiZVdYdnhVM2Yv?=
 =?utf-8?B?R3VEMmxZM3FBOFg5M1ZnazV5RnBuVmw2SWVydGhMWkpqajJEL05OUUlwNFVy?=
 =?utf-8?B?akhJdVBnT2p1SkJzRVVuM1kxYytwOWs4Qnd0VVB3aXNZa2lLdFUxb0tCQXlG?=
 =?utf-8?B?MnVtc2hyOWVVZG1PTWlpNUFFbUpUVlROa0JrdXRiL3dVZ0UwUGwwdjZzdmRW?=
 =?utf-8?B?UEtCbEQvbk9XYUl5c1orUmhETU1CT0xTUW1FMHhGQTJRRFh6cUdNTWF5Tlh1?=
 =?utf-8?B?SVNIaytab1lDUjBRQThJQzlrdmNVZG5zMUFYMHlrZjkyZ013MVo0bjNkNlp5?=
 =?utf-8?B?ZkhhaVVOdFhNS3pYTzNTNkV1NEJZSTVGNWZ0ZkJkWUdXbnJxS1VMeUlDZ2lN?=
 =?utf-8?B?ekRLNkpIbTJmQ05ORUVBcDg0U21TN0FlN05yVy9UNVlRcGlLbFVIb3NUbGVU?=
 =?utf-8?B?TjVCV0hlUktmREdmSUpjQjVZdjhEMWtoVUE2TGJuWi9OdlRFQktTQ1FOU0FM?=
 =?utf-8?B?NEsrdnpHSVduWElFMU1GcmpqL2gzQ2dtTjNSNithQ3ZOTUlBSnhsa0xoNVBI?=
 =?utf-8?B?TVJ5T0N0bm12V042UnpkSjVSdGx2QlpmaE1FcGRiejA2NDRHT3IvTXdmbUVZ?=
 =?utf-8?B?ZDkwOTFBTWpXdWtuYWwxckZLa3VvSHBQcFF2WnpyQmd6UE0vV3VCQjFwcjJ3?=
 =?utf-8?B?emc3WWt3OVJqOXRiODZXT2lqUkp3ZDc0MC9qUitBRHlqVkhXQm8yQVZrSnVU?=
 =?utf-8?B?SzVpMW5TVnA3RXZpS3pqWU96QnJCdWZReVJsT3FWdjluMUlQT015ZTEzNUdC?=
 =?utf-8?B?cUhGVWtBL3daS2RxVGJHMGRLSytPRHZwSFBEZi9LazZMTWdZa1FucGZRV0JP?=
 =?utf-8?B?c3M5OFJMNHRnQTNvTTlhN2dINlluVU1JLzlhNXJpeElSL2pkc0dMaWFHYlFW?=
 =?utf-8?B?QW1BUThUN1NucGx3T1FWcWVxWnFQdm5UcmhybkczSzJEZ0xWUW1TMVVRdFA5?=
 =?utf-8?B?blBDMmdicWdVR01vWC9KUTdkWlhDOFowTElOZVRhTER5eWNvVWxLS2hwRXhn?=
 =?utf-8?B?V0pGT0Q1aVBFeTM0RWZaejR1VUxuWFVmMHZIU2xLa2RTUllFaUxLbjZ1akh6?=
 =?utf-8?B?a1I5ekIvenRkQW0rdEhudldoUVIvK25meXNPNUZ5WFkrUUpoMzJINzJ2c20w?=
 =?utf-8?B?b1psUTcrSkhOUGMvZ3lwYmxkUStjK3dVQWoxbEk0Qy94TG5aSU9tRkxGTHEy?=
 =?utf-8?B?T3JmcGNvU2ttMkVkdUE1V3lnZWIxcmxqUHA2M1c0eGU4eG5rVkFpNStGbDJF?=
 =?utf-8?B?bXMreHVWRjF2YVRCek5zYWQ0U043ZDEvRktWaHpwRldScGF5REtNL1o5aE9Z?=
 =?utf-8?B?V094WHF1dXRWM296WFVhdWgxVm1EeDR3U216bHpkUlVlamJDZlFyaFh0RkZZ?=
 =?utf-8?B?dllmNXA3VFg1REZSeGRqYUNaTys4RHNBTDRPYXdsWE9rNXk3L3hEby9xOThC?=
 =?utf-8?B?bkE1N05ORUh3Zzd0Y2FpOFpDM0ZFMHF4YzRnVllOMStBZi8vYVhuTWRjVU1z?=
 =?utf-8?B?ZjBLZUZxeU5LYm1vQUtieEV2Yk1pMFptNkhxdDMxdExCTS9SbzZjRDYzWHM3?=
 =?utf-8?B?RjU4NFZlRnlETWdHUmpwMWp3UWpBQUg3MUNDNmIyd21iRmFKRENWNXVFRlVt?=
 =?utf-8?B?ZmlTVkFGb0dIOXJvV2RxcjRXbEp4UTE5L2tqdXlOaDJ3am83dVVucnJ1cHZj?=
 =?utf-8?B?MGEzblUzN1VScTJRUHVQWjdOdWVCdjZocUhuNDEwU2U0NTZiTWdsRG1qTzFj?=
 =?utf-8?B?dlIvSEJ5R1pTLytJMUVmeWMwcktLciszWTNESENpVS9Hc2tZU3BvWnliaFZ1?=
 =?utf-8?B?cFRJRW9HT3FqVW1ra05qUFlEMWwrQ0JxS2I5d1pubU0zZm0yU0Q3U2ZxR3pV?=
 =?utf-8?B?V2FMRFU4UW1XeHBJeGJZVkpuUHJsbHVtZFRDM3pYQ1hYK3B5aU9ablpZb0Ns?=
 =?utf-8?B?UUlJK0FBbDNjdnJubnFGQWp5QVpxaTdIMU1XdFY4VDYzSTd1K3ZpS1NDQmtV?=
 =?utf-8?Q?9n48=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFc2RG9iWktQNjZsS3UxSE1tQUV5MjZrOXhpcGdYc3NISEI1d0RISk90eDBG?=
 =?utf-8?B?NjZ4NEhsM0ltUzhoQ1NnSDc5d1NUTjlId2dFbW5zNVAvRHU5bGNub3h5WkNu?=
 =?utf-8?B?WHgvOEV5NSs5elh5TUNEcE5RYk85MHRBcU1DV09yTGVwWE9Zb1BhdXdYSllk?=
 =?utf-8?B?c0tIVDBiWFVxSGM2eGEwSWNTMk5DelhrUy9GSGNCY3VTZ3JrNWJCY3U0VjJq?=
 =?utf-8?B?TzdvRHZLYkdzcXkwcE1QZ1RObXhabmxnWnp1azRRdm5aaVUzdWJDWHMvNXMx?=
 =?utf-8?B?dHFrTFhoTDl2dnJSUWFMQkh0dlZSNkhGRlhlenphTk05bWlpeGpBMnN1c01t?=
 =?utf-8?B?Z09NQjNHNk9LSXNxQXNjbjZ0dTc0bU52MGVaTGdDNUYvTElJMWR2cVI2aUE0?=
 =?utf-8?B?aStrNjdlbW9PMjlJeUFEbkR5Z3V0V2lSTXpIR3BoeHFNNzFhcmVTQnhqb0Ri?=
 =?utf-8?B?dW9pVS9sTmg5bWdjZnRiSEpQOXFhWCsyWm53NVJUOVYybXhCa3UveFU4ZHRH?=
 =?utf-8?B?d29jOXBqTkNXWW1CbE9oT2V1Y3B2cCtWOTVObFJsVjV4M3RYOTVoTnJROUVa?=
 =?utf-8?B?enhQMnlpWXlNQWRISFZDRDI3U2kxa2VCSE5TaWJORzd0S0N0KzkxbW52SHRs?=
 =?utf-8?B?RUd6RDZxeWY5L2l6eHVzdmxpQm5YQnhXTkU1SXlFTzlEMmFYMFJyNk1VVU0w?=
 =?utf-8?B?a09NSThJY3luREwzamNpdm5sNU9yMmhIZVY2UVdxYkZzVEp5N2VZY0ZMcTRK?=
 =?utf-8?B?ZEUyajhYcjJrOUlRMVUzSGpXcEFzemI0YTQ4RTduU3dUdUdiUU1DZlBFaHFx?=
 =?utf-8?B?N29HTzF0WlBCMnh3S1RNMDU3RDEwQlRRRnZkd2ZlUWJNeThWZmlmSTcxbENp?=
 =?utf-8?B?QU1aWm80TmVVSm8yV1ZpaE5ieFlzRDFBS29WUnEvZFZ1RTJRVlNoUGEyWkFk?=
 =?utf-8?B?WW9WeWVMNUJ2VHZobUh0OHN6STFHRFFHYTBJSE80UHpMQVlIRERXUzJFNElv?=
 =?utf-8?B?U0pPVnBFdWFFdlFiMkdUSTRzMms3NUt6eWc3NEp2S2dsZGhGcUsvVWdBdjBE?=
 =?utf-8?B?Z1VVWmx4ZmEzY2U1WkhjZlhKcXZBVEZ0S2ZHQkg0ZzNpczdnSWJxQ2JRaTcr?=
 =?utf-8?B?dEZzby9naU41aXFHVWlnV1F2NndFRXp6czlVeEhKcjlFUks3dE53dHd0R0My?=
 =?utf-8?B?clZaeXJGcEhNVmJMbGlpV1ZnZm1LSW1XZEZqU3dmWU8yTUh2LzJWZGdFbXBF?=
 =?utf-8?B?WlUyVll0eE9wall0YXJXYjg3NU5kMUR0eE92dWRmVnl1Z0pPYm1BbUFzc2du?=
 =?utf-8?B?MUNobG5tdkpLMmFiOUJwUHkyOVZxOHllQ2syaWpDMWs5T05vQlp4TTErT29u?=
 =?utf-8?B?ZUxqUDlHZFdpd1RrYi9hLzFvUE9aR2NzbEpCRUxXeGx6REdZclJYYzZ2MVNx?=
 =?utf-8?B?dDVKMzlBVWYxMWtsQmlGTFFtNnhQLzUzVVM1b05mbGRKOUptZVFJem9NT2hj?=
 =?utf-8?B?azhhM00rRXB1eHVDamVZS2pzT01QZnAvRVdQNjJyZUNtL2QvNkhGL2hnZDlC?=
 =?utf-8?B?dVh2NG1VaVJ4Y01xaXZkQkdRVEdPMzZ5THVVMFFTRHRZWWdOczFsWVlGSlAx?=
 =?utf-8?B?anVsV1QyRjVrMWhpT2NlSFFWSVpuM25kMk9PZnZteEVGaUNjelVpMmdKWktl?=
 =?utf-8?B?MmFiRDhlbEcxSGdFNC81MzdlWnRuQUh0WUxra2l4cDBrMGpRZjRxb25pRHhX?=
 =?utf-8?B?WHlwSkUyaFBYb1Q5VGZndUd3RStkRFJnVGh4WmsybGM3dSsrTFpNZ3M5M1Q3?=
 =?utf-8?B?S1NPeFc0QmxvdTljUmQ3cUxSVkVHZTNBUnVRRHZvM2FON3RwOTgyRTl1Tlpp?=
 =?utf-8?B?alVBcWdzRjQwK1RuWjhrMDNXKy9RM1pYNXpCZGVmY0hmek0rdGxtVlFsbVZl?=
 =?utf-8?B?OEZTcHkxSERoZXF0Zko5QS9mazRkc1dEVUU4V245ZGtna21XZWdxZ2lhMk95?=
 =?utf-8?B?dmVwQzlHVnBqSm05Ni81eHFSS0tidEhKS0x6Q25rQkw2Y0NVZzl3WEU0K0Mw?=
 =?utf-8?B?OU1uWis0bkFFUkI3WjJIVzVIVlJlZlpLRGl1RnhNL3YzVjN2QU5PZVpmd2l3?=
 =?utf-8?B?aUNZZDR1MjhoK0JDZVY5Z1djV1JWWE1EemFvSWkraGhHZDFBN0tJaURsRHA2?=
 =?utf-8?B?RWJSMjVhY2V6SlhhS1RSQ04wWnRFbWIyNWphMHpyK3BMaUxXVHNyaWU5Zk52?=
 =?utf-8?B?TVM4dm9jdHY5ZXQ0OFEySzlvSmtST1Y0SThyT0JPKzQ1Q1MzQ3dWRVBDV05r?=
 =?utf-8?B?RFpwZEZ2dzh5L3NLSGF6MzRHbjd1dGcwVm1Wb29MRXFuVjMvOXl2dz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda05559-9ee6-4b64-3437-08de64d8fb4a
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 17:07:02.6473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3idosuqGmsq2ZZ7lHMDE/j0QZ+N5qeVB+q+Wdm3b9MmVN3ISYJIqMcScsE8koudgf1WfaBWLBBn1hcs7sKD1gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5981
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,Mac.lan:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0D9ECF5AA0
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 12:33:54PM +0100, Bertrand Marquis wrote:
> Xen does not currently document how to build the hypervisor on macOS, and
> there is no Darwin configuration for selecting a Homebrew-based GNU
> toolchain. Native builds are not supported; the hypervisor must be
> cross-built with a GNU toolchain and GNU make/sed.
> 
> Add a minimal Darwin.mk which selects the GNU tool definitions used by
> the macOS workflow and point to the build guide for required tools and
> setup. Document the Homebrew cross toolchain and GNU tools needed to
> build the hypervisor on macOS.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  config/Darwin.mk            |  6 ++++
>  docs/misc/build-on-macos.md | 66 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 config/Darwin.mk
>  create mode 100644 docs/misc/build-on-macos.md
> 
> diff --git a/config/Darwin.mk b/config/Darwin.mk
> new file mode 100644
> index 000000000000..a4e3efa81842
> --- /dev/null
> +++ b/config/Darwin.mk
> @@ -0,0 +1,6 @@
> +# Use GNU tool definitions; the macOS workflow relies on Homebrew GNU tools.
> +# See docs/misc/build-on-macos.md for required tools and setup.
> +include $(XEN_ROOT)/config/StdGNU.mk
> +
> +# We are always cross compiling so fake COMPILE_ARCH
> +XEN_COMPILE_ARCH = Darwin
> diff --git a/docs/misc/build-on-macos.md b/docs/misc/build-on-macos.md
> new file mode 100644
> index 000000000000..6b56cd8eccab
> --- /dev/null
> +++ b/docs/misc/build-on-macos.md
> @@ -0,0 +1,66 @@
> +# Building Xen Hypervisor on macOS
> +
> +This guide explains how to cross-compile the Xen hypervisor (xen
> +subdirectory only) on macOS. This does **not** build the tools.

More on this below, I'm not sure I would call it a "cross-compile".
Only when doing so from a x86 silicon Mac?

> +## Prerequisites
> +
> +Install the following packages using Homebrew:
> +
> +```bash
> +# Cross-compilation toolchain for ARM64
> +brew install aarch64-elf-gcc
> +
> +# GNU tools (required for compatibility)
> +brew install make gnu-sed
> +```

Installing make / sed are not strictly needed.

> +
> +Homebrew installs under `/opt/homebrew` on Apple Silicon and `/usr/local` on
> +Intel Macs. Adjust paths below accordingly.
> +
> +### Verification
> +
> +Verify your installation:
> +
> +```bash
> +# Check cross compiler
> +aarch64-elf-gcc --version
> +
> +# Check GNU make (adjust prefix if needed)
> +/opt/homebrew/opt/make/libexec/gnubin/make --version
> +
> +# Check GNU sed (adjust prefix if needed)
> +/opt/homebrew/opt/gnu-sed/libexec/gnubin/sed --version
> +```

Checking for make / sed can be removed.

> +
> +## Building the Hypervisor
> +
> +Set up GNU tools in PATH and build:
> +
> +```bash
> +# Set up GNU tools in PATH (adjust prefix if needed)
> +export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:/opt/homebrew/opt/make/libexec/gnubin:$PATH"

Do you really need the gnubin?  I think this was only for sed / make,
which is not really needed.

> +
> +# Build Xen hypervisor only (in-tree)
> +cd xen/
> +make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=gcc
> +
> +# Optional: out-of-tree build directory
> +# make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=gcc O=$PWD/build-mac
> +```
> +
> +## Architecture Support
> +
> +Currently supported architectures:
> +
> +- **ARM64** (`arm64`) - Default, uses `aarch64-elf-gcc`

It could possibly also use the llvm package from homebrew, but I can
add later if I get some time to test.

> +
> +Other targets may work if the corresponding cross toolchain is installed,
> +but this guide has only been tested on ARM64.
> +
> +## Limitations
> +
> +- **Hypervisor only**: This only builds the Xen hypervisor, not the tools
> +- **Cross-compilation only**: Native builds are not supported

Probably a more philosophical question, but is it really a cross
compilation if I'm building an arm64 Xen on Apple arm64 silicon?

Sure, it might use a different toolchain from native, but it's still a
"native" build from an architectural perspective?

> +- **macOS-specific**: Instructions optimized for macOS with Homebrew
> +- **GNU tools required**: Native BSD tools are not compatible

That last item can be removed.

Thanks, Roger.

