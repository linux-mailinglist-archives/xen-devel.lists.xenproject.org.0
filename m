Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7A956F987
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 11:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364958.594947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oApJB-0008C2-52; Mon, 11 Jul 2022 09:02:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364958.594947; Mon, 11 Jul 2022 09:02:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oApJB-00089T-1K; Mon, 11 Jul 2022 09:02:25 +0000
Received: by outflank-mailman (input) for mailman id 364958;
 Mon, 11 Jul 2022 09:02:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTyw=XQ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oApJ9-00089N-Gq
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 09:02:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bd3ea7c-00f8-11ed-bd2d-47488cf2e6aa;
 Mon, 11 Jul 2022 11:02:20 +0200 (CEST)
Received: from AS9PR06CA0176.eurprd06.prod.outlook.com (2603:10a6:20b:45c::14)
 by VI1PR08MB3966.eurprd08.prod.outlook.com (2603:10a6:803:de::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23; Mon, 11 Jul
 2022 09:02:17 +0000
Received: from VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::1b) by AS9PR06CA0176.outlook.office365.com
 (2603:10a6:20b:45c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Mon, 11 Jul 2022 09:02:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT064.mail.protection.outlook.com (10.152.19.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Mon, 11 Jul 2022 09:02:16 +0000
Received: ("Tessian outbound 190453a6d737:v122");
 Mon, 11 Jul 2022 09:02:16 +0000
Received: from c590733b9dcd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DE69C94E-720E-4104-B4AF-9BE0F30BC396.1; 
 Mon, 11 Jul 2022 09:02:10 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c590733b9dcd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Jul 2022 09:02:10 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AS8PR08MB7720.eurprd08.prod.outlook.com (2603:10a6:20b:508::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Mon, 11 Jul
 2022 09:02:08 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%8]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 09:02:08 +0000
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
X-Inumbo-ID: 2bd3ea7c-00f8-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TZc46EYmoMR40NpHzsm0wcU8xwRxgTxdduPwkQnuFDwbxplko/iKzjnaD1obW5pw6U05hEXJizyV7aE76D6PrfZhLa3kkDkML8Y9ax0z7j9WpVTICtFaKRKghNtYRYTXaH4HG2YnrOWV1noo05C7xU8T1JOMqOLWl9rwRo6xpsEpYLNFETQERM0O3XGqig2rpxRvYfXsEKDInnFwCzekLHTxNu050yO01JaAj8EdWwm/jV+JcxJCDfTeVpkb0EXVv77XssbRW79A0CuK4qy+OvCtuzfDPf2QoZFaZcj91XGqNqNyFLuKL4Ui/LAtbwgS0C2903OnjQ77Elsb2ek4jA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeqjWtr0FEpFvDuYDMmkMOWVYwixDenrNgLSHZAnU2c=;
 b=ns10hfMfmkIgaPS6rnGIMcbWPmAVEkbtgNfr730RENLbwwBzWkXaoq72tiT0TSGN5dZPpPhU88Vg4wjnjpIYkQoovb+j1Hlzo3WcRlmBkK/bMs2f/+I3zZTjzQJ0Z4a+EkjAjuSFAzpWCoC8KDYo4xiRQoJ/uM4sUiZGXBIkXDWCT9T9hk08LxYoMUBEZAalailuyCKCFa41Sm4Q856eEua/zIkJcDJKf8fe2gDjlLeULi4CM9f/Fzgw/PzCgmqP5pkMlq+7xyFl/KBDwBotuA8waa3rSyH0FRznkeF8Wv+lbKPbNQBsVMzszwSC3OsRiACfzQAH+pyiTKXMw/wLkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeqjWtr0FEpFvDuYDMmkMOWVYwixDenrNgLSHZAnU2c=;
 b=F3rCnhfcr5UV87brenlf6hYK8WmoXVJ1Fa/PFqb6Hs6bR+wUXakRQQsR/tOD01dE/uKTXhCBrO/yOPIUNEpeqy9lGEbSyEYIR3yxjyN3c74w5KgSUov9ziMr/XTGnJwXLpKEqgItWxU3sSvq8mgcMj0eRCjxWImniaAjhLtTfYE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELdjkkwQaFpRNywGzNK6bLRH3x1XWBGFuAp7Fnf2XC8qqcvm0B9/Xfk2PXUyzne4DHxb0nDLMb5JcxjHmKOUlMpJzz4D4mC6WFFjCmizkZZIurWqYhHkPXOfUh96UpOfdi7qMRigopSn7XM+KQsadHKwaBi6sDdtiW2bVg9yCe/d8D6ajlG5kgTOY5K1Hht9MzHtqX55zoMEfzoBNtmePW9y13/DXjIkr9bb6S40o/bZqQptzv4g6wVwHbjtEYholFYEs1F5nBI3fdOya8xPkYJcoofbYxCWF/+ip7TkA2Ufch67rsAaXfsScqnyZ8m0xQcQPyBaydBeOfdy6ghkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeqjWtr0FEpFvDuYDMmkMOWVYwixDenrNgLSHZAnU2c=;
 b=U7RRyhbSGxvBxtcuigdOmgJktO5FEzVbyLDTiFu9oRRnQDayfxkz1+GkgQ8/OIy0g7G6dbqChtMqJcPdN9XUULSMMGFnGbT25whIqLEON9VjFxYIQ10vjI9XeobCmt+ui4TLkDx6AbkDPrT9czxO5PAm7tKTZiNRgQmbw+VPjVsCn3Sust2gw1xlcYgkgRKYyqk3LAEGioczb1ZVCBHVf69nfxVwnuxP8xYnFoQsiflOjIS0lJXBRv/2LbH83Ds2rJzpvkmuj59KD5SiR5/plFqIdB0S+8BwnKVGdvmeR/Y+m/hR+JCQA/LqBZ8Ab2PlKerRRpHnzY0WWVyhQx4CMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeqjWtr0FEpFvDuYDMmkMOWVYwixDenrNgLSHZAnU2c=;
 b=F3rCnhfcr5UV87brenlf6hYK8WmoXVJ1Fa/PFqb6Hs6bR+wUXakRQQsR/tOD01dE/uKTXhCBrO/yOPIUNEpeqy9lGEbSyEYIR3yxjyN3c74w5KgSUov9ziMr/XTGnJwXLpKEqgItWxU3sSvq8mgcMj0eRCjxWImniaAjhLtTfYE=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: RE: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
Thread-Topic: [PATCH 2/2] automation: arm64: Create a test job for testing
 static allocation on qemu
Thread-Index: AQHYkrCrc+1tnxXJvUu1rbw6AP/wja142SUQ
Date: Mon, 11 Jul 2022 09:02:08 +0000
Message-ID:
 <DU2PR08MB732506A6DA12FD290FAD0E89F7879@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220707203803.798317-1-burzalodowa@gmail.com>
 <20220707203803.798317-3-burzalodowa@gmail.com>
 <259c9042-4a40-ddd3-5e3c-7a1698df74c4@xen.org>
 <alpine.DEB.2.22.394.2207071548220.2354836@ubuntu-linux-20-04-desktop>
 <d3f2e9b2-219b-d00b-04fd-f8e6a38222e4@gmail.com>
In-Reply-To: <d3f2e9b2-219b-d00b-04fd-f8e6a38222e4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AAAAB21DA456AE4FBFBF11BFDB75888A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cd1d806b-6507-46b3-b788-08da631c0db6
x-ms-traffictypediagnostic:
	AS8PR08MB7720:EE_|VE1EUR03FT064:EE_|VI1PR08MB3966:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZG1LazNrRVJrYTJ6L0I4Zml0NDJicVhDbm5HRjJKT3pnUUpPOHBGU01RNk0r?=
 =?utf-8?B?YXZsVHhCRSsyNzRyU21VaDN2NDhYK3g4eCthUXQyTStrMUpBYkM3WjRBMkdO?=
 =?utf-8?B?d3l0dG00SExjNGt6eUhGLzJSM2V1dW9WMnRMNDhmNG5yODgwbU0rb2ZtTWtj?=
 =?utf-8?B?Y3J2Rm93TmczNysyYWdOSFpVcFZUNDNmYXZKTHBGZmcvNjkyN1o2cW5hb2tr?=
 =?utf-8?B?M0FBUnplN1VqQlZrZUQ4MkhPZW5sT0ZQa0FaS1grSXJHMy85UXhzOXEwTXd4?=
 =?utf-8?B?NHBoU3RCMk1uVWhjcTZvNWROdzhZWHNBM1NCQkFlOTdDMXlSMDllMUV4bnlq?=
 =?utf-8?B?NmdKRklBQ2R5R3k2TjFZb2RWN3VRVW1wZ1I3OFg2SlhEbTBiWitvM2ZEWUNy?=
 =?utf-8?B?aUdpNWM5cHRaMTB0KzNIOC81aTl2cHNSdzVaajd4R3AxeEpIU3JEMklBVjdQ?=
 =?utf-8?B?RC9IUmJVT20zT0xuRWFQRUtuV2FEbkdSSGwyYi9Fc1VIbHBQRlA2WTVKZ0Ft?=
 =?utf-8?B?emZpSm1YTWhxTE5zdXZzeUc3a1NqQStUUyt5Q1dOcVZKNHErclp4T25ZMmVN?=
 =?utf-8?B?SHR5YlNRL004WmljNkV2SzJaMmg0aS9aK2JnM1J1Zk9XV2JOOEpMZjJRZFB6?=
 =?utf-8?B?a3c4bFVNM3R2VURQcTk2UnJQZnpiR2JEZ1dEc3IrZldpYjNRcDBGdWU2OXl2?=
 =?utf-8?B?d04wMXNFME5pMUcvblBLcHRwejRwWWtUbkI5VWtvY1VtVnNIbHc1UndYL0R2?=
 =?utf-8?B?Z01pVTdjZGlDN0M5STRsTEp2UU5ZZmpNSmNuRlhVNWRpaTBYV2E1NDk5MUtF?=
 =?utf-8?B?UlhBZzFLSkhLRk82WW9STVljaFh2dkdkK3pGWWVqL3ZIeTdUazFQWkgrUFFx?=
 =?utf-8?B?MGxqaUZETDk4UEZyeElNVHh3SkF3U1dBa2Y2UDBmam51V2cvLy9ma3pQbml0?=
 =?utf-8?B?ZDRRelVmVXFSSURUYTZkMkZmSG9YTUM0SldKbkx0amE0TXVXeDNPSXpnd1Bp?=
 =?utf-8?B?MFB5OGVwdzgrMCtWdFA3MC9JaU5WeFMvNHd6dklaK3Q2UnIzQUhjcVJxenJk?=
 =?utf-8?B?TFI4ZVZZNjlncXFZSU9DVmJEV3llNkRjQ3EvWUxOSm1zcHJtaSt1cm9hSXdw?=
 =?utf-8?B?TFo0bjRpZWliMWM2blBRaDU4SjZUQU1RTXB0OXBDYXp0NjlJcmx0ZGJuSmNT?=
 =?utf-8?B?cm9JSmd2YU9maVBmTEE5eldZZm5Dc2p6Y3dHdjBFS2o1a09xVm9zNnNOTWhw?=
 =?utf-8?Q?ypbX6hALAhRx+Aj?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(122000001)(33656002)(86362001)(38070700005)(9686003)(53546011)(7696005)(26005)(186003)(38100700002)(966005)(83380400001)(66476007)(64756008)(8676002)(66556008)(110136005)(54906003)(66946007)(4326008)(66446008)(41300700001)(76116006)(71200400001)(8936002)(2906002)(6506007)(316002)(5660300002)(52536014)(55016003)(478600001)(21314003)(139555002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7720
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93f794f6-3d75-473b-57b3-08da631c08b7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WqQJ9GdzTT90xTIfnvIkQbgv2u4USjUy/1aOEC/n89pxBQl6y12FDl65roMm3ba08O/7+nKzlOJiKvwW8wiKE39EW19l4DVImqJjIBSkNp7dd+bmCOzUulUdnACvowXJGjgJq0CHKAfW8XGZT+rc44K75H73A90txbLSZCzy8WtpzlODZ5hYTOs5U8ddfJJg1mU7Cb4RCE+J/xOoo/908deMMrgzz/zWEp8qvkA614PxOm6LzyvSrIJqE6SmmyCDgtw27n18i6rvQC8IETxVgNR9noei1DeE7cXBfzVW0OddTIa7xBUIJNyFwTTOCzX3Ro3w3vo6aJFm2Q9Q5Zx2ucI8T2UrqTt/moa51M+cE+JqxwvKpEs3YLlpwrpIfAetaVdVaDhOSDGuZP92KAxXcmTmxYQZNmGVwirdpx//Fq9QUOSCr/zFvknrYedvRPtT0iur0oPX7hZ6UZLzqW+Pr58A2smzWFUNs7TeWHE4/qbcCdkdW2e2qgjCPg9aHrLe6CUU5cEuTnSEdmslg65b/yGeacGOv5fnYub6pCe27S3gQr61iojb+Pg+D2Jii/vqUyXScgYmfXBdcIPfkq0dfYodar9oCGC0FFhGlKf0G1sdLK6+TiwJIymNRLINYqbVSN7AIx11WB/4wAl9Vxbx89shIJoLjz47/G3PDYdYyQORu9uL93Rym7Ic4PLmvQm3eP9nJi/4V6Lh2oFrjWjUQtxq4zoLiT+gLZIGdfefWj1fbrKTEB8nZMd6oPG1KN+noOCGc2CF+6OP6Rgza97tbcSWzCBvyDzIR/ymRiMiCkRLIXWJBXFAYOd67pqrkIB8OzUbXY9DkoOJ5rXO2KL+GsrAqIXJ0ZxD2wdb7sKj4RMwKzMccAo5Fiqjkbwj/PpSecG08KKc7mgZOgKnI34ZjJZanAJa5jKuAuasKjCnQwg17YH/dmE2MRnryA0G0Sm2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39850400004)(36840700001)(40470700004)(46966006)(70206006)(5660300002)(8676002)(70586007)(55016003)(47076005)(336012)(82310400005)(186003)(4326008)(33656002)(54906003)(110136005)(40460700003)(966005)(8936002)(478600001)(86362001)(52536014)(81166007)(53546011)(356005)(6506007)(26005)(2906002)(7696005)(316002)(41300700001)(82740400003)(9686003)(40480700001)(107886003)(36860700001)(83380400001)(21314003)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 09:02:16.5241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd1d806b-6507-46b3-b788-08da631c0db6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3966

SGkgWGVuaWENCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2
ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YN
Cj4gWGVuaWEgUmFnaWFkYWtvdQ0KPiBTZW50OiBGcmlkYXksIEp1bHkgOCwgMjAyMiA1OjU0IFBN
DQo+IFRvOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMi8yXSBhdXRvbWF0aW9uOiBhcm02NDogQ3JlYXRlIGEgdGVzdCBqb2IgZm9yIHRl
c3RpbmcNCj4gc3RhdGljIGFsbG9jYXRpb24gb24gcWVtdQ0KPiANCj4gSGkgU3RlZmFubywNCj4g
DQo+IE9uIDcvOC8yMiAwMjowNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiA+IE9uIFRo
dSwgNyBKdWwgMjAyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+PiBIaSBYZW5pYSwNCj4gPj4N
Cj4gPj4gT24gMDcvMDcvMjAyMiAyMTozOCwgWGVuaWEgUmFnaWFkYWtvdSB3cm90ZToNCj4gPj4+
IEFkZCBhbiBhcm0gc3ViZGlyZWN0b3J5IHVuZGVyIGF1dG9tYXRpb24vY29uZmlncyBmb3IgdGhl
IGFybQ0KPiA+Pj4gc3BlY2lmaWMgY29uZmlncyBhbmQgYWRkIGEgY29uZmlnIHRoYXQgZW5hYmxl
cyBzdGF0aWMgYWxsb2NhdGlvbi4NCj4gPj4+DQo+ID4+PiBNb2RpZnkgdGhlIGJ1aWxkIHNjcmlw
dCB0byBzZWFyY2ggZm9yIGNvbmZpZ3MgYWxzbyBpbiB0aGlzDQo+ID4+PiBzdWJkaXJlY3Rvcnkg
YW5kIHRvIGtlZXAgdGhlIGdlbmVyYXRlZCB4ZW4gYmluYXJ5LCBzdWZmaXhlZCB3aXRoIHRoZQ0K
PiA+Pj4gY29uZmlnIGZpbGUgbmFtZSwgYXMgYXJ0aWZhY3QuDQo+ID4+Pg0KPiA+Pj4gQ3JlYXRl
IGEgdGVzdCBqb2IgdGhhdA0KPiA+Pj4gLSBib290cyB4ZW4gb24gcWVtdSB3aXRoIGEgc2luZ2xl
IGRpcmVjdCBtYXBwZWQgZG9tMGxlc3MgZ3Vlc3QNCj4gPj4+IGNvbmZpZ3VyZWQgd2l0aCBzdGF0
aWNhbGx5IGFsbG9jYXRlZCBtZW1vcnkNCg0KQWx0aG91Z2ggeW91IHNhaWQgYm9vdGluZyBhIHNp
bmdsZSBkaXJlY3QgbWFwcGVkIGRvbTBsZXNzIGd1ZXN0DQpjb25maWd1cmVkIHdpdGggc3RhdGlj
YWxseSBhbGxvY2F0ZWQgbWVtb3J5IGhlcmUsIGxhdGVyIGluIGNvZGUsIHlvdSBhcmUNCm9ubHkg
ZW5hYmxpbmcgc3RhdGljYWxseSBhbGxvY2F0ZWQgbWVtb3J5IGluIHRoZSBJbWFnZUJ1aWxkZXIg
c2NyaXB0LA0KbWlzc2luZyB0aGUgZGlyZWN0LW1hcCBwcm9wZXJ0eS4NCiANCj4gPj4+IC0gdmVy
aWZpZXMgdGhhdCB0aGUgbWVtb3J5IHJhbmdlcyByZXBvcnRlZCBpbiB0aGUgZ3Vlc3QncyBsb2dz
IGFyZQ0KPiA+Pj4gdGhlIHNhbWUgd2l0aCB0aGUgcHJvdmlkZWQgc3RhdGljIG1lbW9yeSByZWdp
b25zDQo+ID4+Pg0KPiA+Pj4gRm9yIGd1ZXN0IGtlcm5lbCwgdXNlIHRoZSA1LjkuOSBrZXJuZWwg
ZnJvbSB0aGUgdGVzdHMtYXJ0aWZhY3RzIGNvbnRhaW5lcnMuDQo+ID4+PiBVc2UgYnVzeWJveC1z
dGF0aWMgcGFja2FnZSwgdG8gY3JlYXRlIHRoZSBndWVzdCByYW1kaXNrLg0KPiA+Pj4gVG8gZ2Vu
ZXJhdGUgdGhlIHUtYm9vdCBzY3JpcHQsIHVzZSBJbWFnZUJ1aWxkZXIuDQo+ID4+PiBVc2UgdGhl
IHFlbXUgZnJvbSB0aGUgdGVzdHMtYXJ0aWZhY3RzIGNvbnRhaW5lcnMuDQo+ID4+Pg0KPiA+Pj4g
U2lnbmVkLW9mZi1ieTogWGVuaWEgUmFnaWFkYWtvdSA8YnVyemFsb2Rvd2FAZ21haWwuY29tPg0K
PiA+Pj4gLS0tDQo+ID4+PiAgICBhdXRvbWF0aW9uL2NvbmZpZ3MvYXJtL3N0YXRpY19tZW0gICAg
ICAgICAgfCAgIDMgKw0KPiA+Pj4gICAgYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sICAg
ICAgICAgICAgIHwgIDI0ICsrKysrDQo+ID4+PiAgICBhdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQg
ICAgICAgICAgICAgICAgICAgfCAgIDQgKw0KPiA+Pj4gICAgYXV0b21hdGlvbi9zY3JpcHRzL3Fl
bXUtc3RhdGljbWVtLWFybTY0LnNoIHwgMTE0DQo+ICsrKysrKysrKysrKysrKysrKysrKw0KPiA+
Pj4gICAgNCBmaWxlcyBjaGFuZ2VkLCAxNDUgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4gICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGF1dG9tYXRpb24vY29uZmlncy9hcm0vc3RhdGljX21lbQ0KPiA+Pj4gICAg
Y3JlYXRlIG1vZGUgMTAwNzU1IGF1dG9tYXRpb24vc2NyaXB0cy9xZW11LXN0YXRpY21lbS1hcm02
NC5zaA0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2NvbmZpZ3MvYXJtL3N0
YXRpY19tZW0NCj4gPj4+IGIvYXV0b21hdGlvbi9jb25maWdzL2FybS9zdGF0aWNfbWVtDQo+ID4+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+Pj4gaW5kZXggMDAwMDAwMDAwMC4uODQ2NzVkZGY0
ZQ0KPiA+Pj4gLS0tIC9kZXYvbnVsbA0KPiA+Pj4gKysrIGIvYXV0b21hdGlvbi9jb25maWdzL2Fy
bS9zdGF0aWNfbWVtDQo+ID4+PiBAQCAtMCwwICsxLDMgQEANCj4gPj4+ICtDT05GSUdfRVhQRVJU
PXkNCj4gPj4+ICtDT05GSUdfVU5TVVBQT1JURUQ9eQ0KPiA+Pj4gK0NPTkZJR19TVEFUSUNfTUVN
T1JZPXkNCj4gPj4+IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQ0KPiA+Pg0KPiA+PiBBbnkg
cGFydGljdWxhciByZWFzb24gdG8gYnVpbGQgYSBuZXcgWGVuIHJhdGhlciBlbmFibGUNCj4gPj4g
Q09ORklHX1NUQVRJQ19NRU1PUlkgaW4gdGhlIGV4aXN0aW5nIGJ1aWxkPw0KPiA+Pg0KPiA+Pj4g
ZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZCBiL2F1dG9tYXRpb24vc2NyaXB0
cy9idWlsZA0KPiA+Pj4gaW5kZXggMjFiM2JjNTdjOC4uOWM2MTk2ZDliZCAxMDA3NTUNCj4gPj4+
IC0tLSBhL2F1dG9tYXRpb24vc2NyaXB0cy9idWlsZA0KPiA+Pj4gKysrIGIvYXV0b21hdGlvbi9z
Y3JpcHRzL2J1aWxkDQo+ID4+PiBAQCAtODMsNiArODMsNyBAQCBmaQ0KPiA+Pj4gICAgIyBCdWls
ZCBhbGwgdGhlIGNvbmZpZ3Mgd2UgY2FyZSBhYm91dA0KPiA+Pj4gICAgY2FzZSAke1hFTl9UQVJH
RVRfQVJDSH0gaW4NCj4gPj4+ICAgICAgICB4ODZfNjQpIGFyY2g9eDg2IDs7DQo+ID4+PiArICAg
IGFybTY0KSBhcmNoPWFybSA7Ow0KPiA+Pj4gICAgICAgICopIGV4aXQgMCA7Ow0KPiA+Pj4gICAg
ZXNhYw0KPiA+Pj4gICAgQEAgLTkzLDQgKzk0LDcgQEAgZm9yIGNmZyBpbiBgbHMgJHtjZmdfZGly
fWA7IGRvDQo+ID4+PiAgICAgICAgcm0gLWYgeGVuLy5jb25maWcNCj4gPj4+ICAgICAgICBtYWtl
IC1DIHhlbiBLQlVJTERfREVGQ09ORklHPS4uLy4uLy4uLy4uLyR7Y2ZnX2Rpcn0vJHtjZmd9IGRl
ZmNvbmZpZw0KPiA+Pj4gICAgICAgIG1ha2UgLWokKG5wcm9jKSAtQyB4ZW4NCj4gPj4+ICsgICAg
aWYgW1sgJHthcmNofSA9PSAiYXJtIiBdXTsgdGhlbg0KPiA+Pj4gKyAgICAgICAgY3AgeGVuL3hl
biBiaW5hcmllcy94ZW4tJHtjZmd9DQo+ID4+PiArICAgIGZpDQo+ID4+DQo+ID4+IFRoaXMgZmVl
bHMgYSBiaXQgb2YgYSBoYWNrIHRvIGJlIGFybSBvbmx5LiBDYW4geW91IGV4cGxhaW4gd2h5IHRo
aXMNCj4gPj4gaXMgbm90IGVuYWJsZWQgZm9yIHg4NiAob3RoZXIgdGhhbiB0aGlzIGlzIG5vdCB5
ZXQgdXNlZCk/DQo+ID4+DQo+ID4+PiAgICBkb25lDQo+ID4+PiBkaWZmIC0tZ2l0IGEvYXV0b21h
dGlvbi9zY3JpcHRzL3FlbXUtc3RhdGljbWVtLWFybTY0LnNoDQo+ID4+PiBiL2F1dG9tYXRpb24v
c2NyaXB0cy9xZW11LXN0YXRpY21lbS1hcm02NC5zaA0KPiA+Pj4gbmV3IGZpbGUgbW9kZSAxMDA3
NTUNCj4gPj4+IGluZGV4IDAwMDAwMDAwMDAuLjViODlhMTUxYWENCj4gPj4+IC0tLSAvZGV2L251
bGwNCj4gPj4+ICsrKyBiL2F1dG9tYXRpb24vc2NyaXB0cy9xZW11LXN0YXRpY21lbS1hcm02NC5z
aA0KPiA+Pj4gQEAgLTAsMCArMSwxMTQgQEANCj4gPj4+ICsjIS9iaW4vYmFzaA0KPiA+Pj4gKw0K
PiA+Pj4gK2Jhc2U9KDB4NTAwMDAwMDAgMHgxMDAwMDAwMDApDQo+ID4+PiArc2l6ZT0oMHgxMDAw
MDAwMCAweDEwMDAwMDAwKQ0KPiA+Pg0KPiA+PiAgRnJvbSB0aGUgbmFtZSwgaXQgaXMgbm90IGNs
ZWFyIHdoYXQgdGhlIGJhc2UgYW5kIHNpemUgcmVmZXJzIHRvby4NCj4gPj4gTG9va2luZyBhIGJp
dCBiZWxvdywgaXQgc2VlbXMgdG8gYmUgcmVmZXJyaW5nIHRvIHRoZSBkb21haW4gbWVtb3J5Lg0K
PiA+PiBJZiBzbywgSSB3b3VsZCBzdWdnZXN0IHRvIGNvbW1lbnQgYW5kIHJlbmFtZSB0byAiZG9t
dV97YmFzZSwgc2l6ZX0iLg0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gK3NldCAtZXgNCj4gPj4+ICsN
Cj4gPj4+ICthcHQtZ2V0IC1xeSB1cGRhdGUNCj4gPj4+ICthcHQtZ2V0IC1xeSBpbnN0YWxsIC0t
bm8taW5zdGFsbC1yZWNvbW1lbmRzIHUtYm9vdC1xZW11IFwNCj4gPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUtYm9vdC10b29scyBcDQo+ID4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2UtdHJlZS1jb21w
aWxlciBcDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjcGlvIFwNCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGN1cmwgXA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYnVzeWJveC1zdGF0aWMNCj4gPj4+ICsNCj4gPj4+ICsjIERvbVUgQnVzeWJveA0KPiA+
Pj4gK2NkIGJpbmFyaWVzDQo+ID4+PiArbWtkaXIgLXAgaW5pdHJkDQo+ID4+PiArbWtkaXIgLXAg
aW5pdHJkL2Jpbg0KPiA+Pj4gK21rZGlyIC1wIGluaXRyZC9zYmluDQo+ID4+PiArbWtkaXIgLXAg
aW5pdHJkL2V0Yw0KPiA+Pj4gK21rZGlyIC1wIGluaXRyZC9kZXYNCj4gPj4+ICtta2RpciAtcCBp
bml0cmQvcHJvYw0KPiA+Pj4gK21rZGlyIC1wIGluaXRyZC9zeXMNCj4gPj4+ICtta2RpciAtcCBp
bml0cmQvbGliDQo+ID4+PiArbWtkaXIgLXAgaW5pdHJkL3Zhcg0KPiA+Pj4gK21rZGlyIC1wIGlu
aXRyZC9tbnQNCj4gPj4+ICtjcCAvYmluL2J1c3lib3ggaW5pdHJkL2Jpbi9idXN5Ym94DQo+ID4+
PiAraW5pdHJkL2Jpbi9idXN5Ym94IC0taW5zdGFsbCBpbml0cmQvYmluIGVjaG8gIiMhL2Jpbi9z
aA0KPiA+Pj4gKw0KPiA+Pj4gK21vdW50IC10IHByb2MgcHJvYyAvcHJvYw0KPiA+Pj4gK21vdW50
IC10IHN5c2ZzIHN5c2ZzIC9zeXMNCj4gPj4+ICttb3VudCAtdCBkZXZ0bXBmcyBkZXZ0bXBmcyAv
ZGV2DQo+ID4+PiArL2Jpbi9zaCIgPiBpbml0cmQvaW5pdA0KPiA+Pj4gK2NobW9kICt4IGluaXRy
ZC9pbml0DQo+ID4+PiArY2QgaW5pdHJkDQo+ID4+PiArZmluZCAuIHwgY3BpbyAtLWNyZWF0ZSAt
LWZvcm1hdD0nbmV3YycgfCBnemlwID4gLi4vaW5pdHJkLmNwaW8uZ3oNCj4gPj4+ICtjZCAuLi8u
Lg0KPiA+Pj4gKw0KPiA+Pj4gKyMgWFhYIFFFTVUgbG9va3MgZm9yICJlZmktdmlydGlvLnJvbSIg
ZXZlbiBpZiBpdCBpcyB1bm5lZWRlZCBjdXJsDQo+ID4+PiArLWZzU0xPDQo+ID4+PiAraHR0cHM6
Ly9naXRodWIuY29tL3FlbXUvcWVtdS9yYXcvdjUuMi4wL3BjLWJpb3MvZWZpLXZpcnRpby5yb20N
Cj4gPj4+ICsNCj4gPj4+ICsuL2JpbmFyaWVzL3FlbXUtc3lzdGVtLWFhcmNoNjQgLW5vZ3JhcGhp
YyBcDQo+ID4+PiArICAgIC1NIHZpcnR1YWxpemF0aW9uPXRydWUgXA0KPiA+Pj4gKyAgICAtTSB2
aXJ0IFwNCj4gPj4+ICsgICAgLU0gdmlydCxnaWMtdmVyc2lvbj0yIFwNCj4gPj4+ICsgICAgLWNw
dSBjb3J0ZXgtYTU3IFwNCj4gPj4+ICsgICAgLXNtcCAyIFwNCj4gPj4+ICsgICAgLW0gOEcgXA0K
PiA+Pj4gKyAgICAtTSBkdW1wZHRiPWJpbmFyaWVzL3ZpcnQtZ2ljdjIuZHRiDQo+ID4+PiArDQo+
ID4+PiArI2R0YyAtSSBkdGIgLU8gZHRzIGJpbmFyaWVzL3ZpcnQtZ2ljdjIuZHRiID4NCj4gPj4+
ICtiaW5hcmllcy92aXJ0LWdpY3YyLmR0cw0KPiA+Pj4gKw0KPiA+Pj4gKyMgSW1hZ2VCdWlsZGVy
DQo+ID4+PiArcm0gLXJmIGltYWdlYnVpbGRlcg0KPiA+Pj4gK2dpdCBjbG9uZSBodHRwczovL2dp
dGxhYi5jb20vVmlyeWFPUy9pbWFnZWJ1aWxkZXINCj4gPj4+ICsNCj4gPj4+ICtlY2hvICJNRU1P
UllfU1RBUlQ9XCIweDQwMDAwMDAwXCINCj4gPj4+ICtNRU1PUllfRU5EPVwiMHgwMjAwMDAwMDAw
XCINCj4gPj4+ICsNCj4gPj4+ICtERVZJQ0VfVFJFRT1cInZpcnQtZ2ljdjIuZHRiXCINCj4gPj4+
ICsNCj4gPj4+ICtYRU49XCJ4ZW4tc3RhdGljX21lbVwiDQo+ID4+PiArWEVOX0NNRD1cImNvbnNv
bGU9ZHR1YXJ0IGVhcmx5cHJpbnRrIHhzbT1kdW1teVwiDQo+ID4+DQo+ID4+IEFGQUlLLCBlYXJs
eXByaW50ayBpcyBub3QgYW4gb3B0aW9uIGZvciBYZW4gb24gQXJtIChhdCBsZWFzdCkuIEl0IGlz
DQo+ID4+IGFsc28gbm90IGNsZWFyIHdoeSB5b3UgbmVlZCB0byBwYXNzIHhzbT1kdW1teS4NCj4g
Pj4NCj4gPj4+ICsNCj4gPj4+ICtOVU1fRE9NVVM9MQ0KPiA+Pj4gK0RPTVVfTUVNWzBdPTUxMg0K
PiA+Pj4gK0RPTVVfVkNQVVNbMF09MQ0KPiA+Pj4gK0RPTVVfS0VSTkVMWzBdPVwiSW1hZ2VcIg0K
PiA+Pj4gK0RPTVVfUkFNRElTS1swXT1cImluaXRyZC5jcGlvLmd6XCINCj4gPj4+ICtET01VX0NN
RFswXT1cImVhcmx5cHJpbnRrIGNvbnNvbGU9dHR5QU1BMFwiDQo+ID4+PiArRE9NVV9TVEFUSUNf
TUVNWzBdPVwiJHtiYXNlWzBdfSAke3NpemVbMF19ICR7YmFzZVsxXX0gJHtzaXplWzFdfVwiDQo+
ID4+PiArDQoNCllvdSB3b3VsZCBsaWtlIHRvIGFkZCAgRE9NVV9ESVJFQ1RfTUFQWzBdID0gMSB0
byBlbmFibGUgZGlyZWN0LW1hcC4NCg0KPiA+Pj4gK1VCT09UX1NPVVJDRT1cImJvb3Quc291cmNl
XCINCj4gPj4+ICtVQk9PVF9TQ1JJUFQ9XCJib290LnNjclwiIiA+IGJpbmFyaWVzL2ltYWdlYnVp
bGRlcl9jb25maWcNCj4gPj4+ICsNCj4gPj4+ICtiYXNoIGltYWdlYnVpbGRlci9zY3JpcHRzL3Vi
b290LXNjcmlwdC1nZW4gLXQgdGZ0cCAtZCBiaW5hcmllcy8gLWMNCj4gPj4+IGJpbmFyaWVzL2lt
YWdlYnVpbGRlcl9jb25maWcNCj4gPj4+ICsNCj4gPj4+ICsjIFJ1biB0aGUgdGVzdA0KPiA+Pj4g
K3JtIC1mIHFlbXUtc3RhdGljbWVtLnNlcmlhbA0KPiA+Pj4gK3NldCArZQ0KPiA+Pj4gK2VjaG8g
IiAgdmlydGlvIHNjYW47IGRoY3A7IHRmdHBiIDB4NDAwMDAwMDAgYm9vdC5zY3I7IHNvdXJjZQ0K
PiA+Pj4gKzB4NDAwMDAwMDAifCBcIHRpbWVvdXQgLWsgMSA2MCAuL2JpbmFyaWVzL3FlbXUtc3lz
dGVtLWFhcmNoNjQgLQ0KPiBub2dyYXBoaWMgXA0KPiA+Pj4gKyAgICAtTSB2aXJ0dWFsaXphdGlv
bj10cnVlIFwNCj4gPj4+ICsgICAgLU0gdmlydCBcDQo+ID4+PiArICAgIC1NIHZpcnQsZ2ljLXZl
cnNpb249MiBcDQo+ID4+PiArICAgIC1jcHUgY29ydGV4LWE1NyBcDQo+ID4+PiArICAgIC1zbXAg
MiBcDQo+ID4+PiArICAgIC1tIDhHIFwNCj4gPj4+ICsgICAgLW5vLXJlYm9vdCBcDQo+ID4+PiAr
ICAgIC1kZXZpY2UgdmlydGlvLW5ldC1wY2ksbmV0ZGV2PXZuZXQwIC1uZXRkZXYNCj4gPj4+ICt1
c2VyLGlkPXZuZXQwLHRmdHA9YmluYXJpZXMNCj4gPj4+IFwNCj4gPj4+ICsgICAgLWJpb3MgL3Vz
ci9saWIvdS1ib290L3FlbXVfYXJtNjQvdS1ib290LmJpbiBcDQo+ID4+PiArICAgIC1kdGIgLi9i
aW5hcmllcy92aXJ0LWdpY3YyLmR0YiBcDQo+ID4+PiArICAgIHwmIHRlZSBxZW11LXN0YXRpY21l
bS5zZXJpYWwNCj4gPj4+ICsNCj4gPj4+ICtzZXQgLWUNCj4gPj4NCj4gPj4gQSBsb3Qgb2YgdGhl
IGNvZGUgYWJvdmUgaXMgZHVwbGljYXRlZCBmcm9tIHFlbXUtc21va2UtYXJtNjQuc2guIEkNCj4g
Pj4gdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGNvbnNvbGlkYXRlIGluIGEgc2luZ2xlIHNj
cmlwdC4gTG9va2luZw0KPiA+PiBicmllZmx5IHRocm91Z2h0IHRoZSBleGlzdGluZyBzY3JpcHRz
LCBpdCBsb29rcyBsaWtlIGl0IGlzIHBvc3NpYmxlDQo+ID4+IHRvIHBhc3MgYXJndW1lbnRzIChz
ZWUgcWVtdS1zbW9rZS14ODYtNjQuc2gpLg0KPiA+DQo+ID4gT25lIGlkZWEgd291bGQgYmUgdG8g
bWFrZSB0aGUgc2NyaXB0IGNvbW1vbiBhbmQgInNvdXJjZSIgYSBzZWNvbmQNCj4gPiBzY3JpcHQg
b3IgY29uZmlnIGZpbGUgd2l0aCBqdXN0IHRoZSBJbWFnZUJ1aWxkZXIgY29uZmlndXJhdGlvbiBi
ZWNhdXNlDQo+ID4gaXQgbG9va3MgbGlrZSBpdCBpcyB0aGUgb25seSB0aGluZyBkaWZmZXJlbnQu
DQo+ID4NCj4gPg0KPiA+Pj4gKw0KPiA+Pj4gKyhncmVwIC1xICJYZW4gZG9tMGxlc3MgbW9kZSBk
ZXRlY3RlZCIgcWVtdS1zdGF0aWNtZW0uc2VyaWFsKSB8fA0KPiA+Pj4gK2V4aXQgMQ0KPiA+Pj4g
Kw0KPiA+Pj4gK2ZvciAoKGk9MDsgaTwkeyNiYXNlW0BdfTsgaSsrKSkNCj4gPj4+ICtkbw0KPiA+
Pj4gKyAgICBzdGFydD0iJChwcmludGYgIjB4JTAxNngiICR7YmFzZVskaV19KSINCj4gPj4+ICsg
ICAgZW5kPSIkKHByaW50ZiAiMHglMDE2eCIgJCgoJHtiYXNlWyRpXX0gKyAke3NpemVbJGldfSAt
IDEpKSkiDQo+ID4+PiArICAgIGdyZXAgLXEgIm5vZGUgICAwOiBcW21lbSAke3N0YXJ0fS0ke2Vu
ZH1cXSIgcWVtdS1zdGF0aWNtZW0uc2VyaWFsDQo+ID4+PiArICAgIGlmIHRlc3QgJD8gLWVxIDEN
Cj4gPj4+ICsgICAgdGhlbg0KPiA+Pj4gKyAgICAgICAgZXhpdCAxDQo+ID4+PiArICAgIGZpDQo+
ID4+PiArZG9uZQ0KPiA+Pg0KPiA+PiBQbGVhc2UgYWRkIGEgY29tbWVudCBvbiB0b3AgdG8gZXhw
bGFpbiB3aGF0IHRoaXMgaXMgbWVhbnQgdG8gZG8uDQo+ID4+IEhvd2V2ZXIsIEkgdGhpbmsgd2Ug
c2hvdWxkIGF2b2lkIHJlbHlpbmcgb24gb3V0cHV0IHRoYXQgd2UgaGF2ZQ0KPiA+PiB3cml0dGVu
IG91cnNlbGYuIElPVywgcmVseWluZyBvbiBYZW4vTGludXggdG8gYWx3YXlzIHdyaXRlIHRoZSBz
YW1lDQo+ID4+IG1lc3NhZ2UgaXMgcmlza3kgYmVjYXVzZSB0aGV5IGNhbiBjaGFuZ2UgYXQgYW55
IHRpbWUuDQo+ID4NCj4gPiBFc3BlY2lhbGx5IGlmIHdlIG1ha2UgdGhlIHNjcmlwdCBjb21tb24s
IHRoZW4gd2UgY291bGQganVzdCByZWx5IG9uDQo+ID4gdGhlIGV4aXN0aW5nIGNoZWNrIHRvIHNl
ZSBpZiB0aGUgZ3Vlc3Qgc3RhcnRlZCBjb3JyZWN0bHkgKG5vIHNwZWNpYWwNCj4gPiBjaGVjayBm
b3Igc3RhdGljIG1lbW9yeSkuDQo+IA0KPiBJbiB0aGlzIGNhc2UsIGhvdyB0aGUgdGVzdCB3aWxs
IHZlcmlmeSB0aGF0IHRoZSBzdGF0aWMgbWVtb3J5IGNvbmZpZ3VyYXRpb24gaGFzDQo+IGJlZW4g
dGFrZW4gaW50byBhY2NvdW50IGFuZCBoYXMgbm90IGp1c3QgYmVlbiBpZ25vcmVkPw0KPiANCg0K
SWYgb25seSBzdGF0aWNhbGx5IGFsbG9jYXRlZCBtZW1vcnkgaXMgZW5hYmxlZCwgZ3Vlc3QgbWVt
b3J5IGFkZHJlc3Mgd2lsbCBzdGlsbCBiZSBtYXBwZWQNCnRvIEdVRVNUX1JBTV9CQVNFKDB4NDAw
MDAwMDApDQoNCj4gPj4+ICsNCj4gPj4+ICsoZ3JlcCAtcSAiQnVzeUJveCIgcWVtdS1zdGF0aWNt
ZW0uc2VyaWFsKSB8fCBleGl0IDENCj4gPg0KPiANCj4gLS0NCj4gWGVuaWENCg0KLS0tDQpDaGVl
cnMsDQpQZW5ueSBaaGVuZw0KDQoNCg0KDQo=

