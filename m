Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D6F623DC0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 09:46:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441532.695654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot3Cg-0002Nw-IM; Thu, 10 Nov 2022 08:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441532.695654; Thu, 10 Nov 2022 08:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot3Cg-0002LZ-FY; Thu, 10 Nov 2022 08:46:30 +0000
Received: by outflank-mailman (input) for mailman id 441532;
 Thu, 10 Nov 2022 08:46:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jazc=3K=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ot3Cf-0002LF-0J
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 08:46:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 297a5cab-60d4-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 09:46:26 +0100 (CET)
Received: from FR3P281CA0074.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::12)
 by PAXPR08MB7551.eurprd08.prod.outlook.com (2603:10a6:102:24e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Thu, 10 Nov
 2022 08:46:24 +0000
Received: from VI1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::e8) by FR3P281CA0074.outlook.office365.com
 (2603:10a6:d10:1f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13 via Frontend
 Transport; Thu, 10 Nov 2022 08:46:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT030.mail.protection.outlook.com (100.127.144.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Thu, 10 Nov 2022 08:46:24 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Thu, 10 Nov 2022 08:46:23 +0000
Received: from 122c5fba2263.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4B66D1C5-1266-44C0-932B-51B787585A55.1; 
 Thu, 10 Nov 2022 08:46:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 122c5fba2263.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Nov 2022 08:46:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBAPR08MB5559.eurprd08.prod.outlook.com (2603:10a6:10:1a4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 08:46:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5813.013; Thu, 10 Nov 2022
 08:46:09 +0000
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
X-Inumbo-ID: 297a5cab-60d4-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nMFdNi2wM9E8aHX95weeYLYI+5Hf15lGM5CxMWrEVK/eR4YY5g0LK2zvZn3tzrbW3iz3NbuaHnCsZ6Y71j1Ri7nrQwv4I/6Fn6uukSZEUgPvr0YFtY9JKCDuI/HuL8Louju+DkMK85NHZb22oRVWwfb5BrVeXx0bIEsYKzRqHju1SMR8f/JHN7aXRZckjvbuENMqf7jGD+YdByqHEUbH+GgDgzKuau5SdTnKcibS1j7yIHBmc6Qk4kIztdeVSaZaVfUZDIm8Rue14L5tfnRc9FO7a2bSFEjt2VPnfnzxGkQ9KgJiXyH8DbfIzaOs37rKtdBlcna0UFymSVU/Fmdn7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvV59+SQIO5j7s0FgVtNlBq3dHJrCCn2pQoJJWANYSI=;
 b=Kng1Qp142AERP+0quX4/1M/st3XWhMRRqUroLlVjPhyCn4keczwdjFvkdEmg3UvrrrQOXuyOWAgcKoJZ7V7ezyBwwo1dGA60xGjrlUu1k1E4Oh6jN78Jzt69EE0D3Ytwqv2WHEY6KlRDMKgUyzyRD6kj1H9srtYr5fpCICwmIKG8IzG+QBkCJSxVZIxum6LdHyM2s1jhM2KTjyXNsCxTIznF0r/MRQoARsQj4Uv3XumbX4EHUzGzlYvXBqu+CZQxo0P67pdxw7Y8E5J4EC9gnf5W0tRjpuHW2Q44HShB/NGooSEEcEIQTVJ2o7NP0QAdG1IzB4NgmQ1iOkDJ5AGvhg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvV59+SQIO5j7s0FgVtNlBq3dHJrCCn2pQoJJWANYSI=;
 b=3CB3D53tOKp8r/myJccFj5KFSGAFWOTy9HDxMcIaSbNW62sGRa1lUxGeE6R+3I+xdR0TF1wnsR8cRFPHYYxev2H3MIyNRzPtNPE4N0uOSbLkGO8K5cD3JKcDSWHLYirSnX2Ibbg1oV6xERO6CuYyrwfJDNyP5gRRDZfsej3ZMkk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 77e4f59596e60b8c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfJfEnuEKR9f5cjQ/8Vp8MOtCToS/E1SVzSI59nENCO54PhO0SEoxpBUUjH79vMYkYD5kGXj8lav2iP4hZZFxM6Gm14xbZ75UNDBUih0aDVKn1sJ/x/ID5m0r3OUtyMzRyag2oo0K0hMSeXKEJqyu8x0aGT94viIVkisEIYv2cscnybyTPbDT/5P6UWn+qI+6XtQXKODuJFQZmHcV6XbF3AoSin8ux6QjsBv2WrdGsF8Vdyozay0zwI2cE9qVtHtLQ7F8iNFv2zsidXxc/O5547/MoOs8QkBmpVQyqdhXETjqfLhIBFDjW7bB1XgVsZFkn93vs81aBJjerTO52JFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zvV59+SQIO5j7s0FgVtNlBq3dHJrCCn2pQoJJWANYSI=;
 b=od1Bk/RcmlYxaHztFs+9ILqtww2fdqn+O/mAaAldcpOFFm55SJwCMyjt5z7rEENbZc0GhX8XH7yH0O3nB9/sZ8SpX8q5FtfCTQsPS3tIrOMB3B9FnsbiLOk0R3hu51C8viVqDVukkiEAJcF6bEiHep7NutDcZ4evs6sZlDSHvyr8BYZWLYLC4pSJHJem/a3eQO7bK5JsiZFxai4nrAfZDEH7uAUQsfc68AxnkXt29HGBD5XVBRFdSoFQUpgOHDsKQlbOJMJ9E/GOE/tBJS2vGik8ASp4mwSmzpA29TVuGpjtWu+DIFySWzN8ZmsthGNA177lcwCyChIuPHlsA4Btjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvV59+SQIO5j7s0FgVtNlBq3dHJrCCn2pQoJJWANYSI=;
 b=3CB3D53tOKp8r/myJccFj5KFSGAFWOTy9HDxMcIaSbNW62sGRa1lUxGeE6R+3I+xdR0TF1wnsR8cRFPHYYxev2H3MIyNRzPtNPE4N0uOSbLkGO8K5cD3JKcDSWHLYirSnX2Ibbg1oV6xERO6CuYyrwfJDNyP5gRRDZfsej3ZMkk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for 4.17] arm: fix Kconfig symbol dependency on arm
 features
Thread-Topic: [PATCH for 4.17] arm: fix Kconfig symbol dependency on arm
 features
Thread-Index: AQHY9EQ4iloE8yUW4kqdjRjbTbLxuq432TgA
Date: Thu, 10 Nov 2022 08:46:09 +0000
Message-ID: <BCBB4207-0B16-4AFC-BA80-E601FC63DDA2@arm.com>
References: <20221109140420.31007-1-luca.fancellu@arm.com>
In-Reply-To: <20221109140420.31007-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DBAPR08MB5559:EE_|VI1EUR03FT030:EE_|PAXPR08MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c8f4a8-5ff4-4939-b3e0-08dac2f80c86
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 oL8kOtWzGfrYVQMQzgt85OhNinYQeLG4h6vHIGE5j35tXost7tJ32MpeYCA13RCefsAH+NHcE81iJDMvTr9TmHHfllc/JuVQwelwdjcSoknZlA4gUPcJz0mzbwDh66aL9brxx5Cde2Oh4iskZsNYyjq+Bcl8hdNeGMA9U5LAIvtTNisc4C4bEEgyoQoQmO9P+ePN1ZH4qP95KO67K3Tr8n5ljs4+tl2fTKk3zJT9JHQiwWx3C8gZEQHY1SXomL2oEeZZrgeyIC3+9Roqx5BLk8tQPbagCvW0dL/+2IDeoyHfwYRmMSTsBxtAtxBoaAP8Z2x3iidF9khLTMijs4M4MNGKI/7UMDzK4JA35/7lOZvOaLkzG17/W6IkclSsqW6reWmWFIBi0vsPzH+B7BoHcP3mbtI3SECTm98DakWnVDPjVHSA7CoT53S8wzTm2cJ58gxHCFlExx5AX1D7gS/61xHDmLd0RYWsaI6mW2aH46TvdIwKFMJmHEcAgvQ1OYknpBC1gr75NjuAB9NlMwDiYcG9UBB2pjiU2/Zfz83WK43ZH/91Rf6ntbPsSochfOHQo62Xds9/g/xOahQ6xgRi5wd+/pFirzjcMUJa1Iknol2jijD1GCKPdptZwUO5bKlQFbZ47I/4z9s5D71mE4zg5l/EbmXqzEJgKBSXNwZSmciIZ2TLpGsynJtzPW5qr2JtUx99jJEW03uUjSdG9IM7Bx2orkqavk3sQ5KlP4QlgDH9NSGucWiimvJW/Bd1fCwk0FP1mT7zU5P0tsCeCrpEIpRa5Cg+OpEho3ixawX0Nh4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199015)(54906003)(6636002)(37006003)(316002)(6506007)(83380400001)(186003)(5660300002)(6862004)(8936002)(2616005)(2906002)(91956017)(53546011)(33656002)(86362001)(26005)(8676002)(41300700001)(36756003)(4326008)(64756008)(66946007)(66446008)(66476007)(66556008)(76116006)(6512007)(6486002)(38100700002)(71200400001)(38070700005)(478600001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E9E313E105FF074FB7ABF1D4CF03B390@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5559
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	320c4e7b-ca00-416f-7793-08dac2f8035d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YDz3lqmDMt3iarvjbwIh4yq9SXt8uBf1ORzGLHS9x/1RIcH1RDmlPWhwoFTXPiXCShM/BLzNNW4zusjHrjkfDZRQbqyEJZtHHo1ussGS0QVVCTBpa0zQd31u31iJuyuM/80vCjwSNJokaTlDig/4Sb1oMqPnkuSqVxxdJ/xmlkcKMlPRa28I73dBz3+UMAs9YoD9NHlX4XSwk7PgFNTHjPY91CXzIdM42tC7aMfaF50qXyjy8v7V30L9/NyRrq8hufHqz0L091IeYefW1Stk1hSdEx57iKuryeJ3aL6KqJiojS/FY6//R87Lx6FLn389wcOn2Tx9ZnPwDqPy4b2k34ADtThFps8nnfF2anNRwJrz4TxBmHObzoolsaVxPWlKqZYSYZMcmsdzpOT9eyW7lmQB3fX9f6P/7fxAf95qp1eDr/ODOw1gWKDSYRlTQPLs+BrRjeKKVqrFBa/Q1kKdHtzvsKgjYghl3zGjf97qVxjnJMCaLnAnl6d7thGH/aDOGLuighx+xDda5BGBL7iWFOoxd6zG73QIg17LQ1NQlNFxWVDkh/tD2GHt+zryiRf6W0mUQ8tU9jAxlINzRqnKSidoKEez63EoVOk9/2Mmdc058+da2tJJEeQYY6kv5f8HiEwWWfFuU4VdNp6QXqQ8eFKSZvACH4eHX0f6ds4eLZVWnkQeN/Ush8eyiKZVx203I3KJE+eCWg3imqeUcK+Grj/l+wAK97REiYLeVP0nCzkxgPDJe67PrcT7l6lnxnhVFTuo3a/IOGLvl7qDaOfS9g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(6486002)(356005)(36860700001)(82310400005)(478600001)(26005)(40460700003)(6636002)(81166007)(8936002)(316002)(86362001)(53546011)(2906002)(70586007)(5660300002)(186003)(83380400001)(4326008)(8676002)(54906003)(6506007)(37006003)(41300700001)(6862004)(336012)(107886003)(6512007)(82740400003)(2616005)(70206006)(47076005)(33656002)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 08:46:24.3085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c8f4a8-5ff4-4939-b3e0-08dac2f80c86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7551

Hi Luca,

> On 9 Nov 2022, at 14:04, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> The commit 3c2a14ea81c7 is introducing some unsupported arm features
> that by default are disabled and are used for the cpufeature.c code.
>=20
> As they are disabled by default, a typo in the Kconfig symbol they
> depend on has landed in the codebase unnoticed, instead of depending
> on ARM64 which does not exist, fix the code to depend on ARM_64 that
> is the intended symbol.
>=20
> Fixes: 3c2a14ea81c7 ("arm: Define kconfig symbols used by arm64 cpufeatur=
es")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I think this should go in 4.17 as it is fixing an invalid depends in Kconfi=
g.
The change cannot create any issue as those config options are hidden and d=
efault to n at the moment.

Cheers
Bertrand

> ---
> xen/arch/arm/Kconfig | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 1fe5faf847b8..52a05f704da5 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -105,28 +105,28 @@ config HARDEN_BRANCH_PREDICTOR
>=20
> config ARM64_PTR_AUTH
> 	def_bool n
> -	depends on ARM64
> +	depends on ARM_64
> 	help
> 	  Pointer authentication support.
> 	  This feature is not supported in Xen.
>=20
> config ARM64_SVE
> 	def_bool n
> -	depends on ARM64
> +	depends on ARM_64
> 	help
> 	  Scalar Vector Extension support.
> 	  This feature is not supported in Xen.
>=20
> config ARM64_MTE
> 	def_bool n
> -	depends on ARM64
> +	depends on ARM_64
> 	help
> 	  Memory Tagging Extension support.
> 	  This feature is not supported in Xen.
>=20
> config ARM64_BTI
> 	def_bool n
> -	depends on ARM64
> +	depends on ARM_64
> 	help
> 	  Branch Target Identification support.
> 	  This feature is not supported in Xen.
> --=20
> 2.17.1
>=20


