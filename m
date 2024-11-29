Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759639DBE74
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 02:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845651.1261045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8O-0005as-Fh; Fri, 29 Nov 2024 01:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845651.1261045; Fri, 29 Nov 2024 01:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8O-0005Ye-8A; Fri, 29 Nov 2024 01:49:28 +0000
Received: by outflank-mailman (input) for mailman id 845651;
 Fri, 29 Nov 2024 01:49:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Fhq=SY=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tGq8M-0004ZT-3F
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 01:49:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2614::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 288545b5-adf4-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 02:49:23 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAVPR03MB8923.eurprd03.prod.outlook.com
 (2603:10a6:102:32c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 01:49:13 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 01:49:13 +0000
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
X-Inumbo-ID: 288545b5-adf4-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjFlIiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI4ODU0NWI1LWFkZjQtMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODQ0OTYzLjYzOTA2OSwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oh6dRaKR+VQMAflkQkxW2DNMvqXPAMFLySxJ5CEFq4wgJPtg3hS4mWWJyl5oYGgdpNzznmBbxN7lzG+1KKOPQqkMhemxb5q6BkvPjcHPvDyGeEwesTCSUw/BGItx5WO+uWhfl3Gdlh5yIKDgKFCelBQwrBWBrJ7Yy7Uf6lQuLHkErU7eWAGw4WxJZWXSprXnk2Xs+Cp8xwwEH1A40xU0EHuQLGV6AhG77tbOSzHz5708SgOlw9bUrPx6tPTLm/3UtXwjx5Aw4ewRA5+n+xbAIt0/WNHjfo5w1sxfvdXArIJQteE73q17JqGhClKrgyqTEkvVmiNahc4HiASz1lVk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPCV0KRt10rVJH/0K9SWhiiyCsf6ZgnkvvhOIytXR7E=;
 b=PzWzCOu1lP3pwQPSWNOV8sAui4i8AkF7t6AqSvvDKErogzBq3p7PGXa39Pp93fUd30PjKM1jecEwnin0ncOWd4u6W9pwqV1i8g/T1tsaXda9pwd9AePeso/LDwbSqtTNkAgdVs1zAODYtzKe+Y1HxaXUDwQvzggepZ9MACBW73ULu7cXmC3Gyvljl0ys7cCIe9ZRMS9KalYGCM8t3mt4BtqTSImBNPqVldC8DxQm7cS8481E+siB8VezSKFpVZJFQ0hfiSQWLLt4rKdGocXZI08jc8f5pAxSWrIpsP9JuUMQ6C2BV/GzS82gbyuSrBwLakzY1sKEioIotnmv4+WgKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPCV0KRt10rVJH/0K9SWhiiyCsf6ZgnkvvhOIytXR7E=;
 b=YMYb/U8Lywm4S0IKT4zxkwwIdatE016Q2JOV7K2mfu9AQfmx08EbhRfvPvF69YNsB0TbwBlWe52WzGXd4ZMOPXnQJ1tm1JpNTW1DFWgv5A74hbmLvR7sG6VvNlDr6eIJ9kR66eyjXHJk4P75OcnDqjAjARL+Ny44eRlXLOi9WnFqe8+cUfWPJPPyPIo92BxSGdMzLkq2cl3lPWri/G61Sn24I3WoPtnqu+6KsVmaMpwRUP8xqgJ+PgeckFuTt0deiGZ9j7S7phNmI2QTIg2qZS9GrQ8UHmPLOLNtjBpr+7wRbqKvDcqmJzcKNvovHjepQTPssB919s8I3fTezldFIg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/5] xen: arm64: remove -mgeneral-regs-only for vfp.c
Thread-Topic: [PATCH 5/5] xen: arm64: remove -mgeneral-regs-only for vfp.c
Thread-Index: AQHbQgDiyfh8gYRhRECvxQLXM9bgDQ==
Date: Fri, 29 Nov 2024 01:49:10 +0000
Message-ID: <20241129014850.2852844-6-volodymyr_babchuk@epam.com>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAVPR03MB8923:EE_
x-ms-office365-filtering-correlation-id: 5dca9183-548e-41cd-3b79-08dd101806f0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oSKJ4V0XfCqexXOFqRrCYyCNTJU9YxCWuIZPzBefNSE2ir3DFuH/FsMtiZ?=
 =?iso-8859-1?Q?ktV6eOg8pK75uJVFfqsKWfVP4nvwTQqC79XYzAB+VbUPQPi3PjTml/H/C7?=
 =?iso-8859-1?Q?cgzD2+DxbmlX8osg3qQoG83UE/658wdvRmxf/Sq4Ep6OIBKO/rs1AO2WNL?=
 =?iso-8859-1?Q?PqMXnOg67aJPMn+E4hQsBfprNpQbJ4YZ/no9qHOmwiSUXzBLqOY6NQiq2B?=
 =?iso-8859-1?Q?szwZB1VujP+tXf2FC7cRSBQtRRzUFnqyKUMA6VND9+fJrQhl1vygQGLrxN?=
 =?iso-8859-1?Q?nlOilnleUhn/H1S9ALdn9eMgPKp0dF9jmw/87WYVb4kHS5RCTBQjM59Dwx?=
 =?iso-8859-1?Q?GYH/ZkFaBUyTJEL37xd7eOl/3dvJV6MRrhWxzz/ChpteFFswXIIGtrtg5F?=
 =?iso-8859-1?Q?jW6UdQ/aZFpzJu6elJKeHGpPzthuaMZQ3+Hit4bzzBGxIzW2cOASUP218b?=
 =?iso-8859-1?Q?/z2ctTWFbUc0rtADjPtP6v2enptiWBx523wgqHCThimsdwJx0TrOXV9mfd?=
 =?iso-8859-1?Q?Svms5cRJyyXRJBT8izQ8MD6q5hAEr5UTACg7qWEU5UIIE2L9xzbKWcNFD7?=
 =?iso-8859-1?Q?YWbl8G8SnwKy9TkUJ+hDw5TJ9B+OdKYjbOdmjjV1NCfJO5FEZZPZKGFrjt?=
 =?iso-8859-1?Q?rIO9NP+MyEgK0GLByn3GmnSIw43owtVboqD6Ho+ImIQgAnPWEeVq5loOC1?=
 =?iso-8859-1?Q?WI1VVClPXSMLBIh2LYdTgjBPW91EVVJ2nCJ1+L+SdBcjbmdeG52Z/U/sxI?=
 =?iso-8859-1?Q?HTKfKTBifrWVYarJ3++aV8pcLLi/3N/IhWb+52At/ZAokK0YQEeoCHZG0h?=
 =?iso-8859-1?Q?QH7EUfwgNSwyZSvaLrOa29L6e0y/T+kwIR7vmtBIsMjJcYNG4xE8vZsM5v?=
 =?iso-8859-1?Q?q8aiBSVy9+2PO5oNxJ0a4meFMf4+3Pp2jKlbs5ppwFKWkEOKjlUI8aoPXK?=
 =?iso-8859-1?Q?+HWh2b6gd/xa0a/yXdzJ/mGS37OeVwbkqP7UX+rbg7HybYpOMwOQ3AOQDU?=
 =?iso-8859-1?Q?ulZFyEgk4AHSBejDYKK7AcOecj/8SwPIvGb3e33uBUSF4wBVNwKDE932Vj?=
 =?iso-8859-1?Q?M8woKUSaEReyhysQRvesNuwIfqzzgZNv9Bp1SW6beWRG8YmOcgZkOnEj80?=
 =?iso-8859-1?Q?7xUBBoxuKaraJ8V+S1rRjuVd/ZGSXlp7575VEk6JGIhSrKUNF7rkrW4E2T?=
 =?iso-8859-1?Q?wxTGv/dTEgkvniFMRsdWZRUMUynfRUUMOC8IL90lrFaSKff0Riw6QdXZLA?=
 =?iso-8859-1?Q?1CpG3YQooPVxAvE345tGO6+ERcZ7uRV5FVBKQnGjwDltxkesd+5AMfPXoi?=
 =?iso-8859-1?Q?pQYhulEfh9G+eRZ1ekRnl3AWVZWcmTBH5wW4fEjF4KrsQW6oAs/CCZuIMA?=
 =?iso-8859-1?Q?RnCSWWnxA1WFqibfqic/r7DWOxyCA3/KTNuwMMIEU45hK+MHsRlWGPrJG8?=
 =?iso-8859-1?Q?jIbrwOc7uuLHdX1XTRMwMl3Q5w+oPa6EoPoaPQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PXoL8CCVdolB76JtMkNI/R0wsNOPw7ta9AWl/CBZazr9y+ivnOvWD1IoGZ?=
 =?iso-8859-1?Q?SO8rPm8JF2jRKhBtfbE/DtJFpS4nW/b6TjKiH/kwuN2IqSnuUCqS/XNmfQ?=
 =?iso-8859-1?Q?Vzgpn9T9eZFzZfWrc709dxMpuCvN3eImoLUKiUuFmxo8BQgSiYJc5oEfT8?=
 =?iso-8859-1?Q?cSRCzK5YqUcZhG6ZEMS74963NQjZzzwUMiYza1oACL6u2+scNyTmYVC6NM?=
 =?iso-8859-1?Q?xC+b3EZCazusYQJfYS9FzP4QJTs3RPawm4HZNvD55pVZYc+1/7D3rEsd3j?=
 =?iso-8859-1?Q?msxEjT1Z7WH/2K8LyZoVeIlTqoVf+2cOZTygTe7UNPBLVTurmqZYN+s5xC?=
 =?iso-8859-1?Q?Oy6t3AG53UoDzTNXgHZxSA7v0mvXihvJsw0sUerzo44/aSwpUPNgkBUPbM?=
 =?iso-8859-1?Q?ImzLeQy91R1DUIvuKkk/hOhPuN3f35JpapTqcKF9Tvaq9KQ70xWnvHjRFs?=
 =?iso-8859-1?Q?ke9droR+Iqq0RI4X0QH8uOVloraLAN0Q13yCh0fwg3rz7foDvDoc03EwJd?=
 =?iso-8859-1?Q?LZJAEeQHUQ6AnbNNN2+PMdv4veaiCJXpVMdnzwtGCQ+73DVxVpNc7oU2S4?=
 =?iso-8859-1?Q?XQmiVCRpVQMXWgD9Ys+e+40F+En7ifoJPkTJ7Dq8B/nV4xExoyuOl1Sq/Q?=
 =?iso-8859-1?Q?k6DRHOEKFvoMPuQZfFNQrg2zKtfeu9LdhwlfXQzgRV99RWGJcDRE+6kBqx?=
 =?iso-8859-1?Q?Sg++AdrlGuPw6VRrCKNAoeVLgnU4RKR7N4g4dpkDonBe6BrMO9NzXT8s2Q?=
 =?iso-8859-1?Q?VgcI0ziYJUzbBMOEmq1dIPJCFMDnO3aF1fp3xKZAbrWwpmwqq3scm6WoPP?=
 =?iso-8859-1?Q?YmIzbOO0aW63XTxwSCdJ6mz0GWs1nKOrohoLKpA/G6GQ3JeOLzXzWqGwsn?=
 =?iso-8859-1?Q?f/JkduWU9nzXHeTNYRvspsZoMZMWTKT44dib4yfm7zVTxUKrYdAAEg0Ajp?=
 =?iso-8859-1?Q?aMeCG2BXj4gtvM5xfNqgPHO9fq2BJmI3KpSrWjTvqjJxd4+rioHJkidL/o?=
 =?iso-8859-1?Q?xgWHuyUSBZ/ATqh9EM787Bt6MygbNyfe0GsCUB40gAvuLZd65x5MdJNszO?=
 =?iso-8859-1?Q?Hzu0GF7GRKcKdGfcb6l3Yx+Wc7MHQaTGIGsJDLMLGHPDWpHoI8muUCrOI+?=
 =?iso-8859-1?Q?vxCxwljyPSUGiXQ9zDQ4J70p4NvmJSZWeiAUI+f2VQWQ8m6wYYytRtlrRj?=
 =?iso-8859-1?Q?j0p6f/eDz57PO0GIfwhln1zOAY4bH5nclFeLM+VlU6GWOF2hvwJczc3VN0?=
 =?iso-8859-1?Q?Mg+XNzkmmg9d9OowUNdS43CIYaJ1I9RWpEJqggB/Om9i+mwndPPej5Dh28?=
 =?iso-8859-1?Q?0Oe0+xpXfwjsCMzM53zp+f0Yi9VVu6VWbDzpES2LLKqZHVfxLVjbSP8/zB?=
 =?iso-8859-1?Q?BdCCVJ7l/iGMidY4gP+2n4X4o0l6CQdmeWcytZRtzjYJ8t8OehP8QevvBE?=
 =?iso-8859-1?Q?WlszhG0Q1QTpCW3gysZLNqNsNjy3uRTyHj6+JxtwH7UZ/bU9U0t27usiuG?=
 =?iso-8859-1?Q?600oiA3Z4ZgBBor+t65PuIFQM1S8EMLnHsx9C+4k5YGa2AgqZGVrIY2RPp?=
 =?iso-8859-1?Q?6wigdYQOxClRlCEZ8PShnhjP/6lzzykuOVqbE8VQKwpOGzf2NlI/muuV7B?=
 =?iso-8859-1?Q?hjNnp3hJg8lsKqjIzMfMxQ7G0UXeZFBIg24Qoy761wtkWzZNa8I5mIzg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dca9183-548e-41cd-3b79-08dd101806f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 01:49:10.8252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7D1XuYr1mQz4162UXjc0dXa7upQX9aqEOsXKqD6iPkxFPBkOPNzz2W1My0h89TdF/eAPaIW2fDLz+F+7PcBDSBMizvbacok8vqwK2iVPfpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8923

vfp.c actually accesses VFP registers, so it can't be built with
-mgeneral-regs-only flag when using clang, as clang will complain
about this:

arch/arm/arm64/vfp.c:9:18: error: instruction requires: fp-armv8
    9 |     asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
      |

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/arm64/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6491c5350b..af949b8ee6 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -18,3 +18,5 @@ obj-$(CONFIG_ARM64_SVE) +=3D sve.o sve-asm.o
 obj-y +=3D traps.o
 obj-y +=3D vfp.o
 obj-y +=3D vsysreg.o
+
+$(obj)/vfp.o: CFLAGS_REMOVE +=3D -mgeneral-regs-only
--=20
2.47.0

