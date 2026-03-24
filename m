Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLdXMKX/wWkjYwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 04:06:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15005301763
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 04:06:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1259994.1553324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4s5K-00051h-11; Tue, 24 Mar 2026 03:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1259994.1553324; Tue, 24 Mar 2026 03:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4s5J-000507-TQ; Tue, 24 Mar 2026 03:05:37 +0000
Received: by outflank-mailman (input) for mailman id 1259994;
 Tue, 24 Mar 2026 03:05:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Stewart.Hildebrand@amd.com>) id 1w4s5I-0004zb-HS
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 03:05:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4s5H-000PZN-0F
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 04:05:35 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c1ff71-2eae-0a2a0a5409dd-0a2a450cb740-8
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:05:34 +0100
Received: from [52.101.57.65]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <Stewart.Hildebrand@amd.com>)
 id 69c1ff7d-f93d-0a2a450c0019-346539417bf2-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 04:05:34 +0100
Received: from CH0PR04CA0037.namprd04.prod.outlook.com (2603:10b6:610:77::12)
 by DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 03:05:26 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::5a) by CH0PR04CA0037.outlook.office365.com
 (2603:10b6:610:77::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 03:05:22 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 03:05:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 22:05:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 23 Mar
 2026 20:05:24 -0700
Received: from ubuntu (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport; Mon, 23
 Mar 2026 22:05:18 -0500
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
 b=iUzKH7dVbODvzzcf9wFX+mMB+ls0fwpjSwfY/spix55aZYpf9zsk+zRtUXa0tI2U34oF8fL6gO3sFdLBLQRJRkGGpX73JB74t3mVBRRqZBABdU9M6oaUGXwER423l54RQHxtowoi/orlbRiDXS1qU9DygjhoD6QPFz78GXRm5m0fZYr8xD8nwYvX9ay2G1MM8KTMy+N6KaoncPFlWWBPODnt9YZoWrUE+sS5KmfDqIGvN1rXjGgq5u7dapydAljQicfinCixC4tnPylD6RB8ebXYLji3j8ej/YC4+XcCkkfgSj+DJD5uspGQPFBTKQGcq7qSn7T3fxVcrz6o0SljsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WV4egNB9TZnwYaKXYh+Rx+h6myhXgHRBXuqY5UHC8lA=;
 b=niYTQ7D1YGB2rwz6GVUeOKz6OyzOjsef29exO8kSGI3wdH+Ulx9rFukNeQRf2YA8m2FrSfez/BfLUOPZeEHpOfQmgqybJ2spyB/s3/pJenayoUlzzZXVxS+eNU36t8t6Qo1NuNOsupLcgO1WpicR3KSD2cjULp7sGYtAQPS89zjE5H3cG2jMEAGxBY5EJaR9SN7eLO7JK/lfAeip4t5KizT+9vkIYDUY2RaXp0+MfZ/L1cXljkwwU6aQ34psoSKwvN1n6gNKy58S4FPjq+RnqpzXWksGVQP188dL1ObWvD72AQdQCjBZosadGQucpS7BcR4Anxx5duDRNuYy31yXHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WV4egNB9TZnwYaKXYh+Rx+h6myhXgHRBXuqY5UHC8lA=;
 b=jWZ9uBJ2PNbzelkMorHyvrlNP0RLQX3OW8LxShu8eJaHcjl9nBmHHx1jWeFyydMGmOCBObAzrAXoQsOT2qk1mKj/OqjibVXlFTle1CxH72vfjOhrYVoNnSKJAXbuCgezRdb76xNx9RuxrT9XXcz6dZZch6WbdbFpNxVMIjKejbc=
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
Subject: [PATCH v3 1/4] vpci: Use pervcpu ranges for BAR mapping
Date: Mon, 23 Mar 2026 23:04:58 -0400
Message-ID: <20260324030513.700217-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324030513.700217-1-stewart.hildebrand@amd.com>
References: <20260324030513.700217-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DS0PR12MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 4654589d-1a34-48cf-4706-08de89523216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	iFiBXUIUwtUnq4rUul6RIHRH7AzoRojO4DT4HZU4fziWJqGKjQESnI50ZcAZu5u5YjW4rFnqQzIhglGa2kLwzY1O2pSsH0kq7x4KGvNG5OhgImZGHu6LY5UIWrN2G12Pcy2Mx6GzuxB2nAIGpBEVFEsbkI2sJkcI3fuzJEJhrmNz6gymko9IvTgf9Xxy9hB1Zd2ElQocFfaV0NPA2gti3XVQmmalXRmUurCyp8EF9DruArRELQ66vDlLFDPBFc6m77dfTKG5C5/gSZ8QJeZyy6RjAL9ndfwd9kIX0+ptLE8aJmE7qySgkEjHwguQahW8uRZzzFhGtfStpT1yZeWOpt2Pfzm1kT9buaNFltKkXflNcKF05MevLFp+iLXgqziq3IB1om68qV+18xsADTnIQWdJzZ2BLh8qszSD8dv/0gLt8nMbXY9avUlkGO6e6o/qGO8jFPb0cgYJjg7NfMqgJbVw05Bq4ZZFUDTGrEji1/KJS3IxpHsCHTHho//Ui/t3Ctxys9ITWrz1R/3J2D9I+aYfaVSYNRIldwdmU9Ki73FGT704NMZpDp9YDbRzaLAB33DlTayF1v9C56knJb5tyDiii4vUAADZylu+DUrBwBpjA+PPSjCkP6Y0uTyaWdQ0l/heNEbT0aRCrV9VRpU45J8TK4g1EvgpwwIdVXpZAEfdqcVViOdDoAs1SAo6LJ1NxbGnjLfsFR+G4ALp2gqJ7i/X5JRsYGswm9PgFi+PCH0cuS++Xsu9sKgyYkD10xOT3lA8gsqJgjAoZ6z7Wq76akbW6bg3uNgFTx7w1Vm5wTQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fvS2nnfS2Cw9Xx6KrESkgkNJ4G6xN60Gb5csxTQiVlcaSvW/KkZIqL2hs5Qk3HSK2ODm1bRo6awg2tyAKN+7pVM3RSEUTk9+XpW7d1sOfF4f5COaYP1D1R576lQtTaqY3nCnjUleWQ5J6NzKLXZFttGSeoHg79BrbXvAJ0lQWkCctKhE1lHnx0Bpk2w4B7Khz0h876oY5WVwu8KPQhw3fN42SusYzC3ADjtXVYrYKysU5CPuynrFMMiRkp+Q8O78O84RHknnYqrwhTGZUor6qFmpeaQtO9S84y6CeQdbt/FVmfPXfO5+nlvm5u/NGsvrerIRC2zvO7wYDaZ8NdzxnuWOG/H44Xfin0PuIF3wMLRQXqSKmLeYvWb61RTZId4V8A2i5rizQ7RtgJ+Bl0pZRt65kJT16ybwgmPKsINawadhnbOZJ551h3nVKL5XeGqc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:05:25.3303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4654589d-1a34-48cf-4706-08de89523216
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8245
X-purgate-ID: tlsNG-d25034/1774321534-FC82D734-862E4D03/0/0
X-purgate-type: clean
X-purgate-size: 13670
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 15005301763
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
index ab910fcf9306..498357fd0f11 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -454,6 +454,8 @@ static int vcpu_teardown(struct vcpu *v)
  */
 static void vcpu_destroy(struct vcpu *v)
 {
+    vpci_vcpu_destroy(v);
+
     free_vcpu_struct(v);
 }
 
@@ -511,6 +513,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
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


