Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ACB415C12
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193642.344930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTM87-0002aA-Sz; Thu, 23 Sep 2021 10:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193642.344930; Thu, 23 Sep 2021 10:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTM87-0002Y2-On; Thu, 23 Sep 2021 10:39:03 +0000
Received: by outflank-mailman (input) for mailman id 193642;
 Thu, 23 Sep 2021 10:39:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTM86-0002Xw-4s
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:39:02 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0651cc4b-16d7-4693-af5b-e8dd0d60eced;
 Thu, 23 Sep 2021 10:39:00 +0000 (UTC)
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
X-Inumbo-ID: 0651cc4b-16d7-4693-af5b-e8dd0d60eced
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632393540;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=czW0SM3LqxlQ6bHGBfoSgj8BE1sxKKvRihHh40ND2BM=;
  b=NFiWnaoJte8J6T+o9PWr9hFEtomNZoNdD9SI4o8MRssVWqDMk64R5MLA
   BqjGhLaRLjo9ENJZf9O1+YMaUH0EoXwenZewR3CbXnmoHCdSKXOVbA4yQ
   9SuAMrW9iVR75ZqAVscXTTmNOSChHqtsb85WyrHgpVZ7wmYsStf21SsLP
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5gNW6APMgNzWFtZUud4PvTyln0NUrDmHWUYUHSQXLhH6qpe3LuuqF50jnDNWjLRWIWK0pn9xLr
 e7MxI0KoquJMaYQKRK3JLzpZI9A3D5u8JskeqVHYWAqtGfG7ow/LvCL4QcQPhCqMt6P/5roYYc
 xDflBcz4YuQdkTjIVdt6/sQjBeKzrs9JneL2O/KT01eOYlV2jMizSWShfmRx2lM6aT0ltB0kMl
 B7lTJawG49/q8eUreqFT9v6CRvMACn3JVJ+/RnPtwa7+AGg3N0zBZ8eus5bnriIijnRhhze1iO
 D6ryswT7EpXSfo8uJJ1/VO+z
X-SBRS: 5.1
X-MesageID: 53020167
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fxB6C61zMUV3iZQTgPbD5Q12kn2cJEfYwER7XKvMYLTBsI5bpzIFn
 TAbDGqAbv3fNGKhLo9+bou18U8AucSByoBmQVBtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywbVh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhgvZTi
 /BNiKOKTSwrO5XClesYCUV0DHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIQAhm9p2J8m8fD2Q
 M8mV2ooMxD6UyJmEFMTM7Bkm+C5mSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1Fk0Ddq
 m/Y8mDRBhABKMfZ2TeD6mirhOLEgWX8Qo16PL+y++NugVaT7ncOExBQXly+ycRVkWbnBYgZc
 RZNvHNz8+5iryRHU+URQTWlhlzHmx4hZOBUOO8/0A+Axa+OvyqGUz1soiF6VPQqs8o/RDoP3
 1CPns/0CTEHjIB5WU5x5Z/P8mjvY3Z9wXsqIHZeFFpYv4CLTJQb00qXJuuPBpJZmTEc9dvY+
 DmMsCF2rLEal8djO06TrA2f3mrESnQkSGcICuTrsoCNslgRiG2NPdXABb3nARBodt3xor6p5
 iRspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD4J9sLuGkleh04Y67onAMFh
 meJ4mu9A7cJYBOXgVJfOdrtW6zGM4C6fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEy8kC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ7l0gWmDKILbimnkvP7FZrTCPMIVvzGADVNb5RAWLtiFi9z
 uuzwOPQkEgADL2iPHOHmWPRRHhTRUUG6VnNg5U/XsaIIxZ8GXFnDPnUwLg7fJdikbgTneDNl
 kxRkGcBoLYmrXGYewiMdF55b7bjAcR2oX4hZHR+Nle0wXkzJ42o6f5HJZcweLAm8s1lzOJ1E
 KZZK5nRXKwXR2SV4SkZYLn8sJdmKEahizWRMnf3ezM4ZZNhGVDEo4e2Ygv1+SASJSOrrs9i8
 aa43wbWTMNbFQRvBcrbcty1yFa1sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JsqYvHn6GJqYutAtBSJEsCEjmJ96uyOAnb4nGnnd1KXtGXcG2PT2jz4qijO
 7lYlqmuLP0dkV9WmINgCLI3n7km7t7iqrIGnARpGHLHMwaiBr96eyTU2MBOsutGx6NDuBvwU
 UWKo4EINbKMMcLjMVgQOAt6MbjTiaBKwmHfvaYvPUH3xC5r577WA0xdMi6FhDFZMLYoYpgux
 v0suZJO5gGy4vbw3g1qUsyAG7ywE0E9
IronPort-HdrOrdr: A9a23:Hv9lWaP7idwCE8BcT1D155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/uxoHJPwO080kqQFnLX5XI3SJzUO3VHHEGgM1/qB/9SNIVyaygcZ79
 YdT0EcMqyAMbEZt7eC3ODQKb9Jq7PmgcPY9ds2jU0dNT2CA5sQkTuRYTzrdHGeKjM2YabQQ/
 Gnl7V6TnebCDkqR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LqT+z8rb1HzWRwx9bClp0sPgf2F
 mAtza8yrSosvm9xBOZ/2jP765OkN+k7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0a2SwWdvtO
 OJjwYrPsx15X+UVmapoSH10w2l6zoq42+K8y7RvVLT5ejCAB4qActIgoxUNjHD7VA7gd162K
 VXm0qEqpt+F3r77WTAzumNcysvulu/oHIkn+JWpWdYS5EiZLhYqpFa1F9JEa0HADnx5OkcYa
 hT5fnnlbRrmG6hHjXkVjEF+q3pYp1zJGbJfqE6gL3X79AM90oJiHfxx6Qk7z49HdwGOt95D0
 mtCNUdqFh0dL5lUUtKPpZ2fSKGMB2/ffvyChPmHb3GLtBNB5ufke+83F0KjNvaD6DgiqFCwa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53020167"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bpliu182gJ1z4Qb2oNMnb6ivSg25nIR7JzMJFxWZ5l5dmiudhVUIk8oj8VgF4iQgyY8oVw7FGoZH7gM0ZehfxKEpQeU07tnSlqY82+elSWn300+hEtdXQFWpnJSN/2jYsmCOA4Aj92duJVrTyvdKIPaAXyQibKBrBTYIRbKjbNRPRL+aL3Eo0W2bbIOxT5W5OE5FqE2maPQwf0vAeYli91Hp1HsYrIXkeOOiofYNQKV6zNV8l7s15I46BSgd0QKdBvLLdVhHhPDKmrKRHF9X7h+Gsgf/Oe2ptqhVwffCgzIfkwWQgpCWMOkY+hV9N9scv6t3zAu8EEA7CiLhcJ/ahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gS7M4mv+sgTTxlL68snpTZ4ltNxdQSv0wHuPxWzPSN8=;
 b=cDDbQpHo7QGe+vEedOxmMVQxX3dHr+iAaGWrKiYazrujD0gT/bvuW94kBMSNritX2Cyld3AfyEyS2QL5aAnuCGAc06qutg+58zalag04qx3nZKuomY/vHOLkL/SuYgdVDf8AIpHeSovDl7CgdPRomRvUTso/oQKQmH2zyz2OfboQTf6kRmnAvy0vyNI1hTAi3iVh1H4CZCxj16MvfRxvnS8xrAoiOFxSnWGKLJSDowgqmjxQmVQRnT6chcn6KUYPS2op06VrauUpCpJngI48yqDcR8no/GG8hA0k2En/8ukDUBii9b1cXw1x4a671exmJyc25H2qNy38egYehpUZTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gS7M4mv+sgTTxlL68snpTZ4ltNxdQSv0wHuPxWzPSN8=;
 b=ZKf6TnJ0V2C+oA1n3o33KmP4hNa1vs2L1wz1fGMB512cHVLI51jiVlB51d8mlcI9+M6Z/jLzp6GyHQdP/STltjCeoLcCtsT4WEBur5PFwvlCNxrMgfKydqfsUCEhYbj/ttqsSfaU04/i8QBKLD+3IWU9brST37mtoZhzIhuV8ys=
Date: Thu, 23 Sep 2021 12:38:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 7/9] x86/PVH: actually show Dom0's stacks from debug
 key '0'
Message-ID: <YUxZPK89MaabmXBd@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <ca129fa5-7165-a9ef-4e57-75c43a708960@suse.com>
 <YUxXcrMiPDiGkdw9@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YUxXcrMiPDiGkdw9@MacBook-Air-de-Roger.local>
X-ClientProxiedBy: LO4P123CA0321.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59966ca8-bdb9-45a6-7fcf-08d97e7e587c
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5445BDB389318155539D327D8FA39@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HbqNO5OmqJepGQxlwjBihhMeZlQwnYsTb30VkCbHiqLZmhh/CMB2JIuyBJclfCL2hh+AAdb3WAYxIG0w8zi5M/BiHhMb7UgpdjquOBKCFJqvw24WC6iPV21yo7PjgFbpcswe428E8bQfnAsjdqOHl/koaRqE6o0ONBy5Hy8l6rZr1/3HjsRfJnJZ3hC1RHJ+Wxwkog4UqjRQ84T2Z6lXpo/El398ktragu0Fziejt3ir8HqxvGtGO41tBxCXRsNt2gw6baKNrcuWqAPNJi+gQEUIdFCQNOoFxMfeZA0HuOUcB7omgtGz1L+aCsoHEsChDOU+JqoDFf58X8nWWcxG0Fy5M5w5GTGkRN//lONLIKMhUOx1HsZF3NoGWJNJgEwtZMliFs2VXsba9q050kY/fwNjUjXTcENRjOf2Zti7xM37z/PdxSbOd7FQQC+ggouDXEdG5uAkRzuWiOUsLaaydBZImUhSg+ndZiFLnTqeBzf0+ig0NjmuXfUCN7empxHLyH7l13XRQSDkdYq5yqEceohhxna6+U+dgrqE8NsW2RQbGekoaH1am4CjmOKHu8lNrpwnt47LuE6Kyh2JDtwAkYUUFeHbih1XjUmq22jJZgudLd8X/v7IaBBuRdk3VTrnATv9WdrwsYemFT7u2kGz/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(508600001)(86362001)(186003)(6666004)(38100700002)(26005)(83380400001)(85182001)(4744005)(66476007)(66946007)(9686003)(8676002)(4326008)(66556008)(6916009)(6486002)(316002)(5660300002)(54906003)(2906002)(8936002)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3pPMnFCL3ZGVWVyR2ZlWXJBWmVxK3JoRHM5dVVxWUlMSGozaHQ0dHJ6UFNG?=
 =?utf-8?B?VGp5aUxrN3U3OGN4S0pwYXJEOEpOT3pvWSt3KzI5bDh1WElqL1YwejlNL1Jo?=
 =?utf-8?B?QW9MblM3LzFFN2NGd2hCSGFNeDgvSGptL1pjRHN1ZzdsQlBYOFpLdVU2dVIz?=
 =?utf-8?B?d3YzMFE1OWdNWFZaK3JVMWUrSzJVdW5DNUovQUlqTVBVYm0vSmRSL1NjM3Vx?=
 =?utf-8?B?MXpJVkxLMStTQzNtZ0p3b09FdWROZVJYS2R2dTN6MWkweXNLWXNQdlFsNTNq?=
 =?utf-8?B?NU9oeGFuU3UrSmdrTlY4dE1mMGRzcm5TandpVlV1d04zY1o4OVBzTTFicHBP?=
 =?utf-8?B?Y2RSNHYxeWwrZEQvUjBMS2toRzZGaHloYjRmNkcrNnVWYVVYbTZWUldLZ2FS?=
 =?utf-8?B?OE1Dd1BuK0RBUGVKdlNwSWdIdDNncTdwdVMxTmRwMWIyR1BUNzhoUFlYOTFD?=
 =?utf-8?B?eldiVDI2ajJoRGZTeE1nS3BhZXRHZkZjNHNBdnpEamU0T0JVMXdyNjd3bllL?=
 =?utf-8?B?YUhDQnNqc2RST3VQQkY5VGFvMUhlRVkzRytDWW5ZMmhOd3NldGdOWk53VXdM?=
 =?utf-8?B?dHF1MklQSWo0OFVicjlIdm9jQ0JWdkl4dlRuNUkyWkFSSC9LLzNNUHA3QmNw?=
 =?utf-8?B?MlliRU9JYitGZEhUbnk5Qys1cmNGVk9nQlBnUmxGVkhoSWVyZFZsRFRtck5z?=
 =?utf-8?B?bm03OE05bU1aTDF6VzBjVlRXN1Nsc3NoRVNHMDFzMHlZaXVtd2tiMDlXakhv?=
 =?utf-8?B?MVQ5WTJ6MHRZcVRVNURZL1ovM3pvZDhuSEFuVkNaUmdseUVDSjJBRVZLTExv?=
 =?utf-8?B?SEg3cVpHL2ZYRE1lRkxYS0VnaUVIYTBITTVSK1FVKzQxRXg0TTRlbElDYWlR?=
 =?utf-8?B?YmZCazdIRmtKYkxILzdMVHF1Y2xKZk9vNDY2REdZdnFDdko3ei9VQTZMSVJH?=
 =?utf-8?B?S2c5ZXAwc1IySExORjUvaHpjNGlrUFk0bmsvUDczZkY3NjUvUmYzUGtiV1Na?=
 =?utf-8?B?Wi8xSUNJS2xTMlhNYWJPOEIvYXZJOWp0dDdJSWVJSzZ5bmlYYVhRZk1ZazF6?=
 =?utf-8?B?UjA4SU5GWnl0YVhyY0YxZmliOHZCWEFqQ2tVL0h5NHFvaDNyREd1eWxDdDND?=
 =?utf-8?B?VU9QMFVQKzhYZjQyUzVTTGhwTTZmS0d3ZE9qYWRQM1g3TUdaZzRvcEVoTHVn?=
 =?utf-8?B?RE0vbjJTT1F6Yi9jc1NvWTdPSGduWlRaMFY2V0l4MjJPYUtINW5tVmVXdWN3?=
 =?utf-8?B?UUFMV1hpL0VWbjI4bjV6MTVUbWdQRG0rQTNReHFXQWEvZGtMN3FEV0NOb2dC?=
 =?utf-8?B?ajc3Mk1wSmdGb3N0T1ZLVkJjUG5NcTNYd0RmWldVODdGVFBZcUIrK2Qxekhl?=
 =?utf-8?B?Vm9reEwrSTJXN253RWpiejRtZnJkaXQwczh1RFptQjJERitkdmJUK242VkVy?=
 =?utf-8?B?Q1RHdmhRbVZ3VTI1WjNMKzl0NThNYThETmdLQUw4aGxNc3RpUFlydHJTRXA1?=
 =?utf-8?B?dzJvQXdvV1ZNbm1OWE50TmZwODdxV0xrZmROUnZmc1RRSGpqcFdoeWVUd25n?=
 =?utf-8?B?a0p4ZmtrcnlpKzZwQ1ZMVmh2Wml1NDJKSW5aMURzd2p6U2dlRll6NDlnbk0r?=
 =?utf-8?B?ZFN0M1dWak9ra1oxbkI1ODVIMjJEYzBGN0VPSmZZOVpDV0VrYzJubEdyWTBO?=
 =?utf-8?B?Zk1YL3JLd1NiNkxRM0RPbStmdWxKRCtFa0NNSW83VFZDR3JZb29SM2NnNHlV?=
 =?utf-8?Q?fUaGxnnVlvn0DEKub9f7A6qQRB9u7DmfBzaJMa6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59966ca8-bdb9-45a6-7fcf-08d97e7e587c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 10:38:56.8514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPSS05U0dKcxr+g0mAPEy1Ez1cLi7UXuQxagDwWTrm4+7EIte8ugPJUqXJCbbG2XO7liGG9a8170a72E39Ih0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Thu, Sep 23, 2021 at 12:31:14PM +0200, Roger Pau Monné wrote:
> On Tue, Sep 21, 2021 at 09:20:00AM +0200, Jan Beulich wrote:
> > -    /* Prevent interleaving of output. */
> > -    flags = console_lock_recursive_irqsave();
> > +    /*
> > +     * Prevent interleaving of output if possible. For HVM we can't do so, as
> > +     * the necessary P2M lookups involve locking, which has to occur with IRQs
> > +     * enabled.
> > +     */
> > +    if ( !is_hvm_vcpu(v) )
> > +        flags = console_lock_recursive_irqsave();
> >  
> >      vcpu_show_registers(v);
> > -    if ( guest_kernel_mode(v, &v->arch.user_regs) )
> > +    if ( is_hvm_vcpu(v) )
> > +        show_hvm_stack(v, &v->arch.user_regs);
> 
> Would it make sense to unlock in show_hvm_stack, and thus keep the
> printing of vcpu_show_registers locked even when in HVM context?

To clarify, the unlock should be limited around the call to
show_hvm_stack, not to be performed inside of the function itself
(since we would have to pass flags around then).

Thanks, Roger.

