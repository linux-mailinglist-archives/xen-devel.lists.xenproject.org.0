Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 344B73ECE12
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 07:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167119.305047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFVAD-00086w-CS; Mon, 16 Aug 2021 05:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167119.305047; Mon, 16 Aug 2021 05:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFVAD-00084f-9N; Mon, 16 Aug 2021 05:27:57 +0000
Received: by outflank-mailman (input) for mailman id 167119;
 Mon, 16 Aug 2021 05:27:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eR/w=NH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mFVAB-00084Z-Rr
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 05:27:55 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f232ad1-a9a6-4040-88c2-4599b4eb6673;
 Mon, 16 Aug 2021 05:27:53 +0000 (UTC)
Received: from AM6PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:20b:f0::49)
 by AM0PR08MB4098.eurprd08.prod.outlook.com (2603:10a6:208:12f::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Mon, 16 Aug
 2021 05:27:50 +0000
Received: from AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::19) by AM6PR04CA0072.outlook.office365.com
 (2603:10a6:20b:f0::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17 via Frontend
 Transport; Mon, 16 Aug 2021 05:27:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT033.mail.protection.outlook.com (10.152.16.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Mon, 16 Aug 2021 05:27:50 +0000
Received: ("Tessian outbound 56612e04f172:v103");
 Mon, 16 Aug 2021 05:27:49 +0000
Received: from e1b6e626f001.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA80B89A-AD79-4F85-A589-80398AD1E264.1; 
 Mon, 16 Aug 2021 05:27:43 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1b6e626f001.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Aug 2021 05:27:43 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB4976.eurprd08.prod.outlook.com (2603:10a6:803:105::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Mon, 16 Aug
 2021 05:27:40 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4415.022; Mon, 16 Aug 2021
 05:27:40 +0000
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
X-Inumbo-ID: 0f232ad1-a9a6-4040-88c2-4599b4eb6673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQbwQzP/Vhqpq9jFB656TS0YekquWI1007vKKnp85jM=;
 b=4iMoY3ums6O7WS1P/DOUExHNNyq7zFzmQZ7JU4GUEcZ6CKsjChHTQzIP2wmD5QLIFCquja4y1kohR33Va2QtuGDqN7E+P+YtjWqqYEFw1gz7rPrqvFwgDCZ7hCii6Jt/gMCDiZxB84U+i2sDBrhl4FXcJ/itsfCydnEhqLStV0Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imCgqtu/ny0B9QF+/Mlh5OKD1zrJbaEyAknaHUbPgWr3u8ZE7kLqaPw7uNLh13IeBwKaYMgVaa1BgG+nsWldVlqGVQ3RVsKYDWkHVgmlNNCujIbHqb7PeKH2BhMTAz+NCeuiJl4filVlwlkrUWGEykN+8MrXzF5ilN0pIaJNMwqNruxCiLC1sw+ow9EhO5B8J59iCidVsyPVgCEb2i4/bXEWgkeEkktf9aNSpR3gMHuh6aGRg1v5S604iu8FVrioNfBtlNKba/qK9rHuQeEJhad4EV8Fd6p7bbhrwo4w2LR4g+Iv6I1CQJc+dsn5JrD4QCV9VTpqrqlEtV50Hu3M0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQbwQzP/Vhqpq9jFB656TS0YekquWI1007vKKnp85jM=;
 b=WdR+NbgqXBDWYimOWUhkX6dS7p7ZuSjn/IWC4zwLoRgQPhSQAuJu8csMIDx8HcjapDauVvNi+tmCwN2ni6HIiMkhvm1Fzq6usSxFVgMcwosg10hGSEJT9SpTkQmsGJFHdbvRQEXih1+ApUijewf4H0dOgs+zon6g+bvKZSO6JZjsHE6/YxyC9aEfnV4/ft7MyXmB3rjmGXZ2hA2a9GlQ6rwJKOh+OxQU/xBZpggMRf6XaU2/6vTAvLxBiqpYqxSMJdE5Vih4MzkLj6DToRYkq4I19FQja85xKQEJMwIiuVjzKc+wqqLMLAEOtD6MUGgHHsxRU8tT9LgyTTBeyX5xag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQbwQzP/Vhqpq9jFB656TS0YekquWI1007vKKnp85jM=;
 b=4iMoY3ums6O7WS1P/DOUExHNNyq7zFzmQZ7JU4GUEcZ6CKsjChHTQzIP2wmD5QLIFCquja4y1kohR33Va2QtuGDqN7E+P+YtjWqqYEFw1gz7rPrqvFwgDCZ7hCii6Jt/gMCDiZxB84U+i2sDBrhl4FXcJ/itsfCydnEhqLStV0Y=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH V4 02/10] xen/arm: introduce new helper
 device_tree_get_meminfo
Thread-Topic: [PATCH V4 02/10] xen/arm: introduce new helper
 device_tree_get_meminfo
Thread-Index: AQHXg5tWRKlXTTX13kmrw+bRqBLzp6tuZDkAgAdTFRA=
Date: Mon, 16 Aug 2021 05:27:40 +0000
Message-ID:
 <VE1PR08MB5215312E34AC5F1D15CA21F2F7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-3-penny.zheng@arm.com>
 <9c4ca259-1a9d-be2c-dd5b-8456f1caaf6e@xen.org>
In-Reply-To: <9c4ca259-1a9d-be2c-dd5b-8456f1caaf6e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 73B2B1566614B0428CD19382C5902428.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6169ba95-1b3e-41a1-ae2c-08d9607696d1
x-ms-traffictypediagnostic: VE1PR08MB4976:|AM0PR08MB4098:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB40986523F93FCC8F4A4C501CF7FD9@AM0PR08MB4098.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:595;OLM:595;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mS4OuemyR4OYwk6Lgh+6vzWmr7UMRCc9ZZTAU0bDIsHYaMKrF8m+6+XRJvXsQK4yEbHQWs2QTdy+l+EvdeDQvJjMdRfk2X2dANbbqEqDII7WG9bsa0dDZJcQ6g/LMFkvJrSc6NNgmnNx/2xy8FR8idtsY2CpqRle+H/qAHtsZyzFjYcrRZyP5e7W2R18byFw/10xKdPYM1j6rdzuBU4Nbk5bD6oXVBzUXq4vsmlm2FLbhK6h97IalbPtIbX23IKJUmcXTTSMpz191b/cjZlk6H9V2L+veDHSpQI3hGV7ovfqiy8sdDcexLIkhWTC2B3cASEcwI2AXZKV7oPwa2b0Cbt0UaXviXbDEYrv4/QnafAaLKSw1nyp/Fgdu7m+TShRkEzWnrL7uoYbeNnGKz/tulfTuyTefzO0folVXJLUA9H8DyhP5hnlaI+MXcX/goAHrAeGyY6UgTfPEOSSlfoyzbf+02cQac9Euz6n1igrnczzaDFPamztM1rxz6vEaOIvB1fgZ84TN0rv3uFtOUbn3oPEtTDlZIHlCMUhAWRSTIs1zkSNk18fl7c9EszZn26TLkuyzQ0UzPQrOx4vIVC4XFBObQMbqk5t4QDkjX2qMCsqccAQIN38hqOJy4HS7Yu3hSLIk58cck9t9wOs1Fbond/QmRuWNkaHKdI6G522xLUlAwAKCJ+M/DAkvC3PB8jyTQTM7mRe3j+cbQO1IiOOBw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(366004)(396003)(136003)(186003)(86362001)(53546011)(8936002)(66446008)(66556008)(66946007)(4744005)(64756008)(4326008)(66476007)(83380400001)(33656002)(8676002)(110136005)(54906003)(7696005)(2906002)(9686003)(38100700002)(316002)(76116006)(26005)(5660300002)(38070700005)(52536014)(6506007)(478600001)(55016002)(122000001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mm1NTnM3WlI3cis3S0hhSU1FWGxvWSswTGhIOGUyTDB3T1QzcmRYWWJ4S2RP?=
 =?utf-8?B?c3g2WnFXNmhobGszek0ybE5sWkM3MFJJYnluTVJmUVJ4dVVFalE0SUdWeWRN?=
 =?utf-8?B?K09jUXFkK0pmdy85MWtJUnJRSlRiUnpHQ250UElOdjZvRUJXck1zcGZKSGpL?=
 =?utf-8?B?MlFVTzdOS3M0VytRV3J0aWR6dGFIeXF6Q2p3OUlOZnBKcVI4YU9TTGt6d3RJ?=
 =?utf-8?B?SDlvWVFJaGhCTVh3UmllOTczNDJrVkhOZ0NsMWdpZlVpRXRnV29ndkNGMks4?=
 =?utf-8?B?b1M5MjVPVnRCa3dpamZ1bW00dmJGeGlSaXpqUmJlbUZKUVFpdDEwRG53ai9G?=
 =?utf-8?B?QzIyVFZXMW5XRmZJR2MrbnBtVXdNeVhWelhIU0VvVmc5VFF5Skh2cTc0YjRJ?=
 =?utf-8?B?M1BJdVcrQlhSMWlWRkUzN2ZvMWZ6QnEvWUtMaEVpVVNJcE53eXJvdEc3WHJ5?=
 =?utf-8?B?WmxnZHlrK2piUjM5bVpXM1ZpaWMyc0YzalMxZ0xuQkZ5UlBoSTduMVc1ckw1?=
 =?utf-8?B?UWxxS2o0c09CZ0pDemI2ejRaMHNYRVY5dGg3T0JIRE1sbVhqY0VseUhnQlpC?=
 =?utf-8?B?dUJackhDL1htMW5uTkRKZkZtcjE3TU5EbFlvbHFMUS9sb2ZxaW0rOUpWN1Zq?=
 =?utf-8?B?VVZKVXk0MVhxQVFaVTJEZk1iRU9HVlZOR3F0WkhUeGNtVm14Ky9ZK0dndGNh?=
 =?utf-8?B?bHd2ejVmQlA3RUMxU0g5MERNUHliV1NQR3dJeHEya09nUzFnMWlwQ1I3YURr?=
 =?utf-8?B?UklxK1RVYWQySDVSMk5oVEVsWStCNjlERmdZd2ZNNHZhdjlwM1M3L2g1eW42?=
 =?utf-8?B?NWN1dDNXQ0tsUmE2VmQzZGRGUWUzcTVNZWhXSURWdDFJVDNXYy9mYWRwc2N2?=
 =?utf-8?B?VTFqN2xXdjIway9HTUFYVnd4VmNmTlR6R3dwcEEzOHROR2E0OGRDMlpkbi8v?=
 =?utf-8?B?QjFPT20rbHYxOFgxMEoxaXdSZWhHNHJXbXl1RlFQTkx6Y3NmUFplUDRFUGZ1?=
 =?utf-8?B?Zjg0OE05dXNsV0MrQWljZFViMURGSDc1K1Q0UmZZRm8xY0JRbFdJTHI5UGto?=
 =?utf-8?B?emllamIxeTFaNGNHQkhGM1IzMWdobXRQQStRZWcvUER3RHlJNlA2akhaMlcy?=
 =?utf-8?B?K3k2N21Od1FOS1A2S0FCdndtdzhLN2k2YVpBQnZydkR5S0d1aFg4NkRlU1l2?=
 =?utf-8?B?cTk1OWJoT00zMTcxT2hFbC9JdVk1SzFwSWN1bTAwVUVyb1dwb0FPZG42dmVW?=
 =?utf-8?B?Z21TUW94NVdsNGFwdUhRbjRDaGZHcW1aeVdITG1yWU1FQ2Ywc0E2YUo0TTZm?=
 =?utf-8?B?RXVITXJ4T001NUNJbEJWY3NQUEFPc1NhVnNGTUU3VVA5Ym1MKzlxaC9yT3Nk?=
 =?utf-8?B?bE00b09DQlJRWnptVG44d3lwbFg5WXlLM002SUh5Q2Z4dGJ0T3AzSU9kcCsv?=
 =?utf-8?B?ekIwUkJtS1VGTUhXS0IvajlHQ3Zxcmd4RDhraGd6UmhGSXdsbXV5ZHFNN0xs?=
 =?utf-8?B?Nm5pSEpTZDRHUVhlakZXTnJ2VzF5Q0pLamRMU0E4RU1YZy94cFcyd3BvV1Zk?=
 =?utf-8?B?eWttSjJuT1lSTm0vWWFZRWhUcUtvUi80Y3V1WE9TRUJ1WW9NRUxvaGZucU9P?=
 =?utf-8?B?eUhtWWI5UGppVHNlcnJEUTJqY21IWUcvR3haSzZtUXFjK2M4cnk1VjFpN3Zn?=
 =?utf-8?B?ekw1d2Y0Y0VyM2pCUkF0Q2FWRWhtWEdsQWZueEI3elk1QVAwbHh5dElTT0Rq?=
 =?utf-8?Q?nAEFsCjjoD/+P0X5wocvnj0XFRcAY3anbfggA+9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4976
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5b914b2-1b57-4657-b5a6-08d9607690f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iUIZ2HFp8CVaySLq+6edPpu3iI8JnEYbiVfxAi/SyC0q+jvuwB9M/VNbxOtawk5yGMTvLhsopnxMUyn/FquXGXZwsBm2Gcx8uBYhRrAsy4z14SKtnb17fJ5CzQ/He2o62fV5dZl1/kbHM5XmX96trqobyWn4gi2n/184wsBbBSpfoRAOFQWjJJZBryNuI+6f8S3fZKWPAgTfHDUdjEDQ9p3OPhjYZlxquJIdC6AMBsrOGesAn9lY+8faOr1fBWJY02lkza36Pvk1/CpbhjfkR2LwMqM5bH1+ZBWdpcfgHwH8kD034DdOYEfLP7vA0xXpxXCKPXDC2TBqbigLUQpvmQj09f2btvWQq3++kLd0A23no3kWfCCBkvzMsr4zL1uCvG16pPld7q5WrEWLr9u5OODrMkNS6tKzc2OgmFk1vhmCEN+K/Grk9ssgXFi5qvmZMxnDCqrLT93p7cdpqFKOn52hY8iXS2eobeNMWAjE2KvUJ1lplBRTxDXRZe0xqWphjjwbilgU2OkD7Ac2GnLnse/YqqF2Ar6aecjNioJfKjB6aKYTOctLF5+HIvGV64pG+tdw4Jp0C1UKGOqRRGLyYSzowsz+wox+ediUsOa0KIm2OP3evuLvtbwe6s5P5JgZ9/iPRprEdH5OGJ/+GgfGIspg3dy1z+D41uENVv+7bNBhRGBaoN5mLwoL9Vfz2q6maGiWuMaDDKTREcVngC6plw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(346002)(396003)(136003)(376002)(46966006)(36840700001)(5660300002)(2906002)(316002)(54906003)(110136005)(47076005)(7696005)(52536014)(336012)(36860700001)(82310400003)(82740400003)(478600001)(53546011)(33656002)(9686003)(55016002)(8936002)(81166007)(6506007)(4326008)(70206006)(70586007)(86362001)(186003)(356005)(83380400001)(8676002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 05:27:50.1727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6169ba95-1b3e-41a1-ae2c-08d9607696d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4098

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMTEsIDIw
MjEgOTozNSBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4g
Q2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVu
DQo+IDxXZWkuQ2hlbkBhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggVjQgMDIvMTBdIHhlbi9hcm06IGludHJvZHVjZSBuZXcgaGVscGVyDQo+IGRldmljZV90
cmVlX2dldF9tZW1pbmZvDQo+IA0KPiBIaSBQZW5ueSwNCj4gDQo+IE9uIDI4LzA3LzIwMjEgMTE6
MjcsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEEgZmV3IGZ1bmN0aW9ucyBpdGVyYXRlIG92ZXIg
dGhlIGRldmljZSB0cmVlIHByb3BlcnR5IHRvIGdldCBtZW1vcnkNCj4gPiBpbmZvLCBsaWtlICJy
ZWciIG9yICJ4ZW4sc3RhdGljLW1lbSIsIHNvIHRoaXMgY29tbWl0IGNyZWF0ZXMgYSBuZXcNCj4g
PiBoZWxwZXIgZGV2aWNlX3RyZWVfZ2V0X21lbWluZm8gdG8gZXh0cmFjdCB0aGUgY29tbW9uIGNv
ZGVzLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFy
bS5jb20+DQo+IA0KPiBBaCwgdGhpcyBpcyB3aGVyZSB5b3UgZGlkIHRoZSBjb25zb2xpZGF0aW9u
LiBTb3JyeSwgSSBkaWRuJ3Qgbm90aWNlIHRoaXMgcGF0Y2guDQo+IA0KPiBJbiBnZW5lcmFsLCB3
ZSBhcmUgYXZvaWRpbmcgdG8gaW50cm9kdWNlIGNvZGUgYW5kIHRoZW4gcmV3b3JrIGl0IGluIHRo
ZSBzYW1lDQo+IHNlcmllcy4gSW5zdGVhZCwgdGhlIHJld29yayBpcyBkb25lIGZpcnN0IGFuZCB0
aGVuIHRoZSBmdW5jdGlvbiBpcyB1c2VkLg0KPiANCj4gU28gY2FuIHlvdSBtb3ZlIHRoaXMgcGF0
Y2ggZmlyc3Q/DQo+IA0KDQpUaHggZm9yIHRoZSBleHBsYW5hdGlvbi4gSSdsbCByZW9yZ2FuaXpl
LiA7KQ0KDQo+IENoZWVycywNCj4gDQo+IC0tDQoNCkNoZWVycywNCg0KUGVubnkNCg0KDQo+IEp1
bGllbiBHcmFsbA0K

