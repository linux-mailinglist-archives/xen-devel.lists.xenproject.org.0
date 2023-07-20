Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B2975ABD0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 12:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566518.885433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQmQ-0000ZP-AG; Thu, 20 Jul 2023 10:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566518.885433; Thu, 20 Jul 2023 10:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQmQ-0000Ws-7P; Thu, 20 Jul 2023 10:21:06 +0000
Received: by outflank-mailman (input) for mailman id 566518;
 Thu, 20 Jul 2023 10:21:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZVXH=DG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qMQmO-0000Wm-UF
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 10:21:05 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d02d6d4-26e7-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 12:20:59 +0200 (CEST)
Received: from AS9PR06CA0037.eurprd06.prod.outlook.com (2603:10a6:20b:463::21)
 by AS2PR08MB8976.eurprd08.prod.outlook.com (2603:10a6:20b:5fd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Thu, 20 Jul
 2023 10:20:45 +0000
Received: from AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:463:cafe::2e) by AS9PR06CA0037.outlook.office365.com
 (2603:10a6:20b:463::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24 via Frontend
 Transport; Thu, 20 Jul 2023 10:20:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT064.mail.protection.outlook.com (100.127.140.127) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.34 via Frontend Transport; Thu, 20 Jul 2023 10:20:44 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Thu, 20 Jul 2023 10:20:44 +0000
Received: from d062739cb110.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72A45D2C-1A3A-4749-BB80-0D0D429959B1.1; 
 Thu, 20 Jul 2023 10:20:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d062739cb110.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Jul 2023 10:20:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU2PR08MB10086.eurprd08.prod.outlook.com (2603:10a6:10:46e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Thu, 20 Jul
 2023 10:20:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6609.022; Thu, 20 Jul 2023
 10:20:34 +0000
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
X-Inumbo-ID: 1d02d6d4-26e7-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpqCwJxErKWnC142hKEsRdr8pshIKgW+TW+ze44pAhw=;
 b=oF5pdagCe22qAzBmlQ45q6S2pLKr8DXSYzSQl3tYF2Zlj0NTmR7LnAs8YJtv+I8p6W8tvn5AOCAtnNjdnStDznIwNVlQJrCySkBOgckQQjL9yWbsqdv6pbo8R/LZwZNfhgotyOeENr6ZX/UBrCnHug4O7PiXV0Fs68XPgzjJn3Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: eeaa2731c5432388
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiMRT57qUcB6dM/w7oB67gLsRhdTyGKI1+NxGURPDwEn17Z7OGRbxMY8JTbT0fov33eiv6BqyA1bXpQ+5jLuSyhodQCu+bVv2s52CpFfSdYVNwtnve3kHsfm1ITH+OWqUyeLGaM3Qgu1mbc8jYKr/z/J4NY1vs/xmoygcduYYYOO01Vv2fetOvVtZxsbUOAhO7F2Tqobtdh9WyDGD/XaZZCeFeWl+UvErcTDyCUNCWf7ubnhc5x0GLfoxBAsJkBMpQaioVaW9XVW6EuBvgcjabK1+2fCv3ozgFUnv15yE67dAlgPYrH2KhPN6DLF/JsPNxsgUqDrUOTUNpJVYvNlrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpqCwJxErKWnC142hKEsRdr8pshIKgW+TW+ze44pAhw=;
 b=MB8ie6vnxQecKvCRSEM8opf7Amt+A7Vvx0x/uX1K4POjxmaGOm/zN36X6XLdizslTCx6L9D+4RCHAbFaAXJM9nQDbT1OMDl0bXrhVhwX0BF2n+NH4uqKBopz+QBKqLQpyyG1LlNbkXS1EnYjlFfNi7pXxbpVawaLSyg085l0jCdhQ+NsVr1/Jf3u1/oLzqCembqB6gVvAz+WTpDdIkh9FAGn99cMK8BD5ZOINJdsmugoa/X1oLW7A4HnGAAE6a5VR3d1ijOqGiMs1MJvJTPh/e95Y5t2VRbhlBSd6VTJZLP7iV9rcsJiKZCaGvrMsHyyErIEsgzMbILy1X15hOxM+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpqCwJxErKWnC142hKEsRdr8pshIKgW+TW+ze44pAhw=;
 b=oF5pdagCe22qAzBmlQ45q6S2pLKr8DXSYzSQl3tYF2Zlj0NTmR7LnAs8YJtv+I8p6W8tvn5AOCAtnNjdnStDznIwNVlQJrCySkBOgckQQjL9yWbsqdv6pbo8R/LZwZNfhgotyOeENr6ZX/UBrCnHug4O7PiXV0Fs68XPgzjJn3Q=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v10 04/24] xen/arm: tee: add a primitive FF-A mediator
Thread-Topic: [XEN PATCH v10 04/24] xen/arm: tee: add a primitive FF-A
 mediator
Thread-Index: Adm689GhjSkC7NGAbEqy0vn1vOHi5Q==
Date: Thu, 20 Jul 2023 10:20:34 +0000
Message-ID: <FE5A2E30-8737-415E-92B2-B6B7B0BF0CCE@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-5-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-5-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU2PR08MB10086:EE_|AM7EUR03FT064:EE_|AS2PR08MB8976:EE_
X-MS-Office365-Filtering-Correlation-Id: d2260fb6-aa1a-4292-6ed8-08db890afa49
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 58qWK91nwJMky/9/0dLf9keIKPrfiQVVlDR5Mx/rsFpldIkjYxbRY5NSWoRsfq+f+25dZ8uCowpXnlTn2oYF/DVA7rw2MknQmva6YDrDFPUUxTkNK946+Ag0PFZdDzR+1Q1z1DVMnSWb+YWPuXX687A+1hrSh4q78MKmFXN62oWnPgJSdsZlYgiLah10hCbzce9bz2ak4FY3EYT5pBhiuYyYml7ccdh+8HMWUy/1mUmnSyP0Bp2zfvbsAmH7I3b2BNcGjKAUrBrLir1VR/3TNYMvM/PMMQszu9thT7hTC0j03+4+2J6XvIeqsY2tBBBkpHg768OA0V+7P3iQNmNaLoQj6CK+n2hLJlaWajk3xlEHvlgnI3frMwN56ztfaWUYQStGYyjUQpCfukFoQxiv3TjgYMoiPCnwBbOfG6d3VW+B/o0doUd8w1QN/Mu37Dm2vaGx1dKVaLzZfX6r7+VSJ7NOVZOBkjbgDATdTSDZRsaEJos2tOZ/Vdh2kMEU+c9ZqyKISS6EOe0nXOucbdBFerN3pzEBa8Olj/SeaYhttLH9kvSyN0EP7BaQbLrDXfAhfRN6/5S9lGs8H3fZz06IGnUGpLqhkq1shOVX2DuAzRnuZzI+8D/UhEOJbD/Vp3Wn
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199021)(71200400001)(6486002)(91956017)(66556008)(54906003)(478600001)(83380400001)(33656002)(53546011)(30864003)(38070700005)(86362001)(2906002)(6506007)(5660300002)(186003)(36756003)(966005)(2616005)(316002)(6512007)(64756008)(76116006)(26005)(6916009)(66446008)(8936002)(66476007)(122000001)(38100700002)(66946007)(41300700001)(8676002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F7F839CEF55B584FB7AE01EA8745C318@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10086
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e6274ad2-3cc3-489f-ea23-08db890af41e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+v7mzvSHBJunK+raoNGSxjXV2vWdt/tLn5PRdly9gvu16iWZe4FfEaQgUgv8GuVXmhuFwiz1sHSpHIxDaAMbdoggNbP0MvaB7yPNKvJdW2gWZfZ3P5JcBQybGmEeuqnWzVy8Ak/enxuwbp5dGZYJRtsnTOfA6iMu5SCfLsqCnXm0UOluUfzjf856vCcS70y6iJflbHMZZL3lM82jXmAKMcuRA4BEzISddQui5Pmk22pvhpyVxXGvvir4eAXc/Z+j1ZgTBhpt7QP7cUPVk4wg0nmM40kzJdsEdPAOCOVtBLbDQ0q/IOHXh3dLN8T6sbJz0Rh4D94OiTFHXKiM/YmRMTu0tHAMwHPkgRBFbbOVz2rqip7pN+34e33sFSOepy6lVJkjbazgUrYyQicsxJdhZXLLQI3QJqwQZ8cT1ZrofspGIX7HBDEMtM/x2sFOEo7G1NpmIp4XPr3K+L/aCRPriCOOgKbGum1w6/RXuHNSfTqvPbwo91lauuhOs7QCcfPWZjYch7ArKCvFMouIjkRoBQXkDpK2hEKZzH1ISjboYMOwz7ovEm7wRNhnyVmBuAFd/QQYDZzXByNfafzjWYMJCw6wyvauTdxxDJwQv1xphQSohRZCoz2kH8Bw2iK5k+8AZS0KQPaKWppP9Z+pmS/etiqA+aiSQ7GN1l3Khu7jyoA/2gP3b3xfr6yO4R3EWinWlu7rME5VpoTVfBGd259GFWUPj0Ndmrz2oQ3l3HKitDk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(82310400008)(451199021)(36840700001)(46966006)(40470700004)(478600001)(2906002)(54906003)(6486002)(8676002)(30864003)(36756003)(4326008)(70586007)(70206006)(316002)(8936002)(41300700001)(82740400003)(47076005)(2616005)(83380400001)(336012)(356005)(966005)(81166007)(6512007)(186003)(6506007)(40460700003)(53546011)(86362001)(5660300002)(6862004)(33656002)(107886003)(40480700001)(36860700001)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 10:20:44.4070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2260fb6-aa1a-4292-6ed8-08db890afa49
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8976

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
>=20
> This commit brings in only the parts needed to negotiate FF-A version
> number with guest and SPMC.
>=20
> [1] https://developer.arm.com/documentation/den0077/e
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> xen/arch/arm/include/asm/psci.h    |   4 +
> xen/arch/arm/include/asm/tee/ffa.h |  35 +++++
> xen/arch/arm/tee/Kconfig           |  11 ++
> xen/arch/arm/tee/Makefile          |   1 +
> xen/arch/arm/tee/ffa.c             | 225 +++++++++++++++++++++++++++++
> xen/arch/arm/vsmc.c                |  17 ++-
> xen/include/public/arch-arm.h      |   1 +
> 7 files changed, 291 insertions(+), 3 deletions(-)
> create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
> create mode 100644 xen/arch/arm/tee/ffa.c
>=20
> diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/p=
sci.h
> index 832f77afff3a..4780972621bb 100644
> --- a/xen/arch/arm/include/asm/psci.h
> +++ b/xen/arch/arm/include/asm/psci.h
> @@ -24,6 +24,10 @@ void call_psci_cpu_off(void);
> void call_psci_system_off(void);
> void call_psci_system_reset(void);
>=20
> +/* Range of allocated PSCI function numbers */
> +#define PSCI_FNUM_MIN_VALUE                 _AC(0,U)
> +#define PSCI_FNUM_MAX_VALUE                 _AC(0x1f,U)
> +
> /* PSCI v0.2 interface */
> #define PSCI_0_2_FN32(nr) ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,        =
     \
>                                              ARM_SMCCC_CONV_32,          =
     \
> diff --git a/xen/arch/arm/include/asm/tee/ffa.h b/xen/arch/arm/include/as=
m/tee/ffa.h
> new file mode 100644
> index 000000000000..44361a4e78e4
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/tee/ffa.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/arch/arm/include/asm/tee/ffa.h
> + *
> + * Arm Firmware Framework for ARMv8-A(FFA) mediator
> + *
> + * Copyright (C) 2023  Linaro Limited
> + */
> +
> +#ifndef __ASM_ARM_TEE_FFA_H__
> +#define __ASM_ARM_TEE_FFA_H__
> +
> +#include <xen/const.h>
> +#include <xen/kconfig.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/types.h>
> +
> +#define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
> +#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
> +
> +static inline bool is_ffa_fid(uint32_t fid)
> +{
> +    uint32_t fn =3D fid & ARM_SMCCC_FUNC_MASK;
> +
> +    return fn >=3D FFA_FNUM_MIN_VALUE && fn <=3D FFA_FNUM_MAX_VALUE;
> +}
> +
> +#ifdef CONFIG_FFA
> +#define FFA_NR_FUNCS    12
> +#else
> +#define FFA_NR_FUNCS    0
> +#endif
> +
> +#endif /*__ASM_ARM_TEE_FFA_H__*/
> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
> index 392169b2559d..923f08ba8cb7 100644
> --- a/xen/arch/arm/tee/Kconfig
> +++ b/xen/arch/arm/tee/Kconfig
> @@ -8,3 +8,14 @@ config OPTEE
>  virtualization-enabled OP-TEE present. You can learn more
>  about virtualization for OP-TEE at
>  https://optee.readthedocs.io/architecture/virtualization.html
> +
> +config FFA
> + bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
> + default n
> + depends on ARM_64

Even if the tee Makefile is only included if CONFIG_TEE is activated,
the missing dependency on TEE here allows to select FFA without TEE
resulting in a config with FFA activated but not compiled in.

No build error is coming from this, FFA is just not in if selected without =
TEE.

Should be:

depends on ARM_64 && TEE

I am ok if this is fixed on commit and my R-B kept.

Cheers
Bertrand

> + help
> +  This option enables a minimal FF-A mediator. The mediator is
> +  generic as it follows the FF-A specification [1], but it only
> +  implements a small subset of the specification.
> +
> +  [1] https://developer.arm.com/documentation/den0077/latest
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index 982c87968447..58a1015e40e0 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -1,2 +1,3 @@
> +obj-$(CONFIG_FFA) +=3D ffa.o
> obj-y +=3D tee.o
> obj-$(CONFIG_OPTEE) +=3D optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> new file mode 100644
> index 000000000000..927c4d33a380
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -0,0 +1,225 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * xen/arch/arm/tee/ffa.c
> + *
> + * Arm Firmware Framework for ARMv8-A (FF-A) mediator
> + *
> + * Copyright (C) 2023  Linaro Limited
> + */
> +
> +#include <xen/bitops.h>
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/sizes.h>
> +#include <xen/types.h>
> +
> +#include <asm/event.h>
> +#include <asm/regs.h>
> +#include <asm/smccc.h>
> +#include <asm/tee/ffa.h>
> +#include <asm/tee/tee.h>
> +
> +/* Error codes */
> +#define FFA_RET_OK                      0
> +#define FFA_RET_NOT_SUPPORTED           -1
> +#define FFA_RET_INVALID_PARAMETERS      -2
> +#define FFA_RET_NO_MEMORY               -3
> +#define FFA_RET_BUSY                    -4
> +#define FFA_RET_INTERRUPTED             -5
> +#define FFA_RET_DENIED                  -6
> +#define FFA_RET_RETRY                   -7
> +#define FFA_RET_ABORTED                 -8
> +
> +/* FFA_VERSION helpers */
> +#define FFA_VERSION_MAJOR_SHIFT         16U
> +#define FFA_VERSION_MAJOR_MASK          0x7FFFU
> +#define FFA_VERSION_MINOR_SHIFT         0U
> +#define FFA_VERSION_MINOR_MASK          0xFFFFU
> +#define MAKE_FFA_VERSION(major, minor)  \
> +        ((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT)=
 | \
> +         ((minor) & FFA_VERSION_MINOR_MASK))
> +
> +#define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
> +/* The minimal FF-A version of the SPMC that can be supported */
> +#define FFA_MIN_SPMC_VERSION    FFA_VERSION_1_1
> +
> +/*
> + * This is the version we want to use in communication with guests and S=
Ps.
> + * During negotiation with a guest or a SP we may need to lower it for
> + * that particular guest or SP.
> + */
> +#define FFA_MY_VERSION_MAJOR    1U
> +#define FFA_MY_VERSION_MINOR    1U
> +#define FFA_MY_VERSION          MAKE_FFA_VERSION(FFA_MY_VERSION_MAJOR, \
> +                                                 FFA_MY_VERSION_MINOR)
> +
> +/* Function IDs */
> +#define FFA_ERROR                       0x84000060U
> +#define FFA_SUCCESS_32                  0x84000061U
> +#define FFA_VERSION                     0x84000063U
> +
> +struct ffa_ctx {
> +    /* FF-A version used by the guest */
> +    uint32_t guest_vers;
> +};
> +
> +/* Negotiated FF-A version to use with the SPMC */
> +static uint32_t __ro_after_init ffa_version;
> +
> +static bool ffa_get_version(uint32_t *vers)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_VERSION,
> +        .a1 =3D FFA_MY_VERSION,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 =3D=3D FFA_RET_NOT_SUPPORTED )
> +    {
> +        gprintk(XENLOG_ERR, "ffa: FFA_VERSION returned not supported\n")=
;
> +        return false;
> +    }
> +
> +    *vers =3D resp.a0;
> +
> +    return true;
> +}
> +
> +static void set_regs(struct cpu_user_regs *regs, register_t v0, register=
_t v1,
> +                     register_t v2, register_t v3, register_t v4, regist=
er_t v5,
> +                     register_t v6, register_t v7)
> +{
> +        set_user_reg(regs, 0, v0);
> +        set_user_reg(regs, 1, v1);
> +        set_user_reg(regs, 2, v2);
> +        set_user_reg(regs, 3, v3);
> +        set_user_reg(regs, 4, v4);
> +        set_user_reg(regs, 5, v5);
> +        set_user_reg(regs, 6, v6);
> +        set_user_reg(regs, 7, v7);
> +}
> +
> +static void handle_version(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    uint32_t vers =3D get_user_reg(regs, 1);
> +
> +    if ( vers < FFA_VERSION_1_1 )
> +        vers =3D FFA_VERSION_1_0;
> +    else
> +        vers =3D FFA_VERSION_1_1;
> +
> +    ctx->guest_vers =3D vers;
> +    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> +}
> +
> +static bool ffa_handle_call(struct cpu_user_regs *regs)
> +{
> +    uint32_t fid =3D get_user_reg(regs, 0);
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx )
> +        return false;
> +
> +    switch ( fid )
> +    {
> +    case FFA_VERSION:
> +        handle_version(regs);
> +        return true;
> +
> +    default:
> +        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> +        return false;
> +    }
> +}
> +
> +static int ffa_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx;
> +
> +    if ( !ffa_version )
> +        return -ENODEV;
> +
> +    ctx =3D xzalloc(struct ffa_ctx);
> +    if ( !ctx )
> +        return -ENOMEM;
> +
> +    d->arch.tee =3D ctx;
> +
> +    return 0;
> +}
> +
> +/* This function is supposed to undo what ffa_domain_init() has done */
> +static int ffa_domain_teardown(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !ctx )
> +        return 0;
> +
> +    XFREE(d->arch.tee);
> +
> +    return 0;
> +}
> +
> +static int ffa_relinquish_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static bool ffa_probe(void)
> +{
> +    uint32_t vers;
> +    unsigned int major_vers;
> +    unsigned int minor_vers;
> +
> +    /*
> +     * psci_init_smccc() updates this value with what's reported by EL-3
> +     * or secure world.
> +     */
> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_2 )
> +    {
> +        printk(XENLOG_ERR
> +               "ffa: unsupported SMCCC version %#x (need at least %#x)\n=
",
> +               smccc_ver, ARM_SMCCC_VERSION_1_2);
> +        return false;
> +    }
> +
> +    if ( !ffa_get_version(&vers) )
> +        return false;
> +
> +    if ( vers < FFA_MIN_SPMC_VERSION || vers > FFA_MY_VERSION )
> +    {
> +        printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers)=
;
> +        return false;
> +    }
> +
> +    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR=
_MASK;
> +    minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
> +    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> +           FFA_MY_VERSION_MAJOR, FFA_MY_VERSION_MINOR);
> +    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> +           major_vers, minor_vers);
> +
> +    ffa_version =3D vers;
> +
> +    return true;
> +}
> +
> +static const struct tee_mediator_ops ffa_ops =3D
> +{
> +    .probe =3D ffa_probe,
> +    .domain_init =3D ffa_domain_init,
> +    .domain_teardown =3D ffa_domain_teardown,
> +    .relinquish_resources =3D ffa_relinquish_resources,
> +    .handle_call =3D ffa_handle_call,
> +};
> +
> +REGISTER_TEE_MEDIATOR(ffa, "FF-A", XEN_DOMCTL_CONFIG_TEE_FFA, &ffa_ops);
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index cd68fa80e98a..7f2f5eb9ce3d 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -15,6 +15,7 @@
> #include <asm/monitor.h>
> #include <asm/regs.h>
> #include <asm/smccc.h>
> +#include <asm/tee/ffa.h>
> #include <asm/tee/tee.h>
> #include <asm/traps.h>
> #include <asm/vpsci.h>
> @@ -24,7 +25,7 @@
> #define XEN_SMCCC_FUNCTION_COUNT 3
>=20
> /* Number of functions currently supported by Standard Service Service Ca=
lls. */
> -#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS)
> +#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS + FFA_NR_FUNCS)
>=20
> static bool fill_uid(struct cpu_user_regs *regs, xen_uuid_t uuid)
> {
> @@ -188,13 +189,23 @@ static bool handle_existing_apis(struct cpu_user_re=
gs *regs)
>     return do_vpsci_0_1_call(regs, fid);
> }
>=20
> +static bool is_psci_fid(uint32_t fid)
> +{
> +    uint32_t fn =3D fid & ARM_SMCCC_FUNC_MASK;
> +
> +    return fn >=3D PSCI_FNUM_MIN_VALUE && fn <=3D PSCI_FNUM_MAX_VALUE;
> +}
> +
> /* PSCI 0.2 interface and other Standard Secure Calls */
> static bool handle_sssc(struct cpu_user_regs *regs)
> {
>     uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
>=20
> -    if ( do_vpsci_0_2_call(regs, fid) )
> -        return true;
> +    if ( is_psci_fid(fid) )
> +        return do_vpsci_0_2_call(regs, fid);
> +
> +    if ( is_ffa_fid(fid) )
> +        return tee_handle_call(regs);
>=20
>     switch ( fid )
>     {
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
> index 38311f559581..c6449893e493 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -296,6 +296,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>=20
> #define XEN_DOMCTL_CONFIG_TEE_NONE      0
> #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
> +#define XEN_DOMCTL_CONFIG_TEE_FFA       2
>=20
> struct xen_arch_domainconfig {
>     /* IN/OUT */
> --=20
> 2.34.1
>=20


