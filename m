Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C13C9750F38
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 19:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562714.879485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJdGg-0008D6-Cn; Wed, 12 Jul 2023 17:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562714.879485; Wed, 12 Jul 2023 17:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJdGg-0008BR-8m; Wed, 12 Jul 2023 17:04:46 +0000
Received: by outflank-mailman (input) for mailman id 562714;
 Wed, 12 Jul 2023 17:04:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlNA=C6=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1qJdGe-0008AL-Ql
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 17:04:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 327af46c-20d6-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 19:04:44 +0200 (CEST)
Received: from AS4P251CA0002.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::8)
 by AS8PR08MB7323.eurprd08.prod.outlook.com (2603:10a6:20b:442::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 17:04:41 +0000
Received: from AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d2:cafe::fc) by AS4P251CA0002.outlook.office365.com
 (2603:10a6:20b:5d2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 17:04:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT007.mail.protection.outlook.com (100.127.140.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.22 via Frontend Transport; Wed, 12 Jul 2023 17:04:40 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Wed, 12 Jul 2023 17:04:40 +0000
Received: from 34e11de95373.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8C23C3C3-A3BB-43E8-8E49-F9DD24FF6E3E.1; 
 Wed, 12 Jul 2023 17:04:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34e11de95373.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Jul 2023 17:04:34 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com (2603:10a6:20b:41f::23)
 by AS8PR08MB5991.eurprd08.prod.outlook.com (2603:10a6:20b:29f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 17:04:32 +0000
Received: from AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::a4db:63a3:ef32:ffd3]) by AM9PR08MB7165.eurprd08.prod.outlook.com
 ([fe80::a4db:63a3:ef32:ffd3%4]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 17:04:32 +0000
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
X-Inumbo-ID: 327af46c-20d6-11ee-b239-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ba6Mja8EZteepbYdAvxgOHhUTyOaOw3eVOGNs7AF7b4=;
 b=oC5BVLHyuT7zCbXBFtCphN91By3rE+6Ep4LcGr8BRq9PTYeh1EXco2B6djxbtUGTmBDGp/78wXy/W7wswhJnAr697lI0mZoF0G0cOoYHRsS2S4VhfbVNJLzQC8jtZzGp/g0MkKgG+qUWyfybxDSwvEMSP7DHAXvSMewbypd9lwo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2212b56886e5531e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=la9ICwF4F1WOKBcpxuhNLVWgY34+hlL0GXMfPxephuO+XtAUld6M3FbtQ4yAt2kOQXqcQJno9y8lovNLGRQDCPt/xpQZzopeguyJBIvXgp3yhz848AO+ncCWueH/4jzB5M3WqhCwj1IktsVlr3MkXnONhP1hbOHLTAblkQ3d9bCvmXQhbOWfzSbUU3/Kaaq1gP4IWi+eQlTm5Mw9ixu1wtck3YJ872stvVK74d+fPb4eolkBw4BLz2Lb4aiNfuT9JWU27oaepJzjXnmGh7nQcMClkdJx0yBdWKo6CqnF17A/hb0v+q1L1jMvG4ufKH/Lg1VqosvVR30ig+24ANeLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ba6Mja8EZteepbYdAvxgOHhUTyOaOw3eVOGNs7AF7b4=;
 b=XZiTZBhxvUEquZyfJR+lXEdmmF9bD2n3O287gKBW4+MfufJBilwtLhb1AqKgDnrc6wJd3J+/X/4AhlU/vK1a7NOJ9vRmWzump6kRLVeb7BnOjTxIq6G5uUYQ+9chQyVDtYfFvWbAF4P7/nrz0/9eD9Bis6c2BMaddktsCivvRvr/yB1kDuH2bnPtJmhu0ul3wYOt0tlY5c62ln2mTBbifm7xb54NPowBySanRFMyxogFegthBhaAQuXdQCOzh1qm/eKxCDrEHc4ygW03Dkvnr3f88wqT5brkAJq02gelniLt2Crd3JGkGUu2qnlvLC/3+hTHqWp4Bjwwy33M9GMlYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ba6Mja8EZteepbYdAvxgOHhUTyOaOw3eVOGNs7AF7b4=;
 b=oC5BVLHyuT7zCbXBFtCphN91By3rE+6Ep4LcGr8BRq9PTYeh1EXco2B6djxbtUGTmBDGp/78wXy/W7wswhJnAr697lI0mZoF0G0cOoYHRsS2S4VhfbVNJLzQC8jtZzGp/g0MkKgG+qUWyfybxDSwvEMSP7DHAXvSMewbypd9lwo=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] xen/arm: pci: fix check in pci_check_bar()
Thread-Topic: [PATCH v3] xen/arm: pci: fix check in pci_check_bar()
Thread-Index: AQHZtMggOVMN7Efb4EuWVUiRObIz7a+2W+KA
Date: Wed, 12 Jul 2023 17:04:32 +0000
Message-ID: <1FA588FD-8C55-4796-A75D-120D27AD5507@arm.com>
References: <20230712135226.747472-1-stewart.hildebrand@amd.com>
In-Reply-To: <20230712135226.747472-1-stewart.hildebrand@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM9PR08MB7165:EE_|AS8PR08MB5991:EE_|AM7EUR03FT007:EE_|AS8PR08MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2e1d8a-07fe-4cdc-8c18-08db82fa1507
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2gPJpp97d/oc2SGWws9rQtntyRh4hosFq4689gOePvlImMyGlBffdL98piecL4kGBgDfKg36TMC3muKc/7rzEftyfg5rGGIHYclQkJMJYVr8Az1PDk/Re2kpPyp6e6DS4Ho2Srx5Yauvh8PvTubDdA4qQmMlOHCkeCZj6qfPiltCm4buSEGy1BSejIzt+IsXLJW1Poyh/X84nVKZ/MidxzIcXBCPuaosgfnoXW8Dz62mmslv679wijFuzUyu4Y64JXx4KUmncThQZ6WkVIx3zLhsOHQYaaZMNbvrt7pkXXziY/Kj0RHjW3RAOfJS/s377UVHToGNGm3TUuWaSvcq2rzQMEK81hUiMBnfH7oQrX3VqBLa/NQ2gimsk6BEPVFibjeqpoFqHEqFqynKiwoNEHeFZNpX4n96O4ZiAeoIMs59xOLBe2H+6To5FwfsBaWufdr0R8gkRjYJ7BGzUMWALOfIP3MHOCdglcDXZKmvoFA4cuPKhbf1OBmSheWUd8ABRdUVXdhyQ5Gdl7B7FeX2T6il5z8TbOz7RNvIWRUNPs2TAuzChAcHX0AJjT6jFhIBqyRfgs0wDQ6rt+jcWGjUbW5obQVE0YE8tgVVM6GtDBJ0NDSO6yrdkVNxyHa/Qn0bES4D1wcqGYI81soWvROvJQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7165.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(66946007)(91956017)(66446008)(64756008)(66476007)(4326008)(6916009)(76116006)(66556008)(478600001)(36756003)(54906003)(86362001)(38070700005)(26005)(6506007)(53546011)(186003)(33656002)(71200400001)(6512007)(6486002)(83380400001)(38100700002)(122000001)(41300700001)(2616005)(8676002)(8936002)(316002)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ED13E6A1567724FA912D773D8E66B57@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5991
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d0f7d1cf-740e-4ebf-5d66-08db82fa0fdb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mwxWbBz7m+oXw7iIeo/1/vP5Xcgn8CvLUF6UKUYQdC1K/Zt8ljWGgNcn5rfjVfjXHb+8E5lg3NuZJtc6OcNK9xGEuTEhpMYzfbgiNvzZ/1xmxVVllTWoWgCgzOuIFL54i+F6q/J/UZAsWGRUH8oFng4uQaLTp8xekcwGxMp/3IAFC9CYebc4EoKb0di+OqZHgwEt/RDy5gOlmcEX/jF8m5NOPFu1Beo1KxIa+iwJEdlab5XjzdlaltgRRpwx8mAEofiO0+ZMPlnsBZTOu2syR1hBKYM7n+YP+O2flUh9PMfnDpSsS16x+KuTfytBgz/6UKNgpVJX5V/m42Z9KDWh12F+F2i8UTyMN+AJyzJ9un9y0G4u+rjhkWOOkPjQAqZ2vHfealSHuhQbT22TEa1tJZ2f8yj7wHtndz2Nz2ig1DaSs3DDkd/71d48kY+aRmYyRN65vZhQpil3u1LCVjfHlsHvL/Jz/FKAiVtJeVCNSV5SNeCsB3W3L6JMAkvh+BXPau0X3wP1o6ZlSp8b8TSYpjfg5n+v4zSgAbVJxFDNOMzqZgdN4RYWhErmcejHYa8weD5smD36oa5BMazR6Tv/jR9FnSDZBwD8iDuGcTWlfELKGSrIsFST+rz/5BVVeFOF+B7d1u6tU1KpBvVi/5h/SVgLD8VRWnyTFY63kZnrptPp1ojnlTGKJNL4pYJaZmGNQGhR2hktG79LHn6Yu6c6kG6bi6QXxN5XJkL3dy90w1s=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(40470700004)(46966006)(36840700001)(70206006)(4326008)(70586007)(316002)(41300700001)(2906002)(478600001)(8676002)(8936002)(5660300002)(6862004)(54906003)(36860700001)(6486002)(6512007)(40460700003)(107886003)(40480700001)(53546011)(6506007)(26005)(186003)(36756003)(83380400001)(336012)(33656002)(47076005)(356005)(82740400003)(81166007)(82310400005)(2616005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 17:04:40.8683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2e1d8a-07fe-4cdc-8c18-08db82fa1507
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7323

SGkgU3Rld2FydCwNCg0KPiBPbiAxMiBKdWwgMjAyMywgYXQgMjo1MiBwbSwgU3Rld2FydCBIaWxk
ZWJyYW5kIDxTdGV3YXJ0LkhpbGRlYnJhbmRAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBXaGVuIG1h
cHBpbmcgQkFScyBmb3IgdlBDSSwgaXQncyB2YWxpZCBmb3IgYSBCQVIgbWZuX3Qgc3RhcnQgdG8g
ZXF1YWwgdGhlIEJBUg0KPiBtZm5fdCBlbmQgKGkuZS4gc3RhcnQgPT0gZW5kKSBzaW5jZSBlbmQg
aXMgaW5jbHVzaXZlLiBIb3dldmVyLCBwY2lfY2hlY2tfYmFyKCkNCj4gY3VycmVudGx5IHJldHVy
bnMgZmFsc2UgaW4gdGhpcyBjYXNlLCB3aGljaCByZXN1bHRzIGluIFhlbiBub3QgbWFwcGluZyB0
aGUgQkFSDQo+IGluIHRoZSBndWVzdCAybmQgc3RhZ2UgcGFnZSB0YWJsZXMuIEluIHRoaXMgZXhh
bXBsZSBib290IGxvZywgTGludXggaGFzIG1hcHBlZA0KPiB0aGUgQkFScyBpbiB0aGUgMXN0IHN0
YWdlLCBidXQgc2luY2UgWGVuIGRpZCBub3QgbWFwIHRoZW0gaW4gdGhlIDJuZCBzdGFnZSwNCj4g
TGludXggZW5jb3VudGVycyBhIGRhdGEgYWJvcnQgYW5kIHBhbmljczoNCj4gDQo+IFsgICAgMi41
OTMzMDBdIHBjaSAwMDAwOjAwOjAwLjA6IEJBUiAwOiBhc3NpZ25lZCBbbWVtIDB4NTAwMDgwMDAt
MHg1MDAwOGZmZl0NCj4gWyAgICAyLjU5MzY4Ml0gcGNpIDAwMDA6MDA6MDAuMDogQkFSIDI6IGFz
c2lnbmVkIFttZW0gMHg1MDAwOTAwMC0weDUwMDA5ZmZmXQ0KPiBbICAgIDIuNTk0MDY2XSBwY2kg
MDAwMDowMDowMC4wOiBCQVIgNDogYXNzaWduZWQgW21lbSAweDUwMDBhMDAwLTB4NTAwMGFmZmZd
DQo+IC4uLg0KPiBbICAgIDIuODEwNTAyXSB2aXJ0aW8tcGNpIDAwMDA6MDA6MDAuMDogZW5hYmxp
bmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpDQo+IChYRU4pIDAwMDA6MDA6MDAuMDogbm90IG1hcHBp
bmcgQkFSIFs1MDAwOCwgNTAwMDhdIGludmFsaWQgcG9zaXRpb24NCj4gKFhFTikgMDAwMDowMDow
MC4wOiBub3QgbWFwcGluZyBCQVIgWzUwMDA5LCA1MDAwOV0gaW52YWxpZCBwb3NpdGlvbg0KPiAo
WEVOKSAwMDAwOjAwOjAwLjA6IG5vdCBtYXBwaW5nIEJBUiBbNTAwMGEsIDUwMDBhXSBpbnZhbGlk
IHBvc2l0aW9uDQo+IFsgICAgMi44MTc1MDJdIHZpcnRpby1wY2kgMDAwMDowMDowMC4wOiB2aXJ0
aW9fcGNpOiBsZWF2aW5nIGZvciBsZWdhY3kgZHJpdmVyDQo+IFsgICAgMi44MTc4NTNdIHZpcnRp
by1wY2kgMDAwMDowMDowMC4wOiBlbmFibGluZyBidXMgbWFzdGVyaW5nDQo+IChYRU4pIGFyY2gv
YXJtL3RyYXBzLmM6MTk5MjpkMHYwIEhTUj0weDAwMDAwMDkzMDEwMDQ1IHBjPTB4ZmZmZjgwMDAw
ODk1MDdkNCBndmE9MHhmZmZmODAwMDBjNDZkMDEyIGdwYT0weDAwMDAwMDUwMDA4MDEyDQo+IFsg
ICAgMi44MTgzOTddIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHR0YnIgYWRkcmVzcyBzaXplIGZh
dWx0IGF0IHZpcnR1YWwgYWRkcmVzcyBmZmZmODAwMDBjNDZkMDEyDQo+IC4uLg0KPiANCj4gQWRq
dXN0IHRoZSBlbmQgcGh5c2ljYWwgYWRkcmVzcyBlIHRvIGFjY291bnQgZm9yIHRoZSBmdWxsIHBh
Z2Ugd2hlbiBjb252ZXJ0aW5nDQo+IGZyb20gbWZuLCBhdCB3aGljaCBwb2ludCBzIGFuZCBlIGNh
bm5vdCBiZSBlcXVhbCwgc28gZHJvcCB0aGUgZXF1YWxpdHkgY2hlY2sgaW4NCj4gdGhlIGNvbmRp
dGlvbi4NCj4gDQo+IE5vdGUgdGhhdCBhZGp1c3RpbmcgZSB0byBhY2NvdW50IGZvciB0aGUgZnVs
bCBwYWdlIGFsc28gaW5jcmVhc2VzIHRoZSBhY2N1cmFjeQ0KPiBvZiB0aGUgc3Vic2VxdWVudCBp
c19iYXJfdmFsaWQgY2hlY2suDQo+IA0KPiBGaXhlczogY2M4MGUyYmFiMGQwICgieGVuL3BjaTog
cmVwbGFjZSBjYWxsIHRvIGlzX21lbW9yeV9ob2xlIHRvIHBjaV9jaGVja19iYXIiKQ0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBhbWQuY29t
Pg0KPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+
DQoNCkkgdGVzdGVkIHRoZSBwYXRjaCBvbiBOMVNEUCBib2FyZCBldmVyeXRoaW5nIHdvcmtzLg0K
DQpSZXZpZXdlZC1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQpUZXN0ZWQt
Ynk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KDQpSZWdhcmRzLA0KUmFodWw=

