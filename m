Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F25F0936
	for <lists+xen-devel@lfdr.de>; Fri, 30 Sep 2022 12:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414108.658204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDOR-0005UU-FZ; Fri, 30 Sep 2022 10:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414108.658204; Fri, 30 Sep 2022 10:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oeDOR-0005Ry-Ca; Fri, 30 Sep 2022 10:37:19 +0000
Received: by outflank-mailman (input) for mailman id 414108;
 Fri, 30 Sep 2022 10:37:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZrHG=2B=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oeDOP-0005Rs-RH
 for xen-devel@lists.xenproject.org; Fri, 30 Sep 2022 10:37:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da22486a-40ab-11ed-9374-c1cf23e5d27e;
 Fri, 30 Sep 2022 12:37:16 +0200 (CEST)
Received: from AS9PR05CA0058.eurprd05.prod.outlook.com (2603:10a6:20b:489::32)
 by DU0PR08MB9417.eurprd08.prod.outlook.com (2603:10a6:10:420::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 30 Sep
 2022 10:37:13 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::e5) by AS9PR05CA0058.outlook.office365.com
 (2603:10a6:20b:489::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Fri, 30 Sep 2022 10:37:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Fri, 30 Sep 2022 10:37:13 +0000
Received: ("Tessian outbound d354c7aef2bc:v128");
 Fri, 30 Sep 2022 10:37:13 +0000
Received: from 14ecf6b5f0eb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7FEBAC6C-CE12-4022-8E95-B31B56112FDA.1; 
 Fri, 30 Sep 2022 10:37:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14ecf6b5f0eb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 30 Sep 2022 10:37:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6273.eurprd08.prod.outlook.com (2603:10a6:20b:2d7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 10:37:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::29d8:8cbc:8a55:811a%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 10:37:03 +0000
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
X-Inumbo-ID: da22486a-40ab-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Wyt1gxEi6zPs33FoiqOx0WUtwOFXTLzwGfaPctQ9PyzOKeRjrMfuvH2467S8kdH6wFgCyanZrh+ZAJP1ivDMbMJBYcm44l7xLVjMT9Jvw/XQFLfSACVpJrgRJCu0zwjl2lDShXNY8CMII6t24etSt4zN8ifF8j5yZ+kdibfBcIf8s+AWGmk49Q9WIvKn9yo9Qd618kGPqPdpy0GVrRsW22LQr9+894Y3lojtwLehGq3KOT7eR7rm4xYZu1QKDOjQP920Enw+R5F0p+XuBZHf9Nk9+2e0JXPtwHiWzbBSC0+cflH1kimFn0Vlu5bUiquyJO4kHWonWsPjxPrq8tkv2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Og+NroRc5H16Hufeu0AtsVJ2qr8qFDmqiSiAVm1Xa8=;
 b=D7kq+iWlGwngbTYk0jmJdQFC/77ugOnAS9ibrLXZgjQKtbOT/AA2LBE0WphVOgRY2B2lbbGp38AXNU6ZovFdh9BJx1D/uymRlKDkrzZ1VSIlinMtC2OUg5dgj0TX9HDnREMfjcrI9qE8JdVact0lt2/uCNKxIGU0NRMzpQmjaGqFoXhDxEvq17i4G7byYCR6zJYsCh/bjp8gI0oDKkxa/kpTyoAXYIKbsXAo/him5A0WwdFpddVNMvGKqeTskjKS1c3YSL3ouRGCOLM97Yc6vW8jtj517VTW5cjniDPjseg0p07+FxGg+BvD6H3BncnMsSsIR7SLfGkGJnyXK1pCMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Og+NroRc5H16Hufeu0AtsVJ2qr8qFDmqiSiAVm1Xa8=;
 b=L5khijSSRUkakwIT/I1qYxoLdwpwcihFyIBzOl0MEIRaZIXzW1TtNdVaHMOEDA9XjNONA1cXTu8P97R6gEGjUpI4qAOyVFEQcRbH1eWship8NJnToYGqC2ZZmqRoG8HtbxbAJ+0SUY2Bth7TDZ4uOl75D18u939dbTngfoQ1/lM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b31788505c63ac1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hUd0VOIzXF1NXGP1+pRTZF6OO/DvsTXFvKyOOh7WG9Syp9i7ETXKA/moo8MinJaW6W7h2AOT04Qnvo6wrCp2Phl39JEX/GxhDKxoKGtIM0TX1b3dr2E0Hp/IFHuAVbbHLCWFNUANfbrWfZEOKM5GF25FiiBRK8ILpgHbNkXueHzAtRoGq0eFsMUyVqzLAl5zVC4piVDqtA2MtiTeOA342O+wHrNeqGuf7VV7YA6QfIvJfo4bPXDOiIkdH+Is51pZG2SBQqjaM5QMFVdHdHBoDHL+769BLl/bDdWm0r7leCmISEJuWuBI5gF18HtKdT36SvbPLJRdseJ9AqkFO3EY4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Og+NroRc5H16Hufeu0AtsVJ2qr8qFDmqiSiAVm1Xa8=;
 b=bXSXXthqIDpW/DrRmreDOxJM2drA4I/e3zY+Dm+rJkddrTTKmQQr6lUADvSi7sHrQFatKftXOMJngRwC1LvlvYgOxZoC9S0eIBYrmi46r2BgrgEMkMeGQQBDjY5O9ZUGesbOB4xBlgiE45gfYLla/hK44zr9a44Ihr1sEl9dGvUZBWILCm721n7xFH+szEiXvBwJ4KjIYYe/zH73ZqK5klQk1WKBY2KXEkITc4At/hZP9B8hxT7ChIyT/HMmWul/laWqTVb8VcpTAhYpnQr1uHd/xNiCLCyv92U2VKDvDufKxG9cg7SVbiSS0ozgmT65lktUUOZR9m8bgur2n6gTBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Og+NroRc5H16Hufeu0AtsVJ2qr8qFDmqiSiAVm1Xa8=;
 b=L5khijSSRUkakwIT/I1qYxoLdwpwcihFyIBzOl0MEIRaZIXzW1TtNdVaHMOEDA9XjNONA1cXTu8P97R6gEGjUpI4qAOyVFEQcRbH1eWship8NJnToYGqC2ZZmqRoG8HtbxbAJ+0SUY2Bth7TDZ4uOl75D18u939dbTngfoQ1/lM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Rahul Singh <Rahul.Singh@arm.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: fix booting ACPI based system after static
 evtchn series
Thread-Topic: [PATCH 2/2] xen/arm: fix booting ACPI based system after static
 evtchn series
Thread-Index: AQHYzzwi5SkcTjaGIEa7tDBb5ugVda330q4A
Date: Fri, 30 Sep 2022 10:37:03 +0000
Message-ID: <E947C7E7-50A7-411E-BBEF-E37131F34AE1@arm.com>
References: <cover.1663928523.git.rahul.singh@arm.com>
 <0c53abc972264b0ea13864b7056fa2149cd78f9f.1663928523.git.rahul.singh@arm.com>
In-Reply-To:
 <0c53abc972264b0ea13864b7056fa2149cd78f9f.1663928523.git.rahul.singh@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM9PR08MB6273:EE_|AM7EUR03FT004:EE_|DU0PR08MB9417:EE_
X-MS-Office365-Filtering-Correlation-Id: fa06611d-1203-4cb1-486d-08daa2cfbc96
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fjhEZlKEcLWnvMyOmAU/KV4YDwqqmSJHo1/PsTNxpEnwh4gLugZEkSKl4ExFFe9uY81nxnT5gXClVubfOCyNJKRNxHG2YK81VNzL6vDUXtj5AqNpfEJQd9+UKnkhEe2HYFwPmlRnWEGYo+10liJubMEjGrx/OfuySeVskYH9DFHg8XCtTF2OatsjyJ6CM24oIoKtfv4mmekwePIo1R7V2TR+WpVi1i0huqlh8HpjHgZqAXepbJ2gb/TMwAitoy/w7aqYeQx+afBYzztZo4nvPajoJPSPMpiGYaJ4weR5fkssGStxk/+bnMoK4rYPSU9WjKzvDBxaCWl4r2ud9dsFa4t3vqEskVuD3bIto6Kxtw5NCkHajT2mpOwLzNQZ2jGyTAUP1x6j+utKCD52PGL8zl4dLuvhhozAxhL6xccFE95MkFT+SuHO76bC2l5SRIjXnSIlicoShMwmiBRpXbGISSTJkFPkj/xkQQBOcnpQrNYVx7+w8c6mjQJzIrH1Trp/FehEPjXFY2SlvI1h+xFfzJXhZTHUmuPS1kQZPBVhWzf22rfGN2+W4ZUKqhcWyuJrmdxzhQhE1z/QAS+w3+qA2OmtB7rfbd9DzBSKrg3zCxQiO/fZ6CjuQSKn//DfMFaFT+rA8B1aafz0lAxrq+Rxw5JtNfHPmIAjrytPQ8+7aOC/HajQaWMwuNAT91mQN0tgGfN1e7Rdp5G9qEOC+9w2v1XD8ydDq9gz79rEIL7VY8n+EwaR3yHYqeHGeufL6xv13QrhWIyiXusJe1IoWT2lJ2iLZNiqkvaJ5L7cxulLE/I=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199015)(83380400001)(186003)(2616005)(5660300002)(38070700005)(122000001)(38100700002)(2906002)(41300700001)(6862004)(8936002)(71200400001)(6486002)(478600001)(53546011)(26005)(6512007)(6506007)(91956017)(316002)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(4326008)(54906003)(37006003)(6636002)(33656002)(36756003)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D0B2870E65EF0C44A1A5A89E5DAB8F58@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6273
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8123d22e-7ae0-4772-f7b7-08daa2cfb6f6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zGTTEKq6ZoAwms2CIjpnLLP5q5CxqmaY8GdwN/tYd9PmS9RALV3tKDNDv7Z1c/L79MFEaeDEs5QcCgySfiU4L0rgMgKpOmy9ScRHsP19x2QFd26dPRgmMVFXsv1oX2Th7xkIP1THtzmMVLw6vpXlIQ0KwbZAtwMYJcedrKw1bt6XV9dYu2spn2Rv5AxVBriUYKfgi5NHTga0ruVZ1IlIw93GpqEV9ITr7VGW8vp2b5uGRWaDqadF0vRjtF4+qoNvuJ8nSiZwSPIY6l/Brpy9H0bO0zlnEGuJGuzhanOj8+930vqKRyCzeFwmP4x4kZWEWxGW3rvCGsdYdgk8IN3n5vA96w4D2Dcw2p9cu9grLVkZfRVUOezEWYllK3moBuXcOHNl5lH7uPRtab5B31oPNDyyY/2X7HT4wUCtiMI9vEA8v+aabhCt4SxI7CpYIDWlEbxErb0Ww8KhNHO+KXO4nf8rN0SELXnpmYp6fSu2yojGpry2vqRm9eBu0wCTArgASBrFTquSEjNPFafdqfgqDFPvH7pnM6kHOT93ZA01FA5TgpvVQPlbl7jc1QyxhvVtdlbquwg0hiJzkSBM3IyIT1mzD2PleTgVeprsOnXt/Hvwoax6HF5/504WSguxQX8fvDrutBzEr5t1jWypkuJ91Hw5OFLQN338IaTUoyvWUIfRyTDotLcoqciXyV7YjcZ4ticjbh1TsHjDwyJVEI40f28mDuaQbVky/8JSyn4L+JBXQIRQ4UxMLK2tECq9avQtB6ltTcxahylYaanzvGdWsQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199015)(46966006)(40470700004)(36840700001)(107886003)(36756003)(37006003)(6636002)(33656002)(54906003)(316002)(86362001)(336012)(356005)(36860700001)(82740400003)(186003)(81166007)(83380400001)(47076005)(2616005)(26005)(2906002)(6486002)(6512007)(70206006)(8676002)(40460700003)(4326008)(6506007)(53546011)(70586007)(478600001)(6862004)(5660300002)(8936002)(41300700001)(40480700001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:37:13.1617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa06611d-1203-4cb1-486d-08daa2cfbc96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9417

Hi,

> On 23 Sep 2022, at 13:02, Rahul Singh <Rahul.Singh@arm.com> wrote:
>=20
> When ACPI is enabled and the system booted with ACPI, BUG() is observed
> after merging the static event channel series. As there is not DT when
> booted with ACPI there will be no chosen node because of that
> "BUG_ON(chosen =3D=3D NULL)" will be hit.
>=20
> (XEN) Xen BUG at arch/arm/domain_build.c:3578
>=20
> Move call to alloc_static_evtchn() under acpi_disabled check to fix the
> issue.
>=20
> Fixes: 1fe16b3ed78a (xen/arm: introduce xen-evtchn dom0less property)
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

This is needed to fix ACPI build issues and was release-acked already.

Cheers
Bertrand

> ---
> xen/arch/arm/setup.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 61b4f258a0..4395640019 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1166,9 +1166,10 @@ void __init start_xen(unsigned long boot_phys_offs=
et,
>         printk(XENLOG_INFO "Xen dom0less mode detected\n");
>=20
>     if ( acpi_disabled )
> +    {
>         create_domUs();
> -
> -    alloc_static_evtchn();
> +        alloc_static_evtchn();
> +    }
>=20
>     /*
>      * This needs to be called **before** heap_init_late() so modules
> --=20
> 2.25.1
>=20


