Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1E0606084
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 14:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426717.675345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUvn-0002jX-Bh; Thu, 20 Oct 2022 12:45:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426717.675345; Thu, 20 Oct 2022 12:45:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olUvn-0002gs-8z; Thu, 20 Oct 2022 12:45:51 +0000
Received: by outflank-mailman (input) for mailman id 426717;
 Thu, 20 Oct 2022 12:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZuZ=2V=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1olUvm-0002gl-By
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 12:45:50 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00078.outbound.protection.outlook.com [40.107.0.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e9741f6-5075-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 14:45:48 +0200 (CEST)
Received: from FR0P281CA0053.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::17)
 by DU0PR08MB8731.eurprd08.prod.outlook.com (2603:10a6:10:401::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 12:45:43 +0000
Received: from VI1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:48:cafe::db) by FR0P281CA0053.outlook.office365.com
 (2603:10a6:d10:48::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.15 via Frontend
 Transport; Thu, 20 Oct 2022 12:45:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT010.mail.protection.outlook.com (100.127.144.228) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 20 Oct 2022 12:45:42 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Thu, 20 Oct 2022 12:45:41 +0000
Received: from c55d6201c179.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8ACFCC80-9DAD-4C22-9E71-CFFC4DB1CDF6.1; 
 Thu, 20 Oct 2022 12:45:35 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c55d6201c179.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 12:45:35 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB10274.eurprd08.prod.outlook.com (2603:10a6:800:1be::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Thu, 20 Oct
 2022 12:45:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 12:45:28 +0000
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
X-Inumbo-ID: 1e9741f6-5075-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RpKTVGyyWt3Umr7DeAHm0y8oIUrzFuv+zPFLHpKthDZOLoTJx4IyO98zqSoIKfVF181s4EaK8N02OYmpZxZ28TK4GyqUqie7elzY132Qsga1IZnSrYLZgpEVA466z7aXgu14qlFEU7Em0T5AFjs8R4sVFBkLkp2+9YRlCMUIz7tEspK6Lxx4re+aIp9VOaYfDVxGcN19isl/bKg8AvLL4NO/rTTzU0RivGLRX30gO0/78iMmldjMKioBjbMEooZch++6hnh9Mz+YH6zhYY587wHmZr7/jJx++K+168GLVpAnoOpqCVDJ08lK81qWJPXJVxazHkpXgmEm/ClCw4St5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VG8yU+u748vLik9EGxDwwv7tyZtNd19IyC3/160ygFw=;
 b=aAA5hc7/Tl/1GtZjNo0IKwzw1/e9vGJ5mf+vJOCh2GqNbeiEumataKLnbwawjA+XJpM32/gIVLkv12NBNbD76s/kKUBJN/uVu25tczZBMViCAvS6lnUZiL5cCCUUCSRdCGO55tPvjsH4++PtDgksaQslGorkbouVNjxNhh52oAbM/AqDGm2dPu2xRPAAnFUvh8HKDiogY/+fshlV/VeSqNEIgzO9laDyuXkQcDpIEcACOAcjlA+fkOGsbQBjWvbIVh+zOBCoIOIIUW2fZTpj0IXjKsTCa3rcZv9dKtV8wKJs+FUL7vZZ1peALyWyK8dtv5zfxOXCDtoqCLt+jWEybQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VG8yU+u748vLik9EGxDwwv7tyZtNd19IyC3/160ygFw=;
 b=xClaMemPw6dKvlOtXhexjo2NvtTppi0lvjJVgZNBzoOAJIOT24+H2oVQDvLhsEh41wVnFc31Tz0l4qgsHIEeGM+ELoXsa8oL8rBqSfYbGnb7DWo9kr2rSGUd3Pho1Xk4vbfB3PDFsRNft+qXbey4p6ntTZyebsK/lrfOKpbaSRM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsqqcgfFBZ1x7VuUG/0TcQxQtDYh8ld9fGLZP2aOWmGhQQmALKyhA+nW9wyNm+jqh9r2O/HGHlvC3nPtMxfY1sBqN/QbDyMNSKmxN8nzIWy+El7VSSde8p4oVu0QiDT+URUeAQBp4S0MUQdVDbs8MyijOGl6NDM2pVflC/P0sM5aB3E931GK5CsB7GNiyWA6iQ25oBpSPXuNiRYm8e5pTAtjv8lIjeRTrH2LRkRlE5V5HTZiwSzWq1554fnzsxG6w9yR9XblOApOMmBK/zcnypwHBWj3iFPOQjxCQgzjTCNjgTDtTRygfQ4aiRSzvi7nIUYazPp7SHvaTjWgqUCB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VG8yU+u748vLik9EGxDwwv7tyZtNd19IyC3/160ygFw=;
 b=MhWtGWTfVRCcFuGJxG6/7HXZTq1XJYmgmrroCWYAXpdLxaA1r8fELRAPG7ew+P5Lr0e3eaCzCzT4eBhMf/jtj5M69z9YynA3OnRLmbvrGIG63u6HKd8MQrqj9h6zpqTY2FEUaE5EE9c4CDwUKH/Yfo1b1McY1DXQvU+uto17iPUBpuDkWaiu8mRzwWH941i3Nxsc8UYknrcDBmVNdblaAKJu9EaZrb2xQX/2hLOtcKd2ZgcrH5ieeCOB+IEU/viChWuA86UrdGzUwGFFPcmRjQ+NVr5+7walGohqGxhAR8Dy7lQiUSrqoQkGLuiP7153kZaQgNVDWd0uI1DcvsH1iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VG8yU+u748vLik9EGxDwwv7tyZtNd19IyC3/160ygFw=;
 b=xClaMemPw6dKvlOtXhexjo2NvtTppi0lvjJVgZNBzoOAJIOT24+H2oVQDvLhsEh41wVnFc31Tz0l4qgsHIEeGM+ELoXsa8oL8rBqSfYbGnb7DWo9kr2rSGUd3Pho1Xk4vbfB3PDFsRNft+qXbey4p6ntTZyebsK/lrfOKpbaSRM=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: RE: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
Thread-Topic: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
Thread-Index: AQHY5HiMx9pkqyzOUUCkjGjpajJVHK4XOlXg
Date: Thu, 20 Oct 2022 12:45:28 +0000
Message-ID:
 <AS8PR08MB79914FC06AE997ABF32780E4922A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221020113810.20844-1-andrew.cooper3@citrix.com>
In-Reply-To: <20221020113810.20844-1-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B9EC29A6B6854E4CBB8A528FF127A10B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB10274:EE_|VI1EUR03FT010:EE_|DU0PR08MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 686b274f-2790-48c4-a431-08dab298ffe5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rTkZy1ZUMqJ5ZWZn3W47XMzMUusrgOFXJaRF8qYszliwCY0JzFjA2iPXQcMqm0ZQm2u8gFLrOWm0n4LCr0MZ69of9cEUEL7uUTIPy//nL03HwwXrNumbRMj50xxmXL1xHxSzZTqJDk9GZ4S3JFYrU1gzsvrXv66TUuuJVHv51nA7t4rRuKv+jMeGThY9w0Y7FDqWMFOfRWkdE0g7PCBIK8wazkGamqCgywekawYWi0G0YE+51flzU7orPb4UKpdfYdWgjwEDD75D+/DRtL82g5XOIEmIlHcWrD/xfi8sadE9krXAm8SnpIR3f9dQYey/jNV0guDd78eJ3z0SekQcx1t0yzs5Yz/GwRnRUvnfg2Zv4fAGXoRHkBicVtiInKcBEg2HQH9Cv8nAnlJ1/UzfrVHOB/i0l7pO26uHdsUyPGkWKHuW11bvr3R9zwvbZNzpVhbeDiVtgcI9ZX7Op4o4zYq0CmQgIuOUeJ24E7DOmoZeKO8srWfyWGZp9TNSahYKMBLO2hEM5+0+H9JzzkLmodGJwIrrNNVKafgditx2Wq3CbwYABMZXBX8OgaIxAs0ua3GqVylThOZ0JLn7qd5zvexrz60O9s+JFDBc/RRzOGogagxOzRrz7YUDljNKZvzh9yvURL91eLnAYLA7n83XqDW6E5V2Urr9Lr7bznFv+BO14Tc5nF9u2qMh1ANKP8QXPpEZfizm2cDsMzupL2pOWM9sEBhUdtwVHEkaikCOr5WCU5L3/33AUO39NdL65Qjl4ys/pqdFsJH1g9pZ7YbOPOTz+qeeuuS4BsL2LQB0M8g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(451199015)(33656002)(122000001)(15650500001)(86362001)(2906002)(5660300002)(54906003)(186003)(83380400001)(38070700005)(4326008)(966005)(7696005)(316002)(66446008)(76116006)(9686003)(71200400001)(66946007)(110136005)(66476007)(478600001)(52536014)(55016003)(6506007)(41300700001)(38100700002)(26005)(64756008)(8676002)(8936002)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10274
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	083d2e24-9c2a-4594-8a6c-08dab298f7e0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fraMnMSVfSnOIRRRemHOrdwkVNteXJdl6kpwFnEM3z9qudUgQb4ce7Tlk/D0Xp2dz8VY3M/mS4ETw/ENQMZkIuB8NxVNgYy5I1GbaSzg8zw6DobztFgv1C9SdfuOPLykqByX3/QZdBsHJsIwU77sUfJ99/vh/gNqqGQSD6x4F+VQltcypNuOSzxvwmz/ysUDWMXX3jhifG0BVk2dB0dka+7ANd27HIg6BUIlO/4sUECCk+hHdLuP93auOa7kwELCzzMGLU7jstx19qjO15dDfFnereYXuyUmWQzR85zrEk2adJaooit2CtZTn4ricISHrXI+xN7ScgEpNqV52r+0VvKzYFovGOtwb2aU+Dj6wwjh4915uyLB+RtfGCEpifHO9fm2b4qrhy3aknQS65ofOsVi8/eSiGoIqqJ76mkt1MIIiGP8RR6yA/iPSOE6z7W2+ErQ1MjeuO7yW7ku6eOXHTpsOouXTouqphYC9N3sSDD3UHJzBl3DiSxQ/O23ZIN3K3SlJZGVi4w+uVMo8GXZY++7xPQWMB/tb69S8+x46bHDOH8IRx0+sA61S7G5IcoONP9iZmjrkFPtfgtZ3rLYFr0jakR45szAjdmt+tFBp9YCky/TOm8ZxnlZjpCv4wyHdTZqP/03ylfV9/zUMwNdLQuY2jEYeiheziSxzjg2bll2aDxhiL2sUxDq590EytvSmhJGlXZky/Tbj6wdNmtjm4koMBg98wDu/OnZ9Skdb/AXCu8W4DoDq0cG3rn1sFvBKC59w1r902D+hAhplX1omDnG87JPAMHprjVf5lTpklg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(478600001)(110136005)(54906003)(966005)(107886003)(70586007)(26005)(4326008)(9686003)(70206006)(8676002)(52536014)(6506007)(41300700001)(15650500001)(5660300002)(8936002)(7696005)(83380400001)(82740400003)(82310400005)(316002)(47076005)(186003)(2906002)(336012)(81166007)(86362001)(40480700001)(356005)(33656002)(40460700003)(55016003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 12:45:42.3109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 686b274f-2790-48c4-a431-08dab298ffe5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8731

Hi Andrew,

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Subject: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
>=20
> tl;dr This hunk was part of the patch emailed to xen-devel, but was missi=
ng
> from what ultimately got committed.
>=20
> https://lore.kernel.org/xen-
> devel/4164cb728313c3b9fc38cf5e9ecb790ac93a9600.1610748224.git.edvin.t
> orok@citrix.com/
> is the patch in question, but was part of a series that had threading iss=
ues.
> I have a vague recollection that I sourced the commits from a local branc=
h,
> which clearly wasn't as up-to-date as I had thought.
>=20
> Either way, it's my fault/mistake, and this hunk should have been part of
> what
> got comitted.
>=20
> Fixes: 00c48f57ab36 ("tools/oxenstored: Start live update process")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin Torok <edvin.torok@citrix.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
> CC: Henry Wang <Henry.Wang@arm.com>
>=20
> Found while reviewing the XenServer patchqueue.  This is low risk for 4.1=
7
> and
> fixes a feature which we thought had been working since 4.15.

The commit message and above scissors line have described the situation
quite clear, so I don't think there is any reason to ignore this patch.

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


> ---
>  tools/ocaml/xenstored/xenstored.ml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/tools/ocaml/xenstored/xenstored.ml
> b/tools/ocaml/xenstored/xenstored.ml
> index d44ae673c42a..fc90fcdeb5d6 100644
> --- a/tools/ocaml/xenstored/xenstored.ml
> +++ b/tools/ocaml/xenstored/xenstored.ml
> @@ -352,6 +352,11 @@ let _ =3D
>  		rw_sock
>  	) in
>=20
> +	(* required for xenstore-control to detect availability of live-update =
*)
> +	Store.mkdir store Perms.Connection.full_rights (Store.Path.of_string
> "/tool");
> +	Store.write store Perms.Connection.full_rights
> +		(Store.Path.of_string "/tool/xenstored")
> Sys.executable_name;
> +
>  	Sys.set_signal Sys.sighup (Sys.Signal_handle sighup_handler);
>  	Sys.set_signal Sys.sigterm (Sys.Signal_handle (fun _ ->
>  		info "Received SIGTERM";
> --
> 2.11.0


