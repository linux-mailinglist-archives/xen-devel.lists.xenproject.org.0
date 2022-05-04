Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99249519812
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 09:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320362.541050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm9Nk-0000LN-0X; Wed, 04 May 2022 07:25:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320362.541050; Wed, 04 May 2022 07:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm9Nj-0000IZ-St; Wed, 04 May 2022 07:25:07 +0000
Received: by outflank-mailman (input) for mailman id 320362;
 Wed, 04 May 2022 07:25:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLg=VM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nm9Nh-0000IT-GN
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 07:25:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50d6f773-cb7b-11ec-a406-831a346695d4;
 Wed, 04 May 2022 09:25:04 +0200 (CEST)
Received: from DU2P250CA0008.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::13)
 by VE1PR08MB4958.eurprd08.prod.outlook.com (2603:10a6:803:108::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 07:25:02 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::43) by DU2P250CA0008.outlook.office365.com
 (2603:10a6:10:231::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25 via Frontend
 Transport; Wed, 4 May 2022 07:25:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 07:25:01 +0000
Received: ("Tessian outbound 2d401af10eb3:v118");
 Wed, 04 May 2022 07:25:01 +0000
Received: from 17540dd481bc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 68086438-E78C-43E4-B034-4B75AEAEFAFD.1; 
 Wed, 04 May 2022 07:24:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 17540dd481bc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 May 2022 07:24:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB4301.eurprd08.prod.outlook.com (2603:10a6:803:f7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 07:24:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.028; Wed, 4 May 2022
 07:24:52 +0000
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
X-Inumbo-ID: 50d6f773-cb7b-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EwBQ0yrTymwqJ3V/bOHM5iU78coyBUarhUFnTdy+d4TuVcxEE3XaYX6Nr3EQaZieh4Vf6QdaIMN0ZYrn+P/3GsMzdDimVftD+zbSuCfbbzNqD9YpYMxARbXMAx0AD8j52AV6OyRGsrineOxwu8n4JEqJBSg9W82N42CmnLjg4WdCpiCxTafTyXXTAGYCSByzDUUFHNzbscb9BVLrwRsv1coYO/gmN7j0N81keRhHAariqzbqRDJv1VfdPTFv7zIBlqWhjNN4pIKapYsnheRAc5JCTvIDG3BpNz4fAXjvSxJUPSr8of6aFtxtZAeDIcSdysf5GoVpEfTKJ9O00seVIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9fcqZ04iw2IdItrRajTwSyqV3xUNBwyExasmtmjCK0=;
 b=Ft38bnwoJh2eNX0QKiw8YkxkluCubA1EyZIXf1PRZ4Ajr4uGwfFgOhgxC8Hh4irKB19HKvJtBYY0J1q4tOc4ETNdQyF2nTV5K+/+nfkLHs5u6pwgWL4Yu3USLUDzRA6eyQVnlT2+oIhBX1NJwvL5uNAtp6bL9STS5h62Nn1lWKUFEp8/BjvuiYEiWC/STNJeBLN38x+d8b+WEnXn2jir/n2DCap4UmPqe698gWGJtTl/Q7IwXuna+5sekB246uilV2wSa6ArsQw1suCLw88uqsq6+QGowCtNGwvvnOdD0clfVVGqMEl1dNcxbFvev/RGqmRm3WT54EL49Qiq7uGXnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9fcqZ04iw2IdItrRajTwSyqV3xUNBwyExasmtmjCK0=;
 b=zmKKmxgUMhM2kOdTlLFqa3jKax9Xkeqg8Wexnj0uAfOBBeDO3NdTOqSHOXWRWQyrCMuERu9Dh2If0PuI9Kg+NRXCvVxR+PkOQJlKA07pDevuEYV97AcgaSHoZokWEJuegBf+KDpNbN6KxTJWM99ja841w+G009LSYHlTrbJ6z0c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a1954b95020bb84
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9zLv7KysRB44FLxkA+Ga/Zs0qykciW7hYnxiBc6q4bsFTrxJB0jZJB62IH4upyU44T8nDHFYPdxwDAfUMxF+lpeJE12jpp8L0fQ4bpicksprMGFeF7xJ8WImjP0ZoanYa4QXcZGpOBPZKDEraWrXNH0nQ6j1d3I2iol450zvx7a9Oyp6fbKNz9vp6L3KpjQsunSFjISeFRI2zwPaRqzpg4qJA5UKPRgsyDdC9oamF+ef4QWrcOVy70sT8JqVP1aqGFaqlluFwra7hmCqX+LKaz/CJRIws+jMZh1A2w4s0aEqqSGoVOJwmpEm9VU+2jilkBzECumf9SuX4xG9coiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9fcqZ04iw2IdItrRajTwSyqV3xUNBwyExasmtmjCK0=;
 b=e/cuHNjDdZ7+u8BjFq8fRGRNfOLtt6jlK/c6kGMBAbs09myAeiSEww9kV6ku6+fjS+kRsD1z87LXpaGNfp6pqVk/NVYavPSttM+STzQuN5JCwPYvU7PpXXFam3uq/hn7ZlAF+8vvjMFzZ3p+AHwIRnnrO6o8rROUZLMJKiEym8AHclE/4+oV2jxVvRFTGUGh+cOvK870uMoPtdEIp6WoPY09y4F0nhPoYzU50+W1UzskXz9TiaF2b3R5ltbTON9JGfjD4BIzsU5oLEH1VfJbu9RR5Hk74xyMnliuL2bnKfpJusWv35A024qeXtIu+3X/4frPQURC9sraJy24prFcBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9fcqZ04iw2IdItrRajTwSyqV3xUNBwyExasmtmjCK0=;
 b=zmKKmxgUMhM2kOdTlLFqa3jKax9Xkeqg8Wexnj0uAfOBBeDO3NdTOqSHOXWRWQyrCMuERu9Dh2If0PuI9Kg+NRXCvVxR+PkOQJlKA07pDevuEYV97AcgaSHoZokWEJuegBf+KDpNbN6KxTJWM99ja841w+G009LSYHlTrbJ6z0c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/3] xen/arm: Add sb instruction support
Thread-Topic: [PATCH 3/3] xen/arm: Add sb instruction support
Thread-Index: AQHYXtGbLw8lUArxPEOQFl634Avmjq0NftKAgADToQA=
Date: Wed, 4 May 2022 07:24:52 +0000
Message-ID: <E67D129C-DCA4-479E-B8B8-4C7DF8CC92B9@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <24fd2364294345f103cb13bdab2ad0b706681071.1651570561.git.bertrand.marquis@arm.com>
 <6571ead7-ff94-acb5-1e55-53ae69944bf0@xen.org>
In-Reply-To: <6571ead7-ff94-acb5-1e55-53ae69944bf0@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 210d7183-6a91-4ae6-ba6f-08da2d9f3372
x-ms-traffictypediagnostic:
	VI1PR08MB4301:EE_|DB5EUR03FT048:EE_|VE1PR08MB4958:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB495801C105111DEE3C7A8A949DC39@VE1PR08MB4958.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VhcdsuevpH6ildDAMR8ORcKP0dgRb48SUq5rVVxs1KH75Z+40F1onNPA8MjP98HOh6107cJw4ZWJmuptzQonuA9EcO3blHT3NuheSxPwWMvmU67kPOfqYBxe2gI7/j7gfqnEdyNytLwa4gAXVCxUadLb5Aoif7B1VGd6cD1AnyW7su1iQXaphDo2AyBqyZBWYVMCWbPSAJkk3SrYJt/GOF0KEM+HuEMsTVY6l9kqDqr1KbEhe2PQ9Mxjo0+fxWOM7677led7QIMM8l7hyou2j0RdIm/pZYVaes/6GovjYLkEGPyG2VUWURNAPKv0o3+7NoAcfTRsZTJshTnmOscTZWK/AjUoZ58tEflOnNWTm7yJp5fpIMrNEFYW34s9TTh724TLxJSRKlN7Hz8W5XPb3BbwKIorC8LmqKqXFS5A73wjUm1iZzRpy6l5BbH65swvHzSQDQ1q3l/aW/BjG4s8sfPGm2fYixB2Y8CWS7Jw/96mlCKHr4eVh5h4Pjuj1514SbOR1EOuj1/vIvI4flZGhrKPoF1HOI0n5/2MGnM5QnRroVEGC4fqk41tZjWBUhXg2LIsmtlJzU01zAe/v+qcyJZU/1epu0xSUnXE+k4+6KSwzHFqeUbTyZLqv0TwHawHNqO/fM7v/69lfAbSCj4c4PL9LsZ6/9xGyZ5dWc0mjK2XJEYdsYjZiCUr0jzbVI5eiWMNw3fAggMAPqID0O8/Envme0/3+/2Wa+ngwyYDVIVpZvwyyAopnwHaOK7AxJbVWeQgZWWoUIA3lqJIiYNUMQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(33656002)(71200400001)(316002)(508600001)(38070700005)(2616005)(6486002)(186003)(6512007)(53546011)(83380400001)(76116006)(5660300002)(6916009)(38100700002)(6506007)(91956017)(26005)(54906003)(36756003)(2906002)(122000001)(66446008)(4326008)(64756008)(8676002)(86362001)(66476007)(66556008)(66946007)(8936002)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D62A639B467BDE4F957EC8757654EC6E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4301
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff6ce075-5bf8-4f8b-54ce-08da2d9f2e58
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LlOzVHmc+czLRpPLoLC64+aRXPLEFlBuaJxBEtiZzJHDOjI/7zRmRnX4WCG8WIIvwEawMbm/Q+hTfnwdgieoF4uRk6BW9oLvrzNyobmS6puAHK6Fm7td8ncCthiKeU21FgTmYWjim5A7r3FoOxjkGIfEaAhY8ejaqhfSmn44SRm+/9s/rBMPfB42/pkrs9fnSdXr91F1PKWmhy8LucuNUVtR5TqAw+okwDQWvnt4gsqxUp0tHQVbOZfeknaS/Ti1qgfKCYioFt6gkQJkQAsXuMduUF4EQHkoImtykYv4Gkbj6rskMiX1D6gKR+MYrB8QmugvQ+Z9jnq+caLTZLr1ZCzZkTRq3Ra+wzi2001MizizffEJeskaks2fITHSuD5Kh2JKjHmIct9D3eC7K6yG859Pvjr5ZnbdQlJJrHU97lW/JEo0T9+U9GOv2mHiwRipQRoAE6Ps5TDdX59oXr/9d9WuHnFE6m4OQR7Et8CiedjUJ2vUpOOeTaLvkJEeDLUN2/JZhfndP67shy10Vgoh0WBhn6WYWU+Ce8Mjh+ObooZ3rs9P3xO/csvWbGhyiFE+oVFvtP8AjGhKyfI98nrl/tjUb4FSS2N7vypZYmeB/wShnROg7LRfVcYGNKIFClAX7xCT/dcvltYfZrep+gWuQ+0SxZzAHPnZe/ZVJJ6jXMLxhKawN96sZaT7SqABvwxDs8XTHKvbSXMfYwrnp8JO3g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400005)(81166007)(2906002)(4326008)(6862004)(8676002)(356005)(40460700003)(70206006)(70586007)(83380400001)(86362001)(36860700001)(47076005)(8936002)(316002)(5660300002)(53546011)(54906003)(6506007)(26005)(6512007)(36756003)(6486002)(33656002)(508600001)(2616005)(107886003)(186003)(336012)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 07:25:01.2397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 210d7183-6a91-4ae6-ba6f-08da2d9f3372
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4958

Hi Julien,

> On 3 May 2022, at 19:47, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 03/05/2022 10:38, Bertrand Marquis wrote:
>> This patch is adding sb instruction support when it is supported by a
>> CPU on arm64.
>> To achieve this, the "sb" macro is moved to sub-arch macros.h so that we
>> can use sb instruction when available through alternative on arm64 and
>> keep the current behaviour on arm32.
>=20
> SB is also supported on Arm32. So I would prefer to introduce the encodin=
g right now and avoid duplicating the .macro sb.

I will look into that.

>=20
>> A new cpuerrata capability is introduced to enable the alternative
>=20
> 'sb' is definitely not an erratum. Errata are for stuff that are meant to=
 be specific to one (or multiple) CPU and they are not part of the architec=
ture.
>=20
> This is the first time we introduce a feature in Xen. So we need to add a=
 new array in cpufeature.c that will cover 'SB' for now. In future we could=
 add feature like pointer auth, LSE atomics...

I am not quite sure why you would want to do that.

Using the sb instruction is definitely something to do to solve erratas, if=
 a CPU is not impacted by those erratas, why would you want to use this ?

>=20
>> code for sb when the support is detected using isa64 coprocessor
>=20
> s/coprocessor/system/

Ack

>=20
>> register.
>> The sb instruction is encoded using its hexadecimal value.
>=20
> This is necessary to avoid recursive macro, right?

This is necessary for several reasons:
- support compilers not supporting sb instructions (need encoding)
- handle the alternative code (we do not want to repeat this everywhere)
- avoid recursive macro

>=20
>> diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/incl=
ude/asm/arm64/macros.h
>> index 140e223b4c..e639cec400 100644
>> --- a/xen/arch/arm/include/asm/arm64/macros.h
>> +++ b/xen/arch/arm/include/asm/arm64/macros.h
>> @@ -1,6 +1,24 @@
>>  #ifndef __ASM_ARM_ARM64_MACROS_H
>>  #define __ASM_ARM_ARM64_MACROS_H
>>  +#include <asm/alternative.h>
>> +
>> +    /*
>> +     * Speculative barrier
>> +     */
>> +    .macro sb
>> +alternative_if_not ARM64_HAS_SB
>> +    dsb nsh
>> +    isb
>> +alternative_else
>> +/*
>> + * SB encoding as given in chapter C6.2.264 of ARM ARM (DDI 0487H.a).
>> + */
>=20
> NIT: Please align the comment with ".inst" below. I also don't think it i=
s necessary to mention the spec here. The instruction encoding is not going=
 to change.
Ack

>=20
>> +    .inst 0xd50330ff
>> +    nop
>=20
> Why do we need the NOP?

Alternative requires both sides to have the same size hence the nop to have=
 2 instructions as in the if.

>=20
>> +alternative_endif
>> +    .endm
>> +
>>      /*
>>       * @dst: Result of get_cpu_info()
>>       */
>> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/includ=
e/asm/cpufeature.h
>> index 4719de47f3..9370805900 100644
>> --- a/xen/arch/arm/include/asm/cpufeature.h
>> +++ b/xen/arch/arm/include/asm/cpufeature.h
>> @@ -67,8 +67,9 @@
>>  #define ARM_WORKAROUND_BHB_LOOP_24 13
>>  #define ARM_WORKAROUND_BHB_LOOP_32 14
>>  #define ARM_WORKAROUND_BHB_SMCC_3 15
>> +#define ARM64_HAS_SB 16
>>  -#define ARM_NCAPS           16
>> +#define ARM_NCAPS           17
>>    #ifndef __ASSEMBLY__
>>  diff --git a/xen/arch/arm/include/asm/macros.h b/xen/arch/arm/include/a=
sm/macros.h
>> index 1aa373760f..91ea3505e4 100644
>> --- a/xen/arch/arm/include/asm/macros.h
>> +++ b/xen/arch/arm/include/asm/macros.h
>> @@ -5,15 +5,6 @@
>>  # error "This file should only be included in assembly file"
>>  #endif
>>  -    /*
>> -     * Speculative barrier
>> -     * XXX: Add support for the 'sb' instruction
>> -     */
>> -    .macro sb
>> -    dsb nsh
>> -    isb
>> -    .endm
>> -
>>  #if defined (CONFIG_ARM_32)
>>  # include <asm/arm32/macros.h>
>>  #elif defined(CONFIG_ARM_64)
>=20
> Cheers,

Thanks for the review

Cheers
Bertrand


