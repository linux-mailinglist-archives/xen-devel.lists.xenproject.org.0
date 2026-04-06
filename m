Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OW8C7wF1Gk9pwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 21:13:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0C63A684D
	for <lists+xen-devel@lfdr.de>; Mon, 06 Apr 2026 21:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274354.1560499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9pN5-0008OV-Uu; Mon, 06 Apr 2026 19:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274354.1560499; Mon, 06 Apr 2026 19:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w9pN5-0008Ma-S0; Mon, 06 Apr 2026 19:12:27 +0000
Received: by outflank-mailman (input) for mailman id 1274354;
 Mon, 06 Apr 2026 19:12:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w9pN4-0008MF-7o
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 19:12:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w9pN3-009Kc1-K4
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2026 21:12:25 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d40582-e002-0a2a0a5209dd-0a2a45058d60-20
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 21:12:25 +0200
Received: from [40.93.198.62]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69d40597-3760-0a2a45050019-285dc63ef092-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 21:12:24 +0200
Received: from DS7PR03CA0309.namprd03.prod.outlook.com (2603:10b6:8:2b::7) by
 DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17; Mon, 6 Apr 2026 19:12:18 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:2b:cafe::e0) by DS7PR03CA0309.outlook.office365.com
 (2603:10b6:8:2b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Mon,
 6 Apr 2026 19:12:18 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 6 Apr 2026 19:12:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 6 Apr
 2026 14:12:17 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Apr
 2026 14:12:17 -0500
Received: from ubuntu (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 6 Apr
 2026 14:12:11 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t1GOYhZ8tP/oqiH0UvNBT0K7kPyIK9ZMqoGeu6FpFzKW9M/rw3bh7wviACN+Jb5XWeMKYve2AqW7zJ1lwm/MBo7MI6uDpTFHPIg7fux/DJ/x5rPBsEN3T+iq5YdPAgsHugQUXLLF/p27OEn3vWvmk44+DT/2xgkmqyEScExnO+OSRWEd9lvNWxLl06ilMUuqLBdF75oKdHibeB6yFq+CQ4jxO7NM83z7u+DqS2t6WrK7rXJ/DdPinX+7xZOpEPmXOedAQJNz65wjy0/S0dxzYKyC3ZXXQaa/DYLQbiq518AJo1jclDwg1T/ZVIiZCL5hel1Y/AzJ1hJIf5ukONJ0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ra0J8gfBg1ZPmN06zQ8IQV2sjcgKKaR6kipA1wOf7Yw=;
 b=Xvra5h38lFH4ejAL0a9ggRqzbF9jf5/kJHgiJpWPsTpTg4SG0ZWFZGYviIHOmHPKxypArMDdihOzd707YX/l92DeZHW/qzRQuQJLSgtwxwy2eddQtf5UHm/zS8lTQGbUkRszoVcINcjoSbu1qY0v0vguISTmWsY0IPw8k0wNnI9Nq4i7sWG0NyaHjYfAzLbOGgHfWC/I1h+MOs+6YyfDl7JTncw0SXp+SiLHtX++DaGsJOddd8ASUyf2CQV/hCwIc7sqKQsqAqUcIdg81muAmyzfpryU9MzZpHT3SP7dHVYqujPwoJxHbEViKfI0fUgrYYxX4NASk6B7Fs0A5onmEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ra0J8gfBg1ZPmN06zQ8IQV2sjcgKKaR6kipA1wOf7Yw=;
 b=j3ItKYMNF0u35UBn8d4soHMY8mEPWtSI6SxImv/xg+PRA7sdBLy52KD6IGU+WwJyqC3rttzuFVyZc+/4DXLE1qZcAAk+PR5hJe92vznco0xWC/2AqTpjhpshWeovjnt3R230CbomGBRT+YqNpylSMdpqKf6XAdDEhtfwr3+1848=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Mykyta Poturai
	<mykyta_poturai@epam.com>
Subject: [PATCH v4 1/4] vpci: Use pervcpu ranges for BAR mapping
Date: Mon, 6 Apr 2026 15:11:55 -0400
Message-ID: <20260406191203.97662-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406191203.97662-1-stewart.hildebrand@amd.com>
References: <20260406191203.97662-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DS0PR12MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5b2dc2-93e2-4b79-286e-08de94106bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	LdFq5eGKg4P8fg+IDLyDQXwpB/GiiYoz+MSXZtijDN+YZ6KBFXs3IaJo1a9G4fUxD4FjOPFXlhxU0FnQwZAWIpwHQ3xdXj1Zus49dydoMzhyFqoUn6LP9kJl2kBvDkHgsEYvls9YVWsN5OBPA/Q7OV1p8EcaCxC87oim5jMeL418PqACiQdBtCv4lv6pUft+veHwnWUPez0I3+CxAzaRs8hSJPKeJUgFqpoOwYCC92pXwJsC5mkJFO/Vrng7kxsjeK/Ta2JzBnHd6fo/fjLS5mVGsj1HT9LRYEAAVcLO3FyqKjGrr69/NFiuwriGLFahXMDopUXSerxg7FhsY6DF3RHbxKt5gpHSiZ7NavVFZhlnYqpRlqLK44hSYXamQSyCblOmQcgrqNuwvJ+NSnrIriqmIbpBIeHh/NseRFe0x82qaNayRyiJWRcDs1Eb+kZ2YOC3VI1A28CVICBap0AkNz5CdgmAooAt71Cir/cODqlzkuJTLakNCPMIm71fHpvFmEo4gtk1psfFpO+JzPai9GITwbcGoSg8fgDgyzMBbxEkQ/JpByKuCbjPo/WV0I/iwr6BEkMugFa373MIDnajmDosPaWoOUY8PRPDmbQ34e8YFwqUJtVJ+6uiT3IWcB2TjdKybsWZ3uzbvFVpX3BjATzVrkTHkmhy4/pjaaB+lOvdAJ4AGvChCmcWNWYzoiKCYRkdeGNpUsuulI538REdiaun/tQ3jJmZfShlvsCjIMk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+uxT6HA7v7tEkDnHfXeiG84qUZrlP6mWQ5AT6sEZt4UAHyztezm7l6e/JwFLRQQ5R8fjnZS5lFseEK7egxjF+SfnuD9em73GkuTExtmnEP2Lkdxh991pbpgYTIzi4Xk0fdrYxPhIXICSag0ti9sL/Sc8AH8/9wnzDQZocvFaleobSqdAG10IyFkr0bRknT/3If63RTheryU8X8tCHcTZn8lz/87jZsWVWTtOCDQyZ4/X5uai/IR2mf8R7wSAZQUoIeRWjR1UmoGk+hY+qNLYARjEBi+M1GT/FzMYgzFR/FCVUTgai2Mcm1zdrhoVKQ2FTTbjnzYFmC7VE2CK8+VOuE7J/DIos/xNZpgNfmxSjcm7AmYyxK2zAHi11G3Fw4sjGQ5VRiPlXJ3JvsNgjqadp6AS6voHANapLjEckabxIEueaxEmK79Sw0Yfjswgv9Kg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 19:12:18.4559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5b2dc2-93e2-4b79-286e-08de94106bfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462
X-purgate-ID: tlsNG-c201ff/1775502745-3053396F-03571682/0/0
X-purgate-type: clean
X-purgate-size: 13875
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:stewart.hildebrand@amd.com,m:mykyta_poturai@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Queue-Id: 9B0C63A684D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykyta Poturai <Mykyta_Poturai@epam.com>

There is no need to store ranges for each PCI device, as they are only
used during the mapping/unmapping process and can be reused for each
device. This also allows to avoid the need to allocate and destroy
rangesets for each device.

Move the rangesets from struct vpci_bar to struct vpci_vcpu and perform
(de-)allocation with vcpu (de-)allocation. Introduce RANGESET_DESTROY()
macro to free a rangeset and set the pointer to NULL.

Amends: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
It seems a bit awkward to introduce various vpci vcpu alloc/dealloc
functions here only to undo most of it in the next patch. Thoughts on
folding the next patch into this one?

v3->v4:
* no change

v2->v3:
* new patch in this series, borrowed from [1]
* add Amends tag
* remove unused variable i due to rebasing over 998060dd9101 ("vPCI:
  move vpci_init_capabilities() to a separate file")
* enclose entire struct vpci_vcpu inside #ifdef __XEN__
* s/bar_mem/mem/
* use ARRAY_SIZE
* put init/destroy in functions
* only allocate for domains with vPCI and idle domain
* replace 'if ( !mem ) continue;' with ASSERT

v1->v2 (in SR-IOV series [1]):
* new patch

[1] https://lore.kernel.org/xen-devel/cover.1772806036.git.mykyta_poturai@epam.com/T/#t
---
 xen/common/domain.c        |  5 +++
 xen/drivers/vpci/header.c  | 67 ++++++++++++++------------------------
 xen/drivers/vpci/vpci.c    | 36 +++++++++++++++++---
 xen/include/xen/rangeset.h |  7 ++++
 xen/include/xen/vpci.h     | 10 ++++--
 5 files changed, 75 insertions(+), 50 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index bb9e210c2895..5ef7db8f0960 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -455,6 +455,8 @@ static int vcpu_teardown(struct vcpu *v)
  */
 static void vcpu_destroy(struct vcpu *v)
 {
+    vpci_vcpu_destroy(v);
+
     free_vcpu_struct(v);
 }
 
@@ -512,6 +514,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     if ( arch_vcpu_create(v) != 0 )
         goto fail_sched;
 
+    if ( vpci_vcpu_init(v) )
+        goto fail_sched;
+
     d->vcpu[vcpu_id] = v;
     if ( vcpu_id != 0 )
     {
diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index a760d8c32fd6..89dce932f3b1 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -196,6 +196,7 @@ bool vpci_process_pending(struct vcpu *v)
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
+        struct rangeset *mem = v->vpci.mem[i];
         struct map_data data = {
             .d = v->domain,
             .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
@@ -203,10 +204,10 @@ bool vpci_process_pending(struct vcpu *v)
         };
         int rc;
 
-        if ( rangeset_is_empty(bar->mem) )
+        if ( rangeset_is_empty(mem) )
             continue;
 
-        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
+        rc = rangeset_consume_ranges(mem, map_range, &data);
 
         if ( rc == -ERESTART )
         {
@@ -224,8 +225,8 @@ bool vpci_process_pending(struct vcpu *v)
 
             /* Clean all the rangesets */
             for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
-                if ( !rangeset_is_empty(header->bars[i].mem) )
-                     rangeset_purge(header->bars[i].mem);
+                if ( !rangeset_is_empty(v->vpci.mem[i]) )
+                     rangeset_purge(v->vpci.mem[i]);
 
             v->vpci.pdev = NULL;
 
@@ -260,13 +261,14 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
+        struct rangeset *mem = current->vpci.mem[i];
         struct map_data data = { .d = d, .map = true, .bar = bar };
 
-        if ( rangeset_is_empty(bar->mem) )
+        if ( rangeset_is_empty(mem) )
             continue;
 
-        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
-                                              &data)) == -ERESTART )
+        while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) ==
+                -ERESTART )
         {
             /*
              * It's safe to drop and reacquire the lock in this context
@@ -331,13 +333,13 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
     for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
     {
         struct vpci_bar *bar = &header->bars[i];
+        struct rangeset *mem = current->vpci.mem[i];
         unsigned long start = PFN_DOWN(bar->addr);
         unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
         unsigned long start_guest = PFN_DOWN(bar->guest_addr);
         unsigned long end_guest = PFN_DOWN(bar->guest_addr + bar->size - 1);
 
-        if ( !bar->mem )
-            continue;
+        ASSERT(mem);
 
         if ( !MAPPABLE_BAR(bar) ||
              (rom_only ? bar->type != VPCI_BAR_ROM
@@ -354,7 +356,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             continue;
         }
 
-        ASSERT(rangeset_is_empty(bar->mem));
+        ASSERT(rangeset_is_empty(mem));
 
         /*
          * Make sure that the guest set address has the same page offset
@@ -369,7 +371,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             return -EINVAL;
         }
 
-        rc = rangeset_add_range(bar->mem, start_guest, end_guest);
+        rc = rangeset_add_range(mem, start_guest, end_guest);
         if ( rc )
         {
             printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
@@ -380,12 +382,12 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         /* Check for overlap with the already setup BAR ranges. */
         for ( j = 0; j < i; j++ )
         {
-            struct vpci_bar *prev_bar = &header->bars[j];
+            struct rangeset *prev_mem = current->vpci.mem[j];
 
-            if ( rangeset_is_empty(prev_bar->mem) )
+            if ( rangeset_is_empty(prev_mem) )
                 continue;
 
-            rc = rangeset_remove_range(prev_bar->mem, start_guest, end_guest);
+            rc = rangeset_remove_range(prev_mem, start_guest, end_guest);
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
@@ -395,7 +397,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
             }
         }
 
-        rc = pci_sanitize_bar_memory(bar->mem);
+        rc = pci_sanitize_bar_memory(mem);
         if ( rc )
         {
             gprintk(XENLOG_WARNING,
@@ -412,14 +414,14 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
         unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
                                      vmsix_table_size(pdev->vpci, i) - 1);
 
-        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
+        for ( j = 0; j < ARRAY_SIZE(current->vpci.mem); j++ )
         {
-            const struct vpci_bar *bar = &header->bars[j];
+            struct rangeset *mem = current->vpci.mem[j];
 
-            if ( rangeset_is_empty(bar->mem) )
+            if ( rangeset_is_empty(mem) )
                 continue;
 
-            rc = rangeset_remove_range(bar->mem, start, end);
+            rc = rangeset_remove_range(mem, start, end);
             if ( rc )
             {
                 gprintk(XENLOG_WARNING,
@@ -469,8 +471,9 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                 for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
                 {
                     const struct vpci_bar *bar = &header->bars[j];
+                    struct rangeset *mem = current->vpci.mem[j];
 
-                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||
+                    if ( !rangeset_overlaps_range(mem, start, end) ||
                          /*
                           * If only the ROM enable bit is toggled check against
                           * other BARs in the same device for overlaps, but not
@@ -481,7 +484,7 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
                           bar->type == VPCI_BAR_ROM) )
                         continue;
 
-                    rc = rangeset_remove_range(bar->mem, start, end);
+                    rc = rangeset_remove_range(mem, start, end);
                     if ( rc )
                     {
                         gprintk(XENLOG_WARNING,
@@ -732,18 +735,6 @@ static void cf_check rom_write(
     }
 }
 
-static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
-                            unsigned int i)
-{
-    char str[32];
-
-    snprintf(str, sizeof(str), "%pp:BAR%u", &pdev->sbdf, i);
-
-    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
-
-    return !bar->mem ? -ENOMEM : 0;
-}
-
 int vpci_init_header(struct pci_dev *pdev)
 {
     uint16_t cmd;
@@ -853,10 +844,6 @@ int vpci_init_header(struct pci_dev *pdev)
         else
             bars[i].type = VPCI_BAR_MEM32;
 
-        rc = bar_add_rangeset(pdev, &bars[i], i);
-        if ( rc )
-            goto fail;
-
         rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
                               (i == num_bars - 1) ? PCI_BAR_LAST : 0);
         if ( rc < 0 )
@@ -909,12 +896,6 @@ int vpci_init_header(struct pci_dev *pdev)
                                4, rom);
         if ( rc )
             rom->type = VPCI_BAR_EMPTY;
-        else
-        {
-            rc = bar_add_rangeset(pdev, rom, num_bars);
-            if ( rc )
-                goto fail;
-        }
     }
     else if ( !is_hwdom )
     {
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index 0ac9ec8b0475..8e6343653078 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -24,6 +24,37 @@
 
 #ifdef __XEN__
 
+void vpci_vcpu_destroy(struct vcpu *v)
+{
+    unsigned int i;
+
+    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
+        return;
+
+    for ( i = 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
+        RANGESET_DESTROY(v->vpci.mem[i]);
+}
+
+int vpci_vcpu_init(struct vcpu *v)
+{
+    unsigned int i;
+
+    if ( !has_vpci(v->domain) && !is_idle_domain(v->domain) )
+        return 0;
+
+    for ( i = 0; i < ARRAY_SIZE(v->vpci.mem); i++ )
+    {
+        char str[32];
+
+        snprintf(str, sizeof(str), "%pv:BAR%u", v, i);
+        v->vpci.mem[i] = rangeset_new(v->domain, str, RANGESETF_no_print);
+        if ( !v->vpci.mem[i] )
+            return -ENOMEM;
+    }
+
+    return 0;
+}
+
 #ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
 static int assign_virtual_sbdf(struct pci_dev *pdev)
 {
@@ -89,8 +120,6 @@ struct vpci_register *vpci_get_register(const struct vpci *vpci,
 
 void vpci_deassign_device(struct pci_dev *pdev)
 {
-    unsigned int i;
-
     ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
 
     if ( !has_vpci(pdev->domain) || !pdev->vpci )
@@ -116,9 +145,6 @@ void vpci_deassign_device(struct pci_dev *pdev)
     }
     spin_unlock(&pdev->vpci->lock);
 
-    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->header.bars); i++ )
-        rangeset_destroy(pdev->vpci->header.bars[i].mem);
-
     xfree(pdev->vpci);
     pdev->vpci = NULL;
 }
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 817505badf6f..f01e00ec9234 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -40,6 +40,13 @@ struct rangeset *rangeset_new(
 void rangeset_destroy(
     struct rangeset *r);
 
+/* Destroy a rangeset, and zero the pointer to it. */
+#define RANGESET_DESTROY(r)  \
+    ({                       \
+        rangeset_destroy(r); \
+        (r) = NULL;          \
+    })
+
 /*
  * Set a limit on the number of ranges that may exist in set @r.
  * NOTE: This must be called while @r is empty.
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 877aa391d178..b55bacbe6e01 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -19,6 +19,9 @@
  */
 #define VPCI_MAX_VIRT_DEV       (PCI_SLOT(~0) + 1)
 
+void vpci_vcpu_destroy(struct vcpu *v);
+int vpci_vcpu_init(struct vcpu *v);
+
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
 
@@ -54,7 +57,6 @@ struct vpci {
             uint64_t guest_addr;
             uint64_t size;
             uint64_t resizable_sizes;
-            struct rangeset *mem;
             enum {
                 VPCI_BAR_EMPTY,
                 VPCI_BAR_IO,
@@ -152,14 +154,15 @@ struct vpci {
 #endif
 };
 
+#ifdef __XEN__
 struct vpci_vcpu {
     /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
     const struct pci_dev *pdev;
+    struct rangeset *mem[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
     uint16_t cmd;
     bool rom_only : 1;
 };
 
-#ifdef __XEN__
 void vpci_dump_msi(void);
 
 /* Arch-specific vPCI MSI helpers. */
@@ -204,6 +207,9 @@ bool vpci_ecam_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int len,
 #else /* !CONFIG_HAS_VPCI */
 struct vpci_vcpu {};
 
+static inline void vpci_vcpu_destroy(struct vcpu *v) { }
+static inline int vpci_vcpu_init(struct vcpu *v) { return 0; }
+
 static inline int vpci_reinit_ext_capabilities(struct pci_dev *pdev)
 {
     return 0;
-- 
2.53.0


