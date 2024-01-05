Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FCB824F00
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 08:10:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661983.1031865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeLD-0001yd-U7; Fri, 05 Jan 2024 07:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661983.1031865; Fri, 05 Jan 2024 07:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLeLD-0001tX-NP; Fri, 05 Jan 2024 07:10:03 +0000
Received: by outflank-mailman (input) for mailman id 661983;
 Fri, 05 Jan 2024 07:10:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YI+5=IP=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rLeLB-0000zx-G0
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 07:10:01 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ce5f08e-ab99-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 08:09:55 +0100 (CET)
Received: from PH7PR17CA0028.namprd17.prod.outlook.com (2603:10b6:510:323::8)
 by LV2PR12MB5821.namprd12.prod.outlook.com (2603:10b6:408:17a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Fri, 5 Jan
 2024 07:09:51 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::f0) by PH7PR17CA0028.outlook.office365.com
 (2603:10b6:510:323::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16 via Frontend
 Transport; Fri, 5 Jan 2024 07:09:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 07:09:50 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 01:09:46 -0600
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
X-Inumbo-ID: 6ce5f08e-ab99-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6tqJ1o0BJp7rd1FHwuK016caGGlEZSBy91owYqcZEeoH3A6gijdN69nYBtDNbrbNrYkojKFGIsPPukFefQMgr6MjI9DXkA1GYtwffMuGw3cBjCOR84TghDTMbAJXEL0hq0By59ZdJ7qoW6OJKgSQYBNShZafFxR5Ri/O25LT92sKQzLWsXHCjhNkYkmGg0NodMd+a80M9bYyEeVPVq/YBs/vg08g3W1pmzF9DkjGbg4XCffeQ8SQpeRY9bTkS4hTqEvO/zPyF0MBtvm4kd1lBm0AnGchFujmdkQnBITVZ1f8txHKl7r+kwr1nLffMaiQrZJiin+YLM0TKCwlhj5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxn0adhoslWIcg9D/tXdZK/xxeNrhrHf6QBk9BQZz0A=;
 b=nsIYaKCSI6Z6wnHX8Piu35RZe28lZNJKZjQ5ZD01AqOHe5ZnoHJyIYqZjvmCDnaRjAEPobt7syR6HF+e35odRVqdoU4Stfoh/5fNzQ4nB5oa61+KSqDt6IdSlMrhU1cYx/0Cp8IdUdo7qBFQ8TUiaiYt6F9g2ym0Xi5meyKVAqX9AJcAANcfmyTreOXKL2tx6PabjQVj66fdMzUuEZ+outbr6I7xpvPCu0IgdgpJmQUp2WHgfD+tQyGwdnJHpyTfbtnAYI1XZItcch+MKLqNYab7DUQ6WncaWnj2+wlSm/bxXJQICBp9Gw2nHhBHafYR8yKO+SeAmKK2cL7ZGOU23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxn0adhoslWIcg9D/tXdZK/xxeNrhrHf6QBk9BQZz0A=;
 b=tT/wugzSZ61MPH3iEELpzScqjEdsuF0MHBujxTCrYAfOSTleYgWxxZ4RPG+v/q39l/Dlnf39Lpd/y1f0/RRfrJivRw2gnGOGWJmiillhgZZSj04LZ/dDAiucBwHAeFiS3Ob9jAtaCYqVfmUwb2Purs4OA7Fv8S0KpmjVtN0dDys=
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
	"Juergen Gross" <jgross@suse.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [RFC XEN PATCH v4 2/5] x86/pvh: Allow (un)map_pirq when caller isn't DOMID_SELF
Date: Fri, 5 Jan 2024 15:09:17 +0800
Message-ID: <20240105070920.350113-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105070920.350113-1-Jiqian.Chen@amd.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|LV2PR12MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b343a8-97bf-4c6c-9e04-08dc0dbd4f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UVcaDDInTWyOMMhUoc0J6PcykjQ1/GRev4KGyp4EIfbwmia74RAEGv9cz1TG/1SgDQ99iDpcuArn0U3BOjN+PpA0X3lPHsj1KZXhglLmtkWPz8nh8fzPLHzg2sZHwXsCKBqby4M1lUZi0Vcbb80A0hsaSsS6Vm+p67YuaugPaHSjVqdpB5YFik1OPE+OIuvtBF6PUkxb9WbMdwRUvL9gU3lPSgCLWI/jqDN2+DlcNOMmWOdEWpG1zy1ww9mT1M+I8N+HqmaW0CyRqORuB21AytlhEM+bAYDoryZdxyb8/pbuAqYvCL5yRr/NqyfESe1LdoUqQ222VoLtlT0AiUOUUkF9leV3rSChFuLztleOpl2WfwGt4O5+cgSKDoO0nXc3niSE61RU9Dkk3rb06KGy9zXwm5D013ayJ92u9OwynZMHmJljZK8kFsfHd7Q14TrUd8aejAqyoGEVyuupOXWJiKwsl/XM+LMUx/xQ9n0lB/QQQblu7Ik53HyRt4r8ALC1/bl4eR9U+kEQRMnvQ6NYKRmQHT0OQ783H2SOySSSoRpsCqdc/rh4LARoCCTJPC706Dmfcg/OXny2lgJEe5dk4Tw5MgN9MfEFZTzgEttryTsM0XPHTtA4EGIk+6cd1tGkFzQdukGy+ZP6JlDYzvh/z1uzDd+BSFNaH0R1n61GCsg5FPUVmXkpEfDoM46q89fqT1YWfQbe7bGeXByIXulLWQaSqq7NNR6PNaGsHqaxbRDuuqcrw1h+bKc2m27ileQkzfeDaNAoydeyF/rkVSoHVQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799012)(40470700004)(36840700001)(46966006)(40480700001)(40460700003)(426003)(26005)(336012)(7696005)(478600001)(6666004)(82740400003)(36860700001)(86362001)(36756003)(81166007)(356005)(83380400001)(2906002)(16526019)(70206006)(5660300002)(54906003)(7416002)(41300700001)(2616005)(47076005)(1076003)(70586007)(6916009)(8936002)(316002)(4326008)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 07:09:50.7487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b343a8-97bf-4c6c-9e04-08dc0dbd4f2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5821

If run Xen with PVH dom0 and hvm domU, hvm will map a pirq for
a passthrough device by using gsi, see
xen_pt_realize->xc_physdev_map_pirq and
pci_add_dm_done->xc_physdev_map_pirq. Then xc_physdev_map_pirq
will call into Xen, but in hvm_physdev_op, PHYSDEVOP_map_pirq
is not allowed because currd is PVH dom0 and PVH has no
X86_EMU_USE_PIRQ flag, it will fail at has_pirq check.

So, allow PHYSDEVOP_map_pirq when domid of the caller is not
DOMID_SELF no matter whether currd has X86_EMU_USE_PIRQ flag
and also allow PHYSDEVOP_unmap_pirq for the failed path to
unmap pirq.

Co-developed-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index 6ad5b4d5f11f..632a68be3cc4 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -10,6 +10,7 @@
 #include <xen/hypercall.h>
 #include <xen/ioreq.h>
 #include <xen/nospec.h>
+#include <xen/guest_access.h>
 
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/support.h>
@@ -72,8 +73,30 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     switch ( cmd )
     {
-    case PHYSDEVOP_map_pirq:
-    case PHYSDEVOP_unmap_pirq:
+    case PHYSDEVOP_map_pirq: {
+        physdev_map_pirq_t map;
+
+        if ( copy_from_guest(&map, arg, 1) != 0 )
+            return -EFAULT;
+
+        if ( !has_pirq(currd) && map.domid == DOMID_SELF )
+            return -ENOSYS;
+
+        break;
+    }
+
+    case PHYSDEVOP_unmap_pirq: {
+        physdev_unmap_pirq_t unmap;
+
+        if ( copy_from_guest(&unmap, arg, 1) != 0 )
+            return -EFAULT;
+
+        if ( !has_pirq(currd) && unmap.domid == DOMID_SELF )
+            return -ENOSYS;
+
+        break;
+    }
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


