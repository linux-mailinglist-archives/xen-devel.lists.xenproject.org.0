Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E143088E38F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 14:47:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698554.1090361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTcy-0005zf-Vn; Wed, 27 Mar 2024 13:47:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698554.1090361; Wed, 27 Mar 2024 13:47:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpTcy-0005wf-Sp; Wed, 27 Mar 2024 13:47:40 +0000
Received: by outflank-mailman (input) for mailman id 698554;
 Wed, 27 Mar 2024 13:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TsR0=LB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rpTcy-0005wS-9s
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 13:47:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260e::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9394afed-ec40-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 14:47:39 +0100 (CET)
Received: from DU7P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::15)
 by GVXPR08MB7725.eurprd08.prod.outlook.com (2603:10a6:150:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 13:47:36 +0000
Received: from DU2PEPF00028D13.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::34) by DU7P195CA0001.outlook.office365.com
 (2603:10a6:10:54d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Wed, 27 Mar 2024 13:47:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D13.mail.protection.outlook.com (10.167.242.27) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7409.10
 via Frontend Transport; Wed, 27 Mar 2024 13:47:36 +0000
Received: ("Tessian outbound 9b7417e2a8eb:v300");
 Wed, 27 Mar 2024 13:47:36 +0000
Received: from 86abe90d67b8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B79EC32E-A84C-4C7D-87F3-7864D0B6C620.1; 
 Wed, 27 Mar 2024 13:47:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 86abe90d67b8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Mar 2024 13:47:29 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VE1PR08MB5774.eurprd08.prod.outlook.com (2603:10a6:800:1a1::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Wed, 27 Mar
 2024 13:47:25 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7409.031; Wed, 27 Mar 2024
 13:47:25 +0000
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
X-Inumbo-ID: 9394afed-ec40-11ee-afe3-a90da7624cb6
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=hgesG67AhA9nvYlCPDpjK3ctN6DXWj9iG8gBrZWZRoeNOdIYpkJGshUCsd8keMCeDbpKjSBbIpFqE4JNDpWgb+JfuK3JMbt3b3Ul+aSld9xWfqU+OsOIzdlXehz0svBeEB+yJtk8yBcs9Y69jDckWpGi0lFofcCPI0XwzuNH33sD2JYqRCljAzydS4SkODnqMgGOcRmXTs+9pzzt00B0T4ne0mcc/AdD98GHs6GeSqL/MkoMtrWxDX/hf2v71uYIlApPvl+IVrvn7AeJ9XgMfjp6OqAo5Nc+NW7kn9y9b5B7EXobDBgb3xcaC+MSZ8V+tg5z/YJuElJRr804koSjWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sPyD76On2wtK5kXO/a8p9uUFw1C7V4kWUdpd8oNMNg=;
 b=gSuPw6uwwC9pkRWtm7UQiOCOlUCKBhSHZpsX9EgV3I26jCQnmE7/i14ilCgps4LnQB5J8ByXYWNZ3p6MneS/xXcXZph6ynIFJ4UZXOiX0zZoEy1PBXQjNmEYsp04GBxXhlguiIqAneC8SuWIyvYUmDYTfL82VRnBMZR7OZR3sVcb3ohqEsSS8vhzyrbIpFMGhjDiXa0o1KWESDhswK7RaV5XECCCLsbWQhmiK8YEiz27sTBrAOg/PFvpSqTpdsD0Sjf4Vwo70oueEvkRMRv8LoQG83GWiGFZyXYdWG+6LitwgQlKaBPjC610h/S5jCuEaAUIeBHrjA7BfBb+eFOWYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sPyD76On2wtK5kXO/a8p9uUFw1C7V4kWUdpd8oNMNg=;
 b=EQ/DVmVBCMR3JqhQMNh1bdSuE/XayjpJ1gPuQS9Cfj4PaC15d68EnQCOKatcbddD9IRwghMwqKK99PVdZrzUVeaacTJjkhox3/iLcsLWhHsIGJy56ABpJkC9QTx6FCiPp+1TeuxNI/j0WklFlTWYEQt99xsynL7XrNzuMHJLr18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e89dacf81b8690b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mP8c7LOzo58n9Y00ce5O01OMitAW6rCCSqpy4NSlkxLwCTXjZmJ4H2KCyP71E2uorHCBQf227DGYJpeJcS2q1TxWZYbAEsvQ5d5kkStcKLhuNY6OiAq68gJHoM0hV//d7H/equLxV0p0u8bmonRcQmiS2doh8XemKet8OrJNXjwfY16QLx+HWonB1lGoT0TNSI7StLb2YyY2ONu1Nn66EmfjzE4rgcEUylFEiwuICslBAuldUYSaWDCxswFVeQo9x/O7V7xV2UeuixCGOpqIuTjeVoe2iTU9B/R7Pk7y6eLkQx14UEFJL53ztZJOU2oe1IL32MsTm9QVuzkuqBTEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sPyD76On2wtK5kXO/a8p9uUFw1C7V4kWUdpd8oNMNg=;
 b=kch9+ukFcho2+bBWHvWJ4AvwfLbUoWXz5X60eA1pW7FVJMJYd4UrVOUxA0i8A0n7xBB24uffWm1NJNApQbQy2znSGGPyymHUeppmFE6EsJVIx+6M8OXwgUcj1qw4l3AQsPJ32jPamZGqdqCNdcrkOQEXyYDvUm0FJpAlVt4RR5feebeZWbHl3W/xuVzhLlXFRh37O/9J+nB3jihB5oP9Pp2Eh+yVO5NKa+uaJFXXiLpymWSHfuSaWWkjZDIxOdLRyOfohHPscb63JZYR+gaIdYii5vRSJbdynLCAtND6mqJbmXneOOVgTFY5QytxlEvOwrL03hZ3YYWcGbpXd5rBVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sPyD76On2wtK5kXO/a8p9uUFw1C7V4kWUdpd8oNMNg=;
 b=EQ/DVmVBCMR3JqhQMNh1bdSuE/XayjpJ1gPuQS9Cfj4PaC15d68EnQCOKatcbddD9IRwghMwqKK99PVdZrzUVeaacTJjkhox3/iLcsLWhHsIGJy56ABpJkC9QTx6FCiPp+1TeuxNI/j0WklFlTWYEQt99xsynL7XrNzuMHJLr18=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH 0/6] FF-A mediator reorganisation
Thread-Topic: [XEN PATCH 0/6] FF-A mediator reorganisation
Thread-Index: AQHafphPIHx/pr9gEUyxMEdwwKqovbFLnV2A
Date: Wed, 27 Mar 2024 13:47:25 +0000
Message-ID: <5189F757-8DCD-4C73-9455-8D524F138BA3@arm.com>
References: <20240325093904.3466092-1-jens.wiklander@linaro.org>
In-Reply-To: <20240325093904.3466092-1-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VE1PR08MB5774:EE_|DU2PEPF00028D13:EE_|GVXPR08MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 94565103-d7fe-4e09-cc4f-08dc4e647610
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RbRUbAI5H5jfDOFcUX/L8M2iWJq/0n2CKT0V9/1xUKGJj8qDdBeWHaF4BIHUNFziFS1rQYTyplI7J/r+g1wUARRg7SUMBskSIPNBS9htVvmqGXO/n/0CYv5gfgZLxoc/BwsTzgAu59+MDn0pDI4cVHiFM7odlEdYQAahu7vN84Nv7Fb3/yzI+/RZx3smhPOS/4lSOrHvUOKtoNJ0rJujfDTBJfpGtqRba+b2oFFrgP9k5+U64rB7ZNddZ9gog/1uUvqdvsTzFSrVT7FB+z83dkPfX+YcdRnmde8VrKynJKXe/mREtBnpSNaTd9sVowvj5ApNainf2oq4pJiZfUtOJvSvj78l10GUWybZatBVEn9U4Rszvt5BDt19gwrGL88LtVD7zuIo8rmlgNxfkXCyCdQqkcXOROHNNMUddo9kSThcikA8+aYnoKpqCGK2FWDVZE9gMkE4mRRlEBaNSjLKf0u0/VIoruscs8Xg77GXq3n0GjP2goBf2M74o8l1bgfsuZqIcgvxhF9E2c6inQBeO0ha3ly8UmMwiLX/ilz/+kHTMLCxZaQl/SdZWzZpcatE52rq85yf94Cr7e23D7Nt7SMbo5UvOSJq/RoZvPGPnPMc9F0hbUxiztUwNKb33hujrItHF2mPgaFXrt9dwSfNaNjgU59LdfuTmGlLJD0a4yULcTA6z6NgT7FWJGKknP1cYRTC6upe39EQCmNZP82fQ6AIb1J2AbHIBypgZR1ZCfc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FD3DF79D25446743A3A6820B13A3E59C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5774
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	49e54868-4b14-43df-dfa4-08dc4e646fc0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MFVZ3+xJcgHchoO8ZJ++eF2mr26d9CbbEf8Obq9AeEtnwPEU1WbTF5XlfBzGInHh+4f8/oxTqaTQMYQlu8vmEraxKKZUsJyfDok40tw6uccgjjCuGY4IEHbCasnD/ZvxKrzdyvfKKXE7immZRk2s7S+t+S5LaprXFcRa87o2xbpLGVe+RIBqeax1bqEt0TZj/eIz1SdIMBXdMw1F2EghG932s1LBC8PY9e8bMBHlAKXnzmeQVTj833eyptLtGcl7pnMOvOrvU93QIIG7SCnWAClyJYj42QEuUwu1VVgxMHt9Bi9kv1aO83F3mNjLcDzQBGnDEMzctG+YbIKR1NuDBZzxGnF/5pZp60o1iPs/RAOZ7SsxzbZOIsUyJqS8GSWOMcFfpv2P1y0ej4QWF0O6KrVvyJ07pHdFIQ5MlqLys2WtEK6pnn0hgC/Q+tEDFITzxTFcfvMdIgVOgpBTzFdvn8NvrwMrf/3b3oq1yyuhZMxesL4IdlXt+QWRhKj3u1ptOsPW/W0Q8HH7BKN4n05BWsoomLus43KFAU8AS2iN4QzwFg0I0PRMa5hkHi6s6/iSECpmUzGOm7N6Zh69EOLgcEnqbdqytPUd73j1Ap8tgW2pMizWoH0KvO0jEJDEngcZSdhtSwl465AUHuaPCXQZnKWIzI+8VYaKEeGGt4TmtrfAXjlwpYmuYheWz10KCf4i8Zw6tWf1TOc7dFCfRR/oFlQckiiIsvXXLhGQJZ4yJuZTRQCV6WIPSSHN/aSQIxbL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 13:47:36.4276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94565103-d7fe-4e09-cc4f-08dc4e647610
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D13.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7725

Hi Jens,

> On 25 Mar 2024, at 10:38, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Hi,
>=20
> The FF-A mediator is reorganized into modules for easier maintenance and =
to
> prepare for future changes. This patch set is not expected add any change=
d
> behaviour, except for the "xen/arm: ffa: support FFA_FEATURES" patch.

I reviewed the serie and there is only one tiny fix of copyright date that
can be done on commit.

Appart from that, I tested FF-A with the whole serie applied and I can
confirm it works on my side so for the whole serie:

Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> Thanks,
> Jens
>=20
> Jens Wiklander (6):
>  xen/arm: ffa: rename functions to use ffa_ prefix
>  xen/arm: ffa: move common things to ffa_private.h
>  xen/arm: ffa: separate memory sharing routines
>  xen/arm: ffa: separate partition info get routines
>  xen/arm: ffa: separate rxtx buffer routines
>  xen/arm: ffa: support FFA_FEATURES
>=20
> xen/arch/arm/tee/Makefile       |    3 +
> xen/arch/arm/tee/ffa.c          | 1629 ++-----------------------------
> xen/arch/arm/tee/ffa_partinfo.c |  373 +++++++
> xen/arch/arm/tee/ffa_private.h  |  347 +++++++
> xen/arch/arm/tee/ffa_rxtx.c     |  216 ++++
> xen/arch/arm/tee/ffa_shm.c      |  708 ++++++++++++++
> 6 files changed, 1750 insertions(+), 1526 deletions(-)
> create mode 100644 xen/arch/arm/tee/ffa_partinfo.c
> create mode 100644 xen/arch/arm/tee/ffa_private.h
> create mode 100644 xen/arch/arm/tee/ffa_rxtx.c
> create mode 100644 xen/arch/arm/tee/ffa_shm.c
>=20
> --=20
> 2.34.1
>=20


