Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A837B79EA
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 10:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612438.952337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnx8y-0005CB-Mh; Wed, 04 Oct 2023 08:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612438.952337; Wed, 04 Oct 2023 08:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnx8y-00059V-J5; Wed, 04 Oct 2023 08:22:08 +0000
Received: by outflank-mailman (input) for mailman id 612438;
 Wed, 04 Oct 2023 08:22:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8y1=FS=citrix.com=prvs=634504905=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnx8x-00059N-Oo
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 08:22:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 183972c1-628f-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 10:22:04 +0200 (CEST)
Received: from mail-dm6nam10lp2106.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.106])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 04:22:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5423.namprd03.prod.outlook.com (2603:10b6:a03:28c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 08:21:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 08:21:58 +0000
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
X-Inumbo-ID: 183972c1-628f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696407724;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PzNYTPwGeM/FdDqlLNkP0IvNUW8J9Mz+nZFAWK6JNaE=;
  b=VabwXawld14Zmh4NU+op4+JYeKj+wtz67CLkkPaSkkcuGMSvSOMjvRjp
   cRG1ue9cFhAZUGKtLK1Mq+SMywENRi4CMNefPdlAsBtwDk6W1HJ+Vo/YN
   4oQhJGh9lhXyst0cSI6jIOPDqQ5CSsxx71lZN9SK6H/ox2J7LoDfM2IIJ
   w=;
X-CSE-ConnectionGUID: 47oiFiEMTJyxy1EqZACLBg==
X-CSE-MsgGUID: GqQSR8nxQBOZ3Rjd0pbrzQ==
X-IronPort-RemoteIP: 104.47.58.106
X-IronPort-MID: 127337872
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:NFll5q/PSEDjqB89tVikDrUDcX+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2YYCmDXPf6OZDDyKNt/PYu18BgB78CAzoVhGwo5rS08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPagX5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkSq
 vsZBjEgSyyhlvKnmZ+ieMBHou4seZyD0IM34hmMzBn/JNN/GdXvZvuP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUpjtABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prraVwnigB9JNTtVU8NZFmWSo/DwVGCQ8cmngm/u10la0QcBmf
 hl8Fi0G6PJaGFaQZsX0WhSjiGKHuhMaVMtdF6sx7wTl4qjJ5weUAEAUQzgHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTS8JSxEUpcbqpo4bhwjKCN1kFcadjNf4BDXxy
 DCitzUlivMYistj/7q/1UDKhXSrvJehZhUu+gzdU2ah7wV4TI2ofYql7R7c9/koEWqCZlyIv
 XxBl83A6ukLVMmJjHbUGLtLG6y17fGYNjGamURoA5Qq6zWq/TikYJxU5zZ9YkxuN67oZAPUX
 aMagisJjLc7AZdgRfUfj16ZYyjy8ZXdKA==
IronPort-HdrOrdr: A9a23:aff2Iq3nFms+rDY4RJWTDAqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-Talos-CUID: 9a23:4CTZim8wIBWft/Qs05OVvxJLHcELc1D48FXBM17hJH9bYZaxY1DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AH0HMwA/+IsMAn2dzeL1t0w+Qf+hx2p+UWEYdqL8?=
 =?us-ascii?q?hiZK+NyAoIz2Hng3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,199,1694750400"; 
   d="scan'208";a="127337872"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNpA/0rUl+0pJj1NahtSe/NUMWBHprz+AM6k3kp3q2rOEj5+Jxq483TtJ/CKCaInFSm0UGRzQ7N9bpB58/OPh7sWOMFkNgn5CwIBjl27qwiv2/i6rioDt8NxOf4NZtLg/8sjfwdo0ijmrC7/xXmha7hlzFc0UwSj8e1HSyFIyCMdaWilvm+6hXXwyFXprlQ0Gqd6ZY+yIvvSX6v92YXpk8H9tFFG3iAGmIeM1lTTAeNWBMmb7Zd8eoZJFCtkZFJH0Uf1GYZ1o0sXhbSQx159txZojLbzZgotORbvYvSKtxVGdQxpTYeMgIX5+xbZwAnJNsCBi68bzGPhnxupHyk09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7oMqRzYOr3vzsenQkfB9tT7uxljAElFXTgGVBP29U8=;
 b=UyCaPnv9hDSfTRBkSBgkZdFeeY08gqQwy9AIW8XkCujppG/z+GzKKjTsN/53Au4iBZj1UnEcm6wXzMjVvsfeYsnxXlNbOIKeWjhQxKp6SqM+1Fonjz54HKRWhCXYzzmFvGRQd/FlAXDvKjULLnW1w/YwzIpkouulfqj5AJxiVtl3oGui1wGAMYcNKy5DRPHwPTWRrvfg0CoCrLcGPwecnLsQ2msWGkUNWK19NQUA/bGqXfJoSFnO+hmkVFY+qmTPkDfVuWl8BYeFY4erR5Ustvnb+2tePrfCZ4vBftFO6ahxmG6j7mzpxiv0tWRwO6q/KDxO+39a/idrRayVWJDUPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7oMqRzYOr3vzsenQkfB9tT7uxljAElFXTgGVBP29U8=;
 b=kVgufX+mHOZ5Ggl3aNCrJoqlPBJgFSgddZ02lk9fTbP/v0bDCbo8N0dCm7Ipx29s1FmHUoBGyidIfxq/bShl1fr0HOxyADi4G9FwoatOKdqZ2p6pRFGvynIvXvDk62cRUHDrfWQ4lyBkx+VozxVCnz5P/RViAFVJ1tni/KQbEyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Oct 2023 10:20:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
	henry.wang@arm.com, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 06/10] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZR0gX6wyXLD_6nY6@MacBookPdeRoger>
References: <20231002151127.71020-1-roger.pau@citrix.com>
 <20231002151127.71020-7-roger.pau@citrix.com>
 <CABfawhnHg3KrGP-hp4_Q8GvSf2nVSVSyK24HKqAGuWp_AtD8-A@mail.gmail.com>
 <ZRwlXls8xRyc8AX4@MacBookPdeRoger>
 <8ee8d70b-5b69-4834-b7e3-572e96effa5c@xen.org>
 <CABfawhn0vH6rS8-SJQJVZtto2HA61By1bCG3w9bJMJR3x+rXsg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABfawhn0vH6rS8-SJQJVZtto2HA61By1bCG3w9bJMJR3x+rXsg@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0242.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5423:EE_
X-MS-Office365-Filtering-Correlation-Id: 7be0f953-47ec-4fa2-12a8-08dbc4b2fa3a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	InWrOLx010/N5cU0aPS0+JuZ144wLz5eV4xmnuwoimuUMRfsy323DnaVe5tXtGC7q6Ydqp3BJyva/7VG9Jkeky0+b3117HsmVFpSCEwWB1kRN4Q8Anfy4oqErcg2ERYKixHaIXvJbTu02LWtwYGVtE4V1a7DBdQM1I78h6GW7f6ieuVCjPX8u1hGdGzYmQBZZeFRwicDIKQpsmQRr9o3pdWKQ76loAP6Rvk2zcK83E3XnsMBrK7+uffjDDUkFURyCLrvnphXDpPH4I5uUp6hmS7ZQe2LEiie0flo0BkpAyhYvuvoBEVuFhGdlww++5BV7zgc114Crd312MHyZxwhnZRt+Gxo/Twr9viNGYY+8X6xGrpdk4ykIOI3MltbjMn5Ak64KYM23gOQDLAKQEu/FfcTbiKFPvfUau2wZJrpwcLv8b5QEOhpZWVuhCWPqo3TkV4HAKQoPVC8WBWMCEYNiW+mWfwxpFxEktRd6LKzZNB6feBkWw/Lnr3+LGJ6bnRtu90irCu6crv/8V0/hR9jvfPcsVBrPCi2bm1JL3Igg8A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39860400002)(376002)(366004)(136003)(346002)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(2906002)(33716001)(85182001)(86362001)(82960400001)(38100700002)(26005)(41300700001)(8676002)(8936002)(4326008)(9686003)(6512007)(53546011)(6486002)(6506007)(6666004)(6916009)(316002)(66476007)(54906003)(66946007)(84970400001)(66556008)(5660300002)(83380400001)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OURsOG5lUURpVXBDYkp2aGQ1aExCMVdLcWhnOXJlLytYbGJTdkJuU1RmcHcy?=
 =?utf-8?B?YXQzUXFnNXA2Y2l0YmUrbkYwNlJrd1pyMWZSUzE5TUhaVS9VRUs2S21SMU5E?=
 =?utf-8?B?WnNhOWFFTTVENWFTQUo5R3FsTGZOa2dhc21JTGZRZGxLQ0JlU3F6MW03dldV?=
 =?utf-8?B?L1hlQU5WS1Y4RUkzbVJTNFVjNkJ5NFJyQ0NaT0lVc0pUeUduM1k5b3NSN2xQ?=
 =?utf-8?B?cTd0VDAzOS84dWlXd3FJSUg3OUdqQ252R0drYmh6aE5CNTFxZVdMcWI3Ukdz?=
 =?utf-8?B?RllaQU9pNStoeStobU1HTFFsQXlaWSsvdXk2d0xIOUZKUnp1NktDd1hxVXpZ?=
 =?utf-8?B?aXZ2QlppV2MySGVQNzQ1bEZXS2NpYUQ2UU1Xb21XQkpuOFhVRFBZNStsVkpl?=
 =?utf-8?B?emRabWxSaVptZFZnNzdUdDVrYUhRYkJtWWhkR3g3T2F6OEU2bmZRTXo3SVRQ?=
 =?utf-8?B?RGMrOTRKTDRDOHBvTHJXczJKNmZ2bVNlUERENStIOFczU2p4Zk9vSHVNUyt3?=
 =?utf-8?B?cDNQUmNvZEo4T1JXVHBwZ3hHd2hNUlg4NjNFMk1JV0VaTTNIOEd1c1lBcHZq?=
 =?utf-8?B?YmRoNkU3dzdnYkdybXg4bUx5U1NyejFkUmxUQTNSYWIyV3VDVENha2EzQ08x?=
 =?utf-8?B?SGVxMWVKYUpBbjBOSGM3dVZ4ek9FYzdRQUNLM0JFQnhWOEVvTFFva203aEND?=
 =?utf-8?B?OCtqZ1BxMGJCdTlIYW45QUZWU2hNcmFEc2ZBdXR3Qmw2YXBDZHozVEgwVi9P?=
 =?utf-8?B?ZHFuRlRUSCtDTnVKUEJPSG9VVENDZ1hIS2pwbE5SVXMwRXZyYXNjN3NlVXRU?=
 =?utf-8?B?eTdHeFk2V2Rmd0crdUt5b1h5R0l3M2lsN0JQRFJQNUFLaE5oSWVjTVhBa0pG?=
 =?utf-8?B?U1VTZHpoVzQzNXJsdFB1dWVEYzJpSTNSaXBMRllvMDZ5VkFqQmJFMmlkL0sz?=
 =?utf-8?B?TTB3bld4VHdyMjJFOVh4VDV5S2RVd1JMUkZWck9xSzMrS3oxK0ozaGxodUFM?=
 =?utf-8?B?KzMwa0s4YUNSY2hFcWpjSERYeSs4Q2t1MkFiWG1hdVBYK1d2VWRUYWNkVVRv?=
 =?utf-8?B?T1ZSNlFZWHdRQXRaRlg2QS85bm9hWEh1MWowVG9uTFV2M1hna3pGT1U4ZmYv?=
 =?utf-8?B?eG44Nm13M3poZ2d0dnFRcnJidWhhT2ZyYlJUWXJoalhYQ0s4MGl4SUJKd1o3?=
 =?utf-8?B?Q1ZRSU4xdURWQmhEblNBbHR2bEhXNTZlY2RLenpiUDU4SHUrcjJxcytVcVFx?=
 =?utf-8?B?WWRubDYvVk5GbkVBdzBQWEpyUWdReU1RNDJGMWZiM0pzZFJHWmJXcTQ1TSsv?=
 =?utf-8?B?L21LdFVISkI1YUl2MkdhcS85RERBMFF1ejFScEVjWXAvS0g2WWhHVHVZbEZJ?=
 =?utf-8?B?SndjR2FRU1Q5Ri9zNzNwbkZWZmo3ekMwNmNZYmpSVHRDRmduS3hMemN6Tkxk?=
 =?utf-8?B?bkFBWG9DWi8yMW9UQklwdW1WSzJSMVZnNHJ6QmFyVmNIMzIwNzQrWlFHRXZZ?=
 =?utf-8?B?SmFsb2lrWFRIeXdwa2M3WFZVa29JUW9YRFdmbTJoVlNsWXh3QmgwOXdUWEdl?=
 =?utf-8?B?ejJGczkvNllIVkpQZnpwT3lLVTNJb0VMZVNYQmRqS3BnekhTbmNtMzdEN2Qr?=
 =?utf-8?B?M3BUK3l6elA1RUdyMElNZXBBb24zRHgzVmltS3RmY0dxdUJoWG5OS1BvOHZK?=
 =?utf-8?B?TllpVDE4Y3BmWGU4endjQWxXT0pJRUwwaFFWTFp1dTdEaTdmTTBSR0RKVWRW?=
 =?utf-8?B?SUttOUYvTzFaa3ArOGl5bk4xQnViTkFpZEdwOHJMVm9lOEZCVHl5UnZhenMv?=
 =?utf-8?B?QlJqaU1WU2t4MXE3enVuWVRVMlVFRkIvbjZva3ZFTkdzZFlHelBqUWxFSVBS?=
 =?utf-8?B?aldHekNTdGU0UlBSVk84YnV4bVFoTFkyUG5XWURib3dYbjUwL2sxZXRseHlY?=
 =?utf-8?B?ZzZzQ0w3QXZHbitFQllVS1JJa2V5SVpiL2JhaVRJaGJES2t2Tlg4VnF6bER6?=
 =?utf-8?B?UlBkeFpVZncremlUNUFHQmtWRGNPWDg1Tk9CQnNWM2Q0dmtMWVJ0SXhjM3Ew?=
 =?utf-8?B?NHN3M0lOSG84dXZJZXFDbkFidVpQcVd4TnFrMWduRnMvcGVkc3lMVS9nWW1H?=
 =?utf-8?Q?SANbaRyD6kRcaLsZZnAGRXpCp?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/5QUVBS2rQefLaXKLalsLje3yt2HRtVy8kPPqAfbJN2v+3KKKaOMDYBxMZy/4cx379+sUzidzKXzg5wtY3pEIkoO+Qjn7b4d5fpD+IrD/+JmG3V+lb+XGsY5maMLLhEDIE3PTcgndgtJ8IQtyRpPVVBiTo2L5bCty1wlD+1Y3mWDGGR5AW/EhtcpSAHkZ8yDiU9N/gSh6Ukn8WXi2MohpejYMxoxyvVIGd89wLeJlgDpKvKetD7PI0r6fH09qkSAjEFqmlg3myazq4dTp9rBHEuGiu7qZAw4XfTzIIK74/h9NiIsQP015vI180A1vSVZLMML4RNpdPrQ22xYpprpZ+7yY74ihpRTxj9xTaxDR3oUFWztikykMvf2yzHqZtJP6WNneL5tAXrZzaSyFJI7d0s7bdSX1YutrnrtVdIkyBuDluk/YKg5h88/Lb8hVWUX4CqvyLtJZEppnBRydRhBmOqTqHxubsIVJZ0Q6AaqiU7G7zKBa3OXyw0PGZzMuaYuMCioWIFuTEUz2COUGMU9Hp+AT0zSkZqyL30CbWa+B0cAq2nx373qb39BPhltrdmtrRWFPJNJnl8WCaJC4ksnzjV/s5UdrBoQNkHsTS+QnKUvjt2FayiDwUPdmhEAgOK23efq6TCh4ADa2JFkx5HmnNLTS03+zYdc7shsZ4uNYZH+fAutyfzg1a8R1n/p4ge1hQVn2DbpDHzhXlJumFg8SA7PSg5QSrlmzgnj0Wc8a2onw3uv/5FxpcQKd/w5oq1+vI6o7wQRH+osYtjhAYVOQe60kThW6BQNI+nyiV5TTquhdC2M5Wofb8u1tIo5NPmBBmK6SkJ6j2aXrz0b8Ag2xxg0Cg7OgU8VgG4+fs6WsocTGnzmRNdA3012F1Z1k6yj+mLgd1fLxo6Sv9PZaae73FJ3fZraLz+fHqrC3lwhPPc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7be0f953-47ec-4fa2-12a8-08dbc4b2fa3a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 08:21:58.7721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lk1KA9FcoxPMLPE0S/XOwt+oCcmU43YGLIGLK8eLwjBN/zni8Mpb0sc/CoT54H97rw4RubSpI104gMNf5yYjzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5423

On Tue, Oct 03, 2023 at 04:25:58PM -0400, Tamas K Lengyel wrote:
> On Tue, Oct 3, 2023 at 11:07 AM Julien Grall <julien@xen.org> wrote:
> >
> > Hi Roger,
> >
> > On 03/10/2023 15:29, Roger Pau Monné wrote:
> > > On Tue, Oct 03, 2023 at 09:53:11AM -0400, Tamas K Lengyel wrote:
> >
> > Tamas, somehow your e-mails don't show up in my inbox (even if I am
> > CCed) or even on lore.kernel.org/xen-devel. It is not even in my SPAM
> > folder.
> 
> Thanks, I've switched mailservers, hopefully that resolves the issue.
> 
> >
> > >> On Mon, Oct 2, 2023 at 11:13 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
> > >>>
> > >>> From: Jan Beulich <jbeulich@suse.com>
> > >>>
> > >>> In preparation of the introduction of new vCPU operations allowing to
> > >>> register the respective areas (one of the two is x86-specific) by
> > >>> guest-physical address, add the necessary fork handling (with the
> > >>> backing function yet to be filled in).
> > >>>
> > >>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > >>> ---
> > >>> Changes since v4:
> > >>>   - Rely on map_guest_area() to populate the child p2m if necessary.
> > >>> ---
> > >>>   xen/arch/x86/mm/mem_sharing.c | 31 +++++++++++++++++++++++++++++++
> > >>>   xen/common/domain.c           |  7 +++++++
> > >>>   2 files changed, 38 insertions(+)
> > >>>
> > >>> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> > >>> index 5f8f1fb4d871..99cf001fd70f 100644
> > >>> --- a/xen/arch/x86/mm/mem_sharing.c
> > >>> +++ b/xen/arch/x86/mm/mem_sharing.c
> > >>> @@ -1641,6 +1641,24 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> > >>>       hvm_set_nonreg_state(cd_vcpu, &nrs);
> > >>>   }
> > >>>
> > >>> +static int copy_guest_area(struct guest_area *cd_area,
> > >>> +                           const struct guest_area *d_area,
> > >>> +                           struct vcpu *cd_vcpu,
> > >>> +                           const struct domain *d)
> > >>> +{
> > >>> +    unsigned int offset;
> > >>> +
> > >>> +    /* Check if no area to map, or already mapped. */
> > >>> +    if ( !d_area->pg || cd_area->pg )
> > >>> +        return 0;
> > >>> +
> > >>> +    offset = PAGE_OFFSET(d_area->map);
> > >>> +    return map_guest_area(cd_vcpu, gfn_to_gaddr(
> > >>> +                                       mfn_to_gfn(d, page_to_mfn(d_area->pg))) +
> > >>> +                                   offset,
> > >>> +                          PAGE_SIZE - offset, cd_area, NULL);
> > >>> +}
> > >>> +
> > >>>   static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> > >>>   {
> > >>>       struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
> > >>> @@ -1709,6 +1727,16 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
> > >>>                   return ret;
> > >>>           }
> > >>>
> > >>> +        /* Same for the (physically registered) runstate and time info areas. */
> > >>> +        ret = copy_guest_area(&cd_vcpu->runstate_guest_area,
> > >>> +                              &d_vcpu->runstate_guest_area, cd_vcpu, d);
> > >>> +        if ( ret )
> > >>> +            return ret;
> > >>> +        ret = copy_guest_area(&cd_vcpu->arch.time_guest_area,
> > >>> +                              &d_vcpu->arch.time_guest_area, cd_vcpu, d);
> > >>> +        if ( ret )
> > >>> +            return ret;
> > >>> +
> > >>>           ret = copy_vpmu(d_vcpu, cd_vcpu);
> > >>>           if ( ret )
> > >>>               return ret;
> > >>> @@ -1950,7 +1978,10 @@ int mem_sharing_fork_reset(struct domain *d, bool reset_state,
> > >>>
> > >>>    state:
> > >>>       if ( reset_state )
> > >>> +    {
> > >>>           rc = copy_settings(d, pd);
> > >>> +        /* TBD: What to do here with -ERESTART? */
> > >>
> > >> There is no situation where we get an -ERESTART here currently. Is
> > >> map_guest_area expected to run into situations where it fails with
> > >> that rc?
> > >
> > > Yes, there's a spin_trylock() call that will result in
> > > map_guest_area() returning -ERESTART.
> > >
> > >> If yes we might need a lock in place so we can block until it
> > >> can succeed.
> > >
> > > I'm not sure whether returning -ERESTART can actually happen in
> > > map_guest_area() for the fork case: the child domain is still paused
> > > at this point, so there can't be concurrent guest hypercalls that
> > > would also cause the domain hypercall_deadlock_mutex to be acquired.
> 
> Perhaps turning it into an ASSERT(rc != -ERESTART) is the way to go at
> this point. If we run into any cases where it trips we can reason it
> out.

In order to avoid possibly returning -ERESTART (which should never be
seen by hypercall callers) we might want to convert it to -EBUSY and
let the caller pick the pieces.

Thanks, Roger.

