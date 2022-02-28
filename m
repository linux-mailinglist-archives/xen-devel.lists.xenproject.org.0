Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C064C63B0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 08:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280164.478005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOaDa-00027y-88; Mon, 28 Feb 2022 07:13:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280164.478005; Mon, 28 Feb 2022 07:13:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOaDa-00025f-3O; Mon, 28 Feb 2022 07:13:14 +0000
Received: by outflank-mailman (input) for mailman id 280164;
 Mon, 28 Feb 2022 07:13:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2oYG=TL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nOaDY-00025Z-Ey
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 07:13:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e247b53b-9865-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 08:13:10 +0100 (CET)
Received: from AS9PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:20b:488::23)
 by DB8PR08MB5340.eurprd08.prod.outlook.com (2603:10a6:10:11c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 07:13:07 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::2c) by AS9PR05CA0024.outlook.office365.com
 (2603:10a6:20b:488::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26 via Frontend
 Transport; Mon, 28 Feb 2022 07:13:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Mon, 28 Feb 2022 07:13:07 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Mon, 28 Feb 2022 07:13:06 +0000
Received: from 91e919b4c17e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FB2FDD8D-721B-4D4E-9BAD-C138DB22849F.1; 
 Mon, 28 Feb 2022 07:12:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 91e919b4c17e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Feb 2022 07:12:56 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by PR2PR08MB4889.eurprd08.prod.outlook.com (2603:10a6:101:1d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 07:12:53 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::41e8:ebec:d794:38aa]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::41e8:ebec:d794:38aa%3]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 07:12:52 +0000
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
X-Inumbo-ID: e247b53b-9865-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp02zjIYeZalTW9b7HYAe4jh3R6FUNgkXVamR1r7uNU=;
 b=HloPZQ+Lq09a9uhZ2fKsCPipivSDmhpLU94NljlrmZ8eLcKzjBBf3qvaLTVmEvmG1A3ieFJ79zivahjnFv07yYKn+/zNTmX+ZNmSlzuEy86F5OxhNRjoazC2BS3es5/AY2t0LJr9MnZynAkXKNbqQfSpz4gsnohPt2/TqM2Cuvw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZ/n/xZhpBHrgQQEhHMt406gpgfun/frvPDZcvN1TFEX1kkLYQkrIP1uDhl+dw/GdEQjPBTu7Y/IUDoB9Rxa9S3VcfvkUWh67XNAEjJD4sdVf8Ye43qonuyPv+UuP6hbnbpT4fSwP/lYmyElES2chBHpNTyNBlGbIBBOMT+ITdEdiY1+O76QEC8KHImGLra1ZamG3Xk08fyF9yQkgAm4/tYN6RtmRPrxSxxQ0XcbqywyQ+Ywa8ip0TPpwEPFJbuWinHUE7NNl7AwqqEnZbnVC+lOXAos3O8fwxQMAgg73hgGo1Dh/Iqr/7hHP2IMxrii3+Me85eWieZpsdnKTbpaow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp02zjIYeZalTW9b7HYAe4jh3R6FUNgkXVamR1r7uNU=;
 b=Ep3PTx6/gTBJLyqRD/UFupW9jLzufB04lx+RqA2q1IfUbzpdCovAWflSk+NLd2AJXzRwcCMwXb5a+7kjn/9EPR+n4+l3jI1+Lvtj7IyWXFvmANO3UYrRMocg4+FTGyhqYxh6rgzINTFhX15p2ZWFWVqcK1ena/P0fvo+1g5D955IKG2vg5jj22eilQBf4x51+Cvawbpgk5nH9jAUFiDJnquFuzQ/OzqYRsx0odcWbDrVATEOygGunyigUAHeCImfnSjwvF5B75lQVVKy7kSDELKeLu2G7ZSkm0AlMukKDgVNEf8R2w2bvDpdQEANiBRxOWo2lJ8XjOi/PF3yAtAbxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pp02zjIYeZalTW9b7HYAe4jh3R6FUNgkXVamR1r7uNU=;
 b=HloPZQ+Lq09a9uhZ2fKsCPipivSDmhpLU94NljlrmZ8eLcKzjBBf3qvaLTVmEvmG1A3ieFJ79zivahjnFv07yYKn+/zNTmX+ZNmSlzuEy86F5OxhNRjoazC2BS3es5/AY2t0LJr9MnZynAkXKNbqQfSpz4gsnohPt2/TqM2Cuvw=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [RFC PATCH 0/2] Introduce reserved Xenheap
Thread-Topic: [RFC PATCH 0/2] Introduce reserved Xenheap
Thread-Index: AQHYKR4hoR5C+vQhgEqBFutamuKD06yktMKAgAPYnoA=
Date: Mon, 28 Feb 2022 07:12:52 +0000
Message-ID:
 <PA4PR08MB625324910ED4D40383191F9D92019@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <20220224013023.50920-1-Henry.Wang@arm.com>
 <6269ec3d-039e-d68f-771d-c5e088631410@xen.org>
In-Reply-To: <6269ec3d-039e-d68f-771d-c5e088631410@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7B9FFCA5BD783A42897B93CD3A401033.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: db73d7bc-cc3b-4f61-8ff7-08d9fa89c4ec
x-ms-traffictypediagnostic:
	PR2PR08MB4889:EE_|AM5EUR03FT019:EE_|DB8PR08MB5340:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB5340715878810DB0821D408092019@DB8PR08MB5340.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nYE7MMucERryofHgdYl29j5L93PU8f4xyv1icNRbYDVcuFhrSqqsLs8/kYYCMLA8Exm48Kfl+RomcEDFeYcJLaRr46QO5G9WR5BhcEWehsB8ZoGv9hM4z0ErpbcQfLJiFp6PAVVTgCBHwVRqFRjCR7VS4Tj7JdphTw1znZwJ0BcsFazSjMebLA5UHcKO0aLd/K+rxjzs0TJHmWffcX3C3wKCjGsEZ+xwrl04K51KKMkTJH+n6w+o4hPk+k9SbuNvP6y+RR7wpFqUARiSxEaSwrlJd0Vil1XEnXWi016P6bRzWN2TIKCZ7jzzXnXy9eDUcvBp6Owbjvu5e1q9RsUVwctPYkO7urs6OMOcTZRkwGO0Km9j4YxI1A3gmW0+Q2G4qTZBGyhDjIjPunDxJhFKXLuyZGeZkzDfJRNsOzzH9uSh/UGaCnqpungYjs/lDx3M/YQDL6VtuQ8Np8DWZ/RUw9oHpyvwkGx949OfRfh5hjotckKdhCpxR5fBjGmpGKiDCvYkbmA87xpz+WnIA8ExgjFUdcQ5kFFZRCcKe22s1nO2BYV4kpDtIa0ISCdrrL/cpZJFfIh6V+Fqnpx3A4UPvJaS523OlrKAVwBfvJ2HMCaP1BNHkQOulDo6vA7H7cWJHTomhUz1fIfm752aC1I7b4aG286vHpuhS8w/1wUcieUWdYc6JfIXG+7CmCNHPUu3EZDJWz6W9DnA3xPNCJiMbQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66556008)(55016003)(8936002)(52536014)(5660300002)(33656002)(66476007)(8676002)(66946007)(64756008)(66446008)(4326008)(316002)(2906002)(110136005)(54906003)(508600001)(7696005)(186003)(26005)(53546011)(6506007)(83380400001)(9686003)(86362001)(38100700002)(38070700005)(122000001)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4889
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	180ab702-52f6-43cf-770a-08d9fa89bc85
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gM5d//7sKcJ+0RJWivEFMR4eJFEgxYJgMmHxkS9EuBsgq58yZQjr2NJ8TixunutWHYoegabRbo7DHrsAqAN6GTowcfC1lhVuSvIghIXjy0cb8yTEQ0jvQAYPRxqFSFISdfkMh0+gau8Kc9l2PjImivza4cjze4/AWCBXhpUut/24fF4nxxWWZlw/ZEhnSsCV8b1UEk8XgJu81zEJrra5ZNczxhU04krF9t3hrVWCeNHzAby1HBS9DiQyV7mLHNnq69C3kZzVt+nm5qoyNFlEq0YUV9lSsfSQf4Kmho8095r0Sl/g5GT9y48E8HLGB5W6xaKdyET7X/l0AzG4jYb5hhXqETziISRf6UV+g5tXyhGc6Fac5nHRtszi+6SWo1ng5DVTcwp3QDhwOXPi/Qfgvk6f/Zr6mVCCn/M8OyFrLF+dPBa4XK+s5bVwAJ3UnEEisKbC95qWUUZEQb+eDXKt7+/l/v4E5eZoqeXEGsQlEhuHBEDY+rHvXNzUrMb8FRKFlGySj0hbdUALDHGZaavchnp3EQlIxU36LKuYdHqeTPP9mw5tcISYrn9R0T0v7JngDhLBaRMC/AIlgbCi1yAUit+dCZc1xzMwYc3OXZcPMLYgmXzBE7+85vopgG2xf86eM84X2G/Yrrzyx7roJsfRxVhWU+XIS5mIdR6AkZwffqmLEn6LmhfllPAVJDtTpUkM
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(40460700003)(83380400001)(54906003)(53546011)(81166007)(36860700001)(508600001)(52536014)(316002)(8936002)(356005)(86362001)(70206006)(26005)(186003)(4326008)(70586007)(2906002)(9686003)(47076005)(6506007)(110136005)(336012)(5660300002)(33656002)(82310400004)(55016003)(8676002)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 07:13:07.0468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db73d7bc-cc3b-4f61-8ff7-08d9fa89c4ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5340

SGkgSnVsaWVuLA0KDQpUaGFua3MgdmVyeSBtdWNoIGZvciB5b3VyIHRpbWUgcmVhZGluZyB0aGUg
c2VyaWVzIGFuZCB5b3VyIGZlZWRiYWNrLiBQbGVhc2UNCmZpbmQgdGhlIGlubGluZSByZXBseSBi
ZWxvdy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgRmVicnVhcnkgMjYsIDIwMjIg
NDowOSBBTQ0KPiBUbzogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8
V2VpLkNoZW5AYXJtLmNvbT47IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBT
dWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwLzJdIEludHJvZHVjZSByZXNlcnZlZCBYZW5oZWFwDQo+
IA0KPiBIaSBIZW5yeSwNCj4gDQo+IE9uIDI0LzAyLzIwMjIgMDE6MzAsIEhlbnJ5IFdhbmcgd3Jv
dGU6DQo+ID4gVGhlIHJlc2VydmVkIFhlbmhlYXAsIG9yIHN0YXRpY2FsbHkgY29uZmlndXJlZCBY
ZW5oZWFwLCByZWZlcnMgdG8gcGFydHMNCj4gPiBvZiBSQU0gcmVzZXJ2ZWQgaW4gdGhlIGJlZ2lu
bmluZyBmb3IgWGVuaGVhcC4gTGlrZSB0aGUgc3RhdGljIG1lbW9yeQ0KPiA+IGFsbG9jYXRpb24s
IHN1Y2ggcmVzZXJ2ZWQgWGVuaGVhcCByZWdpb25zIGFyZSByZXNlcnZlZCBieSBjb25maWd1cmF0
aW9uDQo+ID4gaW4gdGhlIGRldmljZSB0cmVlIHVzaW5nIHBoeXNpY2FsIGFkZHJlc3MgcmFuZ2Vz
Lg0KPiANCj4gSW4gWGVuLCB3ZSBoYXZlIHRoZSBjb25jZXB0IG9mIGRvbWhlYXAgYW5kIHhlbmhl
YXAuIEZvciBBcm02NCBhbmQgeDg2DQo+IHRoZXkgd291bGQgYmUgdGhlIHNhbWUuIEJ1dCBmb3Ig
QXJtMzIsIHRoZXkgd291bGQgYmUgZGlmZmVyZW50OiB4ZW5oZWFwDQo+IGlzIGFsd2F5cyBtYXBw
ZWQgd2hlcmVhcyBkb21oZWFwIGlzIHNlcGFyYXRlLg0KPiANCj4gU2tpbW1pbmcgdGhyb3VnaCB0
aGUgc2VyaWVzLCBJIHRoaW5rIHlvdSB3YW50IHRvIHVzZSB0aGUgcmVnaW9uIGZvciBib3RoDQo+
IGRvbWhlYXAgYW5kIHhlbmhlYXAuIElzIHRoYXQgY29ycmVjdD8NCg0KWWVzIEkgdGhpbmsgdGhh
dCB3b3VsZCBiZSBjb3JyZWN0LCBmb3IgQXJtMzIsIGluc3RlYWQgb2YgdXNpbmcgdGhlIGZ1bGwN
CmByYW1fcGFnZXNgIGFzIHRoZSBpbml0aWFsIHZhbHVlIG9mIGBoZWFwX3BhZ2VzYCwgd2Ugd2Fu
dCB0byB1c2UgdGhlDQpyZWdpb24gc3BlY2lmaWVkIGluIHRoZSBkZXZpY2UgdHJlZS4gQnV0IHdl
IGFyZSBjb25mdXNlZCBpZiB0aGlzIGlzIHRoZQ0KY29ycmVjdCAob3IgcHJlZmVycmVkKSB3YXkg
Zm9yIEFybTMyLCBzbyBpbiB0aGlzIHNlcmllcyB3ZSBvbmx5DQppbXBsZW1lbnRlZCB0aGUgcmVz
ZXJ2ZWQgaGVhcCBmb3IgQXJtNjQuDQoNCkNvdWxkIHlvdSBwbGVhc2Ugc2hhcmUgeW91ciBvcGlu
aW9uIG9uIHRoaXM/IFRoYW5rcyENCg0KPiANCj4gRnVydGhlbW9yZSwgbm93IHRoYXQgd2UgYXJl
IGludHJvZHVjaW5nIG1vcmUgc3RhdGljIHJlZ2lvbiwgaXQgd2lsbCBnZXQNCj4gZWFzaWVyIHRv
IG92ZXJsYXAgdGhlIHJlZ2lvbnMgYnkgbWlzdGFrZXMuIEkgdGhpbmsgd2Ugd2FudCB0byBoYXZl
IHNvbWUNCj4gbG9naWMgaW4gWGVuIChvciBvdXRzaWRlKSB0byBlbnN1cmUgdGhhdCBub25lIG9m
IHRoZW0gb3ZlcmxhcHMuIERvIHlvdQ0KPiBoYXZlIGFueSBwbGFuIGZvciB0aGF0Pw0KDQpUb3Rh
bGx5IGFncmVlIHdpdGggdGhpcyBpZGVhLCBidXQgYmVmb3JlIHdlIGFjdHVhbGx5IGltcGxlbWVu
dCB0aGUgY29kZSwNCndlIHdvdWxkIGxpa2UgdG8gZmlyc3RseSBzaGFyZSBvdXIgdGhvdWdodHMg
b24gdGhpczogT25lIG9wdGlvbiBjb3VsZCBiZSB0bw0KYWRkIGRhdGEgc3RydWN0dXJlcyB0byBu
b3RlcyBkb3duIHRoZXNlIHN0YXRpYyBtZW1vcnkgcmVnaW9ucyB3aGVuIHRoZQ0KZGV2aWNlIHRy
ZWUgaXMgcGFyc2VkLCBhbmQgdGhlbiB3ZSBjYW4gY2hlY2sgaWYgdGhleSBhcmUgb3ZlcmxhcHBl
ZC4gT3Zlcg0KdGhlIGxvbmcgdGVybSAoYW5kIHRoaXMgbG9uZyB0ZXJtIG9wdGlvbiBpcyBjdXJy
ZW50bHkgbm90IGluIG91ciBwbGFuKSwNCm1heWJlIHdlIGNhbiBhZGQgc29tZXRoaW5nIGluIHRo
ZSBYZW4gdG9vbHN0YWNrIGZvciB0aGlzIHVzYWdlPw0KDQpBbHNvLCBJIGFtIHdvbmRlcmluZyBp
ZiB0aGUgb3ZlcmxhcHBpbmcgY2hlY2sgbG9naWMgc2hvdWxkIGJlIGludHJvZHVjZWQNCmluIHRo
aXMgc2VyaWVzLiBXRFlUPw0KDQo+IA0KPiA+DQo+ID4gVGhpcyBmZWF0dXJlIGlzIHVzZWZ1bCB0
byBydW4gWGVuIG9uIEFybSBNUFUgc3lzdGVtcywgd2hlcmUgb25seSBhDQo+ID4gZmluaXRlIG51
bWJlciBvZiBtZW1vcnkgcHJvdGVjdGlvbiByZWdpb25zIGFyZSBhdmFpbGFibGUuIFRoZSBsaW1p
dGVkDQo+ID4gbnVtYmVyIG9mIHByb3RlY3Rpb24gcmVnaW9ucyBwbGFjZXMgcmVxdWlyZW1lbnQg
b24gcGxhbm5pbmcgdGhlIHVzZSBvZg0KPiA+IE1QVSBwcm90ZWN0aW9uIHJlZ2lvbnMgYW5kIG9u
ZSBvciBtb3JlIE1QVSBwcm90ZWN0aW9uIHJlZ2lvbnMgbmVlZHMgdG8NCj4gPiBiZSByZXNlcnZl
ZCBvbmx5IGZvciBYZW5oZWFwLg0KPiA+DQo+ID4gVGhlcmVmb3JlLCB0aGlzIHBhdGNoIHNlcmll
cyBpcyBzZW50IGFzIFJGQyBmb3IgY29tbWVudHMgZnJvbSB0aGUNCj4gPiBjb21tdW5pdHkuIFRo
ZSBmaXJzdCBwYXRjaCBpbnRyb2R1Y2VzIHRoZSByZXNlcnZlZCBYZW5oZWFwIGFuZCB0aGUNCj4g
PiBkZXZpY2UgdHJlZSBwcm9jZXNzaW5nIGNvZGUuIFRoZSBzZWNvbmQgcGF0Y2ggYWRkcyB0aGUg
aW1wbGVtZW50YXRpb24gb2YNCj4gPiB0aGUgcmVzZXJ2ZWQgWGVuaGVhcCBwYWdlcyBoYW5kbGlu
ZyBpbiBib290IGFuZCBoZWFwIGFsbG9jYXRvciBvbiBBcm02NC4NCj4gPg0KPiA+IEhlbnJ5IFdh
bmcgKDIpOg0KPiA+ICAgIGRvY3MsIHhlbi9hcm06IEludHJvZHVjZSByZXNlcnZlZCBYZW5oZWFw
IG1lbW9yeQ0KPiA+ICAgIHhlbi9hcm06IEhhbmRsZSByZXNlcnZlZCBYZW5oZWFwIHBhZ2VzIGlu
IGJvb3QvaGVhcCBhbGxvY2F0b3INCj4gPg0KPiA+ICAgZG9jcy9taXNjL2FybS9kZXZpY2UtdHJl
ZS9ib290aW5nLnR4dCB8IDQzICsrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIHhlbi9hcmNo
L2FybS9ib290ZmR0LmMgICAgICAgICAgICAgICAgfCA1MiArKysrKysrKysrKysrKysrKysrKyst
LS0tLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9zZXR1cC5oICAgICAgfCAgMyAr
Kw0KPiA+ICAgeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgICAgICAgICB8IDUyICsrKysr
KysrKysrKysrKysrKystLS0tLS0tLQ0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxMjUgaW5zZXJ0
aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQo+ID4NCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K
DQpLaW5kIHJlZ2FyZHMsDQoNCkhlbnJ5DQo=

