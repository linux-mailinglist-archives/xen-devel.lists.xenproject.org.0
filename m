Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5950418F3B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 08:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196338.349133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUkPO-00071R-WB; Mon, 27 Sep 2021 06:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196338.349133; Mon, 27 Sep 2021 06:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUkPO-0006z0-T0; Mon, 27 Sep 2021 06:46:38 +0000
Received: by outflank-mailman (input) for mailman id 196338;
 Mon, 27 Sep 2021 06:46:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xxNw=OR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mUkPM-0006ya-LX
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 06:46:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.62]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5293489b-af9d-4e21-8186-7dc547bdb355;
 Mon, 27 Sep 2021 06:46:32 +0000 (UTC)
Received: from AM6P194CA0057.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::34)
 by VI1PR08MB3231.eurprd08.prod.outlook.com (2603:10a6:803:4a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 06:46:29 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::37) by AM6P194CA0057.outlook.office365.com
 (2603:10a6:209:84::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 06:46:29 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Mon, 27 Sep 2021 06:46:28 +0000
Received: ("Tessian outbound 3c48586a377f:v103");
 Mon, 27 Sep 2021 06:46:25 +0000
Received: from cedbc914dd42.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A580B835-FE01-40A4-9381-AAF4AA14B66C.1; 
 Mon, 27 Sep 2021 06:46:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cedbc914dd42.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 27 Sep 2021 06:46:14 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB4489.eurprd08.prod.outlook.com (2603:10a6:10:cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Mon, 27 Sep
 2021 06:46:12 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 06:46:12 +0000
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
X-Inumbo-ID: 5293489b-af9d-4e21-8186-7dc547bdb355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTrJnL0+GuKNeC5npFGaYN3AtHDG8HtXaFbXkHhc5VI=;
 b=etdvZeLONS+J5SAtlgla3z7VLqJrdwmReK90qUFl9tN0lgUVJgnM1llSG8dqSlj7FSlGSO/GMSfL31kxbpkObeJFJQXWwoMuVGkqAKEU0LRXsDq7ggjRB9NMcobUanMFa0bVwcOpmkoKib6o3njQjuYGezzudRLYynwLJm/9Q8I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmn0yNEB+KlAY5Ypgc1FrAo+O6o7mgTAoSF9DpBHpNyaeg7eOpPl2a/oVAfHG2Yuj6GMOscp4z7nxUon/ORo5zWRAZxbFuYtl2qLIZ+6kAV8SBN0pMyR5ajgxv5ju6bD/uruJKDBzToTW8rEYA/c564mINrcgfjGFW/BkbQiEHR7xAPaMUVNMgzNAWIBm03iNKo/LY7mXpW2lAz/WLjwX02tMB3ZftxqCuBtUILX+9UuUYJJ2Ozb5gfzm+qCxMSML1ttFI4KS0xtJaZ7VaDVRimnntrKuEcCT7olR0odBQGVdrEx+hf6gFuiruIZi5zXwzvFdB9TkxJkdvkZddpAtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=CTrJnL0+GuKNeC5npFGaYN3AtHDG8HtXaFbXkHhc5VI=;
 b=ZanImUDsQxaHWxtUgYM/wlgg8H151CTrM4j7lWXo6A+l2H5ECRN+ZCfNt/ptdItxuEcHsWFE71RKYbbhW4u4UpCzxsrz3EWn0YUuwVlY18rcgV39namiNB1n124gh1Pwb+M8J3qywTPQZhhnzEvwBjBAB+Fw3wP+MzI17bp1KajNAxBz2WtLST2n/net5JLEn+s1Srb0GxuQyArEVI/gOR7yZb2MXmJ8Iot/Dz1EqC/CPfujCgn9aMVVCAV4+NQYpYX7jbC4UIMVA5p5lr/xZWqNAnBSYAT5Z3X5imY8Tl95IsBmVjhjb0N1aU02qZ3BJq8kS1rNKb7UnXkk8ot8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTrJnL0+GuKNeC5npFGaYN3AtHDG8HtXaFbXkHhc5VI=;
 b=etdvZeLONS+J5SAtlgla3z7VLqJrdwmReK90qUFl9tN0lgUVJgnM1llSG8dqSlj7FSlGSO/GMSfL31kxbpkObeJFJQXWwoMuVGkqAKEU0LRXsDq7ggjRB9NMcobUanMFa0bVwcOpmkoKib6o3njQjuYGezzudRLYynwLJm/9Q8I=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
Subject: RE: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Topic: [PATCH 22/37] xen/arm: use NR_MEM_BANKS to override default
 NR_NODE_MEMBLKS
Thread-Index:
 AQHXsHMrRDdmLUiNMk+huFUWk4EjYquyZ70AgAPY1CCAAP08AIAADO8QgAANUgCAABvh0A==
Date: Mon, 27 Sep 2021 06:46:11 +0000
Message-ID:
 <DB9PR08MB6857603316C2C808BAD8CD709EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-23-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231828310.17979@sstabellini-ThinkPad-T480s>
 <DB9PR08MB685744A06D7C014DAE9BE73F9EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262021200.5022@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857AD295D692F962AD76C219EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109262123140.5022@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109262123140.5022@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2DC51D831ACAD248913C88B5A9E58022.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2bdc8bd4-059f-4505-dd0f-08d981828888
x-ms-traffictypediagnostic: DBBPR08MB4489:|VI1PR08MB3231:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB323132BC465F8CAE1755B67F9EA79@VI1PR08MB3231.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tXy7snAM1tZbhaWL4tULzxITkRO52ogIlS2290a4nXocR/u1FNQ176isjtQQojnPdJ+0Svp0irlkxTXcMCrNuFw+xuH3n9yfmZ1tl/Hd5ESeZI9J21sAT7v0kS2C45oEHw6iTmUV5K+G6ToL/833YIxt7tPRRLUGDBd8GOumeX6QAK/Tndawgm71QjI9/V2JebHGbq2kwt4vfaItCmN1KqSWy/Qh3VLb988WCn+4UiAqWebCp2r9M1M/s3FhH1ygmdXP7Nb4u61CQAEj36jS3UUb/V3QGRxsnvKI4iLEPY2rGKor2zPaBOyGzyfNfzPzeSYjxm5tzfsActzt9WOQqodW11KnnzwM7VoYKYchvkm73mM5Qg36W2jQb5vuIi7wBkoYEBy51EzAUNq/1P2Fy/BF4tGPETF1gEISZ4/lKKs3qN51J4gk1Tipluiyy2zR0tpZzkSOfw84OLId/RlZbhyU5IjHirhUOykDuA3Qbh3ar5U45bGHko/p0ZmXq8XF+gWmZ7weVKRy70LsuDN/Jh5x1hr+g/OcDoScTKeqZyB5PhwJGC/eDCkxndMj3oQ3D7SC9bUCDcBK6gF1kBZVCbNeXFeZHqi+iHt4DgFNMbj0UuU86qwr7N9d2myb4x7XPXSvXaY85qlsBjzuwYNHQCTK6ZHnQtXBoHBMaHutoEhhTzwFeuraLQLzci7CrSskvxWkk2rpzpN3Xt7xA73lhbhpPEXnMkji5wOlyuFveWnALB7134WvzPphijLvXdAOF9DqePwzfd2QUuaJ48MO7/HyALayZdTV8s328Qwsyjc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(6916009)(122000001)(54906003)(86362001)(8936002)(76116006)(508600001)(5660300002)(7696005)(2906002)(966005)(8676002)(316002)(9686003)(71200400001)(55016002)(4326008)(66946007)(66446008)(6506007)(53546011)(26005)(64756008)(38070700005)(66556008)(66476007)(33656002)(52536014)(83380400001)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4489
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	30ba2efe-1acc-4b50-a3e7-08d981827eae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WdpZ0MQ6UFemApPgf0FZGq+vEG1XD2crzoirGWpVliPEkHT5qKvhYJhVq9sPEqeMKIPTMrnM1dEd5udnMWNkgWeo2NsXOWHDdOFNwIdz8CKsKLbrm5fNm30uIq1KrIix7kV0I66+XBwb3XdCR1DjtIE2cljMI6SQ+XUHUI6ucMjJwhjkhPNYL5aG3+dfuDNW9Vs9IPkWtCrnXQODWk1O/rlbGC7ZehOkNcDPWyCOKAzUoJxfTx9/G1LSUxzn/yCUZ4Yg/X1eVfOThC/8t7J1m22vT0QGV0gZnkVUv4aEriUBlGAr24ZuqWhFAp3RD4zo+p1W88IMQ56xbNWXE3RgkrvroYITVhRJDi+gY37TxnbIn4EC8m4ZlktErEe0WxCKEjWPffNhrEqZgPS5+zkDNbxjsEQavU5X2Tmav30T1Dy9urfo9nqmUjkQxMHEY1NslHZSI8shQWG9I0b4vUlA968YJDYdQ/14tNWduKAMSlIodV+JofRHfWFnrk+rrcAwrl4oDEPLyiHyt/VfYcLvu30kzGG3Vt8S7lIRZUARZqeeRkrMG+gWPyQQL5xRbSjQtjZjvTkMRKTwZP4ztKbZOjZHmDC9o1rt8zWkhyP6SiJO0SUBBDy3UmBze3g/vCnhtnr/uvOVftjlCA6gZCHYGZoxk/KR/G/PbrjwVds9ANCyuMRx85dHDgA4UZL3AjlCsJvOv6K/YOryFrAGoHi6vEyxGPWAHA8rbuowGPluQ9VN6Z37WbPyy50Et2Z2I24yebVqwXVJ+wHXfYgCEKnK08oYm5/l3ceDFlInnCVVOvM=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(356005)(82310400003)(5660300002)(83380400001)(52536014)(33656002)(81166007)(36860700001)(86362001)(70206006)(70586007)(2906002)(6506007)(8936002)(107886003)(186003)(966005)(336012)(508600001)(55016002)(53546011)(7696005)(4326008)(26005)(54906003)(316002)(8676002)(47076005)(6862004)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 06:46:28.5294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdc8bd4-059f-4505-dd0f-08d981828888
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3231

SGkgU3RlZmFubywgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2VudDog
MjAyMeW5tDnmnIgyN+aXpSAxMzowMA0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+
DQo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBqdWxpZW5AeGVuLm9yZzsgQmVydHJhbmQg
TWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgamJldWxpY2hAc3VzZS5jb207
IHJvZ2VyLnBhdUBjaXRyaXguY29tOw0KPiBhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tDQo+IFN1
YmplY3Q6IFJFOiBbUEFUQ0ggMjIvMzddIHhlbi9hcm06IHVzZSBOUl9NRU1fQkFOS1MgdG8gb3Zl
cnJpZGUgZGVmYXVsdA0KPiBOUl9OT0RFX01FTUJMS1MNCj4gDQo+ICt4ODYgbWFpbnRhaW5lcnMN
Cj4gDQo+IE9uIE1vbiwgMjcgU2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+ID4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPiA+IFNlbnQ6IDIwMjHlubQ55pyIMjfml6UgMTE6MjYN
Cj4gPiA+IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPiA+IENjOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyB4ZW4tDQo+ID4gPiBkZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZzsganVsaWVuQHhlbi5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4g
PiA+IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+ID4gPiBTdWJqZWN0OiBSRTogW1BBVENI
IDIyLzM3XSB4ZW4vYXJtOiB1c2UgTlJfTUVNX0JBTktTIHRvIG92ZXJyaWRlDQo+IGRlZmF1bHQN
Cj4gPiA+IE5SX05PREVfTUVNQkxLUw0KPiA+ID4NCj4gPiA+IE9uIFN1biwgMjYgU2VwIDIwMjEs
IFdlaSBDaGVuIHdyb3RlOg0KPiA+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiA+ID4gRnJvbTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
Pg0KPiA+ID4gPiA+IFNlbnQ6IDIwMjHlubQ55pyIMjTml6UgOTozNQ0KPiA+ID4gPiA+IFRvOiBX
ZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gPiA+ID4gPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOw0KPiA+ID4ganVsaWVuQHhl
bi5vcmc7DQo+ID4gPiA+ID4gQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0u
Y29tPg0KPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMjIvMzddIHhlbi9hcm06IHVzZSBO
Ul9NRU1fQkFOS1MgdG8gb3ZlcnJpZGUNCj4gPiA+IGRlZmF1bHQNCj4gPiA+ID4gPiBOUl9OT0RF
X01FTUJMS1MNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIFRodSwgMjMgU2VwIDIwMjEsIFdlaSBD
aGVuIHdyb3RlOg0KPiA+ID4gPiA+ID4gQXMgYSBtZW1vcnkgcmFuZ2UgZGVzY3JpYmVkIGluIGRl
dmljZSB0cmVlIGNhbm5vdCBiZSBzcGxpdA0KPiBhY3Jvc3MNCj4gPiA+ID4gPiA+IG11bHRpcGxl
IG5vZGVzLiBTbyB3ZSBkZWZpbmUgTlJfTk9ERV9NRU1CTEtTIGFzIE5SX01FTV9CQU5LUyBpbg0K
PiA+ID4gPiA+ID4gYXJjaCBoZWFkZXIuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGlzIHN0YXRl
bWVudCBpcyB0cnVlIGJ1dCB3aGF0IGlzIHRoZSBnb2FsIG9mIHRoaXMgcGF0Y2g/IElzIGl0DQo+
IHRvDQo+ID4gPiA+ID4gcmVkdWNlIGNvZGUgc2l6ZSBhbmQgbWVtb3J5IGNvbnN1bXB0aW9uPw0K
PiA+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IE5vLCB3aGVuIEp1bGllbiBhbmQgSSBkaXNjdXNz
ZWQgdGhpcyBpbiBsYXN0IHZlcnNpb25bMV0sIHdlIGhhZG4ndA0KPiA+ID4gdGhvdWdodA0KPiA+
ID4gPiBzbyBkZWVwbHkuIFdlIGp1c3QgdGhvdWdodCBhIG1lbW9yeSByYW5nZSBkZXNjcmliZWQg
aW4gRFQgY2Fubm90IGJlDQo+ID4gPiBzcGxpdA0KPiA+ID4gPiBhY3Jvc3MgbXVsdGlwbGUgbm9k
ZXMuIFNvIE5SX01FTV9CQU5LUyBzaG91bGQgYmUgZXF1YWwgdG8NCj4gTlJfTUVNX0JBTktTLg0K
PiA+ID4gPg0KPiA+ID4gPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMjEtDQo+ID4gPiAwOC9tc2cwMDk3NC5odG1sDQo+ID4gPiA+DQo+ID4g
PiA+ID4gSSBhbSBhc2tpbmcgYmVjYXVzZSBOUl9NRU1fQkFOS1MgaXMgMTI4IGFuZA0KPiA+ID4g
PiA+IE5SX05PREVfTUVNQkxLUz0yKk1BWF9OVU1OT0RFUyB3aGljaCBpcyA2NCBieSBkZWZhdWx0
IHNvIGFnYWluDQo+ID4gPiA+ID4gTlJfTk9ERV9NRU1CTEtTIGlzIDEyOCBiZWZvcmUgdGhpcyBw
YXRjaC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEluIG90aGVyIHdvcmRzLCB0aGlzIHBhdGNoIGFs
b25lIGRvZXNuJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZTsgYXQNCj4gbGVhc3QNCj4gPiA+ID4gPiBk
b2Vzbid0IG1ha2UgYW55IGRpZmZlcmVuY2UgdW5sZXNzIENPTkZJR19OUl9OVU1BX05PREVTIGlz
DQo+IGluY3JlYXNlZC4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNvLCBpcyB0aGUgZ29hbCB0byBy
ZWR1Y2UgbWVtb3J5IHVzYWdlIHdoZW4gQ09ORklHX05SX05VTUFfTk9ERVMNCj4gaXMNCj4gPiA+
ID4gPiBoaWdoZXIgdGhhbiA2ND8NCj4gPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBJIGFsc28g
dGhvdWdodCBhYm91dCB0aGlzIHByb2JsZW0gd2hlbiBJIHdhcyB3cml0aW5nIHRoaXMgcGF0Y2gu
DQo+ID4gPiA+IENPTkZJR19OUl9OVU1BX05PREVTIGlzIGluY3JlYXNpbmcsIGJ1dCBOUl9NRU1f
QkFOS1MgaXMgYSBmaXhlZA0KPiA+ID4gPiB2YWx1ZSwgdGhlbiBOUl9NRU1fQkFOS1MgY2FuIGJl
IHNtYWxsZXIgdGhhbiBDT05GSUdfTlJfTlVNQV9OT0RFUw0KPiA+ID4gPiBhdCBvbmUgcG9pbnQu
DQo+ID4gPiA+DQo+ID4gPiA+IEJ1dCBJIGFncmVlIHdpdGggSnVsaWVuJ3Mgc3VnZ2VzdGlvbiwg
TlJfTUVNX0JBTktTIGFuZA0KPiBOUl9OT0RFX01FTUJMS1MNCj4gPiA+ID4gbXVzdCBiZSBhd2Fy
ZSBvZiBlYWNoIG90aGVyLiBJIGhhZCB0aG91Z2h0IHRvIGFkZCBzb21lIEFTU0VSVCBjaGVjaywN
Cj4gPiA+ID4gYnV0IEkgZG9uJ3Qga25vdyBob3cgdG8gZG8gaXQgYmV0dGVyLiBTbyBJIHBvc3Qg
dGhpcyBwYXRjaCBmb3IgbW9yZQ0KPiA+ID4gPiBzdWdnZXN0aW9uLg0KPiA+ID4NCj4gPiA+IE9L
LiBJbiB0aGF0IGNhc2UgSSdkIHNheSB0byBnZXQgcmlkIG9mIHRoZSBwcmV2aW91cyBkZWZpbml0
aW9uIG9mDQo+ID4gPiBOUl9OT0RFX01FTUJMS1MgYXMgaXQgaXMgcHJvYmFibHkgbm90IG5lY2Vz
c2FyeSwgc2VlIGJlbG93Lg0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiBBbmQga2VlcCBkZWZhdWx0IE5SX05PREVfTUVNQkxLUyBpbiBjb21tb24gaGVhZGVyDQo+
ID4gPiA+ID4gPiBmb3IgdGhvc2UgYXJjaGl0ZWN0dXJlcyBOVU1BIGlzIGRpc2FibGVkLg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gVGhpcyBsYXN0IHNlbnRlbmNlIGlzIG5vdCBhY2N1cmF0ZTogb24g
eDg2IE5VTUEgaXMgZW5hYmxlZCBhbmQNCj4gPiA+ID4gPiBOUl9OT0RFX01FTUJMS1MgaXMgc3Rp
bGwgZGVmaW5lZCBpbiB4ZW4vaW5jbHVkZS94ZW4vbnVtYS5oICh0aGVyZQ0KPiBpcw0KPiA+ID4g
bm8NCj4gPiA+ID4gPiB4ODYgZGVmaW5pdGlvbiBvZiBpdCkNCj4gPiA+ID4gPg0KPiA+ID4gPg0K
PiA+ID4gPiBZZXMuDQo+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+ID4gPiA+ID4gLS0tDQo+ID4gPiA+
ID4gPiAgeGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmggfCA4ICsrKysrKystDQo+ID4gPiA+ID4g
PiAgeGVuL2luY2x1ZGUveGVuL251bWEuaCAgICAgfCAyICsrDQo+ID4gPiA+ID4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmggYi94ZW4v
aW5jbHVkZS9hc20tDQo+IGFybS9udW1hLmgNCj4gPiA+ID4gPiA+IGluZGV4IDhmMWM2N2UzZWIu
LjIxNTY5ZTYzNGIgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJt
L251bWEuaA0KPiA+ID4gPiA+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9udW1hLmgNCj4g
PiA+ID4gPiA+IEBAIC0zLDkgKzMsMTUgQEANCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAgI2lu
Y2x1ZGUgPHhlbi9tbS5oPg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8YXNt
L3NldHVwLmg+DQo+ID4gPiA+ID4gPiArDQo+ID4gPiA+ID4gPiAgdHlwZWRlZiB1OCBub2RlaWRf
dDsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAtI2lmbmRlZiBDT05GSUdfTlVNQQ0KPiA+ID4g
PiA+ID4gKyNpZmRlZiBDT05GSUdfTlVNQQ0KPiA+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ID4gKyNk
ZWZpbmUgTlJfTk9ERV9NRU1CTEtTIE5SX01FTV9CQU5LUw0KPiA+ID4gPiA+ID4gKw0KPiA+ID4g
PiA+ID4gKyNlbHNlDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gIC8qIEZha2Ugb25lIG5vZGUg
Zm9yIG5vdy4gU2VlIGFsc28gbm9kZV9vbmxpbmVfbWFwLiAqLw0KPiA+ID4gPiA+ID4gICNkZWZp
bmUgY3B1X3RvX25vZGUoY3B1KSAwDQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUveGVuL251bWEuaCBiL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4gPiA+ID4gPiA+IGluZGV4
IDE5NzhlMmJlMWIuLjE3MzFlMWNjNmIgMTAwNjQ0DQo+ID4gPiA+ID4gPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vbnVtYS5oDQo+ID4gPiA+ID4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbnVtYS5o
DQo+ID4gPiA+ID4gPiBAQCAtMTIsNyArMTIsOSBAQA0KPiA+ID4gPiA+ID4gICNkZWZpbmUgTUFY
X05VTU5PREVTICAgIDENCj4gPiA+ID4gPiA+ICAjZW5kaWYNCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiArI2lmbmRlZiBOUl9OT0RFX01FTUJMS1MNCj4gPiA+ID4gPiA+ICAjZGVmaW5lIE5SX05P
REVfTUVNQkxLUyAoTUFYX05VTU5PREVTKjIpDQo+ID4gPiA+ID4gPiArI2VuZGlmDQo+ID4gPg0K
PiA+ID4gVGhpcyBvbmUgd2UgY2FuIHJlbW92ZSBpdCBjb21wbGV0ZWx5IHJpZ2h0Pw0KPiA+DQo+
ID4gSG93IGFib3V0IGRlZmluZSBOUl9NRU1fQkFOS1MgdG86DQo+ID4gI2lmZGVmIENPTkZJR19O
Ul9OVU1BX05PREVTDQo+ID4gI2RlZmluZSBOUl9NRU1fQkFOS1MgKENPTkZJR19OUl9OVU1BX05P
REVTICogMikNCj4gPiAjZWxzZQ0KPiA+ICNkZWZpbmUgTlJfTUVNX0JBTktTIDEyOA0KPiA+ICNl
bmRpZg0KPiA+IGZvciBib3RoIHg4NiBhbmQgQXJtLiBGb3IgdGhvc2UgYXJjaGl0ZWN0dXJlcyBk
byBub3Qgc3VwcG9ydCBvciBlbmFibGUNCj4gPiBOVU1BLCB0aGV5IGNhbiBzdGlsbCB1c2UgIk5S
X01FTV9CQU5LUyAxMjgiLiBBbmQgcmVwbGFjZSBhbGwNCj4gTlJfTk9ERV9NRU1CTEtTDQo+ID4g
aW4gTlVNQSBjb2RlIHRvIE5SX01FTV9CQU5LUyB0byByZW1vdmUgTlJfTk9ERV9NRU1CTEtTIGNv
bXBsZXRlbHkuDQo+ID4gSW4gdGhpcyBjYXNlLCBOUl9NRU1fQkFOS1MgY2FuIGJlIGF3YXJlIG9m
IHRoZSBjaGFuZ2VzIG9mDQo+IENPTkZJR19OUl9OVU1BX05PREVTLg0KPiANCj4geDg2IGRvZXNu
J3QgaGF2ZSBOUl9NRU1fQkFOS1MgYXMgZmFyIGFzIEkgY2FuIHRlbGwuIEkgZ3Vlc3MgeW91IGFs
c28NCj4gbWVhbnQgdG8gcmVuYW1lIE5SX05PREVfTUVNQkxLUyB0byBOUl9NRU1fQkFOS1M/DQo+
IA0KDQpZZXMuDQoNCj4gQnV0IE5SX01FTV9CQU5LUyBpcyBub3QgZGlyZWN0bHkgcmVsYXRlZCB0
byBDT05GSUdfTlJfTlVNQV9OT0RFUyBiZWNhdXNlDQo+IHRoZXJlIGNhbiBiZSBtYW55IG1lbW9y
eSBiYW5rcyBmb3IgZWFjaCBudW1hIG5vZGUsIGNlcnRhaW5seSBtb3JlIHRoYW4NCj4gMi4gVGhl
IGV4aXN0aW5nIGRlZmluaXRpb24gb24geDg2Og0KPiANCj4gI2RlZmluZSBOUl9OT0RFX01FTUJM
S1MgKE1BWF9OVU1OT0RFUyoyKQ0KPiANCj4gRG9lc24ndCBtYWtlIGEgbG90IG9mIHNlbnNlIHRv
IG1lLiBXYXMgaXQganVzdCBhbiBhcmJpdHJhcnkgbGltaXQgZm9yDQo+IHRoZSBsYWNrIG9mIGEg
YmV0dGVyIHdheSB0byBzZXQgYSBtYXhpbXVtPw0KPiANCg0KQXQgdGhhdCB0aW1lLCB0aGlzIHdh
cyBwcm9iYWJseSB0aGUgbW9zdCBjb3N0LWVmZmVjdGl2ZSBhcHByb2FjaC4NCkVub3VnaCBhbmQg
ZWFzeS4gQnV0LCBpZiBtb3JlIG5vZGVzIG5lZWQgdG8gYmUgc3VwcG9ydGVkIGluIHRoZQ0KZnV0
dXJlLCBpdCBtYXkgYnJpbmcgbW9yZSBtZW1vcnkgYmxvY2tzLiBBbmQgdGhpcyBtYXhpbXVtIHZh
bHVlDQptaWdodCBub3QgYXBwbHkuIFRoZSBtYXhpbXVtIG1heSBuZWVkIHRvIHN1cHBvcnQgZHlu
YW1pYyBleHRlbnNpb24uDQoNCj4gDQo+IE9uIHRoZSBvdGhlciBoYW5kLCBOUl9NRU1fQkFOS1Mg
YW5kIE5SX05PREVfTUVNQkxLUyBzZWVtIHRvIGJlIHJlbGF0ZWQuDQo+IEluIGZhY3QsIHdoYXQn
cyB0aGUgZGlmZmVyZW5jZT8NCj4gDQo+IE5SX01FTV9CQU5LUyBpcyB0aGUgbWF4IG51bWJlciBv
ZiBtZW1vcnkgYmFua3MgKHdpdGggb3Igd2l0aG91dA0KPiBudW1hLW5vZGUtaWQpLg0KPiANCj4g
TlJfTk9ERV9NRU1CTEtTIGlzIHRoZSBtYXggbnVtYmVyIG9mIG1lbW9yeSBiYW5rcyB3aXRoIE5V
TUEgc3VwcG9ydA0KPiAod2l0aCBudW1hLW5vZGUtaWQpPw0KPiANCj4gVGhleSBhcmUgYmFzaWNh
bGx5IHRoZSBzYW1lIHRoaW5nLiBPbiBBUk0gSSB3b3VsZCBqdXN0IGRvOg0KPiANCg0KUHJvYmFi
bHkgbm90LCBOUl9NRU1fQkFOS1Mgd2lsbCBjb3VudCB0aG9zZSBtZW1vcnkgcmFuZ2VzIHdpdGhv
dXQNCm51bWEtbm9kZS1pZCBpbiBib290IG1lbW9yeSBwYXJzaW5nIHN0YWdlIChwcm9jZXNzX21l
bW9yeV9ub2RlIG9yDQpFRkkgcGFyc2VyKS4gQnV0IE5SX05PREVfTUVNQkxLUyB3aWxsIG9ubHkg
Y291bnQgdGhvc2UgbWVtb3J5IHJhbmdlcw0Kd2l0aCBudW1hLW5vZGUtaWQuDQoNCj4gI2RlZmlu
ZSBOUl9OT0RFX01FTUJMS1MgTUFYKE5SX01FTV9CQU5LUywgKENPTkZJR19OUl9OVU1BX05PREVT
ICogMikpDQo+IA0KPiANCj4gQW5kIG1heWJlIHRoZSBkZWZpbml0aW9uIGNvdWxkIGJlIGNvbW1v
biB3aXRoIHg4NiBpZiB3ZSBkZWZpbmUNCj4gTlJfTUVNX0JBTktTIHRvIDEyOCBvbiB4ODYgdG9v
Lg0KDQpKdWxpZW4gaGFkIGNvbW1lbnQgaGVyZSwgSSB3aWxsIGNvbnRpbnVlIGluIHRoYXQgZW1h
aWwuDQo=

