Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3499A51464B
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 12:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317158.536365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNZ9-0007LL-GZ; Fri, 29 Apr 2022 10:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317158.536365; Fri, 29 Apr 2022 10:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkNZ9-0007IM-CR; Fri, 29 Apr 2022 10:09:35 +0000
Received: by outflank-mailman (input) for mailman id 317158;
 Fri, 29 Apr 2022 10:09:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4Mb=VH=citrix.com=prvs=111705440=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nkNZ7-0007IC-MK
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 10:09:33 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75f2694c-c7a4-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 12:09:32 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2022 06:09:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MWHPR03MB2960.namprd03.prod.outlook.com (2603:10b6:300:11a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 29 Apr
 2022 10:09:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5186.026; Fri, 29 Apr 2022
 10:09:27 +0000
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
X-Inumbo-ID: 75f2694c-c7a4-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651226972;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=v4aGH0LY7DSQXbQ4BBcNhOcB0d8ZThMhBieDrvBzbmI=;
  b=GsTGmA0RYPnTlQ4gSk43TnQ6NcN2XizBmEsJf3b5V52BJ+/RLwlGCxaD
   F6kNyEMTbyF1t0uFifU3i5frLhkjZqcteYEnvSml35WYOykBTlGM1qfjw
   9ZjWYixOQHT26+3j4G27GLHaNKL2Kg06Nmen4dideQlLoguRFdZ/IgbhG
   8=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 70240214
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gvE706A7sD9ZtBVW/1riw5YqxClBgxIJ4kV8jS/XYbTApDkhgzwOm
 jcWWTrUOP2PYTfzeo1/Yd+0/RkDvpDSyNM3QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHGeIdA970Ug5w7Jj09Yy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhcz
 8pmibeWTz4HJ4bivqcBDxJgOnBHaPguFL/veRBTsOS15mifKT7A5qsrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t3B8mdE80m5vcBtNs0rulIEezTe
 Iwybj13YQ6bSxZOJk0WGNQ1m+LAanzXLGUC9ArP/PZfD2779AJAz7ayFNrpJfuRaMlwp0yG/
 m/G4DGsav0dHJnFodafyVqujOLSmSLwWKoJCaa1sPVthTW72Wg7GBAQE1yhrpGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM+e8CMU/4QCJj6bRvQCQAzFeSiYbMYJ28sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP45eEJpprUZwQ3N/
 g0=
IronPort-HdrOrdr: A9a23:+1so76sl9nQylxJyTuQMR4bl7skCJoAji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6H6BEGBKUmslqKceeEqTPiftXrdyRGVxeZZnMXfKlzbamHDH4tmuZ
 uIHJIOb+EYYWIasS++2njBLz9C+qjHzEnLv5a5854Fd2gDBM9dBkVCe3+m+yZNNWt77O8CZf
 6hD7181l+dkBosDviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY9g12aUIN/Z4StU
 z+1yDp7KSqtP+2jjXG0XXI0phQkNz9jvNeGc23jNQPIDmEsHfrWG0hYczGgNkGmpDp1L8Yqq
 iLn/7mBbUr15rlRBDwnfIq4Xi57N9h0Q649bbSuwqfnSWwfkNHNyMGv/MYTvKR0TtfgDk3up
 g7oF6xpt5ZCwjNkz/64MWNXxZ2llCsqX5niuILiWdDOLFuI4O5gLZvtX+9Kq1wVB4SKbpXZd
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDQhpnFoifA3jzMF7tYwWpNE7+
 PLPuBhk6xPVNYfaeZ4CP0aScW6B2TRSVbHMX6UI17gCKYbUki94aLf8fEw/qWnaZYIxJw9lN
 DIV05Zr3c7fwb0BciHzPRwg2bwqCnXZ0We9iif3ekPhlTRfsuaDcTYciFeryKJmYRtPuTLH/
 CuJZlRH/jvaWPzBIch5XyLZ6Vv
X-IronPort-AV: E=Sophos;i="5.91,298,1647316800"; 
   d="scan'208";a="70240214"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfQxH6pEdWSYqxMJOQnXqUr2g6ojscb8btb+cOxjaNrRRc6B9hvJqWafXI8hVeJeejaYdKyoRRH6ZgG/Rl0Ne+MCrzi7giu2YngrMnZo+//ZZoFxdChL/a2OI7RoyaqgC8z3l582YD4h6gRScATS/fttUSD7D42zj0ZsLoWf/JkKVQrBchZd/S81Q3hOX587AMxki+pAJN1Dc1/6kSvrtGCyec8vG6XxrKOr57eTgzcsZ48cANBT5pBy23zIXWpTeULCyjkhzx0S0XbTHsjn5UUBE3zJprDoTTF1WssB2RblA3EYmnVK4Mt2L625LfkI7DuVfFxHoo2YmdubI/MB/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4aGH0LY7DSQXbQ4BBcNhOcB0d8ZThMhBieDrvBzbmI=;
 b=jjebge+MZtres0tXQu+NQQ1wEwAFWNPFQtJsMj/7hs2KP0Yy1W93CtuHceTNxKq3/xqFqfR62KLkRL9rVGfDn0lRVna46lbJNMinFqIHUpB5E67xaYqGILDUlR45DFuYVUO6ZeZHNcrq7rbOKPKpr/FotGPFGpuHwX1OIL8zd4OWf+1CIm4+83TXyAyNyStGHYDwQKCJ8jLI8wXF/kUY1PsOCGOZe3stGgWRnIxyWXorgTAhA7G+xmB9smujzCgo+ZkrvqwT1njuMk8OdOn7VwrQN5z3uXiG438LU4tAL4jQZvnZyyZErFOtR/fLowix1779DsezHeRA8U6YYxnnxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4aGH0LY7DSQXbQ4BBcNhOcB0d8ZThMhBieDrvBzbmI=;
 b=w4sPz0fGlzN76NU23N7J4f6HtUHn09NMjWwqs6GI1ieT/Msvcs0ATDOfQ8p94ERkEcH4H8DHjFCGcyaNnfME/W8T8dh6pb5h4vvFEBwY4RQ8RHZQp0sG3j3u3BM6USNGfFI7wx//s7qOhkzSdbi+qt9Ake5BpLe/lCU7Svay4KY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/cet: Support cet=<bool> on the command line
Thread-Topic: [PATCH] x86/cet: Support cet=<bool> on the command line
Thread-Index: AQHYWt1N9h0ywB7VLke90Ph7I2J/jK0FG36AgAGRL4A=
Date: Fri, 29 Apr 2022 10:09:26 +0000
Message-ID: <47e0a51e-e443-9ac6-fd22-33adeca4ee86@citrix.com>
References: <20220428085209.15327-1-andrew.cooper3@citrix.com>
 <d23258dc-3837-ebe4-26b1-75b0f32477e9@suse.com>
In-Reply-To: <d23258dc-3837-ebe4-26b1-75b0f32477e9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d745954-5228-4460-93e5-08da29c857a0
x-ms-traffictypediagnostic: MWHPR03MB2960:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs:
 <MWHPR03MB2960A4FD4E8BE07D72EAE81DBAFC9@MWHPR03MB2960.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 akX3xa5QA/tDu3YOXNX8VWh/g5TkMT0jRwlhzUCUwV1Y0UuxWbpMf159+82LMq8BTqoipIY7PQJVDcQtDksy8SSa0rok2wpxEP5gqROy14oDg5K8j4qrGI0kZSS1rEe3O3SgX0CuXMhxS4exW6jyiczQCNLKfxb2Y74dxe9bW1RsPKAJYs6QqEaAZXV/dYEckMOX5qO9A+4LWAdToLyY4Z5wNQtiBpfhRcUNKoOZ712/oNjKpy9IkWI7Vdrf9Gl+awbrdPMVTl7H6y/0yatbYA+C6Jp81OQWbe3uujDujjwn12BVp/eveJtbBAvlayS0n88teSyyX208qAKJsOPagw9U5j0/TVtdmkLviufIF1tfVBpYqo5OtduO6roQ/KtHBuL4s7ZOUykiha314Jyg83P0K3y4uIItuie5JwTfGOb2O13IXuYMVAMJLXKiHegnVLHRljDk/P4spIm60mH5KEaVMAcmjLkvAW6kLtJ4sIhw+kaVgfx36L6r5mGApqBO5DAFVPI3ewIIDU81APEWLC8ZdFbWkvZ5tHFV0XVlcWlF9PK5VM+r9/AdX0+L7GBICDZQWm5xvqXa9uH+y+epo/Fbm79gl4qh4Oz8jz9RqSVH5GwMH8b4bXm+O/v0o0FLUGE/9XhArOV1Cg8zwphk6ySaOdgIIMannXNMF9xE3wn1LDwzrNGNGJmsNiv1G/sdvUyBXFBcQt43Rz8X0hEhf7fRoj+fSkEKQsEZMH1OoiwLa1IuIaegeJv2rR5OquMt9LemYDi9//gh4XJDUIjZqQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(38070700005)(66476007)(66556008)(4326008)(66946007)(76116006)(6506007)(31686004)(53546011)(36756003)(31696002)(64756008)(6486002)(186003)(8676002)(91956017)(66446008)(71200400001)(54906003)(4744005)(6916009)(6512007)(2906002)(5660300002)(508600001)(316002)(86362001)(8936002)(82960400001)(122000001)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1dQZGNvODRaQUZkRDBYYVN0TW05UllMVUtSTXFIR2VzSStnUXBhRlozOVlm?=
 =?utf-8?B?UzFKV3dVRnZ1MXBQN1JwOGNvVjUyM0ExVWx3NWI5RFNTUDl3bmY5UWpSQ1Jx?=
 =?utf-8?B?dVBSa1BOZWZOdVpkdUVFTnhWWXR1UTh6RWtIM2ZuT2FUYlVhR2dLblhzZDND?=
 =?utf-8?B?djROSU9QSFRCZ0pwUlY5Vm4zcFUyM09tYnByUTd2c3BmaWptdGJtTjAwMXRP?=
 =?utf-8?B?YWdtbnNhYWJQMzNFSnpVOWJVWk9Ecm1GMGc2dkpRL3pEcEd0Uk16amxHTFcy?=
 =?utf-8?B?eVM4RVMrQ1FrODVFOEVIaGdJdEJMQ2tBSE1yVXFoMlFOaTZONlVpeWpQcmcr?=
 =?utf-8?B?SzVjdDVHZXovdXB3RHZTSVQ4elRjZlZrb29uWlhRZ2VOdkQvSWRjTlRheFdX?=
 =?utf-8?B?VEw3ZmFiOTZTdTc0NkhzZzZzNmQydnlnRzVwSWh1K1VtTk5Ub24zbk8rV2Fr?=
 =?utf-8?B?d1QzeUJVOGZJVE9HcEZQc1A5ciswYmJmbzRjbm5wNTlBV21CSitvYWtTVU40?=
 =?utf-8?B?emE4OG5qSEk0QVFDa28rdlRneUNMeHo1aTlaelFsT0ViK21Bb2dGQXB4K3BE?=
 =?utf-8?B?dzZPbDhETHp4MTNEY2tmWnRYUkVBcTZOOW15YnJNa3VaVzAyR05STDhxS0tL?=
 =?utf-8?B?UkZMcFhIU3NiTldBNjZ6NHVOcys5b1F0RjVlRXdUMEdJV0F6ZDZ3eWZOUDdB?=
 =?utf-8?B?bEZQUXNrcy9yK3I1TUEvRkI1c1NrQzBFNEhtNGVIVGpmMG9IbndkcHhiWjRh?=
 =?utf-8?B?QmJhajgxTDVsRndZcW5oZGh1aEVxTEduTlBGbXh1dnRjRVBqS21RL3NybVNq?=
 =?utf-8?B?NHZPeTBjRWFmNzJDL1M3dlpvSi9TdDNRd0VpcGt0eGZSclU2KzlqZUswQTFs?=
 =?utf-8?B?ZUR2MmV2ejN2OExndkYxdGVET3FTaGdJWVBmV2tMNUdMazFWOW53ZmZObzNN?=
 =?utf-8?B?bE1pNTdqTVA5dHdwSUZnQ0lqV0EvTzAwY0pBWGd4ZDdaUlVlUmJTMCtuZzlu?=
 =?utf-8?B?S1RreXgwRGFybTRVSFpHam0yU3ZJbnFjTGZ6RWQ2Zk5oeHJoYW9OL1ZFWjNK?=
 =?utf-8?B?ekxGRmhwK1BpaTBpSEt2Z2IxMmdRYmdrWFVzaGQ2RS8vMmh5cksyRktaYS9j?=
 =?utf-8?B?TlJ4b3lLZUJHM2g5enNmSnBqSGc4U3o3b3hxYVcwSWE3QzlCZTlGamUzQ3Rh?=
 =?utf-8?B?bUNhdUVXU2U5U2U3MlRRQ2FOZ2FVekU4QXlXRGh6RE81cGZuSVJFcE5QVmpK?=
 =?utf-8?B?STFkMGNGRXVtNmNpQlUzNW1GRkJBTDdNV2t0cWNPakNHRk9nTzZlVC9xMW9T?=
 =?utf-8?B?L0xsUmNPdFBPQVhrS3N5NzVvaWJ4aVpEUEs5UVpzdTR2WnA3RXIzMVRrSXow?=
 =?utf-8?B?d1dDeGZIOW5vV0pTWWsvSURoVE1aZWMwV0ZjMWw5eEJ0NFFoQVFQb294THJV?=
 =?utf-8?B?eU9MTmFmV1RveldGRlZ6NDZtdzdDbzNQZ3UvcFA4eDdTRzB0Yjg0cEd1cEw3?=
 =?utf-8?B?VGRQMTNMNG1MbEpNVXJRNFJtTXR5d0c3SDBKNDlDTERTMVhIN1hXNGgxQVBR?=
 =?utf-8?B?SHl2NmZLWXRWUm5Zd1NUdDVjUHJVZk1haGx5dGI0YVhCbDJ1aFN1ZHpLNk8w?=
 =?utf-8?B?VlR6aE50cHRJWTdQdGpuTTB4SkhvbmZWYkNtMHhVeWxxR09Kb3hOTFBsS01j?=
 =?utf-8?B?amFqNnFGU2lzQlg1MHFyVS9OYnV4M1A5U01YYktrUnp1VXZheFR5cHhxaDkw?=
 =?utf-8?B?dm9aZEI0WUs3N09qZnNPTmxqYUJYdXRLUVNwOWpGT1RuWUI5RzhDcW5RZktk?=
 =?utf-8?B?UWkvbXhuUWxEb04zZGNwekszZC9YODd2WTMvalVPb1pDcUhPRG1QWTRTUWRa?=
 =?utf-8?B?L24xSkZ0cmZsWjdibzNkYlA3Qk9Fc0RhNng4cGdPcFdFSTIzYWdZUnc5QmFK?=
 =?utf-8?B?WmFwK0lxQlM2N3M2bUZkZFdPYVBYWWFGZENqTEdPVjh5Q2VTNlM5Y09wL1F1?=
 =?utf-8?B?OXgyenljR3E1eDFHa0tmU0JERTh3WE15UjROeGtwVDIyUlN3bHRxRjBiRFRQ?=
 =?utf-8?B?N014YlIvVlVkckI1WE9xcEdqUVVZMmpDTUJYZnhwOFIvcFZPc0Nsc1hqOE9q?=
 =?utf-8?B?aTRaM01IcXdINllBMDc3RFVoaXRZNlBneGhDVE1Ia2hqTWROUEZRcW9MVndE?=
 =?utf-8?B?Tk5oZUlOZTlLZDFuZ2pibmVxNTNjZXdvWTdoUUpIZXNFMHRlZVZYVGFtTGhu?=
 =?utf-8?B?R2ltM0lmaUZHZWluZ093cUtTZ3VzSTVhZ1dVY0dLMnNqRmtyZFpGSkhMWFN0?=
 =?utf-8?B?V2tmZlF4Y3JYVFFyaGlEVnorSE05eWN4NERsaFlPOUdJMTlxYWhOdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F9EB8C34F3EEC46A766412490FC3D91@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d745954-5228-4460-93e5-08da29c857a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 10:09:26.6060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ttLP/fzpj+6uzhOskCkc2aYFg2fiUKKMe2Tv4yWTKxqHq/L8gY6kWaZPNE8CTJ6gtz7TJZ6++oKnoswF7omcbZVZT14YVGA0fRei510a16A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2960

T24gMjgvMDQvMjAyMiAxMToxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDI4LjA0LjIwMjIg
MTA6NTIsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBAQCAtMjgzLDYgKzI4Myw4IEBAIENFVCBp
cyBpbmNvbXBhdGlibGUgd2l0aCAzMmJpdCBQViBndWVzdHMuICBJZiBhbnkgQ0VUIHN1Yi1vcHRp
b25zIGFyZSBhY3RpdmUsDQo+PiAgdGhleSB3aWxsIG92ZXJyaWRlIHRoZSBgcHY9MzJgIGJvb2xl
YW4gdG8gYGZhbHNlYC4gIEJhY2t3YXJkcyBjb21wYXRpYmlsaXR5DQo+PiAgY2FuIGJlIG1haW50
YWluZWQgd2l0aCB0aGUgcHYtc2hpbSBtZWNoYW5pc20uDQo+PiAgDQo+PiArKiAgIEFuIHVucXVh
bGlmaWVkIGJvb2xlYW4gaXMgc2hvcnRoYW5kIGZvciBzZXR0aW5nIGFsbCBzdWJvcHRpb25zIGF0
IG9uY2UuDQo+IFlvdSdyZSB0aGUgbmF0aXZlIHNwZWFrZXIsIGJ1dCBJIHdvbmRlciB3aGV0aGVy
IHRoZXJlIGFuICJhIiBtaXNzaW5nDQo+IGJlZm9yZSAic2hvcnRoYW5kIi4NCg0KSSB3YXMgZ29p
bmcgdG8gc2F5IGl0IHdhcyBjb3JyZWN0IGFzIGlzLCBidXQgaXQgdHVybiBvdXQgYm90aCBhcmUN
CmFjY2VwdGFibGUuwqAgInNob3J0aGFuZCIgaXMgYm90aCBhIGNvdW50YWJsZSBhbmQgdW5jb3Vu
dGFibGUgcXVhbnRpdHksDQphbmQgYm90aCAic291bmQiIHJpZ2h0Lg0KDQp+QW5kcmV3DQo=

