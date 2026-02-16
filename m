Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMOdEvvgkmknzgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:18:51 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68404141E88
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:18:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233818.1537175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrukK-0001CR-7V; Mon, 16 Feb 2026 09:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233818.1537175; Mon, 16 Feb 2026 09:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrukK-00019z-3W; Mon, 16 Feb 2026 09:18:24 +0000
Received: by outflank-mailman (input) for mailman id 1233818;
 Mon, 16 Feb 2026 09:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nRIP=AU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vrukI-00019p-5y
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 09:18:22 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6de547cd-0b18-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 10:18:19 +0100 (CET)
Received: from CH2PR19CA0025.namprd19.prod.outlook.com (2603:10b6:610:4d::35)
 by CH3PR12MB9343.namprd12.prod.outlook.com (2603:10b6:610:1c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 09:18:12 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::6d) by CH2PR19CA0025.outlook.office365.com
 (2603:10b6:610:4d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend
 Transport; Mon, 16 Feb 2026 09:18:12 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 09:18:11 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 03:18:11 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 03:18:11 -0600
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Feb 2026 03:18:10 -0600
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
X-Inumbo-ID: 6de547cd-0b18-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7qQMH6jiV7Tg+GLNqglBSNZf1EKKP2XPBXcQNCLUpCxD2ZXc+36pv/S33d4P7XP+78lE+9dpJzKvd6PqUe4vf7p4VHr3zlkT9xOx9pGms5h/5gUAKOvMwXCetbRhycML9ZhsV6pYsbhbbyfoNTz44MwFDZJriVUno+JmrHH6jmU5LutcPCS4MtMRO6f53H3ZvhLsoTy3t73so6gBuzZK4SgP5jCz+N428H8F4MYdq5cGviu52bUDyjTKVbn/UR41U5NshshuGHKMXEY1dIHr5iaQ6SuZNVIq2K8BuPeUF4IRI51t9koTplOJlay4GKN0DztC7EBlDTW5Bzuxi7aRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jS5i2wyR9/SctT6OdQMTPs7K1fHgdsborWbgEHeCYY=;
 b=DPyEJ25+LySOZ9DANSb/kazeEwmv1FhoQ9YEmLWH1x/BO/JqWjc9FYxEyqXGB/bbz2vr3uvq0YZsbXIkbv4WnJRS9FxUNo25wQk3001HVIdtT4gMM14ow49r1qLhIcRJr0bcIEZsbWwGP0zz87XiEajXrOPaj+mJaYV1aby67TCxna60McpL+XTMjHz3nUSNfrMmp2RpY3JKg5A+MhTQ0A2TTK5+LymPhJRni1vFuWse/JpC3py/0xes1/Tn44hC8B8c7dXvaCZ9c1KUam1D1s4Dlv3FCMJ9lkJbDqvh2Zsj8kNo+wk7wS1TqjEwBljAGZctq9NGwbrvXZXcZ1G/LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jS5i2wyR9/SctT6OdQMTPs7K1fHgdsborWbgEHeCYY=;
 b=X8ICFeu6CYjbIU/d0Eb6Ux3gyxU+QUbuO0C/AfNPyhiMS6h7P5nhzg5iaELElb39GUaThQKVc/AjcQoxme3QTexH7WEGLZBM2pKJqbP69ttynKIXWhSwFZBXZq9lbHgq8tCn5rrigJyACLdHMnevkwqx2ZfAkKTW6PDdU+EOgD4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <4ef64eca-3928-49c6-adc8-4d88319e01cd@amd.com>
Date: Mon, 16 Feb 2026 10:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree property
 for domains
To: Harry Ramsey <harry.ramsey@arm.com>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260206090155.68466-1-harry.ramsey@arm.com>
 <20260206090155.68466-3-harry.ramsey@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260206090155.68466-3-harry.ramsey@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|CH3PR12MB9343:EE_
X-MS-Office365-Filtering-Correlation-Id: 20c6039c-2150-4ca9-4abf-08de6d3c4ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SitJaHBNbGZyZFpsZVE2UnJ2TVdEZjAwQUFxaUlDUm1CMjZzSU1WbEgxbTYx?=
 =?utf-8?B?UXo5YnBwa21mVXFGR3FsRDA4YUxQcFYxV2haSUtNbE1kbWlJR2U3WHl5dHN1?=
 =?utf-8?B?Tm56eWFOYXAzUHAyN0w1b1lrQlJUbWtUZWZ3VVVVcEgwWFlZelJZeThRQURo?=
 =?utf-8?B?MllkTlRIbW1Bd1dsMDhDS0YxL0xlaFBJSkxEcjZFNTN5Uk1TUU1PRGFBK2Ny?=
 =?utf-8?B?WVJsQUJxL0FWMnhsUjAxMnYwK0o3SlYvQTBXRnVMdjRIanVtZWFXSWY0cDlE?=
 =?utf-8?B?MjgvQnRTMml6bHVzTzlKeCtKWDZrTGtVTlpoVjJ6T3pqNWZZd2hTa09UWitO?=
 =?utf-8?B?QUcrOTJEYWxHVjgwT0EyOWY2SVNOZ1Zrdzg1QzN5dkw3dWtSWmhneHdVY3VZ?=
 =?utf-8?B?SWd5QTd0V0N2MXlVRVNNZC9zNTAvMVplTEhIdzBvWVd1NURBWjNmNXlWV0I0?=
 =?utf-8?B?cmlYRmZ6TDBkekdZQjVtNFFvZ1pDWnhCNXZ4SDlPNWYvQ3d4MWFxRFFTTHJK?=
 =?utf-8?B?K1kwcjN1ZFVCc3BLWTRlN2JpQTZlK2J0UlFFbWFEc2hLckNZcWlHcFlmRWdT?=
 =?utf-8?B?ZzlpRHE2TlNLcm1aZ0xkNXArdzRMQ2MrWlc5U2FVTDNETVVlNUJjdFl4WlFx?=
 =?utf-8?B?MGFISkdlakJzNnA0TzJ0bnBrOUdudm11aHFvc0FwR1phOHd4UjErMm4yTFVQ?=
 =?utf-8?B?eWFjeVh4c3E4TUVmV1p4TUVUbkRmOGdDdXBnNDhKNmNNcTBhWXA1NmJJY1Bo?=
 =?utf-8?B?VUxrUW5kT2ZKd0ZIUjlkaHBUSnRjSG5hWnlsYzIzZXQ5VWtxNkpJVkNUZDB6?=
 =?utf-8?B?ZklYbWNOVTA5TmdwRTc5L3gyZDdmcW9hZDM3Nm1BTzc3dkpqbkxGbmZkWGFk?=
 =?utf-8?B?MGV3VmZiK0gvNnF0TmxBOGUzdG1uYkdHVzVaYTRQZStrSlF3WFRLMVI3UzhZ?=
 =?utf-8?B?cXU1YzVoOUpuMjFCZkN4aldqQ3A0cmlGdUVjUUxuM0tlUlZTdXA0Y2xRdnM5?=
 =?utf-8?B?ZlMzSXdFdlUzOGtwWk80K29YQU5xTnpaRGIrQkxwSW56MDFjQ0s2ME0rOWRi?=
 =?utf-8?B?eDYxNWlZZWx2L0VrTk0rcU8va0ZYVzdYeHkySkE5REtlb1czZVdUU0ZlRUxU?=
 =?utf-8?B?Yk1KVEtBczFNcW81WkdtUjB1dXkwS3NHK3lKek43REdWWFlOMk5KUHkyR0tS?=
 =?utf-8?B?TFpMVm9PZ2ZVMXV4dDBCazczeFJvd1A2T3FrMFZDbDAxOFU3aGpjU0hiUGRB?=
 =?utf-8?B?Z0pPRytCc1FTTGc5TGtiQnNBc0N1czc2VkhTYlBudlpBbFFCc2lWMG9aK2o1?=
 =?utf-8?B?VzdOdnllYjBIa2JsRXJsVkZpQ0hoQytHVktrZ2wwTGxPVmx0dzYxZ0lOMzNN?=
 =?utf-8?B?b1JFcW4vMG9mMHgyM0o1bHZySjZicmwvQTA2Q3NRdjBkRGgxdDdpZThxRkxw?=
 =?utf-8?B?c1ViSjU1TVNydU54S3JWS3g4UTZKRkszcXJTUzNob1RaRVA3STJuMEFVTkJa?=
 =?utf-8?B?UzNxRERZV2UwMmQ4b3BJdDFxVGF3bWpuR2xWMU9qQzlHcEY5Z2M4NldnTGhk?=
 =?utf-8?B?c1dENnVVTWx2b1RGYmErR0owM252c245L2dGOG1hTnZGQ0VJMFRua2grRlBo?=
 =?utf-8?B?QTNEN0hSWThMb0lxZmo0SmdIZUMrUi9ZK3E4ekhxL0dxdzVTUkp2MGNuNG1P?=
 =?utf-8?B?dXY0ZUNXTks0VFdtU3UrT1craWIva2FwajlUdHplNlorcHF4UW1WN0YvVDFW?=
 =?utf-8?B?NDVFWUt1QmxIQTJwRHJFVy9RbGljSDd3R0wwaHJVNDhOTW9DNGhyV3gzdnhr?=
 =?utf-8?B?R2lNNkFNMVdIWktLcEp1SGUxeFZ0aWNjQVk1VUh2Mitpb1psQTA3ZW9aR20r?=
 =?utf-8?B?Q2krUy9KWFpkTlowQnp3eDFQS2RFeU1hcmJHSExOdnlZa1o3L1Q3RDdNSGVT?=
 =?utf-8?B?eUsrRkdWa2EyV3ZTZUN0MWhWbzVCRVFoSGRud1FBZE5xcHF3TzExMENXRHZO?=
 =?utf-8?B?N1BjaFhPc0FYMDN2bjVIaFhxSk1TUlhMQnVuTFpGSUxqYW9Pd1ZJTkNXWlA0?=
 =?utf-8?B?bitnOTJSUDdpYlhYdzlmSG14REVleHpzeThsOWNFS1labFJKTGl1NFk3Ylo2?=
 =?utf-8?B?eUorakNXdEMwWEJEeThXbmYweXFtVmZnZVl6ajBkOXhwalVzOU5FKzB5NWpI?=
 =?utf-8?B?R3lIRThxTG5wTWt4Q3lrYmhUVWNuUmJGQjhwcXRMNmlSaVFDVzVTUGV2VXFX?=
 =?utf-8?B?YmJ6RlArTDFRMkxFZFdkd0JZNWxnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	78Q1WjxTpNeaOQvNnZxFFRBgdgP7OMDCV6rTCyGKlgLaJLB0lOI6KO7sPVbAZW99k1NaoUL6HthZJSw5gzU8sKKTHe1KLaGVhYZo1iqP1bLXxnehvkzcUc3ngy7SMGtNQVvo7DrsCurpn47nAh8CuambE0VzF7u9yWsxHx+8c7CaUJEmHuxWBNC6FTERpIZkuAPMPEUpCXuDrLTgUG1oqiOoMDpXmL0jhFYasovx7i7ReAH0LtqD7mlOBxR7p/8UmjU82Wqw7jk0SGb6XRk/J4NeMVQ5vayEU/rYDRwP7fNlVnMg5xUUd8S6/5Mng7Smk5/pqfw8BX3EQyuSw/5CdcvOp9Va8QaRCD7iqQkWblDp3Xc/CCnJzCyNoFQqpSaQ7KO2L3RZHnzN2QN3ZG89ExdgmwJA1aS4UuHOWiOAV1g4I0YlR36cqoH+pw9IiZWN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 09:18:11.9731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c6039c-2150-4ca9-4abf-08de6d3c4ec2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9343
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:harry.ramsey@arm.com,m:xen-devel@lists.xenproject.org,m:Luca.Fancellu@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 68404141E88
X-Rspamd-Action: no action



On 06/02/2026 10:01, Harry Ramsey wrote:
> Add a new device tree property `v8r_el1_msa` to enable/disable the
This reads as if it was on/off option. I think it's better to say "to select the
MSA (memory system architecture) at EL1 i.e. MPU(default) or MMU.

> PMSAv8-64 translation regime at EL1.
> 
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>  docs/misc/arm/device-tree/booting.txt | 11 +++++++++++
>  xen/arch/arm/dom0less-build.c         | 25 +++++++++++++++++++++++++
>  xen/arch/arm/domain.c                 | 16 ++++++++++++++++
>  xen/arch/arm/include/asm/domain.h     |  9 +++++++++
>  xen/include/public/arch-arm.h         |  4 ++++
>  5 files changed, 65 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 977b428608..431d285b6e 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -322,6 +322,17 @@ with the following properties:
>      Should be used together with scmi-smc-passthrough Xen command line
>      option.
>  
> +- v8r_el1_msa
> +
> +    A string property specifying whether, on Armv8-R aarch64 systems, a domain
> +    should use PMSAv8-64 (MPU) at EL1 or VMSAv8-64 (MMU) at EL1.
> +
> +    - "mmu"
> +    Enables VMSAv8-64 at EL1.
You should mention that it might not be supported by hardware though.

> +
> +    - "mpu"
> +    Enables PMSAv8-64 at EL1.
You should mention that mpu is a default.

> +
>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>  for the DomU kernel and ramdisk.
>  
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 4181c10538..41f538fb50 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -315,6 +315,7 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>      struct xen_domctl_createdomain *d_cfg = &bd->create_cfg;
>      unsigned int flags = bd->create_flags;
>      uint32_t val;
> +    const char *v8r_el1_msa;
>  
>      d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
>      d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
> @@ -322,6 +323,30 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>      if ( domu_dt_sci_parse(node, d_cfg) )
>          panic("Error getting SCI configuration\n");
>  
> +    if (!dt_property_read_string(node, "v8r_el1_msa", &v8r_el1_msa))
> +    {
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +        if ( !strcmp(v8r_el1_msa, "mmu") )
> +        {
> +            if ( system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_VMSA_SUPPORT )
> +                panic("Platform does not support VMSA at EL1 (v8r_el1_msa)\n");
> +            d_cfg->arch.v8r_el1_msa = MPU_EL1_VMSA;
> +        }
> +        else if ( !strcmp(v8r_el1_msa, "mpu") )
> +        {
> +            d_cfg->arch.v8r_el1_msa = MPU_EL1_PMSA;
> +            if ( !(flags & CDF_staticmem) || !(flags & CDF_directmap) )
> +                panic("PMSA is not valid for domain without static allocation"
> +                      " and direct map (v8r_el1_msa)\n");
> +        }
> +        else
> +            panic("Invalid device tree option for v8r_el1_msa\n");
> +#else
> +        panic("'v8r_el1_msa' property requires CONFIG_MPU and CONFIG_ARM_64 to "
> +              "be selected\n");
Please don't split printk messages

> +#endif
> +    }
> +
>      if ( !dt_property_read_u32(node, "nr_spis", &d_cfg->arch.nr_spis) )
>      {
>          int vpl011_virq = GUEST_VPL011_SPI;
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 2eca2b913d..fc4c7ae734 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -35,6 +35,18 @@
>  
>  DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
>  
> +/* If this domain should use PMSAv8-64 translation regime (MPU) at EL1. */
> +static inline bool is_mpu_domain(struct domain *d)
> +{
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
I think Ayan's request to make this property generic to avoid ifdefery makes
sense. There is a lot of #if/#else blocks. This property/variables would simply
have a single field for Arm32. Also, you could perhaps make it enum and then
protect VMSA option with Arm64.

> +    return d->arch.v8r_el1_msa == MPU_EL1_PMSA;
> +#elif defined(CONFIG_MPU)
> +    return true;
> +#else
> +    return false;
> +#endif
> +}
> +
>  static void do_idle(void)
>  {
>      unsigned int cpu = smp_processor_id();
> @@ -731,6 +743,10 @@ int arch_domain_create(struct domain *d,
>      if ( (rc = sci_domain_init(d, config)) != 0 )
>          goto fail;
>  
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +    d->arch.v8r_el1_msa = config->arch.v8r_el1_msa;
> +#endif
> +
>      return 0;
>  
>  fail:
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 758ad807e4..1387adc0e9 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -29,6 +29,11 @@ enum domain_type {
>  #define is_64bit_domain(d) (0)
>  #endif
>  
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
I don't think it makes sense to protect macros. For me, it just results in
additional churn.

> +#define MPU_EL1_PMSA 0
> +#define MPU_EL1_VMSA 1
> +#endif
> +
>  /*
>   * Is the domain using the host memory layout?
>   *
> @@ -126,6 +131,10 @@ struct arch_domain
>      void *sci_data;
>  #endif
>  
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +    uint8_t v8r_el1_msa;
> +#endif
> +
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index cd563cf706..0ef445a273 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -355,6 +355,10 @@ struct xen_arch_domainconfig {
>      uint32_t clock_frequency;
>      /* IN */
>      uint8_t arm_sci_type;
> +#if defined(CONFIG_MPU) && defined(CONFIG_ARM_64)
> +    /* IN */
> +    uint8_t v8r_el1_msa;
> +#endif
>  };
>  #endif /* __XEN__ || __XEN_TOOLS__ */
>  

~Michal


