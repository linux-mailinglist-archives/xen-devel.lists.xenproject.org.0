Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3136B42F6FC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210834.367843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbP2A-0007N7-3f; Fri, 15 Oct 2021 15:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210834.367843; Fri, 15 Oct 2021 15:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbP29-0007KJ-Ui; Fri, 15 Oct 2021 15:22:09 +0000
Received: by outflank-mailman (input) for mailman id 210834;
 Fri, 15 Oct 2021 15:22:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbP28-0007K8-Tn
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:22:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::61d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b578b5f-93ec-4328-8191-aa1017b7340d;
 Fri, 15 Oct 2021 15:22:07 +0000 (UTC)
Received: from AS8P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::9)
 by DB8PR08MB4169.eurprd08.prod.outlook.com (2603:10a6:10:ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Fri, 15 Oct
 2021 15:22:03 +0000
Received: from VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::99) by AS8P251CA0027.outlook.office365.com
 (2603:10a6:20b:2f2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 15:22:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT016.mail.protection.outlook.com (10.152.18.115) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 15:22:03 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Fri, 15 Oct 2021 15:22:02 +0000
Received: from 59118bf89d9f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F60BC28-DEA8-43D9-AA0C-31E54534139B.1; 
 Fri, 15 Oct 2021 15:21:56 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 59118bf89d9f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 15:21:56 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB9PR08MB6714.eurprd08.prod.outlook.com (2603:10a6:10:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 15:21:54 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 15:21:54 +0000
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
X-Inumbo-ID: 2b578b5f-93ec-4328-8191-aa1017b7340d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkrKpOlu2K+v/47oj3jFI8xlPKPStmSbUstRAuprWc0=;
 b=clAtD9uM1J7D+tCZxEUbXxQq3NQ4srzM8uOgUVkLvbWc1DcLnSEqIkmV6ivMyFSwviNKpDakbSvMkroWJkOM+McidW26mOUfbFzPggkXSwV9uzkmFfJrBHsLEGKqpJtu666Ob/KZiU6gnL5I/dqpxtIAwaDaHTa6fw6Ybh6T7XU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9aa418b6092a01f5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkQk/AxBoNynt2TDj8lyZvznKA5x7L2TqvGLBS4oOXnZk033hoO3NI9lrF+zNp6R53f8rwEuV/cU/f28wizdZUARjFuGDaZhEmPflSlOaiiShymip6waQatsaAL+9cEnV1FVh9+gvFwh0mYl5AHb5HQASratz9Jf8F6rcLM+QQuOjXYuEKwhxlMLDBCRyQaKDZXj1qtmNEYsJic5iVTapeu6tc1OIvsMO8UsYJUS7Jk65U0c6L21QVC7ew6qkPN8biKNiu38y0Myo5PSNNCD/SzrHNo4anTT3e7r7qhyW+6YBecjvWJENpgYUI3UjMrv3KxTGhVwowcIDZCdv8Xkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkrKpOlu2K+v/47oj3jFI8xlPKPStmSbUstRAuprWc0=;
 b=HQzSgE1deITsTg3zlhPN7X+xivqMQCYQuOI2Norg5iOCn0DgjzGxv04SGi10b4ebx/eWOgtUG0zBssfyNUJeRGfT0y9EW87ce+tv82SSg1BkG3VQIxwSXU0ndkLT6cAxPjmEY+s60Gg3a/7GBG5H/juYWNBS9FGCkVCvdX6cmnfkYwVtHmYebFNnJkMDkDfHAc6m5+BFF30ynI8u0w0bBOJxK6zGpjpqpKBtmGJdN7vFLYfpNtPwSvtNVr1G+VCFRpIfXEpp+8jQDA9NzWMqh0iF44au7BvQitGVL/qil0xKoJNhyKdBccZnl6BbkLjwHOiC8h2p/w3B2Do1Rh1O5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkrKpOlu2K+v/47oj3jFI8xlPKPStmSbUstRAuprWc0=;
 b=clAtD9uM1J7D+tCZxEUbXxQq3NQ4srzM8uOgUVkLvbWc1DcLnSEqIkmV6ivMyFSwviNKpDakbSvMkroWJkOM+McidW26mOUfbFzPggkXSwV9uzkmFfJrBHsLEGKqpJtu666Ob/KZiU6gnL5I/dqpxtIAwaDaHTa6fw6Ybh6T7XU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Topic: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Index: AQHXwcz8unryLt1qUEeMdpd7xMjDNavUKeYAgAABFACAAAGtAIAAAIKA
Date: Fri, 15 Oct 2021 15:21:53 +0000
Message-ID: <34230BD4-9E31-4B57-867F-C924002FDF5E@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
 <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com>
 <ec52b9e9-5908-7fd0-dfbf-31906eb8398d@xen.org>
 <D471145B-813F-457C-BB81-23BE1FFACB93@arm.com>
 <alpine.DEB.2.21.2110150817230.9408@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110150817230.9408@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ceaca3c9-d0cf-448a-956e-08d98fef8a6c
x-ms-traffictypediagnostic: DB9PR08MB6714:|DB8PR08MB4169:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB416962CA6A3C595FDB46D2C09DB99@DB8PR08MB4169.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 quDqXMv+SS7lpmEC2cr4KABE/I3ndVC6ACgh/yE6AzCt/7DqcHEwV0SJnSssp7lxEE4Ysfx/WxoS5TAOiGYNqnEFmpvfrLaE9bqEkKSPLcKCKNms0h0iBXq1J6mQ/+G3XFOBqc8Z85I3WwuJkbyxY/KnXBK78pOo8ZA3fscyEuQafk2n0qzEf80wo+EyadAPcvSunmFwgXlyI0vWMpkupZ9u4wZhV6eBd0BHMjBkM+1Slr9mMYvUGhe6PDHKzfPJRyQLw6MjmQ02QSd/VX5flKILwYOmPakvLC0w/FNU/89T3fiCIh0CHRX5yJQjXsapkYvbY59WW67KwDB2Ttg/go6K7b4aMZv77duHHlP0D4I2C23RIjtdg4DTBkt/gny25hDJ2/sY4B4e7hMTbfdJ8EpH/n1L4ZS74PZwbdaJ+ogZrHRKAG2fhNU+lCTRPLU4BDfkSLvlljyUMBrSwCtyDFPIJzleI32689jCPy/1dAVbOwh0Ds5FGXTQPlEiDFvHHBLThA7U49IQO5c4YpASukHYGpTAXwRmtL/sWeebL2Chas1p152hfulcs6SzuCGNAQc/oQgw62m83lGFZmpECd/IjAjRms0IpgVw4ejwIpVnyiA3n06taXPMN9FJuHcdCotoyNZX9n+vkO45fQXR8RU3WMSiYma0C6YVP8UVZFpXj2K3i6tMJ7Ysl2PWCEXDKcQm2TYmBIC0Mbnb5NzkA8Y7dWbHuihnm1YshNuFayT+Myf9DcohiBuj1ToF+0nN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(4326008)(36756003)(2906002)(33656002)(38070700005)(508600001)(54906003)(316002)(53546011)(6506007)(5660300002)(86362001)(38100700002)(2616005)(66556008)(8936002)(66476007)(66946007)(91956017)(76116006)(8676002)(7416002)(26005)(71200400001)(6916009)(64756008)(66446008)(6486002)(186003)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <35DF60943CD0F34B902AE9A25D9C5712@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6714
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1b44e6fb-f8c7-4218-9874-08d98fef8509
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SxKTVeojPM3qtDGVPLaZj5/pnXutd4cEk9QG9xKqmmRY82ligz7L3PVc8qvLCUtlvDCmnF/FYeFq+yhC/aloGKNWFknFVPrVDGsbn9cM8iOK9FN/7DU+esfLSqkygvX0JczkA/AdWlDpTfXGaNzvVCZBCprIWRZGJPL+2vYMBBGeuIpc1X8ElvE7NqEwsNc2/Ygy9hHoYq8K2MHYCQdANe94Dxxs+WxFOhFHbSNzTCxVayrX9I57krGgZO3278mBFXvZBHs6XFj5oX4N1iipKIR64wMRtxbN9fG6dgGAd35/fonAlpPkoJoXiyMPiJnyAcMx9HLy8rAkW8odxR4iInBagCaywUTlTVjGhiH2j80WK+8ngRWvrlJTP6qxWQUkJamrqm9jdvHmf1YCEwEV0iu00NipsXciMqcG0JVyDvGc9j3RqRtuJaj5BjC085ggCFb4QpueYthAJEbeGsivjb2U6Fz/mL54x3HjvGGS9zrvsffdHgGSfJPvrciIH1WiW7DUBTQFg9jrFgTrlc5GddTSHN3o5m/z8m114ODYbCjlQ3AynTQXRBuPC1ZzmsdFFKXNmffZ7ElVEJC7+DYbR2da6GEw8D49Akc22MHHD+M6Zv0HoExyvlnqFn6cgKaVN5ZxKtcsnaePHZji2xSIREVMgmo9OXPXeH3/QyFJANlmDs6v11coOcLju9sxJSV8NEJp9MnfVDlbwTKHkBKPuA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6862004)(54906003)(2906002)(82310400003)(8936002)(316002)(8676002)(508600001)(6486002)(86362001)(53546011)(356005)(6506007)(47076005)(33656002)(36756003)(2616005)(70586007)(36860700001)(4326008)(81166007)(26005)(6512007)(336012)(5660300002)(70206006)(107886003)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 15:22:03.0923
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceaca3c9-d0cf-448a-956e-08d98fef8a6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4169

SGksDQoNCj4gT24gMTUgT2N0IDIwMjEsIGF0IDE2OjIwLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAxNSBPY3QgMjAyMSwg
QmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEhpLA0KPj4gDQo+Pj4gT24gMTUgT2N0IDIwMjEs
IGF0IDE2OjEwLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+
PiBIaSBCZXJ0cmFuZCwNCj4+PiANCj4+PiBPbiAxNS8xMC8yMDIxIDE0OjU5LCBCZXJ0cmFuZCBN
YXJxdWlzIHdyb3RlOg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
cGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+PiBpbmRleCAzYWE4YzMx
NzVmLi4wODI4OTJjOGEyIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+PiBA
QCAtNzY2LDcgKzc2NiwyMSBAQCBpbnQgcGNpX2FkZF9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1
OCBkZXZmbiwNCj4+Pj4gICAgICAgICBsaXN0X2FkZCgmcGRldi0+ZG9tYWluX2xpc3QsICZoYXJk
d2FyZV9kb21haW4tPnBkZXZfbGlzdCk7DQo+Pj4+ICAgICB9DQo+Pj4+ICAgICBlbHNlDQo+Pj4+
ICsgICAgew0KPj4+PiArI2lmZGVmIENPTkZJR19BUk0NCj4+Pj4gKyAgICAgICAgLyoNCj4+Pj4g
KyAgICAgICAgICogT24gQVJNIFBDSSBkZXZpY2VzIGRpc2NvdmVyeSB3aWxsIGJlIGRvbmUgYnkg
RG9tMC4gQWRkIHZwY2kgaGFuZGxlcg0KPj4+PiArICAgICAgICAgKiB3aGVuIERvbTAgaW5mb3Jt
IFhFTiB0byBhZGQgdGhlIFBDSSBkZXZpY2VzIGluIFhFTi4NCj4+Pj4gKyAgICAgICAgICovDQo+
Pj4+ICsgICAgICAgIHJldCA9IHZwY2lfYWRkX2hhbmRsZXJzKHBkZXYpOw0KPj4+IA0KPj4+IFNv
cnJ5IGZvciBvbmx5IG5vdGljaW5nIGl0IG5vdy4gTG9va2luZyBhdCB0aGUgbGFzdCBzdGFnaW5n
DQo+Pj4gdnBjaV9hZGRfaGFuZGxlcnMoKSBpcyBhbm5vdGF0ZWQgd2l0aCBfX2h3ZG9tX2luaXQu
IE9uIEFybSwgX19od2RvbV9pbml0IG1lYW5zIHRoZSBmdW5jdGlvbiB3aWxsIGRpc2FwcGVhciBh
ZnRlciBib290Lg0KPj4+IA0KPj4+IEhvd2V2ZXIsIHBjaV9hZGRfZGV2aWNlKCkgY2FuIGJlIGNh
bGxlZCBmcm9tIGEgcGh5c2RldiBvcC4gU28gSSB0aGluayB3ZSB3b3VsZCBuZWVkIHRvIGRyb3Ag
X19od2RvbV9pbml0LiBJIGNhbid0IHNlZW0gdG8gZmluZCB0aGlzIGNoYW5nZSBpbiB0aGlzIHNl
cmllcy4gRGlkIEkgbWlzcyBhbnl0aGluZz8NCj4+IA0KPj4gR29vZCBjYXRjaCBhbmQgbm90IHRo
aXMgaXMgbm90IGluIHRoZSBzZXJpZS4NCj4+IA0KPj4gQ2FuIHdlIGNvbnNpZGVyIHRoYXQgYSBi
dWcgc28gdGhhdCBJIGNhbiBzZW5kIGEgbmV3IHBhdGNoIG9yIHNob3VsZCBJIHNlbmQgYSB2OCA/
DQo+IA0KPiBXZSBkb24ndCB0eXBpY2FsbHkgZG8gdGhhdCwgYnV0IEkgY291bGQgbWFrZSB0aGUg
Y2hhbmdlIG9uIGNvbW1pdCwgb3INCj4gbWVyZ2UgYSBzZWNvbmQgcGF0Y2ggZnJvbSB5b3Ugd2l0
aCB0aGlzIG9uZSBvbiBjb21taXQsIGFmdGVyIEkgcnVuIGFsbA0KPiB0aGUgZ2l0bGFiLWNpIHRl
c3RzLg0KDQpUaGFua3MgYnV0IHdlIG5lZWQgdG8gc29ydCBvdXQgdGhlIHdoZXJlIGZpcnN0IChK
dWxpZW7igJlzIG1haWwpLg0KDQpJIGd1ZXNzIGEgdjggd2lsbCBiZSByZXF1aXJlZC4NCg0KQ2hl
ZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiAoSSBzdGlsbCBoYXZlIHRvIHJlYWQgdGhlIHNlcmllcyBi
dXQgRllJKQ0KDQo=

