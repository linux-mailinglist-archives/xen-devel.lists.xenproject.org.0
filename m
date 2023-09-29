Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FC17B2D76
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 10:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610297.949649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8Ud-0006gu-Ki; Fri, 29 Sep 2023 08:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610297.949649; Fri, 29 Sep 2023 08:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm8Ud-0006dn-Hk; Fri, 29 Sep 2023 08:04:59 +0000
Received: by outflank-mailman (input) for mailman id 610297;
 Fri, 29 Sep 2023 08:04:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPTL=FN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qm8Ub-00058n-P9
 for xen-devel@lists.xenproject.org; Fri, 29 Sep 2023 08:04:57 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0666753-5e9e-11ee-9b0d-b553b5be7939;
 Fri, 29 Sep 2023 10:04:56 +0200 (CEST)
Received: from AM6P192CA0093.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::34)
 by AM0PR08MB5475.eurprd08.prod.outlook.com (2603:10a6:208:188::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 08:04:53 +0000
Received: from AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::83) by AM6P192CA0093.outlook.office365.com
 (2603:10a6:209:8d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 08:04:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT061.mail.protection.outlook.com (100.127.140.72) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.21 via Frontend Transport; Fri, 29 Sep 2023 08:04:53 +0000
Received: ("Tessian outbound ee9c7f88acf7:v211");
 Fri, 29 Sep 2023 08:04:53 +0000
Received: from 2af6e0f5c819.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D430F98A-20C4-4C31-88B2-EE22C433BD5A.1; 
 Fri, 29 Sep 2023 08:04:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2af6e0f5c819.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Sep 2023 08:04:46 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS1PR08MB7425.eurprd08.prod.outlook.com (2603:10a6:20b:4c6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.37; Fri, 29 Sep
 2023 08:04:42 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%7]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 08:04:42 +0000
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
X-Inumbo-ID: e0666753-5e9e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhBfNWNtiYtgtIk2Wn5roEu9eOCUXO/Wb8zE9Ygsd6o=;
 b=6LsUZX5faDF8E53mm3DUnQyP7v77ZYu2AsjKGiPjiZDuedqb1E1XWXR29Hb796JLhN1gReaJbBgTwgyRs5eE1fMgGCZVtB7VXnMn7eSmo4SueBTe2+Rc23J5/1++TCtKiq5sKwmBmlZUlXGtvHp7JdwgGosZAQvB5G9XbFkYLgk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 349e0afc0b494f0d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWK7fDczO+PdxBTgSBjNEaZ1wxx7yAMNpmWL/uwGZAxTPVBXz05KFURsV9iLl+uGCMFb7UE4K3gjsMzVHly6yadQDu2sSyietF02mXh/2fnYf8qW5cPX+HasHTOPpUmnKlNBWtgw/tUYh1reO6S3mNiyM8UHhFo0ZUFXVVLvxjuG8gQTOyDZZxq57odpeqfKjj1569wIk8Z3RKS4cqTSH6mwMsGBZ2bH+1J4K5JyyQ/21Ele1XIs4JynPnFpt44+si9EByiI/zTzWmZ2rEa0TdbbZSPdCs2THNATPSe+n2EWyfF1gfnCBE1PxdRo2uC6eo2bZIcAlV3PVjU/DGsRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhBfNWNtiYtgtIk2Wn5roEu9eOCUXO/Wb8zE9Ygsd6o=;
 b=C/8BdxdhyMcYHVM0IqDQgZiF3EhQa1J046n5HG1zoqd2HiDzcTWIIJe5K7n5ifj5yV0D2iyia+lGUO11B2QrUKljYvDgLg//8gHU4oNNK6zIiminN+2+67GBAXshbQ7lJCyzO73mD4+PSPvTi2qQZ5lyVx9QjGNCEHpxk4Dun3BvlxNgrKzD/z/+J9pUD8UrOT9rbb/rDcICjsfhkO5X1qcRxK7o24gOUjwozqnUm7yhTgdMfNS8y0vkgh19nK7DomooR/XIAmMohXEJmzY+SPeWxXHZ/Q8TgJ7Hny6SmEXjUln2eGuJCYeCTxvAG/WoK2IpDoXRFII9T/jtzq/dJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhBfNWNtiYtgtIk2Wn5roEu9eOCUXO/Wb8zE9Ygsd6o=;
 b=6LsUZX5faDF8E53mm3DUnQyP7v77ZYu2AsjKGiPjiZDuedqb1E1XWXR29Hb796JLhN1gReaJbBgTwgyRs5eE1fMgGCZVtB7VXnMn7eSmo4SueBTe2+Rc23J5/1++TCtKiq5sKwmBmlZUlXGtvHp7JdwgGosZAQvB5G9XbFkYLgk=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] Update Xen version to 4.18-rc
Thread-Topic: [PATCH 2/2] Update Xen version to 4.18-rc
Thread-Index: AQHZ8qrc61Z2/2x5F0+YOWbVm7G1MrAxcdIA
Date: Fri, 29 Sep 2023 08:04:42 +0000
Message-ID: <CADEE5AC-6414-4696-9B03-6608261D4FD1@arm.com>
References: <20230929075857.87092-1-julien@xen.org>
 <20230929075857.87092-3-julien@xen.org>
In-Reply-To: <20230929075857.87092-3-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS1PR08MB7425:EE_|AM7EUR03FT061:EE_|AM0PR08MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b1d08b-2bd0-4fac-2573-08dbc0c2c367
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kMCA+tCFFIMU1ohEpdFch3pxihRQE9uycqr3FcC++KClrbvro/Q/oHlMLLrXs9fFOeJLpqWDLTTDXTlwmYdhd0LmsoHqbWmP9MoNdy7XhT9J/mZWFEQNHJDw8bSTDAVq2wjGY0bl6Mz01gq2uHHFoNzMWJHMsr6hg6srfMvWePX5I5bUu4T7PEk4KFffXtH780fyJXQxVYuQF4xzxyK1XbSkVsUUR03Bura3g8/HqrEnGxIZxBwtkXz5eAteuF1ShIfq9aaLKz7bpbaae/Lu4bm3fwzyopJKTKR10Lb0jDgpxjHBqWqyh/3V6HpqsJiAwSuhXOYwEQbDCVZBvcu8xp9ruVj0SE4YCHukmvvtD/sw8AZD/yyDFJgIAW6Airdy89r01Te/jMQrIUilMMas6ERlaW2FTCLpU17zmeFFj6YPx55Sv8Qd6wYJnBolqAsm+Cs/K+4qgHd5BQi1ry9risrOIlA1weIaaSXWhUL+igL3//ZKm63CERLnwz7HQ0FA66mFbNR+7ChGcTPcsoO1uFDRpQxRS3sPKacU6bivs5wgGVEWn0U30oVdPBJ9AWMwZmMGkU4Y26HHyWbg6JKhQY6aaKrqDAeTEWao0t6zOLITsjJvbVcfItZ/bhXEpv/p+StEy+SIxmTNFD3ko0mXbA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(136003)(366004)(39860400002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(36756003)(91956017)(76116006)(71200400001)(6916009)(54906003)(66476007)(66446008)(64756008)(316002)(66946007)(478600001)(66556008)(41300700001)(33656002)(86362001)(122000001)(38100700002)(38070700005)(6512007)(2616005)(6506007)(6486002)(53546011)(26005)(15650500001)(8936002)(8676002)(4326008)(966005)(2906002)(5660300002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <574166A349C4AE49A8E7ABE13766BE8F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7425
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	642d02ea-26e1-422f-b158-08dbc0c2bccb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iGIFvkQ6b801IhOJ6+QpT86WW14Yas8bKNDf4DwL+PPWQIs8nPgGtst9tGAm/T8TVhbz/vijpYyK5WH4lDq6IQ5dcW4U5UT7yD+mW6pFqhm/8Rbd/qMKJPU2ra1Ka2B+sZgeOiW0NO2PuQBzwcBPoZhxERcGNn4GGh0cQwt6lG9fHAT0fBB0fp+RkGBWx3wnEK9AwSR33/UlucqxYMPRFLj4s1WuTKfepgIOZH+y08ZLAoanGRaVzbfOwp2BYfOmPyUoFWJcyETAi1LRHf8bf+vSHz3/6uqH5f8Npn6vfo/9ozQYflB5w8BbTOk0nQoz3XA7WPkH+HWbCN+oJ2GQSIr+/uWp1Jw9HfOW93hVdLALWAD8LcKTesIcHd76JJd7c+ESVi0Qm4T0Xe5UJfPuxWIj/vpg1HDHybQHO3poFd6wCVvN3hLmy8wgnixeVpF5pf9g7tpA9GEgl2wT/y/JgIqjpExTuPg6Dv7LM8kFayUocCndBM2wOjUXLrrKcoUNKLNBJy6dIxBh9eyO3vxB5bdHuh0sCbkVbdQxFTKW6TeAOEP4ojqZl5fNIbWFiYrhrWHUd6x0lGVXZZXki8q4JaGO26/j6cZbVlXQBVwdGq1SYXuu405E7ca/nOVUN7w0QiwRkyMyeuNEWrdJ7utvIJr1F3vQj+lpKIJSwFZC8Uw8CQ1J9Ng//ai+OFss/6KUO/5IeoapGdvzxDVPnwCJYW6gWO4y6NdRmuMUXWLelsA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(40460700003)(86362001)(966005)(81166007)(36860700001)(33656002)(36756003)(5660300002)(53546011)(6506007)(6512007)(83380400001)(6486002)(82740400003)(478600001)(47076005)(40480700001)(356005)(6862004)(4326008)(8936002)(2616005)(8676002)(41300700001)(26005)(336012)(70586007)(15650500001)(316002)(70206006)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 08:04:53.6937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b1d08b-2bd0-4fac-2573-08dbc0c2c367
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5475

Hi Julien,

> On Sep 29, 2023, at 15:58, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
> README       | 16 ++++++++--------
> SUPPORT.md   |  2 +-
> xen/Makefile |  2 +-
> 3 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/README b/README
> index a491c8dce55b..f45e1ef1cdca 100644
> --- a/README
> +++ b/README
> @@ -1,11 +1,11 @@
> -###############################################
> -__  __            _  _    _  ___
> -\ \/ /___ _ __   | || |  / |( _ )
> - \  // _ \ '_ \  | || |_ | |/ _ \
> - /  \  __/ | | | |__   _|| | (_) |
> -/_/\_\___|_| |_|    |_|(_)_|\___/
> -
> -###############################################
> +#################################################
> +                  _  _    _  ___
> +__  _____ _ __   | || |  / |( _ )       _ __ ___
> +\ \/ / _ \ '_ \  | || |_ | |/ _ \ _____| '__/ __|
> + >  <  __/ | | | |__   _|| | (_) |_____| | | (__
> +/_/\_\___|_| |_|    |_|(_)_|\___/      |_|  \___|
> +
> +#################################################
>=20
> https://www.xen.org/
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 3461f5cf2fe3..44dbd4f19040 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,7 +9,7 @@ for the definitions of the support status levels etc.
>=20
> # Release Support
>=20
> -    Xen-Version: 4.18-unstable
> +    Xen-Version: 4.18-rc
>     Initial-Release: n/a
>     Supported-Until: TBD
>     Security-Support-Until: Unreleased - not yet security-supported
> diff --git a/xen/Makefile b/xen/Makefile
> index 2dc5e3526de9..fd0e63d29efb 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -6,7 +6,7 @@ this-makefile :=3D $(call lastword,$(MAKEFILE_LIST))
> # All other places this is stored (eg. compile.h) should be autogenerated=
.
> export XEN_VERSION       =3D 4
> export XEN_SUBVERSION    =3D 18
> -export XEN_EXTRAVERSION ?=3D -unstable$(XEN_VENDORVERSION)
> +export XEN_EXTRAVERSION ?=3D -rc$(XEN_VENDORVERSION)
> export XEN_FULLVERSION   =3D $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAV=
ERSION)
> -include xen-version
>=20
> --=20
> 2.40.1
>=20
>=20


