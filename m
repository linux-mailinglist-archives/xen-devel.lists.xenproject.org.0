Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CCBAA08E3
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 12:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971930.1360336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iVi-0005xA-O4; Tue, 29 Apr 2025 10:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971930.1360336; Tue, 29 Apr 2025 10:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9iVi-0005vL-Km; Tue, 29 Apr 2025 10:48:22 +0000
Received: by outflank-mailman (input) for mailman id 971930;
 Tue, 29 Apr 2025 10:48:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDgl=XP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u9iVg-0005TW-UG
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 10:48:21 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2415::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75fa51f6-24e7-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 12:48:19 +0200 (CEST)
Received: from PH8PR15CA0015.namprd15.prod.outlook.com (2603:10b6:510:2d2::23)
 by MW4PR12MB7013.namprd12.prod.outlook.com (2603:10b6:303:218::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 10:48:15 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::b9) by PH8PR15CA0015.outlook.office365.com
 (2603:10b6:510:2d2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 10:48:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 10:48:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 05:48:12 -0500
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
X-Inumbo-ID: 75fa51f6-24e7-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMQKR4LHtvr4M13atWuzMA+DRXHYFKeVY4H2yHpWGMqN+f0z57husT7g54PfBtKMNqWng1mgdkngmsIds4y35QmrA2pQvSs+T5MTuLOuDVYLblH4MavAKdsJx3f5HvADsjIVHCHeFFqeFuxdLCZ6ZtXKQ2juU4G/F8RIy5m48C7XytRGreBOFocGnMjZjMLTkZmaTAwweNlOfnBIIzuLNTFMcg6ZhS4WcfNbedZAd5WyqEcuRmAnb6cOYokesbH1J1e84Txpq5GwbU5yZbJa9bU836z6vbQTI/qEF1ghOJeZDrEtiQecGdamZrW4RyRbEduyK3ELX15agIV/24yOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sttm8s1uGCTttkHZMDDpjqYWTyRVWRUuSomde1IFgaQ=;
 b=AJTrB2pjOq+t6g6uHKey1SCWRRJ6VSk5FMIe+q0Jn8xHyTbJzxH3djyDYL7SkZesVlhG1O78zssRDSBOvpQE2S+Orj+g0BWKUA1kRRoJisMjz/7mK/JooA9rmxOr617PZxfFtpx4B0vo7bu6n/lyMl1JX+uMg1xZgqLm9HWkdDN33peNGgTbWPvNxcwNe+GvBZ5JjOVtqvxLuKYuZa1U+igs/C091by2xTKXt0VA5GILZXF8LbLL+yvjsgoZ0DFlQJGJBdgEtGuhS0AInd9RgaHs2LoN+T1hkHZ2XCcgCxgQDIIAzICF3odK2qfxDps+bZUhkPXpqndI3sGivlg6uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sttm8s1uGCTttkHZMDDpjqYWTyRVWRUuSomde1IFgaQ=;
 b=4U1RupvA+uugAVg1qD88CkOdU4kdh4g+v9Orp/i33U/pI9zWhy5v991j4DMS4TO9Bifo3GGcIGDP8GSTaNln2tDfQ/3q3leYgorQMLHipBZ16arrNF83+JH9BAwPL9XOinudbIp/4RuHbGYu31WUEpPeQysARS1vvrx8lnR86R8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Apr 2025 11:48:14 +0100
Message-ID: <D9J2AOMDX4QZ.2ZN0F028I3QIT@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Ariadne Conill <ariadne@ariadne.space>
CC: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Alexander M .
 Merritt" <alexander@edera.dev>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] x86/hyperv: use dynamically allocated page for
 hypercalls
X-Mailer: aerc 0.20.1
References: <20250428195736.2516-1-ariadne@ariadne.space>
 <77c9529e-8353-479f-994f-d6d668788374@suse.com>
In-Reply-To: <77c9529e-8353-479f-994f-d6d668788374@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|MW4PR12MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 68fe5ac4-859d-4a88-d579-08dd870b57fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aDlUeWdQY09zUXJjZEhmUWkrU0pZMjl0YzFSbzRrUVFZbk9yQ2hkeS8rV0dM?=
 =?utf-8?B?ZmZWR0R0MFM5NDVnMlpHdlp5TXl0Tk1RVnd4bFNSS2xEc25MNlZuZ3psSndK?=
 =?utf-8?B?dmtoZ3JlWGlDNUpUSEREWEpxOWRCNzdPTlJhQlJYUzN0K1RBNnpaMTMrOEp4?=
 =?utf-8?B?WkNxSDdqbjlwZmZJWG5rMUhyQTNTNFQ2K0U5eU1ybFR3enkrbkdoNVc2MExO?=
 =?utf-8?B?YWVhNWplbXlEak01aSsvM0NvTVdaSkQ0b3RJODJqWm1kZm10NWdLYUlYeVlH?=
 =?utf-8?B?Wmt2T2sxeWQ1aEN6KzBxakFhUjlZQ05uN1JFQ2xDTGQ0S1JjS1hSNVVNSTdP?=
 =?utf-8?B?MjJidHNvcFRjdzU0K2NFWFpIZDhONnMyVjEzN2RoWTdKSTBRMDVhZFV1ZFRE?=
 =?utf-8?B?OHR1MTBzTHg1R29QSFFKOWdPVElZTTZGRUtndjVER2ZkUUMvZnl5cXRiSjQ0?=
 =?utf-8?B?VDU0RUkzN1FsdTdraGxwRi9FNWREc2d1NjlBMU5HWkNxOGhvaFhZWDJWVVdh?=
 =?utf-8?B?VGhUbWZZcld6TGM3Z1pmS2R4M2s5ZERmamhtK1VxVXBuTmxuc3Z1bmg3Tm9P?=
 =?utf-8?B?YUFKdzJGNzc4ZEM2NGtXdXluY01JRWVCYVlvNlp1ekprV3AvRWZwSWpSTVU4?=
 =?utf-8?B?b2hhUlU5M0VQOXpKd3p3ZGJYRG9hQ2JvWmZlYlJ1LzM4SGg3WlJlbzdDRk1h?=
 =?utf-8?B?SEdOakgwUTNQaWh6L29kSUFZai9tcHFVS0VGeUZXMmUvam1Sa2RBTzhxWXhE?=
 =?utf-8?B?RmpmbTVBMWRveG4zNWt5VkZkdC9FTW13eHlLQ3RNNDB0WFZQdEJQa3JPRlNt?=
 =?utf-8?B?TlcyanRyZFJNa1hPdVZ1OTUyd09HcEprUjNvVjdJUGIwbWRKQXFFMkJxQmZV?=
 =?utf-8?B?TUl0ZE9QeDdFa3hqWGhJbjFiQ2F2SlU3bWQxeDRQWGpEVUtEREV3djFwblJX?=
 =?utf-8?B?eDFSRDBzei9PVDEwdHg0ZUtObThDQTlyK2duMFVPZnlhVnBjcnNTeDErTWhu?=
 =?utf-8?B?cXJKQkJDa3p5d2l1YkhDeHpFRS9KUHhPTFJSMGJXdkhqRGZSeVpsNktPV3d0?=
 =?utf-8?B?YzVnelk0cFIveVNiSnlQMVlvemc4WDdXZHFMQXB0MGtDbHhxWXlQS3gzZGhv?=
 =?utf-8?B?WlBSeXZVeUdQam4rS1J2YWx2akcxQmdDSHBCQmdiZUpqS1RPajV1NGRmRG9C?=
 =?utf-8?B?N2hoTm9EQjFxMFVEeUxnNDI4ZENEVjRZMm4ySVlsdk11YVVQK1FsckhIOTBE?=
 =?utf-8?B?TkFMbnVWRDFXSnZjLzBXazdJN3hoSGM5M25iRlArWnpObDgzNWtkYldMV0Ez?=
 =?utf-8?B?SlBnSXVEejhTUGhqN1prcEZ0OFhidmxIYWwxZFRucnFuSTNPZ25XS3ZBaE1L?=
 =?utf-8?B?MVJ4OFpldC9sTFRGOEZXWnQrczFnTWkvaHlCOEhKejBWVHUyYmhJaTlnenYw?=
 =?utf-8?B?TmlSZXZ5M2svRUNERmUxZEdNR1lLOVRFeGhmTlRlS3VzN0NoSXprSWJJOFh1?=
 =?utf-8?B?bTF0Yks0ZnhFUVg5WGkvdTVYc0xGR2VSbi9JSDF4TDI1d1RLTUVyakUxNENp?=
 =?utf-8?B?M1podE41NW5BUzdiUW1EYThhWktpd2hUTVBGcHYzZWw5dFRvclVwRnJOeEFO?=
 =?utf-8?B?MnA3dGhkYytraW1ZdWdiVnRWUXhweTQzbW14eDI0TWhSUitPYWRCc3NrdXk5?=
 =?utf-8?B?ZkJnRStPRi9GUU95THJJejNTN0pTSy94dW1NM1lSUm5aL3k4MW5JMXlYNEpQ?=
 =?utf-8?B?OHhqLzZjNVpuR2dGY0F5ZS9NKzV6SDFVWThCWmVtTlBoOGxkRnFmZmRBbEt1?=
 =?utf-8?B?ZGdwV2NRZ3pTc3JOUGtVU1JrbG90MEVDU0Y3RFVLM0lYV1ZKQ3lMZGRDTWRB?=
 =?utf-8?B?YllwTDJUVEFyN1FzZmJYWlRmbHVRMS9PMVJCVmJ2Rlh5WXFiY2UyQnZaRHVk?=
 =?utf-8?B?eTBKcXlxMmk2ZnltU1pUNXVDZmZoVGVOUGVyaDVpczQ5YmMvZTE1aENyTnh0?=
 =?utf-8?B?ZVJGZXdmdkF5dEZzRXBEbUZrRjZmbG9uQWx1WE9QY1pWd0pTRS9IeExtc0xz?=
 =?utf-8?Q?hL84Yc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 10:48:14.5788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fe5ac4-859d-4a88-d579-08dd870b57fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7013

On Tue Apr 29, 2025 at 9:28 AM BST, Jan Beulich wrote:
> On 28.04.2025 21:57, Ariadne Conill wrote:
>> Previously Xen placed the hypercall page at the highest possible MFN,
>> but this caused problems on systems where there is more than 36 bits
>> of physical address space.
>
> Hmm, I should have asked already on the earlier version: What kinds of
> problems are these, beyond ...
>
>> In general, it also seems unreliable to assume that the highest possible
>> MFN is not already reserved for some other purpose.
>
> ... this particular aspect? I find it puzzling that such problems would
> depend on the number of physical address bits.
>
> Jan

Pagefault on access (due to reserved bits being set) on access to the
hypercall page. The available guest-physical address space doesn't seem
to be as wide as advertised, though I didn't carry enough tests to
single this as the only explanation. Seeing how we don't really know
what's already on the last mfn this seems like a strict improvement
irrespective of the actual cause of the fault.

Cheers,
Alejandro

