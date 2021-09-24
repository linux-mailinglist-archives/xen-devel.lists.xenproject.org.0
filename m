Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D810841703F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195219.347838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiKv-00074m-4b; Fri, 24 Sep 2021 10:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195219.347838; Fri, 24 Sep 2021 10:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiKv-00072S-1G; Fri, 24 Sep 2021 10:21:45 +0000
Received: by outflank-mailman (input) for mailman id 195219;
 Fri, 24 Sep 2021 10:21:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTiKt-00072M-N6
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:21:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.73]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 35fe0e78-1d21-11ec-babb-12813bfff9fa;
 Fri, 24 Sep 2021 10:21:42 +0000 (UTC)
Received: from AM5PR0101CA0019.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::32) by AM0PR08MB3892.eurprd08.prod.outlook.com
 (2603:10a6:208:106::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 10:21:40 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::7a) by AM5PR0101CA0019.outlook.office365.com
 (2603:10a6:206:16::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 10:21:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:21:39 +0000
Received: ("Tessian outbound ab2dc3678fa9:v103");
 Fri, 24 Sep 2021 10:21:38 +0000
Received: from 51299a89b255.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0C17EFCB-20D8-450C-93DF-AF900EA873BB.1; 
 Fri, 24 Sep 2021 10:21:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 51299a89b255.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 10:21:21 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6060.eurprd08.prod.outlook.com (2603:10a6:10:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 10:21:19 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:21:19 +0000
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
X-Inumbo-ID: 35fe0e78-1d21-11ec-babb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKZgEUAaQkZ8hVm0rcV+n6jvTYurK20EOZky1CvKFdc=;
 b=JMS17EXlEgPaLJ4Sfkbig9HCwWHpxnSAtG/zroCIiP6oVIfuCG7G7G4WK+kKvHhgeY2dTqi0N906HYg2HqD9ppd+E8izi7PH4a9W5gW21HqodNRSKwkHuh+R6Fsr0UYmjiHVMKRtylp+872yiH7nPezkkJLszAnt9JHtHhGaikQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e4drZaJ53Z3VWnX3uxLNKuyy9ySw+LMJjKeSulZOkuj/n6FjQq9zE8H7NpeFJ7lsycl7U11MGxc/7j3bw/9qv+H3avYXHLaxFefzBJLxwh/aXx+yIs4UxkxfCYbWkbK7hO/gs/AHQPFWXlLzQ8AByyny0Wae7vkV6uEwDYyzF6ZetR7vBBTTLZ6cJesRO1NEudVaqFHTXUbcfdjaW8nJqHpOWKqpJ3RuR0N296xm5gTTDAH4HaSinc0bgf84xXG//kC8OUcLEueLQ2sXF6ZvF73orda2A35gL7/8kFJt/q8dcwCaJueFpCx2wsxrnxb2x7TUyKbHAth3lJhoQ+hcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zKZgEUAaQkZ8hVm0rcV+n6jvTYurK20EOZky1CvKFdc=;
 b=MCaArhi/C9m+fSezfFyXsLF1kukx5/k+xTj2OFqspOZuqMWmByw+ksoqef6kWCvLv5h5GaOkiZtV5tP0sLY25RlwNjSL9jxyudQqcsDniYJ6ShN4FKQuumPFaCL3OL0dQgRNjNv3OZeQ++J5Nm0oAsy+8U8uZF0MUD1yV2elJ0Vkt6MHULixz7P28EWTqza4Xf3A3LxSFysDU+ZSQ7geMbzmhCSdEenMr9NX+VTTr5qlbTIKSLtSw5rSlnk7OSHtiEJcp6qZqQU3sxv9qfYMJzVVpMfnaSHxDfVHlEXUOeS3Gwh+w0Bx98UdFDv7Fhhd12mcPp8s7twUEO/vPjFPyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKZgEUAaQkZ8hVm0rcV+n6jvTYurK20EOZky1CvKFdc=;
 b=JMS17EXlEgPaLJ4Sfkbig9HCwWHpxnSAtG/zroCIiP6oVIfuCG7G7G4WK+kKvHhgeY2dTqi0N906HYg2HqD9ppd+E8izi7PH4a9W5gW21HqodNRSKwkHuh+R6Fsr0UYmjiHVMKRtylp+872yiH7nPezkkJLszAnt9JHtHhGaikQ=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 06/37] xen/arm: use !CONFIG_NUMA to keep fake NUMA API
Thread-Topic: [PATCH 06/37] xen/arm: use !CONFIG_NUMA to keep fake NUMA API
Thread-Index: AQHXsHMNLLzNj13Mj0W39ByxhAsuC6uyTsaAgACsBgA=
Date: Fri, 24 Sep 2021 10:21:19 +0000
Message-ID:
 <DB9PR08MB6857A2291DBD9B3EC250CE059EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-7-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231703070.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231703070.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 6B5006D9D23C044EBF0ABB2B80B1EABE.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d6dca47c-f9d9-4cc3-8e50-08d97f4518e9
x-ms-traffictypediagnostic: DBBPR08MB6060:|AM0PR08MB3892:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB38928FE973BD68790EC1F55A9EA49@AM0PR08MB3892.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0XiCNKa/6ijcuVY9Bf5KTTHodAmdPICHPW7/QmtPjnnA/lq/8KYcwL335XcdqBFMlGMrcJvXyRBtzolk3AmFCmIQ+QlSv1h3wXLqPGkN0toke8MJ4zMirblFmpIIyqS1X6lQnt8ZwTMqdPySBdiG8XcPGusi0wUqPuuZ7pLu2ee3mdh6ZG2n56djcnqBs7AocN8Cul7GjhIa7WnBhi8afBaRWJ5xdkikBtK6YQ4nTDhvkV5YWJYWkAd44zNecRZcCS3V7JltBIB1lQ50exqVB2P1b/eenkmoPRIePGBsOoFFh7feBjIAU8rjhUYofklwkcINcjWzdDz9/TTmEPr0e8WRhq77xvVbr0d8m56anMViGHGlO6zM5jb/q4BM2jOucKvoU8Ii1Tp19UJwy5DLLyttdky90bMnMp63W570ncUWUR/GtQeFuiupX2DbMdeJdUsv2RXTx5M7ALOY7qGMM8O9xVvZVZBgBNZAHDvKGAi9Cf/8K8E03CAD1IPBzt9iccNhoZTiVvlNcXrrhs7mjbRzwR7HjNomUvzcTL8v31j/o6DlQkVsv/4BHnf+tRVxg3GB3rvnHDapJ3naTzJl+6emSgbXC5d78034PXTxU3TOoXPailLSCwZSx50FLlqRr4KuR+DIqlkdiLP7zKy+VuSUfbxPh+gDNm1Vwxhwdm/hpPei9s5DYesBew7enPLX8cDpaafUtyqeaBa9M7/NZQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(52536014)(53546011)(7696005)(6916009)(54906003)(508600001)(8676002)(122000001)(38100700002)(38070700005)(33656002)(4326008)(2906002)(83380400001)(6506007)(186003)(55016002)(8936002)(66556008)(71200400001)(66446008)(66476007)(64756008)(316002)(5660300002)(66946007)(9686003)(86362001)(76116006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6060
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0bfcb2d2-6f45-424d-c85c-08d97f450ce1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p6MsYrL2oxh+UITGF+vhvSKDSccxflYE9rtCz34CO/0TwgR0MLKbtAaX71x3Nny3tgNUX2vtNb7ki+86laZ+T7XcSiqRp9K5LWHdb964OxFERZA+yjFhz8tNKswho7r08O9JF4NRTdHxliA1Rai5zpwOkpkw37HpmOCf27z7wZCfNlBCU8p+IIRufSV3ESGL2Siw3bn13vCi6Pc+sNzDWd4WwrYAOrZnKaDVQRlc0DSUiOsBgjcGFNXw9957abUDC5wdQHjUtuuKeJGAn0U1EhebUuRy64v2HtWiYsrS7vNLGimWyFIbi16S1WfhnJPqmmj8oEE/NXr9sNNI6RxSlMd8Sh9+revbGd427L2JDik3Wvw8euzb4Uu8vUkYy6NZ97pTodf4tt+W0exQyuEWcVE6H8B/BSxnkJyzT7pr362NX16X4Wyc7QtuZZT/53AZHdEqQ0JlZEzEgjUo/RiYg35GYmM/m+17/j5N5RDi/PG76ea+IzsNFDMwvaP1KUOgvFod6+eCpNlnqC3ib5Lw7BxiIr+MtD3i3nE9whol6FcVuySxzbenMn1rgotgoyd/nq/7w/fZcdHMFkHnm+hp5TLMg6jJt7hXDUzz1pkn3mDsl4yPXJw1vF0ffkxUd3iEGphe8zIA971DIARu/rzc03oHuqVH4j5XmOnK020XuM9gc4P9//QNdtzxucbbiACpMz1isHhLQxafJBl7ZOPGOA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(26005)(4326008)(33656002)(2906002)(55016002)(70206006)(336012)(6862004)(8676002)(86362001)(54906003)(53546011)(36860700001)(52536014)(186003)(8936002)(356005)(82310400003)(6506007)(508600001)(9686003)(5660300002)(316002)(70586007)(47076005)(83380400001)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:21:39.6516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6dca47c-f9d9-4cc3-8e50-08d97f4518e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3892

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyMcTqOdTCMjTI1SA4OjA1DQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmc7DQo+
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAwNi8zN10geGVuL2FybTogdXNlICFDT05GSUdfTlVNQSB0byBrZWVwIGZha2Ug
TlVNQSBBUEkNCj4gDQo+IE9uIFRodSwgMjMgU2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+
IFdlIGhhdmUgaW50cm9kdWNlZCBDT05GSUdfTlVNQSBpbiBwcmV2aW91cyBwYXRjaC4gQW5kIHRo
aXMNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGENCj4gDQo+ID4gb3B0
aW9uIGlzIGVuYWJsZWQgb25seSBvbiB4ODYgaW4gY3VycmVudCBzdGFnZS4gSW4gYSBmb2xsb3cN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeIGF0IHRoZQ0KPiANCj4gPiB1cCBw
YXRjaCwgd2Ugd2lsbCBlbmFibGUgdGhpcyBvcHRpb24gZm9yIEFybS4gQnV0IHdlIHN0aWxsDQo+
ID4gd2FudCB1c2VycyBjYW4gZGlzYWJsZSB0aGUgQ09ORklHX05VTUEgdGhyb3VnaCBLY29uZmln
LiBJbg0KPiAgICAgICAgICAgICAgXiB0byBiZSBhYmxlIHRvIGRpc2FibGUgQ09ORklHX05VTUEg
dmlhIEtjb25maWcuDQo+IA0KPiANCj4gPiB0aGlzIGNhc2UsIGtlZXAgY3VycmVudCBmYWtlIE5V
TUEgQVBJLCB3aWxsIG1ha2UgQXJtIGNvZGUNCj4gICAgICAgICAgICAgICAgICBeIHRoZQ0KPiAN
Cj4gPiBzdGlsbCBjYW4gd29yayB3aXRoIE5VTUEgYXdhcmUgbWVtb3J5IGFsbG9jYXRpb24gYW5k
IHNjaGVkdWxlci4NCj4gICAgICAgICBeIGFibGUgdG8gd29yaw0KPiANCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiANCj4gV2l0aCB0aGUgc21h
bGwgZ3JhbW1hciBmaXhlczoNCj4gDQo+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IA0KPiANCg0KVGhhbmtzLCBJIHdpbGwgZml4IHRo
ZW0gaW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gLS0tDQo+ID4gIHhlbi9pbmNsdWRlL2FzbS1hcm0v
bnVtYS5oIHwgNCArKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gaW5kZXggOWQ1NzM5NTQyZC4uOGYxYzY3ZTNlYiAxMDA2
NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+ICsrKyBiL3hlbi9p
bmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gQEAgLTUsNiArNSw4IEBADQo+ID4NCj4gPiAgdHlw
ZWRlZiB1OCBub2RlaWRfdDsNCj4gPg0KPiA+ICsjaWZuZGVmIENPTkZJR19OVU1BDQo+ID4gKw0K
PiA+ICAvKiBGYWtlIG9uZSBub2RlIGZvciBub3cuIFNlZSBhbHNvIG5vZGVfb25saW5lX21hcC4g
Ki8NCj4gPiAgI2RlZmluZSBjcHVfdG9fbm9kZShjcHUpIDANCj4gPiAgI2RlZmluZSBub2RlX3Rv
X2NwdW1hc2sobm9kZSkgICAoY3B1X29ubGluZV9tYXApDQo+ID4gQEAgLTI1LDYgKzI3LDggQEAg
ZXh0ZXJuIG1mbl90IGZpcnN0X3ZhbGlkX21mbjsNCj4gPiAgI2RlZmluZSBub2RlX3N0YXJ0X3Bm
bihuaWQpIChtZm5feChmaXJzdF92YWxpZF9tZm4pKQ0KPiA+ICAjZGVmaW5lIF9fbm9kZV9kaXN0
YW5jZShhLCBiKSAoMjApDQo+ID4NCj4gPiArI2VuZGlmDQo+ID4gKw0KPiA+ICBzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGludCBhcmNoX2hhdmVfZGVmYXVsdF9kbWF6b25lKHZvaWQpDQo+ID4gIHsN
Cj4gPiAgICAgIHJldHVybiAwOw0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+ID4NCg==

