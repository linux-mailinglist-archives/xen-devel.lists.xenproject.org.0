Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D853162F7DA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 15:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445823.701239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow2XI-0006if-1X; Fri, 18 Nov 2022 14:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445823.701239; Fri, 18 Nov 2022 14:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ow2XH-0006fw-Uj; Fri, 18 Nov 2022 14:40:07 +0000
Received: by outflank-mailman (input) for mailman id 445823;
 Fri, 18 Nov 2022 14:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pmcl=3S=citrix.com=prvs=31449dec1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ow2XG-0006bH-KN
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 14:40:06 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e349284f-674e-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 15:40:05 +0100 (CET)
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Nov 2022 09:40:02 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CH0PR03MB6113.namprd03.prod.outlook.com (2603:10b6:610:b8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 14:39:58 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Fri, 18 Nov 2022
 14:39:58 +0000
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
X-Inumbo-ID: e349284f-674e-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668782405;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=8HUZYwP7dd08boQwshX7Unr0XRMHi75S02MTCz7VE2U=;
  b=TWEcSXvzQ7vUDiQ2HwhxiR/c0jVdaWCJCB+YRSp9PpvSHm0Sj8NVD7Zm
   u5utnwnzqjmj2kEU9HGe85CwpqkrXzCeKtxnoXrYvBMN2G9UrXNsHrbUo
   LxZgvUFxWLKF+FATAhdlick0rOgtPYdVs9RN9p6STydY8qRzT7AUwJA8y
   c=;
X-IronPort-RemoteIP: 104.47.55.104
X-IronPort-MID: 85541248
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EPiF8alM5SLVkEnLV7Ra1GXo5gyTJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcX2jUOPzYMDbyeNska4XloUIDvpTWzN5lSFc4/ChgRiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5Q+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 c5BAXMzSgrdvd+J64qWY+lVlvYIM+C+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieCxWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzX6mBNtISO3QGvhChlC0/3ZCAg8qb16li/OC00u+dMJ7J
 BlBksYphe1onKCxdfHdUhuisTi7txgTc9NKFqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9WopWm1876VqXa3JnITJGpbPSscF1Jdv5/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:tunLSKzjWDGW4JMWE6RPKrPxRugkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICOgqTM6ftWzd1FdAQ7sD0WKP+UyCJ8S6zJ8n6U
 4CSdkDNDSTNykcsS+S2mDRfbcdKZu8gcaVbI/lvgpQpGpRGsVdBmlCe2Sm+hocfng9OXN1Lu
 vq2uN34x6bPVgHZMWyAXcIG8DFut3wjZrjJTIWGhI97wGKrDWwrJr3CQKR0BsyWy5Ghe5Kyx
 mPryXJooGY992rwB7V0GHeq7xQhdva09NGQOCcl8QPLT3oqwCwIKBsQaeLsjwZqPymrHwqjN
 7PiRE9ONkb0QKYQkiF5T/WnyXw2jcn7HHvjXeenHvYuMT8ABY3EdBIi451egbQrxNIhqA07I
 t7m0ai87ZHBxLJmyrwo/DOShFRj0Kx5V4vi/QagXBzWZYXLJVRsYsc1kVIF4poJlON1KkXVM
 1VSO3M7vdfdl2XK1jfo2lU2dSpGk8+Gx+XK3JyyPC94nxzpjRU3kEYzMsQkjMr75QmUaRJ4O
 zCL+BBiKxOZtV+V9MzOM4xBe+MTkDdSxPFN2yfZX79ErscBn7Lo5nrpJ0o+eCRfoASxpdaou
 WMbLphjx9yR6vSM7zP4HUSmSq9A1lVHA6dh/223qIJ9IEVH9HQQG++oFNHqbrSnxxQOLyfZx
 +JAuMmPxbSFxqQJW935XyBZ3BzEwhqbCRHgKdOZ3u+5uT2F6bNisv3NN7uGZuFK0dVZoq4OA
 pIYATO
X-IronPort-AV: E=Sophos;i="5.96,174,1665460800"; 
   d="scan'208";a="85541248"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyMO7Yqk5Um1sf1F1Gob00Kc5O9Nme1XFbTiQWa1uKJ4uEFU4k+trzPKZsz3bKhj4u3/uHK3b60R6KU1fiS4HuBXkOv09/LUQpcEUlsAgLednAVhmj2BOrfPw4/poe+8i4QL1YvMeqDKTXM5oO8g58ealTNsy1ePicMvZZyA2NdSmFuxLUqX9m2DUXj6CNWnhPSwcqfYLCM++/UBpta8sx9Sj0wy/T4kUVQTgVrzv+KkvDI9s3hxYaWn4e5jdVekrsxscY6Fkb7+cJIfLx3xs6F+QPLyunU0rqOWvJi33uyU51xGDjLL6FbikMwNYgbSmLklF/fD136y5Pm/qPSNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcYhGxGlfRIrYHUNUGzrdlSjRttcGg75WlNpZCiPtdI=;
 b=WJ1x4DmX3jkJ0LIFUJ8J7L19r4i+S0xhtJXs2b0Cj7Q/8gZXhEdhPJ6Nl5aB0slpkBg2v46bP3W3LFEedrb0ULIkO407fGyIXcztoJnd5dXBj+0Ni7AtEYW3bZrhjO2scpSfzr+qNs9ZlkvtUZ7Z5dGdc0t04XKf8J1hWH374dhaDroR7nogsMGDy8YPML1WP5gedQXlQMkdNVEI8TLWxKapV1khG3UP6M4pE/P3PJoCtvB8Vlk074Uu42fmLNTjExvIUxW9r3fZBsQI0M3n8GylvV/85oJIHEbWeXZkPzJXgofun/Jh3iXAl1HZDhdm3VTTWFFHBDwz4VYDSkc8NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcYhGxGlfRIrYHUNUGzrdlSjRttcGg75WlNpZCiPtdI=;
 b=Z5q0Ora/n02Bfh8EQbUlAV8UP3H4XRAjmYZl6oDd3fd7L8PI1serh92mMiTQRpglSJowS3kykSXoDmCAg6Zr0LSUBShwCjj/XiXr9La+JKeH6GPkjMlY/el+aJphCpnDvS+k0skAZBEZyOEk1iBEBCK3e3KXd55E54k0/6fjH+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 18 Nov 2022 15:39:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Henry Wang <Henry.Wang@arm.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [xen-unstable test] 174809: regressions - trouble:
 broken/fail/pass
Message-ID: <Y3eZOcmOYkNLdeGe@Air-de-Roger>
References: <osstest-174809-mainreport@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <osstest-174809-mainreport@xen.org>
X-ClientProxiedBy: LO6P123CA0005.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CH0PR03MB6113:EE_
X-MS-Office365-Filtering-Correlation-Id: 65db40db-c2b2-46bc-2f0c-08dac972c419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yP/xs/fy1/h92qDF9vAQDP12KPpjFvtvkxghRVDLE8+F6aSmlenWoji2zMdqiawnov8duoh9PUD6zdIyb1AJJQ4Nlk18yJkFQZICIfKznhpwCI4+cPMjRgTOFMEoVzES2Qwx08JWoNw2jjwogftx6j0NhAq9DFvvgCQgVDJ4nxXC51UXOCno26BRCwef0TQkyD6Og6UoCb+slZEXU02iyICopBQwz3OpkY2CU1iy1mhN0SzUKxSBN9dkoapxmUu4nP67pHPpo9Z3BSMwUmjXT6+iKOEBzDbl3GGB1PRH7kNWr/GE4w6/HE+shKq9JTgCr0ZQuqcDP2GoBxMcrfOw9ef+D5dGVwkXL3VGlMbV353Ru6PbVH0f/pfonTRkXi9DV0ZknrwSRTTMx7iir4JiNGi5P6VRoZP62246X0UvyhKCOJUN+uodNVlmVODWHMkubHwFTMSfTJqTPQo7h7w0ggTVaxVOusthlhE1fsOQ4eF9IIevPf+lF/jz8UPv+Kzq6o/Wgyyw9d+8l+CWEOqCkHHY2qMXa2Gbe1UAKrYvZnldQ0nW+3TH7AkALzs32SLXiICFrdWGztRSrhXM/FDc9jyoX8Mu+Z7HLYAmwLFg+6ZkVpf5MUA93TPRQkKCq8YUNahvOAeOOhdsHHkdscrKCKnSjg+KFKeFn0lh9pBCI0w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(82960400001)(6512007)(26005)(316002)(8676002)(38100700002)(66556008)(4326008)(9686003)(86362001)(66946007)(66476007)(83380400001)(5660300002)(2906002)(41300700001)(85182001)(8936002)(186003)(478600001)(6486002)(966005)(33716001)(6506007)(6666004)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cENQT21oRFc1dzlWU2pXbEQ1V0NiZ1BUN2xJSkNhMUhuRUxJb3ZTOUdsdmda?=
 =?utf-8?B?dElPWjRTbmgzaFlTZU1sSXBMTThjTlpkYndsU3c4b0tmVnBMSnlBeVRZeTNh?=
 =?utf-8?B?bjNwREtGL0w4emY2RmlMdnd2WkZpK2x3NExNeVJBN0RkS2x2ampTRVJhSzZK?=
 =?utf-8?B?bFJmekc2eEtZb0ZGSVhndjQ3MlJLM0lvRTFQdllOZzV4ZXE4bFNBdXVXN1Nr?=
 =?utf-8?B?ODY0V3BsM0FKUWg0Tndnb3hESlZ2UW5BK21JZ1RQVHd6T3NPeFlBVHlkOTFC?=
 =?utf-8?B?STM5T3hncjRyQmhBaFJNSzN0L2tUdllGMXkwMjAwMnN1K2xETVNTd1lnVU1a?=
 =?utf-8?B?bEhKcldaVldGbktRNjZCVU5IL2ZEZFRHbnV0OHk2R1ExckwrK0NEemFEcllo?=
 =?utf-8?B?bExrU3hhbEhzaC9TK2xlWFlLb1JkYW1EMC9tZVFzN2VJbFBKSVpzZVVXS0to?=
 =?utf-8?B?S2M2Um1pTFlra0hEZThQVVQ2cy9SZUYzRmdCUUJvVXlTUXZ4WGtJK2s5V3dk?=
 =?utf-8?B?aWhXUkI4b1QxU3J1RzVjRmtHUE9KZWxpU2UzakVjTUJnV3cvcUtMdEpiNjA3?=
 =?utf-8?B?TWw2ZlpzbVlMbHp1OTlEUmdRN0Q1K1gzdEExa1Ywc2Z2aDd0Q0YwaHdZeVNo?=
 =?utf-8?B?MWNIdmJsdjZGNWlMTnpnMm9DV0J4RXpDcGpvTTBjL1ZvOHlORlNrSklxd0Y3?=
 =?utf-8?B?djc2Qko3N2ErY0Y2dXdRM1RLZGJyM1grUmtRSU5ydFdRcWpNWXgwN2lpREpW?=
 =?utf-8?B?QXRiUjhMWmQyaUtwZU5uNnljQ3p2L3gzQnBPREladWcyWTNVelZDbWtTcmZ0?=
 =?utf-8?B?WmxSblB5d1I3cFRaaldYSGxNT2xQUTRGQ1NHMlM1RjVvVDJwNUpQdk1LNmE2?=
 =?utf-8?B?ZHRhMUZyU0R5U1Nrem9VSjVPUU8yV3AwaWdHNTVlUC8xcS9CQ2FKOVo4L0hn?=
 =?utf-8?B?VXZid1JPTklmR1prd09vZEQ2SGN2SGFYbWl3Z3RjblFvdENxM0MrVkJ2ZENY?=
 =?utf-8?B?S1BHcS9Zc2xxODcvMVNPS3grUW5uVzhSeWJ6UVgxdTkzaTVjY21KbXRUUEwy?=
 =?utf-8?B?Smc3dEN5WFl0ZUt5VFVxWEtPcUhNaHdSNlZUVkRqb3NDU2prKzFrcUVaQ09W?=
 =?utf-8?B?Y210S3ZBRHQxTGUramtIWVkyVXhYcllvT0JhQ3lJd1BkZ1BiSXFyRFpjbGVk?=
 =?utf-8?B?ZUNGYjJ5SEV5eFVOS0JxWTErMUx5RXF4NS80T1lzTDZFVE1lZjNCVSt6eFU4?=
 =?utf-8?B?VXdFUUFXQ1hKQ2N4SWdzVVdBQnZ4REZmS2E5Tm5KejJQaWtMOXo4dkdWZWdl?=
 =?utf-8?B?NFplRmVUUG9RUG5CTjlJMmVQZlcxY3JqK2hVM0d3elo1M25ubE5tV0x4VXVI?=
 =?utf-8?B?eTlkOWJCbEQ0cnVjT2RZaFB2dUFPOE5aYkhDQzVhU2w0aVpsZ3NMRnVHUnpv?=
 =?utf-8?B?MzhGTWdOWFh6UGZtR09xOWRKS0Y5czlKQS9tSmZNdk1BUUxsdVpwREpJMk5N?=
 =?utf-8?B?dmxSb2NaK0VnbnlJeDRUWnF5aWZlQkRadVVLcmEycFRVaDAybVhUM2VZYno3?=
 =?utf-8?B?aUFFblRNK1FVSDJqbFMxZTIyVEJnMDg0UCtkeUk3R2Q1K01raE5BWXF0a21C?=
 =?utf-8?B?QklTaHplaitYaXMydVNDV2l1dHp3RkhOeGZTbHRkT3hQQU5YM1lxaEUxK2Rl?=
 =?utf-8?B?WHlPMmNQTVprem5ENE4xemp3M2RPMWZueTI3aXZzOWRueXptK3k4bS80Uktz?=
 =?utf-8?B?WmVKYUs3OTR5S3NnSmFnbjhYckhWK0F6YWhlRkVEeDIveEZHWW1VaUY4a3B0?=
 =?utf-8?B?RzBuZzE2WjRVWm4zZklzOFMzQmplcU1POWhoeXc5WGg4dzIxYmZLWDVkZWR0?=
 =?utf-8?B?VHhtWmZGbXA3UjR0WDVkVnJOVXJWMG00amxjN2c4TnV5Zk5kNlR2aUpFd0Jx?=
 =?utf-8?B?eFlSdHFZYThDOHhmZkI2OVFEZ2ZmTWZwYko1V0pna2pzR01MaXNBWThMQW83?=
 =?utf-8?B?YmtZQ1g2U3BlaVpMV3BzSDcrUEdkVDhUMlFTUlUzd0UrdmxzOTg0ckFsTmxL?=
 =?utf-8?B?eGRFWXJYTlVjNE9RdmdrbEZIdmtybTNPTkdUd1Y0ZWREMU16SmJJcmxuRDVw?=
 =?utf-8?Q?E83lrx8mNKeLmOn6UOk/k5Ub4?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PIUmeSdLuNFkSiP1FvkneBfF8kB7dMhvbABKNHOKr4324jOOZgH6p1gHMW3Jc7YrCkaSOEEDo+5wbdqWNasGcBawTwwNSMaD9NhK/UNsGMOQgfnKa+bDmY/Qu5AHibu9buV4bn8qXZu0lk+eosF6IzxCOj2S7wBEvTCZOnvjMuuTD9X/l67AeqKsYpMz89tUPsVBMdfQYa0lirLwKhaSaPJ5utgAz8ZywsFolkFB1j1xYNQKGVd93DCUyjNIoMPi2YoJBiJ9lSr8GvxOvGPu1LZX0G5PQVPSHX7bIj8J0X9S4d/9/MYSQqVBGWRsIJGyPCc0hY74uJ4NzU5MwEuPi9lBpbdIED3Em/k3pRsLlGefV8YRCMo7XGg1r5D3BJtGe1+lgfv7vczzN7W+e2Z4+Gn4a4E0L4yzbiBYGLxSdH1kprzBNtokKCkapUhzk17GBgb8Ak5WEfuF4JypkxUwpLajd5JLHC8e/GhJ12beeGXtzQIliwLnaTKQ2AfNhxqWV4NvQyBFklrGCzTNPaCm/l08EbN8h3XgTbBzeJjjH3xhuSa+osOEziXtzvRZ4wl7JnsnAW49OOGQFtTxC5q4X/MkYikfvV0roZVjxJUVYKLAO+FGCLyrWtYlgZQdLUVUjP5xE+0NWEVujpx9drttobThdHBj7IFJqpSDNIb1Yzfzvoxk3GDDICX5frsuSXi5VAla7Z2KMCG4JX8+BtNv8m64o45HhlX3mAi8VUcFR4IQ8UtkE6fvTw0Jj2XKNLGKyhSBi6Q0U9UdEm6OOB75KzBhWlpzFbXDrU2J2FAcYC4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65db40db-c2b2-46bc-2f0c-08dac972c419
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 14:39:58.7150
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHdaImq1Zb/X1HsVp4USBVN5tEkEPpBUGP8Eaz8pbQKnzZe5vqOMR0QOfoWaW6ou5nFVMhldVCIT+5H3Yp0amQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6113

On Fri, Nov 18, 2022 at 10:21:52AM +0000, osstest service owner wrote:
> flight 174809 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/174809/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict    <job status>   broken
>  test-amd64-amd64-xl-qemuu-dmrestrict-amd64-dmrestrict 5 host-install(5) broken REGR. vs. 174797
>  test-amd64-amd64-xl-credit2  20 guest-localmigrate/x10   fail REGR. vs. 174797
>  test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 15 guest-saverestore fail REGR. vs. 174797
>  test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 15 guest-saverestore fail REGR. vs. 174797
>  test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 174797
>  test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 174797
>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 174797
>  test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fail REGR. vs. 174797
>  test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-install fail REGR. vs. 174797
>  test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 15 guest-saverestore fail REGR. vs. 174797

Looking at a random failure:

Nov 18 01:55:09.233941 (d1) Searching bootorder for: HALT
Nov 18 01:55:11.681666 (d1) drive 0x000f5890: PCHS=16383/16/63 translation=lba LCHS=1024/255/63 s=20480000
Nov 18 01:55:11.693694 (d1) Space available for UMB: cb000-e9000, f52e0-f5820
Nov 18 01:55:11.693754 (d1) Returned 258048 bytes of ZoneHigh
Nov 18 01:55:11.705648 (d1) e820 map has 8 items:
Nov 18 01:55:11.705676 (d1)   0: 0000000000000000 - 000000000009fc00 = 1 RAM
Nov 18 01:55:11.705701 (d1)   1: 000000000009fc00 - 00000000000a0000 = 2 RESERVED
Nov 18 01:55:11.717716 (d1)   2: 00000000000f0000 - 0000000000100000 = 2 RESERVED
Nov 18 01:55:11.717768 (d1)   3: 0000000000100000 - 00000000effff000 = 1 RAM
Nov 18 01:55:11.729687 (d1)   4: 00000000effff000 - 00000000f0000000 = 2 RESERVED
Nov 18 01:55:11.729745 (d1)   5: 00000000fc000000 - 00000000fc00b000 = 4 NVS
Nov 18 01:55:11.741693 (d1)   6: 00000000fc00b000 - 0000000100000000 = 2 RESERVED
Nov 18 01:55:11.741752 (d1)   7: 0000000100000000 - 0000000148000000 = 1 RAM
Nov 18 01:55:11.753644 (d1) enter handle_19:
Nov 18 01:55:11.753721 (d1)   NULL
Nov 18 01:55:11.753796 (d1) Booting from DVD/CD...
Nov 18 01:55:11.753864 (d1) Booting from 0000:7c00
Nov 18 01:55:11.753936 (XEN) arch/x86/mm/hap/hap.c:304: d1 failed to allocate from HAP pool
Nov 18 01:55:18.633799 (XEN) Failed to shatter gfn 7ed37: -12
Nov 18 01:55:18.633866 (XEN) d1v0 EPT violation 0x19c (--x/rw-) gpa 0x0000007ed373a1 mfn 0x33ed37 type 0
Nov 18 01:55:18.645790 (XEN) d1v0 Walking EPT tables for GFN 7ed37:
Nov 18 01:55:18.645850 (XEN) d1v0  epte 9c0000047eba3107
Nov 18 01:55:18.645893 (XEN) d1v0  epte 9c000003000003f3
Nov 18 01:55:18.645935 (XEN) d1v0  --- GLA 0x7ed373a1
Nov 18 01:55:18.657783 (XEN) domain_crash called from arch/x86/hvm/vmx/vmx.c:3758
Nov 18 01:55:18.657844 (XEN) Domain 1 (vcpu#0) crashed on cpu#8:
Nov 18 01:55:18.669781 (XEN) ----[ Xen-4.17-rc  x86_64  debug=y  Not tainted ]----
Nov 18 01:55:18.669843 (XEN) CPU:    8
Nov 18 01:55:18.669884 (XEN) RIP:    0020:[<000000007ed373a1>]
Nov 18 01:55:18.681711 (XEN) RFLAGS: 0000000000010002   CONTEXT: hvm guest (d1v0)
Nov 18 01:55:18.681772 (XEN) rax: 000000007ed373a1   rbx: 000000007ed3726c   rcx: 0000000000000000
Nov 18 01:55:18.693713 (XEN) rdx: 000000007ed2e610   rsi: 0000000000008e38   rdi: 000000007ed37448
Nov 18 01:55:18.693775 (XEN) rbp: 0000000001b410a0   rsp: 0000000000320880   r8:  0000000000000000
Nov 18 01:55:18.705725 (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
Nov 18 01:55:18.717733 (XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
Nov 18 01:55:18.717794 (XEN) r15: 0000000000000000   cr0: 0000000000000011   cr4: 0000000000000000
Nov 18 01:55:18.729713 (XEN) cr3: 0000000000400000   cr2: 0000000000000000
Nov 18 01:55:18.729771 (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000002
Nov 18 01:55:18.741711 (XEN) ds: 0028   es: 0028   fs: 0000   gs: 0000   ss: 0028   cs: 0020

It seems to be related to the paging pool adding Andrew and Henry so
that he is aware.

Roger.

