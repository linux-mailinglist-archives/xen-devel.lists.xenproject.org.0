Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A2FA82332
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 13:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943919.1342524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2TLU-0008CL-Rk; Wed, 09 Apr 2025 11:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943919.1342524; Wed, 09 Apr 2025 11:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2TLU-0008B2-Nm; Wed, 09 Apr 2025 11:11:52 +0000
Received: by outflank-mailman (input) for mailman id 943919;
 Wed, 09 Apr 2025 11:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yx2+=W3=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2TLU-0008Aw-3B
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 11:11:52 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:200a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dda0c31-1533-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 13:11:49 +0200 (CEST)
Received: from SA1P222CA0160.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::6)
 by DS7PR12MB6311.namprd12.prod.outlook.com (2603:10b6:8:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Wed, 9 Apr
 2025 11:11:39 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:3c3:cafe::28) by SA1P222CA0160.outlook.office365.com
 (2603:10b6:806:3c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.20 via Frontend Transport; Wed,
 9 Apr 2025 11:11:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 11:11:38 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 06:11:36 -0500
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
X-Inumbo-ID: 6dda0c31-1533-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWOCpTLtgoTfdeuxhkK2CyMbhktsztBQyldJzPT5X98Mx9zGy+0ToAYfH+N0Rv4/Nh3CLi31v0enSfL2e0Zzwfi2ATVJqBrzOhK/mzD30YveI1YlVry5BnjlMGHWCxqFcw1acAianUpdQAnoKz9f/XgE3FT/385eq6D69AuJkb23lna9D2euTPNXK7mEEmQE+8ek21Z8tTCvwzFjKu0qmRISnCq1plp3xxVU766n+dxuijljR9/m+MG1veubKmpLxrq4UbccWYE8jUARaqzcKMaTAExLveJQE+8Frtq5xW43i/BvN3FqOCv8QLiki73AculLbHA2EhD8XhYHLVRj/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Es/yBq7n8MRlrjZxuWDeqgWrcYzZw+BpsNzgg5w4EZY=;
 b=a9hFzwRscgnX95LxocLh4/nyQL0xDy9rSBWvPXZqiAqqi1r62bkQbwoaURZJvM9sOdowZ/zEY59PfYVWu4lepgbLYcFXUTxCK8jEs1Szqkdyg0knZF14AMQu2dmCEBY00zmSYOVSiG1qWJswMIbef9UdkgDjO6jplOHBfsdXp9Bi1s5FT5ITICWYbCan3/CZRerzROWYvMTov4/7mpg1O+9+3lNxLSLO554223suNqrtw2uKPwzJ2O/gxfYNwDQL1NwU1ezmCPHNCyN85jMGa1u4T35ByVtaNHFmQm4vVS5o1WiqwAOhn8bHpMJg+4eLQ1T9aX+Cl3g3hkvyVVJY1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Es/yBq7n8MRlrjZxuWDeqgWrcYzZw+BpsNzgg5w4EZY=;
 b=x6jAhlFJ+CpKubG8Tducq3p/vxuEbcWtuw9KhemgP/1yRHhdM87fPnEHxxrYtouC2v/X7UkK2+BESHkzNUY+UCgwHQrD6aQlNybugfMnnh+q1gKs2+RgrBCFvDvi0k3U2umBn4s4H9YS0sxju3+XO3Ua6VVyGrotzGJyHCh9DhI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 9 Apr 2025 12:11:34 +0100
Message-ID: <D9229NGQ6QJ1.18Y8EVWZDY8U6@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 03/16] x86/boot: add cmdline to struct boot_domain
From: Alejandro Vallejo <agarciav@amd.com>
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-4-agarciav@amd.com>
 <cdf00f8c-2143-48d6-abdc-8f56dafcc84c@suse.com>
In-Reply-To: <cdf00f8c-2143-48d6-abdc-8f56dafcc84c@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|DS7PR12MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b02dd0-3525-4675-9820-08dd77574c83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zk5EbGFaVFZkbjdjb3JKTmJ5bWMycE1YNjRsNU0zcFVSNVk3eTFDZHN5MS9T?=
 =?utf-8?B?cDloOXpUNWNFOGFhY2pYMjB0NDBIVG0zcDd4NENMVk4zSllPTFlNMkxvZC9x?=
 =?utf-8?B?aHAzVEhtUjZHQTFnQVE0a0lCclRwOGdxTU83S1lvWXY1eVpUUDRCdjJyNlZt?=
 =?utf-8?B?TTlKN29yREgxb2hyWTJNTEowNEIvTEt2TGJqMi96RUluYlovOTV6ZFFYcVhy?=
 =?utf-8?B?K3dML2lVSWNMMW1OdU0zVmg2OW4rM0dzc2o2N0lxZmdsc3d2K2o0WDFnUlE2?=
 =?utf-8?B?V0VjQ3NhMXZxVEJIMW5CeURkcGl4cDZyb3VMakVoTXBnV3p6aTlqMFhMc1lZ?=
 =?utf-8?B?Smx4eFNIL0VJVjl6WmFlT0E0NDI1Y0Rld0p6blJUd3ZDOFBGS1ZnTFV1Z0Js?=
 =?utf-8?B?UDg5Y1YzTGN5eXlQejVySTNtUjRZN2VoZ1BpTlZNd3IxMGZsUnhBdUdmSTJP?=
 =?utf-8?B?SW5NbXRjQzRGWmdvNURzTkcxRUdHR09UdWExUHExMWJhaU1BY0xSenJENU5X?=
 =?utf-8?B?blNUNzc1UUQwRmNSK3JqaXdaWkpRKzVodFlSSFQ4cGpjNEo5MmpDOFFXMEpJ?=
 =?utf-8?B?cXFZNGVoUnFNS2F3ajR5UFdGY2FScVZWVGE0aytXZXl1M2lsR24vMklTdy93?=
 =?utf-8?B?SnJPOWk2ZzNrbzF5ZktUZGptSjlMSTdld2dZL0kyeGswd0xkZzB5UDBwTzh2?=
 =?utf-8?B?REM1MlU1YzlVNVVRRERpVXRxWElEdWpTZVJXV1pKaGJhU0o1aGVXV0Y4a1hv?=
 =?utf-8?B?MUJxR1B5eDhLUkdwYUN6dWxac0hHekZZR3djV1FKMVozcUtyZGxCYzJxQW43?=
 =?utf-8?B?M0Q1Qk5nMWZYMks4S0VlaFlGR25CcitwNVQ1ME5jbTlYQkt0TUJMT2xVcGVw?=
 =?utf-8?B?N1dEeEpnemp6cFJkR3pMY05wcWNIemRBNUtjcWFSMzl1V0pUQldxS2tab3JL?=
 =?utf-8?B?RGgxTmJhc201bHZ3TjVlWkNZSmFLdk44ZTBYb0FiMlJianc1dXZMSFBTRVpq?=
 =?utf-8?B?V0VWakxjcTBOSGZVTEJpdlhDcmhiY1o0U21zUEhYMGx2Q0xMWDZoaVNxajlO?=
 =?utf-8?B?cmt2MnhZRUcvWUY5MWV3RlA4VERLYlh5eS96NTJaSDdBQ0hQMzM5TEFlRWF0?=
 =?utf-8?B?ZG5peitFaFlLRG5sTWExSjBwcU5NcFE4b1A3RFBhTjRSTjJOSlJreXFnWFd5?=
 =?utf-8?B?SGh4NjJrNndjbytYVGJJSFByZzl4cFR5RUxCSExNTUhQdGxVaENxaFVlbUpB?=
 =?utf-8?B?anFsV2pWc2huZDR2bUc0T3Z2NzY1cy9pQzMwMDI2djhsVElrSE1lZFZ2WmEz?=
 =?utf-8?B?ZlBISUNaeUU5QkRhUlgwLzFsUEZqTnlJMnpWMEY0Z1dxVEhEMjZycGx1U0RR?=
 =?utf-8?B?V2RZZmFhNjB5cEp6UUg2My9rU2txbVdxZzRMWXlLZU5oYTd6NWlrWXJxdDJ1?=
 =?utf-8?B?Rm9ZRnduZG1laW90WE16M252S2FSamRWbEdmS1pKaytTOXlRWDUyNzJmb1VY?=
 =?utf-8?B?c1QxNExtV0YyZldpQUEvYi9iWUxEREd3SFQ4WExDLy9uRWNZSW9MbWNFRmt2?=
 =?utf-8?B?VVh3WktYdUllRFBkSFdLUnVyWjkzVHhJcHNDY0w1WWJWTm9Gb1k0VFRBVm1t?=
 =?utf-8?B?c0w5dUxYOXFOUXpRNjBxUHNOQWh5WGlSbEE3WEMyYWRzRklXdG1laXRIK3N6?=
 =?utf-8?B?Q295ZGl1WDJGSlRHSTJQcmRNUDE2Y1N5cS82WTFac2orWGRKUEdlN2E5L01y?=
 =?utf-8?B?S2ZLMm4wdjAybkEvTE5zUmJOWkkwcVZNaThZcGxMTHVoWFZnSkhHU2Q5aVpG?=
 =?utf-8?B?LzdDdjIvbXRvTGNtcGx2MjdjY3JiSVowdjhoTVlUeTVQa3BHL2pTZkRoT0po?=
 =?utf-8?B?MDBvTjdHam5ieU5acytQM0hjc2lLbjQreU5qWXlZL29rbzJla2NlMDVNbmFI?=
 =?utf-8?B?d3lybFJlTVFnOGlwTTdYbitLTHJKN01CaFIzcVk2bFY1ZitCMkpFSDhxTmRa?=
 =?utf-8?B?SEVoTTR2WXUvZjlIWUJwUGpMMVhITmlCWWRNSEtTb1BvUTZpbERQTmlCaVdw?=
 =?utf-8?Q?N9RqSX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 11:11:38.5406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b02dd0-3525-4675-9820-08dd77574c83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6311

On Wed Apr 9, 2025 at 7:48 AM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>>=20
>> Add a container for the "cooked" command line for a domain. This
>> provides for the backing memory to be directly associated with the
>> domain being constructed.  This is done in anticipation that the domain
>> construction path may need to be invoked multiple times, thus ensuring
>> each instance had a distinct memory allocation.
>>=20
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
>> ---
>> No changes on ACPI cmdline handling on PVH, as it's orthogonal to the
>> purpose of this patch.
>>=20
>> v3:
>>   * s/xfree/XFREE/ on failed construct_dom0() to avoid a dangling
>> cmdline ptr.
>>   * Re-flow hvm_copy_to_guest_phys() into a multi-line call.
>>   * s/bd->cmdline !=3D NULL/b->cmdline/ (to homogenise with the previous
>>     cmdline pointer check)
>> ---
>>  xen/arch/x86/hvm/dom0_build.c          | 12 +++----
>>  xen/arch/x86/include/asm/boot-domain.h |  1 +
>>  xen/arch/x86/pv/dom0_build.c           |  4 +--
>>  xen/arch/x86/setup.c                   | 50 +++++++++++++++++++-------
>>  4 files changed, 47 insertions(+), 20 deletions(-)
>>=20
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build=
.c
>> index 2a094b3145..ebad5a49b8 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -653,7 +653,6 @@ static int __init pvh_load_kernel(
>>      void *image_start =3D image_base + image->headroom;
>>      unsigned long image_len =3D image->size;
>>      unsigned long initrd_len =3D initrd ? initrd->size : 0;
>> -    const char *cmdline =3D image->cmdline_pa ? __va(image->cmdline_pa)=
 : NULL;
>>      const char *initrd_cmdline =3D NULL;
>>      struct elf_binary elf;
>>      struct elf_dom_parms parms;
>> @@ -736,8 +735,8 @@ static int __init pvh_load_kernel(
>>              initrd =3D NULL;
>>      }
>> =20
>> -    if ( cmdline )
>> -        extra_space +=3D elf_round_up(&elf, strlen(cmdline) + 1);
>> +    if ( bd->cmdline )
>> +        extra_space +=3D elf_round_up(&elf, strlen(bd->cmdline) + 1);
>> =20
>>      last_addr =3D find_memory(d, &elf, extra_space);
>>      if ( last_addr =3D=3D INVALID_PADDR )
>> @@ -778,9 +777,10 @@ static int __init pvh_load_kernel(
>>      /* Free temporary buffers. */
>>      free_boot_modules();
>> =20
>> -    if ( cmdline !=3D NULL )
>> +    if ( bd->cmdline )
>>      {
>> -        rc =3D hvm_copy_to_guest_phys(last_addr, cmdline, strlen(cmdlin=
e) + 1, v);
>> +        rc =3D hvm_copy_to_guest_phys(last_addr, bd->cmdline,
>> +                                    strlen(bd->cmdline) + 1, v);
>>          if ( rc )
>>          {
>>              printk("Unable to copy guest command line\n");
>> @@ -791,7 +791,7 @@ static int __init pvh_load_kernel(
>>           * Round up to 32/64 bits (depending on the guest kernel bitnes=
s) so
>>           * the modlist/start_info is aligned.
>>           */
>> -        last_addr +=3D elf_round_up(&elf, strlen(cmdline) + 1);
>> +        last_addr +=3D elf_round_up(&elf, strlen(bd->cmdline) + 1);
>>      }
>>      if ( initrd !=3D NULL )
>>      {
>
> Perhaps better introduce a local variable cmdline_len? That would allow t=
he first
> if() to go away (but of course not its body).

I'd agree if the function body was smaller, but it has 16 locals
already. It's already quite hard to know what's going on, so I'd rather
not make the situation worse.

>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -978,10 +978,30 @@ static unsigned int __init copy_bios_e820(struct e=
820entry *map, unsigned int li
>>      return n;
>>  }
>> =20
>> -static struct domain *__init create_dom0(struct boot_info *bi)
>> +static size_t __init domain_cmdline_size(
>> +    struct boot_info *bi, struct boot_domain *bd)
>
> const for both? And perhaps s/domain/dom0/ in the function name?
>
>>  {
>> -    static char __initdata cmdline[MAX_GUEST_CMDLINE];
>> +    size_t s =3D bi->kextra ? strlen(bi->kextra) : 0;
>> +
>> +    s +=3D bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)=
) : 0;
>> =20
>> +    if ( s =3D=3D 0 )
>> +        return s;
>
> While this retains prior behavior, that prior behavior was certainly odd =
(and
> pretty likely not meant to be like that).

What part of it? How would you propose it to behave? Do you mean that if
no cmdline is passed some ought to be allocated in case we want to
override it?

Either way, such a functional change is better suited for a different
patch that does just that, plus properly handling the acpi adjustments
for PVH dom0.

>
>> @@ -1043,17 +1067,19 @@ static struct domain *__init create_dom0(struct =
boot_info *bi)
>> =20
>>          if ( (strlen(acpi_param) !=3D 0) && !strstr(cmdline, "acpi=3D")=
 )
>>          {
>> -            safe_strcat(cmdline, " acpi=3D");
>> -            safe_strcat(cmdline, acpi_param);
>> +            strlcat(cmdline, " acpi=3D", cmdline_size);
>> +            strlcat(cmdline, acpi_param, cmdline_size);
>>          }
>> -
>> -        bd->kernel->cmdline_pa =3D __pa(cmdline);
>> +        bd->kernel->cmdline_pa =3D 0;
>> +        bd->cmdline =3D cmdline;
>>      }
>> =20
>>      bd->d =3D d;
>>      if ( construct_dom0(bd) !=3D 0 )
>>          panic("Could not construct domain 0\n");
>> =20
>> +    XFREE(cmdline);
>
> While this tidies the local variable, what about bd->cmdline? As it stand=
s this
> gives the impression that you're freeing a pointer here which may still b=
e used
> through passing bd elsewhere.

That ought to have been bd->cmdline indeed.

>
> Jan

Cheers,
Alejandro

