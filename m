Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C1D324581
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 21:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89513.168662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF1EE-0006jF-OY; Wed, 24 Feb 2021 20:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89513.168662; Wed, 24 Feb 2021 20:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF1EE-0006iq-L0; Wed, 24 Feb 2021 20:57:50 +0000
Received: by outflank-mailman (input) for mailman id 89513;
 Wed, 24 Feb 2021 20:57:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMv=H2=epam.com=prvs=26891aedce=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lF1ED-0006ii-4f
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 20:57:49 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88f112f4-2d7a-4970-9d11-ea1af0b2a654;
 Wed, 24 Feb 2021 20:57:47 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11OKtdIO024731; Wed, 24 Feb 2021 20:57:44 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0a-0039f301.pphosted.com with ESMTP id 36vyuywmpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 20:57:44 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB5603.eurprd03.prod.outlook.com (2603:10a6:208:174::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Wed, 24 Feb
 2021 20:57:39 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.048; Wed, 24 Feb 2021
 20:57:39 +0000
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
X-Inumbo-ID: 88f112f4-2d7a-4970-9d11-ea1af0b2a654
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFRFkL72iBYUKqZO950N0cjWciICggOPsf3aMDMAHWa6E5PSJNP3oGCCuc/SIzhX0T4aC0jZUmFL0c/gXyZq0PxC4UOe50d8SvvDNz4QDoz6zf70SzD3KmG9pV1REA//lGEY4F51/V37Pib49YDm0pSyjJkszQaGwnt9f1CzlbLYGKnGar58G18g67qmHPgolMQz9u5vihHUbJO394sPsYxvWlBE//XOFAVzyp4F2mKuLBsxMfETMaWfXvEvuz3FdyNkRhxLjw37/ZpnIXgyB19QFrH4RQqcNy/Gvg8sy17rR8g+7INLXwwMtW5TJ8rf1ZoacBXcgt36c6o1KJdxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrqVEyAHN62wb+g3QOCdMW1S4p9d6yIwI0LuCXq8sQw=;
 b=IVlBbVZAVXBLXftjmQ47R0iFScA5uGylTiJPW3vMBHShDdAMcmk5KJamTK8OQheTNDwm6eTySCZvFO2dGUouyDneophadVfDIh9A+W/r2cjQ+sEZdJZ36mELX14sjx4rH8QNWU7YnrxMPyTEHanAs4I7sDfVde8B6fBRni7Rd/MCh88TviCLsRmMXLLYgfIGLw4lse1ZQxUED9BvwQx9F/OZ4gDKUwfIV1PZEN9iaSFWyBP/QPLikz9Hbhjln0Ppbmz074E5c/A8Sdj8QA4GZohz9qpnBZAiqXRzrzG/ksDY9uJ5sPT1ID89aezI78TO1+IV7RJyyDmWqWuE66/0HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrqVEyAHN62wb+g3QOCdMW1S4p9d6yIwI0LuCXq8sQw=;
 b=Tr+6e5sYQh6KC1GQiRo1pX19oj4pVzy2Bp9qMN+u04ZHBEJI1qJ02I78nof3ziq3DqhJHvcWVF8bWA/mh6IxAiALNyr6DFdvHXBwEt7Hf9TvLfT1vUoKpvegzZ9Oo1fzPda07VWuUJscM/HfGKMUTl08r4PjTMmhRcXmV0b0ULXeDpc9uI6qBHwKGNQZJoJ4Y4MNicaNmO7p2n1izg33i3OzIg2hdwXOXmxBtoPA6YPzQ9meNVs5G9f9evYY+wIhZ94+QFyzp0G8JYeRFEP3jZRZRS2LXDJleS+HypSTf8LJOlVecb9OR98+WA5BhLOSOo0x5qSq/aIvDIL/IsWdkg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Dario Faggioli <dfaggioli@suse.com>, Meng
 Xu <mengxu@cis.upenn.edu>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Topic: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Index: AQHXCYx4A6OUUHr1gkqxWv1TEOLkuqplchSAgAAzdYCAAXE/AIAAtX0A
Date: Wed, 24 Feb 2021 20:57:39 +0000
Message-ID: <87o8g99oal.fsf@epam.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <e6d8726c-4074-fe4c-dbbe-e879da2bb7f6@xen.org> <87zgzv56pm.fsf@epam.com>
 <c1c55bcb-dfd4-a552-836a-985268655cf1@xen.org>
In-Reply-To: <c1c55bcb-dfd4-a552-836a-985268655cf1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.15; emacs 27.1
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e1923a1-095b-4f72-1b71-08d8d906d27a
x-ms-traffictypediagnostic: AM0PR03MB5603:
x-microsoft-antispam-prvs: 
 <AM0PR03MB5603DDDBAB713D4272BF5989E69F9@AM0PR03MB5603.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZkiplXuGpnORhn9zXp571Latzk+xAFiH1lClJsHFAuHDewA5iOAsEE1ertBYKlgo+PeO+rMTR+JOluv3QrI8Oz9GDjQVgsTX1l9WioqrnUsbt36A80LJXyNcKCyZvLPuK0nR8wV01Y60jCKOYl+spudH94xnB7+YocvULf+2cAhXMrsBE756rTLDJdVVasVd3woexgCxwGNreFuy7Hb45DoDgl95vDDOlHTOjaNr64U0HAAXWM2yNB2RB4ANUa2MWAWBlj5ladUb+hE0IVEuFXZoNsj4b15SHetzNju4/+GttL8R92xfJvNNH9fSGZREQ2KsFCyMg+mWFqlJfKsdreEIsFXMDRrtGLeO9PrnZAkRqU+/I501H9oYpfSiITzyboy4U2MD06A5seaX2aFq9v8YLSIo7KwlV7u9vDSBKC1vDGoTpDTIry0KtyUNFsCZbcqa2okTsHH+6R4aiSpbYym1MT4Z6MPU5rHRYqYwDYRncFhnJAyi2j/Mc48w7kcD8Ury5lo7q2d1Dw0NgnlEng==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(6506007)(66556008)(66446008)(478600001)(66476007)(8936002)(64756008)(186003)(316002)(6512007)(6486002)(2906002)(54906003)(83380400001)(7416002)(4326008)(53546011)(55236004)(6916009)(66946007)(36756003)(76116006)(5660300002)(86362001)(8676002)(26005)(71200400001)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?O4ZcWJXo4TKjxSGqCfnvKtWVhytOddWtDwBJYx/RjahUja7KLpqCx6UEK7?=
 =?iso-8859-1?Q?UdqZFFP4eHyr2dfTiMJSz20QepS6dbbrCmuj6OVNJYsNv/OJ5S5IilgO9R?=
 =?iso-8859-1?Q?UV8cTbqp1PWNntZ7Q3Df5RqPFXMiM+fQFaV3taOyYyKzbVbCkXUjaeBCd6?=
 =?iso-8859-1?Q?8Jjya8xWQ+MRr020a3wmRQ+AshgSBcxpFV3GU2Pka1m1sVj3dcGu2nvfVm?=
 =?iso-8859-1?Q?BMY98vJeo3RwZfhF/ANqvPtdsXepDxg7jr+4CzW0nOGKgOO5rn+nww8e2c?=
 =?iso-8859-1?Q?749WdzriDhUCvfnj/N27ksfEOk1pbArM7FWMM82VkSzno/tfvwFaWeOtG4?=
 =?iso-8859-1?Q?gWh6WKdoJ2jawJ54084A3X2T0C5wRIilLjZ41x25wiTLecHsfK+06/llO7?=
 =?iso-8859-1?Q?SfMDgaIU10aZJg3tWc972yfGGRmqizKmwA26vikxjG6dmkEp0i3D2xRw+s?=
 =?iso-8859-1?Q?7iDSQgkViw+ZfKL8SbnlUGSJSKVuoYMikSm8BH2UkiEsxyJTAFynIh0/pd?=
 =?iso-8859-1?Q?0VskG17lIYQM1H1yaHqiU4IAahDhjxspakPSui4wUxarFosbYVgJAXixuh?=
 =?iso-8859-1?Q?0vHHBqc7NVg3gahj9EwgK6flSOvG+btqvdKZV7s8VFMiZySrTtK5ngQdSx?=
 =?iso-8859-1?Q?+eHj8S510WFzwVXeUlHy52HNQHMhxkhFNq6jXqehZEzwQziDH6TALzejL6?=
 =?iso-8859-1?Q?Jv93aNMion8DLHNrp419ko7dK/Y13tSNXnmChIUJiQq/gWrfV8xJWy36mT?=
 =?iso-8859-1?Q?cfPI63XnbZTme+zle39uhAsrJUuUVM2PUv9dHVyFrJfDEkVbKxoAaLYHBh?=
 =?iso-8859-1?Q?Xhymc/hJqnU/XEqdamJxojckYFG88Mw7LNA7nwD/14tjwIVxFP4/1wvwdo?=
 =?iso-8859-1?Q?A2hj3N8UlGYR9ZkA7oA3z3DJ+08Ym9ae2dfsFTpZ22yLnCpSwKQgnOrz2I?=
 =?iso-8859-1?Q?90og/xEnzRAJdZlh1JssfE0DBGZN11cZvBqtTsj0I4bYaNfDwxLTU1rJt1?=
 =?iso-8859-1?Q?i7yY1B2aPlP5gBMXrC3v0aembfdSz1NMTceFuec07qirTiEPQSGx3elVuJ?=
 =?iso-8859-1?Q?UYXApoZwi5ttFzUh894s3omT+97iYNAonmfts3G3zabqghvFBMXiCJhBSE?=
 =?iso-8859-1?Q?Un4RLB0+GpJtMKc087IcQdkKE71ErAek0tkrWG1rPnQTx0LuGbXWvwSNzw?=
 =?iso-8859-1?Q?NkTbi/GLEmy7FUrJ4Y891PM8Nd42VzdsUSdUEUbV3ZQK+3nFi/P6pl1EYf?=
 =?iso-8859-1?Q?aFM0C7O9EBAKR9iBKxZeYT0HmHfSQYSFecXWApOgcp5WxuOhbFNeTYOVFF?=
 =?iso-8859-1?Q?RxdBBThBIs42NhYor05/r0LgPUqlFhX5Ne4rdMUHldUSbgflntRDjE9JIy?=
 =?iso-8859-1?Q?EPaRTjxunM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1923a1-095b-4f72-1b71-08d8d906d27a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 20:57:39.5914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: prLLnA59xLrlASnYjXmbeuBXfUOVEjowB+yM1dywhqvFh/4gGmlEAKLNvewmVw/L1LiCUVKjki61I01tmb2XcV3jvV3eAea/CmtVXWAUx3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5603
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 mlxlogscore=925 phishscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240163


Hi Julien,

Julien Grall writes:

> On 23/02/2021 12:06, Volodymyr Babchuk wrote:
>> Hi Julien,
>
> Hi Volodymyr,
>
>> Julien Grall writes:
>>> On 23/02/2021 02:34, Volodymyr Babchuk wrote:
>>> ... just rescheduling the vCPU. It will also give the opportunity for
>>> the guest to handle interrupts.
>>>
>>> If you don't return to the guest, then risk to get an RCU sched stall
>>> on that the vCPU (some hypercalls can take really really long).
>> Ah yes, you are right. I'd only wish that hypervisor saved context
>> of
>> hypercall on it's side...
>> I have example of OP-TEE before my eyes. They have special return
>> code
>> "task was interrupted" and they use separate call "continue execution of
>> interrupted task", which takes opaque context handle as a
>> parameter. With this approach state of interrupted call never leaks to >=
 rest of the system.
>
> Feel free to suggest a new approach for the hypercals.
>

I believe, I suggested it right above. There are some corner cases, that
should be addressed, of course.

>>>
>>>> This approach itself have obvious
>>>> problems: code that executes hypercall is responsible for preemption,
>>>> preemption checks are infrequent (because they are costly by
>>>> themselves), hypercall execution state is stored in guest-controlled
>>>> area, we rely on guest's good will to continue the hypercall.
>>>
>>> Why is it a problem to rely on guest's good will? The hypercalls
>>> should be preempted at a boundary that is safe to continue.
>> Yes, and it imposes restrictions on how to write hypercall
>> handler.
>> In other words, there are much more places in hypercall handler code
>> where it can be preempted than where hypercall continuation can be
>> used. For example, you can preempt hypercall that holds a mutex, but of
>> course you can't create an continuation point in such place.
>
> I disagree, you can create continuation point in such place. Although
> it will be more complex because you have to make sure you break the
> work in a restartable place.

Maybe there is some misunderstanding. You can't create hypercall
continuation point in a place where you are holding mutex. Because,
there is absolutely not guarantee that guest will restart the
hypercall.

But you can preempt vCPU while holding mutex, because xen owns scheduler
and it can guarantee that vCPU will be scheduled eventually to continue
the work and release mutex.

> I would also like to point out that preemption also have some drawbacks.
> With RT in mind, you have to deal with priority inversion (e.g. a
> lower priority vCPU held a mutex that is required by an higher
> priority).

Of course. This is not as simple as "just call scheduler when we want
to".

> Outside of RT, you have to be careful where mutex are held. In your
> earlier answer, you suggested to held mutex for the memory
> allocation. If you do that, then it means a domain A can block
> allocation for domain B as it helds the mutex.

As long as we do not exit to a EL1 with mutex being held, domain A can't
block anything. Of course, we have to deal with priority inversion, but
malicious domain can't cause DoS.

> This can lead to quite serious problem if domain A cannot run (because
> it exhausted its credit) for a long time.
>

I believe, this problem is related to a priority inversion problem and
they should be addressed together.

>>=20
>>>> All this
>>>> imposes restrictions on which hypercalls can be preempted, when they
>>>> can be preempted and how to write hypercall handlers. Also, it
>>>> requires very accurate coding and already led to at least one
>>>> vulnerability - XSA-318. Some hypercalls can not be preempted at all,
>>>> like the one mentioned in [1].
>>>> Absence of hypervisor threads/vCPUs. Hypervisor owns only idle
>>>> vCPUs,
>>>> which are supposed to run when the system is idle. If hypervisor needs
>>>> to execute own tasks that are required to run right now, it have no
>>>> other way than to execute them on current vCPU. But scheduler does not
>>>> know that hypervisor executes hypervisor task and accounts spent time
>>>> to a domain. This can lead to domain starvation.
>>>> Also, absence of hypervisor threads leads to absence of high-level
>>>> synchronization primitives like mutexes, conditional variables,
>>>> completions, etc. This leads to two problems: we need to use spinlocks
>>>> everywhere and we have problems when porting device drivers from linux
>>>> kernel.
>>>> Proposed solution
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> It is quite obvious that to fix problems above we need to allow
>>>> preemption in hypervisor mode. I am not familiar with x86 side, but
>>>> for the ARM it was surprisingly easy to implement. Basically, vCPU
>>>> context in hypervisor mode is determined by its stack at general
>>>> purpose registers. And __context_switch() function perfectly switches
>>>> them when running in hypervisor mode. So there are no hard
>>>> restrictions, why it should be called only in leave_hypervisor() path.
>>>> The obvious question is: when we should to try to preempt running
>>>> vCPU?  And answer is: when there was an external event. This means
>>>> that we should try to preempt only when there was an interrupt request
>>>> where we are running in hypervisor mode. On ARM, in this case function
>>>> do_trap_irq() is called. Problem is that IRQ handler can be called
>>>> when vCPU is already in atomic state (holding spinlock, for
>>>> example). In this case we should try to preempt right after leaving
>>>> atomic state. This is basically all the idea behind this PoC.
>>>> Now, about the series composition.
>>>> Patches
>>>>     sched: core: save IRQ state during locking
>>>>     sched: rt: save IRQ state during locking
>>>>     sched: credit2: save IRQ state during locking
>>>>     preempt: use atomic_t to for preempt_count
>>>>     arm: setup: disable preemption during startup
>>>>     arm: context_switch: allow to run with IRQs already disabled
>>>> prepare the groundwork for the rest of PoC. It appears that not all
>>>> code is ready to be executed in IRQ state, and schedule() now can be
>>>> called at end of do_trap_irq(), which technically is considered IRQ
>>>> handler state. Also, it is unwise to try preempt things when we are
>>>> still booting, so ween to enable atomic context during the boot
>>>> process.
>>>
>>> I am really surprised that this is the only changes necessary in
>>> Xen. For a first approach, we may want to be conservative when the
>>> preemption is happening as I am not convinced that all the places are
>>> safe to preempt.
>>>
>> Well, I can't say that I ran extensive tests, but I played with this
>> for
>> some time and it seemed quite stable. Of course, I had some problems
>> with RTDS...
>> As I see it, Xen is already supports SMP, so all places where races
>> are
>> possible should already be covered by spinlocks or taken into account by
>> some other means.
> That's correct for shared resources. I am more worried for any
> hypercalls that expected to run more or less continuously (e.g not=20
> taking into account interrupt) on the same pCPU.

Are there many such hypercalls? They can disable preemption if they
really need to run on the same pCPU. As I understand, they should be
relatively fast, because they can't create continuations anyway.

>> Places which may not be safe to preempt are clustered around task
>> management code itself: schedulers, xen entry/exit points, vcpu
>> creation/destruction and such.
>> For example, for sure we do not want to destroy vCPU which was
>> preempted
>> in hypervisor mode. I didn't covered this case, by the way.
>>=20
>>>> Patches
>>>>     preempt: add try_preempt() function
>>>>     sched: core: remove ASSERT_NOT_IN_ATOMIC and disable preemption[!]
>>>>     arm: traps: try to preempt before leaving IRQ handler
>>>> are basically the core of this PoC. try_preempt() function tries to
>>>> preempt vCPU when either called by IRQ handler and when leaving atomic
>>>> state. Scheduler now enters atomic state to ensure that it will not
>>>> preempt self. do_trap_irq() calls try_preempt() to initiate preemption=
.
>>>
>>> AFAICT, try_preempt() will deal with the rescheduling. But how about
>>> softirqs? Don't we want to handle them in try_preempt() as well?
>> Well, yes and no. We have the following softirqs:
>>   TIMER_SOFTIRQ - should be called, I believe
>>   RCU_SOFTIRQ - I'm not sure about this, but probably no
>
> When would you call RCU callback then?
>

I'm not sure there. But I think, they should be called in the same place
as always: while leaving hypervisor. But I'm not very familiar with
RCU, so I may talk nonsense.=20

>>   SCHED_SLAVE_SOFTIRQ - no
>>   SCHEDULE_SOFTIRQ - no
>>   NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ - should be moved to a separate
>>   thread, maybe?
>>   TASKLET_SOFTIRQ - should be moved to a separate thread >
>> So, looks like only timers should be handled for sure.
>>=20
>>>
>>> [...]
>>>
>>>> Conclusion
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> My main intention is to begin discussion of hypervisor
>>>> preemption. As
>>>> I showed, it is doable right away and provides some immediate
>>>> benefits. I do understand that proper implementation requires much
>>>> more efforts. But we are ready to do this work if community is
>>>> interested in it.
>>>> Just to reiterate main benefits:
>>>> 1. More controllable latency. On embedded systems customers care
>>>> about
>>>> such things.
>>>
>>> Is the plan to only offer preemptible Xen?
>>>
>> Sorry, didn't get the question.
>
> What's your plan for the preemption support? Will an admin be able to
> configure Xen to be either preemptible or not?

Honestly, it would be much easier to enable it unconditionally. But I
understand, that this is not feasible. So, I'm looking at a build-time
option.

--=20
Volodymyr Babchuk at EPAM=

