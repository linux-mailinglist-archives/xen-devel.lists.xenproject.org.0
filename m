Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCUmF0BAEmpKxAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD555C0EC3
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318180.1586560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIh-0002Yg-FC; Sun, 24 May 2026 00:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318180.1586560; Sun, 24 May 2026 00:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwIh-0002W8-9q; Sun, 24 May 2026 00:02:39 +0000
Received: by outflank-mailman (input) for mailman id 1318180;
 Sun, 24 May 2026 00:02:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIg-0002Sn-1d
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIf-005yCJ-E1
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:37 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a123fb2-e002-0a2a0a5209dd-0a2a4502816c-38
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:37 +0200
Received: from [52.101.125.80]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124018-af86-0a2a45020019-34657d50d7f2-4
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:37 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:33 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:33 +0000
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
 b=mefU6PraNR7PEz8+XUZO1X7VadVogLNBRy9swjuCETpWD0h3CcEbyKrp+yUH85hhm5ZKUbA9CzkwnELYl7rPn5cKfZu2bHFPdbFJ9OFSxl7ha1YNlmYXHTjk961HJVE2RSePQ62JsznrRbEQr3d6mZNH1+Vi0GNbbmHa1bzR8HxHRfWINwteyURoEeMSD+6bzWojQD5ScqWIVHlOmOdv/mEgV+WG2ZtqXbH48m0QsForbInjMnhp5jIj5CPhAQpsGNfV8hhBYUmpYmdnEtu/xDN+/FriE8OgebYjjBGQajwACwSO7CLcBLeLaYceX8vwlvTgmRawQXIBoPlFEN54+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVIHzGP7xPG+QeB7F8sNCSVrdxqJXbQqFgu/3yZPit0=;
 b=e+mcNfU2BzWjwNhQe+1c8ivVxFCumRJswBO+4qcszFfzM5RpstpCFycIwYqBfDkRpV1U4bcodtlqWzxsAxwSdxuyaW7AFIzzGHC3ffpiDvDvltISytN9Z9ZPDtX/l/sF+DCjirE2guXANSToFItymmeKjguEQ2uyGW1ODrxVxHrh9ELsiLQK1YL1FlZVHt/O+67z5MKEn2yZi3aYzH7SSGCyR7Z9KkufHgsin/QbSP+FQPcs8k/ekp+Nw9Xjo2lnZ6N636dpPAn04Z2iBktGiO+5zeiqg+YemOkuCm5ca0s2kfUkU0GVbwO3iMR+bmvcIst8r4TjUx/h0RdqiROG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVIHzGP7xPG+QeB7F8sNCSVrdxqJXbQqFgu/3yZPit0=;
 b=uUCFMeZ6s0Tztnt425HoYusX0mARTsM8x+ho0Jei8n4Zydxv1C3fUca3MwuCgOKG1O2u34vvl5T43fSlUsAJJyKxEi883K7qgBhVIM1RiQL2NbqXAGzwbdZElmZ2KweQdNHIDG1sBI+WgAHiOaG9FVMwoNO+nIDJ0eAmD7w1/P4=
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
Subject: [PATCH 04/21] xen/arm: Configure NUMA affinity for populated memory banks
Date: Sun, 24 May 2026 09:01:52 +0900
Message-ID: <20260524000209.292370-5-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 93085a46-e6ce-491a-b2fc-08deb927c191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1NTHi9kcwwryqCBSper2HnSXkdNuqsOu0+eBBM6pTDvSLZRND/ixN8FztL1vCR7988Ampf2lWXzwoZZhwn/T4BxfQnQzCzfWVqEh9tS5bQBMseaCprqGLDtpPH9HqOdSwgUA/jgnwzg5bX1j8A/OPIo5v2KK0sHRwf/c3OmeeoQK4+2u+rxD05KlVPa8pl0qoNr9C9YCw7PbaAueT4USIg14Yym5Elo10LN9od75yC5RDVb+lwzKfdMiEu5I0uJxvLyuz+l1LZKZ4CPbqwlqJmSPkHADUeJPZr0D0/YOJp8R1DopG7ac/Wr8LKipNOWIcmzS/I62keviFbLgc7CHAQxLB+vS93SmrRm7lGa5pHbdyyjAevCjJQJdH7SWsll2/zIG6pec9ryQPJ+L7Ua2dxIEqI1i6iIRO7A7sKJs4tUPDg5UpG+q+tFdeBVVRmu5QgXvynOQ6ZlXGs48n0P3BRNv9rTp7CadSB0nuC9Sow7UpR6h4F2zJ6/yrVEnhEKRlK/HsXnpCSuMA+QkZTjx7I0ajPplS7Eri3QzBrgpLeOrhHw91x5DQORLtaDMNY69iIGr4AoEnmV2wnKwpaDPmsXrSxSuxFaLWtXgrPcKMG2gblY+3Pk9Hcp2CUrVOQO7Tim5TTZ4tCdUEHGRo5wH89CJxV/VZSY1IbYnAHgvuZ5Lj4MCY3kfOPfyPSF425EX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XECKhY1rSWj2c0XCKAUrMpJ6BwxDNm/mGbmT3EqLf+IUoykStYHgzBKPkT3q?=
 =?us-ascii?Q?+yqFc4pyZN2Mk28Z/Bu6bBT2Yv5AsAoUbmcUyhPb9jDrjOPL0/m0wy6yUp26?=
 =?us-ascii?Q?yF6V0VB5ll7bjYMY1OSlEc9u3HvmXd/9X4AKIMXAL07sDIXpBKxRiFvwJRIE?=
 =?us-ascii?Q?CUlpSnprIfh8SUPI1YJl8dko7eZUPUFTy3XOVtMjoCgNvZ5tw+2lerKwT1RJ?=
 =?us-ascii?Q?zjuhh0bECS26fZSGV5v7ZArUYZOV/S2Lsvaz+/KVNhWEiKvbvCD5OnoTUIey?=
 =?us-ascii?Q?MqbHLYqSKfSH1DdKoMeT6WxtZ9WX3Z508ZrFna37ivtqJMU+miBJHbmHiScO?=
 =?us-ascii?Q?p/Lj/UxjpDLDYotUqUMVhN9VVscODHVXDyJV6V6A0P89NzcTuOPDQBH1lQ+8?=
 =?us-ascii?Q?6F2cMSGYxXrNU6tpy2xA8jMUCgguMn3Hu3pzaByu/DMxKY2pRPiGXxO4rAl3?=
 =?us-ascii?Q?t+T9tnVVzrntI/3mNN7HPQBDIuut8korPxDkIPCvXb82eI+kt/fp4SFQn++n?=
 =?us-ascii?Q?DAlkUvJz5m4+XirjUF6k+HXxyxj0I3uaNc5IunjK/ZvT/04NvGge7XaG+Rg6?=
 =?us-ascii?Q?V3JfD8WDaUSre6qHaC6ugdT616KU3pg/vJgqB1ZjCeMD8F3769rDL9mitYFv?=
 =?us-ascii?Q?mM6Q/zDp6FDJm1r0BD9snyouD88SJYYE0ZETUJG4UiDKx+3pdNOE6C1kuLR/?=
 =?us-ascii?Q?XZThINv+OHZ3QuJHMdJRe6QRVBTuqri7V2pbG8TWKffDzM0lbfDEEQ/yhhwQ?=
 =?us-ascii?Q?PXYEXcDsskN6W8CUSJJ7lD83HVLycFulOEKjP6r/nlIqF/hta+nRb1Byma0+?=
 =?us-ascii?Q?QpYLhCxJjEr6ogO/RhuJSh/QYtNwSQ7gF9BiAjlNaszN62Df/IrRxhwex9rb?=
 =?us-ascii?Q?/sqGsPzvsVzcDLOX+bG/f1vBAPwgVjRLm2i83ZFSzZzn2uYC/bSJWxboidx7?=
 =?us-ascii?Q?3csiNYhmY0ni2gfEoqSzc9Svu/7wz5dmVXAlTOuJFaV/PkwdiCaYYUfKChll?=
 =?us-ascii?Q?FdM++juOkhRAVI3Kq6ziI+KIBD7xuNLnNVc8iKHrgo5s8JmdrOqSUyARxHHd?=
 =?us-ascii?Q?va0bJR71xdCEJGOcUtGKFp9hzaffMy23Mww4hTNIcQvwr+4woxPsyPMs/K7v?=
 =?us-ascii?Q?/CPOMcQHfte89Z4yl68oTkhAaJaqcv9BT5Q3f7S8AS8GMXHyrIQT0gvyklCT?=
 =?us-ascii?Q?X3CsHIZEuWWZT7uoX+xFslR+QiUvKWjYlJz2eTZPo+NlADpf1S27U9m5zsia?=
 =?us-ascii?Q?Obfx30CuVrifSD7yFHCPDbBy9Ht88eCiKpYDXkAJF8zsFuQ65WvaUmjSzI2R?=
 =?us-ascii?Q?+10jts3oJ8eCLgCi2GkdfZ/EGrj27FCkS6Pdf9pnnCuuGNQkiWT+bgl6Eejw?=
 =?us-ascii?Q?LnRsrFRkvkqSHQaTVSlL166nCNLipn3snBs2UyzWia2ne1WLe1Cl4Z9iMMod?=
 =?us-ascii?Q?sASSt4uKLGN0hsz23Mc5oEYjVAiO3kGG0kmVxdQbksfE4KVe8rZ2d+StS8O1?=
 =?us-ascii?Q?SVFp079eK1f5dOn0yYBhH4idEVGa5dMO5sltWWxxN+B6BVfhgqe6IvhRpTzX?=
 =?us-ascii?Q?C2gPhgX6FOEFwoIogsd3q0i+qBZBod4GDd1xucVK/WBr0wVuAq+UaihTfxQU?=
 =?us-ascii?Q?MgJ0WdWLXz9bR94E81JATbRyXMcCSayayikBZctPkrgHtRKPuCqT2ziFd/aT?=
 =?us-ascii?Q?vYOKBnNlhwjEuinDEl7ArZoSITeFKkgtyivzSIwJ6giCzmxpppUjQmHTlLMe?=
 =?us-ascii?Q?WAJ1gtqNQPezFUJAikbTukgd+taCvr1iUvD7cWH2Tj1WTqsscH2fhoPL2vZz?=
X-MS-Exchange-AntiSpam-MessageData-1: 8BZSR9vUGrSIjA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 93085a46-e6ce-491a-b2fc-08deb927c191
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:33.6397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqCf37imG9GErcyKDXFmJbjs6gvZ9FFm7KWEcRdYST2jd3LGyoIu5zh8jY01S9lzI16+NNGwVlg1baK3pVtAcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-720697/1779580957-A8B78161-D1620810/0/0
X-purgate-type: clean
X-purgate-size: 6123
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
X-Rspamd-Queue-Id: EBD555C0EC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Configure NUMA affinity for the populated memory banks. The NUMA
node ID for each memory bank is retrieved from the Device Tree.
---
 xen/arch/arm/include/asm/numa.h       |  1 +
 xen/arch/arm/numa.c                   |  7 +++++++
 xen/arch/arm/setup.c                  |  2 +-
 xen/common/device-tree/bootinfo-fdt.c |  8 ++++++++
 xen/common/device-tree/numa.c         | 29 +++++++++++++++++++++++++++
 xen/include/xen/bootinfo.h            | 23 +++++++++++++++++++++
 xen/include/xen/dt-numa.h             |  1 +
 7 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index a1fa54f2e7..6f1ccb4eb3 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -12,6 +12,7 @@ typedef u8 nodeid_t;
 extern bool numa_disabled(void);
 extern unsigned int numa_node_to_arch_nid(nodeid_t n);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
+extern void numa_memory_affinity_init(void);
 
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 080d7892ae..15cad3d267 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -36,6 +36,13 @@ int __init arch_numa_setup(const char *opt)
     return 0;
 }
 
+void __init numa_memory_affinity_init(void)
+{
+    dt_numa_memory_affinity_init();
+
+    numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+}
+
 int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
 {
     return bootinfo_get_ram_range(idx, start, end);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c0202d9ff6..cdabf536b0 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -352,7 +352,7 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
     acpi_boot_table_init();
 
 #ifdef CONFIG_NUMA
-    numa_initmem_init(0x0UL, 0x1UL << (PADDR_BITS - 12));
+    numa_memory_affinity_init();
 #endif /* CONFIG_NUMA */
 
     end_boot_allocator();
diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
index 272b5a6c0a..2d0e809231 100644
--- a/xen/common/device-tree/bootinfo-fdt.c
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -121,6 +121,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     const __be32 *cell;
     u32 reg_cells = address_cells + size_cells;
     paddr_t start, size;
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    uint32_t nid;
+#endif /* CONFIG_DEVICE_TREE_NUMA */
 
     if ( !device_tree_node_is_available(fdt, node) )
         return 0;
@@ -136,6 +139,10 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     if ( !prop )
         return -ENOENT;
 
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", 0U);
+#endif /* CONFIG_DEVICE_TREE_NUMA */
+
     cell = (const __be32 *)prop->data;
     banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
 
@@ -158,6 +165,7 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
         mem->bank[mem->nr_banks].start = start;
         mem->bank[mem->nr_banks].size = size;
         mem->bank[mem->nr_banks].type = type;
+        set_numa_nodeid(&mem->bank[mem->nr_banks], nid);
         mem->nr_banks++;
     }
 
diff --git a/xen/common/device-tree/numa.c b/xen/common/device-tree/numa.c
index 06f2c8b102..539ddfccc5 100644
--- a/xen/common/device-tree/numa.c
+++ b/xen/common/device-tree/numa.c
@@ -22,3 +22,32 @@ u8 dt_node_distance(u8 a, u8 b)
     return LOCAL_DISTANCE;
 }
 
+/*
+ * Initialize memory affinity by registering bootinfo memory banks into Xen's
+ * NUMA subsystem.
+ */
+void __init dt_numa_memory_affinity_init(void)
+{
+    const struct membanks *mem = bootinfo_get_mem();
+    unsigned int bank;
+    nodeid_t nid;
+
+    numa_fw_nid_name = "DT";
+
+    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
+    {
+        nid = get_numa_nodeid(&mem->bank[bank]);
+
+        if (numa_memblks_available())
+        {
+            numa_update_node_memblks(nid, nid, mem->bank[bank].start, mem->bank[bank].size, false);
+        }
+        else
+        {
+            dprintk(XENLOG_WARNING,
+                "Too many numa entries, try bigger NR_NODE_MEMBLKS!\n");
+            numa_fw_bad();
+            break;
+        }
+    }
+}
diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
index 7923be2b38..d01a28b359 100644
--- a/xen/include/xen/bootinfo.h
+++ b/xen/include/xen/bootinfo.h
@@ -7,6 +7,7 @@
 #include <xen/macros.h>
 #include <xen/xmalloc.h>
 #include <xen/errno.h>
+#include <xen/numa.h>
 
 #define NR_MEM_BANKS 256
 #define NR_SHMEM_BANKS 32
@@ -56,6 +57,9 @@ struct shmem_membank_extra {
 struct membank {
     paddr_t start;
     paddr_t size;
+#ifdef CONFIG_DEVICE_TREE_NUMA
+    uint32_t numa_id;
+#endif /* CONFIG_DEVICE_TREE_NUMA */
     union {
         enum membank_type type;
 #ifdef CONFIG_STATIC_SHM
@@ -228,4 +232,23 @@ static inline int bootinfo_get_ram_range(unsigned int idx, paddr_t *start, paddr
     return 0;
 }
 
+#ifdef CONFIG_DEVICE_TREE_NUMA
+static inline uint32_t get_numa_nodeid(const struct membank *bank)
+{
+    if ( numa_disabled() ) return 0U;
+
+    return bank->numa_id;
+}
+
+static inline void set_numa_nodeid(struct membank *bank, uint32_t nid)
+{
+    if ( numa_disabled() ) nid = 0U;
+
+    bank->numa_id = nid;
+}
+#else /* CONFIG_DEVICE_TREE_NUMA */
+#define get_numa_nodeid(bank) (0)
+#define set_numa_nodeid(bank, nid) {}
+#endif /* CONFIG_DEVICE_TREE_NUMA */
+
 #endif /* XEN_BOOTINFO_H */
diff --git a/xen/include/xen/dt-numa.h b/xen/include/xen/dt-numa.h
index 721e8955fa..c6939d0928 100644
--- a/xen/include/xen/dt-numa.h
+++ b/xen/include/xen/dt-numa.h
@@ -14,6 +14,7 @@ static inline unsigned int numa_node_to_dt_nid(u32 n)
 #ifdef CONFIG_DEVICE_TREE_NUMA
 
 u8 dt_node_distance(u8 a, u8 b);
+void dt_numa_memory_affinity_init(void);
 
 #endif /* CONFIG_DEVICE_TREE_NUMA */
 
-- 
2.43.0


