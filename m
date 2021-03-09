Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A674E3328C4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:42:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95508.180324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdYP-0002zj-6y; Tue, 09 Mar 2021 14:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95508.180324; Tue, 09 Mar 2021 14:41:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdYP-0002zK-3Y; Tue, 09 Mar 2021 14:41:45 +0000
Received: by outflank-mailman (input) for mailman id 95508;
 Tue, 09 Mar 2021 14:41:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBbt=IH=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lJdYO-0002zF-8r
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:41:44 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc5e98c0-ac9f-4d60-baa9-d1707628b7e7;
 Tue, 09 Mar 2021 14:41:43 +0000 (UTC)
Received: from AM5PR0301CA0027.eurprd03.prod.outlook.com
 (2603:10a6:206:14::40) by DB7PR08MB3916.eurprd08.prod.outlook.com
 (2603:10a6:10:7e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.27; Tue, 9 Mar
 2021 14:41:41 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::eb) by AM5PR0301CA0027.outlook.office365.com
 (2603:10a6:206:14::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 14:41:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 14:41:40 +0000
Received: ("Tessian outbound ef5d1dda26b7:v71");
 Tue, 09 Mar 2021 14:41:39 +0000
Received: from e1ec0586851f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AC4D401C-BE3D-45A5-B62D-84680C31C20D.1; 
 Tue, 09 Mar 2021 14:41:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e1ec0586851f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Mar 2021 14:41:34 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5710.eurprd08.prod.outlook.com (2603:10a6:800:1b0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Tue, 9 Mar
 2021 14:41:33 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 14:41:33 +0000
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
X-Inumbo-ID: fc5e98c0-ac9f-4d60-baa9-d1707628b7e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmkRntvzIqeSF3EPYhFBuFd2sali9PIaLs65OqlA918=;
 b=iYNNTiaNPlz2xVdHQDi1n3rng/EUy8N+OYv/W4a9pikzRbgKsl2peOzo/2kibDmCCFUSOQF85PMBYKNNCTadI2F2KUtinPtj/fWgW0JvnsJSDHAfpOX4OtnW4mAuA0y0Bj/lMnKSxDm1q5Qbi8SeARj0CvMFbVCIN9LpXquPlTU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 89878107be7c7124
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/beOX0p95uKDQn189uq4ZYSns1HkkJr8kwxcFxx8aumlPMvvLOZgAIZ6sugnUzCCL+W92N/ZtklcygwHd9AcBZ8VlmkE6IDyONtb9i473YIZa7yaLdpwspJ2heiHLTAO4vhQcFVH06Wh9I1gFop4lZvoTBuvpioPAajda9SijMzrsouZcIqJQixIfx6HjsW0tSo103tYCapt8oewaclebSurci4eS+368NJ3+ZMjBOFAOVwqZDK8dbPqNTh+KbZXgvtTCijkUakORxjADh/YGsj41ZCrADjR7LmTzVytL1tK4Wa/n+FDsxJaAVWcAEfOBGm7UWl2bQFt5tsJpEtgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmkRntvzIqeSF3EPYhFBuFd2sali9PIaLs65OqlA918=;
 b=j3aEk5EE/casAyIWJuNljN13MnSKY2HNJ8tFnPAkbQALt7eIbQ/xa96gwalK/EF88O9AkNXNW7zMpXfnN5o0j/ph5kMEDJvTzsrfMvKPxEsIZXFuqdFK6Pj11HGsJSySBqp4nhAxpiwk0o2a2TKPc5chKx9ubZ1I7QzIyl7q+2PQjiXcPwbfq7+XvTvJvtGt47LsFrp/mX+AB2ll75GUSjDHKWbU6dpK6rw2dhPh5JyNmbzxWsL/yYeDvnoEsKo08MCtDO7Zl0B80NVr8N7byCN/S4dElEeFT4GpQrRGyAR3Xpe/3V0l9othHyEOadcRcc48ce2pi76fU/Y4F9lBgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmkRntvzIqeSF3EPYhFBuFd2sali9PIaLs65OqlA918=;
 b=iYNNTiaNPlz2xVdHQDi1n3rng/EUy8N+OYv/W4a9pikzRbgKsl2peOzo/2kibDmCCFUSOQF85PMBYKNNCTadI2F2KUtinPtj/fWgW0JvnsJSDHAfpOX4OtnW4mAuA0y0Bj/lMnKSxDm1q5Qbi8SeARj0CvMFbVCIN9LpXquPlTU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: Use register_t type in cpuinfo entries
Thread-Topic: [PATCH] xen/arm: Use register_t type in cpuinfo entries
Thread-Index: AQHXFFQNaLCX4oSw+0OC1jGtjtl2z6p7f0oAgAA8pIA=
Date: Tue, 9 Mar 2021 14:41:33 +0000
Message-ID: <70193A3D-F169-41C3-96AF-D2C35ADAF1C9@arm.com>
References:
 <b65f29a67f87de8b25cd23b5fa111c50a2efb1d0.1615209093.git.bertrand.marquis@arm.com>
 <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
 <5bb482ff-a689-67e3-1bc7-30b9bf24034e@suse.com>
In-Reply-To: <5bb482ff-a689-67e3-1bc7-30b9bf24034e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.243.24.187]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ae04af1-140e-404d-5501-08d8e3097380
x-ms-traffictypediagnostic: VE1PR08MB5710:|DB7PR08MB3916:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB39167B74B69409911779A4259D929@DB7PR08MB3916.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +RB2rCN0pXafFw3Y2Cnm4rumO7Jvw6Hir1RRQtrxWskWL1GHpZ9zq3+4gvIdqVPDqJBarIKCMVWHSgrmlwXsS8vrlFRzVPdPxhKjHnKmbB1oi1eHMdAcpvd0EvaMTZdkM4RJ4O84undeP3b5pm3ye+wDU7ckdLtI5oyma+xWlZnr3dChcVQZHWTGR5V2mo/kn6qpWY69QQNdIwutMoc0Xg2nRbCijHRMa4yaRZL5hLSIwlk8w83vXrv7gK4kQ257y150wKjnpA7RI6ANDor2r46uV1t9RNBC1oCMDPsd2z4vB3p3GyC93UZHyQ49foVJS/f930bjCoHu6dkg7rn/rTnIGptnYtFlmBawM1fXtR5uLFVc4YqXyLWnRYLxHYAiYLJRVyAvXQsgJS+LcuyEuMP4D+mmNupYqiNT6M4tl/KhpY/a5e87AMupo2F0+3muT80gHxaKgOSdfskXQswR5Qr+0Tng1yBZj3jPJ8Xrvx6VdfxMJ8L7UbyjRSaOnVf+gM3WyQ7kAuZcjQMegeJs5WZtfzVnIBRFbhAS+310boM8HfF1KCSs7MdzN3j47bDraA7EA8PjGogkcwON+WY1Qg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(54906003)(6512007)(83380400001)(316002)(2906002)(71200400001)(33656002)(8676002)(8936002)(66946007)(76116006)(66476007)(2616005)(91956017)(66556008)(6486002)(64756008)(186003)(478600001)(4326008)(53546011)(4744005)(6506007)(6916009)(5660300002)(26005)(36756003)(66446008)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?Xwt0OMrDVCbxS6HOwLEZqrHr65zh8hd6aSsZCUYIfc4Q4UKKXGwn2Rmt6y9x?=
 =?us-ascii?Q?CfZEKIhcsCgKx/05FcPcC+f4QBUiebmIzKsjLt+dCviMA1w8znPl2GAsirvn?=
 =?us-ascii?Q?guE0tcK7C1z15lAH+8tGUcH1ss+xCF5ZjBgobFGNMVyiNfl0K7BXSAlx4RM/?=
 =?us-ascii?Q?0BkXcewsuULb+yGv0UhuGFzyGzVLmwjHlsXVoQGQ9LMPatpKPaOy0oylLR83?=
 =?us-ascii?Q?CcGn/2IqkzbuiDfgGTTdUd7yIgSq7aiFOG4P9y0fMkMwNLaHLoS/832opTAo?=
 =?us-ascii?Q?iKADseGcK14Y/9Hc91vtIAJ3hNP1teTl1R5Xu0qF9YF5/F3pbUpaji5GdqSh?=
 =?us-ascii?Q?JDqFJF0dGfaWwDCnfl2EAxZiyABgHvevpC/90E7Lte/EwQzGXAd+PwWPC6om?=
 =?us-ascii?Q?dHARNbwTk/GYKplu3btdIzbuapPvjzNveTVv421Dg7kdjmQ6Gc2/m45YGUzY?=
 =?us-ascii?Q?RJyKgqF3aOlk6uTyXTticlxLe+SIVjkyZBjgO7MHF9iRUpAA6Pu7S0Z221P7?=
 =?us-ascii?Q?N10HOYhNJFcIVrTCIVXf5ygHidDonnwGglyHjxN5FXSz/BXF8C67g2eQ6TO8?=
 =?us-ascii?Q?Wjy+8vIoeaDYNW9ftPxh818HPaq2zdwA10B5F+JeOrlEZH3L0uM0sz8ls8Kq?=
 =?us-ascii?Q?E5Ry0AtQQtnXuf87TtQFqSbXY5F6PYlm2VZea4Aa6XoBNbBghjvOgIvm60Vd?=
 =?us-ascii?Q?e7NJ0ftM3poQ8vw/u5IoAtOcnpoqGVsRhD3kOCBoNsTw/8wKZMd666Qjdv78?=
 =?us-ascii?Q?tiGlKqDpDqHICJ2P6c3LWKnaMNfSiSL6QGRiYHhtX8bYr6UYMpEC57Cp2rEY?=
 =?us-ascii?Q?XMgIZ1BvsHohyym/M/ih3o6ld0BmM63vdrFvmRRqVzrd8Yup2+jyZZ/KnwQ/?=
 =?us-ascii?Q?rkxFPdXU1Th+9vbblUvFbSxIuOpDQXM83s/nVmWXIpnAysfDVHv3uoi+zalc?=
 =?us-ascii?Q?Ap/QrLNJKQGZnCiRS0bX4TnxEiebaYDwuh3wdCBp9Gm7/OcuQrcOB7NGEAVl?=
 =?us-ascii?Q?innz/nmBV6DUcxpWHT53jVjIWvvhM6OH6PduP7vy4mZtRk0Nbgv9qmCUFw5e?=
 =?us-ascii?Q?7Y3GklawQf5R549tV5kIIzmYy4BecHK4PWZHZ90W9l6yudsYRzcuhezNgOhh?=
 =?us-ascii?Q?+Vf3yczjFyTarLAbCJDh4nZOP/g+ziexS3r38nOxG9yO0Si9Pb5BWTiQyAWz?=
 =?us-ascii?Q?YFRUvOgeU/HOWSw5/R8iqfO3e8bl5j54nJE6NuBTtp1iOBr0oGPpfA7Wu8SO?=
 =?us-ascii?Q?w8vMVBMGNO/zXrkhN20AiBQs4K8SMNIboHvcYzNc/GCvKg3TVmPozcIfO/Py?=
 =?us-ascii?Q?e4pjibaILJRX+2AwVzUuXWLu?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EC9F2F0E6F3141408892C25535690E09@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5710
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	adcb4ab1-036b-477b-1eed-08d8e3096f1c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	42HOctwvTn2bN4NrOarJBY4bowT1Lzxpf+9aNX8IS2rPdeDeLk0TwpSlLSg5MJWoicoRd6qfy4/6T3EZ+jVzopYTzT+bRw5lldmRsNTxvtE8RTYjSlCt10VvJQtSQs9q2si5a9DJlhfGG0HNe+1fBPSixLBWSleWLH/wfSKzKdGFz2mGQ20emz4Z1dG9TgKxvVedQC5w+YvQa+wSkfKYD5owjGBVNUTjTkhiojslRNAd4JE05BGMXsaK1JyDqI3rFR7YmtsFrqIFusRjUeCksh8XwvCcBoHONicnnr2eYE/YW+wQ2ktJ7JreWSWSKOHpG+E6WFx9UKbiHwMyr8E9NrnGvWUmCLrspCEnkHUY5LxCNJkRgnqk3W5p8j3tDEZdntwOD5vsfnt1p0yGeTQsGM65MKeUGLVMZcTbgroEo38Q5bjBqh+efLv8Y09s1MuEpYyH9R4y6gJB9tGqKu6Loqc6M9aoQtrChLy2lcDWom+Jdl9KyVNGQ9yX2B9+z1Xq94oB2WJV8gRFmzX10pKVkU+Jw/JhdCAavWCTmoezaI+SARyqDq9j/u0yQEzsJVjIwRlN14LQNw9IuEx7V06nFwb2wuPT4L3lFVTtXUFgUdELgCHUpNy3Z7+6omL8HfROrCFkw474ZSVoiG3SeUM2vUzsdhx5zNjPWMrpPgWYnUQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(46966006)(36840700001)(8676002)(36756003)(82310400003)(4744005)(53546011)(6486002)(86362001)(478600001)(36860700001)(6512007)(8936002)(70206006)(6506007)(70586007)(5660300002)(54906003)(316002)(83380400001)(336012)(47076005)(26005)(186003)(4326008)(81166007)(33656002)(82740400003)(6862004)(2906002)(356005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 14:41:40.3516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae04af1-140e-404d-5501-08d8e3097380
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3916

Hi,

> On 9 Mar 2021, at 12:04, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 08.03.2021 20:48, Julien Grall wrote:
>> On 08/03/2021 17:18, Bertrand Marquis wrote:
>>> --- a/xen/arch/arm/smpboot.c
>>> +++ b/xen/arch/arm/smpboot.c
>>> @@ -321,7 +321,8 @@ void start_secondary(void)
>>>      if ( !opt_hmp_unsafe &&
>>>           current_cpu_data.midr.bits !=3D boot_cpu_data.midr.bits )
>>>      {
>>> -        printk(XENLOG_ERR "CPU%u MIDR (0x%x) does not match boot CPU M=
IDR (0x%x),\n"
>>> +        printk(XENLOG_ERR "CPU%u MIDR (0x%"PRIregister") does not matc=
h boot "
>>> +               "CPU MIDR (0x%"PRIregister"),\n"
>>=20
>> For printk messages, we don't tend to split it like that (even for more=
=20
>> than 80 characters one). Instead, the preferred approach is:
>>=20
>> printk(XENLOG_ERR
>>        "line 1\n"
>>        "line 2\n")
>=20
> Except of course you want to repeat XENLOG_ERR for the 2nd line.

Very right.

@Julien: feel free to tell me if you want a v2.

Cheers
Bertrand

>=20
> Jan
>=20


