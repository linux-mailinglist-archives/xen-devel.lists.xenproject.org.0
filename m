Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILZYJvf3BWqcdwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 18:27:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF86544AC1
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 18:27:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309068.1580245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNYtN-0004KC-4e; Thu, 14 May 2026 16:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309068.1580245; Thu, 14 May 2026 16:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNYtN-0004Hg-1z; Thu, 14 May 2026 16:26:33 +0000
Received: by outflank-mailman (input) for mailman id 1309068;
 Thu, 14 May 2026 16:26:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wNYtL-0004HH-0l
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 16:26:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNYtK-00AjxG-7l
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 18:26:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a05f79f-5cb7-0a2a0a5109dd-0a2a4507d06c-18
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 18:26:29 +0200
Received: from [40.93.196.40]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a05f7b3-229c-0a2a45070019-285dc428154a-4
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 18:26:29 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7799.namprd03.prod.outlook.com (2603:10b6:8:219::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Thu, 14 May
 2026 16:26:24 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 16:26:24 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tp5yV+91raebbHvwlBnZGe5tKCVwL0Xqy35L4koxYs4+ejfIRKJwLAAD/Gv8zlg357oEWsc2FhwAwiVX9WwoGmOIBHUvQBE1kCq2CaPykk5a7w4tOso6Go4sKNUtJ45ew2FmSzTKDiJbpH4ZQsOYVwPZwLYfsqlWdoIstW29yUjzHwSSKHMHthRhJsZKMS6O9ZNHmb+cQDd07+4Vz1brXbM+1U3qUYYP8zw59th3vNt/ONhPW5ZlNuVMWuFS0VGbL7lpGypKRv0vEiLTxJlh/3puZfbbzrs22/gTl614CbmIhePDe4LKUiRVpYBE+g9uU3FN+uvlgZuE9OealoRBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMZfNSBncFOBPZeQTJjXMyXDOj2Ez7s6CidBwskY5g8=;
 b=ODFXSNP8B9A9pJXe08UsntBz8GfLPZvCd+/oTXsTkxN1YPuz9LY97R5UP4BXTCXbF5QfWiQCZVMwohaIGn3FDbYwnhCqbazdykyCODmsRpxs/ZW7WVSCpBv4f0kPa6Xsno2cN8wUI1mD2KdQb7lP8tPTEYf2cWFly56boW7MgV4SF5joDb412YGmJI8Adur0JeKWhzmIdKfNAftOWVH8lHrNHDEYCLdtL3KYQ7Sd57VdC7V813/Bc/GgBNiO94k0NEXol0+d5l5z7nO0cm8+VEQxPpmz1DnxPiwIeGzLRTtNnrltt+uKJLP1liWBFovZKPa42iRqqY1khhTe0B53MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMZfNSBncFOBPZeQTJjXMyXDOj2Ez7s6CidBwskY5g8=;
 b=FShOhQK9PQ8dR/l+kllQi7jCfxHV78INaJcKoent3v7wSGUg6iwGs/VddfNyWdqXsfeo9Uc2lhZ25xmMOmpb9c0++aQHtimnV8Q5LzJ0g+w1Y0vK8Zq/TX1Z6tmuCn4lOkwKDUw+izBvWHH3bTpKQUKyUilvW78BjZydshqc2fI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <01d9db7f-41c5-4275-aa37-104e0d6ac4ec@citrix.com>
Date: Thu, 14 May 2026 17:26:20 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, roger.pau@citrix.com,
 teddy.astie@vates.tech, jbeulich@suse.com, jason.andryuk@amd.com
Subject: Re: [PATCH v5 2/2] x86/svm: Use the virtual NMI when available
To: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
 <29068558780bd9c6182d7bd74b357acc44409bfe.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <29068558780bd9c6182d7bd74b357acc44409bfe.1772109484.git.abdelkareem.abdelsaamad@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0040.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34b::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c558e9-0417-42a0-3519-08deb1d58a7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|3023799003|11063799003|4143699003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	jHEokVEloVRc17PSdHhczYvRScd6/Bw+1qVCDugMS8HNKgyXBBGP3A+hjNTGp6QzDauNqXgy0xhD/amfaZwQgae4QO7kskKgEUEaThRK8BskMhCWI8ZKBcgbVcIu42MWYvnEvZAYSTQElAMo4AcLPE8tUWwRf3NGvwQTo5fZHmDi1JphdwJ3P/bgw+VeNS+2Q/rEWyYij4MO75g33Q9Bz6Xlao1yK95DSXPvnOniLSuDdgF3/m8UnoBu95nxPNP2CZml3DYeRIasSWboZy4bvP+VtZgScvRVCaPyVO8MwoW3W0CO1YFA8BvzxmT4eNbMXjZE/uB/fuNHrpwzCxUrzvtigQtlj0XvSDAs9dh36rGP/RwWgoHovLW7fcYqZUD9sR89guESxEIMMzjPG5BgsDSh9C3XgdoR6owfkmoyHVQtQrqGZVi9l9v4I0CziHyDnXArDViLUaNQVn39HmVESHpNPbvZLUDPWON0q5U0vynIfiMshGswC77pfrUErbRJ2bmtss3YGrQev0zKOwsp2LMc8DCwM1GRg+tMERVK5G5fC0GHiQUJy9LQ1sFx6hovvpUKkSAsa8nMCuQNFXDueEGU7WHmL8WaSI7Ozdj7IDahompX4C8ycphGQZNMdz1nKtbLiRlJJei3erllJHUEcnc3j8hcC77EjPgAqs0ojdaHw3QQ1z6b3hP7CzeJerJq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(3023799003)(11063799003)(4143699003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkVkdWtLNHp2akNCbXg5NXVYakUrbXcydEVlbDNMQitFSVBJbW85WWNvZCty?=
 =?utf-8?B?dWhaa1RDZ0V6UEx5ZHNmWFJndUd5T0RCa29LdmtQMTZ0L3JsMGlsMXpGQ0pC?=
 =?utf-8?B?UnB3cDJGWEFNMC82M1BsaDU2UFQ2L2ZUM2JSWmxnT3o1M2xNT09MMzkvelFK?=
 =?utf-8?B?K1hrMGwxL0ZaeFRNQ0xmL25BcmpGcTgrZ29tbjFQUVdQbnpzR0EzdFZWOVNU?=
 =?utf-8?B?TGpUUlFyV3RxWGlRZnhRUVlaSkFuaEVIWGZBTVcrRVpESUttQ1Fvc1JmRlg2?=
 =?utf-8?B?UU1RTnVmY09Yd0RwMGo3bDhRQ21BajFXalVDR2R6NGpUZlZ3dmZzenBYNU45?=
 =?utf-8?B?Y0k1SHgvVk84Tnd6SlZLZkZwaFFsNWp3Q2NBbStyM2Y3Q09OZDNCSEhLOVJM?=
 =?utf-8?B?WGd3YnpRYWcxUGFpTzkrTU42T1FHYVFWeDNTcDBVVkxad0lFWk1ZdHlJRkMw?=
 =?utf-8?B?OFViK2RZbXVoREd4VFpSaDNZd0tXeWhVSUwrZnlQMmNGVFBjWTRTbnVrK2l2?=
 =?utf-8?B?OTF4aDI0eVdrK3F3TVhaRHNmNWJVTlZBSkduNFg5RWxyOHFWeitvK0NobS83?=
 =?utf-8?B?b3FTcDBHWWg5cVNWOGxkTU5kMjNRNEtyZkxvcEhTZDJhQjB5NVpoNXdjVEtE?=
 =?utf-8?B?bnArV2k3dWZSMDlSWFlobmtGNUM1ajRZQ05nUk83MDk5aHhhaFpOU3FIajJ0?=
 =?utf-8?B?Q2QyaG1YdTFPcVdoWGZpV2hTVG0yd01Eb3NLb1hBWUxOSlZEQjdPY2JqK2xh?=
 =?utf-8?B?VlpDMVkrb3UxQVhzczRSZzlEUjJWcFBaZzM1ZjBnN25uK28ydFB0RHA3UVlI?=
 =?utf-8?B?YmZqY3ZIREZac25hWXJ0YUN1YTh2ZDg0bThqOGd6dHdNZ01yMjF1VTh2RTVW?=
 =?utf-8?B?UmxOVUxyLzJIWkIreGxWMGd1YnBlWjZzQjdYd2hpb2c2T2RFdmVydmwyVXRu?=
 =?utf-8?B?VDFKdXRGc1pGUjY0U1FUbEJYOVVPMExVVnN5bDBuejg2RTZCcnd4b2RhU1Jn?=
 =?utf-8?B?QXRSKzJqTDRuRmVpTlBVSXRyNXlGK2lGd1JsOWV5THMrNW9JVmhmUnhtN2F1?=
 =?utf-8?B?NUFTUW1ITXNQTm4xb0t0M1JSbWw3Y0k2K1hvV2V4N2FaWTJRY0M1a0EzbERw?=
 =?utf-8?B?aCtDLzZOanFkWlA5UUxPeGs1b2lhNzF0UDNKRUxFZTdhbnBnWXdad0tZL285?=
 =?utf-8?B?T2Q3alVTVnlCejhJVUQwUmhQalk2amRVUTNiaDJ0ZElUUzdqRUxhODdlVENE?=
 =?utf-8?B?ZlU4a1lGTEJsR0lQRFFNMmVLbUxoSXg3REVjdDRJdmdzVEJsSEV2b3Joc1Z0?=
 =?utf-8?B?TWNxSURESHRKYTZVSzRSOG1zTm80M000aXB4ZGpHM1A1K1RGblBoN3lucFp2?=
 =?utf-8?B?NTZ3YjNaeDN5bWo3aXhEWDFIWVdFM2hDZ0UxTzIwRWpMdERuazNpMzNyRHZy?=
 =?utf-8?B?QUxKRDV4VDNBS1FkckVoMDhHbCtrd1ljUEJCQW9ySTNYbWI1WE43c0x1ZCtt?=
 =?utf-8?B?N0dFaDNKMXFOd2gvWFQ2Zi9DWEdzS0lTSXR4OU9TUlovYVJyYURiSkJNblpq?=
 =?utf-8?B?T1R3a2dpVzVBZnFqaDhRZFZVTzVURTVoS2pyVFN3cEF4RmVLZDN0bUR5N2ww?=
 =?utf-8?B?RitvRUdoaUlsd2pOc1ZNSFlTSnZFU29WK0NmZ3VqOFBkYXR3YVo0MVZCL043?=
 =?utf-8?B?N0xxSXQwdVZzWXd2S3ZiVjhIaGpEMVJIdTNzYW9lWDc0cmlGMDdSb3Z1S2xH?=
 =?utf-8?B?djdmdFVCSkFuWWtIUDl5dUdZOE5xVDRMYXZ5ZFQzZ0FuTGVEeTlOQ0FVVVZx?=
 =?utf-8?B?eXhYZUt1TWpQTzNyUnU2K3dvcnJxSzVDTklNSFQ3c0oyWnVTTkRxb3BVRlNC?=
 =?utf-8?B?QkZoSVgrLzBDdW5YdXBiM0dnNk93by9keVVFNGVsVUhJdWttVW1vb1Fsemho?=
 =?utf-8?B?ajl0QUJtTFRQc1o5cUNIWGxHL2hyczVBUy8rOHBsQzM0aThkTHZLMFhKc2VU?=
 =?utf-8?B?OEVOMTZhcG5JMVF4dEd2ZEhkd3k3WXZyTmY1dHJuZnNVbWQzdnROZTVhQlR6?=
 =?utf-8?B?ZURGNFZoeDJaaWYzYVRteUpLWWRYbWpIZEMxakNZY1AwOEJjakpXU2Jic0Vk?=
 =?utf-8?B?ZU4vbmE4dWkvN1F5bldJU3BjQ29nSGllWGk0ZTNpZ3g2Q2VOKzJjS21jb00y?=
 =?utf-8?B?TmEvcUdDTEY3Y2JYQmNpN2NhYmxsRXZXNXRxZEVhU3NZKzlVaWlVY1ZSamtn?=
 =?utf-8?B?bzRiSmpPaStMZ3QzbjlmZWRoN2FTTXdzSTl3SzZEQW5lamg3cWlJajV0VlJN?=
 =?utf-8?B?ODBVaUFzSC9HeENSMWdLbmt6OTNFdWcvNXpVbmRtRm1nUXR5amxPV29uaW1u?=
 =?utf-8?Q?HOILhddWtJ2Mzddg=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c558e9-0417-42a0-3519-08deb1d58a7b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:26:24.3635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fh6C03RlLvtgIx4MIIKFl5Ru0gAzy/yYmHWxFf0JnaIPoCKuqkbS2AssKg9BYvzsqaupVNKpcZ2q6sVu308H2SjfhbNY8CihrdsIvmW0Bbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7799
X-purgate-ID: tlsNG-ef75cf/1778775989-21364C48-B909EE6F/0/0
X-purgate-type: clean
X-purgate-size: 2481
X-Rspamd-Queue-Id: CBF86544AC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:jason.andryuk@amd.com,m:abdelkareem.abdelsaamad@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 26/02/2026 1:20 pm, Abdelkareem Abdelsaamad wrote:
> With the Virtual NMI (vNMI), the pending NMI is simply stuffed into the VMCB
> and handed off to the hardware. There is no need for the artificial tracking
> of the NMI handling completion with the IRET instruction interception.
>
> Adjust the svm_inject_nmi to rather inject the NMIs using the vNMI Hardware
> accelerated feature when the AMD platform supports the vNMI.
>
> Signed-off-by: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
> ---
>  xen/arch/x86/hvm/svm/intr.c | 6 ++++++
>  xen/arch/x86/hvm/svm/svm.c  | 1 +
>  xen/arch/x86/hvm/svm/vmcb.c | 2 ++
>  3 files changed, 9 insertions(+)
>
> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
> index 6453a46b85..112a393211 100644
> --- a/xen/arch/x86/hvm/svm/intr.c
> +++ b/xen/arch/x86/hvm/svm/intr.c
> @@ -33,6 +33,12 @@ static void svm_inject_nmi(struct vcpu *v)
>      u32 general1_intercepts = vmcb_get_general1_intercepts(vmcb);
>      intinfo_t event;
>  
> +    if ( vmcb->_vintr.fields.vnmi_enable )
> +    {
> +        vmcb->_vintr.fields.vnmi_pending = 1;
> +        return;
> +    }
> +
>      event.raw = 0;
>      event.v = true;
>      event.type = X86_ET_NMI;
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 18ba837738..815565c33f 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -2524,6 +2524,7 @@ const struct hvm_function_table * __init start_svm(void)
>      P(cpu_has_tsc_ratio, "TSC Rate MSR");
>      P(cpu_has_svm_sss, "NPT Supervisor Shadow Stack");
>      P(cpu_has_svm_spec_ctrl, "MSR_SPEC_CTRL virtualisation");
> +    P(cpu_has_svm_vnmi, "Virtual NMI");
>      P(cpu_has_svm_bus_lock, "Bus Lock Filter");
>  #undef P
>  
> diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
> index e583ef8548..e90bbac332 100644
> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -184,6 +184,8 @@ static int construct_vmcb(struct vcpu *v)
>      if ( default_xen_spec_ctrl == SPEC_CTRL_STIBP )
>          v->arch.msrs->spec_ctrl.raw = SPEC_CTRL_STIBP;
>  
> +    vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;
> +
>      return 0;
>  }
>  

This works for the common case, but breaks emulation of IRET which needs
to be able to clear the NMI latch.

At this juncture, I'm going to submit a version which I think works
adequately.

~Andrew

