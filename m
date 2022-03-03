Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BD74CC231
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 17:05:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283512.482550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnws-0003r8-DW; Thu, 03 Mar 2022 16:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283512.482550; Thu, 03 Mar 2022 16:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnws-0003pA-AO; Thu, 03 Mar 2022 16:05:02 +0000
Received: by outflank-mailman (input) for mailman id 283512;
 Thu, 03 Mar 2022 16:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uwof=TO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nPnwr-0003oJ-3B
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 16:05:01 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad0213ae-9b0b-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 17:04:59 +0100 (CET)
Received: from DU2PR04CA0154.eurprd04.prod.outlook.com (2603:10a6:10:2b0::9)
 by VE1PR08MB5055.eurprd08.prod.outlook.com (2603:10a6:803:115::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 16:04:55 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::e2) by DU2PR04CA0154.outlook.office365.com
 (2603:10a6:10:2b0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Thu, 3 Mar 2022 16:04:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Thu, 3 Mar 2022 16:04:55 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Thu, 03 Mar 2022 16:04:55 +0000
Received: from 499c46db6197.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D4F0479-7FEE-49D3-9605-D9CB4841E83D.1; 
 Thu, 03 Mar 2022 16:04:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 499c46db6197.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Mar 2022 16:04:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6417.eurprd08.prod.outlook.com (2603:10a6:20b:362::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 16:04:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c84a:82d0:c7fd:fc7c]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c84a:82d0:c7fd:fc7c%7]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 16:04:47 +0000
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
X-Inumbo-ID: ad0213ae-9b0b-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlRr7aCU51z2Riu3PuDAKxN3VyMlDlI98DwNYn1Hphg=;
 b=KHVRxJNnFF0boFLYHtCPgTVZTC+NBqYRi5pe9IeMNoxF9S0t9KID0LyC+3s+8i3KrU6HQbqSRxeH8xEQGy5GR9PJuTcoGTPUAeRqBNQG/XTKSjH5QUWjmBpNeQsc4xm4aNCr4/YyCb6dQ+47sjYuhzCbNoH565qOsMVkm8S6Xtc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 66d8bf977dbf74e7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG9CHqGieim8v0Rbjd2niR55F5iUBZsQg6Ie+Wj7pjjRSE62Jm/PX/0j7ctRyxR9TgDtZJr51YhyW6bWflMSMgG5DUa0HQWvegPk3GVB2ZgKmo6kWs7w92Iy7o+k/YhhWnHByxfx9XHYU4Fxmyw7mbbEHuBfc8Jx6ttjIo2/bKoeg5TmODFcLKxYRAtSkI2LLGxmG1ro3kyCu6r21w3M649qLU76vG9l2eLZ38AMdQFes2WWyaNp0QHY4F5Qi4yJ71ny69mQTBBMxBlJ+jAAsFuCWO+G5aziUKTj9b/8fdH1vKBueZ4uGz6mSgd/p32xcbUk4ivbYvEfkjBaxWeEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlRr7aCU51z2Riu3PuDAKxN3VyMlDlI98DwNYn1Hphg=;
 b=l+D3k94QwEFpoAvXmytHlpzbYG/LrPOI3UDacogMR4JYFxkAHat4xWONsfk73qyVxlmCHvPXIGpfW8Va/ruLNFKEDUZOg9mjjPXLub4nS6NriQlEV2gUVRD1gnvoEdfYEgOOSeHgaWQPV78jt8vzOlECrt6jRE9x7v+FA4xaSA7fo6FKtEHTPzDPWDMQXGXVvDNc3LpG4suEpTd3nwFl3ZKh3dfY8ISvNscJs0PkL5pBhVrd50zjcmFGnVriXlHHMlqpjQz6T536kHOxDU7nnmX9MwviIcyBFf4/e2860pcHPE2QAJf8Wa5Ctx0v1y0QGKuLmrOzs3Aw5VFFMXvKrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlRr7aCU51z2Riu3PuDAKxN3VyMlDlI98DwNYn1Hphg=;
 b=KHVRxJNnFF0boFLYHtCPgTVZTC+NBqYRi5pe9IeMNoxF9S0t9KID0LyC+3s+8i3KrU6HQbqSRxeH8xEQGy5GR9PJuTcoGTPUAeRqBNQG/XTKSjH5QUWjmBpNeQsc4xm4aNCr4/YyCb6dQ+47sjYuhzCbNoH565qOsMVkm8S6Xtc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: mm: Encode existing constraints of the memory
 layout
Thread-Topic: [PATCH] xen/arm: mm: Encode existing constraints of the memory
 layout
Thread-Index: AQHYLIr12CXCtSE8aUS3fUoiw1XVAayt17mA
Date: Thu, 3 Mar 2022 16:04:47 +0000
Message-ID: <B4CC57B1-4443-49A4-92FC-25165BEA14CB@arm.com>
References: <20220228100659.58089-1-julien@xen.org>
In-Reply-To: <20220228100659.58089-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: cf311fec-cbe0-4752-2ae6-08d9fd2f8ed1
x-ms-traffictypediagnostic:
	AM8PR08MB6417:EE_|DB5EUR03FT031:EE_|VE1PR08MB5055:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB50559830ABF0E2E30EC998659D049@VE1PR08MB5055.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PHKwWZM7ZuZsnlsbM5potDe8OjcSnwAl9K4N972HDl9TFxUh2HUktR+EpIYqftKT5KeqNjCukjozWe6GO+1YkSh+yv1LnRN8NRzniMjHoPOI1V+E0ZGtC7h0iRj/urXyHVsT3HhvP2PsYoYLSO5S+NpsGjkJktGNviFbgcQ3B1TciwJ0bdW7zSnZneQSbmc8xHDX4DX72h5yjLzJERonUAeALvBuxsJ1ZS8z3cvVdaAB5J/hBCul4LMAPQRYfbXVWblwCzP61SwZXwFVvHr0dgxc1+togpDYoDi0plykvE+UBlqWr3fgoIJT1FxW5vfCN4Za5eqOQsBAfzuUw4DqmKK+EwThzhyr5q7cpl+rMQI23Hlno9lsTmpr784cUDksZ4ms/bEhRHrilsgEAJl7S8GpnDRQqWm0HNMbl0Z7fZ3qUd2PFvfcxYDDoFHWnTZKnDNXEqL82icn/b/8lGA7T/XObuvEmjS4duwIZdJuAFOp8ehCA1qTJgvSCTk63t8srQ5sbfDYTeAo0vBR5TA4S/p8Kzklu98myeiBittfk4BuubaOSNCE/phx5epVt8EOCJuoP21Xn17xIBFgE+SCsF8WqGxzqX8RWJ+fPjTIF56ny0Rtk7+/M6n7+iX7pXi3v2IKiQ+YeyCp1Q20JSKT/fhODKCG5jph/0yCVOj5Tx/qruy+2bWoXLs26hlsYHak3R5+A4NTXgGbZduN7NaNK+SSpBN77G374v/565XT+msOYtJZyCdr1aXSdx4Y8x1H
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(122000001)(8936002)(38070700005)(2616005)(83380400001)(71200400001)(2906002)(36756003)(508600001)(26005)(33656002)(54906003)(91956017)(86362001)(6916009)(53546011)(6512007)(316002)(6506007)(64756008)(66476007)(76116006)(38100700002)(66446008)(5660300002)(66946007)(66556008)(6486002)(4326008)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B8E64D723202543BA0A578D2D86E534@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6417
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f57906f7-cf32-40a3-ad0a-08d9fd2f8a88
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IJcm16ZwdzM68omYFWmWy3ieBR9go1IU54v9M/gLHMzJUDeG5z4bXwHoEOpM6TlLb7nqSlWZtLFQ/OxYYP/Tw8y3+Ir9z3L9DoATGnesBJJZaE+xlIaX88jcl1KFRDvnwL5yK/nDwkK/I7E1WStmn/NF4T8BAfwbK6oXkeRHsuIJbcnua8/YONhrkagAntL3Fb/IDirQmGXwMYU7IOcRW2eXanOuM80pUjIqhRN9Tkn2IVXK80oPrqve/S/6enwc55qIu2YncIW23u5H05c1EuSh9mQ4gg36Sj4SMNSJlWxXqAkkTKwZ3ByBtoFaGk+xCfbxbw3xd76XwXdD4Kg3zy0NusQvU7tlr3jfdHb/Dy9eNF3qa4zCjnHpCcBmCxkaF8tcXBbeDwoZihodu2J75E0/tc9ZndY4qAq+DZ2ber4NR7eiX5ldE8LDqIWPSeoEjwI+exbBYeqMrPMxLDyWGPrOXchpFmHSZxytwvFNMffdUxyeT51eciSKEX+AzCpIsj2LtL8qj/pHj5sNVOTmSVjgwcoxEVll/CNTjvU42ZaxJ1TVqxKmW/NysTqA9TkEBuX4VdEqTPstWl3Zd/KfmywJmTFuzl5HdcrUjTAzDHPI2xrr0Q9QBO8/Du16WhxBOtRbsdeyo/LF9Z9GddT4H5z+PviB6vVxP8XmnfaPjryyQyYaWwftVz0lQqgsAjrO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(316002)(107886003)(26005)(2616005)(36756003)(6512007)(186003)(40460700003)(8676002)(6506007)(2906002)(70206006)(5660300002)(70586007)(53546011)(47076005)(6862004)(336012)(4326008)(81166007)(356005)(36860700001)(8936002)(86362001)(508600001)(33656002)(6486002)(54906003)(83380400001)(82310400004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 16:04:55.0842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf311fec-cbe0-4752-2ae6-08d9fd2f8ed1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5055

SGkgSnVsaWVuLA0KDQo+IE9uIDI4IEZlYiAyMDIyLCBhdCAxMDowNiwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBKdWxpZW4gR3JhbGwgPGpncmFsbEBh
bWF6b24uY29tPg0KPiANCj4gVGhlIGJvb3QgY29kZSBleHBlY3RzIHRoZSByZWdpb25zIFhFTl9W
SVJUX1NUQVJULCBGSVhNQVBfQUREUigwKSwNCj4gQk9PVF9GRFRfVklSVF9TVEFSVCB0byB1c2Ug
dGhlIHNhbWUgMHRoIChhcm02NCBvbmx5KSBhbmQgMXN0IHNsb3QuDQo+IA0KPiBBZGQgc29tZSBC
VUlMRF9CVUdfT04oKSB0byBjb25maXJtIHRoYXQuIFRoaXMgaXMgaGVscGZ1bCBpZiBvbmUgd2Fu
dHMNCj4gdG8gcmUtb3JkZXIgdGhlIG1lbW9yeSBsYXlvdXQuDQoNClZlcnkgZ29vZCBpZGVhIDot
KQ0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29t
Pg0KDQpSZXZpZXdlZC1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0u
Y29tPg0KDQpKdXN0IGEgc21hbGwgTklUIGFmdGVyIGlmIHlvdSB3YW50IHRvIGRvIGl0IG9uIGNv
bW1pdC4uLg0KDQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vbW0uYyB8IDE2ICsrKysrKysrKysrKysr
KysNCj4gMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+IGluZGV4IDhhMTcyMjIx
MDljNi4uNDA0MjNhNzBmMGFlIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0uYw0KPiAr
KysgYi94ZW4vYXJjaC9hcm0vbW0uYw0KPiBAQCAtMjExLDYgKzIxMSwyMiBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgX19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9ucyh2b2lkKQ0KPiAjaWZkZWYg
Q09ORklHX0RPTUFJTl9QQUdFDQo+ICAgICBCVUlMRF9CVUdfT04oRE9NSEVBUF9WSVJUX1NUQVJU
ICYgfkZJUlNUX01BU0spOw0KPiAjZW5kaWYNCj4gKyAgICAvKg0KPiArICAgICAqIFRoZSBib290
IGNvZGUgZXhwZWN0cyB0aGUgcmVnaW9ucyBYRU5fVklSVF9TVEFSVCwgRklYTUFQX0FERFIoMCks
DQo+ICsgICAgICogQk9PVF9GRFRfVklSVF9TVEFSVCB0byB1c2UgdGhlIHNhbWUgMHRoIChhcm02
NCBvbmx5KSBhbmQgMXN0DQo+ICsgICAgICogc2xvdC4NCg0KTklUOiBJIHdvdWxkIGp1c3QgYWRk
IGF0IHRoZSBlbmQgb2YgdGhlIHNlbnRlbmNlIOKAnGluIHRoZSBwYWdlIHRhYmxlcy7igJ0NCg0K
Q2hlZXJzDQpCZXJ0cmFuZA0KDQo+ICsgICAgICovDQo+ICsjZGVmaW5lIENIRUNLX1NBTUVfU0xP
VChsZXZlbCwgdmlydDEsIHZpcnQyKSBcDQo+ICsgICAgQlVJTERfQlVHX09OKGxldmVsIyNfdGFi
bGVfb2Zmc2V0KHZpcnQxKSAhPSBsZXZlbCMjX3RhYmxlX29mZnNldCh2aXJ0MikpDQo+ICsNCj4g
KyNpZmRlZiBDT05GSUdfQVJNXzY0DQo+ICsgICAgQ0hFQ0tfU0FNRV9TTE9UKHplcm9ldGgsIFhF
Tl9WSVJUX1NUQVJULCBGSVhNQVBfQUREUigwKSk7DQo+ICsgICAgQ0hFQ0tfU0FNRV9TTE9UKHpl
cm9ldGgsIFhFTl9WSVJUX1NUQVJULCBCT09UX0ZEVF9WSVJUX1NUQVJUKTsNCj4gKyNlbmRpZg0K
PiArICAgIENIRUNLX1NBTUVfU0xPVChmaXJzdCwgWEVOX1ZJUlRfU1RBUlQsIEZJWE1BUF9BRERS
KDApKTsNCj4gKyAgICBDSEVDS19TQU1FX1NMT1QoZmlyc3QsIFhFTl9WSVJUX1NUQVJULCBCT09U
X0ZEVF9WSVJUX1NUQVJUKTsNCj4gKw0KPiArI3VuZGVmIENIRUNLX1NBTUVfU0xPVA0KPiB9DQo+
IA0KPiB2b2lkIGR1bXBfcHRfd2FsayhwYWRkcl90IHR0YnIsIHBhZGRyX3QgYWRkciwNCj4gLS0g
DQo+IDIuMzIuMA0KPiANCg0K

