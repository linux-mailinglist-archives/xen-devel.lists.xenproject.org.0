Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3B442569D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 17:32:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203806.358948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYVN2-00047M-In; Thu, 07 Oct 2021 15:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203806.358948; Thu, 07 Oct 2021 15:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYVN2-00045P-Fb; Thu, 07 Oct 2021 15:31:44 +0000
Received: by outflank-mailman (input) for mailman id 203806;
 Thu, 07 Oct 2021 15:31:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/ki=O3=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mYVN1-000455-82
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 15:31:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b636325f-36b0-40af-943a-f6ad56de7d4f;
 Thu, 07 Oct 2021 15:31:35 +0000 (UTC)
Received: from AM6PR0502CA0058.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::35) by HE1PR0801MB1836.eurprd08.prod.outlook.com
 (2603:10a6:3:89::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 15:31:33 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::e6) by AM6PR0502CA0058.outlook.office365.com
 (2603:10a6:20b:56::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 15:31:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 15:31:32 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Thu, 07 Oct 2021 15:31:32 +0000
Received: from 80b2d477551c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A974E6C4-D6B2-4C41-98B6-973A895E193A.1; 
 Thu, 07 Oct 2021 15:31:25 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 80b2d477551c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Oct 2021 15:31:25 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4866.eurprd08.prod.outlook.com (2603:10a6:20b:c8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21; Thu, 7 Oct
 2021 15:31:22 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 15:31:22 +0000
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
X-Inumbo-ID: b636325f-36b0-40af-943a-f6ad56de7d4f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3vr1TjeNbdwYM/J82wk/tF5Zbaky28uluXA1Eqz5Tg=;
 b=ikJRrZVDByMoUO+i5YpjkIami8XcHnPPy5V9MPtz1qhpLU9/BmghcdiYein7uPyTgDknZjZzAp6u5n1FUzI2Ks6zwn5W3vly/w9uuKEhKfe+lWm5rQ4a+5c16p+aFoLEd2a170IZreCMAoqmfi8xyQdVwxaTcs5qRjDB6zOJPj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e8800bc44272869
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2T7CjoXziitnV6ssDCzy3h5LrqSD/PiWaXbNQHCjqGccYjWWZgh3ia5Qx79JqF0Wxcme6OdQtN6g2lHPGaUZKCR2/OW16N8ZzienaMYXPKUVRprw1GU7oiGyFarnlo+OeU3Syo6xFYRNdmYRhDh898YCH4fZ98CRLYua0M/iToqMmnnNnNokKQp4C9fonNJaz6p/nZcE+nsLc2/mjj1vw9GFhwTxlBOH+W5OJfTj02nozhVvCoCxtDYSIbVOqJnttts/gHN6MRQPWDL65AL5tRbyChVf5RTq7YAF87fFzmUsUB8RRf0tpGUPpEsZkhZQJCXxQICKTtJgRgnDpxOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3vr1TjeNbdwYM/J82wk/tF5Zbaky28uluXA1Eqz5Tg=;
 b=DsTayZkB1nky5W74DzkKPT/YVCE77Df0dvyr6Agf8vDb2z0BTh6iDoosKBz6bCYHHUOjfWKgcUmy3JtGPWsWFBOt2yqquuntoywcHQALYK1sIGwpra1RlO7f+k64VZ6Vt9gL8jbbrfXtmy/i+NxEa4matLB6qM8jXm1ySNqwByVeQN+gP7FKSFHe4CtYTOIhDJ16pCojcyctj6RU0oztmr0Aaa/aYEqprtJGvFzzFXhHVzVooQhLvIMuF0HxYuErJSQEz+msk4G1BmmFd3QNTUv8ylVhI/82LlMl+PLprwzJAgWK4JFrsj6xe9V+HHShYCrzyLEkotdzjs5vN+v4rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3vr1TjeNbdwYM/J82wk/tF5Zbaky28uluXA1Eqz5Tg=;
 b=ikJRrZVDByMoUO+i5YpjkIami8XcHnPPy5V9MPtz1qhpLU9/BmghcdiYein7uPyTgDknZjZzAp6u5n1FUzI2Ks6zwn5W3vly/w9uuKEhKfe+lWm5rQ4a+5c16p+aFoLEd2a170IZreCMAoqmfi8xyQdVwxaTcs5qRjDB6zOJPj0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Ian Jackson <iwj@xenproject.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v5 10/11] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index: AQHXutl6z4iIfi6+uESKx+Wr4ZB/gavGQpyAgABrjQCAAPznAA==
Date: Thu, 7 Oct 2021 15:31:22 +0000
Message-ID: <CE10B2F3-2427-4C64-9912-0FE207569628@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
 <7bdac405-a889-15e1-be19-5876f7253855@xen.org>
 <alpine.DEB.2.21.2110061708500.3209@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110061708500.3209@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 64a583f1-6840-4d4d-54b7-08d989a78aa0
x-ms-traffictypediagnostic: AM6PR08MB4866:|HE1PR0801MB1836:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1836397107788C7595E9DB42FCB19@HE1PR0801MB1836.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DljM6XBj8WVcI+QO/UsggCvE0Qm49zHv/h7lJvHtt/9eUTVoRPpxaYIaMRt9bDOZAIfCkVkt8oLGE8Sh4QHltZeBUEUAxnLvmOJwy0Wu/Ly56BXgPAC12N24ghyyK3dUgNtAL5eiOGZ8masv3g51NW4Tmyb44XyhS32iRJnW7jtGOVwVvOflcyDHUX+/uwMQT4RMSiphllcKZ/DkXbg6M/xM6M6g8SrKyvuEkpVX0pXiT/VPIzc8KY0vfemNPXp+ZBW1nrPSQMGoItwyn+mSrwcHWZq0H+1YdggGwRfTLZLG5vZ0MheNj8+mWdUdnUqjSX+F0bOoO/8CqoYgZ4/FV4NTaSqKG2gAddcy3dke0gpyQGe82m0c73O/5+NUu7erxe4QdU7Ys/LD20q8kouEsC8JwpfXlZnJrm3XBQMih+kXkFpuv5nf7VrMHw2KETtD7VM+VWR2R/xSLywYcTmXUpHPjpghranovty99lSGaKLn8mFIJV4P73UYw/XmpZx+uLHm5LCwlm5brmfX573XrfiLKDJ2nkk0VAIZsULDcCvT4sLGAlD/J5eEtklLxBM6F44owZDY6/3OgZvFcduDOsSzNMbM0ZSTjGEPvaaD1KfkK/B1gsIJJSblfzgFs/Yv6hwJ9W1jC5LzG5OigDobKj7pnHK29WZZknLUPG+B7A6a6NdXg619qWS32NstOqBY871vzGpTs2znTqcdKScmGAmd4nFckCGnpDh//DrSxBHtrKR0OOeVCkhcZqGlAAFy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(4326008)(66476007)(2616005)(6916009)(8936002)(5660300002)(26005)(36756003)(6512007)(38100700002)(8676002)(2906002)(186003)(6486002)(66946007)(66556008)(64756008)(76116006)(33656002)(316002)(6506007)(53546011)(66446008)(71200400001)(86362001)(91956017)(38070700005)(54906003)(122000001)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C9440F40245254985C1D32948BE824E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4866
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5d9486be-56dd-49ff-473e-08d989a784c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uTZ4cJSHHAtF5wl5GM6+/B3A9xRvaUFlovOLOhaRRgLxwQYeKoFfOWNOcdHDuXLkInESMVK+XiSH0EtRZF7wdWlibuUOLErP8WNACXqKRDvHyEeml+NTgq06cKflStt3u5PcMP5HjvSnyh1URqC2sPNfqiwZIUpYASJUCoO3oynw2U2X9l70CQS9EQQ6IqlifU9km/hbKpBR1QnB+UXlt/WO1WEeNPOSBi38cwVnmblc5IPizZVoeGE1y7Fqxxrf+wwBpqGTz/xsgbfH+bqpD20eeywmWJCjRn82Y6cjfqMiZzfS/6dSS4WT4GCEk4ySnszYpgiZ11KdzwmMV7qJd75gHCtPE2K2GD27oWq3kP3nW5tBDu9uz1jJX5s4vmOEykw0knGPm/GxDhs+DeL6t4wxciGADurNSEEMH0lwSYdhOBLzmZ/R+7Nn2JUY3ffQHoLe9GDBCHnJadgtkk5NBVkMbcy82KBD4efMqQWSWFSMZC92SroS+u9y5gt7d1vS5TcXejffsE8gLvk6dGv/wMORAVl0ti4iGGxvgAAiXwinvxXkkBdoC38m/HxlOJn686f7zOtTl45a7r10IHyWj1IGoXv3/pLuONExanBsKZwyPlboIvSVgUaDySzBSrJjFzH81pc7SdteJ1+FoH3qPn0MqoB7j4N3XPUE/4gKXgvmvDZUW062d5nn3DvlfQkDeBx06I4YLpAUe2aqk0w2jg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6512007)(33656002)(36756003)(336012)(8936002)(70206006)(26005)(508600001)(86362001)(5660300002)(2906002)(6486002)(36860700001)(2616005)(8676002)(70586007)(6506007)(186003)(316002)(82310400003)(81166007)(4326008)(83380400001)(6862004)(107886003)(53546011)(54906003)(356005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 15:31:32.7133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a583f1-6840-4d4d-54b7-08d989a78aa0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1836

SGkgU3RlZmFubywNCg0KPiBPbiA3IE9jdCAyMDIxLCBhdCAxOjI2IGFtLCBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCA2IE9j
dCAyMDIxLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSBSYWh1bCwNCj4+IA0KPj4gT24gMDYv
MTAvMjAyMSAxOTo0MCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfdHlwZXMuaWRsDQo+Pj4gYi90b29scy9saWJzL2xpZ2h0L2xpYnhs
X3R5cGVzLmlkbA0KPj4+IGluZGV4IDNmOWZmZjY1M2EuLjc4YjFkZGYwYjggMTAwNjQ0DQo+Pj4g
LS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF90eXBlcy5pZGwNCj4+PiArKysgYi90b29scy9s
aWJzL2xpZ2h0L2xpYnhsX3R5cGVzLmlkbA0KPj4+IEBAIC02NDQsNiArNjQ0LDcgQEAgbGlieGxf
ZG9tYWluX2J1aWxkX2luZm8gPSBTdHJ1Y3QoImRvbWFpbl9idWlsZF9pbmZvIixbDQo+Pj4gICAg
ICAgICgiYXJjaF9hcm0iLCBTdHJ1Y3QoTm9uZSwgWygiZ2ljX3ZlcnNpb24iLCBsaWJ4bF9naWNf
dmVyc2lvbiksDQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoInZ1YXJ0Iiwg
bGlieGxfdnVhcnRfdHlwZSksDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAo
InZwY2kiLCBsaWJ4bF9kZWZib29sKSwNCj4+IA0KPj4gSSBoYXZlIHBvc3RlZCBzb21lIGNvbW1l
bnRzIHJlZ2FyZGluZyB0aGUgZmllbGQgaW4gdjQuIFRvIHN1bW1hcml6ZSwgQUZBSUNULA0KPj4g
dGhpcyBvcHRpb24gaXMgbWVhbnQgdG8gYmUgb25seSBzZXQgYnkgbGlieGwgYnV0IHlvdSBzdGls
bCBsZXQgdGhlIHRvb2xzdGFjaw0KPj4gKGUuZy4geGwsIGxpYnZpcnQpIHRvIHNldCBpdC4NCj4+
IA0KPj4gSWYgeW91IHN0aWxsIHdhbnQgdG8gZXhwb3NlIHRvIHRoZSB0b29sc3RhY2ssIHRoZW4g
SSB0aGluayB0aGUgb3B0aW9uIHNob3VsZA0KPj4gYmUgb3V0c2lkZSBvZiBhcmNoX2FybS4gT3Ro
ZXJ3aXNlLCB0aGlzIHNob3VsZCBiZSBtb3ZlZCBpbiBhbiBpbnRlcm5hbA0KPj4gc3RydWN0dXJl
IChJYW4sIGRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uPykuDQo+IA0KPiANCj4gRmlyc3QgbGV0
IG1lIHByZW1pc2UgdGhhdCB0aGUgcGF0Y2ggaXMgbXVjaCBiZXR0ZXIgYWxyZWFkeSBhbmQgUmFo
dWwNCj4gYWRkZXNzZWQgbXkgcmVxdWVzdCB3ZWxsLiBIb3dldmVyLCBKdWxpZW4ncyBwb2ludCBh
Ym91dCBub3Qgd2FudGluZyB0bw0KPiBtYWtlIGEgcG90ZW50aWFsbHkgYnJlYWtpbmcgQUJJIGNo
YW5nZSBpbiBsaWJ4bCBpcyBhIGdvb2Qgb25lLiBGWUkgd2UNCj4gaGFkIGEgZmV3IGxpYnZpcnQg
YnJlYWthZ2VzIGR1ZSB0byB0aGlzIGtpbmQgb2YgY2hhbmdlcyBpbiB0aGUgcGFzdCBhbmQNCj4g
SSB3b3VsZCBjZXJ0YWlubHkgYmUgaGFwcGllciBpZiB3ZSBkaWRuJ3QgY2F1c2UgYW5vdGhlciBv
bmUuIEFuZCBpbg0KPiBnZW5lcmFsLCBpdCBpcyBiZXR0ZXIgdG8gYXZvaWQgY2hhbmdlcyB0byB0
aGUgbGlieGwgQUJJIGlmIHdlIGNhbi4NCj4gDQo+IEkgdGhpbmsgaW4gdGhpcyBjYXNlIHdlIGNh
bjogSSBsb29rZWQgYXQgdGhlIHBhdGNoIGFuZA0KPiBiX2luZm8uYXJjaF9hcm0udnBjaSBpcyBv
bmx5IHVzZWQgd2l0aGluIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMuDQo+IEFsc28sIHdl
IGRvbid0IG5lZWQgYl9pbmZvLmFyY2hfYXJtLnZwY2kgaWYgd2UgY2FuIGFjY2Vzcw0KPiBkX2Nv
bmZpZy0+bnVtX3BjaWRldnMgZ2l2ZW4gdGhhdCB0aGUgY2hlY2sgaXMganVzdCBiYXNlZCBvbg0K
PiBkX2NvbmZpZy0+bnVtX3BjaWRldnMuDQo+IA0KPiBTbyB0aGUgb25seSBpc3N1ZSBpcyBob3cg
dG8gY2hlY2sgb24gZF9jb25maWctPm51bV9wY2lkZXZzIGluDQo+IGxpYnhsX19wcmVwYXJlX2R0
Yi4gbGlieGxfX3ByZXBhcmVfZHRiIHRha2VzIGxpYnhsX2RvbWFpbl9idWlsZF9pbmZvIGFzDQo+
IHBhcmFtZXRlciBidXQgd2l0aCBjb250YWluZXJfb2Ygd2UgY2FuIHJldHJpZXZlIGxpYnhsX2Rv
bWFpbl9jb25maWcgYW5kDQo+IGZyb20gdGhlcmUgY2hlY2sgb24gbnVtX3BjaWRldnMuDQo+IA0K
PiBTb21ldGhpbmcgbGlrZSB0aGUgYXBwZW5kZWQgKHVudGVzdGVkKS4gSXQgZG9lc24ndCBuZWVk
IGFueSBsaWJ4bCBzdHJ1Y3QNCj4gY2hhbmdlcyBidXQgaXQgcmVxdWlyZXMgdGhlIGludHJvZHVj
dGlvbiBvZiBjb250YWluZXJfb2YgKHdoaWNoIGlzIGENCj4gc2ltcGxlIG1hY3JvKS4gQWx0ZXJu
YXRpdmVseSwgaXQgd291bGQgYmUganVzdCBhcyBzaW1wbGUgdG8gY2hhbmdlDQo+IGxpYnhsX19h
cmNoX2RvbWFpbl9pbml0X2h3X2Rlc2NyaXB0aW9uIGFuZCBsaWJ4bF9fcHJlcGFyZV9kdGIgdG8g
dGFrZSBhDQo+IGxpYnhsX2RvbWFpbl9jb25maWcgKmRfY29uZmlnIHBhcmFtZXRlciBpbnN0ZWFk
IG9mIGENCj4gbGlieGxfZG9tYWluX2J1aWxkX2luZm8gKmluZm8gcGFyYW1ldGVyLg0KDQpUaGFu
a3MgZm9yIHNoYXJpbmcgdGhlIGlkZWFzIHRvIHJlbW92ZSB0aGUgYXJjaF9hcm0udnBjaSBmaWVs
ZC4gDQpJIGFtIG9rIHdpdGggYW55IG9wdGlvbnMsIGJ1dCBJIGZlZWwgc2Vjb25kIG9wdGlvbiBp
cyBzaW1wbGUgYW5kIGJldHRlciB0byBhdm9pZCAgDQppbnRyb2R1Y3Rpb24gb2YgY29udGFpbmVy
X29mKCkuIEkgdGVzdGVkIHRoZSBzZWNvbmQgb3B0aW9uIGFuZCBpcyB3b3JraW5nIGZpbmUuDQpJ
ZiBldmVyeW9uZSBhZ3JlZSB0aGF0IHdlIGRvbuKAmXQgbmVlZCB2cGNpIG9wdGlvbiBJIHdpbGwg
c2VuZCB0aGUgcGF0Y2ggZm9yIHJldmlldw0KSW4gbmV4dCB2ZXJzaW9uLg0KDQpSZWdhcmRzLA0K
UmFodWwNCj4gDQo+IElhbiwgYW55IHRob3VnaHRzPw0KPiANCj4gDQo+IGRpZmYgLS1naXQgYS90
b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9hcm0u
Yw0KPiBpbmRleCAyYmUyMDhiOTliLi5lZTExNzY1MTljIDEwMDY0NA0KPiAtLS0gYS90b29scy9s
aWJzL2xpZ2h0L2xpYnhsX2FybS5jDQo+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJt
LmMNCj4gQEAgLTEwMiwxMCArMTAyLDggQEAgaW50IGxpYnhsX19hcmNoX2RvbWFpbl9wcmVwYXJl
X2NvbmZpZyhsaWJ4bF9fZ2MgKmdjLA0KPiAgICAgfQ0KPiANCj4gICAgIC8qIEVuYWJsZSBWUENJ
IHN1cHBvcnQuICovDQo+IC0gICAgaWYgKGRfY29uZmlnLT5udW1fcGNpZGV2cykgew0KPiArICAg
IGlmIChkX2NvbmZpZy0+bnVtX3BjaWRldnMpDQo+ICAgICAgICAgY29uZmlnLT5mbGFncyB8PSBY
RU5fRE9NQ1RMX0NERl92cGNpOw0KPiAtICAgICAgICBsaWJ4bF9kZWZib29sX3NldCgmZF9jb25m
aWctPmJfaW5mby5hcmNoX2FybS52cGNpLCB0cnVlKTsNCj4gLSAgICB9DQo+IA0KPiAgICAgcmV0
dXJuIDA7DQo+IH0NCj4gQEAgLTk3Niw2ICs5NzQsNyBAQCBzdGF0aWMgaW50IGxpYnhsX19wcmVw
YXJlX2R0YihsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9kb21haW5fYnVpbGRfaW5mbyAqaW5mbywNCj4g
DQo+ICAgICBjb25zdCBsaWJ4bF92ZXJzaW9uX2luZm8gKnZlcnM7DQo+ICAgICBjb25zdCBzdHJ1
Y3QgYXJjaF9pbmZvICphaW5mbzsNCj4gKyAgICBsaWJ4bF9kb21haW5fY29uZmlnICpkX2NvbmZp
ZyA9IGNvbnRhaW5lcl9vZihpbmZvLCBsaWJ4bF9kb21haW5fY29uZmlnLCBiX2luZm8pOw0KPiAN
Cj4gICAgIHZlcnMgPSBsaWJ4bF9nZXRfdmVyc2lvbl9pbmZvKENUWCk7DQo+ICAgICBpZiAodmVy
cyA9PSBOVUxMKSByZXR1cm4gRVJST1JfRkFJTDsNCj4gQEAgLTEwNzYsNyArMTA3NSw3IEBAIG5l
eHRfcmVzaXplOg0KPiAgICAgICAgIGlmIChpbmZvLT50ZWUgPT0gTElCWExfVEVFX1RZUEVfT1BU
RUUpDQo+ICAgICAgICAgICAgIEZEVCggbWFrZV9vcHRlZV9ub2RlKGdjLCBmZHQpICk7DQo+IA0K
PiAtICAgICAgICBpZiAobGlieGxfZGVmYm9vbF92YWwoaW5mby0+YXJjaF9hcm0udnBjaSkpDQo+
ICsgICAgICAgIGlmIChkX2NvbmZpZy0+bnVtX3BjaWRldnMpDQo+ICAgICAgICAgICAgIEZEVCgg
bWFrZV92cGNpX25vZGUoZ2MsIGZkdCwgYWluZm8sIGRvbSkgKTsNCj4gDQo+ICAgICAgICAgaWYg
KHBmZHQpDQoNCg==

