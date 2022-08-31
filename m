Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7785A7351
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 03:25:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395244.634780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTCSt-00038P-9D; Wed, 31 Aug 2022 01:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395244.634780; Wed, 31 Aug 2022 01:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTCSt-00036Q-61; Wed, 31 Aug 2022 01:24:23 +0000
Received: by outflank-mailman (input) for mailman id 395244;
 Wed, 31 Aug 2022 01:24:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zBhm=ZD=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oTCSr-00036K-Ip
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 01:24:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2079.outbound.protection.outlook.com [40.107.21.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2f3ba3c-28cb-11ed-bd2e-47488cf2e6aa;
 Wed, 31 Aug 2022 03:24:20 +0200 (CEST)
Received: from AM6PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:20b:f0::14)
 by AM8PR08MB6420.eurprd08.prod.outlook.com (2603:10a6:20b:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 01:24:16 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::16) by AM6PR04CA0037.outlook.office365.com
 (2603:10a6:20b:f0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Wed, 31 Aug 2022 01:24:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 31 Aug 2022 01:24:15 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Wed, 31 Aug 2022 01:24:14 +0000
Received: from f6512c2ba877.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4DF03A38-4948-4593-92C7-4EF4FB95F2DB.1; 
 Wed, 31 Aug 2022 01:24:04 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f6512c2ba877.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 31 Aug 2022 01:24:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB8104.eurprd08.prod.outlook.com (2603:10a6:10:384::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Wed, 31 Aug
 2022 01:24:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Wed, 31 Aug 2022
 01:24:01 +0000
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
X-Inumbo-ID: a2f3ba3c-28cb-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gtUqO1dke/xMBgIATmmwa0xBDzRb3T/TJ1J/n1/LpmaW7MKullYa61o5y0ap0EAN23sDofkPiPrLnrFp9NC7l44whgEJ83yvsQClkglTC0KcKGuhxtuI2v3jAOOYJj4qeOab7n/bCCiDQOQ0KfBngpvg/JGJzg5HL30OPMTylZyKRLKipagjqQU8+PK66T/O5KsdjzfDaYnxmcYuWxWpSKBoX3QTxSgkgO4itFqUri+ZA4Gg60l5n9svWHLlV5TyxuqlcLu6GpWVFrEv4U3TNemVWJUdnBnoxc1h27GgkDL1+2W2Ai0E3tabrsX5FPjs7pCWs5f1LW626w4FSp8SkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3hBU/xgD1n/onMg022a0kkz+wuI8MEKgZkKup2h7dg=;
 b=nz852n5BkDwFhoWuV3ebg9abhwj7e+YAmQfW1sqy2yh4BRBpsVCzzlVL374LdiUYnBFKLfVEWRqFZOCXkUhDQt9ElE0Rb7cEKtTwcgi2/Jbj7avB7Cw9Y8EUFsx0LdXBCk3D613s8eZS3FPc7vzbpwAje6pN7el8fdj6Mpx6DKi877AnFrnvnjTSnLJZ2gyiwXqRC7/xN3jak5F0dgpzhIbiuq76D7X+bvYU2Yjes8g/7pWL9UJjhnEayEusoiWdlJ0vXHvQqOoVbCxUO38KVIGedZGQjgB3yLkiLKe+8atD+EvSzCnW9IUzitnsi96xQB0EuUN+6451lwwirt4nbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3hBU/xgD1n/onMg022a0kkz+wuI8MEKgZkKup2h7dg=;
 b=mN7FsDYIG0q1o8b0Bt98NTLiuTUniE7Rwfi20TyGmf9VA1c82n9P6g0ECWSzGUOqo/BzlR3WbqblmnFhz1cfT6Emj5vwAc0tr5stD2zVGz/9ruYHS8OjI+nmj9Teh/6PL3R7ujzM0LDurxctLLG9ad4vbse+kXL8zNZRAPPyAOA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hwHcBjvm6kMQquLO37vDrO2GyKPnIDrF2tu9lnXjYs1aqYYLSKkKvgjHarjhYsFPUeAnWV7QVHPSazfkDmKpBvDs+m3VaNDb5yuR4gv5NIYqnHm1Ug+zu9Sp7gN9iRy/oM2PnhUt9U2Vmf891+m4nJwblD7vybAGA8ZOsX+dqmJTpfaeWq2CVpUwWOB+E7d4EW7Nn1xRgfQnyrmjHqoFuKoX4mDSIwWGIbsfCgQC6djOeQHc4spyiJUqfYKDbxiuvzjdqBnmuadzVPtihEGfB5jj1aYAz6+pjl3nZ/c3j9f6ESAG2Y2hvlzi0MO0IeRk9iNbt+kqIeg19fjR3UPiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3hBU/xgD1n/onMg022a0kkz+wuI8MEKgZkKup2h7dg=;
 b=QsO5jFt0ejkdwk8NHp2rKiv7+dZQOzr2m8KQg+5Nvp5XJLd/wtKVPPaqI2g1ERN331QGfRit7/l3Uc88wLVvc7Y/FpqFA6iNcx93MFxNSY/1mcm9AHPvOyyw/ed5QVe47grA/gkpWvk6I52KOkfB4XVu85fle55lLykHfY9uABmJCwP5ttnJjvgBUiR9Aimjm5rmuWAyZWWiS/Nq5hZj1wLLuQhnRR/Bt4qPTXyp1Bz93YSOkccR9kXBSNDdJRMU3cL17MvegUZETZc6T990IC1mLw/uqmg/XG8YcV20gB7RKAF2bVt4JozrIzxRT5Fi0mmwXe/jEs6Efz2Jh0pcuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3hBU/xgD1n/onMg022a0kkz+wuI8MEKgZkKup2h7dg=;
 b=mN7FsDYIG0q1o8b0Bt98NTLiuTUniE7Rwfi20TyGmf9VA1c82n9P6g0ECWSzGUOqo/BzlR3WbqblmnFhz1cfT6Emj5vwAc0tr5stD2zVGz/9ruYHS8OjI+nmj9Teh/6PL3R7ujzM0LDurxctLLG9ad4vbse+kXL8zNZRAPPyAOA=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index: AQHYt4ugTfbCAM/WyEil7pMplK0r3q3GqcQAgABmBoCAAKwSgIAAgPtw
Date: Wed, 31 Aug 2022 01:24:00 +0000
Message-ID:
 <AS8PR08MB7991AA505E621A7B6E8B906192789@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2208291755450.1134492@ubuntu-linux-20-04-desktop>
 <AS8PR08MB79912EF49AEBA8E5B18B8C7F92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2208301013500.1134492@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2208301013500.1134492@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8FF8B4535F450841AF52350C70B74DAD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0f759920-bd17-4a3c-56d0-08da8aef8499
x-ms-traffictypediagnostic:
	DB4PR08MB8104:EE_|VE1EUR03FT058:EE_|AM8PR08MB6420:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YuwQaHXuJGVxvWDH6CqGvBE5D4bgjbSXmv4sMOcJ3AWgEWTt7XzYGGA19L0S9eObEbtcLSAFxD4V1lZTustYXGX+KNrNwhFWwhcMRPsePLa8E1FBj1gpdomXlC+ObJ81C3EfC199TW4CLE7KR2GAAToQvMBbJtKYckvMVxckDHNvxdj+YJyYrB1ccSrPCHgfX97SgW9mPGEobWT5LqIwSRTt8mtrwUxGQHW/dJE+0EKryL7G/nx4r6jezdzhDqe1UyjA2wsNhW31fEc6dzmvhkAg9MlgHRue+BNyJPfbxWZoFtS1AZMZ1O/qnDoH2CWXmrivEbdoxJf5koYagbDApaFxrEFywvoGlqwyFrhyiaDNvyWH5EGQnc8wFhho4UP9x48bho6KKhYaNOvxOcwnA053RUmYbkEmWvFNQyDANDmt+dr9t9aqPdkbXUWElMDtvhNNTaqc8Pbc9Sssrj6w4CuynSgzZrd6HtxUS3uj2u9sdLGb6QjypRdwVo2ucMEiqfh0Nx4g7MjBzMIU44B7JeZdDoz4cL8Bf8uRWqgNNGieKIvYM3TZzXrFSK00Hz1Vn9KHTYrt7Poqnve1Bnsi9bhroTzxK40O/q8LJ5aOSZ7tx70d5pxYLz6N4MET0laO906iUap0OsqRx+KJ33F2Zb9uWvL2+ijk+Rcbp5aX5L3YkwTHwvN9V6fBbWU98+6UbhfXvpqgixLS/33Il8x8MtbcLAoW1kvZuUI+V9QBuDfBvzhLRi9pSc1MENw3W5a+Exf27FMU/JTXJryziyg/7A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(33656002)(186003)(6916009)(71200400001)(316002)(26005)(2906002)(83380400001)(9686003)(6506007)(7696005)(38070700005)(55016003)(122000001)(66946007)(8936002)(5660300002)(478600001)(52536014)(41300700001)(54906003)(66476007)(38100700002)(86362001)(66556008)(76116006)(66446008)(8676002)(64756008)(4326008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8104
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c5a91fe-0d48-48cc-3df1-08da8aef7c12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U7/X9vPpqxMmOQS/CDciQEfBPvtvpCuouAzUIa4cCSCQRfGPsr/JHkh+Yy0BmbiJnqMWaRrhakp3u0pzjek1w7IhXhh0yWb60EwmNp42NmVnF5Q365ZLKTJvpOi76l0BR+dLODvMnXpUCnvifrsPl+8nUtW9Iby1ms9mU17jNow7xu8R9kci0y8lPVd5a+b5N9FWMat5sjXZAxKXLxRdyHbohl2BbQq09e4nWWTIvGMcaKAZEI5OTCbfNusKCRjrB7YIPNvY/HxyRHrRzitcOROOEhNOIZm+3xaYTNhfGtTTC0F1JQ26FchN8IsdOQmKW0sn7+RuxW3pCJDwubcw8G+rNhNUiZDZuGqwR+djwuTVFt6FG9oDK6txJNVoff2GvVZefwQK7TqjdC5Q4pqCpqOk5mFlcjPXnN9fxA1aup0MJjmJLZAMDGZT7/CIU2IYpAxQiWBX5+EP79g3A8JXJ+F0G5dr3VAWObfn093UIMPl21vrOw+uPJf5CqfNfZ+DAVRXx71CxCBVHicJtyPbE/dqG4OEvTMtETtWfURhIFrV0JqVvK7ihXClT0x+OxlhaCltKZr0YdlDfjMufJBm6FVv6ntAMleiD1ZFN7Ci6Wckhiq0hgFETg8T9QH2BfCiVZFFKGUnlJ31ArEUs/YHrcV1wdWRWqKFm0FsQuasveGTni/H/0P0WW6B4B4abLHa9i6ACFRlWnxzQPXrkOk6HWTP6lqGfYPux9dXLt3ztCYjRaWfDrsbRtyYi3Rg1sFbn7tDj4Qrx95ryFRImgYHEQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966006)(40470700004)(36840700001)(6862004)(8936002)(52536014)(8676002)(4326008)(47076005)(5660300002)(36860700001)(33656002)(70586007)(316002)(54906003)(2906002)(107886003)(478600001)(41300700001)(6506007)(7696005)(9686003)(70206006)(86362001)(186003)(82740400003)(82310400005)(26005)(40480700001)(81166007)(83380400001)(336012)(356005)(55016003)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 01:24:15.1766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f759920-bd17-4a3c-56d0-08da8aef8499
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6420

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> > > and we can automatically calculate xenheap_pages in a single line.
> >
> > Here I am a little bit confused. Sorry to ask but could you please expl=
ain
> > a little bit more about why we can calculate the xenheap_pages in a sin=
gle
> > line? Below is the code snippet in my mind, is this correct?
> >
> > if (reserved_heap)
>=20
> coding style
>=20
> >     e =3D reserved_heap_end;
> > else
> > {
> >     do
> >     {
> >         e =3D consider_modules(ram_start, ram_end,
> >                              pfn_to_paddr(xenheap_pages),
> >                              32<<20, 0);
> >         if ( e )
> >             break;
> >
> >         xenheap_pages >>=3D 1;
> >     } while ( !opt_xenheap_megabytes && xenheap_pages > 32<<(20-
> PAGE_SHIFT) );
> > }
>=20
> Yes, this is what I meant.

Thank you very much for your detailed explanation below!
[...]

>=20
> But also, here the loop is also for adjusting xenheap_pages, and
> xenheap_pages is initialized as follows:
>=20
>=20
>     if ( opt_xenheap_megabytes )
>         xenheap_pages =3D opt_xenheap_megabytes << (20-PAGE_SHIFT);
>     else
>     {
>         xenheap_pages =3D (heap_pages/32 + 0x1fffUL) & ~0x1fffUL;
>         xenheap_pages =3D max(xenheap_pages, 32UL<<(20-PAGE_SHIFT));
>         xenheap_pages =3D min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
>     }
>=20
>=20
> In the reserved_heap case, it doesn't make sense to initialize
> xenheap_pages like that, right? It should be something like:

I am not sure about that, since we already have
heap_pages =3D reserved_heap ? reserved_heap_pages : ram_pages;

the heap_pages is supposed to contain domheap_pages + xenheap_pages
based on the reserved heap definition discussed in the RFC.

from the code in...

>=20
>     if ( opt_xenheap_megabytes )
>         xenheap_pages =3D opt_xenheap_megabytes << (20-PAGE_SHIFT);
>     else if ( reserved_heap )
>         xenheap_pages =3D heap_pages;

...here, setting xenheap_pages to heap_pages makes me a little bit
confused.

>     else
>     {
>         xenheap_pages =3D (heap_pages/32 + 0x1fffUL) & ~0x1fffUL;
>         xenheap_pages =3D max(xenheap_pages, 32UL<<(20-PAGE_SHIFT));
>         xenheap_pages =3D min(xenheap_pages, 1UL<<(30-PAGE_SHIFT));
>     }

If we keep this logic as this patch does, we can have the requirements...

>=20
> But also it looks like that on arm32 we have specific requirements for
> Xen heap:
>=20
>      *  - must be 32 MiB aligned
>      *  - must not include Xen itself or the boot modules
>      *  - must be at most 1GB or 1/32 the total RAM in the system if less
>      *  - must be at least 32M

...here, with the "1/32 the total RAM" now being "1/32 of the total reserve=
d
heap region", since heap_pages is now reserved_heap_pages.

>=20
> I think we should check at least the 32MB alignment and 32MB minimum
> size before using the xen_heap bank.
>=20
>=20
> In short I think this patch should:
>=20
> - add a check for 32MB alignment and size of the xen_heap memory bank
> - if reserved_heap, set xenheap_pages =3D heap_pages
> - if reserved_heap, skip the consider_modules do/while
>=20
> Does it make sense?

I left some of my thoughts above to explain my understanding, but I might
be wrong, thank you for your patience!

Kind regards,
Henry

