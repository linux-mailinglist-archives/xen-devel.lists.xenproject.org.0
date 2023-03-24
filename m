Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525966C86E4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 21:37:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514432.796652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfoA8-0007mQ-UN; Fri, 24 Mar 2023 20:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514432.796652; Fri, 24 Mar 2023 20:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfoA8-0007jv-RS; Fri, 24 Mar 2023 20:37:24 +0000
Received: by outflank-mailman (input) for mailman id 514432;
 Fri, 24 Mar 2023 20:37:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfoA6-0007jo-IQ
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 20:37:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ababe07f-ca83-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 21:37:20 +0100 (CET)
Received: from mail-dm6nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Mar 2023 16:37:14 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5397.namprd03.prod.outlook.com (2603:10b6:5:2c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 20:37:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Fri, 24 Mar 2023
 20:37:12 +0000
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
X-Inumbo-ID: ababe07f-ca83-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679690240;
  h=message-id:date:subject:from:to:references:in-reply-to:
   mime-version;
  bh=vPaHBc6cwpaunvRxTajBYmlC5U+TbA4GY1ansj9DoDU=;
  b=cIleTWDKujpYTPijFmMAaxe+c3VMf4gTc+mwJbZk+QAILhwr6N661eK8
   ixYgrLWqTRhUAGzB+lsOeFUal/2IUMw5x+YwLFdIPaFfU5lIjtvH/59+q
   WeqDl83JeXBEAOToY1JG5Ix4f+Gc130HwvidJjbtII41vJifyvH8t0J7w
   A=;
X-IronPort-RemoteIP: 104.47.73.41
X-IronPort-MID: 101636606
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PrFap60Ok4szDX8sXvbD5fNwkn2cJEfYwER7XKvMYLTBsI5bp2AOz
 mIXX23VaaqIYmPxKNwjOYqwpB9SvcWDyIdjHANupC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHDhVr
 9AIGWs0MEq7ju7t/4CBU8A8v5F2RCXrFNt3VnBI6xj8VapjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6PlWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHuiBtlMSuXmnhJsqE+s22YiVURIaUKAs/630EK8d9lmc
 ENBr0LCqoB3riRHVOLVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQquco3bT0sy
 F6SntntCCBvsbuaUnaU/PGfqjbaBMQOBWoLZCtBQQ5b5dDm+N03lkiXEo8lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:U8b1QqDlB2rAykPlHelr55DYdb4zR+YMi2TC1yhKOHpom62j9/
 xG+c5x6faaslcssR0b6LW90cq7MArhHPxOkPEs1N6ZNWGI1ldARLsSlrcKqAeQfxEWmNQtsp
 tIQuxSMvC1K35Q5PyX3OC/Kbwd6ejCyoyTwc356FhMYz1QQ5xBySA8MCqne3cGJzVuNN43FJ
 +R/MpVqyDIQxkqR86mHGQCW+TZh/CjruOFXSI7
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208,217";a="101636606"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTlsZeD8Bo+j6vdC1ilAIspc7Js++oMy9apTKhTGqyvI5ZseiMAEmfFa74XODVOAKozzMZvG4PI2Le5krwtslxc1psXje2tHUIhfOsVndaCl4z/v4J2tJWVzqVx9xJNAjteMxaQfjmnE2HlkgUKk/aleWQVprYhwnY7aVewG3SINOkbNeJjmOq9RC3MrTvqUQ/PovOkuvyeLHd90ZVwqFnsAV7FEYaFKMkdOF2Iu13KTvqNJU2i9TfT3prrnvlzCqomiXBRWHgPkY+2Ne3hFdn5aw2XgNMZg+AF27m+xcZpxzX96vlMCymZlj9CJnpxxS+ISmbhpvrmN2iKSrTxeFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDzWjSuqHxJmnIVcLr3/I0r4cXBHYMsYl1x7zMU6oEQ=;
 b=h2TSde4w2x++cLDVjYnjHNbGKCeKs6OuXpAIhgAH+17sNrcMdaoKIwm1n5YTOLYMA+cSupc9LG4SCrY6eiMh1R88KmM6xfv8waYPi8O2KvM2ZLWKoULm/mDuqtgYwTDWt89dyX6nqF7sxzy62Y4Y/jUocBvjG+yxHlx6QJGWn4zRL6OtHeF+vQX+sILIJjHTwdX+AtjZrghFpR1NfNewQC8C7XLl7y7GYspuuh8Iz7iZGIbYtworAHDKHhh/NmfIQtXFjHJ+37Asw5CegfnPq4VrnkkstefNlP27kEaqFFn6UtNEKtfNQpISeZKY4f/5q5KVqtAB6uWyJuYX0fnwmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDzWjSuqHxJmnIVcLr3/I0r4cXBHYMsYl1x7zMU6oEQ=;
 b=iQ4FSWhG7XW9EjSpw9+8JTR0sPjqY3KHgEub7xdf0lVG6wpJQucNseyYWV0hXkkW9/WPES1oZK5097VGT9PWmQEGN2cWNW7n+Tt5nu/YPDnfZmVOyaXXUR0Ji32DxZ1KLkgRJKtvbTW2czEIuC0+AIVwMGjBSGcZIPO6WpZ63gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Content-Type: multipart/alternative;
 boundary="------------G9jGNwtOOgepn9YX0Gc0d8R7"
Message-ID: <17e95e93-a3a9-962c-1563-f9fc526320df@citrix.com>
Date: Fri, 24 Mar 2023 20:37:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [xen-unstable-smoke test] 179929: regressions - trouble:
 blocked/fail/pass/starved
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@citrix.com>, Demi Marie Obenour <demi@invisiblethingslab.com>
References: <osstest-179929-mainreport@xen.org>
 <fbe7ded7-47f6-caec-dabb-6978d9e2a192@citrix.com>
In-Reply-To: <fbe7ded7-47f6-caec-dabb-6978d9e2a192@citrix.com>
X-ClientProxiedBy: LO0P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5397:EE_
X-MS-Office365-Filtering-Correlation-Id: 4022ef2f-11a7-4c41-1662-08db2ca78bb9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UTTeixLpskj6ZG5qZb82xhDIRgJ0+eEUR8s+5Zl6IXiEeGx1pQ3pXQkeILrd+S5VpJUC+e3Nqn0if1XBCQln3CSnlPS4s4JMxnf69eHZ/P7TUjFF3yy5sNypX5/+lOy8TJ52Ftoq3WSHiqqohpiKe5v9y705LzkT/u4Bg0yDYGLQ/G49lB5C9MKLOP184zOGTsJqR5T/Mn0lBCtmhc6lN7fkLjqGZV8T6caQ6NQ7ggLxppRCpNh13aYLvKjSxfDAvpbCSj+r4b7L92aMNXz3EabOrTVkZUgePFqCU6Rj8NaWUsR8bcMh+YzmZr63VTv4VbXspsKEtCW0rs9bE7+JaR6EO1Pzd+MI9TQ8YXxL4sb5jpeEL33z4MZQyLvdWN4NlPJ5T4Rc6xBsVmkykIMwRilZFrHhw2uVLqBlQvkSt9/WWQfQMRFvrmAQwW1In84aksony8gokNdc6q9JEIR6ljmm5R4hato9TxtaBb+THjc/oCTPiWYIO+dZPAJTfE7IyBMcxBUKnYkqpcx7LvNfewIYLuUK3U4umulNGM2Gi+P7F9pd8yvh5XRCYvY2Hfju0MVqHvI/XRx7W7zn7gnhKVUC2IMWFnfzFfSqfKxmSl45XhBcaq5msbBKz/AdWG3Nijo238egQn8jjjl0q2QsYQtCM1PnXW18gBKvG5bmB0EO42OHpt96u9dG/myBEoBiUCqbzpILlnREGp5UO1VN0w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(451199021)(31696002)(83380400001)(966005)(6486002)(2906002)(478600001)(6512007)(8936002)(6506007)(26005)(8676002)(86362001)(186003)(36756003)(2616005)(66556008)(38100700002)(33964004)(31686004)(166002)(6666004)(41300700001)(82960400001)(5660300002)(110136005)(66476007)(66946007)(53546011)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dCtTdjI1V3g4WEVSanFqOGs0cG9wZzRUQ1FiYlp6NjRFVVhzMFR4bFdzSERi?=
 =?utf-8?B?SFhTRGZMd0cwWlFDekt6VFJMNmxZM2VUcGJkdk50V3k4Q0VJYVVIV2kxanpa?=
 =?utf-8?B?bUJSZWNURTRJVE1ZSEVOQ0VFOG1oUVgrWVJtOGNmd29xRWIvaGNoaHAzNnhk?=
 =?utf-8?B?SFVTc0dUUkJWWHI0WWUrOUNMNlZRbnprRkJSbk0vK28zZkFaN3lOM2VEbVFO?=
 =?utf-8?B?SkxXcFVKNmJ4VDBTSVVZUzZGRlVpU1U3ZlZpWUgrcktpV1dUMG14Y1FodGkr?=
 =?utf-8?B?bFArZWgzb0pwclFEN2tMa2NMRk1GdmdQb3BnZ05ZSmRHNjNkbDVjS2ZMU01M?=
 =?utf-8?B?Z0J5VHJOYUU5NjgxVFVsUTYxOEdZb2Z2R1ZsRVVpWmhPNTBBb05SamZDazdX?=
 =?utf-8?B?Ujl5bENHU1JYbGxlR3hGcGVwMUo5SzA2bWJzYXk3Uk9aMUZxU3FaMUpWRXlr?=
 =?utf-8?B?WmQwazJPL3ZZWU9xVUR3S0I2VmdHbmVvaUNQY3VTWmF3T3JJOEw3c3ZOMmRZ?=
 =?utf-8?B?YmRlS0w4enUxRUZEK3RNSVA1Q2I4NFdMR3V2VnVhL2w5REdhQ01pOUtkeDlE?=
 =?utf-8?B?N0dhNnphbUptcTJvSTlsc3cvMWdPMkhablp3NkRwbXNFZ2ZKMFJLYTVsMzhG?=
 =?utf-8?B?NlhHYWlHTnNxU25ucEdiblM5RFYyTlc1K3B0S2lUU3lXdEI5dlppNEgwV1pW?=
 =?utf-8?B?TnBubllZZDBjTnowREFGK0NBcW51bHFQSVR0VFgwSURZaThNMFFOOTl3dlJC?=
 =?utf-8?B?MzFmbU9SQmZpUzdHUDY1aktzeUQvRk95MmJXSnlxWlloZWRmY3hHZFhEalR6?=
 =?utf-8?B?YXNtemhTdGt1Ulltd0VPNlpFTGFabGZ6a3pBTUhqQTRCQWVkZEttcm1JS0xQ?=
 =?utf-8?B?WTVVTG5lbGx0UTI3T0tOeEVidUxnR2t1VWRJdU43L3pVQWtMNyt0M1gzWWhQ?=
 =?utf-8?B?Z0lDaDRHTGExRCtpSGFST2RpVVNLMC9rQ0haQTUzTXBpaXc3TVVHWVlJc2I4?=
 =?utf-8?B?TlR4RStodzJ0em41VW5NRitpbHpkRzYvcG5UT0Y1MVF3U0NPR3VOTzR4Qjh1?=
 =?utf-8?B?dGxRS25sUzArMXZLN3JYN0t3SkZUWitwZFZ3NXBCaVg1alJhdlNjaGVUVUVO?=
 =?utf-8?B?QkRocm9OZ2pUS21rV2xPRVVpT0ZkczhXNXduTVdyT1ZvVVJ6b3MwRExaR0I4?=
 =?utf-8?B?VU9CQzNVTHVMSjJwZXR0TDZNZ3Z6Nkd6cUVBWVNscHpKV3dZVVhsM0hWazhE?=
 =?utf-8?B?UkJ3RWhOcGVQbDlJd2xCRjAwSVl1b09uZjhWa3NBVTFjMTBaSXd1RENoZnJD?=
 =?utf-8?B?SzFOaHJKWVFqaHYvbHRObklqZFV2SEZzZm1RTmdsTWtESnZZcVFLOXZmQTNS?=
 =?utf-8?B?VjA1MFlRbm5mNDhpUVFWTXY4STFnWmlGVmJ5VEpNWno2RWZINHFTd0dTRjFv?=
 =?utf-8?B?a1l1cDlnSFVJZCtkc0hyWWkrWWhuRlUzY1Y1QnJYcDRZdWp6ZEdhT1hwUDUv?=
 =?utf-8?B?M2RoaHV5MjltNnFnU1E4Wm1VbmxQMm9GdzJveTRGRThQbldZVkJPTXVqZzFN?=
 =?utf-8?B?OUhkZVdDUHRSR0IzclBRWnYzTTluVWxFYUJGcXY3RDZhL2t1M0VaeG9qNXUr?=
 =?utf-8?B?UTFKNGY2WUNza3FhdlM0R2d2QlM1NjdrRmVkb2pQZEEzOVJoOWMrZWhUajRs?=
 =?utf-8?B?UGtrTTd4aDNwVFAzMlBmQmluYkxHSjYxRE1lVEN1dVd4Uk1UM3BrdG1IZjlB?=
 =?utf-8?B?TktxMml2RXVESjVVOW9DNkZDRDliV2V6RHVYSnJ3UG4rWHVRRTY5TzJYWWZs?=
 =?utf-8?B?Zi9VTTlGOWlLN1E1dVdIK1gyVEZ1U3g0cmpGaFBCYnQ0Q2U4SnhEemVCRDVx?=
 =?utf-8?B?WUtFQkFMK1cvU3d4aHZKcEdIUVFOV05lYkVMMW9tYmZZOVZvS1Eza0ZzVzBl?=
 =?utf-8?B?Z21zVHRkVUF4eUlHUTVBMk1FaWFMalpvMHZycDhMUmwxTW5CRm5ZT0E2R2JB?=
 =?utf-8?B?eXc3WkJyYjJMWnhXcVZvQmdHZndCbHhHYWMxTnhNb2kvdG9qSU9UcXlkVEdH?=
 =?utf-8?B?TFcydllZWE9iaDQ4N1kyTHZqd2d2bTY1cnBMQkM2N2YxdTQ1QXZFL1l5Sk5z?=
 =?utf-8?B?eVF3eXRuaEhXQVFZVGFxN3RZYnpjejU2QU03Lzd0Q3VwN09uWHY0b0ZEdVNP?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kHfFxKT+qWbxR3UB6NR+XocmTXEKlxrforCNjGkBYZBC0Yso+zkjqDYh0Va2+3ZH5E32lwXWXmWTqmrGy5HlGoZRUWka5LHJUBdlAGCm0DwjUT1ICVLUv1XQw9OtTJECWFOWFceWeF2Rgmif8I6DRr+PY+Nolh4WmyHNTrhVCH2vyNvsRXfeEQ/YY32I/vXXQ9XtUjbFT3CVgn8me2iNpIm3JCrBMjzHAkculG7Z/1TaF2SENNXueJ8RNnNDjAO6ui4URdtX6nC1G9Bd9qUBsqPgP3u1SMb00GdqCqCf7Jgzaycw1OVahS/4Th41kGMs+SP2pEU0runrBS8qBrZogG9xNP2eeOsgDkuA07W9+8S9CROr0pMs3Qz5xt/cmXka6tjm6n6Ls9OotxUqDaDQrreRXqzLO0CAmmjTVq5kFe73K2AA/UnoFBDvDoZ+m09H6HTO2NOKRZ8PONPDQApnkJK6f+4k6dlEeg1/PgguaZa9zLR4J+fLBRCHfIUZle3yI64Xz3z5AkMv4ZpE13HfSLZKCIxVu00L/Oe/xDUUrSHUIBMmIPGDcTQ1UZIhjT128Ae63N6c7+o1CTi2ksggvrEWpiQSqs8qPA12k0iBC+tmK48nXcAP70+PZGlbzjY5mzKwSyxks+uomMjL0SvfQIYwsBonwwDMfzAIACpSj/pc2LmobphtKb2oobfB2v/NMQmlDWGaUO5kGM3ZSuK24dDAz667kTYMJGI+cZoSgXNDuxrr7I9PLSyRRXgwosEl0CirfW71v2pjspqltvsjeU7SuOSApAqU/L91t7R34/TtVzwclgPrjrm0+1sC/n/WKL7/JghLi1WXQjt5151SOQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4022ef2f-11a7-4c41-1662-08db2ca78bb9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 20:37:12.2599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOo/So1/x/ePSv14+C/nhzZLv3s4OmnYkGZzPTTufDYpgJ4GrZJils9iJGTQQSBtWsP8Y9KGzVpZmbqtjXcOlxdpCzb+sXRuYh2gc9n5rno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5397

--------------G9jGNwtOOgepn9YX0Gc0d8R7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/03/2023 8:28 pm, Andrew Cooper wrote:
> On 24/03/2023 6:58 pm, osstest service owner wrote:
>> flight 179929 xen-unstable-smoke real [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/179929/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  build-amd64                   6 xen-build                fail REGR. vs. 179926
>
> Bah.
>
> make[6]: Entering directory '/home/osstest/build.179929.build-amd64/xen/tools/firmware/etherboot'
> set -e; if ! /usr/bin/wget -c -O _ipxe.tar.gz https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz; then \
> 	git clone file:////osstest/IPXE-GIT-FORBIDDEN ipxe.git; \
> 	(cd ipxe.git && git archive --format=tar --prefix=ipxe/ \
> 	3c040ad387099483102708bb1839110bc788cefb | gzip -n >../_ipxe.tar.gz); \
> 	rm -rf ipxe.git; \
> fi
> --2023-03-24 17:06:51--  https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz
> Resolving cache (cache)... 172.16.148.6
> Connecting to cache (cache)|172.16.148.6|:3128... connected.
> ERROR: The certificate of 'xenbits.xen.org' is not trusted.
> ERROR: The certificate of 'xenbits.xen.org' has expired.
> Cloning into 'ipxe.git'...
> fatal: '//osstest/IPXE-GIT-FORBIDDEN' does not appear to be a git repository
> fatal: Could not read from remote repository.
>
> That's OSSTest choking, apparently with the same LE root cert problem?

Given that there's plenty of content wanting testing right now, and no
chance of this being looked at until next week, I've reverted e1d750844
(which was just a single hunk anyway) in the hopes that we can still get
a useful weekend of testing

~Andrew
--------------G9jGNwtOOgepn9YX0Gc0d8R7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 24/03/2023 8:28 pm, Andrew Cooper
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:fbe7ded7-47f6-caec-dabb-6978d9e2a192@citrix.com">
      
      <div class="moz-cite-prefix">On 24/03/2023 6:58 pm, osstest
        service owner wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:osstest-179929-mainreport@xen.org">
        <pre class="moz-quote-pre" wrap="">flight 179929 xen-unstable-smoke real [real]
<a class="moz-txt-link-freetext" href="http://logs.test-lab.xenproject.org/osstest/logs/179929/" moz-do-not-send="true">http://logs.test-lab.xenproject.org/osstest/logs/179929/</a>

Regressions :-(

Tests which did not succeed and are blocking,
including tests which could not be run:
 build-amd64                   6 xen-build                fail REGR. vs. 179926</pre>
      </blockquote>
      <br>
      Bah.<br>
      <br>
      <pre>make[6]: Entering directory '/home/osstest/build.179929.build-amd64/xen/tools/firmware/etherboot'
set -e; if ! /usr/bin/wget -c -O _ipxe.tar.gz <a class="moz-txt-link-freetext" href="https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz" moz-do-not-send="true">https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz</a>; then \
	git clone <a class="moz-txt-link-freetext" href="file:////osstest/IPXE-GIT-FORBIDDEN" moz-do-not-send="true">file:////osstest/IPXE-GIT-FORBIDDEN</a> ipxe.git; \
	(cd ipxe.git &amp;&amp; git archive --format=tar --prefix=ipxe/ \
	3c040ad387099483102708bb1839110bc788cefb | gzip -n &gt;../_ipxe.tar.gz); \
	rm -rf ipxe.git; \
fi
--2023-03-24 17:06:51--  <a class="moz-txt-link-freetext" href="https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz" moz-do-not-send="true">https://xenbits.xen.org/xen-extfiles/ipxe-git-3c040ad387099483102708bb1839110bc788cefb.tar.gz</a>
Resolving cache (cache)... 172.16.148.6
Connecting to cache (cache)|172.16.148.6|:3128... connected.
ERROR: The certificate of 'xenbits.xen.org' is not trusted.
ERROR: The certificate of 'xenbits.xen.org' has expired.
Cloning into 'ipxe.git'...
fatal: '//osstest/IPXE-GIT-FORBIDDEN' does not appear to be a git repository
fatal: Could not read from remote repository.
</pre>
      <br>
      That's OSSTest choking, apparently with the same LE root cert
      problem?<br>
    </blockquote>
    <br>
    Given that there's plenty of content wanting testing right now, and
    no chance of this being looked at until next week, I've reverted
    e1d750844 (which was just a single hunk anyway) in the hopes that we
    can still get a useful weekend of testing<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------G9jGNwtOOgepn9YX0Gc0d8R7--

