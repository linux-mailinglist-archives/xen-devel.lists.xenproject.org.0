Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CD5480EEC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 03:30:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252283.433281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2Oi8-0000py-W0; Wed, 29 Dec 2021 02:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252283.433281; Wed, 29 Dec 2021 02:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2Oi8-0000oE-OA; Wed, 29 Dec 2021 02:29:04 +0000
Received: by outflank-mailman (input) for mailman id 252283;
 Wed, 29 Dec 2021 02:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h/ph=RO=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1n2Oi7-0000o8-CN
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 02:29:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13bb6f98-684f-11ec-bb0b-79c175774b5d;
 Wed, 29 Dec 2021 03:28:59 +0100 (CET)
Received: from DB7PR05CA0065.eurprd05.prod.outlook.com (2603:10a6:10:2e::42)
 by AS8PR08MB5928.eurprd08.prod.outlook.com (2603:10a6:20b:29b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Wed, 29 Dec
 2021 02:28:56 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::a8) by DB7PR05CA0065.outlook.office365.com
 (2603:10a6:10:2e::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.13 via Frontend
 Transport; Wed, 29 Dec 2021 02:28:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4823.18 via Frontend Transport; Wed, 29 Dec 2021 02:28:56 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Wed, 29 Dec 2021 02:28:56 +0000
Received: from 38e59636ea68.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 47D51B2F-D8D2-4B29-BC31-CAB28FC9013F.1; 
 Wed, 29 Dec 2021 02:28:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 38e59636ea68.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Dec 2021 02:28:50 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by PAXPR08MB7202.eurprd08.prod.outlook.com (2603:10a6:102:209::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 02:28:49 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::14a4:bbac:9e52:a89]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::14a4:bbac:9e52:a89%6]) with mapi id 15.20.4844.014; Wed, 29 Dec 2021
 02:28:49 +0000
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
X-Inumbo-ID: 13bb6f98-684f-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqIjpt+Lo1WS1ArXfp9rMC6n5O2NRAcyibnwL//dBhE=;
 b=Psbf8bml0l3x6a+cRrqkjaLMGipPj9gyh/s+6P0bcAiRhlZomrxIXyJt74NL8mh+tbeuav9HeqKlVZGfmun1lDBziUq2EpA/csKnPCm5pLoqNkOQM7D5/l/GHZgudxaXLWRa/wLUU+GiDYz9IDei3AAztVOwgxjl0KN67B+xF/A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOJ1UzpW67oH94EgEMH/jfDaPxi7hIblYXpvri9BqyRC0YXcYvPO+c5wIDwV9GPhFC9tmmEHfzjiSqXf+GklCQgocMD0Fc8pzDfLcZEKqdd4yYFvqlcStzmUpAKHmzeXNvlOa1BgAEP3QlZLr0c2a7MbmTvtE3c6BN2dfdUtFICx9BvNSN/gl299ua11kdGJCafQhq9MiAm7GD7dLYui9xRDPlX0rNMckfzKNzyX7CesA1fj4Cs32hW7xYshy9gR5oyDc7udIzHxVSbmFRwdHLEHaTZnsS2AmFZ+s5sWrRccOkKcC/6nj2KCGCQaTrIgE4Ad+nGySen7Jt9g/Y0VeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqIjpt+Lo1WS1ArXfp9rMC6n5O2NRAcyibnwL//dBhE=;
 b=fV4cbMggERNddY7qpCWIi4q5NbnPhRFQcNO1k/iPeiG5I5nmBnhtSKlN7O8jXj0df67N8vqrT24pyDxG5LGusq91JJfPIQCMTERfcj5I5hA76U9sRFexEq2PMBNrDS6vNJNXDZr8LuKhRWqA0xo84ca6FZCTLhpoBDG0WWAY1WuWdTMnPQLoWCFKaorQ0AH4k6hkhq69FSWwpCjpsUtcvPICII35kVuy0SqgfN++6FgcrkS5izjip9o82GF7YCuHhq/zuoolCF+QvGl52ab54CdnEUTed66sYeOEy4L+26aVPeYZVum5lhVgoNFG7UtSreXTNUilO33KrVephVuGTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqIjpt+Lo1WS1ArXfp9rMC6n5O2NRAcyibnwL//dBhE=;
 b=Psbf8bml0l3x6a+cRrqkjaLMGipPj9gyh/s+6P0bcAiRhlZomrxIXyJt74NL8mh+tbeuav9HeqKlVZGfmun1lDBziUq2EpA/csKnPCm5pLoqNkOQM7D5/l/GHZgudxaXLWRa/wLUU+GiDYz9IDei3AAztVOwgxjl0KN67B+xF/A=
From: Wei Chen <Wei.Chen@arm.com>
To: Ayan Kumar Halder <ayan.halder.arm@gmail.com>,
	"julien.grall.oss@gmail.com" <julien.grall.oss@gmail.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: Trying to boot xen on Raspberry-pi 3 B+
Thread-Topic: Trying to boot xen on Raspberry-pi 3 B+
Thread-Index: AQHX++2COlXdxXWyoECa4qN3vDrNSqxIvyAA
Date: Wed, 29 Dec 2021 02:28:48 +0000
Message-ID:
 <PAXPR08MB7420BE81CFDF0F95CF20477B9E449@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <ed00e7a6-ed75-5101-0dd1-a5f156aeb68f@gmail.com>
In-Reply-To: <ed00e7a6-ed75-5101-0dd1-a5f156aeb68f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E606EE9BEB5DB846AB79C63F32DD8876.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 08d40724-0944-4706-3640-08d9ca72f695
x-ms-traffictypediagnostic:
	PAXPR08MB7202:EE_|DB5EUR03FT029:EE_|AS8PR08MB5928:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB592827C790BF4CD7367DFA579E449@AS8PR08MB5928.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YdxjmjgDmMvcdZTySm/RywOHj6BUuVhyptQdfBrIqTo3y0HMlhAAmHgQ21KkjDYMpUDYjZELKlIMVgONhdxQtjd/gdsxofmQSSHqooCnmxS+FaT2O/F0EUYkXnDeOwuWh+PbwlkK3NXkP//j6phHpoJ375hbsW+ySc2XaIHW/NopOqEjvZR6bCWlqa3/QLPPzLt2iP7rnZ//2hjjYyds9mIHRdsGR5f/2soZ8FWfhxR9QFwmske9e1+8ADokFHGdDww5hmlLycrqnZs32TUUC0xCtYOfj2P6e11RICR4D46fuWqXbtnNYhvj88veCXlMPuhvTBXfs+zotdU4HY90SpVt/KkfmTT/U2RKBIpSIghCJO/KB7/UdL8XvdFVqslAhjDNRyPLoNpVda2173oNlHV7tkQyq6HdlAYbLv7o0d6gvBYkUwIASck7MMPVhIK+SwCRAEatonPBJZ6luqnwoK7asjuGkeZkffKGfuXlqmfE3Q9aMcqLZSP2eInLUfuSPYl3JNxVZ2/f3lNi9MdZs/jKnXvalbLp+zz+2/IT0k2bDR7wWsMyaLc+XIL6rYn8331NAmZXSgthesPmWPOLq/Fer1wwWDz+OlOPPxs0FfsI12ampE9gL27JO5Kl6Aq+Xl+xJWGgJPjOQG6rBsLTiN5cf8Bcbv0Xnr14/ChxxyneaZ0E+Ff8J2eWdpCOYfjAVED75KHef4UXbbV0c/+cpqwfCnT+c0bFotP8rX3OgVsvxQlGdlOQAgjHLhNVMspm4tlFUPoFIPxaHy7GeKKAQdYy6WSWkSmoavAGKt8YlB4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(52536014)(2906002)(66476007)(76116006)(7696005)(66946007)(33656002)(9686003)(8676002)(55016003)(5660300002)(38100700002)(71200400001)(122000001)(6506007)(53546011)(83380400001)(508600001)(86362001)(316002)(26005)(186003)(966005)(110136005)(8936002)(4326008)(66446008)(64756008)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7202
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a85292d7-d188-4a91-f159-08d9ca72f25d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q7pB5XKe+iDPvICNxXLUzKHPKcsQjWriMOF4A0QvqLl0YDtZI8xBmb68sAAUeCMskCaEOiWLrT4ULf566lhT6aMZSWtuTc8pW/nZrq6E/iaXodbGJp6b7oPdlDQnJTExHEARgQIo2Vve4TkC0NpLC3o4Z5mljctHl6ZWiIZW1QouAm63e29E3QQL8UHlcHN71StiAFXMKSfXf7zBIoPMD7p6G9Q8aC87EGwD7Aa0rakgxw7hmm0+1PVyttmIHG+HolCY0466Pwr2HVtq9XuD/TUJSrgjw8EzgU5no2QMSELSKf1qSB9Kw1b5YQ3Xdv3NU7HQjApnqqOveS/Spj8YqRZYtn5dQ1iN7W+ZcwmuY1V+vTMrkV96PrM0Dh2ooFUV3a/3/PV3gXaCaOHUqR+PjfIra2cfCXOEp5juHIphlj/jNVQtZI6rMSOJsFwl0C5hOJG0rtr/UQQKa6MYMu11BpNJg9XCfOEtrHGnpFCQt3XF/myR5kVrU3wYKrvmeEM/A5VzD78Jt5xfFeLf0fCVRryKpUGOqz+Y9WPb2Z3Uc8xLE2MdZmsKEfgF7o23sGNrJQ6+jLj9U6qWmOICbhDe6bxx9gMCqnyG1tHfw2qNJyAPr1UxVPNyeRbtnbwgfm2An3WPB3lzUDpWWqkG40kzBmfd9azqusncubRymqWUiQWwkEcFbka46GK9umqBaIKW0njtcH2eLEeac5iI6xYvOZv9CBqHQ3kz8JZDiR+fbPON5dxC9M300QWfctOd6+1X54OrPfRJnV5gWKmsi+If2mIC0kYipmDSRZVRnMMO4Tk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(55016003)(356005)(7696005)(8936002)(36860700001)(4326008)(110136005)(316002)(2906002)(52536014)(508600001)(70586007)(70206006)(9686003)(33656002)(5660300002)(83380400001)(6506007)(81166007)(186003)(336012)(26005)(82310400004)(47076005)(8676002)(966005)(53546011)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2021 02:28:56.1535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d40724-0944-4706-3640-08d9ca72f695
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5928

SGkgQXlhbiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2
ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2Yg
QXlhbg0KPiBLdW1hciBIYWxkZXINCj4gU2VudDogMjAyMeW5tDEy5pyIMjjml6UgMjE6MTkNCj4g
VG86IGp1bGllbi5ncmFsbC5vc3NAZ21haWwuY29tOyBCZXJ0cmFuZCBNYXJxdWlzDQo+IDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbTsNCj4gc3N0
YWJlbGxpbmlAa2VybmVsLm9yZw0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
DQo+IFN1YmplY3Q6IFRyeWluZyB0byBib290IHhlbiBvbiBSYXNwYmVycnktcGkgMyBCKw0KPiAN
Cj4gSGksDQo+IA0KPiBJIGFtIHRyeWluZyB0byBib290IHhlbiBvbiBSYXNwYmVycnktcGkgMyBC
KyBhcyBteSBob2JieSBwcm9qZWN0IHRvDQo+IGxlYXJuIGFib3V0IFhlbi4NCj4gDQo+IEkgdXNl
ZCB0aGUgbGF0ZXN0IHZlcnNpb24gb2YgeGVuDQo+IChmMWUyNjhiOWZkMTM2NDdlMWY2OWM4Y2Uw
YWU3YmU0MDFkMzE5ZmM4KS7CoCBJIHRyaWVkIHVzaW5nDQo+IHRpbnk2NF9kZWZjb25maWcgYW5k
IGJ1aWx0IHhlbi00LjE3LXVuc3RhYmxlLiBBbHNvIEkgZW5hYmxlZCBwcmludGsgYW5kDQo+IHNl
dCAweDdlMjE1MDQwIGFzIHRoZSBlYXJseSBwcmludGsgcGh5c2ljYWwgYmFzZSBhZGRyZXNzICgw
eDdlMjE1MDQwKS4NCj4gDQo+IFRoZW4sIEkganVzdCB0cmllZCB0byBsb2FkIHhlbiBhbmQgZHRi
ICh0aGUgc2FtZSB3aGljaCBoYXMgd29ya2VkIGZpbmUNCj4gZm9yIGxpbnV4KS4gSG93ZXZlciwg
dGhlcmUgaXMgbm8gcHJpbnRzIGFmdGVyICJTdGFydGluZyBrZXJuZWwgLi4uIi4NCj4gDQo+IDEu
IERvIHlvdSBrbm93IGlmIHRoZXJlIGlzIHNvbWV0aGluZyBJIGFtIG1pc3NpbmcgPyBJIGFtIGV4
cGVjdGluZyB0bw0KPiBzZWUgdGhlIFhlbiBlYXJseXByaW50ayBsb2dzLg0KPiANCj4gMi4gSXMg
cmFzcGJlcnJ5IDMgQisgZXhwZWN0ZWQgdG8gd29yayB3aXRoIFhlbiA/IEkgd2FzIHJlYWRpbmcN
Cj4gaHR0cHM6Ly93d3cubGludXguY29tL2ZlYXR1cmVkL3hlbi1vbi1yYXNwYmVycnktcGktNC1h
ZHZlbnR1cmVzLyBhbmQgaXMNCj4gbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0IHRoYXQgb25seSBQ
aSA0IGlzIHN1cHBvcnRlZCA/DQo+IA0KDQpJdCBzZWVtcyByYXNwYmVycmllcyAzIEIrIGRvZXNu
J3QgaGF2ZSBHSUMgaW50ZXJydXB0IGNvbnRyb2xsZXIuDQpJZiB5ZXMsIEkgdGhpbmsgeW91IGNh
bid0IG1ha2UgWGVuIHdvcmsgcHJvcGVybHkgb24gcmFzcGJlcnJpZXMgMyBCKy4NCkJlY2F1c2Ug
WGVuIG9ubHkgc3VwcG9ydHMgR0lDIGZvciBBcm0gYXJjaGl0ZWN0dXJlcy4NCg0KPiBLaW5kIHJl
Z2FyZHMsDQo+IA0KPiBBeWFuDQo+IA0KDQo=

