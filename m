Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB2232E4F8
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 10:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93540.176483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI6rG-0007RY-I9; Fri, 05 Mar 2021 09:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93540.176483; Fri, 05 Mar 2021 09:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lI6rG-0007R9-Ek; Fri, 05 Mar 2021 09:34:54 +0000
Received: by outflank-mailman (input) for mailman id 93540;
 Fri, 05 Mar 2021 09:34:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kRSz=ID=epam.com=prvs=3698719cea=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lI6rE-0007R2-UO
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 09:34:53 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49635985-3d90-45b7-a5a0-30bb431fe37a;
 Fri, 05 Mar 2021 09:34:51 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1259Ycjd007861; Fri, 5 Mar 2021 09:34:46 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 by mx0b-0039f301.pphosted.com with ESMTP id 373fyugbah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Mar 2021 09:34:45 +0000
Received: from AM0PR03MB4372.eurprd03.prod.outlook.com (2603:10a6:208:cd::14)
 by AM4PR0302MB2738.eurprd03.prod.outlook.com (2603:10a6:200:8c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Fri, 5 Mar
 2021 09:31:03 +0000
Received: from AM0PR03MB4372.eurprd03.prod.outlook.com
 ([fe80::e5e8:38a0:1573:222c]) by AM0PR03MB4372.eurprd03.prod.outlook.com
 ([fe80::e5e8:38a0:1573:222c%5]) with mapi id 15.20.3890.029; Fri, 5 Mar 2021
 09:31:03 +0000
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
X-Inumbo-ID: 49635985-3d90-45b7-a5a0-30bb431fe37a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AX0qhKxyJzwEUPHHUfdELEo+hrjyalDHSmpbASzjfl9wm1LbX3WCrFTQYC5fYucacStthwqklAWvsepxd3A5BK/Wp/EPV5CxrKtUBP9yz6rnGUAYARud13OPptAS88f59HJcsNqEz0icakfShsNldhwrmFp1MpOOdyG3CxCO0QO3b2hUDIqhiOCn5QHjDhxMOfuAqBbKJgnTkUun1Et1p6igAW3qInIxBDTLAA3aa8fQKk3Ngf3hqN0C0NTxhBfi2eSLi2BWliqxsupNCfI7/CUWjURwWiCH3kkJh/P5kCRkYKkOjqWTHcJH7Av4ZlZY9M4ZARS3sHdt16wu0i2jCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMBqWEWWYNRCX7em1yTs78D2mUBVX5lWHaH9h73/aug=;
 b=f3014upCBT8W6B5a4KcYDPJgC8ErQOOnEd/KbZ6mBC1wbD2n0CQ458ZU5ehnWLeeJblNPfHLvpZvnl3VNDDgqX4Jl7p7V7kC8HwD0EwwZbZpHwDj9xMybhm+3SOnnn+E2RjxVXgPMicXiKO38WcHLJUSXOiMOow77aN/QziG/rb5YIZ6pVcBtxK4qrsm806Yv1FvTLExJDJB5VXsCZdfhLCWDCILtP6BcYoArdMP0cxFZoweDnildMPq4PM4wQp2oVdxarK3EfDJr1QWjegvsZ9cd3NlkjIXxidY6qQAda6ckbemL1foU9AB4mSsaPppFgNywmIvalknjalhLL3K/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMBqWEWWYNRCX7em1yTs78D2mUBVX5lWHaH9h73/aug=;
 b=h1dXIngMcGM835KOgaXSF/bJIhFpj8eLHYuHdRQLHf1xLULisEhSQh8FNCKw+mqGKsM4i4J5gHWQxWgpriivRk6dosSym4OJwy8qkHPl/Kv5mq4XGrb6eIBohhjsWoXZfY2Y2UdwERsQ/1svxFvmFomMxdrC5MgWsXhHjl+Tm3b94xD4sIs3QPjQJylB5rH8QCkqs+kpXIGX+xqmT4leTkRAt3T+/u1todvlxSp4sWGpg2R9N7octdTSY/l0mxwg0RPqUVOBs0VLpQJ08b7mlEruvhEPo9UkQDhg19NbP5xE0h5XF2JNSjufvxxI8JcmuTh9AmdOAdDZNDik66IN3g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Julien Grall <julien.grall.oss@gmail.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Dario Faggioli <dfaggioli@suse.com>, Meng
 Xu <mengxu@cis.upenn.edu>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Topic: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Index: 
 AQHXCYx4A6OUUHr1gkqxWv1TEOLkuqplchSAgAAzdYCAAXE/AIAAtX0AgAAaNQCAABhvgIAAC3gAgADMQgCADFrIAA==
Date: Fri, 5 Mar 2021 09:31:03 +0000
Message-ID: <87tupq9cbt.fsf@epam.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <e6d8726c-4074-fe4c-dbbe-e879da2bb7f6@xen.org> <87zgzv56pm.fsf@epam.com>
 <c1c55bcb-dfd4-a552-836a-985268655cf1@xen.org> <87o8g99oal.fsf@epam.com>
 <CAJ=z9a0v37rc_B7xVdQECAYd52PJ0UajGzvX1DYP56Q2RXQ2Tw@mail.gmail.com>
 <87eeh59fwi.fsf@epam.com> <28f8ffcc-d2df-438c-4fa8-a8174d897109@citrix.com>
 <87a6rs9uq3.fsf@epam.com>
In-Reply-To: <87a6rs9uq3.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.15; emacs 27.1
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ef5c8b1-49a2-4215-6f6f-08d8dfb96530
x-ms-traffictypediagnostic: AM4PR0302MB2738:
x-microsoft-antispam-prvs: 
 <AM4PR0302MB2738238ABE66D95969D74F8DE6969@AM4PR0302MB2738.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 K5f7hoHXixkWR5cg/vVKuVdWCuxprorAQgn2byPvLIP+LSfEACCn9aPk9SGfzXFcxz9lQX8x8JHBtRXO5kXexfqhXTWe4BcTXUPTesVDKMCR+FD+/wpPslQKGhL5kYQHYyJiPICrUNsvXwqghxAUHxSPY/QksIrKNy4lgAi5LWZu92hW6Xtj0QOdF6YLDXNiEqyoMv3Hh28yQtmDUBf4lTfZArA30Lmc9sPlhTQBuDQEYpnBU0eNn1AIu77eshYBjZ50Xy3cqqSW/nnm0dEFDOhlTOcBMvX+F2bD03hxXmcjSS7SCbmHZvsgBK1ezgFUkJ47EPEl8BWxLQ7fOE4Tb4iRlrSppOEhRlvFiXjWa+Ue5rICs5N0Ii5aM1UkVUH2hqWt6WIOkWQwnViIrwhPYZUflEbIZA7VQ/Vcvn2uEzBd3/rpWFXJmwjdQp42AoTItPB/6/wVGejlpDMndiNl1eXYfUl9MKxOvOpB/w6uLrm6SpjIsZiS6GjOfAw4Ar/zsGfm9EivSRAITyLTHgCd3w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4372.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(36756003)(5660300002)(4326008)(71200400001)(8676002)(8936002)(83380400001)(186003)(478600001)(26005)(54906003)(7416002)(6916009)(66446008)(86362001)(53546011)(2906002)(55236004)(76116006)(6486002)(66946007)(316002)(2616005)(64756008)(6506007)(66476007)(66556008)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?15XtGNwQ3Q4KN03S1KF0/R//RXX3X1H7VUtF1i/JgBcoMqWUz3MRWhgNMM?=
 =?iso-8859-1?Q?IhLn73rkc8lxtE4dK6yKRx34Y5q6JVxnmb3828ZTnLPvARGEzdnDPceGBm?=
 =?iso-8859-1?Q?TRlxwwhkbQZERdkjt3SwyNRw9vWSE8u8HX/ltWpv9+ivg4psJExXdk+AG5?=
 =?iso-8859-1?Q?p2sD4KiRUSaNVAJz4+iZTXOSyndckNTm3Rq/OtVkjaZZTcmW0RYZDP8U0Z?=
 =?iso-8859-1?Q?tuQOjwzOovAcgP/OJfB7yuVgp68ZXaIa715pH1mVbFu/aXyq3chP3Z1/ta?=
 =?iso-8859-1?Q?I///QE1IMbXMdFPlUR3SHZFrDlYKAhINkE/VIO0Co38R2+n3lNzBbFpbcR?=
 =?iso-8859-1?Q?U8eJc037YZun6vOcJrVWitHNxJEmVI6Rf71CUW27nrQZG7wXk6y3yBpEGP?=
 =?iso-8859-1?Q?63KeN8se0jl+GkofIylXVqEl2Qa1AexOxsxGLm9fBNA4P3sXKJnrZErQc3?=
 =?iso-8859-1?Q?KvQn12X1VjblavmOqr4gYSHWzzSM6N7Nm06tvC62qaNjK1gUH8eUZEQ//O?=
 =?iso-8859-1?Q?oIEHhSdD9gocsybYXU3bTC3pwZz0fm1jlxeowiaSuYAuwy6POMtTGf5rka?=
 =?iso-8859-1?Q?ksNECySRVq96f/py4INNYwMmMkBX4bq+G/aVqeYFthYFpHuLwn3iO/mjZa?=
 =?iso-8859-1?Q?0lQR4e/0S5kf3PPQY3NYzBn9dSji5aI4uL9Kytg60oy7sCrU9szRpRajS3?=
 =?iso-8859-1?Q?Z/QG+7ALFau6bY/t8a4gGsNxMvTgpf6LFtNHM1H8gLCvRi0+rmoN6giDLi?=
 =?iso-8859-1?Q?LJJgJ4J9eCzJRB+Z6k3zfO56wU/Rz4lQgEezORqidMCLb1hosEK1X1co7R?=
 =?iso-8859-1?Q?VmCgNplL7IUD0w8j0Rqz72FGCrp3X7s99IjAqyBzNQRVH2n4mEN5RoqwqC?=
 =?iso-8859-1?Q?6VSwfrubxHBLMggneNzQebrJeeWsmE6739h38O0Isc+YkOfkMeJRF6P6f2?=
 =?iso-8859-1?Q?jFaH7BMmMBHYLnZGQAsStyQvlIBIyy2pJFdQekEubYMkS9h6SYPqnBRVJu?=
 =?iso-8859-1?Q?MWV/aW69ucAZC2BQTSCsVH4gsSWAeS+nXpJ4Up3MkMgFNjF+JVp9cJdxbv?=
 =?iso-8859-1?Q?6Jp07YziZejW8MB43xwNtaG4GlklX3jegdlNKvvook8RhMbf5Ac7/ycePG?=
 =?iso-8859-1?Q?2F5MPQfTfBDvZwexyLmxMXjlXvvgFe1ph2RWBMraV/8qBBhpHCxHsgsQaN?=
 =?iso-8859-1?Q?QDgbxAKPPsWXa5uPHCicMrg2N/MCgcDJrkd6pqCfW+WecSHotipU/dDYuG?=
 =?iso-8859-1?Q?Bf0ZSlxPOXqByT+2S5ZyPuIeqqLo9KvEjH08s7UNSeWHGQd/CwTPwuDG6r?=
 =?iso-8859-1?Q?iqaNiWQ5WjafyTC950leEbkBoheZjGLukjOu4/j3X3mFFSvQOvtBwtIZQA?=
 =?iso-8859-1?Q?zKM7CohCmd?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4372.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef5c8b1-49a2-4215-6f6f-08d8dfb96530
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 09:31:03.1782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /u+IddQATtN9QApbRfXd5OsOWXjt4xo7Pr7L/rfdzZ3F17Q2gXofAeenPvBEHdI0/s394aEhFHz9AuEmx4Idb2QelMchZufP2hmianJuLIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0302MB2738
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 mlxlogscore=755
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103050046


Hi,

Volodymyr Babchuk writes:

> Hi Andrew,
>
> Andrew Cooper writes:
>
>> On 24/02/2021 23:58, Volodymyr Babchuk wrote:
>>> And I am not mentioning x86 support there...
>>
>> x86 uses per-pCPU stacks, not per-vCPU stacks.
>>
>> Transcribing from an old thread which happened in private as part of an
>> XSA discussion, concerning the implications of trying to change this.
>>
>> ~Andrew
>>
>> -----8<-----
>>
>> Here is a partial list off the top of my head of the practical problems
>> you're going to have to solve.
>>
>> Introduction of new SpectreRSB vulnerable gadgets.  I'm really close to
>> being able to drop RSB stuffing and recover some performance in Xen.
>>
>> CPL0 entrypoints need updating across schedule.  SYSCALL entry would
>> need to become a stub per vcpu, rather than the current stub per pcpu.
>> This requires reintroducing a writeable mapping to the TSS (doable) and
>> a shadow stack switch of active stacks (This corner case is so broken it
>> looks to be a blocker for CET-SS support in Linux, and is resulting in
>> some conversation about tweaking Shstk's in future processors).
>>
>> All per-cpu variables stop working.  You'd need to rewrite Xen to use
>> %gs for TLS which will have churn in the PV logic, and introduce the x86
>> architectural corner cases of running with an invalid %gs.  Xen has been
>> saved from a large number of privilege escalation vulnerabilities in
>> common with Linux and Windows by the fact that we don't use %gs, so
>> anyone trying to do this is going to have to come up with some concrete
>> way of proving that the corner cases are covered.
>
> Thank you. This is exactly what I needed. I am not a big specialist in
> x86, but from what I said, I can see that there is no easy way to switch
> contexts while in hypervisor mode.
>
> Then I want to return to a task domain idea, which you mentioned in the
> other thread. If I got it right, it would allow to
>
> 1. Implement asynchronous hypercalls for cases when there is no reason
> to hold calling vCPU in hypervisor for the whole call duration
>

Okay, I was too overexcited there. I mean - surely it is possible to
implement async hypercalls, but there is no immediate profit in this:
such hypercall can't be preempted anyways. On a SMP system you can
offload hypercall to another core, but that's basically all.

> I skimmed through ML archives, but didn't found any discussion about it.

Maybe you can give some hint how to find it?

> As I see it, its implementation would be close to idle domain
> implementation, but a little different.


--=20
Volodymyr Babchuk at EPAM=

