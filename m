Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0529A322430
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 03:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88516.166435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXY-00049k-7s; Tue, 23 Feb 2021 02:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88516.166435; Tue, 23 Feb 2021 02:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lENXY-00049D-3O; Tue, 23 Feb 2021 02:35:08 +0000
Received: by outflank-mailman (input) for mailman id 88516;
 Tue, 23 Feb 2021 02:35:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6em=HZ=epam.com=prvs=268883478e=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lENXX-00046p-77
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 02:35:07 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1488b3b-51ee-46c6-a8c5-5287ac50cb63;
 Tue, 23 Feb 2021 02:35:02 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11N2PMaQ026304; Tue, 23 Feb 2021 02:34:59 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 36vq3kr64x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Feb 2021 02:34:58 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB4082.eurprd03.prod.outlook.com (2603:10a6:208:70::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Tue, 23 Feb
 2021 02:34:55 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.042; Tue, 23 Feb 2021
 02:34:55 +0000
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
X-Inumbo-ID: d1488b3b-51ee-46c6-a8c5-5287ac50cb63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6/2exD15NZLAtaQWJ1UtLZVGYajg/Kl6edODKKwKdFrp/DAtuB6vHSObpH6ebXoeCVIJAfGT6Yc6QVCx6q1F/39CbABUrp52yFQlOFxVreHZeKyGDLC6NWPXTbrgHUrqLpDhsWg/ipk71KNNGkAviJdTR4cRn6auDcscOUZYGIcqMrEZU871LNfeh1iXZWp90QZ3MZabhy5eeb9JTlBMDLiiLm6uWURtvXjS8qzh1Vzo0LlyXi7L3mBnQPC+jETuIet0o6kLsAFmASNn3XDeKHgjpg/dC8KUxjuxmJ5Bu8atcaBaV3O0zdKtZk9qOwr+KD8UWWfFJlkNuMJ8EfS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMv9AIA+SlsYD7jStw5GaXVCfP6GBuKwDkIf84cklY4=;
 b=ZXyKfVT9e/p/CqjatqPuxvaP1OiMR8HV6aesT6VgG/AEperbizj9Cqt7GVcOSapYNdPTZG12sCBrV4Gb4yAIivkxlWpJUIR5aMfT08+bFpJYT2G8ehO7LaF2jZHjJ5b6SuORs9y6erSn35dfjBVRlRlp2CK9tl+BetfRQ92iWsOHSKiK1z+GRvQfL8v9uYkokygDZpYNif6MisM0CtW6+2lsaEFVMYQMGNRf9Y/81iCdDgf3gYkhH92HPUBPjn0vsn0UOYugseQRtGstwFRo5+IxKtXhdhr2WOHtEbhoUR4LBmXXzzxaS53wAPuok4r6kTUHYaw67ZwLyTSKNPiCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMv9AIA+SlsYD7jStw5GaXVCfP6GBuKwDkIf84cklY4=;
 b=oAu21bq3mnoGFwBcYOWJ51FSQO8IBs0UlbrJFVsziVAEUf3orQCrX1LSOEnSzI//QTQDpwrSqbnZtXBYE8IXaspMW1VBdRk3dlzL717q3WxHyzS7kYym80X+fM/KCu5OBzOULlnc4+P1T+A7CF77w2vdqW9qpqWi/T9gxCHQjym0Pj57IRbuzH27E7fIUx4jybG5klPx+kkxexQwy1xff5StBeMWQY2gAm/lcKNTQ/9NaiBv0xnEd0ZYQTnMOoZtTxkipqf3kyMExoty12NznvTuqPHDmXS7XIEQQka4jSDGJ31VeKPJsYiX5paSagRZFeKWZQcba/vGnLLPqVAerw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Dario Faggioli <dfaggioli@suse.com>, Meng Xu
	<mengxu@cis.upenn.edu>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Topic: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Index: AQHXCYx4A6OUUHr1gkqxWv1TEOLkug==
Date: Tue, 23 Feb 2021 02:34:55 +0000
Message-ID: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.30.1
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c4a50d1-743b-4028-37ce-08d8d7a39afb
x-ms-traffictypediagnostic: AM0PR03MB4082:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB4082DCD7F48383493C01BE58E6809@AM0PR03MB4082.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a7jiGZYwmPZbNATGF7FVtNSC4IVJtdfENjbON89YpUUF7z0QLqcy+CCSJkQDZ8+J2KR10nrMAVxCX5deyZAT28t3g93iEThgOb4SwOL9+OBwLJ2/7mlwKtnrAqBdr9ezclzZNSDYKOy1CnvEPMzppobRoujYiUT+NPpVQOD37ONuYnxGAjxJ1vMe69Fdm/f2tcIYIaHPrr2Ixg3GKMa0cmBBKi3Rc/odzc6VqCmG5+jUAsY5FpmsLsBVy7hIuOWGcA8N65G9K0JDpsmqF1csdKSIxAimLinF9XKJZzz8mYbsInF6lQqSYDd7LJUfZ3tED44d2jo+SZQiUR6Lezl1pRAUib+vW1KoL8LtaZL0oXjWyauKAoPUGSPzv59YLdHK2ilSKmhp8wH0sortK/4htnthJM2/3SGv5I+61UdnlF5qAikH9qVEUR9PjLo3Mocr0oIFpgXPUTxIH9WSSpbAScKNCVI67qNhK1v1vBgo7IzZwL3GHfqE6cznn/H678K5zV6EVbc5JaU40W4S5hoyCwXn/SPozdbHZTX5b/FQISdiIVs+EgbQ1wmP8AAZbbUvnVvuwr5iAMgZIMeUghqzdqw+aTvjEUeiSfcBbO9aExBZ5ODv+Xr0hVkB2FaWfYVBXLmkPyeox2NJOh1yj0LmAw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(1076003)(8676002)(186003)(66446008)(76116006)(2906002)(71200400001)(55236004)(4326008)(6486002)(478600001)(36756003)(26005)(66556008)(54906003)(7416002)(64756008)(83380400001)(6916009)(2616005)(66476007)(107886003)(966005)(86362001)(6512007)(316002)(6506007)(66946007)(5660300002)(8936002)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?rrn0lVB4DD0EGsZKt0ksNqB1BcwlRB++Pa+mMrgHQogsBi6ymhqE+GeEzu?=
 =?iso-8859-1?Q?IT8nBl9Jk4+XU5td3qD2jO6Rv8POV+0ph9oMbfqXeKrZd2WWhe2raZUNTV?=
 =?iso-8859-1?Q?cKVWZAK4raOkFF4rs9A4/iNfIhrDTqMFSftDwofsNA2WEmaLsvCOf4f3Zf?=
 =?iso-8859-1?Q?XaWHud48Xeu+Aj9Ny/uFk4mfmMRwOKVPnKmJbXJor0uHHWYvUu1BC0aC4d?=
 =?iso-8859-1?Q?o5z5uL86LMdLdeq5aygFIAx02dl1Fs70/jvda+9IAKHjZcVA7ZCLfCl91o?=
 =?iso-8859-1?Q?wXAA8uzludSLFjApbelFsBYuqwZ7xYA4c6AIA4xZW1tk7g1cYptGODSAEq?=
 =?iso-8859-1?Q?sPFmfa+DEg8DdACcTYteTGqGW8PlJG8FlpFuyNwHgLd5icaur1c+q4yBOy?=
 =?iso-8859-1?Q?0TK4nh7XwmV+QlQzlmiKc/b5eLihdmBdhg9RLZGuLWiDV0iDVLQjM4+N1+?=
 =?iso-8859-1?Q?OWf/ir53USeKMditKwH3WmGuvUXsWHW5g6xvevvwvfHOYBnixRuBN5BC21?=
 =?iso-8859-1?Q?0VpIShOrKXUU9XlBCZwMRUAsvECSI9rcRNCJq9TnLEVHGkE4ccHALmt5/c?=
 =?iso-8859-1?Q?q+A86AIoVrbXsHNSGFkadd6s9EKIg3Fb9NZpGAeAJsljFoFLTZTK99YDGx?=
 =?iso-8859-1?Q?PSj4A3M2rH6f43TzBbgEoCooAkU1XPpqph3SMJ2vQFl7IEebgvfH34rKQn?=
 =?iso-8859-1?Q?LNk9vkXWpjaO38xWkcT/Oa+cui7ngUz76c9JjPVVbSuScRDc7ZGGtrTEwt?=
 =?iso-8859-1?Q?ou+X3rwnLPJL5ie81CkTSYl9tpH9rgeLD49kcbV+32yuTHBCvFtsa9Kc9c?=
 =?iso-8859-1?Q?Rb2k4AdUsN5nfpxoJswZhz8o4AmwBT6hfVwk9cz2C6Z0kboqpt+sOCBL/P?=
 =?iso-8859-1?Q?RTZ56oZ+zcUgYt3FHdiHml4JAtUISqqs6SHGBVh1te/y5h8Hhr0jnb3XwI?=
 =?iso-8859-1?Q?bfXRp2p4bMkc1YMnOkuH4fq4ENyWcvO8h00h4UQ7wOqEvQRLXRwIehsbJd?=
 =?iso-8859-1?Q?hamuWedLtPj9nugeubxXnLKKmqZ0BJzyKLslEDDXoHXetcySCby8mhHV5y?=
 =?iso-8859-1?Q?gnSsokBR1rEw9UsIPRqSXXyjKdTlJNZsPXbiIydl5wVkc0PsRhoGWJqW3I?=
 =?iso-8859-1?Q?UcjKTib7CdqGO+oeTrauiKuACG6cEs1dHeuPONSdTCJfrUNjt43DD88Pbj?=
 =?iso-8859-1?Q?3aBl0lyVp5WsO7U8LGQJUBAvnGFXRf+3UmEwje5oiJxG66wth/BNpFAOgo?=
 =?iso-8859-1?Q?mFa54dN7UqV1fjWHjE9DltcXW10shELstoducurfY0/QCE3Vkkkt0pSnXG?=
 =?iso-8859-1?Q?j4t9vXHZ4FKp2YgpEEqhAOE/+5s65CwV+sl4rjRhvinjCfGSIF/Kvt+hK9?=
 =?iso-8859-1?Q?WYwXXLlULr?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4a50d1-743b-4028-37ce-08d8d7a39afb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 02:34:55.1991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pNTgLZzbchkiEKl6NCAGLwQc+xNaf/WHTXlaR8h+/5+pVoHzVuz9Wf4pyzN234NXU4vEYJrGXf90mjWMXIhsCb5vq0B5tXiLQMG6zjeacho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4082
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230018

Hello community,

Subject of this cover letter is quite self-explanatory. This patch
series implements PoC for preemption in hypervisor mode.

This is the sort of follow-up to recent discussion about latency
([1]).

Motivation
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

It is well known that Xen is not preemptable. On other words, it is
impossible to switch vCPU contexts while running in hypervisor
mode. Only one place where scheduling decision can be made and one
vCPU can be replaced with another is the exit path from the hypervisor
mode. The one exception are Idle vCPUs, which never leaves the
hypervisor mode for obvious reasons.

This leads to a number of problems. This list is not comprehensive. It
lists only things that I or my colleagues encountered personally.

Long-running hypercalls. Due to nature of some hypercalls they can
execute for arbitrary long time. Mostly those are calls that deal with
long list of similar actions, like memory pages processing. To deal
with this issue Xen employs most horrific technique called "hypercall
continuation". When code that handles hypercall decides that it should
be preempted, it basically updates the hypercall parameters, and moves
guest PC one instruction back. This causes guest to re-execute the
hypercall with altered parameters, which will allow hypervisor to
continue hypercall execution later. This approach itself have obvious
problems: code that executes hypercall is responsible for preemption,
preemption checks are infrequent (because they are costly by
themselves), hypercall execution state is stored in guest-controlled
area, we rely on guest's good will to continue the hypercall. All this
imposes restrictions on which hypercalls can be preempted, when they
can be preempted and how to write hypercall handlers. Also, it
requires very accurate coding and already led to at least one
vulnerability - XSA-318. Some hypercalls can not be preempted at all,
like the one mentioned in [1].

Absence of hypervisor threads/vCPUs. Hypervisor owns only idle vCPUs,
which are supposed to run when the system is idle. If hypervisor needs
to execute own tasks that are required to run right now, it have no
other way than to execute them on current vCPU. But scheduler does not
know that hypervisor executes hypervisor task and accounts spent time
to a domain. This can lead to domain starvation.

Also, absence of hypervisor threads leads to absence of high-level
synchronization primitives like mutexes, conditional variables,
completions, etc. This leads to two problems: we need to use spinlocks
everywhere and we have problems when porting device drivers from linux
kernel.

Proposed solution
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

It is quite obvious that to fix problems above we need to allow
preemption in hypervisor mode. I am not familiar with x86 side, but
for the ARM it was surprisingly easy to implement. Basically, vCPU
context in hypervisor mode is determined by its stack at general
purpose registers. And __context_switch() function perfectly switches
them when running in hypervisor mode. So there are no hard
restrictions, why it should be called only in leave_hypervisor() path.

The obvious question is: when we should to try to preempt running
vCPU?  And answer is: when there was an external event. This means
that we should try to preempt only when there was an interrupt request
where we are running in hypervisor mode. On ARM, in this case function
do_trap_irq() is called. Problem is that IRQ handler can be called
when vCPU is already in atomic state (holding spinlock, for
example). In this case we should try to preempt right after leaving
atomic state. This is basically all the idea behind this PoC.

Now, about the series composition.
Patches

  sched: core: save IRQ state during locking
  sched: rt: save IRQ state during locking
  sched: credit2: save IRQ state during locking
  preempt: use atomic_t to for preempt_count
  arm: setup: disable preemption during startup
  arm: context_switch: allow to run with IRQs already disabled

prepare the groundwork for the rest of PoC. It appears that not all
code is ready to be executed in IRQ state, and schedule() now can be
called at end of do_trap_irq(), which technically is considered IRQ
handler state. Also, it is unwise to try preempt things when we are
still booting, so ween to enable atomic context during the boot
process.

Patches
  preempt: add try_preempt() function
  sched: core: remove ASSERT_NOT_IN_ATOMIC and disable preemption[!]
  arm: traps: try to preempt before leaving IRQ handler

are basically the core of this PoC. try_preempt() function tries to
preempt vCPU when either called by IRQ handler and when leaving atomic
state. Scheduler now enters atomic state to ensure that it will not
preempt self. do_trap_irq() calls try_preempt() to initiate preemption.

Patch
  [HACK] alloc pages: enable preemption early

is exactly what it says. I wanted to see if this PoC is capable of
fixing that mentioned issue with long-running alloc_heap_pages(). So
this is just a hack that disables atomic context early. As mentioned
in the patch description, right solution would be to use mutexes.

Results
=3D=3D=3D=3D=3D=3D=3D

I used the same testing setup that I described in [1]. The results are
quite promising:

1. Stefano noted that very first batch of measurements resulted in
higher than usual latency:

 *** Booting Zephyr OS build zephyr-v2.4.0-2750-g0f2c858a39fc  ***
RT Eval app

Counter freq is 33280000 Hz. Period is 30 ns
Set alarm in 0 sec (332800 ticks)
Mean: 600 (18000 ns) stddev: 3737 (112110 ns) above thr: 0% [265 (7950 ns) =
- 66955 (2008650 ns)]
Mean: 388 (11640 ns) stddev: 2059 (61770 ns) above thr: 0% [266 (7980 ns) -=
 58830 (1764900 ns)]

Note that maximum latency is about 2ms.

With this patches applied, things are much better:

 *** Booting Zephyr OS build zephyr-v2.4.0-3614-g0e2689f8edc3  ***
RT Eval app

Counter freq is 33280000 Hz. Period is 30 ns
Set alarm in 0 sec (332800 ticks)
Mean: 335 (10050 ns) stddev: 52 (1560 ns) above thr: 0% [296 (8880 ns) - 12=
56 (37680 ns)]
Mean: 332 (9960 ns) stddev: 11 (330 ns) above thr: 0% [293 (8790 ns) - 501 =
(15030 ns)]

As you can see, maximum latency is ~38us, which is way lower than 2ms.

Second test is to observe influence of call to alloc_heap_pages() with
order 18. Without the last patch:

Mean: 756 (22680 ns) stddev: 7328 (219840 ns) above thr: 4% [326 (9780 ns) =
- 234405 (7032150 ns)]

Huge spike of 7ms can be observed.

Now, with the HACK patch:

Mean: 488 (14640 ns) stddev: 1656 (49680 ns) above thr: 6% [324 (9720 ns) -=
 52756 (1582680 ns)]
Mean: 458 (13740 ns) stddev: 227 (6810 ns) above thr: 3% [324 (9720 ns) - 3=
936 (118080 ns)]
Mean: 333 (9990 ns) stddev: 12 (360 ns) above thr: 0% [320 (9600 ns) - 512 =
(15360 ns)]

Two things can be observed: mean latency time is lower, maximum
latencies are lower too, but overall runtime is higher.

Downside of this patches is that mean latency time is a bit
higher. There are the results for current xen master branch:

Mean: 288 (8640 ns) stddev: 20 (600 ns) above thr: 0% [269 (8070 ns) - 766 =
(22980 ns)]
Mean: 287 (8610 ns) stddev: 20 (600 ns) above thr: 0% [266 (7980 ns) - 793 =
(23790 ns)]

8.6us versus ~10us with the patches.

Of course, this is the crude approach and certain things can be made
more optimally.

Know issues
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

0. Right now it is ARM only. x86 changes vCPU contexts in a different
way, and I don't know what amount of changes needed to make this work on x8=
6

1. RTDS scheduler goes crasy when running on SMP system (e.g. with
more than 1 pCPU) and tries to schedule already running vCPU on
multiple pCPU at a time. This leads to some hard-to-debug crashes

2. As I mentioned, mean latency become a bit higher

Conclusion
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

My main intention is to begin discussion of hypervisor preemption. As
I showed, it is doable right away and provides some immediate
benefits. I do understand that proper implementation requires much
more efforts. But we are ready to do this work if community is
interested in it.

Just to reiterate main benefits:

1. More controllable latency. On embedded systems customers care about
such things.

2. We can get rid of hypercall continuations, which will results in
simpler and more secure code.

3. We can implement proper hypervisor threads, mutexes, completions
and so on. This will make scheduling more accurate, ease up linux
drivers porting and implementation of more complex features in the
hypervisor.



[1] https://marc.info/?l=3Dxen-devel&m=3D161049529916656&w=3D2

Volodymyr Babchuk (10):
  sched: core: save IRQ state during locking
  sched: rt: save IRQ state during locking
  sched: credit2: save IRQ state during locking
  preempt: use atomic_t to for preempt_count
  preempt: add try_preempt() function
  arm: setup: disable preemption during startup
  sched: core: remove ASSERT_NOT_IN_ATOMIC and disable preemption[!]
  arm: context_switch: allow to run with IRQs already disabled
  arm: traps: try to preempt before leaving IRQ handler
  [HACK] alloc pages: enable preemption early

 xen/arch/arm/domain.c      | 18 ++++++++++-----
 xen/arch/arm/setup.c       |  4 ++++
 xen/arch/arm/traps.c       |  7 ++++++
 xen/common/memory.c        |  4 ++--
 xen/common/page_alloc.c    | 21 ++---------------
 xen/common/preempt.c       | 36 ++++++++++++++++++++++++++---
 xen/common/sched/core.c    | 46 +++++++++++++++++++++++---------------
 xen/common/sched/credit2.c |  5 +++--
 xen/common/sched/rt.c      | 10 +++++----
 xen/include/xen/preempt.h  | 17 +++++++++-----
 10 files changed, 109 insertions(+), 59 deletions(-)

--=20
2.29.2

