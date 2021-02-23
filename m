Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29660322A74
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 13:26:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88752.167024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEWl2-0007Pp-9z; Tue, 23 Feb 2021 12:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88752.167024; Tue, 23 Feb 2021 12:25:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEWl2-0007PO-5v; Tue, 23 Feb 2021 12:25:40 +0000
Received: by outflank-mailman (input) for mailman id 88752;
 Tue, 23 Feb 2021 12:25:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lEWl0-0007PJ-Bx
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 12:25:38 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b9d024f-9e52-4ba1-b442-82e471665634;
 Tue, 23 Feb 2021 12:25:36 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11NCPWdE031886; Tue, 23 Feb 2021 12:25:34 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 36vyne0m6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 12:25:33 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM9PR03MB7490.eurprd03.prod.outlook.com (2603:10a6:20b:265::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
 2021 12:10:11 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 12:06:32 +0000
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
X-Inumbo-ID: 6b9d024f-9e52-4ba1-b442-82e471665634
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4X21lOEtU0Z0u+dZzpzGaFSJgR4n4sEDNNv4o3ziWwhLgXgdoObo6uAZF+l0ZPzhbA2oN3ZeKnLch4QLu9GKKZ67fFYM5ddXhGR/9uzOJ15walmwM+7tBDawtN3nDnvGSp+UudJoWEmw76IM44n6+Sd2JWjkIWfiNiHbTHo7jGvnz3QClNiP5RZITVruPy/l8Zd+yGAczakpIfq0eKV6oGJyoN+wlw5+pelXtvDWjROkF3cSzWJvrcP4u3RUafBGkqnb7q3sG33GZvsDV+7TjTVEvcN8qrYtlcN1W5/+oJvpgsJjGOnCfhmC35s79dupcpEfTcVSmq5YNjrMXBY5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7NxZlCispGWLgeqciZXU66peGcDQMUmqNJA6ReggVg=;
 b=faOJInOAyUnP9JcAENm197cX4+Z56sFxQWY52CVCGGd82fOfvG++AzfcmSUxrxr0z1f+sdD1xl3/BAhJqIuVXE4zuQtVzMJiZaxN5NQ4xsBTlVlQmLi+bwZmrhxgF45VGXl+ooQiEJnlTLacRchyXdvW+GORMLXZfXu/xt3jnOA7qJmtKzSAt6Qks2uESNNuLt+SM0u3qJGzD82qR+NX3kBfsuuuCj84BkS+LL9mg3UMumk4Pyde45yWHcqQX4aV27sz0whbeFILFOaw0Y9rT3nOXPKzMMaDzPflh0yDuhICyCh8e8k9UcAO9j6VQX8fsmuW9swJumSMadbKLVIFxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7NxZlCispGWLgeqciZXU66peGcDQMUmqNJA6ReggVg=;
 b=549XpSc2xC6+iOg8ANdyOCB7vIrfzuwAh7xzMOqzjuF1zMTO6n0z8d3sLLCup+TIY9m5ArE6D+d0DEJuXhDA3y61liJrFUqRmwWnnTdB6WzUDN1gq03/YNnWjN1KpYSAZK+MDaAUHGdT74915GA6m4u/ROz1A9QBdytEtRbPo19V2BM9ca9yzLL/ijoFYZs3TbuIWkOsMiEpL4tO+nKfixQgZuUfaooXAUVVWcT3wxKIm2LvEZ4aCDn7Gk17bIuN1CYGKv9G7eh9Qt0MwDJnzogmuXQJ/D4q1nkzJL4lREFNFJvB8DhYEPoAosPcjDYaiWWPY+XuMbqdoBelWLgVCA==
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
Thread-Index: AQHXCYx4A6OUUHr1gkqxWv1TEOLkuqplchSAgAAzdYA=
Date: Tue, 23 Feb 2021 12:06:32 +0000
Message-ID: <87zgzv56pm.fsf@epam.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <e6d8726c-4074-fe4c-dbbe-e879da2bb7f6@xen.org>
In-Reply-To: <e6d8726c-4074-fe4c-dbbe-e879da2bb7f6@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eeab5274-7a96-4bab-6de9-08d8d7f375e0
x-ms-traffictypediagnostic: AM9PR03MB7490:
x-microsoft-antispam-prvs: 
 <AM9PR03MB74909888EA9A799EF07D4B4DE6809@AM9PR03MB7490.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4ToXfISwM58WZRDScQo9S9aFK7wN6lYBTeDsGR+K8cE7CWBkdNDVwuRVsoRq4MxiO0eEayyYhwgZrW2F2HPPY2Ye5cssONvgbOjFVCKD1idJlER+0830KFb8pYXp1phjM06iyCtfNHOxu8NlBUrcH5BAp9kllam5zAIrEf5xn4R5AmlS+DBw/xD/z5Rk6WZvvYwG1ZtGbcDjwiWQEqm+BeXb2nsRNPTqg4oYjY3srtC95/hXY40u1BRZO3Ozu0jhZu5d3xWOtwh/wOOG0kACWrnt/jMyViVEERHBwV4VMCwv01Bxr6/vnGmPwoL1WWT2XWt24IstG/XN4iiLzgQaDdJtq/avV2f0iQQxm5JLJquVP0NbavCOpJ5H3/XrM4VzeiVVi+ehL0tMRRwdab+tbL21SIb05YBfdJPAMe4qSh84rp5ZFo5HyjSq4AVqg0Es/AmtecqVWVkVCaazVKguRhxS1q1jo8e4VtdypvuqeYVQi9p0pcYzFygyDyOhgH0t/0vkhIlx3fW9MAs94W1AyA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(83380400001)(6512007)(2906002)(76116006)(7416002)(26005)(6916009)(316002)(36756003)(71200400001)(66946007)(86362001)(8936002)(6506007)(66556008)(55236004)(66476007)(66446008)(5660300002)(2616005)(6486002)(478600001)(186003)(4326008)(54906003)(53546011)(64756008)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?FPxFWimci5Wob8Jg8Fq40/GpQP+wIKmeTTOTfF3rP8VqQCBxoKK6irNFl0?=
 =?iso-8859-1?Q?n18JdrEJV6uql6kwyAEmhOZIiyVYnfC9zQtPw5LA97qXECHxakcQE8bzd5?=
 =?iso-8859-1?Q?bBfXGc7BLhBmmdoA9Xku1pWj3j26fbr0HyTJDGajG7LmAXti4EqddRBqTr?=
 =?iso-8859-1?Q?hnGDs3eGXtUsm3sFJvDsYBm+IPs4uT3YFD9KaLLHTSR8EWFyoZk6EXO5LB?=
 =?iso-8859-1?Q?4eBirFIZNrnlUKyaRZKjookk7livgTMF7C5EPPGxuitCmzlYqKsnuk0XrX?=
 =?iso-8859-1?Q?COUTTziL7MDkhpshd0TmY8F18HK6RTv8xQl9/JgyTiQlKLaf+QLME2p3hg?=
 =?iso-8859-1?Q?5wiPTVUO+peyGjjNNowPgGEQy8UfN8Q20jlHUknN/VFoOisMmPhpbViGQn?=
 =?iso-8859-1?Q?bgJLWi1Mr7M6iuFb3rYH+Gk71bmMjm0NoNgkkhjVTRu6cG7tv83qubqZmI?=
 =?iso-8859-1?Q?CV9LcABk8oJrLlQoywQv8EnFbRXL/d2i8cf/QMNhgAyI4SrVdqq8Q7kduz?=
 =?iso-8859-1?Q?KO0zvmEILW5RMGyLM5zayC4YkO68FYAs5gtdavmVYhZ2Zo/A6TcUL+TJL5?=
 =?iso-8859-1?Q?elgObPXIe/vD2KRM8tju2vPVJGbE1JhbAsASYq0hM8XXAnvon8tRYz0+yO?=
 =?iso-8859-1?Q?AgKF3QEe9mPZXb8hJINQEuXjg9JRvVdIFBpsdW3+tw0G5HuSV/aXZPDOr7?=
 =?iso-8859-1?Q?TZ/XUB2zAXXOUwVLc300Yo2OKTiPHUmChaNrp/XX/freAh+PEAPVLfBEfE?=
 =?iso-8859-1?Q?Unes5srvlrgXaY1kW60Q2HCx+Vr4eMRcOQdQjX7cXeGcMG0RhA5IgkGHhr?=
 =?iso-8859-1?Q?e56x8mHIhlGAsHkxEcp4+tQdShi0jtKNu8j5Jiphrj8XyPFSln/oSoV/Nu?=
 =?iso-8859-1?Q?JUynKeo3LHjt0ysB3TlwZ6qfwP6y6UWGKUhIHyWYbyC465WNpWnLuUQYT2?=
 =?iso-8859-1?Q?fuvEM2K/4+iGGs1/4169E4nxTerLgn8OWtwzdK42vwXSmhJjvk5qdw8ytO?=
 =?iso-8859-1?Q?hjK0vQE/iaWIVB6UedG4jpvJlYjowiNuV3YB7vCnd8panlwasnKvn00hTX?=
 =?iso-8859-1?Q?y8lTfEtp5xVVJE+dAe7Nr5ZVrnH87NkkBfR6Lm9OnUwMsremDglYmZi/U/?=
 =?iso-8859-1?Q?e/J8WNJbQ4mjNkOjrWC66bmGcVjTm1zSNeJYvyKEiFljbxK2rX7yeZH6b1?=
 =?iso-8859-1?Q?hPcGU0bMVN+in3qbtjqMzFweGsYCKwm3mU3fLzFjOwMaR6MRjjxls/oyNC?=
 =?iso-8859-1?Q?kogEV0DDMB2E1hlyZyCwgOzc6bMSKhK6BBRByL+7h2DFxij+hFjAFMaqqt?=
 =?iso-8859-1?Q?BKZ4VJDn6+etKM3X3Dk+GqpvTdvYnSjaP7L0H9A9lIZcDJtqiqIBD9VvkR?=
 =?iso-8859-1?Q?3U9MDfo1UbKoSqKJE0tSWuFENEVfRoVg=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeab5274-7a96-4bab-6de9-08d8d7f375e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 12:06:32.6503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H/Z72nOOML0DHfxL+rFuAY++2mbULDa/UUHSVH1afoKlQESHVtLmVEXsVi3wNJd7ZSUW3p1HLFCFfJf8f/3a6UJffoKJRd5K8rlw8Niiqmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7490
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230107


Hi Julien,

Julien Grall writes:

> On 23/02/2021 02:34, Volodymyr Babchuk wrote:
>> Hello community,
>
> Hi Volodymyr,
>
> Thank you for the proposal, I like the like of been able to preempt
> the vCPU thread. This would make easier to implement some of the
> device emulation in Xen (e.g. vGIC, SMMU).

Yes, emulation is the other topic that I didn't mentioned. Also, it could
lift some restrictions in OP-TEE mediator code as well.

>> Subject of this cover letter is quite self-explanatory. This patch
>> series implements PoC for preemption in hypervisor mode.
>> This is the sort of follow-up to recent discussion about latency
>> ([1]).
>> Motivation
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> It is well known that Xen is not preemptable. On other words, it is
>> impossible to switch vCPU contexts while running in hypervisor
>> mode. Only one place where scheduling decision can be made and one
>> vCPU can be replaced with another is the exit path from the hypervisor
>> mode. The one exception are Idle vCPUs, which never leaves the
>> hypervisor mode for obvious reasons.
>> This leads to a number of problems. This list is not
>> comprehensive. It
>> lists only things that I or my colleagues encountered personally.
>> Long-running hypercalls. Due to nature of some hypercalls they can
>> execute for arbitrary long time. Mostly those are calls that deal with
>> long list of similar actions, like memory pages processing. To deal
>> with this issue Xen employs most horrific technique called "hypercall
>> continuation".=20
>
> I agree the code is not nice. However, it does serve another purpose
> than ...
>
>> When code that handles hypercall decides that it should
>> be preempted, it basically updates the hypercall parameters, and moves
>> guest PC one instruction back. This causes guest to re-execute the
>> hypercall with altered parameters, which will allow hypervisor to
>> continue hypercall execution later.
>
> ... just rescheduling the vCPU. It will also give the opportunity for
> the guest to handle interrupts.
>
> If you don't return to the guest, then risk to get an RCU sched stall
> on that the vCPU (some hypercalls can take really really long).

Ah yes, you are right. I'd only wish that hypervisor saved context of
hypercall on it's side...

I have example of OP-TEE before my eyes. They have special return code
"task was interrupted" and they use separate call "continue execution of
interrupted task", which takes opaque context handle as a
parameter. With this approach state of interrupted call never leaks to
rest of the system.

>
>> This approach itself have obvious
>> problems: code that executes hypercall is responsible for preemption,
>> preemption checks are infrequent (because they are costly by
>> themselves), hypercall execution state is stored in guest-controlled
>> area, we rely on guest's good will to continue the hypercall.=20
>
> Why is it a problem to rely on guest's good will? The hypercalls
> should be preempted at a boundary that is safe to continue.

Yes, and it imposes restrictions on how to write hypercall
handler.
In other words, there are much more places in hypercall handler code
where it can be preempted than where hypercall continuation can be
used. For example, you can preempt hypercall that holds a mutex, but of
course you can't create an continuation point in such place.

>> All this
>> imposes restrictions on which hypercalls can be preempted, when they
>> can be preempted and how to write hypercall handlers. Also, it
>> requires very accurate coding and already led to at least one
>> vulnerability - XSA-318. Some hypercalls can not be preempted at all,
>> like the one mentioned in [1].
>> Absence of hypervisor threads/vCPUs. Hypervisor owns only idle
>> vCPUs,
>> which are supposed to run when the system is idle. If hypervisor needs
>> to execute own tasks that are required to run right now, it have no
>> other way than to execute them on current vCPU. But scheduler does not
>> know that hypervisor executes hypervisor task and accounts spent time
>> to a domain. This can lead to domain starvation.
>> Also, absence of hypervisor threads leads to absence of high-level
>> synchronization primitives like mutexes, conditional variables,
>> completions, etc. This leads to two problems: we need to use spinlocks
>> everywhere and we have problems when porting device drivers from linux
>> kernel.
>> Proposed solution
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> It is quite obvious that to fix problems above we need to allow
>> preemption in hypervisor mode. I am not familiar with x86 side, but
>> for the ARM it was surprisingly easy to implement. Basically, vCPU
>> context in hypervisor mode is determined by its stack at general
>> purpose registers. And __context_switch() function perfectly switches
>> them when running in hypervisor mode. So there are no hard
>> restrictions, why it should be called only in leave_hypervisor() path.
>> The obvious question is: when we should to try to preempt running
>> vCPU?  And answer is: when there was an external event. This means
>> that we should try to preempt only when there was an interrupt request
>> where we are running in hypervisor mode. On ARM, in this case function
>> do_trap_irq() is called. Problem is that IRQ handler can be called
>> when vCPU is already in atomic state (holding spinlock, for
>> example). In this case we should try to preempt right after leaving
>> atomic state. This is basically all the idea behind this PoC.
>> Now, about the series composition.
>> Patches
>>    sched: core: save IRQ state during locking
>>    sched: rt: save IRQ state during locking
>>    sched: credit2: save IRQ state during locking
>>    preempt: use atomic_t to for preempt_count
>>    arm: setup: disable preemption during startup
>>    arm: context_switch: allow to run with IRQs already disabled
>> prepare the groundwork for the rest of PoC. It appears that not all
>> code is ready to be executed in IRQ state, and schedule() now can be
>> called at end of do_trap_irq(), which technically is considered IRQ
>> handler state. Also, it is unwise to try preempt things when we are
>> still booting, so ween to enable atomic context during the boot
>> process.
>
> I am really surprised that this is the only changes necessary in
> Xen. For a first approach, we may want to be conservative when the
> preemption is happening as I am not convinced that all the places are
> safe to preempt.
>

Well, I can't say that I ran extensive tests, but I played with this for
some time and it seemed quite stable. Of course, I had some problems
with RTDS...

As I see it, Xen is already supports SMP, so all places where races are
possible should already be covered by spinlocks or taken into account by
some other means.

Places which may not be safe to preempt are clustered around task
management code itself: schedulers, xen entry/exit points, vcpu
creation/destruction and such.

For example, for sure we do not want to destroy vCPU which was preempted
in hypervisor mode. I didn't covered this case, by the way.

>> Patches
>>    preempt: add try_preempt() function
>>    sched: core: remove ASSERT_NOT_IN_ATOMIC and disable preemption[!]
>>    arm: traps: try to preempt before leaving IRQ handler
>> are basically the core of this PoC. try_preempt() function tries to
>> preempt vCPU when either called by IRQ handler and when leaving atomic
>> state. Scheduler now enters atomic state to ensure that it will not
>> preempt self. do_trap_irq() calls try_preempt() to initiate preemption.
>
> AFAICT, try_preempt() will deal with the rescheduling. But how about
> softirqs? Don't we want to handle them in try_preempt() as well?

Well, yes and no. We have the following softirqs:

 TIMER_SOFTIRQ - should be called, I believe
 RCU_SOFTIRQ - I'm not sure about this, but probably no
 SCHED_SLAVE_SOFTIRQ - no
 SCHEDULE_SOFTIRQ - no
 NEW_TLBFLUSH_CLOCK_PERIOD_SOFTIRQ - should be moved to a separate
 thread, maybe?
 TASKLET_SOFTIRQ - should be moved to a separate thread

So, looks like only timers should be handled for sure.

>
> [...]
>
>> Conclusion
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> My main intention is to begin discussion of hypervisor
>> preemption. As
>> I showed, it is doable right away and provides some immediate
>> benefits. I do understand that proper implementation requires much
>> more efforts. But we are ready to do this work if community is
>> interested in it.
>> Just to reiterate main benefits:
>> 1. More controllable latency. On embedded systems customers care
>> about
>> such things.
>
> Is the plan to only offer preemptible Xen?
>

Sorry, didn't get the question.

>> 2. We can get rid of hypercall continuations, which will results in
>> simpler and more secure code.
>
> I don't think you can get rid of it completely without risking the OS
> to receive RCU sched stall. So you would need to handle them
> hypercalls differently.

Agree. I believe that continuation context should reside in
hypervisor. Those changes are not connected to preemption per se and can
be implemented separately. But we can discuss them there, of course.

[...]

--=20
Volodymyr Babchuk at EPAM=

