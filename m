Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YETeLNi6HGp/RwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E2761829D
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 00:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323500.1589290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxW-0001Tm-0U; Sun, 31 May 2026 22:48:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323500.1589290; Sun, 31 May 2026 22:48:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wToxV-0001RE-PS; Sun, 31 May 2026 22:48:41 +0000
Received: by outflank-mailman (input) for mailman id 1323500;
 Sun, 31 May 2026 22:48:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wToxT-0000nm-IQ
 for xen-devel@lists.xenproject.org; Sun, 31 May 2026 22:48:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wToxS-00Fm16-U6
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 00:48:38 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cba94-e002-0a2a0a5209dd-0a2a45059030-26
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:38 +0200
Received: from [52.101.228.101]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a1cbac4-aaa8-0a2a45050019-3465e465f6ed-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 00:48:38 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY1P286MB3278.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Sun, 31 May
 2026 22:48:34 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0071.015; Sun, 31 May 2026
 22:48:34 +0000
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
 b=OayNDmZBClsBgcVZruXnA3HwMZEkUmiFGJVwN+9L8HS9ECC9yv7Nh8qunkrpeiCFVIB+LN7thoB5M2cgSc+4DeXq37GDxEM0jmTv2J8Sp01BZCmVPp3eQfyCE5ZgIQCxEIgwz+VbsKOAIHvjYeWsRC1qWYQdXp3Vfkv7rlfJpSuD8kutrRSd2J5+JnxfAbjEDEeUNbcV/+C43d9IQK1EylaM00CwznnAGEhsm2q3fSbpQSrlWUs96bwQmZiqGJZtqvZVm0E+Xnu9K1MozKF5a7t245pGKRDX+oMXG5jdzwJ4kR2m2+akINMuDSinPBXnkex5kAhrkdUb1MNpcBltrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGKyh0qPXMyFNehAOEHpm32bV3yJeO8ltFIFkUh1kGI=;
 b=kYJTiBTr/1o7XAHAvAHWZ/IjiofRayAvcbzAyW8WjutNerA1zC8qrYEo0gqaUG9V9HLpHl4VTv9MgD006hc5ZR75CSgM+L2dxx8h4zLoy6MF5ie2lJnrPxcCfx6gWiD87cVy1nCrnfKrJNttU/SDn4bXVxuijoqdQJfCJs8hHF6/up60r8HkANv52wUKur8Pukma8bvOHr1EI9nK/2gwlCd6IFwO/aEp1Cc62D2fPDKl4Kwa86dppOSauJhv6NbmWZhOZbcWqyTJedNtaR+h+ZmLgaIhnKYkG6jSCcW9INiL0GahfZooEEouxjdWCx1L8oClWafahspZcvZg1GR9Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGKyh0qPXMyFNehAOEHpm32bV3yJeO8ltFIFkUh1kGI=;
 b=DD0a6J+qAvFh6CyXblcPXX5HffSljmsWs8wjqKzhwlhDM8lK9h65jAnoXSlFcoVHMcX0r4uSXh/FgI/NUoDWTvFC5SEdTNKK5gcYvobGj19XLRB9dbpT3gJyjF5QBTnYxUuCop1qX7dVdXEfV6obwzVsRZCykLYEjpE5idkgKwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 18/24] xen/arm: Reflect physical NUMA node IDs in Dom0 memory DT nodes
Date: Mon,  1 Jun 2026 07:47:48 +0900
Message-ID: <20260531224755.9481-19-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260531224755.9481-1-taka@valinux.co.jp>
References: <20260531224755.9481-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0080.jpnprd01.prod.outlook.com
 (2603:1096:405:3::20) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY1P286MB3278:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2eab98-da8c-41e6-0daf-08debf66bf21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eyZpEX8gsDGf4BqyKMinizSuABiE2sx5i+TH6mU60dBL7Zc5El6S1J94HZbtkyUmZeas2DSmWla06dZ7wOtA0M5zKf4yov0+B8FqylHBJqbRD4qc5vj5VK9kMRfLe4wZIENEmiZAS5TZbc+pr73QD/Iipwl+OSWaRRE/HQQfMpoqKGVX30pXXLnhI9fOx9wk5vaXTQA8BowmVD0ktkk3P/kcUoyHvfibCbHbnYaB81FCjBPcm7Km+E4vNqJwDHW93dpONfm3Q2ec4cYTPjbQSMA1maD2BclxSgic9lzejvaA5psABWPOgRgeCdXmG2XGU4DuqvDwp1/OIibIc1mIwxcyM9IuJfzxS52yKzakzIpQXvGWObbrj0l3aEpl3wVUFpbNx8cdeg4z3lHq7VZOQ/bt799P6ExMKwbMQhQFhzwy3owXD0TwFb994gGzZ39ZPNm5N+7R5qiNQuDE7nIjbTux1wXivWYnaRDDnltrtExRAiK44L0Pl6D0XKaDvXTRlZhmE1eBtADMDLJcZp1P7AdTFxuU6eqbnNJED96W5jn7+4lY2pcDNAKz96c30bzN/IXjYRkBOSme0tMnM/EgjJ+bGkOcAQcNix4o7XXvtzZuB7h/PZLu/1CTMM8B/lwbfMD3M/n1AGX91Qumrs0qe5EHgoFvj9aIIKY+Gm1cy98jIsMpWvL4bTb5Y2unnS24
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hsEkJa47CjRa8cDPUunwckkw25QhOlBDm9wgiR2DwCYXlqQTpxODnGzw6q1x?=
 =?us-ascii?Q?3Kg/VBq9OJ/+lTNZu/bBZd5/pozEceV4Q9ezbVKbTK0BB4JMvMFHParJDY4y?=
 =?us-ascii?Q?JXpLrSDnyez5d0ZZSCEYcuY/mq52h/XnBLJGnz0jDtxcFI6J68um1cRGAjSM?=
 =?us-ascii?Q?yz0aMrwFmLhTRYgUtDiAb7N9nevjleLmkEfCys9JXfAzESIkEXhyUTeiA/An?=
 =?us-ascii?Q?3T5u6xxhu9URc+MAgdgOGlIXzSHXifCBkLgeROaPlJE38Wh0yS/Apy0QGiDk?=
 =?us-ascii?Q?6L68YDJOi0AkO48dmLtina+CySM9i0twwVOGb4xCfCttZkekMWFs3WituQRr?=
 =?us-ascii?Q?e1NgSVks5EyEL+cP9aXyCUv9m32YeV3U9hgixdUDLWAQzWxvd54J5eM8qIvH?=
 =?us-ascii?Q?gW7OHot7X5pa7FoeiSGXA0OQdL2TYDitHo6RE1o7UqMcoXj2mqu3NqEWkhfn?=
 =?us-ascii?Q?Jnt5bJilotUJS8mPo4ok74Ehvg3xI+gjE27C5PYFUM76YNnIPkb2TE+guTcj?=
 =?us-ascii?Q?tXmnv46rDMBlD5UJjqfffmVSqcBnn5FQZWy+2cNx+JAHgR7ohdoCBwctfC1X?=
 =?us-ascii?Q?YIlx5cWanb2Eo3H1kCanUlPiX3Kl8jeMS4eANPEFRTho38G3FzVlb6orWZs2?=
 =?us-ascii?Q?B+VBzE9/Nrofsia1StMWA4xkw4SUjJ/EhhinMPEzRvVG9jpo5p8Py+KeUz4Y?=
 =?us-ascii?Q?NN413ChZ7Fpmob5fAxyD3u6yonZtngpK/tHR2MIfwzlob49h7tGkqRKamqsl?=
 =?us-ascii?Q?0o58+h36z+yU4tksS6ia5kLMaaar1PSbLzprVZiyvXvW1EgCw1l5ZfZvU6Vp?=
 =?us-ascii?Q?MA+4lsbDQBobtYdT5dZiwuPP+9BWztQhzFJ0qc3ihsS9Sj0Rd/Lyh1fA6mki?=
 =?us-ascii?Q?TqCJy4aroGHcx65TF/DIFNctRU9pY6IUrrf/KqyxDVM99m6QGZp1Zp/psDb2?=
 =?us-ascii?Q?cKGsCIqD7SUUqJ2C/B8reL5wFtmFn3NgSmALq5EYRWNpHtWEY9uj03FhGxgN?=
 =?us-ascii?Q?vIQvnyAjpYgKKEcNDHMsSPKaYNFl5d9FtjN+yuHb0skB9kNsf9uus//nYV9O?=
 =?us-ascii?Q?EnTFaMimOw46yxLJk7Bj995TolOub/KIC1kUU9RmfZOwhqnqd4wTnAje/CNh?=
 =?us-ascii?Q?T58hMZO3S35WaIhrFuIPu/TB0EvHsK5bgWiNIRBwOidOyMc3iGATsjlfDXsh?=
 =?us-ascii?Q?EE7jIIazTEqz4dhq0H71y9CXGzCM/oE9bj+5LM7cCqcDvkgmpRmmH6e7YkIp?=
 =?us-ascii?Q?ShdOQ1eSAxb+VR+iB4HT81FIHjBZxHzVj9pshwL1CRKWYCI21LtPX7C5+86M?=
 =?us-ascii?Q?OTaAxugbMRAJwK++RQEq0+e8AW3BgxS5xARUh8D3wuU7jJd8JYie597yN72w?=
 =?us-ascii?Q?jdizof55ql0lQ6+aYHbBRICqMayidLenEVZNrSAyQR1nv05n0Ztv8MhZ6gWL?=
 =?us-ascii?Q?VF0ov5BCzYTq9QZqPrX3JbjVtnXGCNI/3YNQD6/cU+T0e6rommufVKx3x4Rd?=
 =?us-ascii?Q?wtV/noFdN+cPFPyngM6+bhw686Ui+5GFwVN2pUCYB8fQhKbSpltH7nCooajf?=
 =?us-ascii?Q?d26bQDsZPcyDh1zH829mbwzbMEHK8+WLMWCEcsVhK+9Z8lpudhWmCbIVm+ja?=
 =?us-ascii?Q?IhlEM3GugndsYNUu5Q8j+MeJ6QiBmCPXPxVKO835PyDhK/FkWV5vV3ligviG?=
 =?us-ascii?Q?iWlU4ecxAGsbnH+SCa8appnGKayeXkFAVcisENtaKS1Cv6jsqjHLuacMjalX?=
 =?us-ascii?Q?jSYZiBkrhfnx25JV2WZeDfOFedBon4suSfhyGN7+WNabzmhVxXFxvn4lMXEz?=
X-MS-Exchange-AntiSpam-MessageData-1: JmHHt9vxCBOH6w==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2eab98-da8c-41e6-0daf-08debf66bf21
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 22:48:34.7961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5rnACMLN7bDQJmXkBRdT/8scko5OaRt0er7i+9F/lyRwqnAYuu+zJe04poPqF4bKF2bmDtFmG/GXVTHzwXIMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3278
X-purgate-ID: tlsNG-c201ff/1780267718-E2591443-A09229D7/0/0
X-purgate-type: clean
X-purgate-size: 6804
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 78E2761829D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extract the physical NUMA node ID for each memory bank allocated for Dom0
and apply it to the corresponding memory node in the Dom0 Device Tree.
This implementation maps the physical NUMA node IDs directly as Dom0's
virtual NUMA node IDs.
---
 xen/arch/arm/domain_build.c           | 22 ++++++-
 xen/common/device-tree/domain-build.c | 88 +++++++++++++--------------
 2 files changed, 63 insertions(+), 47 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2518909ed0..1deb4c1139 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -187,11 +187,26 @@ static bool __init insert_11_bank(struct domain *d,
     int res;
     mfn_t smfn;
     paddr_t start, size;
+    nodeid_t node = 0U;
 
     smfn = page_to_mfn(pg);
     start = mfn_to_maddr(smfn);
     size = pfn_to_paddr(1UL << order);
 
+    /* This code is temporal */
+    {
+        struct membanks *mem = bootinfo_get_mem();
+        for ( i = 0; i < mem->nr_banks; i++ )
+        {
+            if ( start >= mem->bank[i].start &&
+                 start < (mem->bank[i].start + mem->bank[i].size) )
+            {
+                node = get_numa_nodeid(&mem->bank[i]);
+                break;
+            }
+        }
+    }
+
     D11PRINT("Allocated %#"PRIpaddr"-%#"PRIpaddr" (%ldMB/%ldMB, order %d)\n",
              start, start + size,
              1UL << (order + PAGE_SHIFT - 20),
@@ -217,6 +232,7 @@ static bool __init insert_11_bank(struct domain *d,
     {
         mem->bank[0].start = start;
         mem->bank[0].size = size;
+        set_numa_nodeid(&mem->bank[0], node);
         mem->nr_banks = 1;
         return true;
     }
@@ -226,7 +242,7 @@ static bool __init insert_11_bank(struct domain *d,
         struct membank *bank = &mem->bank[i];
 
         /* If possible merge new memory into the start of the bank */
-        if ( bank->start == start+size )
+        if ( bank->start == start+size && get_numa_nodeid(bank) == node )
         {
             bank->start = start;
             bank->size += size;
@@ -234,7 +250,7 @@ static bool __init insert_11_bank(struct domain *d,
         }
 
         /* If possible merge new memory onto the end of the bank */
-        if ( start == bank->start + bank->size )
+        if ( start == bank->start + bank->size && get_numa_nodeid(bank) == node )
         {
             bank->size += size;
             return true;
@@ -253,6 +269,7 @@ static bool __init insert_11_bank(struct domain *d,
             mem->nr_banks++;
             bank->start = start;
             bank->size = size;
+            set_numa_nodeid(bank, node);
             return true;
         }
     }
@@ -263,6 +280,7 @@ static bool __init insert_11_bank(struct domain *d,
 
         bank->start = start;
         bank->size = size;
+        set_numa_nodeid(bank, node);
         mem->nr_banks++;
         return true;
     }
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 2a760b007b..61e2e50062 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -493,15 +493,50 @@ int __init make_chosen_node(const struct kernel_info *kinfo)
     return res;
 }
 
+static int __init make_memory_sibling_node(const struct kernel_info *kinfo, int addrcells,
+                            int sizecells, const struct membank *bank)
+{
+    void *fdt = kinfo->fdt;
+    int res = 0;
+    u64 start = bank->start;
+    u64 size = bank->size;
+    __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
+    __be32 *cells = &reg[0];
+    nodeid_t node = get_numa_nodeid(bank);
+    char name[32];
+
+    dt_dprintk("  Bank: %#"PRIx64"->%#"PRIx64" Node:%u\n", start, start + size, node);
+
+    snprintf(name, sizeof(name), "memory@%"PRIx64, start);
+    res = fdt_begin_node(fdt, name);
+    if ( res )
+        return res;
+
+    dt_child_set_range(&cells, addrcells, sizecells, start, size);
+    res = fdt_property_string(fdt, "device_type", "memory");
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "reg", reg, (addrcells + sizecells) * sizeof(*reg));
+    if ( res )
+        return res;
+
+#ifdef CONFIG_NUMA
+    res = fdt_property_u32(fdt, "numa-node-id", node);
+    if ( res )
+        return res;
+#endif /* CONFIG_NUMA */
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+
 int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
                             int sizecells, const struct membanks *mem)
 {
-    void *fdt = kinfo->fdt;
     unsigned int i;
-    int res, reg_size = addrcells + sizecells;
-    int nr_cells = 0;
-    __be32 reg[DT_MEM_NODE_REG_RANGE_SIZE];
-    __be32 *cells;
+    int res = 0;
 
     if ( mem->nr_banks == 0 )
         return -ENOENT;
@@ -516,54 +551,17 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
 
     dt_dprintk("Create memory node\n");
 
-    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);
-    if ( res )
-        return res;
-
-    res = fdt_property_string(fdt, "device_type", "memory");
-    if ( res )
-        return res;
-
-    cells = &reg[0];
     for ( ; i < mem->nr_banks; i++ )
     {
-        u64 start = mem->bank[i].start;
-        u64 size = mem->bank[i].size;
-
         if ( (mem->bank[i].type == MEMBANK_STATIC_DOMAIN) ||
              (mem->bank[i].type == MEMBANK_FDT_RESVMEM) )
             continue;
 
-        nr_cells += reg_size;
-        BUG_ON(nr_cells > ARRAY_SIZE(reg));
-        dt_child_set_range(&cells, addrcells, sizecells, start, size);
-    }
-
-    /*
-     * static shared memory banks need to be listed as /memory node, so when
-     * this function is handling the normal memory, add the banks.
-     */
-    if ( mem == kernel_info_get_mem_const(kinfo) )
-        shm_mem_node_fill_reg_range(kinfo, reg, &nr_cells, addrcells,
-                                    sizecells);
-
-    for ( cells = reg, i = 0; cells < reg + nr_cells; i++, cells += reg_size )
-    {
-        uint64_t start = dt_read_number(cells, addrcells);
-        uint64_t size = dt_read_number(cells + addrcells, sizecells);
-
-        dt_dprintk("  Bank %u: %#"PRIx64"->%#"PRIx64"\n",
-                   i, start, start + size);
+        res = make_memory_sibling_node(kinfo, addrcells, sizecells, &mem->bank[i]);
+        if ( res )
+            return res;
     }
 
-    dt_dprintk("(reg size %d, nr cells %d)\n", reg_size, nr_cells);
-
-    res = fdt_property(fdt, "reg", reg, nr_cells * sizeof(*reg));
-    if ( res )
-        return res;
-
-    res = fdt_end_node(fdt);
-
     return res;
 }
 
-- 
2.43.0


