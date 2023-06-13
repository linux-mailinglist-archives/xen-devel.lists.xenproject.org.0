Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E3572D78D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 05:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547748.855318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8uGA-0008QA-52; Tue, 13 Jun 2023 02:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547748.855318; Tue, 13 Jun 2023 02:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8uGA-0008Lh-26; Tue, 13 Jun 2023 02:59:54 +0000
Received: by outflank-mailman (input) for mailman id 547748;
 Tue, 13 Jun 2023 02:59:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeqv=CB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q8uG8-0008Kt-0j
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 02:59:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7d00::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bde0749-0996-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 04:59:49 +0200 (CEST)
Received: from AS9PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:20b:48b::16)
 by DBAPR08MB5592.eurprd08.prod.outlook.com (2603:10a6:10:1a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 02:59:44 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48b:cafe::d) by AS9PR04CA0070.outlook.office365.com
 (2603:10a6:20b:48b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.34 via Frontend
 Transport; Tue, 13 Jun 2023 02:59:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Tue, 13 Jun 2023 02:59:43 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Tue, 13 Jun 2023 02:59:43 +0000
Received: from 0012fef3d39d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 05EA49C5-F2F2-4136-8244-ECC837B389E9.1; 
 Tue, 13 Jun 2023 02:59:32 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0012fef3d39d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Jun 2023 02:59:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB7782.eurprd08.prod.outlook.com (2603:10a6:20b:516::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 13 Jun
 2023 02:59:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6455.037; Tue, 13 Jun 2023
 02:59:30 +0000
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
X-Inumbo-ID: 5bde0749-0996-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mkc4Y5coDofVkygOqdKv7raPEaavwEjOzY6j6FDL3nA=;
 b=L6CtRQIks27xOKi029+ukZYFKBV12kXTvMKwJ7ivry8gm1CNzCOoQvPI83AiRbcOlvjct0EF6Po1gfVTL/BUBJl06ykfDb2d68ZBs3HBHvyC5k5NWlp7gDqPMqj33LcNABfWlFvjvMMI99rYqtlkG6ac954Ct1jsREbCtYzg/Rg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icHFoSvZcZADKCojlEce6W1k1T1rlqQ8xIMM4eHZi+zbQmUh6d01adpvgdTs8mn2N5NHE73n/BvE97spI71btoAyWh1m8ancnAx5Cq6Lxzvi5oAm5hZFUk/CFFxcOcDxnfEdI6twZmj1MlfbdQQJ5LBjrgKJ3fUwoN3JZCorKy/BqgroRax2PY6Fl3H6WkDakdiD3pvtYMOWEMTkOtp+WzpDYRH1sVNiXdaTx/QrNqmcXq/+CsEKCdu4qtpBta1vs86++2ph/uSlBmkz60X7e7a5JO7dupnb3qgDK0lWGJFH/5FcNQ65/IXIemSPO8LA83nTEAtKTdCh9sZcoLcEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mkc4Y5coDofVkygOqdKv7raPEaavwEjOzY6j6FDL3nA=;
 b=GMXzJMQOefBpPN1hfvxXxMvVCJ1D7hvDs13GoZ+MZtrsgKo58iRhhFQ/6wgaR6dnVCEUTC0oygBlpFcGbC++hc7kXzQ/6rbtFGmXDpPzblxT0F7h+ZgcXQ5TcselcgrewvteLQ0h2AsQm/UbdqT4oGTkDW+spPE2/aOLyUqNGtZSRybAJrc5u6v40RPYUkZtE5p+3Zi6H2feko5+FUXD8LS39W7fivq8jUO6JFAYeFJwN/XKNTBQVzOKnzSSDDD2Znda2RY5hyu1sAH0ngT1MzgWVazKNOGtv3/MUg/Uq/ZOLJwEtwYg/TmlIPCc1aQVtgLk//+9zFj9Y8vWlss2Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mkc4Y5coDofVkygOqdKv7raPEaavwEjOzY6j6FDL3nA=;
 b=L6CtRQIks27xOKi029+ukZYFKBV12kXTvMKwJ7ivry8gm1CNzCOoQvPI83AiRbcOlvjct0EF6Po1gfVTL/BUBJl06ykfDb2d68ZBs3HBHvyC5k5NWlp7gDqPMqj33LcNABfWlFvjvMMI99rYqtlkG6ac954Ct1jsREbCtYzg/Rg=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/4] xen/arm: debug-pl011: Add support for 32-bit only
 MMIO
Thread-Topic: [PATCH 2/4] xen/arm: debug-pl011: Add support for 32-bit only
 MMIO
Thread-Index: AQHZmSJi48sE31XUjkCsxZnYc3N4Yq+IAl4w
Date: Tue, 13 Jun 2023 02:59:30 +0000
Message-ID:
 <AS8PR08MB7991A0FBF66134AC9BC524BD9255A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230607092727.19654-1-michal.orzel@amd.com>
 <20230607092727.19654-3-michal.orzel@amd.com>
In-Reply-To: <20230607092727.19654-3-michal.orzel@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: FD9C5D8461901D4E845C0AD1F53CAD27.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB7782:EE_|AM7EUR03FT034:EE_|DBAPR08MB5592:EE_
X-MS-Office365-Filtering-Correlation-Id: 9030a27f-27a3-4061-7e22-08db6bba3cf8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fCTWrbajBkw2zu+xT/SWWwqfBpa14PCiqjzNhxoFD+KGiTY74COm+NaZ+tXQirlRdvucrscV2nCiEVwGUM0ijdpbDt1TTiJBe67iM796xoLFmKDfu2UeZDQVNmOc1dtE66fi7qaTI8o/1T+so0si9SZUod84wBubF8IBP4VTh6j+R/5zGO8n8/X7u3bUn4J7PcafoE9J5gVvXRUTAe8UWZjjNbBzNt2Mg2eoAGpgDVOr+MGq8LqkBj8mKSZ0eeuMkAwA/CC7leyw5BZVOe996+ZM20QqInTDPywAd6+WnK91yEQyZuR+7SMSC2Hd7KoHhQcpEi1vsTV14D3eMw6VaHRTzDZY4hePTB41LBykyPp2jaRokZzbBd+bzlKzlqcDTxnCnEzykmrZAhLLtMIoNj1rQYD2A4swXZP0YV/mKXh8HdIWeNkKJ2GFUQ8zMzeKguyz6s4AteJH79mUL/4hzHCzmgvSPVw2krXa/aqFIRGhJA9LS+3woS3qPEc93NN6c43qhowClWCeSD6yNJ40rBfkh2lEzxk9xQe/JV30NzXoDpEOg5fUdUGVDyF5QZJXMdjmB5rj7X7kMQ+Nv1DTAXQGpTBJO18V2+uEcIARkieMFjiogRtue0NbmjBBk0LU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(186003)(9686003)(26005)(6506007)(83380400001)(71200400001)(7696005)(478600001)(2906002)(4744005)(55016003)(8936002)(8676002)(110136005)(54906003)(33656002)(41300700001)(86362001)(38100700002)(122000001)(5660300002)(52536014)(4326008)(64756008)(76116006)(66946007)(66446008)(38070700005)(66476007)(66556008)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7782
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf73143f-c527-4181-c12a-08db6bba3573
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4Yy4iPaAOC9nM1BOiD3I/AR8vuUSWjI2oawpA1/PMk+kA4yDGMetS6qay2FVFt4wWrCWb/Chdx8c12GYSQjp+lnjTTe8eYjIhac4rabCT4edWEpR1kvSLYXonel16U1eKorVc+3lnY8WlGy46KDdAkPWBFvFkSYF8EUsGT44iMamhw6N0Eg+/ey7oxwLQnMo8TDcQ6woBBaxLXD4UtVmTN/wrJoW3Dg4B/J8VZVYRsWW64+B4LvAO4sAdIcdUNgVq+0WncJrE1RSm3So16iS53iENkHND1kghk+I/fXPjCKc+ZtP9FA7jiRRuBxRHGFaUnrfgRN5CMZrQFFCBux62+QVOs7ibwqhftrHOuHJIwc9jN3QTTqTfXCua1Y7rFP3I6beVsnyJxxA8WVZ6CvpqqhOe3IF1CgqEEL8d10qo6BuVikTtXpsjfPs+lXVPGLazqu3gze8ljDdt3z1KS/qmEld5QVPkxCljjenWIsaYamX5oitO2gebZLWvJxukdy30Kg7KBhaPAkHkkY+OSnFYT8WCteu/YXYY16KPR5QKxeqTzwMXX8e9JTDbGuR8Y3w32frVtQS+IFuAnX4HmpBaAELJpTKFJLFDV/q1PHgQqPG3l9gq0HLbqVGpmY1PwnMP+lKUeQVxZKWbjk2NrEsX4FOO1zsgtR1jI6APZld6njC5WAiAk1b1Bj48ixIfBtm2NI+wEMaSp8TN0YrsGB1vHM93SVhsRH09qZMdZCg6b6Rv7/NH+4GhS7p7JEj4Y0p
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(36840700001)(46966006)(40470700004)(83380400001)(47076005)(336012)(36860700001)(356005)(82740400003)(40480700001)(33656002)(82310400005)(81166007)(55016003)(86362001)(40460700003)(478600001)(110136005)(54906003)(7696005)(4326008)(8936002)(8676002)(4744005)(2906002)(5660300002)(52536014)(70586007)(70206006)(41300700001)(316002)(186003)(107886003)(6506007)(9686003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 02:59:43.3595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9030a27f-27a3-4061-7e22-08db6bba3cf8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5592

Hi Michal,

> -----Original Message-----
> Subject: [PATCH 2/4] xen/arm: debug-pl011: Add support for 32-bit only
> MMIO
>=20
> There are implementations of PL011 that can only handle 32-bit accesses
> as oppose to the normal behavior where accesses are 8/16-bit wide. This
> is usually advertised by setting a dt property 'reg-io-width' to 4.
>=20
> Introduce CONFIG_EARLY_UART_PL011_MMIO32 Kconfig option to be able to
> enable the use of 32-bit only accessors in PL011 early printk code.
> Define macros PL011_{STRH,STRB,LDRH} to distinguish accessors for normal
> case from 32-bit MMIO one and use them in arm32/arm64 pl011 early printk
> code.
>=20
> Update documentation accordingly.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

I've tested this patch on top of today's staging on FVP arm32 and arm64 and
confirm this patch will not break existing functionality. So:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

