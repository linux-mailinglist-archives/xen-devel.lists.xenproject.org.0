Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC8E53244F
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:42:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336265.560626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPBA-0007xy-Na; Tue, 24 May 2022 07:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336265.560626; Tue, 24 May 2022 07:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPBA-0007tN-7r; Tue, 24 May 2022 07:42:08 +0000
Received: by outflank-mailman (input) for mailman id 336265;
 Tue, 24 May 2022 07:42:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aI9d=WA=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ntP6C-0003DA-QL
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:37:01 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04b4b6bc-db01-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 03:29:56 +0200 (CEST)
Received: from AM5PR0701CA0064.eurprd07.prod.outlook.com (2603:10a6:203:2::26)
 by AS8PR08MB7078.eurprd08.prod.outlook.com (2603:10a6:20b:34f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 01:29:53 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::57) by AM5PR0701CA0064.outlook.office365.com
 (2603:10a6:203:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Tue, 24 May 2022 01:29:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 01:29:53 +0000
Received: ("Tessian outbound 6580ae46f51e:v119");
 Tue, 24 May 2022 01:29:53 +0000
Received: from 080f1eea5f03.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2A76D633-24D3-480B-A53A-636F068C8440.1; 
 Tue, 24 May 2022 01:29:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 080f1eea5f03.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 01:29:47 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM0PR08MB3794.eurprd08.prod.outlook.com (2603:10a6:208:103::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Tue, 24 May
 2022 01:29:45 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::d007:5582:9bbe:425e%3]) with mapi id 15.20.5273.022; Tue, 24 May 2022
 01:29:45 +0000
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
X-Inumbo-ID: 04b4b6bc-db01-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AXDpMCjSZFlo/X1OcQJre39TYmpK6Y4Yuj9um61iMAjhVGpBuVOrV3Yb5y6kp4+N7X0llzcX4OlWbFPASuPaMFtsaGT7L/PEzrrCoAH9h0lzl0/8EvCRt3V+AnWoHc5Fiw07EBwq6qDTEl5zk5glOahcLiQ6D7OsWar50DZZcNAFGAhKNYLaXbiNHwc0zHGIEi67cR74CY3Z3lY2NOvRQs8Mhd6YOlDGDf0Mf8KZBuOu28AZ/LUsV1cigvdUtR1Lxal78253xHLfZG+065nUbbllS2GSZwlIB3pNwA0z0ZL0fmyFgFKF8cabSZMQSeIBVW63Lgp2QxZ4Wtd8RDOHYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZDIpbazrLIVydwaymOJleXlcNrmOGpvsZl7vO967WM=;
 b=dV2tZaDI2RfqIrQdbrnobvp/9xFlLP7kyA82y6PJVDVcv++pWfa7CMh83bXi5JGbzF5c4g7+uHO6iObKfHSFHkUded4VTHQP4H0pC5hzbwGVXG7v3NzI3465fNuJNtdkZ3T7YVcpLeaNRqWwmQs1Vlb+29I9I73kD5aWWp6FpcXaGabR7yX1TjImJH5XTKgzixCueVNVEj1wU+yyluSdYq0SKUul3Gz16wg38qH0O5C1fAkZkK67/kKu5i1mpou51GvEgKVCQw1oPnz9ir1jEJPZEZ/8+GakLXrEGVlyg7C0ZtjRbP+GERpoYYSruOgHrXNK6Poy+UdSRN/UEEDt9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZDIpbazrLIVydwaymOJleXlcNrmOGpvsZl7vO967WM=;
 b=2N6Q324d2rFXghGAkvj8YtPWXrfFTbCwNq6Dt59jtUeUPLVJRct50yQnll4x1Y6iiLFypBHvfhePOpA96QYwGbu8BJSTPbaHkPWQ4UhIAPYcxjOsryyRtZuZnTnrHtMkrklwwsUZ47tw2gLCECRvdkui7h5bj80/4EATv6DnlBU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQSDmTPUABCoGE+C1qVdRbKLijgdit3Zj7397q9+xVhPhbnoNFHo5HbGSnnOf83imOiEU/ldJtwOvkWMiaJwIom5jDhCIS+F66yMDSqKcNPRw2C9LU6SiC9Xcv6tbYMH3cqNq3XzRpsDvIvTxuttJJbtaeJHCKcIGQbrawyoS2jewnvi5ZJ4C6+oeBVFRjeKGOxEiD81GwukNxF+E+jnGErLEZfS9Mh5RQDZzKJD0M0lG/A2VpeB0824CTitghbEprYd5E1u0qNvYQBPFxD4Vzy1a19KzuydNt0/HFxGU6G7OC+QQzdTiq3gop5ETV8TCujypm7qz+MmdoAqyx9qQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZDIpbazrLIVydwaymOJleXlcNrmOGpvsZl7vO967WM=;
 b=l2mXYPsvp0pzZcIo6qFcyYHQ6fxzCoMVb8vkEE9pNwGPDzJkjKfNJkSu6aFpsMUaZMfOfsEsUQAj4amVfzjHzXc1SaD6Wa9wPxfyCVM91QeBbaK9xACGuGgwAY8bIg//iESBTCi5XXcG1g1tHmZ7dJ6+Gy7hHgGQuVequPY6yU2FBdT85+dV0aJIKp7u4LqIDk6yYvhTJ+/ZyIXHCe0AECpV4vKEU18h9RLw0FfPO12FCM20l2BeTVRSArrI1lWv7uV2qvA69kDWsAoU+NHIktwoFSeeuZaRaXxOjNumuFnYt7gZGvguAIPRWsszMNuw7qAynbbU96YX+waGvP4NJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZDIpbazrLIVydwaymOJleXlcNrmOGpvsZl7vO967WM=;
 b=2N6Q324d2rFXghGAkvj8YtPWXrfFTbCwNq6Dt59jtUeUPLVJRct50yQnll4x1Y6iiLFypBHvfhePOpA96QYwGbu8BJSTPbaHkPWQ4UhIAPYcxjOsryyRtZuZnTnrHtMkrklwwsUZ47tw2gLCECRvdkui7h5bj80/4EATv6DnlBU=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: RE: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Topic: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Index: AQHYbt50tGidbD5g50ygNS2KCABD4q0tOEpA
Date: Tue, 24 May 2022 01:29:45 +0000
Message-ID:
 <PAXPR08MB74203220E82BEBB49540A7FE9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220523194953.70636-1-julien@xen.org>
In-Reply-To: <20220523194953.70636-1-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: EC8BED42FB57A247B8897D089C7F2DC0.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 73afc49c-6415-4d33-4431-08da3d24e72e
x-ms-traffictypediagnostic:
	AM0PR08MB3794:EE_|AM5EUR03FT023:EE_|AS8PR08MB7078:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB7078952CAD9A553D85DABA2D9ED79@AS8PR08MB7078.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Lcyf5Bh9ONQhKmwJ3xC8ziLBpQp44rn/5fIIk2wYAN28mAIT9eJgcocq4xz7p3jRRcM3q44UtNdwI64KE2vYGYqBXPMBA+N9ew857BUnQNulY1bGqY+j45SChWZZ1hdaJjdlfXMVcrO5ZXrfcH2hi1DgDlDR2AHowohzu4Qlv0TeGQ3yrDdpKcRaBVE+TUYR1Kzl8peMHKDJqAVwkLYhdqRsMD53HExWGqORKSayLiEhobL3oVhAD3+40G67leVNKsR7R2PZW/mmVTwRb9hjZmnKd8DIWC7+Jd+eR63cHjIYNDz/YmlbdeLpjYlKatAc1G3XzqllgHPBuBPIUHJMHebiNpQvnlz61+/mLpVgHJY3j4FCzZwgL4E+XvV2uEGNJilsSnNuAA6gQTnPQbPRppQjMHQvil0WuIMI2ZC2nNhpp23R/Dkr4umeQ2WjKlAa9Dgqj9fxZhFSZWKxjfhiyMFDHER3acJtwpVbheRlaR4agMZzYxzUZ8J1eoZjqW9TbEK1iUmxOWRIZAP/tjWpAJcdZWfX45Xvk4Jd4YIhjsWSCT2OQo5QWjpsZ+rcOG6p9S4iUuZWqzY5rlBZ4mFEgfk/TzRfOQdU8rACCASiYBeO8bMKTGFm1x54qudqsF6Yg08VrDL3jIfXGdTKfU1BE09Td/sa1rpxV0ddStXYf7MIKun8XY4SQE/dyPFOg9b0V4nNbq8v0BbJsrWJCTnixQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55016003)(122000001)(83380400001)(38070700005)(38100700002)(110136005)(316002)(8936002)(54906003)(66946007)(66556008)(86362001)(76116006)(8676002)(66446008)(66476007)(64756008)(4326008)(2906002)(26005)(71200400001)(33656002)(6506007)(53546011)(52536014)(9686003)(5660300002)(7696005)(186003)(508600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3794
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13f1c433-2f78-41c7-d01f-08da3d24e268
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ps6rm/E3H6GWpSnT5CQMJEfeBMJXBb8NepdyJDiyCzK305VZoDlAw/smk66lCRSW4vSps/2lSxfcQ4nYJaYFrwQf3K2c4u66UT7AJmq24RTxqSG6gGWAsvmbHday3lNqKLyVDKTyHbMKDo0rqJtbmO2PYhq8PQGvMri/kdXa35XQwk/AL5cF0Y+D/l9A1id/MUWvZT3BEZDEZtTZ1YasreL0hXT1DTSGvqsbz0bII68riNmsmu1oRHt9JtB6RnLzM5bc9xtAtOeCOlQP30HWD6evOt6XWMZJuTj5GSCzDazYfs1W5/Cb8tRZIvhhJrr7n8Cl4LrtuABzh0m8V0+snIenuf0cQn6DeKTXFzPc4kgYVf7mFoYB7ByCB4jk2UrN3ZQGBzq82YjCgk9r7rD4UskTSrIIciexE+N27/kEXFEN5AHk9Bdx04tyODz/JLCaF7nXLUT+GqrAgViHaxfNrdIzpY5WZP/qbJtHY23fXYQjfHtvDjcFh1J0epHPsD6vQltq6EIg0mCm3gpYff1xlw91JK0VwVgwdVouKG/ZOc5j9UHf710zSd19kR+YI/ve4kjjGb0OP2uu/UmYLAYcpduEe7a8PHuFwavgsGrc66bssYLfPKDDlKbPzF/d4kUUQRxA8nHOrjhdZOfylnhvx6RQ0TuCr9baUW7MgIggAqC2e1fWiWVcQoYDjW6L9HvC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2906002)(36860700001)(8936002)(81166007)(5660300002)(8676002)(4326008)(70206006)(86362001)(70586007)(52536014)(356005)(55016003)(316002)(336012)(107886003)(110136005)(53546011)(6506007)(26005)(9686003)(186003)(82310400005)(7696005)(40460700003)(33656002)(54906003)(508600001)(83380400001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 01:29:53.2251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73afc49c-6415-4d33-4431-08da3d24e72e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7078

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1k
ZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBP
Zg0KPiBKdWxpZW4gR3JhbGwNCj4gU2VudDogMjAyMsTqNdTCMjTI1SAzOjUwDQo+IFRvOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IGp1bGllbkB4ZW4ub3JnOyBKdWxpZW4g
R3JhbGwgPGpncmFsbEBhbWF6b24uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPjsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0u
Y29tPjsNCj4gVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsg
S29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgUm9zcyBM
YWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0g
eGVuL2FybTogUmVtb3ZlIG1vc3Qgb2YgdGhlICpfVklSVF9FTkQgZGVmaW5lcw0KPiANCj4gRnJv
bTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4gDQo+IEF0IHRoZSBtb21lbnQs
ICpfVklSVF9FTkQgbWF5IGVpdGhlciBwb2ludCB0byB0aGUgYWRkcmVzcyBhZnRlciB0aGUgZW5k
DQo+IG9yIHRoZSBsYXN0IGFkZHJlc3Mgb2YgdGhlIHJlZ2lvbi4NCj4gDQo+IFRoZSBsYWNrIG9m
IGNvbnNpc3RlbmN5IG1ha2UgcXVpdGUgZGlmZmljdWx0IHRvIHJlYXNvbiB3aXRoIHRoZW0uDQo+
IA0KPiBGdXJ0aGVybW9yZSwgdGhlcmUgaXMgYSByaXNrIG9mIG92ZXJmbG93IGluIHRoZSBjYXNl
IHdoZXJlIHRoZSBhZGRyZXNzDQo+IHBvaW50cyBwYXN0IHRvIHRoZSBlbmQuIEkgYW0gbm90IGF3
YXJlIG9mIGFueSBjYXNlcywgc28gdGhpcyBpcyBvbmx5IGENCj4gbGF0ZW50IGJ1Zy4NCj4gDQo+
IFN0YXJ0IHRvIHNvbHZlIHRoZSBwcm9ibGVtIGJ5IHJlbW92aW5nIGFsbCB0aGUgKl9WSVJUX0VO
RCBleGNsdXNpdmVseSB1c2VkDQo+IGJ5IHRoZSBBcm0gY29kZSBhbmQgYWRkICpfVklSVF9TSVpF
IHdoZW4gaXQgaXMgbm90IHByZXNlbnQuDQo+IA0KPiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byBy
ZW5hbWUgQk9PVF9GRFRfU0xPVF9TSVpFIHRvIEJPT1RfRkRUX1ZJUlRfU0laRQ0KPiBmb3IgYmV0
dGVyIGNvbnNpc3RlbmN5IGFuZCB1c2UgX0FUKHZhZGRyX3QsICkuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiANCj4gLS0tLQ0KPiANCj4g
SSBub3RpY2VkIHRoYXQgYSBmZXcgZnVuY3Rpb25zIGluIFhlbiBleHBlY3QgW3N0YXJ0LCBlbmRb
LiBUaGlzIGlzIHJpc2t5DQo+IGFzIHdlIG1heSBlbmQgdXAgd2l0aCBlbmQgPCBzdGFydCBpZiB0
aGUgcmVnaW9uIGlzIGRlZmluZWQgcmlnaHQgYXQgdGhlDQo+IHRvcCBvZiB0aGUgYWRkcmVzcyBz
cGFjZS4NCj4gDQo+IEkgaGF2ZW4ndCB5ZXQgdGFja2xlIHRoaXMgaXNzdWUuIEJ1dCBJIHdvdWxk
IGF0IGxlYXN0IGxpa2UgdG8gZ2V0IHJpZA0KPiBvZiAqX1ZJUlRfRU5ELg0KPiAtLS0NCj4gIHhl
bi9hcmNoL2FybS9pbmNsdWRlL2FzbS9jb25maWcuaCB8IDE4ICsrKysrKysrLS0tLS0tLS0tLQ0K
PiAgeGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jICAgICAgICAgIHwgIDIgKy0NCj4gIHhlbi9hcmNo
L2FybS9tbS5jICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrLS0tLS0NCj4gIDMgZmlsZXMg
Y2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NvbmZpZy5oDQo+IGIveGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2NvbmZpZy5oDQo+IGluZGV4IDNlMmE1NWE5MTA1OC4uNjZkYjYxOGIzNGU3
IDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vY29uZmlnLmgNCj4gKysr
IGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2NvbmZpZy5oDQo+IEBAIC0xMTEsMTIgKzExMSwx
MSBAQA0KPiAgI2RlZmluZSBGSVhNQVBfQUREUihuKSAgICAgICAgKF9BVCh2YWRkcl90LDB4MDA0
MDAwMDApICsgKG4pICogUEFHRV9TSVpFKQ0KPiANCj4gICNkZWZpbmUgQk9PVF9GRFRfVklSVF9T
VEFSVCAgICBfQVQodmFkZHJfdCwweDAwNjAwMDAwKQ0KPiAtI2RlZmluZSBCT09UX0ZEVF9TTE9U
X1NJWkUgICAgIE1CKDQpDQo+IC0jZGVmaW5lIEJPT1RfRkRUX1ZJUlRfRU5EICAgICAgKEJPT1Rf
RkRUX1ZJUlRfU1RBUlQgKyBCT09UX0ZEVF9TTE9UX1NJWkUpDQo+ICsjZGVmaW5lIEJPT1RfRkRU
X1ZJUlRfU0laRSAgICAgX0FUKHZhZGRyX3QsIE1CKDQpKQ0KPiANCj4gICNpZmRlZiBDT05GSUdf
TElWRVBBVENIDQo+ICAjZGVmaW5lIExJVkVQQVRDSF9WTUFQX1NUQVJUICAgX0FUKHZhZGRyX3Qs
MHgwMGEwMDAwMCkNCj4gLSNkZWZpbmUgTElWRVBBVENIX1ZNQVBfRU5EICAgICAoTElWRVBBVENI
X1ZNQVBfU1RBUlQgKyBNQigyKSkNCj4gKyNkZWZpbmUgTElWRVBBVENIX1ZNQVBfU0laRSAgICBf
QVQodmFkZHJfdCwgTUIoMikpDQo+ICAjZW5kaWYNCj4gDQo+ICAjZGVmaW5lIEhZUEVSVklTT1Jf
VklSVF9TVEFSVCAgWEVOX1ZJUlRfU1RBUlQNCj4gQEAgLTEzMiwxOCArMTMxLDE4IEBADQo+ICAj
ZGVmaW5lIEZSQU1FVEFCTEVfVklSVF9FTkQgICAgKEZSQU1FVEFCTEVfVklSVF9TVEFSVCArIEZS
QU1FVEFCTEVfU0laRSAtDQo+IDEpDQo+IA0KPiAgI2RlZmluZSBWTUFQX1ZJUlRfU1RBUlQgICAg
ICAgIF9BVCh2YWRkcl90LDB4MTAwMDAwMDApDQo+ICsjZGVmaW5lIFZNQVBfVklSVF9TSVpFICAg
ICAgICAgX0FUKHZhZGRyX3QsIEdCKDEpIC0gTUIoMjU2KSkNCj4gDQo+ICAjZGVmaW5lIFhFTkhF
QVBfVklSVF9TVEFSVCAgICAgX0FUKHZhZGRyX3QsMHg0MDAwMDAwMCkNCj4gLSNkZWZpbmUgWEVO
SEVBUF9WSVJUX0VORCAgICAgICBfQVQodmFkZHJfdCwweDdmZmZmZmZmKQ0KPiAtI2RlZmluZSBE
T01IRUFQX1ZJUlRfU1RBUlQgICAgIF9BVCh2YWRkcl90LDB4ODAwMDAwMDApDQo+IC0jZGVmaW5l
IERPTUhFQVBfVklSVF9FTkQgICAgICAgX0FUKHZhZGRyX3QsMHhmZmZmZmZmZikNCj4gKyNkZWZp
bmUgWEVOSEVBUF9WSVJUX1NJWkUgICAgICBfQVQodmFkZHJfdCwgR0IoMSkpDQo+IA0KPiAtI2Rl
ZmluZSBWTUFQX1ZJUlRfRU5EICAgIFhFTkhFQVBfVklSVF9TVEFSVA0KPiArI2RlZmluZSBET01I
RUFQX1ZJUlRfU1RBUlQgICAgIF9BVCh2YWRkcl90LDB4ODAwMDAwMDApDQo+ICsjZGVmaW5lIERP
TUhFQVBfVklSVF9TSVpFICAgICAgX0FUKHZhZGRyX3QsIEdCKDIpKQ0KPiANCj4gICNkZWZpbmUg
RE9NSEVBUF9FTlRSSUVTICAgICAgICAxMDI0ICAvKiAxMDI0IDJNQiBtYXBwaW5nIHNsb3RzICov
DQo+IA0KPiAgLyogTnVtYmVyIG9mIGRvbWhlYXAgcGFnZXRhYmxlIHBhZ2VzIHJlcXVpcmVkIGF0
IHRoZSBzZWNvbmQgbGV2ZWwgKDJNQg0KPiBtYXBwaW5ncykgKi8NCj4gLSNkZWZpbmUgRE9NSEVB
UF9TRUNPTkRfUEFHRVMgKChET01IRUFQX1ZJUlRfRU5EIC0gRE9NSEVBUF9WSVJUX1NUQVJUICsN
Cj4gMSkgPj4gRklSU1RfU0hJRlQpDQo+ICsjZGVmaW5lIERPTUhFQVBfU0VDT05EX1BBR0VTIChE
T01IRUFQX1ZJUlRfU0laRSA+PiBGSVJTVF9TSElGVCkNCj4gDQo+ICAjZWxzZSAvKiBBUk1fNjQg
Ki8NCj4gDQo+IEBAIC0xNTIsMTIgKzE1MSwxMSBAQA0KPiAgI2RlZmluZSBTTE9UMF9FTlRSWV9T
SVpFICBTTE9UMCgxKQ0KPiANCj4gICNkZWZpbmUgVk1BUF9WSVJUX1NUQVJUICBHQigxKQ0KPiAt
I2RlZmluZSBWTUFQX1ZJUlRfRU5EICAgIChWTUFQX1ZJUlRfU1RBUlQgKyBHQigxKSkNCj4gKyNk
ZWZpbmUgVk1BUF9WSVJUX1NJWkUgICBHQigxKQ0KPiANCj4gICNkZWZpbmUgRlJBTUVUQUJMRV9W
SVJUX1NUQVJUICBHQigzMikNCj4gICNkZWZpbmUgRlJBTUVUQUJMRV9TSVpFICAgICAgICBHQigz
MikNCj4gICNkZWZpbmUgRlJBTUVUQUJMRV9OUiAgICAgICAgICAoRlJBTUVUQUJMRV9TSVpFIC8g
c2l6ZW9mKCpmcmFtZV90YWJsZSkpDQo+IC0jZGVmaW5lIEZSQU1FVEFCTEVfVklSVF9FTkQgICAg
KEZSQU1FVEFCTEVfVklSVF9TVEFSVCArIEZSQU1FVEFCTEVfU0laRSAtDQo+IDEpDQo+IA0KPiAg
I2RlZmluZSBESVJFQ1RNQVBfVklSVF9TVEFSVCAgIFNMT1QwKDI1NikNCj4gICNkZWZpbmUgRElS
RUNUTUFQX1NJWkUgICAgICAgICAoU0xPVDBfRU5UUllfU0laRSAqICgyNjUtMjU2KSkNCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9saXZlcGF0Y2guYyBiL3hlbi9hcmNoL2FybS9saXZlcGF0
Y2guYw0KPiBpbmRleCA3NWU4YWRjZmQ2YTEuLjU3YWJjNzQ2ZTYwYiAxMDA2NDQNCj4gLS0tIGEv
eGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9saXZlcGF0Y2gu
Yw0KPiBAQCAtMTc1LDcgKzE3NSw3IEBAIHZvaWQgX19pbml0IGFyY2hfbGl2ZXBhdGNoX2luaXQo
dm9pZCkNCj4gICAgICB2b2lkICpzdGFydCwgKmVuZDsNCj4gDQo+ICAgICAgc3RhcnQgPSAodm9p
ZCAqKUxJVkVQQVRDSF9WTUFQX1NUQVJUOw0KPiAtICAgIGVuZCA9ICh2b2lkICopTElWRVBBVENI
X1ZNQVBfRU5EOw0KPiArICAgIGVuZCA9IHN0YXJ0ICsgTElWRVBBVENIX1ZNQVBfU0laRTsNCj4g
DQo+ICAgICAgdm1faW5pdF90eXBlKFZNQVBfWEVOLCBzdGFydCwgZW5kKTsNCj4gDQo+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vbW0uYyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+IGluZGV4IGJl
MzcxNzZhNDcyNS4uMDYwN2M2NWY5NWNkIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vbW0u
Yw0KPiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYw0KPiBAQCAtMTI4LDkgKzEyOCwxMSBAQCBzdGF0
aWMgREVGSU5FX1BBR0VfVEFCTEUoeGVuX2ZpcnN0KTsNCj4gIC8qIHhlbl9wZ3RhYmxlID09IHJv
b3Qgb2YgdGhlIHRyaWUgKHplcm9ldGggbGV2ZWwgb24gNjQtYml0LCBmaXJzdCBvbiAzMi0NCj4g
Yml0KSAqLw0KPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKGxwYWVfdCAqLCB4ZW5fcGd0YWJsZSk7
DQo+ICAjZGVmaW5lIFRISVNfQ1BVX1BHVEFCTEUgdGhpc19jcHUoeGVuX3BndGFibGUpDQo+IC0v
KiB4ZW5fZG9tbWFwID09IHBhZ2VzIHVzZWQgYnkgbWFwX2RvbWFpbl9wYWdlLCB0aGVzZSBwYWdl
cyBjb250YWluDQo+ICsvKg0KPiArICogeGVuX2RvbW1hcCA9PSBwYWdlcyB1c2VkIGJ5IG1hcF9k
b21haW5fcGFnZSwgdGhlc2UgcGFnZXMgY29udGFpbg0KPiAgICogdGhlIHNlY29uZCBsZXZlbCBw
YWdldGFibGVzIHdoaWNoIG1hcCB0aGUgZG9taGVhcCByZWdpb24NCj4gLSAqIERPTUhFQVBfVklS
VF9TVEFSVC4uLkRPTUhFQVBfVklSVF9FTkQgaW4gMk1CIGNodW5rcy4gKi8NCj4gKyAqIHN0YXJ0
aW5nIGF0IERPTUhFQVBfVklSVF9TVEFSVCBpbiAyTUIgY2h1bmtzLg0KPiArICovDQo+ICBzdGF0
aWMgREVGSU5FX1BFUl9DUFUobHBhZV90ICosIHhlbl9kb21tYXApOw0KPiAgLyogUm9vdCBvZiB0
aGUgdHJpZSBmb3IgY3B1MCwgb3RoZXIgQ1BVJ3MgUFRzIGFyZSBkeW5hbWljYWxseSBhbGxvY2F0
ZWQNCj4gKi8NCj4gIHN0YXRpYyBERUZJTkVfUEFHRV9UQUJMRShjcHUwX3BndGFibGUpOw0KPiBA
QCAtNDc2LDcgKzQ3OCw3IEBAIG1mbl90IGRvbWFpbl9wYWdlX21hcF90b19tZm4oY29uc3Qgdm9p
ZCAqcHRyKQ0KPiAgICAgIGludCBzbG90ID0gKHZhIC0gRE9NSEVBUF9WSVJUX1NUQVJUKSA+PiBT
RUNPTkRfU0hJRlQ7DQo+ICAgICAgdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAodmE+PlRISVJEX1NI
SUZUKSAmIFhFTl9QVF9MUEFFX0VOVFJZX01BU0s7DQo+IA0KPiAtICAgIGlmICggdmEgPj0gVk1B
UF9WSVJUX1NUQVJUICYmIHZhIDwgVk1BUF9WSVJUX0VORCApDQo+ICsgICAgaWYgKCAodmEgPj0g
Vk1BUF9WSVJUX1NUQVJUKSAmJiAoKFZNQVBfVklSVF9TVEFSVCAtIHZhKSA8DQo+IFZNQVBfVklS
VF9TSVpFKSApDQo+ICAgICAgICAgIHJldHVybiB2aXJ0X3RvX21mbih2YSk7DQo+IA0KPiAgICAg
IEFTU0VSVChzbG90ID49IDAgJiYgc2xvdCA8IERPTUhFQVBfRU5UUklFUyk7DQo+IEBAIC01NzAs
NyArNTcyLDggQEAgdm9pZCBfX2luaXQgcmVtb3ZlX2Vhcmx5X21hcHBpbmdzKHZvaWQpDQo+ICAg
ICAgaW50IHJjOw0KPiANCj4gICAgICAvKiBkZXN0cm95IHRoZSBfUEFHRV9CTE9DSyBtYXBwaW5n
ICovDQo+IC0gICAgcmMgPSBtb2RpZnlfeGVuX21hcHBpbmdzKEJPT1RfRkRUX1ZJUlRfU1RBUlQs
IEJPT1RfRkRUX1ZJUlRfRU5ELA0KPiArICAgIHJjID0gbW9kaWZ5X3hlbl9tYXBwaW5ncyhCT09U
X0ZEVF9WSVJUX1NUQVJULA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCT09UX0ZE
VF9WSVJUX1NUQVJUICsgQk9PVF9GRFRfVklSVF9TSVpFLA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBfUEFHRV9CTE9DSyk7DQo+ICAgICAgQlVHX09OKHJjKTsNCj4gIH0NCj4gQEAg
LTg1MCw3ICs4NTMsNyBAQCB2b2lkIF9faW5pdCBzZXR1cF9mcmFtZXRhYmxlX21hcHBpbmdzKHBh
ZGRyX3QgcHMsDQo+IHBhZGRyX3QgcGUpDQo+IA0KPiAgdm9pZCAqX19pbml0IGFyY2hfdm1hcF92
aXJ0X2VuZCh2b2lkKQ0KPiAgew0KPiAtICAgIHJldHVybiAodm9pZCAqKVZNQVBfVklSVF9FTkQ7
DQo+ICsgICAgcmV0dXJuICh2b2lkICopKFZNQVBfVklSVF9TVEFSVCArIFZNQVBfVklSVF9TSVpF
KTsNCg0KSXQgc2VlbXMgeW91IHByZWZlciB0byBwb2ludCBfZW5kIHRvIHRoZSBhZGRyZXNzIGFm
dGVyIHRoZSBlbmQuIEV2ZW4NCnRob3VnaCB3ZSBnb3QgcmlkIG9mIHRoZSBtYWNybyBkZWZpbml0
aW9uIG9mIF9FTkQuIEJ1dCB3ZSBkaWRuJ3QgYWdyZWUNCm9uIGhvdyB0byB1c2UgaXQuIEZvciBt
ZSwgd2hlbiBJIGZpcnN0IHNhdw0KImVuZCA9IHN0YXJ0ICsgTElWRVBBVENIX1ZNQVBfU0laRSIg
SSBzdWJjb25zY2lvdXNseSB0aGluayB0aGUgLTEgaXMNCm1pc3NpbmcgaGVyZS4gSSBldmVuIGFk
ZGVkIGEgY29tbWVudCwgYnV0IHJlbW92ZWQgaXQgd2hlbiBJIHJlYWNoZWQNCnRvIHRoaXMgbGlu
ZSA6ICkNCk1heSBiZSBpdCdzIGJldHRlciB0byBwbGFjZSBzb21lIGNvZGUgZ3VpZGUgZm9yIEVO
RCBpbiBjb2RlIGNvbW1lbnQNCmluIHRoZSBTSVpFIGRlZmluaXRpb24sIG90aGVyd2lzZSwgd2Ug
bWF5IGhhdmUgZGlmZmVyZW50IHBvaW50IGFkZHJlc3Nlcw0Kb2YgX2VuZCBmdW5jdGlvbnMuDQoN
CkNoZWVycywNCldlaSBDaGVuDQoNCj4gIH0NCj4gDQo+ICAvKg0KPiAtLQ0KPiAyLjMyLjANCj4g
DQoNCg==

