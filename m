Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB55AFE48A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 11:47:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038003.1410544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZROQ-0001FB-1O; Wed, 09 Jul 2025 09:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038003.1410544; Wed, 09 Jul 2025 09:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZROP-0001Dk-TZ; Wed, 09 Jul 2025 09:47:09 +0000
Received: by outflank-mailman (input) for mailman id 1038003;
 Wed, 09 Jul 2025 09:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eg2B=ZW=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZROO-0001De-VD
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 09:47:08 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2414::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac6fe863-5ca9-11f0-a317-13f23c93f187;
 Wed, 09 Jul 2025 11:47:06 +0200 (CEST)
Received: from BL1PR13CA0092.namprd13.prod.outlook.com (2603:10b6:208:2b9::7)
 by LV8PR12MB9082.namprd12.prod.outlook.com (2603:10b6:408:180::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 09:47:02 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::cb) by BL1PR13CA0092.outlook.office365.com
 (2603:10b6:208:2b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.6 via Frontend Transport; Wed, 9
 Jul 2025 09:47:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.20 via Frontend Transport; Wed, 9 Jul 2025 09:47:01 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Jul
 2025 04:46:59 -0500
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
X-Inumbo-ID: ac6fe863-5ca9-11f0-a317-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ku7gt9fk5hyxSpHQycwWWigfP55pjW7QZ2QRaaFjMO/usVv3U/wmA723zqYfyUxCUWXIYsoUFMNpq9xsC0EjVcit3h1yumkrckHjY6nJQ+r6lv9wtieK4g6BG2sJobm9yYQI1LPkmxeCVzbGL0CqenAjLqQYlw2aoKA4zbm6uquQOJXlDAGCqjUeV07snc4ItvJ6riXZf+0lT+axIRYVrYIdTrJfzDM5aIsMyT7Da18dDZ4EY2+2WTdc0CTmJt8jHJOLR1DzWJ5to9HqpmKAAJDA+nFJ1k9DBE4Cd94twUHxdspPHLscNS0BJZFsEO3o+7sD76fYsh6s7Laj8Of3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6GOUGGCYEhSHpIHqQ404WRzGd5lPz+cYjNRQsPeuQU=;
 b=m/oHM2wUJxK69/OWaTbBJhcA9jqPhuAGVthStmPSQDTcfuZ554FmbZ8Hw/aZXQW/AJHITtlMS1PxIJOYR/z+BpdZGZsWL80nUm2/bXy/nDbLgmRel6Pi8Xl9Xj/2cg31kdynTSBxB/k4zSyI04d0amkLU5D/PhPJt1mDFCmtGbeZTgEHEcGzqJiYvu4B3Fn12ziU64yHxP/f8j+qtLR5J0BVg84PSCtWqpiAM5/9Avzrml1TPd49q8KZlfZg585yWeURrfaWaKhgJDLilzp/3bp+S/3bbT4etRCQK3jB7wH/U6hT6B9dS11hbPwUISyMOBqtVDYx9OS66R+2pp286Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N6GOUGGCYEhSHpIHqQ404WRzGd5lPz+cYjNRQsPeuQU=;
 b=m3lOYiu8CqquA6+LR10ujWyIu3p+Uq4nnVSmqPJAkIY9gRH4tPZCCJSFqKeWRioLNxChI5pumKw5bB0vyw2SA3a6rEbwdiUdF1RLSSk59maSV30psW91f64UOLN8DdsmquSZF7mKvtB4ri/Wn0qHw+ryU2utX5iKJCjIAXUcgBU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 9 Jul 2025 11:46:58 +0200
Message-ID: <DB7FGG6STQMD.3FT6NRT4CI13@amd.com>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>
Subject: Re: [PATCH v2 2/2] xen/x86: introduce MCE_NONFATAL
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <alpine.DEB.2.22.394.2507081131060.605088@ubuntu-linux-20-04-desktop> <20250708183238.3104638-2-stefano.stabellini@amd.com>
In-Reply-To: <20250708183238.3104638-2-stefano.stabellini@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|LV8PR12MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acd4bbe-5212-40f3-126f-08ddbecd8dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VG5QV3hoVHVIekk4YXdOTG5qVHE0STAvdVcrNHNHS0RpeWZ5b3Y2OGllb2Ni?=
 =?utf-8?B?NmRSVjM0bDZlTTE4dHFDNklSRisvMWtrME5OdGdvdk41OUxidGIxcENBdkIy?=
 =?utf-8?B?UFdxRmlnVjV1eFViTGdZRC9FY25CcUhkVm12ZmY4UUNTYm9MZzlEMUZ4SE9X?=
 =?utf-8?B?R1MvUm9DcTFRYU1KejE5TjlDcmRESC9vQWJtWklaOFZsVUpycVQ5a1FVNjEv?=
 =?utf-8?B?cGRidHdYNmtERG83eThXRGFqdWhDYlJDTzhTVDBLYVZDNlpHTmpQZ2Zjejhj?=
 =?utf-8?B?dWhqL3VaaXBwOXIxTFNRWGRqcUEwS0xVaFZobkNxK2lOblFUb21zOWRmT09y?=
 =?utf-8?B?Rnd2MS90QmZlUTlEZ1JhMlM5ZVdDOVUxOFZqNUw3U3VFTCs2YjVrRkQ1NEth?=
 =?utf-8?B?SlZod1M0Vk5lQ3E3STdXSTU2YTRVeWM1QmpNbjI4NWEyeVNQQWtYeHZnWnQ0?=
 =?utf-8?B?SHRxQnVSY3haZ01oV252MWRFaHU5YjBweTJMQWRsTmdtV3N1bEpacmduS3ZN?=
 =?utf-8?B?bVdFdVZ4WGZ6SWJURVdkR2xyWitHcnVkSUxXV0NwaVVmbnVOSllxNHl0QWlt?=
 =?utf-8?B?K3M5Ny9oaEx4RTNaNkdQSURxM0YyV3F6VGJwaVNoRGpmRHJhV2ZSUUxVZUVw?=
 =?utf-8?B?UzkyVllBL0srQUxVZjVvY1Roc0xhdlQrb2JtT21hNHdQd09tMVZDdTRreHM2?=
 =?utf-8?B?L1pIK0dyWlNYMGhrbnRmQ2FBRUo5TWxLc3RqNFNhaXdCUlp0NUZLUGtycGlN?=
 =?utf-8?B?QXpkT28zbUFYd3ZDcFpDK3dRaC83TFl4V3NiWnVzanNpTHFvL01iaENxVHp3?=
 =?utf-8?B?Z3F5dmlNQnVsN0tYV1dBRmtxdzN0ZHYyNTZTcHBseTFtTXdxZmxJdFRCUWNO?=
 =?utf-8?B?VVp2amhBaXhOSm9HYXpzSDZQT3JUMnhlUzZwYWtCQVlDd0JLWDhQMkUxYlFH?=
 =?utf-8?B?NTBWWUxRV2pKbHVscWx0a3UxUmJ6SkZuVHlqTGhJUTB3V3pGd1hTM05mdlBq?=
 =?utf-8?B?aUxCeXlFM1FaM1pLc056Z0lhNFQ1VnBucHdKc3FPOHpNUXlraFdmRkdSREgz?=
 =?utf-8?B?eGt5Y1JQRWQwcS9EcCtyRmNJUTlKakU5MTJEM1VvZmQ2VUd0eEJkL2M3UHhp?=
 =?utf-8?B?a1BPZnpDVU9PUjNIMUlYNndVVjBVMDFXc01KeFMxcVg3RFJkSlB4NnVUUDQ0?=
 =?utf-8?B?Zi9vbVlFWE1CTzhYKzYycWdoUGIxb3I4cUtCMWZMSGpVc0RkdkNHcjJwNzdu?=
 =?utf-8?B?QkM2KzBrY2tNYkpldGo0L3BBYnlheGRXdXAxUG9RVHcvbmNLdVpWRjdCKzZk?=
 =?utf-8?B?c3NTMFc2M1RiUlZvcnhZMGlKOTB2bmpuZUtoRlRuUStyYURhZnZtcFRqZDF0?=
 =?utf-8?B?L2tKUy9jaFd6Y2YzZ2tOZ013Tmg4ZlNSZ1BoMlFudkZPd045cnlCd2oySGJz?=
 =?utf-8?B?ZVAyeDlqc0hoalMwajh1VVdQSVE5dWdESlFBb2Y4OWFsRkdKWnNwcXo4aGNR?=
 =?utf-8?B?WFBjSWFaUVYzNVhpTmd4d0FPRHlIcExXNmtuZ2M0a0JnQ3pramVrcWhQQjcx?=
 =?utf-8?B?L3J1ZFp5b1UzTmZWVDBhKzFLdG1sZkFtQTE3Smg0dDRxemRaaG9NWnJCOHVm?=
 =?utf-8?B?SHdydlJHeHMvN25MVTlmdzRvTVd6anB5ZFhpVGlmaXFJV204L3BQeW44Z2h1?=
 =?utf-8?B?NjJ1MHBGNWpMOUYrOFFPTmJCTUZXQkNJc041TWpNOVdGTEluL0doQ1FyNG1v?=
 =?utf-8?B?cFdVZ0ZXVGp0T09hcVRDYmdNdEk4bWQ0aVRxUzFaeWprOCtyTVFWVEd6WHRu?=
 =?utf-8?B?VENxT3dXN3hVY1JiclVHaEQxT1FVNzIvcWdrQTJOY3BFeWNLeVpVcFM5bFlV?=
 =?utf-8?B?QVhjOWxLS25wbjdwM1RBdWNyMWc3elhjeEJGbnFwVnhLY25wNFlIOTYrVEYw?=
 =?utf-8?B?RzBVVW1ldEE0VEdyaGFSRWRZSzJ3bVQwNmovczFxQW1ickRvVlFQejE5SFFS?=
 =?utf-8?B?Uis3TitKZHl4UkJTT2UzWVV2QWpQWERBQThkL0pJekhEZGhvUkg1Zm16RjBW?=
 =?utf-8?Q?ABFRYb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 09:47:01.2122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acd4bbe-5212-40f3-126f-08ddbecd8dc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9082

On Tue Jul 8, 2025 at 8:32 PM CEST, Stefano Stabellini wrote:
> Today, checking for non-fatal MCE errors on AMD is very invasive: it
> involves a periodic timer interrupting the physical CPU execution at
> regular intervals. Moreover, when the timer fires, the handler sends an
> IPI to all physical CPUs.
>
> Both these actions are disruptive in terms of latency and deterministic
> execution times for real-time workloads. They might miss a deadline due
> to one of these IPIs. Make it possible to disable non-fatal MCE errors
> checking with a new Kconfig option (MCE_NONFATAL).
>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

LGTM.

    Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

Cheers,
Alejandro

