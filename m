Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CvoGdm6HGqVRwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C71F6182C6
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323480.1589264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxR-0008Sk-4C; Sun, 31 May 2026 22:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323480.1589264; Sun, 31 May 2026 22:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxQ-0008NE-Kw; Sun, 31 May 2026 22:48:36 +0000
Received: by outflank-mailman (input) for mailman id 1323480;
 Sun, 31 May 2026 22:48:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxN-0007hS-Nk
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxN-00BFyL-4B
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:33 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba9e-5cb7-0a2a0a5109dd-0a2a4508c056-28
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:33 +0200
Received: from [52.101.228.92]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbabb-63b5-0a2a45080019-3465e45c1533-6
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:32 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:29 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:29 +0000
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
 b=LH645p5Tyh9SuZcgihSaeZL/hM9dbpGypGgpOJuwyo93Lq5E+D2vTH3arZiwhGnUSyzW88MVWaRAmHyYeFnbbsCQPysZFQaoCiqOme1TEQIYDnNsNfaWfjU47iUvEtg+2qPc51BXQxNher1UM2qUAzgLnBouuwksJfNwyBmTbM1cJOY6xn4pQrueoCA9oyH5g+1AYIioo29eZbUt2BoHYYzm3h3zx3KlcOMPoEl3bqzsXBHL/eHIozRFK5SX4QTda0RiK+k4CktZMSjyTZ0Ovu0HNmyRApDbj/a0lknYKkvXNfbGF4GdcMC1Qwdup2qs/oAFyKrfWwFO84oHgZ5Lig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vjE+i4Pyy0yY3FTsKfqjfjpLb47e4a4LegkVylR5Ng=;
 b=zA5o2bPkcmTKsU9gkrdgUO3ALTwvk/L0G2gxYBtoBXKqZP1kXhigfTtnDnsuqPFswmHdmwtL8waDOaLnwnY6FA6CAYu1WCHVCb8FVpbkFsnwMBdB3/+6toTFBQc2Ym4cTHFo/f1FYFU85eWYOk7mrV1OmvtZuyAH9/SP1dPVPEGUylIf3Bk06myAOgxzEQpcWx0xyq38bEpSAaqzmJFOLJPVHP9fatskfq0TcKFRi2M6um4x+fnhpN/l03Lt6Tm8CCGey/kWIRGs69pvq7hE0OWpn6gOO8fMQR0x3v9E+KZHH3Jb8Ee/yF6bxrb2uauW2FVAye/k+dHP5ixK8tqqiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vjE+i4Pyy0yY3FTsKfqjfjpLb47e4a4LegkVylR5Ng=;
 b=YjFPGhv23AhC6UmxObqW8Eq1zFOdjYT2HVPbC/Wg+i1JwlOsxxPWgzSgh/b1SP5O3H4syN8U+DhPqXh/VmrypjEfwgPgu29QkiZ+CKlYBTi+90kRkBeQ//sQJxMxnv4gAI67DWO8VUpKFF4B0MtktUbWD0BTw6MeguQ2EzSI45I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 15/24] tools/libxl: Create 'distance-map' node in DomU Device Tree
Date: Mon,  1 Jun 2026 07:47:45 +0900
Message-ID: <20260531224755.9481-16-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: 299f53b1-bda7-413b-d05f-08debf66bbe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	auvvSF/S1nxpM/lcQtTLg1WvEmxBOjloLQKTjTAgz/nuTzODcHXs7Ltbb4XpDa99AgGs4shKTls3xEkySZ868eVaW0ETiUu/IoNpCW2ygmzBe9d4opKRPDfEoZXq0RXYVk/lofxtcfKsyukPnFo2zL2R2YnbkkoI2JR08psxImHGMIuaEOXE6uvcjDSSDnolWDu9R8YCmlT0VC16ai1+NcA96UdXRvCiRK4I1oRFETeQ9vifo136uQGa7jyeIPNbdPJEZMluA23vxjP8sTNTksPh+VrwDXwbqIgXFxVbRGjUor59OQD087xuyceLmJlj7UWcm2d+Sd5Pui68hd1mvJAFks8RdOxBBh+nOfkI9LT1mO0f4sZV7zulnWv4BE3Bwhae2/76MjHPswvjweY7GRwj5I21dXAkLaICi3cjeXF3Rj7+XSoV1/VzSb87pzmrFB4CV1r02gq4XvoWlV5PVmXarW0wIdK5+kzThOeETFMpixB/nRPSigvZrf4NnHeNqggjbNuOs5ep/uFoimB2Z4V0Nf84sQNvxHKo99K0KSX/a9ntdtYYQaj2gdjnv1NQgnY0jRz5E6nf+cGHmiA5sRUrivJZ6XOwFIsKfHFssxFUlx7IjLhzSuilywMy2Z8ZZky5k2HDWOAuOtr+BzFMSAjDPZpsVQhxlpY5d8+SWPDHuf9WMuv8uDo5cgwnIhjp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9UanKKOCxZi5m3rEHuAqFl7ewkHNHkheXWOuRXGO5Ah1QJKIHu7C8J+iRgQ5?=
 =?us-ascii?Q?/+nfgejz6Iu81MLrz68IcMLgt9GaaZcxyAGxx3xqXBSqvTT6UCu/PERdRYxe?=
 =?us-ascii?Q?U9OK+qrFens143MyI+CnJJmz+sjxAHa7+9W095yiJuERI3528A8jnyPTi0gQ?=
 =?us-ascii?Q?5qEE0KNKfevrsrvmiHHNylCnxVN6VISAAyoUQ3itUAW2sYeHHNy3FRQePrhA?=
 =?us-ascii?Q?U+jo+FjsetDZHn/N4entD0eWe2hHQOg8hhfPp/zOHmkiLfW0nFx/zuDa0BW2?=
 =?us-ascii?Q?ZtI/SX9TBuxbOB/a3+e9ylGY5vnOn5Zx83V/JswRQzHfD7GHGM2TN1cNF/Yj?=
 =?us-ascii?Q?1GSKashohqvPtOnl6Zvps/kpUNlRIKAifOyl9Um2h3TZRdmcCn0Py3HoaU8K?=
 =?us-ascii?Q?32K+K0wncoDGsV/nN7Z04qJ7nPFw9QV53XCdHzSRjlPKegsURKkypgnpsvUm?=
 =?us-ascii?Q?9DykY2Nh2Gs6vFUfYlhoZjqFPfzPn5oW/WMRGPY0NpptatWwPblsTbCm5WfJ?=
 =?us-ascii?Q?xL0q14yYHj14ep5YkO021r8Vy9rCb4aNtadrsps6+85AHKphxYtQoVaBjDkX?=
 =?us-ascii?Q?i/GwsWR66EbgXD9Tww1w7/doekT+QSgpy1JGoFYn6o719KQDmK6YYATJgnTP?=
 =?us-ascii?Q?QPvuKutpr+rsSDBS2Sl07cX+C6I1VUnWf+HEyobRXXzHJv9kAfbSrW+CLRZw?=
 =?us-ascii?Q?QpNVICiMbJySAIq15ppRQxNlXfk0ntLSwktOdeGyg8o1AkkRrOGxPLzS6l60?=
 =?us-ascii?Q?N7T+DjbbWq+HUV935A7sto3sW9GhoP47rtzAr5X9EmcA4VwA4PzVIsiD26Vu?=
 =?us-ascii?Q?gYcy0Iu2oR9yxgSYyJ/fYucJqUops40aGe4ttipQ1IPcTEL93mynUH3fbHay?=
 =?us-ascii?Q?AjrR1BGp5Loq43PGaUQlSFbWIsqRk52QQDDyZcBC5qEYwlpBkIJ5U0B6gwFW?=
 =?us-ascii?Q?cb/cjb/uphtSvoNCNXFN8nfLlk7VozFh034ldFmPz1x8cJXYJSUlotMfL/mL?=
 =?us-ascii?Q?ffScq/uOteqaRIGhKMcQsYIb6Pn3mX7SmzwLjGBEk9n+f/sa+MTMMm8bYYUU?=
 =?us-ascii?Q?XjdRRI/HjO1KK7Sdhv+Ev0LDVHKi+39dfhcfQJtkghGB6hzHKmB327joi6HW?=
 =?us-ascii?Q?gvkjtHYL77DAisd3Ss7Y90NIrinBxxPFLOkdyy2Co+gSL1qd7S37l4Yac1YV?=
 =?us-ascii?Q?ddyqE1bVbBTzy6wxXgaMKMmqT2ig2WWSylx/9RvxIaoP96uy3NfQwbsOlsi7?=
 =?us-ascii?Q?QhZHcMwgXQp2vhwzXLrWBk4Z5dNjpgYKkwpE/M86wWxMo7ipZ+FG5TpP21VQ?=
 =?us-ascii?Q?IHJT8q4aEODmNxpNb5zmwAG5gHy7KFbsZ4oqch+FYz3feWgDYk3obhToM74m?=
 =?us-ascii?Q?UfAztpf7zmKhcCn+4dbmAiO85cknW2M581yRgDY13y/4/CnS+FEPwn/35AhC?=
 =?us-ascii?Q?dyLUxwdnJuEKEBaEjscH9xaeQnyqdrlVUvdyjIsv+0w0ewdbxNz8B1IsXdzn?=
 =?us-ascii?Q?lCTpTYG33FH6I7y3lFkBXmEpyVgxyfLmj2gxccBNPbedMhSK2Z3JNXdT9WVX?=
 =?us-ascii?Q?DwfCHuCD8aoJ3lZxxWl7yWocYxE/+D3B1pIWe3vlNvAHWu8TjbahIJVHAe07?=
 =?us-ascii?Q?tpweLtIaKf/LouVzRjmOhjUdn4k8eJ8PpY/aqpUC+l1SMbjfxyKlIQGSPK8A?=
 =?us-ascii?Q?uxczIeMLZXkbOuz8S0q8lqXA/DBbJ2X8CHXMvz5baq7hqvjBT87iD7e77Qkz?=
 =?us-ascii?Q?VHBi6c71FTZU2Id94RGqTfmWZ/w8vdyiuJEoYCvjPEyqVSoj2kdl4Vb+8R87?=
X-MS-Exchange-AntiSpam-MessageData-1: MK5cR7io9xoDeA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 299f53b1-bda7-413b-d05f-08debf66bbe0
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:29.3582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sWx9NwwGGG9/qk380X191uOiCYKYIBokaZAOMXhd6bfh25XF2kvYef+oQTHrTZOyhWHGcvgO4od4j/Rlz7B0tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c1860d/1780267713-C5784DB1-B0A279DA/0/0
X-purgate-type: clean
X-purgate-size: 2062
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1C71F6182C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Create the 'distance-map' node in the Device Tree passed to DomU.
This information is retrieved from the virtual NUMA configuration
in the xl domain configuration file.
---
 tools/libs/light/libxl_arm.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 4b0ed99229..466bee95ad 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -738,6 +738,39 @@ static int make_memory_nodes(libxl__gc *gc, void *fdt,
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
@@ -1407,6 +1440,8 @@ next_resize:
 
         FDT( make_memory_nodes(gc, fdt, info, dom) );
 
+        FDT( make_numa_distance_map(gc, fdt, info) );
+
         switch (info->arch_arm.gic_version) {
         case LIBXL_GIC_VERSION_V2:
             FDT( make_gicv2_node(gc, fdt,
-- 
2.43.0


