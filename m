Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5079DEDF4
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2024 02:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846085.1261346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHC0B-0004CP-Cv; Sat, 30 Nov 2024 01:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846085.1261346; Sat, 30 Nov 2024 01:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHC0B-00046g-9y; Sat, 30 Nov 2024 01:10:27 +0000
Received: by outflank-mailman (input) for mailman id 846085;
 Sat, 30 Nov 2024 01:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b1+J=SZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tHC09-00044C-Dq
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2024 01:10:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2613::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e00b8360-aeb7-11ef-a0cf-8be0dac302b0;
 Sat, 30 Nov 2024 02:10:23 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7694.eurprd03.prod.outlook.com
 (2603:10a6:20b:41e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Sat, 30 Nov
 2024 01:10:15 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Sat, 30 Nov 2024
 01:10:15 +0000
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
X-Inumbo-ID: e00b8360-aeb7-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjJkIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImUwMGI4MzYwLWFlYjctMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyOTI5MDIzLjQwMzA3OCwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p397pjFfKceIz2yvkKEbUrFGhM7n4ujTPvyNfK0Q6hNcHzVCvm6KNa55lS8QONIlM/Wl2/C8CQOoI5elcnc+aaeBDK5yGfpUK0MwFTaFejFt8Hs0SVtrsYVDREb6qf5D+4OibBkjoGoJ97kFNsDtW5yhxDglmgqVxaLYsaP4GQWzw3cvmn9MTf2EvZvzcCIdZGCb9lK2Wf4gYejtBqG2gzLdYE95Y/ERiyqiJGdR5RoMRQz+DOmMVn7jslKSkuYXMKAq+IYUk3iMrT94zxyClcgAFYjmJLP/cI8XUo2TwAw70hQ4c3igJ9gI5j2lNHBVfRVrwDavUevS6mWwsu0yEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcE4MQ/KInbQ64EOEx7RiuJiz/7SMxJqXpiSvjkursY=;
 b=XF7PVkZCIbSfdo7hN3RtIVY0WggRNv8lMX2BcfLvmcNx+KcoAifqJT00opQ2QBtHL+1A6z1ptIsuA3mWgmfFvZvwMC55zvCUfi6Cvjez3/T5ubCHtPvC/cfix7+2PROFOJ4AJDtbGL70TdUeRdnKtyfeDp2j7/9/WnY9CHIN3voLSi4L7J8ONFVKK6ybp6xPyTKj8CM8FmZc3HomTIDGq2wK6rhHdFTuQLc4MFRi+D3IKognLqBkCYIFmHagPAf3/fMLcIXXzbHxf4Rp/pGd+2lfUihO6t6NXgRqlDJ6NYTjjY59qlWOK3uTCxg6h5SnCkkYat+WaewP78DUDKOP4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcE4MQ/KInbQ64EOEx7RiuJiz/7SMxJqXpiSvjkursY=;
 b=ec6Bo+tJr300GVvHkTy8karA7oH0a6Zj+X//SmvXfgkspShu94Tt0W5cjBq1OImcJ7ZzQzZY7v3DcOqEgSXJTyi3tNjTwM8+IzFNvcYUaMewZJEYSAT1olGuwkUubVNbHOGhCzqLA1Uq9Mo9oEMBwGYbFrx3KxRlog65rAsFnXRVdYsJ6AJpKCznIMH2iSXSRucJnC0zt7BtCQkBr7XKPcscBFxddKpjraCA81W8/AfZNlUmTbG79sKiqK46bL52ivbD5YrcdRH52RuGYmNg9MBWg+Lp/OCZuNwwdmZ5e5pusK8O02lii7U1AxHQtwrRq3Ygj34BjYLOAgTh0ppQ1A==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2 0/4] Add stack protector
Thread-Topic: [PATCH v2 0/4] Add stack protector
Thread-Index: AQHbQsSclqo0UcXa3ESeciBOaRXmoA==
Date: Sat, 30 Nov 2024 01:10:15 +0000
Message-ID: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7694:EE_
x-ms-office365-filtering-correlation-id: ed5a5f74-33f5-4c29-4555-08dd10dbbf7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KVIXRO5IpoiS3Z9qE++oNgeLTVjaFbypk1YUejksCW4K6RHXOobwSEjTST?=
 =?iso-8859-1?Q?0sRd16q+3KS60+5DK8cCqUtbbLAcFcC3HoqhNhWApzNgXh+YJUR70fQnsz?=
 =?iso-8859-1?Q?CFUSmHZGsiQE9fcCxEKHrRvhidfMHNFO0PhJ/Y0EXZKfS7Z4JKs/hSnJl3?=
 =?iso-8859-1?Q?xFvVX+EuxPsVW+KJHdVO1/Rm0CIVmGaPZpP9PwxJnjQYSyab2iGQDjYbMZ?=
 =?iso-8859-1?Q?9Z3xQ/Nqab3AyjH1TIkj0WOG4abOfagf+7rrRrPEig4A1IXTsEwFDM5GPK?=
 =?iso-8859-1?Q?2UrfeaIj6HkM+ygc/PYbLvRsCjxrjAZ0KrQK8aGpOelYgFWUFlZKkvRI06?=
 =?iso-8859-1?Q?2S8QkekDHosC2RRBu0/+MBOqGlFMurLRxefCKwqKHURf9LOY7i5OEtD5sk?=
 =?iso-8859-1?Q?Z6csmibraZzlb/wCCD7nu0ljNE/NFo251IxRGGKKr5r6rIi5KWlG63x3jG?=
 =?iso-8859-1?Q?jorAQthZJRM4R8SZLNsKWOVE7VasM8TO/mwJ66ZUSun39MJoZ+XGQ9cJM3?=
 =?iso-8859-1?Q?9y0/lYNmEOmCbaxueh6XBrVQlnQbRJ9EhCJdxcjFBH8dSBVBB5Go+1nNAO?=
 =?iso-8859-1?Q?6igFUY6suGW0umEepAsqwerWRxKhgI8HHuqluX+50RPbKaGOzFp+WVNu9C?=
 =?iso-8859-1?Q?tygPebpLSR3gTQtNJLf5afSTU/lgVUwllx1e3I8uLzKixPCZz302D5PnjK?=
 =?iso-8859-1?Q?iqzVXSM48FNiXOhWzFOQj6iv8RFEczvsg1HgzPmG/c6yTJkxGjQZ8z8nuX?=
 =?iso-8859-1?Q?BN/ipKOXf7HOf6Mwdad/IWLW0hBIInoLOwcxqaj6zaegq8Wpw0Od0MpFPu?=
 =?iso-8859-1?Q?PFZKiKy/yyZD6sSZ3awHVoBoFvCs9s2e3AyA2D4gZyu9xoMqiInBWNTGPD?=
 =?iso-8859-1?Q?5/cTgF7N67fipsVKbtYrOm2OI4kZb8Sbb43gIo7dBhO+QlUsqENMl5mn0h?=
 =?iso-8859-1?Q?JZh24RiSIjpMH6yKYTzcQOmN+MqmWO8vAajFJDSTQW5bbavZxA2ljNHB5N?=
 =?iso-8859-1?Q?qPxqYCQFq0LrOuoibtVHhpXcl+Xvc1p53875akUJFPSYM+zOOlt0+kRT9S?=
 =?iso-8859-1?Q?HnGuOARmb3NM4uBT06SbtYxm/Jgdm21oHSnBoDlEP4mj6IwEq47Y0IX7Nl?=
 =?iso-8859-1?Q?uAdf51g2l78tHvB9bFNnZv8Iq8iKjT13ynpv0Am3sQYC1CCWeFhaecKAKl?=
 =?iso-8859-1?Q?lj9a64ZzVWu8T6kGjs5QPVlurKRxqe4CASBezjKGGYwVdHN0hb7/nk+I1Q?=
 =?iso-8859-1?Q?Duy34o8s6gNkQmCyFbFOfpQrSr6pIqpbIbGACQZV8Rt8WgP3MHkoTLl+1Y?=
 =?iso-8859-1?Q?B/rEGuK2XC56kg9t1oJzWChCbWt6d/i/IzwOPMd6XfVXRAdjrRtJUwebik?=
 =?iso-8859-1?Q?m/hYKc/Edh98dWFNziDwMy9Q5Hypn7UeWdv/ygswTLfrNsftElZBlkQGiF?=
 =?iso-8859-1?Q?+0N5J69EKziRE0e41OoPsvi//FaPGKTMdiv3Uw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Gm+u1GvhXXlpg9t7XVmZVep+9zl7JCXQpoi1kYm+c5uz/hhaEL1vegrLcu?=
 =?iso-8859-1?Q?UJFoVrwS+c6EoQ9UG2Z162IiGEsXokP/VKtHXgIfg76zFQ0/X8D7l7jFgZ?=
 =?iso-8859-1?Q?zD3a9lqxMmGO0cJtHiujoXHktjK1mbMr+K7aXQ6+jPNLPJityZrCerfhm4?=
 =?iso-8859-1?Q?wmsX62vMANYZ0KMKXYrDkrY7YcTgeRf83mXaxVhCXqKMIovM1z8N3tp6WR?=
 =?iso-8859-1?Q?36nyu+9GOqzkMbQt5Wd272OHiSJRLdjkX+9VWqdEqcYFioIpBRQ35dbQMZ?=
 =?iso-8859-1?Q?pF8+uZZ1crpesMt/QVmPiQrZbcMWXFTPz1+qq3w0ZOVYsj1yJkuG12waUJ?=
 =?iso-8859-1?Q?W1Z1pQBwf3RYIqZa51spqiEssby6BixdtLR4C9GUvaKb0Hn7Rzn0J9esNt?=
 =?iso-8859-1?Q?fVnCNsmtxQm6rxXyPccAil4BRa2hH9I9OrvIlphWc2ofx3O3kaxqODlewq?=
 =?iso-8859-1?Q?L3R/otbCnFMRMRVQGzHaYo43JNyuyh/FcIxVnbbd8XnsLKVDrKwxk5c0Ns?=
 =?iso-8859-1?Q?jKz3EKtWbHpx6YSpj07HDLdzEUUYsBaqOV8MoRGa6PwojQKC/81jiDpPPT?=
 =?iso-8859-1?Q?vcz4H56LBKNRjWd/PT69UbuVFg6o0Vu5A3iIx1lA5cstnBYNi2mffxJdnn?=
 =?iso-8859-1?Q?8qAGQocponySgUwBoqEswTzJp06sCLwPFWrViU9oisZGl81vY4GzkW6YIK?=
 =?iso-8859-1?Q?pcbflDY9cjbO7Ufaccq6Cjq8hmpoqJNlmgNw5eLA8kaIBhlU2uL6K0ABbR?=
 =?iso-8859-1?Q?p36NxdfjNW+kw6pyQoK0XsO7UJt4qgP0DSoQpDwn0ruMz7qqCCynqkNVj6?=
 =?iso-8859-1?Q?XG97FBYK9xxNWBy33SFnIuMfL8oBzY7+LG+NOLFHnVnmFmPabTKSm6/DPJ?=
 =?iso-8859-1?Q?4IpGGZbOtekoSnZn6qyhcG6Xq+1kN5fOu+Wi0rp8LTiw9IqSizg1Sroib9?=
 =?iso-8859-1?Q?s/lRK5DjA87nHBKNSooeAClti1tzxh4qyZC5rwwiPYA9n9e259nqN4Peuc?=
 =?iso-8859-1?Q?ytJ2/B/m75ZK5CWf1BXs1pIYhtWP+IZixm0r7VwBulfiZ6vT9FAMkLsca6?=
 =?iso-8859-1?Q?fuaStiIjODIbMOtuJLdRMsBc+o5jIDDNjAWWMe2YLwr/KROgDLSUL7DqRJ?=
 =?iso-8859-1?Q?Mt9/M9v82ZaelG+bDFkH4pqwgAs5EgSv0YjT+DkOeMG6jIlXEVK46OfzsJ?=
 =?iso-8859-1?Q?R5AHdqws1uJFCRRjJysadv6lnQXWHoAsy6GZ1P/uYOTObpm5rb2sLahdzp?=
 =?iso-8859-1?Q?4Ui8cRXSjHILFWtey8HtQFtOsXQKlCQaVbKgruy5wvaicNHm3Wn0gnjia4?=
 =?iso-8859-1?Q?AlSydc2y0535Fbr5RObAxukR15qRCTcmvFjWqSMjOKXaMcgS540Y1sls9M?=
 =?iso-8859-1?Q?Wa9bH1Mk4iH899V1YD4swKxbuUmMP5exZJa41Uk6c3fV3gcbzIPUBP/mUB?=
 =?iso-8859-1?Q?olMiaEz1wqIPyWpNssCdOJdDWWfYWhV53khilg4JXjRgeq03XFBEJorHU0?=
 =?iso-8859-1?Q?SsDoAmKzh5v07ox8O3yVohCQhDmySk+UFea67D56wRge+m3Y3PAjBJ+B6a?=
 =?iso-8859-1?Q?5IH3K1AwMgeVXC4zVnlX4olbtjrp7IGunWNkfqe4XnkBdlXk9p7pLSPKgh?=
 =?iso-8859-1?Q?ZiZ3G9ahWBDx/hI+Q2j7lSB5NEF8lOHgMhWpBvTDAQKZ3gywrIrMOfpw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed5a5f74-33f5-4c29-4555-08dd10dbbf7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2024 01:10:15.2786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+kyTRVbk2kvWVmqJWXmXIRt7FRcQse0KpXOHqHmRxGqiyRhmYDsLupfM5e6p9guOJ150HBuAvtEY3FNuWVJETC/aPz+LHRaRRJe3DUrOOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7694

Both GCC and Clang support -fstack-protector feature, which add stack
canaries to functions where stack corruption is possible. This series
makes possible to use this feature in Xen. I tested this on ARM64 and
it is working as intended. Tested both with GCC and Clang.

It is hard to enable this feature on x86, as GCC stores stack canary
in %fs:40 by default, but Xen can't use %fs for various reasons. It is
possibly to change stack canary location new newer GCC versions, but
this will change minimal GCC requirement, which is also hard due to
various reasons. So, this series focus mostly on ARM and RISCV.

Changes in v2:

 - Patch "xen: common: add ability to enable stack protector" was
   divided into two patches.
 - Rebase onto Andrew's patch that removes -fno-stack-protector-all
 - Tested on RISC-V thanks to Oleksii Kurochko
 - Changes in individual patches covered in their respect commit
 messages


Volodymyr Babchuk (4):
  common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
  xen: common: add ability to enable stack protector
  xen: arm: enable stack protector feature
  xen: riscv: enable stack protector feature

 Config.mk                            |  2 +-
 stubdom/Makefile                     |  2 ++
 tools/firmware/Rules.mk              |  2 ++
 tools/tests/x86_emulator/testcase.mk |  2 ++
 xen/Makefile                         |  6 ++++++
 xen/arch/arm/Kconfig                 |  1 +
 xen/arch/arm/setup.c                 |  3 +++
 xen/arch/riscv/Kconfig               |  1 +
 xen/arch/riscv/setup.c               |  3 +++
 xen/common/Kconfig                   | 17 ++++++++++++++++
 xen/common/Makefile                  |  1 +
 xen/common/stack-protector.c         | 10 ++++++++++
 xen/include/xen/stack-protector.h    | 29 ++++++++++++++++++++++++++++
 13 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/stack-protector.c
 create mode 100644 xen/include/xen/stack-protector.h

--=20
2.47.1

