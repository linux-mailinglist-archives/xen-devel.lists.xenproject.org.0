Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEFE798037
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 03:32:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597737.932067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeQLh-0006fO-Tk; Fri, 08 Sep 2023 01:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597737.932067; Fri, 08 Sep 2023 01:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeQLh-0006eF-Qk; Fri, 08 Sep 2023 01:31:53 +0000
Received: by outflank-mailman (input) for mailman id 597737;
 Fri, 08 Sep 2023 01:31:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01z4=EY=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qeQLg-0006e9-1e
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 01:31:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7aae5561-4de7-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 03:31:49 +0200 (CEST)
Received: from DU2PR04CA0224.eurprd04.prod.outlook.com (2603:10a6:10:2b1::19)
 by PAVPR08MB9673.eurprd08.prod.outlook.com (2603:10a6:102:31c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Fri, 8 Sep
 2023 01:31:45 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::10) by DU2PR04CA0224.outlook.office365.com
 (2603:10a6:10:2b1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Fri, 8 Sep 2023 01:31:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30 via Frontend Transport; Fri, 8 Sep 2023 01:31:45 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Fri, 08 Sep 2023 01:31:45 +0000
Received: from e2d7d4ec75cf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 876DE4C8-3AF7-4A8B-A42A-2BA2431FBAAC.1; 
 Fri, 08 Sep 2023 01:31:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2d7d4ec75cf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Sep 2023 01:31:38 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7635.eurprd08.prod.outlook.com (2603:10a6:20b:477::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Fri, 8 Sep
 2023 01:31:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 01:31:36 +0000
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
X-Inumbo-ID: 7aae5561-4de7-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDCzTR6VZpEex9RTkrfVlKNgQl7EGmki4x9mvdIiwMo=;
 b=CMMzD4VcZaME/qZfSHga9xTbBZGqdpWnWifkuZxUz36JTdV/AsiczFOnIlACYjz/Cdo+I7HEXHgS9cLy17PjCyPlR7HG2/IITMmy+xjCB2eRBpTBqSQuOwxFWWyjIUz583eccHEcnLX+IAA8vN2+T23I1a3TbbEFvGkbdGRp3zA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ffea37babd4f76ed
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuUeeGY3YwOxIBNgztISkLkRATbhT/Fe3xwvLvy6pyFQUotcz827fXIq0UFZam8hizIJjMHrQA/Dm/NGwW+CXinQTH0H1mG2Isa0DYFStVoDUN9zUc98oPC+usp7qCha370pmWLDNwbr8DopB4I0b3IOMOpuKma4HjOB/rMBTIXDplnPsuRM48PGN3m2MtQ7yDBrPhRVEqjS2kd+HLna4XOfBPTJYV8BMSQb5RbYPyRu4zHvEJi6C7ebGbg0thdE6MnNOeWC+/zb70tm48TdBdBG7SSTsJvsOfX9cLmCwdTMVNIKTjv2LHdrZ5C8SIIzl9BfDI/Isrt6vkwuNzO2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDCzTR6VZpEex9RTkrfVlKNgQl7EGmki4x9mvdIiwMo=;
 b=YJXjefscVxgPW57TA3vKxOLqu1moDXRLToba06Xos3/seRpYcbJPPrRz45ghjQf2OI3MOfXl9xwK0xzklejp7vhnF79qVnxK/ZruklezBW3jlbbpNXww4J4RowZKwSvrJUf8TEzhczR4+ZwRhkM+OussgrIKB24WNUEVR0cxkn/qqsaHaidPnnk+s4INzdKPrHPy5h8LRafdn0+pEPCe1oW0F54Mt9Hf4E9S+RPv2RdSUbJeHq9FSbpflnandq031cAHgfEyLE2DZwBtRucYOxY+1c9+O4KS/f0Rq+e4TeJ4U/ZBe02xfRRxTWi2UYbr9YwQ1t2tz9yoOW4Ug18SBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDCzTR6VZpEex9RTkrfVlKNgQl7EGmki4x9mvdIiwMo=;
 b=CMMzD4VcZaME/qZfSHga9xTbBZGqdpWnWifkuZxUz36JTdV/AsiczFOnIlACYjz/Cdo+I7HEXHgS9cLy17PjCyPlR7HG2/IITMmy+xjCB2eRBpTBqSQuOwxFWWyjIUz583eccHEcnLX+IAA8vN2+T23I1a3TbbEFvGkbdGRp3zA=
From: Henry Wang <Henry.Wang@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: Re: [PATCH v6 09/13] xen/arm: Extract MMU-specific MM code
Thread-Topic: [PATCH v6 09/13] xen/arm: Extract MMU-specific MM code
Thread-Index: AQHZ2U+mi6GEY8HiTE22n7xoslprBrAPS/YAgADpx4A=
Date: Fri, 8 Sep 2023 01:31:36 +0000
Message-ID: <FC26F094-ED04-4E5F-904F-3B09E6605D31@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-10-Henry.Wang@arm.com>
 <3e32512e-07d1-34c7-bc51-11dfe061f903@amd.com>
In-Reply-To: <3e32512e-07d1-34c7-bc51-11dfe061f903@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS1PR08MB7635:EE_|DBAEUR03FT023:EE_|PAVPR08MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe67e4a-d9de-4a7b-44da-08dbb00b5cd6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GI9opyBTIdlnBaLNfT6sjk1lk/KzvDszASz/US4iywgv5MB6+whlZSlCKkDGEjuSpZfZeknvsBkJzuaK3ssDLkS1lLGKIeC5BQbciIIsrR4hi7izyYNJGmvEVq6Z0J8EdwigwsExYm7vQTchiiTP/SE/tNM1WeBh4C7CMC852OPgyvFIQoMg8prI3GKYiNPwxuSe3285bmR9IX4iT2eAe8I87uYQWHLcmBtlchLz8Yy3eCvufdz+Kc7HWniLQvtSi73XpD+NrXYZmIME3JyCxyhqzNkBJ6qk4uCCb8+DP6VojE9ee3K39njYaW1NebKjKGIRSwSW9jLpMU8umefpTMpWjD8NiiU8S3wYWVhisj8C2IY3JWBj32Cx56y0kS3vrJZLJvTopACjWdVcSfy+x5qlTu4zxTVisK6mTlVERg0ZNR1ZorBnrkjRLPEfWD7RDvRQJ62E1TYUxFPVEfxTUaF2q8wOweja5TFdqpoW/zgAfgbYHld/wBICcKfNV9zHkyMu/N850K1yf79ZPNORqD2cLvlzC469x3GfnjPEnVpYf1Ln+u41ulb1H3RM3Y4OCqVjCcLCr80R3XDdgEcwZn4/LUFZF2NMJ63B3+RgIFRJaQgNLu5mMJqih8W2z0ybjyI7pRUmtF7+86HdaefZ9Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(39860400002)(136003)(186009)(451199024)(1800799009)(33656002)(36756003)(38070700005)(38100700002)(86362001)(71200400001)(478600001)(5660300002)(26005)(53546011)(6506007)(66556008)(6486002)(54906003)(91956017)(64756008)(66946007)(76116006)(66476007)(66446008)(316002)(6916009)(8676002)(4326008)(8936002)(41300700001)(2616005)(6512007)(122000001)(83380400001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8527B3DFC40A6D49945255506F38E204@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7635
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31166880-bff2-4432-51d3-08dbb00b5766
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ib0zlYb9wC+IpNaYvZJXeKIzo60gr1l2KTliPRJFdpCH/+t+WKsJ7Q8xZH+7cJ5ATm6rsn6FG4HHNJLRhRahxQNaZzmnv0lVHrkcA1395ZLvxIARxID+ljaS0gasforvfVpSJppqjAfYS04364M7v7wKpdDTipyLfl2MxZJP1jIrcI2lJDUCcWvxr2jPZwfitVedpd0HSQRZmmdPsoYLdxzV6HbCBFDRClOk0H1KyR2KYAaDAZOh6glXQBiqRInhZ3tBKpMgYn2LwQq0FhvWzsnfShKyMaKHxmoKiPa+xPymUxpiIbh0oT19p0FVE5f1MLK9kViSsuJnvIqRpy5rV6OtJtxYhJiZK/L1K/ezgOauZ3AmxxIVHcMhfK7GLTSeJ9skCfqNMm+4oP3egmT8/HirGZZw7KQ2cwsiP7bVsDY2a6qrXXEwJuMudOeLFel7oAW70b9sAp2/91+VoNT0tSGdHBHb70p0xzL1ALZ7G9lY0ALTLOIKKff7I2/txV/R6bVR+/knL11yDDag1rvYgsL3WKQ8OSku6d4kqzBEOUwAWXgY1/I02lJGXuVRcGTd8EPe2w0Oa1hh5BcU7slWl8GvYBDTg5ufPqeC7eFTW/rZtF5W0Lo9a/aXXl3qhMgEl6k7TAsop4q9H5A7k4ig9o4DnUaCor8sctPc2PEL8zQT8lU0cqD3ZpEwd+IBUt7Jl1Wqelw+KwDPgbRov4n6DrhS89ZMtdOtj8t+WBbmtgSmek8AYKjXqEX/1puJbCex
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(1800799009)(186009)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(33656002)(36756003)(86362001)(40480700001)(81166007)(478600001)(26005)(5660300002)(53546011)(6506007)(70206006)(316002)(54906003)(70586007)(6486002)(336012)(41300700001)(2616005)(4326008)(8936002)(6512007)(6862004)(8676002)(2906002)(40460700003)(47076005)(36860700001)(356005)(82740400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 01:31:45.1575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe67e4a-d9de-4a7b-44da-08dbb00b5cd6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9673

SGkgQXlhbiwNCg0KPiBPbiBTZXAgNywgMjAyMywgYXQgMTk6MzQsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFua3VtYUBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEhlbnJ5LA0KPiANCj4+ICsNCj4+
ICtleHRlcm4gbWZuX3QgZGlyZWN0bWFwX21mbl9zdGFydCwgZGlyZWN0bWFwX21mbl9lbmQ7DQo+
IA0KPiBBcyB5b3UgYXJlIGRlY2xhcmluZyB0aGVtIGZvciBNTVUgc3BlY2lmaWMgLCB5b3UgYWxz
byBuZWVkIHRoaXMgY2hhbmdlIDotDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Nl
dHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiBpbmRleCA4OWVjYjU0YmUyLi4xOWI2MGM1
ZDFiIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPiArKysgYi94ZW4vYXJj
aC9hcm0vc2V0dXAuYw0KPiBAQCAtNjcwLDcgKzY3MCw3IEBAIHZvaWQgX19pbml0IHBvcHVsYXRl
X2Jvb3RfYWxsb2NhdG9yKHZvaWQpDQo+IA0KPiAgICAgICAgICAgICAgcyA9IGJvb3RpbmZvLnJl
c2VydmVkX21lbS5iYW5rW2ldLnN0YXJ0Ow0KPiAgICAgICAgICAgICAgZSA9IHMgKyBib290aW5m
by5yZXNlcnZlZF9tZW0uYmFua1tpXS5zaXplOw0KPiAtI2lmZGVmIENPTkZJR19BUk1fMzINCj4g
KyNpZiAoQ09ORklHX0FSTV8zMiAmJiBDT05GSUdfTU1VKQ0KPiAgICAgICAgICAgICAgLyogQXZv
aWQgdGhlIHhlbmhlYXAsIG5vdGUgdGhhdCB0aGUgeGVuaGVhcCBjYW5ub3QgYWNyb3NzIGEgYmFu
ayAqLw0KPiAgICAgICAgICAgICAgaWYgKCBzIDw9IG1mbl90b19tYWRkcihkaXJlY3RtYXBfbWZu
X3N0YXJ0KSAmJg0KPiAgICAgICAgICAgICAgICAgICBlID49IG1mbl90b19tYWRkcihkaXJlY3Rt
YXBfbWZuX2VuZCkgKQ0KPiBAQCAtNzA4LDcgKzcwOCw3IEBAIHZvaWQgX19pbml0IHBvcHVsYXRl
X2Jvb3RfYWxsb2NhdG9yKHZvaWQpDQo+ICAgICAgICAgICAgICBpZiAoIGUgPiBiYW5rX2VuZCAp
DQo+ICAgICAgICAgICAgICAgICAgZSA9IGJhbmtfZW5kOw0KPiANCj4gLSNpZmRlZiBDT05GSUdf
QVJNXzMyDQo+ICsjaWYgKENPTkZJR19BUk1fMzIgJiYgQ09ORklHX01NVSkNCj4gICAgICAgICAg
ICAgIC8qIEF2b2lkIHRoZSB4ZW5oZWFwICovDQo+ICAgICAgICAgICAgICBpZiAoIHMgPCBtZm5f
dG9fbWFkZHIoZGlyZWN0bWFwX21mbl9lbmQpICYmDQo+ICAgICAgICAgICAgICAgICAgIG1mbl90
b19tYWRkcihkaXJlY3RtYXBfbWZuX3N0YXJ0KSA8IGUgKQ0KPiANCj4gU28gdGhhdCBkaXJlY3Rt
YXBfbWZuX2VuZCBhbmQgZGlyZWN0bWFwX21mbl9zdGFydCBpcyB1c2VkIG9ubHkgd2hlbiBNTVUg
aXMgZW5hYmxlZC4NCg0KSSBhbSBub3QgMTAwJSBzdXJlIG9uIHRoaXMsIGJlY2F1c2UgY3VycmVu
dGx5IHRoZXJlIGlzIG5vIE1QVSBjb2RlIGF0DQphbGwsIGluZGljYXRpbmcgYWxsIHNldHVwLmMg
aXMgTU1VIHNwZWNpZmljLiBJbiB0aGlzIGNhc2UgYWRkaW5nIOKAnCYmIENPTkZJR19NTVXigJ0N
CnNlZW1zIGEgbGl0dGxlIGJpdCByZWR1bmRhbnQgdG8gbWUuIEJ1dCBJIGFncmVlIHlvdSBtYWRl
IGEgcG9pbnQgYW5kIGl0IGlzIGNvcnJlY3QNCnRoYXQgd2hlbiB0aGUgTVBVIGNvZGUgaXMgaW4s
IHRoZXNlIOKAnGRpcmVjdG1hcOKAnSBwYXJ0IHNob3VsZCBiZSBnYXRlZCB3aXRoDQpDT05GSUdf
TU1VIChvciBtYXliZSBzcGxpdCB0aGUgY29kZSBiZXR3ZWVuIGFybTMyL2FybTY0IHRvIGRpZmZl
cmVudCBoZWxwZXJzDQp0byBhdm9pZCAjaWZkZWYpLiBIZW5jZSBJIHdvdWxkIHByZWZlciBkb2lu
ZyB0aGVzZSBjaGFuZ2Ugd2hlbiB0aGUgTVBVIGNvZGUgaXMgYWRkZWQuDQoNCkxldOKAmXMgc2Vl
IHdoYXQgbWFpbnRhaW5lcnMgd2lsbCBzYXkuIEkgYW0gaGFwcHkgdG8gZG8gdGhlIGNoYW5nZSBv
bmNlIHdlIGhhdmUNCmFuIGFncmVlbWVudC4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAN
Cj4gLSBBeWFuDQoNCg==

