Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55181401991
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 12:15:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179580.325915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNBeU-0006y7-5v; Mon, 06 Sep 2021 10:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179580.325915; Mon, 06 Sep 2021 10:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNBeU-0006wJ-2B; Mon, 06 Sep 2021 10:14:58 +0000
Received: by outflank-mailman (input) for mailman id 179580;
 Mon, 06 Sep 2021 10:14:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kxtw=N4=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mNBeS-0006wC-0Z
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 10:14:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dd26814-38ef-4cfa-a295-bb1acdd50157;
 Mon, 06 Sep 2021 10:14:54 +0000 (UTC)
Received: from AM5PR0601CA0033.eurprd06.prod.outlook.com
 (2603:10a6:203:68::19) by DBBPR08MB5899.eurprd08.prod.outlook.com
 (2603:10a6:10:208::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 10:14:51 +0000
Received: from VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::e8) by AM5PR0601CA0033.outlook.office365.com
 (2603:10a6:203:68::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Mon, 6 Sep 2021 10:14:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT051.mail.protection.outlook.com (10.152.19.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 10:14:51 +0000
Received: ("Tessian outbound 620209b93b95:v105");
 Mon, 06 Sep 2021 10:14:51 +0000
Received: from f3725336c883.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8922800A-C75C-4DE7-B23E-14EE9528B054.1; 
 Mon, 06 Sep 2021 10:14:42 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f3725336c883.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 06 Sep 2021 10:14:42 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR2PR08MB4665.eurprd08.prod.outlook.com (2603:10a6:101:25::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Mon, 6 Sep
 2021 10:14:40 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 10:14:39 +0000
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
X-Inumbo-ID: 3dd26814-38ef-4cfa-a295-bb1acdd50157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzHDmyjnh5LGIpbyruutxpYRl2HOE5gt7OKhwpi2jLE=;
 b=7wzyXKu9xb8dGzDWGVozFOJf5zwm5PpWjQ9IkZ4kBP/IWYs2WMMLZcxxjzcwVEJ1K7/Iyf5+wua2fj9RAE/lI9pM590LHJNoOxd3mgDic/pR8JZOLMHBwVgz4M+Z8uvoPoYtt234SYyLS62Sr0HFRslIsAJcLwkqREr5CS8lrd4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c83646bd47ee1174
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxYMsosEaTZ9CSJ4MU1ItPJz+pLEzyMfBWLzOAtzt27pYkb5Bk5t2inN4O/H59Ah8VnxhXkZAflD63xx0z30rPyXZo4vqxHuS0nYmEKGNu1whZPc6u+e/Ut4sec/UQ+DUhKr6ADWySQFCVM0YbpvdL7BkBj3/lzG7arjDYRnxT5gB2Cn57s6zwCZbBWjjIBq8ynl2gzovo6fVuJhbWH3+b8q91/nFciDFOsGc28wQbgkY7GqKUjWUV27BCe5sIB7DsRW/G2xhieorFX0f6DFowUTIFjMRk8MbGotCM6kFIW581S1yHYsMJztU3DwRMQo5fNsIvN+ngIyDCMG1d1Ptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uzHDmyjnh5LGIpbyruutxpYRl2HOE5gt7OKhwpi2jLE=;
 b=nynDTTETRYYsOgNWHfleHhkmJT7MEihvuZYAPN/8nklf+zEftzYjhsjyJhAyBpIVOlTXkLRUEWQvmWVnv8tRDUbRf5GElm0hikf72zA6CZ6uTZkWDVKPeewuTRxRcsnYvftlBPc7mfqQyhOeMryhEzyb9JqWb6LYS+VaRAX1LUHnFPQWza/stnQ5zT1RjJ9ty3JpcmvJacsxtlmOk9EbTGwwc8lZBNSKw8n2KAZmK1a7TRDa03E+KTTODZ0dxcKTNdkbZ5C+hM2eKbPFxMQqX/ZgQ2r8kFvC1jg9LQ694fhMe+SiVlqPalX5Rl+2kvd/dx86kxP/zgzIHL0Co9hS6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzHDmyjnh5LGIpbyruutxpYRl2HOE5gt7OKhwpi2jLE=;
 b=7wzyXKu9xb8dGzDWGVozFOJf5zwm5PpWjQ9IkZ4kBP/IWYs2WMMLZcxxjzcwVEJ1K7/Iyf5+wua2fj9RAE/lI9pM590LHJNoOxd3mgDic/pR8JZOLMHBwVgz4M+Z8uvoPoYtt234SYyLS62Sr0HFRslIsAJcLwkqREr5CS8lrd4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: Crash when using cpupools
Thread-Topic: Crash when using cpupools
Thread-Index: AQHXoNo0twqKn1RLAkCotEsfXja8k6uWr0+AgAAGR4CAAAvYAIAADN6A
Date: Mon, 6 Sep 2021 10:14:39 +0000
Message-ID: <FC6628F1-46A0-4992-A510-7AFD47149C79@arm.com>
References: <FBF65354-8C41-41B4-8A24-BA1485CAE073@arm.com>
 <5b0a4530-72df-a186-9bd5-50759b3dd151@suse.com>
 <c1554429-07d7-1f9f-ef0e-1931675f01e8@citrix.com>
 <41b5e46e-daad-82f0-63f0-1efe431ca695@suse.com>
In-Reply-To: <41b5e46e-daad-82f0-63f0-1efe431ca695@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 79cc6872-6e4f-4a59-c34f-08d9711f2a2b
x-ms-traffictypediagnostic: PR2PR08MB4665:|DBBPR08MB5899:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB58996F178E9604226208F1839DD29@DBBPR08MB5899.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HiGygZbc+05kS2syjfEmYL3TKeGDyJwrUphxidA9Mc5EHCleZOlZOdbEx8heb2Bu5uPhsQDdl47ky23KDLqov8b8p0JDpUllGgvr8mkRHgH+747C3nc6GdO0yUYzEK7YeOs8VNa3l3GoEubxt6JIl44soyTDki3maMNAbbIBxqT8O+HoruRy8RfHi6Zq1frUzqtG2a+qBrTHn0D+GA7KJVp3MVsz+r4WRzdJzBkJY58M5fdzrU4PRxepc41xae25kislEnqG6Fo+0G0ifLfkdqgKkKma9ap8Jj8Cu1DEBV8gOsEY5jFN4XIcswYoJdUjUhvnTPp2iHzceHxATRxUpe4xLTZ24wU7vxCpyjhE3YBRxPa8Ago094+FCRNEp9+KFBzxMzvGTrPiotNtEduI/1+MhhP6HzUq9irebL3Fithz4L6RUsejkIpSHqUsYuer0xo1GqVB71YkLETU+GR1+c9SWSU3tubYZEONtSONvRZXzmFoUGAVdxeK8/UxvN0jONNnpSnQ2sHNUQ47hrmLS9v669B/z+WAnZxrvTu2EmURScXLyWOnUhCx2qz4g1ls7NAxgicoEdTS/lSBsXRjue+QW72FzTaKQfBqQ0T5t/zpsUJTraVupdORDn2bZCzWcFhevnI7rFF3/U0StwdEelpExCU8Pc0OlVuUn40VxQRXkunbj8N6SSxfVAA3vrqAuGJDd/FvEqeZL7Isbsa3T0t35JY1CdVdjkxpukU0z1M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(8676002)(6512007)(66556008)(478600001)(186003)(66476007)(38070700005)(64756008)(36756003)(6916009)(66446008)(76116006)(91956017)(2906002)(86362001)(83380400001)(6506007)(53546011)(3480700007)(71200400001)(54906003)(5660300002)(2616005)(4326008)(122000001)(316002)(66946007)(38100700002)(8936002)(26005)(6486002)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7F8479821F8D94EAC83556DE029CBE0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4665
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ef4d185-d307-47ee-88dc-08d9711f2341
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lmV0IZJ4pSh8wRUNd26QEZzegHO2z1kxCLV1tDw81hkfUKg8fSte+Zpw8+Zp/GOmG+/i9L2SGTsS4LwJmV42/ofgbh9Gmqb/HO5eJFwhnwpJlycSIuzUy5/uwAlvN2IxmPWMwFujAvMUiPGHhXL3yYtiC4XCE59ZbbuF0EUEWNl1QbEqarUs3Jb4eDz5OaTgSG5msZw5Hr+9jns38exEwebI3HgOVpZCmC38+yKq3S0MPci2jfB3pYAQzKs+1QTHRvRCR+NaSoIsivvO4yofTKkvdlH2/WptPTmmE6r4aidYQj5q+Whr9HdP3vF9AUtqXSIxoEZ2UbD3pJmJZxEviwIrJN3js+K+s8yaiPUOeOhACJbrwlc8kLVSph17gyqmUhdOSBcaOw84kjn9rFlPQGc5STOooonLwJxrTAjJsAXrSoQrXup+sAKtEcB2vEPUfXrVwEc7WrKtX8imYoUGonzj8+qPT8PB0O/978ck/vJnhwX+SoCuyPnj7RjJxtikABfTiSi3io9zcD0PawsEccCeFiX35WDm22TPvNNplFTVoTTbBrP1H90HrnGWhQ8cgocpNqYHejlGQ93Ztk1KgG9bgGYT/fF/sgg2VxROWdUZ9ViFJH8Wn+SJAPf5b+p+8wsSyJWljinaXE6OhygMODY/AclNL5FDmMq3+SnEJYJDwCR1A1DXjWL/rQXUG0wO7J2XSZ4caXGPsRFPuvQf1A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(36840700001)(46966006)(26005)(107886003)(356005)(36756003)(3480700007)(86362001)(6486002)(70206006)(70586007)(186003)(8676002)(83380400001)(2906002)(4326008)(53546011)(6506007)(82740400003)(81166007)(6862004)(336012)(5660300002)(47076005)(36860700001)(2616005)(82310400003)(8936002)(316002)(33656002)(478600001)(54906003)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 10:14:51.3972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79cc6872-6e4f-4a59-c34f-08d9711f2a2b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5899

SEkgSnVlcmdlbiwNCg0KPiBPbiA2IFNlcCAyMDIxLCBhdCAxMDoyOCwgSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDA2LjA5LjIxIDEwOjQ2LCBBbmRyZXcg
Q29vcGVyIHdyb3RlOg0KPj4gT24gMDYvMDkvMjAyMSAwOToyMywgSnVlcmdlbiBHcm9zcyB3cm90
ZToNCj4+PiBPbiAwMy4wOS4yMSAxNzo0MSwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+Pj4g
SGksDQo+Pj4+IA0KPj4+PiBXaGlsZSBkb2luZyBzb21lIGludmVzdGlnYXRpb24gd2l0aCBjcHVw
b29scyBJIGVuY291bnRlcmVkIGEgY3Jhc2gNCj4+Pj4gd2hlbiB0cnlpbmcgdG8gaXNvbGF0ZSBh
IGd1ZXN0IHRvIGl0cyBvd24gcGh5c2ljYWwgY3B1Lg0KPj4+PiANCj4+Pj4gSSBhbSB1c2luZyBj
dXJyZW50IHN0YWdpbmcgc3RhdHVzLg0KPj4+PiANCj4+Pj4gSSBkaWQgdGhlIGZvbGxvd2luZyAo
b24gRlZQIHdpdGggOCBjb3Jlcyk6DQo+Pj4+IC0gc3RhcnQgZG9tMCB3aXRoIGRvbTBfbWF4X3Zj
cHVzPTENCj4+Pj4gLSByZW1vdmUgY29yZSAxIGZyb20gZG9tMCBjcHVwb29sOiB4bCBjcHVwb29s
LWNwdS1yZW1vdmUgUG9vbC0wIDENCj4+Pj4gLSBjcmVhdGUgYSBuZXcgcG9vbDogeGwgY3B1cG9v
bC1jcmVhdGUgbmFtZT1cIk5ldFBvb2xc4oCdDQo+Pj4+IC0gYWRkIGNvcmUgMSB0byB0aGUgcG9v
bDogeGwgY3B1cG9vbC1jcHUtYWRkIE5ldFBvb2wgMQ0KPj4+PiAtIGNyZWF0ZSBhIGd1ZXN0IGlu
IE5ldFBvb2wgdXNpbmcgdGhlIGZvbGxvd2luZyBpbiB0aGUgZ3Vlc3QgY29uZmlnOg0KPj4+PiBw
b29sPeKAnE5ldFBvb2wiDQo+Pj4+IA0KPj4+PiBJIGVuZCB3aXRoIGEgY3Jhc2ggd2l0aCB0aGUg
Zm9sbG93aW5nIGNhbGwgdHJhY2UgZHVyaW5nIGd1ZXN0IGNyZWF0aW9uOg0KPj4+PiAoWEVOKSBY
ZW4gY2FsbCB0cmFjZToNCj4+Pj4gKFhFTikgICAgWzwwMDAwMDAwMDAwMjM0Y2IwPl0gY3JlZGl0
Mi5jI2NzY2hlZDJfYWxsb2NfdWRhdGErMHg1OC8weGZjDQo+Pj4+IChQQykNCj4+Pj4gKFhFTikg
ICAgWzwwMDAwMDAwMDAwMjM0YzgwPl0gY3JlZGl0Mi5jI2NzY2hlZDJfYWxsb2NfdWRhdGErMHgy
OC8weGZjDQo+Pj4+IChMUikNCj4+Pj4gKFhFTikgICAgWzwwMDAwMDAwMDAwMjQyZDM4Pl0gc2No
ZWRfbW92ZV9kb21haW4rMHgxNDQvMHg2YzANCj4+Pj4gKFhFTikgICAgWzwwMDAwMDAwMDAwMjJk
ZDE4Pl0NCj4+Pj4gY3B1cG9vbC5jI2NwdXBvb2xfbW92ZV9kb21haW5fbG9ja2VkKzB4MzgvMHg3
MA0KPj4+PiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyMmZhZGM+XSBjcHVwb29sX2RvX3N5c2N0bCsw
eDczYy8weDc4MA0KPj4+PiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyMmQ4ZTA+XSBkb19zeXNjdGwr
MHg3ODgvMHhhNTgNCj4+Pj4gKFhFTikgICAgWzwwMDAwMDAwMDAwMjczYjY4Pl0gdHJhcHMuYyNk
b190cmFwX2h5cGVyY2FsbCsweDc4LzB4MTcwDQo+Pj4+IChYRU4pICAgIFs8MDAwMDAwMDAwMDI3
NGY3MD5dIGRvX3RyYXBfZ3Vlc3Rfc3luYysweDEzOC8weDYxOA0KPj4+PiAoWEVOKSAgICBbPDAw
MDAwMDAwMDAyNjA0NTg+XSBlbnRyeS5vI2d1ZXN0X3N5bmNfc2xvd3BhdGgrMHhhNC8weGQ0DQo+
Pj4+IA0KPj4+PiBBZnRlciBzb21lIGRlYnVnZ2luZyBJIGZvdW5kIG91dCB0aGF0IHVuaXQtPnZj
cHVfbGlzdCBpcyBOVUxMIGFmdGVyDQo+Pj4+IHVuaXQtPnZjcHVfbGlzdCA9IGQtPnZjcHVbdW5p
dC0+dW5pdF9pZF07IHdpdGggdW5pdF9pZCAwIGluDQo+Pj4+IGNvbW1vbi9zY2hlZC9jb3JlLmM6
Njg4DQo+Pj4+IFRoaXMgbWFrZXMgdGhlIGNhbGwgdG8gaXNfaWRsZV91bml0KHVuaXQpIGluIGNz
Y2hlZDJfYWxsb2NfdWRhdGENCj4+Pj4gdHJpZ2dlciB0aGUgY3Jhc2guDQo+Pj4gDQo+Pj4gU28g
dGhlcmUgaXMgbm8gdmNwdSAwIGluIHRoYXQgZG9tYWluPyBIb3cgaXMgdGhpcyBwb3NzaWJsZT8N
Cj4+IEVhc3ksIGRlcGVuZGluZyBvbiB0aGUgb3JkZXIgb2YgaHlwZXJjYWxscyBpc3N1ZWQgYnkg
dGhlIHRvb2xzdGFjay4NCj4+IEJldHdlZW4gRE9NQ1RMX2NyZWF0ZWRvbWFpbiBhbmQgRE9NQ1RM
X21heF92Y3B1cywgdGhlIGRvbWFpbiBleGlzdHMgYnV0DQo+PiB0aGUgdmNwdXMgaGF2ZW4ndCBi
ZWVuIGFsbG9jYXRlZC4NCj4gDQo+IE9oIHllcywgaW5kZWVkLg0KPiANCj4gQmVydHJhbmQsIGRv
ZXMgdGhlIGF0dGFjaGVkIHBhdGNoIGZpeCB0aGUgaXNzdWUgZm9yIHlvdT8NCg0KSXQgZG9lcywg
bXkgZ3Vlc3QgaXMgbm93IGJvb3RpbmcgcHJvcGVybHkgOi0pDQpTbyB0aGlzIGlzIHNvbHZpbmcg
dGhlIGlzc3VlIG9uIGFybSAoYW5kIHByb2JhYmx5IG9uIHg4NiBpZiBpdCB3YXMgcHJlc2VudCBi
dXQgdW50ZXN0ZWQgYnkgbWUpLg0KDQpGZWVsIGZyZWUgdG8gYWRkIHRvIHlvdXIgcGF0Y2ggbXk6
DQpSZXZpZXdlZC1ieTogQmVydHJhbmQgTWFycXVpcyA8YmVydHJhbmQubWFycXVpc0Bhcm0uY29t
Pg0KDQpUaGFua3MgYSBsb3QgZm9yIHRoZSBxdWljayBmaXgNCkNoZWVycw0KQmVydHJhbmQNCg0K
PiANCj4gDQo+IEp1ZXJnZW4NCj4gPDAwMDEteGVuLXNjaGVkLWZpeC1zY2hlZF9tb3ZlX2RvbWFp
bi1mb3ItZG9tYWluLXdpdGhvdXQtdi5wYXRjaD48T3BlblBHUF8weEIwREU5REQ2MjhCRjEzMkYu
YXNjPg0KDQo=

