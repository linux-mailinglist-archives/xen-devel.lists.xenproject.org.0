Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A557610E2B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 12:13:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431883.684538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooMM5-0000Bf-RI; Fri, 28 Oct 2022 10:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431883.684538; Fri, 28 Oct 2022 10:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooMM5-00008N-Ob; Fri, 28 Oct 2022 10:12:49 +0000
Received: by outflank-mailman (input) for mailman id 431883;
 Fri, 28 Oct 2022 10:12:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zj9=25=citrix.com=prvs=2939fe9fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ooMM5-00008G-1V
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 10:12:49 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 111dbe3e-56a9-11ed-8fd0-01056ac49cbb;
 Fri, 28 Oct 2022 12:12:47 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 06:12:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5021.namprd03.prod.outlook.com (2603:10b6:208:1a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 10:12:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5746.028; Fri, 28 Oct 2022
 10:12:37 +0000
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
X-Inumbo-ID: 111dbe3e-56a9-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666951967;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=V5tqL95KA5nNxGQnc24lGJUYzONxfx8UwMjpXlXozT8=;
  b=SgniGzzB8Zmvq1Vz8kefpnpUhyIQoJ/pA42Q2kuxeHKNQ0Rl23UmuIii
   ZRo59iCCugeSkriIu8Zy/yweN2IShXTGUs7fEAa/GQ1eDlSjJUtqrWd8+
   XsjkcZCVftXcKze6wPSQ+CVpxGl5DQisA7tnsPGdAdFJdu1Pyy+g5eoRQ
   c=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 82795885
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:DB/3v6hEP1z4McLMtpd/WLL7X161nREKZh0ujC45NGQN5FlHY01je
 htvCmmFOPaOa2PyL91/PYzgo08HvMXSzIA3QQdopHtkFn8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWv0N8klgZmP6oS5AWOzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ2LBpSNQCjmdmkweynbupUwccKdY70adZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6ROfnp6M60AD7Kmo7SxcXdn2yq9mFkg2sa/BgB
 kIy4TEDlP1nnKCsZpynN/Gim1aGsQQbQMF4CPAh5UeGza+8ywOQHG0NVDNCQN0gqs4tRDYu2
 0OJntXmHjhmuvueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8adgtP8Fj7xx
 DSLhDMjnLhVhskOv42+8FbIky+ErZnSCBMt6wPRGG+p82tRRIOjfZ3u1lHd4t5JNoPfRV6E1
 EXogOCb5eEKSJuLxCqERbxUGKnzvqjUdjrBnVRoAp8tsSy3/GKudpxR5zc4I1p1NsEDenniZ
 0q7VR5t2aK/9UCCNcdfC79dwexzpUQ8PbwJjszpU+c=
IronPort-HdrOrdr: A9a23:mFRWWawhUkiY92yg4rGgKrPxj+skLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk81bfZOkMQs1MSZLXPbUQyTXc1fBOrZsnfd8kjFmtK1up
 0QFJSWZOeQMbE+t7eD3ODaKadu/DDkytHPuQ629R4EIm9XguNbnn5E422gYy9LrXx9dP4E/e
 2nl696TlSbGUg/X4CePD0oTuLDr9rEmNbNehgdHSMq7wGIkHeB9KP6OwLw5GZebxp/hZMZtU
 TVmQ3w4auu99uhzAXH6mPV55NK3PP819p4AtCWgMR9EESttu/oXvUjZ1SxhkFxnAid0idvrD
 AKmWZmAy1H0QKSQohym2qq5+Cv6kd215ao8y7kvZKqm72EeNt9MbsOuWsRSGqm16Jr1usMr5
 5jziaXsYFaAgjHmzm479/UVwtynk7xunY6l/UP5kYvGLf2RYUh2rD3xnklZqsoDWb/8sQqAe
 NuBMbT6LJfdk6bdWnQui1qzMa3Vno+Ex+aSgxa0/blmAR+jTR81Q8V1cYflnAP+NY0TIRF/f
 3NNuBtmKtVRsEbYKphDKMKQNexCGbKXRXQWVjiaWjPBeUCITbAupT36LI66KWjf4EJ1oI7nN
 DbXFZRpQcJCjbT4A21reh2Gzz2MRaAtG7Wu7BjDrBCy83BbauuNzGfQ1YzlMblq+kDA6TgKo
 SOBK4=
X-IronPort-AV: E=Sophos;i="5.95,220,1661832000"; 
   d="scan'208";a="82795885"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGGg+En4VGffWru4NFGwlB5PlT+T7xh+muAFs6jy7P+D3EhOOcZfJU/kWbPGs6p4Y21NcA0bUmwyzyIk/SFVz9wUhjdvQ3gq9c5ghRQPW9h/OCLl2Xfd3YuO9OMWeFgPPBLY/fwtXBb6aKbB4udlX0pKJyzzkpqBTJI7t+XG3XahRnSSezh6twTRrr6KdV5BEAV4A3o/wlDd1SpnoPqJorI9gJMYNT+rJhzEd6GKgF6dwLQ259INPnAQpSpNOCrCSzm4VLQS2obgYNLw11gOHePqFb+r+aLHVidRCJXDHEJ9YBAP0xQ0LPKxls4jejZo86mWxVDvv9hnZtu54egLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5tqL95KA5nNxGQnc24lGJUYzONxfx8UwMjpXlXozT8=;
 b=L8BMldbAh+76QTRmVaZ1qX4L8RcMIIyQShqBP0qQrZLXLI9VK7qRU/iDnbtj3rRjqQbEu2596XIzp5LfMEwGZTuSTC/7GlcG7UHcoLYN+OO8057yupLekbGeQp6YgqOiU6xq5Ha56aSmbCVHliNS4gefGWcGlNLiQaQfriRpKOue+/13EssQoSYPTtdKHPbofa0Bdz45x2wtGxkLwUgw1HtFPjRTI0dZCz/lfgneQCEA6kL56jqicAnESrzA2r/Ritiss7TyqKQB5O8ktm4cus79YrNt2xOwMe/KIiDJn6nC74wuX4/ESF6hmexPICtjIxQPR+x90+RuOdhzOS7Ucw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5tqL95KA5nNxGQnc24lGJUYzONxfx8UwMjpXlXozT8=;
 b=YSSbYhlM0hsOEx56UNTxG/1yLjZMRWl79dzOmV0SKq92Qy33nVeAFOaQRp3pGj9ir7B/uqEeYL50olbWy2Opwm/Ey48dLPVyX1rF7w7RJ26nNBqVXa3rT4Hpy4XbZXirigq6O/ojMHte0o8CN3c1Vgt+KdoTC5bPe7Q8aVv/LRc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>,
	=?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, George
 Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Meng
 Xu <mengxu@cis.upenn.edu>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after
 suspend
Thread-Topic: [PATCH-for-4.17] xen/sched: migrate timers to correct cpus after
 suspend
Thread-Index: AQHY5V0DqOkvDmJ7xEaSKIEsmxLl9K4ilMQAgAELBwCAAAEVAA==
Date: Fri, 28 Oct 2022 10:12:36 +0000
Message-ID: <901fa58e-6693-ca2e-9231-447f989d614d@citrix.com>
References: <20221021145357.17931-1-jgross@suse.com>
 <Y1rKLJP/p+E+eVi7@mail-itl> <4977c33a-fe11-172a-11be-17acb01d61bb@suse.com>
In-Reply-To: <4977c33a-fe11-172a-11be-17acb01d61bb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5021:EE_
x-ms-office365-filtering-correlation-id: 1f268135-c21c-4ee6-ae8d-08dab8ccf040
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 tNCKRxxhGcRqhIFvf9QjBJ82EsutO3A2unHE65hzlr+dQGYOZdgg6EPd/2+Ln/cYznt1kgPfRDBPMO3V63fDhU6T1IKdf8O1v0ws8UUZLfHTnz/hxa0oXK6FSLKtlpH8Gj2wxNCBlZH7ilcGu3se2WdYzJUEdqihf4NYr4VL4OoLx22gtIzx29dGirVwhUQ5F2AD3iywOV8smAwyLIFSFgKxbJXmrnWiUCdYx48pFz8dNae1+IDTxEBK4qpeoeSiXqAivjYJ/pWha/JU5a2N+TaEYjxEuewKonidpKSFLE3nQO2klw2cwiOwtMOTa2Bsn1UrQwYtbUMIvgABAKZPfNpaiu9Qm45bSj/iXQw/3nXkSea8zH6u2C+v93DUIvohvayD9bkxe6aXEB6FU6whjGMTgP3gJYLQG3gjToTrshnQ1OcvrKC0aYLBI0c+f023bq1MzDOJO7+nmNJE/adpkCau67wzCx9DI0AT8WHH7rL/+t4Hwc7HQfC3mNhPAiua73FgC/YV28WDEgho8JVDAhsU8UEDaLg5cnEAwccQUve8HaHKiv4GVMgazfwqICknpr2ZyOIg/XTbL8BpLFnjuoSHdjQetbKHrqbCJJv4es8pGjZQiLcX9tsfXF+SUnARQtnNj0y7UGtz4YCUuZJpzBAVOX431DJ+FMZwIUJkQWWEFvMl9Jk2pBvxqxWOoZi1uaGxfEzYaBTiQmJMxDmWHRgJtQOf7rQL1xUzytzTclIayyw7xhrvMJ5Wjb7aZ4o0qlpn9eUqtoaCFkkeGw37G4e24XwTILr5iba7DcpMbbfoqGu4lBu3cB8E7kFBh7dimcLs5JT7QA9sQWkIUvlfiA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(451199015)(71200400001)(478600001)(6486002)(38070700005)(122000001)(82960400001)(31686004)(110136005)(316002)(66574015)(91956017)(54906003)(6512007)(26005)(66556008)(66946007)(66476007)(66446008)(76116006)(6506007)(2906002)(38100700002)(41300700001)(31696002)(86362001)(83380400001)(64756008)(186003)(5660300002)(8936002)(2616005)(4326008)(8676002)(36756003)(53546011)(15650500001)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVJtUGUrYVYzc09yWnpaVXc0Tyt6YUFOOW1UV3A0c0M4aVB5NHhBWHlsdFFW?=
 =?utf-8?B?bjBVZG9yNzFqcG1ncjdtNVRvSkE5VXFJNWNMS3BLOXBRRngxNmJXNDhFTEFy?=
 =?utf-8?B?MTJhbDZ6ODVvSzI2M0t3YkQ5SERRV0dpR25FamhoZHVTWHYvWm5JVlZxYWxW?=
 =?utf-8?B?d0drR1VaRG8vK1o5YkplRkdaaW16NXQvcmVPbEZJc3JPV002QzhzcDBqQ0pp?=
 =?utf-8?B?UGN3NkNUTFNBQ0N6S09lMmRsNFp5YlNITlBTVXhRMDJjR2ZGcWVINktHUk56?=
 =?utf-8?B?V2VIR1drRHJlcUFpRURwMkhTN25RcUVkcTYweFpDbllaNVIyMUV5N0g4eUFL?=
 =?utf-8?B?NDNsVXdBR3lPVm1sOHROUVY3S3BXNCtTam5EZll2azNyQ05WeUtDV0lOOTF6?=
 =?utf-8?B?Sk1Hd05DcVJ1anEwQ1JrUU1rV25RYTZTYjBnZ2V4eWVMUHpkQUU3eFd4azVE?=
 =?utf-8?B?bVNDV3IrTkl3ZWNoKzN2VDdnUlprMSs1cVVWdDd5VXYwNnppWVROUHBZaDQy?=
 =?utf-8?B?eXV1eGkrTkw0RE9sc1o0b3dJU0Rvc2NDcWNKaVlTR00xQmRYUEUwTHE1NEVN?=
 =?utf-8?B?NTd2RVRWTnVLQTBaUWdxcFdKUWlMMjZYK21Kemd6RU9PQnFpemxlenlWVXVY?=
 =?utf-8?B?TlZQb1Avd0ZnUXFzemE3MGJ4bTFOSkMxYXpuY28ySStjUVE1WmR3VlZKNnNP?=
 =?utf-8?B?WEtkMFFqd0sxTUQwU3V4a28waDF0UHFxWjBaMHJFQ0JUWmFOZDQ2WWZEVCtO?=
 =?utf-8?B?eU82c1JyM1BSaTRJSnZBRithakJHbGdnSE1FZXQyN3BZYkdiYnJyUlp6Z3Fw?=
 =?utf-8?B?OUp3ZlBPV3RhbmVQY0FSUzF4ZG5LR0dORzNIS0p3N0oyWnZuR1BEV3hXZ1la?=
 =?utf-8?B?djd5K1hGWEdvcUpCVGpaVWNISGVrNnBzSEFvd1dDV1g1Um1sdHo0NjZ6RWZz?=
 =?utf-8?B?OVZpQ0dsQlBPZjVyYzErc0hBd25EWElEbjFxcS9LcHRGQ00rTzBvQ2RCU1ND?=
 =?utf-8?B?WGdtcHU4bitIQ1I3L3QyMlNxWXgxQTJtMFF1UWNOa21rbzhOL0djODk0QnVC?=
 =?utf-8?B?K01BV2V6c2dLTGJwMHJCTEVNY1BnRC8rREhHK2tyV0FZS1Qyc2owcDR4TG9N?=
 =?utf-8?B?RFpBSlN5ajAxdTVrY25IajJaZWFkYVRZbm1zNzRTb3hUdHA4ZG80QTYwazRk?=
 =?utf-8?B?amdTemZLRWRXU2NtOExZdGVpdkNnK0J4YmlwdFRFNHBrTFp2eURkWXcyeVZl?=
 =?utf-8?B?T2JuR29xLzFCZVNuUWFKWDlCVnU5dUhzbUd0dDMvNkZZU2FJRW1yV1lEbTNY?=
 =?utf-8?B?WnpCYnRaK2M2TVZuTjV3dnZ0L243RUwrTjFPM2k5UmhrZEFGQzF4OVowczFm?=
 =?utf-8?B?NlVoVWEvYkdPSjlaaFJyOG1qR2RLV1BzVjVNOGdlcU1UaXB2UWlMeWxXa3J0?=
 =?utf-8?B?MWJkN29NYXV5ZlRacm1GM3htSHRRZEtyd1FnNEh5VkNLQmFoRFRNOUNiVkE5?=
 =?utf-8?B?VkpwdWFicm84RlNOTEZhQmZMZmZkVnEzQnJCNStnWFgyWUJnM3BaZk93UFBU?=
 =?utf-8?B?VmVxYnRuRnFCWnJBcW9jRG9jVjNUNzhJdGR5eDJOSmtBL01nWlg2ZkxueDYx?=
 =?utf-8?B?bk9WTDhwTE5jSnVwaXhkeHpSb2VIUHovOEUrTGg1bUk4RlpHM09nNTVuOFRD?=
 =?utf-8?B?RUVRQjZkVUF0dWY5Rkl3czBINjRKS2IzMHJ6QmpkTVo3QW5ieHZvdFZyRGpp?=
 =?utf-8?B?NlNrYnpXR3BsOHQ2STFURWtxR0FFR1NZcWtZYVVkRnRHSXFzMzlCRDdKK2p6?=
 =?utf-8?B?Z2FmOFVzTFBReTRXeVJNbFhBU0FxN2RrdXZvNzJHM0lmeTQrdVhLZDFSOXZE?=
 =?utf-8?B?eFlxVnVDL0w0bTZXakU1V0tPK3dUV0ZxN2w3eHlFdkhIVVlaOVY4OGlacGti?=
 =?utf-8?B?MjdKTjNQUmpadDhmdXIwVWxMMlFVSk5ZQ3BGOEJGVjMrMEgvbStRaFJLZEZu?=
 =?utf-8?B?M0Zyc00ybmhTdFBITTdzUUxEMDNUK2hPeW80TXFTL0N2cVlTeHFxMVY5cUtl?=
 =?utf-8?B?a2srSmpsckRGeEZmdThleVU4ZFRRdXUrQ0t3NEwxdktjQnJlMGsvMjhBbG9C?=
 =?utf-8?Q?bJHW3IKN2bAqrcbNbZXO/ieWZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <026262F9564F7F41A6021F0B8558228C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f268135-c21c-4ee6-ae8d-08dab8ccf040
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 10:12:36.9487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Me7MOoDr+OhsQSuvCfIXQ93R17/G6rg9HaV7QzAHCzKLeAfJLWQ7asQGSLZOcy+JN1M5EMFKMIkweJhOZjZ2KNuCSJh9sJrziMa00e00wf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5021

T24gMjgvMTAvMjAyMiAxMTowOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMjcuMTAuMjIg
MjA6MTMsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToNCj4NCj4gVGhpcyBpcyB2
ZXJ5IHdlaXJkLiBUaGUgZGF0YSBzdWdnZXN0cyB0aGF0IHRoZSBzY2hlZHVsaW5nIHJlc291cmNl
DQo+IHBvaW50ZXINCj4gZm9yIGNwdSAxIHdhcyBOVUxMLCBidXQgSSBjYW4ndCBzZWUgaG93IHRo
aXMgY2FuIGJlIHRoZSBjYXNlIHdpdGhvdXQNCj4gY2F1c2luZw0KPiBzaW1pbGFyIGNyYXNoZXMg
d2l0aG91dCB0aGlzIHBhdGNoLg0KPg0KPiBBcmUgdGhlcmUgYW55IGFkZGl0aW9uYWwgcGF0Y2hl
cyByZWxhdGVkIHRvIGNwdSBvbi9vZmZsaW5pbmcgb3INCj4gc3VzcGVuZC9yZXN1bWUNCj4gaW4g
dGhlIGh5cGVydmlzb3I/DQoNClF1YmVzT1MgcnVucyB3aXRoIHNtdD0wIGJ5IGRlZmF1bHQuwqAg
U2libGluZ3Mgb3VnaHQgdG8gYmUgcGFya2VkIGF0IHRoaXMNCnBvaW50Lg0KDQp+QW5kcmV3DQo=

