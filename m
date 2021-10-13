Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A553942C32A
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208566.364742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafFz-00009O-Qx; Wed, 13 Oct 2021 14:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208566.364742; Wed, 13 Oct 2021 14:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafFz-00007A-Ne; Wed, 13 Oct 2021 14:29:23 +0000
Received: by outflank-mailman (input) for mailman id 208566;
 Wed, 13 Oct 2021 14:29:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFKL=PB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mafFy-000071-FJ
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:29:22 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4203c0e-2c31-11ec-8179-12813bfff9fa;
 Wed, 13 Oct 2021 14:29:21 +0000 (UTC)
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
X-Inumbo-ID: f4203c0e-2c31-11ec-8179-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634135360;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=APPtn0PA9geCxnfhp/tb14JXWyxnXBs6x7cKbOxRASY=;
  b=dRY7b++IOwT1s45twa/b7G5uIq+f3fSEU7fUmxxQ1kG5VY5jtea+fFSg
   lcRCy65fsRu3XR1PWm8QSaVj5BotrHy/dnFUjwhw0lnp3D30ETVxx9ZIr
   arW6R0CqQhEcTuzlzCKNuaSeanl3jrK1rNwdBCHufHkjDAUQs96+8WGgZ
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: hjuuT9gSa05fYbgWkD3sZ4Use2JKatNkzPCs5Cs6TZZtqyT3hSi+ETg/5S+Xjkx1oEGDIey/WU
 Un/SzQV88MrWFYUEC35HnEMGnEql4h4W+ej3/ytbQgXU7NA36EFtYV4Masa2iAToJ1T4Fs+s7N
 ayXEZlcMhoq29MHYbLQlFJtx2pbzHijghPQu9O9i5JnR/w8gClsZZ+PPDlDUrR900zaZyiEDEW
 P8ERgmVlVWSz9uqWb6XoiJ/5+lcqeV18sotGjdlvgZVD06/n9DF16OBMPHAi0OV7Fuum06TBuU
 rH1LeGVBieKIlEh47EkfVylA
X-SBRS: 5.1
X-MesageID: 56976528
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LCGMLqin/kHsWBewSXj0WE5kX161QBYKZh0ujC45NGQN5FlHY01je
 htvC2/XbKuKZTHzf4hxbNvloRtQvZPQyIIyG1ZrrH8xH38b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0FU/NtTo5w7Rg29Yx2oDia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1x743oFltuOJaP28QXCUB1GCB3L59/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2JERQ6uEN
 6L1bxJANivtezhBAW5ON4syg+WZg2n/biRh/Qf9Sa0fvDGIkV0ZPKLWGNjfd8GORM5Vtl2Fv
 W+A9GP8ajkFMPSPxDzD9Wij7sfOgiHTSI8UDKe/9PNhnBuU3GN7ICMRUVy3sPyokHmUUthUK
 1EX0ic2pK10/0uuJvHmRAGxqnOAuh8aWvJTHvc85QXLzbDbiy6bG2wFQzhpeNEg8sgsSlQC7
 FaJgtevPj1pv729QGiYsLyTqFuaHCkeLWYGIwgeXwYBy9D5pcc4iRenZvxuCrKvh9v5XxT52
 SmXrTMWjq8Wy8UM0s2T8VnZjhq2q5POTwpz4R/YNkqM6A9jacidfZ659lHB5N5JNoPfRV6E1
 FAUls7b4O0QAJWlkC2WXP5LDLyv/+yCMjDXnRhoBZZJyti20yf9J8YKumg4fRo3dJZfEdP0X
 KPNkT8L9ccMYDysVuw0Q4jrUukhzKHyJ+2wA5g4ceFySpR2cQaG+gRnakiRw33hnSAQrE0vB
 XuIWZ3zVShCWMyL2BLzHr1HieZ6mUjS0EuKHcijpylLx4Zyc5J8pV0tC1CJcvwipJ2NpAHY4
 r6z3OPblk0BDoUSjsTRmLP/zGzmz1BnW/gaSOQNL4ZvxzaK/kl6VJc9Jpt7KuRYc1x9zLugw
 51EchYwJKDDrXPGMx6WTXtodaniW51yxVpiY3dwZQj0gSB5Pd3zhEv6S3fRVeJ4nACE5aQlJ
 8Tphu3aWqgfItg502V1gWbBQHxKK03w2FPm09uNazkjZZ9wLzElCfe/FjYDABImV3Lt3eNn+
 uXI/lqCHfIrGlQzZO6LOanH5w7g4hAgdBdaAhKgzi97Ix63ruCH6kXZ05cKHi37AUybnGXFj
 FzKXU5wSCuki9ZdzeQlTJus9u+BO+B/AlBbDy/c67O3PjPd5W2t3clLV+PgQNwXfDikkEl7T
 ekKnfz6LtMdm1NG79h1H7pxlPps7Nrzvb5KiA9jGSyTPVisD7phJFiA3NVO6fIRluMI51PuV
 xLd4MReNJWIJNjhTAwbKj06Y7nRzvoTgDTTs6g4eR2o+C9t8bObekxOJB3Q2jdFJb54Pdp9k
 +csscIb8SKljR8uPorUhyxY7T3UfHcBT78mptcRB4qy0lgnzVRLYJr9DC7q4c7QN4UQYxdye
 jLN3fjMnbVRwEbGYkEfL3mV0LoPn4kKtTBL0EQGewaDlO3ai6JlxxZW6zk2EFhYl00Vz+JpN
 2F3HERpPqHSrSxwjc1OUm3wSQFMABqVph74x1cTzTCLSkCpUirGLXEnOPbL90ccqjoOcj9e9
 bCe6WDkTTe1I52hgnpsARZo+675UNh81gzeg8T2Tc2KEq4zbSfhnqLzN3EDrAHqAJ9piUDKz
 QWwED2ctUEv2fYsnpAG
IronPort-HdrOrdr: A9a23:MA/UdqiqutDLi9w5/eOypzO80XBQX0t13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKOzOWxVdATbsSlrcKpgePJ8SQzJ8+6U
 4NSdkaNDS0NykHsS+Y2njILz9D+qj/zEnAv463pB0MPGIaG52IrT0JcjpzencGOjWubqBJcq
 Z0iPA3wwZJLh8sH7uG7zQ+LqX+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+qemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lsdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNzN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wqJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABKnhkjizytSKeGXLzEO9k/seDlHhiXV6UkZoJlB9Tpa+CRF9U1ws67USPF/lq
 352+pT5fdzpmJ/V9MIOA47e7rENoX6e2O7DIujGyWVKEg5AQO5l3fW2sR/2Aj4Qu1D8HMN8K
 6xJ2+w81RCIn7TNQ==
X-IronPort-AV: E=Sophos;i="5.85,371,1624334400"; 
   d="scan'208";a="56976528"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bv3Opd7tNsgM1g3kNhLqHxsUKTcycMer0Lb2ZmZWD9t/fC6nmQ8Kb9mxDxVhayoaoI6cft71Jobj4fAi4Jp90cxKhtqBolCDFd93W3nu0+tavMOY1JeKSitHdjy/TrYaLfK1g0SBhpVjHVRuC8R+i5/6q/D5bvnToQ4+uNF+U0xohVpWMpBmRDOmHYHJLPTJ5Ng8FKo3jJ54itdWbU1md95UJEzJEWrZs7Pll4VULloVzj5icbiQUUqANaRJH34DzjHtBtJ1oGhbHDM0q6NyN0h9S4sSaeHa09FYAIfYTmTRGmTEXjyvuV697RbOCW0bzPCPNSZQdXEcXRA78FlSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3lueVMk3OR7O4L8bxtNPd6WkVa3YP6XSnKGi/uvWbo=;
 b=JVaqFuoZkgak+kQvj5bNA9n7C7cO5qGTq+efy9LG/tVbdKPDdkNndijrlrG1JWv070S7QeKGfqUoDeWjZGgyVmk2CT3wZooLOOtgJxMR9WfyFi7ioDpXQrXO+0DcpzbHpDyG+4p0cgGYwWsXuqAbgG6jLdjidJzRSRVHZmNOMW6DzUHHrlrLb8FIOyXD3Q9A7nhue8FX8qV/IBsssdK9GO498Mn6H0Gfe+k5rCTMCY+fJXvfIsD4tDqlt38gDz03e/NzvZeBhXVQcEaBya6wxj1QzWNDGmfxGbewUawDXIFYkger5StFtMXWv5SL7Ip2EiyAVmM51Gseuk0hc6VKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3lueVMk3OR7O4L8bxtNPd6WkVa3YP6XSnKGi/uvWbo=;
 b=kuf2hTKwxQ1V4F/N6VnCI2xyyPBXxkokiqTDJ7Q9V5G5IiIH13kkkF5f0iOtYHfB5BLMLM9Hqp6SCQ5TnzMpkPSFuyHBsMeIzW/mczk3TmB2BidhncW4m4fzqH089O4FIHafObKW+hOYc1pJyJGqfXrfUoKX/wTRSFw8UAHvpOM=
Date: Wed, 13 Oct 2021 16:28:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Michal Orzel <Michal.Orzel@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Message-ID: <YWbtIfMZYWR/3hnT@MacBook-Air-de-Roger.local>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
 <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com>
 <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
 <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com>
 <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local>
 <9C5C0FE2-67EA-4CD7-893B-82C156F5F77A@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9C5C0FE2-67EA-4CD7-893B-82C156F5F77A@arm.com>
X-ClientProxiedBy: LNXP265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ea051ab-615c-4aa9-485c-08d98e55c991
X-MS-TrafficTypeDiagnostic: DM6PR03MB3484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB34840778C458D5E62B2071978FB79@DM6PR03MB3484.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rljk98Jj1Q8H4xwB7oEm1Fzxhkl/AIl7kSplpXkbovRSy27xrV2+e20V9AQ3w69l+zvnMV8j+STiWgetLRgvL+QeIOePdTgCVK/gyLycnT/Py/Ey5pMzD81U2mjOp1B0d7LETk8B6TvNY3DTC8ae099oeH2JX5ltimWEwr2b3MytoF+a7y5XTS6CCg1tMa30Y/a121p8siAFlVL+HDDF2O5fL0IqrSGrHX36gYOInPDvzHXtgdbJYGGBapmzHB8zNfbKAKwfBaCcub09IjB6HChkHMSmvlOaDiVpiboUKYmyMprCzAEcZYc2qfWrWTJxr7g3yCdL6gI1G3hQnxmecEdPjY7/VnwBHur3XflXo5g+iUlH2q2I3TmjUAUwn/tVRkRmmVPte4RU8jdKxAlOR91wLoueCPwO39hf1hR/iASqHm15EGeqqsaT+r9zbZHvpqeknCfTEVc3JEH7T+t2aOvYngsNLRQHLwGb5q16ne7f2syaT9SIIUeLRCT/UodmrMTeL9aI+1D8LPIq6u0Bt3Vtx8BhWIm8jm27ZAbG/PxdbFdh8JlBC034t33pJ/psZNF93H1xRfjmlUFBBOJrXgYLhKkMSUYgXFmle3mN0hjNOFA9H3iu7DyqlJoKOra8g7nBAp1vzaUQxtYgckNeA6a4YHbo8ygozEoAiUGWQBNmuyaBf6l5LtxiYETEyc+iThE6n5liKDarTcimqNXdJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(85182001)(508600001)(5660300002)(54906003)(9686003)(82960400001)(186003)(316002)(26005)(38100700002)(8936002)(83380400001)(4326008)(6496006)(956004)(2906002)(86362001)(66476007)(8676002)(6666004)(6916009)(66556008)(66946007)(6486002)(53546011)(7416002)(76454003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlNXdkhZU3oxeGhXa2kwVW4xZzMzeGhldlQxU3VpaWoycXlibWlCZTNhZEk4?=
 =?utf-8?B?SUtuZ2s2cVNnbXRORGsva2VGbnRmYjNraDk0dDZnV05PSWxMWDlXZU55MlNt?=
 =?utf-8?B?YXAxMjYvOHU2Z2xPeG5PMFRVd1QrOHFBMVpwTks5S3FCT3pOR1d3VFpYT3po?=
 =?utf-8?B?aGNRaFRZY0poNFRoaFZKb2VzT1cvZXJ6cHNKTS9xU05yWHhVTGVpNnM4U0VW?=
 =?utf-8?B?T2JaRThVZkJWcE9ta1JXelhxek5xQ0dCbGdOUXNERktYOU81RG1NV2ZOYUov?=
 =?utf-8?B?dTlMVkhoTzBlRUxhY2hZQ1RGaXVteVhLdTY0Nkw5UXZ5K2NVYWEwTmhnem5w?=
 =?utf-8?B?VlJtSExJSjVjcU5CM3ExTGg1eTRTMkd3ZVdOOWoraUZ3VkJPM3doK2RhTnhP?=
 =?utf-8?B?QXo5RHgxdjZmVUlFaXNHWTcyUlYzUEtzWTZHQ3dUS3VRU2tXdWcyVjBPK2pS?=
 =?utf-8?B?M1pTSlpKSkZjaEN2UnhjczhRMjJkZDBGa29iaWhETWJVOEwrZUtGUTc3Y1Nr?=
 =?utf-8?B?SDNMM1BjbkpXamZuOFdLdzRZS3ppNEZIaW5HZ3pwZmsxUHRuOUJ5WHU5b3JI?=
 =?utf-8?B?UnhKZWl6SkhPRUkrSE5DWUhybkNTQUxYTjF2OEoyQVFqTklvTGYzUlZhcDln?=
 =?utf-8?B?cExIZEJjYkJWbW5wVnpNZld4UVRlTFVVZmY4RFZHYkdhK1c4UWxwbUlRVUlk?=
 =?utf-8?B?djAxME1kR2pGV1RocEpqZ2VHb0NlbmhtdzNlMkd3eWlGazJMYUZHTTZTbGhq?=
 =?utf-8?B?WHpieG5hVHdGK2Z2V01sZFhVQndWOGszdzNKZnlSL1daZnY5OHRqUWZvN3I1?=
 =?utf-8?B?eE1SaERpMFJ2ZFpEVXViU1VKN2gvQW9vZVpUSWc3Q1NUQXdla1ZhRjBnelhU?=
 =?utf-8?B?MEd6ZzdHaDY3dmUxcVdkT0pQSzVFYlkvSXc4dWFmZGZhYk5Rd3lDOWhaWVRJ?=
 =?utf-8?B?d0hqV1ZhOHJJN3JUcDhrTG5XdGhEN3NCWXJOLzFwVE1QZnpGMTZYVEx4aTV0?=
 =?utf-8?B?eHNtb01UVjBJSUFLMm8xbTA0UlBLaHcwNHBuRmk2eU55V3VyckVQV2pkdE1H?=
 =?utf-8?B?WFZjNlBxaVdNNUdrVzRYblFtWWl5TFZUL3Vrb0FPdkdsNEpBTGRSVklQcS9a?=
 =?utf-8?B?N1BVY0JzWm9ia2V6NGFMeXA5WU5lYmtYcnJ0Wnc3UDdzYm1Vb1pQVzFreERi?=
 =?utf-8?B?MHNaNWpxZ2IvSndjS3VQS29FaUlRZytUem1BTVFLZzBGU09MQ2VUZ20vVWF3?=
 =?utf-8?B?bnZwU01KSnMrd29PTncvYWxNakxDMlNNZEREY3VISUxWU0xpWThsemNmdW91?=
 =?utf-8?B?cXdTVWRaN0VMMVAxMThjRDI2bmxtRnk4TlUwcWQ3WnNSYXAvR0dVa1ptQzBT?=
 =?utf-8?B?NVdnK3M2NEUySDlMcmtucmZwUllTYnc1elJEZitiekYzamV5Zk14cG5DdWta?=
 =?utf-8?B?bnlMSkFsMXp3aU12WTFtYXBmRE53bUJYeGFlT0dRNTVzUytrZ3RyWUE0NFdS?=
 =?utf-8?B?dGNvRGR0RnQ3aUVwdjNBcWNmbU9INStVdUxzZ0t0SUFhdVlRR1NGdFk0dlF1?=
 =?utf-8?B?ajJoRkFwZGFtaGRkTFh2TWs2UVdmNVBTODlaTVNZZ2s4NWsxcmxlQ29FeGhL?=
 =?utf-8?B?MTFsdjJUYTBzRnNwQXBRNDI3bDdDcW1FVnRUbXRzV21peG5uU2Qwd2xJOUp0?=
 =?utf-8?B?YVgwNDhMQ0NJQVplN0tZWWJqOEtxSmlhNlZkNjh4L0EvazFDS296ZlVDQnFH?=
 =?utf-8?Q?KHlG7ZEFQBbV27oDufT6r4aXSEl6MLbVa0QKAYf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea051ab-615c-4aa9-485c-08d98e55c991
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 14:28:55.6026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNoQvdbVOnYfwut2FoWFI8YG8UchDSQwV4czglhb4e4OhbpaxGWdM+jBAPSq8QN37mLJ1GwCRmV2/tlUpObi3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3484
X-OriginatorOrg: citrix.com

On Wed, Oct 13, 2021 at 12:11:30PM +0000, Bertrand Marquis wrote:
> Hi Roger,
> 
> > On 13 Oct 2021, at 11:56, Roger Pau Monné <roger.pau@citrix.com> wrote:
> > 
> > On Wed, Oct 13, 2021 at 09:36:01AM +0000, Bertrand Marquis wrote:
> >> Hi Roger,
> >> 
> >>> On 13 Oct 2021, at 09:30, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>> 
> >>> On Tue, Oct 12, 2021 at 12:38:35PM +0200, Michal Orzel wrote:
> >>>> Hi Roger,
> >>>> 
> >>>> On 11.10.2021 11:27, Roger Pau Monné wrote:
> >>>>> On Wed, Oct 06, 2021 at 06:40:33PM +0100, Rahul Singh wrote:
> >>>>>> Introduce XEN_DOMCTL_CDF_vpci flag to enable VPCI support in XEN.
> >>>>>> Reject the use of this new flag for x86 as VPCI is not supported for
> >>>>>> DOMU guests for x86.
> >>>>> 
> >>>>> I don't like this approach, XEN_DOMCTL_CDF_vpci should be set for x86
> >>>>> PVH dom0, like we do for any other CDF flags when Xen builds dom0.
> >>>>> 
> >>>>> Things like PVH vs PV get translated into CDF flags by create_dom0,
> >>>>> and processed normally by the sanitise_domain_config logic, vPCI
> >>>>> should be handled that way.
> >>>>> 
> >>>>> Do you think you could see about fixing this?
> >>>>> 
> >>>>> Thanks, Roger.
> >>>>> 
> >>>> 
> >>>> I have one question about this fix.
> >>>> If I set XEN_DOMCTL_CDF_vpci for dom0 pvh in create_dom0, then in
> >>>> sanitise_domain_config or arch_sanitise_domain_config I have no
> >>>> knowledge on whether I am dom0 or not. I can check if I'm PVH but not if dom0.
> >>>> This would be needed to add a warning if this flag is set but we are not dom0 pvh.
> >>>> 
> >>>> Any ideas?
> >>> 
> >>> I've just realized this is more wrong that I thought. vPCI is
> >>> signaled on x86 in xen_arch_domainconfig.emulation_flags, so
> >>> introducing a top level option for it without removing the arch
> >>> specific one is wrong, as then on x86 we have a duplicated option.
> >>> 
> >>> Then I'm also not sure whether we want to move it from
> >>> emulation_flags, it seems like the more natural place for it to live
> >>> on x86.
> >>> 
> >>> If we really want to make vPCI a CDF option we must deal with the
> >>> removal of XEN_X86_EMU_VPCI, or else you could introduce an arch
> >>> specific flag for vPCI on Arm.
> >> 
> >> First issue that we have here is that there is no emulation_flags right now on arm.
> > 
> > You don't explicitly need an emulation_flags field, you could add a
> > uint8_t vpci or some such to xen_arch_domainconfig for Arm if you
> > don't think there's a need to select more emulation. That's up to Arm
> > folks.
> 
> One way or an other it is still changing the interface.

Well, I don't want to sound rude, but you already changed the
interface first and very recently by introducing CDF_vpci. Complaining
that you don't want to change it anymore just after that seems
slightly weird.

> > 
> >> So I think there are 2 solutions:
> >> 
> >> - introduce PHYSCAP. The problem here is that it is not a physical capacity and
> >> I think that will hit us in the future for example if we want to use vpci for VIRTIO
> >> even if there is not physical PCI on the platform.
> > 
> > Hm, PHYSCAP is a bit weird, for example Xen signals shadow paging
> > support using PHYSCAP which doesn't depend on any hardware feature.
> > 
> > I think you could signal vPCI regardless of whether the underlying
> > platform has PCI devices or not, as vPCI is purely a software
> > component.
> 
> But in the x86 case this is something not supported in all cases and actually only by dom0 pvh.
> So having something like that defined as a PHYSCAP is a bit weird.

Well, even if vPCI was fully supported on x86 for both domU and dom0
it would only apply to PVH and maybe HVM guests, but classic PV will
never get vPCI. It's kind of trying to create a PV guest with HAP
support.

One option would be to defer the introduction of the CDF_vpci flag
until the vpci work has been finished - then we could decide if the
current code can also be used by x86 so maybe it could be enabled for
both arches, and there would be no problem in setting the PHYSCAP.

> >> I think the second solution is the right one but it cannot be done so near from the
> >> feature freeze.
> >> 
> >> The CDF flag as introduced right now is not creating any issue and will be used once
> >> the emulation flag will be introduce. We will be able at this stage to set this properly
> >> also on x86 (for dom0 pvh).
> >> Moreover keeping it will allow to continue to merge the remaining part of the PCI
> >> passthrough which are otherwise not possible to be done as they are dependent on this flag.
> >> 
> >> Can we agree on keep the DOMCTL_CDF_vpci flag and introduce the emulation
> >> flag on Arm after 4.16 release ?
> > 
> > If vPCI for Arm on 4.16 is not going to be functional, why so much
> > pressure in pushing those patches so fast? I understand the need to
> > remove stuff from the queue, but I don't think it's worth the cost of
> > introducing a broken interface deliberately on a release.
> 
> We did not push that fast, those have been on the mailing list for a while (this is the 5th version of the serie).
> PCI passthrough is a big change requiring lots of patches and we decided to push it piece by piece to make
> the review easier.

First version of this patch I have on my inbox is from 23rd of
September, that's less than 3 weeks ago.

> > 
> > I think we need to at least settle on whether we want to keep
> > CDF_vpci or use an arch specific signal mechanism in order to decide
> > what to do regarding the release.
> 
> Agree and I have no definitive idea on this so but switching will require to revert the patch adding CDF_vpci
> and change the subsequent patches.

I think it's fair to expect changes to the interface when things are
reviewed, that's part of the review process, changes to subsequent
patches can be painful, but we have all been there and dealt with
them.

I'm not saying we must remove the CDF_vpci flag. I have to admit I was
fine using emulation_flags, but I could also be fine using CDF_vpci if
the x86 side is fixed and XEN_X86_EMU_VPCI is removed.

Thanks, Roger.

