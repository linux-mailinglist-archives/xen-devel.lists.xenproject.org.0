Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADE9324791
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 00:38:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89544.168719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF3j1-0005cS-3o; Wed, 24 Feb 2021 23:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89544.168719; Wed, 24 Feb 2021 23:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lF3j1-0005c3-0O; Wed, 24 Feb 2021 23:37:47 +0000
Received: by outflank-mailman (input) for mailman id 89544;
 Wed, 24 Feb 2021 23:37:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FJMv=H2=epam.com=prvs=26891aedce=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1lF3iy-0005bx-RJ
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 23:37:45 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71b2c484-fd50-4f84-8830-f4195bb5fe64;
 Wed, 24 Feb 2021 23:37:43 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11ONaRVv029276; Wed, 24 Feb 2021 23:37:39 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0b-0039f301.pphosted.com with ESMTP id 36w16admar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Feb 2021 23:37:39 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB4500.eurprd03.prod.outlook.com (2603:10a6:208:d0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Wed, 24 Feb
 2021 23:37:35 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::a9a4:6122:8de2:64cb%6]) with mapi id 15.20.3846.048; Wed, 24 Feb 2021
 23:37:35 +0000
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
X-Inumbo-ID: 71b2c484-fd50-4f84-8830-f4195bb5fe64
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4eswuERnQRkymqscH0vNRL+22D08R0TmFWLsk7Cqoae2+wBIB9ga1cXmMZyXK1iUB8T+s406rbJ/xi6tqwsARnzSZXmS0U34eqJ50/Uru19G8zX+JW5Ac6CwjnrlB4q4BCXBcut9JtTb3sycRsgOkhW+7DCEidyij83lh4t4NH1W4omwaYQqvRBK3vAJNo/Yqks8yqUUmKwpCmCMvNvZSZnr/6CqFf58Pr/9cXkBg3hvGGbLxiWxWI+EjN9loA69+/FrjinAQAxB2IrSAX5OwtGAZYzitSdLLk85sMv1UIWL3VjcComdtu1HEdG4rLWtUgG+MHD0Rc6a7rdnPK8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaL74+wSv6ihcnPfmovGf+NX1Bf0YN6d4/H2CJgZAKk=;
 b=aaD1bS2/JBZW7wiUT+iRhs8U1736AehZqD4GMaFney622b9SOmgCrXYv4Mh8UZJcT7x9oDPeszJ6gY8zgzU+p0mU57RJTHVelpOimP26NyOktXi9JELNauqqgjkebpRy+qweNWf39klD7SwsPlb87mKZ1KIlr4xCY1pHzrvx9RuT/Ph6pZN4y3cfsuRJNttNtwsgmQ1g7gJ9+jVtd4Z6mmcZ/9y3f0DLr833fG2DmCEO02WeonkO0jeXsRDWwyr8JacSMazxyTxbVzetkdnsb35BhTk7rcLjZ8CRKXvBLlRQGOMDiT88ZoNtaP6q2VjVe+lW4GECGmKE8uleUIc33g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaL74+wSv6ihcnPfmovGf+NX1Bf0YN6d4/H2CJgZAKk=;
 b=5UsJKN0tSwdppuJz/MdC5t9hVzLapxhQxN+GhY2+pQEnINiEiEzsxRaBjC0D77PWKF9crjSl2pdDU9FqZo0ek7497xN1UXWueDNQq7KCfgL5IgWyz3N8k0PD7y35m6b1AWDIAhuEMsf51q2+PQQ7ztPTs++a/PsYnHdtPcIuZF79CarerTM0Js4b6sKCw476866p8tFnyoUwx/2lmorVReqKgtUyx30mQFbwlDJ4sBaPykKKAaHr3aM2ziXzPd/i0HTROcmRcYvjQ9/eNQ7Hhv4UILy8JjSA+rawgFxUJuQA/ut9C9pKnlUXZQX0JNO6ieWE/0ehGVSBlVQd3/e5tw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Dario Faggioli <dfaggioli@suse.com>, Meng
 Xu <mengxu@cis.upenn.edu>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Topic: [RFC PATCH 00/10] Preemption in hypervisor (ARM only)
Thread-Index: AQHXCYx4A6OUUHr1gkqxWv1TEOLkuqpnnLaAgABcP4A=
Date: Wed, 24 Feb 2021 23:37:35 +0000
Message-ID: <87k0qx9gw0.fsf@epam.com>
References: <20210223023428.757694-1-volodymyr_babchuk@epam.com>
 <25034a7a-83ed-0848-8d23-67ed9d02c61c@citrix.com>
In-Reply-To: <25034a7a-83ed-0848-8d23-67ed9d02c61c@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.15; emacs 27.1
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4357e30-529a-4eaf-b802-08d8d91d2a36
x-ms-traffictypediagnostic: AM0PR03MB4500:
x-microsoft-antispam-prvs: 
 <AM0PR03MB4500DBEAC9756C66DB605D46E69F9@AM0PR03MB4500.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eJibFc3HM2C/p1O1vGdKIaq0gySQy3OUiI+AlW2wkTV81tXKL6UYOOkFSlXLilHOqGudrhdZBjNd5Gwjd0jgrtdArIbgy5SLrxhzputeH4ggdkL++cOwDIav8h/Gjd4Y06O9xM5FAjPdHZEKPSESpnFfGtzJDtxX2JDOmTH2E5KaWCpml4Iq5jIdJ54SuwqXo1gMVswLqBrh6JwBSBFHOT122s3Z0k3PsmuCXMPq/EMh+JNqzxX66ERrK8eDdxVJWTkbJMlLJ6KDwpevSWG0istkrnybclM/8G4+os+/9cnEAT3zlTAhvcBDBdHBVrsGK1DflQgQvRMI/H/KCNM1I2TEnP6zf97taOgwXOQqEVbU9YSM6ygFOAN4ur9k4hBwDVTjzwbpoeo1zSvZf3Oi5e7WZ67kc190u8Sed2mifJNT+BrJEHvB7HoY0xg0pU/n+6EUC2/1GH1B2wY9Rx4k8ghs5Rg8pg4zBd4optR9huMzwpS6Dguo5yY6q6zuyFMXFQwUhQNb5MVthfmFYKfKhdOT9pH47rVEYbHLAQHHHcaR2hB1AvsBcPIqTTqptJVCMic6AIk65UCVnaDNIjcREQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(5660300002)(66446008)(76116006)(8936002)(2616005)(6506007)(186003)(53546011)(66476007)(6486002)(54906003)(26005)(66946007)(55236004)(64756008)(66556008)(6916009)(6512007)(36756003)(4326008)(8676002)(2906002)(478600001)(71200400001)(7416002)(86362001)(83380400001)(316002)(557034005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?ShtrSPxK9gQg8w9DEiXqAsL2DhSpL1udkj5frVLg4RinbiSYihoJph45WV?=
 =?iso-8859-1?Q?UTVWTgPX7s1PLppH6laSczSZ8/zTo2qq7E+IsHLma+6ORMQ/AllOQlssci?=
 =?iso-8859-1?Q?cmserFJtVpmEpxCEFO4k9qU5f6RKkcrbhXoGjxFNvBbMClgA5fM6kiiMOV?=
 =?iso-8859-1?Q?fQ85nWZ29ZicNpFgcaY1g29gS8urtg1iXfRKpnLd5kqwhrfiQOPZGurNfM?=
 =?iso-8859-1?Q?w0g1rCu85YEliaiAFwPKNf3UE8hqcRs0TanhzB2pSAAzybGCLlwJNvb/bJ?=
 =?iso-8859-1?Q?8HKdGfujwBi8RFsIUFQI+ZIxInkO48XlOvEg9rA80Pb3cAn9kIPKyhu1wd?=
 =?iso-8859-1?Q?iKi2V6skqfKMeNFhgoZD5rBTQ6vYZFLiK3TLW8r5iqg7YWH5rbm2bWrfJv?=
 =?iso-8859-1?Q?MhFPTDo8hmAMIrVJwMroa39Rd5y7NeHgb3LzF08Iz/wHnTW112UYvmuijo?=
 =?iso-8859-1?Q?wY2E8YdxGkjS664CSDKMgotrFgQZ2IPOaZKifdoL62/872viIe3pVynn1H?=
 =?iso-8859-1?Q?xfFYjqqhCvdzCBI3byvgwydN5HHkAQZfNPlikaMZBAQJy72IJ8VvLAxpCC?=
 =?iso-8859-1?Q?TlVG/2AUxiF8jd1BZoEewnboPzexvws4ykBJO5iWuiXJoniDbTzOIpJxxb?=
 =?iso-8859-1?Q?ZVg2uy/+hgDxeXCpJGBGiMAGZM0jPUw92YXYECxfcXzQpizSHtXgPd0llc?=
 =?iso-8859-1?Q?xLBql6F1i3JfxUq3AInk3Dwxjf50fb/SE/M9ygtiuEq+27HyhLGztQlsuP?=
 =?iso-8859-1?Q?Ff3mJHzsTRa8kWwA2g8WGwQC0qbBuNPTjTJXxrkc5psE+O/H7YuuTnUDd8?=
 =?iso-8859-1?Q?zO0lNE1Kd3GIRgvSq2aKBaOgi/M9WeyzZv8FX6E2wmUfuMZJ0RuFm4Us22?=
 =?iso-8859-1?Q?DAuiIwW2HRRt1jKFagC8ZiioIQf9evXDJ+hocG078VvlIjIevuXLty/UBr?=
 =?iso-8859-1?Q?rqWinmsHscXmoa59o4aK4NHWQKyYQSdYMlvh157eLW1fHqzoRmE5cCeAo8?=
 =?iso-8859-1?Q?JEgsuL9byQvhPFVjrYTF+SjBTf0IoAFflhywyqffhZYVS9+3aM1gtwmbyw?=
 =?iso-8859-1?Q?4nE9tZ5K62lv6SFTtohMEzQC/t/2RME7fIZClmesOEJS7XJ9YZJenifqJb?=
 =?iso-8859-1?Q?iVRhiUlR+Kxojl3o+o29etFfU/A0uYwjgGVvd2ZL1u3cT9RhH41KWdzfeF?=
 =?iso-8859-1?Q?ta+ICowBe9ckn7BLZwCQSOaJkXq0pE+wUtOBAyehDpSbwXmg1ga+f/hlCK?=
 =?iso-8859-1?Q?94HpA7VfwTjfZIjCGwPeLadWpjIGTTBVv9h6uqnNVJ5SjXtCklzDg3Akt4?=
 =?iso-8859-1?Q?c8HbGyI+7xak7nxsBeg2jm9yZYed3HmVSx9qJlvSAAajD2C56Kkqq6uS1k?=
 =?iso-8859-1?Q?5iwPoJgt/y?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4357e30-529a-4eaf-b802-08d8d91d2a36
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 23:37:35.7253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TZp14E/BZInWqTev4i2mkOjmmF0f2bnk92EsVeObmCzDqmav2z9H9SgJdPladJR0+s9RJlvgIZdpMTYbD/+EokNSaO8Yxz7Dp9lhVoKqWBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4500
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=477
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102240184


Hi Andrew,

Andrew Cooper writes:

> On 23/02/2021 02:34, Volodymyr Babchuk wrote:
>> Hello community,
>>
>> Subject of this cover letter is quite self-explanatory. This patch
>> series implements PoC for preemption in hypervisor mode.
>>
>> This is the sort of follow-up to recent discussion about latency
>> ([1]).
>>
>> Motivation
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>> It is well known that Xen is not preemptable. On other words, it is
>> impossible to switch vCPU contexts while running in hypervisor
>> mode. Only one place where scheduling decision can be made and one
>> vCPU can be replaced with another is the exit path from the hypervisor
>> mode. The one exception are Idle vCPUs, which never leaves the
>> hypervisor mode for obvious reasons.
>>
>> This leads to a number of problems. This list is not comprehensive. It
>> lists only things that I or my colleagues encountered personally.
>>
>> Long-running hypercalls. Due to nature of some hypercalls they can
>> execute for arbitrary long time. Mostly those are calls that deal with
>> long list of similar actions, like memory pages processing. To deal
>> with this issue Xen employs most horrific technique called "hypercall
>> continuation". When code that handles hypercall decides that it should
>> be preempted, it basically updates the hypercall parameters, and moves
>> guest PC one instruction back. This causes guest to re-execute the
>> hypercall with altered parameters, which will allow hypervisor to
>> continue hypercall execution later. This approach itself have obvious
>> problems: code that executes hypercall is responsible for preemption,
>> preemption checks are infrequent (because they are costly by
>> themselves), hypercall execution state is stored in guest-controlled
>> area, we rely on guest's good will to continue the hypercall. All this
>> imposes restrictions on which hypercalls can be preempted, when they
>> can be preempted and how to write hypercall handlers. Also, it
>> requires very accurate coding and already led to at least one
>> vulnerability - XSA-318. Some hypercalls can not be preempted at all,
>> like the one mentioned in [1].
>>
>> Absence of hypervisor threads/vCPUs. Hypervisor owns only idle vCPUs,
>> which are supposed to run when the system is idle. If hypervisor needs
>> to execute own tasks that are required to run right now, it have no
>> other way than to execute them on current vCPU. But scheduler does not
>> know that hypervisor executes hypervisor task and accounts spent time
>> to a domain. This can lead to domain starvation.
>>
>> Also, absence of hypervisor threads leads to absence of high-level
>> synchronization primitives like mutexes, conditional variables,
>> completions, etc. This leads to two problems: we need to use spinlocks
>> everywhere and we have problems when porting device drivers from linux
>> kernel.
>
> You cannot reenter a guest, even to deliver interrupts, if pre-empted at
> an arbitrary point in a hypercall.  State needs unwinding suitably.
>

Yes, Julien pointed this to me already. So, looks like hypercall
continuations are still needed.

> Xen's non-preemptible-ness is designed to specifically force you to not
> implement long-running hypercalls which would interfere with timely
> interrupt handling in the general case.

What if long-running hypercalls are still required? There are other
options, like async calls, for example.

> Hypervisor/virt properties are different to both a kernel-only-RTOS, and
> regular usespace.  This was why I gave you some specific extra scenarios
> to do latency testing with, so you could make a fair comparison of
> "extra overhead caused by Xen" separate from "overhead due to
> fundamental design constraints of using virt".

I can't see any fundamental constraints there. I see how virtualization
architecture can influence context switch time: how many actions you
need to switch one vCPU to another. I have in mind low level things
there: reprogram MMU to use another set of tables, reprogram your
interrupt controller, timer, etc. Of course, you can't get latency lower
that context switch time. This is the only fundamental constraint I can
see.

But all other things are debatable.

As for latency testing, I'm not interested in absolute times per se. I
already determined that time needed to switch vCPU context on my machine
is about 9us. It is fine for me. I am interested in a (semi-)guaranteed
time of reaction. And Xen is doing quite well in most cases. But there
are other cases, when long-lasting hypercalls cause spikes in time of
reaction.

> Preemption like this will make some benchmarks look better, but it also
> introduces the ability to create fundamental problems, like preventing
> any interrupt delivery into a VM for seconds of wallclock time while
> each vcpu happens to be in a long-running hypercall.
>
> If you want timely interrupt handling, you either need to partition your
> workloads by the long-running-ness of their hypercalls, or not have
> long-running hypercalls.

... or do long-running tasks asynchronously. I believe, for most
domctls and sysctls there is no need to hold calling vCPU in hypervisor
mode at all.

> I remain unconvinced that preemption is an sensible fix to the problem
> you're trying to solve.

Well, this is the purpose of this little experiment. I want to discuss
different approaches and to estimate amount of required efforts. By the
way, from x86 point of view, how hard to switch vCPU context while it is
running in hypervisor mode?


--=20
Volodymyr Babchuk at EPAM=

