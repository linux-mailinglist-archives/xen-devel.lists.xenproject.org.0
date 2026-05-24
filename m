Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OH3hIkdAEmpFxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B595C0EE1
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318238.1586678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJD-0007qo-5m; Sun, 24 May 2026 00:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318238.1586678; Sun, 24 May 2026 00:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJC-0007iu-U3; Sun, 24 May 2026 00:03:10 +0000
Received: by outflank-mailman (input) for mailman id 1318238;
 Sun, 24 May 2026 00:03:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwJB-0007ZW-RD
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:03:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwJB-00EXML-7E
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:03:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a123fe6-5cb7-0a2a0a5109dd-0a2a450bda96-46
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:09 +0200
Received: from [52.101.125.111]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12403a-212f-0a2a450b0019-34657d6f18e0-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:08 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB7274.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:439::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Sun, 24 May
 2026 00:03:05 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:03:04 +0000
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
 b=n7ee2/ZfYoWpajMoHdRR48YyiCCsc8kedK91ZcE3beF8P6pHybLQ3VmJGmehR1qtJ/wqkO5kmzj0ePty9GGpk10Hma1xkHUFyJSyoSWUWs1eP90U+N8lRTfprd/5LOw5qPF/gsShKHqaF5E4uAAd1j+cuoFdqWci2FWKE8825MsaiAUXHbOA0jsaXrVYIb2V0UPkv6WuvsUKF2c25LL9SdXt08w9X4RvoM+Y2CTjQOZ6SHYM06zQIn2JTw82Nl2TJ38WCPpl92rKcoLOfSLwfe437GRIv3VdamBi9V+dDEY9XuRAOUPV8rWakijbKqYlLYn+0WS//Iq3qNw7SRxawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obw1nZcPTKd4hlGOSXyksn31SLCWaXqU+VhsOWUL7c8=;
 b=l/MwmX/6pVpBwjwAvDUyUTTL4p6qPybr8Y5ToiS6+ZeUTrRjX+/l4eTBkioK2jMSJLwx226wxVG6xLMiB3qMYvyX7JhCzMDJ0vgsIQP5ECtwDuGAKyx9f+rWF+zFhZHpcBjwrJ7uRdXS7gakSm35pC3wLL/FUxymX9dwnjevKJFgNyZz+s26187TaAvJIkVTJWoxEgQaxQWKTrk4mau3JhkM4QMHevT4+os3RKidxXMZSMm5PofYxbC7ULDJdcx1tOXj3AvoBYjmTPIIpQLQ7VedKqWh/3XJf/eV/HMuTdslyTiEv7mlG8UIHW44GrirGX3s7pzTGjhLtPvteTEF7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obw1nZcPTKd4hlGOSXyksn31SLCWaXqU+VhsOWUL7c8=;
 b=mKb3mNfeGH/snsVm2mUojrrWWo5dJoQKApFX25/zmrme/Y7nodq0v4byvPNiqmwX1+lkXptVdUl52wsZH3xNkFvLL7HP4ceWt0la2Z5O0FRIHbbMI38rNSpr2tXS1iz/svQpJAm65eq7KolwnYUms5a9JuJugMKLmBeRYadpmiI=
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
Subject: [PATCH 17/21] xen/arm: Export Dom0 vCPU-to-NUMA node mapping to Device Tree
Date: Sun, 24 May 2026 09:02:05 +0900
Message-ID: <20260524000209.292370-18-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: e575e416-0725-45c0-b0cf-08deb927d42d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eUUjzRoWNdof1yEWg2wBJRHmN8i6zzkzO8jzF/kVVUtFofk51J5mevw02S8Rj4Uyan2uZvncQoPujPEO/ns+KBfGcSi8kxK5yemDySihTHyXPJUHIjPZ2Z8/ZjjsSoo3VcAOcrzbCgScw5CBNd77Zk53QHKmu8JUIphgeH6LUSSIDrE923sBxLvY/+rAKw1f25BIFkrr+KIbQrCS1msb/nJ8RxKEXv0iKSsb8i8dqst1S1GjjgvL7mbpl6YQxHTbhvvugv4Jkhrelh2OI4KDyFXb+rWut4zadxocGJaYxj0b4lD+E00lTArYSs1dE7BtqbKXdcINeJF+Tc0qnATDE3/Lxc/Kqag+Msoimk+1yQopaL9ynAGXRb7dTK9WO5Lon50zfIToW10b7J58YSz3s/gGKEKx2JLZRnot9L3JfJlfNUhwqG7niU3bC7DzX01hPCyloIi54D3t76ulaEUk9avQFXXU1hKdP38frqM3OdhMO1RmPYmMU1sE+k741/dG9sNYgBcVrsEZjRMZAaCSNSr0RMFSUDovCzuJiGzfajiMuGE/gEo393+aq8YliUem1CUpqEUe2N4fGzPlGCp3+7aVAYZ+sdAI5ANrQ3XqcLv3S2LYp+UKU3WxHMjzQ0h4CyrrPTnlnyU3FeQBCOAIw36AA1Vqks2v56rJCNjKwYD3vw4HnODKIygxAuT9s5kS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MifNv/tWTrjP58Y18mD71/yFGOGRtDzEhtTxgz79RrKpTZscJwVxPJTv6JVy?=
 =?us-ascii?Q?ZSvBJj9Kkvwe3RRbfduHaH3DScn0IYv4RuzWB3VkEH/AiuGzuR3HRPutVynt?=
 =?us-ascii?Q?zY8F6gVQxsJCxOIfKTKR0JMw34PzLQRBLOKvVY8loxn47dkNPyl20Uwii4O6?=
 =?us-ascii?Q?k1bsIKjPlQsmgZ8GwrfQsEgVpTsKCIeZ4UhJ11ile5a+rWuHloHmz+/epTxi?=
 =?us-ascii?Q?3e8+ts/WBPhAwcmFTHL4xwob7cB3VhJjBxecmJGYJzVn374CUi4EhtCA5dZL?=
 =?us-ascii?Q?YvQF9ZfrHM1rhe3XdngiBso6AFgMLSuLDE8QsCiXrSrLashUWUwVZa72B3ja?=
 =?us-ascii?Q?8tUGzxVCuj+vdE2idTHv7etDtBo7nFf21ugNFQdW9W8wMxWXT/KXTHTJf2Da?=
 =?us-ascii?Q?XIv6kVyHOIwnz6zmLE/7/lAqI7nycVLUTnLd05DQvYRBllKQ/O0YF+hVGDYN?=
 =?us-ascii?Q?KCeelGee6+BdTRMhKBej534cFkcFc5wzcNHA/d/nqOSkUHPC/K0TiNfeiEK3?=
 =?us-ascii?Q?TT6boz7sTjl5NN+YuHO9XLnuiey9TwVi6g5ZGL4hJuRULx6kkbeiFujpJT7I?=
 =?us-ascii?Q?PFiUkL6ratqmufFdUO1jDiiy3RZav5ykCqUAui1lFYJe+/z5dZf7SiDHDN3Q?=
 =?us-ascii?Q?PV9kuInoDstH1xE1WC8M16LjfgtFn0n/fmZ0Nq07vNBuHNL1Dnm6z6yi/NU9?=
 =?us-ascii?Q?HV/AtMy5qdqJO2VfP42lw5EJZO1VQK/MSNuFi1qGZIX+LeTdEmM+XgsT4sB5?=
 =?us-ascii?Q?ckIH1iS7hcRQr+EDHSbNlyy0oQZ3Zqf50zNm47zHkwkQ8OgpaPYFAO5gVrrb?=
 =?us-ascii?Q?NOxEfmQoKm0sbDSzH9bO6NBwS+HAsQCD8nLoC+Zn9sWG6o3zfB85JwFyD0EU?=
 =?us-ascii?Q?BK2oXHMpTgLPUeXnGOtMdIWKlxo/1TFQwCSluNtR/n6VpgjxPULvCsx3Ke7F?=
 =?us-ascii?Q?61EmtKwkk5Soi1FNB9iJ5EZG0VAFsU7kObqUCA50LBnbzXgcJUHV+0wjDSs2?=
 =?us-ascii?Q?NnHyJ0p4ZmNXRD5W4BdWdR8BevV7/zXvsNsauYZeB177qpim1fQDfkudAep9?=
 =?us-ascii?Q?wDdJ6W+Lb84aVsV1eOyBGF8sPRBA9qQ0YdyRv6jo1as+ryCQhs+TsOdDsaQa?=
 =?us-ascii?Q?YIWSu3CoW1BQw0MGgmRtBhUVLfI3jtJoOxuA1ttvyHvZisBOccYA02VOuzaN?=
 =?us-ascii?Q?+/bXnEIvZHDbWS5CuG9Ao/3J/7lc+GDBWAtXCe0DkYvx9wHaOZ6I7zi2Xq4U?=
 =?us-ascii?Q?agG39x6vSWbcIlwcPeGvrvrcfH1mOseUF812PL7QXna0tiN66g4XqwmYv+Pl?=
 =?us-ascii?Q?rFP0qj0aodZ1JqFR9BOsQT1i3NdBvmbQjtXz+Ic74jJC40Qv9k44xNXSW+OG?=
 =?us-ascii?Q?f6wljYuEU/mXbd0q/HvGJ/q8GwwB54ppteFx9OHXcLwBixgA0MzmYrF1c7+D?=
 =?us-ascii?Q?rSqdKQ+vCTMzILd6jr6XtR4O7FdrKqJy6VsjyIJq8oLhT03cM8fu2lcUhi4C?=
 =?us-ascii?Q?f1mfPFabX7wG8by5/tPDDmdwpKkCSMWkcuxqf/7PnAyS4pk//NlKY9AjX7g9?=
 =?us-ascii?Q?YwiPESKd9Cx93DNpwBnDkXo0KDhFsKdHFY/xxPqbQCTi/tq8EAdYSoecIRwb?=
 =?us-ascii?Q?lTiuyMrb/bMiXnT+JW3bImKc9luwgSHkoYineENjrlzHp4g69LhM9WQkd+Np?=
 =?us-ascii?Q?o4A5yfiHkVJtTgxO1xpOkZfeULuXOQOdjh6cO/W/p6wxGKxlirhzpnJqjZZ9?=
 =?us-ascii?Q?4nWagD+Hk4Z2l0aoCPxKND01CqYNAsUN+ujNz9euUYHouJWwipSMA+HFNVKd?=
X-MS-Exchange-AntiSpam-MessageData-1: rpo02wt5MAhJKQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e575e416-0725-45c0-b0cf-08deb927d42d
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:03:04.9469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWkWR8WP3UlaQwpJj6NdwZEaA8M9qYibV897DI7Lafn4VU8E95XJsTTGC+Dn+4HrmDCKNQ7iMo9lLt117fQjnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7274
X-purgate-ID: tlsNG-42698a/1779580989-1956BF3B-F36FF2B4/0/0
X-purgate-type: clean
X-purgate-size: 892
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
X-Rspamd-Queue-Id: 28B595C0EE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Export the mapping between Domain-0 vCPUs and their assigned NUMA nodes
into the Device Tree generated for Domain-0.
---
 xen/arch/arm/domain_build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a62adafa19..11d0fa1233 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1373,6 +1373,15 @@ int __init make_cpus_node(const struct domain *d, struct kernel_info *kinfo)
                 return res;
         }
 
+#ifdef CONFIG_NUMA
+        {
+            nodeid_t target_node = dom0_vcpu_to_node(d, cpu);
+            res = fdt_property_u32(fdt, "numa-node-id", target_node);
+            if ( res )
+                return res;
+        }
+#endif /* CONFIG_NUMA */
+
         res = fdt_end_node(fdt);
         if ( res )
             return res;
-- 
2.43.0


