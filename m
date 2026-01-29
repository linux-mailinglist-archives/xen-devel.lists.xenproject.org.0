Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F4pFhk8e2mNCgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 11:53:13 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF0DAF2F6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 11:53:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216274.1526198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlPe0-0000BY-2G; Thu, 29 Jan 2026 10:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216274.1526198; Thu, 29 Jan 2026 10:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlPdz-000089-VL; Thu, 29 Jan 2026 10:52:59 +0000
Received: by outflank-mailman (input) for mailman id 1216274;
 Thu, 29 Jan 2026 10:52:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XEJ3=AC=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlPdy-00007y-8g
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 10:52:58 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab08b23b-fd00-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 11:52:56 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS0PR03MB8319.namprd03.prod.outlook.com (2603:10b6:8:297::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Thu, 29 Jan
 2026 10:52:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.008; Thu, 29 Jan 2026
 10:52:52 +0000
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
X-Inumbo-ID: ab08b23b-fd00-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnjRUA08pKrPG0QsbHQn1Gy5dbymAdpy9eO8ree8T4+Xvy5uk46rbb2NWsoSvc7DcBOUAvRyTWEavk7m2jw775Mm5edle+mC/dtw6pIcNW8sqXkWQCeWi56NWXbrmO6mS/5X0YVr+KITx0FLbmB8eHGFwaS8T9opd8jFIslFzEZMJ8P6t2PDZ65ev5fmYpngQoeuHYQRdUY91Y4l9vM16yjZ/DAqmTvTxd7WM/t4T/ikNWD0sAjpZKx3yYJ5XmldxIWb0AYHUpvttf4JDl9DdK7GofZjdgV/uhVTh1+/gYAvXP+TNNYCqjbjmJXCEC+mOxRWRxtAD0KEeU4HD99LtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hgqdeqKcVvh9KCWygOPUP0xc+0JkV8lV4SQ9b0lPlE=;
 b=KlO3mwskS6v6iRuhzjKLnOat6WYfKX+zLFODTXxvMsV0hnr3S6SQOyb7Ai3D7q2wHVAnuc9CKkYmgkN7xIEC+l5Nr+Q6hCyYB5JPJ9zEOWv8U5OklDee29EoMWbskjuMe/WTb1Cf5fhn35yE3+es8vB4k5HKT5q9goTAPvp+/4EFhwCL4wdZu4+LJPTm5Z2Y+nR4Vh7WellJK/tNHK5dqGTrv8lrs+M7pyr2tK6fgYDCD074sbFXXqKe4Bi4eDmz7UlX9p/g+s+HiWNnjrQIL2MmHU9WidScsLJPhb0sEVeWj46aWSNMfE2VK0PRG1uidXnd6YA5hJD0IOXJr1bLUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hgqdeqKcVvh9KCWygOPUP0xc+0JkV8lV4SQ9b0lPlE=;
 b=U93D5ovFU2/YMV+2d5F0t8JjdurvjG3RqOhQcf5ZBZH6xvXMD7PTvBDkXTd2JK5WV3JNWiPMKANelc6j9s4D5x+MYLW98Et+z0+tdStiSfVP/qeq2kHTOhuUJbCOa1Yi1mF7crdFfQSQshL52rwOl6x2HaGDef7C0z11FMqomuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jan 2026 11:52:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/3] xen/mm: allow deferred scrub of physmap populate
 allocated pages
Message-ID: <aXs8AHtKNxAzNDTR@Mac.lan>
References: <20260128120339.47373-1-roger.pau@citrix.com>
 <20260128120339.47373-3-roger.pau@citrix.com>
 <6d7b74b6-1bab-427d-aa14-321f4761d9a0@suse.com>
 <aXpeOocblPZtJW5Q@Mac.lan>
 <9d3d4a0f-5ff0-4a90-b624-fc99b23efbf7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9d3d4a0f-5ff0-4a90-b624-fc99b23efbf7@suse.com>
X-ClientProxiedBy: PR1P264CA0184.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:344::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS0PR03MB8319:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e074fad-64b5-4a5c-1312-08de5f248d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1Jha1FKK3EvTlE3d1pFSFdXUXp4eU16VjVzVHgwNjNXc2N2ZkxIYktrM0o4?=
 =?utf-8?B?UVYxZ0pjK29ROWVJdXpKMnhDUThONzZmaW9EOUh4SEoxemY2U0dRYmVSOFM3?=
 =?utf-8?B?Z2tNVE9INkp1UDJ6TmQ4TDR3SzlNdE9jSHZxYXBLWkREYnl6Wmdxb2hzTDUv?=
 =?utf-8?B?UEdzRlhWTU5EeVRiRy92eUlxSjU3ejBORGhGRHlnYU5xMVdrOHVxSkFVVGtW?=
 =?utf-8?B?akFPUkZIMHVuRllQcXc0ZHZWMVBweVlXbDNaNy9pbWRXUGxvYWdkaExvZHVI?=
 =?utf-8?B?eGpra3BlMWJiMFhQMlhiNjNXc2UvY2dXTGFrNkxETmFmWGhQMjlWVlhtWTRH?=
 =?utf-8?B?RmZ6M0F4Vk14Z0trVFVKTVlyZy9MN1ArNk9wMUh3bGJweHFCdVhQUjdYZHNX?=
 =?utf-8?B?bWpHajAyT1BGMTY2eEJGQytYcG1RYWh3dS83dHNYRm5yOU1HMU43bjRnMkQv?=
 =?utf-8?B?akdyWlZTNGNsZS84QVR4VDh1amNjekpidVpubFIvL05IZUE2Zk43ZVFqTWRO?=
 =?utf-8?B?UDRzbUtWallKeTBkREdEWjZ1NndWSzdPUUxMdFVnTXNYN0l4NkFZN3pkR3BD?=
 =?utf-8?B?UWhFdjcvME4yeTVmTFBRY3dyS1dQblNEU0x4MWR1eHdydHlNdWVScVNyZzda?=
 =?utf-8?B?UFg2cG1zcDQ2dUFpa2Q3NTBoYnowYzc2Z21pV0RGeVFwNjl2YVRzbVVPbXR1?=
 =?utf-8?B?UVdvTXNZSHF5aERIbDJrVWRveUhIalZsOG41cXFhREIwVjhHQ09EUHdtb2tD?=
 =?utf-8?B?R2J6b2NsOEIyczZPUHVBUmZCWEFxNUN2YlZscWt4d1VRRDI4dUNvN3BOakN3?=
 =?utf-8?B?N1Jhd2NSQXpJL2ZuK095cDM2VTBKSzNMMnFjem9pQ05SR2RNYjlDb0JhZHR2?=
 =?utf-8?B?RDdtRTlNTHlGaEpVL1hvMzJpaWJnVmpoSFQwdy93L3UwaE1pVWF1d0k2R3hD?=
 =?utf-8?B?R2pKaWJqOTRvcjlBODFhVWxvbmJLcVE2WlU4K29hVXZ4d09EdmFWdXlKTmNp?=
 =?utf-8?B?bTZNY1hlQzhqQlM5TUxwdk5YY1RNQXZSNGwyTmVwd0NvOUtScG1NUGt4enpM?=
 =?utf-8?B?M01aM3dYeXNta1JWTi94dUtCZGh2eE1tMGgvZWJ6Y2c2YkIva3dKQWQzR3R0?=
 =?utf-8?B?YjNBb2hiU3luMnQ2OXVGaG5GcjQwTGtQZlNrcTM4WVJCQ3pLZHdnMGRabWtE?=
 =?utf-8?B?Y0JxWG5WUWI5bjdJNE03akFQa0JCTFVHZFAvV0JoSnpOS213OUZHWDJlSWdS?=
 =?utf-8?B?dXE3ZFZYTVhXbTZVRkxRT3c3WkhpWi92Q0xVREtESkMwcEh5UnZSSzhBN2px?=
 =?utf-8?B?bEQzQko1UHljcFFyR29qaEVRdHdnMlNEbDVvVklVN2grZitCaVdJdWNLUGVj?=
 =?utf-8?B?UjlkN1B0QzNlTUxKaGpBTEMvN01KUmxYYVhlZlZqWjA4aTVQYm95RVFOdVJv?=
 =?utf-8?B?Vi9NUDlhN2RtcDF5ZTlEQkFzMTcvYlpabnZzTDBpN294T0JzMzV0cHFkNXlB?=
 =?utf-8?B?eVB5RnlBLzVDSVJxM29ROGErNkNXUHp2bjNpc2s1SXlCeDEralFYZkxROWpH?=
 =?utf-8?B?TWtMbGVXQzNsU3MxaXZrdXExeDYvYXExUGxxVzVQUUtOSU9rN2NRT2xqcXZP?=
 =?utf-8?B?ZnZKc1FkV2F5NFlUeXE3TmRmSGwvRG1oWkZPdkZWT2dNMXk1RzNXYXJpSTF4?=
 =?utf-8?B?ckZTZ2F6d1MwaFZQTkJCYmUxNnY0VC91MUtUMzM2S2wrVEVBTUNOcURzM2NC?=
 =?utf-8?B?cUxLYVFBVmNiYjlyeTFhVFJJcjRSU0ova2FiK1BVc3lITGpsM1Z1b1l5Szcy?=
 =?utf-8?B?dDRxb1FVSFhXeDI4TzVTV2t1UG9nZnpIcVVoNEoxS1FtRXVVdDJyZ1k1ZnRz?=
 =?utf-8?B?cTlaMzV6YXd4NHFrUzFjSEs4YUppOVI1YVJSa2VUK0ZETE83ZjhiNDJGVGVt?=
 =?utf-8?B?NmxYa3ArMmJwMk9UdXFwRUY1VnFPMTB0RXc5ZE5za3RkakxvUkZyMFpGc0E1?=
 =?utf-8?B?em9DQXR2QVhBNzErd3VUT2xUOG1janFPM3FrckNrVXdWaXpwV3FWbi9TWHpv?=
 =?utf-8?B?aGo4M0kyd3B3b2wxQU00SnhYWms5Vmp1UnhDaWlvYTcrTnkyMUpmQkF3N1V0?=
 =?utf-8?Q?KIQU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU04djRLNER5SERic2VLWlowMzJYZjNzaHdHOUY4NERid0djeGhvcXAwRmZF?=
 =?utf-8?B?cnBQS2RzWHFlMDg1S3JNdVRtc0xmdzF5emp0QzJRdXl5K2p6bDhpNHpCSzVB?=
 =?utf-8?B?WDJ1NDIwT0lFRHY1Z3NJd3VibE9oeGR4MWpRZzlTWWljeDNWQWVCdytVMEpk?=
 =?utf-8?B?aHZYdTJMSmhpaEh3RXgvZXAzdE5PajFjNnBkV1JUNU5CM2wzUHdHK3FDWXNS?=
 =?utf-8?B?RzlCc1BHQVJ0SU9MRU1zelhwdDNsNDVGQjMvQnFtQUVjdkgycFNWS3RFSTNX?=
 =?utf-8?B?NUpzcWo4VUZPWkJBWi96cUh2ZFJtN0pkWldjK2l5VHRlbXlrdC91dG9va21D?=
 =?utf-8?B?ZEEzb0E2dVZMRGlyN0JMU2h4eVZZM09KTDMwWWhvWUNNRnVDTkR4VTIvTDUx?=
 =?utf-8?B?Q2VhOWVSL0xjVFVVRUppbUNpN2U0TDdHTEZmRVRidmVvWm5sZjUrR2lyMitl?=
 =?utf-8?B?bWw1Zlppdmx2ZVk1Ymcvcjl6TjVjVkdPRHpnbnN1U1VLWEJUbktCejlXWG9h?=
 =?utf-8?B?c3VhTkF4VWk2SHVmTlFaUzIwLzNEMEJDeDV0aW5qVW5ObzdhZnlyR3ZxVUs2?=
 =?utf-8?B?ZDBTT3pzYWJ1c3RaVmU1Vi9wcEh4ZjFvUkx5NkQwM3VSTGlJWmpZRnJ5Z21V?=
 =?utf-8?B?QXZWWjVablNGWkVwbWJLVlNuK0Z6S2V0bm0vYWJoZ3JPZzlZZXZ2TUQxVlpw?=
 =?utf-8?B?WE9uRVo2ekU5WCtCbHhqTWd0RFY0M01aYnRLblR6dTRiWHY4TWROU2NyY1pH?=
 =?utf-8?B?T1k0VnR4b0YzVlM5bWdNdmV5Zndqenp4UVJpMlJ5MWNvU2pET05zajZXMnY4?=
 =?utf-8?B?NDVjSGI0ZjRMYzRzTGdTdzNWcWRhUGkvdk51Wnp4bHVzSlN4SnBYcDNGTjg1?=
 =?utf-8?B?emhkOTIrOHlsRlZtM2VjcHc2OWdpM2N5SUQyeTJQaVBaUXVtR1RJK2dOa3cz?=
 =?utf-8?B?YWVhTzZ0aC85d3ZEMy9HR0tTZTNQTitHbGRKUHZWSm9kbUJIcXFSemh0RGFK?=
 =?utf-8?B?UVA3QVpVbFJSZ2dpcy9yVVFFajhKVU00UjJNR3RsOTRaZkFrVmxtK05HRHk5?=
 =?utf-8?B?M0tQT1oxWVZjNkNVL1hFNmQ5cld3Zklob0VaaCtKemZpQUxoMXNTNkhEWHF1?=
 =?utf-8?B?RHorWjdKMDcrR0xENHZMRHh5amVLa1N4SmMrK3RkQjZoWjd3dG5LMEw0TEVk?=
 =?utf-8?B?ZVlwUHZGNitQQWlCdWVEMEc4L3hNVUpzQXhnYU9jK2o1MHNpb05KeEtSNzJG?=
 =?utf-8?B?SzduVStrMXV2WEdzb1FTMHViMHhEYzk3a3Y3amdEYk5ncURkQ09uTUk2aFZL?=
 =?utf-8?B?U2NlMURzai9GYXBaUUVtc0o1MjBMQnEyMENaRERvUU51Ty9BQVpmK2YxZnJi?=
 =?utf-8?B?Y1RPc0xxTGJEQi9Jclo5Nks1c3FhdTNuRE0yd1piS0UyVFp2RXhvUUQ1NTVr?=
 =?utf-8?B?NXBxdkE2dzd0ZWlPeklpMUh3a3F1TU9sYWtaTWhzMys3ZzRCNU4vaDJQWGI3?=
 =?utf-8?B?YlB0aTdCcko2dzNhOTNsTS96L0xwWmorMUExb0tQVS9RamdHOG1FQU5VaXc5?=
 =?utf-8?B?dSt3Ty9NeklXS1B1TVZmd3VIdzVyY3JERGNDeDNVbWI0Vjdtem5VL051WjRw?=
 =?utf-8?B?VDNaYXE3K3R6MW1BUXB1aGZOd0JsUXJabm9VUHYvVWhhNE81clJhcGVJVXor?=
 =?utf-8?B?MG1lVEtUcU51blo5SEswOWZCZGc5bUxCc2lTWGxGbkJEM29tZDRBQ0NoVUhL?=
 =?utf-8?B?N0tsSGJua1YvaVVmdEFlWFhrbnBpWmsvUUkrYytwQ0l2TjZSUlozUjBiSUNH?=
 =?utf-8?B?dHJtZlFOQ1ZlVTlDdkhWQ2RvNEsyUVZHZmJKM3FuN3dxaStoV01LY1lIM2hV?=
 =?utf-8?B?M2NFd1FpVUt2b2RDREVEYlNUa3pyYkwyaElmTWpnSGxwb2FjckxsQzQvLzRs?=
 =?utf-8?B?UUJsazZEbDZVeWhkeVg0bDVVdjhSbWF1MWMzVmx1ZVprT2s4Y1ZBcW9ZR2s0?=
 =?utf-8?B?OFJOWDl5Z2ZlMUo5UXZVOVpJcTRSRG44amtWR1pSb1NqRnFJa1VlRkErSy9B?=
 =?utf-8?B?blFRU3ZhVkloWUU1Szd6UnR0Njg0ZDZPYjYzUU92Uk5NU2p2bkZZM1lJR1h1?=
 =?utf-8?B?NDI1RFJJQndwSWdOd09vazVOamVhNTIrL0JJclpIV1JhZGhyNHp3SHN6aDdW?=
 =?utf-8?B?RS9QMFlRTzdZS2w5N2VyTlRyNnozUGo1NmtEaGFSZ3VPbHBTc3FIdUxjZHpu?=
 =?utf-8?B?aWpBZDF6QTd0SE1DS3dMK3UvRk5QNzlJY3R6c1ZFRURJbS9uaFJ6VUY1U3hX?=
 =?utf-8?B?dzhtZTVpQWU2WkdPb1E3S2FyUXBPd3c3UVhLNksyVlU0dUhvYzNEdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e074fad-64b5-4a5c-1312-08de5f248d3b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:52:52.8100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ee9jDs++JoRcirk0+HhJFRcJRuGmltgDPDHJ/fxBjnfQaft3EJ7g6ubFcyA9HZN8ByurKDylakgPwBBGbY0hkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB8319
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,Mac.lan:mid,citrix.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BEF0DAF2F6
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 08:53:05AM +0100, Jan Beulich wrote:
> On 28.01.2026 20:06, Roger Pau Monné wrote:
> > On Wed, Jan 28, 2026 at 03:46:04PM +0100, Jan Beulich wrote:
> >> On 28.01.2026 13:03, Roger Pau Monne wrote:
> >>> @@ -275,7 +339,18 @@ static void populate_physmap(struct memop_args *a)
> >>>              }
> >>>              else
> >>>              {
> >>> -                page = alloc_domheap_pages(d, a->extent_order, a->memflags);
> >>> +                unsigned int scrub_start = 0;
> >>> +                nodeid_t node =
> >>> +                    (a->memflags & MEMF_exact_node) ? MEMF_get_node(a->memflags)
> >>> +                                                    : NUMA_NO_NODE;
> >>> +
> >>> +                page = get_stashed_allocation(d, a->extent_order, node,
> >>> +                                              &scrub_start);
> >>> +
> >>> +                if ( !page )
> >>> +                    page = alloc_domheap_pages(d, a->extent_order,
> >>> +                        a->memflags | (d->creation_finished ? 0
> >>> +                                                            : MEMF_no_scrub));
> >>
> >> I fear there's a more basic issue here that so far we didn't pay attention to:
> >> alloc_domheap_pages() is what invokes assign_page(), which in turn resets
> >> ->count_info for each of the pages. This reset includes setting PGC_allocated,
> >> which ...
> >>
> >>> @@ -286,6 +361,30 @@ static void populate_physmap(struct memop_args *a)
> >>>                      goto out;
> >>>                  }
> >>>  
> >>> +                if ( !d->creation_finished )
> >>> +                {
> >>> +                    unsigned int dirty_cnt = 0;
> >>> +
> >>> +                    /* Check if there's anything to scrub. */
> >>> +                    for ( j = scrub_start; j < (1U << a->extent_order); j++ )
> >>> +                    {
> >>> +                        if ( !test_and_clear_bit(_PGC_need_scrub,
> >>> +                                                 &page[j].count_info) )
> >>> +                            continue;
> >>
> >> ... means we will now scrub every page in the block, not just those which weren't
> >> scrubbed yet, and we end up clearing PGC_allocated. All because of PGC_need_scrub
> >> aliasing PGC_allocated. I wonder how this didn't end up screwing any testing you
> >> surely will have done. Or maybe I'm completely off here?
> > 
> > Thanks for spotting this!  No, I didn't see any issues.  I don't see
> > any check for PGC_allocated in free_domheap_pages(), which could
> > explain the lack of failures?
> 
> Maybe. PGC_allocated consumes a page ref, so I would have expected accounting
> issues.
> 
> > I will have to allocate with MEMF_no_owner and then do the
> > assign_pages() call from populate_physmap() after the scrubbing is
> > done.  Maybe that would work.  Memory allocated using MEMF_no_owner
> > still consumes the claim pool if a domain parameter is passed to
> > alloc_heap_pages().
> 
> Technically this looks like it might work, but it's feeling as if this was
> getting increasingly fragile. I'm also not quite sure whether MEMF_no_owner
> allocations should consume claimed pages. Imo there are arguments both in
> favor and against such behavior.
> 
> We may want to explore the alternative of un-aliasing the two PGC_*.

I expected the PGC_ bits would be all consumed, but I see there's a
range that are still empty, so it might indeed be easier to remove the
alias.  Let me give that a try.

Thanks, Roger.

