Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BD855B9AA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 15:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356587.584823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5oMa-00035H-55; Mon, 27 Jun 2022 13:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356587.584823; Mon, 27 Jun 2022 13:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5oMa-00033H-0Q; Mon, 27 Jun 2022 13:01:12 +0000
Received: by outflank-mailman (input) for mailman id 356587;
 Mon, 27 Jun 2022 13:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVBH=XC=citrix.com=prvs=1703a0240=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o5oMY-00032Q-K4
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 13:01:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 310ad472-f619-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 15:01:01 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jun 2022 09:00:50 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CO1PR03MB5842.namprd03.prod.outlook.com (2603:10b6:303:91::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Mon, 27 Jun
 2022 13:00:48 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 13:00:48 +0000
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
X-Inumbo-ID: 310ad472-f619-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656334861;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=OduBG/jg/vB7bQWMij9E7bTxnIdPn0377v2JGq02Xec=;
  b=OdpVgRZg2tOIht8tcYitoa+r7DXAg8qxevhl0kZ9b8I5PUHaTjUDBwrq
   YXj/lObfFdD3vHY8JRXqKRCsh/OF8OhE+VJ/8TTAGmCMTGmuy1FM/i64a
   fw3B3eJmh4gpzdgcGZI+BaMjVXcersCs8ltjf0pu9wUT06UpkZSD79lmC
   A=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 73826371
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:56jXQK7FOVV3yiyKg0+VVAxRtM7GchMFZxGqfqrLsTDasY5as4F+v
 jcdCD/QO/+NMGukLYhyYdi1/RlV78KGnd83QAtp/isxHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjXFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSaaV80P5bBtN43DQsfGQJPHfVt8ubudC3XXcy7lyUqclPK6tA3VgQcG91d/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfiXo4YHhF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2ID+AjL/vVui4TV5E8pgZ71CtvuRuGHZ8dlkky+u
 2380U2sV3n2M/Tak1Jp6EmEhODVmjjgcJkPD7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsLmQxSyrXqAvxgdc9ldCes37EeK0KW8ywSEAmkJSBZRZdpgs9U5LRQg2
 0WVhdrvCXpquaeMVHOG3r6OqHW5Pi19BVEFYSgIXA4U+e7JqYs4jg/MZtt7GavzhdrwcRnyy
 T2XqCk1h50IkNUGka68+DjvnDaEtpXPCAkv6W3/XG2/5wd9TIegbp6v7x7Q6vMoEWqCZlyIv
 XxBkc7O6ukLVMuJjHbUH71LG6y17fGYNjGamURoA5Qq6zWq/TikYJxU5zZ9YkxuN67oZAPUX
 aMagisJjLc7AZdgRfYfj16ZYyjy8ZXdKA==
IronPort-HdrOrdr: A9a23:ioafdqMehqIyR8BcT1r155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq6z+8P3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtr5
 uIEJIOd+EYb2IK6voSiTPQe7hA/DDEytHPuQ639QYQcegAUdAF0+4WMHf4LqUgLzM2eKbRWa
 DskPZvln6FQzA6f867Dn4KU6zqoMDKrovvZVojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv2445NkNXs59NfDIini9QTKB/rlgG0Db4REoGqjXQQmqWC+VwqmN
 7Dr1MJONly0WrYeiWPrR7ky2DboUMTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp+6Z/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wUR4S0LpXXt
 WGMfuspcq/KTihHjDkVyhUsZaRt00Ib1i7qhNogL3X79BU9EoJvXfwivZv3Evoz6hNOqWs19
 60TJiAq4s+PvP+TZgNcNvpEvHHfVDlcFbrDF+4B2jBOeUuB0/twqSHk4ndotvaM6A18A==
X-IronPort-AV: E=Sophos;i="5.92,226,1650945600"; 
   d="scan'208";a="73826371"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUueZEcdHtEtLc7bk1ae9yNJCbW2BmFGQc0nJA0dE7s/OkOlP3wCx/P+CP7AQK6tK9ZtlS2R2l7vUVSlcLPKb/HJmmkW+XWVq/dz4kfVIvG4bZBBaa/OJpSfjXJAFPJSGhZfU+dGixhCop6gKSmRs/g0JeXbf9R9KWYrdzltufbD/eOn9E965Dh720F+YG39luOSWqST7nBJmIiI49oB0OChOxxde+tesR1PMA0o5dRfZ1G/DEoRgR7EOtls8VjjLpbuv1HB971QlKB9HdwwTjpTBUoGo/Nw/mjVrcxK2nQgs9D+eEd2jckCGYc/mV3RNMOPJ85hxbNnJdUbP4wIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSXkb4yNA8FmX5diu9PcRef5S45fTEAnQSpEMy9qVRo=;
 b=dGWx8TjAVr6gUYEl1lg9RdB7wjYnZv642KR408HLuOcmo2mvwqECZl6pVK/H7dZbH3k2cKb7u0/qCxiT9gdOZ4o2WI/a9jxYorfwX3YcvHEYCAMxrRga1PuQHVNz10jo1Gy3YUJytNW71HEUJQ2KrRuKw4TEahcmjXTGde90idx/mVteDKvzRozwz+Zas2kVvPBvyKMmDS4wHhPxD4wKZoA7lVEJI3bJNwJCFMGpJIWo1VaX4NIu92IWaqCmx9w2J1vTJP4Xl7YNs5e+BkOqg+zsPMKsUN718LYwDe5fzKVmwBpyOjHRWcwPhTU+AWxJNAgANOz7fotNogQ5n+FGVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSXkb4yNA8FmX5diu9PcRef5S45fTEAnQSpEMy9qVRo=;
 b=d8zrW6/BZgXqBRT86t0d+g3UZxiQwXZ9CU/ahrib3gdDZxVnmmlUfaYOfv2xkEhjuxSSvafqjLU/WPr2qyB6Go3Dnrdax+jbwLqKw3dEzB3pvfb0Q9aPoHs1Tc4pSOU2Td0wBiyT6SvJbwxuZUpvi08nO7tHl7AN6OlsSL1TFX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 27 Jun 2022 15:00:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v6 1/9] xen: move do_vcpu_op() to arch specific code
Message-ID: <Yrmp+74f8aFhl2V5@Air-de-Roger>
References: <20220324140139.5899-1-jgross@suse.com>
 <20220324140139.5899-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220324140139.5899-2-jgross@suse.com>
X-ClientProxiedBy: LO4P123CA0542.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6004aef2-0728-4529-d9d2-08da583d0e74
X-MS-TrafficTypeDiagnostic: CO1PR03MB5842:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YeBAGOcBwQ4r/I2YShh9tTgD1K+cNNpEnjfAqTKnhNpSPxXmxH3PxvD819VyeUXAv0yUwvyjhI+LMg2UnEUKwOROeJVEjSQA9OuKwS7rw2ELdliWnyS2owqC36x6t9RgPdMvT0/yAeEVOV2HyEc7bivBiViBo/mdRBByTMjbgS5mk/1HWSWgCAN7TDPy0j0ybqvx3ME3z1cEW8zSkdOBBe42kR+ZM5LiWOV82XKFAVNHpQVFkMgQGIpNcbyDMUrhHVxs5GcMs6RJunAKJZ7u3NPh/XQZeTRiXTl2ixiC+uky9TzqymTrv5KaSC+UvD2amNauUJQLuHkijSwEEzSVjZEGK5aX4IwrxGJM3ugB6h0K0s+O5HPbslcQWF2iqmvUrnenHOJZ/vebbwYTDr38No2p1HwCaXSEinScPA5YT6wceDa1cMD/7f6aAQ19jG7nVDiW07Ly9UwS5LWyPoX03dSl7n7jM5lLj8PHIOTZQpLH2cOCstTUkuJNsQfbBgtBt8ibxPfx72RAqJVc8nwIRhzOHmWJdpuD2RiMwbdS79im54QlMDsePxzV0Gq5KF4n3hlvaioRUbc8rdKCtNXylmDgqTI07NTy91g0rHu2fUj7SzCZoTA4gRjjqQSwT985M3NEZ1QQ9u9tUTiBJ6GxjYoT3t5VJ1dfv+nQyIHwhPIVhlFnW94vQbLIL8y5PSiJa8H4yWbrIazu4l+R3XfrYL9Y98evdCzlHGuIHkqYcQ+jvizRHF0FqWDpG1/ds54XM41R3zK8EQTkJOwKZZz4gOaVgS+zxUiUxca7qzmFQVM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(6916009)(86362001)(26005)(83380400001)(9686003)(38100700002)(6512007)(54906003)(4326008)(85182001)(41300700001)(316002)(2906002)(186003)(6506007)(478600001)(82960400001)(66946007)(6666004)(8676002)(5660300002)(6486002)(8936002)(66556008)(66476007)(33716001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2lpdG4veU40a09hLzcrTi9iNkE2a3BNWTNRKzZ6UndnODhKcmgvemI1N2lG?=
 =?utf-8?B?V3loemNQM3JpTHY3aXRMZHpmZ21xWHpleHd5dmNzaVUrQlVDd3psYXoyL2xB?=
 =?utf-8?B?aFpuZS93dWtqQVpPNFg5enRiODNKWU5qOVYwYXNrZHNDdVlra1JjK2xUNEVw?=
 =?utf-8?B?YU9WUkZGQVY0dXRuc1RQTTFiMTdJcnhCaDZSamVSSzQ3NU9UQ0dKOTRTYUhK?=
 =?utf-8?B?Tk5tMG81VDdidXp3N214OHRhcHNHWVc2bFlqbHd5dzZVL2JaenZSamkwaWNJ?=
 =?utf-8?B?VXVhOFR2TnczSHFqY0FQVUVkSUQ2YWd1MEVLTXpoL25DSmRLaGt5OVoyTDNq?=
 =?utf-8?B?Yng4NGNha05VcHhZSm9vK3BTMXphb0hzTWdIMlNsWjRXUitoWkdRR251UnRa?=
 =?utf-8?B?dkxrVTJWRDFHc0hlRmJCV2tzWmt2MStKM2dqVmlOVy9nU0ZLcnlBVFVNdk9V?=
 =?utf-8?B?TWF6bUZXVVgxUnRjYXRCRHhGL0NFYWh2WTdobksvMnFFNS9lMjYvQWc1S0Ni?=
 =?utf-8?B?SVdPU2NTNGo4VUFwa2ZPSnArSG9ob1lPOFdmck1DL0xEVDZSWWNSRE1RYlJh?=
 =?utf-8?B?NzdlM1RKMlNkMjdTc1NYbWNpb3kvT0JDeDZOazg2ZzlnOHRWNWZGWVpJMEN0?=
 =?utf-8?B?bXYvcHV5Y1ZHRG9HdW1xMGR5cG9kNytMZTlyT0o4RXpsVENxZG5MdVp0a2F3?=
 =?utf-8?B?bGM3eXV4L2hPR2Nhemp2d0pYSDRsR2FNNU9aSkZKMThYSEF5RStRbStIZjVy?=
 =?utf-8?B?NnJpbFdXNlR2cnBNVzAyWnFsd0w2REI3NGpxK1dGMGVHa2dSWTQ4M1NEK204?=
 =?utf-8?B?NlcxMWc4cHpFRDk5bWtmNFpLd21LUGdWQjY0djNTbHF1K3ExUThTREFENm1r?=
 =?utf-8?B?c3J6clEyb3I3WjN2SXRCNDhuSXVBVTJkUWFtT0xxNkNWM3Zhd0ZYckRFVnhE?=
 =?utf-8?B?dXFldm41RGRnV2JaWHh2czJSdzBVc1h4TzltNlROenpXY016TEUrOTFBckdF?=
 =?utf-8?B?Z05zemoreExzSW1GQkpCa2diQUppVmY1Q0NTcG9WdUZ0RlZuVVEramFEUmtH?=
 =?utf-8?B?b1BjemZMVExQQk9qcjBiYzJtTGYzbDdoLzBLZVJSVTBVU1M1dWtENVpKMnBT?=
 =?utf-8?B?dzh4MHdsOTV5QVNhRHhjaVVSMGRVaXNIbGlYZFJwd2lJQjM4Tld0aFEvWCtz?=
 =?utf-8?B?dldwckNoNDQ1aDNEUTdqMVJrNFFQbkhSOTl2ZlY2MVg4bVl1VW5RYnpBSEo0?=
 =?utf-8?B?akNIL0ZXOEFMZjJHYmhvTUw1NXVKNUY0T1ZhWWRlbm1CZDUvQytYRnlITlRv?=
 =?utf-8?B?djcrUXZ6U2s5SjVZYVQ4Ti9WQndmUktaYnB1dURqYTRCUi9QUzBIa0NuM0tr?=
 =?utf-8?B?ejlpTVB3Q3BnVDVXd2VxTE0rTUJRSVlMYUxLZ0FuaXJEWHVtelhUVjdYUGdv?=
 =?utf-8?B?S2RyMjdLK0NXM3ZvVGt6MmpRdFU4VVNGdUdTd01kUjgzVzlOR2kyelRPUDRP?=
 =?utf-8?B?MGxtb1Fvb1pIdVAvYWJsb2s1bTV4NnVIS2JZUitwTHprcmlUa1RDQThub1Br?=
 =?utf-8?B?bXNOSTJhaGhxbmx1VTZwbm9qSGFmTGhxVjZIOEV3UEVKRWhuVmZHWnQ5TGxk?=
 =?utf-8?B?NTFKQjJRaU1uQ1RybjBTa3JJM0JCTEM3K2h6bzZscExkei9HZ1FzYWtLdGFj?=
 =?utf-8?B?K0NwZXRsdWc0SzNaYkpaNTVMZnVib1R6VlRSOEVWUDVLWmFodERNZTE0Y2JU?=
 =?utf-8?B?YUFkWGtWUDRhakkrdGxsL1NESWF4cHJ3bDdRNWhkUnEyZVRUdVBtam4vekt2?=
 =?utf-8?B?cGFvSUIyT2NpT05yQjZhQ2FHNmZaa2JKMGJVZmlxeDlxRFdXNXF6VWQ3UkVP?=
 =?utf-8?B?S2pZcXd3WkdYc0NOeHljdlNYd1lzWVN5ZWFjV1BBNjh1aXFud3lHcGNRaWty?=
 =?utf-8?B?SFBDMnNyV1BkNWxDd0VLMTlDMEFadE1SUW96bndIYy95MzMxL0U1YkIxcUlN?=
 =?utf-8?B?aTFwRzdWVVlCTW9yelhCMlR5dnJOdlowOXlCam5wQ2FGS2pNZ1hSMHUzdi9K?=
 =?utf-8?B?WThhanZRS05TdlNBY1RCbU9LWHYrNnhCemZmQ1M3R2lYcjcwSURlNjFVQk5w?=
 =?utf-8?Q?2BfPoEUarZ66uCGVmiHJuMfO4?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6004aef2-0728-4529-d9d2-08da583d0e74
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 13:00:48.6384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyjmj3DHV0hjm0f25IIkOQW59oCkVCSjFI3T8aXqc49Lts3k2ZyxQ7XrLi+hOdWQfDyw+N4mkelwSxAttv5baw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5842

On Thu, Mar 24, 2022 at 03:01:31PM +0100, Juergen Gross wrote:
> The entry point used for the vcpu_op hypercall on Arm is different
> from the one on x86 today, as some of the common sub-ops are not
> supported on Arm. The Arm specific handler filters out the not
> supported sub-ops and then calls the common handler. This leads to the
> weird call hierarchy:
> 
>   do_arm_vcpu_op()
>     do_vcpu_op()
>       arch_do_vcpu_op()
> 
> Clean this up by renaming do_vcpu_op() to common_vcpu_op() and
> arch_do_vcpu_op() in each architecture to do_vcpu_op(). This way one
> of above calls can be avoided without restricting any potential
> future use of common sub-ops for Arm.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Acked-by: Roger Pau Monné <roger.pau@cirtrix.com>

From an x86 only PoV I prefer the previous arrangement (do_vcpu_op() ->
arch_do_vcpu_op()), but this approach seems to be better for Arm, so
that's a reasonable argument for changing it.

My preference would have been to move the handling of hypercalls not
used by Arm into arch_do_vcpu_op() for x86, but that's also not widely
liked.

> ---
> V4:
> - don't remove HYPERCALL_ARM()
> V4.1:
> - add missing cf_check (Andrew Cooper)
> V5:
> - use v instead of current (Julien Grall)
> ---
>  xen/arch/arm/domain.c                | 15 ++++++++-------
>  xen/arch/arm/include/asm/hypercall.h |  2 --
>  xen/arch/arm/traps.c                 |  2 +-
>  xen/arch/x86/domain.c                | 12 ++++++++----
>  xen/arch/x86/include/asm/hypercall.h |  2 +-
>  xen/arch/x86/x86_64/domain.c         | 18 +++++++++++++-----
>  xen/common/compat/domain.c           | 15 ++++++---------
>  xen/common/domain.c                  | 12 ++++--------
>  xen/include/xen/hypercall.h          |  2 +-
>  9 files changed, 42 insertions(+), 38 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 8110c1df86..2f8eaab7b5 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -1079,23 +1079,24 @@ void arch_dump_domain_info(struct domain *d)
>  }
>  
>  
> -long do_arm_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
> +long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>  {
> +    struct domain *d = current->domain;
> +    struct vcpu *v;
> +
> +    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
> +        return -ENOENT;

My preference (here and in x86) code would be to do the initialization
at definition, and then just check for v here, ie:

struct vcpu *v = domain_vcpu(d, vcpuid);

if ( !v )
    return -ENOENT;

But that's just my taste.

Thanks, Roger.

