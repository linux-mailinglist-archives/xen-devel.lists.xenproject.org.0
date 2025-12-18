Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C4CCBD60
	for <lists+xen-devel@lfdr.de>; Thu, 18 Dec 2025 13:50:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1189540.1510297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDS4-0008PR-AA; Thu, 18 Dec 2025 12:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1189540.1510297; Thu, 18 Dec 2025 12:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWDS4-0008Mz-7G; Thu, 18 Dec 2025 12:49:52 +0000
Received: by outflank-mailman (input) for mailman id 1189540;
 Thu, 18 Dec 2025 12:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KG2Y=6Y=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vWDS2-0008MZ-US
 for xen-devel@lists.xenproject.org; Thu, 18 Dec 2025 12:49:51 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 075d7799-dc10-11f0-b15b-2bf370ae4941;
 Thu, 18 Dec 2025 13:49:46 +0100 (CET)
Received: from CH2PR16CA0008.namprd16.prod.outlook.com (2603:10b6:610:50::18)
 by DM4PR12MB6061.namprd12.prod.outlook.com (2603:10b6:8:b3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Thu, 18 Dec 2025 12:49:41 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::ba) by CH2PR16CA0008.outlook.office365.com
 (2603:10b6:610:50::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 12:49:41 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 12:49:41 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 06:49:41 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Dec 2025 04:49:39 -0800
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
X-Inumbo-ID: 075d7799-dc10-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EkpiMO9/N+I/Loyj/aB87GGvmxRzitr90tlprLjhBeY9ttyswH3sqSSmP/w3z83XDk2vngGvIUfRruMUlfRlJvro+LtOqF4sPY0vmMneh9Ei1pg0+3jnQeyRMCAvG7OFkWGj7YQhLhyMyfbTPt84/r8k4C9CzIbQI4uq92RT6/sgW6qM+VLdSmpr11zHA1QYYwToft0TTg0rieQWjVbqY5PPKmE3VkeghQbrWvqJ0UW0QEJ569KQLA7/8j+/MYT0/sAYe4rqdA7+MN9cvOo8vDGyqBk4XSoQaqUxPND062cUuGuS5OLD4X1zf3Z0fe9qi08iahigp6tXkvNKC54lPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l978XjQu/Ypou1x0BcUk2kMDU5SFPYe6uhTwcmq9G+o=;
 b=gXTcJWW35vkBm107F1BlapdGObTnUIHdMs6Hu7Vu/He4YCLKvCzy4PKthM0FJSHhog9AFiZYt9FfFJtLyx+zO0G4yCK2rDCHOEAnt6EfhDopZW8inxQuK+j6s00NEWMhdlnO7ISSNeeGGPe+0oivYinLGhIoLjReMrriOfLYHHJvda2kIpv3+IXpF+kDH7qLvOEZKCR6pfbnz0viCqM9fm/yugUj9y1hJu6FV57ao3wUDofQJ703U1vBrEtQzbyJRGtEIev/LVtGXmvbwPjE4rsAlhGkUicPR0eNn7m70RJb24gk65wi9MYOj3uIkchlfJHpnFCe2Y4KrpEPazk3Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l978XjQu/Ypou1x0BcUk2kMDU5SFPYe6uhTwcmq9G+o=;
 b=PN4e1smBAKhE7m5CoKUTvSQRECVVYFsJLU6E/CWev5VPqPIg3/bCoharJLtemT8VwkPlIuRmhCXarhW3t+CZz3KV7U6eLqV6VyJWtAyjLFKEvCdSvaACa/nKsXqgQIFlFO7IjZHp2ad7jrYL2wHcKdgsJQIselo/dOzIHRXyQ+Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <08749564-eada-4f6e-a291-952304b7bdcb@amd.com>
Date: Thu, 18 Dec 2025 13:49:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/19] xen/dom0less: abstract Arm-specific p2m type
 name for device MMIO mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
 <912db2169ad1ba5e021fc58972fd92aabc213c5f.1765879052.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <912db2169ad1ba5e021fc58972fd92aabc213c5f.1765879052.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|DM4PR12MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: 129158e2-afb8-4f9b-d0c4-08de3e33e9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEdFS09mTU55S2U2Rm8rZG4zTUNaN2NZY2NJMVlWKzNiSjFveFhabnExeDhq?=
 =?utf-8?B?dnRmYjlLajRXcW5UV2x3NnUyMUFPRUhnM0NUdTVmZmRhRmFwVExma3czRmhl?=
 =?utf-8?B?cDRMVEE4aTQzS1o4UUxhaVJVN2dWZS9uUWNZTzF5V0xmZUNEOUlWcFhhK2ZJ?=
 =?utf-8?B?dTgvL0t2OXpkRUUwMmozV0oyR2hoQWljcDJvMlg4ZWdvd2ZmbVFZWVFXWmhB?=
 =?utf-8?B?U3hzaDhSdkMyK3BHV2dPdnQ1RHlZeWMvOHBiT2lZemROaHJzeEFPUFh3cTVu?=
 =?utf-8?B?cGtlNkZIYzBsaHZXajVBa09nY2xsZmRWa3M3VGI5WDFJZ09IZHVwWDY2OCt2?=
 =?utf-8?B?SjZFWU4xSjFCZWxjQkdlL1RFQWtDV0xuVGxlV2lLcy82SUwzWVJTOVhoSVhn?=
 =?utf-8?B?cllXYmhiS1NGYVJoTTVUbjNRcFhaNk54bVphQlFOVGpQbFVETzVkYXdBdDBK?=
 =?utf-8?B?ZnR1TmExZGViaXlPRHo5STVxcDhscm1kNUpUa0R2OFFWSWc3T3l3b0JyWVp3?=
 =?utf-8?B?eUhoWXdwVmF2R2JEb1Y0VjNNQVdEQU9KOWx6SEF3SHdtWlpBQngzM0VONnpX?=
 =?utf-8?B?NDZjbnV0bU5QNmw5M0wvVXUrSC9NZVRsOG5GTGNnRjlIUnFPR2ViZWNOd1o1?=
 =?utf-8?B?b1c3VGFRTnVTZm5WMUxUbmZnREFmUHRJSmxKRzFIbS95Q1NmWWRrTHJUd2N6?=
 =?utf-8?B?MXNtbW1CTFJYNWtrSC84eGIyKzlDOElYNUorUTZsQlBPOTJld2dhSkJUWjVl?=
 =?utf-8?B?Zi9BRmFYbElaTmszSTVOdVBSRzIvMkcwYnNEd2ZsRVhFK0JuS3FuNDZ4Z2NK?=
 =?utf-8?B?TVJSN0d6aitLU2JQZTVjRjc2U2ttSGV2SS9pVWJXWEY2SEVYa3VPNXE0QXd6?=
 =?utf-8?B?T210UDd3UXVWdGVpUkR2dnRZak1FdHZyZFdGMC9yRlhGZy9HbHo0SHBPUFdh?=
 =?utf-8?B?MFlSVnVTYTcrcm54SmlrMDdpZ0lDNTJHbzIwVkVsNnprNzQybzJHVkJrb2tl?=
 =?utf-8?B?Rk1JeXluWkZMbDdMcWw3QWNPUVlVZlIvWENUTmlicC94WUROcXlLZ0pyc2NE?=
 =?utf-8?B?cGQycThIVW9GaFZtU3hQTWd0Wi9HWEg0dXB1VU5MOVF6akRablFqM1A5eFZO?=
 =?utf-8?B?S0Z1M0pZNGVSZVJ0U1JjMUlRZS9jUk1acVdaT0g4dE8vY2VxWk8vY0szS0Nz?=
 =?utf-8?B?YkJPUExQblhLekorZzNEVWlETVBvMmFtZjNLTE9QVENYS2xKT1QxT2xJeEha?=
 =?utf-8?B?MS9nR1Z0R0tBM2hDMFZ5U0JDTE5BMlBKMWM1M1owTzZZYTZOanlmNlhRbndm?=
 =?utf-8?B?VGF1R3JraEVGSmNoVGcwanJlandIRFBzbVhSclVia2N3eTJSMS9VNHRISTFt?=
 =?utf-8?B?SElQV2dLRGFrbUZDdWdHdW9tdDFlZXd5S2xhTjlISzd3emdTT0VQMUJuTlln?=
 =?utf-8?B?WFNtNWxRQ2NUK2Rxd3FXa2dGOGxtOUpEOGg3M2pkeFlPSkY4ck03dUpXWndP?=
 =?utf-8?B?RmhzTUNLaS9uRzhwN2RzZEQ0dkhpa1VBcjdZQVFpNGUxbGprWmN5ZGtoTkds?=
 =?utf-8?B?Umwxdmo0VSs1dENSaElWL2lXaUNqRlNvWTFoZmQ5dy9jUHhpVFFuNWpaUHlE?=
 =?utf-8?B?aDFMc2RTUGJRdmNSblp2TTdoRE9HS2hBQkJVZnBhdjdLakhSelcwa1ZKSUNs?=
 =?utf-8?B?Z0NXY2o1cGwyYmFQUFBUcTY1ZEVDM1RFSnVXYktMYjdhMmczdHBEbGhGRm1T?=
 =?utf-8?B?cFpEazhKdGs0VmhLOUpxR0dVSThMQnMrMm9GZEo4eHA5STJUOEJDZVZON2RS?=
 =?utf-8?B?Wi8wU0poODJhcDVhVm5SQ1daRzI0V2t5NXhlcTRMS1lyMFh2QzNqWU5YZFNq?=
 =?utf-8?B?WFVSbU1BQTNJREtWZXpnaVJpd3Z2Z2xUYUVDVUJLN3JkTzlPRDdLUnFrVXNE?=
 =?utf-8?B?RDdoeFJkUjRPcUdtaC9semZHV01XMXBRUDVONVhtMGxRZ2NLdFRSTjAyS2Fp?=
 =?utf-8?B?T2szdHBaRk5sWGI2N04yU2tVY2JzWnB0ZDV6OVpLUVBjYzc0c1FBUVVockFW?=
 =?utf-8?B?OHROZS9zNnlka0lUejlMckh2YkExbCtBMVAvT2J6dmptM043TDNMR3IxOFVz?=
 =?utf-8?Q?2lO8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 12:49:41.7644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 129158e2-afb8-4f9b-d0c4-08de3e33e9b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6061



On 16/12/2025 17:55, Oleksii Kurochko wrote:
> Introduce arch_dt_passthrough_p2m_type() and use it instead of
> `p2m_mmio_direct_dev` to avoid leaking Arm-specific naming into
> common Xen code, such as dom0less passthrough property handling.
> 
> This helps reduce platform-specific terminology in shared logic and
> improves clarity for future non-Arm ports (e.g. RISC-V or PowerPC).
> 
> No functional changes — the definition is preserved via a static inline
> function for Arm.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


