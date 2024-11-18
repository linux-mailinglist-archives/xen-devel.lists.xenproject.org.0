Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF0A9D0F55
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 12:12:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839269.1255089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCzgH-0001De-68; Mon, 18 Nov 2024 11:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839269.1255089; Mon, 18 Nov 2024 11:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCzgH-0001BP-2G; Mon, 18 Nov 2024 11:12:33 +0000
Received: by outflank-mailman (input) for mailman id 839269;
 Mon, 18 Nov 2024 11:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1K7B=SN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tCzgF-0001BJ-DP
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 11:12:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20630.outbound.protection.outlook.com
 [2a01:111:f403:2416::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd6f0341-a59d-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 12:12:27 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by BN5PR12MB9462.namprd12.prod.outlook.com (2603:10b6:408:2ac::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 11:12:21 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 11:12:21 +0000
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
X-Inumbo-ID: fd6f0341-a59d-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNjo6NjMwIiwiaGVsbyI6Ik5BTTExLUNPMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImZkNmYwMzQxLWE1OWQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTI4MzQ3LjExMTg0MSwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vc3aquoRcZOQlhHLSn8b1JkDGljlcKJ5alD5wx2bGeBdPXUpaqO2G9hq4NGJW1YXHl7bRJNNKgnIaC6oE25ddFdcyAUjMo9ULZ1UJkyXTYdOpeJEaDrR6u7J8H6EOUS6Xf6MvGT0breMWDC95RPcQjciiQBNDOPMLP8vc5OtBvttRk09kqeZRAZQ5D5dK0bUfvK9OJ1vSqQ6yaXoUdPIurzqaItkn1QkUyyuicKU/agpZUbFBasTDZSADjsKj/U8NNLHXFoh5e8QVE6yWQn7DMWLzTaGOu+H8Lv0pSkp3yX1nkj4hxr4V8pPobMWHvlRwIvqd8ljrEYU0/hH9arHkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRjWJLPEiDeDCX0UwMRDH1xZXMWZpswN2pOHaQ7hz+g=;
 b=ULwTaBpqgIJ7palzFBvo2driMRSdHy6hfeaYyrGNdVFYDN5DuKiiU63pb6QlcztFsEscw0hTdRGVwaRlTJLqNl8qg7ObfO2l3hpqIb83bRKUm5ATlc1m5QWH/4VpCILRTmYFNrK4ObEsU2ZjOORwelbD93aOY+Yi+Ta7gm8VN7S7sr3u5dGwladU7CTZ8nXrh9yRrJ/VtKoWWUoZRbPf0ZHret3HJsKtx5Z7KOs+/Di4WdhMAAvr50GJd9NtlBlGO4sLDjSkzLXqSlg9Fe8s7mrx8XF2VVX7BjwduVWNa/YteYPzF/rXrJLSyuDjlTAnauYfWUzOLPT3CCSavwrANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRjWJLPEiDeDCX0UwMRDH1xZXMWZpswN2pOHaQ7hz+g=;
 b=vQmvNg9TOijXKhqdIxKDc/OGkzKuPADQy1whaiZGFfnSR7KT0Igmz3MHvx8GuWw4pZRwp8L8FiVfxJpmsEW4P0pY7rmnRnb5uPvtJ7yuALutUbhqsANGZUlyN12h9LMBzCtEczs6oZnAuB9Op7j1Ua+JHHxbzo+SpvOr+owh9pI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c4399c89-6491-494b-b513-24498c4cce62@amd.com>
Date: Mon, 18 Nov 2024 11:12:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241107150330.181143-1-ayan.kumar.halder@amd.com>
 <20241107150330.181143-2-ayan.kumar.halder@amd.com>
 <96ac3dfd-8019-40b4-86eb-8d377880cdc0@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <96ac3dfd-8019-40b4-86eb-8d377880cdc0@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::7) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|BN5PR12MB9462:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc00f37-d8bb-4b3b-4244-08dd07c1df36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWQyeXo2M0VqRHFjN2lnQVJvVDRXRHRJV3NmU2haTVMyOGk1QkZuKzNjSHdt?=
 =?utf-8?B?ZVh0VEFzZ2dTYUVPbnBNckFQMGRsYXdRMU9hRmFBUXVmdXR6ckRqcTZLSmw5?=
 =?utf-8?B?NDVoK3lTbzVGNFZOc0JKK0l6M2l4UTNnSGljVGNKbi8xdEcycHdldUVRaXlt?=
 =?utf-8?B?d1JicHdPNkhoTXp3eUJJUTdxaGJ6RldPb0E2cHZla0JtWWIxdDJTdFp6WnUr?=
 =?utf-8?B?ZlJqbU90OFVKUHBxQjgzSFhSVUNpQnlFRkdjbVg4YWFKbFNMQVB2SlMzMk1D?=
 =?utf-8?B?NmU4SXM0WEszMUdmQUVRY25ZbEtNVlJKUHRYVU14Y0RNVHVQOXpIYmVPNU53?=
 =?utf-8?B?RHhZUkJUdnRBdXQ4VDFJOEhDMitsNjFlek9OOVFqbHBJZ0lVOG8zL2NDaGlq?=
 =?utf-8?B?ZzJSdDZEYmtIbHRnQjViM1hFZ01CaVRIYlFZYnBaWkF0MmlkZEtsYk85SjFQ?=
 =?utf-8?B?YXUxaTJZNVo4Vit5cm5vOFRlM28xV0VqT2FHNmJhYzBYVC9qQ25DOEcweDEx?=
 =?utf-8?B?bmZuTy9KWndLbmgxcDl5aXBKbmU3WklNUkoxNVpGSXZrZnJSR055d0JQS09J?=
 =?utf-8?B?bjhncXFKTDZscnBOU0FzT2FtRmhWWE5IMS9wdVJxNGc4UUM3TEV5QVF6RnQ2?=
 =?utf-8?B?aCtDNXRQRlQybjk4T2FHSkgvT3E2M2dDYkpmeHgzU3BpbWNxNHhEWkFRRksy?=
 =?utf-8?B?RHZkT2pUYm0rQU9ZaldCd1JsdlljOG1Ya0VVeVhaT2VQcWloSENZa044K2pW?=
 =?utf-8?B?U0xSNHg3RGplTXVUWTVRdkhMYnBXNGg5NDNsbW1UVEw0RFJGSFF1QzNaSjJE?=
 =?utf-8?B?SFIrVi9CUkhZS2ZSTDVweVhlTHhJZWxLSHRIYUhkUWRPZ3JidHNnSE94Q3I1?=
 =?utf-8?B?TWF2VlpURmk3TWlXaEVpRW9WWFFGMnd3UXJvT1Q0Rnl3N0psRmd5QzdpSFUy?=
 =?utf-8?B?Ym5RZVVpOS9mZ3A0OHNiN2ZpRzBTeGd1RzFhanR1bEgzaVRQWFBocnFsRURO?=
 =?utf-8?B?RUxEUURCY1VOVERSTnkrSi9wMHgvejN4MUR6UWJKQVYvZTYyRzZlcWJBVWNH?=
 =?utf-8?B?K0N0QWNCc3J1ajZFZVZSYmJDVDVZTjFwejd1RU9mT2tOZWlPQXJqR3NBeXVn?=
 =?utf-8?B?VlBhV0swWXFCTWxyR2R6dWtJaDlOU1l1aFpaVStRZ05lZXhHTlNYOVhjVU9E?=
 =?utf-8?B?U2p4ZjRWSjk5aVVIUE15ZzgxVDgyZHRWelBtK0ZBN0pJcXVvQTkxSSt6TGxm?=
 =?utf-8?B?ekpNRStOaXRVRFdKM2thd2Z6eWM4MGNSNXMrbDNsOC8vcGk0bmlnZmNxR3BP?=
 =?utf-8?B?TnBNUENaS0d1a3Iyd3J1K2hzN2Zmc0QyQ1NYaFI1NWNYcTRmRkc1YVRzZ2Vl?=
 =?utf-8?B?NHJPanNwbW9BMVQ0SzJieXUveE1pTXNMSG5ibXpTdkx4WGRhNEc3Rk5KTU1B?=
 =?utf-8?B?bzdjcEd5Z21NU0YwQnlGa1I3Wk9tNTJ1RHA1U3FSTmkwN0l3Y01BMjVuQjJR?=
 =?utf-8?B?V1oyNGdlRGdYUHJPTFZvT0NQTlZtVVMrTXZRbExoTGtuU0lJbFBOWmN3SE9I?=
 =?utf-8?B?SW5QLzJpcG5RbFNHL2t0dmVObXVza1RQdUFZdkdOVWtyU0FkTm8rOHNGYUlm?=
 =?utf-8?B?TGhBRmZtclk3amNBTitCY1l1NTlxcW9pNXdSY1pFaUY1aE5kQlJBeWdEQmQ0?=
 =?utf-8?B?TGo0b0xaMnlCWkorWXgwRkw5WWxSVlJ1M2hodEVJMFlkWHFFMHE0UnRzY0Zx?=
 =?utf-8?Q?yokUTMP75EQvKexZi2cFDvmEvorxGrqiVIPEyA2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGpTRmp2NXJQMGdSOHBHV0V1UitiZ2RHSDJtRVpsS2R5N1MrY3hQWHdWWldF?=
 =?utf-8?B?Y3krbjNWOCtDL2E0U1lFOG45Q054QTJjbG9mdUUyOFRzZjhxN0g4ZTNYZEhh?=
 =?utf-8?B?VzhGOXlmUnFxbWdZRkY4MGpYNFE1MW5Xa0V2TjREek9CYUNpSEg2SlU3d1JH?=
 =?utf-8?B?UThaaVI0R1lpYVVIQktIVVBLd0hqaUtUNFBPVFF1UFhObWNYTWRVVXNiV0Ni?=
 =?utf-8?B?YTdYNDVrV0l0S2hrK1lLcUxzTnNURVkvQ0o0RGtFTFFkT05JallsYjlDOWR0?=
 =?utf-8?B?Zm43Sms3Q3RvdVg4TlV3OVdxaEp1L3dPMVFUYXF5dFRBRlluRm05VWh2Q3ZF?=
 =?utf-8?B?RVNKeTl5TVJ4UE5XZk9ud1dKY25PWDU4elc1SVVvVUs1endyNnpnYnZEdjFm?=
 =?utf-8?B?ckJPRlBNSjlYSEJwYkpqK3Y0aWkxdXZndG92L2pMTDNLM3BFRDQrMWlHTE8y?=
 =?utf-8?B?bGExeVQxTUlJSmdzQldldFdTQVl6Z1k5VndnakI0bE9tRWw3cmFJLzU2dEl4?=
 =?utf-8?B?RXRnWmlNNkVBL08xTGpyRTJ2YUhlZWk4Z1NwbXV3dTcyUlY5cXZTYUVRMGdm?=
 =?utf-8?B?RW1JQWd4dFJKeW1OQ2ZHTEVrYmduZDlPOWpKakV1RVBoMmlrbTBYZUlLY1Vm?=
 =?utf-8?B?OWFJMWtwWVY5Ny9yM2h1SmU2emhaVzhGUzVsUURDaW1tb2prUDNjOWMxWUxn?=
 =?utf-8?B?WmtFSTIzQW5GSE1XV3hvbzArOGlSVUZmR01BdkdoN1VEbzB5VnR3Z3JTVHdM?=
 =?utf-8?B?ZGYzN3h0dWlaQzBKOHM5ZHRCVkFOMlBna2FNMWJRRGRYYlpTN1kwc1MydDdx?=
 =?utf-8?B?M0VuVWJHR3RRdWcvejNoT0hidGRFaXpKNjZyK2twY3h6UHZvQ0hnby9nbWhx?=
 =?utf-8?B?dmdDUFNtUXhqYXluSzZxY2QrK3BDRzF5UW9pK1RuaWJ3WHVMWFByMVM3alZJ?=
 =?utf-8?B?Y1E0Wm1hYjVxR3NCbWhrOTFRMUNiQmgrcjhickducTg2WWo2aUZSbjJIS2xo?=
 =?utf-8?B?cThkU3g5TTNEWmc3VFlMR3dHRkhYNU1ncGdiWC9wU3JjT003WHpPUnBoVzZj?=
 =?utf-8?B?NDZ2alZsaFBzSVd5V2ZhVUM2UVFtUG5VUGZyR2hIY05OWW5tWEZNNyt0dU1L?=
 =?utf-8?B?QmN6MlFQQWd4R1BZZkdreGloSUhiVUJjclVyeXU0VnQwWlJsMUxaY3J4c2JU?=
 =?utf-8?B?bk9sbU1iUmlRcmpUY2I2VU41ZlkybjJuQ3BKTW85c2NFaFgwaDBKOW9qQ0ow?=
 =?utf-8?B?cndCS1MzenVGT29hYVU1alN0MTVQM0E5SmpUeDdnQVJqRkVCUlpOT3ovVzAy?=
 =?utf-8?B?VmE4VkFqZ28rcUFCQ0ZIQlNrZDlqaWlLR2t0REZIeTN1S202cXJaRTlOWk1P?=
 =?utf-8?B?UjBrMzhCbUNQR1JFbGtqS3Vod0FqaTlYVFVkRER3bjhCRkQzOHpmTEE2WXI5?=
 =?utf-8?B?d1ptbzhoVDhkcmJKWUhiQ1hLZjhTK3ZUdkMyd0x1Z2pBTk1LaGtYYUZ3bDEr?=
 =?utf-8?B?cEFwSGR3K1RRMFg0cGlTOWNxWFd1TnU1djdSZTVma3ppMXo4TVlIZGZkOG1l?=
 =?utf-8?B?ZnUvQUl1WnVHQzk2TVdzTWk2Q2RiQ0dNbzBtSlMzUm02QlBaemx6TTh4ZThq?=
 =?utf-8?B?cTQrelRxSUtYR2hvWjBOeXVLYzQ0S1djTnFxbTlMOGJKU3pzYW9tc2h4MGVi?=
 =?utf-8?B?Ny9nOTRtSFM3TGZsb1NTWmp2ck1sMERYYzVQYWtJTHZvT2lFRzVYUUQwY3JT?=
 =?utf-8?B?b3ZLQmdKa3U1bjVjRXg2M21vSXRMMEZET1JXUk9EMVNFTGt3YUU5SHVuME4r?=
 =?utf-8?B?cDYwYlhyTkV2WUc1alRhRnpwdHhyU09Yc2ZnRkNObURSUTBTS2ZnQisvRTVI?=
 =?utf-8?B?NGZYbkMybDRQaFgwYm1LYk43YjJ3SFpjeHpQeXpQNlBiTFBJa2hYMU4xRGFU?=
 =?utf-8?B?bnRaR05yNUZraEE3TWpqR21Tc0NvaVRCNWM3K1V1MjZGWGxwTjVVLzVGYWxx?=
 =?utf-8?B?SDVYLzM3TWJDc0xxZy9sU3E5L21OM3RBbjJWVVdYYTB1TkIwOWJNYVBpeUdO?=
 =?utf-8?B?NHZEdnhveHNBUEc3emJiTnRXRXhPc3hCUnNWZ1VsV3ViSy8wVCs3NE9UZEM2?=
 =?utf-8?Q?tZ/mDJ2dCwhv//tq7caqI82cH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc00f37-d8bb-4b3b-4244-08dd07c1df36
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 11:12:21.3956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kW2+oCkLmzLNcmXwzmp2t4sAOMz043czJ5WRfX9b8mrMvPdpiIJQ/evvVd6Q4jZGqzDHWbDW8WGE9LERLyU9nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9462


On 16/11/2024 10:30, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 07/11/2024 15:03, Ayan Kumar Halder wrote:
>> +/*
>> + * Macro to prepare and set a EL2 MPU memory region.
>> + * We will also create an according MPU memory region entry, which
>> + * is a structure of pr_t,  in table \prmap.
>> + *
>> + * Inputs:
This needs to be removed as some parameters are both input and output 
(eg sel) and some parameters are for temporary storage (eg prbar, prlar).
>> + * sel:         region selector
>
> ``sel`` is now also an output. But looking at the description, we 
> don't seem to say which registers are preserved or not. For instance, 
> both ..
>
>> + * base:        reg storing base address (should be page-aligned) > 
>> + * limit:       reg storing limit address
>
> ... the two registers above will be clobbered. On the other hand...
>
>> + * prbar:       store computed PRBAR_EL2 value
>> + * prlar:       store computed PRLAR_EL2 value
>> + * maxcount:    maximum number of EL2 regions supported
>
> ... this will be preserved. So I think we need to clarify it. For 
> instance, this is the description of create_table_entry_from_paddr:
Actually prbar, prlar are similar to tmp1, tmp2 (ie scratch registers). 
I used the names so as to make it more meaningful.
>
> /*
>  * Macro to create a page table entry in \ptbl to \tbl
>  * ptbl:    table symbol where the entry will be created
>  * tbl:     physical address of the table to point to
>  * virt:    virtual address
>  * lvl:     page-table level
>  * tmp1:    scratch register
>  * tmp2:    scratch register
>  *
>  * Preserves \virt
>  * Clobbers \tbl, \tmp1, \tmp2
>  *
>  * Note that all parameters using registers should be distinct.
>  */
>
In our case, it will be

/*
  * Macro to prepare and set a EL2 MPU memory region.
  * We will also create an according MPU memory region entry, which
  * is a structure of pr_t,  in table \prmap.
  *
  * sel:         region selector
  * base:        reg storing base address
  * limit:       reg storing limit address
  * prbar:       store computed PRBAR_EL2 value
  * prlar:       store computed PRLAR_EL2 value
  * maxcount:    maximum number of EL2 regions supported
  * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified 
it will be
  * REGION_DATA_PRBAR
  * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified 
it will be
  *              REGION_NORMAL_PRLAR
  *
  * Preserves \maxcount
  * Clobbers \sel, \base, \limit, \prbar, \prlar
  *
  * Note that all parameters using registers should be distinct.
  */

- Ayan


