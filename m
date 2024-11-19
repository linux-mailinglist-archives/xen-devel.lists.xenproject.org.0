Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7759D2FB9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 21:47:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840763.1256270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDV7O-0006p8-Fq; Tue, 19 Nov 2024 20:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840763.1256270; Tue, 19 Nov 2024 20:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDV7O-0006n1-CZ; Tue, 19 Nov 2024 20:46:38 +0000
Received: by outflank-mailman (input) for mailman id 840763;
 Tue, 19 Nov 2024 20:46:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4NG=SO=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tDV7N-0006mt-6n
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 20:46:37 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b067d4a-a6b7-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 21:46:32 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by VI2PR03MB10935.eurprd03.prod.outlook.com
 (2603:10a6:800:27d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Tue, 19 Nov
 2024 20:46:26 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8158.013; Tue, 19 Nov 2024
 20:46:25 +0000
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
X-Inumbo-ID: 5b067d4a-a6b7-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwNjo6NjAwIiwiaGVsbyI6IkVVUjAyLUFNMC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjViMDY3ZDRhLWE2YjctMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDQ5MTkyLjA0NjE1OCwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=spdFOaV8Qcwr7rM4qe6AUj37qXnSQqXJ+K8V8QRZiuOxoO74ef4Sw3Y+n1VXcVx7zJntereuyGLWD6CtX/38NUJ/rurErDU1khIq/EXuTSdfwC70eRzN1+Oj/FKt0+Vkn8rCukWKOMEh2i3pLGBRWI3VWcVlFL/vjuhQ+7bAirvE5V6q3L4Tb4bhFK0ESQpxuHHV8GrQdbYCj5+BDXKyxEYGufac6lHutryhkkU7+od8uwoRHAuKyY+FjWFaLOJFhp4NpqwTUvu24iAy3tFqaWP/EzGWWGNC1/dg0bV2w4VhP61DZisEPSjtb+Z1uTWLQ8wcICnKe2D9Dhv3+i6/xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rJruq0yoNzq1N1/lEG0ezfuppAu8FAcuid+Q3OYVsLk=;
 b=n3XpVkl6rB0ifIlhqAe7eFtUsX8eyUMhLqcTPOjFQJYanfL90hm7YBXJF7LnfP3tT9DMnob9P2m3ucPxWaBOT6mc3am6k4eh8uXjrQXp8X3YxKBQSxVZMAwtz4imWUWVrd1dnASwAtHVLwuTPFqvmalnB9RWIjpZRPM4wjK24pgB9Daaic2f1w+9DZAQTMLW448k6PQGqh+O2cMzWsyHmUqSia9GKEEtaT0Eqwg708Uc5bQIf5AM5KViUay3PY5Y2ys5+mPfJ2o8OOTxd9kNI2nPA3vjXeROGUaMcM4Ew+UHFgFLBN8oikWv59AgMN/8UNPwLTIg1EomvtwarnD0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJruq0yoNzq1N1/lEG0ezfuppAu8FAcuid+Q3OYVsLk=;
 b=RehoCY0CAyQrA8ekyJjieeiTqzbrSnpFKjkYeHIY1xM1QIhnRCiohFNy6iI7Fzm4F0d2jJieYTmbx1Fp7B+mC/x++8S4goOdol1mZymbJ3RKcjarIpPuSM4diYCOy+FQndwD1497E45NXGErQB343MvY9ylbcGOLfUc43cPQ4ltqQX8+5vOy0JISwjrvpS8202ZcSlE94pzkmksHU4wAFaHPGuCfoFEVFl89yhSJGBHkgPwV7RPaatz9feyaC1ugZ9BY+IQw0pHOOwnG7JfBwIL4rRdZ1avXuQB0HAmuZnZJ1N6CQZbwu+d/jJEhSMv0INSpwsVScMhi0D3nLif7IA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Dario
 Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>
Subject: Re: [RFC PATCH] xen: add libafl-qemu fuzzer support
Thread-Topic: [RFC PATCH] xen: add libafl-qemu fuzzer support
Thread-Index: AQHbNucXRmUX3Y7lRUGcS7d55ZSXhw==
Date: Tue, 19 Nov 2024 20:46:25 +0000
Message-ID: <87ttc3kl3z.fsf@epam.com>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com>
	<alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop>
	<875xojmexk.fsf@epam.com>	<d9aa57ed-228e-4099-8a3f-cca365e50eca@citrix.com>
In-Reply-To: <d9aa57ed-228e-4099-8a3f-cca365e50eca@citrix.com> (Andrew
	Cooper's message of "Tue, 19 Nov 2024 18:32:32 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|VI2PR03MB10935:EE_
x-ms-office365-filtering-correlation-id: 55a6e0f4-7d5b-4231-a9d6-08dd08db3c17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gcl3T0n57qKJI4H8RrpG8NUDoESEcIdxUEoGYK0p9kXsA98KXidCrNWu3O?=
 =?iso-8859-1?Q?TRTpz1KbRsRy9u7M+2jl1t9UETQ+1U+4CN+GfBewoh75Tc2oPaSkIhTj+I?=
 =?iso-8859-1?Q?XdXZVOR01detmzqzA9Dp4aUhz762ugTFlWkV256twdCUKHgLYdnv2IMXq8?=
 =?iso-8859-1?Q?6LtYQxKTFh9rhYufSIwYOK48XaA8XTVqXWaQVXpBiTUI22D7OpjujVh19o?=
 =?iso-8859-1?Q?uqlIwMIVvfFW/CzRrlhbwnsMIeHoyp7GHpDiymPkiMWIKVitgBRVd5zSZE?=
 =?iso-8859-1?Q?4esrBWLjgdH1Hla7xrEnimt21iVoVSeoe+YFj8WMduOQK+rKV44FlvQtma?=
 =?iso-8859-1?Q?96XkN02Gaq4rIC0zbMCHQz1Qr406zxManuShmYau6Xjw8x6nalPnLY5qw/?=
 =?iso-8859-1?Q?TaqH4zaE978ziSKcZTk930zFdbOvFUtSyM4s6vMrQg0bLhtj1d02qvjOGg?=
 =?iso-8859-1?Q?jdNAlZAIvZUTrXpG7yvu7r6eDr7E/ECseYX+swDCO2rRI91wveEUUfX8Ye?=
 =?iso-8859-1?Q?cb9+YVe4eSW7EGVgsCUzTnOK/uXfvvg6jOORxmMQtNVbg0MR19FxNKeJyj?=
 =?iso-8859-1?Q?pZjvrfxbHII91y2A4TWCe411umhIUl90GRkKjUnKO9CGVbjsbjbXWBWmvZ?=
 =?iso-8859-1?Q?kskntUvRuXVdzAW62uM2y5zXwAznfGyROVB3LYbTDN4YfT6gYgPsDijfw5?=
 =?iso-8859-1?Q?Mk8kgL94H509QUM9FK4sBmUvEgdT30BcL3dP9j/cj8bF1ghs6knrtaY9Xo?=
 =?iso-8859-1?Q?J5Zs97/sTFK101fqOgHhOobuqPGGiNoH72Vov+q+/IWf9H44Po8XFian0S?=
 =?iso-8859-1?Q?sNuKSBd/DM3e7Kvdlg9qucwYTOUuzUg25rOXVlnUx+56JRfquyFpJDqY19?=
 =?iso-8859-1?Q?bzxR1nqbtUrWgh0MyQoW8BgIJrxvu/JNlSWJbs/8kV18AWUX3xAFXAF89O?=
 =?iso-8859-1?Q?vkF9gmYed7SUcMaYWKcQpNJsX2n+mS35YQO16owk1alU98GCjOUOXJ/iyl?=
 =?iso-8859-1?Q?7oMsu6kGr5SLKGkyTvlevCX5o8R48F0bAFpXWmYw8WBBS/+bkRLD+ZW5yT?=
 =?iso-8859-1?Q?jSCVyaGcLx4u3rN4tpg43nEH9X0+/x882umfZBTLC9uECdp5aDnxC/Ofni?=
 =?iso-8859-1?Q?bnze5pxbpb0pjhEnk3a6zf+C9aX0kA1Q8HyqHuMTkLnG7pxspLOEu1HyfV?=
 =?iso-8859-1?Q?ARcgj8Cc2Mc4VonwT5tqoGFBppW08V83WQJTjDt213m23Q3jpd7Xf1Ve6Z?=
 =?iso-8859-1?Q?NdczNRyk9AOwr1U/pxy+Jy2DMGLUYA4CWHq8F1kC2+/usCL/S2y4lC7I6v?=
 =?iso-8859-1?Q?tX4ZAqLnpeeL521Qaa5Xbah1s2l5p8SdxoErMG28JatLR+6w5CgUD6n9Ex?=
 =?iso-8859-1?Q?Nkh0NT4eoc9XRXVtIm7p3GRL+2P6o3pw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?p3WdwllnstiOw+5cNhCpIgh8+LCsNyG/+9PfvkGzkpC6oY3sLml+6H7Be/?=
 =?iso-8859-1?Q?ZHqp3UWlNB77fDshUglsHAWl0SJo9L7TDJ2slt/79B9Hs9w9P2a0EfOVBu?=
 =?iso-8859-1?Q?u8P+UdjR6mDWasxn6wmWT4aPs3kolinPeDplvx2MXVVGoVqaPEU4QmzOZq?=
 =?iso-8859-1?Q?YOTN2yBaWOvkMtSLY7wD4SmmyHwUWcPy4nMF4QPRmy2liKtbRvd7J/L0rz?=
 =?iso-8859-1?Q?+jV8zugOlGyZhEXPsY+X5GqyL2glZ0BFsnV1e8ZAP8w6dYkSb5eouWuLLr?=
 =?iso-8859-1?Q?v5Q668wasPStGunGu0DMTizOjomR8b0JvE29aoQZy8XLBp0olitT6OvqWz?=
 =?iso-8859-1?Q?FuJzohfzwVyToM95xR0HVPHhIt41qt2X+A/Orlg4DnozmvrBlME2AU8yCA?=
 =?iso-8859-1?Q?FXltVJY1B4h5bvn9mRS/m84AQ9M+P3/9wNqFiAu+2Ng7SRKXZ/veesINqc?=
 =?iso-8859-1?Q?zW/IkXyHRmUq6++BBvQBehvtJYsFJkb8VlHBdirZ1dNaCtGHj1Pz6IVSwq?=
 =?iso-8859-1?Q?yOjxqImF1H3Jn4RkSlKTxW42OnAjov6J4D0Qq6vEHrVLzaU9rd8Eut6mFK?=
 =?iso-8859-1?Q?PA1sxlQTcW64du2pM7xe0/i3lK8usdHrPa5RFHW/0otMHaEm87O+nh15I9?=
 =?iso-8859-1?Q?lmbre5/QFnH4xVWFci/xm3YQEboLlfgYVslMefRG5uxQkdGN+spER5vHD9?=
 =?iso-8859-1?Q?3lxaVwZUC/wr5lvRZMLCtqYXH8a4aVBcyDtlHS2zcsdgKgWHVjj7KQ57X0?=
 =?iso-8859-1?Q?zv99fplYbtImh03IRSMm9dGIiEutSrtkSPIVeVcF51LzEWVUHnpkdQUml6?=
 =?iso-8859-1?Q?U9wKZHfkfJfFGmYM1upinc9XhcL7uQJfwtabp5EF9ZzDBt4Kj/YkmXqUXO?=
 =?iso-8859-1?Q?Pvma6R3p4MP9xKQ+necvCUS3c6Wuv+GCNADbiUoBsQ9eOgduaAZkapL/9f?=
 =?iso-8859-1?Q?/tfBrdI2nii76OtFBcZOzn6tOM3IFDnpbeOUEpfso+P8rVaFjO+uhFUVH+?=
 =?iso-8859-1?Q?W/tQwafevP6S9G+2H8Gy+rtVEJeRL7zSYlnPssIJn8dwWfjQkKfPg5RqGE?=
 =?iso-8859-1?Q?A4yd+bht2l1hoTv5zcpxdJxnLvJm+hnW0+YONeCkx5ihk+cwuN6s6B5SlP?=
 =?iso-8859-1?Q?pUupohiCI+9qlXCe2qroeFVgbgt9Nf/bTHactfFQ/EFqFwShxiwQWYAljM?=
 =?iso-8859-1?Q?DZKQirMeLPM+9gLotfoxtPPvGZCR+kBqmEpF8A2APHeaKnIJ6mT7LWVMbH?=
 =?iso-8859-1?Q?Twr5KMQXNYLTGspTc7GJX969EEk/MvOxlQYEHW+vbNSHGXE5GKGL738VDA?=
 =?iso-8859-1?Q?IKc9X/rlkZYGm7q79SuocTJFOkSOmEqk0TfnvOL2xdhTgIffqmEK9XyllU?=
 =?iso-8859-1?Q?QIF2n33JkhOXDFnkI2BMOidAvZtRXWV0eHTXhiftfNd3juqRzylNKofY2/?=
 =?iso-8859-1?Q?QuN5AnRwiGV5guQMBJ9PR0+Hiy1liij7iKcFUpVZLAbiVjS5+BLKDP0yTX?=
 =?iso-8859-1?Q?v8RMlCAR6wTil09/wJvTpFnZO2AqGP692Ye7y/AhzMbN49IKlksnexbznH?=
 =?iso-8859-1?Q?8U46U+F6vIGJfj7o3jYsTTxCpL3infslJ4GGzdLlK/1r+KG8HQiDDFrjmY?=
 =?iso-8859-1?Q?V/CjyDfC3WYPEkhJFefUH3WSGkSOQ0nS6iMr5LPqR8AnV90F8wBH7m6Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a6e0f4-7d5b-4231-a9d6-08dd08db3c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 20:46:25.4922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kh3C/mrmBlE1oTq0z6EwHg2J2tK2vEw+MhLtuIKjDTJbRcqgR6XdiR3F22G22OVn1qk41dDshwjWkerP+M4L1ptTibUZ7OnxQYkNpc8nnrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10935


Hi Andrew,

Andrew Cooper <andrew.cooper3@citrix.com> writes:

> On 19/11/2024 3:16 pm, Volodymyr Babchuk wrote:
>>> On Thu, 14 Nov 2024, Volodymyr Babchuk wrote:
>> As for test harness, I am using Zephyr currently. My first intention was
>> to use XTF, but it is x86-only... I am still considering using XTF for
>> x86 runs.
>
> I need to get back to fixing this.
>
> My in-progress ARM (and RISC-V) branch can make a prink() (console IO
> hypercall) and clean shutdown (schedop).

If you can share your branch, I'll try to use it as a test
harness. Also, it came to my attention that there is XTF with ARM
support, hosted on gitlab ([1]).

As for the licensing, you are right LibAFL is dual licensed, so we can
use MIT. I re-checked header files ([2]) which I used as a base. They have
no SPDX identifier, so I believe it it safe to use the clause from the
main README.md file ([3]).

[1] https://gitlab.com/xen-project/fusa/xtf/-/commits/xtf-arm?ref_type=3Dhe=
ads
[2] https://github.com/AFLplusplus/LibAFL/tree/main/libafl_qemu/runtime
[3] https://github.com/AFLplusplus/LibAFL/blob/main/README.md
--=20
WBR, Volodymyr=

