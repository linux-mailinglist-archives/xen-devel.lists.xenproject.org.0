Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAFD50A379
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 16:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310291.527044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYEv-0001fm-5R; Thu, 21 Apr 2022 14:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310291.527044; Thu, 21 Apr 2022 14:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhYEv-0001dd-1c; Thu, 21 Apr 2022 14:57:01 +0000
Received: by outflank-mailman (input) for mailman id 310291;
 Thu, 21 Apr 2022 14:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1dP=U7=citrix.com=prvs=1038dedf8=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhYEt-0001dX-Du
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 14:56:59 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46bcc082-c183-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 16:56:53 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 10:56:53 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN6PR03MB3377.namprd03.prod.outlook.com (2603:10b6:405:3d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Thu, 21 Apr
 2022 14:56:52 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 14:56:52 +0000
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
X-Inumbo-ID: 46bcc082-c183-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650553017;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=WbsfcHuLZf+jTz+4M6GujZ7G+iq+9aFPnAdUHPTJzgw=;
  b=UDkYdXwERoEABwM1pxANqpN1NyXjrOFJqepKgGie9pXaFjbPnWzUzPSj
   M5H81lxIqzZ1bRzyBVcaWwMPgLXinSq+cbstTkbfuhpuqesK2/5ZmvUe2
   iQ4S3Fi/Zz23+EkqGAT92i1dIIgngmtsrX36fntrdO/76J7Lz5OWAUDrC
   Y=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 69639772
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zOXOR63pul7P0X5m7/bD5ZJxkn2cJEfYwER7XKvMYLTBsI5bpzMHy
 TAdWWqCOfzZMTf9c9ogPYS1pkMFvpCGzNM2QANupC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tIy2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1iiqDgFER4Y5SRheM8XVp2AipGY5xvreqvzXiX6aR/zmXgWl61mbBCKR9zOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82SBfyVu7e03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutrieuLWYJ9w3PzUYxy3ri6wZpyLH0C8XYWPiFV/tfxEuah
 W2TqgwVBTlfbrRz0wGt/mq3g+7TnQvyQI8ICKCj7flunUGSwWoIThYRUDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYiXN5XH/w/+Ru64KPe6AaEBUAJVjdELtchsaceWjgCx
 lKP2dTzClRHq7aSVW7b+r6KrCiaIjQcN2sLb2kFSmMt4dDlrJsikxHnQdNqEarzhdrwcRnr2
 CyDpiU6g7QVjOYI2r+98FSBhCijzrDLUwo06wP/Tm+jqARja+aNbYGy9ULS6/oGKY+DV0SAp
 1ANgc3Y5+cLZbmPniGQROQGHJmy+u2IdjbbhDZHE5co+Dus/HqiVZtN+zw4L0BsWu4IdjPkb
 1XakR9A759Uen2xZOl4ZJzZNigx5a3pFNCgWvWKaNNLO8J1bFXeo38oYlOM1WfwlkRqibs4J
 ZqQbcerCzAdFLhjyz21Aewa1NfH2xwD+I8afrijpzzP7FZUTCX9pWstWLdWUt0E0Q==
IronPort-HdrOrdr: A9a23:S72yt6poxKMCjo6CiKG9lBcaV5rbeYIsimQD101hICG9Evb0qy
 nOpoV96faQslwssR4b9uxoVJPvfZqYz+8X3WBzB8bHYOCFgguVxehZhOOP/9SjIVydygc078
 xdmsNFebjN5DZB7PoT4GODYqodKNvsytHWuQ8JpU0dMz2DaMtbnnZE4h7wKDwReOHfb6BJbq
 Z14KB81kOdUEVSVOuXLF8fUdPOotXa/aiWHCLvV3YcmXGzZSrD0s+ALySl
X-IronPort-AV: E=Sophos;i="5.90,279,1643691600"; 
   d="scan'208";a="69639772"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpYNDA8loocN6V9sXs9GFFoWleQq8ZLvF9nu3mHx+yxNPrK4VW/W9RJ2wveReIvwhxgl0oHUnnDf42LvfjxdOwbI1eawEDsQU6lbe+kxSrdqafQ/15t2kbFaBnsRNptDBgyUX2eRI4XxQ1ooSNTYl1cGlniOG+/T9tbwiwU3tKllARYyveupgVvmoMRJ3s7SHoTVb3VCFUOtOpnZNsN+ECjab5AV68iiNP1We9AeVpy0SETIP/AbVKyQmIOfuD/luU2ev4gecWZ6CNpMFW3h571+G6QWlQWAZGRd+lFovWH9AQNOdeNtn3eBzSllyNp7R+pRW7hFr5Pm4gkXy48jAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1pxBJommfTjdXLPGqXVOjDmAqIo4pL05sOyBNfBBUA=;
 b=IjxFn5oTKgVIQTMAlwO7HQ3WPwpDHX7v74eFuAkWza3fwJAspiDEkdMegr1r0PAvTAL6Y8Ppp5WzwAiZ4joTWSaL3neQ66/TeapdoBdL7Brw0MploxLLc3tSYjVr/WOWMTRkFfqztETwaCqFujA+AolOmIF1lfYO2UFXxYx7f8Tn2dWiwW3z7nV+1EOxQOV83L72XJU8i+Fxi6e1Y07cju0aliNeoBuc9dLMm3KcZXNNhjMISfP9Lv7QLATisDEiLGRDWme22Q7v6CItxC+YCRlfvc8/JcqfLdUrIParBYhedog6Fwhno84VhPx+9L2MqubwaUVrlPO65sFdTYQlGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1pxBJommfTjdXLPGqXVOjDmAqIo4pL05sOyBNfBBUA=;
 b=Gkzne/jdDoMflczI/9KePeFi1yKybYl/atwmuPPI7C+vjUkSmcqJCi1IjFafQmFj6qWhZ3eJDVQsDd1upy4622p3z0yVoJWQFJmCTByiKMx67KFbslinoSSDuaI+2mSRVK3ljQJ2/To+HwKzz48dZDvt0yMKYVWTqgbiKtGADE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 21 Apr 2022 16:56:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel@lists.xenproject.org,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>, scott.davis@starlab.io, jandryuk@gmail.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2 1/2] xsm: create idle domain privieged and demote
 after setup
Message-ID: <YmFwr6G1xbpk1sQG@Air-de-Roger>
References: <20220420222834.5478-1-dpsmith@apertussolutions.com>
 <20220420222834.5478-2-dpsmith@apertussolutions.com>
 <YmEpoDHpGP3xkAQ/@Air-de-Roger>
 <0b1b2f7b-dc81-af95-8591-4362ae0b85f9@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b1b2f7b-dc81-af95-8591-4362ae0b85f9@apertussolutions.com>
X-ClientProxiedBy: MRXP264CA0042.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 053001dc-2912-4054-916d-08da23a72b4b
X-MS-TrafficTypeDiagnostic: BN6PR03MB3377:EE_
X-Microsoft-Antispam-PRVS:
	<BN6PR03MB3377C86704BEB0AB6A5B3E058FF49@BN6PR03MB3377.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c6M9fQdOg8OOeLkOimTdxUre9qQ+c0g8Ww1rEwF8V7zttbUh7Ae8eZiENZya7bCwB5R1cPPIsckRRCk+pvtAAR7aeLPa+tp96ObhRrBEDxGVXa2F+19QqkyVXx198lErPAtPshxprg+Nj18iOQZl6XkiiLcZiLuaUVc8JiU9X93pgTaOypseonBEncXQxeLNIXZo+e891XXkOlt4xnaO3nVsHUdlXFwZlfp8DqMfJOgP3mZPgf445zMJkBBbKmHuK5RZduyvqehhVzAR1N5RXV8LeMdLGDo/F/Pnhz10TlDGf91FeQr0csaxzPEw9vs63II92///Z9gV4YV3BMq9rTyr1HmYNjr8kyEASFIj1YLLwQCk1qTOwS1XO5P3hMbrLVtTZWYOQBppRySKN3Y26pBH6XEfzTdi8lp0655hCR8EMf3CMun3pnFkB6KIXLbsJOfGFAW3e303kaDR76P+zgHshciFKLJlP92+UFmtBvXSHNOFbiMNGZubdNs9qGFryiB12SKaLrStNZ1R6ZuRiMn2NNKcpnxt9h8nZwskItMtiJSXQjHrlmd7iKUm4bIwgEhm0iQuHnJW1YNEOEWh76iLo4iL5rb7Of7zvZzS+7adGQ59OxPgEKxehqpiOUvMJGbR/ojhbOU3Zl2YWpyrjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(508600001)(66556008)(6666004)(86362001)(186003)(66476007)(8936002)(316002)(7416002)(8676002)(66946007)(6916009)(54906003)(33716001)(5660300002)(38100700002)(85182001)(2906002)(53546011)(83380400001)(82960400001)(6486002)(4326008)(26005)(6512007)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmFSd0FKbFhMU01XNm5FMFc3TVVEbTBLQjN5dlV1dU1CakptYUNWTVNaTlB0?=
 =?utf-8?B?T1NSTFRyOUNOS2pNd0tpZHhqMkhZUUZ0RXpaWWxjY05Bd3hkb0JVQWZwbnY5?=
 =?utf-8?B?Q09zbTI1cFg5anRQS3kvamtqblRDMnJ5M01jaUNIbkhVSFhtMXZVN1NlQ0Vs?=
 =?utf-8?B?NEo5ZzIwcmE4cFVsWnNjMVVZRlNKM1ZBamtQclpkMnNrajU2RG0rdCtTRDhq?=
 =?utf-8?B?Um1zaHlnMy9ZRndiLytxQ1FYTzBweWlMRUE1MFRUVmd6cWpJU1k2bEVtK01F?=
 =?utf-8?B?dG96VnhKTlpsU3FyNFdQdjkwdkRnNjBBZ1FrRDhnS1I0TW1sZHQwYVJzZVNX?=
 =?utf-8?B?OWdoL1VnTzdRRm5aUjZ2U3I1cXF1YytWa0RYY2xOMUFoQ1lacjZxdndkMGh6?=
 =?utf-8?B?bUlFSEdjUzhIZFQxN1k5UnNYbzl1M0FpWHFDdFlHMmFXY0FLYWwwT2tiSUtl?=
 =?utf-8?B?YVlyc3QvMThUSFZSQnJ5ZGRRMWRMQzdNV2N5ZW5TaVpCTS9LcGg2KzZwUTlH?=
 =?utf-8?B?WTFhRUEvdkVlQjh3VWpuUEhpbVNadFpyNngrVkxJbTRIQVVEMG50VnI0MVlH?=
 =?utf-8?B?UnRmaXVGMXc1ZitVS2d6dEhFTHdKZnhCZ21ZaWhuaG5lWmxJTnppSWJDRnVS?=
 =?utf-8?B?SXdrTGZhelI1anQwQjhtN2x6OTVyQUtkcVkzcm9pQ1lPc0ZFbFN3WWFrU2lJ?=
 =?utf-8?B?NHBtbC8wYVh5ekhrN0pkTEFMelI2b0ZEazBhaUFhKzdPSC9CQ3prS1R1MDZJ?=
 =?utf-8?B?b2tBMmpHMC9FV3Q5QUZSZ0hlRU44ZUNCWnBSL1ZEZEduSkV0b1QyU0JBZE9H?=
 =?utf-8?B?OHkvSjB6Y0xPSDRlSlJJWEFPL2ttemVqZVFHdmdLeEt3ZE9INmVPOEd5MkFR?=
 =?utf-8?B?OUdEWVRMQ2htTXpZYlpUcWMzN2ZzalJyaTNaaXlQZVhmNEF4Zi9VLzZVeEYv?=
 =?utf-8?B?eHpQVjhCZ2VKMkdHUmwwMTZMQ2FzclVVWi9rNGQ5UHlhbmdROVBIQlY4eGRE?=
 =?utf-8?B?QzYzQ2ZQR3JOa1Y2eVd2K0UwdjRjR3NUenNPYXBUMGZyam1aL291Vnpjbkw5?=
 =?utf-8?B?d1c1QkR1bXhZOUUzUkxtUEdqYjR6NmJNRzh1V1lOQU1ML0lyaTVoZjEyR0xC?=
 =?utf-8?B?dm42V3FYeFlZb010akM5a2UwZ3JmbUFlbVBDQVd0bUg2SnpQRU9XMGNGNDU0?=
 =?utf-8?B?OUFiZ2x4K1ZBc0ZmVXRwODlFWVpuZWJLSFlIRHhBZThrMkxadTI4eGVqNWZZ?=
 =?utf-8?B?VXZLQW8vbmJXbkd1K1ExK0xEODMxVW9aVU9kMVp1QTkyV2hiVDVFeExmZ25G?=
 =?utf-8?B?VUlIUFNZY1NmaDZzbU1TbVZqS0N0S1NnQ1pVcUI0UWFLbHYzNHBaRTZBalN3?=
 =?utf-8?B?ZCtnVWU2dm1xK3YxOEJmNDVpanVNTUx2RUgrdTdKZUlkdlNhR2pqRGZKQkgw?=
 =?utf-8?B?WlZLVnJ4Q0hNcmlOV0VvTVRROWdLV1pFVC9MQ2lOWUFlY0tSV0R3NFNYQWlI?=
 =?utf-8?B?QS9FYTZpcmRFNEozanVRZHNxUFRFYk1BUnpFdzMrYnZ2L01JcFV1QVZKVTlG?=
 =?utf-8?B?SDhYZ2Zyakt1ZDg2T3EvYUs0bnp6K2dnVFpYcWI0WVJLWFY3NUxTQlRWbnh6?=
 =?utf-8?B?bTAzL0lZdnRHOEFnUHQxS1V4akhkN1AzS2FaWktteHlLV0YybFByWVNsSWRq?=
 =?utf-8?B?M0ptYnJpMWgyTEJ0Y056WS9DamM4NE1BcHVUZWQ4UUxXdW5GYTVNOUVUM0x6?=
 =?utf-8?B?UzdlZTZhRjc3NVVDRktqM2FtcTN6bFJsNk9weFU3ay9FL1RCTXFiNW5KNmlv?=
 =?utf-8?B?WkVXSVFOemh5T3JWNGxod1FSQzZnUERmQUxUU1NaalpQYlluUU1zNkt3UWkr?=
 =?utf-8?B?Y3ZaU1EzS25adjR6dDZSc0I4aUhET1JGMUNBQnJ4YzBwRUZUUGUyZHg1cU4w?=
 =?utf-8?B?ZEN3UXpCZXJ1RjZNSlRtMVdYVEpoR2dMT1pTSnpjMjFBb3ZzNUFIMUtUcE92?=
 =?utf-8?B?aVRpUVNNM2J1M290b1pwVHhkczk0enFTOHIvc3d0enZnSG1lUFY5TmRNazZy?=
 =?utf-8?B?OGU1UWgySk4vRWNrNTA3KzFaUXZSWnA0aXVaQklJMHBYUVorTWRsSHZkYVpM?=
 =?utf-8?B?QlQva3FFSVRFUEtyaWEyWjFIMTJkWE9rWWxrR3daZGVQUzlMRWZvN0xWWFI4?=
 =?utf-8?B?b1ZZZWE2M2ZuUW1JUFZ5NCtaQ3pNaWVlU21YdEpjZHF4VTVMQkZUcHdnSDB2?=
 =?utf-8?B?K042YSt2bXZsSm9LaWNBK21kZmJoTG1yRHlhTjJOK1lrVEV6Q3hOdUs5aVNX?=
 =?utf-8?B?MnNHeWozTkkybk5aaGNWaS9PaThVbTlib21FemN3YTBtd1kyR3E4eFJPbHMx?=
 =?utf-8?Q?5mpIVxMDs3yf5rkw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053001dc-2912-4054-916d-08da23a72b4b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 14:56:52.0635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ts8vtrykXbMcxn2Ci/KvHxUbDXfTtN4kjnj4LiSpppCfHQbCSgRzJgRil4USuUb20JTEks839Mh2yXga557u2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3377

On Thu, Apr 21, 2022 at 10:14:18AM -0400, Daniel P. Smith wrote:
> On 4/21/22 05:53, Roger Pau Monné wrote:
> > On Wed, Apr 20, 2022 at 06:28:33PM -0400, Daniel P. Smith wrote:
> >> There are now instances where internal hypervisor logic needs to make resource
> >> allocation calls that are protectd by XSM checks. The internal hypervisor logic
> >> is represented a number of system domains which by designed are represented by
> >> non-privileged struct domain instances. To enable these logic blocks to
> >> function correctly but in a controlled manner, this commit changes the idle
> >> domain to be created as a privileged domain under the default policy, which is
> >> inherited by the SILO policy, and demoted before transitioning to running. A
> >> new XSM hook, xsm_transition_running, is introduced to allow each XSM policy
> >> type to demote the idle domain appropriately for that policy type.
> >>
> >> For flask a stub is added to ensure that flask policy system will function
> >> correctly with this patch until flask is extended with support for starting the
> >> idle domain privileged and properly demoting it on the call to
> >> xsm_transtion_running.
> >>
> >> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >> ---
> >>  xen/arch/arm/setup.c    |  6 ++++++
> >>  xen/arch/x86/setup.c    |  6 ++++++
> >>  xen/common/sched/core.c |  7 ++++++-
> >>  xen/include/xsm/dummy.h | 12 ++++++++++++
> >>  xen/include/xsm/xsm.h   |  6 ++++++
> >>  xen/xsm/dummy.c         |  1 +
> >>  xen/xsm/flask/hooks.c   | 15 +++++++++++++++
> >>  7 files changed, 52 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> >> index d5d0792ed4..763835aeb5 100644
> >> --- a/xen/arch/arm/setup.c
> >> +++ b/xen/arch/arm/setup.c
> >> @@ -1048,6 +1048,12 @@ void __init start_xen(unsigned long boot_phys_offset,
> >>      /* Hide UART from DOM0 if we're using it */
> >>      serial_endboot();
> >>  
> >> +    xsm_transition_running();
> > 
> > Could we put depriv or dipriviledge somewhere here? 'transition' seem to
> > ambiguous IMO (but I'm not a native speaker).
> > 
> > xsm_{depriv,demote}_current();
> 
> Let me say this explanation is not to say no but to give context to the
> concerns. Forms of deprive/demote were considered though when
> considering the concept proposed was to change the security model where
> the hypervisor/idle domain were now explicitly being give a new security
> context, is_privileged and xenboot_t, under which setup is being run.
> This new xsm hook is to provide a transition point for the XSM policies
> to set what the running security context should be for the
> hypervisor/idle domain. The name xsm_transition_running() clearly
> denotes when/where this hook should be used, where as the name
> xsm_depriv_current() is more generic and another developer may attempt
> to use it in a manner it was not intended.

Hm, I see. I (wrongly) originally understood it was related to making
a transition in the running context, rather than the context being
changed to the running state.

Maybe xsm_{transition_,set_,}system_active() to better match the
system_state?

Albeit now that I understand it's purpose it doesn't feel so weird.

> >> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> >> index 19ab678181..22a619e260 100644
> >> --- a/xen/common/sched/core.c
> >> +++ b/xen/common/sched/core.c
> >> @@ -3021,7 +3021,12 @@ void __init scheduler_init(void)
> >>          sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
> >>      }
> >>  
> >> -    idle_domain = domain_create(DOMID_IDLE, NULL, 0);
> >> +    /*
> >> +     * idle dom is created privileged to ensure unrestricted access during
> >> +     * setup and will be demoted by xsm_transition_running when setup is
> >> +     * complete
> >> +     */
> >> +    idle_domain = domain_create(DOMID_IDLE, NULL, CDF_privileged);
> >>      BUG_ON(IS_ERR(idle_domain));
> >>      BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
> >>      idle_domain->vcpu = idle_vcpu;
> >> diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
> >> index 58afc1d589..b33f0ec672 100644
> >> --- a/xen/include/xsm/dummy.h
> >> +++ b/xen/include/xsm/dummy.h
> >> @@ -101,6 +101,18 @@ static always_inline int xsm_default_action(
> >>      }
> >>  }
> >>  
> >> +static XSM_INLINE void cf_check xsm_transition_running(void)
> >> +{
> >> +    struct domain *d = current->domain;
> >> +
> >> +    if ( d->domain_id != DOMID_IDLE )
> >> +        panic("xsm_transition_running should only be called by idle domain\n");
> > 
> > Could you also add a check that d->is_privileged == true?
> 
> Are you thinking along the lines of,
> 
>     if ( (!d->is_privileged) || (d->domain_id != DOMID_IDLE)
>         panic("some message\n");
> 
> or is your concern more of,
> 
>     if ( !d->is_privileged )
>         return;
> 
> In my mind the former is legitimate because execution should only arrive
> here with current->domain being the idle domain and is_privileged set to
> true.

I was thinking about the former, maybe adding it as a separate
condition so you can print a specific panic message, or joined with
the other if the panic message can be adjusted to fit both conditions.

Thanks, Roger.

