Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0608AAB33
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 11:08:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708874.1108040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxkDh-0005Pm-6j; Fri, 19 Apr 2024 09:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708874.1108040; Fri, 19 Apr 2024 09:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxkDh-0005N5-3s; Fri, 19 Apr 2024 09:07:45 +0000
Received: by outflank-mailman (input) for mailman id 708874;
 Fri, 19 Apr 2024 09:07:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iezf=LY=epam.com=prvs=0839d8b339=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1rxkDg-0005Mx-3D
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 09:07:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 462df4e7-fe2c-11ee-94a3-07e782e9044d;
 Fri, 19 Apr 2024 11:07:41 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J89U2B000959; Fri, 19 Apr 2024 09:07:10 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3xk6k5t7hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 09:07:10 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS2PR03MB9671.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Fri, 19 Apr
 2024 09:07:05 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::b309:8ea5:85c3:d04f%5]) with mapi id 15.20.7472.042; Fri, 19 Apr 2024
 09:07:05 +0000
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
X-Inumbo-ID: 462df4e7-fe2c-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+OwLIuYOGZrwmK0dQGwrnkx6OxXLG3+R1pzYkKV+Jnjk8d4gFm3W0yr4/3gBhO4py90030LY6Duf+JAU3ZEkPRt1mDsA8vB0Y2F6OAv45qJ4DGuPlZhPVuVtV2xX0/LdZuy8rB6paU23ZfyTnEyrpeKqYzOsB+sFGaWxUg9nOPKtZQCBO1NLet5MyKK38RCKq5twiyfyTPGF/liYchGMh09HyNSvfTg0xN+0FcXKUbe0ZPPj1OyTc9VwM86pKZeByVzm0KaXLwfCJNkBNPgKF7lA6WYu1c12FtjaYd+jAqUOKM/FaER5HZ2lMSX2jqmgPnPSugTwQhCHI08/L2R6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF/ge0NTMjRv/7b2mW+b3EKtQnMuSmqzSuT44zgTd58=;
 b=nP2gurdX1iRrq/UxChEk+T6YFxD47ldznyAPSqyfbJbujWQWzfBMIOsWdzFiy16QGDic1+rRV5p95SCqsPYCJYb1vXJz/FCK9iXiahgSeeDuYUOV2o7esVfpBDdnh/fYFOaF3u8jFgLelExKQ4al0GxIoi5chnCtuIW8MIoZU+YU1XqDZXf8BdIv2v2br3Q+qTFLGuyMkDCnWMtVh+4ndRY8gspBTnAEXxLC1puKEBriK8l1KBUnhBhnzW7rJnxeKXF5oVNKMeMlmw1AuwR5oM5U0lAK6gYZVN14ksqBlq4O/alJ84EzdbMyXGCyVqitmr62mF/nI0sBuhh5qlqD6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF/ge0NTMjRv/7b2mW+b3EKtQnMuSmqzSuT44zgTd58=;
 b=rZW3tNQv2z8pg2Uo7+PSUHZ+t918Lp6AEAvw3zbCofLHRTJ2ob1Lf+MQh1XKkw1VrW+Y74206rOSulzovsAedvsdqgVm89Ibmxb/tD7mShV1c6OoMXPSScV92c3d8ipd+oy3oK6Zeik0sHHSN7LycvKRTFt+bHWBl8iv22+DVBz3CTB5t2AUk9q5v1GrTxsi59/vHL3Tz/+III+ZpR22YzTSrvEurz3/nkS3OWct4VLeh0O+w2ZRaIenDFNFnwsdLNwB9dTf4H1NM3CzMQ3oOPXUHr81KuZ5uKmCfM7B40qK7WwZn9kW77rDNMMeozSzLz9kTkhjc0fMNIyW8vhhfw==
Message-ID: <6757ece6-ba2f-45af-8c08-cc998d06a2ee@epam.com>
Date: Fri, 19 Apr 2024 12:07:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 03/15] x86/monitor: guard altp2m usage
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
        Alexandru Isaila <aisaila@bitdefender.com>,
        Petre Pircalabu <ppircalabu@bitdefender.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <20240416062503.3468942-1-Sergiy_Kibrik@epam.com>
 <e8435c75-63c3-4a10-b266-6f4133c1cb9f@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <e8435c75-63c3-4a10-b266-6f4133c1cb9f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::8) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS2PR03MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f936f06-795b-4cfc-cd78-08dc6050155f
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	got3m7CqVhu8SpLZzxdnfMMyaHBIPESJogVe9lcFXHfPNiR8H1fdfCkPrw50dRHEczcjjb44AUFQZ17VgcdDBxbDSnSjzE3m/hlOx6dPDj+VogwS5TZuTH7E4dRNhciEMpmOs6QW9gHEPVD/7DbFdUDQ8kbnkOOljsaDBbaoX1TmjV4UljUakOl969OF88ZC2FYISLqxaGRgvzg3negnflaGOMLZQXLq+TF5CphN7cINLDcO0bG2NEqk6/wmdkrIniytRhRA8y7PsVVW0//0NWOgdjmaKE8xIRBORnEmQP9G8aqhred0wwD8CIoMpYxl76gQ8w8CC+xnbUDqiqYFZOYjxwTjqr5eua2XsCIZlt0vS+m2vptxHQprGnWtgqrHMaKPfr/6pmoDnkgbnGdGpSPWnkc9Z5PqVVmFnuAVdB5nLdqOfh6ZBH2KHicXO8fILSb5uh1m0No4bkYudOdspbX3GjDezg9pK2b37a874M+oEBAgo0TxL35xbSSlfbshBv9HXnjv7XmCBk1SqN7TSSI4qP3ycXudz+/5jQrRAE7MzDKn2StziS2/8kDm7QrIECc2eX+0qqOjzVH4NJdZS3fsnTp2BIxz8FEXox/hUEA/uSJSK54Hdn8V5OSF7mQHYJmgxKciXraiDBnD0bwJzjp1R8LUM1s7g7ThQI4cidc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MVlUamd4d2FmLzhVOGtnMWRnN21EVm9scDBZMFBuY1BuS1g0OHR6cDRhSytK?=
 =?utf-8?B?eUhtQTFVQmF6Zm93dEUwRkNqVXpNc2dxRFpXcm9nbTc2blpqWWlYdXV5U0g2?=
 =?utf-8?B?bDNseGw1Z3g1NHNvdkZEcnU1OXR0UXoyRjFEVWtSMS9aVFZhSFgzV3NUVndm?=
 =?utf-8?B?Y2lUVERVZlpiRlFzK0VPSnRQMklXMHdjV1pYNUI3citJSUx3ZGkxVGQ0NzBU?=
 =?utf-8?B?ZVBIM3Z6c28rYXFRT29USS9TeTV5OG1zZXF4dm5JSWg3TW51TFdFaTNuK3d6?=
 =?utf-8?B?VU02cHpINzNSMTVvd0FLcFBDWDcvSGJXZmE3ZjFXZXc2YndoaXBVeHFlUVNP?=
 =?utf-8?B?enBzUjFHYkdQSXJoMTNYbHlOMVdJanByd0lINXZIMnEyZDVlUVE0VnFvNm00?=
 =?utf-8?B?YTdJbTVQVVFCMExTdlNrbjkwRGVabHc3REVPeWJ0TGR2Y1JTU3RpZW1Xb2xF?=
 =?utf-8?B?SzdEcXZRUWwwYkV1TmJxMXFkMmxTa0pSODFNTVQ5Y3dDSU5CVTFXSDBDTG84?=
 =?utf-8?B?ZlBXTUg0bXphNlZpMC9EM2V0S0o1cXlpUi9sdnd1Z3Y4bWx1YzlNb082M2s3?=
 =?utf-8?B?RUpTU1o3VlExNWZhNHlKSW9pNUt6YXllY2E2cUZhNEFsOFVZdWxiaHZTOWJw?=
 =?utf-8?B?VUNtQUtlcWVHRWdKRkFHYzhNbHJkeXgya1dod1dnMFZGRE80alFjbFhxb0JV?=
 =?utf-8?B?KzdUVzFidFJnT2RiekNXT3VCOWxpM2Z5UHNsUUw0WkVNQ0hXazNycmVoM2l2?=
 =?utf-8?B?c3FYenkwaGtDNWpDcTM4Y01QeXZONFUrQUdBSWJsdEFIdWFTMnpMeWxJMk1n?=
 =?utf-8?B?RVdNdi9vdTM3K0dXUFcvOCtZWDdka0FMQ3Vzc1hOdmVBM2dzVjV4bjlrMVQz?=
 =?utf-8?B?cUI1VWxzSk00NW4wSzEyQThScVBLQlNwV0RXT3VmNU1iUjdHSkJWUldwbDho?=
 =?utf-8?B?RWVrclE5Qzd6aFM4aUk0MzdmOTlLTmhVNkl1MGxlU1ZiU2x0MmZBeUs0ZlVz?=
 =?utf-8?B?MURBdGxnTU1yaUsxSm0xVkFnSmFEcHA2VW5GNm1Xczc4VEE2WWVyMHluUlli?=
 =?utf-8?B?RHowc0Z1eWc2UDFVNGdQcUg1NXhDRk4wN1NRcWVabTRMeGFxdWMvdzhWelhD?=
 =?utf-8?B?QzBYUnlCVExkSmhpamVJbUgvckNzQmZDb0JqUVd6RXp1K3VScWwvUGVYdTlW?=
 =?utf-8?B?NTh1ekY0cEtEYk96Z0R5ZlpaampKVjhQKzh5SDVkYm5WZStwNXYzSlF6UUxr?=
 =?utf-8?B?MnpBRG85VFFqak51MDhZb2J2MU5pQ0xpTVk3VXJ4em9iNDJFVk0xeXJsTTY3?=
 =?utf-8?B?ZDNrQllEUlVOZWpneGpVeDF6aWJiTE1heEtha0gvWWJwNEVXYk04R3pYMzRE?=
 =?utf-8?B?cS8rVlNlMzY4Q0JqYjFOTnJXazF0eTVSTnRzRDVoUlVwUzFEdmZPSW1Cd2w0?=
 =?utf-8?B?bmpKWmFuSVRpY2VNdzd5R3AveTFxWWFhS3V6Mmp3R1ZuVWRMempVbVJhTUdB?=
 =?utf-8?B?R2c1ci9qVHdUcmdVbW9EMFBhT2gwQ0RIanhQNGc3R3pCMVpZN0FTTWxMSDhu?=
 =?utf-8?B?WlpqRHo0THZuT3BSWTI0ZU5ia0xlcUdnY1hKOTVpN0h4KzR1dDM5VmlHMXB0?=
 =?utf-8?B?VGkvS0k3cGxtNUV3V085d2JxL3JlL3VTSTE1dmRQZUlmbzhCaXRnL1I5eWdp?=
 =?utf-8?B?dXY2RjlvbTNQQi8yeUVLb2t2VUxjQ3dYdGZYdlNjWHRQdU9ud2N4ZnVFZXdD?=
 =?utf-8?B?UTh0bDRJOFc5eG91TjI2b1dwemh1NGFlQU5FUnJoL2I1dFk3RWw2R2dvdkxR?=
 =?utf-8?B?eC92b2pkUUlCWGI5RVk0SWc3U2w3VGUzYWR2b1YrWWR6Rll5akttRmdZeHly?=
 =?utf-8?B?Q3pIemVIYUpkTThEdkxOUzluQmhyQ0x4ZGxDcWs2N2w2a2drY1RyOGFad3pE?=
 =?utf-8?B?Mks2M1E4RmlLY1RrTFk4MFpoWUlNYmFvdUZ3S1ZuNkdwalJ5NXRBWkFzY3BH?=
 =?utf-8?B?dFAwUCs0QzRmRXpZdFNOdElNbnFrUEZWZXBhZkhXd0UzSFB2TEl3YWRETUpa?=
 =?utf-8?B?VlE3eGJCbmdxbXlVa1ZPcmtPUlZWNmIwcklMcUVCcHJvWWhPTVZ2ZnROQkF1?=
 =?utf-8?B?enJzSTBjdFRpcDN4TWxuYndPUi95T1hkN1h6Y0J6VWVZTWFYTTgzQ05ZRjN5?=
 =?utf-8?B?WWc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f936f06-795b-4cfc-cd78-08dc6050155f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 09:07:05.3151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ua38cncWICtw+htYb9H4I/HBsk9r0d5TTFnMo1DKEV9mpk9g4E6d04vl5+LGyJghdyL91XAOHx6D4Dx72ezi9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9671
X-Proofpoint-ORIG-GUID: 6YeG_au003DIanc_dZLKF6UFoUMBLPaJ
X-Proofpoint-GUID: 6YeG_au003DIanc_dZLKF6UFoUMBLPaJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_06,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190067

18.04.24 14:31, Jan Beulich:
> On 16.04.2024 08:25, Sergiy Kibrik wrote:
>> Use altp2m index only when it is supported by the platform, i.e. VMX.
>> The puspose of that is the possiblity to disable VMX support and
>> exclude its code from the build completely.
> 
> I'm afraid this description doesn't make clear what problem there is,
> which may be related to the fact that (as mentioned elsewhere by others)
> altp2m isn't a VMX-specific thing. The field read by altp2m_vcpu_idx()
> also looks to be zero for domains that never had altp2m enabled for them.
> Further, ...

I'll try to improve description

> 
>> --- a/xen/arch/x86/hvm/monitor.c
>> +++ b/xen/arch/x86/hvm/monitor.c
>> @@ -262,6 +262,8 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>>       struct vcpu *curr = current;
>>       vm_event_request_t req = {};
>>       paddr_t gpa = (gfn_to_gaddr(gfn) | (gla & ~PAGE_MASK));
>> +    unsigned int altp2m_idx = hvm_altp2m_supported() ?
>> +                              altp2m_vcpu_idx(curr) : 0;
> 
> ... elsewhere uses of altp2m_vcpu_idx() are guarded by altp2m_active()
> checks. Why the domain-independent hvm_altp2m_supported() here?
> 

understood, will do with altp2m_active()

  -Sergiy

