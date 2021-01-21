Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC42A2FDE29
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 01:50:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71829.128953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2OAN-0007W5-4Y; Thu, 21 Jan 2021 00:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71829.128953; Thu, 21 Jan 2021 00:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2OAN-0007Vg-1M; Thu, 21 Jan 2021 00:49:39 +0000
Received: by outflank-mailman (input) for mailman id 71829;
 Thu, 21 Jan 2021 00:49:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yF5=GY=epam.com=prvs=16557ba193=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1l2OAK-0007Vb-Qj
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 00:49:36 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7027cb85-cdda-4e08-b1da-9ce07c81645a;
 Thu, 21 Jan 2021 00:49:34 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10L0a74A003198; Thu, 21 Jan 2021 00:49:27 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3668s0m198-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 00:49:27 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB3505.eurprd03.prod.outlook.com (2603:10a6:208:42::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 00:49:23 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539%6]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 00:49:23 +0000
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
X-Inumbo-ID: 7027cb85-cdda-4e08-b1da-9ce07c81645a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SHOVDhqF8bv/PUinqCZU7StXCbFF8C3Whs3PK25ANOcdAh7wxEf5uK5tWXF6T7Vp2YkkwcG6Wf587Q+hd94OAKa2YviuE3nIO5Au3gMUntCsuowXMUdLKx1isF/iSnJERUIU+SufgkpIyXMZi7nxbIvyR4MFq2ZE1IZORorg0rjn2YWm7EBmytVp4ilpL+Jf3E4qPWsoqfDy+++VqbX5TwhsiRA2go2a0iQ9/u3VWO7VwKC/ufnJ6DUpAc8h5c+aDHgQ7Tuciqcepogw9Os+EidK5XJ1FhgZ53EiRVeLSoDTbGNJuJCgTtaigDokbTxuNAarzs5zw0vptkNmBNumCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0Xm/32jGIPz8KN+oPdtx8ZnBtF1eky9NKgbQhTBNfg=;
 b=Ha6cEuycgjKmyUEuVn/vL/7IUgw+j1kdIpJh6jUaKvkTThTvmPESNb/HW5O+yqftwRtmQxrcExGQsm6l6/NshA9hGNsHxfmQoOYr8Oe6v7Tsw4LHzfC1o+JhyMp06l8Li1agXbSxTi9kbqa+1wRpTBIwKS7jPRTJfUeZK+KhLzYQLQEsDQstpqaA5W/RRQL9s91tneK+DbEIpdncaalgIA6FDxcUARpluLSOhtJzefJula+5FFA+c7ptVd9HezAku56Y8drd/kJ74vijtj0tqbFSMZfLAEZjja5wB+6DUVpGMDIg0sTCAW90Aj6HyXvtl4ReIv4Mi5NT5DfmOW+omA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0Xm/32jGIPz8KN+oPdtx8ZnBtF1eky9NKgbQhTBNfg=;
 b=pqVDb19izHQs7iR/IuPmURb/spEc3S0vwg4viPyp5LtweG8dCEpf/YV6bESEpqYVpesYuFpuo44Ac+zU8N1yBSk34gSnhfEom+OVWQCLWUMYsyAGRllZ56EAPUVyQYc2DRuaigEl4cWT+r0WB3SqdA6KVIf9ShaLqXrqZnMznAT6cC0khQ+0FTEmGq/dvBaeQsxCnbOlMlBLMVpZcFoJyMXHROw/JJDFZQYaYYFeblel8Bzi30vLnRsjfD5aM+nF50XxkGcdJd67BjN/KojFty+mfWjt3RtNY7SlFCt/8FI8bGDVrY8VwPf1T9Ac8nAyO2AkGiWpioR/st6g7AC/tQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <jgrall@amazon.com>,
        Dario Faggioli <dario.faggioli@suse.com>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: IRQ latency measurements in hypervisor
Thread-Topic: IRQ latency measurements in hypervisor
Thread-Index: AQHW6T1firbO0EOYpEKUiW6vsavsPaonyNIAgAEKgACAAINEgIAH9XMA
Date: Thu, 21 Jan 2021 00:49:23 +0000
Message-ID: <871ref2jxp.fsf@epam.com>
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
 <878s8u43vx.fsf@epam.com>
 <alpine.DEB.2.21.2101151511010.31265@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101151511010.31265@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6b11b25a-6f9f-46f3-8d95-08d8bda6657c
x-ms-traffictypediagnostic: AM0PR03MB3505:
x-microsoft-antispam-prvs: 
 <AM0PR03MB3505C0D870D59D7F4AEA291BE6A10@AM0PR03MB3505.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VTQUY6I+fX0REm1oJAm2ofcampzHj71qRdQjwA67grouKrWWrAT9D1XcNEu2EPH8Jp24ly23b67Pl5Irxlzp4hXUlDN2kN15FBpwBUOvIM3sRLqsaV9JKYJ8Ctn8MZQYUcv30mhc1G89MUfV79ZTxzcB+FBSaqxJx9zQKjq5tb7MnGcFDJvPkGVpQaZcphikGAV3Bv2ydLG5yLTt5QCxHEx81ZnVq7Ih9gZRJ2QZXSWHJ7R3c58VmvuMjiXB7hlJQfviKZjeQc8KAKH+HYrWki1MTDBDMCtqqQtky0E7Cm3D0Mo/is+FvPwnsJYKi66ymYfn/GthFXUaFsz5qqW5xx3Go51IR52Rb0hocb3q5keWL3h5RwNGfUs3h/iME2xN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(86362001)(4326008)(6486002)(36756003)(478600001)(55236004)(316002)(66556008)(76116006)(83380400001)(66476007)(8676002)(8936002)(6506007)(64756008)(5660300002)(6916009)(71200400001)(186003)(6512007)(54906003)(66446008)(26005)(66946007)(2616005)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?n5KL+VcQWuJl8ad9TjNrL+bIUaLp4IFaZVzAuZru0vSvmncYqQQxi7p6uo?=
 =?iso-8859-1?Q?IIU+ufWVnJyYgj0rPPqZsCUnOYARY120yx/GQ4ktFahyAAI0noxKeg4wgO?=
 =?iso-8859-1?Q?7HrdhVPnyfsxZOiPu9Ots6S1kHCeHr1S4GHd8L49nrFoGx2xmLeFG4aSFb?=
 =?iso-8859-1?Q?NmyiJ9QOKDGbnCmGt639CXDY8a3uGtLZeGUbfm87p4ElOYWHKupvgAfrEI?=
 =?iso-8859-1?Q?BEOq3dsqpA0xyoL2hTSLkb0Yw4uJCUjUl8NGNqvAYRE4ZzDr0XSyn5rqWP?=
 =?iso-8859-1?Q?xj4dwbrK++50e88eO07dIdv9zpYr2TXNpvc4J13+iWK7mz92oIuKXUAU7p?=
 =?iso-8859-1?Q?jYi2burxNvtIaO/DxJDSMv/TTdF+bZ4ODEeY7wrsj4bXvGPpyAtYpfrknd?=
 =?iso-8859-1?Q?RixHcOl1TUoWhAIm9Q7L5RtiDx9ZrhiAMFO72Z8iRqIzLuzbJp+XG5r9Uc?=
 =?iso-8859-1?Q?AudzMve/MStIJt7NYBjzzLLZ4U3XNY5tD1d6RiICW6lM0LAvRNrtFWz2Jh?=
 =?iso-8859-1?Q?yBviNHK/vez/UStXVxdh9kXkpLEfFYxH/syQy6yFzpsv0hWp5LzDvGmLx1?=
 =?iso-8859-1?Q?Pb+8pC2zp88uh2f6qlSxr6d3ZR8GZJmAIBqhP9ds/QpWxOluHYVB8whZe9?=
 =?iso-8859-1?Q?cFSP0f+NWdZE0l3psIVUblJO7pIBxlSKI+iRviKjlKDE5NWsMh6c0+6Tvl?=
 =?iso-8859-1?Q?cCfQCZs5gRY3eRjcqKMtyjkXVEpcHvPS4A46wa4CwYT8WodRdArVIAI0zP?=
 =?iso-8859-1?Q?69QjrdadXMfNgVVZVTFExPh+RS8LPz5zXf586baNQF9ZiEaxO3hSIdd37k?=
 =?iso-8859-1?Q?A3NB7IF55GtsK/PCThPbgy0q3n72t6IM1WP4wYZdc25uEfw3Ct5Ol0wLhM?=
 =?iso-8859-1?Q?XkBRrMN/WXPva4YXB8HM+0LR5+Kwaaj8vX6mseS2n6YgzYE5ahnmIY2VsE?=
 =?iso-8859-1?Q?1Novi/wricgVKr+lr7b62p1aeB5dYEvuAJ6Ki4rJQm/iW50W3rAUWpdRsI?=
 =?iso-8859-1?Q?2UaDLJftG6Yh8f2gPjGY4oFRmw8370enRySAsN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b11b25a-6f9f-46f3-8d95-08d8bda6657c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 00:49:23.6908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JdffZA8BOnToVCJsCnJn/8oUsWbyxNkMERjKqp0FDoLk+9lNmHcODGwur5oPM+gxZOxg2wh3wOJB9bAIP+TRiPztFk6rtDuIvd8or1E/fxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3505
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101210001



Stefano Stabellini writes:

> On Fri, 15 Jan 2021, Volodymyr Babchuk wrote:
[...]
>> >> [   83.873162] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8=
 (240 ns)
>> >> [   94.136632] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8=
 (240 ns)
>> >> [  104.400098] rt_eval_tmu e6fc0000.tmu: Mean: 50 (1500 ns) stddev: 1=
29 (3870 ns)
>> >> [  114.663828] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8=
 (240 ns)
>> >> [  124.927296] rt_eval_tmu e6fc0000.tmu: Mean: 56 (1680 ns) stddev: 1=
83 (5490 ns)
>> >>=20
>> >> This is the baremetal Linux. And there is Dom0:
>> >>=20
>> >> [  237.431003] rt_eval_tmu e6fc0000.tmu: Mean: 306 (9180 ns) stddev: =
25 (750 ns)
>> >> [  247.694506] rt_eval_tmu e6fc0000.tmu: Mean: 302 (9060 ns) stddev: =
17 (510 ns)
>> >>=20
>> >> Driver outputs both the raw timer value (eg. 4) and the same value
>> >> scaled to nanoseconds (eg. 1320 ns). As you can see baremetal setup i=
s
>> >> much faster. But experiments showed that Linux does not provide
>> >> consistent values, even when running in baremetal mode. You can see
>> >> sporadic spikes in "std dev" values.
>> >
>> > So baremetal IRQ latency is 1320-1680ns and Linux IRQ latency is
>> > 9060-9180ns. I am not surprised that Linux results are inconsistent bu=
t
>> > I have a couple of observations:
>> >
>> > - 9us is high for Linux
>> > If the system is idle, the latency should be lower, around 2-3us. I
>> > imagine you are actually running some sort of interference from dom0? =
Or
>> > using RTDS and descheduling vCPUs?
>>=20
>> 9us was in idle state. Interestingly enough, I got latency if 3us while
>> Dom0 was doing some CPU-intensive tasks. So, under load latency is lower
>> than in idle state. I didn't investigated this, so I can't tell you what
>> causes this behavior.
>
> Did you use vwfi=3Dnative? You should definitely be able to see ~3us
> without interference and with 1vCPU <-> 1pCPU

With vwfi=3Dnative things in Dom0 got better, but it is still not 3us:

[   41.563904] rt_eval_tmu e6fc0000.tmu: Mean: 173 (5190 ns) stddev: 15 (45=
0 ns) min: 125 (3750 ns) max: 276102 (8283060 ns)
[   51.820403] rt_eval_tmu e6fc0000.tmu: Mean: 172 (5160 ns) stddev: 8 (240=
 ns) min: 125 (3750 ns) max: 276102 (8283060 ns)
[   62.076898] rt_eval_tmu e6fc0000.tmu: Mean: 172 (5160 ns) stddev: 9 (270=
 ns) min: 125 (3750 ns) max: 276102 (8283060 ns)
[   72.333377] rt_eval_tmu e6fc0000.tmu: Mean: 171 (5130 ns) stddev: 9 (270=
 ns) min: 125 (3750 ns) max: 276102 (8283060 ns)
[   82.589852] rt_eval_tmu e6fc0000.tmu: Mean: 172 (5160 ns) stddev: 10 (30=
0 ns) min: 125 (3750 ns) max: 276102 (8283060 ns)

And DomU (as Julien suggested) is extremely unhappy:

Mean: 282 (8460 ns) stddev: 412 (12360 ns) above thr: 4% [109 (3270 ns) - 2=
245 (67350 ns)] global [108 (3240 ns) 74261 (2227830 ns)]
Mean: 958 (28740 ns) stddev: 860 (25800 ns) above thr: 50% [120 (3600 ns) -=
 2253 (67590 ns)] global [108 (3240 ns) 74261 (2227830 ns)]
Mean: 713 (21390 ns) stddev: 533 (15990 ns) above thr: 37% [114 (3420 ns) -=
 2186 (65580 ns)] global [108 (3240 ns) 74261 (2227830 ns)]

>
>> > - the stddev of 3870ns is high for baremetal
>> > In the baremetal case the stddev should be minimal if the system is
>> > idle.
>>=20
>> This is what I expected too. But nevertheless there was spikes. I didn't
>> investigated this as well, so I can only speculate there. My rootfs is
>> on NFS, so maybe network driver caused this spikes.
>
> Yeah, maybe it would be best to reduce the sources of possible spikes
> and get rid of NFS.

I agree there, but I am working remotely, so NFS is easier. I'll try
with eMMC later.

>
>> >
>> >
>> >> So my next step was to use proper RT OS to do the measurements. I
>> >> chose Zephyr. My PR that adds Xen support to Zephyr can be found at
>> >> [1]. Support for RCAR Gen3 is not upstreamed, but is present on my
>> >> GitHub([2]). At [3] you can find the source code for application that
>> >> does the latency measurements. It behaves exactly as my linux driver,
>> >> but provides a bit more information:
>> >>=20
>> >>  *** Booting Zephyr OS build zephyr-v2.4.0-2750-g0f2c858a39fc  ***
>> >> RT Eval app
>> >>=20
>> >> Counter freq is 33280000 Hz. Period is 30 ns
>> >> Set alarm in 0 sec (332800 ticks)
>> >> Mean: 600 (18000 ns) stddev: 3737 (112110 ns) above thr: 0% [265 (795=
0 ns) - 66955 (2008650 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>> >> Mean: 388 (11640 ns) stddev: 2059 (61770 ns) above thr: 0% [266 (7980=
 ns) - 58830 (1764900 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>> >> Mean: 358 (10740 ns) stddev: 1796 (53880 ns) above thr: 0% [265 (7950=
 ns) - 57780 (1733400 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
>>=20
>> This is Zephyr running as DomU.
>>=20
>> >> ...
>> >>=20
>> >> So there you can see: mean time, standard deviation, % of interrupts
>> >> that was processed above 30us threshold, minimum and maximum latency
>> >> values for the current 10s run, global minimum and maximum.
>> >>=20
>> >> Zephyr running as baremetal showed very stable results (this is an
>> >> older build, so no extended statistics there):
>> >>=20
>> >> ## Starting application at 0x480803C0 ...
>> >>  *** Booting Zephyr OS build zephyr-v2.4.0-1137-g5803ee1e8183  ***
>> >> RT Eval app
>> >>=20
>> >> Counter freq is 33280000 Hz. Period is 30 ns
>> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
>> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
>>=20
>> And this is Zephyr is running as baremetal.
>>=20
>> >> ...
>> >>=20
>> >> As Zephyr provided stable readouts with no jitter, I used it to do al=
l
>> >> subsequent measurements.
>> >
>> > I am a bit confused here. Looking at the numbers above the stddev is
>> > 112110 ns in the first instance. That is pretty high. Am I looking at
>> > the wrong numbers?
>>=20
>> I added some clarification above. As for 112110ns in the very first inst=
ance
>> - I always ignored the first instance, assuming that things need to
>> settle after domain being created.
>>=20
>> But your comment is actually correct: what exacelt should "settle"?
>> Domain is already created. All should run smoothly. So, this is worth
>> investigating.
>
> It is fair to ignore the first 2 measurements.
>
> However, the numbers above have high stddev even at the 3rd measurement:
> 53us is high and above the target 30us. I take you didn't apply yet the=20
> alloc_heap_pages and the serial workarounds?

Yes, this is the very first try. Without workarounds and proper
scheduler configuration.

With all fixes it is much better:

Mean: 307 (9210 ns) stddev: 4 (120 ns) above thr: 0% [265 (7950 ns) - 376 (=
11280 ns)] global [265 (7950 ns) 376 (11280 ns)]
Mean: 306 (9180 ns) stddev: 3 (90 ns) above thr: 0% [263 (7890 ns) - 360 (1=
0800 ns)] global [263 (7890 ns) 376 (11280 ns)]
Mean: 306 (9180 ns) stddev: 3 (90 ns) above thr: 0% [298 (8940 ns) - 373 (1=
1190 ns)] global [263 (7890 ns) 376 (11280 ns)]
Mean: 307 (9210 ns) stddev: 17 (510 ns) above thr: 0% [265 (7950 ns) - 856 =
(25680 ns)] global [263 (7890 ns) 1251 (37530 ns)]
Mean: 304 (9120 ns) stddev: 7 (210 ns) above thr: 0% [286 (8580 ns) - 486 (=
14580 ns)] global [263 (7890 ns) 1251 (37530 ns)]
Mean: 307 (9210 ns) stddev: 47 (1410 ns) above thr: 0% [260 (7800 ns) - 129=
9 (38970 ns)] global [260 (7800 ns) 1299 (38970 ns)]
Mean: 291 (8730 ns) stddev: 41 (1230 ns) above thr: 0% [250 (7500 ns) - 132=
4 (39720 ns)] global [250 (7500 ns) 1324 (39720 ns)]

>
>> >> IMPORTANT! All subsequent tests was conducted with only 1 CPU core
>> >> enabled. My goal was to ensure that system can timely react to an
>> >> external interrupt even under load.
>> >
>> > All right. FYI I have no frame of reference for 2 vCPUs on 1 pCPUs, al=
l
>> > my tests were done with 1vCPU <-> 1pCPU and the null scheduler.
>>=20
>> As I said, I had no issues with 1vCPU <-> 1pCPU setup, so I quickly
>> moved to cases which had issues.
>>=20
>> >> Test results and latency sources
>> >>=20
>> >> As you can see, baremetal OS provides latency of ~0.9us without any
>> >> deviations. The same code running as DomU on idle system shows mean
>> >> latency of 12us and deviation of about 10us. Range of latencies in a
>> >> 10s batch can vary from 8us to 25us. This fits into required 30us
>> >> threshold, so no big issue there.
>> >>=20
>> >> But this worsens under certain conditions.
>> >>=20
>> >> 1. Serial console. RCAR serial driver (scif) works in synchronous
>> >>    mode, so any heavy serial console output leads to higher
>> >>    latency. Tests shows mean latency of 1000us and deviation of 1332
>> >>    us. 54% of interrupts are handled outside of 30us period. Real
>> >>    values may be even higher, because in some cases timer would do
>> >>    full cycle and instead of say 11ms ISR would read 11 % 10 =3D 1ms
>> >>    latency. I tried to enable asynchronous mode for the serial
>> >>    console. This made things better, but it lead to gaps in output, s=
o
>> >>    I just turned the serial console off completely.
>> >
>> > That's very interesting. I wonder if other serial drivers would cause
>> > similar issues, e.g. PL011.
>>=20
>> They should. This behavior is programmed in serial.c. Driver can enable
>> async mode calling serial_async_transmit(). As I can see, only ns16550
>> driver does this.
>>=20
>> Maybe you didn't saw problems there because you had more pCPU enabled
>> and Xen used some other pCPU to do UART operations.
>
> Good to know. A workaround would be to let Dom0/DomU have direct access
> to the UART, not giving any UART to Xen at all.

Yes. Or use SSH. I chose the second way.

[...]

--=20
Volodymyr Babchuk at EPAM=

