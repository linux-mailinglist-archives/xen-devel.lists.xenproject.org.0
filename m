Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4687E2FDCCC
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 00:04:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71821.128927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MW9-0005Ni-IN; Wed, 20 Jan 2021 23:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71821.128927; Wed, 20 Jan 2021 23:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2MW9-0005NL-Ez; Wed, 20 Jan 2021 23:04:01 +0000
Received: by outflank-mailman (input) for mailman id 71821;
 Wed, 20 Jan 2021 23:04:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ocL7=GX=epam.com=prvs=1654bdaa26=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1l2MW7-0005NG-VW
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 23:04:00 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31918af5-4c1c-48ec-a7e4-fb6e369e3b76;
 Wed, 20 Jan 2021 23:03:58 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10KN0b8o018868; Wed, 20 Jan 2021 23:03:52 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 by mx0b-0039f301.pphosted.com with ESMTP id 3668rsbwyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 23:03:52 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by VI1PR0302MB2654.eurprd03.prod.outlook.com (2603:10a6:800:e0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 23:03:47 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539%6]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 23:03:47 +0000
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
X-Inumbo-ID: 31918af5-4c1c-48ec-a7e4-fb6e369e3b76
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juhPLn7sIOr7H611gPhpW+XgV4f7w5CvOzm9YyLbEcYITQm+ek3rfKBU3i7em+YuQ6q3Lufz8oKIRcyaU0mFGcB7ZygtzmY0txhw+bPLaSodllTdDgHcOUVaCO2pn9I95peO6qOphz2Hk9/jAH2xzgAAs4IZzyJsqy2aOLq8ZtQi9uU/VdNzfsIuxj4oXhuconeMrG9bhfh1182UA4VJVtevvxyQbaS1LWPmF4sCUI9N9nLc3j2FlGYznv4kHnOEvOBYMq/FL8gpV/2vVZfSgzNje7YemfN8fbTnrtMn0sh3/iJ2p4YUyKxUU+DdqFlar1cBAniy9IOkEn9+UFZp5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T06VIJV3AES2GkKauAFsmWjg1YIqEfZNKSNDpsX7eIA=;
 b=m3G080Ge9khVSv+i9Dqqfh/Twht8kwLOgjFunueR0QcIR+ewuTptROkLuwKr+St/0M6vlJ/pvyxIgtCVZvw+Eg0WKvELIUpj3P9MXouC8HHbmdTKxHi/AJ4rj8jm1dkkCvHs7j/wVHgFsCFEa5IqsedD8NrWne7JGt/VYQLe43ieSmwz8KBxD8IbLIM8x3VX4vCW2XYg9vm9U4uxml3guPcfPVLz/Askc0QqN/WxNhXudNPOkZsI61niDohy2wkb4bEPrLs4bdK/wdiMhlTvOep63Au8gy0soIQice/S/0wOzt3iJPQYHkMUhzYWPQGPtkk6ro1IkdzEuBx/8fzqbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T06VIJV3AES2GkKauAFsmWjg1YIqEfZNKSNDpsX7eIA=;
 b=xYRO4hQEJYeBxOY/mAAn90dSbL3CDmhcxVF7y1HQ2rJGbdpdQAihvmnL9U7e6z8PaV/FWnea/W8vceCb+ib3SNdx+XoisbCgQLtmBpp4lBwZROvlLouQQ8RT5HndpG/wW4yohDaCQaK8Lzrnj0bEoxUUIvvjTY6+fd5F9eIrPKoegUAioOuAO+dlAbsAaPTYHYkxPObXyF2tZ176XHx1nS6+oEAoXX/0UfZB4oEubO5aIO3L3QbBAKtRh+zBuwAvMSj0NAe3gF6nnVUC5nxZk8I4Gn+mDpVNfJm+t/0hKw19vsd00XNGSGHLN7plHO7IYynkgU1ycNs9GaUCIqSfbw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Julien
 Grall <jgrall@amazon.com>,
        Dario Faggioli <dario.faggioli@suse.com>,
        "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: IRQ latency measurements in hypervisor
Thread-Topic: IRQ latency measurements in hypervisor
Thread-Index: AQHW6T1firbO0EOYpEKUiW6vsavsPaonyNIAgADL04CAAEPVAIAAGKmAgAg9ZQA=
Date: Wed, 20 Jan 2021 23:03:47 +0000
Message-ID: <87im7r2otp.fsf@epam.com>
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
 <f31c9cca-0275-eaef-5fcd-c8484d4b5da0@xen.org> <87wnwe2ogp.fsf@epam.com>
 <187995c9-78f4-0a1c-d912-ca5100d07321@xen.org>
In-Reply-To: <187995c9-78f4-0a1c-d912-ca5100d07321@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3c274aa-7838-475d-0f3a-08d8bd97a4c0
x-ms-traffictypediagnostic: VI1PR0302MB2654:
x-microsoft-antispam-prvs: 
 <VI1PR0302MB2654F4AF399CBFE98D519742E6A20@VI1PR0302MB2654.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:287;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TiG+612Ann6hv79iC7rJuZexaySoI41VrUqXE1ONVVEuQordNV6KPy4hZhJLcR31HbB3qD/XQHj1BY5RakrrrFTG/sNsN8O7DjItVe7hiaDM8zi7jW5mJ9WTDIYQPMn0GUSZx3xZy3mJDOTVleS+wya7TGBD2e4YY/GSsgrI5E+nHUBG5r+DJtnR2ZZVimYLy76a9hAFr6qRZvS/7ZkvTVWJ5JqnlAslj6lTCc0WGun56/O7oR7yNBXZX4ma1pqhbPFpBC2X/mJkujaNG/FakoX0tVFYuvPPjnlpTGhQRyxQIUq+RCjyRwjPuHQtWi4twTsiCxumdwZc72GxI8kHWcCl7pwcG2dSoMqhKhfR5XCsJsveKuEqLuvghYaARxM4jVoAYX0NOpVktB3hGhr+oqA9GUwykdmK+M7d6yp424HWTAnwjuRylGlXiK6HhK3XxJQZMjzWJOIWuF1smsPFhyfSZzhnAKD/FYztii3Ch+2pmGNfxkGa2i5EYx37+rG3yk2RClnlTPslp5gn0yybVA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(71200400001)(64756008)(66476007)(83380400001)(55236004)(76116006)(8936002)(5660300002)(66446008)(86362001)(53546011)(6506007)(36756003)(4326008)(66946007)(66556008)(6916009)(6486002)(2616005)(2906002)(26005)(478600001)(54906003)(186003)(8676002)(6512007)(316002)(30864003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?QaJlyn2LADjupEIdPRq7Ok1ard0p7mdtHACgJ9BaIsqOSMC0TXkgYCrw7Z?=
 =?iso-8859-1?Q?/crs0LtVQZgiAIqhQo8oMEY2bQVFnmMJ+UGMbyB8Eklg27C9wfP2qDEC8h?=
 =?iso-8859-1?Q?Lcr3V9UZGyiwU9Xab9l0Jv+PAcGy1L8cWH66SR+7H2wVcJrMCYojdJgdaQ?=
 =?iso-8859-1?Q?6Qc83DxCsPwwBC4cjPPL+OaygmvGLechIZXpF+CyV0OsSwkeNwSK0/+zCy?=
 =?iso-8859-1?Q?s9FdfPqOagkz9Dj02iVO7QXODHh1cVB0xbelvpMCpA4LY5baGXq6FBDCEj?=
 =?iso-8859-1?Q?/i2CPNY+lOsMpacfDuIQXUMD7gEVMUHY4QxBCQFJSEWUqO4TzOFFWJyIuG?=
 =?iso-8859-1?Q?dAoV8pdgt5iXwXistqPkD4fnfgwVlmM/79UdR4F2nzJAD7jX5w0eNUZyru?=
 =?iso-8859-1?Q?vDOI2tXwd8Sl1rYheYd0m1GGJ6NZCu1gLB/mYA6jtZUtsNiSg1dQMQxhAk?=
 =?iso-8859-1?Q?pWtewBJ2/BspOVEPd27XnIzvAFSI4eMzRABwmYqN73bRqbagmJL1VecP+4?=
 =?iso-8859-1?Q?TG4Y5HD84lRAo9x21dJYkHtciwUq3eZT5EPH6zbUHK9Za3zO6KIy8+BWNF?=
 =?iso-8859-1?Q?f2nncODLXIvXaKZjH5m5kuFQkHuAGzMr+6N/IDsD+WnFmqbBgMVMwfFD8r?=
 =?iso-8859-1?Q?+9QHDWsym0OICk93ndgaBj1SPz7GKjCfsmscaJkC/PBlWvNUlCPCGMVZml?=
 =?iso-8859-1?Q?6dDVB0f87pK3CJkfPlMtb7foE05ooo55i+pJL0qfYuzeXCMy8MITrDdwzv?=
 =?iso-8859-1?Q?3dSS8o0dd89YuEN0GP2BV0+OTzMoD7qbUyaotllk6IssGeBtYa3QPjB0OF?=
 =?iso-8859-1?Q?O7uCn86Yg1ZH0BAZhFgB2SXxYMUZRK6aAzAi2zSOR+nTZdayTXatu26rdP?=
 =?iso-8859-1?Q?NBW1gK0NEBQIj22AxQ2S8JHdBFlNN3Ub02YQf7A0+KdASM6ndDQnv3aZxC?=
 =?iso-8859-1?Q?3VTR+pEc0LFRUiZTfjVsy8q8/JfeUS8ryqWugdt1AfZ1Hm2QUYlNPBn/Xt?=
 =?iso-8859-1?Q?osZb7mAAcQT2ZJpzLsZuapiTVuQ/o5FzvlmMbe?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c274aa-7838-475d-0f3a-08d8bd97a4c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2021 23:03:47.3797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkT+ogNdnrPH41BsLVMs9TU3h568oXPPoKyE6fo2I+coxdVhUWtsxzlvIi6UK3ORnJs2iLuyj26rKuYhhoim/+oEsr06BSsMnMfxd/E967I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2654
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200132


Hi Julien,


Julien Grall writes:

> On 15/01/2021 15:45, Volodymyr Babchuk wrote:
>> Hi Julien,
>> Julien Grall writes:
>>=20
>>> Hi Volodymyr, Stefano,
>>>
>>> On 14/01/2021 23:33, Stefano Stabellini wrote:
>>>> + Bertrand, Andrew (see comment on alloc_heap_pages())
>>>
>>> Long running hypercalls are usually considered security issues.
>>>
>>> In this case, only the control domain can issue large memory
>>> allocation (2GB at a time). Guest, would only be able to allocate 2MB
>>> at the time, so from the numbers below, it would only take 1ms max.
>>>
>>> So I think we are fine here. Next time, you find a large loop, please
>>> provide an explanation why they are not security issues (e.g. cannot
>>> be used by guests) or send an email to the Security Team in doubt.
>> Sure. In this case I took into account that only control domain can
>> issue this call, I just didn't stated this explicitly. Next time will
>> do.
>
> I am afraid that's not correct. The guest can request to populate a
> region. This is used for instance in the ballooning case.
>
> The main difference is a non-privileged guest will not be able to do
> allocation larger than 2MB.

I did some measurements. According to them allocation of order 9 takes
about 265us on my HW. I covered this in detail at the end of email.

>>>> This is very interestingi too. Did you get any spikes with the
>>>> period
>>>> set to 100us? It would be fantastic if there were none.
>>>>
>>>>> 3. Huge latency spike during domain creation. I conducted some
>>>>>      additional tests, including use of PV drivers, but this didn't
>>>>>      affected the latency in my "real time" domain. But attempt to
>>>>>      create another domain with relatively large memory size of 2GB l=
ed
>>>>>      to huge spike in latency. Debugging led to this call path:
>>>>>
>>>>>      XENMEM_populate_physmap -> populate_physmap() ->
>>>>>      alloc_domheap_pages() -> alloc_heap_pages()-> huge
>>>>>      "for ( i =3D 0; i < (1 << order); i++ )" loop.
>>>
>>> There are two for loops in alloc_heap_pages() using this syntax. Which
>>> one are your referring to?
>> I did some tracing with Lautrebach. It pointed to the first loop and
>> especially to flush_page_to_ram() call if I remember correctly.
>
> Thanks, I am not entirely surprised because we are clean and
> invalidating the region line by line and across all the CPUs.
>
> If we are assuming 128 bytes cacheline, we will need to issue 32 cache
> instructions per page. This going to involve quite a bit of traffic on=20
> the system.
>
> One possibility would be to defer the cache flush when the domain is
> created and use the hypercall XEN_DOMCTL_cacheflush to issue the
> flush.

Can we flush caches on first access to a page? What I mean - do not
populate stage 2 tables with allocated memory. Flush caches in abort
handler and then populate them.

> Note that XEN_DOMCTL_cacheflush would need some modification to be
> preemptible. But at least, it will work on a GFN which is easier to
> track.
>


>>>>> I managed to overcome the issue #3 by commenting out all calls to
>>>>> populate_one_size() except the populate_one_size(PFN_4K_SHIFT) in
>>>>> xg_dom_arm.c. This lengthened domain construction, but my "RT" domain
>>>>> didn't experienced so big latency issues. Apparently all other
>>>>> hypercalls which are used during domain creation are either fast or
>>>>> preemptible. No doubts that my hack lead to page tables inflation and
>>>>> overall performance drop.
>>>> I think we need to follow this up and fix this. Maybe just by adding
>>>> a hypercall continuation to the loop.
>>>
>>> When I read "hypercall continuation", I read we will return to the
>>> guest context so it can process interrupts and potentially switch to
>>> another task.
>>>
>>> This means that the guest could issue a second populate_physmap() from
>>> the vCPU. Therefore any restart information should be part of the
>>> hypercall parameters. So far, I don't see how this would be possible.
>>>
>>> Even if we overcome that part, this can be easily abuse by a guest as
>>> the memory is not yet accounted to the domain. Imagine a guest that
>>> never request the continuation of the populate_physmap(). So we would
>>> need to block the vCPU until the allocation is finished.
>> Moreover, most of the alloc_heap_pages() sits under spinlock, so
>> first
>> step would be to split this function into smaller atomic parts.
>
> Do you have any suggestion how to split it?
>

Well, it  is quite complex function and I can't tell right away.
At this time I don't quite understand why spin_unlock() is called after
the first (1 << order) loop for instance.

Also, this function does many different things for its simple name.

>>=20
>>> I think the first step is we need to figure out which part of the
>>> allocation is slow (see my question above). From there, we can figure
>>> out if there is a way to reduce the impact.
>> I'll do more tracing and will return with more accurate numbers.=20
>> But as far as I can see, any loop on 262144 pages will take some time..
> .
>
> It really depends on the content of the loop. On any modern
> processors, you are very likely not going to notice a loop that update
> just a flag.
>
> However, you are likely going to be see an impact if your loop is
> going to clean & invalidate the cache for each page.
>

Totally agree. I used Xen tracing subsystem to do the measurements and I
can confirm that call to flush_page_to_ram() causes most of the impact.


There is the details:


I added number of tracing points to the function:

static struct page_info *alloc_heap_pages(
    unsigned int zone_lo, unsigned int zone_hi,
    unsigned int order, unsigned int memflags,
    struct domain *d)
{
    nodeid_t node;
    unsigned int i, buddy_order, zone, first_dirty;
    unsigned long request =3D 1UL << order;
    struct page_info *pg;
    bool need_tlbflush =3D false;
    uint32_t tlbflush_timestamp =3D 0;
    unsigned int dirty_cnt =3D 0;

    /* Make sure there are enough bits in memflags for nodeID. */
    BUILD_BUG_ON((_MEMF_bits - _MEMF_node) < (8 * sizeof(nodeid_t)));

    ASSERT(zone_lo <=3D zone_hi);
    ASSERT(zone_hi < NR_ZONES);

    if ( unlikely(order > MAX_ORDER) )
        return NULL;

    spin_lock(&heap_lock);

    TRACE_1D(TRC_PGALLOC_PT1, order); // <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    /*
     * Claimed memory is considered unavailable unless the request
     * is made by a domain with sufficient unclaimed pages.
     */
    if ( (outstanding_claims + request > total_avail_pages) &&
          ((memflags & MEMF_no_refcount) ||
           !d || d->outstanding_pages < request) )
    {
        spin_unlock(&heap_lock);
        return NULL;
    }

    pg =3D get_free_buddy(zone_lo, zone_hi, order, memflags, d);
    /* Try getting a dirty buddy if we couldn't get a clean one. */
    if ( !pg && !(memflags & MEMF_no_scrub) )
        pg =3D get_free_buddy(zone_lo, zone_hi, order,
                            memflags | MEMF_no_scrub, d);
    if ( !pg )
    {
        /* No suitable memory blocks. Fail the request. */
        spin_unlock(&heap_lock);
        return NULL;
    }

    TRACE_0D(TRC_PGALLOC_PT2); // <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    node =3D phys_to_nid(page_to_maddr(pg));
    zone =3D page_to_zone(pg);
    buddy_order =3D PFN_ORDER(pg);

    first_dirty =3D pg->u.free.first_dirty;

    /* We may have to halve the chunk a number of times. */
    while ( buddy_order !=3D order )
    {
        buddy_order--;
        page_list_add_scrub(pg, node, zone, buddy_order,
                            (1U << buddy_order) > first_dirty ?
                            first_dirty : INVALID_DIRTY_IDX);
        pg +=3D 1U << buddy_order;

        if ( first_dirty !=3D INVALID_DIRTY_IDX )
        {
            /* Adjust first_dirty */
            if ( first_dirty >=3D 1U << buddy_order )
                first_dirty -=3D 1U << buddy_order;
            else
                first_dirty =3D 0; /* We've moved past original first_dirty=
 */
        }
    }

    TRACE_0D(TRC_PGALLOC_PT3); // <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    ASSERT(avail[node][zone] >=3D request);
    avail[node][zone] -=3D request;
    total_avail_pages -=3D request;
    ASSERT(total_avail_pages >=3D 0);

    check_low_mem_virq();

    if ( d !=3D NULL )
        d->last_alloc_node =3D node;

    for ( i =3D 0; i < (1 << order); i++ )
    {
        /* Reference count must continuously be zero for free pages. */
        if ( (pg[i].count_info & ~PGC_need_scrub) !=3D PGC_state_free )
        {
            printk(XENLOG_ERR
                   "pg[%u] MFN %"PRI_mfn" c=3D%#lx o=3D%u v=3D%#lx t=3D%#x\=
n",
                   i, mfn_x(page_to_mfn(pg + i)),
                   pg[i].count_info, pg[i].v.free.order,
                   pg[i].u.free.val, pg[i].tlbflush_timestamp);
            BUG();
        }

        /* PGC_need_scrub can only be set if first_dirty is valid */
        ASSERT(first_dirty !=3D INVALID_DIRTY_IDX || !(pg[i].count_info & P=
GC_need_scrub));

        /* Preserve PGC_need_scrub so we can check it after lock is dropped=
. */
        pg[i].count_info =3D PGC_state_inuse | (pg[i].count_info & PGC_need=
_scrub);

        if ( !(memflags & MEMF_no_tlbflush) )
            accumulate_tlbflush(&need_tlbflush, &pg[i],
                                &tlbflush_timestamp);

        /* Initialise fields which have other uses for free pages. */
        pg[i].u.inuse.type_info =3D 0;
        page_set_owner(&pg[i], NULL);

        /* Ensure cache and RAM are consistent for platforms where the
         * guest can control its own visibility of/through the cache.
         */
        flush_page_to_ram(mfn_x(page_to_mfn(&pg[i])),
                          !(memflags & MEMF_no_icache_flush));
    }

    TRACE_0D(TRC_PGALLOC_PT4); // <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    spin_unlock(&heap_lock);

    if ( first_dirty !=3D INVALID_DIRTY_IDX ||
         (scrub_debug && !(memflags & MEMF_no_scrub)) )
    {
        for ( i =3D 0; i < (1U << order); i++ )
        {
            if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
            {
                if ( !(memflags & MEMF_no_scrub) )
                    scrub_one_page(&pg[i]);

                dirty_cnt++;

                spin_lock(&heap_lock);
                pg[i].count_info &=3D ~PGC_need_scrub;
                spin_unlock(&heap_lock);
            }
            else if ( !(memflags & MEMF_no_scrub) )
                check_one_page(&pg[i]);
        }

        if ( dirty_cnt )
        {
            spin_lock(&heap_lock);
            node_need_scrub[node] -=3D dirty_cnt;
            spin_unlock(&heap_lock);
        }
    }

    TRACE_0D(TRC_PGALLOC_PT5); // <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    if ( need_tlbflush )
        filtered_flush_tlb_mask(tlbflush_timestamp);

    TRACE_0D(TRC_PGALLOC_PT6); // <=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    return pg;
}


And wrote a simple Python scripts that parses the output of
xentrace. There are results for different orders:

  46.842032: page_alloc trace point 1. Order: 18
  46.842035: page_alloc trace point 2 (+   0.000003)
  46.842035: page_alloc trace point 3 (+   0.000000)
  46.975105: page_alloc trace point 4 (+   0.133069)
  46.975106: page_alloc trace point 5 (+   0.000001)
  46.975106: page_alloc trace point 6 (+   0.000000): total:    0.133074

  46.998536: page_alloc trace point 1. Order: 9
  46.998538: page_alloc trace point 2 (+   0.000002)
  46.998540: page_alloc trace point 3 (+   0.000001)
  46.998799: page_alloc trace point 4 (+   0.000259)
  46.998800: page_alloc trace point 5 (+   0.000000)
  46.998800: page_alloc trace point 6 (+   0.000000): total:    0.000264

  46.835802: page_alloc trace point 1. Order: 3
  46.835803: page_alloc trace point 2 (+   0.000000)
  46.835803: page_alloc trace point 3 (+   0.000000)
  46.835812: page_alloc trace point 4 (+   0.000009)
  46.835813: page_alloc trace point 5 (+   0.000000)
  46.835813: page_alloc trace point 6 (+   0.000001): total:    0.000011

  46.998815: page_alloc trace point 1. Order: 0
  46.998816: page_alloc trace point 2 (+   0.000002)
  46.998817: page_alloc trace point 3 (+   0.000000)
  46.998818: page_alloc trace point 4 (+   0.000002)
  46.998819: page_alloc trace point 5 (+   0.000001)
  46.998819: page_alloc trace point 6 (+   0.000000): total:    0.000005

Then I commented out call to flush_page_to_ram() and got the following
results:

 149.561902: page_alloc trace point 1. Order: 18
 149.561905: page_alloc trace point 2 (+   0.000003)
 149.561905: page_alloc trace point 3 (+   0.000000)
 149.569450: page_alloc trace point 4 (+   0.007545)
 149.569451: page_alloc trace point 5 (+   0.000001)
 149.569452: page_alloc trace point 6 (+   0.000000): total:    0.007550

 149.592624: page_alloc trace point 1. Order: 9
 149.592626: page_alloc trace point 2 (+   0.000003)
 149.592627: page_alloc trace point 3 (+   0.000001)
 149.592639: page_alloc trace point 4 (+   0.000012)
 149.592639: page_alloc trace point 5 (+   0.000000)
 149.592640: page_alloc trace point 6 (+   0.000000): total:    0.000016

All time units are seconds, by the way.


--=20
Volodymyr Babchuk at EPAM=

