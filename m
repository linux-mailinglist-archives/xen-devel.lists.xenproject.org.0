Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820523F8287
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 08:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172679.315100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ8z6-00084I-G2; Thu, 26 Aug 2021 06:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172679.315100; Thu, 26 Aug 2021 06:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ8z6-00082E-CV; Thu, 26 Aug 2021 06:35:32 +0000
Received: by outflank-mailman (input) for mailman id 172679;
 Thu, 26 Aug 2021 06:35:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJ8z5-000828-07
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 06:35:31 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.40]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd456f16-0637-11ec-a9cf-12813bfff9fa;
 Thu, 26 Aug 2021 06:35:28 +0000 (UTC)
Received: from AM6P192CA0059.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::36)
 by VI1PR08MB4542.eurprd08.prod.outlook.com (2603:10a6:803:fa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 06:35:26 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::53) by AM6P192CA0059.outlook.office365.com
 (2603:10a6:209:82::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Thu, 26 Aug 2021 06:35:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 06:35:25 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Thu, 26 Aug 2021 06:35:24 +0000
Received: from 4e907fb4517b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B48F3E13-4E3E-4BE6-BD73-5CCDD98CD655.1; 
 Thu, 26 Aug 2021 06:35:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e907fb4517b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 06:35:18 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6540.eurprd08.prod.outlook.com (2603:10a6:10:260::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Thu, 26 Aug
 2021 06:35:16 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 06:35:14 +0000
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
X-Inumbo-ID: cd456f16-0637-11ec-a9cf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmhLZq4VgZwoGT6w0sxyQ1lZndkTH7pNV0h/DqE8BTY=;
 b=G6MlruEhwSZKr3oUcpyWIPyccw+gpUou4rterzTmwkgQYyjoQSBdOio0GBgsketPlLRa5Ys3A89rkKW8F+CTepyXiLfFmqbSFGUOS4fFUuJCYF85k2phLxZfxoERTJVl6mf+xRN1M3eLkgkxGViocRbr6EO78I2JR14U0MKrVkg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOeqVNyIXdLDYQMctB7qh/GABhrHitY4GV9n6AvoyVtqOXs1T97WBEtyKalh6l05lPMRwz9q3uLAhd23Rc7yrNKfIN3bNKFvMl+e/IGT4t7j90ri0syxpMR9OM4hvXJ2Cd7KIp2Xfjs49xFy3vGteXLm9h9M2DZ0n5bGYqYBkZ8k/QxzFIn8QG3PcVq+kgxUjGVrtLPx2mTFpwKMS6RSy7XMM6gB/CSAMcWzu06s0Ovyc0IHi+vsrQM9eg7BVCzoYj97W1A1GSd1+V93ma+kh8LCknSPel4XRVoZTVmQzvxvtXJ+jP5lK6DnAFQ5tIjsWPJg3QA7Pu8vNKpf5YOBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmhLZq4VgZwoGT6w0sxyQ1lZndkTH7pNV0h/DqE8BTY=;
 b=H04Ngye/PCkrwDrBTBK/KJWVTblXrktjPwFj6m/6Obsa9xiDdOrKfqYTINjaBTOxGMm8D9o0jKd04gBXLPSS6Wm7NCqUhnVaBXnpAIDHRUIVPtj6Jd4wzKsB4URUhtLsPBQ38RYYEAgot0dfn8dfpvNdT4uSdIugktsN8Cgxh0aNE2BnpS6zY7ZXB/9Ag4E+0VqVw2VPnHY3MIAxbl+USlgnMWO8VP11bVD1fCFAQhU6+1PpzXCIBtAXpZsa5k2Kx6i0nOJv70UTJ6tjsBHHlfztmCaK9YVWOr5cjkN5iLvVgIn3idZGlQNFET5tispnTFqVrujjl7eFC2loRkhyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmhLZq4VgZwoGT6w0sxyQ1lZndkTH7pNV0h/DqE8BTY=;
 b=G6MlruEhwSZKr3oUcpyWIPyccw+gpUou4rterzTmwkgQYyjoQSBdOio0GBgsketPlLRa5Ys3A89rkKW8F+CTepyXiLfFmqbSFGUOS4fFUuJCYF85k2phLxZfxoERTJVl6mf+xRN1M3eLkgkxGViocRbr6EO78I2JR14U0MKrVkg=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
Thread-Topic: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse
 device tree memory node
Thread-Index: AQHXjps6uVXfLZKD7EKSvvhEptOzS6uEUqiAgAEPgfA=
Date: Thu, 26 Aug 2021 06:35:14 +0000
Message-ID:
 <DB9PR08MB6857604B3D4B690F2B8832BD9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-24-wei.chen@arm.com>
 <4bd56df9-f95b-eb19-dbbc-d12b4f7b0668@xen.org>
In-Reply-To: <4bd56df9-f95b-eb19-dbbc-d12b4f7b0668@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A72D909291B6A3408B5696D0C8BB894C.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b230cd93-a529-40b3-990d-08d9685baffb
x-ms-traffictypediagnostic: DB9PR08MB6540:|VI1PR08MB4542:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB45426FD65206A10C319F47EA9EC79@VI1PR08MB4542.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SIydIm2du/AYUS/IogOA2fBfjE2g5ElmIh32uKW4GC+vr7zpn3TQbhWvI7Sahg23n6LSvHrkkO9TufULkpH/XEHNTtQ0M8rIstuT4RRSjZtdZbAbZ83RQYpbBYZJRY2niH+WhUDLKpFATdI/+ktthF6/eQZnoMj3BjHiYAA/9zqzxI6Op6WloF3QBu8URuDLtFIRjWr1NXrGy+/6QyrY5S7EVimaO7Ddw1Ah0dc0hBe9aulJadShone1n/N3BgQr432e9+d/IkTIddiLM7zvEdJ7R2xZsaoAoAtqHJrV6N0rvmfP2rUafnpjoGpflP1nJpNe4l8hmyb8F9ccYzDF4kUxP4aZh9MZK3H4A8JC/n/Xjgyc0ajVRcyvKexoDhzhDL3Csd4pibxKnnQhxQiw5Bw/aOecFRlH6TxRj+zwtgpgyR3PgIPUijM9M5LuXgx1DkPTEC2fZkk/XrjQ07NN4VePQyuJsZYou3/aA6XX9RQfEYRki8sssQv5TzOEuX3xhYzQj5qcDTO4HQlUikxNaeZgPgp/SivsxSEsmarh3lgM2bB77OSHvNdjg2BkfDKpd5SGGvqHfssqDxyzeD8qxOig7wMC3DEtJd2LdOhopAJsFX7RMUdIsB+dFA3ixFosWI9GNxxDvSXFUfPGh8dxx7k7b/v+RlRiSLu3rTj/LPhwnZF8zBZzVLZgUZeFnbT7jmGoijYGveamLuduW5H0xQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(39850400004)(366004)(396003)(110136005)(38100700002)(8936002)(66476007)(8676002)(122000001)(478600001)(55016002)(26005)(9686003)(186003)(52536014)(7696005)(86362001)(64756008)(53546011)(33656002)(6506007)(71200400001)(83380400001)(316002)(76116006)(2906002)(66446008)(66556008)(4326008)(66946007)(38070700005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T0lsUU0wdnZJRGswM1hOUVdsMUJLTGdTbnEwZXhTaENNb09NbHVmYnltWm9K?=
 =?utf-8?B?OFpNU0RtdDBsOVNmeFZIdDFUY3VJaFM0UnBwMWUrSXluYUFQNEtjMEVTV2o1?=
 =?utf-8?B?L1RTQURJeGEraWlZbGNLRU92SWJhWlhaMnptR1o5VVd4RDB2N01OZDExejBz?=
 =?utf-8?B?bDVzcUVaRW1waDU0aTFDS2d4anJGbWJEV3c5c3BFazBFVUUzdXpFWkptNTBx?=
 =?utf-8?B?K2U4U2VTZ29pNnNwNnRIbmZTL2YrS29HdytTQkg0dlIwS2tvaEJQa0JVbi9I?=
 =?utf-8?B?bHZTUUVnRCtJeXcyTHJhbzc0Z1NRSUljd25wSFJWcEMrYTQ2MU43dG0yMUd3?=
 =?utf-8?B?QmY0OXVSQkg2YmJpYTBoVUZQSVlpYnFsSEFsbUF6R0piaWpPeFJXWmgwK1E5?=
 =?utf-8?B?NUp1RE9XN3BON1FLMEduaTFzYTRrQWJxQ3VPTWFOZ29jY3pXSGNnbUttUWJN?=
 =?utf-8?B?V3hBZzF5SnRIRUhiMHYyelA2c3M3eGhSVXZGdDkzZHA5ZkJodU5uOUdFbHE0?=
 =?utf-8?B?WmUzUkpxOS91bDVwdldDMXdEU2dnb2lxMFE4TUl3OFdtanJpYUlaSWx2ZUJ6?=
 =?utf-8?B?UzdzZHROTHE3ZUVpbWdmdHVWZnlqUWMrNmJZMnpFajNibVA4SHpPR2xVZmNS?=
 =?utf-8?B?TFgrL0ZuZ3lrejhhR2tPUHNJV3d2djRBNCs2ZnpvMGRBVllWWlBaeTBjZzRV?=
 =?utf-8?B?aXU0ODJSazRLK2RoY1l0VjhZaU9FMmd0S3hOWkkxeUVvUjRJUjN4NGJxcFlE?=
 =?utf-8?B?N0FkTUZseG5VTUw3bHFKVElpWkREeUlkbXZYaGQraHcvS3JQNmROZnpDczYz?=
 =?utf-8?B?LzdFY3NJZmpXaHlYK1RvTGQxWmFuK0N1bFU2azR6S2ZSd1ovbkFDVy9YRVFi?=
 =?utf-8?B?ZG15VUR1eG81b2JsRklJalVXblFlaEc4eWxtUDcvRVd4TCt5TWRNbFUxUTJJ?=
 =?utf-8?B?L1ZqTXpVRVUwUk1MNTJjSWxKNVRGWmI3RThodDdUUzBXUGlTbG85T3Zmb0ZZ?=
 =?utf-8?B?U0c5ak5uclBCQVUwUFNtMUJPWjg2aHlna2IvMEJTNWs5Y2dnMGxlTHlDL0Fj?=
 =?utf-8?B?UW1MaXhhN2paRGNKQ1prRDFHVlF2ellYM0c1b0FEeUl0S2FSTCtrUXhRZHJm?=
 =?utf-8?B?d2NYM1hPS0taQkx1UTJvb1hhSHBlQzc4TldjcEROY2V6Y1MweFl3anRFVXcz?=
 =?utf-8?B?czJmMmlIdGl0SEtXUHVvbml5Ujk0N2xqOGc4QThOaVF4LzlDSDhUSzgwSENN?=
 =?utf-8?B?Z0xtaThVeUhkZzE3SGp1L1EwbEQzd0EvVHU4bEhKQUVzKzhBSU9qWFpzOTJn?=
 =?utf-8?B?bnhGOVdTTWk4SDNWQXE4UHlyeC9iTWxXSjFPVWdlNjdJQ2EwMHVnQTRiSjdV?=
 =?utf-8?B?Nlh5Sm5ZbXU0WE5yYytoT1h3NnlsSzdWOTJ1aDNjN1ArZnFJWmRxRlB1cTJH?=
 =?utf-8?B?YlkydTRwWjJSVDU1V3FMTEx4Qm4xeHVvYzZtRi9PUDhaNnRac082d2hjd1pw?=
 =?utf-8?B?cmcyMUdFMVQxQW1KSFlWZkphVVBSbFBsQ1pCUmw3UkFzbXNnY0ZaRUxxeC8v?=
 =?utf-8?B?Q2VncFg2eEx4N2doMTJxWmxCc1BndkwvM3ExdzRVRnZGcDZrOU1vdE1OZVor?=
 =?utf-8?B?THg0blZPMlM0RW03eUNybWdYZ2lkenlQRytoeU5JNE05OEh3NmFFQ3YxWFhS?=
 =?utf-8?B?VDVjOWR0eGJWQWQ1YU1LcUlTcHlYTGk2VWxET2FXd3A3dGFOdFFFT0hiNEJT?=
 =?utf-8?Q?d/80Cb1VSynblp/jRPgIt1UZgXOD1OJ9gDMWm/X?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6540
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	23686eec-b714-438c-fb4b-08d9685ba993
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8V2VLH6ra7zdEzb17M02WkwsLju+l7M/vruSh5O6SmlNjcv+W3v+Y7gnY21pFggLfKOzxbO+YkhZt/j88viRVm5kab/W+FtCBgdcUrZCjYWWoRSQTp4OfagNLZ+mCrSPU8i57SfpoS4o4OH/lAMI1btM4RKRYEEljsZCDQRqriC2xYY2xYL0emUwFVyLlGXYWEHO5Vs+JmcMgYJ9uS1ImDM35i1abfW4v5toNWx5gIQ527LAOjV68ooN4eBvtvWbIrizbMS6Fw2xLmHNtgepT++mb/ATPgKfmQb/UBc9HnuTmz8eOZRfKBJPKO4j8f6Hr21xCQFPTpP2DGHRBZS0SP0X7atA8YhxRCTNCQFPWqEhtG6VNkB7Kmy21NhUDhmnDr31O/GBSPIfZ4xwJajNM+5Vtd07b79GO+fdTRGBwW2dj3qx+mFq8JtRxRfWiUu/qEchMS8b3cQv7WIssrqupKP2zNlnd5dLWW3WM0h8Xyy1OHtwrGgcZElfE+svqy0fxGikkL/xzxThKVOefu+RnDWAmGeqH/PeLPpYxC6Lby/bSgEocNo+mAEX3TQrMpv26jquHtnvRMWn8IvlvCJWIToDeYIlDL2YT4RCFBhCjtw9bv+Xvepy1EIlcGX0hfUWImSi3wlXeUAQyL17/6lJYtLAjKxQy2Qb1n133wsr5JxtyskVShnaGvdbspqjZJdtz8J4E8376RhI4dShw2bJiw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(36840700001)(46966006)(7696005)(110136005)(83380400001)(70206006)(478600001)(8936002)(6506007)(336012)(36860700001)(70586007)(4326008)(33656002)(82740400003)(47076005)(186003)(8676002)(82310400003)(81166007)(5660300002)(86362001)(9686003)(55016002)(316002)(26005)(52536014)(53546011)(2906002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 06:35:25.2630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b230cd93-a529-40b3-990d-08d9685baffb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4542

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjXml6UgMjE6NDkN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjMvNDBdIHhlbi9hcm06IGludHJvZHVjZSBhIGhlbHBl
ciB0byBwYXJzZQ0KPiBkZXZpY2UgdHJlZSBtZW1vcnkgbm9kZQ0KPiANCj4gSGkgV2VpLA0KPiAN
Cj4gT24gMTEvMDgvMjAyMSAxMToyNCwgV2VpIENoZW4gd3JvdGU6DQo+ID4gTWVtb3J5IGJsb2Nr
cycgTlVNQSBJRCBpbmZvcm1hdGlvbiBpcyBzdG9yZWQgaW4gZGV2aWNlIHRyZWUncw0KPiA+IG1l
bW9yeSBub2RlcyBhcyAibnVtYS1ub2RlLWlkIi4gV2UgbmVlZCBhIG5ldyBoZWxwZXIgdG8gcGFy
c2UNCj4gPiBhbmQgdmVyaWZ5IHRoaXMgSUQgZnJvbSBtZW1vcnkgbm9kZXMuDQo+ID4NCj4gPiBJ
biBvcmRlciB0byBzdXBwb3J0IG1lbW9yeSBhZmZpbml0eSBpbiBsYXRlciB1c2UsIHRoZSB2YWxp
ZA0KPiA+IG1lbW9yeSByYW5nZXMgYW5kIE5VTUEgSUQgd2lsbCBiZSBzYXZlZCB0byB0YWJsZXMu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4g
PiAtLS0NCj4gPiAgIHhlbi9hcmNoL2FybS9udW1hX2RldmljZV90cmVlLmMgfCAxMzAgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMzAgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1hX2Rldmlj
ZV90cmVlLmMNCj4gYi94ZW4vYXJjaC9hcm0vbnVtYV9kZXZpY2VfdHJlZS5jDQo+ID4gaW5kZXgg
MzdjYzU2YWNmMy4uYmJlMDgxZGNkMSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVt
YV9kZXZpY2VfdHJlZS5jDQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL251bWFfZGV2aWNlX3RyZWUu
Yw0KPiA+IEBAIC0yMCwxMSArMjAsMTMgQEANCj4gPiAgICNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0K
PiA+ICAgI2luY2x1ZGUgPHhlbi9ub2RlbWFzay5oPg0KPiA+ICAgI2luY2x1ZGUgPHhlbi9udW1h
Lmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vbGliZmR0L2xpYmZkdC5oPg0KPiA+ICAgI2luY2x1ZGUg
PHhlbi9kZXZpY2VfdHJlZS5oPg0KPiA+ICAgI2luY2x1ZGUgPGFzbS9zZXR1cC5oPg0KPiA+DQo+
ID4gICBzOCBkZXZpY2VfdHJlZV9udW1hID0gMDsNCj4gPiAgIHN0YXRpYyBub2RlbWFza190IHBy
b2Nlc3Nvcl9ub2Rlc19wYXJzZWQgX19pbml0ZGF0YTsNCj4gPiArc3RhdGljIG5vZGVtYXNrX3Qg
bWVtb3J5X25vZGVzX3BhcnNlZCBfX2luaXRkYXRhOw0KPiA+DQo+ID4gICBzdGF0aWMgaW50IHNy
YXRfZGlzYWJsZWQodm9pZCkNCj4gPiAgIHsNCj4gPiBAQCAtNTUsNiArNTcsNzkgQEAgc3RhdGlj
IGludCBfX2luaXQNCj4gZHRiX251bWFfcHJvY2Vzc29yX2FmZmluaXR5X2luaXQobm9kZWlkX3Qg
bm9kZSkNCj4gPiAgICAgICByZXR1cm4gMDsNCj4gPiAgIH0NCj4gPg0KPiA+ICsvKiBDYWxsYmFj
ayBmb3IgcGFyc2luZyBvZiB0aGUgbWVtb3J5IHJlZ2lvbnMgYWZmaW5pdHkgKi8NCj4gPiArc3Rh
dGljIGludCBfX2luaXQgZHRiX251bWFfbWVtb3J5X2FmZmluaXR5X2luaXQobm9kZWlkX3Qgbm9k
ZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IHN0YXJ0LCBw
YWRkcl90IHNpemUpDQo+ID4gK3sNCj4gDQo+IFRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGlzIGZ1
bmN0aW9uIGlzIHF1aXRlIHNpbWlsYXIgb3QgdGhlIEFDUEkNCj4gdmVyc2lvbi4gQ2FuIHRoaXMg
YmUgYWJzdHJhY3RlZD8NCg0KSW4gbXkgZHJhZnQsIEkgaGFkIHRyaWVkIHRvIG1lcmdlIEFDUEkg
YW5kIERUQiB2ZXJzaW9ucyBpbiBvbmUNCmZ1bmN0aW9uLiBJIGludHJvZHVjZWQgYSBudW1iZXIg
b2YgImlmIGVsc2UiIHRvIGRpc3Rpbmd1aXNoIEFDUEkNCmZyb20gRFRCLCBlc3BlY2lhbGx5IEFD
UEkgaG90cGx1Zy4gVGhlIGZ1bmN0aW9uIHNlZW1zIHZlcnkgbWVzc3kuDQpOb3QgZW5vdWdoIGJl
bmVmaXRzIHRvIG1ha2UgdXAgZm9yIHRoZSBtZXNzLCBzbyBJIGdhdmUgdXAuDQoNCkJ1dCwgeWVz
LCBtYXliZSB3ZSBjYW4gYWJzdHJhY3Qgc29tZSBjb21tb24gY29kZSB0byBmdW5jdGlvbnMsIHRo
YXQNCmNhbiBiZSByZXVzZWQgaW4gdHdvIGZ1bmN0aW9ucy4gSSB3b3VsZCB0cnkgaXQgaW4gbmV4
dCB2ZXJzaW9uLg0KDQoNCj4gDQo+ID4gKyAgICBzdHJ1Y3Qgbm9kZSAqbmQ7DQo+ID4gKyAgICBw
YWRkcl90IGVuZDsNCj4gPiArICAgIGludCBpOw0KPiA+ICsNCj4gPiArICAgIGlmICggc3JhdF9k
aXNhYmxlZCgpICkNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKyAg
ICBlbmQgPSBzdGFydCArIHNpemU7DQo+ID4gKyAgICBpZiAoIG51bV9ub2RlX21lbWJsa3MgPj0g
TlJfTk9ERV9NRU1CTEtTICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBkcHJpbnRrKFhFTkxP
R19XQVJOSU5HLA0KPiA+ICsgICAgICAgICAgICAgICAgIlRvbyBtYW55IG51bWEgZW50cnksIHRy
eSBiaWdnZXIgTlJfTk9ERV9NRU1CTEtTIFxuIik7DQo+ID4gKyAgICAgICAgYmFkX3NyYXQoKTsN
Cj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAg
ICAvKiBJdCBpcyBmaW5lIHRvIGFkZCB0aGlzIGFyZWEgdG8gdGhlIG5vZGVzIGRhdGEgaXQgd2ls
bCBiZSB1c2VkDQo+IGxhdGVyICovDQo+ID4gKyAgICBpID0gY29uZmxpY3RpbmdfbWVtYmxrcyhz
dGFydCwgZW5kKTsNCj4gPiArICAgIC8qIE5vIGNvbmZsaWN0aW5nIG1lbW9yeSBibG9jaywgd2Ug
Y2FuIHNhdmUgaXQgZm9yIGxhdGVyIHVzYWdlICovOw0KPiA+ICsgICAgaWYgKCBpIDwgMCApDQo+
ID4gKyAgICAgICAgZ290byBzYXZlX21lbWJsazsNCj4gPiArDQo+ID4gKyAgICBpZiAoIG1lbWJs
a19ub2RlaWRbaV0gPT0gbm9kZSApIHsNCj4gDQo+IFhlbiBjb2Rpbmcgc3R5bGUgaXMgdXNpbmc6
DQo+IA0KPiBpZiAoIC4uLiApDQo+IHsNCj4gDQo+IE5vdGUgdGhhdCBJIG1heSBub3QgY29tbWVu
dCBvbiBhbGwgdGhlIG9jY3VyZW50cywgc28gcGxlYXNlIGNoZWNrIHRoZQ0KPiBvdGhlciBwbGFj
ZXMuDQo+IA0KDQpPay4NCg0KDQo+ID4gKyAgICAgICAgLyoNCj4gPiArICAgICAgICAgKiBPdmVy
bGFwcyB3aXRoIG90aGVyIG1lbWJsayBpbiB0aGUgc2FtZSBub2RlLCB3YXJuaW5nIGhlcmUuDQo+
ID4gKyAgICAgICAgICogVGhpcyBtZW1ibGsgd2lsbCBiZSBtZXJnZWQgd2l0aCBjb25mbGljdGVk
IG1lbWJsayBsYXRlci4NCj4gPiArICAgICAgICAgKi8NCj4gPiArICAgICAgICBwcmludGsoWEVO
TE9HX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAgICAgIkRUOiBOVU1BIE5PREUgJXUgKCUiUFJJ
eDY0DQo+ID4gKyAgICAgICAgICAgICAgICItJSJQUkl4NjQiKSBvdmVybGFwcyB3aXRoIGl0c2Vs
ZiAoJSJQUkl4NjQiLQ0KPiAlIlBSSXg2NCIpXG4iLA0KPiA+ICsgICAgICAgICAgICAgICBub2Rl
LCBzdGFydCwgZW5kLA0KPiA+ICsgICAgICAgICAgICAgICBub2RlX21lbWJsa19yYW5nZVtpXS5z
dGFydCwgbm9kZV9tZW1ibGtfcmFuZ2VbaV0uZW5kKTsNCj4gPiArICAgIH0gZWxzZSB7DQo+ID4g
KyAgICAgICAgLyoNCj4gPiArICAgICAgICAgKiBDb25mbGljdCB3aXRoIG1lbWJsayBpbiBvdGhl
ciBub2RlLCB0aGlzIGlzIGFuIGVycm9yLg0KPiA+ICsgICAgICAgICAqIFRoZSBOVU1BIGluZm9y
bWF0aW9uIGlzIGludmFsaWQsIE5VTUEgd2lsbCBiZSB0dXJuIG9mZi4NCj4gPiArICAgICAgICAg
Ki8NCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUg0KPiA+ICsgICAgICAgICAgICAgICAi
RFQ6IE5VTUEgTk9ERSAldSAoJSJQUkl4NjQiLSUiDQo+ID4gKyAgICAgICAgICAgICAgIFBSSXg2
NCIpIG92ZXJsYXBzIHdpdGggTk9ERSAldSAoJSJQUkl4NjQiLSUiUFJJeDY0IilcbiIsDQo+ID4g
KyAgICAgICAgICAgICAgIG5vZGUsIHN0YXJ0LCBlbmQsIG1lbWJsa19ub2RlaWRbaV0sDQo+ID4g
KyAgICAgICAgICAgICAgIG5vZGVfbWVtYmxrX3JhbmdlW2ldLnN0YXJ0LCBub2RlX21lbWJsa19y
YW5nZVtpXS5lbmQpOw0KPiA+ICsgICAgICAgIGJhZF9zcmF0KCk7DQo+ID4gKyAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICtzYXZlX21lbWJsazoNCj4gPiAr
ICAgIG5kID0gJm5vZGVzW25vZGVdOw0KPiA+ICsgICAgaWYgKCAhbm9kZV90ZXN0X2FuZF9zZXQo
bm9kZSwgbWVtb3J5X25vZGVzX3BhcnNlZCkgKSB7DQo+ID4gKyAgICAgICAgbmQtPnN0YXJ0ID0g
c3RhcnQ7DQo+ID4gKyAgICAgICAgbmQtPmVuZCA9IGVuZDsNCj4gPiArICAgIH0gZWxzZSB7DQo+
ID4gKyAgICAgICAgaWYgKCBzdGFydCA8IG5kLT5zdGFydCApDQo+ID4gKyAgICAgICAgICAgIG5k
LT5zdGFydCA9IHN0YXJ0Ow0KPiA+ICsgICAgICAgIGlmICggbmQtPmVuZCA8IGVuZCApDQo+ID4g
KyAgICAgICAgICAgIG5kLT5lbmQgPSBlbmQ7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAg
cHJpbnRrKFhFTkxPR19JTkZPICJEVDogTlVNQSBub2RlICV1ICUiUFJJeDY0Ii0lIlBSSXg2NCJc
biIsDQo+ID4gKyAgICAgICAgICAgbm9kZSwgc3RhcnQsIGVuZCk7DQo+ID4gKw0KPiA+ICsgICAg
bm9kZV9tZW1ibGtfcmFuZ2VbbnVtX25vZGVfbWVtYmxrc10uc3RhcnQgPSBzdGFydDsNCj4gPiAr
ICAgIG5vZGVfbWVtYmxrX3JhbmdlW251bV9ub2RlX21lbWJsa3NdLmVuZCA9IGVuZDsNCj4gPiAr
ICAgIG1lbWJsa19ub2RlaWRbbnVtX25vZGVfbWVtYmxrc10gPSBub2RlOw0KPiA+ICsgICAgbnVt
X25vZGVfbWVtYmxrcysrOw0KPiA+ICsNCj4gPiArICAgIHJldHVybiAwOw0KPiA+ICt9DQo+ID4g
Kw0KPiA+ICAgLyogUGFyc2UgQ1BVIE5VTUEgbm9kZSBpbmZvICovDQo+ID4gICBpbnQgX19pbml0
IGRldmljZV90cmVlX3BhcnNlX251bWFfY3B1X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9k
ZSkNCj4gPiAgIHsNCj4gPiBAQCAtNzAsMyArMTQ1LDU4IEBAIGludCBfX2luaXQgZGV2aWNlX3Ry
ZWVfcGFyc2VfbnVtYV9jcHVfbm9kZShjb25zdA0KPiB2b2lkICpmZHQsIGludCBub2RlKQ0KPiA+
DQo+ID4gICAgICAgcmV0dXJuIGR0Yl9udW1hX3Byb2Nlc3Nvcl9hZmZpbml0eV9pbml0KG5pZCk7
DQo+ID4gICB9DQo+ID4gKw0KPiA+ICsvKiBQYXJzZSBtZW1vcnkgbm9kZSBOVU1BIGluZm8gKi8N
Cj4gPiAraW50IF9faW5pdA0KPiA+ICtkZXZpY2VfdHJlZV9wYXJzZV9udW1hX21lbW9yeV9ub2Rl
KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsDQo+ID4gKyAgICBjb25zdCBjaGFyICpuYW1lLCB1
aW50MzJfdCBhZGRyX2NlbGxzLCB1aW50MzJfdCBzaXplX2NlbGxzKQ0KPiANCj4gVGhpcyBpcyBw
cmV0dHkgbXVjaCBhIGNvcHkgb2YgcHJvY2Vzc19tZW1vcnlfbm9kZSgpLiBDYW4gd2UgY29uc2lk
ZXIgdG8NCj4gY29sbGVjdCB0aGUgTlVNQSBJRCBmcm9tIHRoZXJlPyBJZiBub3QsIGNhbiB3ZSBh
dCBsZWFzdCBhYnN0cmFjdCB0aGUgY29kZT8NCj4gDQoNCkkgaGFkIHRyaWVkIHRvIHBhcnNlIE5V
TUEgaWQgaW4gcHJvY2Vzc19tZW1vcnlfbm9kZSBvciBpbiBlYXJseV9zY2FuX25vZGUuDQpCdXQg
SSBmb3VuZCwgdGhpcyBjaGFuZ2Ugd291bGQgbWFrZSBOVU1BIGluaXQgY29kZSBpbiBkaWZmZXJl
bnQgcGxhY2VzLg0KQW5kIEkgcHJlZmVyIGEgdW5pZnkgTlVNQSBpbml0IGVudHJ5LiBCZWNhdXNl
IGl0IG1heSBiZSBnb29kIGZvcg0KbWFpbnRlbmFuY2UuIFdoZW4gd2Ugd2FudCB0byBkaXNhYmxl
IE5VTUEsIHdlIGp1c3QgbmVlZCB0byBkaXNhYmxlIGl0DQppbiBvbmUgcGxhY2UuIEJ1dCB5b3Un
cmUgcmlnaHQsIHdlIHN0aWxsIGNhbiBkbyBzb21lIGNvZGUgYWJzdHJhY3Rpb24uDQpJIHdpbGwg
ZG8gaXQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gK3sNCj4gPiArICAgIHVpbnQzMl90IG5pZDsN
Cj4gPiArICAgIGludCByZXQgPSAwLCBsZW47DQo+ID4gKyAgICBwYWRkcl90IGFkZHIsIHNpemU7
DQo+ID4gKyAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5ICpwcm9wOw0KPiA+ICsgICAgdWlu
dDMyX3QgaWR4LCByYW5nZXM7DQo+ID4gKyAgICBjb25zdCBfX2JlMzIgKmFkZHJlc3NlczsNCj4g
PiArDQo+ID4gKyAgICBuaWQgPSBkZXZpY2VfdHJlZV9nZXRfdTMyKGZkdCwgbm9kZSwgIm51bWEt
bm9kZS1pZCIsIE1BWF9OVU1OT0RFUyk7DQo+ID4gKyAgICBpZiAoIG5pZCA+PSBNQVhfTlVNTk9E
RVMgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiTm9k
ZSBpZCAldSBleGNlZWRzIG1heGltdW0gdmFsdWVcbiIsDQo+IG5pZCk7DQo+ID4gKyAgICAgICAg
cmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgcHJvcCA9IGZkdF9n
ZXRfcHJvcGVydHkoZmR0LCBub2RlLCAicmVnIiwgJmxlbik7DQo+ID4gKyAgICBpZiAoICFwcm9w
ICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPiAr
ICAgICAgICAgICAgICAgImZkdDogbm9kZSBgJXMnOiBtaXNzaW5nIGByZWcnIHByb3BlcnR5XG4i
LCBuYW1lKTsNCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgIH0NCj4gPiAr
DQo+ID4gKyAgICBhZGRyZXNzZXMgPSAoY29uc3QgX19iZTMyICopcHJvcC0+ZGF0YTsNCj4gPiAr
ICAgIHJhbmdlcyA9IGxlbiAvIChzaXplb2YoX19iZTMyKSogKGFkZHJfY2VsbHMgKyBzaXplX2Nl
bGxzKSk7DQo+ID4gKyAgICBmb3IgKCBpZHggPSAwOyBpZHggPCByYW5nZXM7IGlkeCsrICkNCj4g
PiArICAgIHsNCj4gPiArICAgICAgICBkZXZpY2VfdHJlZV9nZXRfcmVnKCZhZGRyZXNzZXMsIGFk
ZHJfY2VsbHMsIHNpemVfY2VsbHMsICZhZGRyLA0KPiAmc2l6ZSk7DQo+ID4gKyAgICAgICAgLyog
U2tpcCB6ZXJvIHNpemUgcmFuZ2VzICovDQo+ID4gKyAgICAgICAgaWYgKCAhc2l6ZSApDQo+ID4g
KyAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICsNCj4gPiArICAgICAgICByZXQgPSBkdGJfbnVt
YV9tZW1vcnlfYWZmaW5pdHlfaW5pdChuaWQsIGFkZHIsIHNpemUpOw0KPiA+ICsgICAgICAgIGlm
ICggcmV0ICkgew0KPiA+ICsgICAgICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICJOVU1BOiBwcm9jZXNzIHJhbmdlIyVkIGFkZHIgPSAlbHggc2l6
ZT0lbHgNCj4gZmFpbGVkIVxuIiwNCj4gDQo+IHMvJWQvJXUvIGFzIGlkeCBpcyBhbiB1bnNpZ25l
ZCBpbnQNCj4gcy8lbHgvJSJQUklfcGFkZHIiLyBhcyBhZGRyIGFuZCBzaXplIGFyZSBwYWRkcl90
Lg0KPiANCg0KT0sNCg0KPiA+ICsgICAgICAgICAgICAgICAgICAgaWR4LCBhZGRyLCBzaXplKTsN
Cj4gPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsg
ICAgfQ0KPiA+ICsNCj4gPiArICAgIGlmICggaWR4ID09IDAgKQ0KPiA+ICsgICAgew0KPiA+ICsg
ICAgICAgIHByaW50ayhYRU5MT0dfRVJSDQo+ID4gKyAgICAgICAgICAgICAgICJiYWQgcHJvcGVy
dHkgaW4gbWVtb3J5IG5vZGUsIGlkeD0lZCByZXQ9JWRcbiIsIGlkeCwNCj4gcmV0KTsNCj4gPiAr
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICByZXR1
cm4gMDsNCj4gPiArfQ0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3Jh
bGwNCg==

