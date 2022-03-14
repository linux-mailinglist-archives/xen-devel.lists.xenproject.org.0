Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD044D8045
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 11:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290137.492049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTiMu-0008Fi-BJ; Mon, 14 Mar 2022 10:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290137.492049; Mon, 14 Mar 2022 10:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTiMu-0008Dt-7L; Mon, 14 Mar 2022 10:56:04 +0000
Received: by outflank-mailman (input) for mailman id 290137;
 Mon, 14 Mar 2022 10:56:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=knG6=TZ=citrix.com=prvs=0654505ba=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nTiMt-0008Dn-6C
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 10:56:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5114be56-a385-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 11:55:54 +0100 (CET)
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
X-Inumbo-ID: 5114be56-a385-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647255361;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=F08nsH28stFZOmUBv3c0cZFqPtgTIGzThzdk56xOyS0=;
  b=N6fhGOqlu5zRpTTKkWd5oMMFEEkUCPSi0oaVzB2w0MI8+BhSMn52qj0E
   lLac8grDhOjglnvtKv7SV2FGkRmdig3kFgvPgpAdoATa9QhI7rNJxW2bl
   VABGq24lW8TB1IlbwMxDhPQXeo+ChZ4H1pEX7n4bUowFy3oMNcVGBWejj
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66086948
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:SwUgR67r5fT/NzQSuq95cQxRtBLHchMFZxGqfqrLsTDasY5as4F+v
 mcYDD2AOv+ON2bzfdkgaNzjpxkCuZHcmIBlTAFv+31mHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0XqPp8Zj2tQy2YPgX1vU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSVRCJuOJ3ett8RDQtqMSFsB6J0xuTYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsFvX5t13fBBOsOSpHfWaTao9Rf2V/cg+gQQ66OO
 ZtFOVKDajzQTzZ+GFQpGqkvkaChrHPGc2FaqV6K8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2m2orv/Cm2X8Qo16PL+l8v9nhnWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWwRFfa8IeGgwi+ZzonD28QXyA2c1AatoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxStbWe0bb1HRcBJG9GRF5mLJ9w43d2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPa8So20CaqMMYUXOvCdkTNrGwk0OSatM53FyhBwwcnTx
 7/GGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvuqWPTlHyaPU6lTCfNE98taQLWBshgtf/siFiFo
 r53aprRoz0CAbKWX8Ui2dNKRbz8BSNgXs6eRg0+XrPrHzeK70l6Uq6Pm+x9I9I590mX/8+Rl
 kyAtoZj4AOXrVXMKBmQa2Alb7XqXJ1lqmk8MzBqNlGts0XPq671ts/zq7NfkWEbydFe
IronPort-HdrOrdr: A9a23:u7bzaan7+rgxvdu4wdzzjsL7GdvpDfPEimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPlICO4qTMqftWjdyRGVxeRZjLcKrAeQYhEWmtQtsJ
 uIEJIOduEYb2IK9foSiTPQe71LrajlgcKVbI/lvghQpGpRGsddBmlCe2Km+hocfng7OXN1Lu
 vU2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJToLHQQu5gWihS6hrOeSKWnS4j4uFxd0hZsy+2
 nMlAL0oo2lrvGA0xfZk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUoZ5Sy+BQO5M2/4lcjl9
 fB5z8mIsRI8nvUOlq4pBP8sjOQpAoG2jvH8xu1kHHjqcv2SHYREMxan79UdRPf9g4JoMx8+L
 gj5RPUi7NnSTf72Ajt7dnBUB9n0mCup2A5rOIVh3tDFaMDdb5qq5AF9k89KuZMIMvD0vFoLA
 BSNrCc2B4PGmnqL0wx/1MfiuBEZ05DUStvGSM5y4+oOzs/pgEN86JX/r1cop46zuNMd3B13Z
 W0Dk1WrsA8ciZvV9MHOA4ge7rBNoWfe2O7DIqtSW6XZp3vfUi97qLK3A==
X-IronPort-AV: E=Sophos;i="5.90,180,1643691600"; 
   d="scan'208";a="66086948"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+AMKrkilGHEoJjacGS5EncYb1y8R5Nqc2BjD6gRoFiOkwBJae2tH8ersShQV8agibMDnRhNI4Fs8vWyI6thgbsJjRP8brEGUtIL+LKdlBx9rGIG1794EImOzcUTYqOCCYSNHIJQC4dP9bjI0KZamOMJxMnru56znlQBbMhx09cp74cUHdg9yQQkIOSz9wn4narCy/7a1bg4maSuy5KwVnnvIDCl/S0s+OCJt9onmXDW0+hDp2PAPsYiXrSSh82kq3A7wC4h94NFmq1YbrRsxlgagcCBgzd5KXte6WFoCpkb/pStLt9B6ZlYcU7L0AljfLHO1szoicBBLX37cqWvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fB61Y6AkgCFoXtQB7EJYvUC5iJfNzDs4sVa702nQGcU=;
 b=eLKcOfYdv8nrGCa4hSXdClTieeMltVORki0Z/upuyrdnkejnQoay3AIgTQk85eGx95sBVdMjBVtK1/idmwLvzWnI2A6PixKbK/YNOMSZUJ/G/7rqv9xmn+z+OId2YxIwfNBrF5rA7mhxwVuOrZBQ7AUOzwGUAxZ4sn9oT1XFaGMk57O5oxtrfBqiP94nwBidg0rN4pblHopA7TGE5MNzu70sOSHT496P/v4LQZN1UaKWyG8Gy23Rgvi4NFAB3ZL6BY1aM2rUvbdNP/pV2N+P3EYg71m3qfL8N2lsVJVqu6yPNk3dtCqlao2U2KmH0aIcX/1Nq1blAwFZmSeFk+bcKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fB61Y6AkgCFoXtQB7EJYvUC5iJfNzDs4sVa702nQGcU=;
 b=UzB68vWhMKf98pG+vCEsuoXE41Oz8nmRz7tE/ulDpyqiOxl0vFjfOdtgCCC/45WISDf5NzNqOvbTkDjH9+PaJ4YDJ9a4ZJtCHlGpRrFEMRjcFFGMqFI5at1MRGt+8KkThVhCDc45blbXTRrH/nYyDbFCnrK7I847MZbjXijt6HM=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] kconfig: detect LD implementation
Date: Mon, 14 Mar 2022 11:55:35 +0100
Message-ID: <20220314105535.13518-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0100.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::16) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c55975ce-dbad-4f10-758f-08da05a92e34
X-MS-TrafficTypeDiagnostic: CY4PR03MB2725:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB272526C813C49FDF2AAC80678F0F9@CY4PR03MB2725.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yVqOL20QnpqxKugPPNzdsFSY90DtJNd0vPd3fLVu1TkDwwYdgU5r84InYvO5RykyeLIFOkdabi7G63y03aDyX6LUaTy7YREHm48Phym91de+UHb8BMoFVXGpxMHtIdHFAOrbLvekbSOU55lgOGZSnKD3Zvw+0DNi9fwD02ibNbdbcPhRMn7IM0ZMFl7fStwueab0yVJqkOpUwyhLKDk1sIdOKJnBOUhtSczKwFkuT4d9eTu8FT9+n9RnwyaXC/zNGQmLT2vUeZd+4ciyQVSh16kQt7urwdPhL9otDLpeCfnoJ72Ab+s27VeBF0VT/ssA5usIi/pYPrbHcmJbp2wQymopK7Fa+d3PeU2VlUoQqtLlnDr0pbbmeiZEp5jkqDc4D1V58k1yEBcHcFOeDOGyx9Z9id7K2pgUFU1baFt/PLFsXMJ9kM6icobPYe3lqxfUL8bCsFOyanZ2IHLPAxVoA+aj0Te5S9PoqVABFYMhpr2Vy+G1BV4DaCx8tED3GPva1sYgkwCN2t3Kbq66QxjAEUwP6NwqSyhJM0ruu3ea0YK7MCqjAAfMsBGQpx1tFeMb8Xlt7QUTV1sGzDnfiA2w5k3umdORxr/KOwCVbkEHsVknaZ33n2uu0luzty+pdqJ2Oa/EmOh0kxaq/8lJjNwSlA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(83380400001)(2906002)(86362001)(4326008)(8676002)(66556008)(38100700002)(66476007)(66946007)(6506007)(508600001)(6666004)(8936002)(2616005)(1076003)(6916009)(6512007)(54906003)(6486002)(36756003)(5660300002)(26005)(186003)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09icURwOFBHUWVqblBvY2dzYUxXemYvSjQ0NDBpVmc5U056U3R0bC84aDMw?=
 =?utf-8?B?TzJHdHNvamgyamVISk1mUVhrWUZrdTl5am1TNDBjRmpTNnA1d1RuUjlMWDBz?=
 =?utf-8?B?dnNpamV1TFluZ0k5V1loWkFNMUljOXhlblZxbm9sQmRYYnRBMGFqZ0hDbS9S?=
 =?utf-8?B?MThaYlFmS0Jvell1aEpTSXJ6ZXIxcmM4Z0xEZjk5aDJoZDhiK096alJTQnB3?=
 =?utf-8?B?Y0pMWG9TVzRqcktKdVcyUWxsZkhmZW8yOEhaVUw3TUpwZVdTUUFEdng3MjZv?=
 =?utf-8?B?MjJFL3JoSnpxNjRpSXNqS3UvaWkvbEhDOVV5NnFyWE1BbG1jajF5TFZtZFhH?=
 =?utf-8?B?L0FuRHYxV3dWMFlENjBWUU4rV3NQelAydWtOV1pGWmFreDZydjR3Q3NUYStP?=
 =?utf-8?B?RmRPN1k2dTJRZHQrall1RmtldXU5OURJWnJZRzhrempuU29jYUlXMjd3V3hi?=
 =?utf-8?B?c1pielBLTFhnbWdFSitEU1MyYnVWbFB0eUVmVi82Z01JTU1wNWcwNnJlcC96?=
 =?utf-8?B?Mi93NmxJY1pmWW5JUjFsdFhOdEloRTYrU0YrM1N4a0tZK3FvYXhKYm5IQ2ZY?=
 =?utf-8?B?Z0tNbzZZY05INngyY0dmbW1uQ2ZvNmU1WnFXMU93VUlsSzI5YkcyYVJZL3o4?=
 =?utf-8?B?aUgweVJ2NjFqVmJKVkI0NUdxc3lQdStqZktXSkNVOXNEbHdyazBIanZMaHFm?=
 =?utf-8?B?OFdJM1pTYllPT3RMZjVoYU9jT2I3VnZKK09vdThaMUNzRWhOREJZTnRzd2Fy?=
 =?utf-8?B?THZhZmxpOTQvcy8yemUrcnMydUJGVTRjSE9iNVFFZFRVSU80dGZySEZvZU1p?=
 =?utf-8?B?SDF5V05FdDZobDAyd0R2dEo1ODZWVjNwQWtWMXdpanF1WmMzNmZNMCtMM0ky?=
 =?utf-8?B?dUl0REtmQkhodTV0QW1pVjRFSk9EVGx0bFFrS0R0Z3l3MG5rMXZWZHpDc0N0?=
 =?utf-8?B?QXdacS8rbXh6VUU5SzBhSGdrZ0sydzkxQVpWdCtUSzlhRzVTUHNkT2xTWTVY?=
 =?utf-8?B?TC9BdlZZTXZRUDhlSThOSFNnWjc1VWxjUUF1K1hGSHVmTnBlWTg3cGVVZDVh?=
 =?utf-8?B?Y0FadVh1U3FUNmt0S2ZkV1BCdmZYUnVqWXRhcmpmc2ZtRWd6d0xFMTdWeGNz?=
 =?utf-8?B?Z0REVklWT1BLaGhpRVFLRlRaM08zU0FBczJZWUIvSFd0eUdSZFlpRTZRbk9P?=
 =?utf-8?B?T0FLeHdKTXRPYU92czRES2Z5bURvZE0xYWJOS05sZHpoTTJQOUdmVGsrdHZM?=
 =?utf-8?B?MEdNR2RRMDVaK0wrQ3BXUjFJWGMvNTJLelR5Ri9UQUMxaFBvZkZGeWRZUTZL?=
 =?utf-8?B?UEc0ZzM4VEN3aHR3VVdzeWdrS2t6Tk1hQ0xWTFNjdC8vTmtGdXAzbVVvT29O?=
 =?utf-8?B?T0Fsb21KTEREbkl5Zis3S0MzWFpIU1N0ZWV1YW9FNkkzcVgrVytxcE9yVEFE?=
 =?utf-8?B?RlR1Nm5SZjdTRHFjdS9tL0x2ZFN4WmhERHJMRDNJLzVSK1V5N3BCemVsNEVn?=
 =?utf-8?B?MU8xaWthV1dyakRQRldXMTU2anU4MXZxaGZsVkhDNDFrZEVBNzJQY0xmSWx0?=
 =?utf-8?B?bE8xaTIwNlU1ai83c3RqRmszTzlnaXNjSmRkSnU2M0hwbFpPMlNJNHplQWpt?=
 =?utf-8?B?NlJLa0hyVVh4aTEyMXBSbVh5VDBJQjZnY2xBa2lWcDVpU0x2QWhFN0pFWHBu?=
 =?utf-8?B?MHVrd1Fsb0hrdWl0V0hmVjlVeVY5bHcvMitZd0pCbncvdVhaMjZSQ0t2eFN1?=
 =?utf-8?B?ZS9UU3lWUTVOeXA2M3pxRG0vUXVNTWlwUXV6V0lnWUNQRjdaZm4xRkdCbGV0?=
 =?utf-8?B?djJWVW9FemhvK1FiMVlIanRLTWVRcGV1bzJSTWRJd1lrRXVUa0VIMXI1ZUFs?=
 =?utf-8?B?Sm13U3MvT3dVRWpFa3U1dnYvemtiWGVpZXZReDUrRHdEM1BqTFlpd0ZJaTZx?=
 =?utf-8?B?dmtnSFFPYlVEMW54MzFPYXZjSFRVMTBFcVl3ZGdLcTd2cHJuSlF4TnpJbnBM?=
 =?utf-8?B?ZE1hMi9BalpnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c55975ce-dbad-4f10-758f-08da05a92e34
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 10:55:41.0866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1WnZJ/rtvBDxwfmrTMcbCJIbutPbE68W3f5rxm2KkiZX/ZeeZk0q5OaVgYLQnw46xbpXKSGFx59Kp2frwFbSnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2725
X-OriginatorOrg: citrix.com

Detect GNU and LLVM ld implementations. This is required for further
patches that will introduce diverging behaviour depending on the
linker implementation in use.

Note that LLVM ld returns "compatible with GNU linkers" as part of the
version string, so be on the safe side and use '^' to only match at
the start of the line in case LLVM ever decides to change the text to
use "compatible with GNU ld" instead.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/Kconfig b/xen/Kconfig
index d134397a0b..e8d5e70d46 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -23,6 +23,12 @@ config CLANG_VERSION
 	int
 	default $(shell,$(BASEDIR)/scripts/clang-version.sh $(CC))
 
+config LD_IS_GNU
+	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^GNU ld")
+
+config LD_IS_LLVM
+	def_bool $(success,$(LD) --version | head -n 1 | grep -q "^LLD")
+
 # -fvisibility=hidden reduces -fpic cost, if it's available
 config CC_HAS_VISIBILITY_ATTRIBUTE
 	def_bool $(cc-option,-fvisibility=hidden)
-- 
2.34.1


