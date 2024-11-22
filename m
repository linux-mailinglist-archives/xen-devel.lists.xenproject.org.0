Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2A79D6538
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 22:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842004.1257485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEasV-0007hn-GV; Fri, 22 Nov 2024 21:07:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842004.1257485; Fri, 22 Nov 2024 21:07:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEasV-0007g8-DT; Fri, 22 Nov 2024 21:07:47 +0000
Received: by outflank-mailman (input) for mailman id 842004;
 Fri, 22 Nov 2024 21:07:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tm/o=SR=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tEasU-0006xA-Fy
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 21:07:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f403:2614::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d15de20e-a915-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 22:07:44 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB9738.eurprd03.prod.outlook.com
 (2603:10a6:102:2ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 22 Nov
 2024 21:07:34 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 21:07:34 +0000
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
X-Inumbo-ID: d15de20e-a915-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjI0IiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImQxNWRlMjBlLWE5MTUtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzA5NjY0LjQ4NDcwNSwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cc08jIfohAxGrqPd2m7uaZ+ID4ut1zGkoJJgv1sDdyz37eaOi4mnR4zlGaldvffp4fYHiHzvnBcrInp0TykLtMsxscvszdcEsTA02mrWWjdcHVHBqUI+2P1rlA7tMgAKVYdVZrENh0TyVNtrkHHObePxYxXGUwggUf+YDmbJnw23iSxZSw5GEEjY68eTdo0CEzHq2lXLHFoTZHh5WMweSx6HMtc+FmEpkR/lPI0MzI2TfQrhmTFqqYjDdSGjYlnDbhhIvg/kPEIxaeqQpHejXju87s5PgkAE3IZ/Ic+gOzRb6u1kj0C3//4f5JROQm6CWCHHPukEEbdEl0S10RLPHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNLjq8vKDQdOVp6utg+lFA4xZstRQk7PIXTXtcimxyI=;
 b=E01hlIWj/eTOKonvNibrbU4UYzF+vMb2XwJFwoOfk/8BPJAgjYEnxdJkTwfPAdGaYYZTAAWNK7V7byG7LOYTiN4X3tCTzv1F88h9GEpObquM1koSDRM+j/Nw0m9l8jwuFI6xyxbz56QGrz+4GkGE0rUapPnNXHyqBO1WW6VuAj0SCwg8rUubt6Msx+kpYvy0MkvbNz3tbOwr1LfTeqlNP0i7HwAZJ2dExXXBxWfNwJEBxpzPfPTsl0m6YblnFUE722pE+ZP8RtoviQjDh7hINlRs1uwWH8uEpWEsSgjFrucLzlJOllxBE30LJj2hh/yKAu4tGBgvzbjn8fLBZ+X1bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNLjq8vKDQdOVp6utg+lFA4xZstRQk7PIXTXtcimxyI=;
 b=h80nxDy5HnoCjpqdz+JfSKd+vZrddveWYASYi+Ke/OaBT2JcOfxz1snkQKO/WDdnPhsGepIyPe6+EyKn/hDZ8QoFvNeBy1RwNkgVBm1L6pVWkuWAVSwqAdgzzvov16/7IAeZu5aSI9FZ3cOG4meV8t0jZvuCAuZDJDIn3aAXVUIXg9r9tk4RZLiBwHc+wYsLK4404Ixzfn/UexW8rhlvsqzWSXKLyqyjoao6kmpdMLshknyouEATJTxe87cAIm1fG7xL9DG1FAudUlCEpv6sESG0/a8vLGNWIKLvzSA0iFWZBAZZpIZH77q3uogQSMEvQrT67t0Pf49w2mRM03uQ4A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/3] xen: riscv: enable stack protector feature
Thread-Topic: [PATCH 3/3] xen: riscv: enable stack protector feature
Thread-Index: AQHbPSKK7LmLMh+hFUu+rgI8SvJulg==
Date: Fri, 22 Nov 2024 21:07:30 +0000
Message-ID: <20241122210719.2572072-4-volodymyr_babchuk@epam.com>
References: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB9738:EE_
x-ms-office365-filtering-correlation-id: 9021afc3-c04b-4a6e-27e7-08dd0b39af7d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?gfvSFmTDN0jJASxjgOGw44tKspQvz4vljlKLduxbZ023iMxbWImwdl/njf?=
 =?iso-8859-1?Q?BCXCV7pJyul+SVUS1mUPm0jWLENspPZUN2WwtGNzACxXhF60PFwtnB+NyQ?=
 =?iso-8859-1?Q?ApR0ZQ0Pdh8eHj8+R79R1HwuoXQb3G/fO241bxvz+r9o1lj/pKaC7nFB63?=
 =?iso-8859-1?Q?EZPFg7uDNeojHwtYDz11tLkoySEdzcShIAM4/XldOUwUwY4yadQsHj8t+g?=
 =?iso-8859-1?Q?m8SERasOTIEV0PwM6EYH9krnlUfTCcq+Dd9IfhaVPyqUBfaJRKLT6e1Zn6?=
 =?iso-8859-1?Q?oG9gPokRfNDM/NCDfAzeXfRIKaFt+VtLuSdR7h1FZYq9TshE34/yD715hp?=
 =?iso-8859-1?Q?s/zHVBBZN+q2B7cvdSqdENeyYchRuDocTL54PD1c2bIIaknxHX9SX7/tA8?=
 =?iso-8859-1?Q?GQ1fpG7kzEST7iYUK0G2EIWcjm/4gIGlSQqHDtlS7iIqwRLGgoZgggGn8U?=
 =?iso-8859-1?Q?jXUWPX7MZrpB3HvD8QjMBYTNXFwEJnrkLo4DtaXIJP78ra3tpEKicxFQQN?=
 =?iso-8859-1?Q?opdTj+hgwDQH1lZmR6AFArB+NFykXmGfe8pII51IWOe7IU1U+wXEamTCZk?=
 =?iso-8859-1?Q?8eH6Mtir9AkKtj0OynjuJ+Wcnat/90H4aZIGzncKauAlGJLPxqk8j6Ik4n?=
 =?iso-8859-1?Q?Q2Ej0Ya6dNzFSiK3v/Vz2qpmv+wBO3jst4UNOq1WknC/0NtwNnxM0gAMYa?=
 =?iso-8859-1?Q?bspgPBWUX+H6AjBiQ0YAb8oQ0s9l4wgFNFQc772TU4t3CYTG5NnADwcvaJ?=
 =?iso-8859-1?Q?1eBYaMxe9Mvv+Geu6nNdYolPANSGIn5wdZVwiymm+B+vDrx5uGGvgIpKP0?=
 =?iso-8859-1?Q?hmchAJztNyuzS7S1igB1evaHzwBdEALi/Oej/18FqB6oVrmK97+YVTZ1j1?=
 =?iso-8859-1?Q?0nkWrg+0LxDsieD6Td5bF8hHD8E2J7EHac0HGDPgP/OOQQU/9rmUmM2ZN6?=
 =?iso-8859-1?Q?EpKU26bnG7fA6AuPGRJdY6uNmlNnOFBivA9hxyMO0Gp2DVp3iKZxbx70y6?=
 =?iso-8859-1?Q?DbMyvRhp5YUFQNp3o4UXFRorf5lF34+dDNVksLPtd+/7HUygxUt0f0/sPe?=
 =?iso-8859-1?Q?EXq91Nc7uy+p2GJzJpcvZ6ViCYiB9Z4GlwSI9aYV8ypjDk09xbwAUy/QSL?=
 =?iso-8859-1?Q?aUeG0YEkGhGybleLRHjGqpjUuxCK5yO/TDwet/0jQfMggHa5buC2L4k4r4?=
 =?iso-8859-1?Q?esy4vId6GarXc4/K7b4m9rW5WkxL/YvJnh6ieb1SD3qnG/SIPQ8ApD9OV/?=
 =?iso-8859-1?Q?BOR10jhua6GignkWJGZQ2Muqwv576RF7KHuRYF/Hrtr2ZSwlAcFIvqH4RL?=
 =?iso-8859-1?Q?jLoRFp3919VSHfT2yajnQ4goOxz5zUTSaYy4FXju6/HCJAam/My9cjbdXv?=
 =?iso-8859-1?Q?YSf1bgCgf8/D3BPbpGYveTnG/1uodpaQLTna8MQIqJ2vw8pjpnRvc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TVkB6YN8SxXyDh3744jI/T8IGN96a0VTC4bClbj5l89rpKt0n04jckaw6Y?=
 =?iso-8859-1?Q?sUFRQ9y+zcBoSSxc8iaFNnKY6lE+QLuPIlaZ3G6LTWAjRZB8SUT/lTJ8qm?=
 =?iso-8859-1?Q?VWtZGrCWDv9PyP7zyjrzcRUFFUTu0gsxD3p4PCcx3AelSO26I47bGE/4oX?=
 =?iso-8859-1?Q?zqHS48f/uLl1wGVRZ0UnTLDKCjZd3G4Fsp3Px/remgA/yKn2FB9MqPvTYK?=
 =?iso-8859-1?Q?r66yqw5CDZPkYDvD5H+lCmUzj7P9d6YxdEdOuhlOZxgWk9g3wmHG4XSaP0?=
 =?iso-8859-1?Q?YOWkyCtv/gryyRiQsodTwfqoacG728uczKPBiJ/vhF5VTSUCp5TIal2va3?=
 =?iso-8859-1?Q?v+Dd+9HvseVGTa3KvEpR6c/xe3Fsu90Mz94lOo+MKUwqKyosr413iDPn4p?=
 =?iso-8859-1?Q?YmZAwfd+fpUiBSaP5MWiqDFpUixZ1WnzGMPCLF1+NYNFT3WJdXNLibMAeo?=
 =?iso-8859-1?Q?x7De+I+S3MZO2dQ+Ar8zPL4ERpNBZSvozx2PObwa5AnX9ewhz9bm77XAjU?=
 =?iso-8859-1?Q?23SD9XhX5ooWHX6IoEvB5DTjY2N3vBpWPMGctURhJV34evbUNK4ITTpwCY?=
 =?iso-8859-1?Q?c2urPcX/XrGm3MOkIC92wnZGbumeGDR1v1lNRfteVqhWN8YlvrR/+D+M6/?=
 =?iso-8859-1?Q?TjsRhHguu7zeqYW6Ik55YFOruey1y3Mq1HqaGtUD1iim+rkU4a9aqDtWsX?=
 =?iso-8859-1?Q?CddECnloN0Bj3HDzV0vrGnIdCn3OwAejsiSQkvRhKEHriuCVE380z5hdCO?=
 =?iso-8859-1?Q?MfVmXipe3dJljuFOr2T7o3YgSvvcch+S7BWmvX42t4mVIBevy9tMWNZTI5?=
 =?iso-8859-1?Q?F0jcAqJekBFAALu/1z97IFoev1Yju/RasCrB71cqCGSUIiKhVLGvuux7VR?=
 =?iso-8859-1?Q?V4WlLeZfWJtey6KSdVWrkbvVvKTI9qFVBlt+CpkIDngTMxbk9oUSSZEt8A?=
 =?iso-8859-1?Q?su6YQKCTIHYfOW1doSumev7mZ2q/S95Ot5QthP3g52LGkWXQpAyqIwucbE?=
 =?iso-8859-1?Q?K2etWL0WWfP9y1dPaIsG4kG8CGxtR1L99+YmhZi0PbEfvWd8a+rnVZX9Q0?=
 =?iso-8859-1?Q?gr9VyiSXTfcXM2x9bZC0/6+9ddWI1MKtvFaffLC1AvuznNBn1mE7LGGSZS?=
 =?iso-8859-1?Q?Ky2HsEmuaZQr2q0cIRt0C2TAO7iIKBHiFuTK/krcoM+nyzoNL1KuDxAt14?=
 =?iso-8859-1?Q?6Gne7LqDBmnj/DhttfXWziX4UDF9udT+1bwg0/98nTce3g9X3RStZpADAq?=
 =?iso-8859-1?Q?8cnlPqpOTmPxAK2/plglRDg7Gx4GVMdWPnNfauO/F8oBxGTeAXkzyf4n0v?=
 =?iso-8859-1?Q?/u6TQitmYYHPmuNmm6wei+Rq4SGAlH6nbAVoaV+bMWgOa+PDzo4Xvmy0Eo?=
 =?iso-8859-1?Q?n/kxMVorlEYZGSDNy8+7aP2id5CbXlJfyA2Ki2OavbYN1gQ0QXLmTf3dJN?=
 =?iso-8859-1?Q?jOAE546fOWQOpb/DbmnDI7o9s2MeLUB/N7bACRQhQYZ8M6eH/rm+lPsf37?=
 =?iso-8859-1?Q?m5rgDACruWGhmKMqEB6mfuGDnW3Oe3bmhePgZg76/U4OueDi63bpc7Awbj?=
 =?iso-8859-1?Q?oi+9N0fuMzBk3FJPFkAsfapgHgJHuSX0HOf2Ff3t5QAPiMzmJpO++zkV6E?=
 =?iso-8859-1?Q?LMHksXbXegWvsyxPSNeJil1acLJA/vrMBRPl+3AVAgmMoqVq4enB+rBw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9021afc3-c04b-4a6e-27e7-08dd0b39af7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 21:07:30.2212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UpOkUQd1/b95pJhxZaWSKVqshQsDw9zPAr01nWxFrfcWuqYH8y3u2rA1sC7EQYNL2y7hlaolqaTRK2PxKfIqdA3WczEvrgXIEFenQ7cKo24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9738

Enable previously added CONFIG_STACK_PROTECTOR feature for RISC-V
platform. Here we can call boot_stack_chk_guard_setup() in start_xen()
function, because it never returns, so stack protector code will not
be triggered because of changed canary.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

I tested this patch for buildability, but didn't verified that Xen
really boots on RISC-V when this feature is enabled. So I am asking
RISC-V maintainers to provide feedback on it.
---
 xen/arch/riscv/Kconfig | 1 +
 xen/arch/riscv/setup.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 1858004676..1481f23b66 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -5,6 +5,7 @@ config RISCV
 	select HAS_DEVICE_TREE
 	select HAS_PMAP
 	select HAS_VMAP
+	select HAS_STACK_PROTECTOR
=20
 config RISCV_64
 	def_bool y
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index e29bd75d7c..cd71748d2c 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -7,6 +7,7 @@
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/shutdown.h>
+#include <xen/stack_protector.h>
=20
 #include <public/version.h>
=20
@@ -55,6 +56,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
     if ( !boot_fdt_info(device_tree_flattened, dtb_addr) )
         BUG();
=20
+    boot_stack_chk_guard_setup();
+
     cmdline =3D boot_fdt_cmdline(device_tree_flattened);
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
--=20
2.47.0

