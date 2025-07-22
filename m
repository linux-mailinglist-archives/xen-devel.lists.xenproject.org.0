Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B87B0DAE0
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 15:32:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052632.1421374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueD5i-0007FY-Us; Tue, 22 Jul 2025 13:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052632.1421374; Tue, 22 Jul 2025 13:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueD5i-0007E7-SD; Tue, 22 Jul 2025 13:31:34 +0000
Received: by outflank-mailman (input) for mailman id 1052632;
 Tue, 22 Jul 2025 13:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueD5h-0007E1-M3
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 13:31:33 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:2417::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d1a5904-6700-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 15:31:31 +0200 (CEST)
Received: from SJ0PR03CA0283.namprd03.prod.outlook.com (2603:10b6:a03:39e::18)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 13:31:27 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::1b) by SJ0PR03CA0283.outlook.office365.com
 (2603:10b6:a03:39e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 13:31:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 13:31:27 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 08:31:25 -0500
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
X-Inumbo-ID: 2d1a5904-6700-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGQWoPo5NgxHT4zUv9dnsNjUe2KFdYTX5oDJoh8h/O/NkoJ9gpukWBHCQW0d/E/xz1YowqSLCB9XdS4adUrYvTneyHdxARNW4heFA28is9U95JtRUSbNA9vK+ohxoczzCYYIiLAbLemC8lWgVRKhPsJ+1J2aaj2Ni6Hu8zvGuzlSrX325SJ9HvXF8nLDfOp2LPYdQ+q3fBy5CedCLxNWd2PZMCtmYKDANkYHhNRr4mOpN+NYfbDZDuIGr9E8wzeJZshjXsxHVPnbdLULZ5eVRNs2+68FHs5Lc1VVtem0MhqGM4afcFvJKxdjh72dR+MHtcp8Z7nLc0MFW1bAm4g4Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qh0tJeGUWSR+R8OyP4NO55PQUHqjeCSZBj19WYOysWA=;
 b=UH/GHpQsUdcJ5C/IlPhmodjGdnn08WrkYUy5zM/miWlZxDwc9ZEF1F2hyZXbhbYl/AWcQuHFK8765pR7TXISxLKQ2lWPO75q54V0mb+uhQHyo0MXMp+PbMRDN9JuVmKz3Knt+GtTQylrC38hOrd56VozGmGqXvVz9LQtcUuCBsFfYMPaCn1t7HuhJS5TobOQz+NruY6p7Z/bXWAeXJ4HVMyqDDgU/m/vJDtfJMAe4xtleR34oaiVzkYfsv0ZNSxdyiZ172rUqyioZgOfiZPw7XLd+3nGfLwIMqcuC2qskN4KYr4W3CU1AM853kknt09vOB/vZqR5B7reRuUyQkzGdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh0tJeGUWSR+R8OyP4NO55PQUHqjeCSZBj19WYOysWA=;
 b=WaNLVCUuB9a+Q8arA6DLj0aymye50bc5EgCcj3SCQb6CQ92pmbHEQIvow65MunxxKN1yX12PURwFUTZ61M8oBneOUZaUfQtkV0XA9NeZi6NNgALMlDpc/Eu+6HVfBkZYc2jUAOTTbBqzLH6ieGOaoJriuHyrPekUn/vLej3rAtQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Jul 2025 15:31:23 +0200
Message-ID: <DBIMDD208BKM.29K5RWGMS48QS@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 09/10] dom0less: Reinitialise all variables on each loop
 iteration
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
 <20250722115955.57167-10-alejandro.garciavallejo@amd.com>
 <e18e45f6-cffd-4bd9-9091-d2e5e979ffb1@suse.com>
 <DBIL7TSOVEXY.2SBQ063EVQ7GK@amd.com>
 <f88a499a-86c2-4247-b788-a37115c17067@suse.com>
In-Reply-To: <f88a499a-86c2-4247-b788-a37115c17067@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 6073373d-ec29-435c-2396-08ddc9240f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWQ3WThmVHFEN1JXSUowQlhLZm1BdTlaNk1sQ0pSTCtiNHFkaUhFai96c000?=
 =?utf-8?B?TFJBeWIzRFAwRnpBcUg2U2xyN2NRWEU3SlNrNFhSWHN4d3BwRzEzVFZwajEx?=
 =?utf-8?B?dktHZEJ3Ync4MWhBc21SbEo4QkU1RE5Pa25WZjQ3SFJZNVZuZEhGbG1UTjVu?=
 =?utf-8?B?UDY4akhsa2hoYzlkQXU0WHAzNHpEZ1VIVmxiNnZQQVhiREdhK2JscUJWQzlN?=
 =?utf-8?B?VjN6M01UOTZXUkh2OXl3Mjk4VVN2K3VxZ0VZcnhESzl1dTNxeGY5ckFrV0Z6?=
 =?utf-8?B?aHJGYlRlUzhsSHRlSE9ZQ2kxZmZ5aEpmRzRoQ3gzUDh5cUZ1aCt4SUx0TDA0?=
 =?utf-8?B?RTVVY05MUnRmTXhpSWFFMDFKb3VtWW1OejJRTzczYStpSG1uV00xVzBnOVZm?=
 =?utf-8?B?Vy82L0RacUxra01qVlhva0lFZFNlaWYrWjFDK1dGU0FkQTFXaGpkK2VxZ05O?=
 =?utf-8?B?QlE5cmlUS2RwQmpneDhKK3JhRSs0RFhTU0NITHAxUmlpQXRpMUQwRHk1WTlr?=
 =?utf-8?B?QnVUTFFKOG12ekd0R3cweldwMVZPeWtwNDF3RDdaeE9kK0wyTytQbXM0MHY2?=
 =?utf-8?B?NVZXbEdIbHJWMVN2NTZ0TXY0emRxWjVpb1VGMzV5ek5uVDhlKzd3WWN4eWQw?=
 =?utf-8?B?V3N6aXZXWDNJdDB6WUxzT0Zhc2JPdklqdWRlRUZPU1VYRnBhUmtrTnlGRWxl?=
 =?utf-8?B?QldtaHp6L2ZET3pTR1hLRTQ0TGNwSW50a1BCSElIdVlXQzc3SjlrT0FPeG43?=
 =?utf-8?B?VVVnVUY2M2xIcUNWTDQ1Z0ZnQnpObi9Jd3cxb0creisyQm1pbnpXenFFRzZL?=
 =?utf-8?B?U0xnL1lVT0RGK2Z6YzdFa2lIT1E1MWtBM0QrVWg3ZEZGRmxzYWllWURkdmJZ?=
 =?utf-8?B?czREUUIxMjVQY2RNRGZ6YnQ5Zld6dllWdmc4dC9La2JkVExreHBUWk5kWTFi?=
 =?utf-8?B?MTBOeUlPbnpzdk9McmYvUGZEbTdOSmo2ZzNFaGdlbzFhaUxhbEt1elRuOVlQ?=
 =?utf-8?B?S0VsRmh4bWEzNXBRYTNZV2VhQ0RMSkR6YnBRYS8weGo2N1NBWGdDeURsSThY?=
 =?utf-8?B?QlVjeVVVb2piWGxTSmFWcTlLOFE5dEtrNFpKN2t5czFJbGhuWjdMb0FoQVhK?=
 =?utf-8?B?TFVuK0JRT1Q2WkVzOTVuc2hRQWlCMWoyR3NKQVhoMllqNTFGSTQ1eVptSjJj?=
 =?utf-8?B?ZFhHZmN6ZXBwUEZBMmhoeVZWN21lUXRYZ0JQeWtNYUFEWnpHZG02Z1RTcEpN?=
 =?utf-8?B?REgrZ0ppRlhTT29mZFpUQU9RUWNGVlBpYUxwamU0c3BwbDJ6L2srNmZ5cjhB?=
 =?utf-8?B?Rm5QWEdJdFFqVFNaUWg4d1N0RU5hQzNMN3QxdDNUaGUvYVVHQm03blhEY2pM?=
 =?utf-8?B?eHFKV3VtVDhxdTMrRlk0SWMzM1NSenNlSGxsbmhiQ3RUVmV2UDIxbDU4VmFZ?=
 =?utf-8?B?TW9NbkNRREZJdkUwZE9rUUhHZWY4OFhYRHFuaThEdndFMTI3U3hRNUx0MXNR?=
 =?utf-8?B?MGxBcmNxQktldmpHTUNxSUtqOFhQVFFKejZhSVRNa28wSVB2Z2tRUFFScEMz?=
 =?utf-8?B?MWVoS1dTUm5RbDQ1UzVQZ0FBcXBvTkJLSmJJM0ZlR285V3pRV2UxY3p5ZENK?=
 =?utf-8?B?c1U3S0pFZUFEWVZTaGo4ZFZvT1pTeTRjbERxMjYxM3lYMDQ3WXNlZXBMTzlV?=
 =?utf-8?B?bVdtWG5Jc3NDVStzSVN3MmhzR2VYcWdGeHJ2L2xoT2pXcDQ1eng5aXpsazZF?=
 =?utf-8?B?cW5BMGxiM0sydW9qQkhyZXdtMVRNR0h4eHpUUmZWZDNSY3hjSGlxcEJPckJ0?=
 =?utf-8?B?YnBMNW15QnBkYnJSckhwRERtbU50d0ZGZGg1c0h5Um5USWRnL1lhbUl0bGJt?=
 =?utf-8?B?ZldYV0puWGZpQU9KeUR5dmNxSTJXR3daVWxvVHE0NlYxTllIeHEvdUp1OXNS?=
 =?utf-8?B?T3BBc2E4d2dvRWFLeVQ0bzJ6ZG1tWHlKOEFZMmxQWE9PSVg4NUJOUzNJUVhM?=
 =?utf-8?B?Z1RtcmE0dlcvWC9HMDRRZ1NXMDRObzR1TzdjbmlRSzV4M0E3MWFNUDF2VDZU?=
 =?utf-8?Q?YSgw45?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:31:27.1322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6073373d-ec29-435c-2396-08ddc9240f82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224

On Tue Jul 22, 2025 at 2:57 PM CEST, Jan Beulich wrote:
> On 22.07.2025 14:37, Alejandro Vallejo wrote:
>> On Tue Jul 22, 2025 at 2:18 PM CEST, Jan Beulich wrote:
>>> On 22.07.2025 13:59, Alejandro Vallejo wrote:
>>>> Reduce the scope of every variable so they are reinitialised. "iommu",
>>>> for instance, isn't being cleared, so the wrong flags may make it to
>>>> domains that should not have them.
>>>
>>> Yet "for instance" isn't quite right, is it? "iommu" is the only one wh=
ere
>>> the (re)init was misplaced. The other two ...
>>=20
>> We do strive for minimal scope where possible. But you're right "for ins=
tance"
>> might be misleading in suggesting there's more bugs than one.
>>=20
>> I'm happy to have "for instance" removed, leaving the rest as-is, if tha=
t works
>> for you.
>
> Except that "every" isn't quite right either. Nor is "they".
>
> Jan

Ok, take 3:

	Reduce the scope of dom0less_iommu, iommu and cpupool_node. iommu, in
	particular, wasn't being cleared, so the wrong flags may make it to
	domains that should not have them.

Cheers,
Alejandro

