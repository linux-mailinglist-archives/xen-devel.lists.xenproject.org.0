Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eImBNtAQC2pN/gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 913AD56D6D9
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 15:14:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311842.1581968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxnW-00088z-Ij; Mon, 18 May 2026 13:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311842.1581968; Mon, 18 May 2026 13:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOxnW-00086N-Fl; Mon, 18 May 2026 13:14:18 +0000
Received: by outflank-mailman (input) for mailman id 1311842;
 Mon, 18 May 2026 13:14:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wOxnU-00086G-Hi
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 13:14:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOxnT-008UyI-TC
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:14:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10a3-bab6-0a2a0a5309dd-0a2a4505c2f6-6
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:15 +0200
Received: from [52.101.53.57]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6a0b10a6-aaa8-0a2a45050019-346535396214-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 15:14:15 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by IA1PR03MB8062.namprd03.prod.outlook.com (2603:10b6:208:595::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 18 May
 2026 13:14:12 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 13:14:11 +0000
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
 b=q9eK/fhw6v7L/F3pP5ohKLYFBcy8OLMueS6LmjqlWItaUnSUME8dce+dNzjj3pfmmtNhmVPcRVCcsS10L4NNTefVgJVE3V256H9kvlS9sYkriOxfcwgzxsBQGwUCYE6fFPSzLSDtadWhWC26pei4WGM8TWaeCsBRze9TuTcVdzJoIJxYFq84WwsoElgKDILiL7qrghTSTqjaap8dDfTh0nCVT+aTGuIHe5pEvmOs6qdx5qDL70ZbiGxkEjesVttm1V1mAavTygJFUfZLP38szk/cXlwFmoF9Sq7nbdhee8jAt58ZZaN7HzYo6Aa0WAXapvBqGwT4EX+vagGjBXCTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8rRp+XT6d1dIZLxltye5ArmuW4P4fmwGrddNG+ri2Y=;
 b=mEThNuDqI6C4y1F9VTlFi1YAkj9AOLR/jkPjOVJdE/fCfH0FYaczlzQeewchE7IMkXjjDHe2cPZbjdVnDjmnnmXe3HXwLK4cluS7PcWfp9Ic9qD/N6ZCmYuEHGaZAstNIy00ut/o+mLkBGja5oO9nUsZuwsdhJP872q8P2v92mhYk68/OJQ2kVyOaeqvmNRtteD7r/OB22KwX2FQX/1kG5fpmBw4ThJ/5TRzyyz65baevj3wkWq4a7URa7q4C4aZExVogF5i9oIXv73waJ853Zp83j7uy9GKuEfIsnWdS4cU4hm9X9FCIfqzyla8WtEC2G8JHNYsOTYGE8njQg3F1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8rRp+XT6d1dIZLxltye5ArmuW4P4fmwGrddNG+ri2Y=;
 b=RMbhchw7gErYf/K0j3WBQhCFFtRc9LxRuyNp3eshXaPudqHpnA58h1fDqsab+dJzhQq3UiAysmR91MAEwCl8ieT/twnUHfnGktDo+6ONXPd5E/kQPN4YLYrOYc/brWN6jNM7stS8btLkc/lJzDAQa0log5490WWe3ZLNgMcA50Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [RFC v1 0/7] x86/hvm: Start unifying VMEXIT and emulated paths
Date: Mon, 18 May 2026 14:13:57 +0100
Message-ID: <20260518131404.3716969-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::19) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|IA1PR03MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 35658420-575a-4af2-c7a7-08deb4df5a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	FXHYlOpW+8UNip9YZHRRAxyewz9lNsS2fgOVIvJgSdHSgvOY/jxbdayEp0iEU0KgWu7pW9udTawG+2pKKSxBsBbdXDXwOhThU94HM3xmIfF92q7Bx7aslIsou+2a/9qzgN6J+ufBKYBCVmS7Zh0NkrjLypJE9tk+idOSJ2u01VV42fbeTgRiMWb/GC2QuBmyVZvC5hOp5Q0rs+TQy/7ijrMScoFbL+hzQmV01u4l7Sc3ijF193L+xOmK84NO3MjauTItEiaDkYBwkJK68jkmuZHP50UgRCyLIWHrk4fWh3A36lqjW2JwxP6MbZiPUPIYGyhcJh00HbBhoo9luLPXvUHbx4p9RHgvclDKjzsgV2rd9HO6pu8TPXQj5Jsf/rTbEaA/Ep5j5FmX+q/vWWBxbOpPBSmMunwcE8m4fXt/4uUiSmpR/S/GOnN2RFjkfkvYPxKocePKcCDM2A0j6NDCAIKF3sT/+6o6aPOCAh0yBl9WJxXHl2U8HQ/WkCA69WVz6o5wFuWuGWxPZlPT7R4/MS8pEoGKpbpjw6AKfyuaXFH9gfJR3NL3x7JWp2cocP6T16H2bV9MjFJbtxSwv7F6tdCc+m2bpnfXrmHw6uSzNMzLHHs/Do1fkFVmqhy9J8gjAiv8xZjr3Je71pigQ/SwrpxaPDwgk7X0NwEjBynrRm7xMzfekbEZWASjPbpwqtnW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bsnw3taHEjyUcF9M7PtooiDFFblT4Re7tk2P0Jt+mpPxMb4wWffLYJvgd3sE?=
 =?us-ascii?Q?YXua5cS/rwpP/ss1/pz7XaeagCyaTm0z9bNWhB7dobdMsRuhbQ/eOl6RKkHk?=
 =?us-ascii?Q?+sqbIxRCqMpoYZEsXqX/GDFmpUmldoZSVl1ynX2gPhss76iXFQUuYAykZZRQ?=
 =?us-ascii?Q?aA5an8QeQhemHNfzyRu3yB3nF6aCgs9/nm6bF4oD2A2o0uIVM5hsyh66RXyx?=
 =?us-ascii?Q?Z0L0FeSByrcmd8aaVjrYxLGM38N6J8LcGkF6Irp3bJyUPphpbEiM9OJTygF+?=
 =?us-ascii?Q?wqNXedIVzvyWK2T4JsiSkaqdzB6fzYfcwPqvRbl2cqkJ02bDxYh8yIsgZ9uj?=
 =?us-ascii?Q?oJDBTKcE4MGknwZ3S/XD888c1ytKtXbI3uG3jcEbM9icdQt7RwuyLXd3bo7m?=
 =?us-ascii?Q?3GC7qDrWPKcRVqJL5ASUBMgrR6Ed9iHp/Ee/mffdy7hfDYoWm1IyX70hm1nE?=
 =?us-ascii?Q?3pMoYM2txf1e25tF8sYeG84x4eCeKpG+67WHmSHmWdAk5GzY6MdMqz8/ttI8?=
 =?us-ascii?Q?AMtaS50mw+49EwZbWwZOfYEiFza4/RD4YntSeajwjZuyXveHNVLNBWkZhne+?=
 =?us-ascii?Q?DYHF5thC2wVEX21WCOaGA6AOmSrap3FYLDv6AdkE/PWtWotWEQkTWT7IBLgB?=
 =?us-ascii?Q?+0FN/2RK5tfThRFJxO/41wnkiBbVloQWTCsk71EwYI/aZQDg0VPtqcKNkLFD?=
 =?us-ascii?Q?80YmnyqY3HG9uqe+T4I3Ou55xwgEWbI2gheMVIt/i5MGuj4cGv1WeNTJ6KIe?=
 =?us-ascii?Q?V13XGOixER7c1ly4+81Od4ZLZwPjOFqsflqpKoMqWcpoyItAsE5PLvxKeVey?=
 =?us-ascii?Q?IJN23z5QmQN8iHbXwN4W/PodTSu5T9mx/zaznsxrPAelqgMICmr1Y8XOQNT6?=
 =?us-ascii?Q?f8n26oCB0r9s9kdn1eIMb/LN2p9fQH8K15RTeI125akt0bnBlNWfLMvvFfoy?=
 =?us-ascii?Q?C6tZY+CLCTLKe5akElHG4C4jugVnOncpAtAKgcnxoG5nW0QLL3Vm91u55yok?=
 =?us-ascii?Q?Fv6Tnfgp2XtvaNvWWxVxSDy97DdnT2SuMCKDYWhRVf0+AYGLiaTSRbMlQMmx?=
 =?us-ascii?Q?HEBjbEdp8gGowjXVFVrAu6qNoiYckP1sSjBefBu1dV4FIxS+ATYdaN7tr/lU?=
 =?us-ascii?Q?OXxVBsJSwRo+Z0t8yQkGCbhifcdBfSYTV1osN8580gXzIpQ4e4Z70GFIx4OZ?=
 =?us-ascii?Q?LqpsC3XsmwQ5lscVDts4LC10Dz0PQjO2/YrYbrCkdTpyrM9Vm/FekC+O0V1o?=
 =?us-ascii?Q?1jIjswBdfXguIn7xpZKMy4bgPex2HXsgi0lhU+Y2I+0/XyX19wb7eQiTs9r3?=
 =?us-ascii?Q?PnVM/z3d3AP/G18eySH/o5/yb3ktSZXRyGFft7tZLgjECKqetMj38zR5VUNH?=
 =?us-ascii?Q?4usnG6brOgrX6qMWS2LpOtt9S3UEWwbecctgdUaBk0nqp8bxksAGCz8JaCYc?=
 =?us-ascii?Q?KAD7n5zByh5NTuKEqCPQWLdqjTKLg1dr0PzKQdVV7c2mdGenpTEQt55jIjyQ?=
 =?us-ascii?Q?dh3n+d/73a9JRGHaHXFND278KOhHdfXlM6rX4mcjenF7B+AbLlZkPmz9kjA2?=
 =?us-ascii?Q?wIZ0TM9enT8Nl91cTos+YwxTZqQ+k212ViGUb7CxxyiZu3u8At8FyqrGZ4+O?=
 =?us-ascii?Q?J/MLA5ZRrVRByia1emLIH11pH6jiOZqWqe4ivvE2a1JXwZfM+PwiCsZgpX71?=
 =?us-ascii?Q?XVo4N5bN2TWmc14v+sRddbSLkArvtNZkd2DUfFQP/I6W9rHMi3AHel3tQl5E?=
 =?us-ascii?Q?Ge/x1NXWf2bBGe18EBWRGH59XZZZbLs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35658420-575a-4af2-c7a7-08deb4df5a28
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 13:14:11.8486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnq6cZ8pcLg187zYA3K9daRlgZz4Bbr0mf4nBIgdF/LnCGtY+T13nWXsWI29xNEgRG5ZeM37H5g610/WgVCVALGGDq6vY1UT0hpA86zPLvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR03MB8062
X-purgate-ID: tlsNG-c201ff/1779110055-E0063443-D7D035D8/0/0
X-purgate-type: clean
X-purgate-size: 1995
X-Rspamd-Queue-Id: 913AD56D6D9
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jason.andryuk@amd.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi,

There are differences in instruction execution when coming from a VMEXIT
vs a fully emulated path. This can result in subtle bugs, e.g. injecting
#GP with trap rather than fault semantics. When using nested virt, these
bugs may become security issues if it allows L2 to attack L1 (because
L0 has done something unexpected).

To fix this, we plan to unify the VMEXIT (fast) path and emulated
instruction paths with everything going through the emulator but the
fast path short-circuiting some parts. This patch series adds the basic
infrastructure and converts two SVM VMEXITs: halt and read/write CR

The other motivation to do this work is to arrange it so that there is only
a single place where Xen needs to consider whether an instruction/event
is something that L1 cares about.

This is very much an RFC at this point so I'm mainly looking for
feedback on the overall approach.

Thanks,
Ross

Ross Lagerwall (7):
  x86/hvm: Move description into hvm_emulate_ctxt
  x86/hvm: Introduce hvm_emulate_one_ctxt
  x86/emul: Separate out instruction completion
  x86/hvm: Support a fast path during emulation
  x86/hvm: Move INSTR_* constants to hvm.h
  x86/svm: Use the emulator path for VMEXIT_HLT
  x86/svm: Use the emulator path for VMEXIT_CR*

 xen/arch/x86/hvm/emulate.c             | 180 +++++++++++++++++++------
 xen/arch/x86/hvm/hvm.c                 |   2 +-
 xen/arch/x86/hvm/io.c                  |  19 ++-
 xen/arch/x86/hvm/ioreq.c               |   2 +-
 xen/arch/x86/hvm/svm/emulate.c         |   6 +-
 xen/arch/x86/hvm/svm/svm.c             |  52 +++----
 xen/arch/x86/hvm/svm/svm.h             |  30 +----
 xen/arch/x86/hvm/vmx/realmode.c        |   2 +-
 xen/arch/x86/include/asm/hvm/emulate.h |  13 ++
 xen/arch/x86/include/asm/hvm/hvm.h     |  31 +++++
 xen/arch/x86/x86_emulate/x86_emulate.c |  48 ++++---
 xen/arch/x86/x86_emulate/x86_emulate.h |   3 +
 12 files changed, 252 insertions(+), 136 deletions(-)

-- 
2.53.0


