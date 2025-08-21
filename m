Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0196B2F557
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:30:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088411.1446162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2YE-000536-K5; Thu, 21 Aug 2025 10:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088411.1446162; Thu, 21 Aug 2025 10:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2YE-00050I-HG; Thu, 21 Aug 2025 10:29:46 +0000
Received: by outflank-mailman (input) for mailman id 1088411;
 Thu, 21 Aug 2025 10:29:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tfyc=3B=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1up2YD-00050C-3G
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:29:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20623.outbound.protection.outlook.com
 [2a01:111:f403:2009::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd943731-7e79-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 12:29:39 +0200 (CEST)
Received: from CH0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::26)
 by DS4PR12MB9820.namprd12.prod.outlook.com (2603:10b6:8:2a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 10:29:34 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::f6) by CH0P220CA0019.outlook.office365.com
 (2603:10b6:610:ef::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.15 via Frontend Transport; Thu,
 21 Aug 2025 10:29:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 21 Aug 2025 10:29:33 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Aug
 2025 05:29:30 -0500
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
X-Inumbo-ID: bd943731-7e79-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyjOvuECjI+w5nQ99/M/NG3Gidho+V9srtti5hrpYxdBFVXjYdFnm8JxIAQEYfKzRtwM3TVSDDtqdIX3zvE9irtqZVdCqOAgCMO8mplLRGFVHXnhlzHWUw6Xogss9IJ/033oki1Eiw/M0oHK6tg/oyUDUnFXzcJy0yzyseYRbJBjz4hbi5FphqlWMJFPiCUnUWpU1oyVp6NIUi0s+OsTqsCqJP2HGqQVESTxzt5soxgWTS6QhDDCOGQmG2qz7JUNSc6iGM51Nta/iX52Le13sI+l+fdCTJGKdHjxN4V5dj51mKCNs7lkja1VVgfxYt2tm75DbCjCMgLQoU9/sY0qXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rCAyBh25oMyrEI1SxPIJBZ7ukAh9YLvSliv5AIUtm3Y=;
 b=cDLdqLQviNived1rX2ZG0Ea4YXhC9kU/2hnSwtPeQQFgUbbmfTbRbHyJumI15CRsNW/eDEEUCiYBrev04nBHYcBqLjvNks/N8bD0yqIgaVjS+Pk0Ay8RmWM7yDfM0rUETqLsyqmA8XvDU82xgkXyFqaJBt80Hhf4TgH128m2mTV+2hZ0QE5LEa+efSEPzgPlpQEsgzIHiUB+Saz5G1XtlG1Pbw2WMKYZYlBkFht7wZv2Y7L+7tFVciveXQFOl/MnhsFB60Xtyl9rvOQE4Kh2GWiFjBEkbimIMUjPn8zalafdggJedNJuywZ33E4ZPuOs94RybAKiB75d3mlx42TEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCAyBh25oMyrEI1SxPIJBZ7ukAh9YLvSliv5AIUtm3Y=;
 b=DIbkSVlyIx2pt3g7A1fqLi8X9Hm3RqT60QymZZRbEkX4Wpn1MY9JhRqoEAXoHhNTAMFjcUQ4HZxeC1OGb8+EZkesa2QUCVXWWqI4okYhxeGDEmEX+mtnfEJFe6NgPSrRu1hJjppuYFG3Ubji+1TXq1n5qUYDhU+9jhAiT9G+s3k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 21 Aug 2025 12:29:23 +0200
Message-ID: <DC81ACV8TXQ1.17YID3PYUCKA5@amd.com>
CC: <andrew.cooper3@citrix.com>, <anthony.perard@vates.tech>,
	<julien@xen.org>, <michal.orzel@amd.com>, <roger.pau@citrix.com>,
	<sstabellini@kernel.org>, <dmukhin@ford.com>, Julien Grall
	<jgrall@amazon.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v16 1/4] xen/domain: unify domain ID allocation
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Jan Beulich <jbeulich@suse.com>, <dmkhn@proton.me>
X-Mailer: aerc 0.20.1
References: <20250812223024.2364749-1-dmukhin@ford.com>
 <20250812223024.2364749-2-dmukhin@ford.com>
 <f85ae718-0243-4426-a555-327afffe7148@suse.com> <aKUPo+hRdfGlg+S8@kraken>
 <a5d91a6d-cde6-42fc-8497-f2c822e98174@suse.com>
In-Reply-To: <a5d91a6d-cde6-42fc-8497-f2c822e98174@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|DS4PR12MB9820:EE_
X-MS-Office365-Filtering-Correlation-Id: c947d730-bd42-446c-4876-08dde09d9ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFI0MVhueS9IUGNYTGFFZ0xJY01kUWhGU0dBZE01bmNXc1Vyd2NCM0Vqa0oy?=
 =?utf-8?B?SnZtODUxeXN2NXU2cmVqWmFyVDlDbi9sSGFERVVMSmhpZUthKzJ3K1ZKVUcy?=
 =?utf-8?B?Nm45bEY5WWU3dlVQdktKdkwxVnFyemF0VzlTZjEyTWdzVVIvWEFmY3pUaGx2?=
 =?utf-8?B?L05Zc3prU2RvTUhDZ0JiMllzZmpNWXdoNGJmZVpkRjFSY3gzTDMwNTBDOFpX?=
 =?utf-8?B?VWp6NWNYMVd6eUNIVGh4MTVxczVBZkFzc2w0Qk5kNDMxQXhEeGlkTWg4UUs5?=
 =?utf-8?B?RWpHVXlzdno3MnlUOE9iQnVLeCtncUhQbUg3cndrQ0RDbDB5ZzhJOHViN3Vm?=
 =?utf-8?B?OURmdnlGUEVndE1SQms2bWp5cmpRQUFjNWNac0cxdGpBUW1nbk1sYW5sRXds?=
 =?utf-8?B?MmVPeHlZMTAzYXdIYVQzQkNKOVNWUWdXZ3h4dzhzdEtianp0RmdGaG8rbC9Y?=
 =?utf-8?B?enZyZE9zMmpnSHp0QVVJS0NOM1dEWVhoSklicjkzc3hZZk54TWFXYTZwWUgw?=
 =?utf-8?B?RlMzeksyNTlSaFpIZUd3WGpFczNNZEZtZ0VUVEl2TVlHQ3JPNXpPMmNGRG9B?=
 =?utf-8?B?Tm5XbWhFcnI4d0gyY1hFYTcrMi85MllYc09MNUpPV3N4K21lYW9rYndEV2VX?=
 =?utf-8?B?aHZjckxiRkVGS0Z5WXZ0VHJ5VzlUa2JRbDUyWWhGTklJTXBrenB4U3NRYnU2?=
 =?utf-8?B?bEo3Mi9rWkV5RHF6cE8zV0JVNUJGSTFPbHEvZU15Z2tnVVBSdG9BZzlUdzZP?=
 =?utf-8?B?cmJDM3hrZi9UcCtaOW51dDdndDMzRDYyalFvS0lLdnAyM3VjSUtqZThLSTlH?=
 =?utf-8?B?MEpKQUxpb3ZjaW41bWYwSEZpekpTOFBmTCthQVhXRXhFTVd3cmVRV3BEQXpV?=
 =?utf-8?B?bkQzSG50eXpQQmJxZUNsbnoydkp6UmFLNVZLWEhUbER0QVRNWnUyWlFKTG1K?=
 =?utf-8?B?SFhoeUFqT0NNekVUMUR3dm9LcGVlMGtOcDZXS24xYko0RytNUFJSVXROODNs?=
 =?utf-8?B?b2RZQU1HWEVXTXA2ZVZQeUc5YUFUTEgvRUFEbVJCOFkySE1laldiT2h2dGFV?=
 =?utf-8?B?V1QyVlVoSFUxSVBNd0dZZ2FwMW4rNzNPQjh1dHhBUEJzN2RWNWQ1aWdsMlhS?=
 =?utf-8?B?bTdJLy96WTRGYUQzTHFPb1hNV2NPeTV6U3czNjVOUzVPajZMM0RZcmhHTVNI?=
 =?utf-8?B?c0J1cGx0TFNTT2lTdWEzTXhKWmxMeVdGeHA5VlVqZVRzakE2RFZZYVFEY2VT?=
 =?utf-8?B?a2sxUk1ZR3VabWxMWlZCU3orbjRiU2hjVURyRmxBNlc1bVNQSTZnWFdhQ3pE?=
 =?utf-8?B?YWdUUjJIYmVLd0JJc2hxbjJYalZTOTFUVlhhc2hucVpkSHZ2Y0dIZU04MmVi?=
 =?utf-8?B?SUlIQ09PMWlWZGs5bXEyeHNtaSt1Yk4xRXBpN0ZFWVFUWi9yOFVGVGZWM29w?=
 =?utf-8?B?ZkxBR2N0SnJOcExieEFpa1FpUWZtSWk3a3ZzNHRqY1NyZE95aUxKdEQ5T0h4?=
 =?utf-8?B?OSt6QXpnRWxsZzBjTnZLWlZ6dEYzdXkrMHhCVTBoYnB4Wm1ld3Y0VFdkNllE?=
 =?utf-8?B?TmhQQXdUcUZOcHlEK0luNCtURi83Sk93YjBKaVVydWlrdndORVVxNXBmUVdj?=
 =?utf-8?B?bUErbnBJT0xOdTJuUnlibWRncXhQWjdpZ09QSjgzZVpMa3F2SC9BU245cFli?=
 =?utf-8?B?cWZZd1N3V3pLdnFRVUdmUGVYcDhKemdoV3hXRU9TTG5rR2pyOVNRVXdpdkZR?=
 =?utf-8?B?SU9aa0VTMi93Tmc3NlNGdGRoLzB0bElEZWRGdS9xL1NyT0pqaXJNVEsyQ1N5?=
 =?utf-8?B?YWRDb1QvZTJxN1hHcmlXU25MOHdnaGtMTjFzYklvM1h3MXY0ODZVdEllWGJX?=
 =?utf-8?B?M0szSE1ZU09RbU0vV08rRnI4Nk4zUkZJbmdkMXU2SHdFS3ZKc2pRNE5tVnVU?=
 =?utf-8?B?Z2R1VkdVM1piWGJNSk9uWi95NC9GSHZMSCtEZ1oveXVUWUxIR3JTZjFNNlZ5?=
 =?utf-8?B?N01oL2R0VENSUHB3MHRTTjZ0S0M0YmhBVXMvQSs2TXNmVUxwZllkSkEzd3ZC?=
 =?utf-8?Q?+WSFLx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 10:29:33.7493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c947d730-bd42-446c-4876-08dde09d9ef8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9820

On Thu Aug 21, 2025 at 9:16 AM CEST, Jan Beulich wrote:
> On 20.08.2025 01:58, dmkhn@proton.me wrote:
>> On Thu, Aug 14, 2025 at 09:11:11AM +0200, Jan Beulich wrote:
>>> On 13.08.2025 00:30, dmkhn@proton.me wrote:
>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>
>>>> Currently, there are two different domain ID allocation implementation=
s:
>>>>
>>>>   1) Sequential IDs allocation in dom0less Arm code based on max_init_=
domid;
>>>>
>>>>   2) Sequential IDs allocation in XEN_DOMCTL_createdomain; does not us=
e
>>>>      max_init_domid (both Arm and x86).
>>>>
>>>> The domain ID allocation covers dom0 or late hwdom, predefined domains=
,
>>>> post-boot domains, excluding Xen system domains (domid >=3D
>>>> DOMID_FIRST_RESERVED).
>>>>
>>>> It makes sense to have a common helper code for such task across archi=
tectures
>>>> (Arm and x86) and between dom0less / toolstack domU allocation.
>>>>
>>>> Note, fixing dependency on max_init_domid is out of scope of this patc=
h.
>>>>
>>>> Wrap the domain ID allocation as an arch-independent function domid_al=
loc() in
>>>> new common/domid.c based on the bitmap.
>>>>
>>>> Allocation algorithm:
>>>> - If an explicit domain ID is provided, verify its availability and us=
e it if
>>>>   ID is not used;
>>>> - If DOMID_INVALID is provided, search the range [1..DOMID_FIRST_RESER=
VED-1],
>>>>   starting from the last used ID.
>>>>   Implementation guarantees that two consecutive calls will never retu=
rn the
>>>>   same ID. ID#0 is reserved for the first boot domain (currently, dom0=
) and
>>>>   excluded from the allocation range.
>>>>
>>>> Remove is_free_domid() helper as it is not needed now.
>>>>
>>>> No functional change intended.
>>>>
>>>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>>>> Reviewed-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>> ---
>>>> Changes since v15:
>>>> - fixup for check after the first pass in the bitarray in domid_alloc(=
)
>>>> - trivial renaming for the local variable in domid_alloc()
>>>> - kept Julien's R-b, added Alejandro's R-b
>>>
>>> Just to mention: My take is that this kind of a fix ought to invalidate=
 all
>>> earlier R-b. It's not just a cosmetic change, after all.
>>=20
>> Sorry for the hiccup here, did not mean to overrule the review process.
>>=20
>> My bold assumption was that in case of small fixups like this it is
>> satisfactory to carry over previous acks.
>
> Acks may be okay to keep, but imo R-b need dropping when an actual bug wa=
s
> fixed.

I don't know. Unless the bugfix involves a change in the code with wide rea=
ching
consequences I'd say it's reasonable to keep them. But that's something for=
 you
(the committers) to decide, and this just my .02 cents.

> Irrespective of how severe the bug was.

It's not so much about the severity (imo), as the behavioural differences
involved in the fixup. In this case (afaics?) it's a straight s/=3D=3D/>=3D=
/, which is
self-contained and has no wide-reaching side effects at all.

>
>> I asked (matrix) both Julien and Alejandro to re-review and confirm.
>
> While good to ask, that's of limited use. It'll be impossible later on to
> figure whether such a confirmation was given. Decisions (and acks and ali=
ke
> effectively fall into that category) need to be on the list, to be able t=
o
> locate them later on.
>
> Jan

He meant he reached out to ask for an in-list confirmation. As far as I'm
concerned, my R-by still holds.

Cheers,
Alejandro

