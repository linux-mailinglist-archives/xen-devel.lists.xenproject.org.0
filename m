Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id zFWQFD9AEmpKxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003CC5C0EA7
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318199.1586624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIy-0004vO-4V; Sun, 24 May 2026 00:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318199.1586624; Sun, 24 May 2026 00:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIx-0004pz-UG; Sun, 24 May 2026 00:02:55 +0000
Received: by outflank-mailman (input) for mailman id 1318199;
 Sun, 24 May 2026 00:02:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIv-0004U6-S7
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIv-005yCJ-8E
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:53 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124027-e002-0a2a0a5209dd-0a2a45028cbc-8
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:53 +0200
Received: from [52.101.125.126]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124029-af86-0a2a45020019-34657d7e3484-4
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:52 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:50 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:50 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eH+AkP/WWH89d2hhX1WI+hwl2pvfs+wjb5qlO47VDdd3n1xXzkqrilRDlf19NPGw3G80EqngStVNuAGOUVBgb+ULHI3XzsSQIpu+iaOVSYY+7rtm3Nxkfv+qPlH8F4LoBDcMIToBxw3IqMIv2ow8OJlvjcSjSeqSTOZn/YP1Rw22GdcPI3po6vHSLTEUJEfvR/TMDrN7djmZt66C1E09IwXXYODqGPSyw8kBzAVr85p0nsprUzRsJZbk+9xzYKjZ4kgbLcw2LdhNqgqZBFwLzAnTPgRqQ0z77mSWbho2ZlBMcvA+nE0ACsJKesK9ZTYvUbOCEk9ge90sHSXDcs+jlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm5+dbsTJv0oVX1IQ9G1iAH7WAbtmEAi6LSc1CXaftU=;
 b=TC+w04ua2qFIBe0lJKJCelD1rCjoLQiDnrTnIwVSob+I6YMiGBVO2vmA9TVPJZXQ5sl4g15xve8tTY2ZVTpGWhe1XjuVd9lCpWp5uubp89RUeS4KVYnfZqXXcvTlkcCLGIAr8uzyjNmpzU4xAsVqKEARtFz0V64FYS7uUJUn0huDRVGJKXhvmRtyVsCONu2Q4CR4Jh18COXoIyjvApeu3xWqjUey/OKrjg+pbStWplQ++bEMUFKi6i7kKpfIDruTe5IfrP9Y9x69AtducRDJNwwcNfDw3iCvZ9kZ2uWK79fon8vTKYZwniKApRkd2QBuW6HEgslmvpnFylXpk9JgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm5+dbsTJv0oVX1IQ9G1iAH7WAbtmEAi6LSc1CXaftU=;
 b=ezmhgRV1WnL1UTWKIzF+C4r4mfOIbs8yEd2LmDX5KOqozWFTNggeF59N4PdmcF8BlwHL4VrufL8f+XocCSc8Od1QqAR3tqg25kgBbwpXgJkFWtS8guOBiE6hqSSCssfUispNjzHMtN0UFOeLzGh2VFHy1vhF6R6oF4bcXKmulk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	anthony.perard@vates.tech,
	michal.orzel@amd.com,
	jbeulich@suse.com,
	julien@xen.org,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	jgross@suse.com,
	bertrand.marquis@arm.com,
	Volodymyr_Babchuk@epam.com,
	dfaggioli@suse.com,
	gwd@xenproject.org,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH 11/21] tools/libxl: Add 'numa-node-id' property to DomU CPU nodes
Date: Sun, 24 May 2026 09:01:59 +0900
Message-ID: <20260524000209.292370-12-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d9c871-ac3d-4232-5309-08deb927cb9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	04bjKQ3c5e88s1CtJdFXWAipu+VnDGL5whq8eu7LSSuV2BXbUH9SBBZT7BzR0Nzgp0VEoOsyiSR22PoxbnKDD4MsSOfwXDMlczwsVNCsCbthFuoZCEQ+M7a+WNnxr1vxgHzPIUAdX1l3mk58t5M/+UgVqjRy+KbxqVkYeh6h9aWbHEBh4//8ObZ1Vm1XdkfXEh+8oVYayjhRqytkkvMVc50Vlo0CTmTZEm7XeGi5jTtTS/im7VEmJlsLFJiVxZvYKiI7isoM7NJDtMGDMBnw0EX8wWNS7gg/ANFmvUCfc3meMdBEaqHYVltLTrcz7HxtOcNcuG3FGuoulwgidFzHuxK+u1xWafVNyEPCd8iwZR+0tHNLR/2qjD8ymXe+2PwQsgoUp6wDEavQin6FVWoyEttS+kczubawtIGz+efjADG1F1ZBhtKMtsfvzG4IjUus/Ko7EJg8N96c5AgsAIzcL32WcmPRJP4+7y2bQX2nIVFteYW36kbCrptKi7LbSWJfXoOtdpgNcMWh+0TRWMA1btcIpgzMgc7mu56ysLidKV76t5VLwwBmhoApsevO0x8MJVd0LiDkUWu+6ulhinQW15OdZVpgU9Eyb4ywR9X/kaz7W0gOhLsJG+yS41eb0J7NPHknToGojyQvdQK68+xZn+gnT03bw0aSom22s8A4xaPzj/5zePYuTlxXzG7cX5NG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qm4A9bWWhXe4PaB3bZ5SSeP91jZyl71W27m08I9eTQ8ehETyg6k8OJOmPYrt?=
 =?us-ascii?Q?kJX63/JI7LjdOtg4H3XA+bESh6n1lURkf+fWy0wiGWJPYITlEBnMiucDd2+U?=
 =?us-ascii?Q?96+6zqWwVMkEPBflGcEJ4Vs6AkGluwb8/OlKMpVLOazG8ca0Oph/N0GWD6lh?=
 =?us-ascii?Q?EAGSkh+zfsbVBDuPmtaWPtcEeVGe5o3OCfE4hKQ0H7dyicPBjD+AIBQsgKiV?=
 =?us-ascii?Q?rTpZDYlRo4ugdsAZVdncKQUc+UdfuaFFQBQNi3gmQNFdIGTLHxtNilOG8J+R?=
 =?us-ascii?Q?hDWhP9OOVcQMFu+GptSA9WcG7gMUzTWUBqwnSOiV+d72utNPvvYDyHJAdphR?=
 =?us-ascii?Q?uqkoDnYCkfVEOrnVsMqpxbZ3r0hZvmVjO+ybghKyKh4U6JCDK3toSC6TGr84?=
 =?us-ascii?Q?mH2rStoLpx3tBVgwqyFFsK+SxiGfsmNSaUwlnDRasutpJ9OqKVtK5shdf8zR?=
 =?us-ascii?Q?1RmjkZ9bJRa3GdWSrNteLiwPXWlcvCMet6J4imhXSnfiL7A3MGQJiwn1Kx+o?=
 =?us-ascii?Q?6ShuKkl0Gr7FOQi98iHv9I5LK319TWwFzcI7Yb+inWmKRGcLo4u7Y7+Owi/C?=
 =?us-ascii?Q?YRD/s1j6QerSsbwhoCZzY6/Sv3NuxQUI4U29Tjk2ISFVPwGXeh7l0kPNx/zm?=
 =?us-ascii?Q?0CPHHQfIfXhgcsp/sNZ/6Vu5YWr/DFFL3vr8LyqVIT8cVvH85tc5j7YBFf2R?=
 =?us-ascii?Q?O1E0TIrBHHjpM5frZnfwR2GdcTx+cVe36dfOIEE3ZSbeA8eT3BynsXO2XhZe?=
 =?us-ascii?Q?Enq+shkqfMhgUb/oi2QwLtHSM/FPNBrwnM0WhV8/9+pKcY8eQf9OJrhDKfU2?=
 =?us-ascii?Q?shmGhSaLEq1e3A7PMHsn8EPs/7i/jcrwuQcbcm67KZQ1zbuTNPn2LfuIDgYG?=
 =?us-ascii?Q?L7o4KiW8NEer1DIRcY2wsH4x/7/jTdw7J9qw3dH1lABkF+TnlFDUIWYAMkFm?=
 =?us-ascii?Q?8hM0QmWdCnBTA/nG6Dfdh+l/a0JAvkw6oT3Ohxm4b354K9q+dnajpE1WP+cR?=
 =?us-ascii?Q?u8IKbQRqh5BH48718P9yz11jTCu8VQ3DCOoYp8V1iPLl2/+p/AOelC2V0XBn?=
 =?us-ascii?Q?RMaSNWeAZMg7r3kJfD1rcrLp+J1xQZE48X2tqN6YpvMhWxWErJxgLeHPEVWJ?=
 =?us-ascii?Q?T6+yFm1oJNOgZE6tOdyI2o7vqKZJjnBgnWJw9s0xqRHv72cpif+KO3OVO+0Z?=
 =?us-ascii?Q?FutnJAY3MFZIsrX5MDoG9Ki2EyWKDbweyZ2QCkDPpML4JQl994bzYILum690?=
 =?us-ascii?Q?RH5axWam0/44qfJk+Jl1DLwsBErEkuHVD2sk6uKa1mnx9I8cuaDKnNEUOuEb?=
 =?us-ascii?Q?tf/L/vio7dYdn2PKZifmlW85+EM4VfpP3f0WIHVwItom8dCRq0poD2zPGpWf?=
 =?us-ascii?Q?iWsX3Hq50o895CpjnPprcYLxI4fZOOVbBK+oYo6KX2YXSoJQNVMV6y6gDsub?=
 =?us-ascii?Q?gyW8ghb3j98PIbuKzkR8yvn49s6m66N4uvGsvacxhHNkeY2klUQ+5ZxuS7v4?=
 =?us-ascii?Q?nG6hDeHt0P00Iz/ENdrJ/IQvw+hTtXCYMc8LPRLrxAy9Cvk7u3xwI/1Hhb5c?=
 =?us-ascii?Q?B+sSXfBcaQ1Y4dtTht8Ifr4Cc03Vtenngzl6+UH2Vp4PgmkEoUrBIn9kyVjb?=
 =?us-ascii?Q?aR1Pk+AEBknVqqOlsRfNKlExh0DpXWWLuTpHvqsrPbbS6kJoDfUFitzrPi+X?=
 =?us-ascii?Q?jesIMh0JAJV0F5wYDtEpuW2aAFQns1FdRziQ7+sfG5+Mv6ypIByYt4v/pzsU?=
 =?us-ascii?Q?OEWn2Fj9XDSJsoaAAU8a1Fpk36+2e5Pnqp/acWticMiW3qZrYFgZqY/fJAxP?=
X-MS-Exchange-AntiSpam-MessageData-1: abFeiRgbK7clNg==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d9c871-ac3d-4232-5309-08deb927cb9f
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:50.6052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +hGKx6nTSb049eCs5wm3ORlYDqIevM0Oj6lh2swKMmmZWvJe068MX1UKJZp90JSCKzPbo4Synqdlfj+qckWnfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-720697/1779580973-A9772161-21C2FB21/0/0
X-purgate-type: clean
X-purgate-size: 2298
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 003CC5C0EA7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the 'numa-node-id' property to the cpu nodes in the Device
Tree passed to DomU. This information is retrieved from the
virtual NUMA configuration in the xl domain configuration file.
---
 tools/libs/light/libxl_arm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 58a357858d..05d0f18e1a 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -571,7 +571,8 @@ static int make_chosen_node(libxl__gc *gc, void *fdt, bool ramdisk,
     return 0;
 }
 
-static int make_cpus_node(libxl__gc *gc, void *fdt, int nr_cpus,
+static int make_cpus_node(libxl__gc *gc, void *fdt,
+                          const libxl_domain_build_info *b_info,
                           const struct arch_info *ainfo)
 {
     int res, i;
@@ -586,7 +587,7 @@ static int make_cpus_node(libxl__gc *gc, void *fdt, int nr_cpus,
     res = fdt_property_cell(fdt, "#size-cells", 0);
     if (res) return res;
 
-    for (i = 0; i < nr_cpus; i++) {
+    for (i = 0; i < b_info->max_vcpus; i++) {
         const char *name;
 
         mpidr_aff = libxl__compute_mpdir(i);
@@ -607,6 +608,17 @@ static int make_cpus_node(libxl__gc *gc, void *fdt, int nr_cpus,
         res = fdt_property_regs(gc, fdt, 1, 0, 1, mpidr_aff);
         if (res) return res;
 
+        if (b_info->num_vnuma_nodes) {
+            unsigned int vnode;
+            for (vnode = 0; vnode < b_info->num_vnuma_nodes; vnode++) {
+                if (libxl_bitmap_test(&b_info->vnuma_nodes[vnode].vcpus, i)) {
+                    res = fdt_property_u32(fdt, "numa-node-id", vnode);
+                    if (res) return res;
+                    break;
+                }
+            }
+        }
+
         res = fdt_end_node(fdt);
         if (res) return res;
     }
@@ -1421,7 +1433,7 @@ next_resize:
 
         FDT( make_root_properties(gc, vers, fdt) );
         FDT( make_chosen_node(gc, fdt, !!dom->modules[0].blob, state, info) );
-        FDT( make_cpus_node(gc, fdt, info->max_vcpus, ainfo) );
+        FDT( make_cpus_node(gc, fdt, info, ainfo) );
         FDT( make_psci_node(gc, fdt) );
 
         FDT( make_memory_nodes(gc, fdt, info, dom) );
-- 
2.43.0


