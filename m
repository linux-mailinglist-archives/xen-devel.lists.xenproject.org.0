Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D3C50E377
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 16:41:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313053.530515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niztu-0001Ot-8G; Mon, 25 Apr 2022 14:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313053.530515; Mon, 25 Apr 2022 14:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niztu-0001ME-3u; Mon, 25 Apr 2022 14:41:18 +0000
Received: by outflank-mailman (input) for mailman id 313053;
 Mon, 25 Apr 2022 14:41:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2itc=VD=citrix.com=prvs=107928106=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nizts-0001M8-Ic
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 14:41:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c14ec5c8-c4a5-11ec-8fc2-03012f2f19d4;
 Mon, 25 Apr 2022 16:41:14 +0200 (CEST)
Received: from mail-bn7nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Apr 2022 10:41:11 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM5PR03MB3226.namprd03.prod.outlook.com (2603:10b6:4:3c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 14:41:09 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 14:41:09 +0000
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
X-Inumbo-ID: c14ec5c8-c4a5-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650897674;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=+YpPP5xDDrLsUxyJJhXhRZsb2f68JgBr6jvzZw3v7FQ=;
  b=RlXR+i1YY2h3XietLUCyexuUU6m/dvnksUcw0/6YUykubBn8YNSv7UYh
   10qKDoNoi9h3QnmVa5y6rgg28nFpNuliOehf1NXXSG2AIIZrS0lO1aICM
   nGhDtVdwvwLemqjQCzVuMlD7lvAsitPwxv5SnKaG7cdqBIMguJHzgbW9K
   I=;
X-IronPort-RemoteIP: 104.47.70.102
X-IronPort-MID: 69265422
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KGBiSak2uIFiI991fC3pF2jo5gw/J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaWTuDb6rcNGr8ftB1Ydm3ph4D78fVm4Q1TgFqrno1HyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DlWV7V4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYRh8lPI7Jo8YnURwELnl8EYh81IaaPi3q2SCT5xWun3rE5dxLVRlzF6tHv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOVvZkBhG1YasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUG+QjL+PZtuQA/yiR/36jNM8D1aOaHBsoPjkSpp
 Unk0XT2V0Ry2Nu3jGDtHmiXrvPGmCrgHoYfErKp+/pCgVuPy2hVAxoTPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslgEYc8pdFas98g7l4qjb+QGCHUAfUyVMLtchsaceRzYny
 1uIlNPBHiF0vfueTnf13rWJqTK/PwAFIGlEYjULJSMe+MXqqow3ihPJT/5gHbSzg9mzHiv/q
 xiWpS03nJ0PjsoG0aqq8FSBiDWpzrDATxU85wHedmik8g90aoOja4Gyr1Pc6J5oNJ6YVFKIu
 HEOhuCU7fwCAJ+AkiCAWqMGG7TBz/SYNnvaiF1mHZgk/hys/WKuecZb5zQWDERkLMcCPyPoa
 Un7uAVN6ZsVN3yvBZKbeKq0AsUuiKLmStLsU6mMasIUO8ArMgia4CtpeEicmXj3l1Qhmr0+P
 pHddtuwCXEdCuJsyz/eq/oh7ILHDxsWnQv7La0XBTz+uVZCTBZ5kYs4DWY=
IronPort-HdrOrdr: A9a23:XaH7862OlwPAXUl+58b4nwqjBSFyeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjkfZr5z+8M3WBxB8baYOCCggeVxe5ZjbcKrweQeBEWs9Qtrp
 uIEJIOdOEYb2IK6voSiTPQe7hA/DDEytHPuQ639QYRcegAUdAF0+4WMHf4LqUgLzM2f6bRWa
 Dsr/au4FGbCAQqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPwf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0amSwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7tvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WvAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 VT5fnnlbdrmG6hHjDkVjEF+q3uYp1zJGbKfqE6gL3a79AM90oJjXfxx6Qk7wI9HdwGOtx5Dt
 //Q9pVfYF1P7ArhJ1GdZY8qOuMexvwqEH3QRSvyWqOLtB1B1v977jK3Z4S2MaGPLQ18bpaou
 WybLofjx95R37T
X-IronPort-AV: E=Sophos;i="5.90,288,1643691600"; 
   d="scan'208";a="69265422"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLDnRVbsHOMbZo0AnnYidU59nosDHArmPUzCzecRev6tDckM58gpUAawFuOTZcKN2CRIppYV13PcGpJkHZ8tF7xzaJHtWvm8Qx6zTtpxWv2I4jXOVt0m98wmKeOT/014w2zuHYTTVsxwKNwSbytG8IG19sGRr3Qa0RE5WxYAWQquaGNy8YPicxx6cP5GwGY5QZSFF4tQl4w6mBYJPQsIQ9Dltg0RS2jXbBHSmI6Q/qhQgekdZIeucx4xcc5CDiF1AlihW4d97TKwYfyKVh8K1A4jYLA4XkcXZ8z/LNH38IIB65ahg2jsq2loDJsinBOPXFRQJmP1EduoJCylBsUGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GwjZTDD4ojp0t9nolpKDohc5+E9y4eqAXMQ7TfNhHU=;
 b=eB4wupBJXXxj41ibbgdpADTNc1iYC0iTtrpRssIM6TrhNKF12xGpqLGim1bh98ppHNFQm+CsgIVCNxrxwRct20a8Oim6tFYjqmRRdu3cRYQqm9X8xR1KSS5TW8T6cl925bTAtauvQxLW2Cdvs60r3rdHIjMAvyPas5hTk5YxMATBDzPCwKSQax6gejhJE17uV9Wix+3LoADcZdlbJ9HdAfawB6KkLOtGvQ7qzi0gmOAHgWZSPBuA5sEBbsLXoxd1kLg+9ZcT3QL0TN9G05ZnnOFjDPPA0wb0T2ihNYKFG8wiqQjv+rWYxMhnd3YJboxCnjLMHY7KL0w5iYQr9PFNzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GwjZTDD4ojp0t9nolpKDohc5+E9y4eqAXMQ7TfNhHU=;
 b=kH0QISUV64Hfz2aFsXirtTDRDkcyGPOoziOAaoCm/QWc65tRojpTw53m6EolFR+ENVLk1n21Vc2shvVf4pplCIGhWoz/8aT/0FHsU0Yg36Aer4L7h69O/TxsDvs1cF/ltUuKPESPYVqwxzmUlZ1yFknN+FaS7ZKm5FXVBu+JVKU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Apr 2022 16:41:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v4 2/2] x86/monitor: Add new monitor event to catch all
 vmexits
Message-ID: <YmazAdHL4LWOdDDv@Air-de-Roger>
References: <bc13e07cdb651afc2c8a97dde1be9c2158160307.1649857162.git.tamas.lengyel@intel.com>
 <4b456c15829c11914b698654937c28e313d2d522.1649857162.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4b456c15829c11914b698654937c28e313d2d522.1649857162.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: LO2P265CA0076.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 051fab6e-cac0-480a-b358-08da26c9a2f3
X-MS-TrafficTypeDiagnostic: DM5PR03MB3226:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<DM5PR03MB3226ECA692320731A0E8DF788FF89@DM5PR03MB3226.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DXztcDvnTXKBMC3GGELEExHga1TjfICRSRMSpAlNkQed3WaC5LgbzYZENMXGQeemhZJhwQjxK6BoYPFPub+0zFtrRJ9q3It4qbZqtgz8f6AKcRySJQXTi8yDXwqFAequ9June/8uPeTkkIYntgezL0dqjA0hIw8WGFRmFcUcd97/pHQq5qcN7e7jNBoC5Uxn8b1rGrY8FcaWP/kuMZtDCgB+PdM7zooEIcTXZ2kw6st1LPPYJhheNAnHS1CEu4EjwIs831uU+RbT1DT1v/EbiCvgUH8T/oVPqhCv7ugLIjlhF8Bzvl9/9rSpuT6AOiGcvDjVT4I9nhbWPFb3ylDwJEBIkCCHlP0b1oPlgOwRKfC/tF0mapBnupUdRmCVY+5FyDAUgZMiiED0cv62oKT3G9SkxeLgeU314tn/nBN4uerh9PQtbx3vH0dFgLLSjaLpDEMdfR59VwZhPXsRQGvlyYbrT/bXN+afLvSga8Z+kYifL2URKspRTvkH5uXWOt+NOaYVjSh6fQMgIQU8ObTxwF13lZ99lEay5SIm7mlcENQzXUze8fU6vZ6Hu05UcpMVSsBIG3NteHZ4ieHLlkqzKEoBAtjGVKEt0k/P3Aob1k1pry0zVW0ushCqDIValqRj0b6FM5DF9zyt13+Li0c+VnFQjRnkt2ZTsLj4zq4G8mkKZi6XUDbhXC4sKPoQuixGm6Lbs6N3smVfp8Uh6OEL6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6512007)(86362001)(26005)(6666004)(7416002)(6506007)(38100700002)(82960400001)(54906003)(6916009)(316002)(8676002)(66946007)(66476007)(66556008)(4326008)(508600001)(2906002)(8936002)(9686003)(85182001)(6486002)(5660300002)(186003)(83380400001)(33716001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG9DaGNBOERpdUM0YWNJNVlKaDg0QTJBSzdncndzd3JSNVRZNVFyRlRmblNP?=
 =?utf-8?B?emJTYkRWUHRxMUh1MWlCNTVjL2pva3ZKUTg1T2d5NE1NUy9KMnNwWGYvOHFE?=
 =?utf-8?B?enRoMElDZ0JHVk1aeDNvMXB6UGJCVlowbGE1UFhtZXdOaVJuczhFNnl2c3FN?=
 =?utf-8?B?eTlJUGpkRktkNmVGMDJoM0hSN1ZTYnNtR0xlVnp3TkVROG55MklTem9BTXFP?=
 =?utf-8?B?Zkd4YUZoc0ZZM2dtenNEcmxrWGVGa1FmR3MwRGdnY1hybE84MEltOWkvQi95?=
 =?utf-8?B?UmhROU5RckRnQklMdTNLcnhSdDBVeTZ2Z3JYNjV6YllRQm1Bb3BjR29ScVMv?=
 =?utf-8?B?Rnk3QlBVS05KVnRuWFVGeTNvNzdCR2xOVmMxUUE3YVZIZ09JYlQ4OHA4Rnd0?=
 =?utf-8?B?Z2o1RmFqVlFZcStqWHN5WU5hYVVzNFZUUnhZMGR0MzFxMTNMY1NKZnJVMGV4?=
 =?utf-8?B?YVRBZDhUbVJUTFA0bmtVdE9zRGplU05yTTV3VjBBNjM2Vm5zQkxxeXh5enE3?=
 =?utf-8?B?OGNtaHdJRk9LdDRBVE1TdTFERERoS0c1WFdXZTg5OFRGaEVCOWI3U1BQSzZl?=
 =?utf-8?B?RXp6SEhyQ09SeFE1bkVxV1NUbzBhT3ZXSUtQSzBrbHpyb2t4ZjN3LzBEZUhO?=
 =?utf-8?B?Ris2WmVrazJvOWlXS0JnRlBleGlsOFp2ZDJJZ0ZRc0FUZzZUbVZUL2QrbjVJ?=
 =?utf-8?B?eU9jelJSelBxbC8veHh6c3VSK1pqOUM2cFVSTmVpZURTNzJyVyt3YVMvOU5m?=
 =?utf-8?B?dWtrQlN2QmpyZmtUb3dkTXh3OFJSU1R2MDgwRGdDY0s3eFJZTGhHbUtZSVlk?=
 =?utf-8?B?WW4rK0xrMEkzOGtuM0oyMGdpQWVvN055dVBSWkF2ckFwbHBoc0ZycW81azlQ?=
 =?utf-8?B?djZkSTBYNngvQXR3MWRFSGNzSnNONE1TNXZpaGpBWGorYncvdzYwYVAybzhE?=
 =?utf-8?B?ZFd1ZlR0V1FveU41OExOZXcydjFmaFBvcUU3YUczS0xicm0zb01maUZ5SFJG?=
 =?utf-8?B?d2xMcm1YNnM4ZWErckRkSWlBQVl4YVd5ZGdneVpvTFA0Y1RXN3JjU0VZVTU3?=
 =?utf-8?B?ZHgvbnBySmYzYi9SdEprdWoya3VBVzlZYW1KSFZYY2dBMkhZblVKUlhCeTF5?=
 =?utf-8?B?UnJqaGIyWlJ4U3VRUEdLYzdWenpaM3Z5cVVWVWZRUTd5Um5YNmZZSUhHd3I3?=
 =?utf-8?B?Rnl6dXNWTWRwRkFsNUNwbFZBdGt0Tlg1NHVwNTdjTklMMDZ0ZkVGelhhOEJw?=
 =?utf-8?B?NGFQRTYwM3l5L2E4WGFTejIwZWlFM01YaWsvQ2d5elhjdmZxaUxYaHhxNS9o?=
 =?utf-8?B?VG9obUE4SVFuWVJvc01lSFZ2aTBjRWR5QU1tVEJuU25GdXQxdzhKbUdsbHIz?=
 =?utf-8?B?RXFHc3FlMGZuZnRsczdqUkNGTUM1Z3dUODNFa3pTVUgxTXQvYTYzWUQray9w?=
 =?utf-8?B?RGxEMnV4aGx2aUFEL0VWMU9qWElRYjllTUZXTHNPMTJsckxkcktuUEUzK25z?=
 =?utf-8?B?U0ZGN3NmalhNbjRZSllIVWkrMENxemZVZHR6NUsyelBMa2NueUNmWVRxSjNO?=
 =?utf-8?B?QkdVZXU4aTQwRmppTjR6eXFTWEMyUTJ3emFBN3ZoRU5MeTRzSDlCMWd6Rll1?=
 =?utf-8?B?eHl5clcxTUJtR1dRMlo1Vms1VjVUcUhGd3VyRzMrT3FKdWV0VnZGMkFKRmsx?=
 =?utf-8?B?MjNzZE1wV2tCeDZqZjFRdFpOaXBnelJmc1BXQU5NQTBtQlZ1VlNJdWhGenFJ?=
 =?utf-8?B?QjZJalBRNGdrS1JyRlBvUXJQSDRLUlZrQk1LNlJTZVFlRDMyN0Z2bU5UNVU0?=
 =?utf-8?B?OS92SG1CVXhRSi9oUzhCaHhreWhGZEtTNWhuSWdNd2tlb2RtWG8ySWE4dG4z?=
 =?utf-8?B?MGJMdURYSmpBb2NDMklneE04ME5IaVV2QlFHOVluL0ZrT2hUdzNRbEkwaDZ0?=
 =?utf-8?B?MXBxQmZmWThuR3FPODU4M2hzUENBTklVaU5PeEhOdndONStGRzJtbC9rUlBG?=
 =?utf-8?B?STN1aDdBa040dk1Xem52U2dvUnpDWWtINzhlV2Eyb25Ec3g1bk9uWkpYVk10?=
 =?utf-8?B?L3hzbkVkRlgvOHVYUFhBeTV3ekpjTWd3Rng5MkhBK1pwTkdwMXpVUzlpNTdN?=
 =?utf-8?B?WkRRSHl2QTdUV0xpNmY1VnFNWVBZY0tMcGdpU1FmR2FvVkhaNWJ6b0xtZUpi?=
 =?utf-8?B?UTNOdHR3dVo1MGxqeUVaVkppVlJRZFQ3alNqWEpnc0VzeHp1VU51NTBscklm?=
 =?utf-8?B?TmVpcmlOeHFoOXpsTnE3dWM4VDUxNmhQczFqN1AwQmlCa0hnK3Noa3RxTzFy?=
 =?utf-8?B?elBuZU95Q0ozSkVYbUdNR2dDZDNtQ1U1Q0tJMkk5NGxQL2hUUlByTStHaGYz?=
 =?utf-8?Q?VZa1y71yjhhZaits=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051fab6e-cac0-480a-b358-08da26c9a2f3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 14:41:09.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvNTxFWbVE90FVu2MrWgvSe3B1V+hot928Hd6RfDJWmQj2C5N/tgVbiIjHKlGh6zjEw+FA/vWY2OcFGgIeH5MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3226

On Wed, Apr 13, 2022 at 09:41:52AM -0400, Tamas K Lengyel wrote:
> Add monitor event that hooks the vmexit handler allowing for both sync and
> async monitoring of events. With async monitoring an event is placed on the
> monitor ring for each exit and the rest of the vmexit handler resumes normally.
> If there are additional monitor events configured those will also place their
> respective events on the monitor ring.
> 
> With the sync version an event is placed on the monitor ring but the handler
> does not get resumed, thus the sync version is only useful when the VM is not
> expected to resume normally after the vmexit. Our use-case is primarily with
> the sync version with VM forks where the fork gets reset after sync vmexit
> event, thus the rest of the vmexit handler can be safely skipped. This is
> very useful when we want to avoid Xen crashing the VM under any circumstance,
> for example during fuzzing. Collecting all vmexit information regardless of
> the root cause makes it easier to reason about the state of the VM on the
> monitor side, hence we opt to receive all events, even for external interrupt
> and NMI exits and let the monitor agent decide how to proceed.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
> v4: Minor tweaks and more verbose patch description.
> 
> Note: making the sync version resume-friendly is specifically out-of-scope as
> it would require significant rearrangement of the vmexit handler. As this
> feature is not required for our use-case we opt for the version that minimizes
> impact on the existing code.
> ---
>  tools/include/xenctrl.h                |  2 ++
>  tools/libs/ctrl/xc_monitor.c           | 15 +++++++++++++++
>  xen/arch/x86/hvm/monitor.c             | 18 ++++++++++++++++++
>  xen/arch/x86/hvm/vmx/vmx.c             | 12 ++++++++++++
>  xen/arch/x86/include/asm/domain.h      |  2 ++
>  xen/arch/x86/include/asm/hvm/monitor.h |  2 ++
>  xen/arch/x86/include/asm/monitor.h     |  3 ++-
>  xen/arch/x86/monitor.c                 | 14 ++++++++++++++
>  xen/include/public/domctl.h            |  6 ++++++
>  xen/include/public/vm_event.h          |  8 ++++++++
>  10 files changed, 81 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 1b089a2c02..159eaac050 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2096,6 +2096,8 @@ int xc_monitor_privileged_call(xc_interface *xch, uint32_t domain_id,
>                                 bool enable);
>  int xc_monitor_emul_unimplemented(xc_interface *xch, uint32_t domain_id,
>                                    bool enable);
> +int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,
> +                      bool sync);
>  /**
>   * This function enables / disables emulation for each REP for a
>   * REP-compatible instruction.
> diff --git a/tools/libs/ctrl/xc_monitor.c b/tools/libs/ctrl/xc_monitor.c
> index 4ac823e775..c5fa62ff30 100644
> --- a/tools/libs/ctrl/xc_monitor.c
> +++ b/tools/libs/ctrl/xc_monitor.c
> @@ -246,6 +246,21 @@ int xc_monitor_emul_unimplemented(xc_interface *xch, uint32_t domain_id,
>      return do_domctl(xch, &domctl);
>  }
>  
> +int xc_monitor_vmexit(xc_interface *xch, uint32_t domain_id, bool enable,
> +                      bool sync)
> +{
> +    DECLARE_DOMCTL;
> +
> +    domctl.cmd = XEN_DOMCTL_monitor_op;
> +    domctl.domain = domain_id;
> +    domctl.u.monitor_op.op = enable ? XEN_DOMCTL_MONITOR_OP_ENABLE
> +                                    : XEN_DOMCTL_MONITOR_OP_DISABLE;
> +    domctl.u.monitor_op.event = XEN_DOMCTL_MONITOR_EVENT_VMEXIT;
> +    domctl.u.monitor_op.u.vmexit.sync = sync;
> +
> +    return do_domctl(xch, &domctl);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/hvm/monitor.c b/xen/arch/x86/hvm/monitor.c
> index b44a1e1dfe..64a38e8fa7 100644
> --- a/xen/arch/x86/hvm/monitor.c
> +++ b/xen/arch/x86/hvm/monitor.c
> @@ -328,6 +328,24 @@ bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>      return monitor_traps(curr, true, &req) >= 0;
>  }
>  
> +int hvm_monitor_vmexit(unsigned long exit_reason,
> +                       unsigned long exit_qualification)

Should this maybe live in vmx code or have 'vmx' in the name
somewhere, so that if an svm counterpart is added this doesn't need to
be renamed?

> +{
> +    struct vcpu *curr = current;
> +    struct arch_domain *ad = &curr->domain->arch;
> +    vm_event_request_t req = {};
> +
> +    ASSERT(ad->monitor.vmexit_enabled);
> +
> +    req.reason = VM_EVENT_REASON_VMEXIT;
> +    req.u.vmexit.reason = exit_reason;
> +    req.u.vmexit.qualification = exit_qualification;

You could set those fields at definition.

> +
> +    set_npt_base(curr, &req);
> +
> +    return monitor_traps(curr, ad->monitor.vmexit_sync, &req);
> +}
> +
>  /*
>   * Local variables:
>   * mode: C
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index c075370f64..2794db46f9 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -4008,6 +4008,18 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>          }
>      }
>  
> +    if ( unlikely(currd->arch.monitor.vmexit_enabled) )
> +    {
> +        int rc;
> +
> +        __vmread(EXIT_QUALIFICATION, &exit_qualification);
> +        rc = hvm_monitor_vmexit(exit_reason, exit_qualification);
> +        if ( rc < 0 )
> +            goto exit_and_crash;
> +        if ( rc )
> +            return;
> +    }

Just for my understanding, is there any reason to not do this before
updating the altp2m?  AFAICT the update of the active EPTP won't
affect the call to hvm_monitor_vmexit.

> +
>      /* XXX: This looks ugly, but we need a mechanism to ensure
>       * any pending vmresume has really happened
>       */
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index e62e109598..855db352c0 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -430,6 +430,8 @@ struct arch_domain
>           */
>          unsigned int inguest_pagefault_disabled                            : 1;
>          unsigned int control_register_values                               : 1;
> +        unsigned int vmexit_enabled                                        : 1;
> +        unsigned int vmexit_sync                                           : 1;
>          struct monitor_msr_bitmap *msr_bitmap;
>          uint64_t write_ctrlreg_mask[4];
>      } monitor;
> diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
> index a75cd8545c..639f6dfa37 100644
> --- a/xen/arch/x86/include/asm/hvm/monitor.h
> +++ b/xen/arch/x86/include/asm/hvm/monitor.h
> @@ -51,6 +51,8 @@ bool hvm_monitor_emul_unimplemented(void);
>  
>  bool hvm_monitor_check_p2m(unsigned long gla, gfn_t gfn, uint32_t pfec,
>                             uint16_t kind);
> +int hvm_monitor_vmexit(unsigned long exit_reason,
> +                       unsigned long exit_qualification);
>  
>  #endif /* __ASM_X86_HVM_MONITOR_H__ */
>  
> diff --git a/xen/arch/x86/include/asm/monitor.h b/xen/arch/x86/include/asm/monitor.h
> index 01c6d63bb9..d8d54c5f23 100644
> --- a/xen/arch/x86/include/asm/monitor.h
> +++ b/xen/arch/x86/include/asm/monitor.h
> @@ -89,7 +89,8 @@ static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
>                      (1U << XEN_DOMCTL_MONITOR_EVENT_DEBUG_EXCEPTION) |
>                      (1U << XEN_DOMCTL_MONITOR_EVENT_WRITE_CTRLREG) |
>                      (1U << XEN_DOMCTL_MONITOR_EVENT_EMUL_UNIMPLEMENTED) |
> -                    (1U << XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT));
> +                    (1U << XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT) |
> +                    (1U << XEN_DOMCTL_MONITOR_EVENT_VMEXIT));
>  
>      if ( hvm_is_singlestep_supported() )
>          capabilities |= (1U << XEN_DOMCTL_MONITOR_EVENT_SINGLESTEP);
> diff --git a/xen/arch/x86/monitor.c b/xen/arch/x86/monitor.c
> index 3079726a8b..30ca71432c 100644
> --- a/xen/arch/x86/monitor.c
> +++ b/xen/arch/x86/monitor.c
> @@ -332,6 +332,20 @@ int arch_monitor_domctl_event(struct domain *d,
>          break;
>      }
>  
> +    case XEN_DOMCTL_MONITOR_EVENT_VMEXIT:
> +    {
> +        bool old_status = ad->monitor.vmexit_enabled;
> +
> +        if ( unlikely(old_status == requested_status) )
> +            return -EEXIST;

What about if the requested status is the same as the current one, but
vmexit sync is not?

IOW, I'm not sure this check is helpful, and you could likely avoid
the old_status local variable.

> +
> +        domain_pause(d);
> +        ad->monitor.vmexit_enabled = requested_status;
> +        ad->monitor.vmexit_sync = mop->u.vmexit.sync;
> +        domain_unpause(d);
> +        break;
> +    }
> +
>      default:
>          /*
>           * Should not be reached unless arch_monitor_get_capabilities() is
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index b85e6170b0..4803ed7afc 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1057,6 +1057,7 @@ struct xen_domctl_psr_cmt_op {
>  #define XEN_DOMCTL_MONITOR_EVENT_EMUL_UNIMPLEMENTED    10
>  /* Enabled by default */
>  #define XEN_DOMCTL_MONITOR_EVENT_INGUEST_PAGEFAULT     11
> +#define XEN_DOMCTL_MONITOR_EVENT_VMEXIT                12
>  
>  struct xen_domctl_monitor_op {
>      uint32_t op; /* XEN_DOMCTL_MONITOR_OP_* */
> @@ -1107,6 +1108,11 @@ struct xen_domctl_monitor_op {
>              /* Pause vCPU until response */
>              uint8_t sync;
>          } debug_exception;
> +
> +        struct {
> +            /* Send event and don't process vmexit */
> +            uint8_t sync;
> +        } vmexit;
>      } u;
>  };
>  
> diff --git a/xen/include/public/vm_event.h b/xen/include/public/vm_event.h
> index 81c2ee28cc..07f106f811 100644
> --- a/xen/include/public/vm_event.h
> +++ b/xen/include/public/vm_event.h
> @@ -175,6 +175,8 @@
>  #define VM_EVENT_REASON_DESCRIPTOR_ACCESS       13
>  /* Current instruction is not implemented by the emulator */
>  #define VM_EVENT_REASON_EMUL_UNIMPLEMENTED      14
> +/* VMEXIT */
> +#define VM_EVENT_REASON_VMEXIT                  15
>  
>  /* Supported values for the vm_event_write_ctrlreg index. */
>  #define VM_EVENT_X86_CR0    0
> @@ -394,6 +396,11 @@ struct vm_event_emul_insn_data {
>      uint8_t data[16]; /* Has to be completely filled */
>  };
>  
> +struct vm_event_vmexit {
> +    uint64_t reason;
> +    uint64_t qualification;
> +};

You are exposing an Intel specific interface publicly here.  Might be
worth adding a note, and/or adding 'intel' or 'vmx' in the structure
name: vm_event_vmx_exit, so that a vm_event_svm_exit could also be
added in the future.

Thanks, Roger.

