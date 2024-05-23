Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D08CD09A
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 12:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728327.1133206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA5wd-0007p1-1B; Thu, 23 May 2024 10:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728327.1133206; Thu, 23 May 2024 10:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA5wc-0007n3-Uh; Thu, 23 May 2024 10:45:10 +0000
Received: by outflank-mailman (input) for mailman id 728327;
 Thu, 23 May 2024 10:45:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oh0r=M2=epam.com=prvs=18734d070d=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sA5wa-0007mx-TM
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 10:45:08 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83647f53-18f1-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 12:45:05 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N4j2vf024358;
 Thu, 23 May 2024 10:44:55 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3y9y23992h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 May 2024 10:44:55 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by PR3PR03MB6586.eurprd03.prod.outlook.com (2603:10a6:102:77::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 10:44:50 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7611.013; Thu, 23 May 2024
 10:44:50 +0000
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
X-Inumbo-ID: 83647f53-18f1-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CiZUOwIoGOYrn6LrOXYgSf14BnG3YEdMFGVqWZmJdPDxQNYsf+H4t1LGq45cwcn73zxh+A7sAcCiqbEmj2NIs5iB+P6nvVsuucn6SRVeE6MKkb0x9TIRPCxPdhJFrKb6vXNnKzxO9TBT1SL7EypqtOonRI19Ys0n05a7FObPcIiJcp/BnFZqBCAVb69ys4gs/Co8vQKQ5J09Kbrmny4IQ3SvxmdUyUq9AFjngLgbeZe/ZgAQVtk17qxM1JKZdOV6fStVdRbhdfljjW46qOM78gD9rCIqr9X65lhu1A5THlDgepZirY+Wn4obg4iMKbr4QAqO1TaPZVFd2mZVksRW5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpx9T7B2+zG/EYxXkneyTPeQ0oLcp7fIPBnmPbxjrsc=;
 b=GnwhHQDfi8EgF1D+B/DFR4VbUlbjEk9TI8R6xDsv+0EhvZnTnj7IJB9s4cn6Na/+OUQLvVlkyiI8p7hkW0w3c0Lyqezk1iD8NyuO28LK5Yjzp/S17Hp95Zo3B+umr34Wo+e6La6aXON9WL2Mjjevu/Lz7GUBMiqwUffdDY5rLtv2hJQafibmT1XIoUfzBnBgqO+DEV97KWXxqkykVxDPnbVkyJLluc11XqDxbeFVPwJk8x3q2H2mGxaaFgyEF5AJho4XVnzhCT74D2jUeivGHC07NVCS6OD783R3079JjtbKOEJ9rGOc/rWIBvk0FSv4h7KHMlrdJzAIssxK4YZFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpx9T7B2+zG/EYxXkneyTPeQ0oLcp7fIPBnmPbxjrsc=;
 b=RJ5LI1s7Hi/FmP7nzx1l8suIYWgBroOTKkVJhYQpnGuzBcQAPr7sn7+O4T/bImfj5mOeRtDT3r3v8nWkz6sfxucBBMuw60HsI65h3BpmWYMB787VsBcNe4uVpRB7zKHCRIGg/6Ayb8zuAL2dkHsUOr6lc/TewF+3HJC1pow4LCQFZrBgtn1iK65/4ebf3JDt7cgYmBYC4aWxJh6x6kHckZg5ixDxbYv6pt1Jr/tszwdvByjCjCeXh6u+urCS9Mkm/51/KFE7XR6Wa8GG34rpLB4KMfveWqJPTyPP5T4d2n0l2Stq38Crit8fSGlHe8n57wpF0U+n/7CvMjNCrU3bnw==
Message-ID: <71559cd3-c558-4f91-9c6c-227f502645d7@epam.com>
Date: Thu, 23 May 2024 13:44:48 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 06/15] x86/p2m: guard altp2m code with
 CONFIG_ALTP2M option
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <7a6980b1c67dedb306985f73afb23db359771e8f.1715761386.git.Sergiy_Kibrik@epam.com>
 <29604726-8768-4b33-a8ef-eba6ad112d44@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <29604726-8768-4b33-a8ef-eba6ad112d44@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::21) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|PR3PR03MB6586:EE_
X-MS-Office365-Filtering-Correlation-Id: 0243c2d3-d0f9-4e5d-f055-08dc7b155f63
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V1NFZndEVE0wQVEwOVdFOEdHUE12czBUeHk0VU8xRkpBR0pZT0ZsalJyUmd1?=
 =?utf-8?B?N0hZMjRhR3RUQU5TNkVLWHEvdmRYamRYL1QrRFFQRVd5UzhIbUhDV0hmT2o3?=
 =?utf-8?B?elJRQkErK2FsU29HSk9ZaXFSWGtxTzVNQnlHQWJrQkVLaE03M3QzK1dvcGd1?=
 =?utf-8?B?WnBvZllRSkorWDhiaVJjZG96WUErRjdzd1oyb3YwYUp1VHlBSEtIYmlBY3RX?=
 =?utf-8?B?cTV5TmNSZGwyelN4OWZNbS9sZHE4czZrVTU4RDgzVVhkSnVoYkRQZjh5SkpY?=
 =?utf-8?B?aFM5VmUyZjFqV2RZM3FaREJmL0pLWGc1WE81TjJLbCtWNmpDWWxoUWxXclUw?=
 =?utf-8?B?aXFZL0xXdEJpcExad1ZJcnFvb0tHdFhCalpLUjg4dWhTVkRoc2lpWEVRdmJq?=
 =?utf-8?B?SzN3aTA4bjBDUGpwRGhTN0Uwb3RJd1Uzby9HU2RkSHBpMXdyTW5pTTNPZmpt?=
 =?utf-8?B?Y3puNkFiTmZJVmQ3cW5XMzk3bVdrSDgyVVJBa1hXdTVXN2pRNXFDR3pyVkpV?=
 =?utf-8?B?eXNtczJqbkNuaVVpeE9pVVE1RnVVa3dTNWtvQzkvblhCTUQ0M1o2dzNlQWZF?=
 =?utf-8?B?QStwaE1iT1FiWWNRd0dPYUdvOFhzcnZaSDBDOWQrM2lOZVdxV0JWQi9lckUx?=
 =?utf-8?B?K0VKRHJ4SURxMDJnNmdJaG9VMEEydzRJSG9wODgzSlRnSUlTVWZZWFJDVnNC?=
 =?utf-8?B?UXh4dmg1Q3lPYXFYTWFDTUdZTjFONnQrbUc1L3EzZDl4d3BXVHgyVmh2aHgx?=
 =?utf-8?B?Mkpad2dEaW94VE9IUlJvbEx5TUlMMzVhQmQ5dlNQWEFrcmRwMWUvKzYyNzFv?=
 =?utf-8?B?STMwbGp0K3IzNTR4bTdMTUZZakJ2bG1wcCs3SEFTV3lJZ1ZpNmc4SzBwTlRn?=
 =?utf-8?B?dm1aSnBpZXVZY05YcG1KUGszbVdCZ1NZM2l3UHl3WUZNUDBzZnErTW1IRFVw?=
 =?utf-8?B?cTY2WU11K21NNHZGQ1JTb29BSnJrN3d2aU03OUlGSElKeHlSc25GalhlWHhj?=
 =?utf-8?B?cm9veVlTV0pKQURpcGxGc2hORkNpaDYvVllRNHU2NTQ5dlg2R0VvUmloeExs?=
 =?utf-8?B?MUNYWjJqNEJTbmZDa3RueWNobUZnb2piZjNqMjFGVVdvaVFKUE04ZWxiK2Rz?=
 =?utf-8?B?UjlOL2FvL09CYlVZeGVUTGx3NEZVYU5jbFhDanJvdnNYcWduaEpSWlFxeXJ6?=
 =?utf-8?B?QWg3RHB2MkdNcmk1bGszOXpGb0p2RUg1YjhHUnVOQVN4OHJpNXQycEZtVko2?=
 =?utf-8?B?WURmaS96WG1kWEFEc1djZm5EbWw3djRIcmFyQ1EwNDNhbmM0RHRjbmRGUlBE?=
 =?utf-8?B?UTM3ZGtJWEhxWGV2NlV4bVhDWkVOS0NxeDdsRnZOVjJ2a3lrdWdKanNTVVRU?=
 =?utf-8?B?bGhuMXdiNTBJMGJUNm5HeHlKdkVqcHlYNW5hbHJ2QXk0NnFoUFJVSUppU256?=
 =?utf-8?B?VVNpcDFlTVBVTVQxaTA0UVpIblA2ZlFGeE1hY3p0ck9wNXI1MmxqYzJOR1ZP?=
 =?utf-8?B?WmxJRnc2WDFoUG40OFJ4Z2l4VVM1ejJXWERnMTJDaGxsRmFaYUtXOHNsZUlT?=
 =?utf-8?B?V3pSOGxndUYybDM0MktGSWhKNmNqcHE1OGlHTDkzQXJrMTIvR1dHSGhudXN6?=
 =?utf-8?B?MjY5dmpjQ1pBdVdncWlGeWdUOXRvSEhGSC9FbWJmQUNGN0pWWWplc29FTnhK?=
 =?utf-8?B?R3dLL0VIeXJzTHRQNVZRdXBFOVZKeVpkNldSRGhwVUMwRys0OTNqb2hRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QWpQWmgxRUhMbWl1NHl3RmxpRDMySDgvUll1Z0l1dURsVUZQcWwrUitScHp2?=
 =?utf-8?B?SUtPekVhOXh2QzRqQ0lNTnNnK2M0N2ZVR3R3d0t1bTdTT3F3NFpwRWFHenpK?=
 =?utf-8?B?dTJ2QXZ6S0cxYkZHcXBrRkZ5aUpFemtHcHdyR1lxVFZsSGxtZzNmbGdiQnhV?=
 =?utf-8?B?ejhBVDg2cGhiUVEwQWpGN3F0S2ZEa2JjaCt5dlp1MjRMc2JEL0c4TGFzQi9k?=
 =?utf-8?B?TGpseVQ3b1d1NHNhbEdzNTMrTFV0TXBCSzVWQTdkTkZvV01XK3hST2IzNVNr?=
 =?utf-8?B?M3QvQ0N2Mk12eVF1S0Z4Z0RqcXFpVy9mOHBlR1AzV1N3VTZRWHYyTE81L2Zs?=
 =?utf-8?B?K2tickwxbUZJakVEUTVRNzBTUEVYZEl0OVJxZTZqTXlWU0doSmYyOU10ME1z?=
 =?utf-8?B?YzJmMjUvUjZSbFlDUkFVVGpKaEZhaGc0QXhiRGtwVzFkSnZwb1VrY1hscWp2?=
 =?utf-8?B?dVFXSGlxT2d4UFhTOTJ3Yk5RaXNaZHdtV1hpVFk3dW5yck1uRWVpU0RWYzBG?=
 =?utf-8?B?RkxYS0pGSEJuZ1Eza1hKaDRQK3VEbnBYTFZFV0JUbG5GaU9mTitrTEJnTG5F?=
 =?utf-8?B?M2tXWCtobXpNMFJDU2JLY2YrYW81WGQrbWk3c2psb3JkYnp5cmQ4OWJ0eXZp?=
 =?utf-8?B?L3hVRjJ1aHBFYTJaTEhSeEFBWnpUb2lCYVd5NHNyZ1ZNeUZCMnF1OHZTMGM5?=
 =?utf-8?B?Q1Y4a3hOYytPTkRRbG5PbU4zMHl6eURKeWdWSXdEYllzek4wWld6UFNLR1JG?=
 =?utf-8?B?eHF1R0s3Y2g1d00vLysvKzNsRWRyc1E5dGhETHRpSEhCb1Z2bHA1bTc2L1pv?=
 =?utf-8?B?VUxLQjJpdkI1U3NvaGhmS3laZkVDdFBvL1ZvWkF5MzhYdGNMZnQxVm5oOVBS?=
 =?utf-8?B?eFg4Y2ZFcjFrV3pjMkgzd29jdTdYUUR3K2FOTCtRRCtaWm5qM3pEd0QwVzNt?=
 =?utf-8?B?SUE1dGZHenE4Sit2T0t3M2p0cElkMS92RHIvU3lQajlSOEFyKy91UXFkU21I?=
 =?utf-8?B?UVZiTXQ1UlczRDVKMGVVZ25PaXVBOURLMzVWdkUvMzhOM2l2aGQ4YUZSQTlR?=
 =?utf-8?B?VVpCL0VWb2FJUmtLeXRPNS9NTXQwNkRKUm9pZTRtTTRURHFId3IrcnBhUUYy?=
 =?utf-8?B?RFFSS1prNTJkb0p6d0tYbCt4T1NLaGV2TXAySy9BRExuS0twSWNuMzBIK05p?=
 =?utf-8?B?L2hXWWR6Vm5welNKZWxwNDFXei81RDNQTEZ4QWJPL2hWWGdvZWxlb2dDbytM?=
 =?utf-8?B?am1QYzVWWnFKUmJlc3ByMnRUV21mVzR5djNxU1NsMkFJS0UrcFhVSFdwQmVp?=
 =?utf-8?B?bVpxd011OExNUzBabnNUNzFieHlDdUJnUllubnVLWHhqb05yVENtQTVqTFNF?=
 =?utf-8?B?L3pHR1pSMFNGOGQ5SUEyOUlLOGZMNHcrell5aDlUaXNJOUNhWWVmT3ptNHBF?=
 =?utf-8?B?MnZuVUlFT2JDVW1NeWRkVWpEdmQ1ZU5OcnVwMzhjb2NucEVhMWpxSEhRcEZl?=
 =?utf-8?B?aFFPRjNtUERxYzlpRDdWRVA2T0VZcUIvRGRWWjljcXJyMTBNS2t3TkxIL0Fn?=
 =?utf-8?B?dmVranhWenQveWxlNVl5WTJlek1EZFdTQzd4bFB0bkd6ZGJCN3MrUWs4azcw?=
 =?utf-8?B?MjdZdmRSN01jREdOVHMxVllSOVBOa1VEbm9FN0R4a3BreHRlVVhNNkJPdk50?=
 =?utf-8?B?V3ZIWmlDYXBPYXlGRlpWR0hvbXJPc2psZVVlcGZOVHlzYVFVcUJaTzlsTzYz?=
 =?utf-8?B?cEZiVHZKV0dYYmN1MWRCOG9pVTZDbENBcWs3MmV0Yzh0ZTVuUkZPaWR4VEx5?=
 =?utf-8?B?MGIyTS80NlRJQmtmZVVWZ0YvZnQrMVJUQWlRbFJhUFhsRnRIOG1iRTZmelY4?=
 =?utf-8?B?Q201MVFRNml0S25KTVUwdWlMWkhmVCsxZ0t3WHJwWkk0U3VVWGtxanpHNXd4?=
 =?utf-8?B?NzRXZW5kRmwvZWhoY2Z2MWVmS0V6aEIzRnN5MnpaK2FHS0t4MnBLaGhMRUxk?=
 =?utf-8?B?QTdSeEZPYkJqdEQvMjc5UlhDcHpSTHRESDd5dlZrT0g2SDdQMzBPUTV6OEY5?=
 =?utf-8?B?bGxMNlhGRndTaFlmektROHVpOE5xNzVxOEhpTlVEQmkzcVdPUDROdEtLdVYz?=
 =?utf-8?B?WmdYRUsrSzd6Q2Y2bEJFeG9GaDRFRXNnZ1BHemp6cndyb0gwWk5CSHZMbXh5?=
 =?utf-8?B?enc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0243c2d3-d0f9-4e5d-f055-08dc7b155f63
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 10:44:50.6032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bOIKGDpzc+VzjAaklzy5i2zE4YCyfFkL0e5/fhgwEmJ0vn77O5nvvulJ6h7Y1hf9bMGlKpTVb8Jzft+rkcv38A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6586
X-Proofpoint-ORIG-GUID: ZXXXPLTu2_ow3eO4jBR6T21HEsD97b6F
X-Proofpoint-GUID: ZXXXPLTu2_ow3eO4jBR6T21HEsD97b6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_05,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 spamscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230072

16.05.24 14:01, Jan Beulich:
> On 15.05.2024 11:10, Sergiy Kibrik wrote:
>> @@ -38,7 +38,10 @@ static inline bool altp2m_active(const struct domain *d)
>>   }
>>   
>>   /* Only declaration is needed. DCE will optimise it out when linking. */
>> +void altp2m_vcpu_initialise(struct vcpu *v);
>> +void altp2m_vcpu_destroy(struct vcpu *v);
>>   uint16_t altp2m_vcpu_idx(const struct vcpu *v);
>> +int altp2m_vcpu_enable_ve(struct vcpu *v, gfn_t gfn);
>>   void altp2m_vcpu_disable_ve(struct vcpu *v);
> 
> These additions look unrelated, as long as the description says nothing in
> this regard.

agree, I'll update description on why these declarations are added

> 
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -670,7 +670,7 @@ static inline bool hvm_hap_supported(void)
>>   /* returns true if hardware supports alternate p2m's */
>>   static inline bool hvm_altp2m_supported(void)
>>   {
>> -    return hvm_funcs.caps.altp2m;
>> +    return IS_ENABLED(CONFIG_ALTP2M) && hvm_funcs.caps.altp2m;
> 
> Which in turn raises the question whether the altp2m struct field shouldn't
> become conditional upon CONFIG_ALTP2M too (or rather: instead, as the change
> here then would need to be done differently). Yet maybe that would entail
> further changes elsewhere, so may well better be left for later.
> 

  but hvm_funcs.caps.altp2m is only a capability bit -- is it worth to 
become conditional?

>> --- a/xen/arch/x86/mm/Makefile
>> +++ b/xen/arch/x86/mm/Makefile
>> @@ -1,7 +1,7 @@
>>   obj-y += shadow/
>>   obj-$(CONFIG_HVM) += hap/
>>   
>> -obj-$(CONFIG_HVM) += altp2m.o
>> +obj-$(CONFIG_ALTP2M) += altp2m.o
> 
> This change I think wants to move to patch 5.
> 

If this moves to patch 5 then HVM=y && ALTP2M=n configuration 
combination will break the build in between patch 5 and 6, so I've 
decided to put it together with fixes of these build failures in patch 6.
Maybe I can merge patch 5 & 6 together then ?

   -Sergiy

