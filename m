Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC6D952BBB
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 12:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777967.1188035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seXUa-00020v-PV; Thu, 15 Aug 2024 10:14:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777967.1188035; Thu, 15 Aug 2024 10:14:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seXUa-0001zR-MN; Thu, 15 Aug 2024 10:14:04 +0000
Received: by outflank-mailman (input) for mailman id 777967;
 Thu, 15 Aug 2024 10:14:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KwPb=PO=epam.com=prvs=49579c5ae1=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1seXUa-0001zL-7B
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 10:14:04 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17c7fb93-5aef-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 12:14:02 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47F9ZgRs023439;
 Thu, 15 Aug 2024 10:13:52 GMT
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazlp17011017.outbound.protection.outlook.com [40.93.64.17])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 410tdwugyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Aug 2024 10:13:52 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AM7PR03MB6468.eurprd03.prod.outlook.com (2603:10a6:20b:1bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 10:13:50 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%4]) with mapi id 15.20.7849.021; Thu, 15 Aug 2024
 10:13:49 +0000
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
X-Inumbo-ID: 17c7fb93-5aef-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=om8u9pm+dY0houmDq+AreZzG3xNRsyCad7wnktecoiWbrnFDOIb0mH2pafXOIv4ibaqaxwPdg1BQpc0Ir9xpJwDxlv7+M/mpe/boj3p2fjXs4+WahsUObkqssI8f+hy1gcuZgrRpg4f/qiaa8ZUtYFo9B+O4aZwSdiFtircIzyhyajwL8qBjZ3nUBu5r/JhjLMU+SzIBsewkx2zKXQ5fys+WCuEBpOkSli2LzAz5ehDj0+iwp4WvTcWcs7zmycWjtxqsiF6PIlbuF0fT5dn/bu00ECMrpbgMq68mxaBvKXVo6tl7oXjUDBY7j2fONFMVj9BMSL24SgjUdNci1uybOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KA9utaxHJXkM8L3oh6OBEMf86CJfyD1O7lD4HEeri0g=;
 b=pgWub1WTBrJ85bF0kToFuva5JXAV5IUQGykCrWfl8ySSQYmO+gAdaQSCKinHxmAMtAf0fm262hskLuhc5tKFeIgSHOu27a1BNuioo3M+YSHXbfgqIF4aJTSonDTktfvHdPUd2xehiaBLetnZw6qeaCj0Hpku7B8tWFJd+ZIHw2vGZ+NK3lDt4Nl8hGaCj9u0IhAuGcFRM4Q4DXCWH4oIBovpywPHYctcrRaZIoIfK99zcaKZ1mKxvOLQQYZ4BWpYyYCJwA5dtdUIPmlRKhRGU9zJ0ZqV8C397wlre3+f34dEFMcoB/hGw4n08tXdzgQqy6tPLTZQbZNI41zfJTdiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KA9utaxHJXkM8L3oh6OBEMf86CJfyD1O7lD4HEeri0g=;
 b=CVE1zot1/fA2OsIHYUnamrjmox+rM7ofSD8HBAaE37SxCqo+YHth6WFBhNqJcYaSpxAuhSBL3FCDOWbeObzwkdk63e+A3gGkroSRRZQwoUvQnuXCThu8x5hJrakSZRZwnI+oAyEgboouRhW61ntz31bzKNZGAhTsWHRdq3RbvGB5MzC6q6W49thrYn4Y/JlLkwvVRvauG01aC99V2mRlz1h6I5zOVKxgBIKrAI4W7/V0XQFgJ1LaQ5ApjS280yRqslC2X50qD2oVMGVihbhHL7p8mc07Ao1bJzykFDeW+UpDj7Np5TObMoFS5na2CEWPI/8A5KwEjgXo3HKNfLtb8A==
Message-ID: <ffef234e-8b9b-4564-a33c-15e606c2e63a@epam.com>
Date: Thu, 15 Aug 2024 13:13:48 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 2/2] x86/amd: optional build of amd.c
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
References: <cover.1723196909.git.Sergiy_Kibrik@epam.com>
 <5632b05e993cca78a58b800dd37165ccd80b944f.1723196909.git.Sergiy_Kibrik@epam.com>
 <abdac4dc-b8e4-46ad-bd4b-c39caa868a9f@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <abdac4dc-b8e4-46ad-bd4b-c39caa868a9f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AM7PR03MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: bfdcb51c-1bb6-4b3e-6588-08dcbd12f4fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V202MmJyTEZ0YWkxdDdXN1JMK0dVMEEyRC9zOHZ5ZXovdTY4dEVQT3pFVitQ?=
 =?utf-8?B?dk1DWVRBbDJISkF0dzBrWk5SRllPY1ZFTWxlamhVQWNzZzRMQmZkMU1TREZF?=
 =?utf-8?B?REdDbnp0eHhkY1Q2QnBZUnpDbFBRckYzZHJ4RHBqd3VOcjh3NnhEZmsrZ0Uw?=
 =?utf-8?B?L29QYWw2cEVtZzNwUUFrdDZsVlN3Mm1STnpxdHFORG1BKzhaTjh4TVhiYjM1?=
 =?utf-8?B?MVZKTXlQSmhBNC9iZGJzcEMwYWxESHBPQ1hhRUthTlZ2UEdNNWN2SzJLYlNM?=
 =?utf-8?B?U1lnWDJDUC9NUENrNDRFSWJvM2R3dEptSE55bkROVHU2N2tIank1OU5WMHRw?=
 =?utf-8?B?WWx6UFdFb21CTXd4dWV5dldPOUpBZDBIbmNndVZQSDhudS9YZFliYkNsNEdN?=
 =?utf-8?B?QVF6RENob2k5UXVjTllJd3I3RnlWemVycVE3dDR2ZXlvVW5ERzFQSC9zd2VD?=
 =?utf-8?B?Tm1tM3hudXluRGI0aGt3ankrUm1DM2xaNUZnZDd2aWVqUnh2K0d5RHo0Zk9s?=
 =?utf-8?B?VG92Sko1d1FWb29DWU5hN1RzUWd2RXVkRUFQeXJJbUxUcjJYY0ZubVk2VVp6?=
 =?utf-8?B?TG5XMkQvUjh2SUZZcVdJSTlKWjJIQnhadWRvYjF3RTZJT0l0dllZZmcreHdY?=
 =?utf-8?B?UzRVZ21aQk5kQ25Qa254OWx0M3JyQWNTUUtMWmVDWUxDTEx0S24zS2FXM2R6?=
 =?utf-8?B?UHNQRHd3TXdvU2hkSEJtNUYzZStZSzRsRWhBMFhoSkdhZEZPelFDQlJWTTd2?=
 =?utf-8?B?Q0VPSVBrU0JYNFVmK2w2bjJVVm5ycU1xT1NRamdkaEl4blBseUhxZXBuR2tZ?=
 =?utf-8?B?bXArdEpCS0NMMktIeEl0am92OXNEd0VlVHoxQVJDNUdZOG8zcU4vZGJnRjdY?=
 =?utf-8?B?bDNQSWhlVkxTL2puOEtXb0lyb2pTWWUxOUZoejk3NVVTZ3VvcHVJdjRxcDZ0?=
 =?utf-8?B?NENpYm1JMFJ0Zjh1SWsxSkZ5OTlRcUJDZC9EUVZiUXp0TWFYSnd5RDYwa0dB?=
 =?utf-8?B?RURHU1hnb05iRzIzZkR6TXdhS3hsaGYwYmVPSmZnVG1XcXBORnVQSHVNM2ph?=
 =?utf-8?B?ZGxzcU96UmpPNnZqMVlrQ0VOQ3B4RVZtWkhlQmlyMXpsc1lSaURHVXpTekFz?=
 =?utf-8?B?MVFoUkFaT2wySnlVRThXNmtGWTV1ZTc0UnprcDM4a2lBSTJPV0dCcS9GVWVJ?=
 =?utf-8?B?MSs3L3llUmlqbURqZkp6RXAyNlBBR2FCVzIvSVhlanp6cDBxeW5GYmxIMEp3?=
 =?utf-8?B?bmdqdGdPODZHTG02OWRVZkMwVE5lMG1tbmdWd2NxdVZic2psOXBCaXhGTlEy?=
 =?utf-8?B?RlJxYUQxUVNqNG8zWUhabGVTenVxK0MxVlBHQjM1U25EN2g4YmE2TWpzekpC?=
 =?utf-8?B?Ly90VGY5aHAyTVlRS0szbytPdm1OamR1QTROMjM5QzZ3MktYL1M2YVd6RXI5?=
 =?utf-8?B?WEhaRElTSWpwZHdSRGR2UUNTUE45ZzJCTzBhdFdQZkxORWFleCtzcVhRY0wx?=
 =?utf-8?B?akJTVU5QR2g3NU5GUUNPR1IvU0xLM3ZIbVYwaGYzTTY0cVBackhJQXg1TjdR?=
 =?utf-8?B?WU9CZTZOTTRxdHIrdytqK1o3N1RsSXNsRi9EdFhOUXVOODZTdUNaSFpYUC9z?=
 =?utf-8?B?TXFTankxb0E5L0xBZnhveGZwYzFYSDhxcnF1UktEdERkcXFwYWF6anlMamI0?=
 =?utf-8?B?STQrVzJacktkM0tGcktSRkdrdU9zN3YxNEEzQTBUUUdoMkcwZW8zVkJOTDJl?=
 =?utf-8?B?R0huMmEwbVNSSlU4TWFiTjU1azJaVUZwc04vZ3d4RzNCdHUxZ1NhMHBZSmdB?=
 =?utf-8?B?ckNZemNJVDVhbURycCtqZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVdrTnJmYVdka2NTQzZZb0JEVDRrOEdHZnk5dWpGb0NWK3J1YmVYZWRtZzZN?=
 =?utf-8?B?WElTdlZqQS94QW84UFFWaERSSExyeHV6TThSekxwbXJRQjlQM0tJaG9PNTRy?=
 =?utf-8?B?WVh4RlYzcmZPY0FuVlFDYTBBYThoYUpXK1lXLzBadzBmTVdBeUtBNUhENFRF?=
 =?utf-8?B?NmhUNXlNT3EyRHV0ZU1rSTZCdDZNeU96UExiWmM5bzFWcTY4NEUwZGx1TGpo?=
 =?utf-8?B?aTVMdkRSQ3pqc09TZzIvVlowTUdmR0xyY01GWkxJMnRoYVROUjAzWGErUVNI?=
 =?utf-8?B?a1BqRFJFSVdYbzRMckM1NnBWazVkTVRiRUIvVmJscEJ4dlpDcXc0WVg1a25z?=
 =?utf-8?B?dlE1U3dUcDg5QTNGQjJBVVkvR2Mza3pkMW92bDRaVXJpMlUzQllQLzJEYWc1?=
 =?utf-8?B?eHR5bis1ZzYzcmYyb09CY3dTc2ZhalNkUDhMWTg5ZFMzMVIwbU5nTWlkY3hZ?=
 =?utf-8?B?QU9aU3lrQkN5dTZmWGhBZjdFZDFlRmZFMU42NmhadXYyaUJMeDR2eGxyVXh0?=
 =?utf-8?B?YVQ3RGJKY01UWDJpSXBsWUNMMWEzVWIvNmluek81bmVhQ0VHaHZpTjJWMXNa?=
 =?utf-8?B?dWs0aGQ1RjBqQkJIdFEyWVRMYUppUDArMk1XczN4QjVCWEVUaHdiV0wzRG1S?=
 =?utf-8?B?aE00VHNSem80VW4rNXFPcTQ4Y0F4YWxNZ2FKak1tMklqeXIrQXhyRUlrMGRl?=
 =?utf-8?B?SEk5SlVvbFpPR2NUMzFEenpKQ0lXS1NYTXpTbWpaaTR4eUJ0ZmI0cEZwMjJ2?=
 =?utf-8?B?M3NHa3d0TzFmdGQxVGVYb2VCV1NTZHZYMnNhNWNqTDFwanZpQi9ua0ZxeG43?=
 =?utf-8?B?T1B0QW1jMWxGSzBjd0hwdGd1VUZxMk01VmZ0Q1lvajVZRkdsWnBGdVBOaGkv?=
 =?utf-8?B?czc0UzZVWkh6ejhPZ1c2emZKWmVSOHdOZ05UbEVKYklCSXd5aVF3VEhweTVH?=
 =?utf-8?B?cWxBNitaVGFiLzY1NkRDTHQ0TWVqWm5qVGpBNk9QMWY4b255NUw4NzZRZGxC?=
 =?utf-8?B?TFJLV2JjTnh3RkpvcG5YSlFIU080THkyZkN3bHFhUzh5SjdWMTNBd1hyZ056?=
 =?utf-8?B?NEhCNjNCRHV3S3picUJPTWVnVTVzZ1hLend0S0w5QUxKcUVBVVM3UHZ5OU1s?=
 =?utf-8?B?U3cyYlZrZ3dtRjZGSWpHcElhdXpsR05kU0xmN1VCYTBuc2xBcGt4bWRlYlZj?=
 =?utf-8?B?dVRwazl3OVNkMDFIdjJYSzNEbS9Vdjh6NDFEdlF2V0k0R0UraDd5cFVMK0JT?=
 =?utf-8?B?TG9EaXBQQ3dpVWQ0WnA2eEdhcU90UkVwOE9NWkRvZVhKYk5XdGt0OXZxblV2?=
 =?utf-8?B?TUtXaUVyNnBKL0FqNWU1U0xnYVhyTWJ4TlM1SGFoTW1FVFpJMEZ6ZGlaWjFH?=
 =?utf-8?B?WjhrRlF4N1pYelVXQTdGOWFZeUJTbjNQQTkvMXZUcUpJUElRTjF6azkrWExL?=
 =?utf-8?B?NWR6Wlc4U0dQNnFGb3JHOVh1R2ZqZ0J2QmNlaWFqVjF2WXpCR2V3Q3hNVk1v?=
 =?utf-8?B?aUZyaExMRHdXMWJXSDNrYnZJS2ZvL0tKTklMMlpOd2ozT0habVpWeVlLSS84?=
 =?utf-8?B?Z2tpV2laa2NpMTVDVFFMcGZ6cEJJZC83NlpRV3QxUlF3aUVKRDlscFkyclgv?=
 =?utf-8?B?VXl3OHhhckp5bzNxTm1OdTZHMU4xOVVhMitDdkVYbzNhbGpydnFjZFBnV1p4?=
 =?utf-8?B?cHpOeDc1bEZPcWNSeFRBTzZnclQwOW9JUEk5TERFY3BNZTczSGp4VVJaTXhk?=
 =?utf-8?B?WGtNaTh5T2VUcFJHdXM0dXJQWTZpTlBZWmJPeG82azNaSG1kUGNMOWxhVVZH?=
 =?utf-8?B?bnJTZUxEZ25RR3pvWnBVNDVuNmllZjVreHZwTDIrQlJMalNQOWhBQnlicXp4?=
 =?utf-8?B?K2lWVXYySUt4azVCSWVlWGFDYithZm9jM0NuOG9qd3RsdGlJWWFiSS9FS0Ru?=
 =?utf-8?B?VWRWNjd0R29WOVRqMzl5NHdmcUl1QTRnSnFDQnBVdi9KZm1IYjdDczc2VHVp?=
 =?utf-8?B?SSsrNDY3a1lLTGdocldkVEtGRG02SzlicHBkaFQrNDRvMTF2T3BtSzdPajdC?=
 =?utf-8?B?N1dlZW5jSlVDcHZwZUdJa2RsbjkxL3RCaGxTZExCK0M2aDFobVc5WWxDYi9C?=
 =?utf-8?Q?nRgDxm4xbyz+eXzGiNmyRGQHV?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdcb51c-1bb6-4b3e-6588-08dcbd12f4fe
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 10:13:49.8767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LnRvq+bqWFHIreodS2GEJZE/14P5AQ41RbmHRhiWPvkAZ8NnA2ttWMVIyXqQxhHSEBe5UIY8DuG8pXOGry/Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6468
X-Proofpoint-GUID: KcVgHf1pUDsq5Zlk5sc416I228EqBMBo
X-Proofpoint-ORIG-GUID: KcVgHf1pUDsq5Zlk5sc416I228EqBMBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_02,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408150073

13.08.24 10:50, Jan Beulich:
> On 09.08.2024 12:11, Sergiy Kibrik wrote:
>> --- a/xen/arch/x86/include/asm/amd.h
>> +++ b/xen/arch/x86/include/asm/amd.h
>> @@ -158,13 +158,21 @@
>>   #define is_zen4_uarch()   boot_cpu_has(X86_FEATURE_AUTO_IBRS)
>>   
>>   struct cpuinfo_x86;
>> +#ifdef CONFIG_AMD
>>   int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...);
>> +#else
>> +static inline int cpu_has_amd_erratum(const struct cpuinfo_x86 *cpu, int osvw_id, ...)
> 
> Nit: Too long line.
> 
>> +{
>> +    return false;
> 
> I wouldn't mind if you consistently changed the function to return
> bool, but as long as it returns int I don't think it should be returning
> false.
> 

indeed, it should return 0

>> @@ -173,5 +181,19 @@ extern bool amd_virt_spec_ctrl;
>>   bool amd_setup_legacy_ssbd(void);
>>   void amd_set_legacy_ssbd(bool enable);
>>   void amd_set_cpuid_user_dis(bool enable);
>> +#else
>> +static inline void amd_set_cpuid_user_dis(bool enable) {}
>> +static inline void amd_set_legacy_ssbd(bool enable) {}
>> +static inline bool amd_setup_legacy_ssbd(void)
>> +{
>> +    return false;
>> +}
> 
> Nit: Would be a little nicer if these were in the same order as their
> corresponding declarations. However, along the lines of one of my
> comments on the Intel counterpart patch ...
> 
>> +#define amd_acpi_c1e_quirk (false)
>> +#define amd_virt_spec_ctrl (false)
>> +#define amd_legacy_ssbd (false)
>> +
>> +static inline void amd_check_disable_c1e(unsigned int port, u8 value) {}
>> +#endif
> 
> ... question overall is how many of these stubs are really required,
> once clearly AMD-only code is properly taken care of (perhaps not just
> in spec_ctrl.c).
> 

most of these functions-stubs can go away, though it'll require more 
CONFIG_AMD checks at call sites, and more patches probably.

   -Sergiy

