Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E71C2F7FEF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 16:46:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68383.122444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0RIP-000525-Sy; Fri, 15 Jan 2021 15:45:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68383.122444; Fri, 15 Jan 2021 15:45:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0RIP-00051g-OD; Fri, 15 Jan 2021 15:45:53 +0000
Received: by outflank-mailman (input) for mailman id 68383;
 Fri, 15 Jan 2021 15:45:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cER4=GS=epam.com=prvs=164981b71a=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1l0RIN-00051Z-MZ
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 15:45:51 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af901554-f1b5-4b6f-ae6a-b36c77586147;
 Fri, 15 Jan 2021 15:45:51 +0000 (UTC)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10FFaBqn022309; Fri, 15 Jan 2021 15:45:46 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56])
 by mx0b-0039f301.pphosted.com with ESMTP id 362w6tjgdr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 15:45:45 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com (2603:10a6:208:4f::23)
 by AM0PR03MB3921.eurprd03.prod.outlook.com (2603:10a6:208:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 15:45:43 +0000
Received: from AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539]) by AM0PR03MB3508.eurprd03.prod.outlook.com
 ([fe80::2dc5:6ffb:56c8:f539%6]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 15:45:43 +0000
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
X-Inumbo-ID: af901554-f1b5-4b6f-ae6a-b36c77586147
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cn1Pj4xT27jbevD2L/loq1brcr2AT7cRMGMw6x8USM/EhTilNBwUpUYAUae6va8obtqqV0bXqUx1RkIdxqNKER5qk0Q4LeSPGa7UgmnV5LZELUfORxL3bsvAD/SA9GQ6j5xrmQ2ddfZjKLqqpzqeUDR0qlWxphNNPWGQWQlSadAYH+XeGlA3U34e15sOvsWnmE2ePhB5oZUQbLGc0ZlO3wiN/sG0Ki/78jwoxljq/5s04VKZ8gA+y/UKtNoqb5FtD/JWc99ohnck6K+5krA+Opjt6xbW0WdkbSGhj0bRuUabscttxfxzIxE1uaE/kIqhr6fzCmHGj8Z6+bQxYA65Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/wcs8q9dAsXPmgFnOjP7mzcJbvBdzEFD9zJ37YOJbM=;
 b=Fu6r7GluAdf6gk6dW9JRS6tuAcQVu/phrQGJlLslx1jO4tUUtCMXLQxh6guqgLcRKSgUEAdnZnedoLIxHAj9U83xenLT24b7SrLTUxki+7AuLGrInTW86yX8xFty8wpTui6T7LCoki3uYBvvlM7mYlypiTSfdBuCZRV1fv1CVgta7aq8jtCPTxYMJNkekijpgYH2/2R+ZNIF4fWOnvmM8pN4WV9rhFcCZ9z3uhCZCRTGJ/tTAmElXn/SAOrFsYx9y8S9OZ22yEuQEgQdOwC15wNptCAq2hE9yQM8ENm+RWVzdR+sJWjLG4120jFuR5hePKw9R6ajw7gBZYFSOj5gIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/wcs8q9dAsXPmgFnOjP7mzcJbvBdzEFD9zJ37YOJbM=;
 b=3AFoo92nHid8DtGJQB1Z2Nc3bU8gbkcmqMT/uJ+PMVFb4guP/zMc5yI4SEk8ELkw3HA1kyBD6oY83m0N3cwO1I+t8CeIVidicy3+IxyC6/NFsI7SKvaPkd1D+dNzqyHmqJPOJ/zfWznEWkwv5rHLyEn7LIpsJdYv9l+o62ESKVmxVSmDupbVkIPJld6aOFQFhuIyLVohfEA5LXBxadceue4CrZDGO1S3oAWRHfe5kdfrPZ88mHsw8pe+qtpPTt6XW0RaPjOwfLp3Ct9+hDEehZhkNY+v+02PtwELZ9i+aFmFWXB3hjUPZKEQylUs6hkf/nos5dW/HsM3qGDR4VLZCw==
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
Thread-Index: AQHW6T1firbO0EOYpEKUiW6vsavsPaonyNIAgADL04CAAEPVAA==
Date: Fri, 15 Jan 2021 15:45:43 +0000
Message-ID: <87wnwe2ogp.fsf@epam.com>
References: <87pn294szv.fsf@epam.com>
 <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s>
 <f31c9cca-0275-eaef-5fcd-c8484d4b5da0@xen.org>
In-Reply-To: <f31c9cca-0275-eaef-5fcd-c8484d4b5da0@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31b6f47a-bccf-492a-044e-08d8b96c9e18
x-ms-traffictypediagnostic: AM0PR03MB3921:
x-microsoft-antispam-prvs: 
 <AM0PR03MB3921F3B6D1C73767A123D292E6A70@AM0PR03MB3921.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bS+3tCGOcD/nmC061G+n/lxoAi+wX5gT9hts9Hkas1qzFF1t8rfeBV/724+UF9gugUESFdTGF8DNGZF5+xFZItZcNqLXyp/kNOjpYYTIrbKdi4fLU+q87NRLsicLt/x/G+tnSxoconk6zm4CHYVl+Lx1/SI7Uw0Sr6mklbqwgcyeC8LfcIg7Fu30bgA+tXiH1AjreOP+BEOn8lcbjIT0Ow4ryBZvMC6c1LmMh8gH4b0Tu0ESn1ghVPTGCrDw57k5E5F8i55eE3I6Np3MPrNhrFtdsftcL78e/omLTU2i2we2MeCECVh7YTw57lzZKDcUfLOfZXuUFJwo9SPTYjC7IE5zdaVSQEjsbyCIK3s8waZfhSMBrXpRp+CnG+6TUNRSY0xZojsMbxS4yGQO9ZIVeg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3508.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(6486002)(2616005)(86362001)(6916009)(8936002)(5660300002)(83380400001)(66446008)(6512007)(71200400001)(4326008)(66946007)(478600001)(53546011)(6506007)(36756003)(66476007)(186003)(54906003)(8676002)(2906002)(66556008)(316002)(26005)(76116006)(64756008)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?iso-8859-1?Q?gkcmY+pVAWpdQWvcj47aUygknkPVOQTVZX2/Fqt4ERpqYlf/VR+17q7zAN?=
 =?iso-8859-1?Q?lClZWzjodNQqAC8iEHYkKD+8IkMkLP7FAMMcPfGfIxdXf/BNj6V+r7/9+Y?=
 =?iso-8859-1?Q?ka51pBBnMORamiYXngeiwxTAJD8O+GYq4YqXc6Es+3O+npjpCggp0lLmS1?=
 =?iso-8859-1?Q?7DdwNuVbdByr+kTUxpLFCsnZfkYCP8rdmGj8PEE4KGVN/0DP6Odt3/7caG?=
 =?iso-8859-1?Q?M0hRlJuIt6uydnhNOiaVFq/xKDgAmfpLACyTue8+GgIE8spir92oRsejeR?=
 =?iso-8859-1?Q?UScaxe+lrsLhMt8c+h5+TKiX1cyWX4UcrtMEZ4yr54Zah/UAVE1tkIw2Ey?=
 =?iso-8859-1?Q?RVDydYr5gOBBxRKlHunQoVzPALKvV1dqGNpjCQWvnILoXexTz9P3NeKA4N?=
 =?iso-8859-1?Q?BSZVcvTZbVTZOS7GGuXgnDVDDnTxfdvjFfWa80pBcJBl/zLR/Tk28XgDDI?=
 =?iso-8859-1?Q?G0QUBfTaa8WVwW/vWX9O9xVb27WIf71P0F5yUTkJeLkHvVUZx2QAwGyqm5?=
 =?iso-8859-1?Q?JFCXwabV7QzUrJe1y0qYWvYtX8SOUP1lW9Bmz1NlNnVxnUJfqBh5m7iucU?=
 =?iso-8859-1?Q?4Fp68GAnLkqJemHWJmL+Ek4j3dazkzf+zCFdqu+vqj4UbBLcLUyc0R7AJO?=
 =?iso-8859-1?Q?LG16k580GBII9k+m0XgDhJ32exlhbYw1wpVr5xLiAeA6Q9Msn0YqwBiNL+?=
 =?iso-8859-1?Q?dYTeg6RKaZcAxNvpxtu1PbWrMuVkQrvpqiGQTvIzZtnLd1jCDymkEZYBso?=
 =?iso-8859-1?Q?ugtkL62gw1IoTRBrlqqBpi6FyNVagTxPJhj7VEMn79Mvrzkx1P/4elMEQi?=
 =?iso-8859-1?Q?7r9scbVxeLV0BplFWSDFzrJAPIIGKBpulhwMGiHDXLjYS2F5BbOZsdC+4y?=
 =?iso-8859-1?Q?yId/bOKbUMqu3wfBQAP/Fqv2jawpJm1U7jkqFZkxzxJxUrVmvk+DJpvMUB?=
 =?iso-8859-1?Q?Lt4mKBy9oKAK4m9Ovg3Kc3J6UR9P0YBCaFXHyaoPGxOLbVAPIZIzzd5tIF?=
 =?iso-8859-1?Q?sqbxD67cbL/UDA0+WLIMVd4YRUr83t8KzICv3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3508.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b6f47a-bccf-492a-044e-08d8b96c9e18
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 15:45:43.1836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kQY9NcI8JkxKuGoFxcNQ8XdPHuTa1iyMXQk8rerhckHcLYSpejvBmlZpX8wBxEy3pkGuH0lsX/ZOlTKKQlVW7JfoDWiDoNp8AdXngvL+ro4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3921
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101150098


Hi Julien,

Julien Grall writes:

> Hi Volodymyr, Stefano,
>
> On 14/01/2021 23:33, Stefano Stabellini wrote:
>> + Bertrand, Andrew (see comment on alloc_heap_pages())
>
> Long running hypercalls are usually considered security issues.
>
> In this case, only the control domain can issue large memory
> allocation (2GB at a time). Guest, would only be able to allocate 2MB
> at the time, so from the numbers below, it would only take 1ms max.
>
> So I think we are fine here. Next time, you find a large loop, please
> provide an explanation why they are not security issues (e.g. cannot
> be used by guests) or send an email to the Security Team in doubt.

Sure. In this case I took into account that only control domain can
issue this call, I just didn't stated this explicitly. Next time will
do.

>>> ARMv8 platform. Namely Renesas Rcar H3 SoC on Salvator board.
>
> Which core is it?

Cortex A57

[...]

>> 2. RTDS scheduler. With console disabled, things like "hexdump -v
>>>     /dev/zero" didn't affected the latency so badly, but anyways,
>>>     sometimes I got ~600us spikes. This is not a surprise, because of
>>>     default RTDS configuration. I changed period for DomU from default
>>>     10ms to 100us and things got better: with Dom0 burning CPU I am
>>>     rarely getting max latency of about ~30us with mean latency of ~9us
>>>     and deviation of ~0.5us. On other hand, when I tried to set period
>>>     to 30us, max latency rose up to ~60us.
> In a related topic, I am not entirely sure that all the hypercalls
> would be able to fit in the 100us slice. In particular, the one which
> are touching the P2M and do memory allocation.

I agree with you. In my experiments I didn't found a case with long
running hypercall (apart from mentioned populate_physmap), but of course
there should be cases with such calls.

>
>> This is very interestingi too. Did you get any spikes with the
>> period
>> set to 100us? It would be fantastic if there were none.
>>=20
>>> 3. Huge latency spike during domain creation. I conducted some
>>>     additional tests, including use of PV drivers, but this didn't
>>>     affected the latency in my "real time" domain. But attempt to
>>>     create another domain with relatively large memory size of 2GB led
>>>     to huge spike in latency. Debugging led to this call path:
>>>
>>>     XENMEM_populate_physmap -> populate_physmap() ->
>>>     alloc_domheap_pages() -> alloc_heap_pages()-> huge
>>>     "for ( i =3D 0; i < (1 << order); i++ )" loop.
>
> There are two for loops in alloc_heap_pages() using this syntax. Which
> one are your referring to?

I did some tracing with Lautrebach. It pointed to the first loop and
especially to flush_page_to_ram() call if I remember correctly.

>>>
>>>     This loops handles struct page* for every one of 262144 pages that
>>>     was allocated by calling populate_physmap().
>
> Looking at the domain creation code, 2GB will be split in two extents
> of 1GB. This means, there will be at least a preemption point between
> the allocation of the two extents.

Yes. 1GB is exactly 262144 4KB pages.

[...]

>>> I managed to overcome the issue #3 by commenting out all calls to
>>> populate_one_size() except the populate_one_size(PFN_4K_SHIFT) in
>>> xg_dom_arm.c. This lengthened domain construction, but my "RT" domain
>>> didn't experienced so big latency issues. Apparently all other
>>> hypercalls which are used during domain creation are either fast or
>>> preemptible. No doubts that my hack lead to page tables inflation and
>>> overall performance drop.
>> I think we need to follow this up and fix this. Maybe just by adding
>> a hypercall continuation to the loop.
>
> When I read "hypercall continuation", I read we will return to the
> guest context so it can process interrupts and potentially switch to
> another task.
>
> This means that the guest could issue a second populate_physmap() from
> the vCPU. Therefore any restart information should be part of the=20
> hypercall parameters. So far, I don't see how this would be possible.
>
> Even if we overcome that part, this can be easily abuse by a guest as
> the memory is not yet accounted to the domain. Imagine a guest that=20
> never request the continuation of the populate_physmap(). So we would
> need to block the vCPU until the allocation is finished.

Moreover, most of the alloc_heap_pages() sits under spinlock, so first
step would be to split this function into smaller atomic parts.

> I think the first step is we need to figure out which part of the
> allocation is slow (see my question above). From there, we can figure=20
> out if there is a way to reduce the impact.

I'll do more tracing and will return with more accurate numbers. But as
far as I can see, any loop on 262144 pages will take some time...

--=20
Volodymyr Babchuk at EPAM=

