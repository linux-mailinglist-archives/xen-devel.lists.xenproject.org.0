Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF0B0C30C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 13:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051402.1419734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udols-00037S-Uf; Mon, 21 Jul 2025 11:33:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051402.1419734; Mon, 21 Jul 2025 11:33:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udols-00035G-RT; Mon, 21 Jul 2025 11:33:28 +0000
Received: by outflank-mailman (input) for mailman id 1051402;
 Mon, 21 Jul 2025 11:33:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1C3=2C=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1udolq-000355-BG
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 11:33:26 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fa52453-6626-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 13:33:19 +0200 (CEST)
Received: from CH5P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::27)
 by IA0PR12MB8325.namprd12.prod.outlook.com (2603:10b6:208:407::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:33:14 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:1ef:cafe::3) by CH5P220CA0013.outlook.office365.com
 (2603:10b6:610:1ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:33:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.1 via Frontend Transport; Mon, 21 Jul 2025 11:33:14 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 06:33:11 -0500
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
X-Inumbo-ID: 7fa52453-6626-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ng78XKHJW0dRys2GF9VhRY1ociLhBtKJ5LocoolNS38Q3nzxOqd8z3V+NccYfdITTeVVnMqK5rTDYBMYUOwm901P+wMO4R3dmcpv3+fbFCMCG4hgv8tWbBbOzPh/4YtIw1aJpFq00oByH/a6dgHPWRyU3NvsnqE5C9U2ClbMrwqucS0IvBPDe3W6ZDVAP98jafGqYTamrkxpS0jgq/jPZgsbBRO9o3zyJyRQOCmQ34pPgFXNMqxwhFk/BiYQxOKuQEWz/Kq9oHGFfmq86X24SYCtFN8t7ZqpZSYRYEtvvcyygBA/r8ZphwDWus4hXT9qGp8NUln8q7oxscHC/Okzug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ndRMV9Bynfx2VKJdqzISeX41C/VJBhFQHVHcSmN7H2g=;
 b=WTfxtRpqgJZVsHrs5FAJNzwwNrrOpEgBwiWyIBsXfe4Cw7ZJ7jq5WGVpdv55YHRIjRKdbLDmGHuDwjBh72U00tQxhAefg7W8OvdGwDcA4riaZO5pdQKM0TKqf9OMXKuDFXyJM2aJI/xEbDrK7yQ+OUTfpAqK+2+v4j1ORObjXPun+mim1Wm0JQmUqCfg95w6Oa1zYVl0dGzLBlytsVBqd8nQw0qEo0fc7ZFpfIz2zRqXGhxWaEUoy0YJcQ5eFZvljfJXpgpdBiAcmjdM36inzbSSKQ/CAJY20jM3M9MMsO2SrBYCuYAWYmueFgXQOvm8vQj1bRak2AoYG8vJVVMfuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=proton.me smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ndRMV9Bynfx2VKJdqzISeX41C/VJBhFQHVHcSmN7H2g=;
 b=4sUnUfgSW7LOTvsJVtQvLRzIrwxzuVYM1Fs4ZIM9chiKAvFktevC04aGNr1aj++h1M1q8QIc6+7s5NiDLGoTDvSDLu76f2Tt47bYYPIoOjFehoCXgZY+VslsIsX5dNergVwcAwOEngIdz48HCqI/tKVCeSOPV1iiqXit7UtdfbY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 21 Jul 2025 13:33:10 +0200
Message-ID: <DBHP8AWVAUZ0.J5GLOUXW1C3J@amd.com>
CC: <dmukhin@ford.com>, <xen-devel@lists.xenproject.org>,
	<andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<jbeulich@suse.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>, Xen-devel
	<xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH v8] xen/console: introduce domain_console struct
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250716020447.1029992-1-dmukhin@ford.com>
 <DBF4R1PG1FZP.13QERUGFTBZY0@amd.com> <aHrckaPuf8S6VK8n@kraken>
In-Reply-To: <aHrckaPuf8S6VK8n@kraken>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|IA0PR12MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: b443dbb1-9480-4342-b65b-08ddc84a6191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmR5UVBnM0VrWDZZYS9WaGhNYThpaHhXODBuT2pwRGNXVXpkc3pPOXdMVmNP?=
 =?utf-8?B?R01OV0JLT0V5UG5tYnlZdktGallacGRjWXRLZjhvOUlkVFlZdE5SaSt5Umpt?=
 =?utf-8?B?elk2UmtRSGVUdXZKVUFubWd0Y0JVQ090Nm1IRkRldFBrOHVhUVFTYld0TU04?=
 =?utf-8?B?cTUwN2VsSWwwVndWZTVzWll3SkFhT25GVThEcVU1elcwNjlhZS9pc25odXVN?=
 =?utf-8?B?b2lDUC9jbjdFZTduYmVCcGJPWkxHTElBaVI5aXBsQmZNbXJxaVIxbFROcVpm?=
 =?utf-8?B?UzFrZUhwSTEyMjhpZVZhWnhuZGhHZUY1K09Zc0k4eUxhUGJaR2JjZHZOb3d4?=
 =?utf-8?B?RTV3MnV3RjRnN2Q1Si9oSmZSL0Yxa0dUcUtBbWl5d0FHRG1zZktxcUY3WG9G?=
 =?utf-8?B?Wi9YaThidzY4OXZvaFA3ajFiUFUxSlNLNUJWakpjQm1BTkNYeXdjTEFyMjNO?=
 =?utf-8?B?N0Jqa040QkpwcVpNblhDY3hWNDFhSzFUS3htTDQxVkRkZ1BZWWpBL2t5NHN1?=
 =?utf-8?B?ZHZSZkRKeG1qcG1KVWVIVkdNVUg4dE1IUjNFZTVtQUZMZWhHNnkxemxsUWlv?=
 =?utf-8?B?WmpCd2lLVjU4Y1NQRnJ5bm1tTGdhakdIN3Q5U1g5Nm1NaklmUTJUaHdFejJH?=
 =?utf-8?B?bWZsYXp5S3NDYjZjbUZpT092Mk41MWdWMnAwNkRySDZQUzBZQ1QxRUpPKzdH?=
 =?utf-8?B?djdIcWdvVVI1WUI4Uzc3SFVmK2hseEJsV29xUE5TaXhsQW05SCs1ZVpnZENv?=
 =?utf-8?B?K3BjWTB1WElnSU5FZXltenRDTkEwN3RYTVFMYU9hT3Q4R2VKUjVKM012V0hV?=
 =?utf-8?B?YytpYVN2N29UdTk5b0FmWEhKOVV2VDJ3ZitCaDhNZUJmUWo4VlNFTyt1anVa?=
 =?utf-8?B?MFlCdjFiMEs0U1U5aE95b2Vkcm1rYVJ1cTBQWWRGYmxBZ2twbnpKQ0R2aVph?=
 =?utf-8?B?SVE0clhja1p2YVJNMUhrakVyV1o5VCs0cFVDdFp0UXBhd0R2SUlNMWUraGJm?=
 =?utf-8?B?U3piNHA5OWlFUUJLNys3bnBxUmxZZU1zaXk3TE1JRkVMazRKcVFud25MYWhG?=
 =?utf-8?B?bDdCNVoxZUhzZWg1cUY4NjBrMmN4VnV4L2x3b25kZDFDcHE3U0M1NW41YXFu?=
 =?utf-8?B?L3RBaUQzemxocmJycnVibUJJWEt4S3krN0lrUlV3ZE0xMHVpUXFxd3FpSFUy?=
 =?utf-8?B?QngvYU1YYXVMWk1Qd2pGUTA0NW1PVy8vdHZtVC96QVJiQ2JYY0s5Ulo0NnBD?=
 =?utf-8?B?TTNHVWhKUGFFakpxY1JpK3lBUVUrUmtaY2E1UFJXUFNEV3RiWFE4eFlaNVpE?=
 =?utf-8?B?VDhQZGRLeUIwaUltYm5qaDQ2Tk1VK25PNEhMM1laQ3RpbjFnWU5rN0I3OFNC?=
 =?utf-8?B?Vno1NmR2am5JcTdvY3RTK2d4eXAxMWFDcTdEdWNDcTZVdEp5MFV3ZDZHL2dw?=
 =?utf-8?B?eTU2bjhKeHB0b1ZTYjFKTUs2dnlFU215eENLU3E1YVJRZ1VBZTNzSGMvUmNU?=
 =?utf-8?B?MEVPQTdLMXZxZGQ4OS9pZkEyK09zcnpXenlCWXIzcEU0eElmckRsT2RiOUk0?=
 =?utf-8?B?MDNaVndQR2lZUXNvWGFOUnlNb0lPWlFqaTZnVFp6REtJTmJWZlNpUGJzMFNw?=
 =?utf-8?B?OUxQWUR0c2NPMEtaSG45cW5NdDJtdDV0U0ZVMHlrWmh6Z3IxY0lFQnE1SGl6?=
 =?utf-8?B?c0xmRXNEZkY2OHRvYnZQTW43clYrZEsyckFqbGZGbTMxcE12dkVMb1Uzekw5?=
 =?utf-8?B?VWM0YVJvVzdUVXFrMU1FNG1XQUFtRGpyQjI1OW9zNTJ0WkN1bFM5WlFWRFda?=
 =?utf-8?B?bjhqY29Fa1VabnZMMkJHOVZmSTZpVXpqNnVGWGNDcGwxOFdneUYzMWdncDJy?=
 =?utf-8?B?NDE0Sm41b2sraHlOMjFITFlJWCtQQXdTalZEUVdjWUljeXlaMnNJSFppUnls?=
 =?utf-8?B?M0hSV2pmeUxJaC8yUXFmNW12b0xwUVZXYmp2c1RqRVUvcGpIWHp1RStqcXp4?=
 =?utf-8?B?NjZuUmtjUVVPZU90ejVHTVBiRXk2R1FVa3NVSVJpM2hHL094bSsxNEV1R2JG?=
 =?utf-8?Q?OnnBE1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:33:14.5986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b443dbb1-9480-4342-b65b-08ddc84a6191
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8325

On Sat Jul 19, 2025 at 1:45 AM CEST, dmkhn wrote:
> On Fri, Jul 18, 2025 at 01:04:56PM +0200, Alejandro Vallejo wrote:
>> Hi,
>>=20
>> I like the new encapsulation, but I have a few questions.
>>=20
>> On Wed Jul 16, 2025 at 4:04 AM CEST, dmukhin wrote:
>> > From: Denis Mukhin <dmukhin@ford.com>
>> >
>> > Introduce domain_console for grouping data structures used for integra=
ting
>> > domain's diagnostic console with Xen's console driver.
>> >
>> > Group all pbuf-related data structures under domain_console. Rename th=
e moved
>> > fields to plain .buf, .idx and .lock names, since all uses of the fiel=
ds are
>> > touched.
>> >
>> > Bump the domain console buffer allocation size to 256. No extra symbol=
 for the
>> > value since it is used only once during data structure declaration. Al=
l size
>> > checks use ARRAY_SIZE().
>> >
>> > Allocate domain_console from the heap so that the parent domain struct=
 size
>> > stays below PAGE_SIZE boundary to account for more console-related fie=
lds
>> > added in the future.
>> >
>> > Finally, update the domain_console allocation and initialization code.
>> >
>> > No functional change.
>> >
>> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> > ---
>> > Changes since v7:
>> > - use ARRAY_SIZE() for cons->buf checks
>> > - update the commit message
>> > ---
>> >  xen/arch/arm/vpl011.c      |  2 +-
>> >  xen/arch/x86/hvm/hvm.c     | 18 ++++++++++--------
>> >  xen/arch/x86/pv/shim.c     |  2 +-
>> >  xen/common/domain.c        | 19 +++++++++----------
>> >  xen/drivers/char/console.c | 21 +++++++++++----------
>> >  xen/include/xen/sched.h    | 22 ++++++++++++----------
>> >  6 files changed, 44 insertions(+), 40 deletions(-)
>> >
>> > diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
>> > index 480fc664fc62..d0d17c76b72c 100644
>> > --- a/xen/arch/arm/vpl011.c
>> > +++ b/xen/arch/arm/vpl011.c
>> > @@ -713,7 +713,7 @@ int domain_vpl011_init(struct domain *d, struct vp=
l011_init_info *info)
>> >      }
>> >      else
>> >      {
>> > -        d->console.input_allowed =3D true;
>> > +        d->console->input_allowed =3D true;
>> >          vpl011->backend_in_domain =3D false;
>> >
>> >          vpl011->backend.xen =3D xzalloc(struct vpl011_xen_backend);
>> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
>> > index 56c7de39778b..684d2c0c195c 100644
>> > --- a/xen/arch/x86/hvm/hvm.c
>> > +++ b/xen/arch/x86/hvm/hvm.c
>> > @@ -559,7 +559,8 @@ void hvm_do_resume(struct vcpu *v)
>> >  static int cf_check hvm_print_line(
>> >      int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>> >  {
>> > -    struct domain *cd =3D current->domain;
>> > +    const struct domain *d =3D current->domain;
>> > +    struct domain_console *cons =3D d->console;
>> >      char c =3D *val;
>> >
>> >      ASSERT(bytes =3D=3D 1 && port =3D=3D XEN_HVM_DEBUGCONS_IOPORT);
>> > @@ -571,16 +572,17 @@ static int cf_check hvm_print_line(
>> >      if ( !is_console_printable(c) )
>> >          return X86EMUL_OKAY;
>> >
>> > -    spin_lock(&cd->pbuf_lock);
>> > +    spin_lock(&cons->lock);
>> > +    ASSERT(cons->idx < ARRAY_SIZE(cons->buf));
>> >      if ( c !=3D '\n' )
>> > -        cd->pbuf[cd->pbuf_idx++] =3D c;
>> > -    if ( (cd->pbuf_idx =3D=3D (DOMAIN_PBUF_SIZE - 1)) || (c =3D=3D '\=
n') )
>> > +        cons->buf[cons->idx++] =3D c;
>> > +    if ( (cons->idx =3D=3D (ARRAY_SIZE(cons->buf) - 1)) || (c =3D=3D =
'\n') )
>> >      {
>> > -        cd->pbuf[cd->pbuf_idx] =3D '\0';
>> > -        guest_printk(cd, XENLOG_G_DEBUG "%s\n", cd->pbuf);
>> > -        cd->pbuf_idx =3D 0;
>> > +        cons->buf[cons->idx] =3D '\0';
>> > +        guest_printk(d, XENLOG_G_DEBUG "%s\n", cons->buf);
>> > +        cons->idx =3D 0;
>> >      }
>> > -    spin_unlock(&cd->pbuf_lock);
>> > +    spin_unlock(&cons->lock);
>> >
>> >      return X86EMUL_OKAY;
>> >  }
>> > diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
>> > index bc2a7dd5fae5..bd29c53a2d34 100644
>> > --- a/xen/arch/x86/pv/shim.c
>> > +++ b/xen/arch/x86/pv/shim.c
>> > @@ -239,7 +239,7 @@ void __init pv_shim_setup_dom(struct domain *d, l4=
_pgentry_t *l4start,
>> >       */
>> >      d->max_pages =3D domain_tot_pages(d);
>> >
>> > -    d->console.input_allowed =3D true;
>> > +    d->console->input_allowed =3D true;
>> >  }
>> >
>> >  static void write_start_info(struct domain *d)
>> > diff --git a/xen/common/domain.c b/xen/common/domain.c
>> > index 303c338ef293..caef4cc8d649 100644
>> > --- a/xen/common/domain.c
>> > +++ b/xen/common/domain.c
>> > @@ -669,7 +669,7 @@ static void _domain_destroy(struct domain *d)
>> >      BUG_ON(!d->is_dying);
>> >      BUG_ON(atomic_read(&d->refcnt) !=3D DOMAIN_DESTROYED);
>> >
>> > -    xfree(d->pbuf);
>> > +    xvfree(d->console);
>>=20
>> XVFREE() to avoid a dangling pointer. But look at the end. I'd just remo=
ve the
>> pointer altogether.
>>=20
>> >
>> >      argo_destroy(d);
>> >
>> > @@ -835,8 +835,6 @@ struct domain *domain_create(domid_t domid,
>> >          flags |=3D CDF_hardware;
>> >          if ( old_hwdom )
>> >              old_hwdom->cdf &=3D ~CDF_hardware;
>> > -
>> > -        d->console.input_allowed =3D true;
>> >      }
>> >
>> >      /* Holding CDF_* internal flags. */
>> > @@ -866,8 +864,6 @@ struct domain *domain_create(domid_t domid,
>> >      spin_lock_init(&d->shutdown_lock);
>> >      d->shutdown_code =3D SHUTDOWN_CODE_INVALID;
>> >
>> > -    spin_lock_init(&d->pbuf_lock);
>> > -
>> >      rwlock_init(&d->vnuma_rwlock);
>> >
>> >  #ifdef CONFIG_HAS_PCI
>> > @@ -877,6 +873,14 @@ struct domain *domain_create(domid_t domid,
>> >
>> >      /* All error paths can depend on the above setup. */
>> >
>> > +    err =3D -ENOMEM;
>> > +    d->console =3D xvzalloc(typeof(*d->console));
>> > +    if ( !d->console )
>> > +        goto fail;
>> > +
>> > +    spin_lock_init(&d->console->lock);
>> > +    d->console->input_allowed =3D is_hardware_domain(d);
>> > +
>> >      /*
>> >       * Allocate d->vcpu[] and set ->max_vcpus up early.  Various per-=
domain
>> >       * resources want to be sized based on max_vcpus.
>> > @@ -959,11 +963,6 @@ struct domain *domain_create(domid_t domid,
>> >      if ( (err =3D argo_init(d)) !=3D 0 )
>> >          goto fail;
>> >
>> > -    err =3D -ENOMEM;
>> > -    d->pbuf =3D xzalloc_array(char, DOMAIN_PBUF_SIZE);
>> > -    if ( !d->pbuf )
>> > -        goto fail;
>> > -
>> >      if ( (err =3D sched_init_domain(d, config->cpupool_id)) !=3D 0 )
>> >          goto fail;
>> >
>> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
>> > index ba5a809a99fb..b0d50a910e27 100644
>> > --- a/xen/drivers/char/console.c
>> > +++ b/xen/drivers/char/console.c
>> > @@ -521,7 +521,7 @@ struct domain *console_get_domain(void)
>> >      if ( !d )
>> >          return NULL;
>> >
>> > -    if ( d->console.input_allowed )
>> > +    if ( d->console->input_allowed )
>> >          return d;
>> >
>> >      rcu_unlock_domain(d);
>> > @@ -564,7 +564,7 @@ static void console_switch_input(void)
>> >          {
>> >              rcu_unlock_domain(d);
>> >
>> > -            if ( !d->console.input_allowed )
>> > +            if ( !d->console->input_allowed )
>> >                  continue;
>> >
>> >              console_rx =3D next_rx;
>> > @@ -744,6 +744,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_P=
ARAM(char) buffer,
>> >          else
>> >          {
>> >              char *kin =3D kbuf, *kout =3D kbuf, c;
>> > +            struct domain_console *cons =3D cd->console;
>> >
>> >              /* Strip non-printable characters */
>> >              do
>> > @@ -756,22 +757,22 @@ static long guest_console_write(XEN_GUEST_HANDLE=
_PARAM(char) buffer,
>> >              } while ( --kcount > 0 );
>> >
>> >              *kout =3D '\0';
>> > -            spin_lock(&cd->pbuf_lock);
>> > +            spin_lock(&cons->lock);
>> >              kcount =3D kin - kbuf;
>> >              if ( c !=3D '\n' &&
>> > -                 (cd->pbuf_idx + (kout - kbuf) < (DOMAIN_PBUF_SIZE - =
1)) )
>> > +                 (cons->idx + (kout - kbuf) < (ARRAY_SIZE(cons->buf) =
- 1)) )
>> >              {
>> >                  /* buffer the output until a newline */
>> > -                memcpy(cd->pbuf + cd->pbuf_idx, kbuf, kout - kbuf);
>> > -                cd->pbuf_idx +=3D (kout - kbuf);
>> > +                memcpy(cons->buf + cons->idx, kbuf, kout - kbuf);
>> > +                cons->idx +=3D kout - kbuf;
>> >              }
>> >              else
>> >              {
>> > -                cd->pbuf[cd->pbuf_idx] =3D '\0';
>> > -                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cd->pbuf, k=
buf);
>> > -                cd->pbuf_idx =3D 0;
>> > +                cons->buf[cons->idx] =3D '\0';
>> > +                guest_printk(cd, XENLOG_G_DEBUG "%s%s\n", cons->buf, =
kbuf);
>> > +                cons->idx =3D 0;
>> >              }
>> > -            spin_unlock(&cd->pbuf_lock);
>> > +            spin_unlock(&cons->lock);
>> >          }
>> >
>> >          guest_handle_add_offset(buffer, kcount);
>> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> > index fe53d4fab7ba..f7bb44328bbc 100644
>> > --- a/xen/include/xen/sched.h
>> > +++ b/xen/include/xen/sched.h
>> > @@ -371,6 +371,17 @@ struct evtchn_port_ops;
>> >
>> >  #define MAX_NR_IOREQ_SERVERS 8
>> >
>> > +/* Domain console settings. */
>> > +struct domain_console {
>> > +    /* Permission to take ownership of the physical console input. */
>> > +    bool input_allowed;
>> > +
>> > +    /* hvm_print_line() and guest_console_write() logging. */
>> > +    unsigned int idx;
>> > +    spinlock_t lock;
>> > +    char buf[256];
>>=20
>> I'd rather see things a bit shuffled. Like:
>>=20
>>       /* hvm_print_line() and guest_console_write() logging. */
>>       spinlock_t lock;
>>       unsigned int idx;
>>       char buf[255];
>>=20
>>       /* Permission to take ownership of the physical console input. */
>>       bool input_allowed;
>>=20
>> That way the struct is fully packed (note the s/256/255/) and input_allo=
wed
>> remains visually away from the other group of fields.
>> input_allowed remains away from the lock, indicating that input_allowed
>>=20
>> Note that the lock is 64bit aligned when CONFIG_DEBUG_LOCK_PROFILE is se=
t.
>>=20
>> Thoughts?
>
> I can do that, no problem!
>
>>=20
>> > +};
>> > +
>> >  struct domain
>> >  {
>> >      domid_t          domain_id;
>> > @@ -562,12 +573,6 @@ struct domain
>> >      /* Control-plane tools handle for this domain. */
>> >      xen_domain_handle_t handle;
>> >
>> > -    /* hvm_print_line() and guest_console_write() logging. */
>> > -#define DOMAIN_PBUF_SIZE 200
>> > -    char       *pbuf;
>> > -    unsigned int pbuf_idx;
>> > -    spinlock_t  pbuf_lock;
>> > -
>> >      /* OProfile support. */
>> >      struct xenoprof *xenoprof;
>> >
>> > @@ -653,10 +658,7 @@ struct domain
>> >  #endif
>> >
>> >      /* Console settings. */
>> > -    struct {
>> > -        /* Permission to take ownership of the physical console input=
. */
>> > -        bool input_allowed;
>> > -    } console;
>> > +    struct domain_console *console;
>>=20
>> Why a pointer? domain_console is a fixed-size type, so unless the domain=
 is
>> overflowing PAGE_SIZE (which we very definitely don't want either) I'd c=
onsider
>> making it a regular member Simplifies memory management too. No alloc/fr=
ee nor
>> potential dangling pointers.
>
> domain_console may grow in the future wrt console focus and further vUART
> management changes, that's why I moved the entire stuct to be heap-alloca=
ted.
>
> Let me redo that.

Actually, don't. Thinking some more about it, this is confidential data we'=
ll
want out for ASI, so it's easier to spot if it's still a x*alloc'ed.

nvm about it. Sorry for the headache!

Cheers,
Alejandro

