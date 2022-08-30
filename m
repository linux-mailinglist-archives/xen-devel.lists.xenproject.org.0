Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C465A58B9
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 03:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394765.634297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpeJ-0006jx-7N; Tue, 30 Aug 2022 01:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394765.634297; Tue, 30 Aug 2022 01:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSpeJ-0006hi-48; Tue, 30 Aug 2022 01:02:39 +0000
Received: by outflank-mailman (input) for mailman id 394765;
 Tue, 30 Aug 2022 01:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y69e=ZC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oSpeG-0006hc-Pv
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 01:02:36 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50040.outbound.protection.outlook.com [40.107.5.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f10ff72-27ff-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 03:02:35 +0200 (CEST)
Received: from FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::23)
 by DB9PR08MB7559.eurprd08.prod.outlook.com (2603:10a6:10:306::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 01:02:29 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::a3) by FR0P281CA0046.outlook.office365.com
 (2603:10a6:d10:48::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Tue, 30 Aug 2022 01:02:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 01:02:28 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Tue, 30 Aug 2022 01:02:27 +0000
Received: from 58097fd67bce.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1F9E12D5-AB00-4033-B402-D92466EC7709.1; 
 Tue, 30 Aug 2022 01:02:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58097fd67bce.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 Aug 2022 01:02:17 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB2768.eurprd08.prod.outlook.com (2603:10a6:802:19::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 01:02:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 01:02:15 +0000
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
X-Inumbo-ID: 6f10ff72-27ff-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XS2/9AvtbuF2xbqlu/fRMaT/MbMnIwxAc+7DOnB2fw6FNeJX1P3olYE/9SsIzdPwWoS1jTawkoHkRxWWZcKa81oGSYwltIzXGlbu88JqLN9+F4UaGuyhjLhp1/U2G2uU4Sopfl52uOfQzAdhL3mnXsj77xbhzbJo9VAh6wXAZxOwmHVUm2ZboAvznVyRWFlnWSv9dCF83pPd3XYxrcsrBTyCHuuhQF626giz30LhW3bBGLR51ll4b0Mh05V+XSLPyebdY2z1XDt3BvWd2PS752NjCB5Txyc7mAXwmno69Bm1KM6aY8DTZGD+Zri45DbjZsbO+5v5rpJkvKOsL8Rziw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6CKKyPn5Sb1MhmyJZO1J07I1ByK2ERPwPorgsNG1yw=;
 b=c5LUzdmwmhpTtBDatoayxLc/R91YXAYi6o/rNfnES9Q8o2hfy5/4pSwtX/MtADo/vp7BLOrnTc62I+Mm8NoZyTvzLgwZLFJNNlenOLkY9NXL7m25t0DdFNCLHrs1kR1Oar0TXD9qLJpgsve4eV8UYzv7bgqOs/E6UR6JNMsximvbnYEByU+CKLn8IfH4/5Uv36ro1lFHnOhyUXuXLIAA4Hz9aV6EWu6kPMLVV18D+2qOA/gkqhQasmzFyvYcUTsGPD0AqfrIw5NyTCzHMhyOJ3UywSCWbKJKN7Ff8m1njkZIXcy5LZETF/Tz62vPzhRnOQ+0ajHEHTBG+7sNnpAqNw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6CKKyPn5Sb1MhmyJZO1J07I1ByK2ERPwPorgsNG1yw=;
 b=c0ld/WyODX5wB7knZ80o/z1YX2/RY1m6Ru0C6NEWEkQIIfPsl9K3WapQSNK+2VreKeHx/ruagoYQxsyiceEShcIe4z5ncDvzCL3MJOK1QuCjw3l7E2QBSTkle+2ZdQHytT4t5RYAFNOKkBU4+XSBFkN/jYvth6p1qjgwmDZ3oYM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsfqMigOH4W1ji1OkhWPlpA+ln9EfuaMJKjFNBnJQpXQnjlWY1yO9EX9HGrmClvaH9UQn7jvDxQXNUy5pTfSIG+faQU2NQ7cILaIzd28VyK5cmUkP55coh27gPNG6WEr2HTEYYG3Nqg2pJsxsakrFcFy/QjRcpHJXMaKiP2Ch6CjaAMl1ZIorpW9q8Wcm8DLZRcaf2kgnr+oum9lcWF6Yxosl7p2/CSAMGrCEG2/lYv529cnsURbU+/26dG3HNH5rh4ckoD4NAzLwfBcVI+u8n8qhwNPV12wmqgPtNzdJPMbwWYjOJ+d0lvbsMDALEJmmYefPBN5pEzGF2TEp4L30A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6CKKyPn5Sb1MhmyJZO1J07I1ByK2ERPwPorgsNG1yw=;
 b=igA4Vp8xeHcLXtRet1lSJZeEQFVmzTpgQ/X7SwJHVPhyR7jW5uuaxFcEjwHaky6Cphe89no+XJRyGkOjvrk6I6ifvvtY+EZNmj5Z1ep5YtJ8r4lW6+BmpAzdsPuOqAEIl6Gt0HTPPio2lUobPi2Vdf9trmcu9RetUzoR9bGjqcfXCln1p31aNtKWygQTz4jBoXR6cblXTP6/fGkT6MBnwemrTLoDsj+g6BKy4nT06Q3qUdxWJuVCijWsACKso/P7VL/S3/nCH3cC3FOpoyEgt/tarWk07aUOhJ1h5qTp2xkYwBR7tLgpbvDen7hEluqV5B5i+hDyda1KamUZZfVNnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6CKKyPn5Sb1MhmyJZO1J07I1ByK2ERPwPorgsNG1yw=;
 b=c0ld/WyODX5wB7knZ80o/z1YX2/RY1m6Ru0C6NEWEkQIIfPsl9K3WapQSNK+2VreKeHx/ruagoYQxsyiceEShcIe4z5ncDvzCL3MJOK1QuCjw3l7E2QBSTkle+2ZdQHytT4t5RYAFNOKkBU4+XSBFkN/jYvth6p1qjgwmDZ3oYM=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Penny
 Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Topic: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Index: AQHYt4ueuuTQX+2f5E69518db+C55q3GpJwAgAAEF1A=
Date: Tue, 30 Aug 2022 01:02:14 +0000
Message-ID:
 <AS8PR08MB799110660D0CED682E29854592799@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-2-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2208291726300.1134492@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2208291726300.1134492@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CBE2FF08C14FD94B9D5BAFFC2925FA6F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 078b60fd-0ec2-4b4a-561a-08da8a234f3e
x-ms-traffictypediagnostic:
	VI1PR08MB2768:EE_|VE1EUR03FT045:EE_|DB9PR08MB7559:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nxt0CR1LP7bEeO4SMECRFY5g/tm2GTzQj1q+SSBJaxjNC7On3mvlYThEHkRMkDmkD4FuSpknzSxQmb6R5IfP0pvx1Tf0dWxGTCrwLslKwmSqgMeZVEr73nYMUWG5kuS9z2LfC4L6fs8KFSl30SsMsOQh5xBPKNJOovmnz3ZtWWBKpywXRWeJY85kdnuh8yfQkwpZzccMv8RHNqVnu5E+JlmU+Qnl4UxqRMHPKLf0EmQoFRbJQkpvz9z0W9IcY2j6InVAfOB1RserCw2sImb1NWKHM4940Is558MsxlmBxK6C/3QndPQctcO+474zKevZOPjLBhsLOXz2tz5ZqRr0+Tpylj1Fs5/FAgGLhOpjWQ3ENi6I2JmF/NonwjMCk22W4G2k2YM2xxrap6vN6zS8/BnM8KnvnFp3udWO4QjVRyJA3Zya4tJLDhoyuYcaoPzzChGHaADyhZEPpoyLTt9cSnpSY9n0TVCK79EoOv2cPh+7o0b4s9ST0Tfh1lAKigWuwBg4secrKQ2oy8dG0yus36sByBslG3ike0cEB81qtx29z/tLLW0hrmXGh79A7tdPGB6ZOx6QMLDQuAOH1yyiFhS5SRcYw6hOgr4fxZVKDi4qvDRWCO0cU0h+d5aFSJdx8+lIf8D2ptda+vW0hk/n1SWB4DBgAuHsGr2H1LMzyPYm2lV4fJPqEV9wdgvnT4mId63KBr7L7uKjKY2txapBo1pFlHPS9NenBeyMiDgxJXl1XPxo7hl1rh8RlEwOAk0sVYNME00+p/nDEc8ALPyXEQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(38070700005)(26005)(478600001)(83380400001)(6916009)(5660300002)(52536014)(2906002)(8936002)(186003)(8676002)(71200400001)(316002)(33656002)(4326008)(38100700002)(122000001)(54906003)(66556008)(66946007)(66446008)(76116006)(64756008)(9686003)(66476007)(55016003)(7696005)(86362001)(41300700001)(6506007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2768
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6f13165d-3b03-408a-e302-08da8a23473f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p35y8eH+x2B4mTASaYC64fLISEfHt2sfkk8N5E+c2h/Yo9V4QjxemnvTfUS3qlJ/FwWwJFdgKaloWdnALKrzDsrecH1tlMYSB2rYw0+JZi4/TETn189EsDezDmMTSZTYHqn9Jmt5cW/XdK5PxsHxxSDiHQhT4ys1lCiFVZR9IEX6IGvoEzl2ULN9Nzl0A2zS+FQHbQh8CPKPFpkPEupMR01leZj3KAKOBjcnhhHMOXUtOu45z50j52vneNQT7j2bbXRLQlY46Nv3n21Eebw3N5D+FlIYxoiZwyravCNyqh0Sjc3L4uulN0cGWsuquXgszcEhwR89P1xp0/JvcUSWr8V6vlugpgQ9JS2AJgjTxRzRd6Lop5WNOL2PhoRfOaMNwHWYlsfbvDFNuiUAdf2iOD4aqjb6OyljbLplyHAbbOMSsk0cSV0DDRpAncKDYlElbz9r3539ev0yGbMG2Ai/KuqBIEG+c46cEC/2E1M/mlkKSDWte3sWChLU7x5itfMZH76dPCR/G0HbOT/7n22MFl5VBGIqmUB3EHcIP/ODRAxemxN2HAAM+2u7Ckj+UY8dgHqqLJAVG1fZSmUoE5i6hvMuHicMRhQ2ZoLl0jpBM0/7wXjuxMnVG2nDzbbVfFKDqTo8IwWuiVXrm+9s6x6Iw+/LAIJB/5h9mp0ODrEPUU2CR3zaZwl15YT94VlF25Trt3UFcgqCYHHNF2dVrJjj16iFZp2sEr+pEdv85IMzxnYImPnDlXjRjZcWv00fob1jvRqkun1M/pzMvabI8q6GcQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(41300700001)(40460700003)(70586007)(70206006)(478600001)(336012)(33656002)(55016003)(8676002)(4326008)(36860700001)(2906002)(83380400001)(6506007)(7696005)(47076005)(26005)(40480700001)(5660300002)(6862004)(8936002)(52536014)(9686003)(82740400003)(316002)(81166007)(86362001)(54906003)(186003)(356005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 01:02:28.3070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 078b60fd-0ec2-4b4a-561a-08da8a234f3e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7559

Hi Stefano,

> -----Original Message-----
> From: Stefano Stabellini <sstabellini@kernel.org>
> Subject: Re: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
>=20
> On Wed, 24 Aug 2022, Henry Wang wrote:
> > ---
> > The name of the device tree property was chosen because we want to
> > reuse as much as the device tree parsing helpers from the static
> > memory allocation feature, but we would like to hear the upstream
> > reviewers' opinion about if using "xen,static-heap" is better.
> > ---
> > +The dtb property should look like as follows:
> > +
> > +- property name
> > +
> > +    "xen,static-mem" (Should be used in the `chosen` node)
> > +
> > +- cells
> > +
> > +    Specify the start address and the length of the reserved heap memo=
ry.
> > +    The number of cells for the address and the size should be defined
> > +    using the properties `#xen,static-mem-address-cells` and
> > +    `#xen,static-mem-size-cells` respectively.
>=20
> I would choose a different name for the property not to be confused with
> a domain's xen,static-mem property which is for a different purpose: the
> memory of the domain.

Sure, thank you for the input. I will correct these in v2.

>=20
> ---
>=20
> - xen,static-heap
>=20
>     Property under the top-level "chosen" node. It specifies the address
>     and size of Xen reserved heap memory.
>=20
>=20
> - #xen,static-heap-address-cells and #xen,static-heap-size-cells
>=20
>     Specify the number of cells used for the address and size of the
>     xen,static-heap property under "chosen".

Thanks for these!

Kind regards,
Henry

