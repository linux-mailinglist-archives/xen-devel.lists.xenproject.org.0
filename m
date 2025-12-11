Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3EACB585F
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 11:31:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183840.1506431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTdxb-0002se-Ub; Thu, 11 Dec 2025 10:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183840.1506431; Thu, 11 Dec 2025 10:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTdxb-0002ps-R8; Thu, 11 Dec 2025 10:31:47 +0000
Received: by outflank-mailman (input) for mailman id 1183840;
 Thu, 11 Dec 2025 10:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdCA=6R=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vTdxZ-0002ow-VY
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 10:31:46 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9645615d-d67c-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 11:31:44 +0100 (CET)
Received: from DS7PR03CA0209.namprd03.prod.outlook.com (2603:10b6:5:3b6::34)
 by DM4PR12MB7550.namprd12.prod.outlook.com (2603:10b6:8:10e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 10:31:37 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::34) by DS7PR03CA0209.outlook.office365.com
 (2603:10b6:5:3b6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Thu,
 11 Dec 2025 10:31:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Thu, 11 Dec 2025 10:31:37 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 11 Dec
 2025 04:31:36 -0600
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
X-Inumbo-ID: 9645615d-d67c-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KjVZvTLrdzmpR/9/RL/+fTRgosDYsIDbd4ievO+Z8r5wEZXikpkcZwZWxEa7HzEe9uPURz3xa6BQCwj4Q8x10YdbwJf8TaVPGiayP7cz/lMA83klWdWgIkjcf4BY/KRiDCy+WXDIQ0BRqBc4DeKSrlxXt+aVtuNKp06i/8suX3N+nIQg7A8//eXrcUNHozeGtfdWeSH0YapeWgls/ZHTpJoofnSQOCDRvXhEExGmrR2KwZF0TejQmOlUzbUuNa/GKxALbnpJ8CisQNcDU6/BB3uMviUb0GLb9QmfTIEKrTvd3TcMG1QsGNBfdA6n9tAZMVvYvt+5QifNLrUHtycPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrATn+ccNbKkWs0oIjMBYpxk6/j0tgAD1k9Q4EulALw=;
 b=kaLAy2B6skHqp37rGFBypPUAttpdgi92H4EJVEik6qQUCBAWv8FHGkYow1oAbeXl+e//52i0It/4HKfp4OZaBlELOP1wlXKo4dJIJnRAsnQ20MloWvRlTQUdAONsk6B966kJHMQiYSWlV5CZ4C2wkEwZIdgq0/l4z5RnYlZZ2BrCNJ44RNOTCFatGdVemtPvX5276HMTz4STvD9EtmsPjhQHJ5A5gsRgxGLssEMkTCzRZrw2/UVC4RLoprI1MOOCAwTZ9cuZd4FV5pOg3AneygJeCLmMtYj5cDzscYpUGkqBKeGmDz5H7bXUb00SBiwrWUTdNlFuXcjeXl507v792A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrATn+ccNbKkWs0oIjMBYpxk6/j0tgAD1k9Q4EulALw=;
 b=CLayFUMwFtcNP1GLfuYKWtXqckeEjtF+wBcnQu0p7ySWq175iUxZebdrECPx8KZEqz7tV+bQFGgstpvmwgL4ZzWaY4iuBXsiKoOJLxzX+6guukYIqXDHIYtusImWT8ZQXOEKvxHzNA72jXgJXwVdOks6Kgh0SBFZTId/vKH/iEM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 11 Dec 2025 11:31:33 +0100
Message-ID: <DEVBH18RU4WL.2GFVGYVC8SWAC@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH 09/11] x86: Migrate spec_ctrl vendor checks to
 x86_vendor_is()
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
X-Mailer: aerc 0.20.1
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-10-alejandro.garciavallejo@amd.com>
 <73146271-c849-4d16-8eb8-80e7d59f42f2@suse.com>
In-Reply-To: <73146271-c849-4d16-8eb8-80e7d59f42f2@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|DM4PR12MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 06578e40-66d9-469e-7db6-08de38a07728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aTVJUkZNODVpWXlPZnFXZWVIdzFBaW9uZjE2VkxsT3krcVRBVE1aVG1uekFs?=
 =?utf-8?B?Qnd4Tjg0bHJrU2dKZDVUK093ZERGT2QzMlF0a3ZXNmlSUmI3cmpUR0NYTEoz?=
 =?utf-8?B?UlVaNXNEaFlnbXFja3ZoWXRDeHI3TTl6aG1kMjN0TFdTaHdZYWc3RE5OMnYx?=
 =?utf-8?B?YTkxUW5JVFRFODJ4aDQ1aDJOWU5EUFpDTkxoZkV2VldKempaZ0U3TzJNRTQ0?=
 =?utf-8?B?QXJtMjBudWw5OUtvaE1lMWtscE91dHIzRm1xRUdoTnh5b1VGeHpyTFdGOTZj?=
 =?utf-8?B?YmNESzRWTkFqN3pYV2ZhVkdKZGZrbHVTeU5FNHBQWHJSd1dLaSt1QW9XQnVq?=
 =?utf-8?B?cGl0ZVZscTlrcG1BOFZMWmRwVUcvbWpOaFlXS242Mi95YlF6cDYwbW1RNUd5?=
 =?utf-8?B?eTNJQnZmWEFneWgyVHJRektyOWNQSUpEQ3I2Z1N0Tnp3MTByMTJFRXI4Ny8r?=
 =?utf-8?B?K25OVnpTNzA2Y1Z1OWd1cGhDTlBKQkh5SmlhNGJLSFRlUzZpeVdOVTBtVGN3?=
 =?utf-8?B?V0svSnhXNS85ZFcrbS9HSkd3cWRnazZ0OVowWUN5NHgrZWszcHpseDlCdlhw?=
 =?utf-8?B?RjBialJDMzdnN3Frd1BmSWNncVNvL2tsM3I3WUg5OGxHNDVlN3pPL0MrcGxJ?=
 =?utf-8?B?T0d4b2dlaWRTSDBGTVlnRytUa1ZvU2lLd1E5aXdiNGQzdlJiSXphb0xkNFJt?=
 =?utf-8?B?NkhsdTNWVHhKWTdmdk00SHNBOXZyY0pZQ1ZQRVdyWUhvUTFBMFVTRzgybGtQ?=
 =?utf-8?B?RC94MklwUEhyNG5aQXVWdnFaUUh4a1c4OXIweGxUVm5ZU01SYjhWUEh1Vnhs?=
 =?utf-8?B?azNjZkxYQVBrTHFsbWlZMEhzOExTRWFPU3l4ZGdxWklhdmsyN001V3pEVGs0?=
 =?utf-8?B?SURvYWxyK25YYVBkSGJaZDhWc1NmS1lycTZlRmtHdkI1dU5YcCtTeWZJL2Jl?=
 =?utf-8?B?a3B3VnF4dkpOUlM1MXI2TGw3WnNocFkrNkJWZVhjaXVLNXEyVmsrNkJnZVU5?=
 =?utf-8?B?SE9USGROU2JGSmE1bEhpY0FDMGl2TjE1R3dCOWtBcWplTDJTNHBTVStUWnQ2?=
 =?utf-8?B?VWJWbUNIZmlpTmRqUWwxT2gzT0l6QVhnbzJNdXZqcXQ3MklmN2VuSDMwNGxW?=
 =?utf-8?B?NExtZWRTQnBSZVRSY1QrRTU1VTJLTzNxTnBrN3NGY2M1VXNtNHhiOGhIeHhZ?=
 =?utf-8?B?YWFmWSswb3pObjY2SGp5V2xzYW9PdVpaYUo3bCs3aU56cldXUDVMQTRwVkdl?=
 =?utf-8?B?TDMxd2prRUl5eXFNZzk2dUNnQWEzWDBoVVJyWWxQSDJMbzJLVWN6c3VaS280?=
 =?utf-8?B?MFV4TVdBV0JrcWNkZmNXQWk2MUgzTTBWN21BdWlGR1JNUE55STBXUmJSWS9M?=
 =?utf-8?B?TEN0UlZZZml2TjhQYmdvRE1iUG5lOHhZdzdrZVdWbmw1Q0MrcXY0cUkzTkFC?=
 =?utf-8?B?ajRZRGVIMmpNU01TcWZhdzA0bXlWaTdqSmhqK1pGUHJkMG9qeVRMTVZhc1lC?=
 =?utf-8?B?QlF4VTBYSEsxdk9VMUE1b1NJemRSQTZ3eStwU09JTWF2WVFJNjJEajlzdURv?=
 =?utf-8?B?ZUYwVU5jTUw2TTY3UkZVMTRmZ2M3dzNmMjZEOWVpVzY0TDV1Z1BDWFEvdnI3?=
 =?utf-8?B?T25BTml4aktpNjE5MXE3TEpRMWYxcUhyaEdZczNldS8vclhXcjVNTEE2TTZv?=
 =?utf-8?B?cFZpMFRQM1J2WTVIbWJhMERBbjN1bGtETHE1RytPKzFRaURmazBURXliTUJD?=
 =?utf-8?B?em5YR21mRTF3RzBqQ3AvOEpUSWVNMkxIVitiNW9UTm1sbkpOYmhXNTJsR3o2?=
 =?utf-8?B?Tksyb3F4c1dwRUwzWWtIcmN2K3RGK3ZTbXBsZDhhTXZzZy8wUlNMeWxaT0x5?=
 =?utf-8?B?REV5UUVPY3d1TUM5WEw1TmdXYWs2TDFqbEt3d2hoZ0VkakFMekl3ZXRTaFlT?=
 =?utf-8?B?YzBOQXhKaXJCR1hjOC80TVF0bzhHSU9DMVFPTFR6R0RacTdOMWNaWG82U1h2?=
 =?utf-8?B?RTdiSFQrMXZZZk9CNXFxdnY4SnAzRUVBaXVzZlFhdHVDaXRUNVZvWS96NE9W?=
 =?utf-8?B?aGFpRzFCMUtVcGFteHZHdTlXVzFEZk1QTzUrZmo3ODR1N0hnSDc3dTNHSkRn?=
 =?utf-8?Q?iFnk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 10:31:37.7464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06578e40-66d9-469e-7db6-08de38a07728
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7550

On Mon Dec 8, 2025 at 5:04 PM CET, Jan Beulich wrote:
> On 26.11.2025 17:44, Alejandro Vallejo wrote:
>> @@ -938,7 +938,7 @@ static bool __init retpoline_calculations(void)
>>   */
>>  static bool __init rsb_is_full_width(void)
>>  {
>> -    if ( boot_cpu_data.vendor !=3D X86_VENDOR_INTEL ||
>> +    if ( !x86_vendor_is(boot_cpu_data.x86_vendor, X86_VENDOR_INTEL) ||
>
> One other aspect: If already you touch lines still using the old (being
> phased out) field names, please rename at the same time. This may then
> also help with line length in some cases.
>
> Jan

Yes, of course. I didn't even notice the difference at first. On the note o=
n
length, I'm revising the idea, keeping the same principle but making it les=
s
verbose.

Seeing how both you and Andrew seem onboard with dropping cross-vendor supp=
ort
and having these turn into constants, I'm leaning into transforming everyth=
ing
to a single "cpu_vendor", both host checks and policy checks would become
something of the form:

    if ( cpu_vendor !=3D X86_VENDOR_INTEL )
      ...

    if ( cpu_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON))
      ...

where cpu_vendor would be defined as a runtime check on boot_cpu_data.vendo=
r=20
masked with X86_ENABLED_VENDORS when multiple vendors are compiled in, and
the single vendor compiled-in. Perhaps something like... (untested)

#define cpu_vendor \
    ((!IS_ENABLED(CONFIG_UNKNOWN_CPU_VENDOR) && X86_ENABLED_VENDORS &&
      (X86_ENABLED_VENDORS =3D=3D ISOLATE_LSB(X86_ENABLED_VENDORS)))
        ? X86_ENABLED_VENDORS
        : (boot_cpu_data.vendor & X86_ENABLED_VENDORS))

I _think_ it would have the same DCE implications, but it would be much nic=
er
to read at the callsites and cause far fewer line wraps.

This brings down complexity, allows for the switches to stay (DCE understan=
ds
unreachable labels) and improves the general code quality.

I'm busy atm chasing emulator woes, but a non-rfc series of this will reach
the mailing list at some point. I'll make sure to s/x86_vendor/vendor while=
 at
it.

Cheers,
Alejandro

