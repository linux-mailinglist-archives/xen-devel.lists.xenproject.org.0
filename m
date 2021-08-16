Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1907D3ECE3E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 08:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167148.305100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFVgZ-0005jc-3S; Mon, 16 Aug 2021 06:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167148.305100; Mon, 16 Aug 2021 06:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFVgY-0005gK-WA; Mon, 16 Aug 2021 06:01:22 +0000
Received: by outflank-mailman (input) for mailman id 167148;
 Mon, 16 Aug 2021 06:01:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eR/w=NH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mFVgX-0005g8-GP
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 06:01:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.68]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24b8885f-bb49-4060-90c8-7f5ffadc7e8d;
 Mon, 16 Aug 2021 06:01:18 +0000 (UTC)
Received: from AS8PR04CA0130.eurprd04.prod.outlook.com (2603:10a6:20b:127::15)
 by AM6PR08MB4040.eurprd08.prod.outlook.com (2603:10a6:20b:a2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 06:01:16 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::16) by AS8PR04CA0130.outlook.office365.com
 (2603:10a6:20b:127::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend
 Transport; Mon, 16 Aug 2021 06:01:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 06:01:14 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Mon, 16 Aug 2021 06:01:14 +0000
Received: from 879637ac3c36.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8023B98-98FE-45D5-AC88-7603E352B46B.1; 
 Mon, 16 Aug 2021 06:01:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 879637ac3c36.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Aug 2021 06:01:08 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR0802MB2493.eurprd08.prod.outlook.com (2603:10a6:800:b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 06:01:00 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4415.022; Mon, 16 Aug 2021
 06:00:59 +0000
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
X-Inumbo-ID: 24b8885f-bb49-4060-90c8-7f5ffadc7e8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXfxLL4+fn4ZMdjKRhjbeDDPs9CeA+0ru8EKsiuVlUE=;
 b=Xx35v+uLxSizkh1euSZDrJu9s6Pde+mLdE+c5sgqmPVA2uh0UBr0xNv7teluxXv/iEShSMP5KDmiL94efHCKmG0lRiHN0f0USDZuckpgc6SgxOHrB8bLrSV1igY4JtlhRzHLCZYLBK49nIT7fTk9/Z7iNvboJgK5W6QiSMBKXYs=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass
 (signature was verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=temperror action=none header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdIAEWMbhrOj0Vc0RRo6TJbVG5MaHavw502kdYTpnrQbNuuYhmDvrQQjVQZKMmcvPQ+tXXWIQB74/AmSavlSJ0nIBrQ5GAN44xsmsd6YDAavA40nkZZGxOp6b3eNLIkIxulDdvd/NAqrKIIwvhSPBT0RiRKeyVXHXkACYAQU5iudpw5405nedMK/meja2pkoNTIHtxcU3URhAFjsUK5T7tNIEKbmwz2EtkbBF9xj9rLyjjIiYqvxf5gAM6l3UOv12bPTnuFms6uTjOKuJizcGwG42Rgd2QtcQOFXtmlI+tV9wuzoNSo2M7absn8CxN+LlzJhYMcIrbsZobiEXnN7jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXfxLL4+fn4ZMdjKRhjbeDDPs9CeA+0ru8EKsiuVlUE=;
 b=KObs18iUEWOTQJU6807P01hWSNY8zL+pNsiQ8hiJQp5MqwCPbUzF0T8grgxchYXdXyzxicg4CGCBqZVxwmRd8eT+tag6ApDGtue8NtYWKOzaZvwXOE/wzog1EQX6QLoKFY0FQDVhhRKGuy2p6TPh+/dWTESNi8aiAUjDpYPfd6Iil/hm2QZu9mAkLetLT7tGqc3wutFFYinpTvhbBWpEHpjU+tidusvERCMM+4dxuH8Coa4+h0fxhtq2O3zgXY7O81eNOXXLZGGkUf8BO8OhzQ9gQ9jGHTs2u6harnqDeLybELbsZ7O4024aWuJtVCQcrx94I6BTJugR2cLJ18Hobg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXfxLL4+fn4ZMdjKRhjbeDDPs9CeA+0ru8EKsiuVlUE=;
 b=Xx35v+uLxSizkh1euSZDrJu9s6Pde+mLdE+c5sgqmPVA2uh0UBr0xNv7teluxXv/iEShSMP5KDmiL94efHCKmG0lRiHN0f0USDZuckpgc6SgxOHrB8bLrSV1igY4JtlhRzHLCZYLBK49nIT7fTk9/Z7iNvboJgK5W6QiSMBKXYs=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH V4 03/10] xen/arm: handle static memory in
 dt_unreserved_regions
Thread-Topic: [PATCH V4 03/10] xen/arm: handle static memory in
 dt_unreserved_regions
Thread-Index: AQHXg5tYZY2FWDgBY02KHlfAdkOUMKtuZ8uAgAdTnkA=
Date: Mon, 16 Aug 2021 06:00:58 +0000
Message-ID:
 <VE1PR08MB5215A60D3603AA8D48128F67F7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-4-penny.zheng@arm.com>
 <c861b7c0-e894-61d0-8b29-77c1753661ee@xen.org>
In-Reply-To: <c861b7c0-e894-61d0-8b29-77c1753661ee@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C8272E7CBBF3E84FADC9AEE6F4682829.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f8c9e7a8-531d-4208-1315-08d9607b41c5
x-ms-traffictypediagnostic: VI1PR0802MB2493:|AM6PR08MB4040:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB40400590570D5E36A24643C3F7FD9@AM6PR08MB4040.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OF2y/Xb9CcZmGYVKcrGmNgwZBI8d6Nvb7UwAUeoQU/9jsdxvvr49mt9X4kbMLJ/JXopcCGWEJ+OZRMqFbvIN+m/P10EgRy4AC1rg5TiOfKp4HloUp6zbSv07MkSmP32lDzy19N9HoYWxxDNAyMbZYywcvfzpMbgphmxo339rXudP2PZj3cybGzLgC2FOLc7xruW2/kN1OqKWAJUVeHpmEB+eyJIlRDnvOj8+PwjdhX3c2yKOrcvTT9uF/HLZfvUrZLRhU/HnzlZlWw9qJW6XaEGjs02JzVKzj93eCo2GjQWp98RmVYpRBiKjRyMW7BpmagYtEsFLNBnX/5Fkhc7xUbdgCLQnbgPyWBa8UdaUTjAKPoESmGWNJkC2Eixk6DD5tttayYzGvk7gvcdCXmKbaUCeQGWbhiY3TKz3NE6d2qCvz8nVffCQ5TCgeNGjVfy6ZP1NpjeNqD9VLJcAaB4+5B5TiQAN/4uq8bbdcFPAqqcIrKJhGAlcoPw640JZSaAOHm5FhSs/KXdIScsaWKsx4qh+AROEoyq0ERlrYq6/0iT9oE4dX/7mNJ3rQgZTjaTAlVAk5VKr51fU06dZtr0Zk1bwDtZgIOoB2/UQpaAsck/0+QfqSuAUCbeDFvfcLGRz0XYpK4NNlO99t1sUHGDFnolA/vQX7v/rXvbqFSVW7C8z87Hf+KvdqZ+BeAgwg/DogyLMF7kxLOgq1ie748Gogw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(366004)(136003)(396003)(38070700005)(38100700002)(122000001)(86362001)(5660300002)(8676002)(83380400001)(64756008)(66446008)(9686003)(66556008)(55016002)(52536014)(66946007)(66476007)(76116006)(71200400001)(33656002)(478600001)(2906002)(8936002)(186003)(4326008)(7696005)(54906003)(110136005)(316002)(26005)(53546011)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NTNiYzVqSFRFQWtndlE0UmNBTXlSdkNGbmpaT0JHdUljMWFLM1VGampQNFdo?=
 =?utf-8?B?ZmpZaGN2MnJQTWZUNlBaUnNKemJiWDdzOG1tNXNQdm1oSU9oOElvOXdZUXFF?=
 =?utf-8?B?czU4OVMwU1RER2E4aDN4VW1HcjlxK3BrTTZvOUdJNlVrZ01QV0c1VTdrSXE1?=
 =?utf-8?B?RUh2MnNlTStiSklLUnpGeXdjRTg1ZlE0dkZrQ1hKYThhOXFSVDhzQVl0bFNJ?=
 =?utf-8?B?bHQ2YXdOekZIUldJL3dVSDF0UWNmaWpMZ3BHSFRRWHJqWFNZSFJSUko4aXFr?=
 =?utf-8?B?ZFR0Sm1YcGNXWkxwVEVtZTk5RHNlSURnaCtLaE9jcURveHFRMFdYN0hyeVdm?=
 =?utf-8?B?TGJZbm9ZejZiY1R4em5XVE53WWRJRy9KbEtnYVFHMG4rVjZIbnFLZ1VGbktL?=
 =?utf-8?B?OVJ4eEw2Y0VXQkh5TEFhRmxVWjBTKzdwM25JRkh5ZHpxMzNhZnQ4YTZ0OC9h?=
 =?utf-8?B?bGFlMlYvYVJyNy9WbHI2M1ZPV0hJQUltUVNFVCs5RXdJa2hhdUZXb2Zndk9v?=
 =?utf-8?B?S3NURWZ5NWFMK2RUamlCL1lJN0tKK091ZldIWWU0d0R2bGtvSFNCVDAzbVo4?=
 =?utf-8?B?aGprSW11Q1hmelhIakxhb0xnZ2VvcDJWMG5OQ2JFQjZxSllZUkI4QkJ3SWxI?=
 =?utf-8?B?Q29UNGQ3S2NkQ1dISWJ0Mm80ZUhhRmpWK0hiaXhyb3lmM2JvZnNmTDhxYWNj?=
 =?utf-8?B?MHQzQmx3L0VxRjF3TTlubE02ZmUrYnRic0c2Z0pSSDFnTUpyTEpuK0xMRHda?=
 =?utf-8?B?TzRjR0ppWmZKMkZkTDZmR0tvUTNycTdBZmlTSElRQlhOam0zNlpTdktVSHc5?=
 =?utf-8?B?bDAvMitnTkZsdlJzZmFidFJ3bFhub2xDVm00WkZEN0ljNnR0OXpOWmFCUTBh?=
 =?utf-8?B?d2JESWROQm9UUEFtZjNCMmRIc3VUcGNtMFI0aksyQUQ5S0JrcXk2TjIyZktR?=
 =?utf-8?B?ODEwS1gyRnFlRGNzbUtkeHNWMDBaNmE3MUd4QXZ2OUtPZmYrR1JQWHhGMnBL?=
 =?utf-8?B?enZud0RYTXVLSEFubDV5UnFCeUJ5S0ovNnpXOTMyQmE0Rm95cGhYMUpsS2dY?=
 =?utf-8?B?Rkorem9BUmRNSTBvQURRbC9qeXZCOEpYeWFDRCt6OEZXUnVFOWl3dFBub3VM?=
 =?utf-8?B?andDTFJsNWZkWWdZUDdWdUxWR2ZIT1duVHdaL2FMMTkxelNPQ0tFTURYR1Ba?=
 =?utf-8?B?UUxBMzNSVFVOczQzbnBCZHdmYmdSS2xhamJwU3pLUEVZQzN0bDV6TzFVcnNZ?=
 =?utf-8?B?Q2RiM2hWSlRzNS93cW8vbll6ZFRSMHk2Sm84U2lXUVA4Y0RZU3ErckFqZ0pO?=
 =?utf-8?B?U1FkaTRlekFUa3BqamVqMkdQcERrUjZ6OTVaVmdpMy9Dc1VpeFc3M0ZVYVlS?=
 =?utf-8?B?QXJQMGk3elFwTTVBZk9wRG5DZ0tKZEpwZnNEbzQ1K1RTZFZmRDlNby9FbVdD?=
 =?utf-8?B?RTNtTUtMaXY5TjV6U2VJaHM4NHFueTRsYWpWTEg2N2ZadWxDNXJxREozSnF5?=
 =?utf-8?B?Nml3cHhjNzlhMm0yamNRbjRTMTFBbnpRbzBwS0o4QUlHdjJRRngydDErNUtk?=
 =?utf-8?B?NVFKUC9tL3ZIcXhoelV4MDBoSFd2WTVuNnRwSnhSaFlFY01ub3NLQVBPeXQ5?=
 =?utf-8?B?cGFGQVNMa3JiSlBwby9zZXdCK1Z0ZWtjMXNPL1lmUzZWMG5TS1kxL05Vc2NN?=
 =?utf-8?B?V2hrejJMclM5S0pYdmJVaG1PdHFtenlNSHRPWExzNklYRFd1dUE3UFJlZklM?=
 =?utf-8?Q?Xdinx3mXHnIFyrmGWYpZlbb5TNLyyuvWVJ6o+g0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2493
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6d62ce6-dd1a-4519-0f56-08d9607b3844
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kD5y2X0mxQunz8a3jy/jYq1r1AtQTXkWI8xgnr4+ljUHSKaBQsZZp/FIK67h2zb3/iR9y+5wOMkcPw6Ifx19ZiyPhCA12pqEq6dRViuJcN/KwGqJSPbWYi2fcpIwXJ2xePJGS6tanVSIpYXld+XMyhmEruiQGB0MsOhKHgMc7I4Q0caEuAjVBnH5/UURYBB+E0oEN4Z8TRWgI+1lkT7yZ0+S3YEsXb60C5FbX66LzyJ5by7oqBs+Xkzvm0h77UVckouIQPKM4bjM9/8FiZO6tggsIPao/UDZj5HN35Q24Hvgy1UocDDi5x3sNU3HE/1tMoIjOv29noNpWlND4YQrhubDfLeSxBw3khIUUr8SSL+w1NtEsT58RJlEI3oVCgiBatIyzKynWUrYrq2ys6hTobXcUEUiHj9Y9kQpyt70QUSW3CFpYWeado+MWnQYachn55KSN6AwoK5YbJBqRsdWK9ENqIRa/FNjG8XCL8aU/yyCB5WqpUPa0IK62Xjh0CmCHhia34nsipkm0/40j1hQv3POnS43E6vMG8n67X6p96Q8uA4kiWxgyd/OmhybtqVqFKAPB/vBiZT/7OheQlvWWKCx4oEIV24Cy4PXziCkGHLbxEQAM0bi3PAeAWKLDRHm/myB99uB8wDG1YsonJFpNmYVBP0ycTKUGO51p4EMVvq/fXrBy+eMUI3tgCv2dB8eN7I6M5K60uF8QGoMAn3RNw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39850400004)(376002)(46966006)(36840700001)(478600001)(186003)(8936002)(33656002)(356005)(4326008)(2906002)(7696005)(63350400001)(63370400001)(53546011)(6506007)(54906003)(110136005)(316002)(336012)(26005)(81166007)(83380400001)(82740400003)(82310400003)(47076005)(52536014)(9686003)(55016002)(70586007)(70206006)(5660300002)(36860700001)(86362001)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 06:01:14.9770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c9e7a8-531d-4208-1315-08d9607b41c5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4040

SGkgSnVsaWVuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXVndXN0IDExLCAy
MDIxIDk6NDggUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hl
bg0KPiA8V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIFY0IDAzLzEwXSB4ZW4vYXJtOiBoYW5kbGUgc3RhdGljIG1lbW9yeSBpbg0KPiBkdF91
bnJlc2VydmVkX3JlZ2lvbnMNCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24gMjgvMDcvMjAyMSAx
MToyNywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gc3RhdGljIG1lbW9yeSByZWdpb25zIG92ZXJs
YXAgd2l0aCBtZW1vcnkgbm9kZXMuIFRoZSBvdmVybGFwcGluZw0KPiA+IG1lbW9yeSBpcyByZXNl
cnZlZC1tZW1vcnkgYW5kIHNob3VsZCBiZSBoYW5kbGVkIGFjY29yZGluZ2x5Og0KPiA+IGR0X3Vu
cmVzZXJ2ZWRfcmVnaW9ucyBzaG91bGQgc2tpcCB0aGVzZSByZWdpb25zIHRoZSBzYW1lIHdheSB0
aGV5IGFyZQ0KPiA+IGFscmVhZHkgc2tpcHBpbmcgbWVtLXJlc2VydmVkIHJlZ2lvbnMuDQo+ID4N
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnkuemhlbmdAYXJtLmNvbT4NCj4g
PiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9zZXR1cC5jIHwgNDcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNl
cnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jIGluZGV4DQo+ID4gNjNhOTA4ZTMy
NS4uZjU2OTEzNDMxNyAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiA+
ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ID4gQEAgLTIwMCw2ICsyMDAsMTMgQEAgc3Rh
dGljIHZvaWQgX19pbml0IGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhwYWRkcl90IHMsDQo+IHBhZGRy
X3QgZSwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50
IGZpcnN0KQ0KPiA+ICAgew0KPiA+ICAgICAgIGludCBpLCBuciA9IGZkdF9udW1fbWVtX3Jzdihk
ZXZpY2VfdHJlZV9mbGF0dGVuZWQpOw0KPiA+ICsgICAgLyoNCj4gPiArICAgICAqIFRoZXJlIGFy
ZSB0d28gdHlwZXMgb2YgcmVzZXJ2ZWQgbWVtb3J5IHN0b3JlZCBpbiBib290aW5mbywgb25lDQo+
IGRlZmluZXMNCj4gPiArICAgICAqIGluIC9yZXNlcnZlZC1tZW1vcnkgbm9kZSwgdGhlIG90aGVy
IHJlZmVycyB0byBkb21haW4gb24gc3RhdGljDQo+IGFsbG9jYXRpb24NCj4gPiArICAgICAqIHRo
cm91Z2ggInhlbixzdGF0aWMtbWVtIiBwcm9wZXJ0eS4NCj4gPiArICAgICAqLw0KPiA+ICsgICAg
aW50IG5yX3Jzdl90eXBlID0gMiwgdCA9IDAsIHByZXZfbnI7DQo+ID4gKyAgICBzdHJ1Y3QgbWVt
aW5mbyAqcnN2X3R5cGVbMl0gPSB7JmJvb3RpbmZvLnJlc2VydmVkX21lbSwNCj4gPiArICZib290
aW5mby5zdGF0aWNfbWVtfTsNCj4gDQo+IExvb2tpbmcgYXQgdGhlIHJlc3Qgb2YgdGhlIHNlcmll
cywgaXQgZG9lc24ndCBsb29rIGxpa2UgdGhlcmUgaXMgYSByZWFsIGJlbmVmaXRzIHRvDQo+IGhh
dmUgdGhlIHN0YXRpYyBtZW1vcnkgYW5kIHJlc2VydmVkIG1lbW9yeSBpbiBzZXBhcmF0ZSBhcnJh
eXMgYXMgdGhleSBhcmUNCj4gd2Fsa2VkIG9ubHkgYSBmZXcgdGltZXMgYW5kIHRoZXkgYXJlIGJv
dGggbWVhbnQgdG8gYmUgc21hbGwuIEluIGZhY3QsIEkgdGhpbmsNCj4gdGhpcyBjb2RlIGlzIGxv
dCBtb3JlIGRpZmZpY3VsdCB0byByZWFkLg0KPiANCj4gU28gaXQgd291bGQgYmUgYmVzdCB0byBt
ZXJnZSB0aGUgdHdvIGFycmF5cyBpbiBvbmUuIFdlIGNhbiBhZGQgYSBmbGFnIGluIHRoZQ0KPiBz
dHJ1Y3R1cmUgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuICJzdGF0aWMiIGFuZCAicmVzZXJ2ZWQi
IG1lbW9yeS4NCj4gDQoNCkhvdyBhYm91dCBhZGRpbmcgYSAic3RhdGljIiBmbGFnIGluICJzdHJ1
Y3QgbWVtaW5mbyIgdG8gdGVsbC4gU2VlIHRoZSBiZWxvdyBleGFtcGxlOg0KIg0Kc3RydWN0IG1l
bWluZm8gew0KICAgIGludCBucl9iYW5rczsNCiAgICBzdHJ1Y3QgbWVtYmFuayBiYW5rW05SX01F
TV9CQU5LU107DQogICAgYm9vbCBzdGF0aWM7ICAvKiB3aGV0aGVyIG1lbW9yeSBpcyByZXNlcnZl
ZCBhcyBzdGF0aWMgbWVtb3J5LiAqLw0KfTsNCiINCg0KQW5kIEkgd2lsbCBkZWxldGUgInN0cnVj
dCBtZW1pbmZvIHN0YXRpY19tZW0iIGFycmF5LCBhbGwgInN0YXRpYyIgYW5kICJyZXNlcnZlZCIg
bWVtb3J5DQp3aWxsIGJlIHN0b3JlZCBpbiBvbmUgInN0cnVjdCBtZW1pbmZvIHJlc2VydmVkX21l
bSIgYXJyYXkuDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0NCg0KQ2hlZXJzLA0KDQotLQ0KPiBKdWxp
ZW4gR3JhbGwNCg==

