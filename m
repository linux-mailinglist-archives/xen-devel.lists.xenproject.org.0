Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pWJJNNjVwmnmmgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D18731AA8C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261241.1554338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56M9-00046j-35; Tue, 24 Mar 2026 18:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261241.1554338; Tue, 24 Mar 2026 18:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56M8-00045N-UF; Tue, 24 Mar 2026 18:19:56 +0000
Received: by outflank-mailman (input) for mailman id 1261241;
 Tue, 24 Mar 2026 18:19:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w56M7-000440-IU
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:19:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w56M6-00A2x9-Un
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:19:54 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5a3-e002-0a2a0a5209dd-0a2a4505e79a-32
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:19:54 +0100
Received: from [40.93.196.34]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5c9-5aeb-0a2a45050019-285dc422f0cc-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:19:54 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:19:50 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:19:50 +0000
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
 b=ahhF7RNlLQWX0UJbJ00j31vT1XsI4lwvk09L8n8bOrzGQb9o8zSoKMIxSFsl3dd3MAe7d8a2hnVihH376trEgyKKRlCbSRqFLv+fSqzBbfVWpB3q71x7cPO9eOYpqOzDj0v425ZxcUdiwh4mruC/fhsPkgIZkpyuWBauJGAkWA5p0xL3r8BeEUkse8J6b4obbSc6m/7B+HJwvQI2XbpCasfZRNqIdNmNaFRXwF4qFdZrmYMEAwQntJo+NhZHd63c1AxyyR1EtsOLIqJGoXXr7/ToTa3C17D2YzjJ45hP4FfTKXxuhEDcb7BZFvPU0g2GnpuxuQ5vddrQU7xTGpb8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wYMxjp6Ztn3OKgr+Kj5cB1smirnWjdwasezqGKeb+8=;
 b=mtGSICZ5SXUC0Ur1g7DodHR4tm/HhbThk4CeAGqF3Ua4b6jwseQsF77ZN3ZjT2gM3iMvjbSUoKD/ZbBptC3OsUqYJEU5p+imIe4UfAw4pRf+UZCtA9qSCR1jxxtoPNnVacDZkhfh8oopk2+vBJwFLwO9uMWlHLkFSM+cpTzlwcf2D0MwRFIFy1wbw6BwwvUsB1JYa9gal+T7OJdNjJiR8GeOqeeQxZaeyjvYh7RKWBUk+tv3gN7iEQdlJSWRi84C+dpd7KkPwWmCzpLUKNzim+KU6pxWDxGk5e1EAuQfrWqP9t7b6pGPQeWD21uTz3FSJCzYx1S+9AcYIjDiKiTCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wYMxjp6Ztn3OKgr+Kj5cB1smirnWjdwasezqGKeb+8=;
 b=dFapwf2GxGlvjCNYxNwcbUnwtrPB+T3iZg62LY9hHcDQ2Yi8tl8uhY8kA+X/O47WWEeDyLrIV79p2+f3qlzC5M0URelcjykDTW6q6z/VJIz+TPWE3zcuLGKAiDi/m/J+dV6iXjjcT2qDBeFu3Vlhyf7GNubGrDmAs2/Xe29+ZOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 2/9] x86: Always use eager-fpu
Date: Tue, 24 Mar 2026 18:19:30 +0000
Message-ID: <20260324181937.2465574-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0316.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::20) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: a45a4603-db05-499e-cd68-08de89d1ea4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Wq/qdSjDYxA2ZVPLEauisoMGCozkRbhEOC1et/+VLoi/4v0rCviel/EqFod57e4wSXKlf15URfMU3iUcWJSj07fzBLiOFke+YEJk+5ngCRZ7vLZOsDcoYndTkgbNXDovk88ZW0msxFqN7grmCmyIPtyWESR+KxCIPeSGXepMuQjPeOW9yTu19xRqHdA85KBqxU/zGok2kryIDKNQInaRKYDOFbd8mbc8sMWYy/MUBJWgoDyYm+OrAWv4OtncIhOsRZBHRGxTO691aOeyXoo4SHkbF8YAH9Zu4naofSSy7SwNKyt+vMqTVRdlY8tvCc1qzJqmiiSlrsvkAzANXFd3Xz9p8cv1zPgE6i2wNbF8lHBT1mzrAovtpNTJ18f220D+fmCETkP0beeUNhacKNaP+hgqVXuDR0sD5HiAMIBo8PWrWchDntLxEPEk7rVlN5G/zyppAQsLdqyFMsn5l5p5Az6nbLe80yZAmD44vygNsgZhzTUN/3Ahs09GeP0sr7LzpTIzKVnapsTvgB3x58hYgOBetuAomvYAjCxOa3CVTsfhiNDN1NjEbMpUDKnV7Qyq2e0jqYhx4Y/vdZXn1x3pvxa4pgkzZwwsHsVHfJmzRaFKdxkmkh8e46ZlxP/f86kRhfPcBreNbnTTrLcMXgjggATQjbiRxvEV1uDBdCfAKOlxj66CyKtUQQw3Xu36l/AfVMr+bd1qUzPDQgfLXz3BY1Kc6WTV9VdLnrnKdjmW6wc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CydBiId7rXYzqfQhKu/I8oTVWFbA/liIGhUYyk7YMiID5ivq1htZfZz4vBkF?=
 =?us-ascii?Q?g33BIiGEViwGWyxTNdN3U+x1M/cRaqCmn7+7o0BYwjdNMsqCGLDvn8byvxY6?=
 =?us-ascii?Q?/qs6i07w+YuE5ijCXzjX9rm0zgfYLUENm19rpY1ESIMtyAOnW3JfbvIg7Ikz?=
 =?us-ascii?Q?7EMrM0YQTnNOLp9bwz1cgaN2Y9QvC0UKvKy7qNskEPnZW131SbASWo8scpG/?=
 =?us-ascii?Q?vjGtxzadeKsLxc+s3gTcelLIz1cG7y3mP4py9iXT5SSCnJUBo5AGdENqOwUT?=
 =?us-ascii?Q?HVU2+wvZqC4nsY7WfiSDfsrmnyOZOfX3aDqtH8pfG41kf2v62qnOt24DNojN?=
 =?us-ascii?Q?0dXl5ggXDUXxWjtvMISi7vgw/2v7tUOiGwfPusipUFi4pDTPCi75j1rAluKU?=
 =?us-ascii?Q?MiMm1IYztI0EICQTpaCWAbfDbfR5GGnwsaUX4uBmpvquJqvgsL1yre5rULUs?=
 =?us-ascii?Q?OEbXTeItO0Tn9xnmzm3p+zav26gENXGEdfOcvboge4ui/vMoEstFVciZuSQV?=
 =?us-ascii?Q?tGzhcOb71Rt2Ax4LIWEhfgiOry4K+aaZukpu4ZPr05dvItqbYPVsnkWXt/jV?=
 =?us-ascii?Q?P6fA5qErbdzln8iafXZCN1nvDS4Eo6iCmzLxYaV7UTVk8dc4so/5M1Hht9QV?=
 =?us-ascii?Q?BBmhYmFvZkJXcPwVCtN6WAx/KEaWkdis//G9fyIOe1z7woRtuKAIv3Cay6kd?=
 =?us-ascii?Q?NlK5CZUEbod4SmKVostQWQz2nTMJSnrYQ3FkLeaC2Yun5BI1sqkWbnCRA824?=
 =?us-ascii?Q?6DzaCtRRdgfkJR9N1jY5IHPspFuckEVzI15R6vZ4efvGCJ/p1jHR+QMEsUlZ?=
 =?us-ascii?Q?HcfNq1CfsNx/TtTNV05tvrGOINZTIcA1tzKazEvfLj6zX+czpOFIqYHIDDDM?=
 =?us-ascii?Q?OAAI33paMNFtt8Co1bYDkulrMEq5TRpHD7xO5cFC7XTTV5i5DjvyQLlsi032?=
 =?us-ascii?Q?mwxOv1tfp0q6mUoOl6UudCS08Py9LlgnuU4LasePVAJibKtDVsKitmc2XQCN?=
 =?us-ascii?Q?kETkwRq8zY4ff/8GSIzaLuLD7jcIjcAhzQsaeNEYwGRInhfNNbDRVXa1Dk50?=
 =?us-ascii?Q?UnezPZ/2v7gYTn8PgoUFlgimjCfqGZBCcK/FghX/Xm64VH9M3FHte0teRpwt?=
 =?us-ascii?Q?9hxLiEkqU84aqwi/1clvbcrhbE1NA0Ui30QE+LDp6UnVR+wY5vZ6scOSJkox?=
 =?us-ascii?Q?jI++/UfkbVixVo/RRN5fjDZNrWMT9XTGYzFO3X6DEWjiAYEpcHZ6s8n8jJss?=
 =?us-ascii?Q?kuG+AeuFl8CD8bt9g+v1Sk77kvBxVmC8xlOXqP5evpPHWXT8ydNXXc98WNiW?=
 =?us-ascii?Q?ZWH7TZTdTA/Bz56P6Fkae5lidpiPVJaAXkLfPe+y+y8lcZVZ/2be6v2xdRTA?=
 =?us-ascii?Q?Zqtln1C/h+QSM2Rlm4z4cC7tby7yIgi47YozjYz8NThdokj82Gtmh12k1R/z?=
 =?us-ascii?Q?2tPOQc5An0eg9xGD9lEXX59rOntFMGA81HdColfLmE0ixorxgY4Csp/uBCIF?=
 =?us-ascii?Q?G3MmqCRcaa/ywSmgwP/HHaP7lJlbzA5mtJsfWt44Gxw49EwfllEIdoCk5xhU?=
 =?us-ascii?Q?WSTsdfJqpkLMtSI7mnbPIHYW6VEqaFr2vsqeEar/UNLGyczt1N5xBOEsMcv+?=
 =?us-ascii?Q?hxwnDgHB1ALgZCKI+j0jNLoWrv6UjLG+B1yjeeqpzWvJuyJL6CXOkftbUwFJ?=
 =?us-ascii?Q?fpVMolNKroh5cYvowSU/VS6JFhxpDdMJQ/jOiZumea0aaHafB8p+YBXuqG68?=
 =?us-ascii?Q?e5a8ESaQ4JgkRBTMvsLuNlOE9t507Do=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45a4603-db05-499e-cd68-08de89d1ea4b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:19:50.1388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpLa04H0jQcmQmkXhIi6z6vaszhAg2R6uhgUxJK64wzilxys/hl816whHeOidBKogPOrnW91g5WFjYbPM9YAq/DUqk6dq0k9MR6aiK4aSN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771
X-purgate-ID: tlsNG-c201ff/1774376394-20695488-34E44475/0/0
X-purgate-type: clean
X-purgate-size: 11235
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid,amd.com:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2D18731AA8C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Lazy FPU avoids some work during a context switch but pushes more
expensive costs elsewhere:

* For a workload running some Windows VMs, I measured about 83% of
  context switches out had used the FPU so most of the time the FPU
  save/restore is not avoided, just delayed.
* A key difference between 32-bit and 64-bit OSes is that %xmm is in the
  base featureset for 64-bit and thus gets ubiquitous use in userspace.
  This is likely why we hit 83%.
* Setting/clearing the cr0.TS bit is serializing and reportedly slower
  than the processor optimized xsave/restore.
* Linux uses PKRU so a partial xsave/restore is performed on each
  context switch anyway, followed by a second xsave/restore at some
  point during execution. This interferes with the 'modified'
  optimisation that hardware uses to try and reduce the cost of the
  following XSAVE.

There is no measurable performance benefit for using lazy FPU and it
adds unwanted complexity so remove the option and always use eager-fpu.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
In v2: Expanded the commit message

 docs/misc/hypfs-paths.pandoc         |  2 -
 docs/misc/xen-command-line.pandoc    |  7 +--
 xen/arch/x86/i387.c                  |  2 +-
 xen/arch/x86/include/asm/spec_ctrl.h |  1 -
 xen/arch/x86/spec_ctrl.c             | 88 ++--------------------------
 5 files changed, 6 insertions(+), 94 deletions(-)

diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
index e86f7d0dbef9..1553cb0bcb7f 100644
--- a/docs/misc/hypfs-paths.pandoc
+++ b/docs/misc/hypfs-paths.pandoc
@@ -108,12 +108,10 @@ A populated Xen hypervisor file system might look like the following example:
             active-hvm/      directory for mitigations active in hvm doamins
                 msr-spec-ctrl "No" or "Yes"
                 rsb          "No" or "Yes"
-                eager-fpu    "No" or "Yes"
                 md-clear     "No" or "Yes"
             active-pv/       directory for mitigations active in pv doamins
                 msr-spec-ctrl "No" or "Yes"
                 rsb          "No" or "Yes"
-                eager-fpu    "No" or "Yes"
                 md-clear     "No" or "Yes"
                 xpti         "No" or list of "dom0", "domU", "PCID-on"
                 l1tf-shadow  "No" or list of "dom0", "domU"
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index ebdca007d26b..6c77129732bf 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2470,7 +2470,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 >              {msr-sc,rsb,verw,{ibpb,bhb}-entry}=<bool>|{pv,hvm}=<bool>,
 >              bti-thunk=retpoline|lfence|jmp,bhb-seq=short|tsx|long,
 >              {ibrs,ibpb,ssbd,psfd,
->              eager-fpu,l1d-flush,branch-harden,srb-lock,
+>              l1d-flush,branch-harden,srb-lock,
 >              unpriv-mmio,gds-mit,div-scrub,lock-harden,
 >              bhi-dis-s,bp-spec-reduce,ibpb-alt}=<bool> ]`
 
@@ -2574,11 +2574,6 @@ On hardware supporting IBPB (Indirect Branch Prediction Barrier), the `ibpb=`
 option can be used to force (the default) or prevent Xen from issuing branch
 prediction barriers on vcpu context switches.
 
-On all hardware, the `eager-fpu=` option can be used to force or prevent Xen
-from using fully eager FPU context switches.  This is currently implemented as
-a global control.  By default, Xen will choose to use fully eager context
-switches on hardware believed to speculate past #NM exceptions.
-
 On hardware supporting L1D_FLUSH, the `l1d-flush=` option can be used to force
 or prevent Xen from issuing an L1 data cache flush on each VMEntry.
 Irrespective of Xen's setting, the feature is virtualised for HVM guests to
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index b84cd6f7a9e1..954ba3b1799b 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -297,7 +297,7 @@ void save_fpu_enable(void)
 /* Initialize FPU's context save area */
 int vcpu_init_fpu(struct vcpu *v)
 {
-    v->arch.fully_eager_fpu = opt_eager_fpu;
+    v->arch.fully_eager_fpu = true;
 
     return xstate_alloc_save_area(v);
 }
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index 505e3ab863f0..8f82533c416a 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -79,7 +79,6 @@ static always_inline void spec_ctrl_new_guest_context(void)
 extern int8_t opt_ibpb_ctxt_switch;
 extern bool opt_ssbd;
 extern int8_t opt_bhi_dis_s;
-extern int8_t opt_eager_fpu;
 extern int8_t opt_l1d_flush;
 
 extern bool bsp_delay_spec_ctrl;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index dd0413e1fc13..bc8538a56f0e 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -61,7 +61,6 @@ static int8_t __initdata opt_psfd = -1;
 int8_t __ro_after_init opt_bhi_dis_s = -1;
 
 int8_t __ro_after_init opt_ibpb_ctxt_switch = -1;
-int8_t __ro_after_init opt_eager_fpu = -1;
 int8_t __ro_after_init opt_l1d_flush = -1;
 static bool __initdata opt_branch_harden =
     IS_ENABLED(CONFIG_SPECULATIVE_HARDEN_BRANCH);
@@ -104,8 +103,6 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_msr_sc_pv = false;
             opt_msr_sc_hvm = false;
 
-            opt_eager_fpu = 0;
-
             if ( opt_xpti_hwdom < 0 )
                 opt_xpti_hwdom = 0;
             if ( opt_xpti_domu < 0 )
@@ -336,8 +333,6 @@ static int __init cf_check parse_spec_ctrl(const char *s)
         /* Misc settings. */
         else if ( (val = parse_boolean("ibpb", s, ss)) >= 0 )
             opt_ibpb_ctxt_switch = val;
-        else if ( (val = parse_boolean("eager-fpu", s, ss)) >= 0 )
-            opt_eager_fpu = val;
         else if ( (val = parse_boolean("l1d-flush", s, ss)) >= 0 )
             opt_l1d_flush = val;
         else if ( (val = parse_boolean("branch-harden", s, ss)) >= 0 )
@@ -648,32 +643,30 @@ static void __init print_details(enum ind_thunk thunk)
      * mitigation support for guests.
      */
 #ifdef CONFIG_HVM
-    printk("  Support for HVM VMs:%s%s%s%s%s%s%s%s\n",
+    printk("  Support for HVM VMs:%s%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_HVM) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM) ||
             opt_bhb_entry_hvm || amd_virt_spec_ctrl ||
-            opt_eager_fpu || opt_verw_hvm)           ? ""               : " None",
+            opt_verw_hvm)                            ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_HVM)      ? " MSR_SPEC_CTRL" : "",
            (boot_cpu_has(X86_FEATURE_SC_MSR_HVM) ||
             amd_virt_spec_ctrl)                      ? " MSR_VIRT_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_HVM)      ? " RSB"           : "",
-           opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_verw_hvm                              ? " VERW"          : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_HVM)  ? " IBPB-entry"    : "",
            opt_bhb_entry_hvm                         ? " BHB-entry"     : "");
 
 #endif
 #ifdef CONFIG_PV
-    printk("  Support for PV VMs:%s%s%s%s%s%s%s\n",
+    printk("  Support for PV VMs:%s%s%s%s%s%s\n",
            (boot_cpu_has(X86_FEATURE_SC_MSR_PV) ||
             boot_cpu_has(X86_FEATURE_SC_RSB_PV) ||
             boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV) ||
             opt_bhb_entry_pv ||
-            opt_eager_fpu || opt_verw_pv)            ? ""               : " None",
+            opt_verw_pv)                             ? ""               : " None",
            boot_cpu_has(X86_FEATURE_SC_MSR_PV)       ? " MSR_SPEC_CTRL" : "",
            boot_cpu_has(X86_FEATURE_SC_RSB_PV)       ? " RSB"           : "",
-           opt_eager_fpu                             ? " EAGER_FPU"     : "",
            opt_verw_pv                               ? " VERW"          : "",
            boot_cpu_has(X86_FEATURE_IBPB_ENTRY_PV)   ? " IBPB-entry"    : "",
            opt_bhb_entry_pv                          ? " BHB-entry"     : "");
@@ -959,75 +952,6 @@ static bool __init rsb_is_full_width(void)
     return true;
 }
 
-/* Calculate whether this CPU speculates past #NM */
-static bool __init should_use_eager_fpu(void)
-{
-    /*
-     * Assume all unrecognised processors are ok.  This is only known to
-     * affect Intel Family 6 processors.
-     */
-    if ( boot_cpu_data.vendor != X86_VENDOR_INTEL ||
-         boot_cpu_data.family != 6 )
-        return false;
-
-    switch ( boot_cpu_data.model )
-    {
-        /*
-         * Core processors since at least Nehalem are vulnerable.
-         */
-    case 0x1e: /* Nehalem */
-    case 0x1f: /* Auburndale / Havendale */
-    case 0x1a: /* Nehalem EP */
-    case 0x2e: /* Nehalem EX */
-    case 0x25: /* Westmere */
-    case 0x2c: /* Westmere EP */
-    case 0x2f: /* Westmere EX */
-    case 0x2a: /* SandyBridge */
-    case 0x2d: /* SandyBridge EP/EX */
-    case 0x3a: /* IvyBridge */
-    case 0x3e: /* IvyBridge EP/EX */
-    case 0x3c: /* Haswell */
-    case 0x3f: /* Haswell EX/EP */
-    case 0x45: /* Haswell D */
-    case 0x46: /* Haswell H */
-    case 0x3d: /* Broadwell */
-    case 0x47: /* Broadwell H */
-    case 0x4f: /* Broadwell EP/EX */
-    case 0x56: /* Broadwell D */
-    case 0x4e: /* Skylake M */
-    case 0x55: /* Skylake X */
-    case 0x5e: /* Skylake D */
-    case 0x66: /* Cannonlake */
-    case 0x67: /* Cannonlake? */
-    case 0x8e: /* Kabylake M */
-    case 0x9e: /* Kabylake D */
-        return true;
-
-        /*
-         * Atom processors are not vulnerable.
-         */
-    case 0x1c: /* Pineview */
-    case 0x26: /* Lincroft */
-    case 0x27: /* Penwell */
-    case 0x35: /* Cloverview */
-    case 0x36: /* Cedarview */
-    case 0x37: /* Baytrail / Valleyview (Silvermont) */
-    case 0x4d: /* Avaton / Rangely (Silvermont) */
-    case 0x4c: /* Cherrytrail / Brasswell */
-    case 0x4a: /* Merrifield */
-    case 0x5a: /* Moorefield */
-    case 0x5c: /* Goldmont */
-    case 0x5f: /* Denverton */
-    case 0x7a: /* Gemini Lake */
-        return false;
-
-    default:
-        printk("Unrecognised CPU model %#x - assuming vulnerable to LazyFPU\n",
-               boot_cpu_data.model);
-        return true;
-    }
-}
-
 /*
  * https://www.amd.com/content/dam/amd/en/documents/corporate/cr/speculative-return-stack-overflow-whitepaper.pdf
  */
@@ -2221,10 +2145,6 @@ void __init init_speculation_mitigations(void)
 
     div_calculations(hw_smt_enabled);
 
-    /* Check whether Eager FPU should be enabled by default. */
-    if ( opt_eager_fpu == -1 )
-        opt_eager_fpu = should_use_eager_fpu();
-
     /* (Re)init BSP state now that default_scf has been calculated. */
     init_shadow_spec_ctrl_state(get_cpu_info());
 
-- 
2.53.0


