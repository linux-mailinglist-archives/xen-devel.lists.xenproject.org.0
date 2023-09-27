Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AC77B062A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 16:05:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608968.947839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlVAM-0001yR-E2; Wed, 27 Sep 2023 14:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608968.947839; Wed, 27 Sep 2023 14:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlVAM-0001vr-Aa; Wed, 27 Sep 2023 14:05:26 +0000
Received: by outflank-mailman (input) for mailman id 608968;
 Wed, 27 Sep 2023 14:05:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlVAK-0001uJ-PQ
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 14:05:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e48b0447-5d3e-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 16:05:21 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 10:05:18 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MN2PR03MB5216.namprd03.prod.outlook.com (2603:10b6:208:1e8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 14:05:14 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 14:05:14 +0000
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
X-Inumbo-ID: e48b0447-5d3e-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695823521;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bId/R5AcRuBPskvSnradQMBGg/Ic7MLDd7+Ah9kx4uo=;
  b=efPN3SxnXUg92iejcf2Vw5D7h+mckBHKBKw//o2LYYxgWixv+1REzjst
   OiJQN6eDmd1yBWgfFRTsshxrIal1dUu4GYS2MIpnudkPYpgDv/WFoDUz2
   RuaTFrWm/jcy1m6e++SWq5nRmh6LdNJKUaNCRS6lqPLK4y0FAPtVvkFRR
   A=;
X-CSE-ConnectionGUID: 2DihEJlYQF2lACKiLh0XFA==
X-CSE-MsgGUID: 4bDrnj6sQ1iOLrq2F9tSCQ==
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 123967447
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:rbl8E6sZmYEZ7PTxqZhA+/nR1efnVLNfMUV32f8akzHdYApBsoF/q
 tZmKWqBOPfeYWD9Ltx2aIiz8xwA65OHmNdgSwo5/y48ESkW+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5A6EyCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwchwMbj2hg9OP7ui/Y8JPh+AjdPnFFdZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIW9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAtlDSuLkqqECbFu7mmY/EhsUC0CC+PierlSnAfwON
 3c/w397xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf67OVoDWaKSUTa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnY3
 DSivCU4wbIJgqYjy6y+9EvvnzGoq57GXwMxoA7QWwqYAhhRYYekY8mt9gLd5PMZdIKBFADZ4
 z4DhtSU6/0IAdeVjiuRTe4RHbavofGYLDnbhl0pFJ4kn9iwx0OekUlryGkWDC9U3gwsI1cFv
 Ge7Vdtt2aJu
IronPort-HdrOrdr: A9a23:EQD7W6NTIaS2o8BcT4T155DYdb4zR+YMi2TDtnoBPCC9F/by+f
 xG88566faKskdsZJhNo7G90cq7MADhHOBOkOss1N6ZNWGNhILCFvAA0WKN+UyEJ8X0ntQtqp
 uJG8JFZOEZZjJB4voTL2ODfuoI8Z2/1OSNuM+b9nFqSGhRGtNdB8USMHfkLqWzLjM2dabQ0f
 Cnl7t6TkGbCBAqR/X+PGABQ+/A4/XTjfvdEGc7Li9i0hCKkTSrrJXnEx2Uty1uLg9n8PMZ6G
 3YlA68wa2mv5iAu3jh/l6W1Y1ShNzijv1cA8CW4/JlTAnEu0KTfYF8XL/HhhAZydvfkGoCoZ
 33uhI9OMY20X/LYW2vhhPo12DboU0Twk6n80acnXzg5fP0Xyg7Dc0pv/MiTifk
X-Talos-CUID: =?us-ascii?q?9a23=3Avq4HfWkosu3DETk171WopuvBxJbXOSfxzXf9AUu?=
 =?us-ascii?q?JMEgzTJS+al60+PtUveM7zg=3D=3D?=
X-Talos-MUID: 9a23:mc1RWQZ7WrYuHOBT6zXAnjdgatxRuqWJLFoUy7tXp/KvDHkl
X-IronPort-AV: E=Sophos;i="6.03,181,1694750400"; 
   d="scan'208";a="123967447"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7mIBRJOMVSrp54mgTOfTBzDcgbUdIYBxe2rCVFzuha9EyzEifYeQvZ12pLxMyxmT0rAZ3q7UYLyq/Tr0Dyi6NyJ7SSkwpQYnhSDTdJkZv4uJjEt4sWLFU0wRnn170N10omB0Cg13G3WTi4eWe+e4/6Hz5cHV8IjgwWWNKD4WP5HXnnAojO4JN1xbbbpOQA7ICOgLnYzADrtt21/G6/FNYXKXARU1SSZg+4YNxKITVH6e428RzJK2QNQlo4hPbQoyTsRpGmazJkHgZ7auIq/9B4bkdH3Po3GWf9YAmH0jDYtjtNEi0uu5aa+hyeeJQkLY6dNUJ8ro2clpdygGYZnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZCpo1kYmrtGA7YUPTTNRPeaWU/m5QXz0Aotta5mofc=;
 b=VSANVzZNexma0OKMT42CSI0KfOk/xnYbLFDM1x7Stk3NpkkTCHHlGyV9EIm03ABh6dzkicsdXLdPtur1Hqm+0xjFY1BUwZAukrbmUZmCQf6s8E4vbLDq0QMZ27zMpFSSg0LdU/0OPel5CF/W7SeeBC8etCLsHDQOt/0lR9bweiI7tKQAn0lFm3t2mPhThbEM6w3q45whI0eeyAe3gLXF+B66emRlwvq+N35eKMxYNRI5nXXE0mTmKamjmdIhb/RvHKWYSF2N0peT9DXy/yBiIN3ksZzRaKstfkHJvU+Z9o8s+SrF0KWGWN3Fvs/nO1uBEE67p9psl6uMuwFCmFpKBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZCpo1kYmrtGA7YUPTTNRPeaWU/m5QXz0Aotta5mofc=;
 b=jy8Cjy5//domi6JEEY4+EZ4/b8kX4vJf1xrGWbYgVS3modDMI6JWtK949otFtqQ/ZGF688IkaJiTE3lo2HdqHrXfpnLzl6jT9b57Zd0gl+ykWXb1SaosjGSsxk9RP9hGYZEn7JiIOCtm29Qp9GS3O8M3VeiuEO4Sfcui0yyEbik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 16:05:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v3 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Message-ID: <ZRQ2lHBHDlHJKYzp@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <a79d2a8b-6d6e-bd31-b079-a30b555e5fd0@suse.com>
 <ZRQNHyggOFD1FuMD@MacBookPdeRoger>
 <6b55a773-c005-f524-531c-45247cac1d55@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b55a773-c005-f524-531c-45247cac1d55@suse.com>
X-ClientProxiedBy: LO4P123CA0429.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MN2PR03MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e343fcd-6b53-480d-f080-08dbbf62c530
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W6o6NpfY6sUfHMBTc9qZILHBTBJDQaBa1q2gUjinjEp/eQKDIPID9h7faGaP+8XRgSLlCmkWMDtiLfICPPzB8HQ0gimasu+O6puTqy8c3d00atn9D9EwEFrPUoNb9tkgz/MGEVLccVK/3viLz3PvJ1LddCryOaSu/9WCGzRIH5tPK5iTd1QK8lgyyjDxNQgcp5COXc4y5KYqizCSX+E4K0SQM9l1Px+AI23HT/aNwhXylBGksihIHE4Qmj0wC/akFZ95VY6VV4rywFL1osibcMgkBvZjR0/Q90EHHZm9cJr7U5t9kYXisU9yVy5yNEx5wCb4P1Sq5HG5btfngAfAimS86TdN56cnL6sYkQMjIBFofmS5/d7YCajZOU+WbZq+CbTJUxyvaFJShiTquC2c0hHy4Y8ElXDLT7aqcotsHEu4kfndqQ3NALueVtP/FMqLIjL2ftOmKo+XfKrmsYbCdLOoo88mKuuct+Ty9v1QaQ8s28QWKtjqwRWReofifhJbaSuAuvvx70sY9GxACxfvIUQyGHC0MZN+gQUFbGqZ1MIkzIsPlabZ9xqV0D36e2Sw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(376002)(366004)(396003)(39860400002)(136003)(230922051799003)(451199024)(186009)(1800799009)(8676002)(8936002)(41300700001)(2906002)(26005)(4326008)(478600001)(66476007)(316002)(66946007)(5660300002)(54906003)(6916009)(66556008)(6506007)(6666004)(53546011)(6486002)(6512007)(9686003)(85182001)(33716001)(86362001)(83380400001)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFd5QUZqTUxrMzdjYm8ySW5ocWJpdklCVnNzdHJVYlRnZWZNR0krSzNUbEYr?=
 =?utf-8?B?ZmE4M2swOXFaUXNma0RRRFppdllLRVJXN0ZYV3F5cSt1YWhrVW5pYldrL0ZN?=
 =?utf-8?B?dEZhQmVWQmlKaGRxbkVJOGJMYnZaYUk1S01ibHc5TXdidGFMejlqNjFvTHVo?=
 =?utf-8?B?RUlFQlVRUFg1c2FFL043N2t0Y3VwdTZYWi9GSytaUlBSeE9wWVEveDVicGxM?=
 =?utf-8?B?QVh0ckp0dlg0RHcrWDVnOWRlWmhJM1NJWEpxSGZnaVdxOTM1Ly8vMk13dFN4?=
 =?utf-8?B?REJCSGo3ZFFQM3Q3UUphejMwNW1hcTJ0NXJYM3RTYVhxYzhodG5oV3FGTGt3?=
 =?utf-8?B?Z0Fya0VjL2Rpc1ZMOG5FcnFUTVFjSUZqdlVNNWZHN1plRnRDRUtlaHZXSXR5?=
 =?utf-8?B?Yy9MbURHanppSUo1cEdac2JzZ2hWaG44SGlUUmRPT04rT2wzd25kUTJrd0dG?=
 =?utf-8?B?QWNLTlBRSllpS3B2UmFVZjEvL29Yc3NnekRWL1E3QlA2YU5ZVG5NSnVlTEtV?=
 =?utf-8?B?RXpwS0R1ZHBsdVNUL005MFYvVTF2V1h3ZFhqRno3VHBISDRVQWs1RjBKMU1q?=
 =?utf-8?B?UDJUUWZFem5VUWc4MzgzanNsUUxTdXE0dHg2VXBMVkhXL1pWOUg2c2NFcXB5?=
 =?utf-8?B?bTcxQlJXNDQwakxCaWR1YWtoTjBBaW5IeWp1OG4wd3h0ajRBZ0hnZStYKzZF?=
 =?utf-8?B?U1p1aGdQVGNoWlNxMHJFMlRzNUdtb3NiRjhNVUNVaHI1eU12YnQwZFVxdGkx?=
 =?utf-8?B?V3JzUmVYODJKdXpOTzF1NDJyWG94cVRUdU5SbGNhZUxVc1ZkSHh2TTNzQmFt?=
 =?utf-8?B?dEVIaFJIazhzem9xUmxTS3Z0ejJBQVlRaDRsOVJzRjJwSWFGUE5NZnRNQkMx?=
 =?utf-8?B?SGlEbWxjeXlRR3ZraWZwUHp2SXJvekorbXVtVjlVeTQ1ejhpTzl2M1VHYU00?=
 =?utf-8?B?bm8wemxCU3Mwc2w4eVo1eWlRY2lNU3lEbFBqMGdDQVBKTzBmc1BlOGpyWk5E?=
 =?utf-8?B?c2dDUVVzK3BwV0UxK2hxd3haZE9UcEV6TUxmb1NuQjNPTnpFem1RRHRaYlVZ?=
 =?utf-8?B?cTZqYUVpdTBpYjN0ZXN1QU4zaWI4TGJIOThBekJSNnBrUU5OQ0lWd1dWMnph?=
 =?utf-8?B?bnE1L2I2NVNROEdJUVVYWWVWZkQ4OHZMMjFiUEpWdGlMMWIycUsyK1haMGVi?=
 =?utf-8?B?ZHp1Wnp5ZXZTMDlFSHlCK3dacVNUNVhmc2FlVG90YnZxMFBWNmtkS292WkNS?=
 =?utf-8?B?SW80STBXcVhLcVU2L3djQ1IyemtyOGM3M0d4MzhTeXVIb3pya0piNzl2VXRr?=
 =?utf-8?B?YmdEVmwxTWRGT2swZ1cra052YU9OaksxY2d0YUpOU3JCaERTNVo2WkNPaDB0?=
 =?utf-8?B?T2V0djRVcTdYYnhLWGtoNHRzNnVheXo2cGhoSVI3cmIya0s5YTJTVngrd2F3?=
 =?utf-8?B?aForU0xZYjZyNWZaT2ZVSlhyMXUzZmo3bm5FQlF3Z2dMcjllamdhaHRLd25h?=
 =?utf-8?B?WU5HT0tNcnVhYkZGd3NtdHdFOHAwd2duaVJCZmtjNDVBUHJhUXFkT3c0RkpK?=
 =?utf-8?B?Tis4U1VtUUlqNWJLb2tacG5FSDBxM0JHUTJQVTFUNzQrczJOQTdTdDNYMjZ2?=
 =?utf-8?B?TXpoNGRKbXMwQ2JoNXFIS0ZVZUhxUE5mMVlxaXdsT1lROXQxQmpJSkFSNkNN?=
 =?utf-8?B?a09zWHdVRlJsYlo0cDJoaU1JUGRJYzlkbTNHY1RuRlpQWHdFekJnMjJHODVr?=
 =?utf-8?B?T1Y4UGp6c0Jpa3NuNTdSVFpkVFhySlNFczg0U0pubjJrd0dUeEw3QzBSMU0r?=
 =?utf-8?B?Vlp2ZzF0bGIwbXVLVXdmSSswaXM3RHNrRnNrYmhCR3RLWGJDMWNSL1NoWmtR?=
 =?utf-8?B?bERZMjNJVjN6N05YeUNJSGdsNU1PNU5NU1JYNVZkNklVK3g1ZndrMXFTdVVZ?=
 =?utf-8?B?QlNVdlJONFNZRjNwaFhRRmFmZ1ltMk5QV2Nra05vYXVTWFo0VEMxdzFibUVs?=
 =?utf-8?B?MzFTSWRhWGxVakNKUU8zemNhZWdTRjl5Ny9OZ2pHVTdMNTJFak44NXY2MjN4?=
 =?utf-8?B?Y25NSnJ1dWwxaWJvb1hPdDZJZDVjVmVqdDVNalNkdU9ud1N6RzhZTFhxZnlj?=
 =?utf-8?B?aWlRdXY5c2lxaUtDQVprMXVzOXptbUs3b0RzNjM2ako4SG1rRjRxRkdaclZI?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o4qPEMpSLWd+M73KuRRI4LsFImUigSnqcYjgooPrYGMxr8RzIG1z5IhWWZ3v6fKWf77WMF225XRBeWiKwooybvC/m3NuWKbtCt1lU5kzaMYwQI+nP2ferMg8cY88kc7Lr4lJEPK30yivIJEy2PXKSoP0dvML03psPnjEa7BjZVMQ9TUcFpAKMJJ3jxCrAutZuMZLBDt7s5r5G7ElHm6YB+oG8zDyqO1SgWZ+l2BcSjFj96BcW8n2Dh/kcExEYfc8CHlRXZ+rmAL+bsgC04kF828qthNfHRY/MTXDPXqz6IDJFKg7/ie/CoQL91AE65Umk/6l+FnB6rM6sU9MoOU1eDjX4Gt+bQq0mZUqOBi2d+4iIsMT6LGCgdntcz2U8Kl0IQ6fqnkQ5Ag/x/rC08jbEC2qYEIsYbWeIUbK/A1htiR1oSG9sFkKtQx62bUIzKXV9r2Ubvo/gx3qiOAkYac4gqpcaDwjD/BvEmfJwEeepzhQaQlDsXOX8kz+T5Tzg4Vfo3o0URm7INQs1Rn3Ax5uh/tF4Lp4Hy7PmgS3Kmrgdox+TnsOJY6jlPISo8jvAobX8XT6XvQGjus9keHArSf2ns8iAUDDKTrnNQUAIXDQF+83JeSPbRAfQTNxVkVbLDoKWtP72/Sl/vOcbq1BNe5tgtyu59R9UKuFoZi2mc7dGfp6o3a6PmpJceDDebaZ54jrPgOXkuk2htCNjeatLhdCZfysPgkKFWZyo3Xk4G7S2/YaGxptyc7YdG7IoMXFShp0Ieb73mdoJN9gWb+QVbVml/PJ5Z7iUOni29GJxquv/eJfyuaZbslcbqXlWztU8kGhmdJ58af8SZlkvJhVV97QkljAcRU/EtdpHoeXBtSEJVuv7KG6LJKLer16KEJyPE9QCYZMlfA/zyP5PoCT2H044Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e343fcd-6b53-480d-f080-08dbbf62c530
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 14:05:14.1625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8s1l0BPj1GgCgItkk4uzUTelV/PiTMsW2TXlXwfLeVhjltYAPomdsE49zemwc6F8KDQlfZR5JpK+l56Bio8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5216

On Wed, Sep 27, 2023 at 02:06:47PM +0200, Jan Beulich wrote:
> On 27.09.2023 13:08, Roger Pau Monné wrote:
> > On Wed, May 03, 2023 at 05:56:46PM +0200, Jan Beulich wrote:
> >> In preparation of the introduction of new vCPU operations allowing to
> >> register the respective areas (one of the two is x86-specific) by
> >> guest-physical address, add the necessary fork handling (with the
> >> backing function yet to be filled in).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Given the very limited and specific usage of the current Xen forking
> > code, do we really need to bother about copying such areas?
> > 
> > IOW: I doubt that not updating the runstate/time areas will make any
> > difference to the forking code ATM.
> 
> I expect Tamas'es reply has sufficiently addressed this question.

Seeing the TODO in copy_vcpu_settings() makes me wonder how well we
copy information for PV interfaces for forks.  Timers are not
migrated, neither runstate areas for example.

Which is all fine, but I expect VMs this is currently tested against
don't use (a lot of) PV interfaces, or else I don't know how they can
survive.

> >> --- a/xen/arch/x86/mm/mem_sharing.c
> >> +++ b/xen/arch/x86/mm/mem_sharing.c
> >> @@ -1641,6 +1641,68 @@ static void copy_vcpu_nonreg_state(struc
> >>      hvm_set_nonreg_state(cd_vcpu, &nrs);
> >>  }
> >>  
> >> +static int copy_guest_area(struct guest_area *cd_area,
> >> +                           const struct guest_area *d_area,
> >> +                           struct vcpu *cd_vcpu,
> >> +                           const struct domain *d)
> >> +{
> >> +    mfn_t d_mfn, cd_mfn;
> >> +
> >> +    if ( !d_area->pg )
> >> +        return 0;
> >> +
> >> +    d_mfn = page_to_mfn(d_area->pg);
> >> +
> >> +    /* Allocate & map a page for the area if it hasn't been already. */
> >> +    if ( !cd_area->pg )
> >> +    {
> >> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
> >> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
> >> +        p2m_type_t p2mt;
> >> +        p2m_access_t p2ma;
> >> +        unsigned int offset;
> >> +        int ret;
> >> +
> >> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL, NULL);
> >> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
> >> +        {
> >> +            struct page_info *pg = alloc_domheap_page(cd_vcpu->domain, 0);
> >> +
> >> +            if ( !pg )
> >> +                return -ENOMEM;
> >> +
> >> +            cd_mfn = page_to_mfn(pg);
> >> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
> >> +
> >> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K, p2m_ram_rw,
> >> +                                 p2m->default_access, -1);
> >> +            if ( ret )
> >> +                return ret;
> >> +        }
> >> +        else if ( p2mt != p2m_ram_rw )
> >> +            return -EBUSY;
> > 
> > Shouldn't the populate of the underlying gfn in the fork case
> > be done by map_guest_area itself?
> 
> I've used the existing logic for the info area to base my code on. As
> noted in the patch switching the info area logic to use the generalize
> infrastructure, I've taken the liberty to address an issue in the
> original logic. But it was never a goal to re-write things from scratch.
> If, as Tamas appears to agree, there a better way of layering things
> here, then please as a follow-on patch.

Hm, I'm unsure the code that allocates the page and adds it to the p2m
for the vcpu_info area is required?  map_vcpu_info() should already be
able to handle this case and fork the page from the previous VM.

> > What if a forked guest attempts to register a new runstate/time info
> > against an address not yet populated?
> 
> What if the same happened for the info area? Again, I'm not trying to
> invent anything new here. But hopefully Tamas'es reply has helped here
> as well.

Yes, I don't think we should need to allocate and map a page for the
vcpu_info area before calling map_vcpu_info().

> >> --- a/xen/common/domain.c
> >> +++ b/xen/common/domain.c
> >> @@ -1572,6 +1572,13 @@ void unmap_vcpu_info(struct vcpu *v)
> >>      put_page_and_type(mfn_to_page(mfn));
> >>  }
> >>  
> >> +int map_guest_area(struct vcpu *v, paddr_t gaddr, unsigned int size,
> >> +                   struct guest_area *area,
> >> +                   void (*populate)(void *dst, struct vcpu *v))
> > 
> > Oh, the prototype for this is added in patch 1, almost missed it.
> > 
> > Why not also add this dummy implementation in patch 1 then?
> 
> The prototype isn't dead code, but the function would be until it gains
> users here. If anything, I'd move the prototype introduction here; it
> merely seemed desirable to me to touch xen/include/xen/domain.h no
> more frequently than necessary.
> 
> Also, to be quite frank, I find this kind of nitpicking odd after the
> series has been pending for almost a year.

TBH when I saw this I was about to comment that the patch won't build
because the prototypes was missing, but then I remembered about patch
1.  I don't think it's obvious, but anyway.

Thanks, Roger.

