Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3926004C6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 03:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424014.671219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okEnk-0004o0-Lq; Mon, 17 Oct 2022 01:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424014.671219; Mon, 17 Oct 2022 01:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okEnk-0004ln-Im; Mon, 17 Oct 2022 01:20:20 +0000
Received: by outflank-mailman (input) for mailman id 424014;
 Mon, 17 Oct 2022 01:20:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rSUT=2S=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1okEni-0004lh-5f
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 01:20:18 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00074.outbound.protection.outlook.com [40.107.0.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da5c3a9b-4db9-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 03:20:14 +0200 (CEST)
Received: from FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a8::7) by
 PR3PR08MB5721.eurprd08.prod.outlook.com (2603:10a6:102:84::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Mon, 17 Oct 2022 01:20:11 +0000
Received: from VI1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a8:cafe::82) by FR0P281CA0106.outlook.office365.com
 (2603:10a6:d10:a8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.11 via Frontend
 Transport; Mon, 17 Oct 2022 01:20:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT040.mail.protection.outlook.com (100.127.145.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 01:20:11 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Mon, 17 Oct 2022 01:20:10 +0000
Received: from 0d1c0b26cf2d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48234B8C-CDD0-4712-9908-B17F112A62F8.1; 
 Mon, 17 Oct 2022 01:20:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0d1c0b26cf2d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Oct 2022 01:20:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9372.eurprd08.prod.outlook.com (2603:10a6:10:422::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Mon, 17 Oct
 2022 01:20:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 01:20:02 +0000
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
X-Inumbo-ID: da5c3a9b-4db9-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=i32NPsmMmKHrqxffGg+mQz++eczoGC9qoNWd50hEjTU8G8zh5O/Atk3rv2bn5DgE4AD74LmkQYA9tcbwEg3WqiZjR0ABcie+jVq7wlg90ifOBVzVxxJ91NSS91s0rSaWzJ7yoe0KSvs7nslOBgHVxMZYIZAj3Rrbe1iJ4dj0WeXWD2eXWlRxdvB50FtbN4PQFYLbLgdePl3XUyyTCc/YKFTVRK973zCC4I+RRpTNCnQOOS5jp5JeF1of2n2q7QE6FUQPln1Uo8+7YJghuEcDgCR2N2LXWkBDmQwl51Qy3lIdee1tFtzJLAb5giNGH4hg63cm7SMlLRyhbpg2BJx0qQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMVfwCMTa6hADqBJ7X+oJkbnQ7zM2WKTFKjj92Cu6tc=;
 b=LWzqBIsOPDDZePNUn5HTjfHtML8HrfSivdfcOQf/u7wCbnAD0o/mb8qEWx0DGo4yeYytub4Xm+Jvhd7ADnqnHyT3mnckTD+e3/ND1H2VdvMlzHhErsBhp14jvsdU+9R6g8axKFji+nB0OUsakRgwHQ6RXDpVgc0QtchQ+ObhjkCuNZNqoAAbxgoM7URiI/PCgOXUun2/p6uo7ss+WEVwEUcMqbbDAFvAI0YbmZuX7oPut83YhKu9uMy9HUKE2VuqpbJXRM9gfL6vh7PcaYA/Jc+JHxeBPLS4MTrSMw/MmbryowYPTQeEvhQEE76hOjOuzdMux9+pIX8udH0QNktLlA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMVfwCMTa6hADqBJ7X+oJkbnQ7zM2WKTFKjj92Cu6tc=;
 b=Nj8zZeoX9Bf1QYwiw8VHOtA0vXIYYIs7ctWg9P0h8v9HXVLEengQvigN/aeXVGc+q6tbAgPSoOBvHdrn5gJkyj5mNcTFp82AcroN1EJUG3LDSLum6JGBZK6neP8uwv1SFoIOfXDgLLVjqRuuWq3DlZ9T3FL/h31PZYMRAB0MCek=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmdHk7w/Xf/M9guvDXd2HRjAmuQufzANxQbdjyxgNd1R9ylm55sPggjQtMFZKK81QAnkqU2wQkRJNT2AEOhH7wPuOhzJ4IWAnYM3ViTRQXsBv+qXaHsLH1JPq9i68svZZWImGz7ivfSHdklBY8iE9X22g1Z39wA2uo2K1B4zbAqJcilkhmbmZpHHP4oDW6LM4d/Dj9RcFrMx76IQuQRktJ+1w6Ry/oh6PmDkgCcaocP6vMpG2WUkgHPrnZDiFmnzn4yixnfklTdTiPeI0dewFpD9f6Kdh3ZQVdbPDizrOQwGLmWDRZsoAi3E8ulnQdqr3fhriK02jeHt7yrVGyf6Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMVfwCMTa6hADqBJ7X+oJkbnQ7zM2WKTFKjj92Cu6tc=;
 b=XAhxGR/j6vUsX+SWOpWFXaSMtlMSX/ZFVqf9x4Bu44TbOxBXPw7lN2C6sVU+lTCN4alRaGz33Xh7VuY4eYcO23d6H4mEkw3IoZNRyr9bim32dmnGoeoAqgM9KHX4xMPzv/B9aQnHt1yfxxX2g2FI7XvFg857gecHZnAzL7fk7OZryjqmf1yvYetwrxErAboTNHoR9OhdWOvlLpBxe3mwj/3IrfatcQL1OjELCrEJelKHKMpzU/8YreOuZZG46qdzTne4ouWsGK51Rp47sPnySuJa3km073nAXvNxv1LFa9pQR9rNJ8ihRF3zwE15M+Qe4paHEJF46IDasdnLjhjMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMVfwCMTa6hADqBJ7X+oJkbnQ7zM2WKTFKjj92Cu6tc=;
 b=Nj8zZeoX9Bf1QYwiw8VHOtA0vXIYYIs7ctWg9P0h8v9HXVLEengQvigN/aeXVGc+q6tbAgPSoOBvHdrn5gJkyj5mNcTFp82AcroN1EJUG3LDSLum6JGBZK6neP8uwv1SFoIOfXDgLLVjqRuuWq3DlZ9T3FL/h31PZYMRAB0MCek=
From: Henry Wang <Henry.Wang@arm.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: RE: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory API
Thread-Topic: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory
 API
Thread-Index: AQHY1AgeJwq4WhKefkGyVS1JhkdRo64QKSwAgAG7SUA=
Date: Mon, 17 Oct 2022 01:20:02 +0000
Message-ID:
 <AS8PR08MB7991A2F3DE5A5B55ED3D09F492299@AS8PR08MB7991.eurprd08.prod.outlook.com>
References:
 <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
 <ecee2217151efd08b2bae58166efcdd319ec82c8.1664458360.git-series.marmarek@invisiblethingslab.com>
 <Y0s5Xvr5PBQq5pVB@mail-itl>
In-Reply-To: <Y0s5Xvr5PBQq5pVB@mail-itl>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2305602B2D5B3041AC65E2FF83A7CA51.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9372:EE_|VI1EUR03FT040:EE_|PR3PR08MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: fc171aa5-78bb-4c8e-6fdd-08daafddbca1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F/tDhwpBDhAzhU9KjQmqd3pZKLfJ8V5Z+bhTKF1XEzKw4m4K8xGnB0oBPEwsFCzjBVXDsB3q8DgZwqVfw5OIIbyexMTCqxawrEoFJXbn51NyPfAz5lPBeEEb/hm4Q1prcwa8Rpe0vr1qi2k8zVRoaFV240N78TjWujQCnyvgo+HpTVJljbWMZCEhfEFBAUiRg+WxZD17KRVRHZai3fOSchXuPcZgSToUYkH4tLw8PDiHEjuUpHHzLFv9qDQDj1BLo1Ar5oZjnJ5EGQSxbTg+l/5mdMaqTA86ZByfk+Z+Cs4KR6FimN1+OCHMFY/KsFyG+ftZVC+/MPWyVtdihJrNRFOy6DL+lqI29lCqvMny3iHN9cNIdd1yTOvFI2h8XNh5ZsMP4kxfUMSENFdDP84fc3Sf3UboM+NALTxIn3/dTUZKeXiBJIc3NOvdFlgP8jxAViKGP+Ye9NYsxwTB1Q8wgGQVyUfUfZ2kb3n10+oyIjYFuey4b0n/Zk0RUm8bDUWgZeXbwf8d5iDKMX2OQgAWxR4lPKtg0YuUFrkVsfCvdqER93EhBiYLo0+kVtWXUSOzwgUTQ2u9L+lg/hcRBuCGX4UC+FTcr+q6FhDkGKo2c09PLrc1BgH4+vlGTM9bLucqVOstPs3e5dCexuliaD086OhkMswQlAJFXlRWBwX0+i7S0yHjDhPwFtAoUw8a2WQa4SaLGzyPNaKRVjUvuFh6vc4gTq0g/AHphHiFoRpIwLZY0myvqkNW76KNgE68uwBE9O2VqKEsIJPnBaIZ9ansVA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199015)(71200400001)(54906003)(186003)(38070700005)(66574015)(83380400001)(86362001)(122000001)(38100700002)(5660300002)(2906002)(41300700001)(4326008)(52536014)(55016003)(8936002)(64756008)(8676002)(478600001)(9686003)(6506007)(7696005)(26005)(316002)(76116006)(66476007)(66556008)(66946007)(110136005)(66446008)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9372
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9fc80161-91e6-4037-4a7b-08daafddb74c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5SrLqw3AotK5wV/QdfDzlZy+uG7oXvF2Vh3d7WmqVX5uevcE01IqWLyEDoMu3L0MTNR0JkkjXnU8UWm828UEyslqZZ70kvRJ8tCTWIio1aWe4Rwk/LgnLhlz/XMR7pMCMGHQXEAGrTXhTc0YdZBlDmX/pIcdmx9CowjPccrSrItuV7wVMN3DU7qD7sgc90eQ6GUJOD4M8jJmGCclafuAP5JXkIaPeh8ixtNMkcF52Pu+AIPB+iHRCKOe0DxjDxTAvc+vSCT8rfxbXuLXNqJXLHkbgNtY3hUz5xMlARGRYX9OhykyC5W3PwWcSg6vbUmau2wjUlUWGyCWqB8reSmpmmEvj+pEu0Sgs27J6FE/8NKwEKBf7lKV245R/PhlonAqUi+hpb0ezuL9BW3z3I9lIfihqaXfQE7vtxK8p29kCHRNPmYzIECWoFOeBsnrjQE+D7sMtRFAy6K+q0UrEoIGMPoL2jf6xTZ3WJxOUeDXEZ9cKya4Um5R+CCvXoC6VvxgkkmCBE6bHygvT4JIYfWxz9cSpSi8rkA46FL4+uloyEJs9SsAFrozqnbLQ757KUD+VYehgMKhnrE3d2719RXwrqN1Ww74NxUQVybEQCgMax31UAAM0WQMwjHAED1ziFT1yBWmN81mjj7+9XC2hLsB6nSPliuAiNXBOVHfEWIYi/MR9MwbQpEOboZ2fEOxxGEdUgZ1S5y+n5VH2ba4KeqdyZvS5IVPBChR2mu6KRu0/1GSG+/J1hSn7BZhJvsvxCKV
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(36840700001)(46966006)(33656002)(36860700001)(86362001)(5660300002)(2906002)(82740400003)(336012)(47076005)(186003)(81166007)(356005)(66574015)(83380400001)(7696005)(6506007)(316002)(26005)(478600001)(9686003)(110136005)(54906003)(70586007)(70206006)(82310400005)(55016003)(40480700001)(41300700001)(52536014)(4326008)(8936002)(107886003)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 01:20:11.2113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc171aa5-78bb-4c8e-6fdd-08daafddbca1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5721

SGkgTWFyZWssDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWFyZWsg
TWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDEvMl0gSU9NTVUvVlQtZDogd2lyZSBjb21tb24gZGV2
aWNlIHJlc2VydmVkDQo+IG1lbW9yeSBBUEkNCj4gDQo+IE9uIFRodSwgU2VwIDI5LCAyMDIyIGF0
IDAzOjMzOjEyUE0gKzAyMDAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraQ0KPiB3cm90ZToN
Cj4gPiBSZS11c2Ugcm1ycj0gcGFyYW1ldGVyIGhhbmRsaW5nIGNvZGUgdG8gaGFuZGxlIGNvbW1v
biBkZXZpY2UgcmVzZXJ2ZWQNCj4gPiBtZW1vcnkuDQo+ID4NCj4gPiBNb3ZlIE1BWF9VU0VSX1JN
UlJfUEFHRVMgbGltaXQgZW5mb3JjZW1lbnQgdG8gYXBwbHkgb25seSB0bw0KPiA+IHVzZXItY29u
ZmlndXJlZCByYW5nZXMsIGJ1dCBub3QgdGhvc2UgZnJvbSBpbnRlcm5hbCBjYWxsZXJzLg0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpDQo+IDxtYXJt
YXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gDQo+IEhlbnJ5LCBjYW4gdGhpcyBiZSBpbmNsdWRl
ZCBpbiA0LjE3PyBUaGUgQU1EIGNvdW50ZXJwYXJ0IHdlbnQgaW4NCj4gZWFybGllciwgYnV0IGR1
ZSB0byBsYXRlIHJldmlldyBvbiBJbnRlbCBwYXJ0LCB0aGlzIG9uZSBkaWRuJ3QuDQoNClRoYW5r
cyBmb3IgdGhlIGluZm9ybWF0aW9uLiBJIGFncmVlIHRoaXMgaXMgYSB2YWxpZCByZWFzb24sIGJ1
dCB0byBiZQ0Kc2FmZSBJIHdvdWxkIGxpa2UgdG8gaGVhciBvcGluaW9ucyBmcm9tIHRoZSB4ODYg
bWFpbnRhaW5lcnMgKGFkZGVkDQppbiBDQykuDQoNCkFuZHJldy9KYW4vUm9nZXI6IE1heSBJIGhh
dmUgeW91ciBmZWVkYmFjayBhYm91dCB0aGlzPyBUaGFua3MhDQoNCktpbmQgcmVnYXJkcywNCkhl
bnJ5DQoNCj4gDQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBpbiB2ODoNCj4gPiAtIG1vdmUgYWRkX29u
ZV91c2VyX3JtcnIoKSBmdW5jdGlvbiBlYXJsaWVyDQo+ID4gLSBleHRlbmQgY29tbWl0IG1lc3Nh
Z2UNCj4gPiBDaGFuZ2VzIGluIHYzOg0KPiA+IC0gbWFrZSBNQVhfVVNFUl9STVJSX1BBR0VTIGFw
cGxpY2FibGUgb25seSB0byB1c2VyLWNvbmZpZ3VyZWQgUk1SUg0KPiA+IC0tLQ0KPiA+ICB4ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jIHwgMTk2ICsrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTE0IGluc2VydGlvbnMoKyksIDgyIGRl
bGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3Z0ZC9kbWFyLmMNCj4gYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jDQo+ID4g
aW5kZXggMzY3MzA0Yzg3MzljLi43OGM4YmFkMTUxNWEgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYw0KPiA+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3Z0ZC9kbWFyLmMNCj4gPiBAQCAtODYxLDExMyArODYxLDEzNiBAQCBzdGF0aWMgc3Ry
dWN0IHVzZXJfcm1yciBfX2luaXRkYXRhDQo+IHVzZXJfcm1ycnNbTUFYX1VTRVJfUk1SUl07DQo+
ID4NCj4gPiAgLyogTWFjcm8gZm9yIFJNUlIgaW5jbHVzaXZlIHJhbmdlIGZvcm1hdHRpbmcuICov
DQo+ID4gICNkZWZpbmUgRVJNUlJVX0ZNVCAiWyVseC0lbHhdIg0KPiA+IC0jZGVmaW5lIEVSTVJS
VV9BUkcoZXJ1KSBlcnUuYmFzZV9wZm4sIGVydS5lbmRfcGZuDQo+ID4gKyNkZWZpbmUgRVJNUlJV
X0FSRyBiYXNlX3BmbiwgZW5kX3Bmbg0KPiA+DQo+ID4gLXN0YXRpYyBpbnQgX19pbml0IGFkZF91
c2VyX3JtcnIodm9pZCkNCj4gPiArLyogUmV0dXJucyAxIG9uIHN1Y2Nlc3MsIDAgd2hlbiBpZ25v
cmluZyBhbmQgPCAwIG9uIGVycm9yLiAqLw0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBhZGRfb25l
X3VzZXJfcm1ycih1bnNpZ25lZCBsb25nIGJhc2VfcGZuLA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGVuZF9wZm4sDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBkZXZfY291bnQsDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90ICpzYmRmKQ0KPiA+
ICB7DQo+ID4gICAgICBzdHJ1Y3QgYWNwaV9ybXJyX3VuaXQgKnJtcnIsICpybXJydTsNCj4gPiAt
ICAgIHVuc2lnbmVkIGludCBpZHgsIHNlZywgaTsNCj4gPiAtICAgIHVuc2lnbmVkIGxvbmcgYmFz
ZSwgZW5kOw0KPiA+ICsgICAgdW5zaWduZWQgaW50IGlkeCwgc2VnOw0KPiA+ICsgICAgdW5zaWdu
ZWQgbG9uZyBiYXNlX2l0ZXI7DQo+ID4gICAgICBib29sIG92ZXJsYXA7DQo+ID4NCj4gPiAtICAg
IGZvciAoIGkgPSAwOyBpIDwgbnJfcm1ycjsgaSsrICkNCj4gPiArICAgIGlmICggaW9tbXVfdmVy
Ym9zZSApDQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19ERUJVRyBWVERQUkVGSVgNCj4gPiAr
ICAgICAgICAgICAgICAgIkFkZGluZyBSTVJSIGZvciAlZCBkZXZpY2UgKFswXTogJSN4KSByYW5n
ZSAiRVJNUlJVX0ZNVCJcbiIsDQo+ID4gKyAgICAgICAgICAgICAgIGRldl9jb3VudCwgc2JkZlsw
XSwgRVJNUlJVX0FSRyk7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCBiYXNlX3BmbiA+IGVuZF9wZm4g
KQ0KPiA+ICAgICAgew0KPiA+IC0gICAgICAgIGJhc2UgPSB1c2VyX3JtcnJzW2ldLmJhc2VfcGZu
Ow0KPiA+IC0gICAgICAgIGVuZCA9IHVzZXJfcm1ycnNbaV0uZW5kX3BmbjsNCj4gPiArICAgICAg
ICBwcmludGsoWEVOTE9HX0VSUiBWVERQUkVGSVgNCj4gPiArICAgICAgICAgICAgICAgIkludmFs
aWQgUk1SUiBSYW5nZSAiRVJNUlJVX0ZNVCJcbiIsDQo+ID4gKyAgICAgICAgICAgICAgIEVSTVJS
VV9BUkcpOw0KPiA+ICsgICAgICAgIHJldHVybiAwOw0KPiA+ICsgICAgfQ0KPiA+DQo+ID4gLSAg
ICAgICAgaWYgKCBiYXNlID4gZW5kICkNCj4gPiArICAgIG92ZXJsYXAgPSBmYWxzZTsNCj4gPiAr
ICAgIGxpc3RfZm9yX2VhY2hfZW50cnkocm1ycnUsICZhY3BpX3JtcnJfdW5pdHMsIGxpc3QpDQo+
ID4gKyAgICB7DQo+ID4gKyAgICAgICAgaWYgKCBwZm5fdG9fcGFkZHIoYmFzZV9wZm4pIDw9IHJt
cnJ1LT5lbmRfYWRkcmVzcyAmJg0KPiA+ICsgICAgICAgICAgICAgcm1ycnUtPmJhc2VfYWRkcmVz
cyA8PSBwZm5fdG9fcGFkZHIoZW5kX3BmbikgKQ0KPiA+ICAgICAgICAgIHsNCj4gPiAgICAgICAg
ICAgICAgcHJpbnRrKFhFTkxPR19FUlIgVlREUFJFRklYDQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAiSW52YWxpZCBSTVJSIFJhbmdlICJFUk1SUlVfRk1UIlxuIiwNCj4gPiAtICAgICAgICAgICAg
ICAgICAgIEVSTVJSVV9BUkcodXNlcl9ybXJyc1tpXSkpOw0KPiA+IC0gICAgICAgICAgICBjb250
aW51ZTsNCj4gPiArICAgICAgICAgICAgICAgICAgICJPdmVybGFwcGluZyBSTVJSczogIkVSTVJS
VV9GTVQiIGFuZCBbJWx4LSVseF1cbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICBFUk1SUlVf
QVJHLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgcGFkZHJfdG9fcGZuKHJtcnJ1LT5iYXNlX2Fk
ZHJlc3MpLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgcGFkZHJfdG9fcGZuKHJtcnJ1LT5lbmRf
YWRkcmVzcykpOw0KPiA+ICsgICAgICAgICAgICBvdmVybGFwID0gdHJ1ZTsNCj4gPiArICAgICAg
ICAgICAgYnJlYWs7DQo+ID4gICAgICAgICAgfQ0KPiA+ICsgICAgfQ0KPiA+ICsgICAgLyogRG9u
J3QgYWRkIG92ZXJsYXBwaW5nIFJNUlIuICovDQo+ID4gKyAgICBpZiAoIG92ZXJsYXAgKQ0KPiA+
ICsgICAgICAgIHJldHVybiAwOw0KPiA+DQo+ID4gLSAgICAgICAgaWYgKCAoZW5kIC0gYmFzZSkg
Pj0gTUFYX1VTRVJfUk1SUl9QQUdFUyApDQo+ID4gKyAgICBiYXNlX2l0ZXIgPSBiYXNlX3BmbjsN
Cj4gPiArICAgIGRvDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKF9t
Zm4oYmFzZV9pdGVyKSkgKQ0KPiA+ICAgICAgICAgIHsNCj4gPiAgICAgICAgICAgICAgcHJpbnRr
KFhFTkxPR19FUlIgVlREUFJFRklYDQo+ID4gLSAgICAgICAgICAgICAgICAgICAiUk1SUiByYW5n
ZSAiRVJNUlJVX0ZNVCIgZXhjZWVkcyAiXA0KPiA+IC0gICAgICAgICAgICAgICAgICAgX19zdHJp
bmdpZnkoTUFYX1VTRVJfUk1SUl9QQUdFUykiIHBhZ2VzXG4iLA0KPiA+IC0gICAgICAgICAgICAg
ICAgICAgRVJNUlJVX0FSRyh1c2VyX3JtcnJzW2ldKSk7DQo+ID4gLSAgICAgICAgICAgIGNvbnRp
bnVlOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgIkludmFsaWQgcGZuIGluIFJNUlIgcmFuZ2Ug
IkVSTVJSVV9GTVQiXG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgRVJNUlJVX0FSRyk7DQo+
ID4gKyAgICAgICAgICAgIGJyZWFrOw0KPiA+ICAgICAgICAgIH0NCj4gPiArICAgIH0gd2hpbGUg
KCBiYXNlX2l0ZXIrKyA8IGVuZF9wZm4gKTsNCj4gPg0KPiA+IC0gICAgICAgIG92ZXJsYXAgPSBm
YWxzZTsNCj4gPiAtICAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHJtcnJ1LCAmYWNwaV9ybXJy
X3VuaXRzLCBsaXN0KQ0KPiA+IC0gICAgICAgIHsNCj4gPiAtICAgICAgICAgICAgaWYgKCBwZm5f
dG9fcGFkZHIoYmFzZSkgPD0gcm1ycnUtPmVuZF9hZGRyZXNzICYmDQo+ID4gLSAgICAgICAgICAg
ICAgICAgcm1ycnUtPmJhc2VfYWRkcmVzcyA8PSBwZm5fdG9fcGFkZHIoZW5kKSApDQo+ID4gLSAg
ICAgICAgICAgIHsNCj4gPiAtICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIFZURFBS
RUZJWA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICJPdmVybGFwcGluZyBSTVJSczogIkVS
TVJSVV9GTVQiIGFuZCBbJWx4LSVseF1cbiIsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
RVJNUlJVX0FSRyh1c2VyX3JtcnJzW2ldKSwNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBw
YWRkcl90b19wZm4ocm1ycnUtPmJhc2VfYWRkcmVzcyksDQo+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgcGFkZHJfdG9fcGZuKHJtcnJ1LT5lbmRfYWRkcmVzcykpOw0KPiA+IC0gICAgICAgICAg
ICAgICAgb3ZlcmxhcCA9IHRydWU7DQo+ID4gLSAgICAgICAgICAgICAgICBicmVhazsNCj4gPiAt
ICAgICAgICAgICAgfQ0KPiA+IC0gICAgICAgIH0NCj4gPiAtICAgICAgICAvKiBEb24ndCBhZGQg
b3ZlcmxhcHBpbmcgUk1SUi4gKi8NCj4gPiAtICAgICAgICBpZiAoIG92ZXJsYXAgKQ0KPiA+IC0g
ICAgICAgICAgICBjb250aW51ZTsNCj4gPiArICAgIC8qIEludmFsaWQgcGZuIGluIHJhbmdlIGFz
IHRoZSBsb29wIGVuZGVkIGJlZm9yZSBlbmRfcGZuIHdhcyByZWFjaGVkLg0KPiAqLw0KPiA+ICsg
ICAgaWYgKCBiYXNlX2l0ZXIgPD0gZW5kX3BmbiApDQo+ID4gKyAgICAgICAgcmV0dXJuIDA7DQo+
ID4NCj4gPiAtICAgICAgICBkbw0KPiA+IC0gICAgICAgIHsNCj4gPiAtICAgICAgICAgICAgaWYg
KCAhbWZuX3ZhbGlkKF9tZm4oYmFzZSkpICkNCj4gPiAtICAgICAgICAgICAgew0KPiA+IC0gICAg
ICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgVlREUFJFRklYDQo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgIkludmFsaWQgcGZuIGluIFJNUlIgcmFuZ2UgIkVSTVJSVV9GTVQiXG4iLA0K
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIEVSTVJSVV9BUkcodXNlcl9ybXJyc1tpXSkpOw0K
PiA+IC0gICAgICAgICAgICAgICAgYnJlYWs7DQo+ID4gLSAgICAgICAgICAgIH0NCj4gPiAtICAg
ICAgICB9IHdoaWxlICggYmFzZSsrIDwgZW5kICk7DQo+ID4gKyAgICBybXJyID0geHphbGxvYyhz
dHJ1Y3QgYWNwaV9ybXJyX3VuaXQpOw0KPiA+ICsgICAgaWYgKCAhcm1yciApDQo+ID4gKyAgICAg
ICAgcmV0dXJuIC1FTk9NRU07DQo+ID4NCj4gPiAtICAgICAgICAvKiBJbnZhbGlkIHBmbiBpbiBy
YW5nZSBhcyB0aGUgbG9vcCBlbmRlZCBiZWZvcmUgZW5kX3BmbiB3YXMgcmVhY2hlZC4NCj4gKi8N
Cj4gPiAtICAgICAgICBpZiAoIGJhc2UgPD0gZW5kICkNCj4gPiAtICAgICAgICAgICAgY29udGlu
dWU7DQo+ID4gKyAgICBybXJyLT5zY29wZS5kZXZpY2VzID0geG1hbGxvY19hcnJheSh1MTYsIGRl
dl9jb3VudCk7DQo+ID4gKyAgICBpZiAoICFybXJyLT5zY29wZS5kZXZpY2VzICkNCj4gPiArICAg
IHsNCj4gPiArICAgICAgICB4ZnJlZShybXJyKTsNCj4gPiArICAgICAgICByZXR1cm4gLUVOT01F
TTsNCj4gPiArICAgIH0NCj4gPg0KPiA+IC0gICAgICAgIHJtcnIgPSB4emFsbG9jKHN0cnVjdCBh
Y3BpX3JtcnJfdW5pdCk7DQo+ID4gLSAgICAgICAgaWYgKCAhcm1yciApDQo+ID4gLSAgICAgICAg
ICAgIHJldHVybiAtRU5PTUVNOw0KPiA+ICsgICAgc2VnID0gMDsNCj4gPiArICAgIGZvciAoIGlk
eCA9IDA7IGlkeCA8IGRldl9jb3VudDsgaWR4KysgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAg
IHJtcnItPnNjb3BlLmRldmljZXNbaWR4XSA9IHNiZGZbaWR4XTsNCj4gPiArICAgICAgICBzZWcg
fD0gUENJX1NFRyhzYmRmW2lkeF0pOw0KPiA+ICsgICAgfQ0KPiA+ICsgICAgaWYgKCBzZWcgIT0g
UENJX1NFRyhzYmRmWzBdKSApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxP
R19FUlIgVlREUFJFRklYDQo+ID4gKyAgICAgICAgICAgICAgICJTZWdtZW50cyBhcmUgbm90IGVx
dWFsIGZvciBSTVJSIHJhbmdlICJFUk1SUlVfRk1UIlxuIiwNCj4gPiArICAgICAgICAgICAgICAg
RVJNUlJVX0FSRyk7DQo+ID4gKyAgICAgICAgc2NvcGVfZGV2aWNlc19mcmVlKCZybXJyLT5zY29w
ZSk7DQo+ID4gKyAgICAgICAgeGZyZWUocm1ycik7DQo+ID4gKyAgICAgICAgcmV0dXJuIDA7DQo+
ID4gKyAgICB9DQo+ID4NCj4gPiAtICAgICAgICBybXJyLT5zY29wZS5kZXZpY2VzID0geG1hbGxv
Y19hcnJheSh1MTYsIHVzZXJfcm1ycnNbaV0uZGV2X2NvdW50KTsNCj4gPiAtICAgICAgICBpZiAo
ICFybXJyLT5zY29wZS5kZXZpY2VzICkNCj4gPiAtICAgICAgICB7DQo+ID4gLSAgICAgICAgICAg
IHhmcmVlKHJtcnIpOw0KPiA+IC0gICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiAtICAg
ICAgICB9DQo+ID4gKyAgICBybXJyLT5zZWdtZW50ID0gc2VnOw0KPiA+ICsgICAgcm1yci0+YmFz
ZV9hZGRyZXNzID0gcGZuX3RvX3BhZGRyKGJhc2VfcGZuKTsNCj4gPiArICAgIC8qIEFsaWduIHRo
ZSBlbmRfYWRkcmVzcyB0byB0aGUgZW5kIG9mIHRoZSBwYWdlICovDQo+ID4gKyAgICBybXJyLT5l
bmRfYWRkcmVzcyA9IHBmbl90b19wYWRkcihlbmRfcGZuKSB8IH5QQUdFX01BU0s7DQo+ID4gKyAg
ICBybXJyLT5zY29wZS5kZXZpY2VzX2NudCA9IGRldl9jb3VudDsNCj4gPg0KPiA+IC0gICAgICAg
IHNlZyA9IDA7DQo+ID4gLSAgICAgICAgZm9yICggaWR4ID0gMDsgaWR4IDwgdXNlcl9ybXJyc1tp
XS5kZXZfY291bnQ7IGlkeCsrICkNCj4gPiAtICAgICAgICB7DQo+ID4gLSAgICAgICAgICAgIHJt
cnItPnNjb3BlLmRldmljZXNbaWR4XSA9IHVzZXJfcm1ycnNbaV0uc2JkZltpZHhdOw0KPiA+IC0g
ICAgICAgICAgICBzZWcgfD0gUENJX1NFRyh1c2VyX3JtcnJzW2ldLnNiZGZbaWR4XSk7DQo+ID4g
LSAgICAgICAgfQ0KPiA+IC0gICAgICAgIGlmICggc2VnICE9IFBDSV9TRUcodXNlcl9ybXJyc1tp
XS5zYmRmWzBdKSApDQo+ID4gLSAgICAgICAgew0KPiA+IC0gICAgICAgICAgICBwcmludGsoWEVO
TE9HX0VSUiBWVERQUkVGSVgNCj4gPiAtICAgICAgICAgICAgICAgICAgICJTZWdtZW50cyBhcmUg
bm90IGVxdWFsIGZvciBSTVJSIHJhbmdlICJFUk1SUlVfRk1UIlxuIiwNCj4gPiAtICAgICAgICAg
ICAgICAgICAgIEVSTVJSVV9BUkcodXNlcl9ybXJyc1tpXSkpOw0KPiA+IC0gICAgICAgICAgICBz
Y29wZV9kZXZpY2VzX2ZyZWUoJnJtcnItPnNjb3BlKTsNCj4gPiAtICAgICAgICAgICAgeGZyZWUo
cm1ycik7DQo+ID4gLSAgICAgICAgICAgIGNvbnRpbnVlOw0KPiA+IC0gICAgICAgIH0NCj4gPiAr
ICAgIGlmICggcmVnaXN0ZXJfb25lX3JtcnIocm1ycikgKQ0KPiA+ICsgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSIFZURFBSRUZJWA0KPiA+ICsgICAgICAgICAgICAgICAiQ291bGQgbm90IHJlZ2lz
dGVyIFJNTVIgcmFuZ2UgIkVSTVJSVV9GTVQiXG4iLA0KPiA+ICsgICAgICAgICAgICAgICBFUk1S
UlVfQVJHKTsNCj4gPg0KPiA+IC0gICAgICAgIHJtcnItPnNlZ21lbnQgPSBzZWc7DQo+ID4gLSAg
ICAgICAgcm1yci0+YmFzZV9hZGRyZXNzID0gcGZuX3RvX3BhZGRyKHVzZXJfcm1ycnNbaV0uYmFz
ZV9wZm4pOw0KPiA+IC0gICAgICAgIC8qIEFsaWduIHRoZSBlbmRfYWRkcmVzcyB0byB0aGUgZW5k
IG9mIHRoZSBwYWdlICovDQo+ID4gLSAgICAgICAgcm1yci0+ZW5kX2FkZHJlc3MgPSBwZm5fdG9f
cGFkZHIodXNlcl9ybXJyc1tpXS5lbmRfcGZuKSB8DQo+IH5QQUdFX01BU0s7DQo+ID4gLSAgICAg
ICAgcm1yci0+c2NvcGUuZGV2aWNlc19jbnQgPSB1c2VyX3JtcnJzW2ldLmRldl9jb3VudDsNCj4g
PiArICAgIHJldHVybiAxOw0KPiA+ICt9DQo+ID4NCj4gPiAtICAgICAgICBpZiAoIHJlZ2lzdGVy
X29uZV9ybXJyKHJtcnIpICkNCj4gPiAtICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgVlRE
UFJFRklYDQo+ID4gLSAgICAgICAgICAgICAgICAgICAiQ291bGQgbm90IHJlZ2lzdGVyIFJNTVIg
cmFuZ2UgIkVSTVJSVV9GTVQiXG4iLA0KPiA+IC0gICAgICAgICAgICAgICAgICAgRVJNUlJVX0FS
Ryh1c2VyX3JtcnJzW2ldKSk7DQo+ID4gLSAgICB9DQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGFk
ZF91c2VyX3JtcnIodm9pZCkNCj4gPiArew0KPiA+ICsgICAgdW5zaWduZWQgaW50IGk7DQo+ID4g
KyAgICBpbnQgcmV0Ow0KPiA+DQo+ID4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG5yX3JtcnI7IGkr
KyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcmV0ID0gYWRkX29uZV91c2VyX3JtcnIodXNl
cl9ybXJyc1tpXS5iYXNlX3BmbiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1c2VyX3JtcnJzW2ldLmVuZF9wZm4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdXNlcl9ybXJyc1tpXS5kZXZfY291bnQsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdXNlcl9ybXJyc1tpXS5zYmRmKTsNCj4gPiArICAgICAgICBpZiAoIHJldCA8
IDAgKQ0KPiA+ICsgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+ICsgICAgfQ0KPiA+ICAgICAg
cmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBjZl9jaGVjayBh
ZGRfb25lX2V4dHJhX3JtcnIoeGVuX3Bmbl90IHN0YXJ0LA0KPiB4ZW5fdWxvbmdfdCBuciwgdTMy
IGlkLCB2b2lkICpjdHh0KQ0KPiA+ICt7DQo+ID4gKyAgICB1MzIgc2JkZl9hcnJheVtdID0geyBp
ZCB9Ow0KPiA+ICsgICAgcmV0dXJuIGFkZF9vbmVfdXNlcl9ybXJyKHN0YXJ0LCBzdGFydCtuciwg
MSwgc2JkZl9hcnJheSk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IGFk
ZF9leHRyYV9ybXJyKHZvaWQpDQo+ID4gK3sNCj4gPiArICAgIHJldHVybg0KPiBpb21tdV9nZXRf
ZXh0cmFfcmVzZXJ2ZWRfZGV2aWNlX21lbW9yeShhZGRfb25lX2V4dHJhX3JtcnIsIE5VTEwpOw0K
PiA+ICt9DQo+ID4gKw0KPiA+ICAjaW5jbHVkZSA8YXNtL3Rib290Lmg+DQo+ID4gIC8qIEFDUEkg
dGFibGVzIG1heSBub3QgYmUgRE1BIHByb3RlY3RlZCBieSB0Ym9vdCwgc28gdXNlIERNQVIgY29w
eSAqLw0KPiA+ICAvKiBTSU5JVCBzYXZlZCBpbiBTaW5pdE1sZURhdGEgaW4gVFhUIGhlYXAgKHdo
aWNoIGlzIERNQSBwcm90ZWN0ZWQpICovDQo+ID4gQEAgLTEwMTAsNyArMTAzMyw3IEBAIGludCBf
X2luaXQgYWNwaV9kbWFyX2luaXQodm9pZCkNCj4gPiAgICAgIHsNCj4gPiAgICAgICAgICBpb21t
dV9pbml0X29wcyA9ICZpbnRlbF9pb21tdV9pbml0X29wczsNCj4gPg0KPiA+IC0gICAgICAgIHJl
dHVybiBhZGRfdXNlcl9ybXJyKCk7DQo+ID4gKyAgICAgICAgcmV0dXJuIGFkZF91c2VyX3JtcnIo
KSB8fCBhZGRfZXh0cmFfcm1ycigpOw0KPiA+ICAgICAgfQ0KPiA+DQo+ID4gICAgICByZXR1cm4g
cmV0Ow0KPiA+IEBAIC0xMTA4LDYgKzExMzEsMTUgQEAgc3RhdGljIGludCBfX2luaXQgY2ZfY2hl
Y2sNCj4gcGFyc2Vfcm1ycl9wYXJhbShjb25zdCBjaGFyICpzdHIpDQo+ID4gICAgICAgICAgZWxz
ZQ0KPiA+ICAgICAgICAgICAgICBlbmQgPSBzdGFydDsNCj4gPg0KPiA+ICsgICAgICAgIGlmICgg
KGVuZCAtIHN0YXJ0KSA+PSBNQVhfVVNFUl9STVJSX1BBR0VTICkNCj4gPiArICAgICAgICB7DQo+
ID4gKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIFZURFBSRUZJWA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICJSTVJSIHJhbmdlICJFUk1SUlVfRk1UIiBleGNlZWRzICJcDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgX19zdHJpbmdpZnkoTUFYX1VTRVJfUk1SUl9QQUdFUykiIHBhZ2Vz
XG4iLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgIHN0YXJ0LCBlbmQpOw0KPiA+ICsgICAgICAg
ICAgICByZXR1cm4gLUUyQklHOw0KPiA+ICsgICAgICAgIH0NCj4gPiArDQo+ID4gICAgICAgICAg
dXNlcl9ybXJyc1tucl9ybXJyXS5iYXNlX3BmbiA9IHN0YXJ0Ow0KPiA+ICAgICAgICAgIHVzZXJf
cm1ycnNbbnJfcm1ycl0uZW5kX3BmbiA9IGVuZDsNCj4gPg0KPiA+IC0tDQo+ID4gZ2l0LXNlcmll
cyAwLjkuMQ0KPiA+DQo+IA0KPiAtLQ0KPiBCZXN0IFJlZ2FyZHMsDQo+IE1hcmVrIE1hcmN6eWtv
d3NraS1Hw7NyZWNraQ0KPiBJbnZpc2libGUgVGhpbmdzIExhYg0K

