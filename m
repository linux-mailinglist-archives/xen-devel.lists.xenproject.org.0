Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97AAF5CFC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 17:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031375.1405193 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWzO1-0005nH-0A; Wed, 02 Jul 2025 15:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031375.1405193; Wed, 02 Jul 2025 15:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWzO0-0005lA-Sy; Wed, 02 Jul 2025 15:28:36 +0000
Received: by outflank-mailman (input) for mailman id 1031375;
 Wed, 02 Jul 2025 15:28:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWS=ZP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWzNz-0005l4-LC
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 15:28:35 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2417::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 369b7d38-5759-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 17:28:34 +0200 (CEST)
Received: from BN1PR12CA0020.namprd12.prod.outlook.com (2603:10b6:408:e1::25)
 by DS0PR12MB6438.namprd12.prod.outlook.com (2603:10b6:8:ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 15:28:30 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:e1:cafe::e9) by BN1PR12CA0020.outlook.office365.com
 (2603:10b6:408:e1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Wed,
 2 Jul 2025 15:28:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Wed, 2 Jul 2025 15:28:30 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:28:26 -0500
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
X-Inumbo-ID: 369b7d38-5759-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3JJbmqv2caBj8GyOW5OluvC8um7rxGHLgdnRWYfsSHpkJhRb5PnqI07XgjLavbLPh6XCzEVxQwaV9YmLvD5EuGZsY1PZ9qZn9McUzsGTid8JdK3fT/X+cX8WNYxddEnW9DnDnfC6DVlmMbW55ek963R475tW8o4KRXWGCSsyA9Jd/otSwWpYsXMKJk/Vl5KUFK0rgAUR8FmGEZSKsHPyWDHEhG3ecWDGHEjnEyI5Nl9jcf5mZ/AK1BoawG7zZan83BxyTKgwCB6yQ3BFoIvOZ46o28aey8JD/BVmDbLV53wybbzNIE5YJVcahCd2F3RcLN2XYB6gkU9xHKVYAqV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTqD5zRKnyxuaAEmCCOCJf6eylJekqzkFmU0x9U6Cqg=;
 b=Cq6cia7UNI14+KbpyD8MbAJlbNhG58hOWaHLgnvrh4BWI7y9drBSBQI21uiFhgHoHTyEqSBr3zV6a1EJwtvZaaOWCy4SKw9mhIaARQk8TWsSjV238+AbeRZx+DkC0f0D1ollVMhQRWQddWr9HoEwytnsPkA/Q2NJ6V9XylDUA5zL4CJi9atMHEmpgixMz+bdjBZMzG6dSHWNMkAIfTIT8XnSYeinfKMxGdZyyJ0jZ9603/YZwniVQrD2FILjp383Gt4OJX1DR9o1ZXv/NaPNDCWUMoJRZ7vcETIhs81IrwkFM8cY9YfR8ZLD4Dn+3dhHAuAp7F95Tr2S4GdIFt6+AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTqD5zRKnyxuaAEmCCOCJf6eylJekqzkFmU0x9U6Cqg=;
 b=jWvsiZVl9NjbTZgKn1I4JFwrc6wfTLBzXOKsH/SpWznsCIF38Y5keK7lh8jsjqEB9KoRUapEyvdfptis3JbJtNa2bTWz0UiAuYve5Llzi87RrMm15R+W1GcJOzfQA1i7fCKr7QuX7feuP//8hW5ucfGNAudnLkr8BW4GGYjCCpo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 2 Jul 2025 17:28:25 +0200
Message-ID: <DB1OC2FGH37J.3VDC4G4ABWFRI@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, "Connor
 Davis" <connojdavis@gmail.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 08/10] xen: Split HAS_DEVICE_TREE in two
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-9-agarciav@amd.com>
 <ffba326b-6fa4-449d-8db3-66fb145a61a4@suse.com>
In-Reply-To: <ffba326b-6fa4-449d-8db3-66fb145a61a4@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|DS0PR12MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: b041cb8f-c652-4a82-ecb3-08ddb97d1951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YStFRHFjN2RRK1FtbGtHdHA3akNmZFExR3VCQ0pjVUI2RzIrczZtWU5maTZw?=
 =?utf-8?B?RnNkMDRVRnRXZGJrOWt4Qlpqa1ZZZFJTNE9oNnhQNmtUOFFiTDRsUjJmM0kw?=
 =?utf-8?B?aG5GbCtQcnh2d1AxQkV3QWgrZmtWVHo0MEJDV0Z2MnN5WmNtQkt0TW5wQlVk?=
 =?utf-8?B?ejJSVTQ5QytnblRLU0JOUGJ1RWhyY2puNU9CYUlEOTdjRnJTVHVPQlROZlNS?=
 =?utf-8?B?bkRqc1plTmYvckE5OGtXNy9yWnZxbFkyWUg0emdhT0tENlIxODliSS9YT3JN?=
 =?utf-8?B?TmMwbit3VGw4UU9ESWVxVklGY1ZBcHBqWTRvcTR0SVRLYm0rc1F2dFJrbHVO?=
 =?utf-8?B?ZTlqV1c0MFh6T2MwRmJMOVNrTXVPYUNjak5nMm9BZE1aYlpFaCtDTGdnL0Q5?=
 =?utf-8?B?WWZPM2JrNHZtTEpucndnSWhUYnZPK3pkaHAwR20zSWh0OVVjRitxekxaZFBB?=
 =?utf-8?B?eHlMS1lrV2JySVJkUkFKU05temlUVXhSYjQwcUREbGFyQTVLZVFwckxLVGZF?=
 =?utf-8?B?a3FuUkFpSVpzMDRYRDVWTFU1d0JSU0ZyUWlWNU1TUkNjb2t3ekgxbXNiL3lC?=
 =?utf-8?B?bTBPTkJnUmxkQnhZSlUxeGtFNTNXbWF5aEgrbnRWdERDOWM1cWFIS0s4YmlG?=
 =?utf-8?B?MXVKQ2hCQWFadnhBZkN2REgwNmtMdXFYOGEyaGlTNnYvbFBxVVpwTDJqUGRI?=
 =?utf-8?B?WS9ENEVaeUhaTHUwS2FRdzFCRTJEdytpVXB6K0RYenI1bEQyQXFpM1ZUVEdF?=
 =?utf-8?B?SVZYNEdhaGN3MGlWNGx1YU90UjlpZVM1empvU2RyTFp6eEQxNjA1UTN1dkMv?=
 =?utf-8?B?OVlWdnZnczBlTVlaTGNlSVdDbFBhVEliWU1PZE9rSDZRZzlkVDhhUmllQ3M4?=
 =?utf-8?B?elhXS25ZRGxXSmJteW1tU1Zhd2lELzU1Q1pkS1dMM0tVNlBrQTIvWDFqOGZP?=
 =?utf-8?B?QnJkOEdLYlp1bjc5ekI5NDRLVGtUNXdpRElpNy93bVQxRDNsalFuc3pyQjll?=
 =?utf-8?B?OXBjNmdzbjJya3ltZ1Z0ZFk3djZRWUtZQ0pGdmFHbXJlRjNIT0tZN1UyL0JF?=
 =?utf-8?B?TG1sQkF3NWVxbWJ3bkdMQXNUWkRLTjZpSFpKbk90dnRQcmgxR1RhYnRCV0d3?=
 =?utf-8?B?Mng3eG5XUlVYYTFGdXh3ZksrbXNyZEZ3L1NtMEJVMHhSNy90cjNURFZSVzFL?=
 =?utf-8?B?bWlmSTZ0ZzJ6SHk0c1d5bnBKT2dFaHRNOEVZL1ZSUHRtVjVubEZjajhiMGcv?=
 =?utf-8?B?ajNGbzVVWi9PY1pBRW1GR0ZiSlg2YTJWcVZPdmJucUtaQ0dncWJiNFhTcEFH?=
 =?utf-8?B?ek9pSHVqR0ZpUWlodnFJRENnUjAvNlhndW9LTGFwZVJyc3REUnByczBIVEg2?=
 =?utf-8?B?QUI5VkFSMWpHUy9zWE94REM4VWtIK1Jya1NFazE0dk0rN1hid0ZuN091Vkhw?=
 =?utf-8?B?Nkp3UlBzOFplaUJ6eUkyWnFZbHdFOXpTRmxsdEJ3bEkrNUtZcHcvRmxwMUFT?=
 =?utf-8?B?em5Ja1lUMVBkWllDRU5uRXJpMHZuckNXUVdpRjRlUjJUdWlnOURCNjR2S1RH?=
 =?utf-8?B?WE5CMDE5emNGNGdxRldpSnpSZ0Y5blpaaGRFdmJBMlNXWE1FcTVmUXNaaHFQ?=
 =?utf-8?B?eityWmlOcktqbzhRVk9YWjdDTnF2dHI0QWQyaDRGL2xacDdveGlESW0xNGRH?=
 =?utf-8?B?MjMydEYrWGM5NlJYdE1aaDB2dUVmTnJoUU5uUnFmL3luWUYwaVR4d2tiY0VE?=
 =?utf-8?B?aWdpTDFzNDlhbzN0eVRscmhmcWl5SW5xTDFUMklncDlESlFVRzFDdVoxckxI?=
 =?utf-8?B?S3A1cFlTb1ZVU3lLMTlNRzZ3WE5lUGFqdmFyY0I0QXRVekZONGQxNkMxanRi?=
 =?utf-8?B?SkVsTVl0anZQd2M2YjVnSVJBK3IrM2FWSDBiaXgyRmEzSjkyeFZJbitGS3Bn?=
 =?utf-8?B?TWJwMGorY1prRzFJWHlMb3pCcTczeDE4SUZ5NW42TmU4Mml3cVc4ZVVZVzdt?=
 =?utf-8?B?eEhKbVJXNW1yNE1DN205Wi83OFh1NGFsK1ZxYVhvQkYvdXc5dW9oSnI0dlp0?=
 =?utf-8?Q?ajOJcv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:28:30.2904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b041cb8f-c652-4a82-ecb3-08ddb97d1951
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6438

On Wed Jul 2, 2025 at 3:30 PM CEST, Jan Beulich wrote:
> On 01.07.2025 12:57, Alejandro Vallejo wrote:
>> @@ -85,7 +86,11 @@ config HAS_ALTERNATIVE
>>  config HAS_COMPAT
>>  	bool
>> =20
>> -config HAS_DEVICE_TREE
>> +config HAS_DEVICE_TREE_DISCOVERY
>> +	bool
>> +	select DEVICE_TREE_PARSE
>> +
>> +config DEVICE_TREE_PARSE
>>  	bool
>>  	select LIBFDT
>> =20
>
> We're in the middle of various ([almost] alphabetically sorted) HAS_* her=
e.
> Thus DEVICE_TREE_PARSE wants to move elsewhere. Or we want to move back t=
o
> naming it HAS_DEVICE_TREE_PARSE, but I think there was a reason why we di=
dn't
> want it like that? Just that I don't recall what that reason was ...

AIUI, HAS_X are options selected by your architecture. Things that tell you
whether X is supported in your arch or not. In this case, HAS_DEVICE_TREE_P=
ARSE
would be supported everywhere, while DEVICE_TREE_PARSE is not an arch prope=
rty,
but an option selected by DOM0LESS_BOOT (which appears in menuconfig) and
HAS_DEVICE_TREE_DISCOVERY.

I can move it elsewhere, but it's unfortunate to separate two so closely
related options.

>
>> --- a/xen/common/sched/Kconfig
>> +++ b/xen/common/sched/Kconfig
>> @@ -67,7 +67,7 @@ endmenu
>> =20
>>  config BOOT_TIME_CPUPOOLS
>>  	bool "Create cpupools at boot time"
>> -	depends on HAS_DEVICE_TREE
>> +	depends on HAS_DEVICE_TREE_DISCOVERY
>
> Is this correct? CPU pool creation isn't driven by DT discovery, I though=
t,
> but is a software-only thing much like dom0less?

In principle it would be possible. But I haven't tested the configuration, =
so
I'd rather err on the side of caution and not enable features prematurely.

In time, this should become DOM0LESS_BOOT || HAS_DEVICE_TREE_DISCOVERY.

>
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -423,7 +423,7 @@ static XSM_INLINE int cf_check xsm_deassign_device(
>> =20
>>  #endif /* HAS_PASSTHROUGH && HAS_PCI */
>> =20
>> -#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE)
>> +#if defined(CONFIG_HAS_PASSTHROUGH) && defined(CONFIG_HAS_DEVICE_TREE_D=
ISCOVERY)
>>  static XSM_INLINE int cf_check xsm_assign_dtdevice(
>>      XSM_DEFAULT_ARG struct domain *d, const char *dtpath)
>>  {
>> @@ -438,7 +438,7 @@ static XSM_INLINE int cf_check xsm_deassign_dtdevice=
(
>>      return xsm_default_action(action, current->domain, d);
>>  }
>> =20
>> -#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE */
>> +#endif /* HAS_PASSTHROUGH && HAS_DEVICE_TREE_DISCOVERY */
>
> Here I'm similarly unsure: Pass-through again isn't a platform thing, is =
it?

This has to do strictly with passthrough of devices discovered via DT.

>
>> @@ -789,7 +789,7 @@ int xsm_multiboot_policy_init(
>>      struct boot_info *bi, void **policy_buffer, size_t *policy_size);
>>  #endif
>> =20
>> -#ifdef CONFIG_HAS_DEVICE_TREE
>> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>>  /*
>>   * Initialize XSM
>>   *
>> @@ -839,7 +839,7 @@ static inline int xsm_multiboot_init(struct boot_inf=
o *bi)
>>  }
>>  #endif
>> =20
>> -#ifdef CONFIG_HAS_DEVICE_TREE
>> +#ifdef CONFIG_HAS_DEVICE_TREE_DISCOVERY
>>  static inline int xsm_dt_init(void)
>>  {
>>      return 0;
>> @@ -849,7 +849,7 @@ static inline bool has_xsm_magic(paddr_t start)
>>  {
>>      return false;
>>  }
>> -#endif /* CONFIG_HAS_DEVICE_TREE */
>> +#endif /* CONFIG_HAS_DEVICE_TREE_DISCOVERY */
>
> The situation is yet less clear to me here

XSM segregates multibooting and DT-booting, this refers strictly to the lat=
ter.

By DT-booting I mean platforms where the DT is given by the platform rather
than the user as a module.

Cheers,
Alejandro

