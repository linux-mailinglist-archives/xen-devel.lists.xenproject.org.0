Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OxjOaGzjWlz6AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:04:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587B712CD0C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 12:04:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1228707.1534829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUU2-00059v-Jm; Thu, 12 Feb 2026 11:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1228707.1534829; Thu, 12 Feb 2026 11:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqUU2-00057J-GV; Thu, 12 Feb 2026 11:03:42 +0000
Received: by outflank-mailman (input) for mailman id 1228707;
 Thu, 12 Feb 2026 11:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4gJ=AQ=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vqUU0-00057B-EL
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 11:03:40 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ae1b248-0802-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 12:03:37 +0100 (CET)
Received: from IA1PR03MB8288.namprd03.prod.outlook.com (2603:10b6:208:59e::6)
 by SA5PR03MB8401.namprd03.prod.outlook.com (2603:10b6:806:475::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 11:03:35 +0000
Received: from IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599]) by IA1PR03MB8288.namprd03.prod.outlook.com
 ([fe80::b5ee:28c6:e04b:5599%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 11:03:35 +0000
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
X-Inumbo-ID: 7ae1b248-0802-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKjXFlj3crRyKLsXmCp6LN/tr/RxpFWAXjbz2OzW1FCc99DAyNOJNu+4341q5QxFxrZjJP08njB360FCeYsNBkKNM9SI+aqAL9xkkmRQ44mjOOHonAONO5WtWN7U6cCutDdLh8Z8SWZC8cRvwSilKxByIpQ7YGincRO225JzMW7ZliCIpsGwvIT39Va7iL7oafzfLB3/GD9hG4R+xbYJsprJ7jERiCYmziON1pSjNH7OZknnW6Q4T7LzdCX1FSprDiiki9/R8oj8J4a3yMiWUVfXPM4487rFDhoumaf0ARN1IQM2+SRHG+tjl3JPHdIrFMGkxFgleiEQmyL+PjBArw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZ9vqlzKsWfB66IRh58Pg4K+KG5EjeD89rukrp7KXuY=;
 b=CCzi1prgvKfg+Jakc2UJ7XGNtowCQSTY14tQq2OX53Cu6CLwrDY0BDawlq1JD4xEl6q5e9nhlHOI/2wjdxjiYupbeVSsi32YyhRsjswfjl1khj3J3mZPcK0Z2Cvh69IWVzIJprIhHHWVEXx47irpWtAxkQ1ZAprTtmFklvV0DL69xCZXsy7g9VFdliqqR2OF2OCkvC+IHl1AKkw9yIAwIlJJrXPTgfWGqx4YVpXbSUyrFhxHtiv8CAAvr/lnxdMhOaQhxloz3c2+q60ucf+3flJd0iHM+m4gf/OOIn0nwrxPXzjpsIasdzu+bCIJQQljdUN9KVAvAbErj8092+3RUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZ9vqlzKsWfB66IRh58Pg4K+KG5EjeD89rukrp7KXuY=;
 b=gz9/I8eKQSf83vnlkozZXyzcWkvA0VYBKzf7gE7NcDrY9ulKIKavkH8T8eBalz/4X/E8nT7aRskDfw8nwujGAsdyXCSnxJUJEM1BdADRalnItTHDjwQvxFwdMx56ACo9Td60iXTHdOu4TuB1cQ/aNORyV+TH7N/SFI/bjsT76zA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d49da49a-e12b-4978-9512-3305615b0389@citrix.com>
Date: Thu, 12 Feb 2026 11:03:31 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.21] SUPPORT.md: extend "lifetime"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <96f8028e-bdc1-4d8e-9fa8-55f209a5c7b9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <96f8028e-bdc1-4d8e-9fa8-55f209a5c7b9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0398.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::26) To IA1PR03MB8288.namprd03.prod.outlook.com
 (2603:10b6:208:59e::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR03MB8288:EE_|SA5PR03MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: 94b97709-9310-4203-f9c2-08de6a265dc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnc4MThGWXRoUjIzNUt0MUhFR2VHVG1xZGQrU0lpdE95aVpiNTBCTVA0UjYx?=
 =?utf-8?B?NUV4OGtxeW1qTjZXd3NPRjNwMXF4V2NDeFhzNld0Y1lTc2lxMHJKaks1VWNB?=
 =?utf-8?B?bCtZZVhyQWxBbEpjQkdDS3A4NlZ3cW9qSFVZVFhSQnpSMW5UNEZJZTd3WitV?=
 =?utf-8?B?REFtaU8vZjk1V25CZ2Yzb2lwV29OOFNkRUZCS2RHR3NaWnl5dGhkOGFHbmQw?=
 =?utf-8?B?bjlUZUVVdFJUNTVUNVBDODJTV3JaNUswKzZ5TTdRN3FKTGNLdUdNMnF0cUFO?=
 =?utf-8?B?OEk2Tm5POW5DaFRQRG0zRnpFSG9CeXVaMFdWSEM1YkNHRVlQMGVtNTJCdmtQ?=
 =?utf-8?B?RXhtdFRmUnpCOS82NDdVWExRbVdkQ3JmWG5PL2ErMGQycjdidlJZYm1qWkZN?=
 =?utf-8?B?UUU0WFFqUGtGVFN0VGt1dHliQXY1em1rTi9LNUJDcEtSQ1ZCd295NHo5NDEw?=
 =?utf-8?B?eTZsQm1kaFRCek1mNTljSmVoNUFGaG9BSzVmU1hOT2dYYkU5TU8xYkFnbmFQ?=
 =?utf-8?B?ampmcUx2VDdvdkRLbEdINmFxWTJqVVo0SnpFMkd0cnlKbXlXOHhZOWt4RmRF?=
 =?utf-8?B?ejBGVGZsZllMeWIxZlFvYVVBZUtseUI5eFR0MWF6RXk2ZXVjeExyaDhWQWZH?=
 =?utf-8?B?cXZhbVJwS0dlbGJnQU1sZDZQUVJzNVNkdDFnUnlGV2NBNWN1UlQxTzduNjRu?=
 =?utf-8?B?V29VcUVvUVB1aS8yUVdpa1ZiSEZJVTZrSVZiVTYzUzZ5V1NNRFVSbHB0Ylht?=
 =?utf-8?B?a0FzSmpZSnFaTVVPUytZVzE1VGlTNUh1UXlVanQ3T0pvR1diOWtEQmhhcHVq?=
 =?utf-8?B?TmNuc2ZrZlp3eXJmdm9DbVRtMjhVanlTQkdzYURMVnloVk9jYjl6aUJ3L24r?=
 =?utf-8?B?dGpycXlCZWk4ZTR3WmRYY1NXbEpybytVSVdWcis0c1phaEd4ODQ2cjREcHJM?=
 =?utf-8?B?UkR6TE56cTFxUlVzY3hDd2NCUVRlZjEzNExod3lRT3NiTEJNVlVVSENJK3B6?=
 =?utf-8?B?ZUpKNGR4ZmhUUVNqZWRQTVhNNjlKMGpqS2t4ekNYSnUvSm9DZlJjY3AxMVNy?=
 =?utf-8?B?cnlQTS9ib0sydm1XeS9KNFJzQ1RXTGVqTnh0UXF5UWlxcXA5aUNmY0tUSGhK?=
 =?utf-8?B?QXhaYmpHVkpFUG9zeDNMdlo5bHVVaG5KYmxnaWVvVGhWYmJ5eEtKcnBTZnVK?=
 =?utf-8?B?blRScjFtZ09FMzQ4YjRBT0NjamdpV2UxbTc5UWN3U1pjdStsMnFvZEo1WStK?=
 =?utf-8?B?aGFDL1M2UVZoVzBuWmVPc21MN3JUa01Oc2YrSjYraC8ybDN6R3VkVnkwLzFW?=
 =?utf-8?B?T2xvMkRNVHA4cWwyU1VBYUREQ2x3enEyeDVGcEdpdnNxRTV0UHNlRy9FRmlC?=
 =?utf-8?B?SGVFMWUvekh0T3R1R3huR2UzZDQwZzdSbks4VVZLUDZTTGVOMCsxb1lBeUVr?=
 =?utf-8?B?QXBoSHVhUlZhalBzNldCM3RVTmtDYVV3WXgyTW5FZnV3bThCaHBXQlRsWitI?=
 =?utf-8?B?dUhQOXlpb1k4Z1IvUndIYStHRVRERHIxRnl2M2ZxcStWa3IvbXhLam9RVGJJ?=
 =?utf-8?B?a3ptZ2pWdXdiaUF6WVFCbUxCTW15K2ZVOTFocHB0b2xHM29TSlBFMEtwbFNU?=
 =?utf-8?B?YzBqenprc01nT1lIaGpRNU1BdkYwVXRoQmlVcDdiVEQ3bnMvY3IxSWR5blRt?=
 =?utf-8?B?RjV0T0lhdU85UDUrVjZrSXNzVjlOZEo1dnBKdFdweWw2OStuejk1T0NpR3ZQ?=
 =?utf-8?B?Z1VyVkY2RVhmWE1LTllDRHRucUlKdzc4Nk0wR3RKeU16NGljTnFMZGRuVm1V?=
 =?utf-8?B?VmVUaEhudHpJR3g2NU5QQTJLeHc3Q2JibDV5bFhOd3lIQWJwbmkrblFrazZy?=
 =?utf-8?B?NUVOejNCQVZpcDB3WFFKM1JPcGhSUUpUZFk3bnNsbWtQdHNvV0txL2xOa3NU?=
 =?utf-8?B?ZDdjQzBkLzVSMHZZSzFJb2Irb3d2OFI5eDhMY2ZaYStlSTJGUVNzWDF4eEty?=
 =?utf-8?B?TVV1c0lRZis1NHpvR3VRVmQ3dVBXL0p1a3VQMkZjLzBSM0F3WmVQRUFRQTFS?=
 =?utf-8?B?eDVzT1F0ZUxxVWVlS2FEUUFneENMV1Jtbk1kWlppbmZ1QzlnWmdmME5vcFZn?=
 =?utf-8?Q?JrfY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR03MB8288.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzlkSlcxYjhhdkhEZ1JFMDAvdW8wZWxTRFZvVGp4ZGNsc3R6NUY3RkhWUTgy?=
 =?utf-8?B?YUFDRGlaOEZFTGdLeE5wZWJFRjdycTU4VGdDZ2hIR0lGUlpmSmtJQWJFOERj?=
 =?utf-8?B?RHdwL1lkYlVSYmh4aGlDdmd0cGpZNk4rUnd3OFJBNzRWRk9PK3dDQzNYaGV1?=
 =?utf-8?B?STM5cjVyMVJlUVFjOFpSY1MzZFF4VDFEZEg5djQ3OFA0Z2ZNblV4aWdNb2tD?=
 =?utf-8?B?alNmL1FZYjQ5U3hHYzh5UXVWT1lFSmhNb1JwK0RsNFNRR2lpeHdBUmx4QTJz?=
 =?utf-8?B?K2ZYbU0vNk42dk1qOFViVE5SNDZjUXYxN3REK0puVGNGRVpmLzk4TTJJMmo0?=
 =?utf-8?B?NzJ6dUY5eVFWNlROaUZseUJlMFlXQ0dzaFNCYTZXWFd3WEV1QU1KTjcvUVNv?=
 =?utf-8?B?cnNLVDRvZjJxUFpiRm5EY2VsQ1R2eVZzOWQ1c0VMUzk1N0RDVXpXeExHUmh2?=
 =?utf-8?B?RFh1b3BobjF3TWZ3b2JITW04SFMwRGhHd1Y1bHpPQlRuWVc4ZzFlSHhUbDUx?=
 =?utf-8?B?RTdvclE2ekR6QXRtM0JsK1B4TUFrc25KSjRFQTVNWXdZQ0tYM1dTQkJaQXg0?=
 =?utf-8?B?VGlWYlRRVW53VksxcHlHeHpOYkM5TkRDL29XOXE3K0lZVUV4UmdhYTRyS3kx?=
 =?utf-8?B?S2NpeENseWYvMFJ3ejlNVTdRdDQvdjdRSGs0Q1l3bGplS2xLeWNBa0NYYzBY?=
 =?utf-8?B?cVNKcWVETDBxaVNEZ3BmNkI1aGNuWVdWNm1LSmF6eXhWVG1FSkxwQm5NRERx?=
 =?utf-8?B?WEhWSzNhc2lhTlF0QWZIc0pqT2tsVE5NNzljdWlCcHRMSW1WSTVnSURJZXl0?=
 =?utf-8?B?K1FDTlBESWQxcDd0MUFnS2VVOUdsbjhUL1dNcVcwNE5zWng3dEx2VW1DYkFo?=
 =?utf-8?B?MmJ0RnZGNENLWlNwNDI3alBEZUozNEVJUVB4Nzl5TXg5cUZHREhTNmN5YXkv?=
 =?utf-8?B?c3JZNDR2V3RVd1FRSmg4VDk5TXlaK291WVNPZm84V0s3ZWh1RHppcDBPaGoz?=
 =?utf-8?B?eERST21ObW00ZWJQOVFGTGpici9CMndqWW5jWlJWaXByTEVsZFpZR3RGNU1F?=
 =?utf-8?B?L3VaT2xTTE44L1QvbStpb2pMRmZpVEhwaVNlbHdQNG91ZmVSQXdwcEs5dmxG?=
 =?utf-8?B?ZmNFRTQ0QjFZYkcveE16UFZud094TjV0d0JzMHVYdGFkcnpuRlhIV1d5OUNE?=
 =?utf-8?B?SklEVFNYa3ltMFRrbEtTTVcxRHBObE1lN2hHQUd3YUp3NWxkM3ltN0p6eEtE?=
 =?utf-8?B?SEJDcjF3QmJmS1d4aGxQUTRBV2R4ZDg2Y1JnV2pUdzEyN00ya2lwTUxOUCtY?=
 =?utf-8?B?OFBmb3VnOFZvNTFUU3ppUUNuaG8zUnJMU051M3pCaWV5K2liQTF6bGZhcUY0?=
 =?utf-8?B?WENyRkM1bjFCNVBvYU9jTE91L0lta0tBd3o2QkcvWEJycDNVbHFHT1pqT2xk?=
 =?utf-8?B?OERmOHQya3lMNWlTbGRNNTdMVHU3M0FYOS9FeXJwL015UmI5MDdKd0dGbDlH?=
 =?utf-8?B?ay9mMU1vczFxRmY2c0J0SVlxYTVYanlXaTdzaTVpQytwZFlqUlJlK21Bb2NN?=
 =?utf-8?B?aWw2Rjh2MUZoNTVwUTkrdll4dTVYV1ZRZE0rZzZKSmo2Ujk5WkYxby9CMEl6?=
 =?utf-8?B?U1p3QjlBS3JCVHVDaVJlTW9sTFNCQ3ZPd2lxWjFHQ0x4cElWanhsNTAvYTVv?=
 =?utf-8?B?bW9hejdsNzc3alI5SnpvbTIxVm9FMmh4REJDY2Ivc0ZBS1BVZVJjd1VKQzU4?=
 =?utf-8?B?NmlMOVl5aHlrUm1UTkFIZEtDWVVhZ21OYTNtVVNxcDIxNW52SUNiZkQ2MGcy?=
 =?utf-8?B?RlpHM3RkMjMxOHZHRnlxcktrUVBBVnJSUlFMTzMrajRsbjhTVVp4SVJBK3Nn?=
 =?utf-8?B?a215WUVoUnVHVWxaNGdvd2UyaTVYSGUxV0Q2dFZVUDgwd3pjNFRTVDg5ZnZZ?=
 =?utf-8?B?ZHBDelZicUxKalRUcFlUem5VNUliamFCZ3ZCYVBjc0hwcmw3T2tlVS9WaDVi?=
 =?utf-8?B?eEJHRTI2Ny9rMnV5U3pOODcxVGhTOHpJLzNmdk5OdW9CYnRsU1FQdHhDVW4y?=
 =?utf-8?B?Wk9SSHRiMCt1VHZpMmd4eDlxT2lBVk9SWWFGb1oyb3p1UUY0d0dwMi9NRkFL?=
 =?utf-8?B?RGVYSFJwQ2lWNEQ3S1NrbnlDWEtDanBob2RyMXFzclBydExYRTVFeXExbmhZ?=
 =?utf-8?B?T20wWE1va3d0MjZOK2hCR1REYTFzZDd4dlVLdGxiTjNTVGFDT2JvZnRITVR5?=
 =?utf-8?B?SUY3VXJrWHdLWFVHNUR5a29iNmFBOTFSWnpjelZhU0hzVzZwdE5iSktUdkdR?=
 =?utf-8?B?UUd0bG1RbEhiTkhUZzN2dVFiMkwwekFPRHJieDZnMFpmYnlpaWdwUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b97709-9310-4203-f9c2-08de6a265dc3
X-MS-Exchange-CrossTenant-AuthSource: IA1PR03MB8288.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 11:03:34.9040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPnjFKyJFwsrNVDBlllBplxEKrFOy26vjTBgFDG127sToBELdLhDl0dxOlcghxZ01not1hQrj5+dNmQeBo8yhlosowNp7rbMMG1xLZkF5uA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:community.manager@xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:mid,citrix.com:dkim,citrix.com:email];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 587B712CD0C
X-Rspamd-Action: no action

On 12/02/2026 9:24 am, Jan Beulich wrote:
> As per
> https://lists.xen.org/archives/html/xen-devel/2026-02/msg00630.html.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I would have preferred to reference the xen-announce@ posting, but the
> mail may still be stuck in moderation there.
>
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -11,8 +11,8 @@
>  
>      Xen-Version: 4.21
>      Initial-Release: 2025-11-19
> -    Supported-Until: 2027-05-19
> -    Security-Support-Until: 2028-11-19
> +    Supported-Until: 2028-11-19
> +    Security-Support-Until: 2030-11-19

A useful consequence of the 3/5 years is that it's now trivial to set
these dates.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

