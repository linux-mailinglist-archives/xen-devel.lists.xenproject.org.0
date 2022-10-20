Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A87605C42
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 12:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426408.674810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSlk-0003DR-Au; Thu, 20 Oct 2022 10:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426408.674810; Thu, 20 Oct 2022 10:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olSlk-0003B8-8C; Thu, 20 Oct 2022 10:27:20 +0000
Received: by outflank-mailman (input) for mailman id 426408;
 Thu, 20 Oct 2022 10:27:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2NEB=2V=citrix.com=prvs=285423218=roger.pau@srs-se1.protection.inumbo.net>)
 id 1olSli-0003B2-Vh
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 10:27:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c484fff5-5061-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 12:27:17 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Oct 2022 06:27:15 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB5078.namprd03.prod.outlook.com (2603:10b6:a03:1e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Thu, 20 Oct
 2022 10:27:12 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 10:27:12 +0000
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
X-Inumbo-ID: c484fff5-5061-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666261638;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ngX+WlzQoqklnKAvqzDrlMCRtPo9t49icdQ+7W3G+5E=;
  b=QSbZ1EqMJ4zyC+DTcbkHYbp2F3MaZv+934QqcnEV8oGYR18Zt9zGQBn0
   PRs/uvmtHD14Z7uWL8zF5RyKWwiKv9051RNIyly1P9UUtzoil7t/ozAIc
   a5RNu8ir7bei5/sX492f4hXErPOkHL2iuz2DcbziAsa+Js+Fw7RpE1klY
   c=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 83568273
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Hc8B76KTaDtpfxEJFE+Ry5QlxSXFcZb7ZxGr2PjKsXjdYENShTdRm
 DNOXGzQaaqINmv8fdh3bIq0/B5TupHSzdc2SQFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4mtA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FZxC3/YqM2ZQz
 MABNQpUblPdgbuX/ovuH4GAhux7RCXqFKU2nyg4iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QLT/PJri4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWHYrCL22bSncSXTW4cVTbOg69JRpHrK7VwPLTMyRWWCrqzs4qK5c5cFQ
 6AOwQI+oK53+EG1Q93VWxyjvGXCrhMaQ8BXEeAx9EeK0KW8yyaUAHIVCAFIbtMOvdUzAzct0
 zehgNfBFTFp9rqPRhqgGqy8qDqzPW0ZKDEEbCpdFQ8duYC7/Mc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:JQSvDq5EWkzSTb1tZQPXwSeBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfjqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCeCmMeV+bOitXXnNa+CCR2cSIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwlv31nPV7b5RhNz9o+Ezc/Cku4wwEHHBmwyobINuV/mruy00mvim7BIQnN
 zFs34bTrdOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvGrf2UIUh4bD3wXklX6vpREnBmc4a+a
 hVfYnhDc9tAB6nhyuzhBgv/DSuNk5DbituDHJy+vB96AIm4kyR/3FouPD3oU1wi67VM6M0gd
 gsEp4Y5o2mHfVmGJ5VNaMmffadLFDrbFblDF+ySG6XZZ3vfUi94qLK3A==
X-IronPort-AV: E=Sophos;i="5.95,198,1661832000"; 
   d="scan'208";a="83568273"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cb9dUykbq1zEga09pOcWbIlvfU5K3rb+61WlYOvT3SYMtw8DGqPAErkOKgtJdS/9MZlgch7MDhJu3okF548vxBrAJS7ZshQXL0SFVwRmqy3ssvOVZwa3+gkDJBLy2dWvY0LCQECdxDejpOv//2btkBdk9/lU09FJzY+4g+Hx6rqF3g5p710EqelX3T8p6Ocpbw9QvIcrrNTKSUTHOQhryJYNmmo3rR7OJlpHGJAaf8ME1TP3+NGoD08I9X9BEu03vOddYmkCryVc9La3Hs1bNJomta+uatMTPGS7WSyE+uFES1dDefwlhJJfGk8MJx3FwAjcSF0a831DZijb7RqiTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/I+FaKURwIjbND5Ow6oLQIFmGi3KR2FA236qcyuO0qQ=;
 b=KAE/fPOKhbxySDdNgK3wLS5EMlnC329MVlW7SQufd68w2CgG84eUQbM9QFEVJfj6A8lL2MIYO5sOBaa3g5EH2CMeHFmkkRoNHeFl02MDtREkov+79CUtyo1UAjDfZaNRAg0KbCS8NuJZnkN+4IruwBe7HTczmHbQAhLKoN/lflQ5eLEKgTC8zl/nrOy7Aqb5KvGdEZg/qH2yEBCsyGDcM15TL9Fqm4yrjYaDb9CFma+i4TAFc0s5X+ZtFhy6WolnMle1KmDQMb6Ug10vdfiuDy8peemU7/ndYHVQzRc38FQbrsSgUcz7AsIhbp4G1hHg70WVCZhvtKLrIKsXKlSEFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I+FaKURwIjbND5Ow6oLQIFmGi3KR2FA236qcyuO0qQ=;
 b=hw4jq+0KK++eCsN6ARg6H6gKLk3oNZc0CuptgoZZJXQV2xEMFE+tYsJ/keLEaNkYqtOiGgKzr9mz35ETZ+gtaGqbGiDLx9fJJHxa4dNJMooat+Vgtcx85YTdeJ5ecfhE4bKBadvHktTVzvv/NjupVOAUz2L/0YfQUdJE30SQinE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: [PATCH for-4.17?] test/vpci: enable by default
Date: Thu, 20 Oct 2022 12:27:06 +0200
Message-Id: <20221020102706.29267-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: d138c819-0698-4e77-bbec-08dab285a6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fnViuGgJDxCb0CY3BzT3gH2nVY09B+sNodePrLBPDkDVF2suOU1N/zWSnCOeOev8CMOH8iMPCsB772Ye6TiGkVH/I5iHh1HoCYmehfErpLUUPSf30txpqImAsc1a8DrLz581mk5f20yhm1tOlc/LxE8K/KBVvO5bxKL2Vxs3XIU4bKq1O1Eo3GwNXzniCKHhfkTgGha4TGBIqGnZS0dnH+Fs3AEC8ief06AWQ7hAr7/Zoom64+Bvsgi/Dj/t/zIxpRcUaaTi03Cb0GU6q/lqpa47rT6O8czGqTDAse1JDYBRZvA2G9hrniBgHCtZg8ECJ9zYFi9/i5BOzMs8I48PEsA+y1/norA++dgksZ/WuUX2NPrSJN1CixevsfzaoaUcuNXV1wzFBv7I2s735p8Z5KY0sIJMCyu6Pp+rv/15SZj9cP8ylmKlHE9Sx4LpqbE0BHUhi4LW0H/5KOLv4i7Vk/ICI8SRbGK3CODMQU8OdG4WxODbrV3q7CQcqOxzdXNBbY7hmGvvdHvH6JJH1vW8P515GlDT7Pe/RgKv8tHSYdBdBHCshcFAHbwpL9BSY6aVwUfyz45iorXJYwqzKksYW4nB9Pr7B4FMbFGzgN1hHe2H0r6O39wc1ExpTMAbmkRFD8JQi29uCJR2iYiUH+3WKubEmsIYKwtQahbXHt6KGdiNQKfbzoIzNT3mqu8UIQ6ShpUGU9f600DErt8kVZCr3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199015)(66556008)(2906002)(4744005)(5660300002)(66476007)(8676002)(66946007)(54906003)(4326008)(41300700001)(6486002)(36756003)(6666004)(107886003)(478600001)(38100700002)(6506007)(8936002)(1076003)(26005)(6512007)(83380400001)(6916009)(2616005)(316002)(82960400001)(86362001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3NBZkg2ZTNNelhESFQyY21rUU1SdUNPMXlFeFllU2M5NkFuVTJ2Nlh5L3U5?=
 =?utf-8?B?REFpWWJvVThSdUgxVXJqN0oxL1FvNFJJbE1YdFpOKzBxMFl1VkNFOTN0ZkpG?=
 =?utf-8?B?VmtFZjR4SUlFb0VoWVVWSUZWTDdaUDRRU05kNFBIVzRWWWRsUFZVSVhNNlVE?=
 =?utf-8?B?MmQzVG1qdE8vY3h5N2M5ZklJMXJFek5NNEZGTFpWelRWRitHZndhNkw3YTkz?=
 =?utf-8?B?UGpoaHB3dVYvYk5MUGovUEtyeDRjektGNVdmcy83NjVyR0hUN29pbzg2bUdh?=
 =?utf-8?B?OUFPOEZwbHNlaDhOK0JmQ0FKUVVRS2VidnlZZ21XS1hORDJxbllUR3M3bWQ1?=
 =?utf-8?B?ODZRR2VGb2gweURLOVEwUTZRaVpPaGhtZjhRekdCdGNaaDV4U3l6a08zbE41?=
 =?utf-8?B?eENqQUxIcGM4SGxqLzdITm9mQVNIbzUvVVpvNHY5dmZjdE9iTVlDUHMyWlZo?=
 =?utf-8?B?LzV5Q3gwOHlvb3ZzTlRQeE52UnRxMEprU2VYR0tpRkgvYlMreHdXRW9hTm5C?=
 =?utf-8?B?WnVsMTlReWIwZVdqeHRTZkdYTXBneTlNamhQRnQ2aGdEQUtHQndGNFN4ZUZL?=
 =?utf-8?B?T1ppK1JtT2NNV0dnam9zeGMyRWVudFdDdXFrTDVTRHJRRGhmMU4zczFiczFE?=
 =?utf-8?B?K2FxQjRMOEUxWWgxUzBQazFEMWFyYUNsdWc3Ti9hNjdOSkRGZ2ZLaWtNdklV?=
 =?utf-8?B?ckR4MXpOLzA1ZlRzVXFuY2VvRm5Mc3JFRmZBSDl6TjRGM3BDbEpIb2srRVlr?=
 =?utf-8?B?MTY5dHVXSDdwRnhxem5iU05JdmhQV1ZMY3YzTFJieE9Ua1ZGdFIyQWM5SklE?=
 =?utf-8?B?azNPeUs1alY0Y3J0cXd6VmczNG1GOUZodHdIVzVKcVFTTU1ldFFTZFVzRnRJ?=
 =?utf-8?B?Smo3UWFRN2wxNlVDdkREelhHUHczeUFSZGRKd2xKOFBWcEprajlWS3RYMFBs?=
 =?utf-8?B?MmNlK05qbU93SVh5L0xLK1VCYTQ3ODkwczExejJlQmwzRjF1YllxMVBFa0ZV?=
 =?utf-8?B?MDQ0R0hQWEhtK3YwcCs4TnFtZW1kNkVzMXNkRURiZWJLcE1nejhIZWpjTVRV?=
 =?utf-8?B?dThEMmxkNnJwbXBuRGhjeTc5K09ZMGNkRVVNWjU0SGZjUEVVaGozR3l6dG1E?=
 =?utf-8?B?RTMyK2xCd29VRWdWeGRXelVWdW13WWJnajNPamZka2JwZ0RXMXNQanVObXNm?=
 =?utf-8?B?TEU1M1F0WE1Sa280Vll2RkVyMjdQMmhPZkdOMDd0THU4Y1VMSTMvYWlKalA5?=
 =?utf-8?B?VzFxTG5JWUsxODZuNm1wSDZ4bDllbUR5VmQ0dWo0TUJYYytIMmMxMVdyNms2?=
 =?utf-8?B?eFpxU01YSWVKRHY0WUJFang2VCthK0VZVlVad2ZBSnYySEtDcXJBdG5uK2Fo?=
 =?utf-8?B?OFFhdHJQUXFUYVdvOVVhT0p0T0R3blh6UEdKc3JjQkxYUWFqeTI5T2xVcVdB?=
 =?utf-8?B?TTV5MUFMeEg1VUM1NDhrbkpySXQrR0FEWnU2RjVyWmtPS3lXbEI3b1gxNW5w?=
 =?utf-8?B?TVQzTzc3eUtSK29URE1ZYkRyelBBWFJjUlMvSmhsYmphUGVwQ2drdW1OTmFv?=
 =?utf-8?B?d0lGRkV6ZjBGcHNldVg2cnVRQjUxWmYwN2dhVGRVanFzTXBPSXc4MFNqdW5D?=
 =?utf-8?B?YWxFei9uYVBqdTdBUzJGSFJBOE9QRVBOZ3NVbFg1dkV6UVJjWFdvUWprcmla?=
 =?utf-8?B?L3hJNEJDOGNkcXA5UG1zZUs3ak1DOVZJaGdtQ3h0NVAxZFVOREJvZDd3Zkla?=
 =?utf-8?B?RzNnbFh5N0ZoRmcxSEd6b1dzVGpJeDJrYzBtVzY2ejhUbUFOTWFQU3Q5Yzhk?=
 =?utf-8?B?aE5ZZTBBTzVUdTdpWU5BQy9LMFp4QW9aWEJqS0gwU3p1V0U3ZHlrS0FqOEZz?=
 =?utf-8?B?N1NwYTcwU1FBeVR2MVFJL2Jsc0U2WnlxdXR1b29XTVNlMzVGQWlPZnRSamJQ?=
 =?utf-8?B?NjNTWnRkWDFNVCtCWEV3L0twSXE1VU5LUS8yZU5rRWhndWxwMlpGYkwrMnVt?=
 =?utf-8?B?dk9XdmY1dlE2QjRVcmpVZEluZ1dOMmZLNjhuVW51NTgwMVF0STY1VldFRlJD?=
 =?utf-8?B?dGJ1bUdZaE5IbGpyVWFwVnlNOHlDSzVkc3pWUmRFajBZNUZiNUNOOVZGaHZl?=
 =?utf-8?Q?BMBb3bTnnA/tKElJV1z8ymyzB?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d138c819-0698-4e77-bbec-08dab285a6b3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 10:27:12.4787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWK8kMtuUmmJVockn9LpQ3s1oo7u3LrYtxWof2J+Q6+EPxNs0syAY4tlPGG9SsnlQTtsilZtlJP4L5ekRCOf1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5078

CONFIG_HAS_PCI is not defined for the tools build, and as a result the
vpci harness would never get build.  Fix this by building it
unconditionally, there's nothing arch specific in it.

Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
While not strictly a bugfix, I think it's worth adding this change to the
release in order to always build the vpci test hardness and prevent it
from bitrotting.
---
 tools/tests/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/tests/Makefile b/tools/tests/Makefile
index 33e32730c4..d99146d56a 100644
--- a/tools/tests/Makefile
+++ b/tools/tests/Makefile
@@ -10,7 +10,7 @@ SUBDIRS-$(CONFIG_X86) += x86_emulator
 endif
 SUBDIRS-y += xenstore
 SUBDIRS-y += depriv
-SUBDIRS-$(CONFIG_HAS_PCI) += vpci
+SUBDIRS-y += vpci
 
 .PHONY: all clean install distclean uninstall
 all clean distclean install uninstall: %: subdirs-%
-- 
2.37.3


