Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1E149C4D1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 08:58:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260684.450597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdC6-0000ns-Nq; Wed, 26 Jan 2022 07:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260684.450597; Wed, 26 Jan 2022 07:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdC6-0000lj-KM; Wed, 26 Jan 2022 07:58:18 +0000
Received: by outflank-mailman (input) for mailman id 260684;
 Wed, 26 Jan 2022 07:58:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dHDZ=SK=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nCdC5-0000ld-0G
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 07:58:17 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on0619.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b726bd55-7e7d-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 08:58:16 +0100 (CET)
Received: from AM6PR04CA0028.eurprd04.prod.outlook.com (2603:10a6:20b:92::41)
 by DB8PR08MB5036.eurprd08.prod.outlook.com (2603:10a6:10:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Wed, 26 Jan
 2022 07:58:12 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::c0) by AM6PR04CA0028.outlook.office365.com
 (2603:10a6:20b:92::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.19 via Frontend
 Transport; Wed, 26 Jan 2022 07:58:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7 via Frontend Transport; Wed, 26 Jan 2022 07:58:12 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Wed, 26 Jan 2022 07:58:11 +0000
Received: from 9a0cfee3034f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 869C3F06-9AEE-4D72-A288-8CA22F8A2F09.1; 
 Wed, 26 Jan 2022 07:58:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a0cfee3034f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Jan 2022 07:58:05 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB5287.eurprd08.prod.outlook.com (2603:10a6:20b:b0::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 07:58:03 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%7]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 07:58:03 +0000
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
X-Inumbo-ID: b726bd55-7e7d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIdEhz/BIFjdqJHRVY2Uz1FboT+J093GoPvwKt6omwA=;
 b=7qQUArhC/+bpzFc5KEWzFQM/BP7+y3qRsngwBvjc6FzaYFWvVXLLrpikKwtTTabpJU3+yeVT+/whcjBvBR08pnrGA4n0WStH3qvY6KtcciVgcUXjo9Pcde1YJx+L2lNmBCYeB/zSFeK+8P/iGMMATHcGHCpxw6vQ/ALCIXaXbOE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l495A3F5/4iZMIvRaO8n/eezVlh7w8FQVrxIl2ges+UbgFkOJ3HYYDQ2BQrvpr68wgp3sJhBMt+DYzsL+uiitMhSjkvQAUTfFNavFxnKwQNoxUaLLLfjktArc1QcujJGLLgA1zwgxh3vmExAHoEpfQi5cyod5KDM3dX1Xm+eMIIf+ZT1WmFlugVsiHY63it+fX3qHHVp9WOLT9H+iMX6qD/UNfXHH6jGRvZnzQCJ4mzUXASYipldGijTisCf0E1GeVEcGtrVCV/DP84JpNbguF1sTkxCcPPHmYOVjrWkutmkcaZvVmJi2LJlLw5RsngvzAN4z8tGJUZL3Xw4eNeEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIdEhz/BIFjdqJHRVY2Uz1FboT+J093GoPvwKt6omwA=;
 b=en3TEFFhW1oGzWIJIyo80l9NvxkKdHVrRymQi3Msjx6+XeoIHcGA6sgdieETts0nrIn4WRlJANkVPjppTLNPZwsoZ9ZZ/OcnWNnA87a25aJuPWe9O11M+z1I9TnmpzLVjEBy/lveH6ekzBZ/CAoA1gcptTV+UVuVz1yira/Piot2B5bUMqUc5W59SUbvVxeNx4wGspNVR/0dSC1bQFDumqMDwFv6+m3619g2h4JzbJtSyOijvhFb3ewSDJpZSZW9b1kSSzWWYcbCIOP/BnYND+HD4WWngdrnFqlBb8DMiuFM7OoHEfGmG9uogwDtCJntooTEIglScWqBmShmsy5T4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIdEhz/BIFjdqJHRVY2Uz1FboT+J093GoPvwKt6omwA=;
 b=7qQUArhC/+bpzFc5KEWzFQM/BP7+y3qRsngwBvjc6FzaYFWvVXLLrpikKwtTTabpJU3+yeVT+/whcjBvBR08pnrGA4n0WStH3qvY6KtcciVgcUXjo9Pcde1YJx+L2lNmBCYeB/zSFeK+8P/iGMMATHcGHCpxw6vQ/ALCIXaXbOE=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 10/37] xen/x86: use helpers to access/update mem_hotplug
Thread-Topic: [PATCH 10/37] xen/x86: use helpers to access/update mem_hotplug
Thread-Index: AQHXsHMVa+NLaHkUKUKV++B1/dWC4qxzHlUAgAKVd/A=
Date: Wed, 26 Jan 2022 07:58:03 +0000
Message-ID:
 <PAXPR08MB7420978500AA62883700C5269E209@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-11-wei.chen@arm.com>
 <66ef43da-fde2-7cb4-0b5c-a3ed7ceb139d@suse.com>
In-Reply-To: <66ef43da-fde2-7cb4-0b5c-a3ed7ceb139d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 299FE3BA24696F4281C86DEAA4B25BFF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f82826bf-8b3f-4376-d2ed-08d9e0a199c6
x-ms-traffictypediagnostic:
	AM6PR08MB5287:EE_|VE1EUR03FT014:EE_|DB8PR08MB5036:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB503672AB6E568142D8E3ABBF9E209@DB8PR08MB5036.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rMeJObU2TL53wVc0p3dYWxZNVATMyi9iKYQOy0Yu0xp/vYKC3YW0JnPs1HAf3svjWD/5ifhEXEzYUcfiwTujLFR9kqyQbAwSvvO04lmHZGZTBUvcQLMdSDK6rfYWeGkTlOQ4AOpEGzJmQt+0VKr96EecRUmWNUMDyXBTSsfUByHCc7zUJYKG+UfgqQ1GWxeZ0GCkupxofe5jL6clA4dRV59Yjj5H6UjYkgBf3c2bqPhv72yfnVucAKiNUuwgpKGmxIYYy2P+dyom/uyGRnKIjCofLZdGJYlEh3dx4JdHBQ7S/xO0FTWrs9qrbz1BA1a3oTjm+953vZE1q+HrhpSOq/oxuI9tTey0a8GXLz7culZTW6XNpsF6vJZrneTIEmd+VxdWgtbHlfzO5neTiqn1vyKJJtLW4UXhw79I2zyL8TydYhGMel+ZeOcopvYyfh4q33N/QIrhPBvNTBUX99o8LePLb6Z5H3b7YvzPrZtH7Ud5deQjglYksAjXElR0EhlFNxEN2cAc5Cq8lHfngvi3RqupAItF4lcFosPCl6b8L1iF5Wh95xBx65aUtaVxCqEwcy2B9W09W90AAiI8Bc0flQGUIUqxHY8aAx0EGYsXJ4L09RbIxxbXQqUgkHzRYduBsPfyK99GtQu0LbRbBFTCjC5BzMxKYdYFCCFtfJYM2K613uafd9UYRtvgm9pdDvQwaeXU9gYzJAs70Gfvit8NaQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(55016003)(86362001)(38070700005)(71200400001)(54906003)(2906002)(8936002)(66476007)(7696005)(76116006)(38100700002)(508600001)(9686003)(122000001)(8676002)(5660300002)(6506007)(53546011)(4326008)(83380400001)(15650500001)(52536014)(66446008)(186003)(26005)(64756008)(316002)(33656002)(6916009)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5287
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c64c108a-720a-477c-2f0c-08d9e0a19482
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HlbYHu0rROudQmCM771bsD4+k6MCwi72dneglSLt58npPFFnJEcI6K2Md1ZQXIYlKSIYrGPErLrRHHxpJ82I7KY9gM79SZzU+THzd2UVNT8YrEVHYqxesQBsOm+ZaXP1eg3NvIS7sjP4D+qoFzSrsXVMKSa/rCBzTsTe+WLUzFOR/+PeAVNQGx2GQJD76sF3VNKuBejreX9/08zLQY6aEvwpc0U8ApSITWW1n5d3zaw8ybdEla+zcsGQieuxpqCWJMcxHlwLhxBw+5shsHxS4ErTcNQNTWMTmNcp28KjSPnpl67vrnCetOPtlWGykKT+hwVMFTZq7cQg8jQAjJpSSu7tJuXBRvgjGQjZTySD2Jax14mvqCZFcu1aajb/wKKZutmYUD9Ddy3z9QpUo6k6Q3cYI/k2UBjPOoWckxvrwDi8/TzVStUdcbZk1qEEErX7jkeqwtFtc9+IGGuw6OWnEvqgAyunla/2I4GdDls6SN30WyrOMzRRUc9SE78WRI2u/kiwU4K+IFCgEigANedEpqXvXWU60tCTIK6ak5NU+SBz2l8UoX/vBgcgdxcJx98IuEj/mwH22NvOWjcIyvd/rwDg4Tii1FphMiv+oloGZbGDiIptpLO5fMtrUlGtW1QaaYfXaDqfAy9B06bUaDvGM5zoQ2g6c62Y1cY/YrVzw0qr9ahzqM2rHybJH3gQHAj+9ZOpKZaoN8HzIYf2MKE+zgyZnOLtFiCKFz2KIM399cZcZcfCVqs6KviYi9yMECpn5xQlnYGNRGIFoIffnphp1g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(40470700004)(46966006)(36840700001)(9686003)(316002)(6862004)(356005)(86362001)(55016003)(40460700003)(54906003)(82310400004)(2906002)(186003)(8936002)(8676002)(52536014)(6506007)(26005)(47076005)(36860700001)(33656002)(336012)(15650500001)(81166007)(7696005)(53546011)(83380400001)(4326008)(508600001)(70206006)(70586007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 07:58:12.2868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f82826bf-8b3f-4376-d2ed-08d9e0a199c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5036

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgyNeaXpSAwOjMwDQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMTAvMzddIHhlbi94ODY6IHVzZSBoZWxwZXJzIHRvIGFjY2Vzcy91cGRhdGUN
Cj4gbWVtX2hvdHBsdWcNCj4gDQo+IE9uIDIzLjA5LjIwMjEgMTQ6MDIsIFdlaSBDaGVuIHdyb3Rl
Og0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zcmF0LmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYv
c3JhdC5jDQo+ID4gQEAgLTM5MSw4ICszOTEsOCBAQCBhY3BpX251bWFfbWVtb3J5X2FmZmluaXR5
X2luaXQoY29uc3Qgc3RydWN0DQo+IGFjcGlfc3JhdF9tZW1fYWZmaW5pdHkgKm1hKQ0KPiA+ICAJ
bWVtYmxrX25vZGVpZFtudW1fbm9kZV9tZW1ibGtzXSA9IG5vZGU7DQo+ID4gIAlpZiAobWEtPmZs
YWdzICYgQUNQSV9TUkFUX01FTV9IT1RfUExVR0dBQkxFKSB7DQo+ID4gIAkJX19zZXRfYml0KG51
bV9ub2RlX21lbWJsa3MsIG1lbWJsa19ob3RwbHVnKTsNCj4gPiAtCQlpZiAoZW5kID4gbWVtX2hv
dHBsdWcpDQo+ID4gLQkJCW1lbV9ob3RwbHVnID0gZW5kOw0KPiA+ICsJCWlmIChlbmQgPiBtZW1f
aG90cGx1Z19ib3VuZGFyeSgpKQ0KPiA+ICsJCQltZW1faG90cGx1Z191cGRhdGVfYm91bmRhcnko
ZW5kKTsNCj4gDQo+IENhbiB0aGUgaWYoKSBwbGVhc2UgYmUgZm9sZGVkIGludG8gbWVtX2hvdHBs
dWdfdXBkYXRlX2JvdW5kYXJ5KCksDQo+IGVsaW1pbmF0aW5nIChhdCBsZWFzdCBmb3IgdGhlIHB1
cnBvc2UgaGVyZSkgdGhlIG5lZWQgZm9yIHRoZQ0KPiBzZXBhcmF0ZSBtZW1faG90cGx1Z19ib3Vu
ZGFyeSgpPyBBcyBzYWlkIG9uIHRoZSBwcmV2aW91cyBwYXRjaCwNCj4gSSB0aGluayB0aGUgdHdv
IHdhbnQgZm9sZGluZy4NCj4gDQoNClllcywgdGhlc2UgY2hhbmdlcyB3b3VsZCBiZSBtb3JlIG1h
a2Ugc2Vuc2UuIEkgd2lsbCBkbyBpdCBpbiBuZXh0DQp2ZXJzaW9uLg0KDQo+IEphbg0KDQo=

