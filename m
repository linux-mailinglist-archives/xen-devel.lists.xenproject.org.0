Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4H74DDVRqGmztAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:35:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF3202D97
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245640.1544988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoFd-0006Zw-LU; Wed, 04 Mar 2026 15:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245640.1544988; Wed, 04 Mar 2026 15:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoFd-0006Xm-HW; Wed, 04 Mar 2026 15:35:05 +0000
Received: by outflank-mailman (input) for mailman id 1245640;
 Wed, 04 Mar 2026 15:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hSGG=BE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vxoFb-0006Xd-SY
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:35:03 +0000
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c110::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b371d114-17df-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 16:35:01 +0100 (CET)
Received: from BYAPR03CA0019.namprd03.prod.outlook.com (2603:10b6:a02:a8::32)
 by DS4PR12MB9659.namprd12.prod.outlook.com (2603:10b6:8:27f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 15:34:51 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::9e) by BYAPR03CA0019.outlook.office365.com
 (2603:10b6:a02:a8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Wed,
 4 Mar 2026 15:34:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 15:34:50 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 4 Mar
 2026 09:34:50 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Mar
 2026 09:34:50 -0600
Received: from [172.30.142.83] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 4 Mar 2026 09:34:48 -0600
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
X-Inumbo-ID: b371d114-17df-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/7Y7+GAyHDyHGdEBQPPGKjbDif470GR7YRyk+oo2rK3aO9Ztc37t+3VcxqtEruoQKwciyrCNBEjaukdzoXWuNODooPL5FzZgiEMGjTea+ax/aKTukqoankG2zRsyUhBxV1ckiIKfXzrJxwieqN0A5TKPR0Y08w4Q3cLi/kDcUjOLs9iMh9PJfFlfCsuT4vXRWoYwGgQdfoIriPZ72OuKH87DuMeLJRAqoXo0go7RzmjyX1RFlhBQMaCoaVvkOK3qteCnbr55C8luqeePGVUC8GyIwEEJG6UoCadmiiE1ChTCjFIP/XTODuqvhtKZyCZ0CvSl7CtAe/tEnoOL9e0Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qnyNU8K9XOSeW8hicrLiTi+a+m+bbxwcRWJIQliUBo=;
 b=cI6Kw/VFNvpGMJsGTL59tmEBenhbtXrcuicRGSUPePdac8ljRLj0EYHZTzTydWgdXW+V444htlPeJ/6tSSxgQElkzZdzryXx/H1yenDzH9jISl75ZXXzn5LWJ25I4G5x7xo43salDOSVMMR40YRCDmXVV/NoKdRV/gqTYIq7Q3dmYQD3M2XoZ01BRF56KcNqsDWQUg38/U5laM1Dg+cRjsmx+aTD7FF41oFPIQ9ShmJc2lyHcRvuwj+6hZd4Xb/Ux+UBkECYTTqJ89QBR+WA+ECY5kcaN3BKBjR8g0LCWqGoPY8EwoSDZYHLwPP6zn20g13a+96Gfoydrv/5oNOFsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qnyNU8K9XOSeW8hicrLiTi+a+m+bbxwcRWJIQliUBo=;
 b=u2tW3IJMB01mjigaiarvP2rxD4QQpdxd+IbqulsROEJge2wPP3bknGikMWGd4gU2ezgCyCpEQVGS7w5cO8bnQV+qTfAalJh/ZnPPTYwjBIAkUFFjxYHTudUHxwQOfkzagIvJNP+Xc+VcrYTS3W2Txf6yM6FI1UuZQe3EgpacTZo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <726e088f-0090-4e00-a511-465d88b1e3ad@amd.com>
Date: Wed, 4 Mar 2026 10:34:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/6] vpci: add SR-IOV support for PVH Dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Oleksii
 Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1753450965.git.mykyta_poturai@epam.com>
 <c5cd0e9cd75cacee2127c45635c999bd296853a7.1753450965.git.mykyta_poturai@epam.com>
 <aIdgJPTf17M0g-8m@macbook.local>
 <8da9f137-a897-4438-9524-85836e0170a1@epam.com>
 <aahM5QBet0Ehxxjm@macbook.local>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <aahM5QBet0Ehxxjm@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|DS4PR12MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: f04a01ae-ee66-4839-d3e5-08de7a039368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	rze3z7YJNsWKnBT93vxuR9/TVlLFAV31UcjPw9jCF0fvEDj7m4jwyFry4G+cOPxRuCZBQTZktnBBUH1sDd7IyUPaAup51ZMBwMocHqAGuuuWQPnSAay6tZD1/HPQVjjwz9aX0pO7KzY2Gw/YYYUauX4OQoCXrdDX4pTdTE7PrF+ybznHdl+wTLEEY05dhG3nskf2+EtUB2aBwnFOevSOqqXkDvPgrdQmxt5D6UJ2iBnaW5o+ygyr8xI5Jh+Dqt+ZGEZaUv1bKhuT300N/A/RiUcIfla7X8uNgmdbn/GtROHPNDmatGPFmAK+I7C4foihFsz/dYrvNS7pJTgdU8Iq3JbiLqxJf+npMHeAhbU+mI5WVRgKoqgJMF/13ceANlN3D8y/5pQPGw3NJpsbziIpbw5SouVU2SNf38SdtS7TGVE+sKgmGY7WaetHQozu7Nn0aiPFqm9WCW2i73/6jHBpz6vkGyPLe6kmJMk4dwyHsswS5lCPnkXlxKdeIe/TrAVXakKE+uIReWDWWkDMKSk4CSnralmzK1nw8Zh+IM3HNFH4sO731PRi6yQGK0PErFkE/kqy13rjLHVEeWiDPL4qbgPnX2FJEEaSDz8C5uzbo28Hux5hlsFA+bI1bnx546v9buNj0Xy9Jbt14lKuC3kkUhSUbKSOsgxxXfYxPFQkkKOA7EInUY7RhGol0M9RRCVLDOPiupnUEARXbWpY0afhqmlhSbrLa3vt6feT/EEZ94Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8AwXFBBTsLSnPVOGA+gJ7etEJCJtXqsKYh7K4HhIxCR2YG9PfKtZab1J+8yVS2j6RL75BYNAM4GaGhTbVvo9Zu+++F1JrtlOnWXkionKWxa58NSYmNQ9jRqIuLL4qYHWP+pt6EcdnukvmC83vwHhReoOw5uAJrkO8PBUkWFXyyD0PClTE/RO6tPcd7xdAuQYRLc77zHQeRgPLcPpt5kH3wQxx8cNCKwFfzlYtLqrjt48NTNfhrFFuej49ghw2DyBl8wvnyfXFarHyfejbn3DUVxMBlAtUCj6jYDcEUp5B6+fFbiSDQeCZi5D3GUEw8/94X93XKd3gwFN+tVXldE1CSlR7tTRqdhOvtq4XEcyAn1QxqQMZ8hvq6yip7RRNoKV7BQCwqoLvMz7WxI6cM710FUGUMSPb586SVF2yVVoimM+jqt0FYE2dOasvGajVp1C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 15:34:50.8940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f04a01ae-ee66-4839-d3e5-08de7a039368
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9659
X-Rspamd-Queue-Id: 95AF3202D97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,xenproject.org,citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stewart.hildebrand@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:dkim,amd.com:email,amd.com:mid,support.md:url,keepachangelog.com:url,changelog.md:url,epam.com:email]
X-Rspamd-Action: no action

On 3/4/26 10:16, Roger Pau Monné wrote:
> On Wed, Mar 04, 2026 at 08:43:17AM +0000, Mykyta Poturai wrote:
>> On 7/28/25 14:33, Roger Pau Monné wrote:
>>> On Fri, Jul 25, 2025 at 02:24:33PM +0000, Mykyta Poturai wrote:
>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>
>>>> This code is expected to only be used by privileged domains,
>>>> unprivileged domains should not get access to the SR-IOV capability.
>>>>
>>>> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
>>>> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
>>>> for possible changes in the system page size register.
>>>>
>>>> Relies on dom0 to enable SR-IOV and PHYSDEVOP to inform Xen about
>>>> addition/removal of VFs.
>>>
>>> Why I'm not opposed to allowing registration of devices using
>>> PHYSDEVOP, can't Xen detect the addition of the VFs and add them
>>> itself?
>>>
>>> When I worked on this long time ago, the version of the series that I
>>> posted had registration of the VFs done by Xen also:
>>>
>>> https://lore.kernel.org/xen-devel/20180717094830.54806-12-roger.pau@citrix.com/
>>>
>>>>
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
>>>> ---
>>>>   CHANGELOG.md              |   3 +-
>>>>   SUPPORT.md                |   2 -
>>>>   xen/drivers/vpci/Makefile |   2 +-
>>>>   xen/drivers/vpci/header.c |   3 +
>>>>   xen/drivers/vpci/sriov.c  | 235 ++++++++++++++++++++++++++++++++++++++
>>>>   xen/drivers/vpci/vpci.c   |   1 +
>>>>   xen/include/xen/vpci.h    |   7 +-
>>>>   7 files changed, 247 insertions(+), 6 deletions(-)
>>>>   create mode 100644 xen/drivers/vpci/sriov.c
>>>>
>>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>>> index 5f31ca08fe..7b0e8beb76 100644
>>>> --- a/CHANGELOG.md
>>>> +++ b/CHANGELOG.md
>>>> @@ -23,8 +23,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/
>>>>    - On x86:
>>>>      - Option to attempt to fixup p2m page-faults on PVH dom0.
>>>>      - Resizable BARs is supported for PVH dom0.
>>>> -   - Support PCI passthrough for HVM domUs when dom0 is PVH (note SR-IOV
>>>> -     capability usage is not yet supported on PVH dom0).
>>>> +   - Support PCI passthrough for HVM domUs when dom0 is PVH.
>>>
>>> Don't you need to move this out of the x86 specific section?
>>>
>>> According to the cover letter you are testing on an ARM board, so this
>>> probably needs to be put in a non-arch part of CHANGELOG?
>>>
>>>>      - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
>>>>   
>>>>    - On Arm:
>>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>>> index 6a82a92189..830b598714 100644
>>>> --- a/SUPPORT.md
>>>> +++ b/SUPPORT.md
>>>> @@ -170,8 +170,6 @@ unexpected behavior or issues on some hardware.
>>>>   
>>>>   At least the following features are missing on a PVH dom0:
>>>>   
>>>> -  * PCI SR-IOV.
>>>> -
>>>>     * Native NMI forwarding (nmi=dom0 command line option).
>>>>   
>>>>     * MCE handling.
>>>> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
>>>> index a7c8a30a89..fe1e57b64d 100644
>>>> --- a/xen/drivers/vpci/Makefile
>>>> +++ b/xen/drivers/vpci/Makefile
>>>> @@ -1,2 +1,2 @@
>>>> -obj-y += vpci.o header.o rebar.o
>>>> +obj-y += vpci.o header.o rebar.o sriov.o
>>>>   obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
>>>> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
>>>> index f947f652cd..0a840c6dcc 100644
>>>> --- a/xen/drivers/vpci/header.c
>>>> +++ b/xen/drivers/vpci/header.c
>>>> @@ -839,6 +839,9 @@ static int cf_check init_header(struct pci_dev *pdev)
>>>>   
>>>>       ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>>>>   
>>>> +    if ( pdev->info.is_virtfn )
>>>> +        return 0;
>>>> +
>>>>       switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
>>>>       {
>>>>       case PCI_HEADER_TYPE_NORMAL:
>>>> diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
>>>> new file mode 100644
>>>> index 0000000000..640430e3e9
>>>> --- /dev/null
>>>> +++ b/xen/drivers/vpci/sriov.c
>>>> @@ -0,0 +1,235 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * Handlers for accesses to the SR-IOV capability structure.
>>>> + *
>>>> + * Copyright (C) 2018 Citrix Systems R&D
>>>
>>> If there's a Citrix copyright header here, shouldn't there be a
>>> matching Signed-off-by from someone at Citrix (I think that's likely
>>> me)?
>>>
>>> Otherwise if there's no content authored by a Citrix employee the
>>> copyright notice must be removed.  We need to be careful with
>>> copyright and attribution.
>>>
>>> And in any case the date should be updated.
>>>
>>
>> Can I add your SOB or is it better to remove the copyright? Looking at 
>> the patches you provided, I think this ones were definitely based on 
>> them, but there are also a lot of changes since then.
> 
> If it's based on the patches that I sent many years ago (2018),
> then yes, you likely need to add my SoB.  Look like that way from the
> copyright notice.
> 
> Thanks, Roger.

A bit of context here: When I worked on this, I used Roger's sriov.c from [1] as
a starting point. Unfortunately, during my haste of development, I neglected to
preserve authorship/Signed-off-by, and didn't get back to addressing it before I
shared the branch with Mykyta. So yes, at minimum Roger's S-o-b should be
re-added (likely as the first S-o-b), and potentially even make Roger author.

[1] https://lore.kernel.org/xen-devel/20180717094830.54806-12-roger.pau@citrix.com/

