Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BBA781445
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 22:23:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586586.917842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX5zE-0004kb-TO; Fri, 18 Aug 2023 20:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586586.917842; Fri, 18 Aug 2023 20:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX5zE-0004hX-QL; Fri, 18 Aug 2023 20:22:24 +0000
Received: by outflank-mailman (input) for mailman id 586586;
 Fri, 18 Aug 2023 20:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qX5zC-0004hR-Vr
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 20:22:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edc20cc8-3e04-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 22:22:19 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Aug 2023 16:22:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5281.namprd03.prod.outlook.com (2603:10b6:a03:226::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 20:22:10 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 20:22:10 +0000
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
X-Inumbo-ID: edc20cc8-3e04-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692390140;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qi4bK1mzMXI9n0x0Ain8VmBz09gGRrw9CeApVtaxyk8=;
  b=YKGzcEn5eq2zTK9tskxqdazPryc37P+qwFjak6lv32MebUwp7M4mfTqz
   A/cNnNjh0UpJe4R7IVYpPPhduWsKBuqLWdPBf2cxZj6qqXekN0GZXlKZH
   Lo8FUKlUC0O/NAKQQpYIKSsP54gkEXGz0LK/q0zy84Rddh+h7vft8Lb/Q
   U=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 119814130
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JuRnTqlzbhEQKxLl44LVEMzo5gwaJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeXmDQafmJYzD9ctkkaYu1804F7MLQmINiGwFkrytjECMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgb5Q+GyxH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eQRC2gsNRunvPPo7LeXWuVdlOoMffC+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTezor6Iz2wX7Kmo7LzYRRVKmkaKAuhCQdslFJ
 RQL+gpxsv1nnKCsZpynN/Gim1aGvxgbW5xTGus1rgKX4qXR6gedQGMDS1ZpatYrqcs3TjwCz
 UKSkpXiAjkHmKKRYWKQ8PGTtzzaETAcMGsqdSICCwwf7LHLopw1yBTGTd9hEau8ptzzBTz0h
 TuNqUAWhLgNjMhNy6Sy+3jGhS6hot7CSQtdzhnWW0q14wU/Y5SqD6S45F6e4fteIYKxSliao
 GNCi8WY9PoJD5yGiGqKWuplNJGk4eyUdgLVh1FHFoMksT+q/haekZt45Th/IAJjNJYCcDqwO
 UvL41oPtNlUIWegarJxb8SpEcM2wKP8FNPjEPfJct5JZZs3fwiClM1zWXOtM6nWuBBEuckC1
 V2zK65A0V5y5Xxb8QeL
IronPort-HdrOrdr: A9a23:cbQYr6GTvyUaviTYpLqFiJLXdLJyesId70hD6qkvc3Nom52j+/
 xGws536fatskdoZJhSo6H6BEDgewKUyXcR2+J+AV7MZniBhILFFvAA0WKA+UypJ8SdzJ8l6U
 4IScEXYryRMbEQt7ee3ODMKadG/DDxytHNuQ6x9QYOcShaL4VbqytpAAeSFUN7ACFAGJoCDZ
 KZouZXuja6fnwTT8KjQl0IRfLKqdHnnI/vJUduPW9s1CC+yReTrJLqGRmR2RkTFxtJ3LcZ6G
 DA1yDp+6m5tPm/6xnEk0ve9Y5fltfNwsZKQOaMls8WADPxjRvAXvUrZ5Sy+BQO5M2/4lcjl9
 fB5z06Od5o1n/Xdmap5TPwxgjJyl8VmjPf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3lieq4FcAXr77WvADpnzJl9Xf3iP0DofeN0o/j9iuEwlGf1sRLkkjQJo+VE7bWfHAc4cYa
 1T5YrnlYxrmBuhHg3kVy9UsZGRtz0Ib2u7a1lHtcqP3zdMmndli0Me2cwEh38FsIkwUp9e+o
 3/Q9BVfZx1P70rhJhGdZI8aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy5Lku/umldJEB0ZN3wf
 36ISVlnH93f1irBdyF3ZVN/ByISGKhXS71wsUb45RioLXzSLfiLCXGQlEzlMmrpekZH6TgKo
 GOEYMTB+WmIXrlGI5P0QG7U55OKWMGWMlQodo/U0LmmLO5FmQrjJ2qTB/+HsudLd9/YBKBPp
 IqZkmMGPl9
X-Talos-CUID: 9a23:CTZJK2HlX41xLoOgqmJ//W1MO5suVkbMklvVD1+0OHRHZ+ysHAo=
X-Talos-MUID: 9a23:X+VgmwvVJDEowi96Zc2noxplJM510/+XOB4jvI4ctZGbNQwvJGLI
X-IronPort-AV: E=Sophos;i="6.01,184,1684814400"; 
   d="scan'208";a="119814130"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXSiXkT4E6EUMy81bIQg3tD+zhRkKhrCPmai1/FXrReeCcLHRqD+iOldZOLtOsNZ1tfI1TYKWYLPbohpZFJZZXk1xruz0+ipCZvV0w2vcWFt2GiO97xzGIk2Xq85XVhYfKnn3r80YEMIRR+DLmm7Cpw1bJlULfHy1MT0d5H9yvURTAVgfIpnl5YcfDYhSCBWT4km2Vy1P2+qKq6OSv8HCC721gN8O2CpyDhjwAYBbnU/N57/aBN1dvcEdp1h+mQTotxsedypOEkoVnFdG4GOZvFxYfNrANTNh06EXFtoIXAeCNROwKlv7I+F1bC0PAejavC1otT+0+UkLy/zpN3JSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qi4bK1mzMXI9n0x0Ain8VmBz09gGRrw9CeApVtaxyk8=;
 b=I0QkhFOSRbdULTovrL5VTAq9RbcQJ2wxgsBuoCdP5uLuOCepxg40+fRwaLXsn1QUSvnQ7G15lTxEDzXLiEra+0jSibdC3Qn7AaAII3LWekVxgyLWJn3Fif+Bgt73TW4W9cOkTepJ6OVbrnCJ4X9vJqkE0KJeraGq2WW0ipvL4fd9kppvZZEeCh9h03VYUT5oU32VKDEOimbHlAOFxv/+Tnf8/mEIAzUVEn/M06JyTfG1LFFYn70UPGoAvt4SckrpqrD3qv/zo6OKjrGsH6X6hoJCoM0lJPLoElMTo0DMPc6u/cpGMvBddpu/hEBASxwONt5BRz2DfU7bPrtPAcpNIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qi4bK1mzMXI9n0x0Ain8VmBz09gGRrw9CeApVtaxyk8=;
 b=cjjLX2Hg4oSXIhsjGX1M6WuqD/uSG+d0itghbrZxEg4MY85kRIHvSMvwA7SaSan8sNEukGGzs+bCOpYSzmlSI9SUFrBBKa5gmtcfleQsCv2I8wXOltyS1R6y829xjVCIEDAmdmK/qF2ZpSaLDI57J4RN7eJj3fGcabf54BBv/Qw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <70c18a3b-452d-9d5a-1781-95a742db496a@citrix.com>
Date: Fri, 18 Aug 2023 21:22:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 0/6] x86/debug: fix guest dr6 value for single stepping
 and HW breakpoints
Content-Language: en-GB
To: Jinoh Kang <jinoh.kang.kr@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>
References: <ca40fdab-fbe4-8679-9f7c-194d54a7ef34@gmail.com>
In-Reply-To: <ca40fdab-fbe4-8679-9f7c-194d54a7ef34@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0511.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a38a88-9bc9-4bbc-2749-08dba028ccb5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e0apcsJwch+6pWqIcvMp/3ubvugBRFeLpF6v47CCavbdsuEsUiOsQa7bwsJ5EpvZZsLSmVf8UNXLJ1lNf9W4vUahYUX1eHPiphmRwV/W2sReBmkwpWW39aHw50HWqdnXeMRGgaFbgDfED5jtbjot/uq+hlgymdU8Z15Vf4s+vhWfh+EzuCa61cdov/awn/qNQcrVyMiSniZqW5hsN7S2QpGLYPaumYbsRAIvjaHXz0icPVbglwh/q1YqzEPwxsWI1Iy/FbqjNe4mTWsTOiEaoorTDHhuYqzK9RI/RwOFx5pjMoiaJOK7DlkJv92OqsiemW6Of2Gm4++naA5tx8i29ZcmCB58YA2tx8xQrQCLHfD+m3W2+b2fQx6eiRWZWGWRmU8oTKNoNBcWF11CUBgDG/dNzBKy4PmnvZisCbDTOSn91c/4nCumyJLd4S9uL1gFvx3X5/Hik+9fr01ILHSOGiyRnZsOpl0wbZqXCLb6m7EHc+3zaS+2unJtmT/RJbycqmmuMMOdxQ6/qKfFAtVroE1TMpLxDd+CU9BERe2ZDAlw+JuQffTCCO1jDMT7vYyacqK6p1ffGj80kCT3rDZJvq/Fn5rCQCUjd/kc8/YohYGK6rO4jhz3FoTM8Hyaf0XpSKbwd7CNHKnUPERtyI6fxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(366004)(136003)(346002)(39860400002)(186009)(1800799009)(451199024)(82960400001)(31696002)(86362001)(36756003)(31686004)(66946007)(316002)(66476007)(6916009)(66556008)(54906003)(478600001)(966005)(41300700001)(38100700002)(6512007)(6486002)(6666004)(26005)(6506007)(53546011)(2616005)(4326008)(8676002)(5660300002)(8936002)(2906002)(83380400001)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmFIQTAwUDh0MmxCOG1qT2hydkhxaDRqMWpiZTJsSVVobkFnLzVXOVgwYlo0?=
 =?utf-8?B?YVdTR0ZiVzVuMTZrSTQxZlRGWUo0RmplZ1FDL3NSSlZRME1FWDdWYm9qUzM1?=
 =?utf-8?B?SGMzd21yTTEvZ2NDamxNWUs5NG83STJ2ZGJxbVE3UWhVbFZzbEk0TWN4Sk16?=
 =?utf-8?B?cHRXL1hjbzFuT1BnK1hub3FWWm1XZDgwNkUrZlNoTlY1dzdTcHd6MnNSYVVv?=
 =?utf-8?B?VGRKWUc1NDVzMGlzcE5Ha1ZkYlZKK00wNHdDYnJlTEhGaHBZajZDaUNUZERY?=
 =?utf-8?B?SmovS1pxYk5CbitZR0V1SG1VV1J2QVBkZ29JaFZ1T1h6T3dqdWhhTVkrOFBL?=
 =?utf-8?B?clhYdlZuWVdtMTdKWW1rQ3gvczJFeHUrLzJyeEp0MXZwclFPYndGMDNwc0d5?=
 =?utf-8?B?Qmw1L1lSZStiVFJmUEYrNkRCbXc1M2FnUFZNM1lEYTM5UkQ0SVRzZmR0Zjda?=
 =?utf-8?B?a1pHVk5mcjU0aExmRHdIa2lMVHQvcWlXbmZxbWorS3NmcUtmR0tpaXhXZ2lB?=
 =?utf-8?B?NmxEckdIaXZUTkVHaXJteHg0aFlsZmZOY2RPVzA3SjFFeC9NYW42SEFUSUhZ?=
 =?utf-8?B?VEFvd3NhMHNvMGtkdTJ4STYxMzRvekpnVUd0Yk95NGxMVVlQVVFsck4wMkUz?=
 =?utf-8?B?Y3VBZHlVdzMydkJ6blZGajFDS3FyeG1EMTBBM2c0UVA5ZXZ0Q2t4elZkZ2hQ?=
 =?utf-8?B?VloyS3M0MEg1bndqSWNUNXVndmU1Z0UwM2xyUmMva0QrdktOZjlVSUwwWW5z?=
 =?utf-8?B?NStTVU4yOFVnM1NvdnFCaElWTmw5ZXRGUS9id3FjN0N5SERXU21NWmlrNVJu?=
 =?utf-8?B?ZlVnQjhGdXl1eE1iTjNmY0RicXpDZFJnczFKck41Ulh6aW85bzFGNUlYL1Ro?=
 =?utf-8?B?aEtCckY0ZGpWTW9IcnV3U3o2TGxZS2RJNDdkRWFaQjNxNThWbEpCd0tid1dn?=
 =?utf-8?B?eGFubElsVFVyYjg4aGh0akwrQnN5cnJxdjM5V1QzOHYwa2wxLzhBdituck9V?=
 =?utf-8?B?bEtKaTV5a29hK0l0bVpkODFNV3kzWUYwaHJta2JERTZWa3ZVNEhhWldOSUI2?=
 =?utf-8?B?aWN3bm56R1lYclR0bjdSMXhzZm95ZDJWTm00ditkM2s1WFUxeWI2RWRVTkll?=
 =?utf-8?B?R0g2UmI2L3RtOTNhSmxPbmEyK2JZRWRRYit3Z2ZZN2tZaWxtRUUxQnFpUUxw?=
 =?utf-8?B?VUtFQStrMHZQK05YNnVBK0hrVkIrSllXUDBxekErOGN2WU43V2dNazVVSHpK?=
 =?utf-8?B?SGNtNFZ3akFBVWQvSnFYd1pTSkRhVzNmLzd0VncxelIrd2ovemJnaUkwWEVa?=
 =?utf-8?B?WTZzaVhETXZ2OGVXelIzWkVFM01QbWhHb3EvNUxSWU43VUE1dlRCeDNGeUNT?=
 =?utf-8?B?a295UnRVZ2hXNnlWSGRCODRJemhqdk96akZaN3VabFIybVpBc3pteHllcTZU?=
 =?utf-8?B?dGxRRTFvMXJabWxYV3VacHpOY21sUDREZGhNeXcrOFNQUjV2eWhBWDZvc1Vj?=
 =?utf-8?B?VEMxcmg3VWhFZEc0NEpHR0ptYU13N2g0Slh5VmVRNDlMOTQ0cFBQcWNtbEVB?=
 =?utf-8?B?Qjg5NGdYQXJLSXhjM3ZxMnNSc2hBenBxbStERUpYbkx5L2dyanF5QTV3R3pi?=
 =?utf-8?B?bDhXZWwzcnBqdm5kN05BK29URytDV2VRNVNkdUxPdHhsdW5OZ3BiMC9EcWMy?=
 =?utf-8?B?U0lOSGhFTE1mTGJTeEcrcnlSS2piVkZFcnZmM2x4bVJjYjFSQXcwb3Y0cGc5?=
 =?utf-8?B?SkQ2REY2ZjdQUkVzYk5BZk5rNXNqeDZ6bXBFVGU5YldnS01BQVpsRjVZZHIy?=
 =?utf-8?B?WnRrVTFTUUVOS2ZpdkdrQUtRWDJ2cExodnFqRTZOeHJSZlc0WFdGZGE1bzBx?=
 =?utf-8?B?SjBlV294VU9ZdzFuWlV6OTJaUEMvS1dDV3lMRTJ0a3NjdEIzL1QrRDAwL0NL?=
 =?utf-8?B?UkFtdGhsMGJmcDRIZGtFbERBd25KcU9XRTVCbU4yNHg0cVZTT3dWMlVXR2Qw?=
 =?utf-8?B?djYxTkxzS2pZQklzY3NtKytrUU1aY3kvaUdIbnZsNm9lbVZpQ1FPK2tjSXJ1?=
 =?utf-8?B?dlE3aWdWUXZNYjRGd2pnN1ZRQW42QWVaZTRaUUd5Z3FaSVZ4eFJvaU5oK3Yx?=
 =?utf-8?B?c2h1T1ZtbFBYWGYzRy9iTnZEVVUrc3lrMTh1YXFZUy9Pb0xHMGNycXhhZVFw?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EVSiYMhAfohBgue3KXqRinxXuDV65M+IUdti11SMDf2OP3DIDe9VxxqIELdEnB6DHBGAmoBShIhaxOOQuE2ULkDC6WS1CF8nVazSaSE21SEjIaYwM+CjICI4e4HcFCCcs3rMU7iLvlJIc1EJEmzCFDkoNdRrlTlNx1Iaz/i1F9oUITY2PZZbBxM2rCojA7pHO+cSJ3VlgaM/g89og+MakXaI0tSGGS8/KLPOQmLBYDwazXZ68itsf/yKrnFDvG81+nxiI3J1nQCyOqesRK7ZElZ63g8DabkPpsJ53PbT7Y3NImCE7lR0woDGbP/EjwWhw64Ex9G8A1ZKUpiw5SPQqHypLiuREhfnROiUuxDeyG06cBAzSsQcK5TwP21kyBCOnr4fhhDTfogVgf9+42dOwTLqtLiIFihgE57mW5mgiXrcwSn76Mx8M/hIED5y93RFBkdXfUlhxEl6xvn1R9xUlnSt5Qthp1LIgocVpbV6IwDNpbllA1oGzS09fb+1Ez+uxsntbGWJOsA5O4vDx7w7TaqcNIk85C4l7wh6B2t/ISOSTbOkdYOgrxhAESNoBG7T/IerjXolFS9CzIHWpNY8lUQiKEZsnQWGqF3hrvDcQC/75REKLuccRYqV88C0LeuYrrMhRgjwl6a5KkLWmR8mKISOkA0544tlnwYCb71rOyoMVFa8oPp09IfTx/LTBEc/TNeAID+RAUxr0Zu9BDd8KJwfy5rnC+IrXw/kV4dgObw/YkO86JFDC7Yfj6VfQkS8WEffEBX3V4SEOClAYzhjEejYH4976xJsdA+HKM+TuVLA/Hmqs+kD2MYEeN0W8LI+FeOMd9QyfsAHKBgMuyZw2gG3UMrNFub19unfSyPKI71yFpZnwxMjQ1I3IwGWDI9uWzMnt9IGIqWSkzfNYgoN7w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a38a88-9bc9-4bbc-2749-08dba028ccb5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 20:22:09.9652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jkHh/Qs2OMEsGGDh8FPU8u8HSHROWgBRDpxBHuKTrzh0dv3dvXaBfSDPLmdZ/cDnYA1kWKSkZTnE3VjDf6aI0TGK/B6lWjqGebnr9p/9ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5281

On 18/08/2023 4:44 pm, Jinoh Kang wrote:
> Xen has a bug where hardware breakpoint exceptions (DR_TRAP<n>) are
> erroneously recognized as single-stepping exceptions (DR_STEP).

I expected this to come back and bite.

https://lore.kernel.org/xen-devel/1528120755-17455-1-git-send-email-andrew.cooper3@citrix.com/

Xen's %dr6 handling is very broken, and then Spectre/Meltdown happened
and some how my bugfixes are now 5 years old and still incomplete.  I've
got a form of this series rebased onto staging, which I'll need to dust off.


That said, I was not aware of this specific case going wrong.  (But I
can't say I'm surprised.)

Thankyou for the test case.  If I'm reading it right, the problem is
that when %dr0 genuinely triggers, we VMExit (to break #DB infinite
loops), and on re-injecting the #DB back to the guest, we blindly set
singlestep?

This is wrong for #DB faults, and you're using an instruction breakpoint
so that matches.

However, it is far more complicated for #DB traps, where hardware leaves
it up to the VMM to merge status bits, and it's different between PV,
VT-x and SVM.

Worse than that, there is an bug on Intel hardware where if a singlestep
is genuinely pending, then data breakpoint information isn't passed to
the VMM on VMExit.  I have yet to persuade Intel to fix this, despite
quite a lot of trying.

Looking at patch 3, I think I can see how it fixes your bug, but I don't
think the logic is correct in all cases.  In particular, look at my
series for the cases where  X86_DR6_DEFAULT is used to flip polarity. 
Notably, PV and SVM have different dr6 polarity to VT-x's pending_dbg field.

Also, on Intel you're supposed to leave pending bits in pending_dbg and
not inject #DB directly, in order for the pipeline to get the exception
priority in the right order.  This I didn't get around to fixing at the
time.


I suspect what we'll need to do is combine parts of your series and
parts of mine.  I never got around to fixing the introspection bugs in
mine (that's a far larger task to do nicely), and yours is more targetted.

~Andrew

