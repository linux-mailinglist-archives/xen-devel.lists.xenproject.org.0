Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6O5dJbkRcWlEcgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:49:45 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D99645ABF5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:49:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210120.1521940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vicKO-0007y9-V8; Wed, 21 Jan 2026 17:49:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210120.1521940; Wed, 21 Jan 2026 17:49:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vicKO-0007wM-SO; Wed, 21 Jan 2026 17:49:12 +0000
Received: by outflank-mailman (input) for mailman id 1210120;
 Wed, 21 Jan 2026 17:49:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZBm=72=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vicKN-0007wG-HR
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 17:49:11 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c9ebde2-f6f1-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 18:49:08 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS1PR03MB7822.namprd03.prod.outlook.com (2603:10b6:8:21e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Wed, 21 Jan
 2026 17:49:05 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Wed, 21 Jan 2026
 17:49:05 +0000
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
X-Inumbo-ID: 7c9ebde2-f6f1-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMwr0ikJ1+9FroUhnSQtbpaFURJ5Ik39nzlZlq0D83xxKuVDCmM67DjAJwNwOAEpSV5fy8ghw1oCw9TMckWwPZag4HBIl9CXDes6UMdV+wwwNPoOdV9jV/EOJN0a+XxV4ywd/B4kOnmIVxSYz7/QlORlLwUpdWU1M5Ye/wae+un1LVu4ebGBTFMQcw+4uhmAJqI/6f2WNrTxMrYs1ITJNT/AVEITeRXh7BAyh75OgwutUQpmE0pHTdY08H8obDMNJhe4EmCd9FFZVE//ZBTMoeykuEisBh0i9s5UNb4ova5E3esaBd/X+V+s8oUc/FHlk7QwRjBt42Z3g1M1CZKpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0cczWyKNa7cIIXwA2GYSVC70Yghs+2kyaWTjSUaepo=;
 b=sFWHMwgGJdthGKtpOpCd+KuE23+80dIgz8BuAI6SZWZscGlZbABkP8CYATebr7ngececkG6Gf9PEDEAYnyIOIDNpucUvTQWP2tUA6w6Vwk+EY991Y/MQrFgaTEowax/3hPxUWwvDhPeWvKfnndHyUcCsHi1L3w94m9AHyhrVGPzzaLZjtMxbowvsTd+98YeQQQ8lWsy/thMeXtIRuDU0nPVMp1iT7wDYsEDdpxaaADPR7coNKd9+au08YmLBZD95+PRaV6KpFXYD16GJZzHioV8racVFdpTXu6Y/ZyA8FGStdwhgYwgzEfIdVKCl2etpPPW5PMdzZgt9RwQHTARrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t0cczWyKNa7cIIXwA2GYSVC70Yghs+2kyaWTjSUaepo=;
 b=N8iuBTIqPrrhuYlhbUcLlkayQcfIhTNh7BNvpY6uBG5GqjO8Ai/P0ALKT+s2zVkU/MdE27b5Pdev6rhXbInpTtGXsvTh9xfA1G1kcKcbLiCx71razK/ugGZ2xeiCubmcj2TN3YuHMvQKobAVRhTL6PLpx4rVNsPBeM+2JNkM30k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 21 Jan 2026 18:49:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	James Dingwall <james@dingwall.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH] Partial revert "x86/xen: fix balloon target
 initialization for PVH dom0"
Message-ID: <aXERjdPS3KlcD3C-@Mac.lan>
References: <20260120140648.25977-1-roger.pau@citrix.com>
 <b515af46-87f9-49eb-9d05-08315b25eb96@amd.com>
 <aXC1sFjIRUEB7qOW@Mac.lan>
 <d6e91265-b045-4257-8a41-6cb77a785924@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6e91265-b045-4257-8a41-6cb77a785924@amd.com>
X-ClientProxiedBy: MA3P292CA0067.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::8) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS1PR03MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ece9cfd-22d2-4b0b-3586-08de59155e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTNQd1djajA0bmg2TEFtbTZEV0w0NzF6VHF2R2ljOFNWa1ltZWJQUmFHTnFF?=
 =?utf-8?B?WWZIOHBPQ3VGd0hpd3FUc0VwRmEybG1yZVN5aEhVeHdPK0J3OEUvMDJNemxN?=
 =?utf-8?B?MHRHT2Z3MUZIVHZEYnVldU1pUHBnaWNhbGNkNjRZVlArM0dLTEl5d0dGb2xN?=
 =?utf-8?B?Ky82U1VCSi84ckkwQUxNME11YTFEZ3grVUNaT09nZXpTZllsdjJvdXJhUFlV?=
 =?utf-8?B?ZXBqalltbDlCNGJrSWYvT09ONlVEdzcyRlRUZmx4Tys4SEdzQVF4aUVrKzFM?=
 =?utf-8?B?SUNQZkFYbnI1cmZjRVltR0RHVXRqWEJ0RXVJM3hKaDFLeHgrRlZUOGo5QnY3?=
 =?utf-8?B?SlM4NDcwcmJ2VEtlNzlhZDlHb2Uxa1NhaG40bVBmdG1sUXArZXN0R3RzQzRm?=
 =?utf-8?B?dU5RQzJtelllZFVCYlhVRDMrWlRlc28veEdTeGh1M0FUci9nV0dZOFNhMXh3?=
 =?utf-8?B?d3hxYWtFZFZVQzdMdG9PRXNEUThER3ZNa1kvdGNjUDVsSDhjUHVEY0pSZDZO?=
 =?utf-8?B?bExyN003ZlY5ZmdTYlc3ODBQQ0lhU21UNXZEVld2bHFGeTY3cUxCR2NFSzFP?=
 =?utf-8?B?RHFvWTU5bjNrUVYxazdqUHZxRkZPK0JNekIvRzg1QzdkY2hOcUZsYkdlcHBJ?=
 =?utf-8?B?LzFjOFp2bjY3Z2E5KzVwZU1CSkJUaHhVckUvL2RIdWJQUkdMTjNoc2VqS3hw?=
 =?utf-8?B?elJTVnBiZkQ3TmZPMlAzK0NJK1F6cWFPK2Z1QUhCTDRlcVZoeEM4Y0RvL1By?=
 =?utf-8?B?ako2QTkxNXlkbk1xYXcxTmJydjh6Nk5KaEJiWVU5QkRBbC9PbitRaE9nYzly?=
 =?utf-8?B?WlZkbHZzWVJRUUxQYTlkaDBrVEh5U3JiZVlwLzAwYzhXcTJSRlNsendFZmZu?=
 =?utf-8?B?c2tzc0xtSnNYUFBVcytmbDkyMnAyR3RpaVp0WW9TbmlaaGQzeFI3VG9Ud3BZ?=
 =?utf-8?B?a0dmdnlNSzJhZENQdURsNHU5ZlhqN2NWd25wZEo1eFB3RUtDMWxDZHArVWhN?=
 =?utf-8?B?RWt5NE5FcUIrcGxCZUVJNzVlY3RHWnNZZ1BNMmFBN29kaWpvT3JtWVZ1Mzda?=
 =?utf-8?B?dFhaQjR3aXBhVEpjQ21xcjRKVWhRK3R4OEVtdG1nVkd4SXJwQWwweWRKSk83?=
 =?utf-8?B?MzFsajdEeFVvTVZ4aldUeGp4TFlpU2l4MkpsOHU0anN5Rm4yaTlMalFPR05C?=
 =?utf-8?B?aU1DVmtwZk14ZzdaRDJrMEZpb1YreVh6KzRtdytTOW1RK0FQc1VRVENYZkRl?=
 =?utf-8?B?UnBIbzUyTk1waG1rYzBOR1Z6cWt4TXM2MTduWFhXNEdmbjFNeTdhaUFFZ0lY?=
 =?utf-8?B?QUVzNmoyQm9xdFM2ZmdINVhzSExmZm9ST1pRRDZzdzBFdEtyV21Mc3ZmUWRu?=
 =?utf-8?B?bUJQN1ViTXRoT3VwZ3RlWjU0dWU4emdkU2VObFcxNnRqdTdCSXo0NUN2SERW?=
 =?utf-8?B?bUtXK0t3bUtsQzZvSVhYSVdhYTFsV2E5aUhFc21ORGZ6bzZJNEY1ejJFT1hl?=
 =?utf-8?B?Sk9SWkVvVFBub3pONHY1eDdyait2dTRiSmExSUdOa2ZxcmRLWTBZeVBrTHF1?=
 =?utf-8?B?VmkxZmFZc0FRQmhBMmFjcEdZSFdqb0VqVk4yU0cxZkFwUEV1b1lIK1YxLzBI?=
 =?utf-8?B?c3paQ2U4eGdtZm1QRlQ3UVBEU3Btd2pmSmlKU1FVNE0vUnBvVUdNWWVFNXhL?=
 =?utf-8?B?c1lmQWswa1JENmptalErdWZVNWhOK2k5ZldrMXAwait0VENicnFEam9uZHZO?=
 =?utf-8?B?UGd2b2FHMFBsbmMyb1NXNmdDZTNqdVlPMXFncDZYMWt2ak5POG5aSnlwZ2l5?=
 =?utf-8?B?V1RhRjJ3WW9SMENlbVF5TUhxK1ZIMjBYallxZk15ODIzNDFramRCZnFEVk9H?=
 =?utf-8?B?dUFPd3dWTklTbzg1WU9zdXp1YWVzUlN2QkZmSEphN0pJeEZVQzRYZUd5d1JD?=
 =?utf-8?B?OE5GbjNHNUZQUDFOaUxrSGcxaGlpQy9sbU9BM0l2OTRIT05wTjZEYjJWNUV0?=
 =?utf-8?B?QUYvZTExL2RwbExtQ2NhRldMUkU5YmVsMS83aFlDNWkvWkJGZk5QM2FKMTFS?=
 =?utf-8?B?T2Z1NEhQQlI5eVE3bXVyanJGL0I3Z0lQMUxsSkhnYUk1Z0RvdWZTMGY3VE1L?=
 =?utf-8?Q?Q8xw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGJNVGYvWWJNUElqZ09zbU8wVGhHbnhKQ3luSnlHQzJlK2NBWGh0Nmk3bk13?=
 =?utf-8?B?STdPR1NJT2FJNkdZM0Z6b2F5MnErMldCSHNjb0J2Y2VKUVBUK0hOVm9VbkZr?=
 =?utf-8?B?bkxnbURWdzNSaThGeWk3RWtHKzkwdjgvcSt5Vkc2QTNwK0ZYbCtsSHR2bk9C?=
 =?utf-8?B?b0R3bElEYjNoMFJvNTVPV1ZITzdwWjdkbUFUOGNWQmRZZi9WQ1NLdXdHd29F?=
 =?utf-8?B?bHh1azlMT0pMbndUUzNUd01kcnROVWplNDAzSURlZm1tcEtBTDh6ckowdWNv?=
 =?utf-8?B?blh3L2JwSk5WY1BPK2VmbkUzTWVtUGVCRkFUY0tJM045OS9xRzRHU1RVbWxl?=
 =?utf-8?B?QW9HanNFVmZ6cGV2eVJJT3psSTZtR0orZUxhS1BFMjJhSE5KOU4wWUhmenBU?=
 =?utf-8?B?K3NEVnJWYVRtRW9xTVA1a3hIdWxtTVpWRTlVeXczc2hLZ2ZkZlk5RHVQSFBK?=
 =?utf-8?B?d0hSa3FtZWlUeGwyckRWc2dMRFRDVWh1RlYxY1JabTQyT2tRTVppNFlaRlJ0?=
 =?utf-8?B?Y1MxQWV0Rnl6NDR0R0UvcUdEYzIwNXBIU2tJZlgxYzJYTHc4dElwKzBuZGxt?=
 =?utf-8?B?L3NVcEVkTk1QWTJGQlB5QlJDODZ6OTRSU05XUTYyL2lTaUo1MFdaOTREd1ox?=
 =?utf-8?B?NFExS1JLUFk0Tk9URGlHdC9YbU4rWER1a29VQm53eWNiOS9Gb1pNNkN4d0Vp?=
 =?utf-8?B?OVhiQkxqRmFPNFhWWnhPMWhnd0RROFh6Mm16R2VNcVJYcE5FQm5IUGxhSnd5?=
 =?utf-8?B?ZEdhN0ViUkFyaXplMXU0aTdlcmhjN0tNaXpDZGd0eUxLNFpuL1dQcURQMlN6?=
 =?utf-8?B?OHg2MUJ0QmtrTjRSMm1BTGRCNmFvSjhQSFhGOFh3QU1GNWo1R29RcG8zOS9K?=
 =?utf-8?B?MmpPM0dXTUk0ODA0UDE2NDNBU0NSKzlISVVDZFBYSzlkemJWM0RQc2p5T3FW?=
 =?utf-8?B?NG4vZTZTa2cwMHJmQ2hPQkVQaStSbjg1SVZxTmxRV2R6RHdENWpkcUNQcW5x?=
 =?utf-8?B?ZTdFWS9zaU9pMGtyOFZNNUNUZTBjYkJhbDhpMitNNlIyZjdiNFlMUEcvSjln?=
 =?utf-8?B?TitIV2FldE5NUEdXRG5ZMkxsOWxHbUNnYm45ZDdTR0EyVzZmVUIyRnlZTGVN?=
 =?utf-8?B?N0FMZ3VFdUUzMnV6MGF0ZlNwL2EvNnBiay9DUzVmckMrNUN0U3Z3K0NpREJ5?=
 =?utf-8?B?UjhyR3VhUThSK1FOWEFRY0p2aC90ZDV2WHFXak9nektDbVh1UHl4K0xKSU1G?=
 =?utf-8?B?djlSTjRJSFptZGtPYmUwQUNJTXdXaTErcWg2MlRJTUlidVNCamZ5MlRaUVc1?=
 =?utf-8?B?Z1V5aGFtZGlSSGh3VWVjUndtTmN6ZWdzL3NhUUttMVhwRnowUVB0eUlwUU5U?=
 =?utf-8?B?YlczckVlYThDL2crWHVPZTh6WXoyMENTQmZ1bkViNXBWM3J6c0ZlM21qamFt?=
 =?utf-8?B?b0o4djFJNUUzazNUcmFSVnRCeUhzYzhaR0J5UDkvSEs0Zmk2YTBRQVVaM1Vt?=
 =?utf-8?B?cjNCeCtxMG13N0tvbGNTelVCTWNBeExWaGZEM2c4SU9JandaYlNzWG5QbTl0?=
 =?utf-8?B?MWx3ald2ZVE3SlNSNTUvcWlxMVd4ejZOU0xWSEZGTGtoWVRWZkNhVEZYeFdk?=
 =?utf-8?B?WnBSQWlXSTlyUDRvVWQzWXcvZXV5d2lpK1hheEY2ZGk0Nk9QYmhTb0c5OHlW?=
 =?utf-8?B?RzBxdmdydWdPdWtjaXd1TENsM3dyVDNrbG9zblo5ZjVvaE01dDlwQkZHT2pP?=
 =?utf-8?B?VEoyazFaZ2VRcHNiN2Jhc29IUXo1LysxRDBTcVVMajc3Q0Z2b01uODJjUmto?=
 =?utf-8?B?VnB5R1hjS0dRUThsWThmUnBvbzZVTE0xNU9IZkJtNGtwWTFia21lNlJVUUxF?=
 =?utf-8?B?bHlXKzBtSkpISFhiMlc2RU9RQjdnQ3FIZHJHcmNPczRLSDBuazhycy9saUw4?=
 =?utf-8?B?b0Y2VkhSVVpzMmxHc0tMV1BHclMyZ2poMjlDQjdyNzZKVnBFTUZhV25Xc1ZK?=
 =?utf-8?B?dDM2VU9XTnlldXVmSW4vNVdCU0xVQkt1VjRtVFBNcmZkYlVWdXQxWVk3Wnc4?=
 =?utf-8?B?QXgyczNmN1NubGxkSG9QN0pLa1Z4Tnd1ekQ1L3JQRGlYcjZwenNqYjM3eTMx?=
 =?utf-8?B?Y0I5ajY5ZE12d3ZiVmtpTGxxRklpV2VuYzh4bHRiTVM4ZjFrbVI3N01QaGlK?=
 =?utf-8?B?ejFiTElsNnhyVmRreWUyLytNMXRvVHpQdnR4VTMrMVFzVzNmYUZleDFreW80?=
 =?utf-8?B?WDFGckhaN01YWURiV0dXY0kzWkRSbG91QnVXOGRHVDRHVEIvMWJkQUl5V0Ry?=
 =?utf-8?B?b2ttR2huOXZsOWFZSEtpUlo2enRiYTlmT1B6ZXE5UVdRclkwWTcrZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ece9cfd-22d2-4b0b-3586-08de59155e75
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:49:04.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vNNghCLLA4Wt3weJJXD7nTh8e0Xpiy1kwsb7ABsoKkeLMCs21rnEYlbRcPEpR/rOIbhFiGRyYoEORhlSVCGl+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7822
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,Mac.lan:mid,citrix.com:email,citrix.com:dkim,dingwall.me.uk:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:james@dingwall.me.uk,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D99645ABF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 12:21:33PM -0500, Jason Andryuk wrote:
> On 2026-01-21 06:17, Roger Pau Monné wrote:
> > On Tue, Jan 20, 2026 at 03:10:06PM -0500, Jason Andryuk wrote:
> > > On 2026-01-20 09:06, Roger Pau Monne wrote:
> > > > This partially reverts commit 87af633689ce16ddb166c80f32b120e50b1295de so
> > > > the current memory target for PV guests is still fetched from
> > > > start_info->nr_pages, which matches exactly what the toolstack sets the
> > > > initial memory target to.
> > > > 
> > > > Using get_num_physpages() is possible on PV also, but needs adjusting to
> > > > take into account the ISA hole and the PFN at 0 not considered usable
> > > > memory depite being populated, and hence would need extra adjustments.
> > > > Instead of carrying those extra adjustments switch back to the previous
> > > > code.  That leaves Linux with a difference in how current memory target is
> > > > obtained for HVM vs PV, but that's better than adding extra logic just for
> > > > PV.
> > > > 
> > > > Also, for HVM the target is not (and has never been) accurately calculated,
> > > > as in that case part of what starts as guest memory is reused by hvmloader
> > > > and possibly other firmware to store ACPI tables and similar firmware
> > > > information, thus the memory is no longer being reported as RAM in the
> > > > memory map.
> > > > 
> > > > Reported-by: James Dingwall <james@dingwall.me.uk>
> > > > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > > 
> > > Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> > 
> > Thanks.
> > 
> > I've been considering what we discussed and as a separate follow up we
> > might want to attempt to switch to using `XENMEM_current_reservation`
> > for dom0?  It might make the accounting in PVH dom0 better, as that's
> > what the toolstack uses to set the xenstore target when initializing
> > dom0 values.
> 
> Yes, I thought that could be a follow on.  I've attached what I have tested,
> but it is based on a branch pre-dating xen_released_pages.
> xenmem_current_reservation with PVH dom0 seemed good without the
> xen_released_pages adjustment, but I don't know what that would be for a PVH
> dom0.
> 
> Regards,
> Jason

> From 8b628ad0ebe52c30e31298e868f2f5187f2f52da Mon Sep 17 00:00:00 2001
> From: Jason Andryuk <jason.andryuk@amd.com>
> Date: Fri, 7 Nov 2025 16:44:53 -0500
> Subject: [PATCH] xen/balloon: Initialize dom0 with XENMEM_current_reservation
> 
> The balloon driver bases its action off the memory/target and
> memory/static-max xenstore keys.  These are set by the toolstack and
> match the domain's hypervisor allocated pages - domain_tot_pages().
> 
> However, PVH and HVM domains query get_num_physpages() for the initial
> balloon driver current and target pages.  get_num_physpages() is different
> from dom_totain_pages(), and has been observed way off in a PVH dom0.
> Here a PVH dom0 is assigned 917503 pages (3.5GB), but
> get_num_physpages() is 7312455:
> xen:balloon: pages curr 7312455 target 7312455
> xen:balloon: current_reservation 917503
> 
> While Xen truncated the PVH dom0 memory map's RAM, Linux undoes that
> operation and restores RAM regions in pvh_reserve_extra_memory().
> 
> Use XENMEM_current_reveration to initialize the balloon driver current
> and target pages.  This is the hypervisor value, and matches what the
> toolstack writes.  This avoids any ballooning from the inital
> allocation.  While domUs are affected, the implications of the change
> are unclear - only make the change for dom0.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
>  drivers/xen/balloon.c          | 9 ++++++---
>  drivers/xen/mem-reservation.c  | 8 ++++++++
>  include/xen/interface/memory.h | 5 +++++
>  include/xen/mem-reservation.h  | 2 ++
>  4 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
> index 528395133b4f..fa6cbe6ce2ca 100644
> --- a/drivers/xen/balloon.c
> +++ b/drivers/xen/balloon.c
> @@ -713,10 +713,13 @@ static int __init balloon_init(void)
>  
>  #ifdef CONFIG_XEN_PV
>  	balloon_stats.current_pages = xen_pv_domain()
> -		? min(xen_start_info->nr_pages - xen_released_pages, max_pfn)
> -		: get_num_physpages();
> +		? min(xen_start_info->nr_pages - xen_released_pages, max_pfn) :
> +		xen_initial_domain() ? xenmem_current_reservation() :
> +				       get_num_physpages();
>  #else
> -	balloon_stats.current_pages = get_num_physpages();
> +	balloon_stats.current_pages =
> +		xen_initial_domain() ? xenmem_current_reservation() :
> +				       get_num_physpages();
>  #endif
>  	balloon_stats.target_pages  = balloon_stats.current_pages;
>  	balloon_stats.balloon_low   = 0;
> diff --git a/drivers/xen/mem-reservation.c b/drivers/xen/mem-reservation.c
> index 24648836e0d4..40c5c40d34fe 100644
> --- a/drivers/xen/mem-reservation.c
> +++ b/drivers/xen/mem-reservation.c
> @@ -113,3 +113,11 @@ int xenmem_reservation_decrease(int count, xen_pfn_t *frames)
>  	return HYPERVISOR_memory_op(XENMEM_decrease_reservation, &reservation);
>  }
>  EXPORT_SYMBOL_GPL(xenmem_reservation_decrease);
> +
> +long xenmem_current_reservation(void)
> +{
> +	struct xen_memory_domain domain = { .domid = DOMID_SELF };
> +
> +	return HYPERVISOR_memory_op(XENMEM_current_reservation, &domain);
> +}
> +EXPORT_SYMBOL_GPL(xenmem_current_reservation);
> diff --git a/include/xen/interface/memory.h b/include/xen/interface/memory.h
> index 1a371a825c55..72619a75fed2 100644
> --- a/include/xen/interface/memory.h
> +++ b/include/xen/interface/memory.h
> @@ -104,6 +104,11 @@ DEFINE_GUEST_HANDLE_STRUCT(xen_memory_exchange);
>   */
>  #define XENMEM_maximum_ram_page     2
>  
> +struct xen_memory_domain {
> +    /* [IN] Domain information is being queried for. */
> +    domid_t domid;
> +};

Other callers that would use xen_memory_domain just pass a pointer to
a domid_t, I think you could simplify the patch to the diff below,
which sits on top of the patch here:

I haven't tested it yet to see whether that's OK to do on PV, I would
think PV and PVH would be the same here, since the setting of the
xenstore target value is based in the return of
XENMEM_current_reservation for both.

Thanks, Roger.
---
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index e799650f6c8c..c592d7bae8c3 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -724,7 +724,8 @@ static int __init balloon_add_regions(void)
 static int __init balloon_init(void)
 {
 	struct task_struct *task;
-	unsigned long current_pages;
+	unsigned long current_pages = 0;
+	domid_t domid = DOMID_SELF;
 	int rc;
 
 	if (!xen_domain())
@@ -732,8 +733,13 @@ static int __init balloon_init(void)
 
 	pr_info("Initialising balloon driver\n");
 
-	current_pages = xen_pv_domain() ? min(xen_start_info->nr_pages, max_pfn)
-	                                : get_num_physpages();
+	if (xen_initial_domain())
+		current_pages = HYPERVISOR_memory_op(XENMEM_current_reservation,
+		                                     &domid);
+	if (current_pages <= 0)
+		current_pages =
+		    xen_pv_domain() ? min(xen_start_info->nr_pages, max_pfn)
+	                            : get_num_physpages();
 
 	if (xen_released_pages >= current_pages) {
 		WARN(1, "Released pages underflow current target");

