Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96082C8F3B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 21:32:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41440.74590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjppk-0006L5-Qu; Mon, 30 Nov 2020 20:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41440.74590; Mon, 30 Nov 2020 20:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjppk-0006Kf-Nb; Mon, 30 Nov 2020 20:31:40 +0000
Received: by outflank-mailman (input) for mailman id 41440;
 Mon, 30 Nov 2020 20:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBJD=FE=epam.com=prvs=06035e4899=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kjppj-0006Ka-9H
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 20:31:39 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0eb114bb-f6be-4778-b383-d29cc5ba4cbf;
 Mon, 30 Nov 2020 20:31:38 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AUKU8A5017975; Mon, 30 Nov 2020 20:31:34 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0b-0039f301.pphosted.com with ESMTP id 353ejmwufm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 20:31:34 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VI1PR03MB3952.eurprd03.prod.outlook.com (2603:10a6:803:72::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 20:31:27 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Mon, 30 Nov 2020
 20:31:27 +0000
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
X-Inumbo-ID: 0eb114bb-f6be-4778-b383-d29cc5ba4cbf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/OKvHfqB4DP8rvh4eoE0e+cWkGZEMBfyF5K5r8IGNdKojSSXVOWvsMggeLwNXUtkvttBzHCOO7ybLGbnHN+wB0kO592dUOz61Wzv4w579B/BdGNGVypSQc71+vCB4XV8h+26KLjNmNobqm+mFBjxz1erpI/pelIiu6cIKovcU+LckEHL5cdba+o9xFOKhIFb7NAQtVUgu758jibEy9P1m/jeCDMMqpFTvBsuv/+0VvaBLiWMP0lcvtYgF7p4AWvKmSc2h9JdF6fIjxsGh6UB4noBSHYhjobPjJd/wLo+644+bhHCMxmDGsHokDZv/xRE0Xb/WYSy4OfTzLaN/caog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXyWrhtWrJ2j0/Llt8vyBSNOAVnWeuWkkQIQhOyqf0c=;
 b=nrw+8MOUSFYYgpuYYUzdWDgBzZnZhVkEpWRGmKapE1c5exkvVfKKrz5M3QyffvPxDRMn0wJoa/1QLICILKLCwveMzNpheZZKSHk5nWaGw/h28Ye01jtuox/SDZEXSOdgor/dJVKEOkvxhkAWd1KghbwRXo22nh3nFOJGgmURhI2Kxpp9Pv4B5XSp4+ZjYcNq+xGbTNH4ifU0PdUihpYxQA8/T9DZfkqla6+Pl9aq+M+mUMZCSnndAjiGQUQXs6gpBYyk0EjGm6Od7GtehZLGm8Wi7msuRyOf688uuElWR4tVyYSitSuU6G3SmGvA/33f+7IC+93xAxwlSQKsTipevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXyWrhtWrJ2j0/Llt8vyBSNOAVnWeuWkkQIQhOyqf0c=;
 b=P4mhsJAn5CXQQifLrIKMZTSn1p8VDLF+gk5HP6g5kCcnsU7kT5yuuZOYhgqkzWO6+pFq1KI0ZuQR/sUKf3Muv+3smltPD6A9DDUyNBXta810gZHSXLmqSvTV9K2L45MevMclIFmXwcV3ANe6f5ksxnR8NepwuGlBwSwYsmozl378Xw8MzEPrZv3bk2VF3JulUcsnZ3mgTI4yY0wJ2+cXifLQFR/nL0/dcUWtQ9A1peNl+orilMhw7rm3vJQcomDW2XogC50lK1TsKD99OBgWz6PCjo3GZzvjlajKiafZ4sKTluUgLclYUHxQrY03apwY8hDKzqiyt2a06lot/OeQHA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Topic: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Index: AQHWxyRSFk5jpSQ9QE+NXR5AM1rL5qnhIUQA
Date: Mon, 30 Nov 2020 20:31:27 +0000
Message-ID: <87lfei7fj5.fsf@epam.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <86c96cd3895bf968f94010c0f4ee8dce7f0338e8.1606742184.git.bertrand.marquis@arm.com>
In-Reply-To: 
 <86c96cd3895bf968f94010c0f4ee8dce7f0338e8.1606742184.git.bertrand.marquis@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [85.223.209.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04417952-d567-4181-c251-08d8956ee9fc
x-ms-traffictypediagnostic: VI1PR03MB3952:
x-microsoft-antispam-prvs: 
 <VI1PR03MB3952C56C3AF4F7F11707030BE6F50@VI1PR03MB3952.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OQiEJtQQE+712lUpA05AUDVDyHqXR+/bZAw8PG+IaDOZsRPSW3AtBhLW9FWUMUqcYFh67WhezHH0Ey5k3mQKJnQNIH3MeBrO89itv3ivWwjym7kkaGnSjIJuOQELKeWxz9j8aax/WeRsiEMvEF2jtrPyvjXseBAhADAHN7/WUvEZJZ8EazCzdJta2k6aqqMuiaHiclnXOBml4f/qVtS4G1wXm+qfYIWNaVHF2NYQ+CMH7sH5Ax8Yq40CwksXCE9h3a+i1Xd3xZyXQtwtHwpaaiHrRuy3PMTnXihYeHQ3g+8Kq0qCQc0tflrAzS3gd9xZrruVh8YZE7wmeXiD+GaLuQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(5660300002)(2906002)(36756003)(6486002)(91956017)(76116006)(83380400001)(66946007)(71200400001)(6512007)(66556008)(64756008)(66476007)(6916009)(66446008)(186003)(478600001)(55236004)(8936002)(8676002)(54906003)(2616005)(86362001)(316002)(26005)(4326008)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?+vhqChxCVmQz5p0uiK+t53vcxiuSyULtZA9z8rAzaFWiOMueEFaNJS7Tod?=
 =?iso-8859-1?Q?5nOkq+XtCrl+kyWscQEUAtw34JaFZFtpHyYlFlqTVFQ3KDGnsviV9b7QWH?=
 =?iso-8859-1?Q?BE3/izH/WMTQsN6SKn7X89IkxJ6C5BN4uWcZ8hsuBWP90WGDHHHrv3d1Qz?=
 =?iso-8859-1?Q?hXroTiu9wxwbzHJP/q0wJ3FVyAQkGnnyLbgEvaGSBDMgeRncqjdjCJCtzx?=
 =?iso-8859-1?Q?9zBP7UL3u7EgPKdpb2WaTkuMeTSyFhWjBr1/u3uVdm1ys0SVvJp3yfTPgR?=
 =?iso-8859-1?Q?nWDieG22C/ISJLGRR+LCWx1BcAw1JPxVuWdf2kcAby80OORzXJxepzfThT?=
 =?iso-8859-1?Q?v6Tw3pzeAGcmZTRC3Iw+YGUnJsJSm8qdxov8fSCix4CfJy7sYqBgfVyN73?=
 =?iso-8859-1?Q?daBOw2s6M8DwklJr9aUg0qHubeivlfk1PH4Ad1prIBFllN087YFErpLyG5?=
 =?iso-8859-1?Q?a7/ZI67TgZ9WCYVc5gcAENH63pCgUoKO+ho9n4NzTw6xPm1UpRn98JWonM?=
 =?iso-8859-1?Q?VEbrXx6+upsXdCZL/sOejAhGDAdMCaM8DTY/hI00ydLngtP/HyK3DedSqm?=
 =?iso-8859-1?Q?6zDPlDF3vPq0V74YeZUvootwkIYRnFLeIouH2fUWXq8pctjij0+rTGv12I?=
 =?iso-8859-1?Q?QdWybnqCu8g6PQsiP6R1QOToTNmV8NX/taU6m86xZzIT41oSgrty3VH0rf?=
 =?iso-8859-1?Q?yzHjr+kCAsX28F7W50aWDhaUWUEOBK4i9wPu/Zw6HXnGv6vRbadAotUzlW?=
 =?iso-8859-1?Q?BVnTZNVGryQbX1dZK966m9KaBfEKLL61xNgoAP3PV4bmZ0uctATjmfRWFE?=
 =?iso-8859-1?Q?pALqAv3OjLc0dKDD4PlAhgBix16okvQDOBDs+aAlriRDa4yYIxfYTMzUWJ?=
 =?iso-8859-1?Q?ouQrahCvhWoNE2lixZRdWydPpN7BpS5EuLS5+qz5JKIFS0+VxVav96chKo?=
 =?iso-8859-1?Q?/PICoZ5WTAVubGW5TkL/C0ooxd+OZcdaplKE6e9lAmvBv5NdVTTw/CqxJG?=
 =?iso-8859-1?Q?ew6EmKjGfOV0i6h8elbgSYrBl3K0Z2rKhP61kC?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04417952-d567-4181-c251-08d8956ee9fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 20:31:27.6347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SInA+WYkPhvTEjQB0V+s9OUPujqj9HWyYs3Yn5i5Q2CCOBXJt8MYaDTX0/ikrBdw94zF4o+iJp58ufjE7aLVRJXqj7rtZ6640h99tXe1uvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3952
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-30_11:2020-11-30,2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=673 spamscore=0 mlxscore=0 adultscore=0 phishscore=0
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2011300132


Bertrand Marquis writes:

> Add support for emulation of cp15 based ID registers (on arm32 or when
> running a 32bit guest on arm64).
> The handlers are returning the values stored in the guest_cpuinfo
> structure.
> In the current status the MVFR registers are no supported.

It is unclear what will happen with registers that are not covered by
guest_cpuinfo structure. According to ARM ARM, it is implementation
defined if such accesses will be trapped. On other hand, there are many
registers which are RAZ. So, good behaving guest can try to read one of
that registers and it will get undefined instruction exception, instead
of just reading all zeroes.

> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in V2: rebase
> ---
>  xen/arch/arm/vcpreg.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index cdc91cdf5b..d0c6406f34 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -155,6 +155,14 @@ TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
>          break;                                                      \
>      }
> =20
> +/* Macro to generate easily case for ID co-processor emulation */
> +#define GENERATE_TID3_INFO(reg,field,offset)                        \
> +    case HSR_CPREG32(reg):                                          \
> +    {                                                               \
> +        return handle_ro_read_val(regs, regidx, cp32.read, hsr,     \
> +                          1, guest_cpuinfo.field.bits[offset]);     \
> +    }
> +
>  void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>  {
>      const struct hsr_cp32 cp32 =3D hsr.cp32;
> @@ -286,6 +294,33 @@ void do_cp15_32(struct cpu_user_regs *regs, const un=
ion hsr hsr)
>           */
>          return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
> =20
> +    /*
> +     * HCR_EL2.TID3
> +     *
> +     * This is trapping most Identification registers used by a guest
> +     * to identify the processor features
> +     */
> +    GENERATE_TID3_INFO(ID_PFR0, pfr32, 0)
> +    GENERATE_TID3_INFO(ID_PFR1, pfr32, 1)
> +    GENERATE_TID3_INFO(ID_PFR2, pfr32, 2)
> +    GENERATE_TID3_INFO(ID_DFR0, dbg32, 0)
> +    GENERATE_TID3_INFO(ID_DFR1, dbg32, 1)
> +    GENERATE_TID3_INFO(ID_AFR0, aux32, 0)
> +    GENERATE_TID3_INFO(ID_MMFR0, mm32, 0)
> +    GENERATE_TID3_INFO(ID_MMFR1, mm32, 1)
> +    GENERATE_TID3_INFO(ID_MMFR2, mm32, 2)
> +    GENERATE_TID3_INFO(ID_MMFR3, mm32, 3)
> +    GENERATE_TID3_INFO(ID_MMFR4, mm32, 4)
> +    GENERATE_TID3_INFO(ID_MMFR5, mm32, 5)
> +    GENERATE_TID3_INFO(ID_ISAR0, isa32, 0)
> +    GENERATE_TID3_INFO(ID_ISAR1, isa32, 1)
> +    GENERATE_TID3_INFO(ID_ISAR2, isa32, 2)
> +    GENERATE_TID3_INFO(ID_ISAR3, isa32, 3)
> +    GENERATE_TID3_INFO(ID_ISAR4, isa32, 4)
> +    GENERATE_TID3_INFO(ID_ISAR5, isa32, 5)
> +    GENERATE_TID3_INFO(ID_ISAR6, isa32, 6)
> +    /* MVFR registers are in cp10 no cp15 */
> +
>      /*
>       * HCR_EL2.TIDCP
>       *


--=20
Volodymyr Babchuk at EPAM=

