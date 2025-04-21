Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14254A94C81
	for <lists+xen-devel@lfdr.de>; Mon, 21 Apr 2025 08:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960834.1352494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVD-0005CT-LP; Mon, 21 Apr 2025 06:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960834.1352494; Mon, 21 Apr 2025 06:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6kVD-00059m-9o; Mon, 21 Apr 2025 06:19:35 +0000
Received: by outflank-mailman (input) for mailman id 960834;
 Mon, 21 Apr 2025 06:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rBGn=XH=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1u6kVC-00057v-Bt
 for xen-devel@lists.xenproject.org; Mon, 21 Apr 2025 06:19:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2417::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 962f3590-1e78-11f0-9eb0-5ba50f476ded;
 Mon, 21 Apr 2025 08:19:32 +0200 (CEST)
Received: from SJ0PR05CA0026.namprd05.prod.outlook.com (2603:10b6:a03:33b::31)
 by MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 06:19:27 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::83) by SJ0PR05CA0026.outlook.office365.com
 (2603:10b6:a03:33b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Mon,
 21 Apr 2025 06:19:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 06:19:25 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Apr
 2025 01:19:22 -0500
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
X-Inumbo-ID: 962f3590-1e78-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MX9dQKwPR3BHsG0Ze7MU7iXlZsiAglZXetkZek7JAbIs/qNNvhqCBOfTQMmhZPqWa6CG2mjhCB48CdLF5MtpktpXPUAXtDlRuqU11Uheh4v6ebXvvLIAp4C1B6VaG5v2NU0LIaM951iXnTW+1ATNVo3RlIbM9SOKMuxIB5F1uEjf1rlSWx4qmX8/8RGz1+55JuWXYJIlQyseiFvebaFciMtrshb70YblNLSE+2U5OE2IP47sBs/dTdUXCCrz2RA95YqJg4Jj+ynjB4WhAWT0CL0g5pUUhAtSEmwZMwgQYBpz3ilwMgZ/k+4dk9AqpgF3TBkXK1j1ZGRcL0tQQCu2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOOZ7/CpX+4Q9buwrhLclR4GH2J6CoZoWc+RjO8QAwU=;
 b=wpZEx38frry+EOwd7fZM7aZjupoR+gq1Efltt2M87ccp7umuAYAyntZrAPqzmtO5Yn0x/T58sX52IF1volDr4VUh0rgycBh03XTG3VmEWMNp74Rw2bTt8Goap46lbVZVULnajrN/pbhz+MYCxfisPNT1T04cvw962S6LYkbok+qUwuaYuNBbnHLbuBaM9B+qWu+uLYc/7e6Vto6hXUrBUjUrWZDTc7Cu+9QqVII4g51VFMyTiBRA4ZA8Jpfvyj3NEM6ywPST2ogsPSVRqUGqfP9uqkocQFVqnVTzg7WslSKm9FNA2h2RERQl74TxaUv6d6An+tG3Lc8/N4P7Afk5sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOOZ7/CpX+4Q9buwrhLclR4GH2J6CoZoWc+RjO8QAwU=;
 b=OoLxSr1kcKK4Za43AoWSsgcdWGeWypXzvAxDJtgaR3SWYS2Ybee4JgYpesynZRz2poyqwFP13M8pqpwKD7jG0OE5YxhNdYPo5waNiV9thVByMisyu4iqcPKn3INIhpIzCKJlqAL/w3aACQsgKffxyYrwnwfV9y+pK60KKixQ9k4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v3 02/11] driver/pci: Get next capability without passing caps
Date: Mon, 21 Apr 2025 14:18:54 +0800
Message-ID: <20250421061903.1542652-3-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|MN2PR12MB4360:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e73a68d-a281-4653-b4f2-08dd809c774e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUlVVlZVVFdtdGVyTVR5L3dUN2RJSDRYZDUzb09NK0NibEVhY1htRTdzUnQ1?=
 =?utf-8?B?VlN5L3MyRUpsUjBRQ3dZTXRVOXEvS1hUQlRaV0kzaUVwQkU2eGdScVI2T05q?=
 =?utf-8?B?bjJHbjRXWnJwSnZMSFpjYVo0bHJoUGx0azJHTXp3dEF0ZjQ2MDg5UWpLdUpE?=
 =?utf-8?B?VlAyU3o1UXFwdkVhZ2NYSXkrY2RScFAvVHpoR1Jtd252clltcStwVytYSzFh?=
 =?utf-8?B?MVFHcStTdk1XU3pQZFVxWjRzUVBQS2p2MTBIci8vT3lIc05mbk1nSGZscFZz?=
 =?utf-8?B?VUJKTE42L0wrR3F1OTFiVk1TZ1Z5dTdJV3NKZUIyd3NYdE9iVW90L2FLN0xu?=
 =?utf-8?B?U2JVbmVKNnFUYm9sTWtsMmNOUjM5MW9FL3ZTTlRDNmhkeWlqKy9RQkZxVjNk?=
 =?utf-8?B?U3BmeTFBVWFpS0xkT2RjMURJODRUa3QzeExsdVpKZW1tRUZ1TkZzUFFrL0Zv?=
 =?utf-8?B?TzFHVTBnbURDNm5kZ0t4a3hjNkxkSCtVYnpOUnFnZEtGVkhHSDRvdFNIV2Fk?=
 =?utf-8?B?d1FIZnBJOHhveUk0d3JIeU5WY3F5UGtxNjJSSXZjUXMyVGk3QW9EMGVUTVJl?=
 =?utf-8?B?a3l0aHNvNERtbENMR2hyNzd3b2VSem56TEpWbFNtL2JFbDBBamp4MXNIcDJT?=
 =?utf-8?B?UFpoSituQ3A3dW44cWxWempybDIvdEJJU2d5ZklyVXpkTE5vNzlSZTlHSWU1?=
 =?utf-8?B?RC94ZlNhNmNuUDZxTE8wNUlGWXZQdVoyYTJHUUxGaFhvbzYyUnl0NTJvYmFT?=
 =?utf-8?B?cE15NW1hZGRpOWR2Z1ZIazhlM2tPSHZtYzRtMG1DTEdDOUR0bXd5K1owMTlR?=
 =?utf-8?B?V2srQmp0ajhZRzJqQnp4eDQrL1o3WnNsZHNPNmVtMnEySlhQbnV5V2RyeVVt?=
 =?utf-8?B?SHQ4VU1NbThSc0MwVW1Eczc1YXZMOVZ0NWFGVzRSYTVLak4vMjBjdit6TVV5?=
 =?utf-8?B?bkN2RzBPRmdTcXpVU3NET014ZWV4SXkzTGF1bFA4L3JZN3QxWVpDUkoxWDgw?=
 =?utf-8?B?dC9YZ09FcjRvWVFUMkZLQm4wL2hieExXektZVFZub1REZXRScjRNdFpwc0pm?=
 =?utf-8?B?Ymo1RmZlZXJIOGJRZmhUV0hkQkl5U251SDA3S1dJeXowOHVxK0JDejZ2bEE5?=
 =?utf-8?B?T0VpM3h2VDI1V0ZrLzFYY2JDTGJheEIxbDliYTVmRHhqSFcwaGxFNTJCQ0Uw?=
 =?utf-8?B?YnZMODBuNkV3ajUyY094cXBYaWExSmlpQlVZUlZvcTZzZTBRY0hTNWZIMzFt?=
 =?utf-8?B?cXB3Y3dCanBTaERUSUZEUE9HRTQ3SHZmKzZwYWd1d294WDVkc1FoR0tSMm1u?=
 =?utf-8?B?dm9FUFphWlRFMURoWWRQbjl2TlIrbkd0TUZoKzkxczhEQWZNbTlpYVYxakxR?=
 =?utf-8?B?YjFZQ2hVb1BJVDVUbHRSZk40SWIvUjdSYmtKS2pLUERGaThUYU91cFpVaTJW?=
 =?utf-8?B?Ni9vdm4yM2M0M0J5bGZjZXowdXgvVkxGNWIwT1JiazdLUU51Tmk2eW1ZTkRt?=
 =?utf-8?B?YUNlMlVwa3dFZ3VCaElVSjZRNWFuMFhkMVVhemJBTTZWUUhXRFc0eUhudEg0?=
 =?utf-8?B?MXBZSlNEQ20zZ0VZbklRcUJKNEF4R1RpZmU3dU5nQnZqMmhoQkMvbmZrYkJN?=
 =?utf-8?B?dFk1WmRVR2pKVlo5VnVpSEFLZDRMSEVFbFZ4Rzg2NGNxYWVINUFBRThGSWZX?=
 =?utf-8?B?czhmeERZankvWkE2YlZieGt3S1E3T3Y2V3dYeUZqN2NWaGhsTWNqN1ArV2ph?=
 =?utf-8?B?T0YwU05MVW4rNkdBb2Z1U0RMYnVobENRTjl2MjJkYWtYY0paSFU5anh1UDdz?=
 =?utf-8?B?bjZndHhsVXpsYUtxWms4OUt3TjV4QjIwcUg4VmpDU0FiMG9JV2EvTlJVQk5R?=
 =?utf-8?B?TDhOdVpWbW5COXJkS0dqQ3k4bkkwaTJFbXhzNVRVYitYdUM5Y3Q2a0poMm9F?=
 =?utf-8?B?TnNSeGxDdUltZXkxM0M5d3JOOWdwQjdIQ2VOS0dCbVdFNVRnSDh0ek5LNGN1?=
 =?utf-8?B?MjZVVjNYUFd6cHNZanQzbkRCQkNTN1VUbVVOSzVOMEREZDVUNkprR0ZGU25L?=
 =?utf-8?Q?0IAdnZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 06:19:25.9971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e73a68d-a281-4653-b4f2-08dd809c774e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360

Modify function pci_find_next_cap_ttl to support returning position
of next capability when size "n" is zero.

That can help caller to get next capability offset if caller just
has a information of current capability offset.

That will be used in a follow-on change.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Anthony PERARD <anthony.perard@vates.tech>
cc: Michal Orzel <michal.orzel@amd.com>
cc: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>
cc: "Roger Pau Monné" <roger.pau@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>
---
v2->v3 changes:
* Only check if n == 0 and add assertion for array "caps".
* Not to change pci_find_next_cap_ttl definition.

v1->v2 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/pci/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/drivers/pci/pci.c b/xen/drivers/pci/pci.c
index edf5b9f7ae9f..804f4e1e6066 100644
--- a/xen/drivers/pci/pci.c
+++ b/xen/drivers/pci/pci.c
@@ -55,6 +55,9 @@ unsigned int pci_find_next_cap_ttl(pci_sbdf_t sbdf, unsigned int pos,
 
         if ( id == 0xff )
             break;
+        if ( n == 0 )
+            return pos;
+        ASSERT(caps);
         for ( i = 0; i < n; i++ )
         {
             if ( id == caps[i] )
-- 
2.34.1


