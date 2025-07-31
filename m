Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF9EB171CB
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 15:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065607.1430968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhT2q-0004xt-K3; Thu, 31 Jul 2025 13:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065607.1430968; Thu, 31 Jul 2025 13:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhT2q-0004vC-G4; Thu, 31 Jul 2025 13:10:04 +0000
Received: by outflank-mailman (input) for mailman id 1065607;
 Thu, 31 Jul 2025 13:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bAk1=2M=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uhT2p-0004eQ-4m
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 13:10:03 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:2417::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a99ccc44-6e0f-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 15:10:00 +0200 (CEST)
Received: from DS7PR03CA0019.namprd03.prod.outlook.com (2603:10b6:5:3b8::24)
 by DS5PPFA33D606F8.namprd12.prod.outlook.com (2603:10b6:f:fc00::65b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 31 Jul
 2025 13:09:55 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::bf) by DS7PR03CA0019.outlook.office365.com
 (2603:10b6:5:3b8::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.11 via Frontend Transport; Thu,
 31 Jul 2025 13:09:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Thu, 31 Jul 2025 13:09:55 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 08:09:52 -0500
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
X-Inumbo-ID: a99ccc44-6e0f-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDqIJ1ABOp3g6oeBIYyhmTW+xB+4L2jlFVLbTnPOkruJFBulJRUQJUSmxbHS0vqzPKmxNjTiHp2l7dWzkr2p03m3vttPbwgzmrcBS4V+DSybkMoUw16WM8MrrF1ABroj7kAtl7j2GUX49ZlFewMxgOnGgNuviXUU8lpVcvesp5sOQ95kj8M6Fk07PB5VVFfqrxpshay6UxgTOqQmSsyLbdCMkYCtg3VX6AjOtcifpIc+ja8WQXJYm+zjiLo2lzU04HCjn9olSS9hbkrRw1jXN0tbC7/OwR60bFLSsBFzb7/dqIs9diU+4X+KAn4kiebXWgoRxi1liVWvw4um589vjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huCkNkaOGHuxWvWhRWqh6OENZYV8i/dmfsSgn7V2cJ4=;
 b=akMP48YaWWUsskL/DqAdbsbsmt739cx5HQeVOg3duAuEMOxHvqHjctO6inGUifyQu60T7fNdvyNCAsfZ+y2mXB60A5zav2ij1NZYcVo82gYO/PnZMqtpb8RFdiMC9c1kIShWJ2OdGz6cQu1IeXFR+BCSBFtCPTnWgA9YfrcbRLmP/tALZ3KSqY+SyfLHlF1bx2EcOIVQEL9zc24SuSF6jtr3Arop77RolrDe7qRfLF4wEB9YQB6ju958UoxDpsboY4Uxp1q1NhS1k+YFJKF9oHYLxirKrhyi4+5Pa17p7xKn+/02D2+C8lp15beARnHRf77H1PI8TKtOhBuRGyToPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huCkNkaOGHuxWvWhRWqh6OENZYV8i/dmfsSgn7V2cJ4=;
 b=o26Kct/02eT8wIZeCTQw0mRaA1Y6GVrk6PEBZDnaOJyTNHpZE/SfKmfRh9ASSoTssMDOKk4cyKpse3V9plmI9r3QOdisJmYUA/FFE/+LKA0p0tKOBerYqcmRvUM81si7EI7GE487ukS3cqul+iN+F8SXBTj9OxKyGxj9yiyi+ig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Jul 2025 15:09:50 +0200
Message-ID: <DBQ9JRMYP231.2OVN6KC0QPG0U@amd.com>
Subject: Re: [XEN][PATCH 1/7] xen/arm64: domctl: set_address_size add check
 for vcpus not initialized
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
X-Mailer: aerc 0.20.1
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
 <20250731094234.996684-2-grygorii_strashko@epam.com>
In-Reply-To: <20250731094234.996684-2-grygorii_strashko@epam.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|DS5PPFA33D606F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b43d5fd-4e7e-4dbe-2282-08ddd0338b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0tub1FGdmdvZG8yNC9zQ0lMRDZQZElQTnFYdnBSOUpmdHJ5NnowTnBydmVj?=
 =?utf-8?B?VXVHWU5lYXRIaXlYMm93N24vWHBUN0RqNGtKV3ZpNGx1UGxmQmw5eVFxZUhO?=
 =?utf-8?B?KzgrODcwYzA1dmJsMUlNd1ZyRTdRWlVDV2t5a1ZjT0N2cnU5bzJrVm8wYWJY?=
 =?utf-8?B?NDlMKzBlcTlZVWhkaVhuRXlTK1FNRTVBOG5Ua3VMZUxDb2RPazA5VHh6TGpB?=
 =?utf-8?B?R2l2MnNRVnFKdE52Y0IyVWF0NG5qb0xXMGJ3YTV0M0VQQWQyVkVmbUxTKzlH?=
 =?utf-8?B?MkhWV1NaZFVJd0RTVDNRdXUvN2dFS2JRNm9LS3F0OGZZVEs5ZU9ubFV4VFBG?=
 =?utf-8?B?dktQeDNoVDJGWCtDMWFLc3RLTk5hMXhROTdIVUg3Qk9tVUtDY2krajhKM2pJ?=
 =?utf-8?B?MVBDeVh2THhYK09FSTRLWXFlMzVWVThWSkdCZk50THAzZW8vREh1c01LSi9B?=
 =?utf-8?B?ZGlNcFd1QVlCKzc1c09JbWJGZzVXWXRUZ3l2NDd2cHdqSHFwRXFXa0JSQkp2?=
 =?utf-8?B?TmVHdGFUM0VET0plclhyMzRKdERRb2ZZanpyOWhXRk9VVlVya3ZKZDVwVkJY?=
 =?utf-8?B?QXpnbW12WWdSejl2OXRsSU8za2VKT2dITmZNR0UrSCtrcEdJLzA2OXZ5WkFB?=
 =?utf-8?B?NjhnNDBHdjlZLzFxQ2hzVVJvMmZFUUJGTFVNaGJEUnZudFZMam44NDlrUUxj?=
 =?utf-8?B?VC9lMGxxd04xU2FOY1lWREpZU01VSFZ6RE5vbENRZzJPQjFDODZJSU9QWTc4?=
 =?utf-8?B?dG0vMVhBZzFZZUlndzY4UllEeWcxL0ZmMkt0VGcwcXRyd1ZaWTE2ckhLSWhX?=
 =?utf-8?B?akt3UjhBbnBINGNHWkVHbGtEaFlsMWIxSm93Q2NjVk52RTYyeVhvZSt5MWIx?=
 =?utf-8?B?bWE2SVlDV1drQ0FzSUxJa3dneVZwajdTQ1puYjR2WWZMZlVUVTZQR3FLRGdI?=
 =?utf-8?B?UWM5U0JkNlBKKzNUZktjOTVKNHlCQ1NNTlNRSkxqYTZLdE9jRXBpbnVUUkZm?=
 =?utf-8?B?djQ3bWpkK091OC96ZS9KWkNoVlBNMnhDMEU3Qm1Ra2NrcTdydGpieFZUaUM4?=
 =?utf-8?B?MTBlQ0svdEdwQXZCdXpGZWtGSmxrMUdXTHhaQlRralUvTnlQQUFzTnBhWEVM?=
 =?utf-8?B?WkorajNLSXhJSXpSaXVhYzBpbEMxMmFqVjhaSWJMQVFkNXlRWGpJRWJ5T1Vm?=
 =?utf-8?B?d2NRQ0lzaStpdzcrdGFQWFBjMklUOFhCbVR1SGRxb0JzdjdwQ0V1R25jZWVR?=
 =?utf-8?B?V1prNDc3RStZWlhoSzkxSStVS2ZmLzB0S3dwUll6eVkvVkc5NTZlQ00xZFNu?=
 =?utf-8?B?UFFDWkplWHRqZFRSTWJnaDJYeVV1alRpY3ovV0hVM3RiZXExWTA5ay91UFJy?=
 =?utf-8?B?NW4ySlBKUzVTakJEZXlIb0wydnZNN2NSSkFyMHdUY3R6dURGWURxYXJueVFP?=
 =?utf-8?B?TTBpc3ZBWE9XaVpYOVZmZnBMeW1XRlVYQ1k2U0paZzAycXNwdmtwcFAxWGIr?=
 =?utf-8?B?eGI2bHFLZThrbzc1bjZDQ000MEVEOXN1aGs0OGhXdURMVkJpRnNpWmVCZ3V0?=
 =?utf-8?B?RDE1M24yck1McTRJM0liS1ZROUdBZGVNRmN2UVh1REx2VkU1UVh3SjhxVGVE?=
 =?utf-8?B?OGVERHQ1RGNIQ0FCWE5FdjlpbXhEeWs3MENVdWdVc2s3WlFyK0pNTkdxYW1h?=
 =?utf-8?B?VWtNb3NTQUpHZXFFL3BPbXZrTE10aWpPOGpnR1AraE9NWGo0YStMcmdCckJh?=
 =?utf-8?B?dGpSNkFzTGpWTEthSVYrL25ZUklsMTVlb0ZxaTlsakN0N2VOVWYwV3FON2Jn?=
 =?utf-8?B?S3liVGozaWVnTHZncVRuMGQxUFBSRm83R2VxQmVqYzNRN1FRWnlkU3dxWC9q?=
 =?utf-8?B?VUZxeWxsN3BBcGE2Njd3OVhqSWlURkMzamlaSklVQVYva09MZ0VMSW9aZWx4?=
 =?utf-8?B?RmsxZ1VYeG55c0EzVHdwUlpZcWhpeVlRWHZDMXNXWFVRWlYxUUkrbDJSd3Ev?=
 =?utf-8?B?aXFTaDA4bDZBZTV5YnBha3paM05HbDNZWm9CODA2S3dmWS9VbElEbklpbFNj?=
 =?utf-8?Q?dWY5MK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 13:09:55.0945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b43d5fd-4e7e-4dbe-2282-08ddd0338b14
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFA33D606F8

On Thu Jul 31, 2025 at 11:42 AM CEST, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> The vcpu ctx initialization (arch_set_info_guest()) is depends on proper
                                                       ^
                                                   stray "is"

> domain type (32/64bit) configuration, so check that vcpus are not
> initialized when toolstack issues XEN_DOMCTL_set_address_size hypercall.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  xen/arch/arm/arm64/domctl.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
> index 8720d126c97d..82eff26fb0d1 100644
> --- a/xen/arch/arm/arm64/domctl.c
> +++ b/xen/arch/arm/arm64/domctl.c
> @@ -13,6 +13,19 @@
>  #include <asm/arm64/sve.h>
>  #include <asm/cpufeature.h>
> =20
> +static bool vcpus_check_initialised(struct domain *d)

nit: I'd call it vcpus_any_initialised(), that way it's far easier to
     see what it does without jumping into the implementation.

> +{
> +    struct vcpu *v;
> +
> +    for_each_vcpu(d, v)
> +    {
> +        if ( v->is_initialised )
> +            return true;
> +    }
> +
> +    return false;
> +}
> +
>  static long switch_mode(struct domain *d, enum domain_type type)
>  {
>      struct vcpu *v;
> @@ -21,6 +34,8 @@ static long switch_mode(struct domain *d, enum domain_t=
ype type)
>          return -EINVAL;
>      if ( domain_tot_pages(d) !=3D 0 )
>          return -EBUSY;
> +    if ( vcpus_check_initialised(d) )
> +        return -EBUSY;
>      if ( d->arch.type =3D=3D type )
>          return 0;
> =20


