Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55619C9557
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 23:48:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836832.1252739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBicC-0007Xh-3r; Thu, 14 Nov 2024 22:47:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836832.1252739; Thu, 14 Nov 2024 22:47:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBicC-0007Uu-0L; Thu, 14 Nov 2024 22:47:04 +0000
Received: by outflank-mailman (input) for mailman id 836832;
 Thu, 14 Nov 2024 22:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HLpf=SJ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tBicA-0007UM-CX
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 22:47:02 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20622.outbound.protection.outlook.com
 [2a01:111:f403:2613::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a5c7b69-a2da-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 23:46:57 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB7229.eurprd03.prod.outlook.com
 (2603:10a6:102:10a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Thu, 14 Nov
 2024 22:46:50 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 22:46:50 +0000
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
X-Inumbo-ID: 5a5c7b69-a2da-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjIyIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjVhNWM3YjY5LWEyZGEtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjI0NDE3LjYzNDMzMSwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSQtBbpTqAGAmtB4Ivx0TNTxu+G0QxYQg3CFqTXORYC6Cp4QTkILF/SoBENaFTwehArZ+K0RQW7Jsb7Ry8Y4E4H66ngojRW+O+ZSn/CsQkuA5bkhLxRegx+BvSJas9yFY4pk/txv0no0KxRRKQQBJsCtlFLsOcFTCJzP/k/GarAYUiH42QxO1TU2rwfQ8KILDRBvPYapgRd7rFDl6k1j/Gg0gSE/RiC6t9V1FpClwlCaazHdWnLrIewvZ1dWI01tilwMQCGUjDio2U9pddfR7TpuWhGo4ie82TBDuLTNBsZbXeCA/gfSrVrjAR0Ak/WoraPSxNVCw5LlFiSzJPtGsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTwGWWosyBVRXFNlaD+HeGa7HUKQ1syR0zon0uY8oeo=;
 b=Ixx325zaT43h2eIMlBvhgOxgLi5WJyZ5KRAGA2S0ty/2UDpfqOGQvNNE9AjzsOmnI4TuWrwX/iazVGfDvo+2PEqi/8QdHsCzwFgIkEGCdedaDysH4ktY/+OOZhwS6gbHB8eND8HkOXaz5LbtXctvvxsgpn/VLgr8K4zMwyZafVvlkkIa8kLCN7afkQdx55GUdgX2Pfo6Rn2yTMGW0r8pzlnV181x/bITur/RCpiG4uj/X4dsYQe/nnurKVPeEuUid1fAtEemepLiyBkeYuI+e+OsnFnq8C/T+KlRz1VYel1DCKHk/RRQDJ5pgMJwsL8R1QtiFdfHUamBcOhQZpwh+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTwGWWosyBVRXFNlaD+HeGa7HUKQ1syR0zon0uY8oeo=;
 b=nOFWCgGT//SA3TFTM0lRhakYLvukFke9PrMtkUiO4PhmCTYtYrUFhR7Z71CTVW1VzN8rU/gAyvhfGCzolCCzmny4ELoGc5YILaks68PDliJPi5c6VeOYdd9tnzdgtiCwPLqpU0FSMMNZoW4axXS8C8XG/dC8dc1Q6Jm2r/yzZudiWcL4P6DRqCG22TYc2IlVcOWzbFnrqzL0pH7GSJoDTyy3DO0RiJsq1728lIb+Z2IJFcgr07V5vXakVIB3sKawzwqrwKr83wA0yJt85hyP1KCQxkFBHhKPRJcegjpiEDbf4CVc57ZGdRIHFKcaXA7dDmfpyET75S7EcGYIuDqbig==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>
Subject: [RFC PATCH] xen: add libafl-qemu fuzzer support
Thread-Topic: [RFC PATCH] xen: add libafl-qemu fuzzer support
Thread-Index: AQHbNucXRmUX3Y7lRUGcS7d55ZSXhw==
Date: Thu, 14 Nov 2024 22:46:50 +0000
Message-ID: <20241114224636.1942089-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB7229:EE_
x-ms-office365-filtering-correlation-id: a0f35f86-832c-4ca5-2784-08dd04fe3a33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?vF4Bfu/xQGcIHVx88aQEO49b1c3Tzg56RR0v3r/jWF4WZr6IXStVHtceCX?=
 =?iso-8859-1?Q?MDv3nMsx0khl2QRMQDl/xu8lKTMnLkC0C4ZosRubp76QF5ksLnU8Xxv9zx?=
 =?iso-8859-1?Q?sN32E1AIv6GKyTpjIShuo2RCbl5TY0CU8mXlb/J5pQbDojOgjXYw9wZ734?=
 =?iso-8859-1?Q?3DU68grw7PLcWhYb+cDjG2f5rnbWZyRzulbNVlEQ5e6IxLqaYDMigLc5Y6?=
 =?iso-8859-1?Q?f4wSk1B9hK8JQArZtqx3a8nhukJFuqYxh8Hd4d+hDE40DusD9EoiUy31g+?=
 =?iso-8859-1?Q?aOWj4k+qlYPhbe7C3wJMBdVf1NoS4aY624oyVVQ9wlPxYOu801WCSa2yR0?=
 =?iso-8859-1?Q?kDmjHpm79JRQFgRYhA4ALBxs8QoObnrtTNmjZl+XgtSYGL324YWbwiumO6?=
 =?iso-8859-1?Q?YwDlf/C1DyQ/UCqR98UZVbih6HkdkJeejFF/o74wNBeTcSEVBYKocO2uo/?=
 =?iso-8859-1?Q?9rVe1go6/PwHGtYRe7vtgIJhsp4E7bW7Q9xe6Sfzk9R9anBEDflk4KZiyy?=
 =?iso-8859-1?Q?IA4JYqCjkVY1e0TzRPvj0VWGpxPbBkkN91c4NuK7Y70c+cxiZ9pY38upk6?=
 =?iso-8859-1?Q?9XwWNtPOTnp83ESRjCFsmPgwgO6f0QOWMiS7bTIfAMln8MX5LCogXh/fq9?=
 =?iso-8859-1?Q?6V26TRe9pPyQEBzDc3NQ0TJov9PBzuG6SUuhazj8ogGuAZwfptaJptdALh?=
 =?iso-8859-1?Q?C1KEAdQy1AVMoS6LhSc/QoWDuzHnh5Ad76UK1vJ/66jqRNMbJC515R9g81?=
 =?iso-8859-1?Q?Ve4AirXuV/Hdy9sAHHA6kjycV2w5QmBSZI1Wx87lZ9qNWVBWCmL9R26vEn?=
 =?iso-8859-1?Q?z/R63LuvPmtMObCQo/q0iCYJgKBlAR/E8AsSr9ngvdIfvsHnp/NvPfJuCG?=
 =?iso-8859-1?Q?ZTRaEv8289sFAip9BI49uABllQxRXp8sCVPZbheGLoIV8cQU9SgXt66KGT?=
 =?iso-8859-1?Q?3PR/cyMjja/qMIkINyfm3l/Xbu/ii0RrKcxDPBv8ewDhQqCZSmEz0/WWWR?=
 =?iso-8859-1?Q?0E7tmSYtXmarVfsC3ucMN5r6f8gmvf157V8vhglEk4Cs8HBiYhqpQgPT/d?=
 =?iso-8859-1?Q?O74JR1KcLbNxFaVGcisK0krf2IxEyblWNibd3K8UqJn4EhmP6PVx9EdJFi?=
 =?iso-8859-1?Q?CL5GlPHuSgHyE2zCcNg1UcHWYbEVIBVZYNa28XXGqpO31/DqsZPQG151tC?=
 =?iso-8859-1?Q?/txetRZ+KkqmmxiamMiESfw8e/0+ve0FM7qGHRAav9uk6lwwQsOdAaJc5X?=
 =?iso-8859-1?Q?8gdF6OJ0Dz046AFODPCL+QsdJVCIyJ4Z9o+1nZGSE0xhbR/fOcEQQCby4l?=
 =?iso-8859-1?Q?rWgdP6z8ICHzIFQxIqlt1ie+jurO5KWSV6Mwf49IulerKGxWwJadH5qNT/?=
 =?iso-8859-1?Q?Tba4naSc3l6Qy/vOOZobOt/yRAJN68XQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RTCUa1MgGDPPihwADD7M4RJh0KQzqCZ+DglcIS8OZpLu3BPMQAxteCzYgx?=
 =?iso-8859-1?Q?hKJipFVEz8+xZEiTV8qzcLkxMRL/vVdIuAPtukZ4POS3qhbWU43GQcJ3m/?=
 =?iso-8859-1?Q?7o2jk/yd7XDjzWwNwJjWXkywFe7mVhShnWBSP+dAjTKuaujcXyul1p9zJu?=
 =?iso-8859-1?Q?XH+FFQoVsVe4IPZcx+Tejt39JYahaAU1+kgGkkIYJTYODwHwley5Vfogfi?=
 =?iso-8859-1?Q?s4j/Z+vxw/DzcITytbbHfhPVA7GOCYZHLNRnC3wbV62zKaivcCU8D5DoEt?=
 =?iso-8859-1?Q?1poZM1BRV7M+oWLgKWC28qBd2g6YASqaeu0EMh8tmlTUnpXi7OvXlguLiV?=
 =?iso-8859-1?Q?Y+AYMaU4b70AEI1Naio345ekEFz+2H5lJjepgTyVYkCI74efH0mh2XC7v+?=
 =?iso-8859-1?Q?aKdU9oBA44OR6OGv+wiBlqmjYVjrzEX85s+Otzs+R1cPIZGOT4Y2As1fV3?=
 =?iso-8859-1?Q?Xl8l2xRMAoSaDCewaWwhrykE5dusVqAGseZTysWSOpnB6lKheqnZnV8Ncn?=
 =?iso-8859-1?Q?phABUH/x4gq6A9RD50sYXEYIASjfj1PlrPBCV8HPqJz/oVM7ZMWNFynkYA?=
 =?iso-8859-1?Q?layFT46y5L69miT5qbGryg1Zj72lGI41+V13CIIEf+MXoYE5KooztL+870?=
 =?iso-8859-1?Q?jlNcb47XLJblUruzwTLLZbny8OnvMEbLmmknRQayW/H4nZOJ2krJ75w7B1?=
 =?iso-8859-1?Q?E/dsM/Ie0m/b1ZLiuT97I3rByWzQrnb69QtLzlPQjriNFmw86SAHhxxqwi?=
 =?iso-8859-1?Q?bhUApRoyRspn0JkDAOfwIxCC5CZoLI/OqGWu6AaGR7EcKUb39UKH926woi?=
 =?iso-8859-1?Q?7DfD+LEDp6UpEb1Z05r546QYQYRyeIn9oFO0OUDPLZd5/JT79kJrcxsWm5?=
 =?iso-8859-1?Q?v9zV2770NcR9QaV3Ob7gzCXK8Ht2M63r2p9Cz159ewkDziKY7ZzE504q4c?=
 =?iso-8859-1?Q?Y7Yas8Sy7c7b9Pq4jJx5ysEgaPqRz0zPTF1xeAkJV6lYvYdQqAN5H/5XCq?=
 =?iso-8859-1?Q?cNxGQiMbRevgsRwO4+mol31d20A9H0O36/h8HUDZdncIR3pGUKPfeanXqd?=
 =?iso-8859-1?Q?+Def2/CSz6/fYsfAK25eXnHZ34gSeh/pOpjQMN6kOM9onYkVduDn2tMMoK?=
 =?iso-8859-1?Q?g70+68W2C9B4tDXlsyllxi/LlruYgnPjsl2uzwSxTZRbKagNoMnFAXutmm?=
 =?iso-8859-1?Q?XVYPMJTpbyYTNNDbef+HE6RZ9QsLIDEzj/KeOOLIMc9r77BGS1BJjQ1BFr?=
 =?iso-8859-1?Q?Hw7BDPAEMLHiI6oo83jtJlVkj5VPeEhahobV2NsUGGyS8kxx3GE40wMzBM?=
 =?iso-8859-1?Q?Fru/UdlTG0fIMhUjLxoWBi5PeVS3rjcdvO1uMfoLcCSaUBhgJ4VAAQf5+o?=
 =?iso-8859-1?Q?Mq5IOeIQa1LWh9nJ/1+RAy3mGnHkgS2SheGHJjReBaM2OczgQjWdocuggn?=
 =?iso-8859-1?Q?nTUkMMx2kTFUsccMKGDexifKT8oFOrOrsx9KjnEcgka1FBuGyhXEhPuU0k?=
 =?iso-8859-1?Q?/PIYQHlgUtBvE7FDjkT8iJpaDat9fnsDwB2CCXyfIsE1GuDK2y1NAqBTr/?=
 =?iso-8859-1?Q?XvnCEoGOdA45JdWIx/OhhW2rEkc8cCj5GivAtaKGZNQOpx4ROM1iAv6Ry/?=
 =?iso-8859-1?Q?iUhqWqADVmdKLf80HP9OeyVPvE+UffV49o1aODNLRKSoa+GLx28jKoiQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f35f86-832c-4ca5-2784-08dd04fe3a33
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 22:46:50.0515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+a3RDThjm0oDx77uPlkpPupc35oWjKvU/Yh15kwENsIteh9gEEUsc6PaivD2auh4Y+bW/B4eEydnfF/WlEnem9+J3UBO3bGtf6ZnXtZcDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7229

LibAFL, which is a part of AFL++ project is a instrument that allows
us to perform fuzzing on beremetal code (Xen hypervisor in this case)
using QEMU as an emulator. It employs QEMU's ability to create
snapshots to run many tests relatively quickly: system state is saved
right before executing a new test and restored after the test is
finished.

This patch adds all necessary plumbing to run aarch64 build of Xen
inside that LibAFL-QEMU fuzzer. From the Xen perspective we need to
do following things:

1. Able to communicate with LibAFL-QEMU fuzzer. This is done by
executing special opcodes, that only LibAFL-QEMU can handle.

2. Use interface from p.1 to tell the fuzzer about code Xen section,
so fuzzer know which part of code to track and gather coverage data.

3. Report fuzzer about crash. This is done in panic() function.

4. Prevent test harness from shooting itself in knee.

Right now test harness is an external component, because we want to
test external Xen interfaces, but it is possible to fuzz internal code
if we want to.

Test harness is implemented as a Zephyr-based application which launches
as Dom0 kernel and performs different tests. As test harness can issue
hypercall that shuts itself down, KConfig option
CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING was added. It basically tells
fuzzer that test was completed successfully if Dom0 tries to shut
itself (or the whole machine) down.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

I tried to fuzz the vGIC emulator and hypercall interface. While vGIC
fuzzing didn't yield any interesting results, hypercall fuzzing found a
way to crash the hypervisor from Dom0 on aarch64, using
"XEN_SYSCTL_page_offline_op" with "sysctl_query_page_offline" sub-op,
because it leads to page_is_ram_type() call which is marked
UNREACHABLE on ARM.
---
 docs/hypervisor-guide/fuzzing.rst           | 102 +++++++++++++
 xen/arch/arm/Kconfig.debug                  |  26 ++++
 xen/arch/arm/Makefile                       |   1 +
 xen/arch/arm/include/asm/libafl_qemu.h      |  54 +++++++
 xen/arch/arm/include/asm/libafl_qemu_defs.h |  37 +++++
 xen/arch/arm/libafl_qemu.c                  | 152 ++++++++++++++++++++
 xen/arch/arm/psci.c                         |  13 ++
 xen/common/sched/core.c                     |  17 +++
 xen/common/shutdown.c                       |   7 +
 xen/drivers/char/console.c                  |   8 ++
 10 files changed, 417 insertions(+)
 create mode 100644 docs/hypervisor-guide/fuzzing.rst
 create mode 100644 xen/arch/arm/include/asm/libafl_qemu.h
 create mode 100644 xen/arch/arm/include/asm/libafl_qemu_defs.h
 create mode 100644 xen/arch/arm/libafl_qemu.c

diff --git a/docs/hypervisor-guide/fuzzing.rst b/docs/hypervisor-guide/fuzz=
ing.rst
new file mode 100644
index 0000000000..9570de7670
--- /dev/null
+++ b/docs/hypervisor-guide/fuzzing.rst
@@ -0,0 +1,102 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Fuzzing
+=3D=3D=3D=3D=3D=3D=3D
+
+It is possible to use LibAFL-QEMU for fuzzing hypervisor. Right now
+only aarch64 is supported and only hypercall fuzzing is enabled in the
+test harness, but there are plans to add vGIC interface fuzzing, PSCI
+fuzzing and vPL011 fuzzing as well.
+
+
+Principle of operation
+----------------------
+
+LibAFL-QEMU is a part of American Fuzzy lop plus plus (AKA AFL++)
+project. It uses special build of QEMU, that allows to fuzz baremetal
+software like Xen hypervisor or Linux kernel. Basic idea is that we
+have software under test (Xen hypervisor in our case) and a test
+harness application. Test harness uses special protocol to communicate
+with LibAFL outside of QEMU to get input data and report test
+result. LibAFL monitors which branches are taken by Xen and mutates
+input data in attempt to discover new code paths that eventually can
+lead to a crash or other unintended behavior.
+
+LibAFL uses QEMU's `snapshot` feature to run multiple test without
+restarting the whole system every time. This speeds up fuzzing process
+greatly.
+
+So, to try Xen fuzzing we need three components: LibAFL-based fuzzer,
+test harness and Xen itself.
+
+Building Xen for fuzzing
+------------------------
+
+Xen hypervisor should be built with these two options::
+
+ CONFIG_LIBAFL_QEMU_FUZZER=3Dy
+ CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING=3Dy
+
+Building test harness
+---------------------
+
+We need to make low-level actions, like issuing random hypercalls, so
+for test harness we use special build of Zephyr application.
+
+You need to prepare environment for building Zephyr as described in
+getting `started guide
+<https://docs.zephyrproject.org/latest/develop/getting_started/index.html>=
`_.
+
+Next, download test harness application and built it::
+
+  # mkdir zephyr-harness
+  # cd zephyr-harness
+  # west init -m https://github.com/xen-troops/xen-fuzzer-harness
+  # cd xen-fuzzer-harness
+  # west update
+  # west build
+
+Building LibAFL-QEMU based fuzzer
+---------------------------------
+
+Fuzzer is written in Rust, so you need Rust toolchain and `cargo` tool
+in your system. Please refer to your distro documentation on how to
+obtain them.
+
+Once Rust is ready, fetch and build the fuzzer::
+
+  # git clone https://github.com/xen-troops/xen-fuzzer-rs
+  # cd xen-fuzzer-rs
+  # cargo build
+
+Running the fuzzer
+------------------
+
+Run it like this::
+
+  # target/debug/xen_fuzzer  -accel tcg \
+  -machine virt,virtualization=3Dyes,acpi=3Doff \
+  -m 4G \
+  -L  target/debug/qemu-libafl-bridge/pc-bios  \
+  -nographic \
+  -cpu max \
+  -append 'dom0_mem=3D512 loglvl=3Dnone guest_loglvl=3Dnone console=3Ddtua=
rt' \
+  -kernel /path/to/xen/xen/xen \
+  -device guest-loader,addr=3D0x42000000,kernel=3D/path/to/zephyr-harness/=
build/zephyr/zephyr.bin \
+  -snapshot
+
+Any inputs that led to crashes will be found in `crashes` directory.
+
+You can use standard QEMU parameters to redirect console output,
+change memory size, HW compisition, etc.
+
+
+TODOs
+-----
+
+ - Add x86 support.
+ - Implement fuzzing of other external hypervisor interfaces.
+ - Better integration: user should not build manually multiple
+   different projects
+ - Add ability to re-run fuzzer with a given input to make crash
+   debugging more comfortable
diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 7660e599c0..9e2c4649ed 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -183,3 +183,29 @@ config EARLY_PRINTK_INC
 	default "debug-mvebu.inc" if EARLY_UART_MVEBU
 	default "debug-pl011.inc" if EARLY_UART_PL011
 	default "debug-scif.inc" if EARLY_UART_SCIF
+
+config LIBAFL_QEMU_FUZZER
+	bool "Enable LibAFL-QEMU calls"
+	help
+	  This option enables support for LibAFL-QEMU calls. Enable this
+	  only when you are going to run hypervisor inside LibAFL-QEMU.
+	  Xen will report code section to LibAFL and will report about
+	  crash when it panics.
+
+	  Do not try to run Xen built on this option on any real hardware
+	  or plain QEMU, because it will just crash during startup.
+
+config LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+	depends on LIBAFL_QEMU_FUZZER
+	bool "LibAFL: Report any attempt to suspend/destroy a domain as a success=
"
+	help
+	  When fuzzing hypercalls, fuzzer sometimes will issue an hypercall that
+	  leads to a domain shutdown, or machine shutdown, or vCPU being
+	  blocked, or something similar. In this case test harness will not be
+	  able to report about successfully handled call to the fuzzer. Fuzzer
+	  will report timeout and mark this as a crash, which is not true. So,
+	  in such cases we need to report about successfully test case from the
+	  hypervisor itself.
+
+          Enable this option only if fuzzing attempt can lead to a correct
+	  stoppage, like when fuzzing hypercalls or PSCI.
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index e4ad1ce851..51b5e15b6a 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_TEE) +=3D tee/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci.o
=20
 obj-$(CONFIG_HAS_ALTERNATIVE) +=3D alternative.o
+obj-${CONFIG_LIBAFL_QEMU_FUZZER} +=3D libafl_qemu.o
 obj-y +=3D cpuerrata.o
 obj-y +=3D cpufeature.o
 obj-y +=3D decode.o
diff --git a/xen/arch/arm/include/asm/libafl_qemu.h b/xen/arch/arm/include/=
asm/libafl_qemu.h
new file mode 100644
index 0000000000..b90cf48b9a
--- /dev/null
+++ b/xen/arch/arm/include/asm/libafl_qemu.h
@@ -0,0 +1,54 @@
+#ifndef LIBAFL_QEMU_H
+#define LIBAFL_QEMU_H
+
+#include <xen/stdint.h>
+#include "libafl_qemu_defs.h"
+#define LIBAFL_QEMU_PRINTF_MAX_SIZE 4096
+
+typedef uint64_t libafl_word;
+
+/**
+ * LibAFL QEMU header file.
+ *
+ * This file is a portable header file used to build target harnesses more
+ * conveniently. Its main purpose is to generate ready-to-use calls to
+ * communicate with the fuzzer. The list of commands is available at the b=
ottom
+ * of this file. The rest mostly consists of macros generating the code us=
ed by
+ * the commands.
+ */
+
+enum LibaflQemuEndStatus {
+  LIBAFL_QEMU_END_UNKNOWN =3D 0,
+  LIBAFL_QEMU_END_OK =3D 1,
+  LIBAFL_QEMU_END_CRASH =3D 2,
+};
+
+libafl_word libafl_qemu_start_virt(void *buf_vaddr, libafl_word max_len);
+
+libafl_word libafl_qemu_start_phys(void *buf_paddr, libafl_word max_len);
+
+libafl_word libafl_qemu_input_virt(void *buf_vaddr, libafl_word max_len);
+
+libafl_word libafl_qemu_input_phys(void *buf_paddr, libafl_word max_len);
+
+void libafl_qemu_end(enum LibaflQemuEndStatus status);
+
+void libafl_qemu_save(void);
+
+void libafl_qemu_load(void);
+
+libafl_word libafl_qemu_version(void);
+
+void libafl_qemu_page_current_allow(void);
+
+void libafl_qemu_internal_error(void);
+
+void __attribute__((format(printf, 1, 2))) lqprintf(const char *fmt, ...);
+
+void libafl_qemu_test(void);
+
+void libafl_qemu_trace_vaddr_range(libafl_word start, libafl_word end);
+
+void libafl_qemu_trace_vaddr_size(libafl_word start, libafl_word size);
+
+#endif
diff --git a/xen/arch/arm/include/asm/libafl_qemu_defs.h b/xen/arch/arm/inc=
lude/asm/libafl_qemu_defs.h
new file mode 100644
index 0000000000..2866cadaac
--- /dev/null
+++ b/xen/arch/arm/include/asm/libafl_qemu_defs.h
@@ -0,0 +1,37 @@
+#ifndef LIBAFL_QEMU_DEFS
+#define LIBAFL_QEMU_DEFS
+
+#define LIBAFL_STRINGIFY(s) #s
+#define XSTRINGIFY(s) LIBAFL_STRINGIFY(s)
+
+#if __STDC_VERSION__ >=3D 201112L
+  #define STATIC_CHECKS                                   \
+    _Static_assert(sizeof(void *) <=3D sizeof(libafl_word), \
+                   "pointer type should not be larger and libafl_word");
+#else
+  #define STATIC_CHECKS
+#endif
+
+#define LIBAFL_SYNC_EXIT_OPCODE 0x66f23a0f
+#define LIBAFL_BACKDOOR_OPCODE 0x44f23a0f
+
+#define LIBAFL_QEMU_TEST_VALUE 0xcafebabe
+
+#define LIBAFL_QEMU_HDR_VERSION_NUMBER 0111  // TODO: find a nice way to s=
et it.
+
+typedef enum LibaflQemuCommand {
+  LIBAFL_QEMU_COMMAND_START_VIRT =3D 0,
+  LIBAFL_QEMU_COMMAND_START_PHYS =3D 1,
+  LIBAFL_QEMU_COMMAND_INPUT_VIRT =3D 2,
+  LIBAFL_QEMU_COMMAND_INPUT_PHYS =3D 3,
+  LIBAFL_QEMU_COMMAND_END =3D 4,
+  LIBAFL_QEMU_COMMAND_SAVE =3D 5,
+  LIBAFL_QEMU_COMMAND_LOAD =3D 6,
+  LIBAFL_QEMU_COMMAND_VERSION =3D 7,
+  LIBAFL_QEMU_COMMAND_VADDR_FILTER_ALLOW =3D 8,
+  LIBAFL_QEMU_COMMAND_INTERNAL_ERROR =3D 9,
+  LIBAFL_QEMU_COMMAND_LQPRINTF =3D 10,
+  LIBAFL_QEMU_COMMAND_TEST =3D 11,
+} LibaflExit;
+
+#endif
diff --git a/xen/arch/arm/libafl_qemu.c b/xen/arch/arm/libafl_qemu.c
new file mode 100644
index 0000000000..58924ce6c6
--- /dev/null
+++ b/xen/arch/arm/libafl_qemu.c
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: Apache-2.0 */
+/*
+   This file is based on libafl_qemu_impl.h and libafl_qemu_qemu_arch.h
+   from LibAFL project.
+*/
+#include <xen/lib.h>
+#include <xen/init.h>
+#include <xen/kernel.h>
+#include <asm/libafl_qemu.h>
+
+#define LIBAFL_DEFINE_FUNCTIONS(name, opcode)				\
+	libafl_word _libafl_##name##_call0(	\
+		libafl_word action) {					\
+		libafl_word ret;					\
+		__asm__ volatile (					\
+			"mov x0, %1\n"					\
+			".word " XSTRINGIFY(opcode) "\n"		\
+			"mov %0, x0\n"					\
+			: "=3Dr"(ret)					\
+			: "r"(action)					\
+			: "x0"						\
+			);						\
+		return ret;						\
+	}								\
+									\
+	libafl_word _libafl_##name##_call1(	\
+		libafl_word action, libafl_word arg1) {			\
+		libafl_word ret;					\
+		__asm__ volatile (					\
+			"mov x0, %1\n"					\
+			"mov x1, %2\n"					\
+			".word " XSTRINGIFY(opcode) "\n"		\
+			"mov %0, x0\n"					\
+			: "=3Dr"(ret)					\
+			: "r"(action), "r"(arg1)			\
+			: "x0", "x1"					\
+			);						\
+		return ret;						\
+	}								\
+									\
+	libafl_word _libafl_##name##_call2(	\
+		libafl_word action, libafl_word arg1, libafl_word arg2) { \
+		libafl_word ret;					\
+		__asm__ volatile (					\
+			"mov x0, %1\n"					\
+			"mov x1, %2\n"					\
+			"mov x2, %3\n"					\
+			".word " XSTRINGIFY(opcode) "\n"		\
+			"mov %0, x0\n"					\
+			: "=3Dr"(ret)					\
+			: "r"(action), "r"(arg1), "r"(arg2)		\
+			: "x0", "x1", "x2"				\
+			);						\
+		return ret;						\
+	}
+
+// Generates sync exit functions
+LIBAFL_DEFINE_FUNCTIONS(sync_exit, LIBAFL_SYNC_EXIT_OPCODE)
+
+// Generates backdoor functions
+LIBAFL_DEFINE_FUNCTIONS(backdoor, LIBAFL_BACKDOOR_OPCODE)
+
+static char _lqprintf_buffer[LIBAFL_QEMU_PRINTF_MAX_SIZE] =3D {0};
+
+libafl_word libafl_qemu_start_virt(void       *buf_vaddr,
+                                            libafl_word max_len) {
+  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_START_VIRT,
+                                 (libafl_word)buf_vaddr, max_len);
+}
+
+libafl_word libafl_qemu_start_phys(void       *buf_paddr,
+                                            libafl_word max_len) {
+  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_START_PHYS,
+                                 (libafl_word)buf_paddr, max_len);
+}
+
+libafl_word libafl_qemu_input_virt(void       *buf_vaddr,
+                                            libafl_word max_len) {
+  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_INPUT_VIRT,
+                                 (libafl_word)buf_vaddr, max_len);
+}
+
+libafl_word libafl_qemu_input_phys(void       *buf_paddr,
+                                            libafl_word max_len) {
+  return _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_INPUT_PHYS,
+                                 (libafl_word)buf_paddr, max_len);
+}
+
+void libafl_qemu_end(enum LibaflQemuEndStatus status) {
+  _libafl_sync_exit_call1(LIBAFL_QEMU_COMMAND_END, status);
+}
+
+void libafl_qemu_save(void) {
+  _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_SAVE);
+}
+
+void libafl_qemu_load(void) {
+  _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_LOAD);
+}
+
+libafl_word libafl_qemu_version(void) {
+  return _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_VERSION);
+}
+
+void libafl_qemu_internal_error(void) {
+  _libafl_sync_exit_call0(LIBAFL_QEMU_COMMAND_INTERNAL_ERROR);
+}
+
+void lqprintf(const char *fmt, ...) {
+  va_list args;
+  int res;
+  va_start(args, fmt);
+  res =3D vsnprintf(_lqprintf_buffer, LIBAFL_QEMU_PRINTF_MAX_SIZE, fmt, ar=
gs);
+  va_end(args);
+
+  if (res >=3D LIBAFL_QEMU_PRINTF_MAX_SIZE) {
+    // buffer is not big enough, either recompile the target with more
+    // space or print less things
+    libafl_qemu_internal_error();
+  }
+
+  _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_LQPRINTF,
+                          (libafl_word)_lqprintf_buffer, res);
+}
+
+void libafl_qemu_test(void) {
+  _libafl_sync_exit_call1(LIBAFL_QEMU_COMMAND_TEST, LIBAFL_QEMU_TEST_VALUE=
);
+}
+
+void libafl_qemu_trace_vaddr_range(libafl_word start,
+                                            libafl_word end) {
+  _libafl_sync_exit_call2(LIBAFL_QEMU_COMMAND_VADDR_FILTER_ALLOW, start, e=
nd);
+}
+
+void libafl_qemu_trace_vaddr_size(libafl_word start,
+                                           libafl_word size) {
+  libafl_qemu_trace_vaddr_range(start, start + size);
+}
+
+static int init_afl(void)
+{
+	vaddr_t xen_text_start =3D (vaddr_t)_stext;
+	vaddr_t xen_text_end =3D (vaddr_t)_etext;
+
+	lqprintf("Telling AFL about code section: %lx - %lx\n", xen_text_start, x=
en_text_end);
+
+	libafl_qemu_trace_vaddr_range(xen_text_start, xen_text_end);
+
+	return 0;
+}
+
+__initcall(init_afl);
diff --git a/xen/arch/arm/psci.c b/xen/arch/arm/psci.c
index b6860a7760..c7a51a1144 100644
--- a/xen/arch/arm/psci.c
+++ b/xen/arch/arm/psci.c
@@ -17,6 +17,7 @@
 #include <asm/cpufeature.h>
 #include <asm/psci.h>
 #include <asm/acpi.h>
+#include <asm/libafl_qemu.h>
=20
 /*
  * While a 64-bit OS can make calls with SMC32 calling conventions, for
@@ -49,6 +50,10 @@ int call_psci_cpu_on(int cpu)
=20
 void call_psci_cpu_off(void)
 {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
+
     if ( psci_ver > PSCI_VERSION(0, 1) )
     {
         struct arm_smccc_res res;
@@ -62,12 +67,20 @@ void call_psci_cpu_off(void)
=20
 void call_psci_system_off(void)
 {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
+
     if ( psci_ver > PSCI_VERSION(0, 1) )
         arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_OFF, NULL);
 }
=20
 void call_psci_system_reset(void)
 {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
+
     if ( psci_ver > PSCI_VERSION(0, 1) )
         arm_smccc_smc(PSCI_0_2_FN32_SYSTEM_RESET, NULL);
 }
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d6296d99fd..fd722e0231 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -47,6 +47,10 @@
 #define pv_shim false
 #endif
=20
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER
+#include <asm/libafl_qemu.h>
+#endif
+
 /* opt_sched: scheduler - default to configured value */
 static char __initdata opt_sched[10] =3D CONFIG_SCHED_DEFAULT;
 string_param("sched", opt_sched);
@@ -1452,6 +1456,10 @@ static long do_poll(const struct sched_poll *sched_p=
oll)
     if ( !guest_handle_okay(sched_poll->ports, sched_poll->nr_ports) )
         return -EFAULT;
=20
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
+
     set_bit(_VPF_blocked, &v->pause_flags);
     v->poll_evtchn =3D -1;
     set_bit(v->vcpu_id, d->poll_mask);
@@ -1887,12 +1895,18 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(v=
oid) arg)
     {
     case SCHEDOP_yield:
     {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+        libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
         ret =3D vcpu_yield();
         break;
     }
=20
     case SCHEDOP_block:
     {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+        libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
         vcpu_block_enable_events();
         break;
     }
@@ -1907,6 +1921,9 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(voi=
d) arg)
=20
         TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
                    current->vcpu_id, sched_shutdown.reason);
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+        libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
         ret =3D domain_shutdown(current->domain, (u8)sched_shutdown.reason=
);
=20
         break;
diff --git a/xen/common/shutdown.c b/xen/common/shutdown.c
index c47341b977..1340f4b606 100644
--- a/xen/common/shutdown.c
+++ b/xen/common/shutdown.c
@@ -11,6 +11,10 @@
 #include <xen/kexec.h>
 #include <public/sched.h>
=20
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER
+#include <asm/libafl_qemu.h>
+#endif
+
 /* opt_noreboot: If true, machine will need manual reset on error. */
 bool __ro_after_init opt_noreboot;
 boolean_param("noreboot", opt_noreboot);
@@ -32,6 +36,9 @@ static void noreturn reboot_or_halt(void)
=20
 void hwdom_shutdown(unsigned char reason)
 {
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER_PASS_BLOCKING
+    libafl_qemu_end(LIBAFL_QEMU_END_OK);
+#endif
     switch ( reason )
     {
     case SHUTDOWN_poweroff:
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 7da8c5296f..1262515e70 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -41,6 +41,9 @@
 #ifdef CONFIG_SBSA_VUART_CONSOLE
 #include <asm/vpl011.h>
 #endif
+#ifdef CONFIG_LIBAFL_QEMU_FUZZER
+#include <asm/libafl_qemu.h>
+#endif
=20
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] =3D OPT_CONSOLE_STR;
@@ -1299,6 +1302,11 @@ void panic(const char *fmt, ...)
=20
     kexec_crash(CRASHREASON_PANIC);
=20
+    #ifdef CONFIG_LIBAFL_QEMU_FUZZER
+    /* Tell the fuzzer that we crashed */
+    libafl_qemu_end(LIBAFL_QEMU_END_CRASH);
+    #endif
+
     if ( opt_noreboot )
         machine_halt();
     else
--=20
2.47.0

