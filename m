Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 663FF6DEBBF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 08:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520048.807262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmTrc-0006Y3-6h; Wed, 12 Apr 2023 06:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520048.807262; Wed, 12 Apr 2023 06:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmTrc-0006Vr-3a; Wed, 12 Apr 2023 06:21:52 +0000
Received: by outflank-mailman (input) for mailman id 520048;
 Wed, 12 Apr 2023 06:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QpzN=AD=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pmTra-0006Vj-Vb
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 06:21:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e0e0f21-d8fa-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 08:21:48 +0200 (CEST)
Received: from AM6PR04CA0068.eurprd04.prod.outlook.com (2603:10a6:20b:f0::45)
 by PAXPR08MB6544.eurprd08.prod.outlook.com (2603:10a6:102:157::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 12 Apr
 2023 06:21:46 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::64) by AM6PR04CA0068.outlook.office365.com
 (2603:10a6:20b:f0::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Wed, 12 Apr 2023 06:21:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Wed, 12 Apr 2023 06:21:45 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Wed, 12 Apr 2023 06:21:45 +0000
Received: from 3dd2b681c351.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 802509AA-3554-47F9-BF16-535B220D3E67.1; 
 Wed, 12 Apr 2023 06:21:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3dd2b681c351.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 12 Apr 2023 06:21:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB5520.eurprd08.prod.outlook.com (2603:10a6:803:135::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 06:21:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6277.034; Wed, 12 Apr 2023
 06:21:30 +0000
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
X-Inumbo-ID: 4e0e0f21-d8fa-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pOZzwPMMV1DuJnSfPi/4WZieEoZhtGCWT5AFri2azU=;
 b=nm+QF3bsYc0vNf4C+gVWneVgJDy0Sq/KA+A3AIFM4n8go09/lJ4Rdn6CUN44fc1uPq42MyoEWkeNlgwzxxHY253mY/QjHnzQnhhKVUKXmA3JudMzxuox7czk8lO8kK82OalfxwJKCsFBiAoXVuOjhbYwh/3hTwBhdqR2qQkTCjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5fdIfojZSLOEm8yVjlvrglenTFRKAnLe4InAyul0DxS5c7xj5p266IGRD+s8eB/t2Y6hev0ZQlbWNDWGBHPNxp4yfNzP8q4O86MzPSCmr2W6j9WeOGhOsWQhIc/KHtuw/JPCfMky4ClBd4RdZlod2wtGFb+N8b9IHJozXDxb+6g2DzgdxybbZSzKcSZWCqNDxYXyjz6jrADoKCkQcPA0UNgO0zQrJRgEp4cGOj2RR2IQc8uJiUYk0ItncegTEUpbTga6Pfwc3WGOJCaxLKEayAqS+gAV/6Xa1QtZVLFT9PgyMjt1EFlO9stQnZbIhr6IV81pPert3zR67VlPU6X+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pOZzwPMMV1DuJnSfPi/4WZieEoZhtGCWT5AFri2azU=;
 b=OJPgqgWY4566BH2p7ZGP2/XgrSKonYA0YqqG0utqf3bhN+cbHZ63bwnspB0HZdtzAewsXjWZBgCaZo9QxaHlrnClBBkmdvLoEsd66Odw0aAx7mHJBWdr0k6S03g/FT2QVd9o9mJcXjFgVL8CZKkSojb/0NLIFDoHe/vUBsbmCaYf9lRtwACanX/1QqyA4S02SiU4eqQSLb6hjJ5aYD5y5+4NCE5jjQCwnyCAjrk/2IgLVyf73+l90zqY7ovNdBKGyOv6ogdT2T4xF3HBFxwDBKs14sxPyGxJ4gwOBkMZ/TXU3CrRtguyYLVsvvMHlLmrK4cxk+TvHA/pAIxtascrDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pOZzwPMMV1DuJnSfPi/4WZieEoZhtGCWT5AFri2azU=;
 b=nm+QF3bsYc0vNf4C+gVWneVgJDy0Sq/KA+A3AIFM4n8go09/lJ4Rdn6CUN44fc1uPq42MyoEWkeNlgwzxxHY253mY/QjHnzQnhhKVUKXmA3JudMzxuox7czk8lO8kK82OalfxwJKCsFBiAoXVuOjhbYwh/3hTwBhdqR2qQkTCjU=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 1/3] xen/arm: vpl011: Fix misleading comments
Thread-Topic: [PATCH 1/3] xen/arm: vpl011: Fix misleading comments
Thread-Index: AQHZZ7BiVWY3mibtKkuaZtbP8Fag3a8nPoCg
Date: Wed, 12 Apr 2023 06:21:29 +0000
Message-ID:
 <AS8PR08MB799186E653509C6F5DF026EA929B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230405111750.12491-1-michal.orzel@amd.com>
 <20230405111750.12491-2-michal.orzel@amd.com>
In-Reply-To: <20230405111750.12491-2-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F07AB8ADDB37B84AB094A345987E9277.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB5520:EE_|AM7EUR03FT052:EE_|PAXPR08MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ac399f-3749-43ba-a29d-08db3b1e30b0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MTM5EREg8xJPMRv05d1Io9TWxqNSPdPhZZ72t4Xey47EVl4SQKvKfMI6jfagdwHf4n83qKiZ4VOt4KbCi6tbtCeCtMlv7mfVBOiRrbBZWNNsRQvVRu3dMT12ChgJowoAFCcooaWxO5NKzhkv50pqIbN5KA97SnZ2Ls3oI200HkFxUdvH21MRKTpSPlnh2ONlWVHu0+EhTio+u3r6ZyyRAMtj7KJqiZJIpco4HTWgzZl8syyKBRQ4fTstEKejuvs+Efu0rek959RfYUGgNTy2koiK7v6Ixh3xAq2IQm3sRRLxtO5XfGqekaaBoDKe5YQItjXMREcr0o/r4Zplse2Le+sxCdwPsLd9H+irtMNmJAHJbJOPmckXqXPklVC/1Ab4WE0irW/6/nJhnRosH/nSP067sg4zkJmtHvsinrB8YE+VUIgLqs9+a6YhkWLtVC2sRv2ZFqw94uQJcTJU8PUvtmX0STYM0EYUghYNBFGqtDqaDd2M7zZ511QTbA9PL9C1YF08sBPEdGmR5zz1LUh/VmG0gCx7Ftw7qV6yWLexcxlHF2wU0NkBIurryA53RbJl/BX0o9gCCzE8lLwAn7/WGto14E2+VJqFwcQ/SgAg/A/p0X7m4whQu+TUmAUoXO0U
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(451199021)(71200400001)(478600001)(7696005)(26005)(316002)(110136005)(6506007)(186003)(5660300002)(54906003)(9686003)(4744005)(2906002)(4326008)(66446008)(66946007)(76116006)(8676002)(64756008)(66476007)(41300700001)(66556008)(52536014)(8936002)(122000001)(55016003)(86362001)(83380400001)(33656002)(38070700005)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5520
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	edcebe21-1819-479b-3240-08db3b1e2733
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ja222fkM5Pqy7lZJm79fuDaupKXC1qmcSMvtB5f0HYpgWfAINItbKeNhU+YvDoQlpysMS0K4LbLSkRwPZ6V6nRdA4TWVrw8bRRtHyxZhQ3iUEzd1JrIyEnH5Bn5thVqn79V4Sf0DsXMMyy6ypS5Q6bZYQ/24WY51SLrf125zDxN0KNobJByH1TtcqhXeq0X1V/YNDb7KdhK0h8VLx2ZSYLGzwzGVetX2R25FgE73CGnsn05t6VbPLB7GzS5yAm0vkUXxGElcsFYT9NsMFFZWxjjVPG/bCTLqtMwpgI562oOAqJ5FA5l1tEL34gKVWQnO1KGpyWwrUb0IzGEIFLmCT2OoVRZ53BHpm++3oxKyXjfIhRg3G1tzNeohm7EO0QfqEjogNe4sM8aErzgWFazVgNfNHpfthg+IqWhxt1ml+Az1NmxCiab9xemxLRELdxqQI52iw114+4KiTBYMqRFWae0egPvF47C99DBIRw0JJ+Yu5NQVUUdPhtzvvXFeM51rz/ezwUvZeMaX0Q41MZNUh6sME4yd9QEX+DNgiUGwzwiLlmdpMB4O8XkeAbPCTYslUU5ATIdYPRvsrZtpSfWE+tUjl8da7Lf2A0cE+Cn9Wpm4xHbhLJuSv2tZ5mxjajMCrS55qQBbmpXM4kbA09BGPGolYUVY8N5g+bTPA12R+SbguLsqlc+suQgJXSvJ+EfjfzJkG9oOGsqT5AT2J4HzaQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(82740400003)(83380400001)(478600001)(82310400005)(47076005)(316002)(110136005)(54906003)(356005)(81166007)(107886003)(36860700001)(186003)(40480700001)(9686003)(6506007)(26005)(55016003)(336012)(7696005)(33656002)(40460700003)(41300700001)(8676002)(8936002)(4326008)(70206006)(70586007)(4744005)(2906002)(86362001)(52536014)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 06:21:45.4372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ac399f-3749-43ba-a29d-08db3b1e30b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6544

Hi Michal,

> -----Original Message-----
> Subject: [PATCH 1/3] xen/arm: vpl011: Fix misleading comments
>=20
> In both vpl011_read_data() and vpl011_read_data_xen(), there is a comment
> stating that the guest is expected to read the DR register only if the
> TXFE bit of FR register is not set. This is obviously logically wrong and
> it should be RXFE (i.e. RX FIFO empty bit set -> nothing to read).
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

