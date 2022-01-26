Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2C449CB00
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 14:38:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260904.451154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCiUu-0006m0-VE; Wed, 26 Jan 2022 13:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260904.451154; Wed, 26 Jan 2022 13:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCiUu-0006hr-RE; Wed, 26 Jan 2022 13:38:04 +0000
Received: by outflank-mailman (input) for mailman id 260904;
 Wed, 26 Jan 2022 13:38:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG2W=SK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nCiUt-0006fq-9O
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 13:38:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d922ef4-7ead-11ec-8f75-fffcc8bd4f1a;
 Wed, 26 Jan 2022 14:38:01 +0100 (CET)
Received: from AS8P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::13)
 by VE1PR08MB5598.eurprd08.prod.outlook.com (2603:10a6:800:1a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 13:37:57 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::d3) by AS8P251CA0014.outlook.office365.com
 (2603:10a6:20b:2f2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Wed, 26 Jan 2022 13:37:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Wed, 26 Jan 2022 13:37:56 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 26 Jan 2022 13:37:56 +0000
Received: from 00454ee6f302.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 579C2ECF-CFD6-4423-AA93-05B04F2E0E6B.1; 
 Wed, 26 Jan 2022 13:37:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 00454ee6f302.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Jan 2022 13:37:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB2847.eurprd08.prod.outlook.com (2603:10a6:802:19::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 13:37:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c0c1:d43a:acf3:a59d%4]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 13:37:42 +0000
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
X-Inumbo-ID: 2d922ef4-7ead-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFlOgox0i5iRfb4O+T7JoKaY3gplYpM95LpShp58Bm8=;
 b=FTOOrtZIwpPfgn6MxUfgDDmC+RTPL1ypm4ytvr1s9towIxEBQXYWhZcZFZyF8j8KYZMnboSGEq3ZK9tifnBAy5wlFlI/wuTSY6qyM7sba8/2543HD2TaQZQDEFYSuwondFJzxaAxopXNYDL53/+AjHIvFN0WVNbLWEur87mrGgg=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: a56a9a183ea3aa6f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+OJyO2rZMUhybtxfBAFqxfeK6iX9ELLfnRJtIfMkn9HrV9uQ4/VRkmGG6n+I9iDr4FKGIdHveG2hOyfBi5TILFksBwvq86bSvlMR9+RVVhM+qIoF0JvHftAxw138sldPAgynduDhKMX788Rf/gDCno9F+6WtU/MsNsNTW08cQrM/TQ2fi+MS5nlwXv+YW/4+HfFSTK2DIBmlJDnBTVWGWDo/ieVT4UERC++suTJ/fgs+TycwViSK8jJk355P7wBOFm2Ibxxymo48HgByFk6yJT0JqM6IgSexxERWeHdYARfYl2wjJAmGsMSIDzOCgZKKj/9O9GuZ6TMVElijqLucQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFlOgox0i5iRfb4O+T7JoKaY3gplYpM95LpShp58Bm8=;
 b=gJa9HcIO2x3rz7r6PZ5iBs/Sb5VAQTxC/JgWb3fOAlCw/5Ez5P5KEZYnxL2fY6U1kL94BEsb9iPOpSHLepMhYjoKvgSAFLbOkqDdP9DxGx9HyOnzc5H0RGmWauT/56fn6qjvjrLqZnOUE6kVulME9fO+vuFEninGWKM3dkGxb1OUDbzJqnX7EL4cnLV9AszhfHfwP+fww02xqqJiLfhwlkMeZ0S4mcdPyYgUsY4ranLs8zPyRS2nrGuEsU6UuaEXzPXOMkVQIf8QBPBz2ZZVx/JFMIhFMIlxJWmuEV6ZlswC8BSBSxgdcO59ANPrffjMMJ83K1fZuG6xqmjbHSkPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFlOgox0i5iRfb4O+T7JoKaY3gplYpM95LpShp58Bm8=;
 b=FTOOrtZIwpPfgn6MxUfgDDmC+RTPL1ypm4ytvr1s9towIxEBQXYWhZcZFZyF8j8KYZMnboSGEq3ZK9tifnBAy5wlFlI/wuTSY6qyM7sba8/2543HD2TaQZQDEFYSuwondFJzxaAxopXNYDL53/+AjHIvFN0WVNbLWEur87mrGgg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH] design: design doc for shared memory on a dom0less system
Thread-Topic: [PATCH] design: design doc for shared memory on a dom0less
 system
Thread-Index: AQHYEpzfSIEi7U4qpUyQXv3OoTZGLKx1IfuAgAAEr4CAAAXhgIAAIgOA
Date: Wed, 26 Jan 2022 13:37:42 +0000
Message-ID: <588706C5-09FC-48B3-A005-9DCC33D40DCD@arm.com>
References: <20220126100943.4086208-1-penny.zheng@arm.com>
 <c820b027-1b23-a762-ca91-7a2f0a46f423@xen.org>
 <2C44219B-A661-481E-851B-B2DF07ED6F84@arm.com>
 <a50d9fde-1d06-7cda-2779-9eea9e1c0134@xen.org>
In-Reply-To: <a50d9fde-1d06-7cda-2779-9eea9e1c0134@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b85e5685-31c1-4e00-cbda-08d9e0d10f98
x-ms-traffictypediagnostic:
	VI1PR08MB2847:EE_|AM5EUR03FT019:EE_|VE1PR08MB5598:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5598FC90905E785E4CE196889D209@VE1PR08MB5598.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 luukLrdjZMy2OuT+KZLa+zrlgKwR5jWjU7gI/i5ITL3bfk3RLdV26y7sEwMmgI4kmxotnPsJ3zJb2vjiULlbJK+IsN92xln8+b/393Fi18pKLiVeuvHu/Es46eQVRcT9DeJ0O6BHwcpszpljZ7CsLEMY+5fSqLBFb2nb5s5L51L5TepTtmg2D7mznFoRK3en4xYcxIJ10woNXiwHX7iANx63IuMs6GUYYoqER0KSXg5IIiFGDdXjpHwo3y6Julh7/kbIJVALAdQZXtHdkxOPiqRY9S/8AWiJQCOIFcGgF7/rvp65K0CAvnX6SGHcqiDZXdF7z7Bl3T3cLwrqlhbRwZ1xLtbOfxCWJr4grDDkLrdbQZpjxF5OmRb33nSj5lxsAfgK8FrozTb2LK+1jOdgfFQB2Z5BXXh7ZLi1hMKX6PuSS+OJJghQEx5ckaZGS8lG7I9qSFj1/rjn7BT1Kb/jb68S47JyeBM+r7mRhWgwF42AIhBaB3Xr1aq+IWnmkoafoZOYrKP03LVOw7UpBTc5hnz2Fpyvx/YqVEJTe31Gk8I3nLdhvzwS9DbckNi9RrBVNUIqATe/hWf0d72A45sqzsdjuhGf6I325uELCzWAiobrgYA3WCHmRu+WyHYvFxvhdyeG1t7yuNf26x1b72PRcleZwVlKEyB+JLm8iKEmidXVhTw0q978bp5EatBImJYU0cH2roRXeKD40QTuTKc6zJ9Z3Z6PAfeyHUuB0SjagMEb2gOkYbywW9H6V4/a4pcA+VKAuxmGe8NmMkFZ01eqfQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(66476007)(66446008)(64756008)(38070700005)(83380400001)(4326008)(8936002)(8676002)(26005)(54906003)(6916009)(33656002)(122000001)(86362001)(38100700002)(186003)(36756003)(2616005)(6486002)(53546011)(76116006)(2906002)(66946007)(6512007)(66556008)(91956017)(6506007)(508600001)(71200400001)(5660300002)(32563001)(45980500001)(20210929001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <76ADFB8F8B8DF947AC118DC9C106E7B9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2847
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c228d19d-4bc2-42d3-eb78-08d9e0d1071d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DjaQFIrihs6JsixsosAmiZcmWl9LF9g20TsBPSWUILUeNWPotGImG6D44FiKYpGTiupM5u8g7hqIBGbGZtd2poodre9UlRdmVRut7g3GgpdpHEwW1EqhKQeePA7QR4EHMjMHzIA7wbuTVmiDsfh6MY+g8PvGBhsmDECCfclkqyXidCp7pfK8Y/FkeFwp0S83vB9aSBRq7i+DjMzLqZ3NLdTa57Bqtj59EVZIdQ9vsxFq4nJ3ybHIy8ZAEZmPLu2AOIUVsfeIlwxlaeo6kP49Q11VzLjGNqcX/l0LgEN4KD7ep05rhNu1KuBA7fLrHTdLBdLUu1VE6bNkkhRuHFe5H7LY11O950K+aXItoJ78xlkxYVvfVgktOb0p1DLmwNwteasNQCE79hTaB1ztUT1nERNJtUkzio0nMDzOD0cIHdqwH64J+Ix6k9LrPgIxIqiASAWO5j87v170e8lcfjHnQCw2gRp8ordE6ZmOFq9wnONwsXyXXTtN5st5M7nSq+TmkhsXKMcXl0bSnZk1XQ0fg80OXP8/mCHesacyZevlFH2T6CXp8yqSHtqjQWvvP8aG2XbAKbRWQlfwN3nZOO59DVXheHTBhyv0hIIObTeOydLbQnDEtSKV8O1aaRykVdIPSNqt50wS7u7iihnWTzR2DlHjovEGn7EtzgYeiDbdFzh1oHoQz26A2u2MCflqORJ1NtdVwuJA5VNSYAXSwBGTZHYkmK2rP5SaONYCtp5abOhIdkgnl4mC28OVb1qij1ry1sRZxAK8i3fxwF5rU7abnnHFm26RD1Xx9DJG/6rMaVKSICh2WhF861lzRUCdjsxU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(40470700004)(36860700001)(70586007)(36756003)(82310400004)(63350400001)(186003)(63370400001)(6512007)(81166007)(47076005)(2616005)(6486002)(8936002)(5660300002)(6862004)(54906003)(508600001)(70206006)(8676002)(336012)(316002)(2906002)(53546011)(33656002)(86362001)(6506007)(356005)(26005)(4326008)(83380400001)(40460700003)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 13:37:56.3469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b85e5685-31c1-4e00-cbda-08d9e0d10f98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5598

SGkgSnVsaWVuLA0KDQo+IE9uIDI2IEphbiAyMDIyLCBhdCAxMTozNSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+IE9uIDI2LzAx
LzIwMjIgMTE6MTQsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+Pj4gT24gMjYgSmFuIDIwMjIs
IGF0IDEwOjU4LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+
PiBIaSwNCj4+PiANCj4+PiBPbiAyNi8wMS8yMDIyIDEwOjA5LCBQZW5ueSBaaGVuZyB3cm90ZToN
Cj4+Pj4gVGhpcyBjb21taXQgcHJvdmlkZXMgYSBkZXNpZ24gZG9jIGZvciBzdGF0aWMgc2hhcmVk
IG1lbW9yeQ0KPj4+PiBvbiBhIGRvbTBsZXNzIHN5c3RlbS4NCj4+Pj4gU2lnbmVkLW9mZi1ieTog
UGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgZGVzaWdu
L3NobS1kb20wbGVzcy5tZCB8IDE4MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPj4+PiAgMSBmaWxlIGNoYW5nZWQsIDE4MiBpbnNlcnRpb25zKCspDQo+Pj4+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgZGVzaWduL3NobS1kb20wbGVzcy5tZA0KPj4+PiBkaWZmIC0tZ2l0
IGEvZGVzaWduL3NobS1kb20wbGVzcy5tZCBiL2Rlc2lnbi9zaG0tZG9tMGxlc3MubWQNCj4+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4gaW5kZXggMDAwMDAwMC4uYjQ2MTk5ZA0KPj4+PiAt
LS0gL2Rldi9udWxsDQo+Pj4+ICsrKyBiL2Rlc2lnbi9zaG0tZG9tMGxlc3MubWQNCj4+Pj4gQEAg
LTAsMCArMSwxODIgQEANCj4+Pj4gKyMgU3RhdGljIFNoYXJlZCBNZW1vcnkgYmV0d2VlbiBkb21h
aW5zIG9uIGEgZG9tMGxlc3Mgc3lzdGVtDQo+Pj4+ICsNCj4+Pj4gK1RoaXMgZGVzaWduIGFpbXMg
dG8gcHJvdmlkZSBhbiBvdmVydmlldyBvZiB0aGUgbmV3IGZlYXR1cmU6IHNldHRpbmcgdXAgc3Rh
dGljDQo+Pj4+ICtzaGFyZWQgbWVtb3J5IGJldHdlZW4gZG9tYWlucyBvbiBhIGRvbTBsZXNzIHN5
c3RlbSwgdGhyb3VnaCBkZXZpY2UgdHJlZQ0KPj4+PiArY29uZmlndXJhdGlvbi4NCj4+Pj4gKw0K
Pj4+PiArVGhlIG5ldyBmZWF0dXJlIGlzIGRyaXZlbiBieSB0aGUgbmVlZCBvZiBmaW5kaW5nIGEg
d2F5IHRvIGJ1aWxkIHVwDQo+Pj4+ICtjb21tdW5pY2F0aW9uIGNoYW5uZWxzIG9uIGRvbTBsZXNz
IHN5c3RlbSwgc2luY2UgdGhlIGxlZ2FjeSB3YXlzIGluY2x1ZGluZw0KPj4+PiArZ3JhbnQgdGFi
bGUsIGV0YyBhcmUgYWxsIGFic2VudCB0aGVyZS4NCj4+PiANCj4+PiBTdGVmYW5vIGhhcyBhIHNl
cmllcyB0byBhZGQgc3VwcG9ydCBmb3IgZ3JhbnQtdGFibGUgWzJdLiBTbyBJIHRoaW5rIHlvdSB3
YW50IHRvIGp1c3RpZnkgaXQgZGlmZmVyZW50bHkuDQo+Pj4gDQo+Pj4+ICsNCj4+Pj4gK0l0IHdh
cyBpbnNwaXJlZCBieSB0aGUgcGF0Y2ggc2VyaWUgb2YgInhsL2xpYnhsLWJhc2VkIHNoYXJlZCBt
ZW1vcnkiLCBzZWUNCj4+Pj4gK1sxXSBmb3IgbW9yZSBkZXRhaWxzLg0KPj4+PiArDQo+Pj4+ICsj
IFN0YXRpYyBTaGFyZWQgTWVtb3J5IERldmljZSBUcmVlIENvbmZpZ3VyYXRpb24NCj4+Pj4gKw0K
Pj4+PiArVGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGRldmljZSB0cmVlIG5vZGVzIGFsbG93IHVz
ZXJzIHRvIHN0YXRpY2FsbHkgc2V0IHVwDQo+Pj4+ICtzaGFyZWQgbWVtb3J5IGFtb25nIGEgZ3Jv
dXAgb2YgZG9tMGxlc3MgRG9tVXMgYW5kIERvbTAsIGVuYWJsaW5nIGRvbWFpbnMNCj4+Pj4gK3Rv
IGRvIHNobS1iYXNlZCBjb21tdW5pY2F0aW9uLg0KPj4+PiArDQo+Pj4+ICstIGNvbXBhdGlibGUN
Cj4+Pj4gKw0KPj4+PiArICAgICJ4ZW4sZG9tYWluLXNoYXJlZC1tZW1vcnktdjEiDQo+Pj4+ICsN
Cj4+Pj4gKy0geGVuLHNobS1pZA0KPj4+IA0KPj4+IEZyb20gdGhlIGRvY3VtZW50LCBpdCBpcyBu
b3QgY2xlYXIgdG8gbWUgd2hhdCBpcyB0aGUgcHVycG9zZSBvZiB0aGUgaWRlbnRpZmllci4gQ291
bGQgeW91IGNsYXJpZnkgaXQ/DQo+Pj4gDQo+Pj4+ICsNCj4+Pj4gKyAgICBBbiB1MzIgdmFsdWUg
cmVwcmVzZW50cyB0aGUgdW5pcXVlIGlkZW50aWZpZXIgb2YgdGhlIHNoYXJlZCBtZW1vcnkgcmVn
aW9uLg0KPj4+PiArICAgIFVzZXIgdmFsdWluZyBwZXIgc2hhcmVkIG1lbW9yeSByZWdpb24gc2hh
bGwgZm9sbG93IHRoZSBhc2NlbmRpbmcgb3JkZXIsDQo+Pj4+ICsgICAgc3RhcnRpbmcgZnJvbSB4
ZW4sc2htLWlkID0gPDB4MD4sIHRvIHRoZSBtYXhpbXVtIGlkZW50aWZpZXINCj4+Pj4gKyAgICB4
ZW4sc2htLWlkID0gPDB4MTI2Pi4NCj4+PiANCj4+PiBXaHkgaXMgaXQgbGltaXQgdG8gMHgxMjY/
IEFuZCBhbHNvLCB3aHkgZG8gdGhleSBoYXZlIHRvIGJlIGFsbG9jYXRlZCBpbiBhc2NlbmRpbmcg
b3JkZXI/DQo+Pj4gDQo+Pj4+IFRoZSBzcGVjaWFsIHhlbixzaG0taWQgPSA8MHgxMjc+IGlzIHJl
c2VydmVkIGZvcg0KPj4+PiArICAgIElOVkFMSURfU0hNSUQuDQo+Pj4gDQo+Pj4gV2h5IGRvIHdl
IG5lZWQgdG8gcmVzZXJ2ZSBpbnZhbGlkPw0KPj4+IA0KPj4+PiArDQo+Pj4+ICstIHhlbixzaGFy
ZWQtbWVtDQo+Pj4+ICsNCj4+Pj4gKyAgICBBbiBhcnJheSB0YWtlcyBhIHBoeXNpY2FsIGFkZHJl
c3MsIHdoaWNoIGlzIHRoZSBiYXNlIGFkZHJlc3Mgb2YgdGhlDQo+Pj4+ICsgICAgc2hhcmVkIG1l
bW9yeSByZWdpb24gaW4gaG9zdCBwaHlzaWNhbCBhZGRyZXNzIHNwYWNlLCBhIHNpemUsIGFuZCBh
IGd1ZXN0DQo+Pj4+ICsgICAgcGh5c2ljYWwgYWRkcmVzcywgYXMgdGhlIHRhcmdldCBhZGRyZXNz
IG9mIHRoZSBtYXBwaW5nLg0KPj4+IA0KPj4+IEkgdGhpbmsgc2hhcmVkIG1lbW9yeSBpcyB1c2Vm
dWwgd2l0aG91dCBzdGF0aWMgYWxsb2NhdGlvbi4gU28gSSB0aGluayB3ZSB3YW50IHRvIG1ha2Ug
dGhlIGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBvcHRpb25hbC4NCj4+PiANCj4+Pj4gKw0KPj4+PiAr
LSByb2xlKE9wdGlvbmFsKQ0KPj4+PiArDQo+Pj4+ICsgICAgQSBzdHJpbmcgcHJvcGVydHkgc3Bl
Y2lmeWluZyB0aGUgb3duZXJzaGlwIG9mIGEgc2hhcmVkIG1lbW9yeSByZWdpb24sDQo+Pj4+ICsg
ICAgdGhlIHZhbHVlIG11c3QgYmUgb25lIG9mIHRoZSBmb2xsb3dpbmc6ICJvd25lciIsIG9yICJi
b3Jyb3dlciINCj4+Pj4gKyAgICBBIHNoYXJlZCBtZW1vcnkgcmVnaW9uIGNvdWxkIGJlIGV4cGxp
Y2l0bHkgYmFja2VkIGJ5IG9uZSBkb21haW4sIHdoaWNoIGlzDQo+Pj4+ICsgICAgY2FsbGVkICJv
d25lciBkb21haW4iLCBhbmQgYWxsIHRoZSBvdGhlciBkb21haW5zIHdobyBhcmUgYWxzbyBzaGFy
aW5nDQo+Pj4+ICsgICAgdGhpcyByZWdpb24gYXJlIGNhbGxlZCAiYm9ycm93ZXIgZG9tYWluIi4N
Cj4+Pj4gKyAgICBJZiBub3Qgc3BlY2lmaWVkLCB0aGUgZGVmYXVsdCB2YWx1ZSBpcyAiYm9ycm93
ZXIiIGFuZCBvd25lciBpcw0KPj4+PiArICAgICJkb21fc2hhcmVkIiwgYSBzeXN0ZW0gZG9tYWlu
Lg0KPj4+IA0KPj4+IEkgZG9uJ3QgcGFydGljdWxhcmx5IGxpa2UgYWRkaW5nIGFub3RoZXIgc3lz
dGVtIGRvbWFpbi4gSW5zdGVhZCwgaXQgd291bGQgYmUgYmV0dGVyIHRvIGFsd2F5cyBzcGVjaWZ5
IHRoZSBvd25lci4NCj4+IEhhdmluZyBhbiBvd25lciB3aGljaCBpcyBub3QgWGVuIGlzIGNyZWF0
aW5nIGEgZGVwZW5kZW5jeSBzbyByZXN0YXJ0IHRoZSBvd25lciB5b3Ugd291bGQgbmVlZCB0byBy
ZXN0YXJ0IHRoZSBib3Jyb3dlcnMuDQo+IA0KPiBZb3UgZG9uJ3QgbmVjZXNzYXJpbHkgaGF2ZSB0
by4gWW91IGNhbiBrZWVwIHRoZSAic3RydWN0IGRvbWFpbiIgYW5kIHRoZSBzaGFyZWQgcGFnZXMg
aW4gcGxhY2UgYW5kIHdpcGUgZXZlcnl0aGluZyBlbHNlLg0KDQpCdXQgeW91IG5lZWQgdG8gd2lw
ZSBldmVyeXRoaW5nLg0KDQo+IA0KPj4gVG8gcmVtb3ZlIHRoaXMgZGVwZW5kZW5jeSBhbmQgYWxs
b3cgdXNlIGNhc2VzIHdoZXJlIGFueSBkb21haW4gaGF2aW5nIGFjY2VzcyBjYW4gYmUgcmVzdGFy
dGVkIHdpdGhvdXQgdGhlIG90aGVyIHNpZGUNCj4+IG5lZWRpbmcgdG8sIGhhdmluZyBYZW4gYXMg
dGhlIG93bmVyIGlzIHJlcXVpcmVkLg0KPiANCj4+IEluaXRpYWwgZGlzY3Vzc2lvbiBzdGFydGVk
IGJldHdlZW4gUGVubnkgYW5kIFN0ZWZhbm8gd2VudCB0aGUgd2F5IHlvdSBzYWlkIGFuZCBJIGFz
a2VkIHRvIG1vZGlmeSBpdCBsaWtlIHRoaXMgdG8gaGF2ZSBzb21ldGhpbmcNCj4+IG1vcmUgbG9v
a2luZyBsaWtlIGEgc3RhbmRhcmQgc2hhcmVkIG1lbW9yeSB3aXRoIG9ubHkgdXNlcnMgYnV0IG5v
IOKAnG93bmVy4oCdLg0KPiANCj4gTXkgbWFpbiBjb25jZXJuIHdpdGggZG9tX3NoYXJlZCBpcyB0
aGUgcGVybWlzc2lvbnMuIEhvdyBkbyB5b3UgbWFrZSBzdXJlIHRoYXQgYSBnaXZlbiBwYWdlIGlz
IG9ubHkgc2hhcmVkIHdpdGggdGhlIHByb3BlciBkb21haW4/DQoNClRoYXQgaXMgYnkgY29uZmln
dXJhdGlvbiBhcyB5b3UgZGVmaW5lIHRob3NlIGFyZWEgaW4geW91ciBjb25maWcgYW5kIHNheSB3
aG8gaGFzIGFjY2VzcyB0byBpdC4NCk9yIG1heWJlIEkgbWlzdW5kZXJzdG9vZCB5b3VyIHF1ZXN0
aW9uID8NCg0KPiANCj4+IEFsc28gaXQgZml0cyB0byBzb21lIG9mIG91ciB1c2UgY2FzZXMuDQo+
IA0KPiBXb3VsZCB5b3UgbWluZCB0byBicmllZmx5IGRlc2NyaWJlIHRoZW0/DQoNClN1cmU6DQot
IG9uZSBkb21haW4gcmVhbCB0aW1lIGRvbWFpbiB3cml0aW5nIHNvbWUgbG9ncyBpbiB0aGUgc2hh
cmVkIG1lbW9yeSB0aGF0IGlzIHBvbGxlZCBhbmQgc3RvcmVkIG9uIGEgc3RvcmFnZSBieSBhbiBv
dGhlciBkb21haW4uIA0KUmVhbC10aW1lIGRvbWFpbiBtaWdodCByZWJvb3QgYW5kIHdpcGUgdGhl
IGxvZ3MgYW5kIHRoaXMgY291bGQgYmUgYWNjZXB0YWJsZSwgTGludXggbWlnaHQgcmVib290IGFu
ZCByZXN0YXJ0IHdoZXJlIGl0IGxlZnQuDQotIGxvY2tsZXNzIGZpZm8gYmV0d2VlbiAyIGRvbWFp
bnMuIElmIG9uZSByZXN0YXJ0cyBpdCBjYW4gc3RhcnQgb3ZlciBmcm9tIHdoZXJlIGl0IGxlZnQg
KE9ubHkgbmVlZCBhIG9uZSB0aW1lIGluaXRpYWxpc2VyIGF0IGJvb3QpDQotIHJlZHVuZGFuY3kg
c3lzdGVtLCBmb3IgZXhhbXBsZSAyIGRvbWFpbnMgcHJvdmlkaW5nIGEgcG9zaXRpb24gdGhyb3Vn
aCBkaWZmZXJlbnQgbWVhbnMsIHlvdSBkbyBub3QgY2FyZSB3aG8gcHJvdmlkZXMNCiB5b3UganVz
dCBuZWVkIHRoZSBsYXRlc3QgaW5mbyBzbyBvbmUgY291bGQgb3ZlcnJpZGUgdGhlIGRhdGEgZnJv
bSB0aGUgb3RoZXIgb25lLCB0aGUgcmVhZGVyIHdvdWxkIG5vdCBtaW5kLg0KLSBjb25maWd1cmF0
aW9uIGRhdGEgc3RvcmFnZS4gT25lIGRvbWFpbiByZWFkcyB0aGUgY29uZmlnIGFuZCB0aGVuIHN0
b3BzIHVudGlsIGl0IGlzIHJlc3RhcnRlZCB0byB1cGRhdGUgaXQsIG90aGVyIGRvbWFpbnMgY2Fu
IHJlYWQgdGhlIGNvbmZpZw0KDQpJIGhvcGUgdGhvc2UgYXJlIGhlbHBpbmcsIEkgYW0gb3BlbiB0
byBwcm92aWRlIG90aGVycyBpZiB5b3UgbmVlZC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0K
PiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

