Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E039A2F7F7A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:27:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68328.122344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0R0Z-0001y1-BP; Fri, 15 Jan 2021 15:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68328.122344; Fri, 15 Jan 2021 15:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0R0Z-0001x5-6r; Fri, 15 Jan 2021 15:27:27 +0000
Received: by outflank-mailman (input) for mailman id 68328;
 Fri, 15 Jan 2021 15:27:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cER4=GS=epam.com=prvs=164981b71a=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1l0R0X-0001vj-Hk
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:27:25 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b01b9b45-179d-419b-9fe3-9d8ca048f28d;
 Fri, 15 Jan 2021 15:27:24 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10FFG2ZQ010199; Fri, 15 Jan 2021 15:27:20 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2059.outbound.protection.outlook.com [104.47.12.59])
 by mx0b-0039f301.pphosted.com with ESMTP id 362w6tje7b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 15:27:19 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB6337.eurprd03.prod.outlook.com (2603:10a6:208:16a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 15:27:15 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539%6]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 15:27:15 +0000
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
X-Inumbo-ID: b01b9b45-179d-419b-9fe3-9d8ca048f28d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfAR/rEyuPKvnt/y418WnRfncPg0qHDidnx8G5GJ4T8lLqW5AuTJPUsW4KBuXgLN3r2J1xcWQJS9p1r7MHe0JcynyLpZFY1C6BE07Velgqo637uMq70lgHNIXZXRRnMRtrqE53XX7bm9U2A/cPq7tf3/HhZ1krEM1SpXSCaJwg77V/WJVewh+C5kALO3ND35wuyAAvlApF6yChAKf7HOLCjJSdJZ+oBwNEGCuzIwHv1pyx6F956yMT0w8shg2nr3E0pxxsb9AiszT06G0xxedjzIcDve/szq/8yu5VOl1novev6Xr7ifcdMTCotR/yukdbZfyKEFPZFhB6JX6OnpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Acq3Yvb6m9J56+D16qyg+PBmrN0C7kDGiAc+uFZmNE=;
 b=dE75ofmXZGvsMU12oNRnevJU9+2vAvrZSS1nfYJNTag+pbV8NTvKHHGOll87q7FVRWClUAN4y4F7b7U6owYvxCmZL4qeHKlWhm+bZJQ3HAoeJCQZwJSgcT3d25BcXFdhJOMmumnVEqw8vgvyQEzzyItv1nlcyZDYx51zXUJ2/77wfOFabLDKEum9q5vYhNtOFsvwAWcNwhVyYG4Mcpm+soae5Lfojf4HptPHmAahdi74kU48fXGSNsVfW5+XGsAUMmyeHd0UjArduRS/eiLM03rNTepRi/ny+VMHv9HdXHchQCViHbPBOtC4LtbUopKpqkCWf8OyDAMxcJo6BTMkLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Acq3Yvb6m9J56+D16qyg+PBmrN0C7kDGiAc+uFZmNE=;
 b=r4XrDih8n966lj78FtJK7voiAPa6XuhpmxS5Qy82rK1OQq0v3GDoyrM+lxSN6/56jTQeei1aotjlBi38QFWLftQ2ZJoYfRn5pNR7Lblr8AORBLzO8XncxlLU3hkkGscOcKfQ+Q1Qj1rY0zbje0Z3qF4q6p1u/y0mdfbiaAgQSBpMhaC3utXzrNuLfsHk9tcIdVikZ52QAvFL8bYF6TNX1LC02/8UibaS+wSFPH9/36VlltnOPFOGrRkITJKGtDW8CKRttrVDI59ZEuGchuujcU9Rt+SUcTLssYb2Cn/qXmF9mpOhdXWfYcbOi+P2DJHXby+NuK1dcTKLwE4sVGbe7w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <jgrall@amazon.com>,
        Dario Faggioli <dario.faggioli@suse.com>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: IRQ latency measurements in hypervisor
Thread-Topic: IRQ latency measurements in hypervisor
Thread-Index: AQHW6T1firbO0EOYpEKUiW6vsavsPaonyNIAgAEKgAA=
Date: Fri, 15 Jan 2021 15:27:15 +0000
Message-ID: <878s8u43vx.fsf@epam.com>
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b95f6477-0d60-474d-b17d-08d8b96a099a
x-ms-traffictypediagnostic: AM0PR03MB6337:
x-microsoft-antispam-prvs: 
 <AM0PR03MB63378A9FA876E7AA1FA72596E6A70@AM0PR03MB6337.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AOGU/MO0lJoFqFPik1sG0ZsePCj03bj8ZU01gZpYH1h3Z6RarLJARxwm97szp7UcTAxxBbf5bKUiNefwcCWI+mXCHGaruTnAvoUbE1WmZrpv2tW+4ZmIEyu+BiZS7x0/nlmaPta9K4y1+emoQNj/W0bckrSpIKcceF2NOsfGyPN7MQVD6V9b4U7myyHl6flr5G4biTlH4GyW+2WRqxcnKBXZjXhBIf52yV2LPLk/y+QoBPgk/I6Hg0KdK+JrzC7rhoWSjlkcKDdSkmqtlBjlPxbux+yY7TcmVnGXPiimt9BA5omi591YZhdzx9Rp6w+D4Pox1WWZETvo4Bdrn3mY8tfraNJks9YqLP0eF0y3aLLBjts1yKiTnr4UeFzRLEGeJsY0PKAi0AjnIk8u2d4KRg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(186003)(6506007)(26005)(316002)(66556008)(2616005)(6512007)(6486002)(66446008)(54906003)(30864003)(6916009)(66476007)(83380400001)(71200400001)(64756008)(5660300002)(55236004)(86362001)(478600001)(4326008)(8936002)(36756003)(8676002)(76116006)(2906002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?kk+ovQycMl40iGDkMJUlg0VV//26v0so6cc9zp1++Ll4S/dTtrePRd1LfF?=
 =?iso-8859-1?Q?CHiXKISR0y6Ft0QfccZfXEu7vQofsmR1F8GUO53F120e1+dP1StdUTxK3z?=
 =?iso-8859-1?Q?m+QkcsQiAyaRqiEHJ9TN0wnDE3CsYSofmp+nv0z8gOvShu7K29+D13g0Os?=
 =?iso-8859-1?Q?hKi3+IFVP2F64c6Ai1FvpWkB8lc2c2D2YaugTSijJ9vF0LHVGomahpv4VW?=
 =?iso-8859-1?Q?JzFuYyTdcLUk9Nx1mK8QTdkBIGDKLZPBXu16sB+KUWZ0OH8hQol4tdANid?=
 =?iso-8859-1?Q?vHaELNkKJ6xfFZ0mWAw5yNCkd1JqqjDwze32pCBt3BidcrbkwwpM44vUx5?=
 =?iso-8859-1?Q?iK4qraLipwLB4lPMwxpJ5wip/euU30T+mCXncxm35+enIpVTj1XpivXjz3?=
 =?iso-8859-1?Q?gqQ4Z5pqmVsD++8H35p+ZhjW4FVs57EVb6muqxvbn5eAiw2H7lS1podjH0?=
 =?iso-8859-1?Q?fPLN80zpuoENw8VuQ8bT8jxm1eO3vOUdWCVNBoTxS3WWEFuTJo1AVR/SAZ?=
 =?iso-8859-1?Q?jk9FQLy7zie/dAkLOE31cT2DsALiyUyFI3q26nLBxwynJ9Ji9anWt1X1od?=
 =?iso-8859-1?Q?yDC0uoIOmnkxIQ5uISDnrL1bqZw61Bj1XeDp3SITCsZGRLWiWqU/niaxkB?=
 =?iso-8859-1?Q?Ri8ICXzZpvI63cUXrqn41Ygq480VgWyGP8xA/w9kF6e63eabIV6oNIFped?=
 =?iso-8859-1?Q?yh6dS1C3MCoD+yMmxzDKS1xr1K6irATT9FLU3qDM6Aty4eiUrVV0yXvAmX?=
 =?iso-8859-1?Q?kYdwgaKKzpNEw3ZunlsVI5ZGB2J5bVAilfKMoQHYvqzwlILRyl93ip3EUg?=
 =?iso-8859-1?Q?m39eGI0CYph0I3sq+vyx7Aof3czdqf/B+5egMznblLkFpJ1/OpaChjKqGQ?=
 =?iso-8859-1?Q?y17GCX53Ot3zES9sxpYxs09Y3/8tNbNEZLWN83EWxwu/cfLxbOCpfRwk7+?=
 =?iso-8859-1?Q?Hz03tUF41DlM5JRlSFvOkel3WPiXr3/b32Wv8j6o3FB2dg8EtgKp6sKRkv?=
 =?iso-8859-1?Q?8jqgaJo4YCOuv7i46MosxRA66bDHlxdH+59DQ8?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b95f6477-0d60-474d-b17d-08d8b96a099a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 15:27:15.0710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RS+QCQdaetTnTqESOH+NvXO240/5JnHc4HaECrQuztWxxrsgb6Njy5dl2iWAMjvFyZLZNeNAx3EEQM4GZMtHNmzXHAqqh6lINWiigNzj++E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6337
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150097


Hi Stefano,

Stefano Stabellini writes:

[...]

>>=20
>> ARMv8 platform. Namely Renesas Rcar H3 SoC on Salvator board.
>>=20
>> To accurately determine latency, I employed one of timer counter units
>> (TMUs) available on the SoC. This is 32-bit timer with auto-reload,
>> that can generate interrupt on underflow. I fed it with 33.275MHz
>> clock, which gave me resolution of about 30ns. I programmed the timer
>> to generate interrupt every 10ms. My ISR then read the current timer
>> value and determined how much time passed since last underrun. This
>> gave me time interval between IRQ generation and ISR invocation.
>> Those values were collected and every 10 seconds statistics was
>> calculated. There is an example of output from my Linux driver:
>
> It looks like a solid approach to collect results, similar to the one we
> used for the cache coloring work. Just make sure to collect very many
> results.
>
> A few of questions: did you use a single physical CPU? Are you using
> RTDS and schedule 2 vCPU on 1 pCPU? Is dom0 idle or busy? I take the
> results were measured in domU?
Yes, I used single pCPU, which ran 1-2 vCPUs depending on setup. At
first, this was only Dom0 with 1 vCPU, but in most cases it was Dom0 +
Zephyr DomU each with 1 vCPU.

I quickly determined that 1 vCPU per 1 pCPU case meets my
requirements. On other hand, our real cases will always have more vCPUs
than pCPUs, so I was interested in 2 vCPUs - 1 pCPU case.

>
>> [   83.873162] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (2=
40 ns)
>> [   94.136632] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (2=
40 ns)
>> [  104.400098] rt_eval_tmu e6fc0000.tmu: Mean: 50 (1500 ns) stddev: 129 =
(3870 ns)
>> [  114.663828] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (2=
40 ns)
>> [  124.927296] rt_eval_tmu e6fc0000.tmu: Mean: 56 (1680 ns) stddev: 183 =
(5490 ns)
>>=20
>> This is the baremetal Linux. And there is Dom0:
>>=20
>> [  237.431003] rt_eval_tmu e6fc0000.tmu: Mean: 306 (9180 ns) stddev: 25 =
(750 ns)
>> [  247.694506] rt_eval_tmu e6fc0000.tmu: Mean: 302 (9060 ns) stddev: 17 =
(510 ns)
>>=20
>> Driver outputs both the raw timer value (eg. 4) and the same value
>> scaled to nanoseconds (eg. 1320 ns). As you can see baremetal setup is
>> much faster. But experiments showed that Linux does not provide
>> consistent values, even when running in baremetal mode. You can see
>> sporadic spikes in "std dev" values.
>
> So baremetal IRQ latency is 1320-1680ns and Linux IRQ latency is
> 9060-9180ns. I am not surprised that Linux results are inconsistent but
> I have a couple of observations:
>
> - 9us is high for Linux
> If the system is idle, the latency should be lower, around 2-3us. I
> imagine you are actually running some sort of interference from dom0? Or
> using RTDS and descheduling vCPUs?

9us was in idle state. Interestingly enough, I got latency if 3us while
Dom0 was doing some CPU-intensive tasks. So, under load latency is lower
than in idle state. I didn't investigated this, so I can't tell you what
causes this behavior.

>
> - the stddev of 3870ns is high for baremetal
> In the baremetal case the stddev should be minimal if the system is
> idle.

This is what I expected too. But nevertheless there was spikes. I didn't
investigated this as well, so I can only speculate there. My rootfs is
on NFS, so maybe network driver caused this spikes.

>
>
>> So my next step was to use proper RT OS to do the measurements. I
>> chose Zephyr. My PR that adds Xen support to Zephyr can be found at
>> [1]. Support for RCAR Gen3 is not upstreamed, but is present on my
>> GitHub([2]). At [3] you can find the source code for application that
>> does the latency measurements. It behaves exactly as my linux driver,
>> but provides a bit more information:
>>=20
>>  *** Booting Zephyr OS build zephyr-v2.4.0-2750-g0f2c858a39fc  ***
>> RT Eval app
>>=20
>> Counter freq is 33280000 Hz. Period is 30 ns
>> Set alarm in 0 sec (332800 ticks)
>> Mean: 600 (18000 ns) stddev: 3737 (112110 ns) above thr: 0% [265 (7950 n=
s) - 66955 (2008650 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>> Mean: 388 (11640 ns) stddev: 2059 (61770 ns) above thr: 0% [266 (7980 ns=
) - 58830 (1764900 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>> Mean: 358 (10740 ns) stddev: 1796 (53880 ns) above thr: 0% [265 (7950 ns=
) - 57780 (1733400 ns)] global [265 (7950 ns) 66955 (2008650 ns)]

This is Zephyr running as DomU.

>> ...
>>=20
>> So there you can see: mean time, standard deviation, % of interrupts
>> that was processed above 30us threshold, minimum and maximum latency
>> values for the current 10s run, global minimum and maximum.
>>=20
>> Zephyr running as baremetal showed very stable results (this is an
>> older build, so no extended statistics there):
>>=20
>> ## Starting application at 0x480803C0 ...
>>  *** Booting Zephyr OS build zephyr-v2.4.0-1137-g5803ee1e8183  ***
>> RT Eval app
>>=20
>> Counter freq is 33280000 Hz. Period is 30 ns
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)

And this is Zephyr is running as baremetal.

>> ...
>>=20
>> As Zephyr provided stable readouts with no jitter, I used it to do all
>> subsequent measurements.
>
> I am a bit confused here. Looking at the numbers above the stddev is
> 112110 ns in the first instance. That is pretty high. Am I looking at
> the wrong numbers?

I added some clarification above. As for 112110ns in the very first instanc=
e
- I always ignored the first instance, assuming that things need to
settle after domain being created.

But your comment is actually correct: what exacelt should "settle"?
Domain is already created. All should run smoothly. So, this is worth
investigating.

>> IMPORTANT! All subsequent tests was conducted with only 1 CPU core
>> enabled. My goal was to ensure that system can timely react to an
>> external interrupt even under load.
>
> All right. FYI I have no frame of reference for 2 vCPUs on 1 pCPUs, all
> my tests were done with 1vCPU <-> 1pCPU and the null scheduler.

As I said, I had no issues with 1vCPU <-> 1pCPU setup, so I quickly
moved to cases which had issues.

>> Test results and latency sources
>>=20
>> As you can see, baremetal OS provides latency of ~0.9us without any
>> deviations. The same code running as DomU on idle system shows mean
>> latency of 12us and deviation of about 10us. Range of latencies in a
>> 10s batch can vary from 8us to 25us. This fits into required 30us
>> threshold, so no big issue there.
>>=20
>> But this worsens under certain conditions.
>>=20
>> 1. Serial console. RCAR serial driver (scif) works in synchronous
>>    mode, so any heavy serial console output leads to higher
>>    latency. Tests shows mean latency of 1000us and deviation of 1332
>>    us. 54% of interrupts are handled outside of 30us period. Real
>>    values may be even higher, because in some cases timer would do
>>    full cycle and instead of say 11ms ISR would read 11 % 10 =3D 1ms
>>    latency. I tried to enable asynchronous mode for the serial
>>    console. This made things better, but it lead to gaps in output, so
>>    I just turned the serial console off completely.
>
> That's very interesting. I wonder if other serial drivers would cause
> similar issues, e.g. PL011.

They should. This behavior is programmed in serial.c. Driver can enable
async mode calling serial_async_transmit(). As I can see, only ns16550
driver does this.

Maybe you didn't saw problems there because you had more pCPU enabled
and Xen used some other pCPU to do UART operations.

>> 2. RTDS scheduler. With console disabled, things like "hexdump -v
>>    /dev/zero" didn't affected the latency so badly, but anyways,
>>    sometimes I got ~600us spikes. This is not a surprise, because of
>>    default RTDS configuration. I changed period for DomU from default
>>    10ms to 100us and things got better: with Dom0 burning CPU I am
>>    rarely getting max latency of about ~30us with mean latency of ~9us
>>    and deviation of ~0.5us. On other hand, when I tried to set period
>>    to 30us, max latency rose up to ~60us.
>
> This is very interestingi too. Did you get any spikes with the period
> set to 100us? It would be fantastic if there were none.

As far as I can remember, there wasn't any. At least in my setup. And
with workaround for alloc_heap_pages() issue. Of course, I didn't
covered all the possible use cases. But in settled state, when all
domains are created and they are just doing owns tasks there was no
spikes.

>
>> 3. Huge latency spike during domain creation. I conducted some
>>    additional tests, including use of PV drivers, but this didn't
>>    affected the latency in my "real time" domain. But attempt to
>>    create another domain with relatively large memory size of 2GB led
>>    to huge spike in latency. Debugging led to this call path:
>>=20
>>    XENMEM_populate_physmap -> populate_physmap() ->
>>    alloc_domheap_pages() -> alloc_heap_pages()-> huge
>>    "for ( i =3D 0; i < (1 << order); i++ )" loop.
>>=20
>>    This loops handles struct page* for every one of 262144 pages that
>>    was allocated by calling populate_physmap(). This function is not
>>    preemptible and it takes about a second to complete on my
>>    setup. Needless to say that it completely screws any responsiveness
>>    of the hypervisor.
>>=20
>> I managed to overcome the issue #3 by commenting out all calls to
>> populate_one_size() except the populate_one_size(PFN_4K_SHIFT) in
>> xg_dom_arm.c. This lengthened domain construction, but my "RT" domain
>> didn't experienced so big latency issues. Apparently all other
>> hypercalls which are used during domain creation are either fast or
>> preemptible. No doubts that my hack lead to page tables inflation and
>> overall performance drop.
>
> I think we need to follow this up and fix this. Maybe just by adding
> a hypercall continuation to the loop.

As Julien pointed out, that is hardly possible with the current
code. But we need to find some way to fix this.

[...]

--=20
Volodymyr Babchuk at EPAM=

