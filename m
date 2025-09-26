Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B050BA2DB2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Sep 2025 09:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1131213.1470391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23E6-0004Dn-Vp; Fri, 26 Sep 2025 07:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1131213.1470391; Fri, 26 Sep 2025 07:50:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v23E6-0004B5-SJ; Fri, 26 Sep 2025 07:50:46 +0000
Received: by outflank-mailman (input) for mailman id 1131213;
 Fri, 26 Sep 2025 07:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOXT=4F=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1v23E6-00049y-0C
 for xen-devel@lists.xenproject.org; Fri, 26 Sep 2025 07:50:46 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8145f695-9aad-11f0-9809-7dc792cee155;
 Fri, 26 Sep 2025 09:50:43 +0200 (CEST)
Received: from CH0PR03CA0337.namprd03.prod.outlook.com (2603:10b6:610:11a::27)
 by DS0PR12MB7969.namprd12.prod.outlook.com (2603:10b6:8:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 07:50:39 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:610:11a:cafe::d0) by CH0PR03CA0337.outlook.office365.com
 (2603:10b6:610:11a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.11 via Frontend Transport; Fri,
 26 Sep 2025 07:50:39 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Fri, 26 Sep 2025 07:50:38 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 26 Sep
 2025 00:50:37 -0700
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
X-Inumbo-ID: 8145f695-9aad-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KGn8KemVexQNfB3BUCkyEgKffrTlDvBiFWK4jRezJ/AdafbzjgF5Sbfmn6oTg0WiyjDm2BdxxRQZnEw/+I/8Ix2G7QJNEyBkTJmgapKyW02AMdGf6UNeIqkIoL5FgJVQSbWFolWEnTW0sYa/DoeBsyH55BtaAUEUWwZrHlMICXdazkYYvb2tfZCq/PKfxcl+gAgebC/yD0fsaOHHpXjpXHACV5safSiewO6ZZAVnmQc83gyp9ns+FtAUnXjfpY/7EeuSuZHZOnamcB0RUlEex01+wr+g0yGXfi6lgoAg+R7T5JU6C7hSD1whWXZwOv5tk6ij/kBURKqB8VpgkMPpXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHj0ImhXHdcvnNj/FB/XwmW3uqXeNHk5nKS/vuiRWew=;
 b=AaK0QohuDnoCERimE33V6ZCM9HnarUUTJzXlfRdl/xS5ZAMUunKXBdK4CzrQ6eUo46U0LGpnAcKT4ycwR84nDyqoOlDpMWKEWwDX2XABE36b0iXe/un3NWQF9iVb/QooISHUb26jeqDeOplwQIn0vf1tn/ed2ukErty9Jdq9eTe8JIUahkufQ5BVIwr0YvkDxQEbpbFAyiHhXZD+zN18OaJQtKTSf9/7cctpGU+dQsfRqWoIJGKdpnAGD/6nr3VHf8FQ90hWQUlGCHvvqihH/54m3RefCUhoEjHYeu9soVDophylkoeU4n2j9+IM1lsdpVE4CHkX7qMmJTkd3hVltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHj0ImhXHdcvnNj/FB/XwmW3uqXeNHk5nKS/vuiRWew=;
 b=IrEQVOZWhNdvLWh3P+PngsQfUlLFfxsamXiX0iLsaYoafPAFybFEXx+55UGEksiFC74C7wSmGGoDYU4/iJjj8WCi5bE4K1R1jhKQjBKrsY/N078Tfx5aCmi6buWZ6Gy3t3qHC1RnRLAa41QO6POFfRcYK0GZ46h2aWr1sEOwcQI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v12 0/3] Support hiding capability when its initialization fails
Date: Fri, 26 Sep 2025 15:50:18 +0800
Message-ID: <20250926075021.27967-1-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|DS0PR12MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: 887d9876-d884-4e17-b03a-08ddfcd162ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anIwNk9Sdzd4U0xVMjdpWnhwTlgvNGhTZ2JtRStYRlVCcFVGRDNvcHQxb1o3?=
 =?utf-8?B?eVU0dTQzV3FmVC9UT0l1aVBJY1VpcFlZMjBxRFo1Y0I3TksrYkM2V2xPTlhQ?=
 =?utf-8?B?S3pMQjVWV3U4TTRadG9kN20yRkI5SStNZW5XQkRKRWJnVWgxcFUxV1RNTU5E?=
 =?utf-8?B?QkxtOFd3NmFSZTRRQjlhYWxpZmczKzg5TnlOQmxoeFJlUFpLTWtzS1RkMWs1?=
 =?utf-8?B?THdldytYVHZiNlpEQ214M2dmRC8rQmdSa1pGYmt1b0hnTkZYK1lDUm0zaW9p?=
 =?utf-8?B?WGk3bzRRdXZEeDRzVk9udkRkYmhpVVNSS3phUUVNVDRDZjV0MDA0MWQ5ZkF3?=
 =?utf-8?B?aTRicXVwQlFTaGdtRFJkUXdneXF2WHRhZnJvU1MwYi9UYi8xWWYwNm90M0Z4?=
 =?utf-8?B?ck1ualp3empnR2JITE10WHVqTm05NVBnd2tiMi9SMkFHNjlBM1VwMGNkODY3?=
 =?utf-8?B?ZWxJTHBudDVuMzFid21KcXpNYjZZaCtIVmRZUlJOQWtPRzhwVWRDN05xRW9q?=
 =?utf-8?B?MU0zSmlRNlVXU0sraEU4QmxtaFdhU1ExeVpxRnE3aXdidnh4UkNhcGV3Mmsr?=
 =?utf-8?B?VzRXbnh3RXFMaXZKcFFDTmwwR0tiN1YzRUlURzJiQUx5ek81UFhpeDNzenZU?=
 =?utf-8?B?RkgxdFFFQThTbVluazY0aW9UdG5BcWl5SU9zZjVpaEdORGhWMmZwblFKRk9s?=
 =?utf-8?B?YnBJT3hwL2ZRMlFieFpWWk1nTmozclZLQ1B2aEd0SFEwZkw1aC9XeXJDN0JF?=
 =?utf-8?B?bW1PZ21wWXpST2hVYVVJWnJiQXZCSnluSzN5cWhmY3dVL29FOWREeXVGMmlD?=
 =?utf-8?B?bVpnVEtqemozYnNNcjZrQUZUQnY2THhJSlNtSVRMNVlIamtrUG9ybmt0a3Ft?=
 =?utf-8?B?R050RW9vZUhFQndPVitHbWRQclJwRTRlMEpJSnNSUGJJQlBDTzZFWHFsMlBV?=
 =?utf-8?B?MDFRT1creTllYXY5V2VkMmozRzRsa1hSdEdhR2lDYlFFNERuTVRleVUreEtF?=
 =?utf-8?B?VzhhdTJvbmthVTM5L05xWW1tRlpjWGk4aC8wbHNiajJPRmVwV3BubklrMU81?=
 =?utf-8?B?dWJWM2U2Sk5aOUREaWpZMzZORHo0YXRGTnBsQlloaGtHeUN1UGYwRjJRLzhz?=
 =?utf-8?B?d1I2NjZ6NjBNTThZcWxQMkhyZjlFTlp0eHNvVEhjVWZEclNEYXZDUm1STFdC?=
 =?utf-8?B?Y1FabUtXVWNEQzhPSXZwSXNXc2VsZ1J5WklEb2x0cUEvVU4wNXBDMHVTS2xH?=
 =?utf-8?B?NjloaFo0YnU5Y2VYOTk2VW8xWTl1RzhidFQzaUpxUXVXMXVESFMyN0JBdXFI?=
 =?utf-8?B?TTZDdEVEMkpjenFjMy9kaXFQOWVsTGZSS1dwUUx4b0N5V1ExeE5NZlZQK2pI?=
 =?utf-8?B?WVFDdlFZOXhDM2l5NE1WVVM2bTNzMGRnUWcyYzdKQ1lyb1F6OXdhYi9VYUlq?=
 =?utf-8?B?WUdZWVBQemtvR2FZNnJSVXJoT09qUVZhc3JCUWJQQ2Z2bHBjdTRJdFdLT3hs?=
 =?utf-8?B?ZTJmNzEwbjB4MTJhaGdTSDNWd2MyWW9WdUNsSExzb2F2ak43MndFRHNybW9Y?=
 =?utf-8?B?UDJ2ZlAwbW1JTFNZYTVZZzQ2b3FtZmM0V3hJd0RLa3h3WU9wTDlEeTFVcXhJ?=
 =?utf-8?B?NkkyU1hSS2xtUFhDa3oxRHNpcXN5c2ZCUGVKZjFYb2dJQTlyLzVUVTlERXo5?=
 =?utf-8?B?VG9zbHhRMXZTUGo3ZkNsZi9XelNxZ2JJcXllRGZSeEllaHJueG1rZFRKSUNx?=
 =?utf-8?B?TjdQTlI2ZE9VUkEyTERoaStySHkzWUE5dmZlcytjVTZQQkpWY2EySkg3NVZM?=
 =?utf-8?B?KzlnUlhSUTkxcDNhaWtxeVkrNHlUYXU4cUNuM0hkT1hoQnVPdHpndCtjbnUw?=
 =?utf-8?B?cDRIMXdxeE1WREZiaC9YdDZqYUc3VVJ1dzVUaEV1blVIZCtjWFVYcGVqMGEz?=
 =?utf-8?B?cGpLWk1wYkdaL1p5R0xTRUllcUVOQ2MrZ0hvUHFlQXhRT2RFcW13US9sKzFG?=
 =?utf-8?B?dDZLV3JVeElHbm10aUtkVmJlL2RjaFI1d1JHMnU4WmFhbXhCK2YraktpVzYr?=
 =?utf-8?Q?13bosi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 07:50:38.9604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 887d9876-d884-4e17-b03a-08ddfcd162ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7969

Hi,

This series is to
emulate extended capability list for dom0;
hide legacy and extended capability when its initialization fails;
above two parts had been merged.
remove all related registers and other resources when initializing capability fails, including patch Rebar #1, MSI #2, MSIX #3.

Best regards,
Jiqian Chen.
---
cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
Jiqian Chen (3):
  vpci/rebar: Implement cleanup function for Rebar
  vpci/msi: Implement cleanup function for MSI
  vpci/msix: Implement cleanup function for MSI-X

 xen/drivers/vpci/msi.c   | 55 ++++++++++++++++++++++++++++++++++-
 xen/drivers/vpci/msix.c  | 44 +++++++++++++++++++++++++++-
 xen/drivers/vpci/rebar.c | 62 ++++++++++++++++++++++++++++++++++------
 xen/drivers/vpci/vpci.c  |  9 ------
 4 files changed, 150 insertions(+), 20 deletions(-)

-- 
2.34.1


