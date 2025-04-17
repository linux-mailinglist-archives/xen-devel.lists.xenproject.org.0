Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC759A92280
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 18:18:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958243.1351164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rwd-0000ub-9Y; Thu, 17 Apr 2025 16:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958243.1351164; Thu, 17 Apr 2025 16:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rwd-0000tA-6L; Thu, 17 Apr 2025 16:18:31 +0000
Received: by outflank-mailman (input) for mailman id 958243;
 Thu, 17 Apr 2025 16:18:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5Rwc-0000so-AS
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 16:18:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20626.outbound.protection.outlook.com
 [2a01:111:f403:2415::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9833cbd0-1ba7-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 18:18:28 +0200 (CEST)
Received: from CH2PR12CA0018.namprd12.prod.outlook.com (2603:10b6:610:57::28)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 16:18:23 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::a1) by CH2PR12CA0018.outlook.office365.com
 (2603:10b6:610:57::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Thu,
 17 Apr 2025 16:18:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 16:18:23 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 11:18:22 -0500
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
X-Inumbo-ID: 9833cbd0-1ba7-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1m4qDUjPruf5+T101fbVr5Q+T3nUSYsTlp3MAkoUBTN0/ywhq0AkAhhf1QQKSQ4sbN0SDQBtbntH1+nPZ0MEoiDPC9duvzcbf8dZ67ULmU9wcxZc8otfIEvKJFwWlJl16D9tioVPNfeI8+G84o+0OtUcoG0Fq3YJBkNcwHLaGsd/qJMYGYjGcTISo0YD0CQRbhZ9A/DqY9ZSu9PwLSDFxZiSDc8iUOQEniEFLmbORo+6wbLpoqNIqqPLLexQIhZa+3sYbRrYO3FPbHTplKBsQ+Zi9iFyXyELJ5RkOQL/bz0LhwfpSuPrGUqskXjne8rN6OnUm29V7l/DCeHdSFK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqCbXDOhyYZqP0FVhkwa4twXGcbYC2FGjV47Wm9R0Ho=;
 b=OwNDur63IiWkylBUb2Y/7INUxpLCtpVWcVFH6x1oDdC+7wI++p2aMOllubVfQSPaysDXmPgHifWk2a9UsmAHgP0Y1LPgkRwEcmWCPo3CYpkjN2pDxgmkGqU+X3XD0Nz01URjevibu30IG/U0stPW27cNSuM6g1gjPPORgmN5FzejFeWqifvHBpge2D8QTLUFDW6dSUjO5IPM8F+yETadpNsNwupgneGRxZvPVM0+37T9Mk8lrgWGY92KnTzBughWGOgtcRgfCG1h+m0bQTlXpHQUzNnW68zbXw13qp5W0nR6rJIz502ZMsoi0+/6vt8bsTWHG+JeNH8PW7Xa1g3LsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqCbXDOhyYZqP0FVhkwa4twXGcbYC2FGjV47Wm9R0Ho=;
 b=zDpixFybJ1Z0izcqMYjtlKGkVnd3CsPCiBnnfvYWZLQVNyUU/hEVZJi+RHsbEIDl+GFABS5WivJYjEC6V7Mckl6AgGMwetvoj7m0/HhivgzEaDsKEJrRttSch+df3ltJgqkV6mm0D8xtfV21tpKopRllqkn6+riHq3ipMArsh/c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 17 Apr 2025 17:18:20 +0100
Message-ID: <D991SW75LNIE.1QUE1HVLCS7W3@amd.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Michal
 Orzel" <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 02/13] kconfig: introduce domain builder config
 options
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250417124844.11143-1-agarciav@amd.com>
 <20250417124844.11143-3-agarciav@amd.com>
 <6b7728d0-0464-44ad-8af6-e2816e83a2a6@suse.com>
In-Reply-To: <6b7728d0-0464-44ad-8af6-e2816e83a2a6@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|DM6PR12MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: b6fa2246-1d5e-4958-4816-08dd7dcb7a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blU5V05DNExkN0xxbzJVZzhlSWZiUHc1UkZ5bGdQd1ZFMThKVWt6d3g0WWdY?=
 =?utf-8?B?ZmY3OVlsWWdVZHd4QmRjTHRQYkd3eHBrNzNFeUg2REhHZjU5UWNYRUxUdENC?=
 =?utf-8?B?YnRqZXRsOWMvTlo3di90RFBRTXBjVXhUSjZYb0wrY3IxVW14MkhqWU4zMTdO?=
 =?utf-8?B?MWx0MXpXbFZ2NENaQXhldDRIa2JPVElJL1NDeHNpSkNoSTZheFFLSHdtM0hr?=
 =?utf-8?B?UTdGcG11L2pUREd0TXhDMzNac2RhekUvdFJRdnNJYWFLbTRXd25wenFaYnZZ?=
 =?utf-8?B?QkJtSTZUdlBSU2IxWEpvSEQxNFc4azlocU95amxkRUNGd2o3alY2U2ZCM1lO?=
 =?utf-8?B?ZnoyaS9leWpMMmdOa2lHMVpySU0wZG9HRUx4NkhHUDA0Q2kxOFUrSjBHUnlB?=
 =?utf-8?B?MVRIU1FZN1NURVNwZ2Z0by9HWGxCMU02MnFhVHZGS09GMldrK1p5MDJYUnBr?=
 =?utf-8?B?RjJqQVo5RHpwU3FwcXN5Y1NnaGpLcW44NkNXeVQyVFM2bTZRWVhaWGtRWksw?=
 =?utf-8?B?NnA1UmVUenI2NmlGd2djc3ByMzg2NnR0MkFqZDArVUhSSzk1TXJsa0VrNDhP?=
 =?utf-8?B?QkNRY3BUTU9NVDNYNlA4cnBQckR5YVBLa1hXSnduWjI1RWNsUFQxS0pCUFBE?=
 =?utf-8?B?SnBMZTZVRnJWZUxrbkhrM2FIdUp0Y3JiM09CVlBGbEJKRzJPK0wzUDB6djFS?=
 =?utf-8?B?UjdERTFrU3dqbU5LK0dlUVc2aGZxMTFnRE5zd3dVQ01BdWpRMXAyU2w4eE41?=
 =?utf-8?B?RDNZdTJCbkpuQTFCYys4WGgyT2JSRGNYb3pab1pERUFDV1lSbE5rWmE4WW1W?=
 =?utf-8?B?bHRnbTE3UlJ2NllCOTRZUjRqQi9RR3ozeE1TUkt1emtqSVdaLytrQWwwbFFR?=
 =?utf-8?B?MXF5bWRucGZ3bjJiY2RUekhZVXY5eW9WWGNZNXBhcE5DaGV2MmdTWXNiWk4y?=
 =?utf-8?B?TTR1SVBGTGNpdnRiWkU3N3k1bXBYRG9BMnNKNkM2QlQ2dmdaVWpvVHFlYmhX?=
 =?utf-8?B?VXo5dlFHVUk0T29PdzNnK2xiU1ZJQnp1WVdISU1WamxPcjJkSkhiZm5OKzBj?=
 =?utf-8?B?S2RaenRsekJDUnpZOGxoeUhiWlFKVlFacEJtYU9lNWxaRUQzcXEyc0E5cFpJ?=
 =?utf-8?B?QzhqRnZiN1BNR0JkYXp1OVlpeG54dWR6bTR3N1BpQmRGNS9LVUxiMmtnZXo5?=
 =?utf-8?B?T3VLLytBbHhNTm8vaUFack1iSTRLVEEyMjE0R0NhdVVLOHF0MS96c1JhOGV6?=
 =?utf-8?B?ZkhYaEFXdEs5QmtZSmdCQTJ3bDlZN2UyUDB6Yk5mQnlPbUlTZm8zb3dmK2JY?=
 =?utf-8?B?bXhDdm50WlRZU1Bqc2lPS3BHeHA4TitzbGJFc2lTcTNuY0daNDJSVUp5R3Bu?=
 =?utf-8?B?SDdDU2RWTUVTVS82V0o4eDlncVZqK2w4N1VWRzVPZUZyTlY2U0x1ZXIvVUpW?=
 =?utf-8?B?WlRFVU1ESmxOMkpaVUo2ZFBBRXUwZnJnR1U2U2toV0YxcWRscU5uRmtuZGt4?=
 =?utf-8?B?Vk5MSXd3cWdoK1ZBWWZHYmhNQmg1bDlqY2hNN2tLQjhEaTV2OGg5ZysrNWtp?=
 =?utf-8?B?Ykd2WTFVN3hpS2s5cG1LbGNmaVh5UHZOaGFBYVNXT2JlYzhEdnRKWEd3ZVhk?=
 =?utf-8?B?MVRja1BvYlBHcmM0VEdGc3RIcGo3TlkrcENxQXRlTXVSbnQyTXlBTnVTNUhx?=
 =?utf-8?B?V3gyWVNrUkZiMk8xZG8yL21BRm1PR0dDVDF0NEZnN2lwRjMrZnZpVTdCUWk4?=
 =?utf-8?B?WW9mZnBsdVZJWThVN003UkZLZkhVSEhCS3czWHN1eWdPdkpwVWphRVFIT1pO?=
 =?utf-8?B?WXMvLy9EN3MrV3dIeEVOUkRxYUU0VWJ1azUrbzNvWWJsT2swdVNBUVkwK01w?=
 =?utf-8?B?ZGYrSVFDQnNjaE9JZmdQVzlhVE5ZT0UxOG92NnBMSFUwbTgrUVU2aWt0N1NI?=
 =?utf-8?B?ckkrUDlLM0RKQ0RETzJYRERDa0NrNnVQcFRHaGJRdWJIT1lNVWFqQnVOaEtp?=
 =?utf-8?B?NlJNTytuZ0dXWERYOU8xMVhiZVlRKy8zclJwT2lYRjBrNkdNemQ5ZnRDMkV2?=
 =?utf-8?Q?ref/6U?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 16:18:23.5770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6fa2246-1d5e-4958-4816-08dd7dcb7a13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138

On Thu Apr 17, 2025 at 4:00 PM BST, Jan Beulich wrote:
> On 17.04.2025 14:48, Alejandro Vallejo wrote:
>> --- /dev/null
>> +++ b/xen/common/domain-builder/Kconfig
>> @@ -0,0 +1,18 @@
>> +
>> +menu "Domain Builder Features"
>> +depends on HAS_BOOT_INFO
>
> That is, what's going to further be added here will not ...
>
>> +config DOMAIN_BUILDER
>
> ...depend on this, but just on HAS_BOOT_INFO? Seems not very likely, but
> I'll be looking forward to learn what the plans are.

CONFIG_HAS_BOOT_INFO has nothing to do with future plans.  The domain
builder is tightly integrated with the boot_info infrastructure and
cannot be used (or linked) unless the arch-specific definitions are
present. It cannot function without it. And this movement from arch/ to
common/ forces this new Kconfig to gate core.c on boot_info existing
(because it's in asm/bootinfo.h atm). I _COULD_ also move the boot_info
elsewhere, but without a drive to actually use it, that seems a bit
pointless.

HAS_BOOT_INFO && !DOMAIN_BUILDER still links core.c, because that
contains the common initialiser for boot_info.

>
> Also, if the entire contents here is to depend on HAS_BOOT_INFO, can't
> the "source" line pulling in this Kconfig be put inside "if HAS_BOOT_INFO=
"?
> That would centralize definition and use of that symbol to a single file.

Sure.

>
>> +	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
>> +	select LIBFDT
>> +	help
>> +	  Xen has a built-in mechanisms to automatically construct domains
>> +	  (like dom0) during the boot phase. The domain builder is an enhanced
>> +	  form of that mechanism to enable constructing predefined domains
>> +	  described on a flattened device tree.
>
> I'm not a native speaker, but (perhaps because of that) "on" here reads
> odd. More logical to me would be "by" or "via".
>
> Jan

Yes, you're right. I just felt the previous help wasn't very helpful
unless you knew in advance what you were toggling. Jason's more concrete
suggestion in the following reply sounds reasonable too, so I'll just
copy that on resend.

Cheers,
Alejandro

