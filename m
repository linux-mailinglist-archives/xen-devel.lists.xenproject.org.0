Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLD1Hvn9p2nUnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:40:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F871FDC0A
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 10:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245220.1544595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxihr-0003bJ-MI; Wed, 04 Mar 2026 09:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245220.1544595; Wed, 04 Mar 2026 09:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxihr-0003YW-Ik; Wed, 04 Mar 2026 09:39:51 +0000
Received: by outflank-mailman (input) for mailman id 1245220;
 Wed, 04 Mar 2026 09:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4HQr=BE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vxihp-0003YK-DR
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 09:39:49 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 142f61de-17ae-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Mar 2026 10:39:46 +0100 (CET)
Received: from MN2PR19CA0011.namprd19.prod.outlook.com (2603:10b6:208:178::24)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 09:39:40 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::a1) by MN2PR19CA0011.outlook.office365.com
 (2603:10b6:208:178::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 09:39:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 09:39:40 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 03:39:39 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 4 Mar
 2026 01:39:39 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 4 Mar 2026 03:39:38 -0600
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
X-Inumbo-ID: 142f61de-17ae-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6jq/dXyVjlvypLOSHux/j2bTfTLJY6CZ/cGvdfdnEOOVeQl0q0AjECWX2S5pQ7oZk/eqwou1Gv5mOAtCCR8jTpAl80iF12dhjwr2j12YK6ohPix1mEnd2r+Jp4ImzB/+Gx1qUo5wp4VqzZ7UvD66FHMrWJX5HJepOxRc31GF0EL7uGJEj3tF61e1NTzzVHvpod/b+AxrY9Q52s6oYsXTP0KVXhPy+KNi0QJi7BfBIA/SBrpeZzT/vyhyw5o6zLlgoZGGbYFq5bYVT2XZHM5G88POKT9EzcIpQV8G13wsYgG3TN8NiJJeqYeb4qDe1szV5xZgFNFE8c7Sk3OEDNX/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HQu2M+0XHijYHerBIMV7/hGMJZUp9enctuOgoOndY8=;
 b=fwlVcU2ypkmmkM7ZyWR8eC/bWnoF2zMzoHktik/fHh3ItozMPAOmDCPLyPpzuZvS/LBnwKR1HOpOj4QhCFpIfnCL1HZSo3CIPTF4SwM6aTW6gq6K3Cg4EzkRtVf4lOh62UWsNerdFgR/hfpZhxHnTtwbcHy1I1VeFwpzwZVlg8QsaKrRIREwRuveh3crhOEuK7v4fk/6pKhgijUaUxxsxO25Fc1NfgNS/I8dFY/OjDwHl9n5SQ1lMZiEqTPT4NH0Qe2G505RlaMuPT3wWAh8XrwJYqSVeKi3EespII64eoBxbkkB/3ovW2JQ/bi1CfKZotXuCbXIyCeUl95WEr1sRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HQu2M+0XHijYHerBIMV7/hGMJZUp9enctuOgoOndY8=;
 b=hmu5kVqc6g4xzKcNhm9fsb152ZocRME9SbSN2YOGMpB2FkLjLJiUOY2mPu3a50A6rS/8sYw6uKQ9Jm0ey+NSYUDMWWnfJnarELQP+VSk47vMRYycuvpYo22EszYAgF2g0E5kF8AUaK3hHG3oOCGjFwgJNGw0h8zQe/qg8sbMIbQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] arm/mm: Fix resource handling in xenmem_add_to_physmap_one
Date: Wed, 4 Mar 2026 10:39:23 +0100
Message-ID: <20260304093923.14293-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|DS0PR12MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fccc3d3-e1c7-47cd-6857-08de79d1f52e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	d/4vmiIJ7oH3DeVwJkwLjlekR94sGlpT90yi55KecnApcmtSaJPZbSFH2vDfHgKSwHAR6HtzrtyDTHN5zFIgw4whHFSfz/Vwetqbd2tQ6RI+ODrp8zdykY70cob1ixbQJLONS8JykPrRjFuS+vh0nxoJqBp9HCc73hqeQeD+FKuxgByQSxCESmc/MzKi4L1FLucUDAoDisj2G47lurTuP32mW+sFQGo4NabXlxzbR42m4EAJ5AE1bSPYZUdTWIHd1EjVvR+ARpa7niNJxf6/7DUJMKl+iS1rCrwoJRLAbZ+BZ8CZEM0/InmCl+QOkILYmbhyr49OGRttxNIllgVhqAjeGZnwOWatdRHYy70SQOk7iIwT9Om4q8QLksTIP0PpsYrGVUxjsmgtRIJgChPGSKYEkBtiZc/Xczc5NBscA+lM9xsFoCOJpHdpWNAJY8viKaPiGsCtLly5gsBNhfbOg1uQ6w7X3hnRBYJ0Gh8jIvaDcnu9ugggj7amZ1B/1AneRTC6bSJKpcKxmHpNI9Dbk8grnUImG6OAt9ZIS8Zb9J6AXpbPdnDR6BxNobHvkm6xJPPWhc/xrtBeUy0fbxzKO3PY5QmtkMWzdt/ow1FYdwNGeN2O7GC5TsOCL5c+ebVWsa5dmeM5GYCCebUG6YkMXIyqPTAR5V4XSA2IsuMDfwPa/sLPrd1SFbY3O76p+NlO++zia7q57abB7Wf0cVbLvcoHp5hyskEkHBL8ttyuweFQKjMUvNzcj12sc9RGq264KGq6cP8shUX8w5SlAo334A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AhwGVb3skTKE/FeJrQLeNpYDgXuvEnIcO4Ywy8EcQ0mtkv82jriXHS5/KabXkWLWsb6J3dWp5s22AXd7HLnWs8C0Zsv9aPyWDkRk4lquuBcUnV7XdbSyzFV5wmYv5Gv7TfabSV9MW+BkTMji+IAeGCSty0FjyJfVOco6/okWJBQnSEulmyMFpYgqa/+8/FI5EwI1A/dyQvhdsrKYzVa18Sn13fCh4vCWeHgMCACSHhWcs6IzIVFBDAnhKF5XbZlj6hgcCK9pBYm2wsmypSwfe7zdQ+MQVjsRDXopLBdMhfuM0ON0zYOPPtDJu/RV1pRNig7XPBn17fuVkN3wlUcyi8V4kalQHItPZxomvojcOdqPMhisBi08ZPjpRzbE5iqeNnDAXuTjVC4RuRnKPlHImiX6Wv1nfZVO81Nk5GdPoD3lcfvRsvvApuhJpTrYutbD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 09:39:40.1421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fccc3d3-e1c7-47cd-6857-08de79d1f52e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701
X-Rspamd-Queue-Id: C9F871FDC0A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Action: no action

The current implementation of xenmem_add_to_physmap_one() does not check
for or remove existing mappings at the target GFN before inserting new
mappings. This can lead to pages not being properly freed (until domain
destruction) when replaced.

Add a proper old mapping detection and cleanup:

* Check for existing mappings at the target GFN before insertion
* For special pages: unmap without freeing (not owned by domain)
* For MMIO mappings: reject with -EPERM (questionable)
* For grant mappings: reject with -EPERM (cleanup not implemented in
  p2m_put_l3_page)
* For RAM and foreign mappings: properly remove via guest_remove_page()
* Optimize same-MFN remapping: detect and return early (no-op)

Fix XENMAPSPACE_dev_mmio by inlining its permission check and logic
into the main switch statement, allowing it to go through the same cleanup
path as other mapping types. This removes the early return that bypassed
cleanup. The now-unused map_dev_mmio_page() function is removed.

Foreign mappings are allowed to be removed (matching x86 behavior) because
proper cleanup via p2m_put_foreign_page() is already implemented in
p2m_put_l3_page(). Grant mappings are rejected because cleanup is not yet
implemented.

Add new helpers p2m_is_grant() and p2m_is_mmio().

Note: There are race conditions due to multiple P2M lock/unlock cycles
during the check-remove-insert sequence. These are documented and
subject to future improvements.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - handle all the spaces
 - drop references
 - add a comment about races (not handled in this attempt)

guest_remove_page would work on MMIO, but for now I decided to take a conservative
approach and reject it.
---
 xen/arch/arm/include/asm/p2m.h |  9 ++++-
 xen/arch/arm/mm.c              | 73 +++++++++++++++++++++++++++++++---
 xen/arch/arm/p2m.c             | 18 ---------
 3 files changed, 74 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 010ce8c9ebbd..d88f4f65c7bc 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -149,6 +149,11 @@ static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
 #define P2M_RAM_TYPES (p2m_to_mask(p2m_ram_rw) |        \
                        p2m_to_mask(p2m_ram_ro))
 
+/* MMIO types */
+#define P2M_MMIO_TYPES (p2m_to_mask(p2m_mmio_direct_dev) | \
+                        p2m_to_mask(p2m_mmio_direct_nc) | \
+                        p2m_to_mask(p2m_mmio_direct_c))
+
 /* Grant mapping types, which map to a real frame in another VM */
 #define P2M_GRANT_TYPES (p2m_to_mask(p2m_grant_map_rw) |  \
                          p2m_to_mask(p2m_grant_map_ro))
@@ -159,6 +164,8 @@ static inline p2m_type_t arch_dt_passthrough_p2m_type(void)
 
 /* Useful predicates */
 #define p2m_is_ram(_t) (p2m_to_mask(_t) & P2M_RAM_TYPES)
+#define p2m_is_mmio(_t) (p2m_to_mask(_t) & P2M_MMIO_TYPES)
+#define p2m_is_grant(_t) (p2m_to_mask(_t) & P2M_GRANT_TYPES)
 #define p2m_is_foreign(_t) (p2m_to_mask(_t) & P2M_FOREIGN_TYPES)
 #define p2m_is_any_ram(_t) (p2m_to_mask(_t) &                   \
                             (P2M_RAM_TYPES | P2M_GRANT_TYPES |  \
@@ -318,8 +325,6 @@ int unmap_regions_p2mt(struct domain *d,
                        unsigned long nr,
                        mfn_t mfn);
 
-int map_dev_mmio_page(struct domain *d, gfn_t gfn, mfn_t mfn);
-
 int p2m_insert_mapping(struct domain *d, gfn_t start_gfn, unsigned long nr,
                        mfn_t mfn, p2m_type_t t);
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 6df8b616e464..0cee65d5ab5a 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -11,6 +11,7 @@
 #include <xen/domain_page.h>
 #include <xen/grant_table.h>
 #include <xen/guest_access.h>
+#include <xen/iocap.h>
 #include <xen/mm.h>
 #include <xen/static-memory.h>
 #include <xen/static-shmem.h>
@@ -166,10 +167,11 @@ int xenmem_add_to_physmap_one(
     unsigned long idx,
     gfn_t gfn)
 {
-    mfn_t mfn = INVALID_MFN;
+    mfn_t mfn = INVALID_MFN, mfn_old;
     int rc;
-    p2m_type_t t;
+    p2m_type_t t, p2mt_old;
     struct page_info *page = NULL;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
     switch ( space )
     {
@@ -237,13 +239,73 @@ int xenmem_add_to_physmap_one(
         break;
     }
     case XENMAPSPACE_dev_mmio:
-        rc = map_dev_mmio_page(d, gfn, _mfn(idx));
-        return rc;
+        if ( !iomem_access_permitted(d, idx, idx) )
+            return 0;
+
+        mfn = _mfn(idx);
+        t = p2m_mmio_direct_c;
+        break;
 
     default:
         return -ENOSYS;
     }
 
+    /*
+     * Release the old page reference if it was present.
+     *
+     * TODO: There are race conditions in this code due to multiple lock/unlock
+     * cycles:
+     *
+     * Race #1: Between checking the old mapping and removing it, another CPU
+     * could replace the mapping. We would then remove the wrong mapping.
+     *
+     * Race #2: Between removing the old mapping and inserting the new one,
+     * another CPU could insert a different mapping. We would then silently
+     * overwrite it.
+     *
+     * For now, we accept these races as they require concurrent
+     * xenmem_add_to_physmap_one operations on the same GFN, which is not a
+     * normal usage pattern.
+     */
+    p2m_read_lock(p2m);
+    mfn_old = p2m_get_entry(p2m, gfn, &p2mt_old, NULL, NULL, NULL);
+    p2m_read_unlock(p2m);
+
+    if ( mfn_valid(mfn_old) && !mfn_eq(mfn, mfn_old) )
+    {
+        if ( is_special_page(mfn_to_page(mfn_old)) )
+        {
+            /* Just unmap, don't free */
+            p2m_write_lock(p2m);
+            rc = p2m_set_entry(p2m, gfn, 1, INVALID_MFN,
+                               p2m_invalid, p2m->default_access);
+            p2m_write_unlock(p2m);
+            if ( rc )
+                goto out;
+        }
+        else if ( p2m_is_mmio(p2mt_old) || p2m_is_grant(p2mt_old) )
+        {
+            /* Reject MMIO and grant replacements */
+            rc = -EPERM;
+            goto out;
+        }
+        else
+        {
+            /* Allow RAM and foreign - both have proper cleanup */
+            rc = guest_remove_page(d, gfn_x(gfn));
+            if ( rc )
+                goto out;
+        }
+    }
+    else if ( mfn_valid(mfn_old) )
+    {
+        /* Mapping already exists. Drop the references taken above */
+        if ( page != NULL )
+            put_page(page);
+
+        return 0;
+    }
+
     /*
      * Map at new location. Here we need to map xenheap RAM page differently
      * because we need to store the valid GFN and make sure that nothing was
@@ -255,8 +317,6 @@ int xenmem_add_to_physmap_one(
         rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);
     else
     {
-        struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
         p2m_write_lock(p2m);
         if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), INVALID_GFN) )
         {
@@ -276,6 +336,7 @@ int xenmem_add_to_physmap_one(
         p2m_write_unlock(p2m);
     }
 
+ out:
     /*
      * For XENMAPSPACE_gmfn_foreign if we failed to add the mapping, we need
      * to drop the reference we took earlier. In all other cases we need to
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index fb03978a19af..c91568926e4c 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -200,24 +200,6 @@ int unmap_mmio_regions(struct domain *d,
     return p2m_remove_mapping(d, start_gfn, nr, mfn);
 }
 
-int map_dev_mmio_page(struct domain *d, gfn_t gfn, mfn_t mfn)
-{
-    int res;
-
-    if ( !iomem_access_permitted(d, mfn_x(mfn), mfn_x(mfn)) )
-        return 0;
-
-    res = p2m_insert_mapping(d, gfn, 1, mfn, p2m_mmio_direct_c);
-    if ( res < 0 )
-    {
-        printk(XENLOG_G_ERR "Unable to map MFN %#"PRI_mfn" in %pd\n",
-               mfn_x(mfn), d);
-        return res;
-    }
-
-    return 0;
-}
-
 int guest_physmap_add_entry(struct domain *d,
                             gfn_t gfn,
                             mfn_t mfn,
-- 
2.43.0


