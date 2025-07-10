Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9330EB00125
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 14:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039438.1411290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZq00-00053Q-86; Thu, 10 Jul 2025 12:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039438.1411290; Thu, 10 Jul 2025 12:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZq00-0004yX-3w; Thu, 10 Jul 2025 12:03:36 +0000
Received: by outflank-mailman (input) for mailman id 1039438;
 Thu, 10 Jul 2025 12:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B1Vb=ZX=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZpzy-0004wq-M4
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 12:03:34 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e51f4baf-5d85-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 14:03:32 +0200 (CEST)
Received: from BYAPR06CA0066.namprd06.prod.outlook.com (2603:10b6:a03:14b::43)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Thu, 10 Jul
 2025 12:03:27 +0000
Received: from SJ1PEPF00001CE7.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::18) by BYAPR06CA0066.outlook.office365.com
 (2603:10b6:a03:14b::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Thu,
 10 Jul 2025 12:03:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE7.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 10 Jul 2025 12:03:27 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 07:03:25 -0500
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
X-Inumbo-ID: e51f4baf-5d85-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dN+lZjARuSRc4yYC8SI3Mso3vPs5h//z6SeecHoWZ/+7AiYTPBP+/vtzaB7Azlv+a6/nybOhcMDzjAk/LaPMFjZOIDC7LwTrzf+r6z2yZP0p8yw6za21582gEJmk1a1zbUDxZtovoQkK4fl3TMgIa32eGcMel9cJEOaARgQqsHQuuW/fVsvEkkXJyFHouFHUDopZAbf23sTBpDvMLVFlmaIlIvQTC7a+QV1SS9SzA6sno6DpTOnZuzvTQkBUomKQ6AU5vftqBkSK5SVPmngUbn1ZSeh6qaeN0YwKpO8NUozvkEXxGAcH77xUHGj2mTkfz9QHDS+S34VHXWC/9fHI8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vei1bKf+gNAQJPa66+43VmkUD6pDCl+qf3JZQrsfyfE=;
 b=E/hzxashFrmzTgstd6g703qm2CKt6oI4fJvbPj2N77g7ZORi92azsvCsMHh8lCoKC7tBRvdzAWkNQmibOxH2oH7y8ysevT9WnhJjFgp3bCdPIoMY1iJpQigtZAujObYVgOHp5TLDfNWC7xPtAJugWDTjFYtTUDSIiKBFa++lYWPNyKQ6k8phqD1MM2WsO3c9mcRwKXWrPxybRgUMns0EzRKuZor+zKHj63OrfR4VB32CEYSVXawOXwN1OPC/QUKCoEeiWWuUXRvkYXdncUf6oHqI4OxbYyErtlKMoUQlzhQFMKCBkOVH78Vfv+Sb5+d/IyxYCDqM/J9xrpFbWhGOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vei1bKf+gNAQJPa66+43VmkUD6pDCl+qf3JZQrsfyfE=;
 b=2bCVRchLd3Hz3ShMZ2DefJUK1RmDIBazPXCHCGwcVBaHl0rRadc/EDlTXCnxtH0dPB7YqRprgwDtVILQFN4vJSaH+wCWKyYxo1b5N6lmt2RWRQ2h68YBOqyw773bLeW3TBGCVdlfdKkDBqkmdi8Hm0jw0L/S13cCw0iiaFkoEcs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Jul 2025 14:03:23 +0200
Message-ID: <DB8CZG8VYIFT.1Q52IO1FABQS8@amd.com>
CC: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 04/11] x86: Replace arch-specific boot_domain with
 the common one
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
 <20250708180721.2338036-5-alejandro.garciavallejo@amd.com>
 <c3fb542a-1585-4eed-aea5-99e9e0a30fd5@suse.com>
In-Reply-To: <c3fb542a-1585-4eed-aea5-99e9e0a30fd5@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE7:EE_|MN2PR12MB4304:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e217d6-6845-40ad-81d2-08ddbfa9c78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TXVNc2dIckJmRGNDVDhidk4wR3NlWUlhUlgzeGtVa3BlZDJTMVF5Q0JOdmpU?=
 =?utf-8?B?b1ZDNXEyQ1NieXVZcWZUbmtRMW9KVGJHZ3B1YnhzMks4SEtwa0FGcVN5L2hT?=
 =?utf-8?B?RTQwMDk5NDl4cVFjVGtBckh1Q0xZN2ZHU1R0cmMzZzVOSlNDWXMwbjRiL0lm?=
 =?utf-8?B?ZWJPU3ROWFpMNG94dW9ScDZ2U0pFNzhjSklpRm5TbVRRbFhCQVlzZmJmVUE3?=
 =?utf-8?B?YXJHNEFONVh3UndCMnZkTzhXSEh4ZmpEVFVsRnI2MDJaY2p3NDVkdjlEa041?=
 =?utf-8?B?aDQ4UFVaYjRLK040TnFoNGMzS2NWWm5PaVBvaXdIRzVGM0FRb2h6WGlQaDhv?=
 =?utf-8?B?aWJ3dUdQeGlVYVNkL0ZHeEhIcVduL3B0UmRRdmZYTTZIRHVlRENkYU1ZVFov?=
 =?utf-8?B?aXdOQ0M1U0VWbnNKVEVhWVhJa1NKMnRQYXhHZkl2MVA2Qzlwa1VxaXBib0lM?=
 =?utf-8?B?YWRCeXpDSkgxYi9hRG15Tjc0VjFJejllbG1aQmlTNkI1NjgybjVnUzh0dGFm?=
 =?utf-8?B?MlJxWVhFSHZ5bHAwNVZwZmxybnpyZDN1UXNnbHc4SnoxL2dwTFk0USswMXZt?=
 =?utf-8?B?MlQvZEhsNjFoejVIMFJGeC9FVDZOK1ZlMForT04vR3A3bGkwMDM3cTIxells?=
 =?utf-8?B?RU9mU2JvcjFTdG42cCtza1h3QndramRzWjgyMktxd0RJd2xFNjZFNXR6SGZH?=
 =?utf-8?B?OWE5SWE5VVRvb0NVVXY5azBreUduTk43ZFJsZXhFRjJmdHF1WjRLczFzbnBQ?=
 =?utf-8?B?UFgzakluNzRDWlFDNVBraG5sWFpEWGU4ejlWVG9GSjNNcVdobFlheG1HN0tl?=
 =?utf-8?B?UWRWT0psOC9rWjFZaFRKdlpxM3lNN3NxYnozeStwaVJka1B3dGJTMURueWpI?=
 =?utf-8?B?cjNubUNkdTg1aHVCSlpSWm9TWlJWcGxBbTZveHhoTGIyQjNzTjBXWHlVcnd1?=
 =?utf-8?B?ZWh1di9sWVNBQ0NDTFBGbGJnYzRMS2hISlZndDV2UUF6K0orMk5BUXZyRmcx?=
 =?utf-8?B?R2hBUGFVL3Rsb1BhS2dXTlRFWnJQRHg5eXdXUWNwODgwYTFWMzNaNUt4UXRI?=
 =?utf-8?B?bDR2cWVnQkxuc01ZSEM1ZGg4aEd6Qzk2bnIwV1orQUVBSHpwRTFQbGd4aERt?=
 =?utf-8?B?SmxSQkRDYjNlSVhHOS9KL2t1Q3UrQUdoWGZScFZ5MGVXdFlLdk5TQ3pzbDQz?=
 =?utf-8?B?YStIRng2cXZ5V2lESlYvWE9RdnlFZXBOcGptTmVFN05mdGxGdGk4OVZhTWhv?=
 =?utf-8?B?YzF0MUZWN2dMaHBpZFNsSDB0VmlBRXFheTZVcC9BQ0trRGdGK2JuclFadjE0?=
 =?utf-8?B?UWtiQVJpT00wVzlIaUxseU1rUHZPQWM4RWJLa3hsOTMrTDVlandsYUhWVWFQ?=
 =?utf-8?B?NW1MUW5ET3E4QW5PUnBadkJnR2FzQ3FZajh3YXI4NUtPWUNOcW03Kzc1SEJG?=
 =?utf-8?B?N2NWNmF6YjByeVhVdFlWT1I0dDZpdzdyenB1dkRYVk14NGlTU2NZRFhEck1R?=
 =?utf-8?B?SktRZ2RRT0hOTmJ3RWxhY0Zqek5hcEN3Q21vY1hMczJpazVQcmVta2pkQVRp?=
 =?utf-8?B?YWJNa1NqNnlvcXNlV3FQSE05OUwwWUdHcmFFMi9zQXlKS1pWN2VYbWJhNUdk?=
 =?utf-8?B?a0Y3UjJnRU54TnI2WWhuM3I0QllIbEJxVC9jTUYwNUlGbTBTRU0zdld2ZVBh?=
 =?utf-8?B?U0R2SUc4R0MxcHNSYjdQTHduNnpPS3RnYmppWTByMUhLQUlWMGRhOTEzQ1F1?=
 =?utf-8?B?NVZkanZEaEhuMHB6bkU5STRKUVA3UWEzTktOWGVVQU1TbkVQOGhFWDltcHJP?=
 =?utf-8?B?dyt6SmRRSGx2QkpzNzFvT0VFTjB3RnJmL1doQU9oMG1sWjZLdTVET2Y1dVlv?=
 =?utf-8?B?VytPYVV1VVR4bng1Q2xRd3RHTEYvL1lTVm93L0NrN3p4NzhMdzR3dkxUVjBY?=
 =?utf-8?B?NmhtdkFWanBPYUd6UUZDWVh2dlJJRGZkcmlFYks4cFpZOC83dVlwK01sOW9Z?=
 =?utf-8?B?cTRDTjZVaFp0TUJuOXM3VmlsTUh1ZzJpREM4ejdHZ3RFaktaM2lwTHBTcTY3?=
 =?utf-8?Q?u+C5V3?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:03:27.3437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e217d6-6845-40ad-81d2-08ddbfa9c78c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304

On Wed Jul 9, 2025 at 4:24 PM CEST, Jan Beulich wrote:
> On 08.07.2025 20:07, Alejandro Vallejo wrote:
>> --- a/xen/include/xen/bootfdt.h
>> +++ b/xen/include/xen/bootfdt.h
>> @@ -107,6 +107,10 @@ struct boot_domain {
>>      struct boot_module *initrd;
>> =20
>>      const char *cmdline;
>> +
>> +#if __has_include(<asm/bootfdt.h>)
>> +    struct arch_boot_domain arch;
>> +#endif
>>  };
>
> I fear I still don't follow this. In patch 1 you made domU a common-but-n=
ot-
> x86 field. Why can't domid, which is entirely generic, not similarly be a
> common-but-only-x86-for-now field? What is put in arch-specific structure=
s
> should, in the common case at least, be truly (i.e. conceptually) be arch=
-
> specific imo.
>
> Jan

I tried to do the same with domU, but it's used by every other architecture=
 so
it got silly adding the same code to 3 different arch-specific headers. I c=
an
definitely move domid to the root structure under a similar ifdef.

Particularly when, as you very well point out, it's bound to be truly commo=
n
eventually.

Cheers,
Alejandro

