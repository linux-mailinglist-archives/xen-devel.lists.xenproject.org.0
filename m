Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A240D1F2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 05:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187990.337027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQhqb-0006BO-R9; Thu, 16 Sep 2021 03:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187990.337027; Thu, 16 Sep 2021 03:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQhqb-000695-Nd; Thu, 16 Sep 2021 03:14:01 +0000
Received: by outflank-mailman (input) for mailman id 187990;
 Thu, 16 Sep 2021 03:13:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e8Ul=OG=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mQhqZ-00068x-BO
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 03:13:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20f22874-169c-11ec-b59d-12813bfff9fa;
 Thu, 16 Sep 2021 03:13:57 +0000 (UTC)
Received: from AM3PR05CA0153.eurprd05.prod.outlook.com (2603:10a6:207:3::31)
 by AM9PR08MB6308.eurprd08.prod.outlook.com (2603:10a6:20b:287::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 03:13:51 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:3:cafe::8a) by AM3PR05CA0153.outlook.office365.com
 (2603:10a6:207:3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 03:13:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 03:13:50 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Thu, 16 Sep 2021 03:13:50 +0000
Received: from a560d6b9d116.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC920EB3-F034-4C3B-AC9F-CE266FC54BED.1; 
 Thu, 16 Sep 2021 03:13:43 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a560d6b9d116.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Sep 2021 03:13:43 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3406.eurprd08.prod.outlook.com (2603:10a6:803:7b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Thu, 16 Sep
 2021 03:13:40 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4500.019; Thu, 16 Sep 2021
 03:13:40 +0000
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
X-Inumbo-ID: 20f22874-169c-11ec-b59d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QavK+Rws1oseC5hjcMFJw17o0Ikj5T9DQ0fG5DM6Lk=;
 b=ARSK5q12OMEQPvfOJB6qY0JIqlG4SG9eZUMlpnmtGpzkM3GCNIV624DKF/S43OTaCJb4NC3yeKJxoVUhgzU0G3uf9JXD0g9AjBv2S9W1qNTrGZgbLvc5yrQpEeEEx1e5qyV4D80CwZm/h2cInr05poYQb+HUih4kYifykvy2ric=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hCH0o4JD9xCUpK/FuVtm4izNKwnyauvDZeH6sybgR0z8W9Y8s575Pt24j7R8GQEWpL5RzSySNxjH5um0ep/0w8QQBpsHOY2UkR7UCmo8rUTiFbMp16p5bp1AiTTwJmaxHagoFXIGO5FHt4wBRQyDcdcACZhRepzB6piB8qS3OhVSD8GZ9D+n4x3Oog5mrZrgua0+j6QxN6CORSsGx9GN2CBOYpVM+JOouTYgPnQPBb+WAsomU0D9SorZ96djukzWX3myoEsmMTpICj7v3OkgFvAG76u1lMVhfQgfiAIYd2Md+Jd8j0c6bG8kYvXLmkYIjAFrtWd7AkqMxHNxWGCIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=1QavK+Rws1oseC5hjcMFJw17o0Ikj5T9DQ0fG5DM6Lk=;
 b=ENH/cCDMxaafveVA3gYidBoUS59PrFbFyCwIIQJIMLf82+QB0b4aMc63GbTQRZWLXYhgJhPfQZatO7/lWeBk34oHSmzdjAJ4xrwqQeIxxT0ki8byWFrTzzUnbHR3eJCKP2EHeg0qUyT8IczX0UMkwreHdwuYET7OeiNzYiR8I1gBkMxxTXnpZlU3as3ggaPtD/vmcHgNDTcoTVbyJnsEgx/Pa0LtaL6Ke0ypU0kFlBDnyJI/U94iNRGVwflVfk9pjV0x5zoXXJJWBAwSzz0bOC03pD8Wq+UjmvE4mVHt0LDAclvf+LM9WWvctgNJz17mqcQQgZZijd1hQ5uYH2YaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QavK+Rws1oseC5hjcMFJw17o0Ikj5T9DQ0fG5DM6Lk=;
 b=ARSK5q12OMEQPvfOJB6qY0JIqlG4SG9eZUMlpnmtGpzkM3GCNIV624DKF/S43OTaCJb4NC3yeKJxoVUhgzU0G3uf9JXD0g9AjBv2S9W1qNTrGZgbLvc5yrQpEeEEx1e5qyV4D80CwZm/h2cInr05poYQb+HUih4kYifykvy2ric=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH v7 3/7] xen: introduce mark_page_free
Thread-Topic: [PATCH v7 3/7] xen: introduce mark_page_free
Thread-Index: AQHXqjl0kD+LuGbedUe7fBE0DC0ydaul+Iqg
Date: Thu, 16 Sep 2021 03:13:40 +0000
Message-ID:
 <VE1PR08MB5215CABEFC383EFF0DB372FAF7DC9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210910025215.1671073-1-penny.zheng@arm.com>
 <20210910025215.1671073-4-penny.zheng@arm.com>
 <cd1ba586-0613-8e12-97b7-7b4cc2577bb9@suse.com>
In-Reply-To: <cd1ba586-0613-8e12-97b7-7b4cc2577bb9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 61CEAD76E49D694BB20DA70866E1A65E.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 546cd9cb-63a9-4a86-bfcf-08d978c001b7
x-ms-traffictypediagnostic: VI1PR08MB3406:|AM9PR08MB6308:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB63089F0BCD5CA480E6B3A126F7DC9@AM9PR08MB6308.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 i6ZZqFLVUmAlQV46k6+5/hopwAIkcA/+vVET7CdXbT9OmNh3bThoiei3y/pt7x9K8hX8duBEp2uf4w/tLPiXJXa1S/fMlH9wFzXc2SPm91zEXyJAyifgZ1qqhP+r/ZAvD4S9NYDulJ+EafOTScnIvkv1WRxWy67l/au9nETHz653xM/0nzzqmnGulQ3Zm6now4LMSEnislUSJ0xznVRXyd27n5gYh2ib86b4DWMTS/EHiSwINqlS1QKflWp5UkWrw6f0f2zaZAZwIAmuHCbZyg2OtM4/q70zc0PNYsGyDGVnhtJpst4tLc15C1IbYmyUa/76TPdeUYWs4OGiAhr1m+vwKTXwKBLSe2H0L7YKXhWP8NfsH6TuJM3N2ozRQBfjKLSAkJt4biAhAXvZNDxzYrb/WmyXWkfvO1iuJly10c286aHk8qL+oCxu45mCQybDDzNaP/riXfyCTQUWONbW6Xz7PeEQKHyVm1PcTQEISmdFABFrJJs0JUViwnN9VhN85fOkbiqgud2O9Mj/lR8+6oBYQm8eM6g5iQsdRRBmhYR4yMgoTtbTkeiuEm0XVAw/g2lqbZV7R9sUQz5Yl1G4nUC1n6PQPgdKuEe6D3OUFBbYJo/6BH3hNINmscg3NhARwGzGUeeHDSaLswADYl7IJoBfySnDdlxkrX5oo4yfocd3WyEvSaqz6bTJbXhivbSlrvQfFMhwGBYxHBWYljxmlw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(6506007)(52536014)(5660300002)(186003)(9686003)(38100700002)(38070700005)(316002)(6916009)(71200400001)(122000001)(64756008)(7696005)(53546011)(8676002)(66556008)(66476007)(76116006)(4326008)(66946007)(478600001)(86362001)(33656002)(26005)(66446008)(55016002)(83380400001)(54906003)(8936002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3406
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8bdbddf5-6da4-4809-fc74-08d978bffb97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vjqwUfw+2HTc3CtNIIq7acv91/iUoZ2zIMTwtm2hpZguCAFgJIjIn+zfLUbkoLT/lVGcyg2Y8JEs5n8oV8Dpvs8T2ELxQteC3sPkvX4M0Nj7Ui3TPSEjvdSD9RP76/55W3z6a+pmpGJ37TbhuGmAh5ER24HB13jZTpxfeFBe1u8qTE2RwpSWM8AGAwkXtfIto/GGAARxLzv3XtdlHC5nn2o6tj/NyrUQttJLTDN6igQCTczoEHIlH6xLa+XG+j4aMnynwsalNFNkUuwB2HV+iAchp2agBjFQ+hGI7MWQkkLh4tdSPhG8sGKGi4Ysa/KFXTLDLKs2uApiM1qk4vT4mv9/bz3R7Df8kuddDWQJ4aEkAofP8o6wIaAxU6gBVJxPmrC8D6wmGajN3t/tW0SWh5+GTk6PmY/fyL2rh/izuVX4IeDfyHe5Q2ELnXeYqd1NTKwp0tXWa+qcrn8odcrsW9GD7J10npGXa6elX6y71mw2tqa9UnMss+4rB7RObX9kNLz1wUHxoW7GpQ4XvJjB8k4WheqbvvcbEvTbNFnQSaoNiDHfpBi/o8RkpjUN1kFzOZGFN517neGvt3YCWh6axis1/P8Qjkm0j+zE0CCfYmp/U0+VdWWeKm9Hen41eS8KYsl0cmYzymYH4V2sRbCvyOgsTLwuk1V5yqDdBIYfEypmjpewzIXk9Aimi6wyt6zUI0PAx/1SQkQOULPUi+k5BA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(82740400003)(54906003)(70206006)(26005)(52536014)(86362001)(4326008)(70586007)(7696005)(316002)(5660300002)(336012)(8676002)(186003)(6506007)(53546011)(9686003)(83380400001)(47076005)(356005)(81166007)(82310400003)(36860700001)(478600001)(2906002)(8936002)(6862004)(55016002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 03:13:50.6159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 546cd9cb-63a9-4a86-bfcf-08d978c001b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6308

SGkgSmFuDQoNClNvcnJ5IGZvciB0aGUgYnJva2VuLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTUsIDIwMjEgOTo1NiBQTQ0KPiBUbzogUGVubnkgWmhlbmcg
PFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5N
YXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8V2VpLkNoZW5AYXJtLmNvbT47IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVu
QHhlbi5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyAzLzddIHhlbjogaW50cm9kdWNlIG1h
cmtfcGFnZV9mcmVlDQo+IA0KPiBPbiAxMC4wOS4yMDIxIDA0OjUyLCBQZW5ueSBaaGVuZyB3cm90
ZToNCj4gPiBUaGlzIGNvbW1pdCBkZWZpbmVzIGEgbmV3IGhlbHBlciBtYXJrX3BhZ2VfZnJlZSB0
byBleHRyYWN0IGNvbW1vbg0KPiA+IGNvZGUsIGxpa2UgZm9sbG93aW5nIHRoZSBzYW1lIGNhY2hl
L1RMQiBjb2hlcmVuY3kgcG9saWN5LCBiZXR3ZWVuDQo+ID4gZnJlZV9oZWFwX3BhZ2VzIGFuZCB0
aGUgbmV3IGZ1bmN0aW9uIGZyZWVfc3RhdGljbWVtX3BhZ2VzLCB3aGljaCB3aWxsIGJlDQo+IGlu
dHJvZHVjZWQgbGF0ZXIuDQo+ID4NCj4gPiBUaGUgUERYIGNvbXByZXNzaW9uIG1ha2VzIHRoYXQg
Y29udmVyc2lvbiBiZXR3ZWVuIHRoZSBNRk4gYW5kIHRoZSBwYWdlDQo+ID4gY2FuIGJlIHBvdGVu
dGlhbGx5IG5vbi10cml2aWFsLiBBcyB0aGUgZnVuY3Rpb24gaXMgaW50ZXJuYWwsIHBhc3MgdGhl
DQo+ID4gTUZOIGFuZCB0aGUgcGFnZS4gVGhleSBhcmUgYm90aCBleHBlY3RlZCB0byBtYXRjaC4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29t
Pg0KPiA+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4gUmV2
aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+ID4gLS0tDQo+ID4g
IHhlbi9jb21tb24vcGFnZV9hbGxvYy5jIHwgODkNCj4gPiArKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygr
KSwgNDEgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdl
X2FsbG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBpbmRleA0KPiA+IDk1OGJhMGNkOTIu
LmEzZWU1ZWNhOWUgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4g
PiArKysgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+IEBAIC0xMzc2LDYgKzEzNzYsNTMg
QEAgYm9vbCBzY3J1Yl9mcmVlX3BhZ2VzKHZvaWQpDQo+ID4gICAgICByZXR1cm4gbm9kZV90b19z
Y3J1YihmYWxzZSkgIT0gTlVNQV9OT19OT0RFOyAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIG1h
cmtfcGFnZV9mcmVlKHN0cnVjdCBwYWdlX2luZm8gKnBnLCBtZm5fdCBtZm4pIHsNCj4gPiArICAg
IEFTU0VSVChtZm5feChtZm4pID09IG1mbl94KHBhZ2VfdG9fbWZuKHBnKSkpOw0KPiA+ICsNCj4g
PiArICAgIC8qDQo+ID4gKyAgICAgKiBDYW5ub3QgYXNzdW1lIHRoYXQgY291bnRfaW5mbyA9PSAw
LCBhcyB0aGVyZSBhcmUgc29tZSBjb3JuZXIgY2FzZXMNCj4gPiArICAgICAqIHdoZXJlIGl0IGlz
bid0IHRoZSBjYXNlIGFuZCB5ZXQgaXQgaXNuJ3QgYSBidWc6DQo+ID4gKyAgICAgKiAgMS4gcGFn
ZV9nZXRfb3duZXIoKSBpcyBOVUxMDQo+ID4gKyAgICAgKiAgMi4gcGFnZV9nZXRfb3duZXIoKSBp
cyBhIGRvbWFpbiB0aGF0IHdhcyBuZXZlciBhY2Nlc3NpYmxlIGJ5DQo+ID4gKyAgICAgKiAgICAg
aXRzIGRvbWlkIChlLmcuLCBmYWlsZWQgdG8gZnVsbHkgY29uc3RydWN0IHRoZSBkb21haW4pLg0K
PiA+ICsgICAgICogIDMuIHBhZ2Ugd2FzIG5ldmVyIGFkZHJlc3NhYmxlIGJ5IHRoZSBndWVzdCAo
ZS5nLiwgaXQncyBhbg0KPiA+ICsgICAgICogICAgIGF1dG8tdHJhbnNsYXRlLXBoeXNtYXAgZ3Vl
c3QgYW5kIHRoZSBwYWdlIHdhcyBuZXZlciBpbmNsdWRlZA0KPiA+ICsgICAgICogICAgIGluIGl0
cyBwc2V1ZG9waHlzaWNhbCBhZGRyZXNzIHNwYWNlKS4NCj4gPiArICAgICAqIEluIGFsbCB0aGUg
YWJvdmUgY2FzZXMgdGhlcmUgY2FuIGJlIG5vIGd1ZXN0IG1hcHBpbmdzIG9mIHRoaXMgcGFnZS4N
Cj4gPiArICAgICAqLw0KPiA+ICsgICAgc3dpdGNoICggcGctPmNvdW50X2luZm8gJiBQR0Nfc3Rh
dGUgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgY2FzZSBQR0Nfc3RhdGVfaW51c2U6DQo+ID4gKyAg
ICAgICAgQlVHX09OKHBnLT5jb3VudF9pbmZvICYgUEdDX2Jyb2tlbik7DQo+ID4gKyAgICAgICAg
cGctPmNvdW50X2luZm8gPSBQR0Nfc3RhdGVfZnJlZTsNCj4gPiArICAgICAgICBicmVhazsNCj4g
PiArDQo+ID4gKyAgICBjYXNlIFBHQ19zdGF0ZV9vZmZsaW5pbmc6DQo+ID4gKyAgICAgICAgcGct
PmNvdW50X2luZm8gPSAocGctPmNvdW50X2luZm8gJiBQR0NfYnJva2VuKSB8DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICBQR0Nfc3RhdGVfb2ZmbGluZWQ7DQo+ID4gKyAgICAgICAgdGFp
bnRlZCA9IDE7DQo+IA0KPiBZb3UndmUgYnJva2VuIHR3byB0aGluZ3MgYXQgdGhlIHNhbWUgdGlt
ZSBoZXJlOiBZb3Ugd3JpdGUgdG8gdGhlIGdsb2JhbA0KPiB2YXJpYWJsZSBvZiB0aGlzIG5hbWUg
bm93LCB3aGlsZSAuLi4NCj4gDQo+ID4gQEAgLTEzOTIsNDcgKzE0MzksNyBAQCBzdGF0aWMgdm9p
ZCBmcmVlX2hlYXBfcGFnZXMoDQo+ID4NCj4gPiAgICAgIGZvciAoIGkgPSAwOyBpIDwgKDEgPDwg
b3JkZXIpOyBpKysgKQ0KPiA+ICAgICAgew0KPiA+IC0gICAgICAgIC8qDQo+ID4gLSAgICAgICAg
ICogQ2Fubm90IGFzc3VtZSB0aGF0IGNvdW50X2luZm8gPT0gMCwgYXMgdGhlcmUgYXJlIHNvbWUg
Y29ybmVyIGNhc2VzDQo+ID4gLSAgICAgICAgICogd2hlcmUgaXQgaXNuJ3QgdGhlIGNhc2UgYW5k
IHlldCBpdCBpc24ndCBhIGJ1ZzoNCj4gPiAtICAgICAgICAgKiAgMS4gcGFnZV9nZXRfb3duZXIo
KSBpcyBOVUxMDQo+ID4gLSAgICAgICAgICogIDIuIHBhZ2VfZ2V0X293bmVyKCkgaXMgYSBkb21h
aW4gdGhhdCB3YXMgbmV2ZXIgYWNjZXNzaWJsZSBieQ0KPiA+IC0gICAgICAgICAqICAgICBpdHMg
ZG9taWQgKGUuZy4sIGZhaWxlZCB0byBmdWxseSBjb25zdHJ1Y3QgdGhlIGRvbWFpbikuDQo+ID4g
LSAgICAgICAgICogIDMuIHBhZ2Ugd2FzIG5ldmVyIGFkZHJlc3NhYmxlIGJ5IHRoZSBndWVzdCAo
ZS5nLiwgaXQncyBhbg0KPiA+IC0gICAgICAgICAqICAgICBhdXRvLXRyYW5zbGF0ZS1waHlzbWFw
IGd1ZXN0IGFuZCB0aGUgcGFnZSB3YXMgbmV2ZXIgaW5jbHVkZWQNCj4gPiAtICAgICAgICAgKiAg
ICAgaW4gaXRzIHBzZXVkb3BoeXNpY2FsIGFkZHJlc3Mgc3BhY2UpLg0KPiA+IC0gICAgICAgICAq
IEluIGFsbCB0aGUgYWJvdmUgY2FzZXMgdGhlcmUgY2FuIGJlIG5vIGd1ZXN0IG1hcHBpbmdzIG9m
IHRoaXMgcGFnZS4NCj4gPiAtICAgICAgICAgKi8NCj4gPiAtICAgICAgICBzd2l0Y2ggKCBwZ1tp
XS5jb3VudF9pbmZvICYgUEdDX3N0YXRlICkNCj4gPiAtICAgICAgICB7DQo+ID4gLSAgICAgICAg
Y2FzZSBQR0Nfc3RhdGVfaW51c2U6DQo+ID4gLSAgICAgICAgICAgIEJVR19PTihwZ1tpXS5jb3Vu
dF9pbmZvICYgUEdDX2Jyb2tlbik7DQo+ID4gLSAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8g
PSBQR0Nfc3RhdGVfZnJlZTsNCj4gPiAtICAgICAgICAgICAgYnJlYWs7DQo+ID4gLQ0KPiA+IC0g
ICAgICAgIGNhc2UgUEdDX3N0YXRlX29mZmxpbmluZzoNCj4gPiAtICAgICAgICAgICAgcGdbaV0u
Y291bnRfaW5mbyA9IChwZ1tpXS5jb3VudF9pbmZvICYgUEdDX2Jyb2tlbikgfA0KPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgUEdDX3N0YXRlX29mZmxpbmVkOw0KPiA+IC0gICAg
ICAgICAgICB0YWludGVkID0gMTsNCj4gDQo+IC4uLiB0aGUgbG9jYWwgdmFyaWFibGUgaGVyZSBk
b2Vzbid0IGdldCB3cml0dGVuIGFueW1vcmUuIFdoaWNoIENvdmVyaXR5IHdhcw0KPiBraW5kIGVu
b3VnaCB0byBwb2ludCBvdXQgLSBwbGVhc2UgcmVmZXJlbmNlIENvdmVyaXR5IElEIDE0OTE4NzIg
aW4gdGhlIGZpeCB0aGF0DQo+IEkgaG9wZSB5b3Ugd2lsbCBiZSBhYmxlIHRvIHByb3ZpZGUgcXVp
Y2tseS4gKFRoZSBlYXNpZXN0IGNoYW5nZSB3b3VsZCBzZWVtIHRvDQo+IGJlIHRvIG1ha2UgbWFy
a19wYWdlX2ZyZWUoKSByZXR1cm4gYm9vbCwgYW5kIHNldCAidGFpbnRlZCIgdG8gMSBoZXJlDQo+
IGFjY29yZGluZ2x5LikNCj4gDQoNClN1cmUuIEknbGwgZml4IGl0IHRvZGF5IGFuZCBsZXQgbWFy
a19wYWdlX2ZyZWUoKSByZXR1cm4gdGhlIHN0YXR1cyBvZiAidGFpbnRlZCIuDQoNCj4gSSB1bmRl
cnN0YW5kIHRoYXQgdGhlIHR3byB2YXJpYWJsZXMgaGF2aW5nIHRoZSBzYW1lIG5hbWUgaXNuJ3Qg
dmVyeSBoZWxwZnVsLiBJDQo+IGNlcnRhaW5seSB3b3VsZG4ndCBtaW5kIGlmIHlvdSByZW5hbWVk
IHRoZSBsb2NhbCBvbmUgc3VpdGFibHkuDQo+IA0KDQpJJ2xsIHJlbmFtZSB0aGUgbG9jYWwgb25l
IHRvICJwZ190YWludGVkIiB0byB0ZWxsIHRoZSBkaWZmZXJlbmNlLg0KDQo+IEphbg0KDQpQZW5u
eQ0K

