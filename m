Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD30B94EF4A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 16:15:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775605.1185827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdVov-0001y4-8T; Mon, 12 Aug 2024 14:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775605.1185827; Mon, 12 Aug 2024 14:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdVov-0001w7-4S; Mon, 12 Aug 2024 14:14:49 +0000
Received: by outflank-mailman (input) for mailman id 775605;
 Mon, 12 Aug 2024 14:14:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gveb=PL=epam.com=prvs=4954548ae1=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sdVot-0001w1-CN
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 14:14:47 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38f678bb-58b5-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 16:14:45 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CD0jIA021114;
 Mon, 12 Aug 2024 14:14:32 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 40x124cb7g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Aug 2024 14:14:32 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB9560.eurprd03.prod.outlook.com (2603:10a6:20b:5a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 14:14:29 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 14:14:28 +0000
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
X-Inumbo-ID: 38f678bb-58b5-11ef-bc05-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTFU++3ejtlWaXmS/6di9yOKeJsGFSMBHb1ydz5uZjzaBO7n5B3LuLBbIojBmmI7+QTZicMU6JR6n26h6YCE21qDZORru4FRwQBJD2han/nGkuKd5dMug9lKBuOTBggyC8Irgu4yY+utxxuWl4oCMx3y6pYCkIOt3cc7cYuuP5cEv4uQ4+d6c0m5eTPmGcBFxYS+LemNmVrlIOUtAsBKNoR7ruz1mBLKp+DEGqLpJF1KVEb6CwzjcbZ/ThK1C4jIgtIofFWBU6aTTb35aYxvl2N9E7LQhP4W6ihzZf/KiH47NePdIVQ9XQLdKYya5onF7nNAI8JpFuVVh+7OEGdlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URL71CPaVialNbQgQW35MG+PHRVPVVtw31gkEZNVtMM=;
 b=By7k7f4LYFN7NupmCIwV/En7m+DEZbpyovjXFfOKIZSmpHTtJ5ZG1pGxpivJNqfV3EQjTuyx/lL86uR/acvkEhbYbwhmd0/wC41+PUNMhcyinyFbG7DDQ1+rl4eAgRiqVVhd22Szo+C+oCEKhoUZzdc8qUgAMNm0rgMwhcurcIGNngcpe2exL2v9rOGQBXu9GqGCUVtg1sCGgSiZ3MGdi/TzSAnWK6da/3K15bj3R4ywJ+rnleEgyf7FQIPQ25XCBKwDLEf7iGsUq2lR7UW59wRj0yptk8k3JdtWRUhU6CCCQgjQLfA76glJq9mf3ALyrCyUeqSMbv7MMSGCUx5kUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URL71CPaVialNbQgQW35MG+PHRVPVVtw31gkEZNVtMM=;
 b=N5jKT3iPle8Ex2WI1GCN1Q0NQlrgtz8NGpky5QTwytHRUk9gDneVRaavfbxH1VHnQQWuTwqTatNELtTzzZEUHUtWAHDZff/A/VkTosqds3IchHxm3kLMjxFUDtsdoBrvapepIGwYfehu59RfZaxc8ELp6GaRw6taZwW9IXBJxLfWSShkHtO8aNf/3/LqW+P6mWGDj8e83/g2ayAkhp9Y7m+qBl8qnEKFZKXqEYq8lIxCd7Kv/Bt4bGJFk+eHTBjl5ab1vBf4DtsxsIXIeklIB22+ZB6e4EAdAiKDMI3Iqq85iSkf+PYup8oOewma8oaPnmS1pZSVajB9A4qL2nZZBg==
Message-ID: <84663969-fb38-4592-9246-e0ea07aeacd8@epam.com>
Date: Mon, 12 Aug 2024 17:14:27 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/2] x86/intel: optional build of intel.c
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
        Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
 <25e80b9271607da56abf9d4193e4d91b3d00bd9c.1723196909.git.Sergiy_Kibrik@epam.com>
 <D3BBCS1WZ3FI.KYTC0BZLDUM9@cloud.com>
 <dab7d359-4433-448f-b781-03544fd4b68d@epam.com>
 <d449f8dc-2d59-4836-b26a-b29a83f7d6fb@suse.com>
 <D3DXIHMBKVC1.21P79JH7NMMG4@cloud.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <D3DXIHMBKVC1.21P79JH7NMMG4@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS8PR03MB9560:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc4ce78-3616-4774-d7ca-08dcbad9140f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y3ZwUDdwTGJwODdiMUpQam5GWUN5a2ZDbTc1dFRLdWk4ck9XbWxsVmRGY3ov?=
 =?utf-8?B?ZG9YNTJqbm9BeitlalZVKzNGVDdLTGxVVVUxOG5RTkNNc2lHaTVmZXA3azN0?=
 =?utf-8?B?ZVI1cWd5L25GQW5ZMUJMeERvNHFadVcyOGVxYzk4c0VKa0ZNMngyeHVNOXBm?=
 =?utf-8?B?RENLa012djNXcVBKY2RzRVR4VCtHWjk5UjZuWitEdDYzNk1rVnp4a1E2aGRG?=
 =?utf-8?B?bWV4cVRRM2diMmJSRzZHZ0JGd0JEYWpESStZd2U3aStuOTM5cmZxVmVxSlA5?=
 =?utf-8?B?Wkd0NURIRnA2TW9DUWRvQlk4aEtNakIrSFNuUG4wUjArektoVWlBcHZMN3Bo?=
 =?utf-8?B?VTNDcUFSMVczQ092UDltZmNuNHQ2NXM5d2lhWUxERFJHaXdkSFFpbFEyZ1Nq?=
 =?utf-8?B?ZForT1NyamsxTGdLdlJxSENXQ09IM1hDcmdSRnU0MW9mVERVUEtCYzRpQk1R?=
 =?utf-8?B?L0l3Qjk0Nmg1UDc4c1BKWTFjYy8yMCtmZDBJZmRCQ0s0NW4zb2xHRy8zRTFE?=
 =?utf-8?B?OTB5aUxKaXdCTHFKQ2ZTNGVKbUw0dkxBMkhzejBBelRUUE5NVmdsdCtKZFkz?=
 =?utf-8?B?SXR6RlZuc3lhN3BEZDBoQkR1bHJIOEMzNlVyOStYcGRXTEdnd2FRV21hY3Ri?=
 =?utf-8?B?SDVRSnB6QjlPbmQreU8rZVZaSStDV04vYklHUURqUDBoMXNQWWdYVml0cXFn?=
 =?utf-8?B?UnNDbVBUTHh0TFNyQUFCeEJINU5tem9pV3pQUU1QVHMzZEJDYUFQVDl1Yy81?=
 =?utf-8?B?d01La29wVFFIZVhacmVOTTlsZnk1VHhJejcwbnU2UDNnVy9seXVORE5YV2RV?=
 =?utf-8?B?bUUyZm4xbVFuUjVzdWd1M252M0RXOVVWd2hkUUh2c3ZEYUVUdUFKbEY5RTZL?=
 =?utf-8?B?WW9nSm5ya0pFdXp0cklYb3puRldrT3pmMm51a1MvWGxjWHVmb05kSVoyazlF?=
 =?utf-8?B?N2F2VmJhWkVDdjVaSktVeEx1YkJMT3gvemdiMlNrZ1hLR1hWK0pvOXJGVk5Q?=
 =?utf-8?B?TUtieTFwSDRGYUpPZWZMc1VubFZtZ1hJdUhuTTBnQjRCbTloMzVkOHRmV3hp?=
 =?utf-8?B?S0hXRGU3VXVBUTgyK0ZTTW1DeW9UUXdaN0laVTlRRlFuRmNSMkxSY1l6WUo2?=
 =?utf-8?B?YzY1eGJKcUVwVnNzRUtIK3I5cEhKejdZNHNPbHNaYmExcWpreFlVMi9Vc1V5?=
 =?utf-8?B?V1EvN1BNRk1MT0YzT1paazBMK0NEQjcyalphSDVmQStnR3IxWXgrb0F3anc1?=
 =?utf-8?B?UWwwTWpEVEVvME5hNW02TkFNTkVjcUlGVUM5YnVFNVJvSXFQdFJ6NG5mM05a?=
 =?utf-8?B?emhOc1dpM3BBMnN5RVBEVks2NGhNWHFrcWpxMnlCSFZsbnc4dVJMVjBqQnRC?=
 =?utf-8?B?Y09RZkFLZ0dLNlRpOWo1bnJZTUtVS3IyWk4yU2Jab3Zqa3hRZlFpd1NTK2lv?=
 =?utf-8?B?cUQ2OCtEM3I2VW5BcUpRYWhIc2NoaGJnemY1YVpWUlNQOGU1YkprNFVzVEJr?=
 =?utf-8?B?bTc3cUxoSmlMWGp4M1dEUTQ2WWVITzJmcHlPMjd5RkRMbTVqN0U4aUlFeDBs?=
 =?utf-8?B?ZHpSTWE0SDdzZEJNMjdQTkxJdkt6UVdlVVhhaG9ScVZUUFU4VGRMemdlZzBM?=
 =?utf-8?B?SE9uMnlFSHltWUZMU3RsR05NQXRHaEtROXFSaTBJd091QjViZmgycXZWR2kv?=
 =?utf-8?B?bVRqWlhhRnRmS0N4SldiMDJyRFZ2MHFVK2I0M3R3ZmxiSVFnNUpiOWU5QUlH?=
 =?utf-8?B?bkV2NDEybHJKYXFyWkt3VFUyK0h2eExmSEhhbmVzaXcybDZyblY1U0xFVDdr?=
 =?utf-8?B?eEVkZ0sya1VHMElmdE04QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzFvMjJLN0dGdDVPZWQvL3Y1YkxnOVBxMjR4a0kzUEhuZGZsckRadHh2Nnhm?=
 =?utf-8?B?TlhKdVZMMDBJSzN3N3ZPR1IzODV2alM5WnNOL2lxT0t2T1pJSjRla3RTUy9Y?=
 =?utf-8?B?bjYrTElEOC9vTWFzUzF0T3MxR3p3Ui9SdlBwVG9jMzFKMlQ4ODlhTm1lNE9Q?=
 =?utf-8?B?QXdGYXNXQmdLSVh2bEFjck5HZ29xVDZiVXF2aVVCQU5QUUp2OENySks2cCs1?=
 =?utf-8?B?Z1RBVWh4V2ErbUNBOEtNWmNDaFkvdU1nRG52c3JoNHhaUlhvRGJwZExpdkx1?=
 =?utf-8?B?aXIwK04xckZPMlU5ZnduamVxK28zV1FQZ0syc2UzWWEzQ3B3MlA4UkloMndW?=
 =?utf-8?B?b3FhekZrVjRsNHNWbWtSdUMzWjBMczRTN1UxYTg5V0VDMS9Nd2JqeDJ4TW80?=
 =?utf-8?B?V1JVdXJkdkVkbW15ZmRhU0k1R2Nhb0pJcnhVVmw2SnNNRWk4MnhEYWhlQWVo?=
 =?utf-8?B?VVNpYnlxVXpGSHhlbHBIVFdJZktaY3JuNC9UdXhwOXlQWVFTMSsyVkhXUllk?=
 =?utf-8?B?Q0hJWmxST055TGZVdVJ0STZIc1FYOTdUNmZpNG1FYlpxQTJZY1NsQlZxZmdF?=
 =?utf-8?B?UUlaalExVUpQL2toTEpDK2JML0loN20raXBRU0VKUGlDMUNVUWN3c2srU3lh?=
 =?utf-8?B?WWprYWlnalVjMTNKWGJUS2tlY040VjArUUE1S1haU0dsdEdBQTdBZ25xVVBY?=
 =?utf-8?B?NTR2V0Y0MTlDT3RHYTRYOXNsVWVHeittendxdTVuYWNqN3VqdTNUWUk3Q3Ux?=
 =?utf-8?B?SXdiRDNOSXg0UXg3U1JMUFVLTzh4WEZyTVJHSGU5VzJRRWM1ZHhkRVV4UUtS?=
 =?utf-8?B?aExIcVN0S0FDNlM5cDNKT0RodkZZWERCYkZRM2lMSzZTTnFnZjVvRjkwRU96?=
 =?utf-8?B?a3N3WmZLYmhIRzdNU1BSdXdJWk1LdUlnaTB6cHlURm9hSXR3blB5YUxta3Vt?=
 =?utf-8?B?cUw0K1RrZ0I3SzZ2TGg1T3crUHdqWXpxaE1QdnorbEVnN3UwNy9aNTUrNEpn?=
 =?utf-8?B?ZmFZWmVjUktRZEhWU1hOM3NOTUFOTVVzbDVTSnR3bTdmeU9xZUt4YVZkVHh0?=
 =?utf-8?B?eDB4Um5EL0hFWjBMRTlMaGJVcmhGVmJ1USt2RzBuYlBiR2pWUlgvN0tyZzY3?=
 =?utf-8?B?WTh0WWszdXM1UUtZL2JlVmk1cloxTXNLbFdPSUhEZmw0VFNqbzR4aS9EQlNm?=
 =?utf-8?B?Vk5SdStkaEN2OTBqV2U3eS92RFIwMzRNdHpFTzlaVU84OTk5VU4wU0N5OUtK?=
 =?utf-8?B?Ymw3d09yYmVOd25jYkxBRGhBdHpRMEcvMTFxL3ptd1B4OTVFUVNwbjdhbjFV?=
 =?utf-8?B?OGd2OHgzTys4alZVMUdVSkZUK1lpZ1lxRHRVb0tkdjdTbUVGWUZjOXBXOXZO?=
 =?utf-8?B?NW16U3JMSDZ1dDZ3YlUvMUhRNzV2ZklxcmdMVFpnbG1FY2xXUDhEeVFVT1VM?=
 =?utf-8?B?YWFuMjNqMy8wSmlVNVBZNFZUbnZBQWtKUVVkK1J4T0YvL21NTEwzclI4eE9j?=
 =?utf-8?B?ZE0xbCtXNHNnSDJBYlJBUi9ySUtaVTl2b1JnVVBOeVU0d2Q0VHVibXRkSFYr?=
 =?utf-8?B?bEZyT0dWbDJOeEdDUXBZUlBqODJqQ2tlSUJNUXlYQUNoN01EUDFZUWhMRmxE?=
 =?utf-8?B?U3UzWjlQOFRSUDlEQ3huamFqSVlFelUyUVN0N0JjYmEwUEh6ZEZIRVlid2dX?=
 =?utf-8?B?Z3VlbVRJSFloeHNnN0NjOHcycGxocGpTbm50VkNDK1VVKzNSVThkYnFHL1R5?=
 =?utf-8?B?Z3Nrb1JvcHhPSUpnOEsvQ0R1UW1EWm4zSy83MnUvRDFlckJnbU5iUkdTL1Zo?=
 =?utf-8?B?dnMxSGhPcTEwaHczSnlkTlJybE9FTjA1S1V1Y0hSamowQ3hvT00rcnkzQnBF?=
 =?utf-8?B?Z1pucEZDaitNMGdyVnhud2hCNlE4Z3NrckFvM05HWDJEN1ZPTU5PeXlFVzBp?=
 =?utf-8?B?U2ZHV3dFczhseWVKcDlxQVpWWDRHU3Fyb2dqalh3dVR1czU5NGFxc2RnSUgx?=
 =?utf-8?B?bS8rZGNCaFgrV2Q5V1A5YXNadmdkb2Nib0xhVVBFV0FvVm0zNmZ1RVdWSnZK?=
 =?utf-8?B?SG5GVXVtRHI5TmNFcWhYUVB1WHRNMUJabE9ub2pTOFNqV21FaS9LSnJJaGRz?=
 =?utf-8?Q?VubqUFavccdxxVi4PJpEmzIv7?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc4ce78-3616-4774-d7ca-08dcbad9140f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:14:28.8547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: djM9Viccsanx2rBIrCp+MJOm1vVGwRBzOWMA7VXTb3zcUcMPJ32QZCkQFctCCGSj44aBDQ7nkInSGYijX5+EPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9560
X-Proofpoint-ORIG-GUID: SL3uxOLmUn_ajVzSBiNX4Z50ZnPqdIEd
X-Proofpoint-GUID: SL3uxOLmUn_ajVzSBiNX4Z50ZnPqdIEd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_04,2024-08-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 adultscore=0 mlxscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120105

12.08.24 15:24, Alejandro Vallejo:
> On Mon Aug 12, 2024 at 10:58 AM BST, Jan Beulich wrote:
>> On 12.08.2024 11:40, Sergiy Kibrik wrote:
>>> 09.08.24 13:36, Alejandro Vallejo:
>>>> On Fri Aug 9, 2024 at 11:09 AM BST, Sergiy Kibrik wrote:
>>>>> --- a/xen/arch/x86/cpu/Makefile
>>>>> +++ b/xen/arch/x86/cpu/Makefile
>>>>> @@ -6,10 +6,10 @@ obj-y += amd.o
>>>>>    obj-y += centaur.o
>>>>>    obj-y += common.o
>>>>>    obj-y += hygon.o
>>>>> -obj-y += intel.o
>>>>> -obj-y += intel_cacheinfo.o
>>>>> +obj-$(CONFIG_INTEL) += intel.o
>>>>> +obj-$(CONFIG_INTEL) += intel_cacheinfo.o
>>>>>    obj-y += mwait-idle.o
>>>>> -obj-y += shanghai.o
>>>>> +obj-$(CONFIG_INTEL) += shanghai.o
>>>>
>>>> Why pick this one too? It's based on VIA IP, aiui.
>>>
>>> shanghai.c and intel.c both use init_intel_cacheinfo() routine, so
>>> there's build dependency on Intel code.
> 
> My point is that the use of Intel functions on Shanghai and not Centaur is
> accidental. If shanghai goes under Intel so should Centaur (imo).
> 
>>
>> Yet Shanghai isn't as directly a clone of Intel CPUs as Hygon ones are
>> for AMD. So at the very least you want to justify your choice in the
>> description. After all there's also the alternative of having a separate
>> SHANGHAI Kconfig setting, which would merely have "select INTEL" or
>> "depends on INTEL".
>>
>> Jan
> 
> That's one option, another is for the Kconfig options to explicitly state which
> vendors they apply to. I'd be fine with either. It's less fine for CONFIG_INTEL
> to cover a VIA derivative and not the other.
> 

I think I'll go with separate kconfig options -- for Centaur, Shanghai & 
Hygon, as we already got a separate submenu for CPUs & everything.
Also this way it's more up to the task of config tuning.

Thanks for clarification!

    -Sergiy

