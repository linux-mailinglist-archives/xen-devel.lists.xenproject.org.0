Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089D402487
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 09:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180477.327138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNVg6-0000Fv-Q9; Tue, 07 Sep 2021 07:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180477.327138; Tue, 07 Sep 2021 07:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNVg6-0000DD-MW; Tue, 07 Sep 2021 07:37:58 +0000
Received: by outflank-mailman (input) for mailman id 180477;
 Tue, 07 Sep 2021 07:37:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eOj3=N5=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mNVg4-0000D7-BP
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 07:37:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 839a3b3c-0fae-11ec-b0d8-12813bfff9fa;
 Tue, 07 Sep 2021 07:37:55 +0000 (UTC)
Received: from AM5PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:206:1::28)
 by AM9PR08MB6787.eurprd08.prod.outlook.com (2603:10a6:20b:2fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Tue, 7 Sep
 2021 07:37:53 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::46) by AM5PR04CA0015.outlook.office365.com
 (2603:10a6:206:1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Tue, 7 Sep 2021 07:37:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 07:37:52 +0000
Received: ("Tessian outbound b48d04bf8afd:v105");
 Tue, 07 Sep 2021 07:37:52 +0000
Received: from cc337d4a303e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A90B823-E9D3-4480-A8EE-8118E84F0E17.1; 
 Tue, 07 Sep 2021 07:37:45 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc337d4a303e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 07 Sep 2021 07:37:45 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6687.eurprd08.prod.outlook.com (2603:10a6:102:132::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Tue, 7 Sep
 2021 07:37:44 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 07:37:44 +0000
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
X-Inumbo-ID: 839a3b3c-0fae-11ec-b0d8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JacijTGwJwH9kAXer4cp3e7Zs95IEF6URsV3LKVTH0g=;
 b=2xP39ivKE620IZmZc0sPTQb/f02xxJjYGgkbTjbDWF1qg8+jpxXd8Iyz73hCtClrmZvGxwGcTw4s/0IefEB+YG8PkoUx2P1TZp1NXCHavl1N4D6g1KMcCxXP9uDG6FCTVTrzrgYCiKOU50K90Bj1tY4heGCOWDlKx+v+W46rL8w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 897d52c3b5177b73
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dh6O08MnqxBafjwLpw3NuWMTa57YVQoKhy1ii6sWKhJRt2jvTEu5dfnftxx1/pgR+O/OMaILp6LnGzB4iuYCqulPGqYqzVqYcdKzR/0uOJoClrp6Ci/L183wDjVHgtBgergHu67ioJdMTM+6UdMh+AjUF8B584eKcBNSdTDvfwdhzV/8FOOhoSWtzvd+tXbN+Sp85H74L1taU92dTVjc8LLv3vZmQ9Ou2wgqmKApXStpw+cWk9YeoBBxOhA+5Ki7Hu4pr8VALfDQmHo55vDf2VyPcmQDjmsbESVuToE3MeJJJoGMW06/9OBtO5YVZONDZk3Q2Ir352PYZh87LJR7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=JacijTGwJwH9kAXer4cp3e7Zs95IEF6URsV3LKVTH0g=;
 b=RuvOj5Clm/Dl0pYzr4N0muh6zTunpCQomv6ax0wGyv+carmfhFa8u48dPx6QeSca4wUr3w1H86qsp74e9tG+fyBBo9sW89DJdnCuatqTh8Nf/pKjYMP0+XoNE0PS/Rjgu3hXNhB7sFuy0mXeJhTkezrbB+Y5f3ALA0xtJbtXMQP3gnjsIlmAypDDbR4elfqG9ho1Y0K7I34PYu64JtyKRk4BrrgN1PadY2Oh+8hQP9iaAtewz3F2T3HcP4SZnPwSVQ5rGaK63pg6swF7afrZEP1iB7fbLIX0AEm8OKaEr78Yytl80LU906jB8oo/Jaw46DoX5PU5jFRwekdi5Sofgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JacijTGwJwH9kAXer4cp3e7Zs95IEF6URsV3LKVTH0g=;
 b=2xP39ivKE620IZmZc0sPTQb/f02xxJjYGgkbTjbDWF1qg8+jpxXd8Iyz73hCtClrmZvGxwGcTw4s/0IefEB+YG8PkoUx2P1TZp1NXCHavl1N4D6g1KMcCxXP9uDG6FCTVTrzrgYCiKOU50K90Bj1tY4heGCOWDlKx+v+W46rL8w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if needed
Thread-Topic: [PATCH v3 7/7] xen/arm: Sanitize CTR_EL0 and emulate it if
 needed
Thread-Index:
 AQHXmbPyaqNt71/0B0WMx26sIln5R6uHdm2AgAYrXACAABkoAIAAGG+AgAUlJICAA8aUAIAAmQIAgADq+oA=
Date: Tue, 7 Sep 2021 07:37:44 +0000
Message-ID: <F675C327-DA08-478D-ADA8-51D9DA63DE6D@arm.com>
References: <cover.1629897306.git.bertrand.marquis@arm.com>
 <a7482653a0c29d68854846f25553f4938a6279b9.1629897306.git.bertrand.marquis@arm.com>
 <14b1639e-c9e4-f8fb-e921-73d7f28681ac@xen.org>
 <98E8FB9D-3372-47D2-92F7-8AD401AC1092@arm.com>
 <6705127a-bde2-36cd-0fed-900eb1eace03@xen.org>
 <CA9E8DFA-E0D8-4C33-A277-E19EFFCAFDC4@arm.com>
 <alpine.DEB.2.21.2109031540470.26072@sstabellini-ThinkPad-T480s>
 <D0CCB87F-1CC1-450B-A612-E4B505B36B5B@arm.com>
 <7fc6e6b6-464a-a305-2693-42cba40ad869@xen.org>
In-Reply-To: <7fc6e6b6-464a-a305-2693-42cba40ad869@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5527bb9c-947b-401a-ad77-08d971d2668e
x-ms-traffictypediagnostic: PAXPR08MB6687:|AM9PR08MB6787:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB67876BC7A8EFF7EAD93A0DCB9DD39@AM9PR08MB6787.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ibyjGh0gjRbk+LfTaFbfKuH+LE8AkIHTI5lPwvoNVKNO/8+0cfwq5eSuKym7J5IjzxmXTw1HBQD0CDGi83AE0nQjFPV20hnp1YJdAhqhxlmWddCoPyYUC2npo+eT2sjWPFzp+2Hrf6bPyTepUIc8ZC0N4bjPXa5U3wMZSf7YwRWeFfFJ4oTVpmiBpB3VQWAIiw+YroljIamzyOur5Bpmh2ctS/zukOi7tB6yj5ST0T8BQisWtfTGBloyRdLoRfdyyDzxQus/70XOuG+yTAtaS68vGE5dLuBqZ/f+l3IS9Hqz7l0RKqUazEykNUo/oNOeYVUP0zuM4M0xcTbgPLouBv84FIfSLH77Xva8HFpWCzykhTwiTeM8DW1qNBC7vHlI9NTi9g1noCYDN2WrQ6ocljbE0dd54j0EWmWUgflB5gqRudV+pZYaqAtUKSIG/AJ4inBimgAl3g6GLwc9JvpevUaGg9IJ8ZjHD5bdCcYTEYSml5ifhDLhLC8AsMJkpUsJ6UM3YOmrYrBvdwOxhp4DuHqhSLzuihMmsGqkcfnr3LT1H75kSUYvJ0eSqhurbNJ/Db8Yh8IAyhFz18L4ttgyeANc7+xOYq1LHmyybZxEiVbg9I91EZymLyiMrok5UdTOda8oFAsmZbfa7GDQhcFooDvFIlYvwZ+I461IpNKOEpB+LX9pVqO3GoepM1Aq/ejWRYQZ6GbCR5xo4BogrhH4HrL3xULqNatId2ZxSMAvTPaA7QKPPG3UeO6wzznxIn1S
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(136003)(366004)(346002)(64756008)(66476007)(66556008)(53546011)(66446008)(6506007)(38100700002)(6486002)(26005)(36756003)(6512007)(71200400001)(186003)(66946007)(8676002)(2906002)(5660300002)(2616005)(4326008)(478600001)(54906003)(76116006)(8936002)(91956017)(6916009)(86362001)(38070700005)(122000001)(83380400001)(316002)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D63EEFAFA8AA294CBD7C4A4B2359E064@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6687
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d15b2021-f01d-48f0-4952-08d971d26191
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O9ArztvDSpNstsErMxyHEuITQsjYKjpOMuyX3rtMCERTmYu3RZmcgb/PXDzlzD/nXq/R0zfTD1LrPWZWPO0K1CLcoPOzJWIYKzBh/S0a/Jo56wCuABlJTcM8XQMj2gBOSGg0mP6npbeZYcUg6sOFvlCHo6psRVgPTeRQYQoSYmJeltRH4zZJuqE6KBn2Q+v/92s3+jW8/JwFd3vJgkBG1HO8F8AZfMN4kIcnmKl3BRM+MlvnXBQ4WErEJte4NbR4rqpUahsg3OCp/A+sm4hi8K9ouLUKuuXMovCiN2OPISF8A0ww8+5W+Oun29VvcpzsCTDJwqs4zikavkNk/K2WIRQ/Ivgv+ucHtamRruGhHGkGaVLG7JU21PlsH5/Bj2jvor8waGCszkWGho0Cz9JBvDZW+48CUnEHjY/GLb6vnBjuKP3ho14hfdQpSKhXa/sq6a9qOKSutICgHsuYm2RJwMmIHEC5msdrT0nVu7qNB+kUBjqoLu4Y1eWdbS074tvnZgBOMxPs02tKJHOmLqMZyBy62HQyZVcU3RndU8hgJhImRskLAMjbDEBtZVurolwsLLSFDilaYpNz35UKwLnykW9R3yYrls23SFE9j/RfFaNImYSwtsD01neTeVGxlKnagfN72lBMSVYHkuCzQMNxKfdzXBO3hRUdPWjoanFemYmQJP0khCqpvw6potWVQ/PEdHjMnD/fJsV3L4cghpzITg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(36840700001)(54906003)(107886003)(33656002)(70586007)(36860700001)(4326008)(6486002)(70206006)(2616005)(36756003)(2906002)(53546011)(336012)(6506007)(82310400003)(6862004)(186003)(316002)(5660300002)(26005)(8936002)(8676002)(47076005)(6512007)(81166007)(478600001)(86362001)(83380400001)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 07:37:52.6553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5527bb9c-947b-401a-ad77-08d971d2668e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6787

SGkgSnVsaWVuLA0KDQo+IE9uIDYgU2VwIDIwMjEsIGF0IDE4OjM2LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiANCj4gT24gMDYvMDkv
MjAyMSAwOToyOSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+PiBPbiAzIFNlcCAyMDIxLCBh
dCAyMzo0OSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90
ZToNCj4+PiANCj4+PiBPbiBUdWUsIDMxIEF1ZyAyMDIxLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3Rl
Og0KPj4+PiBIaSBKdWxpZW4sDQo+Pj4+IA0KPj4+Pj4gT24gMzEgQXVnIDIwMjEsIGF0IDE1OjQ3
LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gDQo+
Pj4+PiANCj4+Pj4+IE9uIDMxLzA4LzIwMjEgMTQ6MTcsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6
DQo+Pj4+Pj4gSGkgSnVsaWVuLA0KPj4+Pj4gDQo+Pj4+PiBIaSBCZXJ0cmFuZCwNCj4+Pj4+IA0K
Pj4+Pj4+PiBPbiAyNyBBdWcgMjAyMSwgYXQgMTY6MDUsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPj4+Pj4+PiANCj4+Pj4+Pj4gSGkgQmVydHJhbmQsDQo+Pj4+Pj4+IA0K
Pj4+Pj4+PiBPbiAyNS8wOC8yMDIxIDE0OjE4LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+
Pj4+Pj4gU2FuaXRpemUgQ1RSX0VMMCB2YWx1ZSBiZXR3ZWVuIGNvcmVzLg0KPj4+Pj4+Pj4gSW4g
bW9zdCBjYXNlcyBkaWZmZXJlbnQgdmFsdWVzIHdpbGwgdGFpbnQgWGVuIGJ1dCBpZiBkaWZmZXJl
bnQNCj4+Pj4+Pj4+IGktY2FjaGUgcG9saWNpZXMgYXJlIGZvdW5kLCB3ZSBjaG9vc2UgdGhlIG9u
ZSB3aGljaCB3aWxsIGJlIGNvbXBhdGlibGUNCj4+Pj4+Pj4+IGJldHdlZW4gYWxsIGNvcmVzIGlu
IHRlcm1zIG9mIGludmFsaWRhdGlvbi9kYXRhIGNhY2hlIGZsdXNoaW5nIHN0cmF0ZWd5Lg0KPj4+
Pj4+PiANCj4+Pj4+Pj4gSSB1bmRlcnN0YW5kIHRoYXQgYWxsIHRoZSBDUFVzIGluIFhlbiBuZWVk
cyB0byBhZ3JlZSBvbiB0aGUgY2FjaGUgZmx1c2ggc3RyYXRlZ3kuIEhvd2V2ZXIuLi4NCj4+Pj4+
Pj4gDQo+Pj4+Pj4+PiBJbiB0aGlzIGNhc2Ugd2UgbmVlZCB0byBhY3RpdmF0ZSB0aGUgVElEMiBi
aXQgaW4gSENSIHRvIGVtdWxhdGUgdGhlDQo+Pj4+Pj4+PiBUQ1JfRUwwIHJlZ2lzdGVyIGZvciBn
dWVzdHMuIFRoaXMgcGF0Y2ggaXMgbm90IGFjdGl2YXRpbmcgVElEMiBiaXQgYWxsDQo+Pj4+Pj4+
PiB0aGUgdGltZSB0byBsaW1pdCB0aGUgb3ZlcmhlYWQgd2hlbiBwb3NzaWJsZS4NCj4+Pj4+Pj4g
DQo+Pj4+Pj4+IGFzIHdlIGRpc2N1c3NlZCBpbiBhbiBlYXJsaWVyIHZlcnNpb24sIGEgdkNQVSBp
cyB1bmxpa2VseSAoYXQgbGVhc3QgaW4gc2hvcnQvbWVkaXVtKSB0byBiZSBhYmxlIG1vdmUgYWNy
b3NzIHBDUFUgb2YgZGlmZmVyZW50IHR5cGUuIFNvIHRoZSB2Q1BVIHdvdWxkIGJlIHBpbm5lZCB0
byBhIHNldCBvZiBwQ1BVcy4gSU9XLCB0aGUgZ3Vlc3Qgd291bGQgaGF2ZSB0byBiZSBiaWcuTElU
VExFIGF3YXJlIGFuZCB0aGVyZWZvcmUgd291bGQgYmUgYWJsZSB0byBkbyBpdHMgb3duIHN0cmF0
ZWd5IGRlY2lzaW9uLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gU28gSSB0aGluayB3ZSBzaG91bGQgYmUg
YWJsZSB0byBnZXQgYXdheSBmcm9tIHRyYXBwaW5ncyB0aGUgcmVnaXN0ZXJzLg0KPj4+Pj4+IEkg
ZG8gYWdyZWUgdGhhdCB3ZSBzaG91bGQgYmUgYWJsZSB0byBnZXQgYXdheSBmcm9tIHRoYXQgaW4g
dGhlIGxvbmcgdGVybSBvbmNlDQo+Pj4+Pj4gd2UgaGF2ZSBjcHVwb29scyBwcm9wZXJseSBzZXQg
YnV0IHJpZ2h0IG5vdyB0aGlzIGlzIHRoZSBvbmx5IHdheSB0byBoYXZlDQo+Pj4+Pj4gc29tZXRo
aW5nIHVzZWFibGUgKEkgd2lsbCBub3Qgc2F5IHJpZ2h0KS4NCj4+Pj4+PiBJIHdpbGwgd29yayBv
biBmaW5kaW5nIGEgd2F5IHRvIHNldHVwIHByb3Blcmx5IGNwdXBvb2xzIChvciBzb21ldGhpbmcg
ZWxzZSBhcw0KPj4+Pj4+IHdlIGRpc2N1c3NlZCBlYXJsaWVyKSBidXQgaW4gdGhlIHNob3J0IHRl
cm0gSSB0aGluayB0aGlzIGlzIHRoZSBiZXN0IHdlIGNhbiBkby4NCj4+Pj4+IA0KPj4+Pj4gTXkg
Y29uY2VybiBpcyB5b3UgYXJlIG1ha2luZyBsb29rIGxpa2UgWGVuIHdpbGwgYmUgYWJsZSB0byBk
ZWFsIG5pY2VseSB3aXRoIGJpZy5MSVRUTEUgd2hlbiBpbiBmYWN0IHRoZXJlIGFyZSBhIGxvdCBt
b3JlIHBvdGVudGlhbCBpc3N1ZSBieSBhbGxvdyBhIHZDUFUgbW92aW5nIGFjY3Jvc3MgcENQVSBv
ZiBkaWZmZXJlbnQgdHlwZSAodGhlIGVycmF0YSBpcyBvbmUgZXhhbXBsZSkuDQo+Pj4+IA0KPj4+
PiBJIGFncmVlIGFuZCB0aGlzIGlzIHdoeSBYZW4gaXMgdGFpbnRlZC4NCj4+Pj4gDQo+Pj4+PiAN
Cj4+Pj4+PiBBbiBvdGhlciBzb2x1dGlvbiB3b3VsZCBiZSB0byBkaXNjYXJkIHRoaXMgcGF0Y2gg
ZnJvbSB0aGUgc2VyaWUgZm9yIG5vdyB1bnRpbA0KPj4+Pj4+IEkgaGF2ZSB3b3JrZWQgYSBwcm9w
ZXIgc29sdXRpb24gZm9yIHRoaXMgY2FzZS4NCj4+Pj4+PiBTaG91bGQgd2UgZGlzY2FyZCBvciBt
ZXJnZSBvciBkbyB5b3UgaGF2ZSBhbiBvdGhlciBpZGVhID8NCj4+Pj4+IFBsZWFzZSBjb3JyZWN0
IG1lIGlmIEkgYW0gd3JvbmcsIGF0IHRoZSBtb21lbnQsIGl0IGRvZXNuJ3QgbG9vayBsaWtlIHRo
aXMgcGF0Y2ggd2lsbCBiZSBwYXJ0IG9mIHRoZSBsb25nZXIgcGxhbi4gSWYgc28sIHRoZW4gSSB0
aGluayBpdCBzaG91bGQgYmUgcGFya2VkIGZvciBub3cuDQo+Pj4+IA0KPj4+PiBOb3Qgc3VyZSBp
dCBkZXBlbmRzIG9uIHdoYXQgdGhlIGZpbmFsIHNvbHV0aW9uIHdvdWxkIGJlIGJ1dCB0aGlzIGlz
IGhpZ2hseSBwb3NzaWJsZSBJIGFncmVlLg0KPj4+PiANCj4+Pj4+IA0KPj4+Pj4gVGhpcyB3b3Vs
ZCBhbHNvIGhhdmUgdGhlIGFkdmFudGFnZSB0byBhdm9pZCBzcGVuZGluZyB0b28gbXVjaCB0aW1l
IG9uIHJlc29sdmluZyB0aGUgZW11bGF0aW9uIGlzc3VlIEkgbWVudGlvbmVkIGluIG15IHByZXZp
b3VzIGFuc3dlci4NCj4+Pj4+IA0KPj4+Pj4gTm8gbmVlZCB0byByZXNlbmQgYSBuZXcgdmVyc2lv
biBvZiB0aGlzIHNlcmllcyB5ZXQuIFlvdSBjYW4gd2FpdCB1bnRpbCB0aGUgcmVzdCBvZiB0aGUg
c2VyaWVzIGdldCBtb3JlIGZlZWRiYWNrLg0KPj4+PiANCj4+Pj4gT2ssIEkgd2lsbCB3YWl0IGZv
ciBmZWVkYmFjayBhbmQgbmV4dCBzZXJpZSB3aWxsIG5vdCBpbmNsdWRlIHRoaXMgcGF0Y2ggYW55
bW9yZS4NCj4+PiANCj4+PiBXb3VsZCBpdCBiZSB3b3J0aCBrZWVwaW5nIGp1c3QgdGhlIHBhcnQg
dGhhdCBzYW5pdGl6ZXMgY3RyLCB3aXRob3V0IGFueQ0KPj4+IG9mIHRoZSBlbXVsYXRpb24gc3R1
ZmY/IFRoYXQgd2F5IHdlIGNvdWxkIHN0aWxsIGRldGVjdCBjYXNlcyB3aGVyZSB0aGVyZQ0KPj4+
IGlzIGEgbWlzbWF0Y2ggYmV0d2VlbiBDUFVzLCBwcmludCBhIHVzZWZ1bCBtZXNzYWdlIGFuZCB0
YWludCBYZW4uDQo+PiBUaGF04oCZcyBhIGdvb2QgaWRlYSwgaXQgbWVhbnMgcmVtb3ZpbmcgdGhl
IGVtdWxhdGlvbiBwYXJ0IGFuZCBqdXN0IGtlZXAgdGhlIHNhbml0aXphdGlvbi4NCj4+IEBKdWxp
ZW46IHdvdWxkIHlvdSBiZSBvayB3aXRoIHRoYXQgPw0KPiANCj4gSSBhY3R1YWxseSB0aG91Z2h0
IGFib3V0IHN1Z2dlc3RpbmcgaXQgYmVmb3JlIFN0ZWZhbm8gZGlkIGl0LiBTbyBJIGFtIE9LIHdp
dGggdGhhdC4NCj4gDQo+PiBTaG91bGQgSSBzZW5kIGEgdjQgb3Igc2hvdWxkIHdlIHVzZSBTdGVm
YW5v4oCZcyBwYXRjaCBkaXJlY3RseSBpbnN0ZWFkID8NCj4gDQo+IEkgd291bGQgc3VnZ2VzdCB0
byBzZW5kIGEgdjQuIFRoaXMgbmVlZHMgYSBzaWduZWQtb2ZmLWJ5IGZyb20gU3RlZmFubyBhbmQg
YSBuZXcgY29tbWl0IG1lc3NhZ2UuDQoNCk9rIEkgd2lsbCBkbyB0aGF0IGJlZ2lubmluZyBvZiBu
ZXh0IHdlZWsuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0g
DQo+IEp1bGllbiBHcmFsbA0KDQo=

