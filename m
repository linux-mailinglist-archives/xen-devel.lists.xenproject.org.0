Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989FC42F690
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:07:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210776.367765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOnJ-0001Od-SF; Fri, 15 Oct 2021 15:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210776.367765; Fri, 15 Oct 2021 15:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOnJ-0001M3-Oj; Fri, 15 Oct 2021 15:06:49 +0000
Received: by outflank-mailman (input) for mailman id 210776;
 Fri, 15 Oct 2021 15:06:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbOnH-0001Lu-T5
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:06:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db27658a-9e27-4202-bf27-14fd81108b1c;
 Fri, 15 Oct 2021 15:06:46 +0000 (UTC)
Received: from DU2PR04CA0238.eurprd04.prod.outlook.com (2603:10a6:10:2b1::33)
 by PA4PR08MB6046.eurprd08.prod.outlook.com (2603:10a6:102:e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 15:06:43 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::1d) by DU2PR04CA0238.outlook.office365.com
 (2603:10a6:10:2b1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 15:06:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 15:06:43 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 15 Oct 2021 15:06:42 +0000
Received: from 27232b8faef9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5BB6899B-ADFB-41F5-9CDC-7FC97FB555C5.1; 
 Fri, 15 Oct 2021 15:06:31 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27232b8faef9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 15:06:31 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0801MB1862.eurprd08.prod.outlook.com (2603:10a6:4:75::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 15:06:29 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 15:06:29 +0000
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
X-Inumbo-ID: db27658a-9e27-4202-bf27-14fd81108b1c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4WWQu7W+GeNroKLEzq4EIWTHSqe5cpjxlMyPJ0yiBA=;
 b=R8c03Dtq6UzgdrP4bWaWZ8KHurPbTOsWjeQ6armdvz2Akrm7F/xbEZkU9dB3zGJNKjwwOINvMWDLYIb0bjYBIBiq5Xd+zbDWrJhhhRkcoM12p/gmUzN3/FeuP7t+EW2msA6XBetsrjIE/z/qJ1VGn4wrIPB4P31Yen9DS2kBppU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b69892878d90edec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOo2plHG64REaxkg4VHqPN4Aa/hvlYDfylgqknU0+wL38IGbddahHf7mQzEHioCKbf2Nd1Vm9a72G6kMzJB5Cein9HGg7j8bewKce8huRYOqWJIhuID/QRfrywnYrhI3j2xrW9zE9mwLkB7Znui3uIzna5isyJ1KLaL6KK5BqGXw0Ic+NjQvvu9PzCAHYkPbK/a80N0CgUVwEYiJaoO05BkxkU6+ogy+gy6sm8ZoueZrwsb43LKt57tXWC6NuPY6sfSO+1X7YW/HhdUaO11oGUirJdRovBOaBpnrKAk2l148hs5vY3xRZOna8fhzbLHpQzLBNl98I3CuMC/zQ/7DMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4WWQu7W+GeNroKLEzq4EIWTHSqe5cpjxlMyPJ0yiBA=;
 b=eSTy//2zQFxohd5v+cXi21Gs+AXLCpinYl/LPfDkhpi7hzB/jXgXFAM4tx0+rAu1FBSLHk71zB9IyYPW1oLf+cVH7trsDraQjrRXvZG1kTIjq1961Dv2nT49Wg1Sw4tckYwCjLHm1Ec62iY2SHfbFpL2wrn4ozdSHdz78t+kCsmPqhmNMQYyqneuRVwuq9UPqfqsec09+E0TyNgnX6awTvHKlbC4H6rVv0TrGNV+VLanx1qZujbXPKLsPHmEQAo3JejLZxR7LWr6PtJzF2dQi8lZL0dRpwSx2ZmzXVYUgFBbzkEl3ogjqzATfVm3zG8Il/n333UxfBz3SefnPExnPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4WWQu7W+GeNroKLEzq4EIWTHSqe5cpjxlMyPJ0yiBA=;
 b=R8c03Dtq6UzgdrP4bWaWZ8KHurPbTOsWjeQ6armdvz2Akrm7F/xbEZkU9dB3zGJNKjwwOINvMWDLYIb0bjYBIBiq5Xd+zbDWrJhhhRkcoM12p/gmUzN3/FeuP7t+EW2msA6XBetsrjIE/z/qJ1VGn4wrIPB4P31Yen9DS2kBppU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Topic: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Index: AQHXwcz8unryLt1qUEeMdpd7xMjDNavUHq6AgAAKLQA=
Date: Fri, 15 Oct 2021 15:06:28 +0000
Message-ID: <801F3B48-BAA0-4520-8B41-E83627AA845C@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
 <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com>
 <YWmQa4uMA8usiHcu@MacBook-Air-de-Roger.local>
In-Reply-To: <YWmQa4uMA8usiHcu@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 21a5a571-33c4-484c-969a-08d98fed65f8
x-ms-traffictypediagnostic: DB6PR0801MB1862:|PA4PR08MB6046:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB60464EE1EE0A83BCBD6DDDF39DB99@PA4PR08MB6046.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d9t96IrqxTfP8Nrp/j8cGsFrJRKi02WrGeoBNwvX+ouMKfZM1mN3nbbB6EnabAzUWNDyLWDJ3CRvB3XZMLX7NdPE/fl6wTlYUTS74fBXdWa5EZ98ZG/dy55f/jLZacpAdiinCib+KdMXNfxfouw0B993T/1orJrxYj+M/HdBjn7II2JAQa4IcCJajcdh19AdduaYuKZEbscHozr6NXokQuqPHNqWaNSU9dX+y10tUXzV22xTaqszQJMAgBNJTrI7YCeKzOwyMfEhhmLsf1qgxIbCBS18nLqeRs+mRmJ1CRnXWY/Y0vHM3sx7PezV6C6rVjUgf80l1P91+JmrqIc0P528dMcuvblImZGG7u8LT1Ajd2eoB47lOKNTNt8sJ9w+o8y2842IY7QFwpBQsYbpzLEKTk4Md77KA7riW+ZI965zixPbX0y+6h7SS362P33OqTZkX4HIP9QhPrI8C95hC/K7e+Gel2hj2EQG9fnRsOp/0JD37mGnPjsQefCB4khGiomxcJiiwRFWzpwQVDlN7oNCYh/1CwVL2EOzNRWI5+D5HJ4Bt95rBgPCBNCQpV0VjUrcAB0MvuVOWKQk3gQCojDBgk3RjMkk7CpcxrXysOT0to+MR4jWXrHOAaueRjQQ4i0iogw1TeAptghCivH0y958oSX22vpxsb4QMZVwqRQcFG8dbRhcL4p3Sd3ljJnOx5Z2l2kd5bvNuKzskB/98g6EqrD830bqdcNnP7cWmep/rc/CE14j7c58D6mb2F11
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(7416002)(8936002)(33656002)(53546011)(8676002)(38070700005)(4326008)(6512007)(54906003)(38100700002)(6506007)(36756003)(122000001)(83380400001)(64756008)(186003)(66476007)(66556008)(71200400001)(76116006)(66946007)(2906002)(66446008)(26005)(6916009)(5660300002)(86362001)(508600001)(2616005)(316002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <658B46760F25B349AA298A052C36D4AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1862
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c99f32af-73ab-4535-cbeb-08d98fed5da6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A21dR+tO+kd138PPue/OYV17i21LN2as78KJdteb+fnwfC668TAlGV4KGp008I+li9jA/8jEgPTcv77kJsZmXSdxRScO3NNDq2M7Wtg0X78JZiL68zYqgE4SqiwvzKP/3AB0qaYeaELM26Ot7a+ZftzJ4r3ZE4ldiXh7jox1Cnbbd4gjovPptgAbKD3R36AVHaKA73EgPa2d4nftG3G4UZiDr8lRaKewVhmiSiYdzA9w4ZEHjWLZDdzVd+o9rSOnA/cJ+WTnd+BEbxS7lw4lgboJ0bC07sU46J+x+Zmz7ydXiP6MjQf/+MxV9B4+6cQKzOUvCEOP6pu/aeyDX5hsW8BBVHwtmlwwjKzrKdrnDfeL4oyU4rkiaA6rjkd2mGNvpmH7SKZ/kiB72Qn7MfnsRI0a3yDIH8vJRoIrj2fyKUIrTQnAhmVdKu3SO0yp3opTGM03Zve/LkqDtoJ9KMZ18Pu1/X0ApbwCKRAy6iochm8hESiaBdUfR7PomOSu6odeS8fntMyb0M8GX+DGS/qNN/biDMBj6ONQFLcbQecv4xLLblnvetPczLc0ZmmVHRUomE5Bl+0fs9yRegJHcfHBAseFYXHJGmOG5YEwYHV/CeiILO0ObxB+iM5XuoErw1d/tP2kuvh1XDWnMoLq9dP68JkxK+CjtrmPqyTUOjf28qU8EsZbqq9q4Ng7S/zlpOP4vpHBwkxJZzIZarH/Zje8qQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(33656002)(81166007)(8676002)(316002)(356005)(82310400003)(47076005)(336012)(36756003)(508600001)(86362001)(8936002)(186003)(36860700001)(6862004)(2616005)(6512007)(54906003)(70206006)(70586007)(26005)(6486002)(2906002)(83380400001)(5660300002)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 15:06:43.0367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a5a571-33c4-484c-969a-08d98fed65f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6046

SGkgUm9nZXIsDQoNCj4gT24gMTUgT2N0IDIwMjEsIGF0IDE1OjMwLCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIE9jdCAxNSwgMjAy
MSBhdCAwMjo1OToxOVBNICswMTAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gRnJvbTog
UmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQo+PiANCj4+IFRoZSBleGlzdGluZyBW
UENJIHN1cHBvcnQgYXZhaWxhYmxlIGZvciBYODYgaXMgYWRhcHRlZCBmb3IgQXJtLg0KPj4gV2hl
biB0aGUgZGV2aWNlIGlzIGFkZGVkIHRvIFhFTiB2aWEgdGhlIGh5cGVyIGNhbGwNCj4+IOKAnFBI
WVNERVZPUF9wY2lfZGV2aWNlX2FkZOKAnSwgVlBDSSBoYW5kbGVyIGZvciB0aGUgY29uZmlnIHNw
YWNlDQo+PiBhY2Nlc3MgaXMgYWRkZWQgdG8gdGhlIFhlbiB0byBlbXVsYXRlIHRoZSBQQ0kgZGV2
aWNlcyBjb25maWcgc3BhY2UuDQo+PiANCj4+IEEgTU1JTyB0cmFwIGhhbmRsZXIgZm9yIHRoZSBQ
Q0kgRUNBTSBzcGFjZSBpcyByZWdpc3RlcmVkIGluIFhFTg0KPj4gc28gdGhhdCB3aGVuIGd1ZXN0
IGlzIHRyeWluZyB0byBhY2Nlc3MgdGhlIFBDSSBjb25maWcgc3BhY2UsWEVODQo+PiB3aWxsIHRy
YXAgdGhlIGFjY2VzcyBhbmQgZW11bGF0ZSByZWFkL3dyaXRlIHVzaW5nIHRoZSBWUENJIGFuZA0K
Pj4gbm90IHRoZSByZWFsIFBDSSBoYXJkd2FyZS4NCj4+IA0KPj4gRm9yIERvbTBsZXNzIHN5c3Rl
bXMgc2Nhbl9wY2lfZGV2aWNlcygpIHdvdWxkIGJlIHVzZWQgdG8gZGlzY292ZXIgdGhlDQo+PiBQ
Q0kgZGV2aWNlIGluIFhFTiBhbmQgVlBDSSBoYW5kbGVyIHdpbGwgYmUgYWRkZWQgZHVyaW5nIFhF
TiBib290cy4NCj4+IA0KPj4gVGhpcyBwYXRjaCBpcyBhbHNvIGRvaW5nIHNvbWUgc21hbGwgZml4
ZXMgdG8gZml4IGNvbXBpbGF0aW9uIGVycm9ycyBvbg0KPj4gYXJtMzIgb2YgdnBjaSBhbmQgcHJl
dmVudCA2NGJpdCBhY2Nlc3NlcyBvbiAzMmJpdDoNCj4+IC0gdXNlICV6dSBpbnN0ZWFkIG9mIGx1
IGluIGhlYWRlci5jIGZvciBwcmludA0KPj4gLSBwcmV2ZW50IDY0Yml0IGFjY2Vzc2VzIGluIHZw
Y2lfYWNjZXNzX2FsbG93ZWQNCj4+IC0gaWZkZWYgb3V0IHVzaW5nIENPTkZJR182NEJJVCBoYW5k
bGluZyBvZiBsZW4gOCBpbg0KPj4gdnBjaV9lY2FtX3tyZWFkL3dyaXRlfQ0KPj4gDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSYWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4gDQo+
IFRoZSB2cGNpIGJpdHMgbG9va3MgZmluZSB0byBtZSwgc286DQo+IA0KPiBBY2tlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClRoYW5rcw0KDQo+IA0KPiBJ
IGhhdmUgb25lIHF1ZXN0aW9uIGhvd2V2ZXIgcmVsYXRlZCB0byB0aGUgcGxhY2VtZW50IG9mIHRo
ZSB2cGNpIHNldHVwDQo+IGNhbGwgaW4gcGNpX2FkZF9kZXZpY2UuDQo+IA0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMNCj4+IGluZGV4IDNhYThjMzE3NWYuLjA4Mjg5MmM4YTIgMTAwNjQ0DQo+PiAtLS0g
YS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvcGNpLmMNCj4+IEBAIC03NjYsNyArNzY2LDIxIEBAIGludCBwY2lfYWRkX2Rldmlj
ZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLA0KPj4gICAgICAgICBsaXN0X2FkZCgmcGRldi0+
ZG9tYWluX2xpc3QsICZoYXJkd2FyZV9kb21haW4tPnBkZXZfbGlzdCk7DQo+PiAgICAgfQ0KPj4g
ICAgIGVsc2UNCj4+ICsgICAgew0KPj4gKyNpZmRlZiBDT05GSUdfQVJNDQo+PiArICAgICAgICAv
Kg0KPj4gKyAgICAgICAgICogT24gQVJNIFBDSSBkZXZpY2VzIGRpc2NvdmVyeSB3aWxsIGJlIGRv
bmUgYnkgRG9tMC4gQWRkIHZwY2kgaGFuZGxlcg0KPj4gKyAgICAgICAgICogd2hlbiBEb20wIGlu
Zm9ybSBYRU4gdG8gYWRkIHRoZSBQQ0kgZGV2aWNlcyBpbiBYRU4uDQo+PiArICAgICAgICAgKi8N
Cj4+ICsgICAgICAgIHJldCA9IHZwY2lfYWRkX2hhbmRsZXJzKHBkZXYpOw0KPj4gKyAgICAgICAg
aWYgKCByZXQgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0df
RVJSICJTZXR1cCBvZiB2UENJIGZhaWxlZDogJWRcbiIsIHJldCk7DQo+PiArICAgICAgICAgICAg
Z290byBvdXQ7DQo+PiArICAgICAgICB9DQo+IA0KPiBJJ20gbGlrZWx5IGxvc3QgaGVyZSwgYnV0
IHNob3VsZG4ndCB0aGlzIGFsc28gYmUgZG9uZSBmb3IgZGV2aWNlcyB0aGF0DQo+IGJlbG9uZyB0
byB0aGUgaGFyZHdhcmUgZG9tYWluIGFuZCBhcmUgYXNzaWduZWQgdG8gaXQgaW4gdGhlIGZpcnN0
DQo+IGJyYW5jaCBvZiB0aGlzIGNvbmRpdGlvbmFsPw0KPiANCj4gT3IgZWxzZSB5b3Ugd2lsbCBl
bmQgdXAgd2l0aCBkZXZpY2VzIGFzc2lnbmVkIHRvIHRoZSBoYXJkd2FyZSBkb21haW4NCj4gdGhh
dCBkb24ndCBoYXZlIHZQQ0kgc2V0dXAgZm9yIHRoZW0uDQoNCkkgbWlnaHQgYmUgd3JvbmcgYnV0
IHdoZW4gdGhlIGhhcmR3YXJlIGRvbWFpbiBpcyBkZWNsYXJpbmcgdGhlIGRldmljZXMgdGhleSBh
cmUgYWRkZWQgdG8gaGltLg0KVGhlbiBsYXRlciB3aGVuIHRob3NlIGRldmljZSBhcmUgYXNzaWdu
ZWQgdG8gYSBndWVzdCwgdGhleSBhcmUgcmVtb3ZlZCBmcm9tIHRoZSBoYXJkd2FyZSBkb21haW4u
DQoNClJlZ2FyZHMNCkJlcnRyYW5kDQoNCj4gDQo+IFRoYW5rcywgUm9nZXIuDQoNCg==

