Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D871D2C8F9A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 22:05:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41463.74626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjqL4-00018n-3Q; Mon, 30 Nov 2020 21:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41463.74626; Mon, 30 Nov 2020 21:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjqL3-00018O-W2; Mon, 30 Nov 2020 21:04:01 +0000
Received: by outflank-mailman (input) for mailman id 41463;
 Mon, 30 Nov 2020 21:04:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBJD=FE=epam.com=prvs=06035e4899=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kjqL2-00018J-U4
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 21:04:01 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bea53fa-4ddd-49ee-8021-9ffce5a7f877;
 Mon, 30 Nov 2020 21:03:59 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AUKe591003819; Mon, 30 Nov 2020 21:03:50 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 353ybc4ryf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 21:03:50 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR0301MB2368.eurprd03.prod.outlook.com (2603:10a6:800:6f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 21:03:47 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 21:03:47 +0000
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
X-Inumbo-ID: 0bea53fa-4ddd-49ee-8021-9ffce5a7f877
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tziu4wLHfWcoQYXsY9STfdzpSgiIYeFBhBdr9Jpm52rPSB34AYZSTPY5CAD7QecisLnqe4X7uwDsA7DkV6Gm4MJwRvzJ5F6h1sfY5Eb6oPI+BeS4sUTWC/7Q/Xo1DcbQOpRj5zersLDI6HUTktzLmL+7dtW/AE36KB01xDfjK/nyDmdjby3zz6/9CEavoLzAFB87z5C/EyNLATAszhG2mVdWOzSg0T+Q254BEJwo3laSI+tc6Ttk/lfRVQBxKn4bEcvXpsV7Jb4bnji+vUqpP8j1QKn9td257vo0npxSJnmgBwtzqNnxBp6yQqVWJskz/dp0IGHlIlzFgXINz0lHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0NJJ95yqj9dtDn9vQuzwveSIrxFGX2loWzb8QV4It0=;
 b=AG/eJyO681Gp/6cFCc0ygvFCp17wvZuf7U3CYaVFyqrmSQfDjHsdOZboXQUEFzbiCCXF4XBthdbZYGcpbgVAA5vYGD7liISlE77UdO+BX2+JfNHYTG8hukfYH1BWASc0ObCrXoqQeZRPMnEg8C5dskB+KE+ABxkU1Ze+a4UMC6Wxf67rIXaAzLx/9QdfsBPP1RcMIijoNZYLHjS6+fcNftlPWfhbHonlDr80esUa3L+7b7NgQhF9V8soiLQGUxI8nVJb4IjeKouu4rhA/VIrGp8PiWh9tRUlZAjN21dLDNy5aeGwuHiadFUXI9/UaN8Q9AX0XVAN+3x9XXz4KhgXnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0NJJ95yqj9dtDn9vQuzwveSIrxFGX2loWzb8QV4It0=;
 b=TPJjmOA1bbVDStK8IjlYszTMTLTt//+JQsjmURV10tMr6KOW44J5qcclw/YrjOAgxUVsAlOWTRQ5skIReM36mXUfNRE8a6aDLkxBJFTPZ35jpRShS3Cz87RWRO9uggx0UfVRxvayi5q1/v+ggyKblJK5uVyJI34iK+P7v3lpB9uzwqZ2ZeIjJa7JMR9jXfDgXzoX5rluOlU40/ALwbfmMJlOFmc0ZerkuQJSuGM3hq4uQJMkktNEpYAIfw6uoeNV8dWPYbuwei8IDxcStPcLI9rxZN2j8cVzAhERgdlvGVBzXQppIbnghdDc5NmZpQ+lmiQNpsHN3MSZ/PNLYMrUXQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>, Julien Grall
	<julien.grall@arm.com>
Subject: Re: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
Thread-Topic: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
Thread-Index: AQHWxwQMBbxecCO+BEuoRSAjYYX8W6ngeesAgACwoYA=
Date: Mon, 30 Nov 2020 21:03:47 +0000
Message-ID: <878sai7e1a.fsf@epam.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [85.223.209.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 429f40b7-85a3-459a-5464-08d895736df3
x-ms-traffictypediagnostic: VI1PR0301MB2368:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <VI1PR0301MB2368A03D689AB6035D3CB627E6F50@VI1PR0301MB2368.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PZ95Of0oM2ixdEoNH7n1N3FjU8jqwuMHlDBJOGrn+4rkHMTE4Dro2z2jy244lYpjldx9AkotLkBnzOjzmtqonnagBvQ365l99PKNDssEfwAeDkLv/fwyOSMcaD7aM+i1vCG9ob5BDkvoRQfKZURqNPb6cpDfq6DV/dneW23ffxJulwaEuZdL2q9xnWHI+SoTwff1EmrD9DQZ96REPliO2a9NGQnbUdGp4k++mj8/ppV6U7FFaHk9WLH7RtVm4rqH30T+lIMGAqxkn9TRqZuHtXNAFBe/xeGnWb+1X1EGbi2OzvkWljT3oO0d/3931lMY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(316002)(5660300002)(83380400001)(186003)(71200400001)(66476007)(54906003)(26005)(91956017)(66446008)(76116006)(4326008)(478600001)(6512007)(55236004)(66946007)(8676002)(6506007)(8936002)(64756008)(66556008)(36756003)(86362001)(2616005)(6916009)(6486002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?6bgKgfDv7segncR28JrUz5V6wHsYG1XX4LeR92midow9Dbyowxpi7krSm7?=
 =?iso-8859-1?Q?6y21kqS8e8GYpax8ivM/BjQe+rwQG5qbOap4T49SvY6UUK85XNsMAa7OeZ?=
 =?iso-8859-1?Q?74+LjPru2RB0BBERD+Et4pF2TonUU/99GGOasrQ+37hbICp4hmQ0913XcN?=
 =?iso-8859-1?Q?XTtvngg1/VytzB/B2y9gLHCTv2OzU4JmLqbrqxX9WU9S6WBTx/Bvio9Qx1?=
 =?iso-8859-1?Q?xLEXyiqRY11q0vY6mrEGpALSFCXdzdpLzH039dlR6JnxPInjxeGGDEYr1U?=
 =?iso-8859-1?Q?mRsEG5nGg42nCADNxmxjk21KjdAyMpOsCy0VVagQAk7h9JUX1kq9fAIdIc?=
 =?iso-8859-1?Q?fdUQuXub1N2ktM8yPopUqNMstxrdfI01znS9ZFQ9zLC1nOKTyiFFujnZ9G?=
 =?iso-8859-1?Q?vLZjcM+g7UD+ZMTaIvJx8DXAThv57SvfxWTJvPDSZEuEB4hvGjRPRJ/ufW?=
 =?iso-8859-1?Q?5zUscUTXBphpnet5k/QuEW6TOc5CCq+UFZ8/3qYJPkjoXHH3ljJa1SUGgr?=
 =?iso-8859-1?Q?F9gwDSelk50okU7E8/uT4YS7kpaHKI/GiFWkNI45ab6Y+qznMoyuq60HMv?=
 =?iso-8859-1?Q?+HZN6KM5LbRMDy44/WXo6nbbpdjO9b/SqFbqwBnOeDTqSuX3d9HPWJrWzA?=
 =?iso-8859-1?Q?xZsX0yLxx5yzclxd9FIYpMAZoW38PFVeEWxQjJwTNL3GFqM8FCJrUuf0dO?=
 =?iso-8859-1?Q?YiYlv3dIMEqfuooB/6hpJ+zICqMAYXnaaYx8jT82EnbzHZ9aq+QSe5Iilp?=
 =?iso-8859-1?Q?r4Prul5RdMXMzX2MauZxm9R8dFm15BAFxT/jItaWE2l4KiZoiDZxYBUj/W?=
 =?iso-8859-1?Q?I7bW97wr9RRxtuyVuhrfA+EDKxHvu8fLIcDViMlFFchMXQJKS3eRGc2Wgz?=
 =?iso-8859-1?Q?+ikhKNjIUE/YmTkIu8muXaC4ImecbqDuBkyZPShVFhnB5JEH+xVaXF0tc5?=
 =?iso-8859-1?Q?Ugia9jdCmFBYB2o/uvUDc2+XVh3JphHGKusr4n++nEWbLl8cnY7nVgOoM2?=
 =?iso-8859-1?Q?b9bSwn6zoXCS3uWAxhbBlSC1HUWM5qpKCVmhHb?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429f40b7-85a3-459a-5464-08d895736df3
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 21:03:47.0410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8kwiWEuhffbl1nEN4rNIwYnDk9okA7HesKSrmpPwUha+JQ1d/DaItVeF1nqVepdSvCNCGG4mqPVJdukVdiVRoXTqh2hW6przPqxOt6cIbHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB2368
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-30_11:2020-11-30,2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 mlxlogscore=788 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300133


Hi,

Oleksandr Tyshchenko writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> In order to avoid code duplication (both handle_read() and
> handle_ioserv() contain the same code for the sign-extension)
> put this code to a common helper to be used for both.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
>
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
>
> Changes V1 -> V2:
>    - new patch
>
> Changes V2 -> V3:
>    - no changes
> ---
> ---
>  xen/arch/arm/io.c           | 18 ++----------------
>  xen/arch/arm/ioreq.c        | 17 +----------------
>  xen/include/asm-arm/traps.h | 24 ++++++++++++++++++++++++
>  3 files changed, 27 insertions(+), 32 deletions(-)
>
> diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
> index f44cfd4..8d6ec6c 100644
> --- a/xen/arch/arm/io.c
> +++ b/xen/arch/arm/io.c
> @@ -23,6 +23,7 @@
>  #include <asm/cpuerrata.h>
>  #include <asm/current.h>
>  #include <asm/mmio.h>
> +#include <asm/traps.h>
>  #include <asm/hvm/ioreq.h>
> =20
>  #include "decode.h"
> @@ -39,26 +40,11 @@ static enum io_state handle_read(const struct mmio_ha=
ndler *handler,
>       * setting r).
>       */
>      register_t r =3D 0;
> -    uint8_t size =3D (1 << dabt.size) * 8;
> =20
>      if ( !handler->ops->read(v, info, &r, handler->priv) )
>          return IO_ABORT;
> =20
> -    /*
> -     * Sign extend if required.
> -     * Note that we expect the read handler to have zeroed the bits
> -     * outside the requested access size.
> -     */
> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
> -    {
> -        /*
> -         * We are relying on register_t using the same as
> -         * an unsigned long in order to keep the 32-bit assembly
> -         * code smaller.
> -         */
> -        BUILD_BUG_ON(sizeof(register_t) !=3D sizeof(unsigned long));
> -        r |=3D (~0UL) << size;
> -    }
> +    r =3D sign_extend(dabt, r);
> =20
>      set_user_reg(regs, dabt.reg, r);
> =20
> diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
> index f08190c..2f39289 100644
> --- a/xen/arch/arm/ioreq.c
> +++ b/xen/arch/arm/ioreq.c
> @@ -28,7 +28,6 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs,=
 struct vcpu *v)
>      const union hsr hsr =3D { .bits =3D regs->hsr };
>      const struct hsr_dabt dabt =3D hsr.dabt;
>      /* Code is similar to handle_read */
> -    uint8_t size =3D (1 << dabt.size) * 8;
>      register_t r =3D v->io.req.data;
> =20
>      /* We are done with the IO */
> @@ -37,21 +36,7 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs=
, struct vcpu *v)
>      if ( dabt.write )
>          return IO_HANDLED;
> =20
> -    /*
> -     * Sign extend if required.
> -     * Note that we expect the read handler to have zeroed the bits
> -     * outside the requested access size.
> -     */
> -    if ( dabt.sign && (r & (1UL << (size - 1))) )
> -    {
> -        /*
> -         * We are relying on register_t using the same as
> -         * an unsigned long in order to keep the 32-bit assembly
> -         * code smaller.
> -         */
> -        BUILD_BUG_ON(sizeof(register_t) !=3D sizeof(unsigned long));
> -        r |=3D (~0UL) << size;
> -    }
> +    r =3D sign_extend(dabt, r);
> =20
>      set_user_reg(regs, dabt.reg, r);
> =20
> diff --git a/xen/include/asm-arm/traps.h b/xen/include/asm-arm/traps.h
> index 997c378..e301c44 100644
> --- a/xen/include/asm-arm/traps.h
> +++ b/xen/include/asm-arm/traps.h
> @@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const struct cp=
u_user_regs *regs)
>          (unsigned long)abort_guest_exit_end =3D=3D regs->pc;
>  }
> =20
> +/* Check whether the sign extension is required and perform it */
> +static inline register_t sign_extend(const struct hsr_dabt dabt, registe=
r_t r)
> +{
> +    uint8_t size =3D (1 << dabt.size) * 8;
> +
> +    /*
> +     * Sign extend if required.
> +     * Note that we expect the read handler to have zeroed the bits
> +     * outside the requested access size.
> +     */
> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
> +    {
> +        /*
> +         * We are relying on register_t using the same as
> +         * an unsigned long in order to keep the 32-bit assembly
> +         * code smaller.
> +         */
> +        BUILD_BUG_ON(sizeof(register_t) !=3D sizeof(unsigned long));
> +        r |=3D (~0UL) << size;

If `size` is 64, you will get undefined behavior there.

> +    }
> +
> +    return r;
> +}
> +
>  #endif /* __ASM_ARM_TRAPS__ */
>  /*
>   * Local variables:


--=20
Volodymyr Babchuk at EPAM=

