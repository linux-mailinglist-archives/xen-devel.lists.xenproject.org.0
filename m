Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iL07Kcd3+2lnbgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 19:17:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1543D4DEBDB
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 19:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301999.1576100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKfsO-0006NB-Qr; Wed, 06 May 2026 17:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301999.1576100; Wed, 06 May 2026 17:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKfsO-0006Kv-O3; Wed, 06 May 2026 17:17:36 +0000
Received: by outflank-mailman (input) for mailman id 1301999;
 Wed, 06 May 2026 17:17:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Mario.Limonciello@amd.com>) id 1wKfsM-0006DX-A4
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 17:17:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKfsL-003Tfk-17
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 19:17:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Mario.Limonciello@amd.com>)
 id 69fb77ac-e002-0a2a0a5209dd-0a2a4505cdf0-2
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 19:17:32 +0200
Received: from [52.101.193.40]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Mario.Limonciello@amd.com>)
 id 69fb77aa-aaa8-0a2a45050019-3465c128b09b-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 19:17:32 +0200
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by EAYPR12MB999133.namprd12.prod.outlook.com (2603:10b6:303:2c1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 17:17:28 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 17:17:28 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUAMcVnGEQCivMmKagwzrNPHXAQZYjW5+Nq3k6Sx7iHvq810Uw1Kka1s4sbvCaVsxqGWH5QB4mIJXPx70ELVCSvuMYCBKDqhQNYwchjvuclmlCv1Dh+dRBJVNIvaDg2HGlma1oJPnrU8qgunR5l577vQOYDYgEzDN7S1HCTmfMiaRauZP9XZXGc+EOYwBmucHcY7LhkHA9dXSR68Jg6yj/vbVMsSqtVGt31OknIOhibL98vYfzh/5CYzdE1oLaZwYtZU0NjOjPO23gcinPh3jpSes+IUYqg/X1SQVeM4l/PsOckLKRpeIT281piRlRshqz6j0m3g3xmAi70Ko9U+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9NVsZpXp7wdlk3ZA4diyLo0TbxzKlpQAYGTEuHvLiE=;
 b=mifkQextXN12Wp5yY8QJudUlY0kS98FIupFPiJEvjbPEuwp0y5Z3rfGv0aQbTi1HAHqQQZ1bsc1DHgaRmZnRnOF4Hdks61lCR/77frol33mjZJfFj2CLw9+AGv4j3DM8DXOIElxZm9Y91F9rTJuSz+uG+O+9M/4/7XVOoT0cxJsT10V8y8vUmJZI87EfxYk4oK1rmYGwiXbGnyLOjSpKzGiTSZVtXlk1Tzwtt6cXe7vyWwsZsDZNjNe9UN3UeXcpaBdrD9Htzg+NsG37ReFLHBPrPBbs4kKy0iJBF3vXk0blKSy7VS4dLNXSHBzs/pZidA24OY7BSj6+z6+Rh6VysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9NVsZpXp7wdlk3ZA4diyLo0TbxzKlpQAYGTEuHvLiE=;
 b=kWHG2Od6GkGCkun2qxecFD8JQ1IZOV82h+YjUSKs8/TDBYPcfh013wqxKHwZ3NIb66yQQdQHfxekxUOIr4GLbOGYGMz2WZ7KwXsr79DUwEur9rRCKh8n8LX9whdYz6Vp7QoOnCo34FM/doFzxCrrU0gCk/6iPvZbtMkSEHi2R0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3d73ace6-5eeb-4a1d-a502-4dd5b0d73dab@amd.com>
Date: Wed, 6 May 2026 12:17:24 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] x86/amd_node: harden amd_smn_init() against Xen
 dom0 topology
Content-Language: en-US
To: Penny Zheng <penny.zheng@amd.com>, x86@kernel.org
Cc: ray.huang@amd.com, Jason.Andryuk@amd.com, stefano.stabellini@amd.com,
 Yazen Ghannam <yazen.ghannam@amd.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20260506055528.476493-1-penny.zheng@amd.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260506055528.476493-1-penny.zheng@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0071.namprd04.prod.outlook.com
 (2603:10b6:610:74::16) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|EAYPR12MB999133:EE_
X-MS-Office365-Filtering-Correlation-Id: eef7f5c5-2edf-485c-81d4-08deab93592b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bvc46vqeRimItM6WYtWznDxyFdUTg6fbucRTVK9OvbE6F0ioJDNWrNI0UmNHb57LLTiJcPw9N+tD8AvW8JvPD3ULbWCmAqWOFYmOWU4fSkW0Axk49Gt/n+GjEwhCG3aV3R69Twm1mO2FbTaz38Ka0dSeZsZ6v4FMpJ/MLqx8225CAAw4FRUEpzitgkETeqUFJGqMDMYxuhtD4eiZxp44Js1gdcMdSH2y0TaUKcZQ07os2ae+rIFmm85RgEKhFxjmpleinLIpgDv6TkFgEBf5l+1ZbRv/1l+x75fyP9vkTL2JQhJq6A3cS9rCWGmliC7Wd52xnmDjTJwL2eJMsoaDGewqVltGh1NK3E5j2Wo4Phh7jArFYj/Sw9KxP35JT82AfocOWi21OgT/jvQ2hbN3vueUUHneOYv0JIcBr6WPd+hiQtI5/051cptKPFqzC2XbS+BgIaXmWFzQoivhMn6IKuP+M4LR2gZxCDHu1Ky8zlqqyJgfssGPGfOd98jGCJV32+0HY1PbTqZiYMRNsa68tIdWr+ir7p5Mbxy8W7P1jMX28D4f0vEcKqjFsiidxeB2+SdbUPynheUqnWTmVTVQGZ3nvzResEVZLcImIjx7TweDa2tx1B6Ed1fx/LAaGHmgwQMh55gW8fo72O+CJV67FjIVMFhZ+lBLu5tpQ8h4BGt/ifPjmb1yhTRGYvMP7uf/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZUVHdFdnaDZrNWIzY3BVSFp3RjVMRUVBL2pNQ1hibDFJbi9xQXhkcC83NDRu?=
 =?utf-8?B?b054d2ZQZXJhbUliRU92QlpIYU9XckRNeU4rbk1RYTJ6RWtya0FoSUNEY1g5?=
 =?utf-8?B?WHg0bEQvU2dqcE83OEpoQXFNTVE5WjNjUzRCa0tTaW1iRW9BcXRmbENuSWlW?=
 =?utf-8?B?NFlNc1dIa0RQTy82Q05ScGZoNEM4VWI0dXRBazJoK1BERHQ2cy9SVDg1Qmxq?=
 =?utf-8?B?SzBQdndUeVFZVjQ2SXZEQktTcWZNbldDbWVSZ3NpaTVoYnNiUzRsWW8yOUpk?=
 =?utf-8?B?NVlVQlFicVdKOUxNNDNKbDNudHdGdWVXeVBlM2FLV3UzSWg4UjZtYW1aclFX?=
 =?utf-8?B?NDlGUlNmQWRIQXRUb2VCMGoveWpTZmdwUGRsT2loeDZ4Vm82Zm9pSW5vRWhk?=
 =?utf-8?B?dEZtUDA1WldvaUVySWJHNkliQng3KzJFWk0wNHhYZWJRMnpmWjBsU1QwVllE?=
 =?utf-8?B?RGNxSlBpYzJHK1E4VURNYmVRK205RjR2a0NzdEoxMzQ0REZKRDViSnVsdzBy?=
 =?utf-8?B?VmFJaVQ5cGlSaXJORWoxY3MwcG8vTTZPMllQcnZBOFVNK0lRaHY0Z1N0VmtU?=
 =?utf-8?B?OWI2VDJoUzIyWUlPSDBOaHNEK1E1d2E2U0tzK1hJTFZ3YWVtZ1FnNmFwMDhL?=
 =?utf-8?B?WmV1OFhraEdPbWkvWHlMTDA3Z2lmcGs5UERXUlRyUldFWFF3TkdHenJSbkFX?=
 =?utf-8?B?VnU1UnM3ejhTYThpbHd2d1VveTZUVmI5WXJrcGIvUmI3TUJCNFpSM01aS1kz?=
 =?utf-8?B?RDd5Z3U1NGZLbGIwK2hrS2VkeStQTlo5NEFxSk5GeE9yenVvTHJKK3M2ZFpr?=
 =?utf-8?B?YXhmQ1B3OUUwVmJBSnJrdnpnUk94SDJWSm0wY2M3R1dBZTNpdkc5alNLWndr?=
 =?utf-8?B?OUIvdTNWSGtFcUlwQ2o0bS8yQjZLcVVkaDV2Ykpja0NLMFIwa3VhOVFreHZF?=
 =?utf-8?B?UkVMcWNhNGdjcHd4ZnFXT2U4d2hLRDRLQWxNS0tHTDNmNkdtVUJmWlBWOEFj?=
 =?utf-8?B?VU9sOUpXWGc3cVhIOXcybDVLUW9DajVWNzBqdUY5d1pOMDh4bFI3eDAxQ2ta?=
 =?utf-8?B?aXd6dkNjalovbVpPRG9ZS3d6NFNKcTJQYndEbkFNNHB2ZkdGRjI2ajRlWEUz?=
 =?utf-8?B?Q0JpZ0NmOS9OaDdwbWpaNVMrK2wrd0N2TDh3dU5FSytQS1dFLy9EMjJxWGdC?=
 =?utf-8?B?d3FvSi8vb2tDb3pnVCtJTm5FY21LU3BPbVRhRDhCYkZmU0xZR0JqdVI2QWNO?=
 =?utf-8?B?QkxpeDRBYkZ6YVRHZklKSlpvSE9WT2I2S0lPOGZZY0w3TUQyTTM5OE9GM2tD?=
 =?utf-8?B?ZW10aXFjTjNJcm5tYm9OMmdVVTFybXFKRGZ3Q3R6VEpVaG84UGcvejgwZ0ZE?=
 =?utf-8?B?SnF5L2o2eFNoOFBUdzdZV0pxNnJ4bkl6MjdpSjlLcWxNbWVWMnB1R3NWUmRN?=
 =?utf-8?B?ejJoMGEzZ25COHg1U2o3K2JnRi9SMHFuRFRmTzZxRTBHMjZuVWtQaEhEemFq?=
 =?utf-8?B?UDcrYWlQMllrMitFUFdXZkl6ZzlNNk9OTjFZdWVzdy9LTWI1cE9SNFdDS3U4?=
 =?utf-8?B?QkFmMjIrQXFxTUlsSStvampPeWd0Yk9NTTNocGFPRXptYXRibjVzb3ZtNndt?=
 =?utf-8?B?Y2FBVENwWGVkV2IvNmFwOUM4U2RXWXJCSERFdVlDZEMyV3UrdmoxU3VXODN4?=
 =?utf-8?B?RmtwWkNzUW5DZ3RQZzl4ZHBjZWhpeU84bEpiM2xvdG0xZ3pHcXpIS0s4aXly?=
 =?utf-8?B?TmF4QUVXUjIwYjc4czBRQTFSd200SnhnRjlpZURZWFE0czh5anZKcFZEWWZU?=
 =?utf-8?B?SUVyOENJbEdkRmgrL3p6aUpFUWl3clRQU2Z4ZHFIbXdZUmhHQnRRS01sMWRp?=
 =?utf-8?B?aXM1eFhBZ016VFd4RDJCVVpGSFBOK25laU9kcFpjRXA1U1p1bEk3KzhyZ0Yy?=
 =?utf-8?B?QzJHOXNXMCt4aHp6ZS8zdzRPMjNkSHpwdDhrM0J0YkhUcEZVTGNlYzhaSWd5?=
 =?utf-8?B?by90dUxINCs5bk96d01EaDRvVm9TM3ZyOVRHK1ZTcUhCa1pzNFJ4b3A4NGpn?=
 =?utf-8?B?RHhpU01LZTk1OTRIOEs1L3BIZDVPSndhZEpCRlVCdjNCOXVjaVpaTGdkSmU5?=
 =?utf-8?B?TFI4cnpzZHJxcWVwMkphYUJVZzkxaTc3bzY2SncyZ3hiM01rRTM2RFBBTnpz?=
 =?utf-8?B?ajBQK2hkT0ZoRGxHeWdXd3NoWnFOWk9DWDBqRy9vMDlmODVENVhtcVYybkUz?=
 =?utf-8?B?S29uMGN2NkxVY2F4NXlDNmR5anZSbFhveW9RRHI2b0VrVDJ2a3NTeVpxL2RZ?=
 =?utf-8?Q?nccnyrrJqZOhhMyBS+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef7f5c5-2edf-485c-81d4-08deab93592b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 17:17:28.0055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pe4W4i5eSBwlVpF+hJJ/GzKSZyPRhwO10n5YOmD4s9k/3nTeQ2ajhaoKU6zLxw/1MUJRfKSlU5XHmdsCAKiFDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999133
X-purgate-ID: tlsNG-c201ff/1778087852-D3D67443-96C7A2FF/0/0
X-purgate-type: clean
X-purgate-size: 1389
X-Rspamd-Queue-Id: 1543D4DEBDB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:penny.zheng@amd.com,m:x86@kernel.org,m:ray.huang@amd.com,m:Jason.Andryuk@amd.com,m:stefano.stabellini@amd.com,m:yazen.ghannam@amd.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]



On 5/6/26 00:55, Penny Zheng wrote:
> While booting a recent linux-next kernel as a Xen PVH dom0 on x86, the kernel
> oopses very early during fs_initcall:
> 
>    Oops: divide error: 0000 [#1] SMP NOPTI
>    RIP: 0010:amd_smn_init+0x188/0x2e0
> 
> Followed: on a kernel that survives the divide, it will fail by a NULL pointer
> dereference from the first SMN consumer (amd_pmc_probe -> amd_smn_read).

So to confirm - does amd_pmc_probe work properly with this series now?

> 
> Root cause
> ==========
> 
> To prevent each dom0 vCPU from looking like an SMT sibling of another
> vCPU, Xen synthesizes guest x2APIC IDs as vcpu_index * 2. This spacing every
> vCPU's APIC ID by 2 can push the synthesized IDs past the package-field
> boundary. Linux then infers more "packages" and therefore more AMD
> nodes via amd_num_nodes() than the platform actually has, while the
> PCI-side host-bridge scan correctly reports the number of root complex.
> 
> The fixes are tested on Xen 4.20 PVH dom0 on AMD Zen (16 vCPUs) on top of
> linux-next/master (next-20260505).
> 
> Penny Zheng (2):
>    x86/amd_node: avoid divide-by-zero in amd_smn_init() under Xen dom0
>    x86/amd_node: reject SMN access when amd_smn_init() did not complete
> 
>   arch/x86/kernel/amd_node.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
> 


