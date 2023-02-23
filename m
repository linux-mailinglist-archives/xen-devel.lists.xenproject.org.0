Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB02A6A0C20
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 15:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500482.771891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCsB-0004Fk-Eb; Thu, 23 Feb 2023 14:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500482.771891; Thu, 23 Feb 2023 14:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVCsB-0004Cz-Am; Thu, 23 Feb 2023 14:47:03 +0000
Received: by outflank-mailman (input) for mailman id 500482;
 Thu, 23 Feb 2023 14:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pVCs9-0004Cl-Ty
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 14:47:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edfeed62-b388-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 15:47:01 +0100 (CET)
Received: from AS9PR04CA0167.eurprd04.prod.outlook.com (2603:10a6:20b:530::9)
 by DB9PR08MB6331.eurprd08.prod.outlook.com (2603:10a6:10:251::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 14:46:58 +0000
Received: from AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::d2) by AS9PR04CA0167.outlook.office365.com
 (2603:10a6:20b:530::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21 via Frontend
 Transport; Thu, 23 Feb 2023 14:46:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT055.mail.protection.outlook.com (100.127.141.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.21 via Frontend Transport; Thu, 23 Feb 2023 14:46:58 +0000
Received: ("Tessian outbound 333ca28169fa:v132");
 Thu, 23 Feb 2023 14:46:58 +0000
Received: from c3e2f96cc36d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 67A5C4CB-A04B-43FB-9A27-6A6034443108.1; 
 Thu, 23 Feb 2023 14:46:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c3e2f96cc36d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Feb 2023 14:46:47 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU2PR08MB9989.eurprd08.prod.outlook.com (2603:10a6:10:497::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 14:46:44 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::fca8:db36:98b:b1c4%7]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 14:46:44 +0000
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
X-Inumbo-ID: edfeed62-b388-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLDS9Yr01BGKz4NI+rJfd5hVjej241SEWjSghTqKBkg=;
 b=xWDOq7uRJxIP32bql1JpO6gafDbxu22fL6VFxQ7kV/UpjZCjVyhyBBFyTz6HTsUFivl9oIn0VGD8aYuVPJuOjEthiTW9JAeGgzJQXrtDKmwBtxz+z3kDDrr8GlJwBXo2aWPh3w0Q4IiO73WsbSzE46IJuc3cYSVuGPDa0jnBDWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bcd38d7c183e3dd1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kqwuYUb/m9ogdb+HbsDNxPSjCKOc6pV/Gl/jVNR79YOr1WbMzSgbziwF88DzNVOxkeDiYod9s0zxz6Ve3m2ZTDrwtSdNVbD2wSVAcBXDb1UXk5r5nyNotL0vihHVj6q9w4zvPKz8esqp0dls4Xbz7TGGiboUmx1pl3gq19CWFhTK/b07f4QMNUk62843IiPa01r13hv2pQd1M0oY7RiarUrJNE4AmHB7Fp7oSmUeuzrqPpd3z9Am34PpCzfIcVmdZE1STbPIGaHVygTMPWDegDxgwSDoX5PK4o5Ll5VskErkyQU7gM1smwFsB32ojzMvT9gc/F1tEf6epRj+2ttepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLDS9Yr01BGKz4NI+rJfd5hVjej241SEWjSghTqKBkg=;
 b=oXURaZ863e7M2hGMac9jyIEyCFOfjkdkkf/LaCqzccMmDnxLqTOI+3ok4AMnKuBHrL2MXZqYNOE77PMcdQJkdcgbNzfulvpI6ULhDhPFf1nR8lJKusYpr5/s1uXf6AHzA90W6PoLHtPlMBgOx9Hoo6ENicTZR/AP9EhAMKBcO0Ygf4jEZ/sAWWTmTBKTtZi8zVKGIUcIU0Q0WXQ6BisPu+kX36pv1D38i3bqG+8n3umOYGtHKRbXldKAqOeiLbuikhjchFIq+OW6RMpFI7imi6HFKSZO0S/8J6Ta8+n88EDFvNjMwY9UGCfOnbuyrEOSrZOMJZBVzZsvLGOUtyU/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLDS9Yr01BGKz4NI+rJfd5hVjej241SEWjSghTqKBkg=;
 b=xWDOq7uRJxIP32bql1JpO6gafDbxu22fL6VFxQ7kV/UpjZCjVyhyBBFyTz6HTsUFivl9oIn0VGD8aYuVPJuOjEthiTW9JAeGgzJQXrtDKmwBtxz+z3kDDrr8GlJwBXo2aWPh3w0Q4IiO73WsbSzE46IJuc3cYSVuGPDa0jnBDWs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v7 02/20] xen/arm: tee: add a primitive FF-A mediator
Thread-Topic: [XEN PATCH v7 02/20] xen/arm: tee: add a primitive FF-A mediator
Thread-Index: AQHZRtMbXoutoRFtTECV4qaVh/SbSq7cnZiA
Date: Thu, 23 Feb 2023 14:46:44 +0000
Message-ID: <FE444C86-FD27-4FAB-A24A-C6B16887787B@arm.com>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <5f0a74b3e4f6cda56e780a739859537246d4892f.1677079672.git.jens.wiklander@linaro.org>
In-Reply-To:
 <5f0a74b3e4f6cda56e780a739859537246d4892f.1677079672.git.jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU2PR08MB9989:EE_|AM7EUR03FT055:EE_|DB9PR08MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d72aa05-c058-46ea-1a23-08db15acd0d7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1f+VvdDhvZPGzpz2Q/8d1qNm6y8oPI6yO3UujGJZX4S6itVEdQgAAtvRAmBJUkQjYuBViujwumZ4jKpmQrUHghuybfu+tdNKkl5RA0+WtJcwcWZEQnhFDhRbMlN1J4FjxpqdF3sC0vaaXyvYP1XJ/dtthvrkorUx1chv99bErCVk66j0E1Gn6xdULzul7IjAlzVVgQvb+XHS6DTmqZ41uz9P2Ek8Z4Z28d7XSIS9V4KDypT2pjgtJnHojGiI2EScW6nPf7OJ51xWw/xr3Ro3Ijqu9nV4sNElsXi/uXQeB01imK47w0zZCdmAfCVt4NXAJkTPZ8bpqRGdOE2eZbk/o8cx4PhJ18GZ+jR1BCWDkAH0KIuKhO36ySssrtqAmwyPt4/SU23jtUz9PD/+V2PrmtMrND6GTsDS5WPz4ZBrKgBdqQmY+mIdXKGKtCPiJPWc2GPZFwF1ccRY6MhLGjWal2FCvRbksMpgOQngGYame6pK28kQGM+G2ep/m8C0+WWyneVQMtcOXtKqLT6irn1wcdTujKo2JELbU+LU/fgJvNTG44moayxeMcTlTRr0g+1uoVoFPS+8cb1NfKpsodF6hs+Zjv8CcNWIbP18swEI+dNAhbxzqhsKCu3+jTOs6QeUlt4M0ZVHZ+aiPoPu2pm3fhaZ08wd/xl2l/XimupvGSOLqoqCBsl9gFEJge/ySe3VtwiTgSnGGYAHa3GL1eYa0FWIBuCVRTui81m0iI/qGSB+X/fVVAOmNslfVUP54xp1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199018)(316002)(83380400001)(54906003)(64756008)(478600001)(38100700002)(122000001)(36756003)(2906002)(86362001)(30864003)(91956017)(66556008)(33656002)(66946007)(76116006)(66476007)(6916009)(38070700005)(4326008)(8676002)(66446008)(8936002)(41300700001)(5660300002)(2616005)(966005)(6486002)(186003)(26005)(71200400001)(6506007)(53546011)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5F8EB31A853D0A49B97876DEEF239482@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB9989
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5bff9511-6669-443a-db19-08db15acc889
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rpxqxhu0h5xDd18Fk+8g/ktGPlcT66mc6A5j7hzvX6EWrCyTeDbUWpxC7zjln3yG1IFodJe/HteLnXpZyz+PvGnIvWRHL46fI7sMxtfGSLoUSMXZyLKcmsnW9gLBQtajSsJaMIGUqAFAtTIt9e1p5veKMaFzYPnVU+1Izw+PFYReYxl/TZoPsvZi3nYNsxO9iWv8IzJKCbZ2UfGoQ2ToLj6ENN+//2yz1wYNJDHZhtV5gf4KJCYSLQfUiVpQAZ9iMGYILScoqff3/lEDcHeKglE9YQ51e/3mWtEHn/5vyAeEkcGfZq1DiXzoiXEv0m1tez0gI6DxhyRq6jqdOzkbZYIf/rtb3J1svVmHv6GPHV1HYssd2YgWspo5qhVHe/9yjz8Gtc8d4B5DsdZYCwRPeeQJuHSqpvbn5DGdZVpoiOnvbRSKWugmaMGTir8eG2eNQdrBpuIR+4afr/YsreO2WJfDvcexfV+ch26e0mov0BH3EqZjCknWEhYFZTVWkiwKmV2zd1fOel8FA4uO3nXyl2bobvQ6JrmGIzPIExcuDXHAlU03i0C13JMtFc1Yyg+JCOePKsYFoEV9rxMVqe7SN75EyAjkULn8yVnBZ+ktK3ie2p1Gmszue96VCvE4LhHkbD6BYPrcbvC68i78L06adonME8CfGdzFKAQIGmjyngk1H2B+iRNGzg5PSsHs55zxQHnJ1crKo2WccwrPTR2YrRaHFmA1rdNHyK/VRyqgshQ=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199018)(40470700004)(46966006)(36840700001)(36756003)(33656002)(86362001)(41300700001)(6862004)(8936002)(30864003)(5660300002)(2906002)(82740400003)(36860700001)(356005)(83380400001)(81166007)(316002)(8676002)(4326008)(6486002)(70206006)(966005)(70586007)(478600001)(6512007)(186003)(26005)(40460700003)(82310400005)(40480700001)(2616005)(54906003)(336012)(107886003)(47076005)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 14:46:58.4592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d72aa05-c058-46ea-1a23-08db15acd0d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6331

Hi Jens,

> On 22 Feb 2023, at 16:32, Jens Wiklander <jens.wiklander@linaro.org> wrot=
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

Just some minor comments from my side after.

> ---
> xen/arch/arm/include/asm/domain.h  |   2 +-
> xen/arch/arm/include/asm/psci.h    |   4 +
> xen/arch/arm/include/asm/tee/ffa.h |  35 +++++
> xen/arch/arm/tee/Kconfig           |  11 ++
> xen/arch/arm/tee/Makefile          |   1 +
> xen/arch/arm/tee/ffa.c             | 217 +++++++++++++++++++++++++++++
> xen/arch/arm/vsmc.c                |  17 ++-
> xen/include/public/arch-arm.h      |   1 +
> 8 files changed, 284 insertions(+), 4 deletions(-)
> create mode 100644 xen/arch/arm/include/asm/tee/ffa.h
> create mode 100644 xen/arch/arm/tee/ffa.c
>=20
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index 0e310601e846..754daa8efa04 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -110,7 +110,7 @@ struct arch_domain
>     struct vpl011 vpl011;
> #endif
>=20
> -#ifdef CONFIG_TEE
> +#if defined(CONFIG_TEE) || defined(CONFIG_FFA)
>     void *tee;
> #endif
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
> index 000000000000..94960100718e
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/tee/ffa.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: MIT */

Why is this file in MIT license ?

Any chance to set it as BSD-2 or maybe no license at all (most private head=
ers do not have one) ?

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
> +#define FFA_NR_FUNCS    (9 + (IS_ENABLED(CONFIG_ARM_64) ? 3 : 0) )

I am not quite sure of the usage of IS_ENABLED for a constant

Maybe just doing:
#ifdef CONFIG_FFA
#ifdef CONFIG_ARM_64
#define FFA_NR_FUNCS   12
#else
#define FFA_NR_FUNCS    9
#endif
#else
#define FFA_NR_FUNCS    0
#endif

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
> index 000000000000..824153c9303a
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -0,0 +1,217 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

I think now you have to say either GPL-2.0-only or GPL-2.0-or-later

> +/*
> + * xen/arch/arm/tee/ffa.c
> + *
> + * Arm Firmware Framework for ARMv8-A (FF-A) mediator
> + *
> + * Copyright (C) 2023  Linaro Limited
> + */
> +
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +#include <xen/sizes.h>
> +#include <xen/bitops.h>

Please try to put the headers in alphabetical order.

> +
> +#include <asm/smccc.h>
> +#include <asm/event.h>
> +#include <asm/tee/tee.h>
> +#include <asm/tee/ffa.h>
> +#include <asm/regs.h>

Same here

The rest looks ok to me.

Cheers
Bertrand

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
> +#define FFA_MIN_VERSION         MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
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
> +    uint32_t guest_vers;
> +};
> +
> +/* Negotiated FF-A version to use with the SPMC */
> +static uint32_t ffa_version __ro_after_init;
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
> +static int ffa_relinquish_resources(struct domain *d)
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
> +    if ( vers < FFA_MIN_VERSION || vers > FFA_MY_VERSION )
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
> index 1528ced5097a..92aff923056a 100644
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


