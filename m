Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGYNKQHIdGnu9gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 14:24:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 066997DB40
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 14:24:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212836.1523747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjdbc-0000vM-8H; Sat, 24 Jan 2026 13:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212836.1523747; Sat, 24 Jan 2026 13:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjdbc-0000sP-1b; Sat, 24 Jan 2026 13:23:12 +0000
Received: by outflank-mailman (input) for mailman id 1212836;
 Sat, 24 Jan 2026 13:23:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BATA=75=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vjdba-0000sI-AA
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 13:23:10 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d252ddd5-f927-11f0-9ccf-f158ae23cfc8;
 Sat, 24 Jan 2026 14:23:07 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BLAPR03MB5555.namprd03.prod.outlook.com (2603:10b6:208:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Sat, 24 Jan
 2026 13:23:02 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9520.011; Sat, 24 Jan 2026
 13:23:01 +0000
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
X-Inumbo-ID: d252ddd5-f927-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTbVLqCUWToosBicsZZ9wSNiIgdJPPvvZMSo4dznudoy0hJk2OS7pXkNT8WdBNB8aUCiYY6hBQdsJdy64Pv+CJxh4O3HHPJcT6wKe5UbSeiBp5KinpEC2Z5P/OTSkoHiiTvNZPHdTiTvqA/o8QyZNeQvWiKPq+9msG05qHE+CJTy5H+AaahANtBgl/aCoo8k68ytp8vMlALh6xPUOj1BAH0PW8eW0Y8yn81WIhhT+3OVrww3+lxuToZyD9pp8YSj7/coyE+OSWDrldOUmLCeczyPMtCXFP4gEpbM6YDlouZFE+RZH/vRt1rgVkA6FBHW08bQy6wAhkZ+iupLhC2Abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HVLmgfdtdtGuw125hCDS5O64oIRU4lHyZZwaBUw0ag=;
 b=uPeMdpyDOwVc6zzLB/SR9jE0+T5/Y1KlGQv7T9LGfzIBfSnLJ5aj2kQkRch+dAg42MJMZcmK0+dTZFt6hRO0OTxw+N+0veuE/+4xxMDeMyM9FQzps5ZV5IyUeCb3ikDkLM9arrtO4mfGdNJHbovY4VtTZqFmMlXDWkk099e4YJ32ZMnvrZQ79S9E4A+aiaqa5vG+r6DAtHs/vRBDp7a+f0bl5cyBz5D29qeNNEhiHH8IQQfngFpe5yN1gimIzL6CT8lfs8e7qf1Un8IrvM7DUp5twrcjLhIxJgOUArRI47ZulrP3iDdhTTsJ0b7lKJeQTZPdwXSOGztNsqHyPapXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HVLmgfdtdtGuw125hCDS5O64oIRU4lHyZZwaBUw0ag=;
 b=RcGwGLZ8BWiJWMgkidevZ8reRbcR+UzwUabjm/7kOsUc7VqXycVvZ1/Qy+uCfCwdUleVBbJcpKvFq4PaLhzBQrpUJNcsthAXckuW6Cd4PdkSRgdVxKIPNU0m5YzMCLCyFZGtVsgZcIOXFTj0IVrlRYCdCqJ0u+RsIbSk1sNneqQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1a613a11-0c7f-47aa-a8d3-b090fff29a57@citrix.com>
Date: Sat, 24 Jan 2026 13:22:59 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, anthony.perard@vates.tech,
 jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v1 4/4] scripts/config: hook to automation build script
To: Stefano Stabellini <sstabellini@kernel.org>, dmukhin@xen.org
References: <20260116043458.730728-1-dmukhin@ford.com>
 <20260116043458.730728-5-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2601231631200.7192@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <alpine.DEB.2.22.394.2601231631200.7192@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0457.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BLAPR03MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d796125-a629-4d8e-8857-08de5b4bb303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkRRSU4waUU4YXRSVlB5dEtQSnJDZWtWZjNjUm11cmxrL0lIRjI2dXh3NHBH?=
 =?utf-8?B?ZTRadmtnQ1BsRnJzK05mV01pR0YrSWkzSE50b2VOUFQ4dE1BbjBiK2F6THVz?=
 =?utf-8?B?TGNaMlZIckVaanp1WkFvSGh4WUZHVDNIZkxjTzhhZ1NYMHFXOXM4SUpFcFRB?=
 =?utf-8?B?Z05KN1pOZ2dtU0F3TVlrR3VmRFRzV0NRVCt3L2NtKzNRdTRYd0pjQWxMNzVm?=
 =?utf-8?B?TjJ4a2R3azM4TTNVdzdXYXNEc0pvMGE3QW5neEdaQVJpTjc1VmdxM2NZb2o3?=
 =?utf-8?B?MXdDaU83RjVENjAvYndwN1hEL2NWS1BDQktIaHdPMnlVUDh2U0Q0WHBNOVIv?=
 =?utf-8?B?TzVYb3ppRnhZS3hhUEcxMG5VTDRSNmJGT2hBSWgyY1pIZk1udTFXT01Gcno0?=
 =?utf-8?B?UjZwVGFlVk5UVGtJRU03SUN2UkRGa2NJS2hzR3RPcXFnOGRwbXovb3Y5Q0NM?=
 =?utf-8?B?K2oyY204MFhjRDFoMklZNFYxT0xjdmdHdUNEclg3RXRpdjdxYm9Wb2xEcWcz?=
 =?utf-8?B?Y2xKTi9NaERjM05tdHcxMWxtd1BDTmVSbUl3aGtPa0J5Ym1rV1h0dTVzMXhp?=
 =?utf-8?B?OG9NZm9PQ21uTUdmU2k1M0NOWWJuNXRCMUJtTHhoY2RZU2t2b0tVUFJPbUI3?=
 =?utf-8?B?MXFIMDZMOWNWR0lsWDh6aXM4bkF1NGxZTk1rMDZxV3RRSmJMNWtVOE9IcFdY?=
 =?utf-8?B?QU4wbUQ4UXRqZTVFNDhGRFVYRVNxaFFySkRMRjc1QzF2UFBjQzdGRlVSNS9Y?=
 =?utf-8?B?UmtRTTViaERVWjFTMVRQWVJkVHlGY0NWVC9YSWNhOUNhY3ptRWdZR3pYcjFG?=
 =?utf-8?B?cTdxVnJ5TDNOMWZ2VTkwNzY3ZGM5QTEwK2M5T3FqVk1zV0NjREFGRXZOLzls?=
 =?utf-8?B?eWZ3T1BzaHV4eXpqNjJzSHc0TjBMNDRiWTN6WVMrVDVhTkxRdkhaRVhrTHZ4?=
 =?utf-8?B?cDVWTHhnb2dReDhNaE9GZU1aZEJzQmVZT2lKWnBVSzZxQVVUQlJVUE5YRFU0?=
 =?utf-8?B?Q04xelRvaFFQS0hXWm9HdkxUR0graU9DamQwcEhXUjZkdGdNUTlST0JLRFpo?=
 =?utf-8?B?TkpMTHQ1YVEreTBxREFNbGNaQ2Juc3plTWcyKzlRVjRQOTRCZ3gzbWpnSlV0?=
 =?utf-8?B?azZDM1lCWkZhRURkU3dmTjkyWTRYUlVBNllOc29yeWNOL0RwTy9QbTNwMEFr?=
 =?utf-8?B?UXVVVDd1dkcxZzdvemVTRHVCZVZmYVp4aFBIdDVqUW1pSkk2dkY2MjNjbCta?=
 =?utf-8?B?ZlZ3cXNOc2c4NHdxOXR5akx6ZDFObWZHVEZkWU9HQko4SndmMHpJN1psUXVF?=
 =?utf-8?B?Vnh0REdxSnJzZWlISFFyWGNqUGV6cVFGTjJFd3JTZ3M0YnBSaC9obGZYZTNy?=
 =?utf-8?B?Yjc0QysrOENoMjFDTzhqMHk2em5JYUpjamxZcnBlaTJoL1VYc3lCVVIxaFBa?=
 =?utf-8?B?M25YREU3TForRGVqbUsxVnBpcVJjOEdaUy9ZcXpQTUV5aTVTdSs2MkF4OU1W?=
 =?utf-8?B?UWtBaXFqNEVkakxpOU5oTWVVQlBqT3N5bHpwakdxRTJTV01IYWpMYVVIekc1?=
 =?utf-8?B?eG5EMFpKMkkxY1dWRlpHWHRMaFQydURlZWVyQWR6R3Vhei9WR1ZscXp4bTRk?=
 =?utf-8?B?eU9XWC8yZFl6TmVoSFpjTEV1d21RYmY4amZnc2F4UE9pUEJkL1BJNjJhVHZ0?=
 =?utf-8?B?cjJrTE9NcXhOaEs2RUkvUjRrMjdkbG1PYjBYR0hFYjh6aDRPcTFmdU02amxN?=
 =?utf-8?B?Y2ZwaXM2Tjh1MFVUZ0h4NEduRUZjK0hTbTNKN2xoMklsc2dXeXNWNnA2a2Zi?=
 =?utf-8?B?MjFzajYzNFc5Z3dMR1FZK25RMUZNc3NsVFFYZk9pSW5nUCs1c0hoekxGU0RI?=
 =?utf-8?B?ZEFGTmRONlZwT1VlWHQ0NFpCK0MwbFliQ3lvMUdVWGpOOFZJTEVoQno3dGZt?=
 =?utf-8?B?TnZnb21WY01ESFcza2ZNei9zS0lkelovV0k5SGtuejFUb0FTVGcrUVdNZGkz?=
 =?utf-8?B?MDNyWjRaeXhWTmVnVDFIUmNLS3BFcWs5cE9DMHBvTEJlVWowQThsTng3K0tB?=
 =?utf-8?B?cTlldG5XTFZkK3p4VmpVNThtSG16bTQyUG9LVytkMXIvN1BqQUxzSlFqOVA0?=
 =?utf-8?Q?ZwHQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWFDVGFkb0dFWTE2c1dCd0Myb1gvWkJsanEvRFU0UUMvQkNGeWI1c1Z6NUlP?=
 =?utf-8?B?RmJGNlZHY1VSeG9BYmZOVGhhY0h3NW13SUU0eEg4bzlJTGJKWkhSRlErMm82?=
 =?utf-8?B?aHVFVU5PSjZBVWo5aGVhMHRmcjF2ZUJHOGJkS0tNSEd2VnZZeGVySjRvZ1Nx?=
 =?utf-8?B?Slh3Y1k5ZERVam5heFNlRzg2TW1wMHp4blErcEN0dWpzQ3oxREE4TzBqTDBZ?=
 =?utf-8?B?dVpkaFRGSGZKUE84dzZCd0JjN3dRelRPOGZGU0w1QWtlSExTQVJUa21sM2J4?=
 =?utf-8?B?Yi9kRkZxSUtFZUU3M0NVSEMzTnBtZlNYYjE2KzcrSysyM1k5RDdDcEJEM3RP?=
 =?utf-8?B?cTNMcyt5U0czSWFaYjBPbEN5YWsrRmdVenpta24xOEs0QnV4dDVFRWY0ZSs0?=
 =?utf-8?B?SDU5NWVmUnFyc1phTG5RZDdNampvR21pbjFtejZzOWVRSkxhQUlmU0VRTitF?=
 =?utf-8?B?dXRjajY4ZGtLVTM1SG51SlRWeUhzdzFzTWpPMUdMc2k0UkhHQW1aK3ZURkU2?=
 =?utf-8?B?TjdrbWhZVyt3eU5hKzl0dWs5aGsvY1BKWVRXWGVHaG5ldWFqZW4wYnFzNlF5?=
 =?utf-8?B?ZTVEcGJPY0NaazV6M1hjbFo0L3ZVNVc4MUp0a2RJTVJ2ZUlUcU9UT3dXTm0v?=
 =?utf-8?B?RUUxeHpmbmsxMTQrcnE0OFY0Rml0RklYWkpBcmNxR1VnWWN3VzNCUE5UZE1I?=
 =?utf-8?B?V0QzNmtEQ0dWWkJUdGx0TEJVSDJQWjhudzRjNjg0Qk9yZHhnYTYvOXR0bDRW?=
 =?utf-8?B?c2dpeGozWnkxUVIrdVgySFpWTFZDTTF4TUEwSUU3ZEdwVG9jNTU4bHkxUE9Y?=
 =?utf-8?B?RzFvNDRKU1hIR1U2MysrZFc5bXJEZXZoRE5xUnNiQ05rNTV2bW8vOGVTdHdi?=
 =?utf-8?B?enJmbW4yaGk4THZpMXBmbFRNSmdnUEdYSlJTVnI3N3JJa2MzcG9iZUNQRjl6?=
 =?utf-8?B?cUpzaTV5RlptaXBpWm92VUgzZWlnVEFVQ3p0a2Y4YkNFMlUxTWt1dkU1eTR3?=
 =?utf-8?B?REVaQXI1bTJ1aTB4Zzh4aHlhK2JEZU5KSUdBU1hrVWRURXNTWlMrSXl0MjV3?=
 =?utf-8?B?dktDMk9ORU1IWEFoWkNXNVVUMGI2RWZnODg5cDZqSHVMS1hqbFFYQ2o2Tnpu?=
 =?utf-8?B?WWdrVEVIQy8rUXpBUC9aSURiOXhHemcrUjF2RHpMM0dZWUJTenpma0tSOVRP?=
 =?utf-8?B?VkZSdmZVUUpEcUFVMElPOGw2bmtlYlRmb0phS2lWZUtxRExBTkExdzZkeWo5?=
 =?utf-8?B?aGdMenZhK1dIa0UxR0FBLzU4Qk1GN0lmOWQ0VzVTc3R2dmh4dHBDMTZoT0Vw?=
 =?utf-8?B?Ylo2SjloWFVDcUNtdHlSS216ZVAveVBVbVRtb1NHK3lUNDc1ak5mWUpVT2Jy?=
 =?utf-8?B?L1E3QitlTWM5UGpuMzUrVWZ4VVZPSjNDeWZVOHNtbGxmNGN6THpDTGFDTU15?=
 =?utf-8?B?L3ZtZWNXWnFRZWRnN3h0MC8vZjFnanp1V2pCUlpVVzhwWmpEYWZhNElwTkxq?=
 =?utf-8?B?RnVobTd1eHV6M3BuQkkrVWdVWDl5ampzSGswWHh4YVI2azZRQmJKcFdUckFo?=
 =?utf-8?B?OVhNejQzQ1NJWjZkQ3FyRzdiZFhxWERIdE4yM3cxY2xKT0V3Uy9zM0loZDRJ?=
 =?utf-8?B?Q01Ba2JUM3FTaGU5TTY2azhxLzF4cmVyN0lOc01NbnFVVktZUW91TVMyU2xB?=
 =?utf-8?B?OGowUzJPN2pKb3pPbFpBbUp0UkQ3bWlBN1lHUGdDbmh0cVFlTDV1Rm5CSkNN?=
 =?utf-8?B?VlcwU3RLWEpBK2g3dUhVZGo2MzRMd296M2xDOFZmNG5mb1B6K2s5U3k3QUJL?=
 =?utf-8?B?cFB6dUw0M2l0empYK0JVdklXdEc4Zm4xcXZiOTJQT3hib0RlU05uN3lyOTlO?=
 =?utf-8?B?TC9STzcvTDJkUDdQTHc5cGNRSkZiTThVc3puZlZKMG5Hcm5nMHdvLzd2azNG?=
 =?utf-8?B?bHd2YlZXLy91MmxZK2QvY0hWRzFPcHFWbXRDNWFuYnlPWWVRMkJpMUQ5M2t6?=
 =?utf-8?B?SEF3a1FYaDhnMGFuMFhycGkrYjBOaStjOHVZRkhCcEEwZGhubk5pOXorNGpF?=
 =?utf-8?B?VGxtMTVQUHVKS0EzR3dkL0pRVzBpMmNhWE1BRkUxMTBmeGh5Wkloc000QUFI?=
 =?utf-8?B?OFpJczR0QVZPdFNLY1UyVDNqS3NGMTRmbko5ajRrVW1wd3B6L0NRYXN6Rm9n?=
 =?utf-8?B?Z21nZ0tOWEFDM3NudVNqckhNcUVRVzFFL1B2b2RrVE1rdW04TWZyeEN3dytk?=
 =?utf-8?B?b05mQWUwb3REVWtJZzlWbkJZY1EzUkp3OGdaUHMvN2FNODNLT3JMRzl3N2pL?=
 =?utf-8?B?bWxGQ3FHVWNTTEswdkVwaFk5ZGphMUlQay9FV0hza0JxK3NUL3hidz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d796125-a629-4d8e-8857-08de5b4bb303
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 13:23:01.8858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLFwujCiT9MkXm66lEK73v5ZkllPpK9IDredRppqtgd0wznT/TGI3x7Eb1uheJIa1YldPk0yL/oxdj3li6o5ymDtDXawpnQqgujUHUyLrR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5555
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dmukhin@ford.com,m:sstabellini@kernel.org,m:dmukhin@xen.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,ford.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 066997DB40
X-Rspamd-Action: no action

On 24/01/2026 12:32 am, Stefano Stabellini wrote:
> On Thu, 15 Jan 2026, dmukhin@xen.org wrote:
>> From: Denis Mukhin <dmukhin@ford.com> 
>>
>> Use the new .config manipulation tool to toggle CONFIG_DEBUG in the
>> Xen automation build script.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>> ---
>>  automation/scripts/build | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/automation/scripts/build b/automation/scripts/build
>> index 7a81d229decd..ee1127c53dc5 100755
>> --- a/automation/scripts/build
>> +++ b/automation/scripts/build
>> @@ -27,7 +27,7 @@ else
>>      # Start off with arch's defconfig
>>      make -C xen defconfig
>>  
>> -    echo "CONFIG_DEBUG=${debug}" >> xen/.config
>> +    xen/scripts/config --file xen/.config -${debug} DEBUG
> I'd suggest to add:
>
> debug="${debug:-n}"
>
> before calling xen/scripts/config to avoid errors in case debug is not
> set
>
> I could make the change on commit if you are OK with it

$debug is always set in automation, which is why the script is written
this way.  But being resilient might be better.

>>      if [[ -n "${EXTRA_XEN_CONFIG}" ]]; then
>>          echo "${EXTRA_XEN_CONFIG}" >> xen/.config

This part of context is the same pattern, and wants a similar
adjustment, although maybe the script wants a bulk adjustment mode. 
This pattern is also repeated in the Eclair scripting too.

~Andrew

