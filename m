Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A3E7F54F3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 00:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639315.996516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wvp-00083t-Am; Wed, 22 Nov 2023 23:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639315.996516; Wed, 22 Nov 2023 23:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5wvp-00082E-7Z; Wed, 22 Nov 2023 23:46:57 +0000
Received: by outflank-mailman (input) for mailman id 639315;
 Wed, 22 Nov 2023 23:46:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hBnL=HD=epam.com=prvs=56903895d3=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r5wvn-000828-4W
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 23:46:55 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6993cf13-8991-11ee-98e1-6d05b1d4d9a1;
 Thu, 23 Nov 2023 00:46:53 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AMND0pO005809; Wed, 22 Nov 2023 23:46:44 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uh623upc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Nov 2023 23:46:44 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU2PR03MB7848.eurprd03.prod.outlook.com (2603:10a6:10:2d3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 23:46:41 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Wed, 22 Nov 2023
 23:46:41 +0000
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
X-Inumbo-ID: 6993cf13-8991-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KeDymCOvkzFm6pqmxW8akXGgK+7aIX42B6d/+vBzBUvzM+quBq1sXDc5U5+wQdDA4AKrb/gh8qblnkHuxdvKiUsCHaNyZtvtOXePnyGAe261LQELPwJUGxyIH3DZ49knmE+sxYfKBj1oVnlT6RqLKQnczoUBZ67xer1GR/RI/jNzl8DHFHhIvJFycXk7KNUNJQ/pMFOvycIJYj9kJcGowWUIYYHb04COkv7ZVlD4VjHqUhHGsuCxbeMwrNk4MvHl2iGbJ5FLJQXSUxCxOstn2zrIift1aEZWf4YZeoDUIjd58Km2YEaRfyDzCR9d9/3qNq+uQ1IT4Ko03occXdhcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFy7Zq1Pjr/W3xGzJGUsXcccVYTS0R18j04v0BCr+ws=;
 b=lFFXnYxZ43mx0fdzLN2odbTtALXJ1y507rkUknN/ZxBmkT98pgf2On6YjJclhCzsaReWLKO2xgdZGUyCD8HRCuHSTLp2JMPyX0IkmZuPcx/jTtyJuGvpK3EzOsXo9tswRHCGwO5cnpt8/5wtQRm2r3qIxLGgtOMQdQdpG32AgICklm3hvpFboGLkTmCb1QF1n7DRsouzKsyrmFsG8lZFW1l0atyGpPYR5C9fYohlusLqhi2jZvVszl1zOcUirPJQVcF5+6bapRCaFcqBlrdsGY4aaD0G0/NhMCOIgIldbPncpgPRrKnfrJ8pfHXxwLj5+Ac+FnaW2+Fsk/X7ji7o9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFy7Zq1Pjr/W3xGzJGUsXcccVYTS0R18j04v0BCr+ws=;
 b=WkheKDPCMQGoLrRv8i3zm+HCU0TzXBrq9LgKMi1SiDtWVpsp/gy5wszC7ZTOWh/jkp5Z+eUX6GZ9yA2HKMIX5kBYgc3P/R3Rwpxl0N2sqZuYLu7C1qTOKHXM30h+tW+ONVrlcz+vXN4KRXHOI55KagMi0X4XzPgRdsocLhGq+OShi76kHorLHKrNUqwAeOEFW5cW8zOLV4j4qMB6KuDL5zgPtBXRxAgMDDWJj49zUzyWNR7K86p5F19CjIovlv1E7Yso6md/YQve5icvhawHtf5JYrQmbkxdhjUVMyydBf3IbCZuetXYunjFN/EVIBJIT8/+zDAk6QB/xU0r1+CooA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: David Woodhouse <dwmw2@infradead.org>, "paul@xen.org" <paul@xen.org>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Julien Grall
	<julien@xen.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list:X86 Xen CPUs"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Topic: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Index: 
 AQHaHMeIsCU+MAEGAkSnPoa9ThBNz7CGlGOAgABYsYCAAAmAgIAAAakAgAAAyoCAAAJ4gIAABwqA
Date: Wed, 22 Nov 2023 23:46:41 +0000
Message-ID: <87r0khz6zj.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-5-volodymyr_babchuk@epam.com>
 <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
 <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
 <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU2PR03MB7848:EE_
x-ms-office365-filtering-correlation-id: f60830a0-39fe-4cb1-eb0c-08dbebb54703
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IVAgmfUE4RfnGc6dtELQi+Knf7zRf/ttDje37Pau4CPWBxwgjgWytSyb/bhU8HzXptI2tkvCX8ZCNVLpYi5F28qoko+bc7VAHCqVqJRGBLwWMs2uTBz6aPb7cLa+LEOXS3K/X+zXY+dYS/LPinB5wxCNrsNp8/JGwqtLaYX6xrNKb79BouxaqdWb/VZqSKy7caOdNfjOXcoddhxH7jGZn5yWgXQ7lvtvemgNQk2Q10qszx5FVvE5jEfFcwYTm8B1at6mIFgsZuUFuwg913dy3MX4Hl6LfnYjDkk8HxCR1uSfpxuoVBs9fusGMMGbdlC5wondbIsNOqDZlU9TmS+t1Jt8cEH+A5He+7QachdfKhueSQagZZg2TmN6SIHgdwk6pmDAXHf3Nx7rrxY2AKSVy9YqD720XeAcEJfkT7BpI2/dma4S3kyUpxfi2qXPB4Z13pTSq0C+AuOz9oVPRDm/FC7LaVEKQEJYI8sq90VBSGpTtWWl4E9mge3sRcaYVN27EsMo+Y0fC5kPidLT3FusCI+P824Fn95yMle4no3QQ5IYEDNE9/LdwoebFsWFOyUTnj4MSMqHKBZ52ljANPrCRgtGBVzNrPgVYKmvQa1dSZh3QAXpguyg8fwIL2V6Dg8h
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(366004)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(26005)(53546011)(6506007)(2616005)(6512007)(71200400001)(55236004)(6486002)(4326008)(8936002)(5660300002)(8676002)(41300700001)(4001150100001)(2906002)(478600001)(316002)(6916009)(91956017)(54906003)(66946007)(66476007)(66446008)(64756008)(76116006)(66556008)(86362001)(36756003)(38100700002)(122000001)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?UjDyKKTDG/Eg3fgXYoKelJcPUL5auuftS6fI61C+7FjwDK1HHTlY3oUv51?=
 =?iso-8859-1?Q?93ALH7+I01ca9MPGokEW4X7xzQ3twDdOWEOACaG8dKIsApt+s0tkskuV0T?=
 =?iso-8859-1?Q?zUEZ+iVIVcIZ+rZOiMRlLujk09tqG3vwT2ExwvVypJxxh3y/kgzmIIXk4v?=
 =?iso-8859-1?Q?2mD7JoAqP68wMoANGVnCXdJF9M1kU8eQlZLewDNUQk8rZnJir3TbAq9BKu?=
 =?iso-8859-1?Q?Fym2Dn7NjyBd3CaMdgi7ztG6nckvor/Tr8geYjIsmU5IzvSohiWdyC9RVf?=
 =?iso-8859-1?Q?l9zDX2g1shhGmZ9Z8xu5yX+GgL+eFx2SIEt44ki0mb0Jo2zImUPD9HqfIi?=
 =?iso-8859-1?Q?6J7a0YY8iYyTWy90SXF1Es5J/R01g4U4PwW8yDp3uMuapec1tFfbWajUN3?=
 =?iso-8859-1?Q?+9P4Ki+MhDLrdYxvYplB9n0XcTE33/GrrX4mBs1R8h25PqB5+gDEILR6Ir?=
 =?iso-8859-1?Q?F0t1A75bZcZmQF140BTHfB+DpEKIh+iZLpt+oXrbed0p2tU0oMEyWphem6?=
 =?iso-8859-1?Q?b+HXxS/68xqLLdzXx1vDKrPHcPxTLhR6dskUVvJ0xEZ6UhBqXLG1Nhfc1w?=
 =?iso-8859-1?Q?IcJ4hxDa8yzLb9GdhT93A1eyw63KaXPFyM+nDqkooRC99JnV96sD40ScWS?=
 =?iso-8859-1?Q?hRrV1Dopqt1uMiu9V+GCVFU/2bNaKVrTQnsgpHcXC4lci8Z9gQm/MnXpk0?=
 =?iso-8859-1?Q?Yxyk5NCA8TNRo3vgrRrYdrXe0lN4+TAQ7WrGy5rkssks2Kv6xtOy4MH84x?=
 =?iso-8859-1?Q?vbHYPwuLSN+RP0J7rvtuv8avGyfMvwOUBq3PlGqaY+Nio/TtkamdnhdbjF?=
 =?iso-8859-1?Q?r7q8mMkL1M2jnxKJZIsauVzb+dqUVykizX9v3rlKq5XhUcH6uAqCQoiPWf?=
 =?iso-8859-1?Q?3Xg/zYz6yxcrJH0EkPiu0KqB3vzRA1YiJSR0IOfJ1K+nMsE9UzJr+lp1Lx?=
 =?iso-8859-1?Q?RKL0KxV6yp3U2QWWaZ2RJrqMosBQMxzVERJpUPf9UO7teuHEdG6531jDXw?=
 =?iso-8859-1?Q?MA/VyU4zJQt0fFmh9cg8v5Xf6uep5qP15DDHha85kDMl5XcFoXr8FcuXKI?=
 =?iso-8859-1?Q?JQSI/MzFsbZtKgaxakEIJpPRrSnK4l4ZkL3v/qs7dxcchACgzlCPLfEUXt?=
 =?iso-8859-1?Q?pMg75COTmM2LjSPkUGnIPCob+saqpSyKf6OeydwBofH4UX0VcQfQR2f8L9?=
 =?iso-8859-1?Q?Ik7bhQXImzjyi8BJEcvCGUZU3UQU8Ws2/6OwCDXT+pWKgmMuspueczAowh?=
 =?iso-8859-1?Q?CjcLGep3/sYjLEHUZltid2zUfGNp17gohKpxhBK1RjKy050JuGffG763WI?=
 =?iso-8859-1?Q?SXcB6Tp8C05THa+EuBh/1bIspv2gird+C/kogk5DQzGYvsd6MLhoVyVFha?=
 =?iso-8859-1?Q?L9fFjuNQgrMirM8EmIhG+JHnDE6Pxrf/8dCUf4gtVC2qW+mpes6cvuwFd1?=
 =?iso-8859-1?Q?1tso2W3qr4uQr2gE+wZnPM5MoM6tN+5l6TtZYteZmlVnU1UPxPskqKo6+1?=
 =?iso-8859-1?Q?dVRpRv9eRCyZj3MdG7ZcPiJ7mPNGZpAipxpVIaAAGfnSzM/QhnShIu87Jk?=
 =?iso-8859-1?Q?sYoeDw5FBcACjpmUPgCmLAQQtKu60zVDNkrZNcMOmfXzbn1xs7O1ennAJE?=
 =?iso-8859-1?Q?riVnS7dTJRTRe0YttzL8N1bjulRSRXjoDBGVo8QQyrIk1x84s1xieoWA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60830a0-39fe-4cb1-eb0c-08dbebb54703
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 23:46:41.5884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PpEC5o+b4C3M9dVgpPqern9lHoDyFgU3vIz3ze0uttC6I7WL0dWkE1ER570QNVSNjE2e9BhMDoQoT/rjNKRBN67dzBo3mlfVDfBTHSdqKeI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB7848
X-Proofpoint-GUID: qednVgVF03CHz9mJ3iIkMe-dF-Afy-qe
X-Proofpoint-ORIG-GUID: qednVgVF03CHz9mJ3iIkMe-dF-Afy-qe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_18,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=829 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311220174


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Wed, 22 Nov 2023, David Woodhouse wrote:
>> On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
>> > On Wed, 22 Nov 2023, David Woodhouse wrote:
>> > > On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
>> > > > On Wed, 22 Nov 2023, Paul Durrant wrote:
>> > > > > On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>> > > > > > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> > > > > >=20
>> > > > > > Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNER=
 to
>> > > > > > inherit the owner of the directory.
>> > > > >=20
>> > > > > Ah... so that's why the previous patch is there.
>> > > > >=20
>> > > > > This is not the right way to fix it. The QEMU Xen support is *as=
suming* that
>> > > > > QEMU is either running in, or emulating, dom0. In the emulation =
case this is
>> > > > > probably fine, but the 'real Xen' case it should be using the co=
rrect domid
>> > > > > for node creation. I guess this could either be supplied on the =
command line
>> > > > > or discerned by reading the local domain 'domid' node.
>> > > >=20
>> > > > yes, it should be passed as command line option to QEMU
>> > >=20
>> > > I'm not sure I like the idea of a command line option for something
>> > > which QEMU could discover for itself.
>> >=20
>> > That's fine too. I meant to say "yes, as far as I know the toolstack
>> > passes the domid to QEMU as a command line option today".
>>=20
>> The -xen-domid argument on the QEMU command line today is the *guest*
>> domain ID, not the domain ID in which QEMU itself is running.
>>=20
>> Or were you thinking of something different?
>
> Ops, you are right and I understand your comment better now. The backend
> domid is not on the command line but it should be discoverable (on
> xenstore if I remember right).

Yes, it is just "~/domid". I'll add a function that reads it.

--=20
WBR, Volodymyr=

