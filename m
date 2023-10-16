Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A003B7CADC4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617807.960847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPh6-0003W0-Qw; Mon, 16 Oct 2023 15:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617807.960847; Mon, 16 Oct 2023 15:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPh6-0003T6-Ny; Mon, 16 Oct 2023 15:39:48 +0000
Received: by outflank-mailman (input) for mailman id 617807;
 Mon, 16 Oct 2023 15:39:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UvS=F6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qsPh5-0003Rq-2r
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:39:47 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe16::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b2f8d0d-6c3a-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:39:45 +0200 (CEST)
Received: from DU2PR04CA0059.eurprd04.prod.outlook.com (2603:10a6:10:234::34)
 by VI1PR08MB10244.eurprd08.prod.outlook.com (2603:10a6:800:1bd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:39:42 +0000
Received: from DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::84) by DU2PR04CA0059.outlook.office365.com
 (2603:10a6:10:234::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34 via Frontend
 Transport; Mon, 16 Oct 2023 15:39:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT057.mail.protection.outlook.com (100.127.142.182) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Mon, 16 Oct 2023 15:39:41 +0000
Received: ("Tessian outbound 6d14f3380669:v211");
 Mon, 16 Oct 2023 15:39:41 +0000
Received: from 1f7612fbbae2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D0F70594-F0B7-49BB-AE93-0B8B00B88284.1; 
 Mon, 16 Oct 2023 15:39:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f7612fbbae2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 15:39:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7384.eurprd08.prod.outlook.com (2603:10a6:102:22f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:39:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:39:32 +0000
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
X-Inumbo-ID: 3b2f8d0d-6c3a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIp9N9DbZfpVRuMrjJLkj1L/fkwi55LmFSNiEbRjBJk=;
 b=cEE9T3Ou+QEFM0SV6jJBVkR8Mw8/7MMLlvuZs7eEXCj+SIWAJ2ceoYiK2e22cVQOuh+ChY3cx0OxtUfauT025mQZhJCLNquN0djyJrEF4VymUoFHZCE7qn2N5u6Ygop5px+EZ5RuBfD6DDo/5ghkSncPeTzBTw2E/VYk7Ke9lHA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2146fd723f00856f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeov6BP44bGzUfmqeXYcjkBQ1Kcp8t8Qun7srHEshrSIoWHqFOzl2Lh8MQSW4JWKNe3mTiqONTzyXJljtRI6FUJGgxX6Ax5Pj7BzicSARBgAwVqyIH9ijp5pDwVaOyvZ1kRK5zUYMlXuEhtqNQk/yKMBWrwHhw7g3tItZtscOJj9bY6cnfY9igD+jSpSSTgO/9I4Yhz0ISrqL/E7PHTYpV8UiQQ9AYQwo4kLBfV6d46fvOIUXngCMVkN9YbBlyWSo/gznRTwSAyx7pkCNh+tG30zYYTE1HN/OOMcJh7ebSExfI5OI2pqRaOD9dUNplkp+qzwIYQmlahXCMCVaWkL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIp9N9DbZfpVRuMrjJLkj1L/fkwi55LmFSNiEbRjBJk=;
 b=BdeeW900ufbCOkQT/WNqoL/B8JPFlXmpddExbG7yGziABrgt9ERIZ5O1XruWyjvhaPivDVOdvV+614gA1STj1Z55S5lPxrW1FA4wcOp+RSusUlHB3SRQhQ/TCSJdvwse14pDdveLs6eNvAtzKadgW4h9GjRFT6pqMrOSRfHOB5XzRdyz+vNBwIrLryKamN1qRT+jrxRf0au5/Twf1OaJrcRopr8BxGbyaKC1LwqrDCdCTN3bcSjFVQ+/mslSL2bwFMb31p1p2j5hZumSDRhRcoLcGFWsWXF5f7P5NjfDkZ1m4l5VOg5Ztf/41f9+9rMUAhfNlRbvBtowQN9WLrRVGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIp9N9DbZfpVRuMrjJLkj1L/fkwi55LmFSNiEbRjBJk=;
 b=cEE9T3Ou+QEFM0SV6jJBVkR8Mw8/7MMLlvuZs7eEXCj+SIWAJ2ceoYiK2e22cVQOuh+ChY3cx0OxtUfauT025mQZhJCLNquN0djyJrEF4VymUoFHZCE7qn2N5u6Ygop5px+EZ5RuBfD6DDo/5ghkSncPeTzBTw2E/VYk7Ke9lHA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Alexey Klimov <alexey.klimov@linaro.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	"leo.yan@linaro.org" <leo.yan@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <Rahul.Singh@arm.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Topic: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
Thread-Index:
 AQHZ/dCeetLGz4GvX0qAhZnpE9HtkrBMHj+AgABWt4CAAAGagIAAA68AgAADAgCAAAYrgIAABd6AgAAGqgCAAAJHgA==
Date: Mon, 16 Oct 2023 15:39:31 +0000
Message-ID: <E9128690-2C1E-47D8-AD94-682C4318E082@arm.com>
References: <20231013122658.1270506-1-leo.yan@linaro.org>
 <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com>
 <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
 <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com>
 <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
 <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
 <d3952200-9edb-4de0-94e3-c00c571a10b9@xen.org>
 <794B0D71-70A7-4546-98E0-EC01573E0D89@arm.com>
 <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
In-Reply-To: <990b21a3-f8c7-4d02-a8ac-63d31794a76d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB7384:EE_|DBAEUR03FT057:EE_|VI1PR08MB10244:EE_
X-MS-Office365-Filtering-Correlation-Id: 135dcf95-3beb-4fa3-449a-08dbce5e1d45
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UxM6FzAKTo0VawGE3aIJsubJpA9QkTJrZNQVi9ABDRAYzHheSMC4pQOU2z52DyMxwF+nfgUpZ9blDGx5Nmbjs2/DhoeEKhrbzBJx1wuAAGBEMbUDMnDJtHSWUPSoQh883E58a/AqxO6xTtAWJUVi8AXmbXNbhD1KAHy+vXot8ti/ThUkziOx5F0dJotbK79wesVQiaZIk2m3W6fIgZPBcnHM4npjHovl6xNtuJLFQnp3ZDof0y4CeDtLzALWg4h3wSqbE5CDzqroidzijfFeTxOlPk70Qm17PFlKEBBvuRYoF1wvpMUqedDN3IVJv5XbkhiCEEI8bV+RCl5si3GVk2tF+bliUa77udQQL6s2Giz9T0NmByXhlbnQ1zf3KOk9oGEkPpWDspVnzVkjjyQ7ylPzdUylUIVkIlRmvcbmh2Ddbw1fj7/cI1ImXs0bU48PauTHUevwx8HCfJvZZj3tsjaJIjmpIWOpE53q69IYxCiAkTrBy6Hen9kDyVevtWqPQO9Zo5o2tTAmQdifyB3fMYfEMQNe7qiuYpyBLanDIG5Nrjn6kev5JCBU//0aSYXLE+CZKIVXSp2YrXYrfEVQeW5Irc8LmuO8pzjNg3cP/F2WWmpzh1h80VbnL152k6E0QwmkzwT4dJfvzcdgpFM05mbZh304gBfewjHnAje6SRxeS9m6J0EPH1Jn0TZ5tl/t
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(316002)(478600001)(6916009)(91956017)(6486002)(76116006)(54906003)(64756008)(66446008)(66476007)(66556008)(66946007)(71200400001)(2616005)(53546011)(6506007)(26005)(6512007)(8676002)(8936002)(2906002)(4326008)(5660300002)(41300700001)(36756003)(33656002)(38070700005)(122000001)(86362001)(83380400001)(38100700002)(147533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D94AE6FF70844D4C88ED184D7A0A1549@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7384
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	253addf0-4ede-4bcc-6fe3-08dbce5e177f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HAabE1K7vKKDDGMOhIqokmGmdgAIB2XMpfrTv666BPGzRVp5Hwo+30bI4D2Q4BFxGoh1Z3pyyy6i/DkFqBxKD7p3oe5Nn4TL0E0yDF8mT/cNKwrFvDoBdNAJmGVSNZ4SfI2jovBNKW5ixlCa1TYoSxvmkYiGV1S8MK1CGZkN7Xudoi2SF8/KkJRE/h4e59ER05RRFnfpfUr+mAQx89sm1PeqkKSGfGhVwdRG+/TQITfneqa1Ld7DCdI67EfQKDFRE3Z/y1RvDh0b3kfGCmUDMbAXvfqMqWeam8/s3KJ744Ww9STHWjN8f2BAQ/UUpvNbERYQ67MW8qpFvPvKU9XeWpq/X09y0Hq0BKUxpbPZr5cgEAbIr7P54e5ZCRRU2InAbO7f70dZg0sJExdlkQARj4xr/APFuVYJ1S+a7y7/pS4VkPO1tFz95KQ0pqqIf/DhXYY5SxxsGzD43ZxTMgkYnSCJBdRQv8nvxlT19Z7pn0yaHPYxC2TgXYrROPnsbCBH9qQb/Xb1EB5KW4yYeDyUTIAYvKTswEAj/n0LG7yC5xM4Iz50APBSLQnKmTW+dAbFbAdksGiAX+vVnqZOJefoEiw4MFFRwAiBA69+DtRBhqQS5gSHq+75/s7UOP/+jlE4b88kPhQN4llGm606/i5eBMWjrHiEmDVBn9g9bpneDWvKIEJ6SAO7wwwDpoRO1AqXRfVomuAtYHukFz4ts/RUBjyk1SzKsVuvqApObPVDtLrGdlpKdJqmlmj/Di+UAdo01SeK8W6opcL+AmkO036bPw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(376002)(396003)(136003)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(82310400011)(36840700001)(46966006)(40470700004)(5660300002)(40460700003)(6486002)(36860700001)(316002)(41300700001)(54906003)(70586007)(70206006)(6862004)(8676002)(8936002)(4326008)(40480700001)(2616005)(33656002)(81166007)(83380400001)(26005)(6512007)(356005)(82740400003)(36756003)(2906002)(336012)(86362001)(47076005)(478600001)(53546011)(6506007)(147533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:39:41.5914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 135dcf95-3beb-4fa3-449a-08dbce5e1d45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10244

DQoNCj4gT24gMTYgT2N0IDIwMjMsIGF0IDE3OjMxLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTYvMTAvMjAyMyAxNjowNywgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+IEhpLA0KPj4+IE9uIDE2IE9jdCAyMDIzLCBhdCAxNjo0NiwgSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gQ0MgSGVucnkNCj4+
PiANCj4+PiBIaSBBbGV4ZXksDQo+Pj4gDQo+Pj4gT24gMTYvMTAvMjAyMyAxNToyNCwgQWxleGV5
IEtsaW1vdiB3cm90ZToNCj4+Pj4gT24gTW9uLCAxNiBPY3QgMjAyMyBhdCAxNToxMywgTHVjYSBG
YW5jZWxsdSA8THVjYS5GYW5jZWxsdUBhcm0uY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gDQo+
Pj4+PiANCj4+Pj4+PiBPbiAxNiBPY3QgMjAyMywgYXQgMTU6MDAsIEJlcnRyYW5kIE1hcnF1aXMg
PEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gSGkNCj4+
Pj4+PiANCj4+Pj4+PiArTHVjYSBhbmQgUmFodWwNCj4+Pj4+PiANCj4+Pj4+Pj4gT24gMTYgT2N0
IDIwMjMsIGF0IDE1OjU0LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+
Pj4+Pj4gDQo+Pj4+Pj4+IA0KPj4+Pj4+PiANCj4+Pj4+Pj4gT24gMTYvMTAvMjAyMyAwOTo0NCwg
TWljaGFsIE9yemVsIHdyb3RlOg0KPj4+Pj4+Pj4gSGksDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBIaSwN
Cj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBPbiAxMy8xMC8yMDIzIDE0OjI2LCBMZW8gWWFuIHdyb3RlOg0K
Pj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IE9uIEFETGluayBBVkEgcGxhdGZvcm0g
KEFtcGVyZSBBbHRyYSBTb0Mgd2l0aCAzMiBBcm0gTmVvdmVyc2UgTjEgY29yZXMpLA0KPj4+Pj4+
Pj4+IHRoZSBwaHlzaWNhbCBtZW1vcnkgcmVnaW9ucyBhcmU6DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+
Pj4gIERSQU0gbWVtb3J5IHJlZ2lvbnM6DQo+Pj4+Pj4+Pj4gICAgTm9kZVswXSBSZWdpb25bMF06
IDB4MDAwMDgwMDAwMDAwIC0gMHgwMDAwZmZmZmZmZmYNCj4+Pj4+Pj4+PiAgICBOb2RlWzBdIFJl
Z2lvblsxXTogMHgwODAwMDAwMDAwMDAgLSAweDA4MDA3ZmZmZmZmZg0KPj4+Pj4+Pj4+ICAgIE5v
ZGVbMF0gUmVnaW9uWzJdOiAweDA4MDEwMDAwMDAwMCAtIDB4MDgwN2ZmZmZmZmZmDQo+Pj4+Pj4+
Pj4gDQo+Pj4+Pj4+Pj4gVGhlIFVFRkkgbG9hZHMgWGVuIGh5cGVydmlzb3IgYW5kIERUQiBpbnRv
IHRoZSBoaWdoIG1lbW9yeSwgdGhlIGtlcm5lbA0KPj4+Pj4+Pj4+IGFuZCByYW1kaXNrIGltYWdl
cyBhcmUgbG9hZGVkIGludG8gdGhlIGxvdyBtZW1vcnkgc3BhY2U6DQo+Pj4+Pj4+Pj4gDQo+Pj4+
Pj4+Pj4gIChYRU4pIE1PRFVMRVswXTogMDAwMDA4MDdmNmRmMDAwMCAtIDAwMDAwODA3ZjZmM2Uw
MDAgWGVuDQo+Pj4+Pj4+Pj4gIChYRU4pIE1PRFVMRVsxXTogMDAwMDA4MDdmODA1NDAwMCAtIDAw
MDAwODA3ZjgwNTYwMDAgRGV2aWNlIFRyZWUNCj4+Pj4+Pj4+PiAgKFhFTikgTU9EVUxFWzJdOiAw
MDAwMDAwMGZhODM0MDAwIC0gMDAwMDAwMDBmYzVkZTFkNSBSYW1kaXNrDQo+Pj4+Pj4+Pj4gIChY
RU4pIE1PRFVMRVszXTogMDAwMDAwMDBmYzVkZjAwMCAtIDAwMDAwMDAwZmZiM2Y4MTAgS2VybmVs
DQo+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4gSW4gdGhpcyBjYXNlLCB0aGUgWGVuIGJpbmFyeSBpcyBs
b2FkZWQgYWJvdmUgOFRCLCB3aGljaCBleGNlZWRzIHRoZQ0KPj4+Pj4+Pj4+IG1heGltdW0gc3Vw
cG9ydGVkIGlkZW50aXR5IG1hcCBzcGFjZSBvZiAyVEIgaW4gWGVuLiBDb25zZXF1ZW50bHksIHRo
ZQ0KPj4+Pj4+Pj4+IHN5c3RlbSBmYWlscyB0byBib290Lg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+
IFRoaXMgcGF0Y2ggZW5sYXJnZXMgaWRlbnRpdHkgbWFwIHNwYWNlIHRvIDEwVEIsIGFsbG93aW5n
IG1vZHVsZSBsb2FkaW5nDQo+Pj4+Pj4+Pj4gd2l0aGluIHRoZSByYW5nZSBvZiBbMHgwIC4uIDB4
MDAwMDA5ZmZfZmZmZl9mZmZmXS4NCj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+PiBGaXhlczogMWM3OGQ3
NmI2NyAoInhlbi9hcm02NDogbW06IEludHJvZHVjZSBoZWxwZXJzIHRvIHByZXBhcmUvZW5hYmxl
L2Rpc2FibGUiKQ0KPj4+Pj4+Pj4gSSBkb24ndCB0aGluayBhIGZpeGVzIHRhZyBhcHBsaWVzIGhl
cmUgZ2l2ZW4gdGhhdCAyVEIgd2FzIGp1c3QgYSBudW1iZXIgd2UgYmVsaWV2ZWQgaXMgZW5vdWdo
DQo+Pj4+Pj4+PiBhbmQgYWxsIG9mIHRoaXMgaXMgcGxhdGZvcm0gZGVwZW5kZW50Lg0KPj4+Pj4+
Pj4gVGhpcyBjYW4gYmUgZHJvcHBlZCBvbiBjb21taXQgaWYgY29tbWl0dGVyIGFncmVlcw0KPj4+
Pj4+PiBYZW4gbWF5IGhhdmUgYm9vdGVkIG9uIHRoYXQgcGxhdGZvcm0gYmVmb3JlIGhhbmQuIFNv
IHRoaXMgd291bGQgYmUgY29uc2lkZXJlZCBhIHJlZ3Jlc3Npb24gYW5kIHRoZXJlZm9yZSBhIHRh
ZyB3b3VsZCBiZSB3YXJyYW50Lg0KPj4+Pj4+PiANCj4+Pj4+Pj4gQUZBSUNULCB0aGUgY29tbWl0
IGlzIG9ubHkgcHJlc2VudCBvbiB0aGUgdXBjb21pbmcgNC4xOC4gU28gdGhlIHF1ZXN0aW9uIGlz
IHdoZXRoZXIgWGVuIDQuMTcgYm9vdGVkIG91dC1vZi10aGUtYm94IG9uIEFETGluaz8gSWYgdGhl
IGFuc3dlciBpcyB5ZXMsIHRoZW4gd2UgbmVlZCB0byBhZGQgYSBGaXhlcyB0YWcuIEJ1dCB0aGUg
Y29ycmVjdCBvbmUgd291bGQgYmUNCj4+Pj4+Pj4gDQo+Pj4+Pj4gDQo+Pj4+Pj4gQFJhaHVsIG9y
IEx1Y2E6IGNvdWxkIHlvdSBnaXZlIGFuIGFuc3dlciBoZXJlID8NCj4+Pj4+PiBJIGtub3cgeW91
IHVzZWQgWGVuIG9uIGFuIEFWQSBwbGF0Zm9ybSBidXQgd2FzIGl0IGJvb3Rpbmcgb3V0IG9mIHRo
ZSBib3ggPw0KPj4+Pj4gDQo+Pj4+PiBJIGNhbuKAmXQgc2F5IGZvciBYZW4gNC4xNywgYnV0IG91
ciBuaWdodGx5IGpvYiBoYXMgcnVuIHN1Y2Nlc3NmdWxseSBvbiBBVkEgZm9yIHRoZSBjb21taXQg
NzMwNDA2YWI4MTA5NDExNWQ5ZmI1Y2EwMGJhOGQ1M2NlYzEyNzliMw0KPj4+Pj4gKGRvY3MvbWlz
cmE6IGFkZCBkZXZpYXRpb25zLnJzdCB0byBkb2N1bWVudCBhZGRpdGlvbmFsIGRldmlhdGlvbnMu
KQ0KPj4+Pj4gDQo+Pj4+PiBXZSBhcmUgbm90IGFwcGx5aW5nIGFueSBwYXRjaCBmb3IgaXQgdG8g
cnVuIG9uIEFWQS4NCj4+Pj4gTW9zdCBsaWtlbHkgaXQgaXMgYmVjYXVzZSB5b3VyIFVFRkkvQklP
UyBmaXJtd2FyZSBpcyAyLngsIGZvciBpbnN0YW5jZQ0KPj4+PiAyLjA0LjEwMC4wNy4NCj4+Pj4g
VGhpcyBmaXggaWYgZm9yIEFWQSBtYWNoaW5lIHdpdGggb2xkZXIgVUVGSSBmaXJtd2FyZSAxLjA3
LjMwMC4wMy4NCj4+PiANCj4+PiBPT0ksIHdoeSBub3QgdXBkYXRpbmcgeW91ciBmaXJtd2FyZT8g
SSB3YXMgZXhwZWN0aW5nIHRoYXQgaXQgd291bGQgYWxzbyBjb250YWluIG90aGVyIGNyaXRpY2Fs
IGZpeGVzLg0KPj4+IA0KPj4+IFdpdGggdGhpcyBpbiBtaW5kLCBJIGFtIG5vdyBtb3JlIGluIHR3
byBtaW5kIHRvIGFzayB0byBtZXJnZSB0aGlzIHBhdGNoIGluIFhlbiA0LjE4LiBPbiBvbmUgaGFu
ZCwgSSB1bmRlcnN0YW5kIGl0IHdpbGwgaGVscCB0byBib290IG9uIEFWQSBtYWNoaW5lIHdpdGgg
YW4gb2xkZXIgZmlybXdhcmUuIEJ1dCBvbiB0aGUgb3RoZXIgaGFuZCB0aGlzIGlzIGNoYW5naW5n
IHRoZSBtZW1vcnkgbGF5b3V0IHF1aXRlIGxhdGUgaW4gdGhlIHJlbGVhc2UuIFRoZSByaXNrIHNl
ZW1zIGxpbWl0ZWQgYmVjYXVzZSBYZW4gaXMgbm90IGxvYWRlZCBhdCB0aGUgdG9wIG9mIHRoZSB2
aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgKHRoZXJlIGlzIHRoZSBkaXJlY3RtYXAgYWZ0ZXJ3YXJkcyku
DQo+Pj4gDQo+Pj4gSGVucnkgKGFzIHRoZSByZWxlYXNlIG1hbmFnZXIpIGFuZCBvdGhlcnMsIGFu
eSBvcGluaW9ucz8NCj4+IFdpdGggdGhlIG5ldyBpbmZvcm1hdGlvbiwgSSB0aGluayBpdCBzaG91
bGQgYmUgc3RhdGVkIHRoYXQgaXQgaXMgZml4aW5nIGFuIGlzc3VlIG9uIEFWQSBwbGF0Zm9ybXMg
dXNpbmcgYW4gb2xkIGZpcm13YXJlIGFuZCBwbGF0Zm9ybXMgd2l0aCBhbmQgdXAtdG8tZGF0ZSBm
aXJtd2FyZSBhcmUgbm90IGltcGFjdGVkLg0KPj4gSXQgaXMgYW4gaW1wb3J0YW50IGluZm9ybWF0
aW9uIHRvIGtlZXAgaW4gbWluZCB0aGF0IHRoaXMgaXMgbm90IGEgZml4IHRvIGJlIGJhY2twb3J0
ZWQgZm9yIGV4YW1wbGUgKGFuZCBmb3IgbWUgdGhlIGZpeGVzIHRhZyBzaG91bGQgbm90IGJlIGtl
cHQpLg0KPiANCj4gSU1ITywgdGhlIGZpeGVzIHRhZyBzaG91bGQgbm90IGJlIGJhc2VkIHNvbGVs
eSBvbiB0aGUgQVZBIHBsYXRmb3JtLiBJdCBzaG91bGQgYmUgYmFzZWQgb24gd2hldGhlciB0aGlz
IGNvdWxkIHNlbnNpYmx5IGFmZmVjdCBvdGhlcnMuIFJpZ2h0IG5vdywgdGhlcmUgaXMgbm90aGlu
ZyB0aGF0IHdvdWxkIGluZGljYXRlIGVpdGhlciB3YXkuDQo+IA0KPiBBbmQgdGhlcmVmb3JlIGEg
Rml4ZXMgdGFnIGlzIHNlbnNpYmxlLiBUaGlzIGRvZXNuJ3QgbWVhbiBJIHdvdWxkIHdhbnQgdG8g
YmFja3BvcnQgaXQgcmlnaHQgbm93IChub3RlIHRoYXQgb25seSA0LjE4IGlzIGFmZmVjdGVkKS4g
QnV0IHRoaXMgY291bGQgY2hhbmdlIGluIHRoZSBmdXR1cmUgaWYgd2UgZ2V0IGFub3RoZXIgcmVw
b3J0IChwb3N0LTQuMTgpIG9uIGEgcGxhdGZvcm0gd2hlcmUgdGhlcmUgYXJlIG5vIG90aGVyIHdv
cmthcm91bmQuDQo+IA0KPiBTdGVmYW5vIGFueSBvcGluaW9ucz8NCj4gDQo+PiBPbiB3aGV0aGVy
IG9yIG5vdCBpdCBzaG91bGQgZ28gaW4gdGhlIHJlbGVhc2UsIEkgYW0gbm90IHF1aXRlIHN1cmUg
dGhhdCBtYWtpbmcgYSBjaGFuZ2UgaW4gdGhlIGxheW91dCBhdCB0aGF0IHN0YWdlIGlzIGEgZ29v
ZCBpZGVhIHVubGVzcyBpdCBpcyBmaXhpbmcgYSBjcml0aWNhbCBpc3N1ZSAod2hpY2ggaXMgbm90
IHRoZSBjYXNlIGhlcmUpLg0KPj4gU28gaSB3b3VsZCB2b3RlIG5vIGJ1dCBub3QgZ28gYWdhaW5z
dCBpZiBzb21lb25lIGFyZ3VlIHRvIGhhdmUgaXQgaW4uDQo+IA0KPiBJIGFncmVlIHdpdGggeW91
ciBzdGF0ZW1lbnQgd2l0aCB0aGUgaW5mb3JtYXRpb24gd2UgaGF2ZSB0b2RheS4gQnV0IGl0IGNv
dWxkIGJlY29tZSBhIGNyaXRpY2FsIGlzc3VlIGlmIGFub3RoZXIgcGxhdGZvcm0gaXMgaGl0IGJ5
IHRoZSBzYW1lIGlzc3VlIGFuZCBoYXZlIG5vIG90aGVyIHdvcmthcm91bmQuDQoNCkkgYW0gbW9y
ZSBzZWVpbmcgdGhpcyBhcyBhZGRpbmcgc3VwcG9ydCBmb3IgcGxhdGZvcm1zIHdpdGggYSB0b3Bv
bG9neSB0aGF0IHdhcyBub3Qgc3VwcG9ydGVkIHVudGlsIG5vdyAoYmVjYXVzZSBpdCB3YXMgbm90
IGVuY291bnRlcmVkKSByYXRoZXIgdGhhbiBmaXhpbmcgYSBidWcgd2hpY2ggaXMgd2h5IGkgZmlu
ZCBpdCBhIGJpdCBvZGQgdG8gc2F5IHRoYXQgaXQgaXMgZml4aW5nIHNvbWUgaXNzdWUuIEJ1dCBk
ZWZpbml0ZWx5IHRoaXMgaXMgYW4gb3BpbmlvbiBhbmQgbm90aGluZyB0aGF0IGkgY291bGQgYXJn
dWUgb24gOi0pDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0g
DQo+IEp1bGllbiBHcmFsbA0KDQoNCg==

