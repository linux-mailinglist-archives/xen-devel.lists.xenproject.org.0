Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IOcGnj412mrVAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 21:05:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4FE3CEF4F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 21:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278093.1563084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAufz-00037q-Tz; Thu, 09 Apr 2026 19:04:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278093.1563084; Thu, 09 Apr 2026 19:04:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAufz-00034n-Qn; Thu, 09 Apr 2026 19:04:27 +0000
Received: by outflank-mailman (input) for mailman id 1278093;
 Thu, 09 Apr 2026 19:04:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wAufy-000334-9h
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 19:04:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAufx-00EixK-M8
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 21:04:25 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d7f81a-bab6-0a2a0a5309dd-0a2a4508e910-40
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 21:04:25 +0200
Received: from [52.101.48.14]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper@citrix.com>)
 id 69d7f837-fab6-0a2a45080019-3465300ededa-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 21:04:25 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN6PR03MB7646.namprd03.prod.outlook.com (2603:10b6:208:501::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 19:04:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 19:04:21 +0000
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
 b=IS7accLxKVZjfKYICCDjVq07rkvsv7gUOt3qCyFjguQg8gY20ebgeEMMrnMccfDEMnYDGBXdcel3zFzU8gNx5hlN3AOHekr3KuhVdGyKYvYMTmU8HDrZt4bM/f81Ov2Rn4ApCpyAy3tqPwiAKagGPg7wikci3evq/dqjg1WcqQ6Is3xBSB457iXCvxvCb4q/U0BazlvdnN+nXCeTeLQV9mrE9QfPe7PZalxF7Crj6nrdiKS79nbkwDnhyDS79InWbBvN0fhJN0hrXKnumro8LpUFMQmQURvpcg7K02BpgbecfWCpFOEyJk30EMYZbQ+NKnz800kOePlS0JzgNe7yuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mB3dzvAGCQE967Hw/ykIYrSjyTIKAmbHqZBhScWZnXI=;
 b=aifrfp4c8fbpZWcyfwglKdL/EPQNmXHF7hZk1rZDKE4BnrM0BhXHGv833XFVnwks2GbmkheAaczD3xGafq3SaJEyNgDcZ9uznP29EXcvbK03uIxv14AVYcLCKY82VBRhy6rTK7H4HL6A/lViqMGzClQtZfqLJkGgxXEJvmdcR6puxNK2zCYrn559cPhCoeBrp9ZClr50QcJDAf/zRcBf3ye2dipbaxnHM23ELrHUDUQoap1y4+KNUDtsDictkL2qgL8BQjkFtJ3PVVQQK176+Agb01hCW4ObPRxbJtaP/eNxDM/kKcEXQgmIZrRmL8U/iyw2vK9ACfKWCr3rh6/A7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mB3dzvAGCQE967Hw/ykIYrSjyTIKAmbHqZBhScWZnXI=;
 b=QIJXAcjBUxwyr1HlEb4F9VUYW54S66ZeUeJDuhEeEKmN1sJ282m1PIxmgxUDzUQwydMt3ApcA6GGFjcZ3aiJuA1dvOk+sgdrOHYf/bhoPRzsmJpRHCDGy0gnZ/fH2ncGaquMvn3xIx4IncNWb2vTUfT3k6OsOJ2D6Ot6oyvtOD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ac27bcab-64cd-4c38-a1e5-b3ab6d3557d6@citrix.com>
Date: Thu, 9 Apr 2026 20:04:17 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3] xen/x86: Check supported features even for PVH dom0
To: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org
References: <20260408125521.104660-1-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20260408125521.104660-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN6PR03MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 1059c075-2fa8-4baf-c9b0-08de966ace94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uoNVaWEGaLL8NcTdIULiTJojbXY0/KizmuLpnitNO6pzs6mTEhy6TnYoFM+UjyFhR2OPGX16L6WGUOIy/Q5GZhQ3mgeEtvE2mtpUzIgdw9fR7SKo6YGfXTuaIufW7tM3c+EIZan2SFiBzyeamzp+IOgOaOUyYNi4lQPQzmOlCYUNCkdtpKcVyzc/J6FIWLv0JXYFqwe/K3+u5809x6t6ARBjOJKDg4TFQKPX4znMliZuAhpG0Pc7xPlUqqNKG2NnYwGuxbigO4i1DnIDfCCDfedcrYfUMmiLfP0yX8nGraudr/tu6w0qV4HZooeo7+Qxi4c1zCA/Y7W1tgrkpY/Vc7pOSv5/d+ip2qEvH95qqmwBfEjXOjLBsACvzG6Ay8/fnlF6K6Z6uoMqdQPuxpJn+i7eyW+c4ceAHYFYBMloKaJPgekYCzOTTuXH+wM5aAZs0rHeBtVOlOouauvEOjooqVwomdhU55lCUPdmsPROMFB78M2QAssDArS2PSky4L2tqC7EOZb1zakCgpYT3mGuiFXrus/p5BiXJ7pOSXZZJ7MrA3s6Xm5MyD0EmEH8m656+ZRKfShhpUGk8Z5mUHpUGk7IDQ2UJqBYpjCKdsTsFw2ZaBAVFBWIxI9KJsnHSzNVcpYiG5s6yHJYeSYrt5/k26LDMlD5ngopVWmI3LRtNhjGAXEtgIPqO/Le37vCN+B1FCSIioxOK1ZGLV/ie0TeEegaoga8kDOAjRIwwvnLu1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OW85WjladytSQXNnTjM5YkNKV2VTVzJ0WGp3czZMckRMZ3RZNUtaMjhXL0Zz?=
 =?utf-8?B?WHZFK0lzblFWaXpKUU10MWtuSlNzMzUvZS9zSi92VXR5aGh1V2JWbXUyVnd5?=
 =?utf-8?B?bjVZbk4zNjlrazB5S282cmdvY2d4OWZVTjJ3SVZQMjA0Yi9lb0FYQmFVaFVP?=
 =?utf-8?B?cS81ZDU3U3pNZTFTblRLQXF3dkdjbkRHUG01OWpKWHlVMTUzcUQvOGp3SFFr?=
 =?utf-8?B?OXkxclBjckw1QXpoZ1EvRG1GUWxTNEJXS1FqVVFhZUJiNHR3ZGRCaUlaUWF1?=
 =?utf-8?B?L3BOVGFkdVpObGhjczdIanQrRnVuc1UyWUVSRWdFUDFpdUx5T0crNXpFaGNj?=
 =?utf-8?B?TFcxZGZZVy9mSnR4MTBZWmpoN3dTR3lYUzhLWVdKUWN6VVBzSmQ0dTF6aUd5?=
 =?utf-8?B?SVhEeGY2Vnlpb0NZVkdFTHg3TGZodWtkSFQxNzlRMUh6REwzaFIwbFU2ZzBv?=
 =?utf-8?B?MFozNjBPVmdVZVFhSnRhQzJsek9KMVdmUUNRUjV6RXBIVUc3UHFCWTdmeEVG?=
 =?utf-8?B?YVVzMVUwNnoyR3IrRHd1SFRwZzRidURwZ3NPZi8ybHdkVjhVNWJPeHBHRk04?=
 =?utf-8?B?aDcrbTVQZXFIQ0IvaDJwNGk4RjFMdkFZb2djMFBOcnNVRVNTQ3NnSUZlSWlo?=
 =?utf-8?B?S1dyWDNEZXYzYlN4bzdWazBsbmFqWXZUYzI5SS9vR1VYWDkwYm9NaVBHY25P?=
 =?utf-8?B?VWkyME9rTkpuYXNwVjBWYTN5OTdKUFN2bVVmUXBzZGpMLy91aVgrVHRscE1X?=
 =?utf-8?B?Qlkxek5rUnFGNjFpejdPR0NaWFhvbkRnQ1VOUzluV0ZMWDZYNzc0eGR2NTI4?=
 =?utf-8?B?NTlUbzkrOXkxS3NKM1M5anRLdE84OHVQc3gzL3RhTHZsMDlIeXlGWWxEVktz?=
 =?utf-8?B?RThqM2MwYnJVMVdubjRpSnQwbUpVaGxKTjNzMTBOd2FDUEJSQ2pMOTVrQURB?=
 =?utf-8?B?NDR4U3NOMkcyZXFjR3BLKzBSbmQ3SEgvdERMbGw5OWRjR2I0SDZLSng1WE5u?=
 =?utf-8?B?N21vaDk5OFV2QmVWbmt5QzgvcmZhWGRaSjRZMisxQWtabXVvdVp6aXJBQUpx?=
 =?utf-8?B?M1dSd2pSVzJpVkJqcm1iNjdXVWNmUWN2dEluVk9DaDBSY0pqOXJRcFRpZTBP?=
 =?utf-8?B?WGdDRkc2U0NDY2ZSb0U3a0Z0Uy9SREQwREpyeW9ZNlpSWkwwYUNOOVJCQUd0?=
 =?utf-8?B?M3FIK2VGdkRGUmJZelc1T3pCNFlyeXVzTXo1dkhGcFR4a0xsQ1BTOFc4ZG9R?=
 =?utf-8?B?STM3THJhSUt6TUdpdTMzdzZ2eEJvVERiUkI5LzdWN2NXeVVybWVNV0c3RVhk?=
 =?utf-8?B?TjZwVTFGVmZBTlNlaFJzOWtHZS8yeTEyemoveXkzVXV6eldyMzltMlJwNFdo?=
 =?utf-8?B?dTFNV3hRNnFLa2pyajY0NGJ1bTM4TDNPM05uVUc2bG5ycVRHbHJCa0YzbzVl?=
 =?utf-8?B?cnQzeGp4NjRLblNiL0F6WmlCTHU0RHV3Q2pUUGJPVE5zRmVDcDMxWDNHTXVC?=
 =?utf-8?B?d2FOb01CaXY5cE0rL3VRRVpYTm04U3FudnI5ME9HYllyZ1NITmhoVHNJa1NN?=
 =?utf-8?B?NmVteTVCTk5ueUZtbDJJUlNiRU80TitMQ1MySkxuZWhvVHBWZEg4bjU3ZWFT?=
 =?utf-8?B?VXVUQWtzc0s1Mmxlak9qTlhxMWsyWi9jTUJpb3Y1N3U4VFNEVi8va0NoQ2Q5?=
 =?utf-8?B?bmdLZzdOMlhwQm9uOEVqRzJOYTZEZUxQeEhlVjN4WTN6cVNqU1V3bW5CMlpP?=
 =?utf-8?B?RHIrMGxYU3QvL0tuMXJHZTBuazRSUHc1bURIS2dTOU9RdHkvVWxYWXNpRGlX?=
 =?utf-8?B?S2pjY1RuRW1FNFdOWEhyWHRYMlU5VStxQXNZb3l5TG1RY1R1RFZFbjRQRXNN?=
 =?utf-8?B?ZkFSaU51Y3ozRk4xOUdFZ1AzNmYxdmtQU1FOSDRqT0lubTBmUEpMbzhZcWNZ?=
 =?utf-8?B?SzBMWS9oemJHREhZU2J5RXJlcjZXSkxNamhrTGhpeHo3aGpPQmZaKzBKVEdt?=
 =?utf-8?B?TlY5Ny84SENaS0w1OCtVZFhqWTk4UG53cldyWlpqelVKSUhkOFREZ1QwVllv?=
 =?utf-8?B?aDNyYlVqSW16dVFjYllCSUNUUHVMaW1DVE5oUXVrUXkyNzg4OTV6ajdqaGdP?=
 =?utf-8?B?ZTYwN1Y3ZG5sRC9kV0YrY3E2d1FmQ1hxTTJPSmNVSjVrNlJOT2MrMzNsSzVQ?=
 =?utf-8?B?SlVLblNIYzVjR3lIQmoxUUY2L09BR1NKdGYxSmhJalppbXUxeExmaGFSbmRH?=
 =?utf-8?B?RUxqeXBHTEFYeUM2M29oZzY3cThIalJEZ21GL05QZlFXR1ZtZThJQ3FNdmhk?=
 =?utf-8?B?MmRsK0YwZmEyL3dPN2lFWFNJSUZ4cXg2WUZmdkh3Ry8vTUx6ZFJCUXY4RGNx?=
 =?utf-8?Q?o95T+RxTFUxfkBVs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1059c075-2fa8-4baf-c9b0-08de966ace94
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 19:04:21.0742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFQUbw4rCsoVO8X906AUGN5Z8gNKF8u6o/Px+rS/XgrZzUeSZHkRp1X2+R0l6AIh/ZT6eW8DRDhvKoJ3F57727jSf242cW+e4RDVtFxNNsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR03MB7646
X-purgate-ID: tlsNG-c1860d/1775761465-F4D5B497-AA7B17E8/0/0
X-purgate-type: clean
X-purgate-size: 1140
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:frediano.ziglio@cloud.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BE4FE3CEF4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/04/2026 1:55 pm, Frediano Ziglio wrote:
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 864dd9e53e..56eba8f59a 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -320,6 +320,20 @@ unsigned long __init dom0_paging_pages(const struct domain *d,
>      return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
>  }
>  
> +int __init initdom_check_parms(
> +    const struct domain *d, const struct elf_dom_parms *parms)
> +{
> +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type == XEN_ENT_NONE )
> +        return 0;
> +
> +    if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported) )
> +    {
> +        printk("Kernel does not support Dom0 operation\n");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}

Your v1 structure was better (give or take whitespace mangling).

This needs to be a nested pair of if() conditions to not need rewriting
when SecureBoot check is added.

I'm going to fold this adjustment and commit it, because I need this
patch to fix a separate bug in the patchqueue.

~Andrew

