Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F277B48A65C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 04:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255587.438002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n77t6-0003Xz-3m; Tue, 11 Jan 2022 03:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255587.438002; Tue, 11 Jan 2022 03:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n77t5-0003VR-VM; Tue, 11 Jan 2022 03:31:55 +0000
Received: by outflank-mailman (input) for mailman id 255587;
 Tue, 11 Jan 2022 03:31:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lVH1=R3=epam.com=prvs=3010f02d57=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1n77t4-0003VL-QG
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 03:31:54 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04167d2b-728f-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 04:31:52 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20ALPM7P025029;
 Tue, 11 Jan 2022 03:31:41 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dgth0gudq-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jan 2022 03:31:41 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com (2603:10a6:102:201::14)
 by PAXPR03MB7822.eurprd03.prod.outlook.com (2603:10a6:102:206::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Tue, 11 Jan
 2022 03:31:35 +0000
Received: from PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6]) by PAXPR03MB7594.eurprd03.prod.outlook.com
 ([fe80::157a:fb23:aa6c:f0f6%4]) with mapi id 15.20.4888.009; Tue, 11 Jan 2022
 03:31:35 +0000
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
X-Inumbo-ID: 04167d2b-728f-11ec-9ce5-af14b9085ebd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6SLmN9n48jr96DenMu2GU0w4JGSacYijuUCyS/sYHNd3e7dF1KajbBmWrvW7i0wQ5iNEwU/sr9G4Ftu3uxr+XboShNcE9bYfl5HIveJXtajN3VQ2dT8TfBM9Qpvdb4yXwNHQz5xH5/q7Yd3zZvYLwe8Zd+S0CcLOJDUQ+hGPI8gCsckq3roh7S2BfMbtQNqGhVtaBRm/2y7E9mewait5/Q+tC4vOQBEhxHtvbcHmCWCnuej6fZL7p8gASEj6Ad/qDqpqR/3et/yACuaJnqGImy4NBykKsFiRySRO7RYV4dT4M9IrVzTAa01FVVl5ItPsJvBlGKcvV6iUVI0WLyyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2pP5wSmWXEMUMe2pEoj+gAD8gBmkdlW+dejDRYAZhM=;
 b=BFuuPlQKpMKpb4Ie+RCc+3TTRxlSCeZXT69fa597+VUNPy9xbXlM3S8s+H7jQCyyyG2i0CCWv4H9cmx1bOAlZXD76k43dTscqM5STDD7me7di5f+xd/CTvotnKcAbkgl56Sl3mc1FPOplDj8uHfaqZspXSL1qSbyEjzVzSKujtyfQUxrQLBXeTdahpeuVZrnlOMeItrORZMGq0T1W1vwL5gYoldnPzB8lv5ZcNFi+qeAJdZfGT0gtbWKlS5ghK+ycumbO3GDbnetgLjYxIoQvfcLrEbUQaQFUYXG2LNN7df/BDSgUDN0qzAxh+AmWB1j6gKsqCuEnC/5nw6jIoZy2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2pP5wSmWXEMUMe2pEoj+gAD8gBmkdlW+dejDRYAZhM=;
 b=m7+zXS3BV7uMNtd98yx+54CPJbADtMycf5wtBGGSe515yQwjpd/2JZ2ZsKvgfqY5OYABCMPVAvkYzVxPPF73KZzDT118t53dJJkpZdilQeg7WEq8ZqHUfVa1esxacuemb7IV35SwGVohwWtKYIq+n43ZyIOU39dWDSGnJJdBIzmCY9Z/nIaIt04flt0PObntICAmCVRvMnIbDeO5l0WZKd0WSfz5UtL/xZhhmlVHDdk6BOt0IBrNNJadD/psc25tTU7wZpknyH/ybYI59uuPW/RY+x14TNUQobLF0U2VXw1oXpLJDPoxWXHepRuIQfKS4McdWH9IPnLVNILR19B6mA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        Stefano Stabellini
	<stefano.stabellini@xilinx.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [XEN PATCH 4/7] xen: introduce xen,enhanced dom0less property
Thread-Topic: [XEN PATCH 4/7] xen: introduce xen,enhanced dom0less property
Thread-Index: AQHYBCmUZq6uCSINmk+9hkbXe5MJhaxdLiWA
Date: Tue, 11 Jan 2022 03:31:35 +0000
Message-ID: <87o84jx81g.fsf@epam.com>
References: 
 <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-4-sstabellini@kernel.org>
In-Reply-To: <20220108004912.3820176-4-sstabellini@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.6.5; emacs 27.2
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 279849ff-1b28-415b-f5e6-08d9d4b2decd
x-ms-traffictypediagnostic: PAXPR03MB7822:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PAXPR03MB78226FB5A76CE210216CB449E6519@PAXPR03MB7822.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /f7FZvvXUEFLEpx43LT0pLUv9vRgo0cxevkCpTZ/Wmey9tMT0YZe1oh2ctkiAZrxENOyx0gDl6QXc3RmoB8GR0lYOXzD0lolBeqRDS6aJS6Wie2fOUKNKUBZJms2IyrY0zU7mpj9+FgnnyzTUrcSMCRiCldo90OqEzhxC1srb//ZeIVaJCIAt8sDZ0X6aYdYVchkpqcLN7mwLC0hopWvzj7QeAWCbyn7Q2M00jGiO/huSgJnZe33iDApZgNozMOUvJmsPYQ+wvSbuNgIXXQtWUyr6znMkDuwaMyViYvlMnQ3C7EdcRWvVPSyhFfzNv4wpGq/lqkoSBf2SLbkyxeSSgkzqOMV4YB6SgAQmhOzyp02rGADnUONfEC14mpwOginjUkr8oYsVUc/u48ZO4Nnxav61NXRQVZcxgSN8C8MXFPBOMyCeewqhLw/MJpfXmjuVJ4SqCFTcbL0R4xwY2Pw2X9jd2aXkpijTGXlOzNSPnNSaO/NO0ZQ03P4shduhBJToNTRb0XTaHDTRiEw/Wm9BkVv08JQOiqBF5a7q9hTdbAZfwFIzSEgI3wwCChrwG/VpXgkppdQaY4auDrDplmdOg4uA0plVVXAuMpVAPc7V4zmVXGGAk9maGcbWviDsUHLIFv/uPTSowbmNFdIxCE6RCHfqhM7xEU/R2nTwMGOViS4DZvlNQVqbZCI6vfC74OTlreJw4L5a/rl3UGyiZ5eEi7alGwuVyPVVW7AIMYKy6A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR03MB7594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(54906003)(186003)(6486002)(8676002)(64756008)(66556008)(66476007)(6506007)(5660300002)(86362001)(8936002)(316002)(66946007)(83380400001)(36756003)(66446008)(91956017)(26005)(76116006)(6512007)(55236004)(38070700005)(2906002)(6916009)(508600001)(122000001)(38100700002)(71200400001)(4326008)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?ax5KFGgoLtam7hLMbRRQReIlB6SPuOzjbFn/anzrbz4zQxGxkYcua1K3Fk?=
 =?iso-8859-1?Q?nKBjCtJUki8sIpv2UkXd9rl2mljCsZnYk+z0ooFmS6YUkAv2imM1UjxoIu?=
 =?iso-8859-1?Q?xTgiomk6Ndec/0NWA8w8oQ7+QFp32Bq6nejq/5sx2LniNSipaOFQO1Zn1n?=
 =?iso-8859-1?Q?8wNqoL7+LMnzlM1bhLIOTwI7DjTXzhQb+y1FjRNqkPam538qkmQ9/jiN0n?=
 =?iso-8859-1?Q?fNjjUiamdMUsLgwY2wowY+nvrExvf9WcUzXDJXwFTzG/f3zNGYmW/dgPJP?=
 =?iso-8859-1?Q?9LLJo4uP56NdGQBvZEDpIZpl9FALWK8XoyIOG298j2lGp7pZmZsS5O4n0Z?=
 =?iso-8859-1?Q?ZufPPQnQM9Fbo8qjDyJyz1zmRt3v+DD1PHsjIrd1tLwQrBkMr1lSqZQTXp?=
 =?iso-8859-1?Q?5ub0II1wutZTzDkb7h/rowt2ExJFjnP+Ul/2vI00IgAmwgmoS6p91g6m5g?=
 =?iso-8859-1?Q?Z0K9/AkDAw5LHUuCA30YdLZalK+J8yRK7sNXQQ2EJ5ky/CziHVoHyZzHnP?=
 =?iso-8859-1?Q?HLoL4tTlaoeVU61sz2831+d2lxGW34IzWTNt393ylL3kuXabtkjodMhOJW?=
 =?iso-8859-1?Q?MCx+DWvyb/0BUM2yfgFuyOnGMl5C5BB7hfqeCFqW2XwIEBsTKDIGt608aQ?=
 =?iso-8859-1?Q?GAJu8XZgV811R0Um++c4YtHjAUCX2ld1SDFy4I/MJ8MI8pAAJtrOtexg8u?=
 =?iso-8859-1?Q?MjBXBGQ2eslyuXwXvnQdHNPRz3I9NSMEjMQJSVIox/kYyMIKr1wSutHd+n?=
 =?iso-8859-1?Q?BrJQID6G1FRiVhr3m2MN5c1Ipr79Gi62jjeneBuax7L3Ds9hYO6m7PwFJq?=
 =?iso-8859-1?Q?srvCtNqc/OAhj5XK4+XdiamV1OdfOcyQtqau1fxwLtsHJBa3/Eu6uAEloz?=
 =?iso-8859-1?Q?hTfiiG1dZLqs2WoVeQPUjO+PbqVau23PAqFXdKYIQ7U1FFZQ/iKAAtpi02?=
 =?iso-8859-1?Q?guuVtsvPXBNZqOGoJXtnKV3DV+XEKFmkeaOuwJ8/giR1L47v4JLxqZD4yi?=
 =?iso-8859-1?Q?S2vTXTJU5dV1wueTnk6j0wxFzF5qreeJKNxe8YkZ86TXEeMXS/cTE1EsyF?=
 =?iso-8859-1?Q?CpdRmXkW+pvSvMeF/rWij+AZ7wU8CzyYgzqPpAZzuBgkVjU/Mc8iIJqnfK?=
 =?iso-8859-1?Q?6XoPfL55i8lWn1DKmhV0ni018Pr51KnJeoLugbkX4RhT+FYo6B9287eFTX?=
 =?iso-8859-1?Q?S5zb5cgXTqkjO+1lgR3TRhd7kNiaKvLM57rU5laZ6h1b0whnhcXBWhjgkc?=
 =?iso-8859-1?Q?/qxlPr1536RvK/L8MKgG2LvUmkpeqTN/znJ2EPM9t2fA0zBObi4aVQAdBL?=
 =?iso-8859-1?Q?RNojqMUBeVREm9/EiZf3HRh36byhmTzgRKs2UE9/OlAxmolfwOJNPJ9LBb?=
 =?iso-8859-1?Q?h5icBUMykmVnU7TWvC8Ac2vNRUIyw2ycMv4bXhzM4dGdegUsICc2+px64M?=
 =?iso-8859-1?Q?wHZJx/IklHTGqltoa8RFcxSB18Ef7eDEnsCP6PjbRKb/3F7Y48lCjCo0FP?=
 =?iso-8859-1?Q?ZHPy/iX8N250Zj7qHvEp8XCE5z2oiydyH8DpPPjF9Q0gbp+i5u84jZiLbM?=
 =?iso-8859-1?Q?u2X7hkuCGJZg6epuHLREcogoJdZ5gZgrNTQ7gPt4CT8IIlj8lXhSZzIQqG?=
 =?iso-8859-1?Q?jPqv+lvCC4bmQQYE8mjzqxaAKzQ89dtgQH3BPDMMvr/7uEk5MiaqfcXpTD?=
 =?iso-8859-1?Q?bvcrR8TDak3B6AJk5zN8wFgukwK9b3b1cHatocW8yhCIRlpypn77N5Jgb2?=
 =?iso-8859-1?Q?IKfFT6643IH8IEvliJy9KpMLs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR03MB7594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279849ff-1b28-415b-f5e6-08d9d4b2decd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2022 03:31:35.4911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSyBPegF+UuPVYck8WBt96x92A4lKLNw4Ab5NaROymlyMjg6CXb5TcNM6/4P4BIHyyD3XJQGurBRUdKEti6pxjhnqyia/fHTdb+dWiT0u70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7822
X-Proofpoint-GUID: 7FyjwIfyRD81zcIRn37yUCQnpxY3JbkH
X-Proofpoint-ORIG-GUID: 7FyjwIfyRD81zcIRn37yUCQnpxY3JbkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-11_01,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201110011


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>
> Introduce a new "xen,enhanced" dom0less property to enable/disable PV
> driver interfaces for dom0less guests. Currently only "enabled" and
> "disabled" are supported property values (and empty). Leave the option
> open to implement further possible values in the future (e.g.
> "xenstore" to enable only xenstore.)
>
> This patch only parses the property. Next patches will make use of it.
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  docs/misc/arm/device-tree/booting.txt | 18 ++++++++++++++++++
>  xen/arch/arm/domain_build.c           |  5 +++++
>  xen/arch/arm/include/asm/kernel.h     |  3 +++
>  3 files changed, 26 insertions(+)
>
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index 71895663a4..38c29fb3d8 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -169,6 +169,24 @@ with the following properties:
>      Please note that the SPI used for the virtual pl011 could clash with=
 the
>      physical SPI of a physical device assigned to the guest.
> =20
> +- xen,enhanced
> +
> +    A string property. Possible property values are:
> +
> +    - "enabled" (or missing property value)
> +    Xen PV interfaces, including grant-table and xenstore, will be
> +    enabled for the VM.
> +
> +    - "disabled"
> +    Xen PV interfaces are disabled.
> +
> +    If the xen,enhanced property is present with no value, it defaults
> +    to "enabled". If the xen,enhanced property is not present, PV
> +    interfaces are disabled.
> +
> +    In the future other possible property values might be added to
> +    enable only selected interfaces.
> +
>  - nr_spis
> =20
>      Optional. A 32-bit integer specifying the number of SPIs (Shared
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6931c022a2..96a94fa434 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2963,6 +2963,7 @@ static int __init construct_domU(struct domain *d,
>                                   const struct dt_device_node *node)
>  {
>      struct kernel_info kinfo =3D {};
> +    const char *enhanced;
>      int rc;
>      u64 mem;
> =20
> @@ -2978,6 +2979,10 @@ static int __init construct_domU(struct domain *d,
> =20
>      kinfo.vpl011 =3D dt_property_read_bool(node, "vpl011");
> =20
> +    rc =3D dt_property_read_string(node, "xen,enhanced", &enhanced);
> +    if ( rc =3D=3D -EILSEQ || (rc =3D=3D 0 && !strcmp(enhanced, "enabled=
")) )

Are you sure you need to check for -EILSEQ?

From documentation for dt_property_read_string:

 * Returns 0 on
 * success, -EINVAL if the property does not exist, -ENODATA if property
 * doest not have value, and -EILSEQ if the string is not
 * null-terminated with the length of the property data.


So, for me it looks like you need to check for -ENODATA.

> +        kinfo.enhanced =3D true;
> +
>      if ( vcpu_create(d, 0) =3D=3D NULL )
>          return -ENOMEM;
> =20
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm=
/kernel.h
> index 874aa108a7..3275f7fbca 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -36,6 +36,9 @@ struct kernel_info {
>      /* Enable pl011 emulation */
>      bool vpl011;
> =20
> +    /* Enable PV drivers */
> +    bool enhanced;

Maybe dom0less_enhanced will be better name?
Or what about dom0? Should it have this option enabled?

> +
>      /* GIC phandle */
>      uint32_t phandle_gic;


--=20
Volodymyr Babchuk at EPAM=

