Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AB6517FE4
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 10:41:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319289.539489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo6H-00056U-Iw; Tue, 03 May 2022 08:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319289.539489; Tue, 03 May 2022 08:41:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlo6H-00053Z-F4; Tue, 03 May 2022 08:41:41 +0000
Received: by outflank-mailman (input) for mailman id 319289;
 Tue, 03 May 2022 08:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jd7v=VL=citrix.com=prvs=1153202a1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nlo6G-00052Y-GW
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 08:41:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d82337c6-cabc-11ec-a406-831a346695d4;
 Tue, 03 May 2022 10:41:38 +0200 (CEST)
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 May 2022 04:41:35 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB4095.namprd03.prod.outlook.com (2603:10b6:805:c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Tue, 3 May
 2022 08:41:33 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 08:41:33 +0000
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
X-Inumbo-ID: d82337c6-cabc-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651567298;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=R+XeYU6S2in/ekRibsaCHDBwGUhFALnOPZsgvRdabFE=;
  b=M0WlRxPfSdXUwIA2CeVw/HuEaTQgpwiYJP8xXY6gIVnn7IKSTTzlQ39T
   j+4zs2KQuHUcf4m/pRjo7unzRSk8Mg8Na5uEWie+FHMnAikl0HRj3JWIx
   c1H1P1ES2l+a9pwSTdccZcrxV8c14Y85fzwH4QYe6fT2rCOxomdfP6AaQ
   4=;
X-IronPort-RemoteIP: 104.47.58.173
X-IronPort-MID: 70469249
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:b6PliK0o9jpCuOysN/bD5bNwkn2cJEfYwER7XKvMYLTBsI5bpzQEz
 mAZWT2Ea6vbNzakKdwlaoXioR8Gscfcz4RrSFFqpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMw2oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1hir2uFB8AIJaQt+smTT9WEAdjOZV/reqvzXiX6aR/zmXgWl61mrBEKhFzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82TBfyVvre03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrianL2MJ8g7EzUYxy2Hf3iN7/b/qCof+ZuyqS+UIwkeou
 X2TqgwVBTlfbrRz0wGt8Hihm+vOliPTQ58JGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySWosLVWhS5pDuOuE4aUt8JSukisljSkezT/hqTAXUCQnhZcts6ucQqRDssk
 FiUg9fuAj8pu7qQIZ6AyoqpQfqJEXB9BQc/ieUsFmPpP/GLTFkPsy/y
IronPort-HdrOrdr: A9a23:VDnEgqpJtqpJESGlxbwds1QaV5uiL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCDwqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sP0f2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0aqSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7uvZNOyfaJNw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAlqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocYTbqjVQGYgoBT+q3uYpxqdS32AHTq+/blnwS+pUoJjnfxn6ck7zI9HJFUcegx2w
 2LCNUtqFh0dL5mUUtMPpZ+fSKJMB28ffvtChPlHb21LtBPB5ryw6SHkokd1aWNRKEi6qcUtd
 DobG543FRCDn4GT/f+kaF2zg==
X-IronPort-AV: E=Sophos;i="5.91,194,1647316800"; 
   d="scan'208";a="70469249"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKb1AmucS1rn+61wOSC0/4DJVP+60jZpOJ/40jI2vvv9r2X8QAc0Lw7CqvUfe8NEO4+1phqsaBjGy7zDuSKKxR+HUqDxXKnSlj2phEEe0MsvRmcSE3ICMjNca3n6LfOp2O5wFX501W4FM7C1Gv6ff/XNOjEmdStMi30YSX5V0ZUw5NqC99Q58SAXcuLwwpXgmhm39IFLVwaWGtsJooHoXO99aX5biZNgvu4khJmdvGSOydG7YAJH7G9xrKiefcjaZiXRoZ5OhWdM1IQHW0ZJUCSgI181luxUTvo4VE7mXPfljyZaGHNSYAg1gsZ7HODqEuxmV5iIiVdnODq7QKUF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syQdOtap2ntcmdlvmSAF75iZkayGUWm1CBDsHUvIS5w=;
 b=dexOEhCSueUQU12DR/xoJiyihs0aGK+41PdRSMnjE92jdsUWsBLWw/ihOm6J5GNjvB0IZfFgc5aG+D2HdLhD64aMpFDbPst3Qf5jZpVN45CZpwWgHhQMubXcw5zZhiPqPV86lTfpqR58/zXCBPOYZb9qA13kM8SjbQm4qWjFBik+rCQBy+VIxT+YchFcf200ulVtJtvACfqil68T0mugYu7Y4ECSDh4Y5aqoZD9Pyf3rX3xQtJW2oaOcgmAEK2fTBkHPU82dlvt9556gb86jbmSK5aAlJZRttKCVFgvoXdId2hmE9U7xA+5Ew85ttmcyB6Yz/fcd0BbQdVDNuFxEXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syQdOtap2ntcmdlvmSAF75iZkayGUWm1CBDsHUvIS5w=;
 b=HZeNGH/0W7/C5sgCSzeCUQkJ+wr4XnVV9DuFrYjbedmqdxlOVLbrTr4fejJr109g92zaQ2bpgAjh6zeBoQP6DgnitvdbTO2qrGX3+aN7hqV2YcH7RjdRo4Zbpaebpa6uMS1bbIo0zFaS9haO5KeiIp7yKrwhcyw4b+nkJxQEhcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 3 May 2022 10:41:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: osstest: blessed sabro boxes
Message-ID: <YnDquSreLuQQShqa@Air-de-Roger>
References: <YnDe1BXLVsrkaKLG@Air-de-Roger>
 <faa805c1-e050-6f02-a7d9-bee7940753b9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <faa805c1-e050-6f02-a7d9-bee7940753b9@suse.com>
X-ClientProxiedBy: MR1P264CA0106.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::6) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc86254c-deac-4817-ab09-08da2ce0ba4e
X-MS-TrafficTypeDiagnostic: SN6PR03MB4095:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB4095A2ECA87546E966F09F0B8FC09@SN6PR03MB4095.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jtj2fe436TzQ3VqbjnDZ+VmNb+2/VY+dEMwpUi6we1s0qs1Fy6VgSIH5ulU5uEqUgLnY4n1ERhBLmBmHMBJGTxnRDaf9WcRKAc6EqK5vxPacmob3Ieq7LUsPXOywI2+e9FzA/4cfF4CslkLM871Jgbhw2eEM+y+mUmM5ybYOeu19LUBWN9It3GrtlkVT4QgtKQuHdJdLc9D+FuCTmwPvT3neRe5OK7FNwggO6GtGrySkvs854w9CUYBKCmzNfN+cwYjIfLC1Hw3AZDuKhJTBfTzxUxu76lacpAmqagy3gPynmfUE+o4XtOUX6NXZ+n0qCDEIKh5H4Nz6epCp+l7bKlGCJFFtXoilQXnzxfSyl23KJSoS+MVB7l6z8PAuNEgUHq7jvLDevyXq5d9RaBARC4rklumJIdDLeyl0m4Bbqx0N2E4MKCZPbY2s328juFLElS3vVORQ91Cg/OM2FRVeqBBXZc89t4S3w6wKpn6BKymf0UGsvU4NcrZj7pSp537XEDym0v6IZIxBgckNQv1H36B68+AbofNm4m/nvQoLG/NgW6PltxwO2MSIS8n/fYrYrclgxHzvE9LQmsPqg0aPAKktbejn55NifbfSfc1AVypZiFbR1NlY05wNAHfsQDa2xWSDz0lSudJRoIwRZBtx2g9zjOolKUWh0GmbImdwPgxYeUUEDlTuZmwNluT+nCWIhkvxPPEGS98PqjEeImSQ40csSciF2DfNagbOfYFIVyvY+1xozKgU/hlyKuHsOeo83uRfoM8xbdaKCe+I2dyw4A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6512007)(9686003)(6666004)(26005)(186003)(53546011)(6506007)(2906002)(83380400001)(8936002)(4744005)(33716001)(5660300002)(4326008)(8676002)(66946007)(316002)(966005)(6486002)(6916009)(66476007)(66556008)(508600001)(38100700002)(85182001)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2ExVFYyR0dEWldPb2xGRnlxd093cEFhRDFKWEdCNXJ0ME16TzJEZmo0MFJs?=
 =?utf-8?B?c1pvVmlpc3hrQTJYQmNGVWNuQ2gxQllOQ0V0SWtBYXZJdy8yNStLUFdrb3Rn?=
 =?utf-8?B?Z1N5N3RXTDBWTmhpWlowdURLMzFHTjRjL1J0OFIwUmphQm5jZHJ4ajdKTWlW?=
 =?utf-8?B?ZHNMakU1OW81OEpGTEJ3OUZwK2J1NmRZdGZhaDN0VGp0U2k3MWlOVDZmclZw?=
 =?utf-8?B?a2Q1dU9pRm1QTFdRKzJYdEF6dEowMXJnc3pIUzJsVDhBMS9VMDVwUlZZWEti?=
 =?utf-8?B?WW9PVHhRd1QrY01nN3ZIcXZFVkk5Z0J3dnRhZUkvODVBTUdManNvVmRLK2NJ?=
 =?utf-8?B?YUlDMWFWZHhkWEh5RWZnR0Npc1dXVkNaRm5SVkxFSW1MQk5pZlBLTldXbEpi?=
 =?utf-8?B?emsvYmxMRlBGNHM3QVVvK0ZUeUo0Nzd4aC9ScHNsYWI2Um1lM0J1U2dwV0JI?=
 =?utf-8?B?anpjZmU4UERGK1dHdVNhVmJIVGJrdXJnMFZEZjVxa0xhVWk0aFBJMUFJbjlq?=
 =?utf-8?B?MXhMdU5TUlVjWGxsK1h6K3RUd1QvZnkzYkdSU1pXaFdLdXRSVmRoelBwYkkz?=
 =?utf-8?B?TURkb0hMNVNKRW9nQjZUN1hyUGUvMDYrSmlIZVlVVEpjeml5Sk5sSzgrRGow?=
 =?utf-8?B?S1JIU0V4Tm9MUWwzUldsZUdPbjdrNDlYazBhaWpldTdOYjdHajVXWlVia3N4?=
 =?utf-8?B?MGV3cnFYZVFxVVRyeTFJU1FTNTY1aitDWTd1U3IydzhocEx4WDArbzU1SDYz?=
 =?utf-8?B?dHMzS05VT1J3bFhCbU1KbHV5cjQ3ZG90Ukx5Q0h3UGRMa3RBSDBWQjNyNEJi?=
 =?utf-8?B?bjdyTisrbVBYM0xHb0kxcDRhM0VOcm9UcUxGSHJ0WTE0R0NIY1AyQWlndFdI?=
 =?utf-8?B?cHVXU05Jc1BCKzhLbGM2KzRPbUFHM0xuVHBDeTVYaFRvZXFEbmprRU91Y0J5?=
 =?utf-8?B?dWo2djc0TWhlOXFwWWlnTmhWRmVYL0toSUdwRzlNekd1OHhNaGZLcWtOT1dh?=
 =?utf-8?B?akMzdko0RzUrZTE2VklONzRwOFRkWlZmUDVNcVNabUw2MGZ3V2JSOVFzTjNM?=
 =?utf-8?B?dDdxVlZEOUpjUzVpWlNKbFllRWE4SlNhZXBzQitoR3JRU3JXNHQ2UXpaM1FU?=
 =?utf-8?B?VW1GVTNrQlVsZ2dla1hEQXVkZ2lhNmtPZE1iZVFZQ3g1WU8wZnpNeGgvaU1C?=
 =?utf-8?B?YndUeFlYRzE3TG9Ra1A4blY0b2JXcW1SVXp0VWVFNFRZSG55L3d6eksrZ3dI?=
 =?utf-8?B?Q3JjUkpjaGdWOFpOS1NEYTFpM1BmY1o1U3lHNXNGTU52N29RdmN3RGdTSnpj?=
 =?utf-8?B?KzFxcC8rQWhuR3pPTlVrK0NrREQ5WThnRktPWnVkdXdSMWRVNlRlN3ZGdGtK?=
 =?utf-8?B?S01xTkd2bks2OVdHNEFqT2lGMnZXU1c5dEF1TUN5ekhTejZOT2tTa3ZGaGZL?=
 =?utf-8?B?b0NOYVdGNE05QWxpVVMzZFhDUnRyMVpGUHdZNDlaSGorbVlkditIVHF0bkxy?=
 =?utf-8?B?WnlKbGljKy9mU1JUSVhRUUtuWDI5TzY1Y3hvV3NBNXhza3FtT0hRMlRHNFlK?=
 =?utf-8?B?NDU4R2R5aVE2dEw1WjRBWEY1bW92TktrN1kzQStxZEUvMTQ4cjRBNHhkMUZX?=
 =?utf-8?B?TE9VUzFxNjNhRVdXUnB4bWhmOWZRSXpDTnI5TmZsZnJXL3F6ZkN1dHg1UmQv?=
 =?utf-8?B?eGJXN21sVVNvV2tBVkY2ZUtyV21SZWsyaUlrdklsZ3pXZWxqWU52YUdSam9s?=
 =?utf-8?B?RTBDam5mMm9sNXNYTG1ua05mWkhUc0hOWmZEN2p0YlZWdUtNeDNaZXNLM3NP?=
 =?utf-8?B?dWNiNEZ4MXQ2NEV3cnE2YjQ5KzRmK2x6U1BIWU1jOHVvWmxaZ0ozN2FPQ2VL?=
 =?utf-8?B?a2QrYWxzVjZjNjJsZ3FRcDBzOW5oUzRYREZUTHJ3cUwxdUdTZ3RxaHE0dXBV?=
 =?utf-8?B?UFNBcDQvYlg0ajhhL1NLNGxXNmZ3UG5tMjd4aFB4WEpIT3NxQ3poOXZrNEpL?=
 =?utf-8?B?WVE4Y0xrZm9kekhldkQyejYzcnV2OE1kckFMUkFpbGI3OTlUMEFBazZDSWxz?=
 =?utf-8?B?czNURld5aUM0RDNjZzFic0xOVDZYY0thSFRTZWlzRnZFREdzblV5eFpkUUNK?=
 =?utf-8?B?M0E1ZUk5aVhmOEpnanY2M2FrRlZZbzlqRjRtaXk0VHRacFZQc1BQNjR3K1ZN?=
 =?utf-8?B?MkNmbXllWmpEUWJjNmNwTnhZRE1DYXU0YWRiak1NY0g4emdmOHFVTTZqY3ZD?=
 =?utf-8?B?U2VXSmladkdadmVvUGRWdGJKZXdyYmxPcnRWT3Y0bzJGWXduZWtRZFdqQmdT?=
 =?utf-8?B?Q0cweTJVRTU1N2ZnRnF0NXlEcExhL2xwams4djBFdUllN3hWSmdzc3NvbTBp?=
 =?utf-8?Q?AeVUnyP/QXhj8KuU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc86254c-deac-4817-ab09-08da2ce0ba4e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 08:41:33.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J11XKVXvnYmo5rTMW3a4wOkD7s3Pon4fYbbqOIN5cG/UYwyY8si2ME4PcjiSoMU6zPWBS19PaXit8UXmFA45+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4095

On Tue, May 03, 2022 at 10:25:02AM +0200, Jan Beulich wrote:
> On 03.05.2022 09:50, Roger Pau Monné wrote:
> > Hello,
> > 
> > I've blessed the pair of sabro boxes for production after a successful
> > commission flight:
> > 
> > http://logs.test-lab.xenproject.org/osstest/logs/169857/
> > 
> > Note that the boxes don't seem to be able to boot in 32bit mode, see
> > the following flight where all 32bit jobs failed to install the host:
> > 
> > http://logs.test-lab.xenproject.org/osstest/logs/169986/
> > 
> > I have no idea what's causing this, and hence sabros will only be used
> > in 64bit mode.
> 
> You may have better luck with a PAE kernel (which would then also be
> able to use all of the memory rather than just about 1.7 Gb):
> 
> Notice: NX (Execute Disable) protection cannot be enabled: non-PAE kernel!

I'm not sure it's worth it, we have plenty of boxes that can do i386
just fine, so I think it's fine to have those as amd64 only.

Thanks, Roger.

