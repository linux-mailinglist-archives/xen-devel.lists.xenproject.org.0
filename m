Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F28FC57570
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 13:11:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161124.1489138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWAZ-0005oQ-I8; Thu, 13 Nov 2025 12:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161124.1489138; Thu, 13 Nov 2025 12:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJWAZ-0005lK-EC; Thu, 13 Nov 2025 12:11:19 +0000
Received: by outflank-mailman (input) for mailman id 1161124;
 Thu, 13 Nov 2025 12:11:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIX7=5V=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJWAY-0005l5-Hp
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 12:11:18 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8d6066d-c089-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 13:11:13 +0100 (CET)
Received: from CY5PR15CA0225.namprd15.prod.outlook.com (2603:10b6:930:88::26)
 by CH1PPF2D39B31FF.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::60a) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 12:11:07 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:930:88:cafe::c4) by CY5PR15CA0225.outlook.office365.com
 (2603:10b6:930:88::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 12:11:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 12:11:06 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 13 Nov
 2025 04:11:04 -0800
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
X-Inumbo-ID: d8d6066d-c089-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HP3xMrWNj6zChVsM8ZLxyhLW22eRU3drpVMvNf9qleZV68LMFYSsP+zWDva4wODCHLfxOvNRoQ9v60VZKEjuA3rpSAKze3m/UOys2Vu2uxGMxNE9+OSv935AtI5jrF1/6gWlxKt7KUghB2vko6Zj03kSWwJ0PodYGaaUemubJtSSuG8mHXKX9x2PF5HUJibscmfRaHq6PYYyHLBLGWDA0qhuYB55uXgdyNM65xe/uMlAWiRh90tl18TgVCppY4wRH/1fffd33JJwNmmLLVA+aMkW3ffsaWAtk1PiEMEfKA9mDsM9jt0gckakPmM0deQgb4l7xmIoD/3HxIMNpG8+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQ6STHSeVh9OveuC6XAfNdRZRY2Oa/qbFLZCd9oxU3o=;
 b=ddkbuG5HgjZCOU0184ifG3sIFqTeqDurntOSQIl7WHozjJDEfzjmmkVO9ReMwwf3nN6ulg6UR/1cXym8V0HPjpAWFjcgv6/cfUksCZCI9HBqb6FAuYHv1I0Rr3Ozo7fVFO4nYTFPuFjwVBIDaYtNPvNQv+lJ6T9q+S/hoPv4dB1I0Yz4MEY7pinkHuDghWgDaM/0J1YByEQ5M5B50glqejarzHi1OysMeIWG4+tRdfu+TsTHkoqFMkU32HksjgACM6l3GHXDb5acyKCJhlV9n/iD6hMDq39D1Qw2SkOxDrEkds2hmWwhbJEQbnOnMqi31MCpKI9mhZx19/y0eRMK6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQ6STHSeVh9OveuC6XAfNdRZRY2Oa/qbFLZCd9oxU3o=;
 b=cUvxQb5B2ysz4QR+pLg1cP5bylDWvRVlKpQprRrLAeSDmXKZ3OQ1n/7UIPhVMKW194dnjyMLSPg4TycnQcg5Vqev7pA1rJw+k5JtskvHGCA1KGktTSXcOd7CUqmPbSvQDLnm2NXViaLHo1CA6c/FQ6zCXOwfcwO+IGoIMJckGC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 13 Nov 2025 13:11:02 +0100
Message-ID: <DE7K1Y4UYCOW.2DLMCBVK7J0QT@amd.com>
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH 0/4] Add Kconfig option to remove microcode loading
 support
X-Mailer: aerc 0.20.1
References: <20251112162219.226075-1-alejandro.garciavallejo@amd.com>
 <61df49ba-4aab-42e3-b945-700a8f20c739@citrix.com>
In-Reply-To: <61df49ba-4aab-42e3-b945-700a8f20c739@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|CH1PPF2D39B31FF:EE_
X-MS-Office365-Filtering-Correlation-Id: e73471ce-fc01-4339-6401-08de22adb979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MklmaGlRRkQ4NWhVYTdqejBNRGsrWEVOQzNBWEhWSGxSeDhzRkk4K2FlaUVw?=
 =?utf-8?B?b2RpcURFZWZKVXJReExGMXFlbmJmYkN1emlWOEIvZ2JLVzdncXpCWGtwTllW?=
 =?utf-8?B?V1pZc3hCeTROQTFubHhlK1FQRW5XZDU4L3doZ3RLYmQwWTN5dnpNMjUzL09J?=
 =?utf-8?B?MnFOMEQ2ZFlrUjhKNGxTQ1FzTEpzODdST2VvbTBMeFFaMFNWelVITHJuYTZn?=
 =?utf-8?B?ZVJVMzBBZEpqNUI0dXNZdmMwbGZ3ZWxSVisvK3FERCs4S0hTMzdGMEo4bW9J?=
 =?utf-8?B?MFdkOStndGNpRW9xa3dzRERVL0JuVGl6Uy9IRGRHbTU3Z29aOXRFbFdzVXFG?=
 =?utf-8?B?Y3ZoV0lFcHl0YmplNmFwQit2MUFJU2lVWmRqS0czUFlWVU9Rb0NLMDNlK0xp?=
 =?utf-8?B?VlQ0aGRlWWZ6VUFqVFdKRUxmZzlNRWQ1RnowZzFBc3ZmTkpwN0t4VktIOG01?=
 =?utf-8?B?SkZPTnVnOHVMdWlrMWRBMFAxbDMxZ3ZIZmtEYlJqMUpEbVliWkRhbmdSVDV2?=
 =?utf-8?B?ZVRTdjN4ajVueFZydldiL0djSCtacnRMMUxVMyt4OTYvSVRxOFVVRVMzc2Zo?=
 =?utf-8?B?Ti9VWmxmdHBDYkltcGl3aXVvT1hrdEdDc3QvZzZNOXYxcHRKY2E2SFBNTFNl?=
 =?utf-8?B?WStCbHVHVEtueW1JTjBTYXJCak5aU0J5dWIzNDBZc0ZaQUhiS1loQ1FETkFr?=
 =?utf-8?B?bVgrTGJ1UGI4b2VTL2FqRzlFT3hIRWxGdEdoWUxRdk5qSnA2TkRXK09ZdDAr?=
 =?utf-8?B?ZXhDN2hEbkkzUDMwNmVUSkVRNVpPV1VGNUtVNmJYWUM5NEV6dm54NFNiRzRC?=
 =?utf-8?B?enpoNkJUSXlkYWU5T3h1Zm8yVUkxdm8rQ1daeWsyVEJkdG9UOWJRNXZ0ZVFv?=
 =?utf-8?B?UWhjVlI2VVJhYUZSQnJNRXVLSjB3ZGV1d05USksyK0tIYWVrQ2RDSGQ2U25D?=
 =?utf-8?B?RHF2Q3JWVDVzdjVtbW83VlQvRkREOFljN21kR1FJdGtQd01MeHJQMERRTkFU?=
 =?utf-8?B?TDR4MUlLMGRvMlh1QnQ2MkhJekVVaC9MT0VTTXFnR2RhWjcxSnd1Ums4U3Vj?=
 =?utf-8?B?dE5SeCtNbWhEaHoxQ0V3S0lnWVV4NnM2SExUY2wyak9ZSy9jK2pTRTR6VzhW?=
 =?utf-8?B?a3RheHQ1M2FCS3Y2UFhNYTdWVHlQOFFycXNYcGNnUCttSnh6ZmlKSG5vYXFs?=
 =?utf-8?B?dzB0YVlCcTJrQVZzNERUU3dyckphcEppTWdYSTREd3V1cklpWHdUM2dyNjBj?=
 =?utf-8?B?eXIxSHRpemFCQlFDeDNXZVNuRVhWNU1HWWZBSU9nVmhWYy9PaWpHSk9GWDRV?=
 =?utf-8?B?L1N3ZHFObnhPc3R4Wk5mQld0TnhkSEJZTVZ3dUUrK0hiUGdra0x0ZzN0Q3Rl?=
 =?utf-8?B?Q0taazFpRk9JdDVtZTI4MTBYMytpeG9JaFozVklRTmRUS1pUVmNtY3RqMDZz?=
 =?utf-8?B?RXFiRHUrZURCTUpLS2h1eXlEY2ZjejVONmZNWFhTWWtSdEt5R1ErMXhGMDlT?=
 =?utf-8?B?THZmQ2J5QnkzblZsNkFRTEdyeWlxdlZMNVduYmR0TlFaRUF5WjVmNjBsODRu?=
 =?utf-8?B?VVdOTUwwYmZYSlNpUC92TldzQVEweXRCd1ppam5ScFZGTmRYWERVS0lLZ3V3?=
 =?utf-8?B?anh2VTFLZnp5R3pBSGdISmQxZnNTWS8rM0ZxbWRDYnpudU9sZFZKWmZPL3Jq?=
 =?utf-8?B?bFpYYUY4bnB0TjhvbGVCbHFwcU5GUnJUbDhReGNpQmVQdnlhQ3lxVkEwSjJU?=
 =?utf-8?B?WVphbzJ0Yzd0LzlXMWdQWmN5QjIwaVZRN1RwVExESm5GNGpQOWFoWGE0eVRD?=
 =?utf-8?B?MENEbk9NeEYvMFFrYjF1enRWdTNWUUpBd01MclZVKzFIKzJyV2Q0djVLQnlU?=
 =?utf-8?B?K3NucWk2OWVFRlJYMVdZRStCeEV4VmI0YzVkZEFPVXhnd2tTdklIQmlHNG9F?=
 =?utf-8?B?V0RUUFhaZnJTNGJjc2tYVWF6VWlRdXhwbTRZWGYvaTZFRmFKbkdYSGdVUmEv?=
 =?utf-8?B?TUorMkVMK3o4cElxNllQT2FSNXgvWFZ0blpHRGV1UXBCZmpPc1BoaDFpVjRV?=
 =?utf-8?B?WndibHEwMDlJNFVnZk8vRnVvcXVVK0ljL1J1dzRUckFjUmlDazZzUms2OHVF?=
 =?utf-8?Q?5t0E=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 12:11:06.8743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e73471ce-fc01-4339-6401-08de22adb979
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF2D39B31FF

On Thu Nov 13, 2025 at 9:50 AM CET, Andrew Cooper wrote:
> On 12/11/2025 4:22 pm, Alejandro Vallejo wrote:
>>  xen/arch/x86/Kconfig                    | 12 ++++
>>  xen/arch/x86/cpu/microcode/Makefile     |  9 ++-
>>  xen/arch/x86/cpu/microcode/amd-base.c   | 55 +++++++++++++++++++
>>  xen/arch/x86/cpu/microcode/amd.c        | 55 ++-----------------
>>  xen/arch/x86/cpu/microcode/amd.h        | 15 +++++
>>  xen/arch/x86/cpu/microcode/base.c       | 73 +++++++++++++++++++++++++
>>  xen/arch/x86/cpu/microcode/core.c       | 58 +-------------------
>>  xen/arch/x86/cpu/microcode/intel-base.c | 50 +++++++++++++++++
>>  xen/arch/x86/cpu/microcode/intel.c      | 56 +++----------------
>>  xen/arch/x86/cpu/microcode/intel.h      | 16 ++++++
>>  xen/arch/x86/cpu/microcode/private.h    | 14 +++++
>>  xen/arch/x86/efi/efi-boot.h             |  2 +-
>>  xen/arch/x86/platform_hypercall.c       |  2 +
>>  13 files changed, 259 insertions(+), 158 deletions(-)
>>  create mode 100644 xen/arch/x86/cpu/microcode/amd-base.c
>>  create mode 100644 xen/arch/x86/cpu/microcode/amd.h
>>  create mode 100644 xen/arch/x86/cpu/microcode/base.c
>>  create mode 100644 xen/arch/x86/cpu/microcode/intel-base.c
>>  create mode 100644 xen/arch/x86/cpu/microcode/intel.h
>
> This is awfully invasive for something that ultimately drops only a
> handful of lines of code.

Two handfuls when considering both AMD and Intel. But yes, I'd rather not m=
odify
as much as this. However, for our purposes it's important to physically mov=
e out
the code we want to Kconfig out, as then coverage reports don't need except=
ions.

>
> First, it should be CONFIG_MICROCODE_LOADING. [...]

Sure,  I don't mind it being $FOO or $BAR.

> Next, annotate the functions that you conditionally don't reference in
> {amd,intel}_ucode_ops with __maybe_unused, and dead code elimination
> should do the rest.

I considered that, but local DCE poses problems for coverage tracking, whic=
h
we care about deeply. I'll check if there's some magic we can do to enable =
that
pattern but as of now, there isn't.

If I can't make it work I'll just take the sledgehammer and drop all ops an=
d
dependent functions.

Cheers,
Alejandro

