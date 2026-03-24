Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UExkBOHVwmnmmgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A73F31AAC5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261251.1554356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MH-0005JO-NF; Tue, 24 Mar 2026 18:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261251.1554356; Tue, 24 Mar 2026 18:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MH-0005FT-Jc; Tue, 24 Mar 2026 18:20:05 +0000
Received: by outflank-mailman (input) for mailman id 1261251;
 Tue, 24 Mar 2026 18:20:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w56MF-0004y4-Vn
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:20:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w56MF-00FIpx-Bp
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:20:03 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5b0-2eae-0a2a0a5409dd-0a2a4507818a-30
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:03 +0100
Received: from [52.101.57.44]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5d1-fd74-0a2a45070019-3465392cb817-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:02 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:20:00 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:19:59 +0000
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
 b=puZWUU2MDoSheW/KpCTsqQQjF6r99zS+7B4K+NFaIBnT4RPaOhsSo6o4WmfHfWZDU3tX9KHWVlh40vBSHAX7G3FHCiUA+ctFnqrVxG65Y+MYBm7sNtx0uFq5B7pNVUgshBm3heawtRzNE8q+T1De9ft16a0dbEtj3bUuS0LBxG5xw6EJLCB+OUfpzrR4YdAcLL76OzcwBgDKp6KRZq+CJTxkdjZFzVYEM7Sg2a3lbus+ipLYLlMrGyCFm166o2HYPfHReeuVbFgYY4SJGSvBW91orbNxDbqBVmGbsxG2DkDmm6WbMuvb0YGtXFUu7EwHfBsDrAZLUkN16MA56EDeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lAZdBNMrrBRBDiGfwjpi8MoTXE7T10SPeC1xSqxiPIk=;
 b=XWBTkAY1jcxwC+tc0JPNC3Fgdvl6iaa1NSDYZLCLRTDhGDOmHBCeR2ZUfQHWTjj5uGukIm4uyPxw2GXtxQnpSmTnPmSBfdMb+yiIyAf6aoAuYsymS1/RTRGXApxCVFsqrZB8km0Tm4hJUVldSo+ZU6XQ28kzCqxhWe/7HA4HCOxcBhrB3YJ8oK4LNMvb5k1pxTuVh+YHD2TtHlUTs2nw9iRpBcHRouOb/YngdqE0SKhhtyhjAw1Tc2TBHcNknIHX1Hu0J+ULHLjsBtgbggc1SBxUYSXl9fobxQXIqysqbQ0Aq2vDy7ft8gcq8dTAX3CWboEFRbqQ5ClvFoHa+k08Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lAZdBNMrrBRBDiGfwjpi8MoTXE7T10SPeC1xSqxiPIk=;
 b=k3EvrkDtf2bKyPOxIkZmpd9SA0Fildamyhxn42L8qqSWdxK4zrln+DyuM3Ja3Ges685AA3ScJnmer5QsICAKz1/XDfWsfQCtZeSKv0Vk8uHki4fGZ2InS1/Bj8XP/3O7EuNr9XCoz9JFmAFKeNhuSFqH2MPMMS6j+3lLE9Tw/JU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 4/9] x86/svm: Remove lazy FPU support
Date: Tue, 24 Mar 2026 18:19:32 +0000
Message-ID: <20260324181937.2465574-5-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0037.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::26) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a32f7a4-2303-4ac3-34ee-08de89d1f595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	dbgTbAzYYFhiJhZFTv7qoMFG6pXWo47Vb/YZpLFq4DsgQwKFoI1/KxR3VQ+fet4lPbMkoVrJ+5sadXd7XKzQvhfbdsonV6apDbJ9LnRDZVF+68gyYOYQQg1a1DFOrbH711YZAp5I9Pv2d0gwD9C6LTvP+6YGhdNmn8GIeqPBw/o5ZF3rGenjGRqdlhA0Ukanz8DDUFnpztYCFZFgkGzr9qcP9IQZqgD1SnUU/OhlqZVldO5XTaYIu1uvLfmB6PXeLTXg7ptMG3RROwmxnEWvPlHZImLYpyXtyZB4+TbQ4s0R798TvjHLqV6y11x6fMV690tRMGCoIiYRczAO0HSRJ7dE6axDjfeW/uhSkb/ac5ldXobiXEu0lH4Kus4EEDmQaq9y8YJRQFR4+WMaGdrtCoFeriEJWgcv54eWTNQsfsip5N/aWPHp1Bk9rDUMTEebD1qkRYcsd6zeD2gxp8rbvyBRDh+zWXKL9h3kdrz1/9AnyTf5FJISRBeGYzBqWFCnqqvSnajpj2gzRPrRMcAwXhvY/CPmGWR6UID55ESBZnh8NzL+YI9avcc51pDR04oVOv1ij3WtNz4ySvrqFeeJRCYaTlt2GP5hghUljeMEHVLVKU1YxNyYHPuhahJahSmGeVX+0laaPFSiB8zcrrNBOcHSvru4GWNF3lwaIU+OD66/s9R+NOVN6WHi7H2nFX8Vc+99e5/py3mpptsOdgOAxRQxhhMj6fXWKjIOQRGcjEc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f/03EbPy11gXcP/MI/O/teh0Qb0NWB0STXvnXSk6wF7D8BxuUWAx92NcfT+7?=
 =?us-ascii?Q?8FwYIbHeUKzTkSbftrRTmvutQ+xkEAeSDKT+Qe5ZwARxujmdco0NrbkRmPAo?=
 =?us-ascii?Q?h1ZOU4+kae8J1cFVBZWgwRowxdNehBIeSSR/k/gCqV4oE5GykIZvOP5625PL?=
 =?us-ascii?Q?t7m1sIyBw8Gso1yfJF/LU6QsCmczen6qm1y2zJGGVobhnZi6KPZwKcuTOQxF?=
 =?us-ascii?Q?C2eAqo9Z8yQNO0xBfEl2fHfKL8BPtFL2VNiJDLsLtbEIYCvxzLrRca0oPLz9?=
 =?us-ascii?Q?IWoLCI6QaDv4Ug15F3bYE+nwkLZU463RxMhxcLqEdwSmYkkzaFq/jDlU6RFW?=
 =?us-ascii?Q?VolB25ws8RmyCg6CzBOe3uk4TccWtxzbcfQm7XIXwlzWQbDCQ0nr+xnOdZam?=
 =?us-ascii?Q?IQB3ecsB9qXWjg6pD4uOlTs748c0kCfIkaJR+Mq8lmZx5ZAY4OujZWbHM0Xn?=
 =?us-ascii?Q?JS4ljhnzd/1cMjUYJvMhqWTOroTsXgpZtTD9xEgWSz02fi4+NV+j47vq5L2z?=
 =?us-ascii?Q?dWucfRBXMLDehIocaFBVykAPPkDUeMbmLvuPtcGxdldyZEpHrUUOzdx9lUul?=
 =?us-ascii?Q?CPaSnViu1k/tpOgGtqyeByw8n45d2tvj1rLVQ8BB5F9mvluCn6fBs+flmbOq?=
 =?us-ascii?Q?1KBVNTeB4n+gGJxApL7XXwrgcecqk0SovRPxJ+waSx/cePyWa9vIdTB7gwwt?=
 =?us-ascii?Q?CMh+JBql6c2PvUhGNzcYbEHkScfhTKtdQn4Kk8P208VRTOorML0m4bmkZ2R9?=
 =?us-ascii?Q?PBsm0DOPBN47AVYpZK7TmSKYg3PNiBUyi15uZ8n+kr8r4L/pquFoPkiCFvnJ?=
 =?us-ascii?Q?rvx/tMul6jdjGxPAsYAQAhXfux4BB/IwUBbqbm5irEfXQELWQrdhx0vNieIh?=
 =?us-ascii?Q?nZpP9HXosUw6rA9DGytH21mMMi/HI/gjV7EkhGdADmBhv/1XZ/0pj1OMKHSP?=
 =?us-ascii?Q?QRm5Rf1bXGLHN2Eq0d2ST6daZajhPlWLBB4oxC9etf+5x9iUk8QO336FAEdO?=
 =?us-ascii?Q?TeN8DQYMX63zm484v6IAFLYNhuUKJkJovf8vlOSoboQ/fYENn+uij4IobOxy?=
 =?us-ascii?Q?RaKq2inRoBcnypcAVwkE6ps/EwK90HWI9WrpUK/FnZREs6TFBwg259HXTTq+?=
 =?us-ascii?Q?iu1TD6VUudaNug8I9SPk4n/PpyWd/emCljT+ISml5PusIUNE8jIx2apYpq6j?=
 =?us-ascii?Q?JuXs8+x/ozWOXmhMkNqlMWgajOI9CQGrLB2Y+3Ar8CB/U8Y+Ne8b+kOG2FKu?=
 =?us-ascii?Q?XlJkONc+OP0k8x2kP+oh19WPE+GC+fuTpV+ijsI/EFGOnulV1VZp6vs7nSz2?=
 =?us-ascii?Q?Dl2i+R+RLGhp3L0I7fwSEpADccw+D4yuPVi+iziVuAvrMLMV7Vf3sz8cvRaV?=
 =?us-ascii?Q?8cwUkh4/T3FskhlFycWngDr0dgOWAlalkngHoN1OhTd3r07tFOJzDpHSvAqH?=
 =?us-ascii?Q?DiZabC2CiULpIHclMyo9px5eXi09ujMzUjaXbDaIIClqUiJFh3Okz2JHgPAg?=
 =?us-ascii?Q?5aNNP7C6a5xAFLQLunsdcQL+jywwnIMxZfwhetvehtWt/3fihQb/XSEW2NH6?=
 =?us-ascii?Q?MfNcWiOVQVkVMrFfLTcoxAlun30ZYWs4swZNNQlf4sjuGTepCk0DNpfurToO?=
 =?us-ascii?Q?ilKzZX+CK2bAdzKU0Q1BpNGu8T8m3Wodi+IDea6ZgLyxkTkFjVhhhXOzbo7U?=
 =?us-ascii?Q?suteX+l+xh4tdGwLEC1gNKuPwzyYVGJvyFZG1dwvrPCp4qt/XQ0jxzwU8dKm?=
 =?us-ascii?Q?Trw3oQJBR1QFtWJUX6IIIh4Sn/XGOCs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a32f7a4-2303-4ac3-34ee-08de89d1f595
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:19:59.6156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MowXxwG4scbHrrL4TjdGLDd3ufRzwCtafyQOg6+7AZ30JysOJu3rAAo5FG0N9+fP221BRlwi2F66bMqkZciJ2o+FQQ2gkZxX5T7rpGrzwI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771
X-purgate-ID: tlsNG-ef75cf/1774376403-4FAA5303-0B8D85AC/0/0
X-purgate-type: clean
X-purgate-size: 11655
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9A73F31AAC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove lazy FPU support from the SVM code since fully_eager_fpu is now
always true.

No functional change intended.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Unchanged in v2

 xen/arch/x86/hvm/svm/nestedsvm.c         | 67 +-------------------
 xen/arch/x86/hvm/svm/svm.c               | 81 +-----------------------
 xen/arch/x86/hvm/svm/vmcb.c              |  4 +-
 xen/arch/x86/include/asm/hvm/svm-types.h |  6 --
 4 files changed, 4 insertions(+), 154 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a63ec613465f..ef6fa5d23b67 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -165,58 +165,6 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     return 0;
 }
 
-static uint64_t nestedsvm_fpu_vmentry(uint64_t n1cr0,
-    struct vmcb_struct *vvmcb,
-    struct vmcb_struct *n1vmcb, struct vmcb_struct *n2vmcb)
-{
-    uint64_t vcr0;
-
-    vcr0 = vvmcb->_cr0;
-    if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_leave() run while l1 guest was running.
-         * Sync FPU state with l2 guest.
-         */
-        vcr0 |= X86_CR0_TS;
-        n2vmcb->_exception_intercepts |= (1U << X86_EXC_NM);
-    }
-    else if ( !(vcr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_enter() run while l1 guest was running.
-         * Sync FPU state with l2 guest.
-         */
-        vcr0 &= ~X86_CR0_TS;
-        n2vmcb->_exception_intercepts &= ~(1U << X86_EXC_NM);
-    }
-
-    return vcr0;
-}
-
-static void nestedsvm_fpu_vmexit(struct vmcb_struct *n1vmcb,
-    struct vmcb_struct *n2vmcb, uint64_t n1cr0, uint64_t guest_cr0)
-{
-    if ( !(guest_cr0 & X86_CR0_TS) && (n2vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_leave() run while l2 guest was running.
-         * Sync FPU state with l1 guest.
-         */
-        n1vmcb->_cr0 |= X86_CR0_TS;
-        n1vmcb->_exception_intercepts |= (1U << X86_EXC_NM);
-    }
-    else if ( !(n1cr0 & X86_CR0_TS) && (n1vmcb->_cr0 & X86_CR0_TS) )
-    {
-        /*
-         * svm_fpu_enter() run while l2 guest was running.
-         * Sync FPU state with l1 guest.
-         */
-        n1vmcb->_cr0 &= ~X86_CR0_TS;
-        n1vmcb->_exception_intercepts &= ~(1U << X86_EXC_NM);
-    }
-}
-
 static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
 {
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
@@ -246,7 +194,6 @@ static int nsvm_vcpu_hostsave(struct vcpu *v, unsigned int inst_len)
 static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
     struct vmcb_struct *n1vmcb, *n2vmcb;
     int rc;
 
@@ -281,8 +228,6 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
         gdprintk(XENLOG_ERR, "hvm_set_cr4 failed, rc: %u\n", rc);
 
     /* CR0 */
-    nestedsvm_fpu_vmexit(n1vmcb, n2vmcb,
-        svm->ns_cr0, v->arch.hvm.guest_cr[0]);
     v->arch.hvm.guest_cr[0] = n1vmcb->_cr0 | X86_CR0_PE;
     n1vmcb->rflags &= ~X86_EFLAGS_VM;
     rc = hvm_set_cr0(n1vmcb->_cr0 | X86_CR0_PE, true);
@@ -290,7 +235,6 @@ static int nsvm_vcpu_hostrestore(struct vcpu *v, struct cpu_user_regs *regs)
         hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
         gdprintk(XENLOG_ERR, "hvm_set_cr0 failed, rc: %u\n", rc);
-    svm->ns_cr0 = v->arch.hvm.guest_cr[0];
 
     /* CR2 */
     v->arch.hvm.guest_cr[2] = n1vmcb->_cr2;
@@ -418,7 +362,6 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     struct vmcb_struct *ns_vmcb, *n1vmcb, *n2vmcb;
     vmcbcleanbits_t clean = {};
     int rc;
-    uint64_t cr0;
 
     ns_vmcb = nv->nv_vvmcx;
     n1vmcb = nv->nv_n1vmcx;
@@ -452,7 +395,6 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
      *   safed here.
      * The overhead comes from (ordered from highest to lowest):
      * - svm_ctxt_switch_to (CPU context switching)
-     * - svm_fpu_enter, svm_fpu_leave (lazy FPU switching)
      * - emulated CLGI (clears VINTR intercept)
      * - host clears VINTR intercept
      * Test results show that the overhead is high enough that the
@@ -551,10 +493,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         gdprintk(XENLOG_ERR, "hvm_set_cr4 failed, rc: %u\n", rc);
 
     /* CR0 */
-    svm->ns_cr0 = v->arch.hvm.guest_cr[0];
-    cr0 = nestedsvm_fpu_vmentry(svm->ns_cr0, ns_vmcb, n1vmcb, n2vmcb);
     v->arch.hvm.guest_cr[0] = ns_vmcb->_cr0;
-    rc = hvm_set_cr0(cr0, true);
+    rc = hvm_set_cr0(ns_vmcb->_cr0, true);
     if ( rc == X86EMUL_EXCEPTION )
         hvm_inject_hw_exception(X86_EXC_GP, 0);
     if ( rc != X86EMUL_OKAY )
@@ -1305,11 +1245,6 @@ nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
     case VMEXIT_INTR:
     case VMEXIT_NMI:
         return NESTEDHVM_VMEXIT_HOST;
-    case VMEXIT_EXCEPTION_NM:
-        /* Host must handle lazy fpu context switching first.
-         * Then inject the VMEXIT if L1 guest intercepts this.
-         */
-        return NESTEDHVM_VMEXIT_HOST;
 
     case VMEXIT_NPF:
         if ( nestedhvm_paging_mode_hap(v) )
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 243c41fb13a8..2546705d245c 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -104,38 +104,6 @@ static void cf_check svm_cpu_down(void)
     write_efer(read_efer() & ~EFER_SVME);
 }
 
-static void svm_fpu_enter(struct vcpu *v)
-{
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    vcpu_restore_fpu_lazy(v);
-    vmcb_set_exception_intercepts(
-        n1vmcb,
-        vmcb_get_exception_intercepts(n1vmcb) & ~(1U << X86_EXC_NM));
-}
-
-static void cf_check svm_fpu_leave(struct vcpu *v)
-{
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    ASSERT(!v->fpu_dirtied);
-    ASSERT(read_cr0() & X86_CR0_TS);
-
-    /*
-     * If the guest does not have TS enabled then we must cause and handle an
-     * exception on first use of the FPU. If the guest *does* have TS enabled
-     * then this is not necessary: no FPU activity can occur until the guest
-     * clears CR0.TS, and we will initialise the FPU when that happens.
-     */
-    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-    {
-        vmcb_set_exception_intercepts(
-            n1vmcb,
-            vmcb_get_exception_intercepts(n1vmcb) | (1U << X86_EXC_NM));
-        vmcb_set_cr0(n1vmcb, vmcb_get_cr0(n1vmcb) | X86_CR0_TS);
-    }
-}
-
 static void cf_check svm_update_guest_cr(
     struct vcpu *v, unsigned int cr, unsigned int flags)
 {
@@ -145,20 +113,6 @@ static void cf_check svm_update_guest_cr(
     switch ( cr )
     {
     case 0:
-    {
-        unsigned long hw_cr0_mask = 0;
-
-        if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        {
-            if ( v != current )
-            {
-                if ( !v->arch.fully_eager_fpu )
-                    hw_cr0_mask |= X86_CR0_TS;
-            }
-            else if ( vmcb_get_cr0(vmcb) & X86_CR0_TS )
-                svm_fpu_enter(v);
-        }
-
         if ( paging_mode_hap(v->domain) )
         {
             uint32_t intercepts = vmcb_get_cr_intercepts(vmcb);
@@ -169,12 +123,12 @@ static void cf_check svm_update_guest_cr(
                vmcb_set_cr_intercepts(vmcb, intercepts | CR_INTERCEPT_CR3_WRITE);
         }
 
-        value = v->arch.hvm.guest_cr[0] | hw_cr0_mask;
+        value = v->arch.hvm.guest_cr[0];
         if ( paging_mode_shadow(v->domain) )
             value |= X86_CR0_PG | X86_CR0_WP;
         vmcb_set_cr0(vmcb, value);
         break;
-    }
+
     case 2:
         vmcb_set_cr2(vmcb, v->arch.hvm.guest_cr[2]);
         break;
@@ -909,9 +863,6 @@ static void cf_check svm_ctxt_switch_from(struct vcpu *v)
     if ( unlikely((read_efer() & EFER_SVME) == 0) )
         return;
 
-    if ( !v->arch.fully_eager_fpu )
-        svm_fpu_leave(v);
-
     svm_save_dr(v);
     svm_tsc_ratio_save(v);
 
@@ -1678,28 +1629,6 @@ static void svm_do_nested_pgfault(struct vcpu *v,
     domain_crash(v->domain);
 }
 
-static void cf_check svm_fpu_dirty_intercept(void)
-{
-    struct vcpu *v = current;
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    struct vmcb_struct *n1vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
-
-    svm_fpu_enter(v);
-
-    if ( vmcb != n1vmcb )
-    {
-       /* Check if l1 guest must make FPU ready for the l2 guest */
-       if ( v->arch.hvm.guest_cr[0] & X86_CR0_TS )
-           hvm_inject_hw_exception(X86_EXC_NM, X86_EVENT_NO_EC);
-       else
-           vmcb_set_cr0(n1vmcb, vmcb_get_cr0(n1vmcb) & ~X86_CR0_TS);
-       return;
-    }
-
-    if ( !(v->arch.hvm.guest_cr[0] & X86_CR0_TS) )
-        vmcb_set_cr0(vmcb, vmcb_get_cr0(vmcb) & ~X86_CR0_TS);
-}
-
 static void svm_vmexit_do_cr_access(
     struct vmcb_struct *vmcb, struct cpu_user_regs *regs)
 {
@@ -2459,7 +2388,6 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .update_guest_cr      = svm_update_guest_cr,
     .update_guest_efer    = svm_update_guest_efer,
     .cpuid_policy_changed = svm_cpuid_policy_changed,
-    .fpu_leave            = svm_fpu_leave,
     .set_guest_pat        = svm_set_guest_pat,
     .get_guest_pat        = svm_get_guest_pat,
     .set_tsc_offset       = svm_set_tsc_offset,
@@ -2469,7 +2397,6 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .get_pending_event    = svm_get_pending_event,
     .invlpg               = svm_invlpg,
     .wbinvd_intercept     = svm_wbinvd_intercept,
-    .fpu_dirty_intercept  = svm_fpu_dirty_intercept,
     .msr_read_intercept   = svm_msr_read_intercept,
     .msr_write_intercept  = svm_msr_write_intercept,
 #ifdef CONFIG_VM_EVENT
@@ -2783,10 +2710,6 @@ void asmlinkage svm_vmexit_handler(void)
         }
         break;
 
-    case VMEXIT_EXCEPTION_NM:
-        svm_fpu_dirty_intercept();
-        break;
-
     case VMEXIT_EXCEPTION_PF:
     {
         unsigned long va = vmcb->ei.exc.cr2;
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index e583ef8548c7..5ed7123d9a69 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -138,9 +138,7 @@ static int construct_vmcb(struct vcpu *v)
 
     paging_update_paging_modes(v);
 
-    vmcb->_exception_intercepts =
-        HVM_TRAP_MASK |
-        (v->arch.fully_eager_fpu ? 0 : (1U << X86_EXC_NM));
+    vmcb->_exception_intercepts = HVM_TRAP_MASK;
 
     if ( paging_mode_hap(v->domain) )
     {
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 051b235d8f69..3ede62cade80 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -65,12 +65,6 @@ struct nestedsvm {
     /* Shadow io permission map */
     unsigned long *ns_iomap;
 
-     /*
-      * Cached guest_cr[0] of l1 guest while l2 guest runs.  Needed to handle
-      * FPU context switching.
-      */
-    uint64_t ns_cr0;
-
     /*
      * Cache guest cr3/host cr3 the guest sets up for the l2 guest.
      * Used by Shadow-on-Shadow and Nested-on-Nested.
-- 
2.53.0


