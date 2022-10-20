Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDDB60665F
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 18:57:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426985.675778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olYrF-0005IW-1Y; Thu, 20 Oct 2022 16:57:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426985.675778; Thu, 20 Oct 2022 16:57:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olYrE-0005F8-Uo; Thu, 20 Oct 2022 16:57:24 +0000
Received: by outflank-mailman (input) for mailman id 426985;
 Thu, 20 Oct 2022 16:57:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LaG4=2V=citrix.com=prvs=285635b8e=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1olYrD-0005F0-M1
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 16:57:23 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4291da93-5098-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 18:57:22 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 12:56:59 -0400
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com (2603:10b6:a03:2d6::7)
 by CH0PR03MB6035.namprd03.prod.outlook.com (2603:10b6:610:be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 16:56:56 +0000
Received: from SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::a093:1d6d:9e9:cbfa]) by SJ0PR03MB5888.namprd03.prod.outlook.com
 ([fe80::a093:1d6d:9e9:cbfa%6]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 16:56:56 +0000
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
X-Inumbo-ID: 4291da93-5098-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666285042;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cZWiROM90RIokUEreenDFtAZPE2RBHOtcPzGlVzg2DU=;
  b=WOG7KytBJM9mAZLaAiZ8fcVADtG6IauqT+zWkDUAZG0X85YkeOP/+4gJ
   0MFnb/F+wdbExjL3Z2t6oGhatu2qi9Lb4S+J097aj7VJDnH2yNrZxmQr3
   RxWSu0MWIggsgjlJAAG8QvQHG/F0b2DvjH9+8ITEslmeIWSLMAqxXikwX
   I=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 82806898
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lzwjVq/MUbu5BOztM1EVDrUDo3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2IbD2uGbKqJZDH3fohwYN/jp08F756BndYyHAA4pCk8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5ARmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0r4pAG5e8
 94DEh4IPgmppNjr2rPqR8A506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/RxvzK7IA9ZidABNPLYdsKLQ4NJmVyfp
 UrN/njjAwFcP9uaodaA2iL21reRzXKrMG4UPJSj6ttnoGOr/W0OIRYPdlqcn8afj0HrDrqzL
 GRRoELCt5Ma1EGtVMi7YBS+r1aNpBtaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLTBmrrC9U3+W8baQ6zSoNkAowXQqYCYFSU4A/IPlqYRq1BbXFI4/Suiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsAGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:j4WDIasb0Bi8BOB9Kyg9e9U87skC1YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPqftXrdyRGVxeZZnMffKlzbamfDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjJzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIP/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfpWG0hYczAgNkGmpDr1L8Yqq
 iJn/7mBbU115rlRBD2nfIq4Xin7N9h0Q669bbSuwqfnSWwfkNHNyMGv/MWTvKR0TtfgPhslK
 1MxG6XrJxREFfJmzn8/cHBU1VwmlOzumdKq59bs5TOObFuF4O5gLZvi3+9Kq1wah7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm10xR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XXJ0vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLmzNV1wg2XwqUmGLEfQI5tllulEU5XHNcrWGDzGTkwymM29pPhaCtHHWp
 +ISeBrP8M=
X-IronPort-AV: E=Sophos;i="5.95,199,1661832000"; 
   d="scan'208";a="82806898"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSl/dYKBc09/KV/nSH0dlEVIGty5MteY+86NC10Z936UopbYOzFB/P1UmqHhpWJpY419yVhh1QZ4nIeU/AEJD7ijJwXZr5i0Gxk0YDggjIK1FAAjxVCAsUNfybrtWX/a44MXtDmUCzzTKt5kcC3H4KfT+ONSobJWR2KzSPXtl/tU7pC6URvcDiwQ4Dwpl/DpwwvGpDU/Y/AoNFkRnOzzht1UEu7iH0099ZCkO02DbN9cCZJdNj6xq158slW/VmaP4UWI2MhP/E4zeSBGkZY4tu5rAxq/mEMCVxMOzp2nCsrCcxwGuOOyVdc7s6hGmElYHwLhXGkTrQGUebzNaAnNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFK7ujOBaZ8kb7KrzY1TRCkXR6h3FeT3MJVabsJSrAI=;
 b=OxE9o3zzK4cM4aKsv333ryE8QBgVVl+0PLydYkXcQqt20a8B8s1A5Afuap464ftX647E5cllrPlEGU3+MwK/zNJM+QQQi3Ot8S71pYv/OHipYg0ihdVyjw1ACo/+3+kc5aQWcpGL/X/4iYuHQ2Lnu5KeT1XUv5MXdSuJwSgG1OpxiKg5aLTlMAB5vtL6qApDGqpELKN+syCPlX3pTpyIHuZda2YZJ1sbP9ggvyIetK00NClVKW4h2XkYJuLrN9UmtuMLbsPMfoKngqKl9NFvy2JE59XssLtUkcg9CTDzv0lNw0Vy3T4xYGLj2FQrRUpVqwchokrXRetMI/OqcdKzzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFK7ujOBaZ8kb7KrzY1TRCkXR6h3FeT3MJVabsJSrAI=;
 b=nkMUKa8uM2vCSTxlTA5LYjxHlGMdfQZ4AGkYMZX+wT8+DZe8exvf++xMtp/sXYGc7Tq6R91R2OUmCm2ZgQZL1QzC+d9CMt7wCyVr+vayJ820uyPPoAPGFpjq4/DdBBqd5FyAovbQiWPk4IWVtrH8ZGNSW+qg+wnVaWbQvaWymoQ=
From: Edwin Torok <edvin.torok@citrix.com>
To: Henry Wang <Henry.Wang@arm.com>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: Re: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
Thread-Topic: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
Thread-Index: AQHY5HiAz+6eZQJ7aky5mf6JNm1Bia4XOrgAgABGQAA=
Date: Thu, 20 Oct 2022 16:56:55 +0000
Message-ID: <F65C8E58-EF3D-47D9-A94E-7B70EB93E068@citrix.com>
References: <20221020113810.20844-1-andrew.cooper3@citrix.com>
 <AS8PR08MB79914FC06AE997ABF32780E4922A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
In-Reply-To:
 <AS8PR08MB79914FC06AE997ABF32780E4922A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB5888:EE_|CH0PR03MB6035:EE_
x-ms-office365-filtering-correlation-id: 5241637e-a58c-4e66-1381-08dab2bc1869
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uthxvL50ElVbY5p26ztfhp9hVoeNs3dPWJFTzqUviHYxeVowApsjGDoQnpiGXYI+uhukMJ5Pi7ZeAZmqDZpPsdaJtFCMyWEe6698toAdGfVSdd/e++A/bDwx7sq/z8ce2osxzS/FsuQfaYv7lwrK5ST4GqhuBJqrCinzIYnjpx6TUdZLulPCezCXpZIh74m9Lf7IG8CYhAo93hnJUaUTkLbhImoqb3v911VCgOtb4MCUbyuhYOMWr6drChfglE497gfjdp0/blgZGHTa/S4ffcgekZOp+5iUypU9iWSrZI/NwTI5Re2KsR9B1qaV7NKa23R/xutinE0lhvHoV9fgPYykDyHnpz/8SX9+vrbBXaEkztsKsYhbZ7adMauFik7Q+H+B49iU3dkB4fMb8KeDSTy48jbJO1xN14se4KrWo68hlrWgjx1kISJkkI+I9LZVH+jiKj1v+JD2NbE7AeP3WOlDUlQEl7A5pCH8lfL4uV/mCMe9GYi3r3ouWHE4LNsKyY1p6mnK0B37VK4K7WJGmccVCp8sySNS0wL5SIjhopGFPdxKHfjZyoDvdTL5HVm0WoZqtT3RcrgmdBTzLwFNVzb2pyUh2sCDsOs30WedUgMAKBWKoQK4B6zR8wgbRi9w7BYBlHqR3zOmYkZWk9UhgicJyqPjl5Lb7eTnevmLigjhUVtGptCMnddUID/12xvg5UNsFo6n9WHYfSzkzZBEFeAAgd9H51nm9NBYaazUArvuGBJmoa435guVUDgjASPTW7r6mKPpo3INBjpcHftOjacD4c7+7y9XhEzuFiaRdiCc4QJnlJzrVRCF0hZgiAEdY9zNvBcha5CBEN3R0tdHP/QHOokjRK+UxrTrQQBs7lI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(451199015)(86362001)(83380400001)(2616005)(15650500001)(2906002)(6512007)(53546011)(26005)(107886003)(6506007)(186003)(316002)(33656002)(41300700001)(5660300002)(478600001)(4326008)(6916009)(8936002)(36756003)(45080400002)(76116006)(8676002)(54906003)(82960400001)(66946007)(66446008)(64756008)(66476007)(66556008)(966005)(71200400001)(6486002)(38070700005)(38100700002)(122000001)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?I/HufJ0dPA1s4wJHjPzfsm3CemVbbbhYswS/lY3W7ty7Je9o7oiE462YH4hJ?=
 =?us-ascii?Q?yhTYXox9Ib/woPN5959ofuT30DXG9UK44lfasdqR3OZzXH/ChQy/4g+TkBrN?=
 =?us-ascii?Q?KduTtO/4zcxI5G5LQuWtf/xIJhixpFQ9LpGS0NYfF3Gmtxf9cAO9Va8O6biY?=
 =?us-ascii?Q?3SLhQ3mm6/By3Rh50aKWjjX6RHWstZ3kvRf2MkVtaLUCDve77cgPLVQLtM/5?=
 =?us-ascii?Q?hpHmFGc4SsGE2QAukRFcd1l/cSVn7cTRd17BuCsrMNGUMz8A6CtQndIN2GeG?=
 =?us-ascii?Q?1oe51TI+IvUZt65ZmO3vi4wfe3wQkrl2IL1v0/c7RKB24F9T92/0GBuB3Kck?=
 =?us-ascii?Q?jiFM/nfR3xWCqSmJeqdjkmlnsTvwFFZ1FViXoyi+ZDITgyOUxWOqmOb+MfDr?=
 =?us-ascii?Q?CtYCt6qx4DDZgd0VvDyE7cGttOobKCfWJpm8uasoAHAwt8YSYcGdwvFmAIzb?=
 =?us-ascii?Q?88pRC7dviN5SPZJyfdeO5ya4MaRGR3e9x6iOS4TViJovyuzkXjN5Z4dX433v?=
 =?us-ascii?Q?W9V0eUOhC0kJ6yFe+4h1+qLU8mRWVfocka98GDXCJXyICCW/7lPaeEpy+zdG?=
 =?us-ascii?Q?z5UasT8h6yK6W1Goqtry0VBfKgzb7ulG6N9Sg+PtDCv7a/PG4m7pPYL1zfDn?=
 =?us-ascii?Q?soU+zJQ3N4PGqL5pdn5R+XNSOLQRyTgKcRWX4KjujteQc2HSdw9ymBz1lKaX?=
 =?us-ascii?Q?lxtk56nwl+17Av9RJDfMMzfiwrF2Nb6rkjXa7hOuj+CQuv2NkY2USK1w/5Uq?=
 =?us-ascii?Q?jVH40kAAsyaLkck1R6z/I8LJ1jrAE+wvUKNuI8AFK/3qoTcLNmlARzT9hq7O?=
 =?us-ascii?Q?svrHiDb8C0wOMnPZ9dOmQ+hp/fAm2BUbvEsT0q/h88b5B/vPp2BSoIq1Vc29?=
 =?us-ascii?Q?oFYdAJfqrqkxYuKZruT/4otx4MV2aFXkSQWJFHGBmSiVi1ZzS23D/DUkibYW?=
 =?us-ascii?Q?Q0e8CIWEC8vkprILLb09Tax+STknzEYjfZf195YTf04WkLQ4BSSiAEr8DGlQ?=
 =?us-ascii?Q?SnmtDxcRVhePpgZqGxXJ8zlF2VGSLjSmi56qD347Vwr3c83yxPK4Kp5OgBSh?=
 =?us-ascii?Q?gpw8b2xOiS+TN/MtWovN7WV8TtUp2fVcPO1ih0JssrxMbxIMff/V1j0FsmCu?=
 =?us-ascii?Q?7nrTDMFsYcl8Rn9L+/TV0QFKEGIrHAB1MUUhEjOv9cQ2gdt5Ojq/x2U1//uI?=
 =?us-ascii?Q?QvHBMvnpk7MuMtaZZ9ut1xzMbcCTAxJXrEp78X7fVjr7kz2YN++lcai0JjJb?=
 =?us-ascii?Q?2yPwuf5v+fU0p3PeTLrsA8FENS0FlxQCUP1N3qiARv8ZVd0QNkXpOI8/0c8P?=
 =?us-ascii?Q?MvpvYgEaUE18nUTm2dGJyjLDt9j+vGBgP+T1lyX2jGVUIOKXIdkNEC/gqQki?=
 =?us-ascii?Q?lTE2nKk21suFFFKRuXqnmjLPPTVvP7hKaGtAdr5XQJyAWg2a2TPy5gaImyWK?=
 =?us-ascii?Q?XGNSvFDMkUirIogCZ48n5XDeclf5saP+0snElplT+YcndYrENqeYnOhZxDqr?=
 =?us-ascii?Q?/9GTwqPRuce6HFQpSbjX83T3NHLDjbjplPohqCvVCHkK/6Tn5roUghEW0cHv?=
 =?us-ascii?Q?D5N+x9BgzYfTVtI97drXgJmzylA0DXlgjhouZII16p0Xtuc7QjVOo0oC+haA?=
 =?us-ascii?Q?4w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <07EFAB1E0470094199C9659CA0266E62@namprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5241637e-a58c-4e66-1381-08dab2bc1869
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 16:56:55.9013
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fhj7KILHLUmR3zzlrAVJhmbmzCChbw5HURIPjdWAsIEx8tUqEOITlLIc28XyxivnyklNFNmoHQrSPwXUWvspTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6035



> On 20 Oct 2022, at 13:45, Henry Wang <Henry.Wang@arm.com> wrote:
>=20
> Hi Andrew,
>=20
>> -----Original Message-----
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Subject: [PATCH for-4.17] tools/oxenstored: Fix Oxenstored Live Update
>>=20
>> tl;dr This hunk was part of the patch emailed to xen-devel, but was miss=
ing
>> from what ultimately got committed.
>>=20
>> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore=
.kernel.org%2Fxen-&amp;data=3D05%7C01%7Cedvin.torok%40citrix.com%7Cfd3a03c9=
87ce448875f808dab29903ee%7C335836de42ef43a2b145348c2ee9ca5b%7C0%7C0%7C63801=
8667544851864%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D8AnK0Bhh9D%2B0KR7=
5I0zeqwB8GB10JLjUtqkwTtprans%3D&amp;reserved=3D0
>> devel/4164cb728313c3b9fc38cf5e9ecb790ac93a9600.1610748224.git.edvin.t
>> orok@citrix.com/
>> is the patch in question, but was part of a series that had threading is=
sues.
>> I have a vague recollection that I sourced the commits from a local bran=
ch,
>> which clearly wasn't as up-to-date as I had thought.
>>=20
>> Either way, it's my fault/mistake, and this hunk should have been part o=
f
>> what
>> got comitted.
>>=20
>> Fixes: 00c48f57ab36 ("tools/oxenstored: Start live update process")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Christian Lindig <christian.lindig@citrix.com>
>> CC: David Scott <dave@recoil.org>
>> CC: Edwin Torok <edvin.torok@citrix.com>
>> CC: Rob Hoes <Rob.Hoes@citrix.com>
>> CC: Henry Wang <Henry.Wang@arm.com>
>>=20
>> Found while reviewing the XenServer patchqueue.  This is low risk for 4.=
17
>> and
>> fixes a feature which we thought had been working since 4.15.
>=20
> The commit message and above scissors line have described the situation
> quite clear, so I don't think there is any reason to ignore this patch.
>=20
> Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Thanks.
Further testing has revealed another bug, patch here:
 https://lore.kernel.org/xen-devel/12d90632bf881e96e0b6c256df193f00df187dc1=
.1666284745.git.edvin.torok@citrix.com/T/#u

For convenience the commit is also available from git:
 https://github.com/edwintorok/xen/commit/12d90632bf881e96e0b6c256df193f00d=
f187dc1

With both of these patches a smoketest 'xenstore-control live-update' with =
a stopped toolstack works now.

Best regards,
--Edwin

>=20
> Kind regards,
> Henry
>=20
>=20
>> ---
>> tools/ocaml/xenstored/xenstored.ml | 5 +++++
>> 1 file changed, 5 insertions(+)
>>=20
>> diff --git a/tools/ocaml/xenstored/xenstored.ml
>> b/tools/ocaml/xenstored/xenstored.ml
>> index d44ae673c42a..fc90fcdeb5d6 100644
>> --- a/tools/ocaml/xenstored/xenstored.ml
>> +++ b/tools/ocaml/xenstored/xenstored.ml
>> @@ -352,6 +352,11 @@ let _ =3D
>> 		rw_sock
>> 	) in
>>=20
>> +	(* required for xenstore-control to detect availability of live-update=
 *)
>> +	Store.mkdir store Perms.Connection.full_rights (Store.Path.of_string
>> "/tool");
>> +	Store.write store Perms.Connection.full_rights
>> +		(Store.Path.of_string "/tool/xenstored")
>> Sys.executable_name;
>> +
>> 	Sys.set_signal Sys.sighup (Sys.Signal_handle sighup_handler);
>> 	Sys.set_signal Sys.sigterm (Sys.Signal_handle (fun _ ->
>> 		info "Received SIGTERM";
>> --
>> 2.11.0
>=20


