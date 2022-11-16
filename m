Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EF262B016
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 01:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444097.698930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov6PC-0003tk-UQ; Wed, 16 Nov 2022 00:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444097.698930; Wed, 16 Nov 2022 00:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ov6PC-0003qn-Qf; Wed, 16 Nov 2022 00:35:54 +0000
Received: by outflank-mailman (input) for mailman id 444097;
 Wed, 16 Nov 2022 00:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Po/4=3Q=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ov6PB-0003qh-DU
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 00:35:53 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe12::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9eb4e6de-6546-11ed-8fd2-01056ac49cbb;
 Wed, 16 Nov 2022 01:35:51 +0100 (CET)
Received: from AS9PR06CA0359.eurprd06.prod.outlook.com (2603:10a6:20b:466::29)
 by DB5PR08MB10094.eurprd08.prod.outlook.com (2603:10a6:10:4a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Wed, 16 Nov
 2022 00:35:46 +0000
Received: from VI1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::fe) by AS9PR06CA0359.outlook.office365.com
 (2603:10a6:20b:466::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Wed, 16 Nov 2022 00:35:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT056.mail.protection.outlook.com (100.127.144.95) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 00:35:45 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Wed, 16 Nov 2022 00:35:45 +0000
Received: from a5e6ea8206c3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4E3A8B50-B141-418F-8B47-59A6B86E16A3.1; 
 Wed, 16 Nov 2022 00:35:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a5e6ea8206c3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Nov 2022 00:35:35 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by AS8PR08MB8350.eurprd08.prod.outlook.com (2603:10a6:20b:56c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Wed, 16 Nov
 2022 00:35:32 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::ac6e:a062:a5a3:8a3d]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::ac6e:a062:a5a3:8a3d%5]) with mapi id 15.20.5813.013; Wed, 16 Nov 2022
 00:35:31 +0000
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
X-Inumbo-ID: 9eb4e6de-6546-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GstJ0BQ3ftqubH7tb7ynFFzEiCgxfh4cUU4P/IiaQY=;
 b=f1blOmlgwxfGYfBYEpWkpsbNJK1BKCJOy6VBo+sPud8mKXAaNRtoBPYauHScBmvW3WJzQJ5COvkqwNQHUOgWP2WZwZxHtvIlpjdyrRMXIYg2wurPx1v7NFefba2/v1ew9pMyhN/be3fD8N9XVcKQghBJV71ubDnXxvnDgGGK8fs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFFYVos+HNR5/f5BAuMKOaHA/PnXpwtKQjgbRWW0BnFNSUQ8LdIZ4E8NCX6pT4EF6FPttUbfSmGQ4P0URyCEoTI/PMT4bhoLlf+yTEoX7NWliz1r99EWsLrku0ysVrKiCfuhA4Eg/PK7SsnCtR7aku7YckoDiVqY2k2znmxEiLoxqNzLyny+eCMhyFG975Ai/F5zMaQdYVRe55jG9FnELtaknN7QkbPubXB8KQRCTLOhsJhW8iNnXmkmJU0Vc6iCDKrK4nEyhmHOqH8heHJ8Xk3gUIwe6TSjORcKhk22irayygqMEp2YJ2jhUQjtDUdgqLnVKesVANqtlremtiM/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4GstJ0BQ3ftqubH7tb7ynFFzEiCgxfh4cUU4P/IiaQY=;
 b=CPekPaBe9niEEEmiZtYvtfr67BRFjYvgO8zBvDFNOfJlc0rFISWauuGUzQAy9rgh4hc0cbYpUg9r4h7AbazYUI9G/BDnmK5bJrDgGaCdjsWR3B9fjhkMbr4vsjuKuD71B1MOhNtbZW1eHKltXen4H75PK4YCh5q+ic/hzxY4n5w4g6xLVSA0FRkAuK2ViXr49MSF+8aQle5mouO2GTF/l2AevP4zrymeXADfIirXlh+qysYD641ApFwGVM7TVVwmGXXTuVu2qL1vgOrOwneqXK6+e+pojBZxP8X42JTr6RIOk9fQBQilL0LBhySLec51iBR3vJuDi+ghU2nlxwfdzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GstJ0BQ3ftqubH7tb7ynFFzEiCgxfh4cUU4P/IiaQY=;
 b=f1blOmlgwxfGYfBYEpWkpsbNJK1BKCJOy6VBo+sPud8mKXAaNRtoBPYauHScBmvW3WJzQJ5COvkqwNQHUOgWP2WZwZxHtvIlpjdyrRMXIYg2wurPx1v7NFefba2/v1ew9pMyhN/be3fD8N9XVcKQghBJV71ubDnXxvnDgGGK8fs=
From: Henry Wang <Henry.Wang@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>, Alexandru Isaila <aisaila@bitdefender.com>,
	Tamas K Lengyel <tamas@tklengyel.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, Paul Durrant
	<paul@xen.org>, Christopher Clark <christopher.w.clark@gmail.com>
Subject: RE: [XEN PATCH for-4.17 v2 0/6] Fixing some licences issue in public
 headers
Thread-Topic: [XEN PATCH for-4.17 v2 0/6] Fixing some licences issue in public
 headers
Thread-Index: AQHY73rCghjYe94nkUWe9AEw9k4cv65AxvZg
Date: Wed, 16 Nov 2022 00:35:30 +0000
Message-ID:
 <GV2PR08MB80011ED9F54B1F4783DB8DB492079@GV2PR08MB8001.eurprd08.prod.outlook.com>
References: <20221103115204.49610-1-anthony.perard@citrix.com>
In-Reply-To: <20221103115204.49610-1-anthony.perard@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: C1D8312C94FD2540A2EECC56103BC50E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB8001:EE_|AS8PR08MB8350:EE_|VI1EUR03FT056:EE_|DB5PR08MB10094:EE_
X-MS-Office365-Filtering-Correlation-Id: d0915164-611c-4d9b-5a54-08dac76a804c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ANJR92Cd2YxjkRlPPvvt5Z0kOxcgvW1r3DrreFhOd70zttKpBERlmQNi4CZjt9A+Xn+280g8Mb+E1riSI0D2ezwVX7tToYqgpzVSHJePlnKBAJqvEIJay98so3GPCHqKZawRBle2x1GLqc4TPiGb2e4Ce/BFGuhq0hkDvO6qSag7rzNMV0bWknZuqxI7TUn5rybHJbew0P7sLzxotXQ7e6cs46xglt3thJYv5p+p5OlsHa0Ch996Pnht/LXxumtbbCiogR8gGmOm2AUgqcc4Gk1wKk+9j6Y5OPnwbWYw/SHTvY04/s09ddS3bJnOmPTbnChHw4E72BvqMdJrz2lwVXQ40cLc2DMd0hGRUu99oI1QbgFFt6WVR4s984+rQ2pC5QfNyhRA8zc02tQUSrBOR0smjFoQACAEbGTkBbXV3Sm1hmi2JvXofh+VdaY7kPm54PjPcp8gZFn1PTWpoGdMBUabGXb8LpAAl04yjxgTya89fRt7MomcSdQTyHtsvoe+8vBzjkCuHp72S+Ijc2uBcp2iIKx9K+JbCa2AJvaybPUiITVoPWLg9d3UZj5bYNJM3pXPB/AoFtn6yvl4mPhb6KY8y88woYPfrVVQ8jbsw0207EbVkMIYdcFjzRbN7aBCU6hZmo8cGiss9k/LxEtiPKkVf7T40deYtBkAaZ95bpcSeIf5PbFutO+gm3WwQQ5ILl5ecZdkX1uWJY8w4ZDdqNhVml3wComNuhDl1Mp6d4mlNGcx8aG36QThfS7e9Z/2KM38rKz6fp/3jGjEv+syLzzbcY+4keXdjGpLb0WUCme5IA4LkZQSIE1LkD04OI5nxEnKt0CsVcq4lSQW1Ps/vg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199015)(8936002)(52536014)(38070700005)(7696005)(86362001)(122000001)(33656002)(38100700002)(6506007)(71200400001)(5660300002)(2906002)(966005)(55016003)(83380400001)(66946007)(41300700001)(478600001)(186003)(8676002)(26005)(7416002)(4326008)(66556008)(64756008)(316002)(76116006)(66476007)(54906003)(9686003)(110136005)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8350
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e4f49235-f0e8-450b-ed8d-08dac76a7722
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EL0rNC9a45+14j1Beqznm5uymWnJdeetpZbmIEVCjd8kBOJLOBHvHH7WlALHxWbgpqdqSsk9pqv4YPB1SJ38aPixWeYnTTK20BgOMHyRquVaChL0mPXV+czE1O/d4uq0NebmOtpYjZsjPb+T28+sfbYZ9RfdVid+sDuKR8TB8plsGWO+4fHgiMIuRDOuF6/IJ/JElxLNKqi0h8tP2qp7+iW8TiWtHK4hp268gYNXJBGZWkV1VKhzcw1BiS2fiNCI1JYxfbqJzUToa/4jDO3w+lHCjNSp6uxmGuv1u98p/E0sRCYIQHhLjlr9AuLYdq6KXT/tdKyD3gvVtXyu981lxUrCJ4zv6D9hYXtLqngnnIQeOvhupC16QWIkwivrcEKHW6EQc92NBIkr/MwffwgjfiHCGbnxkmKn6j98GT0gRWqyCjArfeF94nlceAcq+V5m7JRsOuZh4+/KqvqwONkKoxJYKbyID0srAuTMRaV39lvTIoCPlXvqCWEMBOUyHuinbzhNcUhRB+mjVXI6zsJ9j9WOJlwGwhDWlO9ycXRbRDn4h7qBqpmEZyK8qUV8nEQPuP8kY3URh+shxsEug8vP9+pKV5ICcDN/jobhZVwDLMa0/Eg3p+re788v/yUKX0f/eWZbQ8ddm6tuf2V8roE5Pw89YFg03oYe/afUZ6VcqdhZjYd/oGgDgllse1X7kb+2Rf8SbjSULb+JI4VqZk3NncLJFF4x66rtuvp787rjK1gWr+gjdw0vRGv0HVcBORbnlxa1k1C1gbOmHISGR0COZaMLUsEcGOyJyEw3LnRzG7CLpikOfjjocfStMORcsL5++p3Z9gI39HavyaMpyrTJkw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(40460700003)(316002)(33656002)(2906002)(36860700001)(110136005)(336012)(186003)(966005)(47076005)(83380400001)(82310400005)(478600001)(55016003)(107886003)(9686003)(86362001)(82740400003)(40480700001)(356005)(6506007)(5660300002)(8936002)(70586007)(70206006)(81166007)(52536014)(4326008)(41300700001)(7696005)(54906003)(26005)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 00:35:45.7888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0915164-611c-4d9b-5a54-08dac76a804c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10094

Hi Anthony,

> -----Original Message-----
> From: Anthony PERARD <anthony.perard@citrix.com>
> Subject: [XEN PATCH for-4.17 v2 0/6] Fixing some licences issue in public
> headers
>=20
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git
> br.licences-fix-public-headers-v2
>=20
> Hi,
>=20
> Andrew pointed out some licences issue:
>=20
> https://lore.kernel.org/xen-devel/b58f5340-d4fa-df9d-89de-
> 6137005add77@citrix.com/T/#u
> tracked here: https://gitlab.com/xen-project/xen/-/issues/35
>=20
> So I attempt to fix them with this series.
>=20
> For 4.17:
>     This mostly change "documentation" so little risk for those patch, ex=
cept
>     "xen-foreign: Capture licences from the input headers" which changes
>     "mkheader.py" which could generate broken headers.

Yes, and I agree this series should go into the 4.17 to resolve one of the
release blocker pointed out by Andrew:
https://gitlab.com/xen-project/xen/-/issues/35

>=20
> Anthony PERARD (6):
>   xen: Add licence information to public/errno.h
>   xen: Used SPDX identifier in some public headers
>   tools/include/xen-foreign: Add SPDX identifier to generated headers
>   xen: Add licence header to device_tree_defs.h

As Grant Likely from Linaro has confirmed the license change, for the
whole series:

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Great thanks for taking care of this issue.

Kind regards,
Henry


>   Rework COPYING installed in /usr/include/xen/, due to several licences
>   xen: Used SPDX identifier in public headers
>=20
>  tools/include/Makefile                       |  1 -
>  xen/include/public/arch-arm.h                | 19 +-------------
>  xen/include/public/arch-arm/hvm/save.h       | 19 +-------------
>  xen/include/public/arch-arm/smccc.h          | 19 +-------------
>  xen/include/public/arch-x86/cpufeatureset.h  | 19 +-------------
>  xen/include/public/arch-x86/cpuid.h          | 19 +-------------
>  xen/include/public/arch-x86/guest-acpi.h     | 19 +-------------
>  xen/include/public/arch-x86/hvm/save.h       | 19 +-------------
>  xen/include/public/arch-x86/hvm/start_info.h | 19 +-------------
>  xen/include/public/arch-x86/pmu.h            | 19 +-------------
>  xen/include/public/arch-x86/xen-mca.h        | 19 +-------------
>  xen/include/public/arch-x86/xen-x86_32.h     | 19 +-------------
>  xen/include/public/arch-x86/xen-x86_64.h     | 19 +-------------
>  xen/include/public/arch-x86/xen.h            | 19 +-------------
>  xen/include/public/arch-x86_32.h             | 19 +-------------
>  xen/include/public/arch-x86_64.h             | 19 +-------------
>  xen/include/public/argo.h                    | 19 +-------------
>  xen/include/public/callback.h                | 19 +-------------
>  xen/include/public/device_tree_defs.h        |  6 +++++
>  xen/include/public/dom0_ops.h                | 19 +-------------
>  xen/include/public/domctl.h                  | 19 +-------------
>  xen/include/public/elfnote.h                 | 19 +-------------
>  xen/include/public/errno.h                   |  2 ++
>  xen/include/public/event_channel.h           | 19 +-------------
>  xen/include/public/features.h                | 19 +-------------
>  xen/include/public/grant_table.h             | 19 +-------------
>  xen/include/public/hvm/dm_op.h               | 19 +-------------
>  xen/include/public/hvm/e820.h                | 19 +-------------
>  xen/include/public/hvm/hvm_info_table.h      | 19 +-------------
>  xen/include/public/hvm/hvm_op.h              | 19 +-------------
>  xen/include/public/hvm/hvm_vcpu.h            | 19 +-------------
>  xen/include/public/hvm/hvm_xs_strings.h      | 19 +-------------
>  xen/include/public/hvm/ioreq.h               | 19 +-------------
>  xen/include/public/hvm/params.h              | 19 +-------------
>  xen/include/public/hvm/pvdrivers.h           | 19 +-------------
>  xen/include/public/hvm/save.h                | 19 +-------------
>  xen/include/public/hypfs.h                   | 19 +-------------
>  xen/include/public/io/9pfs.h                 | 19 +-------------
>  xen/include/public/io/blkif.h                | 19 +-------------
>  xen/include/public/io/cameraif.h             | 19 +-------------
>  xen/include/public/io/console.h              | 19 +-------------
>  xen/include/public/io/displif.h              | 19 +-------------
>  xen/include/public/io/fbif.h                 | 19 +-------------
>  xen/include/public/io/fsif.h                 | 19 +-------------
>  xen/include/public/io/kbdif.h                | 19 +-------------
>  xen/include/public/io/libxenvchan.h          | 19 +-------------
>  xen/include/public/io/netif.h                | 19 +-------------
>  xen/include/public/io/pciif.h                | 19 +-------------
>  xen/include/public/io/protocols.h            | 19 +-------------
>  xen/include/public/io/pvcalls.h              | 19 +-------------
>  xen/include/public/io/ring.h                 | 19 +-------------
>  xen/include/public/io/sndif.h                | 19 +-------------
>  xen/include/public/io/tpmif.h                | 19 +-------------
>  xen/include/public/io/usbif.h                | 19 +-------------
>  xen/include/public/io/vscsiif.h              | 19 +-------------
>  xen/include/public/io/xenbus.h               | 19 +-------------
>  xen/include/public/io/xs_wire.h              | 19 +-------------
>  xen/include/public/kexec.h                   | 19 +-------------
>  xen/include/public/memory.h                  | 19 +-------------
>  xen/include/public/nmi.h                     | 19 +-------------
>  xen/include/public/physdev.h                 | 19 +-------------
>  xen/include/public/platform.h                | 19 +-------------
>  xen/include/public/pmu.h                     | 19 +-------------
>  xen/include/public/sched.h                   | 19 +-------------
>  xen/include/public/sysctl.h                  | 19 +-------------
>  xen/include/public/tmem.h                    | 19 +-------------
>  xen/include/public/trace.h                   | 19 +-------------
>  xen/include/public/vcpu.h                    | 19 +-------------
>  xen/include/public/version.h                 | 19 +-------------
>  xen/include/public/vm_event.h                | 19 +-------------
>  xen/include/public/xen-compat.h              | 19 +-------------
>  xen/include/public/xen.h                     | 19 +-------------
>  xen/include/public/xencomm.h                 | 19 +-------------
>  xen/include/public/xenoprof.h                | 19 +-------------
>  xen/include/public/xsm/flask_op.h            | 19 +-------------
>  tools/include/xen-foreign/mkheader.py        | 23 ++++++++++++++---
>  tools/include/xen/COPYING                    | 26 ++++++++++++++++++++
>  77 files changed, 125 insertions(+), 1301 deletions(-)
>  create mode 100644 tools/include/xen/COPYING
>=20
> --
> Anthony PERARD


