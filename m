Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8987AE3DCF
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 13:23:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022271.1398056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTfGZ-0007fE-OY; Mon, 23 Jun 2025 11:23:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022271.1398056; Mon, 23 Jun 2025 11:23:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTfGZ-0007dA-Lg; Mon, 23 Jun 2025 11:23:11 +0000
Received: by outflank-mailman (input) for mailman id 1022271;
 Mon, 23 Jun 2025 11:23:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjIQ=ZG=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uTfGX-0007d4-ED
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 11:23:09 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2415::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ea58bd1-5024-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 13:23:06 +0200 (CEST)
Received: from BN9PR03CA0638.namprd03.prod.outlook.com (2603:10b6:408:13b::13)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 11:23:02 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:408:13b:cafe::34) by BN9PR03CA0638.outlook.office365.com
 (2603:10b6:408:13b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 11:23:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 11:23:02 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 06:22:59 -0500
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
X-Inumbo-ID: 6ea58bd1-5024-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nliAKXjxOJN5tz3OiPyj0odVCeiIZD4g4MiCGCAz6PFZ+e/YUqZE63QRtqc/B1dnaij51AnHmoqmSbrhUDuDxJnLahXtwpfZuwzL3uW1G7MkgX7GznHTEvTOWJnsEGpQ4gPw1qlM7WvGh75rYj24z2Icam5Ao7iZ8JF1ivwLo4IFXbjNy8mOhuQM8NZ2viWZ+H8+QI1RYHwwMxMiKtE3HpufZVJ6Rcx4VxPB6ctJgbsSZAiRjE51dgWYZSEjxSLqZ+LMJdDI/i9yid/L5M5qPf4ZhlFj6ZoK0ozLadr9T+QRPUiZJGWYWHcXsNn6AvDr1j3Udu8oQ8UGvNa3nhoJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut4r8p5VsxymoBUaFizgbO9ZOLJYX33QqtnhIfB7hqI=;
 b=kzsXgtlQciE0J6ZLwiDfwj0SzhLRHbqTzlGqLqnrm6vFCtQvVqM+sTzKO9UKxV14OhBMF/yNsJ8tpLwHRJ2Fihs+nMXEY2qJ90wWggD9jqkpA3KYD99DiVPKnvHa59QBfT1+oazvQugH25MOzAUpxh5Dxq5zg4Y4PASxH9Vggh47cmIka+gwsdiH5HQOz8cMD62MB+biBRf7x2EtLxxpjzH9Arg43tiuiPu8yfWWrNOG1oT0cfxHoj72frHkHJBlbjbjHNSaaTF9m6y+440unLAENLbhKCVcnPa1xjCaWRbBh04JoKXiw9nderuKXH6juyBK79gwosVrOVbLg6A0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut4r8p5VsxymoBUaFizgbO9ZOLJYX33QqtnhIfB7hqI=;
 b=MqPw49FkjuCUXErK2pwheVhnS8CvKk/PkT7yYUrQ8Ml4mtB2gjt+i4/ocdOWNaZd+QDmL2JQyYCkflBxe6eJVwSpSycewa0q9tIELKlHg6LHzg7iXtOleCickrh1paCEm3zup0kvgxL0n8hoCUz5P2160oAqjiy/zBkTMSmNQBs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Jun 2025 13:22:59 +0200
Message-ID: <DATVH97BCJV2.1LSZEP4HUG997@amd.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 01/12] CODING_STYLE: Custom type names must be
 snake-cased by word.
From: Alejandro Vallejo <agarciav@amd.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: aerc 0.20.1
References: <20250620182859.23378-1-agarciav@amd.com>
 <20250620182859.23378-2-agarciav@amd.com>
 <a91755cb-0c98-488f-a551-adc0827c9628@suse.com>
In-Reply-To: <a91755cb-0c98-488f-a551-adc0827c9628@suse.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 5992f3ff-b6a2-435b-7448-08ddb24850dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODBydXhrU3o1YS9iZG8wUlJCcXNtSXZheHFnMnZwMDdJOXhGOTBJeW5KVlR4?=
 =?utf-8?B?Si9MSXBwOEJjSXJ4WEdxUHM4cTBvSU5mZnhSQWpMVDJKMzdWSzJSRDBLSDdZ?=
 =?utf-8?B?eExCRlBseGljdWtVVUc2bkgyTm9peFNwKzkxdzlhanZyb0g0UEw1Z3VRcXh5?=
 =?utf-8?B?UWJZdCtwTlR0Sy9DZ1A5RVdpd2lKeVA1UUhST0dLZFd2YmlLakMybUV0cjVP?=
 =?utf-8?B?bVh2UCs1UEhmV1kzcmZaNXg2bXArOGVGZTJoOEFBTG9WVGdONnU5dk1DZVV5?=
 =?utf-8?B?TTJqY0N5L2lWOEl0NGVGY01UcUpsV1JJUVprVW9ZbmV1UmswckV5ZmFQVWVC?=
 =?utf-8?B?WjJFWTJpRVUrNkNCK1pSbmFqdG9tOCtoOUlnQ3lKd0xPZ01ydGFVN1MxcTJZ?=
 =?utf-8?B?VnBSazQrNmZ0dHdWQ0l1Tmx6alBwbWlMcDZjYnJrZ3NieC9qTjRLa3ZTV1Mv?=
 =?utf-8?B?dmFCTDdJMUZqYk1Vcm9ndEpiVnVIRCtjUmxRR0M5c0IxVmQ3RWJhUWRLd1dO?=
 =?utf-8?B?dDZ0VUJpdU9ISXB3eWNseEQwVEowa3RzaklGa1ZVTHFkVzEyYkR4dXgrVXRK?=
 =?utf-8?B?QWJrZzloaHB1bitMckNVR3c4ZmZlQUtmZjd3RnhVTnZXWWk1VzdSVHZ3TE1O?=
 =?utf-8?B?WklBQUdpVktadFQ2SDF0ZTBZZnlHcUZXcEtYRHIvU1dYUHA3RlZCWDNNbDR2?=
 =?utf-8?B?VmFuRjAyWVdZalJjVFE2OFRibHozclVDVkFkemRZQWpXdGJUN0V1LzNZVSs1?=
 =?utf-8?B?bnp4eSs0cmozaTJaYnhhOU5FdVBCcVF5a01FaVlLSzRLeW45b1N6WVdRc3Qz?=
 =?utf-8?B?Z2VMZEJROWM3N3NvaldYWHNWWW1hWlBCSUY4TmtkbVdMT1REMDlXNXE0bS9y?=
 =?utf-8?B?bVROVG8wUWJIWEVSUExkbFNvZXRxanlDTVFVcjloS01nNW1Ea1NjZEFLajFs?=
 =?utf-8?B?N1RYZTRKRGgyM2tVamJmTkI1eEQ0dFVaUmZBNDRsSFZvQmdrUVc1OENMZTNE?=
 =?utf-8?B?SHBjWmIxcGZCSEFWcDNLdmpsS3NJQWYwYXVvdkYyd1pTZEtWanlBdDRZYjhR?=
 =?utf-8?B?TkYvb2pUcTN4L3VqZWpzdmM3U2pSeUZhRGppN2MwYVNJZGtmSVdvMnhXbk1t?=
 =?utf-8?B?L3dlZ3U2SEE4cDRGV1lnZGlTa2xiVXkwK2dIL0x4MjRwUHZkSytUbk5tV3lS?=
 =?utf-8?B?cXVUa2VCemxxNEhhK24vNlJaMFFWOXpsRG9mK3ZzeXNrWk9TeUw3K01pTTRY?=
 =?utf-8?B?N0JKQWtuSnE4NktzcU1RQWM1TWZ6RjNSYkhoQ1I2NGdXMDBOYktja01YWXlx?=
 =?utf-8?B?SWg5TlRJdXlESWEwUWprR0x1eXNvaHVqK05la1dmL1Y0N0pGU0h1ajhmOVdI?=
 =?utf-8?B?Y2Jmam5hc1NBRXN0R1hoUFV3R1BHZXU3bGkxOUMrZkI2ZUFsMmJLL0tKeXNm?=
 =?utf-8?B?emVIWkFLNFoxN3ZMa2NUT1NPdS8rS1JmYkJoN1lrWlhRL0tTVVVRYTJMTlln?=
 =?utf-8?B?UnUwelJOWWZVRWVNMEJVUm9MTHZ5RlhwbmtHaXArOVJTN25WZzYxemZuajZE?=
 =?utf-8?B?UzVXTDZUUnF3UUdoc2g1MGNKTHd5eGxoa1BXajBjN2NmNG4vS1pSaUtnd0xP?=
 =?utf-8?B?TjZ1VFdaUVZNSzQyc3lmVlJYa2xxTURocWlhS1lVdlpGVzRTVEFqOEV6ZkEy?=
 =?utf-8?B?ZmZvUTdCRlJSbmRqQkM1V05uMzZIeGNuV2FXem1qM1Q0TlRsM1dyck5qUkx2?=
 =?utf-8?B?NDhPdEFOUmZOdzBXTUVyRTYvcXRTQUpaK2NQMERvdHFFZDBmaEVNMGlBYUNL?=
 =?utf-8?B?UmQ4c2tmL0hTWlc3bjE3TisvU3R0RDZlQkFTdHpiZ3Naam5JdTZUS2duODhx?=
 =?utf-8?B?QzU1Skx2WmsyT25BbGljYVIzMlRoc1hDdlEwMks1UG1uSm1Uakc4V1MzS2Ey?=
 =?utf-8?B?MTIvWjljZ094T3hZN3laVG5BRmJTcjRwWDFuVVAxYkJNdW11akNpUlh6NVBi?=
 =?utf-8?B?Unk1dnpjRkFQODVHZzRuVmk1V210WXBMYjl6V3l1OU4wSjU5dXBMTGZvTHdI?=
 =?utf-8?Q?ZH1ypa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 11:23:02.0129
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5992f3ff-b6a2-435b-7448-08ddb24850dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963

On Mon Jun 23, 2025 at 9:31 AM CEST, Jan Beulich wrote:
> On 20.06.2025 20:28, Alejandro Vallejo wrote:
>> There's the unwritten convention in x86 of splitting type names using
>> underscores. Add such convention to the CODINNG_STYLE to make it
>> common and less unwritten.
>
> Just curious: How does x86 come into play here? Xen inherited this un-
> written rule from Linux, afaict.
>
> Jan

x86 follows the rule far more strictly than other Xen ports. Even in Linux =
it's
not uncommon to see some words stashed together because they represent a si=
ngle
concept. e.g: "bootmode", "bootram", "bootmod", "bootaddr", etc. Some of th=
em
inherited by Xen itself, like "softirq".

But I digress. I mentioned x86 because it's the most traceable use of the r=
ule
as written in CODING_STYLE in this patch.  When or why you decided to do so=
 is
another matter entirely which I very definitely do not know.

If you feel the commit message should be something else, I'm happy for it t=
o be
such something else.

Cheers,
Alejandro

