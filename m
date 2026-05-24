Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAw0Jz5AEmo7xAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE795C0E85
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318202.1586633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJ0-0005P8-G7; Sun, 24 May 2026 00:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318202.1586633; Sun, 24 May 2026 00:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJ0-0005JN-BU; Sun, 24 May 2026 00:02:58 +0000
Received: by outflank-mailman (input) for mailman id 1318202;
 Sun, 24 May 2026 00:02:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwIy-00056P-Vi
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:02:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwIy-005yCJ-CB
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:02:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124027-e002-0a2a0a5209dd-0a2a45028cbc-10
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:56 +0200
Received: from [52.101.125.123]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12402e-af86-0a2a45020019-34657d7bfa90-3
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:02:56 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:02:53 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:02:52 +0000
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
 b=fIlEJq03wx5ft4hA/+UL5FvA4TmFRUw7qrztsKK4Xgf301nUaU/marw1kY3P1FezCAMMVXd+kAuYJTHubNul41KDFxs/vnQzzgHJtJJt4nv69dbV+L4AD5bEiBvBP1TkNCsWlFjx36OlFBGcyI57FVFR32whHVO622Zvje5OHGu1vC3/4MjIl114/HnzUJXnN/+Fd8HmkCTLMwC/s0pxunq1TiAbiSYQ6keN7a2hvIv+fDC+Rrx++3KBxeckidiupwfyghpw6mLUH16HX4LFot2uGWuqDONW+00zNfKfo+ngOCJI+lB1rJ4feHNZ+QmUOUy6MHHxTYVG+dsLcLSZkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S12V8T/HbwUmUQrI5N20DCLbZwR54rjOcdi8RLCVn58=;
 b=DEB0YtRfWHO45kRwzwFa+xLImZeBmpuADRs+/JNzjp131yfGOlDO0iy0AD06b+Sp28X3ZHAEHQcfIYtmZ9XqJHkqnh4LTCPjNJv7X0d95XON66KCMdznweuzspgylBkj84mAtN6uotsbwxL5kwySG4v55/dUKwyHGJD032rloC5AQZmFKeOWGs8yoOSzHQUqwTc2nRF4WVJx+GfBYQkJuCXLOccOKzfXBryLuoEuQtZXmxCfbTSiDpIYx1A0Djrr+h5B0V/hDHWB3pzNbW9S68SepjCtSO08+gYCmATHbp07GWTWBTELavOJ9AOtd47nu+suNJwL0tSde9MRaNFZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S12V8T/HbwUmUQrI5N20DCLbZwR54rjOcdi8RLCVn58=;
 b=l1C5PacpQCbHE0yewBYtpP+uZBHQ+YMUkRPSUq+tWRr6aBBFsom/3TYgCUp05W/R6k/aK869NCDjyh0L+aocI1p6oBXeK+dMrlUJ27+nYgi4rH/NHh2KNXkRJDscet/yhGvusQGI7N7qfQwMNy3NAVRQnKuIDewYwjSQW8IkBr4=
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
Subject: [PATCH 12/21] tools/libxl: Create 'distance-map' node in DomU Device Tree
Date: Sun, 24 May 2026 09:02:00 +0900
Message-ID: <20260524000209.292370-13-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260524000209.292370-1-taka@valinux.co.jp>
References: <20260524000209.292370-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0060.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::10) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: a839b730-720b-4718-d795-08deb927cd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Le2gST7E2xqO3wwJ3PFJvNeLga8wpsoeFlKxahHpaWcXMlK9zwVRRUesxEGq1Uou9Auzppc/DRWyihkZ8zcYewLtuj7QSfgly0aHH9SF2bPOshinHBPtixr5zdA4YFZ88vKyLRlUQScXqylRM2z2TRb8x7pXcTL80zfLytO9tTZU9jiwZqKz0S1S82D3Gryfm/S+9ZRcxqDGwDgAKaX9eTixB3LwcPhx4WZwO34+zPQZUhGJR9mESTAvBC2GkkgFSE/pmOeaF4NwVqenQavuROA8UkhH25KqUo2yeGS511mRAOvHkpZk+Ks3INQ/fX06YmzDhMbOsL2c5w/mkY6Tlh4putweBqoORhCG1dZIQvtu9nc3umhiQu8G6EqZ7zNXBDt4T4D8kLmm4k8aRUv0CYvhzj68/xhKsjIEjHqc2mjtw9uIv9XERUs1tEdyyqQSR177sDoh5db0T+QDn/9PvGccWxJaq1jWAjWGqaDtVt4raFRe8eRQpoDAjJ4qsuve202GhwM0ui9TkSNsM3fgN8T2/TAwqR5ftCz03ExMAxO5vEOmi7wij+zJeKHNiwhFI2XG98wOC/c4WReG8NSVNPqUNXAdtKXhRUtxgAG0cgmUH7bkd9p+/w8F6RabGNN4zRBH6unMhf7at0vbb3q+9KQWJeDbbXYQ8V1MxfVjMmyaWVrQntWHY4GdIk7ejtKO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5HTjAiZZAbME0INQwnYl6nzH9Jf+cu/e/tIffb09gEE/yz/pJa/+OGXR+0Kd?=
 =?us-ascii?Q?PfqcQo9O765lPRE92GzNEtX7bJ7geHPdB1XZ9z3xAUziHSyCqSqoW32IHs4x?=
 =?us-ascii?Q?PtjvnhJeJcHq66k1EdARee9KK/BTWGq1U0wPXXK4eIPHVMUWio2/hZZSMfIG?=
 =?us-ascii?Q?8+MeyfKArGfRhPKSA5jTo8XSdCxTGcyLchW5+BDTL1uWJJLbLJQDt5S0I5pQ?=
 =?us-ascii?Q?E5Fv/iUIE80euBmx4nAbnw3AY0zGWddZ61PXr/Ox7p2mhMNBwHumuWeN9W5r?=
 =?us-ascii?Q?s3WRbgI9O4vcje2CFaLvMdMVuhytnKEySiztJoq7ANj6RX066FY16jaDNOcR?=
 =?us-ascii?Q?oLCSxIGMUIfU4+OSasduPAqSFPaRKH2TzJX6GfngWLjkbjx8zOoz5VwOLhpn?=
 =?us-ascii?Q?eCmTeqKHRkrNnNcLe/dMc4hN+2Q6eyoVlY8m8TGTuDrddLuCzTWh+FQbdKaH?=
 =?us-ascii?Q?Bv00kijAdt/UdGu7a+h91HSlgaEgDmpsMIMlN1M65VKGjkqO06wAmmj1H2tE?=
 =?us-ascii?Q?bjV/wuGvyidNOQx+ht0u6fQEnpgnZOPeIQSPsbg2m0Y+4ZGYWTsD2cPwgcGP?=
 =?us-ascii?Q?AeTRRceS3A3iYn2Hni5poDfqy/gE9oDeor5comk5qvGuQCaZ2tUv72KInMbJ?=
 =?us-ascii?Q?01+TN5xtRUeMdOgjaDEWZf523xqXg2D8HqDpzMwfwFBhIw38VqVldKcM/pPh?=
 =?us-ascii?Q?UHCGUSiqm9duxKwnBdKM8BqP3a6/bH8JKSmaeBIyz4d2HBO45Dut+6q4o0oK?=
 =?us-ascii?Q?1zmafzYOsgDkSy/8eeuBTk6K7C7YV4JjAMUCl3/2BK2zZaZJLSZVk+ei4eQL?=
 =?us-ascii?Q?n46V1dZURsSL1mG+xmLhyOU0ydwD+5gQ/8+nsxsfVg8DSVGRQF0r5cHYs0VW?=
 =?us-ascii?Q?+rtl6636lOV7TVqCAJ8cwE1e9Qg4neI76CB8irOt/jBkYmzoXXlIUzNvgC85?=
 =?us-ascii?Q?QKgRAfk33RpJo1h1+Uqv45QaFbRVwaKwe8iZFukMgjQnswQEiD5Ylplgzr+R?=
 =?us-ascii?Q?iWPJOoj4roPmI/ykv0nKmGyOWepUWFLfg/5CkLQac/4FxwAkmI264p3ny+5N?=
 =?us-ascii?Q?K/NSzLNelKzEUVWWL0WgGsTAtpVWTyjKzfjLV1tfVpxyTuko1tbezzSc9uHD?=
 =?us-ascii?Q?xC84GaEq0S2Tq9z74KUpoIqd4NCjSoq/zaln0jmt9rLFt4aLYhZyvc8Ztn7Z?=
 =?us-ascii?Q?XC1mIRbAfVr4CJpcKP11h/hZrnGx0uhUNSQd2n6CTrzTKqMut0Tyhn62a/Wo?=
 =?us-ascii?Q?5dLak5rk739oEgsVhyVW09xQVe3Hjzgsrz9Y8eQ2p2s4NQbNZFe3AOJMjuIU?=
 =?us-ascii?Q?XyZZR8cm/s3sV5PMbGaxvAih8wUMTNLXbIwoGtY1pNCBw06o8CYqJiKt0J8v?=
 =?us-ascii?Q?ZjbMYV3UVgcs6Uy6zBn/cnJQQvy2P7JGn9xn0JzHW2zpJ+f14ElUtA1G6E5b?=
 =?us-ascii?Q?DzACuT3diHRVcPUqdSTy8HrjjlZ8XaO1BxWtDJ8zOxtSJi20C23ngm7Bf40g?=
 =?us-ascii?Q?B4SDEsK8ed4ohyoCfqf7U/m7Z5dc4fxeI0E+H5C0cBqpnlnomYhBYjTN0c4J?=
 =?us-ascii?Q?Ap3pLq29W09/NQfwhR/pUcNExQff2OGfpLsVWdOZT8u7tTcW28cSY10C73fN?=
 =?us-ascii?Q?3hqmOfdaywRl4iLQ0rx28FvUDpzgeRpx27g/4ipRyBLPGaF3hdTRRFYjTcTG?=
 =?us-ascii?Q?AZuSze+CGhowjvC3iI2DFOkStoYz9kcavuz6Awt0LgQ0N8/UefGDi7puGbfG?=
 =?us-ascii?Q?BLvIiDgdColELpkbNq31eFxyF1vzQzyEKZCrMrZ4SUO+F+TWimAE1cYfv7ns?=
X-MS-Exchange-AntiSpam-MessageData-1: hscI3uAxKpn4Jw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: a839b730-720b-4718-d795-08deb927cd12
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:02:52.9534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YalzWQzUlClEeT834tvGnqOUMRJL5bsee5/Nidgj2L+erxPAgNE9DDmEQCqIup99hWybMoLkJv2DgRU2bo++9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-720697/1779580976-8057B161-D4818345/0/0
X-purgate-type: clean
X-purgate-size: 2062
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
X-Rspamd-Queue-Id: 9AE795C0E85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Create the 'distance-map' node in the Device Tree passed to DomU.
This information is retrieved from the virtual NUMA configuration
in the xl domain configuration file.
---
 tools/libs/light/libxl_arm.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 05d0f18e1a..d2b505fd43 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -769,6 +769,39 @@ static int make_memory_nodes(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+static int make_numa_distance_map(libxl__gc *gc, void *fdt,
+                                  const libxl_domain_build_info *b_info)
+{
+    int i, j;
+    uint32_t *matrix;
+    int nr_nodes = b_info->num_vnuma_nodes;
+    int idx = 0;
+    int res;
+
+    if (nr_nodes == 0) return 0;
+
+    res = fdt_begin_node(fdt, "distance-map");
+    if (res) return res;
+
+    res = fdt_property_string(fdt, "compatible", "numa-distance-map-v1");
+    if (res) return res;
+
+    matrix = libxl__malloc(gc, sizeof(uint32_t) * nr_nodes * nr_nodes * 3);
+
+    for (i = 0; i < nr_nodes; i++) {
+        for (j = 0; j < nr_nodes; j++) {
+            matrix[idx++] = cpu_to_fdt32(i);
+            matrix[idx++] = cpu_to_fdt32(j);
+            matrix[idx++] = cpu_to_fdt32(b_info->vnuma_nodes[i].distances[j]);
+        }
+    }
+
+    res = fdt_property(fdt, "distance-matrix", matrix, sizeof(uint32_t) * idx);
+    if (res) return res;
+
+    return fdt_end_node(fdt);
+}
+
 static int make_gicv2_node(libxl__gc *gc, void *fdt,
                            uint64_t gicd_base, uint64_t gicd_size,
                            uint64_t gicc_base, uint64_t gicc_size)
@@ -1438,6 +1471,8 @@ next_resize:
 
         FDT( make_memory_nodes(gc, fdt, info, dom) );
 
+        FDT( make_numa_distance_map(gc, fdt, info) );
+
         switch (info->arch_arm.gic_version) {
         case LIBXL_GIC_VERSION_V2:
             FDT( make_gicv2_node(gc, fdt,
-- 
2.43.0


