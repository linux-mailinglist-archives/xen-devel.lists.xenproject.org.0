Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ABB36FE14
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120596.228073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSV-0000Vn-SM; Fri, 30 Apr 2021 15:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120596.228073; Fri, 30 Apr 2021 15:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcVSV-0000VO-O9; Fri, 30 Apr 2021 15:53:39 +0000
Received: by outflank-mailman (input) for mailman id 120596;
 Fri, 30 Apr 2021 15:53:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jCGG=J3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lcVST-0000Uy-FP
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:53:37 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3d89862-0dae-4dfc-b2c7-b3bc4ff36182;
 Fri, 30 Apr 2021 15:53:35 +0000 (UTC)
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
X-Inumbo-ID: d3d89862-0dae-4dfc-b2c7-b3bc4ff36182
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619798015;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=wjV7ebxtK0uP+q4vxYvlR5zF4mPzAmFR4kAEUmMMWTA=;
  b=dX+fPy5g2j0KsYgrhwmJD2UKCbQKBXJ0PrV0XuSy7Q3QvvVN4lXslS00
   lDM/23/f55ltqaYbWVjDa4ppIcO+8i3Y6/liMw+05KeaLDjLPjWdpZAfr
   cpMjYDKd4p1nrAKgst66iHlDzq5u4GHZw6yNUKUzxRSMA8ruVH1e4oD7s
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VpQ7Su9F3sZBWN8ydXp0kJutSVCOs5pFf7hWUSsSHULjWRqS1yzWqNuf04QYb/id9uqoNXOtBU
 ty+2iuJ7f0+68I4v1Vfi24oSJxpjU4tZEjZZVNvZNvoTlCGu1BTeLdrsSNnJ8MKWn8JqQW0gjO
 p8Uq5LXQGPQn0WrPmIlI9Wwy/SOa32eIZhBRZ5X6WjA3A1wpnfjaS6rRs8wtwFZ072EucOq80P
 yg/6rhgRwv5PTwedHbHheHebU0Vp28OqGhWxBCk7rKaEwWTuSw6c91sthZ0cVEXJFx+XR0CQc6
 xVQ=
X-SBRS: 5.1
X-MesageID: 42829620
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8P77LahSVFrcUOYBrPgZDcSER3BQXk8ji2hD6mlwRA09T+Wzkc
 eykPMHkSLugDEKV3063fyGMq+MQXTTnKQFhLU5F7GkQQXgpS+UPJhvhLGSoQHINg/f0qpz1a
 J8f7MWMrfNJHVZreK/2gm3FN483MKKmZrEuc7yx2pgJDsaD51IwBx+Dm+gfnFeYCljKd4HGI
 GH5sxBzgDQGkg/SsigHHEKU6ziirTw9a7OWhINCx455ATmt1rB1JfAHwGczlMiVVp0rosKy3
 TPkADy+8yY082T9xm07QHuxqUTvOHBo+EpOPCx
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="42829620"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KE/O9yJgxjPbnTGY+viRy7X+iFw1HLrjUHLuevCOZMvOtycfVwWZxCMPPqJH/qjquIzTvDkWP75i6sKm08dyU1lo0VMtnHd0omRAxfyvWQW2z+ZZYHJmTEs22gBrkqUZY9WgBjyprsuFEHNz4wBWO3cgjAPNGPUx39NrT0smamt2Yv+0ECv5bG085TDgTkhEPGwkhERrCqedAR24I9tr5T9C0qJOnHfq6lDFiIe52ZlpN4EDcAApTqSfyfY2oc1Lt2xiMjEqEdkHI6SqMpFLV8UXVWzMC1weU0wz4pakppwXoNi+9R047NftOLY5ineBfte8H/GrgwFRz8ZhqbDn6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY6MmV3Lly/+H2Zssd+ZQFW2+lQksSIYRPGLPmNTCOw=;
 b=NB5cZBCdeTR4wIjPtbHvycjugIYyMDGRhwENXeCADQpWe5UzSXkAGQkGH0Q7S5LUwJfWVHP+f+zKBEDvjkNYCSlJLJYoJOtUU3BSl0SVI3pbtyek+7KNZ+HJejY8H5X2j/XgftaPP724tCVBqun5xAN3OI3A7N4Lgm0k7VU6u4gtCTCXcGUVRkeBtA1GofLxGsYIlrVknWLSIjntCr5clPWthMCzWgXtAdw+RbiJeLLd1yXww6746rzTvN1t+rk+Xgiw8wzrCgjJQT5G6DUTFENr/gL6UToig7hZWYu2KC2XxjV5hdJqF55l8i/QB7BAY7vtKVhucEVGw+gQILiCvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY6MmV3Lly/+H2Zssd+ZQFW2+lQksSIYRPGLPmNTCOw=;
 b=MitmPq+a/XiR2M3gT7gDA7Vny/KJtGFG2mm4C33/3w/eMwChuR0FYTRi5uH4CRY+WntnExjmSIjtdUpiuLW6j+9W/lpGQVosngAAt1mMkRnw2PcTITzrXMAqFyHn8znNgtn/NbMkjpw88XuQW3ZnA2FA2zm9ildK17VOn+U/hdc=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 00/13] libs/guest: new CPUID/MSR interface
Date: Fri, 30 Apr 2021 17:51:58 +0200
Message-ID: <20210430155211.3709-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0062.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3717d5ca-dafa-4080-43ee-08d90bf019e3
X-MS-TrafficTypeDiagnostic: DM5PR03MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2923C4583CDD7564F3DAC0A08F5E9@DM5PR03MB2923.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V9ogXIjLseEfOkq/TnzxM8xFIE5DY/FLVHbjvNOns3uEg2yWJwpBfxYuvMTplo2Wdnmf71NWchRaVHZ3JrPephAY3jADLpBELHWDd43U5aaeXVmvu6r0vJr1LIjznSytl+lILW5sf67o8LtHyhfX5JXLul8TokI+xXjXI74nN/Zrc7iLEBAjt+Ulag8M9Pi+LrInM8/VMBqJAWnsQZz2wnYlg3D7DeAhU54pt7ZYCbKAscS5sXP2U+dda/SHQNrqLesYbsFkPB00CtITkAS+rLOg7bXSIf+dH/iztymo17NBzY5cypLmU2YWhWoFpuy8pD44GVyqpno68Kp9s5nXpwUZcse+KRxXDy3J7XzxO6RPYAbeMwMXFCzALxwkfa/mMp/L+Q5b/W8BSbb2FRmu+hAAKjyDS5drEsQ5vhQG65GUXYKGHGN/SBzrQi3xzuFlqoUREvucyWXGulHTbhLzUu958zjM4KOqQ34BAx3dZ/ACvSNgTzd6CQ0ILVoybWm82oI6ibA66i1x7Ue+L9tdMVL6jKkOkbyQuEWyhcl2Zjb96rGwffGIjYtXaPKtcxbYJ/iWlAqePMoMY1m40IWfAirJ13zMYZqzgQUf334dO/8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(956004)(186003)(16526019)(86362001)(4326008)(8936002)(1076003)(6486002)(2906002)(5660300002)(26005)(66946007)(316002)(2616005)(38100700002)(66476007)(478600001)(83380400001)(107886003)(6496006)(66556008)(6916009)(36756003)(6666004)(54906003)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MXVkNGk4Lzkxd1RyeVdUbnJYQmw2d0NrUnRZenNPSllxZEhTQmh2SWhpYzFD?=
 =?utf-8?B?TnJadStzUjhvUXRHb1ZKTlB3cE5xbjlJNXQyaGo4WGJKaHl2aU96VXpRY2tv?=
 =?utf-8?B?Q1NpVGF6bDJBUm5HeUZSMzgxN2FYNGd5a0QyNkthWnB4Mkp0bmp5THYxdFBt?=
 =?utf-8?B?bHF0RjlqcUtmWUI4NC90dDJESXVRcnQ3U1pINjhCdTljQ2JDamcxSmNIWkFh?=
 =?utf-8?B?RDdEUlhKTlVDOTVya0ZPMFllczJ3Vkg1Vk5lU0ttY3N4aG94ZFpnQ2o1amwz?=
 =?utf-8?B?NStnVkoxZmp6dkN3Ty8vOTMxVFI5MW9ZVkgrVFdRbm9RTVVpVURFKzlTSm44?=
 =?utf-8?B?SjRJaVRmenhHUnN5ZExnbFZSSkxkRWcyUFJ1Z013MmFUa2M3cDdXck9xajB6?=
 =?utf-8?B?OWxqcWg4bjBxZXRNM2FUVmpBYWs5bjA0QzJhOWhxKzdDbFM5YVgyMyszNmpE?=
 =?utf-8?B?NERteC83MnJPSGdvMzB6YzZvekRyQnRaUWhIVngxZmNPK1lZUFdtdDBGQ2xS?=
 =?utf-8?B?Q04raW1pa3VPT1VCa1R1Y0kvWERRbzhRREZtaERySThxZGVZWU9CWFc3TnNo?=
 =?utf-8?B?VHh6WjZGazdwNlNZK0hFSjN4eUxoTERqcTF2cThxTXlRa1U5VnVqTTZmN2Nv?=
 =?utf-8?B?WFpMRjdtNmdDR2NNWDErdC9oeHhvRFhzeXk2VjdFZGR0UEZhd2drbUhvN25Y?=
 =?utf-8?B?YVRkUXhmRERZTE1hODFoZ0IrVk91cnhzZkpndXkzOXBFSkdUVDdUaXZGU0NK?=
 =?utf-8?B?ZitFQjNud1FBd25iWWZHdG5sOEJad25xVWRGY3E1VGg5d2EwV1Jtb1dYaDY0?=
 =?utf-8?B?SHh1T3dFNk5yN2t0R01IdDg5RnRURE82Y2tGMmFqR1ZUbk41VGhadFpjbXZ2?=
 =?utf-8?B?Zkorb3UrRUUxNE1GY0h2YS93Mlc2RVRtTVVEeUNBSlU0ZXJUd3hTdFRFVTB1?=
 =?utf-8?B?aGJrTFlRZFcvd0VRRXJWelcyOTU3ZEtUWWRmbnpJb0JrQWtTQkhJYTlLZDRU?=
 =?utf-8?B?U0tleGRpditkRE8rZWY2UG9QaGR3c2ZnTkY1ZUJwcmE0cjRaNktwWmo3clNH?=
 =?utf-8?B?Y0VjTmRTYmRLSmRvY25vcU80U2pEUUZLOHBWNjhsV00zM0lJbXE4VHdRZXFk?=
 =?utf-8?B?NCtubjNDUnpDMnAxMGFIQzV1VUxuMGljbisvZzJqN1FqS0UvYnh4RDZHQVNi?=
 =?utf-8?B?bUtRazZDOEk0OGV6MHlodkg0c05CTFp6Qi9NMmFWSWpLMVg4a0JqYlVmeHJN?=
 =?utf-8?B?SXVYUUpDVTRxeVYxZjIraldIQ0JsRWNrZEZkcVVMaVdqelE5Qm80VXo4UXZR?=
 =?utf-8?B?YzZmVXhOR0RYekxzS25jSFZMQ0l3RVd2TjVoVGVCR01YT3NmdjBFNHhDdlVz?=
 =?utf-8?B?Vkk1L3I5VkhCRkhaUDZuc25pMFZvSVp3WW1XV3d6RjVadlk0MkwwTnlhZk9Z?=
 =?utf-8?B?UWVHdnJ5alE4QzhSVWNBNXF6eS9Nd1lJSHhWa2lFZk1RWnRyaWxqd3crS0lh?=
 =?utf-8?B?czNnK1FQUWN2Z2NFa3ZRZ0VxQW1mMGZUL01IS0lqNzF2Z1ZIRTVPNnpVSjh0?=
 =?utf-8?B?UVo1dGtNRDM3V0k0NFZhNWo4Y0ZBdHM4SjNTbzlJaG1FV2dybGVabGM4N0w3?=
 =?utf-8?B?RGd6WUkyVGhhMVRrVGxPWndZWFdnMUZ5WHEyVzZVQW1mM1FINDdoMnpnYnhN?=
 =?utf-8?B?QnZJRU90a3J0THRNb210ejBRak45VC9VbFR4ckFFN1hFVE9IejdnZ2R1aWNE?=
 =?utf-8?Q?S0VOXZ+X1cxkscXldqZK0qzZN1lkU6uYuz/qDdU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3717d5ca-dafa-4080-43ee-08d90bf019e3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:53:30.5948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+gqBqXdsxF5wNW+bIlkCijGKo3Cy1r6Bmg0X+aEbfyL5MFxJ0b0WsGAdn6UrfS0/eVAOjqJXWJ4K6YCAcfsiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2923
X-OriginatorOrg: citrix.com

Hello,

The following series introduces a new CPUID/MSR interface for the
xenguest library. Such interface handles both CPUID and MSRs using the
same opaque object, and provides some helpers for the user to peek or
modify such data without exposing the backing type. This is useful for
future development as CPUID and MSRs are closely related, so it makes
handling those much easier if they are inside the same object (ie: a
change to a CPUID bit might expose or hide an MSR).

In this patch series libxl and other in tree users have been switched to
use the new interface, so it shouldn't result in any functional change
from a user point of view.

Note there are still some missing pieces likely. The way to modify CPUID
data is not ideal, as it requires fetching a leaf and modifying it
directly. We might want some kind of interface in order to set specific
CPUID features more easily, but that's to be discussed, and would be
done as a follow up series.

Thanks, Roger.

Roger Pau Monne (13):
  libxl: don't ignore the return value from xc_cpuid_apply_policy
  libs/guest: allow fetching a specific CPUID leaf from a cpu policy
  libs/guest: allow fetching a specific MSR entry from a cpu policy
  libs/guest: allow updating a cpu policy CPUID data
  libs/guest: allow updating a cpu policy MSR data
  libs/guest: introduce helper to check cpu policy compatibility
  libs/guest: obtain a compatible cpu policy from two input ones
  libs/guest: make a cpu policy compatible with older Xen versions
  libs/guest: introduce helper set cpu topology in cpu policy
  libs/guest: rework xc_cpuid_xend_policy
  libs/guest: apply a featureset into a cpu policy
  libs/{light,guest}: implement xc_cpuid_apply_policy in libxl
  libs/guest: (re)move xc_cpu_policy_apply_cpuid

 tools/include/libxl.h             |   6 +-
 tools/include/xen-tools/libs.h    |   5 +
 tools/include/xenctrl.h           |  75 ++-
 tools/libs/guest/Makefile         |   2 +-
 tools/libs/guest/xg_cpuid_x86.c   | 832 ++++++++++++++++--------------
 tools/libs/light/libxl_cpuid.c    | 231 ++++++++-
 tools/libs/light/libxl_create.c   |   5 +-
 tools/libs/light/libxl_dom.c      |   2 +-
 tools/libs/light/libxl_internal.h |  32 +-
 tools/libs/light/libxl_nocpuid.c  |   5 +-
 10 files changed, 744 insertions(+), 451 deletions(-)

-- 
2.31.1


