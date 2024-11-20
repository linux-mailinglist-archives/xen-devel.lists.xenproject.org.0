Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E1A9D3187
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 01:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840870.1256409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDYvs-0008Lx-N2; Wed, 20 Nov 2024 00:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840870.1256409; Wed, 20 Nov 2024 00:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDYvs-0008Im-Iu; Wed, 20 Nov 2024 00:51:00 +0000
Received: by outflank-mailman (input) for mailman id 840870;
 Wed, 20 Nov 2024 00:50:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o+QZ=SP=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tDYvr-0008Ig-AG
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 00:50:59 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20612.outbound.protection.outlook.com
 [2a01:111:f403:2607::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f85d349-a6d9-11ef-a0ca-8be0dac302b0;
 Wed, 20 Nov 2024 01:50:55 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB8012.eurprd03.prod.outlook.com
 (2603:10a6:20b:43f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 00:50:52 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8158.013; Wed, 20 Nov 2024
 00:50:52 +0000
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
X-Inumbo-ID: 7f85d349-a6d9-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwNzo6NjEyIiwiaGVsbyI6IkVVUjAyLVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjdmODVkMzQ5LWE2ZDktMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDYzODU1LjQ5NzksInNlbmRlciI6InZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xdfov1l0pZ+q4r0YsozIVpxDDgteXEwhVMtafJEBoJixbzM4+x/lO6YV/acFrFpXm2nuDD4CI1ai7bY/20zhEbD0h0kDK59QvMixpvJ8w7Xnt0BN7A1HzjGAQpBjKHwIrGvHHD5DOuIbthJuYwjfURQCGktS1JahkFDyOv4oc7a61x6Yn1AAx2+TCiCpl0gmkYadXVEC1AgcJGvPCSkH+/Mgw225RCFUJ2XVEbrY6wYQdUfh6K5vvG2GeFCReUW/30VJwZrBB31RZDD75MkHKLn4zw0wk1/GMA7FJKAcVY5LhmcNY5WAjYjjadK2MKNKsY7t05wrnf6CwKHIeSD9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmxZ6FV2YMTwcziKVLlTHHg6upRflqixpmJ/Uq9Nel8=;
 b=RdOQPWUS7PR3iKlVTOZCt+9H1wlhtoeCD3yAxr766A5PSX5HofX+GsRSn7WXIxGaEM3OtFfTkN1xO2u8SrFS2gG7C9rtTUnD6F3LUjF5CoQ48g2YgtKHOhBwBRhQlhVqy/iCbAAne84EgbeV9qZAwKcyNa9WSDwOxd0vTisF/gkLr7/xAEmxz6UumuWgK+dveypaEnYczS9RkiylxdCRYJsuuvnjLGBxIsBErW4HOgGVXlSlUEZXVKcRmRKlHAwjsp0WloNVQDdIfOrcu80rjZaYzsQumWaQ7WiYrDpTGDr4bBGizRQn2kS17rbYTpoVqmtVcGpOSN8zCocCxFJa4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KmxZ6FV2YMTwcziKVLlTHHg6upRflqixpmJ/Uq9Nel8=;
 b=IdUoM3bHkVNfH54zhX7by2nwQh1I1wgGk0YvCelx3gts/yFzuAjbYHemTy5M3OyYbfA+ZYeNmCri9Lio0itAjXAPP+gd+wy3R3VjDDjMNuMhsbAPAUMUwvgghwcqP8HnSBIPjACP13jsYPDy7Xf76FW8ctLnq/1XRXdP413i+XnF8W2H7MDLtQa6Zo914ktHGqADpW3IV2PFtD//NzZF+MXMHHcatvI2SJU3pwxqbHdCtklCwfgZbRSbDy0HhwSkfkqi6skfepWyTeLwnnXCYq2m1gakzxbBAusU1aJoxIDI/ktW0Wmv3HQbRj29Pj50xV3DiNhLIx34L99pAhZQYA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Dario Faggioli <dfaggioli@suse.com>, Juergen
 Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
Subject: Re: [RFC PATCH] xen: add libafl-qemu fuzzer support
Thread-Topic: [RFC PATCH] xen: add libafl-qemu fuzzer support
Thread-Index: AQHbNucXRmUX3Y7lRUGcS7d55ZSXhw==
Date: Wed, 20 Nov 2024 00:50:52 +0000
Message-ID: <87iksilod0.fsf@epam.com>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com>
	<alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop>
	<875xojmexk.fsf@epam.com>
	<alpine.DEB.2.22.394.2411191409140.1160299@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2411191409140.1160299@ubuntu-linux-20-04-desktop>
	(Stefano Stabellini's message of "Tue, 19 Nov 2024 15:23:18 -0800	(PST)")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB8012:EE_
x-ms-office365-filtering-correlation-id: ac9ab90d-cdd0-4d28-5fb0-08dd08fd621c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?4ylTQstu/VIoJHpgp+67m7Eeq/15vqRsT20xkd1phMe6M4X5//xomasfL9?=
 =?iso-8859-1?Q?Go0hYpjdGsOQe1USjQIefDfeaaJZbCRpLcc3ldj94acb3f3p6j3pL7kBGR?=
 =?iso-8859-1?Q?hEbzYQ2+LEhcb1See66xlcUgg/jmObWV9LulNf2pkPv2DNfOdc6gVSF1ig?=
 =?iso-8859-1?Q?hm+IYyOcM3jReDbPXQfotdqtQmVCbtvlHhat8GI88lKZhth/d2Zfv8j2MZ?=
 =?iso-8859-1?Q?zQzcenprKc0NaEwyZLTeTynoxlus/x+gnc+ulf0ccEM89UzA/0ylAgCAZl?=
 =?iso-8859-1?Q?bPobG2QKCus69yQzLym8rgm8z9yLW5Pby1cUwsMebVvDrd8I5R85zh5BSE?=
 =?iso-8859-1?Q?4UTCUGLErCXPY69U+BrVd81nK37wed31PMBq4BM5MCo7PInTsVDP7oOcgT?=
 =?iso-8859-1?Q?woafYQXJW4+ZYWNeLkIN9YRoR3dl4+BYaDFzxZn1wNhrXpdli72UzPoQFy?=
 =?iso-8859-1?Q?TpT6ktKCUYFaYITC5B/h3HEEZX+TQ0AmvdhgxgsfaKJl8NYQpAEKQOM50Y?=
 =?iso-8859-1?Q?NJj53VGtoVkWzEeSuw2ZCaaXWyes/+LwMuabf2Ru3pTqrwKPuREsp+dkZ8?=
 =?iso-8859-1?Q?1tob0zQJYcCQqPxxFlmd7+kUt7Ic0387uStiB7SPeNYCz7IpUSR696MAJ3?=
 =?iso-8859-1?Q?Pmh06vv29lVilJQ32KFRNd+lpVQaD9TWSDcG6qStyAtVk8OIU5/0yLxAtR?=
 =?iso-8859-1?Q?dQetbMaAEMJp54EEJtzvKxnqBq294sEhU4fBjL5/yVWr6F6gawVXKV3U6Y?=
 =?iso-8859-1?Q?glaY4dxFprZIYy6FMhIpFmgtPiBa06IaIaXR175ynZCR9UgdXS8JFQ5hs1?=
 =?iso-8859-1?Q?oih7NlVJg5QLFIKYe0DVdV1M/UD8VNyWibOAfWflvY67GuVIS8I32w/Ogl?=
 =?iso-8859-1?Q?OIkDNwJI84OX7VTJN90Ivh9VKiAzdwyJUQD2rXOp3EN34kApWq1CxWYzyH?=
 =?iso-8859-1?Q?uKFyRUP/t1kGhwz+jFFY7VMGemU7AXd4XOTgrGzWtdS5LHvGZ8X4OtqJnS?=
 =?iso-8859-1?Q?24SIFx950/j9IQz8QFsbaas/xnvz6Xa0sz4r7Xs/8cg9knrEyZDXmbG4ZI?=
 =?iso-8859-1?Q?xeOz2xl81UfFdv56nnSOFeCSy3smer1nabWqp2jRnyisJXniTKP31WXY94?=
 =?iso-8859-1?Q?Wsny71ZtJhwK+QnPm1pHEFuystHL+mClvs/UbwTfVHZRcls5u8ldLqYPpt?=
 =?iso-8859-1?Q?suM1FWcOfKF6ljkO95OJFj7c1p2nK8cZw784aKPYGfvPV2Di5HLmINCE1i?=
 =?iso-8859-1?Q?WmngcGZuvFmcUUT9dDEbhjzcHzq/oYt0zQmMLXgxz2gFuB/6I2z9TFD1cH?=
 =?iso-8859-1?Q?sd2nCvC3JEwEqIqxfnsjb1TXUZBguCIiCcOLB3NY4ab8hMaJt9xW+x2GE9?=
 =?iso-8859-1?Q?qlPQp1/0MF?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sPfSDRJLSwNlQfIgIjTSuh334jCGuUdXo3MxQYAdD8r/K1Kj5Wycb35sc3?=
 =?iso-8859-1?Q?IjqMI4TJe4R96k+eA/bc5fuIHuQZniLSkpHCbctN+V1Osn0BpnSgtl3B8u?=
 =?iso-8859-1?Q?Or5QyC/WZ9UhX/dwaweyqTEy5zBrptVQcwYmAk38RJUbL3qFdeSkKJ8xjQ?=
 =?iso-8859-1?Q?FjpIuHylG9EU8aqAgMC0kwTGGE53eRjK3t+ny+7gX7QccgPwnxKTiVFPLD?=
 =?iso-8859-1?Q?wIS4XiMsaFkuJ9Xr8nogpxC9rx2d1CFdcKIBOMQsHKzVu6UmRPpMV3QtzY?=
 =?iso-8859-1?Q?NxbUDJKsOKEthhKBDhRquRwiHapy84glVsq6kMnQP9nbFJpxvbZ9o4N8zX?=
 =?iso-8859-1?Q?g3IUOpaOxuBJlo5GVxjMegv2Zxj3j0aUX4QKxpNLIb20065BkQYxMFYB1K?=
 =?iso-8859-1?Q?X5kJDQNBzQs6bfPFN2ZOI4PUJF8W3er5yGNqB2KRRSkwYZWm3W3kZd44Pf?=
 =?iso-8859-1?Q?LRj0/iNV6ULeeC+/wa0Wf9JIb+fmv2PQvrhx/Kzysd0uJ6J6V70SfdUuUA?=
 =?iso-8859-1?Q?usoaasHM0p7JF9nmLKrfiCBUCWFo5YFBDDD2FbVEsK3lDdcaFv0fDyj/Fq?=
 =?iso-8859-1?Q?sC8eLoVXi0Uybi+HiP/MBJewG7H0zO0X7jxbK6ejGCtheAjrrGa8D6wgDx?=
 =?iso-8859-1?Q?xFiH4b/QypRKm+vbedSZCtVY+yIyc9FRICQkJ0Pj803SfWUzOqucYBpdyi?=
 =?iso-8859-1?Q?q3pP5dY1/s2jLkzn0IXW/bTQtwvBx/NzMA1Qpf7K5Ew67rUAZDvJ1p/XwY?=
 =?iso-8859-1?Q?Pvq7U9gJ2YsYpRtaXhrO7KieXp0wnBA7uC1FR3ijN1OqSTL85qjhT6PMV2?=
 =?iso-8859-1?Q?urPXy4UCkbiuasb7vEjg4DZglkXxzYL2ocgcBa81xaDnaAUgzxenNFMXDq?=
 =?iso-8859-1?Q?aD7FeWxjLIUsRV/CppUitd6wP14blt6+BZPjxGaTmE1M+bdKtMDknUD9K2?=
 =?iso-8859-1?Q?CNPAj3cUP9V5lMIfZgnMVaTio7fatN8YXyO9ubrCEkFgFx1OMn/QFXuWS8?=
 =?iso-8859-1?Q?LSyOU6JQjHKvO2OC0sUILWJe+XM4841O/YPpVqPciRLDE2CfIWDIMxKQxV?=
 =?iso-8859-1?Q?otWQRTiDFfquKrA5VR3Xtef3eS1z1soMaKHLLB53wp/V5Kl37p6pEM67Ya?=
 =?iso-8859-1?Q?n9NQYNYGb671t9oxK++ql1Q12OTsl59D+rp3ollJSISZGdRamNqZZeSCQj?=
 =?iso-8859-1?Q?2ZN+cgX5jFbJQp+Xy1OUBDRWRHO/JeElPk//TKGv4zTdVgmIB+FzxG4ibP?=
 =?iso-8859-1?Q?UzNDem9utx253q1039ZU+dQdfLuiW/3o195lAW25iZo6WhJtmNWRSW/mCr?=
 =?iso-8859-1?Q?e2f+dGZ6vywz2az5dBICAma7UgWtvRu3wV2yOATaqUnpwuzcUjpiNykrfE?=
 =?iso-8859-1?Q?Ld3rSkejwxe3rEbc5uZ0bjwu5qcHXEGhjsagq+ImYqyXKcNiqUJasaZ9T4?=
 =?iso-8859-1?Q?csTo5shKCVPe7WMmjlXCG/r5uB1DqH1wn4rvjuVuzqlR2FJK2vRHLxPdap?=
 =?iso-8859-1?Q?g343zyJ6TSirGXj+IQJmWJb4VT3VRNOrkVwr9l8iThvviXE8NwQPNkI4VH?=
 =?iso-8859-1?Q?nhUjkGbi2rEunYOuWeUj1LPHoJLvnffhwgJDSu5N73rzGSKHzaBErxXQFv?=
 =?iso-8859-1?Q?fZ/FWcjqEzT+VhkxzADgn20e9LL/hmE1czgu/H25jj8Trqqbpwv9BLzQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9ab90d-cdd0-4d28-5fb0-08dd08fd621c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 00:50:52.1671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DxBlH3QG4MboB7tIVU5Jsa8gTyE7j9y3PCz2HluTEvTr6w6rr2Zg+9r2FJ11WK00FIDbdQZpeYTYjJzEBt0N7/me4OorarNUr+J6DQADCRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8012


Hi Stefano,

(sorry, hit wrong Reply-To option, re-sending for wider audience)

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Tue, 19 Nov 2024, Volodymyr Babchuk wrote:
>> Hi Stefano,
>>
>> Stefano Stabellini <sstabellini@kernel.org> writes:
>>
>> > On Thu, 14 Nov 2024, Volodymyr Babchuk wrote:
>>
>> [...]
>>
>> >> +Building LibAFL-QEMU based fuzzer
>> >> +---------------------------------
>> >> +
>> >> +Fuzzer is written in Rust, so you need Rust toolchain and `cargo` to=
ol
>> >> +in your system. Please refer to your distro documentation on how to
>> >> +obtain them.
>> >> +
>> >> +Once Rust is ready, fetch and build the fuzzer::
>> >> +
>> >> + # git clone
>> >> https://github.com/xen-troops/xen-fuzzer-rs
>> >> +  # cd xen-fuzzer-rs
>> >> +  # cargo build
>> >
>> > Is this the only way to trigger the fuzzer? Are there other ways (e.g.
>> > other languages or scripts)? If this is the only way, do we expect it =
to
>> > grow much over time, or is it just a minimal shim only to invoke the
>> > fuzzer (so basically we need an x86 version of it but that's pretty mu=
ch
>> > it in terms of growth)?
>>
>> Well, original AFL++ is written in C. And I planned to use it
>> initially. I wanted to make plugin for QEMU to do the basically same
>> thing that LibAFL does - use QEMU to emulate target platform, create
>> snapshot before running a test, restore it afterwards.
>>
>> But then I found LibAFL. It is a framework for creating fuzzers, it
>> implements the same algorithms as original AFL++ but it is more
>> flexible. And it already had QEMU support. Also, it seems it is quite
>> easy to reconfigure it for x86 support. I didn't tried tested this yet,
>> but looks like I need only to change one option in Cargo.toml.
>>
>> This particular fuzzer is based on LibAFL example, but I am going to
>> tailor it for Xen Project-specific needs, like CI integration you
>> mentioned below.
>
> Is my understanding correct that we only need to invoke LibAFL as you
> are doing already, and that's pretty much it? We need a better
> configuration specific for Xen, and we need one more way to invoke it to
> cover x86 but that's it? So, the expectation is that the code currently
> under
> https://github.com/xen-troops/xen-fuzzer-rs
> will not grow much?
>

Yes, it basically configures different bits of LibAFL and integrates
them together. So yes, it will not grow much. I am planning to add some
QoL things like ability to re-run specific input so it will be easier to
debug discovered issues. Or maybe tune some fuzzing algorithms
settings... But nothing big.


>
>> As for test harness, I am using Zephyr currently. My first intention was
>> to use XTF, but it is x86-only... I am still considering using XTF for
>> x86 runs.
>>
>> Zephyr was just the easiest and fastest way to trigger hypercalls. At
>> first I tried to use Linux kernel, but it was hard to cover all possible
>> failure paths. Zephyr is much simpler in this regard. Even better is to
>> use MiniOS or XTF. But ARM support in MiniOS is in sorry state and XTF
>> does not work on ARM at all.
>
> There is a not-yet-upstream XTF branch that works on ARM here:
> https://gitlab.com/xen-project/fusa/xtf/-/tree/xtf-arm?ref_type=3Dheads

Ah, thanks. I'll try to use it as a harness.

[...]

>
>>
>> I was considering this as well. Problem is that fuzzing should be
>> running for a prolonged periods of time. There is no clear consensus on
>> "how long", but most widely accepted time period is 24 hours. So looks
>> like it should be something like "nightly build" task. Fuzzer code
>> needs to be extended to support some runtime restriction, because right
>> now it runs indefinitely, until user stops it.
>
> We can let it run for 48 hours continuously every weekend using the
> Gitlab runners

Great idea. Anyways, I need to add option to limit runtime to the fuzzer
and invent some method for reporting discovered crashes to the CI first.

>
>> I am certainly going to implement this, but this is a separate topic,
>> because it quires changes in the fuzzer app. Speaking on which... Right
>> now both fuzzer and test harness reside in our github repo, as you
>> noticed. I believe it is better to host it on xenbits as an official
>> part of the Xen Project.
>
> Yes we can create repos under gitlab.com/xen-project for this, maybe a
> new subgroup gitlab.com/xen-project/fuzzer

Good. Whom should I ask to do this?

--
WBR, Volodymyr

