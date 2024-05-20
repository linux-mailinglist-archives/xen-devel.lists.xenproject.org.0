Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF458C9A65
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 11:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725925.1130220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8zOF-0001Xj-RP; Mon, 20 May 2024 09:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725925.1130220; Mon, 20 May 2024 09:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8zOF-0001VZ-O5; Mon, 20 May 2024 09:33:07 +0000
Received: by outflank-mailman (input) for mailman id 725925;
 Mon, 20 May 2024 09:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H0dS=MX=epam.com=prvs=187012ae9b=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1s8zOE-0001VT-CU
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 09:33:06 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3f1bf85-168b-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 11:33:03 +0200 (CEST)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K8xleQ006339;
 Mon, 20 May 2024 09:32:52 GMT
Received: from eur02-am0-obe.outbound.protection.outlook.com
 (mail-am0eur02lp2233.outbound.protection.outlook.com [104.47.11.233])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3y83gc84ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 May 2024 09:32:52 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by GV1PR03MB10519.eurprd03.prod.outlook.com (2603:10a6:150:162::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.10; Mon, 20 May
 2024 09:32:49 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7611.013; Mon, 20 May 2024
 09:32:49 +0000
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
X-Inumbo-ID: f3f1bf85-168b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0LC6vNfEKRauUm2Q08ZWTdsy9SwmSmy29i8A7bG8j7/6dohlpZym1E3rxKu9QUs0ZIrhZqDO2QNqjCWDHQY05XW+QNxQMJFcqk3jLMo5EkaDzGzcjsq6ek5KtHeiSVZLFgFXXUL5cc5Keu/nD4GqOptKztjMgbWZdqzIMHIr1N6p+bC6Wd/UFnJpbTE+EFiWPODFiS169wkAmwVHY+BN2lziXKU240J4KyRU6XGEI33UwGlAIaG+QCepho579NxGUOubEPoTuAsq0rYCKE72ZiFf7HQWP8/bHvVM/9Kj21g919Ie4yZeuM+IW565wNipmxCvXyA0Za1RH4jtCFTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Dobb6zopaOwVYR/Hww3nW/UPjZbNglrak70RDzBrCk=;
 b=L5iU1s8qHOOVcj8VnwroaFxvC9K1uxeVYxzgUgJ4TLrGyHntYaCO87rM64Ill9MENQWqdrVDqTHcGRjjhedLh0IgdILTA7nU4gODFYCSU2O2NeYuMKJwYc3qZy5PhSwZkP/pY4+Dl3sg+8K1iBMmwZgKuBtThQ+7hSTBH0HlOtSVjxGYjgu8p3thZhlEnDBKRAxmL2VuFf5ySsS94a3TiwwpgfbQroELw6k0u+WxQ+iOe8fI0QJsj9GKDYKzA0dEt21LkjcqX3EbZZ8LbBierXQ4Ulm5qeNFNfbioszmU7ETbKa2dYjmfg2JA8Ido3TWcLlep1HZjbB0HmEtUPv/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Dobb6zopaOwVYR/Hww3nW/UPjZbNglrak70RDzBrCk=;
 b=fkWHSZjGEHRV5BZiE+M8kNrfZXV3UN71fEmY6gKfqyAZ9cVlTA8xVWESFwYrhvywzrtlDPpXNj288rtyWtJxxyxvFvlpPtyLD704yoinIVEX9/FRXfV/ID87DebN3Hh164whIDZYIJI8I8jOFoN6Cf6j6X0mwnxPx0sMI5zpMoTlU8q0BwDT8LuzPrADq4arz+b2zD3R80Z9Q9mPr8VNcrXrza7GZR+SyMfTWGBBLIQlqwzkSYiMGuNrV+gKBUKUWiyKDiwjVpTRddzUWmR6N78JhqXlCD0z9JY2sy5b1j07h7OX2l9Nh5hZj5vF3ia32jFJ0trRXnMzMQj25Rd+fA==
Message-ID: <68e2b3b5-649f-4e53-8700-350bdb8e5b09@epam.com>
Date: Mon, 20 May 2024 12:32:47 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 2/6] x86/intel: move vmce_has_lmce() routine to
 header
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1715673586.git.Sergiy_Kibrik@epam.com>
 <77bc29d74cdc43539a060bca26495a4115171f6e.1715673586.git.Sergiy_Kibrik@epam.com>
 <a21691b7-224e-446b-a2db-761ffa48107e@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <a21691b7-224e-446b-a2db-761ffa48107e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|GV1PR03MB10519:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e6a470-593f-4389-5f75-08dc78afd083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WEMrRnhMemhvbFdEQlp6cmlJN082WFRFUzUzV3V2UmVRSXhHMWhoeCtGbFFu?=
 =?utf-8?B?UTIxQWJvOHk1MFRBL1NDZ2kyRHZzT1RKVjVGTmZkNUNjSVJINE5FbUFGNXNy?=
 =?utf-8?B?d0dZYVhXbGxiOEtoSUlrTjFES2IrMUcvZXpoVXhyaW5LenhvZS9US0htZTFT?=
 =?utf-8?B?bllzNzl0K05PRHY3SlZWL2xzRUx6VHVzNXpKNDRrNzVSMWVULzBFSkFpcjhj?=
 =?utf-8?B?Q0UvMkI3ZDhtWm84OWhoK0w3eERlY00wTVRJaHV3bVpKYzFzQnViZTBCb2M2?=
 =?utf-8?B?aWc0OU1IZWJ4cGg2UXlCZWcweHIxbmtiZXJOeEc3ZDVrcW13QXVua2JUdFpx?=
 =?utf-8?B?VzFwZlB6b3JRR014VXcza1E5STFpOUQ0YjV5b0hJS2t1Snh3dElDckdJVDhW?=
 =?utf-8?B?TUgzbFRPVE5NWEk0a2UvNVVEZEpPQlRuV3liM2F0SkRvYkNRYTNxcm9rQVpW?=
 =?utf-8?B?V2JHM21KVFpYZTFDb21ybXpSM2VoUElCT0RLaGxEQjZtbHlLYkdrYnlGZ3Ry?=
 =?utf-8?B?ZWhOZzc0QzM0cEs0ZXlHL2wwejA1R25uNFdQcDB0d3BLMFUwaHdpT0Ivb1U4?=
 =?utf-8?B?RVNPM3gzUmUzK0RPOUN1dG9RTSt1d2JMWEowUDhkMUV2TUFjWHQwVi8vdVNS?=
 =?utf-8?B?SThUM2lsekJkWVNDSTZvUHBBOEdPKzZhWGcyM1pkSURCbWNwNGVvK2E5OVJZ?=
 =?utf-8?B?K2Fya3RHZFYxR2NGL1VYeXB4QUlQd0V5cGRlZUg4MVJXRWNXZUNJUDFyQWFv?=
 =?utf-8?B?aW01aW5MNnZBTElPTDB5OFg5VjJ5RWpnSGtLanJnSWZUUmJKc21RbHBEZlV6?=
 =?utf-8?B?RE5DNHk0dnhTdkRlVUZDYWtIcWlVQWswYnUvMml3bzVaRnpFbFdtbUJHcmdi?=
 =?utf-8?B?dG9XQXZCYyt6TTZzUkJ0UDN5VzZWQ3NRbys2WUtEZktFVklXbzhTV1ZBeS8x?=
 =?utf-8?B?ODcwQ3JGSEk5SE4zTExhaytQUHBiVVJEMzBLQ3pVT2oyNzF3a2FFMlgxNmxp?=
 =?utf-8?B?dFVLaElPLytWNTVRRU1ad3pZNm9uRjZscXNpUURWNVhXcldVNjlyUzQrRmY0?=
 =?utf-8?B?Y0Ercjd4dXlyb1RGTnFJWWtnT3VEMDdVVlkyQnRGZ2Nzc1M2bWZBRTh4L1JM?=
 =?utf-8?B?K3NHc21tMlBmSk9UR1U3Ti83ZTBFaHlyR2QrdVlMNGdyTVlyUnI0SFhaWUxn?=
 =?utf-8?B?OEc1eFREdkRRUHVmbzlRZ25SQ2w0dXZNcDNhR3V3NjR2cE9nSzdZb2VYa09D?=
 =?utf-8?B?SklJNm5GVm1FNjFrQVR4ZGU4d0JycHA3aUR1aXBBSXp1VHVRN0RpeG01aHNF?=
 =?utf-8?B?SjQweUkzMk5PVVhWa0RRRUE3VGQ1Z1FRZVVNUjMyRENSTThxSVpybGE4Mmc2?=
 =?utf-8?B?cGNoK09HNWt6UFAzbEd2T3F6SmNIUkpmVXpxVFJhNXZtS1IrVHpPZXJ2bWw3?=
 =?utf-8?B?SWFWZUQvNTlsR25LM05NSWNlbEozRm5SUURHaHhBdnVJSmxLVVM0cHJNc0Qw?=
 =?utf-8?B?WElxV1pTbHFzdUJHelRZVDBzb3lSeE1yWnlRbW1WRDEvWHpMOTQwbnluVGh3?=
 =?utf-8?B?N2RnbDdoOXhFUld6USswRk5qQldmczlkaVNjeVZXSnFvbTRJOTlXY00rTVhP?=
 =?utf-8?B?Q1hyS2drdjUydXRUZW1ZWFU1dTFLL3hoNWNPNStVbFcyVVdtMWJjdHl0V29Y?=
 =?utf-8?B?cUVoRnMzMTYzRndoOG9YU2lkdTZPcHMrSTdGdDlEVUhqTU5pSWRQYWtnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TE9laDAyRUk4MjVrU1plWGRGTjdSdi9LM2hDVFZNYmV1YWtldkcyYmdDSW5S?=
 =?utf-8?B?WlFwR0RVTUF6c3FJQ0RNNVRFWDNIQTdBUlNjYnhtai9LMWY0QzRya0QwQWFt?=
 =?utf-8?B?WWFoOW94elZnY2RaNWNOWDdwRmN5eGhQUWFzaGVGampObk9FUkFiUDJ4V1ZY?=
 =?utf-8?B?M051Rno4bEthZEpqeXpKdUh2S3pIbVBzbW9QT1hhME9ERlNvMEZ6YVVaVjFt?=
 =?utf-8?B?dlV0eGViUVJ4RzUrWEp1bThhVnRmWFpKTUpNUWpvTFhXODBZSURNdk8wbzlW?=
 =?utf-8?B?UGJtMWllalJJREVXdVBvM0JIemR2Q3B3YkFORmJMeXZRL0tISlgxUlRVTmtk?=
 =?utf-8?B?cThnMjdrNlMwMG51ejg4OFZ4S2QxWC82Q21vdmw2amcyTCtVVTJOcVF3bWwz?=
 =?utf-8?B?bGVvKzNzVXJJbmV3YUt2NndhdTZYQkZZNXA4bU5Xa3A0Y3kva01YdW9iQ2pF?=
 =?utf-8?B?MjBLZmxEUEFrR0VxK3NtaE9XZUd3MnRoVDhqcXZRd1RSR0hDeEttQ3FsSHBB?=
 =?utf-8?B?VVAwbEJoMk9FVkc3Zk0zRm1TTzBoNEI2dEovL1d6cE5qcTRHOEFyQ3A5TXJS?=
 =?utf-8?B?SituQ2JLN3FOTDVzQXBUNVRRbEduWVVQZjNkOEc4RWl3SWY5MjJKT3NzYmZZ?=
 =?utf-8?B?NUtIV0FPZ2NsaE41cnh5ZFZYcldsMGh3b2JaSHYrVXptNitqRWdsOU0xQ1pr?=
 =?utf-8?B?dUdMbjUwN2txVUp2ZlcwNkVKWWxsN3FrbTdEdTA2UTd0SVo0ZWdibyt1NnVo?=
 =?utf-8?B?VHhMS2t1dWZ2NmduRk9mUVdGN1lGMU1ERUxHM3JrWjN5MHNJaUJ1T2N5aDEy?=
 =?utf-8?B?dFBsUTJxL01ML005RC92SU5iNUc0Q3JHYVdyM1JmMTRnSlJYV0Z6V25yQVA0?=
 =?utf-8?B?YXQ3MmpPdU1JWDlJeStRbzR0cEhsTWlWVWNUZWx1R3gzQmgzbVJiU3BOUmpR?=
 =?utf-8?B?b0N6V2R5SlQwUW1HNUtOWHBFaDQxRVdUV25oN3V0NGE3OFVQTmpsd3FpZ213?=
 =?utf-8?B?N2NSU3krVDFTUEM4RTVZNGJFNENudjBvMWFKckdRRUtwYTFPTlpHdVJIVmNz?=
 =?utf-8?B?bk0raDBtQ1ZaZFQ4ekh3TWtKSmZqL2hYeURtOWl1c3p2eUNIUnl3NFMvY2Zq?=
 =?utf-8?B?eThpTElnRVVZa1hFd1FvUjdqRCt5dzRzc0VDODNmelJIenFnK3haVW81NzVB?=
 =?utf-8?B?cGM0bDNJaUM3UW1YTXlzOVJsNThwNDVBaXpwV2wzSmJ4YWgxaHd4ZUk3MFBN?=
 =?utf-8?B?U1pFS1FBRXdSV3ZPQ2hJN2hFb29FMjFpZXNBWTFkekxkZ2pMcDNKMytHT1ls?=
 =?utf-8?B?alpoOHk2d1E2SDdhTFgxL1pSMWZmK3BSRU9wOUI3OE9LMXR0MGxoU1piWFZx?=
 =?utf-8?B?T3JDRi9LSWZha2wrLzRCczZORVRVOWhtUHI2ZDhHVTZwK1R0Q1d3dGphOHFO?=
 =?utf-8?B?eGU5UWhXenQ1ZnpDY0V3dExySDZGU20xazBqR3MrUkJtMXU4OXpDZ1V3d2gr?=
 =?utf-8?B?OTNPajB6VDNsQk5wUWljV1p0UlBVZUVuS1FmL0tNYUU3NEhTQ2tlVWwxYmdx?=
 =?utf-8?B?cFZpU0xBTWtud2FlQWFZMFdzblN3M2JlV1prR1lzZS9lWEp5WHBpc2t6NGkw?=
 =?utf-8?B?MUVqZkFHcjVaTVlCcnR1VklveHNsaWFpMDBaU2NVM1B0TEE0MmxxK2xVSWFr?=
 =?utf-8?B?Nnc0TmorYTgyYk5teFUzcExkbFYrbStVeWtpQjlqQlUzcCtHdVd3Z0theFJw?=
 =?utf-8?B?U3dVZzhqZ0pnaVpVWERUNzFsOHNlYkJMU2EvR0ZkZ1d1VmtDMVZMSUJER1I5?=
 =?utf-8?B?OXY5WXFYckNVRGhSenhBTmVpcGtTN3Yxa3U4SW00c1ZYYXNwZWR1OTNXT2h6?=
 =?utf-8?B?QzgzSjR4ck5IK01SK1VlVUlEd2Y2bko2UDg1V1d5dU1BNlhVTzI3SlhXSU1U?=
 =?utf-8?B?S3BhTVd2MUgvUHZlcUVHdThyQ1dyZXl3SVAzdkJTYnhuUVRuUmdUWHZNL242?=
 =?utf-8?B?Z2JkZmpHcWVMRHNYSGRIcE5EN3ZkZHZObE9JWGVHajMyOHNRM0JpL1dzYWpT?=
 =?utf-8?B?OHgzT0cxQTk5eGtIa2N5T1hwcEdWV3VodnZtajh3WlpObjJ4K2tzcTJTZXQ2?=
 =?utf-8?Q?y09X2T3+xGH1VJbn0lctZlNR2?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e6a470-593f-4389-5f75-08dc78afd083
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 09:32:49.3666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCz3K6Iz1L2vPHVn0t0MUzAO4w9Ta6w4+Ni1LnIGca2iay0RzrnF9C3+r6sg8FsG6zO1t+VeFTcOLJiHkGrSeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10519
X-Proofpoint-ORIG-GUID: xqmlm5qnsGBqaayqgf-VzK9TjICdj3Jy
X-Proofpoint-GUID: xqmlm5qnsGBqaayqgf-VzK9TjICdj3Jy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_05,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200079

16.05.24 12:39, Jan Beulich:
> On 14.05.2024 10:20, Sergiy Kibrik wrote:
>> Moving this function out of mce_intel.c would make it possible to disable
>> build of Intel MCE code later on, because the function gets called from
>> common x86 code.
> 
> Why "would"? "Will" or "is going to" would seem more to the point to me.

yes, sure

> But anyway.
> 
>> --- a/xen/arch/x86/cpu/mcheck/mce.h
>> +++ b/xen/arch/x86/cpu/mcheck/mce.h
>> @@ -170,6 +170,11 @@ static inline int mce_bank_msr(const struct vcpu *v, uint32_t msr)
>>       return 0;
>>   }
>>   
>> +static inline bool vmce_has_lmce(const struct vcpu *v)
>> +{
>> +    return v->arch.vmce.mcg_cap & MCG_LMCE_P;
>> +}
> 
> Is there a particular reason this is placed here, rather than ...
> 
>> --- a/xen/arch/x86/include/asm/mce.h
>> +++ b/xen/arch/x86/include/asm/mce.h
>> @@ -41,7 +41,6 @@ extern void vmce_init_vcpu(struct vcpu *v);
>>   extern int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt);
>>   extern int vmce_wrmsr(uint32_t msr, uint64_t val);
>>   extern int vmce_rdmsr(uint32_t msr, uint64_t *val);
>> -extern bool vmce_has_lmce(const struct vcpu *v);
>>   extern int vmce_enable_mca_cap(struct domain *d, uint64_t cap);
> 
> ... in the file the declaration was in, thus avoiding ...
> 
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -24,6 +24,8 @@
>>   
>>   #include <public/hvm/params.h>
>>   
>> +#include "cpu/mcheck/mce.h"
> 
> ... the need for such a non-standard, cross-directory #include?
> 


This is because MCG_LMCE_P is defined in arch/x86/cpu/mcheck/x86_mca.h 
-- so either MCG_LMCE_P (+ a bunch of MCG_* declarations) has to be 
moved to common header to be accessible, or local x86_mca.h got to be 
included from common arch/x86/include/asm/mce.h.

As for the MCG_* declarations movement I didn't think there's a good 
enough reason to do it; as for the inclusion of x86_mca.h it didn't look 
nice at all.

Are there any more options?

  -Sergiy

