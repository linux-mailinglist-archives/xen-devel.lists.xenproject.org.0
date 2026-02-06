Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDqfMidJhWkN/QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 02:51:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CD9F9147
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 02:51:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222692.1530457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voAzk-0006iq-0I; Fri, 06 Feb 2026 01:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222692.1530457; Fri, 06 Feb 2026 01:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voAzj-0006gp-Tr; Fri, 06 Feb 2026 01:50:51 +0000
Received: by outflank-mailman (input) for mailman id 1222692;
 Fri, 06 Feb 2026 01:50:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tkN=AK=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1voAzi-0006gj-6v
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 01:50:50 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4104abbe-02fe-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 02:50:47 +0100 (CET)
Received: from MW4PR04CA0345.namprd04.prod.outlook.com (2603:10b6:303:8a::20)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 01:50:36 +0000
Received: from MWH0EPF000C6184.namprd02.prod.outlook.com
 (2603:10b6:303:8a:cafe::d4) by MW4PR04CA0345.outlook.office365.com
 (2603:10b6:303:8a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Fri,
 6 Feb 2026 01:50:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6184.mail.protection.outlook.com (10.167.249.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 01:50:36 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 19:50:35 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 17:50:35 -0800
Received: from SATLEXMB03.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Feb 2026 19:50:34 -0600
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
X-Inumbo-ID: 4104abbe-02fe-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iD5pw1+mxd7adUdDgr4rFavYuJIPKPWeb1vFABabnc1l18T06D+liMz/YrrZh9oyDxZBxuU4yBBXIWW3uRmgDh8xOlWx8uwtzT46rTW2wUqpCoM5lzQCveGTACmo5eoJFhmccbC5RVhJwDyStDgzw9guQ3YKbFxxfWsmtqJVOXMgdMTLb57Ka/+5qowsMZyZg3KRtZMHbzID+Oe7xE06YnuOh7c7YFlGk9dGLuZbSUUlnNr9Ao6yKvfV4xtxIjptczn5Z5sBoaTSkViKJ4Z5+L6V+7+Dpp5dbdmhZg0gRcabOjyj4eqWIrftqadOR/pwI2BqelQDPuPZ/TDFgjpJwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRe9l5/IqMVz6Ul6sKy+ceH0KLiOj3WX5G6evYctrQo=;
 b=ptRfNm1n5qP43RNS91gImSpjK8paulrxdY9YRy7nwM+bX1rpDVeerfOEJV66tjqPcYFQzdDLcwrUFRFoLTMkKBq1TzktHC3VHcVBGkf3oS6SdSWTo8D4wSIgKLw4N/Hn03deljWZlhSYw5bnyFVNP+itdvpAB8Nf2Jsx8TR18QrrLvJtQUOxlGmrOF+OqECqFMUi+GW4500k81MqlY22Ygzn60XXsGMoXswgjmKtFKS6APqWaoajqLRanc6V6GViI82WEXpzbnxId/onDhaF7fNiAaqp6GdFx3FZ3IektIUN/G4kTmzCR1d+pY9mIYKbY8wxrXnHTqq9FPkXnN6YvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRe9l5/IqMVz6Ul6sKy+ceH0KLiOj3WX5G6evYctrQo=;
 b=DxpgkBpZKvXntcf5xzfT65U96R90QE2KMe6jsD7bROJalCtiuKJC7bNOuo/E9YvZSK3u/gHwn8SIWgRaD/CbGrYZajvSbFAVW12MXETPFtVJJl2HO5TqQfBZw/Ct1SquU3KEywNVlTHwo1AANDvg7pJn56UCif0Kijq1eKkDg7U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, <alejandro.garciavallejo@amd.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>
Subject: [PATCH] x86/hvm: Add Kconfig option to disable nested virtualization
Date: Thu, 5 Feb 2026 17:50:32 -0800
Message-ID: <20260206015032.4159672-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6184:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 476fe122-bd96-4192-92b9-08de65221f4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jxtcmPK/4ITR/hSMAlnkDpmgNg50m9fhWXPN8SSAS0NuI1ctSWAQgwLdElnT?=
 =?us-ascii?Q?1FnBxAonNGrQS/q2XuqthF5/QPKsctd256yUtUiiu+IHqsUOIgfBvgeyQv70?=
 =?us-ascii?Q?O8u0mdgmy5QZWvsFJl061SEE93+95tT3Rq4LzsyRPvbiYos9R2l0rXSrwQpo?=
 =?us-ascii?Q?7vBI3d1T8TEgFo0KsrY7rj6Yi7hylWLU9xhJ22Q6O6An1RFX9kR5ePJGOUfq?=
 =?us-ascii?Q?cfywzum7FJCksIySanKYxDloJBhQUgfqgZ2zCS2FU2060ncCk00iuJSOXnpi?=
 =?us-ascii?Q?sIb/3QZEHHiNw+czm76drsXbVkhOV3KN79rI6Zc9AlyC0G5yVZpFAGkcygGn?=
 =?us-ascii?Q?nIgjIiTZoEsBfuNxWubpLMMwk0EL7u4kx6Fp64MTz2vGaWBqL+R7TSZOOcT0?=
 =?us-ascii?Q?ozR3LgUk4rDjCYVQbtaKSH48RssvUXCw6NAZsvPuBwq+kWzLBXoVSEhWvQED?=
 =?us-ascii?Q?fImB54MiyuNhuysprTCj+QtDQZr3VJGPiQ7Uxd3gf1BQiI085qzRw2LQUMmv?=
 =?us-ascii?Q?EAWS6SxZKhPj7vwNn2y8xwyzlYhQ+HjOcVqeKqDGtAqZZcxZuhI/p1ynstS4?=
 =?us-ascii?Q?SrsG5cTDxZtty/qyz+q9EDHHiOoEQ4Rni90NUQoiUeE5xLszhmaD2W+JNTTE?=
 =?us-ascii?Q?fBbGcJz+AdnsAYB5fCYCCXm35bxT8KkZA6FA3La4Wn6VPknzgVKp31OFbvae?=
 =?us-ascii?Q?owGNSbwcVU2EEJLFOEvXjWuMLjgw97sJ8ZusZDbU4wbaaopKRSqVdsLbsn+2?=
 =?us-ascii?Q?Ir9LA94JBW7azqDTHnyj6DOfKwC0bwNPBktEMifYj/wTpa7ZjZimOa8gy5GT?=
 =?us-ascii?Q?2xmhGOtlVdu74Uw1QNsqUVUXdgoj9udU+h271ri7flbzf4GbP1+9QXX4/1Qd?=
 =?us-ascii?Q?wZfJlhBLTab2Q7BD+MVE5gnJhX0B+xufcYEy8dLM6UJtxBmU0kNLoDnDaIo9?=
 =?us-ascii?Q?armsvVdel1J/1MxliYmDSjqEt9DyPFqe4F4itn1K9eku4RYkH+M4Hu4omy0P?=
 =?us-ascii?Q?nVpL1BOxFp/zARonjSyqXzzSyXIhsmym5ZtkHGKdJlEK90YdKrHEcs4Lrdgd?=
 =?us-ascii?Q?wVYHKwamOn0iCyoZUTNpl6eOah9epjYjKFDXmzSLSpm+lJRu163gZhJJAwG7?=
 =?us-ascii?Q?/y3TUhoWsjrfMkggazRqEUgaOfT/WpJod6KB+GzwyxcEpCptwLpLp9eaCgPx?=
 =?us-ascii?Q?WsXtmkWpBHJxHe8dbYuKXhlJAZ1aSOyvrlpD4gbD8ebplO/k1GL4kjasTvJQ?=
 =?us-ascii?Q?VBCm+Fip4CcRSSCiWEAo/cD2snH94aAcxGmP4i9dvyLK2DHDJt+TUGPovBon?=
 =?us-ascii?Q?ZsqD6d4ke6RnN81yeT0s4SyadJ1nk7udnREE0mLXMLJD3wgqRr3tUDXd3I+h?=
 =?us-ascii?Q?GPWzSogea1nhFQgRG+DK2Klfw9cqW3O/4eHGrQSvUAvMEU4pa2wX3bR8BmNX?=
 =?us-ascii?Q?qXMBkPHXWnMiv2ocxLDoyDZSP3iYTnhifRwUld9sINu7OnWbOAvAlBMMpC9g?=
 =?us-ascii?Q?YTAfpcANQbqYXQYuvjDQdqjls1YkRKOdoiKURI4IsH+PLF/CzHHvrZsLt9Uz?=
 =?us-ascii?Q?ulboY0rrL0oC79rukX9QovCMOD8TtK3Y7FTcyr2hcg5p51BXI4AyrDqdr38i?=
 =?us-ascii?Q?6urZo5dd/TMKuVjmpojEt8fgbgUT7sbw66vNDnUI800xs3tfzV8yh7tN5VgW?=
 =?us-ascii?Q?xBR9hQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f7Pc5not10eH5ZOI9J/sZtogRJGDp0cjZ294s/d33LYd8YOMYrPoP6dwYj/2KZ3iJ6F9byQKrxGE5rjznPe9RPHAF8UJ0oY+OnyPWGc2nEzGNNxuC97bx+ZIK409ArRBgnR6oMAJCVyaydv/j1OfISvisZlFrLUZFa6ytuOGgjnPDDfQht9BRVzlJQyFQPuTwZk/FihT6pvLQMufgLQtnEdcPx+MkxHk+a9fRD9mdD4FxnOUibZatyAHMZ5ducefAjKi2APdSgMOAvu0pVvE7rG5NYBjXwF4KiP6umb2HsfxiMRQ6yymjkOMcq+NplZDffoHdTxVgfuyRiwn03rUVHWu30QpKi9pOotgOJBxr3AXBm2Y7UUgi+60zsD1+VOvAG+5zE/leYcg8BN9EkN3tCHDNjDJVUp7hOietAt0zy+Vk7lWcnpUyqLWjfT1YNP1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:50:36.0126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 476fe122-bd96-4192-92b9-08de65221f4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6184.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 23CD9F9147
X-Rspamd-Action: no action

Introduce CONFIG_NESTED_VIRT (default y, requires EXPERT to disable)
to allow nested virtualization support to be disabled at build time.
This is useful for embedded or safety-focused deployments where
nested virtualization is not needed, reducing code size and attack
surface.

When CONFIG_NESTED_VIRT=n, the following source files are excluded:
- arch/x86/hvm/nestedhvm.c
- arch/x86/hvm/svm/nestedsvm.c
- arch/x86/hvm/vmx/vvmx.c
- arch/x86/mm/nested.c
- arch/x86/mm/hap/nested_hap.c
- arch/x86/mm/hap/nested_ept.c

Add inline stubs where needed in headers.

No functional change when CONFIG_NESTED_VIRT=y.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/x86/hvm/Kconfig                 | 10 ++++++
 xen/arch/x86/hvm/Makefile                |  2 +-
 xen/arch/x86/hvm/svm/Makefile            |  2 +-
 xen/arch/x86/hvm/svm/nestedhvm.h         | 44 +++++++++++++++++++++---
 xen/arch/x86/hvm/svm/svm.c               |  6 ++++
 xen/arch/x86/hvm/vmx/Makefile            |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c               | 10 ++++--
 xen/arch/x86/include/asm/hvm/nestedhvm.h | 41 +++++++++++++++++-----
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h  | 30 ++++++++++++++++
 xen/arch/x86/mm/Makefile                 |  2 +-
 xen/arch/x86/mm/hap/Makefile             |  4 +--
 xen/arch/x86/mm/p2m.h                    |  6 ++++
 12 files changed, 137 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index f32bf5cbb7..12b5df4710 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -92,4 +92,14 @@ config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on INTEL_VMX
 
+config NESTED_VIRT
+	bool "Nested virtualization support" if EXPERT
+	depends on AMD_SVM || INTEL_VMX
+	default y
+	help
+	  Enable nested virtualization, allowing guests to run their own
+	  hypervisors. This requires hardware support.
+
+	  If unsure, say Y.
+
 endif
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index f34fb03934..b8a0a68624 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -18,7 +18,7 @@ obj-y += irq.o
 obj-y += mmio.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += mtrr.o
-obj-y += nestedhvm.o
+obj-$(CONFIG_NESTED_VIRT) += nestedhvm.o
 obj-y += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
index 8a072cafd5..92418e3444 100644
--- a/xen/arch/x86/hvm/svm/Makefile
+++ b/xen/arch/x86/hvm/svm/Makefile
@@ -2,6 +2,6 @@ obj-y += asid.o
 obj-y += emulate.o
 obj-bin-y += entry.o
 obj-y += intr.o
-obj-y += nestedsvm.o
+obj-$(CONFIG_NESTED_VIRT) += nestedsvm.o
 obj-y += svm.o
 obj-y += vmcb.o
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 9bfed5ffd7..a102c076ea 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -26,6 +26,13 @@
 #define nsvm_efer_svm_enabled(v) \
     (!!((v)->arch.hvm.guest_efer & EFER_SVME))
 
+#define NSVM_INTR_NOTHANDLED     3
+#define NSVM_INTR_NOTINTERCEPTED 2
+#define NSVM_INTR_FORCEVMEXIT    1
+#define NSVM_INTR_MASKED         0
+
+#ifdef CONFIG_NESTED_VIRT
+
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
 void nestedsvm_vmexit_defer(struct vcpu *v,
     uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
@@ -57,13 +64,40 @@ int cf_check nsvm_hap_walk_L1_p2m(
     struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
     uint8_t *p2m_acc, struct npfec npfec);
 
-#define NSVM_INTR_NOTHANDLED     3
-#define NSVM_INTR_NOTINTERCEPTED 2
-#define NSVM_INTR_FORCEVMEXIT    1
-#define NSVM_INTR_MASKED         0
-
 int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack);
 
+#else /* !CONFIG_NESTED_VIRT */
+
+static inline int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
+{
+    return 0;
+}
+static inline void nestedsvm_vmexit_defer(struct vcpu *v,
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2) { }
+static inline enum nestedhvm_vmexits nestedsvm_vmexit_n2n1(struct vcpu *v,
+    struct cpu_user_regs *regs)
+{
+    return NESTEDHVM_VMEXIT_ERROR;
+}
+static inline enum nestedhvm_vmexits nestedsvm_check_intercepts(struct vcpu *v,
+    struct cpu_user_regs *regs, uint64_t exitcode)
+{
+    return NESTEDHVM_VMEXIT_ERROR;
+}
+static inline void svm_nested_features_on_efer_update(struct vcpu *v) { }
+static inline void svm_vmexit_do_clgi(struct cpu_user_regs *regs,
+                                      struct vcpu *v) { }
+static inline void svm_vmexit_do_stgi(struct cpu_user_regs *regs,
+                                       struct vcpu *v) { }
+static inline bool nestedsvm_gif_isset(struct vcpu *v) { return true; }
+static inline int nestedsvm_vcpu_interrupt(struct vcpu *v,
+                                           const struct hvm_intack intack)
+{
+    return NSVM_INTR_NOTINTERCEPTED;
+}
+
+#endif /* CONFIG_NESTED_VIRT */
+
 #endif /* __X86_HVM_SVM_NESTEDHVM_PRIV_H__ */
 
 /*
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738..0234b57afb 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -46,6 +46,10 @@
 
 void noreturn svm_asm_do_resume(void);
 
+#ifndef CONFIG_NESTED_VIRT
+void asmlinkage nsvm_vcpu_switch(void) { }
+#endif
+
 u32 svm_feature_flags;
 
 /*
@@ -2465,6 +2469,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
     .get_insn_bytes       = svm_get_insn_bytes,
 
+#ifdef CONFIG_NESTED_VIRT
     .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
     .nhvm_vcpu_destroy = nsvm_vcpu_destroy,
     .nhvm_vcpu_reset = nsvm_vcpu_reset,
@@ -2474,6 +2479,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .nhvm_vmcx_hap_enabled = nsvm_vmcb_hap_enabled,
     .nhvm_intr_blocked = nsvm_intr_blocked,
     .nhvm_hap_walk_L1_p2m = nsvm_hap_walk_L1_p2m,
+#endif
 
     .get_reg = svm_get_reg,
     .set_reg = svm_set_reg,
diff --git a/xen/arch/x86/hvm/vmx/Makefile b/xen/arch/x86/hvm/vmx/Makefile
index 04a29ce59d..902564b3e2 100644
--- a/xen/arch/x86/hvm/vmx/Makefile
+++ b/xen/arch/x86/hvm/vmx/Makefile
@@ -3,4 +3,4 @@ obj-y += intr.o
 obj-y += realmode.o
 obj-y += vmcs.o
 obj-y += vmx.o
-obj-y += vvmx.o
+obj-$(CONFIG_NESTED_VIRT) += vvmx.o
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 82c55f49ae..252f27322b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -55,6 +55,10 @@
 #include <public/hvm/save.h>
 #include <public/sched.h>
 
+#ifndef CONFIG_NESTED_VIRT
+void asmlinkage nvmx_switch_guest(void) { }
+#endif
+
 static bool __initdata opt_force_ept;
 boolean_param("force-ept", opt_force_ept);
 
@@ -2033,7 +2037,7 @@ static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
                  nvmx->intr.intr_info, nvmx->intr.error_code);
 }
 
-static int cf_check nvmx_vmexit_event(
+static int cf_check __maybe_unused nvmx_vmexit_event(
     struct vcpu *v, const struct x86_event *event)
 {
     nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
@@ -2933,6 +2937,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .handle_cd            = vmx_handle_cd,
     .set_info_guest       = vmx_set_info_guest,
     .set_rdtsc_exiting    = vmx_set_rdtsc_exiting,
+#ifdef CONFIG_NESTED_VIRT
     .nhvm_vcpu_initialise = nvmx_vcpu_initialise,
     .nhvm_vcpu_destroy    = nvmx_vcpu_destroy,
     .nhvm_vcpu_reset      = nvmx_vcpu_reset,
@@ -2942,8 +2947,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
     .nhvm_intr_blocked    = nvmx_intr_blocked,
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
-    .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+#endif
+    .update_vlapic_mode = vmx_vlapic_msr_changed,
 #ifdef CONFIG_VM_EVENT
     .enable_msr_interception = vmx_enable_msr_interception,
 #endif
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index ea2c1bc328..0372974b24 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
 /* Nested HVM on/off per domain */
 static inline bool nestedhvm_enabled(const struct domain *d)
 {
-    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
+    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
+           (d->options & XEN_DOMCTL_CDF_nested_virt);
 }
 
+/* Nested paging */
+#define NESTEDHVM_PAGEFAULT_DONE       0
+#define NESTEDHVM_PAGEFAULT_INJECT     1
+#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
+#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
+#define NESTEDHVM_PAGEFAULT_MMIO       4
+#define NESTEDHVM_PAGEFAULT_RETRY      5
+#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
+
+#ifdef CONFIG_NESTED_VIRT
+
 /* Nested VCPU */
 int nestedhvm_vcpu_initialise(struct vcpu *v);
 void nestedhvm_vcpu_destroy(struct vcpu *v);
@@ -38,14 +50,6 @@ bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
 #define nestedhvm_vcpu_exit_guestmode(v)  \
     vcpu_nestedhvm(v).nv_guestmode = 0
 
-/* Nested paging */
-#define NESTEDHVM_PAGEFAULT_DONE       0
-#define NESTEDHVM_PAGEFAULT_INJECT     1
-#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
-#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
-#define NESTEDHVM_PAGEFAULT_MMIO       4
-#define NESTEDHVM_PAGEFAULT_RETRY      5
-#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
 int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
                                     struct npfec npfec);
 
@@ -59,6 +63,25 @@ unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed);
 
 void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m);
 
+#else /* !CONFIG_NESTED_VIRT */
+
+static inline int nestedhvm_vcpu_initialise(struct vcpu *v) { return 0; }
+static inline void nestedhvm_vcpu_destroy(struct vcpu *v) { }
+static inline void nestedhvm_vcpu_reset(struct vcpu *v) { }
+static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v) { return false; }
+static inline int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
+                                                  struct npfec npfec)
+{
+    return NESTEDHVM_PAGEFAULT_L0_ERROR;
+}
+#define nestedhvm_vcpu_enter_guestmode(v) do { } while (0)
+#define nestedhvm_vcpu_exit_guestmode(v)  do { } while (0)
+#define nestedhvm_paging_mode_hap(v) false
+#define nestedhvm_vmswitch_in_progress(v) false
+static inline void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m) { }
+
+#endif /* CONFIG_NESTED_VIRT */
+
 static inline bool nestedhvm_is_n2(struct vcpu *v)
 {
     if ( !nestedhvm_enabled(v->domain) ||
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index da10d3fa96..8dc876a4c2 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -73,6 +73,8 @@ union vmx_inst_info {
     u32 word;
 };
 
+#ifdef CONFIG_NESTED_VIRT
+
 int cf_check nvmx_vcpu_initialise(struct vcpu *v);
 void cf_check nvmx_vcpu_destroy(struct vcpu *v);
 int cf_check nvmx_vcpu_reset(struct vcpu *v);
@@ -199,5 +201,33 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
                         uint64_t *exit_qual, uint32_t *exit_reason);
 int nvmx_cpu_up_prepare(unsigned int cpu);
 void nvmx_cpu_dead(unsigned int cpu);
+
+#else /* !CONFIG_NESTED_VIRT */
+
+static inline void nvmx_update_exec_control(struct vcpu *v, u32 value) { }
+static inline void nvmx_update_secondary_exec_control(struct vcpu *v,
+                                                      unsigned long value) { }
+static inline void nvmx_update_exception_bitmap(struct vcpu *v,
+                                                unsigned long value) { }
+static inline u64 nvmx_get_tsc_offset(struct vcpu *v) { return 0; }
+static inline void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr) { }
+static inline bool nvmx_intercepts_exception(struct vcpu *v, unsigned int vector,
+                                             int error_code) { return false; }
+static inline int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
+                                         unsigned int exit_reason) { return 0; }
+static inline void nvmx_idtv_handling(void) { }
+static inline int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
+{
+    return 0;
+}
+static inline int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
+                                       unsigned int exit_reason) { return 0; }
+static inline int nvmx_cpu_up_prepare(unsigned int cpu) { return 0; }
+static inline void nvmx_cpu_dead(unsigned int cpu) { }
+
+#define get_vvmcs(vcpu, encoding) 0
+
+#endif /* CONFIG_NESTED_VIRT */
+
 #endif /* __ASM_X86_HVM_VVMX_H__ */
 
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 960f6e8409..aa15811c2e 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -7,7 +7,7 @@ obj-$(CONFIG_SHADOW_PAGING) += guest_walk_4.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
-obj-$(CONFIG_HVM) += nested.o
+obj-$(CONFIG_NESTED_VIRT) += nested.o
 obj-$(CONFIG_HVM) += p2m.o
 obj-y += p2m-basic.o
 obj-$(CONFIG_INTEL_VMX) += p2m-ept.o
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index 67c29b2162..de1bb3abde 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -2,5 +2,5 @@ obj-y += hap.o
 obj-y += guest_walk_2.o
 obj-y += guest_walk_3.o
 obj-y += guest_walk_4.o
-obj-y += nested_hap.o
-obj-$(CONFIG_INTEL_VMX) += nested_ept.o
+obj-$(CONFIG_NESTED_VIRT) += nested_hap.o
+obj-$(CONFIG_NESTED_VIRT) += nested_ept.o
diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index 635f5a7f45..fa14e69fff 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -25,9 +25,15 @@ void p2m_teardown_altp2m(struct domain *d);
 void p2m_flush_table_locked(struct p2m_domain *p2m);
 int __must_check p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                                   unsigned int page_order);
+#ifdef CONFIG_NESTED_VIRT
 void p2m_nestedp2m_init(struct p2m_domain *p2m);
 int p2m_init_nestedp2m(struct domain *d);
 void p2m_teardown_nestedp2m(struct domain *d);
+#else
+static inline void p2m_nestedp2m_init(struct p2m_domain *p2m) {}
+static inline int p2m_init_nestedp2m(struct domain *d) { return 0; }
+static inline void p2m_teardown_nestedp2m(struct domain *d) {}
+#endif
 
 int ept_p2m_init(struct p2m_domain *p2m);
 void ept_p2m_uninit(struct p2m_domain *p2m);
-- 
2.25.1


