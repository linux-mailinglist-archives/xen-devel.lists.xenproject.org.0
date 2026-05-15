Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNL6L/6cBmpLlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBE9549212
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:11:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309420.1580459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjte-0008Vp-6f; Fri, 15 May 2026 04:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309420.1580459; Fri, 15 May 2026 04:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjte-0008TJ-3Y; Fri, 15 May 2026 04:11:34 +0000
Received: by outflank-mailman (input) for mailman id 1309420;
 Fri, 15 May 2026 04:11:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjtc-0008T3-Nb
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:11:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjtc-0052Iz-47
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:11:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069cab-e002-0a2a0a5209dd-0a2a4503c7a4-32
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:11:32 +0200
Received: from [52.101.228.127]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c3b-672d-0a2a45030019-3465e47fdc14-5
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:31 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB5257.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:26 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:26 +0000
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
 b=Xs0ySpsXho/Q/PJkUY8kHQOPF8BiMJOyVyG1On69+0sLGBFGdWPDQDlaF5wp2mr3rulYxR9wP0SfbQRvHLhMcZlyjXF78a4zoXU6WlPKYyBoq9FTuE0irpt36iprv6ZNe26nsfmNzmq/UcU0kZMyayvnixvCmmzpX/GMs9XGLDR90CYd9ac5t++2Gd5e5DLQCO6F6o1jfslEaVOEFYOXCQmH/2cgNZQJ+Xa8VZ3bJ7m0Xpa7M7fHUQW5iQQmClwS7eOvigCW3vAOtgyb9bH/Katua+bo35oJqnG7xXjhqadUHX7UJ4jLsRgkO5FJkqe/iCZY5Zxx128GnX8GLaUTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQozeGS6NXue2xy04GwS38eB6n43tpIm85e71KD3+fs=;
 b=BQw0NCinlv8YvV9NUnVME52qwAL+Us66Bxia60rM2OBPfamYqcTbuczz9XiljOSkAj1Ivq8LFBRNBnZb18b/uBY10JUTpy/NokPp3GAQkCU75ES9bC7f/4fjR0VKiEfZhHoq2Cd6FDF3Ux+DbjHP/lYlKlKjY2qSElN25ctr+rvTKQHfis75QoMZQRFAS/Pfm6JVPVWuhj/NK9g/tPvjj4B7Vx1i2UHGMdOgE+XgCWJbSWwMZf7163f0dQQj02wsuU/N77WUYcYxBHHVjo29Iz2jX1TEno1x6D3D6Zmh7uv1Dg3WcjHQPoSURzx3kZiM4jUzUI0Ut8RXKGu6iwQsew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQozeGS6NXue2xy04GwS38eB6n43tpIm85e71KD3+fs=;
 b=M28oMCAlK0o5+PH5XnmMEvKUu95EfDESKwS/S+TehN31E4HYV6T6Eune1mVIguWXXC+lf1GemZ+0UydSBNYLbBdZXUmBXKRCJLgpwwgUHp7yp+zNUGoxgNPx1lhMBSEfYdHvq0B+W2hQfTGct3nlPJjCDOymWG1GFdIupMF+awc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 10/26] xen/arm/cca: add Realm relinquish entry point
Date: Fri, 15 May 2026 13:07:56 +0900
Message-ID: <20260515040812.983626-11-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0070.jpnprd01.prod.outlook.com
 (2603:1096:405:2::34) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: e384598f-eddb-4503-84a9-08deb2379d55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WA4HlbaemzL5K2jLH8XnQivh7FT52NP2WdiNqHSdgeTCw9uYueJGRq2J8gjQIJhXFcXaVtKsejakqG7TxMjOggMwGvpEIyEZtzEpXFHdEUGkOvDMN7S+26il90Ng/qs72h0Z1R9hHHbPpVYKbIPLkqfAA8NmVdbNR9FYo3aO0jA+s/OV8GB6dEn+p1EWE5rQ+M5Dl2a8SwMgjkWp+jQFhdIZJyks11wMbgOQY/SyNF44IVUufPtGgf9+vUp66wTITpHIrOxHniQADc3kzKf+BfdWxfsBfistCNHLkhIC60a4k+K6/J0tb4r3fLqmEv+PsVKMDkoOuzpwt955NK6M/FTbg3wBZE8vQjVbzWf4HjfZEGOoz08gl5mVy+/zD0cpWjZjb7k5iqeJIJlSyHLcGItORcuF04WSu7gDWBQt32Sego6hjJYxoivDTVWmDs3m4oCdzxqh+JqAJRHjDoT2Hp8cI4zUGaaRAbUcjqqh4qLe7/6ffyI1Fo3+8jTEAMZ8G2b/qqznkiueRA+luRkNopg6XH9mvZf7QPCZ8Hr7JpYXzCqwMteSSvZ5w4chk8a6mgul4QY6NtZ2wNa7pZP9fOsC77OfQMMt9/V5sBeQv35Ji1oBb4y94OPGl015HEo3TQndhl0CMECDvi1MRb5+l5gWorRFFHBVRV00e4GAfbAEK90ixFLFA6TvJPNkudmn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bHDSnIWcw7ASPEAzyqscbjn5EVg/54TM5UVtuBIAW03GMVmwERIyvXwP7piU?=
 =?us-ascii?Q?j6JAzWy4whmGmeGFVkQc9e6O1I7dHGUIwGAwJFik4+nWXWIfzWBDSCSfgYJL?=
 =?us-ascii?Q?ioIVSP0IQ6An/KgXZrtnkIEQlXPcAgAScxMJ+7q7kxH/nWe5nKmXMEDrOWGu?=
 =?us-ascii?Q?SdfISybxvHmL9mogH61/54hYAcPZCOXwWFtzw2gioKUgGb0SHzdcRvyYQa/g?=
 =?us-ascii?Q?Uneqe2aQSDyeMrI7CJq/DsVoOUaEK+6veDDsUaGmt5yeL54gSnMapzZcBU/k?=
 =?us-ascii?Q?GTTEXpswTpJjVddlt5VRVa6ipaCH95+OsI8/e2f317NK7F1532Ba3HwunW32?=
 =?us-ascii?Q?aHo0Zx4NPCn11+MbxksP1ukSpplKHKuIn74d5lYmK+KR0zL+ZVgfXCuM4cgC?=
 =?us-ascii?Q?ipUWU2cD51ZHVTY5vAw2e2RmkR72p8+1Ufozes4BBaCNH4H8Dx8dkxs3WwV1?=
 =?us-ascii?Q?+jlZ/2iS/7uVi7J5vF9dy0HGWMsFGn1bWX4ibdPBOU5NIWiSeBph3m10z41G?=
 =?us-ascii?Q?FQgvTgQ/5Z6fY4Tmi4PNe/gsrFUh/ZwAW7kO64V38RKpfzBjPtF0Oz3b+CqG?=
 =?us-ascii?Q?N25NwCc+4XUTOfLJxcvBPsHi1wUFb0mXhe1bwITlwoSDxJDCWKQEx4eT8J+z?=
 =?us-ascii?Q?4gaczxZT6gxeqcYy2zqAn39mYrrMhRlnQAHA6MAHOWHYNuTk5uShrpxgIVHr?=
 =?us-ascii?Q?JawAfSvDXKbYKcctRtd4cv7p4A+Q7DL4e4loovIqg9KiVK5tx/GKE/sSGMd7?=
 =?us-ascii?Q?OV0Wj7t/ombXyEQRASKAL6VLyhGtWBU1zRaoJeP2Vf6O5tODtw4JbldoivZx?=
 =?us-ascii?Q?Voj20htKA9ATURzpAowkmhHN/S64Ae9Eh2zmZB/7aH4AvpNlgEeHpkNTrP3c?=
 =?us-ascii?Q?bJUJEVxztaLfFbksjM3SWUSOZRolGMPTkt+sdkqMJ79uGV5PrcprA30lGANw?=
 =?us-ascii?Q?yvkDFy68xhiAmaILUTV+w/zhSzRgFvThwlVeDllujqbbU9wowl2eMAQwcFIt?=
 =?us-ascii?Q?0Ir2ygv+PmFRS9O0N8lMpbQfayWq19ivpfiD2IvfplPIySgnQIf28ZOGftFV?=
 =?us-ascii?Q?lxRSV04FfQ7Btqvgb+EMTOpaaEj5Am2l3ZR83ahvQDxjRULk/VXvA9tKlx0Z?=
 =?us-ascii?Q?YZfPcH4+RqGqJWylPnpJorPB/PkeVT4ojTm0eiBhUcTp0Pz2zuItNi1P0PKe?=
 =?us-ascii?Q?Q2u3whtPhEi/SDL5GIMzZXCYOZhlY+o6slfHiKy1pa7Z5r77zLBa0h6hbNzl?=
 =?us-ascii?Q?GEKFSHVEqojslgdaeZgCIJ27bsRm5r7EfsTLxZggVJuxdwaDMv8MkUVRdvUh?=
 =?us-ascii?Q?hNCO1M8LWhgJ2rhi2QXDe6U91AMxcnwl5OhT82WNpu+DWSNUMcB2CRdWsHyM?=
 =?us-ascii?Q?UFhSVESjbZw1zl3L4vpPXRmQSAKsLp07Zmvq1LMjPNumahEvOw16C5XFgifT?=
 =?us-ascii?Q?l9hDvil72kqwptVg231M3qNleyxo+Xhf5cMhxugBeVndNZ1mV7XzpM/j6eRU?=
 =?us-ascii?Q?ZBs5hR1cXLJVCu3xJ3rM3bqzahA5+1mMGKoP4/Wk+iKrvQImIQtlfExBq7WU?=
 =?us-ascii?Q?3OSFO4MOsyyXJWv6YpJF+0d8g/7ERzA46xwvpr6nCJX8kzZDgbfVy4/Sc79u?=
 =?us-ascii?Q?drPGb4Mlr6VXh6XJQ3/qqXwk4cI2bfnTg+NC0nHxnSeRUh7t0LATgy88nQrS?=
 =?us-ascii?Q?yhmtk/4eR9wxvQwa13ZCeEDnbCoXjQf7M9PCvJjqaWD2GGXjpUPBjs2y4ERA?=
 =?us-ascii?Q?GA2eNniSroJxBEhhMB0S5cFRkEXaT1eB7jvvtczvwK3C9v/KYbD9?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e384598f-eddb-4503-84a9-08deb2379d55
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:26.6341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hc+uDErL99zt12g8UJj0QPunqB19KHTtMV/KGinscfZqqs92msFJTYAYFimQDqNb1x+i/q+Ql67HkUza+pTIlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5257
X-purgate-ID: tlsNG-33051d/1778818111-38776938-1E0469A9/0/0
X-purgate-type: clean
X-purgate-size: 3313
X-Rspamd-Queue-Id: 2BBE9549212
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Add a returnable CCA hook to domain_relinquish_resources(). Later
patches plug the RMI teardown work into this path.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/cca/state.c       | 24 ++++++++++++++++++++++++
 xen/arch/arm/domain.c          |  8 ++++++++
 xen/arch/arm/include/asm/cca.h |  5 +++++
 3 files changed, 37 insertions(+)

diff --git a/xen/arch/arm/cca/state.c b/xen/arch/arm/cca/state.c
index 66375965a1b4..3646948eb11c 100644
--- a/xen/arch/arm/cca/state.c
+++ b/xen/arch/arm/cca/state.c
@@ -19,6 +19,7 @@ static void arm_cca_reset_domain_state(struct domain *d)
     d->arch.cca.rd_page = NULL;
     d->arch.cca.rtt_root_page = NULL;
     d->arch.cca.nr_realm_sro_pages = 0;
+    INIT_PAGE_LIST_HEAD(&d->arch.cca.abandoned_pages);
     d->arch.cca.rtts = NULL;
     d->arch.cca.nr_rtts = 0;
     d->arch.cca.data_pages = NULL;
@@ -52,6 +53,29 @@ void arm_cca_domain_destroy(struct domain *d)
     arm_cca_reset_domain_state(d);
 }
 
+static int arm_cca_relinquish_abandoned_pages(struct domain *d)
+{
+    struct page_info *pg, *tmp;
+    int rc;
+
+    page_list_for_each_safe( pg, tmp, &d->arch.cca.abandoned_pages )
+    {
+        rc = arm_cca_undelegate_granule(page_to_maddr(pg));
+        if ( rc != 0 )
+            return rc;
+
+        page_list_del(pg, &d->arch.cca.abandoned_pages);
+        free_domheap_page(pg);
+    }
+
+    return 0;
+}
+
+int arm_cca_domain_relinquish_resources(struct domain *d)
+{
+    return arm_cca_relinquish_abandoned_pages(d);
+}
+
 void arm_cca_vcpu_init(struct vcpu *v)
 {
     arm_cca_reset_vcpu_state(v);
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 4b6115491c59..2d9469f388c6 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1038,6 +1038,7 @@ enum {
     PROG_sci,
     PROG_tee,
     PROG_xen,
+    PROG_cca,
     PROG_page,
     PROG_mapping,
     PROG_p2m_root,
@@ -1098,6 +1099,13 @@ int domain_relinquish_resources(struct domain *d)
         if ( ret )
             return ret;
 
+    PROGRESS(cca):
+#ifdef CONFIG_ARM_CCA
+        ret = arm_cca_domain_relinquish_resources(d);
+        if ( ret )
+            return ret;
+#endif
+
     PROGRESS(page):
         ret = relinquish_memory(d, &d->page_list);
         if ( ret )
diff --git a/xen/arch/arm/include/asm/cca.h b/xen/arch/arm/include/asm/cca.h
index 80c161078d6c..9b53c80b5bba 100644
--- a/xen/arch/arm/include/asm/cca.h
+++ b/xen/arch/arm/include/asm/cca.h
@@ -3,6 +3,7 @@
 #define ARM_CCA_H
 
 #include <xen/init.h>
+#include <xen/mm.h>
 #include <xen/types.h>
 
 /*
@@ -57,6 +58,9 @@ struct arm_cca_domain_state {
     struct page_info *realm_sro_pages[ARM_CCA_MAX_SRO_DONATION_PAGES];
     unsigned int nr_realm_sro_pages;
 
+    /* Delegated pages which still need host-side undelegation retry. */
+    struct page_list_head abandoned_pages;
+
     struct arm_cca_rtt_record *rtts;
     unsigned int nr_rtts;
 
@@ -76,6 +80,7 @@ struct arm_cca_vcpu_state {
 
 void arm_cca_domain_init(struct domain *d);
 void arm_cca_domain_destroy(struct domain *d);
+int arm_cca_domain_relinquish_resources(struct domain *d);
 
 void arm_cca_vcpu_init(struct vcpu *v);
 void arm_cca_vcpu_destroy(struct vcpu *v);
-- 
2.51.0


