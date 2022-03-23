Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70A4E53BB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 14:59:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293897.499455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX1VZ-00015V-AQ; Wed, 23 Mar 2022 13:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293897.499455; Wed, 23 Mar 2022 13:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nX1VZ-00012l-7F; Wed, 23 Mar 2022 13:58:41 +0000
Received: by outflank-mailman (input) for mailman id 293897;
 Wed, 23 Mar 2022 13:58:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7r0c=UC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nX1VX-00012f-Lv
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 13:58:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55e51624-aab1-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 14:58:37 +0100 (CET)
Received: from DB6PR0802CA0047.eurprd08.prod.outlook.com (2603:10a6:4:a3::33)
 by DB6PR08MB2759.eurprd08.prod.outlook.com (2603:10a6:6:1d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 13:58:34 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::db) by DB6PR0802CA0047.outlook.office365.com
 (2603:10a6:4:a3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23 via Frontend
 Transport; Wed, 23 Mar 2022 13:58:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Wed, 23 Mar 2022 13:58:33 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Wed, 23 Mar 2022 13:58:33 +0000
Received: from c03431c410d4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 543FF450-6621-4704-A0FC-686FF1F1F6EA.1; 
 Wed, 23 Mar 2022 13:58:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c03431c410d4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Mar 2022 13:58:22 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM4PR08MB2657.eurprd08.prod.outlook.com (2603:10a6:205:b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 23 Mar
 2022 13:58:11 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 13:58:11 +0000
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
X-Inumbo-ID: 55e51624-aab1-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1BtiweWzTnpUxEw8Bn480zDis6VZXEWz48HiPd7NcA=;
 b=Lgi88NX74eywEe0jDomnIkfTmeiEA0/2KPD2fPtxKVRyT19tNAPLuRL7uEgNi+mw6wUfa0Mpsnc57TZbKdMjO70l6bg2Itk9+bBnssu5tF/Ys9x3Bu0ICfNqdC9maS5Al/kxtpK71V/bq0jLNwJQms8K/SHbe7mGI8BoGFDkt5U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f49bfaa2d1be586d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k5o1dH/EgSohixPXDTutjqOfkCm8KehoqpYeviNSD9p8PNxxhbmCp/g/j9fXjGaCFzBeFTpJWULMVFJ3LNRoTjy1zT3XilsigWpMF8tRF4c5npr0fkXIwWUjFYKQOFgGI2VGu3Vr+Iv4HsdCDzrmRTamV418dnY3eAHCWGCkTfyqBlVxlvdsBMWr+NKnf0iz30tE2k4UpVslhVYTHolNidJfDaEkQ5tPG0qwEVnZShvIxvXtItJCAHvW+cgRAFhJi7JE44JraCwzgLAmrE7mLTwdlGr3tXKFuiAh6GlZvk89bqA8XAjBzbKRsW7gz/qYpEW6lGztAr+LavUApxwTrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1BtiweWzTnpUxEw8Bn480zDis6VZXEWz48HiPd7NcA=;
 b=hUqo7WZhkHdb1UVPjrz+tc8sBFemdy0lQcjkzWHkPi4ODAz++ERp/TQjgT+XbmnLrW60mk4Wn+KK232JGuKGhUoMXTQGPHwepr/uxk8mLlAZ96xIBZfH7VDp3Ws4gwkVPCrLgY7Q+HLEC2U78p2aMiDdRjX4q2D89sG6SPTJ0W6C2U4bTkdr/18ZHsN3GSVz1a6ooL9IXO6es/9yuPiwhnDjMKwGXD8xPcakdJACJN53NpAepyS2iPKRgvkICAjdAvisKFcnj4EL7vbUIev02zeW6so3awKUXofdT63fjqG0tfv76jG1VffCd2+Xkpf+i9ieZR/64w+xA64mydfIcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1BtiweWzTnpUxEw8Bn480zDis6VZXEWz48HiPd7NcA=;
 b=Lgi88NX74eywEe0jDomnIkfTmeiEA0/2KPD2fPtxKVRyT19tNAPLuRL7uEgNi+mw6wUfa0Mpsnc57TZbKdMjO70l6bg2Itk9+bBnssu5tF/Ys9x3Bu0ICfNqdC9maS5Al/kxtpK71V/bq0jLNwJQms8K/SHbe7mGI8BoGFDkt5U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Dario Faggioli
	<dfaggioli@suse.com>
Subject: Re: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Topic: [PATCH v3 4/6] xen/cpupool: Create different cpupools at boot
 time
Thread-Index:
 AQHYOtySiWfuTiIQkkqv44WbBvDftKzFUCoAgASzLoCAAAqAAIABIWCAgABFnICAAZGCAA==
Date: Wed, 23 Mar 2022 13:58:10 +0000
Message-ID: <6FA48D36-AFF3-4D37-BCF5-27FE68570428@arm.com>
References: <20220318152541.7460-1-luca.fancellu@arm.com>
 <20220318152541.7460-5-luca.fancellu@arm.com>
 <274f81b0-c164-4437-3d05-243e147330a9@xen.org>
 <0FA7F6D7-0B40-4B75-9752-7FE48D0FCA5C@arm.com>
 <9f3d7713-4e4b-58f8-d7a1-b42ef152a7ab@xen.org>
 <AE272A2A-EA5B-4217-AECE-80AE04207B55@arm.com>
 <acbf28a2-31b9-2a9c-6b42-6d386b47bfbf@xen.org>
In-Reply-To: <acbf28a2-31b9-2a9c-6b42-6d386b47bfbf@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 01aeb86e-08f2-4dd5-6e92-08da0cd53824
x-ms-traffictypediagnostic:
	AM4PR08MB2657:EE_|DB5EUR03FT046:EE_|DB6PR08MB2759:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB27599F5969A3E917419C5477E4189@DB6PR08MB2759.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0+h6PhpSHVgLH4Wn/bN6LIREKtaJDTnQ9u4lJSfwvDqebIspuBvP9BSfREzM0qSjFJDRkNNZ4A3BFwWpCiXq3cxp1hfFPkjkh/4dv7MzsNJ4gdV1TlpGuoLtaUdpeMRH/tJmF52T2/luPRj8CAF2oxtp6Q3wDIcXNjsMsF04aUSsBl617DIQmsPxUVyReKaP9FuzBxtLkiNoYmdxjHIrypFQejIHg5oDMQOeSX8ey4HjEQhs+Z1H5At0LzwXaP86l60b9K6BirKkaFeDT97NZ2ORBAH5lMcgFhhQrNx5UUzDonzQtKqY0ybCvIlpRvIBcba3bmzjX+6Y+qAs4KGTCHLhrgNCvsdbyd4cwxQgfmtYHyACXcJg9ckR+HNxOWTllFGUAjp/33IxIRWaQpspXOal63GCd/dvx7sPbo4dV4gsd7ioHY3vNlBwRPZqxWp0Kz59/tkAxxmbwr/zfNYLjOaPyVPJUOJZoEIVF1g4pO4Fe3m5KtJ5Cd3tVjde+kvQuIEIUHtXsfY3ywx5RyUqs2oRzGogOd++5gGVQgejI9QCcnOhSIyCw75ig75eEE+s/zVBhLWMvOc7zIBaPxZcbiH3vIJRNcN92Qn2rTVYzykxgJdla2JZjzMxlUlREtPPEalOw5wPGD66ehd0+yJD0CkyqKOe6YDutppGGJCdjpIwPxZBzpORE5sG1fEtxmDP4Qv+woGjhbaEOPTHPN6LCfKd5RXaU6M6UMoRakG0INebSvKeGV4uG30rWvUbNMIg21OdtAsB7AxKv/82NW4W3obr883hloJF5GkiPSCvTf/pmKZ0BvcZlZ55UbyfHZ/ctQCT5XlPQQoDPWKFfkw2SA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(966005)(6486002)(38070700005)(508600001)(38100700002)(71200400001)(86362001)(66476007)(8676002)(66446008)(64756008)(66556008)(91956017)(76116006)(54906003)(316002)(6916009)(66946007)(4326008)(83380400001)(122000001)(6512007)(53546011)(6506007)(2616005)(186003)(26005)(8936002)(36756003)(7416002)(5660300002)(33656002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E1B98503A1B254A9346764C285AD81D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2657
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd98a6e8-0ead-4f59-d602-08da0cd52ac2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h8iJq5QZ++sMg6OGlZ2UkQBvXUEKtF5hCqHY8rPQbcYWYpS9nNkXGlrsGHwIn5ru4oR5WjO71LIBaWOmmMjN6DwDppMeXyb2cpShDOdygfVDw4XG7B4LAzXpIhUaNERUURty2DgelV0WEtZ/P0BGXvebtSO3vkvF7BiheRm4FwO655mNz9x0cyVZGXVg83+VNk2qtiCzJ1bUZX64BcXMgA/ca81ceVqvnxsFnxghX6J704IrfoQOjJjPnMvONzXkw/BlyF5LkbbC0u+SorrNSjYjf0ZpTnaXVeZnVPMf2tTxwJ6VYZbYtLqis7EvHb388ukJhdic1PmF56SWXBRhGncZhEGf2O+3d1QQ3YYCbojICV8UBi12irjIW64O7ccFVrwg1ctjSs4kJ/IPfkVi3oMl4jWTe6qfVyM+jFAPH/YMuU+gIFNbzdIMthopQabjRE+2dIyQqcRaEvJz5+3XqvDH463aBG5KoA/hJfozPxs7MMmVrPcW1Pki8d3usRJau2baSEL96ZhL0Bc/g4nlX0u5fs+ABf5LqqADMYBb3p9PsQejCU0omZWi7zeb+SRtivxlHivhirO/3LVhOGOK1764Y2mqyPyJtA7URjWCxps6xhgoYclV8akGLJMXVcMXcJd83rGxRnERHFvjqeRC5Y4q6030L8OBbqkIjHUgVN1x3lgr0AFyiuBx6+U2/jQYgxL5zWQQbcgMRcGXkDxIqkLYd6wnqGlw7Ji5l6RzhUOJMd3GPwAysRZEUKUC0HKg97Mm/AaJbn7GrCZf6OCq/w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(316002)(36756003)(54906003)(70586007)(81166007)(356005)(8936002)(508600001)(966005)(40460700003)(6486002)(53546011)(8676002)(4326008)(6862004)(86362001)(70206006)(26005)(36860700001)(336012)(186003)(83380400001)(2616005)(6506007)(107886003)(47076005)(33656002)(2906002)(5660300002)(82310400004)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 13:58:33.5825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01aeb86e-08f2-4dd5-6e92-08da0cd53824
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2759

DQoNCj4gT24gMjIgTWFyIDIwMjIsIGF0IDE0OjAxLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMjIvMDMvMjAyMiAwOTo1MiwgTHVjYSBG
YW5jZWxsdSB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gQ2FuIHlvdSBkb2N1bWVudCB3aHkgdGhpcyBp
cyBuZWNlc3Nhcnkgb24geDg2IGJ1dCBub3Qgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcz8NCj4+Pj4g
SGkgSnVsaWVuLA0KPj4+PiBJIHJlY2VpdmVkIHRoZSB3YXJuaW5nIGJ5IEp1ZXJnZW4gaGVyZTog
aHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb21tZW50LzI0NzQwNzYyLyB0aGF0IGF0IGxl
YXN0IG9uIHg4NiB0aGVyZSBjb3VsZCBiZQ0KPj4+PiBzb21lIHByb2JsZW1zIGlmIGNwdTAgaXMg
bm90IGluIGNwdXBvb2wwLCBJIHRlc3RlZCBpdCBvbiBhcm0gYW5kIGl0IHdhcyB3b3JraW5nIGZp
bmUgYW5kIEkgZGlkbuKAmXQgZmluZCBhbnkgcmVzdHJpY3Rpb24uDQo+Pj4gDQo+Pj4gV2hhdCBl
eGFjdGx5IGRpZCB5b3UgdGVzdCBvbiBBcm0/DQo+Pj4gDQo+PiBJIGhhdmUgdGVzdGVkIHN0YXJ0
L3N0b3Agb2Ygc29tZSBndWVzdCwgbW92aW5nIGNwdXMgYmV0d2VlbiBjcHVwb29scywgY3JlYXRl
L2Rlc3Ryb3kgY3B1cG9vbHMsIHNodXRkb3duIG9mIERvbTANCj4+IFsgZnJvbSB5b3VyIGxhc3Qg
bWFpbCBdDQo+Pj4+PiANCj4+Pj4+IElmIGRvbTAgbXVzdCBydW4gb24gY29yZTAgYW5kIGNvcmUw
IGlzIExpdHRsZSB0aGVuIHlvdSBjYW5ub3QgYnVpbGQgYSBzeXN0ZW0gd2hlcmUgZG9tMCBpcyBy
dW5uaW5nIG9uIGJpZyBjb3Jlcy4NCj4+Pj4+IElmIHRoZSBsaW1pdGF0aW9uIGlzIG5vdCB0aGVy
ZSwgeW91IGNhbiBidWlsZCBzdWNoIGEgY29uZmlndXJhdGlvbiB3aXRob3V0IGFueSBkZXBlbmRl
bmN5IHRvIHRoZSBib290IGNvcmUgdHlwZS4NCj4+Pj4gVGhpcyBtaWdodCBub3QgYmUgY29tcGxl
dGVseSBjbGVhciBzbyBsZXQgbWUgcmVwaHJhc2U6DQo+Pj4+IEluIHRoZSBjdXJyZW50IHN5c3Rl
bToNCj4+Pj4gLSBkb20wIG11c3QgcnVuIG9uIGNwdXBvb2wtMA0KPj4+IA0KPj4+IEkgZG9uJ3Qg
dGhpbmsgd2UgbmVlZCB0aGlzIHJlc3RyaWN0aW9uLiBJbiBmYWN0LCB3aXRoIHRoaXMgc2VyaWVz
IGl0IHdpbGwgYmVjb21lIG1vcmUgYSBwcm9ibGVtIGJlY2F1c2UgdGhlIGNwdXBvb2wgSUQgd2ls
bCBiYXNlZCBvbiBob3cgd2UgcGFyc2UgdGhlIERldmljZS1UcmVlLg0KPj4+IA0KPj4+IFNvIGZv
ciBkb20wLCB3ZSBuZWVkIHRvIHNwZWNpZnkgZXhwbGljaXRlbHkgdGhlIGNwdXBvb2wgdG8gYmUg
dXNlZC4NCj4+PiANCj4+Pj4gLSBjcHVwb29sLTAgbXVzdCBjb250YWluIHRoZSBib290IGNvcmUN
Cj4+Pj4gLSBjb25zZXF1ZW5jZTogZG9tMCBtdXN0IHJ1biBvbiB0aGUgYm9vdCBjb3JlDQo+Pj4+
IElmIGJvb3QgY29yZSBpcyBsaXR0bGUsIHlvdSBjYW5ub3QgYnVpbGQgYXMgc3lzdGVtIHdoZXJl
IGRvbTAgcnVucyBvbmx5IG9uIHRoZSBiaWcgY29yZXMuDQo+Pj4+IFJlbW92aW5nIHRoZSBzZWNv
bmQgbGltaXRhdGlvbiAod2hpY2ggaXMgbm90IHJlcXVpcmVkIG9uIGFybSkgaXMgbWFraW5nIGl0
IHBvc3NpYmxlLg0KPj4+IA0KPj4+IElNSE8gcmVtb3ZpbmcgdGhlIHNlY29uZCByZXN0cmljdGlv
biBpcyBhIGxvdCBtb3JlIHJpc2t5IHRoYW4gcmVtb3ZpbmcgdGhlIGZpcnN0IG9uZS4NCj4+IEkg
c2VlIHlvdXIgcG9pbnQsIG15IGNvbmNlcm4gYWJvdXQgbW92aW5nIERvbTAgb24gYW5vdGhlciBj
cHVwb29sLCBkaWZmZXJlbnQgZnJvbSBjcHVwb29sMCwgaXMgdGhhdCB3ZSBnaXZlIHRoZQ0KPj4g
b3Bwb3J0dW5pdHkgdG8gZGVzdHJveSB0aGUgY3B1cG9vbDAgKHdlIGNhbuKAmXQgbGV0IHRoYXQg
aGFwcGVuKSwgb3IgcmVtb3ZlIGV2ZXJ5IGNwdSBmcm9tIGNwdXBvb2wwLg0KPiANCj4gRnJvbSBt
eSB1bmRlcnN0YW5kaW5nIGEgY3B1cG9vbCBjYW4gb25seSBiZSBkZXN0cm95ZWQgd2hlbiB0aGVy
ZSBhcmUgbm8gbW9yZSBDUFVzIGluIHRoZSBwb29sLiBHaXZlbiB0aGF0IGNwdTAgaGFzIHRvIGJl
IGluIHBvb2wwIHRoZW4gdGhpcyBzaG91bGQgcHJldmVudCB0aGUgcG9vbCB0byBiZSBkZXN0cm95
ZWQuDQo+IA0KPiBOb3csIGl0IGlzIHF1aXRlIHBvc3NpYmxlIHRoYXQgd2UgZG9uJ3QgaGF2ZSBh
IGNoZWNrIHRvIHByZXZlbnQgQ1BVMCB0byBiZSByZW1vdmVkIGZyb20gY3B1cG9vbDAuIElmIHNv
LCB0aGVuIEkgd291bGQgYXJndWUgd2Ugc2hvdWxkIGFkZCB0aGUgY2hlY2sgb3RoZXJ3aXNlIGl0
IGlzIHBvaW50bGVzcyB0byBwcmV2ZW50IGNwdTAgdG8gYmUgaW5pdGlhbGx5IGFkZGVkIGluIGFu
b3RoZXIgcG9vbCB0aGFuIHBvb2wwIGJ1dCBjYW4gYmUgbW92ZWQgYWZ0ZXJ3YXJkcy4NCj4gDQoN
CkhpIEp1bGllbiwNCg0KSeKAmXZlIGRvbmUgYSB0ZXN0IG9uIGZ2cCwgZmlyc3QgZmluZGluZyBp
cyB0aGF0IGNwdTAgY2FuIGJlIHJlbW92ZWQgZnJvbSBQb29sLTAsIHRoZXJlIGlzIG5vIGNoZWNr
Lg0KQWZ0ZXJ3YXJkcyBJ4oCZdmUgY3JlYXRlZCBhbm90aGVyIHBvb2wgYW5kIEnigJl2ZSBhc3Np
Z25lZCBhIGNwdSB0byBpdCwgSeKAmXZlIGNhbGxlZCB4bCBjcHVwb29sLWRlc3Ryb3kgYW5kIHRo
ZSB0b29sIHJlbW92ZXMgZXZlcnkgY3B1IGZyb20gdGhlIHBvb2wgYmVmb3JlIGRlc3Ryb3lpbmcu
DQoNCkRvIHlvdSB0aGluayB0aGUgY2hlY2sgdGhhdCBwcmV2ZW50cyBDUFUwIHRvIGJlIHJlbW92
ZWQgZnJvbSBQb29sLTAgc2hvdWxkIGJlIGRvbmUgaW4gdGhlIHRvb2xzIG9yIGluIFhlbj8NCg0K
V2l0aCB0aGlzIGNoYW5nZSBpdCBjb3VsZCBiZSBwb3NzaWJsZSB0byBwcm90ZWN0IGNwdTA6DQoN
CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkL2NwdXBvb2wuYyBiL3hlbi9jb21tb24vc2No
ZWQvY3B1cG9vbC5jDQppbmRleCBhNmRhNDk3MDUwNmEuLjcwMzAwNTgzOWRkNiAxMDA2NDQNCi0t
LSBhL3hlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jDQorKysgYi94ZW4vY29tbW9uL3NjaGVkL2Nw
dXBvb2wuYw0KQEAgLTU4NSw2ICs1ODUsMTIgQEAgc3RhdGljIGludCBjcHVwb29sX3VuYXNzaWdu
X2NwdShzdHJ1Y3QgY3B1cG9vbCAqYywgdW5zaWduZWQgaW50IGNwdSkNCiAgICAgaWYgKCAhY3B1
X29ubGluZShjcHUpICkNCiAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KIA0KKyAgICBpZiAoICFj
LT5jcHVwb29sX2lkICYmICFjcHUgKQ0KKyAgICB7DQorICAgICAgICBkZWJ1Z3RyYWNlX3ByaW50
aygiQ3B1MCBtdXN0IGJlIGluIHBvb2wgd2l0aCBpZCAwLlxuIik7DQorICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCisgICAgfQ0KKw0KICAgICBtYXN0ZXJfY3B1ID0gc2NoZWRfZ2V0X3Jlc291cmNl
X2NwdShjcHUpOw0KICAgICByZXQgPSBjcHVwb29sX3VuYXNzaWduX2NwdV9zdGFydChjLCBtYXN0
ZXJfY3B1KTsNCiAgICAgaWYgKCByZXQgKQ0KDQpDaGVlcnMsDQpMdWNhDQoNCg0KPiBDaGVlcnMs
DQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

