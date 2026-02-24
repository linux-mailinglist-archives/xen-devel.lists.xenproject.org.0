Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PP9F1CynWnURAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 15:14:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8CB18839D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 15:14:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240085.1541578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutB2-0001xR-4P; Tue, 24 Feb 2026 14:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240085.1541578; Tue, 24 Feb 2026 14:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vutB2-0001vD-1L; Tue, 24 Feb 2026 14:14:16 +0000
Received: by outflank-mailman (input) for mailman id 1240085;
 Tue, 24 Feb 2026 14:14:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8A/i=A4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vutB0-0001v5-RA
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 14:14:14 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1709c737-118b-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 15:14:12 +0100 (CET)
Received: from CH0PR03CA0445.namprd03.prod.outlook.com (2603:10b6:610:10e::31)
 by BY5PR12MB4210.namprd12.prod.outlook.com (2603:10b6:a03:203::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 14:14:06 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:10e:cafe::71) by CH0PR03CA0445.outlook.office365.com
 (2603:10b6:610:10e::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 14:14:05 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 14:14:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 08:14:05 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 24 Feb
 2026 06:14:05 -0800
Received: from [10.71.194.215] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 24 Feb 2026 08:14:04 -0600
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
X-Inumbo-ID: 1709c737-118b-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sB7Hxawh7TAjTefm6NuFAA58bz/qUqzJ3zEca+bYpjlzQXt2imLzZKM/XPutEvT1tudaXv+J+s+UixNTzUEn8LA2O1fmy1FhRxl1KMwQp29MXTX5wVYQZLe/1W91sSOiLTkKDvnt2KQ6kRMEuvlPBBVF8AAhogrnlseEuF0/fiw/iRqOe4E7ZKsT0FdYJx5GoCvPmC9yUioE77fKSgFZFvqolFW0IVFKl6KQcc44GjjxyH9UpWgn+821FMKEnX98b0KC+qGXq76vMu0LOM0G76uez5qT0jnfGub9RzdBOwuyOP5aNXMMSnj3VMDTfY7kfIG/Oi//RhF5XOpjrNhFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwF2Hy8nkHE/baHPoCLHkv0AMVvgnCOSRvJcC3RQz8Q=;
 b=Su+ZYzPipSmYOh3BF1melwBWElqbh2pE0/MawGXqf1ZsUt4iPdeIYt/eqNRD92AKkybNPMxMxgSbE1nEazw3Mh+gJrZzi9BWgqN1tvff4ns6HEBqpNUMCsZ5cfA+9EzsvJMkQ4+onYcXjkFEz1lzOGPqyNc1AvNr2oYPzCOjDw9W0BVYv85C5NkgGbvHRiHYzyxIoB/HYNIrraFPla1jLB3fztTQq7PZwLJwrrP9F9539So5V3+p260H9bzrtrVLfuIFqfkla+XA5XVCZzU6jmjfGzwnps00wnOrYMPooxWy0hL2PCci0sCzWb9DdI7rU+Fy5phJx6EzI/nNLi5CXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwF2Hy8nkHE/baHPoCLHkv0AMVvgnCOSRvJcC3RQz8Q=;
 b=Xp7EXOQAHWDVlOPTtl/Wh1rZYNhbwYAk9siFQVJ+AJpnfnHupgjYJaNvCawu48GfDZDNQNBWl7KR2fc79jBN09a/rD5Dh6ljQs81eVdghiI+8APsoFeNvp6rmLShylsOfuIKGSwN3RrmQb0VS7Kfg00m6aL8ZiJtZzHP5LUytzI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <631f2de3-f551-412c-a465-34cd5d8db8a3@amd.com>
Date: Tue, 24 Feb 2026 15:14:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Simplify SMCCC handling by reusing
 __declare_arg_$()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
References: <20260224124558.3675278-1-andrew.cooper3@citrix.com>
 <20260224124558.3675278-2-andrew.cooper3@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260224124558.3675278-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|BY5PR12MB4210:EE_
X-MS-Office365-Filtering-Correlation-Id: bac1198c-13d0-4135-ec67-08de73aef83b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L3dsVEpRczFNMHM5azI0U3A4TitjaEczY1RSMFJXMUYxckc0dzJKeklLNTkx?=
 =?utf-8?B?KzhBSng5czRvckpJSm1Lc05QOE5uSUVaL3Vmc1lPYjVQdVk2OGdNNTNPcTdY?=
 =?utf-8?B?d2pGQ0NVRDNtcTlRT0hONEJUT0xicnJ0TlVzT1pxLzQyNW94VTJDaXQ5K21X?=
 =?utf-8?B?bGRsbXg5dDByNnROVk5HTk1WaVdjMnNDeURWVXdIUEF5clNQL0JZU3kydDZ5?=
 =?utf-8?B?UjltSkZUWDl0ZXVKNzZxbjExUnhJNTI1Qk9UN3VjNStuL2V6WmExcWtXdGdK?=
 =?utf-8?B?d1p3NERwMDlZZExxZzJjQ3F2ZGlmNE5RRnRXZ0trNWFVTXZSVmFtT0FzQlNm?=
 =?utf-8?B?S3VzbzdIUllFK21NQ2pYOHFsTDJWSDc3V016YWpYclNndHBtb0c2eERHUXN5?=
 =?utf-8?B?SnBLdWhPQ1JpR3lUdUdQd0RrWkZhQ1BqdDFWWnZKOGdUUlN0V0lPQ2F4cUts?=
 =?utf-8?B?RHJZNlF3MUE4bW9hQjFkVk9KWjNhT2ZLK0N6Q3V3ZXlEZlVFcHhERkdLb3dv?=
 =?utf-8?B?RXFhd1RCdlNza0FWMDlwa1Iwc2c1WFZpMUF6ZWdyOFJnRVk4eWtPUXAvT25p?=
 =?utf-8?B?N1haRHVBa2FiL2U2VHlsTVlBV3BQVkd6c2RrMUtmZXVPL3VFK3Nyck0wMTRC?=
 =?utf-8?B?V3BqcWF5WmxzbzVMQTJ2aDN1K25hVGFJL0R2NjRXK2ZuN2MvbUxLQWxkdUN2?=
 =?utf-8?B?THRERmxhajBKVlYyekJmTWNacmhaU1FMNmhkQ1NVVkh4MjNEb3E1M1JaVzFu?=
 =?utf-8?B?OENuZlRrNnZZTFQwakFXbWhqVHpPaldsU2VUZ1g2aDBXYnZyLzgvVzQ2eWtW?=
 =?utf-8?B?SHR4TjhzTnhScGExeGkwNWFFa01weVhwbWVCbGFCenh1SFRmY2M2Vktsa1ZP?=
 =?utf-8?B?ZTB0enZkSDBKdHQrVDlheEsxYnVOd3dENUFzNkJ0U09CK3I2S0trdFNGU1p5?=
 =?utf-8?B?NjFHNTJwYUxJVDQ1Mmx2aUkrTlFBT2JibHEzZUNzdHQzN29tQjNWYUF1SWww?=
 =?utf-8?B?Vnk1K3FtM2UveXpvR21NZ25iMkwrOVhoRkxlQ0VmSjlRWEtRQjVxRENLTFlm?=
 =?utf-8?B?bDZaQUduVkY3dmdwMG9yblptZWNadmg5Z0ZqZG52SVBpZ0M1b1NRdlE0ejhH?=
 =?utf-8?B?eWxiMDVydlZZY0pqVUIydFhjc0hQK0E0VUFYWXhLQ3RFV2VZVVdnQnFRdTRl?=
 =?utf-8?B?cFhNRjc2S21qZUE2MzBCeC9mY2ttR3QvU0RpRHp0WDRwVm9QVGhhb2k0OE12?=
 =?utf-8?B?ZjUvWDJEVUdOejlZRjBsTGUrYWJZZjZNVFhwV1QzY2lPTmgwQSs4aGJRYVFo?=
 =?utf-8?B?eVM3SjlEcHdtY1hMK2lQMzBJbTY5YktORitTeVdRV213QzJ3aXlsWXFxK1Zu?=
 =?utf-8?B?RjNzbEgxb3k0LzdSd1BRSkVuVXM5ZGJsVnNlQWs5YW0vNTNEMC9PaG5Oc3Nw?=
 =?utf-8?B?QWZwV2ZRMWExQVFqOG52K3p6NFFZRGV3eURzUGpqY0VuVmswdmxGdmk2Snlh?=
 =?utf-8?B?TVRUU1lXWUR1YkpBbS9RQk9ZaEFGKzV2RUgyUlNsSVNkQUc2dXNhQ0RtUUlC?=
 =?utf-8?B?Q0xadHM3WHIxZzNPd1lGRXpsY3Rqcm83bGxnaUtCcTUyMGtaNmY4cVR4K0x5?=
 =?utf-8?B?aUE1NCt2NkkwRFpyaENLaFdMbDdFc3hkbkZHQlgvYy9XQ3ViZ3pzUGRncmZV?=
 =?utf-8?B?UTdtT1RiOVlJY3llUy9vK0s5aUUzTmFvdnBKT3BVYUUyenc2dVJnanFiWEdL?=
 =?utf-8?B?bXhGWmxNaEFEY2MxcDRIRUV5cEFGejdmenV2NTYydkhIZU5KQTQyWUdoNlNK?=
 =?utf-8?B?TVprYm9iZisrdDdPVjFFblV4MjZSNTJraHhYbXpnbitDWDcxTERzR2tqblhy?=
 =?utf-8?B?ZVl0V1BHSjdEVnFMbVNVYmpXTWloM3RZRktOUGVZcWJKS0V3NW85Sm0yY0N3?=
 =?utf-8?B?KzZUMDNGQllOc0g5ZFczN3RnempzSXlvLzNGakNYTE9OVUF3eFFrRmpXbkRz?=
 =?utf-8?B?YzdtcHJqZnVVL3RuZ0dOZlJ2Qm9SKzVsSUJkN3NNa2E1akpiWHFKSTB5OWlH?=
 =?utf-8?B?OWw1ZDhLSUVmRkNScjZzczhwRzh3SlBxbTl2TDlsblUvMnZMZnMrelgrTm5W?=
 =?utf-8?B?RnpEVkRKZTA2aUtXM0FuK2ZpQVdJajhVdjJxcjREYXNDQUdUVWJBYXFOcGY3?=
 =?utf-8?B?MTZwQ1owNWZNWDlCSjdYRk5BTjAvTExoS0lhSkVSWHlKc3NVV2x6b05zM3ov?=
 =?utf-8?B?clNFaW9ITWNybjhDcWUySWU2cUVRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vx7OAtOJgiwdT0CbuNMW+Zhg7sq1wuVvci3Uq37NJASs89bjan1z224h7p5SVeuroYZhmoqBi4L8zpqWfu7KqL6vdYj84OA+C89mtnQD4Lvxk8VPlKUOUxhabd8fjZJHw1uh5PrvaIJkE7C1ksSpntfwC3xanE5hitXezIyb+rU6DYnvwawXT6VWP+B1CZCK/pacnJ9B2e8LHwj5uuUGsPcHL/2mlQxbI8ie1/MGre5cFyu2B8qfONkT2KIVucWTj4YU9/Qfcyw35JR82j2IZH7OxCv0GRci4e+TFmTnhqYy3TBNeX3MjwmURo1Bi97U5D6hR+tWU07Zm1DzZVInM4XKXmF66mMEvyrYd1+VXIjh+Zs8fnI+XxASQeU5qMWn9t75wMda5uz+j3P2jmgmjRv8/+DRWR3EjZeJlkhUtQ8q9Mc3Bp8+ZAZeg6LcFBf0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:14:05.8840
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bac1198c-13d0-4135-ec67-08de73aef83b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4210
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	SUBJECT_HAS_CURRENCY(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,epam.com:email,xen.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: AC8CB18839D
X-Rspamd-Action: no action



On 24/02/2026 13:45, Andrew Cooper wrote:
> Now that the type handling is entirely uniform, it's easier to see that
> __declare_arg_3() can use __declare_arg_2() and so on, just like the larger
> __declare_arg_$()'s already do.
> 
> No functional change.
This patch won't build.

> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> ---
>  xen/arch/arm/include/asm/smccc.h | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
> index 5b30dd57b69d..347c4526d12a 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -114,26 +114,17 @@ struct arm_smccc_res {
>  
>  #define __declare_arg_1(a0, a1, res)                        \
>      typeof(a1) __a1 = (a1);                                 \
> -    struct arm_smccc_res    *___res = (res);                \
> -    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
> +    __declare_arg_0(a0, res);                               \
>      register typeof(a1)     arg1 ASM_REG(1) = __a1
>  
>  #define __declare_arg_2(a0, a1, a2, res)                    \
>      typeof(a1) __a1 = (a1);                                 \
You should remove this line and ...

> -    typeof(a2) __a2 = (a2);                                 \
keep this line.

> -    struct arm_smccc_res    *___res = (res);                \
> -    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
> -    register typeof(a1)     arg1 ASM_REG(1) = __a1;         \
> +    __declare_arg_1(a0, a1, res);                           \
>      register typeof(a2)     arg2 ASM_REG(2) = __a2
>  
>  #define __declare_arg_3(a0, a1, a2, a3, res)                \
>      typeof(a1) __a1 = (a1);                                 \
> -    typeof(a2) __a2 = (a2);                                 \
Same here.

> -    typeof(a3) __a3 = (a3);                                 \
> -    struct arm_smccc_res    *___res = (res);                \
> -    register unsigned long  arg0 ASM_REG(0) = (uint32_t)(a0);\
> -    register typeof(a1)     arg1 ASM_REG(1) = __a1;         \
> -    register typeof(a2)     arg2 ASM_REG(2) = __a2;         \
> +    __declare_arg_2(a0, a1, a2, res);                       \
>      register typeof(a3)     arg3 ASM_REG(3) = __a3
>  
>  #define __declare_arg_4(a0, a1, a2, a3, a4, res)        \

In principal, with the remarks addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


