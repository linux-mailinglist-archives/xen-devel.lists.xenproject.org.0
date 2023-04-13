Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EEA6E11D7
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 18:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520848.808900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmzWt-0000u7-NJ; Thu, 13 Apr 2023 16:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520848.808900; Thu, 13 Apr 2023 16:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmzWt-0000qj-Jq; Thu, 13 Apr 2023 16:10:35 +0000
Received: by outflank-mailman (input) for mailman id 520848;
 Thu, 13 Apr 2023 16:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HU9H=AE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pmzWr-0000qd-Cp
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 16:10:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6230a02-da15-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 18:10:30 +0200 (CEST)
Received: from AM6P191CA0074.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::15)
 by AM9PR08MB6114.eurprd08.prod.outlook.com (2603:10a6:20b:287::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:10:28 +0000
Received: from AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::dd) by AM6P191CA0074.outlook.office365.com
 (2603:10a6:209:8a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 16:10:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT032.mail.protection.outlook.com (100.127.140.65) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 16:10:27 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Thu, 13 Apr 2023 16:10:26 +0000
Received: from 2ce8db9ec33a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A89ADFEA-9121-4F97-A769-EACAB67D62D0.1; 
 Thu, 13 Apr 2023 16:10:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2ce8db9ec33a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Apr 2023 16:10:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB9867.eurprd08.prod.outlook.com (2603:10a6:20b:5ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:10:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:10:13 +0000
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
X-Inumbo-ID: b6230a02-da15-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO2qus3IghDRLaMTgWF8VVy8MG262oH2O/6uT+AqoAo=;
 b=U30/iUJTfAElTiLhpXEDFlK9Wx8H6poIg/tiHoblMLAE+zSN0auDTDjWEqi7CnXsmU+pVjDw1ijxmBz3r2cEkUd8jCmnVVcr+76rwMVQtkM3FIEP1oT4BgnSJxbXnbLB9oW/bVL9bJaQf48qrBw0Mb6TDnR2NGOW1EzPYfShw0M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b36245694e2b994
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=behBL2xBPSwaFw1jUmKfiDCzr9fcq3nL+2jrsPeosm44WoBazoX8jdYs065GaDW8YRTHxewqVDyOB741ygbLzGbB9XB+jxyewvxbrY1mKE3RyoYdqTpe6H72i0ELNCzAWe+xc0FTlwAGtjIi+EfWyO8aIrs1MVN56Ue9q+r0f8IYNA0VJ5EQqPi+JHAHIMIx6yjLwS5etCwoxm51ixMQRgjMsPzv06TiThf2pC1KLI3KseBTKMF8z4RX3swUFZMI7mxJb5XtZLs6jFtYL7K0gfEzR+Ufhh3nGNK6NyRI9ahvTQ82a+AgJhnXwEtO3+mQZaEy2ov0nqvg5YB0S9Ax/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO2qus3IghDRLaMTgWF8VVy8MG262oH2O/6uT+AqoAo=;
 b=KdSLeSXLM/ClIh10YjREFY13CZCjdoj6Tzl9GSac4blFqwgCBjq4JEL0bdsxENvNwsSvf1qidS5GAqqIhjXenNKMtk3LoSIsdjEsjQOhoVCODfedR9rxFlGUE7xh0om993Q2vlijfyShYTBspYWlNV4qlNSHviqsVTm6BuafPhwsFCXUovvHoFFjMQ8nB6FYnVhkNv6mcRl+G+C/XXK/NWsuG+UxRKWOVazEBiZsRWHjtaeydE0HUYBmv/jXVZqdKvn4nweXPjNFqXQKZS5tY6Zti8LjLseB84VxELZWVJvqhKGoZqsXW2abX//1XFvv+xUpFpxJItMchuglIrjw0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IO2qus3IghDRLaMTgWF8VVy8MG262oH2O/6uT+AqoAo=;
 b=U30/iUJTfAElTiLhpXEDFlK9Wx8H6poIg/tiHoblMLAE+zSN0auDTDjWEqi7CnXsmU+pVjDw1ijxmBz3r2cEkUd8jCmnVVcr+76rwMVQtkM3FIEP1oT4BgnSJxbXnbLB9oW/bVL9bJaQf48qrBw0Mb6TDnR2NGOW1EzPYfShw0M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Topic: [PATCH v5 02/12] xen/arm: add SVE vector length field to the
 domain
Thread-Index: AQHZbSQ9GJqCFHqaX0uCiT+EC9U7s68pNK+AgAAHnICAAAGIAIAACdqAgAAi2YA=
Date: Thu, 13 Apr 2023 16:10:13 +0000
Message-ID: <92DA4B4F-7BB9-4CAC-9276-0B6A10550164@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-3-luca.fancellu@arm.com>
 <72f38b2b-a391-fb7c-f8c0-cf3561470875@xen.org>
 <B3A82639-6D61-4DA2-B918-A92A421C75D3@arm.com>
 <e8075849-8bd5-7fd4-efaa-81e48c867635@xen.org>
 <4F5DC5EC-F538-42CE-A93F-2B5E3FAC13BB@arm.com>
In-Reply-To: <4F5DC5EC-F538-42CE-A93F-2B5E3FAC13BB@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB9867:EE_|AM7EUR03FT032:EE_|AM9PR08MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 98059bcb-7759-4077-3c6f-08db3c39988b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fl9+qnvjAK/eQHm4GFaYdZG4fUNJ+jE1/qa0kF6RVNjYKihmW2xHSB29F3qr2kWL/lKcjKcJnO1T1n+2gHyEp0n0yNrtTDLbMqZg8+sUwDHLQmRPmA6AAxHXJ2E2KWMeNOM1WTQ0y9NO/tqoOkrcHLBrtZzbQF7U120sac4PsilAHd4fGQBL8lavzv/khH/uUyrBCs57+fwEROY0g4QZhLYkFA/HEY3uWaslz42u5nmQjScGe/Pp67lWHXHvxh8X7IbrcK6Kj6MutC88Nv3TkYNxXEafHls1wVHdcMmJu4wLq24hXxLkDX+JSYNF6j3xSPTN68KdJ3ogZ5KBuRJ6y7CmnPYWjnIcc05H/KbwZdqxyOVaI1wnmSoxwdCO16L2Mv9UzjRaH/ZuPthpqzwWOVE+Mp40l/YxGg+etmwMp8kXIAu6RrSleZxlZXu5+hQDO3V5CzO/w/gnGcq/RfqRxBORfE3As7Yb3R5GrrubQRjK+Mq3tWvY2Pf52qicwRKn4k+viMjuXHr1x2g4nVTyyIgL4rNfIYtvJqYpaNK3pUo9QkGFuhUg+YznZ4aq7BTbQ52TczXauC/THGQEyQYfRgLqcvzWpDv6DklU9bEHK2czTUN30w92FHwAvLsGmC+9lLsZ8kMkfk1Gk4c8VUMeF61gG57Kkb4nWRRPQkStivc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199021)(71200400001)(33656002)(38100700002)(122000001)(5660300002)(36756003)(2906002)(316002)(38070700005)(8676002)(8936002)(86362001)(66446008)(66556008)(64756008)(41300700001)(66946007)(6916009)(66476007)(4326008)(91956017)(76116006)(2616005)(54906003)(6506007)(186003)(478600001)(26005)(6512007)(6486002)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <74803F1FFFE1674E9D8A4431348410A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9867
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	005ea367-2196-4d15-6a70-08db3c399059
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tmt2Vkk13zbk2XzpzPDvL2CZYxbRF2nxw8jJEvIQJW4SkBNzZv4+k80YUy5NCoTrffLUYaYtOj6eG0n6kSm1MSohb2F+U5HLTELAHJZxsYznCL07WdugD/r0m73v061liiSGlx5ObtCxE3EG2aHU+GdkbZM70Blst5hnZki+64ZKokVnDYQoj3BqK3uKWtByhoGtrWZClfY5zSvujxVciKX5AvQklOBjk3oAbGcu+KZwjonV9E8PnZS8k0nVJLiWOQdZH8W7hD4FAQ5gA3lenzRWxprmA4ybfVF0ZCqaehOQsAyt1kdazlj/tNDNDTQCkUOe3Et0DL0JTTRjPOQymTshxEDL5au6WP4by1Q4Zp4Z9lGHiVk7zDxjV12d0GaxIelKgfHz2O3E9XHYdg7VrsKnuECx5fz92tOS6sI+4f0K21QQZA24rvfGIPVr5ojQOFGB6o+NH9q9x2cT9KFo1bI4pcZ0NDYYObfQXwXRKzW5JpUUlZ6KTJMhOrO/em4qDTjAKSNLXpd2dea6W9Yy/4ZCXW+U2QMCIrPDbdgFRYwupj+6b/mUGMMVL8+eCwlAM/Fi9VsVW81Md3RhM/dG9FF38p4rE9Ij7OwjggKyTYXPX6uUBXLxRNiNhyS1G9uwKO/e6fD6cdJr1zcrp6S6ewrqaYkCEktO18MpvafnM/I/bxe33p33rAvVBbGxAeTRIvd5goB5rUH5v5SIKKXxdjh/fw+nNQ5uRm87qAZm3gI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(6486002)(40460700003)(70206006)(70586007)(4326008)(36756003)(2906002)(86362001)(81166007)(82740400003)(356005)(41300700001)(33656002)(5660300002)(82310400005)(8676002)(8936002)(6862004)(316002)(478600001)(40480700001)(54906003)(6512007)(6506007)(26005)(336012)(36860700001)(2616005)(186003)(47076005)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:10:27.2496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98059bcb-7759-4077-3c6f-08db3c39988b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6114

PiANCj4gDQo+PiANCj4+Pj4gQ2FuIHdlIG1vdmUgdGhpcyBzb21ld2hlcmUgZWxzZSB0byBhdm9p
ZCBhZGRpbmcgZXh0cmEgcGFkZGluZz8gQWxzbyBzaG91bGRuJ3QgdGhpcyBiZSBwcm90ZWN0ZWQg
d2l0aCAjaWZkZWYgQ09ORklHX0FSTV82NCB0byBtYWtlIGNsZWFyIHRoaXMgaXMgbm90IHN1cHBv
cnRlZCBvbiBYZW4gMzItYml0Pw0KPj4+IFllcywgSeKAmWxsIG1vdmUgaXQgYW5kIHByb3RlY3Qg
d2l0aCBDT05GSUdfQVJNXzY0LCBpcyBpdCBvayBmb3IgeW91IGlmIEkgbW92ZSBpdCBhZnRlcjoN
Cj4+PiAvKiBNb25pdG9yIG9wdGlvbnMgKi8NCj4+PiBzdHJ1Y3Qgew0KPj4+ICAgIHVpbnQ4X3Qg
cHJpdmlsZWdlZF9jYWxsX2VuYWJsZWQgOiAxOw0KPj4+IH0gbW9uaXRvcjsNCj4+IA0KPj4gUGxl
YXNlIGNoZWNrIHRoZSBwYWRkaW5nIHdpdGggInBhaG9sZSIuIElmIHBvc3NpYmxlLCBpdCB3b3Vs
ZCBiZSBiZXR0ZXIgdG8gcmUtdXNlIGFuIGV4aXN0aW5nIG9uZS4NCj4gDQo+IE9rIEnigJlsbCB0
cnkgdG8gdXNlIHRoZSB0b29sDQoNCknigJl2ZSBtYW5hZ2VkIHRvIHVzZSB0aGUgdG9vbCwgdGhl
IGZpZWxkIHNlZW1zIGFscmVhZHkgaW4gYSBnb29kIHNwb3Q6DQoNCnN0cnVjdCBhcmNoX2RvbWFp
biB7DQoJZW51bSBkb21haW5fdHlwZSAgICAgICAgICAgdHlwZTsgICAgICAgICAgICAgICAgIC8q
ICAgICAwICAgICA0ICovDQoJdWludDhfdCAgICAgICAgICAgICAgICAgICAgc3ZlX3ZsOyAgICAg
ICAgICAgICAgIC8qICAgICA0ICAgICAxICovDQoNCgkvKiBYWFggMyBieXRlcyBob2xlLCB0cnkg
dG8gcGFjayAqLw0KDQoJc3RydWN0IHAybV9kb21haW4gICAgICAgICAgcDJtOyAgICAgICAgICAg
ICAgICAgIC8qICAgICA4ICAgMzI4ICovDQoJLyogLS0tIGNhY2hlbGluZSA1IGJvdW5kYXJ5ICgz
MjAgYnl0ZXMpIHdhcyAxNiBieXRlcyBhZ28gLS0tICovDQoJc3RydWN0IGh2bV9kb21haW4gICAg
ICAgICAgaHZtOyAgICAgICAgICAgICAgICAgIC8qICAgMzM2ICAgMzEyICovDQoJLyogLS0tIGNh
Y2hlbGluZSAxMCBib3VuZGFyeSAoNjQwIGJ5dGVzKSB3YXMgOCBieXRlcyBhZ28gLS0tICovDQoJ
c3RydWN0IHBhZ2luZ19kb21haW4gICAgICAgcGFnaW5nOyAgICAgICAgICAgICAgIC8qICAgNjQ4
ICAgIDMyICovDQoJc3RydWN0IHZtbWlvICAgICAgICAgICAgICAgdm1taW87ICAgICAgICAgICAg
ICAgIC8qICAgNjgwICAgIDMyICovDQoJLyogLS0tIGNhY2hlbGluZSAxMSBib3VuZGFyeSAoNzA0
IGJ5dGVzKSB3YXMgOCBieXRlcyBhZ28gLS0tICovDQoJdW5zaWduZWQgaW50ICAgICAgICAgICAg
ICAgcmVsX3ByaXY7ICAgICAgICAgICAgIC8qICAgNzEyICAgICA0ICovDQoNCgkvKiBYWFggNCBi
eXRlcyBob2xlLCB0cnkgdG8gcGFjayAqLw0KDQoJc3RydWN0IHsNCgkJdWludDY0X3QgICAgICAg
ICAgIG9mZnNldDsgICAgICAgICAgICAgICAvKiAgIDcyMCAgICAgOCAqLw0KCQlzX3RpbWVfdCAg
ICAgICAgICAgbmFub3NlY29uZHM7ICAgICAgICAgIC8qICAgNzI4ICAgICA4ICovDQoJfSB2aXJ0
X3RpbWVyX2Jhc2U7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qICAgNzIwICAgIDE2
ICovDQoJc3RydWN0IHZnaWNfZGlzdCAgICAgICAgICAgdmdpYzsgICAgICAgICAgICAgICAgIC8q
ICAgNzM2ICAgMjAwICovDQoNCgkvKiBYWFggbGFzdCBzdHJ1Y3QgaGFzIDIgYnl0ZXMgb2YgcGFk
ZGluZyAqLw0KDQoJLyogLS0tIGNhY2hlbGluZSAxNCBib3VuZGFyeSAoODk2IGJ5dGVzKSB3YXMg
NDAgYnl0ZXMgYWdvIC0tLSAqLw0KCXN0cnVjdCB2dWFydCAgICAgICAgICAgICAgIHZ1YXJ0OyAg
ICAgICAgICAgICAgICAvKiAgIDkzNiAgICAzMiAqLw0KCS8qIC0tLSBjYWNoZWxpbmUgMTUgYm91
bmRhcnkgKDk2MCBieXRlcykgd2FzIDggYnl0ZXMgYWdvIC0tLSAqLw0KCXVuc2lnbmVkIGludCAg
ICAgICAgICAgICAgIGV2dGNobl9pcnE7ICAgICAgICAgICAvKiAgIDk2OCAgICAgNCAqLw0KCXN0
cnVjdCB7DQoJCXVpbnQ4X3QgICAgICAgICAgICBwcml2aWxlZ2VkX2NhbGxfZW5hYmxlZDoxOyAv
KiAgIDk3MjogMCAgMSAqLw0KCX0gbW9uaXRvcjsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAvKiAgIDk3MiAgICAgMSAqLw0KDQoJLyogWFhYIDMgYnl0ZXMgaG9sZSwgdHJ5
IHRvIHBhY2sgKi8NCg0KCXN0cnVjdCB2cGwwMTEgICAgICAgICAgICAgIHZwbDAxMTsgICAgICAg
ICAgICAgICAvKiAgIDk3NiAgICA3MiAqLw0KDQoJLyogc2l6ZTogMTE1MiwgY2FjaGVsaW5lczog
MTgsIG1lbWJlcnM6IDEzICovDQoJLyogc3VtIG1lbWJlcnM6IDEwMzgsIGhvbGVzOiAzLCBzdW0g
aG9sZXM6IDEwICovDQoJLyogcGFkZGluZzogMTA0ICovDQoJLyogcGFkZGluZ3M6IDEsIHN1bSBw
YWRkaW5nczogMiAqLw0KfSBfX2F0dHJpYnV0ZV9fKChfX2FsaWduZWRfXygxMjgpKSk7DQoNCj4g
DQo+PiANCj4+IENoZWVycywNCj4+IA0KPj4gLS0gDQo+PiBKdWxpZW4gR3JhbGwNCg0KDQo=

