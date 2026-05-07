Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMDOHbxv/GmkQAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:55:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0C54E7176
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302573.1576459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwO7-0003m9-JO; Thu, 07 May 2026 10:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302573.1576459; Thu, 07 May 2026 10:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwO7-0003jp-GZ; Thu, 07 May 2026 10:55:27 +0000
Received: by outflank-mailman (input) for mailman id 1302573;
 Thu, 07 May 2026 10:55:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wKwO6-0003ja-MT
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:55:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKwO6-003OgN-2y
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 12:55:26 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69fc6f8b-5cb7-0a2a0a5109dd-0a2a4505e784-38
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:55:25 +0200
Received: from [52.101.61.45]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69fc6f9c-aaa8-0a2a45050019-34653d2dad8e-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:55:25 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS3PR03MB989145.namprd03.prod.outlook.com (2603:10b6:8:39b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 10:55:23 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 10:55:23 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgblRAlhqfq5pWmnp9Lmal2yUHFx62ZeCIaR7ZSjTWo+HAJNsw9VAaZ5JQxZ4jjN/l3SiiM6b6AwRTcdsobRw3bMK66Seh0xAyCNyYwd5/ZhkA7zh/ZmHYlIcGpxN6TJZcLJS8iFbX2t/m4nf84be2jr+hh2xEpmEhYXfGboC3QRfjakrWLASTwxVAIPgpmVFKk6/ZfwfrjBP2znsDHiD7K7Q2jhsdDlw+yYgaf8wO+uwhVWxh2SA9u3COgBN+cM0hO+b1e8i1t3VyxPoV4QNncS1EX5XSs6e/jebh0YUCc2JnO7XlsisKvzUFjZXbL5iwI0zmXY4I/2LyyR1Oha7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvcyAkenR48qSLtBoZxitzffCgvZelNVs/f82QPSUT8=;
 b=aWpETBmUbRplB8UdtImrQ2D0xIr3vKN8lcRHWsSX1TMMVO7vNMbVpNFNMm2nz/KuneI7dIlrOFaPEfdHcTUihmWMMvawo7fDd91D/1cOg/66d1BaTRQwOL5ZtyACFNeOrbA74HlYNJVWW29u/XnMYL5CwufXqWnbpwrODeCfC5CnLPcqVLmJ8+FRNp7s/AQxr0/2fCIcOz6B8rvdgmWGDd/SltcuAO5x8r0uvjFVgO9rArpNnc1775GpieaXHb91VrArNvzFljfIKDT3fX9AooJqFJVvJmFzuZc72X2hB6mvamHPrJF++6dKbAvPmtR6+YNT24cLeJkDMiVWyJpo+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvcyAkenR48qSLtBoZxitzffCgvZelNVs/f82QPSUT8=;
 b=kioCf1ZyR446B3oPZ+IDdDWPf3bcm4Wk70ykpTL9Pe91leyBARwjujGv8ryyZu+S4+i6If1S0PQVU5u1WxUGBa7sSejtoCE5/5I7WemJNyUGCruc/iQ2JwGi4vhNoR243+o3/tQqPdmYIEyX8Y63nU7b0OH+FmBvPvgABQUh0r8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2 1/2] x86/svm: Don't toggle local event delivery on stgi/clgi
Date: Thu,  7 May 2026 11:55:06 +0100
Message-ID: <20260507105507.2078971-2-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507105507.2078971-1-ross.lagerwall@citrix.com>
References: <20260507105507.2078971-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0580.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::16) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS3PR03MB989145:EE_
X-MS-Office365-Filtering-Correlation-Id: b15cbc55-825b-4f77-8317-08deac2723c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LmHNSPcReO6R/DgypCNwTZ12q6+OP7hz0SWTBwu9Sx6uwEU8Jg9LczqYyrxN3zJvNcehxwn9rqdPlC93ES8wy/wwqYX6m70FQUCra1HrNKP5+LxJH/Qhi/raWAppVhZCUQCE6ErptMPe5BVVn+EqUNiOgvc2LtAx2Rbp1vnTMJAy7bZ79aylYKsR8suB/OGz1W0fTtYZj8kbT+Pk7P9QNwL1opa7s4TOoNztvTqwixAE4jDyokL5tjqz88dMJHZRk/IeB9+30/bB0CuuhOE9sSDpi5WihxrOMxUm67vwtElPO1LmSIWVdv2gtmrpD5xrhYHm7jWDDlULRIsVP9sWWi0xFN60J/VHEpj0P8Dre7FXgKQgZXx/zRM798gwwfYEs+Up5qrSeHTlzT4+ir4u0guFCc+icpoyEPFAQKo5j9f7y4ePvmr7P7T1lw+g2rOElop9VSgq4o7exmMuxLhSgjjEzdiTfOLzHsUhKOWBuBFcN3sbtw8ZaiOit6Q7ymQMKGzOrdV377R+BTpYL+WOeK9BK5MCM7UzsQRvnG7FEiUyXeF6iroojXlvgT/aIDVPzZDkrBVlIeArWIfT//u8TBoNkA4wQtbKwsJQThwBQBVtFGLcIUD4UKsogaRloZAV3YITVyo5aD1lsQzJ73Lfm4YL9+LSwrFSchpYE71TL0oLniKN9raXABWe8gSPrkvo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9FqnXTRoPRYwp6wuM5ljfCOLfeC+2OTnoZLEMNoOc9j6bAEDpi7fDpQuCvGN?=
 =?us-ascii?Q?hFaXwzYLatAJRtTomY1UgSfzx6yirBsQSwtXdoiACrRuKomA4OHrZy4IK1S6?=
 =?us-ascii?Q?PBLuUuvD27K5DDQDYVTXR9Hd9cbeqb7vX4utb5ZeYuWFoT88y+36FFxhoOP1?=
 =?us-ascii?Q?UGkYcRZhzlRJ8KuPoB9k6VnoIRE6uqXMWVq14QFxPbeZqjjVVKa78jLw8wpo?=
 =?us-ascii?Q?cgaKZhKIp6PwtOuyrJ2Fu/dNz+4k763Gq4pTjv0yClUb0JdrMNqJWuBfEKyP?=
 =?us-ascii?Q?gRZ9qgqMuLTCXZafd8OZvkya8r/E1s0eJXxX+pUfUVGcQEmN9W8/KwQASk3f?=
 =?us-ascii?Q?WfwoVwnKYh1VU9VGHEsbCCx61MDRUncX/3ki49jTy0VOVdKxcCX9PawUUfX8?=
 =?us-ascii?Q?VV28nMVBf2tYtosxjtI1spdm3uhi1GzliklcgsxWt03GyvJV+cEQsCPuEd6M?=
 =?us-ascii?Q?CkP+L2QzXcSAx32n75V0Ue6TVKLGHYtLU/EoqVeZA5jAfQQGmFiQ8NZENijw?=
 =?us-ascii?Q?O32hRHETr9i+NBO052CjcosWdI/EkgXDkkPfE96DEFgICNH0QFtYoEwplMd7?=
 =?us-ascii?Q?Hk0wDnKGgLGS2ao44uWTf5OEj5iphefibHWNcF1k8H0ffq3MdtAUWF1QgSlA?=
 =?us-ascii?Q?tblR5o/jGaZ6pZ6DX7mfQTH6WZG0Nd0JzUYumgjrmH7tGl90rbPazKIWbBBX?=
 =?us-ascii?Q?Qo6R1RIOhvtgP1qYfSZPFaaCwgfgOq5tYNeR6tWyR8ugocXDmC7tCDIJmSEz?=
 =?us-ascii?Q?k7V7NHfGB9obsHzZpRZQdAUrJkrJy7qKzIGG9GICXZR1256zDjQgyA7laSf7?=
 =?us-ascii?Q?fGuRThteeKRYLErXTSCgfI3h50oN+1OWYW/XG/GJxt8upgwDcQCK9SZ/YrPi?=
 =?us-ascii?Q?ib0scREdOLqGGBhDou29/lvhx2cRVJyb9MOuZ0VJeYsXn5gkmQ5r7vh7yUqK?=
 =?us-ascii?Q?iZ21CmCnSRqxGRlE7qKUseV6IxX8Tv0kF1IX6NJXaF9X2J9rlei50oA10xfn?=
 =?us-ascii?Q?zw7mzyGar6Q2JLTuS/uY+mQ4Yis9ZoFsN9FeSjasIyFFvcj7lQAW8FkL5Q/A?=
 =?us-ascii?Q?1a7TRwYfTE4mzDV0gVsx8GT6Gwr5DpDcQe2/sq2mwm/POj3Z2PtL2g/hAGH7?=
 =?us-ascii?Q?U5SZ+TJy3OMlW/tPli/2MXwbCTz3TCXIB2PDxTCavyG1jYq2H0LUrBPpTyl3?=
 =?us-ascii?Q?rY+6X8rREhiNDCuLqgVwrheIeUHyYT03U3NV1gtjgRe1XxhNjKXLbP4i3zhV?=
 =?us-ascii?Q?9J09wBZ7xeypZOpp27xoQ2441+ossP+gxKCDdq7MrNcMsd97B47+SM/sw55O?=
 =?us-ascii?Q?n/S0OfZXlaEy1whBRS6XZ6RlkROWPSwzWfMQzPIQk0yhJEDT9sl7zUjPIbWO?=
 =?us-ascii?Q?+F+bgK16TFEE4SjBHPvnAzXO+v3OAW8LNejIncAz0c911KvzBL6uMzJLJWt8?=
 =?us-ascii?Q?5J0PEA1grFtOLczNyhEOrxM0N96KjtEgpAVrZCM9Ag6yzjbQtxGnxne0XMF1?=
 =?us-ascii?Q?IDqRQEW4aPjR/94OFIMRKT8ksGNzlM8s6+JTDUwt9dLDkDxeJu3vO3KClduH?=
 =?us-ascii?Q?mODTG4hiZ+OLNMcv1BxVGTAw1k0UyriM2nYWaBsmunxJnV8DaYDafJ8KaR3Y?=
 =?us-ascii?Q?2cTqKt61AGv9FICVNS0oBS4PZaIGvxjLkvUVbHgSiYzkM01/7JlL3Z+LWdUh?=
 =?us-ascii?Q?kT+uslbKu+WSYQ6qo735VvvNoKAtKJHkdd4y5OgGmFvitjcY8HtEGdzSixfP?=
 =?us-ascii?Q?3zN5wvTBYlVFT+C6AgmjCjBzemwff8o=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15cbc55-825b-4f77-8317-08deac2723c9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:55:23.7938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+YCtLZ8rOPW2guT5siIe+nFS1vX4j2Ctg+5H/rDmX/An2vPsqWghkPKCV8v0kVrC1DbrLRfoZYQdFC+R3FD8uvTNGSXGBNTMvjnJr6VpIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989145
X-purgate-ID: tlsNG-c201ff/1778151325-E2B96443-743B0F5E/0/0
X-purgate-type: clean
X-purgate-size: 2650
X-Rspamd-Queue-Id: 2D0C54E7176
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

There is no need to explicitly enable/disable local event delivery on
stgi/clgi since HVM event delivery already takes into account the state
of the GIF (and IF). This ensures the behaviour is consistent regardless
of whether vGIF is used.

Fold the functions into the callers since they are now only a single
assignment.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

New in v2.

 xen/arch/x86/hvm/svm/nestedsvm.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index ef6fa5d23b67..64fbfe8fa71f 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -19,22 +19,6 @@
 #define NSVM_ERROR_VVMCB        1
 #define NSVM_ERROR_VMENTRY      2
 
-static void
-nestedsvm_vcpu_clgi(struct vcpu *v)
-{
-    /* clear gif flag */
-    vcpu_nestedsvm(v).ns_gif = 0;
-    local_event_delivery_disable(); /* mask events for PV drivers */
-}
-
-static void
-nestedsvm_vcpu_stgi(struct vcpu *v)
-{
-    /* enable gif flag */
-    vcpu_nestedsvm(v).ns_gif = 1;
-    local_event_delivery_enable(); /* unmask events for PV drivers */
-}
-
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
@@ -161,7 +145,7 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
 
     svm->ns_iomap = NULL;
 
-    nestedsvm_vcpu_stgi(v);
+    svm->ns_gif = 1;
     return 0;
 }
 
@@ -667,7 +651,7 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
         return ret;
     }
 
-    nestedsvm_vcpu_stgi(v);
+    svm->ns_gif = 1;
     return 0;
 }
 
@@ -1214,7 +1198,7 @@ nestedsvm_vmexit_defer(struct vcpu *v,
     if ( vmcb->_vintr.fields.vgif_enable )
         vmcb->_vintr.fields.vgif = 0;
     else
-        nestedsvm_vcpu_clgi(v);
+        svm->ns_gif = 0;
 
     svm->ns_vmexit.exitcode = exitcode;
     svm->ns_vmexit.exitinfo1 = exitinfo1;
@@ -1502,7 +1486,7 @@ void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v)
     if ( (inst_len = svm_get_insn_len(v, INSTR_STGI)) == 0 )
         return;
 
-    nestedsvm_vcpu_stgi(v);
+    vcpu_nestedsvm(v).ns_gif = 1;
 
     __update_guest_eip(regs, inst_len);
 }
@@ -1523,7 +1507,7 @@ void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
     if ( (inst_len = svm_get_insn_len(v, INSTR_CLGI)) == 0 )
         return;
 
-    nestedsvm_vcpu_clgi(v);
+    vcpu_nestedsvm(v).ns_gif = 0;
 
     /* After a CLGI no interrupts should come */
     intr = vmcb_get_vintr(vmcb);
-- 
2.53.0


