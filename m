Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 366F9783B19
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 09:45:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588178.919660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYM3v-0005lr-OX; Tue, 22 Aug 2023 07:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588178.919660; Tue, 22 Aug 2023 07:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYM3v-0005je-Kx; Tue, 22 Aug 2023 07:44:27 +0000
Received: by outflank-mailman (input) for mailman id 588178;
 Tue, 22 Aug 2023 07:44:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hUC=EH=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qYM3u-0005jV-NW
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 07:44:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6b2e669-40bf-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 09:44:24 +0200 (CEST)
Received: from AM6PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:20b:6e::19)
 by PAWPR08MB8839.eurprd08.prod.outlook.com (2603:10a6:102:338::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 07:44:21 +0000
Received: from AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::69) by AM6PR02CA0006.outlook.office365.com
 (2603:10a6:20b:6e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 07:44:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT061.mail.protection.outlook.com (100.127.140.72) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.11 via Frontend Transport; Tue, 22 Aug 2023 07:44:21 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Tue, 22 Aug 2023 07:44:21 +0000
Received: from 8b4a09a81b2a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 00081C54-3023-4702-851F-03298AE7B2D8.1; 
 Tue, 22 Aug 2023 07:44:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8b4a09a81b2a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Aug 2023 07:44:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6170.eurprd08.prod.outlook.com (2603:10a6:10:200::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 07:44:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 07:44:11 +0000
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
X-Inumbo-ID: b6b2e669-40bf-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwqjmdAwt4NXz27B1JZWsYzsZQ4iiTpE41S6OUVXTPo=;
 b=IrGouWxdvHaRh2s1+i8NWKLBNVWYUKu8InVCBusALWhnKRk6Q/Xr54Bn40BBNn4MEmQNwpr92+aeleSrtqEpZdZHzDb1RD9WUmRnbMH5rwmeIso05tXuRa3mH3Qg1PvDuAF84XL1Q3TtrYgMUomw25moor66G0bJkoLevFycHlI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d77f0457618a1354
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUCVere5qzgfBQ56SF7XaBzXg7V7YJfz9bSMZtFj1e494fHndg0FuZTvHdWxc4dcqmfFq2pPH97TwBpGuM1oBuVqY6Cgbz8meaA8xVm5ew7cbkSkPYNCUk/bRrtPH/tejdSWaBlT/b17bUVKupgXUl9/H6JJvEPGcUbHJ5oXq3zs4nR6t9wpBdXEWuezpDtEp22eTQV79bUlpmUe469vVrH0g+B+mcPVzOLUoosx6cxQvz2fiYQppABZcUJ/RMcKBtIiMsVNCi2ToK0WczmGIv5EWHxMVgMpDU+5CcMFNWS1GSSBBuMJGf0Y5VInxFmHobTeEBmzqld9NzS8AVCAhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwqjmdAwt4NXz27B1JZWsYzsZQ4iiTpE41S6OUVXTPo=;
 b=Ej00+FIDwfESOSpPh9I4Z9w+ai4acvFq1NZBtg7OyerHcJ0yud5ErWuFn/pHm/BKy7rNnCVNYzDPyJjg78HgWfOqTLqKWT5gAz7kpWNc2eV23N3n47MgMQZhwNNXUesiD4MncdM8koroFuXPKoD5wKIz2tCAhIEbth3VUoZ14EawR+BT3BLMat1y4Y2S+F2L9qEwjuoYDHtTEOitVYvm0QEpXQildfY7TYEl08TBzfO403tqzjjwBggqV7xe/7clCOLHyI6Rlg2oL2jg4PWIIv1Be+rvIwIEtTv421I76K/7XDbw5vrl6ByIaUcTLCoE0a24LeOknzPwe3oUDH815w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwqjmdAwt4NXz27B1JZWsYzsZQ4iiTpE41S6OUVXTPo=;
 b=IrGouWxdvHaRh2s1+i8NWKLBNVWYUKu8InVCBusALWhnKRk6Q/Xr54Bn40BBNn4MEmQNwpr92+aeleSrtqEpZdZHzDb1RD9WUmRnbMH5rwmeIso05tXuRa3mH3Qg1PvDuAF84XL1Q3TtrYgMUomw25moor66G0bJkoLevFycHlI=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei
 Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to
 setup.c
Thread-Topic: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to
 setup.c
Thread-Index: AQHZzmeOkWUgiqEb9U2fOmI3mEWP3a/1UMEAgACrQQA=
Date: Tue, 22 Aug 2023 07:44:11 +0000
Message-ID: <2FABB940-CFFB-4EA2-8BC5-758E58025EF0@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-13-Henry.Wang@arm.com>
 <b9476973-519b-210d-6ca2-ca614d1e1279@xen.org>
In-Reply-To: <b9476973-519b-210d-6ca2-ca614d1e1279@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6170:EE_|AM7EUR03FT061:EE_|PAWPR08MB8839:EE_
X-MS-Office365-Filtering-Correlation-Id: b60b8d76-ca3b-46d0-887c-08dba2e39941
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 W1tZEENDPVL4OAvwquCAU4Fn0uiBooujCyxQzvD+N9GDLn4QvfbNUke0hztanEq3zKm+UqGBWG8hrv5oJT05QHUyGzIOC5XhcO2ncaM5JMbo8K5stxL7RX1ZBkelN31b4/jrXGTovR9wEma+EwcFv7S1YsvcE2dEcIp6jkJ+1qCSn0+SY1DtammHjIAKjp2QRkhrUMxcqy2QQnhtXrB5CLjYnAJyfcHhishM43RHwnuP9DfHbwaTSsksUTuLGqgKGAq6ky52pso5gRPw9HoO0LHgv43m5PvKEyn9Gfbx1BkI96NJhJXhVtkc0IL5mjRqE3qb5xngff8XygatGg3cS45QazbSKLPWHspRmzBRwyxpWyUUeWNZYc9XdcgdymgrW4dtUBzL2gP3MTn3E71WmXf+rWJL9IOzcCUlY3GlLCWqFleXh9QbR6vgcdEA5tVAm5OwINGrvwiYu/PQnxRfxCU6VHqRpjXdJqjOjkqNZa52Yri29ZXuKr3Ngi3DRt0YXrkHMlQKtwagBWwMjhGsNqNiYaNyA/W5W5l8Cf5eE2NEOMIG2ZZNstXLov21asO7yStqk7OW/J7xfdQ7R0tu0eqWsWk7gDwa415ruG+ZuEINCP7TdK1ofqkpkfGxanNX/5LZHDNBP3mSqjaQVK1KFQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(54906003)(6636002)(66446008)(76116006)(66476007)(66556008)(64756008)(316002)(66946007)(6512007)(66899024)(110136005)(91956017)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(122000001)(478600001)(71200400001)(38070700005)(38100700002)(53546011)(6506007)(6486002)(83380400001)(2906002)(86362001)(5660300002)(33656002)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A688F988F12B26418C126A3305A148CB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6170
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55e89d0f-4014-4ce6-6ddd-08dba2e39322
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KFXQ+b8kOHfjfbZDgGXgdrzKYkD/YcEF3+DYaQ4jHuz4B2NEzhqYgrftFKhJkl6k3RoPtmrfGrYYTINgTUbSsMrxSGX2nQhyp+Ct/8Jc6vBVTK6yn89HtIiQTyNxpLfULdsMk/4zfC/fAqrZvydjGGO1M76A23vyLo8TyGJJXv+/bynfu7DBW8eA6lHLJcvE+pr6nEy8pSQlTaFpzHGVSob0cQXflno2kab3dI5KpNU40baspfdPHZ9QfiA4uVkRW5ch8Vghy5C7IYq/Iflm3jIVa3IOX4/CloOB68r3RIdVIb9NnAEnHNRvXu7Q7gCKa72tIgvpwSt4sZallrARuZbNgoRyfq8WKfjGJUANoDVY93FOveKsrbn5kBWfN8e3zqiOxBjRddGwvEu2q3TgADUDKOE13kcjKcLCdEFrmEr7iIMrU+t6gFKYFSi0YmIZ0XWtr8Ywjpy20V5dGofWmeIsJ7tzSdKViCsRXMB4B9pRN9ei3L/u1FSebf7jqPXBz+I7eemPpw3KDKpo2vtyxlCvS1dm11qn6Tl2kPGp5vViDh1qfkkGvG6ljzf9/ba7sD+dJecxrFU5GAsoWsa7OYSsiiEJiLwh7LABucGrX05/+6mXpz1L6y78bhkmrV8OzJZWk3wCzvaVa0/Qik4G/kw5RGfw8BHvj2r3BdNh6Y4+KO3j8G5wH8RUMDluFNEjTimpxxeobKGZ451/4UMSq2uCKw04mI1yXB5gPdVaNrY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(186009)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(2616005)(336012)(26005)(66899024)(6512007)(47076005)(40480700001)(356005)(33656002)(36756003)(82740400003)(81166007)(36860700001)(86362001)(40460700003)(83380400001)(8936002)(316002)(8676002)(478600001)(41300700001)(110136005)(70206006)(6636002)(70586007)(54906003)(2906002)(4326008)(6506007)(6486002)(53546011)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 07:44:21.4604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b60b8d76-ca3b-46d0-887c-08dba2e39941
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8839

SGkgSnVsaWVuLCBTdGVmYW5vLCBCZXJ0cmFuZCwNCg0KPiBPbiBBdWcgMjIsIDIwMjMsIGF0IDA1
OjMxLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiAN
Cj4gT24gMTQvMDgvMjAyMyAwNToyNSwgSGVucnkgV2FuZyB3cm90ZToNCj4+IEZyb206IFBlbm55
IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPj4gRnVuY3Rpb24gY29weV9mcm9tX3BhZGRy
KCkgaXMgZGVmaW5lZCBpbiBhc20vc2V0dXAuaCwgc28gaXQgaXMgYmV0dGVyDQo+PiB0byBiZSBp
bXBsZW1lbnRlZCBpbiBzZXR1cC5jLg0KPiANCj4gSSBkb24ndCBhZ3JlZSB3aXRoIHRoaXMgcmVh
c29uaW5nLiBXZSB1c2VkIHNldHVwLmggdG8gZGVjbGFyZSBwcm90b3R5cGUgZm9yIGZ1bmN0aW9u
IHRoYXQgYXJlIG91dCBvZiBzZXR1cC5jLg0KPiANCj4gTG9va2luZyBhdCB0aGUgb3ZlcmFsbCBv
ZiB0aGlzIHNlcmllcywgaXQgaXMgdW5jbGVhciB0byBtZSB3aGF0IGlzIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gbW11L21tLmMgYW5kIG1tdS9zZXR1cC5jLiBJIGtub3cgdGhpcyBpcyB0ZWNobmlj
YWxseSBub3QgYSBuZXcgcHJvYmxlbSBidXQgYXMgd2Ugc3BsaXQgdGhlIGNvZGUsIGl0IHdvdWxk
IGJlIGEgZ29vZCBvcHBvcnR1bml0eSB0byBoYXZlIGEgYmV0dGVyIHNwbGl0Lg0KPiANCj4gRm9y
IGluc3RhbmNlLCB3ZSBoYXZlIHNldHVwX21tKCkgZGVmaW5lZCBpbiBzZXR1cC5jIGJ1dCBzZXR1
cF9wYWdldGFibGVzKCkgYW5kIG1tLmMuIEJvdGggYXJlIHRlY2huaWNhbGx5IHJlbGF0ZWQgdG8g
dGhlIG1lbW9yeSBtYW5hZ2VtZW50LiBTbyBoYXZpbmcgdGhlbSBpbiBzZXBhcmF0ZSBmaWxlIGlz
IGEgYml0IG9kZC4NCg0KU2tpbW1pbmcgdGhyb3VnaCB0aGUgY29tbWVudHMsIGl0IGxvb2tzIGxp
a2Ugd2UgaGF2ZSBhIGNvbW1vbiBwcm9ibGVtDQppbiBwYXRjaCA3LCA5LCAxMCwgMTIgYWJvdXQg
aG93IHRvIG1vdmUvc3BsaXQgdGhlIGNvZGUuIFNvIGluc3RlYWQgb2YgaGF2aW5nDQp0aGUgZGlz
Y3Vzc2lvbiBpbiBlYWNoIHBhdGNoLCBJIHdvdWxkIGxpa2UgdG8gcHJvcG9zZSB0aGF0IHdlIGNh
biBkaXNjdXNzIGFsbA0Kb2YgdGhlc2UgaW4gYSBjb21tb24gcGxhY2UgaGVyZS4NCg0KPiANCj4g
SSBhbHNvIGRvbid0IGxpa2UgdGhlIGlkZWEgb2YgaGF2aW5nIGFnYWluIGEgbWFzc2l2ZSBtbS5j
IGZpbGVzLiBTbyBtYXliZSB3ZSBuZWVkIGEgc3BsaXQgbGlrZToNCj4gICogRmlsZSAxOiBCb290
IENQVTAgTU0gYnJpbmd1cCAobW11L3NldHVwLmMpDQo+ICAqIEZpbGUgMjogU2Vjb25kYXJ5IENQ
VXMgTU0gYnJpbmd1cCAobW11L3NtcGJvb3QuYykNCj4gICogRmlsZSAzOiBQYWdlIHRhYmxlcyB1
cGRhdGUuIChtbXUvcHQuYykNCj4gDQo+IElkZWFsbHkgZmlsZSAxIHNob3VsZCBjb250YWluIG9u
bHkgaW5pdCBjb2RlL2RhdGEgc28gaXQgY2FuIGJlIG1hcmtlZCBhcyAuaW5pdC4gU28gdGhlIHN0
YXRpYyBwYWdldGFibGVzIG1heSB3YW50IHRvIGJlIGRlZmluZWQgaW4gbW11L3B0LmMuDQoNClNv
IGJhc2VkIG9uIEp1bGllbuKAmXMgc3VnZ2VzdGlvbiwgUGVubnkgYW5kIEkgd29ya2VkIGEgYml0
IG9uIHRoZSBjdXJyZW50DQpmdW5jdGlvbnMgaW4g4oCcYXJjaC9hcm0vbW0uY+KAnSBhbmQgd2Ug
d291bGQgbGlrZSB0byBwcm9wb3NlIGJlbG93IHNwbGl0DQpzY2hlbWUsIHdvdWxkIHlvdSBwbGVh
c2UgY29tbWVudCBvbiBpZiBiZWxvdyBtYWtlcyBzZW5zZSB0byB5b3UsDQp0aGFua3MhDQoNCiIi
Ig0Kc3RhdGljIHZvaWQgX19pbml0IF9fbWF5YmVfdW51c2VkIGJ1aWxkX2Fzc2VydGlvbnMoKSAg
ICAgIC0+IGFyY2gvYXJtL21tLmMNCnN0YXRpYyBscGFlX3QgKnhlbl9tYXBfdGFibGUoKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUvcHQuYw0Kc3RhdGljIHZvaWQgeGVuX3VubWFw
X3RhYmxlKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQp2b2lkIGR1
bXBfcHRfd2FsaygpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11
L3B0LmMNCnZvaWQgZHVtcF9oeXBfd2FsaygpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtPiBtbXUvcHQuYw0KbHBhZV90IG1mbl90b194ZW5fZW50cnkoKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQp2b2lkIHNldF9maXhtYXAoKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3B0LmMgIA0Kdm9pZCBj
bGVhcl9maXhtYXAoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1t
dS9wdC5jDQp2b2lkIGZsdXNoX3BhZ2VfdG9fcmFtKCkgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLT4gYXJjaC9hcm0vbW0uYz8NCmxwYWVfdCBwdGVfb2ZfeGVuYWRkcigpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUvcHQuYw0Kdm9pZCAqIF9faW5pdCBl
YXJseV9mZHRfbWFwKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9zZXR1cC5j
DQp2b2lkIF9faW5pdCByZW1vdmVfZWFybHlfbWFwcGluZ3MoKSAgICAgICAgICAgICAgICAgICAg
ICAgLT4gbW11L3NldHVwLmMNCnN0YXRpYyB2b2lkIHhlbl9wdF9lbmZvcmNlX3dueCgpICAgICAg
ICAgICAgICAgICAgICAgICAgICAtPiBtbXUvcHQuYywgZXhwb3J0IGl0DQpzdGF0aWMgdm9pZCBj
bGVhcl90YWJsZSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3NtcGJv
b3QuYw0Kdm9pZCBfX2luaXQgc2V0dXBfcGFnZXRhYmxlcygpICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0+IG1tdS9zZXR1cC5jDQpzdGF0aWMgdm9pZCBjbGVhcl9ib290X3BhZ2V0YWJsZXMo
KSAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3NtcGJvb3QuYw0KaW50IGluaXRfc2Vjb25k
YXJ5X3BhZ2V0YWJsZXMoKSAgICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9zbXBib290
LmMNCnZvaWQgbW11X2luaXRfc2Vjb25kYXJ5X2NwdSgpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtPiBtbXUvc21wYm9vdC5jDQp2b2lkIF9faW5pdCBzZXR1cF9kaXJlY3RtYXBfbWFwcGlu
Z3MoKSAgICAgICAgICAgICAgICAgICAgLT4gbW11L3NldHVwLmMNCnZvaWQgX19pbml0IHNldHVw
X2ZyYW1ldGFibGVfbWFwcGluZ3MoKSAgICAgICAgICAgICAgICAgICAtPiBtbXUvc2V0dXAuYw0K
dm9pZCAqX19pbml0IGFyY2hfdm1hcF92aXJ0X2VuZCgpICAgICAgICAgICAgICAgICAgICAgICAg
IC0+IGFyY2gvYXJtL21tLmMgb3IgbW11L3NldHVwLmM/DQp2b2lkICppb3JlbWFwX2F0dHIoKSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3B0LmMNCnZvaWQgKmlv
cmVtYXAoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUv
cHQuYw0Kc3RhdGljIGludCBjcmVhdGVfeGVuX3RhYmxlKCkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0+IG1tdS9wdC5jIA0Kc3RhdGljIGludCB4ZW5fcHRfbmV4dF9sZXZlbCgpICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQpzdGF0aWMgYm9vbCB4ZW5fcHRfY2hl
Y2tfZW50cnkoKSAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3B0LmMgDQpzdGF0aWMg
aW50IHhlbl9wdF91cGRhdGVfZW50cnkoKSAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11
L3B0LmMNCnN0YXRpYyBpbnQgeGVuX3B0X21hcHBpbmdfbGV2ZWwoKSAgICAgICAgICAgICAgICAg
ICAgICAgICAtPiBtbXUvcHQuYyANCnN0YXRpYyB1bnNpZ25lZCBpbnQgeGVuX3B0X2NoZWNrX2Nv
bnRpZygpICAgICAgICAgICAgICAgICAtPiBtbXUvcHQuYyANCnN0YXRpYyBpbnQgeGVuX3B0X3Vw
ZGF0ZSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBtbXUvcHQuYyANCmludCBt
YXBfcGFnZXNfdG9feGVuKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBt
bXUvcHQuYyANCmludCBfX2luaXQgcG9wdWxhdGVfcHRfcmFuZ2UoKSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtPiBtbXUvcHQuYw0KaW50IGRlc3Ryb3lfeGVuX21hcHBpbmdzKCkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0+IG1tdS9wdC5jDQppbnQgbW9kaWZ5X3hlbl9tYXBw
aW5ncygpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gbW11L3B0LmMNCnZvaWQg
ZnJlZV9pbml0X21lbW9yeSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBt
bXUvc2V0dXAuYw0Kdm9pZCBhcmNoX2R1bXBfc2hhcmVkX21lbV9pbmZvKCkgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0+IGFyY2gvYXJtL21tLmMNCmludCBzdGVhbF9wYWdlKCkgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBhcmNoL2FybS9tbS5jDQppbnQgcGFn
ZV9pc19yYW1fdHlwZSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXJj
aC9hcm0vbW0uYw0KdW5zaWduZWQgbG9uZyBkb21haW5fZ2V0X21heGltdW1fZ3BmbigpICAgICAg
ICAgICAgICAgICAgIC0+IGFyY2gvYXJtL21tLmMNCnZvaWQgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9n
dWVzdCgpICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBhcmNoL2FybS9tbS5jDQppbnQgeGVu
bWVtX2FkZF90b19waHlzbWFwX29uZSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXJj
aC9hcm0vbW0uYw0KbG9uZyBhcmNoX21lbW9yeV9vcCgpICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0+IGFyY2gvYXJtL21tLmMNCnN0YXRpYyBzdHJ1Y3QgZG9tYWluICpwYWdl
X2dldF9vd25lcl9hbmRfbnJfcmVmZXJlbmNlKCkgICAtPiBhcmNoL2FybS9tbS5jDQpzdHJ1Y3Qg
ZG9tYWluICpwYWdlX2dldF9vd25lcl9hbmRfcmVmZXJlbmNlKCkgICAgICAgICAgICAgLT4gYXJj
aC9hcm0vbW0uYw0Kdm9pZCBwdXRfcGFnZV9ucigpICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0+IGFyY2gvYXJtL21tLmMNCnZvaWQgcHV0X3BhZ2UoKSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBhcmNoL2FybS9tbS5jDQpib29sIGdl
dF9wYWdlX25yKCkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXJj
aC9hcm0vbW0uYw0KYm9vbCBnZXRfcGFnZSgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0+IGFyY2gvYXJtL21tLmMNCmludCBnZXRfcGFnZV90eXBlKCkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBhcmNoL2FybS9tbS5jDQp2b2lkIHB1
dF9wYWdlX3R5cGUoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXJj
aC9hcm0vbW0uYw0KaW50IGNyZWF0ZV9ncmFudF9ob3N0X21hcHBpbmcoKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0+IGFyY2gvYXJtL21tLmMNCmludCByZXBsYWNlX2dyYW50X2hvc3RfbWFw
cGluZygpICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBhcmNoL2FybS9tbS5jDQpib29sIGlz
X2lvbWVtX3BhZ2UoKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gYXJj
aC9hcm0vbW0uYw0Kdm9pZCBjbGVhcl9hbmRfY2xlYW5fcGFnZSgpICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0+IGFyY2gvYXJtL21tLmMNCnVuc2lnbmVkIGxvbmcgZ2V0X3VwcGVyX21m
bl9ib3VuZCgpICAgICAgICAgICAgICAgICAgICAgICAtPiBhcmNoL2FybS9tbS5jDQoiIiINCg0K
PiANCj4gQmVydHJhbmQsIFN0ZWZhbm8sIGFueSB0aG91Z2h0cz8NCj4gDQo+IFsuLi5dDQo+IA0K
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbXUvc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9t
bXUvc2V0dXAuYw0KPj4gaW5kZXggZTA1Y2NhM2Y4Ni4uODg5YWRhNmI4NyAxMDA2NDQNCj4+IC0t
LSBhL3hlbi9hcmNoL2FybS9tbXUvc2V0dXAuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL21tdS9z
ZXR1cC5jDQo+PiBAQCAtMzI5LDYgKzMyOSwzMyBAQCB2b2lkIF9faW5pdCBzZXR1cF9tbSh2b2lk
KQ0KPj4gIH0NCj4+ICAjZW5kaWYNCj4+ICArLyoNCj4gDQo+IFdoeSBkaWQgdGhlIHNlY29uZCAn
KicgZGlzYXBwZWFyPw0KDQpBY2NvcmRpbmcgdG8gdGhlIENPRElOR19TVFlMRSwgd2Ugc2hvdWxk
IHVzZSBzb21ldGhpbmcgbGlrZSB0aGlzOg0KDQovKg0KICogRXhhbXBsZSwgbXVsdGktbGluZSBj
b21tZW50IGJsb2NrLg0KICoNCiAqIE5vdGUgYmVnaW5uaW5nIGFuZCBlbmQgbWFya2VycyBvbiBz
ZXBhcmF0ZSBsaW5lcyBhbmQgbGVhZGluZyAnKicuDQogKi8NCg0KSW5zdGVhZCBvZiAiLyoq4oCd
IGluIHRoZSBiZWdpbm5pbmcuIEJ1dCBJIHRoaW5rIHlvdSBtYWRlIGEgcG9pbnQsIEkgbmVlZA0K
dG8gbWVudGlvbiB0aGF0IEkgdG9vayB0aGUgb3Bwb3J0dW5pdHkgdG8gZml4IHRoZSBjb21tZW50
IHN0eWxlIGluIGNvbW1pdA0KbWVzc2FnZS4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAN
Cj4+ICsgKiBjb3B5X2Zyb21fcGFkZHIgLSBjb3B5IGRhdGEgZnJvbSBhIHBoeXNpY2FsIGFkZHJl
c3MNCj4+ICsgKiBAZHN0OiBkZXN0aW5hdGlvbiB2aXJ0dWFsIGFkZHJlc3MNCj4+ICsgKiBAcGFk
ZHI6IHNvdXJjZSBwaHlzaWNhbCBhZGRyZXNzDQo+PiArICogQGxlbjogbGVuZ3RoIHRvIGNvcHkN
Cj4+ICsgKi8NCj4+ICt2b2lkIF9faW5pdCBjb3B5X2Zyb21fcGFkZHIodm9pZCAqZHN0LCBwYWRk
cl90IHBhZGRyLCB1bnNpZ25lZCBsb25nIGxlbikNCj4+ICt7DQo+PiANCj4gDQo+IENoZWVycywN
Cj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

