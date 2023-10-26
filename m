Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D197D8565
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 16:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623857.972113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw1pI-0007BW-64; Thu, 26 Oct 2023 14:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623857.972113; Thu, 26 Oct 2023 14:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qw1pI-000796-28; Thu, 26 Oct 2023 14:59:12 +0000
Received: by outflank-mailman (input) for mailman id 623857;
 Thu, 26 Oct 2023 14:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qw1pG-00078y-Ft
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 14:59:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34f8cc60-7410-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 16:59:07 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 10:58:41 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6756.namprd03.prod.outlook.com (2603:10b6:510:123::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.8; Thu, 26 Oct
 2023 14:58:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 14:58:36 +0000
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
X-Inumbo-ID: 34f8cc60-7410-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698332347;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=5U/VzeDPj7AOeu5IpE6nPr26lbRj09RnYBJhRPVk2BU=;
  b=SuYVZJFg3TmtqkQqZIubOR6nQ35k6M6jec1eon5YL72uT80Mdh7sA4HG
   HyI/XSLDwDdEwMFuSt+H/zI/3AH2cqR3J884gxST7PMA7FLhbntU7fFQY
   lNkZjxyTn/WX3a9VM7GussgNguWrLUepip1tUhpM5pCdmSjyktgS17u2v
   I=;
X-CSE-ConnectionGUID: P1WCKbUMS7iUltTZP3pAZQ==
X-CSE-MsgGUID: tEfxsaEKTzy0EVD+mLFrHw==
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 125332745
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:U3B1VKCDew3DQBVW/xLiw5YqxClBgxIJ4kV8jS/XYbTApDwl3mQFx
 mFNWmrXa/eLMzT0fd9+aY6y/E4AusPcnIc1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4WtC4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwwr9IKkJEy
 NkjdzEwagy/tdrt2JuJc7w57igjBJGD0II3nFhFlGicIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxuvTm7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC/33bWQwX6TtIQ6CJC25uVjrX6v1H1LJSM6Fl6fj+OZlRvrMz5YA
 wlOksY0loAi+UqqR5/nVhK5qXKNvRkBc9NVH6sx7wTl4qje7hudB2MEZiVcc9Fgv8gzLRQ10
 neZktWvAiZg2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OKu8j9mwFTSux
 TmP9XE6n+9K059N0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLpfZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:z07GA6ED3YKrkHYnpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-Talos-CUID: 9a23:wJX93W7wupG5C0NX+9sszBcrMeMvT1jmk3btJ1OEO14yUJSncArF
X-Talos-MUID: 9a23:xjawfgTY/FDGaDJERXTwqT9yL85FwJi8GRggr7lFvu2qLwxvbmI=
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="125332745"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ud8LUVhviozYFrw+6DgV91a+7HWO+fppRyx4sV22Nh2WKDvYPIjK84JhlZdTDwa0SrZQaGWZqYpO1CAhFly6ywW2aIBFVhOJ/KJHmgpc0BtahPWD/RKoAc0O1dAGF4G6UZB8RU74IHql5M6VcmJWPlORARaXnOgKAVVNlOqH0kznNGUUEMWAh6mlgEsuwA2EfWC3R5IkzIN8Kefn0PfquDsmhQjwkoxR5WqZo99BQtUAcvCUXJBa/P7W65liwPstqfyW0odt0bvSKIj5eEhdwjuABtRBOU7wN4xAB137qEd263bxnmuo1uJViFAAtG9amzDevdfgIakMqdpC15wnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOUWLR/1g7VYCnjpuMUXtn9c0XUy50nA4MNKKLyJP7I=;
 b=mSepF4po2JNeT2W3qnk7UXMrhNAucbNuXRlafDHio+g1yYr1WtrQtlZWG+jpYxsik2H366AvKPsKbZZphUnUurB2b4iDiPK+xA7DNIr4z5+df03Uw8ytL65WJQAhg6Bgb3wBB1L+Jvuw4NQo3/E8G5P2l2pNTnn3DS442ye9IRys26/wzA37lmMS6rDpEEYC/Ee7ENkbhC8cVZ5ShDNmnYmAri8q6DDjVZD8FO1PzdsXPtf3dyzbRBW1D7Tou0xs248Yktov5+zKku4td+ju3Vp0883BUfSkzGspVLmE2YaVu4KRGllOVPKiHpAgbmdoE5d4HLEUFKMPjpKdaZK7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOUWLR/1g7VYCnjpuMUXtn9c0XUy50nA4MNKKLyJP7I=;
 b=iwmuNVMKh40LymuzRryq3aZ8ffT9ZJyHUPFu0rOs/tkW2AQg2TtVjYhD6TN2wPYK803FTPVlSaV5gyM/NgLXGWho57XKVeGoJeEymS3w2ZmArCU9H2C6xV70m7n5hkTZnnuDTjXqA68XFo3Z3d1HwoSYLk1izAodVTdp3CnWanA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 16:58:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Message-ID: <ZTp-l6Kysgu0_xXL@macbook>
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <cc4c6681-a788-4069-8470-730969018fd0@citrix.com>
 <84b6679c-1956-4c6d-1fbd-b72846b69d1a@suse.com>
 <a4d4cac5-3987-4891-8aac-c5f559a02b59@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4d4cac5-3987-4891-8aac-c5f559a02b59@amd.com>
X-ClientProxiedBy: LO4P123CA0450.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6756:EE_
X-MS-Office365-Filtering-Correlation-Id: 6afa3c29-ace2-4eb8-2b27-08dbd6340799
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S5+XAHX09z78AcBYACw92CBytpqb1A3uD13C3gXavlsg9iXmnrLvxJs9i4u0l0PaLmJN+tRz8ElXkEcaOJMQNyfirMmAYUPXqjwiEzRCy+kDC1dv2CbMNtOosHFK6etCP3QfzvcmsJcEaFODQNsHqrCNpAqbL6pER+GBKf1+M8wsNrGEe5PqGR/Dvd4I8TrCEv/GUrpY0Knmqx9vHP7bFdlrAdordh2n8tWupG7KRaW+hXO7WggzISVjm1efLitdytZBGubtMm+lxGkP4+qNNV6wLqpi0OGsXaEQkkj+UyMaImQOQxy/w66LrUopWxvwkoob70FZDfFNxUSZpth/b1jHYlFCvLYskE6h5CkDMKENxYdIwnc+RYTb33TLE03dWTNVAtqG1DTANXNMLpAWUrYed0fuYvqKzgM9g5xLjMp20q877JdcUvReUksGWCBW2fW9bB2Co1IrJC9pcq0zt7hV4TRXeqY2tn0Wlf6XciOdgBGISlATv0uqhpaNmBNQvAAcfPX1PNmUwAMGOvBsfCgPi7sQGOW9aLhWnRK3OgbG+jaQwik/Th7rl5Ax1iRK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(376002)(396003)(366004)(136003)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(83380400001)(41300700001)(5660300002)(2906002)(86362001)(85182001)(26005)(38100700002)(82960400001)(33716001)(6512007)(6666004)(9686003)(53546011)(478600001)(6486002)(66946007)(66556008)(54906003)(316002)(66476007)(4326008)(8676002)(6916009)(8936002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDlsNDc1N0owRDF4VzlSakc2ZXVXRGlNRmFBeHVzT1NhY1NkY05jZXYzK0pN?=
 =?utf-8?B?cVhXVVN1cDNxa3d5SWdRd3FQTEpmVnBJMisrSFIydGVlU25RRXlmdDNrQzFT?=
 =?utf-8?B?VEhOL0RXekN5R0l1K2dwWFd6Ujd0bWVxQld1N2x3NEVOMjl0QnJmb1hPN0M4?=
 =?utf-8?B?Rm4xMk1YOVp5LytOT2RuY3lpaXpELzJ0MXVJVVNyMGFWZ2l3eGtjeEw3ZnJq?=
 =?utf-8?B?LzhpcDZoSUw5M3prVnBLUjdpVFM5U2l0NTNRdmtmWUdDSlNMNlVRYUZpMm14?=
 =?utf-8?B?Q1dlS1N6VGl4d3drb3RJeTl1ek9kUk1aelpKcDNVYm5HSW1QcmVFTmwwK2p3?=
 =?utf-8?B?dmNCU0hicWlVVFlEMkI3bW0rWkNKMWJTU3NzTzBwYURwUE1OVERuN01nVTNF?=
 =?utf-8?B?R1NIVWF0bHduTTN6ZExYQmV2NUdTaEhXRms4ak5YMjZXbmJHa0ZNUWZWc0pa?=
 =?utf-8?B?WFpKTUo2WE9IM0VRZ2VnNWIyK2lwNGJKMFlPaW1kQ1ZhOHlpT2U0UmJMeHVS?=
 =?utf-8?B?V2xDdzIvUnIxSDdaNkxpR3NXNitRa3BTeVNwUEJOZ1RYV3RxL3RHU0NwWnI3?=
 =?utf-8?B?WXJvZHJFOFdia0EvZmJ1dHR1cms0T0VuaW9ieXpUbXhsWXE5OG5ZSmpldGNQ?=
 =?utf-8?B?alJ6NzZLa0NQUFVJTVhxOXM5MkxXVlZMY3lLTEc5WUNtdFMzaCtkS2hKeDZw?=
 =?utf-8?B?QmlpWHRIQUlPSDRmRHhzSUt5MWZlazd3MUZHQjY2dlBqNzN5QWJnZEJjakNP?=
 =?utf-8?B?MzJ0NVRlcFVJRHVJNkh0VlNNZFdvRkNPSE9CUm9OTy9rRllKTENjRGZiT00x?=
 =?utf-8?B?R3dLZ1hHYzRwa0hQM205RXVhYXBzbDhpa2xEWHREMG8zRGNqRVB2dVdkeXZS?=
 =?utf-8?B?U24xQ2JaK1J2dzNEbW5LdnN4czJWcXpvV0g5TWlsZlBlS1lYdk9Rcm4vejBH?=
 =?utf-8?B?S293TWFzaityK1FuNlVmOWg3ZXh5Y3dXVVBZR3hHSmRyVDJEVkdJa3lzYnFJ?=
 =?utf-8?B?TVkxd210QjA1MUtUTEFBa29WUVRONTBaYlJpMjFleStZQVJyOGFNV05PVzEy?=
 =?utf-8?B?eElRcUlzSkNqUUdZZVJWQVRvZkpFUmxSOXJDNzZGRDZtWWtwb2VQZWRZTzlv?=
 =?utf-8?B?T1JvaFVMeHk0MDA0cUtEbGhqY3ZCd28wUzhjMWZYUHk1VktoU2h4alFZSUli?=
 =?utf-8?B?WmNrZ1YwOXEwYStwVURWcWZzWW1xWEVxbVZkNDBXZTZsQ3BRVVo3d25vUXFN?=
 =?utf-8?B?T1E2YzJBelZhdDh3ejFBa05ZaGJ6ZDhoU2czbmt2OFhUYzVNazBsL3lzVUxl?=
 =?utf-8?B?VWZoNnR6ekxudUdZU1N2RUpSckZZNVdRSDBrQTZXYkUzbGVWUnJTSHM2WEdY?=
 =?utf-8?B?WVp2WWRBQjFTaDdtajFsYVFnTGxLRjZkTTdISjlMZHlwc1E3MXd0L2hVQm0y?=
 =?utf-8?B?U3dyYk9wVmNITXlsVzVZVmhqUGZjZlVrRVpGcm84b21UbWRkR1VVOGVMWFF5?=
 =?utf-8?B?MGM1dlpseUtJZFRNWXo5ZWtXajJWSEhCWEFpbVYxdzliekFFeDdqWHdUNk51?=
 =?utf-8?B?R1liTmw3dWxnMlJJRm5ObnpMNGwvWUY5V3VsMjd1eXdqbnQxOEpuNlUxTTFF?=
 =?utf-8?B?QzZYc1pReVdLUThZMmw1bWZnK2hlRTJ0N3RGeEVSS2N5UGEzWWR3M3JsR2pZ?=
 =?utf-8?B?VzNVNDNDaEhwTEw1bGNJNHZXeFBHSVZlbjdmTlFid3plcVU2VW5pZ1pGb2sz?=
 =?utf-8?B?Z1FWdlM3K0hHNS9QTDVxczBVZmQ0Q05TWXgxWHF4QjVKWThSZi8yZlBFZHh0?=
 =?utf-8?B?TSt3NEhxb2gyMEpkcTJFQmtuM1ZZV0V6b0RLWU5YZXZEeEZ0QzBIdHIySmE4?=
 =?utf-8?B?Mlg3ZnB5d09RYUlMOFpvK2ZYQ044RUVMUFFzNWpCRm5xRjNQMTVINEdtWjlk?=
 =?utf-8?B?Yk1qRlFRaUVRT0VmMFNRb3BLSFA2TndKYVZOT2FmSzBZNFhmbDUxd3FQSEFa?=
 =?utf-8?B?aU1LR3VTTGt0K0JTZ3l3OHBWeGNsTXJoT3cyRGdtM21qR0diaEI1ejZWV3lC?=
 =?utf-8?B?YUtra0NuVHdvMVVXWWdLL2xZMDZpWms1T2RtVGV5UGxFam9VOTEybHdoRUpG?=
 =?utf-8?B?a2VwaHBxVjhaVW5jTXFhdFZzUTlZQlZ1QlM5SWNLWDlPUndNWXQwYmt6eXMz?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pZzKC+2Cus9vRpFmroQqKzHsqLrYtiETYdygCcJt5K86f26Y6ZYGWTu1wDOfcwCJOp4F/z3j515aBu/nnEoOJyKvIoP5C54OfFXVMYR34kUPV83aY/Bkuhz6dr+Wga16ZsMsXlEc6QCOkIIdYbEYlxBbe9OWBqYppTUhPAsjs616nxDC+UOApMF6PKA7Lm3CA9l4Bk/m8/LqmAo3QZd880cK/R9j+lNnPw/aWEkaiNgkZzGHuo3m9yd/p+/WdRBEB06VUAJlbdUbvGFGEs1Gp066L1zH9rJ9p9FcgUijYAWtx9zdyOkgemFb200k1R9dfT2+ClFZh9R1wLfA7dCXbytE4GAWhOhv6K07vYOdTnsEuemv8HeZKVEl9QbjaTmAaNrOYMxm1wZtgSxkzgUmHvswcswcnQCYQPtPPl6pXDYnh0R28fcTuf+AV73hiTCmnwnEZISVTrb6Mwm6x3CKHhf5dqLgpl7U4UOQiT4Erriewvuh+AX2KpzOOwUzgS3xj5zKSFod/d4vjeK6ehtEB3FBVOpob9ZDPoGnd6sW9T9gS1BffzIlczm3KtyXY6a5/zpdxg1P3Xs35eiD6MmaqTTxqFDYxjbTEF1eaST7A/AdSjxZrZOlZ3YuBlJA4h+Ea6aq53m+HWYNBRB8MMIUpcEsSWCOg4pf5GSr942jXIoe37hYgY7vfJOJKjL813iHIcfBPTTOP1x/Su488aN9wUc2Gv3Nwek6QqVGfaxzrPcr6cWdB7g9B8XVKd4Wngv3hqMa1JtrQyESyLIEFnjuPnnEv+cbTqk/nNOnyrTSC/OOnMTXOhJ1iYXNKzXOXol3IQipl4fA93WE5XPzSUBDJxsSEj9ByOQYMNlgzDyuxY4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afa3c29-ace2-4eb8-2b27-08dbd6340799
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 14:58:36.0480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWCPEbhb+arBHX0HTEaLYJPhneaKY8vIZOHMeUAX2y4ivVtbnq6LzsTjmmrujgQRZdQyyzZYfcaA0LJq5NTIPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6756

On Thu, Oct 26, 2023 at 03:09:04PM +0300, Xenia Ragiadakou wrote:
> On 26/10/23 14:41, Jan Beulich wrote:
> > On 26.10.2023 12:31, Andrew Cooper wrote:
> > > On 26/10/2023 9:34 am, Xenia Ragiadakou wrote:
> > > > On 26/10/23 10:35, Jan Beulich wrote:
> > > > > On 26.10.2023 08:45, Xenia Ragiadakou wrote:
> > > > > > Given that start < kernel_end and end > kernel_start, the logic that
> > > > > > determines the best placement for dom0 initrd and metadata, does not
> > > > > > take into account the two cases below:
> > > > > > (1) start > kernel_start && end > kernel_end
> > > > > > (2) start < kernel_start && end < kernel_end
> > > > > > 
> > > > > > In case (1), the evaluation will result in end = kernel_start
> > > > > > i.e. end < start, and will load initrd in the middle of the kernel.
> > > > > > In case (2), the evaluation will result in start = kernel_end
> > > > > > i.e. end < start, and will load initrd at kernel_end, that is out
> > > > > > of the memory region under evaluation.
> > > > > I agree there is a problem if the kernel range overlaps but is not fully
> > > > > contained in the E820 range under inspection. I'd like to ask though
> > > > > under what conditions that can happen, as it seems suspicious for the
> > > > > kernel range to span multiple E820 ranges.
> > > > We tried to boot Zephyr as pvh dom0 and its load address was under 1MB.
> > > > 
> > > > I know ... that maybe shouldn't have been permitted at all, but
> > > > nevertheless we hit this issue.
> > > 
> > > Zephyr is linked to run at 4k.  That's what the ELF Headers say, and the
> > > entrypoint is not position-independent.
> > Very interesting. What size is their kernel? And, Xenia, can you provide
> > the E820 map that you were finding the collision with?
> 
> Sure.
> 
> Xen-e820 RAM map:
> 
>  [0000000000000000, 000000000009fbff] (usable)
>  [000000000009fc00, 000000000009ffff] (reserved)
>  [00000000000f0000, 00000000000fffff] (reserved)
>  [0000000000100000, 000000007ffdefff] (usable)
>  [000000007ffdf000, 000000007fffffff] (reserved)
>  [00000000b0000000, 00000000bfffffff] (reserved)
>  [00000000fed1c000, 00000000fed1ffff] (reserved)
>  [00000000fffc0000, 00000000ffffffff] (reserved)
>  [0000000100000000, 000000027fffffff] (usable)
> 
> (XEN) ELF: phdr: paddr=0x1000 memsz=0x8000
> (XEN) ELF: phdr: paddr=0x100000 memsz=0x28a90
> (XEN) ELF: phdr: paddr=0x128aa0 memsz=0x7560
> (XEN) ELF: memory: 0x1000 -> 0x130000

Interesting, so far we have accommodated for the program headers
containing physical addresses for a mostly contiguous region, and the
assumption was that it would all fit into a single RAM region.

If we have to support elfs with such scattered loaded regions we
should start using a rangeset or similar in find_memory() in order to
have a clear picture of the available memory ranges suitable to load
the kernel metadata.

Thanks, Roger.

