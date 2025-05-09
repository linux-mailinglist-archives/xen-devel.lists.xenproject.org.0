Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A285AB0E39
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 11:06:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979892.1366471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgY-0007VS-GO; Fri, 09 May 2025 09:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979892.1366471; Fri, 09 May 2025 09:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDJgY-0007QZ-5t; Fri, 09 May 2025 09:06:26 +0000
Received: by outflank-mailman (input) for mailman id 979892;
 Fri, 09 May 2025 09:06:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=60h2=XZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1uDJgV-0005aH-W4
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 09:06:23 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfd2aba2-2cb4-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 11:06:22 +0200 (CEST)
Received: from BYAPR07CA0079.namprd07.prod.outlook.com (2603:10b6:a03:12b::20)
 by SA5PPF530AE3851.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Fri, 9 May
 2025 09:06:17 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:12b:cafe::6e) by BYAPR07CA0079.outlook.office365.com
 (2603:10b6:a03:12b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Fri,
 9 May 2025 09:06:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 09:06:16 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 04:06:14 -0500
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
X-Inumbo-ID: dfd2aba2-2cb4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDEZQJj+tsXW/ncUe5HsNHj3twmqoXXT0cIj2NTcXMJaWRuidIK8dB86GTT2sdxJj+ez/iAJB5CW3rM/xw+jc7lsgdhjXmcxFM1AaePk0ujq71K7d6TLwJw+1qv2ZUby3mcPUbQLRd95gprZhOl7VVGoLBU7f6khFyeExMXoPjJ+xpF306ouVR3NvCDtG6LKzsEDTDl23Lho+Leiqf0nx8OcakmQ2BARiR7E5N/yOpKdqtJCnq7jdfV7zWQT5feRBSUAJOvbH8M7fI8qpdjycMT1XWE/LdLAKvJ/neFWVjdI8lPwiV0FuNrZ/3Ok3bsbt6gD95iOkrbBe9uMWQJWtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxsqy2OG0XoDfK1Z06/jOcTFbFyd2+TnRkp4DczGZ1o=;
 b=RJwvhocb+CJoTK+jqShcwdh9I5itTKTXvawclxBKTcvj8n0tJA0FvFuk6pdHXAOgjCEQjJubJJIe0jGG9NiQGjL7F6LszXBwoWsxuqHDx5cWUKFO76FkDJSVe0zgsUamvsWhYlOZz76yAV32oOIQN2+Pc8g8YW727EJVvpcn3BOdqM6bOe3E5EocHC0WLnBiLbG1xBsiV+aTK2N51xNmXkfqYFMvACWEoAZb17EUtSvHmJ7lMpZj86cGa+Hq9aHoKVxu7ImGVrh/IFUPUScyLIfk7PQ6pbicIGa4ZnI+UuMAkR3hwIy6AMP3DT6tzzEgjBUAvhgDNVU8V9rc+VvUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxsqy2OG0XoDfK1Z06/jOcTFbFyd2+TnRkp4DczGZ1o=;
 b=AUSN+vmdriWxn8E/dWGHTwx7yY+VOvE7mXY4jd+35jBLGIXqRYmaMga+0jxB3z6eofZUDLo+y51vz/mbB4cSbGWf7xGG1m9BOcNaJ2FgR8F+Z8WDEBkv1csmuTRg34GX3tA47+uHuzi/XJ7D3LB6PUACATzjx1mxdYDdNi9n4M8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 10/10] vpci/msix: Add function to clean MSIX resources
Date: Fri, 9 May 2025 17:05:42 +0800
Message-ID: <20250509090542.2199676-11-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|SA5PPF530AE3851:EE_
X-MS-Office365-Filtering-Correlation-Id: b9274c70-b773-46f3-0c79-08dd8ed8c171
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZENSK1pYTnVBbWlZVXJyS2RheTVOVm53T2d2ZE9Ob1UzbUJ1ZHB2VTUwejVV?=
 =?utf-8?B?dFRwSW9ISkdNTFZFM2djL0QxYmtzNWdLek1KaEtiZE15MHNmUWN3dEFMTTJ0?=
 =?utf-8?B?NjhmVElhK1lEazhnZXhkbmRSS1JlT1c3enZoS2ZiWWhKL29MQlY1bXh1OUc3?=
 =?utf-8?B?L1ptT0lNOUQwa2V6TkMvUitBRXgrK1pqQkdyYktqRitnei9wdnJZZGFubGZL?=
 =?utf-8?B?dXpLc1FEQUNSOXFVSVN3VzF2dHJPY2lEOGt6UVlJN3JjZ2x2anV4MkZaajJ4?=
 =?utf-8?B?QWt3akhKWjErSnIvcnlyT0lzeGtqNk01bVZmQlZDaWJnTGRBdUVCYWdOZ1Z0?=
 =?utf-8?B?WW5xcWQrVUpPajB0RHg4K0xmVksrbmVqTWhCSzRGZkRtTFh1L01GbHptejAw?=
 =?utf-8?B?bGU3T1lVbzVWNVQ1T2h3NEZyUkpDejJBdG9zSnQzWVcvYm9vUDVYUjBYV2NI?=
 =?utf-8?B?eHNiSlFsSllBTVhnRzFkdmlNazJMRXhsZUlpR2lNeDRsVDBSM0VEenc2TFdD?=
 =?utf-8?B?a3Y0VWdTelBUL3lCTGtmelBISVFrdmRqZnFvNUxUeGgwZlZWdGUrdEY1QmxQ?=
 =?utf-8?B?VUZLREtTSnozYklkQTFNMUhSVmJoTlF2TEZxUHNYNlRCZVdSendmVi8wUXor?=
 =?utf-8?B?anZIMFFpSlVqU2ZIU29FSkxLYVZxMGloZTg0ZGxCVTg1MHdTQ0FOTTJXYlFM?=
 =?utf-8?B?MFpsSmY2NS9QaWFtVjE1Z2FmMHRKMWVkdXY1NG90elB5WE05VFBmcHBqTlBH?=
 =?utf-8?B?VTNYS1pUUjdZcFVFNURtSUlwMzNrc0szejhlZGVkUlpHS0ltTklpeVRQekdB?=
 =?utf-8?B?OUt1QklDUHB5WU9FOWhoZUFjL0wrMlZoK3JacTByVmpwN2taZ0tHRUFoVnpE?=
 =?utf-8?B?L042bUw5SHVSYUF4SjRZQ0luU2x6RXlQbUFEMFVvQTYwR0dPWGUvU216UTVy?=
 =?utf-8?B?amhma2xleHQwZytVeXRndXZCaG5pdmxuL0RpcC9RVEZmcTV5QUttMnVDUk5G?=
 =?utf-8?B?UDNkRUNYcnpMUWpjYjViaVVrRFZTdzlFRktVcmNSajFqVEFoQjhHM1h6U3VR?=
 =?utf-8?B?aXJjNkFubG9KbVI5eWp3cDAya293eU5aTGFlRjBXZC9lSFg4QlZXb1E1ZU9p?=
 =?utf-8?B?bmpqSW8zZFgxVlFmUXZHZFRIaklsZmRPNWNSUUlVN2hub0JqU0ZZVjQxNnNP?=
 =?utf-8?B?M1ZxR2tTdTFVdGYxenJNMFEvcDVWNk52ZE5TZTZONnppQ2k3aUF1WDhkQ0JZ?=
 =?utf-8?B?Uy9qYnEzK0JiV1MwS080V3grVGtFdGNxZjFwRmdJSkF3NFY5eXUxRHNqNWU1?=
 =?utf-8?B?b1MzZmlFR0RrcUtvYXp4QUFGSVg1SUo0K0xmdnhITm1ncXBidGMrQlN2YjRD?=
 =?utf-8?B?SjdMeEhidUFXVGh4bDNRUW91dXFLTTdvQ1FDRVI1bW0zRXZuSnYzMTc3Rld5?=
 =?utf-8?B?OTNXeXZidlNzSkV1dXhuT3pzaE5xaXppS1R3TlhySEM3UGxnUWtBYytPcXY3?=
 =?utf-8?B?ZjVnYThoeXhUVkJRUjVzdjBtZGk3TUZGTjFHQkxhS0M1cE9MVmZhUXRwejRM?=
 =?utf-8?B?c1M1WVdxczJ5NCtoZDFyejNtaGgrUEpTQTh6TXNEUDVkRE1SSVJoNkU5TEl0?=
 =?utf-8?B?RVh2YTZ5SFdjcC9YTDIyb1pmZHVxQm5pa0pOSWk5THpFZmpEMHNOaGdyQXhT?=
 =?utf-8?B?cHREWWlNSFZpemM0RnI5di9iNWdPYlZWQkdESUNyK0V4RXd3SnVxemVjUmdB?=
 =?utf-8?B?eVF6c0them9NaWNjUG9SdjY2OTlTS0xTbEovdEU4Y1FvQjZOTDMrakNzaDVP?=
 =?utf-8?B?QndqQWs1eXVWQkhkd2Z3NUpLUzRJTitxU2lvb2huczNvYjlWajlRcVd0U0pW?=
 =?utf-8?B?dFoxdlRzOUV3M2FPYmNaa2NNZU03SDV6aVhaNlRhcjBIM29GY0xtUlFqVlNk?=
 =?utf-8?B?NVY5cVdwRDVzTkJzMHB5VmZQdUlMNUZxUFVYVzFwUWdUVis1aWY2NlVpbU5j?=
 =?utf-8?B?SWZrZ3V6bkh2QW9vQjhUSG41TldLVE1nTlI0di9mVHl5Vm8vS2dIaytmbUtm?=
 =?utf-8?Q?v1pu03?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 09:06:16.4579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9274c70-b773-46f3-0c79-08dd8ed8c171
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF530AE3851

When init_msix() fails, it needs to clean all MSIX resources.
So, add a new function to do that.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
v3->v4 changes:
* Change function name from fini_msix() to cleanup_msix().
* Change to use XFREE to free vpci->msix.
* In cleanup function, change the sequence of check and remove action according to init_msix().

v2->v3 changes:
* Remove unnecessary clean operations in fini_msix().

v1->v2 changes:
new patch.

Best regards,
Jiqian Chen.
---
 xen/drivers/vpci/msix.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index f8ce89b8b32f..b80491ed32bf 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -655,6 +655,27 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
     return 0;
 }
 
+static void cleanup_msix(struct pci_dev *pdev)
+{
+    struct vpci *vpci = pdev->vpci;
+    unsigned int msix_pos = pdev->msix_pos;
+
+    if ( !msix_pos )
+        return;
+
+    vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
+
+    if ( !vpci->msix )
+        return;
+
+    for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
+        if ( vpci->msix->table[i] )
+            iounmap(vpci->msix->table[i]);
+
+    list_del(&vpci->msix->next);
+    XFREE(vpci->msix);
+}
+
 static int cf_check init_msix(struct pci_dev *pdev)
 {
     struct domain *d = pdev->domain;
@@ -709,7 +730,7 @@ static int cf_check init_msix(struct pci_dev *pdev)
 
     return rc;
 }
-REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, NULL);
+REGISTER_VPCI_LEGACY_CAP(PCI_CAP_ID_MSIX, init_msix, cleanup_msix);
 
 /*
  * Local variables:
-- 
2.34.1


