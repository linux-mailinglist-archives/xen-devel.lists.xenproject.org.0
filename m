Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DABF403887
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 13:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181767.329055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNvPM-0002M6-DW; Wed, 08 Sep 2021 11:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181767.329055; Wed, 08 Sep 2021 11:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNvPM-0002KH-A5; Wed, 08 Sep 2021 11:06:24 +0000
Received: by outflank-mailman (input) for mailman id 181767;
 Wed, 08 Sep 2021 11:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uOOR=N6=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mNvPJ-0002KB-VF
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 11:06:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51402be4-325a-4eef-ae23-0b6b4ab43f8f;
 Wed, 08 Sep 2021 11:06:19 +0000 (UTC)
Received: from AS9PR06CA0245.eurprd06.prod.outlook.com (2603:10a6:20b:45f::13)
 by AS8PR08MB6200.eurprd08.prod.outlook.com (2603:10a6:20b:292::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 11:06:15 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::4f) by AS9PR06CA0245.outlook.office365.com
 (2603:10a6:20b:45f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 11:06:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 11:06:15 +0000
Received: ("Tessian outbound cc1d52552731:v105");
 Wed, 08 Sep 2021 11:06:14 +0000
Received: from f5378b50b472.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 43942ADA-248F-4FBA-BFFF-1EE7A8106600.1; 
 Wed, 08 Sep 2021 11:06:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5378b50b472.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 11:06:05 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB5225.eurprd08.prod.outlook.com (2603:10a6:101:1c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 11:06:04 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 11:06:03 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0504.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13b::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 11:06:02 +0000
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
X-Inumbo-ID: 51402be4-325a-4eef-ae23-0b6b4ab43f8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjVEPgleUufWG7FxRAJ8OgjKsZxLoAtFwjrmB8PICUc=;
 b=RTFG2ZswWbQynh2C8SVAULRBQXiLD6vQ6KYVnn9xpIuxjQBC4HTGr1AYeVIrXyYoIWSh8q3VwbEuIy7b5ZbCME/4lxaKc2F10P4xLpD1lfA7LZX6BJ30OovO8USWZL74UovcNAV9Ad4ZGZ0ZGZGv/7PDgWdqyEUtMItvW9S1RxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=fail (body hash did not
 verify) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 77d5b0b807d761fd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8kWVOiBSP8qLaAqd09llyYPIw6gMG4/PteTBs+oJ3uhI2cC0UPuFGV3p6wNVdGmvvGvxPGigFF66mcVcNcsvjrKfwGHNiFxHeRAHHonnEAs7N7D4GozY++CdSfjOVzoJvSIEAoLpln6arqUGTZAEm2v8RAI5D8rFAGpUSCbuj9o1tx94h0gtC1ngOil76t2x+MUVRZ4NKmKpExMEq6AJ2Cc+nRxj917b3vim92S0zLwcr6+p9pfokOOD/YE4Twa//Rzp0V8g9rNxVGC19xN7T/TNRGgLy3WXDEgtwAHlGoY8MnRWqcrEZiAd/ovoZWGpeweBcGfyDakuPHFk1IHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YqptrvRxS37Q3pgOV+agaxEVAKQ847xwENGiT+K4Hdw=;
 b=J1FPWc9IGmAZyP69FSlXEdf0IQFMvFe74gXV6VottOJ5ZcktG9aV26JL5fWvVpXyn7MBrksLIE03A0a1tMZJa0pNu9QLQwtB6oNu2nmAqhdN4tWSLimyDz27Ha6nX5oGEPetpCItoccLKvcRvJoJ8ryqCo7pZcXfO/7isziX1ue7PLJwGrP5XGy5xb61Cx2LZt5nNoWF9yq2b8IiAUjV1fl8GpmqZYdvSFNf4pMLaEK7fO5Cv8KvO2JkEt9+1lC5UJgMIcguBa2FYUFi2KURVGt4epRnwRkvLf3MWFlbshHbf90PilFP+1aexbRRLajA4GQ8wiB5pLGY9esBbL+6Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqptrvRxS37Q3pgOV+agaxEVAKQ847xwENGiT+K4Hdw=;
 b=8BVntMYWvuAlycfQT1hoJ/PYT7qcR1VMxXElvwr0PRW9oFVKVkM3sVL6MfW42AeGWHyqBWnVuyAiq+5eCGx+YR9pOGdCl2D2E8p2WwkbgVM1UKl9e7en2urzo8HiAmniLXaGHY3CzJd/L4gIURTyCRZLePDLfNz66gvDII08fbs=
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: Xen Booting Problem on ARM Machine
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <1B61076F-D44A-41CC-89CC-A8E0E65E64EB@hxcore.ol>
Date: Wed, 8 Sep 2021 12:05:56 +0100
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A3F0FA99-E434-43D2-8F93-64E6C6423DEC@arm.com>
References: <1B61076F-D44A-41CC-89CC-A8E0E65E64EB@hxcore.ol>
To: Sai Kiran <ysaikiran1997@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0504.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::11) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 625394a9-6ded-4d33-9648-08d972b8ad23
X-MS-TrafficTypeDiagnostic: PR2PR08MB5225:|AS8PR08MB6200:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6200584C5062CD2BB978D7C4E4D49@AS8PR08MB6200.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jO60Phj85dBvXxQlvGAE90E8AwrJFPdK+7hYcBi80bYXdrQGAAddUy8ghvMMTKapIR7ZHOhv07ljherh8w+S419/TwycyToou2P/X83ZwEc4zUUY2tV1/ICy+l1KFlWXRHanY8btK6ZFHQV6dWgbYEhnjzs4yduj4VF5MgZz6Mc0vm58mWQJtWY5HMC5bc/SIjDwYB33p13hj9O3+IrjMKuysFK6dwrGsZfgkdUGyaEaL7krA6qpAAjGzspJg6mZupZgz+qLfD1/KDJMc1kZoYxghxvCMtjs9ojPdjOjnlUj8bIZS5NEvkNaYDZVr+jyq0q+OzVNkWCvlZpIBCQwelTpB8UaVg8x9suCWZ8YpvxAN0pu5y35e2HRLI6InvZMpNEBcmnPIIWq5xeA2jduNtn8UWoxCRwyM4vwft5RhXjJ/Qd/S1vQIRbQ7M/e/Ugzfs/NaPp4Uw+d+yQuaHg21VdFmDWR9UXtx2H3R3Q72nBVYrfw3GJEPwtLg+S09Dl+TZ9oT2lVTy6fHdoViShEGrKM1yHeUMJ36TP00Iobnyc6fAHWh5ol36nGhqBx2Na6D/dkDzuIYrAonKEkMjFyd7FHIpUR1yArIp1m7oWcGSfqCdtVLRk0ohjPkE/lxxdvzCUPmMDe+TkEU0y2sC35ienc/R5/6c1DqW+8i0MeiB3oJRO2U106cIPQWTM+JddNXiqhE5lixaI/yUmd/b59udehcV88DaUbNLu/QWUt5rA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(316002)(2906002)(6666004)(4326008)(66556008)(66476007)(38350700002)(83380400001)(33656002)(6916009)(44832011)(36756003)(38100700002)(26005)(6512007)(478600001)(8936002)(5660300002)(8676002)(186003)(52116002)(6486002)(53546011)(6506007)(66946007)(2616005)(956004)(86362001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB5225
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	206d7893-cccc-4f11-b113-08d972b8a5c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	klPi255n2epLo+YUD/DCQJHA96P7JzcJodveVdqgXKt+eY4tAYxArRL81ZvcvShjAQrbDvmmnG3g2UMWXVZd7ozu2Rtf9yz0P8rPylJMzNrfL5lVmN7N5HpKCOgKrUub8mrDek0JXIiD0LczyXobREoC6FQh60Ij6TOSGK8GTi2743rYkeQ9xBshVIcLplO7wwieVUoLlvnSbPbH1es/C+yq8umzRr9YW32fa+PMAar+56qJepdU1NVIZCmj/X8tPqOpHSjDK1I2LdUTXt0sXrvdQZFs7QidDNZTjwzBZ94mpHp/gQsrCCBQZv6a7wqMeREMgOJT2v4pCR56O/O9dL1gJzuohyCUhwSaWiXOK1q6sMwLmJsEt8r+j8j9rvb2hLHC5QbFUbppA/90q7UkBwfZV0EVS2AfQJCxBqvmr5W0aVh16e50/n5oK86kPRjTuMzXTkiXa2MoIElqimr4NDe/zMev6St2GH7NAe+XOw4M90/dJEw+ZpBBO5GgW385ft575AyEolBsKPgNKZN+ex1u0owKeGbKl9dlF+l7v1qnYOKKrsc6QrAnlLIixjcmhLHyv+ksS0dzWVNJWBN1C0Yt3C7rEqcULLq2EWPXREntAj3+9miuUsCiv2U7ILkEBS/eHZAG/U4iZkLgyz+uL5k3h5+kMXuSXOmP1UWcd4pHLtEw6YAL3+3Oa7NUAXhq4W5LvKJuVWUoIszadX+Uaw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966006)(36840700001)(6512007)(82740400003)(6666004)(2616005)(8676002)(70586007)(4326008)(8936002)(70206006)(53546011)(6506007)(26005)(36756003)(86362001)(47076005)(4744005)(44832011)(83380400001)(36860700001)(336012)(186003)(33656002)(2906002)(6862004)(356005)(6486002)(5660300002)(956004)(316002)(82310400003)(81166007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 11:06:15.2875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 625394a9-6ded-4d33-9648-08d972b8ad23
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6200



>=20On=208=20Sep=202021,=20at=2011:46,=20Sai=20Kiran=20<ysaikiran1997@gmail=
.com>=20wrote:
>=20
>=20
>=20
>=20Hello,
>=20=20
>=20I=20have=20Xen-4.15.0=20on=20an=20ARM=20Machine,=20with=20Debian=2011=
=20installed=20on=20it.=20I=20am=20able=20to=20do=20=E2=80=9Cmake=20world=
=E2=80=9D=20and=20=E2=80=9Cmake=20install=E2=80=9D,=20after=20=E2=80=9C./co=
nfigure=E2=80=9D,=20as=20specified=20in=20README=20file.=20When=20I=20reboo=
t=20the=20system,=20I=20get=20the=20following=20message:
>=20=20
>=20Warning:=20All=20128=20bootinfo=20mem=20banks=20exhausted.=20
>=20Warning:=20All=20128=20bootinfo=20mem=20banks=20exhausted.=20
>=20Cannot=20exit=20boot=20services:=20ErrCode:=200x8000000000000002=20
>=20=20
>=20Here=20is=20the=20snapshot=20of=20the=20error.
>=20<D00C86F8093B4937B59AA7450B930686.jpg>
>=20=20
>=20Can=20someone=20tell=20me=20how=20to=20fix=20this=20error?

Hi,

I=20think=20this=20is=20more=20a=20question=20for=20xen-users@lists.xenproj=
ect.org.

Cheers,
Luca

>=20=20
>=20Thanks=20&=20Regards,
>=20Sai=20Kiran.
>=20=20
>=20=20
>=20Sent=20from=20Mail=20for=20Windows



