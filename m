Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26B45385F9
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 18:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338694.563499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvi4V-0002tG-1h; Mon, 30 May 2022 16:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338694.563499; Mon, 30 May 2022 16:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvi4U-0002qf-Un; Mon, 30 May 2022 16:16:46 +0000
Received: by outflank-mailman (input) for mailman id 338694;
 Mon, 30 May 2022 16:16:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8YcB=WG=citrix.com=prvs=14204b923=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nvi4T-0002qZ-I0
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 16:16:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4367d39-e033-11ec-837f-e5687231ffcc;
 Mon, 30 May 2022 18:16:43 +0200 (CEST)
Received: from mail-dm6nam08lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 May 2022 12:16:40 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB4680.namprd03.prod.outlook.com (2603:10b6:a03:139::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Mon, 30 May
 2022 16:16:37 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.019; Mon, 30 May 2022
 16:16:36 +0000
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
X-Inumbo-ID: e4367d39-e033-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653927403;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=53bPoT6QT8yPMZywDq9T1fdGNhjk67PJvP3VUrkkI8M=;
  b=aE/49jqAOJ523N9PA7ijym8ZoVXTYjrolnHOlupd/nSARvj4y2AMTQAO
   XjISsBdiS6F2OsVIHMiaU+okKX4R2gKB3KlUcOc/hxj0lDMI3ZPw1O8ze
   SK0f7/b26ivYxOwlafmD1Fcop8QU7YVOUagjXJYknsUSuTGbUw6NSSU1K
   M=;
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 72458040
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:pvCfGK+OJ2btAoAR/4wmDrUD9X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mBLD2zVbPeDMTH1LYsgOtvk9E8AvMDdy94ySlNurC48E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IPhW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnaatSj4vHIj9pMEcdSQESA1XJ6hho7CSdBBTseTLp6HHW13F5q0ySW0TY8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHP6MuY4wMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgKWEF+ArJ/cLb5UCQkSxf4KDkaOHla8WYHOJpnmmfg
 0D/qjGR7hYycYb3JSC+2nCmi/LLnCj7cJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsb5dw21pjiDpBF0ZjZLO+gz6QXIxq+K5Q+cXjgAVmQZNI1gs9IqTzs30
 FPPh8nuGTFkrLySTzSa66uQqjSxfyMSKAfueBM5cOfM2PG7yKlbs/4FZowL/HKd5jEtJQzN/
 g==
IronPort-HdrOrdr: A9a23:FkCrNKF3vTm0acw1pLqFepHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHPlOkPIs1NaZLXDbUQ6TQL2KgrGD/9SNIVycygcZ79
 YbT0EcMqyOMbEZt7ec3ODQKb9Jrri6GeKT9IHjJh9WPH1XgspbnmNE42igYy9LrF4sP+tFKH
 PQ3LsPmxOQPVAsKuirDHgMWObO4/XNiZLdeBYDQzoq8hOHgz+E4KPzV0Hw5GZUbxp/hZMZtU
 TVmQ3w4auu99m91x/nzmfWq7BbgsHoxNdvDNGFzuIVNjLvoAC1Y5kJYczLgBkF5MWUrHo6mt
 jFpBkte+x19nPqZ2mw5SDg3gHxuQxen0PK+Bu9uz/OsMb5TDU1B45qnoRCaCbU7EImoZVVzL
 9L93jxjesZMTrw2ADGo/TYXRBjkUS55VA4l/QIsnBZWYwCLJdMsI0k+l9PGptoJlO31GkeKp
 guMCjg3ocXTbvDBEqp/VWHgebcE0jbJy32DHTr4aeuonprdHMQ9Tps+CVQpAZEyHsHceg02w
 31CNUXqFhwdL5nUUtcPpZ3fSLlMB26ffrzWFjiUmjPJeUgB0/njaLRzfEc2NyKEaZ4vqfa3q
 6xGm9liQ==
X-IronPort-AV: E=Sophos;i="5.91,263,1647316800"; 
   d="scan'208";a="72458040"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6RP9KjUyvzf4pViP0tc/p1VAv7n3JhuhpbZwvSHPATCUGDMorPxwG0ZAUnrZ8UCXE04/mpzoe8FD/rFRnGXf6Cz6mD7GZNjpApl+5be4QRfRwyJGHMPRBCLnKuf8SG7pnf49babkDd7lV+rWuFC0kBxFTu3he+BjE3IEI9dkBcMPldkK0fdGSxXcAKwV6QopDePewR8rKPCFtnvXs4RYqqBcshQb0L2DvCg9iKow1GVmVFYmWfg7XZ0aXjFqFgpXO3wBKiawvnWfBOKA8YzANOc3E5lu/0oPQ1blgVs+wHC+QdmnNTJOeRAx9744scwYsSyGnkb8vshfI+wYDKWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwLUE4SfM5xfy2ULcIw9uUs7OnSu2cPnd1ruBooiV1c=;
 b=JX7qbqVMrhysNQsoUVcMIR4aiCDwtHIGIA+VveIu0Zz4kv3SsfRlYG2A/399D+27kfhsPuGzYzeObpu2MDPUjdevq5gAE2YPYEphKw2Jm9/A9i52TCktxUDubNDK72NLuy61rfQ87xLoel1+KxwGwZnkBRygKMXPqA7UOVZpqz7/zDgPwMMMOT+AYOSczTWYkctM7vnlQwNylYKEze4Hy0kjWBy9Lpj97C+Vc82lY5sKJ+WNVrkxXM/VrdksHe43UTjIDKJ+rW7X277mB0++FaiME4xKjevZ2/3mUyNBN0xdGin/2H9Z2aktIP1+O+czg7J7F00ZgxymciNA/Iaxtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwLUE4SfM5xfy2ULcIw9uUs7OnSu2cPnd1ruBooiV1c=;
 b=XEgC8mG6ry5EMn5M7XGD9sNdS2c7bq4Rn0j3LbCMWULO3IuayFBDKXSw9aNYJinO20jYXWRuewhhVJW5azq0zQ9pvmKPMfoBiUvKxv0jlLe74RE4IE8jFnMYtliz59iCt3wc2FdRNn67UP7nS/GMquM7rDrh7bLPWwbtLqNQeVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 30 May 2022 18:16:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86: harden use of calc_ler_msr()
Message-ID: <YpTt4cRaeAJiUUtH@Air-de-Roger>
References: <b0fa2f54-e7a2-67c7-e611-69abdbb6829d@suse.com>
 <YpTpjOnY48UNlIe6@Air-de-Roger>
 <21cb8b91-3d7f-5490-ea8d-38ab18cf2dcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21cb8b91-3d7f-5490-ea8d-38ab18cf2dcc@suse.com>
X-ClientProxiedBy: LO4P265CA0179.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6424e13f-84e2-4d4d-6e75-08da4257c556
X-MS-TrafficTypeDiagnostic: BYAPR03MB4680:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB4680DA53521460AD6F46D3B98FDD9@BYAPR03MB4680.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hg6ZpvYajKCL+sD1ingUW4L+viepyPc05P40Z08sqFK6zLtnkqJJZrBYAV5E7mHzgNd+BsO08+3esBdDguD0JbwKGg0sZbw0ghV/LO2H17A8r71YXLs6oYY9aE9PNL2JZBByYfEVorRNsRfD9rcOd34WVQ+U3s1PMZqguswqQjtX3YJa3RHJqafJ85cfoe0Ci0QQnd1M3CiRNUsU8StatGCduaL7GVCrXKj6LxhUyiV9ySlZscPxxJ5CjL7zbXXmfgyrG5EOZJsgi4z0Hyg6WTSrDAvkhd4XsDsFOGg0ZTHIbYhSdYgqo77G2e6WS2sBAzNgQXH8MD54DXVGPVYM62f/1lphZafXdaD2wYaO7ROfKeuPq73+lvJRELVGAxfdsDzAcSIlmPKMckFT1DCq3x5Hh0nAASQEHiGPpEwpiqn1I6S/Tnae8JTusCcW3rJMndtIync8rO2NmXL1/cG/cFj1nnnT7Fte/gyswMGJn+we8ybGHAJXfN4xcL/bsE782v/u73IXp6j8TaKP62XaUqkZgcVFdonbvON5zjjiPbMrvFXR0MJqdwqnjizhkoFHOURu2k59JGeYuiMRmG4EYewB5a47XUhMDWHYj6DGvCmlQvG51+0rO1bSwrrFXdQEUHNMEYBwGSQkg+X0wYRaN0/seW+rtTboU8j/h1Q7F3AUK2CN5ex59Cgm5zaBRuhYJC42tqGFB74Nfwoxe8OwMQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6916009)(316002)(86362001)(85182001)(2906002)(5660300002)(83380400001)(66946007)(66556008)(66476007)(33716001)(4326008)(38100700002)(8676002)(186003)(8936002)(6666004)(82960400001)(508600001)(6486002)(6506007)(9686003)(53546011)(6512007)(26005)(54906003)(354624002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a25PRmlrNUJQU21wWmFsR0oyeUpwUk5VOTdZYlRMczU5M3lzdGJZZDNGVWVo?=
 =?utf-8?B?bkFGM3RISy9rMTZjMmtkU3JEVTF5M3RqNi8xWk1VREQ4OXU3M3ZGb3BTL0hQ?=
 =?utf-8?B?YkMwbk1jM3RjczZ3Z1JRd3JySk1NVVNmaHFuMTFNSVpMYXppMzVOM1hDcU40?=
 =?utf-8?B?bmNjOEF6MTRNQ3Y1TlNxNjJ5VG5IOFRMZDlBOFdVaTdnZndBcFlqMzJpczNG?=
 =?utf-8?B?NVZxVkZqVlpMcnI0MnZseXl1L1Fqd1ZZOVJGMGJRMnZtTktVdEZ2eFpaNjVU?=
 =?utf-8?B?cW9JQkwyaGFkM1UxbWc4WkFsR0tNRVp6VFRtQTE1QlptNHcvbENpekpjd0Jj?=
 =?utf-8?B?TXowbkRadnhJMTJiZzd3MGN5R3p2bUZqMldlcSszR042Q2JTU1k4OGFLSkZ4?=
 =?utf-8?B?YUQ2M3NJL0tKY0tvamk3czNSMm9GTzQ0VDRBcFUxMkNqd1ovQS9ablRsOVoy?=
 =?utf-8?B?cmJIcThtSWRnMUYrYS9Eb211d21zdHkxMGkrY0FpNmJRYjNvd09CeGtLQkFz?=
 =?utf-8?B?RFAzYStsMUF2NXNZdkVBOTRmNlgxV1ExeStPc2J1TDRMOVZwb1UvQ3Q2L3FB?=
 =?utf-8?B?aFJYZ0VhdGxQVFc1b2QrT1VRQVRUOWlVUkRQdHRKaUdqL1RqQ1E2dnV0WE1t?=
 =?utf-8?B?UmN6UENsM2Z0YTZaWlJTWDhPM2lleUZqY2tkZHdNN085QXFaN3lRNmZWS2Yz?=
 =?utf-8?B?eXdGazBpeE1td2NqSGlLQUp6ZVQ1YnJQTzRhZXc0c0NVWkhHb3l5WGcyUTh2?=
 =?utf-8?B?aW9IVStiU1VtNEpVNmN6Y2RFVTd5cmk0M2VGTWpxR0ZvN2plTjNyWmdwU0lX?=
 =?utf-8?B?TkdDR3lPQXZTZGZvSU9rMnlzYzhmYyt3bmY4alpNOXVZeU5PeFhTTVBOT3lP?=
 =?utf-8?B?VmJqbUxrMXdpckxONmk4ZXJMb3BUejRBazZURlp2akp5M2dsTHJHU29XdUlp?=
 =?utf-8?B?cWhXbitrMlgrVFRTN2xaaHNiUktiazF1VVAzK3l2LzNCbmdTMnRCTmF4SDVp?=
 =?utf-8?B?MkJvMGtHRkNITmViOVB3ODh6L0NNZlNjbVF2NEZyYlJOQ3dSNFNrU1BmcG9j?=
 =?utf-8?B?NnMrMy91OXNlOGJtbldoQnJzeCtkREljTmJYbHBqS3U1NTVya293TG5DL0NY?=
 =?utf-8?B?aTZWdStaem1FejdiKzRVcnd4SmlrK0NBcUxmYzBGdzVCL3VYdFhKU2tLMmxU?=
 =?utf-8?B?cFlKRVpwZWJEMnEwQ2pGcVg2OHhxRnZZQnhEYmlkLzJVMlE5dlROYlpCcWl0?=
 =?utf-8?B?MExhQyt2ZjRjODVwbUl4aGV1SXpNN0pmSUVpS1R3S1FkMXI3aHNjbzlxWXg3?=
 =?utf-8?B?clh2dFlmbmZkK2d3bFkzTWxEdzJjZnpvVWxZUk9pVmV6eTNReFFXZmZRc2Vz?=
 =?utf-8?B?b1VCcmVkb1BHZ3J5UFVnRlcvQjhvUEJuSmJrdTJPd2kweU5uQVJYUlpKZGZX?=
 =?utf-8?B?S0EvWlBuWmIwMGw3eHMzNWZtc1QxVlgwVllUeXBsTGFEelFkM2F3b0FaREZD?=
 =?utf-8?B?NkxHb1hJMU5PNmhVcXVRdVd3OFJ3MmppZmJzTklrcXhod3psOXh3NDBXQmZo?=
 =?utf-8?B?R3NsbDUvdWJ4YjBzd3Q4K2wvU3o5aGNsMm10UE1QUFl4VVk2ZHI5Uk5XRlhi?=
 =?utf-8?B?bm4rSGZGbHhOT1U2ZnJLZ25GUG1wYkFvakIzY2lRZmFpK1J6dUExT08xSzhx?=
 =?utf-8?B?blhkamJPYk85cDlQU251ajRra0FHZnJmdkdOMGlLY2RyL2VyUWgzcFJSL29N?=
 =?utf-8?B?ZTFaM1hVRnc2UzdrZ3NzeEV3OTIwdGM3S0ZPTmpsckFpUWNYQ1pvUEI5RUFO?=
 =?utf-8?B?QkxQUDdiQldESUVadzZTeFlZWnFhZ09ORkZ6OEJzVm11TUY1TW5ud3ZWd3M4?=
 =?utf-8?B?TVdlc0MycGk4amFQQ01tVTVzT3NqclB1L2RTSVJrYTFwNlRSYnA1NXJmck1C?=
 =?utf-8?B?Vk5ScTM5TU9HSFVxOEw4T3ZZaUxzMDlDNXlkOTIwRkxBamYxaG5IL2hLOUdw?=
 =?utf-8?B?blozcG42L2IxUXQ1QnNUZE4vcW9UenVQREZIYkxCRmpyRUlXK3h4ZjZ0cXpu?=
 =?utf-8?B?MkdXcFhVeHo4dlp4QjhoenRHMDlrR2JvNTdoL3hVSFhVRkpTZTVwd09hYXZa?=
 =?utf-8?B?RjdySldhbTNQNllZRDhVb2c4enFsRTRScGR5TkNsZHBwL0N2c2JaRUdOOUZH?=
 =?utf-8?B?QkJJZEJqUVlKTDNVYnlEdUxTTUJ2NndDRk5jYXFHbFdLMHBxZUZESUdLb0V2?=
 =?utf-8?B?aVdBd1FDVEV4eXM3aXV3eHlIam9pRGJSVSsvVnNrSVlJRlUzMnFCSmRnQzkx?=
 =?utf-8?B?VkEwOHRZcnZ5blY0VVRrMTV3OWdPUTROWnNwdzh4Tnh1STkvMGxxZHpGeUlM?=
 =?utf-8?Q?gGbkSHms2zZrNNac=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6424e13f-84e2-4d4d-6e75-08da4257c556
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 16:16:36.9065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TzKyszp6DrHaQNvC4g2W2yIrCT+s1s3efpRtEhbNXc3tZDuaD5dzayHxJejMwBVWk+bbLf6U7Cj5yCSqY28gcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4680

On Mon, May 30, 2022 at 06:07:23PM +0200, Jan Beulich wrote:
> On 30.05.2022 17:58, Roger Pau Monné wrote:
> > On Mon, May 30, 2022 at 05:48:51PM +0200, Jan Beulich wrote:
> >> Avoid calling the function more than once, thus making sure we won't,
> >> under any unusual circumstances, attempt to enable XEN_LER late (which
> >> can't work, for setup_force_cpu_cap() being __init. In turn this then
> >> allows making the function itself __init, too.
> >>
> >> While fiddling with section attributes in this area, also move the two
> >> involved variables to .data.ro_after_init.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/arch/x86/traps.c
> >> +++ b/xen/arch/x86/traps.c
> >> @@ -126,11 +126,11 @@ DEFINE_PER_CPU_PAGE_ALIGNED(struct tss_p
> >>  static int debug_stack_lines = 20;
> >>  integer_param("debug_stack_lines", debug_stack_lines);
> >>  
> >> -static bool opt_ler;
> >> +static bool __ro_after_init opt_ler;
> >>  boolean_param("ler", opt_ler);
> >>  
> >>  /* LastExceptionFromIP on this hardware.  Zero if LER is not in use. */
> >> -unsigned int __read_mostly ler_msr;
> >> +unsigned int __ro_after_init ler_msr;
> >>  
> >>  const unsigned int nmi_cpu;
> >>  
> >> @@ -2133,7 +2133,7 @@ static void __init set_intr_gate(unsigne
> >>      __set_intr_gate(n, 0, addr);
> >>  }
> >>  
> >> -static unsigned int calc_ler_msr(void)
> >> +static unsigned int noinline __init calc_ler_msr(void)
> >>  {
> >>      switch ( boot_cpu_data.x86_vendor )
> >>      {
> >> @@ -2171,8 +2171,17 @@ void percpu_traps_init(void)
> >>      if ( !opt_ler )
> >>          return;
> >>  
> >> -    if ( !ler_msr && (ler_msr = calc_ler_msr()) )
> >> +    if ( !ler_msr )
> >> +    {
> >> +        ler_msr = calc_ler_msr();
> >> +        if ( !ler_msr )
> >> +        {
> > 
> > While doing this rework it might make sense to print some message
> > here, like: "LER option requested but no LBR support available" or
> > similar IMO.
> 
> Hmm, yes, but you look to do so in your series already. Could we
> leave things silent here (as it always was) until your adding of
> arch-LBR support, and then taking care of both failure conditions
> with a single log message? Of course I could add a message here
> just for you to then (likely) alter it again ...

Oh, so I do introduce one, sorry I didn't remember.  Then it's fine to
go as-is.

Thanks, Roger.

