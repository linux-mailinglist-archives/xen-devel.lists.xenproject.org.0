Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJEkJz8TcWlEcgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:56:15 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07A35AD36
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 18:56:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210130.1521951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vicR0-00014N-Kw; Wed, 21 Jan 2026 17:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210130.1521951; Wed, 21 Jan 2026 17:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vicR0-00012v-HC; Wed, 21 Jan 2026 17:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1210130;
 Wed, 21 Jan 2026 17:56:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZBm=72=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vicQz-00012p-AP
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 17:56:01 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 710ff9ad-f6f2-11f0-b15e-2bf370ae4941;
 Wed, 21 Jan 2026 18:56:00 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by SJ2PR03MB7500.namprd03.prod.outlook.com (2603:10b6:a03:559::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 17:55:53 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9520.005; Wed, 21 Jan 2026
 17:55:53 +0000
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
X-Inumbo-ID: 710ff9ad-f6f2-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kP2N5f+yNmNDsKLwddFWZHeah5yY7zrnJN7brJdupBuBPgQ6e0uGmZyufD3pkIny4e1O4NP5WNFqmaefiwUZO50NBK181L/mNl9omPptkit0o4n1zOU1o1OGdCuP0gUhfCgCtJCY4eU2iAMPqNYHdXTIiPpblVSAPGtP1DfAn7fpPmmYn+m8ztqJbjakOxgPXPsqJSWFVwGMYA3+STeC67Oel3w1Jbk4R5tkudv8kcX6M0mAl3NZM245cOe6vb6g8IXTRdgXjnV0qOK8b5qvLPN+j0KAYghgsxoc192nH4iEwZTVNMqF6DFmPsYZCMrYp2pZH+WhHKu7Kebo1n8lBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXLG5js2bmCVC7w+J77wWpSarpQwuBXm6HqW1ce1Dkg=;
 b=jquJf3CIl9eL4Ndtwict7W6qUIVrrOT8dVzEVITSo4w+Is/X6ehiiAUCXlR5UjWwH2ned2u5kAdmyueM/byJgVso99S9KTegSULtlwAcmUDB3wpEc64o/kR4ZNizLzpGSWNrdwLWgKORclp1anEQrQDswqsBwOj3PhaJeDwfI1F9odwen+Suz//hCA9EN54usIWfA+vGxRnjlmo0/9iVUom1IeqVd5NXtstwI51C1FVVJHakL5rAPxFJLU6kCN5WRHOo2jmobM7UAlwVKmYDDZ8R/9yR+KGgH8ho8VHXbLEFVMwkP/681zY4qbeBalbo3bcNSiR34wBrjwLq0gcn1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXLG5js2bmCVC7w+J77wWpSarpQwuBXm6HqW1ce1Dkg=;
 b=NZk95bryHK+WL8oAs/Uzzr+XvNgAYoNfBW80yynljRb34cfn7WhMPcTk/77oqo2uw1IYbQSrbCdtlgLz+rmMsdh3rTRyeFPT3XnzMfUtShVFngS3WgKbrEAXcshjR/8tWFTV8PkHXPysqLZCrmu8NZvJTob+ysdy4w7zb3w0aOY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 21 Jan 2026 18:55:49 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 2/8] x86/HPET: make another channel flags update atomic
Message-ID: <aXETJWncmyiXqf3s@Mac.lan>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <757cba5d-2c9f-40ae-8eae-6309979bbba5@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <757cba5d-2c9f-40ae-8eae-6309979bbba5@suse.com>
X-ClientProxiedBy: MR1P264CA0202.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:57::19) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|SJ2PR03MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 014a11d4-8280-4f90-847a-08de591651b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0lZYWhRS2VUSDB6OU1rWEZYcjdmMFZlbVdOYzZSeW4yVWxncDBRU0xXUVZy?=
 =?utf-8?B?cFFXK2g1eGJRT3ExSU9iUGt1cEdGdTNvVkFkOEFqOUxxNzZRNmxrV3BaVENl?=
 =?utf-8?B?RjNOZG5DVE5EdGk0eGoxYmpMQ0tYblQ3NWp3WEtQTjBDTTZ1WDJGaHVYRUxE?=
 =?utf-8?B?eE9XVW5BUXBhOUk2UTRpQTB3SGZuekNDRndOOUM3bmRRV01DQ2psaFl5S3ht?=
 =?utf-8?B?NjBwWjFYalFxWUNmM2YzZzZiQ21sWkJnYUsrWXFTOVNCMy8wbzdFcUlyL1l6?=
 =?utf-8?B?M1hoWXhINWtaTXZ2cGlPUzRnWmhxQ2dhZXQxOXllSjFsUTdEZUppbDRUTCtH?=
 =?utf-8?B?c2pHWUZYQWE5RGRHb1V3TlVIcFdKV1QxZDNqemo3a1hYMTF2MS9vd25yWmda?=
 =?utf-8?B?c3I1WDZYTGRuM0VoOHJaRC9HNjlRYkR5VXJWeUlJZnpZRWhDTWwxTmoraXhi?=
 =?utf-8?B?Yk5mU1VVMHhGeElXL2VLL0xYWVRkUVB3NVltQzU4R3lBN3o5VzZSeWtycU1v?=
 =?utf-8?B?UGIrMVVVbElZNmpHUXkrUHdwUVdmaXQxSHZCa01FSXV3UG1MZEtUUGRGSnR3?=
 =?utf-8?B?MG11ZHZhUTVyVTJkam1ocmRRTUhyYTU0VzJXckRQRTRWTzl2bFN0VTZCcy9G?=
 =?utf-8?B?U1BVMElCY24wRHovUjVFK0o0TVlqOWpIWDF0TWF6NDlic1pFRmNCejhDZzdm?=
 =?utf-8?B?bzZ6R1kvaGtYY0ozcnp5TnB5bllSbXlYNS8yNTEvRTA3ai9yVHRUaFhROFRR?=
 =?utf-8?B?RkUzMXVYQUFNTG54YTF6bU5teThBZnJTL0VJQ3JHb2RFSVRoN0dvMUFhSW9o?=
 =?utf-8?B?cmg2Slk5Q3J1eXZZQnd5aEFRcUJ4SmpZMm0zNk8relZsNWtqMFc5Z0JZeFpi?=
 =?utf-8?B?ZXlkcER4OGo0MmhucnVZek9lVDdGRTRYREJ3SHA5OFBVc1ZmMVVUZ3JuSCtK?=
 =?utf-8?B?ODRUUENlanhWRW1PQXRGN0tBZjFVRTNGVDE2QWdrMzlKbWpqN3Ryb1BrVENO?=
 =?utf-8?B?WVB3T1F0bWtXZXRJeGZaRzBlZzVQWndocUhqRGVCUXFiTkROZ3U5WEdWSW05?=
 =?utf-8?B?QktlWlVQY3FUWXhQUnlzSXJybWpsTjFSczJDRXhiWis1NjJ3UTlZMU1leGRh?=
 =?utf-8?B?MGtUZnZDVFFpemo5YXdjR2szVE41SnZaUGhRVEgyZXFKdXRFSU5vaGhkV1NN?=
 =?utf-8?B?aENvVWFuNkFrY3ovd1JFWjVRL2ZsU2NqY0JPdXdPSHZycFZRWDRxU1NEOHph?=
 =?utf-8?B?TWpOY3c3NjdqeHEzcU1WSXJ1WHpHc2JucEoxUnpuR1NmWWpyUVYvaEp6TWtv?=
 =?utf-8?B?cEtzaVJ3Q2Nmclladm5WRVlNeTFoTnpJVmd6K0xDYUx1MnF1dmdKSlo1Wis4?=
 =?utf-8?B?b2JHR0ExL2phVTNOU1hDYTFvd2VMaU9LM0ViWTVGV1VxSld6dzFLM1Z0eWpZ?=
 =?utf-8?B?RFFYeDlVd2lXSko0UUxLYmFDblMraDViZTNlejF4dEdpMU1TNm9wMnFNNE5k?=
 =?utf-8?B?bVRGWW91b09wcExaS1dTdk8vc2ZBdjhHeS96VHRJY2lKZXd6VmlneTd2Nk1x?=
 =?utf-8?B?N1NhbTlWbzROazhXK1JsZnU2REEzTk8vMFJUMEFreEExRDlhd3lJQzdSMG0w?=
 =?utf-8?B?ZE1EOVd0VDdiVGZvYkFlanFHakpEOXdFVXJaRTVXYWJtdkZQYUFoeVMxQ2Ns?=
 =?utf-8?B?cXVWSldJV3JIa1c3WTFrZUo4WlBpYnFSNVEvd3VHckthb21OdjFjOEIvcVNU?=
 =?utf-8?B?K2Q4Ulo1aW1vcmZha1Nmb3ZRYTI2RUVYM3FQU0V0U2dtVW5LUzZxM3VWdHEz?=
 =?utf-8?B?bHErd2FGNzVOSFQ3RW9NMmxSaURXTXZGVG1nOFhRTUFienhoNFdFc05TRS9Y?=
 =?utf-8?B?emVya0NaTUdEbzVZdnVRSHpKT0lHb2hveGIyMlZYSFFTT1REYkNNR0lSRitI?=
 =?utf-8?B?T1JQUkgzTXhKL1JiajJBMGFkTDh2WCsyVmVjQUliN0UxSFFqUDd4dmQwOWNQ?=
 =?utf-8?B?N3BicHB0bHVTQkNoWisxNzExMTlwdTNRelVtQnZ0S3JoK1FqOGdqaEhncXlo?=
 =?utf-8?B?YzRnTTd6OVN3WlFQWS9aUTZwWFFaR1lUZDVTMXhLS3FlYjNaSXhVbm8wZzQ5?=
 =?utf-8?Q?QI/c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGZGK0s0OWVnZ0xxaWtFWEZCcmcrWEJDcGpaaTlxSjB0cGtPdzVvTFovTXMz?=
 =?utf-8?B?eXhtYTBjTXVnK0t4ZXlHV3o1Y3RpRlBJRjVrMWdva2Q4U3dNd0dIZ0JxR25D?=
 =?utf-8?B?K21KdU9LY0RzUEhpeVVXR3dlVWRsalhYTzRqbWZUd1ZLY3M0VjNmenRaZWpD?=
 =?utf-8?B?ZW5URktxUkVaYW1ibmhNM3A3dmFjQ0FaZmVPOUU0ckt3WEtTblUzRHIwZnlW?=
 =?utf-8?B?UlgyT1NVaFJWbTRDUURYdklTUU4yUE1HK0hmNkcyQWo0M2xBUWxQOTB0Rzlz?=
 =?utf-8?B?M3B2WXkvM3l0ZUU0by85SVdmcjgzOVcrdm84YytGKzRmZkpjSGxPbFRlcnZh?=
 =?utf-8?B?SjJVUWJuNTdPRTh4QU1pZVQ4ODNMS084bGFUR3dTMEUwdkJ6RUlmd2xFanU5?=
 =?utf-8?B?c2F2SkZFNGNDbWYzTGFVK1Y5bXZYTER5YUVBdk5iK09sKzdmWGpwWi9uTkQ0?=
 =?utf-8?B?MDVaZWVRalZETmdNWDd4Qng1WDFWVTdQNkZpOG9ZYVd5clp4MTJYQWRKb3FY?=
 =?utf-8?B?azFTc3F4b3k0ZEZVMCtnZnk5eXlzN0d5WDRqTnhZRndhZjN3K0JaSFlxV1N1?=
 =?utf-8?B?SStOSEsxVnovTGZOd0RUeEIvUWQyRU9vc3l0N1VhVHNqb3JFNFlxM2grTlVT?=
 =?utf-8?B?Z0lzQ3UzUVpKQmxwM0I1NERuSnhodDdRdTdaTDJXMDFxV0hsbmNTdmN2eUZX?=
 =?utf-8?B?cmJDY2RTNDdhVnQvRFhPVFNqOE1nR3A3dzBvdkZNZ0FaQlRZTVpKYW9JLzli?=
 =?utf-8?B?U3JTdU43cmtBT3ZON1pVV0E5dXFyekVFemFYaHNLUWV1T2xPR0w0U1llUzBa?=
 =?utf-8?B?UzRiWG5YbXpaNTJhMms2NXRxay9WYm9EOU1tenNtbWs2dncxeEVXVEdrUzUv?=
 =?utf-8?B?ZjY3eE9HS2E1YTlVUkdxdkhtOTUvRno5bkRSOVZCaTRwRDlSNXI0WXlxNitV?=
 =?utf-8?B?NXlVZkI1cmdIbm5Gei9SNDAyWXBSL3c0QUNJL0NzbXRzaUM1L2FlY25xdmpJ?=
 =?utf-8?B?c2pNSnFxd0ovaHJ5SmtTbHdtS0t3eFR3dHIwZXRhZUc4b3IzVFlHUUloT2Zo?=
 =?utf-8?B?eDRZVGZ5MmE0MkxSUHFQdTVLa290OTQ4SklhYSswaEhDSXhCYXpmSVpkc3JZ?=
 =?utf-8?B?bXgrSWpEczlJRHczakU0ODI0czhvNWFhTXkwaWlJRTZoUUdUZ0M0WG5aVXJT?=
 =?utf-8?B?L0ZxSVRITlZoUHAreTNXWWttVTV2eW9qS1lhRlV5R0VZVGc3YlFOVTRkTE52?=
 =?utf-8?B?S1NKbVVzUllrMy9XVXVnL1JZSkVlaGEvOFRxVUk2dVlML1ZCZmthMHQvOEtF?=
 =?utf-8?B?djRFek4wUGxYTm41RzJJbGQ4SlZMODlCR0l6NnUzN2MwS21rTStjM0pnc01E?=
 =?utf-8?B?emVzd3hScThLS0R5b0lpeGZDK2x1TFlNU2VHSU1mTGJHRzF5WUlOSWxrWFdk?=
 =?utf-8?B?QXpSQ0gyZENCWnFOMnFFK0svb3VsRWNMc1diSTRoVGYzOG8rV2FOOVJnTmdL?=
 =?utf-8?B?cHNCei9Rc3FJNHpHbVdGMHFGYS9mTVY0RlJPSUJpUmNIYU1IdUdWNjFtZ3ZX?=
 =?utf-8?B?Uk9GcW80WmIrcGc2L1A1eCs3Q09nRmJuSVZNeWpQL0JFYzNlMnhlV1ExRWs0?=
 =?utf-8?B?RHVZdzFTUHJMY01Cbmc1VXQ5ZWNNaHNxVnFLdXhBdTlkSExWRmtBaExpUUt4?=
 =?utf-8?B?cEREYUlKRmR1MVd6RmM1OGg3bFFaUUF3bGFzYnZjdVJlam1TOCtPNG1oQTVw?=
 =?utf-8?B?elg0YjJUSzU3TVlXK0tvbG1vSkQ3TWpmdS84RDhIWWJlUUNQOWFzQUovR1B1?=
 =?utf-8?B?Uy9QMnNLQ01tZHJRclF6b0xwdG1XZmpOY0JFekUvN0Z1SEpKSzNnQ0pIanRM?=
 =?utf-8?B?Rm55VEE4MlkvRUZFR0xhb1YrbWUzbU91dWdMWDlySFNiZCtwRzF5a2ZFcmdE?=
 =?utf-8?B?dXV1cU5jMWpzTnNRM2pSeHJqNmVGb1lwSklLdEdBNk9qS2tBcDVyQjViWTNE?=
 =?utf-8?B?UklCWC92N2VUcjhWeTVzL2Z4Q1BOZDJsNWxCM1ZOZnhWZmFxWVJxYWtzMXlU?=
 =?utf-8?B?OTlHVHFaRWxuM0NuSHVxcDgzd1Z2allONlE0NzBzRWNlallmSk56NnlxWWNv?=
 =?utf-8?B?aVB3OFlpTmxhU0tpNnlqV0s3QzRwTmhRRG9CVFpuWFBFQ3BvbWd5MmVGVXMr?=
 =?utf-8?B?MGFtbW1pUGI1dXJDNDZXOXFBRWdSRXhyNlJKaHBkUU9PMWV4NDFHQlRRWEds?=
 =?utf-8?B?RStrY0xqY3JSQ2ZHK1dKcnJ2K0ZMVnZMLzAxeUl2V1hXVVAzenhsQnN3OGw3?=
 =?utf-8?B?U1F1Rkw4TmlkZ1VWb3Z6bHFRbjM4NmFJTVpDY1R6SVpQQnJGSEdxZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014a11d4-8280-4f90-847a-08de591651b4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 17:55:53.0728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SOTp7pNu8lONOEWVHwvJ2Ziit/M5KGIFVXwLnR6hy2HEJc0GS7xz6lOAFzq5w8wBIwC2RBJSfpWwwK0KBWh/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7500
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,citrix.com:dkim,Mac.lan:mid];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F07A35AD36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Nov 17, 2025 at 03:37:21PM +0100, Jan Beulich wrote:
> Unlike the setting of HPET_EVT_LEGACY in hpet_broadcast_init(), the
> setting of HPET_EVT_DISABLE in hpet_disable_legacy_broadcast() isn't init-
> only and hence can race other flag manipulation (not all of which occur
> while holding the channel's lock). While possibly any such updates would
> only ever occur when HPET_EVT_LEGACY isn't set in the first place, this
> doesn't look straightforward to prove, so better be on the safe side.
> 
> Fixes: d09486dba36a ("cpuidle: Enable hpet broadcast by default")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I also think it's quite likely that hpet_disable_legacy_broadcast() is
not possible to be used concurrently while the setting of the other
flags, that seem to happen in broadcast mode only, but better be on
the safe side.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

