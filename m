Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GK1sMkNAEmo7xAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B9E5C0ED8
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318225.1586669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJA-0007Ea-F8; Sun, 24 May 2026 00:03:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318225.1586669; Sun, 24 May 2026 00:03:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJA-0007Ca-2R; Sun, 24 May 2026 00:03:08 +0000
Received: by outflank-mailman (input) for mailman id 1318225;
 Sun, 24 May 2026 00:03:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwJ8-0006z1-Ir
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:03:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwJ7-000m7t-Um
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:03:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12401c-bab6-0a2a0a5309dd-0a2a450cbdac-18
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:05 +0200
Received: from [52.101.125.118]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124037-62f1-0a2a450c0019-34657d76a273-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:05 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:03:02 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:03:02 +0000
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
 b=WTqFtlx3L0XOA9timBkUv2ADg+Owsm9yef+zE3fnW61aczKrbYdMnjtmRVSrm/TBvqdrjetv0J/G990o9YPAJGU0cEJwnJTmto6WoNsrQSZTTF+L793ChFAdEznkYxxsVgwsNEYbtt8oiGvk3nYrxrmNSOlq5YH5FYxoi8/SV3lINjla3TfwUG8UXLW0hNGhy0BNS0Lv4XULMV2K41thtBKX9wO/kQDpmT/2JN6tXj4iuXjOhuNJwiSvO9I8oap82aFu04lDt7w+Ji5CJkC+bsieY3VC0fbUBkeieBf/F3jAr+GTsydYiEIYZdQG879SjD5aYcqMbPHmQx9qJTDExw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IISNxGg7j9E7jMdBYWz59g/s/VxE99jHkjaKf+wwH+g=;
 b=Ut5opo5qzgaEVsx7G5N8xuDiYfy2Ln6pNCndAOV/x6jPwSIqhLbS2iZHb9zexnzNgqOdcuoFpOW2x1AZpokkKh1GrQiRaroLIAEqVGQcrztuUO0//zR7u5MiJshCU+Oivl4M4Vckh80sM+1i4kiqu5kcWpP/5hkE+0dL8bGN+MgzICv8YwpS2I86E/YE6ojWGu4qfVyxUy/fVOB3ztkEzUjRe3vcMMbT7CgXU8jLUTe3r4iX5oH7ktSDteIs2J8S/oo6Epg4nVQeIQGWsa2ck2BjvT/oeuaxDfzIkMTCWdQ8VEzDz+Ts7aaxW9QzEZclXLZB4cvUFKpzD8VvCfkTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IISNxGg7j9E7jMdBYWz59g/s/VxE99jHkjaKf+wwH+g=;
 b=aQfhKj0vmDhv8/vGX4smEsCcfXaj1lI5VereRp2kcgSoEh3GO5QmfFSVstFO0g1FICD4hIJtON5M3tF6OgKb4Jtv43xpkUw6zgWRgVx0OrzObBm/0cql8QGKrn0uq7m945oaNWd9Dfd0somVszYNISzaF+UEpF5cfsWdL0vYt/o=
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
Subject: [PATCH 16/21] xen/arm: Balance Dom0 vCPU assignment across NUMA nodes
Date: Sun, 24 May 2026 09:02:04 +0900
Message-ID: <20260524000209.292370-17-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::12) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: f07c572b-31fc-44ab-e135-08deb927d2be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	hT6wiwp25e4lUwRYlN0jt1O/UydI2u8o0bVjJbbSx0RJNhi7yyRaZMm+4AKxzv482SkVMVtT3H9jzeAkEzLnItZR1DqDbq3lnV0YjMfTb0vWq6fx6muK4xS16A8aVs3+9uGCttdlWiJ4QlF0ZfUABq8oBCbVZSBNHEXXADropbAG5b/mWtMZevYzkF7cL9smM0336cXBi5uRi7CFFFNuLO+WZoz0r3SmDy/XGQ3bgozb7lj3ILnqGSaFTiV0fEmxtcNY36u/oMOwfwsFUQUW0DvBlUyKmwnf9JL2U74rMaqIqZPk6SkRALVBRAvcl4JyOl3UpWNgeLxp/dMKAjkZ/zBCHa3ZQiqhGWHktvfOnUO697Iq2P3M4f4+xisp7pTFtKF4PFnm2wXSARiHZjvM54/uxPqIZLidRpcpd4WqS2afI50OMFg6MUQkx9AsLE2js4wyJnSBV8esDcc9yCeqXbKbyi5Vk56520Jgs0ItHBPDw/vFQRglvi3PA6WnYe6s6ZQjDwVEYgknXBTL2UTMJi9Z0Xncw+QA27Za7letpNwqrn/5jce38vFVmrrFUPX4oTlCFI32PS70T6ed9wN6N0QZvgjaPdDeLbc1vzp0uhYnsIZDXahYRadz13vkCSiPIKRLFEakg9LMQC9NBQEITuSRBcrHXJxOECG2eAzZkWps/pIYjvmtmTVwS3VWLx3S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?13lMIixZdgvu4rv2RvD14FWWNO7pGOWxKA5xtg+V+gxGmsV4YSyx/Pabx4yw?=
 =?us-ascii?Q?3C/cWGiq4OK+lD4YkZEkZy8Yz+jqw97LgLj13o2gpTPXbGlahkSFn9bVfdgv?=
 =?us-ascii?Q?RkUBAEF2gCw+o+hTPL0bKShlEYuv1gDeY8/cODzOG4KduMCrDFhZkmZvoZxc?=
 =?us-ascii?Q?ugSKkYVzP43pqEEtP7kpy2KI66L6F7osl+OJaXFTvoXUxCoJa6lbu7yF5RAs?=
 =?us-ascii?Q?bvh5leqf7AdSGqaSz879M82Jhf5h9pHWca3j33S3Xc9ZpXWPoltaAikyYLtx?=
 =?us-ascii?Q?XxAevijfEIL8YMWflasuAw24NjL1qR580xACC6nIPJT27b9K3aHKx2xugQ2P?=
 =?us-ascii?Q?Y85Pok76qxuoOhkkuOXrHhj8Tczi9yWgiMg9Iv4aM9/bLX51iVh52+9yW+el?=
 =?us-ascii?Q?u8onkayItOJj+6DC/0n+RUsTKRJTKcZuphAfjh3Mr5J+ViUmLh7tv9sV4iBL?=
 =?us-ascii?Q?GrSdxPr+9CfzQ6g4UG/V7dzYH47/A8a6Eev9VTmMiKK+NoGsme6eRCsiLLIi?=
 =?us-ascii?Q?UNknAJCiA0flzWbeemzUXsgvXwhdPPPXmNtAQDxSk0IpwpqXi5KOcN2eNS0I?=
 =?us-ascii?Q?nVg5kgr7EjMD6R9CtMx6E91RMjcpZFYZKFD7Qg7ilMFrCGyEBqjIWA9eKzSI?=
 =?us-ascii?Q?7QhXdLLiZG1jBHmArgzemO7nVjY9NhSNI3FVAGLOF7MP0vrWvW1kcXM3tfMH?=
 =?us-ascii?Q?e4h53lXnB4anzy9PrXwMGmfIMmYRfeUOmflkBxNsDmxk9Q96Z8kpr58B/Wip?=
 =?us-ascii?Q?bVyBTIcfMPNzKAhNZiKKt72PpkY40YUhjqs459rnybQLhgZb7GDiJcMNBQLA?=
 =?us-ascii?Q?QuUphi2VpXPMCthWwk+UzK9tA2N3bKduC75c9HmIX0AHltuHCSkRIz0FMV96?=
 =?us-ascii?Q?vcDu+8OfPkcb5HnQKcLWHX5QImQak8IunYF0nBH827kx+DoXtiyuJJyw38WG?=
 =?us-ascii?Q?71MbhLnZef3VVJP8/vRPWVJD5A+xTopuHahxiqT8nf00mcghfm0dsNr+/thq?=
 =?us-ascii?Q?j6nOCSDSc7DvyLqhx/4xEVWjgjZIZU1Iv/uEd+FaesWWiDUr+Rc+atKSaV7c?=
 =?us-ascii?Q?p6Fl0n1a7ChPJvE3JcAFZUeStWsQVnw+G+8eCfwrNV+5prbKJCNoNuiUcj49?=
 =?us-ascii?Q?AqRI+XJqctz2771SP8HI3SEcLL+co69/QQ8C+D5wc7TEfcyy96h0zT9tmZQF?=
 =?us-ascii?Q?9mcauiTfKQsSmuiuXIBrtV0RIxB/Kwz78S0XxjQffTkqW1nGXol4X2sxa+ph?=
 =?us-ascii?Q?AjMJ5Du3KdVfR9bYDPz+fAHXFrQmANYc/pB/3r+JTAjVR4kMk32Qrnr/XhRa?=
 =?us-ascii?Q?5i3daDUV3sEZDlOJ+8/hzondyehV4VgIQqRfwxPXy/DKxBVD40gCUDlEjn6a?=
 =?us-ascii?Q?4flSEoZsPsueFW9+QO8p2KwngrzEYb6B+Uf3fa8B6SOJPvrsZJH2Q6HO0k3y?=
 =?us-ascii?Q?UsfFG84Q1oqLxHdkplBF9jZJVRxEurQrRjlzSUr116iUCR3jR8NTIjw4phQo?=
 =?us-ascii?Q?7Z91Ix7q2vKsXeD8hYP+mns6DJisbUcgEeCwbofNMQKIXaKP03vGBLDRWLmF?=
 =?us-ascii?Q?r9tPcih7Mn71LviQ/n01UnL52p4km3dMdN4famOuB/49f9FLOeGOcwcn1ZQ+?=
 =?us-ascii?Q?O4Lb9G2yrCY4RanfkoHMdydoIzfBhXqxcKtWE2yUukw4yUv7KFNyi/AL0aUq?=
 =?us-ascii?Q?tbN4+hyfkAyxP8l+hf8aizPLIvcr4iByJrwsnaXCiDBdObZ6N9KVJvB5i75j?=
 =?us-ascii?Q?623dPSuKeP81LRFrknbx+hWSoCTj63aq81VNirEWUeIU1teaGCgKtNDDV379?=
X-MS-Exchange-AntiSpam-MessageData-1: 6VWMNAUS3buPMA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: f07c572b-31fc-44ab-e135-08deb927d2be
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:03:02.4596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HT/UtDRXK5+Y4phWAdKITLzDNKlP1ztooEFcyF/A+xExwGGAST//EzykGfZXVHovw5sNnSVcqh+LYWJWQ+c9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-d25034/1779580985-E2169CF5-69CF686D/0/0
X-purgate-type: clean
X-purgate-size: 2013
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
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 82B9E5C0ED8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Configure the assignment of Dom0 vCPUs to NUMA nodes, aiming to balance
the compute load across the available nodes.
---
 xen/arch/arm/domain_build.c | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1deb4c1139..a62adafa19 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1225,6 +1225,34 @@ int __init make_psci_node(void *fdt)
     return res;
 }
 
+/*
+ * Map a Dom0 vCPU ID to a target NUMA node ID.
+ */
+static nodeid_t __init dom0_vcpu_to_node(const struct domain *d, unsigned int vcpu_id)
+{
+    nodeid_t nodes[MAX_NUMNODES];
+    unsigned int nr_nodes = 0;
+    unsigned int vcpus_per_node;
+    unsigned int node_idx;
+    nodeid_t n;
+
+    if ( nodes_empty(d->node_affinity) )
+        return 0;
+
+    for_each_node_mask(n, d->node_affinity)
+        nodes[nr_nodes++] = n;
+
+    if ( nr_nodes == 0 )
+        return 0;
+
+    vcpus_per_node = (d->max_vcpus + nr_nodes - 1) / nr_nodes;
+    node_idx = vcpu_id / vcpus_per_node;
+
+    ASSERT(node_idx < nr_nodes);
+
+    return nodes[node_idx];
+}
+
 int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
 {
     int res;
@@ -1907,6 +1935,24 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
             vcpu_switch_to_aarch64_mode(d->vcpu[i]);
     }
 
+    /*
+     * If Dom0 has specific NUMA node affinity configured, bind each vCPU
+     * to its designated physical node.
+     */
+    for ( i = 0; i < d->max_vcpus; i++ )
+    {
+        struct vcpu *v = d->vcpu[i];
+        nodeid_t pnode;
+        const cpumask_t *nodemask;
+
+        if ( !v ) continue;
+
+        pnode = dom0_vcpu_to_node(d, i);
+        nodemask = &node_to_cpumask(pnode);
+
+        vcpu_set_hard_affinity(v, nodemask);
+    }
+
     domain_update_node_affinity(d);
 
     v->is_initialised = 1;
-- 
2.43.0


