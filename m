Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6692F2F3CA0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 00:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66209.117521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzTOb-0007p7-MQ; Tue, 12 Jan 2021 23:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66209.117521; Tue, 12 Jan 2021 23:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzTOb-0007oi-JK; Tue, 12 Jan 2021 23:48:17 +0000
Received: by outflank-mailman (input) for mailman id 66209;
 Tue, 12 Jan 2021 23:48:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fP7O=GP=epam.com=prvs=164660cab8=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kzTOZ-0007oN-Uj
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 23:48:16 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c151dfb0-870d-4d48-b5ed-732afe57e807;
 Tue, 12 Jan 2021 23:48:14 +0000 (UTC)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10CNixl0012011; Tue, 12 Jan 2021 23:48:12 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54])
 by mx0a-0039f301.pphosted.com with ESMTP id 35y5h0rp5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jan 2021 23:48:12 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB4196.eurprd03.prod.outlook.com (2603:10a6:208:c6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 23:48:05 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539%6]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 23:48:05 +0000
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
X-Inumbo-ID: c151dfb0-870d-4d48-b5ed-732afe57e807
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkwlJeidMk9Y6erj7v8Oy0523MkDkaoxA0OFFf8XPICyLUgh8+LRSx8xGXqsZqbigtO+EqEGL8FioQMpkIRypE1WpUipNttg5Wa3zeAGCYOqtJgSYnmvIIry+SAVOyhl496/cMqCpLAqe+YH/DxZPx9+4NHo99f31xdGBS2RS+o9h/qgDe+BVqOTFH6XFh5YDhDBwAzjSbFVkn41pbSE3Ew75h49V4Z1HfXywEuaYtcxg5awfPdzw9nmUSJ3ZpXrbwqJ/jaR2zN1mzBXoSBRRJr9keYOaWB6itOw0ZWR7ea9EsxwvqYtknam9lD3DkYulMqb1CIxptfxgzIxhoBedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3w1innla6aXJqnqV7t2NEYKWicYU6C5fxsltBf9xQW0=;
 b=kZaqTUoZEDlx8ElCr2l7ZvEX9b2x/cmgPvqLbtjmQGduw4gp/NxXpQDC5BZVFcbTrgcTpi9Vg1zcdt+JKVDNjDsAAxokUAubJhzBaRYLRrARIyrnQw1rs3H7ukFxAicdJDWbRk6jH6iHgJ63Lcp1nEbWGC+kZLtVrMg0Vb0TzWWEMhVWWN1yHXih8eH9fRGXkCF0YnUSQqYrfPj5B6za2rrzsnnVwwS5BECHljW9LFSUWZfUWm6ul9aMJtqHPm/1pYEwBL98cJYrF7UASYJDJkYoNbN7muJ15AVohLO866+/wn9/Pt4NHPI7brqmWRc0wfsEqWLMpZO3+/1WyQ3gQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3w1innla6aXJqnqV7t2NEYKWicYU6C5fxsltBf9xQW0=;
 b=b9S5yfQf+FB8yGpGPwn0bUkJkV9ynQLzlOlbxEE4EVKBv50IGQUnJ64b1RpIG5cdGu4KpXdN0oJ6Dn3jABDPbilNrtIwJfcQQevRYaIo/DqBRAkh39bFNH2cDisPCrhmCiFhY0p5z44lSipl6wcJmGdiF95vFVv7d+s/v5ltPSndFuY14U23kyqd33d2HwwAGfpFLovctYKtUypBRbD/95sKz1sE2W3E2Lx0imL9frGSPAVDz/kqyR8XHVtNmSnKoQE+JAcS2L3ebAGE4mOhahXzWNec2RmPMeXR6mMKBQSMesH0Bt8D9uIjwBTEQnE7cStNBHtA1NCXT+dqJLSSyA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>,
        Stefano Stabellini
	<stefano.stabellini@xilinx.com>,
        Dario Faggioli <dario.faggioli@suse.com>
Subject: IRQ latency measurements in hypervisor
Thread-Topic: IRQ latency measurements in hypervisor
Thread-Index: AQHW6T1firbO0EOYpEKUiW6vsavsPQ==
Date: Tue, 12 Jan 2021 23:48:05 +0000
Message-ID: <87pn294szv.fsf@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 792bb280-2cf3-4c41-801c-08d8b7548203
x-ms-traffictypediagnostic: AM0PR03MB4196:
x-microsoft-antispam-prvs: 
 <AM0PR03MB4196CB2002B23CB26CC989BAE6AA0@AM0PR03MB4196.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gSkQ2mW19Ke1UuwFmr7XzlzbphY0Rr0aSd8Cgq1lvQC6r9EiIVmUSq0YLmso80GxKwBSRrsKpf//FZ1o6IYQXfg7omzW7lQTdSWBbp+c1XWB9TfbcfFoScl2noZRaKqdKY7PEuDzUBdVWp1pDlw/OvHKYheAs6TAeoitCvU9N0MmXzx7FCrzsFTiiwJJulRSKCKpvCgmykpQegHPnVGUJUPP3FRg6qCz31G64ZT3vvblfoONfpWju/0oxmml5oGisKJA1GaEO0C+9N/ipFOBgW6TQWpRJu0b0uwbbX+FMpNgCfHifjqYxN37WrFciGhP21N9QiwSYpRKy87Tl1cmq4uL1rEq/1lHDYdqKvBqf34RBcFP/J22hg4cit8eIw6SDYoMQlEiZcBSRDdlUTnCPRcsy57ZHuUlLFJFP3pNqyt8cuqXg0yJ6t/kEUXeN5a45D1GrLxCY00ZoVFXXjpYCw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39840400004)(376002)(366004)(6916009)(83380400001)(86362001)(36756003)(2906002)(6512007)(186003)(6486002)(478600001)(66946007)(71200400001)(966005)(66556008)(26005)(5660300002)(66446008)(64756008)(4326008)(54906003)(2616005)(55236004)(316002)(66476007)(8676002)(76116006)(6506007)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?9xJ9P1mA15RS0se9YSYbZ2XL62iuIYGAZAYhmsUexHPn+x+16pOfQpz2fF?=
 =?iso-8859-1?Q?vmcD+dx5rZD0UQ0WHTXtL82KMTcZ0AiSpS299YFOkbsBRMUk6Xc3L1j6HZ?=
 =?iso-8859-1?Q?D37Wu3PT6A5+At0jPU/xSFzRcWn1W0T5/FfUoNRqjM6P+yUkPz5oB16h1v?=
 =?iso-8859-1?Q?zFqha9sWaQTNQMZBoVClqSuZOBQMsyynNmaMJx/fhmvriy2uqAE/HxVDwY?=
 =?iso-8859-1?Q?hI2zDraBVLU0OEUC9CNr9XF+AWAA9RHTK5T69yRzMxnubazF1JtoVAQEJx?=
 =?iso-8859-1?Q?PqRvW4up2IPIKQRPzyIcC6tOQbW7APg8wAuIChqkANg3nphiWlUXnjiQ4/?=
 =?iso-8859-1?Q?YEm4IPS9HzZG6860drX0UDhNpxfbIHQ1Sdiip2hl5qzshaIjGhfhfyGBy1?=
 =?iso-8859-1?Q?ruUnMqiPeKjlVJJXV6EcLeA14twJyF64yHyPrE6RZ2CrOqS+RRnAxNdPd6?=
 =?iso-8859-1?Q?ZBGGJh+jnpqoh3F42+ZFj7R2YWTBBpjo5cLavhNP6wNgvvxHuRlhi41+75?=
 =?iso-8859-1?Q?/Wk4C38gk6ts1PJZ1IHyOGSbkvPi0yzyDQpS97Cjhc6u+xaAdLiUbCXDSf?=
 =?iso-8859-1?Q?UMY3ZOS+Hu0DE9Rfq+/vVC8zROPnpmHUYh/sPNM4+2MngHsNJOZDMXjCCd?=
 =?iso-8859-1?Q?oKNpjE57m4E4beQZmuA2C4ZCR3JgFnX6JPE6D/knLwjrci8pwb23uZmKLf?=
 =?iso-8859-1?Q?sKS4+5QPOTrqvmgMylfeakEPinOHfspZmLJUixyRbS6MxecakK6+ByRxj4?=
 =?iso-8859-1?Q?Cn5I6sE2trbDTIBzKhhd6Th+6C7LzvVXAgg4GalamqFy0wq1bqBvVjgLH6?=
 =?iso-8859-1?Q?d1tTDchwMWIuLVJZRn62r6kVdm2nR47esuK05SspQGkTuDAIkLQUEp2u1v?=
 =?iso-8859-1?Q?LfkIxqPchCC/gmWSqsifeFAXw4E3L0SEO6351noafAO9yTXzOlqvOE4IUk?=
 =?iso-8859-1?Q?l3bKUsONFrxjMqS9cNCmTxe6CLplkM3ac2I90Agpo1d27vx4fKLW4FotyS?=
 =?iso-8859-1?Q?Im9X8BUNTHs24/FbTDCK3CmN/CbHTK/a4E/CVY?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 792bb280-2cf3-4c41-801c-08d8b7548203
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 23:48:05.7989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xG2vsuNLkD7Rcw8FRhMyzg684K/TwHQto+8uI+sd2wmpZmKwSpXu5PIQylGE1Rbp+6+Ga5xq7M5KGPxQ9vnj6R+e1b64+2NGZQbk9AP0O/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4196
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101120135


Hello community,

Recently I was experimenting with context switching latencies in
Xen. I want to share my findings and discuss some issues I have found.

My target was to ensure that no more 30us passes between interrupt
generation and handling in a guest VM. Main goal was to determine if
Xen is ready for soft RT and to identify main issues that prevent
this.

TLDR: I was able to achieve mean 15us latency with tuned RTDS
scheduler, disabled serial console and some hacks to the Xen
toolstack. This was done on a setup with 1 PCPU.

Test setup.

ARMv8 platform. Namely Renesas Rcar H3 SoC on Salvator board.

To accurately determine latency, I employed one of timer counter units
(TMUs) available on the SoC. This is 32-bit timer with auto-reload,
that can generate interrupt on underflow. I fed it with 33.275MHz
clock, which gave me resolution of about 30ns. I programmed the timer
to generate interrupt every 10ms. My ISR then read the current timer
value and determined how much time passed since last underrun. This
gave me time interval between IRQ generation and ISR invocation.
Those values were collected and every 10 seconds statistics was
calculated. There is an example of output from my Linux driver:

[   83.873162] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 =
ns)
[   94.136632] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 =
ns)
[  104.400098] rt_eval_tmu e6fc0000.tmu: Mean: 50 (1500 ns) stddev: 129 (38=
70 ns)
[  114.663828] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 =
ns)
[  124.927296] rt_eval_tmu e6fc0000.tmu: Mean: 56 (1680 ns) stddev: 183 (54=
90 ns)

This is the baremetal Linux. And there is Dom0:

[  237.431003] rt_eval_tmu e6fc0000.tmu: Mean: 306 (9180 ns) stddev: 25 (75=
0 ns)
[  247.694506] rt_eval_tmu e6fc0000.tmu: Mean: 302 (9060 ns) stddev: 17 (51=
0 ns)

Driver outputs both the raw timer value (eg. 4) and the same value
scaled to nanoseconds (eg. 1320 ns). As you can see baremetal setup is
much faster. But experiments showed that Linux does not provide
consistent values, even when running in baremetal mode. You can see
sporadic spikes in "std dev" values.

So my next step was to use proper RT OS to do the measurements. I
chose Zephyr. My PR that adds Xen support to Zephyr can be found at
[1]. Support for RCAR Gen3 is not upstreamed, but is present on my
GitHub([2]). At [3] you can find the source code for application that
does the latency measurements. It behaves exactly as my linux driver,
but provides a bit more information:

 *** Booting Zephyr OS build zephyr-v2.4.0-2750-g0f2c858a39fc  ***
RT Eval app

Counter freq is 33280000 Hz. Period is 30 ns
Set alarm in 0 sec (332800 ticks)
Mean: 600 (18000 ns) stddev: 3737 (112110 ns) above thr: 0% [265 (7950 ns) =
- 66955 (2008650 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
Mean: 388 (11640 ns) stddev: 2059 (61770 ns) above thr: 0% [266 (7980 ns) -=
 58830 (1764900 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
Mean: 358 (10740 ns) stddev: 1796 (53880 ns) above thr: 0% [265 (7950 ns) -=
 57780 (1733400 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
...

So there you can see: mean time, standard deviation, % of interrupts
that was processed above 30us threshold, minimum and maximum latency
values for the current 10s run, global minimum and maximum.

Zephyr running as baremetal showed very stable results (this is an
older build, so no extended statistics there):

## Starting application at 0x480803C0 ...
 *** Booting Zephyr OS build zephyr-v2.4.0-1137-g5803ee1e8183  ***
RT Eval app

Counter freq is 33280000 Hz. Period is 30 ns
Mean: 31 (930 ns) stddev: 0 (0 ns)
Mean: 31 (930 ns) stddev: 0 (0 ns)
Mean: 31 (930 ns) stddev: 0 (0 ns)
Mean: 31 (930 ns) stddev: 0 (0 ns)
Mean: 31 (930 ns) stddev: 0 (0 ns)
Mean: 31 (930 ns) stddev: 0 (0 ns)
...

As Zephyr provided stable readouts with no jitter, I used it to do all
subsequent measurements.


IMPORTANT! All subsequent tests was conducted with only 1 CPU core
enabled. My goal was to ensure that system can timely react to an
external interrupt even under load.


Test results and latency sources

As you can see, baremetal OS provides latency of ~0.9us without any
deviations. The same code running as DomU on idle system shows mean
latency of 12us and deviation of about 10us. Range of latencies in a
10s batch can vary from 8us to 25us. This fits into required 30us
threshold, so no big issue there.

But this worsens under certain conditions.

1. Serial console. RCAR serial driver (scif) works in synchronous
   mode, so any heavy serial console output leads to higher
   latency. Tests shows mean latency of 1000us and deviation of 1332
   us. 54% of interrupts are handled outside of 30us period. Real
   values may be even higher, because in some cases timer would do
   full cycle and instead of say 11ms ISR would read 11 % 10 =3D 1ms
   latency. I tried to enable asynchronous mode for the serial
   console. This made things better, but it lead to gaps in output, so
   I just turned the serial console off completely.

2. RTDS scheduler. With console disabled, things like "hexdump -v
   /dev/zero" didn't affected the latency so badly, but anyways,
   sometimes I got ~600us spikes. This is not a surprise, because of
   default RTDS configuration. I changed period for DomU from default
   10ms to 100us and things got better: with Dom0 burning CPU I am
   rarely getting max latency of about ~30us with mean latency of ~9us
   and deviation of ~0.5us. On other hand, when I tried to set period
   to 30us, max latency rose up to ~60us.

3. Huge latency spike during domain creation. I conducted some
   additional tests, including use of PV drivers, but this didn't
   affected the latency in my "real time" domain. But attempt to
   create another domain with relatively large memory size of 2GB led
   to huge spike in latency. Debugging led to this call path:

   XENMEM_populate_physmap -> populate_physmap() ->
   alloc_domheap_pages() -> alloc_heap_pages()-> huge
   "for ( i =3D 0; i < (1 << order); i++ )" loop.

   This loops handles struct page* for every one of 262144 pages that
   was allocated by calling populate_physmap(). This function is not
   preemptible and it takes about a second to complete on my
   setup. Needless to say that it completely screws any responsiveness
   of the hypervisor.

I managed to overcome the issue #3 by commenting out all calls to
populate_one_size() except the populate_one_size(PFN_4K_SHIFT) in
xg_dom_arm.c. This lengthened domain construction, but my "RT" domain
didn't experienced so big latency issues. Apparently all other
hypercalls which are used during domain creation are either fast or
preemptible. No doubts that my hack lead to page tables inflation and
overall performance drop.

Conclusions.

I wanted to:

1. Share my approach to IRQ latency measurements.

2. Share results of said measurements.

3. Ask for other potential scenarios, which can affect IRQ latency so I
   can test them on my setup.

4. Discuss the issue with alloc_domheap_pages(). I brooded over ways
   to make it preemptible. But it is a) located deep in call chain and
   b) used not only by hypercalls. So I can't see an easy way to make
   it preemptible. The best solution would be of course to make the
   whole hypervisor preemptible. I even heard about some work long
   time ago...

5. Show that under certain conditions Xen can be used in a soft RT
   system. Of course, additional tests are needed, but with some minor
   tweaks it can provide ~15us IRQ latency on a typical workload.

[1] https://github.com/zephyrproject-rtos/zephyr/pull/30164
[2] https://github.com/lorc/zephyr/tree/renesas_salvator_x
[3] https://github.com/lorc/zephyr/blob/rt_eval/samples/rt_eval/src/main.c


--=20
Volodymyr Babchuk at EPAM=

