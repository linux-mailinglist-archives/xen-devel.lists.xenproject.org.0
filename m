Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BDB2C8E7F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 20:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41405.74542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjpGs-00027f-0a; Mon, 30 Nov 2020 19:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41405.74542; Mon, 30 Nov 2020 19:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjpGr-00027G-TR; Mon, 30 Nov 2020 19:55:37 +0000
Received: by outflank-mailman (input) for mailman id 41405;
 Mon, 30 Nov 2020 19:55:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBJD=FE=epam.com=prvs=06035e4899=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kjpGp-00027B-DK
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 19:55:35 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc3606af-a6f0-478c-9ab4-ccce6c7e9208;
 Mon, 30 Nov 2020 19:55:33 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AUJjS2f028297; Mon, 30 Nov 2020 19:55:24 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 353fhjnpph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 19:55:24 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VE1PR03MB5678.eurprd03.prod.outlook.com (2603:10a6:803:121::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 19:55:20 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 19:55:20 +0000
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
X-Inumbo-ID: dc3606af-a6f0-478c-9ab4-ccce6c7e9208
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbioNdr/zeXnDGWy0q47LPQoo5fprccBc7XEw0rLlzGUhekIZKYmucQvd1+M9N33knumjDyNdVmelfLv63f8YgkW81DZZ/TlE6NbJ//1N3TNrsu+x4QT0DN7oxsF9or1t7FM2oM1CdF0MwJFaL2GrHo6b1ANU/TdmE8OqML0sY8X4iYdySWydfzJjqpyNx7h5gfNTVod4RMVQrJ+J8I0D7kAP7QN2h5CutBd7pwH8jE/zHbTR0CfxmV+XB8tm3JA26K/SB+HpGGRUbRYIWIuS/fyIwQ3UsYgQfI+BfOYEmZLZlRi+pEtpzzz3slCeT862pT7Js0ekR/Cpt9Vr2CNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5me/NsA3wrfxdGTi9WxEf9tRE4mwHDkNfJz2ZY0kIOg=;
 b=R4I1xUdEK3wEDeDXrAyd9MX9TyH6IYNyLvmJ2hH4uA5AMbPbQhDKguHhwKbZ4ThbMkpflN7GbjAiwlRtGfGDu0xKxaHGa3jUB6YMsXTvgfu+a8/+4oqg9K67mZsMDbOzHNRA+vfyzsMnV6oFsV0H4BPVzZIhsiJ3qeayAEi/lEhHBRZxNCNUiiDdTbMmnIksFKeDPJowoOziF1DwVIVe2OxxoLm4XIm50tWfu99qtdRDrXYhReBFiDOIwdtmUZwhvB/8+mEcuXOalBDtRIoygFc5g/ecoDFLR6DLydqz+2Fa3MY4yJDg0OrxpSh1j4A5HfMEbuQzStEYaC03IYfjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5me/NsA3wrfxdGTi9WxEf9tRE4mwHDkNfJz2ZY0kIOg=;
 b=DTmP83Krhet9u0/2vmvq4QLreBPRCp5QUxoDG5Kp+DpHKPiCgZ91ppzKAjy7zn7cjQ2AJokXSPQM9uaO104PkcU42uTAvlzjtEapUlvl2jiDiub2o1VRtTUUUZp07VykuiadHRzViMcrPpAcZf4omhrtXNRkJz2boL+ofa7lkGaoejhg9DweYrVUuKmHjsiETyodQGuSrSDc+gzEFrcpm9UUmklO1WAcCKnVFVyMsPmp0lYmkMWmSnup9DPdgYpbNABPuDxOjD1BOuJP9Tp1XU9ciLAX/cPgF68gX5fxjucWfQW9XanSOErODx4V9+XcKhBX7xrl5vcRqGDm/ei2hw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 1/7] xen/arm: Add ID registers and complete cpufinfo
Thread-Topic: [PATCH v2 1/7] xen/arm: Add ID registers and complete cpufinfo
Thread-Index: AQHWxyRRqZC8P3GPykKfLJ52tVNQw6nhFy2A
Date: Mon, 30 Nov 2020 19:55:20 +0000
Message-ID: <875z5m8vrs.fsf@epam.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <97efd89cccdffc2a7fd987ac8156f5eea191fd3f.1606742184.git.bertrand.marquis@arm.com>
In-Reply-To: 
 <97efd89cccdffc2a7fd987ac8156f5eea191fd3f.1606742184.git.bertrand.marquis@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [85.223.209.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7170e77-7264-4732-f53d-08d89569de4e
x-ms-traffictypediagnostic: VE1PR03MB5678:
x-microsoft-antispam-prvs: 
 <VE1PR03MB5678FD2BCEF582EFF6D84DB5E6F50@VE1PR03MB5678.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Z9T7M9Gsz5Ms+7l5eic8/u8nQSMelLKLLu0N33h6B09F0A8e4BeP/8wt6qQ3WSqCNNjXygT/KWWt0Ovtu28llU2TXyOxbOXkZgt6FR5lOuq3Ga75lIX/UjcGjGWOojg+vKUZoF05X5ShSft0Kx2miwJhW+6+Tklk7fVe4qX48yb8YZRwfTcRGbYJckHibLRJxO+qUcH+Q2xLIN2BSNdlTdsOiqpS7fKPxmWiM1cWgiXZNmUlbNcETBt1W16gmOYy0h58hexIIF62geNIJyTZOdD43Ax8bfVy3tkpryIcylVKMb75VECFcCwKrGXYmtmd+ujsGmeYNdqWXh7It//FKQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(396003)(376002)(346002)(36756003)(4326008)(186003)(91956017)(76116006)(54906003)(86362001)(2616005)(316002)(66556008)(5660300002)(66446008)(2906002)(66946007)(66476007)(55236004)(8676002)(6506007)(6486002)(6512007)(64756008)(8936002)(6916009)(71200400001)(26005)(83380400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?vLE5+IhcNadVQzSUI+siLpMYVvS4dxHBemngLb3GEfZ/CVbtx1HwrKp2L7?=
 =?iso-8859-1?Q?h2faHVFJ4oUf1BVZYSP6t7ns0y+P545eih5HTHWWu7Fez9XRBV2AAF/Hc9?=
 =?iso-8859-1?Q?svVhub0BcJWIb6QghNi+Z0UtV/QqunyBpyp/GSF456OAtudaShM7xWvv0S?=
 =?iso-8859-1?Q?CvFEPlS2N0368lknCDEmskpequqyVlEBDvf1hRifv11gkzneIzHWikAoqV?=
 =?iso-8859-1?Q?+g7kO5TkuAKGuK6ulvw1XEXlouP/qi3eZ2JWG3jqdRP4Sq6qJtctobXGNb?=
 =?iso-8859-1?Q?nQ+Wfs9kt3Zglml2jjKhxoeO7kYh6jPTEqBcUnxRX1jjpjtlrC7kd5oke/?=
 =?iso-8859-1?Q?Y6rArZ1h5CsWMLbgE+vGJ4MRPRy95eQCt8OZv+TEsxo5B0Tdc/QEzWDic0?=
 =?iso-8859-1?Q?oqEpV4Z218cxwqunP5VogVQd1+mAKdpLMceNDsK9mqG8rY1KBHhjM13S2J?=
 =?iso-8859-1?Q?MIwvOB/U+XPSZhKPakGO2eOPIRIV6OWuRdkl/G2Zp/NjNCEsi67X02oCMD?=
 =?iso-8859-1?Q?gZIobC5GOXTIVxJS8eDHwEYpYuJufbUrkjrLSrvzFFiLJBmZ7dzQRyRhTu?=
 =?iso-8859-1?Q?kn4Y8U6KhOHzjrQQptnfwu+fUnhuUYDSpHdJGio0S/0oQ0iJAerXVmYxlX?=
 =?iso-8859-1?Q?mF20ILR9BFHJtV5GQIFvQp8jaHH6DzRv4GYBMLSD/+Av7N3+HLuRPKgUpI?=
 =?iso-8859-1?Q?fqnP+BQnHiR0tIWz7ialvFU147hqIrT/Oj7/WQAlVIqCeALOZIPB7Y+c2q?=
 =?iso-8859-1?Q?v17NID4Ep1FCwMXgSA+e9gybmJPqS/iZNAwM/iW0fknq41E43pAuhAkfSz?=
 =?iso-8859-1?Q?LYnqWBpziZATQk68SwJ/7zpNBbblDluYJXUv+4GAL0rj4e6i11/wuLjK86?=
 =?iso-8859-1?Q?2zrjMYNZo64qcE4o4IJ0BGfmqt0xNpz93/BwRRGrdVB2mQkfPIk5K1NJJl?=
 =?iso-8859-1?Q?Iz+aUkFgElPcjovK6OEo7m3SnlsR7M/9BqYq00zdf7QJiMTaMEtnvHkH2F?=
 =?iso-8859-1?Q?HO47XLudGJCDRYe/+CdKFUtM6WUAHacQX7KPs8?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7170e77-7264-4732-f53d-08d89569de4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 19:55:20.5183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F453H56l5iq3mhr/oJJP3nx/tE/ANjt2zhyP4TDZjEpUvlHVM6PDlJdoEBOmBawQvM3ltMplQfkTyaoWnJWiQ8S7V+I6h8Bo5dLfBUh1+AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5678
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-30_08:2020-11-30,2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=679 phishscore=0 suspectscore=0 spamscore=0 clxscore=1011
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300128


Hello Bertrand,

Bertrand Marquis writes:

> Add definition and entries in cpuinfo for ID registers introduced in
> newer Arm Architecture reference manual:
> - ID_PFR2: processor feature register 2
> - ID_DFR1: debug feature register 1
> - ID_MMFR4 and ID_MMFR5: Memory model feature registers 4 and 5
> - ID_ISA6: ISA Feature register 6
> Add more bitfield definitions in PFR fields of cpuinfo.
> Add MVFR2 register definition for aarch32.
> Add mvfr values in cpuinfo.
> Add some registers definition for arm64 in sysregs as some are not
> always know by compilers.
> Initialize the new values added in cpuinfo in identify_cpu during init.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V2:
>   Fix dbg32 table size and add proper initialisation of the second entry
>   of the table by reading ID_DFR1 register.
> ---
>  xen/arch/arm/cpufeature.c           | 17 ++++++++
>  xen/include/asm-arm/arm64/sysregs.h | 25 ++++++++++++
>  xen/include/asm-arm/cpregs.h        | 11 +++++
>  xen/include/asm-arm/cpufeature.h    | 63 ++++++++++++++++++++++++-----
>  4 files changed, 107 insertions(+), 9 deletions(-)
>
> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
> index 44126dbf07..204be9b084 100644
> --- a/xen/arch/arm/cpufeature.c
> +++ b/xen/arch/arm/cpufeature.c
> @@ -114,15 +114,20 @@ void identify_cpu(struct cpuinfo_arm *c)
> =20
>          c->mm64.bits[0]  =3D READ_SYSREG64(ID_AA64MMFR0_EL1);
>          c->mm64.bits[1]  =3D READ_SYSREG64(ID_AA64MMFR1_EL1);
> +        c->mm64.bits[2]  =3D READ_SYSREG64(ID_AA64MMFR2_EL1);
> =20
>          c->isa64.bits[0] =3D READ_SYSREG64(ID_AA64ISAR0_EL1);
>          c->isa64.bits[1] =3D READ_SYSREG64(ID_AA64ISAR1_EL1);
> +
> +        c->zfr64.bits[0] =3D READ_SYSREG64(ID_AA64ZFR0_EL1);
>  #endif
> =20
>          c->pfr32.bits[0] =3D READ_SYSREG32(ID_PFR0_EL1);
>          c->pfr32.bits[1] =3D READ_SYSREG32(ID_PFR1_EL1);
> +        c->pfr32.bits[2] =3D READ_SYSREG32(ID_PFR2_EL1);
> =20
>          c->dbg32.bits[0] =3D READ_SYSREG32(ID_DFR0_EL1);
> +        c->dbg32.bits[1] =3D READ_SYSREG32(ID_DFR1_EL1);
> =20
>          c->aux32.bits[0] =3D READ_SYSREG32(ID_AFR0_EL1);
> =20
> @@ -130,6 +135,8 @@ void identify_cpu(struct cpuinfo_arm *c)
>          c->mm32.bits[1]  =3D READ_SYSREG32(ID_MMFR1_EL1);
>          c->mm32.bits[2]  =3D READ_SYSREG32(ID_MMFR2_EL1);
>          c->mm32.bits[3]  =3D READ_SYSREG32(ID_MMFR3_EL1);
> +        c->mm32.bits[4]  =3D READ_SYSREG32(ID_MMFR4_EL1);
> +        c->mm32.bits[5]  =3D READ_SYSREG32(ID_MMFR5_EL1);
> =20
>          c->isa32.bits[0] =3D READ_SYSREG32(ID_ISAR0_EL1);
>          c->isa32.bits[1] =3D READ_SYSREG32(ID_ISAR1_EL1);
> @@ -137,6 +144,16 @@ void identify_cpu(struct cpuinfo_arm *c)
>          c->isa32.bits[3] =3D READ_SYSREG32(ID_ISAR3_EL1);
>          c->isa32.bits[4] =3D READ_SYSREG32(ID_ISAR4_EL1);
>          c->isa32.bits[5] =3D READ_SYSREG32(ID_ISAR5_EL1);
> +        c->isa32.bits[6] =3D READ_SYSREG32(ID_ISAR6_EL1);
> +
> +#ifdef CONFIG_ARM_64
> +        c->mvfr.bits[0] =3D READ_SYSREG64(MVFR0_EL1);
> +        c->mvfr.bits[1] =3D READ_SYSREG64(MVFR1_EL1);
> +        c->mvfr.bits[2] =3D READ_SYSREG64(MVFR2_EL1);
> +#else
> +        c->mvfr.bits[0] =3D READ_CP32(MVFR0);
> +        c->mvfr.bits[1] =3D READ_CP32(MVFR1);
> +#endif
>  }
> =20
>  /*
> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/ar=
m64/sysregs.h
> index c60029d38f..5abbeda3fd 100644
> --- a/xen/include/asm-arm/arm64/sysregs.h
> +++ b/xen/include/asm-arm/arm64/sysregs.h
> @@ -57,6 +57,31 @@
>  #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
>  #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
> =20
> +/*
> + * Define ID coprocessor registers if they are not
> + * already defined by the compiler.
> + *
> + * Values picked from linux kernel
> + */
> +#ifndef ID_AA64MMFR2_EL1
> +#define ID_AA64MMFR2_EL1            S3_0_C0_C7_2
> +#endif
> +#ifndef ID_PFR2_EL1
> +#define ID_PFR2_EL1                 S3_0_C0_C3_4
> +#endif
> +#ifndef ID_MMFR5_EL1
> +#define ID_MMFR5_EL1                S3_0_C0_C3_6
> +#endif
> +#ifndef ID_ISAR6_EL1
> +#define ID_ISAR6_EL1                S3_0_C0_C2_7
> +#endif
> +#ifndef ID_AA64ZFR0_EL1
> +#define ID_AA64ZFR0_EL1             S3_0_C0_C4_4
> +#endif
> +#ifndef ID_DFR1_EL1
> +#define ID_DFR1_EL1                 S3_0_C0_C3_5
> +#endif
> +
>  /* Access to system registers */
> =20
>  #define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
> diff --git a/xen/include/asm-arm/cpregs.h b/xen/include/asm-arm/cpregs.h
> index 8fd344146e..58be898891 100644
> --- a/xen/include/asm-arm/cpregs.h
> +++ b/xen/include/asm-arm/cpregs.h
> @@ -63,6 +63,7 @@
>  #define FPSID           p10,7,c0,c0,0   /* Floating-Point System ID Regi=
ster */
>  #define FPSCR           p10,7,c1,c0,0   /* Floating-Point Status and Con=
trol Register */
>  #define MVFR0           p10,7,c7,c0,0   /* Media and VFP Feature Registe=
r 0 */
> +#define MVFR1           p10,7,c6,c0,0   /* Media and VFP Feature Registe=
r 1 */
>  #define FPEXC           p10,7,c8,c0,0   /* Floating-Point Exception Cont=
rol Register */
>  #define FPINST          p10,7,c9,c0,0   /* Floating-Point Instruction Re=
gister */
>  #define FPINST2         p10,7,c10,c0,0  /* Floating-point Instruction Re=
gister 2 */
> @@ -108,18 +109,23 @@
>  #define MPIDR           p15,0,c0,c0,5   /* Multiprocessor Affinity Regis=
ter */
>  #define ID_PFR0         p15,0,c0,c1,0   /* Processor Feature Register 0 =
*/
>  #define ID_PFR1         p15,0,c0,c1,1   /* Processor Feature Register 1 =
*/
> +#define ID_PFR2         p15,0,c0,c3,4   /* Processor Feature Register 2 =
*/
>  #define ID_DFR0         p15,0,c0,c1,2   /* Debug Feature Register 0 */
> +#define ID_DFR1         p15,0,c0,c3,5   /* Debug Feature Register 1 */
>  #define ID_AFR0         p15,0,c0,c1,3   /* Auxiliary Feature Register 0 =
*/
>  #define ID_MMFR0        p15,0,c0,c1,4   /* Memory Model Feature Register=
 0 */
>  #define ID_MMFR1        p15,0,c0,c1,5   /* Memory Model Feature Register=
 1 */
>  #define ID_MMFR2        p15,0,c0,c1,6   /* Memory Model Feature Register=
 2 */
>  #define ID_MMFR3        p15,0,c0,c1,7   /* Memory Model Feature Register=
 3 */
> +#define ID_MMFR4        p15,0,c0,c2,6   /* Memory Model Feature Register=
 4 */
> +#define ID_MMFR5        p15,0,c0,c3,6   /* Memory Model Feature Register=
 5 */
>  #define ID_ISAR0        p15,0,c0,c2,0   /* ISA Feature Register 0 */
>  #define ID_ISAR1        p15,0,c0,c2,1   /* ISA Feature Register 1 */
>  #define ID_ISAR2        p15,0,c0,c2,2   /* ISA Feature Register 2 */
>  #define ID_ISAR3        p15,0,c0,c2,3   /* ISA Feature Register 3 */
>  #define ID_ISAR4        p15,0,c0,c2,4   /* ISA Feature Register 4 */
>  #define ID_ISAR5        p15,0,c0,c2,5   /* ISA Feature Register 5 */
> +#define ID_ISAR6        p15,0,c0,c2,7   /* ISA Feature Register 6 */
>  #define CCSIDR          p15,1,c0,c0,0   /* Cache Size ID Registers */
>  #define CLIDR           p15,1,c0,c0,1   /* Cache Level ID Register */
>  #define CSSELR          p15,2,c0,c0,0   /* Cache Size Selection Register=
 */
> @@ -312,18 +318,23 @@
>  #define HSTR_EL2                HSTR
>  #define ID_AFR0_EL1             ID_AFR0
>  #define ID_DFR0_EL1             ID_DFR0
> +#define ID_DFR1_EL1             ID_DFR1
>  #define ID_ISAR0_EL1            ID_ISAR0
>  #define ID_ISAR1_EL1            ID_ISAR1
>  #define ID_ISAR2_EL1            ID_ISAR2
>  #define ID_ISAR3_EL1            ID_ISAR3
>  #define ID_ISAR4_EL1            ID_ISAR4
>  #define ID_ISAR5_EL1            ID_ISAR5
> +#define ID_ISAR6_EL1            ID_ISAR6
>  #define ID_MMFR0_EL1            ID_MMFR0
>  #define ID_MMFR1_EL1            ID_MMFR1
>  #define ID_MMFR2_EL1            ID_MMFR2
>  #define ID_MMFR3_EL1            ID_MMFR3
> +#define ID_MMFR4_EL1            ID_MMFR4
> +#define ID_MMFR5_EL1            ID_MMFR5
>  #define ID_PFR0_EL1             ID_PFR0
>  #define ID_PFR1_EL1             ID_PFR1
> +#define ID_PFR2_EL1             ID_PFR2
>  #define IFSR32_EL2              IFSR
>  #define MDCR_EL2                HDCR
>  #define MIDR_EL1                MIDR
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufe=
ature.h
> index c7b5052992..64354c3f19 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -148,6 +148,7 @@ struct cpuinfo_arm {
>      union {
>          uint64_t bits[2];
>          struct {
> +            /* PFR0 */
>              unsigned long el0:4;
>              unsigned long el1:4;
>              unsigned long el2:4;
> @@ -155,9 +156,23 @@ struct cpuinfo_arm {
>              unsigned long fp:4;   /* Floating Point */
>              unsigned long simd:4; /* Advanced SIMD */
>              unsigned long gic:4;  /* GIC support */
> -            unsigned long __res0:28;
> +            unsigned long ras:4;
> +            unsigned long sve:4;
> +            unsigned long sel2:4;
> +            unsigned long mpam:4;
> +            unsigned long amu:4;
> +            unsigned long dit:4;
> +            unsigned long __res0:4;
>              unsigned long csv2:4;
> -            unsigned long __res1:4;
> +            unsigned long cvs3:4;
> +
> +            /* PFR1 */
> +            unsigned long bt:4;
> +            unsigned long ssbs:4;
> +            unsigned long mte:4;
> +            unsigned long ras_frac:4;
> +            unsigned long mpam_frac:4;
> +            unsigned long __res1:44;
>          };
>      } pfr64;
> =20
> @@ -170,7 +185,7 @@ struct cpuinfo_arm {
>      } aux64;
> =20
>      union {
> -        uint64_t bits[2];
> +        uint64_t bits[3];
>          struct {
>              unsigned long pa_range:4;
>              unsigned long asid_bits:4;
> @@ -190,6 +205,8 @@ struct cpuinfo_arm {
>              unsigned long pan:4;
>              unsigned long __res1:8;
>              unsigned long __res2:32;
> +
> +            unsigned long __res3:64;
>          };
>      } mm64;
> =20
> @@ -197,6 +214,10 @@ struct cpuinfo_arm {
>          uint64_t bits[2];
>      } isa64;
> =20
> +    struct {
> +        uint64_t bits[1];
> +    } zfr64;
> +
>  #endif
> =20
>      /*
> @@ -204,25 +225,38 @@ struct cpuinfo_arm {
>       * when running in 32-bit mode.
>       */
>      union {
> -        uint32_t bits[2];
> +        uint32_t bits[3];
>          struct {
> +            /* PFR0 */
>              unsigned long arm:4;
>              unsigned long thumb:4;
>              unsigned long jazelle:4;
>              unsigned long thumbee:4;
> -            unsigned long __res0:16;
> +            unsigned long csv2:4;
> +            unsigned long amu:4;
> +            unsigned long dit:4;
> +            unsigned long ras:4;
> =20
> +            /* PFR1 */
>              unsigned long progmodel:4;
>              unsigned long security:4;
>              unsigned long mprofile:4;
>              unsigned long virt:4;
>              unsigned long gentimer:4;
> -            unsigned long __res1:12;
> +            unsigned long sec_frac:4;
> +            unsigned long virt_frac:4;
> +            unsigned long gic:4;
> +
> +            /* PFR2 */
> +            unsigned long csv3:4;
> +            unsigned long ssbs:4;
> +            unsigned long ras_frac:4;
> +            unsigned long __res2:20;
>          };
>      } pfr32;
> =20
>      struct {
> -        uint32_t bits[1];
> +        uint32_t bits[2];
>      } dbg32;
> =20
>      struct {
> @@ -230,12 +264,23 @@ struct cpuinfo_arm {
>      } aux32;
> =20
>      struct {
> -        uint32_t bits[4];
> +        uint32_t bits[6];
>      } mm32;
> =20
>      struct {
> -        uint32_t bits[6];
> +        uint32_t bits[7];
>      } isa32;
> +
> +#ifdef CONFIG_ARM_64
> +    struct {
> +        uint64_t bits[3];
> +    } mvfr;
> +#else
> +    /* Only MVFR0 and MVFR1 exist on armv7 */
> +    struct {
> +        uint32_t bits[2];
> +    } mvfr;
> +#endif
>  };
> =20
>  extern struct cpuinfo_arm boot_cpu_data;


--=20
Volodymyr Babchuk at EPAM=

