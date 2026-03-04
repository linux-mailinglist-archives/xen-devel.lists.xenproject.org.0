Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBzwJcaNqGmbvgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 295382073CC
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 20:53:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245950.1545281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHU-0007yj-2t; Wed, 04 Mar 2026 19:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245950.1545281; Wed, 04 Mar 2026 19:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxsHT-0007wJ-VK; Wed, 04 Mar 2026 19:53:15 +0000
Received: by outflank-mailman (input) for mailman id 1245950;
 Wed, 04 Mar 2026 19:53:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nfWr=BE=citrix.com=kevin.lampis@srs-se1.protection.inumbo.net>)
 id 1vxsHR-0007ik-Oe
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 19:53:13 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c65a2e74-1803-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 20:53:11 +0100 (CET)
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by DM4PR03MB6079.namprd03.prod.outlook.com (2603:10b6:5:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:53:09 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 19:53:08 +0000
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
X-Inumbo-ID: c65a2e74-1803-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G9fgIzB/esvZOYKPhZQWNtvoztOjx++wKfgZiuk+ZcatPg6UNquY1Ihx7kzv3QWbquXKQK8yPDH1ZUTFg7op9GTkmJIHJUuC/1xJ8AZ1kkzavCGEF54vv5K0z3w71YF7Ru3kr2DX5RfMDi9wgnwnHsZ4LgTvrIO5tU9DKV1MATeQ/YP/xMpZr0UtA4C+BLfO/yLZGpdYg1IAwX0f38OyOySv+HkSE6jZmnVbwAsn+KFDj6w9rrkvaF/OwKkestXDf0VZ1IQWcBi3kxR1QaKuKqt20eR91f3jOtdL0l7dQicbUPxSD0pQRIJnAFt5qU9bnNvc8drRqobevuafbKJ1AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73HOYRSmCsvCAcjUm4czWHv5BB3usADT9uJVL/8SOJE=;
 b=hIsh3GN7R5izIMeVwRyCVbpdTyOJeSNfN5nMsm+FqC09MwDugJHaLrc/zQANJ6VUsBCNYEOV04WvwEOjuoK/xHH0kBDp3NIh7OdMyzg9fwDcQOpYUoBicKCuMr9kzNYERERHKmkOY3AjKGV35tHEXeOJ88O/L5h0V4JIdGZpoQl+XP5N7fok3FWRp/QU0qMTlOgA802MgyzUVMs59jSi9h31xal9z/tN8i6xW5Ei9rwZEn6J+T4s8CoRcPBBmFH+GmlAo43/ktHxwDP+gtsEZdZads46RPAXL+l8JCQ/B9NcZIKcDgXE1iptlHAhHkXg23uiE9mxhzNRntlf2S72Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73HOYRSmCsvCAcjUm4czWHv5BB3usADT9uJVL/8SOJE=;
 b=morUedH0F8U4pnk4+KxPwlawkoMZILwTY/vX1AyQaGaUDmD86g7jXwXaVkBffpoibwgSSd8hu1t2GgH/oaXQYuGhKayvXWZiB8MFyrEFsqpbgxFE5wD1uDicnmA4WsoIg4Ns8rUXbElJ062kjRg38ZrMcc/dQiYAeEyFiob1YDs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH 1/6] x86: Remove x86 prefixed names from mcheck code
Date: Wed,  4 Mar 2026 19:53:45 +0000
Message-ID: <20260304195350.837593-2-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260304195350.837593-1-kevin.lampis@citrix.com>
References: <20260304195350.837593-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0319.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::18) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|DM4PR03MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: ed0d4de5-ee03-4d7b-5808-08de7a27a8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	grE54Vd8OFvw+XYt82Qh7eRl3EDyPMsFe9mAfNMsBg+knKNZVstr7rjs4wdKxBATqgjjj4KnxUgcLKWLXVzcGQdAFkEU7y27mlhGS69JvFqyloOS7EoEo9+Xiso2mQMtqoMnkrNyP7kuz88FijqOxcIdtpjPxxYACJErJOH5TqA7CDsJAXxMnzREmf8H/6SpRs2jhbC8QUYjhWNvR5n6UHAx135qzNkTVUK5NSWGdyHB9pJYeHbIUANFe04BCduNXS4qokKVJdqQbfZKGjwlKGKRQpYRGfJgy9CUwNNQEI5oCyQ09xw4z9Rxzrm5BUhtFReYRa352YqnmdmpgMVZ1Q9fCqMmlf47DxSY5t24Whs//DyTenFSv+p4qWLhMZBOKzYjgHmwKlSakscBZ+oQTmTK9Bs5DaGkJx0TWT5W2794s8qqeq0RYcYOxTaAnfbw24tiPVzqeFIQAbNd2dmRW4P8lwt5jm2wRbnoYIA+p5jo3gwJ63i4qlKQ1Nr/uIywXOSrZyLFH2novtpa1I7uPoU4gXau0focgzSYHcK2FWGPT6t32LKIftHr6mQc/dq29q5EokOoJEj0XpyjI5CDY9Bbb1Nx/+yKCRh0dSzeQpkmL/tDpKXo3JhuDPUOxRi6UdI4w1cf+iM6Z+s3XThrUxSPqLhQN5mY4IIuFvp42cNTssGMrEXw6old1tGknohLvi74C26YkoBPHlUtZ4yIMuZXEtH9CrO8zjBA6ZA7iIA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wR482VTOFudGC0BRMmzFZcbUkpHydyCRq9a9EO3/ZERGxVVIFxVgEkTESgFB?=
 =?us-ascii?Q?ghFzuy9/78NT5poDipGtXmXy5hJVSvXh1lQs8l+7y/bIxKnv5HdjS+oJJ2A9?=
 =?us-ascii?Q?wIPnyWOBudRqUzgSxhX8QoDBMoAa+cmvD08k5OMECkwBe9MQSc3laXKnr4sj?=
 =?us-ascii?Q?hSWkulRLScfZFCGtx+vdk2YDNmqWS5iA3MjkNEFpXXWXWKugM9FTAQ9Rub4F?=
 =?us-ascii?Q?JMo0LUgkRsfrMGFUiQYNMARPa5jpRuWQ8RUj82/AzwFUgW4HTemxSvK1KCmo?=
 =?us-ascii?Q?VmesYasX4scF15OjFSgkaGYPIcivILyc689cvppyRypXoUSyUKu4oMSOutRl?=
 =?us-ascii?Q?Tx4Hyx2pkbImYfymqQAWgm0ksU/uEZsH1BRGQsgArT6WyXMHacLIrva9seLD?=
 =?us-ascii?Q?+m8z4droblB1y3V/4RdUo1GlnWEQxRsZtSWukgDlle3IUdE+W80cmSnAhQoR?=
 =?us-ascii?Q?QgjoIvj+X9cNWVvGU/j6y3noEPlrdZZ/Xjb+DFHq8JY6+9fxi4MwOCEHg7el?=
 =?us-ascii?Q?yRvxC3xhTblRl5DfVY2DzJaksm4uwdDJiBrTt6YVWs7vlqcCJvTtNRaFnpkM?=
 =?us-ascii?Q?fyWe1G7MmRJL6UAsq0xLg1WEOQid+ZNWGk++5wdyEU8Cf7u5SzERlqYDZ9rW?=
 =?us-ascii?Q?9rxdBX2pxkPykVJxTZShqmrhiERs1QLoLa958zcA8Ml2Eamo85JiJfiuutVo?=
 =?us-ascii?Q?GwrlQOkv5JZe6rA4+t7m8Rytd/mmv9B04DEMhDL+UxrtnUS1Ss7HZO26FCRY?=
 =?us-ascii?Q?/2K7I+1e46Ag+nzf/mwn1SITU1tYEfU4MbUNXNHpGfph6i2YzUoHbs/0OTBX?=
 =?us-ascii?Q?N2/+BY4JHceFKn6FpKmCIGFitS++S+IAN/4akPIt+184nn1j/dxl5QStUvgt?=
 =?us-ascii?Q?q7PTK9CpEIjx/7LclT5HI/vjsOQTogtlaZzxwHiHONa46j8IHBYcmyz+13Ip?=
 =?us-ascii?Q?PS7gyjjJyXTPCRmw1BCaPVy9MfjK4Vx3TsfUmE9m9d/1IvgmyYE6aw3Nuus2?=
 =?us-ascii?Q?jZULDMHwQM+Q+JfYqy39t6WkSZk9sSD04QsD5XFJdWs89qcraiqSgTFLC4YM?=
 =?us-ascii?Q?Agm8Qjx/60EMkb6g2d5mBTtmKlxPjWQz9wWpnvT/xT7LApODZub+fW7fGkto?=
 =?us-ascii?Q?YCMn8PQPGsHi4A2nuF6/aj/EXv5d+fI4HOtsK/OvTXiiJntZXUe+wXv3ds1x?=
 =?us-ascii?Q?X01hI02oRlh9jmS/PGg5bdFL5f526tYdRwswvskWvTZbnTko4v498KqjNroz?=
 =?us-ascii?Q?2UrJYIcqrHkfxeFeAqeMSDaFV8XDrxXiM/WfZAlnPBURFXUouv26/hBfnDry?=
 =?us-ascii?Q?rmUENwcEOKMDEA3M4iZgU5stRvpp/eJFQCBgbmNbsSgvAXxLu8Lb6ZAAF5HM?=
 =?us-ascii?Q?OX6g9Jd4pEo/o04yhvvC+DltdHZj2idPQCrUKsC53XTqd0E6ogWHyJX0PMnG?=
 =?us-ascii?Q?SNVSUxzVul7l/cZaVpuc3/o892R1NwV6qFm3gCI97pIV4X3+gvkRgEBFuyTZ?=
 =?us-ascii?Q?782Ui98qgcZFm5aoHUWzZQOk88UThJ9dkiBJTDosZWh9mvvbceLd620llLT8?=
 =?us-ascii?Q?PcOMxPVoykLjm/nVpnR90y35d5vAYOjie9K3MjRfWWNKGrG6yJbXGrNd9xwS?=
 =?us-ascii?Q?sLgZDtlYrPu9VVkLCaJrEJviRreHAmD7vsg7tgwSwxHHwaMQtb5fpM81rLmD?=
 =?us-ascii?Q?5+/50IzBinJmK8gOyzkkoEQzVTQKmGpoIfoqrB4MMSBSgYUppF9d7Xe69ePX?=
 =?us-ascii?Q?jN2raAIE/Q=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed0d4de5-ee03-4d7b-5808-08de7a27a8d4
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:53:08.8986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X78UOGanNrXjtInCwGmhQ8SVpo1ZPn2HtSGws8z3OGxF8DxKbpVeoXwunNZ+oXUk8o1dFXv70MrFFLFiSVVKVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6079
X-Rspamd-Queue-Id: 295382073CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:kevin.lampis@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevin.lampis@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

struct cpuinfo_x86
  .x86        => .family
  .x86_vendor => .vendor
  .x86_model  => .model
  .x86_mask   => .stepping

No functional change.

This work is part of making Xen safe for Intel family 18/19.

Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes since v1:
- mcheck_init() check for family != 5 instead of 6 and 15
- mce_firstbank() match vfm range
- mce_is_broadcast() add vendor check as well as >= INTEL_CORE_YONAH

This supersedes the individual posting
https://lore.kernel.org/xen-devel/20260302191900.672460-1-kevin.lampis@citrix.com/
---
 xen/arch/x86/cpu/mcheck/amd_nonfatal.c |  2 +-
 xen/arch/x86/cpu/mcheck/mcaction.c     |  2 +-
 xen/arch/x86/cpu/mcheck/mce.c          | 35 +++++++++++---------------
 xen/arch/x86/cpu/mcheck/mce.h          |  2 +-
 xen/arch/x86/cpu/mcheck/mce_amd.c      | 16 ++++++------
 xen/arch/x86/cpu/mcheck/mce_intel.c    |  5 +---
 xen/arch/x86/cpu/mcheck/non-fatal.c    |  2 +-
 xen/arch/x86/cpu/mcheck/vmce.c         |  8 +++---
 8 files changed, 32 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
index 7d48c9ab5f..fb52639e13 100644
--- a/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
+++ b/xen/arch/x86/cpu/mcheck/amd_nonfatal.c
@@ -191,7 +191,7 @@ static void cf_check mce_amd_work_fn(void *data)
 
 void __init amd_nonfatal_mcheck_init(struct cpuinfo_x86 *c)
 {
-	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
+	if (!(c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		return;
 
 	/* Assume we are on K8 or newer AMD or Hygon CPU here */
diff --git a/xen/arch/x86/cpu/mcheck/mcaction.c b/xen/arch/x86/cpu/mcheck/mcaction.c
index bf7a0de965..236424569a 100644
--- a/xen/arch/x86/cpu/mcheck/mcaction.c
+++ b/xen/arch/x86/cpu/mcheck/mcaction.c
@@ -101,7 +101,7 @@ mc_memerr_dhandler(struct mca_binfo *binfo,
                       * not always precise. In that case, fallback to broadcast.
                       */
                      global->mc_domid != bank->mc_domid ||
-                     (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+                     (boot_cpu_data.vendor == X86_VENDOR_INTEL &&
                       (!(global->mc_gstatus & MCG_STATUS_LMCE) ||
                        !(d->vcpu[mc_vcpuid]->arch.vmce.mcg_ext_ctl &
                          MCG_EXT_CTL_LMCE_EN))) )
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 9a91807cfb..901a71157a 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -23,6 +23,7 @@
 #include <asm/apic.h>
 #include <asm/msr.h>
 #include <asm/p2m.h>
+#include <asm/intel-family.h>
 
 #include "mce.h"
 #include "barrier.h"
@@ -334,7 +335,7 @@ mcheck_mca_logout(enum mca_source who, struct mca_banks *bankmask,
                 mca_init_global(mc_flags, mig);
                 /* A hook here to get global extended msrs */
                 if ( IS_ENABLED(CONFIG_INTEL) &&
-                     boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+                     boot_cpu_data.vendor == X86_VENDOR_INTEL )
                     intel_get_extended_msrs(mig, mci);
             }
         }
@@ -564,8 +565,7 @@ bool mce_available(const struct cpuinfo_x86 *c)
  */
 unsigned int mce_firstbank(struct cpuinfo_x86 *c)
 {
-    return c->x86 == 6 &&
-           c->x86_vendor == X86_VENDOR_INTEL && c->x86_model < 0x1a;
+    return c->vfm >= INTEL_PENTIUM_PRO && c->vfm < INTEL_NEHALEM_EP;
 }
 
 static int show_mca_info(int inited, struct cpuinfo_x86 *c)
@@ -596,7 +596,7 @@ static int show_mca_info(int inited, struct cpuinfo_x86 *c)
         case mcheck_amd_famXX:
         case mcheck_hygon:
             printk("%s%s Fam%xh machine check reporting enabled\n",
-                   prefix, type_str[inited], c->x86);
+                   prefix, type_str[inited], c->family);
             break;
 
         case mcheck_none:
@@ -766,7 +766,7 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
     else if ( cpu_bank_alloc(cpu) )
         panic("Insufficient memory for MCE bank allocations\n");
 
-    switch ( c->x86_vendor )
+    switch ( c->vendor )
     {
 #ifdef CONFIG_AMD
     case X86_VENDOR_AMD:
@@ -777,13 +777,8 @@ void mcheck_init(struct cpuinfo_x86 *c, bool bsp)
 
 #ifdef CONFIG_INTEL
     case X86_VENDOR_INTEL:
-        switch ( c->x86 )
-        {
-        case 6:
-        case 15:
+        if ( c->family != 5 )
             inited = intel_mcheck_init(c, bsp);
-            break;
-        }
         break;
 #endif
 
@@ -882,7 +877,7 @@ static void x86_mcinfo_apei_save(
     memset(&m, 0, sizeof(struct mce));
 
     m.cpu = mc_global->mc_coreid;
-    m.cpuvendor = xen2linux_vendor(boot_cpu_data.x86_vendor);
+    m.cpuvendor = xen2linux_vendor(boot_cpu_data.vendor);
     m.cpuid = cpuid_eax(1);
     m.socketid = mc_global->mc_socketid;
     m.apicid = mc_global->mc_apicid;
@@ -983,10 +978,10 @@ static void cf_check __maybe_unused do_mc_get_cpu_info(void *v)
                         &xcp->mc_apicid, &xcp->mc_ncores,
                         &xcp->mc_ncores_active, &xcp->mc_nthreads);
     xcp->mc_cpuid_level = c->cpuid_level;
-    xcp->mc_family = c->x86;
-    xcp->mc_vendor = xen2linux_vendor(c->x86_vendor);
-    xcp->mc_model = c->x86_model;
-    xcp->mc_step = c->x86_mask;
+    xcp->mc_family = c->family;
+    xcp->mc_vendor = xen2linux_vendor(c->vendor);
+    xcp->mc_model = c->model;
+    xcp->mc_step = c->stepping;
     xcp->mc_cache_size = c->x86_cache_size;
     xcp->mc_cache_alignment = c->x86_cache_alignment;
     memcpy(xcp->mc_vendorid, c->x86_vendor_id, sizeof xcp->mc_vendorid);
@@ -1142,7 +1137,7 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
 
         if ( IS_MCA_BANKREG(reg, mci->mcinj_cpunr) )
         {
-            if ( c->x86_vendor == X86_VENDOR_AMD )
+            if ( c->vendor == X86_VENDOR_AMD )
             {
                 /*
                  * On AMD we can set MCi_STATUS_WREN in the
@@ -1177,15 +1172,15 @@ static bool __maybe_unused x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
             case MSR_F10_MC4_MISC1:
             case MSR_F10_MC4_MISC2:
             case MSR_F10_MC4_MISC3:
-                if ( c->x86_vendor != X86_VENDOR_AMD )
+                if ( c->vendor != X86_VENDOR_AMD )
                     reason = "only supported on AMD";
-                else if ( c->x86 < 0x10 )
+                else if ( c->family < 0x10 )
                     reason = "only supported on AMD Fam10h+";
                 break;
 
             /* MSRs that the HV will take care of */
             case MSR_K8_HWCR:
-                if ( c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
+                if ( c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
                     reason = "HV will operate HWCR";
                 else
                     reason = "only supported on AMD or Hygon";
diff --git a/xen/arch/x86/cpu/mcheck/mce.h b/xen/arch/x86/cpu/mcheck/mce.h
index 920b075355..3b61b12487 100644
--- a/xen/arch/x86/cpu/mcheck/mce.h
+++ b/xen/arch/x86/cpu/mcheck/mce.h
@@ -137,7 +137,7 @@ void x86_mcinfo_dump(struct mc_info *mi);
 
 static inline int mce_vendor_bank_msr(const struct vcpu *v, uint32_t msr)
 {
-    switch (boot_cpu_data.x86_vendor) {
+    switch (boot_cpu_data.vendor) {
     case X86_VENDOR_INTEL:
         if (msr >= MSR_IA32_MC0_CTL2 &&
             msr < MSR_IA32_MCx_CTL2(v->arch.vmce.mcg_cap & MCG_CAP_COUNT) )
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 25c29eb3d2..2d17832d9c 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -160,17 +160,17 @@ mcequirk_lookup_amd_quirkdata(const struct cpuinfo_x86 *c)
 {
     unsigned int i;
 
-    BUG_ON(c->x86_vendor != X86_VENDOR_AMD);
+    BUG_ON(c->vendor != X86_VENDOR_AMD);
 
     for ( i = 0; i < ARRAY_SIZE(mce_amd_quirks); i++ )
     {
-        if ( c->x86 != mce_amd_quirks[i].cpu_family )
+        if ( c->family != mce_amd_quirks[i].cpu_family )
             continue;
         if ( (mce_amd_quirks[i].cpu_model != ANY) &&
-             (mce_amd_quirks[i].cpu_model != c->x86_model) )
+             (mce_amd_quirks[i].cpu_model != c->model) )
             continue;
         if ( (mce_amd_quirks[i].cpu_stepping != ANY) &&
-             (mce_amd_quirks[i].cpu_stepping != c->x86_mask) )
+             (mce_amd_quirks[i].cpu_stepping != c->stepping) )
                 continue;
         return mce_amd_quirks[i].quirk;
     }
@@ -291,13 +291,13 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
     uint32_t i;
     enum mcequirk_amd_flags quirkflag = 0;
 
-    if ( c->x86_vendor != X86_VENDOR_HYGON )
+    if ( c->vendor != X86_VENDOR_HYGON )
         quirkflag = mcequirk_lookup_amd_quirkdata(c);
 
     /* Assume that machine check support is available.
      * The minimum provided support is at least the K8. */
     if ( bsp )
-        mce_handler_init(c->x86 == 0xf ? &k8_callbacks : &k10_callbacks);
+        mce_handler_init(c->family == 0xf ? &k8_callbacks : &k10_callbacks);
 
     for ( i = 0; i < this_cpu(nr_mce_banks); i++ )
     {
@@ -311,7 +311,7 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
         }
     }
 
-    if ( c->x86 == 0xf )
+    if ( c->family == 0xf )
         return mcheck_amd_k8;
 
     if ( quirkflag == MCEQUIRK_F10_GART )
@@ -337,6 +337,6 @@ amd_mcheck_init(const struct cpuinfo_x86 *c, bool bsp)
             ppin_msr = MSR_AMD_PPIN;
     }
 
-    return c->x86_vendor == X86_VENDOR_HYGON ?
+    return c->vendor == X86_VENDOR_HYGON ?
             mcheck_hygon : mcheck_amd_famXX;
 }
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 839a0e5ba9..4d6b7d588e 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -711,10 +711,7 @@ static bool mce_is_broadcast(struct cpuinfo_x86 *c)
      * DisplayFamily_DisplayModel encoding of 06H_EH and above,
      * a MCA signal is broadcast to all logical processors in the system
      */
-    if ( c->x86_vendor == X86_VENDOR_INTEL && c->x86 == 6 &&
-         c->x86_model >= 0xe )
-        return true;
-    return false;
+    return c->vendor == X86_VENDOR_INTEL && c->vfm >= INTEL_CORE_YONAH;
 }
 
 static bool intel_enable_lmce(void)
diff --git a/xen/arch/x86/cpu/mcheck/non-fatal.c b/xen/arch/x86/cpu/mcheck/non-fatal.c
index a9ee9bb94f..4e7c64abef 100644
--- a/xen/arch/x86/cpu/mcheck/non-fatal.c
+++ b/xen/arch/x86/cpu/mcheck/non-fatal.c
@@ -23,7 +23,7 @@ static int __init cf_check init_nonfatal_mce_checker(void)
 	/*
 	 * Check for non-fatal errors every MCE_RATE s
 	 */
-	switch (c->x86_vendor) {
+	switch (c->vendor) {
 #ifdef CONFIG_AMD
 	case X86_VENDOR_AMD:
 	case X86_VENDOR_HYGON:
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 1a7e92506a..84776aeec8 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -45,7 +45,7 @@ void vmce_init_vcpu(struct vcpu *v)
     int i;
 
     /* global MCA MSRs init */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         v->arch.vmce.mcg_cap = INTEL_GUEST_MCG_CAP;
     else
         v->arch.vmce.mcg_cap = AMD_GUEST_MCG_CAP;
@@ -63,7 +63,7 @@ int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt)
 {
     unsigned long guest_mcg_cap;
 
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
         guest_mcg_cap = INTEL_GUEST_MCG_CAP | MCG_LMCE_P;
     else
         guest_mcg_cap = AMD_GUEST_MCG_CAP;
@@ -136,7 +136,7 @@ static int bank_mce_rdmsr(const struct vcpu *v, uint32_t msr, uint64_t *val)
         break;
 
     default:
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( boot_cpu_data.vendor )
         {
 #ifdef CONFIG_INTEL
         case X86_VENDOR_CENTAUR:
@@ -273,7 +273,7 @@ static int bank_mce_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
         break;
 
     default:
-        switch ( boot_cpu_data.x86_vendor )
+        switch ( boot_cpu_data.vendor )
         {
 #ifdef CONFIG_INTEL
         case X86_VENDOR_INTEL:
-- 
2.51.1


