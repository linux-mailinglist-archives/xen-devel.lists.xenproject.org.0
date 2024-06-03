Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C691A8D7ED3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2024 11:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.734781.1140850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE45g-0001Uu-NH; Mon, 03 Jun 2024 09:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 734781.1140850; Mon, 03 Jun 2024 09:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sE45g-0001T2-Jv; Mon, 03 Jun 2024 09:34:56 +0000
Received: by outflank-mailman (input) for mailman id 734781;
 Mon, 03 Jun 2024 09:34:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mvE+=NF=epam.com=prvs=288473a65a=sergiy_kibrik@srs-se1.protection.inumbo.net>)
 id 1sE45f-0001Sp-Ea
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2024 09:34:55 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81e6ae09-218c-11ef-b4bb-af5377834399;
 Mon, 03 Jun 2024 11:34:44 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4537hIj6011139;
 Mon, 3 Jun 2024 09:34:33 GMT
Received: from eur03-am7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2233.outbound.protection.outlook.com [104.47.51.233])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3yfvxwutcx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jun 2024 09:34:33 +0000 (GMT)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by DU0PR03MB9866.eurprd03.prod.outlook.com (2603:10a6:10:408::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.7; Mon, 3 Jun
 2024 09:34:30 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%6]) with mapi id 15.20.7611.013; Mon, 3 Jun 2024
 09:34:30 +0000
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
X-Inumbo-ID: 81e6ae09-218c-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcKHikcGCiDKXgMF0bQhXpfmsMfh6OXgkgFczSQWsYsWcBx1Of+xByKhGXU9/K+aVdMkuPPZWamvGcKuB3C0irCEPiEJYQ9EFqxUpCeZzu2903i3+rVMVRMCa4OjtQX6dU6hxmBBUZ5v/OXwXVeEEsPrR1jtYHsYb6ay/SbRmE7yrjhWcXDvZbWk/WnAv2YcGIZxEuFct35VQBfCeS14Rl4SE6x27P0n3N+GfjOwDQYAja9PjyT8vSi9gaYY5EBJwidI1pd8z/9DlyJwQEOH0oQbntvwhEX2uetdCuJKB6XbMnTEsrxS+94DWRUOlB8iP4gw4vDdkrXQApHWvUdElw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsD35ko3OK5ISRiqI5BC8VgYyyqAyo0tO2nCpLwDCqc=;
 b=btpwjIpD2NeQCnABoVXPPUMC34+Lxl5PonzcytXkrVruJonU4JQK0yi/6ebN3sINqwFnX549miLIKZvc3ACgcFsLAphaFgG4LxoB07O815sFEX4ef+DtUwHr7t6GYy/FxD8rmC7vB9CFPp/XmxtsE59Uxg9G7X79BINlO0h7c/VS2MJq89qONDqlQTnhl9b8DuLvdMlpq5nXOG3euPoZvEX2H9CGy9V4SzjLp0OCCOli96jkk+PhR7x/0uN2VeICOWyGBN6SwF2frrOOqm/WTrF/69fpmsaW05VhtuV53hRt+Qo0+uG/8uyVV42OmnbaQCtuFXBTROXv4djN/QhCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsD35ko3OK5ISRiqI5BC8VgYyyqAyo0tO2nCpLwDCqc=;
 b=faClFRzpb3orsStjA8MLQ5mZNLf1aQxgaY4uHUwKD+hWdqNGwwa/tiAqcFN3SQmDb+bksinffUwcIUZDesBQRITvkVdljZjU9P71sl5UhAzdRyMKRIYTQHNwBs1KnpU8pjvwC/Zb5cxewzJRV25+Hl6uRkkF9cOFy0F2hJpTz0r7qlW9JYhuLQSG8cfAoKc2EOshKiIWsRtr8mxEU25dZ4aQspHXBHBUG95Fto4V8DRSe1R4NCKmWG430kthsn83wLu3CJkdtD25yxbjWTcFEytPyLD5Sm5pFcBtcJCbqUJvL/y+pedFGrgRDK82RZV3LVQZrZGDp+eoy4D1r6iQZw==
Message-ID: <ce7a5b2d-ed76-46c0-a86f-67a5aa4aa485@epam.com>
Date: Mon, 3 Jun 2024 12:34:26 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 14/15] iommu/vt-d: guard vmx_pi_hooks_* calls with
 cpu_has_vmx
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
        xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <73072e5b2ec40ad28d4bcfb9bb0870f3838bb726.1715761386.git.Sergiy_Kibrik@epam.com>
 <c43a554e-4b21-4a3b-92f4-60633f61f67e@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <c43a554e-4b21-4a3b-92f4-60633f61f67e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0028.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::23) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|DU0PR03MB9866:EE_
X-MS-Office365-Filtering-Correlation-Id: baa4a87a-eeed-404b-ca92-08dc83b05e3c
X-LD-Processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N3NqWHJvNHlwdTJpaS8veFVlVDRMM2RIY1V5Y2V2RTlubmFFdTg4RGZOc0gv?=
 =?utf-8?B?aW5tU1gxcXUwUmZmQmhldEtBRjluL2FiM2RHMnp4Uk0xNk55UGZWVkRxeWtp?=
 =?utf-8?B?TExmaDBlTlJTbEYyOEJISG56MHpvc290RGJEZEE3NnB1V0FHaUpHQ1BvVmc2?=
 =?utf-8?B?bXV0NUx5QnV2NTluSUVqNHpPWXh5U3Z0MkkydElUZklaTlczRmRqVFIyTlEy?=
 =?utf-8?B?SHZ5MjZ0UThqV0NJVmxrMHAvUGNma05jWXovbDI1bkVIdG1sWEs0T1o1SjlM?=
 =?utf-8?B?dFRxZjFvT3hhTmFDdHZnNnA1V1pQSjNaYmJxbXJxdzFXdG9iMTQ3Snc3UTJp?=
 =?utf-8?B?YkcxMitvM3FQYTRicy9WT3RRTFVOdFdGQ3VKWEpIYTN1VUdHU1IwSjgrcVVt?=
 =?utf-8?B?VGJrS3ZCeGovV0hCaXBJYXNOYkZPd2cvWEpUNEpJMFF0STRnbzNHNmpTTmt5?=
 =?utf-8?B?alVsUlhDQTRLdGo4b05ZakdqUFdKd2ZTWmJva3oxb3czS3NKbjJuK3FtVkU4?=
 =?utf-8?B?VEdDTXgrS3VqWmlzU3ZLK0lDR2VDbk1wVnBsVmc0ajFoc1VKSlJYdnNKUEdT?=
 =?utf-8?B?eXJaWXNScUlXNElZd0NXNkZwb2h6MTh5YVVKMjZnTHNUNXpmUDdVdU10TEJr?=
 =?utf-8?B?SGtMSnBEeTM5NFZFRDhXOWl3ZUJRVHAwU2ZrL05EK2VIdzE3YVFKZE9NR0FY?=
 =?utf-8?B?d3R2MGxhN3hyclM5bUkvczlGS0xZWUJoS1NPS3NRZ04yYmFrQXNFYjFEM01n?=
 =?utf-8?B?REVXYW9tekFicFdpaUs5dHYySlJJRGgzRXBSN3Q3TGpzWjdSODJkQmNHNER1?=
 =?utf-8?B?U0pWendJU042WHVsdnRDVE1sczkreEI5SGlyTEo0a0xKcHFrTXVPSGQ2MS9t?=
 =?utf-8?B?OGgvNlhhcUZvaGpQVnNuZHRyTGJRaXdlTE5DQ0tLTGptL1pzcUJ5V3RIRDRr?=
 =?utf-8?B?ZmZabldlSk1ka2lpOFJNVDZ6SndZOEJqMElKODM0eDI2bU95RzZXbTZ2YU5K?=
 =?utf-8?B?TmZ6eXZzbkc4TVVPampCL1o2bmhZKzhiaWZoR0dXM3VrRi9NbVl1L1BCUlNh?=
 =?utf-8?B?Zk0wUGNERHJucGhzY0FkMFlabTlMWGE1WVBKNG53emdvdGNLYVNWTnpjbU5R?=
 =?utf-8?B?dnFFZnhDMmJWdUFscmZXZ1ViSUJJVlMxVk1tL3Njd29LSHdXZ3JmMUhPUHBi?=
 =?utf-8?B?Rlp3TzZkT0dwZml0eXIrdUFtY2JEUzNSQ3cwMmdUc1pJWU5sbU9XU2UwN2hi?=
 =?utf-8?B?YjVkQnVyN0ZHbWEwVGg5cGNyWndjWjYvRm96YUd1V1VSeHR2MXBTTjlaNmRM?=
 =?utf-8?B?QmFWNXFZQW80NWFuTEVYSENKMHdPbGpCVktzVmp5dW40VXpja0VSa25GWEpq?=
 =?utf-8?B?MWhFSFNkYzVaQiszS2lNMmdZaVJjUkRPMGpRZGdWcXVERDZOT09RZVk3L3Zn?=
 =?utf-8?B?d01VSmo3S0hONU8wQzhXekVuM0UwaituZWExUi9HOTFsUnViTHE1UDlxdktP?=
 =?utf-8?B?V3NrTVFZYkZab0tLY0YzQndlRi9ISzFhdVpwVTNLM0xISTNVdzhFdnZaSHc5?=
 =?utf-8?B?Z0Ztd2s2QS9ZOU43Z3BYdnRwOGlqdEplTW9BVWp4Rk9Rd1VreGpTMjZ5UDlT?=
 =?utf-8?B?M2o3Z2dDMzFSSm9lR1lPUFVIQURjWDVSS1VZd3pMcEVaemtoc1VmRkovSDAv?=
 =?utf-8?B?eFJDUlJVWWwyZHpUVXdKUzloMzd1djI1UE1VMHRUY2w3djdFZVVDS0V3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dHpiK2xJOWp4aHFFYnFCVk1jd1NZM1FVRnUyYzZJYk9SVzUxeUZkbzVXSnM0?=
 =?utf-8?B?RHY1aHNpUmlrQVBjd1AvQ0NZd1kycXBhWVdqRS9zQnhRYU5rSVFmeXhUbEk4?=
 =?utf-8?B?dUtCOXdOWFYyL2dYNlhtRWRTaW5xcmdSOEx5ZGZJWGRDTG93bWcwQVNIdmZx?=
 =?utf-8?B?czhCdVpWRXpEb0lmYlMrRWNOMzJ4Qlk4ZytvcE9jZ1NWZG5IVWNlZXhxZUdz?=
 =?utf-8?B?MEVoZ0VWdDJrb1pBYU9Qc3JGSnhmYUxraWRqQ0RFUjNRK0RLd3RRdVdyQkV3?=
 =?utf-8?B?QVpSc2ROUG9qRWpZa0VDZDluelV5OVVBRHhqc3B4ZW5ZUmVGL1RUZ1FheWFy?=
 =?utf-8?B?YzhlNFQvWHUvYU1teTArL0RXTmVad205M0w0bVhMbUNWZlBPVUZhTFQ2TmFK?=
 =?utf-8?B?NTRFVHN2SnBObE1tWlEvcEFsa1FWZnBzVXB2YzE0cm5sSEMvUWtYOGxoSFA3?=
 =?utf-8?B?UzRUbFlMa2tGOHpDRWhqL0FDRnhOSkU0ZmJQendzK3hYb1RpN3U3UmhzU2hs?=
 =?utf-8?B?eFZ1cGdHMHRmVlh3NEw5YS9ML0ZLbmVsRlBvUTY4TjJNWEIvcGFKRTd6TXNX?=
 =?utf-8?B?UDlyeTJsU2xNZlZyb0hjTWJoMHVXWFRPQmdUWHhTajNNQU1ObloyZUtkVjdK?=
 =?utf-8?B?M0Z6VmtoTjk0eEczWnJLVSt3R3hIcjF0bnFSaUxDT3ROTjE2MGZWZU1qcTlh?=
 =?utf-8?B?OHdEV0V1VlpRR0R3b1JPdjNsQ1AyMERxb0tpd3hrdVpEa2l4bGl0KzJUZm5H?=
 =?utf-8?B?OWZOaUlrZ2t0OC9aajhsc2RmcFJuY0lTYzFjL3RZdFN0S3pURVBLbjJidDRj?=
 =?utf-8?B?R21pVWdSRXdTZDI0OU9tZU9nWVFxK2lmVUdsOHZqd0NqNmdMT3hIdmFPZ1ls?=
 =?utf-8?B?SDhVSHRKOURZNEFhU1M0MW1Hd0piOXluSUxRNG5vMWJ4a3hXTFdUN3FRbmJL?=
 =?utf-8?B?UHd3WWxDc09OMnBURzFTMXk1N2R5RzVzcmNrbXZuTm4yZG14bEZ6amJBQTRx?=
 =?utf-8?B?KzQ5Q1hRZm9UTFVpSWxPZ2JvOEQ1SGNWRXRBL1dyUytxQmxqWTZxME9jVkxO?=
 =?utf-8?B?Nk5jVzZ2TmVESFc1NXhtUUNad2p2TVJDM1hPb1ROWUkrc29NYThvcHh1c0RN?=
 =?utf-8?B?OXh1S0hHOFZFTWFRWVY2R080aXJtcHJtMlQzcEoyQlViYUR3bCtlOWluRHoy?=
 =?utf-8?B?eXBtdkd3RXREbUtEa1pWRjEvL1pyeHQwVjB4TXpPNzlSNXAvdkdKb3B3THZi?=
 =?utf-8?B?djYzd2s4ekdtU2JMUzVxZHZJbG9wUFVYdXU5Ym9OalBkaGZHQjFzdUE4UWtv?=
 =?utf-8?B?amNvWlFpMTl3dFpVU2VvdjZlNFFjOWhMeWFiSmNUN1JpcXBPdE9zcGxEWDhV?=
 =?utf-8?B?Um1SSHpXS0NmdGM4aEZ0Tnc5L3ZPR0J4S2VCN0Mybk45RjQrNUFBdXQydFhs?=
 =?utf-8?B?TUp1VmtkREJpalB4S1prdG5YOWg0eC93Vld1dzM3MDhueUQvVjZQTUFZNlRh?=
 =?utf-8?B?aVFiRS9CeTQ3eVFSS2EwMWMzUytCR01mcWhKLzVXNEFJRGxBSk9ZMWoyM1pY?=
 =?utf-8?B?azZQRkwweW1tK0dZOWE4VGxTVGtPOFc5SitwVU9XVVd1a1ErU2ZrSWdBUVVW?=
 =?utf-8?B?SzZ5cjlOYTlBcjRtcmh5cHdZZnF4WlJhaTBwY2FHMVFjbGtZS0Y1TjZEekNa?=
 =?utf-8?B?dGQ2ZXU0VDJhQ1VSZkdoMHZVQnkvUU5UYS82b2NjcHFBWSszOUh3djRMWEF6?=
 =?utf-8?B?Y1Rub3lOMG1veEw5cGFZOHYyb3M4a0F5TzlIYUZoeWJUbVl5Yy9yVENFRnY5?=
 =?utf-8?B?ekpDbkxlbEdGMFVaL0lPOHVsYTB3bzlaUHFQK1Axd0N2NHM1TTZiNmt4STR4?=
 =?utf-8?B?ZXhUSys1eTJEaTJqdVA2dWMwSkM5Vk9rT3lySVI3UGREVjF6aktBVEErR0RV?=
 =?utf-8?B?NzFXREdValljelNsd0UvbGM2M1RiN3ZFVWI2ZVp1TEF4QTkrQnlFS1hzUkg0?=
 =?utf-8?B?cXVEM01QNXRNRzEwdDAvckY4QW50WUhROFdGYVNXSmtmb0xUMG5NT1pObWNk?=
 =?utf-8?B?T2JSckdxWE9WUkZCYm9vRlBGVGkzQ0t2eVpNV3dEZG9FKzBtVkNZQUNhT2lI?=
 =?utf-8?Q?jjqlEm2ghX0N3q3bYueqoezeY?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baa4a87a-eeed-404b-ca92-08dc83b05e3c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 09:34:30.0636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3UrDFZS9pxnV6JTF8tnoNR3l1MsS4Wivfl54WWFMsvixV2Gtf+GhVbKHjRdupF+fkQ5g7ELy7kBpZAmi26zoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9866
X-Proofpoint-GUID: sdrKbk4a8b6xd9fh_i4OKGD4Vckjbr_W
X-Proofpoint-ORIG-GUID: sdrKbk4a8b6xd9fh_i4OKGD4Vckjbr_W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxlogscore=882 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406030079

16.05.24 15:15, Jan Beulich:
> On 15.05.2024 11:26, Sergiy Kibrik wrote:
>> VMX posted interrupts support can now be excluded from x86 build along with
>> VMX code itself, but still we may want to keep the possibility to use
>> VT-d IOMMU driver in non-HVM setups.
>> So we guard vmx_pi_hooks_{assign/deassign} with some checks for such a case.
> 
> But both function already have a stub each. Isn't is merely a matter of
> changing when those stubs come into play?
> 

indeed, we've got stubs already provided. Then this becomes a nice one 
line change.

   -Sergiy

