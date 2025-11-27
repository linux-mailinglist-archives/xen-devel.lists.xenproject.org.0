Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF3BC8E484
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 13:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173790.1498794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObFo-0005G0-N1; Thu, 27 Nov 2025 12:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173790.1498794; Thu, 27 Nov 2025 12:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vObFo-0005E7-Je; Thu, 27 Nov 2025 12:37:44 +0000
Received: by outflank-mailman (input) for mailman id 1173790;
 Thu, 27 Nov 2025 12:37:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuYy=6D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vObFn-0005Dx-5r
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 12:37:43 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dd604d71-cb8d-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 13:37:41 +0100 (CET)
Received: from DS7PR03CA0348.namprd03.prod.outlook.com (2603:10b6:8:55::8) by
 SA1PR12MB7173.namprd12.prod.outlook.com (2603:10b6:806:2b4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Thu, 27 Nov 2025 12:37:34 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:8:55:cafe::35) by DS7PR03CA0348.outlook.office365.com
 (2603:10b6:8:55::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Thu,
 27 Nov 2025 12:37:34 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 12:37:33 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 27 Nov
 2025 06:37:32 -0600
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
X-Inumbo-ID: dd604d71-cb8d-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEtORtXcBq7XV/tlhFsDNTiPss7emu65AizFi53j3mlX9H6RkjVDvzv1AguneEbMRuwqZ7Iw/NLg1ozPq+75Cu4atWPjl2B832axp7ROaJCicEZp3K0GMZx/crrEbilRMTSvgUpXEYqs6dpfyr2VhiXGMFDpxncHs7KqFbMvCkKHpEC4ytTNfrvPl/q6klcVxihjCEiWBhCk5DrkoO6KFtHACjFKQJ15B2drlBvmxJVHnqDwT/4NRBxFQpxYy+eYtUDtDgseHNTn0sSpRLW6n+8GNb5nJYwGnIJLNcACZuLeMuLiEQPKEk+s0vLOpuIL+7goBcP2zBOvn1GfiUgRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VedOeTe5GILVTMPxkq2PryMSPPz6nGhvBcH1jCXBCk=;
 b=TsEwVpdnjCXo53iifPyoO0En+QZ8CpphriPIqsMmagm2gdgqfLzc5noon9C67K3RGkSW3IDRHnlwiqUtXz654JA0RLzeazO9xdB1eoSA0f24vihmfAp/5fCQBHhO5b00tUAtBq2ewQX/JNGtZC2Vow06jWOAf4NHLzRb9LPVF2PXRtd0E5IVSmr5clUzsJU6lUCPaDm1Yi7GzdJ45VcuNaNo11HO2VMoQqN3y/K3n2I4dMojeOg7S4JVOObMZGtl3GtbVCRf42NfjoR+Ber6Tkwtpy1clF8vBDNdjID1LR1dgPAJdX6WvPqs9KLiGMReluFZz/8zfsMgVZ38xkwbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VedOeTe5GILVTMPxkq2PryMSPPz6nGhvBcH1jCXBCk=;
 b=eJ0TqWZqkrrF5wMEUWwOvOu51BASMYvfi6wPc3FYuY3BV34dsVJhmabTxuGyTQXPYWG7XnCqVhAizqodlt/wGjp6gzJWORUb4L9rsiCvNVSk9GbsR64AsKNOD0/EXyCeHTIBtjEcc+1QBf9HQG/9Jx3pMeplhM5O+bdBwMkd6xc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 27 Nov 2025 13:37:30 +0100
Message-ID: <DEJHDU8GFRN2.DQ8R4SWFRI1V@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 01/11] x86: Add more granularity to the vendors in
 Kconfig
X-Mailer: aerc 0.20.1
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
 <178630e8-7986-4a35-863c-4559779d7390@suse.com>
In-Reply-To: <178630e8-7986-4a35-863c-4559779d7390@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|SA1PR12MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: ea8811d8-c825-42d4-b0be-08de2db1bd2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RjNPZ3MwbExFVS9FbnpFZzl2dUhha2FWTHAzRVQ0MzhJcThMdzBYRkNoK2lO?=
 =?utf-8?B?YmVkdmRCWlduemJXN2dmVE9mZmVZOTBGeHdSWW1iYVZpc0dXejdNc2hSdnVu?=
 =?utf-8?B?eGFhT3NjSEhnNlZLNkhRM0Y5Q1BXWVBkTVNBeFFMNHFtRWlaaXQyZjlNbUNO?=
 =?utf-8?B?eVFBUC9MaHE0eEl3aWtsbzVxcDl6Q0FkWWJmZkQxNk9iV3UydFZnYzJDRDVw?=
 =?utf-8?B?OTIvanNxUEt1eGdTSmZRRk1uV2FnbUhHaU1LbHVkdFB5d3RXQS80K1dFeE9a?=
 =?utf-8?B?ajNkSHpHRnZCOEg4dThVUjM1ZHFsa1ZUZng4QjdJUVdqYTFqdDJ0c29qMW1W?=
 =?utf-8?B?cXZHZmxBdjdtRUtjbWMwN2dGWnd1ZVF5UXhoZFl3Mm92Q3RNK1phTjR2bFdG?=
 =?utf-8?B?dWlwdFlaY1lXUFZraVdJWjgxMHlUbjR6ZUFNVllOVk9GUWNOczZpS081MWh2?=
 =?utf-8?B?d1JNcXpiQmlkUVJ1OEYzWTBsMVViSXBsOGgxNWxhbHBiZlV0bktmOE5NM3Ra?=
 =?utf-8?B?dXhPR3Urd1lRd0cxdWVzayt0V1ExY2JrdW9BaVg3dlhISUFabGtGSHQ3Mnkx?=
 =?utf-8?B?UXdia042ZHJyOW5pOXpHNjNWKzBhQVVDWDRHbkIrNnUwUEMxY2RHZlU2cEgy?=
 =?utf-8?B?RjZ3aHhZOVUrSThrb09ZK1QvSm5uSFFNNXZjdEw1Y0R3eTdOdFRocXdEYWpv?=
 =?utf-8?B?WjUzUTN0enFObXNwTU1xOXRieTRuWjdQWTR5Z0d2U1Jiemt6alB5SThVK0Ru?=
 =?utf-8?B?VFFtUDdtWVhIQ3A0eWlLNk5NN1BOM0wvQkw4UzF6UG1LNWoxVDJGbkIxQ2Yz?=
 =?utf-8?B?Z21IWml4bjloT1owdHdqZkZ5bVRTM3pHYnZSeEhFL0tXRzRDaTFzT1pzL3Bq?=
 =?utf-8?B?ZHlmYXNmSlRxTTllYkdBUEVRQ1cvYys5b2RLeHk1S29WRkd4U1A0NXAxb1pD?=
 =?utf-8?B?ZjB3aG9WL1VyTGViRXdRM1dNaDc3ZnhwYU0zdHVWMG9TeUtya3Z1akN1cE10?=
 =?utf-8?B?NWNpbmsvaExuTzNtWW5zSGZNUDh3NFk2NHN4RG12MUhVV1U0a1dJQmF5cnJk?=
 =?utf-8?B?MThMVytNTUw1N25icnl1RVdxVFRFRElNSE9QdmNyZkJGWGswSW5qSWJmQzN3?=
 =?utf-8?B?YmxCWDduS2xoOU5iRUlpNWtRY2lzU0l1ME5HNGNEaXUxMWNNNXhjU3daZE5O?=
 =?utf-8?B?WW1qeTlmODVOQVJidi9YQzBhek04aTVkWUZvNHlTVkhDZlQycTIyQUpxL2dh?=
 =?utf-8?B?dlg4ZFZWUTVlcnc2aG1UczNnSW93dHFrejBPZWY0cUJhU0o3RG42ZkFyVzRS?=
 =?utf-8?B?V3FKSWRiMGs5Qjd6YTZnNURmSGprNGYzZy83bWk4MXVsaDN0b29UanVTS3gz?=
 =?utf-8?B?NXAzU252S3lPVFBsL1JzemthRFY5bzJlcHltbm1JSXlMaXdxVUtqRE9hTE56?=
 =?utf-8?B?M2JWZ0k1UkErcFllOXBodENDbFFacitYNG9Rd3NaV3JyVytvWC81Ym9uTytG?=
 =?utf-8?B?WVJlOVl2Y0FuSnZYOU9XR09VUndXVUg2ZHdKMmNBbGNhMEl0RmFrdWRCK00v?=
 =?utf-8?B?OU41RHNVbm5pRmlsbWduWXlVNldieTF0YkQ3YWNFUDVwTUc5WnUwOVhTNVRK?=
 =?utf-8?B?MjhsaUxvNWlhMDFmWmlNNjNRN1dPYmZLTlQ0MWNPUEZtK2swMUpTT3NQMWFS?=
 =?utf-8?B?aWZzTTdFemhOTmd1clBkczNQVEhKbW1TVmx0cmJISXNPOXlpbEx6WjAvUmln?=
 =?utf-8?B?MG9IVTY0eW9DVC9Tc2hxNTY5UTZwSUtsaEZVLzFFTGVRTXgvak1FU2VVSHY3?=
 =?utf-8?B?ODg2MzlaZ2kvRHUraDMrUzY4aHZFK0plUVUwL25oWld0VC9Tb3JuVXFId0Vz?=
 =?utf-8?B?NzJ4VWJ0T25SZlRPblNmQXNUS3p5NU9Fc2pKNXlUeHZtcXE4QVRHTDI2SU8r?=
 =?utf-8?B?VUVEc1FWbE9UVzZHdXFyamEvSVJzazFRMEVhY3NkbldnNHBSczJBVmVOS3Ft?=
 =?utf-8?B?ZVlsTmgzNHdJSnZ0czc3RzREWGNDK0QwdGNjdFJlNlZmU3owQkdjUmZPNHMz?=
 =?utf-8?B?RlNvclhUNzJyTGF5ZTU0enpGNi9hS2RqRmZSeENRRUp4QVFNcEh3MUlYVTJR?=
 =?utf-8?Q?PvC8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 12:37:33.8742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8811d8-c825-42d4-b0be-08de2db1bd2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7173

On Thu Nov 27, 2025 at 10:59 AM CET, Jan Beulich wrote:
> On 26.11.2025 17:44, Alejandro Vallejo wrote:
>> This enables very aggressive DCE passes on single-vendor builds in later
>> patches, as it will allow most vendor checks to become statically chosen
>> branches. A lot of statics go away and a lot more inlining is allowed.
>>=20
>> In order to allow x86_vendor_is() to fold into constants, expand Kconfig
>> to have the full set of vendors. Adds Hygon, Centaur, Shanghai and the
>> default path.
>
> Oh, one more thing: There's x86_vendor_is() yet, so what it is going to b=
e
> needs at least roughly explaining here.
>
> Jan

Fair enough.

Cheers,
Alejandro

