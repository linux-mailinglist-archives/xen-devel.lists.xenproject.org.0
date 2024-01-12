Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009B082BB2B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 07:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666641.1037406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOAp4-0000ub-NM; Fri, 12 Jan 2024 06:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666641.1037406; Fri, 12 Jan 2024 06:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOAp4-0000pz-Jo; Fri, 12 Jan 2024 06:15:18 +0000
Received: by outflank-mailman (input) for mailman id 666641;
 Fri, 12 Jan 2024 06:15:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/PwP=IW=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rOAp2-0000lq-Vh
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 06:15:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e88::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2a87704-b111-11ee-9b0f-b553b5be7939;
 Fri, 12 Jan 2024 07:15:15 +0100 (CET)
Received: from CH0PR04CA0053.namprd04.prod.outlook.com (2603:10b6:610:77::28)
 by PH7PR12MB8105.namprd12.prod.outlook.com (2603:10b6:510:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 06:15:10 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::39) by CH0PR04CA0053.outlook.office365.com
 (2603:10b6:610:77::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19 via Frontend
 Transport; Fri, 12 Jan 2024 06:15:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 06:15:09 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 12 Jan
 2024 00:14:45 -0600
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
X-Inumbo-ID: f2a87704-b111-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEK9yXfO6tP5hio9WqBB9KCPYb94o2r08SrzJhzSf8aJAFBQzqdkxUfhQb1cXyETqAQQumbasCptenl/AV44CvdwzkLcaV72IVHVbOg4oXalrsY8PcWwup+af3onL9ZL8BZ1Pi1LZNIEb+vCW9hYmXOxceiBGYxdO0GJnZWMsclMnb4cfWbGafkgF0drv1ShhDnCLZ/flv1xc2BLuWH4r8tmXajn4ZQXyMVtLl6sWig113ocVWW2F9k0immmCPKkNFwzKukhgjfntCOSyqJiTrWmSXGJ2+GzWrdghLOw1NVBSH2gUS2WtfRfMF+jg76z2JFvnzDKEglJEcknBYpzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hT7olkd/7ks/vk3IK/hSUDJvUuE/1TeMe3oCQr0a9xg=;
 b=FkIMwASHzRsLEFy9zOMTXIRY7iaqq2P7cm+1aT1tqcOe0PV4etJoybGcK45rHh8rb6V4+bbFxtkMKG0NPaffAyg3eau+FNWWM2/xoGZWNCJD31+le/lxcBfvUku6xIrY3zrnTZF0kYxsf7mLCsVXQghmT37eKyw03tMDfnTyxp+CIqElwlEyjcj3OdFejLpme7KRctdjH2UA8xdMyTp2Xpj3Ta0ZG2S2TvKQE7esudSDXftShXin5QOsLrSZ7asb5ROH7dS2XFidZ38HSEflJn6YAXVfWJgKCtf/M1ufEaXgxa4B5nv2Vrn8Cc46YRLoV1QMcKrTMIHhvuF3j9NOsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hT7olkd/7ks/vk3IK/hSUDJvUuE/1TeMe3oCQr0a9xg=;
 b=CvvpoFdo79N8RYBwtScGWo4oqBpzvW9V+SdXb81KaTmVVuZLjNjJaicmmJBelAMljsfVSLWf1+R47037AUJSy86ujRFnmt9Ne5Em2rGXvxnKW1yr3rpz328qDylbjeZ4k1keZeEG58JsbEOzCOk1f8B+DOI4wp86ggdj3JR0qZY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Juergen Gross" <jgross@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v5 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Date: Fri, 12 Jan 2024 14:13:14 +0800
Message-ID: <20240112061317.418658-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112061317.418658-1-Jiqian.Chen@amd.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|PH7PR12MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 020d4c8b-736c-4e90-b461-08dc1335d477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8VvNN+qndOmFudVWRF7+yZpliVTmD811oq9YaaXy0cexfFrrHq9DnU2/GToL9ypivKazqqqsS3I9XbIVip5BYfp0rwcodGceOIs+WVrIGpQDGf6Bv62l+uY9S/djUrO/vJ2iZaSoLpYIiNRkSo/RzbSXgXlvn5JU5MKE92ulHr03igej3yS9pKwyUkWhTSmKpYA1I7RDDOBqW5GadSTtMxR/7cZGBtR19/5SKQzvJHLGlWgi6+IjCO52uWrsnE2lTnf8Xfk/DrDbiYsn3eu+9scSrFoEozbyKixmff91Jsc8tqNHIg8PQ9C8ac6KQ+D6+QjKyjfz8u296+Y5unXYv94wMgHrsJiPCajgh8byjoa5x+3Un6aj/MqwaZ4fpNzDl1lSMHM88oWk/cxFLQJkZHaPjsb5ly46seQjQvE8KwPpEPOBvk596JzQ8lScnl9fxSslftHXwe+RRkHOxJua/cZQe4gZEKlEGszxqqg/X6tcCyWr0XZ+XLTC/xn5QhlQ/WJkhIqVewRtQEHD/7X/jz7EBb+aPzldl/2k0R3iYIT5FiQvIT5TcrQZ8nxCTcXiFxsuR4BncRDFwDIe0L38DKwP7fUyBPyI0wQD7KxEpV5CWZ6sO13tJAEwe0dR2PfBsk2U8EM28GDRTj51BOB+DPGwonr++9u/5wdrSSWA/zBW2RFngI1wDDWAq1CxrfK/Ahlc/6ouTPyzoikDZAlaIp3RsneNvuBony1MFL5+sAp7Q6iqYOAymXghMxM5xoyejQfIEh3J5yLhj0zUfinunA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(36840700001)(46966006)(40470700004)(7696005)(6666004)(478600001)(426003)(336012)(26005)(1076003)(16526019)(2616005)(6916009)(316002)(36756003)(8936002)(8676002)(70586007)(70206006)(54906003)(356005)(81166007)(82740400003)(83380400001)(47076005)(86362001)(4326008)(36860700001)(5660300002)(7416002)(2906002)(41300700001)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 06:15:09.7639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 020d4c8b-736c-4e90-b461-08dc1335d477
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8105

If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
a passthrough device by using gsi, see
xen_pt_realize->xc_physdev_map_pirq and
pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
is not allowed because currd is PVH dom0 and PVH has no
X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.

So, allow PHYSDEVOP_map_pirq when dom0 is PVH and also allow
PHYSDEVOP_unmap_pirq for the failed path to unmap pirq. And
add a new check to prevent self map when caller has no PIRQ
flag.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c |  2 ++
 xen/arch/x86/physdev.c       | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 6ad5b4d5f11f..493998b42ec5 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -74,6 +74,8 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
     case PHYSDEVOP_map_pirq:
     case PHYSDEVOP_unmap_pirq:
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
diff --git a/xen/arch/x86/physdev.c b/xen/arch/x86/physdev.c
index 47c4da0af7e1..7f2422c2a483 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -303,11 +303,22 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_map_pirq: {
         physdev_map_pirq_t map;
         struct msi_info msi;
+        struct domain *d;
 
         ret = -EFAULT;
         if ( copy_from_guest(&map, arg, 1) != 0 )
             break;
 
+        d = rcu_lock_domain_by_any_id(map.domid);
+        if ( d == NULL )
+            return -ESRCH;
+        if ( !is_pv_domain(d) && !has_pirq(d) )
+        {
+            rcu_unlock_domain(d);
+            return -EOPNOTSUPP;
+        }
+        rcu_unlock_domain(d);
+
         switch ( map.type )
         {
         case MAP_PIRQ_TYPE_MSI_SEG:
@@ -341,11 +352,22 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     case PHYSDEVOP_unmap_pirq: {
         struct physdev_unmap_pirq unmap;
+        struct domain *d;
 
         ret = -EFAULT;
         if ( copy_from_guest(&unmap, arg, 1) != 0 )
             break;
 
+        d = rcu_lock_domain_by_any_id(unmap.domid);
+        if ( d == NULL )
+            return -ESRCH;
+        if ( !is_pv_domain(d) && !has_pirq(d) )
+        {
+            rcu_unlock_domain(d);
+            return -EOPNOTSUPP;
+        }
+        rcu_unlock_domain(d);
+
         ret = physdev_unmap_pirq(unmap.domid, unmap.pirq);
         break;
     }
-- 
2.34.1


