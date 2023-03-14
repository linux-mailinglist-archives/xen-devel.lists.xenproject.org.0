Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6CC6B984F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:51:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509695.785960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5zR-0004NF-GK; Tue, 14 Mar 2023 14:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509695.785960; Tue, 14 Mar 2023 14:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5zR-0004Kx-DP; Tue, 14 Mar 2023 14:51:01 +0000
Received: by outflank-mailman (input) for mailman id 509695;
 Tue, 14 Mar 2023 14:50:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc5zP-0004Kr-Sy
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:50:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0a49691-c277-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:50:58 +0100 (CET)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Mar 2023 10:50:55 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4917.namprd03.prod.outlook.com (2603:10b6:a03:1e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 14:50:54 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 14:50:53 +0000
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
X-Inumbo-ID: a0a49691-c277-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678805458;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Xxy0B6cvLpQjm5oLq3ERIO9jDUOkAob30orVdJquZVc=;
  b=ZbEWTMO326r8prFuq8TZhluuGTl3M+/YhXl1UPkSm37BhjtFbOSJZO7u
   wUCGinf5QzgFMsp63rwmiEmzOmEef1ySpOdpAqHtfTEPMbu+Wis4ziyqY
   QUXOTckvK9RmRYHN+GCxOWd79gGwYHDZ4U4qfrcoVI4q93FCfAyIh2tP4
   4=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 100798733
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LMdfxanv/gVE6al9BAArXmbo5gyyJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWXTyCOveNN2SkctFyYIiy8xkPupOGy4VmQARvqHg2EyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5QOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cIzJAEcVyu9vu7137fmVutBgts6MuC+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03iee2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOXnp6412wb7Kmo7ChQmewPl/euDmkORZtRCK
 lIKvTgzov1nnKCsZpynN/Gim1aUsxhZV9dOHukS7ACW1rGS8wufHnIDTDNKdJohrsBebSMu/
 k+EmZXuHzMHmLicU3eU7LqXhTK0JykOLGUGaDMETA0K+N3qqsc4iRenczp4OKu8j9mwFTSux
 TmP9XI6n+9K0pVN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLpm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:NFp1uaBXYuGmPXPlHel+55DYdb4zR+YMi2TDtnoBMyC9F/byqy
 nAppomPHPP5Qr5G0tBpTn4AtjnfZqEz+8N3WBzB9aftWvdyRCVxehZhOOJ/9SKIULDH4BmuZ
 uIPJIOa+HYPBxWgcP7/wWiA78bsby6GMfBv5an857Bd3APV0gl1XYfNi+LVkl7XhNPC5YaGI
 r03Lskmwad
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100798733"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmseAkAPUKBvEdvvNqbnE0jv2pIlOWHWCH+XgyL9r0fSyzrOmGCSj9eyx9HiZKIm7EnvsECuOMvsXEfTXFS59zzm0hKhuJ2U0eH/4JzleTB2vbv38UZ5Cn/MRhdwfK0LjtDeqaBDRbhyxQvS/PRpiydBg51GWw1ss6hc6ej9F7PG4cGWxprDoJVKVL+9V3/tEWDnakfODwHiGMtWOIc7g4Vl5BkE+CTnqEtj1I4geSHQ0endLRKQmtpgZpiwjmiFykTlPsqQitKy6dOuCRx7ifw70cqJFg6Ax3uUJ8wLOhDy0tGrd/Yx6PYaAJDQa2ZkpAqBKVci6e95c3mTMcup6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3w8y3VNTLsGYFjj3xShndVYOtOkKbrGK4R6HdTC3+hY=;
 b=XSnHVVwJ7elZADZpZmwMhZaDzw04Z7LdBI0DF2NBJPloCQP8x5Yjg/Oj//KzcpxYJdDioyWdOUez8xe5ELT6f4pWl7OR6wsEQDvK8gCP2yoXxUi/CaZ6TF2vtelut5AafpeGvLatj+O6mzNmGHLc+8Bgxg3VN2dIS21cShhHw/PG5IS0aJaJwwad/hYi47crRRYiCOQCzDap/jkUAv+cIeahgL8gdMQVBfRVfFcNYuYI8jS6aaP/wswGaf3S1eXS0DDvtOLc2hUqnmuOvi2XoOMAXedNolg4psGK5K1bG3LilHK+Jy0QIbNOz3Y+Nyb4cHVG9h+FQiClaj9bxtN3+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3w8y3VNTLsGYFjj3xShndVYOtOkKbrGK4R6HdTC3+hY=;
 b=VS1gEoAYvkTUDrpdTxfW5TUDCqZsXWD04rR6j7dKn/4HFJdJ3xzzJ5BheGLTVFADfp7muDr37geWIvozPjGKHRK/4DmXFWfFifH0xBCoV+6qMN4wmuaRGX30c18PjkMfLjs1V11QAh7X+HDY1xM61RQWNuTGtMiZgokgSCX18H4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <626de813-99aa-6d44-c895-73e9cdd19967@citrix.com>
Date: Tue, 14 Mar 2023 14:50:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/7] tools: Use -s for python shebangs
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-6-andrew.cooper3@citrix.com>
In-Reply-To: <20230314141520.3652451-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0085.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf0141e-411e-45aa-11b8-08db249b82b3
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ahz0MJNSkGesvipL1tfYtbjKDIb8yAGtEoND+a6M1su6yesdDa/MujiHDpdmKagbGLaUm3k6vEht/zNaWnslF3POosz18TtaQnOYRwR/n1PxUFpj63P6S4Xk4vsLwtq4gbRTy9SXdgVAR3/yEr5ONMTvh3FjQGMgHf8QmQFZxqBoWhDBat4oXkri10MQIg18H63k/FNmzX7hljbhISiYnojtAe/ndxrGyIQzl5yO6DyCOYWHQli0ubiwcTc/8oNiouWg5zZhvUuJiCfO7kp8GqCUzm0Ko7CUqozPS/WEH3R6MGjQBL7k/agVJkpZo7ixJWkQB2WYsptHZjEo4B5rnz8oFTfY4FoU8MZDXKBxhQnmqG9yQ0r/6mVW17vdctkuR0wAojdRowHvc8BqBl0gqatiFuPqIhtlzyDLAougCjE7rA4SpKYpHm/vAZhRt5sL0pHwJvhjEn7vX2jd2an8S8HiBpMiLW733RBam1035LVN0NhcWp6by1Rdg7XUH3W31XiLLC7I9EShVi05NrtKsGGRQ/w31BUqsX3ZqAZVk4c1b1O6PQuhEvIilqbLutaudD8rsT5O3cB3sYlkvmijVO5d/5LUdGV9RtAOXhIcQQo4rAP027q4U9TwkxuCuoHhPBO/1JaJdI5QikX8ItKwCVDXqu5ZndNsWPqwZ7mvoVThfHNGZGiMBTNch7ySsEa6fIz1puxmrHvNq2WJog4NKpLY87KHK7fTjBsS7/MRPV8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(451199018)(31686004)(8936002)(36756003)(478600001)(54906003)(316002)(66556008)(66476007)(66946007)(4326008)(8676002)(6916009)(41300700001)(2906002)(4744005)(5660300002)(31696002)(86362001)(6486002)(26005)(53546011)(6506007)(6512007)(107886003)(6666004)(186003)(2616005)(82960400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnVmSEFvdnQvd3pSVzRLVTJMeFFna2lMVUZIWGVzbDIzM096Ri9WV1hHRUs1?=
 =?utf-8?B?NGIyRlBiTUx1MmJ2bWM2bkVmK1BJWENLdnJteEJKb1JNOUdoekZlTGk3dEFI?=
 =?utf-8?B?VjR6Z0RGQWNoNFgxTytEOCtqa3VScW1qNzNaYUV6K1A2V3BNUDNtKzZINSt1?=
 =?utf-8?B?OWRJZzZ6RHNFUjZlT2RnbTBrZEE1QUdFRE5vNEJYZnJQb3Q5N2dNZVAxSUFR?=
 =?utf-8?B?a3d2ck94clpqcWpOQndHelduK0NvdXdtSnZKU1cxMnVNSTJSUGVsSXp4Y3ky?=
 =?utf-8?B?R28xQ01JWCs2VTBlUm41MHFZNzdnaGo1OXQxc0ExU0ExcTR5SGtTamVZWGt2?=
 =?utf-8?B?NG1RS0Z5NWt1TkYzMEVWanRQMmxtbzhFaXpDaS9BNlJPTWZiUzUwTUk5UEVT?=
 =?utf-8?B?Y04zeENWWTIrQUpCZjhSM0lnbC9ya1NqbDcvRHdsNG5KUEVHakRuZGlBNy9S?=
 =?utf-8?B?YUYrVC9XU1FjRE1GeXIvRFRQeUxSbVdHR0pxcXhXMWhrVk1ZUzFnekVycTZi?=
 =?utf-8?B?QWNzbjBMaVR0RHBacG5HNjBRbG0rbVZ1VThJQVBLRnN2c05iTzhRVTVtUkR2?=
 =?utf-8?B?a3BaK0RzUGJ2eU5RUGhDa3N4Y2NNeElvTHlpL1BtQWI5emY5L0xDVnRLb0Js?=
 =?utf-8?B?cFNFaVRQcjJKNS9JTlhhcFlQQTNNejk3YUM5VE9ZYWJlVzNQMisxcVZOUjhp?=
 =?utf-8?B?Si9hNzRLWk12d01FR1hRRGs0UHREdmI2KzJIZkJNdGp5eGUwajA3WkxNYzRG?=
 =?utf-8?B?K3dUMFNyMjk4R09LS0tzTWtNWE1JSytnVHJEaU11SDk4TlI3WGROQzdRZU5o?=
 =?utf-8?B?ZXQ1SG85QVVIUXFDZ3BPMW5KN3dQdHdaZTUrN1Yzd3lWNWcvZnEycC8vME1r?=
 =?utf-8?B?aUdzb2FuektuOHZ1azN4R1NQSVRmaGhMeml6MVZCbnMwNWFOa2x0K2k4d21J?=
 =?utf-8?B?WTN4WUtuWENONHh4bFNkRXZHUy9Xam03MG8za2VTNmE0dDhSY2hFV1c4VnVG?=
 =?utf-8?B?b0hKRUlUWEJtN1c3S2tFRlpMWjkwNWtqWHpWVDhLWHArcVpCMmpJK2RLVlpU?=
 =?utf-8?B?Tk9DSElza1ZYQWJIVjUzcmpScE9iQlV1ZDNmSnpXb2lhUmpuOFhzaVFzM1FH?=
 =?utf-8?B?MEMwT3RoaUJYSlErblU2YUw5K0FibU1ta1gzV1B6VUNvcWVZVnJONC9Gc3pL?=
 =?utf-8?B?TW96SXh2OXJFU1ljRjVMd2FiVjVFenh6L1JjNDNpVloyUEZqUWVhUWozRC9G?=
 =?utf-8?B?Y1NFWHZDMlNlN092WTJuOStTOGdVYS8rYnNxTjNiamg4dFZIYkprUEJzOHVu?=
 =?utf-8?B?VTNLS3BIODZLM1VkcCtjSGhoeGNRK1VkZTArdjl2WWEzRE9VMjAzQkkyOHAw?=
 =?utf-8?B?WU9IQ1JhSEhMeXRPNmxhRWh0aDRYYmQ0ZzJlSlpkbXhVdjBTMnROUTNid2JN?=
 =?utf-8?B?aXFFZTV2ZStzNFdwMFd4MFg1eE0vdlZFMGV1b1FuYkhJSmFhTXZuSDR6Mlh4?=
 =?utf-8?B?WFhFMUVRSkVrandTWU5jY0NnTUhnZHdNUFdqUVBjYlJLRUs4dTFjYlBJRm5Q?=
 =?utf-8?B?RGxtOFNablA4am5USEk2MHlGdUJ4SmtGditzS2pVVHdtWCsvTWg3SXhSUnNJ?=
 =?utf-8?B?WkN3akIzbUJCQlI1czJqdkovUFdyNEFyRUhjcENRYmxhSnU0eTRTNk1ZNHo0?=
 =?utf-8?B?VVE4ZmJPT2xXRzRZYkhCaDlNS2t6MWp4Q21PODQzKzhCdDkzZlNPRFk5R2pl?=
 =?utf-8?B?cGs2VHZVdngrNzNRbUlMbzNrUVhpcjJBODM5MkloOGUwOEM3cWNLeTBjdXhL?=
 =?utf-8?B?cGhoT0JoNys0VGcycndtTWFmVzNyMzN0ME51dDhhSmFQSUZTdEJnQ1l3b1Bu?=
 =?utf-8?B?ZWE3cUoraHNiNS8xOE5kSGpkbWFZdjJwWFBqaDZCOW1nSGxWUzhMTVNZR0ZX?=
 =?utf-8?B?MGs0WTQyTDk3dXFXTmdPVWc5RlZ6OXF1MktXR0xqWUxGQUszREZsdHlWZGE1?=
 =?utf-8?B?UHJYRjdmeElBY2dwbVJGeE9ockNjeTkycGtnZ1oxdDg2OXZicmpEeVl4SkFO?=
 =?utf-8?B?N2tyd2RUcTlFZnhycTZOelhsVFp0K3lLUTlTNlRkTDkyRWlhbHRjaG9odDFU?=
 =?utf-8?B?TW81T3BLc2tJODBrcHNGTSszcEkrdVZaNi9EMElwS0d0WkdsWnVvcjFvbi9s?=
 =?utf-8?B?a1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6Pmq/78Mc4BkBbZsvTdl+NqSTU6y2B4OxKaeW1odlKL7720zYRhrhg1XK5qyYf4vB2tMjFKZXL+HG5lH5CeH5dtvdiSVIH2aKYhAHZPuc4OXNE+aKWFS75zboeb/SGNbsYjdLv0UvvjnHRg4nfWusvHtFjxupsQGY32HC/Rek+vg9RkY4GAV645mQ23nLMMLcPkCzmu24dJuQrkgZigwmAAlLKh57D+KXyZBxsclOG8H9ksjQ6w+TyLMV6xmHo6vUS1DlxQWgUDyyW5JbOcrd/MtHCFzCi5Zufbh1IOudVmU8ZJLt44U4iNZ5H3C2y35oIL4+aKKbkGScmCx5lfMLE7HMOQeprjQUNYTDu0kZlHKsJabR4h8DrmCy8owICghxZWTDV8+bdLTv6FeVYFeSgpJmeqlactfb5Zqrgq8Sx476avhkwKqIXQfwwjCqsV51rAp3jzwBVyxX+fI+c5TEvzf4yXJnleYEhn53FPOOIGZ7OKFyOhipp11srodkGF2nLGjnd6wBDr2YlqPECBwNQpxEt1UEwQRZ6xX+Yuu0pwLjcbaU12OPjwhnezENqo/d3gO9B/nQCKxIxTbPVAPef0NROAObifM25XXSWlAse1f2650VVp36kS5rs5S5T21KNBzfHspbIv2Ua/38fa2Fj8CvZM5IX+EPb1sOun79/4nnPhHI6G2Pu48nWGcYJHgxM0OIBNbOJfuuZtM3KR1NfpEXxFuEXeSjSJERBNstCjcsVCM9fO8KXJ4Rk737ueRA52Armd7xBlbkgKlPqbJ6GdxhXGkV1l0rzwKYf1jKquvAyxwR3lfKtuTgOW86J8YHw//Xt/yndiRGsW4qjrJAXrj+1Z11KCQzEWH/70AjKs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf0141e-411e-45aa-11b8-08db249b82b3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 14:50:53.8111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pla0L5i1d9bubMi1fSw2oZOA/Q/0YpX0+jwGj/b9qTg/no70gLq+tPI0K0WE0JJohuQq+Im9qodZi5Ol2eGy0pjSO0YwZjdhFLa0zF38KfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4917

On 14/03/2023 2:15 pm, Andrew Cooper wrote:
> diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
> index 29ad0513212f..04b3995cc0f6 100644
> --- a/tools/pygrub/Makefile
> +++ b/tools/pygrub/Makefile
> @@ -7,7 +7,7 @@ PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
>  INSTALL_LOG = build/installed_files.txt
>  
>  setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" \
> -           $(PYTHON) setup.py
> +           $(PYTHON) setup.py --executable="$(PYTHON_PATH) -s"

/sigh

CI has gone a wall of red to this.  Apparently --executable is only
known by setuputils, not distutils.

Which is a problem because it means the main pygrub executable won't get
a corrected shebang, as it doesn't pass through install-wrap.

In the short term, I could fix that by moving the main pygrub binary out
of setup.py and do it manually.  Thoughts?

~Andrew

