Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AF95FD34A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 04:35:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421600.667060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oio3b-000399-5K; Thu, 13 Oct 2022 02:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421600.667060; Thu, 13 Oct 2022 02:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oio3b-00036E-2R; Thu, 13 Oct 2022 02:34:47 +0000
Received: by outflank-mailman (input) for mailman id 421600;
 Thu, 13 Oct 2022 02:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oio3Z-000365-K9
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 02:34:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9761e382-4a9f-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 04:34:42 +0200 (CEST)
Received: from AM9P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::22)
 by PA4PR08MB7619.eurprd08.prod.outlook.com (2603:10a6:102:260::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Thu, 13 Oct
 2022 02:34:37 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21f:cafe::70) by AM9P195CA0017.outlook.office365.com
 (2603:10a6:20b:21f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Thu, 13 Oct 2022 02:34:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 02:34:37 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Thu, 13 Oct 2022 02:34:36 +0000
Received: from 6a7b7be8f1e6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F8DFC213-A71F-4FBD-B37E-F78C7DA3FAF2.1; 
 Thu, 13 Oct 2022 02:34:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a7b7be8f1e6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Oct 2022 02:34:31 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB9878.eurprd08.prod.outlook.com (2603:10a6:150:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 02:34:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 02:34:28 +0000
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
X-Inumbo-ID: 9761e382-4a9f-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CqcWJ47NR0LUc+DBbRt8ATcSYNUkmvkZBOOjYuaivmv+klcYrIDAnoL+aqkA7k4jahzCH21914eBOzZm1YV9yE1JyJpCLSyvBTKPQ+tzPvPXyaAQYDkQO8a5w9zZz1kZ0q4lCEn9EX1bpBMPw2fMoozUnFj/1AvkvWSwBTZxiJNRUhT6bH9MY7jYjY0awLHEntYqQlEcgdbL8CrUSJpwrJQ9SdSCjW+MJ1iw6aA9LOcdlslYtn+1AwwnZPObt01KCW2yW2V/fDJRgNUDkP0ovKqA5ZsunkM7+MSPaswHoq48/oQaQkpbZH80hTDi1J3KtELMYof2Ib8kiTHZRK+M+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/vBhluHBfJvmg8HL02zPA+kC0c/OblCjveSpq3/jjc=;
 b=RJNiXc/glVpSXHDdBz1uwrogBHjAFC2IRu9kkp2oyQMty/+DK6uVHvD4SycF1dzisiketIUwtolj8qaHA97fU4FLLNiEkxYTtSQSU1FM4YFAWXCRodKX7JmW4w4WmPIKW9r7MfG2X4XJNWYYxLZDXWGczlsX42zG2KTpFuwru37K+iijn0Q9+hR98dzkQkTNgFEAtseNG2JZIHV7kRcIyb5Ai/WazPiwOTybhoIz6zgR46TG8NlM9WQ+zdS+pdVugDYYqbSpWHo6pg5v3oX0l0FCjCC2wWgsWeYha1m+7tRpSxc3SSfQF+/oaarnLjgUrF30fzl1Y26EIGHWE8tgmQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/vBhluHBfJvmg8HL02zPA+kC0c/OblCjveSpq3/jjc=;
 b=iFV5E5ODYW7Kn3OXD9Ig/HbR77HA/WPFCq8lnTV2DMlA5aIq7NUKQt7oK+Zctr+0EeV/P6JKAfbteBxr0MHsh+w7hfnR6hpXtwHsIphg6MpnptbVzYGSSDOa4Uq3gQ6+l6tMM8Lya1npfCb6Tdq7o79alJJzMP2JJ40RZZH/BbU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiZaBPf5BQKWKmrXj5N/V1a7waCQnvmDaLJl8czfIUN1k2pzogftvPGjWf7G/XX8hn3dcsYYcOzCHPS+4tSlKTlRYRQ7kqJUhfmPRZRCY8HlNfyEXMG9+yyRODhtDV+j0iHL/cvrE9lSPvjk9l33YMlcjqX49kDUWSFIHfiLPnlAC4BdUq7iMqlCNvrYakKXKgS4E1B5YQAUpN3+1Z8hB5lLwQ73ttPtemVPvL3Ohf5sSB3Xdcqri+gGftbqh0yXPvY9tWCvDmSq8W2UfWpOW0h+KuwDWQ6dUDN8szCgBD4ehPp7anbznq1NdT+NmrAyOZ5FDEpt/5nEwHyAbzmFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/vBhluHBfJvmg8HL02zPA+kC0c/OblCjveSpq3/jjc=;
 b=RE55quByA4H35bq4vghcz+CPYv4TmiVMb9TqL51KAXLjwWdLxaZhZpE1wSk73fZiV9afEK6P5u0CdsIxSViaoSEdJ+o3+/QtqfdQ1IsswZqRcwYZjg4c5xwFmv1H5XLeck1sGgyVJe6kjDkQHqICGgbI1pKZ/dw5NNhDXXATk+X3Ef1J7HLFR8NHbCNRWphDQCAm9mrk/yyNgkbGVKzUfiyy+kvcsTY7KxVi8GB/o8FliIXfwcnCzBDStYjOCFDMlwESEG/qPrdS9lIxF3rV+Ky9jzc+xQQzfrlxPXXZex5WOpzjggkRlNBwAvrF4fpvueTLkMtXpkmJcZ/QjGAPeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/vBhluHBfJvmg8HL02zPA+kC0c/OblCjveSpq3/jjc=;
 b=iFV5E5ODYW7Kn3OXD9Ig/HbR77HA/WPFCq8lnTV2DMlA5aIq7NUKQt7oK+Zctr+0EeV/P6JKAfbteBxr0MHsh+w7hfnR6hpXtwHsIphg6MpnptbVzYGSSDOa4Uq3gQ6+l6tMM8Lya1npfCb6Tdq7o79alJJzMP2JJ40RZZH/BbU=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: RE: [PATCH 1/2] tools/ocaml/xc: Fix code legibility in
 stub_xc_domain_create()
Thread-Topic: [PATCH 1/2] tools/ocaml/xc: Fix code legibility in
 stub_xc_domain_create()
Thread-Index: AQHY3mgm6d+FJrzJnkaoGa45NVlypq4Lm6Og
Date: Thu, 13 Oct 2022 02:34:27 +0000
Message-ID:
 <AS8PR08MB79917FD4B8EFE62D1D8A900392259@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221012182552.26866-1-andrew.cooper3@citrix.com>
 <20221012182552.26866-2-andrew.cooper3@citrix.com>
In-Reply-To: <20221012182552.26866-2-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9F9D64B6CCB43F4E9628291C773C4127.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB9878:EE_|VE1EUR03FT036:EE_|PA4PR08MB7619:EE_
X-MS-Office365-Filtering-Correlation-Id: dda66362-7cd1-4116-d380-08daacc378f8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JCicWNKsddaQZJ0jXH3/Jf/YABXUmtvBz3MADL5gu77vlIjGVrhM0tsC3op4ab3gGj8fveTJz2nrcO0wny4rRr2eUBS1dPUTJvBWeSVjyMApZiLUNHphwO3NM8kN5FyXztT1A9q5e4KNROTOjkMp2w9ibbUJvQXiIAVN3sqtbVlOyVSHFj+g+Xn5mBc2BUUlewbjbKADZVd1vunY2wBKB69oVbM6HWzSz3pZBQLCt0Y+UJyKx0+OtSWEnF/2SH0LrUIqKHVjQNuh95mU7B6l6Nt3U3TLMt2omoddO1WOZIpRbNjQViNbMdDTallhrnCrlSCi/LEGO82ReClktonsMXtk9LF0po1wwIiOB8fHFb0pkddwXgkBuyUJkWekA5PVGOBpLoT0aUW5CrQq8wE8HshzwlCwSlyLU69HrU9hT062zpyw+mxF9RFcgU9vt2FPd0lAWLOsMPuzTI2EC3AI6npWSLhxf3wwUcBpKQicTLVp4/IZvvlKZX240Nq6fbFhw45VKazr6M1wwVpfV0ZTSdR84CEYjJ5qhuOMDuZkFjzby4bl7aCD26LZDAT2WGJyt5hQr6XLP5g07N5lku8PVtNHOJZo5p4EDCfBzIYuisTw36Oje/qZnLkOlyQwedOIIax7nz6d6xxmr6XeGg7TAivYy69nnvVLF9sl7QH7VpQthYBUdtaBpPuSLpu8ZSdw2UjKnNa8Wes5HlC3XjlfaNj/dW6Xs1mVDEvkvbDROh1ZC/OMy+KNNhd9SwzscFlNWjQ723g/iCSQPAlD7GGbvg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(7696005)(52536014)(6506007)(55016003)(41300700001)(110136005)(33656002)(478600001)(54906003)(316002)(186003)(4744005)(9686003)(122000001)(8936002)(26005)(38070700005)(5660300002)(38100700002)(2906002)(83380400001)(66476007)(86362001)(64756008)(66446008)(8676002)(71200400001)(66946007)(76116006)(4326008)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9878
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	43d57640-ff22-4d09-46a5-08daacc37358
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	by58PlG9gSvS8cM/PYuuTLKC/qHpD7y38356q7C1Hf0lSO+wI/PfLn/HV1gTiul8hX0dq1eCGNlPpMlsSKBoY9vDbVH5WE+nGy0dvqQY9JimcUGCJqR9NJwS1ZD+IFnzTaL0tie/AT1FpycOuNEUKIAIHbTkVYB5nj6o6cXQFVZQDC0hYuqnFgyhnD+7mBrNlv8L6rIRf/DrYPaKVDgQo+efZ7DAlJPWe8mdjmY6/xryxVaOd3RExau5QjKfgfOZAAF4jMFVVmbyqlNSVt+LNLa/lAuS3NoGmuFRAiUObV08cLxhxPSk1DxEI5fzCSCW1TsaCAgX1LOrcUY/bB5kTbgUjUGolKXREk5f6Iir5PUNh+6z0hGdGuiNP6XWL/qYAKgv7Zj7QnaveBtIdPuIIKMtKDhqpdt3Z8rp6Et/Hlujz5hA91gwS1RZqLLeAOwRpeqotD1+TyTNhy6GXEuJ0jjhqGY3w1GdNj1R9YcCQVMViqctfFB+FnOzoRGe8A3K42d/q7eyPqQCpIT+dojxPGEQet6CC1x0zDxQKxo5JzFC1rPRu7e80YUVtJa2ow3P5/HMaQ8X7tT/BwiKlDtBvsIY92/l9cC/jlSyszA5WByEpgn8Gzo9RvsAepO/YhcnAS25enlcRcGRPyBXYPBslL06eqrd4dVfLEgjpg5zBiguceY+g4mWxFV+POSA1OeugshZXcQgFs+xQRccd81dVS4d2zMIBqyicdKfRZZy3OwBksdrAGa4YIKLaGv2VtRnzof6WQP2DFmtB+bzlI7Y5w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(36840700001)(46966006)(40470700004)(356005)(478600001)(82310400005)(82740400003)(110136005)(54906003)(86362001)(40480700001)(4744005)(47076005)(52536014)(336012)(26005)(33656002)(186003)(316002)(55016003)(7696005)(41300700001)(40460700003)(2906002)(36860700001)(83380400001)(81166007)(70586007)(8936002)(9686003)(5660300002)(70206006)(8676002)(4326008)(6506007)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 02:34:37.3426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dda66362-7cd1-4116-d380-08daacc378f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7619

Hi Andrew,

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Subject: [PATCH 1/2] tools/ocaml/xc: Fix code legibility in
> stub_xc_domain_create()
>=20
> Reposition the defines to match the outer style and to make the logic
> half-legible.
>=20
> No functional change.
>=20
> Fixes: 0570d7f276dd ("x86/msr: introduce an option for compatible MSR
> behavior selection")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

