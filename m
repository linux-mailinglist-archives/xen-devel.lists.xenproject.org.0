Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2393501C1
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 15:56:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103954.198302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbKo-0007Z0-GR; Wed, 31 Mar 2021 13:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103954.198302; Wed, 31 Mar 2021 13:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRbKo-0007Yb-Cu; Wed, 31 Mar 2021 13:56:38 +0000
Received: by outflank-mailman (input) for mailman id 103954;
 Wed, 31 Mar 2021 13:56:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7d7x=I5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRbKn-0007YU-Bp
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 13:56:37 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcb9a66b-a4d8-4326-911b-2d06714c35be;
 Wed, 31 Mar 2021 13:56:36 +0000 (UTC)
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
X-Inumbo-ID: dcb9a66b-a4d8-4326-911b-2d06714c35be
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617198995;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QsiMGCjk1tUOfxzyy6Ii5flqHKDUhozwglNv6/tNNMA=;
  b=UY4KLntc+Eob65iKnOUQObInsVR5kbQoQ6o4dGxQcMG2vznaUfPOs9vQ
   1bclsd93nfkjCbxlz9iCxTJ3pYX+/awe6doT0Zxlbzio0mUjUD2b8qvel
   U06X2ZStGKIcSaXbfzfpnljR0bpzh+LagP4xjPid2d7AukJEhG6+6HGSj
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: h9pEeLFlNb3mEf+YQ8gWz5jo2vIN9b9Zd1mhpxpf19m6DJ8DG2dHteDHZ1jn1KpExbOKLhzo6q
 PXBQwncgX6pGAB1y1vmwbAwecXNXoQovWIkhF6K1Y651GUcdBNil2NmLrJH6TL15qa5Lb4lIvq
 rkH13SnZ43mtAbfnLGxeDYK0GgVKqweHkRxe9VuWx/6Y9maOspEmdbBsj/PMAL0e2ilMykQ6b2
 f75l4U1zwUnPQerVITvd1KIHgLvQy15JsMRpRdZu4hBrsMYN6tUIUOeGkoUHMX+Rs1BnAjqTrC
 jw4=
X-SBRS: 5.2
X-MesageID: 40564465
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cJ+SzqhhC8xLvQNYl/VEdMqhrHBQX5tx3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2/hzAZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 ddWoBEIpnLAVB+5Pya3CCRGdwt2cTC1aiui/vXwXsFd3AUV4hL6QBlBgGHVmh/QwdbDZQ0fa
 DsmPZvjTymZHgRc4CHFmAINtKz6eHjubDHRVo9BxAh4BSTlj/A0tTHOjWRwxt2aUI1/Z4M6m
 7A+jaJgpmLk/b+8RPE0n+W0pI+oqqc9vJmJOihzvcYMS/tjAHAXvUhZ5SnsCouqO+irHYG+e
 O82SsIBMh453PPcmzdm3KEsGSNv1heiQ6G9XaijXTuusD/Tj4hYvAx+L5xSAfT6EYrobhHoc
 R29l+ZrJZeAFfhmynw9rHzJmlXv3e0unYrnKoviWVeW+IlGcZshLEYlXkld6soLWbRx4AjDe
 V0SOTb4u8+SyLHU1np+k1UhPC8VHU6GRmLBmIYvNaO7jRQlHdli2MF2c02hB47hdEAYqgBw9
 6BHrVjlblIQMNTR7l6Hv09Tcy+DXGIaQ7QMViVPU/sGMg8SjDwgq+yxI9wyPCheZQOwpd3so
 /GSklkuWk7fF+rLsGSwptR8FToTH+mVTrgjuFSjqIJ/4HUdf7OC2muWVoum8yvr7E0GcvAQc
 u+P5pQHrvtNm3rFYFV3xDvWpVbJHUEOfdl/eoTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8CUVHIVYN9x3HufkW9rAnaWnvrdEC614l3CrLm8+8az5VIMoVNtwMSmEmo/83jE0wajoUGOG
 9FZJ/3mKKyome7uUzS6X9yBxZbBkFJpLP6U31LogcOO1jucakKvsiefWw65grCGjZPC+ftVC
 JPrVV+/qy6a7aKwzo5Nt6hOmWGy2cIqGmSVJcakK2b7cLjcpc1Z6xWAJBZJEHuLVhYiAxqoG
 BMZEs4XUfZDCrpkrjgpocTHvvje951hxqLLcZYpWnEj1iVodgiSxIgLmWTeP/SpTxrZjJPwn
 Vt7qcUgdO76EeSAFp6pN59DXphRyC8BqlcAAGMeYNO84qbCD1YfCOtnjyVixY6Z2zw0V4d71
 aRbRG8SLXzGVxatWlf0qH2tGx1bXmGO319cWp7t4oVLxWdyylO+N7OXKCp32eXZlZq+JBBDB
 jMfSYSLgRyx9q+yR6Sn3KYGW87w4g1V9atf4gLYvXd3GigJ5aPkrxDF/hI/Ix9PNSrqeMTV/
 mDEjXlYQ/QGqcs2waPoGwiNzQxoH44kenw0BmN1hny4FcvRf7TKk9hXbcVPpWV6HXlXe+B1N
 F8gcguteW9dmX3Zdju89CcUxdTbhfSq3WxVecmtNRdur8zrqJ6G93DSiTTvUs3qikWPYPxjg
 cTUa576LfONstmeNETYTtQ+h4smM6UJEUmvwTqCoYFDB0Qpm6eO8nM76vDqLIpDEHEvgf2NF
 WF+yBW/vvOXUK4pPYnIrN1JX4TZFk36Xxk8u/HapbZDx+ycfpfuFW9KX2wfdZmOee4MKRVqg
 w/5d6Gn+WaLXWlnA/RuCZ2OaJI/SKsR9ioDAeFBO5P9Ji7ND2389+Xyd/2iC2yTz2xL1kcj8
 lCc0cba8xYkDksjIEtyEGJO+XKi1Ngl0Eb+C1tk17mx5Ov72jaF1xXKAGxuOQiYRBDdnyTyd
 nf+eeW1H7h8CFI1JnKGkBXZMxPEbErP//KBjYrL9MRsr6u97cuhSoGYA5GNR9PtAzA
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40564465"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0w5iSkG0+lY7QmX02UDQ0SR/DlZEbDUkxiclEPrZrGiqXod2uAZ1+bPJRkhEE2Xs3ddpDVebkmc9esUFq0JLdAmshK4lmXDR/ct0L1vdnE5wtI5glxSPfg+VtNLusVR+E+hEkRMo2yPLf9Tsx+r+Vx1vcQMp+75C1pcJElYedhS70otKKuPWeUOqri9DECxrfLu/ElqSx17sfl3k6skzeNGRiGSPc230GsUVkquE44srIg8uNtZb98ZI0e2FE941qvTNU0i2SD6RcsWqVmeZ209Y+FlEUbcASxlq+PgIqjWg6tgydGR/WfXUSIGym48aDoASJkvhBcPsziPZWzPaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HjMmrzvK0BzFoQTQ+HyoK8vV4DZsaL0cdU3Kvbt8xI=;
 b=QVPevwBtlsrvVLOC0GIPBVgyzZn8zyxoCFEGe1dIaeGJ3ady+o8U46n1w+xNu2/fyV1cDu7JbmsOFa41citbPditT/T6tL2ffDy/Hd/AIiByW1S4aT6DF1KBK2aNSYw2NNzehwNRjrcjIE6quemNjpYYOGG70FcJY8/ed/C6nPKn3dW8WM7/EVMeRQ3sQf2uscbzlrguGZEmWODoxf+ww2oBppYDwzknBfJ0s7O2DEe7sg0eB3MBrtzKVnJAy7ZMTpm0XbtGs6neS/w2p+om7BPt8niAYxk3wXORX7/Lw0JcoJ1M9aastvPVbyRcKZfmFnNbFfTaDIwYqCZHS7Cm0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3HjMmrzvK0BzFoQTQ+HyoK8vV4DZsaL0cdU3Kvbt8xI=;
 b=tNCGRdXzosgCnmQzW/pis0x6X+wOl4HgnktUBon+UCGYRNmtm5fZlbA7oBnr0LAaFraaVSjVzs1exgqg2jfr3PshZwMxVu5/sRLkMaSjg/3pNr4xcBXIEvaFNFuIzp/Aoe6yp+Qx1WykzhOt9vkF3HjZ8VbIpf/jwcchO7HLYd8=
Subject: Re: [PATCH] x86/hvm: Fix double free from vlapic_init() early error
 path
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210331133125.7072-1-andrew.cooper3@citrix.com>
 <YGR9+is03vAZgtd0@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bd3541f6-4f5a-95fd-d3d4-56860e7c2736@citrix.com>
Date: Wed, 31 Mar 2021 14:56:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <YGR9+is03vAZgtd0@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0318.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::18) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 669959df-a5f4-4326-b17e-08d8f44cca55
X-MS-TrafficTypeDiagnostic: BN7PR03MB4515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB4515883EF42388322ADEBF35BA7C9@BN7PR03MB4515.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u4xuSFouuei9wamnZ0HeFEvmZY8qeiw4LWPt49mSge9EpfPC85T3X8fLd34uVaLKNcA37XZOURvmBxR4qEakv8cQpbAhfC5MJrkCdf9sDSTmdRPTAbGTn3du5Mk2qXdhhtJAJb0hQ4Em9P/Zakd02Y02g2CZhqmx2YPUpk7Qp9xCJ9BjKEdzt2gemhUP13AWx60AwLNPE7kLyEmSHi1qpOuLNfyNVa+AwT8ibZ7bV6IHtPOt2e4J3kUnNcrguCzHN+ynoCHAsIOKtxUKFVlAgU9o6Ap+PtWJ4Cm0Oq8ePIK1I9s9pET/N+U5vsa0uwDJ1kAsUiTKZnBD/qaFuGdRQ5C5miu41K5tpVHVTRZezYz8ze32He61NmHK8aW+yZT5OrU1GiKq5/VKdiS+BJum+bANfGsKm3jQZlj3L1fabMZj9wGMs4TVpO0QLWMN1pAc5wtE8BSFzoE9VrkyfCgTMxVe3XUH5Tt/FtCLp/SDyaMEPeqZLeSWDKcFTbMY9JRgLHNd219hHPlANK5GN47HTfIiPEiv60gw1Fd83KaaOj9zOZxYN2CjKJ+1OuTr73hgp1sJCv3sCFLbPE6HfmDwMysPZPdsYXfnci0uby+OM5z/5ryKyVzMEKb4Kjg+wE9aP7/4lWLK6np8nIcGehfRCiGoDs07Xh+k751Nync+wtDEsYPS2j83go3LSYxTQfWHAuN8U+0JJP9Lrcfpo7eq3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(6666004)(186003)(66476007)(26005)(2906002)(16526019)(6636002)(66946007)(54906003)(31686004)(316002)(16576012)(66556008)(4326008)(83380400001)(38100700001)(6862004)(2616005)(956004)(6486002)(53546011)(86362001)(8676002)(31696002)(5660300002)(37006003)(478600001)(36756003)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NkZYKytBcUtNNWpmd0pvUExYdmtsb1o4bW5kQlhjcklCVkVIWDUvek8vMmdI?=
 =?utf-8?B?b1BONWEyc21WRzlMVkxnUDFuYUY4dUROOFVnWERWM3pvSENVNEwwRC91dEZ5?=
 =?utf-8?B?QnoybWlTb1QwSTVFVkRlYkpZL01YMGNFd1p5cDR3azJSZmJWQWN2ZFJqVVN1?=
 =?utf-8?B?SXZVOHJNYmdVdi91bWczVDhFTklmOWVQRG5uVVpTRWIzcjhQSURrOXBCU0My?=
 =?utf-8?B?N2Q1SDNsV3Uxa3hWeWpwbXNNZnN0bVJYZ3VBQzZCRFNPTEtpQkVKVFRXMThT?=
 =?utf-8?B?NURtSVREMWhXWUlGQmJrZjgrWC9kUnZhL01QeHI0NVU0Q3RjbkdSSFlwaHpR?=
 =?utf-8?B?L09ZNjJEMWpncjFvamlFcGhFQ0E2R3l0aExpZ2hvSUdtdkdYNXRuTWRDZ21Q?=
 =?utf-8?B?SGYxTGU5VVl6a0oreFh6UktiUllQQ3dXcCswbHJ1NThaQzFwUTMwY3ZhWlAz?=
 =?utf-8?B?V2haMnRoamUxcVFaODFKdDFNbHl1YWtWN0dIYjNkR2gvQ0Z1TkJjUmhCSERC?=
 =?utf-8?B?Sk9ObGJrUWN6azN6QU94bTN3K0VBY2FXVnBPZThHaWVCM0JJSWE5ZEdNOFZF?=
 =?utf-8?B?SXRtSW9PcUY2cGZNc0ZqU1BYUEpwczBFbTRyNENmbHVmSGR5NFg3YUNHcG5P?=
 =?utf-8?B?aktEb3NacGtnWnZtUVVOa2RuSDloeS9OQ2FSMEIxVnFoZ1NIdEJ0L29nQjE2?=
 =?utf-8?B?TmlaUlpnTEpKQTgwRjRvSnRzQUhSWWNjUW0wWlNROEx3M1RWQmdnejlqVVEy?=
 =?utf-8?B?TEY2ZGxEb1kvOEJiOGdYTVBKOUoxTkYvMTlzazVHRmNISkxlMlZ3TWp3Rm1N?=
 =?utf-8?B?RnpzLzJxMFh4UWZ6N2Y4V0x6eFNuc3dEa0tpMkt4N2I5UVFvVUNReHA4Slhl?=
 =?utf-8?B?ejl3emZMWk5hSFh5ancreXNKQ0w1Q1ZaTDh6SVhOWUsvNTFHZFAzSFNDRGJ5?=
 =?utf-8?B?am4wN2NOU3dLR0J0T25hRTJvTWoraHRMdm0wT2hYTU9yL2dXd0FuRG01OENu?=
 =?utf-8?B?NFh2OGhCNTYvWmVUdURjUDRsV1FaK3hleFNuRVd3bk1nbTEvOEg1Qjk3TlJT?=
 =?utf-8?B?akE3U1ZyWllQN3laNnhYWEo1SUs2QlNqQjI1ajdJNVZzK1k0SWxzU0xTeFdp?=
 =?utf-8?B?MGMvRnM4WEk5QWdWYWZCRUV6V3FsaWZLSVJ2Q0hnRUo4VEhmbkxGb3ZjYWRK?=
 =?utf-8?B?N0MrOUFaYjAwUmJidmtRTmFDMndydGU5VG91cHE3N3d4b0NaZy9pMTJmWmx3?=
 =?utf-8?B?YjdOQ2E2UFYvK1haSlpDblpqbDdyTFd1MVFxRHVFZ3lvUW5jOHBHREI0bDRq?=
 =?utf-8?B?cFdHKzRYK292NG5kSXJkTWVHTkdpeUNDdVJPaGZXSWhEVW9ZY2g4dUFteXJy?=
 =?utf-8?B?YU8zeVMvd01NTEhHOHZqdk1KR2NPWUlES3ZDWFd3MitPaXRBa3NHLzFhd0RM?=
 =?utf-8?B?TTJtNHp0dUc3WnBKbzFqVldFRnBpTDJxREJJaXAzVGdrUnh2bGJQcGN6Tk41?=
 =?utf-8?B?K2Y1Q1RmeHVEMXdUaWJpOXh1bytId1YvMVNGbFEwc0NONmgrbkJqUktsczZY?=
 =?utf-8?B?WmhEUEk5citvbnZhSGgwUjNUTWRiWHZ4Y0d1NmlLNFA4RG50c3BBekViRG45?=
 =?utf-8?B?QnZRR3FVMHBLeFBML2REL1BzUWUyVEZxTmh2c3Nhcm40NEQyNCtydGZkS203?=
 =?utf-8?B?ZnVJbW81U054ZXlNNWQ2V2RjUWtoYjloelI4aFQ1SXZ6MnNndWZHc2kvQlFQ?=
 =?utf-8?Q?83Z9MbEMOkQ0CXY+GOXbLUUoBmrVg99VZJw0asI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 669959df-a5f4-4326-b17e-08d8f44cca55
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 13:56:32.3799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBM2ipyKXlWEm1yXips7tAXw0GeHUWqFFTQT2+NXK5wwa5Ct/+11clpC05vqoV/u0VieFQ0efAFgz15KvLe8qwW6j4OcAAUFDW+oS6+x0Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4515
X-OriginatorOrg: citrix.com

On 31/03/2021 14:49, Roger Pau Monné wrote:
> On Wed, Mar 31, 2021 at 02:31:25PM +0100, Andrew Cooper wrote:
>> vlapic_init()'s caller calls vlapic_destroy() on error.  Therefore, the error
>> path from __map_domain_page_global() failing would doubly free
>> vlapic->regs_page.
>>
>> Rework vlapic_destroy() to be properly idempotent, introducing the necessary
>> UNMAP_DOMAIN_PAGE_GLOBAL() and FREE_DOMHEAP_PAGE() wrappers.
>>
>> Rearrange vlapic_init() to group all trivial initialisation, and leave all
>> cleanup to the caller, in line with our longer term plans.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> ---
>>  xen/arch/x86/hvm/vlapic.c     | 11 ++++-------
>>  xen/include/xen/domain_page.h |  5 +++++
>>  xen/include/xen/mm.h          |  6 ++++++
>>  3 files changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>> index 5e21fb4937..da030f41b5 100644
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -1608,7 +1608,9 @@ int vlapic_init(struct vcpu *v)
>>          return 0;
>>      }
>>  
>> +    /* Trivial init. */
>>      vlapic->pt.source = PTSRC_lapic;
>> +    spin_lock_init(&vlapic->esr_lock);
>>  
>>      vlapic->regs_page = alloc_domheap_page(v->domain, MEMF_no_owner);
>>      if ( !vlapic->regs_page )
>> @@ -1616,17 +1618,12 @@ int vlapic_init(struct vcpu *v)
>>  
>>      vlapic->regs = __map_domain_page_global(vlapic->regs_page);
>>      if ( vlapic->regs == NULL )
>> -    {
>> -        free_domheap_page(vlapic->regs_page);
>>          return -ENOMEM;
>> -    }
>>  
>>      clear_page(vlapic->regs);
>>  
>>      vlapic_reset(vlapic);
>>  
>> -    spin_lock_init(&vlapic->esr_lock);
>> -
>>      tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
>>  
>>      if ( v->vcpu_id == 0 )
>> @@ -1645,8 +1642,8 @@ void vlapic_destroy(struct vcpu *v)
>>      tasklet_kill(&vlapic->init_sipi.tasklet);
>>      TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
>>      destroy_periodic_time(&vlapic->pt);
>> -    unmap_domain_page_global(vlapic->regs);
>> -    free_domheap_page(vlapic->regs_page);
>> +    UNMAP_DOMAIN_PAGE_GLOBAL(vlapic->regs);
> I think you need to check whether vlapic->regs_page is NULL here...
>
>> +    FREE_DOMHEAP_PAGE(vlapic->regs_page);
>>  }
>>  
>>  /*
>> diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
>> index a182d33b67..0cb7f2aad3 100644
>> --- a/xen/include/xen/domain_page.h
>> +++ b/xen/include/xen/domain_page.h
>> @@ -77,4 +77,9 @@ static inline void unmap_domain_page_global(const void *va) {};
>>      (p) = NULL;                     \
>>  } while ( false )
>>  
>> +#define UNMAP_DOMAIN_PAGE_GLOBAL(p) do {   \
>> +    unmap_domain_page_global(p);           \
>> +    (p) = NULL;                            \
>> +} while ( false )
>> +
>>  #endif /* __XEN_DOMAIN_PAGE_H__ */
>> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
>> index 667f9dac83..c274e2eac4 100644
>> --- a/xen/include/xen/mm.h
>> +++ b/xen/include/xen/mm.h
>> @@ -85,6 +85,12 @@ bool scrub_free_pages(void);
>>  } while ( false )
>>  #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
>>  
>> +#define FREE_DOMHEAP_PAGES(p, o) do { \
>> +    free_domheap_pages(p, o);         \
> ...as both unmap_domain_page_global and free_domheap_pages don't
> support being passed a NULL pointer.
>
> Passing such NULL pointer will result in unmap_domain_page_global
> hitting an assert AFAICT, and free_domheap_pages will try to use
> page_get_owner(NULL).

Urgh - very good points.

Do we perhaps want to take the opportunity to make these functions
tolerate NULL, to simplify all cleanup code across the hypervisor?

~Andrew

