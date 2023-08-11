Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC557791BF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 16:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582468.912259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUT38-0001ay-L9; Fri, 11 Aug 2023 14:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582468.912259; Fri, 11 Aug 2023 14:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUT38-0001Y5-ID; Fri, 11 Aug 2023 14:23:34 +0000
Received: by outflank-mailman (input) for mailman id 582468;
 Fri, 11 Aug 2023 14:23:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wg3T=D4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qUT36-0001Xz-K5
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 14:23:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a46bac6a-3852-11ee-8613-37d641c3527e;
 Fri, 11 Aug 2023 16:23:30 +0200 (CEST)
Received: from DUZPR01CA0126.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::20) by AS4PR08MB7530.eurprd08.prod.outlook.com
 (2603:10a6:20b:4f9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.20; Fri, 11 Aug
 2023 14:23:00 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::1c) by DUZPR01CA0126.outlook.office365.com
 (2603:10a6:10:4bc::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.31 via Frontend
 Transport; Fri, 11 Aug 2023 14:23:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.9 via Frontend Transport; Fri, 11 Aug 2023 14:22:59 +0000
Received: ("Tessian outbound b5a0f4347031:v175");
 Fri, 11 Aug 2023 14:22:59 +0000
Received: from 2fa2c439fd49.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5F94BC22-B63D-44DA-B065-BD322D4E4388.1; 
 Fri, 11 Aug 2023 14:22:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2fa2c439fd49.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Aug 2023 14:22:49 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB10090.eurprd08.prod.outlook.com (2603:10a6:102:367::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 14:22:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::4c7d:6a1:e742:3b1a%4]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 14:22:47 +0000
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
X-Inumbo-ID: a46bac6a-3852-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLmDCRpf5blIZrxi08KRUsg1dZk5p+yh6h9M79fnbUY=;
 b=reELl9G6GmWcoWetDP3BwhmqFKYbg/+PzpQGlDellel2fE2dYQdeKyZR6fhdeV7DmhcWAD2ihzC7f+j5MYilDkqEjBtz5Wl673fN0otNXhOrAJVIG3ar1ufwou5sBhSq6P3ZyNbpQdSz5RT6FdCv9BMRZwY7Pu5503foRZ0OXdU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef48009e62737c3d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mveqlEgOgPyYwNXsw5l7yS8w61x6QhDiliUlcoj9uJm7s4sTKTBHDjt2yL3zwPgl48fVsr3M/gNuiSW9/IuSJrCAtEcNl9jMWjDQrpVm7WnbgSVoOeXAAtsdbhznUV50ZtZABLda1ufq6S9UhRj3TvX/ygbC4pnKB0wyt6zsEquDPTUPnK/NEOqPboWfkypsa70i4AWvZbehip2f4Qbg09p2q4wFujFHKOcLdwkHh7DtPvg+j9b0CYIhO5TrrGurVPXVB0uH6iD5RO9si1byaj1dYCEpnhKxLiZxj/JMcJ1DOTs4aqcfIJKkFzbVHyGHg5oB/YhtGGXCFUJMahNyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLmDCRpf5blIZrxi08KRUsg1dZk5p+yh6h9M79fnbUY=;
 b=MyZDAMjkyKbjDp7+tXEfi2fQDU5PjQ5VaOx+WDbNZw5PQyxB2hv1LdPAjJ1CL85UHp28XhiJijKG/9RKDS97NkDBXsrme8O2VeO5GxwNtoQowJgSOTbNUO+a0JI2JRNuwRVazPNHYQUrc6Ffosxd9TYU7qWiVBgKlReCecBI44CSgeGin8bb23kxK+Hd2fvb7ZQIF5Xdc3v+m3XTco0B5d/G/WZNdXk/GK/DohBHdmmxxE3P1pEZIgexH95HLeOx4WOnq1YUYgJkBP/NL18C/mpTsGj5qBlwuvX/JgFjsVBcbFT27619LdaBe5FC0+p0MrXY2D1DKaR9tI2rvaS4sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wLmDCRpf5blIZrxi08KRUsg1dZk5p+yh6h9M79fnbUY=;
 b=reELl9G6GmWcoWetDP3BwhmqFKYbg/+PzpQGlDellel2fE2dYQdeKyZR6fhdeV7DmhcWAD2ihzC7f+j5MYilDkqEjBtz5Wl673fN0otNXhOrAJVIG3ar1ufwou5sBhSq6P3ZyNbpQdSz5RT6FdCv9BMRZwY7Pu5503foRZ0OXdU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/5] xen/arm: Add asm/domain.h include to kernel.h
Thread-Topic: [PATCH 2/5] xen/arm: Add asm/domain.h include to kernel.h
Thread-Index: AQHZyc51AtDCvMz7Yk+h8v6wea9TNK/lEvIAgAAMOACAAAkagIAAAqsA
Date: Fri, 11 Aug 2023 14:22:46 +0000
Message-ID: <019B593E-D59A-4C45-8C7C-BD9F19C8B2A6@arm.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
 <20230808080010.3858575-3-luca.fancellu@arm.com>
 <b9d88e5a-91d1-43b7-becd-8a742698e1c8@xen.org>
 <3C46ADAD-477D-46BB-BCCB-81C3198517E5@arm.com>
 <10ba4d0b-d5c1-4d86-bed3-9628203e3dac@xen.org>
In-Reply-To: <10ba4d0b-d5c1-4d86-bed3-9628203e3dac@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB10090:EE_|DBAEUR03FT023:EE_|AS4PR08MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 12baaddd-3c2e-491b-dac3-08db9a76770d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WXxYl/Y4JLhBLYAJHbbRuEDGq90vspZtQ/hdbjmwkgCq55GstJc1KJH8AamfYCf4MamehCS/fyqluDrtvfhdB1/seU3HRy+sE6IJfhJxfJhKN+LK2beNrLmCgMqJWFcyOwTbj5SUAPz652K0+lfF4zh+RGsvzCQNdSk/a6pIpDc7Hs6VA0yHvN2t4QjWrcbjmD6Lr/tR7+xm+eyOkrivimgmcQr7rCVFnTiNKCXznB0GhlYW/prVK5G7kkEqBsEYDs/miCpPh6l65nu0v5KaX1PIqjnxyqc4dVPijMmvMnzWsQwd9qXubSib6Zv+LMjp8k5IgXwyasFXl8891oXycFameSiWViATshm8pE/aN+gtbFV3htFXcFN37diJOK/yoxRbsR22b+BrG7DBSSI+H9HOgRaksV73jwbwKCczTW6dq5zQ4YKnYt3PeO/lAxOLHBOmOngl0Qa256GaUvRgat20B6GzbmtkRcagPKaYmrfGic2BOKR/QK2lV3QDG1++VNhrnBMhy3mbbDaOr+WZectM1QTt/C8zeEBYP3en9HfA7p5LMsUCiqyHm2qIZUXT764f+ixecacDeQVgifMHeKiU7hKdTCdJ6x5z7t91lwxldIIKamwjqDoXyCuqaFKEYZPkjZ3OSFsQcg65+CqVSw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(346002)(39860400002)(376002)(186006)(1800799006)(451199021)(86362001)(38070700005)(36756003)(2906002)(33656002)(66899021)(26005)(6916009)(2616005)(6506007)(53546011)(4326008)(122000001)(54906003)(38100700002)(478600001)(8936002)(91956017)(66556008)(64756008)(66946007)(5660300002)(66476007)(76116006)(66446008)(6512007)(71200400001)(41300700001)(316002)(6486002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <50B5CB115D85C1419C684555D62B1E18@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10090
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ead7136-7a0b-44f1-95fd-08db9a766f7d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dZy5BZWNbCgVBwgR/JMDMOERqQhVnHNRnXlaOyWc0atTPbKMxtn/D+BfPJZAOBs1qPio+OF2VFzTpkwIX/3w/Kps41IvB2FPjPuePrnuJKH6irKfcJB4VG6fJtbTtI568nsaQMIv0AOxOd1a4X69FVJKwc/ndSGhKqAx2qFbX+Da4Tu2nUAYtbAPnC+swsefYXbP1SSwW1jA7Vgx3zdXnomhgfvCwF1Dk8oGOv8llpGMZ7ZDDy3KDnQvUEob7Uye/0lDSbQ6QDY6xFok5HU3Jjw5xR73Ih9zwOdhF3xdcpneOdFeReKIVI8SsOMn8/NHCz+CPbWYrdu7VpY/6l9bjhHR6n96j8e2Vh+2OWcDbo6I3e2Ca3o6ZVESKFLG3WLW2CL1gjFJvvkhW7Hhb4p9Qgb0D0FUDkoIFlELvLCeIwia+k2KkjWu4bbEtRgRuao8tmw5CLY+WF9tuJ7u/iLpgEA7WFF8fwhC5wUutRKn0rh7f0QVinWiN8+kY5iGYzaWooemrIBYG0aXljbHQiwrEbwZBdj7Ik7keA9RMmbKAE7aTrsAjhjs7VKOS7Ku5TRMWxiyX/pIozlBRBXqSkR7VP9XnuuAMbQOf7J60oYZBj6snJ0XmuUsGeRHNIJdlEL/b6ormr2zi8OvECdQEk5XbfhwI2Sk4AL31vM6mTgWGZ/SWlNKA8QQ6oEsZGzI383xuYAn6XJLiUq+sO5WFrbKmqp7H4AQrKWynNgh6aeyECE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(1800799006)(82310400008)(451199021)(186006)(46966006)(36840700001)(40470700004)(8936002)(8676002)(6862004)(70206006)(70586007)(6486002)(41300700001)(47076005)(33656002)(4326008)(316002)(478600001)(107886003)(36860700001)(5660300002)(81166007)(356005)(6512007)(82740400003)(54906003)(2906002)(66899021)(26005)(40460700003)(336012)(86362001)(40480700001)(53546011)(6506007)(2616005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 14:22:59.6803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12baaddd-3c2e-491b-dac3-08db9a76770d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7530

DQoNCj4gT24gMTEgQXVnIDIwMjMsIGF0IDE1OjEzLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAxMS8wOC8yMDIzIDE0OjQwLCBM
dWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDExIEF1ZyAyMDIzLCBhdCAxMzo1NiwgSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgTHVjYSwNCj4+PiAN
Cj4+PiBPbiAwOC8wOC8yMDIzIDA5OjAwLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+PiBBZGQg
YXNtL2RvbWFpbi5oIHRoYXQgaXMgZGVmaW5pbmcgdGhlIHR5cGUgJ2VudW0gZG9tYWluX3R5cGUn
LCBpdA0KPj4+PiBpcyBuZWVkZWQgb24gYXJtNjQgYnVpbGQgd2hlcmUgdGhpcyB0eXBlIGlzIHVz
ZWQgZm9yIGEgbWVtYmVyIG9mDQo+Pj4+IHRoZSBzdHJ1Y3R1cmUga2VybmVsX2luZm8uDQo+Pj4g
DQo+Pj4gSSByZWFkICJuZWVkZWQiIGFzIGluIGl0IFhlbiBidWlsZCBpcyBicm9rZW4uIEJ1dCBB
RkFJSywgdGhpcyBpcyBtb3JlIGEgbGF0ZW50IGlzc3VlIGlmIHNvbWVvbmUgZWxzZSB3YW50IHRv
IGluY2x1ZGUgdGhlIGhlYWRlci4gSXMgdGhhdCBjb3JyZWN0Pw0KPj4gWWVzIGNvcnJlY3QNCj4+
PiANCj4+PiBJZiBzbywgaG93IGFib3V0Og0KPj4+IA0KPj4+IFRoZSAnZW51bSBkb21haW5fdHlw
ZScgaXMgZGVmaW5lZCBieSAnYXNtL2RvbWFpbi5oJyB3aGljaCBpcyBub3QgaW5jbHVkZWQgKGRp
cmVjdGx5IG9yIGluZGlyZWN0bHkpIGJ5ICdhc20va2VybmVsLmgnLg0KPj4+IA0KPj4+IFRoaXMg
Y3VycmVudGx5IGRvZXNuJ3QgYnJlYWsgdGhlIGNvbXBpbGF0aW9uIGJlY2F1c2UgYXNtL2RvbWFp
bi5oIHdpbGwgaW5jbHVkZWQgYnkgdGhlIHVzZXIgb2YgJ2tlcm5lbC5oJy4gQnV0IGl0IHdvdWxk
IGJlIGJldHRlciB0byBhdm9pZCByZWx5aW5nIG9uIGl0LiBTbyBhZGQgdGhlIGluY2x1ZGUgaW4g
J2FzbS9kb21haW4uaCcuDQo+PiBZZWFoIG11Y2ggYmV0dGVyLCBzaG91bGQgSSBwdXNoIGEgdjI/
DQo+IA0KPiBOby4gSSBjYW4gZGVhbCB3aXRoIGl0IG9uIGNvbW1pdC4NCg0KT2sgdGhhbmsgeW91
IGZvciBkb2luZyB0aGF0DQoNCj4gDQo+Pj4gDQo+Pj4+IEZpeGVzOiA2NmU5OTRhNWU3NGYgKCJ4
ZW46IGFybTY0OiBhZGQgZ3Vlc3QgdHlwZSB0byBkb21haW4gZmllbGQuIikNCj4+PiANCj4+PiBX
aGlsZSB3ZSBhaW0gdG8gaGF2ZSBoZWFkZXIgc2VsZi1jb250YWluZWQsIHRoaXMgaGFzIG5ldmVy
IGJlZW4gYSBndWFyYW50ZWUgaW4gWGVuLiBTbyBJIHdvdWxkIGFyZ3VlIHRoaXMgaXMgbm90IGEg
Zml4IGluIHRoZSBzZW5zZSBpdCBzb21lb25lIHdvdWxkIHdhbnQgdG8gaW5nZXN0IGl0IGluIHRo
ZXJlIHRyZWUuDQo+PiBPayBJIHNlZSwgSSB0aG91Z2h0IGl0IGNvdWxkIGJlIGxpbmtlZCB0byB0
aGUgaXNzdWUgYWJvdXQgc29ydGluZyBoZWFkZXJzIHRoYXQgbGVkIHRvIGJ1aWxkIGJyZWFrYWdl
LCBidXQgSeKAmXZlDQo+IA0KPiBJIGFtIHByb2JhYmx5IG1pc3Npbmcgc29tZXRoaW5nIGhlcmUu
IFdoaWNoIGlzc3VlIGFyZSB5b3UgcmVmZXJyaW5nIHRvPyBJcyBpdCBhIGZvbGxvdy11cCBwYXRj
aCB0aGF0IHdpbGwgc29ydCBoZWFkZXJzPw0KDQpJdOKAmXMgYW4gaXNzdWUgSeKAmXZlIGZhY2Vk
IHdoZW4gdHJ5aW5nIHRvIHNvcnQgYXV0b21hdGljYWxseSB0aGUgaW5jbHVkZSB1c2luZyBjbGFu
Zy1mb3JtYXQsIEnigJl2ZSBzZWVuIGlzc3VlcyBidWlsZGluZyBkb21haW5fYnVpbGQuYyBhZnRl
ciBzb3J0aW5nIHRoZSBoZWFkZXJzIGluIHRoZSB3YXkgd2UgZXhwZWN0IGZyb20gY29kaW5nIHN0
eWxlLCBJIHRob3VnaHQgd2FzIHJlbGF0ZWQgdG8gc29tZSBoZWFkZXJzIG5vdCBiZWluZyBzZWxm
LWNvbnRhaW5lZC4NCg0KPiANCj4+IG5vdCBpbnZlc3RpZ2F0ZWQgZnVydGhlciBzbyBJIHdvdWxk
IGJlIG9rIHRvIGRyb3AgdGhlIEZpeGVzOg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1
bGllbiBHcmFsbA0KDQo=

