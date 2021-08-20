Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31093F30E2
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 18:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169608.309845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH70A-0004WN-Oy; Fri, 20 Aug 2021 16:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169608.309845; Fri, 20 Aug 2021 16:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH70A-0004Tn-L4; Fri, 20 Aug 2021 16:04:14 +0000
Received: by outflank-mailman (input) for mailman id 169608;
 Fri, 20 Aug 2021 16:04:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+ZW=NL=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mH709-0004Th-Qi
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 16:04:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.62]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41d603d4-01d0-11ec-a6dd-12813bfff9fa;
 Fri, 20 Aug 2021 16:04:11 +0000 (UTC)
Received: from DBBPR09CA0025.eurprd09.prod.outlook.com (2603:10a6:10:d4::13)
 by VI1PR08MB4159.eurprd08.prod.outlook.com (2603:10a6:803:e9::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Fri, 20 Aug
 2021 16:04:09 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::5a) by DBBPR09CA0025.outlook.office365.com
 (2603:10a6:10:d4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 16:04:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 16:04:09 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Fri, 20 Aug 2021 16:04:09 +0000
Received: from 3adb8d4953e6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B294F569-C070-400B-8E10-53348CDDE024.1; 
 Fri, 20 Aug 2021 16:03:59 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3adb8d4953e6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 16:03:59 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6342.eurprd08.prod.outlook.com (2603:10a6:20b:31a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 16:03:55 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 16:03:55 +0000
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
X-Inumbo-ID: 41d603d4-01d0-11ec-a6dd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS6s5NrIQBEKJ3V4Pkoss0WWWWyelHtOR4PTvyH5XW8=;
 b=FcFnpNgWJV/TN8FizKlVy9ma7E2/4u//AIzMCpZwmwqFgUhoh2MCzeVyG8l8Zs63UkwRNFbvJxEL8W89+F5X1rCg5Ty8N0E6D6GuDMKpWarLQs/qaq8vv1KVs/6PuznShaL2kJig6rzbs/XEiXf7OLH+xbmBaXkufKZPM6eh034=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60003dadc4a77003
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxGouiqGbQFLYUt9bmYlYjKldjOVFxJLmS0z3hm5Pk+lwaM6pbvQyWwAycv5zHQqSqFkHXWL8EudJJZP657g28sk8X8RF0aDgvkheWLFVeB7fIyuNYQvdY91lbLNujonuArF0P2QX/bzrxl32fH1Ghqv66SPRoEv1UkSm5QZlkxVxE8by0yriZaOBMiSXyNa27ZaTKtR4yghCtTm8SD242hdjAt9pdjnvdtTSkPMrLKQZZyvRl2e2WGbO+88N1ZOD2aAHKMCHvEaeCR0NnKFhrTftoS3jE7vF5sSO0tXW2VDjCFpqHoAExvi2j4jW1EAkhVqGXADidG8lkWZx49bQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS6s5NrIQBEKJ3V4Pkoss0WWWWyelHtOR4PTvyH5XW8=;
 b=WnK6oqF6D69uExfOSFUsp0QxtC+f67OesgDQd3SGy6GBaHhNdNv5+VabMEj916uQtTC1PRV3olCXXbEs8Ic00O4VFD9UncSl703kb9cQpGDy9B8/fqJ8azXFpyoTY9KWO+f6bH9004sGZdh+s8mW4eBiE0xAr3TeqouiTg++6lnWo0Ub9D9W9cfzsxFvSuxVgPCNz6AI/KvvO3B82/rsGr4qsPwnyy45sREF0Vzb+phxJJeQnhXQNAGFEFlv7ZcnBxKVL6v9I67LmENcy7zmi0cdMyFNDj+U0gbdGgklFhMpZ8iIB/PhMW/OnYYXn7MOqLrDrVbrgrr5x0uP4R1o6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS6s5NrIQBEKJ3V4Pkoss0WWWWyelHtOR4PTvyH5XW8=;
 b=FcFnpNgWJV/TN8FizKlVy9ma7E2/4u//AIzMCpZwmwqFgUhoh2MCzeVyG8l8Zs63UkwRNFbvJxEL8W89+F5X1rCg5Ty8N0E6D6GuDMKpWarLQs/qaq8vv1KVs/6PuznShaL2kJig6rzbs/XEiXf7OLH+xbmBaXkufKZPM6eh034=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 12/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v1 12/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index: AQHXlPL+C+mRsI0CR06NagiBtFP5pat6ypyAgAHFXIA=
Date: Fri, 20 Aug 2021 16:03:39 +0000
Message-ID: <664B0578-B440-4229-8D6B-7B98857E75BF@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <31e48fe4b219ebaf5f1d9f3f7ca9b433caadc5b2.1629366665.git.rahul.singh@arm.com>
 <c0ea2f05-bf0a-a8b0-a811-d899516c26ba@xen.org>
In-Reply-To: <c0ea2f05-bf0a-a8b0-a811-d899516c26ba@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c717df3f-1254-4623-a638-08d963f4251b
x-ms-traffictypediagnostic: AS8PR08MB6342:|VI1PR08MB4159:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB41592658EB317A84AA3A185AFCC19@VI1PR08MB4159.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a51SVpnYMglSj9NFkwQ8nNrNIaMOU0qUHHO29lgrfFGiESK76j0OsZeYV7YmhXhXbAQmcM7OPr02Ow3GQWJ8qZRc2v2dlIFrhAiE2yXhsYzh5RNXbEcMJasH77RI3Zy9PI6a/g5B70AnuYyu07Em+BH/vozUs7QUa7Vydhm7kIFv4QDBkAjQI4GLJT8zoCtOspwBVVcYeiiLbGv+Q7prhaMpApzHP75VGy/INtZmo4GlJIbOdzkomtSLdat105Vk7qzF2l6gtChCefY88RRG1zj3rD7ob8lAG1EDHkj2u3xRtszxIlKMOmO3ZwCKT2j495pS//exeD+aV0lCuNIdPtXsY4UzoAEyX4Jlfr6rTVDW90P4F3dGLahFDNWxSTFNU1pZx1zfa6cChPClFN31zJUz3zPLzSsIigaMk/f7LA+VZWAyTrAABEeglqDpp5q/5UAZ+2oNhi/zHWbxQK/rSTfd3KUbwt2NR91LElCyRJJd1B9Vl41YUwPFkq2Hk+6ccbpAY6qU8NQmm1sPeHkLMFAgVg4vDHuWFCVfMX2adgr2QlkSeC+R0d43/C7kUREdYb3rf1I6EvR59ONsoAIXznYjf5V4GkG/6zUXIOltf/j9QfKO6vTxvSNj44znU4+5wrhkHku/b4tUX0zc6fmHSQKtu8Yts6wRChogGGYcchmA6r42DjgYzLq7sp5yxoPT2PDDbYT0lVqsDqAEDCFf+0x7N09CCnETHPmxawSjYwRGOU5xGr32kqL8l0gXgKWqe6YT29/onPT+PyKQ/DLFCWUZo8f29/xdWlSeourr0FWJTsIl6g327o7lr7IdoM2Sti7qW4v1bxflL5M/mY7JtA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(346002)(376002)(136003)(6506007)(53546011)(5660300002)(186003)(71200400001)(76116006)(38070700005)(6512007)(8936002)(6666004)(8676002)(26005)(66946007)(66556008)(86362001)(64756008)(66476007)(66446008)(6916009)(6486002)(7416002)(478600001)(2616005)(36756003)(4326008)(316002)(54906003)(83380400001)(38100700002)(122000001)(966005)(2906002)(33656002)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IFnW2+qJLnM995KNMab4fQvW7sUeu7VM5lmJh1hC9Rnj8mUg2ySGDYKDDHe/?=
 =?us-ascii?Q?2xQKS8Fsxh2WtolWkBvNknLDIm53THxqpWmnM3ikYQr1sazgAJL0xgGIljCB?=
 =?us-ascii?Q?91DJFcopSvdINcawtmLzuxbrYmcU2sPxYOoQJXLz1oWYoY/wOV888K4YR7c0?=
 =?us-ascii?Q?g0i2EQ0C8wgGnj/RCGCD5yUP8s9AL0/VHZPfjjtPBjY2GCCn0AxsNDialmSw?=
 =?us-ascii?Q?H9OLIB04L0eeAxfdl1ZvJ+Aufo9Ccf2NnGXfCJRuFxbbr/z4boipHNCJl8Wg?=
 =?us-ascii?Q?L5kUo+f/81fTnzOzD1+p1jb8KjoOq8IwCoasyJc4Pt+NCewnd4wtmBBcWuu2?=
 =?us-ascii?Q?P6LzyrfbE2SkskFJHA8YQlefT7l3zed2P/bHWkOmlZH8sRu3+aFAbgz/Z4zN?=
 =?us-ascii?Q?0cv44igYo/WsVe96RozlfRMh5pgmKc4u7Wle36OXkVEdPJSVO2u5oGjibLc0?=
 =?us-ascii?Q?CBtn5XFcOS+MtcL04Mcri+xz7JTbBbowUv75g2zFx5p4el+koGnMU5q1yu7W?=
 =?us-ascii?Q?o7ycwnFxepOfLwmGBkUnW488QcAMjE90FqBtzwLRbUPfTOgFKrguQ9ZgKkhr?=
 =?us-ascii?Q?2eGPw94ER0DULiP48LDH4vpurBHqJOf55ZmhwB/JXPYlxoKsG6DpUXqObwLT?=
 =?us-ascii?Q?0UC+XLuHpgsM+UaSgAvoBvDmueebUkouOPipTOHGqzXfcihY22H6I4AIMC6e?=
 =?us-ascii?Q?8CPFZkJxNla810pMlLRz4R96MPzzUaRXkF+bCgU8Rf+rcGsk3GE7axAC1bsN?=
 =?us-ascii?Q?fo8CTNDkNmsc1ynrGj9ECDJc86Hb2V86e2zz5mnpXRXyZwRzv48gYDKgM46C?=
 =?us-ascii?Q?17HhXqRhrKP6Oo71AWlAdCAtT9U5y2NC8M8TRvPhz1whfYc8Uu0J9vsOPFuU?=
 =?us-ascii?Q?5BKNgk8TDE4KP2SusfQX/tHfgglA/ETiMB2slqIcN3Az5z1iigdLPPN7wDtU?=
 =?us-ascii?Q?vZn1XYL33Y9TOYc0tWfz46U0r2VqQ6hbefXKOOg7YqqXs/shWRXpulrjG9AC?=
 =?us-ascii?Q?VQEm3jInGKx2fjL/m7NE0Qurw+siiR3BGm+rKUVcYXg1t0k4GGxxoE5w7Owv?=
 =?us-ascii?Q?eAeiQxC3Q1jvdKnXJOzaQ/628As3Z2spopu0cSKv0pFmoBQdKyc1038X40S8?=
 =?us-ascii?Q?Hf6W3cRxhFL17FmCfYFI40EKKz/KeZSObUPM5PWGQ99ffZe8/BttgBy3oxOU?=
 =?us-ascii?Q?J3Nr07xBP4OEaVQOk41h767UaVxhrrCB9sQvrNw9HOw92mkx1ZBQRHZGeHJe?=
 =?us-ascii?Q?wotwUqYCLOm1z2C/Ek3yeTcCUZxS0s26dczizwhsfaeLuHr/c7HedxoiMqPQ?=
 =?us-ascii?Q?oNUQGP1sVZWstKeDnRPOBi0y?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8B1FE54F8BA4974781DCA21D80649BC5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6342
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	65828909-4f4a-48d7-6e5e-08d963f41cdb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JePTvFwJL0intmVsxeS9/fCWqLIE1jTN7CvGOUr2jrO/w5suYdZLlDsKqh64jovG3vOf+QCJxwdthlKl/FjUDPzMcgxqVS2IctLhBYZ5x9GITqwDixUyYHytJ8D2WQTacu/GHoY6zwa42PRWRsmy1h/iAzjqW/upN0P4O6g4WJwn/Ac9EYoxFoOgac4jQAjSPHxx3g1Eth1jhXOj++MgR/pleTE3MBF6q3mxTDnGoNFsKGwsVprQ9Y+5GrwnbYGt6avmpFtck9WU0GqmfM3ynuUKP2RreZMtJz8WN/1rN3YjCLD5eBcF2RNev76rsxetx+TxVvVB4HD2a94+6VDUU+aPnGLWYnBF58xAwJmoo2pTLNPyNKGH+hLLW0TKynsJMS2m6VTy40dhonKxruhafcFIVnw8PUEDcrHOPOYxXrSpKIKiF27OxDIhBhf2kO+/P9OWxHzgCHo/YN9luWkERluMVAJ03lrGXuQCl8NL0R8fvZ9gX+F90s0Pt9p4tE4/2pqMVI5BwW4OfShAeBtRhHY92y6K2tYIn0Y7UqMipm2e1/7RZhaa4fxfIqhx/CwfjGtPpcUwMcZNcTEeQw8lr0u1EVvXEJGGfYCNWxJ01vO2/hvoLrCxV81jxdejbRhfyxAAb4l/RlFRdgVNypeA2UlHwLBcMpc13ZiN0cclby/B4H17Vl1RhXcz7+rQlHwDSEs+vucHU+ANdKmsrcCWEXVIbYxJaZ11oB5BexFGFvLLAwPRmBpieVTKS2RfszvnCtP6yBoiZL9n3X5J0g0jlDiqFPjDLwDOTYiNjNeRGnk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(36840700001)(46966006)(54906003)(316002)(82310400003)(6512007)(478600001)(4326008)(26005)(6862004)(6486002)(33656002)(336012)(107886003)(86362001)(5660300002)(186003)(53546011)(70206006)(70586007)(6506007)(81166007)(8676002)(36756003)(36860700001)(966005)(2906002)(356005)(6666004)(83380400001)(82740400003)(47076005)(2616005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 16:04:09.5284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c717df3f-1254-4623-a638-08d963f4251b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4159

Hi Julien,

> On 19 Aug 2021, at 2:00 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 19/08/2021 13:02, Rahul Singh wrote:
>> libxl will create an emulated PCI device tree node in the device tree to
>> enable the guest OS to discover the virtual PCI during guest boot.
>> Emulated PCI device tree node will only be created when there is any
>> device assigned to guest.
>> A new area has been reserved in the arm guest physical map at
>> which the VPCI bus is declared in the device tree (reg and ranges
>> parameters of the node).
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>>  tools/libs/light/libxl_arm.c          | 109 ++++++++++++++++++++++++++
>>  tools/libs/light/libxl_types.idl      |   1 +
>>  tools/xl/xl_parse.c                   |   2 +
>>  xen/include/public/arch-arm.h         |  11 +++
>>  xen/include/public/device_tree_defs.h |   1 +
>>  5 files changed, 124 insertions(+)
>> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
>> index e3140a6e00..a091e97e76 100644
>> --- a/tools/libs/light/libxl_arm.c
>> +++ b/tools/libs/light/libxl_arm.c
>> @@ -269,6 +269,58 @@ static int fdt_property_regs(libxl__gc *gc, void *f=
dt,
>>      return fdt_property(fdt, "reg", regs, sizeof(regs));
>>  }
>>  +static int fdt_property_values(libxl__gc *gc, void *fdt,
>> +        const char *name, unsigned num_cells, ...)
>> +{
>> +    uint32_t prop[num_cells];
>> +    be32 *cells =3D &prop[0];
>> +    int i;
>> +    va_list ap;
>> +    uint32_t arg;
>> +
>> +    va_start(ap, num_cells);
>> +    for (i =3D 0 ; i < num_cells; i++) {
>> +        arg =3D va_arg(ap, uint32_t);
>> +        set_cell(&cells, 1, arg);
>> +    }
>> +    va_end(ap);
>> +
>> +    return fdt_property(fdt, name, prop, sizeof(prop));
>> +}
>> +
>> +static int fdt_property_vpci_ranges(libxl__gc *gc, void *fdt,
>> +                                    unsigned addr_cells,
>> +                                    unsigned size_cells,
>> +                                    unsigned num_regs, ...)
>> +{
>> +    uint32_t regs[num_regs*((addr_cells*2)+size_cells+1)];
>> +    be32 *cells =3D &regs[0];
>> +    int i;
>> +    va_list ap;
>> +    uint64_t arg;
>> +
>> +    va_start(ap, num_regs);
>> +    for (i =3D 0 ; i < num_regs; i++) {
>> +        /* Set the memory bit field */
>> +        arg =3D va_arg(ap, uint64_t);
>> +        set_cell(&cells, 1, arg);
>> +
>> +        /* Set the vpci bus address */
>> +        arg =3D addr_cells ? va_arg(ap, uint64_t) : 0;
>> +        set_cell(&cells, addr_cells , arg);
>> +
>> +        /* Set the cpu bus address where vpci address is mapped */
>> +        set_cell(&cells, addr_cells, arg);
>> +
>> +        /* Set the vpci size requested */
>> +        arg =3D size_cells ? va_arg(ap, uint64_t) : 0;
>> +        set_cell(&cells, size_cells,arg);
>> +    }
>> +    va_end(ap);
>> +
>> +    return fdt_property(fdt, "ranges", regs, sizeof(regs));
>> +}
>> +
>>  static int make_root_properties(libxl__gc *gc,
>>                                  const libxl_version_info *vers,
>>                                  void *fdt)
>> @@ -668,6 +720,57 @@ static int make_vpl011_uart_node(libxl__gc *gc, voi=
d *fdt,
>>      return 0;
>>  }
>>  +static int make_vpci_node(libxl__gc *gc, void *fdt,
>> +        const struct arch_info *ainfo,
>> +        struct xc_dom_image *dom)
>> +{
>> +    int res;
>> +    const uint64_t vpci_ecam_base =3D GUEST_VPCI_ECAM_BASE;
>> +    const uint64_t vpci_ecam_size =3D GUEST_VPCI_ECAM_SIZE;
>> +    const char *name =3D GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
>> +
>> +    res =3D fdt_begin_node(fdt, name);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_string(fdt, "device_type", "pci");
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>> +            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_values(gc, fdt, "bus-range", 2, 0,17);
>=20
> AFAICT, the "bus-range" is optional. Can you explain why we need it?

We need it to implement the function pci_ecam_map_bus().
>=20
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_cell(fdt, "#address-cells", 3);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_cell(fdt, "#size-cells", 2);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_string(fdt, "status", "okay");
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_vpci_ranges(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>> +        GUEST_ROOT_SIZE_CELLS, 2,
>> +        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_ADDR, GUEST_VPCI_MEM_S=
IZE,
>> +        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_ADDR=
,
>> +        GUEST_VPCI_PREFETCH_MEM_SIZE);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_values(gc, fdt, "msi-map", 4, 0, GUEST_PHANDLE=
_ITS,
>> +                              0, 0x10000);
>=20
> The ITS is not exposed to the guest so far. So I think this wants to be m=
oved to the future series that will add ITS support.

Ok. I will remove this in next version.

>> +    if (res) return res;
>> +
>> +    res =3D fdt_end_node(fdt);
>> +    if (res) return res;
>> +
>> +    return 0;
>> +}
>> +
>>  static const struct arch_info *get_arch_info(libxl__gc *gc,
>>                                               const struct xc_dom_image =
*dom)
>>  {
>> @@ -971,6 +1074,9 @@ next_resize:
>>          if (info->tee =3D=3D LIBXL_TEE_TYPE_OPTEE)
>>              FDT( make_optee_node(gc, fdt) );
>>  +        if (libxl_defbool_val(info->arch_arm.vpci))
>> +            FDT( make_vpci_node(gc, fdt, ainfo, dom) );
>> +
>>          if (pfdt)
>>              FDT( copy_partial_fdt(gc, fdt, pfdt) );
>>  @@ -1189,6 +1295,9 @@ void libxl__arch_domain_build_info_setdefault(lib=
xl__gc *gc,
>>      /* ACPI is disabled by default */
>>      libxl_defbool_setdefault(&b_info->acpi, false);
>>  +    /* VPCI is disabled by default */
>> +    libxl_defbool_setdefault(&b_info->arch_arm.vpci, false);
>=20
> Here you say that vPCI is disabled by default. However, AFAICT, in the pr=
evious patch you will unconditionally enable vPCI if Xen has been built wit=
h VPCI.
>=20
> Rather than unconditionally enable VPCI for a domain, I think we should i=
ntroduce a new flag that is passed to Xen at the domain creation. The flag =
will be set based on arch_arm.vpci.

OK. I will introduce the flag in next version.

>=20
>> +
>>      if (b_info->type !=3D LIBXL_DOMAIN_TYPE_PV)
>>          return;
>>  diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_=
types.idl
>> index 3f9fff653a..78b1ddf0b8 100644
>> --- a/tools/libs/light/libxl_types.idl
>> +++ b/tools/libs/light/libxl_types.idl
>> @@ -644,6 +644,7 @@ libxl_domain_build_info =3D Struct("domain_build_inf=
o",[
>>        ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>>                                 ("vuart", libxl_vuart_type),
>> +                               ("vpci", libxl_defbool),
>=20
> Any new addition in the structure should be accompanied with a LIBXL_HAVE=
_* in the libxl.h header.

OK.
>=20
>>                                ])),
>>      ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>>                                ])),
>> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
>> index 17dddb4cd5..ffafbeffb4 100644
>> --- a/tools/xl/xl_parse.c
>> +++ b/tools/xl/xl_parse.c
>> @@ -1497,6 +1497,8 @@ void parse_config_data(const char *config_source,
>>          }
>>          if (d_config->num_pcidevs && c_info->type =3D=3D LIBXL_DOMAIN_T=
YPE_PV)
>>              libxl_defbool_set(&b_info->u.pv.e820_host, true);
>> +        if (d_config->num_pcidevs)
>> +            libxl_defbool_set(&b_info->arch_arm.vpci, true);
>>      }
>>        if (!xlu_cfg_get_list (config, "dtdev", &dtdevs, 0, 0)) {
>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm=
.h
>> index 0a9749e768..01d13e669e 100644
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -426,6 +426,17 @@ typedef uint64_t xen_callback_t;
>>  #define GUEST_VPCI_ECAM_BASE    xen_mk_ullong(0x10000000)
>>  #define GUEST_VPCI_ECAM_SIZE    xen_mk_ullong(0x10000000)
>>  +/* PCI-PCIe memory space types */
>> +#define GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM xen_mk_ullong(0x42000000)
>> +#define GUEST_VPCI_ADDR_TYPE_MEM          xen_mk_ullong(0x02000000)
>=20
> What the size of those regions?

Non Prefetch Memory: Size 64 MB start at 512 MB
Prefetch Memory: Size 128 GB start at 36 GB
>=20
>> +
>> +/* Guest PCI-PCIe memory space where config space and BAR will be avail=
able.*/
>> +#define GUEST_VPCI_PREFETCH_MEM_ADDR  xen_mk_ullong(0x900000000)
>> +#define GUEST_VPCI_MEM_ADDR           xen_mk_ullong(0x20000000)
> So far the memory layout defines the address in ascending order. So pleas=
e add that after GUEST_RAM_BANK_BASES_*.

Ok.
>=20
> However, if I am not mistaken that base address you provide will clash wi=
th RAM bank 1. It also seem to be pretty high which means that this will no=
t work for 32-bit domain or on CPUs that don't allow offer large IPA bits.

Yes I also checked that now that it is having clash with RAM bank 1.
There is unused space is guest memory that we can use for Non Prefetch Memo=
ry as per below guest memory map.
https://gitlab.com/xen-project/fusa/fusa-docs/-/blob/master/high-level/gues=
t-memory-layout-arm.rst

Proposed value:
Non Prefetch Memory: Size 64 MB start at 0x22001000
Prefetch Memory: Size 4 GB start at 4 GB.

>=20
> I think we need to start making the guest layout more dynamic. The VPCI m=
emory space would have to go right after the end of the RAM allocated for a=
 given guest.
>=20
>> +
>> +#define GUEST_VPCI_PREFETCH_MEM_SIZE      xen_mk_ullong(0x2000000000)
>> +#define GUEST_VPCI_MEM_SIZE               xen_mk_ullong(0x04000000)
>=20
> It would be better if the size for each region is defined right after eac=
h base.
OK.=20

>=20
> Also, how did you decide the size of each region?

I thought 64 MB will be sufficient. I think it should be based on number of=
 devices we can assign to the guest.=20

Regards,
Rahul

>=20
>> +
>>  /*
>>   * 16MB =3D=3D 4096 pages reserved for guest to use as a region to map =
its
>>   * grant table in.
>> diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/=
device_tree_defs.h
>> index 209d43de3f..d24d86b1fc 100644
>> --- a/xen/include/public/device_tree_defs.h
>> +++ b/xen/include/public/device_tree_defs.h
>> @@ -7,6 +7,7 @@
>>   * onwards. Reserve a high value for the GIC phandle.
>>   */
>>  #define GUEST_PHANDLE_GIC (65000)
>> +#define GUEST_PHANDLE_ITS (64999)
>>    #define GUEST_ROOT_ADDRESS_CELLS 2
>>  #define GUEST_ROOT_SIZE_CELLS 2
>=20
> Cheers,
>=20
> --=20
> Julien Grall


