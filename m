Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4E7ACF54E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 19:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007262.1386569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEKX-0006yA-DS; Thu, 05 Jun 2025 17:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007262.1386569; Thu, 05 Jun 2025 17:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNEKX-0006vO-AX; Thu, 05 Jun 2025 17:24:41 +0000
Received: by outflank-mailman (input) for mailman id 1007262;
 Thu, 05 Jun 2025 17:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZN0r=YU=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uNEKW-0006uq-33
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 17:24:40 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20607.outbound.protection.outlook.com
 [2a01:111:f403:2009::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5200518-4231-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 19:24:39 +0200 (CEST)
Received: from BN9PR03CA0843.namprd03.prod.outlook.com (2603:10b6:408:13d::8)
 by SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 17:24:27 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::2b) by BN9PR03CA0843.outlook.office365.com
 (2603:10b6:408:13d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 5 Jun 2025 17:24:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 17:24:26 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 12:24:25 -0500
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
X-Inumbo-ID: f5200518-4231-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTuFHoG1hlasG3u/d/rk/TWbJl+Rw2jQB0bf+1jSi2hRLUuqCoymYl1vWK021gUk+5AxgFVyLXX4tOrdCk1Mjxg8a64RckjsdrUII17dupFug8TPIvEtzqAAQA2HWQK6yxtya3QYtJHIUhhLHPv/brIjoBfEBUSN5quztJ2wNS+8MDLy4HRhexYKznH/Wb/un9sd0rqsoLz8n9B8KZs+q1VigAH36biPyMipjmUYOJKDS/zWgKpbUVEHK9cqm5jgJNgjHDZkodOsJjtXp93oPYCSp+bPoBygPb1VWhL+ZxZnDjv3HIJ5wgjoc5VxunuandDz6OSpc255V3yRgW8vvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D80S4PzSvkkZeEbj9tYBBYrE8wdR2yvAkrGC5poV8v0=;
 b=lEI3BJBlbH2nrYmYKUOXX0q0V1Pnsn2QD2MVfv4aQdAsurbJz0xRiUTdnmlyI1aI+JptOvrsnqTOvSDH6x3FPLLdhJ+7Mvu3RIJjfFuaLSH3oP18SeDqCZn8ru5S/JLueL0e0HIWANqyqOnSdHRWZ/5n/HeIb39eqRwD55eCC4imBWefUJpy2ksJ/f66E51fi5JlSEnhle1iIRM8hlGL1NudDUpi50zVBTEWObH6FMJP0UFvjXAZGgJ1eZDmM4ONHVWdhBGWJS/p8nSasOkfFtaS3wdYGzL/KVFVYNuaN0IT2u6Yj9ydrLdM7L9Ul1ZWk6V9Or3lW8rpofXhNpuxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D80S4PzSvkkZeEbj9tYBBYrE8wdR2yvAkrGC5poV8v0=;
 b=o7dzvxfEAV0bs79j3hW5rZeHKc8mUHzOBwXK+QEapl1NCFotRQ6upq/wh1rc+62tQf5PUDZk28ZNs/2YCZUeNI0Hv4BsvibqBI/OgM12ViEoB7dCnJEFUmNaj6Pc9dgDvtoux/QiMKgj5n04Su13gpwNYSnrLrnhq7lGhrg+KWw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 5 Jun 2025 19:24:23 +0200
Message-ID: <DAERW5PFQRME.3KH144KKHWOBW@amd.com>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 08/19] xen/dt: Add BOOTMOD_MICROCODE
From: Alejandro Vallejo <agarciav@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: aerc 0.20.1
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com>
 <20250530120242.39398-1-agarciav@amd.com>
 <20250530120242.39398-9-agarciav@amd.com>
 <alpine.DEB.2.22.394.2505301759260.1147082@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2505301759260.1147082@ubuntu-linux-20-04-desktop>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: da19c4d0-53a0-4d50-a7aa-08dda455d278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWxhT0pkdlRuOG5RUWNJaXRZQTBrSnZYQzUvSWViUjIwSytZeERRSnpoaDNm?=
 =?utf-8?B?aHJNcnZuRjB2Mi9PTVJDem9QMXFDNGNFc0VSSkpnTzRLRjV0VHIvUUh2M1Zp?=
 =?utf-8?B?d25WRFpPRzNoc2s3TkNaNytIUEZ3UVZ1T1c1aXJUaGVKUmIrZVdMRUJzRFZu?=
 =?utf-8?B?V1Vpa1hiUXdUeVhHQkdoRXJvcTRIYS94c2Ridk11akFDYXIzelNNTTE1YnZP?=
 =?utf-8?B?YWRSUDd2ZXNpbGdqcGxFdm1ncE5pd1ZqQ2RjdkhRc0dNa3R6dlJoUCswS0hZ?=
 =?utf-8?B?dnA0YjJhWlI2Z2pGMlFpK3JoYUtMbThPN3pBUDlpWDJManhkYWNCV1VEWnE2?=
 =?utf-8?B?R0pRWWlqWGhKTUtneDdLMlVvOGw0UWYySFZKTEpMWkJOa1l6Q2NVWEdyYWZ6?=
 =?utf-8?B?ODh3Z3ZoUDY5TmVWY3ducGhwOW9UOEE5L2JndGNlYWdpL01McmtZUE1VbU5F?=
 =?utf-8?B?b3JRT3l2TU9lQ1lRTEM3UWxRaGthTWMraXBSdGxMMkhTSFdBQU9nb2dKbHZZ?=
 =?utf-8?B?KytOamNRRVBsRVp0bVlzNnFEZEgwUksvZXNvTzFKaVREenBXUFM1TC82RmVM?=
 =?utf-8?B?M291a2VnMmd1WGhqY2lUUXdoWUFZMVkzc2F0ZXZpMmNXZk0xb2VqWUZXdW5t?=
 =?utf-8?B?TzRURk50bFJFcno2TFkwb3pHTnRiVVdQUG8zSXJRRlRGTTBTcFhsajBGV3Nm?=
 =?utf-8?B?UFpuL2FaQm5BMXM5VHgyc3d1eURjK0t6Q25Bblc0U0pmSDAwT3lXSkR4WVlp?=
 =?utf-8?B?Q3ZwbTNNYXB0K2NkN2VpSFZidi82MW5LaStXa1g2Z0V2eDFKOFdpQTFLOUw1?=
 =?utf-8?B?dXZHL3hDS0U2MXdDMmJ1RUozRzc4bnA3S0NmMkhpN3BPTm9mQ243L0hUdWtK?=
 =?utf-8?B?WHRJRUtVa0tTVzJZNTcxbU0rYnZHcXZmbElnRXk4ZXk5cUNZcWlzb2R1Z2F2?=
 =?utf-8?B?SCtlNWM0R1BDVEZPbG40a040OUg5MXZncTFQNHRBNUw5RmVuY1F2Sk9hNnp0?=
 =?utf-8?B?RlVpM0o3T2QzY0hoblRUNUFDTFJMbkhiaHBCdmhyN1ZDUnZGOXdjdUdaZjE2?=
 =?utf-8?B?NmVsVkVRNlpyM29vMVR5Um0rSjlNUXR2Vmd5UWtqbUE0TllCY3JKZHRHRGZH?=
 =?utf-8?B?dkpHVEFDdWNqYmJ6bFMya2dOVkRiR1phMXFldVVsVW1iQ3dqOXBRek92Slh3?=
 =?utf-8?B?a1BGRWQ4QVhxcDhSTzNCa1RuRnVkMnduSUJaaTUrWXlHOVlOL29HY1lpNHd5?=
 =?utf-8?B?eStPNDdBZDhMaFNLQnJ5N2RKdjdwbTU3YWM0eWdZdTczM043bkVIcVlJeVdN?=
 =?utf-8?B?YXgyODRFRVJIVGgyTUZ5K1Noa2hHTHBvTnU0N0l5eDRwMGtXZXFINTNHQlhN?=
 =?utf-8?B?S0JYUkkrcElXTERsK2tCeUFtbUVNc2NpTFc5NkdUMGxheVRBNDIwQjErN0FQ?=
 =?utf-8?B?U2VOc2EvMDBqQVNUa3lQVVNBQVJDSUEyOEJwVWdBZDVQakY4M0hjU2RUU1dQ?=
 =?utf-8?B?SGRWSnF2ZUJTVml3RmRTdVlSZFpmMlNhNUMyeit4dG9QRDlXcTZzaUVnVzVp?=
 =?utf-8?B?Y1RnWm43UVA1QWVncEl4QjdpaFJvbkpKaDVOdXFsV0QrazRGVVFYZlZyMWg0?=
 =?utf-8?B?TG5kMkwvSCttWDNhZEJIZG9ybFAxZTRMd0RoWlFmY0pReWdOVm5wQWFZMXc1?=
 =?utf-8?B?dG9VS3NYc1VJTkNRMnhLWWNjUHZXNkZVOW1NTjhCNUlFcEJhK3pIZGNEK0dm?=
 =?utf-8?B?bDFEUUIwWk5Pd3ZVUktMZm4rOWF3V0pOZXlzUnlEZVIrNm5DY001c0dzS3Zk?=
 =?utf-8?B?RDlBNk1paWJWcmJPbU1McmxRMU1zY2NsbTMraUJ6bTg4NnNpdS9OT0pSUUU4?=
 =?utf-8?Q?OrnzQK+yPCYsS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 17:24:26.6343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da19c4d0-53a0-4d50-a7aa-08dda455d278
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022

On Sat May 31, 2025 at 2:59 AM CEST, Stefano Stabellini wrote:
> On Fri, 30 May 2025, Alejandro Vallejo wrote:
>> In preparation for x86 to start using bootmodule instead of boot_module
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Thanks.

Note to self though, I should be probing for "multiboot,microcode" in the
early scan path now that this new variant is here, to identify the kind of
the blob.

Will do it for v2.

Cheers,
Alejandro

