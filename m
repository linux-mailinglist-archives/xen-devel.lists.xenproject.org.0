Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E8B738E1B
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 20:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553092.863452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC2CG-0000B9-D6; Wed, 21 Jun 2023 18:04:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553092.863452; Wed, 21 Jun 2023 18:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC2CG-00007V-9i; Wed, 21 Jun 2023 18:04:48 +0000
Received: by outflank-mailman (input) for mailman id 553092;
 Wed, 21 Jun 2023 18:04:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1i8T=CJ=citrix.com=prvs=529409482=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qC2CD-000075-VT
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 18:04:45 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 188f06d5-105e-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 20:04:43 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jun 2023 14:04:41 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5873.namprd03.prod.outlook.com (2603:10b6:303:9b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 18:04:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 18:04:39 +0000
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
X-Inumbo-ID: 188f06d5-105e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687370683;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=k52cY6Zj6COJ62jmBO1TL3RuofbL9mPFshfH8bQU02U=;
  b=PyNd21UhgxK7QVekD/pod1ua4ODxu72jVRroSwi9mx/I3Qt+DT1jey1h
   lrTiW5xGgrfawu+NScyrHvw5P+LNo/nCxhg44r0OyQcf7372NHLXbPoC+
   L0S2oGokgkQstEERlQbNzkDrbIUdSx/AMpuIkZmveqvIKBInM/C8ecWQx
   A=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 113679610
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Q1EOE6oLYnE3MGUTeVHbPSa4LeBeBmLWZBIvgKrLsJaIsI4StFCzt
 garIBnTbvqNYWGjfdhwO9y080lQuMfcmNRkTgJpqHpnRSoQ+JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GtwUmAWP6gR5weAzSBNUPrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACARTS6sqMno+u+2R7Jum+M9IpfIIYxK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYSFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXhr6U03wzNnzR75Bs+U3eBoPChkWeERf1ad
 xAy/Qs+oK8M6xn+JjX6d1jiyJKehTYHUtxZCPEz8wCK4rDd+xqeHGUCQT9HZdE8tck5Azct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/H/uIw6lAnISP55Gbapicf4Hz7xx
 T2Htik4iPMYistj6kmg1VXOgjbpqp2XSAcwv1/TRjj8sFM/Y5O5bYu171Sd9exHMIuSUliGu
 j4DhtSa6+cNS5qKkURhXdkwIV1g3N7dWBW0vLKlN8VJG+iFk5J7Qb1t3Q==
IronPort-HdrOrdr: A9a23:sf3qtaFmLU79tCwfpLqEGMeALOsnbusQ8zAXPiBKJCC9E/bo8/
 xG+c5w6faaslkssR0b9+xoW5PwJE80l6QFgrX5VI3KNGXbUQ2TTb2KhbGI/9SKIVydygcy78
 ddmtNFebrN5VgRt7eH3OG7eexQv+VuJsqT9JnjJ3QGd3AaV0l5hT0JbDpyiidNNXN77ZxSLu
 vk2uN34wCOVF4wdcqBCnwMT4H41qD2fMKPW29/O/Y/gjP+9g+V1A==
X-Talos-CUID: 9a23:f86LqGM97waVie5DSDVEymE7MZ4fL3DQl3XNBFG2V0V0R+jA
X-Talos-MUID: =?us-ascii?q?9a23=3Al8Uinw5TAB5qj/2+aHAv7jnvxoxuz56vAVgWuK8?=
 =?us-ascii?q?YlMzYaQp3GieQiwqoF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,261,1681185600"; 
   d="scan'208";a="113679610"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oh2BzntzK7BeoafcSyGrvp5pxvDewJ1ApbsCcRwsEE1dFV9Fuy4rAv0+7oojJ3A8afGuhKtE4au86sRjt3YQfSes84UEIACxA7cPCBMSsTzXqxme8ENizGSYGIsVsP5lHPhcx4xvZMTqrv6tzYKUQDBJxNUt76sJqJWGsRdbJ71Ihu27sCshlhyjDaQDaq/VIDCf6+YQdTY6j+rqXnv4rHJNcLXtnVhrIA3BOMw0/RJ3/h0ar1lTvVxP+FmIwUitm7wTP28IHPt0CZIIQft1djC3jv8dmfgSmxXNnGA/ekfIrYV+ldoKk1bNzhhUnCvG9ci7KJkFZwhZRP8K+B5/zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k52cY6Zj6COJ62jmBO1TL3RuofbL9mPFshfH8bQU02U=;
 b=Z2cbIlEbYUIcbSqQOM22gRxTwZctkcr0jNMhwCGfqckkC7JaWjAG/JLZWu6cPWsUIieYpd95jhXXVfdY1NVhrbvM1Yj+Afw1aLgtim408PsQKqUDvXm27GmngMiS9EIch/9q+KpHq03CASaC/b7a9OWOhmPA12Ldk0svqbPNma1AuNgZE2JkMNblRZlCMxK3tSqougWHLV8aQPMG60ONtxuqB0dDpW8FtXKFUb6OBuK/iTpy+bMbsJqbWk95C63jd0i34rVyGPUB4ylXjyYnFWOA0nLYBoff41VaS9gJgB5uIobzoLKnnLg2azdx//tQJgWwM/1JCb9piQqYSzpm1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k52cY6Zj6COJ62jmBO1TL3RuofbL9mPFshfH8bQU02U=;
 b=RV1SSeOlNjNr2hIVYAPDMozv4Ve319uF8OAqRbe/dpZSOZOX6/D3OPY19yagYTAcmSjzABeSaMDgaTEKHPRpWKP+TMNp1qgfq4k5HjXkTNpc/iht4lGiGjk4Du4nfOzMxGbHNuj2HRHy0N3htfZOmnGKImcI5aKc+RI0h0n5dzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f101b02d-9dbd-2e39-3611-30328dcd434a@citrix.com>
Date: Wed, 21 Jun 2023 19:04:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] automation: Fix KBUILD_DEFCONFIG for *ppc64le jobs
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
 <910f301dadbd2e15ef23837bb2e95903b8f0711e.1687366665.git.sanastasio@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <910f301dadbd2e15ef23837bb2e95903b8f0711e.1687366665.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5873:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a6927c-245b-4acc-95be-08db7281fb11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QTXes0KiGam/11wIhAtQTHLMapfdc3mg5Krz3YrNOfd8gCC/XjS/d4velAy0/i49FLnSSPrrN83MXDeuYrUEt0eFFqwhsapj9bGyyiYIHHFIo1/n4NfdfhdOIaWfICHR/ype2YdzXQ8J3BVJfDWk6n553qZgRQlKWzjwDMw3BLqfeqMTtBdMCDNKW1K20jgIv69dkWM7VY17DlJxsefiZ2H5flpqQU3Voqr6BH4AiVjxzwXZctSBfTmSZd+XvRD8FKfiUYs2eJ8v5hbzJBo8tpfxoHCaAj+BG8jOxWiYfO2Ei9ErRw6C+4PMjsR5FISpugz482HFsRcydskUlFPX4aKEV9KOCQ3CmyFFapfD9Qrmuipw1DzjY/CPuts0nz6G/Z3fFUKEZOiL9GwIs6UIyPRCK7oNmmsHa/a+HExtniPUuh+jPyfI9NG4LiARx9JPNVsykW/ySpXQtADA1f5QsuPECezlT82FtNC3CjuGRBhKdR/U+07cDYnIxwMfjZDGFPu3WxWzh4cVtIV/xkjP+3gJkeOkzOCJDICBIvVJ5llhxNxyJO+qTwrjrAbrjIrIEhtSb6Vb7UIrI0HzFn5iR30hE6Pna/doynft1fLSktCZbQ4UJNU+41YoL7z5YZyz9mJgW5Kvq+v4u4t1EN5vtw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199021)(82960400001)(8936002)(41300700001)(5660300002)(66476007)(86362001)(66946007)(31696002)(4326008)(38100700002)(66556008)(316002)(8676002)(36756003)(478600001)(2906002)(4744005)(6666004)(6486002)(186003)(31686004)(6512007)(26005)(53546011)(6506007)(83380400001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODlXZTByenQxY0R6MjJoNEVYOFRZREZLYmtaNDdXdTh2L2F4WS9KZUU1eGsw?=
 =?utf-8?B?dWdrcW5pRnExODVla3o5MmJlcUJ2QnBWTzkxWklhUGIwSmd6VTZudjBjY1Qv?=
 =?utf-8?B?VEJvck41YzA0dnJrMVhqWXBLZTV1Z2NVV0ZXakFPQmtUNjhDRGJZVlRBZzhU?=
 =?utf-8?B?cTlDOEZTTzNGcGoxVVBxbkI2YkZnSXJGRGJxVit5MzNsUjRnZktpb3dQYjhI?=
 =?utf-8?B?emVRTjA1bnN0eDFiNG0xdTZuUjNIME94Z0VHblJMc3U1eDF2TTJ4Q08yK21P?=
 =?utf-8?B?RUNtRmVYNmdlMkp5MHNjZVVDYU4vdTFWL0I2V0RGQ0V2L2txSnl4cXh4MWE4?=
 =?utf-8?B?aWVBbGpvT2xHUk9ROW9YZUt4NWIrZlVrSG9PbThxZGtmRXBHSnhIb25qUTNK?=
 =?utf-8?B?UGpPRVVBYldoRitZTGJxTjRRUHV5ZUs1c093L2RQK080V3MwRTh3Tll1YXg2?=
 =?utf-8?B?MUNidHJKeTFqU1J0MHVBekNtckI1NXdIMlJ6Y1N1VWozVFRPc3FlL2d3b2xT?=
 =?utf-8?B?SU1RZTFIQUVvcmxDNy9rdzJhT3Bma25qVFlvdm1GQjIwZ0hEWmxvYndRdFo5?=
 =?utf-8?B?b1B3THpwanpsR1BCcGtCZHExUVR0bktXUEFnSlMweHFJLytwYXM0R1IyRTZl?=
 =?utf-8?B?eDFKdnRIbEhtOFNTcUxVZG10SDMvNDVqNThCNjJsdDhIY1RZSGQ0UnVkK01U?=
 =?utf-8?B?L1N6VWpUcDh3UTBBNEJCbDBSajV2QzMrbHBCZ0tNN2pnK2QybjY0ZVNRN0FI?=
 =?utf-8?B?OGdZWG5LbXpPcWExc3I2MjZaZHkzdEY4d2NuOGFYWHJEbW9TdXd2UG5GMW4r?=
 =?utf-8?B?MW9sYkZRdmx5QWt2dVl1M3F1NVhHbmVCYjhoVy9RZFdaWllFL2JBUUdXcTdT?=
 =?utf-8?B?Y2I0R1BNVXRNdkF1WUhxTGVMYWdEaXFpVU1VTDZwVTdyUVJZMVZCWnU5eG1P?=
 =?utf-8?B?ZzBkK2p1d243QVFsR3k4MGFkdFBsRnRCb3NUSEY2dys2MXlXNGsxelBQeUlD?=
 =?utf-8?B?a004bHIxcnBGK1BQQ1N4WUYzWWhXcjRoemZFWkQrYnR3V0Q0VzhoMi9lZEQ5?=
 =?utf-8?B?WnpZUW1XZXA1V0N6MkVsOUx3UklWbGx6cDVxMnNnVDRZaFltN2h6c0FadjVX?=
 =?utf-8?B?ZXlIa0xnOWgyMFNNeC9nczdpR1BCb21qMWhOMHh5V0pQL3pMc1FXN3E1WFlw?=
 =?utf-8?B?R3BGUjN3ZThWQldBR0p3RU90ejlhNkxRY1pha09UeThOZDVhVUFBZXp2Qm1V?=
 =?utf-8?B?aXIwU24wWGRBbXIxZU1GY09UbU9mRGlDTVl0UUd0dE93Zi85UTlaSzNSTTQ0?=
 =?utf-8?B?OU5LSEhjZlI1Vk1HQzlBQUpFUExTUS9aeHpvMVBWNU9MOUJBcXNCNXR6VVE2?=
 =?utf-8?B?R3hsZkorR0R4eThOU1B4SWo5WlYzK2kyRlREc0pVd0FYWVJEWjBKTkZXdzZ4?=
 =?utf-8?B?Q0o2aEdxNThCL09vTG5kUzROekJYNHhLTHpJT24zblBxVnd5TkRyWWR4VExJ?=
 =?utf-8?B?VTNBWmZ0L2pJUm8zcjBGeG9GN0lUNzRIV3NNemsza2hieTRPUUNESjhiclpP?=
 =?utf-8?B?ektIeS9VNlgwVmhXTGxkTVc1aGJZUklRT2ZmeUpiaE45ZVdEdHlBWGhhWVJP?=
 =?utf-8?B?bHFNbXZZb2FhWXovVGkvZFNlaGJEN0loT0E4YjVRVWRXVHJJd0FOVW5DVU9k?=
 =?utf-8?B?VjZFUnc2b0xaVy9oVjVaa0lUREkwMko0QjdsbGdPRWVzNWp1U1QycmJhSkhp?=
 =?utf-8?B?UVVFako4RjVWN0wyYzZ0NFZEdVM3TVpmdGhock1TbkthZkpkS1dzazh5ZUpU?=
 =?utf-8?B?NzFqKzVZbEJQZDZINThiRVZIK3VDSUptRWhYT3g1ZUdjQXVpeUY0SXQxUXN1?=
 =?utf-8?B?RkxnMWFYRmpNTVRIYzE1SDlYUEJ2bkNxS290TDR6WkgxQ3RkWjZnb2d5cXFE?=
 =?utf-8?B?czNkNTk3SHRDWW03SFhiN0tPZmUwbHdOOTZEVjJDSFlLWkx3bFVyMW1wQStR?=
 =?utf-8?B?eVIweHNnYlVydHkwTkZDcGhORndOMVlUbUNvQ1FoMTBsdWVCV05YeDdpNHZY?=
 =?utf-8?B?M1J2R2pNTmpNZksvT3IvaDIwQjd3Z280OGFYNTViaGs3UGorQnJHT0kxYml3?=
 =?utf-8?B?bG1WMW9DOVN2MUt3REdlc09UWWJwcVh0ckorTmVsQUZnQ0dkZExITkUwVlBI?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qu3JuUQzyGlyXc60bILKiEu2FX4+S4n/7XcLkcJtnS7zTR3jjTLQtmuYMxIhqMjHAfDE1Qhh9FOlbE03h5LjRXarbqd4D/AujYmBoYQzXlCMCp/gQ7Qq776bcNomHZUbblIg4ZFOTUmSJc+EGn7jSfjWHSWnfRWb3nOsY4belgeNZy3FfBJsJu0BuZ+MVXhgQqoo7Np0ebBORX5KiKqSWtcuHOd2sC2bKMRoA6V8XAmuu7V2dOnP2rmTLPgTPx5+V/KjRyKvNnyw78jK4SqBku/nJyA3ryROtQLWdVy2YLjutxy2FlHAe+lA9gZnF6NBteGomZBd+6Ss1DoztQYLJv2Yu6Gvsm0FLzc8UkLgZ8T+GqjS/VHSRdybrmBVAxim5fUuE4g82p8CXGkxmmuTRbKUxCEnZ9gSK8fStSQmNZ/CB5b2fwntO8Tr/Ma8Cvm3IAjTTU9nLpmZEL9I9t5qA4/P2acytrpIu5riQXvBUtt5Pucrp19AVgh7oUeec0oHLI3+5t6qoLFUeRXLNBM5BjPXnTrH341pFxtEsMviE5+zzvs3o7R30XVc0M57tZ+ELxG6eIv8meUfpv3U/d+ejHacwtW0RtCE+w5YlCrQ27VtKaESZyXNG25QA0GYe9BYGTavfOrJnGz8qUxMNAzln9QnjO7Oyara1Dn6XWm9O0qr/hU1XTarNB+fVCFwCwNybLhJm6wgWD5PWdvh9m1Wz2p1joJlvvE1qfYjVKInQc64W6iJQYfns9m7cCzSe47xSqx+qeUPZmqS1FyRC6orLOri8E+vh4zm3jLujKUAnMcY+V0/pR6jGsrVnSqK0lNcmJTq65X031iu7fW5Jx5f9g==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a6927c-245b-4acc-95be-08db7281fb11
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 18:04:39.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WE7zopUvT0dLK7oNtiVejAg2+CWwB3SARXoDJ+VVtb7S3dB290cvxirduonlUFwbUJOQ8WkKglA4hpzghWptjvHyBSFPQo4yZuyB6pPqCPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5873

On 21/06/2023 5:59 pm, Shawn Anastasio wrote:
> During an iteration of the initial ppc64le support patchset the default
> defconfig was renamed but build.yaml wasn't updated to reflect this. Fix
> it up.
>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll commit this too.  Clearly it's not fatal to build testing.

