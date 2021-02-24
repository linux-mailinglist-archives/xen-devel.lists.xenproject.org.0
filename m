Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565F03247B1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 00:59:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89547.168730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF43e-0007lb-Tk; Wed, 24 Feb 2021 23:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89547.168730; Wed, 24 Feb 2021 23:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF43e-0007lC-Q1; Wed, 24 Feb 2021 23:59:06 +0000
Received: by outflank-mailman (input) for mailman id 89547;
 Wed, 24 Feb 2021 23:59:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMv=H2=epam.com=prvs=26891aedce=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lF43d-0007cZ-0B
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 23:59:05 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5d384d1-4942-4027-98e6-747f7df000b8;
 Wed, 24 Feb 2021 23:59:04 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11ONux2H006978; Wed, 24 Feb 2021 23:58:59 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
 by mx0a-0039f301.pphosted.com with ESMTP id 36w1mr5d8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 23:58:59 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB5089.eurprd03.prod.outlook.com (2603:10a6:208:10a::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 24 Feb
 2021 23:58:54 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.048; Wed, 24 Feb 2021
 23:58:54 +0000
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
X-Inumbo-ID: f5d384d1-4942-4027-98e6-747f7df000b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exGuiaUfxqIsnnrijaEofJi8EoDccZj5aBfPJ9kr2uIjB1aqaGS49OAcBZFfi6EBNA8yC6UHdpc1+xtc4+wlJOjsBd0CmeQoK2i3+CsN/mVNh0CQVdz74gomHQEI8vSedGUAC4VDnILH0MT5GlAfwbRYkh/IKEkVEp8BqFq9boL12TjhrQRajjxZYoj1rmekIJWbgNPE76rAMOE2DX8SfY2b4S+e45db5rqNEbH5CrsPomvdZbVO4f2hkfdo69HhT1bPjU0TNyg6aulWpBzPxtbwos/K/GJLcz7FyETHMnfAz+WKeJnjQlFbvPcJSxUtG3wiv+p/vD6NvpIw58QDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KEyaSnnXSQi47ErcDhJ1QhWjuqGllib1++JC4xzFzU=;
 b=UqTz2EJw3EruXKwF33tlpXdys9peb3kT9+jJ4ILxsNxVsnIe9Gs0K0W2GaIZa/V7fnlvD4nVg5uLn7ppRLFz8n885cCyvm56le41B9irBdEQUqyOB2To9oSMkADIkwsG2uv09aROT4wq9x0PR94gt0ZyF/kGR76Z52FkS5aJhIJlAdOjoFb+D3WLLIaqYjuVLA18ekak2o6XBHhcnm6o+eTEJNX6M8IV1qonMbH//ElNf0LrVQBsuTsl9gMRtrY5mfkAM6E2VtNA5owB0XEf0THrFiTwMiOQU4WpCCbMJvEm2/nEnH6Ed9BBcMeLIY6pnBU49//9ZOLGrUMA/NvcPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KEyaSnnXSQi47ErcDhJ1QhWjuqGllib1++JC4xzFzU=;
 b=3Yq5KE1x+mQRxtTWUmj2oCy1i9FxoC3PyWrnpfgIgaKH4dm1RNpSmeOIPZocwOi3JWI0UZwhJ4mFzRyUr2jsFZYRrmS8AsmKshOqQBtBeOhsMcMTkZMRp5MFQYGhXJjil59Gz1b04+9rERXkIKAwqeJolzvRhEupz32w2fMwixkRtba7bRu7rKq5jb+yGj0PQFxBl7vsdUwHjMQCYlFEQOxyCZTO5RN1Rkdp9wVBkJYzjP6zkpD6G6q725bBr+VgtjHYzBbsbNVlMYcWzbQN85yPl7CBEAwoA8Qw87sihY3K+0HYt7lUghcP0M94cXOMZ2aiKPOD2WFpKiMr7x5sig==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien.grall.oss@gmail.com>
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
Thread-Index: 
 AQHXCYx4A6OUUHr1gkqxWv1TEOLkuqplchSAgAAzdYCAAXE/AIAAtX0AgAAaNQCAABhvgA==
Date: Wed, 24 Feb 2021 23:58:54 +0000
Message-ID: <87eeh59fwi.fsf@epam.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <e6d8726c-4074-fe4c-dbbe-e879da2bb7f6@xen.org> <87zgzv56pm.fsf@epam.com>
 <c1c55bcb-dfd4-a552-836a-985268655cf1@xen.org> <87o8g99oal.fsf@epam.com>
 <CAJ=z9a0v37rc_B7xVdQECAYd52PJ0UajGzvX1DYP56Q2RXQ2Tw@mail.gmail.com>
In-Reply-To: 
 <CAJ=z9a0v37rc_B7xVdQECAYd52PJ0UajGzvX1DYP56Q2RXQ2Tw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.15; emacs 27.1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b5ac869-a17e-4cbf-89c5-08d8d9202460
x-ms-traffictypediagnostic: AM0PR03MB5089:
x-microsoft-antispam-prvs: 
 <AM0PR03MB508919F0CA43F580590AFFADE69F9@AM0PR03MB5089.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xW8lcLyPqqhLWJPueG/v+Expe6q1R2zbnDwH+YaZ5+soDIBH0tg3dOH0tUYfrOvVDKeyYyTEh7AQ0EaZBVYZw9YH8Dywy0UV2Q4R4i9Uy3TlVM9bndVT9K6efYfo/zig8S025gsZgP8yewv3X2lhdsVwx+YHFLI45nifNw/iEr9flRGY5PMObNGlYY6Vf89IP7o4bPzN2QuiKTGd5zXHO9tJDDCvltTuBRqFoVSjySHqgFJYnBzfVMctYq6kRxwbQWe0t/MyRanubdTqlZyjHrOmyXY5nQfqlkkCr8BRTIGI6CtRjv944AjX4SRf1RaVFfC1OIr1F/IrPF3+nzAjvvP8J4Vxp0+GG+abJ3piF58F5z6SUgVwbSwPxgTgNmrj9copnTwaupdrTMLONqeBRgOpuVzmIeDxI06J/d9zNbBmP5gpwGzIBBstQNs98BQ3Mx5F8qmGT7qwIu3K4TRG42tSIpqvphZz49WPOXQJA2Cv2WTEhEF23NaZNSNkrx94zxlW3kKnUuirQ4o9NZklew==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(76116006)(186003)(6486002)(53546011)(8936002)(8676002)(316002)(64756008)(54906003)(55236004)(26005)(2616005)(66446008)(6506007)(71200400001)(2906002)(66946007)(36756003)(86362001)(6916009)(66476007)(6512007)(66556008)(5660300002)(83380400001)(7416002)(4326008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?zOwkP8mZZTpRP4ZbO4+dJykds/z8WGy5tXvV2rST49QufV5S2QRE/b9LBv?=
 =?iso-8859-1?Q?kWcekCSYgFqJXibtlNP7j4fZrq9lbeQiNVNCAYt0u9yVp8k9BMbaCVziGj?=
 =?iso-8859-1?Q?PIdr1qXyH+5tNex6hkiLNuCe7nB4qIvs5459Yk1BwrO76PAh7yKe+b7Wp3?=
 =?iso-8859-1?Q?b+WEOFL/bYS3ENKY/W0HQXsXopfveJaj5e2arnlH2GdnIdw1w6+i48HQue?=
 =?iso-8859-1?Q?uWp9lLnWe/9SE9v8UYQwGVC15bU0HrMXaUlhK8TvIHZ8kLgNLoe20BD/GT?=
 =?iso-8859-1?Q?y0BvCpN2oL3LtYJejECNoQs1ygq7hQKa0Tfk7m0mIIreK+SQNUFOZLSHCl?=
 =?iso-8859-1?Q?zD632wtDnk5TVuOtvvMdu/1ucZYBas4y5aMAHupE1vACEGYum+EwfPdXZi?=
 =?iso-8859-1?Q?f/QylnvbnTm9zAfAEoYvVarQtKU2tXd2Jrjn1bvC1zmVMHLymCIlZysPCz?=
 =?iso-8859-1?Q?U5i7WlVDbqmLDsYPe+wY5L+X76NfxAw2H65o7HVPBfhWy/KARWKsa7aaLB?=
 =?iso-8859-1?Q?vJg3+mATiqoWWVG5XdgREMVTW+KXaco8xQnj24w6NdodDluZ2uBxvlIYde?=
 =?iso-8859-1?Q?wHpSUHuNcrGp0Nj/frOCrAR7zyTipBNdA1wM1y1zPfL7wYjqP9t00tDMRl?=
 =?iso-8859-1?Q?WC0NuNbFMGGN3PIeHChAqxpoWiJIOB3io42LBzi03oBgRtEpuphuYbTRvf?=
 =?iso-8859-1?Q?ZlFB787xj9olytnGLL5nrOZ3fSbvNeIs6kNzw06LXmtS8/bBPuuGUnO7iA?=
 =?iso-8859-1?Q?yA374P25GQvVlVLec8CvtNnu/AovvQwIfGsBshNYDWYGqzChuDBorPpoNf?=
 =?iso-8859-1?Q?K/1p2JJVzoRtFv/ae4P8l2jPithgJQhkSlZmwbOgZprGjMktBz+Mb8L2dP?=
 =?iso-8859-1?Q?OzqZFWiyLK/cuY3ImPV3ivJFUqME9oLXhVBYoEPaWDNuBAqUO/blcXg2Bu?=
 =?iso-8859-1?Q?nn8tsn33Aec52+9vEgP+qyoLqeQk3Jv4L1w2BDwQxBqdvujaGmaL1qZBFZ?=
 =?iso-8859-1?Q?BTk6UayhyTp2zNX7c2MmwoynSr1YU/48wvhzF8eUiZwhliQwX9xkQfhS5o?=
 =?iso-8859-1?Q?eX3jMMvfjnuH5QpmGUQ28xUwyDTAHeH82bAyIz3m1IMIQrMdRfKuVXh0vX?=
 =?iso-8859-1?Q?iJAfkiRVZQfqnJxTpkWvHqFyPHDO+G8ljwD424G7kOgC+4EFMnEqcU1fzC?=
 =?iso-8859-1?Q?eCWhggwNPPk8qIqmTGKzNFnUabYnCxgd/sK2iKG61g3ttVMTuDTPYmxIQh?=
 =?iso-8859-1?Q?9FT1jTKe8/Z16Pct805WV6RSkx74S9Mlxwja3fC3bV8T0earYEOI0GqDYL?=
 =?iso-8859-1?Q?HBzdp/zAj7NBcK2DlmQAOzYioMQ/MJrqctzahQsggzXzhGe7ktvlKb33t/?=
 =?iso-8859-1?Q?dUDDqTLR3B?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5ac869-a17e-4cbf-89c5-08d8d9202460
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 23:58:54.4193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JFvfbJdbGqmkbLHONbR4pXwMUlJLVtQ5mTb5Kqq3xqA2Am388/lA0/afhDtD1jLTEcqSVjWUeB09Ldqc+WCfEAyoQsM44rQ79+jNt5ybBGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5089
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102240187



Julien Grall writes:

> On Wed, 24 Feb 2021 at 20:58, Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com> wrote:
>>
>>
>> Hi Julien,
>>
>> Julien Grall writes:
>>
>>> On 23/02/2021 12:06, Volodymyr Babchuk wrote:
>>>> Hi Julien,
>>>
>>> Hi Volodymyr,
>>>
>>>> Julien Grall writes:
>>>>> On 23/02/2021 02:34, Volodymyr Babchuk wrote:
>>>>> ... just rescheduling the vCPU. It will also give the opportunity for
>>>>> the guest to handle interrupts.
>>>>>
>>>>> If you don't return to the guest, then risk to get an RCU sched stall
>>>>> on that the vCPU (some hypercalls can take really really long).
>>>> Ah yes, you are right. I'd only wish that hypervisor saved context
>>>> of
>>>> hypercall on it's side...
>>>> I have example of OP-TEE before my eyes. They have special return
>>>> code
>>>> "task was interrupted" and they use separate call "continue execution =
of
>>>> interrupted task", which takes opaque context handle as a
>>>> parameter. With this approach state of interrupted call never leaks to=
 > rest of the system.
>>>
>>> Feel free to suggest a new approach for the hypercals.
>>>
>>
>> I believe, I suggested it right above. There are some corner cases, that
>> should be addressed, of course.
>
> If we wanted a clean break, then possibly yes.  But I meant one that does=
n't
> break all the existing users and doesn't put Xen at risk.
>
> I don't believe your approach fulfill it.

Of course, we can't touch any hypercalls that are part of stable
ABI. But if I got this right, domctls and sysctls are not stable, so one
can change theirs behavior quite drastically in major releases.

>>
>>>>>
>>>>>> This approach itself have obvious
>>>>>> problems: code that executes hypercall is responsible for preemption=
,
>>>>>> preemption checks are infrequent (because they are costly by
>>>>>> themselves), hypercall execution state is stored in guest-controlled
>>>>>> area, we rely on guest's good will to continue the hypercall.
>>>>>
>>>>> Why is it a problem to rely on guest's good will? The hypercalls
>>>>> should be preempted at a boundary that is safe to continue.
>>>> Yes, and it imposes restrictions on how to write hypercall
>>>> handler.
>>>> In other words, there are much more places in hypercall handler code
>>>> where it can be preempted than where hypercall continuation can be
>>>> used. For example, you can preempt hypercall that holds a mutex, but o=
f
>>>> course you can't create an continuation point in such place.
>>>
>>> I disagree, you can create continuation point in such place. Although
>>> it will be more complex because you have to make sure you break the
>>> work in a restartable place.
>>
>> Maybe there is some misunderstanding. You can't create hypercall
>> continuation point in a place where you are holding mutex. Because,
>> there is absolutely not guarantee that guest will restart the
>> hypercall.
>
> I don't think we are disagreeing here. My point is you should rarely
> need to hold a mutex for a long period, so you could break your work
> in smaller chunk. In which cases, you can use hypercall continuation.

Let's say in this way: generally you can hold a mutex much longer than
you can hold a spinlock. And nothing catastrophic will happen if you are
preempted while holding a mutex. Better to avoid, this of course.

>
>>
>> But you can preempt vCPU while holding mutex, because xen owns scheduler
>> and it can guarantee that vCPU will be scheduled eventually to continue
>> the work and release mutex.
>
> The problem is the "eventually". If you are accounting the time spent
> in the hypervisor to the vCPU A, then there is a possibility that it
> has exhausted its time slice. In which case, your vCPU A may be
> sleeping for a while with a mutex held.
>
> If another vCPU B needs the mutex, it will either have to wait
> potentially for a long time or we need to force vCPU A to run on
> borrowed time.

Yes, of course.

>>
>>> I would also like to point out that preemption also have some drawbacks=
.
>>> With RT in mind, you have to deal with priority inversion (e.g. a
>>> lower priority vCPU held a mutex that is required by an higher
>>> priority).
>>
>> Of course. This is not as simple as "just call scheduler when we want
>> to".
>
> Your e-mail made it sounds like it was easy to add preemption in
> Xen. ;)

I'm sorry for that :)
Actually, there is lots of work to do. It appeared to me that "current"
needs to be reworked, preempt_enable/disable needs to be reworked, per-cpu
variables also should be reworked. And this is just to ensure
consistency of already existing code.

And I am not mentioning x86 support there...

>>> Outside of RT, you have to be careful where mutex are held. In your
>>> earlier answer, you suggested to held mutex for the memory
>>> allocation. If you do that, then it means a domain A can block
>>> allocation for domain B as it helds the mutex.
>>
>> As long as we do not exit to a EL1 with mutex being held, domain A can't
>> block anything. Of course, we have to deal with priority inversion, but
>> malicious domain can't cause DoS.
>
> It is not really a priority inversion problem outside of RT because
> all the tasks will have the same priority. It is more a time
> accounting problem because each vCPU may have a different number of
> credits.

Speaking of that, RTDS does not use concept of priority. And ARINC of
course neither.


>>>>> I am really surprised that this is the only changes necessary in
>>>>> Xen. For a first approach, we may want to be conservative when the
>>>>> preemption is happening as I am not convinced that all the places are
>>>>> safe to preempt.
>>>>>
>>>> Well, I can't say that I ran extensive tests, but I played with this
>>>> for
>>>> some time and it seemed quite stable. Of course, I had some problems
>>>> with RTDS...
>>>> As I see it, Xen is already supports SMP, so all places where races
>>>> are
>>>> possible should already be covered by spinlocks or taken into account =
by
>>>> some other means.
>>> That's correct for shared resources. I am more worried for any
>>> hypercalls that expected to run more or less continuously (e.g not
>>> taking into account interrupt) on the same pCPU.
>>
>> Are there many such hypercalls? They can disable preemption if they
>> really need to run on the same pCPU. As I understand, they should be
>> relatively fast, because they can't create continuations anyway.
>
> Well, I never tried to make Xen preemptible... My comment is based on
> the fact that the use preempt_{enable, disable}() was mostly done on a
> best effort basis.
>
> The usual suspects are anything using this_cpu() or interacting with
> the per-CPU HW registers.
>
> From a quick look here a few things (only looked at Arm):
>   * map_domain_page() in particular on arm32 because this is using
> per-CPU page-tables
>   * guest_atomics_* as this uses this_cpu()
>   * virt_to_mfn() in particular the failure path
>   * Incorrect use (or missing) rcu locking. (Hopefully Juergen's
> recent work in the RCU mitigate the risk)
>
> I can provide guidance, but you will have to go through the code and
> check what's happening.

Thank you for the list. Of course, I need to see thru all the code. I
already had a bunch of problems with per_cpu variables...

--=20
Volodymyr Babchuk at EPAM=

