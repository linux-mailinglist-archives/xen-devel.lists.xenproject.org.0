Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8642E7EF82B
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 21:10:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635417.991282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r459R-000201-Cc; Fri, 17 Nov 2023 20:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635417.991282; Fri, 17 Nov 2023 20:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r459R-0001xm-9b; Fri, 17 Nov 2023 20:09:17 +0000
Received: by outflank-mailman (input) for mailman id 635417;
 Fri, 17 Nov 2023 20:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1XSP=G6=epam.com=prvs=568571a16b=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r459Q-0001xg-5C
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 20:09:16 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d80fe3c-8585-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 21:09:14 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 3AHIrCKv009470;
 Fri, 17 Nov 2023 20:09:03 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3uebkj0nw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Nov 2023 20:09:02 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBBPR03MB6732.eurprd03.prod.outlook.com (2603:10a6:10:200::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 20:08:59 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::8e03:368:1fd7:1822%6]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 20:08:59 +0000
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
X-Inumbo-ID: 2d80fe3c-8585-11ee-98dc-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMHJUgnRvQNlFSSHruJMZVq0z2k1cVH/MifXnueoEyJXGM3t1BPbG5V38NcEqJ61zUCDpedvxqQxT5sFVg0l2+7BV+NA8kTv5WWmYbs0FKEl+kl3I888ahQQm7NX2jgOdzM49CXFEEyW2+IdoqoR6UenY4dLRzmtBrDEJGbV7OHeVTixbT+OOqQU1SZ/R+JgwPf2DVpGaUqtVHa3vo3WHzjpisqD+MsccGxMh/uWJJH+7T5+JK+PC4KCMNQcSPFSxWjDBYEN3V6FW1kUOZSzS+inQaOLAZiVA3qecZBDTiAwyoYh76qWPyTaODEi0gKAHxTCW39WtDxlz04XK8aWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTizMzB8uNUQPjKZ5dbv9bxLwtSF0iNK1nkilfrUtfs=;
 b=R9/tj63+y0DeuxQLkvGYlkpNvFS9TTSJL/H/7liLLqIymvWlELrf6ljDAwBqkdRbjicnbVvzIO6O0KcjEeIfX4hAS9qsS0mQkzn21NzNDRzswaUD7UoAycvZ5CYOULeE5RZQIhgOK+mklqSdSvjqpUZ6FgWQd472ZX+MzzRdo5E7WX7dphTx2fL6FpkddGLIk9Ns65we5Bu5Jp3unEExGl2SkVY6mYTaX6wTOOyFJkDNUapmAXE4FKMJxhl/wKvkq2iC7aQx+w1yXNokCrSXhN/InTboD1sIuqb9wfpSXceTuNuHIfZqzlp/miRmLq1Ok8uY49/pf3zaluknfPIHig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTizMzB8uNUQPjKZ5dbv9bxLwtSF0iNK1nkilfrUtfs=;
 b=K7uIR8QpboeV/Uyt0jI1bjdbIXS237lyXnwoTMz2SS3Xyko5JXQ4BJoMQ9GPAHoqohUq2si3EHiMhf1WY9hQaTHmZWiGF/Rtc7m+dpe3BaKe+diQUMpstON5Ju21fSPj6OG0SD0+3VKcjqOlxCIy8XyFHenJWfTPQA4Cph+u08oO/oib6waiN5zUeM5Tjt8gDVETg7+ImTt4RhDij3yikaURTiLjuRaJDXD5Sf0UiqBKCW+Ka6sVMhXVM4gQFFkfbF6cjo/JmhxsGrjcdgFJgziObHV9U6/ORwOKFSYgZgtq2bD5zouDB/UDdZjjMLQApiL/9C2jn7Yj/IpKbjMZUw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
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
Thread-Index: 
 AQHZ/Vi+wP3QsyKZ0EartcLXqtnBRLB9UyCAgAB7YgCAAAiUAIAAEHKAgADZXQCAAEyPgIAAGSwA
Date: Fri, 17 Nov 2023 20:08:58 +0000
Message-ID: <8734x43zxi.fsf@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-14-volodymyr_babchuk@epam.com>
 <d6a58e73-da51-40f1-a2f7-576274945585@xen.org>
 <alpine.DEB.2.22.394.2311161513210.773207@ubuntu-linux-20-04-desktop>
 <87o7ft44bv.fsf@epam.com>
 <alpine.DEB.2.22.394.2311161651090.773207@ubuntu-linux-20-04-desktop>
 <87a5rc4gk7.fsf@epam.com> <770aaef8-09f4-480a-95b8-cc0448ad07ff@xen.org>
In-Reply-To: <770aaef8-09f4-480a-95b8-cc0448ad07ff@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBBPR03MB6732:EE_
x-ms-office365-filtering-correlation-id: f7fb2f9e-94ae-4dad-5c77-08dbe7a908f1
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6zChPfBkhHq3KikY2t3phKWlY5XRwVT9fZCTlYoFPRO8aUaQoOotXSy4r6oB3yYdk/PJsyr4kTdZOzFYu2ibOYk6fzwF8sfeGi+kxDsQl3UzaU25ny2+2hUtxkMsRAvsRzOYcuSpQSbO6us+4y9GB2QhqmCvllxx9iI05ovTALkIal/JzWhHh9oblOu04YO+0mxyz0T1cpJdMAcAYZH0jXBxD/N6xx7hU61FbiWdUP31X6g3ltLv7cmTOMkz7MnNuPOI+GtTiKpFvjPz7gRXp/FZejAm5bxE/QC4RbeIOWWDzcKeGh9NlmgNtYGzjFLxSZfkKDTR9qFAqyP8uW6gRte38ME9Go/z3KIz8e0iODb2nXGvQwVutQrWTlWnB0nZrigPblxu8IN2fK7Y5OI+nrAsCTcFGX50dl28Q509yOcNmTjkDXdSlFHp4aUMRvqiEPTHzFOFylKjaeht3JNrpn+tebKC+iWcMO4NZBR078URJzNWv0crHY6xLsCJEOhn6FDkJqaZgEMoqICJFS2GP2tU31Ut3EsrVzmWt238offsgLYuUuuxCgOWLt96KkYu3A0m+WZHk5WIfLw3yHXErl3OFxDb3TVfyCI2Ho87y8+dP8RUuGdIcZ/SkO+mPjAD
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(41300700001)(36756003)(66899024)(5660300002)(86362001)(2906002)(38070700009)(83380400001)(122000001)(71200400001)(6486002)(478600001)(6512007)(26005)(2616005)(53546011)(6506007)(55236004)(91956017)(38100700002)(8676002)(4326008)(8936002)(54906003)(64756008)(66556008)(66476007)(66946007)(66446008)(76116006)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tkmiz2xNVSffvmRlK7j4v5cVNdI3iyicGmkybJQhfPeO/1ZPS5fqlt0+Yl?=
 =?iso-8859-1?Q?c1ccvr8Dd4Cmzi6dt4HF9jntZfwUP7O7RoFxjdDsmPVjpo6yaz5EmviPwJ?=
 =?iso-8859-1?Q?yKtCmL/dkIZG0eNe/5wJOtZ4J0TBnlINIsNmb6ov1KAlu1NZIpOgE1hNdh?=
 =?iso-8859-1?Q?yYOEKeuNww1SmYkzIbINvYcwI+84aIDI2nbxVGCCxTvIElIc41sXoli/gI?=
 =?iso-8859-1?Q?LhJ51uKiF0Bhjv/TQrJByEIhdlUtvXZOd7sdfte5bvHCZOExu3Js5I4HAi?=
 =?iso-8859-1?Q?/Gfxcp2DhR5MLO+NHWTHeOIZ7KGxDnXl/BcQAvoUnS1b+YgXTIxth/QsLd?=
 =?iso-8859-1?Q?suXs5Ed66lV9xta+GQEZpoD6yEXxh0sGOTXsOXZhFLVzI5aIMumLg6LZXC?=
 =?iso-8859-1?Q?7GAcC4DWROrl7UbtwhJD4BPjkhBCxij3ixvxQG1587hPvzdHu4uib7TIa0?=
 =?iso-8859-1?Q?jipGm8upvSOSQd6ZHvg+yJ8d60vZL3HFIeczAfEQGJKz1zNiLbWXgBmfAm?=
 =?iso-8859-1?Q?1PFvCeSAGG6QXXRFUXtfrrokD+0HgFbwQt3WmPJKvsFU1bL2xctiltDCxf?=
 =?iso-8859-1?Q?XhxJ7DDpYLq+UtGqXvpiDomxofao5JV53urofQHwAaldQEAynjsIdlDW3P?=
 =?iso-8859-1?Q?SsbcJ6kHTdQlUPIe8TaEHeM/cgrAVU1Khcf3UmBwfWs7beSHdJpBZRBopA?=
 =?iso-8859-1?Q?Pa1OKGwXfCnh1TyH7aSO/VLiTbU3OfYq5fYGjfSMmvP874/trwXGKcpYwq?=
 =?iso-8859-1?Q?vvLYST5wj9v5AbIx23+hT9WRs6+7avPB0L4YkymyLbmqOgQdzn5FkpPbTp?=
 =?iso-8859-1?Q?T2byCUyZDDnzKOVsrsqnoZfz7YhSOiuMx2iYwS6Q2BmOKHV3rKbQnzIvba?=
 =?iso-8859-1?Q?KA5PaSX8f5AFv+wygZktZa85lNqrWaer+rx+xEM01l+eVeax9jmZP9ylOn?=
 =?iso-8859-1?Q?uB6S2efvLTPidypi8evx3sDu5ZCCfXY++89uuHsj0iZymDMDBBSmkqw2ds?=
 =?iso-8859-1?Q?4yvfVVJ57eHB9aOupDEl/obYRJpTCbRU83slRjoYqjPu+pJgy7nKI2baxG?=
 =?iso-8859-1?Q?1yfr00v/ruwuPt+qWvcA23VkfvAzZHnyN5A4Ql0KJmh1QLGV7s7RgE+wMx?=
 =?iso-8859-1?Q?SXuZt9q9jhwFniuJXqjNz8FkFAqGEE9OOPCx5e0MLWcuhKdVCbqymyYWvz?=
 =?iso-8859-1?Q?GIKqfMIUsFyI7JO0IZGdIdb6ITsfgCfpBk1IvHzBcNY3d1Tsc75oS4s2X4?=
 =?iso-8859-1?Q?jpEwGdgwG36R1Z24w7TXz5piI66T9xoOyNuOHeevF6UbVdtC7a2hIUwhSZ?=
 =?iso-8859-1?Q?TU12bdjewFxTCW4V1Tp+kXqRGjAGuxABVMqE4A/nSzpTLGUb7SHGlvZjMi?=
 =?iso-8859-1?Q?4MWqOwF9IcoG0lm7pwKHTvNKisHzGkyjUaIKm2MkmQt11GyE1Yek+8lKdF?=
 =?iso-8859-1?Q?IFfRAYlp61iLaDmal4ZStg1/iZot10834+QDQWojlOow3iEoSHf7s3Y8w9?=
 =?iso-8859-1?Q?s89Ws2Fa7/op1lj+jzwRF/NqUewgr/S8rKd5GkKbUDehi3XL27MN85SN3H?=
 =?iso-8859-1?Q?WAbB1bxO4ROu5dLSJZGOXqiQlmv5fBiqo1IFueuqQ5tJU3fpnkZbpJjg7P?=
 =?iso-8859-1?Q?R3yr/bVJCR/diin11txi6xpO3U9fYs4ag882ZE1o0cQtTNNMEy+/MFBg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fb2f9e-94ae-4dad-5c77-08dbe7a908f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 20:08:58.7999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MTgn3a294aI2P9fRpSAuBe4aMp0e+7tLh3EQWeW1Rcz62QLyvqSpXSltwmUKFkXWYAW7GhiyWZc5HGZor8lun0g+HZopJmIdDjx4VgNyqFk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6732
X-Proofpoint-ORIG-GUID: 3q8TPY0c73Y5Gc--3xTHXhdOb-_BfjmG
X-Proofpoint-GUID: 3q8TPY0c73Y5Gc--3xTHXhdOb-_BfjmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_19,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170152


Hi Julien,

Julien Grall <julien@xen.org> writes:

> Hi Volodymyr,
>
> On 17/11/2023 14:09, Volodymyr Babchuk wrote:
>> Hi Stefano,
>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>=20
>>> On Fri, 17 Nov 2023, Volodymyr Babchuk wrote:
>>>>> I still think, no matter the BDF allocation scheme, that we should tr=
y
>>>>> to avoid as much as possible to have two different PCI Root Complex
>>>>> emulators. Ideally we would have only one PCI Root Complex emulated b=
y
>>>>> Xen. Having 2 PCI Root Complexes both of them emulated by Xen would b=
e
>>>>> tolerable but not ideal.
>>>>
>>>> But what is exactly wrong with this setup?
>>>
>>> [...]
>>>
>>>>> The worst case I would like to avoid is to have
>>>>> two PCI Root Complexes, one emulated by Xen and one emulated by QEMU.
>>>>
>>>> This is how our setup works right now.
>>>
>>> If we have:
>>> - a single PCI Root Complex emulated in Xen
>>> - Xen is safety certified
>>> - individual Virtio devices emulated by QEMU with grants for memory
>>>
>>> We can go very far in terms of being able to use Virtio in safety
>>> use-cases. We might even be able to use Virtio (frontends) in a SafeOS.
>>>
>>> On the other hand if we put an additional Root Complex in QEMU:
>>> - we pay a price in terms of complexity of the codebase
>>> - we pay a price in terms of resource utilization
>>> - we have one additional problem in terms of using this setup with a
>>>    SafeOS (one more device emulated by a non-safe component)
>>>
>>> Having 2 PCI Root Complexes both emulated in Xen is a middle ground
>>> solution because:
>>> - we still pay a price in terms of resource utilization
>>> - the code complexity goes up a bit but hopefully not by much
>>> - there is no impact on safety compared to the ideal scenario
>>>
>>> This is why I wrote that it is tolerable.
>> Ah, I see now. Yes, I am agree with this. Also I want to add some
>> more
>> points:
>> - There is ongoing work on implementing virtio backends as a
>> separate
>>    applications, written in Rust. Linaro are doing this part. Right now
>>    they are implementing only virtio-mmio, but if they want to provide
>>    virtio-pci as well, they will need a mechanism to plug only
>>    virtio-pci, without Root Complex. This is argument for using single R=
oot
>>    Complex emulated in Xen.
>> - As far as I know (actually, Oleksandr told this to me), QEMU has
>> no
>>    mechanism for exposing virtio-pci backends without exposing PCI root
>>    complex as well. Architecturally, there should be a PCI bus to which
>>    virtio-pci devices are connected. Or we need to make some changes to
>>    QEMU internals to be able to create virtio-pci backends that are not
>>    connected to any bus. Also, added benefit that PCI Root Complex
>>    emulator in QEMU handles legacy PCI interrupts for us. This is
>>    argument for separate Root Complex for QEMU.
>> As right now we have only virtio-pci backends provided by QEMU and
>> this
>> setup is already working, I propose to stick to this
>> solution. Especially, taking into account that it does not require any
>> changes to hypervisor code.
>
> I am not against two hostbridge as a temporary solution as long as
> this is not a one way door decision. I am not concerned about the
> hypervisor itself, I am more concerned about the interface exposed by
> the toolstack and QEMU.
>
> To clarify, I don't particular want to have to maintain the two
> hostbridges solution once we can use a single hostbridge. So we need
> to be able to get rid of it without impacting the interface too much.

This depends on virtio-pci backends availability. AFAIK, now only one
option is to use QEMU and QEMU provides own host bridge. So if we want
get rid of the second host bridge we need either another virtio-pci
backend or we need to alter QEMU code so it can live without host
bridge.

As for interfaces, it appears that QEMU case does not require any changes
into hypervisor itself, it just boils down to writing couple of xenstore
entries and spawning QEMU with correct command line arguments.

From the user perspective, all this is configured via xl.conf entry like

virtio=3D[
'backend=3DDomD, type=3Dvirtio,device, transport=3Dpci, bdf=3D0000:00:01.0,=
 grant_usage=3D1, backend_type=3Dqemu',
]

In the future we can add backend_type=3Dstandalone for non-QEMU-based
backends. If there will be no QEMU-based backends, there will be no
second host bridge.

--=20
WBR, Volodymyr=

