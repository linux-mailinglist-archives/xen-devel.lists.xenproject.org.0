Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1607A2AEE
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 01:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603452.940455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhI41-0000lG-EY; Fri, 15 Sep 2023 23:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603452.940455; Fri, 15 Sep 2023 23:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhI41-0000ip-Bg; Fri, 15 Sep 2023 23:17:29 +0000
Received: by outflank-mailman (input) for mailman id 603452;
 Fri, 15 Sep 2023 23:17:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X4Zp=E7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qhI3z-0000bB-Cs
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 23:17:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06e3ba1f-541e-11ee-8788-cb3800f73035;
 Sat, 16 Sep 2023 01:17:25 +0200 (CEST)
Received: from AS4P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::6)
 by PAWPR08MB9544.eurprd08.prod.outlook.com (2603:10a6:102:2f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.43; Fri, 15 Sep
 2023 23:17:19 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d3:cafe::17) by AS4P251CA0017.outlook.office365.com
 (2603:10a6:20b:5d3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 23:17:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.21 via Frontend Transport; Fri, 15 Sep 2023 23:17:19 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Fri, 15 Sep 2023 23:17:19 +0000
Received: from 080c00d6e9fd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 28CF8EBB-159A-43D8-8AA4-6494790BED23.1; 
 Fri, 15 Sep 2023 23:17:07 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 080c00d6e9fd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Sep 2023 23:17:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5785.eurprd08.prod.outlook.com (2603:10a6:102:89::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Fri, 15 Sep
 2023 23:17:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6792.021; Fri, 15 Sep 2023
 23:17:03 +0000
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
X-Inumbo-ID: 06e3ba1f-541e-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/yFPuC0VIsMDoCFtboepgMYNu1d5xk/XRvCf8dQtLo=;
 b=t7JMpW77QkOboIf58qevrzI5Ns0RmFsMiUxNazjNCD09rB9GOU0KfVPlKj44GbwqIwva3fn2IaTP/i0XosoDRzMeqClK6NiQy5Zy2HbUHsshyqnLknNk73pm82J/PS4upAYs6oMIDuUbekeTvHuqUC3bvSanbmPaYTRgTcT122A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 356b11aea9d8e88b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzJ9+WYUUakGiYM3W+9zSS5hMMN2A+TuoYjvtWz8koPAqLKAHkqiC5uyfS44LjIUQeZ2bRcD1z6wxoc5JkGmJBDeG5PZudEcCj7X7V0dFhOqAHBwnkgaX6ORDwOdZdzhYefZvKYXQ4sAcnatr2XmELmI+jel7OB4NtkSqODp7N1IIfCAYFZgiQ8fKQcoPYG5sQWHqH4tZTb8ROYe0qogFxD/2c19WriOGrE9Nc2sy2i9QV0YAiwo7QwWUa7KWeLY4vvO+fGEXplJ0qkYPvVMtbjvW6pTyNqIW3auXEgL65Z2dw+hDEsAM1nlXYrsrciGreGHMTHpnJPcSzyG2RRCdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/yFPuC0VIsMDoCFtboepgMYNu1d5xk/XRvCf8dQtLo=;
 b=e8PfDZjXiY7lztrlMTrhAQDSp/uE9Vz1su0hZEyqdeDLz/GLQRa4VfptU9E7/ofi/kPwH4b6fW6mg3S39N/nZcA4nkVpoVsdImSjzAM8ewqQXhXpxwLwqw/DnH+ZgOQv75bWgux77s/EW0zPIFPSnRCNXVByMKv2yBGCGwL06SjeBNb/5L5AVEEzPD8mlqH+arGrxln5Quj8V8pco9L/ypY7ejjdXiddxrjhlt+LIlq4ZOUqQQfwQmWumy7Dl4VA5uL94eiWcf9KQcUO29JkF9iHQnuMVxQKnP2VwruquZYiUeGByD8rBbzFRuOSK5Ln7zY9e/JVNlxp2+xfy/RCtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/yFPuC0VIsMDoCFtboepgMYNu1d5xk/XRvCf8dQtLo=;
 b=t7JMpW77QkOboIf58qevrzI5Ns0RmFsMiUxNazjNCD09rB9GOU0KfVPlKj44GbwqIwva3fn2IaTP/i0XosoDRzMeqClK6NiQy5Zy2HbUHsshyqnLknNk73pm82J/PS4upAYs6oMIDuUbekeTvHuqUC3bvSanbmPaYTRgTcT122A=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Penny
 Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <Wei.Chen@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v6 03/13] xen/arm64: Split and move MMU-specific head.S to
 mmu/head.S
Thread-Topic: [PATCH v6 03/13] xen/arm64: Split and move MMU-specific head.S
 to mmu/head.S
Thread-Index: AQHZ2U+UcSThZeMoaki/TjWLz78rArAciCOAgAAapgA=
Date: Fri, 15 Sep 2023 23:17:01 +0000
Message-ID: <A885C053-D5F7-48E4-8761-61D4EE226A1A@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-4-Henry.Wang@arm.com>
 <bfb777cb-77b1-859a-1d4d-d096632c765e@xen.org>
In-Reply-To: <bfb777cb-77b1-859a-1d4d-d096632c765e@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5785:EE_|AM7EUR03FT037:EE_|PAWPR08MB9544:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ab1f4c-1bac-4476-de61-08dbb641e88e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XwtyW45hFoj5mJ30BUSnLkdRn95gkNqhU5fB6sXvWAAYmpcXRHsth9pnClA27x+LIybdfVvHGd9OehrC3ZyowlSU93TNBPEpkGtGqAIbB5MJ9R4Thtm2lk7AY+ENNyFxlqUQVBostlAsfhUoaGPDICOO5x00Sy9IIH1lbhF67prrz4YdTlABr12gl76Y1VLClnygGFxYCrkaVRdTWAErjG0cwincxZ8ek2d3mms0E+0q3Q8+YToCTR6ntH/KdzSf0RWIvyRNIFmkCe8ojkNu0Z6Ri+6lohTxIJSdzENo7lRvhv8c5MXEprS2MmK8M56WTYVWOT0RPmFn266SMlrXh00ZlvdK6ILExbdJ6bNCHdNOYC8iLPXjDRHVTYfAIkR6JYcRMHOKe3YxUnAEnNZvlH6PcoXMKzGqxJhQ/OMJFg3oi83lynmdoL/GCWKkubZdgyt8KG2RYfoYUL0JRGWKwyN6aEPylW3DRlVtbTQHpnqDY6zkXyXVumzUWfK5w1qOViy85Vc9ZS40svv/UX4UY4rU94tnHOlDIHz9EQEBEWsUW04XGcELWPeYQ6DsivowZa88ne0w7Ubr2mQ+rN0DRWrfezyZVESKBufe12wHhCBP2AkY+6l1I/mav8jfvTKy80ddpb6hKdlSjrpR+mCqbw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199024)(186009)(1800799009)(26005)(2616005)(5660300002)(4326008)(8676002)(8936002)(53546011)(6506007)(6486002)(6512007)(71200400001)(478600001)(122000001)(91956017)(6916009)(316002)(76116006)(41300700001)(66446008)(54906003)(64756008)(66556008)(66476007)(66946007)(38100700002)(86362001)(36756003)(33656002)(2906002)(966005)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00A82883E2E317458BEA1EF27A6C7910@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5785
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a5d20f17-f95d-455b-f036-08dbb641dda2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LU2u/hJqpd7HzmzW/UsqR8sDqeLG+nOIiDwTmSqBSPRM+foNPXQyMn02p9mNz/R9uah8s4o0XHUoaNCP43SpCcu9taxdXTm3fnwStjCwfeCerX7hr5AMUnoTght8lHEV2owyYhc/PBC4lvzkJKCp6NZPgPxw7XS9IpRTAp4j8lNbSOiz5FMDtx1pAnq8JoDwA+Id6yBXAldhty04s+lsmvph7AYO69yH7omrlFAnrQPqbzhdI35bPy/G4V0Hvy4Lv70Fj11iG4WWiqwrOmwE12wzT4TKdcBwEmn5Bx8z06sh5duu+N1oGS3aZxDuASUkw1lUnBo6MSKXhuYSYNgkvAPtJu3fNNIPdSyOQaHnGJleKHBjsjtgq40n4Sp2vpye+gyZGn9oYnMj3S4hwPJFmducXdo9LckBFt6BBeY8Wij+xtkCmOrGFn08txPfN6Qm5alpzmgUWkQ+/rKcBLj8Ng3QEFkSKkTkuyArXvqPzKBBEayWuV7Y+A4+s5vdwgg3NDMI88HwEqTlKyyGAYTAhDeuMwq8eIjdgE87tuNwZ1Ln9MLuuL/+IGn205l70uyQP2kYaxTXLMhMVbhxlZPSQWMRSwfvlyVFsJUVtALPBWsjbr/d8+jRaIs8oTFvc3xoRrJG9QYiPNpAtratLbB3P8sblzSJhJCe55Rl8sYg7uOVGnvTOuYGlR9yf1eEnjljzoSqug8IPai+TQgVsIjJxl7uu6XeiNU7U1kdBDAFHrI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199024)(186009)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(40460700003)(6486002)(6512007)(53546011)(2616005)(6506007)(70586007)(70206006)(336012)(966005)(107886003)(478600001)(86362001)(47076005)(36860700001)(82740400003)(81166007)(356005)(26005)(33656002)(316002)(2906002)(5660300002)(40480700001)(6862004)(8676002)(41300700001)(54906003)(8936002)(36756003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 23:17:19.3395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ab1f4c-1bac-4476-de61-08dbb641e88e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9544

SGkgSnVsaWVuLA0KDQo+IE9uIFNlcCAxNiwgMjAyMywgYXQgMDU6NDEsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBJIHJlYWxpemUg
dGhhdCB0aGlzIHdhcyBhbHJlYWR5IGNvbW1pdHRlZC4gQnV0IHNvbWV0aGluZyB3ZW50IHdyb25n
IGR1cmluZyB0aGUgY29kZSBtb3ZlbWVudC4NCj4gDQo+IE9uIDI4LzA4LzIwMjMgMDI6MzIsIEhl
bnJ5IFdhbmcgd3JvdGU6DQo+PiArLyoNCj4+ICsgKiBFbmFibGUgbW0gKHR1cm4gb24gdGhlIGRh
dGEgY2FjaGUgYW5kIHRoZSBNTVUpIGZvciB0aGUgYm9vdCBDUFUuDQo+PiArICogVGhlIGZ1bmN0
aW9uIHdpbGwgcmV0dXJuIHRvIHRoZSB2aXJ0dWFsIGFkZHJlc3MgcHJvdmlkZWQgaW4gTFIgKGUu
Zy4gdGhlDQo+PiArICogcnVudGltZSBtYXBwaW5nKS4NCj4+ICsgKg0KPj4gKyAqIElucHV0czoN
Cj4+ICsgKiAgIGxyIDogVmlydHVhbCBhZGRyZXNzIHRvIHJldHVybiB0by4NCj4+ICsgKg0KPj4g
KyAqIENsb2JiZXJzIHgwIC0geDUNCj4+ICsgKi8NCj4+ICtFTlRSWShlbmFibGVfYm9vdF9jcHVf
bW0pDQo+PiArICAgICAgICBtb3YgICB4NSwgbHINCj4+ICsNCj4+ICsgICAgICAgIGJsICAgIGNy
ZWF0ZV9wYWdlX3RhYmxlcw0KPj4gKyAgICAgICAgbG9hZF9wYWRkciB4MCwgYm9vdF9wZ3RhYmxl
DQo+PiArDQo+PiArICAgICAgICBibCAgICBlbmFibGVfbW11DQo+PiArICAgICAgICBtb3YgICBs
ciwgeDUNCj4+ICsNCj4+ICsgICAgICAgIC8qDQo+PiArICAgICAgICAgKiBUaGUgTU1VIGlzIHR1
cm5lZCBvbiBhbmQgd2UgYXJlIGluIHRoZSAxOjEgbWFwcGluZy4gU3dpdGNoDQo+PiArICAgICAg
ICAgKiB0byB0aGUgcnVudGltZSBtYXBwaW5nLg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAg
ICBsZHIgICB4MCwgPTFmDQo+PiArICAgICAgICBiciAgICB4MA0KPj4gKzE6DQo+PiArICAgICAg
ICAvKg0KPj4gKyAgICAgICAgICogVGhlIDE6MSBtYXAgbWF5IGNsYXNoIHdpdGggb3RoZXIgcGFy
dHMgb2YgdGhlIFhlbiB2aXJ0dWFsIG1lbW9yeQ0KPj4gKyAgICAgICAgICogbGF5b3V0LiBBcyBp
dCBpcyBub3QgdXNlZCBhbnltb3JlLCByZW1vdmUgaXQgY29tcGxldGVseSB0bw0KPj4gKyAgICAg
ICAgICogYXZvaWQgaGF2aW5nIHRvIHdvcnJ5IGFib3V0IHJlcGxhY2luZyBleGlzdGluZyBtYXBw
aW5nDQo+PiArICAgICAgICAgKiBhZnRlcndhcmRzLiBGdW5jdGlvbiB3aWxsIHJldHVybiB0byBw
cmltYXJ5X3N3aXRjaGVkLg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAgICBiICAgICByZW1v
dmVfaWRlbnRpdHlfbWFwcGluZw0KPj4gKw0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAq
IEJlbG93IGlzIHN1cHBvc2VkIHRvIGJlIHVucmVhY2hhYmxlIGNvZGUsIGFzICJyZXQiIGluDQo+
PiArICAgICAgICAgKiByZW1vdmVfaWRlbnRpdHlfbWFwcGluZyB3aWxsIHVzZSB0aGUgcmV0dXJu
IGFkZHJlc3MgaW4gTFIgaW4gYWR2YW5jZS4NCj4+ICsgICAgICAgICAqLw0KPj4gKyAgICAgICAg
YiAgICAgZmFpbA0KPiANCj4gVGhlICJiICAgICBmYWlsIiBkaWRuJ3QgZXhpc3QgaW4gaGVhZC5T
LiBJIGd1ZXNzIHRoaXMgd2FzIGR1ZSB0byBhIHdyb25nIHJlYmFzZT8gQ2FuIHlvdSBjaGVjayBp
ZiB0aGVyZSBpcyBzb21ldGhpbmcgZWxzZSB0aGF0IHdlbnQgbWlzc2luZz8NCg0KUGxlYXNlIGNv
cnJlY3QgbWUgaWYgSSBhbSB3cm9uZyBidXQgSSB0aGluayB0aGUg4oCcYiBmYWls4oCdIG9mIGVu
YWJsZV9ib290X2NwdV9tbSgpIGlzDQppbiB0aGUgbW11IGhlYWQuUywgc2VlIGxpbmUgMzQ4IFsx
XS4NCg0KWzFdIGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Ymxv
YjtmPXhlbi9hcmNoL2FybS9hcm02NC9tbXUvaGVhZC5TO2g9ZDcxZmRjNjlhNTMxNzgwNTAxMzg3
ZmM1YzcxN2I0YzQxYmIxYjY2YTtoYj02NzM0MzI3ZDc2YmUzOGQyMGYyODBlY2M5NjM5MmUzODVm
YmMxZDhiI2wzNDgNCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KDQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

