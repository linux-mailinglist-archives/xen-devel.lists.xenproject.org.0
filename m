Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BEF4FF8B6
	for <lists+xen-devel@lfdr.de>; Wed, 13 Apr 2022 16:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.304187.518773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedkt-0005M7-9i; Wed, 13 Apr 2022 14:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 304187.518773; Wed, 13 Apr 2022 14:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nedkt-0005Iz-6Z; Wed, 13 Apr 2022 14:13:59 +0000
Received: by outflank-mailman (input) for mailman id 304187;
 Wed, 13 Apr 2022 14:13:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0JnL=UX=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nedkr-0005It-C7
 for xen-devel@lists.xenproject.org; Wed, 13 Apr 2022 14:13:57 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe0a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f39cc85f-bb33-11ec-8fbd-03012f2f19d4;
 Wed, 13 Apr 2022 16:13:55 +0200 (CEST)
Received: from DB6P193CA0008.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::18) by
 AM0PR08MB3555.eurprd08.prod.outlook.com (2603:10a6:208:da::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 14:13:52 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::32) by DB6P193CA0008.outlook.office365.com
 (2603:10a6:6:29::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Wed, 13 Apr 2022 14:13:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Wed, 13 Apr 2022 14:13:52 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Wed, 13 Apr 2022 14:13:52 +0000
Received: from a6b25b1d9058.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6A876D6-A8AD-46F5-A3A0-0E48363FC5C7.1; 
 Wed, 13 Apr 2022 14:13:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6b25b1d9058.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Apr 2022 14:13:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB5943.eurprd08.prod.outlook.com (2603:10a6:20b:23e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.19; Wed, 13 Apr
 2022 14:13:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c521:b750:b0a9:54a6%4]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 14:13:42 +0000
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
X-Inumbo-ID: f39cc85f-bb33-11ec-8fbd-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vE/lAdxhqN300wP/pN5KO/QFNf2oijdeHaLrHNbMz8c=;
 b=u85eemjJU7SWhX6uVDN2cqaMLPGpUGDe+s0CPDLI3HBqQkyv5klHSKJBwp+GXL1+LoM/0Zj+rdKidZfZeKfAzEdvFCjTCN2QMD64o15mLgnqfboqlNpC5VqLPff1wtRhVrB53TxuZ9rQMac49nXvpq35lmRPNJhPONt0NQd5CJQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: de09945c0924b19e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ikzCp8LL3H5Yf1KCJnSOH+fHzD6miUFdGT60x4UI/Gnr+RceA/KJh7jlh6CTmz9Quqj62d9o7r4QfCvBw1PJqOvt0USY987iZyqalrSEJVR61khyetVpU72wfOMHY0qkheRjRx2VKLWvxH7ojmE3zzivKzk7bVFOpa0sRLi/QjJ9y/wmKyHxcJP2aUHMi9JK8DuXasvEk++rjwUiO7yB+bfeJ8YIVSr3j/VH5TuMUttRSaWK2FWx0e9lQmizBpnAtyTEioOlsAodFHjmTcovSBjKmhatier0dim30sLhDPZ0zb6CMZmoute/KDWOUJXtiVlIdIDMpUcZHq4SfAVcig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vE/lAdxhqN300wP/pN5KO/QFNf2oijdeHaLrHNbMz8c=;
 b=TgBdCHF8n4cDkEZ39o0qwrc+sTkQc+5Cp7c2GIzuWf/xbgJPIzqvwe/pN1ybdPoNmJ+7O1mrIOebMME8igfG3BlTTvmzAAnyWJharKndLacekEfiGvmV/GZ1nNh5aZsv8xNdWaRsZte7h7ys24/Lq10TdG/C0wY4dew4OanUB+KUfxb5SNcNVOMqyK+wjrLIACoDrThg+Pvny5cQ9rR7hgRr4EpUquXBLz1aQGQ/sabcpsFVSkgIBo6zJkgHCn99gboGRwM0U6Pm0F46r4d85xq6FDxsjp+6bA6i6oUcVJmN8mTGUmFxgPsttpMKOSDw80ZCoT7+WqkGZiAXBH6ujQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vE/lAdxhqN300wP/pN5KO/QFNf2oijdeHaLrHNbMz8c=;
 b=u85eemjJU7SWhX6uVDN2cqaMLPGpUGDe+s0CPDLI3HBqQkyv5klHSKJBwp+GXL1+LoM/0Zj+rdKidZfZeKfAzEdvFCjTCN2QMD64o15mLgnqfboqlNpC5VqLPff1wtRhVrB53TxuZ9rQMac49nXvpq35lmRPNJhPONt0NQd5CJQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Paul
 Durrant <paul@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Thread-Topic: [PATCH 7/8] PCI: replace stray uses of PCI_{DEVFN,BDF}2()
Thread-Index: AQHYTYhA4nLWVzOAC0uoUDkBvluxmqzt3yyAgAACy4CAAARSgA==
Date: Wed, 13 Apr 2022 14:13:41 +0000
Message-ID: <578D3D3C-AF6F-467E-9A9E-269220B5CCDB@arm.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <452b42cb-56a5-3f28-989f-c02e53334447@suse.com>
 <6F9FAAD4-59FF-4D52-B08D-13E3920B3925@arm.com>
 <YlbW9dKU8MEeHlfz@Air-de-Roger>
In-Reply-To: <YlbW9dKU8MEeHlfz@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 35266d93-52c8-475b-1735-08da1d57d66e
x-ms-traffictypediagnostic:
	AS8PR08MB5943:EE_|DB5EUR03FT023:EE_|AM0PR08MB3555:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB35557DBEA62FD2C573927F089DEC9@AM0PR08MB3555.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MOWu/mSoafyYg0dg/FQaNcaVDZ4zQTVLXdwgcuco6TK07z9L7FHew2lSvaNYxCY8K8W8p0Zycu9qSPG3dgozpM7sNy5cyJTErvLKe1ucr9rg1+cvw+BbiziMp8feWZDQvg0n86v5mRkfCMuF51PeI6Oz/dt0belKckfhVERlv/3VNxGmzOXtg/W9tgGp4CTiMDoZXjOblVMtb0jEZGFm3Dwq4JQhFCjKZYKqbK3Fd0g1KpOAlPRGsVEJ7V4HTjw1R7+iggfBV4d40sjZdc+eQcBuhSJru4GVsi6YYhwR6r4tvOaToSIOMFFs/LZv78h74WaYHGvIG82/OwXEt3wtPMMddH796aZpvEaF+EzWR51fvto+4ds67IVNBkaCiZ9lt37SJOAwEiiqHOMAFH2BFeutARq+uZ1lrN6zdExzwUKrCEi3fkzsXZursp3WNYaMsYjzv4atwK5PzPOtvrFRHvJsn8PkCApriQmPhQgPoGiOUDzP+dxvRw3E92oCXb6zKDDBJnvr/E/DWQBgSf48r3g+f9pfilhphv5X7V8dY6fyUsDt7T1AUSz7g+JS9j57HvGqHSwHKrFZW+ZEF5eeJwoYdt57PykF33zaL69CqKObCobGcGVG7Ovy3ijeDPRf8XjNl1tlEOBJIzQjo2n1LZaShAh0SJNcXMpOix5Mp6rr51www68RNAzVp9hq2qQ+Cd6j3D7z2wtL+GY8Sc50k/2mnH4tocaQTvdoocQj/AK6mSI9FfEbrRKAOYuTFzlN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(6916009)(38100700002)(71200400001)(54906003)(8936002)(36756003)(86362001)(91956017)(26005)(76116006)(6512007)(2616005)(33656002)(8676002)(66476007)(4326008)(66446008)(66946007)(64756008)(66556008)(122000001)(498600001)(83380400001)(53546011)(2906002)(186003)(38070700005)(6506007)(5660300002)(7416002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2ECB331C8C3D444AEC3472022FA434D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5943
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3fd4127a-942a-4fde-41f5-08da1d57d04b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vYoafapWqvIOwwpeY7/cOANqwOy2G7oEJVZlSDeK9uDUIDS9Y/SV0JSnCpSTrCi6U99WT4kvqumA4oj0vwXZeKd+teKq/Wzyqo9S9ywh0mgRWMw0S0p/7qtknIEoDfkf5/9ntP2K8b1rDvIIH4+ZZHWygu0iQRUnROQM1ezJHomzZ1h9Wyfszfk3uwBA8wmpwuxzao+tozywensT3nUcliD1TrsitDR6n2xYzcht7EsDMujCVeUzw1EhFzthRZNZCkUT3yXoNiqKj9DPqgTXRO+1dLM5rruMisLJVxRAbG6YDCa2nLRyvaeHk9rOMKE+tAH0XMab0OEZLBWQ5ZJ8eImW/uyATiUuh77kZHvUhbSUdSKtRzD7uIYKVNSt25nsyurnqmxkhZK8rszVq3rBng9vBxFkhfe24SrEfU6MrVkzZZSm5buekP8zslzOBN1Tt3UgVkMJyGCBDTFWwrxyXuaMXD2syQn3/QcW6yIRanUqemE5oS6fPsNf2LATytaXJaupZjPCZZERlUrcGZvt5J9zyCWXK17o++nB2IxGLAxKC9NoAHTtlSFgioa6iQNF66YSe+dNHc3k3Fvxx+Rg/TB9tW+nHbPzSOfvaDn0SYQrFC9EjNdh4pX8uGSuLT7gK32UFHF0tPvaYFRVAXRAucYj+12qV1Z8n4XodADTXtxVGKJJ6lDHC0hIhE0gjt3A
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(336012)(53546011)(6486002)(8936002)(70586007)(4326008)(82310400005)(36860700001)(498600001)(26005)(33656002)(36756003)(54906003)(47076005)(186003)(40460700003)(2616005)(70206006)(8676002)(6862004)(83380400001)(6506007)(6512007)(81166007)(2906002)(5660300002)(356005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 14:13:52.3245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35266d93-52c8-475b-1735-08da1d57d66e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3555

SGksDQoNCj4gT24gMTMgQXByIDIwMjIsIGF0IDE0OjU4LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIEFwciAxMywgMjAyMiBhdCAw
MTo0ODoxNFBNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgSmFuLA0KPj4g
DQo+Pj4gT24gMTEgQXByIDIwMjIsIGF0IDEwOjQwLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IFRoZXJlJ3Mgbm8gZ29vZCByZWFzb24gdG8gdXNlIHRo
ZXNlIHdoZW4gd2UgYWxyZWFkeSBoYXZlIGEgcGNpX3NiZGZfdA0KPj4+IHR5cGUgb2JqZWN0IGF2
YWlsYWJsZS4gVGhpcyBleHRlbmRzIHRvIHRoZSB1c2Ugb2YgUENJX0JVUygpIGluDQo+Pj4gcGNp
X2VjYW1fbWFwX2J1cygpIGFzIHdlbGwuDQo+Pj4gDQo+Pj4gTm8gY2hhbmdlIHRvIGdlbmVyYXRl
ZCBjb2RlICh3aXRoIGdjYzExIGF0IGxlYXN0LCBhbmQgSSBoYXZlIHRvIGFkbWl0DQo+Pj4gdGhh
dCBJIGRpZG4ndCBleHBlY3QgY29tcGlsZXJzIHRvIG5lY2Vzc2FyaWx5IGJlIGFibGUgdG8gc3Bv
dCB0aGUNCj4+PiBvcHRpbWl6YXRpb24gcG90ZW50aWFsIG9uIHRoZSBvcmlnaW5hbCBjb2RlKS4N
Cj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+Pj4gLS0tDQo+Pj4gTm90ZSB0aGF0IHRoZSBBcm0gY2hhbmdlcyBhcmUgImJsaW5kIjogSSBo
YXZlbid0IGJlZW4gYWJsZSB0byBzcG90IGEgd2F5DQo+Pj4gdG8gYXQgbGVhc3QgY29tcGlsZSB0
ZXN0IHRoZSBjaGFuZ2VzIHRoZXJlOyB0aGUgY29kZSBsb29rcyB0byBiZQ0KPj4+IGVudGlyZWx5
IGRlYWQuDQo+Pj4gDQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3BjaS9lY2FtLmMNCj4+PiArKysg
Yi94ZW4vYXJjaC9hcm0vcGNpL2VjYW0uYw0KPj4+IEBAIC0yOCw4ICsyOCw3IEBAIHZvaWQgX19p
b21lbSAqcGNpX2VjYW1fbWFwX2J1cyhzdHJ1Y3QgcGMNCj4+PiAgICAgICAgY29udGFpbmVyX29m
KGJyaWRnZS0+b3BzLCBjb25zdCBzdHJ1Y3QgcGNpX2VjYW1fb3BzLCBwY2lfb3BzKTsNCj4+PiAg
ICB1bnNpZ25lZCBpbnQgZGV2Zm5fc2hpZnQgPSBvcHMtPmJ1c19zaGlmdCAtIDg7DQo+Pj4gICAg
dm9pZCBfX2lvbWVtICpiYXNlOw0KPj4+IC0NCj4+PiAtICAgIHVuc2lnbmVkIGludCBidXNuID0g
UENJX0JVUyhzYmRmLmJkZik7DQo+Pj4gKyAgICB1bnNpZ25lZCBpbnQgYnVzbiA9IHNiZGYuYnVz
Ow0KPj4+IA0KPj4+ICAgIGlmICggYnVzbiA8IGNmZy0+YnVzbl9zdGFydCB8fCBidXNuID4gY2Zn
LT5idXNuX2VuZCApDQo+Pj4gICAgICAgIHJldHVybiBOVUxMOw0KPj4+IEBAIC0zNyw3ICszNiw3
IEBAIHZvaWQgX19pb21lbSAqcGNpX2VjYW1fbWFwX2J1cyhzdHJ1Y3QgcGMNCj4+PiAgICBidXNu
IC09IGNmZy0+YnVzbl9zdGFydDsNCj4+PiAgICBiYXNlID0gY2ZnLT53aW4gKyAoYnVzbiA8PCBv
cHMtPmJ1c19zaGlmdCk7DQo+Pj4gDQo+Pj4gLSAgICByZXR1cm4gYmFzZSArIChQQ0lfREVWRk4y
KHNiZGYuYmRmKSA8PCBkZXZmbl9zaGlmdCkgKyB3aGVyZTsNCj4+PiArICAgIHJldHVybiBiYXNl
ICsgKHNiZGYuZGYgPDwgZGV2Zm5fc2hpZnQpICsgd2hlcmU7DQo+PiANCj4+IEkgdGhpbmsgdGhp
cyBzaG91bGQgYmUgc2JkZi5iZGYgaW5zdGVhZCAodHlwbyB5b3UgcmVtb3ZlZCB0aGUgYikuDQo+
IA0KPiBJIGRvbid0IHRoaW5rIHNvLCBub3RpY2UgUENJX0RFVkZOMihzYmRmLmJkZikgd2hpY2gg
aXMgZXh0cmFjdGluZyB0aGUNCj4gZGV2Zm4gZnJvbSBzYmRmLmJkZi4gVGhhdCdzIG5vdCBuZWVk
ZWQsIGFzIHlvdSBjYW4ganVzdCBnZXQgdGhlIGRldmZuDQo+IGRpcmVjdGx5IGZyb20gc2JkZi5k
Zi4NCj4gDQo+IE9yIGVsc2UgdGhlIG9yaWdpbmFsIGNvZGUgaXMgd3JvbmcsIGFuZCB0aGUgUENJ
X0RFVkZOMiBzaG91bGRuJ3QgYmUNCj4gdGhlcmUuDQoNClRoZXJlIGlzIG5vdCBkZiBmaWVsZCBp
biB0aGUgc2JkZiBzdHJ1Y3R1cmUgc28gaXQgc2hvdWxkIGJlIGRldmZuIGluc3RlYWQuDQoNCkNo
ZWVycw0KQmVydHJhbmQNCg0KPiANCj4gVGhhbmtzLCBSb2dlci4NCg0K

