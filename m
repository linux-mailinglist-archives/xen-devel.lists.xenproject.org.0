Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B14252EE84
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 16:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.334376.558388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3zm-0008OB-ET; Fri, 20 May 2022 14:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 334376.558388; Fri, 20 May 2022 14:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns3zm-0008L5-A8; Fri, 20 May 2022 14:52:50 +0000
Received: by outflank-mailman (input) for mailman id 334376;
 Fri, 20 May 2022 14:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns3zl-0008Kz-91
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 14:52:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a33a82b-d84c-11ec-837e-e5687231ffcc;
 Fri, 20 May 2022 16:52:33 +0200 (CEST)
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 10:52:45 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SN6PR03MB4190.namprd03.prod.outlook.com (2603:10b6:805:ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 14:52:41 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.018; Fri, 20 May 2022
 14:52:41 +0000
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
X-Inumbo-ID: 7a33a82b-d84c-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653058367;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YBvgaiAPmrdYxIe9cqOyiH0RadAqegCUmYQTj1q7hjQ=;
  b=NbB+NIl7l/FRvsA7JMCaMh5qL/0JhhfmKmxwjar4pS98wltMiLUhOPVW
   2nb5M7Pbiz1gZOQNoZwRCYTGe5UpMJB+jGKLZH2aH+IChqPkPQXRCv0Cm
   I7vptQnrRv3ZjkGTD+fUn5IeVIMb5bwOifwabY/1Igl4z9o6+ZEbCFwjr
   8=;
X-IronPort-RemoteIP: 104.47.58.172
X-IronPort-MID: 71169933
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YCTtnK1rGIStnhp6//bD5adwkn2cJEfYwER7XKvMYLTBsI5bp2BRx
 mIbXW3QPPfeMWbyfI9wOo639U4EvsSDm9VmTgRspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EU/NtTo5w7Rj2tMy2YDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0UjZuIFSpqAJTPncA0DD5SCno9IO5/reqvzXiX6aR/zmXgWl61mrBEKhFzOocVvOFqHWtJ6
 PoUbigXaQyOjP63x7T9TfRwgsMkL4/gO4Z3VnNIlGmFS6p5B82TBfyVv7e03x9p7ixKNezZa
 McDLyJmcTzLYgFVO0dRA5U79AutriamKmMJ+QnOzUYxyzjN4zAgjIi0C+H+S9KNVdpIpUq3r
 EuTqgwVBTlfbrRz0wGt4n+qw+PCgy7/cIYTD6GjsO5nhkWJwW4eAwFQUkG0ydG7gEOjX9NUK
 2QP5zEj66M18SSDUd3VTxC+5nmesXYht8F4FuQ77ESHzPrS6gPAX2wcFGceMpohqdM8QiEs2
 hmRhdT1CDdzsbqTD3WA6rOTqjD0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnF76PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:1hrvYKp0W62Lgbfs06yVYY8aV5u5L9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5Wo3SJzUO2VHYVb2KiLGP/9SOIU3DH4JmpM
 Rdmu1FeafN5DtB/LnHCWuDYrEdKbC8mcjH5Ns2jU0dKz2CA5sQkzuRYTzrdnGeKjM2Z6bQQ/
 Gnl7d6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9VVfYF1P7ErhJ1GdZc8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71169933"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uk40whUybuS0XUCT5obGSdjMqT6YPdH8bChhA6jf4iGhATIwmZc52kX1zsfPe74lvalC6b9LfxIk6mRDzfdu1C3LY0vZipQbDmsvXonDUr9zU7XH7VLdi/zQGGr7ql/lRPdP0ycP8LGm17+oHsxWlAUQsaiImm3sq+XMqwcUfA36CquuMajx7p05pF2F7aJ3KDsdAbAEDlXOBqLYs/gi6PwpY9lt/J7se5ezUjeNQi+Qg2Zjf147iRvb/Z0eNJ3hw4FnnlBiZY8XxpyrLKn0X+Wi+vgpfqAkHDty0aaUi8MoqYXsXuy9PlA3ISbqxwFOL4QR1YtegNLiYlR3dpGLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wBQXBL2udM8g4lvwZ7uHFmcEic51g2I0jWoPZL7tB6M=;
 b=T6R1rg9/O7Fq3Yv2VeQY5wbGsK6e2X2MQtrp2ms6Hm/qj+HN5p6oR01GxLeXZg5jgJqZvOpQ6Psd7jjNe5PpaI7RrhIJMLGfJPD4uiwNXsQ2N3AjGbe2aBuC6STgG9iAqSaFyQ07hgbGgZK7hHpvc02YeX959JqRwFbOxN4s7nfvujAlyUbBtBr6rTL84eSuPKfh0tKQBjGIGWrEbads7C2OnTcqoS2xvQSlpko7loS4tpSpV3XtEYnbHZQQ5lXiEBTUzQOPMl7WZAesmJoYaoyVtAsN4ofzYMG129VoA1BbJeDqxDC6efd6NA9skWBSg0kSbGDmNNM1CDVcCeGhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBQXBL2udM8g4lvwZ7uHFmcEic51g2I0jWoPZL7tB6M=;
 b=TiMYGGNR6bSYAZ1yXSJnLuNvi8YI5gaAq3OCIzTRJfU/SEnVUmkuJU4Z7qLery4gMNeX+dxfeJ2v/yNEHlSBXvGSAojbMcce5/xvzbSlVQNV86iKIwaKpbsPtmsn0nmU3DIs+b/pajH6jIpLZKpwYrL2bEa93TUsOL90sWQha44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 16:52:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/5] x86/perf: expose LBR format in PERF_CAPABILITIES
Message-ID: <YoerNXMCoJbw98yE@Air-de-Roger>
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-4-roger.pau@citrix.com>
 <33632dc6-940f-6737-c808-48e6c28fc0bf@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33632dc6-940f-6737-c808-48e6c28fc0bf@citrix.com>
X-ClientProxiedBy: LO4P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 705585f6-6f23-472c-f298-08da3a706401
X-MS-TrafficTypeDiagnostic: SN6PR03MB4190:EE_
X-Microsoft-Antispam-PRVS:
	<SN6PR03MB4190248E40D9905413FF21CE8FD39@SN6PR03MB4190.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QGO5gY10sdpMb09o351dXzn3lmCvE27ouTAh8CVsbe3I7f7fxlwb2amkTRwDZSto0fQ5+7bIhJtu1OFCjwJImMcHtQxI3i38AW+9vIhrhRRcqxKSwStTWn6tRn1YJIZprcDp8DTphxyWxp4T1W4dz+//TCfa/oqc5WyITWjaYrUm7Z9AfqUspT/bb2xRAa+ranM83hCSBMeXQ62Jv7KzaSKVXE9tNtgZiUBM6ltoznF6YelWYD6UYD0I83d+DrpTsfv9ZKPlnrLXYUPxZlP0o/HX3S22ic1PGW2C2lrYoyPdyzoEBwy5foKteBXpGmSc8C3qRWdi5OpTLgSS5oynLA/2P4WitsKfNvIEFDOT2fqowRN4QqkPwWxvgh70MnEZ5icvTH1WqKbGvxzKtLrJ2cgpZxFXiRaFj2IqOZuU9NV0iRqY2WRr2/3xGrhDhBs6blYC1UAmzaRirW03Nif+KoxwgWW22IjkQLV9hICxIoiNqwRv6/px9NuimvYjoFWM2o8B3LKMhXmOwL4NKlFa/Q9M2NXgt++WIr7uHmdfPALqTVObq4qlPztiFyjtbsROjSGygfgG1TZAfucL2eYMXVQqRZC5URI31a6BzQ8u0TUrqNjr2YP+MoM3G4GGwiCk8NAk9Fuw61LzunwfJRPeYw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6506007)(38100700002)(508600001)(6666004)(6862004)(4326008)(8676002)(66946007)(66556008)(83380400001)(66476007)(5660300002)(186003)(8936002)(6486002)(86362001)(9686003)(33716001)(6512007)(316002)(26005)(82960400001)(85182001)(6636002)(53546011)(2906002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEtiNk5wVzQwbC9Zd3VBbzJlQU9OMnN6Z3VQdlpjM0lMME5oNk1wd2M5ZGdq?=
 =?utf-8?B?bnBXaEV1cHRIaURGU3RwVUR1QWxkL2g1cHk5VllCbGp4OUNEWGsyRXFYeDhq?=
 =?utf-8?B?OHFuU2Z6akpXeXU3ZUN5QUl4UnBhb1lEOWJMQWtVU2NFeWJxMzE1MlNJTTRH?=
 =?utf-8?B?QWh2L3ovenRLZnppaitnYnF1UTNwcXl6Z3psWEFOZ1pFVnpDV3FVNHpmcWFl?=
 =?utf-8?B?bm81R00zUGhNVWJUdzdaS2Q0QXFKRjBDanVXek1aV0p2TFJMc2R2MG9tMGxF?=
 =?utf-8?B?cnVqS1Y0cFBkbmIvSnhlbUNhbW5DanVYbG1YeStleHBuOU52Q2F1d2RONXM5?=
 =?utf-8?B?dEZmeGE0bDBqcW5lcE01dFZXR2tjenBuT0NVWHdCQlpETVN0cG02akxGeWRo?=
 =?utf-8?B?ZkQ3UUczL051VE1IYm1RK2RSMXpkbkhSUlFhZDNOZHQwYklEWXlxc2JQSFdw?=
 =?utf-8?B?UDZCN2R5N3V3QlBNQmE5MGtXcHpBamlrSHh5VXo4Z3lzZWY2cUIvcWFWREN6?=
 =?utf-8?B?RUQvS1lNRnIxK3duMHMzTU9MalE5YmtVWk0rOVdOMTRVa2RPRWtSd3ZsYms4?=
 =?utf-8?B?R2VUZzFqVTBtRm4wZFJ0VE80OWxHOGZSdXZBVWFjWGdYMXdhUGRMRHdUc1cy?=
 =?utf-8?B?VGtJNG1VaDRkMkE1VFVuREJOT01idlk1WWxtcEpheGVQYXN5YXRXNndHQmxU?=
 =?utf-8?B?ZlVsKzdieUdTYm9oUDFkQUIxemErQUNRbU52MU5PbDF3UTVnME1YOE5VWVAz?=
 =?utf-8?B?ZHE0TE1COWQrMlRDdldGNFRlU3g1VENaVzVDaHRDcUx1MHJjaFYrZnlZZTEv?=
 =?utf-8?B?VUxqNkgvQ0ZIMk5RTnFLMUZDYldjczI4VURDMjZDSmNUaVU1amFBVWRrd1c5?=
 =?utf-8?B?eiswcnBSYXpNS0UraVVudGg0bFcxQVVsU2NNUEllOTh2YXRtOURHKzdZRjRv?=
 =?utf-8?B?OTdtOTRVL1lWM2xBZ2N4MmsyTmh0WVdrK0hBRVlqM2tGaUF1cUlIY1N2ZnR3?=
 =?utf-8?B?aWNLamJpb3N5Y2x3cU91WjJxNXRkS1F1MXA1K0xMbm1jaEpnb3J2YjVYUm1o?=
 =?utf-8?B?RDhWYlgrL1p3QWZJVzFEZU5CUjFIU2MvM0V6dS96cXhBSEVOYlFCdms3Q0Zq?=
 =?utf-8?B?eE1Cd1RZVmV4YVNFd21TckRnbU5GZmFILzJnM3JmWXBTV1R4N3AybnhhdVM1?=
 =?utf-8?B?MUE5NVBKMUwyVzdEVU42dHI2TTJ2OUZJRHFOeXl3STRVSG91WDQ5dnY1Yld0?=
 =?utf-8?B?M0dvbnA3UlNaTlZ0Y3hpZmlNdTRDbGlpUzE1S0hjTU11dTFhb1lnclAvb2pJ?=
 =?utf-8?B?OG4wdk9ObUFzRWNoc1RqSUhiVUtSbkREQ0ZtVEYxeHFHUFppaXMvZkdCNDZi?=
 =?utf-8?B?UEpSc1FCaUdVcHBkbi9HUmpQemVQS1NTb253cHRITCtyL0FubDNKVElpbTNl?=
 =?utf-8?B?TlJ0WlVCSklCSXFZbENvYkNYb05OTjd0ZTVZanQvUGVaMG0xV2dzOXJ1UW92?=
 =?utf-8?B?M1BhdG82Znd2WjM3ZmVTQ2V6RVFFaVc5ak53dCtBaVRoVU1nbEpoUzIxTzEz?=
 =?utf-8?B?dnlxd3JwYXVPcjZSbTA2b3k3dS96U2dFK1QvUlErc2dHVklicktydjQ1dVBu?=
 =?utf-8?B?aTgvaWtzUHQ2RzNUanpBWEUwVEtldmxCN29zUE5XdWRJaUlzQ2xRMVpueG94?=
 =?utf-8?B?UEhJUGVuc0lwRkhwVkQ5Q3dZV05ZdjIyVTFKMnJ6UHJkd21XQ0IrM0l1VkYx?=
 =?utf-8?B?ano2d2Z5enhDVytDRENpckdxVzhpMVN1alNOQXh4WWVRY3BidE1tWExpV0FJ?=
 =?utf-8?B?RVQ0S2RmTEoxczBHcTRTaXV3R3dTOTBuaTE3dlRPN0NhUnZ0bVdrTThsTkUw?=
 =?utf-8?B?YkFaOHgvcVdyWS9nRkU4di9maXdrVGpnelRwLzVRNUJDTnduRDFEUmMvMjQx?=
 =?utf-8?B?T0JXTlpKcjJnUVc5emxPSHFUSU02bXRqNHJKM05GQkh5aUh3WVZuMjdPLzZw?=
 =?utf-8?B?QzM5eUQ1UWdaWTF3aStmdkFHQ0x5QVg5SjdnTmZTY2FrLzVURHdHK1Zqdytl?=
 =?utf-8?B?NC9zTzZQWDYzSEJiRHFqdHJqMXd5OWZvKzJBei92ZUlOOWVCVTQxdkRhQzBQ?=
 =?utf-8?B?Mm9uQVQrZitYeFIxV25ndUZBQW1YenNmM3FwY2toeHBxQ1VMeXRYTkZwVkZV?=
 =?utf-8?B?YVl3NDlXL2htcmFmRmowNUpoWjZrSmFMSUsybjFTRkg4SE41MkUzOEp1Z0dN?=
 =?utf-8?B?NWJwUTlzaXRqcFY1T2NFTXd2NVBWMjdQTktPMTVsV3Nydlo0MTI3bFNoS056?=
 =?utf-8?B?VFJIVGloVXM5MFlRQThWeG1DNmpTelpWM3I2NGxiUWNBb3VRUWxsSVdDUlln?=
 =?utf-8?Q?7TW+TlhFOld+NfWc=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 705585f6-6f23-472c-f298-08da3a706401
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 14:52:41.7599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XoNfiYRGOMbZKlYPBZ6D1of5xoZa0TD8KjcWJsO/K4BH4zc4EJL+Qh7uQn+P7SmE+uljbipas+uSzPggFxNqZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4190

On Fri, May 20, 2022 at 02:10:31PM +0000, Andrew Cooper wrote:
> On 20/05/2022 14:37, Roger Pau Monne wrote:
> > Allow exposing the PDCM bit in CPUID for HVM guests if present on the
> > platform, which in turn allows exposing PERF_CAPABILITIES.  Limit the
> > information exposed in PERF_CAPABILITIES to the LBR format only.
> >
> > This is helpful as hardware without model-specific LBRs set format to
> > 0x3f in order to notify the feature is not present.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Seeing as we have never exposed PDCM in CPUID I wonder whether there's
> > something that I'm missing that makes exposing PERF_CAPABILITIES LBR
> > format not as trivial as it looks.
> > ---
> >  xen/arch/x86/msr.c                          | 9 +++++++++
> >  xen/include/public/arch-x86/cpufeatureset.h | 2 +-
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> > index 01a15857b7..423a795d1d 100644
> > --- a/xen/arch/x86/msr.c
> > +++ b/xen/arch/x86/msr.c
> > @@ -316,6 +316,15 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >          *val = 0;
> >          break;
> >  
> > +    case MSR_IA32_PERF_CAPABILITIES:
> > +        if ( !cp->basic.pdcm )
> > +            goto gp_fault;
> > +
> > +        /* Only report LBR format. */
> > +        rdmsrl(MSR_IA32_PERF_CAPABILITIES, *val);
> > +        *val &= MSR_IA32_PERF_CAP_LBR_FORMAT;
> 
> Urgh.  We should have this info cached from boot.  Except caching on
> boot is broken on hybrid cpus.  The P and E cores of an AlderLake report
> a different format iirc (they differ between linear, and effective addr).
> 
> Given the other pain points with hybrid cpus, I think we can ignore it
> in the short term.
> 
> > +        break;
> > +
> >      case MSR_X2APIC_FIRST ... MSR_X2APIC_LAST:
> >          if ( !is_hvm_domain(d) || v != curr )
> >              goto gp_fault;
> > diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
> > index cd6409f9f3..5fdaec43c5 100644
> > --- a/xen/include/public/arch-x86/cpufeatureset.h
> > +++ b/xen/include/public/arch-x86/cpufeatureset.h
> > @@ -135,7 +135,7 @@ XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Supplemental Streaming SIMD Extensio
> >  XEN_CPUFEATURE(FMA,           1*32+12) /*A  Fused Multiply Add */
> >  XEN_CPUFEATURE(CX16,          1*32+13) /*A  CMPXCHG16B */
> >  XEN_CPUFEATURE(XTPR,          1*32+14) /*   Send Task Priority Messages */
> > -XEN_CPUFEATURE(PDCM,          1*32+15) /*   Perf/Debug Capability MSR */
> > +XEN_CPUFEATURE(PDCM,          1*32+15) /*S  Perf/Debug Capability MSR */
> 
> This is the bit which requires more toolstack logic to safely enable. 
> Using 's' for off-by-default is fine if we want to get the series in now.
> 
> But before we expose the MSR generally, we need to:
> 
> 1) Put the configuration in msr_policy so the toolstack can reason about it
> 2) Reject migration attempts to destinations where the LBR format changes
> 3) Actually put the lBR registers in the migration stream

So far we have allowed guests to enable LBRs (DEBUGCTLMSR.LBR) freely
without any restrictions, and migration of guests using LBRs certainly
won't work currently, hence I wonder why exposing the LBR format makes
it worse as to require all this extra handling.

I'm not saying it's not worth having, but IMO we should better spend
the time in getting architectural LBRs available to guests and
migration safe, and for architectural LBRs we don't really care about
PERF_CAPABILITIES.LBR_FORMAT other than hardcoding it to 0x3f.

Thanks, Roger.

