Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6EF7CD19C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 03:06:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618391.961975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsv0O-0004Iw-1x; Wed, 18 Oct 2023 01:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618391.961975; Wed, 18 Oct 2023 01:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsv0N-0004G5-UP; Wed, 18 Oct 2023 01:05:47 +0000
Received: by outflank-mailman (input) for mailman id 618391;
 Wed, 18 Oct 2023 01:05:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5aw=GA=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qsv0M-0004Fz-Kt
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 01:05:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 764d73f5-6d52-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 03:05:44 +0200 (CEST)
Received: from DU6P191CA0049.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::8) by
 VI1PR08MB9983.eurprd08.prod.outlook.com (2603:10a6:800:1c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Wed, 18 Oct
 2023 01:05:39 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:53e:cafe::17) by DU6P191CA0049.outlook.office365.com
 (2603:10a6:10:53e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 01:05:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 01:05:38 +0000
Received: ("Tessian outbound fb5c0777b309:v211");
 Wed, 18 Oct 2023 01:05:38 +0000
Received: from a875e53fbac5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AD3FCA65-6F54-425E-9D89-BB7803D6C913.1; 
 Wed, 18 Oct 2023 01:05:32 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a875e53fbac5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 Oct 2023 01:05:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB8969.eurprd08.prod.outlook.com (2603:10a6:20b:5b4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 01:05:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 01:05:27 +0000
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
X-Inumbo-ID: 764d73f5-6d52-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41r4oovqyX9lXtJQ5PNApsKYxYNoamCpYxDPNO4cbSo=;
 b=evP/II9FlESuPrBe+1sh6NzI/R7MobktVGM3WqOXjxJ31U7/d/A5WofDzEPLDW9VVbMgz8HUYikp7x1yZ9NArVTdrpBT3D9TT3FPJ3p+DBaDkn6n6K4k+iaqxhtbS8K6DpwS0PWNhhvLSX+ptODAE3tW3hKO8NNPARhndI9ELEo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 619f89e99f420082
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=edVrPnacu64BZV0icXSe3uxXHFFdTNYqa7a0C5efFVpg82heuTd/Z9y/89+/39LwaFjKNQh1BKAS+XViPyKdrsV+KvThTELbu1sZ4KpeBMXqNqr+avGynqmuS8sgZycpEOfmV6qA3PfXk+T2wQkDislsO4+sg42Wr6DVKn7tH8+lec3JdvOAjyo9m6APYAwV267ncnMX4dPO9stOhdn5+2riQbhg00+un+6NA3nBJP8CBS6fJ2ppqgX7UmPxpJPX4LCz4CGVffrtHzMToKUOZS7Uegzv2vki9bO1qzyhyeZFiDy19IXMCn6w4FCN/p8TKa9p0iuNM7OHo9Q0KPRmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41r4oovqyX9lXtJQ5PNApsKYxYNoamCpYxDPNO4cbSo=;
 b=P+TxmbTGPwmJWYeVaSveKpGQdPgLFPySA2CBiNSvqOARyoFGP3WtNPVqZQpWHNBc9eW7y8zVHt0DdJAvq7oRuUI0KMWRRKx2/YnEgutDK3RtEOLKNKB0aGIXFJ1LPm1GelxNJ6t4GGx2cHbnAstzVdP2rxIwkqHUbGz0z6snFKcf/x4/NLuosdEDRWhyg+B4Y76TrRjtnczQ6xrDPOWpz+o2hQcv9voRSMCQnQ8Xs4O0RuYEpXivypTLqz+A9npkaCwcxn0cUij3q99xh3wfJOYv4Yd18nr32xpsAjH1D2S0wPW7Vc6DbV0pVzzxi1c4JWjVqEE9zXFRl8UC8QiaYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41r4oovqyX9lXtJQ5PNApsKYxYNoamCpYxDPNO4cbSo=;
 b=evP/II9FlESuPrBe+1sh6NzI/R7MobktVGM3WqOXjxJ31U7/d/A5WofDzEPLDW9VVbMgz8HUYikp7x1yZ9NArVTdrpBT3D9TT3FPJ3p+DBaDkn6n6K4k+iaqxhtbS8K6DpwS0PWNhhvLSX+ptODAE3tW3hKO8NNPARhndI9ELEo=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: Re: [PATCH for-4.18] iommu/vt-d: use max supported AGAW
Thread-Topic: [PATCH for-4.18] iommu/vt-d: use max supported AGAW
Thread-Index: AQHaAPtNjoXmJF7Mn0CZnd7sKi5tRbBOvFgA
Date: Wed, 18 Oct 2023 01:05:27 +0000
Message-ID: <F767CA15-175D-47F2-A91E-8CEF8646D442@arm.com>
References: <20231017130943.18111-1-roger.pau@citrix.com>
In-Reply-To: <20231017130943.18111-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB8969:EE_|DBAEUR03FT033:EE_|VI1PR08MB9983:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a78a285-35fa-4e21-6b97-08dbcf7657b9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NuKwQfT53wVhRewm7kQk4BzyxfHfO9xYxDb60Z+j1TGJjOq9QHLJ0iU/AQ86u+hKgpV1uPejdHZisCesg+ZIOi0aH7JRW3unt2AnjoBrUx+aHCwd2mog8/ENkrt/sq7I24Gy5CGnRsAODU3S7cHi4pOkV5FHPuORy2WBVAdQxdneJa8hCGYr6lmXEfnNZXqL/qpLQvquwHaqY4w9tPu51imAAA/hKUD0PRkQNLLn//uqm1ECp2Mi6gNJt9XGEtd8NG1ThuelPSfz0VXKlmd3mZibJHh9CPIvQNMqUvMPGyRaOQq0yZOJvT+b42kJYsZlBJNjl3VZ/C9qBPc+9LY3oTYPB7lCO3J59vGgJzbArglsVbswWldJJy/MGLX1zJv8yxXbETuZSVhfxrcbfE6WgmS29IF+sM2/MB/7nxoJH2LQq7/3jgj9hkDRoUDGMq5EDzQ09Z1WlMRDvAJNqO4iE5E6mQPvVJiaGRgL4OADMzECKx9Z0kdV653i4PGd+u/M2tmA/yt9BD1xdOjjCnAgsSB5gnrTEaQ2wBej4NmrdGDXx6lziNSYR5UoSrLdCAy+FqOKWOtvUOLzfYEhpOAvdi4I5UWq8Y7NjZ+x9M7V/BZd31LoQHxAUx9zK4nZkpnIfC1VQQOXcGWIoZM5WfPq/g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(136003)(366004)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6512007)(26005)(53546011)(6506007)(2616005)(6486002)(71200400001)(478600001)(41300700001)(5660300002)(38100700002)(316002)(36756003)(122000001)(86362001)(38070700005)(2906002)(8676002)(33656002)(8936002)(4326008)(91956017)(54906003)(6916009)(64756008)(76116006)(66946007)(66556008)(66446008)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <74458759544D8341B510E194C78750DE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8969
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ab2b257-ee52-4442-f6b1-08dbcf7650e4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h0epZwaeggOl2m0WdBFrlX7TyFQ9WTsqAatqrPX460J8lDrAxRD5TLahEvtPg7BE9UnhN+9yyUg11cedX0K0eY3wYO8kU8vqLNJkeTQXfnzLPSDHrAOs8C8yRL9hqghdhVG9De03wKSZMe4AXwlDVtjvIT2iIsK4p4yn8LUgY1STiHMLat9d98qG8euM0jDE3o+06IKYgukIT0lUFnHGKGHQMwOcCy7plcUM0xsHjSNcIJdX+I36UiaEptmLa67KpAG+BLc/0CeMJJznCOZA0LkgAEJauUHIGYcL0vStAwQM5i2wJG64gla6knBIqFWl/hDqvYITWAohUsp3lMUwG7oNqIm/xHPpcwMMTz9FV13Y2w+zRQrN5xefU6iPywhPPEIHoPtTnajKvc+dvagdS93vK68oEG8oHh5mXRu5psxbQJ3EARcDXOjl53CondXstoEDeLHpuXtn7GA53TZWwEMiVMuJlqMuvBcIxHl5KH9O6P4mRsGoQ1v7kGo/WWt6Jydc7ucsXCnn8H2qBcFBKIzgc7N9ktVP4USzC9AilxsNltPp+gif7XTVDUHSguIeUBE91DCK85mWoqJ97vRByppn0o5VqcGpB5wVyTZZgOBVuWjWx1TIVLH3OeSfRmCeADNRCsSJvsNaU4lxhscj7Gnf8bnucYB/Wx2wZHVaRD0u69ENCmprpb7OI5INN5Rr2cshAZC5TB3bjlkaN4QgGYJl2FOZwsDcaGAR6medg3UG/EPOJadX191Rh2qGPYEy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(36756003)(70586007)(70206006)(54906003)(33656002)(40460700003)(86362001)(36860700001)(40480700001)(316002)(81166007)(5660300002)(356005)(8676002)(8936002)(2906002)(82740400003)(4326008)(6862004)(41300700001)(6512007)(53546011)(6506007)(2616005)(107886003)(336012)(26005)(6486002)(478600001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 01:05:38.7448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a78a285-35fa-4e21-6b97-08dbcf7657b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9983

SGkgUm9nZXIsDQoNCj4gT24gT2N0IDE3LCAyMDIzLCBhdCAyMTowOSwgUm9nZXIgUGF1IE1vbm5l
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBTQUdBVyBpcyBhIGJpdG1hcCBm
aWVsZCwgd2l0aCBiaXRzIDEgYW5kIDIgc2lnbmFsaW5nIHN1cHBvcnQgZm9yIEFHQVcgMSBhbmQN
Cj4gQUdBVyAyIHJlc3BlY3RpdmVseS4gIEFjY29yZGluZyB0byB0aGUgSW50ZWwgVlQtZCBzcGVj
aWZpY2F0aW9uLCBhbiBJT01NVSBtaWdodA0KPiBzdXBwb3J0IG11bHRpcGxlIEFHQVcgdmFsdWVz
Lg0KPiANCj4gVGhlIEFHQVcgdmFsdWUgZm9yIGVhY2ggZGV2aWNlIGlzIHNldCBpbiB0aGUgZGV2
aWNlIGNvbnRleHQgZW50cnksIGhvd2V2ZXINCj4gdGhlcmUncyBhIGNhdmVhdCByZWxhdGVkIHRv
IHRoZSB2YWx1ZSB0aGUgZmllbGQgc3VwcG9ydHMgZGVwZW5kaW5nIG9uIHRoZQ0KPiB0cmFuc2xh
dGlvbiB0eXBlOg0KPiANCj4gIldoZW4gdGhlIFRyYW5zbGF0aW9uLXR5cGUgKFQpIGZpZWxkIGlu
ZGljYXRlcyBwYXNzLXRocm91Z2ggKDAxMGIpIG9yDQo+IGd1ZXN0LW1vZGUgKDEwMGIgb3IgMTAx
YiksIHRoaXMgZmllbGQgbXVzdCBiZSBwcm9ncmFtbWVkIHRvIGluZGljYXRlIHRoZQ0KPiBsYXJn
ZXN0IEFHQVcgdmFsdWUgc3VwcG9ydGVkIGJ5IGhhcmR3YXJlLiINCj4gDQo+IE9mIHRoZSB0cmFu
c2xhdGlvbiB0eXBlcyBsaXN0ZWQgYWJvdmUgWGVuIG9ubHkgdXNlcyBwYXNzLXRocm91Z2ggKDAx
MGIpLCBhbmQNCj4gaGVuY2Ugd2UgbmVlZCB0byBtYWtlIHN1cmUgdGhlIGNvbnRleHQgZW50cnkg
QUdBVyBmaWVsZCBpcyBzZXQgYXBwcm9wcmlhdGVseSwNCj4gb3IgZWxzZSB0aGUgSU9NTVUgd2ls
bCByZXBvcnQgaW52YWxpZCBjb250ZXh0IGVudHJ5IGVycm9ycy4NCj4gDQo+IFRvIGRvIHNvIGNh
bGN1bGF0ZSB0aGUgSU9NTVUgc3VwcG9ydGVkIHBhZ2UgdGFibGUgbGV2ZWxzIGJhc2VkIG9uIHRo
ZSBsYXN0IGJpdA0KPiBzZXQgaW4gdGhlIFNBR0FXIGZpZWxkLCBpbnN0ZWFkIG9mIHRoZSBmaXJz
dCBvbmUuICBUaGlzIGFsc28gYWxsb3dzIG1ha2luZyB1c2UNCj4gb2YgdGhlIHdpZGVzdCBhZGRy
ZXNzIHdpZHRoIHN1cHBvcnRlZCBieSB0aGUgSU9NTVUsIGluIGNhc2UgbXVsdGlwbGUgQUdBV3Mg
YXJlDQo+IHN1cHBvcnRlZC4NCj4gDQo+IE5vdGUgdGhhdCA4NTlkMTFiMjc5MTIgY2xhaW1zIHRv
IHJlcGxhY2UgdGhlIG9wZW4tY29kZWQgZmluZF9maXJzdF9zZXRfYml0KCksDQo+IGJ1dCBpdCdz
IGFjdHVhbGx5IHJlcGxhY2luZyBhbiBvcGVuIGNvZGVkIGltcGxlbWVudGF0aW9uIHRvIGZpbmQg
dGhlIGxhc3Qgc2V0DQo+IGJpdC4NCj4gDQo+IEZpeGVzOiA4NTlkMTFiMjc5MTIgKCdWVC1kOiBw
cnVuZSBTQUdBVyByZWNvZ25pdGlvbicpDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5n
IDxIZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg==

