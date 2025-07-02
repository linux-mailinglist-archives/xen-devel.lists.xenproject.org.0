Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB680AF5D36
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 17:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031381.1405204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWzTs-0007kq-Jz; Wed, 02 Jul 2025 15:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031381.1405204; Wed, 02 Jul 2025 15:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWzTs-0007j8-GW; Wed, 02 Jul 2025 15:34:40 +0000
Received: by outflank-mailman (input) for mailman id 1031381;
 Wed, 02 Jul 2025 15:34:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWS=ZP=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uWzTr-0007j2-77
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 15:34:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2415::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ec621d0-575a-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 17:34:36 +0200 (CEST)
Received: from BN9PR03CA0642.namprd03.prod.outlook.com (2603:10b6:408:13b::17)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Wed, 2 Jul
 2025 15:34:28 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:408:13b:cafe::93) by BN9PR03CA0642.outlook.office365.com
 (2603:10b6:408:13b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:34:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 15:34:28 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:34:26 -0500
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
X-Inumbo-ID: 0ec621d0-575a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3jlFjQ2Y/1zdEJyqBUa3RG8/B1hj9VVHxLfpkBY9ypla2Q9Q36clCW2AXhul6zVcnaGFeX7qgKP3NeFGOfWhPusxNCwN8vvhvpSoNhT4hgTLO2t8nhSt+WY1X1y+gz4/VfBMAh5VV4TaQMLMnV7JGMIgqdYgsJSul6Q+PeiXjn1m944IzL4r3Wpk+xI6XtHLX49LqD7sLIjixomU0yfLfp55KLTBVlQ1ewGq8doE6yIdCOTEVT7kH7LoV7d4EURuX0+Ft6zoVReN8eZsfYWS1EgNmAevYQei9/EVEN3n6faTlxI3nnQQ5olcyE9jFlK1zHPE7wXrLRI0jqqdmRjoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dn3hO8LX71zy2xYPp9ADu7eaEZzF5NRLCxjhkWrPAZQ=;
 b=pBWKNZ43FuNmXnAfFlCDxLTXcXKkS9qOU2Axb2tATX2TyB9/oBvdJDrTQ34AEWxscchN+lnt6yHtvvh7Fp5Qh0PjTuQ0D7Uhe7nt/ofOBujm0jCanGWnkAAf85dQgFvwVusfwoIPuofSyh9TxCNWI2YS947ifTdpradXOk/UPRBMXbCFOaBZe0g2tUFs8etxbDZYU4bHQ52WYvZDXUPfFTjhAxCrT8tAhcZX774wrHGLW/7FoZJELVI+kKwQwUu6dEsnjsjCW1IfovYFweXF/IW2KfSRZwR0jO8Jk6sqHyiBLSvw8ORK9dCHPiKatoZR3bNghoxy2uTOwK7sORypbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dn3hO8LX71zy2xYPp9ADu7eaEZzF5NRLCxjhkWrPAZQ=;
 b=waqNq/rd92yqHLIq6SUth3XOz+YnaCNfS0nAj1H58jlHktc09rezxfAV0hHZOyO683w9ex+UpCCEs239LYwPt1H3hthT/Yg2yct/u3rNsE13C7Z75TPnHaTq5Z+mEFKKWknw0/VFPEMBGzT+b+sYS0K7oCCRPLeIE/vhavTqbxY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 2 Jul 2025 17:34:24 +0200
Message-ID: <DB1OGNLX29US.Z8UCST2IR3VI@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jason Andryuk
	<jandryuk@gmail.com>, Bertrand Marquis <bertrand.marquis@arm.com>, "Michal
 Orzel" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>, Daniel Smith
	<dpsmith@apertussolutions.com>
Subject: Re: [PATCH v5 03/10] x86: Replace arch-specific boot_domain with
 the common one
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-4-agarciav@amd.com>
 <0a4196db-dfc8-4259-bfef-e62cf3fe17d1@suse.com>
 <DB1NXDYYSE3Y.1OWV3AS1TYRLA@amd.com>
 <2a7dab07-9e52-4d4a-a80d-99229c9fe093@suse.com>
In-Reply-To: <2a7dab07-9e52-4d4a-a80d-99229c9fe093@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 6507cf93-1974-4011-adaf-08ddb97deebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1BEZyszWnZ4bi9UWGtic1FYM2tWOW5GdE5JOEZiYS9ZM0kvUURPVVJqQ0Vy?=
 =?utf-8?B?UVh3TnA0MC94NVdrUjQxazVXWGpVc0QwM1lLR01ZSVZFRmUvSzFxUGd2REZz?=
 =?utf-8?B?Z2hNUmZaK1pUYnBhbUs2cGhOQXlhanlyWlhKMG9lQnh2Zk9KRmtFM2syZVcz?=
 =?utf-8?B?VWFnZmtPQm5LV3RwbVR1bG9tUThpR2JydkFadDZwVW1TQXg5S1lEZ3RxVHZu?=
 =?utf-8?B?WWhUU054NWtXRjh4SUNaY0ZvbTQ0cXVFVllTS1grQ1U4MEk1THNRYmFHdFBh?=
 =?utf-8?B?ZWsvalNvV1doQ29yZHdqUkFUL25QcVIyeFkrVXFvK2c0VmlPNEtVVTZONE9x?=
 =?utf-8?B?SFl3MWpJMS9EUmVLRmh1QjFNRVQrZUZmbjl4WW8vNjBMZlIxK1g3Z3RtNGtZ?=
 =?utf-8?B?WmJKZDFjeGc1emxIc3U3dUhNK05sWHZjamVmRWtmeUZianBaRi9MQis2WWJu?=
 =?utf-8?B?aVNFaW5VUStqMlRLM2xPOC91dG16M0dIMFVTcmd1VHg1VTZheUthUVVtZXpO?=
 =?utf-8?B?ejEvcE1LckxlSFhrcTF6c21vSE10amV3SEZ5ZGl4Yk4rWEc2TWhvdG5sR1ZF?=
 =?utf-8?B?OW5RRlN5NXduWXBlQnhhUm5SRjlQRVpYd0drc0RQR0RVbDQ1blQ4Yk9jWGsy?=
 =?utf-8?B?UnJCTlAwSE9zdmo5Z3VibEQ0d2hiaUVQTitxQ1RvdmFDMlNOVHFHZGY5UVhq?=
 =?utf-8?B?Q1JtK2lLMkkyUFZxaE9OMmxCamtmOUFGUVpyM1hEeEthRjNsT2JXc1VuZ2lr?=
 =?utf-8?B?VmJUZk0yR2lFNVVpamhsQkxiaXVucU01UHNLWmJTVzBWSjdaaUhZQnlPSWll?=
 =?utf-8?B?TEttK2dUTmNkeit1QTl1aVB1Tjh1cnFoWHllZ3o4aTFQK1NJZ2x1UVZJOGxV?=
 =?utf-8?B?QitBTjZSeUJ6UG5LRGw0ZFF5U3lvN0tzV0ZmZGhicmhydnRzbGUrbS82ZlVO?=
 =?utf-8?B?bHR2WlBFbUZpaXRmcUZaSmtISEF2Y3I5QU5DWkVoMGVKSWR1eEdYOVF3S21L?=
 =?utf-8?B?WkNXZUhGb1oxeEppZnAwSHlOS0RnbmhOTHcwcDdUOFV0SlRPb1BKNjlkbUc5?=
 =?utf-8?B?UHVNS2J1QTlIUkc2ejhLZVpxTEo5aUF4dVM0bWhMVW8xM0dIZndVRHRDVUpP?=
 =?utf-8?B?UzJCRjFjU045Wit6UWV1MWt0bVdLS3NkRTFiZnVnOFJNTkYwTEd5QkFFRUNt?=
 =?utf-8?B?ZXpYSDJhL2JOT3p4dWxFbHBrZmJkVlNwRllIQmNVMWFSQ1JKcTZ3cEpNTlAr?=
 =?utf-8?B?aVRqVitBRGtEK2cyRVR6SStnN2JzOG1GclE3cW55cUkwMzRlWkZoWUEybDlq?=
 =?utf-8?B?cDh5ajBVemVxOGVkbmFzcWw4THFvT04zYTNTVFRUazFXdy96N05LQUhyVWNv?=
 =?utf-8?B?YjJXT09pbkNKdnZZNEdLM1Ara2xLcFMwUzdyRHVodWtxZThLVVhMZEZWVjE5?=
 =?utf-8?B?QUVaWlRRU2RWU2VXcmkydjlqSW1MSncyWFV4cVQrenpwMEgwcGVzdzNtZDNX?=
 =?utf-8?B?UGJ3K1cvNUVDQ2RaemVlYlY3c2Vhb2Y5V3ZDN2czNUtLMDZlQnpvek5TdlFn?=
 =?utf-8?B?NzBWV3FtWkorbUFoQzY5Q2N5bGtpRkxIeFQxSnUwZ0EwNEhPRHlzem9LNW9m?=
 =?utf-8?B?QXVmWHJBWS9IQWUzWmcxT3pRMkp0MlpXV0lpNzhQRmlxU2lQVXVwSXFpN1hh?=
 =?utf-8?B?Q2V3WTJSUWxCY1Y4Ukh3aHZ3RW5aUDRYOTkrY0VHbEtzVGJJSERvZERxZnRC?=
 =?utf-8?B?ajZBc2hBTlVOMWF1cGlJL1N2TFY2QXdNbjJXako4RGZHck9kWnRYaGU4Z1h2?=
 =?utf-8?B?V0NrMVhYdUVLTGNWaGNJRFhPSFlxT1ZrZVMxRGhtVmZHRXlGN2N2cG5nYjhX?=
 =?utf-8?B?eVRJcHBBUWQrZHA0YlZNd29SY1VZK0JaZTlpZmh0Z05wVlRVTjQ3akVLOUpT?=
 =?utf-8?B?aGVjMFNweGVZT1VCM3Z2VTFQaE5mWjRrSDIydnQzYnduQVR5bG1lYjE4VStT?=
 =?utf-8?B?SjZBek80NGlJRjRRbGZ4YlBESmwxaGgyVkR5WFVKWHQzWUhPYTJYSVdmcUc2?=
 =?utf-8?Q?NWYRxf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:34:28.3366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6507cf93-1974-4011-adaf-08ddb97deebb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526

On Wed Jul 2, 2025 at 5:15 PM CEST, Jan Beulich wrote:
> On 02.07.2025 17:09, Alejandro Vallejo wrote:
>> On Wed Jul 2, 2025 at 3:15 PM CEST, Jan Beulich wrote:
>>> On 01.07.2025 12:56, Alejandro Vallejo wrote:
>>>> --- a/xen/arch/x86/include/asm/bootfdt.h
>>>> +++ b/xen/arch/x86/include/asm/bootfdt.h
>>>> @@ -3,6 +3,12 @@
>>>>  #define X86_BOOTFDT_H
>>>> =20
>>>>  #include <xen/types.h>
>>>> +#include <public/xen.h>
>>>> +
>>>> +struct arch_boot_domain
>>>> +{
>>>> +    domid_t domid;
>>>> +};
>>>> =20
>>>>  struct arch_boot_module
>>>>  {
>>>> [...]
>>>> @@ -1048,11 +1050,11 @@ static struct domain *__init create_dom0(struc=
t boot_info *bi)
>>>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>>>> =20
>>>>      /* Create initial domain.  Not d0 for pvshim. */
>>>> -    bd->domid =3D get_initial_domain_id();
>>>> -    d =3D domain_create(bd->domid, &dom0_cfg,
>>>> +    bd->arch.domid =3D get_initial_domain_id();
>>>> +    d =3D domain_create(bd->arch.domid, &dom0_cfg,
>>>>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>>>>      if ( IS_ERR(d) )
>>>> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>>>> +        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d)=
);
>>>
>>> This being the only place where the (now) arch-specific field is used, =
why
>>> does it exist? A local variable would do? And if it's needed for
>>> (supposedly arch-agnostic) hyperlaunch, then it probably shouldn't be
>>> arch-specific? Daniel, Jason?
>>=20
>> As for the arch-agnostic side of things, arm needs some extra work to be
>> able to do it safely. dom0less currently constructs domains immediately =
after
>> parsing them, which is problematic for cases where some domains have the=
 prop
>> and others don't. The domid allocation strategy may preclude further oth=
erwise
>> good domains from being created just because their domid was stolen by a=
 domain
>> that didn't actually care about which domid it got.
>>=20
>> It'll eventually want to leave the arch-specific area, but I don't want =
to do
>> that work now.
>
> But if the domU field is fine to live in a common struct despite being un=
used
> on x86, why can't the domid field live in a common struct too, despite be=
ing
> unused on non-x86? Otherwise it'll be extra churn for no gain to later mo=
ve it
> there.
>
> Jan

Mostly out of tidiness. Otherwise it's hard to know which fields serve a pu=
rpose
where.

I genuinely forgot about the domU field. I'm more than happy to drop that a=
rch
subfield and have domid in the main body of the struct, but I suspect MISRA
would have something to say about dead data?

Cheers,
Alejandro

