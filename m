Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AC57288DD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 21:43:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545433.851868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7LXJ-0004Kx-F7; Thu, 08 Jun 2023 19:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545433.851868; Thu, 08 Jun 2023 19:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7LXJ-0004IK-Bp; Thu, 08 Jun 2023 19:43:09 +0000
Received: by outflank-mailman (input) for mailman id 545433;
 Thu, 08 Jun 2023 19:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjZV=B4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q7LXH-0004IE-CC
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 19:43:07 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe16::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b014fc08-0634-11ee-b232-6b7b168915f2;
 Thu, 08 Jun 2023 21:43:06 +0200 (CEST)
Received: from DB6PR07CA0073.eurprd07.prod.outlook.com (2603:10a6:6:2b::11) by
 AM8PR08MB5588.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 19:43:00 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::bb) by DB6PR07CA0073.outlook.office365.com
 (2603:10a6:6:2b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Thu, 8 Jun 2023 19:43:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.26 via Frontend Transport; Thu, 8 Jun 2023 19:43:00 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Thu, 08 Jun 2023 19:43:00 +0000
Received: from 163b0a1ce422.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4778FB78-45F0-4E51-84F6-9C2F9CD2E474.1; 
 Thu, 08 Jun 2023 19:42:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 163b0a1ce422.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Jun 2023 19:42:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB9123.eurprd08.prod.outlook.com (2603:10a6:102:343::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 19:42:15 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::ed0b:5730:a1f9:577b%4]) with mapi id 15.20.6455.037; Thu, 8 Jun 2023
 19:42:15 +0000
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
X-Inumbo-ID: b014fc08-0634-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Srqw9J3xxN6qtCT/cbadtl7Xg9FeM3KiXnaaekfxwik=;
 b=R1nBeFNQp5BIF7vLOUOLc0IBAG9feBBJUwPIewYoaLVm/LXyHNNqxMlVjdAcQvG1fP6aOuqsTfJdY37Sorv3jBAOb+ELI2sfcaC3hpnpPr9DVEhHtSI7nNF0J9JrvX3JM7/hcgcQQbOcuPF1h8bLvpdgyWHGBOBPeChDObT1+ho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8c46adcc2f0b95bd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G9lJ5YK63V+HDvw67+RGv0Bviv7JPZ7APWP/HZcos2LayrpHRXmgxnEzA1dWd2bXJk+UmQJpFrvDf6Bzasfvsn7x32OZGQWh1I1Xr1KXTAQjFllsoXobe2SaUq6UokNe6DcrG8YBTqX8Bviv2A00tRUQJhWelnYzT9Dnp5qf7G8nwIZdu2nvcErzahspiBccMEiJMK02h1N8T7u1afASJMXkYWOhvofP46aQ5Y4XmeAeMfsKGO7qfxnxawMwQ98ROnj504f0eKUIg3qVaWmgJWxyXqMoyTclrs30tcwyxyilNl0YClvm1fwpHwASPlSp5+Us9rIUNO45BdIGTfHONQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Srqw9J3xxN6qtCT/cbadtl7Xg9FeM3KiXnaaekfxwik=;
 b=EZPnS9a4ApjshWevgFQe9wki6IODIL2ao9TumOWVNJvQInG/U1DYiUEgddlXvnfkt0stOBr69/wDDYPXd1MUbPeBc4JA6OaDDN6qWyETfy0GMcdpJ0A58yCZD20Cz80WLMGKHqDzUdFK2sepHtKAZ20i1uqlFs19lD/W0Ht1KQkqIWMYS+436UVfI5UwmdD4YdVA0+mxjoKnaI/KK40VlbnQHBWBAQM1fRpB7MYKbUOD8Vkp9eP9O62McFJ3uNcwJqKJJgrXpshgqssu2wY5QbqVr6hW9L24z45eibfRBav42Vea5TmXyZxlxt46lZoJz+Vaixs/ign3eex2wPmHNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Srqw9J3xxN6qtCT/cbadtl7Xg9FeM3KiXnaaekfxwik=;
 b=R1nBeFNQp5BIF7vLOUOLc0IBAG9feBBJUwPIewYoaLVm/LXyHNNqxMlVjdAcQvG1fP6aOuqsTfJdY37Sorv3jBAOb+ELI2sfcaC3hpnpPr9DVEhHtSI7nNF0J9JrvX3JM7/hcgcQQbOcuPF1h8bLvpdgyWHGBOBPeChDObT1+ho=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, =?utf-8?B?RWR3aW4gVMO2csO2aw==?=
	<edwin.torok@cloud.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: Re: [PATCH] tools/ocaml/xc: Fix xc_physinfo() bindings
Thread-Topic: [PATCH] tools/ocaml/xc: Fix xc_physinfo() bindings
Thread-Index: AQHZmkAheWFMmzgfmUmnydtfr7bB9K+BThkA
Date: Thu, 8 Jun 2023 19:42:15 +0000
Message-ID: <4C12184F-18A3-4499-9CB3-183E1AF709B3@arm.com>
References: <20230608193312.2520222-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230608193312.2520222-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB9123:EE_|DBAEUR03FT028:EE_|AM8PR08MB5588:EE_
X-MS-Office365-Filtering-Correlation-Id: 180aa5da-0d7d-4774-f716-08db6858911b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cTKt79URDgD9irfkVIf54/NvrjYEYQ9V7UdrGRpfVzjvPdd38H6bkCykHVBywNwTJZ2goqDWxc7RhhKhH46BATbRojyIMTJa8rjJanV9qceuOofYyqko65TVJyp35o4vWNhWCCWZHOwl5UrYMNypFEfjJ6wcUYhEDNq7SqcK6B5OV1OSVJBa8t9cSwO6zRfXNI/snnLm9HZoQ1F64xr/4K1A4U9T/ZXy+5PqI9VJNeCCOCZRhDl2hU1jjjfOIPkAoRrBQVWinrQ4LilgkxPKTegpVWA2eXmLvwbz5at7cxUWCZuaexQ+gCLdnRMjSNIYTXWpmzsk1deVzepI1fQUjNvYk9yUvwE0DnE9qvqiKNGap2IKg8uBNsU4HE81XeJetK1cM9yGZkSX/jhWzX+bH8/dYrl4N3hgZWotlU7BPP+QzTs8mkwptZfNWwOTgoktrC/VlL+sq03GH2/0ArcJ3NABsX5HjUsTSiWYRcomaUv2Mqkm9ZKb5yxuxluZFVXOj9GYduFIZH6v2zcC8bGn7jbw3S1/gmPehkF1INW++fOzjeFWV524Ky+aV7lWYese0UzGjs6/idch1HTGT5S68Fr9HVoC6vbdT9ttkgpP8QuVTFcObeaKRlXfu4jTVlOYk60VoQ7eEETzq+0DJ36pbg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(451199021)(4326008)(6916009)(8676002)(66946007)(8936002)(91956017)(66476007)(66556008)(76116006)(36756003)(6486002)(478600001)(64756008)(86362001)(316002)(41300700001)(66446008)(83380400001)(5660300002)(54906003)(71200400001)(33656002)(2906002)(38070700005)(186003)(53546011)(38100700002)(122000001)(2616005)(6512007)(6506007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B694E8AB86004347A785DA09E34189FA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9123
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4cf63de4-3768-40d8-c494-08db68587638
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hpBwsdRQp5z7gJl++LJIX2lH6AIauUNDpeeS8DGeq3q57cf6sgsZxjBnymBetQ21BdVHw/6JzhG6LhcXJRrEi5mTDkUqD8FPnwLCHT/SRoLRSA/TyxKCaJ5IejXAqYMqTl9Kp7VAbSdjAO1YhTfdmM9QASr0yJreNBHxjg17DkOEOuZGvFFZDnfitwMl9szwn/jZyb9wJzDgHS+l8gtvOwea1RADKGgWgUJUF0H3iik1qQb+YZf+0UEX2/9WYViilsqAUbFfbIvS4ejg4xAsnFzGFi/iWnr4FwBcFt+IDGSvRGMObvJXJubpMUFLOUeeqBL1p6EmRFJmKNsWyO72zanY+GLK75DcXezBIrTXEH36t36f+booeenOOugZEcwEEjED0VOhOhNLJcRbZ+zarfgYqxzFZpTx6dDHlWcNRJplLO/d9AOBVH4mqJt25MP5XxyyPfTEtt6j3PWO08ShCkKDVRK0t5BWdPWwbV9tE+Zi5/RtWrQbSciJoKNHVyvcxjIVeo9pgPvUdMIvHXJ+HzAxF1lpgIvvuHACMFgyTCF/LG5PnACZUUb1V8Yv9jcVGJyq0EPAhJj2OSyMtyL3E1ss+ycUtTE1p7VrWl3riBNZSCpKkzteZzGcAMWHZLA1/MqNy009IjGiBM7mGc8UtU1ngfiqoAL6pbgMS5nJDpTGLV2mXSxNN+q+R3GcCh4O0qUciBTG+I+14OMQzXNaDEmazzh3RSeb/7qbvbrEu48nQAWsYHNtCAxt13x7mzH5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(107886003)(186003)(26005)(6506007)(53546011)(6512007)(2616005)(336012)(83380400001)(47076005)(82310400005)(86362001)(36860700001)(2906002)(54906003)(6486002)(36756003)(8676002)(82740400003)(478600001)(6862004)(33656002)(40480700001)(5660300002)(41300700001)(40460700003)(4326008)(356005)(8936002)(81166007)(70206006)(70586007)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 19:43:00.3840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 180aa5da-0d7d-4774-f716-08db6858911b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5588

DQoNCj4gT24gOCBKdW4gMjAyMywgYXQgMjA6MzMsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gVGhlIG9yaWdpbmFsIGNoYW5nZSBkb2Vzbid0
IGNvbXBpbGUgb24gQVJNOg0KPiANCj4gIHhlbmN0cmxfc3R1YnMuYzogSW4gZnVuY3Rpb24gJ3N0
dWJfeGNfcGh5c2luZm8nOg0KPiAgeGVuY3RybF9zdHVicy5jOjgyMToxNjogZXJyb3I6IHVudXNl
ZCB2YXJpYWJsZSAnYXJjaF9jYXBfZmxhZ3NfdGFnJyBbLVdlcnJvcj11bnVzZWQtdmFyaWFibGVd
DQo+ICAgIDgyMSB8ICAgICAgICAgaW50IHIsIGFyY2hfY2FwX2ZsYWdzX3RhZzsNCj4gICAgICAg
IHwgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+DQo+ICBjYzE6IGFsbCB3YXJuaW5n
cyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycw0KPiANCj4gYnV0IGl0IHdhcyBidWdneSB0b28uDQo+
IA0KPiBGaXJzdCwgaXQgdHJpZWQgc3RvcmluZyBhbiBpbnQgaW4gYSBwb2ludGVyIHNsb3QsIGNh
dXNpbmcgaGVhcCBjb3JydXB0aW9uLg0KPiANCj4gTmV4dCwgaXQgaXMgbm90IGxlZ2l0aW1hdGUg
dG8gZXhjbHVkZSBhcm0zMiBpbiB0aGUgdG9vbHN0YWNrIGFzIGl0IGV4cGxpY2l0bHkNCj4gY2Fu
IG9wZXJhdGUgYW4gYXJtNjQgdG9vbHN0YWNrIGFuZCBidWlsZCBhcm02NCBkb21haW5zLiAgVGhh
dCBpbiB0dXJuIG1lYW5zDQo+IHRoYXQgeW91IGNhbid0IHN0YXNoIGEgQyB1aW50MzJfdCBpbiBh
biBPQ2FtbCBpbnQuDQo+IA0KPiBSZXdyaXRlIHRoZSBhcmNoX2NhcGFiaWxpdGllcyBoYW5kbGlu
ZyBmcm9tIHNjcmF0Y2guICBCcmVhayBpdCBvdXQgaW50byBhDQo+IHNlcGFyYXRlIGZ1bmN0aW9u
LCBhbmQgbWFrZSB0aGUgY29uc3RydWN0aW9uIG9mIGFyY2hfcGh5c2luZm9fY2FwX2ZsYWdzIGNv
bW1vbg0KPiB0byBwcmV2ZW50IG90aGVyIGluZGlyZWN0aW9uIGJ1Z3MuDQo+IA0KPiBSZWludHJv
ZHVjZSBhcm1fcGh5c2luZm9fY2FwcyB3aXRoIHRoZSBmaWVsZHMgYnJva2VuIG91dC4NCj4gDQo+
IEZpeGVzOiA1NmE3YWFhMTZiZmUgKCJ0b29sczogYWRkIHBoeXNpbmZvIGFyY2hfY2FwYWJpbGl0
aWVzIGhhbmRsaW5nIGZvciBBcm0iKQ0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxh
bmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiAtLS0NCj4gQ0M6IENocmlzdGlhbiBMaW5kaWcg
PGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4NCj4gQ0M6IEVkd2luIFTDtnLDtmsgPGVkd2lu
LnRvcm9rQGNsb3VkLmNvbT4NCj4gQ0M6IFJvYiBIb2VzIDxSb2IuSG9lc0BjaXRyaXguY29tPg0K
PiBDQzogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiANCj4gUkZDIC0g
dW50ZXN0ZWQgYmVjYXVzZSBJJ20gZmFpbGluZyBhdCBjcm9zcy1jb21waWxpbmcgQVJNIE9jYW1s
LCBidXQgc3RhZ2luZw0KPiBoYXMgYmVlbiBicm9rZW4gdG9vIGxvbmcuLi4NCg0KVGhhbmsgeW91
IGZvciB0aGlzIHBhdGNoLCBJ4oCZbGwgdHJ5IGluIHRoZSBuZXh0IGRheXMgdG8gYnVpbGQgaXQg
Zm9yIEFybQ0KDQo+IC0tLQ0KPiB0b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwgICAgICB8
ICA3ICsrKy0NCj4gdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saSAgICAgfCAgNyArKyst
DQo+IHRvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybF9zdHVicy5jIHwgNTIgKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0NCj4gMyBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCAx
OCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hl
bmN0cmwubWwgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwNCj4gaW5kZXggYmYyM2Nh
NTBiYjE1Li5kNmM2ZWI3M2RiNDQgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL29jYW1sL2xpYnMveGMv
eGVuY3RybC5tbA0KPiArKysgYi90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwNCj4gQEAg
LTEyOCwxMCArMTI4LDE1IEBAIHR5cGUgcGh5c2luZm9fY2FwX2ZsYWcgPQ0KPiAgIHwgQ0FQX0du
dHRhYl92MQ0KPiAgIHwgQ0FQX0dudHRhYl92Mg0KPiANCj4gK3R5cGUgYXJtX3BoeXNpbmZvX2Nh
cHMgPQ0KPiArICB7DQo+ICsgICAgc3ZlX3ZsOiBpbnQ7DQo+ICsgIH0NCj4gKw0KPiB0eXBlIHg4
Nl9waHlzaW5mb19jYXBfZmxhZw0KPiANCj4gdHlwZSBhcmNoX3BoeXNpbmZvX2NhcF9mbGFncyA9
DQo+IC0gIHwgQVJNIG9mIGludA0KPiArICB8IEFSTSBvZiBhcm1fcGh5c2luZm9fY2Fwcw0KPiAg
IHwgWDg2IG9mIHg4Nl9waHlzaW5mb19jYXBfZmxhZyBsaXN0DQo+IA0KPiB0eXBlIHBoeXNpbmZv
ID0NCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkgYi90b29s
cy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpDQo+IGluZGV4IGVkMWUyOGVhMzBhMC4uM2JmYzE2
ZWRiYTk2IDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpDQo+
ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkNCj4gQEAgLTExMywxMCArMTEz
LDE1IEBAIHR5cGUgcGh5c2luZm9fY2FwX2ZsYWcgPQ0KPiAgIHwgQ0FQX0dudHRhYl92MQ0KPiAg
IHwgQ0FQX0dudHRhYl92Mg0KPiANCj4gK3R5cGUgYXJtX3BoeXNpbmZvX2NhcHMgPQ0KPiArICB7
DQo+ICsgICAgc3ZlX3ZsOiBpbnQ7DQo+ICsgIH0NCj4gKw0KPiB0eXBlIHg4Nl9waHlzaW5mb19j
YXBfZmxhZw0KPiANCj4gdHlwZSBhcmNoX3BoeXNpbmZvX2NhcF9mbGFncyA9DQo+IC0gIHwgQVJN
IG9mIGludA0KPiArICB8IEFSTSBvZiBhcm1fcGh5c2luZm9fY2Fwcw0KPiAgIHwgWDg2IG9mIHg4
Nl9waHlzaW5mb19jYXBfZmxhZyBsaXN0DQo+IA0KPiB0eXBlIHBoeXNpbmZvID0gew0KPiBkaWZm
IC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgYi90b29scy9vY2Ft
bC9saWJzL3hjL3hlbmN0cmxfc3R1YnMuYw0KPiBpbmRleCBhMDNkYTMxZjZmMmMuLjZiMjg2OWFm
MDRlZiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMN
Cj4gKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsX3N0dWJzLmMNCj4gQEAgLTgxMiwx
MyArODEyLDQ2IEBAIENBTUxwcmltIHZhbHVlIHN0dWJfeGNfc2VuZF9kZWJ1Z19rZXlzKHZhbHVl
IHhjaF92YWwsIHZhbHVlIGtleXMpDQo+IENBTUxyZXR1cm4oVmFsX3VuaXQpOw0KPiB9DQo+IA0K
PiArQ0FNTHByaW0gdmFsdWUgcGh5c2luZm9fYXJjaF9jYXBzKGNvbnN0IHhjX3BoeXNpbmZvX3Qg
KmluZm8pDQo+ICt7DQo+ICsgQ0FNTHBhcmFtMCgpOw0KPiArIENBTUxsb2NhbDIoYXJjaF9jYXBf
ZmxhZ3MsIGFyY2hfb2JqKTsNCj4gKyBpbnQgdGFnID0gLTE7DQo+ICsNCj4gKyNpZiBkZWZpbmVk
KF9fYXJtX18pIHx8IGRlZmluZWQoX19hYXJjaDY0X18pDQo+ICsNCj4gKyB0YWcgPSAwOyAvKiB0
YWcgQVJNICovDQo+ICsNCj4gKyBhcmNoX29iaiA9IGNhbWxfYWxsb2NfdHVwbGUoMSk7DQo+ICsN
Cj4gKyBTdG9yZV9maWVsZChhcmNoX29iaiwgMCwNCj4gKyAgICBWYWxfaW50KE1BU0tfRVhUUihp
bmZvLT5hcmNoX2NhcGFiaWxpdGllcywNCj4gKyAgICAgIFhFTl9TWVNDVExfUEhZU0NBUF9BUk1f
U1ZFX01BU0spICogMTI4KSk7DQo+ICsNCj4gKyNlbGlmIGRlZmluZWQoX19pMzg2X18pIHx8IGRl
ZmluZWQoX194ODZfNjRfXykNCj4gKw0KPiArIHRhZyA9IDE7IC8qIHRhZyB4ODYgKi8NCj4gKw0K
PiArIGFyY2hfb2JqID0gVGFnX2NvbnM7DQo+ICsNCj4gKyNlbmRpZg0KPiArDQo+ICsgaWYgKCB0
YWcgPCAwICkNCj4gKyBjYW1sX2ZhaWx3aXRoKCJVbmhhbmRsZWQgYXJjaGl0ZWN0dXJlIik7DQo+
ICsNCj4gKyBhcmNoX2NhcF9mbGFncyA9IGNhbWxfYWxsb2Nfc21hbGwoMSwgdGFnKTsNCj4gKyBT
dG9yZV9maWVsZChhcmNoX2NhcF9mbGFncywgMCwgYXJjaF9vYmopOw0KPiArDQo+ICsgcmV0dXJu
IGFyY2hfY2FwX2ZsYWdzOw0KPiArfQ0KPiArDQo+IENBTUxwcmltIHZhbHVlIHN0dWJfeGNfcGh5
c2luZm8odmFsdWUgeGNoX3ZhbCkNCj4gew0KPiBDQU1McGFyYW0xKHhjaF92YWwpOw0KPiAtIENB
TUxsb2NhbDQocGh5c2luZm8sIGNhcF9saXN0LCBhcmNoX2NhcF9mbGFncywgYXJjaF9jYXBfbGlz
dCk7DQo+ICsgQ0FNTGxvY2FsMihwaHlzaW5mbywgY2FwX2xpc3QpOw0KPiB4Y19pbnRlcmZhY2Ug
KnhjaCA9IHhjaF9vZl92YWwoeGNoX3ZhbCk7DQo+IHhjX3BoeXNpbmZvX3QgY19waHlzaW5mbzsN
Cj4gLSBpbnQgciwgYXJjaF9jYXBfZmxhZ3NfdGFnOw0KPiArIGludCByOw0KPiANCj4gY2FtbF9l
bnRlcl9ibG9ja2luZ19zZWN0aW9uKCk7DQo+IHIgPSB4Y19waHlzaW5mbyh4Y2gsICZjX3BoeXNp
bmZvKTsNCj4gQEAgLTg0NiwyMCArODc5LDcgQEAgQ0FNTHByaW0gdmFsdWUgc3R1Yl94Y19waHlz
aW5mbyh2YWx1ZSB4Y2hfdmFsKQ0KPiBTdG9yZV9maWVsZChwaHlzaW5mbywgNywgY2FtbF9jb3B5
X25hdGl2ZWludChjX3BoeXNpbmZvLnNjcnViX3BhZ2VzKSk7DQo+IFN0b3JlX2ZpZWxkKHBoeXNp
bmZvLCA4LCBjYXBfbGlzdCk7DQo+IFN0b3JlX2ZpZWxkKHBoeXNpbmZvLCA5LCBWYWxfaW50KGNf
cGh5c2luZm8ubWF4X2NwdV9pZCArIDEpKTsNCj4gLQ0KPiAtI2lmIGRlZmluZWQoX19pMzg2X18p
IHx8IGRlZmluZWQoX194ODZfNjRfXykNCj4gLSBhcmNoX2NhcF9saXN0ID0gVGFnX2NvbnM7DQo+
IC0NCj4gLSBhcmNoX2NhcF9mbGFnc190YWcgPSAxOyAvKiB0YWcgeDg2ICovDQo+IC0NCj4gLSBh
cmNoX2NhcF9mbGFncyA9IGNhbWxfYWxsb2Nfc21hbGwoMSwgYXJjaF9jYXBfZmxhZ3NfdGFnKTsN
Cj4gLSBTdG9yZV9maWVsZChhcmNoX2NhcF9mbGFncywgMCwgYXJjaF9jYXBfbGlzdCk7DQo+IC0g
U3RvcmVfZmllbGQocGh5c2luZm8sIDEwLCBhcmNoX2NhcF9mbGFncyk7DQo+IC0jZWxpZiBkZWZp
bmVkKF9fYWFyY2g2NF9fKQ0KPiAtIFN0b3JlX2ZpZWxkKHBoeXNpbmZvLCAxMCwgVmFsX2ludChj
X3BoeXNpbmZvLmFyY2hfY2FwYWJpbGl0aWVzKSk7DQo+IC0jZWxzZQ0KPiAtIGNhbWxfZmFpbHdp
dGgoIlVuaGFuZGxlZCBhcmNoaXRlY3R1cmUiKTsNCj4gLSNlbmRpZg0KPiArIFN0b3JlX2ZpZWxk
KHBoeXNpbmZvLCAxMCwgcGh5c2luZm9fYXJjaF9jYXBzKCZjX3BoeXNpbmZvKSk7DQo+IA0KPiBD
QU1McmV0dXJuKHBoeXNpbmZvKTsNCj4gfQ0KPiANCj4gYmFzZS1jb21taXQ6IDY5MTVhMTIwNjQx
YjVkMjMyNzYyYWY3ODgyMjY2MDQ4Y2YwMzljYTANCj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiA4
NWZmYjZjYmUxZGRmZGVjMGFmYjJhYzVjMmNmZDg5MTBkZGZkNzgzDQo+IC0tIA0KPiAyLjMwLjIN
Cj4gDQoNCg==

