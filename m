Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8462279E297
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 10:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601087.936991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgLZl-0004fL-4D; Wed, 13 Sep 2023 08:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601087.936991; Wed, 13 Sep 2023 08:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgLZl-0004df-1W; Wed, 13 Sep 2023 08:50:21 +0000
Received: by outflank-mailman (input) for mailman id 601087;
 Wed, 13 Sep 2023 08:50:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rq8V=E5=citrix.com=prvs=6130a4f39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qgLZj-0004dZ-Sp
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 08:50:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fc2bf21-5212-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 10:50:18 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2023 04:50:16 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5909.namprd03.prod.outlook.com (2603:10b6:510:41::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Wed, 13 Sep
 2023 08:50:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 08:50:13 +0000
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
X-Inumbo-ID: 8fc2bf21-5212-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694595019;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=eIDU9PvKz75Czn16vTOKBJuKw43RBb6VNLeUW+qszhQ=;
  b=FPIwz5B6J1k1Tw9wcGojFjzXdQLnVUG7Q2zY9eLdpMoK1QdIUxr5rfYJ
   OOjyae3vr5DprBLn6jk+SarpgjhYd39V5N1QPzWx5MFhW7apA1FspXIBS
   RzpQzaZ9JKsEFpz458qz66uBYnRcwiUDG/UWlOo/tME5Js/yDn621GMmI
   M=;
X-CSE-ConnectionGUID: 2dEA29GZQVKW+ncJ4SRh2w==
X-CSE-MsgGUID: tiykFE6iQ3Ole55qP3PATw==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 122908094
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:aMXM0q0mARbtjTmfh/bD5SNwkn2cJEfYwER7XKvMYLTBsI5bpzBTn
 2UfCjyPO/feamL8ftkkOY2z8EkF6pDSx9AwGgo/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8nuDgNyo4GlD5g1nPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfW21j3
 KZJBwI0UDO8xOS94u6AcOk2mZF2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KklwZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LWexXOjCd56+LuQ6v97g3O+mG0qUzoSWAbmuMHismeCRIcKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS9wWl2qfSpQGDCQAsVTlFZdornMguSDogz
 VPPmMnmbRRquaeQQGiQ9Z+Vqy2zIikfKWIeZS4CQhAB6tOlq4Y25jrDQ9NiOK+zkNzuGDv0z
 iyKrS4xnLEah4gA0KDT1UDKhXegq4bESiYx5x7LRSS14wVhfomnaoe0r1/B4p59wJ2xS1CAu
 D0OnZiY5eVXVJWVznXTEKMKAa2j4OuDPHvEm1lzEpI99jOrvXm+YYRX5zI4L0BsWioZRQLUj
 IbokVs5zPdu0LGCNMebv6rZ5xwW8JXd
IronPort-HdrOrdr: A9a23:C2nMv6pIIay6YP1ILqh5dT4aV5oieYIsimQD101hICG9E/b5qy
 nKpp8mPHDP5gr5NEtQ++xoRpPwJU80hKQV3WB5B97LMDUOl1HGEGgI1/qA/9SPIVyaygYUvZ
 0LT0A1YOecMWRH
X-Talos-CUID: =?us-ascii?q?9a23=3A0MZskmrelo9woQjWoVfhm1DmUZopX1SHnVjiGnG?=
 =?us-ascii?q?bNiVvQ5/JcmWQorwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A4IJvOw+LM3DmcVKYU5+gdiSQf9tp8qeAJR4MqM4?=
 =?us-ascii?q?hv8TZaDVIYA+0sCviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,142,1688443200"; 
   d="scan'208";a="122908094"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6f+hPsFtqOSp5i1hOco+JvxMnr8QqhPmq25ObhWNFNu1ug5vvaUxieBI2TFwtM0IFrOXSoiBTj2sWbSbI59Plw6TQsswLsRLG1gD3+/hfMVEtI+ElOkXHlmPlrqZ5fjOWrjsa9UL3/a0P7aKJAvxt9YKzjoyDTfYaSiZ/sTGQhHmLEgsneLaN5ftadfPtVIp5Lc51/9dyJMr68GDLUNB+SAhIYt2KTWyeYTY1nLMpWa52zNHLkD7txznPjnKYFtDVML68Kl+/PRBU353QoxNJORGroQFUO24n//QMc3e2vJn5pBSFqbptGldzkdz1kSZsSSv1C9hVNoSgP938vZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N72GyuoBH7n5uGDp7khnzBdKkWVb/LJ6+Uyvl92gzTA=;
 b=niGqT8DlQJndR+UusTM7eyphi7sRfuPbhwlvMF510JYUgbTKAXgxU31QBbHyBPADxwkH5XI4UpiE4z2FlFI2NotFleSQvizqHv6RScq9n9AOrAbeqE3nqDkxCuljSEGcdwX6DvUBDE1GD8yc/332XlXPFLYpR/KmPZUbo3+am86JBEoAnWOmLZ5Fn01vpiHcz8/ZT2hm3qmmgriD2G4nHNdmvKmHvZyAU4RNHunOKskCp+1pq9Iy3QsqC45Oy8vgtnihDY+MvTqO9DXvwnQqKi6Bv/jTB3JTlT35GsW+wltcIoeklSoOjGG3oGHsQ9YG2osH70ZaFZfYfoYNPNgsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N72GyuoBH7n5uGDp7khnzBdKkWVb/LJ6+Uyvl92gzTA=;
 b=FhFw9IZ/QgG0pnGuHr3p5UZ4MZeyshZW/Uq3C+uPfMzXLuJzxPSGUdOX3M/udrmfCZ1C0RLA1POdCYTPFXK+/2ZhY+MsH4ZkQGDF6Htw9j6Weba4KOalCDhYe0/WUfH9u55lD0dmPZslxWI5ziHLTXDvmEU2wBjsUBou4oendTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 Sep 2023 10:50:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	solene@openbsd.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Message-ID: <ZQF3vyCtF9lPaV_8@MacBook-MacBook-Pro-de-Roger.local>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
 <2cfcda8f-bd51-085b-997a-0ff31434d460@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2cfcda8f-bd51-085b-997a-0ff31434d460@suse.com>
X-ClientProxiedBy: LO4P265CA0115.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6147ae-1a8a-4ec6-3fb9-08dbb4367189
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uo8n3ojmdHqyf22RkLpEGn8InFBMuQq+apMrB/XHUJ1oS78D/zxPc1scn4XE4np1Bi8nG5fOu6yKREthPIJkDY1srNJIHioVhDpsw5THMtj+kHrGaVseH8mtJrV2YtVba3G37f1/v1zGOEEKs32f3DrxiEXrE4Bw8xNqWV7tgmtHNQFgjOGVPLJnYXfjpz+aiTwyHVuInGiRUH84g+4c6RckFQ+JywmWwtmeqQU4ZzCIfcxYzYWORkqv610vpKfvQhoTcwYRQB8nrEpuOpugbtwEW92S6uRo7NF+Emxg+6SPA/uraqiYodMOutBB5ic7QWNSr5CwjhIe9rUpXHC1ri3LKP/ArivsX4wGZhnsdd8ZpKNLJqZJo2pfaHs3ELnCD+yGhodjDAWEiiaBUuD0timTakXubc0UTNeKTtlK6Fa/SolCtDyorBbhKXWDILUxQwgPdNxDBxwTxL2thR1YqkBkGirI9h+T0wfkYRasmTZlpp58K2bsIldGo2csYvlc/ywxoJLm4G7gRt+/+4DGKjmP1SjLHX92FaD0Lhf9Ji3WQfzAf3gwIdgMqlt2i6ye
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(346002)(39860400002)(1800799009)(186009)(451199024)(53546011)(6506007)(6486002)(6666004)(9686003)(6512007)(478600001)(83380400001)(2906002)(26005)(66946007)(66476007)(54906003)(66556008)(316002)(5660300002)(6916009)(4326008)(8676002)(41300700001)(8936002)(85182001)(86362001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZC81RU95dTg2SmxQUGUzaWVxMFFueHVpVVM1dm9tMy9YNE9CWVBhNkhQeGhU?=
 =?utf-8?B?T0VRZDk4ZmdRV0ZiVWVtUVE0VHVqQ0E5R1lqSVVsUXdTbkFUUVR5Ui9sSGkv?=
 =?utf-8?B?bTlRREFNU3lFT0RZSi9peWxRNWFIa2pOemdDdzVQMmwrWnFFY212amIveXJs?=
 =?utf-8?B?eFlMdXV2dXZ4b2ZGTXR5TTNRNlFiakZOTVgreTR0VkorbUlnN2VZaDE1WEcz?=
 =?utf-8?B?cGFjQUgvS3BjUTRoUUM0bk1ubjRtYVZZOU1LL2poR2Vscy9JWis5eXZoNnNu?=
 =?utf-8?B?OG5TZnMyVXNGSEFGcnVNNWRJRysyK1VXVDVieU5yNDZMQUpnck82NDQ1aWMv?=
 =?utf-8?B?MFVSaGFzdUdYZldrVmw1YXk5Mm5OQW4zUnRHSld1NDZqdC9xamx3dUJZZXBw?=
 =?utf-8?B?VWxKcUtNY2x2cG5aa2tqSnZLdXNUbDRCQ1hJaEJJNHphcm50cnNEd211Vkhk?=
 =?utf-8?B?aXRhTkt1dkdxbWF3M0owM1c0NnJLakVvZktmbFp3WDJtMENiV242ekFpeTFw?=
 =?utf-8?B?U0FkVXlGZUN1SFdialdTaDlRS0M3c09sb3U4eGdmU21KVDhlMTZnR1R3QmYx?=
 =?utf-8?B?M25SU1FFM3duWkYzQXdMemNCVlIwOEExbE1ETTIzUnlQM01WeEM4M3g3Ym45?=
 =?utf-8?B?aW1zSU8yQ3ByU3VRUEVzR0krREtUYlNWRHRLR010aHZoV1NZK2ZNNmdDTHJB?=
 =?utf-8?B?TVgwTStwY3JqcWxkQ2p4ZHM5S291QUpZdW9YQ3lHQkp1NkE3REJCVUErS1cv?=
 =?utf-8?B?bmZ1dzkxTS9IdEt1SmFwMDFMLzdSTldyemNqVGgvUWRzR1Z1aG9IYkNPMllG?=
 =?utf-8?B?aXBmN2lFREJsQ0FFT2pkYnhWNUpsVlFPSk9ZenFpRmFWZTRUd2dtNFI3dndI?=
 =?utf-8?B?SkxXU2Z5M2xWRGcyUlZId1JvekJuRmNSL1FNTEw0bXBWSG5EZDRqYUpMWEZL?=
 =?utf-8?B?c0wxSUNhbUpZdnorMU9EMkdLVnVDOHhpQ281aCtmNUlXeG9VaTRBSTBOVm1n?=
 =?utf-8?B?Q3p4Qm9KcGxmc010WmFTTnNtTWFQNGI5aHlXak5WWjJPNHBnR205TzJEY0xT?=
 =?utf-8?B?OGNIRzk4Y3ZWN0h4Zi94Z053d3hEQnBoTDRsci9jNnNCWWVYYjRaMnNNR0s2?=
 =?utf-8?B?UGVWeUdtdFpDbHhaMS9SOExGQ05WUzViWGNkZnZWb1hYNjZOQU5kV3U2bG44?=
 =?utf-8?B?eUttM0lDcmd1anJYaGhZZE5xWFE4VityckJtZm9HNUlPaDlxMThGOUlDYklw?=
 =?utf-8?B?RnA4WEsvaWNkNEFoTWsvMTVHczRCOG9odGNXSEg2dDJFdmgvU2lwaEMvMm1Z?=
 =?utf-8?B?ZlFCQ2VYNHN4N0FXZ2VoelR3amRweWMyV2daVHBiNE83cnFZdStNZWtpNWxN?=
 =?utf-8?B?d1l0L3Z0MlYrV0xHaE9sU2loUEhKR1NKTVdQZ0FCd2RhbXl4OEIyZzNxUHRt?=
 =?utf-8?B?YkJmTjQ2bjFETUlkWGgyUTBOZ2l4M3JyQlYxdDZGYS9rSTkrZXh1aTd5cC90?=
 =?utf-8?B?MUdaOG1lM3FTYjd6end2SlVmbzB3WHhxTFhlYzBMOWdDQkJnRldpSU81VzZ4?=
 =?utf-8?B?bjhIRGdoUkdrQWZ0aFZSSHRuSDBDQTRJU25CZ3d5eC9GcExsS2xpUXJBWDJX?=
 =?utf-8?B?dVZIZmhKemc1c1BxV242ZFNJY0FpaVdFMm9JTHVuNEtML0Y3UW5xWXc4c1dW?=
 =?utf-8?B?a3JpNTR5cHpSRTFqWEVKYmVZY0JvM0hHR1ltN3F3cU43dlkya0prNHdJa21z?=
 =?utf-8?B?cFFWNmo5Q0R2dFNvbkhCR3IwOG1QSDB2NFQzV1lIcTBNMG0vVEZmVmZLOENs?=
 =?utf-8?B?UTIzeDcvZ1dCWGV0bE8yci9sdmF5VWJ0cXJvVG1uUmFDVkVZQ2JncFZaZjZP?=
 =?utf-8?B?dHg5emQ5MG55NVYwQlBxV2dZWTQ1SWFENFBSZDVPUFRsR2VxUkVYOXViNEVN?=
 =?utf-8?B?Ui8rdEpPTkdOb2hybkhPWEVjQlhtbTN1eVpEY2RKN3lSbHA3SkNpU0xMRi9n?=
 =?utf-8?B?d2FPRGNnQXpTWVFWbkRRWkRQU2NpSmQwM3ZmeWt6SkhVSUhZLzVoM3RyWHA2?=
 =?utf-8?B?Smd1NVVsMmt5NFpFWDFGZ0ZZWWJxcjRtSzhHSTJLM2ZvLzljSlB4RHZEck9t?=
 =?utf-8?B?QWpvbHllVll4aitGOWhWdEVJb1dBaEpNTHkxT2dwalFqaE1tYm1hREpTMnJX?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PXfNAU4LOcZ/LYcm85c+QdQWXetnZ/W72cAn2D2EXFu1DQcRKLDtEFObL0OeL/dWYCWMWh9eeWOW1Y4kBNyujFQenFct9Xgrt6wQpKuoa+aj4PEQgU2n0ngRxlXLBvLTby+qDm2KctuNF0a1q5zhDkGJwwCoyQHVYvBDvYvD5MY31Yyai6NodU8fQr//b9XG8uqogPn2O7dYEOzcQx8vJO2TSxiB/CYpTrts2naoA045yyJBCXTEByLiyOcu1U7VcKkqWxkg9RYcO2zXlnWZimlZU/dO2slTyWh05Bg6vRrFysTNP+GNobxpFofivV1EgUH3MAo/yyscebOoIc2I4Z54blZp+ewHo6r1j8uX+rc8LOdNB7LOc7r7uyH5dV/uB6A+5Vnm+DrJHMwAFg2M3Vu5oQC9q0K6o2rka5Oka5KsnneVDFm/zSUibx0JyZ/56dJjpSEIrpKoBdOzuWO3VDIVwxOjgAxyy4H3EluSR4LGq9sXAGy9ypR2pQogeGQZX2EQNbSLQy/drgMu+O4dHyZy0pPTKwY5QQxr4Aqok8A2eecVVsQQlspY3N9YIDG/XzuPgLbrEB+uw/PK3re3owGxNJ7mxPpzyIYwCYItsRbueA637m7kyf++lR9DT29PYF18TSGYPj+/PA4LzmkuS0eiNQ+KJd8aTW96+m5kRqS49mI1qzlunUGMRjJmcmFfbAbOmete7EjyixF62K1dhgSVIHSbLv54w8ypiV6LkBFSy5aeKKoEwpKZxS5gFF4S4aF8Zwir2yCSXghi0zvHxvqPhcVrqrUgWIC6pDwR7tA+UxTeOfcd/8CUHKwQ6XX3++ng+Ew01yB6fSAJ2KUOHfyeKBAed2QxkqSW5a1lnTj/pA3bZ/cikcRPS5KgoVWylCd4hzXd0zMKNbMG+KKf2VcDZHev8dMFlnyXUQ4PNwo=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6147ae-1a8a-4ec6-3fb9-08dbb4367189
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 08:50:13.1854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Blqh5YQJq65xGsZd8WUgt2b/vj4ii/8fGpWDKwRRNYxElqFaRvFZAu+q7AdJUc3CARLwQgZ6MNuk+e48y1y2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5909

On Wed, Sep 13, 2023 at 08:18:57AM +0200, Jan Beulich wrote:
> On 12.09.2023 18:35, Andrew Cooper wrote:
> > On 12/09/2023 5:23 pm, Roger Pau Monne wrote:
> >> --- a/xen/arch/x86/msr.c
> >> +++ b/xen/arch/x86/msr.c
> >> @@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >>      case MSR_K8_HWCR:
> >>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> >>              goto gp_fault;
> >> -        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
> >> -               ? K8_HWCR_TSC_FREQ_SEL : 0;
> >> +        /*
> >> +         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
> >> +         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
> >> +         * also poke at PSTATE0.
> >> +         */
> > 
> > While this is true, the justification for removing this is because
> > TSC_FREQ_SEL is a model specific bit, not an architectural bit in HWCR.
> > 
> > Also because it's addition without writing into the migration stream was
> > bogus irrespective of the specifics of the bit.
> > 
> > I'm still of the opinion that it's buggy for OpenBSD to be looking at
> > model specific bits when virtualised, but given my latest reading of the
> > AMD manuals, I think OpenBSD *is* well behaved looking at PSTATE0 if it
> > can see TSC_FREQ_SEL.
> 
> I'm afraid I'm still at a loss seeing what wording in which PPR makes you
> see a connection. If there was a connection, I'd like to ask that we at
> least properly consider exposing PSTATE0 (or if necessary all PSTATEn) as
> well, with zero value (i.e. in particular with the valid bit clear),
> rather than exposing a r/o bit with the wrong value, upsetting Linux.

But PSTATEn is also non-architectural, so the bit meaning could in
theory change between models.

There seems to be no bit anywhere that signals whether PSTATEn is
available, as it's my reading that you can have PSTATEn without the
architectural PSTATE_{LIMIT,CTRL,STATUS} MSRs that are signaled by
HW_PSTATE CPUID bit.

Thanks, Roger.

