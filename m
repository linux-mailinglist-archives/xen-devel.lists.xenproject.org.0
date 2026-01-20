Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIudBTS8b2kOMQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 18:32:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67484489AE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 18:32:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209235.1521322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viFZz-0002Z6-IX; Tue, 20 Jan 2026 17:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209235.1521322; Tue, 20 Jan 2026 17:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viFZz-0002Vz-Eq; Tue, 20 Jan 2026 17:31:47 +0000
Received: by outflank-mailman (input) for mailman id 1209235;
 Tue, 20 Jan 2026 17:31:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1viFZx-0002Vt-RE
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 17:31:45 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e271ebd4-f625-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 18:31:43 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MN2PR03MB5294.namprd03.prod.outlook.com (2603:10b6:208:1e2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 17:31:40 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Tue, 20 Jan 2026
 17:31:40 +0000
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
X-Inumbo-ID: e271ebd4-f625-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiwU7vWb5dHqETTcdOhStW23viFY7x6IXLeUlTTNDFbLL8j5a/hevFtKL9ejYQgFxlsGnWTVyHHN4C6fsDW8W6klYzLcrOlBuGXwr9frwW0T+eo8Ak2ap5Lp9gpK7m6vUaQYPunNcE0vV+wjZpm7+BmMKQxQxDubE6hhlelQk25aeeYWRs6nbs9Mfj/bJJ9dnbgEgOm/mIZqfcvmPJSL1hAWl8MIAfHC6o8koz/p4p+4vvLpiVzSQEOo0H+Au1oiCXKHsBW6seD9A9f/ytwaQgsY477uDkDii63wz8ry3ZfN2holeH9sokfmxfO2zATCSvTL0vRB86dQx0sEjEmrWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YewgtYiC5iSiwIqlkS8dxSZPEdP7HnCbd7VakS5urhg=;
 b=h+JrEd12ZkU96leoK2HdxOlvE3DJVRME0XVX/d5LyYBiU3lioCR+5OZM09GCf/3OmCdpXU6kCQyY9NdWGEk5n0HpQOcKsJ2HxjpGZFkpN7r3YVo2SQ1XDvd0dmlHvw/sywtzjoLVyd1AChntlymFL78bFARw7yLRy+MIfXLx6WXF8LYUw5zaCYVBpCOSO22fB5mXsG70sE7Mbp0WaZqsswsINpXqPX110ChFvFVZD/rmRtmN91ubLjqMyhkRsRnihwXzG+alBYRvbKYfHpKq5ZGEReF9fLAfuz8qIJxVz97HKAx5wWahetlznDj1IO8EQqXUDiiTgCcPwowzAzh1+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YewgtYiC5iSiwIqlkS8dxSZPEdP7HnCbd7VakS5urhg=;
 b=Zfr0d6gTBHRBcLpxrmK1p5kOtArD/S2qdyUq4B4ioeDifkX0DU0FjfxtLiitB4jJclSAiuj3PBXLHffcWVzj5WYAKdkAuVRlLvIhbYLmTDI/aJ9Bm6XY8TwN6aeMI8WiEQVkKjFhMPAhTnL8rhGuTiSv59Chj6/zN3ChVJu24f8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 20 Jan 2026 18:31:31 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>
Subject: Re: [RESEND PATCH v12 1/3] vpci/rebar: Implement cleanup function
 for Rebar
Message-ID: <aW-786Ou6N3oZy99@Mac.lan>
References: <20251208081815.3105930-1-Jiqian.Chen@amd.com>
 <20251208081815.3105930-2-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251208081815.3105930-2-Jiqian.Chen@amd.com>
X-ClientProxiedBy: MA3P292CA0058.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::7) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MN2PR03MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b7bb7fe-3353-4255-6aaa-08de5849c565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UHUwZm0wd0hXVzJQN3dsU0RZWnE2OUFaajlka3hMMmpnWktVZ3NBTHRZUVI4?=
 =?utf-8?B?eC9hc2ZLMXVPdndlM1hTdHVoNGp2SXR4WjBYTzNHeFl2OE5CR1UyZmd1RHFZ?=
 =?utf-8?B?K2NkSWNwRlBpcDEwQyszZnplUzNybmdQUDNST3FyczR5Y2xrUVNma2JZVTg5?=
 =?utf-8?B?Qm8yU2tjajMxUCtNblVBTHM1RWsxMXd0S204U3kyV1l0TVA3ckczT3JkajJZ?=
 =?utf-8?B?b09LbGJYeFdSRGtYQnBHb3FaSWY0ZG5jSHh6c25YbEVsM2lodWNnZTVvTktV?=
 =?utf-8?B?cmJUMHRiZTFBOVpCUWJyejhoNzRKbFg0UEhUTGdnK3dKdXdleHV1RGhaS29X?=
 =?utf-8?B?QkxJMytGSkNLcXlXRnB5L0tkSERubkNBSWdnSVFWN2c5UUJ1OGs1aGFsU2dM?=
 =?utf-8?B?b0hmVnY0Y2ZuK1MvZHZCejZoUTE2U0RKN0cvTnV5U1NvV1hpVE1YdnhqR0xT?=
 =?utf-8?B?aDZBL1YxUnBEZGh0NmFMYTBrR0FaeEl6NEZRTXJjNUNEaDZaRXhOUythWTlC?=
 =?utf-8?B?VjJkZnl2RnJhdVJQVzhkQVRIUjNzRTNYU3BrTXNXcnFVVTl6UXFlWWR2YkQv?=
 =?utf-8?B?SXZVSUIrMitGM2RvUi9TNTFNamxDZ3VITWptMjZKY3FJL1UzTC9JT0kybXpu?=
 =?utf-8?B?YVZKYmFHSG1pRUFlc3ByQmtxWklPb3NrZTJNTTc3TXR0Qi9NejNEbVZIcTVn?=
 =?utf-8?B?cVBGaHVPN2EyR2JlOWxucFNPbTVweVBjSnpUelk4alNpUlcrMjdWSHJKTFA4?=
 =?utf-8?B?MU5nVmVYazBUekhpRjFRWTFqVHd5bjJPWkZkdXJ4cVUwUEozbTBoTENMc3RV?=
 =?utf-8?B?NnN1ajAzbkhqRXhmRVdPdkNHRFNoa3Q5TDNLVnFYZzVCUWRxT3lEMW5YNDBx?=
 =?utf-8?B?RllBbnJvdkpTYlRncnJwZEtpZDVFcUdvV0lDL0c1blpKYnk4cGRRWEpxd2J1?=
 =?utf-8?B?ems4dTFzRSt1S2d2T3VFVW9CbmdYVWRNNHF0QTdaWW1pb3A1emZ1UUFkSEcr?=
 =?utf-8?B?Tldrb0Z6anpGZERsR2J4Vko0TzkwRjNud3JXSUVCQlRzdG14bFBEWnorUTh4?=
 =?utf-8?B?UTYxUnNsRG40TmVVSklzMHVWeURaYm1EaWJhVEM0a3Fsd2xZME5PbENhc2N4?=
 =?utf-8?B?bmxabk5sSVByTjlyeTNqeldnZjdUdjBtZXZxN2ZQaE1kS1RaRHN3NTdoRFNj?=
 =?utf-8?B?aVlPNGxRQU9VbUliaVcvSHI5amkvNFVCYzV1dE16UE9CQkYyQTB0M0dzdGFS?=
 =?utf-8?B?ZU9DWnRBNURmV0dLank1OHZVanl4VnNUbWxWWDJTb2N2bUdNQmhpaCtxRDg4?=
 =?utf-8?B?Q3ZCQ0twK2V4dko1L281c1RnSERteG4wUnNGQnB4QzR1NkZJN3lYR2FNdFVK?=
 =?utf-8?B?Rlh5OHA2aUxqSGVJOVByVzlVY3plYWlaeUt0blZaVVpvaGFmWGRqM3pMcW9R?=
 =?utf-8?B?MSt4YStjT1BUR1F5SlNxS0NkNXBGY3RXN1NYSHZFVHNNZS9xUlhlVnJIcFkr?=
 =?utf-8?B?NElma21La2JES2lEMy9teFBKdjVsTFl2LzBnWDJ5eEdVSHh0aXRxaVJoLzI0?=
 =?utf-8?B?MlJWZ1Z6NElHNk94U1lPbmc2aGN5WllVTnVmTDhpNWdWS2I1bzhRdTVtdEJ6?=
 =?utf-8?B?b0szdGtoRVd4T0F2V2cwTjZLTzdBNGhUajN5N2VPckI0ZVB5OTRLcXhWU09i?=
 =?utf-8?B?aE9HTk9LaHhzNFRFNUltZ0NBY2ZNQWQzVk5RNGJ6WDR2LyszVUNEbllxSG9Y?=
 =?utf-8?B?WC9FOUM2ZFh4UkFSRDJCS3dXaHdWb01tRTBQN1NBc2NsaU4vR3g4UFRHUmtR?=
 =?utf-8?B?RzdudGZnY05FaW9QSGdOU3Voa1U3c2lZVElORmNMUUQ3UGpDV0ZEbWFhdFNU?=
 =?utf-8?B?S3c1UHgvUktxZHpyNGI3R1IzTUljZ0dDQStEUFlqNlNBSXFGQkptc3lWRkRu?=
 =?utf-8?B?NGlBNkEyNzZCT1l6N0ZiQkNJT3ZLakhGU1liOUhWbysray9CVkM4S2daeDBM?=
 =?utf-8?B?NGx4ZmtyVVk4eWtQdkVMQXZNRytCUmxzVTdJbU9ncWJRNVhhYVE3TTdIYmlQ?=
 =?utf-8?B?QzBiUnMzOSs2Y1hLcUlHeHc4ZXdhaGtxYnBPWmtaSkdkblViY3ZKQVdNVzhI?=
 =?utf-8?Q?WQtw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmF6WjZXT0VOUmx5WExzMlhsN1lCbUJyc0k5aERSMlF6VmdvT1RaRXNaU3dY?=
 =?utf-8?B?TVVwM3lGMVBxQVRaTEdIVkJSQ0orRjR1ZjhIMG5CamVDUGpEQ1JYWURkUnlx?=
 =?utf-8?B?dENSOFlTVFZVVFowZ3hkalN6cVpIcXNHME5OS3NpdWxNdU03V1AxWWxKSGhD?=
 =?utf-8?B?N2xFd2VCMGpFbVVZSWlMaUtUV0hydmE3YjhxZHgycEMyN0hWdVVxK0ozOU9N?=
 =?utf-8?B?ZEhYUFBkc01PYzJvTG0wRkE2dEFVSlVLQXR2OFJSRi9JM0VxWEZ0TTF3bDZX?=
 =?utf-8?B?VyswZjdFUHE2ZU82VS9GRnE5NktQSTdoSXN3ZVMwdkZEbGVUVHNydVJ4Rm9k?=
 =?utf-8?B?K003WWdIRnRWMlhwZ2JxYWpXOU1TaEcvQ1lmTURtY1NtMjF2WjhVYkw5K2FQ?=
 =?utf-8?B?aThBbXQzRk9aWUE0RmFmaEpVVGhYYlFWNWdWRk1uQlY1ckRqMjhsWjczb25h?=
 =?utf-8?B?aHYwOVFpMVhQd212SWRScFZaNS9rRGszanVZcnNkLzNMT25zRWRsUGNiRkRa?=
 =?utf-8?B?N0NEY3B0Z2h4djd4cEEvcE4xelNMa281K1IvbDFTeWJobC9hTVRncWpXMDlp?=
 =?utf-8?B?c0ZKZTFXMTZ3NllqL2hQQm9PSmllc1BGK2tKRk1GUmFGV3hhN2hSaktHdXIv?=
 =?utf-8?B?NkhxS21sOG91QW85NHgvdVdqQ2RaYVFaNE9YaGFzYnRudmgvV3h4L3QzN2pR?=
 =?utf-8?B?TTNzaHlIMk94SGtBS2ZEbzNINC9UK2xvSmgyZzlRcG1HYXdubXZFL2pSa1dw?=
 =?utf-8?B?UlUwZmh1TzhyZVhXbXZnVzBUUHFaK1ZRcG1JS0xKMnZtRXd4UkJITEZ5VFZC?=
 =?utf-8?B?MzJ3ZUVJeVlSUmJJeDROa2ZhMVVCQXRHVy8wTWlBWDlYeTFwSHk3aFBmdmFS?=
 =?utf-8?B?TURJTkh2djRUYzE4Nyt3OUpBZ29YdEJ0Z3l2VEc4bHZrM3JiT0tVQ0dtdmdK?=
 =?utf-8?B?WWs4Q3hJZ3VucTgyOGs2eHV6ZTdDbDlNV2Z4TkJ3NERPbEUyOTVwcmlzSkJT?=
 =?utf-8?B?ODZHVk5sQUVWajRsbHYzWUlaQ25sb1RlRXc1QVdJMkFUTFVVZFd4WG1nQ2dT?=
 =?utf-8?B?TGQ1dGxDdFpJSjlJOHBKb0hFb2J3bTJ2ckIrbm1lZ1IvM1JwaHM4bDBmWXUv?=
 =?utf-8?B?U2VCL2lIZ01HNHdoODBFZnpWaHcyMGlHd1o5a0lpRUJqbFZvWjZFdUo0cXB5?=
 =?utf-8?B?aklGOHE3NFV2TFZTWmluVlByQ0tiQVdmMmxOZlpySkVRNks4bnlxNEVRWVgz?=
 =?utf-8?B?bEtYM1BmVEp5TUM0MkM4Rnh6R0h4d2l4c1dMVUpQS20vRHBDYTNIYkRGT2la?=
 =?utf-8?B?NlBXWGh2UGMzaXZlb1RYMFl2MWRmeVVZaDhYT1pXT2FPL29vSE5DSmk3dXdC?=
 =?utf-8?B?eERmcUo2UjQwY05LUWQzQ0RNZ05FUFFJcWRGUW5HenlvMGEwSWdPdm5KQ3k0?=
 =?utf-8?B?ODFZaTFWcForRFFUckJSc29QZjFza2c2eFIvbzJieHlNMWJpbWdXaUhjQzVE?=
 =?utf-8?B?QzUwM0gzc1lSZlFiMUxLWWowbHA2V0VYdmNXZDU4akRpcm9jNHpsbkxpbnFr?=
 =?utf-8?B?VDF4M3l0VSs5QWVvWWcwMm9VQys4WkFqMWNZaHhIbkl1ZFNDczRQVStRQVIr?=
 =?utf-8?B?THc2dVdxQ1BhdWdnUU54SmZtTnVlNXc2RWJvSTV1MFpaeGxYOUNmOWJnbm1n?=
 =?utf-8?B?TTI1UCtockRKYzNGTXE4enZIR0h2TXlkSUVZU0xCM2MwUjJNS1diV1FpWFpP?=
 =?utf-8?B?R3RCSDRLbVBJMzV5TTVzQU1VMTQ1UWx5OUc3UzlqZEFpZ1Bwc3E0YUhvK2lw?=
 =?utf-8?B?YllUWVJqQ1oxWVZhdjR0RjJVMXl4bHdxZVBVZUVhK0U4ZUVVSkVQWXVkZkNv?=
 =?utf-8?B?QkxmZDVWRm1TSHYyTU9PdjlKSlpzOXM2c2NzRkZaMnRBNmZBK21KY0FWemxB?=
 =?utf-8?B?WGRtcjk3VmlrWG1NRDZQT3haTXlFWWUwQ01aK2drUk91WjJwQ0REVmZVTE90?=
 =?utf-8?B?UFZ5a2VoYzJyMHZqQ1VyaGtXbldDbktQQ0tJWXFjdHoxenlxU2dCaUwxcmR0?=
 =?utf-8?B?QVVkd3J4eWxaMW5VYmN3b29janMyK3NQVnhXSS9PR1ZBYzNlZGkxZVp4WW1U?=
 =?utf-8?B?RXFpeFQzQ0hOTU9CR1ZJL2hsRTBBNXdadE5MNEFDR243ZjZzUVY4dXNFU2ta?=
 =?utf-8?B?VGlGaTQvY2x5VXZlTktGT1gxMkhTaSs3alR4dXpZY1VLNmorbUtiY2NrYUxB?=
 =?utf-8?B?Q1Z1NzBFTVYzWHNUK0Q0RnQxZmJHV0hIRytOTWdmenRNdmd1RXI1V3E0UExU?=
 =?utf-8?B?cGFFV3cwY3UxbU5scldXYUdaQjFZSC83aDJHc0YycWtyVkdCWm5KUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b7bb7fe-3353-4255-6aaa-08de5849c565
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:31:40.2003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B39ri5+LZjsOGulJUX+D/a8nX3CeVy7hRkanch20/EQbj3jSnll63JBYe+3mlYKkTJxLA0yRpVw/skvIVHGZEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5294
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
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:Jiqian.Chen@amd.com,m:xen-devel@lists.xenproject.org,m:ray.huang@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 67484489AE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Dec 08, 2025 at 04:18:13PM +0800, Jiqian Chen wrote:
> When Rebar initialization fails, vPCI hides the capability, but
> removing handlers and datas won't be performed until the device is
> deassigned. So, implement Rebar cleanup hook that will be called to
> cleanup Rebar related handlers and free it's associated data when
> initialization fails.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

