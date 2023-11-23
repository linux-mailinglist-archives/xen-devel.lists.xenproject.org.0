Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60207F5EE7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 13:18:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639688.997313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68f4-0003k7-OP; Thu, 23 Nov 2023 12:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639688.997313; Thu, 23 Nov 2023 12:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68f4-0003hW-Kn; Thu, 23 Nov 2023 12:18:26 +0000
Received: by outflank-mailman (input) for mailman id 639688;
 Thu, 23 Nov 2023 12:18:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0YW=HE=epam.com=prvs=5691553e4c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r68f2-0003hQ-NE
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 12:18:24 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64d49bd5-89fa-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 13:18:23 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ANBD8bk026972; Thu, 23 Nov 2023 12:18:11 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2051.outbound.protection.outlook.com [104.47.2.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uj0g5san6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Nov 2023 12:18:10 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by GVXPR03MB8428.eurprd03.prod.outlook.com (2603:10a6:150:2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Thu, 23 Nov
 2023 12:17:57 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 12:17:57 +0000
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
X-Inumbo-ID: 64d49bd5-89fa-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0pGYeemUvqIqkf1OxR/qjN6Oi38k+4x63vNPJZd/ch0cVykbEa7Imm+VlLtBuQfNRCefA+PwackGFclVVnQrVerLm0W+U1zyWdeA4IELGJoGIqwWAx3ig+pRuw/HwIaw75SeZ1dMxBvyjll2EONZWGAmriYSySrhQ1UMDAzLs2pCPydqnUj8nLeqgVjOQlFBPDoKe4eKymYrGC/i0N1nVYV4WsoEAY1M7BtoNRDI4KWVTqthI4p82uKn+Ox/nTXA3R0sUfkeGZbfqzt24f+U+Ou+fiwQXPlECh5755lNBrVVW52HievXKwKeBqmt6POMet/H/VnSdRirsLsXjP7Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+0sv1FgfciTdIqpRKA+4ejvw1lyXLNxJsEWq5qi5Bo=;
 b=moLlh4qZy/vkgGUP0InqLQ40jJgBJ8V9Nh3YLodmNT8+/0CJR/WxR3PlUOIWNE27CgmZxX+9gwtvxYUFdocWF/B1zCczWEKGPuD1MT6EZRFaPQW7kuBYSXpEsV1MpbUSaNIQ32r1ItEvJvZQ53qBAvQ50uEQBPDDAFV7nA9Iu+HdxIL8fXjAUaJK6yrVaxyKO1lOZEqP3vwbIye+pF5LwyVV4ZpYX3epyTWAzpkQl9syqmnurZkJvwsfWBo47Y9LgXEsP5JPgA5C1NYQ2SbLLBIgfAs4iADeKEVPAL3Swoob+vF57/FpTU/G5b1EeoTyuN/4xwOgsDzbjwtbVbiQvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+0sv1FgfciTdIqpRKA+4ejvw1lyXLNxJsEWq5qi5Bo=;
 b=CVF2ktSW4YYexZWwW9Jm/nxcjaXGSaV76W7SApFJWoyLHqtdxE4Emx5fHuC7ot9nvM0cNe1wf5PTDqOdhyUc1jTIvYxXICC59T0DfhsuL7CNqk4syK5Wbkn7eUbSUSXId4O2dcTut2i3GIZ5eSv9ssP6j6WNbJatnAJzJzv4WEREMjKXiyuq5j+ISOlYfDr+Pgc0uau84yCz+BnRgSALVSDw0DwTc8GyHrsX/WVl03w1GZBy22KbeBJYQ00T/ADySxvsSYbGH4EE+o4BLtDqS3iKEKwWZzF8cVny0nknCL9rIRgNmXg5m3s8ZmwcO8EReMLVhbZANeDtSN6Wp4lcqQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: David Woodhouse <dwmw2@infradead.org>
CC: "paul@xen.org" <paul@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Julien Grall <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Topic: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Index: 
 AQHaHMeIsCU+MAEGAkSnPoa9ThBNz7CGlGOAgABYsYCAAAmAgIAAAakAgAAAyoCAAAJ4gIAABwqAgAAFCoCAAJ2+AIAAJb8AgAAD5ICAAASYAA==
Date: Thu, 23 Nov 2023 12:17:57 +0000
Message-ID: <87v89swtmz.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-5-volodymyr_babchuk@epam.com>
 <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
 <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
 <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
 <87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com>
 <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org> <87bkbky9bb.fsf@epam.com>
 <5941AF2D-71E7-4A5B-A519-25F87F90DC05@infradead.org>
In-Reply-To: <5941AF2D-71E7-4A5B-A519-25F87F90DC05@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|GVXPR03MB8428:EE_
x-ms-office365-filtering-correlation-id: bdeeab05-d1ef-4b49-959f-08dbec1e3a2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 WSSqUF/yCD6+otuuFDMPP3louNZZITJZvyuSwf7nft7o/gEwt/C7g9xzZOhhScNKMcEgIESL6VeoVRfEUhKD/1TWDunLtDYZR1I5l3qWAnDGM58b6/tHFiyfR4dBqzh/q08rPWeSDHUfJGtI+KnWuEjPXF0JoYGBEq10dDESsiPuqmoGbzzkQ5+zXYM86qYczNuM5ap3oSmuWzlrSDyTftYLpWXzHwsg8i9J2kmQlncBwkI/DvMn1y11buuZsxehTcy3q0oxDNvv9Az8EH5nhUFDdzTaFAHPiexqVql2uwUL1XHd70B7Kq7nfvkF38tEIr8YSOXbczszfMpx4ADVJQj8MlHEPd0F4iVf5AtFl4RlvQbUCZjNlxQ+o+AA4gbeouynPaG4MDQnangf/lrUOjDGg3hSD1flD1XVJP4gHkBDDfEApaIktwmyiJtTkxUkksSAmdaff4tCHwLYorGyPhACOwner9YXT8KurbeWV++Nk7zOf96dO6W9Nd3LvzxU39rp/8C95Uiu6xQwqcEn861D7BhXRkqFM8US0vZxkDjFIDJCEDWYay5v6XTSrBLCC7auNZccUp5Jgfj/i/fxWWD2UvLrfLBwWROVvT7bHbLyMm/rR2bSi4FokRFlkmfE
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(136003)(376002)(366004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(53546011)(2616005)(6512007)(6506007)(55236004)(83380400001)(2906002)(8936002)(5660300002)(4326008)(71200400001)(8676002)(6486002)(41300700001)(4001150100001)(478600001)(26005)(316002)(6916009)(91956017)(54906003)(66476007)(66556008)(66446008)(64756008)(66946007)(76116006)(86362001)(36756003)(38100700002)(122000001)(38070700009)(66899024);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?JjHtyeb3pCmhYML+udWZTTNshulxEPPB5dOUc96Md8ZzRDwKiOuuadWGhV?=
 =?iso-8859-1?Q?haS0GZFVo1Sg7TdKlJDqfxdIA6wY+J2PALKH4rRXD/5/GWILdvZwU4weDi?=
 =?iso-8859-1?Q?RV+bVxd92svDQWjEfpDij2oC02bQd+FwX0Wi6Og2CvRNljQq4jqHY8hEk8?=
 =?iso-8859-1?Q?6Sl3RX2rPBWJL8V2LV+5U5ptQVrX9DqojbN1s5L+cVZ8ODQAYTFcTwUa/H?=
 =?iso-8859-1?Q?TFSpSSUtcThOPfp8QcutZoyo1mcFi5+eVdoeGGmCclNRwNuU48ZNg2GiAa?=
 =?iso-8859-1?Q?+RnvmCvSdkk98ZWB7m7sD0lg5TFf2G95ZgQNCFgejMeUBQvBJPuJnY3JQW?=
 =?iso-8859-1?Q?ghAgaR3m0nfFoB0jVzmAYFcr/2laMfwcRBB+r1pq58JCl2xDGH2zEEYPfV?=
 =?iso-8859-1?Q?h5rwHIw9xKMSfFM8rfpFSCyj7aVVUMFR7y427FJBYtIFZXG3+YXRTopCQo?=
 =?iso-8859-1?Q?Jq3SRHKRXjGF3nW2tmGfFma5FGVfL36UHgaCYjcCyYRfuCdDlCQmodllqU?=
 =?iso-8859-1?Q?dw7jac/+wrxGy8+LI1bqgEdeclYVoYVapuygjCcU+GHV79BK7kDwtc94DH?=
 =?iso-8859-1?Q?9lnO8fkU8jOXCvQgrbh7bmX3AnGJmZshr/K1uv/Krr2IupYs4ArAlqABf2?=
 =?iso-8859-1?Q?Yo7oFma7GDUiXT3Bpzu4GMeHvpaFZd9hlN8m0+yy3NFbIWk15v3wsoQiVt?=
 =?iso-8859-1?Q?TKZxfl/BvKCNLYVCRx85lTGgo6c1GnrtCOLW2P9XalgWqelSAJz/J750jl?=
 =?iso-8859-1?Q?TMJCpWxADxT48my/sMbag+DtSSwK2fWGg/2UIewqtGguPxr7oet00ctxhG?=
 =?iso-8859-1?Q?nJXQNP5B42MchytGU6sMDVsn3DoGtbyG9dMJIr3bWzw2MgbR7xfc8TLjXK?=
 =?iso-8859-1?Q?vZszRdwIiey/IxPZ6v15unrEvt2D/NdvPb13Prh3KbArM+21nJza3rTJAI?=
 =?iso-8859-1?Q?yrxberBplWNAcs+SsNA12FuFIDh/sr39x5OzuMF6YwL8KDFndr9Lyy/F3X?=
 =?iso-8859-1?Q?SFSn7GvQ6yGAMeYShlDL/cp4/yDQkBUqKASYC7jKoYnAs4CmDtxcuQ9sZs?=
 =?iso-8859-1?Q?MI24faA3zRiYOoLbW4tJldJXi+uXqr8VBJf/Lmder0qc5Sgfkn0mKZlCoJ?=
 =?iso-8859-1?Q?sfBRpq3FyUb61axjmBuZwupy9HSEab1HpyHY77auGTcUrcWtkMbD4mD/Lz?=
 =?iso-8859-1?Q?eT3s6wsvsgvCgc1TqzkEQ6PTZAscTiropd7pfW3XcYypXGfbcFaOo9lozT?=
 =?iso-8859-1?Q?rSDvYZquWOqjYui2I3GiWNvmwAFeYLsz3I+P7XTcvEiGxt9D6btyFSBwam?=
 =?iso-8859-1?Q?E04o01nXvmYvk+xidEDKFtcU1sd90lr2tMHDqPCscFjuMZ6nQGqn68rJZ6?=
 =?iso-8859-1?Q?5KGitZm0KP4/CI5BdzazqrbcaVEVUGMdEB/jsRUK9kuFL45A33Q5ETtJWE?=
 =?iso-8859-1?Q?X6sZKgNfePq1FLDBetwnPMYHcMLWalfgjj2pHN71pp8K6I5zAuOlM6KgG+?=
 =?iso-8859-1?Q?obPnVUplwH0CSLIvDj/UUUhvzc1ir30uQlAV5sxJfYCk4yl8YMb/PIZEc0?=
 =?iso-8859-1?Q?pSmYiV0ncM1pTFpi2iyYhagq5AB7YsyF+BJC5IAHHdQOxWl+VmRNoLxGPo?=
 =?iso-8859-1?Q?URgthzFqL99Z0/MUqdYUY9OEFVTxFYExOEwZfsPdfCImTk6YP8oSLxAg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdeeab05-d1ef-4b49-959f-08dbec1e3a2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 12:17:57.2038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rzvHXVnJ6n9qHhz0KNPZns11ha/KzlpAoslDKHUxh8UeMsve/DSe73Y1wrS4nGiRsjr9RutS0fVMLZLme1DbzfuoCvW7dMObY/GbTs288eY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8428
X-Proofpoint-GUID: R7a5APl9Kw_xgslFKMXb4NHFsUEefX7g
X-Proofpoint-ORIG-GUID: R7a5APl9Kw_xgslFKMXb4NHFsUEefX7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_10,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230088


Hi David,

David Woodhouse <dwmw2@infradead.org> writes:

> On 23 November 2023 11:54:01 GMT, Volodymyr Babchuk <Volodymyr_Babchuk@ep=
am.com> wrote:
>>
>>Hi Paul,
>>
>>Paul Durrant <xadimgnik@gmail.com> writes:
>>
>>> On 23/11/2023 00:07, Volodymyr Babchuk wrote:
>>>> Hi,
>>>> Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:
>>>>=20
>>>>> Hi Stefano,
>>>>>
>>>>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>>>>
>>>>>> On Wed, 22 Nov 2023, David Woodhouse wrote:
>>>>>>> On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
>>>>>>>> On Wed, 22 Nov 2023, David Woodhouse wrote:
>>>>>>>>> On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
>>>>>>>>>> On Wed, 22 Nov 2023, Paul Durrant wrote:
>>>>>>>>>>> On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>>>>>>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>>>>>>>
>>>>>>>>>>>> Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNER=
 to
>>>>>>>>>>>> inherit the owner of the directory.
>>>>>>>>>>>
>>>>>>>>>>> Ah... so that's why the previous patch is there.
>>>>>>>>>>>
>>>>>>>>>>> This is not the right way to fix it. The QEMU Xen support is *a=
ssuming* that
>>>>>>>>>>> QEMU is either running in, or emulating, dom0. In the emulation=
 case this is
>>>>>>>>>>> probably fine, but the 'real Xen' case it should be using the c=
orrect domid
>>>>>>>>>>> for node creation. I guess this could either be supplied on the=
 command line
>>>>>>>>>>> or discerned by reading the local domain 'domid' node.
>>>>>>>>>>
>>>>>>>>>> yes, it should be passed as command line option to QEMU
>>>>>>>>>
>>>>>>>>> I'm not sure I like the idea of a command line option for somethi=
ng
>>>>>>>>> which QEMU could discover for itself.
>>>>>>>>
>>>>>>>> That's fine too. I meant to say "yes, as far as I know the toolsta=
ck
>>>>>>>> passes the domid to QEMU as a command line option today".
>>>>>>>
>>>>>>> The -xen-domid argument on the QEMU command line today is the *gues=
t*
>>>>>>> domain ID, not the domain ID in which QEMU itself is running.
>>>>>>>
>>>>>>> Or were you thinking of something different?
>>>>>>
>>>>>> Ops, you are right and I understand your comment better now. The bac=
kend
>>>>>> domid is not on the command line but it should be discoverable (on
>>>>>> xenstore if I remember right).
>>>>>
>>>>> Yes, it is just "~/domid". I'll add a function that reads it.
>>>> Just a quick question to QEMU folks: is it better to add a global
>>>> variable where we will store own Domain ID or it will be okay to read
>>>> domid from Xenstore every time we need it?
>>>> If global variable variant is better, what is proffered place to
>>>> define
>>>> this variable? system/globals.c ?
>>>>=20
>>>
>>> Actually... is it possible for QEMU just to use a relative path for
>>> the backend nodes? That way it won't need to know it's own domid, will
>>> it?
>>
>>Well, it is possible to use relative path, AFAIK, linux-based backends
>>are doing exactly this. But problem is with xenstore_mkdir() function,
>>which requires domain id to correctly set owner when it causes call to
>>set_permissions().
>>
>>As David said, architecturally it will be better to get rid of
>>xenstore_mkdir() usage, because it is used by legacy backends only. But
>>to do this, someone needs to convert legacy backends to use newer API. I
>>have no capacity to do this right now, so I implemented a contained
>>solution:
>>
>>static int xenstore_read_own_domid(unsigned int *domid)
>>
>>in xen_pvdev.c. I believe, this new function will be removed along with
>>whole xen_pvdev.c when there will be no legacy backends left.
>
> Which PV backends do you care about? We already have net, block and conso=
le converted.

Well, this is all what we need, actually. Even console only will be
sufficient, as we are using QEMU to provide virtio-pci backends, so both
storage and networking should be provided by virtio. Are you proposing
to just drop this patch at all? I believe we can live without it, yes.

--=20
WBR, Volodymyr=

