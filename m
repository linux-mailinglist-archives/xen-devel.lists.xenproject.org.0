Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3E16E6515
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 14:56:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522839.812465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poks7-0004GR-N7; Tue, 18 Apr 2023 12:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522839.812465; Tue, 18 Apr 2023 12:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poks7-0004Ej-K5; Tue, 18 Apr 2023 12:55:47 +0000
Received: by outflank-mailman (input) for mailman id 522839;
 Tue, 18 Apr 2023 12:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BdQL=AJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1poks6-0004Ed-Cz
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 12:55:46 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 555e5f0c-dde8-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 14:55:45 +0200 (CEST)
Received: from DUZPR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::17) by AS1PR08MB7475.eurprd08.prod.outlook.com
 (2603:10a6:20b:4dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:55:42 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3c3:cafe::b2) by DUZPR01CA0008.outlook.office365.com
 (2603:10a6:10:3c3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 12:55:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 12:55:41 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Tue, 18 Apr 2023 12:55:41 +0000
Received: from 523b1c7270fb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D28E417-4703-4A49-AC2C-C6CA1B1C168D.1; 
 Tue, 18 Apr 2023 12:55:35 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 523b1c7270fb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 Apr 2023 12:55:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:55:28 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 12:55:28 +0000
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
X-Inumbo-ID: 555e5f0c-dde8-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtQr+Y5ziVpwrOZc/shJYPPr8VuAC0TAvdtDs9X7vZY=;
 b=MhCLcSZUemYhPHzP2AGoZEAiYwqC1rHCUNwXqeDRum1NIMUEhkm9Dr0W+6aBEXx2e6nvGjNV4roP4WyTpiMC/gf4TTEAGWZKHLkHDDonQWNjbOvq1x4z5YnuSgBo6QWBVXsyIXNQGxlDNmp+jYKiQMHTFkpZIPMGeJrP0AMnJ+w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4158d203a396abc0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZttQ7XtY3+bEUlfYlYE/rtxq3mGzulWkdH8VvRLuu+EjHfdM9+X4mVNyrvY5rjgGMlGLI8YJny80w6D8/udz4m0d25aGf4ywjFm3l9tfCa7RukIjV+hktNKQz214Nj4Xl0ZdUP5FEJUL3MtK1f9mBXUdUYqqkZH6YebTtOFO4gAihSF5jq0TNpRnbWdnF1S6ftfewiIA46v9xyJluRX7VSbQ21HhuCkDIMn1iY6YsxB2xCKgI92JGIOYQLDLuvYWcVRpdg5SqQgNfVNItmnOYFO+Rpogq/3DBu4C12WuESNPTM/hUjBx2tUBfmjSUSp+iosg80aClg3qlsChi8d68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtQr+Y5ziVpwrOZc/shJYPPr8VuAC0TAvdtDs9X7vZY=;
 b=kGaHykQc+CuEhobnwnDrYdzzsVuTEoywjqVYALvNC2JNlpkwBG7P03AIzd0kk6x9MXzqlJmvpW+RWYTJgCnLsTJX8f0f6S0OCYvOFOvL+yjmmfz02eXuJF5rRWhWbEFYVLQVPf4wmkcORpPmHUzKIThbjLlXia18bdXbCbq7wok5zcPKu0tDC5o72qhS4a+CWOg+Ir08zr1AhvhJyhhmD9Panlh819S4nNCOXmKDHLEYgHHDd/GJn3D+qXxI2gA6X4CiRNGN/1+okIcIZfl1+CzpDC7ah6XGJ7rkyhvslGj7kz9XZaEuBy0K1MJwDf1O6mEPcjiQpGQWGzjw/VPWRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtQr+Y5ziVpwrOZc/shJYPPr8VuAC0TAvdtDs9X7vZY=;
 b=MhCLcSZUemYhPHzP2AGoZEAiYwqC1rHCUNwXqeDRum1NIMUEhkm9Dr0W+6aBEXx2e6nvGjNV4roP4WyTpiMC/gf4TTEAGWZKHLkHDDonQWNjbOvq1x4z5YnuSgBo6QWBVXsyIXNQGxlDNmp+jYKiQMHTFkpZIPMGeJrP0AMnJ+w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 11/12] xen/arm: add sve property for dom0less domUs
Thread-Topic: [PATCH v5 11/12] xen/arm: add sve property for dom0less domUs
Thread-Index: AQHZbSQwrRQ9/UblkkiINOEljpHZc68xD8SA
Date: Tue, 18 Apr 2023 12:55:28 +0000
Message-ID: <5DF67AEC-54FC-4742-8377-995AFB390EFD@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-12-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-12-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB8203:EE_|DBAEUR03FT038:EE_|AS1PR08MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: e31d44c3-376e-42a2-c29a-08db400c373e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Z70khT5G/fvTLv7IrhlQNnjEKC/oVPtp+gsXlG/72oNcU3v6PuaByc+XmQs61JMhtZFSmBt8A3fF2ijesqpbaXcF2aZGc/eGzSinOhhhdGaJq62tYOZG/JxXSEhupBZVpYEX+oCjzo8C03XWjL3qTPTBZTgo09W75uT/7Ew8aRXB3W16Lbk3uRWy1BEzn2xlSTHPNvhKTlszLi9s29eboAGjJ9Pk8GYuPeKUzz679J3XOXbLlzTgoDE3BJuFl+Ha28CQVJcEZtHLfvx/E2HKVVyeKx08CVG3Tvtiqxorj0tVDwtQCa/9gWcb2mUv0Uzo4hkGD13V63jMx0WplGCJ1ABKeZtFWKcfmi0J2JSX+3FXJWLOhMkr/5sYBUdyHfVFz3iiSU+XFsdvu+Mufp8Vq6aMYjChKQNTiGVwKUhPUd8hTRwMEIzMKykGSxyaVW4tTvodnyZ0XGTTD1zUrCNFiO893rMF+bO8PGOQn304T4CW1jpthG633xrfUr0lL9IJn66daDwOwEE8z0rz+CitC2aBHVw8X6KmVcewKnOeM0mMxuHkwS+LkvbQYjcNAMTtc+0nu/JvTlm7XRwzsASiLSUBUfyQOUyERA4dERxIiu2sK3fVHdr4k09uBc6atRhmzsXyhhFF+D5MO5DZhoFY+nSYv8vPyI6SMA9iWHMotCA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(451199021)(37006003)(478600001)(71200400001)(38100700002)(8936002)(6862004)(8676002)(316002)(41300700001)(91956017)(4326008)(6636002)(76116006)(66446008)(66556008)(66946007)(54906003)(122000001)(66476007)(186003)(2906002)(53546011)(38070700005)(6512007)(64756008)(6506007)(86362001)(83380400001)(36756003)(33656002)(2616005)(5660300002)(6486002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9425F9668954674AA42CD34FC095D1A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8203
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	de68a510-65a2-40bd-7180-08db400c2f4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7+tuVC6Eh/3UXApNM1/3Sik6Jfu76v9NIsgbrlB9aOf7NbzLHY5Kxc1v65JQK6FUUY9Z1wXV9B/Dy2s0jGhZZqJ3emfX8z9E6JoY8q+PjG1mTLvPODUkfxuDuAMU/m9SeKMHJ5tI5ALewHkUo4VNMfbFSpE/PlYgBIndu/edV283Qaj6toKI4Hb5dunCvOD/wbeKKpZ3dTVNaqgw6G8dxq90n7udIRVuviwscEFxl9eMEuTjkbQ9Ms04bWmhgBlLYEWYw1QfXkH5YQFJCw6LedVT6YSFA35CO39vercD91U8s1QtkTzORkaxNXrcuscUeETHZnE2pofRXLXO1tEnm7QmCqKoTMK5b9OrVCeeEfiVBvHpU671Wa/Zu3U/NHmn0j02xNxLWVa+FaaSt2oc2tikI9/ri5J2yQGXjRxOTwo9wvW10ZcDXt1hP7npc5Tlg1gLBnn/3OvV0j9x0TZZWiudan++baEj24haIfHH46Du5dmQDyqpReTmq+NihQIoawBcLXk9KF/FG1F+TQ2sVh/QS1Air/F3k3yh65faGqoA9zIsVJLOH5Ig2lJZllQvhzE4fsS2k/QzKIAeib4HQkn/vvNGTt/v379PuKElOieLpqvbpHMXixVP1HlpET2JDj4wVkoCZ/8oRsIDC6/6yoRpKgVFVeSdsDR3iZgGwLdJYH0Ng37NpUDamXZS9jx42ITtwUxqt56+2Y5KKWwOaUq6tdFcslwYp/45z3FCDjo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(6486002)(478600001)(86362001)(36860700001)(36756003)(47076005)(2616005)(336012)(33656002)(83380400001)(40480700001)(107886003)(186003)(6506007)(6512007)(26005)(53546011)(40460700003)(82740400003)(82310400005)(81166007)(356005)(316002)(4326008)(70206006)(70586007)(2906002)(8676002)(8936002)(5660300002)(6862004)(41300700001)(37006003)(54906003)(6636002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 12:55:41.3546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e31d44c3-376e-42a2-c29a-08db400c373e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7475

Hi Luca,

> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Add a device tree property in the dom0less domU configuration
> to enable the guest to use SVE.
>=20
> Update documentation.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from v4:
> - Now it is possible to specify the property "sve" for dom0less
>   device tree node without any value, that means the platform
>   supported VL will be used.
> Changes from v3:
> - Now domainconfig_encode_vl is named sve_encode_vl
> Changes from v2:
> - xen_domctl_createdomain field name has changed into sve_vl
>   and its value is the VL/128, use domainconfig_encode_vl
>   to encode a plain VL in bits.
> Changes from v1:
> - No changes
> Changes from RFC:
> - Changed documentation
> ---
> docs/misc/arm/device-tree/booting.txt | 11 +++++++++++
> xen/arch/arm/domain_build.c           | 24 ++++++++++++++++++++++++
> 2 files changed, 35 insertions(+)
>=20
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index 3879340b5e0a..f9d2ecdda48a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -193,6 +193,17 @@ with the following properties:
>     Optional. Handle to a xen,cpupool device tree node that identifies th=
e
>     cpupool where the guest will be started at boot.
>=20
> +- sve
> +
> +    Optional. A number that, when above 0, enables SVE for this guest an=
d sets
> +    its maximum SVE vector length. The default value is 0, that means th=
is
> +    guest is not allowed to use SVE, the maximum value allowed is 2048, =
any
> +    other value must be multiple of 128.
> +    Please note that if the platform supports a lower value of bits, the=
n the
> +    domain creation will fail.
> +    Specifying this property with no value, means that the SVE vector le=
ngth
> +    will be set equal to the maximum vector length supported by the plat=
form.
> +
> - xen,enhanced
>=20
>     A string property. Possible property values are:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 3f30ef5c37b6..c1f0d1d78431 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -4004,6 +4004,30 @@ void __init create_domUs(void)
>             d_cfg.max_maptrack_frames =3D val;
>         }
>=20
> +        if ( dt_get_property(node, "sve", &val) )
> +        {
> +            unsigned int sve_vl_bits;
> +
> +            if ( !val )
> +            {
> +                /* Property found with no value, means max HW VL support=
ed */
> +                rc =3D sve_sanitize_vl_param(-1, &sve_vl_bits);
> +            }
> +            else
> +            {
> +                if ( dt_property_read_u32(node, "sve", &val) )
> +                    rc =3D sve_sanitize_vl_param(val, &sve_vl_bits);
> +                else
> +                    panic("Error reading 'sve' property");
> +            }
> +
> +            if ( !rc )
> +                d_cfg.arch.sve_vl =3D sve_encode_vl(sve_vl_bits);
> +            else
> +                printk(XENLOG_WARNING
> +                       "SVE vector length error, disable feature for Dom=
0less DomU\n");
> +        }
> +
>         /*
>          * The variable max_init_domid is initialized with zero, so here =
it's
>          * very important to use the pre-increment operator to call
> --=20
> 2.34.1
>=20


