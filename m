Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3719DBE72
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 02:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845648.1261014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8L-0004qW-7h; Fri, 29 Nov 2024 01:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845648.1261014; Fri, 29 Nov 2024 01:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8L-0004o8-2i; Fri, 29 Nov 2024 01:49:25 +0000
Received: by outflank-mailman (input) for mailman id 845648;
 Fri, 29 Nov 2024 01:49:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Fhq=SY=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tGq8J-0004ZT-Kr
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 01:49:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2614::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2566ee1b-adf4-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 02:49:18 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAVPR03MB8923.eurprd03.prod.outlook.com
 (2603:10a6:102:32c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 01:49:12 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 01:49:12 +0000
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
X-Inumbo-ID: 2566ee1b-adf4-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjFlIiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI1NjZlZTFiLWFkZjQtMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODQ0OTU4Ljc0ODQ4MSwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/NYeoodPX6aIEZ1u9xgqbM3jXW3ytc5leLStUgMZGoU8I/cBqvSmPhVLt5OOk8SHeogz3udzN9UP+x8i9/J40JMcqJDHvVyAsfTvm1WWAD1z+KMbKYw5+A/MsnLY20BeWvutVF+Hk30t9DLaCV1IxSHzcDw3mSGYF4i3GCy/hRmlBH/OmWakgEf2FknxgQ/0tZwglWnJeEcF/0Rqto+ZHZ2blmQLwwkPu8XXwlZ13Jw6yPfMlUugNUuTlnH/4VbnRkdVWVv0kG9rHYeKlEFMpb32gVtAZL3GadTTe92Mc/u/mdPbUZK1965UVt1ZO+Rpy4wkiYvKmpdFnkRSPo+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCMS+YbSfAwyp6W6fe7rYKq/L/tFgk9e9zJ/1i+/t64=;
 b=vFfGgkDrldWQXo0G91Zqi0w2OFu+ed4Rod6A4fwECjFbqn6kQ0oHXG759itTYQ9OsuhifbEIsGoFZm9p/dbpNNqeb/n3eypHahWCmV+zzHpTpSxRP4AZlA2wE97WJMms3amnjowCSB/n4mjvhVJeWzq8r4pbcszQnvsM/N0t4SAhzAbn1WwyS2H9gVd81ZEmhqqbZpkChy2C0o0PiiN4Y3PXfDjw+y4tDxzl+89vWa8mZSpZmw3PShOZoLL2shF9HvK+sfIeVRNocj5oay2YawwSyhyY2rUQEZQk9noCFh+bLuRpAFXSsiO0dd/lZ3VQEb6UQ7iIxIcuub2KtrJqng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCMS+YbSfAwyp6W6fe7rYKq/L/tFgk9e9zJ/1i+/t64=;
 b=HTm1s13zkgeDTWCqqWZU/MHES+bH3UDsin7LFh18mzqdw2XHqpgk0BxYYfdnX/ENO2Vqtl/fByj6vU980o6fBN09lfFWgx4IPtRblCOAuSqfvPi+pebdgUOi185QdeKjx75i2SqVPSfnSV49MpWaOaZ1lt6Fe3TstqYtzLOqAawSA4o8GH00qSKg8uA6UCe86f6cVigcjfZewNCgLSCZkfGCZ6qK4Z7NTWLeEytEpUoTyd+RicgpVlUiG+tiIw9SHYAObpb/N3RL0bPqLQ2dKR53RKL6QyISe44W1FLC1yNhB78fecJwyzhFJGKQw5RYM7vP2XZAd1fQOE5/mzRraw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/5] build: add possibility to use LLVM tools
Thread-Topic: [PATCH 2/5] build: add possibility to use LLVM tools
Thread-Index: AQHbQgDi2W51qDW1eEGcI05EH1vd3w==
Date: Fri, 29 Nov 2024 01:49:09 +0000
Message-ID: <20241129014850.2852844-3-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 4ff18fe5-fb8b-4270-986f-08dd10180647
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Aj7v19V43kX/iYnuK2zEVDerSUR7Fa8r/EdGiifgt9FWNnIplneFXSQPnr?=
 =?iso-8859-1?Q?FfJgWYWhBx7T6eUerZQyuFqP4rJ/mep3yQjV5tUgm6LxSGag/+mX3uGNde?=
 =?iso-8859-1?Q?mnLxkYAHEkZrt/P0jfLfhbd5I7llwqdxaNM93Lq9uMOCsyPj+FmW2ZyBnc?=
 =?iso-8859-1?Q?hkpCWlIMcex6NVIa994Ejsxcuw8TX086KD6cCeDwIArrDrJopCISaqdOEZ?=
 =?iso-8859-1?Q?4l6cypXWun3C8mWH4oRWu2zHOzh6TTuzVTuQG5jKIsK/LwsxMU+LByj4bC?=
 =?iso-8859-1?Q?PePTNPImtlOoL0B5b9e0SzJ2LpKQRHTPJblhgxbP+q6PCFWoEd9FxVukiH?=
 =?iso-8859-1?Q?nAXTS5bUi4HACAkbHAHQjPC+IOhS889g1d1uWOrgL+kJTKt1nbjZ1Bt186?=
 =?iso-8859-1?Q?BrsI+DCBfiBeIQYc45vRV8a3EKTE08pbJaD7+P0WE1tihCdsHLUm9bLyly?=
 =?iso-8859-1?Q?VzcizrcmaEO1xWVGsE1BszlPPbaeXWbGi7YuLX/NZgOaBVGT+OQqGNq7gL?=
 =?iso-8859-1?Q?1+Ymgr7VWllMgSMTOTVaWOKHB+SsaA2ETcYYVyAomG3fPyxNj/6Z8hF7KO?=
 =?iso-8859-1?Q?j31UDUxR2AwuhTAXCXGR6MmWH5z9kbYG8h+HJJRozEXthtGZIpaibm03Yh?=
 =?iso-8859-1?Q?MR5lEyMweA9xh+1teXFhgHxt/E8hOQFub9RGsOrtPxKFn4N4ZzmnQvKp/3?=
 =?iso-8859-1?Q?BM0H/P0isVZiDcMhEANM86q7DEgFpFuZ9L+ed7dx7C0p4eJgVZ7q+s4pC9?=
 =?iso-8859-1?Q?poYx+GDBD3LBg0rWYvxdPrjhfDO0ykMetn863QN0o4wf6AH/CCg7mFicD5?=
 =?iso-8859-1?Q?XuCo1AkE4tHc/fwUrmE/COYyN1wpJuu3iNHZu738tZp+hXLTjcCu7+Vm69?=
 =?iso-8859-1?Q?RfQXU2pnzdq4X1iKjwFfCRBjUmIRWQ1C4x0mEG8KwJjBjkyJPEAtBOneex?=
 =?iso-8859-1?Q?lajAzkHbuKuuqYSpd8lycTI29I2U8OY2j0P7E2/scDnzVXA+dbGgbUI91/?=
 =?iso-8859-1?Q?FTb06M+1JNtdEMbKZdF52XL0LqpS6hq/gCdKRZIyVHFs/llhxTAYlEdBEx?=
 =?iso-8859-1?Q?0t8BSNqx9V+8f1Cj6eW8KKZmKqDXFKnQ2ubBCYLkS8M2mqpDbJm8NrGOZT?=
 =?iso-8859-1?Q?ciNqx+JCcRQx/1yL+7bmdG7DsDDu9KHAfpHELvfZK5vE4ygMHLYeNG5XSH?=
 =?iso-8859-1?Q?pC9T+nMBSDYpJ0GfG2io+tOvtR8Po20Rx2cDpIRIyGnZlesNy43Ty6R9zA?=
 =?iso-8859-1?Q?X28TmPel63Iw9xbXCFT9/qlm+FXmzS+uDVI/rKSbWKwrGeciETvyEUZQZi?=
 =?iso-8859-1?Q?67ooK0hNNqLgEGfY32+3Prbds/rwnVBElXywbB06ZnTkXd6BvQvsdBlSEd?=
 =?iso-8859-1?Q?oeK1nNEyg8uL+1zMqcPEzcbYCUEb9GOMFiUR1g4sI2gufkKljQRJErZkiZ?=
 =?iso-8859-1?Q?JYpJBHqUqD7RhBMtDNO/nZuTwuFWKgsOY7kRyg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?n88Tru2V4uwLK5QwMASGGCed10iS+S+idx8EWtMd97IhZPaz1LlLumdHPv?=
 =?iso-8859-1?Q?qaF35ds/XpxMd16aNczAGOjrDtspMQAcyIxyi0sXgs8RMZKP4O/f7eUhLg?=
 =?iso-8859-1?Q?kXth9E2mwguyxmropACaD91RukLf5k3WNtVYTxle572l//ndyPyLDuhG1M?=
 =?iso-8859-1?Q?LmWZXNPczpg3AhRU0gi7cJcaXmW1SH5Zet/fvQoN+TqxApksFpWaed21Xp?=
 =?iso-8859-1?Q?/xUSK9BJMbiRB/2AhjtkySQ2tYYCNQk2j8jlwlviOtEIaDGG1OFj7YeMO+?=
 =?iso-8859-1?Q?+OPQjDcxmkM5jc6FfABLTuad8lidWxWzcoDAJXqq4NDeKzx3mSHkKbtOGA?=
 =?iso-8859-1?Q?8TAUhG1g0jmVeKkFUOYmsgdBLCPixTB8c0U0u2kTIiuC1IlW/49RtlzVni?=
 =?iso-8859-1?Q?BVxX0ICvIBYl+jT24mQpEeugRw0MCZfZaTXVZX1no2p5RNCbJDE+UkmAvj?=
 =?iso-8859-1?Q?e8NGBMRxQpy0Y64AXoNXCke7TibcqxOG+uZa2zlnIeE5Q4PwQMSuAoRvHa?=
 =?iso-8859-1?Q?75sA1OfJaxtl0cuxMypwTBQ8TMyOCMf3OmJSTvaJGMKd1DuS0uDpXbkDp6?=
 =?iso-8859-1?Q?8n/KsXvokJRMlMJVntE3r87Y7IawfjwfQpwDXHowl8tIp7M76SnRr36r/W?=
 =?iso-8859-1?Q?T4eVHdjaHfAGIM22xofU4F7jCK59IGXdgLJcHBuSa9YasRC2Oer+Y/WaVn?=
 =?iso-8859-1?Q?KQIbMv4HgdnrChEclWd/KWTBqjjT58BP614aTPZ1BSHt7K0jCU0V4cShF4?=
 =?iso-8859-1?Q?39DwxkrB80+CstI8hf+XeP6cevojxmg9jNnSOqu+mNhcaPF8erifPBk5LT?=
 =?iso-8859-1?Q?1ZBcYBpfZbIt+Y7XosPOe792K2yzI81dPClpYb9J0FKsRCOIb3zMNpOZeC?=
 =?iso-8859-1?Q?M24SFpe97+/beytOzk6S4afAgzmA/yFmGV80K1ypat9RjDEjFCFWgetf1H?=
 =?iso-8859-1?Q?WRJ7c7l7/JcMxheXZxWdZwfqK0QnUuEYaQ/v2bzS8DdoDDv8MLKJva5mXn?=
 =?iso-8859-1?Q?mip70zg+wCxEHeI4G6T8E5XFBDo6lBbhmI31rscMPIwHodRC9kMgKobPOL?=
 =?iso-8859-1?Q?Eqp2Wpxp2K3nCQyGqUETsWyKctlOAdG981yp4T7GIqTAhf5z8iJkc14iPt?=
 =?iso-8859-1?Q?zIHs+R+s3nxSJvO//mVnBtTMjb4EKkBpWtRgAal/iGg3GAH4Bnq3/GJTS+?=
 =?iso-8859-1?Q?c+SSBmPyZl6GTtGo74ptZse/LGYr3b21jANdzN6hY5JqB1rTiv+hTh2v4K?=
 =?iso-8859-1?Q?0/sUYb/7twvjq7KXdvdTwqLZFnGfjxpV4JVzYC3cEO93mY4EaQorcYWgno?=
 =?iso-8859-1?Q?Noij0edIEQfd/maADhhFWwbnYCKy4BSWKkl3MFKOuuCm3rhCsV/hHsY7vQ?=
 =?iso-8859-1?Q?ipX9OT48Q5I1sTG8cCw5ympuZDkbDx/h6uMIxHQdef/KKRnYrLM2GNe9EG?=
 =?iso-8859-1?Q?E0PkYcurzXo0a3CwcBtvDAzrC1TurBIhYg6N7SeS8VMEEi8TffYFQmacvV?=
 =?iso-8859-1?Q?Mf+mj4Udw3EtMQ1s5pkUh23SPhaERv4rmafjNnKIASzI4GL7mtjwZnJwgl?=
 =?iso-8859-1?Q?eIuC45KNiaMDJN4hZjCw7tZRmteT1y/QEi7kv15mGArHQgJHVq/2be9fYE?=
 =?iso-8859-1?Q?o1TMSCjvIFGF82onbqv4JaESLKdXlv+a48ndAHYiVE3XutvKJczMjkKw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff18fe5-fb8b-4270-986f-08dd10180647
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 01:49:09.7274
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3oP/9zFhR+F77fJ3M0ZWmlV6pKb27QK59e0urS3Foyn+XXc3m+IOCy1NZXcZrDNrbYBMBHsbxu93ot9RaEDvJGO8sdRCGgKoVmapkgX+YA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8923

Currently, even if we are using clang as a C compiler, we still use
GNU binutils. This patch adds new option "llvm" that allows to use
linker, objcopy and all other tools from LLVM project. As LLVM tools
use different approach for cross-compilation, we don't need
CROSS_COMPILE prefix in this case.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 config/GNUCommon.mk | 16 ++++++++++++++++
 config/Linux.mk     |  4 ++++
 config/StdGNU.mk    | 18 +-----------------
 config/llvm.mk      | 17 +++++++++++++++++
 4 files changed, 38 insertions(+), 17 deletions(-)
 create mode 100644 config/GNUCommon.mk
 create mode 100644 config/llvm.mk

diff --git a/config/GNUCommon.mk b/config/GNUCommon.mk
new file mode 100644
index 0000000000..71c2303166
--- /dev/null
+++ b/config/GNUCommon.mk
@@ -0,0 +1,16 @@
+# Allow git to be wrappered in the environment
+GIT        ?=3D git
+
+INSTALL      =3D install
+INSTALL_DIR  =3D $(INSTALL) -d -m0755 -p
+INSTALL_DATA =3D $(INSTALL) -m0644 -p
+INSTALL_PROG =3D $(INSTALL) -m0755 -p
+
+BOOT_DIR ?=3D /boot
+DEBUG_DIR ?=3D /usr/lib/debug
+
+SOCKET_LIBS =3D
+UTIL_LIBS =3D -lutil
+
+SONAME_LDFLAG =3D -soname
+SHLIB_LDFLAGS =3D -shared
diff --git a/config/Linux.mk b/config/Linux.mk
index 2a84b6b0f3..6f4dc865a2 100644
--- a/config/Linux.mk
+++ b/config/Linux.mk
@@ -1,3 +1,7 @@
+ifeq ($(llvm),y)
+include $(XEN_ROOT)/config/llvm.mk
+else
 include $(XEN_ROOT)/config/StdGNU.mk
+endif
=20
 SYSCONFIG_DIR =3D $(CONFIG_DIR)/$(CONFIG_LEAF_DIR)
diff --git a/config/StdGNU.mk b/config/StdGNU.mk
index aaa0d007f7..d723bc274e 100644
--- a/config/StdGNU.mk
+++ b/config/StdGNU.mk
@@ -19,20 +19,4 @@ OBJCOPY    =3D $(CROSS_COMPILE)objcopy
 OBJDUMP    =3D $(CROSS_COMPILE)objdump
 SIZEUTIL   =3D $(CROSS_COMPILE)size
=20
-# Allow git to be wrappered in the environment
-GIT        ?=3D git
-
-INSTALL      =3D install
-INSTALL_DIR  =3D $(INSTALL) -d -m0755 -p
-INSTALL_DATA =3D $(INSTALL) -m0644 -p
-INSTALL_PROG =3D $(INSTALL) -m0755 -p
-
-BOOT_DIR ?=3D /boot
-DEBUG_DIR ?=3D /usr/lib/debug
-
-SOCKET_LIBS =3D
-UTIL_LIBS =3D -lutil
-
-SONAME_LDFLAG =3D -soname
-SHLIB_LDFLAGS =3D -shared
-
+include $(XEN_ROOT)/config/GNUCommon.mk
diff --git a/config/llvm.mk b/config/llvm.mk
new file mode 100644
index 0000000000..e474428286
--- /dev/null
+++ b/config/llvm.mk
@@ -0,0 +1,17 @@
+AS         =3D llvm-as
+LD         =3D ld.lld
+CC         =3D clang
+CXX        =3D clang++
+LD_LTO     =3D llvm-lto
+CPP        =3D $(CC) -E
+ADDR2LINE  =3D llvm-addr2line
+AR         =3D llvm-ar
+RANLIB     =3D llvm-ranlib
+NM         =3D llvm-nm
+STRIP      =3D llvm-strip
+OBJCOPY    =3D llvm-objcopy
+OBJDUMP    =3D llvm-objdump
+SIZEUTIL   =3D llvm-size
+
+include $(XEN_ROOT)/config/GNUCommon.mk
+
--=20
2.47.0

