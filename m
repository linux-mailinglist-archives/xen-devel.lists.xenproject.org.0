Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1326760D134
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 18:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429958.681332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMMB-0004SG-BM; Tue, 25 Oct 2022 16:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429958.681332; Tue, 25 Oct 2022 16:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onMMB-0004Ot-8J; Tue, 25 Oct 2022 16:00:47 +0000
Received: by outflank-mailman (input) for mailman id 429958;
 Tue, 25 Oct 2022 16:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onMM9-0002RQ-Sj
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 16:00:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2df8e3ae-547e-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 18:00:44 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 12:00:41 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6745.namprd03.prod.outlook.com (2603:10b6:a03:408::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Tue, 25 Oct
 2022 16:00:39 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 16:00:39 +0000
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
X-Inumbo-ID: 2df8e3ae-547e-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666713644;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=uSJCBLPy4vtztfrhAPbsOyoKL9nzetq2PZRgZj1/ldY=;
  b=ZsE644h82ITjt7+UImmnLp03v2l3Vip4S5+oUpZemcVet95J426ttbK/
   oL0Bnj83MitpVFBLx92Rj9xawH4n9rMInuT+P6yGw7ewRTPy+8FVcv0Qs
   Xww6Hp0IktLu38gTLTKv8f0E2SiZuhW9/v203UxueouD1qK+VZ1b/pj9D
   c=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 83093316
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Mw2qC6kTLsI+I81OJwnLU93o5gywJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWWCHafvbMWKmeNx/PI+x9RhSvcDRnd9kGwI9qn83FSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9XuDgNyo4GlC5wRkOKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfGW5w5
 KExImE0Qkqdobyu+YmFcdZir5F2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6KklwZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r83beexniiBur+EpW95PhPkGy23lUqCSYuUH6Xmdm/km2HDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ua5QeX2+zr6gCWLmEeS3hKb9lOnNc/WDgCx
 lKP2dTzClRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf5mGa+xy9fzSTf5x
 mnTqDBk3utDy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDEhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:v+YvW6Gl8g5XVzTPpLqFDZHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6LW90Y27MAvhHP9OkPAs1NKZMDUO11HJEGgP1/qA/9SkIVyEygc/79
 YdT0EdMqyWMbESt6+TjmiF+pQbsb+6GciT9JrjJhxWPGVXgs9bnmVE4lHxKDwNeOAKP+tPKL
 Osou584xawc3Ueacq2QlEDQuj4vtXO0LbrewQPCRIL4BSHyWrA0s+yLzGomjMlFx9fy7Yr9m
 bI1yT/+6WYqvm+jjvRzXXa4Zh6kMbojvFDGMuPoM4ILSiEsHffWK1RH5m5+BwlquCm71gn1P
 HKvhcbJsx2r0jce2mkyCGdqTXI4XIL0TvP2FWYiXzsrYjSXzQhEfdMgopfb1/w91cglMsU6t
 MH40up875sST/QliX04NbFEztwkFCvnHYkmekPy1RCTIolbqNLp4B3xjIeLH45JlO01GkbKp
 ghMCmFj8wmMG9yLkqp9VWH+ebcEkjaRXy9Mwg/Us/86UkkoJk29Tpa+CUlpAZwyHsMceg62w
 36CNUXqFhvdL5iUUsvPpZ0feKHTkrwfDnrDEW+ZXzaKYBvAQO8l3ew2sR82N2X
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="83093316"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6Z8bXRHytt4AaSh0HyPA607/0nT9QCQMsx2jgKLurMGt/XBUY03OhDS+D52PGCeAGpVSrX7lGyHyp04BrqUNKQgw0eSI05jjvUUuHaraIqYZod4bXVTJDt0sbRzrkGOPKer1vsT++SypT815QKoGIlUq60tebcnOJqvAjZEBF1w9Pv/Di5u0rOQ2Zokx1mNZ8ESCpJI7NCZ9aVYx/AZi4z2fiUpQ8J75R1iFWZJMAZUYzi2RdrniqXU43zJqIYMlLe3TiJNK8yYcisTn7NqSJLp5cYdUBGbFDHGTFshyOQlu30+m2VBavstCgLbXpX0uJMxHUyY61ccMro8lpuZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iG5RKw1QfV4vTZomEBAa1AVdQ4I+aTGh9eZU5WCRjSY=;
 b=gTQGYOyYRaMpSVsjbr9BK5ejXbQSiJ8YSNKFMLLU3mXhI435PC2Y+WejKtuT/yHQgUD8BBwAUEUIZKPR+rTUoRs935Bf5qip25w2lcFwP6xGpNZ7oMODGmv3kBTEyuTLecjMcZ/ZYeR131HpApzevfomWfsxCPUf5bnRbRuKYuLMwC7EQMb9TKO0mYliDE0G+kJaV4o6XehfGWAabMBQOMA332wY3LQ2KLEbdq1AKhtDkAGsb+PIx+swgvUZw/eNY+Pj7WaDOHyX1xqhiS7W9Lzzx1gao2c7E8n1ct1cmR4VB9GRed9f5xxnxviQuNhITAjUyEGOavkuXYov1KFppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG5RKw1QfV4vTZomEBAa1AVdQ4I+aTGh9eZU5WCRjSY=;
 b=URhu8c1bSYDsARBe530v7ZM/dIAdZTF9eLqrwnP1N6Ap5KoDXv5QZ3wuw02mVuWoPm2qqbhDU7zzXPEkLU0NvqmfrCZHjc2puDYszPnjzdLypgjzwGXmpljS3e1wssjfmkfOLGYIXxmdwNN7OJcvy62YVvmnUlXGuPrnZ1Bpnus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Oct 2022 18:00:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 v2 0/5] (v)pci: fixes related to memory decoding
 handling
Message-ID: <Y1gIIPdQWKDZkNVD@Air-de-Roger>
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <8a89c0fb-3d12-fcf9-7e53-d32f9904a3f6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a89c0fb-3d12-fcf9-7e53-d32f9904a3f6@suse.com>
X-ClientProxiedBy: LO4P265CA0233.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a1878f-f2af-4476-4137-08dab6a20f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vQsVDiujbXW943YDx9TpJP+WAD5/rZo9oJxeIYmb5fW0sa5fYFi/6u/H5VvhLDLLuZUzsHK449C96+2b17+815ilbWbN+M93YHIYXq750d5no+V6tpUG+IyNiO8E85/dQRmMpZmqDWAxLvX5oEcG3K1JckzfO4GrHJhZOiL7h/+W4kZga0fXnyZUmGU+0GAK4y0nBFKgQsPUyyZQb4zKbSEPa34TIt7Y7S+wsClPyrGvmX+zCs/wOvjmzY183zW259xsMG/PmGUxTcQrohmtqxDuBRWS/yxF2qhLtSFemK6wqsk+fOLGQgsLDbGTZbc5Lkv+F0NsyZVWy2VkOCwYAId/CvePr4zEYDpVUo2NwFsEDrk1B9yWYIv679N/NSo9b0+EkeHzfil4Wdf9LuHR/J4BDX2Hlc5fQAgCaA2y+GgwHMKBLX4I0ve2DCgyoS1H+OJysXHPHokd/NB9CIKE5H0vk7mu2ZpuQUAJAvDPoGSFOVsl7MsfWD3VH1YhqUhOtKhC3gu4cbgbnH3ySrgFBsq4a6cdSuUkP2mpSMnUcYYhcRIGmR5l7Ax8e5d6D0E7pa8A66CUwa2WoFFk6r5gx21O5zkdfER3savlrTuJltWJff7yvoOi0wd6VFCuhWrC71pXmtTRg+n/iQvb1ZUoM1R5uY0m075GieZaBDbEgB2x2uVAKDPkyWjydMWuJ97j20W9eShncbMIYKkbKHNPDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199015)(6666004)(41300700001)(4326008)(316002)(66556008)(5660300002)(186003)(66946007)(8676002)(2906002)(66476007)(33716001)(6506007)(478600001)(86362001)(85182001)(82960400001)(53546011)(8936002)(9686003)(26005)(6512007)(6486002)(83380400001)(38100700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NlhuRjYrY09Jb1UrLzZVem5GcEpQRGo2aVA4aTJQbGdNM25mb3I2Ry96ZzFi?=
 =?utf-8?B?Q2FGRWxYK05EMHFCWDM2ZFl4MEowVERwVlhqUmErZjUwMURWMHU3MDRhenFz?=
 =?utf-8?B?c0VaZ0hYc3A3NTN5OTVsK3FDN2l0clkrRGhqTGh1Y3JWTm1UVlRxL0ZJc3B5?=
 =?utf-8?B?bFpnL1ROT2JOZUQ4VUt1WFFuME1YR1NWTFdsM0tYZHptTjJnQmtjbWpEYVcx?=
 =?utf-8?B?QTVpTTUya1JqQmwyN2tUQ2VJVHVmbk9yNnB3SFk5Qy9ad01obXZZVVRyWlJ4?=
 =?utf-8?B?eTAyQ1ZqbFVqb2hZK0hSa3FQOTVja3BaMWwzaUhRWW9EM0dnTVBZL043QjlO?=
 =?utf-8?B?clNKQXVYbFN3cW41UWNPR0RyRTVSUnZXUkdJTXl5NjZjWGhOS0VrcHR1eTFE?=
 =?utf-8?B?TFlpUTduck5hWlgyS1hxdmlWZ3VHeTZTMFdRUkxGT0lEK0J1M1FYcGVPbkQr?=
 =?utf-8?B?YTh2V2ZLUXZQMFRHRE1pemp0akVaR2M5SHlid0FjbjVRemw5dmpZc1lIcnd1?=
 =?utf-8?B?bHh3MnBvSXczTlhlN09QZStRM2NIbHNBMmsvNFluUjA2MWZwMytRQUk3b1R4?=
 =?utf-8?B?UzdrSXNvVWlFWkpuZmMwczB1VkJpcjU3WmYxMEpjTGRGRzhBYUplQysrbWZB?=
 =?utf-8?B?SVpJZGxkaWgwSGY2N0NVSDBBZy9ZdVhtN3BETE9BRGM1eTRwQXhYZHBSWWlx?=
 =?utf-8?B?ZEtLbVEwa1JKS3JqQzZTOU5sVmJ2dzYwTkNmRjFPZWhDZGRqTjlCcEx0cVV4?=
 =?utf-8?B?WXlJd0FEUWx6Q0tBYldYV2NSaXd1OWVxQ2VXcGxlU1FrSFNQZjRzQkI5S053?=
 =?utf-8?B?TzRkc3hHcXl0UW5Md3hGZUVTQktEMWZpSjdiZGZVZ3pUVHM0ckI1V1pTeDFE?=
 =?utf-8?B?NDRqZU4rSXRlbVIzRVFqZTdad3Rpd2tSaGc3STlxQW0xVG95YnFrQ2NwQUdN?=
 =?utf-8?B?SUFvNXRlUTk3eHRRYjBwU3Vya0JxaENlYi95TzZkbGMzZTY4NXRaR2VNY2VR?=
 =?utf-8?B?YUJubmdpUnRteFhQMXRCM0k0aVp1QUtETlgxV0R0YWNWMnRCaGt3YnFRSTNm?=
 =?utf-8?B?U2ZCbkw0dGUxS09vaTlEcDV1MnJRMCsrMmNxUWsrbGVaT0hXZXVScGJoVFhL?=
 =?utf-8?B?WlZ5VGkzU0lOTzN4eDZRZTFadDZJdksrU0d5OGIreExIZSttZGREZ2EwRENT?=
 =?utf-8?B?cklsSDJRMXJFY2xnYk8vWloyY2NIQWZ0Nk15TUZId21ETjRlWStaUnZaN1dF?=
 =?utf-8?B?bmtjSWxTMUZPZFFtU3pWbjJIMmVrdzNlMk82RTcycWo4VHMralNJamJRUUFF?=
 =?utf-8?B?UjNaTmJUeE1uZjlYMzB6SVl2c1ZTYXQwQVJPeENMTi9kU2J6VnBzcU5XUXlF?=
 =?utf-8?B?UmttdWtUaHJpdk8reG9HSFdZZEtFZnpZWllRVjE4OTJYd0lXUHhiTnhybWlW?=
 =?utf-8?B?WnB1Y3YzQ2x5aG45VTV4UHNDMmpkcFNiVW5EWCtPV0o4R01LRGxTRlUyY1Mx?=
 =?utf-8?B?d3RFSzgrR3B0SHJhejMzUXY3N3ptbHF0MXBwcGpVUWtvVDM4TTlmeDltWEIw?=
 =?utf-8?B?aHhFaEQxYmU5NUVjRXVxdkwrdVRDTm1wZ0hONWxRT084SkZKSkJmQ2FsY0tF?=
 =?utf-8?B?SThGOW1FRnVWY3V0RmhocDRpVzBNZDB2cEFOV3ZveFdrRmdMNmRJUThuK1BD?=
 =?utf-8?B?RkF5SzZSVFFPN0dNQVAwQzhUOFFqUHQ2bzRaQnJxZjVFNGYyNDFDYXlyS01D?=
 =?utf-8?B?Q1lRZXRNS0ZuRUFIL3NSTkViT0lmZ1ZpbHlGNWtFTkE0MDd1bmxzNitrblVZ?=
 =?utf-8?B?OWpKQkJYWTYzOG53NzkxQ1M0UEtxSnVXL1JrU3ZWTXZzdmRDMWVnVHNZUkJk?=
 =?utf-8?B?cHZiWVR4cDA3RWNUL3Qwa1F3VERqYkY3bi9Hc0VlblJIQzZ5dHMwZUJNL2t1?=
 =?utf-8?B?RTQ0QUZyelNhaUxqaTIzdTh4ZUlOY29xSk5URjBDMGtFclpGN255cWhUMGhl?=
 =?utf-8?B?b251TDBqZE91cGpFcnFLRjcrZUUzSkJMUURIREpZL1BUTk8xTTFaYTdhL3I5?=
 =?utf-8?B?aGZDWjVYcGJON1pkUVJNS3BvdkRzaVpES3hxZjRBUUhpZndJdlFWMWpoRSt3?=
 =?utf-8?B?dEZDLy9kNng3UEFVbFZ0UjVJZUNnT205NG1ENnNocXFkTWV0OEpUN3RwVGZk?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a1878f-f2af-4476-4137-08dab6a20f0d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 16:00:39.1247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeGnPHmYRTsmSqH9aFTXjsQ1v2+57gZbGkmiZqDoYXXyIiAdRgObp92rY52VrD07BF7S5urSegaCI46s59JgeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6745

On Tue, Oct 25, 2022 at 05:02:41PM +0200, Jan Beulich wrote:
> On 25.10.2022 16:44, Roger Pau Monne wrote:
> > Hello,
> > 
> > This patch series attempts to fix the regressions caused by 75cc460a1b
> > ('xen/pci: detect when BARs are not suitably positioned') and the last
> > patch relaxes the check done when attempting to write to BARs with
> > memory decoding enabled.
> > 
> > I consider all of them bug fixes, albeit the last patch is not fixing a
> > regression (since vPCI code has always behaved this way).
> > 
> > Thanks, Roger.
> > 
> > Roger Pau Monne (5):
> >   vpci: don't assume that vpci per-device data exists unconditionally
> >   vpci/msix: remove from table list on detach
> >   vpci: introduce a local vpci_bar variable to modify_decoding()
> >   pci: do not disable memory decoding for devices
> >   vpci: refuse BAR writes only if the BAR is mapped
> 
> Looks like you've lost Henry's release-ack that was given for all of v1
> (i.e. only patch 2 isn't covered by it).

I was worry about adding it again for the whole series (except patch
2), as I think release-acks are conditional to the time they are
given.  IOW: a release-ack given for a previous series sent maybe
weeks ago shouldn't be carried over because conditions to get changes
accepted might be tighter as we progress with the release.

I think Henry would be fine to reassess the suitability of the series
once it gets properly Acked.

Thanks, Roger.

