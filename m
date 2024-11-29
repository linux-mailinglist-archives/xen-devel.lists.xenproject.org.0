Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C19DBE73
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 02:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845654.1261049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8O-0005e5-Na; Fri, 29 Nov 2024 01:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845654.1261049; Fri, 29 Nov 2024 01:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8O-0005b6-HD; Fri, 29 Nov 2024 01:49:28 +0000
Received: by outflank-mailman (input) for mailman id 845654;
 Fri, 29 Nov 2024 01:49:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Fhq=SY=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tGq8N-0004ZN-BQ
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 01:49:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f403:2614::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28de124d-adf4-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 02:49:24 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAVPR03MB8923.eurprd03.prod.outlook.com
 (2603:10a6:102:32c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 01:49:09 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 01:49:09 +0000
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
X-Inumbo-ID: 28de124d-adf4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjA3IiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI4ZGUxMjRkLWFkZjQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODQ0OTY0LjIxNTIyNywic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z34GNJFGFnNbXXAPMvtbQb0evKpwzEyxMo392sjhcHvEpQC+6cXFbqJZwZ/lxtKbR8T6P5lmI7ZZy4eBjnb63GWGQbPv6LsE4QeuBxNzUpeAaxd3kXcwH7UtLamD62DLqNnClTtHkTGw5EpgYf7M/OW5XzHaWECnd5pw/hEuG14XlzBAM4gXH6s9MhPyL6ZjQ4XnakiiYqjlBm7YAibUDVV7wVs+yWin+wjRg/6nzF+kWhllUL20Xmi6bvYEWfqexPTWrq6PxWYA72ZQEix5ClcqMBiI5cpeVn1++320KgCJUo1KqvS9eYtA+VUsfqTRwiuRO9XnvfQFMal/FG9lag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hs4cLe8ALMoWcOMbuIwcvz7KSeSIg6dUhmOy+zBqkAM=;
 b=cRDEIsuNcz5tWIEG3R6UGJqVjlCXJFbJhq4Zjc5h1WtoGXYGTrovq3ycB9t62Hf1pKfyRRJoiR2DbuQxmvcUmQFIuWEabHIWL5QeyQFpBRRZYjwDx67W4B3Uvke3g2x6yZ8Krdc934PGgEb8ef541gjxIL2tQhZ90DfY3HdM3ZjKQHYkhYckXNHQmLvELvp9vQYyCwkeyTJ2dSLRrVpXLpc1nZ+BWTQ77m2jZghhZNrBP0Xtd4uRcJ78NIx+QHEGCqzqZFM/2b+TWSGQZb30aXDkuAGsNQ2pety6FtiK88H8nU6TOKWGnvkK1zVt+M0Ll4zjNJwhNoa9ZWYXISsJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hs4cLe8ALMoWcOMbuIwcvz7KSeSIg6dUhmOy+zBqkAM=;
 b=UokXrngjLwnNYK10D521YyvkboWZRtq1P7yFppSx0ACJnkNZfEdpd7iHoritxAYuGrIwJV7OT491ZmpsI1C8NvY/nk+aVVwkrHYty/DUN0bubPoBkqZpbPCWenC3vIEfQb7dYXgsM6rT+NPPxnAUs6ODjjXcwK63h3lRh+uzPqf2WPs5p183YVs8uOeYFD9TkVWKBO3Zj1AAKEazUgJ+aGqkEuQZPil+azUo0vbXAKJcldpqnk/GvWBxTsydJWty1Qs8d/szHeemcyFXb4X5eoi+8ZE5FeENZsWyiu4biENlBFSVUTYGLTnvWy8538sfEDXbYAWfR7z3wfc6JmuyMw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] aarch64, common: improve clang and llvm support
Thread-Topic: [PATCH 0/5] aarch64, common: improve clang and llvm support
Thread-Index: AQHbQgDhJYzO1RzhGUuu6Awok63JvQ==
Date: Fri, 29 Nov 2024 01:49:09 +0000
Message-ID: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAVPR03MB8923:EE_
x-ms-office365-filtering-correlation-id: b1645f8d-8593-408e-3ce3-08dd10180436
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ywksZYiGWaShgk/Xh0PY4Ub22x7tGN5m5chY/FLWlxv7VZcDEwjwimB+Vm?=
 =?iso-8859-1?Q?Wxq6PoiS10XMzM3sVVRDbJI+DzYwj/KdRhiOuU+Pjpn9gDW/35qItvoAhX?=
 =?iso-8859-1?Q?u0kA8UykGUOQaMFh9nCkTCQ30PI2y/3e5dSPlKNTanIwJwCqXGpBLXm2+w?=
 =?iso-8859-1?Q?+ZG0g8dg4gMUtKFEWxmroIJg6fCh0stYFCNmUl9pCsTB/2xwf6y7sZnPgf?=
 =?iso-8859-1?Q?U3XrhkWN0FbzdMkE9303/quCyh9L+mQ/SmfZeB0tHUQeuqkpmLtm9ZEOfl?=
 =?iso-8859-1?Q?DkYzoYAhsrgA+wgHSDKHF4esRvJTi+CvtQ/4S+EJUdLR5N6VFbpjzq3W1Z?=
 =?iso-8859-1?Q?Aj9EuQhvnTMSmyrBOrNm6uyteSbQTX5boFcdUO+b+cw2lHtr1VCOhV4Pds?=
 =?iso-8859-1?Q?lNR47hC0xl14RtLiZVaklWF01PPvmMmMm4VU0lLTQ5gcYGkygpEgpmunpl?=
 =?iso-8859-1?Q?+mqV1Ya6Mzd9Efh002bENRxlj9RikUJY/kG0fmhFinIANHOtvd2Gk2nvPx?=
 =?iso-8859-1?Q?ACi363eZHjkHeMipDJLN2Z0nVkwxcnoB8AE5x7mzGr2rkT3ZWORHW42fm4?=
 =?iso-8859-1?Q?6R8+kh3imyhYf9sBKwR5xARvxqGx/vR1jev8TWn+NLlCjug3L/zN9q5gz4?=
 =?iso-8859-1?Q?FV7F4is5L2g7ZZYzLMUCqrpMFNUCdPIT8toWkS1abBqohF/5WUVZrd9Lpo?=
 =?iso-8859-1?Q?C6fG3Yrw0aMz51KWXsZrzCk0VdnGuCORwxz7n7iu8K/6xaBy89G5byiq9Z?=
 =?iso-8859-1?Q?+huvYM436Wd0hRK2cDh0elBTBvEdSXENsc+5ioN4o8I3bypQFLnsWeH7OI?=
 =?iso-8859-1?Q?r9qVxb95OFypkF6A5GIVHgUO/GS5yr4tgXWrIE3EptWP5xJY3mmAHPWnZz?=
 =?iso-8859-1?Q?m9MqCgyBzpU1aAmf08kIUpL6O1Y2LulbheUgoiq2NlDzOwA89Zin7q6ymm?=
 =?iso-8859-1?Q?9Dz55ATwrM6Qc77bcMfM6sFhtwvGrA21YS0SwSTxtzxsa+Q7JhtOtPnDAK?=
 =?iso-8859-1?Q?ecl1y5ie0+xEZbBRFy4HDpNP69EpPI2g1wewu2FPcQNXC/gKxbBZRh81sc?=
 =?iso-8859-1?Q?tg2V8T+cVmmoPvX8NAGVcZOM//xh5MFPr9dRLsXvSeb8m48XKYlDu3LDlu?=
 =?iso-8859-1?Q?MnvlNEyGx7HZEjF0JTTJkiwAAPX8ZzUk9qSWVIaAI1tLvrdCXY0T54ekmH?=
 =?iso-8859-1?Q?CxvUEyYzvWl8zr0wjjjSqHsyuiotT89nyz8b6Fs9BFXYQQbMmKgcZqs8B6?=
 =?iso-8859-1?Q?z9WioPyVWI6zKX2I50K+7VhxGnWu2Qq4Yq3oqJ+G3GT2oeBuaG+F2HtThj?=
 =?iso-8859-1?Q?GaHADfhX6UeTT6jDaSGBE5rjDtPe11B1LIVGrL4zmbu7aEWbY85mgqs4fQ?=
 =?iso-8859-1?Q?KvuvXywmPqCFi7oTt8z0ZwZ0XLsh4Ti//Xp0KqVX+Z37AJpSLAot2iJyKx?=
 =?iso-8859-1?Q?AHY43UGx4+ZY7SlQJgk3O7VZx4nr/ihK47g9nw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?I9JsjKvh+nuLIJbLT3SuL8z34Mww/+Hg1Q8yS7B3WIZgVyzz5n/eLJjOj8?=
 =?iso-8859-1?Q?0zOqoSIUkZbSj/cpBKLlZhhsfs06HZ3pzSurlhIv6TrNi7/OzRezUfZGBb?=
 =?iso-8859-1?Q?hyjA6gGeH/BgemNJ0oR11Z+sDRUzg1CAs04A+ADHTPkOESgOKqAJQKavep?=
 =?iso-8859-1?Q?1iEfL3AbI3TIca14P6n07F8gmbW3fO+7vjaoDdLaxqGKVHjV1vZogBzdcW?=
 =?iso-8859-1?Q?xWwvONq9G07EzX9XwZ9j38a0r2+8mP5tmuQGdOmcV3oKhrBDyJNlm86Lar?=
 =?iso-8859-1?Q?a155tY4QRus9JR6vI8hb5Keh+8uLYx8cOKGpLPp1fI9lSY+kgoGF+nTj9X?=
 =?iso-8859-1?Q?rTGYC729NsCxYiX1AIFtJR5cphjOf2HCMhi4T3nDjqmmH9DHUcTwRMElrU?=
 =?iso-8859-1?Q?caRla7gKpM7CsJ6811RFop1wBvKI25bVBGh2VBsWJx3fnxDhPjTd1W5mTd?=
 =?iso-8859-1?Q?h5A+c3TGXMOBhn2MjXve3Oo2XfIe6EeZCDE9m+4PorZmZvIBxKQqas5Eq2?=
 =?iso-8859-1?Q?2jEul9XIJruqHwqx0CZCb7SokOVUEkjPKPUeNqGPRAxCurz7wP+XC4ECOV?=
 =?iso-8859-1?Q?b/XjIyPyN3Ph9l3D6FFC/U5gQNbCZrAbsspoVL/8DhSd9ri9n895Ix8kB6?=
 =?iso-8859-1?Q?9VLh40lqJ2r/fuhW5UgEh3+nV3DkgvY4hobVY5NcTf3nWXaDud1qXwcxKJ?=
 =?iso-8859-1?Q?Tsp/qRELsnKZ50DZWIye2/l9rwn+tUHhqzpHROgTPX7nybhSxcr2yUIJb/?=
 =?iso-8859-1?Q?MnaWN8BfE49JuieP8JZi4Cev4iJiGsHwrRTk/iEx/R6LB4FLsr1obgKNGa?=
 =?iso-8859-1?Q?Vm5rI6HEKx2xbJdG0JkXX4qC+A3oMyVOQnHQLxMfXfCJVNjJJWGFu6Enyw?=
 =?iso-8859-1?Q?SoeBsNtu6j6XrQBy6Jp6RV3Xu24H+YAqgzZEItj/w2SgwheacS+n+1jixp?=
 =?iso-8859-1?Q?/NWUr2IUnd3E8br0WE8QCuHn9JUr60cnu8rrGrnMa5HOk6hHud2KFnBHIF?=
 =?iso-8859-1?Q?sEIh8bp426MORBEhgxxmNb8MX/crFXCg0DWQAzMJPRboCm+Uh71JxnJ2RE?=
 =?iso-8859-1?Q?iAUiJ+2Mbw25cywPs5nOcGrP0U9pPKmLhS1TWhrG5RX2Uq4IwXbcaxkEyo?=
 =?iso-8859-1?Q?MM4i9WZzyLSv6lSxFOHUveaN/kEImNb1aEhQ7otWhec5Iy+XRPTw2OMGr0?=
 =?iso-8859-1?Q?pKF5a/xOgK186yMdDRCX/d1ghA1OFN4f3337MX6eOSRJx1Zf4f6S4xvl5L?=
 =?iso-8859-1?Q?vHj++ajRm2c7ugTZ+Yr7/o+BBTdMUF05KnSsTbtCV+jrvv/98zseShXD3m?=
 =?iso-8859-1?Q?FAGdcDjcgx4C1cgdFnDQj44AzUuee8Cumc0pkAC1N2BxC1nBavis+BjLpz?=
 =?iso-8859-1?Q?qHxba0vQuYlCTE7Ll+2Yi+h7JRvIXWJZSzc4KdJFt9asfGiOR5sC6JiAVQ?=
 =?iso-8859-1?Q?khD2WApFD6Ar5VreUytpdXrc1VAzmJJgVFnokY0F87UjQplAH6Cv+8XDvn?=
 =?iso-8859-1?Q?Hn7hC2nZikfY3cyFlqh01wP8C+ULAtafhqlVlUyOl4RnH/IExC+fA2DP3L?=
 =?iso-8859-1?Q?AEr+ND70nIc5T1FURt+eH2CkXsRDk3JyqW6693xCxDo/vwBpAC6QZb6cBV?=
 =?iso-8859-1?Q?9AUeouLM2VZyNm2X6CLtap2arDrIRQvZtoCHwQ/uYltOvt05MmX9CLsg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1645f8d-8593-408e-3ce3-08dd10180436
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 01:49:09.1796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x5NkknMx7rzEUGbBA/UG3Gjhl8iuwjDvxfhLAUmr0eYOqfDq6NWgqSgK4YCV5YpJ7P9ARQj/60fiWLTlxGTnraJH1dwYCT+bV9zUHtG6Rik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8923

This patch series addresses two main issues:

1. Some errors when using clang for aarch64 build

2. Unability to use clang for cross-compilation

While first problem has straightforward fix: add -march argument and
allow to use FP registers for vfg.c, second one is much trickier. I am
aware of the earlier attempts (like [1]), so I decided to use
different approach. Bscailly, I chose to use LLVM tooling as an
option. As LLVM tooling supports cross-compilation inherently, we
don't need to use CROSS_COMPILE varialbe at all.

  make XEN_TARGET_ARCH=3Darm64 clang=3Dy llvm=3Dy

Shoud work on all host platforms, although I tested this only on x86.

[1] https://patchwork.kernel.org/project/xen-devel/cover/20190327184531.309=
86-1-julien.grall@arm.com/

Volodymyr Babchuk (5):
  arm: bugframe: emit msg offset only if msg is present
  build: add possibility to use LLVM tools
  build: arm64: provide -target and -march if using clang
  xen: build: add support for CFLAGS_REMOVE variable
  xen: arm64: remove -mgeneral-regs-only for vfp.c

 config/GNUCommon.mk            | 16 ++++++++++++++++
 config/Linux.mk                |  4 ++++
 config/StdGNU.mk               | 18 +-----------------
 config/arm64.mk                |  4 ++++
 config/llvm.mk                 | 17 +++++++++++++++++
 xen/Rules.mk                   |  2 +-
 xen/arch/arm/arm64/Makefile    |  2 ++
 xen/arch/arm/include/asm/bug.h |  4 ++++
 8 files changed, 49 insertions(+), 18 deletions(-)
 create mode 100644 config/GNUCommon.mk
 create mode 100644 config/llvm.mk

--=20
2.47.0

