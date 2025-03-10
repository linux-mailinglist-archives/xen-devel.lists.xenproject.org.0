Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC29A5979F
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 15:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906531.1313947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1treBJ-00062x-Rk; Mon, 10 Mar 2025 14:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906531.1313947; Mon, 10 Mar 2025 14:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1treBJ-00060m-Or; Mon, 10 Mar 2025 14:32:37 +0000
Received: by outflank-mailman (input) for mailman id 906531;
 Mon, 10 Mar 2025 14:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vjn7=V5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1treBI-00060g-OF
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 14:32:36 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:200a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80c6e371-fdbc-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 15:32:34 +0100 (CET)
Received: from CH2PR02CA0016.namprd02.prod.outlook.com (2603:10b6:610:4e::26)
 by SA3PR12MB7999.namprd12.prod.outlook.com (2603:10b6:806:312::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.23; Mon, 10 Mar
 2025 14:32:26 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::6c) by CH2PR02CA0016.outlook.office365.com
 (2603:10b6:610:4e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 14:32:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 14:32:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 09:32:23 -0500
Received: from [172.19.213.155] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 09:32:23 -0500
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
X-Inumbo-ID: 80c6e371-fdbc-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VzzSP3ZgUyVVTJt+FsjAjB1B0kJvTYNrBKQEp0exk1hkf1frReY43MBRsolaXyBEhwECNelA4cShhFZqb40IOPfh90ngYsmIqPUoy+w8upOOaympvnIenhtV5vSVOtZYiJnnCwFraHnsdCr9eQob61lDd9fkfv3XOQswCFG1+uLlDIc7LYoxumnGn9+CJwxzykx9PaCSkaD21JkSstVMSL0cmLx8TFIiHIJDuanlt7iQGv/YQON4mB/J70ZAgzA782JYuAeZgpiFBUTns2I95hYueNQk/wIoTtrsY+jI8X7HMEAFdlSwfLuEje88wabDjmrl0Km+K0xqrC/f5wUjJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8a8nN3U5REsUOFV2dDFaUPEshc1rekuI8d8M5EUaMs=;
 b=eZ02uh5bz0KqadR02VXjTzqCxBwHLzRpzFFxlwJatFVWYLLrEwKgYGOi76lTztH3KIgyRgu4ZgxrM6Wm2wWXzgtBdSsfQZVErSNF1e9lJduttxsIO+ACMo1Z5PuI7/vbamdXRSCXTFf05JOkvxzg3j90oeViRdjy17x+8teh8QObgEBFtQSCTwLiXrR0Kc+g0ftxZ4ixmY0yL/ruDYmeLivNYxo5dKCMtEH8FrfhGZ36QYOqZi0Y7vB565E9CzLe/6tRnOYHtbkwH8kuqbqeSyqhb6//x1ua6azTxw8AZlPUkc17te4RLnKgL12xMdj5l9M2En61t1k36wQuF5Ht1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z8a8nN3U5REsUOFV2dDFaUPEshc1rekuI8d8M5EUaMs=;
 b=nt6TSU8mrIpIdTZbnn+fMvAn0ZEQ9GSR97KGJ3x7GEQI0t49MyGZ3sVeZLhSEa3oIpQRMFDtV+uhSNfdRChS7WY5JmZUF5k59pU86EUc+v+i4myUHQgSysFgvoEff3ln9v7y1NFydvPJ0QILDZRAijITD9tdFF+KYJyPe5U0/RU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <18198558-87dc-4901-8c26-e35871b88ad7@amd.com>
Date: Mon, 10 Mar 2025 10:32:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/23] tools/xenstored: Automatically set dom0_domid and
 priv_domid
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-12-jason.andryuk@amd.com>
 <5c0a1526-7faa-407a-b249-e80fb23c97b2@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5c0a1526-7faa-407a-b249-e80fb23c97b2@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|SA3PR12MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: ca53b258-ec29-43f6-4347-08dd5fe06137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWlDU1Y3dHJicnlLa29ocjVZRUp5ZFVtUjV6WU1wU0JwNnFlL2ZCV29nSkZ3?=
 =?utf-8?B?YU8vcnFjTWdMOUowWE1KdCtKaU9DL09ITHRiTmw5L0dTQmlTZFZnYXB0bGZY?=
 =?utf-8?B?VnhSamt0MncvQXVwUHNsc25WQ0djTVcxaVNmMTJyQ1FERi9kUGU2cTN0eDg3?=
 =?utf-8?B?Ulk2eDRqR0lDU3ljSWk2UjkwcHlDZHRzTXRLYkxOZVZKRkh5djZMVHQweW8r?=
 =?utf-8?B?VkthOUN5YXMwcGVLOWRrcE5qSFQxdkdTc2hGc0k5NlREU3NQZVRwTGhQZkNH?=
 =?utf-8?B?Umk0Q01FaXFQSjVuT3dsL3d3c3FtVkFXeE5WNTNBZmsxVGczWFVkdDZyT2Q0?=
 =?utf-8?B?c1Y4QWhjUVRUdkFzNVBwSHUxQjhYOGpxMEZ1cUttcHFhU3VBNjRZRUFITFQ1?=
 =?utf-8?B?alRKU0g5NWZLdmhLSFdPanpTV1pDcStqaXJER2UvL21DcjYvejUyc09PR2F6?=
 =?utf-8?B?VVZjdnBOTngwUXFYTkM3MFQ1ck9QQ2I1ZUtSOHlBYkFpWHZBSW1OZGxHais5?=
 =?utf-8?B?M3NRT1g0TlkwVlR0MjFtNkN4NGg4aUNCS0k2L3M0V0hhdnRFN1BDSzFUaEhk?=
 =?utf-8?B?TGp1OHFLY1ZSdXMwaEZQNTNCWlVxVmcvelhyQTF5eWpEQkg5N3RJUFhRUDdO?=
 =?utf-8?B?a0sxUVRiNVpLRVBJUWwxdnVqWHMrbmIyTnpPMDFmbUlCbEJtV1ExWm5LaGpu?=
 =?utf-8?B?T1ZYNmZhU1V1NFFQZUpvMTd1aEt2ZmpDNmZaZE1IaXFWZTNrZUIzbDNDd0xE?=
 =?utf-8?B?ZGF0UnUxK1VodWs4VUtrNm9VZVVjNS9jNmY0c1c4eGlvSGpObzNnZXpaMU1K?=
 =?utf-8?B?aWZUUVNXb1ZSTlc4NDFmRDlOQXQvVFloREtkZWEzT2E5QnpMbTVCeC9BM2pL?=
 =?utf-8?B?OUQrRjgwQkJWckZ4S0FQUEdRak1ZWmQvVGJ6YzVLODRSaHNvTVRkczNoRW1J?=
 =?utf-8?B?ZUx0RFhPYUFnZDZSVHZ6RGNYQmNpREg0RmRmNWxSU0ptSks4dHhFS3BKL0RI?=
 =?utf-8?B?UE9mWFZWVFpHUlRybGZoTk03MkF1UVI5dEFUZUJySGU3SDUwcXNrdmpYSVNN?=
 =?utf-8?B?aGQ2aUl4K1FzMTR4OVlFd3BvaG5EOU9UMlRmZVRMUFFXeDFTbE9Uem1xZEpw?=
 =?utf-8?B?QXFwWDFsNlJ5eE0zZDY3V0c2SGxnT3JCdDlzcVB4WVFxdmc0TnZucVhNMllH?=
 =?utf-8?B?ZWlYZmRXTDJoWHh5OHZVSWh4L013SDZqUWN2T24xMHplWW04eXBiWUV6TWRh?=
 =?utf-8?B?S3RlVzF0ZDlUdTVYdHhoMFZBWXNoQzljMXJjQXhyNk41aGsrRFVxRUJBOG1X?=
 =?utf-8?B?OVN3UE0rL1dsMVlqaVpCL3ZQZzBGcTlyeEtFemhmSzBKZ0Y0OWRkS1VDSkFk?=
 =?utf-8?B?enlxZjlnSXNOOFBZeC9BOFN2cllLcHRUZXVXSUtpa1MxQlNWeG96RmM1WTJ0?=
 =?utf-8?B?SnBXR3FVeU9XTXA1djhPWW03VmhJQkFicCtqTFZjSE9GQ1gzbjNENFlnRklO?=
 =?utf-8?B?WHRVZXpnNnMyY3JnMTduaG1HTkJzajRsM2ZsT21vRU45MDU3UU9UUXphcHBS?=
 =?utf-8?B?ZWJuMzJmZVpFanBJMnNUNnYyTjErRkgydGdJcTJpQ3BtNGkwa2RFMkRsNGUw?=
 =?utf-8?B?NlE1QW1qWkdHdEVLSkJMaXQzRlVTOC96VzA0dFE3K0xUajVrZUFockZFMVIz?=
 =?utf-8?B?aHVYVmt4NjFlbXpuSUhrYUhUbzdhaDFabVdtOE01SlNYd2d5NmV0citJZTBC?=
 =?utf-8?B?b3R5S0lsbHl4TWtGWEdmZnRDc0ZsZFc3VklnT1I1Y0s3TE1UN1NhcXNKT0h1?=
 =?utf-8?B?cWRRK2NsejlOU1crWVNMVXcyYitzUGNEWC9FeTR2K3VHcXFieThQTTJJNnVu?=
 =?utf-8?B?RDFlOWNrd2N5Vk9mMVdsK2pJaDBiZkhjUVlRbk5pRUZHSmZac1czOEplWVp0?=
 =?utf-8?B?aGNhQTg1MEZvVWM2TTZlTEF4NXZ3Mzh6YlVYTXY5cVoxL1VxZzlTY3M3V2pq?=
 =?utf-8?B?alBvVll2TkVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 14:32:26.4021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca53b258-ec29-43f6-4347-08dd5fe06137
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7999



On 2025-03-08 02:02, Jürgen Groß wrote:
> On 06.03.25 23:03, Jason Andryuk wrote:
>> With split hardware and control domains, each domain should be
>> privileged with respect to xenstore.  When adding domains to xenstore,
>> look at their privilege and add them to xenstored as appropriate.
>> dom0_domid is used for the hardware domain, and priv_domid is used for a
>> control domain.
>>
>> Only one of each is allowed for now.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   tools/xenstored/domain.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
>> index 64c8fd0cc3..f2394cd6e9 100644
>> --- a/tools/xenstored/domain.c
>> +++ b/tools/xenstored/domain.c
>> @@ -795,6 +795,20 @@ static struct domain 
>> *find_or_alloc_existing_domain(unsigned int domid)
>>       return domain;
>>   }
>> +static void domain_set_privileged(struct domain *domain)
>> +{
>> +    xc_domaininfo_t dominfo;
>> +
>> +    if ( !get_domain_info(domain->domid, &dominfo) )
>> +        return;
>> +
>> +    if ( dominfo.flags & XEN_DOMINF_priv )
>> +        priv_domid = domain->domid;
>> +
>> +    if ( dominfo.flags & XEN_DOMINF_hardware )
>> +        dom0_domid = domain->domid;
>> +}
> 
> Please no use of libxenctrl. I have worked hard to eliminate the usage
> in order to enable a xenstore-stubdom being used across Xen versions
> (C Xenstore is relying on stable hypercalls only now).

Right.  Yes, nice work on switching to stable hypercalls.

> You need to add the needed flags to the rather new stable domctl
> XEN_DOMCTL_get_domain_state and to libxenmanage.

Ok.

>> +
>>   static int new_domain(struct domain *domain, int port, bool restore)
>>   {
>>       int rc;
>> @@ -831,6 +845,8 @@ static int new_domain(struct domain *domain, int 
>> port, bool restore)
>>       domain->conn->domain = domain;
>>       domain->conn->id = domain->domid;
>> +    domain_set_privileged(domain);
> 
> The name implies you are changing the domain to be privileged, but this
> is done conditionally only.
> 
> Maybe name the function domain_apply_privileges()?

I'm thinking domain_apply_capabilities() since they are being referred 
to as capabilities.

But I'll have to revisit this.  To make xenstored "just work" when domid 
!= 0, it should auto-detect its domain id, and that has to be done 
earlier than this.

Regards,
Jason


