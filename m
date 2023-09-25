Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2EE7AD647
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 12:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607784.946084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkj3m-0002DS-2t; Mon, 25 Sep 2023 10:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607784.946084; Mon, 25 Sep 2023 10:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkj3l-0002Ae-Ue; Mon, 25 Sep 2023 10:43:25 +0000
Received: by outflank-mailman (input) for mailman id 607784;
 Mon, 25 Sep 2023 10:43:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZBI=FJ=citrix.com=prvs=625423c2c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qkj3j-000292-O0
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 10:43:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 56d82bf9-5b90-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 12:43:21 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Sep 2023 06:43:07 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6504.namprd03.prod.outlook.com (2603:10b6:a03:394::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 10:43:04 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Mon, 25 Sep 2023
 10:43:04 +0000
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
X-Inumbo-ID: 56d82bf9-5b90-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695638601;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7kFusGlt5rbbuALiRW/klNzL05tm5XkRAjKEaR3cqa8=;
  b=XlWgmZQuv9gEER2IbVmjX0I9kC59OmSeQDDoeuHzRASR2xTe63GzHN/W
   QW6OFFgdDOmj5Bh5z67M7D5XCq4sfxWql0kjRZd7GPVBB28N6Co9cLY4A
   ro9I5YxC7fATsrRVt9GHy8HGBOEz/ajoQg2+kGIn5R5ESzmohOGYwAM9y
   w=;
X-CSE-ConnectionGUID: dFetQDXsQdG4e4dgG1PSEg==
X-CSE-MsgGUID: 3oRDcoeVQxiUnUhBmhZoTA==
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 126441645
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:KmYroq2tIsAIc4a7UPbD5fRwkn2cJEfYwER7XKvMYLTBsI5bpzMDz
 TcbW2DTb6rfYmGkct1/b4+z/EpTuZeEn94yTgRppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5g1kOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfDU9D6
 cU0GCs0Yj/fir66z53ictJBiZF2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PlmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv22LOTxH2nBer+EpXj8cRGi1qe+FUDCSAQaFuRpPmLjXKXDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHYDBeSwIAuoPnuNtr0kiJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:cPYokarUDV58b66SIikHQU8aV5rxeYIsimQD101hICG9Ffbo8v
 xG/c5rtyMc7Qx6ZJhOo6HiBEDtewKmyXdV2/h2AV7BZnidhIOoRLsSlbcKqgeIc0afygc078
 ZdmsNFebrN5DZB/KLHCcqDf+rIAuPrzEllv4jjJgxWPHhXgmhbgTtRDgaeHgloSBJdBZw/fa
 Dsm/Z6mw==
X-Talos-CUID: 9a23:kzDB9G2RTjb/EcYTGlxAQ7xfFu4obkTx/GzpL2DkBDplR5LMcWS99/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AKw8PnQ7KwEzK4su5IuK2dP/Dxowz5J6CA0cAr6w?=
 =?us-ascii?q?WuvSCCCxaPjeviwieF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,174,1694750400"; 
   d="scan'208";a="126441645"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrmI3aVcIgjoRUgXadVl/wHv3PuDSCKqNrn/q7mo/B1Zx3uCVButlePMNFMuuu6tnqEnahjWrQR/lt7ZVc1ZwD5VMR0+uq09jiF6+YbFnTiWmhWPsTNJJ2zrREQis78I7CLTcVc6CmRiSozGO2vD2aPi7RlwjF4D8GcrXGvJGh+r26oMwaaQjpBYZQ5UogXRfM61SxIL42DDhIJonNN0p77opAk6DdS9+g0hw57xftqEOlFAfWofrVHTOd8Iy+kH0ai/2LhyCu5jHORSzzEfG5ayMUdmDr08SfRbspfHXDcent+RK+bGZOE2P96IPTuqNLVvpzp9d3G15oSSrhAXEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORCbEI8BBtjtPNlF4mNzg/svA2TVVdrymuQPCD6BPsg=;
 b=ZAo1c4BKvjZY5byrr/L0bnmFMHFB49bDaVjFsgGjwT5fVL2QdZSK5HmkmllX/E4liKWN88h1Az0MziasfAqy7yogcioipbge7AW1R5Ua909tWtCfkAPk8qwyUm7Qym5cj6aKs7ChjRc0xEzteoaJ0VoJ/j9K200+Y3TeNTGogyDul9InHdk8Ggl5Fe7c/iLHm6UycVABDzCyw17i6aFcGq8jIT7+znQBdqIZoB4p2Og4sHD3ZREwJpkXga4pmVhlVa49ZXNlevi6yfwmjlGGJW+ofH/yOrxxdYW21osqgksGuUOwfBNrHfJQu3MZCKKeBe5ly3C2yWHwK+GL1mdRUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORCbEI8BBtjtPNlF4mNzg/svA2TVVdrymuQPCD6BPsg=;
 b=UcX7Uw/WJm8IZrkwH/CLNG0+2Hm3ivUZDiPVvWBKtuY7dpnFsnGgjNoITLYN0h1zI6z4gEcojpqBVP1To55yp8jqfHkhOYAl1mzQmuaKPtZ/A8/1QxbGWJGBKJedyv6NqZkdKDLW3Ov/qM/hOHZ5mmmHeZuW+/cKc18bZpDczB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Sep 2023 12:42:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/i8259: do not assume interrupts always target CPU0
Message-ID: <ZRFkMsUcaLuNJwHR@MacBookPdeRoger>
References: <20230919110637.12078-1-roger.pau@citrix.com>
 <2b600963-6196-d6c4-8ab3-ab142c323f7b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b600963-6196-d6c4-8ab3-ab142c323f7b@suse.com>
X-ClientProxiedBy: LO4P265CA0187.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6504:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdde917-f192-40ef-a17b-08dbbdb43268
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8ah1IR8RDMOdXja1nzvXJM/td0LLWHadf11rETWrbDN9aiC5Vx29pWmV9tNjEboppCrrtBK0ma8TimDwx9aLLGu7itvSejNqsc1l93U+PPTdwaFywkQqiL3jFda7Qf7KL94AoQO5GOTgpAfaQV04SjFlcSuWf+TTqx0JXw8MFp3r+bAYxKOC5Xt/xzdhqtlXEjEMJlT0sAkT/oMeR83Wk973YhiT2z3VDBV9x5m1BsVPfnqQFvdxn8sX69TXqCMVx7a6HzRpUUuSgP6Phw3oER8bpwWxBelsyZb+4dyZ7mniSY5EnmM/Fpc0P2h1W+7zPEaNdhtYA/R1ropWzno/ytHjXbwQC8saGu1375a3u4RXm9cJWgz++satzKQ+yNX4NrjsRt3VdDiX9Qg+9NtN5gI3L45ooxCneIODIQephrtYXizhxoaVT5ZYRSj08dkaU/UPN6+lk008wa8lKcMm/FNJjXsb21bo6GEwE5dB7wCMheOBs1nB+NDTkAe/PRs6fKnqFHyi0jMIsC/N0cMskKkJFYyoHowltfF/mGTy2aA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(186009)(1800799009)(451199024)(2906002)(85182001)(966005)(478600001)(6486002)(6666004)(33716001)(26005)(38100700002)(83380400001)(86362001)(82960400001)(53546011)(6512007)(6506007)(9686003)(8936002)(41300700001)(8676002)(4326008)(316002)(5660300002)(66946007)(6916009)(66556008)(54906003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGNBZXUvR204MWtxTFg4WitKMWNsQSszS3RPVW5NQzlZLzBHRmt6dVJ3Smty?=
 =?utf-8?B?dFJXTHBnWkx2SFVDUks1L2NzVGlISXovQVNjYzFhTHB5c1dJS1pSM2JSQkd2?=
 =?utf-8?B?MWIxVU1ISjFoaEp3aHFwUURYWlRGR2IvU3A0Y2N2emhmZGczVXlHT0RQd0tG?=
 =?utf-8?B?SzVZMG83amR0WlBKNmhDcGg0VnpQVFpWY1BSWkFyU1VpSWdRNy84c3o3L3Nw?=
 =?utf-8?B?S2I0Q0x3T0lXZ2dLOFRFcWlib2NhT2ZTa1h2WVhvWjFRVThCVG9qWlllVjc2?=
 =?utf-8?B?UjFYdFRDUVFwL1F1L1RDNk9zWTlxZk5RQytvRDkxdVlxVm9JaW9Lc2Y3azMw?=
 =?utf-8?B?Q3J6L1h0dVBlTkZCVXo1RSt3M2JJOVVUN2lYQkZ6cm0rY0JYUEZNbUxpSG14?=
 =?utf-8?B?MkZ6NDExTFB5eFFrT0R1QUNLdEkxWHRkNmk1UnJjVHBRN2tVUGhHellEMEp6?=
 =?utf-8?B?VVdxZ0I3akVRQ0RUQUo1SWhTWjk3OG5pWHlsTDJvTjJSdFI1ZE1QZ29OemU1?=
 =?utf-8?B?d25xSG9xODQ2VmszMjJGSkYyVVd5SG9JbEx4YThyY1NxbTg4K2VDUjBCOVA0?=
 =?utf-8?B?azhjdW1SVktaSW15d2pUa0pLTjJkRE45MldxdTF1dkhJbWE2WGxjRlBIYzdW?=
 =?utf-8?B?cXA4WGFVUFhFbll2SHUwRitJSCtOVWdZdDRwS0s3NTIrZ0k0SlR5MmxKQUkr?=
 =?utf-8?B?RkFocDBrRmdqN2NuRk14Yi9KL2tSZTNzVDVRUXpzWnY0bFBPM1lPU0RybU5M?=
 =?utf-8?B?bElBVTVqblV0R3BkUzRiYzEybGhDRDBNTnRsNjNZaFBCakZMZzNZMW1nSWhl?=
 =?utf-8?B?S0FVd0NKMEpyYnFhUmh6VlBYZWJZVnJ0RlFucm9xRTdLMzVJT2hEMmtjenZN?=
 =?utf-8?B?bUNzbDEwSDRRT3hXMEJnTGNjRUdUZEsxRmZlUnZKVE9zbmR2V3czdUo1RW90?=
 =?utf-8?B?dWtKcmN0OUdmQWhmaDZOUjNzektHN25jNzJnZHdoQ0Y4WlY4OWc5U1NWOWZr?=
 =?utf-8?B?R1gxWDJ6MFNIUGcxR1RIL2ZORkJQRlUrZVpFR1ZUNE1Hd2s1UW9pelNNYnBt?=
 =?utf-8?B?OXhMT3kwQTBuck9UOWVnQUxSN1F6Y3dlRFczWWJQYk1jOW9vMWdDdXMwNmFo?=
 =?utf-8?B?cGt5K2llLzdQU3ZiN1FKSUFrbmhTRXdKbHlyNVl3Zk9uaXRvUGQzYlI4NmVo?=
 =?utf-8?B?TUkvVVM1bzl5NWpvM2RmaUxkWWtjbkJYVStFUmJGejh5WDBjczh6M09UMFFl?=
 =?utf-8?B?MFUwSncrNFNYbS9KTHQwZHFWbFEzTGhWQ05ZcE5iY2JzN2c4TWJOM2F1Q0do?=
 =?utf-8?B?MVc3Smt0UGpTYW9lN3hySUVCdFIwaUtmcVBRZXVaeGlzWk1oK2JxREtxNjgv?=
 =?utf-8?B?bWxLMXlQbmwrVS9MVFJwa253ZzIrQ0RVK0h0S3VCWlRidXNwRmRERDBSeUhu?=
 =?utf-8?B?R0hmM3kvK0hZbDZlUXR6MEljR2Z4NHpQUXBFc2h4RFpIMXF3VHhXcFg0S2Ir?=
 =?utf-8?B?TkhjVXZLQUlPS2lLZS9mNDN5b3hvMm5QZy8rODVkWWNTZGdnbWUwSEhkNzJG?=
 =?utf-8?B?RU92WDRoMXpoRG5jS2w3bWZEZTNCT1k2cGVDZExYZEk2ckVuaGdzMVFsVlZ3?=
 =?utf-8?B?YkRtVjlEQS9SQ2lVV0x6Wm5SdjUyWFRqK0pseWhJT2R5bVF5cFErVzlYUVp5?=
 =?utf-8?B?MWl0ZCtpRHBGdWZpRWJXOXZITE1FeFZtNVd6Z3M1b0NUblVDRXRyYnlKNkhi?=
 =?utf-8?B?di9oZ2N0a25pMTNRcUt1NEExb2ZqTEZONFFhSVZ4KzFVbjdZVU1DT2lGN1Bo?=
 =?utf-8?B?WjJIOXJlSUM1dnErSXVMUXNQTGtzdjVmQUJITUxGQW1ZTnBrY2Vud0l3eUl4?=
 =?utf-8?B?SzZOeHpYdmJ2Ny9BTWNXQlhoQncrdUR4NmtEUFpiNEgzaXhNMlMwRnZZeXdT?=
 =?utf-8?B?REIxb1hxZFdjK3Z3RmoyQXhYcTloZERFSDVKSFNpS0M0Z1VueHczbmZZN3o2?=
 =?utf-8?B?M1FZWlFOT0FSbTN3RnhCelZnazBoNW5aOWE1WmZqWklxY0FucWVvSktEMEpq?=
 =?utf-8?B?M1JySUVlSTlTSG00eHhKS2wycjlzL0ZoWGxFd29OZUdRakhPdHlFNnpwYm92?=
 =?utf-8?B?NjJtNmpGbm9LYldTa3lSZGh4dEdmYkU1OHdHSW1GS0RHZ2xJTDgzRVNOb0Ru?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	seVzbpVa4Vfrz07FzCg7uTYzzM8reAWm+KywZKwRFMAEUVmiijl4HrwFWloVZckznhSM2ti3KTAa5Yvd3rqecpFaT8tp4S+v/BBtZWilDOG8YhMRl1bgVnSpMD4mCkZDET5Y+lxB64Hb6wu8rI1bxenbNysHZdDRkDM8ipLZpPy8I0lffIlLyOSOQ/RNOatm4Q1Pfqhuk3qf9Fodad7GCe2Oeo912djwkbY1Y1v+sv/1fGtDMFOwNrNCo8ito9A8fKPGwLyfGptO8HjRjdn8XtdK8Apv+bJI6+0LDJ8JL9+i/rfgAoVhgv5RR7YM7KgGZ2s0DC29vhLrNyrrPe/e6hqsNvc8zEeTZos4WhyvnqrPiEhSzqCfaou1u/Lsi+5SPIVoBt5JKuVFIXMG++LvCMHDAW1DsbGZBJihCLpKK3rttwHkEo55g8LPhPjCcvp+gydD9ND62ksgaujFT41Vd1Azi3rzXGdI87/91mBXYyzdp0KVP6CrJiF+VK4JZMOe1VRHdDnO/DtF07U7e24ORCRr+ZT4/bWVmHz1BYS+swpC3h5LGTtPiqlbOij7IqPzTIQvPuntvh513OWAZlQ97g/wUUotQ2jPi/x9mKQBmCV0PaO4Af1t9l5x7+1I9clsH4wU3L809ic/gJZIEW4JiWH10jc3lL3ZArDGrYR55CEzP3d149LPGO+JUi3egpT6dwI3I4gAkERPD1DeWy5IxTGXNkkA0OWADGgbiQ1YE2i65zNJbcqQBoGeTgkqWxGL9QOmXKE3iY2rJeyjgBLTXD9H43/TPY9paDsV21TZ7+NyR+32Jh3C0tsehraaIcRdhzwQFWGUAEua3JY73il0Rw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdde917-f192-40ef-a17b-08dbbdb43268
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 10:43:04.4164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqd/DFYtD8MxQLaynGUDVIwpmkybj3Jef9NaoDX6fsjZ5IC3PAGzHElL1P/skaS+MM24yrxdOFDp9EYYkv9ARg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6504

On Mon, Sep 25, 2023 at 11:55:25AM +0200, Jan Beulich wrote:
> On 19.09.2023 13:06, Roger Pau Monne wrote:
> > Sporadically we have seen the following during AP bringup on AMD platforms
> > only:
> > 
> > microcode: CPU59 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> > microcode: CPU60 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> > CPU60: No irq handler for vector 27 (IRQ -2147483648)
> > microcode: CPU61 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> > 
> > This is similar to the issue raised on Linux commit 36e9e1eab777e, where they
> > also observed i8259 (active) vectors getting delivered to CPUs different than
> > 0.
> > 
> > Adjust the target CPU mask of i8259 interrupt descriptors to contain all
> > possible CPUs, so that APs will reserve the vector at startup if any legacy IRQ
> > is still delivered through the i8259.  Note that if the IO-APIC takes over
> > those interrupt descriptors the CPU mask will be reset.
> > 
> > Spurious i8259 interrupt vectors however (IRQ7 and IRQ15) can be injected even
> > when all i8259 pins are masked, and hence need to be handled on all CPUs.
> > Reserve such vectors in order to prevent dynamic interrupt sources from using
> > them.
> > 
> > Finally, handle spurious i8259 interrupts on all CPUs and adjust the printed
> > message to display the CPU where the spurious interrupt has been received, so
> > it looks like:
> > 
> > microcode: CPU1 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> > cpu1: spurious 8259A interrupt: IRQ7
> > microcode: CPU2 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> > 
> > Fixes: 3fba06ba9f8b ('x86/IRQ: re-use legacy vector ranges on APs')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > One theory I have is that the APs at some point (before jumping into Xen code)
> > have the local APIC hardware-disabled, and hence are considered valid targets
> > by the i8259, but by the time the vector is fetched from the i8259 the
> > interrupt has either been masked, or already consumed by a different CPU.
> 
> Aiui with LAPIC disabled, IRQs should only be possible to go to CPU0,
> for there simply not being any SMP without LAPICs.
> 
> Did you check that there are unmasked ExtINT LVT0 on APs?

Yes, I did.  None of the APs LVT0 have ExtINT set, I was really hoping
they would have ExtINT set, as this would then make sense.

Maybe there's a point before handling control to Xen (in firmware)
where APs have ExtINT LVT0 set, I certainly have no idea about that.

Seeing Linux commit 36e9e1eab777e I get the impression that on AMD
systems PIC interrupts are delivered to any CPU that either has LVT0
ExtINT or the lapic hardware-disabled.  I have however found no
information about this at all in the PM or PPRs.

> And unmasked
> PIC IRQs? (Although, for the latter, it could of course be that by the
> time we gain control, they're all masked again, but an IRQ was in the
> meantime classified as spurious.)

Even if there are unmasked PIC IRQs (which is not the case AFAICT), I
would expect them to be delivered to CPU#0 because that's the only one
that has ExtINT set in LVT0.

> > @@ -349,7 +350,20 @@ void __init init_IRQ(void)
> >              continue;
> >          desc->handler = &i8259A_irq_type;
> >          per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
> > -        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
> > +
> > +        /*
> > +         * The interrupt affinity logic never targets interrupts to offline
> > +         * CPUs, hence it's safe to use cpumask_all here.
> > +         *
> > +         * Legacy PIC interrupts are only targeted to CPU0, but depending on
> > +         * the platform they can be distributed to any online CPU in hardware.
> 
> I'm unaware of such a distribution mechanism. Do you have a reference? (If
> I recall correctly, there needs to be a unique entity in the system that
> runs the INTA protocol with the [master] PIC.)

This comment is mostly picked from Linux.  See:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/kernel/apic/vector.c#n842

As said, I haven't been able to find any reference to this in manuals,
but given commit 36e9e1eab777e it does seem Linux has also experienced
PIC interrupts being delivered to CPUs different than the BSP at least
on AMD.

> > +         * The kernel has no influence on that. So all active legacy vectors
> > +         * must be installed on all CPUs.
> > +         *
> > +         * IO-APIC will change the destination mask if/when taking ownership of
> > +         * the interrupt.
> > +         */
> > +        cpumask_copy(desc->arch.cpu_mask, &cpumask_all);
> >          desc->arch.vector = LEGACY_VECTOR(irq);
> >      }
> >      
> > --- a/xen/arch/x86/irq.c
> > +++ b/xen/arch/x86/irq.c
> > @@ -466,6 +466,14 @@ int __init init_irq_data(void)
> >            vector++ )
> >          __set_bit(vector, used_vectors);
> >  
> > +    /*
> > +     * Mark i8259 spurious vectors as used to avoid (re)using them.  Otherwise
> > +     * it won't be possible to distinguish between device triggered interrupts
> > +     * or spurious i8259 ones.
> > +     */
> 
> You certainly mean {L,IO}APIC device triggered interrupts here? If so, why
> would they not be distinguishable? ExtINT IRQs don't set ISR bits, iirc.

Right, but we don't really check any of this when servicing the
interrupt in do_IRQ if the vector has a valid irq associated.

So if we assign the vector used by PIC pin 7 (IRQ7) to an {L,IO}-APIC
triggered interrupt, how would Xen distinguish a spurious PIC
interrupt from a L,IO}-APIC originated one?

Check the LAPIC ISR for each vector in do_IRQ() seems like an
unnecessary burden, and that would be a non-trivial overhead when
running virtualized.

So yes, it's possible to distinguish them, but I'm not sure we want to
engage in that logic in do_IRQ().

> > +    __set_bit(LEGACY_VECTOR(7), used_vectors);
> > +    __set_bit(LEGACY_VECTOR(15), used_vectors);
> > +
> >      return 0;
> >  }
> 
> Assuming no IRQs are handled through the PIC (which ought to be the case on
> virtually all systems), we'd have masked all of them before any APs are
> brought up. With them masked, aiui even spurious interrupts cannot occur.

It can occur if there was a pending interrupt in the PIC before
the masking happens, however such spurious interrupt would be handled
by the BSP then, as that's the only online CPU at that point (at least
from Xen PoV).

> Still you're permanently removing close to 1% of an already known scarce
> resource.

I don't have more arguments that what I've already exposed here.
I could try to bring this up with AMD, but I'm unsure this will shed
any light on the issue.

Another option is to not reserve the vectors, and assume that if the
vectors are used for {IO,L]-APIC interrupts some spurious PIC
interrupts might be incorrectly handled as device triggered
interrupts.

> Can we, if at all, do this just temporarily, such that later on
> the vectors can become usable again? (See also setup_local_APIC() for
> ExtINT setup - only the BSP would ever have LVT0 unmasked once we've
> finished with our setup.)

Yeah, I know, believe me I've spent a non-trivial amount of time trying
to figure out what's going on.

I even modified iommu_dte_add_device_entry() to block ExtINT on all
IOMMU devices (on the platform I was testing only the FCH had
ACPI_IVHD_EINT_PASS set in IVRS device flags), and I would still get
those spurious interrupts at AP bring up.

Thanks, Roger.

