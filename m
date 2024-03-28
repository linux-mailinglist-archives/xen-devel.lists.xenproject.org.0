Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5FB88F7F3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 07:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698788.1090927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjLO-0005ZM-Fh; Thu, 28 Mar 2024 06:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698788.1090927; Thu, 28 Mar 2024 06:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpjLO-0005Wj-BX; Thu, 28 Mar 2024 06:34:34 +0000
Received: by outflank-mailman (input) for mailman id 698788;
 Thu, 28 Mar 2024 06:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dwcp=LC=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rpjLM-00050u-E8
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 06:34:32 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b92d407-eccd-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 07:34:31 +0100 (CET)
Received: from CH0P221CA0033.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::16)
 by CH3PR12MB7643.namprd12.prod.outlook.com (2603:10b6:610:152::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 06:34:28 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::7a) by CH0P221CA0033.outlook.office365.com
 (2603:10b6:610:11d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Thu, 28 Mar 2024 06:34:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 28 Mar 2024 06:34:28 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 28 Mar
 2024 01:34:24 -0500
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
X-Inumbo-ID: 3b92d407-eccd-11ee-afe3-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDnsY0AKH6681xE1EPsFzdjCiSH06dzGs4PjsqGDcmzV85WOc5NAfMUgV/w/xyHhjOTWo4jy6MAM2xRNdAo/ZvXDWPec2xf96uRkf4o/tM0QwXkxMJMQEPQd4yndA3qu0KPgKCDGy3nWx6dFutWLyP+QNehlZ0XWrnZPAquMt5oOolLL3qd5sPI3qBhlFnFhTRrfK6nh31RB6+wXDs9QFAhnHyDP9vr5QUfVZp8G5/xDJM9E+OPc+TJZhvcaNWKXWiF28c1kwsTbwBeNHWKqJlwHm6XfyaSwt08+uoIcTOBeWzkx6j5aHvaXYNtzI3BajV13gfGtdIcjaGU8+1PGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTeOXa1ofsJQ5UT1Y6+HKhMws9Udhj7EK29Ce+m9250=;
 b=KaAwV+R0RXIilfP4Vh9JraPN1lqiiIQ2KcrX6sF0nIH4Wo4vw4SmtfUgL7DUT/bXJHi3QTubCaUybXkH9wKBlpgeWaQw829qGdyeriRw1doF6+zP+4XAtDKJKr3Yn+dwdYEEirV/Cz3O7yBzrs8UnHeXKUQMEBDfjbDVXCZ1Dfq0ebjnt8FfmKYtruV7EeCVCfxbhUyikzVEIhbFJ8XFhSXTkq3yHZo2G0AlnGPYoStQl9PNjXkLthsX6VyBah6q6ExYgiT/+6bbquB3IVh9VM2tERweKxconn+WO/AeTo5etoMhOgnigqyzWmen0S4SiQAaOsJSROBN/IqbNZA7UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTeOXa1ofsJQ5UT1Y6+HKhMws9Udhj7EK29Ce+m9250=;
 b=yyPk4irt0W9Owz9a/FOQK8d4cBc0MYy6GUHTBrVTojEOwB7oAqXkgkjrEhjSCmIjHbldk6huK/BZC90K0m+AaVLfOLwdfSgAB2J1fsNELcSsdmtjCG3NKOJJF2GyeDU5C4oaH3dw7otCZ0kEbj3kp+BS04+WI0EjTMeCjH1XVko=
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
Subject: [XEN PATCH v6 2/5] x86/pvh: Allow (un)map_pirq when dom0 is PVH
Date: Thu, 28 Mar 2024 14:33:59 +0800
Message-ID: <20240328063402.354496-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328063402.354496-1-Jiqian.Chen@amd.com>
References: <20240328063402.354496-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|CH3PR12MB7643:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a6572a-c32c-42ba-f968-08dc4ef11e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I4jGdZ8Ja8Pzf+GgJioj731p/MNNzzHTDgKIAn3rjmC/NjwEsAwbyGuwFnaWrsYfo36yDCh8HUaqlBScmMy3/T8E4hlMcaCo/xvcaQl5WFV6j6UPXpHqt/y7O/v5t+A62dLje1nVP4MAxc3IAc/rZ/MOc1Uw6lanvRc4eE5/HBhOAJBEfaXqjvviZzNAzTp1/aISfIHR26ee1WN0rmcqMcnsWEwvUJGFthYsD07Rhyg5BNC7jWVnuXMy+KcccDCXQHdnVpHvrEgWIm79xRn46NvhtTTG4CY7wJ/YmRevGHfnYb24+FKIVY2aNqGvUm3yJPgef1u4wk7smhK8dPzwXntOo5coSk1j1f4cvcX+68MR6HPUOBO6G0LqwANgoABuyTluceASkgbVlSdB9gutmyTWNwEwoI5d4j+7hkhGGZCCeOVbEsRWuNsmKqegD4zdZ98q0Ymt67dqNQg4yHlX44YCGh3JZPJ/fZgR6ucctA1FaDJpA/RV3M3ixd7Hy9mjdWOZW0AJk8MZiPHX70suNStHTsG7fd73Ea/IAP/GaZ/cDIRZBEq2E8hLmuEdulUsr3MpAOcPKFpFgGDYgEoFQ9kRRj9rH1MbqvVZy486TCRDl3WiUosy8Dy+fYKuLHxdFTzey1eLXqB0M2sOpsRYx/E3qgoo6F87Q1AXOAJsZOrfaO/WxHe4fpL3ZZUIWVixlHlJJpKDViSblFB0Bo6tlNDdCz4sWFzUbuQKOVmuB0O4MaOgjTMjJ3dXNe/qs4I7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(7416005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 06:34:28.3685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a6572a-c32c-42ba-f968-08dc4ef11e6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7643

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

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/hvm/hypercall.c |  2 ++
 xen/arch/x86/physdev.c       | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

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
index 7efa17cf4c1e..1367abc61e54 100644
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -305,11 +305,23 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
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
+        /* If it is an HVM guest, check if it has PIRQs */
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
@@ -343,11 +355,23 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 
     case PHYSDEVOP_unmap_pirq: {
         struct physdev_unmap_pirq unmap;
+        struct domain *d;
 
         ret = -EFAULT;
         if ( copy_from_guest(&unmap, arg, 1) != 0 )
             break;
 
+        d = rcu_lock_domain_by_any_id(unmap.domid);
+        if ( d == NULL )
+            return -ESRCH;
+        /* If it is an HVM guest, check if it has PIRQs */
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


