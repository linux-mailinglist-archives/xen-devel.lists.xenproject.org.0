Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9D5B0D9EA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052599.1421333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCJj-0006RK-Qn; Tue, 22 Jul 2025 12:41:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052599.1421333; Tue, 22 Jul 2025 12:41:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueCJj-0006Pm-NP; Tue, 22 Jul 2025 12:41:59 +0000
Received: by outflank-mailman (input) for mailman id 1052599;
 Tue, 22 Jul 2025 12:41:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueCJh-0006Pg-Pq
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:41:57 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2415::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fbcd96c-66f9-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 14:41:56 +0200 (CEST)
Received: from BYAPR21CA0004.namprd21.prod.outlook.com (2603:10b6:a03:114::14)
 by DS7PR12MB5790.namprd12.prod.outlook.com (2603:10b6:8:75::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Tue, 22 Jul
 2025 12:41:50 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::76) by BYAPR21CA0004.outlook.office365.com
 (2603:10b6:a03:114::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.4 via Frontend Transport; Tue,
 22 Jul 2025 12:41:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:41:47 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:41:45 -0500
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
X-Inumbo-ID: 3fbcd96c-66f9-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMljxlQ1roKCuQOrmcjMtz7ftXbRUh18Rs7oYS/HRnO0phaVaErifOS/c47e9CXVJuGho/pON6gBoIUJR4P83GSurPVnDawzqTBqjhJ3uXy7S7UOVEP1UJgktZnwiRo8lBk/goP22kiaE2vV90lsvYFX3F4zZlKgreUAXPiHxBp2rQhukYFFFuq8jUd03wE8x26lJC8tnlDpeyzRhfmEf6XxHMHlk5kZu/I0VUBzQujafcaN+mYRCKa+zjhytdwHOmTMwoJEiukmu/U3JB78u/0IFChUjJzdI2ujWESeFPbU858GT5Qh35NbIpzZjg9++/Gb9Xl/11Frxq0ajB2NDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0tF5B9pkxKd/SgClD2znYOMAnQvtUBzHNwKlsy+Py5E=;
 b=yt6A9I2/PVDvCU66jXitRm3cWD4dJ3/WKnjgyRFxSBsgGsiw2vtJYSz1w5SxfxboIPmK3ssPIxvQwatfDdZBG9ke+PIdxtedIFg3K1q6TCQraHT9XdDieVNzMQz1m8+07LLHmuAdFqoT/4BmIXqmupQZwCC0qgbkWNS8XV0kCFUgS1uCEJQF4mFn1ViddI7g/l7HSxAgG9unI4wmV0aATM3K1NiwPoJutZ625r8WHTnmcI2H50otmVsbdtfgCLSi8cBCoEUVMGh4LeH4KDg2ZQd+OnsQ7MykHLiNpaa3Q/DFM5Iq/4cKjQzFK7JRcFhyIk5rlEdGVZr+obQLzQNFVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0tF5B9pkxKd/SgClD2znYOMAnQvtUBzHNwKlsy+Py5E=;
 b=waoitqiRsRB5cz8KYA9d0q8slcbr/eCBlPW2sxqbNSyuUfVEKrAGUGTi+a6jy9xgEKRkEB+fu0uf/nTV3Ocl1jbUatXl/IXlNc64qgx83NGUrP8Ac6zasB8+clRL7sBMVxd44DZ0A6GZP5FfWs4l32zNeVwveMA2yo4kD7hXRmM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Jul 2025 14:41:43 +0200
Message-ID: <DBILBC1UJ0QZ.2KU2PDGDO14H9@amd.com>
CC: Alejandro Vallejo <agarciav@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Jason Andryuk <jason.andryuk@amd.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 01/10] static-evtchn: Add missing include
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
 <20250722115955.57167-2-alejandro.garciavallejo@amd.com>
 <c72a8ff3-e3e3-437d-b169-031571a18dcc@suse.com>
In-Reply-To: <c72a8ff3-e3e3-437d-b169-031571a18dcc@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|DS7PR12MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ecb7a9-0184-4757-5a84-08ddc91d1f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekVhMytDVDV6SThPc3l2aWppaFo3dUo5VU5RZ2R3Z2RtcndSRGhIbXppMjI1?=
 =?utf-8?B?RnVkd0p0cmJ5OVAvVFRKSXZXcWlWdHArUW4zRFEyeWFndkh3bVhxMGRMclBs?=
 =?utf-8?B?YTZCcDczd3NpRUtTa0pZQm52NmgyMXVLeGZHVzVaRVcrR0tiVG9TNVBnYnB2?=
 =?utf-8?B?Y3lJRmtJQlVFWGhNYWhiWTlvejI5Uy8wREhNMUpzMklTcmlFU2FrNzQ2Qi85?=
 =?utf-8?B?N3pvUmZ4K0VtcXV1SkM5Q3BoTXVMYXY5VHpRU2MrSlNlZ2pNRDM2bVh4eTh4?=
 =?utf-8?B?bmNHQXJtU3Z0Z0wyaUtUdG1qTWJMNEg2TkwzR1FBaXRzVU1Ia0xrR1FsZTFZ?=
 =?utf-8?B?OVlRNTRxbk11NXArUS9Wd01HMlIycVZFOW95dXQxdFdrZHplVlhCL3J6MGpW?=
 =?utf-8?B?NTBWNFZYRFNENEJYM01ubVBXNEJKa3FVb3pYV0J5Z3dqVisxTkVjM0c3MlVa?=
 =?utf-8?B?TjVSMDhhbnlDTEVGcXFiZVV3RVloUWdGak5nOUE3ZGowNEtFVlN3ajZCelFh?=
 =?utf-8?B?YW13NWVHRnVpZ2duOTN3S0dUTEFueHo2ZkxmMm96YU10UEVLeFFibndJcnpG?=
 =?utf-8?B?dXlnUnNiTWFacTlFalM4MytvakZJaERkb1p0aDFTcnZLM04wbmw4QTI1ZzlM?=
 =?utf-8?B?L1dDMmZnT25VeEF2bWJmRlB5ZzZWWGlHZHNJZEF0dU9RbzlFaVRGMWhjN3RL?=
 =?utf-8?B?d2hVdTArSWRXaDJzcElvZktPem0rNytXVW0xdStXQkJHL2dwT0RlRUFaU3cz?=
 =?utf-8?B?Z0pGL1EzS3REbzhTVTBkSjU5RXJBajhpanMyODFUS1RoS0JabVZYcXlwMjUy?=
 =?utf-8?B?amt4djJ0eHpDSUdOdVRaQTdMU1hyVmlsTkxLVjRxdUNEQkx0N0F1bW1BYWhU?=
 =?utf-8?B?NjFGazhCZCtGRk51Tndzdm5qUVVIS3RZNFdLdG4yK1diR0V6clNXUlYybEVJ?=
 =?utf-8?B?cHJXSHFLMjRsMDVEZTNTVFpHNkIyeEkzWWlPUmRLYVorRjBhUWpJOWJDbHZi?=
 =?utf-8?B?dm0rdS9iMWR6SVR2UFdXOVdLSmdDWjYwbFUwNFVWOGVhNGxObWZZVnpCZmVV?=
 =?utf-8?B?cWp5U3FUQWVURkJKZE5PekN6eHRMWmZJUXJTUFpUaEp2Y29iQmE5Z25lT0Rh?=
 =?utf-8?B?UENDUEU3NFZwcTNhZnU1b1h0S0dGUnRyeEd0QXdEVHJRTU1tMitVMDlrYjdi?=
 =?utf-8?B?ditycklsSjRESEdnUUdhQmhicWh5akI0VFhXcW95TWpvRVZyNW93MW9aODE5?=
 =?utf-8?B?cUpOaERnWVNQdTIyTDlmTE9mMG9hUnBBbHNvb29PTXZIRmw1RUpJcTVDQmxa?=
 =?utf-8?B?amdCNVVkOXI2T0tmb2lOS3d1WkFpRGswM3BNU0ZCelJ1RXVhZk4yNll4V2dy?=
 =?utf-8?B?QXIya2M0ZkhNRkN2dGxwU0o4a1VZSGhCWU5SeHBMcDdaNFhGeFRNT3N6bnJ0?=
 =?utf-8?B?SFhSNWt6STUvelVsaE1BZ3FZa0I0NVFXbWRlYWlYRXNhT3BkZ0ZHOFhCSUdq?=
 =?utf-8?B?dmZHSU9YaGRQRFF4UDZlK1NZaU9DdGExeGtlQlpFcUZtaGtnQUNsc3VRbjNy?=
 =?utf-8?B?NXhXOTdhZHRTZ0IwM0JOcVBsaEpiNnJVeHhCcnV0WURwUjRwa3dSTWw1cTZ0?=
 =?utf-8?B?V2JmcXRxLzBLeUIwTG5QS1U2Zk5xUGg1WE5PVSsvNXo5c1NveWZOSDBPUXFZ?=
 =?utf-8?B?TktZeVJJRkJpajQzRzlGVjI3NkNxelJxTnVPbWZSZWpiaXpPYTlsN091cktT?=
 =?utf-8?B?ajhKdTQraWw5b2RUdFdJbmkvUjd6ZHhTV2FKRzJUL3o3OTBRV2hFNmYxaU9a?=
 =?utf-8?B?RVZTTGhOV3duNEV6dGFSSnAyQjlKRVZZeUJJQlRPb2Z2NGxvYUkxVVNqRHp3?=
 =?utf-8?B?bUJNR24vM1F6dVBwclZHYmI4NnpOcVRhWTBHUXJmelJGWHcxMm9vYUFjR0Fj?=
 =?utf-8?B?eGZlTXJ0SEF6OHV5ZjVhT0QzY0RZUFFFeUlSYmRJT3dPNG1ZNm1nMWxMaWlu?=
 =?utf-8?B?Smt6dzhhVEpmNGFEU1ZQWGVUTFNvdVlTbGRoa3NNaU1HbEhaeDhESlF3b3Jx?=
 =?utf-8?Q?XzM0tu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:41:47.4488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ecb7a9-0184-4757-5a84-08ddc91d1f7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5790

On Tue Jul 22, 2025 at 2:10 PM CEST, Jan Beulich wrote:
> On 22.07.2025 13:59, Alejandro Vallejo wrote:
>> From: Alejandro Vallejo <agarciav@amd.com>
>>=20
>> When later on x86 starts using this file in later patches it won't find
>> device_tree.h because it's only transitively included by arm.
>>=20
>> Make it explicit.
>>=20
>> Not a functional change.
>>=20
>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>> Acked-by: Stefano Stabellini <stefano.stabellini@amd.com>
>> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
>
> I'm certainly happy to trust you, but on a v1 submission I'm a little
> surprised to find two tags present already.
>
> Jan

They came out of internal review, and I didn't really want to drop them.

Everyone with tags is in CC, as auto-cc "helpfully" does in the absence of
further arguments (for better or worse), so they can pitch in.

If this is a problem, I'll make a note to drop internal tags before public
submissions in the future, and feel very free to ignore these. I do underst=
and
it's important to keep proper paper trail, which, by doing this, is lost.

Cheers,
Alejandro

