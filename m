Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2235E5BE1A8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 11:13:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409273.652283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJr-0006nW-2d; Tue, 20 Sep 2022 09:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409273.652283; Tue, 20 Sep 2022 09:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaZJq-0006jf-Tw; Tue, 20 Sep 2022 09:13:30 +0000
Received: by outflank-mailman (input) for mailman id 409273;
 Tue, 20 Sep 2022 09:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X36y=ZX=citrix.com=prvs=255db12f2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oaZJo-0003bf-Pg
 for xen-devel@lists.xen.org; Tue, 20 Sep 2022 09:13:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b5dfc75-38c4-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 11:13:27 +0200 (CEST)
Received: from mail-bn8nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2022 05:13:24 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN9PR03MB5962.namprd03.prod.outlook.com (2603:10b6:408:133::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Tue, 20 Sep
 2022 09:13:22 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5632.019; Tue, 20 Sep 2022
 09:13:22 +0000
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
X-Inumbo-ID: 7b5dfc75-38c4-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663665207;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4YHFyNuqfTvwtt90VA7gPzi53dg5IfFg0G1iOCSvIqU=;
  b=UIbea7lo7Z4t/8nj7JTyRxPsrx6sPoKSbtbmflX/QnS09fJ1D/7r7oGX
   EE2nYoMIvnNXlzCrXyH3LP/QTakij1EbGgiIhZlEUM/jYt+vj9w7eU3Mh
   xcpx5EUbKD2xe3IDGk7MK0VVNrCQrMMOLO8e3yw0kaCfuBA0ggRoXPis/
   E=;
X-IronPort-RemoteIP: 104.47.74.47
X-IronPort-MID: 80891102
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AV61MSqxL6bO4XcjZ5Zl6t4n5zX3woTo+Zkaqj?=
 =?us-ascii?q?vDw7gybGU9jkrQqtRKur3SU3acG28CN/bdC0tmiH8aeK0I9ABMoUBUDFkQp0?=
 =?us-ascii?q?TuPRj6084WW7g6TtOVfilLI9t2LsSed3PuWywGNSbXSPedMwAv3/5wpVxrIt?=
 =?us-ascii?q?IRI+30NbWvdIrg0Lcyguj4d+LDcTCpjhukZyNvvE+MuDzMzTbL4bu+ozuKuC?=
 =?us-ascii?q?cH8fkxaGPJ97Kvf+L7KR12O8QIJxRUjEBG4T9cj9shrqUogTO8Zufk0WvtJZ?=
 =?us-ascii?q?2uH7SrD/0S2JSmvlPc2ZxyZuszWmAzF4In6G9Jyw/ZNtFjTk6YaOuw5OcqOs?=
 =?us-ascii?q?7FgHjCc+MNMeisagFD4Y8YHHQ03oNOgZNNFJQdTeuHjR+nZd9cXMJpp4FxaX?=
 =?us-ascii?q?Sh0X9m/dTAIsp+OD6LsXhyt+4iBWExU9sZqqoEhVgKShRcfouUrxsLWdV+4Y?=
 =?us-ascii?q?LNjeFW/ExdB3GszIymflhmZ/c/IJi9IDT/eD7ll235YtNUIe+c5vw1Kb3OGB?=
 =?us-ascii?q?JgrZFvYzsPNS7f4Huv8Gef10vReGGCV0ZWuaYbskrv4Ef3U3oUEABqMKDDv9?=
 =?us-ascii?q?S46SRu4zN/y0geGbTaP/az8QXYDz6fLfpL2+E857Q2uzpmhkV2Uj8bjR/yv/?=
 =?us-ascii?q?SllPF5cFo/DyBEibzg/9AjbCQZdUMc6wbMdaVWTNgROEjIog9bWxK40XDOxk?=
 =?us-ascii?q?U4VQZ8O51jnBfOLCdnDXrZHgNv3tRSwMGIGn6P8MsHLjB3E9ERUF1Yl45Xrl?=
 =?us-ascii?q?uxjEtLZotPUvxmkJkPMCTRAgDNlWU+uzX5rpC0wq+QOwmrs9v+ge2kI0A5Tp?=
 =?us-ascii?q?iiR12WTzolazV+UMnB3bMOd3yjeXrjkY0Wtg/9Ji7UoRw2uruIxgET5NrKM9?=
 =?us-ascii?q?FGn4lkWjk9eH0KgeNnxP6V31wcAetLwgVDw7Elfhmosc+VA4E0haTSsQ5ZEw?=
 =?us-ascii?q?O2/DbYMva4K+ThWpf/I9v/c8g0/V5qPosY1eFnQKZ9KPRZ5ri7spngUsFk0h?=
 =?us-ascii?q?i5OnXSkO+BZwaauWDjt0BX7Io4pm4CiUu/o5kxKidsZG3SZnuwPyxZ7rUH7k?=
 =?us-ascii?q?1IUYAh9fTwfk4j03WtrVaYat+QNIwGxCXeoL1/f0pAhSwtCCLqlpCbbl8u9c?=
 =?us-ascii?q?FpsNL2hIdJRcWq7X09MGLX4iyLM6DxD9Ldn26FbzWKNL/0rQz50sY++hGE1G?=
 =?us-ascii?q?cASWQoCDeneMTELAJB+DCCyFSrNE011vzCJ3agnPGk8W7tW+mhxBHdOmtDxY?=
 =?us-ascii?q?k4xK4K3CO7238E2ItacQX+bAH13K3UPapvJR4dlJE+3zcPlyeCaIROfwxzM9?=
 =?us-ascii?q?TARIMRA87gwxUpNz6aKcE3tuCJYLBjJbWjw6D9Qvg4HfSxy6S8RT3BV1e4EW?=
 =?us-ascii?q?Ks3j9/OnVHOIn6HJ7Y6X1ruI3KqXZkyCsdmLDfUPkD2WfrnbydBvu3zQRxIe?=
 =?us-ascii?q?3SwfJPLAr/tIvNmt4JNUQ/pI/FCm3AMRdi6VpGOojqru/KB+OedSKwOU+Qd0?=
 =?us-ascii?q?DDcwzN+OHDRxhVm44l6ouhf4t4R0pSLBgT01oOSsFT0fQbeKLDhJovHVlELp?=
 =?us-ascii?q?si/wzQbRIrq7KtCMCNMQMyjuyAkqbLlM2GPiBqzQ9BpBE4hUANpe/FNNu8mV?=
 =?us-ascii?q?HBxXsaC7RmIeol8ZS7eQDuatY9JQgzAxRj3ba4EdArAn76PyASllZ3p5tK0i?=
 =?us-ascii?q?+3SWTWgPq/BMBfLXu4ZsnD0gUeM0GyiI5jF4qAZWPuSXjZwHE0kqB6rAb+28?=
 =?us-ascii?q?2PZd2DWU862Ufe1jcE2hgIJE0t9CC6azxpK0sMuNeoPAOtLLlmby4XQHPlDa?=
 =?us-ascii?q?v8+QfAI/7Tzz76tfWvDRsihorijNCNzxY+iygZVn3S2YJ4zKBi8mhPyUrt25?=
 =?us-ascii?q?tn/NJp+mF6nXO4SN7RusYUucltIpzfNUtII1UazieB571Z7upPwNTKefabLo?=
 =?us-ascii?q?vFrb/fYl/m+fcVvvV5uUZl36WfM3eVHOFSCqHGt4aAnAcEfhqdzDyr/KnT9A?=
 =?us-ascii?q?QWxtClyqMiTBYQWnGw/o93EVf6QrYu68gWXuieuIDTZq7t3G3mEopiYnHZNR?=
 =?us-ascii?q?KoILXy/89PXtYnmkvf7K66awUb7RGhWJZxlJJ9RNQb1Ip2qCdi2kSha3dgUW?=
 =?us-ascii?q?3q2GpDA0BT/7AVI2pJoWgLYD97RywBrJY35sQPfdFCYBDz8tfroJitl6T9Jt?=
 =?us-ascii?q?1CaQo+OLAFF+azcQlqvsuOqNX61AVLje9vYTwDwplL7pQttA/EHiz67hefw2?=
 =?us-ascii?q?SfkECp1Tjqyb1KwCfarQspkvPKWtZbWQlD/DQKjLBBRJWyIvR4HFCjk2Vc7Y?=
 =?us-ascii?q?W+NTLFOmuXHh+0QSCb1BcIXHyVIQGhj5FpaGDeNzuwk?=
X-IronPort-AV: E=Sophos;i="5.93,330,1654574400"; 
   d="scan'208";a="80891102"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h50Pi9l9g+PoPScufzztxPXlUJa4NkSKs0rmuY8goOqt8jB5rhN30qkHpFrQ7R+sH22VgzPGpWbX4mgLu8O23PY6R+ybCPDPOOvsJDW9ZRV3EA7/84XTTCmpRu7jft+01zYgyqGnHlJ4+6iDJxlUm8kMH1BtXzfX7gAbpdd8zNQE+BWk7buSE/Ou1KuykcHmhzXVx//UdjIOPbmyNLa8ONvY991lExHHg4KMLglcVOLjS/60YoeiMJdrG/AE6cJzBPIFlsN7eU+fIzh9Z5IKpsyIrYLFZQDUMnk6PQz8kxnnUKLU09ogLgmr3749MILH+ykNPkqS2JI78z3rSsZKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diwGpH9k3jnMVvr7mPoh11vQ7FN5gn6CE0Gd0mSDnuc=;
 b=Mkr+nIYrxjoxPa2gPuZ1rFJKoaLfVWjB0GTWOElLn7jcaHS4bwPmJ1MZlFVkz32SnHhw2K6/ZSi968Oxf4kbKVyzCqmwb22X8ao4EhENfwRnAq+kHnEv+bRzJU7hccpmbeXyyTU1RsW0s0IkZ2EhcW1AyQl1dc+v/nGQHrmOp/kWMuvBFvbUwFQimHVvNnDvZsPJCFebVXRCFmAEUHieVKqt3+oXWrQ8iIQSzaWVGLqsRkTjTe26WRYQaLBOnFnEtLOzVm33Cnup2wohNS1wfp3E3v4aoRa0S923a58aArzreFoK2wKRFgtGC5JeHEzxeM4NQ8T1iifmlGYtCkiSpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diwGpH9k3jnMVvr7mPoh11vQ7FN5gn6CE0Gd0mSDnuc=;
 b=rBM0e2IDNFmfjPWsjrrM5adGspBJyv6T27/ckX3Urr4FTFzkTb9jzd0k0qNKNdf9BDSTuEBqNxdKfUnHZnHB0BEcYmhf8+EVXp0v9/8T98/1xWvQEbdXn5KvdUcxPc5sYL4MXS6IGauNGienDwaLOQ+LZ4kEtzN1KMILGYBg5es=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 20 Sep 2022 11:13:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Adam Szewczyk <szewcson@gmail.com>
Cc: xen-devel@lists.xen.org
Subject: Re: [BUG] problems with NICs pass through to OpenBSD guest
Message-ID: <YymEKZcc+kXyLOHG@MacBook-Air-de-Roger.local>
References: <YyR1eUfbq9aVSVXV@Air-de-Roger>
 <YyR7mIMh2htWkR7o@Air-de-Roger>
 <CAHsotTi=vf=6DVb0FPk5i8ncdKdEOvwYnirn+TLE-tN63_W-GA@mail.gmail.com>
 <Yyg0jeXc+4boQk/k@MacBook-Air-de-Roger.local>
 <CAHsotTj=AEO6wECMcFcFL6oLNtnuJ4-n5+DCOsPdCGkrVHLTqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHsotTj=AEO6wECMcFcFL6oLNtnuJ4-n5+DCOsPdCGkrVHLTqA@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0104.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN9PR03MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efcedcf-9ae8-4b21-3eae-08da9ae85d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yqgcKz5p2/idZsu/pBsz2AwhazUYO29o/tJ5BOec/0SCEyDhtc0YaCf0I5kR/nCczzd0riRkiCbiCxcqkUC0gTJb9ejX6GgldCvkMi4hvxlhqu/4RG/JPREsJUldojxgBl3PETwurz2BHIyHMmMFbiB9rDEeoXwNaeMZWxW9Q4TunI5/Yh3aQOjgKgL1E7uxE5XW1oj00sKBf65fif0KH89pX3wGzP5AbdWmbasr5SY1sicP98adEXleMayB/+/6W9+9gNcdcxjBCZcT48R1QWOioUlqA8i822/8Mgs3oUcAh7asiq6Wo0I9xCcPtGcwRg1apj5Vl4YS7wZPOLAbigsDHtrcNaFLbSTjBx9ugaUVr8C9SqyEiNmluhiPQktRVRIXeZHcKepula4EE7KG5c7HR+kDfaQRLlebLhOc3vsw1WR+h5J33DQvP+FDzi3ui6qyVyHXRKbS2oFb9VpvTg0iTShZJ+NfIjYrIbGMXxs3FO32vVl2MzSIdyoGPiV+ItVCnwwi/gsqBiJByih3kwjlIG23S6TV6Z3ngulDbmHYNkDFO9Z+vzak7PXlSm2OAWB3Jk7Szl8u7v1c86PbfDC1N84OWCxwSc5PvDRHEQkJ1SeQQugfAeeOSmJbxsFlEap6+addIfOXYJBHGvnU/qQy0VXG7zOCbuMMciOZ3IihQm1/6dv8/rQ5hplilVB+kiOXpfJ5nyJM26q++h7sRNwL5ovXpNNK4h+IQqU5FKwz39rXPFq469HVegnypKPq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(346002)(39860400002)(451199015)(6666004)(6506007)(26005)(6512007)(9686003)(85182001)(8676002)(86362001)(66476007)(6916009)(66556008)(4326008)(41300700001)(66946007)(82960400001)(38100700002)(186003)(6486002)(478600001)(2906002)(316002)(5660300002)(8936002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVVEc2FCNi92aWVzc1FQRHBPMUR1NllCV01XNExqcWl3enhqTjJpSkFENFVF?=
 =?utf-8?B?WWJTTjd6NXNQaFhyTW1kdkZoa05zaGwwT0lBVmY5K3hzMjUwcGRFYytYNU05?=
 =?utf-8?B?aWJPSm9idTE0cW1lN1ZCM1FJY2JMN1RrSjdHS2lqcncxT2E0TmNzWmdkUzhK?=
 =?utf-8?B?emQybUhicHdyQ1hBOXd4dkF1dGJYVWttb0FDQjRYajk2OVZSaWduM09HdDBy?=
 =?utf-8?B?alRPdjIwTncrOVZrK2dwQS9PMXlyd0Z2RkZuWVRRR3Nqcys2dnRpWWZMZmZO?=
 =?utf-8?B?dEhhV2xCUHY5NC8wTG0xSGRURllsczlmL1N3RUx5TDZlalBLOStsV1BrMVZU?=
 =?utf-8?B?a1dPQjkva3ZBYldsbkhxeDFSNEQyNWlLdDd6OUh3Y2xZWklZMzVZeTlIc2lG?=
 =?utf-8?B?VEFhR1A3VUl0clBOSkJRWU5IcFBxUlpHVXFuVnNaaVdBWVBCeEVDdEpwd1B4?=
 =?utf-8?B?WFVSd2hvWXRrc1BOa1NMSGRsYnUva3FkMTdJa29qY3JQaHp6UnI4cnRDYWpx?=
 =?utf-8?B?UmI1RElkcDRXSFRqT2N1NTlXOUJ3KzNvQXdCOHltNDJvVXlidzRTTWtJVWFs?=
 =?utf-8?B?cDZzVUVkaEo4ZUV3aXBFaDFtbiszenB2cGpLWTNSL1NQSDU1czNoanNqckpS?=
 =?utf-8?B?MmpPUWRzZFZsbFFBT3g5VDhNTFZYbWVxODMwa01mb3BYdnJORE5NOU8vT2tw?=
 =?utf-8?B?TlYrRlR0N0VvaE1lSy91OFJuT2VUNUlLakc2a05rbEszQ2JVRVA5RWpaRnhF?=
 =?utf-8?B?eHdORHhTZFNva2kyZEZRVVJLdU9YbWNPdnpCNk9jVUgvL3ptSnVva3lkbE1p?=
 =?utf-8?B?LzVSZ1FTOEJpVTNqWVBsckh6VTJZcmNOMWoyNm5sUGN5SXlETzd1QjZIN3pT?=
 =?utf-8?B?Mm5YaFZZWDhLU1RQK0RrcWNEamJPSXNaQnQ1V2g4UTlCWnVXaExMMmRaZUgr?=
 =?utf-8?B?U0NMeDlmRC9rRzJ6Sk1uRkw0SzRydW9pV2RROCs2LzNSMWRtZmROWHN5YlZx?=
 =?utf-8?B?TDIrRDB5QmFudlljWTVDZDBkdUREUUg2V1YxazBDSDFWSDU4OHhqU0pZSXV3?=
 =?utf-8?B?QVM2NU1oVXU2akhyNWltRmE5b0MrWnh4OTU5VGNOT0Y3QVRkYklUeXFBTVNL?=
 =?utf-8?B?cndTMjMxR2JiV29VSmxrK0NQZGlVaDFmL3pNbWk1TkF1dGtmSXRibGQrUHFv?=
 =?utf-8?B?M2dGeDYvUktkOStjdjg2dVFad0ZsLytDUnJDV1laVElQUHVnRDRNaWdXNzBO?=
 =?utf-8?B?UTN2cnJXY2I2dVVZU2xaL01oR0dsc1B3VkZwN292SEVhM2IxTnk2S1NXRHlB?=
 =?utf-8?B?ZllxSGlPQW5MaFZEcmN4ZlpwV1dyUGFvQW8rTE1TdUZSTk9xa0FIOEpVUmZO?=
 =?utf-8?B?NGxlNjErY056cVEvQjc1SE16VzR4VjVEZHQ0bk5LWlg0ZnJxemxxVnIweXYx?=
 =?utf-8?B?eC9jMWYwdVZLRERyZGhhMWNnRkJFS2tQaWFkTVdWSkJSTDFWaUpOa1hqNDh5?=
 =?utf-8?B?bm9idWY1V2ZwMU8rUFMrVkY1dFJxT1d5Sk9tUDFleWxqRm5Rc09YZDc4SkNI?=
 =?utf-8?B?dTYxdk9NN3hMc2FydnBHckxvT1plbEZWQkYyVldtb1JSZXYzSU02czJnUjM0?=
 =?utf-8?B?RWo3UHV4aFR3YUlhY0d2OUoxai9hYktMNDlmN0RVbTBWZWVCdXNNNGNUaGJk?=
 =?utf-8?B?ZzN2bThlcHFHbHpOZFZONkxmcUFGNmdWS2kwRjhxWFNNQ0MwSkcxOWh0dUZv?=
 =?utf-8?B?aDJ3K1FVc1Q2bzY4dHdROTdZYkZTOVJvMWhYVVZMVkpkMTRYamNtbEJzcnNw?=
 =?utf-8?B?ak9UNHRQekNxSDBtMlNrZWFzREhWbTNaWHZZdkhCc0p5MFhEaUxDdGEyS2lL?=
 =?utf-8?B?OVBrZGVFUU4zQVZPZFgyd1ViTHQ0U0xUQXZvYVZST3dLVUtIcU93dUVOK09Y?=
 =?utf-8?B?bU5kUGZ6Qkt2Mk1Fa29NZ2N5ajc3MkFySkk5NUVZRU16RHJ0OVI1TGdmSklp?=
 =?utf-8?B?Um8yajNLQ09rbEFQUWJiTnoza1gveldPaUUrQ0RiMUdYR2ZFeld4WmRCYjA1?=
 =?utf-8?B?eGRXdmxETXcyU3BXdjNyUGpRYmZ3WGhzeERLWkdaTVI1b3phd2hOYVNTaVVG?=
 =?utf-8?Q?8seFE1WZRPj+fOYNPByXKNwSf?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efcedcf-9ae8-4b21-3eae-08da9ae85d8a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 09:13:22.1590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JyhZuLdXKIEKY8F9dVwWqGdjz/L5cV2FG+WtS9CvtLnlLoFTr37tqXs/YYtHTt1uejRJolaJVtkSak2MY45vgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5962

Please avoid top-posting.

On Tue, Sep 20, 2022 at 09:41:48AM +0200, Adam Szewczyk wrote:
> > (XEN)  MSI    132 vec=d9 lowest  edge   assert  log lowest dest=00000100
> > mask=0/  /?
> > (XEN)    IRQ: 132 vec:d9 PCI-MSI         status=030 aff:{8}/{0-11}
> > in-flight=0 d7:151(-M-)

So this is the MSI vector assigned to the OpenBSD domain, and is
indeed masked.

> > openbsd-71                                   7   511     2     -b----
> >  63.0
> > openbsd-71-dm                                8   144     1     -b----
> >  14.0
> >
> 
> How I can enable install this debug hypervisor? I have problems finding
> anything about it.

You will have to ask QubesOS about how to do that.  I have no
experience with QubesOS, and don't know if or where they provide a
debug build of Xen for you to boot.

> I don't have logs with qemu in the name, instead I have gmp-proxy logs. But
> their all looks empty.

Right, QubesOS is also using stubdomains, so it's not clear to me
where those logs are stored.

For debugging purposes, is there a way that you could create the
OpenBSD domain without a stubdomain, and just run QEMU in the control
domain? That would also rule out whether the cause of the malfunction
is due to the usage of stubdomains.

Regards, Roger.

