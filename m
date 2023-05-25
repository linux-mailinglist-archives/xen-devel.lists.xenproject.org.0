Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FF87108A4
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 11:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539459.840351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2768-0002La-OA; Thu, 25 May 2023 09:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539459.840351; Thu, 25 May 2023 09:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2768-0002JB-Kn; Thu, 25 May 2023 09:17:28 +0000
Received: by outflank-mailman (input) for mailman id 539459;
 Thu, 25 May 2023 09:17:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmzE=BO=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q2766-0002J5-Un
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 09:17:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6901952-fadc-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 11:17:25 +0200 (CEST)
Received: from AM6P194CA0041.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::18)
 by DU0PR08MB7520.eurprd08.prod.outlook.com (2603:10a6:10:314::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Thu, 25 May
 2023 09:17:13 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::e7) by AM6P194CA0041.outlook.office365.com
 (2603:10a6:209:84::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 09:17:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16 via Frontend Transport; Thu, 25 May 2023 09:17:12 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Thu, 25 May 2023 09:17:12 +0000
Received: from a567cb62b03f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BE27AF6E-6B8A-4B04-BFF4-48EE56CA1CFB.1; 
 Thu, 25 May 2023 09:17:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a567cb62b03f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 25 May 2023 09:17:00 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB10221.eurprd08.prod.outlook.com (2603:10a6:20b:63e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 09:16:56 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Thu, 25 May 2023
 09:16:56 +0000
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
X-Inumbo-ID: f6901952-fadc-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qlAWWIBo9VfCY6P6XnrXoPSBlGsgRUrRh8W1tE9tKM=;
 b=5l9+izL4OLo8ByJ11gys4+ZenthcXPe996yvW/nxx1d2WowzJcHj9Eq9yiTlnmsyX0IUziVWKtT3h00MRoyjMloyvF7nxrb9CutlGTI3w92xmqYZP7flNvWv1510gZSAxXPjuRoh3N56mf/Q1VFDHBl2owaibhdYunU4iFkm4Cw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cee3b7b0e379f6f1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV1YfFY+SSokqfw4WpWcN3JS6qCcDahK94xlISVa46tWeEWRdUn0CCkesEYch9sLHYnMbhZ5Wo3m0ofbK6FhJvi2638SBjKfY31xR8wkuVcbZZr4GwVRWFuTB+Rv9NufUW3FLsAI1UHu7bQGt+Ckxdz0RUaOd0ifizJMSHAxCQ/e08LV8HP1LsNrJud5fVGZ/ZjWAiV2LYO8kCFAB62V5IrvPTHL18vxqtQ7tFKqsyIN+VWKJQtw2aKqwLBqFI0UzUudNBtSXEWG2RQyi8Nq4EU5VbMG+xXzcKOukt7in2nz6ZAh5hwB3scm/xnxID9hBLz+3bZapNUD3HF1zeANCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qlAWWIBo9VfCY6P6XnrXoPSBlGsgRUrRh8W1tE9tKM=;
 b=PrUqaAYjsx1tcK+nCfagTKNKdh9cfHTB+onQ9IRuBJ1sQwfYGWWYGlxz/h1xvSxxErc6JG9zpCGps35wAW9nFFcKqH6kjCjJ7lxp9TK1xB4jPnZKcKXzVwTjijBHVD5/uZPi6sWS3GZbnQ7irHwB1O7CP/PAQPwJap/oUpqXXyKXJeepC/44F843ZQVfZ3LdiDh1wsz0S5TFGBOgy/IFmOtNqt5sMlN816llCSrHx57dj2qGu7qIuQiRka2kc5c7JGvsdMq3x40b2G4GRcQL2F4+POf47tIi47wWwF8//RUCNeux1FfmmDYKh8z/fg077kHqZ9sBp7hpQXEYNrTkAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qlAWWIBo9VfCY6P6XnrXoPSBlGsgRUrRh8W1tE9tKM=;
 b=5l9+izL4OLo8ByJ11gys4+ZenthcXPe996yvW/nxx1d2WowzJcHj9Eq9yiTlnmsyX0IUziVWKtT3h00MRoyjMloyvF7nxrb9CutlGTI3w92xmqYZP7flNvWv1510gZSAxXPjuRoh3N56mf/Q1VFDHBl2owaibhdYunU4iFkm4Cw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Christian Lindig <christian.lindig@cloud.com>
Subject: Re: [PATCH v7 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Topic: [PATCH v7 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Thread-Index: AQHZjUpkSkVWSiVT2k+ILuaW20r/+q9qrj4AgAAKbYA=
Date: Thu, 25 May 2023 09:16:56 +0000
Message-ID: <2BCDFCFC-30F0-4D61-AE92-65046CDD5696@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-10-luca.fancellu@arm.com> <ZG8evxN0mF8NDTPS@mail-itl>
In-Reply-To: <ZG8evxN0mF8NDTPS@mail-itl>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB10221:EE_|AM7EUR03FT027:EE_|DU0PR08MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: e3150216-a820-4c38-c23b-08db5d00d30d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ayUnq1co47RUUKFjuaY7w8J8jNtpIF9uSdikfyIlTmyd2dPoyclQJ1wyJFxm3RadkQDosqa7C5MvfDUZ7iDkRBKE/RmcsOeFHtFN/QJq0TvF7/zgu0u2Lt+ODARIpMZoEWL3MEdMfkPYoJ2qVcrL/ToRpMA76/6CCJgxjm+nvBwaeDHkekdn4wJcXUhkHBJDR5PKVMc1XV7jP9r6W9KpKx9IcjZveZmInoU8HNrJsfS8ntY/dJOEqgBsFcBHheksjz6FPwZ+9JjlfIrq34uuz1NQSrkIMK7srg4UEdpOXFJZCtntH3wdmWYql0kQbNUkYF8aTlDbBx69ijGEYqxuWeqYkipHEZ0I+HqcPaokrc4qlzGXSQrefLbMEGYPcQgsxTRd8o6MadjRIkY/EjLvmVktsh6UHMNcXk6w2NiotTk/Rn68AYN0XQyD7AAfxmghTYICTur8ae8jVzn40kHMh+uaBz6d/vaNhHnTIqLDozQSR/A647v5lxHtvcM/cnaPRdK9SyKi/dLOBLKzhe8FD8vcUzE2WTuQVKfdT08M0Skmrb3INd/Ze1ioPUa7cKX54j5kMBN4L8k24QrhhIOESaFacdXQUkB6qD3pjjCcT5c5wAo+wxRH83ZQLd4pctCTvU2kRPIn7ZEZFaTChcEf3g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(451199021)(8936002)(8676002)(5660300002)(7416002)(66574015)(186003)(83380400001)(6506007)(6512007)(53546011)(86362001)(26005)(2616005)(122000001)(38100700002)(38070700005)(41300700001)(33656002)(6486002)(6916009)(71200400001)(66946007)(66446008)(66476007)(4326008)(64756008)(478600001)(66556008)(76116006)(316002)(91956017)(36756003)(54906003)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9113EAF7132E7349BC4CD45983F337C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10221
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	04360655-2738-4bea-2b97-08db5d00c97c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VXngi7Qs7TDwPj2SUDv4s482i/G5StRKzj6I6A+RCGhgaVtVWsCMTXwchr214PUrYGqCb5IvjiYQYKtv1P347OtXuB5tl17AqdDer2aaWnxwVbKy/QFmgadVyU0koWAA/Zkmuc4ToTjB1f5LQg5SWlKIMZ/BT4oNJ3TEnycrgZF4sQ7VnobM/DQ8c1IMFaDhi4cS+EumNVpSiwjBMa9i7I5qYn/b/wMBBltGw4Gvpt/bWgzalr8Ft3pak/R9n1osC6y4d9SNlxz5nAyy9ZGrWmw/7dJJwSrzqpFHDn7bBhQBF1h/u9pndl5eBD5lswAYn6qp93TKRXHhmRivpLwKZEz6IfCl5AXg0gs4ZpMUvcb0IekLpaNw6lVAidXi9KMp+RWQj39Qb8kcLVY8xf/QgRnY2QbMnYN1M0B2dX64D56hcW5eAmIKkAb2q00Yr7ukvC4kXyznR5Vr98uKcDYTvmBBitSe4R+b0V1NsvqBiJrtB8ZQJCYhp2z+pnnXoxVdNeKlnXmzCehiJChdx/aEMYjZ9dZd1XMk/MrZ5VMzLgm1Sm+OPHQnxxaiv/Zf5elsn94feGW+PAocSqOd69Fy2M47drECqwrVCKTidoxEt5fYldE3Z45hi+r3xax7Ru2LUZqqvyr+ki8Otz4pk0nnGAFlgy1ZXtqpqZGjWRl+wJ1/iEXSGZEW+2VnHD29hf3/s5aG/iZSz9873suwW9h3hbiN8cbNjvpImncUCvE1w1yPGj03ywZWltIkIeIztiu7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(83380400001)(40460700003)(2906002)(36756003)(82310400005)(5660300002)(6486002)(6862004)(8676002)(8936002)(66574015)(336012)(41300700001)(36860700001)(47076005)(40480700001)(356005)(6506007)(53546011)(107886003)(33656002)(82740400003)(81166007)(316002)(2616005)(4326008)(6512007)(54906003)(478600001)(186003)(70206006)(70586007)(26005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 09:17:12.4553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3150216-a820-4c38-c23b-08db5d00d30d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7520

DQoNCj4gT24gMjUgTWF5IDIwMjMsIGF0IDA5OjM5LCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOg0KPiANCj4gT24gVHVl
LCBNYXkgMjMsIDIwMjMgYXQgMDg6NDM6MjNBTSArMDEwMCwgTHVjYSBGYW5jZWxsdSB3cm90ZToN
Cj4+IE9uIEFybSwgdGhlIFNWRSB2ZWN0b3IgbGVuZ3RoIGlzIGVuY29kZWQgaW4gYXJjaF9jYXBh
YmlsaXRpZXMgZmllbGQNCj4+IG9mIHN0cnVjdCB4ZW5fc3lzY3RsX3BoeXNpbmZvLCBtYWtlIHVz
ZSBvZiB0aGlzIGZpZWxkIGluIHRoZSB0b29scw0KPj4gd2hlbiBidWlsZGluZyBmb3IgYXJtLg0K
Pj4gDQo+PiBDcmVhdGUgaGVhZGVyIGFybS1hcmNoLWNhcGFiaWxpdGllcy5oIHRvIGhhbmRsZSB0
aGUgYXJjaF9jYXBhYmlsaXRpZXMNCj4+IGZpZWxkIG9mIHBoeXNpbmZvIGZvciBBcm0uDQo+PiAN
Cj4+IFJlbW92ZWQgaW5jbHVkZSBmb3IgeGVuLXRvb2xzL2NvbW1vbi1tYWNyb3MuaCBpbg0KPj4g
cHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jIGJlY2F1c2UgaXQgaXMgYWxyZWFkeSBpbmNsdWRl
ZCBieSB0aGUNCj4+IGFybS1hcmNoLWNhcGFiaWxpdGllcy5oIGhlYWRlci4NCj4+IA0KPj4gU2ln
bmVkLW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPj4gQWNr
ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4NCj4+IEFja2Vk
LWJ5OiBDaHJpc3RpYW4gTGluZGlnIDxjaHJpc3RpYW4ubGluZGlnQGNsb3VkLmNvbT4NCj4+IFJl
dmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4NCj4+
IC0tLQ0KPj4gQ2hhbmdlcyBmcm9tIHY2Og0KPj4gLSBGaXggbGljZW5jZSBoZWFkZXIgaW4gYXJt
LWF0Y2gtY2FwYWJpbGl0aWVzLmgsIGFkZCBSLWJ5IChBbnRob255KQ0KPj4gQ2hhbmdlcyBmcm9t
IHY1Og0KPj4gLSBubyBjaGFuZ2VzDQo+PiBDaGFuZ2VzIGZyb20gdjQ6DQo+PiAtIE1vdmUgYXJt
LWFyY2gtY2FwYWJpbGl0aWVzLmggaW50byB4ZW4tdG9vbHMvLCBhZGQgTElCWExfSEFWRV8sDQo+
PiAgIGZpeGVkIHB5dGhvbiByZXR1cm4gdHlwZSB0byBJIGluc3RlYWQgb2YgaS4gKEFudGhvbnkp
DQo+PiBDaGFuZ2VzIGZyb20gdjM6DQo+PiAtIGFkZCBBY2stYnkgZm9yIHRoZSBHb2xhbmcgYml0
cyAoR2VvcmdlKQ0KPj4gLSBhZGQgQWNrLWJ5IGZvciB0aGUgT0NhbWwgdG9vbHMgKENocmlzdGlh
bikNCj4+IC0gbm93IHhlbi10b29scy9saWJzLmggaXMgbmFtZWQgeGVuLXRvb2xzL2NvbW1vbi1t
YWNyb3MuaA0KPj4gLSBjaGFuZ2VkIGNvbW1pdCBtZXNzYWdlIHRvIGV4cGxhaW4gd2h5IHRoZSBo
ZWFkZXIgbW9kaWZpY2F0aW9uDQo+PiAgIGluIHB5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0K
Pj4gQ2hhbmdlcyBmcm9tIHYyOg0KPj4gLSByZW5hbWUgYXJtX2FyY2hfY2FwYWJpbGl0aWVzLmgg
aW4gYXJtLWFyY2gtY2FwYWJpbGl0aWVzLmgsIHVzZQ0KPj4gICBNQVNLX0VYVFIuDQo+PiAtIE5v
dyBhcm0tYXJjaC1jYXBhYmlsaXRpZXMuaCBuZWVkcyBNQVNLX0VYVFIgbWFjcm8sIGJ1dCBpdCBp
cw0KPj4gICBkZWZpbmVkIGluIGxpYnhsX2ludGVybmFsLmgsIGl0IGRvZXNuJ3QgZmVlbCByaWdo
dCB0byBpbmNsdWRlDQo+PiAgIHRoYXQgaGVhZGVyIHNvIG1vdmUgTUFTS19FWFRSIGludG8geGVu
LXRvb2xzL2xpYnMuaCB0aGF0IGlzIGFsc28NCj4+ICAgaW5jbHVkZWQgaW4gbGlieGxfaW50ZXJu
YWwuaA0KPj4gQ2hhbmdlcyBmcm9tIHYxOg0KPj4gLSBub3cgU1ZFIFZMIGlzIGVuY29kZWQgaW4g
YXJjaF9jYXBhYmlsaXRpZXMgb24gQXJtDQo+PiBDaGFuZ2VzIGZyb20gUkZDOg0KPj4gLSBuZXcg
cGF0Y2gNCj4+IC0tLQ0KPj4gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2hlbHBlcnMuZ2VuLmdvICAg
ICAgICAgIHwgIDIgKysNCj4+IHRvb2xzL2dvbGFuZy94ZW5saWdodC90eXBlcy5nZW4uZ28gICAg
ICAgICAgICB8ICAxICsNCj4+IHRvb2xzL2luY2x1ZGUvbGlieGwuaCAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA2ICsrKysNCj4+IC4uLi9pbmNsdWRlL3hlbi10b29scy9hcm0tYXJjaC1jYXBh
YmlsaXRpZXMuaCB8IDI4ICsrKysrKysrKysrKysrKysrKysNCj4+IHRvb2xzL2luY2x1ZGUveGVu
LXRvb2xzL2NvbW1vbi1tYWNyb3MuaCAgICAgICB8ICAyICsrDQo+PiB0b29scy9saWJzL2xpZ2h0
L2xpYnhsLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMSArDQo+PiB0b29scy9saWJzL2xpZ2h0
L2xpYnhsX2ludGVybmFsLmggICAgICAgICAgICAgfCAgMSAtDQo+PiB0b29scy9saWJzL2xpZ2h0
L2xpYnhsX3R5cGVzLmlkbCAgICAgICAgICAgICAgfCAgMSArDQo+PiB0b29scy9vY2FtbC9saWJz
L3hjL3hlbmN0cmwubWwgICAgICAgICAgICAgICAgfCAgNCArLS0NCj4+IHRvb2xzL29jYW1sL2xp
YnMveGMveGVuY3RybC5tbGkgICAgICAgICAgICAgICB8ICA0ICstLQ0KPj4gdG9vbHMvb2NhbWwv
bGlicy94Yy94ZW5jdHJsX3N0dWJzLmMgICAgICAgICAgIHwgIDggKysrKy0tDQo+PiB0b29scy9w
eXRob24veGVuL2xvd2xldmVsL3hjL3hjLmMgICAgICAgICAgICAgfCAgOCArKysrLS0NCj4+IHRv
b2xzL3hsL3hsX2luZm8uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKw0K
Pj4gMTMgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+
PiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvaW5jbHVkZS94ZW4tdG9vbHMvYXJtLWFyY2gtY2Fw
YWJpbGl0aWVzLmgNCj4+IA0KPiANCj4gKC4uLikNCj4gDQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
cHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94
Yy94Yy5jDQo+PiBpbmRleCA5NzI4YjM0MTg1YWMuLmIzNjk5ZmRhYzU4ZSAxMDA2NDQNCj4+IC0t
LSBhL3Rvb2xzL3B5dGhvbi94ZW4vbG93bGV2ZWwveGMveGMuYw0KPj4gKysrIGIvdG9vbHMvcHl0
aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jDQo+PiBAQCAtMjIsNiArMjIsNyBAQA0KPj4gI2luY2x1
ZGUgPHhlbi9odm0vaHZtX2luZm9fdGFibGUuaD4NCj4+ICNpbmNsdWRlIDx4ZW4vaHZtL3BhcmFt
cy5oPg0KPj4gDQo+PiArI2luY2x1ZGUgPHhlbi10b29scy9hcm0tYXJjaC1jYXBhYmlsaXRpZXMu
aD4NCj4+ICNpbmNsdWRlIDx4ZW4tdG9vbHMvY29tbW9uLW1hY3Jvcy5oPg0KPj4gDQo+PiAvKiBO
ZWVkZWQgZm9yIFB5dGhvbiB2ZXJzaW9ucyBlYXJsaWVyIHRoYW4gMi4zLiAqLw0KPj4gQEAgLTg5
Nyw3ICs4OTgsNyBAQCBzdGF0aWMgUHlPYmplY3QgKnB5eGNfcGh5c2luZm8oWGNPYmplY3QgKnNl
bGYpDQo+PiAgICAgaWYgKCBwICE9IHZpcnRfY2FwcyApDQo+PiAgICAgICAqKHAtMSkgPSAnXDAn
Ow0KPj4gDQo+PiAtICAgIHJldHVybiBQeV9CdWlsZFZhbHVlKCJ7czppLHM6aSxzOmksczppLHM6
bCxzOmwsczpsLHM6aSxzOnMsczpzfSIsDQo+PiArICAgIHJldHVybiBQeV9CdWlsZFZhbHVlKCJ7
czppLHM6aSxzOmksczppLHM6bCxzOmwsczpsLHM6aSxzOnMsczpzLHM6SX0iLA0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJucl9ub2RlcyIsICAgICAgICAgcGluZm8ubnJfbm9kZXMs
DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInRocmVhZHNfcGVyX2NvcmUiLCBwaW5m
by50aHJlYWRzX3Blcl9jb3JlLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICJjb3Jl
c19wZXJfc29ja2V0IiwgcGluZm8uY29yZXNfcGVyX3NvY2tldCwNCj4+IEBAIC05MDcsNyArOTA4
LDEwIEBAIHN0YXRpYyBQeU9iamVjdCAqcHl4Y19waHlzaW5mbyhYY09iamVjdCAqc2VsZikNCj4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAic2NydWJfbWVtb3J5IiwgICAgIHBhZ2VzX3Rv
X2tpYihwaW5mby5zY3J1Yl9wYWdlcyksDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ImNwdV9raHoiLCAgICAgICAgICBwaW5mby5jcHVfa2h6LA0KPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJod19jYXBzIiwgICAgICAgICAgY3B1X2NhcCwNCj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInZpcnRfY2FwcyIsICAgICAgICB2aXJ0X2NhcHMpOw0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAidmlydF9jYXBzIiwgICAgICAgIHZpcnRfY2FwcywNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgImFybV9zdmVfdmwiLA0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGFyY2hfY2FwYWJpbGl0aWVzX2FybV9zdmUocGluZm8uYXJj
aF9jYXBhYmlsaXRpZXMpDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgKTsNCj4gDQo+IFRo
aXMgc2hvdWxkIGJlIGFkZGVkIG9ubHkgd2hlbiBidWlsZGluZyBmb3IgQVJNLCBzaW1pbGFyIGFz
IGZvciBvdGhlcg0KPiBiaW5kaW5ncy4NCg0KSGkgTWFyZWssDQoNClRoYW5rIHlvdSBmb3IgdGFr
aW5nIHRoZSB0aW1lIHRvIHJldmlldyB0aGlzLCBhcmUgeW91IG9rIGlmIEkgbWFrZSB0aGVzZSBj
aGFuZ2VzIHRvIHRoZSBjb2RlPw0KDQpkaWZmIC0tZ2l0IGEvdG9vbHMvcHl0aG9uL3hlbi9sb3ds
ZXZlbC94Yy94Yy5jIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jDQppbmRleCBi
MzY5OWZkYWM1OGUuLmM3ZjY5MDE4OTc3MCAxMDA2NDQNCi0tLSBhL3Rvb2xzL3B5dGhvbi94ZW4v
bG93bGV2ZWwveGMveGMuYw0KKysrIGIvdG9vbHMvcHl0aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5j
DQpAQCAtODcyLDYgKzg3Miw4IEBAIHN0YXRpYyBQeU9iamVjdCAqcHl4Y19waHlzaW5mbyhYY09i
amVjdCAqc2VsZikNCiAgICAgY29uc3QgY2hhciAqdmlydGNhcF9uYW1lc1tdID0geyAiaHZtIiwg
InB2IiB9Ow0KICAgICBjb25zdCB1bnNpZ25lZCB2aXJ0Y2Fwc19iaXRzW10gPSB7IFhFTl9TWVND
VExfUEhZU0NBUF9odm0sDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
WEVOX1NZU0NUTF9QSFlTQ0FQX3B2IH07DQorICAgIFB5T2JqZWN0ICpvYmpyZXQ7DQorICAgIGlu
dCByZXRjb2RlOw0KIA0KICAgICBpZiAoIHhjX3BoeXNpbmZvKHNlbGYtPnhjX2hhbmRsZSwgJnBp
bmZvKSAhPSAwICkNCiAgICAgICAgIHJldHVybiBweXhjX2Vycm9yX3RvX2V4Y2VwdGlvbihzZWxm
LT54Y19oYW5kbGUpOw0KQEAgLTg5OCwyMCArOTAwLDMxIEBAIHN0YXRpYyBQeU9iamVjdCAqcHl4
Y19waHlzaW5mbyhYY09iamVjdCAqc2VsZikNCiAgICAgaWYgKCBwICE9IHZpcnRfY2FwcyApDQog
ICAgICAgKihwLTEpID0gJ1wwJzsNCiANCi0gICAgcmV0dXJuIFB5X0J1aWxkVmFsdWUoIntzOmks
czppLHM6aSxzOmksczpsLHM6bCxzOmwsczppLHM6cyxzOnMsczpJfSIsDQotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJucl9ub2RlcyIsICAgICAgICAgcGluZm8ubnJfbm9kZXMsDQotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJ0aHJlYWRzX3Blcl9jb3JlIiwgcGluZm8udGhyZWFk
c19wZXJfY29yZSwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgImNvcmVzX3Blcl9zb2Nr
ZXQiLCBwaW5mby5jb3Jlc19wZXJfc29ja2V0LA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAibnJfY3B1cyIsICAgICAgICAgIHBpbmZvLm5yX2NwdXMsDQotICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJ0b3RhbF9tZW1vcnkiLCAgICAgcGFnZXNfdG9fa2liKHBpbmZvLnRvdGFsX3Bh
Z2VzKSwNCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgImZyZWVfbWVtb3J5IiwgICAgICBw
YWdlc190b19raWIocGluZm8uZnJlZV9wYWdlcyksDQotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJzY3J1Yl9tZW1vcnkiLCAgICAgcGFnZXNfdG9fa2liKHBpbmZvLnNjcnViX3BhZ2VzKSwN
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgImNwdV9raHoiLCAgICAgICAgICBwaW5mby5j
cHVfa2h6LA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAiaHdfY2FwcyIsICAgICAgICAg
IGNwdV9jYXAsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ2aXJ0X2NhcHMiLCAgICAg
ICAgdmlydF9jYXBzLA0KLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAiYXJtX3N2ZV92bCIs
DQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJjaF9jYXBhYmlsaXRpZXNfYXJtX3N2
ZShwaW5mby5hcmNoX2NhcGFiaWxpdGllcykNCisgICAgb2JqcmV0ID0gUHlfQnVpbGRWYWx1ZSgi
e3M6aSxzOmksczppLHM6aSxzOmwsczpsLHM6bCxzOmksczpzLHM6c30iLA0KKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJucl9ub2RlcyIsICAgICAgICAgcGluZm8ubnJfbm9kZXMsDQorICAg
ICAgICAgICAgICAgICAgICAgICAgICAgInRocmVhZHNfcGVyX2NvcmUiLCBwaW5mby50aHJlYWRz
X3Blcl9jb3JlLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJjb3Jlc19wZXJfc29ja2V0
IiwgcGluZm8uY29yZXNfcGVyX3NvY2tldCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAi
bnJfY3B1cyIsICAgICAgICAgIHBpbmZvLm5yX2NwdXMsDQorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgInRvdGFsX21lbW9yeSIsICAgICBwYWdlc190b19raWIocGluZm8udG90YWxfcGFnZXMp
LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJmcmVlX21lbW9yeSIsICAgICAgcGFnZXNf
dG9fa2liKHBpbmZvLmZyZWVfcGFnZXMpLA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJz
Y3J1Yl9tZW1vcnkiLCAgICAgcGFnZXNfdG9fa2liKHBpbmZvLnNjcnViX3BhZ2VzKSwNCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiY3B1X2toeiIsICAgICAgICAgIHBpbmZvLmNwdV9raHos
DQorICAgICAgICAgICAgICAgICAgICAgICAgICAgImh3X2NhcHMiLCAgICAgICAgICBjcHVfY2Fw
LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJ2aXJ0X2NhcHMiLCAgICAgICAgdmlydF9j
YXBzDQogICAgICAgICAgICAgICAgICAgICAgICAgKTsNCisNCisgICAgI2lmIGRlZmluZWQoX19h
YXJjaDY0X18pDQorICAgICAgICBpZiAob2JqcmV0KSB7DQorICAgICAgICAgICAgcmV0Y29kZSA9
IFB5RGljdF9TZXRJdGVtU3RyaW5nKA0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBvYmpy
ZXQsICJhcm1fc3ZlX3ZsIiwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXJjaF9jYXBh
YmlsaXRpZXNfYXJtX3N2ZShwaW5mby5hcmNoX2NhcGFiaWxpdGllcykNCisgICAgICAgICAgICAg
ICAgICAgICAgICApOw0KKyAgICAgICAgICAgIGlmICggcmV0Y29kZSA8IDAgKQ0KKyAgICAgICAg
ICAgICAgICByZXR1cm4gTlVMTDsNCisgICAgICAgIH0NCisgICAgI2VuZGlmDQorDQorICAgIHJl
dHVybiBvYmpyZXQ7DQogfQ0KIA0KIHN0YXRpYyBQeU9iamVjdCAqcHl4Y19nZXRjcHVpbmZvKFhj
T2JqZWN0ICpzZWxmLCBQeU9iamVjdCAqYXJncywgUHlPYmplY3QgKmt3ZHMpDQoNCg0KUGxlYXNl
IG5vdGljZSB0aGF0IG5vdyB3ZSBjYW4gaGF2ZSBhIHBhdGggdGhhdCBjb3VsZCByZXR1cm4gTlVM
TCwgYXJlIHlvdSBvayBmb3INCkl0IG9yIHNob3VsZCBJIGp1c3QgaWdub3JlIHRoZSByZXR1cm4g
Y29kZSBmb3IgUHlEaWN0X1NldEl0ZW1TdHJpbmc/DQoNCkFsc28sIGRvIHlvdSB3YW50IG1lIHRv
IHByb3RlY3QgdGhlIGluY2x1ZGUgdG8gPHhlbi10b29scy9hcm0tYXJjaC1jYXBhYmlsaXRpZXMu
aD4NCndpdGggaWZkZWY/DQoNCj4gDQo+PiB9DQo+PiANCj4+IHN0YXRpYyBQeU9iamVjdCAqcHl4
Y19nZXRjcHVpbmZvKFhjT2JqZWN0ICpzZWxmLCBQeU9iamVjdCAqYXJncywgUHlPYmplY3QgKmt3
ZHMpDQo+IA0KPiAtLSANCj4gQmVzdCBSZWdhcmRzLA0KPiBNYXJlayBNYXJjenlrb3dza2ktR8Oz
cmVja2kNCj4gSW52aXNpYmxlIFRoaW5ncyBMYWINCg0K

