Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A68ADAE02
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 13:08:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017142.1394112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR7gj-0003u0-92; Mon, 16 Jun 2025 11:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017142.1394112; Mon, 16 Jun 2025 11:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR7gj-0003rm-5G; Mon, 16 Jun 2025 11:07:41 +0000
Received: by outflank-mailman (input) for mailman id 1017142;
 Mon, 16 Jun 2025 11:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KWUM=Y7=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uR7gh-0003rg-JV
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 11:07:39 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2416::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c41dc1b-4aa2-11f0-a309-13f23c93f187;
 Mon, 16 Jun 2025 13:07:38 +0200 (CEST)
Received: from CH3P221CA0003.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::14)
 by BN7PPF862C85B20.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Mon, 16 Jun
 2025 11:07:33 +0000
Received: from DS3PEPF000099E0.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::e9) by CH3P221CA0003.outlook.office365.com
 (2603:10b6:610:1e7::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 16 Jun 2025 11:07:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E0.mail.protection.outlook.com (10.167.17.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 11:07:33 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 06:07:31 -0500
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
X-Inumbo-ID: 1c41dc1b-4aa2-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHbHfxGo22x9DZXgmAOSYIxV0hR0+qYqVrc1EJ5HiXH/xsyKYxWdMBltnRKd2EX7tzEPBuX7lWWW/iF+QSIUDN3ewmGoD4YI1OQo7emxCEfbSxScMxoBre5swrB6nUmJuqdOVZR6MlOrLr5CLMSWkxehQiQjMwHlp6fTbLTHSqk0aAqGSkjgtrTwE4ZjmLf1Xas0Z6pUh3XFe2DUtr1lRgjSQxjkX1MJj0n0MHmj13/bPgVOnOcXxnWykOiqe8BljITAAJRFutaaoysEl2ZRhjOSHITC+rfxht85EQlAQg9l0AMZzVzjlVNHuC/Xr046f9kEwmB7H76+R88Ff06wzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLdGv+fG2t86tyUle0iGrYvhPoWrKjMYUwUgcNk5+DU=;
 b=HvWM2wPdjF54BWg8BQNITGb8bR72ljk3vPEnttCr/Anv4CZv9afUJjkedSENDkFUbVojU96S5ThIjPFIvyp+V8IF/cKt7H15oresoIYQtamwNmew1Or1VMM3shC3VtYbJEdowdzwSAQt/QQ4ly4hwYRs0DfIbyJ47ZRpC0N5wXAzLdWrZFkMO60blJ9G0URILx5gg454jWB8IewWYo/RhVzODStrYJBQ/V7XYtH99jzU7O4Ga6oUO0k7qlMKCdn5ucvSf2Vsqilp9B8LY9fA9Nfp9CrpC7lwvlVVMfMcq0JL7sl4e7FZoKMLFCr8P/wbwaS7UCJXrVlpc9YmJhCSYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLdGv+fG2t86tyUle0iGrYvhPoWrKjMYUwUgcNk5+DU=;
 b=sGbZB4Ca+M121Pl96yGZO+nRMFpSw4p3zV7+Y+cECBJBazNt+BRVmBR1H3EcOuKP9D9p67WS1WSGMSbZ/Suub2CatGLA/zNVXVZPzZ8dIJFzSM20j+dKy3K/JaRmdiHEfJGtM2VQgpNJyvhzGmJD8HAclu3IMfBHxeIub3KUhM4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Jun 2025 13:07:30 +0200
Message-ID: <DANWRL199OKR.3DQIUDPKHWQ5C@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 03/14] CODING_STYLE: Custom type names must be
 snake-cased by word.
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250613151612.754222-1-agarciav@amd.com>
 <20250613151612.754222-4-agarciav@amd.com>
 <c0ba289c-e0cc-4ca3-84b1-4c8a263ffbe1@suse.com>
In-Reply-To: <c0ba289c-e0cc-4ca3-84b1-4c8a263ffbe1@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E0:EE_|BN7PPF862C85B20:EE_
X-MS-Office365-Filtering-Correlation-Id: 42d618ea-cb66-4b02-bfc4-08ddacc5fed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzNkTm5KSTVCUy9qWjNHeExMZ2dxcVdsMWZZYm1HVEUxdE9vYU9TdXlubkdm?=
 =?utf-8?B?ckswWkNNU1lLNkppWExvd3luYnBCLytMMFdOeUdpelF2ZUdSZ1VPTWtBbU42?=
 =?utf-8?B?Z0JXZktXR1YzV0RvQUp3dWtGNXNJYkI5bm40aGNydFN0azdWa2Z6Wm8rTVBL?=
 =?utf-8?B?RzhRZFdCejRZWVNzS2tOcE1tSVZ3TndIdnpwQkFUS0hvclRhQ21ZbXZ2Y1RF?=
 =?utf-8?B?cUc2TTNkL08yQ2MxR3gzclM5Q3VqQlN1RTg1RlRQcDE3SnNVWXc0MUxTakpO?=
 =?utf-8?B?WG5DRFVCN0daV3lOOXIwSnVTT1V0Y0xnQW96UmtxQS82ZFhtcnFINm1iQ2Jo?=
 =?utf-8?B?ZWdZeFhLWnR4TG9CM0t0WmFPdkZpdVZhWmRCQStZL1d5NlZoZWVJUEhsK3di?=
 =?utf-8?B?Kzd0YUpycjVGUDNoc0I2d1B2QUhFZG1zYkxuZFMyNnVuY3R6ejU0c0Rha2p1?=
 =?utf-8?B?WithSFpSMzF3K2dVaXlZanNMRnRLZUVNZFp0SitPcGNQK1QrN0tsS0o3U1pp?=
 =?utf-8?B?N0RBUnZPTzdDaDJHZEJWQnRNbmwrdktOaGp5TzdVNldDVVpFMmZrUzA5OFE2?=
 =?utf-8?B?WnNRaFlPQlNMOEdXMEpIV09DVUJWSUY0QnpVMFVycWlTWldsbXhZYlZrenVy?=
 =?utf-8?B?V0poQWVMeFNCZDNuZUttK2ttaDNDVkZBSFVRN2RaNDFQL0w1TnduN0RIbS96?=
 =?utf-8?B?dmxZLzhpdlJVemlhWktOSDVhUE5wN2w0TTBpRGNPN0cyNmpzNEFtQmxuS09M?=
 =?utf-8?B?ZVF5bGV1K2dKbG1TemkvMU5yWEY0SUJwU3YrNzJKQXc4VmVPd1NRTWRpRGVk?=
 =?utf-8?B?VTJ4OHY4dDRQbWRiQ1dTdGMvc0FUU0xLRzcxMGw3WXJ1NllJQ0tZVWsydGpj?=
 =?utf-8?B?d0VKOGRwN3BFY1BSSGZUejRlRGFFK0taeGZ6czMvRHFqeGNETEdYbjl4UE5D?=
 =?utf-8?B?cGJFeDdpaVNieFVpK09wSjUybGRVaWdPNGloR1VjY0N5VVlDb0tTL0xyT2xJ?=
 =?utf-8?B?R1ZXS0U1TjlNeGovbmZtNVNlUEIvNC9MTWU1TVZydHdQR2NJOUFhSmZvYjBM?=
 =?utf-8?B?eWsyTm8yQXhYZFdaWVRBR3Z6RUd2NXh5a09yR1hFZjVUb045cGkycXp5b0c1?=
 =?utf-8?B?dmlUTVh4eDJCQVg5Ykg1ekdCd2JJMzBJMmdrdVRPYTB2Mlk3SnlveTJuVkR0?=
 =?utf-8?B?VnVXTm80WlVhVFRLbmxtc2FvZ1F6QjN1NFVaRTdxanR1VW1ySUM4KzBWUUJm?=
 =?utf-8?B?VndTRmx1dEZOTjB2bm9DTWxLRTBiNVBLQ1RzcVpvZTZuZzFvcnVBbmx2eWJY?=
 =?utf-8?B?SndkMWRnMTZwcVBlaERXZHN6eVJUWHVSa3VTQUxjaHdGdmJFK042TWwyNVRl?=
 =?utf-8?B?Z0xCYkdVbDY3NllWeUVHQ2JVWXBOWW80bk9YMTBZbmc5SnBRNjQzQmhPYVFt?=
 =?utf-8?B?empiK2N4YkdJMnVwTUJmWnEwcjIya2NvbG1wTmVHQ3pJNy9JWExoZE1waWtk?=
 =?utf-8?B?YzlROXZhOXBLVE5JVTRvejBVRWNYQmhrbGZscXlCVFVXV3NLRUk3Zm9acnZ0?=
 =?utf-8?B?a2hhQ2tIZXRCb0JkRENyRWJSUmI2NDRrSjNkZndJbEF0UjBUNXBiVVZJR2Nh?=
 =?utf-8?B?TGFnNFJtRTF1dVlqUXRDN0JDa05vV3NhWG4zbyttL0l5cEJ6VWFEOEFxVTRt?=
 =?utf-8?B?Ri8xWU5hMmthSFI2VmszMG1JQk5sN1Z6NTVtdWZuM3Y1MXBYNVN6SEppcW94?=
 =?utf-8?B?NVowZmtHc2xpZFI0K3JsYkJTYys3M1B1eGYweFNzNys5WkJKNkgvMyswVndi?=
 =?utf-8?B?UDdHZHlLOFVrNVlsTStuL3RTeFZSTndGUURFVXE1U1BMY2dXTzZVYXlVWDRn?=
 =?utf-8?B?YWdoZnlJQm9FcVZHbUlEeGJ3SjFGUTh5Vmc2ZVJXYm5wamhiaGdYamdtL0xw?=
 =?utf-8?B?RFVoTVhrVUdFRGtQdDZqMVJIQkRYTTgxVS9CSXpSN2x3bkFZQnhSY21KZ05H?=
 =?utf-8?B?dWkwU0xYeUk0Q1Z2b3dzdnJDLzJpcjNyeHpCN2FZYk5aZEpUb2FtQm9RaUoz?=
 =?utf-8?Q?G+pSXH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:07:33.9769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d618ea-cb66-4b02-bfc4-08ddacc5fed7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF862C85B20

On Mon Jun 16, 2025 at 8:48 AM CEST, Jan Beulich wrote:
> On 13.06.2025 17:13, Alejandro Vallejo wrote:
>> There's the unwritten convention in x86 of splitting type names using
>> underscores. Add such convention to the CODINNG_STYLE to make it
>> common and less unwritten.
>>=20
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>>  CODING_STYLE | 3 +++
>>  1 file changed, 3 insertions(+)
>>=20
>> diff --git a/CODING_STYLE b/CODING_STYLE
>> index 5644f1697f..e91ef7b3ca 100644
>> --- a/CODING_STYLE
>> +++ b/CODING_STYLE
>> @@ -126,6 +126,9 @@ register).
>>  Especially with pointer types, whenever the pointed to object is not
>>  (supposed to be) modified, qualify the pointed to type with "const".
>> =20
>> +When defining types, split its words using underscores (e.g: prefer my_=
foo to
>> +myfoo).
>
> Why's this being put in the Types section? This is about identifiers, and
> ought to not be limited to the names of types.
>
> Jan

Because the existing argument had to do with type names and I wanted to lim=
it
the blast radius of the new rules on architectures that don't currently fol=
low
them. I don't care where it sits or how large its scope is. If others are
equally happy to generalise to any identifier, I'm happy to do so.

Cheers,
Alejandro

