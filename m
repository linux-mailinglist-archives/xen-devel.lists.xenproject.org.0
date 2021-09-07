Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9D54024DC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180558.327273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNW76-0000Dn-GD; Tue, 07 Sep 2021 08:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180558.327273; Tue, 07 Sep 2021 08:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNW76-0000B3-Ci; Tue, 07 Sep 2021 08:05:52 +0000
Received: by outflank-mailman (input) for mailman id 180558;
 Tue, 07 Sep 2021 08:05:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0UdZ=N5=arm.com=Hongda.Deng@srs-us1.protection.inumbo.net>)
 id 1mNW75-0000Av-7L
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:05:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::619])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 292e35d6-c6f2-425d-8dec-2a84e5adcba3;
 Tue, 07 Sep 2021 08:05:48 +0000 (UTC)
Received: from DB6PR07CA0175.eurprd07.prod.outlook.com (2603:10a6:6:43::29) by
 AM9PR08MB5985.eurprd08.prod.outlook.com (2603:10a6:20b:286::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17; Tue, 7 Sep 2021 08:05:46 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::fa) by DB6PR07CA0175.outlook.office365.com
 (2603:10a6:6:43::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.6 via Frontend
 Transport; Tue, 7 Sep 2021 08:05:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 08:05:46 +0000
Received: ("Tessian outbound 610b9df843d5:v105");
 Tue, 07 Sep 2021 08:05:46 +0000
Received: from 66fdde6d019e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E15A6A9-9FC5-49EC-A7C7-AC7D04436CE8.1; 
 Tue, 07 Sep 2021 08:05:39 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 66fdde6d019e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 08:05:39 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com (2603:10a6:800:1ab::17)
 by VI1PR08MB4190.eurprd08.prod.outlook.com (2603:10a6:803:eb::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 7 Sep
 2021 08:05:33 +0000
Received: from VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::d810:52a3:dce3:4d06]) by VE1PR08MB5677.eurprd08.prod.outlook.com
 ([fe80::d810:52a3:dce3:4d06%5]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 08:05:33 +0000
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
X-Inumbo-ID: 292e35d6-c6f2-425d-8dec-2a84e5adcba3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QV8b/SNLW0Tjhqdk11/RrqSAJCoIZ01fAAKzO7ivC+4=;
 b=Llu9plT9+lgVEzSlrojJUGwGwaI5QRZTkxTJkfoa5QbN7uDYqNCTDhA5FJGLLIOU4suO0j5cns+va0KmqeoXF90Nj0GNmT/rDr5RNjw/17jhtagamC5Km6j0AQ7zlCdff7B4JGJL3CxHKNpypPGhhgGmEbrhfjeEcwL6NXVt6qc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMRYR7P8r53exVm7qnHJMIZp3PJQPhNaNQCa9oxXrU0CaR8ohsxdtewRTm2WKt6vnJRCYTXMDBJcws7KK8k9eKGzH2xys34utm2CDCYuFWWt7NXyGgyGYm+Gaqagx3451yTe4qoOG2086NbAtl343OLEPmz2dWuXRtNkbd50HSh3FKlv6nJ+D7I2543PUVKMsuAEcVUInLep3mChy0jSQk2LmcAKI3BIQzAdlAmFa+vDKi3kplYZHmba3/b2HVx/hUnqj6FNW9FkePmT2j6/sOPiF7ODnlgdqNnreQuUndr8tN6DTa/zQ7h0LdopXH5jWDSG0qMkSFqCiVQhh5p0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=QV8b/SNLW0Tjhqdk11/RrqSAJCoIZ01fAAKzO7ivC+4=;
 b=PDxu0c5eqWgrZuvPAVWn4NdCZ6ytlBPiZKsOTxlz3sY4aMxwNXW7nZuzbkhhgMoEX05SnguB7b0zFG27MrS1rF9yiLcgIxURQTe1/gG3Gu3faCT2pNdEoK+20U1e29h55CdW+T9k1X6rShGxHrDDdcinL1WmCu/jJsyzdSST4KvUGYVHCRH6uGNSQuzdeOsWoT6GfLUF+7Ljh8y4E4dFgbB7f7/bR7RbO5//FfrUoMIBEHkOo+IHXbwTIQTh295zc2hcU3SuU7b3aSFpP5mxLLG3AR54LaeQCdKAEd6kVRKwRIS80SfQ/UE+52bNADmBG/3aAIMMeyPthfeI2aZA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QV8b/SNLW0Tjhqdk11/RrqSAJCoIZ01fAAKzO7ivC+4=;
 b=Llu9plT9+lgVEzSlrojJUGwGwaI5QRZTkxTJkfoa5QbN7uDYqNCTDhA5FJGLLIOU4suO0j5cns+va0KmqeoXF90Nj0GNmT/rDr5RNjw/17jhtagamC5Km6j0AQ7zlCdff7B4JGJL3CxHKNpypPGhhgGmEbrhfjeEcwL6NXVt6qc=
From: Hongda Deng <Hongda.Deng@arm.com>
To: Julien Grall <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, nd <nd@arm.com>
Subject: RE: About Arm guests accessing to GICD_ICPENR
Thread-Topic: About Arm guests accessing to GICD_ICPENR
Thread-Index: AdejvyF8C7fiPQEXRRSQQzNI/V0p1g==
Date: Tue, 7 Sep 2021 08:05:33 +0000
Message-ID:
 <VE1PR08MB567729BD416FCCD32FCBD6CCE6D39@VE1PR08MB5677.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3A117852C6EAA740B0A5374012329AE5.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fbca13c2-b529-4a44-5c46-08d971d64c2f
x-ms-traffictypediagnostic: VI1PR08MB4190:|AM9PR08MB5985:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB5985AC5CE5FE087D546D2F96E6D39@AM9PR08MB5985.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NYCTz5HY7d7u6eKzrsty7ns6ESFZArVEhYi4/34rmo7sWqQPaPlvdFExUqajvAcQwVT9B4Q+mNegtD0TtJ9VQn/OeAdNsB+ZHQyJdw4EPUT05qhd1ShGsYCvSmgUqeJA67c4gbnUk1QZDRPb8FFAuJratTkWyp2qIV1Pc/tIYOTonDf/b7+xl6ytM6EWaJqaS5oytedaOL+0KiM2LEGoazkmWndSHOkGyLsxUZgsc4cnMsYwv/7bueXuZKVSnR8QqKkgKrTU9GXSxNGTWvFowjbaimINtF+ARmgVyLK0ZQGLRIvn0lyrlJC5umivqRA48z4m3v9TMROXxHV5VInhsdOIq/OdEVjttD4Au1ywC2N5A3OHrhDh+2JPbO4nSm+1lTa/8K7z0dySzzI4TUzaR5Hz7owMxRQsa/BWbfENyFa4RpAYgzWhr2JRdvv+CM7Px+LimO9UApTrX+NTFgbtURUtrusJYdYpEPSIVio3FXw6jQhhAB9Ometgnz9q9YFNRTMJaIMUkG+WdtAuTqB8ZQbvV96OkOORDRBLk8FoDzsqJMQX2DaebJXpseM38Km/0wW2qCVUGtq6rjn0vu9W8kIJ474Zdn6KNRLTpdUBojj3GxHlRAb4WNdEydwzfkpMY4FazGSa9ubW9u3MgqEVp9KXuYMG+hC5fXAKa4Euzk50conuNqyzgy7mqm0drE57xJGdRrckd6eYHu864aYH9AEzxnosKiSh8iYPPgQNhFWu1gX+MFlC/dGG9P6xjulXDqKuV483cu3i2iQ/taOaBGdeMz6rBnx2+Hin3GQU/S4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5677.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(52536014)(66446008)(66556008)(66476007)(5660300002)(66946007)(33656002)(64756008)(122000001)(76116006)(38100700002)(7696005)(478600001)(2906002)(186003)(8676002)(26005)(83380400001)(54906003)(316002)(8936002)(38070700005)(55016002)(86362001)(71200400001)(4326008)(966005)(110136005)(6506007)(9686003)(53546011);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4190
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da997a58-c9b1-4fa1-10a5-08d971d64480
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NjFyaEp0ZKDtV0TSlR54FyaOyuysWTsrLU8k2m1exzMsxeoZEtZ3/2Be6Ku7IWQfavD7rinXN0JYtmZ3ydyIRefL5Dw1jJ0b9A+kI3eQIzxGoqrk8bQszfZl8x0p2Dc4oDYQp4mornSQmmqQcnU8YmLhssLzTq6t1RIGu1Ary5qztpUk0DyE/OLD4AW7yVSP+ycV48aF6GOCL0f6j64zZgxwUmvk6PQ4x8iI5tQvkWupVTod8sGxdmN3st/mMRYrRVEnKo5EruqSmO/GkPMj2N3vn1jiZTNwl2iAyv5xgN3a7PxcuG8InwavqCEVwbSSYh1dZSWBrCnPZj7ZU3C2zKCedJQN7hnlejF5Oi2VNCOkiCkxhzZG4LTOn39X550P/6QSaknbG2VIBDGhwMf1HMhiwfHLOS9KFqlGORZzGIArxrx7uP+aAN5o9AV7r5xd32ZoNNM5OFdx2t5nPUduqlWk/B61/QHR7VhvFiaynNLLVZF6cHBVErU6fdwdKePYafYkohT05f/M9rc/1hB8CiuG/ds1MFdJVHowdRU7ED1xlBORr3MOaQGy0avLmqc9AhWMvvMMLwgxgKyNFU0gKAbi2sRbOwF47Pu39Bk/ddgWs4GfmVW1xxybTwo+LwYatnDhZq1Gs86AB3xluNL6h2Krr7UIvf3fP8OY+e9sLy8l9qlBueWnqFbVpAJSijXAl3fUAuireIkXmH77Jr//NQitmICsXTtexs5on2DqK/FDNDFgcUaB9Ksnc/nA4ZJOvBXMlsHmU8AxTH8ZVK85zr36/dkAZBa4vt7rFN/I7z4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(136003)(396003)(46966006)(36840700001)(7696005)(82740400003)(52536014)(82310400003)(8676002)(47076005)(54906003)(33656002)(53546011)(6506007)(81166007)(336012)(356005)(5660300002)(36860700001)(70206006)(83380400001)(2906002)(110136005)(9686003)(966005)(316002)(26005)(186003)(86362001)(4326008)(55016002)(478600001)(8936002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 08:05:46.4678
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbca13c2-b529-4a44-5c46-08d971d64c2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5985

SGkgSnVsaWVuLA0KDQo+IE9uIDA2LzA5LzIwMjEgMTA6MDQsIEhvbmdkYSBEZW5nIHdyb3RlOg0K
PiA+IEhpIEp1bGllbiwNCj4gDQo+IEhpIEhvbmdkYSwNCj4gDQo+ID4gWGVuIHByb3ZpZGVzIHZH
SUMgdG8gc3VwcG9ydCBYZW4gZ3Vlc3RzLCBhbmQgY3VycmVudGx5IHhlbiB3aWxsIHJldHVybiBJ
Tw0KPiA+IHVuaGFuZGxlZCB3aGVuIGd1ZXN0cyBhY2Nlc3MgR0lDRCBJQ1BFTlJuIHJlZ2lzdGVy
cy4gVGhpcyB3b3JrcyBmaW5lIHdpdGgNCj4gTGludXgNCj4gPiBndWVzdHMsIGZvciBMaW51eCB3
b24ndCBhY2Nlc3MgdGhlc2UgcmVnaXN0ZXJzLiBCdXQgZm9yIFplcGh5ciwgdGhpcyBtZWNoYW5p
c20NCj4gPiB3aWxsIGNhdXNlIElPIGRhdGFhYm9ydCBvbiBaZXBoeXIncyBpbml0aWFsaXphdGlv
biB3aGljaCBtYWtlcyBaZXBoeXIgZ2V0IGluDQo+ID4gZmF0YWwgZXJyb3IuDQo+ID4NCj4gPiBP
bmUgbWV0aG9kIHRvIGVhc2UgdGhpcyBpcyB0byBsZXQgdkdJQyBpZ25vcmUgR0lDRCBJQ1BFTlJu
IHJlZ2lzdGVycyBhY2Nlc3MuIEkNCj4gPiB0ZXN0ZWQgaXQgd2l0aCBMaW51eCBndWVzdHMgYW5k
IFplcGh5ciBndWVzdHMsIGFuZCBib3RoIHdvcmtzIGZpbmUuIEFuZCBJIGZvdW5kDQo+ID4gaW4g
dGhpcyBwYXRjaFsxXSB0aGF0IGl0IHdvdWxkIGJlIG1vcmUgY29tcGxleCB0byB0b3VjaCB0aGUg
cmVhZCBwYXJ0IGZvcg0KPiA+IEl7UyxDfVBFTkRSIGFuZCB0aGUgd3JpdGUgcGFydCBmb3IgSUNQ
RU5EUiwNCj4gDQo+IFJlYWQgdG8gSXtTLEN9UEVORFIgc2hvdWxkIGFscmVhZHkgcmV0dXJuLiBB
RkFJSywgd2hhdCdzIGxlZnQNCj4gdW5pbXBsZW1lbnRlZCBpcyB3cml0ZSB0byBJQ1BFTkRSLg0K
PiANCj4gPiBzbyBjb3VsZCB3ZSBpZ25vcmUgR0lDRCBJQ1BFTkRSbg0KPiA+IHJlZ2lzdGVycyBh
Y2Nlc3MgdG8gZWFzZSBaZXBoeXIncyBpbml0aWFsaXphdGlvbiBwcm9ibGVtPw0KPiBXb3VsZCB5
b3UgYmUgYWJsZSB0byBwcm92aWRlIG1vcmUgaW5mb3JtYXRpb24gb24gaG93IFplcGh5ciBpcyB1
c2luZyBpdD8NCg0KWmVwaHlyIHdpbGwgdHJ5IHRvIGNsZWFyIHBlbmRpbmcgc3RhdGUgYXQgaXRz
IGluaXRpYWxpemF0aW9uLCBhbmQgdGhlIGNvZGUgY2FuIGJlDQpmb3VuZCBoZXJlWzFdLg0KDQo+
IA0KPiA+DQo+ID4gSWYgWGVuIHdhbnRzIGEgY29tcGxldGUgR0lDRCBJQ1BFTkRSbiBlbXVsYXRp
b24gdG8gZml4IGl0LCBkbyB5b3UgaGF2ZSBhbnkNCj4gPiBzdWdnZXN0aW9ucy4NCj4gDQo+IEVt
dWxhdGluZyBJQ1BFTkRSIGlzIG5vdCBlYXN5IHdpdGggdGhlIGV4aXN0aW5nIHZHSUMuIEl0IHdv
dWxkIGJlIGdyZWF0DQo+IHRvIGZpbmFsbHkgaGF2ZSBhIHZHSUMgc3BlYyBjb21wbGlhbnQsIGJ1
dCBJIGFsc28gYXBwcmVjaWF0ZSB0aGlzIGlzDQo+IGdvaW5nIHRvIHRha2Ugc29tZSB0aW1lLg0K
DQpZZXMsIEkgYWdyZWUgd2l0aCB0aGF0Lg0KDQo+IA0KPiBJZ25vcmluZyB0aGUgYWNjZXNzIGlz
IHByb2JhYmx5IHRoZSBiZXN0IHdlIGNhbiBkby4gSG93ZXZlciwgdGhpcyBpcw0KPiBhbHNvIGEg
cmlza3kgYXBwcm9hY2ggYmVjYXVzZSBaZXBoeXIgKG9yIGFub3RoZXIgT1MpIG1heSBnZW51aW5l
bHkgd2FudA0KPiB0byBjbGVhciBhbiBhbHJlYWR5IHBlbmRpbmcgaW50ZXJydXB0LiBTbyBJIHdv
dWxkIHN1Z2dlc3QgdG8gd2FsayB0aGUNCj4gaW50ZXJydXB0cyB0aGF0IGFyZSBtZWFudCB0byBi
ZSBtb2RpZmllZCBhbmQgY2hlY2sgd2hldGhlciB0aGV5IGFyZQ0KPiBhbHJlYWR5IHBlbmRpbmcu
IElmIHRoZXkgYXJlIHRoZW4gcHJpbnQgYSBtZXNzYWdlLg0KDQpPSywgSSB3b3VsZCBhZGQgdGhp
cyBjaGVjayBhbmQgd2FybmluZyBtZXNzYWdlIHRvIG15IGN1cnJlbnQgcGF0Y2ggdG8gZml4IGl0
IA0KaW4gY3VycmVudCBzdGFnZS4gSXMgaXQgT0s/DQoNCj4gDQo+IFRoaXMgd291bGQgbWFrZSBj
bGVhciB0byB0aGUgZGV2ZWxvcHBlciB0aGF0IHNvbWV0aGluZyBtYXkgZ28gd3JvbmcNCj4gbGF0
ZXIgb24uDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg0KWzFdIGh0
dHBzOi8vZ2l0aHViLmNvbS96ZXBoeXJwcm9qZWN0LXJ0b3MvemVwaHlyL2Jsb2IvZWFmNmNmNzQ1
ZGYzODA3ZTZlDQpjYzk0MWMzYTMwZGU2YzE3OWFlMzU5L2RyaXZlcnMvaW50ZXJydXB0X2NvbnRy
b2xsZXIvaW50Y19naWN2My5jI0wyNzQNCg0KQ2hlZXJzDQpIb25nZGENCg0K

