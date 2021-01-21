Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD482FDF7E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 03:39:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71865.129052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Psl-0000Yk-Ak; Thu, 21 Jan 2021 02:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71865.129052; Thu, 21 Jan 2021 02:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Psl-0000YL-6m; Thu, 21 Jan 2021 02:39:35 +0000
Received: by outflank-mailman (input) for mailman id 71865;
 Thu, 21 Jan 2021 02:39:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yF5=GY=epam.com=prvs=16557ba193=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1l2Psj-0000YG-ML
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 02:39:33 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12a0f076-4c74-4550-a9f2-32d9b0bc3452;
 Thu, 21 Jan 2021 02:39:31 +0000 (UTC)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10L2cDui023644; Thu, 21 Jan 2021 02:39:29 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51])
 by mx0a-0039f301.pphosted.com with ESMTP id 3668rwby81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 02:39:28 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB3649.eurprd03.prod.outlook.com (2603:10a6:208:43::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 21 Jan
 2021 02:39:24 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539%6]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 02:39:24 +0000
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
X-Inumbo-ID: 12a0f076-4c74-4550-a9f2-32d9b0bc3452
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsrUw1YpMyC3N83HmHHk39GlasEnaDfvDE/8a94SmsSYLRfL9HhUzYYpzydhYJWJIwqqeIvWlXghPC1CEI6+LKxkfDbqDwMh3XhcEspU/rI/QAWmDAojdI4Pgbe6M30rl7eB2OLEALHeRlWF6c49Jh0rmLnmhjXcPZJeu3FrL24wlXjTumwQxVGv5VdifEaQz04WvnLBDPB+CBs9wrvyw4I0jEKGU/PzxQCX39zH4dMROpRQCYRJ5w0VOpLTdvTvw3DfIq4/hlENGMVAJjoZwtPQv5xhZZcAkmLG87fYLuCW63bXgP1zoIsMJqVN3P5iETrskzytBxCKst6+Gwf5qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsClBXJVkpCuLz8I2nR+KIGIJw1kv7qsiwCrOo+UhXo=;
 b=MwYGp6hTmxVebTVRdQDaMFMgR+TzidSNKnQhqwQyM2SiDyN7FlPj8apXwY56R5S6Gl06O/0MPXIiFLJIiHtcGo6Q1fDFXjSlbg8tRIucePmW1621gOF9qce7x4XHWwyPO+kVbDhO+j1VEsPe4Cojtv5RY6u2jjP2P/4ev214K0DNuhpqqrghWkv8Eigsiqypym0c2iV7XHN+9tN70HFkDMEc/zj7rycBTEPktG0n2pFpa2Ew7UsMNbvHpujtImrrwardqaXU7AlxmDFm45rw2AXvVAKQdBJbUzKV0mmao55Zcqmy6wwOcWmCALp8mLweBnx3s5FYwbykydIxVdxRng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsClBXJVkpCuLz8I2nR+KIGIJw1kv7qsiwCrOo+UhXo=;
 b=5Gx14oKGpKAWSBqgrZu6T83Y+xmjZguGIFtn4VQcapatdWJnPjmDiJDegPaurGc4vv71SMCEBvlUYSrNUwzp0YcU9UzGwtwjaw/IIJI0zKwCz4jYuR0B84u0Ic3vxrgYtSvl2SwXGPJSduIB+mLKGhOAeN4ov5XxRrTYQuwRFrPvxze4uVal+TBgFP/2JOV4jZ8DIn/d5ne7hQ6bClhjcCtG8I/J0B/flPveH/QOH38j1zDxlGn4S+uLozpuoihjII0Kegcs1uVVGemU5UO4b7q3ffm/ahmvlhFpRcw95qTl1tFhkiKgSW0CRyQgHhtwWLk/4Jp4jHhuPjIcCJRXPQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <jgrall@amazon.com>,
        Stefano Stabellini
	<stefano.stabellini@xilinx.com>,
        Dario Faggioli <dario.faggioli@suse.com>
Subject: Re: IRQ latency measurements in hypervisor
Thread-Topic: IRQ latency measurements in hypervisor
Thread-Index: AQHW6T1firbO0EOYpEKUiW6vsavsPaoqWISAgAcSQoA=
Date: Thu, 21 Jan 2021 02:39:24 +0000
Message-ID: <87pn1z109w.fsf@epam.com>
References: <87pn294szv.fsf@epam.com>
 <b42ec58b-aa78-f781-f90e-b2f89a5ff832@citrix.com>
In-Reply-To: <b42ec58b-aa78-f781-f90e-b2f89a5ff832@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c1b9b55-a1bb-4d62-5989-08d8bdb5c409
x-ms-traffictypediagnostic: AM0PR03MB3649:
x-microsoft-antispam-prvs: 
 <AM0PR03MB3649222F6840F6C1B6426564E6A10@AM0PR03MB3649.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Rdg/rdosmmBn0Vk+KFnXP1RjXoWJbj+f8KLCMCZRkuVKXrjgL6cg7niGwwi7k7AmBoG+nLlVXLw8wFJuhWEW6I2U+uw56sm09ivzH+fDN3kdy0YSB6Nu8nkbvbB93PGPpzbFGW6SHWULf5moGpwk+RtcqHwTI8HyGaoU80aOSfIfag3cVq34tmduaI332o8ziTH6G9KfIn55qL2tNVhJM6IOskuhpXoF5NfZ2FKDCAe5hznsYy4kK8tFA/sIZlpIsDYaQkrrYauca141ZGROpGImuVBXOQgbP1IUrhP3N9mpTqCgUaHp8nN0m+m3azWDW2TwT/gktI46lmH39ohEgdmI9rG7jBdp6dYuKfpEfqgR9hV+H8X3IRTIXkakkC9So7KyMM5ns/KWLasUacnKn7X0ax6J2G70wwxMqhptTchBRKcso9DDqOmIuCIak+SM1Q9zoOPZtl/5EmE43/wIP4fS7RRE5UkFMtt/uA1AiTHdw4A4UHh4uTmrQMtCnWAW+rgBCqIJJPriYf8O4atFQw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(30864003)(2616005)(55236004)(36756003)(5660300002)(186003)(8936002)(76116006)(83380400001)(53546011)(478600001)(6916009)(6512007)(66946007)(26005)(71200400001)(54906003)(316002)(4326008)(86362001)(6486002)(2906002)(66476007)(8676002)(6506007)(66556008)(64756008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?TUMGvaTQ1BLwHBPxKwOQth/OPeT/Za1K98KXBCciavY44RiuOgnnon+Y4V?=
 =?iso-8859-1?Q?W1FXMTk8s5IclaSHZN8OzXuYBWlc9xhb3cQcME/MJSNv8mojJAoo9JrINu?=
 =?iso-8859-1?Q?mXPe26B2s9O0pfkErg6A+Wq5Hn8r4tilOrxCUtNaPPjIGMIE4vMLYW+kzB?=
 =?iso-8859-1?Q?wY9AoNtnyFI+Gzr+H/nYojs5DjnqiMKaYToSd7DFPCLEbJ6lIE9w3Xawty?=
 =?iso-8859-1?Q?9w39pVfFTlJo52dHUE+HgTRellTDUJfXe0yTtZprP9FQX/ttPfVWu4oJpv?=
 =?iso-8859-1?Q?3XoQRWOarDpgOti03j+OAqlCOIN7jAckLTHf6j/dviRPLFZ1nWzKZE7ASg?=
 =?iso-8859-1?Q?/k3MIi4QamzClq/bEoJLR9mlseDxn1yqNNa5vTLp21GnCkijgyr5SWaBa5?=
 =?iso-8859-1?Q?sSU5QCu/G1zX/COGxTx9mDCTgiH+2A4/bB3q1NlzpRZ+kbv3jBh6mS1kgu?=
 =?iso-8859-1?Q?veAS+WVsD5YtoV35M4QAI51OOQh868HA/l9dQpMBNU5mJhUBji4it+XtSR?=
 =?iso-8859-1?Q?8RqpKwp8gOE/8LtrEYkA4crcXnB2xmoR4mM1ujTbqLQFpxylSyuelYamTB?=
 =?iso-8859-1?Q?EoFB6GAIPnqhp5uy1t5rf+mfjttVKI7826OAhNXhZFLhyP1nRyhDwor6qY?=
 =?iso-8859-1?Q?6qFrEFZ6o3oiORgFfzDbI/3jwxzkmE1l6AaW7gdAEME5e6JGSNMGVKfVm8?=
 =?iso-8859-1?Q?lmi/vSSuNi+IQ5lrbh/RhS9SLRQ7+sjC9DrNRWg3Xr4JZAXgJ4drrx0BhR?=
 =?iso-8859-1?Q?B6XuHCYbzRCKGUImAE9Cmm6GYwRqAyUJsjC0bI4XtWHjND49vulhnxHrTp?=
 =?iso-8859-1?Q?RKID9JTJfFTE01NfrFClZPsvA9fZaghrrCf4Yo58nvySFTCG+6wZA437FE?=
 =?iso-8859-1?Q?1saZqvDGsEXK8IkcRtH/dzCOkcsdCklkgSEiIzvL7hXOXvS+/xXBqyPbtk?=
 =?iso-8859-1?Q?wWGCHEhJMn0mKkOp1V3k/B1KlKf9VaG9Y0MdQizyfAiETHQAmLAnTbp+5i?=
 =?iso-8859-1?Q?03D/M3pAUJihkwbeGZ5AIfOwVsglCuUmOAn3iN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1b9b55-a1bb-4d62-5989-08d8bdb5c409
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 02:39:24.7762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qeYo04GT9WLLgyUiFCqFgXy1FG7oazudioRxE5/cC4VLuchntkFNvhKX4yW8Y8K/BEmM47hinXzyxSYBO07XffWM00fcGflCSxotovj3vqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3649
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210010

Hi Andrew,

Andrew Cooper writes:

> On 12/01/2021 23:48, Volodymyr Babchuk wrote:
>> Hello community,
>>
>> Recently I was experimenting with context switching latencies in
>> Xen. I want to share my findings and discuss some issues I have found.
>>
>> My target was to ensure that no more 30us passes between interrupt
>> generation and handling in a guest VM. Main goal was to determine if
>> Xen is ready for soft RT and to identify main issues that prevent
>> this.
>>
>> TLDR: I was able to achieve mean 15us latency with tuned RTDS
>> scheduler, disabled serial console and some hacks to the Xen
>> toolstack. This was done on a setup with 1 PCPU.
>>
>> Test setup.
>>
>> ARMv8 platform. Namely Renesas Rcar H3 SoC on Salvator board.
>>
>> To accurately determine latency, I employed one of timer counter units
>> (TMUs) available on the SoC. This is 32-bit timer with auto-reload,
>> that can generate interrupt on underflow. I fed it with 33.275MHz
>> clock, which gave me resolution of about 30ns. I programmed the timer
>> to generate interrupt every 10ms. My ISR then read the current timer
>> value and determined how much time passed since last underrun. This
>> gave me time interval between IRQ generation and ISR invocation.
>> Those values were collected and every 10 seconds statistics was
>> calculated. There is an example of output from my Linux driver:
>>
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
>>
>> This is the baremetal Linux. And there is Dom0:
>>
>> [  237.431003] rt_eval_tmu e6fc0000.tmu: Mean: 306 (9180 ns) stddev: 25 =
(750 ns)
>> [  247.694506] rt_eval_tmu e6fc0000.tmu: Mean: 302 (9060 ns) stddev: 17 =
(510 ns)
>>
>> Driver outputs both the raw timer value (eg. 4) and the same value
>> scaled to nanoseconds (eg. 1320 ns). As you can see baremetal setup is
>> much faster. But experiments showed that Linux does not provide
>> consistent values, even when running in baremetal mode. You can see
>> sporadic spikes in "std dev" values.
>>
>> So my next step was to use proper RT OS to do the measurements. I
>> chose Zephyr. My PR that adds Xen support to Zephyr can be found at
>> [1]. Support for RCAR Gen3 is not upstreamed, but is present on my
>> GitHub([2]). At [3] you can find the source code for application that
>> does the latency measurements. It behaves exactly as my linux driver,
>> but provides a bit more information:
>>
>>  *** Booting Zephyr OS build zephyr-v2.4.0-2750-g0f2c858a39fc  ***
>> RT Eval app
>>
>> Counter freq is 33280000 Hz. Period is 30 ns
>> Set alarm in 0 sec (332800 ticks)
>> Mean: 600 (18000 ns) stddev: 3737 (112110 ns) above thr: 0% [265 (7950 n=
s) - 66955 (2008650 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>> Mean: 388 (11640 ns) stddev: 2059 (61770 ns) above thr: 0% [266 (7980 ns=
) - 58830 (1764900 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>> Mean: 358 (10740 ns) stddev: 1796 (53880 ns) above thr: 0% [265 (7950 ns=
) - 57780 (1733400 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>> ...
>>
>> So there you can see: mean time, standard deviation, % of interrupts
>> that was processed above 30us threshold, minimum and maximum latency
>> values for the current 10s run, global minimum and maximum.
>>
>> Zephyr running as baremetal showed very stable results (this is an
>> older build, so no extended statistics there):
>>
>> ## Starting application at 0x480803C0 ...
>>  *** Booting Zephyr OS build zephyr-v2.4.0-1137-g5803ee1e8183  ***
>> RT Eval app
>>
>> Counter freq is 33280000 Hz. Period is 30 ns
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> ...
>>
>> As Zephyr provided stable readouts with no jitter, I used it to do all
>> subsequent measurements.
>>
>>
>> IMPORTANT! All subsequent tests was conducted with only 1 CPU core
>> enabled. My goal was to ensure that system can timely react to an
>> external interrupt even under load.
>>
>>
>> Test results and latency sources
>>
>> As you can see, baremetal OS provides latency of ~0.9us without any
>> deviations. The same code running as DomU on idle system shows mean
>> latency of 12us and deviation of about 10us. Range of latencies in a
>> 10s batch can vary from 8us to 25us. This fits into required 30us
>> threshold, so no big issue there.
>
> This is all very interesting work - thankyou for sharing.
>
> However, there is one set of measurements which I think are missing, and
> are needed to describe the full picture.
>
> You've got measurements for a native kernel taking interrupts, with
> excellent results for Zephyr, and good results for Linux.
>
> You've also got measurements for putting Xen into the mix, and the
> results could do with some work.
>
> Adding Xen totally changes the structure of the system.  Conceptually
> (if the Xen model were expressed as native), what you've got now is a
> single piece of userspace (pid1, no fork()ing), which is single threaded
> (but doing its own private task switching between "thread"), where some
> threads are making blocking system calls (all Xen hypercalls are fully
> synchronous) while other threads are measuring the latency for a signal
> to hit.

Not quite. I used Zephyr to do the most of the measurements, and
it ran as DomU. So, conceptually it was pid1 (Dom0) with a single
thread(vCPU) and pid2 (Zephyr) with a single thread. Pid1 is doing some
blocking calls and pid2 just waiting for its signal so it can measure
latency. Thus, my setup more resembles system with two processes, not
with one.

> I think it would be incredibly valuable to mock something like that up
> as a 3rd set of measurements, because it allows for a fairer comparison
> of the rough structure of a virtualised system, with and without Xen
> being involved.

Well, I probably can put similar setup in Linux. This will allow me to
compare Linux and Xen. Of course, it will be interesting, but I'm not
sure that this comparison will provide any new information. I am
examining Xen, to see if it can fit into some arbitrary requirements for
soft RT. I doubt that Linux will behave better in this scenario, but
even if it will - Linux and Xen are quite different, so it is not easy
to "port" something scheduling-related from one to another.

>
> It would also be very valuable to see where the latency is in the
> system.  Would it be possible to set up a shared page, and have the
> various moving parts write the counter value they see into it, so the
> final stats can do a breakdown?
>
> You probably want counter samples from:
> 1) When Xen has positively identified this single interrupt
> 2) When the interrupt has been marked pending for the guest
> 3) When the guest kernel has positively identified this single interrupt
> 4) When the interrupt handler has run (this is the datapoint you've got,
> AFAICT).

I am using tracing infrastructure already available in Xen to do such
measurements. I described in my reply to Julien how I am doing this. Of
course, it covers only hypervisor part, so it is impossible to cover
points 3 and 4. On other hand, zephyr is quite consistent in its own
latency. Basically, it does nothing other than waiting that single
interrupt. I assume it is safe to take baremetal measurements as a delay
caused by Zephyr itself.

> Maybe for point 2, you also want some metadata as to what context was
> interrupted (EL0..2).
>
> You ought to see reasonably consistent results when interrupting EL0,
> because that should transition immediately to EL1.  For interrupting
> EL1, you'll perhaps see variation depending on whether other higher
> priority are being serviced.

Yes, I am planing to do that sort of measurements. One downside is that
you can use TRACE_XD macros only from C code, so it would not yield the
most accurate result.

On other hand, I am experimenting with hardware tracing. It is somewhat
hard to configure, but I'm hope I'll be able to tracing configuration
that does not cause trace buffer overflows. In this case, I will get the
most accurate timing data possible.

> For interrupting EL2, this is where I'd expect you to see all the
> problems with hypercalls, or potentially other work Xen is doing.=20
> Fundamentally, Xen can't just drop what it's doing and resume guest
> context for the interrupt to be delivered.
>
> We get around this with the hypercall continuation mechanism, which is
> conceptually similar to voluntary preemption (we periodically check to
> see if we should stop doing what we're doing, unwind state safely, and
> get back out into guest context).
>
> However, even using hypercall continuations, there will be a minimum
> unit of work, necessary to guarantee forward progress, which cannot be
> subdivided further.  There is also a cost to having finer grain
> continuation checks, but hopefully that is confined to the error margins.
>

I see. Another problem with hypercall continuations is that there is a
single point of preemption. If hypercall invokes some long running
function, that can't be split into smaller ones, like already mentioned
alloc_heap_pages(), it is impossible to make it preemptible.

>
> Alternatively, if we still have problems, something to consider might be
> the task domain concept which has been discussed before.  This was an
> idea to try and bring something more like normal tasks to Xen, by having
> a hypervisor context that the control domain could queue work with,
> who's running wouldn't be a synchronous hypercall from from the guest's
> perspective.
>
> Such a task domain would require a mechanism to ensure it got scheduled
> with a high enough priority not to get starved, and would probably
> benefit if we restructured Xen to have fewer irq-off areas (which would
> be a great thing irrespective - the scheduler lock in particular needs
> to become irqs-off).  In other words, the task domain concept is a lot
> of work to do, with only a general hope of it resulting in an
> improvement - it shouldn't be jumped upon until lightly to solve perf
> problems.

Task domain seems like an extra entity. Like, how it is better than just
native Xen threads? E.g. linux kernel does not have separate process to
hold own threads.

As I see it, only one reason, why hypercall can't be preempted is the
absence of place where its context can be stored. Thus, all this black
magic of using hypercall arguments as a context storage.

I'm sure that I am oversimplifying and that I'm missing some key aspect,
but how it is hard to just allocate Xen stack for every vCPU and store
its context there? All Xen code is already made thread-safe because of
SMP. So why not just allow preemption at any point outside of atomic contex=
t?

--=20
Volodymyr Babchuk at EPAM=

