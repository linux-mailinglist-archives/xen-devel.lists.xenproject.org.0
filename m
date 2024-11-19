Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15DF9D296D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 16:18:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840364.1256125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPyU-00028h-Ah; Tue, 19 Nov 2024 15:17:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840364.1256125; Tue, 19 Nov 2024 15:17:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDPyU-00026k-7h; Tue, 19 Nov 2024 15:17:06 +0000
Received: by outflank-mailman (input) for mailman id 840364;
 Tue, 19 Nov 2024 15:17:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d4NG=SO=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tDPyT-00026e-GL
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 15:17:05 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20616.outbound.protection.outlook.com
 [2a01:111:f403:2608::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52c62a5b-a689-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 16:17:00 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA6PR03MB10241.eurprd03.prod.outlook.com
 (2603:10a6:102:3c8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Tue, 19 Nov
 2024 15:16:57 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8158.013; Tue, 19 Nov 2024
 15:16:56 +0000
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
X-Inumbo-ID: 52c62a5b-a689-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwODo6NjE2IiwiaGVsbyI6IkVVUjAyLURCNS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjUyYzYyYTViLWE2ODktMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI5NDIwLjYxNTE5LCJzZW5kZXIiOiJ2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lInCq9fRawhins7fXhgf3HL7XEEssozG9oPaTdu+sKm/sTtpqXHE0BYMov2kODClFxQtwDgHFb8uLdNWrlAzqabn8W1U/slwbWnIkeFe6mWbgKXbEHGME66CV3te8yne07i7Q+pQatoClFjI2tDQ3dBjxj4g0zz0kEiTJ+EcY3QzUi7AuBdZcaEfW62dlLYNLnidqkObzXV/TmkutgRSnBh7X1ZQhkPuCDij06pf6Qai2cgT4RoVzN8L9EC7QBF3TJBK3aUHLadqRNoUuHNVuOH3qCdOzP8hHUlhTZlSnm5ECB84J44FGFTiClBf18zsHgS3/W/E8aSlKgzZHo2C6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0esZiHgRpQ5BIk+owbZ3pSV+3GbEw3mv/LcZeWMX50=;
 b=S9viVa6y1AGpoD4thbiqOyE3Nz1N7YtDDfSmPzOwaflTg20ms0OkUbJYaA7kdRabmUdNolW5CIc2g4cV2Hpe4QQI+bIULPaBJxPNHxqkHvl3HrZN18qUB/SldRgZkFGLREt2tcIV4mgALK5MLTQadhW/Nq8Vr+LcYJBfqmvI6rsLxd9ng6okyA4B6zUvNYgF5aCNLBfi+zw9Yu6KO+TXQjmojJMlwZx9CYClbBB7S4fmScBvyM9BWO+YIhV6PaDzPCUAqiwyvO/+l/XeuXVKAwZ1m19runuyiMYZn4/m1aLKX5lJBg2/45TwtL9GWt7R43zLPrAg5+VglSzX78QxHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0esZiHgRpQ5BIk+owbZ3pSV+3GbEw3mv/LcZeWMX50=;
 b=H+4vekZPdFGlmXdAvQd35eNtda+0PO5dzNDgGLa3QFt2YZVJfv38AafkgWVuA1m2cuKt+Lrp8qdpu3vsJhwWz1VWOHeHGYhLacDYk+dWG1Z7RDE0GCltb8Sdwa0l7YoYSqtOj0R6S5fw2uNVZ/8S+wwHCw5hU/eMaVODNAi+lR8Yhx+pVCszkfuRKkCI3jlptdQ457Qtz9BT47F9jBiJDZnwAh/wc31hqzl7L0WeD0EOxJ4pmfS+REsAQj+NyPmF6XhcPLTJHhbwm861fA4B/B+SZBMO4uhZzqRTIPKfBv+BgCUG7OeQB9LojLa/Kh9igus5hxTPrEeWH6k9CMo+xA==
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
Date: Tue, 19 Nov 2024 15:16:56 +0000
Message-ID: <875xojmexk.fsf@epam.com>
References: <20241114224636.1942089-1-volodymyr_babchuk@epam.com>
	<alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2411181737570.1160299@ubuntu-linux-20-04-desktop>
	(Stefano Stabellini's message of "Mon, 18 Nov 2024 17:46:20 -0800	(PST)")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA6PR03MB10241:EE_
x-ms-office365-filtering-correlation-id: 8851a33d-a86d-480b-d88f-08dd08ad34c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?zxy+mADM9YbHPYHC5oh0RvoduvS2zQ+X/WuXo84Hp/I0thOvojOPJD8u5n?=
 =?iso-8859-1?Q?kyxckmjcaaiDNATVwrfNQoG3EV6ga+LGfnjJd8fyFtu4KykhpLyCX7LAkc?=
 =?iso-8859-1?Q?pye6H6ajrRSUHh9aPUnWhHbqasAiNypE2E/otU7YF06dvDShWb6edVnJ9s?=
 =?iso-8859-1?Q?SE4K1nhrv6UKY8lUESMzILA8ZrJ90okyzaprlD4sVE+qPj8ZMA1ZaWRsNj?=
 =?iso-8859-1?Q?chjwRhAIMRROyVPvZfVlAdL5KPkk6q+g6YhmNTleRLiJivdoVOgojmYNEQ?=
 =?iso-8859-1?Q?9uhGCQUP7PlInjiwggqgL7TuO6BLNIl+7U2MykIvgV9spzqEdrSBdzLGcY?=
 =?iso-8859-1?Q?rVnWqBDFh9mn/sVnC5cA1yPECoCuwal4K+APXN7nb1rLt9YvxRUyxaJn71?=
 =?iso-8859-1?Q?FeHo8Dsa+f+pzxOAzOgoGFxSgifrp7u5f2+d1Tdum5LdR7cG03EKMXqLHM?=
 =?iso-8859-1?Q?irVIg/TjW6sKsYNluDj1gg7mF9hP2t136cwVETUmvltJ1Med9esfwqxKon?=
 =?iso-8859-1?Q?QTHxjWQ+0AOk0m0oCkmXyLmJhnleDWuGSUyRna25JHm45Mi/dqCyoBoTqv?=
 =?iso-8859-1?Q?3R2RgAFoTCVihkV+KqJyKpyWnwpISQS9GXpz+OBs9KdytRgPT6KIsyXVky?=
 =?iso-8859-1?Q?XdgmFQVwgsDD1APs1nNSVzrpoADaltrFb3L0mJ8q92D9cwASSEX/x2CBe6?=
 =?iso-8859-1?Q?LppJZBATbYXw2FMKN+0dVEqjg4XujnWM4kvkSxjKqFNB3eAvpbjXm4EwQV?=
 =?iso-8859-1?Q?eitMm6pDbygiTLFbPWG7kDY1YGHMk3tFw4DTDw/bN2fgouJPqSmdKatp9l?=
 =?iso-8859-1?Q?Dp/0xICkKUylko0XdClwvOZ6/UcHL/tHJL58404NhP1h7N3k6nnL1SLsOQ?=
 =?iso-8859-1?Q?9dALgUUBokuX03H3ffK80pv2yhnyG3bTq3O36WcODaMKo69zdKCStbzFtz?=
 =?iso-8859-1?Q?53A4iVVhap7y5T6gCQ/zr5C55La3FwdKsYgbLEegVgZ1cNE9ycSCx99qGZ?=
 =?iso-8859-1?Q?0aoqr1W8BkjBLlUw5E09Pi+9cHopW/KXBqC/AGdMjOM0ze+rVm0HVdj4Cy?=
 =?iso-8859-1?Q?/NYZElV/p2DbjXVX/ju1aHlsFXxoGDnOgad0Q0K7U9sP9o7VvPVwvlUB0i?=
 =?iso-8859-1?Q?CgZcVBHTKsxAOrBEOWRDvYQtAZ+oNGhuVhYiTv5XPVwe4FMEBsDEJv4BeH?=
 =?iso-8859-1?Q?HFLFa1ewpf8BXVT2TMRMAW4imsZrpPIgm3WDnKFgVMaTAVQqnCJzLI8H7+?=
 =?iso-8859-1?Q?uphYFDgXHqjz2c3s+Qo3Gx7ijZAf6xni4DfVViyLN6dVRPKGMQ/ZuDLjFS?=
 =?iso-8859-1?Q?ptunTzKFn88R2WqmvbCZPJnahpuIqEMjLJxV167Q5OyqTtkWcbUE3JlZek?=
 =?iso-8859-1?Q?k89u3kh/DK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kE+PgFsbYvLztEvEkPyZjgke9//9ir3gZj4doJQdlVKB9HNEt2DBJdQYO9?=
 =?iso-8859-1?Q?Yowuwo13ihPQHqBxlZ3xlHwlO+9F+e+N+xYrQBmwgNMgDzpnpfKrNGsN8u?=
 =?iso-8859-1?Q?9wNKkd837YcmOAzOK6GfojjSlBkTzsnTLmGae4ojdOKzi0k4aNwIqns4wo?=
 =?iso-8859-1?Q?Cs3GSFRT0pcOxWTUfKO8cD2PxbLoIo2c53eX1n1Z8g1KvMejAMGzbemPJX?=
 =?iso-8859-1?Q?knee/mGLjDQkLh0ui+Y9xaEpMUbeHwtaH75KmkK4efNyMc39VHgehkwvs3?=
 =?iso-8859-1?Q?gl6vhwI77jnxJuSaWXao5fLyU8NY1RlXAzMD1otUOMuB8ppFoINTc+9ijT?=
 =?iso-8859-1?Q?hz7FEEroT8ZWgbPEwvhMenzPkyRx4ubR/JoRPbMX9pHZpm9HAfNvFs/zjo?=
 =?iso-8859-1?Q?fUEk5z/WEDVZyl+bw0qScYksP63R/f/r5HV5Yj6gNS2mF3HW7zPSEGpfzH?=
 =?iso-8859-1?Q?fy3NQY3NpCIrQMR8zkrc1JGX32b1o9s8NosWlWGCE6sCAiWji4iywRQHqj?=
 =?iso-8859-1?Q?XDrWTgXbRMvenLt9A3yCgHGFZotxI5//BoklnNgZLzJBdSO61Z6mK+EOTJ?=
 =?iso-8859-1?Q?ER9AoE/T8/QKo0MfplJKgLWM8oqptbl6TPw8FLBTVuo4V+mECXCIRgeGBA?=
 =?iso-8859-1?Q?3UghLWeDvQunif2JzWvO7qFlfsJpUmAmRsz7KSQBsje2lZRWDo+wU2zptM?=
 =?iso-8859-1?Q?SJ+C+WqiS2v+sz7437LxDQBj6WfFxJ3cDKQMML4XBoh7DuW0dsqqF9b496?=
 =?iso-8859-1?Q?wHFljasEqNVxLXSpnOrcm1gUV/ShraqJ14b1qiVt9/njyiGb2U5uX0pe5i?=
 =?iso-8859-1?Q?WcCgzGaole3vU1+Zl1QXRAFbmONA+qPRvIgWX6akg1Yx542VwedmhUEjd6?=
 =?iso-8859-1?Q?YcfgoCoWQvakUj9Fn4EaIFZcp2TQxnWvtda815ayu82RFS5gkYv7FAKWH4?=
 =?iso-8859-1?Q?JEwS7MIBFV+MG22EpvopENRfvtNkXCEpqygbfoMgv2Xqgnx+FDiF9at1II?=
 =?iso-8859-1?Q?DkKOOqjodZPuu8a+w9C/NSfqXozijGKbhu95eUCwvhAoRz1J8NGOCp2KP1?=
 =?iso-8859-1?Q?H+HdLKUQUa68acFG2yhv47wy2jdaF2SgzWwZ4biNG+sEIkI/Rv8OgqVJFB?=
 =?iso-8859-1?Q?ahFEOWjFEgypSi+Dg0mVJ4mnwxtTGB4fFyrOD7fq8GAY26oVjcW9g8zqG+?=
 =?iso-8859-1?Q?rrDGXhzvVzPiBrJ9FJaM51U8Z9HGbIOtRH/dGzZtzGm371DjISo1GVwtVz?=
 =?iso-8859-1?Q?jiVEBR3qwnSKWUDeOX7i3zH8qAt4DZLre6tKz2Pkd0jC6eJGetipGvXMGZ?=
 =?iso-8859-1?Q?TOOs1f2wTe3yG/j3IGracD/A812dCwCq+aR2qf0QPqyf53DZY5BEz4FrTI?=
 =?iso-8859-1?Q?/yShntXneabmNsk1SPU5cr4+NLDSD7WCsmIhyoT2W8iohfPvibnwYiGPD9?=
 =?iso-8859-1?Q?+nbkWXVfSb4z9gIJBFa/HWkxe64gzHi1uZS98gzJOx1hQ3tXDasi7i0Mfp?=
 =?iso-8859-1?Q?lezZDeFgGUm7FLt0adFbCeiaZ+r0mz1wNg8UlxCRIH4ERf1l/PjrWvFxwW?=
 =?iso-8859-1?Q?e+gZDK0kyFwa436Fkh7Cbl0PlNb9UIuOApGtxGJTs2mNT5UtpdwXzsoKRp?=
 =?iso-8859-1?Q?vqL62HfqehPheOVXVyasx4U2wFJgZsPZR2G8Qcl8oEYHAeiPXRa0nTTQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8851a33d-a86d-480b-d88f-08dd08ad34c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2024 15:16:56.3767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AxPv0cCiYa4iQ0u9WmJkKAZUw+rk5YHRkYKIWm+aTICEyNBsqVKCJY6mTvkhyR3PgtWHhzGSMgzUpqj1d6pxzFPnNiyQr/qxzlf/hIR8l3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10241


Hi Stefano,

Stefano Stabellini <sstabellini@kernel.org> writes:

> On Thu, 14 Nov 2024, Volodymyr Babchuk wrote:

[...]

>> +Building LibAFL-QEMU based fuzzer
>> +---------------------------------
>> +
>> +Fuzzer is written in Rust, so you need Rust toolchain and `cargo` tool
>> +in your system. Please refer to your distro documentation on how to
>> +obtain them.
>> +
>> +Once Rust is ready, fetch and build the fuzzer::
>> +
>> + # git clone
>> https://github.com/xen-troops/xen-fuzzer-rs
>> +  # cd xen-fuzzer-rs
>> +  # cargo build
>
> Is this the only way to trigger the fuzzer? Are there other ways (e.g.
> other languages or scripts)? If this is the only way, do we expect it to
> grow much over time, or is it just a minimal shim only to invoke the
> fuzzer (so basically we need an x86 version of it but that's pretty much
> it in terms of growth)?

Well, original AFL++ is written in C. And I planned to use it
initially. I wanted to make plugin for QEMU to do the basically same
thing that LibAFL does - use QEMU to emulate target platform, create
snapshot before running a test, restore it afterwards.

But then I found LibAFL. It is a framework for creating fuzzers, it
implements the same algorithms as original AFL++ but it is more
flexible. And it already had QEMU support. Also, it seems it is quite
easy to reconfigure it for x86 support. I didn't tried tested this yet,
but looks like I need only to change one option in Cargo.toml.

This particular fuzzer is based on LibAFL example, but I am going to
tailor it for Xen Project-specific needs, like CI integration you
mentioned below.

As for test harness, I am using Zephyr currently. My first intention was
to use XTF, but it is x86-only... I am still considering using XTF for
x86 runs.

Zephyr was just the easiest and fastest way to trigger hypercalls. At
first I tried to use Linux kernel, but it was hard to cover all possible
failure paths. Zephyr is much simpler in this regard. Even better is to
use MiniOS or XTF. But ARM support in MiniOS is in sorry state and XTF
does not work on ARM at all.

[...]

>>  void call_psci_cpu_off(void)
>>  {
>> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
>> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
>> +#endif
>
> I think we should add a wrapper with an empty implementation in the
> regular case and the call to libafl_qemu_end when the fuzzer is enabled.
> So that here it becomes just something like:
>
>   fuzzer_success();

I considered this. In the next version I'll add fuzzer.h with inline wrappe=
rs.


[...]

>> @@ -1452,6 +1456,10 @@ static long do_poll(const struct sched_poll *sche=
d_poll)
>>      if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )
>>          return -EFAULT;
>>
>> +#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
>> +    libafl_qemu_end(LIBAFL_QEMU_END_OK);
>> +#endif
>
> I am not sure about this one, why is this a success?

vCPU get blocked here basically forever. So test harness can't call
libafl_qemu_end(LIBAFL_QEMU_END_OK) from it's side because it is never
scheduled after this point.

> Honestly, aside from these two comments, this looks quite good. I would
> suggest adding a GitLab CI job to exercise this, if nothing else, to
> serve as an integration point since multiple components are required for
> this to work.

I was considering this as well. Problem is that fuzzing should be
running for a prolonged periods of time. There is no clear consensus on
"how long", but most widely accepted time period is 24 hours. So looks
like it should be something like "nightly build" task. Fuzzer code
needs to be extended to support some runtime restriction, because right
now it runs indefinitely, until user stops it.

I am certainly going to implement this, but this is a separate topic,
because it quires changes in the fuzzer app. Speaking on which... Right
now both fuzzer and test harness reside in our github repo, as you
noticed. I believe it is better to host it on xenbits as an official
part of the Xen Project.

--
WBR, Volodymyr

