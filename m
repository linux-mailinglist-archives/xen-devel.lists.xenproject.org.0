Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8104B363C57
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 09:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112672.214891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYO9l-00086G-6E; Mon, 19 Apr 2021 07:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112672.214891; Mon, 19 Apr 2021 07:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYO9l-00085o-1P; Mon, 19 Apr 2021 07:17:17 +0000
Received: by outflank-mailman (input) for mailman id 112672;
 Mon, 19 Apr 2021 07:17:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jNU4=JQ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lYO9i-00085j-SO
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 07:17:15 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ca0aa6b-ada7-499f-92b6-cc0a67f19f73;
 Mon, 19 Apr 2021 07:17:08 +0000 (UTC)
Received: from AS8PR04CA0166.eurprd04.prod.outlook.com (2603:10a6:20b:331::21)
 by PA4PR08MB5933.eurprd08.prod.outlook.com (2603:10a6:102:f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 07:17:05 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::c7) by AS8PR04CA0166.outlook.office365.com
 (2603:10a6:20b:331::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 07:17:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 07:17:05 +0000
Received: ("Tessian outbound 9bcb3c8d6cb1:v90");
 Mon, 19 Apr 2021 07:17:04 +0000
Received: from d4a814bb0871.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2D30D09D-C51E-484B-A9FF-C62731EBC33E.1; 
 Mon, 19 Apr 2021 07:16:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4a814bb0871.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 19 Apr 2021 07:16:53 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB8PR08MB5482.eurprd08.prod.outlook.com (2603:10a6:10:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Mon, 19 Apr
 2021 07:16:52 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::8957:8ec1:e77f:f34e]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::8957:8ec1:e77f:f34e%3]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 07:16:52 +0000
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
X-Inumbo-ID: 0ca0aa6b-ada7-499f-92b6-cc0a67f19f73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoKdU2VMFlNwXP19o9K8VMJuJDahd7Bp3b3fiXkrdPg=;
 b=4Rxi4Dk0JJp0xysD13VudLFXTe0sUJJPtzsO/GUoGTl5pT0yR5LEuI9AIR8RCN0RVUekobXdRwf636BE3x053mHNYOVafhxOsjHz1L/OQSzuwjVK0QaNM2ixCG1oHPQQfJOxN6einftNibXY/DghVnnPAE4ym81WhRSNcKjJVXE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 36d9e9f6e7013930
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llY8Rqt1ECH1/8CePR/QpOrjJNk1pqz13m5ystYEXvZpjZC0dUfDIm2YJTMIgqoOkSgYNPkHJFv8sMVJm8Ir73Ua1Pm4Ta7A64NHf79bw66vFuhM6hgGF4+3d0YUX2gmaE/1E+yrmXbzrhieSghNq8pArx5KweacCTdE9ZXMMyQuwBgDXS23DY9MW0Ql1NqzDgBNFdiP4xcLviv/2r2tw2aXg29Uowh4y2MxOhtfgW0k7R9DruTXs01wmNgGQ6Ds1SPzZxSGvNW48ieU5/ZldbiGeKG27wGz5w7E6EX7vitczO5zvgwxZ31tnN3NDND28BAUldEZjCn1vioTMsyd8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoKdU2VMFlNwXP19o9K8VMJuJDahd7Bp3b3fiXkrdPg=;
 b=CL1scc8ppTwpL6am3B53DiuCxVWI6rq5lmMd22oaDL7UIjsgojmE6xaeXOOe09f4gH20EpsKQi3OAI0QYmIvAWdzQKdL0QtPrKxKOBD3ERP8X+syVNSSDdIChIa2DtJ6Jk2nIodNjt+u88XHLYZlhuE9uPI2q3YMw6rfYc+lsHEgxHReYftN8voWvGQ1twKh1EAXI7qhJDxXFhQOomg3MYu4neDlQdX9Dpeg2zWxV1G/CBD1qksuFgf5wdo8rNEhGUiSPQcm6iA7PLpg41YJQT+upZBqaMrOTufNcpI16+Xix6mY6f3L/trYMH2/blWLtcwZ6DpFiZ6QNMvc/4mnKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoKdU2VMFlNwXP19o9K8VMJuJDahd7Bp3b3fiXkrdPg=;
 b=4Rxi4Dk0JJp0xysD13VudLFXTe0sUJJPtzsO/GUoGTl5pT0yR5LEuI9AIR8RCN0RVUekobXdRwf636BE3x053mHNYOVafhxOsjHz1L/OQSzuwjVK0QaNM2ixCG1oHPQQfJOxN6einftNibXY/DghVnnPAE4ym81WhRSNcKjJVXE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Topic: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Index:
 AQHXLVmJnBz/2T+xZEqfD4R39q2wV6qwuDwAgAH9VwCAAPmtgIAADD+AgAHfkACAAAF1gIAF4LkA
Date: Mon, 19 Apr 2021 07:16:52 +0000
Message-ID: <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
References:
 <e4ca856b19d9128cae5f6aa4ace550ace17fd877.1617977720.git.rahul.singh@arm.com>
 <YHQlptvoC06rqNhQ@Air-de-Roger>
 <f7659788-ff1b-23dd-e838-b35ae8ef9e50@xen.org>
 <YHaiW4xX0p6ov2Z9@Air-de-Roger>
 <258c91c7-e733-3c40-5e4e-7b107e4d20c3@xen.org>
 <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
In-Reply-To: <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9a495487-e138-4b60-8867-08d9030322f6
x-ms-traffictypediagnostic: DB8PR08MB5482:|PA4PR08MB5933:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB593359A54B3A30073D106646FC499@PA4PR08MB5933.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FvKapBszVtwecqglxzVmcIowe0leQYg7u8ucp3NZHiLjCgx1E0HTmGaONNBrr5mVC1yAQRCy49XQaz05qbRnTRuCckhGX+E0FCN9KxWgKzPZPCu2zICM3/6qfIsZBKC3lgtxwNcJYdeRD0ZgmUx42+khhq9Q7oBKMdstpaKg50li2bbkX2x5d7i25SdfPShjWlwbYRtxd7bYLT8V4TanlH/280hucBHxxOBVFf6PalAZiGwE6NpQYWmQvLRK6Y6eIpB8165VD4yRw7ysdSy/APeT58RCZQdHyXqj42twk6ypdMSF04N1cyerYNZQ15Rg8/iE+Ln3yrPPObsJ7wShl4KcFo9+OgurNYat84w8iJCBNoceqodim8e7yctZRUvuf6Jd5/cRFsSjEmms/W955HuZqHdHsS4tvU42zsUtKOY3osg0kZrkfCEQSBEl2aOBVG26Lb/R7Ld+uNkL+DYwqB/aJ2O8wkRReY1wL2qbQVLNv9dM8aC6gFKZwPdIWGgtu086vr+Bw7jKBl89Wczd0R4gnfV2Qz74QloorCj2Yy2jdsZ2wFZgvaIfZueUKophtucA9vyBbZk6u4o0rBbyOiQTwkTsBltLK4C0pTH7LikW4nOCC44cEYr1kl74TESDU2M/jxCdYtnPk10u0+8qD1Q9eqlKXuf/GyOg/jyk8k4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(2906002)(33656002)(6486002)(36756003)(76116006)(4326008)(86362001)(478600001)(26005)(186003)(83380400001)(2616005)(5660300002)(8936002)(6916009)(7416002)(66446008)(6506007)(6512007)(71200400001)(8676002)(91956017)(122000001)(38100700002)(66556008)(66946007)(64756008)(53546011)(66476007)(54906003)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?dUNQY1lDc1FmaldtVlZ6Nm1rY0JHQUhhY0dpOFZNWSttUktPNXZiR3E3QTlU?=
 =?utf-8?B?Vm1RZHVQT1d6a3hQQVVXdkRpbGVPaCs5VmRBalJiSzZaMWxzTUhrd1VSNTJF?=
 =?utf-8?B?aXBvaGxCMGhpZjhDSFFpWmlSanZZM25zSTUzUG5hVlBTQXpkc01DNFhlSGNY?=
 =?utf-8?B?djNKR0NuQXNROHJqbTlITEFlQ1Rjb3BoczBtY1B1THo2ZmFsRmpYK1B3cXNL?=
 =?utf-8?B?SjhjbWltVlhHVTEwaU5BeG5aZ0VaUTErZDcrUXZIT3Z5eHpCdWI5UlUvZHNk?=
 =?utf-8?B?L2xCZVJJQjNIc28xRXBjck9Nc2xOVFIwZ3hJL3M0QTY3bG9tditMV0w3cGZo?=
 =?utf-8?B?Yzl5WGsvN092S2cvY1JiQWNvdWk5Mm5pVS9XcERkR0FSTU1xMlMyWEd2eGJZ?=
 =?utf-8?B?Z2ZmbExNRXNQNGU0RzhrUCsxdzNYUnVaMjJCL2M1bDRqMDMyanMrRWZTcTJM?=
 =?utf-8?B?YzUwVVBXSVlRS1JOcU1PZkV4VWdPSnJlVkd3WGJCb1o4bERBSzNMbk1xRTJN?=
 =?utf-8?B?OWpsQzhBKzJBYkhYY1FrZjNqMXYvTEJNZThnWUhTWUVzdWpwUnNNdmlYT2ZK?=
 =?utf-8?B?M0c5eElWdkZqd2JZVWxqbGttWVVlbVRwSUZPcm9KZG9aNnBpZ3Z5UXZDbVVs?=
 =?utf-8?B?WTBKcDVPYkxoSnIya1JwbFNVZ2xuL2dPNnRmM0cxMHFCRHFWVENQWnc0KytC?=
 =?utf-8?B?TVdGdGxmWEN0aUtBM2tCZ29qTTJseVJ2Y3FYZEpwa0p0R21WbkEvcmtZMWlj?=
 =?utf-8?B?eGdoZ2FUU3Q5MERXM2YrMytoSmdKMlAzeVRxUkwrc2pwTld2bDh3UmJYYm5l?=
 =?utf-8?B?RktWaXczMmFmdFEvWmtlRXdsTUU0RjBxZ1Y1cy9HbWdjcytOZHcwU2ErNkRQ?=
 =?utf-8?B?RFZKazZzZWRnYjJCbVBPanViandrTWJFOXd5WTBBbS9xR3Q1d2NrOEFKaDB0?=
 =?utf-8?B?ZWMxbEgxRnhJbkNGVWk3SXhIbyt2MDFDWnFnQmFGVkRxT3AyZ3hWamxGRWJF?=
 =?utf-8?B?U0xhRVRIMFZQam4xUEJhMm9DMXVlRW81RERvamY0eDIyY29jVVQ5TUpzVHlP?=
 =?utf-8?B?d2NkWEJSS01NY1p5dFBObkovSGMyNGpQZWI5T09Xb0o5VXZwVGdHcFpsUER5?=
 =?utf-8?B?cjJNYkpoaDllWS9ncE9obERaT3Z0RWVCME9HY1lCZnYzWVBoRkxrUnQ2azVY?=
 =?utf-8?B?bEEybjdCSnkvNWpEUkhUcnV3anV0VTArSUNqQUh5MDhJTXB1TUtpRzNrUUFP?=
 =?utf-8?B?MUZIeGlqeUNDclY3Ri9ENzc5REhIVkc0VkxGOElwSGNMYXIxbVNBMUx4d1l4?=
 =?utf-8?B?QWFaWjRDV1NCTFFMeXZRQ0JUTnhCTmxhWTRPWisxSFdsQTIrc21iYTJNSU5m?=
 =?utf-8?B?RTZQd2V5VGUwcDh3VzN1RzQwcXpFS0lKVkVEbG9MdkM4QUYzWURSaFdlVTBL?=
 =?utf-8?B?Zm5zR0p1Z2ZmL0ZNakZFU0RZMFVPckk4MFRuZlZjdlJ0eU03WnBSWnRkVUlU?=
 =?utf-8?B?ZDFnYkIzdVFVeXV6dTkwMkkxNlY3eXZlQ1BGY3pBbXh0OWlhYXJ4L0t5cmJv?=
 =?utf-8?B?a2R6Mm5IUEdpaXlYS0doa3NxU00vTDV0T0JUekxmZC9kQlJwa0ZoNExiYjdM?=
 =?utf-8?B?WW90NEIzWEFDREZLZHBaMmpWNVoreUNOdEdiNXRaU3hGR2VlSnYrdGJZejBO?=
 =?utf-8?B?ajRMV2QwMWpjUzNXTHk1S3dpVUtDL2IvV0d5cUVkaXJrUVhwYkYxMTV1T3E0?=
 =?utf-8?Q?6hIOjDSnRWuUzIkofnY/enS8tslmy9kT+eg9vLy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FE999A7810DF42449F8A1DDEB290B14A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5482
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	45163250-58b3-4d61-cb20-08d903031b3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MyBteJ0qlqJjCAcb4I3tsMk+zRRlxCwRvOuK3JYc3g0YoQMWvshTqkRhLe8FBZH0CRUJ4MeoCSzFiH2ysmoeOc9KjbdiB1jNbReGpjhexBDXYjlJ/7LwWdmnGO2nvZ/i29ZrGS8YoO/rdQf0nDDNzIyl89wYBkcxRJi/4TCOjQTq4Dfj430A0h3ROK1s0hFURDMKnq5A3RQxZJi4mc+HjiXmBeNy31KhdEYRdUVTHvch7dcUccp5yNOpLv0oMUyORBnF+GP3QlbrerEHBohUrPAHErfiLfuOOS3UGwoqTloAgz65J8hDZufYlSX1LBfGtcgEPw77yZVgcb/6F4D8GtOyg93w1pMVNhfzIFJSf1S8biT0igTJLgFLTOa2D4kHB0h4KkEQs9QaYZ1csyxTm8B+l4X+YmEmsVqAjRvNjlxHiZk1A5jjjmNEXo2IjEkSQbJOJTHZfKvbdKOBUSeDrcriqsbftq/1eqKRCUGTEVqYLYU7nZRGxDkcCCX/sDHH3VOkNhwAqHeueYmIa726oVMnUp2NbTvkUs7lb9L4jc9h86gvax2DnS9IQg7aiC8XeaaRV/ZGOk3TrQDCkFZenwveqXRdmdEANtxRVtgUoaprohmuXdYUYJBouOybulpTjlzCQvY/MtvFs9qxvw6ZlQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(376002)(136003)(36840700001)(46966006)(26005)(82310400003)(5660300002)(8936002)(36756003)(478600001)(6512007)(81166007)(2906002)(36860700001)(6486002)(54906003)(316002)(86362001)(8676002)(2616005)(47076005)(70206006)(6506007)(70586007)(6862004)(336012)(83380400001)(33656002)(186003)(4326008)(82740400003)(356005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 07:17:05.4253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a495487-e138-4b60-8867-08d9030322f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5933

SGkgQWxsLA0KDQo+IE9uIDE1IEFwciAyMDIxLCBhdCAyOjMxIHBtLCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIFJvZ2VyLA0KPiANCj4gT24gMTUvMDQvMjAy
MSAxNDoyNiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIFdlZCwgQXByIDE0LCAyMDIx
IGF0IDA5OjQ5OjM3QU0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBSb2dlciwN
Cj4+PiANCj4+PiBPbiAxNC8wNC8yMDIxIDA5OjA1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0K
Pj4+PiBPbiBUdWUsIEFwciAxMywgMjAyMSBhdCAwNjoxMjoxMFBNICswMTAwLCBKdWxpZW4gR3Jh
bGwgd3JvdGU6DQo+Pj4+PiBIaSBSb2dlciwNCj4+Pj4+IA0KPj4+Pj4gT24gMTIvMDQvMjAyMSAx
MTo0OSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+PiBPbiBGcmksIEFwciAwOSwgMjAy
MSBhdCAwNTowMDo0MVBNICswMTAwLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+Pj4gZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMNCj4+Pj4+Pj4gaW5kZXggNzA1MTM3ZjhiZS4uMWI0NzM1MDJhMSAxMDA2NDQN
Cj4+Pj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4+Pj4gKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4+Pj4gQEAgLTEzMDMsMTIgKzEy
NzksMTUgQEAgc3RhdGljIGludCBfX2luaXQgc2V0dXBfZHVtcF9wY2lkZXZzKHZvaWQpDQo+Pj4+
Pj4+ICAgIH0NCj4+Pj4+Pj4gICAgX19pbml0Y2FsbChzZXR1cF9kdW1wX3BjaWRldnMpOw0KPj4+
Pj4+PiArDQo+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX1BDSV9NU0lfSU5URVJDRVBUDQo+Pj4+Pj4+
ICAgIGludCBpb21tdV91cGRhdGVfaXJlX2Zyb21fbXNpKA0KPj4+Pj4+PiAgICAgICAgc3RydWN0
IG1zaV9kZXNjICptc2lfZGVzYywgc3RydWN0IG1zaV9tc2cgKm1zZykNCj4+Pj4+Pj4gICAgew0K
Pj4+Pj4+PiAgICAgICAgcmV0dXJuIGlvbW11X2ludHJlbWFwDQo+Pj4+Pj4+ICAgICAgICAgICAg
ICAgPyBpb21tdV9jYWxsKCZpb21tdV9vcHMsIHVwZGF0ZV9pcmVfZnJvbV9tc2ksIG1zaV9kZXNj
LCBtc2cpIDogMDsNCj4+Pj4+Pj4gICAgfQ0KPj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pj4gDQo+Pj4+
Pj4gVGhpcyBpcyBub3QgZXhhY3RseSByZWxhdGVkIHRvIE1TSSBpbnRlcmNlcHRzLCB0aGUgSU9N
TVUgaW50ZXJydXB0DQo+Pj4+Pj4gcmVtYXBwaW5nIHRhYmxlIHdpbGwgYWxzbyBiZSB1c2VkIGZv
ciBpbnRlcnJ1cHQgZW50cmllcyBmb3IgZGV2aWNlcw0KPj4+Pj4+IGJlaW5nIHVzZWQgYnkgWGVu
IGRpcmVjdGx5LCB3aGVyZSBubyBpbnRlcmNlcHQgaXMgcmVxdWlyZWQuDQo+Pj4+PiANCj4+Pj4+
IE9uIEFybSwgdGhpcyBpcyBub3QgdGllIHRvIHRoZSBJT01NVS4gSW5zdGVhZCwgdGhpcyBoYW5k
bGVkIGlzIGEgc2VwYXJhdGUNCj4+Pj4+IE1TSSBjb250cm9sbGVyIChzdWNoIGFzIHRoZSBJVFMp
Lg0KPj4+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4gQW5kIHRoZW4geW91IGFsc28gd2FudCB0byBnYXRl
IHRoZSBob29rIGZyb20gaW9tbXVfb3BzIGl0c2VsZiB3aXRoDQo+Pj4+Pj4gQ09ORklHX1BDSV9N
U0lfSU5URVJDRVBULCBpZiB3ZSB3YW50IHRvIGdvdCB0aGlzIHJvdXRlLg0KPj4+Pj4gDQo+Pj4+
PiANCj4+Pj4+IEFsbCB0aGUgY2FsbGVycyBhcmUgaW4gdGhlIHg4NiBjb2RlLiBTbyBob3cgYWJv
dXQgbW92aW5nIHRoZSBmdW5jdGlvbiBpbiBhbg0KPj4+Pj4geDg2IHNwZWNpZmljIGZpbGU/DQo+
Pj4+IA0KPj4+PiBZZXMsIHRoYXQgc2VlbXMgZmluZS4gSnVzdCBwbGFjZSBpdCBpbiBhc20teDg2
L2lvbW11LmguIEkgd29uZGVyIHdoeQ0KPj4+PiB1cGRhdGVfaXJlX2Zyb21fbXNpIHdhc24ndCBt
b3ZlZCB3aGVuIHRoZSByZXN0IG9mIHRoZSB4ODYgc3BlY2lmaWMNCj4+Pj4gZnVuY3Rpb25zIHdo
ZXJlIG1vdmVkIHRoZXJlLg0KPj4+IA0KPj4+IEkgYW0gZ3Vlc3NpbmcgaXQgaXMgYmVjYXVzZSB0
aGUgZnVuY3Rpb24gd2FzIHByb3RlY3RlZCBieSBDT05GSUdfSEFTX1BDSQ0KPj4+IHJhdGhlciB0
aGFuIENPTkZJR19YODYuIFNvIGl0IHdhcyBkZWZlcnJlZCB1bnRpbCBhbm90aGVyIGFyY2ggZW5h
Ymxlcw0KPj4+IENPTkZJR19IQVNfUENJIChpdCBpcyBlYXNpZXIgdG8ga25vdyB3aGF0IGNvZGUg
c2hvdWxkIGJlIG1vdmVkKS4NCj4+PiANCj4+Pj4gV2FzIHRoZXJlIGFuIGFpbSB0byB1c2UgdGhh
dCBpbiBvdGhlcg0KPj4+PiBhcmNoZXM/DQo+Pj4gDQo+Pj4gSW4gdGhlIGZ1dHVyZSB3ZSBtYXkg
bmVlZCB0byB1c2UgTVNJcyBpbiBYZW4gKElJUkMgc29tZSBTTU1VcyBvbmx5IHN1cHBvcnQNCj4+
PiBNU0kgaW50ZXJydXB0KS4NCj4+IFRoZW4gSSB0aGluayBzb21lIG9mIHRoZSBiaXRzIHRoYXQg
YXJlIG1vdmVkIGZyb20NCj4+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIChhbGxvY19w
Y2lfbXNpLCBmcmVlX3BjaV9tc2kgYW5kDQo+PiBkdW1wX3BjaV9tc2kpIG5lZWQgdG8gYmUgcHJv
dGVjdGVkIGJ5IGEgS2NvbmZpZyBvcHRpb24gZGlmZmVyZW50IHRoYW4NCj4+IENPTkZJR19QQ0lf
TVNJX0lOVEVSQ0VQVCwgYXMgdGhvc2UgYXJlIG5vdCByZWxhdGVkIHRvIE1TSSBpbnRlcmNlcHRp
b24sDQo+PiBidXQgdG8gTVNJIGhhbmRsaW5nIGluIGdlbmVyYWwgKGllOiBYZW4gZGV2aWNlcyB1
c2luZyBNU0kgbmVlZA0KPj4gdGhvc2UpLg0KPiANCj4gV2VsbC4uLiB4ODYtc3BlY2lmaWMgZGV2
aWNlcyB5ZXMuIFdlIGRvbid0IGtub3cgaW4gd2hhdCBmb3JtIE1TSSB3aWxsIGJlIGFkZGVkIG9u
IGZvciBvdGhlciBhcmNoLXNwZWNpZmljIGRldmljZXMuDQo+IA0KPiBUaGUgc2FtZSB3aXRoIHRo
ZSBtc2lfbGlzdCBhbmQgbXNpeCBmaWVsZHMgb2YgcGNpX2RldiwgdGhvc2UNCj4+IGFyZSBub3Qg
b25seSB1c2VkIGZvciBNU0kgaW50ZXJjZXB0aW9uLg0KPj4gT3IgYXQgbGVhc3QgbWlnaHQgYmUg
d29ydGggbWVudGlvbmluZyB0aGF0IHRoZSBmdW5jdGlvbnMgd2lsbCBiZQ0KPj4gbmVlZGVkIGZv
ciBYZW4gdG8gYmUgYWJsZSB0byB1c2UgTVNJIGludGVycnVwdHMgaXRzZWxmLCBldmVuIGlmIG5v
dA0KPj4gZm9yIGludGVyY2VwdGlvbiBwdXJwb3Nlcy4NCj4gDQo+IE15IHByZWZlcmVuY2Ugd291
bGQgYmUgdG8gY29tbWVudCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgKGFsdGhvdWdoLCB0aGVyZSBp
cyBubyBwcm9taXNlIHRoZXkgd2lsbCBldmVyIGdldCByZS11c2VkKS4gV2UgY2FuIHRoZW4gbW9k
aWZ5IHRoZSAjaWZkZWYgb25jZSB3ZSBpbnRyb2R1Y2UgYW55IHVzZS4NCj4gDQoNClRoYW5rcyB5
b3UgZXZlcnlvbmUgZm9yIHJldmlld2luZyB0aGUgY29kZS4gSSB3aWxsIHN1bW1hcmlzZSB3aGF0
IEkgaGF2ZSB1bmRlcnN0b29kIGZyb20gYWxsIHRoZSBjb21tZW50cyANCmFuZCB3aGF0IEkgd2ls
bCBiZSBkb2luZyBmb3IgdGhlIG5leHQgdmVyc2lvbiBvZiB0aGUgcGF0Y2guICBQbGVhc2UgbGV0
IG1lIGtub3cgeW91ciB2aWV3IG9uIHRoaXMuDQoNCjEuIENyZWF0ZSBhIHNlcGFyYXRlIG5vbi1h
cmNoIHNwZWNpZmljIGZpbGUgIm1zaS1pbnRlcmNlcHQuYyIgIGZvciB0aGUgYmVsb3cgbmV3bHkg
aW50cm9kdWNlZCBmdW5jdGlvbiBhbmQgDQogICAgY29tcGlsZSB0aGF0IGZpbGUgaWYgQ09ORklH
X1BDSV9NU0lfSU5URVJDRVBUIGlzIGVuYWJsZWQuQ09ORklHX1BDSV9NU0lfSU5URVJDRVBUICB3
aWxsICBiZSANCiAgICBlbmFibGVkIGZvciB4ODYgYnkgZGVmYXVsdC4gQWxzbyBNZW50aW9uIGlu
IHRoZSBjb21taXQgbWVzc2FnZSB0aGF0IHRoZXNlIGZ1bmN0aW9uIHdpbGwgYmUgbmVlZGVkIGZv
ciBYZW4gdG8gDQogICAgc3VwcG9ydCBNU0kgaW50ZXJydXB0IHdpdGhpbiBYRU4uDQoNCglwZGV2
X21zaV9pbml0aSguLikNCglwZGV2X21zaV9kZWluaXRpKC4uKQ0KCXBkZXZfZHVtcF9tc2koLi4p
LA0KCXBkZXZfbXNpeF9hc3NpZ24oLi4pDQoNCjIuIENyZWF0ZSBzZXBhcmF0ZSBwYXRjaCBmb3Ig
aW9tbXVfdXBkYXRlX2lyZV9mcm9tX21zaSgpIHJlbGF0ZWQgY29kZS4gVGhlcmUgYXJlIHR3byBz
dWdnZXN0aW9uIHBsZWFzZSBoZWxwIG1lIHdoaWNoIG9uZSB0byBjaG9vc2UuIA0KIA0KICAgICAt
IE1vdmUgdGhlIGlvbW11X3VwZGF0ZV9pcmVfZnJvbV9tc2koKSBmdW5jdGlvbiB0byBhc20teDg2
L2lvbW11LmggYW5kIGFsc28gbW92ZSB0aGUgaG9vayBmcm9tIGlvbW11X29wcyB1bmRlciBDT05G
SUdfWDg2Lg0KDQogICAgICAtIEltcGxlbWVudCBhIG1vcmUgZ2VuZXJpYyBmdW5jdGlvbiAiYXJj
aF9yZWdpc3Rlcl9tc2koKSIpLiBUaGlzIGNvdWxkIGNhbGwgaW9tbXVfdXBkYXRlX2lyZV9mcm9t
X21zaSgpIG9uIHg4NiBhbmQgdGhlIA0KICAgICAgICBJVFMgcmVsYXRlZCBjb2RlIG9uY2UgaW1w
bGVtZW50ZWQgb24gQXJtLiBJbnRyb2R1Y2UgdGhlIG5ldyBLY29uZmlnIENPTkZJR19IQVNfSU9N
TVVfSU5URVJSVVBUX1JFTUFQIGZvciB0aGlzIG9wdGlvbi4NCg0KMy4gQXMgcGVyIHRoZSBkaXNj
dXNzaW9uIEkgd2lsbCBnYXRlIHRoZSBzdHJ1Y3QgdnBjaV9tc2kgey4ufSBhbmQgc3RydWN0IHZw
Y2lfbXNpeHsuLn0gdXNpbmcgQ09ORklHX1BDSV9NU0lfSU5URVJDRVBUIHNvIHRoYXQgDQogICAg
dGhleSB3aWxsIG5vdCB3aWxsIGJlIGFjY2Vzc2libGUgb24gQVJNLg0KDQpSZWdhcmRzLA0KUmFo
dWwNCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

