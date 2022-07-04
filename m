Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA824564EF0
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 09:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359884.589152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Glp-0003il-Tv; Mon, 04 Jul 2022 07:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359884.589152; Mon, 04 Jul 2022 07:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Glp-0003gN-R6; Mon, 04 Jul 2022 07:45:25 +0000
Received: by outflank-mailman (input) for mailman id 359884;
 Mon, 04 Jul 2022 07:45:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mey7=XJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o8Glo-0003gF-D8
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 07:45:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70070.outbound.protection.outlook.com [40.107.7.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 429261a6-fb6d-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 09:45:23 +0200 (CEST)
Received: from AM5PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:206:1::27)
 by HE1PR0802MB2604.eurprd08.prod.outlook.com (2603:10a6:3:db::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 07:45:20 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::b1) by AM5PR04CA0014.outlook.office365.com
 (2603:10a6:206:1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Mon, 4 Jul 2022 07:45:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 07:45:20 +0000
Received: ("Tessian outbound 4748bc5c2894:v121");
 Mon, 04 Jul 2022 07:45:19 +0000
Received: from bed862a63e97.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C0D5A5CF-12F0-4745-A68E-7DC998581703.1; 
 Mon, 04 Jul 2022 07:45:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bed862a63e97.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Jul 2022 07:45:13 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR08MB3406.eurprd08.prod.outlook.com (2603:10a6:803:7b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Mon, 4 Jul
 2022 07:45:09 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%6]) with mapi id 15.20.5395.020; Mon, 4 Jul 2022
 07:45:08 +0000
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
X-Inumbo-ID: 429261a6-fb6d-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oAtUZJmPuUmcyDNoySdhgn+d5aI1mMR0TdjH7cH4tVztTScfKIcSwXWTbSjR18QkMnaL8xhte1ZST0mLECdJ3etZq213QXbHGCugituJnmZQLEWE+WN8tqwmvJ3tbLu00uQjKAe1E9MsrjlIqZfAbf/z+ofP+DhZ2Qc9HUYA4LxSurXNn/CRvqJ7HqLO1ufD0TacwgGmyM5/GZ0f0HvHuims2Hcy5s20WiwR4BAnBzbDeNq9/W7nWOhsQ/c7uqZ5q+VgTyYdw2NLmX+KA4dR3JRX7B1rw5nhOzJYh4WvZ6LEEtE+26E/szmYwctYPhL/WMFjSLHBvajmiEa4sh6U3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8FmYl87tvZLpRtZjpyus40w4spZQF0EdNwJFRPaW4w=;
 b=n/oj062YGCDBrKKYvfbAAwky7UvWmT9zpHraUwg28Q/JqGAzItCUylgejR3Ok68IE9vhKTUsbuHq767LWyijUnu14MZ99CoQhfTjK355jnMr/cO2D86i/7bGtDnZvvPqslSi6dKy0xsnJBJy4XLGHjVIl4M3nzcDwt1HKHJ7M57ooK9VJRiNfa3XFvOOtO837QGYVBlKgFiMIHHX9QIndxKL69NJzytBJpn0rDtZLBqqaVGtj3Tng01inZZ9SgjraxMQBztqiP/Hw9XQH3/Uugo7wYf+TS9pAmRpc+5ZYT+ofTtnGQUtIoA051pvHwVyWE33paPHtuHvMBRcK+Zi5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8FmYl87tvZLpRtZjpyus40w4spZQF0EdNwJFRPaW4w=;
 b=fiMQdHL5BFoCYtMCccldad7f6rp4nCtWYY9ZcKaX9Bk/PHsFou8S0JOGy6wj2A8pX0fgs6L2YV3sTowKExJxEZRJ7XYiefMoY+bcfgeyNbXa+Kb2Lpz4pBgn9QWZd93XyXPaAb78cG0bmgoh/UoCfbzkrqoFk2HwlAeq/C6spgU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/M2UoL1jnVsMfAC7HJy7FWey2EYMzk33YSvB+l9oV8oBmV539Pl/a4JG/yFLsmY+IQYCH83wWKq+5BAfjbY85j1c63hCaiduyE7u2C8Z91z1lPUZA48OlsaqSz7mwstT91OD/pDjDtI6URBhTMcQWS4M77XH9kqbzlkKSd2ih4zc+AXsrzvZJtiHoi0lHZBk+hFdIqi98c6NWrt4N2kSrlUVYWEPVdSwzlZJZKP5/jNrXyc89c/bWXH8evkghujDS8xkg7zSVhI26cjBfT7vVTlGf62iuaeQTcdjGdbebr3fYhKazjbd///tup8bDxhyZwfl2E088tRIn8eKNnZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8FmYl87tvZLpRtZjpyus40w4spZQF0EdNwJFRPaW4w=;
 b=NToPHy6BLtAM5en2DDlUZuRf+e6HNBpJ/tmwgv8P8A3Niqkw+/Z3zW2w17JPqAO0pTsfIB7bwl8Hhsbl/5KJ339z6KhDBpMOPsrG6D0laebStRkyA9dewHFBiJyH9VWK7HiN0y5d0nze18XVAbnToWhJ/ByFV4KYWnLUAsq2zBEAkQrwHjzPjvzy5EBgyR4ntCpEX47/gZnkCfEQHC6ERo9LAm1Bua5KKE1/a6Odts36gMdolB0NGcGorB03FbcJAj83zHGB9eWUeZsf+Qs8xok+yWy8DNaZx2QCppTY35KOkyM4MxLocEdndkLVkQ8D0wvsKKxFkYdU3Dd5lCJTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8FmYl87tvZLpRtZjpyus40w4spZQF0EdNwJFRPaW4w=;
 b=fiMQdHL5BFoCYtMCccldad7f6rp4nCtWYY9ZcKaX9Bk/PHsFou8S0JOGy6wj2A8pX0fgs6L2YV3sTowKExJxEZRJ7XYiefMoY+bcfgeyNbXa+Kb2Lpz4pBgn9QWZd93XyXPaAb78cG0bmgoh/UoCfbzkrqoFk2HwlAeq/C6spgU=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei
 Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
Thread-Topic: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
Thread-Index: AQHYhGRGiM2+sN9ON0uL+hMDdx46E61e+NuAgAApAYCADsZBcA==
Date: Mon, 4 Jul 2022 07:45:08 +0000
Message-ID:
 <DU2PR08MB7325CB781C338947D0576A19F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-8-Penny.Zheng@arm.com>
 <84641d6e-202d-934c-9ea9-bbf090e29bdb@xen.org>
 <alpine.DEB.2.22.394.2206241448040.2410338@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2206241448040.2410338@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 27CB1241F8AC344DBBE19E8F30897D51.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d25eb81f-3042-42b4-55e8-08da5d912523
x-ms-traffictypediagnostic:
	VI1PR08MB3406:EE_|AM5EUR03FT040:EE_|HE1PR0802MB2604:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GhkD9VZ/iV+70Dne9dQ249Z+4vTWy/orXDb5cotE61v8BnWWiYr9uRcYjP5I28c9DgrGB+HXEF8Mb0YqJ0YzZwNTmJFaLtFF3EqrcLolyKOscDdvy+b85f4BiAJloe9kavAREDTWiKK8NCHdrkftpfuXMdxKlOYtbmQY8maLBkyKRP5v8uljvIWg28Yxwf3tCwJjOaU/ujoPiYLM7DcFzjbpriRoHyq/Fcu8J+IJOPenhePiwwuDs4GhxAyoVwQscDi/a6Q6Kt67yYb7fEob6u2ZZIu3lC+i5wWYd+zjE3oyqCW1FIY/n3w3EE3rxeadBli94Ip3gJmGBNjXCXTc4NHzntoY21tn3Vb6TTaKzGxt5vwT62Ks+vf8LPZYcjT73o+OY/W2RPxVszF1aP4B+iGvqsJzgLBr/l9Xuwm+GWO8WPlfsriGvAX7894bGrbyZD4oLimZVSLq5whHzY8xeFwHs7TOFKhgdaYJMg3YhqRb4Zdj7cwPVrefU+ya+npjFsrcbgKncn6W2Ep6b0a6AzOoC6fIi3B0i3AV+e5lNMVy6OLU7vMfy6O5oNvO4BxK6gyBJt1oaeTEMzZc0AjQRyouapro7uu6Hg5yXdMn25DyqFGSyCs5B7lGW+al5JSLD4qMIfuhBPwfFJ18DqRV/WADs46qGGpT9O8Bsz8x3kUW+PFbFsV+qWMZfWA56b5IvvO0t7WZQYvCUdbRoQu8Td9rrSnXIecdrb5dQeVOKZfTWxc/lRS6ocoUjyLlD7y7QgNt0hCUR6gGzC4xq0QdloIpBopxhMsL26EkcxEeKPMc+vcGtozSBWfc6palV532
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(366004)(39850400004)(41300700001)(83380400001)(52536014)(7696005)(86362001)(6506007)(8936002)(186003)(5660300002)(2906002)(76116006)(66556008)(122000001)(55016003)(38070700005)(478600001)(33656002)(38100700002)(64756008)(66946007)(4326008)(8676002)(66446008)(66476007)(316002)(9686003)(26005)(53546011)(71200400001)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3406
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5bd4969-adf9-41fa-90c3-08da5d911e34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1S7FVK7KxU77b0hTyV4h84SEdPIJ3VrXrCy8RIWtaVYlaERCv/+00HhGP48aPwg6crATVqtbItjOEKYSuXmqT1taYADi1/Nym5NBdJhIqFeo2G7z6Z/RJr5wC79p6V2XiLwDkGwfN92GOL6V5+pFeo/xTqKUZwAL1FgGz6zYzMuv6z45Rt2uTgYnvqmy8XAA3j3kDEhBh94qZ1DKVQdQ6V17x0SIX25iE9Mr37MHIn5tuo2BO0aYyoWvhPq6yJHg1TbScp7uyqzgBBx0YiG071e2Zj8/AW1A8kcpqEuWvw5W596YMOL67+k2SxLgPDcnEMephf+wFz/t7z+yHEHoJ4vNHeF1omXYDCLDm7k83EH6N9puCk78cGL99YX4o6Ua80BkO+iqUkDn3kPmWKS606KWsgKikrtFW0LkAWCCRk1TPsr59Uftshr7BrRFkUVRXwcMMXPGoKDwfjXyxqt7xUnTgMnLm2gsLfrqUXJ2QceMPRWvrJLuDL975RiCCHlGkewy92AdMj1N5FWT18H5Prhcep4Z443O0/EjBUvcdQbGT5cygnBD4f+3xVPJUCOXmMzh3q6ODJfaCXVapzAwpo4dPsO2rngliqU2DkxzAoWbYeCBeN6trCyIDdxp+vosrR3aVs/Bl/QKLSt+NUA/8C1gBRhG6Q7IdGGcJppvLQxLOe7118QrDSrxrIDLTxSIlAm/o44WgCL2b3O0uPooLh7XRwnakLdA8PTzYPOoFBerkvOQJkims80OVsJ/9ivI9Vuy6/Uh9TtRaK3lVGrqtuXH2G0zzLS573/ZUbZ12DK+f+f0xbDNehdn6izkb/fZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(346002)(36840700001)(46966006)(40470700004)(54906003)(81166007)(110136005)(2906002)(316002)(6506007)(8936002)(52536014)(82740400003)(8676002)(4326008)(356005)(7696005)(5660300002)(70206006)(9686003)(26005)(83380400001)(53546011)(70586007)(107886003)(186003)(40460700003)(336012)(47076005)(478600001)(41300700001)(36860700001)(86362001)(33656002)(55016003)(40480700001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 07:45:20.0122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d25eb81f-3042-42b4-55e8-08da5d912523
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2604

Hi Stefano and Julien

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Sent: Saturday, June 25, 2022 5:57 AM
> To: Julien Grall <julien@xen.org>
> Cc: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
> Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Subject: Re: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
> device tree
>=20
> On Fri, 24 Jun 2022, Julien Grall wrote:
> > On 20/06/2022 06:11, Penny Zheng wrote:
> > > We expose the shared memory to the domU using the "xen,shared-
> memory-v1"
> > > reserved-memory binding. See
> > > Documentation/devicetree/bindings/reserved-memory/xen,shared-
> memory.
> > > txt in Linux for the corresponding device tree binding.
> > >
> > > To save the cost of re-parsing shared memory device tree
> > > configuration when creating shared memory nodes in guest device
> > > tree, this commit adds new field "shm_mem" to store shm-info per
> > > domain.
> > >
> > > For each shared memory region, a range is exposed under the
> > > /reserved-memory node as a child node. Each range sub-node is named
> > > xen-shmem@<address> and has the following properties:
> > > - compatible:
> > >          compatible =3D "xen,shared-memory-v1"
> > > - reg:
> > >          the base guest physical address and size of the shared
> > > memory region
> > > - xen,id:
> > >          a string that identifies the shared memory region.
> > >
> > > Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > > ---
> > > v5 change:
> > > - no change
> > > ---
> > > v4 change:
> > > - no change
> > > ---
> > > v3 change:
> > > - move field "shm_mem" to kernel_info
> > > ---
> > > v2 change:
> > > - using xzalloc
> > > - shm_id should be uint8_t
> > > - make reg a local variable
> > > - add #address-cells and #size-cells properties
> > > - fix alignment
> > > ---
> > >   xen/arch/arm/domain_build.c       | 143
> +++++++++++++++++++++++++++++-
> > >   xen/arch/arm/include/asm/kernel.h |   1 +
> > >   xen/arch/arm/include/asm/setup.h  |   1 +
> > >   3 files changed, 143 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/xen/arch/arm/domain_build.c
> > > b/xen/arch/arm/domain_build.c index 1584e6c2ce..4d62440a0e 100644
> > > --- a/xen/arch/arm/domain_build.c
> > > +++ b/xen/arch/arm/domain_build.c
> > > @@ -900,7 +900,22 @@ static int __init allocate_shared_memory(struct
> > > domain *d,
> > >       return ret;
> > >   }
> > >   -static int __init process_shm(struct domain *d,
> > > +static int __init append_shm_bank_to_domain(struct kernel_info *kinf=
o,
> > > +                                            paddr_t start, paddr_t s=
ize,
> > > +                                            u32 shm_id) {
> > > +    if ( (kinfo->shm_mem.nr_banks + 1) > NR_MEM_BANKS )
> > > +        return -ENOMEM;
> > > +
> > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start =3D start;
> > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size =3D size;
> > > +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id =3D shm_id;
> > > +    kinfo->shm_mem.nr_banks++;
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +static int __init process_shm(struct domain *d, struct kernel_info
> > > +*kinfo,
> > >                                 const struct dt_device_node *node)
> > >   {
> > >       struct dt_device_node *shm_node; @@ -971,6 +986,14 @@ static
> > > int __init process_shm(struct domain *d,
> > >               if ( ret )
> > >                   return ret;
> > >           }
> > > +
> > > +        /*
> > > +         * Record static shared memory region info for later setting
> > > +         * up shm-node in guest device tree.
> > > +         */
> > > +        ret =3D append_shm_bank_to_domain(kinfo, gbase, psize, shm_i=
d);
> > > +        if ( ret )
> > > +            return ret;
> > >       }
> > >         return 0;
> > > @@ -1301,6 +1324,117 @@ static int __init make_memory_node(const
> > > struct domain *d,
> > >       return res;
> > >   }
> > >   +#ifdef CONFIG_STATIC_SHM
> > > +static int __init make_shm_memory_node(const struct domain *d,
> > > +                                       void *fdt,
> > > +                                       int addrcells, int sizecells,
> > > +                                       struct meminfo *mem)
> >
> > NIT: AFAICT mem is not changed, so it should be const.
> >
> > > +{
> > > +    unsigned long i =3D 0;
> >
> > NIT: This should be "unsigned int" to match the type of nr_banks.
> >
> > > +    int res =3D 0;
> > > +
> > > +    if ( mem->nr_banks =3D=3D 0 )
> > > +        return -ENOENT;
> > > +
> > > +    /*
> > > +     * For each shared memory region, a range is exposed under
> > > +     * the /reserved-memory node as a child node. Each range sub-nod=
e
> is
> > > +     * named xen-shmem@<address>.
> > > +     */
> > > +    dt_dprintk("Create xen-shmem node\n");
> > > +
> > > +    for ( ; i < mem->nr_banks; i++ )
> > > +    {
> > > +        uint64_t start =3D mem->bank[i].start;
> > > +        uint64_t size =3D mem->bank[i].size;
> > > +        uint8_t shm_id =3D mem->bank[i].shm_id;
> > > +        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> > > +        char buf[27];
> > > +        const char compat[] =3D "xen,shared-memory-v1";
> > > +        __be32 reg[4];
> > > +        __be32 *cells;
> > > +        unsigned int len =3D (addrcells + sizecells) *
> > > + sizeof(__be32);
> > > +
> > > +        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64,
> > > mem->bank[i].start);
> > > +        res =3D fdt_begin_node(fdt, buf);
> > > +        if ( res )
> > > +            return res;
> > > +
> > > +        res =3D fdt_property(fdt, "compatible", compat, sizeof(compa=
t));
> > > +        if ( res )
> > > +            return res;
> > > +
> > > +        cells =3D reg;
> > > +        dt_child_set_range(&cells, addrcells, sizecells, start,
> > > + size);
> > > +
> > > +        res =3D fdt_property(fdt, "reg", reg, len);
> > > +        if ( res )
> > > +            return res;
> > > +
> > > +        dt_dprintk("Shared memory bank %lu: %#"PRIx64"->%#"PRIx64"\n=
",
> > > +                   i, start, start + size);
> > > +
> > > +        res =3D fdt_property_cell(fdt, "xen,id", shm_id);
> >
> > Looking at the Linux binding, "xen,id" is meant to be a string. But
> > here you are writing it as an integer.
>=20
> Good catch!
>=20
>=20
> > Given that the Linux binding is already merged, I think the Xen
> > binding should be changed.
>=20
> We would be compliant with both bindings (xen and linux) just by writing
> shm_id as string here, but if it is not too difficult we might as well ha=
rmonize
> the two bindings and also define xen,shm-id as a string.
>=20
> On the Xen side, I would suggest to put a clear size limit so that the st=
ring is
> easier to handle.

I've already made the xen,shm-id parsed as a string too, seeing the below c=
ode:
"
    prop_id =3D fdt_get_property(fdt, node, "xen,shm-id", NULL);
    if ( !prop_id )
        return -ENOENT;
    shm_id =3D simple_strtoul(prop_id->data, NULL, 10);
    if ( shm_id >=3D NR_MEM_BANKS )
    {
        printk("fdt: invalid `xen,shm-id` %lu for static shared memory node=
.\n",
               shm_id);
        return -EINVAL;
    }
"
The size limit is smaller than 256, just as stated in doc:
"
- xen,shm-id

    A string that represents the unique identifier of the shared memory
    region. The maximum identifier shall be "xen,shm-id =3D 255".
"
Hope this fits what both of you suggested~~~

