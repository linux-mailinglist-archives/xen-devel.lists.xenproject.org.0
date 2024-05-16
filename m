Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE5C8C742F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 11:53:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722963.1127423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xnc-0000LR-I1; Thu, 16 May 2024 09:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722963.1127423; Thu, 16 May 2024 09:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xnc-0000HD-Co; Thu, 16 May 2024 09:53:20 +0000
Received: by outflank-mailman (input) for mailman id 722963;
 Thu, 16 May 2024 09:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hz7T=MT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1s7XnZ-0007bz-T2
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 09:53:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d203c57-136a-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 11:53:15 +0200 (CEST)
Received: from PA7P264CA0370.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::26)
 by PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 09:53:12 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10a6:102:37c:cafe::39) by PA7P264CA0370.outlook.office365.com
 (2603:10a6:102:37c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Thu, 16 May 2024 09:53:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 09:53:10 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 04:53:01 -0500
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
X-Inumbo-ID: 1d203c57-136a-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1rE27mHKPAIUX1BJpa/4cvELdUqOIcj4+RK8KkrnIEyHhS92dq8wtrydkYWfKjgLRiMulJwyYEN5PkKSQHlNnrBL/yB6TwYURfuyaBraPcEGXhnASh++0hL6ds1lbOAY0D8uQ26TNXjKw64X16SDnDihY3VqCxDLMr8mg86qPfVQbMh1e7+xJVInUqXHit8SdE5BKoMcWfDkm/g1iEPUAj9Rq6Gqz0oLWZK26O/vphuFWjE381flI64HY5Ma1r1nYF56Tul57UYKDoob/cacAgHBsLGNOL1GjYqecjFXiRxPFxkRWoW7OSgDNbzL2/KbQAxkvfu5zJ/CRf5o6dkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cppfuA3qPefeFbRlxjFzL7F92H5/rzEberk3T4m9jZg=;
 b=fcm4xvMIShHbeX96S0BHoIqkBm0YWyC8e+8Ug8tNRfBtc03MQa3Wrk2KHZVnX+kI6QoFvdqXOahE7BiLygYfz21BIq9pAM3A9XAsoao7zlMqmtS16LRKsnnf8uLVIyw/kyZTT4hZMwMeykJvORDT5kozHlcIl2S+oyVnBQ3BdWQcXON+fjhgQhDwMKFUSVKWonpXvCnVqjnHR+VAnEz2N3yWFPwJ+4/EFUo4OtpbMd7MLIdLDKfyKGnl3hnmUCq4lWCIf31fxYzQrPG7ApVv9c9bg0dbhqP6bTMd1wysdlV1DN6aBq4+dfF025GaUcjDiwyUgK3NdQco/IYjR+yJrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cppfuA3qPefeFbRlxjFzL7F92H5/rzEberk3T4m9jZg=;
 b=xWXWI5fIIGkwBGQxGEcLOX6B7MVYi09ZSUHxS7kcOvKVHNoXIg3MqqgBvv9dfWyBmpqnCCibRdupi/djZ0jVodEW2Fuz1wiEGO3f0GwauWlilSK9Ois2zrgBtdL1tZWEwHMlzXDQDB1HShfVVLQtu+21SqeXHVKk7BwKhbYhOgU=
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
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Anthony
 PERARD" <anthony.perard@cloud.com>, Juergen Gross <jgross@suse.com>, "Daniel
 P . Smith" <dpsmith@apertussolutions.com>, Stewart Hildebrand
	<Stewart.Hildebrand@amd.com>, Huang Rui <Ray.Huang@amd.com>, Jiqian Chen
	<Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [XEN PATCH v8 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH dom0
Date: Thu, 16 May 2024 17:52:33 +0800
Message-ID: <20240516095235.64128-4-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516095235.64128-1-Jiqian.Chen@amd.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|PH7PR12MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f640649-82d3-4fd6-c0d1-08dc758dfee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|7416005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3jq60muSCtN8IshWF/GnKWzVw89ox2+Mdddu/BemG+6m1WzKWwIvquQNPp1g?=
 =?us-ascii?Q?h/nW0U/t82uLkQcitKlATvcUX2gPHimkKFZKbKhuVfiDtZnmgclhRCmBvDF/?=
 =?us-ascii?Q?2Xujc8IXLZZGLtUhe05XPshI7IfnfyTnyFd2oSapBJC8ujfXTDX4FtWXI2w5?=
 =?us-ascii?Q?WC5S23fJ83ZjkwZIeQvi97lFyFDA4UGyMY17RMF49bnGkTcoXwq5CTtkrF46?=
 =?us-ascii?Q?gdYLsZzbGgehBqb5IqJEEnyTThICO6wGojK2ye2e3c7QzaGTHQHNgiPcdmId?=
 =?us-ascii?Q?zO8l1S/CXqLSjj+cX2JzC8MJRzQwdBd+RgSfJ3O4GQ+lT3EhUunBWdveomRV?=
 =?us-ascii?Q?r5JfZ+9E3ll8N6RZstFiyth81pd3B4gk34wjrYg2d3HBzYIg+1aoD8zHu1+k?=
 =?us-ascii?Q?yICHHhh/m6MNA69lJmYkI/0rqV5A8LUDHgOfuuiGGmFOCNuenJJRPNYmDnn0?=
 =?us-ascii?Q?fCq755yWU7VhI6jgaagtPLesaEtR4SFcN86ANPR0rjM59mlkocRj+3hzGlLB?=
 =?us-ascii?Q?YUNZdpOvgnor6u4IyqKGKEFh1KzXBglf/eeeU6dZ2BAfRZDC5MRWTaT7FImT?=
 =?us-ascii?Q?qn00h4ucms/gZI49nVPPiqQGqxHtsaRBmWuNl+726vTXAP/EtzZwayBvAfoc?=
 =?us-ascii?Q?5xxcC/iNJ5saWm0eNaOxPONJyQcL0WlD89ApBzKrG1HJMHeZVcFRtmaPh5SU?=
 =?us-ascii?Q?2PQO9RU5Rn3R040aMyhvG/2PMJZLgtwGEIjMS3l6KV/uqilqLuG0Ez+/pqP1?=
 =?us-ascii?Q?e8U86qmp2U4e9r/QS3N6BFKd+i+xDPPyKOtgVZe9HodlaEtT+j8kDGL0pSpf?=
 =?us-ascii?Q?XaQdvfb9UP7W9wMiKFujZ8ZsqNeMjX3J2f2rNVPDbZxS/zKd6QlPJSEoaBD5?=
 =?us-ascii?Q?D7wzIy9W1xDAINLpSN0m3ZMNAHBG/B61ibr1n7C57wz5CAB5TlJyMbyVy03l?=
 =?us-ascii?Q?boEo768ERjd2OlcqbKFAkx5908dMF8dGZIsn8cAs0v/cywccmrRCDQThamKM?=
 =?us-ascii?Q?lmXBr2Cj0J+1F6gYdDaPqSno5rkVjMCp/A+EtkFGAdSDjiGz/7BZOKdwjw+r?=
 =?us-ascii?Q?MrzFEsUz28Rw1UVZp0J5IAD/olqNGMFGAQU229a1XvBLREwE4qdjL1rCc8d/?=
 =?us-ascii?Q?TzJ+Zyh1mdvI6gz9CrMiX6XWdG6pJDt8s3qgq7GIsj+JQ7GWUzTpnAfo2OSB?=
 =?us-ascii?Q?AnFihhrNZBPXJF4J8Iz7hUhYyW7h9rHWSEnb0J6rzkwrl5D2esyGLuYLm++t?=
 =?us-ascii?Q?reC8MTSkY9N5MmdMXuY+PoOWtzoEoYK9RHlrtLgnB9Y/ZrSYFHQlR52GI36n?=
 =?us-ascii?Q?+W5aIB3lpwykEtPz1u80S9kCcKpDZteOWgeKe3cLVCv2VlpH5seKbgSTdIP2?=
 =?us-ascii?Q?Ht+Z//1yZRQIH5GaNFZR8RHfH9U0?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(7416005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 09:53:10.6647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f640649-82d3-4fd6-c0d1-08dc758dfee8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6420

On PVH dom0, the gsis don't get registered, but
the gsi of a passthrough device must be configured for it to
be able to be mapped into a hvm domU.
On Linux kernel side, it calles PHYSDEVOP_setup_gsi for
passthrough devices to register gsi when dom0 is PVH.
So, add PHYSDEVOP_setup_gsi for above purpose.

Signed-off-by: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/arch/x86/hvm/hypercall.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
index d49fb8b548a3..98e3c6b176ff 100644
--- a/xen/arch/x86/hvm/hypercall.c
+++ b/xen/arch/x86/hvm/hypercall.c
@@ -76,6 +76,11 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_unmap_pirq:
         break;
 
+    case PHYSDEVOP_setup_gsi:
+        if ( !is_hardware_domain(currd) )
+            return -EOPNOTSUPP;
+        break;
+
     case PHYSDEVOP_eoi:
     case PHYSDEVOP_irq_status_query:
     case PHYSDEVOP_get_free_pirq:
-- 
2.34.1


