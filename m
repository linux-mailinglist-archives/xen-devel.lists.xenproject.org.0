Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B219C43E265
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 15:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218047.378330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg5Zv-0000VB-UE; Thu, 28 Oct 2021 13:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218047.378330; Thu, 28 Oct 2021 13:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg5Zv-0000Sd-RA; Thu, 28 Oct 2021 13:36:23 +0000
Received: by outflank-mailman (input) for mailman id 218047;
 Thu, 28 Oct 2021 13:36:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Bw3=PQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mg5Zu-0000SX-Fx
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 13:36:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 091c2ac8-37f4-11ec-84a0-12813bfff9fa;
 Thu, 28 Oct 2021 13:36:21 +0000 (UTC)
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
X-Inumbo-ID: 091c2ac8-37f4-11ec-84a0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635428181;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LA9IN5hvsHuDuR1ya0QUiI4hCXC1Cqm7/E7WVr1dteM=;
  b=BRYutO1CRuhjAcyLMrm75oUfEMgWZwk2EWvaeowI4gBJE0q4KPk7BrHH
   on0CkKTPmoFDc72bogb2LwndzjstR+1enZPjUKyCfo3pr8ldepobhRr5F
   LdFicrFHZqkh8J2Ml7cl3q9vKy5oXn6QxP8xNARt3RlkPROfT+VNGXqSK
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: lfJkCEYuR5n4DC+DZ3uthob4ZYM1fuR5pgNcx0P8FOeqx711yntbwXsUOhfdGdY117q/g2h96K
 Nn9ygs8bLPJX/vKCpC5Gw3AJ0gyrlrIlGuRLtck8ZLbdK6GuJr6j5ucABVGO0ekSLnzNDLAREU
 WBBkppDI3zzo7tWl/Jh56s0j6MGOXbmWyt06crbv3ZV7YGER8x4Ou+oYWh6SaO321AKp//DIFu
 zVAgS7wUZeg7EMORZmp/SqQd8a7sMeFh4LC4owWu8W03+A3oAwokAnvvNOzQfkF9dbDTmok5LD
 08Ee0LWYDuoHKsiAyaeIBbl2
X-SBRS: 5.1
X-MesageID: 56550448
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7/OlXKgxw906avZmueuFqoo+X161KBYKZh0ujC45NGQN5FlHY01je
 htvD26Ab/reZ2H0eYp2aI638hgEu5HdytAxHVRsrCgzFHwb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Yy0YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Uh5m3eCYTLpeRgd4wTSZhCSZuN5ZZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9t2J0TRaqCN
 6L1bxJufDHRMiFFOWwNJ68Xkb/0qCPFYQxx/Qf9Sa0fvDGIkV0ZPKLWGNvKePSaSMNNhEGaq
 2nauWPjDXkyPtGF1SCM9H7qg+bVhD76Q6obDrj+/flv6HWJz2wODFsNVF20odGwkEv4UNVaQ
 2QP4TYnp6U28E2tT/H+Uge+rXrCuQQTM/J3F+A58wiLxrDjygCVHHUfTjVBZdols+c7XTUvk
 FSOmrvBByFrsbCTYWKQ8PGTtzzaETgYKyoOaDEJSSMB4sL/u8cjgxTXVNFhHaWpyNrvFlnNL
 yui9XZkwe9J1IhSivv9rQuvby+QSobhVzww4TT2ZHKfsxpDSZCaXpav+VLg8qMVRGqGdWWps
 H8BksmYyekBC5CRiSCAKNkw8KGVC+Wta2KE3wY+d3U133H0oST7JNEPiN1rDB4xap5sRNP/X
 KPEVeq9DrdoN3y2cbQ/XYu1D8k7pUQLPYW4Dq6KBjaij54YSeNmwM2MTRLPt4wOuBJ1+U3aB
 Xt9WZ31ZZr9If8+pAdav89HjdcWKtkWnAs/v6zTwRW9yqa5b3WIU7oDO1bmRrlnt/7f/l2Pq
 IgOZ5fiJ/BjvAvWOXC/HWk7dgliEJTGLcqu95w/mhCre1IO9J4d5w/5nup6Jt0Nc1V9nebU5
 HCtMnK0O3Kk7UAr3T6iMyg5AJu2BM4XhStiYUQEYAb5s1B+MN3HxPpOKPMKkUwPqbULIQhcF
 KJeJa1tw51nF1z6xtjqRcKs8dI4LE7y2VLm0ujMSGFXQqOMjjfho7fMVgDu6DMPHmyws84/q
 KenzQTVXdwIQAEKMSocQKnHI4qZsSdPleRscVHPJ9UPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmlPps59bmq7JA4B5jGXHHMwaiBr96eyHU1shTrKxdgLRevFLuC
 E6I/9BbP5SPOd/kTwFNdFZ0MLzb2KhNyDfI7PkzLEHr3wNN/eKKARdIIh2BqC1BN78pYokr9
 vgs5ZwN4Aulhxt0btvf1nJI936BJ2ArWrk8ss1IG5fijwcmxw0QYZHYDSOqspiDZ88VbxsvK
 z6QwqHDm65d1gzJdH9qTSrB2u9UhJIvvhFWzQBdewTVy4Sd3vJnjgdM9TkXTxhOykQV2u1+D
 WFnKklpKPjc5DxvnsVCAzihFgwp6Md1IaAtJ4/lTFHkcnQ=
IronPort-HdrOrdr: A9a23:qODiP6G+WE5yS/cSpLqFcpHXdLJyesId70hD6qkvc3Nom52j+/
 xGws536faVslcssHFJo6HmBEClewKnyXcT2/htAV7CZnichILMFu9fBOTZsl/d8kHFh4tgPO
 JbAtRD4b7LfClHZKTBkXCF+r8bqbHtmsDY5pav854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJPiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y5o2mePVmGp6VNN1xMvdfNVa9NC4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.87,190,1631592000"; 
   d="scan'208";a="56550448"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuPT3RMMQkpvlMwVAzIDTcESTopgxbEJIU+0FAME4M6fcxY80rJRMiBrjJANyI96PNY2SYslXpoYlgR4TvQotipBF1HwSyuFESBrIp2OlLUu1N/xyO7RbRukqMpDHklOEKgBW2pHw1WkxRGUAUjNDym0aodxsm0E2Xg/3HugfsyI82bJMPdpiHm3AaXaIj9kX5mMIrom3uCZog4fVFrUbHaQmtmNuqeq7VXjn4GsEQuUhXQXA0+G6e5WWQ7vPey6KpOYATr9umxtcEOg2Ag9GCBftgTTuObZoVnCsjeciH2/HJuKl/D6jZBgn0sfsICjqw1knPSc4v53Ij/QOg9NqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R3S4DJB+Ifu4PAobrPqPQmYAw2JoqJ0/kKP21fu4zIg=;
 b=V+Lcxn+uI2dwe5Oeb6CQ+TsLPW3OjUXlk5hgf+m+79jWwCApBaHfFnMH262SsruxWHIPY5gS1IVeAnF7Wis81J8zOTsk0B1Ao3PfpCR8B/77CMgOjHjcUhjE5amhCIjaSYV6FGELDux9IEjZTqHZQgdg/tHOUOqxlpSYZkd/R+/oxQln7Ah0mXOTBM8YCdHWpBngoFE/hXbk+9zRHgeQ7/2dpGFy4q65jDzLcuv48uJPjc0xL20VmkBxUXome0mK+TGKZYeaSQL4QSmZVw1+O5DN34uL8q325Uvrzw/AO7ms9MHUeuERcjlYeFCNCCYLCyCNdHY+YpUFIBsILh3n2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3S4DJB+Ifu4PAobrPqPQmYAw2JoqJ0/kKP21fu4zIg=;
 b=NChzVfgaQ1ecBwXgU2kKIcpSOut7coxVXKjGpAQxik12a3vOa5j31bLJ+UDyEsI3Wsn1OfMQJCQ0oSjIvym66+4HLYeXNDqlS8/tmVtsvf2jOepzbGWmlt17QXyXv74Dfxmw9KI3uFpIXR0qyYhDCu1L2eP3tn7JgUO6JlVHKlk=
Date: Thu, 28 Oct 2021 15:36:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "iwj@xenproject.org" <iwj@xenproject.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Message-ID: <YXqnS7iZUvokJby6@Air-de-Roger>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
X-ClientProxiedBy: MR2P264CA0167.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef7f72f3-361e-49fe-3655-08d99a17eafc
X-MS-TrafficTypeDiagnostic: DM6PR03MB3834:
X-Microsoft-Antispam-PRVS: <DM6PR03MB3834B8F2ED89A9E9C8A5CE7A8F869@DM6PR03MB3834.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2zCVaG/s5W7BTOOpq+XTSMkQcZu9tQJH1jrcif8ftGk7BND9QC4Z29lZjaSHcElK2WvVQasuVX3LvwS+rdvF0qV5+7GIcigZFGvTsmln7W4764doxq4KhT3KwidF0oK5J0kkiosbXY7hbsNAJrUx07MDUlXk2ohv1pHVU5KspA1Vn/i8vM9oI9oEzQhmf0Y6+aN3S6omLvzi6wImCNV1EVIaMAwfETCOvjXslRvJgBaqSaxUmEiT9+OBxgbwoeVqpxEvku4k7kZL6WkZtbuzZu1GjpC7kE7C+WRRZ8YQPQNRt1rY88yII+13+QPTXh9fvzgMQJAvKgUy8rsdKC17Sv9gVfBR/6iT7GWAA0goO+ajCet9TUe++68D3feJ1+vcr/jPPKUAxbbc6EJhPCIvLaLoFMom0jomJSgHB9Rd6aEGwdRtpLkcL8INxIHqq+AfHHEqAc9081w4vstTmupot3Gy9FR8FVp/DhGHFRTRB7bnMxVWYiszT/V35YlQWq9sScjIo/plXBAYXWAEabvstpStFxzPqELl+HH9GDSKDP22XFXxlJE4ltesquQh9XWbwJ3/9O5REcHNS/poDWLqnPlR/MYUBN17nQJkLB8K3DqzXKslxPNDddGIW6V80ywBcuth0clMODV2v6w8gbpUfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(6916009)(82960400001)(66556008)(66476007)(2906002)(9686003)(508600001)(316002)(4326008)(38100700002)(33716001)(6666004)(83380400001)(53546011)(6496006)(186003)(26005)(6486002)(8676002)(66946007)(86362001)(8936002)(85182001)(956004)(54906003)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTk4WE5yZ3QxVy9nZkJ5Ni9LSG5LQzJ0a05iWVM1N1hVdkNvM3F6cE1tQ2Zt?=
 =?utf-8?B?VUNwWjBJRG12MmRoSG52M3NQMmxnK2VrVjB1TFV1U2J2cXhrMHBwbE82STZX?=
 =?utf-8?B?Ymp4QW5iNjhWVlp6VXRqUlZWWFpHYWdlVWYzdVRKZWViaHgxcXNEQWN0elhY?=
 =?utf-8?B?NkFtb2llNnV5WmU0ay9SZjZWQ082cDFGQTduOFVmV0dmR29kSVNrUnZJczZw?=
 =?utf-8?B?czR2M2ErVkZTbXJoRFB2OXdTOEJVR3hDSWQ2SStsaHI1UG9lUEhCQWxMeVZF?=
 =?utf-8?B?c3JBOXp0eWJpQ2pvYmVGVjN0Y2YvaUlTSXFMR1hBNnEwYWQ4ckxlQ0RqR3p2?=
 =?utf-8?B?UFpLK3N5d2tkVDFOTjUxYmsyWkliNzRkSUJ4Rmt2L2NlRXg1VzliRCthZUhD?=
 =?utf-8?B?WEp1anAzbXJRZFk3VU5Pcy9HamtPNkc2R1QycnNqam8zcm9Wa0NQVVdxcUdD?=
 =?utf-8?B?S0xBb3hVbjhJaEFtQi9JMk9TRDFDdzBpOElTSUZpRUlvM2U0WmdJbDJySjVH?=
 =?utf-8?B?dlp2UUZDVWpiWnI2Y0dOR0xRZ2NmZVUzTUwvc0tubVVCRzNnMm5kQS9wSWhF?=
 =?utf-8?B?eTcxek1TY3Y1SEwyWE9CY2ZPM1Z0SGRKeUtNRGlyVGc5U0VJWUJQWTVXOXhw?=
 =?utf-8?B?UzUzUFh5YXF0dUQ2RjdMa2tJWEZzRHRMYTdyZ1NPaGViOC9HalN6STlXQW1x?=
 =?utf-8?B?cXdIME1vVnljT0ZnUm5GODFVT3pXQnhFZ25tZHlwdm02OFJzcWhXR0JydTYv?=
 =?utf-8?B?V3B1ZEV0Uk90T2RHOSswdlJHeWZvODlsTFU3ZWpZVUV1ejdhUzFEbS9mVkp2?=
 =?utf-8?B?U3I0TmpBMEQ1dTY3bkVidDFnanFCdlpSZHlzZ3JmaDROTjI2ODJVeDdxNEw0?=
 =?utf-8?B?OWRrU2hQRENGY2JjME5lcm1ybnZNdWl5T3VBamQrTmgrZTlsYUZpQUFQUmpl?=
 =?utf-8?B?aHRHMzBYZVJ1Ny8vSEZaQTcxTWl6NE9YSVF0SGlJOCs4OVBmeXE1VkdjQ01z?=
 =?utf-8?B?OGhJKzlyRkFwQ0cxdWFTamsrMk9vQnJpUFNtOHNrOWZpaVhaY0lhREFlV05w?=
 =?utf-8?B?ZWs4WjJaSEtGQzl3ZmpIQm9jWFZkTkdZQlhvams2WnhCMUhNeTl4SitvMkwx?=
 =?utf-8?B?bk1wM0VpWVZrQjhGUVZTeFpYbzZGalhtQ2ljUGFwUjlGd1Z2K0c0V0tvR3hr?=
 =?utf-8?B?THhTUHM5bGFWQlRWQUhZcmZqOTRUZnlad0dXZTlJVXhqejhsMi9xeW5aaGhL?=
 =?utf-8?B?OExiKzFzVVV4Si9NRm1FNWVkeXlqdlJkQ0JTRmZNUE4yUXYzQjJwak1FL1U2?=
 =?utf-8?B?M0oxbnJVWHBJZVZvVzFtZjFjVEgzRWVYMFlEc1lFNDBJRWZaZ2dXZHdibkRY?=
 =?utf-8?B?djRicU1rRlFVcjZGcS9TK3lkMGVLNmpzdlRNdHVyUEc4TUF5bXlkODJwUHV2?=
 =?utf-8?B?cDlBZGpLdmJGd3htSE5wai9pQ016YUVjbjNPTVprOVkzUUFpWS9aeHkzVlVm?=
 =?utf-8?B?Y3U3K0taVnpRcFU1NUNSa0F3SXBsNU9nQVltd3RnSmtCMGNDLzNOT2hwcUsv?=
 =?utf-8?B?ZVFZQ2dadGZPSjRKMmFNaGxqamlPL0Vlck90YVROUkxHck9INFU1Mmx1NkVS?=
 =?utf-8?B?Wm1LQm04OUhyNC80SDkzTUtUSUJjRDNSNE1EbDlIL2VaMFhRNys2SWRNdm1h?=
 =?utf-8?B?ZU5mT2g5MCsxdmh0L2hNWmkvb29ET1hPRSs1UE8wVXBMRzI4dHpObVhvTVU3?=
 =?utf-8?B?UG9aK0wzRTBTNkZXak1aK01GWjNIVFlxdEVRN2lZV29JSks5QS85OWVSTTdC?=
 =?utf-8?B?d2hha2g2eDBwR1hMcnd1eFRxZ005VWZEa0NKVzVpN0xNVEFoaTZ6cjlUMVdo?=
 =?utf-8?B?U1pldDU2M3FKeUJUQ2Zxd2QwTkdSOElCRHJvMG10V3RhWjJka3Q5aUE4azFC?=
 =?utf-8?B?RE9tYWZVMlUybkVmSmpMOVhjRDErem8rTHdQektTc05GSVhLS2FNbEt4aHZO?=
 =?utf-8?B?eDZVN1krTUVGZlFnVEh1YlhMekVtaG44S0xPaldoQ2cwV2d2eGQ3aGo4MFRP?=
 =?utf-8?B?aHdVUWhUOU93eGk3b0lKTEFxZlhDZHcrdDg5bHZ6dVMzYXVBQ0ZNRzJWYjRi?=
 =?utf-8?B?c0pITGZnUmdFNzJRRjg0SlNQbWtuNERPVjJXdTlNcE1GLzNmRDV1QzRGUTdR?=
 =?utf-8?Q?8bKb09uq5VC+bSkK+0ISCu8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef7f72f3-361e-49fe-3655-08d99a17eafc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2021 13:36:16.8800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2TRnE9enPTRmxhV03THNMbFnzlAIW1H7d2Z1loA7sj6wk8ejSFKNup0CMV1nusBZNGHAld/AupaYRvig4YkkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3834
X-OriginatorOrg: citrix.com

On Thu, Oct 28, 2021 at 12:09:23PM +0000, Oleksandr Andrushchenko wrote:
> Hi, Julien!
> 
> On 27.10.21 20:35, Julien Grall wrote:
> > Hi Oleksandr,
> >
> > On 27/10/2021 09:25, Oleksandr Andrushchenko wrote:
> >> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> >>
> >> While in vPCI MMIO trap handlers for the guest PCI host bridge it is not
> >> enough for SBDF translation to simply call VPCI_ECAM_BDF(info->gpa) as
> >> the base address may not be aligned in the way that the translation
> >> always work. If not adjusted with respect to the base address it may not be
> >> able to properly convert SBDF and crashes:
> >>
> >> (XEN) vpci_mmio_read 0000:65:1a.0 reg 8bc gpa e65d08bc
> >
> > I can't find a printk() that may output this message. Where does this comes from?
> That was a debug print. I shouldn't have used that in the patch description, but
> probably after "---" to better explain what's happening
> >
> > Anyway, IIUC the guest physical address is 0xe65d08bc which, if I am not mistaken, doesn't belong to the range advertised for GUEST_VPCI_ECAM.
> This is from dom0 I am working on now.
> >
> > IMHO, the stack trace should come from usptream Xen or need some information to explain how this was reproduced.
> >
> >> (XEN) Data Abort Trap. Syndrome=0x6
> >> (XEN) Walking Hypervisor VA 0x467a28bc on CPU0 via TTBR 0x00000000481d5000
> > I can understnad that if we don't substract GUEST_VPCI_ECAM, we would (in theory) not get the correct BDF. But... I don't understand how this would result to a data abort in the hypervisor.
> >
> > In fact, I think the vPCI code should be resilient enough to not crash if we pass the wrong BDF.
> Well, there is no (?) easy way to validate SBDF. And this could be a problem if we have a misbehaving
> guest which may force Xen to access the memory beyond that of PCI host bridge

How could that be? The ECAM region exposed to the guest you should be
the same as the physical one for dom0?

And for domUs you really need to fix vpci_{read,write} to not
passthrough accesses not explicitly handled.

> > When there is a data abort in Xen, you should get a stack trace from where this comes from. Can you paste it here?
> (XEN) Data Abort Trap. Syndrome=0x6
> (XEN) Walking Hypervisor VA 0x467a28bc on CPU0 via TTBR 0x00000000481d5000
> (XEN) 0TH[0x0] = 0x00000000481d4f7f
> (XEN) 1ST[0x1] = 0x00000000481d2f7f
> (XEN) 2ND[0x33] = 0x0000000000000000
> (XEN) CPU0: Unexpected Trap: Data Abort
> (XEN) ----[ Xen-4.16-unstable  arm64  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) PC:     000000000026d3d4 pci_generic_config_read+0x88/0x9c
> (XEN) LR:     000000000026d36c
> (XEN) SP:     000080007ff97c00
> (XEN) CPSR:   0000000060400249 MODE:64-bit EL2h (Hypervisor, handler)
> (XEN)      X0: 00000000467a28bc  X1: 00000000065d08bc  X2: 00000000000008bc
> (XEN)      X3: 000000000000000c  X4: 000080007ffc6fd0  X5: 0000000000000000
> (XEN)      X6: 0000000000000014  X7: ffff800011a58000  X8: ffff0000225a0380
> (XEN)      X9: 0000000000000000 X10: 0101010101010101 X11: 0000000000000028
> (XEN)     X12: 0101010101010101 X13: 0000000000000020 X14: ffffffffffffffff
> (XEN)     X15: 0000000000000001 X16: ffff800010da6708 X17: 0000000000000020
> (XEN)     X18: 0000000000000002 X19: 0000000000000004 X20: 000080007ff97c5c
> (XEN)     X21: 00000000000008bc X22: 00000000000008bc X23: 0000000000000004
> (XEN)     X24: 0000000000000000 X25: 00000000000008bc X26: 00000000000065d0
> (XEN)     X27: 000080007ffb9010 X28: 0000000000000000  FP: 000080007ff97c00
> (XEN)
> (XEN)   VTCR_EL2: 00000000800a3558
> (XEN)  VTTBR_EL2: 00010000bffba000
> (XEN)
> (XEN)  SCTLR_EL2: 0000000030cd183d
> (XEN)    HCR_EL2: 00000000807c663f
> (XEN)  TTBR0_EL2: 00000000481d5000
> (XEN)
> (XEN)    ESR_EL2: 0000000096000006
> (XEN)  HPFAR_EL2: 0000000000e65d00
> (XEN)    FAR_EL2: 00000000467a28bc
> (XEN)
> [snip]
> (XEN) Xen call trace:
> (XEN)    [<000000000026d3d4>] pci_generic_config_read+0x88/0x9c (PC)
> (XEN)    [<000000000026d36c>] pci_generic_config_read+0x20/0x9c (LR)
> (XEN)    [<000000000026d2c8>] pci-access.c#pci_config_read+0x60/0x84
> (XEN)    [<000000000026d4a8>] pci_conf_read32+0x10/0x18
> (XEN)    [<000000000024dcf8>] vpci.c#vpci_read_hw+0x48/0xb8
> (XEN)    [<000000000024e3e4>] vpci_read+0xac/0x24c
> (XEN)    [<000000000024e934>] vpci_ecam_read+0x78/0xa8
> (XEN)    [<000000000026e368>] vpci.c#vpci_mmio_read+0x44/0x7c
> (XEN)    [<0000000000275054>] try_handle_mmio+0x1ec/0x264
> (XEN)    [<000000000027ea50>] traps.c#do_trap_stage2_abort_guest+0x18c/0x2d8
> (XEN)    [<000000000027f088>] do_trap_guest_sync+0xf0/0x618
> (XEN)    [<0000000000269c58>] entry.o#guest_sync_slowpath+0xa4/0xd4
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) CPU0: Unexpected Trap: Data Abort
> (XEN) ****************************************

Are you exposing an ECAM region to the guest bigger than the
underlying one, and that's why you get crashes? (because you get out of
the hardware range)

I would assume physical accesses to the ECAM area reported by the
hardware don't trigger traps?

Roger.

