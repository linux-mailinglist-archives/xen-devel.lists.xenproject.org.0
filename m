Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 819D37EF418
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 15:10:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635230.991102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zXk-0006ym-5e; Fri, 17 Nov 2023 14:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635230.991102; Fri, 17 Nov 2023 14:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3zXk-0006wG-2I; Fri, 17 Nov 2023 14:10:00 +0000
Received: by outflank-mailman (input) for mailman id 635230;
 Fri, 17 Nov 2023 14:09:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1XSP=G6=epam.com=prvs=568571a16b=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r3zXi-0006w8-Fc
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 14:09:58 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb5d2e47-8552-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 15:09:55 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3AHDrv7c028308; Fri, 17 Nov 2023 14:09:50 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3ue4n2sa3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 14:09:50 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM9PR03MB8012.eurprd03.prod.outlook.com (2603:10a6:20b:43f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 14:09:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 14:09:46 +0000
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
X-Inumbo-ID: fb5d2e47-8552-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frMZ94+2hnWQvwicJqu9lsL/xl2ieGtSevenqZVftPyTc17ncZPBcpdtvjlBzv97XamkrCAE0Dt5aQLPtFX/2E/8hZmkTSiDRqd5tQ4gpYmYRI7MEGaDyWm6OMu2eDFitYYd4/1C5gP0BicbVWVsa4vN6XdqJ1njESn+z31rTqfMXK04J+9sYGG2AaoZJ1moYAlgsge/yW6cPk4gSWrYLWRxSlX3xHz+wjo7PcBnwFcmdo54hs2K1hlnZBYIkYTJ9Iceqg8cfVJ66I3P7Gw9z1YsoveGF/lKjjobzxiAMSTBTH5MtQ3gJcWwgyFP65cQDkxzxFY+/KMcz4CotFKPpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuBBkHLeKxPPcTjX4iPg8HLwrDzoBN98yDG2OCNvbjI=;
 b=Ehldz8NxBTQDrAiVt5tQkmFoQKIqvnqxGS0LFeqILSntN/1z2J45GUrWLH0PePivq2Trm2Zmip8AtDI63b60NOG9UrVsUFAGdewHKIqkVnAo2p8kgqnZa1XHFlbo1JxsIRhcsL7Jytkm6RxTHb8pW72r5dKsMtc/vnI7Gb7ih/vg4HdzWqcTCacQ3O3hjAV2ht9qayR0JwcJNptqgQZEO1aAs7ADBrKgx9t+D4dmx65pETj33/YRv8kF9e17WASRiISVh+XxPv+98Ht3B4Dt2qZDhB8O+XdifoKbrADuGZXqSMxQJab3edPtmxyM47kGtYwHuUjHRfiFRUZGcQh5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fuBBkHLeKxPPcTjX4iPg8HLwrDzoBN98yDG2OCNvbjI=;
 b=ZlAPtyHxGyCOUmzJSMsSWDf4UigHGRWp/2QX8uzvhDzT5NajopfCQGQtYtJDcZBLLFVKI1E9Ok8f/6bu/LZ7fSJCer21qHU+UxF80iHZnv7ezHwSflpuKFctR2XJgs8F5LGNd03U2ieFp3G+gP2dAdufRQeN+g3zm282fV/ibkbiuuowXGpxyrYiTeI8PJjVfiQNEfEd5+JuTYblMXZUkjszJ/oGHhuEDRrrZGPp1S2PniosXEUGHSnV9zTUJ46/TG4QrDpRiQV6/kVbpi0czPa6tjoJ8UYjWA2NIZgK+UklUFHMvpPkoMYV996iNSmvTgNEtnkBFGMz/5MF4Gm2Fw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>,
        Stewart Hildebrand
	<stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
        =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v10 13/17] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHZ/Vi+wP3QsyKZ0EartcLXqtnBRLB9UyCAgAB7YgCAAAiUAIAAEHKAgADZXQA=
Date: Fri, 17 Nov 2023 14:09:45 +0000
Message-ID: <87a5rc4gk7.fsf@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
 <d6a58e73-da51-40f1-a2f7-576274945585@xen.org>
 <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
 <87o7ft44bv.fsf@epam.com>
 <alpine.DEB.2.22.394.2311161651090.773207@ubuntu-linux-20-04-desktop>
In-Reply-To: 
 <alpine.DEB.2.22.394.2311161651090.773207@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM9PR03MB8012:EE_
x-ms-office365-filtering-correlation-id: baa2f263-00d3-44c2-3fba-08dbe776da7a
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 EzzkWjU8B9AtztSnPiABrgDsjPsxIpkocE5cA69CoVeb1MmFthYcNoPbEXSc15+11QVxPqAjf2zKDn1IT/Nr/7nf6Q3onJfgTpzCa9UVGEX9phXGsVNCaF7QDWmYiRFz3B6HWU8j57GZ55DA0/6IEtSHOwmBxMdt0mKQ/53q492iD7uucRZMHrKb+4QGLVuTTy4QhcoqSx813TSPnpQtjrnYGzaGJgxZj2RIpyY6PYS3qk4/EQgtqUODx5QFExCaTcSBGDJRx02C7lpVK+lKq5kdQOICz4peXW+puT7CQ/FSiKA9F5R9wa24lVFjk/ejUU5GNEBchF+UPcyJWZeXB8rjPaAG71TlV+xL4QVxVKOkiVcauNyyUx4N1P6ULQpHzmEAekaDk5L+xYLaODKLtpIkjlpPkLRZ2Up/1uYlFBOYxS7UXmViFcAmPAJzXICCDmtPYFP+Kqd679v1mz63uEyJsaPl97lCDCX0foyTDhOBv1M/giMvkoWkzkuLqyTlKc3YRvfWr5oq2gdh3Z8s38XBGa/s9hdm99rdTFsylD2L6FM98VJv610HoZ/wT1HGYLqxLBGIC7Mu/MT9SI0SNSlwYraHU+9LOP8OoA7jj1S/mIVe9CSIEWkh82JR5ALp
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6512007)(36756003)(2906002)(71200400001)(66946007)(54906003)(64756008)(66476007)(66446008)(6916009)(76116006)(91956017)(55236004)(6506007)(66556008)(86362001)(478600001)(6486002)(26005)(41300700001)(38100700002)(5660300002)(2616005)(122000001)(38070700009)(66899024)(83380400001)(316002)(8936002)(4326008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?pvkGqb3+f0eu1GoIpbyMApOSD8W9HlAkFc10T5FpQARcAntoL27857j7UM?=
 =?iso-8859-1?Q?Xu3bfklHXoNVWJLipj+XmzQ0thZThPBd8UmV2ePthR1BUrRmLfs1wtDC97?=
 =?iso-8859-1?Q?4I3AwKjVwnIWvOac9t78tWwr+/WE9rEMEdbbffb9ORBmYatFC/FLbIBirw?=
 =?iso-8859-1?Q?FT6CvJSphHBmNV/sxR4eWsea+uNiQOFYzKU16vEdeiqz7i5Ydj92NFpeGd?=
 =?iso-8859-1?Q?87ur8VFw2aA8l8X+LZvLmPjlzQVlTFOWOsXznD28/sJjvc8eDr46LfE083?=
 =?iso-8859-1?Q?l0lUGnXsq3zNdfO11iAa2VejkVHV4LqaO2NRp3REDqSgHvVsZavBj6Cwik?=
 =?iso-8859-1?Q?HHK5GYYb81Uwo1PjjkE/KHorWLUdsolFy1bOSol1IGicjTo0QiKLemVdJa?=
 =?iso-8859-1?Q?k9HxMYgKtdhvtOUjrw/jP6vfyi2xSaOCNEKJTV2oNHI3RliSkA3YDqDCpX?=
 =?iso-8859-1?Q?Uc3RM5YdnN7kVHK69mXWDOXp8KPhd9lP3Xi+1+zResa23rOsDzwUbztSAY?=
 =?iso-8859-1?Q?y0Cu0i3+Bvs/1QNju2BZuV4XpVXROaRCWW56fMytnCNQ1PeXO+V7gvNQXz?=
 =?iso-8859-1?Q?NJ1bIlFjg5R/HMVRMku2jq67E+5CLJxH+i5Hl20Yea86u3/RH8/WqiNLL3?=
 =?iso-8859-1?Q?oTDfkshLiKy9869Vi3zgMzMowSEsQnUuHOoHPCmOkYzMLiI5JXiXSc992P?=
 =?iso-8859-1?Q?QyfVqlKDogLCa9DtpGGiNoT57LpK/B6CxPN1ILhqWhy/rGEO/Pcp937K+n?=
 =?iso-8859-1?Q?FV4sapOyMTrOGOQ78uME0dhh2xQ5GTOz56rdw4bBrjAMk7yXSj+LcWO40G?=
 =?iso-8859-1?Q?8t2oHmNcst8F0FhTJCQlWfLkAmemVIkXToeat5NoEKPGgpEkhZw0GXe9cE?=
 =?iso-8859-1?Q?2nBl85j6IzW+EwuvGntIrg4BQgH78Gc9UM+ZMIqGM4xovqtHlT39kybccV?=
 =?iso-8859-1?Q?9A11M/A7i+k+qWd7HmKen2P1vItHrwl/ggEZu/SPpEf3Clk+7vcFv3EJxW?=
 =?iso-8859-1?Q?qHGnAONvfQMkOxvoVgbOSO5d4VrHT6DTiFFOcWmp6PgXi506tnogZ6ZCHz?=
 =?iso-8859-1?Q?k4TNGly9txhR7yKA8EYT1Oh52z20FvdwLRyAIiItc/MZjmQA7SQT5kDyNQ?=
 =?iso-8859-1?Q?Hl3YpoRwfiugfRRMSkkCpFfrVedEnRylVyJJ3afm/AvlW74Xclo6c3bngu?=
 =?iso-8859-1?Q?KffNK0X14A6kGlMi5Bewgwd6Oy1VkQLIx1fpC3nXdxxHWQVfFJX7UoX0Sr?=
 =?iso-8859-1?Q?VIHdEVJGsUDK5K9YbU/deycc5A4vS95v3DeS74CkYGHeabdssxqvXRcrrg?=
 =?iso-8859-1?Q?M6/84VP5NxHBBc9T6MODm72C22zz5MbEGyWwsbLmjgCQ5/Wm5TiZOgb5va?=
 =?iso-8859-1?Q?caC8hZl2P1REzgXWg58hXslObqvCa34KFTZbj1stNLpZqoTksqJ3PiZHwo?=
 =?iso-8859-1?Q?b8duuL/3PdCtb+Dj7wN7/0/SnJs2PhNJTvNWyk0KuSzHquMJrBDwuHkzXh?=
 =?iso-8859-1?Q?6qirhYkKdEWlmNuBvQDPxYu0/F/CqEv1pKHJWeCjUoYCp+7cmMzGqOa1cI?=
 =?iso-8859-1?Q?f2v7gKK4xsq/me8NgMDZDaLHXgzJaUcN8TvPwf/X7/piOUGhR18PDHtV6c?=
 =?iso-8859-1?Q?G4YQReCW+dX6yGvytvgFh/g0KpV8wGjcT8O8pnVwxLZPLlzs4Nx4Gg1A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa2f263-00d3-44c2-3fba-08dbe776da7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 14:09:46.0252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OIPCHojV0A7XoXq68TBImEptoMCWfZshSm9H6rhsTFdiEyq5IUwdxqQD+zLuUm80XUlIl9yjhGzh2Bt6SMoxovJUrGPsbGU8qn7jp0boWgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8012
X-Proofpoint-ORIG-GUID: TQdgYxLt8k2umVUCwoo6LFkaoVJQDVsC
X-Proofpoint-GUID: TQdgYxLt8k2umVUCwoo6LFkaoVJQDVsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_12,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170105


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
>> > I still think, no matter the BDF allocation scheme, that we should try
>> > to avoid as much as possible to have two different PCI Root Complex
>> > emulators. Ideally we would have only one PCI Root Complex emulated by
>> > Xen. Having 2 PCI Root Complexes both of them emulated by Xen would be
>> > tolerable but not ideal.
>>=20
>> But what is exactly wrong with this setup?
>
> [...]
>
>> > The worst case I would like to avoid is to have
>> > two PCI Root Complexes, one emulated by Xen and one emulated by QEMU.
>>=20
>> This is how our setup works right now.
>
> If we have:
> - a single PCI Root Complex emulated in Xen
> - Xen is safety certified
> - individual Virtio devices emulated by QEMU with grants for memory
>
> We can go very far in terms of being able to use Virtio in safety
> use-cases. We might even be able to use Virtio (frontends) in a SafeOS.
>
> On the other hand if we put an additional Root Complex in QEMU:
> - we pay a price in terms of complexity of the codebase
> - we pay a price in terms of resource utilization
> - we have one additional problem in terms of using this setup with a
>   SafeOS (one more device emulated by a non-safe component)
>
> Having 2 PCI Root Complexes both emulated in Xen is a middle ground
> solution because:
> - we still pay a price in terms of resource utilization
> - the code complexity goes up a bit but hopefully not by much
> - there is no impact on safety compared to the ideal scenario
>
> This is why I wrote that it is tolerable.

Ah, I see now. Yes, I am agree with this. Also I want to add some more
points:

- There is ongoing work on implementing virtio backends as a separate
  applications, written in Rust. Linaro are doing this part. Right now
  they are implementing only virtio-mmio, but if they want to provide
  virtio-pci as well, they will need a mechanism to plug only
  virtio-pci, without Root Complex. This is argument for using single Root
  Complex emulated in Xen.

- As far as I know (actually, Oleksandr told this to me), QEMU has no
  mechanism for exposing virtio-pci backends without exposing PCI root
  complex as well. Architecturally, there should be a PCI bus to which
  virtio-pci devices are connected. Or we need to make some changes to
  QEMU internals to be able to create virtio-pci backends that are not
  connected to any bus. Also, added benefit that PCI Root Complex
  emulator in QEMU handles legacy PCI interrupts for us. This is
  argument for separate Root Complex for QEMU.

As right now we have only virtio-pci backends provided by QEMU and this
setup is already working, I propose to stick to this
solution. Especially, taking into account that it does not require any
changes to hypervisor code.

--=20
WBR, Volodymyr=

