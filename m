Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 769C033B49F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 14:33:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98022.185868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnL4-0004TZ-IY; Mon, 15 Mar 2021 13:32:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98022.185868; Mon, 15 Mar 2021 13:32:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLnL4-0004TA-Er; Mon, 15 Mar 2021 13:32:54 +0000
Received: by outflank-mailman (input) for mailman id 98022;
 Mon, 15 Mar 2021 13:32:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/z0=IN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lLnL2-0004T2-4e
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 13:32:52 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.66]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e0a5629-3ab3-4835-a70b-35d500469464;
 Mon, 15 Mar 2021 13:32:51 +0000 (UTC)
Received: from AS8PR04CA0035.eurprd04.prod.outlook.com (2603:10a6:20b:312::10)
 by DB6PR0801MB1733.eurprd08.prod.outlook.com (2603:10a6:4:37::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:32:46 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::54) by AS8PR04CA0035.outlook.office365.com
 (2603:10a6:20b:312::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31 via Frontend
 Transport; Mon, 15 Mar 2021 13:32:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.31 via Frontend Transport; Mon, 15 Mar 2021 13:32:46 +0000
Received: ("Tessian outbound 24a7072fdae6:v71");
 Mon, 15 Mar 2021 13:32:45 +0000
Received: from 3cb5440f8444.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6001EC4-F279-4CF1-B982-5D84BAB30535.1; 
 Mon, 15 Mar 2021 13:32:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3cb5440f8444.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Mar 2021 13:32:40 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5295.eurprd08.prod.outlook.com (2603:10a6:803:e3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 13:32:39 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 13:32:38 +0000
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
X-Inumbo-ID: 3e0a5629-3ab3-4835-a70b-35d500469464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGhOE4Py5arD3lbQI3F0gQPD07n7M5jkSpK9CzuCtLQ=;
 b=R0sWltPQf8wYbhIbdhHRvpBVyBFUp35/H1don1RvihocjGPP4CBGL+gW8CWhLhsTB6ThpY4SSH+W5LzDLSkMiK3670OzTdDp05etyroapRQ//wqo/tYdnl9qoFJLLntKMSlfiLTXUc5kRaautQbt3Ety0rokckPHFzk2J2XDdc8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7f5b1d360f002ab9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egNvqjpc1yPJ0lGEsLawvu4XzXlZBVzsrSiyXZwesa9MPflPjehvn4YViQqyx1A+ZtsZZ8/N90Pho7vHhlDBEBHKpyNevGCqYOY++9yTnhgEj6srqPTwzDsCsK84tWOoTKBMDwEuOCqq+fDkhvFf5tLRJ2NGaAXJMiIc8Lb3+sC6GLNWJTTiJ3J35NBWRs0lRnXaqXUCtFLSdw+jzBIAZ8AQHfzC9ZKIqiBk7aS30w54H/7x1MavPALE4JLCm6vYb8obX3kAv9WR97r2eU7TNpgFolKjxag4VL1D+dYsvYbPz3UmU/nuOzeVLBAfXMRklN2PyYPY3Js7m3PGdjCugQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGhOE4Py5arD3lbQI3F0gQPD07n7M5jkSpK9CzuCtLQ=;
 b=dpjFS3ld6yhaES4stluOHypoWcdYcsiANtz4K+NxsKSO5QiirtQYdgY1Xt/DroLMkTLrwHXlG6oNmHwCa/hqg6biSTLW+yyqqpfOW6k4XOL/N3PACz1TO1ySwEJFYF1iTACEh+xGLyHhNbuQH8gHGuhATwnzhV/uGz9NeTIunkjcNnUhy2pDTvHK9dPE2vGdTgLzuu0EWl/tRUAR3F/b2Ghk29ZP4oJ2KZjCM5YfU/KGLm4d6sDph59iEZrLWoaQb5kSMuAPIKRH80tqdhXKmdyW1zFD+WB4zgN2y98PWAtPJ97U5rbgpXHpppqVLm5AaBZBkZEo65XCCSBzSRW39Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGhOE4Py5arD3lbQI3F0gQPD07n7M5jkSpK9CzuCtLQ=;
 b=R0sWltPQf8wYbhIbdhHRvpBVyBFUp35/H1don1RvihocjGPP4CBGL+gW8CWhLhsTB6ThpY4SSH+W5LzDLSkMiK3670OzTdDp05etyroapRQ//wqo/tYdnl9qoFJLLntKMSlfiLTXUc5kRaautQbt3Ety0rokckPHFzk2J2XDdc8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-next v2 0/2] xen/arm: Mitigate straight-line
 speculation
Thread-Topic: [PATCH for-next v2 0/2] xen/arm: Mitigate straight-line
 speculation
Thread-Index: AQHXGCLVbl4hty1bX0WFvkxXr3KxFaqFDwwA
Date: Mon, 15 Mar 2021 13:32:37 +0000
Message-ID: <D7999820-4FE4-4338-A93E-8641AF29F56C@arm.com>
References: <20210313160611.18665-1-julien@xen.org>
In-Reply-To: <20210313160611.18665-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5dd13a06-1578-4902-17fd-08d8e7b6d1d4
x-ms-traffictypediagnostic: VI1PR08MB5295:|DB6PR0801MB1733:
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1733C526A12E47083592993E9D6C9@DB6PR0801MB1733.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RtPsUVtGMJyNeqFG1wwx8FYZKxtZS9lLR4FfEX3qoG49+GVEz7USa161cvK7U12fq3GpuM6yxLma7VR5KsrpBguccjr2xhCLgMnKiFCg2re3UUxROOdyfmvFvu/CVr52404d1XEMcHEQhFVQbmem1k5vOf8uug8EDGTSz1JSAIKqNT2stw39eys+uGOO5P8i2uzt9o4453RHuQwSbPK+Rs3/YMKH43vlLi8Mm24+YtHDnePK8e7RXXP6moGF26GvvZoyVgB8VrSgZ9yB7Sb3L1FBayq9+3IdDp4SWaehC8U9RsSW5Q/76pBGILekooRcn3S6Agu9PR8qqoQJ04lDevT2dbejR9oncPVGEuRXbWoYRQznlHgBZzI2EnjKdJA9JdtWB9DjUuSlnC23CmIR+E9cmfkYPCSYsqFi/8nCFTcFbgeTl1qfR1vV8iQwQd52dnT8D5xYy/uNbs8+EVRZZ3R+kLVh4Bb8cW/+eMBIX7KPRPVamexuxv+9y232DYkY40QqX7MY87gsoEuNbKw2IG+l5q3kR6vGMkseT7WC8UpKzc2RuBpFOdono8C0I1d4Wp8CKrE9NiAI4sdQFiT8yl5niKG6mtDgbXUdQ8Ef3+afYkQWQfeB2vKG37+QfPFAZq5zjNAE8JVLu83DxXF8J3uzTQ5ZISkTxnmqpO0lqgfmsTMoeIlmfDiceQdAP4N/YrK7AaZas1LdaPAS//PwPA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(64756008)(66946007)(6506007)(66446008)(33656002)(8936002)(66556008)(6916009)(66476007)(76116006)(53546011)(6512007)(2616005)(4326008)(8676002)(91956017)(55236004)(5660300002)(86362001)(26005)(71200400001)(36756003)(478600001)(6486002)(186003)(83380400001)(54906003)(2906002)(966005)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?lXaA2cUnB+cyWupLv3PAiAJQLaX1rSlqBVSSzw+dUKAdCuCRVYRLKF7KhYb9?=
 =?us-ascii?Q?6eO8SWarl+bP1ISHumqapprYcGDiXE/erBM9yEteuQES0PYyLCtoGFZRY1vG?=
 =?us-ascii?Q?+QdoiltScoumHg5+7zMjvkR7ZdnPStfRKLyhwyXYDUe0URUFaiJTnJe1Hl9X?=
 =?us-ascii?Q?M/rYHOIWmnzu+B3/CZ9Ux+VjFBmtKtQYQ89goUQiE7L0RZD9irnsbtX4osVZ?=
 =?us-ascii?Q?Lr9YOz17kGlD9fEWbCf+wx45AiMPNX16YFlwXYy4l/DRKcq944ucl+5tzGEv?=
 =?us-ascii?Q?QJiWh/0hb+w5RUF5zKokdZTugPfrrM6jlRSVxaIkSxR99lTe+JugmPeaSCpI?=
 =?us-ascii?Q?SKbiwFmqxHKAtxdRzz0Fx5deymgwCzLTXO3p7KidLC3aYuGNILtMxxvIWtHX?=
 =?us-ascii?Q?qSUQpkd78NpKxwLsfRhHaZIXAcPL7pj3lI7DIgrTXXPkVbynbaVDZ5mYmOrr?=
 =?us-ascii?Q?0HVbwu2t3L/BetLYGI9zrrkKdmDgSPLl9Y2e7dgIlhuzmkoqhBpy8ESiguSK?=
 =?us-ascii?Q?S8J+kBQvBeVmOOtpTqOmXeyKsErDKiPAxz3ytmoTBKSCyne3Vxgyc3cVe0pj?=
 =?us-ascii?Q?8qVRLO9b7jayGgLvQuupyzp7AQKzPkujIRlVsK3QlrC9bP2X67HIVY+fGi38?=
 =?us-ascii?Q?zadLS1TbdHBj+kwdv8xvf51oALeij6qRSE7f2mN7/VtL3m1Z+Dcrfmb1u4dy?=
 =?us-ascii?Q?75PV2Xt8Sm+nZwLfLiq4iyhLPvEl9c4Sk3NEiLN/srNDjkriavKTj4PfCiSY?=
 =?us-ascii?Q?zhJwYcPx+hIP54RJOMJ/hujzDBuBZeIKU8rk/19WCA0kDh2oKX8Fady6Jj6U?=
 =?us-ascii?Q?oqK/zaPSrHlo2GApb01m0E0/ZdXd4ZCXTeiWzeOVXQ9AhSq1YiCObkGAm4TB?=
 =?us-ascii?Q?kwLuvZJrP0cJJtVUznInm+TcFn2P0URruMhGxcyzVP2SFciJspU62JK2cJ2h?=
 =?us-ascii?Q?slaYqTJnOlTnHdPp+gvRhn6lad1GEbAWnzDHMgGNsFByEmtsJpKeKW7KIyJL?=
 =?us-ascii?Q?VNtiGvquLCytOlSw+UfzB+DJfziUYNAk9g8d54f1GT0pYtjWS2/dRjS0qhB7?=
 =?us-ascii?Q?oi+uLjqKfpn8tH+0m0RaepYqygp3IBSkEssnmpf9hxH+oqTaEXS5oRaeBx8K?=
 =?us-ascii?Q?xTTiT91WZ9kOUkx/T70dV+o2vDpk/ZmdCNK6R9kPLP3gG3X41P3mri9CtGR2?=
 =?us-ascii?Q?TMusFAa5zEQ1m+25t0lW0O5WAcOpT2VP4Yu9VJEPFp3fjXN08WROGaKhXLUK?=
 =?us-ascii?Q?sGL70+ZF/WWmqZLFbXiLHcpJYz858w6RPpjloK23tTWN5EM7p3cX0golWccA?=
 =?us-ascii?Q?ztKK2G/6XlvOYGxIxH9nhUFd?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4DD6BFE69DAC314197F4D53CDF38C378@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5295
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22095ddb-8cb0-470a-b63e-08d8e7b6cd12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O5Rn6v23O9EuBZc1YHUclNVQyl1mg3AdIaDO8kCQM65cVi0+SEo7wTysjTY5le3SxIJC03RUbc71hSvO69JAwRGv6A6Jzu61IdwMcNcsoZ5jYei4rg1Z9YDsUOjUW0FpLGOJvUEzSCWCjawxODCBU7SjPJwQ2u6dshA9m8SP1YVZiTzJPA6LUqCs23yDjEbqeuem5xA4ty8hraFBCFcNXNnwPOMk9UT55pA7mgja4lOztWsF7JK84JDUBlOXaqdJiLqPso+bxD7uXmfqL1Mj+QrBOSeSShkPMYI/zxzYaTAhtq/NJ95DvBEobSyY54sj7TwOCBClZeioQ05C6WvZKb7OUvJMHl73WYMeT7z4qXiOrPWYn7FstR/fwABkQckgPptzXS8oXa/weCXG2nw41fxzg3wo1l074NU14PR7ABV/JEz/UeKuwfLmec5VUyiEZYnTMrfWdXugWCEpOszOpcNEzrJQGac1LVff2iiA3pIspr8ckqH/ErzRDGiA2YYGl+SYXONoD9uDh1+jpJ5P4veEFGJaK9r71RpNsoDHyhJ38j6R524bhZZMp3FC2DKYjdGFjlE8aEXFNQBLPmg+H2Y3Fm1DFQkezPH0GHLNEbAqwPHKibxDYAeBJPWody2oaFw9oGFsO1ubSICl0qnd0SdoMx1F9y8VXqrKmXRGyd24upLOGHZfDWy0F7h852ZeW6OrpmaMMVgd4AAC/w7Mea1VU7RAQ0Nqm2+7xw9z/vk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(46966006)(36840700001)(6862004)(4326008)(82310400003)(83380400001)(6486002)(478600001)(5660300002)(336012)(55236004)(356005)(47076005)(70206006)(8936002)(36860700001)(33656002)(26005)(53546011)(316002)(70586007)(81166007)(36756003)(86362001)(82740400003)(966005)(107886003)(186003)(8676002)(6512007)(2906002)(6506007)(54906003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 13:32:46.1638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd13a06-1578-4902-17fd-08d8e7b6d1d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1733

Hi Julien,

> On 13 Mar 2021, at 16:06, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Hi all,
>=20
> Last year, Arm released a whitepaper about a new category of speculation.
> (see [1] and [2]). In short, a processor may be able to speculate past
> some of the unconditional control flow instructions (e.g eret, smc, br).
>=20
> In some of the cases, the registers will contain values controlled by
> the guest. While there is no known gadget afterwards, we still want to
> prevent any leakage in the future.
>=20
> The mitigation is planned in two parts:
>   1) Arm provided patches for both GCC and LLVM to add speculation barrie=
r
>   and remove problematic code sequence.
>   2) Inspection of assembly code and call to higher level (e.g smc in our=
 case).
>=20
> I still haven't looked at 1) and how to mitigate properly Arm32 (see
> patch #1) and SMC call. So this issue is not fully addressed.
>=20
> Note that the ERET instruction was already addressed as part of XSA-312.

On my tests, this serie is breaking the arm64 build:
| aarch64-poky-linux-ld --sysroot=3D/home/bermar01/Development/xen-dev/buil=
d/profile-fvp-base.prj/tmp/work/fvp_base-poky-linux/xen/4.15+git1-r0/recipe=
-sysroot         -EL  --fix-cortex-a53-843419 --fix-cortex-a53-843419 -r -o=
 built_in.o memcpy.o memcmp.o memmove.o memset.o memchr.o clear_page.o bito=
ps.o find_next_bit.o strchr.o strcmp.o strlen.o strncmp.o strnlen.o strrchr=
.o
| arm64/head.S: Assembler messages:
| arm64/head.S:305: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Boot CPU booting -\r\n")'
| arm64/head.S:331: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Ready -\r\n")'
| arm64/head.S:365: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- CPU ")'
| make[6]: Leaving directory '/home/bermar01/Development/xen-dev/build/prof=
ile-fvp-base.prj/tmp/work/fvp_base-poky-linux/xen/4.15+git1-r0/local-xen/xe=
n/xen/arch/arm/arm64/lib'
| arm64/head.S:367: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 " booting -\r\n")'
| arm64/head.S:398: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Ready -\r\n")'
| arm64/head.S:412: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Current EL ")'
| arm64/head.S:415: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 " -\r\n")'
| arm64/head.S:424: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Xen must be entered in NS EL2 mode -\r\n")'
| arm64/head.S:425: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Please update the bootloader -\r\n")'
| arm64/head.S:441: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Zero BSS -\r\n")'
| arm64/head.S:459: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Initialize CPU -\r\n")'
| arm64/head.S:654: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Unable to build boot page tables - virt and phys addresses clash. -\r\n=
")'
| arm64/head.S:666: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Turning on paging -\r\n")'
| arm64/head.S:800: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- Boot failed -\r\n")'
| arm64/head.S:848: Error: unknown mnemonic `rodata_str' -- `rodata_str(98,=
 "- UART enabled -\r\n")'
| {standard input}: Error: local label `"98" (instance number 1 of a fb lab=
el)' is not defined
| /home/bermar01/Development/xen-dev/build/profile-fvp-base.prj/tmp/work/fv=
p_base-poky-linux/xen/4.15+git1-r0/local-xen/xen/xen/Rules.mk:204: recipe f=
or target 'arm64/head.o' failed

This was done adding your 2 patches on top of current staging.

Cheers
Bertrand

>=20
> Cheers,
>=20
> [1] https://developer.arm.com/support/arm-security-updates/speculative-pr=
ocessor-vulnerability
> [2] https://developer.arm.com/support/arm-security-updates/speculative-pr=
ocessor-vulnerability/downloads/straight-line-speculation
>=20
> Julien Grall (2):
>  xen/arm: Include asm/asm-offsets.h and asm/macros.h on every assembly
>    files
>  xen/arm64: Place a speculation barrier following an ret instruction
>=20
> xen/arch/arm/Makefile                |  2 +-
> xen/arch/arm/arm32/entry.S           |  2 +-
> xen/arch/arm/arm32/head.S            |  1 -
> xen/arch/arm/arm32/lib/lib1funcs.S   |  1 +
> xen/arch/arm/arm32/proc-v7.S         |  1 -
> xen/arch/arm/arm64/debug-cadence.inc |  1 -
> xen/arch/arm/arm64/debug-pl011.inc   |  2 --
> xen/arch/arm/arm64/entry.S           |  2 --
> xen/arch/arm/arm64/head.S            |  2 --
> xen/arch/arm/arm64/smc.S             |  3 ---
> xen/include/asm-arm/arm64/macros.h   |  6 ++++++
> xen/include/asm-arm/config.h         |  6 ++++++
> xen/include/asm-arm/macros.h         | 18 +++++++++---------
> 13 files changed, 24 insertions(+), 23 deletions(-)
>=20
> --=20
> 2.17.1
>=20


