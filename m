Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D193B9B911B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 13:26:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829073.1244146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6qjP-00078G-Ae; Fri, 01 Nov 2024 12:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829073.1244146; Fri, 01 Nov 2024 12:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6qjP-000766-78; Fri, 01 Nov 2024 12:26:23 +0000
Received: by outflank-mailman (input) for mailman id 829073;
 Fri, 01 Nov 2024 12:26:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TvYI=R4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1t6qjN-000760-VI
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 12:26:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2417::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c309363-984c-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 13:26:15 +0100 (CET)
Received: from BYAPR05CA0099.namprd05.prod.outlook.com (2603:10b6:a03:e0::40)
 by CY8PR12MB7659.namprd12.prod.outlook.com (2603:10b6:930:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.27; Fri, 1 Nov
 2024 12:26:09 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:e0:cafe::f1) by BYAPR05CA0099.outlook.office365.com
 (2603:10b6:a03:e0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.7 via Frontend
 Transport; Fri, 1 Nov 2024 12:26:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Fri, 1 Nov 2024 12:26:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 1 Nov
 2024 07:26:07 -0500
Received: from [172.25.149.172] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 1 Nov 2024 07:26:06 -0500
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
X-Inumbo-ID: 7c309363-984c-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNzo6NjI0IiwiaGVsbyI6Ik5BTTEyLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjdjMzA5MzYzLTk4NGMtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDYzOTc1LjI4NjE4Nywic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REOjUOVCWNOHYkAoreqQb6SzeL/NJwJG4vuUb0KmyzPcKz+wbXe8OhDz8vp6TMFhWaMYLUeJu4JXYW7B7dTgoyEGRNmr0EPOhLTEzru6DUM+6FdfGpUun2kH4BNt1FBMJvO+3Aku2qoP6r1XsLwoTWg8ZQr/IPjkfp0B0NXu4JATyTK0xij25OowzLAOgSvhgLDfBebXOIVCMTRHVG6lwWL3+ZsRz5wRy0FDbKqN/WTEPUryQDKa2xSre7AMIJRsNjVwNnC5Xu9A4JUwH6Z2j+iAH1hR6XKJYwcGyxa5Jp/5qfJSR9AwohmSu70ExEokJyyitYXG1D4d5QJjGcoqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99ZIF2UsAwjNyyyA85FKYo4ITFo/cSb3IKUIFn0qHxE=;
 b=dZaSdKOUZr03YaNPA5WA3sKHTlyFOVRKk3eMRACHh3i/wYnK2nNyZECB/RtV0Ha4OLccVScXyTgCXqrtIjcBSz4IFo3dtr3evT+OrL51+KjkwZA1tnrq3Nd4H9QCNstdp8Jo88ALkJ1I9loZIAfAjw/ZVgTQzTPUcVmo8fLuRN9ihA1pbxNEvsMwjgVa1ORili0Zvpg7caKv6Vk882+2yzH8VlNf1gWgYWNgnnGetoJdCrGnvMVWWGGDMn33jdQQy0uTviwQMD/tVnMTXnBCqMpw6tD0dcvMPI37xE6ihld+n+H3wx9IK/trgBE0EymK9si03bl13vW753yJg7L69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99ZIF2UsAwjNyyyA85FKYo4ITFo/cSb3IKUIFn0qHxE=;
 b=AdvsYrHLHelQ03GG/19TdINWCUrURAj9X7TCHwBiJjC27AMPrwiwby5kTgmO3N4bC9oRDqt77yX1gEnS8FoEni+mM070BhcGM8VspTmKI/iMfxjmXpzkJQ6pXLvUbmLzQO3Yxzi/+/eX5mL663Yt6wPB0YSgeSVh6g3rx661j0s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <33fa377c-2e23-45e3-a2a1-fda3097c4801@amd.com>
Date: Fri, 1 Nov 2024 08:26:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: Refine git-checkout.sh change for different
 branches
To: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Julien Grall <julien@xen.org>
References: <20241031134702.2913536-1-andrew.cooper3@citrix.com>
 <5d8f492d-6fa0-434d-8d01-f28376ed20be@citrix.com>
 <alpine.DEB.2.22.394.2410311543430.2525410@ubuntu-linux-20-04-desktop>
 <79c9b208-05f2-4520-80c8-930ef5cc4b5a@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <79c9b208-05f2-4520-80c8-930ef5cc4b5a@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|CY8PR12MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c594d5e-e014-49b9-b423-08dcfa705d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mit5RXN2R2JsNm9uMjc1eE9ObGhKcGljYmZQQkhYVXBJOE1MTnlXdEVQUDJW?=
 =?utf-8?B?cWJVRHRoV1NTUldhVlYxN1VEc1JtNFJ4NS9PK2wzTU1VeFJZNlVoMXdzTytx?=
 =?utf-8?B?YU8xTlFCVVJCbWVhd203N2dsdFlxMXBQVzFpWHhKNTIyK0lyOUZmZkV2Q09U?=
 =?utf-8?B?clYwMzg4eEpRWFZ0SnBuZVFjMHlTYjlNTGl4ajJQbzJhSlpCcS9vaUcxTjZL?=
 =?utf-8?B?TDJPM1VhQ3FCWG52dnV4TUZiWFA3OGtIb1dTQTRnSm9lMmZuSTlENFdMYkRz?=
 =?utf-8?B?VGdkWmQ4NXV2bXF2emxrZyszMnM5a2M3VUVaNkgwbndEVFYrTERpYW80VmVt?=
 =?utf-8?B?QVk2c2Z4b0tGSy9ZQklicTBXeWh2eFlGTHp4N2NPSHJ5WU8zRHNWMStGMDJt?=
 =?utf-8?B?RG52TlpBZElMa3FFYTFXUW9FLzBJSTFGNVVqZGJhQUU3TVNZOXN0UjQzQmYz?=
 =?utf-8?B?bDkxTG53OC9SLzEyQVR0NTlES3FXM1dzd1FDUHhMYkc3T1ViT01yUXh4Mnhl?=
 =?utf-8?B?UzlVeGFZMjFvcHg2dWw4L3ltSGF5dmtrdkEzN0F2SmxMaHZuaUt2Z2orQjNn?=
 =?utf-8?B?TGErSTE3akxJb2xmaHhGN0xQMDZZd1pPUndJVXF6ZzF1M1NZMTF4NzFxZlNM?=
 =?utf-8?B?cEkzcHV5eWRFbUNER2hHZGt6QjQ2dHNDT3FqMUo1bWFzdzNSMlpmeDhTdGhi?=
 =?utf-8?B?UnRuQVYzQkZQZHFubzFMUlFQRlkxYlZJUmREQlZDSmo0ZU5UbHNkZzJwQ1dL?=
 =?utf-8?B?bEdUN2hoSGRYUHR0OHZEOE1GcTFJV3FiYjJ5ZndmT0x5TlVlTGZJL0IrN1RO?=
 =?utf-8?B?Ny9oUFB3b05xdjlCdFhvclRCSmVUNW1OVDlGeGZuemUwcmZ0SmRFVnY2emth?=
 =?utf-8?B?T0VFL2tzV2tmZ2FOVFJPWXRjbGpxWnRSMzVxU0ZnN1JZRXNLemJwalROL3hl?=
 =?utf-8?B?WURRc0JnRXpjZmlWT0xLdTZnTU12OVlzNDNiL01vQWhpRDlBL3I3RmIzbXZ0?=
 =?utf-8?B?YnZNS1Iyajhya2xXZXRPam5rYmhGS25mR3Jvemh5UVA0ajNSblZtRkIxWHJT?=
 =?utf-8?B?VVRwUVYxVGllREI0eWpKRmFhYnhqUTcvTHRDdyswRVQ2YUlpV1hsMklWREEz?=
 =?utf-8?B?Ykwwa08rVEVwWDB2VVY1RUJMckVQd0lVa3RBdW9VdDJKdjExZks2RkNtL3pN?=
 =?utf-8?B?c3FyT2ozUnNCRytJREs3V2Z3QlIzaE5aSTlzMUIrcGQzSWdKT3NaMWNhVGs4?=
 =?utf-8?B?WUdlTzdxUjhpREo3Z0NheWVXSUtObitybGwwQ0NUSjJGTGdUa3BtQlArMG0y?=
 =?utf-8?B?Wk1Jc1pNTnBYSlZNMzcyQkNvOGw3RlM3bkZjVVpvamtJM3RMU1A2Q3ZhOFFo?=
 =?utf-8?B?QU9RVlBEVkpEUExzbjdWQlVCZlArN1BJT2YzOFdWc21QZmowZkJTWG9vREFk?=
 =?utf-8?B?Sm1LMzhsallUTzNEYmh2V1kxT1p3YkVyNTEvZ25GaVFXUVhlQUxpTVhrV0J2?=
 =?utf-8?B?c1FaZXAwWEJQWTBrTnZqdWg0T2pxemJxdklkcWlnNzJDUG1rRG42andRTEI3?=
 =?utf-8?B?bGZ2a2t3Wk1PL2V4a0p4UVQ4Z1h0S2RMSGZlSVpIVDkxeENnMU8rOWdVeGdt?=
 =?utf-8?B?NDBIYmZPZ2RqYnNnd3MvaDVMSTIzQ0RjUE5Ia0p0Um1GTkozWE9meDd0ck4v?=
 =?utf-8?B?S2tiZ1luS0xXT0lmMkNsRFpVUW5GYmlvT21EMGZST1M5M293T3JsWTFrQWwz?=
 =?utf-8?B?RTBZK2lYMTY2Tm9tZ0syd2t0bGNQWU8xMVdUQWw3ek5pOWdIYVArb1NCRnZP?=
 =?utf-8?B?YkNRcXlZVVpSN1lBdi9aRnNNY2pEUGdGZXNwQWNidTVMSWx0cGtjb0JFM2Vj?=
 =?utf-8?B?VVQxdlp4S1AwUGZ1dWpZWDFRZ08yLytTN2IzSVJrU25PS1E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 12:26:08.4435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c594d5e-e014-49b9-b423-08dcfa705d28
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7659

On 2024-10-31 18:52, Andrew Cooper wrote:
> On 31/10/2024 10:44 pm, Stefano Stabellini wrote:
>>
>> On Thu, 31 Oct 2024, Andrew Cooper wrote:
>>
>>> On 31/10/2024 1:47 pm, Andrew Cooper wrote:
>>>> The change works for divergent branches, but doesn't work for explicit SHAs.
>>>>
>>>> Instead of passing `-b $TAG` to clone, explicitly fetch the $TAG we want after
>>>> cloning.
>>>>
>>>> Fixes: c554ec124b12 ("scripts: Fix git-checkout.sh to work with branches other than master")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>>> CC: Julien Grall <julien@xen.org>
>>>>
>>>> Speculative fix, pending CI:
>>>>    https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1521847529
>>> Nope.  While this works on staging, it breaks on 4.17
>>>
>>> Back to the drawing board.
>>   
>> I am not certain about this but maybe we need:
>>
>>    $GIT fetch origin
>>
>> without the $TAG
> 
> You need the $TAG to guide what to pull when it's not a parent of master.
> 
> For real tags (which live in a global namespace), and real SHAs (don't
> need any further reference), creating a branch called `dummy` from them
> works fine.
> 
> The problem for branches is that $GIT fetch origin $TAG only updates
> FETCH_HEAD and doesn't create a remote branch of the same name.  You can
> do that with $GIT fetch origin $TAG:$TAG but only if you know that $TAG
> is really a branch in the first place.
> 
> Which circles back around to the original problem of not being able to
> disambiguate what $TAG is until you've got the whole repository.
> 
> I'm not aware of any way to ask the remote "do you know what type of
> object $TAG actually is?" and that's probably because it would be a
> reverse lookup through refs/ to figure out if it was a branch or not.
> 
> I'm sure there must be a way of doing this...

I'm not clear on the exact problem, but can you just checkout the 
FETCH_HEAD:

$GIT fetch origin $TAG
$GIT branch -D dummy >/dev/null 2>&1 ||:
$GIT checkout -b dummy FETCH_HEAD

?

Regards,
Jason

