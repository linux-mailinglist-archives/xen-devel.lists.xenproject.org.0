Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4626458C20
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 11:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228727.395839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6Mj-00084G-Tt; Mon, 22 Nov 2021 10:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228727.395839; Mon, 22 Nov 2021 10:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp6Mj-00081S-Pt; Mon, 22 Nov 2021 10:16:01 +0000
Received: by outflank-mailman (input) for mailman id 228727;
 Mon, 22 Nov 2021 10:16:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AbN=QJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1mp6Mh-00081M-Qj
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 10:16:00 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe02::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f51de12-4b7d-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 11:15:58 +0100 (CET)
Received: from AM6P193CA0133.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::38)
 by DBAPR08MB5638.eurprd08.prod.outlook.com (2603:10a6:10:1b2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Mon, 22 Nov
 2021 10:15:51 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::65) by AM6P193CA0133.outlook.office365.com
 (2603:10a6:209:85::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Mon, 22 Nov 2021 10:15:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 10:15:50 +0000
Received: ("Tessian outbound 1cd1a01725a6:v110");
 Mon, 22 Nov 2021 10:15:50 +0000
Received: from be4a1811ada0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 76295233-5245-4FC5-AAC2-3725A42E557D.1; 
 Mon, 22 Nov 2021 10:15:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be4a1811ada0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Nov 2021 10:15:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6408.eurprd08.prod.outlook.com (2603:10a6:20b:33a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 10:15:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 10:15:33 +0000
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
X-Inumbo-ID: 2f51de12-4b7d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0o4+xeyFmEZI/Ved9Hf6dxrBKPg6vV7JwUGVugDy97w=;
 b=sCfbAmc0Uz0xchU5b9avXf2k8u1IOok5XLg7hp8KMhFDApQnn1PvFLYsdWRFxjaBxn/DX0fOCuWxwfWXosqvhVHm/gR5SrXnSyyelWsJk5Rds4k+EkoJFgfCY4yIgDFJ2ntkWNiy1YjIjhcsnluyc82siwC/sEzk4+u6OQ5ebmU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e2e6e4b9efe8506
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kNtABQ/zewU5jg095qDxKxq1eXIPpz6x6hkN4icuXzDKXZFYR79EDanvRuZg/gLnb7hXtYWHL6m5EkBHsQZVqAhXNtwjv2BsgWZK5DAUfA6drLjOYolxgLzKPypupCwonhpWFc0cGEPPB/RD6DfJPve26xzKZejspe7whHeh0fGk1UTc4YtonMmW+2Kr/y5JWqzXdGLXfttzrldv7+BAywMrBnsdsovn/+ZPoIwR7tsfC2fkf5jfpRHHNjjpvagtUECchXqmEOn6SsE6I+AsPyikyw9BiwCf3VwJY/mU/HFFIkcWSRLtSgyNKcA5DebSpigJ6q/SHIMpYEEuzh+ymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0o4+xeyFmEZI/Ved9Hf6dxrBKPg6vV7JwUGVugDy97w=;
 b=QOu1hG3f1vY0LTGjuDejXhNgCpJxjif19kKqXzI7NfSMgRIg5aFnoGI4LIDofKqKSbgHSXsy+ifchGGE3Z1AFki9MvwBw0uxJcA/DG9GBWCHjoJ/0nXymhw13Jdq232ofTTexVHSTJt31NQ5mBfGpHi0tRifXYy/DqkxnVI1cSrEjd8X6DzQ8Eqcv5CFaJ+wgRBxhZz6+rpzmDJv8VNhldHq+kHGHqDjpcq2ZW2y1Z8GxHb+Iq86JoRcXs8fSdeTCH7ydifRCItbl+7N+zjS/7CFbfrp3GJ38PeTwEVTfF+aqN+oWeexw/+KU47gU0tU+zE9d/Vnj1qN//6bHLtQZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0o4+xeyFmEZI/Ved9Hf6dxrBKPg6vV7JwUGVugDy97w=;
 b=sCfbAmc0Uz0xchU5b9avXf2k8u1IOok5XLg7hp8KMhFDApQnn1PvFLYsdWRFxjaBxn/DX0fOCuWxwfWXosqvhVHm/gR5SrXnSyyelWsJk5Rds4k+EkoJFgfCY4yIgDFJ2ntkWNiy1YjIjhcsnluyc82siwC/sEzk4+u6OQ5ebmU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr <olekstysh@gmail.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Alistair Francis
	<alistair.francis@wdc.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, Dario Faggioli <dfaggioli@suse.com>, David Scott
	<dave@recoil.org>, Doug Goldstein <cardoe@cardoe.com>, Elena Ufimtseva
	<elena.ufimtseva@oracle.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Josh Whitehead
	<josh.whitehead@dornerworks.com>, Juergen Gross <jgross@suse.com>, Jun
 Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, Meng Xu <mengxu@cis.upenn.edu>, Nick
 Rosbrook <rosbrookn@ainfosec.com>, Paul Durrant <paul@xen.org>, Quan Xu
	<quan.xu0@gmail.com>, Rahul Singh <Rahul.Singh@arm.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Shriram Rajagopalan <rshriram@cs.ubc.ca>, Stewart Hildebrand
	<stewart.hildebrand@dornerworks.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Tim Deegan <tim@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Wei
 Liu <wl@xen.org>, Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Thread-Topic: [PATCH for-4.16 2/2] CHANGELOG: add missing entries for work
 during the 4.16 release cycle
Thread-Index:
 AQHX25ke11bcLw+u/U2iOGdMJWqiNawJdpeAgAAXHgCAABlTAIAA2I0AgAAaeACABMKEAA==
Date: Mon, 22 Nov 2021 10:15:32 +0000
Message-ID: <90A25CDC-52F4-4520-A911-6B7381EF2FF0@arm.com>
References: <20211117095338.14947-1-roger.pau@citrix.com>
 <20211117095338.14947-3-roger.pau@citrix.com>
 <CAPD2p-nb7u7om7zv5-KvfZTsmGis9uGfBkvwjEXrym_+4PN-RQ@mail.gmail.com>
 <YZaOgGWfbDkIq4Lq@Air-de-Roger>
 <d4f3d50d-9875-f7bf-2c82-83f8fedb8cfc@gmail.com>
 <YZdZZsgXjZv/rh66@Air-de-Roger>
 <41554b67-552b-3e44-9e5e-f7e493ebf615@gmail.com>
In-Reply-To: <41554b67-552b-3e44-9e5e-f7e493ebf615@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ffad191d-b769-4647-3466-08d9ada10f51
x-ms-traffictypediagnostic: AS8PR08MB6408:|DBAPR08MB5638:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5638D86F7CF6539B0D21EF729D9F9@DBAPR08MB5638.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 trCB+ePrlyGS4568QR6LIwq54ZAxwLKZ6d1ed2wYloIYPE2DUgYpSHqI/EwWuLGYP+bBQ/fUT3GJEdugC1Y+T3yVA6WXBPDzFCBRK33eYnFsccgaZSgNL6ZfA7GpSYMfU+M0zu/SH90edH4pBnLLin/jGQmVMYBHO93a9C8Ot0gfCjIZ2gtx2jJzGTIFe90lHqypQwqfXiBWd1C8TagDhcuk+uCUgzI/8SyLna3xNoHKI47q6i7KFCzKqV2C4+qb74+eJ/AgffMF5Q61VO9xB186tk1Kpavhjfg/ZWuWyCqisE0ZJF+C6VF7sczkw77v6h0cvDzWLfeBdoKkVqTXokoFZYRQz3bv6ORjy5lgbYOVdI21w+6qNXV2RpLUwqwQjAUx7X7kYgMbqD9Ao6Nt8vpwupzN8vQ7YcaLWKAAFZhKYG39YrNxH9hH+LnDsRYRgbKGjWsA3nXhRtoFMnIfPri9Cm6M1FknkGgiJAdU9/pSiwSSb3vvk/fWNujUyVOu11hNtGSQFXVEu52G1RjOlZGAFxeVms4Cii7NDJO4ATaDfacpKaEx3SWI6SdUxr03IoPKFxfzGseh/ORM73085ysokZ6q1P9SK/ISv9LaBfdbhMpVKqZVvdEr6uqQAP5YnlfvIoLUb4aMZaSkUv/0RT9xOg/n4fXf3H8tu0OVbPqlN2vCdJA9Brfk0PukEJ9SZeCucDmx3Xg8nlQIRxyPi2tCXixUl6TLa79S74U8OZv6bGHAPeuUXhwIzeTKqJtpuhdjw25SYNlZN66UxAJSNlE2Q/Li1DYnxkSDpxqtw0ZzKN9IH0zNdo8pGiomaRFZCfrcxl0D2Ke840HehMdXr+oRm7hHINwAik+1eVKVeZlkW61WzD0E4J+yyyD2bzav
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(8936002)(508600001)(5660300002)(966005)(66946007)(33656002)(2616005)(64756008)(38070700005)(54906003)(6512007)(76116006)(26005)(86362001)(186003)(2906002)(53546011)(38100700002)(6916009)(66446008)(7416002)(66556008)(83380400001)(36756003)(8676002)(66476007)(4326008)(316002)(7406005)(6506007)(71200400001)(6486002)(91956017)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F5F92B16EEFD444AECECC433479DE95@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6408
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a1dfa96-b00f-4034-d1e1-08d9ada104f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C4SCHcpFWwK77pC2SqRt2kU9EIXdbxNtXWrELFXUxiiARyAcyLqTuk6vyQQgtqNPuqLVfEJ9yUYSOjmzbCotrqkjF87usezGds59OTweGIwtttRnzIdsqI4g4j5Hl0es3kjfHUPJ8hrsVgQ5wdCUfK/QJa6RtBw5pYRfMCBEV+eWFvCXHFzJpxI4IQ6e2loxSZyulKIAmsVzMekZaHFwF3RGgL93KOKIJZY6XMbp1czkrQ6uhte1MQIvXBrYHTbXNaKps9L+y+WAWDyn3TriKaVU0YRP/y6BiS2qWcOaSM9u6JJzzofvr95j/861XNsCBWktO7EuKD74TWjAmGBthynmkzml3E2Atw0Eh2oySan5eAK62uYpGHgMvQTQmYmXGCu73Z+Jm50y4iRtSSgOcKPaT4JMjfP85hXH6vjzH/NeTAG6VUh0tESjL9P0FOXWxngTqvEZEKqMghM6Wl6ngCC1uWfhg8tUEUNi1fV+/B0E64NPdLaA6N9Vv7prm2ILQaX5R2nOQZ6EGEjT4F+ZjeMQ/JNeVh5GuL+xzRjjPs3U5j0zamLFd93IAa0QLg0RziE63Mbw/C/EZjyFvaw7AOSfxsrOMfO1zcOB+6mQGJkYQv0rJyZIYnrGVSJ4gmGSL4npiN04BwXZWHDLQoxwmydyOY1gujBJVt80MT4la6sbJING5v/zikWm/6cnqQvOcsg/38M3OqR3XA/YgVAl+mg3lL3y2aKB/tpnT90szqGiYybHU8AKVa6cgA3v3thNvGWpARdOwmnY2mlSggKHqUhyMio9wlESpZdjunECqq9vp2M8xj//e2/dRGc3gNTNsTP4eHBDDKhyuZF+OxaEemeFMq98VDt1dCxMNoAM2KM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(54906003)(26005)(8676002)(70206006)(53546011)(70586007)(186003)(966005)(5660300002)(356005)(36860700001)(8936002)(82310400003)(2906002)(86362001)(6486002)(316002)(36756003)(83380400001)(336012)(6512007)(81166007)(33656002)(6506007)(508600001)(6862004)(47076005)(2616005)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 10:15:50.7026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffad191d-b769-4647-3466-08d9ada10f51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5638

SGksDQoNCj4gT24gMTkgTm92IDIwMjEsIGF0IDA5OjM0LCBPbGVrc2FuZHIgPG9sZWtzdHlzaEBn
bWFpbC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDE5LjExLjIxIDA5OjU5LCBSb2dlciBQYXUg
TW9ubsOpIHdyb3RlOg0KPiANCj4gSGkgUm9nZXIsIGFsbA0KPiANCj4gDQo+PiBPbiBUaHUsIE5v
diAxOCwgMjAyMSBhdCAwOTowNDozMFBNICswMjAwLCBPbGVrc2FuZHIgd3JvdGU6DQo+Pj4gT24g
MTguMTEuMjEgMTk6MzMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgUm9n
ZXINCj4+PiANCj4+PiANCj4+Pj4gT24gVGh1LCBOb3YgMTgsIDIwMjEgYXQgMDY6MTE6MDdQTSAr
MDIwMCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+Pj4+PiBPbiBXZWQsIE5vdiAxNywg
MjAyMSBhdCAxMTo1NCBBTSBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0K
Pj4+Pj4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IEhpIFJvZ2VyLCBhbGwNCj4+Pj4+IA0KPj4+Pj4g
W1NvcnJ5IGZvciB0aGUgcG9zc2libGUgZm9ybWF0IGlzc3Vlc10NCj4+Pj4+IA0KPj4+Pj4gRG9j
dW1lbnQgc29tZSBvZiB0aGUgcmVsZXZhbnQgY2hhbmdlcyBkdXJpbmcgdGhlIDQuMTYgcmVsZWFz
ZSBjeWNsZSwNCj4+Pj4+PiBsaWtlbHkgbW9yZSBlbnRyaWVzIGFyZSBtaXNzaW5nLg0KPj4+Pj4+
IA0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+ICAgQ0hBTkdFTE9HLm1kIHwgMTEgKysrKysrKysr
KysNCj4+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+Pj4+Pj4gDQo+
Pj4+Pj4gZGlmZiAtLWdpdCBhL0NIQU5HRUxPRy5tZCBiL0NIQU5HRUxPRy5tZA0KPj4+Pj4+IGlu
ZGV4IGFkMWE4YzJiYzIuLjhiMGJkZDljZjAgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvQ0hBTkdFTE9H
Lm1kDQo+Pj4+Pj4gKysrIGIvQ0hBTkdFTE9HLm1kDQo+Pj4+Pj4gQEAgLTIxLDYgKzIxLDE3IEBA
IFRoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tlZXAgYSBDaGFuZ2Vsb2ddKA0KPj4+Pj4+IGh0dHBz
Oi8va2VlcGFjaGFuZ2Vsb2cuY29tL2VuLzEuMC4wLykNCj4+Pj4+PiAgICAtIHFlbXUtdHJhZGl0
aW9uYWwgYmFzZWQgZGV2aWNlIG1vZGVscyAoYm90aCwgcWVtdS10cmFkaXRpb25hbCBhbmQNCj4+
Pj4+PiBpb2VtdS1zdHViZG9tKSB3aWxsDQo+Pj4+Pj4gICAgICBubyBsb25nZXIgYmUgYnVpbHQg
cGVyIGRlZmF1bHQuIEluIG9yZGVyIHRvIGJlIGFibGUgdG8gdXNlIHRob3NlLA0KPj4+Pj4+IGNv
bmZpZ3VyZSBuZWVkcyB0bw0KPj4+Pj4+ICAgICAgYmUgY2FsbGVkIHdpdGggIi0tZW5hYmxlLXFl
bXUtdHJhZGl0aW9uYWwiIGFzIHBhcmFtZXRlci4NCj4+Pj4+PiArIC0gRml4ZXMgZm9yIGNyZWRp
dDIgc2NoZWR1bGVyIHN0YWJpbGl0eSBpbiBjb3JuZXIgY2FzZSBjb25kaXRpb25zLg0KPj4+Pj4+
ICsgLSBPbmdvaW5nIGltcHJvdmVtZW50cyBpbiB0aGUgaHlwZXJ2aXNvciBidWlsZCBzeXN0ZW0u
DQo+Pj4+Pj4gKyAtIHZ0cG1tZ3IgbWlzY2VsbGFuZW91cyBmaXhlcyBpbiBwcmVwYXJhdGlvbiBm
b3IgVFBNIDIuMCBzdXBwb3J0Lg0KPj4+Pj4+ICsgLSAzMmJpdCBQViBndWVzdHMgb25seSBzdXBw
b3J0ZWQgaW4gc2hpbSBtb2RlLg0KPj4+Pj4+ICsgLSBJbXByb3ZlZCBQVkggZG9tMCBkZWJ1ZyBr
ZXkgaGFuZGxpbmcuDQo+Pj4+Pj4gKyAtIEZpeCBib290aW5nIG9uIHNvbWUgSW50ZWwgc3lzdGVt
cyB3aXRob3V0IGEgUElUIChpODI1NCkuDQo+Pj4+Pj4gDQo+Pj4+PiBJIHdvdWxkIGFkZCAiVmFy
aW91cyBmaXhlcyBmb3IgT1AtVEVFIG1lZGlhdG9yIChBcm0pIiBoZXJlIGFuZCAuLi4NCj4+Pj4+
IA0KPj4+Pj4gDQo+Pj4+PiANCj4+Pj4+PiArDQo+Pj4+Pj4gKyMjIyBBZGRlZA0KPj4+Pj4+ICsg
LSAzMmJpdCBBcm0gYnVpbGRzIHRvIHRoZSBhdXRvbWF0ZWQgdGVzdHMuDQo+Pj4+Pj4gKyAtIE5l
dyB4ODYgcGFnZXRhYmxlIEFQSXMuDQo+Pj4+Pj4gKyAtIEFybSB2UE1VIHN1cHBvcnQuDQo+Pj4+
Pj4gDQo+Pj4+PiAiRXh0ZW5kZWQgcmVnaW9ucyBzdXBwb3J0LCBkZXZpY2UgdHJlZSBvbmx5IChB
cm0pIiBoZXJlLg0KPj4+Pj4gDQo+Pj4+PiAuLi4NCj4+Pj4+IFRoZSBleHRlbmRlZCByZWdpb25z
IGFyZSByYW5nZXMgb2YgdW51c2VkIGFkZHJlc3Mgc3BhY2UgZXhwb3NlZCB0byBkb21haW5zDQo+
Pj4+PiBhcw0KPj4+Pj4gInNhZmUgdG8gdXNlIiBmb3Igc3BlY2lhbCBtZW1vcnkgbWFwcGluZ3Mu
DQo+Pj4+IEkndmUgd29yZGVkIHRoaXMgYXM6DQo+Pj4+IA0KPj4+PiAiUmVwb3J0IHVucG9wdWxh
dGVkIG1lbW9yeSByZWdpb25zIHNhZmUgdG8gdXNlIGZvciBmb3JlaWduIG1hcHBpbmdzLA0KPj4+
PiBBcm0gYW5kIGRldmljZSB0cmVlIG9ubHkuIg0KPj4+PiANCj4+Pj4gQXMgImV4dGVuZGVkIHJl
Z2lvbnMiIHdhcyBJTU8gdG9vIHZhZ3VlLiBMZXQgbWUga25vdyBpZiB0aGF0J3MgT0suDQo+Pj4g
SSB0aGluaywgaXQgaXMgT0suIE5pdDogbWF5YmUgcmVwbGFjZSAiZm9yZWlnbiIgd2l0aCAiZm9y
ZWlnbi9ncmFudCI/IEkNCj4+PiB3b3VsZCBiZSBPSyBlaXRoZXIgd2F5Lg0KPj4gTWF5YmUsIEkg
d291bGQgY29uc2lkZXIgZ3JhbnRzIGFzIGZvcmVpZ24gbWFwcGluZ3MgYWxzbywgaWU6IHRoZQ0K
Pj4gbWVtb3J5IGlzIGZvcmVpZ24gdG8gdGhlIGRvbWFpbiwgYnV0IEkgY2FuIHNlZSB0aGlzIGJl
aW5nIGNvbmZ1c2luZyBhcw0KPj4gd2UgaGF2ZSBhIHNwZWNpZmljIGtpbmQgb2YgbWFwcGluZ3Mg
dGhhdCBhcmUgbmFtZWQgZm9yZWlnbi4NCj4+IA0KPj4gRG9lcyByZXBsYWNpbmcgZm9yZWlnbiB3
aXRoIGV4dGVybmFsIHNlZW0gYmV0dGVyPw0KPiANCj4gRmluZSB3aXRoIG1lLCB0aGFuayB5b3Uu
DQo+IA0KPiANCj4gQlRXLCBJIG5vdGljZWQgdGhhdCAiU3VwcG9ydCBvZiBnZW5lcmljIERUIElP
TU1VIGJpbmRpbmdzIGZvciBTTU1VIFYyIChBcm0pIiBpcyBub3QgbWVudGlvbmVkLiBMb29rcyBs
aWtlIHRoZSBzdXBwb3J0IGhhcyByZWFjaGVkIHVwc3RyZWFtIGR1cmluZyB0aGUgNC4xNiByZWxl
YXNlIGN5Y2xlLCBzbyB3b3J0aCBhZGRpbmcgaGVyZS4NCg0KWWVzIHlvdSBhcmUgcmlnaHQgdGhp
cyBzaG91bGQgYmUgYWRkZWQuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQEp1bGllbiwg
QFN0ZWZhbm8/DQo+IA0KPiANCj4gDQo+IA0KPiANCj4+IA0KPj4gVGhhbmtzLCBSb2dlci4NCj4g
DQo+IC0tIA0KPiBSZWdhcmRzLA0KPiANCj4gT2xla3NhbmRyIFR5c2hjaGVua28NCg0K

