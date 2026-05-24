Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL4dA0lAEmpCxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4E5C0EE8
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318244.1586687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJF-0008Jw-Fd; Sun, 24 May 2026 00:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318244.1586687; Sun, 24 May 2026 00:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJF-0008Cb-BQ; Sun, 24 May 2026 00:03:13 +0000
Received: by outflank-mailman (input) for mailman id 1318244;
 Sun, 24 May 2026 00:03:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwJC-0007lG-Sk
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:03:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwJC-005yId-7v
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:03:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12403e-2eae-0a2a0a5409dd-0a2a450bb766-0
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:10 +0200
Received: from [52.101.125.111]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12403a-212f-0a2a450b0019-34657d6f18e0-4
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:09 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7274.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:439::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Sun, 24 May
 2026 00:03:07 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:03:07 +0000
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
 b=gk/Q7S7CeAKlgmwgwCfdPaRt22BakVe8S2IfAPLUKK+twhwI7Wdz1jN7HGncal39WydNbXhS4kQ1fKL/GShC5C7qogs76vMLqNHI5UMOKO8/JMVtP56wsdQkx86qHQX3ey3JfyOobDdLJwsCSorpwzCMwIb3lnmZgwEB6IDFtwTXJZgFoCRH37+TsVIPjpfRSLG9eU68fut9Ru3Vx8VxubzFChqgJSftDGVZQZUitUmNU2lbvLXPvvFwHqFicR/HyalNknLrJfbVu6/K+Bw+5pLKrV95GKbA03j0CXSu9neJDDbs+06v/RBJ2RXb1hMRpiGLpIppNRBciqz0fCxZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/uOZioLySihrc5rQcsyh87OXtUbbmHXHPRWdNWOE7k=;
 b=dzmdEM7biGPob/YvNDpWgRfD539rCe8/NNb0MHxR3yTt1qgv41D5tgo09hM4Je9eh13SLLTNn0cweYqcgjM9yK4D7SFttZWN2+xwRu7NRoB7GVWi3xBHb404zU33fKNT/ul4sNFuOpBymh8HhYgR30w4v5Rimy61cmNnzfxUzQZxluJp1ZCATtsJKwGzAzMowhEV39Cltu5/9bkyyFbXtGFsumknaLdQ/xteUf6xVCTSSJaMMeItAsY7yuGCjgX9fjcCu8SeiSJYDZGc2hFJjo9QKq0ZgYzYKNY0C596e607P56rFdJi2czeV+X10DAqYL9nGryKN3GJOhsN2hRBBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/uOZioLySihrc5rQcsyh87OXtUbbmHXHPRWdNWOE7k=;
 b=nIKYRJJXMQZs5eqyZAK41Gjn0kAZr5pfnH1paEaXIOPH7pB0Cw0+MTFfQZkXOiM/kj8fS9Ajxr+wG9sgJ9peG7visYQ8ADI3ytWyWNLv3FSuV6ngLtt9+LoHOeFtoqu2IfkBnQgcQQmcbd4gQ5ZBf00plDmuoNQmnY0AXnsu8Aw=
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
Subject: [PATCH 18/21] xen/arm: Generate distance-map node for Dom0 Device Tree
Date: Sun, 24 May 2026 09:02:06 +0900
Message-ID: <20260524000209.292370-19-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: db4e0624-4c96-4f22-9af3-08deb927d5b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9+vgDBfwZF93VpAd9CUqriBskjTN/zo4hzULGr/G97SZv8++C7CJWPoMg78JQmr9zUDsXrQtMewoO0u9vHdCf5lt0rMJIjGNIFQDAkOFsDZC8PsxUM4grHpqxitWqEarVoMlrsZSncORtE6d7rP3+lxZW9jVlwvSSt6tOqENTsOh3VgQt3vjpmglchdWdIsKBD0+tT0a7VrNYYUglyt6ET2j/U0mKLWvOH/YqdbFreXwf1V+SeiLSMhAN8sZYMFUmsU+2+SEtqRK0JBKuhhUf10nYIPBNHqAJLJyHy9jIE4eBfsfZ8Hr/EXnJotqeVshIqeRhVrRrE07wW3OuMTSFhiOQKbE07/I5U1gQ9wSuT4n9Cphi1XyDT/JOlyEij1KRtn77g3lfxkSD1MBcURcE9yW96HbQGiHrdjGpy9J5kcF36/yWfSWf7bVTicn9KGGFxa5K6OYT+REs2QYRmfMqYK9APXbzYbeBx2asnKAOktFmnk+bi3JUa8FT5bfPSSj4tzDR61EJYuRIHz213stA/au0VW1x8E81sW1LJMgf7S3+w5e9Vvycr6sPbd+sSMJGq2mGIDaVZklBzEoauKMd6f2S+5bHDC9jYtqnVFbHFDryifnzs6C2vElPSkB0hgSJ/vSpIQyFrujN3F2IJcvoyi//H0wGwBZyBxRo8QnLnpW2xBblah05jHqcIdyBZki
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RHh4CSCAsIo0A7J860PWcvu1lkoBUiCz6OgIQmfIFzo2wQr8g4Wl5AAxlQDz?=
 =?us-ascii?Q?TC922s8W8xfvByHTVCdHZKxhRDrsnct6/JAEpYJ6R87INBStZl+WDa3Pmn+p?=
 =?us-ascii?Q?jM9oWCH61KTunr8ZAcaLeluJ99NQMMRlLajTKg2LDjfHYJ3+DnH1bVZFhhze?=
 =?us-ascii?Q?zEreAGpiTauxAeVm20qFZwJLj4Gr3zuQjBE9rogfPE5NqVIC5EkI2KRnNBkd?=
 =?us-ascii?Q?jW5ONvccSZZesn5RWb2T5D0YpHntmXXE9RjKrXfT0Unle3Z6Zl5ZBV6OQBiM?=
 =?us-ascii?Q?s461zBFn9zb0Na24YcZt+E8mKMlzorTrVfiB3MpgJ3ntHpBshhF6CNU8AcxA?=
 =?us-ascii?Q?/U3jVfHwaL9BIadUORiFKd0/Mt78HuYUQdHNaWvY8vAYG+iDhsS0kjwLGpfE?=
 =?us-ascii?Q?opqS5t+dGbS2H8Vl0cxXoKTd9ggYTi264682mt8RdPt1NIleyopfytVu1eOt?=
 =?us-ascii?Q?ldxZKz9wV/BRDuCPvJqp2PckeXKjr3jPWGJ4d40CsuXVMSm/LPRzDv0TWg5m?=
 =?us-ascii?Q?V5ygNOq7tHO3Hp7s/hKTPSD94p0OH2n055Vy/4pjW/L4q/ELwFjBJM6+lige?=
 =?us-ascii?Q?Y+lmayFT2jQUuEjcLSb4N1/5yw/2P3v9WGsmFyzIuhibUfpZzypCYMD4QgML?=
 =?us-ascii?Q?rrgdR/TCo/CwjKQBjCx4gr9XxXMhSJJ7VGvsJgRS7Ju3Y7JKbUoeTdm0hs4S?=
 =?us-ascii?Q?rQkpNyOcW6iJPIdFuICJtxsi9VbrOcnmITvcUt2Je0h+iAHymRUUKeVRyW2f?=
 =?us-ascii?Q?iEUYt22QoBNJ8lgDLxlRD+RRBIP+3042C/MzsGULRE3kfhoF8+Kw20J3Hi6q?=
 =?us-ascii?Q?PsT/+aE/cdN0RZ0qtJuTdHBVqZNr3zxZXdeMVjQIUnorYnHvGoj2BrRoye1r?=
 =?us-ascii?Q?O8m4eZZvIpkBDYRltrH0w4PQyWvZ6spbaZlZabmvqavt8VN9YBZPu7ExI1a/?=
 =?us-ascii?Q?+advpLzu6cCT5mYuvjSCJUTWs+tojwZpYXI48IQki6bjOB8qTdS8aWNuFDs7?=
 =?us-ascii?Q?mQK+Ti3/6nfEzPr/6GhcjJw8Qv9H8ebZWz7z76ZRuypAVSWjpC1FbXsFN2bh?=
 =?us-ascii?Q?YAmo7kX6WgS7KA2ilZCLa7WyH0F8i8QQ3CJqxBSq6BWFnDmaB1v7HxHKjnlp?=
 =?us-ascii?Q?kLI0L2sl0ntpN4I5V8Rg+TcLM9fzW1FZyI4wieDT0GD1UF3bsnMuTdcO540T?=
 =?us-ascii?Q?YboBgnkEQW2Z+SdCRVXZm8++VWo3O02A/Hs8BZAKUlt57aIlVjbr9BEGEmdb?=
 =?us-ascii?Q?PkLgUzfRsgWihAPIeu/lbOO6GMeN3qQ/A3pC7iNokqRczqpCYDxY1PQlJWDk?=
 =?us-ascii?Q?tbIsog5orMowu3pLqZeI3i/wCgSwgaVH6GadcVrpAzjGf22U9VlgxWXBo/5P?=
 =?us-ascii?Q?+9GfYIs9CWUpuwWCA4g2mlcNtXqS7OvObgmrwu26vj/bVkK0KT/EPowsyQDT?=
 =?us-ascii?Q?ErRJmFgrICpdSDf8uXImeqgM1fo+kNAudH6pJEP44cogFPFd1CTxNCfHLwEN?=
 =?us-ascii?Q?1M97XlMwiI13rGAVzhv7pgd3QBOAUqGsBCphNpYUC89wgogrkQgb4tm6RgbI?=
 =?us-ascii?Q?PArbCD62/5Y4+HvTVfBNOjhkJia1yk7NLQlldphrN2vp3vEGAWP90h06TSr5?=
 =?us-ascii?Q?Gjy/wnGYWnlOQMJv11fq+8qtYMOELg6zdbrTrKeHmnPiHbFXGyE5OGjBTBSo?=
 =?us-ascii?Q?MuJ3GldkYhTryzcGc2afocxlS36KCay+Ptzt9nyB8FOYwJ9nTvXNxg2epYjo?=
 =?us-ascii?Q?87NQnwqMLnuvnO2ne/+9+5ZQ/mY13XtQtKYxuP895778hL9cYIUJK+bxoZQu?=
X-MS-Exchange-AntiSpam-MessageData-1: WFKQ3vWYpPpySw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: db4e0624-4c96-4f22-9af3-08deb927d5b4
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:03:07.4429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4YeP49LSEiH+nH1fpAw1lE/9PUpr1B8/AjYJZx7uDfvK/5HhEwSHdyA3dS1Qwv25rhHmagwY3P7WcAF3505Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7274
X-purgate-ID: tlsNG-42698a/1779580990-18F66F3B-1AD57355/0/0
X-purgate-type: clean
X-purgate-size: 2697
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
X-Rspamd-Queue-Id: 93C4E5C0EE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Generate the 'distance-map' node within the Domain-0 Device Tree.
This ensures that distances are populated only for the specific NUMA
nodes assigned to Domain-0.
---
 xen/arch/arm/domain_build.c | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 11d0fa1233..2bf4b37f89 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -718,6 +718,51 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
     return res;
 }
 
+#ifdef CONFIG_NUMA
+static int __init make_distance_map_node(const struct domain *d, void *fdt)
+{
+    nodeid_t from, to;
+    unsigned int count = 0;
+    int res;
+
+    static uint32_t __initdata matrix[MAX_NUMNODES * MAX_NUMNODES * 3];
+
+    if ( nodes_weight(d->node_affinity) <= 1 )
+        return 0;
+
+    for_each_node_mask(from, d->node_affinity)
+    {
+        for_each_node_mask(to, d->node_affinity)
+        {
+            matrix[count * 3 + 0] = cpu_to_fdt32(from);
+            matrix[count * 3 + 1] = cpu_to_fdt32(to);
+            matrix[count * 3 + 2] = cpu_to_fdt32(__node_distance(from, to));
+            count++;
+        }
+    }
+
+    res = fdt_begin_node(fdt, "distance-map");
+    if ( res )
+        return res;
+
+    res = fdt_property_string(fdt, "compatible", "numa-distance-map-v1");
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "distance-matrix", matrix, count * 3 * sizeof(uint32_t));
+    if ( res )
+        return res;
+
+    res = fdt_end_node(fdt);
+    if ( res )
+        return res;
+
+    return 0;
+}
+#else /* CONFIG_NUMA */
+#define make_distance_map_node(d, fdt) (0)
+#endif /* CONFIG_NUMA */
+
 int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
                            void *data)
 {
@@ -1569,6 +1614,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         DT_MATCH_TYPE("memory"),
         /* The memory mapped timer is not supported by Xen. */
         DT_MATCH_COMPATIBLE("arm,armv7-timer-mem"),
+        DT_MATCH_COMPATIBLE("numa-distance-map-v1"),
         { /* sentinel */ },
     };
     static const struct dt_device_match timer_matches[] __initconst =
@@ -1734,6 +1780,10 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         if ( res )
             return res;
 
+        res = make_distance_map_node(d, kinfo->fdt);
+        if ( res )
+            return res;
+
         res = sci_dt_finalize(d, kinfo->fdt);
         if ( res )
             return res;
-- 
2.43.0


