Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E621CA843B5
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945642.1343814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rOp-00061w-Uj; Thu, 10 Apr 2025 12:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945642.1343814; Thu, 10 Apr 2025 12:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rOp-0005yd-R0; Thu, 10 Apr 2025 12:52:55 +0000
Received: by outflank-mailman (input) for mailman id 945642;
 Thu, 10 Apr 2025 12:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ged3=W4=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2rOn-0005y7-Lg
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:52:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2416::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4b1552a-160a-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:52:50 +0200 (CEST)
Received: from SA0PR12CA0024.namprd12.prod.outlook.com (2603:10b6:806:6f::29)
 by PH7PR12MB7116.namprd12.prod.outlook.com (2603:10b6:510:1ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.28; Thu, 10 Apr
 2025 12:52:43 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:6f:cafe::f3) by SA0PR12CA0024.outlook.office365.com
 (2603:10b6:806:6f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Thu,
 10 Apr 2025 12:52:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 12:52:42 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Apr
 2025 07:52:40 -0500
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
X-Inumbo-ID: b4b1552a-160a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gG4xWCYhzGIUtATGjEwADUmbFUkLoqhK+lgM0aAh0dIGwfRwE4nXEa+dzxbt/QLnJS7SC7NclRdb8egB6jAYaomr+WeJSPbBLMdAsVUmcItWTyYLHHTZPkx375iJXOHIeVP6aC7fENPFMO9oSv5OiW9a35w5tsGdITcg3kNNNfFzzR/cM79WcsxXzDhTI8Yiym6hGC/y9wVibCAySPnWbr8mVLTv/fvkhdmlMWNPbZcfJkZ9rpkh99IWj7sOMujtg3+jua9MKdXGQCETHCS0kLuKQYxGH1gDjvkEarCR1w0CDwZw7onK2+F8YG+0H9jby7odi7yOq+i33Ka+OYG0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lI4Kld3KQgnBHa/b/bXDDUfEGbeU5VcJ1fbGWpimjCA=;
 b=Gc8wKUk4TXth99s3kd7GPDIKZqoyCRa6GDfdmeVLGrADDKw4WkTXFDo+btQVpmmJzgBax4RpVtVDDE1G26OCbEZIQsIgUvhXjcqUoIfXOAxDvoclqHlR9i8UsJnlkVTUgsJLLLsNhpfk9vqqHNDMH4wggzYauyrtmYVYqjJ95PYRhHuIFuDMvWnLzqO91pPuxuAC7c4nVysLCeEfcrR5iwCh3g5MZV5Mfqiw1Noy+Vfl0UFgWU7VB09rR1v/K/dQgD06SFrY9L17IG2rEYceZ5V2LIcHR+6dORICS8pRlajtnAu2MYhLqabCUJCLR3fmoxdNo7QGyEYcFjy0RTyO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lI4Kld3KQgnBHa/b/bXDDUfEGbeU5VcJ1fbGWpimjCA=;
 b=LfM2Nk/vIpwg2kz+cxFi0FzMLC0/GU2B5c8UaC9Hrw2J7EtIPsuWFabZudDdq/PQZ0mQNYHYxXDwyoulf2E5E+C2oVhQ+B5WuiieDP8HkxMy1Rl1/VHTBv0oRCIUJJT+1GrcktaDwXSfqshSN8zmK/mrkroRANQ/I6K7LHypWeU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 10 Apr 2025 13:52:39 +0100
Message-ID: <D92Z1LECR2VA.3FW5H7ZIRVXU7@amd.com>
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 05/16] kconfig: introduce domain builder config
 option
X-Mailer: aerc 0.20.1
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-6-agarciav@amd.com>
 <d61f5fbc-8e28-454b-9931-c267d67cb491@suse.com>
In-Reply-To: <d61f5fbc-8e28-454b-9931-c267d67cb491@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|PH7PR12MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 672fa18d-69d2-46fd-5d55-08dd782e9522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjVtZGwvOUpISU1TQWx5ampHV21PMi9CSXlrTmh1ZmJGOEMwU2xIWjBROXN3?=
 =?utf-8?B?T3BPNkNTNDRXazZMS1lmVi9hTGwyTUNOeTV3M2JmckVQMkk1Y0FZeTZSZnRZ?=
 =?utf-8?B?Uk9meG5ZMjZUc1BjUzEzOTlZc1MzRnlxM29laE5qMndjdVROLzZnMElDSHBu?=
 =?utf-8?B?WWMwY285blNHeGpPcXRTTmJvT3FDMlRIN3JSdjZMMnlyR0trcE9SUUZ2Zjl3?=
 =?utf-8?B?dHByUGNpWHFQTmJoTWVSd0s0a1hNcWdFK2I0T3J0Z1NPYnk1UUlGWm5Kd0Mr?=
 =?utf-8?B?VHlqSlE2SEx4WVhlb2JpTyt6R3NvMm4ydVllbzhob0svcmduWTNKNVR5LytX?=
 =?utf-8?B?bXdsNHJ1dGsvb09HRTd3LzdCaXZ0WjA5QStCRDN3c1BWMDFIdWdIUnNpVmFn?=
 =?utf-8?B?RG0yTStRak9kZjkvQjV1dXRJalg2VGt2cWJKaVFFVTdpSmNwTE5PNm5xUG45?=
 =?utf-8?B?SGtCTXFtQ0lDcThONDdjTEx6a0xPQjg3bHViWGZqaUp5QmNFc3ZmUmlwSjIx?=
 =?utf-8?B?MituRy9jMklzL0JTUE5CamtzbVlqMmJkUUdQMlBzOHFtU1dQZWZnb3U3amR2?=
 =?utf-8?B?YU9OVll2VHU2UkttdEdBVS9OR2IvMlA3c2tqQWxZam9OdGNLMzIzQnVjTDdY?=
 =?utf-8?B?WUtBUmd5MmpPUldrNDcwTmU3Ni9CdTVKb3BKK0V1Yy9XcmUrMmZKU0lsSW5Y?=
 =?utf-8?B?eFM4d3VIaFpnOCtNSURId0ZrckxLam8zZzVPUUdCN2dBcXpwRHRKVVhubWpO?=
 =?utf-8?B?eTB0Y2RsdXMwbi9yVVk2ZC9PMjVabld4MktNeHZzT2tNNTc5WkRKQkhpSXZU?=
 =?utf-8?B?V3ZLNVNPUkZRYzg1cW1mSllPaWtTRXQ5QUZvd0tENlZ2T3RUa0ZncDYvZk9Q?=
 =?utf-8?B?aFBwMW1WeEh2bmdvanJLc3lzWlhaNFhhRTl2QkVJNEJmQ3FBakdCeGJjWUht?=
 =?utf-8?B?SUxyNlJvdTVRNlBuVThzbEMxMzE2Q09lYVk4MUx5aHpaUnFGMUREeWorRDJH?=
 =?utf-8?B?N0xzclZBdlE5U3lGeFJFZVVqOHhkRkxBdElWMG1JN3NtUmFBaytXaE8yNjh2?=
 =?utf-8?B?c1RTZFZ3Qy9EZVV2c0pIL0MwemhrRHpvaWsxN3VqT1VWbHRSMHRqNnhQOC9T?=
 =?utf-8?B?dGNBeEpDM3ArWkh5SzVpUW84YjVkVnlPdjRldkJweUZPWjRXUHpGR1VWRDBk?=
 =?utf-8?B?bFc3eEZqTGlORldMeTFFRmZjaWkwa09GbkJxT0FtNFMya0ZKclZKZWRyVWtm?=
 =?utf-8?B?VTVWcDlZdVlTRmdmb2RabUxrTjhQVjB5c0ZWMU00aTJTTWpmTFJjOC9vTmVr?=
 =?utf-8?B?WGJpdEthVE1IRkJwUUFQVFRUYTNSVjBJeHhKeXdrZUJDWEpUWit3azNRenhO?=
 =?utf-8?B?Y1h3RHVRR3ZZQS9iVCtod1hLcUxjN1ViRi9vNEw0blQ5ZlpXanRGZk9kZ1JM?=
 =?utf-8?B?VVhCTVVWbDllZ1hkVUU5ajI2K0draitLUy9JdGc2Wit5Qllkek5EbUppcExJ?=
 =?utf-8?B?cVNXT0lwRFJYakZZckVERmZZQ01UU2E4TFMzbUxpQ2R0TFkwS25NelBlcHN0?=
 =?utf-8?B?NjZjVnJlaDBxZklpOUU0b3Iwb0s1N0ZxZkp0Q2RrUWUwbWU4QS9INFBURHlW?=
 =?utf-8?B?WHFUL21lTzg2ZExkZE8rUUJDRmlFN0VLZXJrV2ZyenhqcVp3VjZkWWt4VHFs?=
 =?utf-8?B?N3gwQ3drdkduN0MzL243eXBLdUtHUldVbXA3QjRKTlNJQWVSZjdwVHZYVkU0?=
 =?utf-8?B?dkxkRDBucVJCb29nVEs5YW1LR0lyTThwelpyS0RUS3J3SlBnakZzUzJzWmds?=
 =?utf-8?B?OStHcGVnTXpFSHJnR3g0SFZSWDlEUzJJY2ZEaWR1RldSZjUyMmQyY0x1OVBp?=
 =?utf-8?B?aU5TT042aVIyVnIyZnpTTE02N3RQcVJUSWVTc3Q2a3FtMWlxcFp3cFBwVkZZ?=
 =?utf-8?B?a09QUU1pQ3RlWEFWZXlvSVAxK3FhQWYvU3lITVpHaUlNU3JEeEJ4VGg2QzEw?=
 =?utf-8?B?WU5CN3dreEVjaUR4bXFJTDh1YWR5Y20zeXdNSE5KY0FudkNYRVAxZGppNTZN?=
 =?utf-8?Q?PHPk3o?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 12:52:42.1739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 672fa18d-69d2-46fd-5d55-08dd782e9522
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7116

On Thu Apr 10, 2025 at 10:08 AM BST, Jan Beulich wrote:
> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>> --- /dev/null
>> +++ b/xen/arch/x86/domain-builder/Kconfig
>
> This really looks to be the first patch where it needs settling on whethe=
r
> all of this is to live under arch/x86/. If it is to, the reasons need wri=
ting
> down somewhere - maybe not here, but at least in the cover letter.

I need to think about it. I haven't yet reviewed all the history about
the series and the related discussions on the matter. Moving this to
common code ought to be simple enough, but merging dom0less into it
seems like a pretty big undertaking. Presumably you merely mean the code
location and the scope of the Kconfig?

>
>> @@ -0,0 +1,15 @@
>> +
>> +menu "Domain Builder Features"
>> +
>> +config DOMAIN_BUILDER
>> +	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
>> +	select LIB_DEVICE_TREE
>
> Was this meant to be LIBFDT?
>
> Jan

Yes, the next patch turns it into LIBFDT. I spent more than I should've
wondering "How does the final series even work at all?" before looking
ahead and noticing this select was adjusted on the wrong patch.

Cheers,
Alejandro

