Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDFFBB669B
	for <lists+xen-devel@lfdr.de>; Fri, 03 Oct 2025 12:01:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136506.1473059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4car-0006mi-OO; Fri, 03 Oct 2025 10:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136506.1473059; Fri, 03 Oct 2025 10:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4car-0006l3-LS; Fri, 03 Oct 2025 10:00:53 +0000
Received: by outflank-mailman (input) for mailman id 1136506;
 Fri, 03 Oct 2025 10:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=swgf=4M=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1v4caq-0006ks-W7
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 10:00:52 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3e0a03e-a03f-11f0-9809-7dc792cee155;
 Fri, 03 Oct 2025 12:00:45 +0200 (CEST)
Received: from MW4PR04CA0117.namprd04.prod.outlook.com (2603:10b6:303:83::32)
 by PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 10:00:33 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:303:83:cafe::6e) by MW4PR04CA0117.outlook.office365.com
 (2603:10b6:303:83::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Fri,
 3 Oct 2025 10:00:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Fri, 3 Oct 2025 10:00:32 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 3 Oct
 2025 03:00:29 -0700
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
X-Inumbo-ID: d3e0a03e-a03f-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzjdR+d46JXnM3CC3XJsnfU/t3sYJCySq6Q4wxv6W27QsKoWSx8U5Mgsr+sy/WPa6f6eOqbNQ1gZFRorleY8ppGnJU+TVTvaDgpNkWa4zs4u0z5tgkuJNj9O7EufGExZjdkWH18eehtf7gDtSghoMERKkKvNWREryq1T/ddim3dp8C0J2T0J06DxzJjwEbzVgUDhlUUrxUVy1526yuWPsgb74P1G/gW3vy8k9iHxysbVWJ2TMDakDSarmFuxKsbtsRm5LUhoTLRMAab5VkiYVuGjwSZWFPkkR62Ct5QdygefRoruz0+5XFX9Kt64RWJlOouhApg3p8Ohj1RzploO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9svBkBdb7PQgex93mrktmbTOkv9ikr/cj/ramRYAek=;
 b=CqvCrCLq77s+MRs0hJYLi/Bmw5MyNwys3prWcA7lVhkXayHERcrFD9AN9tMHjdF0HJ+a45EyQDYTYdvXBe4G1bVz5JhIfnW6Fkj0IHUVQHvj27ZDUL5zcGs7mkG4EkmmCptUoO0q298gxKADeXO4m9A2he5aNFPQ5j+83Lsua8VXV/+TBREWQILeYYImLEDKoYvLFxFCVE6xnL4mNQ1BEyCXz2MKMJa8VdEmmPLK/eVVShSqsV8X7gks8d3H7RBr6ffmLisLkBotFmvPycI/Nezl0ETCRjdPD2MiqOiel9VCJ4rNO51KKopFNySs5PPDnxoQJ3KY0yv7TYrDGtiYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9svBkBdb7PQgex93mrktmbTOkv9ikr/cj/ramRYAek=;
 b=Db/syVnb0NP0eYo75+0q2rlJeQ3xEBmw2NHGgIAwcSj5LtdPz249abx/gEcZ6hiYoB3zlhuAEd+H3bbHwLMeLyAl1aUEUFHmA0yd8psTeLCaiiDOIP3+Qzq79V8+aIyPGeccrqriH6WE3w88l4sbx7NPzmutdCAJddZ4EGnLDeI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 3 Oct 2025 12:00:28 +0200
Message-ID: <DD8LLN4279QQ.24LB1EV7JP2J0@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH] xen/arm: XEN_DOMCTL_get_address_size hypercall support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Demi Marie Obenour <demiobenour@gmail.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Milan Djokic <milan_djokic@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <39511522aae7dab5766ef2ebfed1d13abec8610e.1759324344.git.milan_djokic@epam.com> <bf042eea-ed2d-431e-b1f0-7be0c09194ef@citrix.com> <967b62ca-8aed-4abf-8fa5-30769f46a5ff@gmail.com>
In-Reply-To: <967b62ca-8aed-4abf-8fa5-30769f46a5ff@gmail.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfc1201-fe1b-4f12-d319-08de0263b12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2oyNzMvTXNmMXh5UDAxZTBxUVJnVkpETTc0ZFg5QUlzUitibVVhR3gvLzE4?=
 =?utf-8?B?L3ZuT3p3SHRVS2dkS0xPa3lBYXJzRmxUSE4ydHZoQXJZdXVLNVpRV2FpYUNy?=
 =?utf-8?B?UjdwNElQazE4SWtUTkluR1dPdU9mYmJrNnBoYjErR0xlZUszbUJJNExBMnNh?=
 =?utf-8?B?WWM0NUE3dnZhTDZvL2t4Rll5S001YjNLaUt3d3g5dkM0b2xpV1R0c1JhZ2xL?=
 =?utf-8?B?dnRUc1BNa1dMeDd4THVjOWZvV01Ra01HdHBvYjNQYXBua2tlaHJnMEZONG5G?=
 =?utf-8?B?b0NiTjdXNVRaRHRGSFMzNHpQVzFMbFdrQjFHdTVKZHFKWkRFUkQwYVM2RFlY?=
 =?utf-8?B?ekc1eEJqN2h3c09Nckxoc1oxdTYyZ2JuSE54T2NNVlpJYUhFRmo5RllPUUdn?=
 =?utf-8?B?bUs1Vyt5ZUtnUVhlYWNiQmV4OTU4bWJLV2lzazJqWGdCYStLRm13L2pYRGVs?=
 =?utf-8?B?eDNUTW9tK2RuWDdaM0hGZFk3RXFNOXYra3hOaXlzU1BIQXhoTkhKSGc1WldK?=
 =?utf-8?B?TGdDSWMzL0NXNThrY3hiRkx0Skxjd0RqMks3c0dVSk5tcHVLUE9BK29rQzNM?=
 =?utf-8?B?UWVBMmFjN0N5a2xTa1N2NUhQTEV1WTBFL1UzWFlMV1FMZUNIZlVVcS9RVm5L?=
 =?utf-8?B?T092RS9qR3RxTS9RN2ZXVkMxc2RtUkRYbVRERWRtQ3pQeGVmVlZzb1lFdFlK?=
 =?utf-8?B?ZldKYnFFdVdUNFNsbnpaaVBTNTVxYm5ORjlpKyttUVB2c05NQkhsdXhaZng1?=
 =?utf-8?B?aUIwMUpvbVc4MGh0MFVKSzFvbVFUTW5ZcjhJOUptSTd1L241c1VwNjNMZ3kr?=
 =?utf-8?B?aFBDUnNXSllUUFVCdFZUY3RrNVFOWFRBL2haSU9VTW5xUlRSUGxjRUZKcXcv?=
 =?utf-8?B?dkhhRDRMU1liVFF4S0p5WEVFSWwwWnZJbmZDRktmNjIvaVNyMFJVeEFhZFJG?=
 =?utf-8?B?LzB2bVZ3bGRpdlRsTC9QMXlSVlU2WnNQc2FvcUk1Nm5vczhjQTZ0UDBITG0z?=
 =?utf-8?B?cHJhS3Q2eFpYTUhLbUhlMFhCZjJPUUNEc1hmTTd6TmFrRk9WaFpKU21EVHBq?=
 =?utf-8?B?Zk5JK1pabEduZEpRK2ZuSUtLTHZxbUhuRjZoVHU3a09qMCtDcDdITlB4bnNr?=
 =?utf-8?B?VDJNNnYrTlMySUprdGdJcGhjRU5jTHd0d2EvL2MzMHVOWG9ERnFJQXgzd1JG?=
 =?utf-8?B?U2JocExoWVI2Z0V6MEVTUndZQUtvclBpVnJjQ0pHQ053TWZlL2ExaUY5d0NB?=
 =?utf-8?B?U3NYdWs3WFh3dzVhTlhWRlYvTjBqOVcvbEhRYW52YU9IcnZqQnFLc1NSR3JV?=
 =?utf-8?B?ZmJOUVMyRHYrSzZ5eVJMV0JFSHJwbzc1cTRpakQ4WW9CZUJLK1dzZW10QTFZ?=
 =?utf-8?B?TjlEVXVSRU5xWjRBY3IwSlhFbWN4RWVicHMwTlZtNGt2UlpUeGhqZm1pcmNQ?=
 =?utf-8?B?dFNCQ3lqaHlxdGxYZ3hDQVlBUnYvMWZqWlJ3a1Y4NGIrNURJOXlHWkZQbFNV?=
 =?utf-8?B?VUQ1ekFJSG9JZGNDcU9PZm9KNVpzRE03bXdoeHBsYlhQUS9jYkpENlFuYXJY?=
 =?utf-8?B?bVVCTllVUTJvVjh1TE5LR0hDVmlmZlc0eWl1b252SkhyWkRUSWI2WEtvNXlF?=
 =?utf-8?B?VHdzcDA0MGhrcEUvWFNsSm03U2pLMG0va1NzVFQwOHRUU1lnbjRWamZsa3d5?=
 =?utf-8?B?RUNWYWhNSjlGTXlGSkxKVFRQUUYvTTBGWVVlY3dmY2YvWlNjUDBWekZERGx4?=
 =?utf-8?B?b2VnQVB4K0FYVnRHK3JUNm0wQzIyTGV1aWpxelhxbnlnM1JGMVJEY256WW9z?=
 =?utf-8?B?ZVgrTjhKcE1vSENNd29hRjh1aC9hT2w5Ymx5d1g3aFhaZ2FYVXBIVDJpVlNr?=
 =?utf-8?B?UnZaWVZwYlBzNVg1dHlkK1VNeS9FclVNUGwxU0lsaFhxWE5rWks1VFVUaVZr?=
 =?utf-8?B?K2l3SlFMZGY1RGRabVY0WkVKL2ZhYjhUY1FVaURlRzdsWFFBT1paMytKK0NO?=
 =?utf-8?B?MlVGUnhiWTlhMXp6c0tsZ05lc2FQakhWTGtQUWo3bnFXRzl5djNPUUxmY0M2?=
 =?utf-8?B?dGlhR21TdDlzZlIwait3c1lHNXd2dS9ybms1ZmIwMUd6OGY4ZWRXTlJWVkpz?=
 =?utf-8?Q?oefE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 10:00:32.9493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfc1201-fe1b-4f12-d319-08de0263b12e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859

On Thu Oct 2, 2025 at 8:27 PM CEST, Demi Marie Obenour wrote:
> On 10/2/25 06:10, Andrew Cooper wrote:
>> On 01/10/2025 9:01 pm, Milan Djokic wrote:
>>> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
>>>
>>> ---
>>> XEN_DOMCTL_get_address_size hypercall is not implemented for arm (only =
for x86)
>>> It would be useful to have this hypercall supported for arm64, in order=
 to get
>>> current guest addressing mode and also to verify that XEN_DOMCTL_set_ad=
dress_size
>>> performs switch to target addressing mode (instead of relying on its re=
turned error code only).
>>=20
>> Please don't copy this misfeature of x86 PV guests into ARM.
>>=20
>> Letting domains be of variable bitness after domain create leads to a
>> whole lot of bugs, many security relevant.
>>=20
>> 32bit vs 64bit should be an input to domain_create(), not something that
>> is edited after the domain has been constructed.
>
> Does this mean that Xen guests cannot support multiarch?

HVM/PVH x86_64 cannot not be multiarch. All APs start in 16bit and proceed =
to
32 and 64 bit mode, in that order.

It's only PV that has fixed bitness.

Cheers,
Alejandro

