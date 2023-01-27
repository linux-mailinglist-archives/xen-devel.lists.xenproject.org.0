Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25B567E3E7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485516.752804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN9C-0005Gu-3W; Fri, 27 Jan 2023 11:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485516.752804; Fri, 27 Jan 2023 11:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN9C-0005Es-0W; Fri, 27 Jan 2023 11:43:58 +0000
Received: by outflank-mailman (input) for mailman id 485516;
 Fri, 27 Jan 2023 11:43:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JKSU=5Y=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLN9B-0005Ek-1T
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:43:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2072.outbound.protection.outlook.com [40.107.104.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0ae37ec-9e37-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:43:55 +0100 (CET)
Received: from AS9PR04CA0046.eurprd04.prod.outlook.com (2603:10a6:20b:46a::26)
 by GV1PR08MB7876.eurprd08.prod.outlook.com (2603:10a6:150:5f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 11:43:49 +0000
Received: from AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::36) by AS9PR04CA0046.outlook.office365.com
 (2603:10a6:20b:46a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 11:43:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT014.mail.protection.outlook.com (100.127.140.163) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 11:43:49 +0000
Received: ("Tessian outbound 43b0faad5a68:v132");
 Fri, 27 Jan 2023 11:43:48 +0000
Received: from 9fd30c872713.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 877A6A2B-C1D4-4776-AF54-18D5574531DE.1; 
 Fri, 27 Jan 2023 11:43:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9fd30c872713.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Jan 2023 11:43:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6297.eurprd08.prod.outlook.com (2603:10a6:10:20b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 11:43:41 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Fri, 27 Jan 2023
 11:43:41 +0000
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
X-Inumbo-ID: e0ae37ec-9e37-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0E9/pU3fuaw+nh0NzIeuODgm/QU38osue3b8VFLQ5Gs=;
 b=I2ZoBcmEzY/ZgDhEPfa/bWPvHI4JFVUZsIk8+6r9QVIvkvSbQ4EixOMOxPgU9iD6wZk3HeTpUMo76UsVGN2UAyKArzFm6be+uCgKmvnZdIRQOzZP4WE6yvBGlcevIGBSITv1+YlnJVOJ4EY3NH55JBKI5UHtOnGrh6owySYyRhM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCh+pyQTm/dUr2N4L48rhAUSbA6+i8T7M6cCSKBGw2G7f4zMDn1MUAbKZJfPCLEd0dxuHWaRe8pOFf50WJdt1GtowEqeLuFnW6Z+qaU8+Akdk3BaVJGZ1IvYHAEHGWD62AjdJcLYT51lvMrXeIT4sPj5ektpUQ6mrjIMN6JX3x7EvgLjPtrDv6Lug0M54l/hlUJkJJzT1Dhnx0XGPYU46Z1ETI2ier6zt8UJhgY1+CjLKqB0YvoMsZ6mpstjb/Czcl0UaDHM80I5YxDPccqTbecoCMVAQVlrTUsiTWOUuYWNAX5LNL8P01VlWnJ2P+qPPnji39quyAPDwUWDnmObqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0E9/pU3fuaw+nh0NzIeuODgm/QU38osue3b8VFLQ5Gs=;
 b=ShWRHAJdkyevaHWHsGlSrPbUaUKYQQyZOLfqRIFpRKTT6jHwAkqnINMtjM2/I12Ax88f8E2u3WOp1K7HnniZZCaNvk4vKXEQSgsWuNlAtw6CPhg3oSPsgJefT2IhQd6wZoKyP8h9flF6Fz2SB0/YGzL0TkAFqjdjbzMWeviiVLgx0bf794FUE1Wqi1kjJhsGaqAJiT89Xx9ECZVtz1a8rTTkuZJjVIqWSXQUCjuXtYjtHWIi80v0B5Y+4IIiN1jfwqyNbgs6ZWSYqjg1rQ+kvgXNdNxCfed6QZB0VFuXek+aRXgmngrFDSQcj30oxmermGqJlhDN+CeSexiP9xuZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0E9/pU3fuaw+nh0NzIeuODgm/QU38osue3b8VFLQ5Gs=;
 b=I2ZoBcmEzY/ZgDhEPfa/bWPvHI4JFVUZsIk8+6r9QVIvkvSbQ4EixOMOxPgU9iD6wZk3HeTpUMo76UsVGN2UAyKArzFm6be+uCgKmvnZdIRQOzZP4WE6yvBGlcevIGBSITv1+YlnJVOJ4EY3NH55JBKI5UHtOnGrh6owySYyRhM=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Thread-Topic: [PATCH v2 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Thread-Index: AQHZD2qaLVIiQ3Z13EK3E/FV+D1Sxa6vQQGAgAMop3A=
Date: Fri, 27 Jan 2023 11:43:41 +0000
Message-ID:
 <AS8PR08MB79910E7BC6B095415CAE07FA92CC9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221214031654.2815589-1-Henry.Wang@arm.com>
 <20221214031654.2815589-2-Henry.Wang@arm.com>
 <bb52731d-94b3-694b-8038-8c87dd986654@xen.org>
In-Reply-To: <bb52731d-94b3-694b-8038-8c87dd986654@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5A1F901BEE41AB438AE2D6A6A80F8A78.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6297:EE_|AM7EUR03FT014:EE_|GV1PR08MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b967224-a736-4519-ffc1-08db005bc176
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rr01SAyVckYiQeTkk8FbcXon/f4Bg7seHJaOU4kc69hIFH/bCEO+1LNfTB/YmM1nCMcku4s/FKIniNftX1yNws9Upel3dq3BrbysXb9njBNusm4iWzUW2BhdTXbzGjW0kigvdjjNW6BXztkG/UKDYxIRmp5BBSVIQC9C+LKDCdFCuZlXqy+5e+cVFjcMWJmPPABGQThRlpPUJA/l9Kg/h+HVmLCbF7o0zZ8Sz7XvxIxqo15dZdaD+SI8mmXwSrFRr6BuyuF+RTu8rik2vKG62DbUv4dJrZ1kpdfBid2rDt7prW9iuGNVq6PaNVRXFAy49JhFF6HPiTnAPRpRlPjUA9Xpn6nkIbPjZsg1UAuPCnXqlCOybTT0YzFTeB7UF526ms4ahrHsCVgaXhQ+FVwAgi0K4ru0BEOk7zW6ug9U6axpHIhD+xMPT+MyARiKcLgT1d9RFTjO2WPq6S7xRfZjqJSleOT0lIRVN2zWE9SmbJz0JMwbitU/YlSTv0jv/OCrlEhNkacVKhOq4rl2zgO5uXaL6Lo0cW90fBLGp0zllzfRBzN5QOwSztpZn9JUsDwWnyOJ8Rr4FXGknhxiNiJAp4QIZnfK/5g8BoCABe3q71pBnzPWyHbaCBjdkY76a5YYem3CjIvAFagemmVwI1AU8rfwc3a5hKF4PYvoQR76+vzu7XrL6cx7Nxoklu/or0ZITGemZ5NTGQWQgJ0SaL8iRw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199018)(5660300002)(8936002)(2906002)(41300700001)(4326008)(66946007)(66476007)(66556008)(66446008)(8676002)(64756008)(54906003)(316002)(110136005)(186003)(9686003)(26005)(71200400001)(52536014)(76116006)(53546011)(33656002)(7696005)(6506007)(478600001)(83380400001)(122000001)(86362001)(38070700005)(38100700002)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6297
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9a28e0e-7ca7-4582-316e-08db005bbd20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D87RSzcxQfO8dEAeUA9tF+BmvyHvk8pHg0haCmbJTci9P06Zfo/h7dc92NfyP940j5qmevijb/64jfkVK0QS10uDsBn3XeQmvaiy2R8F/zR37S3N3jAPTgiSg5HabjFTTJSOJCeoL7Zku/2YrYBFN6GpBAW05KMMFY0xwisxvO5YNvkMI7tOutTU8gCHB+DeeQ9c9StOKNEbVdYCc0mJ+GA98tzHFt1FEDuUVVRLS/qkCc1Yl2kHQ3Bx8+H7zZ0qmUtvisehiYVJhlKIzKuENicG5thorwHBjcr/smHQoQHgLCwidWStvDtW5QWg1oZk45MNopLBroW0cbzNlvpkxcKBeyTcfzR5lZcjOs7+VbHvVFtOBP0RrNnVJ4Dih7EfrrqUbew0GIyweVjLPa8z61BSIe0CwO4yIvDPZktSFCLCU7Ew28Ehj27VRZL2ipURGmUtAYMqpRoTO3/fpCpRmMQMG/i21Iqk/KTAR9No5KMqXVva8g7j1Ie3WnxadaO6LvcR/AqZhw9neiKguWgYxJ+xsWvuhImxbwnagSs8jsOdZcIa2AtzaJXCMzRM28l90YvVPs3RBeHty3dvK0CJg3ebqruVz2CbOjnLePDS6t1T8SIeNNtmYZy3twQsHBylN/K4zJxt7NjhwGzAfx17ldRIZaL78H8DoMavJGSdi/hjU51fn1BD10/RfHTbDYU5pBzougrToRVYdR34Qt2pzg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199018)(36840700001)(46966006)(40470700004)(478600001)(186003)(83380400001)(336012)(82310400005)(6506007)(33656002)(40460700003)(9686003)(316002)(81166007)(53546011)(55016003)(41300700001)(7696005)(8676002)(2906002)(5660300002)(36860700001)(8936002)(54906003)(26005)(4326008)(70586007)(70206006)(107886003)(86362001)(40480700001)(356005)(52536014)(47076005)(82740400003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 11:43:49.0257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b967224-a736-4519-ffc1-08db005bc176
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7876

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMS8zXSB4ZW4vYXJtOiBBZGQgbWVtb3J5IG92ZXJsYXAgY2hlY2sgZm9yDQo+
IGJvb3RpbmZvLnJlc2VydmVkX21lbQ0KPiANCj4gSGkgSGVucnksDQo+IA0KPiBPbiAxNC8xMi8y
MDIyIDAzOjE2LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgX19pbml0
IG1lbWluZm9fb3ZlcmxhcF9jaGVjayhzdHJ1Y3QgbWVtaW5mbyAqbWVtaW5mbywNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgcmVnaW9uX3N0YXJ0
LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdCBy
ZWdpb25fZW5kKQ0KPiANCj4gSSBhbSBzdGFydGluZyB0byBkaXNsaWtlIHRoZSB1c2Ugb2YgJ2Vu
ZCcgZm9yIGEgY291cGxlIG9mIHJlYXNvbnM6DQo+ICAgIDEpIEl0IG5ldmVyIGNsZWFyIHdoZXRo
ZXIgdGhpcyBpcyBpbmNsdXNpdmUgb3IgZXhjbHVzaXZlDQo+ICAgIDIpIFdoZW4gaXQgaXMgZXhj
bHVzaXZlLCB0aGlzIGRvZXNuJ3QgcHJvcGVybHkgd29yayBpZiB0aGUgcmVnaW9uDQo+IGZpbmlz
aCBhdCAoMl42NCAtIDEpIGFzICdlbmQnIHdvdWxkIGJlIDANCg0KR29vZCBwb2ludHMhDQoNCj4g
DQo+IEkgaGF2ZSBzdGFydGVkIHRvIGNsZWFuLXVwIHRoZSBBcm0gY29kZSB0byBhdm9pZCBhbGwg
dGhvc2UgaXNzdWVzLiBTbw0KPiBmb3IgbmV3IGNvZGUsIEkgd291bGQgcmF0aGVyIHByZWZlciBp
ZiB3ZSB1c2UgJ3N0YXJ0JyBhbmQgJ3NpemUnIHRvDQo+IGRlc2NyaWJlIGEgcmVnaW9uLg0KDQpT
byBJIHdpbGwgdXNlICdzdGFydCcgYW5kICdzaXplJyBpbiB2My4NCg0KPiANCj4gPiArLyoNCj4g
PiArICogR2l2ZW4gYW4gaW5wdXQgcGh5c2ljYWwgYWRkcmVzcyByYW5nZSwgY2hlY2sgaWYgdGhp
cyByYW5nZSBpcyBvdmVybGFwcGluZw0KPiA+ICsgKiB3aXRoIHRoZSBleGlzdGluZyByZXNlcnZl
ZCBtZW1vcnkgcmVnaW9ucyBkZWZpbmVkIGluIGJvb3RpbmZvLg0KPiA+ICsgKiBSZXR1cm4gMCBp
ZiB0aGUgaW5wdXQgcGh5c2ljYWwgYWRkcmVzcyByYW5nZSBpcyBub3Qgb3ZlcmxhcHBpbmcgd2l0
aCBhbnkNCj4gPiArICogZXhpc3RpbmcgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMsIG90aGVyd2lz
ZSAtRUlOVkFMLg0KPiA+ICsgKi8NCj4gPiAraW50IF9faW5pdCBjaGVja19yZXNlcnZlZF9yZWdp
b25zX292ZXJsYXAocGFkZHJfdCByZWdpb25fc3RhcnQsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgcmVnaW9uX3NpemUpDQo+IA0KPiBOb25l
IG9mIHRoZSBjYWxsZXIgc2VlbXMgdG8gY2FyZSBhYm91dCB0aGUgcmV0dXJuIChvdGhlciB0aGFu
IGl0IGlzDQo+IGZhaWxpbmcgb3Igbm90KS4gU28gSSB3b3VsZCBwcmVmZXIgaWYgdGhpcyByZXR1
cm5zIGEgYm9vbGVhbiB0byBpbmRpY2F0ZQ0KPiB3aGV0aGVyIHRoZSBjaGVjayBwYXNzIG9yIG5v
dC4NCg0KU3VyZSwgd2lsbCBmaXggaW4gdjMuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

