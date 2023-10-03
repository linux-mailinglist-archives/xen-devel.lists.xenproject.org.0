Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41737B62AD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Oct 2023 09:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612124.951953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qna5K-0008PK-40; Tue, 03 Oct 2023 07:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612124.951953; Tue, 03 Oct 2023 07:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qna5K-0008Mn-0h; Tue, 03 Oct 2023 07:44:50 +0000
Received: by outflank-mailman (input) for mailman id 612124;
 Tue, 03 Oct 2023 07:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hNjg=FR=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qna5I-0008LU-61
 for xen-devel@lists.xenproject.org; Tue, 03 Oct 2023 07:44:48 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c4f406-61c0-11ee-98d2-6d05b1d4d9a1;
 Tue, 03 Oct 2023 09:44:46 +0200 (CEST)
Received: from AS8PR07CA0058.eurprd07.prod.outlook.com (2603:10a6:20b:459::15)
 by PAVPR08MB8966.eurprd08.prod.outlook.com (2603:10a6:102:320::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Tue, 3 Oct
 2023 07:44:43 +0000
Received: from AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:459:cafe::c2) by AS8PR07CA0058.outlook.office365.com
 (2603:10a6:20b:459::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.24 via Frontend
 Transport; Tue, 3 Oct 2023 07:44:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT053.mail.protection.outlook.com (100.127.140.202) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.25 via Frontend Transport; Tue, 3 Oct 2023 07:44:43 +0000
Received: ("Tessian outbound ab4fc72d2cd4:v211");
 Tue, 03 Oct 2023 07:44:42 +0000
Received: from 82693a9d1c2a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 487C7AD8-782A-440E-9975-E9490E6AAA7E.1; 
 Tue, 03 Oct 2023 07:44:31 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82693a9d1c2a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 Oct 2023 07:44:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV2PR08MB8344.eurprd08.prod.outlook.com (2603:10a6:150:c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Tue, 3 Oct
 2023 07:44:25 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::d0ef:bed9:d414:e404%4]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 07:44:24 +0000
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
X-Inumbo-ID: b8c4f406-61c0-11ee-98d2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7S2fb8E2+dgqK0X7XudhqCH7RZeLIoxa15wZ4NRYCk=;
 b=2dbxqN5Go1jjr25+lQmA0LcRlBHS5GW+Hwp3N96R2ITRjYKwkOYBXp7ysFC68thwTLqHwsHVIy3Q1Y+J/Fyk0YPr8jqC0QbrV++gYTUeYdDFMDnLk0ApForq+zlWaUejLwruytjbABDMcSvpr4XPXEEhWS2az8AxjhBDhXI0tnw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82f6f899de8f5d33
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPywmDD5d7saMhKe3rFofOQTHApSIF/yks4T+nL1UuqKpBf+1bOgM0gIuj7tZoDZRqfZdzywWSwxzuVDqLhOrIHiAvJpYyfL9bbZG3TIszBu+g3HJ+HF6Z6anNavMo0eF2txMHCrFVHbOsgnNDclseZpndMAb71J8n4aOWe7+o9xD6Zvcn9R0dByKtZ1w/gEt/TCYiEmbErqjLHfxlq7ZyyxzvkLN5jPGrtlUywjHQ7rwsoNFryt17mO0lx1mAAVpQaxCoXFyHBqDzWFfQV+C7IfjI2ESq9fAmO0ZkVl4Ospt3ohI6yBGnDtQusRKeur3HSjmxWR+v6HhV3iSavjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7S2fb8E2+dgqK0X7XudhqCH7RZeLIoxa15wZ4NRYCk=;
 b=AzwLZsJxz7oSkXbCoK7qQXCIeDhRGKvV0U52mYUol90ZflWUB8W6yiWzm9PUKCT9NSQKUdEwwU1AKMrt+O6WfpwjG5Odt7ZIEriaXdfUvr0JybsPf6dNAOX4+Gbhtpw8k55ks2CZqSAM167FgCaB8PdxdjFx9Yc0N4Hqo3XCE3+KSsKwnldeWKenM8BVsGIWUEq9QGasSc4a0mv+QWLz1qN0+ICr/AhaHMSgI2eJv0LDXdBlLPlshVTV2IXqG9URBTW9hwUVvrYjD9W7nnI6oeUFMNqmEyjl2Bd7pa0XetTHtYQ/FWuc1WKW+TZkoXRAy6bvly/z+EpDE/pK3kSsbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7S2fb8E2+dgqK0X7XudhqCH7RZeLIoxa15wZ4NRYCk=;
 b=2dbxqN5Go1jjr25+lQmA0LcRlBHS5GW+Hwp3N96R2ITRjYKwkOYBXp7ysFC68thwTLqHwsHVIy3Q1Y+J/Fyk0YPr8jqC0QbrV++gYTUeYdDFMDnLk0ApForq+zlWaUejLwruytjbABDMcSvpr4XPXEEhWS2az8AxjhBDhXI0tnw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
	<julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Topic: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Thread-Index:
 AQHZ8UtNgBNI2koBH0+cEATmTDiuOrAw9peAgABwTYCAANJ9gIAD+GkAgABk7gCAAIXRgIAAm66A
Date: Tue, 3 Oct 2023 07:44:23 +0000
Message-ID: <0348B5FA-D65C-4D70-99A4-47398BD4266C@arm.com>
References: <20230927140133.631192-1-luca.fancellu@arm.com>
 <20230927140133.631192-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2309281726440.1996340@ubuntu-linux-20-04-desktop>
 <725342EA-730F-4961-88A4-43EC0CBAD5BA@arm.com>
 <alpine.DEB.2.22.394.2309291242570.2348112@ubuntu-linux-20-04-desktop>
 <bc2a043a-9836-429b-88bb-6bedda5343bf@xen.org>
 <38AD4AA5-D038-4114-A614-80BF91FB51FB@arm.com>
 <alpine.DEB.2.22.394.2310021512210.2348112@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310021512210.2348112@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV2PR08MB8344:EE_|AM7EUR03FT053:EE_|PAVPR08MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 77951657-a247-4b8d-98ce-08dbc3e49b87
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lcJd5OEmhTAVz9IbK+YRReE+jRnk2FSe5mXjugnQmwEq1wBW+eKmMYPHhUOPq2MIqSmxaKoygYhyYrHqOu3fFpBntizsZHiWirKVT73yuVVlOZqDJagc5XE7FFFuyV8HQKIXQXOlALoRhiqlgv2NIzc17BATHtRsINNJ2kGZlpT5NA45V65QEMu+Pf9F6zpUAluDvAJMnFcAiYe5avVIc4Si/+m2CbHuNvrJbJGsSoi31FmwbYu5wEABp8QuQh+MR2pLbiZfHdI9R94Jnka3AabBY9vkGzZFRnpAkqBNmJKJWFELssEC88yvpXAj0nqiW9L9uONFBeQK7/r6KjIwhFj6Lzd4UG8Empfo6LKj+rVSNQoa3A3X/Fk0/Hq/0oZdsC41Pof2Lx4wAaBhBYx5XMr9rEg/l8kRTwh9eHfPG0cpVbXQn66e7uUSEQWu6cUlbKDOkmu3SFfEnzJid8J+PXra03toVKBuTXypZH78Ri5S156uKIcmQjIIFx/5IOTJxHJKeu4s2H1U8RZzAe5g+Co2+pe5pbSmLldW9w9fuhlOlr4XVMTkPMWy52QH+AOHhikWzcs+vakhztFNCxKmYw9XZ+CPZChO6oSZk9f2UYEfMDtm3ZkWe45KXTU2KwA82kRljsPPxLhQXVOTskR3fDeMZ9RmaNvR5w4TWxqbXOg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(36756003)(6512007)(33656002)(478600001)(6506007)(966005)(2616005)(26005)(86362001)(76116006)(38070700005)(122000001)(2906002)(5660300002)(8936002)(71200400001)(41300700001)(66446008)(83380400001)(54906003)(91956017)(66946007)(38100700002)(8676002)(4326008)(66556008)(316002)(64756008)(6916009)(66476007)(6486002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <86110177DC142E478FBC48BD57DF5945@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8344
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b4642d8f-cd2a-4ddb-2c0b-08dbc3e49005
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rdC422pV/YnieN3+D79IOtqNW6clk51t7KrM/hHG/96jMsZCUOmErkkEHJiIE/QvWsSE9m/M1q6FksLVudCBVwHpv89ewXqtKkDa/V/wzVChqqrXsJS+rH+owVu2lG/QTcRjy1GQRfG/CABUNrxavT2WlOGkfwQhcbXNct6XrBh5HvTxkGy5MTLYLJiVi1x6m0KiaiR0qnDI9nKTdYyGp5wyHQ5K2P8P2qgTlpu7vdxq+RXIctn0fzB7jzoUdkNgNE0wdOIZM8xIi8cR5vgulSEQGIQifQTnW3p+f0+2K0vAR4eqjmilCsvLghyOcdSQeMLIq72Q3jUhsFmMl1DWa4vhfeD7oJOZRUI+m5TfGMbC1KOH8Um0qnejYRi2eM3tPkiOBXRI0VPsc6s+WP9ihcTfJavsjoVGOznTWkKkutBSUlExk5hg0afsDB3P4jJVq/KeS2CYvkaNGXpvWEwFQmJ9IGmvLur/QexVmZBbqT9nXHzFaePHcWt6DpH+gdPoFqpp/CmX0hol0ZW85T78dGCxJ9i2YovQpTlZ38TCFz7jtqvqndjGduKU7HPUqrIoX3bWzRtmxiUvDFrfgsyCZ0BtzNKrNvKhOw2FThBtmWdYlAuJQ8J7xa5n7YP4tzYtf/s9Dg3aHOdY8/1QOPaiS/csYwTZU7rBJCuMi8PH/mCa5XQlOSKMVBMX/j+3MYxs/oMQhUlqHTsnLcOv3H4rI+zbp0LGBe0LpA9svF9ZqZBAs+SzeMLkiL8IsT6I50V4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(136003)(39860400002)(230922051799003)(64100799003)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(70586007)(36860700001)(41300700001)(316002)(478600001)(70206006)(54906003)(82740400003)(47076005)(83380400001)(6506007)(356005)(81166007)(6862004)(8936002)(4326008)(8676002)(966005)(26005)(40460700003)(336012)(2616005)(86362001)(5660300002)(107886003)(40480700001)(6512007)(2906002)(6486002)(33656002)(36756003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 07:44:43.1590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77951657-a247-4b8d-98ce-08dbc3e49b87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8966

DQo+Pj4+IEdpdmVuIHRoYXQgY29kZSBtb3ZlbWVudCBpcyBwYWluZnVsIGZyb20gYSBnaXQgaGlz
dG9yeSBwZXJzcGVjdGl2ZSwgYW5kDQo+Pj4+IGdpdmVuIHRoYXQgd2UgaGF2ZSB0byBtb3ZlIGRv
bTBsZXNzIGNvZGUgdG8geGVuL2NvbW1vbiBhbnl3YXkgdG8gbWFrZQ0KPj4+PiBpdCBhdmFpbGFi
bGUgdG8gUklTQy1WIGFuZCBhbHNvIHg4NiwgY291bGQgd2UgZG8gaXQgaW4gb25lIHNob3QgaGVy
ZT8NCj4+PiANCj4+PiBMb29raW5nIGF0IHRoZSBuYW1lIG9mIHRoZSBmdW5jdGlvbnMsIEkgd291
bGQgZXhwZWN0IHRoYXQgd2Ugd291bGQgbmVlZCBhbm90aGVyIGNvZGUgbW92ZW1lbnQgaW4gdGhl
IGZ1dHVyZSB0byBtb3ZlIGJhY2sgQXJtIHNwZWNpZmljIGZ1bmN0aW9uIHVuZGVyIGFyY2gvYXJt
Ly4gU28gd2Ugd291bGQgZW5kIHVwIHdpdGggdHdvIGNvZGUgbW92ZW1lbnQgYXMgd2VsbC4NCj4+
PiANCj4+PiBJIHdvdWxkIHByZWZlciBpZiB3ZSB3YWl0IHVudGlsIFJJU0MtVi94ODYgbmVlZHMg
aXQgc28gd2UgZG9uJ3QgdW5uZWNlc3NhcmlseSBtb3ZlIEFybSBzcGVjaWZpYyBjb2RlIGluIGNv
bW1vbi8uDQo+PiANCj4+IEkgYWdyZWUgd2l0aCBKdWxpZW4gaGVyZS4NCj4+IE1vdmluZyB0aGUg
Y29kZSBub3cgd2lsbCBtZWFuIG1vdmluZyBwYXJ0IG9mIGl0IGJhY2sgaW4gYXJtIGluIHRoZSBm
dXR1cmUgb25jZSB3ZSBoYXZlIGEgc2Vjb25kIHVzZXIgb2YgdGhpcy4NCj4+IEkgd291bGQgcmF0
aGVyIHdhaXQgZm9yIHRoZSBuZWVkIHRvIGNvbWUgc28gdGhhdCB3ZSBkbyB0aGlzIGNsZWFubHku
DQo+PiANCj4+IEFsc28gdXNpbmcgaHlwZXJsYXVuY2ggbmFtZSBub3cgd291bGQgYmUgd2VpcmQg
YXMgdGhlcmUgd2FzIG5vIGFncmVlbWVudCBvbiB0aGUgbmFtaW5nIChhcyBmYXIgYXMgSSBrbm93
KSBzbyBmYXIuDQo+IA0KPiBSSVNDLVYgaXMgYWxyZWFkeSB1c2luZyBkb20wbGVzcyBjb2RlLCBo
b3dldmVyIGluIGEgZG93bnN0cmVhbQ0KPiByZXBvc2l0b3J5LiBUbyBtYWtlIHByb2dyZXNzIGZh
c3RlciB0aGUgY29kZSB3YXMgY29waWVkIChub3Qgc2hhcmVkKQ0KPiBmcm9tIGFyY2gvYXJtIHRv
IGFyY2gvcmlzY3YuIE1vcmUgZGV0YWlscyBvbiB0aGUgWGVuIGNvbW11bml0eSBjYWxsIHRoaXMN
Cj4gd2Vlay4gaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9vbGt1ci94ZW4v
LS9ibG9iL3Jpc2N2X2FpYV9zdXBwb3J0L3hlbi9hcmNoL3Jpc2N2L2RvbWFpbl9idWlsZC5jP3Jl
Zl90eXBlPWhlYWRzDQo+IA0KPiBIeXBlcmxhdW5jaCBhbHNvIG5lZWRzIGRvbTBsZXNzIGNvZGUg
dG8gYmUgbWFkZSBjb21tb24gdG8gbWFrZSBwcm9ncmVzczoNCj4gaHR0cHM6Ly9tYXJjLmluZm8v
P2w9eGVuLWRldmVsJm09MTY5MTU0MTcyNzAwNTM5DQo+IA0KPiBTbyBJIHRoaW5rIHRoYXQgdGhl
cmUgaXMgYW4gaW1tZWRpYXRlIFJJU0MtViBhbmQgWDg2IG5lZWQuDQo+IA0KPiBCdXQgdGhlIHBv
aW50IGFib3V0ICJtb3ZpbmcgdGhlIGNvZGUgbm93IHdpbGwgbWVhbiBtb3ZpbmcgcGFydCBvZiBp
dA0KPiBiYWNrIGluIGFybSBpbiB0aGUgZnV0dXJlIiBpcyB2YWxpZC4gSG93IGRvIHdlIG1vdmUg
Zm9yd2FyZD8NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBibG9jayBMdWNhJ3MgcHJv
Z3Jlc3MgdG8gd2FpdCBmb3IgbW9yZQ0KPiBwbHVtYmluZ3MgZG9uZSBvbiB4ODYgb3IgUklTQy1W
LiBBbHNvIHdlIGRvbid0IHdhbnQgdG8gc2NvcGUgY3JlZXANCj4gTHVjYSdzIHNlcmllcyB0b28g
bXVjaC4NCj4gDQo+IEJ1dCBJIHRoaW5rIHRoZSBnb2FsIHNob3VsZCBiZSB0byBtb3ZlIGRvbTBs
ZXNzIGNvZGUgdG8geGVuL2NvbW1vbiBhcw0KPiBzb29uIGFzIHBvc3NpYmxlIGFuZCBtYWtlIGl0
IGFyY2ggbmV1dHJhbC4gSG93IGRvIHdlIGdldCB0aGVyZT8NCg0KU28gaGVyZSBpcyB3aHkgSSBm
ZWx0IHBhaW5mdWwgZG9pbmcgbm93IGEgbW92ZSB0byB0aGUgY29tbW9uIGNvZGUsIGJ1dCBtYXli
ZSB5b3UgKG1haW50YWluZXJzKSBjYW4gZ2l2ZSBtZSBzb21lDQpmZWVkYmFja3MuDQoNCkkgc2Vl
IHRoYXQgdGhlIGZ1bmN0aW9ucyB0aGF0IG1pZ2h0IGJlIHB1dCBpbiBjb21tb24gYXJlIHRoZXNl
LCBzb21lIG9mIHRoZW0gaG93ZXZlciBoYXZlIGFybSBzcGVjaWZpYyBjb2RlIGluIHRoZW06DQoN
CmlzX2RvbTBsZXNzX21vZGUNCmFsbG9jYXRlX2JhbmtfbWVtb3J5DQphbGxvY2F0ZV9tZW1vcnkN
CmhhbmRsZV9wYXNzdGhyb3VnaF9wcm9wDQpoYW5kbGVfcHJvcF9wZmR0DQpzY2FuX3BmZHRfbm9k
ZQ0KY2hlY2tfcGFydGlhbF9mZHQNCmRvbWFpbl9wMm1fcGFnZXMNCmFsbG9jX3hlbnN0b3JlX2V2
dGNobg0KZG9tYWluX2hhbmRsZV9kdGJfYm9vdG1vZHVsZSAoY29udGFpbnMgcmVmZXJlbmNlIHRv
IHRoZSBnaWMpDQpwcmVwYXJlX2R0Yl9kb21VIChoYXZlIHJlZmVyZW5jZSB0byBwc2NpLCBnaWMs
IHZwbDAxMSkNCmNvbnN0cnVjdF9kb21VIChoYXZlIHJlZmVyZW5jZSB0byB2cGwwMTEsIHN0YXRp
YyBzaGFyZWQgbWVtb3J5KQ0KY3JlYXRlX2RvbVVzKGhhdmUgcmVmZXJlbmNlIHRvIHZwbDAxMSwg
c3ZlKQ0KDQpIZXJlIHRoZSBmdW5jdGlvbnMgdGhhdCBjYW4gc3RheSBpbiBhcm0gY29kZToNCg0K
bWFrZV9naWN2Ml9kb21VX25vZGUNCm1ha2VfZ2ljdjNfZG9tVV9ub2RlDQptYWtlX2dpY19kb21V
X25vZGUNCm1ha2VfdnBsMDExX3VhcnRfbm9kZQ0KDQoNCkdpdmVuIHRoYXQgdGhlIHN0YXR1cyBh
ZnRlciB0aGUgbW92ZSB0byBjb21tb24gb2YgdGhlIGFib3ZlIGZ1bmN0aW9ucyBpcyBub3QgdmVy
eSBjbGVhbiwgSeKAmXZlIGRlY2lkZWQgdG8gZG9u4oCZdCBkbyB0aGF0LA0KaG93ZXZlciBpZiB5
b3UgYXJlIGZpbmUgd2l0aCBpdCwgSSBjYW4gZG8gdGhlIG1vZGlmaWNhdGlvbiBhbmQgd2hvIGlz
IGdvaW5nIHRvIHdvcmsgZnVydGhlciBvbiB0aGUgc3ViamVjdCBjYW4gY29uc29saWRhdGUNCmFu
ZCBtYWtlIHRoZW0gYnVpbGQgZm9yIG90aGVyIGFyY2hpdGVjdHVyZS4NCg0KQ2hlZXJzLA0KTHVj
YQ0KDQoNCg==

