Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C5C42EEF0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210245.367026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKXW-0006gy-W5; Fri, 15 Oct 2021 10:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210245.367026; Fri, 15 Oct 2021 10:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKXW-0006dt-RN; Fri, 15 Oct 2021 10:34:14 +0000
Received: by outflank-mailman (input) for mailman id 210245;
 Fri, 15 Oct 2021 10:34:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbKXU-0006dl-Tq
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:34:12 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::60b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a98536d8-b8fa-4eec-b97f-576e208de899;
 Fri, 15 Oct 2021 10:34:11 +0000 (UTC)
Received: from AS9PR05CA0057.eurprd05.prod.outlook.com (2603:10a6:20b:489::35)
 by HE1PR0802MB2380.eurprd08.prod.outlook.com (2603:10a6:3:c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 10:34:05 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::5) by AS9PR05CA0057.outlook.office365.com
 (2603:10a6:20b:489::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 10:34:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 10:34:05 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 15 Oct 2021 10:34:04 +0000
Received: from 4fce7bd9266e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D9101E4-5C64-41F8-96EC-54AE9329E1C0.1; 
 Fri, 15 Oct 2021 10:33:58 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4fce7bd9266e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 10:33:58 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB3561.eurprd08.prod.outlook.com (2603:10a6:10:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 10:33:54 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 10:33:54 +0000
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
X-Inumbo-ID: a98536d8-b8fa-4eec-b97f-576e208de899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eFMa+E8JcpKIaxl768vJ8cp10kxiTSJzeR6Cil4j/I=;
 b=5dMvVjSKcBXugu/4YD8OMJSAWW8skLkfFnOgSUJy+Kcxz+G10Yjp+Tlv9hPSf7NJ2IDZkJ46sAKiF5KqB1uW0RTgcJQm7ZQYLYzr37h35WwyfizAPLv30iXEWUwu3xyAN+Cj9FU17vPfBVjqmWtdn33i/jR/XhKCpBbkIKh7sd8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8328fcdafdcb65d0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fsRqK49zvyscG3/mZeXzWC2wrz7GCSTXRanGjk4W0LVME/0h4v52fP/ptnhgYXfwuOeYxtD6WUARRZZRDJkzjGniO941zj9zMphjIC5eheS7IE60cwEFwfqosrD46DrDnbgNmpOieJbyLWpkg7a06SyWfVdb5ejkSN9sIY9WFrg5B3h9N+9MSNcrmr4kQ7fRrB6vvRbSkbIiwkXdyXEWQv0FpXnWmKb/F0dgWrUEeyZoXNFyG3zKMkLEyqqqKe/WXutQQBq3DklU6BotuK5+gRewY63b4edoTnXXfLco4jJA2Mn3pahKtOZhOOvp+JzrOZHjE0ugCUPjAL0I0ri1SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eFMa+E8JcpKIaxl768vJ8cp10kxiTSJzeR6Cil4j/I=;
 b=layTUdSJ8fH7u7IoBt8e8b2qt53dUPVaUCHzICYdjUPo2fnGiFneP0fgAY1pVVGLK6K1gcO8SP/Zu4A6K8/A4aAlRPXM4Svj0GGDPtqPTdITzpA+swCDvVT1MFz7Qsck48QRuzTvqHzN1zO+XAGqJnMYtoHGsdvWkXIPnVbHrMC9kf3BS2zmCtPLiaw8TtlH39DUMWX7EGsJGC1unVU3DT99cHBCdg1fYKi1Qbx/TRyEYgVAG05v6muSuF7jn2NxFahc83HQg5oCpouAVa0VCQkZrlk94lmBkHe1i/XTYgkzPFZ6mrZq0J9dNWsAc9BQe+Tkorp8Ptk1TmkCnEnEuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5eFMa+E8JcpKIaxl768vJ8cp10kxiTSJzeR6Cil4j/I=;
 b=5dMvVjSKcBXugu/4YD8OMJSAWW8skLkfFnOgSUJy+Kcxz+G10Yjp+Tlv9hPSf7NJ2IDZkJ46sAKiF5KqB1uW0RTgcJQm7ZQYLYzr37h35WwyfizAPLv30iXEWUwu3xyAN+Cj9FU17vPfBVjqmWtdn33i/jR/XhKCpBbkIKh7sd8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXwQrjS6mPrKT7Q06z3N66FcsDAKvTvGsAgAAWOICAAAj6gIAAApmA
Date: Fri, 15 Oct 2021 10:33:54 +0000
Message-ID: <BFC005A8-4C72-41C5-93F4-98BB9CBAB198@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
 <1c298c02-5791-8935-f996-516da2409f24@suse.com>
In-Reply-To: <1c298c02-5791-8935-f996-516da2409f24@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e77c0b50-7497-473b-07e4-08d98fc7500a
x-ms-traffictypediagnostic: DB7PR08MB3561:|HE1PR0802MB2380:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB23809E31F41D8CADA940EFB39DB99@HE1PR0802MB2380.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Egv69TsnhWqxPTQIgROH6yi1dcW4aT4d0bqKddjMWXnXalUR02RW5FzSirPJhcgckOswXoV7nc1/O6edWDwEs1Fz8r+ur0MZJ399zStbM1ELj7e9kKTzdXzRk5okS2deX9lbv2Dxnlfk5rrNG83F/sP4YQaV01LNCaJuW2gO4Po5G5WCFHKAUAyfxeDD5gM1tLt2kp6jOdSIh0WEx9A7FoGdJUWmhH066nBUXAzkhLO5L9TX/5I49ygvhk6de7zvVIUutDUPKaim9iJo9UEtF5/aoHRSkHj+mSYRPh4Hb9P4GMTrcRqLUOQp0tKw1RhTyp2rJTHZNgLAZEk7AybDmz/ilhLhG8tkF+BAC7efjE3ayi6d6ZENjCmdfutaMx+E/z5DANhidwLRKt9duhdH2z5FoMo3Ohbv/aA7/ADTCXEwe+66gb6ecYvGyHbuhCv7KTMHa/EYdNCHUcPl21cy/IiTJWr+4BFj+ueqXpo4Xo+1VkjfFHqiweYctEh4R0fWitKpMyy+6oML693d4jrRBu6bkYyRClbKrspGYayNXlcf6bZus+FTlQFTl1kKJUO5raogw6qzYTuFu16l1Fje17KqUfXCmS2IpJLbAmbgxn2rJIqywajgJyeCW2nIjEcwRjpdC5UOJnT1ZPGjOqda+VYfnDdiFubifhR3xQeP0uY69jkARAcZNlH0e34kM2FtmKmEqS3dpn4uSArqlpx/cf8azOgTUml3W9hEkMuwKNbuJ1SazpriGtBI57fLHXR+0jHAxD5ETFPgwbLS2iRoodt6wLA5s5AtMYAJh6KUS5b9XE7ZVQqXirByitTjSdAl5a2lyTV1TNvd30rEmgRsVM+tR7YHaqlmfMGkRQbEu5c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8676002)(53546011)(508600001)(2616005)(4326008)(33656002)(966005)(71200400001)(54906003)(83380400001)(6506007)(5660300002)(36756003)(6512007)(186003)(66446008)(66946007)(66556008)(66476007)(38070700005)(64756008)(8936002)(7416002)(6916009)(76116006)(6486002)(86362001)(2906002)(38100700002)(91956017)(26005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <22BE28B286725343822A98DFFC3D3C43@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3561
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1b5aaff9-aeea-43da-af59-08d98fc74962
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O3ApfrqeFGWgezfZNmjuXYCOWouLAslOevN2bICUqHgtPOVo2tya6TkfyNxFv9Cel4hPq5XkCoxD1QnWnDseidO6T1gnqji2WQRyEbeGiKNqZWDw/UQCRXAuQ8mNC7zGvp3/Z4jHp1amZM8KipRvu5r/4QKxXpuXH8iOb/v+fOmlo8swlLo95KD5gSyjjAzQJ05Y4R8AzrD8q8aWxcjfah0sERrrShq3MtaVShfVO80TfsiEIm2FELmEZOA1U70kyL39jjlGskAsN316Ft0iLLGUokOcrboioUyzy5FeDabVIHb5sNbSOflRJYU+AIhx+9HMtdyjYwZHhvM4DLElFQy58vV3OdvRVGvBNEA5wVB6J2jbQe1wZNKdl9iqr8iYtkEoeI8yP4wlZMMHHbdfg8HiNYqUMaNJc6670tI/nK3h93Qmd5SAZFPphhs4oQ5hKztvmhlycQ8V9hdpAbRFK05wD/6/NLIC7kIPbUz8WrXBcm7TwnOXuVe1Yh58UgmDGQuOdzSLF3Q+Dzjf1r+kTLW7dHfYFVad/Y5n9FDW2xXPRDkdMPcrWSpvMGjzIYRWc7LG3pPtvlqmiKrbQxD5/YObx1RYx7kvvfwTvfR0PLBJXR4HIribQGyTbBQPAR8AkGUwYzVS/oiejNmnqDDbmcrptzg5GT1UTBv8OWXRV6PQ0mWzM1D3b8wOO/ADUp4eRB3XmvSEWgNXi8N4cSjQpFDuAt+CLlnA6zdJI4Fc4mMYa6sdR5Z81GxH2O2oW0v91Ab07fiJlnQ+Em5ljLlPs2EQcoJsOBLtnfOEtgj0awtebTOTnFWoVWbAvbeqjelJi1y2fB5xzInomb8z4DVCTw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(6512007)(6862004)(6486002)(2616005)(47076005)(5660300002)(8936002)(81166007)(82310400003)(33656002)(54906003)(36860700001)(508600001)(83380400001)(70586007)(4326008)(36756003)(316002)(186003)(966005)(26005)(107886003)(70206006)(2906002)(6506007)(86362001)(53546011)(356005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:34:05.2664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e77c0b50-7497-473b-07e4-08d98fc7500a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2380

DQoNCj4gT24gMTUgT2N0IDIwMjEsIGF0IDExOjI0LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTUuMTAuMjAyMSAxMTo1MiwgQmVydHJhbmQgTWFycXVp
cyB3cm90ZToNCj4+PiBPbiAxNSBPY3QgMjAyMSwgYXQgMDk6MzIsIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+PiBPbiBUaHUsIE9jdCAxNCwgMjAyMSBh
dCAwMzo0OTo1MFBNICswMTAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+PiBAQCAtNzUy
LDYgKzc1MiwxOSBAQCBpbnQgcGNpX2FkZF9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBkZXZm
biwNCj4+Pj4gDQo+Pj4+ICAgIGNoZWNrX3BkZXYocGRldik7DQo+Pj4+IA0KPj4+PiArI2lmZGVm
IENPTkZJR19BUk0NCj4+Pj4gKyAgICAvKg0KPj4+PiArICAgICAqIE9uIEFSTSBQQ0kgZGV2aWNl
cyBkaXNjb3Zlcnkgd2lsbCBiZSBkb25lIGJ5IERvbTAuIEFkZCB2cGNpIGhhbmRsZXIgd2hlbg0K
Pj4+PiArICAgICAqIERvbTAgaW5mb3JtIFhFTiB0byBhZGQgdGhlIFBDSSBkZXZpY2VzIGluIFhF
Ti4NCj4+Pj4gKyAgICAgKi8NCj4+Pj4gKyAgICByZXQgPSB2cGNpX2FkZF9oYW5kbGVycyhwZGV2
KTsNCj4+Pj4gKyAgICBpZiAoIHJldCApDQo+Pj4+ICsgICAgew0KPj4+PiArICAgICAgICBwcmlu
dGsoWEVOTE9HX0VSUiAiU2V0dXAgb2YgdlBDSSBmYWlsZWQ6ICVkXG4iLCByZXQpOw0KPj4+PiAr
ICAgICAgICBnb3RvIG91dDsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsjZW5kaWYNCj4+PiANCj4+PiBJ
IHRoaW5rIHZwY2lfYWRkX2hhbmRsZXJzIHNob3VsZCBiZSBjYWxsZWQgYWZ0ZXIgY2hlY2tpbmcg
dGhhdA0KPj4+IHBkZXYtPmRvbWFpbiBpcyAhPSBOVUxMLCBzbyBJIHdvdWxkIG1vdmUgdGhpcyBj
aHVuayBhIGJpdCBiZWxvdy4NCj4+IA0KPj4gT24gYXJtIHRoaXMgd291bGQgcHJldmVudCB0aGUg
ZG9tMGxlc3MgdXNlIGNhc2Ugb3IgdG8gaGF2ZSB0aGUgUENJDQo+PiBidXMgZW51bWVyYXRlZCBm
cm9tIGFuIG90aGVyIGRvbWFpbi4NCj4+IEBvbGVrc2FuZHI6IGNhbiB5b3UgY29tbWVudCBvbiB0
aGlzIG9uZSwgeW91IG1pZ2h0IGhhdmUgYSBiZXR0ZXINCj4+IGFuc3dlciB0aGFuIG1lIG9uIHRo
aXMgPw0KPiANCj4gV2VsbCwgd2l0aG91dCBYZW4gZG9pbmcgdGhlIGVudW1lcmF0aW9uLCBzb21l
IG90aGVyIGVudGl0eSB3b3VsZCBuZWVkDQo+IHRvIGRvIHNvLCBpbmNsdWRpbmcgdGhlIHJlcG9y
dGluZyB0byBYZW4uIE9idmlvdXNseSB3aXRob3V0IGEgRG9tMCBpdA0KPiB3b3VsZCBiZSBhbWJp
Z3VvdXMgd2hpY2ggZG9tYWluIHRvIGFzc2lnbiB0aGUgZGV2aWNlIHRvOyBwZXJoYXBzIGl0DQo+
IHNob3VsZCBiZSB0aGUgY2FsbGVyIGluIHRoaXMgY2FzZT8gVGhhdCB3b3VsZCBtYWtlIHRoYXQg
Y2FsbGVyIGRvbWFpbg0KPiBhIHBzZXVkby1od2RvbSB0aG91Z2gsIGFzIGZhciBhcyBQQ0kgaXMg
Y29uY2VybmVkLCB3aGljaCBtYXkgbm90IGJlDQo+IGRlc2lyYWJsZSBhY2NvcmRpbmcgdG8gbXkg
KGxpbWl0ZWQpIHVuZGVyc3RhbmRpbmcgb2YgZG9tMGxlc3MuDQoNClRoaXMgaXMgbm90IHJlYWxs
eSByZWxhdGVkIHRvIHRoaXMgcGF0Y2ggYnV0IHRoZSBwbGFuIGlzIHRoZSBmb2xsb3dpbmc6DQot
IGVudW1lcmF0aW9uIHdvdWxkIGhhdmUgdG8gYmUgZG9uZSBieSB0aGUgZmlybXdhcmUgb3IgYm9v
dCBsb2FkZXIgYmVmb3JlDQotIHhlbiB3aWxsIGhhdmUgc29tZSBjb2RlIHRvIGRldGVjdCBQQ0kg
ZGV2aWNlcw0KLSBkb20wbGVzcyBjYW4gYmUgdXNlZCB0byBhc3NpZ24gUENJIGRldmljZXMgdG8g
Z3Vlc3QNCg0KQW55d2F5IGRvZXMgbm90IGNoYW5nZSB0aGUgZmFjdCB0aGF0IHRoaXMgbXVzdCBi
ZSBjYWxsZWQgd2hlbiBkb21haW4gaXMgbm90IE5VTEwgYW5kIEkgd2lsbCBmaXggdGhhdC4NCg0K
PiANCj4+Pj4gQEAgLTc4NCw2ICs3OTcsOSBAQCBvdXQ6DQo+Pj4+ICAgICAgICAgICAgICAgICAg
ICZQQ0lfU0JERihzZWcsIGJ1cywgc2xvdCwgZnVuYykpOw0KPj4+PiAgICAgICAgfQ0KPj4+PiAg
ICB9DQo+Pj4+ICsgICAgZWxzZSBpZiAoIHBkZXYgKQ0KPj4+PiArICAgICAgICBwY2lfY2xlYW51
cF9tc2kocGRldik7DQo+Pj4gDQo+Pj4gSSdtIHNsaWdodGx5IGxvc3QgYXQgd2h5IHlvdSBhZGQg
dGhpcyBjaHVuaywgaXMgdGhpcyBzdHJpY3RseSByZWxhdGVkDQo+Pj4gdG8gdGhlIHBhdGNoPw0K
Pj4gDQo+PiBUaGlzIHdhcyBkaXNjdXNzZWQgYSBsb3QgaW4gcHJldmlvdXMgdmVyc2lvbiBvZiB0
aGUgcGF0Y2ggYW5kDQo+PiByZXF1ZXN0ZWQgYnkgU3RlZmFuby4gVGhlIGlkZWEgaGVyZSBpcyB0
aGF0IGFzIHNvb24gYXMgaGFuZGxlcnMNCj4+IGFyZSBhZGRlZCBzb21lIGJpdHMgbWlnaHQgYmUg
bW9kaWZpZWQgaW4gdGhlIFBDSSBjb25maWcgc3BhY2UNCj4+IGxlYWRpbmcgcG9zc2libHkgdG8g
bXNpIGludGVycnVwdHMuIFNvIGl0IGlzIHNhZmVyIHRvIGNsZWFudXAgb24gdGhlDQo+PiBlcnJv
ciBwYXRoLiBGb3IgcmVmZXJlbmNlcyBwbGVhc2Ugc2VlIGRpc2N1c3Npb24gb24gdjQgYW5kIHY1
IHdoZXJlDQo+PiB0aGlzIHdhcyBhY3R1YWxseSBhZGRlZCAodG8gbXVjaCByZWZlcmVuY2VzIGFz
IHRoZSBkaXNjdXNzaW9uIHdhcw0KPj4gbG9uZyBzbyBoZXJlIFsxXSBhbmQgWzJdIGFyZSB0aGUg
cGF0Y2h3b3JrIHRocmVhZCkuDQo+PiANCj4+IFsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNoLzliZGNhMmNkYTVkMmU4M2Y5NGRjMjQyM2U1NTcx
NDI3MzUzOTc2MGEuMTYzMzU0MDg0Mi5naXQucmFodWwuc2luZ2hAYXJtLmNvbS8NCj4+IFsyXSBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNoL2YwOTNk
ZTY4MWMyNTYwYTcxOTY4OTViY2Q2NjZlZjg4NDA4ODVjMWQuMTYzMzM0MDc5NS5naXQucmFodWwu
c2luZ2hAYXJtLmNvbS8NCj4gDQo+IFRoZSBhZGRpdGlvbiBvZiB0aGlzIGNhbGwgaGFzIHJlcGVh
dGVkbHkgcmFpc2VkIHF1ZXN0aW9ucy4gVGhpcyBpcyBhDQo+IGdvb2QgaW5kaWNhdGlvbiB0aGF0
IHN1ZmZpY2llbnQgZGlzY3Vzc2lvbiB0aGVyZW9mIGhhcyBiZWVuIGxhY2tpbmcNCj4gZnJvbSB0
aGUgcGF0Y2ggZGVzY3JpcHRpb24uDQoNClllcyBhbmQgSSB3aWxsIHJlbW92ZSBpdCBhcyBpdCBv
bmx5IGltcGFjdHMgeDg2IHJpZ2h0IG5vdy4NCklmIHRoaXMgaXMgbmVlZGVkLCB3ZSB3aWxsIGhh
dmUgdG8gZG8gaXQgd2hpbGUgYWRkaW5nIE1TSSBzdXBwb3J0IG9uIEFybS4NCg0KUmVnYXJkcw0K
QmVydHJhbmQNCg0KPiANCj4gSmFuDQo+IA0KDQo=

