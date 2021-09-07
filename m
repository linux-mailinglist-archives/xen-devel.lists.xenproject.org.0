Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5940E40226A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 05:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180335.326938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNRYH-0002IK-FC; Tue, 07 Sep 2021 03:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180335.326938; Tue, 07 Sep 2021 03:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNRYH-0002Fi-Bn; Tue, 07 Sep 2021 03:13:37 +0000
Received: by outflank-mailman (input) for mailman id 180335;
 Tue, 07 Sep 2021 03:13:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GNGS=N5=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNRYF-0002Fc-R4
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 03:13:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 645f2ba7-1609-4ee8-a0f3-771b2d8469d7;
 Tue, 07 Sep 2021 03:13:33 +0000 (UTC)
Received: from DB6PR07CA0172.eurprd07.prod.outlook.com (2603:10a6:6:43::26) by
 AS8PR08MB7208.eurprd08.prod.outlook.com (2603:10a6:20b:407::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.24; Tue, 7 Sep 2021 03:13:24 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::f3) by DB6PR07CA0172.outlook.office365.com
 (2603:10a6:6:43::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.4 via Frontend
 Transport; Tue, 7 Sep 2021 03:13:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 03:13:23 +0000
Received: ("Tessian outbound 0ec886cb54dd:v105");
 Tue, 07 Sep 2021 03:13:23 +0000
Received: from c3af3d769bd7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3890B58-DDC9-4EF5-BA66-F6A0E8520F84.1; 
 Tue, 07 Sep 2021 03:13:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3af3d769bd7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 03:13:17 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4173.eurprd08.prod.outlook.com (2603:10a6:803:e8::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 03:13:14 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 03:13:14 +0000
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
X-Inumbo-ID: 645f2ba7-1609-4ee8-a0f3-771b2d8469d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxQnPRoj1/mbk5l4OOqDbjtc4ZfJJmMN5bdSpP8ux2w=;
 b=mx3dccJz0S3p5NwVMRCoJgfTlYTReqEs2VH3mvim4M52de1ZicpyaH6BwWKpN96xwekh7+LsnLh3ewrXt2HPVfqVlL/sR6RuzkuhIiEZ7V5ylt3gRDwrCqZdNJGFdPYsQ8RHNaVhxcljePXH8OwO0K6I3NTXFENFYt4fumaHlxw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qk3BT03R+YajOifu6FCKdkdAwUkp6Ps9ohAHZHW9PWOUmh0arMmP0EI+JMIfBlcIPiNDh9fJqVXrGA0DmG9C5UIi3PJzIeJk61qetZihonRaHOm/ghMwhb4LCMvxLrDMtkrlbrwqmq4PoeFNdniCzxY5KmPmQPcBFZDoIzCe2qHcE8ijDG0EjDqFVTnbiCfrp1Hq5zAOi/gXoX2Gr2vQlPTe6wy53gJOFRx6/DFG39CoQPklp7Bc2T9sGpRj2ZvmtDvCOuBSw41MfNWWtp/mFxqQ8L9UYir2J83EhGZpmuqbbilsyMDsGbTzlROFwpsYCm835jEdAlOoiFPWNB4xqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GxQnPRoj1/mbk5l4OOqDbjtc4ZfJJmMN5bdSpP8ux2w=;
 b=DTcW97IKgjYtuOeaojgbAEx+p49de08d/hfSb5rDtu8r/GruDrbPxfFdB1T9E8eM3st3s5ynTDwg3NYSa55lgbNGtFLWki4jzCogMQA9Hs+5ts3/0876Vho66CCHB1D6VwExAW9b9cD6bac4XVwWo2PSsQMrPZF2YJAZyEOs4pQzLeoMfJG5hBcJHLXXfFiWBvUV7O4/W67oIcY8psE3LatYhdszyfqAB64lgm5SFPDP0Kvh8wrD+dlJm//e2zmktdY1dW1hmT1bdJw5wFZxIPww1gActOnXkLNLQdvi2Cs5hVgVpPFeEkolyJPB+0S2ygCIR84Cu5EHg32/BNURjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxQnPRoj1/mbk5l4OOqDbjtc4ZfJJmMN5bdSpP8ux2w=;
 b=mx3dccJz0S3p5NwVMRCoJgfTlYTReqEs2VH3mvim4M52de1ZicpyaH6BwWKpN96xwekh7+LsnLh3ewrXt2HPVfqVlL/sR6RuzkuhIiEZ7V5ylt3gRDwrCqZdNJGFdPYsQ8RHNaVhxcljePXH8OwO0K6I3NTXFENFYt4fumaHlxw=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, nd
	<nd@arm.com>
Subject: RE: [PATCH v5 7/7] xen/arm: introduce allocate_static_memory
Thread-Topic: [PATCH v5 7/7] xen/arm: introduce allocate_static_memory
Thread-Index: AQHXmM2d1FH9kUvkk0y8p4F7V64vPKuRUpWAgAAJw4CAACpGgIAAdgUAgAX8taA=
Date: Tue, 7 Sep 2021 03:13:13 +0000
Message-ID:
 <VE1PR08MB52157E2C65AF90195F4E1516F7D39@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
 <20210824095045.2281500-8-penny.zheng@arm.com>
 <alpine.DEB.2.21.2109021352020.26072@sstabellini-ThinkPad-T480s>
 <ac3a9fbd-7598-e400-6c6c-1214df7acee7@xen.org>
 <alpine.DEB.2.21.2109021527330.26072@sstabellini-ThinkPad-T480s>
 <034628a6-5461-f4a9-3339-a0d6f3d68f80@xen.org>
In-Reply-To: <034628a6-5461-f4a9-3339-a0d6f3d68f80@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 3844190897E13D46905699D8AF8D48F0.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a7ca33b8-1ad3-4261-9ca9-08d971ad73ce
x-ms-traffictypediagnostic: VI1PR08MB4173:|AS8PR08MB7208:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB720835F6469E2658B9D8CE8EF7D39@AS8PR08MB7208.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GGYtz82v59GjVWRW1s3hlQz39B/+tL559MfJVajg2c61fNqmcMFZ+h7VHxkFb+YS6lkx8NuSiDL4a7QcHDI24nEEHt3Dou0pbnnzJVqlseByrTHf4PQqSHqI8wJ0XXSgNyGhilNikSHbs8hhOmJCFQzFUpEjfz88jfAMgvmKeGqBcmQq0s/qpoc/JFNepfzkw9xSawfPPwT3QrKhVujfEMIkCzpTZkC8ct1YVVz+tv1yB76qg7rEDNAgwrVkeZWgPVCPLKxU4+cpR3wQIOgrmQei8WG/ErDfi+PCAgQBrlR5NOVk2i/67L0tUYWswnI7CXbjLgmiMddqKhEdUNNDb2paxKgoVJEsgrwuExba0PFbo78nggPBfhLxGAdlg6Ouq0rydF+U4LM666JUHd80kY8x0tRnNuSdbyEVeT+dM7dIqPjmLNvtt4936rDVIF4Y3WisFvWrfHdnxgTETUC3zhjXia6uZt1Ct37va5rWOGjjBydZIuxjFsuCk78XviGrui0LRmQheUgWr92P4ZyR/eApz98HYi/hOC7vHH5Km+JlrEzrqRlL3AApUHVKA6Exlu/ySgbkil1xtcZeLnTDal0P2gtoPxOlnV+GBTycsOUp64a4KMhJGoShjrPm/H3hc74799PyM0WCqJh/pLAocr+FiUpK3udt7oL27vsHS/FkOeOJA9gxI0LBkfxuUUoiHG1VbBVHRTHAr0J4PHBgSg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(110136005)(83380400001)(38070700005)(8936002)(9686003)(52536014)(66476007)(76116006)(4326008)(66946007)(478600001)(5660300002)(38100700002)(71200400001)(33656002)(316002)(8676002)(66446008)(66556008)(64756008)(122000001)(26005)(6506007)(54906003)(2906002)(53546011)(186003)(55016002)(7696005)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4173
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7e4c8623-abfa-4512-b479-08d971ad6e47
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CgfayPYRC7LdigTivWMEPAEHbQimkfuCOY4UEQcMqL5tkZlvghb6l+lG/iZMGFfkl0L5kTlVVN2pNIeRP8d+fjfSrZtrZlOWfYoWXoUTJQgyZHMbnFKv0BIHAPyaLoNHVXtL7KqumLsYqC6LrYp1ZUhOgttniZBqykYoJ0jiJcrSaKT7YTMEHjDkXkfVxrthYT0gGvO7W3UkytjrbOPGW7H/TVoGadEFQ8kTw6GqOaeQq0cgFqBsYy0IO6f7BQWsboFwTmVnHPWZ3qJeFI44DxoSuKse14P7QGPwRpRv8cOQF3QN1mvW/p44wBAWNJ4rit+QQGwriUgm9Y6+L1Ni6FNmMxxdozI9Zj10WaK712gBAb1TKNsD9iPvfLX271QeMpBYjLQNN+NKwhJ4BmyHJDR2Pa910pYj2s4khE2rqDOauD+UfPReVhvIyWa0RRmyT3iFL9D/a5V4FB2A+3s5wRRCWgM+TqgUPgZoD1L+aaoy/b5lLQfOIgQC5nrSnnTYx7uJiSaDSuyLhU4V0hB+8sBX9hSGlQiBVXor3yw+4qw1OiDmIpGDxosy75ru5qQTQhKYZj4Xng5bzNxGKGdE7Ybl4UzR73pVLk5E/otTZ9OdOFIu/QeM0X41t5ysUlDs5G3T+3SMRR5Ri6AqJKIvjSc8JjiSPRB1q/pZFohT43fl4uz8nY5ggYOkvZ7t41PcGSSR7E6iuXZqotC5RS8JkQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(356005)(33656002)(110136005)(55016002)(6506007)(70206006)(336012)(86362001)(8676002)(9686003)(26005)(70586007)(54906003)(5660300002)(186003)(8936002)(82740400003)(81166007)(53546011)(83380400001)(4326008)(478600001)(2906002)(82310400003)(52536014)(316002)(36860700001)(47076005)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 03:13:23.5757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ca33b8-1ad3-4261-9ca9-08d971ad73ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7208

SGkgSnVsaWVuIGFuZCBTdGVmYW5vDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogRnJpZGF5LCBTZXB0
ZW1iZXIgMywgMjAyMSAzOjQyIFBNDQo+IFRvOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+DQo+IENjOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gQmVydHJhbmQgTWFycXVpcyA8QmVy
dHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+OyBu
ZCA8bmRAYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSA3LzddIHhlbi9hcm06IGlu
dHJvZHVjZSBhbGxvY2F0ZV9zdGF0aWNfbWVtb3J5DQo+IA0KPiANCj4gDQo+IE9uIDAzLzA5LzIw
MjEgMDE6MzksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gPiBPbiBUaHUsIDIgU2VwIDIw
MjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPj4+PiArICAgIGtpbmZvLT5tZW0ubnJfYmFua3Mg
PSArK2diYW5rOw0KPiA+Pj4+ICsgICAga2luZm8tPnVuYXNzaWduZWRfbWVtIC09IHRvdF9zaXpl
Ow0KPiA+Pj4+ICsgICAgaWYgKCBraW5mby0+dW5hc3NpZ25lZF9tZW0gKQ0KPiA+Pj4+ICsgICAg
ew0KPiA+Pj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSDQo+ID4+Pj4gKyAgICAgICAgICAg
ICAgICJTaXplIG9mIFwibWVtb3J5XCIgcHJvcGVydHkgZG9lc24ndCBtYXRjaCB1cCB3aXRoDQo+
ID4+Pj4gKyB0aGUNCj4gPj4+PiBzdW0tdXAgb2YgXCJ4ZW4sc3RhdGljLW1lbVwiLlxuIik7DQo+
ID4+Pj4gKyAgICAgICAgZ290byBmYWlsOw0KPiA+Pj4NCj4gPj4+IERvIHdlIG5lZWQgdG8gbWFr
ZSB0aGlzIGEgZmF0YWwgZmFpbHVyZT8NCj4gPj4+DQo+ID4+PiBJIGFtIGFza2luZyBiZWNhdXNl
IHVuYXNzaWduZWRfbWVtIGNvbWVzIGZyb20gdGhlICJtZW1vcnkiIHByb3BlcnR5DQo+ID4+PiBv
ZiB0aGUgZG9tYWluIGluIGRldmljZSB0cmVlIHdoaWNoIGlzIGtpbmQgb2YgcmVkdW5kYW50IHdp
dGggdGhlDQo+ID4+PiBpbnRyb2R1Y3Rpb24gb2YgeGVuLHN0YXRpYy1tZW0uIEluIGZhY3QsIEkg
dGhpbmsgaXQgd291bGQgYmUgYmV0dGVyDQo+ID4+PiB0byBjbGFyaWZ5IHRoZSByb2xlIG9mICJt
ZW1vcnkiIHdoZW4gInhlbixzdGF0aWMtbWVtIiBpcyBhbHNvIHByZXNlbnQuDQo+ID4+PiBJbiB0
aGF0IGNhc2UsIHdlIGNvdWxkIGV2ZW4gbWFrZSAibWVtb3J5IiBvcHRpb25hbC4NCj4gPj4NCj4g
Pj4gSSByZXF1ZXN0ZWQgdG8gbWFrZSBpdCBtYW5kYXRvcnkuIEltYWdpbmUgeW91IGhhdmUgYSBk
b21VIHRoYXQgaGFzDQo+ID4+IDFHQiBhbmQgbm93IHlvdSB3YW50IHRvIHN3aXRjaCB0byBzdGF0
aWMgbWVtb3J5LiBJZiB3ZSBtYWtlIHRoZQ0KPiA+PiBwcm9wZXJ0eSBvcHRpb25hbCwgdGhlbiB0
aGVyZSBpcyBhIHJpc2sgZm9yIHRoZSBhZG1pbiB0byBub3QNCj4gPj4gY29ycmVjdGx5IHBhc3Mg
dGhlIGFtb3VudCBvZiBtZW1vcnkuIFRoaXMgbWF5IGJlY29tZSB1bm5vdGljZWQgdW50aWwNCj4g
bGF0ZS4NCj4gPj4NCj4gPj4gU28gSSB0aGluayBtYWtpbmcgaXQgbWFuZGF0b3J5IGlzIGNoZWFw
IGZvciB1cyBhbmQgYW4gZWFzeSB3YXkgdG8NCj4gPj4gY29uZmlybSB5b3UgcHJvcGVybHkgc2l6
ZWQgdGhlIHJlZ2lvbi4gSXQgYWxzbyBoYXMgdGhlIGJlbmVmaXRzIHRvDQo+ID4+IGVhc2lseSBm
aW5kIG91dCBob3cgbXVjaCBtZW1vcnkgeW91IGdhdmUgdG8gdGhlIGd1ZXN0IChidXQgdGhhdCdz
IGp1c3QNCj4gYmVjYXVzZSBJIGFtIGxhenkgOikpLg0KPiA+Pg0KPiA+Pj4gSW4gYW55IGNhc2Us
IGV2ZW4gaWYgd2UgZG9uJ3QgbWFrZSAibWVtb3J5IiBvcHRpb25hbCwgaXQgbWlnaHQgc3RpbGwN
Cj4gPj4+IGJlIGdvb2QgdG8gdHVybiB0aGlzIGVycm9yIGludG8gYSB3YXJuaW5nIGFuZCBpZ25v
cmUgdGhlIHJlbWFpbmluZw0KPiA+Pj4ga2luZm8tPnVuYXNzaWduZWRfbWVtLg0KPiA+Pg0KPiA+
PiBUaGUgYmVoYXZpb3IgaXMgbWF0Y2hpbmcgdGhlIGV4aXN0aW5nIGZ1bmN0aW9uIGFuZCBJIHRo
aW5rIHRoaXMgaXMgYQ0KPiA+PiBnb29kIGlkZWEuIElmIHlvdSBhc2sgMTBNQiBvZiBtZW1vcnkg
YW5kIHdlIG9ubHkgZ2l2ZSB5b3UgOU1CLCB0aGVuDQo+ID4+IGF0IHNvbWUgcG9pbnQgeW91ciBn
dWVzdCBpcyBub3QgZ29pbmcgdG8gYmUgaGFwcHkuDQo+ID4+DQo+ID4+IEl0IGlzIG11Y2ggYmV0
dGVyIHRvIGtub3cgaXQgaW4gYWR2YW5jZSB3aXRoIGEgZmFpbHVyZSBvdmVyDQo+ID4+IGRpc2Nv
dmVyaW5nIGhvdXJzIGxhdGVyIHdoZW4geW91IHNlZSBhbiBPT00gZnJvbSB5b3VyIGRvbWFpbi4N
Cj4gPg0KPiA+IE9LLCBJIGRpZG4ndCByZWFsaXplIHRoaXMgd2FzIGRpc2N1c3NlZCBhbHJlYWR5
LiBMZXQncyBub3QgcmV2aXNpdA0KPiA+IHRoaXMgdGhlbi4NCj4gPg0KPiA+IE15IHByZWZlcmVu
Y2UgaXMgcHJpbWFyaWx5IHRvIG1ha2UgdGhlIGRldmljZSB0cmVlIGVhc2llciB0byB3cml0ZSwN
Cj4gPiBidXQgbm93YWRheXMgbm9ib2R5IEkga25vdyBpcyB3cml0aW5nIHRoZSBkZXZpY2UgdHJl
ZSBieSBoYW5kIGFueW1vcmUNCj4gPiAodGhleSBhbGwgdXNlIEltYWdlQnVpbGRlcikuU28gaWYg
dGhlIGRldmljZSB0cmVlIGlzIGdlbmVyYXRlZCB0aGVuIHdlDQo+ID4gYXJlIGZpbmUgZWl0aGVy
IHdheSBhcyBsb25nIGFzIHRoZSBiaW5kaW5nIGlzIGNsZWFyLiBTbyBJIGFtIE9LIHRvDQo+ID4g
ZHJvcCBteSBzdWdnZXN0aW9uIG9mIG1ha2luZyAibWVtb3J5IiBvcHRpb25hbC4gTGV0J3MgdGhp
bmsgb2YgYSB3YXkNCj4gPiB0byBtYWtlICJtZW1vcnkiIGFuZCAieGVuLHN0YXRpYy1tZW0iIGNv
ZXhpc3QgaW5zdGVhZC4NCj4gPg0KPiA+DQo+ID4gVGhlcmUgYXJlIHR3byBzaWRlcyBvZiB0aGUg
aXNzdWU6DQo+ID4gLSB0aGUgWGVuIGltcGxlbWVudGF0aW9uDQo+ID4gLSB0aGUgYmluZGluZw0K
PiA+DQo+ID4NCj4gPiBUaGUgWGVuIGltcGxlbWVudGF0aW9uIGlzIGZpbmUgdG8gcGFuaWMgaWYg
bWVtb3J5ICE9IHhlbixzdGF0aWMtbWVtLg0KPiA+IEluIHRoYXQgcmVnYXJkLCB0aGUgY3VycmVu
dCBwYXRjaCBpcyBPSy4NCj4gPg0KPiA+DQo+ID4gIEZyb20gdGhlIGJpbmRpbmcgcGVyc3BlY3Rp
dmUsIEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byBhZGQgYQ0KPiA+IHN0YXRlbWVudCB0byBj
bGFyaWZ5LiBUaGUgYmluZGluZyBkb2Vzbid0IG5lY2Vzc2FyaWx5IG5lZWQgdG8gbWF0Y2gNCj4g
PiBleGFjdGx5IHRoZSBpbXBsZW1lbnRhdGlvbiBhcyB0aGUgYmluZGluZyBzaG91bGQgYmUgYXMg
ZnV0dXJlIHByb29mDQo+ID4gYW5kIGFzIGZsZXhpYmxlIGFzIHBvc3NpYmxlLg0KPiANCj4gU28g
SSBhZ3JlZSB0aGF0IHRoZSBiaW5kaW5nIGRvZXNuJ3QgaGF2ZSB0byBtYXRjaCB0aGUgaW1wbGVt
ZW50YXRpb24uDQo+IEJ1dC4uLiB0aGUgYmluZGluZyBhbHdheXMgaGF2ZSBiZSBtb3JlIHJlc3Ry
aWN0aXZlIHRoYW4gdGhlIGltcGxlbWVudGF0aW9uLg0KPiBPdGhlcndpc2UsIHNvbWVvbmUgZm9s
bG93aW5nIHRoZSBiaW5kaW5nIG1heSBiZSBub3QgYWJsZSB0byB1c2UgaXQgd2l0aCBYZW4uDQo+
IA0KPiA+DQo+ID4gIEZyb20gdGhlIGJpbmRpbmcgcGVyc3BlY3RpdmUgdHdvIHByb3BlcnRpZXMg
c2hvdWxkIG1lYW4gZGlmZmVyZW50DQo+ID4gdGhpbmdzOiBtZW1vcnkgdGhlIHRvdGFsIG1lbW9y
eSBhbW91bnQgYW5kIHhlbixzdGF0aWMtbWVtIHRoZSBzdGF0aWMNCj4gPiBtZW1vcnkuIElmIG9u
ZSBkYXkgd2UnbGwgaGF2ZSBtb3JlIHR5cGVzIG9mIG1lbW9yeSwgbWVtb3J5IHdpbGwgY292ZXIN
Cj4gPiB0aGUgdG90YWwgYW1vdW50IHdoaWxlIHhlbixzdGF0aWMtbWVtIHdpbGwgY292ZXIgYSBz
dWJzZXQuIFNvIG1lbW9yeQ0KPiA+IG11c3QgYmUgZ3JlYXRlciBvciBlcXVhbCB0byB4ZW4sc3Rh
dGljLW1lbSAoZXZlbiBpZiB0b2RheSBYZW4gb25seQ0KPiA+IHN1cHBvcnRzIG1lbW9yeSA9PSB4
ZW4sc3RhdGljLW1lbSkuDQo+ID4NCj4gPiBTbyBJIHdvdWxkIGFkZDoNCj4gPg0KPiA+ICIiIg0K
PiA+IEFzIHRoZSBtZW1vcnkgcHJvcGVydHkgcmVwcmVzZW50cyB0aGUgdG90YWwgbWVtb3J5IG9m
IHRoZSBkb21haW4sDQo+ID4gaGVuY2UgdGhlIGFtb3VudCBvZiBtZW1vcnkgc2VsZWN0ZWQgYnkg
dGhlIG1lbW9yeSBwcm9wZXJ0eSBtdXN0IGJlDQo+ID4gZ3JlYXRlciBvciBlcXVhbCB0byB0aGUg
dG90YWwgYW1vdW50IHNwZWNpZmllZCBieSB4ZW4sc3RhdGljLW1lbS4NCj4gPiBPdGhlciBjb25m
aWd1cmF0aW9ucyAobWVtb3J5IGFtb3VudCBsZXNzIHRoYW4geGVuLHN0YXRpYy1tZW0gYW1vdW50
KQ0KPiA+IGFyZSBpbnZhbGlkLg0KPiA+ICIiIg0KPiA+DQo+ID4gVGhpcyBzZW50ZW5jZSBoYXMg
dGhlIHB1cnBvc2Ugb2YgY2xhcmlmeWluZyB0aGF0ICJtZW1vcnkiIHN0aWxsIG5lZWQNCj4gPiB0
byBiZSBwb3B1bGF0ZWQgYW5kIGhhdmUgYSB2YWxpZCB2YWx1ZS4gVGhlbiwgaXQgaXMgT0sgZm9y
IFhlbiB0bw0KPiA+IGVycm9yIG91dCBpZiBtZW1vcnkgZG9lc24ndCBtYXRjaCB4ZW4sc3RhdGlj
LW1lbSBiZWNhdXNlIHRoYXQncyB0aGUNCj4gPiBvbmx5IGNvbmZpZ3VyYXRpb24gc3VwcG9ydGVk
Lg0KPiBIb3cgYWJvdXQgd3JpdGluZyBzb21ldGhpbmcgbGlrZSAiVGhlIHByb3BlcnR5ICdtZW1v
cnknIHNob3VsZCBtYXRjaCB0aGUNCj4gYW1vdW50IG9mIG1lbW9yeSBnaXZlbiB0byB0aGUgZ3Vl
c3QuIEN1cnJlbnRseSwgaXQgaXMgb25seSBwb3NzaWJsZSB0byBlaXRoZXINCj4gYWxsb2NhdGUg
c3RhdGljIG1lbW9yeSBvciBsZXQgWGVuIGNob3NlLiAqTWl4aW5nKiBpcyBub3Qgc3VwcG9ydGVk
Jy4NCj4gDQo+IFRoZW4gaWYgd2UgYWRkIHRoZSBtaXhpbmcsIHdlIGNvdWxkIHNheSAnRnJvbSBY
ZW4gWFguWVksIG1peGluZyB3aWxsIGJlDQo+IGFsbG93ZWQnLg0KPiANCg0KT2suIEknbGwgYWRk
IHRoZSBzdGF0ZW1lbnQgdG8gY2xhcmlmeSB0aGUgYmluZGluZy4gDQoNCj4gQ2hlZXJzLA0KPiAN
Cj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

