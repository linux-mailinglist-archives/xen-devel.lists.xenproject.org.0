Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797FDBD26DA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 12:02:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1141895.1476067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FNN-0002XT-Pw; Mon, 13 Oct 2025 10:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1141895.1476067; Mon, 13 Oct 2025 10:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8FNN-0002Ue-ND; Mon, 13 Oct 2025 10:01:57 +0000
Received: by outflank-mailman (input) for mailman id 1141895;
 Mon, 13 Oct 2025 10:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bZn2=4W=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v8FNL-0002UY-Sw
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 10:01:56 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4dea113-a81b-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 12:01:54 +0200 (CEST)
Received: from DM6PR05CA0065.namprd05.prod.outlook.com (2603:10b6:5:335::34)
 by DM6PR12MB4418.namprd12.prod.outlook.com (2603:10b6:5:28e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 10:01:51 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:335:cafe::d8) by DM6PR05CA0065.outlook.office365.com
 (2603:10b6:5:335::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 10:01:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Mon, 13 Oct 2025 10:01:50 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 13 Oct
 2025 03:01:49 -0700
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
X-Inumbo-ID: a4dea113-a81b-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T66c9W1oYpx9Dm2tQuKz7Qn9ZALzlaV72kXm+4rJHylIiOz9YJm3kJJj4VcvMxeDMc2LhhIUYx/2y+gmmNVirjPkNR6llr5/coasj0vIbUDz6U/2Q8e+LzJ+IMfpJSUTCzaA7LV0D0LN/JOAXadJyDkO3aHCY2WOl1uQOOrambLvaCpAixsUwBZt3o3YLo8FkVfSMxum56vo+kcw7Jvqg2gaRiD5bLcBGaX8JBO41MLKxI7q2SuG5PRJ88J4LqKcqZDVvbEk1NHAUQ2lh2QmryvTOCaswuA7qcwmKmo+CzU0dj7JsnLPbEENeWo2bxgxgkCic3QyBVxW5JTe6iTgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3jhUyJfOwN6ND0RRBlnNi1obIl5O3kgGaJYDVzjWWY=;
 b=S1PQARZ0oC9N2hVSaY6i6bi9pwaJcgNRgdDKBeGWCTaGPAtUSc5DQU4/nZQ9GNj2QqH/IaCDU4QTxY+mDd54L/+ySTAA29U2Jp7Me1pQ1M97UTYOFaIbApHFCMGLRMT7OaVOGP7BygvHsU2dt9al8FA2s4b9534j1OCBDdtFFotS5plPFev/o4XNUAaY9Wqhilh5wumD4Qd9pZCcgwQu4eBH1iSLADES7lfQyJaGykcY5YxWPoL+4B/noKTLFK4DGXZFw/TeHLKtflM0RWm5bA1exPJ49hEC407ZKpLHtvyMYAl4BYred0PvLzG2FWmTlm5O+25Vxk09D0p9SGhsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3jhUyJfOwN6ND0RRBlnNi1obIl5O3kgGaJYDVzjWWY=;
 b=nPrEqvgqwii1FX7Fm6LwfGuxfgY3VTFIVcOA+prxh0AbR/PZrTS2e4bRko5vGkGm9qZJpt3Tniw8WBBiNOyxeVFsBQ4zPiNqVdNXw2e8NWT9Q320W4SCIzh2qdpRgnIjmdnjNiJV/8GITo+NUZNWJ8Sv4hix/CIB61pIMuzyfCg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 13 Oct 2025 12:01:48 +0200
Message-ID: <DDH3W3VM2ZDJ.PMFSGBWBTS0S@amd.com>
CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5] x86: make Viridian support optional
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
X-Mailer: aerc 0.20.1
References: <20250930125215.1087214-1-grygorii_strashko@epam.com>
 <3e4e4bc5-aa47-4357-9327-df2a9b9c9a1b@suse.com>
In-Reply-To: <3e4e4bc5-aa47-4357-9327-df2a9b9c9a1b@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|DM6PR12MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: 246091f4-df1e-4af9-13e3-08de0a3f87cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0tSd1pXVDNJRXg4cWxKWHpRKy94OE44OURCNGRhcVpCZndIS292WFE5UjBa?=
 =?utf-8?B?K3ZHVFZTa1MrdHh3NWx4MHNtWnowbGFldVJLL1VySWcyQTZud0dKb2hRcFVu?=
 =?utf-8?B?KzE0TlZHcVZFVVZSNWVVdmdhbDVvMGpaTE1tZ2h5cCtQR3dNOVB4WXBkVGFD?=
 =?utf-8?B?RzdGcUxmbFVicVI5QTRSUmFsNVh5OTIzQWVRL0cyRFBFWUd5eTNJekt0N0Za?=
 =?utf-8?B?dmpPMERTbXc2MTVyN200Ui83Q2dXNk12RGZqaWdqZTBZWSs4T0ozYTE0VU01?=
 =?utf-8?B?TWhMcXc0all4M2R0Sy8xSTY0QkJTY0xyUDVWM3Q5SENDRnNpeDEzMkliQTZR?=
 =?utf-8?B?b2kzOEc0ak5lbk1rSW5ZUGxUUG4rbW1vbWdHSGd4ZTZiNnV3elZ3aktIcHNL?=
 =?utf-8?B?NUdnb1NCVlpFOVdRbUxPM3REWGhRVGRNamk5MjExV0hyOFd6N00xVzBPMWZh?=
 =?utf-8?B?ZDMwem51dEQrMG5Fdm82QTh1Vit6cENzUVhoZ1pHSHZqb0tjNUZJRGdmejBn?=
 =?utf-8?B?RFQ0M3BtUzdzOWlzbkxxaFpZVTUraXdKNjBCbHR2SXRQVUdRazF6WjdVUWtS?=
 =?utf-8?B?b2JBTG9YdUNqQ1kyb3hCU2d6UC9IZGluZnhkenMyWDRJZExmNEp2R0JENFp4?=
 =?utf-8?B?UElGSEQzUlhhNWtKV3AxQ0kwMmJlWEJCTjhSWEMybmp3a3c3YVc5ZDVzN3B0?=
 =?utf-8?B?ZW0ydHlRbTRwbnlIUElsa3MwSU1uK0JPN3pCMWh5TTFZQitwdU93UE9RbUFh?=
 =?utf-8?B?M1hEdFNRRlBPZHhPd0I1TWN3OUhNOW0xVVpUQzFQNmFuRDBQSWFoNzA1d1Qr?=
 =?utf-8?B?cmFMc1BjQUtZbDhZYWRZdnp2TWo5MVNjVjFsSHN1eFBBNk5YRXlXSXJqcFBo?=
 =?utf-8?B?SkEySW40S2pzVUVXKzJaS0RMYkI2c1pHcEN0MjlTWjUvRHdvMGlBYmFweXlS?=
 =?utf-8?B?SkJ4S0pzQW5XSkJ3ODk2UkhBeW8yMGZRM3pDZFBINWk3WkVHdkFQdld3QzRu?=
 =?utf-8?B?anRXWit5OEVhcXVDcGt4UWQvajJYVkVzWm1TUUN2MFdockJHRFBKWm9JVHNW?=
 =?utf-8?B?Yng4azhGUms2dXdaaG5pd3Y5YnUwNm1ZSTEvaGJqbzNiQVJTdzBFbEE3NzVT?=
 =?utf-8?B?NUVoa09qNnRDK0dwVDcvZUxsUlFWV045SlVacFVoUVNlOXFUeGRCK3ZKQmVV?=
 =?utf-8?B?TmhVU0w1NVViQUZ3ckxrZGp2UmEyaHZ5ZktpZURiaGdoSTQ3UDlieko1RVFq?=
 =?utf-8?B?ZkJtcTlyVFBibVVnWGllcjBFMnZDcHovY05qZ0xJZjBxZ0MyV1duWVBpbGhC?=
 =?utf-8?B?RElCZUZzL2htYkR1K0t4c1pEMHdIY0drb1M1a0d6dHdQamFnbnF6L0tOOEc1?=
 =?utf-8?B?ejN3TXZjdjRLRTRvcC9kdE1lMzJXUlRiNHJlVmZFYjY1bHQvckN4R3cxY1R3?=
 =?utf-8?B?KzBTYm5vRW5HTHRXWUFmY1ovNHBlYk9IaXZJcWxwK2pIWXJWc21WaFlnMmxw?=
 =?utf-8?B?U0gwRjQyTTVEMC9KelBReHpuM0pURVh4UEllVjNIa1FTWmQ1QXZPcFhiclRv?=
 =?utf-8?B?aHFvTHJickRWWXppOE1nS29CZllUdmFXSkgrQXYzNGNtQ2tHbzVNWmp5NnNE?=
 =?utf-8?B?TW0zY1hkSVFhMityMWtwakkvZWVEUFJJL3FELyttaDdzandKaVpNY1Vzd2pK?=
 =?utf-8?B?RzlUWmJ0TW1oSXQ1MW9QanB6ekdkSzZEYUcyWHZwVEs1WXNLZnozdXRTNHA3?=
 =?utf-8?B?YkZVZi9HcWRaa3VjMTBTNmZRSWNLZXpIc05DTW4wV1poTmtnOW5jcTJ4Mmtm?=
 =?utf-8?B?UXFiM011TTJJeUtqeDk5TEsrWHcxbHpUZlNSUG9uRkJyZW9rYzdrQnVMN3Jy?=
 =?utf-8?B?U052VHNaVmI2eWxQZzlydy9Mbm42SGVzbDdPS1g0WlRKa0ZHSnc4NGF1Mklo?=
 =?utf-8?B?MmZoeldKVVdESHZkenA1WUFYdVR0SFBoNlgzaVFPK2ZRTGJORTVjUUNqanNv?=
 =?utf-8?B?WjZ5YzNRRm1GMzVBYllURXltTW9Kek42Vll6ak41b3FCcmxEUGtFZml3SUxN?=
 =?utf-8?B?ZjIzQXpvU1EzT2M5dmhMeCs2dHhhWUN4bU9SZFVqNGhWYkxTSUo0QWZnamRm?=
 =?utf-8?Q?9GqA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 10:01:50.9990
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 246091f4-df1e-4af9-13e3-08de0a3f87cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4418

On Wed Oct 8, 2025 at 6:04 PM CEST, Jan Beulich wrote:
> On 30.09.2025 14:52, Grygorii Strashko wrote:
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -62,6 +62,16 @@ config ALTP2M
>> =20
>>  	  If unsure, stay with defaults.
>> =20
>> +config VIRIDIAN
>> +	bool "Hyper-V enlightenments for guests" if EXPERT
>> +	default y
>> +	help
>> +	  Support optimizations for Hyper-V guests such as faster hypercalls,
>> +	  efficient timer and interrupt handling, and enhanced paravirtualized
>> +	  I/O. This is to improve performance and compatibility of Windows VMs=
.
>
> What is "paravirtualized I/O" about in this context?

Hypervisor-assisted IPIs, TLB flushes, etc. Or so I understood back when I =
said
that looked ok. I see there could be confusion with Xen PV device protocols=
,
but as far as the user of the help message is concerned it makes no differe=
nce.

One could even remove the examples and leave it as "... for Hyper-V guests.=
 This
is to...". They are truly inconsequential.

All that matters is that (modern) Windows won't run without it, and that it
provides some indeterminate hypervisor-provided assists to try to reduce so=
me
virtualization overheads.

Cheers,
Alejandro

