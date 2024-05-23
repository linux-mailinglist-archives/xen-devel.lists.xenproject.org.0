Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 528588CD338
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 15:08:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728477.1133406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA8Ab-00079h-Oo; Thu, 23 May 2024 13:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728477.1133406; Thu, 23 May 2024 13:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA8Ab-00077I-MA; Thu, 23 May 2024 13:07:45 +0000
Received: by outflank-mailman (input) for mailman id 728477;
 Thu, 23 May 2024 13:07:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oh0r=M2=epam.com=prvs=18734d070d=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sA8Aa-000772-LN
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 13:07:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd8825a-1905-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 15:07:42 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NB9eXr024421;
 Thu, 23 May 2024 13:07:31 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3y9y239xwq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 May 2024 13:07:31 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PA4PR03MB7181.eurprd03.prod.outlook.com (2603:10a6:102:103::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 13:07:28 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7611.013; Thu, 23 May 2024
 13:07:28 +0000
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
X-Inumbo-ID: 6fd8825a-1905-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAwhCB8I8mXmKSQgzrvkW03a9MhgJRlRLNA2gng4nD1AkI8+zqehMnvVsxQ+YfVqFGIDgjpUeXrQxECtMXnha0za6/1yaH9XmfAAL25hDMvApVHenHCc6ACP4aGCh6pizb1PqEKLa0O2/i9marDXBJjN0aouwcy2utK6nJkKIGqEkik8vQTJxIwGmZboaSl1XR6gYZEBwWd4nLNoOMExOXpN1jJ0X6+Lrq7nj0b40hjrK5B5Kfr9BlSVgFRR5NBCs9Jp0gZbc21tPx/Sjm3UHqxsqtqZxhnbD7vKBW42YR65uEm97L+tDREeeNOiPkt2wft1pTm8DBGFkYjNigPl+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=otKw66nEx7G9CUalIzd5MALBbDsQBfCNiIO9pmHTUm4=;
 b=EzwK3KUsYLBrDshqlnUcGqRIkQu8muHRBVtTrQ0AmjcZg8f8kWuvETqldlhe86NvRiEH2Oc8COYM5qdkqVrXr4ivIaygvNDGr71L5DPNJRovXgf33S/tTXEVu1sJiv+IPH6HE06z7DxMRaGexYp70V4i446/08/p4b2sSDw1fNtf5fHmJSGn1ggfRweiRIFZ7kRXoZdiAMb6bg773IVhJIO3ORWqdzDdduDWoLKN4X5Ez7DsLRjp3aQ+vyWD7NfrMWuba+j53/diLny/0e1qUollEOx//sSSVViu5H7Jem+LmsSPrbHHQdoIsbE2oszVcQULSCHbMMyX/91akGAk9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otKw66nEx7G9CUalIzd5MALBbDsQBfCNiIO9pmHTUm4=;
 b=sqDf6BCzkf5JuvxwO6sSJHd/6/v1MP3+Z0dDv2NaT23nL8Ywxj+ry5Jr3Xans6mQVC7bqWI5lOjQpo8AjMDI3wGZxU4PPWy6rjshzaXxJh/fpAmz60ez+Nv6jHY32/e8RjBIxdJXsRjzdj70/q7kMXeOUjiCc0N9QZUoWlduIG1dqD5TIVw/KvSspIxGTnAM5PoNTuYsBqWCr64azEyteIwcRsSPnW8rCW5LiAG7u6W3PkiaGMXs/k83j88Arcb7EGp96Wn2ZcPyv89ufRpDmUVI1EdXAbILb7kBKm/DTTD5IFsp5KqZNBG88xRtIIyuzEGML28w0ytTC1YHMsYOTg==
Message-ID: <4b02bf84-0d81-467e-8577-f33dbfb71e8f@epam.com>
Date: Thu, 23 May 2024 16:07:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 07/15] x86: guard cpu_has_{svm/vmx} macros with
 CONFIG_{SVM/VMX}
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <09f1336974c8fd2f788fe8e1d3ca5fee91da5a81.1715761386.git.Sergiy_Kibrik@epam.com>
 <a881c6a6-2c36-4e5c-8336-21cd0e14b873@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <a881c6a6-2c36-4e5c-8336-21cd0e14b873@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::9) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PA4PR03MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: 91e06059-3532-4e63-0b43-08dc7b294c23
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bEV2MDQxQmZPd3A2cWFMNkJmVVpDT2tXNW0wZFM4OVZWaERmbUJmUytyL0c5?=
 =?utf-8?B?NHRTRXRsS3ZJbDlTVXpCOG9LTi9VcDBPdHY5dFUzM09OQWoyN3p0Q1JKaS9Z?=
 =?utf-8?B?TzlqbjVLWkNoeTJoVkpwV0pqblY2dTZxT3gzTjN1NjcrYWtsMDdTVHFmQmFH?=
 =?utf-8?B?ZGVNcEJ3VU0zL1pWb1VrNFAyZW0yTjNGY3dUZHVQa3JBZ1J5QUM1WGlkZlIw?=
 =?utf-8?B?UWpmdUNnWEtwNHNydTF3ZGRuUmNGakFjUlV4dW93UGtDVXN2dWR6QmdiTjA4?=
 =?utf-8?B?Uk1aYWNOcDdOK29sQWhTZ0dyWnZXdVNnU3RZM3VrNzFjdTB0TDYwYTlWaTR4?=
 =?utf-8?B?SFNKd1hqZksyaGZnRmVtNWcxcnNGbWNIbk0yK0d5RDUwMklFQVlSK2JXeGc0?=
 =?utf-8?B?OWlQaUZFeWp6OG5XTzd4ck1TWGhpTTE2cno2SFlWbmhWcytoOHpWQmhycEpa?=
 =?utf-8?B?RUJqNUNPQ0hzSkFBNE00UVNtVlZaVWttTUZoWXcwcTFJaWd0bXJNMjJWZW81?=
 =?utf-8?B?TFo0Z0tEZ1R1aXhsNHl6a3Z5c25DWldwbU53VkpINm4zK2ZEWGxhK3F2b3cx?=
 =?utf-8?B?U1grWHI1Vis2aU55ZVpDQUlqNVREWkxkY2dFZG8yR1FZYlRhUVZtWTMvZnZV?=
 =?utf-8?B?NjBjL0Q5OTZFZ3lKaEU3NU11bXJVb2l5QWNGcmp5ejBDaHZEWEFzKzFSTFVI?=
 =?utf-8?B?MklLdks4WndIZnRaVG0rNjhwd3VTY2d3dVJLdERNeWlQdGIzVFVHeTVXTnY4?=
 =?utf-8?B?d1BYZm1qRGIzUk52SDNKaUtxbGxZVDBPQ3pkSnpVMTg2Uzl0Q0VpMTdNcDhG?=
 =?utf-8?B?eDR4Vkg2ZGYwT3AzTHVKa1RWaG5WL0xHeGRxS0NTUlQrOVZ5Znc2UUtyWFNx?=
 =?utf-8?B?b2t2dm9IN1NQUG83a0lFd3FiWTVmUFNKMlVyYUFWZnJiUjVhUVVyQ1dPcWFn?=
 =?utf-8?B?Vk5rNjF5NFp0TGY3VHZscEltSEhkcXdwQ1lScWtNT1RRRUYxNHhJdXFGd1Iy?=
 =?utf-8?B?aUU1YThXMzFndzY2Z0xGN1IvRmVSbTAxL3FhWWVISng2ZEUrWU1vNEplUFRp?=
 =?utf-8?B?TzAxY1JBWmpKUjZWUHp3NHdWRytZd3lxbEQ1YlJHUEM1cFhFbFlTelcwOEkv?=
 =?utf-8?B?K29MZEJlMzBLeWN6ZVV1S0Z1NXd3K3ZGVHJzSHJVVXVRbTJqV29IdmVwYnpo?=
 =?utf-8?B?dmNsZzlmSitBSHM1OU1ta2NlWEoxL25Mb0lNN1BRZm9nd3d4ck5GejNQMS8r?=
 =?utf-8?B?UnR4dXJ3dng5SDRWamtHKzNnSTJ5ZUdmdk1PR3QvemRQKzFPUTdlTytEK3M4?=
 =?utf-8?B?SWxzbk9oc0FkM09wR1NzcjJpdkx5c09jRUNIcGJpajBpSVR1TVRkUGh2N2Mr?=
 =?utf-8?B?L2lGU2o1MUpOR2U1elYyVzkzM0JiLzJxTEEvVmRjM1VHNlpaNzJWNzRQVEoy?=
 =?utf-8?B?ODl3MXQ5OVVzRjhXSjV0bFNBNjVzK2VlSjV1VENUVzVxQnVKVE1BNnFxOEpt?=
 =?utf-8?B?alhoWUZHenVtYng1cUdKRGRUNEpyWk4rRXVJbUoxMlJDVGg5QmFSUGNidVlY?=
 =?utf-8?B?cVI0M1pYUzVuOUlmY0dXcXpCanlWbUtTWmxCcFhEdStLSDU2cExwOEljQms3?=
 =?utf-8?Q?TAkSuFNEKlA/hXrHa4Ut8GvU/Zo5pfOJwA9duzsrcyBM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVc4WnU0dWlqWDhjUHJWWVUxTnRvQTNWdGhJUWM3eWVSdVpTSE9TRHZMU3Ns?=
 =?utf-8?B?aDFuUi9KcW1GdnREQkQ3VHBnNVI1TFFrNi9iS0dmQWM1cVFwdkVDbjM1V2lW?=
 =?utf-8?B?UFV0MmxyNGw4QlUrUTZSS1Ftb0wvY1BhNS9ydUczOUZ6T1hDUGtjZUxSRmts?=
 =?utf-8?B?aHh0ZkhsTmM2N0l6WDcyYkRxL01la3hHdnpRUkNOYWhNQmxoOUZVdVVlS2FW?=
 =?utf-8?B?L0RWbHdUTTM5amFlT3l5T0h0RU9sYUVaVTBoTTBRYXI0UDNqSlg2NW1ST1VE?=
 =?utf-8?B?ckg0M3YzWXE2cXJaYXUvWXp5MFE4a2xwc2hvTXBTS2o2VXM0OFZFS1dpVGQ1?=
 =?utf-8?B?cFNQYjZkdG1KaE91NE0zZy9Uc0xtU01iNWVITytvMG9VMkpGMGYySVR2MTlB?=
 =?utf-8?B?WXh6TVZ4bmxOa3lSK2dSNjdEWEw1bHc4NEhOTDRqcU1xcEFBdG9ibERuU1Rl?=
 =?utf-8?B?RHY2ZmRWMkJndEE5N0ZxcmJnRlp4a0RORWpaQ3NkMC9MUk4zK0EybitnQnFy?=
 =?utf-8?B?Tmo3QnhmcXlqT293OVBTd2F6VnIwTGprL3BDZVNOdEdZUWFKYjY2dDNPUDRo?=
 =?utf-8?B?ZWlzaWMrRXBoVlRTNXhNNUlZM0sxMktTVTdicVZ4WjdTWUpnVE1jcDVKUkhN?=
 =?utf-8?B?eFF3VlZOZVBnQzlzcC8xWEdlOFBYaVJRTi9nNTExM0hsRnRHbnlrZ3pCaTZq?=
 =?utf-8?B?bTZDa04yNEVtdk5YMEhNU1hZOWFEeHVjL3AwcnlzVzdjTTdlS1VEUC9TR3dN?=
 =?utf-8?B?d1RKZnpRdDM0c3BWZFp3cTluUVBDcTFGSEJmTU9RK3RYOXcrVUZGQzd0bEtF?=
 =?utf-8?B?VnIxamdKdmRGUVQyTHIzaElocXpLRTNoTmljaUI3bUQyMGI2cTlqMng2ZFIy?=
 =?utf-8?B?bEY1TmEwcXozN2ZOS09WTTJteU1BL0pqZHEycWlqOXNwZitYVEdvVk5wS0d5?=
 =?utf-8?B?UDVpbUU5b0phcEYwbkhERE5PQi84UlVDSkJUbDZtTENMckp4MFgrZnZMNG9h?=
 =?utf-8?B?WVIrcjVKQjh3VXVzemU5a29aeS9ac3J4bGFROUt1WVhORWswTndEWmlJZE9z?=
 =?utf-8?B?VzF5WUs5amp0cjY1U3pYd2l3dnJmQkM5WEZUc3gzZDdsKzZMZklISS83Nk9N?=
 =?utf-8?B?MkUwVWxGR25vTEU1UEtaYW9SUzZJRlFVV1RUV1pMU055WlMxY0luL3pEekRr?=
 =?utf-8?B?ZGFRVVQwMkFzMmFGUSsyc01VMC94aUUxcGhod0lNTk02TUR0RnJERlQ0MHBn?=
 =?utf-8?B?cHJDbWZSc3ZFaEtvWGNnbXEyWWlnSUZUMFVQTytXbzFQNTNLT1VSUmVhMU03?=
 =?utf-8?B?TUhmTis1czV0MkJqTUU5OXhjRUJwckpjK3BDdTlnc1ZqYUMrUnAxWEZJdjRr?=
 =?utf-8?B?ellIcVMvNWlISnAxS0d6RE0rVzlYWndHTzh1NU9kQzBabmxORGkwTkxMRllL?=
 =?utf-8?B?d29CZmVMZkY0N2h1eHdEZDZtMlZ2MnNnVnJ6UVlINHE0OWZ0REU3MDhHTk9m?=
 =?utf-8?B?T0tWeUY0cGxHZHBpbE9XUDZMaVhFelVmZGt6YXorWWFZZUx1bWp5Vmk4VVhQ?=
 =?utf-8?B?a29QOUxJcGNnV1VaRTg1b2Fac3NXajB0TkoyZ2VHMmhxMVZWRkVYTG40b0dT?=
 =?utf-8?B?R0hpeE5COHpiM2UxSW15aVc2NXdGRjFlS242RitscWg1aWtPQlg0TWprQ1hT?=
 =?utf-8?B?Z3I5VjVSSjRIMUMzb0pVZmdodlFFRTRlWTVVQXRWMTNKWlBNdDI3ckJseG8y?=
 =?utf-8?B?Ty9vQ3Z5MHl1TXN2ZjFmUWNicCtWb2Z3T0lRb2ovRXpMbXk5SFU2c3lzQUFB?=
 =?utf-8?B?UWIxeVBlTEVkZHEyV0ljbXVmWlVtZlpWWFhpWWQyL2NiYzl5VkRCKy9McFhp?=
 =?utf-8?B?YkxGU3JJaWpYTHFaV084Rmt3cGErSURxVEM2dXNzY1FCOXdqUHlrUlF1SnVB?=
 =?utf-8?B?eEVjbkdna2NiNGNRNFNDZzNaWTg3L3I4aVBqVDlEQWlwenVwN25DbFRrWTF4?=
 =?utf-8?B?ZExDalFQSTVsWTFzdGY1YkV5Znk2eUNjWCtiam1KS2NkN3JZR28vMjd0TFVs?=
 =?utf-8?B?a3drZ0Q1MXhLaUF5T01EamhUZW5aek9nWEpvY0lSOU1qV2RnS011QUxJQVQ2?=
 =?utf-8?Q?aX83l9UNSg1dClR6JtoAso4/u?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e06059-3532-4e63-0b43-08dc7b294c23
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 13:07:28.2451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D7cAtba5OWZHj+K/sapVlkykDE7wF3gz64S0rOYiFcCxIrgbbIQ1t5iDm6+1xN5LUJ4rWpDjiMn5rP/Jq/113A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7181
X-Proofpoint-ORIG-GUID: nTFZY3rbtKpQtvBJyyedS5loxGuQJ78I
X-Proofpoint-GUID: nTFZY3rbtKpQtvBJyyedS5loxGuQJ78I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_07,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230090

16.05.24 14:12, Jan Beulich:
> On 15.05.2024 11:12, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -81,7 +81,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>   #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>>   #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>>   #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
>> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
>> +#define cpu_has_vmx             ( IS_ENABLED(CONFIG_VMX) && \
>> +                                  boot_cpu_has(X86_FEATURE_VMX))
>>   #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
>>   #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
>>   #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
>> @@ -109,7 +110,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>   
>>   /* CPUID level 0x80000001.ecx */
>>   #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
>> -#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
>> +#define cpu_has_svm             ( IS_ENABLED(CONFIG_SVM) && \
>> +                                  boot_cpu_has(X86_FEATURE_SVM))
>>   #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
>>   #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
>>   #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
> 
> Hmm, leaving aside the style issue (stray blanks after opening parentheses,
> and as a result one-off indentation on the wrapped lines) I'm not really
> certain we can do this. The description goes into detail why we would want
> this, but it doesn't cover at all why it is safe for all present (and
> ideally also future) uses. I wouldn't be surprised if we had VMX/SVM checks
> just to derive further knowledge from that, without them being directly
> related to the use of VMX/SVM. Take a look at calculate_hvm_max_policy(),
> for example. While it looks to be okay there, it may give you an idea of
> what I mean.
> 
> Things might become better separated if instead for such checks we used
> host and raw CPU policies instead of cpuinfo_x86.x86_capability[]. But
> that's still pretty far out, I'm afraid.
> 

I've followed a suggestion you made for patch in previous series:

https://lore.kernel.org/xen-devel/8fbd604e-5e5d-410c-880f-2ad257bbe08a@suse.com/

yet if this approach can potentially be unsafe (I'm not completely sure 
it's safe), should we instead fallback to the way it was done in v1 
series? I.e. guard calls to vmx/svm-specific calls where needed, like in 
these 3 patches:

1) 
https://lore.kernel.org/xen-devel/20240416063328.3469386-1-Sergiy_Kibrik@epam.com/

2) 
https://lore.kernel.org/xen-devel/20240416063740.3469592-1-Sergiy_Kibrik@epam.com/

3) 
https://lore.kernel.org/xen-devel/20240416063947.3469718-1-Sergiy_Kibrik@epam.com/


   -Sergiy

