Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1149757CD9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565219.883188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkRd-00029h-JS; Tue, 18 Jul 2023 13:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565219.883188; Tue, 18 Jul 2023 13:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkRd-00026s-GZ; Tue, 18 Jul 2023 13:08:49 +0000
Received: by outflank-mailman (input) for mailman id 565219;
 Tue, 18 Jul 2023 13:08:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=88xE=DE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qLkRb-00026m-Tw
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:08:48 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe13::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ad34a3d-256c-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 15:08:47 +0200 (CEST)
Received: from AS9PR05CA0303.eurprd05.prod.outlook.com (2603:10a6:20b:491::6)
 by DU0PR08MB9773.eurprd08.prod.outlook.com (2603:10a6:10:446::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 13:08:35 +0000
Received: from AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:491:cafe::fb) by AS9PR05CA0303.outlook.office365.com
 (2603:10a6:20b:491::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Tue, 18 Jul 2023 13:08:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT028.mail.protection.outlook.com (100.127.140.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33 via Frontend Transport; Tue, 18 Jul 2023 13:08:34 +0000
Received: ("Tessian outbound f9124736ff4f:v145");
 Tue, 18 Jul 2023 13:08:33 +0000
Received: from 41f53deebaa3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7C1F6C0C-3DE6-4851-8EBC-993BFC5A6849.1; 
 Tue, 18 Jul 2023 13:08:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 41f53deebaa3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Jul 2023 13:08:26 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by DB9PR08MB8625.eurprd08.prod.outlook.com (2603:10a6:10:3d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 13:08:25 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::5a82:e906:eecd:7854%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 13:08:25 +0000
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
X-Inumbo-ID: 3ad34a3d-256c-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIQN5VR6al95yX44zbALQFxPbHH+rmQdO5Pf8w3Ege8=;
 b=8NDvryeXMZtNxZvrZCMb0V/Lsmwmved5Dw3K1vOHtMaebX9IwOzZGcE/jb5mQBo6MX+almr18zJD7bnvPcFWCiHd0rvcQgutfUPL9Q09tLOf139TwJ85xYX2SQsz0SPu8eRK4LR4ledVd7Zdnqje2yYLjXYNwKpCY33RX7XxM0A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5a1c1a2d8c05debe
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrD3zYfoXczWvuvXwUTbnsfuOfbM8il7ZDvIUizUftlN9RmJNbeLwT4ZnbspiHJWv8lW9wZszcxEKmkqUj8K5LQc+chhtqpk0RbjUGRYvjByOgvUKKRzTlywiNUlxSNLdR/jHGRZ/4H56EQ5zR35LuTKr+Ik3eAf9i/IAdEz/5e/ZyuZiw2n6DK+Vwh/RWgJDOnklvqsLHNm7o5QjCh/Rb/vY+l+2zQcevbmkg0nOf9gExZ+iC6FbxNEM5Fab+v3rZrrLvCz0zouBHBhzr4R9PJQ72YPIF1RBjTOIApadgB/HBXdOsEBUJVdSWmgxLcl1A/82Z0e+p2sViCrmr52xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIQN5VR6al95yX44zbALQFxPbHH+rmQdO5Pf8w3Ege8=;
 b=DuEu5nGSwev1nIGLXoqujFGWzovncWaZtKV3JFpzLWmZMDiiYCXNgQwtA1CASyOXJ+JcmrvxYvXYUZKTEJolUZiSxOdLbLyexrSZxxkU0rTHSaCDjB9XqQRymDa934A/C3/Qs+UsXYfZg6YWFogYYgnCXmkCXVnVp3oI8t6h2VbNUfDf8iAGkL0rjiG1M3tNAGRb1CwGLZU782VzkyjWmiYC3JiKwz/uOKszux48TLWb+X+jxZG1d7F9lCnhcBXONY0dj2qoSWFl1Y3ZLHBa2RGN+0oul6w8hunO28HUY49nLw3BXIEN2+44hC8w3dXi+ssZOSapcAkPglyQYZhGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIQN5VR6al95yX44zbALQFxPbHH+rmQdO5Pf8w3Ege8=;
 b=8NDvryeXMZtNxZvrZCMb0V/Lsmwmved5Dw3K1vOHtMaebX9IwOzZGcE/jb5mQBo6MX+almr18zJD7bnvPcFWCiHd0rvcQgutfUPL9Q09tLOf139TwJ85xYX2SQsz0SPu8eRK4LR4ledVd7Zdnqje2yYLjXYNwKpCY33RX7XxM0A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici
	<Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, Henry Wang
	<Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v10 16/24] xen/arm: ffa: add defines for sharing
 memory
Thread-Topic: [XEN PATCH v10 16/24] xen/arm: ffa: add defines for sharing
 memory
Thread-Index: AQHZuH9Y/E5eTczWgkKkQ5tsd+GUtq+/gNMA
Date: Tue, 18 Jul 2023 13:08:25 +0000
Message-ID: <828CC971-7A80-4B11-9C33-508CD4354614@arm.com>
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-17-jens.wiklander@linaro.org>
In-Reply-To: <20230717072107.753304-17-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3778:EE_|DB9PR08MB8625:EE_|AM7EUR03FT028:EE_|DU0PR08MB9773:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e22f80-20cb-4234-64b1-08db87901778
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +BsEEWMS9uGnP9iImWYlW68zKDrawvsLasWvpvEUc9dcQmS5mkolLaD6ipH+h21zSsPgROTGftrWEtC64vIvwxJqZP1PoBvM4JBchjJezuNJGi6jHmTTFYTATMwZf23cPpi05G0D1i6vbiiAquGk7mdTC3CQP5YEZYBMzyeFMQ6zd79hBbte/WQRBNgH0Rj5D+IF0TRky6GZB6Sq3AFTgjWdEqVGH8/7eZWTyqinkzsEWp7Kf2+Mg4vdQhz/Ot227w3f46nbZUYc8S/qQ5eXArBeuj37v6rByZjYxl3BVLXrKmfCF3fMRMfQ+WB0R8F6tUWboskHEwdlQCUVNcMBQu0OtSCNGalIYMANGj9Pjxzt4GZNrWjJW9lra7BUBSB8mJZMQQijuRffqSF0WoLl5lZvmxPrJR3JWN0o2lcgAG/0e7gJZIFMGiI7twXkrM2uTRQbf9j8vwBBl3nw5hG6s+91u3YE0vNHIy6keFT6OrhGfzayXUA76Zo3UkSGWRbZQ3Srfg+Y2/hfL+v0eSm/pwUKhUkGMHZCacVEufidTDY52Hx7J/zrP90Ymc0YmEMJxIkmI6A6zH4wqN5OYRn9PkAJLL255Kl6Pa+1U/zNVNoA35FTETMrasvduz/W2Kz5Hcp0FGLA3/7ExDZRj3pZjXnZiq61JbeyFF7zSMR8ohA0gYk4VnsQ8DP4fXwVzsZb
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199021)(66556008)(54906003)(478600001)(71200400001)(6486002)(91956017)(966005)(6506007)(186003)(36756003)(2616005)(316002)(6512007)(76116006)(53546011)(2906002)(4326008)(66946007)(66476007)(41300700001)(66446008)(5660300002)(8676002)(8936002)(122000001)(64756008)(6916009)(38100700002)(86362001)(38070700005)(83380400001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3282EC87ADDA54409A59BACADDC61801@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8625
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	afed989c-7937-4cf8-8e0a-08db8790122f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eqqiRHEWMJxUen9yGmQ2ub/HqS2S7OYlHDktlEnqZ0LPeVIYqgX+9bfNghzo/x+IkJS4QqxGky8eSI7zSscYtS9oYH1D+7GgrcilZ047cuYvEYrlZvjryB6kRafDC4fkFut7vxohNG33pAx+dE5S5F/3OO4Y/cqrhJY3MQNrV0x6UczjBciQHdTwu9eJ9JQzyX2cy6u8YBAhBSFFPRbgziLrFYfoXAzj/tIsLMGvxIBdZg9+bpKUozOAU3iPfk6X7TuH+bYaxdJ3v6mNkQpfxJ3lxAC7BL9pFpKqgn/9YsEFyJ2D9zFGnpBdp+yX+BiYd0mBWKhhjfgrlgCZzoR81SA34916RzU9I0K1m1ojEI3R0QjGP4O0tFdVZ1VNJYzpiIu3UZFGUsGWp6Cy5XemABQH01MwTz8FtsjkxRTbYdY/85sNxIM+CzNjSjKdlB/SCw/t9sCkuj9djEXXSvdzOL5TDQTf+KLzLMDfGJHUriw4opaBFJAauS3ZYWud6iJXyN0ULPVFXUkVpfjwTcIq7VZjYonmZ+B7FrfhxUSQvwEVaayEBx+4HhBixuBi+ozVUvL/9NCCUTN0NAeBKFCFHRTx7gkjFOubPZQb3tYFF15/Mc3OApKTuAz6AuMVt2cgu9sgsFjTJMVQcwwTnBvmV7QEj+cp+w3k88mCEpiBymrVrOrK2r4FCeT2/37Ly3tV15vBPFWS0RK116vIxpF5ycUMldDDRVjsg8QCcv5B47w/VjIRVFj3n4ixsbuoxbVSCAv4BXGdZMJqPJfYSlHxBA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(33656002)(40480700001)(6506007)(82740400003)(83380400001)(40460700003)(186003)(26005)(336012)(478600001)(53546011)(6486002)(54906003)(8676002)(41300700001)(6862004)(2906002)(8936002)(70206006)(70586007)(966005)(316002)(36860700001)(4326008)(5660300002)(36756003)(6512007)(2616005)(47076005)(81166007)(86362001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 13:08:34.1238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e22f80-20cb-4234-64b1-08db87901778
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9773

Hi Jens,

> On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> According to DEN0077A version 1.1 REL0
> - Section 10.9.2 Memory region handle, page 167
> - Table 10.18 at page 175
> - Table 10.15 at page 168
> - Section 10.11.4 Flags usage, page 184-187
> add defines needed for sharing using the function FFA_MEM_SHARE and
> friends.
>=20
> Also add limits for how many shared buffers that a guest can have at
> once and how large a shared buffer can be at most.
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/tee/ffa.c | 58 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 58 insertions(+)
>=20
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index d5748b9ce88c..e895e355e620 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -5,6 +5,14 @@
>  * Arm Firmware Framework for ARMv8-A (FF-A) mediator
>  *
>  * Copyright (C) 2023  Linaro Limited
> + *
> + * References:
> + * FF-A-1.0-REL: FF-A specification version 1.0 available at
> + *               https://developer.arm.com/documentation/den0077/a
> + * FF-A-1.1-REL0: FF-A specification version 1.1 available at
> + *                https://developer.arm.com/documentation/den0077/e
> + * TEEC-1.0C: TEE Client API Specification version 1.0c available at
> + *            https://globalplatform.org/specs-library/tee-client-api-sp=
ecification/
>  */
>=20
> #include <xen/bitops.h>
> @@ -80,6 +88,56 @@
>  */
> #define FFA_MAX_RXTX_PAGE_COUNT         1
>=20
> +/*
> + * Limit for shared buffer size. Please note that this define limits
> + * number of pages.
> + *
> + * FF-A doesn't have any direct requirements on GlobalPlatform or vice
> + * versa, but an implementation can very well use FF-A in order to provi=
de
> + * a GlobalPlatform interface on top.
> + *
> + * Global Platform specification for TEE requires that any TEE
> + * implementation should allow to share buffers with size of at least
> + * 512KB, defined in TEEC-1.0C page 24, Table 4-1,
> + * TEEC_CONFIG_SHAREDMEM_MAX_SIZE.
> + * Due to overhead which can be hard to predict exactly, double this num=
ber
> + * to give a safe margin.
> + */
> +#define FFA_MAX_SHM_PAGE_COUNT          (2 * SZ_512K / FFA_PAGE_SIZE)
> +
> +/*
> + * Limits the number of shared buffers that guest can have at once. This
> + * is to prevent case, when guests trick XEN into exhausting its own
> + * memory by allocating many small buffers. This value has been chosen
> + * arbitrarily.
> + */
> +#define FFA_MAX_SHM_COUNT               32
> +
> +/* FF-A-1.1-REL0 section 10.9.2 Memory region handle, page 167 */
> +#define FFA_HANDLE_HYP_FLAG             BIT(63, ULL)
> +#define FFA_HANDLE_INVALID              0xffffffffffffffffULL
> +
> +/*
> + * Memory attributes: Normal memory, Write-Back cacheable, Inner shareab=
le
> + * Defined in FF-A-1.1-REL0 Table 10.18 at page 175.
> + */
> +#define FFA_NORMAL_MEM_REG_ATTR         0x2fU
> +/*
> + * Memory access permissions: Read-write
> + * Defined in FF-A-1.1-REL0 Table 10.15 at page 168.
> + */
> +#define FFA_MEM_ACC_RW                  0x2U
> +
> +/* FF-A-1.1-REL0 section 10.11.4 Flags usage, page 184-187 */
> +/* Clear memory before mapping in receiver */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR            BIT(0, U)
> +/* Relayer may time slice this operation */
> +#define FFA_MEMORY_REGION_FLAG_TIME_SLICE       BIT(1, U)
> +/* Clear memory after receiver relinquishes it */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH BIT(2, U)
> +/* Share memory transaction */
> +#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (1U << 3)
> +
> /*
>  * Flags and field values used for the MSG_SEND_DIRECT_REQ/RESP:
>  * BIT(31): Framework or partition message
> --=20
> 2.34.1
>=20


