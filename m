Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D932FDCD0
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 00:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71825.128941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2McA-0006PQ-A2; Wed, 20 Jan 2021 23:10:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71825.128941; Wed, 20 Jan 2021 23:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2McA-0006P1-69; Wed, 20 Jan 2021 23:10:14 +0000
Received: by outflank-mailman (input) for mailman id 71825;
 Wed, 20 Jan 2021 23:10:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ocL7=GX=epam.com=prvs=1654bdaa26=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1l2Mc8-0006Ow-BA
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 23:10:12 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33dece22-c8c6-4521-9cf0-08419026dbe4;
 Wed, 20 Jan 2021 23:10:11 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10KN5OQP003794; Wed, 20 Jan 2021 23:10:05 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58])
 by mx0a-0039f301.pphosted.com with ESMTP id 3668s5un6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 23:10:05 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB6098.eurprd03.prod.outlook.com (2603:10a6:208:15a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Wed, 20 Jan
 2021 23:09:59 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539%6]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 23:09:59 +0000
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
X-Inumbo-ID: 33dece22-c8c6-4521-9cf0-08419026dbe4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UH2rRmHUMoegIiPhDLDY0S9IGd7hQ30eJV+aQNfTDZbE+zIEnQCxpHbCQBRJYgI43ddQ3gyeZEejRzZhepcIBuT1JLR7qkvRR6m8hf7MSmuK8pa8qggodU7VG70jlqB9wVT4qLUl8FTP/Qzq5uUKmbQuXZIA3uAPR38dirEli9T4z/FFtoNhVXCFS5V/50KzBd4SI0d2GT5fpK66JtOA5FIgQAlLC1+sYFi45H1IEIsk4OoRGiWx6Pok7DQGX36DoouC8AvNgAopUnYKlrbHkTg4JFdoWhUQ4FW+XxAiYKOAm+3+EGb46XxVRRklKu3GNN5mGotbWCyDZHZOSVl21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1sg3UV31m6pFl+JPEOwXtEudYjZPqFvMK1hPftKD7Y=;
 b=dV6aypojcTE6RA6+Ycb7ZzNFokWC0NVBNxh627HPAyfJTis8pe+2ErMS/j3YP8iRih6uo6WuofE1plf0YlHJyUu1hCGUe+8ZzQp+sNIbqc6oAp6kiZTGXnoLKsWPA/eH4Wz4eV5rGwuI3YhSbePsHmLbuQug0vAr7gdCA3Jy5IYCywAvVYGcfAUZrfAfwFBDJBTAAuMs1a7/IeL28WdfO+OB6lVoxn5VXaquHQu8XRwze4+jzdA0qipLOax63c2EXvUveDCHA9whTS+Str0S+TgR/HBHrtus21ng0+ihZ/HFfHNLphsn+LGZ7DXdGVhJE13qfcVaM6PnLoG2KsaD9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1sg3UV31m6pFl+JPEOwXtEudYjZPqFvMK1hPftKD7Y=;
 b=4Xp6OeOtoP469oCil+6nkNsyuImhVS1qpzPP5ohWcHVPXVs8bvH58DdQQ058Vn3ijr5kL9s5QNOQL+iP8JAwz3tlL6SP/R1nEo6xENnAfapaoajTqYK+sUYnSMXA7VX8IK+8SWwf4OlDBUR7//o6WOmlKtYlgP8dr5V8f1TBhB0LHWyd1bhXIx5rkTexsyIAjMDyG4GotvcX97NXQI8tY6l2m48zSXtFxUZKxJS+9tEUJf4iwdUnDJBfzaRSTCfyhkwkdjsBEKPzXK1DiJpi9Qak2rHhfJoRMUWvRNaVSlHtKJ1Dtp6L1XILAdU/s1Fa7aNWDx5r1WsCbdD5cV+aHQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<stefano.stabellini@xilinx.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Julien Grall <jgrall@amazon.com>,
        Dario
 Faggioli <dario.faggioli@suse.com>,
        "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>
Subject: Re: IRQ latency measurements in hypervisor
Thread-Topic: IRQ latency measurements in hypervisor
Thread-Index: 
 AQHW6T1firbO0EOYpEKUiW6vsavsPaonyNIAgADL04CAAEPVAIAAGKmAgABsaQCAB9K4gA==
Date: Wed, 20 Jan 2021 23:09:59 +0000
Message-ID: <87czxz2ojc.fsf@epam.com>
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
 <f31c9cca-0275-eaef-5fcd-c8484d4b5da0@xen.org> <87wnwe2ogp.fsf@epam.com>
 <187995c9-78f4-0a1c-d912-ca5100d07321@xen.org>
 <alpine.DEB.2.21.2101151459280.31265@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101151459280.31265@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c291abf9-37d8-4ab0-f98d-08d8bd9882c4
x-ms-traffictypediagnostic: AM0PR03MB6098:
x-microsoft-antispam-prvs: 
 <AM0PR03MB6098B6A3C7E6D8840C85B58DE6A20@AM0PR03MB6098.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 IZkxv9Lgy3rTHutoS61w0bwn8TEUfBjflybEfTjdN2+tUZKSt4LstPKYU64i3B+y0Wf40qxs80B7OPni+JSr7jKu1n7csp//0eKU/8YEO8pZE5NhFfXjf1dcBd4Y1+6Yemaq4mp3/tta43aKBtMJIkkRFy8eYsUokdJmVpx0x/Xq5jDHANxMy22lxXYYNvea8GXwiW+tWYJBDNXlpahPEH4oyB9uJFUfhuaU1a0+yFi6RzHuUsm9Z+bufrCuctSnpqg0LerXTNCS7gN9pSHJwmv+Zm28AjPDrZafxCZEw4zlB7L7XvPzXttpTH5KWo+VjpS9/EwYKWu1+WazTrL7zvAt8towJIktF5r0qABly/DqSooqok/DRm3jQBixIE62sBSPmEvwFVBFMuUNiBGZaA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(71200400001)(316002)(186003)(2906002)(8676002)(6916009)(2616005)(54906003)(6486002)(478600001)(8936002)(6506007)(5660300002)(83380400001)(26005)(53546011)(6512007)(66556008)(66946007)(66476007)(36756003)(55236004)(76116006)(64756008)(66446008)(86362001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?dE91oUDY+xxpC/YXkaN2E8BMuKR+wdJmjZavY2pgaLuFkH7ngGzK0Lxkrf?=
 =?iso-8859-1?Q?u6ZSLOzaWEGUhZVj0eFaCwII51ndKdMl3cURrg7EtMT+L+PAWE5sFoq3Po?=
 =?iso-8859-1?Q?xPLVVqMl8+qWCelDu5WmpDyj9LCwFc2DWBV7aV8gCvV/AroUREOY0nZA+j?=
 =?iso-8859-1?Q?dUsNy+sW8A0AQC9CA/+FlhzKFL/HR2GME0xeGUfMMlg5rnZoPKOyIpxTyi?=
 =?iso-8859-1?Q?PqEes+VuA308IUurItdGKwWHXrJ71QE2rBUSf8KP3lT85W/2JNYe5u3kZ/?=
 =?iso-8859-1?Q?BOaXtdnW7tn9oJfagQbZdbaT3cbAgviuT0RS1+P9A8XG0A8srCLqfLBIaA?=
 =?iso-8859-1?Q?DDXITCMcGPS2jPWtvGBMJdowmkri9EWCeWN1zDH7ITPDnT2aIhd/ZJTjOx?=
 =?iso-8859-1?Q?LnXzgHkpUAhBwS9OhLs5SDbx623C6sF/ugffO+3U0zZBgalfW1AQCgkCam?=
 =?iso-8859-1?Q?fZDQ6fW/GUB8b3UHQQynmVV7LLS70VfdnQi654YXgGGt47utTL+LQFrb9n?=
 =?iso-8859-1?Q?izm3x/xBIY1HU5hlnsnofXjXl5q3YyHryz8ke/9arLmQdh7MzcXZeYBLyE?=
 =?iso-8859-1?Q?oaPmutF9IyybDZTGFPIfw0eHwvvl7wzo8+ymQgjHWVkquAsXuTZQFZju5x?=
 =?iso-8859-1?Q?ymUQIfDgqfQiql8hYvYZt2tZV+6dz+TNFANIiUmF9XSbbwrZQBN2i+EYdB?=
 =?iso-8859-1?Q?vzyDfcUNVmUQ5DrIpdAdhk+k5qmLuPBB43Ae8H4ZvWQ8oZeQXZPCMX8kde?=
 =?iso-8859-1?Q?1mouMbW1HafhVMO7XlVU7AB5lHhT5viE9vYnwtCn/mjG43TLKDkUi4IVDR?=
 =?iso-8859-1?Q?ptH1gECaPPfS/MoK7Bl8flQharACKz6MJNMODACFcFyN/4+Qql7aCIa7qz?=
 =?iso-8859-1?Q?FB1NtWTpfqj+n6emA72wriX+OKsQ3LnbV94sCfSc+DpIoMsaeLTWyM0UUT?=
 =?iso-8859-1?Q?vpPAAh6BprMcBquTa9PFvdB3VgQfQ5PNKLDpjoEIDecl+uiLWoj7/uyRGO?=
 =?iso-8859-1?Q?9Qx/6wvnYfLcONYwAWMT+tmKiQQ2NcUd+1vxjy?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c291abf9-37d8-4ab0-f98d-08d8bd9882c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 23:09:59.8651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3NdFtkLW8k33hf5O56AChIPn9riVSdQo9kbrdofU1x1ct28GJ8kd2mraKMxhYANCJPxNg/QWpD5bykQKzIP0wwwolgBKMFnMg1mp5Yu/wNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6098
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200133


Hi Stefano,

Stefano Stabellini writes:

> On Fri, 15 Jan 2021, Julien Grall wrote:
>> On 15/01/2021 15:45, Volodymyr Babchuk wrote:
>> >=20
>> > Hi Julien,
>> >=20
>> > Julien Grall writes:
>> >=20
>> > > Hi Volodymyr, Stefano,
>> > >=20
>> > > On 14/01/2021 23:33, Stefano Stabellini wrote:
>> > > > + Bertrand, Andrew (see comment on alloc_heap_pages())
>> > >=20
>> > > Long running hypercalls are usually considered security issues.
>> > >=20
>> > > In this case, only the control domain can issue large memory
>> > > allocation (2GB at a time). Guest, would only be able to allocate 2M=
B
>> > > at the time, so from the numbers below, it would only take 1ms max.
>> > >=20
>> > > So I think we are fine here. Next time, you find a large loop, pleas=
e
>> > > provide an explanation why they are not security issues (e.g. cannot
>> > > be used by guests) or send an email to the Security Team in doubt.
>> >=20
>> > Sure. In this case I took into account that only control domain can
>> > issue this call, I just didn't stated this explicitly. Next time will
>> > do.
>>=20
>> I am afraid that's not correct. The guest can request to populate a regi=
on.
>> This is used for instance in the ballooning case.
>>=20
>> The main difference is a non-privileged guest will not be able to do
>> allocation larger than 2MB.
>>=20
>> [...]
>>=20
>> > > > This is very interestingi too. Did you get any spikes with the
>> > > > period
>> > > > set to 100us? It would be fantastic if there were none.
>> > > >=20
>> > > > > 3. Huge latency spike during domain creation. I conducted some
>> > > > >      additional tests, including use of PV drivers, but this did=
n't
>> > > > >      affected the latency in my "real time" domain. But attempt =
to
>> > > > >      create another domain with relatively large memory size of =
2GB
>> > > > > led
>> > > > >      to huge spike in latency. Debugging led to this call path:
>> > > > >=20
>> > > > >      XENMEM_populate_physmap -> populate_physmap() ->
>> > > > >      alloc_domheap_pages() -> alloc_heap_pages()-> huge
>> > > > >      "for ( i =3D 0; i < (1 << order); i++ )" loop.
>> > >=20
>> > > There are two for loops in alloc_heap_pages() using this syntax. Whi=
ch
>> > > one are your referring to?
>> >=20
>> > I did some tracing with Lautrebach. It pointed to the first loop and
>> > especially to flush_page_to_ram() call if I remember correctly.
>>=20
>> Thanks, I am not entirely surprised because we are clean and invalidatin=
g the
>> region line by line and across all the CPUs.
>>=20
>> If we are assuming 128 bytes cacheline, we will need to issue 32 cache
>> instructions per page. This going to involve quite a bit of traffic on t=
he
>> system.
>
> I think Julien is most likely right. It would be good to verify this
> with an experiment. For instance, you could remove the
> flush_page_to_ram() call for one test and see if you see any latency
> problems.

Yes, I did exactly this and shared results in my reply to Julien.


>> One possibility would be to defer the cache flush when the domain is cre=
ated
>> and use the hypercall XEN_DOMCTL_cacheflush to issue the flush.
>>=20
>> Note that XEN_DOMCTL_cacheflush would need some modification to be
>> preemptible. But at least, it will work on a GFN which is easier to trac=
k.
> =20
> This looks like a solid suggestion. XEN_DOMCTL_cacheflush is already
> used by the toolstack in a few places.=20
>
> I am also wondering if we can get away with fewer flush_page_to_ram()
> calls from alloc_heap_pages() for memory allocations done at boot time
> soon after global boot memory scrubbing.

This is doable, if you are trying to optimize boot time. On the other
hand, this is the extra check in already quite complex function.

BTW, I briefly looked at Xen boot time and saw that Dom0 construction takes
ample amount of time.

--=20
Volodymyr Babchuk at EPAM=

