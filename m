Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGhMDFJvg2lgmwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:09:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8021BE9F3B
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220964.1529362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnfRB-0002Yr-Mw; Wed, 04 Feb 2026 16:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220964.1529362; Wed, 04 Feb 2026 16:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnfRB-0002Vm-Jb; Wed, 04 Feb 2026 16:09:05 +0000
Received: by outflank-mailman (input) for mailman id 1220964;
 Wed, 04 Feb 2026 16:09:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f40U=AI=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vnfRA-0002Vg-2e
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 16:09:04 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cecec5e2-01e3-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 17:08:57 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6591.namprd03.prod.outlook.com (2603:10b6:510:a8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 16:08:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 16:08:53 +0000
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
X-Inumbo-ID: cecec5e2-01e3-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjE9sxM9AAAeAgfY2Gtze2YM1RQzMUtb06BSem8KmAO6W6BuuupbWZG152t6inE43hfFU5DeeaxkfVtoV78j+c6cGJWLUunYONc5LW6/R82n0yhyiw8q76+rw66ZxljZdytEsBcnXV8Gt1gv0d1jTnOveWOTSqh7UNEEog9szImQ8tD6lq2TtU1wiGQVEN/Cf9mHBB+3h98F7YSiLnmYO+xltiVZvSobos89LaQhXn1kuZAdQaH57FxTQN7TFpfn6W4vq63z/3P4WmClkKyCfDb4F3MCqsBy3URgbe4bjUm8ydWxwBfNXTSrTSWhInz70wMcm5FvsyNm0m9Em3AdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rlL/QmA9PSmxfC2caP4vmCOdIWVGYrjz0Tbry7EOfc=;
 b=eBDPLt0X/s05DVKtKDsDVTGCMoKU26bEzHDOS8FVpSzunVyZ91CjHdA8XeOiz3ImnQR6d3YKMbxv/W/LZbK6t2iWQU4Rg5aplIHj4GWcM0qVo4Ud73cXVkHAJL4wB8UqLg+86BP7hRmOJ32gwkOo/GyazQobsAXCqSQrMa3oAF1+lMjz801cfB+Zw1bY25kLNtj0iU8fIZxv43ym0J0PIUPmprlpAC8SkgAipuCznWlGFm8fVbgTQ0brjyo7oqUUa+92mYqecoI5aTZxWX5Kq6cprk6+nrXQeTJJJK7t88u/Z+kLNTxCns9NqWIbqVc70uOv5JNo3UsBu6ADoOSEBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rlL/QmA9PSmxfC2caP4vmCOdIWVGYrjz0Tbry7EOfc=;
 b=yzty6bfz7Jtb5kKoeUP75RkrxLMPSvk5Ajwyy4DF4l8F/xa2TTCGRzpZMyeKya1Nq/1FmhJoxYb6kb2Vkgtw28mfvitFXhKuVQvsgs/NEq3dWr4NDS6M5fI29X55TMHLAZMKaIMDY3DlXRMO9vY+voA8YLIRUpCQlEgFVHvblAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Feb 2026 17:08:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 4/4] xen/mm: limit non-scrubbed allocations to a
 specific order
Message-ID: <aYNvEpxAqkJPfGF6@Mac.lan>
References: <20260130145726.85907-1-roger.pau@citrix.com>
 <20260130145726.85907-5-roger.pau@citrix.com>
 <2c2b6189-9404-4378-a101-3a93cbadee43@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c2b6189-9404-4378-a101-3a93cbadee43@suse.com>
X-ClientProxiedBy: MA3P292CA0009.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 415b2ef1-9adc-4bb9-7785-08de6407b0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SWdWc0xxVWI1L29GL2JVRGxZU1EzZjJXZEJmNFkrUWJLQVVvWDNLQjRzSEdy?=
 =?utf-8?B?bXVmcG9UbXdDOTNleGplSDlmYXNLdWNXM3I2WHphME5EakZZTU9MdlBBKzFN?=
 =?utf-8?B?ejJyZkxpQU1DTWFmUUdLUDh1NkZwQ1BRUTZIcmVha2hVVWxTUmZWdDlWNTBR?=
 =?utf-8?B?OERmVzh3bXZHUHZHN3ZXNyttSTNQeDhSbVZIM3FrbXBPVTBWNWR2MlNjaVZq?=
 =?utf-8?B?LzJGTEZLbEM1Ny9DTHlEUGRpUjhVOVF1cUJVWWcwd3h6UzVmVUJRcFloWmNi?=
 =?utf-8?B?TmVtYjFxaWlVTDZsVDZ0Y1Q0QXcrT2xoNWlOOFB5L0tMcWdQMjN2eVpQU0tE?=
 =?utf-8?B?UGJPZFNieTBTT3NpN3JOQkxoa0d3VkZDNDlNdUoxWVNjcHVsY2t1UmV0RTdx?=
 =?utf-8?B?WE9jMEZhOTFTVFY2WW9zT0NCNUZpd1NTTTh1UVduWGcxUkxQWTBFSmlCYmFp?=
 =?utf-8?B?N0hpb0VEOVAvWlk2WG1BcUpUSWRiamp1eFFDSkhReVZlbzhiWFphM21UTGcx?=
 =?utf-8?B?ZUFMYzlKb1VySDIwNmZSY1BjT1ZMUEFEZGh1c2ducFprcnN4MStteHJQcnVa?=
 =?utf-8?B?Z1cyUS9LOHRNU0NhT3VOZGVzR0dTWGRsbUY3T2I0M1pUMml6cHh5WW1yUEt4?=
 =?utf-8?B?czNNV3k2bEpjcjJqbEVoZUltMUl4T1htN1JkMkpnVEhYQkJWbjBlNHZBYVBs?=
 =?utf-8?B?NHNvdGEzK1hDUUpiTkZML2Y3TzJ4aS9TUUZTRklKV053dTArZ2JjYzlQTCtx?=
 =?utf-8?B?dDI2OVZmUm43Y2RvakFnSDlDOWZIaDB1ZW1HY2VZVHR2MFV6eGZ2MmZlMVJH?=
 =?utf-8?B?NmNyQUpSZUc0L0x1dlp0MU45a2o4NlIrQk9qQzhQeGFHdGdDbUFGV2ZVNVhC?=
 =?utf-8?B?cHNNQ1RCUXU3RHJtTU05czRSekhBc3N1ZU11VW9rMmpITGVxa05HQ1grUjg1?=
 =?utf-8?B?bE51d3ppdmJ1aTFMR3Z4eTV6YkxENEhCenVwZUJQVXUwbzZiNitaSndlZXNS?=
 =?utf-8?B?bVdZSjcxT3RRRGYrcEttVFhKTXpNanlUVm9vandMZ2huK1FBMi9qbXpleVdB?=
 =?utf-8?B?RlNGWXhqMGFQWG82VHI3UW9mc3ppMXdiU3FvSGpHamg4RUxpVW14cTZEdy9P?=
 =?utf-8?B?MTY3Y3dYVkpPRzBPQ3QrMHFsUThDSmZjOU81TWF0ckFFbnVDTkwyVDl4REVR?=
 =?utf-8?B?WWJZN1UrZVJ3V3h6UTVDeXNBbUlnYXhkWGgxbGFudVhDbXYwZTdLeXlZZ0ZJ?=
 =?utf-8?B?UFZQNXRkSER0QzlxVDd3dVkvVXZkK056SURVbE1UVEhHYlNPWWhnRjZFbmRZ?=
 =?utf-8?B?MU5oeDlQTmFyN1MvYmkxL0VINU1qam9kRUdvL2tHQXZrQ2RqbnRBSDRZRlUy?=
 =?utf-8?B?c1orV2d4OUhBVGpqdDJZZVlBRmdHVHBJL25MQVhHMFlxZi96VUF1LzE0L1lp?=
 =?utf-8?B?elM3RkN6NGdBM0xHMytBMitSWGFORVRwbmhoa0t1RUtkeVoxNU1pZFZ0RjY3?=
 =?utf-8?B?dHg0aFVnZmxRNG5EbHlPSEdrcVVRT2FoYmczaTJQckRXSndYRDdoUWRtYVVL?=
 =?utf-8?B?NU03V3FBQU9wUXRQanBqVG1BZ0VOdENOMjdoRUVDOHhNQUpSZklIRXpXamp5?=
 =?utf-8?B?VVA0QVJ4aklGVW8wMmhEeTUvd1ZsNkpldzNyd3o4ZTdnWEFzQ0hBd3g4SzEy?=
 =?utf-8?B?ZlBIay9xd01nWlo3Y24vVEdabzYyaDYxM0RpU2ZPa1lXRXh4bjhxZzNPSUpi?=
 =?utf-8?B?ODAzc1dRQXdLUHhCbmJOdGY5VWMrUW1BYU9rMUMvRVFNOXlBeVBvcFlHd0RX?=
 =?utf-8?B?dUdQcUdBM1czS3llaDgyUTNUVUI3UXV3Z3YyNGdHY3pDaUZQZ1N2L0MyVEpB?=
 =?utf-8?B?OHowTEpuUnBLeDB6L2JaaWpCM1hEZnBQQjBkZUhTMzh2K25NN1N6elpTRkNr?=
 =?utf-8?B?K2NVMkNySmpPUTJselZEQVpOWEQ2MTVUQ0NjRGNUbjlEY3lIRURmclVCS05n?=
 =?utf-8?B?QjN0bjNHODNDQzBUMkx1MzB2YlRRcjZHYmdMaDZydlRZdytSZXZ0a1ljM0RG?=
 =?utf-8?B?Qnp6ZHErZ0RuRkJRb2toNzdjS1JvSVJ4MWdyaEg1Y29sdStrdmhaS1o1bnZl?=
 =?utf-8?Q?lXvA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW1keUNYYkN2RitTYlhaWWxrWDFLL3kreVA4UGsrUW5EZ1cyanZGaVR6Y1I5?=
 =?utf-8?B?R1g5cUdKeTFnajBCcmEwT1IzUDFRbDNNYjEwYXZ0cCtNOHBTOFVsdmV6Tlkw?=
 =?utf-8?B?b0hFd2ZFWUhsWGI5NVFOR3R4K3h2dVVESW9YN1NtRExMYnZjZGt1NVErM1gr?=
 =?utf-8?B?R3VwMzl5aFBWakNCYTRlTXU2bVlYY1BpWEE0ZHVBZkVGWEdYTFVrbHJkb3Nx?=
 =?utf-8?B?Nyt5aC9Yc1JDcW93SkxESU9QQ213TDRDcHpsaTdYcUpNeHhFMjdJcWp2MzhT?=
 =?utf-8?B?d3hGZ1dvQ29idklYQ1h3WE9CTFFka0RWUXN1UElMUXMyYUMyUzVKelhyc2l2?=
 =?utf-8?B?dmFSakRKNGdVZjN1Y2k4VyszRlNSdE4yUlJBNWNuQUkxU3NrcFRuanBEeHFH?=
 =?utf-8?B?Mm1aQ2hWaG5NTWJ4U2grdVlveUFpdnpkSHY3K3BMNEZyN0FDMEhxUFpSbGF3?=
 =?utf-8?B?M2FibjRXQ01nZXRtc3VncnJWNTBkNWg4bkllRjlibDBxQzBZQWNGM1VrZHZn?=
 =?utf-8?B?c1ZsMjNHQ0hiQ3lackdIQWNrTlQzSUJtNVlXOTNPMmZ6bE5udWN4V1lETkZ5?=
 =?utf-8?B?T09qVUFBUk9QTE4wRUFicDIvdmF6R2FJZzRFUGg4b0l0VUNmdm1CK2VuZEJS?=
 =?utf-8?B?N3pjRHdVTDJ4S0xKWjJ0WXJBOGZ0eFNDZVp3L0hFbFBFUXlsTmFYTlpDZzd0?=
 =?utf-8?B?NzdURnN1bVozbUVuRC9oSEdqWkhZY2dVK081UGpweUpmY3VGM2ZyREZnZzFI?=
 =?utf-8?B?R05YYVlpWDFaWjFTcHJ1VXI5N3Fzb3lNcnRRYSsvc1llQ1VtSWo3R013bFF5?=
 =?utf-8?B?VHNwNVNsNVp2cFhQekRFOVR3aVZkYmNQakc4UFV3RXFsTGVvQ2dsdENQVmpw?=
 =?utf-8?B?QXdZU2huc3YvaHV1M2RtTzBYRFd5YzZmV1FzSWV0ZzlGeTV1aEQwMkZEQ1R1?=
 =?utf-8?B?OEYxbFU2YzBzVWZOL1NmcFJ4QnF3VW4zWXQ1VUxxazlzUVB2RzFaemlHczVB?=
 =?utf-8?B?MEY5VUlvanBDNFpuUGpkaldwQyt4UkZkbmxETVcyQmZsQUdtb1k3VENMVS9F?=
 =?utf-8?B?VncwNGRHeEwxbjRTS010allweFZndnBSeEVtVStqN1p0WE1WbVFGSnF6Z01j?=
 =?utf-8?B?azh1SW8xbTk4OFVVeHJGc3FRbWk5TmNGOHBraXZtSmhERjRGczhoZHNZdHJ6?=
 =?utf-8?B?ZXd5ak9nZGs2b2poVjVKWEN4dXNDVStIbGtwNjRnTWN1TXNQL2hPbmwvMW1H?=
 =?utf-8?B?S2RYR3VYcG9UdkxIV0tCeWR2SmNZbFltRmpVUTNMUFd4ZUpkSXVheE45bkN4?=
 =?utf-8?B?d0RLVnZlTjMyaFRVY01hRnYvNVppTU1hZktQQ0ZrMHRKVWpmRFQrZzRramlL?=
 =?utf-8?B?Wk13a3BTNEEzdklKSjRwUUNmMS9BUTl0d0ZpalIrbEl5Y1B6b3h0UTAyZzRD?=
 =?utf-8?B?SlNJb0ZkRTg3Z0FEWFVpSytmb3NpdVEzR0MyRkZlYno0YS8rVmtvbzhtcWtG?=
 =?utf-8?B?NlVCSW4xMy82Wmc4N3o1aUJDSWtTRTViYXJyeWRGdlZtSjBzZHhvbHM3QUJK?=
 =?utf-8?B?aDQwOXRUTUF5YVNia0xxVTFOZDZxSDRONXBLK3JEczFZRjhBd01MVTZMTWhS?=
 =?utf-8?B?QXQwQWVLQkpSRm40ZHJIYXNmd3E3VDNOdzhrRWJtd2hDMXpjQkovbnZYWE13?=
 =?utf-8?B?dmI4WWFaWVhZS2xRNWh1QXNnZThQVTd5Y1RIejdDTW1tcVh2bmZtMjFLSE40?=
 =?utf-8?B?Yis5c1Rob1NGaElqVXFwYXA2L3BpQ3FHNTF6YXorWmlkc1ZFcFk0cWcwQ0JX?=
 =?utf-8?B?U3hRdHlIdjZJRjl3aWR4L1diREJDTzFEM05haHNjWW0rVDgxT3lSZmNSdlNh?=
 =?utf-8?B?VHlma2RFMU9wNUc0c1BIdG11bEl6M243d3IyRitXOUQ2ZWRtaWljZ1dES1FW?=
 =?utf-8?B?QzJqVlF5ZjBaSlZYTmh1cXB5QU5XMnEwSnZJS3FPS1Z5TmFSek5yVG1BTHha?=
 =?utf-8?B?dVcxR1hOdExjMllvZVduU1U4dGRRTkdwS1RLQ3RWOE1Jajl6T0pKRTNIVldC?=
 =?utf-8?B?Z2taNHJmU2VhaitSTktTcmsraXJwK2JFdEIrSURYN3FKTFI4d3FJbHRhYVJ4?=
 =?utf-8?B?dGozUDdyWmtzUWxiRVAySFFGKzFDVUNyQTN1dkNEQXErMjRMdkxjSFd2VlVR?=
 =?utf-8?B?Rng0aW1QMnFybnhMS3JyNmRBRzV4aVpSNlNhbXU3K3JDN3pJVjB4dWtra3Vr?=
 =?utf-8?B?My9sczlwR2RnazJBNWlEb0Z0U3ZsTTRHaWR4anZMb0Y3R1BMMmlKQVpzN1Ny?=
 =?utf-8?B?d3A0c1g2SVArRHhSNHgxdSswM0pPWmhoUm9rT28xSEp1bVlLbUNadz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 415b2ef1-9adc-4bb9-7785-08de6407b0fc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 16:08:53.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2d5nJPjbumR9AW9zhlt9ZmGynP3jbN5eluQe9pdaj/bAmdV+n8e6hZlAFlCdYvDKx1d3tqifM0cL1K0lR0+mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6591
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Mac.lan:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: 8021BE9F3B
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 04:00:09PM +0100, Jan Beulich wrote:
> On 30.01.2026 15:57, Roger Pau Monne wrote:
> > @@ -1117,6 +1130,14 @@ static struct page_info *alloc_heap_pages(
> >                      scrub_one_page(&pg[i], cold);
> >  
> >                  dirty_cnt++;
> > +
> > +                /*
> > +                 * Use SYS_STATE_smp_boot explicitly; ahead of that state
> > +                 * interrupts are disabled.
> > +                 */
> > +                if ( system_state == SYS_STATE_smp_boot &&
> > +                     !(dirty_cnt & 0xff) )
> > +                    process_pending_softirqs();
> >              }
> >              else
> >                  check_one_page(&pg[i]);
> 
> Coming back to this, I see two possible issues. One is that on x86 enabling
> of IRQs happens a bit earlier than setting of SYS_STATE_smp_boot. Maybe this
> isn't really a problem right now, but it could become one if the "wrong"
> thing is inserted into that window in __start_xen().

Even if IRQs are enabled a bit earlier, the watchdog is only setup
after SYS_STATE_smp_boot state is set.

> The other is that only x86 actually ever sets that state.

TBH we have never seen the watchdog triggering during initial domain
creation, so the workaround added here was out of caution.  There's a
certain amount of contention required for the watchdog to trigger, and
that scenario doesn't happen during boot, as domain creation is
serialized.

I could maybe gate the softirq processing as:

                if ( system_state < SYS_STATE_active && local_irq_enabled() &&
                     !(dirty_cnt & 0xff) )
                    process_pending_softirqs();

Or completely avoid softirq processing in alloc_heap_pages().

Thanks, Roger.

