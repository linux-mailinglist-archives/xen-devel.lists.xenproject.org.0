Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8247512B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 04:04:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247174.426178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxKaP-0006lZ-KK; Wed, 15 Dec 2021 03:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247174.426178; Wed, 15 Dec 2021 03:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxKaP-0006jm-H4; Wed, 15 Dec 2021 03:04:09 +0000
Received: by outflank-mailman (input) for mailman id 247174;
 Wed, 15 Dec 2021 03:04:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4EW=RA=epam.com=prvs=29836cc2ab=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1mxKaO-0006jg-3J
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 03:04:08 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9e5b6d9-5d53-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 04:04:06 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEJB0p9000732;
 Wed, 15 Dec 2021 03:04:02 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cxuyea0kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 03:04:02 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB7652.eurprd03.prod.outlook.com (2603:10a6:102:201::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 03:03:59 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 03:03:59 +0000
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
X-Inumbo-ID: a9e5b6d9-5d53-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TioPVD1zwXOrsf1ZwAGRWrgp1IkGJZuFokuzqj+8T4RoFu6hw6tS3B0I3PtZDY25+qCvuKrdnPPG7JI//ximLfrkeD/foXnsNfJpG+iucC3UNgRU5HybZvoq215q1Kqsi2ezOVjOrkE8Degi1N909wSMuHuqYLnmMp4S/NTeRNeumiLII2P8tMA+YqTQh3HYoVPtaKdKcwXwEETkcOOLHNh15jSwCeQhia506ctQ7SnucF03kBCsJFKhEOgwh9ybokMAd2x/Ih5A2z/buR/utTvDy/joHq22Y06EyyvTjff/AsvKhOiJobAUH9h+9tG4lZRA9E2QkImQ6VXG7WWuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNlgJe5sHL16Fjk0h3qwhjw73UXpZVLLuyzLp/gpKrg=;
 b=GGIHJavY51dp6isyU2bM/iVRs06rLLkF47mHf14RYHXqhZFKLXRFRlPPM1kG8n86ueudRGu0l8exaWnhf/vaW8b7yqxW+JEL4CWou1kKmmHjXW3bT9PqmL3oClZcbjbXn1OT3hSxPKHO1DHBEJVpUP+m7zHjI+KdHjKhUuujVzd89C6ojLDo79NEXN6JJPPcyf1v8DOICtVJPOCy49DjGc9OqLqdKIqoxYXwC7kMy4/GwKCJNRlPrt0ScWnuetIHLRXtFn5ReEbGUbX661xO/wnbHCzNXJOVjzAvWaZTm0C7TAG3gnvfUCPY0jIzjtOLdgxX9Um9hdTH2J9zSBGD/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNlgJe5sHL16Fjk0h3qwhjw73UXpZVLLuyzLp/gpKrg=;
 b=Y0gW2NsZcSscV6qI2UzKcL01RuAoGBJE1bM66ZljAfmuz9ie261ecffyraMlAp10O5vKTNHXQ5XbMvvdhlMGAgR90ch/6TbV+MpRT9dSASY+hUo/PnObyPixDIRketnxYWa1lyBHwB1EB8YWLEF06DygbU9uAsWHFvGcNf495QwRiAP6dvDQzBcUpuANgTHBSxsR4FZwlPQl+uuM5I4IQTI77HC0VgCG4u/s8Q8wILyp5U/cEd6oBTeYSPkO711WqTbXEoWQ7d12ox+qatH8e9GbPlfh9s4R+/xUyD4Sqhu+c6hh0qbDpmmUWiqSIASsh/g2V9eF3uESVH7fET2egg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 10/10] iommu/arm: Remove code duplication in all IOMMU
 drivers
Thread-Topic: [PATCH 10/10] iommu/arm: Remove code duplication in all IOMMU
 drivers
Thread-Index: AQHX47d9oHPrGhwq2Umum7HnvXtv26wy+BMA
Date: Wed, 15 Dec 2021 03:03:59 +0000
Message-ID: <877dc6y3fl.fsf@epam.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-11-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-11-git-send-email-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12f38d79-4b0a-40bd-8d5c-08d9bf778a57
x-ms-traffictypediagnostic: PAXPR03MB7652:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB76526F59BF8F171B1B76E964E6769@PAXPR03MB7652.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AOsUdFsTSFivp7EUBtAEE2pJsmCkLvb7aDZqVYwD10HPJ8LuwNWA4wmluSi89hHWBouxqrVW0t1Hn/+Mv7Bwg66fsDsGo1PHUGSii+Z6SRGWwqXBnDxIOrD5Bkhs03vwm2YhIwqvxXgM4kj6ZriHnle8YXw5P5IplEqH+VdUK+hqsg7x/0DXoWlKWH5V8giHFLF/r+ZV0s+YW+QjeJjAjF2wnzaUMUCrRvtstUSaey0MWnMuTQCRL/9Z5CkNf/I8eZVpPekQszvJfjTAT7FLuAYFtec76fyih0ZA6SHP2YDvOvZ9ICn6bWlYGnPgUfWATLNIG7MF7qRM4fQiJX+pWJFgVSxqLF8+lFFIyIF9E6q3nAWTCcWAlBszILa6DmxGklr+nlLzWCDKeFOEeVtwYjGOFcpng65yP9BrQVm/GG3gZseZvwH+PVHqs4ByfBq7tkRpCh+IAbxhvbasvHyNR4V2wBbHH2Afl44dNrCL3KvZ/G3Z3XbMJLm56VIJYX6UHjbh0cwt00P9c9eZ4NWPJb8cZYxiUf/wKQmULPUZobLL4bNAxOrlI7vF5CTBE+xANiEqt3dpHmLI0nytGWywWjkif68nNIuEPcLEO8z8tGlMB/ak2dqd9prvOv030ipWpHTTvW7+yPUml2QYjdJno1DMBnmBOH/ywXjyKxulAP7ZSfOB+g2p8VU7nfkkRsL1U0d1Jr2hQR0U14Omhnftww==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(91956017)(86362001)(66556008)(76116006)(66946007)(54906003)(66446008)(36756003)(8936002)(122000001)(6512007)(2616005)(38100700002)(8676002)(6916009)(508600001)(6486002)(64756008)(66476007)(71200400001)(55236004)(83380400001)(4326008)(38070700005)(5660300002)(316002)(186003)(6506007)(2906002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?d1USD5Oz3hBmovImA0BGvTC7956QNPvsJ+RLT6XX2zZSlb+1t3rkIC/QDe?=
 =?iso-8859-1?Q?Oy3th0EaVrzI/xvbtGGqiCQg5U+ysXrHiE3B5C2238eM523yN/gFUMb/tx?=
 =?iso-8859-1?Q?jQDYmS7F9sUsag23wAMLqjIHmPMOmAq2zb/jz7F9uv03kc08BdxrA/AiIb?=
 =?iso-8859-1?Q?0bDoTrpl8mGOCeIJl4ljgLqv26BfpIfVJLbIxqUsYxFyzAJ7w67C4DiTho?=
 =?iso-8859-1?Q?aVbaCSsziFl2g5sxQteKhFGJht1AmAxrLDMX53l5Xx3A21CKwTDPKLpk3K?=
 =?iso-8859-1?Q?uS3aE5uMO50vN4RA0QKWCfqga1SctceafMccH1QoRxCE1x0JlCbmEt9tfe?=
 =?iso-8859-1?Q?iX9SSpV5i78xbnSajX8OzdYo/9cvz1yx2y6hWEAvYvNGPEr0I/a1zIwq9K?=
 =?iso-8859-1?Q?tcXGB9m38TIwqV2tAjEqRtTkfJC0dqrQfqmyCe322IKnj/AfEyWdeR9rU9?=
 =?iso-8859-1?Q?HhUDjkvVQhMvMTdphlxA1Y3Zqd3G/fHw2ykFa3SAavTMP1Z8ZOUWeF2Iod?=
 =?iso-8859-1?Q?mfqDCWBmi2KR1NlvZdXwVGt5SyMeWx5XYfd+q32X69CtwgK0is05z+9GRd?=
 =?iso-8859-1?Q?e7NFUY/MX2tDZMTWSBCYtY3i1CpECgvYmWcMpNxXPpZEl2YmjZgmgdCbZ9?=
 =?iso-8859-1?Q?ffv1FB+VE2SVttHlkNu9xcm6Dm03qkrc+/Ow4xDWb94L3Q+p8jeF9pnvFE?=
 =?iso-8859-1?Q?JXunD1Q7DvP4D51t2mgpWLyReUVCyov1zsUfYg1snu5IL4Cbocqm8cNILz?=
 =?iso-8859-1?Q?w4PhW4SLKLrXHfqSTI5JX9SEY7QEcWBW8JEyiMT2KHK77wtB8pva2p+ZMv?=
 =?iso-8859-1?Q?AJk2VxWzyktOIUwTgx8b/yeAT00o1MlDGJiGEO3Rmf/yjR9x0oeglI+CJm?=
 =?iso-8859-1?Q?QLcvXJVJXtgQWbbRCGsXbLzO/cjIKfB7TQ0MidrdKOpLf9oZSCv1ann19r?=
 =?iso-8859-1?Q?m4Vn7TWnJvA6WFfS2zL8NYF/B9nwqxvtuBTbuTWmWYjNc17DR4UeD26OCy?=
 =?iso-8859-1?Q?aWJzQn3J7VXqhJyrj3yXWkh1xpgxuyAtmg+ax3M1f+Se9SmQ/dkksCanXB?=
 =?iso-8859-1?Q?nnEhnS0r3hzBoRM9ocVf8/7YeBvrKLXz18Q9qLYUzf2pQZAFU34eAzWK1B?=
 =?iso-8859-1?Q?7W1Gl6DaMyd9ti0Ris9n8jc5iLneQLnh2z661SgzTz72mvnS+XR95X/C9R?=
 =?iso-8859-1?Q?rvkmHvrqrkLB9hQrAx6danVl23gmHr/XwrcaV59l4jG3mknc2ABs09l08B?=
 =?iso-8859-1?Q?l9maxGb1Rut69tTkE8F4l93AQye7S48BRpyh0kVncXgnBvMRGYmnoNU04O?=
 =?iso-8859-1?Q?cZIjgCsY1k3/tycsyGNLVeesPgWz8yL3QYwNJ5qtcrYplRzqRP2fVXJiXm?=
 =?iso-8859-1?Q?lwAXe1Eojpdlg3OJ5z/eRbgb0m3r+HRGRKHEgMXhn5fjjC40GUUQ1n6SV1?=
 =?iso-8859-1?Q?pQRZ8TApmeXe+CwEIhJPGveHNgnl4KUrGy+/UTqyPKFwVsX50ANGX8vPYe?=
 =?iso-8859-1?Q?Fzdff9H9OuZ7+faiA2Ad6ikzixLGVVIXK9K9fUItF5UBBjoZ+hqoPAM2ol?=
 =?iso-8859-1?Q?zrhke2GAiYpZyOWYzGg10BRG069jH0XF2KtaT9j9SrDru0xd4Niv26yM9v?=
 =?iso-8859-1?Q?2jor3UrM4sjbIFeKnnfdJPmPDV8ofmfDLPGf4tDv6cGGx0DUcCmGAsYq49?=
 =?iso-8859-1?Q?rpq+7IRS3uO7wKA6D/PfTwuMcGX/QctJ0DEKpx2yd9YcRLqGZbIchP5dTh?=
 =?iso-8859-1?Q?OndcxdMEEMd0Xc127lb68R2kg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f38d79-4b0a-40bd-8d5c-08d9bf778a57
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 03:03:59.1706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 196DedVcMI3oaoipZRDGHyr3iMlz06o6xgrktnJCMFpfcdDG/U3Bh0Wn0t/vewUfeU3iPYkbnCMi0ORLRC47Sjykj/jmftqrHTmV0QBb1kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7652
X-Proofpoint-ORIG-GUID: a7YXSkelcRjvkG7JkPqbRtmsSr0A6Q6R
X-Proofpoint-GUID: a7YXSkelcRjvkG7JkPqbRtmsSr0A6Q6R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_01,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=991 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150016


Oleksandr,

Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> All IOMMU drivers on Arm perform almost the same generic actions in
> hwdom_init callback. Move this code to common arch_iommu_hwdom_init()
> in order to get rid of code duplication.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

> ---
>  xen/drivers/passthrough/arm/iommu.c      |  7 +++++++
>  xen/drivers/passthrough/arm/ipmmu-vmsa.c |  8 --------
>  xen/drivers/passthrough/arm/smmu-v3.c    | 10 ----------
>  xen/drivers/passthrough/arm/smmu.c       | 10 ----------
>  4 files changed, 7 insertions(+), 28 deletions(-)
>
> diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthroug=
h/arm/iommu.c
> index ee653a9..fc45318 100644
> --- a/xen/drivers/passthrough/arm/iommu.c
> +++ b/xen/drivers/passthrough/arm/iommu.c
> @@ -134,6 +134,13 @@ void arch_iommu_domain_destroy(struct domain *d)
> =20
>  void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>  {
> +    /* Set to false options not supported on ARM. */
> +    if ( iommu_hwdom_inclusive )
> +        printk(XENLOG_WARNING "map-inclusive dom0-iommu option is not su=
pported on ARM\n");
> +    iommu_hwdom_inclusive =3D false;
> +    if ( iommu_hwdom_reserved =3D=3D 1 )
> +        printk(XENLOG_WARNING "map-reserved dom0-iommu option is not sup=
ported on ARM\n");
> +    iommu_hwdom_reserved =3D 0;
>  }
> =20
>  /*
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index 32609f8..451fc21 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -1336,14 +1336,6 @@ static int ipmmu_iommu_domain_init(struct domain *=
d)
> =20
>  static void __hwdom_init ipmmu_iommu_hwdom_init(struct domain *d)
>  {
> -    /* Set to false options not supported on ARM. */
> -    if ( iommu_hwdom_inclusive )
> -        printk(XENLOG_WARNING "ipmmu: map-inclusive dom0-iommu option is=
 not supported on ARM\n");
> -    iommu_hwdom_inclusive =3D false;
> -    if ( iommu_hwdom_reserved =3D=3D 1 )
> -        printk(XENLOG_WARNING "ipmmu: map-reserved dom0-iommu option is =
not supported on ARM\n");
> -    iommu_hwdom_reserved =3D 0;
> -
>      arch_iommu_hwdom_init(d);
>  }
> =20
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthro=
ugh/arm/smmu-v3.c
> index d115df7..ca8b5c7 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -3404,16 +3404,6 @@ static int arm_smmu_iommu_xen_domain_init(struct d=
omain *d)
> =20
>  static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>  {
> -	/* Set to false options not supported on ARM. */
> -	if (iommu_hwdom_inclusive)
> -		printk(XENLOG_WARNING
> -		"map-inclusive dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_inclusive =3D false;
> -	if (iommu_hwdom_reserved =3D=3D 1)
> -		printk(XENLOG_WARNING
> -		"map-reserved dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_reserved =3D 0;
> -
>  	arch_iommu_hwdom_init(d);
>  }
> =20
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough=
/arm/smmu.c
> index c9dfc4c..ec18df7 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2851,16 +2851,6 @@ static int arm_smmu_iommu_domain_init(struct domai=
n *d)
> =20
>  static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>  {
> -	/* Set to false options not supported on ARM. */
> -	if ( iommu_hwdom_inclusive )
> -		printk(XENLOG_WARNING
> -		"map-inclusive dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_inclusive =3D false;
> -	if ( iommu_hwdom_reserved =3D=3D 1 )
> -		printk(XENLOG_WARNING
> -		"map-reserved dom0-iommu option is not supported on ARM\n");
> -	iommu_hwdom_reserved =3D 0;
> -
>  	arch_iommu_hwdom_init(d);
>  }


--=20
Volodymyr Babchuk at EPAM=

