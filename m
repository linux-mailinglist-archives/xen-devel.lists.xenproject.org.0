Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9464444C7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:42:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221024.382524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIOH-0001FF-FA; Wed, 03 Nov 2021 15:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221024.382524; Wed, 03 Nov 2021 15:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miIOH-0001D3-BI; Wed, 03 Nov 2021 15:41:29 +0000
Received: by outflank-mailman (input) for mailman id 221024;
 Wed, 03 Nov 2021 15:41:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jBOo=PW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1miIOF-0001Cx-Tr
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:41:28 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 811790dc-3cbc-11ec-9787-a32c541c8605;
 Wed, 03 Nov 2021 16:41:26 +0100 (CET)
Received: from AS9PR06CA0342.eurprd06.prod.outlook.com (2603:10a6:20b:466::18)
 by VI1PR0802MB2351.eurprd08.prod.outlook.com (2603:10a6:800:a0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 15:41:24 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::33) by AS9PR06CA0342.outlook.office365.com
 (2603:10a6:20b:466::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Wed, 3 Nov 2021 15:41:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 3 Nov 2021 15:41:23 +0000
Received: ("Tessian outbound 4ce13939bd4a:v108");
 Wed, 03 Nov 2021 15:41:23 +0000
Received: from 7b7bee3f32e9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F81AC371-F36B-4B4D-BC12-C4CD8B29B74B.1; 
 Wed, 03 Nov 2021 15:41:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b7bee3f32e9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Nov 2021 15:41:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3272.eurprd08.prod.outlook.com (2603:10a6:209:4d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 3 Nov
 2021 15:41:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 15:41:14 +0000
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
X-Inumbo-ID: 811790dc-3cbc-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NhXzTXQIkd8ALmhQUukWAfxre7vJ6gUJxyOU463NjY=;
 b=1wauSuy8ahjoPOdluBoNhVCOeqobve1Buj31X939apcA9BHrK6v4svub+eLv4AZeaU3KZnhNF33SZl57Ja8nONNSY+3mU2WRQenrrgF1OmmS8zovWdkAtl90RTd+bDIZQzDXI6bXq/g7QbSMHja1zGSIu1Y3QMgfJ2bUhPxdBMk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81dc9d25e41df034
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8lhQJSkOi0ni5z9COlsHsiStD6XTEkUGNwc6fQR+hOtdnhyUMJooQYAQH7mdWxheIcIfWmysGUFaliZroDsSiqnhCA4GoRsTI39sR11awORzT8JGPbLRrlGkdNxjKwUN4ja9sIxU0EqE8F1EyWs8DHWVjA2qOyJ6R7/GzFAeUEAAgGr2OtgPcG4XR84CEg25zB2y2Zh7seOuWk5TF4GV5h07o9fnBSPsZKBoMCNBNvQUzYsI79IAv6y1fCG+LrkL/XXlRjDth2fheJh2kNsJ52MDBBEvgUmBCSrvyuKRIUO/nP8s/vOhqPfzviEskDMY/f8kzbWGxE5rW3PuKmiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0NhXzTXQIkd8ALmhQUukWAfxre7vJ6gUJxyOU463NjY=;
 b=ZXzfLDdXz2ZRCdyiMMW2oLqGmbWvPSufc7vmL3wBB8ntG/GKmK3iVONKDceOUC5Wdm0M0Kk9VXpfOJMF9IcOl3CqMS+jstbeXmsZl7TWieK8WoXqYlTIw2Epi3L8cwvOnbjArYsuHOhgip/SoS2gGIzVFHBwfLmHOIHKW8dOdyW2xUIe3ZX5twnov3TfSvENUF33aLyvDufGvNHIivICAx7yCJWfsYd1/+SqD2odeXxenqIbCXH3nTpuXgLBNx66HaclmyDxNYwuJNMXS25+eXHY3k6n6Yo4QNmmw0lNWNJh/NoWiOElMnFewkPYW9DG93mj8NxB8G+IFVjgdSY1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NhXzTXQIkd8ALmhQUukWAfxre7vJ6gUJxyOU463NjY=;
 b=1wauSuy8ahjoPOdluBoNhVCOeqobve1Buj31X939apcA9BHrK6v4svub+eLv4AZeaU3KZnhNF33SZl57Ja8nONNSY+3mU2WRQenrrgF1OmmS8zovWdkAtl90RTd+bDIZQzDXI6bXq/g7QbSMHja1zGSIu1Y3QMgfJ2bUhPxdBMk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
Thread-Topic: [PATCH] xen/efi: Fix Grub2 boot on arm64
Thread-Index:
 AQHXz/K6mNGHgi2TXkyW35dcCbo6tKvwULEAgAApEoCAAP3KAIAAIV4AgAAS9ACAAC0JgIAABgMAgAAMuICAAAPMgIAAAyMA
Date: Wed, 3 Nov 2021 15:41:14 +0000
Message-ID: <AB3CD75D-3E18-4802-91E5-7FBBA0734170@arm.com>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
 <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
 <6a8ecb5b-7ea4-7dd8-4acf-587b51862aed@suse.com>
 <845D8368-B9DA-4A5C-8F8D-6AAE55E326A0@arm.com>
 <16c6757d-1bb3-361f-a41f-26b9bc89a2b4@suse.com>
 <83E4F969-892C-4AA2-829D-67C02B4B5885@arm.com>
 <ad621757-afac-f36f-0b3c-7fe1ddb83a66@suse.com>
 <AB5E1F4C-36BC-413B-88DA-487BA573BFCC@arm.com>
 <b3d140fa-019e-a469-be16-47b6e42e124d@suse.com>
In-Reply-To: <b3d140fa-019e-a469-be16-47b6e42e124d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 11ba81b9-24fa-43ba-88cf-08d99ee063f7
x-ms-traffictypediagnostic: AM6PR08MB3272:|VI1PR0802MB2351:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB235194A072DE3A116E7BD7F99D8C9@VI1PR0802MB2351.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6FTjJhnsl13kMsOKlVHVv15DoVqANxDlv2v2L0S/Smg/xKK3u3yf4YvtnvQ1errVS5z5LnyXoC7dDuRakop94G8BhLMWKOiD5TSzOLp8YkIRytAQx/Zwx3jnNTFoUCH5HbYE2rfzaTk0Dfen3b9rqFNqLhBkPDjciPgYl/ny54qrm+ua0W1tjqkVhIopB7R4DvoKz5oQ8pIAhXZkl4I6FKO9dhmpZsMybAbnX9QAL9ln2GXbWazii08pZOzk+KKP2Y9NAWGbCc5gjLHoCPgvFvfIkWyXN7CI1iYXnjMdtu025e5OkAi9bafzINp/IxlSz1XIUSb2jvUmVnXXfK7A+CnlHEBlVOuiSBphljkS4jAQ93o3wnI5fvVfJPXg9qYkg+ky7OHeCgKdc6pa+IgY+P61PlW+ayUGmmTB6y4fnvgb+uIvf8fWIfRMuXnDpQo5DcRQG3wwbXqQJrnY/uRUKmKjMUzqz9BaO73UcIA5mj0ioKvR7Sh/YBygAuJ+WqBtJ83bzKQLfX2IrbmUOyg95AHvFlKmipItadgQ3/pBEGagTLMezfYr1Aj79yXpmS/zKGGbEKi2dvH9ewBU30zPjXnmKL/EijkTA16QVNtCbgnfOYjsRR+3ZGe5HSrhGIna6X1y2a9XIwHiecK3Ir7GQfacUx55zwAZP5DgWaZMiLCOR87ibku+bCBUF5HHDJ/0tQxrVsQeOTvm/28J1UVwVqVxgwe4qsft2KKBOKVfTOpKPmg7p1xZQkAh8mgZ+v45
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(66476007)(66556008)(5660300002)(64756008)(66446008)(508600001)(76116006)(316002)(54906003)(6486002)(91956017)(6512007)(66946007)(2906002)(2616005)(33656002)(186003)(8936002)(122000001)(6506007)(8676002)(71200400001)(53546011)(26005)(83380400001)(38100700002)(36756003)(6916009)(38070700005)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DECDEE09C46EC44B29F2C04E8FDEC46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3272
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51258b0a-3780-4b71-5e18-08d99ee05ea0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qn8E+87jILQJ7MwOBNk9vYG0wKOkhJRd1qY4eBCOBbZ3ZGuuP3BUtZySHXUd9bdRdoWlyXyaydXJziuFWb0OKz5RD8BFn+r3wco1ltCkXUz1m1nZo/V1ER0kj3PZOclFbQFvM58g3aq+3rsQkyb7Kt/VGGBuA/G5dbCF59CH/c2n/StgHSsGMsfYjtwMfefvgHDasnb8VXcdDJ7t4DCIx4pjvYOLDj6akWUr51Kv4oGu8bF2u+uGoR230GWWmnRq5CHCQJ5B0Nmw/vY4H4lsoIlRPZiaRQ7nmCXQ00CHkWM5BUdWywXAkjccEPUkqh459i4BM42DwSW8gDdjIVKvjOzMM0l8dmp+qg9doQIOGwCvSt/AyNmB9oFiK5CDPQqRntTPncSIOQnvfI0GglcEY4R3vBmPx9OzV0ASY93fRKLEsVhyx1V8KN8DJsYVSOzz0AtTkVa3XR1wG7xbTK37lYypf9QgqHtEXphvPnVXVWxrOuLAvqS4eTcq3YDdjE7CANPspi5Xtx58XIgjjVpqzXWzcfsgiKBcKyWbjkodAZ9IBvXEv+rhUHO18z95zpVbUfRIhN0PBvMwY42T/V5NLsjZ/BZNKH+o4LlDNkPMExgrDlD0C27+Fess3YAj0OMLG60MCCgXU+NKc/32wIeIO0W1T3tdWUoUIX0MHc2q+gxHG2/7yZ1FhWOHBCUu6JMOASEkNdhK3mO8wikv+nDALg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70586007)(6862004)(336012)(70206006)(2616005)(4326008)(53546011)(356005)(6506007)(33656002)(81166007)(8676002)(47076005)(54906003)(316002)(82310400003)(8936002)(36756003)(2906002)(6486002)(508600001)(36860700001)(5660300002)(26005)(86362001)(6512007)(83380400001)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:41:23.5253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ba81b9-24fa-43ba-88cf-08d99ee063f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2351

SGkgSmFuLA0KDQo+IE9uIDMgTm92IDIwMjEsIGF0IDE1OjMwLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDMuMTEuMjAyMSAxNjoxNiwgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gMyBOb3YgMjAyMSwgYXQgMTQ6MzAsIEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMDMuMTEuMjAy
MSAxNTowOSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+IE9uIDMgTm92IDIwMjEsIGF0IDEx
OjI4LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4gT24gMDMu
MTEuMjAyMSAxMToyMCwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+Pj4gT24gMyBOb3YgMjAy
MSwgYXQgMDg6MjAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+
Pj4+IE9uIDAyLjExLjIwMjEgMTg6MTIsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4+Pj4g
T24gMiBOb3YgMjAyMSwgYXQgMTQ6NDUsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4g
d3JvdGU6DQo+Pj4+Pj4+Pj4gT24gMDIuMTEuMjAyMSAxNTowNSwgTHVjYSBGYW5jZWxsdSB3cm90
ZToNCj4+Pj4+Pj4+Pj4gVGhlIGNvZGUgaW50cm9kdWNlZCBieSBjb21taXQgYTE3NDNmYzNhOWZl
OWI2OGMyNjVjNDUyNjRkZGRmMjE0ZmQ5Yjg4Mg0KPj4+Pj4+Pj4+PiAoImFybS9lZmk6IFVzZSBk
b20wbGVzcyBjb25maWd1cmF0aW9uIHdoZW4gdXNpbmcgRUZJIGJvb3QiKSBpcw0KPj4+Pj4+Pj4+
PiBpbnRyb2R1Y2luZyBhIHByb2JsZW0gdG8gYm9vdCBYZW4gdXNpbmcgR3J1YjIgb24gQVJNIG1h
Y2hpbmUgdXNpbmcgRURLMi4NCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IFRoZSBwcm9ibGVtIGNv
bWVzIGZyb20gdGhlIGZ1bmN0aW9uIGdldF9wYXJlbnRfaGFuZGxlKC4uLikgdGhhdCBpbnNpZGUN
Cj4+Pj4+Pj4+Pj4gdXNlcyB0aGUgSGFuZGxlUHJvdG9jb2wgb24gbG9hZGVkX2ltYWdlLT5EZXZp
Y2VIYW5kbGUsIGJ1dCB0aGUgbGFzdA0KPj4+Pj4+Pj4+PiBpcyBOVUxMLCBtYWtpbmcgWGVuIHN0
b3AgdGhlIFVFRkkgYm9vdC4NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBBY2NvcmRpbmcgdG8gbXkg
cmVhZGluZyB0aGUgVUVGSSBzcGVjIGRvZXNuJ3QgKGV4cGxpY2l0bHkpIGFsbG93IGZvcg0KPj4+
Pj4+Pj4+IHRoaXMgdG8gYmUgTlVMTC4gQ291bGQgeW91IGNsYXJpZnkgd2h5IHRoaXMgaXMgdGhl
IGNhc2U/IFdoYXQgb3RoZXINCj4+Pj4+Pj4+PiBpbmZvcm1hdGlvbiBtYXkgZW5kIHVwIGJlaW5n
IGludmFsaWQgLyBhYnNlbnQ/IElzIGUuZy4gcmVhZF9zZWN0aW9uKCkNCj4+Pj4+Pj4+PiBzYWZl
IHRvIHVzZT8NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gTXkgdGVzdCBvbiBhbiBhcm0gbWFjaGluZSBy
dW5uaW5nIEdydWIyIG9uIHRvcCBvZiBFREsyIHNob3dlZCB0aGF0DQo+Pj4+Pj4+PiB3aGVuIFhl
biBpcyBzdGFydGVkLCB0aGUgZ2V0X3BhcmVudF9oYW5kbGUo4oCmKSBjYWxsIHdhcyBmYWlsaW5n
IGFuZCBzdG9wcGluZw0KPj4+Pj4+Pj4gdGhlIGJvb3QgYmVjYXVzZSB0aGUgZWZpX2JzLT5IYW5k
bGVQcm90b2NvbCjigKYpIHdhcyBjYWxsZWQgd2l0aCB0aGUNCj4+Pj4+Pj4+IGxvYWRlZF9pbWFn
ZS0+RGV2aWNlSGFuZGxlIGFyZ3VtZW50IE5VTEwgYW5kIHRoZSBjYWxsIHdhcyByZXR1cm5pbmcN
Cj4+Pj4+Pj4+IGEgRUZJX0lOVkFMSURfUEFSQU1FVEVSLg0KPj4+Pj4+Pj4gU28gdGhlIHBhcmVu
dCBoYW5kbGUgY2Fu4oCZdCBiZSByZXF1ZXN0ZWQgYW5kIHRoZSBmaWxlc3lzdGVtIGNhbuKAmXQg
YmUgdXNlZCwNCj4+Pj4+Pj4+IGJ1dCBhbnkgb3RoZXIgY29kZSB0aGF0IGRvZXNu4oCZdCB1c2Ug
dGhlIGhhbmRsZSBwcm92aWRlZCBieSBnZXRfcGFyZW50X2hhbmRsZSjigKYpDQo+Pj4+Pj4+PiBj
YW4gYmUgdXNlZCB3aXRob3V0IHByb2JsZW0gbGlrZSByZWFkX3NlY3Rpb24oLi4uKS4NCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IEkgdW5kZXJzdGFuZCB0aGlzLiBNeSBxdWVzdGlvbiB3YXMgZm9yIHRoZSBy
ZWFzb24gb2YgLT5EZXZpY2VIYW5kbGUNCj4+Pj4+Pj4gYmVpbmcgTlVMTC4gSU9XIEknbSB3b25k
ZXJpbmcgd2hldGhlciB3ZSdyZSBhY3R1YWxseSB0YWxraW5nIGFib3V0IGENCj4+Pj4+Pj4gZmly
bXdhcmUgb3IgR3JVQiBidWcsIGluIHdoaWNoIGNhc2UgeW91ciBjaGFuZ2UgaXMgYSB3b3JrYXJv
dW5kIGZvcg0KPj4+Pj4+PiB0aGF0IHJhdGhlciB0aGFuIChwcmltYXJpbHkpIGEgZml4IGZvciB0
aGUgZWFybGllciBYZW4gY2hhbmdlLg0KPj4+Pj4+IA0KPj4+Pj4+IFRoZSBpc3N1ZSB3YXMgZm91
bmQgb25seSB3aGVuIHVzaW5nIEVESzIrR3J1YjIsIG5vIGlzc3VlIHdoZW4gYm9vdGluZw0KPj4+
Pj4+IGRpcmVjdGx5IGZyb20gRURLMi4NCj4+Pj4+PiBUaGlzIGlzIGEgZml4IGZvciB0aGUgcmVn
cmVzc2lvbiwgYmVjYXVzZSB3aXRob3V0IHRoZSBFRkkgY2hhbmdlcywgR3J1YjIgd2FzDQo+Pj4+
Pj4gYm9vdGluZyBzdWNjZXNzZnVsbHkgWGVuLiBVc2luZyBncnViMiB0byBib290IFhlbiBvbiBh
cm0gaXMgYSB2ZXJ5IGNvbW1vbg0KPj4+Pj4+IHNvbHV0aW9uIHNvIG5vdCBzdXBwb3J0aW5nIHRo
aXMgYW55bW9yZSBjb3VsZCBsZWFkIHRvIGxvdHMgb2YgcGVvcGxlIGhhdmluZw0KPj4+Pj4+IGlz
c3VlcyBpZiB0aGV5IHVwZGF0ZSB0byBYZW4gNC4xNi4NCj4+Pj4+IA0KPj4+Pj4gSSdtIG5vdCBv
YmplY3RpbmcgdG8gYWRkcmVzc2luZyB0aGUgaXNzdWUuIEJ1dCB0aGUgZGVzY3JpcHRpb24gbmVl
ZHMNCj4+Pj4+IHRvIG1ha2UgY2xlYXIgd2hlcmUgdGhlIG9yaWdpbiBvZiB0aGUgcHJvYmxlbSBs
aWVzLCBhbmQgYWZhaWN0IHRoYXQncw0KPj4+Pj4gbm90IHRoZSBlYXJsaWVyIFhlbiBjaGFuZ2Uu
IFRoYXQgb25lIG1lcmVseSB1bmNvdmVyZWQgd2hhdCwgYWNjb3JkaW5nDQo+Pj4+PiB0byB5b3Vy
IHJlcGx5LCBtaWdodCB0aGVuIGJlIGEgR3JVQiBidWcuIFVubGVzcywgYXMgc2FpZCBlYXJsaWVy
LCBJDQo+Pj4+PiBtZXJlbHkgaGF2ZW4ndCBiZWVuIGFibGUgdG8gc3BvdCBwcm92aXNpb25zIGlu
IHRoZSBzcGVjIGZvciB0aGUgZmllbGQNCj4+Pj4+IGluIHF1ZXN0aW9uIHRvIGJlIE5VTEwuDQo+
Pj4+IA0KPj4+PiBNYXliZSBJIGNhbiByZXBocmFzZSB0byBiZSBtb3JlIHNwZWNpZmljIGZyb206
DQo+Pj4+IA0KPj4+PiBUaGUgcHJvYmxlbSBjb21lcyBmcm9tIHRoZSBmdW5jdGlvbiBnZXRfcGFy
ZW50X2hhbmRsZSguLi4pIHRoYXQgaW5zaWRlDQo+Pj4+IHVzZXMgdGhlIEhhbmRsZVByb3RvY29s
IG9uIGxvYWRlZF9pbWFnZS0+RGV2aWNlSGFuZGxlLCBidXQgdGhlIGxhc3QNCj4+Pj4gaXMgTlVM
TCwgbWFraW5nIFhlbiBzdG9wIHRoZSBVRUZJIGJvb3QuDQo+Pj4+IA0KPj4+PiBUbzoNCj4+Pj4g
DQo+Pj4+IERlc3BpdGUgVUVGSSBzcGVjaWZpY2F0aW9uLCBFREsyK0dydWIyIGlzIHJldHVybmlu
ZyBhIE5VTEwgRGV2aWNlSGFuZGxlLA0KPj4+PiB0aGF0IGlzIHVzZWQgYnkgZWZpX2JzLT5IYW5k
bGVQcm90b2NvbCjigKYpIGluc2lkZSBnZXRfcGFyZW50X2hhbmRsZSjigKYpLA0KPj4+PiBjYXVz
aW5nIFhlbiB0byBzdG9wIHRoZSBib290IGdldHRpbmcgYW4gRUZJX0lOVkFMSURfUEFSQU1FVEVS
IGVycm9yLg0KPj4+PiANCj4+Pj4gRG8geW91IHRoaW5rIGl0IGNhbiBiZSBvayBsaWtlIHRoaXM/
DQo+Pj4gDQo+Pj4gTXVjaCBiZXR0ZXIsIHllcywgYnV0IEkgd29uZGVyIHdoYXQgInJldHVybmlu
ZyIgcmVmZXJzIHRvLiBZb3Ugd2FudCB0bw0KPj4+IGRlc2NyaWJlIHRoZSBvcmlnaW4gb2YgdGhl
IE5VTEwgaGFuZGxlIGFzIHByZWNpc2VseSBhcyBwb3NzaWJsZS4gQW5kDQo+Pj4gY29uc2lkZXJp
bmcgdGhpcyB0dXJucyBvdXQgYXMgYSB3b3JrYXJvdW5kLCBpbiBhIHN1aXRhYmxlIHBsYWNlIHlv
dQ0KPj4+IHdpbGwgYWxzbyB3YW50IHRvIGFkZCBhIGNvZGUgY29tbWVudCwgc3VjaCB0aGF0IGEg
bGF0ZXIgcmVhZGVyIHdvbid0DQo+Pj4gZGVjaWRlIHRoaXMgaXMgYWxsIGRlYWQgY29kZSBhbmQg
Y2FuIGJlIGRvbmUgaW4gYSBzaW1wbGVyIHdheS4NCj4+IA0KPj4gT2sgSSBjYW4gd3JpdGUgdGhl
IGlzc3VlIGZyb20gdGhlIGJlZ2lubmluZyB0byBiZSBzdXJlOg0KPj4gDQo+PiBEZXNwaXRlIFVF
Rkkgc3BlY2lmaWNhdGlvbiwgRURLMitHcnViMiBpcyByZXR1cm5pbmcgYSBOVUxMIERldmljZUhh
bmRsZQ0KPj4gaW5zaWRlIHRoZSBpbnRlcmZhY2UgZ2l2ZW4gYnkgdGhlIExPQURFRF9JTUFHRV9Q
Uk9UT0NPTCBzZXJ2aWNlLCB0aGlzDQo+PiBoYW5kbGUgaXMgdXNlZCBsYXRlciBieSBlZmlfYnMt
PkhhbmRsZVByb3RvY29sKOKApikgaW5zaWRlIGdldF9wYXJlbnRfaGFuZGxlKOKApikNCj4+IHdo
ZW4gcmVxdWVzdGluZyB0aGUgU0lNUExFX0ZJTEVfU1lTVEVNX1BST1RPQ09MIGludGVyZmFjZSwN
Cj4+IGNhdXNpbmcgWGVuIHRvIHN0b3AgdGhlIGJvb3QgYmVjYXVzZSBvZiBhbiBFRklfSU5WQUxJ
RF9QQVJBTUVURVIgZXJyb3IuDQo+PiANCj4+IFJlZ2FyZGluZyB0aGUgY29tbWVudCwgSSBjYW4g
cmVwaHJhc2UgdGhpcyBjb21tZW50Og0KPj4gLyoNCj4+ICogSWYgRGV2aWNlSGFuZGxlIGlzIE5V
TEwsIHdlIGNhbid0IHVzZSB0aGUgU0lNUExFX0ZJTEVfU1lTVEVNX1BST1RPQ09MDQo+PiAqIHRv
IGhhdmUgYWNjZXNzIHRvIHRoZSBmaWxlc3lzdGVtLg0KPj4gKi8NCj4+IA0KPj4gVG8gYmU6DQo+
PiANCj4+IC8qDQo+PiAqIElmIERldmljZUhhbmRsZSBpcyBOVUxMLCB0aGUgZmlybXdhcmUgb2Zm
ZXJpbmcgdGhlIFVFRkkgc2VydmljZXMgbWlnaHQgbm90IGJlDQo+PiAqIGNvbXBsaWFudCB0byB0
aGUgc3RhbmRhcmQgYW5kIHdlIGNhbid0IHVzZSB0aGUgU0lNUExFX0ZJTEVfU1lTVEVNX1BST1RP
Q09MDQo+PiAqIHRvIGhhdmUgYWNjZXNzIHRvIHRoZSBmaWxlc3lzdGVtLiBIb3dldmVyIHRoZSBz
eXN0ZW0gY2FuIGJvb3QgaWYgYW5kIG9ubHkgaWYgaXQgZG9lc27igJl0DQo+PiAqIHJlcXVpcmUg
YWNjZXNzIHRvIHRoZSBmaWxlc3lzdGVtLiAoZS5nLiBYZW4gaW1hZ2UgaGFzIGV2ZXJ5dGhpbmcg
YnVpbHQgaW4gb3IgdGhlDQo+PiAqIGJvb3Rsb2FkZXIgZGlkIHByZXZpb3VzbHkgbG9hZCBldmVy
eSBuZWVkZWQgYmluYXJ5IGluIG1lbW9yeSkNCj4+ICovDQo+PiANCj4+IFdoYXQgZG8geW91IHRo
aW5rPw0KPiANCj4gTGFyZ2VseSBva2F5LCBhbGJlaXQgeW91IGRvbid0IG1lbnRpb24gR3JVQiBh
dCBhbGwgKHdoaWNoIGlzbid0IHJlYWxseSBwYXJ0DQo+IG9mIHRoZSBmaXJtd2FyZSwgYnV0IHdo
aWNoIGxvb2tzIHRvIGJlIHRoZSBjdWxwcml0KSBhbmQgaXQgZ2V0cyBhIGxpdHRsZQ0KPiB0b28g
dmVyYm9zZS4gUHJvdmlkZWQgdGhlIGZhY3RzIGhhdmUgYmVlbiB2ZXJpZmllZCwgaG93IGFib3V0
DQo+IA0KPiAgICAvKg0KPiAgICAgKiBHclVCIGhhcyBiZWVuIG9ic2VydmVkIHRvIHN1cHBseSBh
IE5VTEwgRGV2aWNlSGFuZGxlLiBXZSBjYW4ndCB1c2UNCj4gICAgICogdGhhdCB0byBnYWluIGFj
Y2VzcyB0byB0aGUgZmlsZXN5c3RlbS4gSG93ZXZlciB0aGUgc3lzdGVtIGNhbiBzdGlsbA0KPiAg
ICAgKiBib290IGlmIGl0IGRvZXNu4oCZdCByZXF1aXJlIGFjY2VzcyB0byB0aGUgZmlsZXN5c3Rl
bS4NCj4gICAgICovDQo+IA0KPiAoYW5kIGl0J3MgdXAgdG8geW91IHdoZXRoZXIgeW91IGluY2x1
ZGUgeW91ciBmdXJ0aGVyICJlLmcuIC4uLiIgdGhlbiwgYnV0DQo+IGlmIHlvdSBkbyBJIHRoaW5r
IHRoZSBwYXJlbnRoZXNpemVkIHBhcnQgYmVsb25nIGJlZm9yZSB0aGUgZmluYWwgZnVsbA0KPiBz
dG9wLCBhbmQgdGhlIGxhc3QgImluIiB3b3VsZCB3YW50IHRvIGJlICJpbnRvIik/IEl0J3Mgc3Rp
bGwgZHViaW91cyB0byBtZQ0KPiBob3cgdGhleSBjYW4gZ2V0IGF3YXkgd2l0aCBzdWNoIGEgTlVM
TCBoYW5kbGUgKGFuZCB3aHkgdGhhdCBoYXBwZW5zIG9ubHkNCj4gb24gQXJtKSwgYnV0IEkgZ3Vl
c3MgaXQgd291bGQgZ28gdG9vIGZhciB0byB0cnkgdG8gdW5kZXJzdGFuZCB0aGUNCj4gYmFja2dy
b3VuZC4NCg0KVGhpcyBtaWdodCBub3QgYmUgYSBwcm9ibGVtIGluIEdydWIgYnV0IGFjdHVhbGx5
IGluIEVESzIgb3IgZHVlIHRvIHRoZSBmYWN0IHRoYXQNCkVESzIgaXMgc3RhcnRpbmcgR3J1YiB3
aGljaCBpcyBzdGFydGluZyBYZW4uIEdydWIgaXMgbm90IG1vZGlmeWluZyB0aGlzIGV4cGxpY2l0
bHkNCmZyb20gd2hhdCB3ZSBmb3VuZCBkdXJpbmcgb3VyIGludmVzdGlnYXRpb25zLg0KDQpDaGVl
cnMNCkJlcnRyYW5kDQoNCj4gDQo+IEphbg0KDQo=

