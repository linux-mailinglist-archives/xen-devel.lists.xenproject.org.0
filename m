Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C289DEDF7
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2024 02:11:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846089.1261380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHC0H-00055e-9y; Sat, 30 Nov 2024 01:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846089.1261380; Sat, 30 Nov 2024 01:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHC0H-000543-67; Sat, 30 Nov 2024 01:10:33 +0000
Received: by outflank-mailman (input) for mailman id 846089;
 Sat, 30 Nov 2024 01:10:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b1+J=SZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tHC0F-00044C-MA
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2024 01:10:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2613::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3b013fd-aeb7-11ef-a0cf-8be0dac302b0;
 Sat, 30 Nov 2024 02:10:29 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7694.eurprd03.prod.outlook.com
 (2603:10a6:20b:41e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Sat, 30 Nov
 2024 01:10:16 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Sat, 30 Nov 2024
 01:10:16 +0000
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
X-Inumbo-ID: e3b013fd-aeb7-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjJkIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImUzYjAxM2ZkLWFlYjctMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyOTI5MDI5LjUxMjg3OSwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFqp34+OGvfFHvkj3/xy1m1SC+EToXdPAuQ37nOuGfYewssDfFd6e7kgPczw7AAadMrQOLAzc0LVyqxcM7O5Id1u4YyDB9W35zinQhqhcZx9z4iuEoN6NDaqKdc0QW087gMgiF2V0jibt2DFP2q65n1s0JoqOF97OwEx0fRKZz/oKSpruGBjfd0kmBq1SaYP4tRDC5LikTsJODQ8ijduQhk9SoSk+RueWHsM1mZGDi6j+GRLzcIYwX0VX9dLsoiIn8oa2inK7V8w2k0lE0PwItc/y7MsorxFYJ7LA+1JFbGUlQHHdcnQw52EIWNg4Ma6p3zM/1YqTgVAvkWQRJvadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lk0HamVq4FxAqQJVSVFKu2L4HLWpx3Q1Ibp43i+aQ68=;
 b=iHuMjI2DnApIM7wpX6t+pA+JCnNN1bkXT9M0QzFvYPvsZeynjx694lo3K2lxRQtjVCsKZpM3J40+F5uNFUjO6ffxjNYsYtNAeKU1rnj9U7kRAptrnurACkO0HrCuZ817DLFnAQavwfVa1UF4sCxzap1C9j0Dr/qF/qBKO8nMfVtdJZCYbll70ivDgk/sv9MhoPW2B+ju1ZIdXL3WFy9kxMYSA+/rjjOP1jz6p5a0oBu6sBfSfSyL6+FuYBT+QoLtqspvulBH3n9m84xHdBBnUGo10ymvM1td57dL6b9Hl/hXgN2URvMOlkQ4Ontr+VxIX5MgtvhCOVQ9WwISqqkDKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk0HamVq4FxAqQJVSVFKu2L4HLWpx3Q1Ibp43i+aQ68=;
 b=SORKnbMj8pPcCXoYMfim6hzzIMFFW/HnhLWdGowsBxMYt1doiibgPWQfpE8h+f+4U6z9KRQjhkalmEfVpAWd8F4qbuf1QCXvBPzLBITWicjAlnwOglNSRgnA8VuK7Hta85fK46kiZvAK64C78Zx86pnXb8WUcRTZTeBB5oO2jf3JdU4euMm4C/Ca0FxmjBQyrvahxtFrh+SwQWFXAlecNFCwG8W6xMmjg0M2eOcGJSPUp4/rNAwZPjYkWew3vJdi514Tkc+Q5UHS2S/c881gQnztXVX28IDZLEGvN6A8irX+MdFpBHy0fy0Vr4bSx+JnSyoM0Ngs47ojgpxyVDp1LQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/4] xen: common: add ability to enable stack protector
Thread-Topic: [PATCH v2 2/4] xen: common: add ability to enable stack
 protector
Thread-Index: AQHbQsSdkWILXIuO706XPyPrUU1cAA==
Date: Sat, 30 Nov 2024 01:10:15 +0000
Message-ID: <20241130010954.36057-3-volodymyr_babchuk@epam.com>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7694:EE_
x-ms-office365-filtering-correlation-id: 60322106-e114-43c4-5a18-08dd10dbc03a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NKwJhqdwrA8AdoAVasRDl/n3y0mu8VdAOlyGm6rUqLoUhd/yf8TDMuYWCW?=
 =?iso-8859-1?Q?rPK6woFaQPQLUbiKVl99Vgin48aBY8cxUqszhhTuAs865TnB9+/GuCZ1Gt?=
 =?iso-8859-1?Q?4uktCrcEqwkIv+OLGOHPViT1V2UZXW9suUqTFAqtF5zkT9JtKpCHO7GELd?=
 =?iso-8859-1?Q?ZLIGeGw7fgEiKkok3y27ISu94ANRCRv2hcBoqU1WkqC0UwIKEhylbAoQpW?=
 =?iso-8859-1?Q?eKbZWycPeKrh5IWOan2CFNmOPx3HfSVYMbAVlU7TjJvSy4HBFdUJrhMLJ1?=
 =?iso-8859-1?Q?YtB43JweQKasVeSiZkIQ03GBNP3cgHF2pR1GB29Y9WkOsaCeichriMqKan?=
 =?iso-8859-1?Q?p3QLfhMVECqGSwkykND9NHrpElO9FOQsc69CkTBsB6AaNMD80Tmzam5LcZ?=
 =?iso-8859-1?Q?wbGFY44yqIQxS1INVyTUB/IwXXOrNEe60YLzwnKHXMQZrybq9wU1N4DBnq?=
 =?iso-8859-1?Q?Y2nAuPCwMOKnnZmy4xGkj+0MpRHBVCw5Y3bqtVA0uOSKeQ9n1gOxkBSgMl?=
 =?iso-8859-1?Q?xY6+ETgRlKaWcATOkBILKk/UvTJd1ummlGAHTAhYRXCSL7N8sySxzh8B0i?=
 =?iso-8859-1?Q?v+8z+ZGH4i69VycACD8cHl4rRRUT5pl7y1dCEjqcH6rzDnnfaYTwyfx/QS?=
 =?iso-8859-1?Q?TsvSeo9WBh7kbY4JGnWUqj0ieYFd54QnvpU985enihf07hLoesi8sK+kWt?=
 =?iso-8859-1?Q?AkxEtNrnHuz4ex2df4fRWbjbISoXSL6KKIP4EWHT177I3+9gcNSgPPSh1j?=
 =?iso-8859-1?Q?ux3+m/hPk5NDK5fzwyDkJKOj1UjDfWJYKkKOxGD8AlsiGDsTpWioyC+JbB?=
 =?iso-8859-1?Q?GKhGlT55spZROGY12lBqceZnNNFjU7Ulj17GY0G0zJcNJLfh9fyP0C4B/M?=
 =?iso-8859-1?Q?172gD2C7Xrm5wlpsdN5V7QcNlfbv4mO2kWmN6L46TY5i76ygy7Pw2Wfkuh?=
 =?iso-8859-1?Q?0CcUTDlJu68kEdCTLl1zd4guYCsrIvessvt5BU2xve71Rv3+PX6dzJS2mx?=
 =?iso-8859-1?Q?Sj8C0P3bozL7YG7ceCkaNTGpLqIeyenyaouqR+9FMXlaf3cVfN7GcONMV3?=
 =?iso-8859-1?Q?E4OiC4IRIHTnBqnMgR0oAP70U9suCJurn7cyfAkCs2yVBeLlc/aHlRmLex?=
 =?iso-8859-1?Q?Fcm9g/9rRNrwEPjpePTfpi2L4LdMsJK9rCwLFTF07Q0gmP6Himr8X5Kpxr?=
 =?iso-8859-1?Q?Du65Ng7E2TQ1kMfUP9VT0L3Lw8BxqKTBQiCso/05f1B805KI93WB6QokX0?=
 =?iso-8859-1?Q?Tqptzyw91cD/5x0DkUJae0rErwMKFJklRwoVBXWCGTBkpn83+gHWFVrM8h?=
 =?iso-8859-1?Q?oyW0ygayD1AemYnzNbw177MFlDS56fF79V6PbXuwyvzdnDoS7lf+wmbMI8?=
 =?iso-8859-1?Q?7RmsfShATTdviZL/F6w/HSQvliqJDfk9yALCCAagm2sgT6rHXzWd2ax2An?=
 =?iso-8859-1?Q?lXlEvxacN3f6NyJ4l6q48mNe/+k1VuuhmMsBYA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+erIPVTbcmK5GUDyNz1iwfblWfClsddW1E8dT2A+jXYGQdq1avVzEjpSlY?=
 =?iso-8859-1?Q?QdUIObWv2TXq+b/asYVttAwL4Qwetz+MQeSYZI/jdAfJSfEiPVmd+YOxH1?=
 =?iso-8859-1?Q?O4pPelrVLbXGB7dw6I9m8XYntmqayPmYw8BIEwyrJCDbJbPMNaAvQgvDGi?=
 =?iso-8859-1?Q?W6fuSKoQaDiI5ArloZ4jME0Z6ec2j9zIa530KyHUkXbQ1mcb5VsA886Wg/?=
 =?iso-8859-1?Q?wQ+qXVdJQY5o7cgsSHphELu9uu4Zwxsc1Pj/tJmpb2r3DtQeg9y4it+b31?=
 =?iso-8859-1?Q?bYjd7DaCfYAheCh8j11gWzzq3f+0IHcF0IHEwUttKZ6Whsd2QTauON+fyr?=
 =?iso-8859-1?Q?+AUBmnD91vYTUlPE9Jg8OrRmniusGDUU+ji5W3PVwubZZIdmgPCuPir6yq?=
 =?iso-8859-1?Q?IkSE6unnl4UOBcBJn0wGS2TB7u7e9Tsv9j7Bn30DNwpj/bXVRxbngoxCDu?=
 =?iso-8859-1?Q?SbhSnN8wF/wOD9PwtiOqxUYYsafiXF8xaiGuiYZaqB1mXEzB/3hu0E9XyA?=
 =?iso-8859-1?Q?ipisL5UsGvrW8YdBZ+rdsEYQayWnrLmzz/4znC/xtD6Yf72xhRu6lxA1ac?=
 =?iso-8859-1?Q?JOoEI63IiL5dA3fgvpxQn9ie+8BhR8yMlg/ir+PyIj9ADHuzMkuP22fTJ7?=
 =?iso-8859-1?Q?S5v2/FsQwXCNkagsc6fWoYExOo6MdT/nOwZWu+XCXi8X8NUNsLsr8ccQSn?=
 =?iso-8859-1?Q?fomcxlDpr2AsIIAVQztFKr29slQ6tbm2skQb/pVgaTzNajFWdrDD+MjkP1?=
 =?iso-8859-1?Q?PAnQxFK+OU//fsK3r5xpczZaeqbxcEU9d5o0y0lzTX2pzcPAuJZarqrNe1?=
 =?iso-8859-1?Q?k94m1Mm5+rCF6vUPRXhseS0PlFHZWny2wK7nwovzAmIHFoVnx7+TR95Xh3?=
 =?iso-8859-1?Q?q7DMPLCFPKMFnZgIeNTCVQyy553QxeG3E61NnU1uRv7Bz0yMRqQGeeGntU?=
 =?iso-8859-1?Q?+Oo77qE2QTp/Q618XBL5aGN1tH2eXGin7TTfSzZcJjlCSVbciPJRymofBJ?=
 =?iso-8859-1?Q?mg4TfpRYTwXVRfvbvFX114Efh61wMduFWcgK2b4irq1LdrtGO5LTbjG/OI?=
 =?iso-8859-1?Q?G8G8kl/Z3QY0Ob93awmEiyqKjdwyu7xwxFEHZlLoJoEOvTKHoxvPSe+Zug?=
 =?iso-8859-1?Q?0am0eeYLA6stxF8BpzsGCH98M+tqirkKMwH6VWnG+gccVJ7cXM5Rk3jU9F?=
 =?iso-8859-1?Q?a74H3fKRk9b10Gf4qq7f4dWmErSBkDVGrra/QAxgfbCTvm4yJFhluxj97b?=
 =?iso-8859-1?Q?fl0cOhGRGgFP/NrXs4sS73ZxMm9p+PAF1zVo/3o8Ac602NxlAhe1V7HBCJ?=
 =?iso-8859-1?Q?8wLr6PCx8HJkbvse5MzzQ699dnOGBjaRJSMcegJ5FJDTb+1hemC+NgGhHv?=
 =?iso-8859-1?Q?Xg9p4pC8J4YmqNYy2UGxyugfuVcCDlFPCLRWHAOeVif2rk2DtNhDplibOV?=
 =?iso-8859-1?Q?KMnDeolFQwLGAVKqHaL1YPS6m3+q6ikY7xP3XSHvCy/6FAnmdrTKf822AH?=
 =?iso-8859-1?Q?2eoQg5F3jGENk6gdE8i3bljAqPl70iU67UXm+TXRJ/xmTDgJ6329kaJPPa?=
 =?iso-8859-1?Q?pzC9xOi23ddDOtyEqepT+mzmtWj7MdRxnbc15FrNNi5sXzN1Kb9lWYCg1Y?=
 =?iso-8859-1?Q?8/L7E6EwZRt1KyentKwdAsLzpTp6UtXFqLfiEXh1N/1MFqr+s9RK7Z+A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60322106-e114-43c4-5a18-08dd10dbc03a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2024 01:10:15.9693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YiUZz6WwqrIFFAp1fDWSyt23wu64HqX0xw/vnD1NF6npLWOSnv4S+Gc/dd5x7gek+I75mN+oz8EeGfIIjn18rpuOugVreHcn8W4KFIlrX4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7694

Both GCC and Clang support -fstack-protector feature, which add stack
canaries to functions where stack corruption is possible. This patch
makes general preparations to enable this feature on different
supported architectures:

 - Added CONFIG_HAS_STACK_PROTECTOR option so each architecture
   can enable this feature individually
 - Added user-selectable CONFIG_STACK_PROTECTOR option
 - Implemented code that sets up random stack canary and a basic
   handler for stack protector failures

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

Changes in v2:
 - Moved changes to EMBEDDED_EXTRA_CFLAGS into separate patch
 - Renamed stack_protector.c to stack-protector.c
 - Renamed stack_protector.h to stack-protector.h
 - Removed #ifdef CONFIG_X86 in stack-protector.h
 - Updated comment in stack-protector.h
   (also, we can't call boot_stack_chk_guard_setup() from asm code in
   general case, because it calls get_random() and get_random() may
   depend in per_cpu infrastructure, which is initialized later)
 - Fixed coding style
 - Moved CONFIG_STACK_PROTECTOR into newly added "Compiler options"
 submenu
 - Marked __stack_chk_guard as __ro_after_init
---
 xen/Makefile                      |  4 ++++
 xen/common/Kconfig                | 17 +++++++++++++++++
 xen/common/Makefile               |  1 +
 xen/common/stack-protector.c      | 10 ++++++++++
 xen/include/xen/stack-protector.h | 29 +++++++++++++++++++++++++++++
 5 files changed, 61 insertions(+)
 create mode 100644 xen/common/stack-protector.c
 create mode 100644 xen/include/xen/stack-protector.h

diff --git a/xen/Makefile b/xen/Makefile
index 34ed8c0fc7..0de0101fd0 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -432,7 +432,11 @@ else
 CFLAGS_UBSAN :=3D
 endif
=20
+ifeq ($(CONFIG_STACK_PROTECTOR),y)
+CFLAGS +=3D -fstack-protector
+else
 CFLAGS +=3D -fno-stack-protector
+endif
=20
 ifeq ($(CONFIG_LTO),y)
 CFLAGS +=3D -flto
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 90268d9249..64fd04f805 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -86,6 +86,9 @@ config HAS_UBSAN
 config HAS_VMAP
 	bool
=20
+config HAS_STACK_PROTECTOR
+	bool
+
 config MEM_ACCESS_ALWAYS_ON
 	bool
=20
@@ -213,6 +216,20 @@ config SPECULATIVE_HARDEN_LOCK
=20
 endmenu
=20
+menu "Compiler options"
+
+config STACK_PROTECTOR
+	bool "Stack protection"
+	depends on HAS_STACK_PROTECTOR
+	help
+	  Use compiler's option -fstack-protector (supported both by GCC
+	  and Clang) to generate code that checks for corrupted stack
+	  and halts the system in case of any problems.
+
+	  Please note that this option will impair performance.
+
+endmenu
+
 config DIT_DEFAULT
 	bool "Data Independent Timing default"
 	depends on HAS_DIT
diff --git a/xen/common/Makefile b/xen/common/Makefile
index b279b09bfb..ceb5b2f32b 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -45,6 +45,7 @@ obj-y +=3D shutdown.o
 obj-y +=3D softirq.o
 obj-y +=3D smp.o
 obj-y +=3D spinlock.o
+obj-$(CONFIG_STACK_PROTECTOR) +=3D stack-protector.o
 obj-y +=3D stop_machine.o
 obj-y +=3D symbols.o
 obj-y +=3D tasklet.o
diff --git a/xen/common/stack-protector.c b/xen/common/stack-protector.c
new file mode 100644
index 0000000000..b258590d3a
--- /dev/null
+++ b/xen/common/stack-protector.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <xen/lib.h>
+#include <xen/random.h>
+
+unsigned long __ro_after_init __stack_chk_guard;
+
+void __stack_chk_fail(void)
+{
+    panic("Detected stack corruption\n");
+}
diff --git a/xen/include/xen/stack-protector.h b/xen/include/xen/stack-prot=
ector.h
new file mode 100644
index 0000000000..779d7cf9ec
--- /dev/null
+++ b/xen/include/xen/stack-protector.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN__STACK_PROTECTOR_H
+#define XEN__STACK_PROTECTOR_H
+
+#ifdef CONFIG_STACKPROTECTOR
+
+extern unsigned long __stack_chk_guard;
+
+/*
+ * This function should be always inlined. Also it should be called
+ * from a function that never returns or a function that with
+ * stack-protector disabled.
+ */
+static always_inline void boot_stack_chk_guard_setup(void)
+{
+	__stack_chk_guard =3D get_random();
+	if (BITS_PER_LONG =3D=3D 64)
+		__stack_chk_guard |=3D ((unsigned long)get_random()) << 32;
+}
+
+#else
+
+static inline void boot_stack_chk_guard_setup(void) {}
+
+#endif /* CONFIG_STACKPROTECTOR  */
+
+#endif /* XEN__STACK_PROTECTOR_H */
+
--=20
2.47.1

