Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E13A47514D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 04:21:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247179.426189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxKq9-0000vT-4R; Wed, 15 Dec 2021 03:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247179.426189; Wed, 15 Dec 2021 03:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxKq9-0000tU-17; Wed, 15 Dec 2021 03:20:25 +0000
Received: by outflank-mailman (input) for mailman id 247179;
 Wed, 15 Dec 2021 03:20:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4EW=RA=epam.com=prvs=29836cc2ab=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1mxKq7-0000t8-HU
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 03:20:23 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee37facd-5d55-11ec-9e60-abaf8a552007;
 Wed, 15 Dec 2021 04:20:20 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BEJ0s4R027920;
 Wed, 15 Dec 2021 03:20:14 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cxvm99wfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 03:20:14 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB7715.eurprd03.prod.outlook.com (2603:10a6:102:207::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Wed, 15 Dec
 2021 03:20:11 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 03:20:11 +0000
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
X-Inumbo-ID: ee37facd-5d55-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mfi9cgOuhtFzFBD3ZLMSiY7iVZUCjYkFLR8KRGYwJOGBWpccpCkCsrWIykA+PskO3nITuO9PO6agze8cpxCRPG/Zx9ZBfQhPeWNEEm3PJu4NhhZU/tixDUSP+QtyxADHp+lktDCZqebaClmpKBo4bc7J/Rr1/KcVnopzqxLE0VYVCza58h7FNSi6q8oWWrOj9GY8uaG7lh6m5rWek1Bed/beLVyDotGDHgl2KYkA4XquzYp/oObeL5+a6rPavGOywehatW4dMcFvPzqL89WRx5fLUn6Qi9zPUdCqFIhjmtfNTV3AXPwJ37kV3O+JNU39O+zg2elNvc8iWXbJRFYO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3qRzOHYtX1Vxycy0gv1vnca2TPm+x3DlcCGqKQcMUs=;
 b=Rl4hnk/S2VKXeOe3/wBbVtUtEXVS6ia6TD8okKDxck9Of3j+QholZnKWCcRhrDlE1KkcEhu9AzEjqBExAwhBt2PfMU3SdhU2wzYttLq4Xg0Tn2623nTE5IjjAaCt4uep4C/OINM0KAdit7NSZKH3Wi11XA8gXUeBjuKRwMgEuBZAgmR6emTxnOMmybZzi/SUoGd9R7Rt7nEwJgRCkXlbdxWG8s8oLawBHBVlEjbbHwu13dxWLo4mLnR1NIw5UkLZRna+rhc81I8H0Rw2mnKOzHwJBRmM/BtjxRO4iMfy4N2fbyV3kllK+fmhtIDieRduVT//yQDvhWC9yNvox4KmRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3qRzOHYtX1Vxycy0gv1vnca2TPm+x3DlcCGqKQcMUs=;
 b=CiOyo2QLhMsEIx4JnZvZw5m1c+3qRZPnim5NhP418sJxQLABHxaR3S7tf6VrkwWL4twyU41QkSlozPHQFzdrEQrVHIUiKePjDYSnCN2nikE3Lm7MO57C3j3obY07g9qEt9mA81AFp6lqmOOY+MtFzaRjQDbxWQZ9G2vATIu+Bp3QU4XxpX2JwYLx7AVmuG9uCwp7Dd3d3rTdnMGrE6niVHdvk1zgw3677M9cjj+ObHMFP7SoD8knA0Vo39HzJOFcmaaIQYWYdoL1i3Gno8ypxu40s3FRwAvqKqZP7rMGCriJAKmANl3xlpwChrWm+XoPWKHnaqIn2H+H5aTvyygmIQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 01/14] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH v5 01/14] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHX4ewD6xGoUYTQl0OPrjjPmZfF+KwzAP2A
Date: Wed, 15 Dec 2021 03:20:11 +0000
Message-ID: <87zgp2wo45.fsf@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-2-andr2000@gmail.com>
In-Reply-To: <20211125110251.2877218-2-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 75e62379-f318-413b-2516-08d9bf79cddd
x-ms-traffictypediagnostic: PAXPR03MB7715:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB7715BE6B83FE7B6AD0573D15E6769@PAXPR03MB7715.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cosjT53zWrERAopdU4Htc7ABRgk3iBNw6AtQYwxWVTASluZsmGUF200Xt9WfFbI145zY/c67ICTXXrix1HrbzN5dCBrllyN//e0nBrcG7xv9R15oexQmHW1X07RNrjL5fFMTZtIM1jvE7hGZnP775Yi6Tjj+oollvLsgmopHvRQktQh+TkQht/S516q/O36Ca9xCk9whV/33qdZAmq9S56v4VNyElBazC8RLSye6BCaSaYXgqhouNNOzNen0qiDmLZXbCQJSKfxDyWOIkVrMPzq3Gj8eoYSQnvNkv5vqjH6uv/ZGO0/pjpiU3Foy4lYA167JE4RpBvBevZzzenp2yPehP9FWghmxoFIocwx4uEm9GjuuL4iurK+1rpx7GsbAuY/K47yHMUiJZCjQ1Gu7cDcgAEcQK7p9NCUMUVeWxKFAFTY4w2cKOuWsmIJtM2Lz949CfD4Q7BGf5oiBUoR5+iYSRHDsV4CbWZj9pV0UMRSgFFYnZKGoHFBnvBFNZ1VGjdshr4QFBobCK0P/Q/It1i48vz+hvfS3bfgKHcnrHaCk/XELYEifioaHEtadlTfWGdASpI7WUqiz4GOczZvxVMVWgo6gj3y76mCd67EG3hkB4k6vwvYV61OmpdRp/71Y4OguwAEh6uFVh0zptgTkfRN9vyDvGihdhfx9F0wF+IDAIG9zT/HOH1Sn8uqwS50OsGUK/L3L726uETPCt+5V8A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(2616005)(83380400001)(38070700005)(55236004)(186003)(26005)(66946007)(36756003)(4326008)(38100700002)(107886003)(508600001)(6506007)(122000001)(66556008)(76116006)(7416002)(5660300002)(66446008)(86362001)(2906002)(316002)(66476007)(8936002)(71200400001)(8676002)(6486002)(6916009)(64756008)(6512007)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?24zMXKiDO7q9rItcEgvzzu08k26CD/f3t8uBPQgSW5ieAxLr72zE9I6pN6?=
 =?iso-8859-1?Q?1a8I4Y9h+kKWVfheHC9C4CC7zwqpVFGUVDkAOlpkpgprVnl97ZyAUCZgsM?=
 =?iso-8859-1?Q?8fUiKu9A18cg/GpZQm+49AeFGxZOaIiILaRRTePo6q2gM6AJXEzgFoy0MD?=
 =?iso-8859-1?Q?XopaHT1XLEU40e51Sz7vuB0KSYAfWcXhW3HxZrXNaIPDu6yPmbxRARlfxe?=
 =?iso-8859-1?Q?ea7aEvZH6moA1J/gSmHBPZ0+oOkW7JOh1yNhoQdtRINOs5Jr2zmTcvv0AA?=
 =?iso-8859-1?Q?7SKN7gePt+PNcb/TcT7IjQllV+r/+7eMIjiVhdH9wnmkp6EmYblHc4gy2H?=
 =?iso-8859-1?Q?dbGeqhdVOzUGnIGWC9NIEhR9MO3RCox3R5zsDfj1T8iGJIBNNygPVds00L?=
 =?iso-8859-1?Q?RrOfEmpQxoFJEUKx4jWMoWd+wUYMvw+VELoxPDICNS3UiNTrJPBTeTAW4A?=
 =?iso-8859-1?Q?n3F+SG6gLuzFtPih1dqOqNtSUAwPQAQL31GyKplrGb5Oqp9140gMnQBTfv?=
 =?iso-8859-1?Q?VRInYWEJLcPaCJ2dNYdAaHs6RNsdYs/gzjs6xWN6LcmLuqiBYWnatkHbyX?=
 =?iso-8859-1?Q?awJyme6M34xpyvFuVs2ShE4djsex//XAJ4m12ND46cDwiUI8YMaxQRUIcd?=
 =?iso-8859-1?Q?0y+vDdMCQh6wZnxCuRlCclt9ADzWzMV6th6QPHZJQvF8hXgcqYe4QgEAWM?=
 =?iso-8859-1?Q?pgphPfXWCFUzfnXmzP9tFfx3LU+ywTw2nlSV2U2eFiSFVynXe7hL2fY8za?=
 =?iso-8859-1?Q?I2qtVWi70AFZkQjjRVE1+/qDgOz5/TEiDedhf0OpjhkJ5kSn/9yChlnPWZ?=
 =?iso-8859-1?Q?H8DGeQ6u71J39cfRDYpyImdVVBlV16K08J7mbvgUKy7jnjwZOCxb9wyBHP?=
 =?iso-8859-1?Q?RX21qfT+3bNOn6g5iT//KMqx4YYi6apOQ/rZBCqcoc0thFSOYgbnSCmqsh?=
 =?iso-8859-1?Q?Bnay7BOswIATr+1VjbIHglNNLeXAW0WAS5FivyNnR4KMvXpeJBBsOUHf8w?=
 =?iso-8859-1?Q?B2NvH2s1D3tD8ng29PEX8VliNvutZeyNwB40YP67ciKPkPixvY/lzKeGL/?=
 =?iso-8859-1?Q?I1xP/GaN/Xl3tdOT9hOGWJVJ8WZGXEzYiF9SCSET0lHj5JnB4cCe7CrH3R?=
 =?iso-8859-1?Q?jFKK8P6gd+4sxurD6M/javih2CNIVVl4xs5REzgzMgk3L189ZU1kmuAqoR?=
 =?iso-8859-1?Q?FJc/fM4WsMkGsJYEFSiz//Q26RCRwmwZeNfnbujgJkih/KU5deFQ6eIhNc?=
 =?iso-8859-1?Q?0zZnfEoxDfg2JTHqAzBg7TcRStngcBI85vjQOKLVBXVHhSlhM/EKH+ZXEG?=
 =?iso-8859-1?Q?ogZPry/8g12xX3nDOhwUvU926k52m/dlgnyefUx2yv9X1QHu+lmv90pQ5P?=
 =?iso-8859-1?Q?dq2sVatFucGuQNa3v5J88cz+MOivzKCDNNGg3aCgPOePmjqu4iZewTE/T6?=
 =?iso-8859-1?Q?QfKjmp4T4wznAxjHPD1svtrZ/lsj4pplE8VZnOyRh8PB3WsIY9907Zn1n2?=
 =?iso-8859-1?Q?jS2hgl4TQjESuv3gkvo2d1xgY4t86ECfTex6xTsXq+Ai1Y2c4Ls9SrcJaP?=
 =?iso-8859-1?Q?OTREoYWsgra+NO2dFr8ukDjeo8DLR0PdMQpZt0xwaX2kQwo3JJH6bkTRuN?=
 =?iso-8859-1?Q?zrD+zv0S7ObWa+ZRJgrF/h6fdtm2frsO/i21ylZf8xYbRp8hOyy+0ZmTY+?=
 =?iso-8859-1?Q?mBOIej492wBWwEgdS+tN8XM7EjMpDLjDOjBm7nK/7QsMNz1a/rpTxdCKFh?=
 =?iso-8859-1?Q?GFWqlqOHlv35e/dkLuZaEqIkk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e62379-f318-413b-2516-08d9bf79cddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 03:20:11.4468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kxdONrbOIaF2L69aPRQ1CbLdpQG9x6836yIRvltsw1Esqk3UBWvBKbj4M9KrcoOT85XpmbeOmGiyF46fuZO3nCKkt2MHTi8CHo/lP8xve3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7715
X-Proofpoint-GUID: TMTTRym1KVZJRqeZ4W8ZeOGMYh-37w-D
X-Proofpoint-ORIG-GUID: TMTTRym1KVZJRqeZ4W8ZeOGMYh-37w-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_01,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 clxscore=1011 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150017


Hi Oleksandr,

Sorry for jumping in amid v5, but...

Oleksandr Andrushchenko <andr2000@gmail.com> writes:

> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> There are range sets which should not be printed, so introduce a flag
> which allows marking those as such. Implement relevant logic to skip
> such entries while printing.
>
> While at it also simplify the definition of the flags by directly
> defining those without helpers.
>
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>
> ---
> Since v1:
> - update BUG_ON with new flag
> - simplify the definition of the flags
> ---
>  xen/common/rangeset.c      | 5 ++++-
>  xen/include/xen/rangeset.h | 7 ++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
> index 885b6b15c229..ea27d651723b 100644
> --- a/xen/common/rangeset.c
> +++ b/xen/common/rangeset.c
> @@ -433,7 +433,7 @@ struct rangeset *rangeset_new(
>      INIT_LIST_HEAD(&r->range_list);
>      r->nr_ranges =3D -1;
> =20
> -    BUG_ON(flags & ~RANGESETF_prettyprint_hex);
> +    BUG_ON(flags & ~(RANGESETF_prettyprint_hex | RANGESETF_no_print));
>      r->flags =3D flags;
> =20
>      safe_strcpy(r->name, name ?: "(no name)");
> @@ -575,6 +575,9 @@ void rangeset_domain_printk(
> =20
>      list_for_each_entry ( r, &d->rangesets, rangeset_list )
>      {
> +        if ( r->flags & RANGESETF_no_print )
> +            continue;
> +
>          printk("    ");
>          rangeset_printk(r);
>          printk("\n");
> diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
> index 135f33f6066f..045fcafa8368 100644
> --- a/xen/include/xen/rangeset.h
> +++ b/xen/include/xen/rangeset.h
> @@ -48,9 +48,10 @@ void rangeset_limit(
>      struct rangeset *r, unsigned int limit);
> =20
>  /* Flags for passing to rangeset_new(). */
> - /* Pretty-print range limits in hexadecimal. */
> -#define _RANGESETF_prettyprint_hex 0
> -#define RANGESETF_prettyprint_hex  (1U << _RANGESETF_prettyprint_hex)
> +/* Pretty-print range limits in hexadecimal. */
> +#define RANGESETF_prettyprint_hex   (1U << 0)

If you already touching all the flags, why not to use BIT()?

> +/* Do not print entries marked with this flag. */
> +#define RANGESETF_no_print          (1U << 1)
> =20
>  bool_t __must_check rangeset_is_empty(
>      const struct rangeset *r);


--=20
Volodymyr Babchuk at EPAM=

