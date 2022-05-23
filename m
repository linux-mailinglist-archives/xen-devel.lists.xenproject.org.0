Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD19D530B01
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 10:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335547.559727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt33M-0004Hb-Gf; Mon, 23 May 2022 08:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335547.559727; Mon, 23 May 2022 08:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt33M-0004F4-DK; Mon, 23 May 2022 08:04:36 +0000
Received: by outflank-mailman (input) for mailman id 335547;
 Mon, 23 May 2022 08:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1/tb=V7=citrix.com=prvs=135606018=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nt33K-0004En-10
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 08:04:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f91939cc-da6e-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 10:04:31 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 04:04:29 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5454.namprd03.prod.outlook.com (2603:10b6:a03:284::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Mon, 23 May
 2022 08:04:25 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 08:04:25 +0000
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
X-Inumbo-ID: f91939cc-da6e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653293072;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Rz4hzDuzA9kTzkNOKNeWpiC1JUO88Q91EZyS+HXZzZM=;
  b=GHNlBp+/INehgK94HwDpJu8W56Exfq/W68zrQjOrjSXw00DAhlhNZqk1
   eyt/z1HWMQ7WrD7nncZY2K5UztyDtJEY5x0tc4HYB7zqqPEexR5JldmqU
   aLUMcbuVXwN0MyVGQris7Yq8klyatXDtgAHlvg8qbkG5dzMi11fCDxtFa
   I=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 72321082
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7MKeJ644Pf9xA9yDQuglpgxRtEzGchMFZxGqfqrLsTDasY5as4F+v
 mQWDT+GOayMMGOkKdEjYIu38kJTsJbXx9JnGVRo/y8yHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw0HqPp8Zj2tQy2YXjWFvU0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSxFxkbYpaQnt1BeAZ3M3FFA5Fo+6PYdC3XXcy7lyUqclPK6tA3VAQcG9Jd/ex6R2ZT6
 fYfNTYBKAiZgP67y666Te8qgdk/KM7sP8UUvXQIITPxVK56B8ycBfqSo4YAh1/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IC8wjM/fpti4TV5CFSjZLAFOiSQcyHFNsNlX6lr
 3La202sV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YS7QiMzu/e5VmfD21dFjpZMoV+74kxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLSsZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:CZRxhq58s7wIf4WkwAPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="72321082"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hcg6xHSB4j87yFNPbJXKKmIdPrJWYSCnLl70IaBf4koRgv8g9S/yHFz6iQPYj9dPnuyw8WhLabTfITDA+58ljrV3QwbZa8cLLMTekOXTwHL9TKG7Aiy8tsTmemZHOOCcuKTMLYNtezN/ODj1BfCi6ZWeN3D101Omi+0c3wg3vKKvBR9DrtAgMHmhggLr/yeWEAwBrXb/PhxZOacrnq1EfFhp6StgkxybBHLlxUCglI1kTtzOhWIav+NVkCUvzJnjL+5xyD8DiwPrb79twzHj437EZtdHTJ57kGIvT/MNM93wZjGq+zVTgYUa4NTEX3AX8RFPQLDMGQM54ZSscULdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6SjOGvFSMVgKXM0stxsmuSoigHb1a+2G+Uj+FzAquo=;
 b=jzJYWaw7JvhtiFVbab2/9T+aeZbk967m9kCoHVpp8WNY7ABSLaXp225vQnAtD2UdxgaIKZsoEZ5o+yWLpNQ1lTcu2Pbyxmj8c8WDmNqSMPkhbrbRfyY9ek7Vm3qWbsfMXTI6YCQ4Ll7vHOFDuE1AwvsCxfMv3oa+zE+3ubqfKe/rgaqszTYnXfZiERC9wsqpJQzZ0MAYecz8djvd9TpspRdbr0JTDAchUR4yjLpQpt5DVOx6TZsYFIIcTe6cSrdTzWaMFbgUzawN/njGS6GmEfFmaPMwc5F+8PO547L6Vv9VDTeEy68ToFjMI5M7sFSEzP3STK+x8Xq90255wLQCSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6SjOGvFSMVgKXM0stxsmuSoigHb1a+2G+Uj+FzAquo=;
 b=CkdbdSYinhVddb1Khz/ErVDnax/ZpUhGvPq46NCr4dPrcMQf6kNcwWPRLsHUg4V86cRpya2jF9XWV56YDiaKbTfb3gEJuvYe2Arl8tdTyckLM99ROCCpDs1Qkf3Hi0od8sWjWMFFLsCU5q3tNXgUvgep7Z7dRmIdUly7DxSsPFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 May 2022 10:04:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/5] x86/perf: expose LBR format in PERF_CAPABILITIES
Message-ID: <YotAA6ChNKWwSsCg@Air-de-Roger>
References: <20220520133746.66142-1-roger.pau@citrix.com>
 <20220520133746.66142-4-roger.pau@citrix.com>
 <33632dc6-940f-6737-c808-48e6c28fc0bf@citrix.com>
 <42cac54e-134b-dcfd-3ce1-1d6bfae9176c@suse.com>
 <e4d202f7-f4db-71e6-46a1-ee62ef41f2dd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4d202f7-f4db-71e6-46a1-ee62ef41f2dd@citrix.com>
X-ClientProxiedBy: MR1P264CA0068.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca653d4d-6d17-4443-e471-08da3c92da65
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5454:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR03MB54546A323F64E33D3435715B8FD49@SJ0PR03MB5454.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m70z0TmNLOtzAfGszuRSC1ZeHhQnfDcRf/A2k96yH0zToymYbuaixvacTCe4MsCQAFd85BWL7x1o5YBh+H9QEG3lOsVelTxhvvt9B94I3CTLRD3ymgkjl3duYQez0r3V7cbRb++AtGlTpN+JLunlshi0obm2wEM3zfM/JeH7zcd4bzWEQJTKj0pRS82Q8g8S8JrzAwpOfWfMfvPF/zQl9WEBOmza97Wpsl+PJCTapw2C/ywO0sdB8cM1bbNnBQvVwHv+jtbF42cUVzRH71SeLZX5uO3/6H9IpdSa0T3RTOzBG61Lre64+K+nHeg8NiJ45F15lvrwWTndGYjAq3xtwnZlNDtQMGzTx6qFVbIwYbiLl+E+LbDGJxhQzNxKA9GjobF/BiatNAJkdK0tS3r6SXDBPasytHJ0sIDNtBdf/7v4XUYzC2OwT/phBc+looxIS9eFSXgliBTDEHQ9EBgrGhGWz7NonD8vBnx1lFMsApk38Cgb+tnPWY2wzlNVpIdsxrqVRMPNltzAyaVBTrUYRYW/yOH3Hlr6/R3edzEmy62mh4nlZezGu+6mrVAWZ2Gv8ETosrGNb+PTPDIdKkS6IsrP8waP0Ip+2wP7Fzux1cNkVKfcHOE++X878N8nEw5cBKPxv2IeOmiqRyklMMDBJQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(5660300002)(38100700002)(66476007)(66946007)(85182001)(8676002)(6862004)(4326008)(66556008)(82960400001)(33716001)(6666004)(2906002)(8936002)(6512007)(6486002)(26005)(6636002)(86362001)(6506007)(53546011)(316002)(508600001)(9686003)(54906003)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V2Jnb2paRjNwdFl0UmhRb2NQZS9oUHZVelg2aHEwb0xwajE0Ym05UXYvNUVC?=
 =?utf-8?B?NnoxUGw5TktMR0FuTU5aVklCRmFDSjJQL01tZXlCcit4cDFzTXhMZlRsNGpS?=
 =?utf-8?B?dE53MG9PZktPYkoxT2x5SzIwNFN6MThBT0x0Rmx2VGVIWWJ0U1NIbWxqWU43?=
 =?utf-8?B?WGtPRzR1VEhNUzdjZDZxL1BPS2Z2OXZ3U252NnIyeHRTVmdtZmlPRksvSGZC?=
 =?utf-8?B?b1FSSkNKSUlqclRNVDVMTlZERklvdzNhblE2WWZaY2VQYzNtclcxM3dZcTJp?=
 =?utf-8?B?a2pmQXJOQzZyTmhUY3hBNHk5VWlGbzM3ZmxsdFdsVjA0b3lOZ2h1ejMvOGk5?=
 =?utf-8?B?MEdBaFVFakREcVZGcEIvZFpJVFhWUHhqSms5a3ZsSXBSSUwzZE9mODZBWnk0?=
 =?utf-8?B?c1NRQzZqdlVaYTNVVStZTnhFUU5JL05hYzFYMDZ5cGUrR3VQdlo5WXBQeWY1?=
 =?utf-8?B?MlhDSno2ZGYvR2t4YktibURjejNJNEFITk9mR202TU1wU2xTK0hVWXZNbHY5?=
 =?utf-8?B?QXBmS01GQmRlZ2R4WmU1d28vaFVFRHdpZnRiZTVTV0dKck1KaGVsMlU3WXhW?=
 =?utf-8?B?MEZhYTZIbGhpMUhWVmVDQUQ3YSt6TGxwN0IrVFJRSW4raHpzd1BCY1IxN1Ex?=
 =?utf-8?B?RGJ4OWV6ZEF6aytWZkJTWEFKNGFacE0yV2tkNzVld2RkU0lpWmRBZ3FQUVAy?=
 =?utf-8?B?a0FzeGJSQzJpNEZHQzMrRno0b21wTkc1Y2k4K2tLUFZpWkQwbEl3VjZIV3Uv?=
 =?utf-8?B?eUl0VDYvd0d4TU1BWU5PZHhERUlBM214cGxZUDZNMUlxYUVMV3lQOXcrMXVR?=
 =?utf-8?B?ZDh4YjZLaDQzNkF0NkQwM1JIZDdUdFZvbFlyUU1NM1AxWnpma0xpRVVOVEU1?=
 =?utf-8?B?Uk50a2Z4Q0s4VmFFZUVqTUFTQWdUVkNGK01sMHo0dDFNM0J4S2JuREwxTnNN?=
 =?utf-8?B?ZWEvZFlza2ZkRm82TmFvUVFBb3JGZW80VjVQTWNyeUt4NmpOeEdITGNZZFd4?=
 =?utf-8?B?enRMbzhHbEdyNm5EZnprckhnTkFnMFcreG5FVzQ2cTBrYkJzeGFUbDFZcUhH?=
 =?utf-8?B?OFhUWnoyVzBXQ2ZhWFBNS0RmcHAxQUcxamJzMmFBc1U5c2lFYS94U0s4N3Qr?=
 =?utf-8?B?R3FvUzB2OC9WS0JYMlN4TitRS0llWklMMjRsSWxrZkEyWUczQy9zM2gwVXZX?=
 =?utf-8?B?MVRWcGVkZ2hVdXhsNmVodVdCSXl0dUVPTlREZGE2SkZua2E5RkdOU2V0SDJG?=
 =?utf-8?B?bTF2bmNhU0g3QlRSZVAyb2tDeUtmaFlEaWhCNXRsSE1PdkZGeDAwdDYrbUlJ?=
 =?utf-8?B?UXV3RURNcE1rTFVKb0NGTlRoUkg1NXJudjJBNERyV1ZwNllpblBmR3BaVURy?=
 =?utf-8?B?bkg0S1BDQm9LUjczVklsdXRsTkNOWG9YdlovaGFBdkJTYUpTOFB6dTBoMndt?=
 =?utf-8?B?OXJyZTJYTTFnUjBiN2o4YmIvKzhzRUlHdnFYUVJMOE54cEhSb3Bkb0d0VXlT?=
 =?utf-8?B?WmY4bVg1SFVkUnp2UnovbDhOM1RVamVQTzNZV2JtVDkzV25qeEM4RG85eDUz?=
 =?utf-8?B?QUVsUjFEeEphYldET3BwK1JqSXRnV1BmRXB0SW5ycG12RHBIb2IrUzA1bEZn?=
 =?utf-8?B?VDAxVDVsd05IUXJCVzBMY3N4RElnQkFMNE1uTjBLL3R2NVpMelF3cVdFU0Ro?=
 =?utf-8?B?aUNzN2VpcGxDZjQ2bjQ1d0RkcmhEUDMrRFAvbUY5dFZzalpFT2dEdVpFNWVI?=
 =?utf-8?B?UFRzUXREUytzcUJFQ2J5ZXFId3FzTFdJM0Z0SzJYYXdBTkp0QkRDNzNUMUta?=
 =?utf-8?B?WmRac1lHS3ZMQUVvYm82SFJpK0FuZFFSMUI5YzFkQk9pSGp5UGtFcU0xNUVC?=
 =?utf-8?B?SE5nM1dVMlN1UGEvdmNLWHFvS3kxblFnV2lwZTFHcEYzQjlNREQ0cERXcERi?=
 =?utf-8?B?dm5wSXgzMnMySUZjRFRDYmppTlFYT3RWNnoyMkxmOVpVRTRJQlpZci9JeHZw?=
 =?utf-8?B?TmRiZEJySkIwei9JaHVmbGgwMVM4NFIvOTE0T3FQQzhNVDhoZGJEaXJJZ0ZT?=
 =?utf-8?B?V2pwWGd3dmltTDh1OXVTNGZTSHFiZTJmL04vem5HM1dhWDVuWEVlU29uQy84?=
 =?utf-8?B?MGxHbDAyZ2o4dm9TbXpYdUtiL2xQRU1HckRqQXVCTHhnTUZkcGZMckJmN3dG?=
 =?utf-8?B?anhvVWFHVEZPZlVyc3BXaTNVWGZUVGVjWUtsZzFXVDJTeFZQWU00cEdqVEMy?=
 =?utf-8?B?di9IZ1c4b1lkckFrT2VVckxIVUFWbmR0WVJrcjJpSGtFTTNTdk9mMSs3OU1m?=
 =?utf-8?B?akRhRytuY1N0TVZtOXlJeFV2VWk3RTlkSTU3bGt3UVJQNWl2NXlQQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca653d4d-6d17-4443-e471-08da3c92da65
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 08:04:25.4598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYC1pydRSPvw5/KxZb7yJEKhTP0SbDMMwfKcGIkgzmqUIdp4s52wfgR8tXXQNYGoe1Hj8bANSPjM4YKwb5UiTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5454

On Fri, May 20, 2022 at 02:58:01PM +0000, Andrew Cooper wrote:
> On 20/05/2022 15:19, Jan Beulich wrote:
> > On 20.05.2022 16:10, Andrew Cooper wrote:
> >> On 20/05/2022 14:37, Roger Pau Monne wrote:
> >>> --- a/xen/include/public/arch-x86/cpufeatureset.h
> >>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> >>> @@ -135,7 +135,7 @@ XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Supplemental Streaming SIMD Extensio
> >>>  XEN_CPUFEATURE(FMA,           1*32+12) /*A  Fused Multiply Add */
> >>>  XEN_CPUFEATURE(CX16,          1*32+13) /*A  CMPXCHG16B */
> >>>  XEN_CPUFEATURE(XTPR,          1*32+14) /*   Send Task Priority Messages */
> >>> -XEN_CPUFEATURE(PDCM,          1*32+15) /*   Perf/Debug Capability MSR */
> >>> +XEN_CPUFEATURE(PDCM,          1*32+15) /*S  Perf/Debug Capability MSR */
> >> This is the bit which requires more toolstack logic to safely enable. 
> >> Using 's' for off-by-default is fine if we want to get the series in now.
> >>
> >> But before we expose the MSR generally, we need to:
> >>
> >> 1) Put the configuration in msr_policy so the toolstack can reason about it
> >> 2) Reject migration attempts to destinations where the LBR format changes
> > Since this could be quite restrictive, and since people needing to know
> > they need to hide this feature for migration to work, I guess this would
> > further want qualifying by "did the guest actually use LBRs so far"?
> 
> In practice, it's every major generation ("tock" on Intel's old model),
> so isn't actually limiting the kinds of heterogeneous setups used in
> production.  (Migration gets steadily less stable the further apart the
> two CPUs are.)
> 
> As to dynamic, no - that would be a security bug in a cloud scenario,
> because there must not be anything the guest can do to interfere with
> the manageability.
> 
> Use of LBR is rare, as demonstrated by the fact that noone has
> complained about the fact that migrating such a VM will malfunction.
> 
> As we now have a way of reporting "no model-specific LBR", I'm tempted
> to suggest that VMs get no LBR by default, and someone wanting LBR has
> to opt in, which is also an explicit agreement to the migration limitation.

I did also consider exposing "no model-specific LBR" in
PERF_CAPABILITIES unconditionally, but I was worried whether that
would break existing setups.

If we think that providing an option to expose the native LBR format
in PERF_CAPABILITIES is fine that could be a sensible solution IMO.

Thanks, Roger.

