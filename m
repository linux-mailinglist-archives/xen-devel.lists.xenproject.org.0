Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F097A5F8B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 12:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604568.942023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXzL-0001Fq-Vj; Tue, 19 Sep 2023 10:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604568.942023; Tue, 19 Sep 2023 10:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXzL-0001D8-SF; Tue, 19 Sep 2023 10:29:51 +0000
Received: by outflank-mailman (input) for mailman id 604568;
 Tue, 19 Sep 2023 10:29:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ezs9=FD=citrix.com=prvs=619432e5c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qiXzJ-0001Cg-U2
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 10:29:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 738c3aa8-56d7-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 12:29:47 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Sep 2023 06:29:44 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ2PR03MB7380.namprd03.prod.outlook.com (2603:10b6:a03:567::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Tue, 19 Sep
 2023 10:29:38 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 10:29:38 +0000
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
X-Inumbo-ID: 738c3aa8-56d7-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695119387;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=lxneTlTtDC2nBH0rCoXvwJi5HrU1MDdSg+R4NQ6E2aM=;
  b=OGC7uitDEbmD/axavfywhdZv+hVW0pHMpUunbr73GsfFdOalV4iooiuP
   1TiDWPun/ugMJcwUjcs803pJTxhwvy1wNYwe/hz+J/BG4GsiqDYVBJIGd
   b1N78hl7r86i9kaA0wNf7tSihMwtvaHLeAM+JbHZcr/7IVulzR31BRd2M
   4=;
X-CSE-ConnectionGUID: uw9gq3hISG2z4K5Bx/eWOA==
X-CSE-MsgGUID: kP+dmVRTQ3aJEFgR5JeYYQ==
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 122937800
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:66dtSq3hGCcyaMPRSPbD5fVwkn2cJEfYwER7XKvMYLTBsI5bp2MPy
 GBMXG+OP/3bNmSjLdkkPN/l9U1U7JPRn9YySVNkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8nuDgNyo4GlD5g1nNKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHH4f+
 uVDKBE2QUqR28Hr6qL8R9ZLr5F2RCXrFNt3VnBI6xj8VK9jbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvC6Kkl0ZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LWexnyrANp6+LuQ9cYpjFit/FAqUxQ0eHW0m6Sbh3+PYocKQ
 6AT0m90xUQoz2SpRNTgWxyzoFafowURHdFXFoUS9wWl2qfSpQGDCQAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxQ5eIgAQJG4GICMBEw0M5oC6pJlp10yeCNF+DKSyk9v5Xynqx
 CyHpzQ/gLNVitMX06K8/hbMhDfESoX1czPZLz7/BgqNhj6Vrqb8D2B0wTA3Ncp9Ebs=
IronPort-HdrOrdr: A9a23:53F2hK8UrbtFgRExoRZuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:OjBzfGOMlbdri+5DRTY2+1dPGuEeXSfPkFSNCV//BFlOYejA
X-Talos-MUID: =?us-ascii?q?9a23=3A8Qy1aw+iPFVM2IPSXCt+3i6Qf8RQoKirNnoxqM4?=
 =?us-ascii?q?PmeSqOhYtGTqsvQ3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,159,1688443200"; 
   d="scan'208";a="122937800"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgGCjcZ32GfDcgiO2AQkaD3ElR/Xtvl6/846H4w8Dm/QgelV6tRAisWUlWH4s1Qav+bupzi3Y91KAmUYI2rz0/TawYk9AHFVxhECdWVadKMLBJlawmoaK3MHiCC1GBN9yUMWJl3IOa3upiSsv79ys+qgvxOXJgK5C33tsBE1Lqx+ZLsatFLwPYe1ser8Ae5vhf4KaSEWl8kDwDtpoGuhsXQTSEwhotATKMJJ/cWEnee2xycFp1a3/UEn0Vb8BQvAL5I7BcbZk1lRasMshzfh2CovkT/Ack3XbRrjK7cVd5pprb+O8C1/1RWoRtbAjFxhSCdLzda7Ha/eN3sfuXFqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZtA3MxKhjLEND6BPIhUZ0t7Ora7aXByzy6UnHBCCL4=;
 b=KY9nEZV0yF5Bto6eQ3teycNjHe+lb4G39k9xqLIiCjZx9BnIzesO8B5yT5rC9SvGRXPu2vgfSg7e0yzDAWpRa4N6t8Vh6irjxGILnNV5EE9UZWhiyKNRLUmmYKTbK0wU/hHgB375qDERSfSuhpjl3nzLp4xQ7UOSEb0oT+wjVf40YS6oVj9Vpikk+XMSKfa7mxF6K8FqQKc3eC3uyICeWuHXw8L7lDtP7rB2n8JqsUaU6p03VBW87q/uD9KjQjN7K/ZfkFve97U20okyK4NTOr4QHHNcWP+6+ybtegoMcchzF5dpNckpkqlECd5lDHFRF6oonK1cpkGywYh9C1aLlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZtA3MxKhjLEND6BPIhUZ0t7Ora7aXByzy6UnHBCCL4=;
 b=NQ4E9B+Y2bZEb64beiojhg7qAPKPwtzNLAQRhb9LIADzREg3ZsRq9NwZ5mMasTK2oXze9fXuru9ybyBXQ7YvP3koQr80t1XvNzSIo9RQBY0xWrykyJje/KjXkvD+My0DOcevEkRypt/M4SqShQH1896TJd95G340wNfkgd7AnHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 19 Sep 2023 12:29:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Message-ID: <ZQl4DKfDuDIyK8Fi@MacBookPdeRoger>
References: <20230915074347.94712-1-roger.pau@citrix.com>
 <e22af903-cbdf-dfed-8f69-44e5ea05ef8b@suse.com>
 <ZQhoHZvk7tXfGI2g@MacBookPdeRoger>
 <b92b994c-a9cd-10c3-033b-3c1aa752fa8e@suse.com>
 <ZQh0KXX2yLewO3uV@MacBookPdeRoger>
 <2d1e6916-b501-e133-1463-fc55e3eaf2c6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d1e6916-b501-e133-1463-fc55e3eaf2c6@suse.com>
X-ClientProxiedBy: LO4P302CA0032.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::13) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ2PR03MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 1668ebc9-e00a-48e8-d035-08dbb8fb536b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LV1Acn6mTkOuMIW5i7dGXAtn+P3Uw+zhfbEqLbO32fwJBIyY5JZ7CL0J9LNtY1ljeQCOsRK4EgotaIZoi4eIpvSaoHGHAVyOgctFNHf/A94NwWUJ63mMVa1QqFKAcdCWzXgaBsYMSWkXCKFiBLzK3LQERm6ttsLu9SAJjThZzVuWEH0uD7oS+Zli9wWDRMwjoZzJ6+Ae8gEjBsZRfbDrcTyfZVaTe5gIISczQdORJ/8KU5fmtFCXMHII8AIopvFht0TqPwj43NK0KRj2dyxNFigQDUADCbgtWSSdlX+R76PrCzx/SqcRHmVTOcB1bcJtaFScZ5vN7dnTZRGaU69T+9x0x6gLX3eedYSWCGihiVqWCrwxJ/KZBrJEoFh0NlrmXrWNnyTNSQXcqe5zM3ZeidJOwHhbWBVE3qGuZPkPGokEiyi4Jd25aX7ORObZ/yZAMvUClB8oIIaVIis3pMZQgQvTevPzd60ar0TVUXlHBq0DFwv5pYLEySmkLU5Y5hVp3c9Jb1ozHr0xbkkgkSR3nOLlMhfpJXLiVC2gGgyI0dXqLx6FtPex66eiNl8gepXW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199024)(186009)(1800799009)(6512007)(9686003)(54906003)(66476007)(66946007)(66556008)(316002)(6916009)(6506007)(6486002)(41300700001)(6666004)(8936002)(33716001)(4326008)(8676002)(5660300002)(53546011)(86362001)(478600001)(26005)(83380400001)(85182001)(82960400001)(38100700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NSttM0xWb3ZCR0ZJdGd1SnNNOFJrejZraWJ6SStmRDVzSEFrbFFJNXhCdEFM?=
 =?utf-8?B?UTZ1MXBacWpwaXJBenZxWmEyQnBlRE1kSHd2Wit6ekRCamsyYUl5YldYZzFo?=
 =?utf-8?B?WnRxY3NGZVhJQXdIQ2lRcDRFek4xTXNHLzEydkt3S0tPNUp2WUdYbWthK2pW?=
 =?utf-8?B?UVV6M3JUdTB1ZlQrcWFhbC9EaVhJTmw2NXhwZDJOQTRIRmgvYktGYkJrM3B6?=
 =?utf-8?B?YmtubnlBbVFleXRHQWphUk1HSEtNYnNvTWNUUUZMWGJtOEpLcHVOaU1DWkt4?=
 =?utf-8?B?WHIwWXV3UmhScU53U1NLSnBETkRhN2FaMEhBMHNuajA0bURoekJ3SjVvM0ZC?=
 =?utf-8?B?eDVlQXlwYlBORzc0cnNpaGQrOEtwVkpJcDlzVkptM1lZUEVPdXNZcktWdWdQ?=
 =?utf-8?B?M2p1Q2FDdjNId080ajlUMHErYzhvNzV0cTUwRDRmWjNiYlFYSUN5Nm1YT1FS?=
 =?utf-8?B?UEplTzJQaVdhcU5qVmZlOWQ4YnRUOVFBazdXVmNWTVZ2LzNVLzNoZmFud3pN?=
 =?utf-8?B?VEZCZlgwTmpBcmhSaTNyWjh6VXhtald3RUJVUEF4VmxFNWhNMndDaDVxWFFt?=
 =?utf-8?B?bjlsbmxSVGZGcFZhMUtZd0M1WW1sZzdRcHo4ZXZncDRoZjI2cjBjTVNXdkFQ?=
 =?utf-8?B?bWk1d0xZMzVlUlFvbEtFbS9RWUh3YWNqNStDc1Rpa0gwZ3JobktDVXB3ZXR5?=
 =?utf-8?B?SUV4aERIMTlBNmh5TlJjVDhHQ1RxM1V0NVU0UnZjWndiLzVWUUZFOGZKeHMz?=
 =?utf-8?B?a2FzMGMwcmJxU3diUnVOcDVjR2dXc2pyaXNYQys5M01idEZGK3N1QmdlTEFH?=
 =?utf-8?B?L2lHOVVYSWgrRTczbEx3blhZUDNuK3AvWTd4VzNBa3MrZGh0Q3Z1RDkrajNa?=
 =?utf-8?B?OFIveCtqK2d5dG90RkVjWHR0ejFJRHZ1MU5BT0VEMUZ1TFRyZUI1SVRvN0NB?=
 =?utf-8?B?NGxWRDhqcGdPOUpPdzFxU09VaWhYK3dSOXc4UHkzZUdwVU1Dcjhmd2RydHVQ?=
 =?utf-8?B?cHVnVVB4QUN0anRYSFZjQWNqRDYzUy9NNVozZ0xoV2Q5eUpkL2N0V0tUL21G?=
 =?utf-8?B?MVdTN2JnL2VGakRyT21mUEpZRHAyYjJhaEZnZXFsbnFxMXJtdi9ObTVjT2NH?=
 =?utf-8?B?TVdsZ2pqWUI1STJ6UjU2eGJlWkQ0Y0VDdFREVEhSQzZpeVhNaXBlRDJxaGFB?=
 =?utf-8?B?cU9QUTNMaTY5RjJweUZJOTFYckdLYldPQTdzWGdyQlY1eVgxYXZPbWNjd01E?=
 =?utf-8?B?eWlkUHNOU3c2YVNVdW5lQmFUT1QxQVVuNjRqUFgwSVB5THJ2RkdJZVdlcUxk?=
 =?utf-8?B?eXZsVTJIWCtwQ3U5dHMxK3E5d2laS2NHV0RjK0tFMWh2LytxMU9FN2NyT3Vs?=
 =?utf-8?B?cFJUM3FVNWNTeGEvb2JuMFFaZEQ2ZnYyTkYrN1VWUkpibmZCZjhYMDY2ODdJ?=
 =?utf-8?B?dGoveEdXcFdlMDhyajhmR3hEanViOWVqeXpCY1Q3WFQ3ejlHQ0tvQWQ3bGk0?=
 =?utf-8?B?V04wUVJzMmxmSm5INWNFcmFZZTAxOWhHcC80RzlxajV5NmRnb3czUVhvTUNL?=
 =?utf-8?B?a3dFa25XVnhGa0lKK1E4TW5RUnpBWUwxNFcwUElPT3lkSVQ1MUttTnNHWUhU?=
 =?utf-8?B?OHV0WlphaGU4d0FlN3JZOU8vZ0ZpMlVSRHh6MHF3bEtVb0pVeFdyOWs4YkxP?=
 =?utf-8?B?WjEzMHV6aDlOTld6emVYV2NlTnhWV28rcEJrdUJPbm9VNXlwSVg2eWxqangv?=
 =?utf-8?B?cUt4YTdEZHBNZFZmQlBONGw0UmdvVzBRa2RmUUVLaHVsWDNHazlNZGM5MXpI?=
 =?utf-8?B?V3Zic0x3Y2lKY2s4SndhOUdTMlZTVnhiR3k5MTQ2SnZ1TG1XS3YwcFVOTFlK?=
 =?utf-8?B?OTFuTW54aDRaTm14bXkxSFpQb2RyVGxXazJkWmd1Yy9yY0xwdFpYSlFXdXNh?=
 =?utf-8?B?emxXblNBRHdxeVZBdjhxTTRVL2Y3QzQvR0l0NnZxamc4TnNWNk9RK0lMN0dB?=
 =?utf-8?B?OGdEeG1RenhVcVlmWXBPZ3BzRWowOWJKcWdhb3h0cndiQ0V0WHpmVlpmQmtk?=
 =?utf-8?B?K2g3bWpSTXhLN1VBUlJsendCVlZ6SXgrQkVETFVweDJtbklVNERJdmpmeGk5?=
 =?utf-8?Q?Ln0/YVSi9fCTCFvc5sDgDKzr+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p6JgvlSl+2890W12w+qiPVj4Rr474G0fFxS+Xm8VjDTwq/DE7RChsn3Efsn5VLc3iY/MYYoAG+7TjWhlae4EWW5kXRLZUlGl/n11pwwHhP6x8VkM+LVQC9Yj+iHg7q2e6WIHj+N1EHMrBU9YzwTn0wCgBHY0/WvfFZnT3Oo58Av+it5pZAXg2JdWQJjm3Iz+n2W8lFlcSJHipaKor97/3Sv6sd0gKLwUhL0eUgAMQDMHxogjqnJ04Q59HpqnjUCZdFazL/SpW6fwtXlyFYWZEuHQCoUexfQKEMXdCXiDEG4jiZsXLId1AqVLm0LyihGD0BcQwRZbh+gOFihb0jsRPLnmwo8PdOJIp20m0D8z6qfCYM1HpFRt4xHVfCInifptfZv5Fg3sgl6Dc007Wt0xG1d34raHofG6Bwm9w7vDyBHI7atWv78Ad7jAkv/k/1U15vNIxabjoKJCWpGmTGwg3HzeIkeKUVGcBBcK8LvKHOt/9y0zVC4vN6i4Fz9yFI7d1lRr0LDC1fT1FANNEmsKonkc2Ocbh/cHYoP/BV+LMX0bdpUNsIEscFINIWBfI+JXbDfN/dmyycRNjuWUP7Au83JAPv1bLXg1GWPJj+SKQly2jPY/C57zpzewjtUKFbmWL0VNevTtl1I9+WGXyQO07/bu+WwO65iD7AhS0lw0DY+cvLNjOJwN4p8SxsP7mB4/ssHSBt2Un5PjdEncLUq2K1NtfOBYj2eFHF8TJrTnGPQ3hv+94LWk1ohnuvA2S1AxeCJH8W4QaQUvcSBTRUZtDSDAMUUTNfitsUhHy+6P2LAA6aV9Wx5UIJ0qAlgCr0hooTmmIRS2zn1icQCdT3V2+w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1668ebc9-e00a-48e8-d035-08dbb8fb536b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 10:29:38.0789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D55cFkaaEOGFkBmVkSQX3ncdzA7/aCZNmZhtFHxY9JwtFXShNBQZeS4aw7/wZKBkp+NwCyAfO2TTpQ++hfIavQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7380

On Tue, Sep 19, 2023 at 11:31:07AM +0200, Jan Beulich wrote:
> On 18.09.2023 18:00, Roger Pau Monné wrote:
> > On Mon, Sep 18, 2023 at 05:44:47PM +0200, Jan Beulich wrote:
> >> On 18.09.2023 17:09, Roger Pau Monné wrote:
> >>> On Mon, Sep 18, 2023 at 02:26:51PM +0200, Jan Beulich wrote:
> >>>> On 15.09.2023 09:43, Roger Pau Monne wrote:
> >>>>> The current logic to chose the preferred reboot method is based on the mode Xen
> >>>>> has been booted into, so if the box is booted from UEFI, the preferred reboot
> >>>>> method will be to use the ResetSystem() run time service call.
> >>>>>
> >>>>> However, that method seems to be widely untested, and quite often leads to a
> >>>>> result similar to:
> >>>>>
> >>>>> Hardware Dom0 shutdown: rebooting machine
> >>>>> ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> >>>>> CPU:    0
> >>>>> RIP:    e008:[<0000000000000017>] 0000000000000017
> >>>>> RFLAGS: 0000000000010202   CONTEXT: hypervisor
> >>>>> [...]
> >>>>> Xen call trace:
> >>>>>    [<0000000000000017>] R 0000000000000017
> >>>>>    [<ffff83207eff7b50>] S ffff83207eff7b50
> >>>>>    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
> >>>>>    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
> >>>>>    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
> >>>>>    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
> >>>>>    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
> >>>>>    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
> >>>>>    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
> >>>>>    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
> >>>>>    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
> >>>>>
> >>>>> ****************************************
> >>>>> Panic on CPU 0:
> >>>>> FATAL TRAP: vector = 6 (invalid opcode)
> >>>>> ****************************************
> >>>>>
> >>>>> Which in most cases does lead to a reboot, however that's unreliable.
> >>>>>
> >>>>> Change the default reboot preference to prefer ACPI over UEFI if available and
> >>>>> not in reduced hardware mode.
> >>>>>
> >>>>> This is in line to what Linux does, so it's unlikely to cause issues on current
> >>>>> and future hardware, since there's a much higher chance of vendors testing
> >>>>> hardware with Linux rather than Xen.
> >>>>
> >>>> I certainly appreciate this as a goal. However, ...
> >>>>
> >>>>> Add a special case for one Acer model that does require being rebooted using
> >>>>> ResetSystem().  See Linux commit 0082517fa4bce for rationale.
> >>>>
> >>>> ... this is precisely what I'd like to avoid: Needing workarounds on spec-
> >>>> conforming systems.
> >>>
> >>> I wouldn't call that platform spec-conforming when ACPI reboot doesn't
> >>> work reliably on it either.  I haven't been able to find a wording on
> >>> the UEFI specification that mandates using ResetSystem() in order to
> >>> reset the platform.  I've only found this wording:
> >>>
> >>> "... then the UEFI OS Loader has taken control of the platform, and
> >>> EFI will not regain control of the system until the platform is reset.
> >>> One method of resetting the platform is through the EFI Runtime
> >>> Service ResetSystem()."
> >>>
> >>> And this reads to me as a mere indication that one option is to use
> >>> ResetSystem(), but that there are likely other platform specific reset
> >>> methods that are suitable to be used for OSes and still be compliant
> >>> with the UEFI spec.
> >>
> >> See my reference to ia64.
> > 
> > Right, I understand that on ia64 things might have been different, due
> > to the platform lacking any other reboot method, but I don't see how
> > this applies to x86 where there are other reboot methods.
> > 
> >> With ACPI_FADT_RESET_REGISTER not set, I don't
> >> think there would have been any other non-custom reboot method there. So
> >> while perhaps not mandated, it's still the designated abstraction layer.
> > 
> > Again the spec doesn't mention that ResetSystem() must be used, so
> > while it would make sense if it was reliable, it clearly isn't.  In
> > which case resorting to the more reliable method should always be
> > preferred, specially if the spec is so lax as to call ResetSystem()
> > "One method of resetting the platform".
> 
> That wording wasn't there in 1.02, but I can see it all the way back to
> at least 2.1. So yes, you have a point. Yet - adding onto an earlier
> remark of mine - EFI_RESET_NOTIFICATION_PROTOCOL is pretty useless if
> use of ResetSystem() was optional.

See the note in
EFI_RESET_NOTIFICATION_PROTOCOL.RegisterResetNotify():

"The list of registered reset notification functions are processed if
ResetSystem() is called before ExitBootServices(). The list of
registered reset notification functions is ignored if ResetSystem() is
called after ExitBootServices()."

Those handlers are only called before ExitBootServices(), so for our
use-case it doesn't make a difference, as we call ResetSystem() after
having exited boot services.

Thanks, Roger.

