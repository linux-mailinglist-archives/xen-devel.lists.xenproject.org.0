Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6C7F5E63
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 12:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639675.997283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68Hf-0001TW-8d; Thu, 23 Nov 2023 11:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639675.997283; Thu, 23 Nov 2023 11:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r68Hf-0001R4-5I; Thu, 23 Nov 2023 11:54:15 +0000
Received: by outflank-mailman (input) for mailman id 639675;
 Thu, 23 Nov 2023 11:54:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B0YW=HE=epam.com=prvs=5691553e4c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r68He-0001Pf-L4
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 11:54:14 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04196cfd-89f7-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 12:54:12 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ANBD5JZ025601; Thu, 23 Nov 2023 11:54:04 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uhu5fhtx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Nov 2023 11:54:04 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAXPR03MB7529.eurprd03.prod.outlook.com (2603:10a6:102:1d8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 11:54:01 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 11:54:01 +0000
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
X-Inumbo-ID: 04196cfd-89f7-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2M2RhIDDei5INTBzIsl2XwDIp59alv2acyRsAXa6fo2ZN0iLRviidLLacEuM/NdoF14FfVIJyf7Xw4Z8ht1Ce4T8AgCaTTF61uFbMVXg453VEEpGYPCuU5qUap4HC1xMNdE9Talbjg+uh91u0Nn8//pzdcJmGlWWPfB31SZfOhPgNpsPJQD/BzrclbSRIlCGFjHGFiJV7kIGgmCLhmbEpWhnpDD8YaDfSg726+Ezc/8MdaETjiRAWhZkhUrocn4s2qign/65mAZD6DLXzp9ItVRMpNaEy+1kB+pvBLVcQZVQZDqkHlT1jXBHj6lXgC+vlHu2HBT7aprokvTnYm90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xGEx0N50CQG3ILYevRHH28bEXC+2VJPGNIm+YON+jlc=;
 b=CNbP88UIcnynigLugQql43A6uwmJABcg4q1GCms9U5S0sFwCnrTw24Syo86dDYHC3UlqgFdBmDGytkq9QOCCpTWvUvUJrqqyeaOONryC3MxDgBMTgBztMv6Ss3w5BKJSzFFgb7bAB2qOwZQD+nI4GUVY0Kj2s610X0hBHDs/pft+eA2oGe+t9Aw5YjPhOnsNwQGuJEeqqxmwKVjX0GLwp59EQTtaBy8j3eQ5RPyG05IrltXSC47RMV6qs5xyJgNyOs4+nmVCRUZBNEJ2pDr6RioVT2/H8pE0JUMpLq9tZs7PRKYF8nGzHevnV0/irqR4sB+XDIZ9Bvgzap9klac7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xGEx0N50CQG3ILYevRHH28bEXC+2VJPGNIm+YON+jlc=;
 b=DDD4BV9ANFdsx5MdGbiuYIJzIcshv3obIN3LJqEZeaaAKK6fNVNt49vr1TeeE+P8HlY44OJEz+MPay9fsK1Aw9du04F+fLLyEzk6Mu28bghet7UogPhq9AVkvBnK/boAln/eAo7jmIQZwsvUQOCYuJ3u6VAB6ROU61EyUL7870jQpq98b40u2VWk2zhdYcXBCJsTiCxEqwDHRymGl6PV0/hkc2myomb83ts8E2cR/1ZhCJadjv/vUyqod+EPVetq5biGU5WvZ68sgDJVsyV1BmR0TjSiwd1sfV4fL8jzW0YQxejiP5r/AsH+ysoldcKNNLcW/EsS8JdizcoYSo969w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "paul@xen.org" <paul@xen.org>
CC: David Woodhouse <dwmw2@infradead.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
        Julien Grall <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Topic: [PATCH v2 4/6] xen_pvdev: Do not assume Dom0 when creating a
 directory
Thread-Index: 
 AQHaHMeIsCU+MAEGAkSnPoa9ThBNz7CGlGOAgABYsYCAAAmAgIAAAakAgAAAyoCAAAJ4gIAABwqAgAAFCoCAAJ2+AIAAJb8A
Date: Thu, 23 Nov 2023 11:54:01 +0000
Message-ID: <87bkbky9bb.fsf@epam.com>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-5-volodymyr_babchuk@epam.com>
 <b04daedc-ba6a-4109-8e23-fbcd023bcfec@xen.org>
 <alpine.DEB.2.22.394.2311221428570.2053963@ubuntu-linux-20-04-desktop>
 <ce719f35e72a9387fc04af098e6d688f9bbdca4e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221508270.2424505@ubuntu-linux-20-04-desktop>
 <a4e6a62a7cfe756344a1efcb8b2c3cfb1e50817e.camel@infradead.org>
 <alpine.DEB.2.22.394.2311221515010.2424505@ubuntu-linux-20-04-desktop>
 <87r0khz6zj.fsf@epam.com> <87cyw1z61i.fsf@epam.com>
 <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org>
In-Reply-To: <dce4efb0-4fdc-404c-8e5d-c90ed732eb8a@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAXPR03MB7529:EE_
x-ms-office365-filtering-correlation-id: 00cffee3-0b73-4a1e-6b03-08dbec1ae23c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nYw45G0SLduCDSxQhjlGXAMEZClCMtx1xXlNMpOZHwyLLJEPREGD+cvST5dPJzhv/steh1SWaY1UUYSQV44DgXsdZ/32H3ZFdw9TzRQYom9xDLi8t8T9TPINXJydDGcEUK6szouu2bui70YwFE9ATAXPYflsjr29LUY/254HnDlO9++gaWXxBNKu46PsVMr9bz1iY5vpzB+MPww4FcQGrCsEmc07OZxj6xmyQ7hKfb1/WzoFnYZxYq98Ntqq5I8/dIqsRKZvz40BzZ2N2M+Im2EbgXCVWxK9gP4pFv9Lv398kk0GRmRykg8oe98J4p0X1U4H1C8iE1zqL/lNnOzyFYtkOnur0qRhWj5iVvMRQ0LsaJJ3Kdr4ib4kMLLhwEBob9sIhD8N0wOCzeu6abgE68OHaSdkfz9bcmQrcHpFblyrr6uE0u0aCbCXUER9QZ8jD6ElLSLjnJXSRyX3LVWQi9l5AWTKfZvSOUm49BIp6kW6I0YG3lYO+NT7WdSNNEyHCwFGoKJXX8e6YWhaAbEWdRtgSRKFIImhCyLsZKYoIvgtaU4CkCwGvpEeIMvTRMGGkecGPL43haQNQDexwevglyTO5u22rVtvkm3gNtvF7NxtnXQA4DsML8oliexU9c9B
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(346002)(366004)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38070700009)(66899024)(76116006)(66946007)(66476007)(66556008)(64756008)(91956017)(54906003)(66446008)(38100700002)(36756003)(122000001)(86362001)(55236004)(53546011)(26005)(6506007)(6512007)(2616005)(4001150100001)(2906002)(478600001)(6916009)(316002)(6486002)(8676002)(5660300002)(41300700001)(71200400001)(4326008)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?6Jbn4B7Nsm/f+/ytAPb6shSbpsxFA503TcFMLH9mTmbSpuBsiJ3BDSoD78?=
 =?iso-8859-1?Q?2eBvbzskkLSUS0LFXrEsV6io0KShupIhRisMJd+xOKAR+lhOxhjRJDZoWA?=
 =?iso-8859-1?Q?WRaAqsACOYHPpuUT5aNXcP2txndbBylpNg4d6sABJXLflEqMpmE/S7Ddtk?=
 =?iso-8859-1?Q?BfGOzx25SfHVElppCdiFNqVtpsl5d4kVnNfBGx78jFrKXPZ1ilkBznwhf9?=
 =?iso-8859-1?Q?56g4wEYhoSIYQoJZ0X3FNfUmalnnS3D47qOpt7wBXiks/SsWgQwZFiGzBH?=
 =?iso-8859-1?Q?9wDB2rAl8FnK+xVCPpOCp7IEgOLkzquolGt+DTKFg31jIXADB8RAZOQkSt?=
 =?iso-8859-1?Q?KCbjtEd/lK51h1jl1V9vrv2QL54YdZ7VPV1iJ/AQT0AJs+QOltDH0LBE2z?=
 =?iso-8859-1?Q?7KGCoxFX02BIdTby4HDfbGc0VPbSK71wgrFC1s6XF4KVlcZmS96uYAOTfI?=
 =?iso-8859-1?Q?5l5zx4TUk54RffPYWC1ZcRLLWX9pWs9vpGaeiF6ZYC/xAhBpb8A9orSDzH?=
 =?iso-8859-1?Q?CkKiPUjvLK4AZv27Dyyww4FoN9J2Db4n4/Kank/kofqRe1deNEGBwZ9nEk?=
 =?iso-8859-1?Q?FKPnUdRCPz/RTzEr7yiC+IN9xk9kV6WF0GITectO3XKRcoYuNk15nmop+Y?=
 =?iso-8859-1?Q?6CS3MEGv2UHUMiLPQP+n4CsGQQpcTOxIZP9WSKifmB6o9f+ePTun8tV6qs?=
 =?iso-8859-1?Q?TBjIDgV9kmEzBBqA+d7dHaE8iUd/Yz/50WFJN50U6SnIeEa0GNcBj+5XzN?=
 =?iso-8859-1?Q?Q8d4Yhz5geKl91RDN+CJ9OJdvFhNsPTw0gV/YaoNkkxcEcWt4tNqsy5XpX?=
 =?iso-8859-1?Q?AT5hZ1fW7A2swenvxgRksFHPLYsmhBSLGgFIbNTxlY0Pg8JNFqvSZDklzi?=
 =?iso-8859-1?Q?GthmFhNqR6AbusMYEsFaIBhoIBJU1KNBRFIxw4wm9V9HX4JabSJuppc80O?=
 =?iso-8859-1?Q?yQ6xzbd9OX11i4j7KIEPikeY6cPWjStNKqiMCPsZEhXny1EIRgjHf99PWm?=
 =?iso-8859-1?Q?btjK/kVdgBKhLGTzIteUI6BlmqwoqiLXUvZvvCVz3bTQ6ZqXnKvXzguItD?=
 =?iso-8859-1?Q?f3zhHyFDPVJUite8jgfYXR0nuTvlEsX152Bu79MmkypuoBwaFCZnrfp4t4?=
 =?iso-8859-1?Q?itoTvg2BUNeCgNygJEX33HNMnSsuVMcaCfMJnQwU8L944JyNMNa5tHUooq?=
 =?iso-8859-1?Q?tImAGn5MfCHCAk7DeqQgGBxgwRrHySAtVYC5vv1KW7h5AW8S4w6hMLT6v2?=
 =?iso-8859-1?Q?bL3yz7KQmfDwINFzNcaESeDX0GgRII/ut35iJz+9PUaxhu4JnA0tRZHycu?=
 =?iso-8859-1?Q?VWcAygtZuQoxeSIIDByXPHySykA4uCUJlAGTfuwG3L6vCQd3qYz1H41A3J?=
 =?iso-8859-1?Q?GSFZjkOWgnFuw25C3aM7WVONnc76Rs8mKvEQFX9OTiEfeN8epa7FkvR20Y?=
 =?iso-8859-1?Q?NW6u5+W0MqS7gYE+nVMHQEqHbJkk+aMBsiKmcnatPrlYa8d/eJ4tTud1th?=
 =?iso-8859-1?Q?cPYQkpldvNu+roYj4Q2RerC7rCktEraNjGieoJT8BRxi2cx/ibV7xWN4ny?=
 =?iso-8859-1?Q?HMpiBaMOWU9djb8qxQPRbfKnM3a6NYTcE3YrkZ4ZO+1ysCSdglr+TeVEiT?=
 =?iso-8859-1?Q?N0QivJcZNyAUDfsy6qwOJeH8EItVhRcLpPDU7FEF/Hp0XTkakKYvlLfQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cffee3-0b73-4a1e-6b03-08dbec1ae23c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2023 11:54:01.1745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IHiwms7UaR7/itvCsKNpyqxwyXbf3LLmFbybzQOFYWI6bmnpPmFnmd7HLNY1iGdl/d2OlDCjVLUDZ1n4e8ecS/gelL7NHGsCe7NIOdeteTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7529
X-Proofpoint-ORIG-GUID: uucvSTgnG1w1ouc7XE2meA-otbGYDcrC
X-Proofpoint-GUID: uucvSTgnG1w1ouc7XE2meA-otbGYDcrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_10,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230084


Hi Paul,

Paul Durrant <xadimgnik@gmail.com> writes:

> On 23/11/2023 00:07, Volodymyr Babchuk wrote:
>> Hi,
>> Volodymyr Babchuk <volodymyr_babchuk@epam.com> writes:
>>=20
>>> Hi Stefano,
>>>
>>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>>
>>>> On Wed, 22 Nov 2023, David Woodhouse wrote:
>>>>> On Wed, 2023-11-22 at 15:09 -0800, Stefano Stabellini wrote:
>>>>>> On Wed, 22 Nov 2023, David Woodhouse wrote:
>>>>>>> On Wed, 2023-11-22 at 14:29 -0800, Stefano Stabellini wrote:
>>>>>>>> On Wed, 22 Nov 2023, Paul Durrant wrote:
>>>>>>>>> On 21/11/2023 22:10, Volodymyr Babchuk wrote:
>>>>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>>>>>
>>>>>>>>>> Instead of forcing the owner to domid 0, use XS_PRESERVE_OWNER t=
o
>>>>>>>>>> inherit the owner of the directory.
>>>>>>>>>
>>>>>>>>> Ah... so that's why the previous patch is there.
>>>>>>>>>
>>>>>>>>> This is not the right way to fix it. The QEMU Xen support is *ass=
uming* that
>>>>>>>>> QEMU is either running in, or emulating, dom0. In the emulation c=
ase this is
>>>>>>>>> probably fine, but the 'real Xen' case it should be using the cor=
rect domid
>>>>>>>>> for node creation. I guess this could either be supplied on the c=
ommand line
>>>>>>>>> or discerned by reading the local domain 'domid' node.
>>>>>>>>
>>>>>>>> yes, it should be passed as command line option to QEMU
>>>>>>>
>>>>>>> I'm not sure I like the idea of a command line option for something
>>>>>>> which QEMU could discover for itself.
>>>>>>
>>>>>> That's fine too. I meant to say "yes, as far as I know the toolstack
>>>>>> passes the domid to QEMU as a command line option today".
>>>>>
>>>>> The -xen-domid argument on the QEMU command line today is the *guest*
>>>>> domain ID, not the domain ID in which QEMU itself is running.
>>>>>
>>>>> Or were you thinking of something different?
>>>>
>>>> Ops, you are right and I understand your comment better now. The backe=
nd
>>>> domid is not on the command line but it should be discoverable (on
>>>> xenstore if I remember right).
>>>
>>> Yes, it is just "~/domid". I'll add a function that reads it.
>> Just a quick question to QEMU folks: is it better to add a global
>> variable where we will store own Domain ID or it will be okay to read
>> domid from Xenstore every time we need it?
>> If global variable variant is better, what is proffered place to
>> define
>> this variable? system/globals.c ?
>>=20
>
> Actually... is it possible for QEMU just to use a relative path for
> the backend nodes? That way it won't need to know it's own domid, will
> it?

Well, it is possible to use relative path, AFAIK, linux-based backends
are doing exactly this. But problem is with xenstore_mkdir() function,
which requires domain id to correctly set owner when it causes call to
set_permissions().

As David said, architecturally it will be better to get rid of
xenstore_mkdir() usage, because it is used by legacy backends only. But
to do this, someone needs to convert legacy backends to use newer API. I
have no capacity to do this right now, so I implemented a contained
solution:

static int xenstore_read_own_domid(unsigned int *domid)

in xen_pvdev.c. I believe, this new function will be removed along with
whole xen_pvdev.c when there will be no legacy backends left.

--=20
WBR, Volodymyr=

