Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZbH1LD5AEmpCxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D565C0E87
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318196.1586614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIw-0004ac-HR; Sun, 24 May 2026 00:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318196.1586614; Sun, 24 May 2026 00:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIw-0004Yu-DQ; Sun, 24 May 2026 00:02:54 +0000
Received: by outflank-mailman (input) for mailman id 1318196;
 Sun, 24 May 2026 00:02:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIu-0004Pm-QA
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIu-005yCJ-6G
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:52 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124027-e002-0a2a0a5209dd-0a2a45028cbc-6
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:52 +0200
Received: from [52.101.125.126]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124029-af86-0a2a45020019-34657d7e3484-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:51 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:48 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:48 +0000
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
 b=Ag0gdjWC/Tp1gCd6yZx671QXttXEXQLtEgd36gb+U+AEsU/S0C16xRa8mOTafrmAfOSHMrtfC4lc/SifipoKemoi+Xgkmr2Vybivvax0twsrn9EW8zDBxeUHQuD6RiJRy6zvF6/oz8c0OaetViV/xB9r4oXkqpzdXAM3UjEXj9As/F0fo6S/UH0oUZQjxCamXrvU4U3FVq/FNi1i3RzUs2MyNfzXL6ue2CNEjpa77F1D65iIwKC6UfcjSUFGx2PkFk5hUfBGSRR389+/VcK07Y58PpIpHKK7d6PKr/IqMinGDrGGThxVhG8Kvbuyl5Fl+O8zvShtukMUJZOFne/tOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6btrO78jHQNB6X8N3K0j5SG3DMoMVJVZM54L8xG3S4=;
 b=ZaulGsUiA2n3+lRB9IdkbKNiuZiqHAkDePQeHjKcjkbcOEmdtbwzbyljn2u7TT0Z8G4SDXSwJbSPMIni91dTfLYUVcm8gvCL0I8u/X0kbH0mPfWRniJf42nTeSmSi5eU3WBz58sBc8VcBiSOlU+FXKsnUkY+teSKM4ov+dnoSG7x2uuSHUfUyFUK/R3eDi8U8RHamwjZewFmqe1UJLb1YaacApaoI1m74HomZztFTxxzGNuIxa11BPnPyl13GMhFcFjS5zSI0P9nL5tzhz70Cbtk4E6rQCd1+FAMItHD2BEExGOOdHPYiG9e7XdcTiRP2epbRYQcxxcV/FdFMdDSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6btrO78jHQNB6X8N3K0j5SG3DMoMVJVZM54L8xG3S4=;
 b=A49ZXWZK0+IOAd2U45C2KuE3P6kr004eIhifvAOmfO8ytXDX82yMcMW4FetmBj+tTAp04ax70I74cwHmggXV4uzg/Fg3anR5Uc9bPRdUcqWTK+mL1i4W31s/QUFSUeInTTbl54mp6d47bvbRV2m3YSErL0W+0C8j8U7CxcDBVBA=
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
Subject: [PATCH 10/21] tools/libxl: Add 'numa-node-id' property to DomU memory nodes
Date: Sun, 24 May 2026 09:01:58 +0900
Message-ID: <20260524000209.292370-11-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::13) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e87ca95-2a92-41f8-6846-08deb927ca53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	A8SVnR7drOWuVIUzSbO17dtZurRjpOvElKZaBYR8RvWP3MZ1a2/ef6GPnJHVrb/69ph/b/A/KpjvREjt7HwjTE+enjdRWyLEzDenQPuK8WdBHfKP+SWoztOVimf8HGepZLwzO1+Y4I0PoISAmi+gNQrqWobrQn0SIERuBdexwYyFe89aRqT+D8DBpdEZlEZTVc810UdSsOBqG8uQFSy/32kEQyHdU4er/JHfNpRpflqbRb8ke6uqQmxc+D6UWRTgb2H59J/k6aIO/yXakgCKUdENPPKpvvcLBGmd6gIAIGcFExLOz9waLT0p3ufGAiXHE7ZVqtsiBZfzGyzuIHIOYU47UqoFO8eEjMOy4sQJcxNiKBLHSRExPj3R/ozJ1qTZtkij5yPG8waPr0jiDuxdPrN6cKbxvSP4Jpn5fCUifepfhzOtW2TOMKXmO/6A7bicz0jAso6sRtz46qLmn4mlYrOL7ew2ZldYopqkdRal7m9S/d8yQaPRb4+aDVZWL9HttkywAIELIMsviJNfBww4Z0RXqcKeFG9Vz7zy0DLrEvG6vqOLyxZUlJ5RNjaJ3yAqNzMx9ct8m+uuGqJYdWP86LEMuXbZlM2k2/5dIOnX+BaALG4Gj7UuIDb25q3x/vhq+apdk9HKYUgOi5x4oLH4NBr/f5dyk8yv7nIXTkU5QE37Ii/YDNXxG8vmtEjTDWHA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GQuguOuMEJm4H3WgXpErf7wpDyKvS3xhOrmT1UMJi/ed+Id0b8gTiNxlkNuS?=
 =?us-ascii?Q?Q6LjtvvVfoHeUaqWaB5C74l9akdiJ7bTZHdyUJo7wa5UwxNsEU4p44JcaJBF?=
 =?us-ascii?Q?1RAy1WqK0vim3Ul2u4dXxNdk+s0yEDaGjhpptp4V6umeCchXn0L8dv6hZIyJ?=
 =?us-ascii?Q?QSmHxP4uw+DsJXEizNRx9QqhwjKN5VXogJZ3+8doYJo7tEQonu0nfE6Xj4ev?=
 =?us-ascii?Q?VbsZSO8itmkWdB6KGPVSGwNugKpMa1IK9Qt5QHPujHucrugQVREqjETatKHb?=
 =?us-ascii?Q?H9F6rgb+n8KPb6ZxxPpPoxd+ntJqffs/J4tayXVVheYqRlVUzNzJ5+C7hGYZ?=
 =?us-ascii?Q?pukUTc7+EWfsN7HIzAimjYflv2+zCsoreK0hho6KMgcxrERowgIZxwoAQ0ef?=
 =?us-ascii?Q?+S+B6KMohwfRsEJWCfP51XDcINlv8bP2MVR4kBP2PiVgdJBXf0eh+xGsxHT5?=
 =?us-ascii?Q?JfbLp3OM+cOE8XkHo3jfqvJJA/kHHNLi5Kh5L436nN+2Q3D8eEx+fcGbnjlF?=
 =?us-ascii?Q?P63pwZCOW0lFOwql+gSjGtYg8y7mor3BjNSrKQtKvjku6oJuIWAGDx+ldepG?=
 =?us-ascii?Q?DnREe96UhyYFi7cIPUBpHRcrDtaiTTNUPQkcLmtXy/DO5NpTBoDTJPe/qseI?=
 =?us-ascii?Q?s2WH2D7M01xPwqgfFtuBdHL9dEGKn67sOa0/5w2uBvkou31zjWpIee7jE4EI?=
 =?us-ascii?Q?FdTqxs+pQTs0FC8bFNBgkFivPaExnk5St+qGUCa2IMIpdRgiCxq6ndTqZYFX?=
 =?us-ascii?Q?S2A2T/bM23EqHRZRscuZpe653NG7xo+gvosE2ls0VBdqKvGdp8baCpQAO/pa?=
 =?us-ascii?Q?dXp8pVmbc27C47ptakbdmt5rvEn/Ggd5owQPH9lJpm4spLJcwQcADsCSOEr9?=
 =?us-ascii?Q?GACJfEMQD4LCfbQTIrDLVsUvgxYtOHn+sMMzLCC4s9ZyoerUYY1YcF6UPfb0?=
 =?us-ascii?Q?dIfnEAWJoVaffgAPeinOGkj/sZ/lPyIgqNcEpkjvtYDsyJ7BtjNReHu76UrV?=
 =?us-ascii?Q?sJS8VG1YjHb6e9lwEDViNGyAO6+Q9PlzocEqE+Womh58w+ZXtkL7uFo2/eEb?=
 =?us-ascii?Q?IBpKIp/2Vs4PD6/Vlugwy/JxaCSSzQwI6Hxm2eT/AGQH+xj74td64My6C8CR?=
 =?us-ascii?Q?Itub4pYWWBuqafW+IthBqnJUsuaEanIiAap4FJj6hmzEpqGMn2jy5bzFN3Bd?=
 =?us-ascii?Q?6s10d5KXP8IxPFBr3omJwsCjYiRmGIIbRCRU1mY4VTUxc+sR3TIRyQKrU3hY?=
 =?us-ascii?Q?gu4/X9fQJqZ0I9x+pM05X3wjDV2pRRuT8MjmTLUrftuSDKrqKo5Tag3O9l2/?=
 =?us-ascii?Q?Nfi++7F8AmtZL2Le0AH1LyeyXgpOiTx3eOl6v4Nap2MLAK023UrYBS3vF8LZ?=
 =?us-ascii?Q?t1zuiTLg9Fnqc5HsbKOyHaGUJ4IEySqg+OUQS+CbTGX2NlcC0h2AMvfzKKNt?=
 =?us-ascii?Q?HKwzeZqubCcz0gXQKXhbmv2u+XBaYVp7i/vtpP2/S0xh/BTszM8XJJK5yV1B?=
 =?us-ascii?Q?80XzIGxilk7zQW7U3R5I4UwPCiab1nlapSMUkApSFaDoQvzHMCo3Sdk5PduN?=
 =?us-ascii?Q?jjzMeJT6KEF1D48tHpe2g606IILJ6PiP61qHAqojNLLSINI/htal5U/LMdWw?=
 =?us-ascii?Q?VMaTjh2FAncVSkFT7UIhEeOIwIcPyisXgAE5oOTXbQTmg43z1iF0oQ2+BVT2?=
 =?us-ascii?Q?2u7ntd9ClrzaATvSOaJxyDpWA5ZEL6b/Y08L1/RNOpAnkmZyoTDsluZqZRTs?=
 =?us-ascii?Q?DDPcw4tjub429PYRWEGPZQmj2CwrpVV85zsU0cApp0I1FOF360dhos/0v7KA?=
X-MS-Exchange-AntiSpam-MessageData-1: Tq2Z1AyVu0RRkQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e87ca95-2a92-41f8-6846-08deb927ca53
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:48.3061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dF6s/1ARJpk5y2JIW5ft/jYYRexbBfwaXMJhy3O29qjRoYVRDCUUcaph4U9voYHzcwfM7hqf1y5YYuBXZbuvFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-720697/1779580972-A8979161-3D5BD38E/0/0
X-purgate-type: clean
X-purgate-size: 4915
X-Spamd-Result: default: False [1.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:taka@valinux.co.jp,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: A5D565C0E87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the 'numa-node-id' property to the memory nodes in the Device
Tree passed to DomU. The NUMA node to which each memory node
belongs is determined based on the virtual NUMA configuration
specified in the xl domain configuration file.
---
 tools/libs/light/libxl_arm.c | 81 ++++++++++++++++++++++++++++++++----
 1 file changed, 72 insertions(+), 9 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 7e9f8a1bc3..58a357858d 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -670,25 +670,84 @@ static int make_optee_node(libxl__gc *gc, void *fdt)
 }
 
 static int make_memory_nodes(libxl__gc *gc, void *fdt,
+                             const libxl_domain_build_info *b_info,
                              const struct xc_dom_image *dom)
 {
     int res, i;
     const char *name;
     const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
+
+    int cur_bank = 0;
+    uint64_t cur_addr = bankbase[cur_bank];
+    uint64_t bank_remaining = banksize[cur_bank];
+
+    if (b_info->num_vnuma_nodes == 0) {
+        for (i = 0; i < GUEST_RAM_BANKS; i++) {
+            name = GCSPRINTF("memory@%"PRIx64, bankbase[i]);
+
+            LOG(DEBUG, "Creating placeholder node /%s", name);
+
+            res = fdt_begin_node(fdt, name);
+            if (res) return res;
+
+            res = fdt_property_string(fdt, "device_type", "memory");
+            if (res) return res;
+
+            res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                                1, 0, 0);
+            if (res) return res;
+
+            res = fdt_end_node(fdt);
+            if (res) return res;
+        }
+
+        return 0;
+    }
 
-    for (i = 0; i < GUEST_RAM_BANKS; i++) {
-        name = GCSPRINTF("memory@%"PRIx64, bankbase[i]);
+    for (i = 0; i < b_info->num_vnuma_nodes; i++) {
+        uint64_t vnode_rem = (uint64_t)b_info->vnuma_nodes[i].memkb << 10;
+        uint64_t regs[GUEST_RAM_BANKS * 2];
+        int reg_count = 0;
+        uint64_t vnode_start_addr = ~0ULL;
+        uint64_t chunk;
+
+        while (vnode_rem > 0) {
+            if (bank_remaining == 0) {
+                if (cur_bank < GUEST_RAM_BANKS - 1) {
+                    cur_bank++;
+                    cur_addr = bankbase[cur_bank];
+                    bank_remaining = banksize[cur_bank];
+                } else {
+                    LOG(ERROR, "Virtual node %d: Not enough RAM banks", i);
+                    return ERROR_INVAL;
+                }
+            }
+
+            if (vnode_start_addr == ~0ULL) vnode_start_addr = cur_addr;
 
-        LOG(DEBUG, "Creating placeholder node /%s", name);
+            chunk = (vnode_rem < bank_remaining) ? vnode_rem : bank_remaining;
+
+            regs[reg_count * 2] = cpu_to_fdt64(cur_addr);
+            regs[reg_count * 2 + 1] = cpu_to_fdt64(chunk);
+            reg_count++;
+
+            vnode_rem -= chunk;
+            cur_addr += chunk;
+            bank_remaining -= chunk;
+        }
 
+        name = GCSPRINTF("memory@%"PRIx64, vnode_start_addr);
         res = fdt_begin_node(fdt, name);
         if (res) return res;
 
         res = fdt_property_string(fdt, "device_type", "memory");
         if (res) return res;
 
-        res = fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                                1, 0, 0);
+        res = fdt_property(fdt, "reg", regs, sizeof(uint64_t) * 2 * reg_count);
+        if (res) return res;
+
+        res = fdt_property_u32(fdt, "numa-node-id", i);
         if (res) return res;
 
         res = fdt_end_node(fdt);
@@ -1365,7 +1424,7 @@ next_resize:
         FDT( make_cpus_node(gc, fdt, info->max_vcpus, ainfo) );
         FDT( make_psci_node(gc, fdt) );
 
-        FDT( make_memory_nodes(gc, fdt, dom) );
+        FDT( make_memory_nodes(gc, fdt, info, dom) );
 
         switch (info->arch_arm.gic_version) {
         case LIBXL_GIC_VERSION_V2:
@@ -1716,10 +1775,14 @@ int libxl__arch_domain_finalise_hw_description(libxl__gc *gc,
     if (res)
         return res;
 
-    for (i = 0; i < GUEST_RAM_BANKS; i++) {
-        const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
+    if (d_config->b_info.num_vnuma_nodes == 0) {
+        for (i = 0; i < GUEST_RAM_BANKS; i++) {
+            const uint64_t size = (uint64_t)dom->rambank_size[i] << XC_PAGE_SHIFT;
 
-        finalise_one_node(gc, fdt, "/memory", bankbase[i], size);
+            finalise_one_node(gc, fdt, "/memory", bankbase[i], size);
+        }
+    } else {
+        LOG(DEBUG, "vNUMA enabled: skipping memory node finalisation as nodes are already populated");
     }
 
     if (dom->acpi_modules[0].data) {
-- 
2.43.0


