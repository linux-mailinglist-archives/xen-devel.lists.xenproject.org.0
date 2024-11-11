Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A42679C455E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 19:54:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834148.1249666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAZYE-0002Ce-5K; Mon, 11 Nov 2024 18:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834148.1249666; Mon, 11 Nov 2024 18:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAZYE-0002B0-2W; Mon, 11 Nov 2024 18:54:14 +0000
Received: by outflank-mailman (input) for mailman id 834148;
 Mon, 11 Nov 2024 18:54:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0YFU=SG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tAZYC-0002Au-VH
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 18:54:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2009::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52c9f761-a05e-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 19:54:06 +0100 (CET)
Received: from PH7PR03CA0026.namprd03.prod.outlook.com (2603:10b6:510:339::11)
 by MW4PR12MB7016.namprd12.prod.outlook.com (2603:10b6:303:218::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 18:54:00 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::80) by PH7PR03CA0026.outlook.office365.com
 (2603:10b6:510:339::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29 via Frontend
 Transport; Mon, 11 Nov 2024 18:54:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 18:54:00 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 12:53:59 -0600
Received: from [172.30.86.253] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 12:53:58 -0600
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
X-Inumbo-ID: 52c9f761-a05e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjAwOTo6NjBmIiwiaGVsbyI6Ik5BTTEwLUJONy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjUyYzlmNzYxLWEwNWUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzUxMjQ2LjA5NTg2MSwic2VuZGVyIjoic3Rld2FydC5oaWxkZWJyYW5kQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kD6vH3hJ4dMyf9Go6dJqRWxocqxdXIO/VBE8QaMk4O6JTV+HCzITsUaWY5bNHFsnKxnpsfenx+ArdAK5JSAoriJXJd4fZ9pfJnEMABxTgC8PQVTxqT4/yR7N0QNKROlyY+K5+1PnI89+8gAMMWMOVaspqdg4yJjtP///TKYp3mNCFiyJZuuUkDT7UxjJ/droql6Exd5w34iAFBd+KfLhADda1lmMU3wqKmcSfYQfE6JUe8t+fdWzPg1RdrUbGPdDrUgSV8QhQB8yoHzM5uXMlTDgRtj6tSgJMt5tgPi6rOq8yV6H9HVmMK9fRrN9SV1sMOeazKxIoAz8ggslyKRXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40CTrPbLByU5cW5JIeCveCntVxwqRoVn2WY30irMCLM=;
 b=A0smZ5UISnrzJ7Rtw8mjKeelU/FaQxnNjY/Zs9Wi7MyP/dGq1YcwOM1BWjyzEI6wBMA630P9yuY8B8nCI/P8ccAMkXU4HatHm6U6IB8+jVslEMui/3qfc4pJCVbA6IKXcVw3G081GPDY0LwZtJrel99exMfYhZyUnrRnz3Qw1bGnnB9bYIHkFqWpjJfGw+67gLNMQQVEePJZ1oqh8VxpvKBULWss4O73eyNsW5Y7HR/DceKNUT/a3r5VWcQW3gRDc5hJxJZrP/cCHRpj/twV6l0VJpm5VchwV0A8CRy1f6n8OjCAP7sq+AnZNObvmhrOwJr8yw/JTjIZ0ch3pJ5Z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40CTrPbLByU5cW5JIeCveCntVxwqRoVn2WY30irMCLM=;
 b=nGgrVxEzLzQkIrsw4go8/1dA0nD8G6ULJEm1eWc8YaI5Ra3AU0+2uq6OmjJuaWIZh8oZEJ3ojaiHHkdNzhDrUapYGl2MuPqKHXbfFP1c9DNxQrc3ke40IBskLIpEOJSJqSWUTiXC08X2TCGE2eOWsQk1bNFlztP4aK4uuIt5OYM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <567f142a-55d2-4d4a-999d-d8b63e4882e3@amd.com>
Date: Mon, 11 Nov 2024 13:53:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v10] xen/passthrough: use gsi to map pirq when dom0
 is PVH
To: Jiqian Chen <Jiqian.Chen@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, "Paul
 Durrant" <paul@xen.org>, "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>, Huang Rui
	<ray.huang@amd.com>
References: <20241106061418.3655304-1-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20241106061418.3655304-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|MW4PR12MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f6e1520-2835-4b68-965f-08dd02823454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0VickcyNlk1ZWNWVi9kL3hpVzRlUFFYOU9aOG9SQW5wUmswd3IvZEphQTVC?=
 =?utf-8?B?QXFvcGRvczJrcHVNbndEMS9vd3dZTGpHVzZzSU8yY1dyQVJmWk9mSjZwbnl5?=
 =?utf-8?B?RVpkRkcxZ2o5YTJQb2JMYUloTURrdVd5MG84WUlZYjRTeWoyanV6R2M3QUZ1?=
 =?utf-8?B?cmUxQ0RBSStVaytmcTNkVjBqNGtSRTdVV0M4eWRJVW82NmQxL1UwZFN1M1hn?=
 =?utf-8?B?Rk9FZDdobXIxbWpNMXBnRDVoMFNiSDR2MmVNOVEwMDVGTUlnRmRyNldzY1VY?=
 =?utf-8?B?OHlBRkFwZE9PMXllK3JlWFh3U2VVN0dmYjdmSDBPQW5XdmplaHhuQmpOaSs2?=
 =?utf-8?B?cUFpSHpOQWdrZ1VLalppR1JDU0dDeHdQeWE1MmE1TWRRamREZkY2T0JPZTUr?=
 =?utf-8?B?Z1gwV1V1emZZTGQ5TVhWOHBMZWRyaFAxbDJzNVBZQkpuT3dndDBwTWdhVzF3?=
 =?utf-8?B?OE9JaGxCcFVwQUNzaXZtcVlRak9aRm5TQXhjdFBhSU1wa2dDRzE0Y3BMNEF1?=
 =?utf-8?B?Q21STXlHcklaeWpzMWVoZlNEWEVSZkNJakVJR3N4Q3JaUUhmeE9JTkRiN213?=
 =?utf-8?B?bEpDNTRMOW1WZys5ZE91dGJVR0dFeC93anZjQzl6R1I2aVEyUlc4MFZoSElm?=
 =?utf-8?B?dVM2c0FEY0g0TlJsSTFoU0FLcGNQTHNNaWZmZk15ckVGVDNtTHowVmxXT3U1?=
 =?utf-8?B?OUVPNXIxc2d3VERPYVhQcDFhUi9qMEk0a2Z5S3NCM2hZd3VHdTBXZnI2UzdP?=
 =?utf-8?B?Y3hQOFgxT2V6V211RzZpaktlRGZFNlRjdmJNQ1hyRGZYUkF4RmFsSlpYTEoy?=
 =?utf-8?B?NFEzQnFUUFdlczFKeGRHeTVhSHg3MjkrbU9UaDF1eW82c05CUVl4WVN3RHM3?=
 =?utf-8?B?NTJ1TCsyQ2dQSTArSTk1bFRuUGZXMlE2cXB0MStRc1pWMDJPTmpFR09NWGlV?=
 =?utf-8?B?V1RBdnlQSFdjNzYzdDNRZzFoRlVqVERHOVhGczVDVmxOSkI3UjRGbHJYQmp2?=
 =?utf-8?B?NEVXOHNCZEI1VXRyam81S1ZKZGE2S0p0QWZ4NzRKS1VaVHp3eXJnYW5hQURQ?=
 =?utf-8?B?cnExOThjbEJiL3A3WjNoQnp4c1FIUG5sOWtpWDBKbkxqcFdscjQ2bUJ0UG1v?=
 =?utf-8?B?T0g0R3R4bFJIM05CRzRuQVM3dTJYTWw3ZWNTMEhWV1RrZTlHQVdPUkxjYVpL?=
 =?utf-8?B?QWdVeXZIcFppMTBPZlhOQlZOM3F3N1hWelFpd3dQNGtRQWpXa1BpYm1qd2tk?=
 =?utf-8?B?cTZCak94dXJITnIvRVpxVWNndmtMRjdsWVNzK2hRWmlMdWFUOVpCeDdUOHJh?=
 =?utf-8?B?VDRteTZuUkF0N2hGejNHUTZyKzJIYVBrb0QrZ09TcEpBL21IQWlWeFNlM1B6?=
 =?utf-8?B?OUhUUXlzN3BXbFgvTlJiVGxnVEtXRThZYThGS3dlVG0xSUJ6d2RkaU1rNU5Z?=
 =?utf-8?B?dEtkbjE4bFVrOExxVDRPMkxzaElKNTMrRzhPNlpMVFpMN2p0UG56d2dpWUh5?=
 =?utf-8?B?by9uUzJHanI0djFDZEx3OUdlakN5VXZ2d25wUnpMMTNCNzk2NVFlODFKWitM?=
 =?utf-8?B?VEF0VUVZbFhRclhPaFUrQUlYcXVWNnA3cURpb1R1VkRxOWNqaHp1ZzZPbFRo?=
 =?utf-8?B?bDNWcEUvd2pheVFjRGpNVy8vNUR2YWRjaDAvSFZObTRxcjFhSkY5N01uZkRw?=
 =?utf-8?B?SExOVitBdENRelZubWNuak9jOEtaU3prdDlYb2t0V1pPc2Yyb3FFOGNZOW1j?=
 =?utf-8?B?V3BsS1VDUG1NZzg4eGlmZ3gwYWo3UVNob2dxcmkwY3NWT1B1V0Yxb0kyVU9S?=
 =?utf-8?B?dkhQSitiRjBIOENtMmFPbGJyQ25seS9tbGZJQlUxZnkyOW8vYVdaczBVNjk3?=
 =?utf-8?B?eDFCYWhGMjM4UlhzR1MyZmt0bG9MVThEQ1IvWStzbHRKZUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 18:54:00.2502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f6e1520-2835-4b68-965f-08dd02823454
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7016

On 11/6/24 01:14, Jiqian Chen wrote:
> In PVH dom0, when passthrough a device to domU, QEMU code
> xen_pt_realize->xc_physdev_map_pirq wants to use gsi, but in current codes
> the gsi number is got from file /sys/bus/pci/devices/<sbdf>/irq, that is
> wrong, because irq is not equal with gsi, they are in different spaces, so
> pirq mapping fails.
> 
> To solve above problem, use new interface of Xen, xc_pcidev_get_gsi to get
> gsi and use xc_physdev_map_pirq_gsi to map pirq when dom0 is PVH.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

