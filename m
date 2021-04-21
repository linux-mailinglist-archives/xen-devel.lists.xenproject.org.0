Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8345366A34
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 13:56:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114441.218100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZBSL-0001cU-8p; Wed, 21 Apr 2021 11:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114441.218100; Wed, 21 Apr 2021 11:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZBSL-0001c5-5a; Wed, 21 Apr 2021 11:55:45 +0000
Received: by outflank-mailman (input) for mailman id 114441;
 Wed, 21 Apr 2021 11:55:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3IT8=JS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lZBSJ-0001c0-LD
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 11:55:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::60e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b3a6908-9514-4acd-9307-bfa40afbb5b9;
 Wed, 21 Apr 2021 11:55:40 +0000 (UTC)
Received: from DB6PR07CA0013.eurprd07.prod.outlook.com (2603:10a6:6:2d::23) by
 AM9PR08MB7030.eurprd08.prod.outlook.com (2603:10a6:20b:41c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Wed, 21 Apr
 2021 11:55:37 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::a1) by DB6PR07CA0013.outlook.office365.com
 (2603:10a6:6:2d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.16 via Frontend
 Transport; Wed, 21 Apr 2021 11:55:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 21 Apr 2021 11:55:37 +0000
Received: ("Tessian outbound 82c2d58b350b:v90");
 Wed, 21 Apr 2021 11:55:37 +0000
Received: from 323849ebd4df.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AFF5670C-01DD-4177-84E2-9E97072ACC64.1; 
 Wed, 21 Apr 2021 11:55:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 323849ebd4df.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Apr 2021 11:55:21 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6229.eurprd08.prod.outlook.com (2603:10a6:20b:295::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 11:55:19 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50%4]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 11:55:19 +0000
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
X-Inumbo-ID: 3b3a6908-9514-4acd-9307-bfa40afbb5b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOWM6Wbom7DsgYxCTq77Z9YVY2l4dRnfH0e0WRVcJ58=;
 b=Xu2Ydm1kdYkQG2ZE2iyFEbeDpCQyevQMRiIimxgWheovg8ca7ok+K2nELRjD89nidWUXB6/jBu4JVEDdsOUQg+tHbh/FvnhuVKbIIQQalp6+mNUB1kZQ9/JnpsNYJX0GhkUrqlq53dc6hKt+JYn3E/1A9uDy6tUiqsMvjjZuTD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9ef80f730aa149f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCcYdywrKPQm8b+Dh5GOQUUBURdUFonCbEK82WW2lNJ+YRmnG2komwou5vF6GU9l7UpTiCDW88ZhHHrSk4DCF1sWXWOHGuI9nBVs+p43muJy3AyFPYO53Zp7jNGxwLLU1sNTnz4czH3gcEucuIjY1epO+tAagy1b6AEUabX9IW+TK1UkcSyNcBisvgFbs58NN3wwbAy8q7c16eTlicJIjDQUBCLCSDi97Vj1+dOFUbAFnXpocxon6NZp4jxtQua3c8l6wvD/bMLWYBDF0mkrhupLu1htCI8SmVatmVkKtZek+COTDX01gpIgGAHKiMoShX7tpdN0YMR/kDB90Svsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOWM6Wbom7DsgYxCTq77Z9YVY2l4dRnfH0e0WRVcJ58=;
 b=G+BC7uWcu3m6VRGm4chwjDjfmZ+GHS50Ou4utRaoUNxSevTEAqjHF2/GEoELX3N5eQqQnRjPw6wdOpHnkjkfWtG1t+2/Q29IcfwnsXEJ50tnc0lPaRm5sZpvTw2+L7Sc3aJiHh9YHA96kmRCxmFj5zA0iwvbNkfasq/TRRGSijw0fEBTcojKbZuuBFzVwgwLDl8NpDy4GNNmsAsg/GfyJoher5zD6CWBxtpHO913aJTWxGKQ3tER+RlNDH4SAJzj3obEtJmnfL0NpG8KoZQKTS65FlfU2TnHKXwme1u9TwCe6c5MxHrrpyKgL1rNfKJHfyIK77/qWso6KeimLR8Y4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOWM6Wbom7DsgYxCTq77Z9YVY2l4dRnfH0e0WRVcJ58=;
 b=Xu2Ydm1kdYkQG2ZE2iyFEbeDpCQyevQMRiIimxgWheovg8ca7ok+K2nELRjD89nidWUXB6/jBu4JVEDdsOUQg+tHbh/FvnhuVKbIIQQalp6+mNUB1kZQ9/JnpsNYJX0GhkUrqlq53dc6hKt+JYn3E/1A9uDy6tUiqsMvjjZuTD0=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Topic: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Index:
 AQHXLVmJnBz/2T+xZEqfD4R39q2wV6qwuDwAgAH9VwCAAPmtgIAADD+AgAHfkACAAAF1gIAF4LkAgAAXZQCAACuvgIAACpEAgAAKwACAAaaJgIAAHu8AgAEU14CAAAJ+AIAAEH4AgAAFRgCAACeAgA==
Date: Wed, 21 Apr 2021 11:55:19 +0000
Message-ID: <776600A6-9050-4FAC-A3B5-C5DAF9A48CA7@arm.com>
References: <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
 <YH1CBP8At7lVoHCz@Air-de-Roger>
 <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
 <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
 <6291effa-1589-1013-e89d-c795bce44d9c@suse.com>
 <D2D9A348-3B21-47FD-A9C6-4C66C5778F11@arm.com>
 <a1beaee4-0d6b-e38e-07f7-90a014c504b6@suse.com>
 <30D00B1B-ECB9-4A5B-ACBD-37E532285CCD@arm.com>
 <YH/fQpgEQyhiaj1Y@Air-de-Roger>
 <DA4D72F4-CD1E-46D0-9D32-D8AB01F445F9@arm.com>
 <106baee5-014a-37bd-c8e9-e06b5db5e0e2@suse.com>
In-Reply-To: <106baee5-014a-37bd-c8e9-e06b5db5e0e2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: affb95bd-8b2b-44b9-1b5f-08d904bc609c
x-ms-traffictypediagnostic: AS8PR08MB6229:|AM9PR08MB7030:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7030B83ED1542AF609AFE70EFC479@AM9PR08MB7030.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YtU6gUtEMTtngJq5xsUwWxF01oVF1GhozITrD0BeRFWlnsZ5L/uUgExZD/24mxwHgDsvQ3H+dMTpR+QRXWr2zg3WqwTWqwl0fQRx+eSLU9v/lv9woscSds8U0eCbvnGcL1KR1Pp0QARQJ9Jo9NP6QJFVyVeCf0+gIP+e1llbwrF37ne0U1e2WECzo2DX/zVOb9Kw5fVx1Y9na4XflvKVQ7jZH6NLoj5xL6kyy8yP6OJR41bVPPMpLV45wx5bg8/NYhCKXCbdqGSurIM8E6ZgN5AL5SOD5sz/oja5rbml48QeViieDCwFzjjdc30YbajCSN6Mf+IQpbIipUsOGqDGFsPVlA7ERyWTeVJEfcsIg67aDlRCP0Cz7D8Mm+BEhs35AWF9QSUbXSH3sfIHRwEitajsXqjiGwHDJbFeEvCy5f65DKtHQyt+jeLZbwDrmdek8scEl5Q3BN8K48nXDw18n1OXBjWP3xAol7N7tiFim8vNj5TFUORP5iedUcGAlxUw66iCtnlEAt22IfoldVsMdI2ylC9urVGEJYnUc5ToBLLtMvjHyaPrhNOVfsUnmGr87tCrj2BLfS8w09YeWKkV0Zgp3ak1MQrZYD8mMVKBwvxyC2Gslqa8FYyZcYj9wGAx/ESnxLvw+0zR+OBe9Ar3OtSZ0t2QrtRSj7cj7HUJJP0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(366004)(376002)(136003)(396003)(5660300002)(6916009)(33656002)(7416002)(83380400001)(86362001)(64756008)(91956017)(66946007)(36756003)(66446008)(66556008)(76116006)(66476007)(6512007)(2616005)(186003)(4326008)(71200400001)(8676002)(53546011)(122000001)(478600001)(6486002)(6506007)(38100700002)(316002)(54906003)(8936002)(2906002)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?TWR3UFFwZklYWFZWMHlXZkhQQlhLNngwVEFmZUpKSW1JeisxQU5TSjQ2Zm1l?=
 =?utf-8?B?VGlEMzNDOFc0MEtNR2llSG1scWx6bFAyYUJSN1BhSmFzdDBrM0thZVQzdTcy?=
 =?utf-8?B?Nlp1UURCMXZhRjkwaVEybUNNZEZidUIyOHJvVmtOWU5idWZ5elhNU0xUczRt?=
 =?utf-8?B?RkxjckV1ZmhwNEhwWUFPcEJ4WGt3aVNtTVVsamhIQzJRYjFSYzJNSzFyelJ1?=
 =?utf-8?B?YzBGYUw1VnBydjBQcjV1VWRiMnVrRzE3Tk0vQkI1akRHN2VjOXErRFRHdTdS?=
 =?utf-8?B?bEtTcU5GS2RZTkFwd3hCUjZUeFJrWWFNVFlRWkRFMGhpTndETmxsWWdYeHFR?=
 =?utf-8?B?UXdaRUJYeTNJMUF0U3hSZGVNMkU1ZjN3Vm1taFZVcHE4VGZ5VkZlWUV0MTd6?=
 =?utf-8?B?VlBMWU1DLzRUOUQ4bnpmNmp0M0QrdmRwN3h1eEhoby8zY2NQQmRTbTRKSVBT?=
 =?utf-8?B?SmE2VFl6ZGlxMVNVVExRU0tueFRDZ1BORlRNUXU2eGRsVTROUnA0cUswT1Bn?=
 =?utf-8?B?QkwvdUJrVGlzempsQlExa3U3T3B6dzd3Z0NLVC9KOGlMUURvVDRTTWRYd3Bz?=
 =?utf-8?B?YzdrckU0Z2Q3Tlp0elUxUmgwWE0vMndNby9ONHF2VjdOYktIY0lNVG81c3pn?=
 =?utf-8?B?Qk1zUFRFaUFZU2E3ZlNGQWM1VHRSakR3NEh4cFJlYXhNb2tmejFNZWNXemJD?=
 =?utf-8?B?dFVxUWJqWGkvSDRBS3dDaDBLL2huV2VoQ0hlNXVJb3ZrV2lSZXZFbm54SDlL?=
 =?utf-8?B?SE85dHdqcE5kdXc2TXpTQXNSeFZSNG9EMFRGemJLTUxaNmxUM0t0WHVhdTFx?=
 =?utf-8?B?ODUzd1M4K3p0OXFIZ1VGQkFMQTRGQWtxRXFiVnBrQVNpRTEzNUxObStZOVRi?=
 =?utf-8?B?R0FxbldVZWRwSDlKNHYreXZlZGUwR3FpV3d5OUlHdWVlTm5xZmNOSlNMOFBB?=
 =?utf-8?B?U3dvaHRrUW5uNlA4SUtaTVZYRThsU0VXTHJwYk9nZ2xyUFFyd0dDbkpBUE8v?=
 =?utf-8?B?aytmdU1HSjlwb0JYSkNOT3l6aGtHNmMrUndpZk8weEhZR1pMYnA0SHN2ZTJh?=
 =?utf-8?B?c3dDZWl3Z0ZkSTUxOTJXY09zc0lRZVpIQ1hhejJnQVlwOVlYR1ArbXQ0S0JD?=
 =?utf-8?B?dTljWlluVm5SK1lYbEo1UEFIOTE3SVNIRHAyQVhWMllRMEJOS2tvSldQeUtn?=
 =?utf-8?B?R2R6cm1FWG5UNFZ2T1BNTXlRRVdHOWNXY29BZE9oR3BRcjdtdk0xbURNdDlI?=
 =?utf-8?B?V1dqNkVjbmxEaUJrcFlHQ0c0VEw3UC9tb2R1QlBOdWNod2NmS3BwN3ByeTN6?=
 =?utf-8?B?aW9jWk5IL1Q0eCs1NkMwYnp4WUdYU0lRUGZRSW9SN0hWS2NGTnZGKzVhTCti?=
 =?utf-8?B?MXgxNzkwVitER3pINHBqWkpXMHg2RFlGLzdNZEhDMEVORlhxQndiZHMreTJi?=
 =?utf-8?B?OTZMbnpUcmVnMlNIbElGb25yOElVRmdBYVFIcmN5V2xacXRqd0dua0U2WEVL?=
 =?utf-8?B?T1cyZ0p1YTJlUVV1OXNxWmF1c0ZjQWZsdXdkVXFSeUw4TmljNW9wQUNPdjJp?=
 =?utf-8?B?c2FtNnk3NDNaVEpFUTJaSGh2Q2VFM0FEUkFlWGRBalNXQzFqdzNMckpUVU0w?=
 =?utf-8?B?ZHFJSG5qdi9TTE9VUk5vNE52M2lHTXZOWVJldG15TmVvU01nUncvVERtMUFR?=
 =?utf-8?B?Zjc5MXZHK29FMjJ3VFBlOGpiTDRsMmcxV2l5NHNXSC8zcHFzRnIyU0gzSlUv?=
 =?utf-8?Q?4K1FAeV4rG8QbqtSpDxGwK/2sjx/Avwna8zQ2jO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0FCE02C5CACCB74CB86CBFDDB6FB8072@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6229
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ebd87ac-2e14-4535-a776-08d904bc5628
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UoCj94MqwgOxrlDmq7cDJ1h6bBXi0YxjKzffWxPODLnzRtmct8PRIm9/dT3LpptH0e1AZEKi6SdUxSNfshhF1RzsqLebt+m9r4wHJTCOfeHKxFbJWdCRbYXRTunha8tSJmRPTGof9dh2PSem8ok5tVWXidcDCBtSknloVm8eR/XPTCopQKmliUP+mxMRiMTemcN1M+lh46Ix4NEOIXA0oQoOx+qyzLhg4XD9V3GqNLLngjVxh073w9J0LhJQWP4x+pk9d/prse/Kf6Xg5UHRjBvhZm85l4Hzgh55gjjJN4e0bl0VZLh9gVQ9tHyDD+l7Op52NR7eW2+03qkddyX+xE6LUCYil1vHwgS2T7eYp12uvGOLYYTYsV3jbtqQDp5Y+kRmutsnusFIaVknG9GoPzN3q7gFikDLi8NgWK8vo3b69U6/JIvtXqwPARWFRj66rRLrtzRabXkh30YBjNubJ/KTLHfDgW3EU161sMVGuyK95fcegHnN6guWL36RMvZwbFe9EdcJiINQ/Tu/hvEDJmDEkt0Kccw5nDSszS/bVHR3EoamAby2SvvQxvxdFauu7jsvaqEHJu+jYrwAxGVNgSIQ4QPgX30j3xoDEMLo+q0JCvMYWbEz57UxFEwOtrRY08OTkwNQfpasdjGVo7hEjwvlPKHHERdQymV4q0i7MkU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(36840700001)(46966006)(4326008)(81166007)(186003)(26005)(6506007)(6862004)(478600001)(82740400003)(53546011)(36756003)(33656002)(36860700001)(86362001)(8676002)(47076005)(2616005)(5660300002)(2906002)(6486002)(70206006)(54906003)(356005)(336012)(83380400001)(70586007)(6512007)(316002)(82310400003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 11:55:37.0771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: affb95bd-8b2b-44b9-1b5f-08d904bc609c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7030

SGkgSmFuLA0KDQo+IE9uIDIxIEFwciAyMDIxLCBhdCAxMDozMyBhbSwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDIxLjA0LjIwMjEgMTE6MTUsIFJhaHVs
IFNpbmdoIHdyb3RlOg0KPj4gSGkgUm9nZXIsDQo+PiANCj4+PiBPbiAyMSBBcHIgMjAyMSwgYXQg
OToxNiBhbSwgUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOg0K
Pj4+IA0KPj4+IE9uIFdlZCwgQXByIDIxLCAyMDIxIGF0IDA4OjA3OjA4QU0gKzAwMDAsIFJhaHVs
IFNpbmdoIHdyb3RlOg0KPj4+PiBIaSBKYW4sDQo+Pj4+IA0KPj4+Pj4gT24gMjAgQXByIDIwMjEs
IGF0IDQ6MzYgcG0sIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+
PiANCj4+Pj4+IE9uIDIwLjA0LjIwMjEgMTU6NDUsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+
PiBPbiAxOSBBcHIgMjAyMSwgYXQgMTozMyBwbSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToNCj4+Pj4+Pj4gT24gMTkuMDQuMjAyMSAxMzo1NCwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPj4+Pj4+Pj4gRm9yIHRoZSB0aW1lIGJlaW5nLCBJIHRoaW5rIG1vdmUgdGhpcyBjb2Rl
IGluIHg4NiBpcyBhIGxvdCBiZXR0ZXIgdGhhbiANCj4+Pj4+Pj4+ICNpZmRlZiBvciBrZWVwIHRo
ZSBjb2RlIGluIGNvbW1vbiBjb2RlLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gV2VsbCwgSSB3b3VsZCBw
ZXJoYXBzIGFncmVlIGlmIGl0IGVuZGVkIHVwIGJlaW5nICNpZmRlZiBDT05GSUdfWDg2Lg0KPj4+
Pj4+PiBJIHdvdWxkIHBlcmhhcHMgbm90IGFncmVlIGlmIHRoZXJlIHdhcyBhIG5ldyBDT05GSUdf
KiB3aGljaCBvdGhlcg0KPj4+Pj4+PiAoZnV0dXJlKSBhcmNoLWVzIGNvdWxkIHNlbGVjdCBpZiBk
ZXNpcmVkLg0KPj4+Pj4+IA0KPj4+Pj4+IEkgYWdyZWUgd2l0aCBKdWxpZW4gbW92aW5nIHRoZSBj
b2RlIHRvIHg4NiBmaWxlIGFzIGN1cnJlbnRseSBpdCBpcyByZWZlcmVuY2VkIG9ubHkgaW4geDg2
IGNvZGUNCj4+Pj4+PiBhbmQgYXMgb2Ygbm93IHdlIGFyZSBub3Qgc3VyZSBob3cgb3RoZXIgYXJj
aGl0ZWN0dXJlIHdpbGwgaW1wbGVtZW50IHRoZSBJbnRlcnJ1cHQgcmVtYXBwaW5nDQo+Pj4+Pj4g
KHZpYSBJT01NVSBvciBhbnkgb3RoZXIgbWVhbnMpLiAgDQo+Pj4+Pj4gDQo+Pj4+Pj4gTGV0IG1l
IGtub3cgaWYgeW91IGFyZSBvayB3aXRoIG1vdmluZyB0aGUgY29kZSB0byB4ODYuDQo+Pj4+PiAN
Cj4+Pj4+IEkgY2FuJ3QgYW5zd2VyIHRoaXMgd2l0aCAieWVzIiBvciAibm8iIHdpdGhvdXQga25v
d2luZyB3aGF0IHRoZSBhbHRlcm5hdGl2ZQ0KPj4+Pj4gd291bGQgYmUuIEFzIHNhaWQsIGlmIHRo
ZSBhbHRlcm5hdGl2ZSBpcyBDT05GSUdfWDg2ICNpZmRlZi1hcnksIHRoZW4geWVzLg0KPj4+Pj4g
SWYgYSBzZXBhcmF0ZSBDT05GSUdfKiBnZXRzIGludHJvZHVjZWQgKGFuZCBzZWxlY3RlZCBieSBY
ODYpLCB0aGVuIGENCj4+Pj4+IHNlcGFyYXRlIGZpbGUgKGdldHRpbmcgYnVpbHQgb25seSB3aGVu
IHRoYXQgbmV3IHNldHRpbmcgaXMgeSkgd291bGQgc2VlbQ0KPj4+Pj4gYmV0dGVyIHRvIG1lLg0K
Pj4+PiANCj4+Pj4gSSBqdXN0IG1hZGUgYSBxdWljayBwYXRjaC4gUGxlYXNlIGxldCBtZSBrbm93
IGlmIGJlbG93IHBhdGNoIGlzIG9rLiBJIG1vdmUgdGhlIGRlZmluaXRpb24gdG8gICJwYXNzdGhy
b3VnaC94ODYvaW9tbXUuY+KAnSBmaWxlLg0KPj4+PiANCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMN
Cj4+Pj4gaW5kZXggNzA1MTM3ZjhiZS4uMTk5Y2UwODYxMiAxMDA2NDQNCj4+Pj4gLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvcGNpLmMNCj4+Pj4gQEAgLTEzMDMsMTMgKzEzMDMsNiBAQCBzdGF0aWMgaW50IF9faW5p
dCBzZXR1cF9kdW1wX3BjaWRldnModm9pZCkNCj4+Pj4gfQ0KPj4+PiBfX2luaXRjYWxsKHNldHVw
X2R1bXBfcGNpZGV2cyk7DQo+Pj4+IA0KPj4+PiAtaW50IGlvbW11X3VwZGF0ZV9pcmVfZnJvbV9t
c2koDQo+Pj4+IC0gICAgc3RydWN0IG1zaV9kZXNjICptc2lfZGVzYywgc3RydWN0IG1zaV9tc2cg
Km1zZykNCj4+Pj4gLXsNCj4+Pj4gLSAgICByZXR1cm4gaW9tbXVfaW50cmVtYXANCj4+Pj4gLSAg
ICAgICAgICAgPyBpb21tdV9jYWxsKCZpb21tdV9vcHMsIHVwZGF0ZV9pcmVfZnJvbV9tc2ksIG1z
aV9kZXNjLCBtc2cpIDogMDsNCj4+Pj4gLX0NCj4+Pj4gLQ0KPj4+PiBzdGF0aWMgaW50IGlvbW11
X2FkZF9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+IHsNCj4+Pj4gICAgY29uc3Qg
c3RydWN0IGRvbWFpbl9pb21tdSAqaGQ7DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC94ODYvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21t
dS5jDQo+Pj4+IGluZGV4IGI5MGJiMzFiZmUuLmNmNTFkZWM1NjQgMTAwNjQ0DQo+Pj4+IC0tLSBh
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jDQo+Pj4+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jDQo+Pj4+IEBAIC0zNDAsNiArMzQwLDEzIEBAIGJv
b2wgYXJjaF9pb21tdV91c2VfcGVybWl0dGVkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+Pj4+
ICAgICAgICAgICAgbGlrZWx5KCFwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkp
Ow0KPj4+PiB9DQo+Pj4+IA0KPj4+PiAraW50IGlvbW11X3VwZGF0ZV9pcmVfZnJvbV9tc2koDQo+
Pj4+ICsgICAgc3RydWN0IG1zaV9kZXNjICptc2lfZGVzYywgc3RydWN0IG1zaV9tc2cgKm1zZykN
Cj4+Pj4gK3sNCj4+Pj4gKyAgICByZXR1cm4gaW9tbXVfaW50cmVtYXANCj4+Pj4gKyAgICAgICAg
ICAgPyBpb21tdV9jYWxsKCZpb21tdV9vcHMsIHVwZGF0ZV9pcmVfZnJvbV9tc2ksIG1zaV9kZXNj
LCBtc2cpIDogMDsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiAvKg0KPj4+PiAqIExvY2FsIHZhcmlh
YmxlczoNCj4+Pj4gKiBtb2RlOiBDDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
aW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+Pj4+IGluZGV4IGVhMGNkMGYxYTIu
LmJkNDJkODdiNzIgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+
Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+Pj4+IEBAIC0yNDMsNyArMjQzLDYg
QEAgc3RydWN0IGlvbW11X29wcyB7DQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgdTgg
ZGV2Zm4sIGRldmljZV90ICpkZXYpOw0KPj4+PiAjaWZkZWYgQ09ORklHX0hBU19QQ0kNCj4+Pj4g
ICAgaW50ICgqZ2V0X2RldmljZV9ncm91cF9pZCkodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbik7
DQo+Pj4+IC0gICAgaW50ICgqdXBkYXRlX2lyZV9mcm9tX21zaSkoc3RydWN0IG1zaV9kZXNjICpt
c2lfZGVzYywgc3RydWN0IG1zaV9tc2cgKm1zZyk7DQo+Pj4+ICNlbmRpZiAvKiBIQVNfUENJICov
DQo+Pj4+IA0KPj4+PiAgICB2b2lkICgqdGVhcmRvd24pKHN0cnVjdCBkb21haW4gKmQpOw0KPj4+
PiBAQCAtMjcyLDYgKzI3MSw3IEBAIHN0cnVjdCBpb21tdV9vcHMgew0KPj4+PiAgICBpbnQgKCph
ZGp1c3RfaXJxX2FmZmluaXRpZXMpKHZvaWQpOw0KPj4+PiAgICB2b2lkICgqc3luY19jYWNoZSko
Y29uc3Qgdm9pZCAqYWRkciwgdW5zaWduZWQgaW50IHNpemUpOw0KPj4+PiAgICB2b2lkICgqY2xl
YXJfcm9vdF9wZ3RhYmxlKShzdHJ1Y3QgZG9tYWluICpkKTsNCj4+Pj4gKyAgICBpbnQgKCp1cGRh
dGVfaXJlX2Zyb21fbXNpKShzdHJ1Y3QgbXNpX2Rlc2MgKm1zaV9kZXNjLCBzdHJ1Y3QgbXNpX21z
ZyAqbXNnKTsNCj4+PiANCj4+PiBZb3UgYWxzbyBuZWVkIHRvIG1vdmUgdGhlIGZ1bmN0aW9uIHBy
b3RvdHlwZQ0KPj4+IChpb21tdV91cGRhdGVfaXJlX2Zyb21fbXNpKSBmcm9tIGlvbW11LmggaW50
byBhc20teDg2L2lvbW11LmgsIG9yDQo+Pj4gbWF5YmUgeW91IGNvdWxkIGp1c3QgZGVmaW5lIHRo
ZSBmdW5jdGlvbiBpdHNlbGYgYXMgc3RhdGljIGlubGluZSBpbg0KPj4+IGFzbS14ODYvaW9tbXUu
aD8NCj4+IA0KPj4gDQo+PiBPay4gSSB3aWxsIG1vdmUgZnVuY3Rpb24gcHJvdG90eXBlIChpb21t
dV91cGRhdGVfaXJlX2Zyb21fbXNpKSBmcm9tIA0KPj4gaW9tbXUuaCBpbnRvIGFzbS14ODYvaW9t
bXUuaC4NCj4+IA0KPj4gSSBmaXJzdCB0cmllZCB0byBtYWtlIHRoZSBmdW5jdGlvbiBhcyBzdGF0
aWMgaW5saW5lIGluICJhc20teDg2L2lvbW11LmgiIGJ1dCBhZnRlciANCj4+IHRoYXQgSSBvYnNl
cnZlIHRoZSBjb21waWxhdGlvbiBlcnJvciBmb3IgZGVidWcgYnVpbGQgYmVjYXVzZSAiYXNtL2lv
bW11LmjigJ0gDQo+PiBpcyBpbmNsdWRlZCBpbiAieGVuL2lvbW11LmjigJ0gYmVmb3JlIGlvbW11
X2NhbGwoKSBpcyBkZWZpbmVkIGluICJ4ZW4vaW9tbXUuaOKAnS4NCj4+IFRoYXQncyB3aHkgSSBk
ZWNpZGVkIHRvIG1vdmUgaXQgdG8gdGhlICJwYXNzdGhyb3VnaC94ODYvaW9tbXUuY+KAnSBmaWxl
Lg0KPiANCj4gV2hpY2ggaW4gdHVybiB3b3VsZCBiZSBhbiBhcmd1bWVudCBmb3Iga2VlcGluZyBp
dCBpbiB4ZW4vaW9tbXUuaCBhbmQNCj4gd3JhcCBpdCBpbiBhbiAjaWZkZWYuDQo+IA0KDQpPay4g
SSB3aWxsIG1vdmUgdGhlIGRlZmluaXRpb24gb2YgaW9tbXVfdXBkYXRlX2lyZV9mcm9tX21zaSgp
IHRvIA0KInhlbi9pb21tdS5o4oCdIGFuZCB3aWxsIHdyYXAgaXQgdW5kZXIgQ09ORklHX1g4Ng0K
DQpJZiBldmVyeW9uZSBpcyBvayB3aXRoIHRoZSBhYm92ZSBhcHByb2FjaCB0aGVuIEkgd2lsbCBz
ZW5kIHRoZSBuZXh0DQp2ZXJzaW9uIG9mIHRoZSBwYXRjaCBzZXJpZXMgZm9yIHJldmlldy4NCg0K
UmVnYXJkcywNClJhaHVsDQoNCj4gSmFuDQoNCg==

