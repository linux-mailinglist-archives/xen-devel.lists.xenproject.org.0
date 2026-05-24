Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBmmB0NAEmo7xAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E055C0ED1
	for <lists+xen-devel@lfdr.de>; Sun, 24 May 2026 02:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1318217.1586659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJ6-0006Zg-V1; Sun, 24 May 2026 00:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1318217.1586659; Sun, 24 May 2026 00:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQwJ6-0006Vg-OW; Sun, 24 May 2026 00:03:04 +0000
Received: by outflank-mailman (input) for mailman id 1318217;
 Sun, 24 May 2026 00:03:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wQwJ4-0006Bb-TZ
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 00:03:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQwJ4-005yId-9j
 for xen-devel@lists.xenproject.org; Sun, 24 May 2026 02:03:02 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a12400e-2eae-0a2a0a5409dd-0a2a4504c06e-24
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:02 +0200
Received: from [52.101.125.126]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a124032-1dec-0a2a45040019-34657d7e3800-4
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2026 02:03:02 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB4275.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:2ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Sun, 24 May
 2026 00:03:00 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 00:03:00 +0000
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
 b=h3incp0fEeHgjGaf/D0IlTarSW4mxbwuYhbOxV1SNEOpru0A1v4mJvlVpzkCixB4J4waFbq99yX0DucCBYYhSQCSkwxzACJfAvEZ1uOFQzUA0WUJDOEKYyrS0QFqKckqopvJy870MsKq/Ep0puPx13Ls3pSMyH7yahUaiGarOA742vKhyP+NrYF5bltAb+T84n6FzvGuJX5kzMVxYNv+aF+HPgMmO9MUPIV6INImEc6fmtYLmYnjLQsTd8lKAjcrm5+UVERVJRIRDfncKMK9sc/QUs3w8KzQW3zbDpzDbpAqcChl3/bKHqqI2PEd8ZyvAo+1tE7fOnQBaajHyLH4KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGKyh0qPXMyFNehAOEHpm32bV3yJeO8ltFIFkUh1kGI=;
 b=a5SitS0aBaLqJ9aeJ3yEpvdXu/CZmYRa/Z3BkRMSpt5OSUfHdGjfkYehoupkt+mFJfUqlljkCmeKqR7+iAVtAxyKvz5AdKWauxJ7msh/cB3kIXvgSt8uWHpmYEM2huLnulhY8QsV2SPLZSvnSaqpG+riuBig7Lieeje/rD5OLvL1DKobNUTg00eMSKPfjkh8cdakEs+/gg6XJ0q38LHgJYOCvqZJNTXPdo6RyvbpM3mJvssyV003vZDCOhhvAqGZMAByjcARIGSWY3fHkzvzIpSpvD0urC0fNiOz8DjOfuUk+naKEi20gChFXYqmnXnzu0Y3+qjXGR/TOwuV42TstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGKyh0qPXMyFNehAOEHpm32bV3yJeO8ltFIFkUh1kGI=;
 b=MiBfZdLPkZj5gpBCn5BDCkD2wzzXcs2YP88gigMqvxXm/kj2HG5PanXlLhNzKl6wlH0XUmS7OOyZ8LfKXuwcVuj9UfXh7eU23xbxvGr015sAL6C3OIBCzcUo/UdCkGCf2A+jsjICySPGNUnT8xwHda/J5EafT130qU4hg3g5KU8=
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
Subject: [PATCH 15/21] xen/arm: Reflect physical NUMA node IDs in Dom0 memory DT nodes
Date: Sun, 24 May 2026 09:02:03 +0900
Message-ID: <20260524000209.292370-16-taka@valinux.co.jp>
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
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS9P286MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 1945a39b-5589-4ff2-3dd3-08deb927d14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pT9LDoPqhKRQXECn8O2g0PjOf2SvwkyAkDu5MRYymalk1gCqKFG5esyB3YWydLEXKJp0wrWzk3gn1C3RyC2LH2rNJuI90Y7FAYQADw+BdI4CnQ9PS8aeb8LcfPboJQXs/6HsmjW+DRWkrPGn2loWK2yOwVWKtRBK144mfJKzITqbv5EFoNrTZHEN7NIXQN+q+HN30K91BkZ12XVaG8vMaoqVufAl1N8Eg6ZeOJabXSV4PMR5SSN4UlXkcoxWXuKmKPG/doULQenoDSBoB+2XoV3dHIHu4q4aabUAffRsBrTB7dHp7a5cY9PH61izqPBw5su94mfO2J2HR3db+ztZPz6IG+BEb2VEl090LGWJQMYPQY5xZEmfNz63t4qDoinUS3Fd8rB/KOy7nO8gzpYpvkBWt8kZwhNwx1z3mkI7dQBeR63A1y9/hZD5sb7bLJZIJ3e3iPBwfBDF7bYXztYSp0zsx/RiRnpRFIbJwB9jJyMKrgeJlyM5CZMBtwH9i+hSt2x909/4MdoAyNl4CrcSojN1VPKdA3UqUr/lFRH0SoxksNBXsZlLaEIQUQ8i7To05tY3X7tyGUkYfg7HRA93sieA2KeU1WHR4zNkfrSnSa6oRlFLWYErrL2YDWCWVfvfH4j8yn3rAX/K5z+mQlzvBlA3hieqy6IISrKXp4ZVDcpeGAMi2QMcmj66onWQkqqJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hNq8h7ForHdKvQiRQwB9nOmdZQAsD1FKlKEAY744A1XzjCE/cQmZr+5DB81v?=
 =?us-ascii?Q?5whY/MhgnoXGIJOTH1YlZzN0Y5JAj/f5QtpPnRJC5Fr6nD9RLJPXlLITCCSJ?=
 =?us-ascii?Q?6XpROm+DbzcrDD+xSPy0d1QcyVG6UggWzhk/29m4KB//0N6+yMN7VkCKbJMP?=
 =?us-ascii?Q?r/jhjT8UaUMPKDwiLbKE/htqOcHHiS9cGBLU31wCy0/jPh4HAO6ouSEHkBqF?=
 =?us-ascii?Q?9sPkPkMT2r5Ap+rjH1RN7ZRflH5HoG9BH3txci/B6zZfIB6i/zG1C4MA/Wve?=
 =?us-ascii?Q?BqyZW/8X2b7nC1VoweKiTjq6yYpW5XB4AaJi+1QhV2cggWY5c2NczZDfbJRu?=
 =?us-ascii?Q?lMC9uGH2jTjKpiy46NHh3kavjVBRxs1BSgv4eoSxx1TP/Cdsf/yQRttgBeFl?=
 =?us-ascii?Q?MIRIkQeAymeSKeB/0VXm8VAn3uchm2CO+jEslaNJfXsm8FZukrTGiCkpcOGp?=
 =?us-ascii?Q?/e7GaBeTFk1l5i1cbRD7q7a7SH3AzowiB35icqc+z4dYN/+pslbvqrUn664W?=
 =?us-ascii?Q?AdOrr8hoVXq2Z6Y1XjJ7AIcUG0FtSEQUvw67oD17/74F4AgimH+cYFUvDaQD?=
 =?us-ascii?Q?KtydYdC3GO6mj8imRbZKYiNyxpwbXcaQWlutaU8aHM3sFlivpvd1yV8XLm+/?=
 =?us-ascii?Q?j8hjf5qlYAjMqCfL4HPmyFufSQ/cjoooYoFER5qT7MbsynJD9ZJygWK643UZ?=
 =?us-ascii?Q?ilEMYji2xNemMxpF+QAUd6ufJUtMdqNqRySy2vKVNMWhSFWST/RD1G0L5OoD?=
 =?us-ascii?Q?cYmATkjc13w7OewOLRQ4qBjxn5JmkmzJMOJ16li8rTRFctb63/+Nve19E7zf?=
 =?us-ascii?Q?in1kjXT1HwBaKJUpW72TFkRbyW1NV6IF5WDTZVh0o8SHtUWoCJRPt8S7DRAD?=
 =?us-ascii?Q?Oxx/kAfdTwx2WxmW/E8M/0uzTyk3iHP2RXrC0BxANPnq1q8JS19tHWi1uLhn?=
 =?us-ascii?Q?2HlOultXpxbIHUSyqB5WQ0qEqiSRJPFGIAJlDQ3z8h60HqTlp0TRgTliq1Kj?=
 =?us-ascii?Q?UtMg/Rozdi61EBskyuEX00SoPIjU1VRqBsTj/BTx0lT623azadZHq/5dOGoU?=
 =?us-ascii?Q?iEmG7ylJXJ8PQQovzPGZ15KD2vaN2A9Ov0R6L4TlHSY9IjZLWRDqI+Zui7i9?=
 =?us-ascii?Q?/CiBeo+76Avj8JpK+eRQwGx52TgSRg5N2afmm0xSbuJHXBeEvSOWqeeTciAd?=
 =?us-ascii?Q?ikg050sgdb1kIbiU8qoUu4tWTBC51Si7/FSYemfcLDJmLFkmx6MDJnCZ6UzM?=
 =?us-ascii?Q?Rb9Zkg2OJVnOB9/sgin5ibnCRqwz5B+GjqhpfiTaKSld3U7BqHwcTllGaogN?=
 =?us-ascii?Q?7vfzQh5u+QrS2eBlmv4p3LMQLH5KAwPdttmXIqBKLkRxKA9iq6ak6mc4wIgi?=
 =?us-ascii?Q?SwouR6t6fAC8s29kXlMK9mpcYcPclxmmwnPnoQr6gOOtlC5tlbht8Gx09CR5?=
 =?us-ascii?Q?KLBjCJ/+F6GxXNcObCvh/7keuvnC8o0NwkyqyCDT7+WJGkb38rN782AptmfZ?=
 =?us-ascii?Q?jlW99Qu+s4A5kP46noFE6VYVJmkOsnh7jaKIIRvsCP222XFItiiHr06bx2MD?=
 =?us-ascii?Q?7LJKsesVpRulXZYicq9069mY7u/MDUalFLgqrDTS76P7N1B8HMuamVsF1JfZ?=
 =?us-ascii?Q?ewqpEw5JeF2rUtDE/G7jSuRTc2+IvItOaivQ2u0BY4+Wt2l1cW6KcZpEOP5M?=
 =?us-ascii?Q?rqUmH21udez8PIzjWkmaX/GUL7+EZMH+3snm10Z/mda6grQy6Ru6pPrjivF1?=
 =?us-ascii?Q?2KiCb8qWPW7Rjq1F0a+PliBKuLLLUW6bge1S6Z3S/6uZ0sQsQUXT0Iwlb96z?=
X-MS-Exchange-AntiSpam-MessageData-1: MAu7AU4DucXDpQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1945a39b-5589-4ff2-3dd3-08deb927d14c
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 00:03:00.0545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2I0siPZsjxzga0PsiA3ybkzKDq6DwmV9Hne2KIRV4bLTsflzQ8SgXch7w8tAaxd1cHFfVMRnDBP7vnBx2o1lHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB4275
X-purgate-ID: tlsNG-ebf023/1779580982-2AF653FF-16449E80/0/0
X-purgate-type: clean
X-purgate-size: 6804
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
X-Rspamd-Queue-Id: A0E055C0ED1
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


