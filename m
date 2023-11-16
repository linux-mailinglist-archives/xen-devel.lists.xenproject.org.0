Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7277EE402
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 16:16:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634464.989914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3e6f-0007ZT-VH; Thu, 16 Nov 2023 15:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634464.989914; Thu, 16 Nov 2023 15:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3e6f-0007Wo-SL; Thu, 16 Nov 2023 15:16:37 +0000
Received: by outflank-mailman (input) for mailman id 634464;
 Thu, 16 Nov 2023 15:16:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ww8j=G5=epam.com=prvs=56846b66b7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r3dxr-00021Z-1v
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 15:07:31 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbf44545-8491-11ee-98db-6d05b1d4d9a1;
 Thu, 16 Nov 2023 16:07:29 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AGElpYg008788; Thu, 16 Nov 2023 15:07:16 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ud54nat55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Nov 2023 15:07:15 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB9893.eurprd03.prod.outlook.com (2603:10a6:20b:637::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 15:07:10 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 15:07:10 +0000
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
X-Inumbo-ID: dbf44545-8491-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A8jBJszgw6DAgd/Nj45aw5XNVc9UYS3awdXPvzdN5x5+heyV2tvxGtlajlDrTiScxbxukQcXB6MBlv9uS/x7xUDNqLSwsHLRaLHhUA/z1K6/a8FZTCyDuF6AX/qzQUg647UOYPmln37xCQE7JVnO9jyC96nH9Hbus1TXRV5iY0tX7gQQc4AwxaVqdm+/y1ePuVv/F+JKx2uZK0Vsk2YA2uPnZ6AcpUh76mCTaWPzCs4ODDBO0XH9YH1MjMvP0rseFe/yqKj2lBcEzdcM8sArGYmFRMeisn4XFvD11ElPd7mYmjO1hD/XBrmvTcid+1o9h/JBL3bopG3Ay1YJtanZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/DB0qMqR38wx9CPU6U/tc7nfenuj0L8YpiJ9UJmv48=;
 b=PxO0B11JenlEegud9+jt5JNrU2utC7aX1OuWZ7QoyXVljjbLZz/vga4TAvngLnHo6Hkf2KfFUIYFV+GT50rVcTDkpRWG3xdUveVNoV3NYQNeNhnNIDzC6IhKHQ3NJyWBQGDk3jDhEr2Oy4WBBuUyFN7SZyp+3hX9g1ow+Xs7kEaV1vgAK84EvUAXG8NrzOtwgxbjoVDASfSxkGrao0ckjSGUcJyrgADMlWwf2TexCdMhSKUrA+J7Q1NBOZWYZOoPeoWr/FMmvw3jpkbl1rerT32Rlh5W1tSRvUuGTPufBVq8ytFb7UACi482ynnB9tLvw2TdZVAX/12t0Yfe8KyBqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/DB0qMqR38wx9CPU6U/tc7nfenuj0L8YpiJ9UJmv48=;
 b=R8FjmFlb2A/xGa0UOkxyPF4bycIkF2xzquTDBsav5mclmsU0eUk0DN5X0YI+q4Mj0nKRYfX6S1qifFgLnpMiPVn3cQkitSAxCJOkQrHGQzxp60xE/5vpf+DBywYG4EKnGTSX1p2qqxcoFl7Lwdq4f6B7n02GD8DLPdfBpDPQ4vJjChPvoMEvVL8NuackVwdrIVwGYGHIEydbDhI/xGJwtMq/n7sEbO5f4i+d8eaMzs0buQ/wITvW2xQq8vNKdSPlH/7BuoFHKtv7Kdwr53U9Va3rRIiTL7qDB1cUxBY6QFPPrT/kcVbR2uabzysKM7OXTQoIwFQKppzOYXKTcDQ2Iw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Julien Grall
	<julien@xen.org>, Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>,
        "vikram.garhwal@amd.com" <vikram.garhwal@amd.com>,
        Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: Re: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Thread-Topic: [RFC PATCH 2/6] xen/public: arch-arm: reserve resources for
 virtio-pci
Thread-Index: AQHaF7/0FLT7PaxCl0mKzTq8kNpAxLB7mIqAgABuuwCAAP6dAA==
Date: Thu, 16 Nov 2023 15:07:10 +0000
Message-ID: <875y2168ki.fsf@epam.com>
References: <20231115112611.3865905-1-Sergiy_Kibrik@epam.com>
 <20231115112611.3865905-3-Sergiy_Kibrik@epam.com>
 <f4523916-f8aa-4f3c-a148-2fc73b0c5fa4@xen.org>
 <a5ce647b-f372-41ee-b1d2-b6ff16c3d1a0@epam.com>
 <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2311151518500.160649@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB9893:EE_
x-ms-office365-filtering-correlation-id: 3884c595-a4d3-4f18-da87-08dbe6b5b51c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 y+MNTg5+8JsFEi9D1K9ohfKe6dTyh7k5N17178HoU5V+ENU8BBY5c/YlnVQeT7jNaUg5qwtjELK+YU5f0sikwV3G4OmZmDG2gAlkujeaHMC0Jx/Fxqi8kHhL4xZGHzvOi667Cl+kYjoOkaMR4lcvpJosTk096ggDuCeaVQMpqZCd5N3Jd26CVtjdz088AJmwJnScAyg2Llwr968XNkg0Cc3yDelzdo4WLMwJzoOQ6M8IKtS/H9YQG1cPGbj+WPGUM7pjLu03US0SubxniOXsnb3YVfLyisQ+pijecCkYIMMpwmgzsIt8eaXv0annIUeV9Xbu92pJAzwFZvtlmciB1fqqRULTG+ttHAjUVsmboYmITalBd6gDklPBsonwml/h3XzR17eWVTiB0W/8i7AgK0zUmb5E9C96Tt9WCmWyYLA1EJROr9OYuFX4WNUBZU4hCG/rt5J4r1s2PayEiBXw45mb//gYxSIfSReRgPbNUxWj+QXYfquOvHNY2iChPKnlpLCfgGhJN0IRw4bm80TbwweEyWRkG3+LFXnKgS0E1QT5vAQjy8Y3Gtz5IbMHVYMTzlj8VrMm4n/yoDYH/7Vi9YGjGLY39mmI6eWttW8Xmhr5Xpv73S4axF3zQj3WdCBK
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39860400002)(366004)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(4326008)(2906002)(36756003)(2616005)(8936002)(8676002)(26005)(76116006)(6486002)(478600001)(6916009)(64756008)(91956017)(86362001)(66946007)(66446008)(316002)(66476007)(54906003)(66556008)(5660300002)(53546011)(122000001)(38070700009)(55236004)(71200400001)(38100700002)(83380400001)(6512007)(41300700001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?prM491y24UUXihzlS3FaDRdsNe+xQmZwTh1Q6pzYM/sqiFAYnul7CPeT64?=
 =?iso-8859-1?Q?+TgeFIUdqfSEGNBGCILuo52DPy8OomsSGn0CeOFtdxKbCGx2txUiLWQPlS?=
 =?iso-8859-1?Q?cmyhtKWgivZhsLd3f676QV7i+vHMgDTGBhajV9MmL7DV+KB2HgDM8I/a9R?=
 =?iso-8859-1?Q?dLcz8dw72FX+UgfhK/ws9Y6lsTdl7DCYG+i2XwK8iN1dUuMV5gsZjharhs?=
 =?iso-8859-1?Q?YG9zuA7iukBab9oFkTKzrU8f3H1l+0fEYrGXDUEetr0eB1u6/ttrtntOU5?=
 =?iso-8859-1?Q?UC0dMgdKPx/3g0gqM0M6YSMyWMP8ek9yjjNj9qYS5p/8Kqk2fGvvO/vDXm?=
 =?iso-8859-1?Q?99JV0QsdMpwxOgLXAnfVgZ5eQ3oRA2KehENbo2jx3ll+Nvdd2ycNeZlkCq?=
 =?iso-8859-1?Q?vXe0hv3HQ3KXUW3i/4OQKsZsWRlm2scOvjqwgOiSqxCLswP7XbSbBIQYgq?=
 =?iso-8859-1?Q?TcpY8i1fHC4Ouj9MkCK1lxoYq5iHnX+FzwD7kQG6i6mP4KWpMkGUDSjuDB?=
 =?iso-8859-1?Q?O7W6uuCt3h7+jn/Ch/X5BoTtK/QSoDdru1CivSGlnNxyZnLm7mS3AdpzwD?=
 =?iso-8859-1?Q?eG/ifw1Mi/f866B5KblUiIaJ1X2HOze+tGpYnYmeI4l6E7CIKQEN5ouUlp?=
 =?iso-8859-1?Q?AxEjWFeX50IpqWf7y+8re7WSfiY8KDlV4QNUWmPd+LiaxnhTS1He75OJPo?=
 =?iso-8859-1?Q?d3DHLwnHStRn3Q88KDOmGCevNk70uph5yV3L4dqdgg6cdv1UxZ44djiex0?=
 =?iso-8859-1?Q?AaBF3Db4AWW9h/LPyxZRWa9+HvQOIt8+U7ofCq2UPfoCnzjwC2qrTgNPgp?=
 =?iso-8859-1?Q?o+XgvEAko/lRwYbc3vzA7til/Osw+JoNeNbZFIWpBc7ll0xW1WOnHPt45j?=
 =?iso-8859-1?Q?5EUg6asuHdRmuxRWI5wQ4TRnsGbpTVmV2NM7IG2Cw5Mn3+4Cx8Jr2IFx2a?=
 =?iso-8859-1?Q?eTpWyM98E8iiFBf2mjwPsoh2uVKp3sdawabKj5KdfxgNjlPV/4euKKn4Mp?=
 =?iso-8859-1?Q?IZWzqzZG+yXX6NqjpDLOA97E69QGreve6HhGK4q+WeScabqfYmr14HQHDQ?=
 =?iso-8859-1?Q?vZJAlwEx7NoF5X7KVrkaKYciLmJXfOTocMWPoxG7ja/QB5wvAqptDjfZSy?=
 =?iso-8859-1?Q?5m3ChkVOxEZtbUcDiD9ge38MTE5tDeMED6LejG8Mgy9SWWqOKhxTcSZbHV?=
 =?iso-8859-1?Q?HbwyKOioKCmcesaiFMz6La0fuBVKtqkNrsTUI25b5/emPSx6kU1gWnwgiv?=
 =?iso-8859-1?Q?QTF4CPmlyV+SRB9Km0qv5KOwtOiTONVBvns8YS/3ug5ZapgJ3miQLHF26S?=
 =?iso-8859-1?Q?U+ixM40n3XmXQo6tgAicBzT9Ry8cz1y7UPkcZajGtJ1OsZ68G0F4IXzb6k?=
 =?iso-8859-1?Q?3Ty20VoimaMm0OZFh4/5mjM7+S/mTpVn0stLuzPV4Cbo/NDfOrNDIfpa4Z?=
 =?iso-8859-1?Q?fBey1A67PzR7GiwYkFlxTtcA+h4b4CR7b7I0IYgaAhW3QPEnwLgJhfVGcN?=
 =?iso-8859-1?Q?cOhPaPvFg1Lg81Uuy9a9kfgyrsyDVuAtZ3s7O0XwGSgI8TRReSptRHJhEw?=
 =?iso-8859-1?Q?T/vMtertkaNJw+t0t0QwrcXAFEXji6+llF2Pgkn2Lnu3v15SryOOlS6778?=
 =?iso-8859-1?Q?9yaUMZ+lJlqnKmC/pfMbToV9s+OU6Vc68gpUx85eHdUz0fFcohseqr1w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3884c595-a4d3-4f18-da87-08dbe6b5b51c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 15:07:10.4846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJ+sFDog2K3c8sadFSUh50CmZg+va1tgbeXoY1OiCyN2499jWLOwBA9zlOHfO4Nrm0ZbOhUNmNFHDD587h5bRTwzSrdRRC7aanYZi3TEkvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9893
X-Proofpoint-ORIG-GUID: iIUAExXcKKIPD3HLjMEp1ODdIT6pRgy1
X-Proofpoint-GUID: iIUAExXcKKIPD3HLjMEp1ODdIT6pRgy1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_15,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1011 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311160118


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> + Stewart, Vikram
>
> On Wed, 15 Nov 2023, Oleksandr Tyshchenko wrote:
>> On 15.11.23 14:33, Julien Grall wrote:
>> > Thanks for adding support for virtio-pci in Xen. I have some questions=
.
>> >=20
>> > On 15/11/2023 11:26, Sergiy Kibrik wrote:
>> >> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> >>
>> >> In order to enable more use-cases such as having multiple
>> >> device-models (Qemu) running in different backend domains which provi=
de
>> >> virtio-pci devices for the same guest, we allocate and expose one
>> >> PCI host bridge for every virtio backend domain for that guest.
>> >=20
>> > OOI, why do you need to expose one PCI host bridge for every stubdomai=
n?
>> >=20
>> > In fact looking at the next patch, it seems you are handling some of t=
he=20
>> > hostbridge request in Xen. This is adds a bit more confusion.
>> >=20
>> > I was expecting the virtual PCI device would be in the vPCI and each=20
>> > Device emulator would advertise which BDF they are covering.
>>=20
>>=20
>> This patch series only covers use-cases where the device emulator=20
>> handles the *entire* PCI Host bridge and PCI (virtio-pci) devices behind=
=20
>> it (i.e. Qemu). Also this patch series doesn't touch vPCI/PCI=20
>> pass-through resources, handling, accounting, nothing. From the=20
>> hypervisor we only need a help to intercept the config space accesses=20
>> happen in a range [GUEST_VIRTIO_PCI_ECAM_BASE ...=20
>> GUEST_VIRTIO_PCI_ECAM_BASE + GUEST_VIRTIO_PCI_TOTAL_ECAM_SIZE] and=20
>> forward them to the linked device emulator (if any), that's all.
>>=20
>> It is not possible (with current series) to run device emulators what
>> emulate only separate PCI (virtio-pci) devices. For it to be possible, I=
=20
>> think, much more changes are required than current patch series does.=20
>> There at least should be special PCI Host bridge emulation in Xen (or=20
>> reuse vPCI) for the integration. Also Xen should be in charge of forming=
=20
>> resulting PCI interrupt based on each PCI device level signaling (if we=
=20
>> use legacy interrupts), some kind of x86's XEN_DMOP_set_pci_intx_level,=
=20
>> etc. Please note, I am not saying this is not possible in general,=20
>> likely it is possible, but initial patch series doesn't cover these=20
>> use-cases)
>>
>> We expose one PCI host bridge per virtio backend domain. This is a=20
>> separate PCI host bridge to combine all virtio-pci devices running in=20
>> the same backend domain (in the same device emulator currently).
>> The examples:
>> - if only one domain runs Qemu which servers virtio-blk, virtio-net,=20
>> virtio-console devices for DomU - only single PCI Host bridge will be=20
>> exposed for DomU
>> - if we add another domain to run Qemu to serve additionally virtio-gpu,=
=20
>> virtio-input and virtio-snd for the *same* DomU - we expose second PCI=20
>> Host bridge for DomU
>>=20
>> I am afraid, we cannot end up exposing only single PCI Host bridge with=
=20
>> current model (if we use device emulators running in different domains=20
>> that handles the *entire* PCI Host bridges), this won't work.
> =20
>
> We were discussing the topic of vPCI and Virtio PCI just this morning
> with Stewart and Vikram. We also intend to make them work well together
> in the next couple of months (great timing!!)
>
> However, our thinking is to go with the other approach Julien
> suggested: a single PCI Root Complex emulated in Xen by vPCI. QEMU would
> register individual PCI devices against it.
>
> Vikram, Stewart, please comment. Our understanding is that it should be
> possible to make QEMU virtio-pci work with vPCI with relatively minor
> efforts and AMD volunteers to do the work in the next couple of months
> on the vPCI side.
>
>
> Although it should be possible to make both approaches work at the same
> time, given that it would seem that EPAM and AMD have very similar
> requirements, I suggest we work together and collaborate on a single
> approach going forward that works best for everyone.
>
>
> Let me start by saying that if we can get away with it, I think that a
> single PCI Root Complex in Xen would be best because it requires less
> complexity. Why emulate 2/3 PCI Root Complexes if we can emulate only
> one?

Well, in fact we tried similar setup, this was in the first version of
virtio-pci support. But we had a couple of issues with this. For
instance, this might conflict with PCI passthrough devices, with virtio
devices that have back-ends in different domains, etc. I am no saying
that this is impossible, but this just involves more moving parts.

With my vPCI patch series in place, hypervisor itself assigns BDFs for
passed-through devices. Toolstack needs to get this information to know
which BDFs are free and can be used by virtio-pci.

--=20
WBR, Volodymyr=

