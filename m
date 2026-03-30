Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABcFAtNlymll8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB34435AB78
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267452.1556964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHh-0000rN-Gh; Mon, 30 Mar 2026 11:59:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267452.1556964; Mon, 30 Mar 2026 11:59:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BHh-0000oS-96; Mon, 30 Mar 2026 11:59:57 +0000
Received: by outflank-mailman (input) for mailman id 1267452;
 Mon, 30 Mar 2026 11:59:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mykyta_Poturai@epam.com>) id 1w7BHf-0000HC-Cl
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:59:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BHe-00CdRq-Oc
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:59:54 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65af-bab6-0a2a0a5309dd-0a2a4503af12-42
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:54 +0200
Received: from [52.101.70.120]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Mykyta_Poturai@epam.com>)
 id 69ca65ba-1947-0a2a45030019-346546784220-4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 13:59:54 +0200
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8639.eurprd03.prod.outlook.com
 (2603:10a6:150:95::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 11:59:52 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 11:59:52 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIc499sFUw8lkh0bZ9WPSTPEF/tZbScmczs5jRBtBQXZYHpb7WPfRKFzqbDZ6JFmUsdT4sZshblvXnbsYza5WWt7XjlkUOAnElEAwGukPjwcYDjE4fdqMtWi4yaqCLkPHdF1cTOilVaeLebFUNM/WSMA/Y+T6vY/jygc8/Sj5uo+7P8Mvp6FZR6IDuDpMSjyBPTb9xpw0XW+u8Cxcw1B4XmOB6o7vLEjlwULV+uJFhN7DFOL5BxS4Vu9sRnuIFph4fjMM35kT0W1Xrj+cxplc3xeXCemheQPXMVn8iKs010r93Vi1BqmjrgfURrUEAer+tM35p17OzFk9xFp0PtqpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVva9UsjGtzKa4kTaxsRcqz3Xro518EwThLU9bHiHLQ=;
 b=oaIwkaXabe6VckHHSaH6mrkZ2P6WFkYm2l8trGBDSaPOKEEVtOtoDKiJR/T/mdUvG9ELXvccr8fJHGs+pDesQd4QdSaq/0xYrUk6eRu/3ik4xyflHabrKF9X17ZVfcp8oIUzQF7Z9ZEvroprgzw2SWIo0NxFHpg981SYJ2Cp87QC0DJPrqSAACiI4JoLCRYJMda3yqclDe9inaWhGaVJ4OfEzI8VehtBkStJ6MbDYoPEkSKJdIVy0ioOXlKIEDJpt/R92A4AHLn7C1i2FTc6ltegXwFjk1+ei8pv3ZcHBYSFinc4lIbToydoZADOtHOzFJ4DNyD+Zs501/qxhh9TDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVva9UsjGtzKa4kTaxsRcqz3Xro518EwThLU9bHiHLQ=;
 b=VyiCBU3WxecZXxOV+u6HH58eb8bIXiu3ksJ5dhDx0qzUlr2TRdq6sjss2uo+MkKiHYfGbUmMmx/5aRyYC17aTLeZUqRCal7Yby7b3gmP+KXkjHiSpM2rVSbyJwSdYaGdY0vn2ZwklJlMTVK3olxFQ2qcy4zXzPP2YtPcWi0QLPGmy9zYMGrJU48ep5NTHZuwF/Lq/LLYN0hZP8i81RniNPFOd3iFU4wW72PNVGqcySNZb2MHNRdwZgw0bJB+C5nO1TCw9vJs2f9EtAdpaFJ5BYfdMImykK1XUdPUihV1Pgkga+icsHPWXtgMoqln/ufH+nMbUZJRG/TvvV561azzqw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Topic: [PATCH v7 5/6] tools: Allow building xen-hptool without
 CONFIG_MIGRATE
Thread-Index: AQHcwDy3LJnr4T20vUWAas874pXmiw==
Date: Mon, 30 Mar 2026 11:59:52 +0000
Message-ID:
 <73db845e6617130966a565cdca6274db4cb46428.1774871881.git.mykyta_poturai@epam.com>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1774871881.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8639:EE_
x-ms-office365-filtering-correlation-id: a55796dc-0cfa-40eb-83a6-08de8e53da0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 Nf361VG/sV0FUImvp1vegKN61Dz8HAKlLKRNyVnOK5cWaosrjE4TRY8z1pVG3DC0rxn0Rw14J7+LbjAyb8A2l5NifFT91sODAtaVY+IslGMNmoqu5ZfqxnFtGC84kUy50c3b37EmsGEEPzaJesVoTkOX6zYFDlHjZaqFBMlLbBbRAPfWy+FL94pty6BjTA51qTi3pC1/91a7aEhjrC57Bzq8LaTPp0Uy8AdeduMCSFNlEG6tGZYIsLCBt06aZ4MTCB++C4juPgKPiI0ltfrmkGvw70InDhBsWY3GsNgibk9OUh/Ic5rTynSVVmoKapxbe9Z3aiEpvaiazmYeCbkEgYb/d5/Yw9CHYt/RjBUnVdMchz3Avng6jdexJP9uNGmhbzJU08xiN6a2vShqjZ7MGmRHJXbyJsCDqBlwc6oh5I7JIf6zYSqPXB4Incf2ognHzhhXY0rtPlWZb0QEbCvja+EiH4tdWS52yGtiXpwLT4DHPQRaB2cO/oPLylZHOkPJRxRxY9WVl8PB0DJJDja0K2Fs/I5ORbIXhkEKtDcskiD7bb3ynHLVmpcT2UwH8Q5wkkM069ykBnm0dJajtsmvEmx1AE/nt7RZ5GAeKLl3AHH3pETEt/1tdtl9Vc4EBCZxf686hi8BByWC79dEzU2qhzG15ZRi8bRlQeV6gBhAGgMH81ejj+OZg+nZGFFn3us7pZg4a4VP9EGt0OsE3i3v4AqCFfMoytg9vy0ptChR5U7ghbcG90LKuiqGBmAq58XAv4T3aZIois9hsIWHah/06NnZaDVVjFtPzn+M0B7JZJg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pkQu8vurc0ihZimgWYMKjGaHrjHwWPfG4ouLCLax5yHS2SdmMN/zFk8/7u?=
 =?iso-8859-1?Q?yQPMPPNNGgu8yEW34tKxEQ+sG1TmGZqz+WrDPdIUOhqkhQj2IRyQ6dImdN?=
 =?iso-8859-1?Q?PdyjHfqYEAFSRGcAgFemIKEQtMc111+7mVM9OYL47HNEpHXcKPlM6gdSzc?=
 =?iso-8859-1?Q?Mg09w+VVmVz/+DgeTiqjMztqe/MNnlSMiT6qtierHFfLb7gqd0bEqN6n6g?=
 =?iso-8859-1?Q?PQGQdvB9nLTg1rU+cZ1INe2qJXBt7/S3SOYz6/G7eubEoa8yGefep1/OPX?=
 =?iso-8859-1?Q?1U2Aom/hXQfQyK/cZP8FUdLrhwwOY0+Ok9DLte25aeOsfZ1/Kzrt/R/LH+?=
 =?iso-8859-1?Q?V7J/e8LcnVoZkRhvBUk1inaMqE76fOYTBZzMr6C5y2oEIXvjABHQHxqqMi?=
 =?iso-8859-1?Q?zOT+JufZdBtxZ6LrfxQ4EJculTQo+sx15gb95hm0btm18NIspYxBcLjcXS?=
 =?iso-8859-1?Q?65bap9uwuJVQ6vEXZW8dxDbwHKVOicy8E5O/A+GEx5HRXRqWUb6IOI4bJm?=
 =?iso-8859-1?Q?aPw6sdw/5EVl67PI3P5hXBqxsvzEaGN4apiYzqOJAZSMFgm4sVJmbkTAJu?=
 =?iso-8859-1?Q?+ML//r0c5G6YvDeHXIzkfKcDlCt4auSnaoYKhueQYo9brKtlBfib4uNjm6?=
 =?iso-8859-1?Q?cQMoxhJske+52VCLjyhUnpX+bJbXzmofL+relwWR715w8b+hgEdg6R/29t?=
 =?iso-8859-1?Q?LiDvpWdFR7ArDueMx5W/aSqfhtcK9LBK4w2CZu9BiYmK71eWJCdoyVMvkv?=
 =?iso-8859-1?Q?poE7MPKYJGin5fIVTPhmWnmekeWI2cv5Q6+1sSZtLQxAl0LJW64KBOqI5U?=
 =?iso-8859-1?Q?BIxK9+vF98utuu+z+D3FPMfKPbCsKJKCQQm1GdTea5+HGTCj6lfHLY9QzU?=
 =?iso-8859-1?Q?cVfpvtB63irfGhVUOGDWc48kr/xgDpB9EYSx6K2eCTV1IrtYtH9Gpds3DR?=
 =?iso-8859-1?Q?WpwY/R1EN+8y+9hKPDO4qzje7lz4pnDAFK2nlsCAWartSKZSx/HzOEE9bj?=
 =?iso-8859-1?Q?yONNljgcLy5EbBKL3h5bBOh6bNe6/bqen/fMmwmUoj0QLLzdfPQzo/sBdu?=
 =?iso-8859-1?Q?PUtQzSwp5+RJpb9YPP2AiuDcK3h7mHpCh9XIt+tIwGUulf+xdtM3Dmm4gC?=
 =?iso-8859-1?Q?Bort6sbHwNSA+8CW8C9a2BtqogvVHHArdmp6JKV0INN36uS46y60X3lmT6?=
 =?iso-8859-1?Q?t0FLUZ03w5v/KxwZwcwHJjErXrRKTmfhFfjYonYCrZRCub6zNTTnyXEr32?=
 =?iso-8859-1?Q?8by4kU1NVylBxMWy1SKtGU9P+sFJS/6M6p+jVn3ic8cSv2U60OSp3EUoEv?=
 =?iso-8859-1?Q?D7SJeskd3EcQAIlXrQ2tIgLrH9aPrRWWmetREm9Mefk4hDthhHOCJ4o3Yy?=
 =?iso-8859-1?Q?hMsv9RKyXE2xuLNOZciCVFu8v0BaWHbw93m3ansxOA0G/Xd9ba/n3R8EjE?=
 =?iso-8859-1?Q?3YxnSzsqTM8nmkBqcvcqJQcRUh6+6RqE3WygbCnquGJYd7cCHFepVOSmJi?=
 =?iso-8859-1?Q?4Kulvbvm0qLueZfEMFF36qsXMe61Qjf9gIOuX+Z3wMPJPThNaGtRLKv5T/?=
 =?iso-8859-1?Q?H2GuVq8ib1VIGuSA9mZ3iuod49kv45i41eRTlWhJ8zG9tgt5fun0LMIFRz?=
 =?iso-8859-1?Q?IE57cMDsO7lpBQvkceSChhpq5gRUUoU5UXKCVqoAazMQFmADA3LhjKul9W?=
 =?iso-8859-1?Q?dFtZS0yl2Ca7Fl1tyryr9KaZT4cGW+fmep9QVTpSFOJ0ysvn3PGLPQ3QHE?=
 =?iso-8859-1?Q?43wIInjjFf3tSEDE+2sEog0ejK392+jThApzCWAIEvgCbS6eRFCABe8XR3?=
 =?iso-8859-1?Q?lLTzEPyxyfWKx9AZe1W8ifY34xty618=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a55796dc-0cfa-40eb-83a6-08de8e53da0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 11:59:52.1375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ek5dL2mc6Wu9WnJ+VuYQVkSO0YEG4cqWg85oR1lNr/Tb+51h2r+RgBJDlMNc0pSI3jIdvWShUjf9m5nDplv4OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8639
X-purgate-ID: tlsNG-33051d/1774871994-EAE8572C-4DE07EC7/0/0
X-purgate-type: clean
X-purgate-size: 1989
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[epam.com,quarantine];
	R_DKIM_ALLOW(-0.20)[epam.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[Mykyta_Poturai@epam.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[epam.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AB34435AB78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With CPU hotplug sysctls implemented on Arm it becomes useful to have a
tool for calling them.

According to the commit history it seems that putting hptool under
config MIGRATE was a measure to fix IA64 build. As IA64 is no longer
supported it can now be brought back. So build it unconditionally.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
v6->v7:
* no changes

v5->v6:
* don't change order in Makefile

v4->v5:
* make hptool always build

v3->v4:
* no changes

v2->v3:
* no changes

v1->v2:
* switch to configure from legacy config
---
 tools/libs/guest/Makefile.common | 2 +-
 tools/misc/Makefile              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/guest/Makefile.common b/tools/libs/guest/Makefile.c=
ommon
index b928a4a246..03dfcee7fa 100644
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -7,6 +7,7 @@ OBJS-y +=3D xg_private.o
 OBJS-y +=3D xg_domain.o
 OBJS-y +=3D xg_suspend.o
 OBJS-y +=3D xg_resume.o
+OBJS-y +=3D xg_offline_page.o
 ifeq ($(CONFIG_MIGRATE),y)
 OBJS-y +=3D xg_sr_common.o
 OBJS-$(CONFIG_X86) +=3D xg_sr_common_x86.o
@@ -17,7 +18,6 @@ OBJS-$(CONFIG_X86) +=3D xg_sr_save_x86_pv.o
 OBJS-$(CONFIG_X86) +=3D xg_sr_save_x86_hvm.o
 OBJS-y +=3D xg_sr_restore.o
 OBJS-y +=3D xg_sr_save.o
-OBJS-y +=3D xg_offline_page.o
 else
 OBJS-y +=3D xg_nomigrate.o
 endif
diff --git a/tools/misc/Makefile b/tools/misc/Makefile
index 6ee783f43e..5a206133f7 100644
--- a/tools/misc/Makefile
+++ b/tools/misc/Makefile
@@ -16,7 +16,7 @@ INSTALL_BIN                    +=3D xencov_split
 INSTALL_BIN +=3D $(INSTALL_BIN-y)
=20
 # Everything to be installed in regular sbin/
-INSTALL_SBIN-$(CONFIG_MIGRATE) +=3D xen-hptool
+INSTALL_SBIN                   +=3D xen-hptool
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmcrash
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-hvmctx
 INSTALL_SBIN-$(CONFIG_X86)     +=3D xen-lowmemd
--=20
2.51.2

