Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312266CD91B
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 14:07:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516239.800050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUZo-0006Mz-7F; Wed, 29 Mar 2023 12:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516239.800050; Wed, 29 Mar 2023 12:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUZo-0006KU-4K; Wed, 29 Mar 2023 12:06:52 +0000
Received: by outflank-mailman (input) for mailman id 516239;
 Wed, 29 Mar 2023 12:06:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTc=7V=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1phUZm-0006K6-Pj
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 12:06:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ecff189-ce2a-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 14:06:48 +0200 (CEST)
Received: from AS9PR06CA0392.eurprd06.prod.outlook.com (2603:10a6:20b:461::32)
 by VE1PR08MB5584.eurprd08.prod.outlook.com (2603:10a6:800:1a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 12:06:37 +0000
Received: from AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::c7) by AS9PR06CA0392.outlook.office365.com
 (2603:10a6:20b:461::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.43 via Frontend
 Transport; Wed, 29 Mar 2023 12:06:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT019.mail.protection.outlook.com (100.127.140.245) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.20 via Frontend Transport; Wed, 29 Mar 2023 12:06:37 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Wed, 29 Mar 2023 12:06:36 +0000
Received: from f1e4e4e61c25.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84FD3418-9028-474E-BA13-3A1A6B4E1092.1; 
 Wed, 29 Mar 2023 12:06:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f1e4e4e61c25.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Mar 2023 12:06:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8188.eurprd08.prod.outlook.com (2603:10a6:10:3ef::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 12:06:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 12:06:24 +0000
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
X-Inumbo-ID: 2ecff189-ce2a-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toKGm4MY+gkhQ5b7dRlY1UGapjFnpTS2B+KA2nvdseg=;
 b=MS6D5rjWRG92t8bsTGKyNvYh/M4luuhSZCzvgyjyDHJP8K3kHNppJmoMyy4hIQvzW5ZdmP1uLVBBXR98Fd1sFJlPCNg0EclZBax+XLtC7zLBYVNV7zhIouPn5GTIxl6A127QD7KlC1/kD6bYqj5Bn4WSGVLX7R3DKEhhBmtCtsg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80e133b9aebda20f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmQ/t7QvudEfD7pi3/YeIqqHucsmkQbI9Jy9rn1Lv+umKfaVOwjkUwaNJvbXN/8CPvia0K4mpmlvz7jptxnLWzxtNmO8FnfPaVau8h5uEhDp/b67k/aWY1rgC3xPyzybCrwOfI1Lop3UKGvVVn9caqChTwGGulVoX8mr5kkR+BNT//ZYa5ec9M24DmsVdpQyJMZov6E/AXhBl/VPuzHt23b2JXZewCKYU/Cm/7dLBJjcVuZGgRycg9WghCD4kolcCDXQu00Qkv3iWnqj+mUNtaBC6gCfYB5X01OJjF1E5n9Xl1tsZdtEeyfEznd7oLtWoNytYHUZe9mceg6TbgEJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toKGm4MY+gkhQ5b7dRlY1UGapjFnpTS2B+KA2nvdseg=;
 b=Mw+w8sf+rNRJ4HYaMH7tZ9zrTztk7bZ6KK9OvBO1k1YjzlOuHsKlSaIXumAF+7owwBLQ01BbY64XWcDhKvS3lbePuA6jD2thjVgrRuEweU7FJsZ3XtVMdzlrwQvIxxcTiNV8Tf+XsU/EDhA+asBEwRct1kBGhlJBVdAHQe8XIIQG744MPwQ5eop174cGAlRHSsumsCo40WUEeyvwFdLzBK9ja53FhaeBokWDAAYuusdVeVXN1LN1B/noNHfMZsFU64YAfNQybMuOWWllkqmMv1+hZn294LvVDO1SeFf3k7DKD/TSHaamCZ3P9L81zvIxwDEVKDuGQm70HCDNz44ELQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toKGm4MY+gkhQ5b7dRlY1UGapjFnpTS2B+KA2nvdseg=;
 b=MS6D5rjWRG92t8bsTGKyNvYh/M4luuhSZCzvgyjyDHJP8K3kHNppJmoMyy4hIQvzW5ZdmP1uLVBBXR98Fd1sFJlPCNg0EclZBax+XLtC7zLBYVNV7zhIouPn5GTIxl6A127QD7KlC1/kD6bYqj5Bn4WSGVLX7R3DKEhhBmtCtsg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v4 07/12] xen: enable Dom0 to use SVE feature
Thread-Index: AQHZYJtnVirGlcet3UaNyqwRESxZda8P+VUAgAGzKoA=
Date: Wed, 29 Mar 2023 12:06:24 +0000
Message-ID: <B3F6542B-B6AC-47F1-A273-CC2E0F347E59@arm.com>
References: <20230327105944.1360856-1-luca.fancellu@arm.com>
 <20230327105944.1360856-8-luca.fancellu@arm.com>
 <2846794b-8057-2f41-3082-4d6c6fcd3f50@suse.com>
In-Reply-To: <2846794b-8057-2f41-3082-4d6c6fcd3f50@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8188:EE_|AM7EUR03FT019:EE_|VE1PR08MB5584:EE_
X-MS-Office365-Filtering-Correlation-Id: af7d2767-a2ee-4ff2-ddbe-08db304e0c22
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rdYIxvzpfj8AnC2kaUPV6GafT75UrywTkAxYErQ+F8OkLl0/QIkPsvz2U8kT84gnNjDK2vbJBClKVbZVPaNWC7Vbab4HIv7cTFZWTEXZt1hH7jMI5VAU8OZfTiEflvcpJ3wAbqzGHaa+yYp9kSDQaWTJr/wh7m4oti4O0g9pH+z0pDgAZIWpZap9yC/bzMhVcDP076dasuKxTd8c5mBerech1FA3/HljOmoihgEWOMa7VfcxuB6gyat6yHCGojMVxHnwoHFMIR/kmHl4KyEPJeklwMPOh7aAKkcYK3+mpv/elaBZXUxWL5izg8m+4vTgkCNcN/ahNRWi+RFH42ibAyCYl13U5tAdAlf8eCmVQ3JvNsfZIfBWAg+GXRA+oNkNHUXdN3xDS2PPBXFwNN46tt/zxCy8ZSRE+QRjwZGJshBZbHWJf8bCqnZXfaSwk/kGIsaa6H+Ry0CoNVfXtNddPYYx7rTwZvGwuU0Sd1FUjd2jwzNTmVoBsGC8q0QURqQlTy+hFrluYDGD5a9n9gcdVz830FN843slhNHrQZ58U9/SVqLR7bihd3Pxw3SbTfPXRjZj5XjKwLxztNuJ/KcY0DQ6f6j/ZcDhcRT+xZzlcUWrKEeZj4sAmnFpIHP9vyQlHgog5MGzMHNty/JQIp/GcQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(451199021)(122000001)(38100700002)(83380400001)(4744005)(2906002)(2616005)(8936002)(6486002)(86362001)(186003)(38070700005)(26005)(33656002)(76116006)(71200400001)(316002)(54906003)(41300700001)(5660300002)(4326008)(91956017)(478600001)(6916009)(6512007)(66556008)(6506007)(64756008)(66946007)(8676002)(36756003)(66476007)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <48E546EAE4ACC544B0786EB2E524274D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8188
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9719fdaa-ff8d-4dfe-18ea-08db304e04bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GOwnTt+L0MJuX2WrZk6I4PSpIuedIdC9keHN0n3um1RH0mSVE/j9UUf6p+OzuaRqwJFp6Qtl+BMg0zhynZoCGUDgQk6Rnajz70+0YpGxLQEMeL2FXoNTqJ7F0Z2EOOM1ieCo5R+V0JK0LX59Jt6nSNvVtah5tKle8cvlAbijAFw01fLSPA2PsqNxZOQRwBXSQu/T153Z7fSgeAqYR+zq+RYbA2RWG9aneqp11y9tDNm3QU6TdridCrMt42WmNxbMms04iks0Z8Ym9XLz++S6jdl500N16Oiogx+H6YzNx1+fATQ4rivPky2gBI04WZnu0Todw+8qWUQl0u2WbqwMuU9LEOp8vt2UhVcAr4wt69wOXInxl+KpvF6DrwyRKCKGBQ1OLuzOKoX5l0Ck2nTZ8LdsRQzYudXbU7ONdPtsOxXu7mFos/ChZ3IXMQf1CZLt7ajH2Wj7aVbtLXaudJlRcn9Z274S/uweIfJtOs23njnLwt/0o54sfKkv66c7wFMShSC11xG/rOlwTm8ELSXNvmYE8w+HpU3LB1YWCzaoav+zQoZJK2UaqVBmt1/U65TQYmgvxwjnFu+gXuiQ8m9AlgS/bubT7Xa295Pwif0nqjern/lbi86I5NjUQSIm6WOjLNFu8lO5JZcCDYToLV8wD7CqWBBt6WbBRVRvNeY/N18ScbPhc049ha5HRaTHwz5V1fZeAQdyIabTq7YYgX7QZg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39850400004)(396003)(451199021)(40470700004)(46966006)(36840700001)(81166007)(5660300002)(6862004)(8936002)(70206006)(356005)(47076005)(8676002)(41300700001)(82740400003)(70586007)(40460700003)(4326008)(2906002)(336012)(36756003)(82310400005)(33656002)(4744005)(2616005)(83380400001)(6486002)(40480700001)(86362001)(26005)(6506007)(6512007)(36860700001)(186003)(478600001)(316002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 12:06:37.1782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af7d2767-a2ee-4ff2-ddbe-08db304e0c22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5584

PiANCj4+IEBAIC02MSw3ICs2MiwxMiBAQCBjdXN0b21fcGFyYW0oImRvbTBfbWVtIiwgcGFyc2Vf
ZG9tMF9tZW0pOw0KPj4gDQo+PiBpbnQgX19pbml0IHBhcnNlX2FyY2hfZG9tMF9wYXJhbShjb25z
dCBjaGFyICpzdHJfYmVnaW4sIGNvbnN0IGNoYXIgKnN0cl9lbmQpDQo+PiB7DQo+PiAtICAgIHJl
dHVybiAtMTsNCj4+ICsgICAgaW50IHJjID0gMDsNCj4+ICsNCj4+ICsgICAgaWYgKCBzdmVfcGFy
c2VfZG9tMF9wYXJhbShzdHJfYmVnaW4sIHN0cl9lbmQpIDwgMCApDQo+PiArICAgICAgICByYyA9
IC1FSU5WQUw7DQo+IA0KPiAuLi4gY2FuJ3QgeW91IGNhbGwgcGFyc2VfaW50ZWdlcigpIHJpZ2h0
IGhlcmU/IG9wdF9kb20wX3N2ZSBpc24ndCBzdGF0aWMsDQo+IHNvIG91Z2h0IHRvIGJlIGFjY2Vz
c2libGUgaGVyZSAocHJvdmlkZWQgdGhlIG5lY2Vzc2FyeSBoZWFkZXIgd2FzIGluY2x1ZGVkKS4N
Cj4gDQoNCk9oIG9rIG5vdyBJ4oCZdmUgc2VlbiB3aHkgSeKAmW0gZG9pbmcgdGhpcywgYmVjYXVz
ZSBvcHNfZG9tMF9zdmUgaXMgY29tcGlsZWQgb25seQ0Kd2hlbiBDT05GSUdfQVJNNjRfU1ZFIGlz
IGVuYWJsZWQsIHNvIEnigJltIHVzaW5nIHN2ZV9wYXJzZV9kb20wX3BhcmFtKCkNCnRoYXQgcmV0
dXJucyBuZWdhdGl2ZSBpZiB0aGF0IG9wdGlvbiBpcyBub3QgZW5hYmxlZC4NCg0KT3RoZXJ3aXNl
IEkgc2hvdWxkIGRlY2xhcmUgb3BzX2RvbTBfc3ZlIGFueXdheSwgYnV0IEkgc2hvdWxkIG5vdCBh
Y2NlcHQgdXNlcg0KY3VzdG9taXphdGlvbiBvZiBpdCBpZiB0aGUgb3B0aW9uIGlzIG5vdCBlbmFi
bGVkLg0KDQpTbyBJIHRob3VnaHQgdGhlIHVzZSBvZiBzdmVfcGFyc2VfZG9tMF9wYXJhbSgpIHdh
cyB0aGUgYmVzdCB3YXkgdG8gaGFuZGxlIHRoYXQNCg0KDQoNCg==

