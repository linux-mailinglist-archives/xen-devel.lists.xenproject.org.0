Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567CD7029DC
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 12:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534689.831968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyV0j-00064J-DP; Mon, 15 May 2023 10:00:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534689.831968; Mon, 15 May 2023 10:00:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyV0j-00062N-9u; Mon, 15 May 2023 10:00:57 +0000
Received: by outflank-mailman (input) for mailman id 534689;
 Mon, 15 May 2023 10:00:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+TBY=BE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pyV0i-00062H-FS
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 10:00:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 609923a1-f307-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 12:00:53 +0200 (CEST)
Received: from AM0PR02CA0025.eurprd02.prod.outlook.com (2603:10a6:208:3e::38)
 by GV2PR08MB8317.eurprd08.prod.outlook.com (2603:10a6:150:bf::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Mon, 15 May
 2023 10:00:46 +0000
Received: from AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:3e:cafe::92) by AM0PR02CA0025.outlook.office365.com
 (2603:10a6:208:3e::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 10:00:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT024.mail.protection.outlook.com (100.127.140.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 10:00:45 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Mon, 15 May 2023 10:00:45 +0000
Received: from 4406fc9b615e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8423407F-DEF3-456B-B1C7-5BF678BDBAE1.1; 
 Mon, 15 May 2023 10:00:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4406fc9b615e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 May 2023 10:00:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAWPR08MB9567.eurprd08.prod.outlook.com (2603:10a6:102:2f1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 10:00:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%6]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 10:00:31 +0000
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
X-Inumbo-ID: 609923a1-f307-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOCxGocHzqSl3jRwKGH2m9GJtBz/aP0wlosl588qSHg=;
 b=gbqVFc/r4q+8AhlOPMP4uvyAKZlZ6bkvJLqOu99DStwVOd4rtMtd369SxE+nQIldM4L4VD4VrPFYixMOr3oL7hV00m08EaMXN9nRYGaeEjD5EY8PXKgoOU4Ua28XeALtSBpS6iUE/Ttjj6haLSEWzink8Ut7cHPJnEqKYVLy73c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 88c9a61ed72b391c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9UHPmsilqi6k7uHaP/1LvNHOToWLgbHqakcNaRpDaFa43DdU7uw+VFNy0Ly0WseFbCsw3lk2j5k/Axd3fR5gdL+NLuIaVxh49mwSZtso/w38js2QXP3RKF5ayABBuyzAd2nx8jGLV1+vORZ5ePVtJiNaUpz2oKhqWXn3EbiqbGixxMIDLBNqUqfpj7FFm+iWktNh5u0/s3n+1rNgWqLrFpgb0q3h6Q1zhvaQ0GlkDc+MlK4wOnSoAsjdJ9VhaiHyevHLnpFMAZBIqTA1FHdt69hlCa8kchr7TF+3CN3i5QJLGGT5I17hclAyXy5v+Or6WzC/4DOL69//vySk4ppIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOCxGocHzqSl3jRwKGH2m9GJtBz/aP0wlosl588qSHg=;
 b=IBuSF4qINyA8PnDyJqp3+Jv73E9J7lYUNGjZ+IlbyAwFlqO6ne+UuqGEqYhLio68f+lR91ZAre4+EtJRMrPEw/motkdw8HwdDkhSGm9xSQu/i4UnzV0W1zRix++aXv3vkXGGnUqAT3W/MbJi1Qgiy/ir1u24LK7uSo0tnTziHYFyZDz9p7BvPwTQvhoiKam//icVjVMkZjawlPXXwU96KQ8N1YhD9oV0IVo0ZdEkjVW+bIzjYIb3OwCQP/ZGtfEJ/I+KM9dGAn8lRoLa9JPaCxi/18hTc5VNUlVYE+GgT7AKbHr25ABYPCJzmnYcQddM32FWhd5Yx7LRasbSnEsPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOCxGocHzqSl3jRwKGH2m9GJtBz/aP0wlosl588qSHg=;
 b=gbqVFc/r4q+8AhlOPMP4uvyAKZlZ6bkvJLqOu99DStwVOd4rtMtd369SxE+nQIldM4L4VD4VrPFYixMOr3oL7hV00m08EaMXN9nRYGaeEjD5EY8PXKgoOU4Ua28XeALtSBpS6iUE/Ttjj6haLSEWzink8Ut7cHPJnEqKYVLy73c=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "julien@xen.org" <julien@xen.org>, Stefano
 Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: adds Mandatory rules
Thread-Topic: [PATCH] docs/misra: adds Mandatory rules
Thread-Index: AQHZhF+KuQT3lWH1wk6jaT1DLTQ+Ka9bH12A
Date: Mon, 15 May 2023 10:00:31 +0000
Message-ID: <BA0A6A76-EF0C-4D2F-B520-084758461CA7@arm.com>
References: <20230511232237.3720769-1-sstabellini@kernel.org>
In-Reply-To: <20230511232237.3720769-1-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAWPR08MB9567:EE_|AM7EUR03FT024:EE_|GV2PR08MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d883978-6d48-4fe4-d176-08db552b4083
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EqmWKbLQTQNV7szP2cFIaN9fpyJ9FSBF7mpR7Pp30lKp7IJUa5ywYKi2pAeB1j68/wVWXCPv9S5PGiSukSS8kKVNHJuGQDplfggzL5QUhpaFQpq9cH5SuGexHy2X7jcD+Ge7+V3sxdv4fEAfQhJdFSwMZZHG8VbNSu7A20O6kMGn7CC0FPv4nmWuQgXPIjMDP/W9VkCp3k91uPKHFEPcbekcz9DapclSWsj+QqJlHEvtL0JFUjlDAxPPhvzwIkctH3zF6/hNlMwDM03KwCHs62hLsvXG+xg4cIXtJjfEfvm4VIvoSUKsIkdzKdP0pzjYqFyrbD6zDgBFpuDWLUoV6AKDqUvvWah4KJthNvmMc6chOufkrgQ91ZyR/hOq2J57/hnJW8xvuBLQvrk54s86Me7cP/Qjxqh2EGmEfBjFMjugI5U/XEsdoIe+kZiKZHvcNh3SDQfUIh3VTWtsqmmtpYqWghZ1ryh8kJTFgZLZPufy11nZ6KFpOjqF5g4jved77jcsuQoPhdZqsJdowP/rcKHA1nmgYEgmNdjwTQYmKIjBK5YgcjdMDNV+NcsALxQeFDlYTR7u9n0ow0fmekooSbjJaxb+cL5WDqKbof3ilDl6l6SSaw2pg4BKnpLCHbfZH7+FjYcfa8No62tVIjWByQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199021)(4744005)(38070700005)(2906002)(38100700002)(316002)(41300700001)(122000001)(5660300002)(8936002)(8676002)(36756003)(33656002)(86362001)(71200400001)(478600001)(53546011)(26005)(6512007)(6506007)(186003)(6486002)(2616005)(76116006)(66946007)(91956017)(66476007)(66556008)(54906003)(66446008)(64756008)(6916009)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E253218CF4B1EF4AAEDB0E0730BB430B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9567
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b1241c1-c35b-493c-1e5d-08db552b37db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cHOHr61qBv17TgP1TAAYkoHJTmKXNrru9dbnHosXhUpUq0+DqYlbvxrE/pRdMGikKGMou45tu/MKUMo+l1obpx94aStxP93PumcXSj06UaCbdXrG3/Orw1nGrmqxIoySvquhatDULamStqNUszuxIQlxi3kpWejBNFG+JsqDEgNB5ghc6QKVDtGR5QOjTZteQqTXuTQTvz4/3rGiqC6j1pmHLueT8F1csaidjtx7nuFtqK6COaqPimiAo32xoYdjCsDzzrBQHz0Zv1YPqUcoguQrI2J5sgEoKddZ6+JYuHJNQFswid40zHkVZCP5ddIlvtgJboffpGoW5jlXKfCRVYsxM7rbLCkCqfKOE12r+oJF+tT25hU3MlDnEzmhSm7mbLBd2FNzknTF2rF7/Ukr76Dt0cqGfTLEqCoBWM1DqC1l1NWK8h2bRHHyr+T99i72dj2E+3c/0t+aGfQ1lptu7dCfSzltV7cd52U98+o7LsLTWbrMdTOQ/rJlcZgt568h4mfM9vmtPO1ri+IvHDgHZ9OZ5BUJtgzHcULkm3wVEyu+mH+hUPP2cX63GyNeKOV9KCumbWZ87A+sD3K1cRafK2yjXoW0gM21TJ1fYvrEk0HJTDcRKIdDQqPoo6lpQ1GgIT2vjRvoO3oiKmBLlwKtY5xvlARJZxdYiLX9k3E/3sLJYfTjD9DhAZsVfrv8Mw1RuQMeJNstFn6yKIVsE7eQN5oyfn6+xwapYtmin8e3sJc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(336012)(47076005)(36860700001)(70206006)(70586007)(2616005)(6486002)(26005)(6506007)(53546011)(40480700001)(478600001)(54906003)(186003)(5660300002)(86362001)(6862004)(8676002)(33656002)(40460700003)(6512007)(4744005)(8936002)(36756003)(2906002)(4326008)(316002)(41300700001)(82740400003)(356005)(81166007)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 10:00:45.6767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d883978-6d48-4fe4-d176-08db552b4083
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8317

DQoNCj4gT24gMTIgTWF5IDIwMjMsIGF0IDAwOjIyLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gDQo+IEFkZCB0aGUgTWFuZGF0b3J5IHJ1
bGVzIGFncmVlZCBieSB0aGUgTUlTUkEgQyB3b3JraW5nIGdyb3VwIHRvDQo+IGRvY3MvbWlzcmEv
cnVsZXMucnN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVm
YW5vLnN0YWJlbGxpbmlAYW1kLmNvbT4NCj4gLS0tDQoNCkhpIFN0ZWZhbm8sDQoNCknigJl2ZSB0
cmllZCB0aGlzIHBhdGNoIHdpdGggb3VyIGludGVncmF0aW9uIHRvb2wgeGVuLWFuYWx5c2lzLnB5
IGFuZCBpdCB3b3JrcywgSeKAmXZlIGJlZW4NCmFibGUgdG8gc3VjY2Vzc2Z1bGx5IHByb2R1Y2Ug
Y3BwY2hlY2sgcmVwb3J0cy4NCg0KSeKAmXZlIGNoZWNrZWQgbGlua3MgYW5kIHJ1bGUgdGV4dCBh
Z2FpbnN0IHRoZSBtaXNyYSBDIGRvY3MsIGV2ZXJ5dGhpbmcgbG9va3MgZmluZS4NCg0KUmV2aWV3
ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NClRlc3RlZC1ieTog
THVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQoNCg==

