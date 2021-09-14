Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6D40B42A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 18:06:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186923.335675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQAwa-0000cb-Gx; Tue, 14 Sep 2021 16:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186923.335675; Tue, 14 Sep 2021 16:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQAwa-0000ak-DP; Tue, 14 Sep 2021 16:06:00 +0000
Received: by outflank-mailman (input) for mailman id 186923;
 Tue, 14 Sep 2021 16:05:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r2So=OE=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mQAwY-0000aY-IB
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 16:05:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a54f30f8-1575-11ec-b455-12813bfff9fa;
 Tue, 14 Sep 2021 16:05:57 +0000 (UTC)
Received: from AS9PR06CA0179.eurprd06.prod.outlook.com (2603:10a6:20b:45c::9)
 by AM4PR0802MB2177.eurprd08.prod.outlook.com (2603:10a6:200:5d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 14 Sep
 2021 16:05:47 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::ce) by AS9PR06CA0179.outlook.office365.com
 (2603:10a6:20b:45c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 14 Sep 2021 16:05:47 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 14 Sep 2021 16:05:46 +0000
Received: ("Tessian outbound 3c48586a377f:v103");
 Tue, 14 Sep 2021 16:05:44 +0000
Received: from a25c6d213c1b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 35C77C70-4A32-4C71-99F8-3FC9AC704217.1; 
 Tue, 14 Sep 2021 16:05:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a25c6d213c1b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 14 Sep 2021 16:05:32 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0801MB1809.eurprd08.prod.outlook.com (2603:10a6:203:3a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Tue, 14 Sep
 2021 16:05:28 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4523.014; Tue, 14 Sep 2021
 16:05:28 +0000
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
X-Inumbo-ID: a54f30f8-1575-11ec-b455-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RDD4gxU08S1uSaApCZk1px4OvUrzzI9gUt7p+1J4WA=;
 b=PhTpTdpX/kpRLCNh7jFqdyvj+bdlzxLW5/9ced5j2UNsfbBkHNHkm8JWoxpxi6w7MZcKB2sIX5qeHjFDcIx1X+sJnr9PJcqqYG36Rb087IK8gg2rislFXmthwN69GDv0KoHGbWYmzFvx0eQeAzQNB4hHcXcm+gJy9ka7neq9IQE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5308ce0caadccc43
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOqH3mtdphovGdjuFvLw+wjIWRe7r6pepUAcaHJohJJQfqpEY1zFXnfTPLvsCBfvU1S4E4eUffFEVdsVT3KSN5o8JIxL4VuWjHt1zsxIcM6a8+dte0dAFdM9sf4O6TbKRUy1GfAx17OlwJ9BxVjnLvbT9ZhkMxbP/P3JCeZBE8FXHXpL0KTBahURLQWI4DtQQ7Af34CYG0sli3khDjeSmVHNzfFxNiTy+rxigtsE1VFrdZ2CVIyPxiBKLg9OArpRCE5UX1/dZ+BRrc4h0i6M4FnNxxyn3BbAzH9JbM6oHw9y8DsnuSqvl625IECYu1ON7mvrY7k43u8uz4SxtPaPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=4RDD4gxU08S1uSaApCZk1px4OvUrzzI9gUt7p+1J4WA=;
 b=AokXm3PhhP2M62dx4eUria7rzD8iP0e2DVDqb9oPf+YY6xCnhAoLBvEILjy6ojiUm2WgGj3QvPQlzqghEKriHoSMbKvem0XFrHmROuCWOaNRjUsq9Vg/hgO0A/SEjO8rUSbQFhk0Vh9KXeBJprNuFd6Yk7WgtH0b2sDWlnhtzp3nN5LcbmHwwNqoMYuaRSxqhqjQpqWC6LpwZ0DUT0Y8FH6mjXdrvFazSYXXSk4a52xetWtOia9LiY/xEQMylWj57jGXRE1iP0dKC8DRFlecf45v8hTTEEjiUarh7QYAtG1LxL2XX2kcSBlhf1W+prgVr1qP+AuuIWp20dr5jUsxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RDD4gxU08S1uSaApCZk1px4OvUrzzI9gUt7p+1J4WA=;
 b=PhTpTdpX/kpRLCNh7jFqdyvj+bdlzxLW5/9ced5j2UNsfbBkHNHkm8JWoxpxi6w7MZcKB2sIX5qeHjFDcIx1X+sJnr9PJcqqYG36Rb087IK8gg2rislFXmthwN69GDv0KoHGbWYmzFvx0eQeAzQNB4hHcXcm+gJy9ka7neq9IQE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 08/14] xen:arm: Implement pci access functions
Thread-Topic: [PATCH v1 08/14] xen:arm: Implement pci access functions
Thread-Index: AQHXlPLKFxZ9ODgqA0ysGgNkOt1JX6ucfp8AgAdcI4A=
Date: Tue, 14 Sep 2021 16:05:28 +0000
Message-ID: <E37D41BC-1ACB-4779-9A8F-379F0E7BCB1A@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <c90c3088a592b41c477a0026446294a3b9422f76.1629366665.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109091639360.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109091639360.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7fe8395b-1cf2-428a-eb53-08d97799839a
x-ms-traffictypediagnostic: AM5PR0801MB1809:|AM4PR0802MB2177:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB217724208F6F26CA00C1A7A4FCDA9@AM4PR0802MB2177.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 muLPpNuf3BY600gaGrs5pwoVRihM3LtTZfr3ScsOIIKVJ02FmPh2ww03OEysUiWdk32PGqUpTz4O6wBjyoAgR55AlxRbatG2twlhQ6nWXPeA1odzsYgfvhYrhWsV2vQJtyppV4FkEJGHntpgnvw6ckXSsMnl+7ED6kT3utRGpDzXQpo+PMbFIhgmGSZ42ardQE1kiIMtVetPf0ybN10GFPkaWobfdslabQkTkCm6jCRCP0ii3Dvn1kcq+2WwxNu1Hn9DZ3biH8IRx+pQDYFsM5hLf+xp8z1yOx61s0/sgMQxgwa2v+F4ZynHxdNwipjwiv43ZNVMeWl46qugvfPkC87LmEuymA3zV+JwZykRejDSGRJPkyF0Xronmb8NKrwpmqAj15G40pRS5iX33p1nR8AFTw287ngReqEArfsLZV0EElc+7jU3A4/OYijZXgxJsgdyErIU6+WH1FEv6antn3O1qYmNLZMUmY89+bXPZNoJ4udHccMNsbUlSDkuVjQHxfXGV/qh3nUddGS0pcBQTzpwpOIdlNb0xsBiblljr+q7eBd0SNe0pSDcheNjAS/nnGNRWZLox6tTbt83xQVOg+tsZn16EMVeLCIzFj167Fbm6ICNH7M4Ctd9Od+VZhERPbSnvYj+cO1rnUhjljoNNfcRxJuL7/A7fyyhA9W0oQ+bB5sh1R8fMi7ED7smlyEbVLycG+qCaWZIn+W+MwwBE8BClFwJqp4t9jJqjN955ktTQhpxCtREkqPCXnhdRi7c
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(6512007)(6916009)(38070700005)(186003)(2906002)(5660300002)(38100700002)(8936002)(76116006)(66946007)(6486002)(66556008)(316002)(86362001)(66446008)(508600001)(2616005)(122000001)(8676002)(66476007)(83380400001)(64756008)(6506007)(53546011)(91956017)(36756003)(26005)(4326008)(71200400001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <53EA1C7039DE7B4FB3281D651EE92634@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1809
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0841bfda-d605-4a2c-decf-08d977997889
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rEiso4WJVNF/bXgCvUrhnqAzW4nRjJKFEBPJsbiXAAX9Yp1mvGls5aK5Qf6HnvdODXsqAulM5ntesyrkL4robNkcTMp3BbzNCiC8bj7R6BG8/794UNc59C1q60H/bGhFMsiy/iHf2+en2PtBcc6NV7xARKLsum4vdKqFUAb7LBOwe/Lgo6AopSLEaNvdYkkx4o6OU6L1ASFaA4zMuCs76IS9HeWsEwjXVq47pKA5Jg2z3bD8KkuH0/No0CxWDncFEl+/F/QO0WQ0FkqUm3UIxtXvHX0OyM+MW37oBHGmLknNVHU1s3eb9Ep1OUka2sEiexRAcsQPIwqHIE8qAGNw9dGFCjyNOU3vJPdfaDTe2sVtNWNBxFOnUMgkgGYk0BGxm9ykXqcwhbMR3j6JzaDSSI5Gd7XNB7ZjWxDHSbuFl+OryvcnilHFYKPwxko0pQG/HBqiCxG+LB1R8BCt5KqffS76IO3Ltcq/QD8Z8zwIcKFOKg6SYLh+iDZkxKhTXabDCs3snoVXKndQIUDWpsrrHqnr1Xh2pxHgdvYfoBI0ZxKYwVlYEJ/v2U0tyFrj07tHC8L0pT+ou8SkB6ne/qjW9bQv8Bbvq9kzJAHdV21F8LIOWg9YOQFnnOaQgoN8Ofb4XUxp5F/VHY4nhsUXeczfYFrn3Qa7IF1GrSQltzsvpyBc2iEpHo6FtNgMMIdunP41U0qZ8dKhGtSnTBhzSv1E+Q==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(6486002)(36756003)(6862004)(53546011)(33656002)(47076005)(81166007)(2616005)(508600001)(2906002)(336012)(8936002)(70586007)(70206006)(82310400003)(36860700001)(6512007)(86362001)(107886003)(83380400001)(26005)(356005)(8676002)(6506007)(316002)(54906003)(5660300002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 16:05:46.9866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe8395b-1cf2-428a-eb53-08d97799839a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2177

SGkgU3RlZmFubywNCg0KPiBPbiAxMCBTZXAgMjAyMSwgYXQgMTI6NDEgYW0sIFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIDE5
IEF1ZyAyMDIxLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+IEltcGxlbWVudCBnZW5lcmljIHBjaSBh
Y2Nlc3MgZnVuY3Rpb25zIHRvIHJlYWQvd3JpdGUgdGhlIGNvbmZpZ3VyYXRpb24NCj4+IHNwYWNl
Lg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNv
bT4NCj4+IC0tLQ0KPj4geGVuL2FyY2gvYXJtL3BjaS9wY2ktYWNjZXNzLmMgICAgICB8IDMxICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPj4geGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9z
dC1jb21tb24uYyB8IDE5ICsrKysrKysrKysrKysrKysrKw0KPj4geGVuL2luY2x1ZGUvYXNtLWFy
bS9wY2kuaCAgICAgICAgICB8ICAyICsrDQo+PiAzIGZpbGVzIGNoYW5nZWQsIDUxIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9w
Y2kvcGNpLWFjY2Vzcy5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktYWNjZXNzLmMNCj4+IGluZGV4
IGYzOWY2YTNhMzguLmI5NGRlM2MzYWMgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vcGNp
L3BjaS1hY2Nlc3MuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktYWNjZXNzLmMNCj4+
IEBAIC03MiwxMiArNzIsNDEgQEAgaW50IHBjaV9nZW5lcmljX2NvbmZpZ193cml0ZShzdHJ1Y3Qg
cGNpX2hvc3RfYnJpZGdlICpicmlkZ2UsIHVpbnQzMl90IHNiZGYsDQo+PiBzdGF0aWMgdWludDMy
X3QgcGNpX2NvbmZpZ19yZWFkKHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGxlbikNCj4+IHsN
Cj4+IC0gICAgcmV0dXJuIH4wVTsNCj4+ICsgICAgdWludDMyX3QgdmFsID0gR0VOTUFTSygwLCBs
ZW4gKiA4KTsNCj4gDQo+IFRoaXMgc2VlbXMgdG8gYmUgYW5vdGhlciBkZWZhdWx0IGVycm9yIHZh
bHVlIHRoYXQgaXQgd291bGQgYmUgYmV0dGVyIHRvDQo+IGRlZmluZSB3aXRoIGl0cyBvd24gbWFj
cm8NCg0KVGhpcyBkZWZhdWx0IGVycm9yIGlzIHVzZWQgb25jZSBkbyB5b3Ugd2FudCB0byBtZSBk
ZWZpbmUgYXMgbWFjcm8uICANCg0KPiANCj4gDQo+PiArICAgIHN0cnVjdCBwY2lfaG9zdF9icmlk
Z2UgKmJyaWRnZSA9IHBjaV9maW5kX2hvc3RfYnJpZGdlKHNiZGYuc2VnLCBzYmRmLmJ1cyk7DQo+
PiArDQo+PiArICAgIGlmICggdW5saWtlbHkoIWJyaWRnZSkgKQ0KPj4gKyAgICB7DQo+PiArICAg
ICAgICBwcmludGsoWEVOTE9HX0VSUiAiVW5hYmxlIHRvIGZpbmQgYnJpZGdlIGZvciAiUFJJX3Bj
aSJcbiIsDQo+PiArICAgICAgICAgICAgICAgIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYs
IHNiZGYuZm4pOw0KPiANCj4gWW91IGFyZSBub3QgYWN0dWFsbHkgcHJpbnRpbmcgc2JkZi5zZWcs
IHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mbiA/DQoNClllcyBJIGFtIHByaW50aW5nIHdpdGgg
4oCcUFJJX3BjaSIuDQo+IA0KPiANCj4+ICsgICAgICAgIHJldHVybiB2YWw7DQo+PiArICAgIH0N
Cj4+ICsNCj4+ICsgICAgaWYgKCB1bmxpa2VseSghYnJpZGdlLT5vcHMtPnJlYWQpICkNCj4+ICsg
ICAgICAgIHJldHVybiB2YWw7DQo+PiArDQo+PiArICAgIGJyaWRnZS0+b3BzLT5yZWFkKGJyaWRn
ZSwgKHVpbnQzMl90KSBzYmRmLnNiZGYsIHJlZywgbGVuLCAmdmFsKTsNCj4gDQo+IFdvdWxkIGl0
IG1ha2Ugc2Vuc2UgdG8gbWFrZSB0aGUgaW50ZXJmYWNlIHRha2UgYSBwY2lfc2JkZl90IGRpcmVj
dGx5DQo+IGluc3RlYWQgb2YgY2FzdGluZyB0byB1aW50MzJfdCBhbmQgYmFjaz8NCg0KcGNpX3Ni
ZGZfdCBpcyBkZWZpbmVkIGluICJ4ZW4vcGNpLmjigJ0gYW5kICJ4ZW4vcGNpLmjigJ0gaW5jbHVk
ZXMgImFzbS1hcm0vcGNpLmjigJ0uIA0KSWYgSSBtb2RpZnkgdGhlIGZ1bmN0aW9uIGFyZ3VtZW50
IGluICJhc20tYXJtL3BjaS5o4oCdIHRvIHVzZSBwY2lfc2JkZl90ICBJIHdpbGwgZ2V0IGNvbXBp
bGF0aW9uIGVycm9yLg0KDQo+IA0KPiANCj4+ICsgICAgcmV0dXJuIHZhbDsNCj4+IH0NCj4+IA0K
Pj4gc3RhdGljIHZvaWQgcGNpX2NvbmZpZ193cml0ZShwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVk
IGludCByZWcsDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBs
ZW4sIHVpbnQzMl90IHZhbCkNCj4+IHsNCj4+ICsgICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAq
YnJpZGdlID0gcGNpX2ZpbmRfaG9zdF9icmlkZ2Uoc2JkZi5zZWcsIHNiZGYuYnVzKTsNCj4+ICsN
Cj4+ICsgICAgaWYgKCB1bmxpa2VseSghYnJpZGdlKSApDQo+PiArICAgIHsNCj4+ICsgICAgICAg
IHByaW50ayhYRU5MT0dfRVJSICJVbmFibGUgdG8gZmluZCBicmlkZ2UgZm9yICJQUklfcGNpIlxu
IiwNCj4+ICsgICAgICAgICAgICAgICAgc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2Jk
Zi5mbik7DQo+IA0KPiBzYW1lIGhlcmUNClllcyBJIGFtIHByaW50aW5nIHdpdGgg4oCcUFJJX3Bj
aSIuDQo+ICANCg0KUmVnYXJkcw0KUmFodWwNCg0K

