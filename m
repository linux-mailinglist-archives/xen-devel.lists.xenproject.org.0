Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E97B0953
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 17:51:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609120.948000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWnx-0005LN-E8; Wed, 27 Sep 2023 15:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609120.948000; Wed, 27 Sep 2023 15:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWnx-0005JD-BO; Wed, 27 Sep 2023 15:50:25 +0000
Received: by outflank-mailman (input) for mailman id 609120;
 Wed, 27 Sep 2023 15:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlWnv-0005J7-WA
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 15:50:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fbc16fb-5d4d-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 17:50:21 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 11:50:16 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB7100.namprd03.prod.outlook.com (2603:10b6:806:339::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 27 Sep
 2023 15:50:14 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 15:50:14 +0000
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
X-Inumbo-ID: 8fbc16fb-5d4d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695829821;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fV+MInmBq14dFu7Vk/0gtK2ki3voS5XwxPRyqWRvQZU=;
  b=EkTAtUvSl/tS9yoq7TLEuXW/35hdTQ7m3dj3Gu8J5yZFTH8ROCyoAX4+
   3duKZyr6lzKX7Ws73hCpnU9PGAB+dT37TXXQub4BhaagpRee9qJ2peff3
   1cdd2m8ZNA/M1EaSwRVTY9SLaDGzxx+RZv/WcMvI2fxgdBfrRkmmObgnV
   w=;
X-CSE-ConnectionGUID: f3pPAYbpSpeEJg4EKtcDfQ==
X-CSE-MsgGUID: 7AOsZNadSnmGfxM70SbTjw==
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 122605272
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:vUj/CKBbMGrAMBVW/+Diw5YqxClBgxIJ4kV8jS/XYbTApD1w0j0Oz
 mpODzuDMvreYmKnLYh+a9i2/EoOv5TVzdNhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4GJC4QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9L1vOUh//
 +QjMD0gTB/fqsGqy561c7w57igjBJGD0II3nFhFlGmcIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuuzS7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCjy3rKVwnmTtIQ6S5Sf7cxMiVGowGk8Bg0zCgOAq8W7lRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrGDhuvbu9WX+bsLCOoluaIjMJJGUPYSsFSwot4NT5pow3yBXVQb5LD6qdntDzXzbqz
 Fi3QDMWgrwSiYsH0vu99FWe2za0/MGREkgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvqft3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:N8lUc6x02eY582f561gvKrPwBr1zdoMgy1knxilNoEpuA6qlfq
 eV7ZcmPH7P6Ar5N0tKpTntAsO9qBDnlKKdg7N/AV74ZniDhILAFugL0WKF+VDd8kbFmNK1u5
 0NT0DQYueAdGSTIazBkWuF+3dL+qjjzImpgf7Z1GpkSgtnApsQiDtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AqqAKtWscyceD1ZiVXGC22dls6IsrKWXl5UbaO3S?=
 =?us-ascii?q?gBEtLR+G4akOb1K1dxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AWeiSNw/QjKHQrKFKxOdkfxyQf5hBxL+cLkkBqpM?=
 =?us-ascii?q?DlMeUEHMoAD2hjiviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,181,1694750400"; 
   d="scan'208";a="122605272"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HZTD3/xl2ilR5uY44BglVkoNEKB05RVeWc8LMQdD00KMDUGGJdbWN8YJBVdoJ7MnP9zyPUAtfhpUVQt9W8PXMcrGPUb44YE7M+AX1F+HmDxCj4KjVFWeMMDCKJ2vsDGyCTvOv87D5P1ZER3rtOj41/rv1BWoNua+bqxLVz63BAyqMfcwOC0ky/qn08rBVfYt8NypnGRWvGPYO72tyvTKmjPQUIWMdYNzzEGAYYv/Cqf8WQ0v/S9Yd9ISNqjmOg6o3bpyXFambPwa+8isFnRX6bm4XxYeIkINFB36fsCv2w5Df2LyVObKApPEk461StMVthEzvrcyAkCamaTXTzZ98Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8Kca20AOx2EYnmCaABKEpvuuzEnsR8PeDWsogRdxnY=;
 b=e1KVs/YmMc7tfnCb7K+iNOUr27MbDIcrKRbAJNHb+sxjN1MU3UZ83qzSPjz+nQgS931yxJWKidceP/xZGd/SBHzwBLsoqoI9rc0bc5dTgqYQ/SKBnXQRq7C93jdn9p4EYQQB7OaZj1d0rFiaswFnKVXiVuGjzjlT29GaWWPP7kGM2d15Gyw4oAHMaHVZ4wFTg6gh1nyR2ZZ8WHNr/9JQY2nny2EDpi5HtiLx3dLVeyA1WkPf89S+USeQbGjDXQa0lzb4cpgzeIzqGJt5299KvcJcKoYnV7tyrv7f1LPwhTIz/25VkgGBokEuytOUmXvypL3MrHOiyP5pY4YoVwsE3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8Kca20AOx2EYnmCaABKEpvuuzEnsR8PeDWsogRdxnY=;
 b=fBzyH7UR6l7hJO89bXBS4VVKb5W7ixQ46RFQuJpGzeEVQErI2TwB2uSDhdr29/RsrdmZRy6QJP/3OfYEpvUxxq/+0On2KiFCVF99YfDb6OWaViLr5rz6hO6HAa4kuwVfUCHfoibyWhBNBiNOOQJFeSLiTZV0Ds0W9wO1UglXzeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 17:50:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 7/8] x86: introduce GADDR based secondary time area
 registration alternative
Message-ID: <ZRRPMAxlpB03_GMJ@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <77218fb0-5e96-4ecb-c2b0-4fe8c3ba683f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77218fb0-5e96-4ecb-c2b0-4fe8c3ba683f@suse.com>
X-ClientProxiedBy: LO4P123CA0625.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: 6deb59d9-fccf-4e2f-1481-08dbbf71702c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/HjZ+9KsBq5i8YYeiKMH6SXI5hDnbbnTyzmQr743xiBuo78++iXohusqgi1e8Yr89a4gjQkC97tOPxD/CFMBZ+CBtBcRw5XS+Q+u7BmvSzcbIo3oDn8c0P0hpgermvhH7etjY9+6Jbr6OeUf3FZbX9bDVuPg47kS9CHzJxPifsfJHyYO95lO88nzbsHWSHRA8mmWvtyItMBbJ4z1LcTvhgDAh3locIZ74fSrM7XQ7O5MKqsJaFxjlUadB+bJp52uY9XWgRPUwt11W9jZ6XTLyFrTDWFKwHMvFOtGPw5TtjFKuO8pJk0LbXKVQKFQMxsDreuWP1ALcw1XlOP/OP35F8bD54Iq7z11/kpJdNylNco63pcTtZGaA9KTlVgoL3QwuA1NEpkODtZ1E1Wo6w6eIFvWX5egoZnXuVJ0VV8UH4WV3VKY++MvojSaI2qRM1/PsiXUCJBnPLjZNMMefAsB136Jcoe6O2rTI8Kt0NfIkMP/6GWplmHNSeENq5/UJWvOEf4+gQuDIlRR3FehDpfmmYnPO3WkMjsXPY1P3/zjenk27XvwJcPkWDwI07cdcwGC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(136003)(346002)(376002)(39860400002)(230922051799003)(1800799009)(451199024)(186009)(66556008)(54906003)(6916009)(82960400001)(66476007)(86362001)(316002)(2906002)(38100700002)(85182001)(66946007)(41300700001)(5660300002)(478600001)(6666004)(33716001)(8936002)(6486002)(6512007)(9686003)(4326008)(83380400001)(6506007)(26005)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXEyaE5lTGhKWjI4SjBKa1dENWlTVnhOeEFPbUVQRFlrQ0JGTXpMU1Byb0Z0?=
 =?utf-8?B?UmdiU0JSdzJGcVY4OGhKTDNRSldTdXdsRm5MNktqUjVaSUp5aFRWcVVRVHo1?=
 =?utf-8?B?YU9yd3Q2TjBHbkJ1WGlmYXQxNGhYdjRRQnNaREJuOXB1OEUrc1gxazR4ZThz?=
 =?utf-8?B?bXdObExnblVIRnNTRExwWkR2akVUVHl2ay9GZFZhaTBZWmxGYnNMZGxibHRU?=
 =?utf-8?B?UUE1UFJCajE2VEIwL1JRa29RcXg3amdoazl5RE9xSkovbHNIcHBIYkRHN0Vy?=
 =?utf-8?B?NzlwT0hkbjMzVWNtQU5sczNRTmdYZ3F5c1RUVmtNSzlXNjROWG9IY3owS2hK?=
 =?utf-8?B?bGdmSUJPVlByc09ieTVabEp4QVhCK1NRVVBvRUF6MU81Q0NYb2NSQXJEcWhL?=
 =?utf-8?B?bS85NS92empsYU1salZUZEUxNEFESDRxKzBTbXVXWVI1T3paRVFmdlg5dnRy?=
 =?utf-8?B?bXltZVp2STlwMVhLam9HQVJoU1ZLNktTZTUxa2pOeXp5Z084M3Y4ZTlTYUxZ?=
 =?utf-8?B?MU14L0E1SENibGpIVjRmTWpMWGd4T2dGZmdVMy9UVXVVa3FaaE5abVFRR2Fq?=
 =?utf-8?B?TnNIOXVYUUVCRmpiSEtOaXJ4d3V5L1NDOW9zTkVNYTJXOXQ4SHk2RGlCUUhk?=
 =?utf-8?B?RUVIbEJ4NTRUQS93QUxGbDk3b0FkVVhFcGcyK3czQzZ6aU5hY1Q4RVBaUk8r?=
 =?utf-8?B?c0JpZjJya084RlpMU1R6aDU5NS95dWdCVFVXMGpNY2FJNlk3UUZGRHlNdy9X?=
 =?utf-8?B?YXhDN1AwSlRwNktOcjBLOTJWYmxKc3N1d09wSnpkRUVHWHkzUm1XK2d5K05C?=
 =?utf-8?B?bldTWnRaenBhekN1OTdpN01qbDNDTUttUnJrdEx4YmZwVjBoZy9ZVW1oWHlX?=
 =?utf-8?B?V1lnQ1lTdGQ5ZEVZWnFZaXF6V1d5Qm5kLzYrUUkyTXJXb0FrV1JBQ2hIbTVz?=
 =?utf-8?B?cnJTaXJ6U2VRbU1ESEthR1Q1QmdjL09pNFhqRVUvSVE3aVRDajhuUHJNWEFr?=
 =?utf-8?B?RHhMZlJBOXlRcW9EelFHSzF5RmJVQ2NVbFpnbGNXQ0k4aXAzV2RKVE1oaktW?=
 =?utf-8?B?Wk9rNHZFZmRCTG5uYm5GVzlHcEI1N0hEL3AvNUJ2aEZtcUhZRFJFTjJhVG9z?=
 =?utf-8?B?SmFwQTFlV0ZnSTV2cjg5V2lmZGhSZDRqcDIybG9kVEsyYUdQNVlwR0ozRVNn?=
 =?utf-8?B?bHJmaFFrcUhJMkVHR25GdGZ6dGJPY2dUdWJlc1BzR3RTVjU2VmNZTTJHSUNs?=
 =?utf-8?B?WUlPR0VmMUNIWERqS040cjBLMjBzOTR0MkxGWWRTOGQwU2NVRHNSR3pDblJW?=
 =?utf-8?B?K2pJdEw5THNlRHFvbHEyVXhVbGNRWmNqZ0NhTUtvWEc3RUY0RjFlVDMwZmhL?=
 =?utf-8?B?TkFxY3pXTzJaVlJFdHNyYVhrbjJTZnRyLzMyeDdNM2UwV1BQNmY4c3hMMGFY?=
 =?utf-8?B?TDBYWmc3UFdoRzR1Vy9haDVJQ0JDOFBza09aZXd5aXM4STdKTENUWXBxVXNZ?=
 =?utf-8?B?QmVSNzROVjM4Z25DRVBJSkc1Uk5KL0ZnMjNTMnZINXJsb3hUTk4raEo4MUJy?=
 =?utf-8?B?QU42cXJDSDdzR0ZGck42T2R0MlpEcGxlTmxYOVF1enpIdnVIaTJBTENVMkIv?=
 =?utf-8?B?ZER1TE9ua3g1dmhPaS9ZTllyekRrYWNjRUsvcjdhYU9FdERYT05PanA2RjNr?=
 =?utf-8?B?OSt5b1JHTGtEZXM2aWY0V0JPOFRqMUYrSkR5YW44N3dUcDlqZTFnRFVDYkgv?=
 =?utf-8?B?M0V6YVVhb1NyS0szK3A4bnlSYTRHVVpTcXhjQUdYYkVHS29LNW94d3FZM28z?=
 =?utf-8?B?WnE2MlFQUDZzYWRHSGVjaVUwTlJ1V2lvL0IyeTFwY2hjNVlqM1NYREZKV3BD?=
 =?utf-8?B?TEJCM0U0MTlvUUhDWERKZ1pKYjlLbkNrN1NpVDhWdlJKbVNYWTVCL2R3OWpH?=
 =?utf-8?B?Z3ZHbVBJWDdZbTlyWWRRTDEwcGFuMTJjN0FGK3RxVTk2cEpzaEp4RjR2QXFM?=
 =?utf-8?B?d1NvVFZpYTJLUHNFZU81aW9oclZWa0Y1NVhTUllxQWYyVXYrMFVZVTZOTDhU?=
 =?utf-8?B?Nkl6SUhIT01MUlA4SlY2OEsvc2dDU0FISjAzd2dabWhQT1lxZmdKV0tyOUpT?=
 =?utf-8?B?Q2pldzcyTEJBRU42K0xmUjI2UytxWllaVCtkZit2SGpaSUhYcHh3WVZpUFFS?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3QKa8f7QGFxQf/3jTGAeB6Rq2vtJ7u5tsGbdVx9bL/ey0gi5vCGzlodAwPuXWUjh139zQCqGCeWpWf6CZsSNF82Mk7ilaF7L7fO1Rb1wITUfRt2X/Vyxw6D+mZDXnog5+m0UwbggRIwVhedrqSYUkFtY9QNuFP2qqOhLe18zqxdrhgKQ43+ubG2y7bnIeaQ9YizxsWtudGohQqW96SuPLvyPKlq1ZvYENCrKc6ko0k3olKdaqc8PmmpU58jK2XHHwaSGtjUlO7Wx0+AlmsqBH2/yMX3msW0inQkIqzTmBKS2tVZWl4XKfUJVcy5wZ4FxDfdmu1qUNhp9wNVUaT/Tq0Yy/XMDVeWM+5xqSx/l2oNkUyM66TaZnG+8wvZSbgL77O4LUUUgmxuau+pBbP34DkOCXWfjTAXKb1SLFUrxin836zpw9fS2KUoESsaLw//eE0SvuVFE+AHWjoyJU0UUHiNT6Fj9KTIiE7MkDwlziG9kaUDxC+b7RNfvjFQpjWMXy5r6xFqeLVSrurPBmhhPoOmGtLs62q8dt9S+DJGpLOxQ93eFBn6XqqQU+nVnkNznxzqMbDNgfTVe+4KX9vIinuHNMe1djUz6fNajDE7R51SEvCx3ut038zNDw302FuxjFNIk5JLPYdZx8rMIIoO58hmVD9aIne4T7J6/mLOBMfx2E9EGL6Ia2iXnjOp63o81Q67G80fCGWy/R0b/Pq5SLFGlRz2tIRLYX3M99cjjdht8SFMsiDtdVEegRkvM+duR+hnce9whanuDJdVnJgm4oDiKU+c6CHpCNVao35uq4HhwfzxEp8PkD6OyvA2v2uZMkz+7YjGvkFRN2ulxhIZlBvFHyH2nna6Xss8BZ1tTPGk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6deb59d9-fccf-4e2f-1481-08dbbf71702c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 15:50:14.0130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzlbqxRqfrH0bOqYOIdlV6DDWYPhyrJygawJDa+fQN3nkAWLFzjgO6qRGhDSWneAxQ0r4bQmKWxNp4ouHmMC+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7100

On Wed, May 03, 2023 at 05:58:01PM +0200, Jan Beulich wrote:
> The registration by virtual/linear address has downsides: The access is
> expensive for HVM/PVH domains. Furthermore for 64-bit PV domains the area
> is inaccessible (and hence cannot be updated by Xen) when in guest-user
> mode.
> 
> Introduce a new vCPU operation allowing to register the secondary time
> area by guest-physical address.
> 
> An at least theoretical downside to using physically registered areas is
> that PV then won't see dirty (and perhaps also accessed) bits set in its
> respective page table entries.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> v3: Re-base.
> v2: Forge version in force_update_secondary_system_time().
> 
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1504,6 +1504,15 @@ int arch_vcpu_reset(struct vcpu *v)
>      return 0;
>  }
>  
> +static void cf_check
> +time_area_populate(void *map, struct vcpu *v)
> +{
> +    if ( is_pv_vcpu(v) )
> +        v->arch.pv.pending_system_time.version = 0;
> +
> +    force_update_secondary_system_time(v, map);
> +}
> +
>  long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
>      long rc = 0;
> @@ -1541,6 +1550,25 @@ long do_vcpu_op(int cmd, unsigned int vc
>  
>          break;
>      }
> +
> +    case VCPUOP_register_vcpu_time_phys_area:
> +    {
> +        struct vcpu_register_time_memory_area area;
> +
> +        rc = -EFAULT;
> +        if ( copy_from_guest(&area.addr.p, arg, 1) )
> +            break;
> +
> +        rc = map_guest_area(v, area.addr.p,
> +                            sizeof(vcpu_time_info_t),
> +                            &v->arch.time_guest_area,
> +                            time_area_populate);
> +        if ( rc == -ERESTART )
> +            rc = hypercall_create_continuation(__HYPERVISOR_vcpu_op, "iih",
> +                                               cmd, vcpuid, arg);
> +
> +        break;
> +    }
>  
>      case VCPUOP_get_physid:
>      {
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -692,6 +692,8 @@ void domain_cpu_policy_changed(struct do
>  
>  bool update_secondary_system_time(struct vcpu *,
>                                    struct vcpu_time_info *);
> +void force_update_secondary_system_time(struct vcpu *,
> +                                        struct vcpu_time_info *);
>  
>  void vcpu_show_registers(const struct vcpu *);
>  
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1633,6 +1633,16 @@ void force_update_vcpu_system_time(struc
>      __update_vcpu_system_time(v, 1);
>  }
>  
> +void force_update_secondary_system_time(struct vcpu *v,
> +                                        struct vcpu_time_info *map)
> +{
> +    struct vcpu_time_info u;
> +
> +    collect_time_info(v, &u);
> +    u.version = -1; /* Compensate for version_update_end(). */

Hm, we do not seem to compensate in
VCPUOP_register_vcpu_time_memory_area, what's more, in that case the
initial version is picked from the contents of the guest address.
Hopefully the guest will have zeroed the memory.

FWIW, I would be fine with leaving this at 0, so the first version
guest sees is 1.

Thanks, Roger.

