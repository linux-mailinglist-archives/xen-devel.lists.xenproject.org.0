Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E87C7F53BD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 23:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639266.996385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5w8t-0000wn-El; Wed, 22 Nov 2023 22:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639266.996385; Wed, 22 Nov 2023 22:56:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5w8t-0000uV-CA; Wed, 22 Nov 2023 22:56:23 +0000
Received: by outflank-mailman (input) for mailman id 639266;
 Wed, 22 Nov 2023 22:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBnL=HD=epam.com=prvs=56903895d3=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5w8r-0000uP-UM
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 22:56:21 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59377c80-898a-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 23:56:19 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 3AMMbwSj007642;
 Wed, 22 Nov 2023 22:56:14 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uh4u5btgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 22:56:14 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6354.eurprd03.prod.outlook.com (2603:10a6:20b:1b0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Wed, 22 Nov
 2023 22:56:09 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Wed, 22 Nov 2023
 22:56:09 +0000
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
X-Inumbo-ID: 59377c80-898a-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVK0Hvc67DeCJYR9W5yfaA8dXd/ToawqTU8iFK438c0YBB5y3JKnPCq9JsBdTRsBXwQCDcHjh0EbAP0/gL3IWNHRvH6tD/aGMEdfsY97fpMVcq9foyvgPBSvCx0cS0XD0/zquDa8ZWyemGYrI9uqIe4AjA8ANdjGj+Ozb38F0MBiYJYOalY62pQTvEDEZruAh+6p8ogjkMs5FjPxGUuLtca3N4MOCYonUZZLDoDpG7OMI5q2F+cV/wW++gRyiYVEL8ciEQRMccB+0ZccMtQzdbiQt2ytPNwAog65ayqwRz/P5jbWPk7yPRwb77PKkFmp713zKnhTqy/uHf8JSTROxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgVT4rtx4sDyaqAQgUh6a1OE8aBuIehIj85TllrI8kY=;
 b=hMiE8JXrTSyY+6dppUM8NNalaSGiGdWnn/nEg6GCWAs9cNx18pT9S7dOHlu6ugXx2SSDr1yI4Flz/FDzZLilmg7E14Us356WpsP7RroWly3++x+S3mVsDjqH0RVw21zHSj++C3HUQiCvpBINAyj28AkguV9nA7NFqSGKcVzq7EceZ81nFpQ5Tz3Cijz8xhCsWKhPBn3lbX2hZnkGaUSUPmdLWQK7DgHmgl9AJU0p31/gojL9MgmdoIir35wsWH1Hf09W2ztORgnLQ9corG/2yxr/E9mhZZvpMVfXROnZg5L+YN5FJzr0wXcj1rmxwKnHan2Ps7PgBKcPedHwdYA81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xgVT4rtx4sDyaqAQgUh6a1OE8aBuIehIj85TllrI8kY=;
 b=JY+atU6cKyHuALznaITQQb/aE7EojwYNxTErYFqqOWPIjjAU56wVOTw8luJFneggKhpOfx2zFfsbq54uDzjdN6E2Atj7ilCBYD3IcXVHwqp+sFwDOnL7toNKI5VLhIOeE5/hZjYLoxDlNeeajbtU/LwyWDwrm+aJZX3gX62Rm/aW00Eb91zhCOrcsNRmkAT/DpH8XT1n7Z6n9WIPZA6xVccImASQQ2t7PbOp3rf1XEj8psnbwMdVkMzdlh7T2ssL2T531zrtYEqnEIqx4nrTQXV9I7I5AfEPHmeoU8XS4Ys0jlyM0tRiVL7o8p2qkHXDTNV1HL+nDMdNnF8JVU2IUw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "paul@xen.org" <paul@xen.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        David Woodhouse
	<dwmw@amazon.co.uk>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien
 Grall <julien@xen.org>,
        Anthony Perard <anthony.perard@citrix.com>,
        Kevin
 Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
        =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
        Paolo
 Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
        "open
 list:Block layer core" <qemu-block@nongnu.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/6] hw/xen: Set XenBackendInstance in the XenDevice
 before realizing it
Thread-Topic: [PATCH v2 1/6] hw/xen: Set XenBackendInstance in the XenDevice
 before realizing it
Thread-Index: AQHaHMeI32LlpkxN1EiN6kyRHznaJrCGkpqAgABhOIA=
Date: Wed, 22 Nov 2023 22:56:09 +0000
Message-ID: <878r6p1jp2.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-2-volodymyr_babchuk@epam.com>
 <e1663064-247d-41e3-9a36-16f81303fb94@xen.org>
In-Reply-To: <e1663064-247d-41e3-9a36-16f81303fb94@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6354:EE_
x-ms-office365-filtering-correlation-id: e68f9ea7-291a-417f-d541-08dbebae37d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 f3ezOciVlJ3nqovjzRZQ4MF0aBCsP+jSEMKV1X5WoAX0v8u2J6RdCxPLQZI6spGKG8z7d4yceP5qsjJyRfSIgUKXXiFmfhWdTHKZUNDd+6zstVuFDTyegKB3wydt3ToAiP+f7/5ByhAJX1o6FlaG9dCtHtQEfem3b7l8ARmxQpKt87qIRA5n/IW1qkQYdLJxNs1dFcsZty0rJB2eSf4cf6PGwZazl+ONLQssAXJC3SfFc94XswpqnCi3wO1vhZ8RDp06jCDZCI9ib2wEWXg17BSSqhhgXC123STonw4nA0Wqb70iUTozzvjs2mVjRsdJtzme1ei0xD6VKRuG+LZu1cia1TS5dg8B+UNqBtxHzUNj0tUaB+u/QbN/dCxhPi6BcJQbaxlaIOQiBJOrMLH28Tn1ylxfNA2eoIqeIqk3KSqi4Jo/7fmb9ahNqPeBd1F71EBmkGjbqY3tmS3qsWspcrmT6WAzi+heMhEm+4oLLa9a73MPJpPn0y2W02ccUxg3QZQFVk7TaUnSKf050WqF5F6P5E0z/HcWfPfWFC8bbyppy8JYq82ktTp7AsXWtQwimPJ0d/HeyjH6Fc8e+v5g4BjQ90bZe+PR1+tEBsV8K34wewLfqKTnCGDdr1XALfq9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(7416002)(2906002)(71200400001)(86362001)(6506007)(478600001)(2616005)(26005)(55236004)(53546011)(6512007)(66556008)(66476007)(66446008)(64756008)(316002)(54906003)(6916009)(8676002)(4326008)(8936002)(36756003)(66946007)(6486002)(91956017)(76116006)(122000001)(38100700002)(83380400001)(5660300002)(38070700009)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?9rlGkwT/fRAsQKot+gvVs0NMM4qwCBuxE3g0TO6x7pMJ3ffyN2eAV+msBD?=
 =?iso-8859-1?Q?lAsW+t/VwJy5SOAz5t8eeiYOD6KGRr31BvrXHdIYNV/qxJ3Q3i+Qr0rSZ5?=
 =?iso-8859-1?Q?UAngXUFv0LwUyU6FyTanDfB4pkmlVjUtpwp31RbBqE/zVdmSrKvB76aHDu?=
 =?iso-8859-1?Q?UazPh8meOsLVUaQaAL2I5H+pc6vEBhySvB1qpioKmZvndENGdu50VcBhnv?=
 =?iso-8859-1?Q?vJ+K/M1u4J+W5Z8NUsrWEZTdhcGdQPkiiZk8w7nyIhmMV66FiwG1X3Xu3l?=
 =?iso-8859-1?Q?dS/EgzvlcnOjKbzY+WmV+qJzWtJn9bWkfjpkLRISIpwiMhoxmiUYNmbZPK?=
 =?iso-8859-1?Q?hOZF4rQPZdY3ygmN7pI54OKXPGhjBxYHXuYx/zv9iE2zt6i/fhxPbGb6Ag?=
 =?iso-8859-1?Q?6zDSj/l0AX5moTnWlchTcWBSSYGVsIp6HpWdM2wDg5f3SU4+saTPck16iy?=
 =?iso-8859-1?Q?W7LJkIjaD7R2bdTEmAwnFH4/jNLFZanOPfmN7tHd5hNR4ugclCrPLWzBrp?=
 =?iso-8859-1?Q?XOw0R3Fj6BggSrNPswXTczCM07btBozOoxQ1Npb1wA+/Yzfbs60gH/wZur?=
 =?iso-8859-1?Q?+sm5u/UihMC7iD085QA94kigyUhaSycykmkwJgniB3mlvVieaxvyiVi4Lk?=
 =?iso-8859-1?Q?if72ZEiGEBZdN0vNQsbSqw/S7UfbbaTERpEKmhbKDNW0IwLliIScxKpvwA?=
 =?iso-8859-1?Q?ULptCj+u7+q+L8Bkz1FHJ53EiieC6q2GIXsFJqgL27gXgifNll1lsBbLAj?=
 =?iso-8859-1?Q?coFQpl2ks5l9+VsQytz8WVAAmWwQP53AMbJ07g0+FDMKmvaoCc/j1euOv4?=
 =?iso-8859-1?Q?E1/K6xuL5GJ0KZB/NAhralphgk09lO+xF5Arhdm21HLVV30ClULiVZLNkd?=
 =?iso-8859-1?Q?Rw87fczJx3Qq/HOYNCEhz8UxUZK2jXHr3LcGt5g/ej47A2djb7ZOx/J1pH?=
 =?iso-8859-1?Q?RT/ZWJu1igNGvF8TMW2Fg5MHkaIs2h6/QjEaS2MUL7VBwLRG6BFFtvpibs?=
 =?iso-8859-1?Q?zrolTEuNcvwCarmo2GJKgLtezFvT9/Y7zfGNUjlSGAwylXYrohopdJODVr?=
 =?iso-8859-1?Q?2ppKXCEJ4bTY49ESVeMUcIPpMls1ttSh/kRwrr1QWydqW73eCeR8P7RQMb?=
 =?iso-8859-1?Q?74zoYxN9bCT5EcoVXI2ify6XvR/F4A1s6YH/3dlfyZR+N/ln9TdkMKXNWK?=
 =?iso-8859-1?Q?jPd0bSMr1mJH766q2KHCV7UyHTEg216QE01wr08wPG/nCwEN2LfLZ8IDFY?=
 =?iso-8859-1?Q?AcmnxcWHDebNF8QhinF9XJa5qncgtDjdelqOnW2pa015uhDO7lf33ewyIg?=
 =?iso-8859-1?Q?BEXNWf+YTDafbYcTBQgzz1LnYbzRWj9a61N25XmlW6LI6dFlbprGWvLktf?=
 =?iso-8859-1?Q?snOsBKqXnjFyi357XMhnesJgfj1W9tX8rwrb+J4cdjr5jtvlSqKPvViVs7?=
 =?iso-8859-1?Q?drxtij3dxOjCii6YBsZQv1U9RuWWAriumiCjPWNJ3IIVPpZ0lvEmnVBKWO?=
 =?iso-8859-1?Q?iULBrr2z1OVHaOR+Cne8HXIYtdprt5Eg3y9SbgJ+LyXifBmwyJTJ4Ayb3v?=
 =?iso-8859-1?Q?/t4nZlO/k1G0fkxcjiJxPOuM2wrULFFqNygnjf50nPCT/B/vaUfMjrNvwt?=
 =?iso-8859-1?Q?L1WglNOhU9M1cIQ6Xauw4lLXXvRaMxHvUyAZoql4ymk1JtbLBStl1hcw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e68f9ea7-291a-417f-d541-08dbebae37d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 22:56:09.6316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQbOTEJ7Gj/rw2cDsD3U9JCGHMTUljn6g9AizomJvqPfNEGqdWtHpzPsMmsAvtqtbXZ2QuLbkfgoal9Mc8vVUpBmASLx+iu1XnlBlly2IGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6354
X-Proofpoint-GUID: q13b_9xBRvl8DD0XlGH9LaUgtzxPsCSt
X-Proofpoint-ORIG-GUID: q13b_9xBRvl8DD0XlGH9LaUgtzxPsCSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_17,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=13 impostorscore=0
 clxscore=1015 bulkscore=0 mlxscore=13 priorityscore=1501
 lowpriorityscore=0 adultscore=0 spamscore=13 suspectscore=0 malwarescore=0
 mlxlogscore=82 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311220168



Paul Durrant <xadimgnik@gmail.com> writes:

> On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>> From: David Woodhouse <dwmw@amazon.co.uk>
>> This allows a XenDevice implementation to know whether it was
>> created
>> by QEMU, or merely discovered in XenStore after the toolstack created
>> it. This will allow us to create frontend/backend nodes only when we
>> should, rather than unconditionally attempting to overwrite them from
>> a driver domain which doesn't have privileges to do so.
>> As an added benefit, it also means we no longer have to call the
>> xen_backend_set_device() function from the device models immediately
>> after calling qdev_realize_and_unref(). Even though we could make
>> the argument that it's safe to do so, and the pointer to the unreffed
>> device *will* actually still be valid, it still made my skin itch to
>> look at it.
>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>> ---
>>   hw/block/xen-block.c         | 3 +--
>>   hw/char/xen_console.c        | 2 +-
>>   hw/net/xen_nic.c             | 2 +-
>>   hw/xen/xen-bus.c             | 4 ++++
>>   include/hw/xen/xen-backend.h | 2 --
>>   include/hw/xen/xen-bus.h     | 2 ++
>>   6 files changed, 9 insertions(+), 6 deletions(-)
>>=20
>
> Actually, I think you should probably update
> xen_backend_try_device_destroy() in this patch too. It currently uses
> xen_backend_list_find() to check whether the specified XenDevice has
> an associated XenBackendInstance.

Sure. Looks like it is the only user of xen_backend_list_find(), so we
can get rid of it as well.

I'll drop your R-b tag, because of those additional changes in the new
version.

--=20
WBR, Volodymyr=

