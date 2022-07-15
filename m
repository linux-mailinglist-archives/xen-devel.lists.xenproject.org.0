Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D87E576603
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368412.599676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCP7f-0001hm-Vs; Fri, 15 Jul 2022 17:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368412.599676; Fri, 15 Jul 2022 17:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCP7f-0001eo-Rm; Fri, 15 Jul 2022 17:29:03 +0000
Received: by outflank-mailman (input) for mailman id 368412;
 Fri, 15 Jul 2022 17:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xid4=XU=citrix.com=prvs=188d5c0a5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oCP7e-0001ei-U4
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:29:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c1d026c-0463-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 19:29:00 +0200 (CEST)
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Jul 2022 13:28:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6860.namprd03.prod.outlook.com (2603:10b6:8:43::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.26; Fri, 15 Jul 2022 17:28:55 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd46:feab:b3:4a5c%4]) with mapi id 15.20.5438.019; Fri, 15 Jul 2022
 17:28:55 +0000
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
X-Inumbo-ID: 9c1d026c-0463-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657906140;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=mXJLVFrcthD42hxcsZ+JmmHuqPHK0pqLkI928Y/v8uw=;
  b=WT9gA0AZq4vSo+vpRhi2/n6fbyeACj9Ihx+C27gzfQqwRPEn++HI3IQx
   2fEb7CNsdqglj6WfzVeSXNatxGmGEOs9vORGogGYn3YRk9QyR2sddMG2O
   8ZU1b9y81OgzYTtH8YJP+1SFTdFB1UdQa5MOP2CTQr4snyFxZswlCQzYH
   U=;
X-IronPort-RemoteIP: 104.47.55.170
X-IronPort-MID: 75903211
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:EMxiYqgC5MbQlzt1mIcNrsMKX161GBEKZh0ujC45NGQN5FlHY01je
 htvXWnSbq2CYmv8edF/Ptuy9kgDu56Bz4M1HAVq+CxhRCkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaAr414rZ8Ek15Kur5WtD1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4eZbYy6+B+JnN0z
 Mc2KDsXN0C4vfCx3+fuIgVsrpxLwMjDGqo64ysl5xeJSPEsTNbEXrnA4sJe0HEonMdSEP3CZ
 s0fLz1ycBDHZB4JMVASYH48tL7w2j+jLHsF9RTM+vJfD2v7lWSd1JDENtbPd8PMbsJShkuC/
 UrN/njjAwFcP9uaodaA2i3x17eUx3qiMG4UPLiZrdFLhUHP/XU8FhM1dF61ivqSjGfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWblXoVRZEYd0i8cUwFToj0
 wbTm8uzXGM39rqIVXia67GY6yuoPjQYJnMDYilCShYZ597ko8c4iRenostfLZNZR+bdQVnYq
 w1mZgBl71nPpabnD5mGwG0=
IronPort-HdrOrdr: A9a23:pWCG6qgd+xH7+MJKYhpW9QLKd3BQX3Z13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQJVp2RvnhNRICPoqTMyftW7dySaVxeBZnMDfKljbdxEWmdQtsZ
 uIH5IeNDS0NykCsS+Y2nj1Lz9D+qjhzEnAv463oBlQpENRGsddBmxCe2Wm+zhNNWx77O0CZf
 ihD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnX4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlVFtyssHfpWG1SYczBgNkHmpDr1L/sqq
 iJn/4UBbUx15oWRBDznfKi4Xin7N9k0Q6Z9bbRuwqfnSW+fkN0NyMJv/MnTvOSgXBQwO1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRj+UC3fLFuHIO5l7Zvi399AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8vC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eV66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBsPkoLVeL+zNbFwg2HwqT+GLErQI+llluhEk6y5Qqb3OiueT11rm9e8opwkc77mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.92,274,1650945600"; 
   d="scan'208";a="75903211"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWnHC7+Zrrwe7fhHjNRlG1aLvd6UyVS0ILXJ7NR5YzNdE79+vrAVRIbjBYQ2VGgErHdZu+HTG/q+3cRntRnuLofFBGtphGsoqrNn+oH6By/uIH+MpkHLYhr6tl1UlPRqBz5De8CMtPwwu01stqAV0wF9uUtuMOKl6SugNqaBf9YqormkbdAqrRjj1jfZDNKt7KT/Ydk+BelKtGR+t1NfpKgqFJGMj7hMf0etFPSi9EaOKAhaNrVLHUJgO2a+3U8wymKcl9Bv5baXhBBYlcGNQR69f4ARDmODKe7g+DROxtap5Q5Ey5YKSCxSwB+7nOgRlaIvhPBMjLLF57bPg4igww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXJLVFrcthD42hxcsZ+JmmHuqPHK0pqLkI928Y/v8uw=;
 b=FUMwV1BRGzNqa5DWhpbVqH/EL22DkJTyLbciskTBXdYUWnqh7z4cXovhToNQ08PKpORFrBNvEG1L8Pm12hO/tCDYzzL7HIbESVYDeEEv2KzUDaM7iEmGI7iSZz7EjNrh0KR5Pxbynb0NDrLiu515TfnJOcx0fzVT4iPORnEqO6fEEZAh4bbjTwlvepmpskge/HKX85m7UEbqU43Xg0VXaJSXzBObAMayuKrX9fj1LbNmZMX31db0Nv++sG279vI78Jg0yjTQhGUcLfN5y/CyegUTNYO/wWqw/e3qaEmymg1Mw5Xgh+nhva2V/oL7sXAPWydVFonpj8kQflmaMEY2yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXJLVFrcthD42hxcsZ+JmmHuqPHK0pqLkI928Y/v8uw=;
 b=KuOOkQfIJn4obtkHLxXFrGmdPa/RY7kSQk/54nrCyC1K40ZSJzKIJ7bUoDvGqFeqAYhz7VJfV+DtHmQtsPCSCO9avlo8HoXZ3jDIoBEKarP/QisrwSvhP6bDMtorYyeCV7r31zUaEgg2UW2awgpA4JeUQcaQyJX3/yCR627DzpQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Marc Bonnici <Marc.Bonnici@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Xen Memory Sharing Query
Thread-Topic: Xen Memory Sharing Query
Thread-Index: AdiXcIvKzj1u3ooYRvOwLKlCsLdCEAA/89UA
Date: Fri, 15 Jul 2022 17:28:54 +0000
Message-ID: <e9e66c0c-147e-c2a7-b8ad-99a82dc89a61@citrix.com>
References:
 <DB8PR08MB5452C2AEA96D0BB6AECD6618968B9@DB8PR08MB5452.eurprd08.prod.outlook.com>
In-Reply-To:
 <DB8PR08MB5452C2AEA96D0BB6AECD6618968B9@DB8PR08MB5452.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 767b483f-373b-496d-f973-08da66877e2d
x-ms-traffictypediagnostic: DM4PR03MB6860:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Ql2avDDW3V43CYsjcAOpo1GEVMNr3csHw/TNOir3p8TwjHboUepknbfkTjmEWK03aZMm7D1RepUEVEd4XHt0xECrubzccPzW9pdpWwNcuiK7YLVVg28c2mEYvt1hEt241PuyM/W8DJgC779Jyu5YxH7SLV7o+iO+jh7GxOxsfIz4WkA3bTrXUs64W+hkDYcLqMCIjz3zfGlTtJgPD5B1NmYUIto556zpyJmim/yRgQ9YS/oevsm4zZr3dCgwGFzSsLoWPY/Fm9k/gwXz0QpN6mvO+vLZp/2iME2vPvmGDUDNOJqzmiuWAWtkHPfDkb3hnSidZXCBN9Fs0/N6in/xrGvVQ5NLOxlu5B5uC3l4zB9behlsqyNS48PYuOlWbeJM3BqWQh7cGEuAbyd6TbmF38+MbQM1jmAiuRCwTlFIZJ88+/T741Ddv+lovBvkOg38TxdN7Mg3e8jzoN2pZURRG9LEP6C0domlX+RUGwRlLs287dnFomtZDzim0ek7Rs4kZ/lwt+r3LrUc5hdVTNgi9flG3aMGnwdHBTyfrTrvAHU4OTb12t4fQH99sj2TZJQyEPG60f/pZ+/F7jVV+0DdJtX0kpL4BGFdK8b0XW3Jbxp7JUzQuBFGTXWwKCMW7kenX5Z4UBfOgxgMGSJLf+VWpFq2sbkb2LdV83I+FE3PqN8WBm98Z/uulwmVk7WDqg5UrH68CpeaCBjH14Pd8dB9kjy7j3NuK9fHfnOx7blxIMYL3fKFjBAZGAol6p/nTGy6bA8f4R5gK7Fd/NfYTpqiu7j0jyMS1be013QYurkvp20ZtAzzGO5iWp+z8IAoY4HM5eKpT07qAR3GSsnhAS9VJd/axT2nlAvY1BzTaIcX9zr/3QNUOC7MK/0LE+gYwiyPFULRalkvLURDCvPmLcFqLw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(39860400002)(346002)(136003)(316002)(86362001)(110136005)(186003)(31696002)(41300700001)(2616005)(26005)(53546011)(6512007)(122000001)(6506007)(6486002)(966005)(71200400001)(478600001)(38070700005)(82960400001)(38100700002)(83380400001)(66946007)(3480700007)(8936002)(64756008)(66446008)(66476007)(5660300002)(66556008)(8676002)(2906002)(36756003)(76116006)(31686004)(91956017)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d2lZQ0ZZR2RybWNDNlBwZ3pIZlhoaTZEbm5CSjBuL2kwNERPY1RxT01iaTIr?=
 =?utf-8?B?N2R1aGk3R3FHVHE0emhMTlRJOHR5UmEyWko0NTViMHlhUWMvVWRhaEk5UEZS?=
 =?utf-8?B?cXNsYTNJTE84MlN3U2xzdUtOVDVQSUl0NjkwbzNiWGkwUWFnSTJPQ2pMM1BO?=
 =?utf-8?B?UjhHNXlNUjJGT0pIR1plSmtWWFBtOTdjTWZwaytyRWdhbFNEeTY4Sjc0YW5l?=
 =?utf-8?B?OE93a0V2NUowNVVuT1JpcWk2ZXo2MThCRzVKTUQxSzc0b200aTAwV3d0U3dt?=
 =?utf-8?B?ZXlwOFcrU2hxZE1xUjFsZnVJdWlwbWRDclVtclhKRVBZSDhoUXhkU283Wkls?=
 =?utf-8?B?MnFaQ3EvR1hrVjJCc0l1a3VnVldtVFJYRVVhSU1LMjdwOHBBK0c5Q1dNNFBl?=
 =?utf-8?B?QStJeDhKT01TcXVSdmJKMUxKVHRCeVMwYnNsa3p2UUlWVzRqY1M4QUR6NlJ2?=
 =?utf-8?B?bEh3cHIvWVF0VUdJMlBINGsvcE5YWjAvencxTStKUW9RN3RwVjk3c0R6MVhG?=
 =?utf-8?B?NUY5UWU3OFh3MHRxandkYVo4cE9VS1NQK0FMNEhmdUVESHkrZFkyMnJWVXl2?=
 =?utf-8?B?UWRrSEVlQmYyR0pySktFdHBNeWZVZDlGbS9XMUV2UGZqOTN0RHJrL2Q3WVFI?=
 =?utf-8?B?M0p3U1JuMXJwL1Z6ZWtPT3ROREdzeVFqdXBlVng4bVJoZEV5UnpXZG0vZ3pN?=
 =?utf-8?B?cURlM3VIR1ppSmZZMERzVTJrU3lRNVdDV3hIMDN4VWFMd1RwWVMrUnpraUNh?=
 =?utf-8?B?Y254NGNnZzFqYkZlK3ZHaHdPdmMyRnk0L0d2SHRuZFY3VG5KR3ZwYkV0MllV?=
 =?utf-8?B?YlVUOTd2VnE1OFJCRE1vY3B3LzJ3WDZ5OWo0N1g4TktreThQT2d4SWN4TzVU?=
 =?utf-8?B?TW53OWZVVDlldGQ0cmxvaFhxMVJBR2NpL01MZ2xnbTJDdnVobS9MS1hObnlL?=
 =?utf-8?B?dFowdWhGU05sMi92Mkc2ZDdRYXdQT1NzUjVWK0lnSDNKRUZadnFock1UYi8r?=
 =?utf-8?B?dzAyYVllZEpJWlNnbnJRQzhtbitseXlIK1Y3WG1XWGRrVU8va2VlemtHOG4z?=
 =?utf-8?B?dEs2TFBhY1BPTGlFdklYT0hNQnZBK1crNExMeVlsR3VtRHpoVHp2aW1QRmlG?=
 =?utf-8?B?WlVNR0RtOGEvZkJtM1NmdzREOVhEVit4K1I0Qi95Q1NwbnFVa2ljMXV6dXJa?=
 =?utf-8?B?RW4yTmIxdFZSNHhIa055THR0RVhwSDJvaXB5czRWczJGQTNjWDVGc09lMFlR?=
 =?utf-8?B?RS9iNlNOcjRFeWk4OEZrMDdCMDdyOEpNUHhoV2JGdUhNcW5abDYzbGtxNDBR?=
 =?utf-8?B?S1g4YTJsY3VYVk5yTUFDWWZSeEMzclQvcDNzekREZkc0MkVUTkhsYUh4cnM1?=
 =?utf-8?B?UitSb3VYNWZEQmc0dXFNMGdWSURndjM5Q1JndTNVdkpHM3JlRWJMOU1MT3BS?=
 =?utf-8?B?SC9nV1dlSUJKbFJJNWFzQ1pIN0k1QlRpYWIrbGN5eHloKy9hVUUyeVNXVFNm?=
 =?utf-8?B?ZlFCQWpjRER0djlMTWdrVWRKYnMyMmFkYjVIbkp5UUllZmNLWUozVFdFMzR0?=
 =?utf-8?B?Z2FSS3VSUlBRQ2NsdUgwQ2pITFB3cDhTeVY2MFZVYzRNd3hCZ1p5R0FqYTRx?=
 =?utf-8?B?d2tTSlhHTTAxQ0tycHhqcG5XdG8zSEMvK09FR00wc3BWOE50ejgrcUxqcVJD?=
 =?utf-8?B?S3RtbjlTckhUODdpVnFEY3Fudy9abjZabnY0cWtxVmtpTFNyN2hjMjA4emR2?=
 =?utf-8?B?cnpQMW95aVRDZ09WRmlwNG9ZOGRndFdjMHhoR3lFVTBrVDQrbDcxMnJyb1Z5?=
 =?utf-8?B?VjNEazBVSGQ5Qy9hWjhkbmV6SHcyb2NsY01xSit1Wk1HTVRZcTRBUS9UYlBE?=
 =?utf-8?B?UFBnSEpXNFBFaHM5dkJueUlYMkxnUXQxOXM0TzZybzBjVEgvM3ExZmJGZTEv?=
 =?utf-8?B?MlE3T1NmWDV5VEg3K3I5enBCVXlEKzcvWkxrbUNmbGN4T0xRQ2ZZdnJGRFlt?=
 =?utf-8?B?ZDd3Zm4vUG5McFZhOFRhVHBWWDFtNVFaUkdja1JMSFBCR1JVbUwxN3Urd2ZH?=
 =?utf-8?B?L3VuNE1Mekk2bnlVSk5RT2RuVFBIZlo3S29HaWhIa1Y4RDFlWDNvV0RIUjlR?=
 =?utf-8?Q?cZykcoFxUm7uac0hsEdAo1AKo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C488DCD228383E4192BBA6DB2CA600F7@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 767b483f-373b-496d-f973-08da66877e2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 17:28:54.9281
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aofIj2WaChNihqQImngt6h+gKSvcBebge0E6qMOD0f5sumeKcSyVLe61QB96oWHbtgSowSJGbWE7Ov+U27QlnIAAK3zrnCZ1pSJQgGTbEZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6860

T24gMTUvMDcvMjAyMiAxNjo1NiwgTWFyYyBCb25uaWNpIHdyb3RlOg0KPiBIaSBBbGwsDQo+DQo+
IEkgd2FzIHdvbmRlcmluZyBpZiBzb21lb25lIGNvdWxkIGhlbHAgbWUgdW5kZXJzdGFuZCBzb21l
IG9mIHRoZSBydWxlcyBvZiB0aGUgDQo+IG1lbW9yeSBzaGFyaW5nIGltcGxlbWVudGF0aW9uIGlu
IFhlbj8NCj4NCj4gU3BlY2lmaWNhbGx5IEknbSBsb29raW5nIHRvIHVuZGVyc3RhbmQgd2hhdCBy
ZXN0cmljdGlvbnMgWGVuIHBsYWNlcyBvbg0KPiBncmFudGluZyBhY2Nlc3MgZnJvbSBvbmUgRG9t
IHRvIGFub3RoZXIgZnJvbSBYZW4ncyBwZXJzcGVjdGl2ZSwgYW5kIHdoYXQgdHlwZXMgDQo+IG9m
IGdyYW50IHJlcXVlc3RzIHdvdWxkIGJlIGFsbG93ZWQvcmVqZWN0ZWQgYnkgWGVuPw0KPg0KPiBJ
LmUuIEhvdyB3b3VsZCB0aGUgc2l0dWF0aW9uIGJlIGhhbmRsZWQgaWYgdGhlIHNhbWUgZnJhbWUg
b2YgbWVtb3J5IHdhcyBhdHRlbXB0ZWQgDQo+IHRvIGJlIHNoYXJlZCBtdWx0aXBsZSB0aW1lcz8N
Cj4NCj4gQXMgYW4gZXhhbXBsZSBzY2VuYXJpbywgRG9tQSBzaGFyZXMgMSBwaHlzaWNhbCBwYWdl
IG9mIG1lbW9yeSBpbiBhIHRyYW5zYWN0aW9uIA0KPiB3aXRoIERvbUIuIEFuZCB0aGVuIHdpdGhv
dXQgcmVsZWFzaW5nIGFueSBtZW1vcnksIERvbUEgYXR0ZW1wdHMgdG8gc2hhcmUNCj4gYW5vdGhl
ciByZWdpb24gb2YgbWVtb3J5LCB3aGljaCBpbmNsdWRlcyB0aGUgc2FtZSBwaHlzaWNhbCBwYWdl
IG9mIHRoZSBwcmV2aW91cyBzaGFyZQ0KPiB3aXRoIERvbUIgYWdhaW4uIFRoaXMgd291bGQgcmVz
dWx0IGluIHR3byBjb25jdXJyZW50IHNoYXJlcyBjb250YWluaW5nIGFuIG92ZXJsYXAuDQo+DQo+
IEFwb2xvZ2llcyBpZiBJJ3ZlIG1pc3NlZCBzb21ldGhpbmcgYnV0IGlzIHRoZXJlIGFueSBkb2N1
bWVudGF0aW9uIC8gdGhyZWF0IG1vZGVsDQo+IHRoYXQgd291bGQgY292ZXIgdGhlc2UgdHlwZXMg
b2Ygc2NlbmFyaW9zPyBTbyBmYXIgSSBoYXZlIGJlZW4gdHJ5aW5nIHRvIHJlYWQgdGhyb3VnaCAN
Cj4gdGhlIGNvZGUgYnV0IHdhcyB3b25kZXJpbmcgaWYgdGhlcmUgaXMgc29tZXRoaW5nIGVsc2Ug
SSBjb3VsZCByZWZlciB0byBoZWxwIG1lIA0KPiB3aXRoIG15IHVuZGVyc3RhbmRpbmc/DQoNClRo
ZXJlJ3Mgbm90aGluZyBhZGVxdWF0ZWx5IHdyaXR0ZW4gZG93bi7CoCBJdCBvdWdodCB0byBsaXZl
IGluIHNwaGlueA0KZG9jcywgYnV0IG15IGNvcGlvdXMgZnJlZSB0aW1lIGlzIG5vbi1leGlzdGVu
dCBmb3Igc3BlY3VsYXRpdmUgc2VjdXJpdHkNCnJlYXNvbnMuDQoNClRoaXMgYWxsIHBlcnRhaW5z
IHRvIGdudHRhYiB2MSB3aGljaCBpcyB0aGUgb25seSBzdXBwb3J0ZWQgb25lIG9uIEFSTQ0Kcmln
aHQgbm93LsKgIGdudHRhYiB2MiBpcyBob3JyaWJseSBtb3JlIGNvbXBsaWNhdGVkLsKgIFJlZmVy
IHRvDQpodHRwczovL2dpdGh1Yi5jb20veGVuLXByb2plY3QveGVuL2Jsb2IvbWFzdGVyL3hlbi9p
bmNsdWRlL3B1YmxpYy9ncmFudF90YWJsZS5oI0wxMzItTDE4Ng0KDQpXaGVuIERvbUEgYW5kIERv
bUIgYXJlIHNldCB1cCBhbmQgcnVubmluZywgdGhleSBlYWNoIGhhdmUgYSBncmFudA0KdGFibGUu
wqAgVGhlIGdyYW50IHRhYmxlIGlzIHNvbWUgc2hhcmVkIG1lbW9yeSAob2YgWGVuJ3MpIG1hcHBl
ZCBpbnRvIHRoZQ0KZ3Vlc3QsIGFuZCBpcyBhIGJpZGlyZWN0aW9uYWwgY29tbXVuaWNhdGlvbiBp
bnRlcmZhY2UgYmV0d2VlbiB0aGUgZ3Vlc3QNCmtlcm5lbCBhbmQgWGVuLg0KDQpUaGUgZ3Vlc3Qg
a2VybmVsIGxvZ2ljYWxseSBvd25zIHRoZSBncmFudCB0YWJsZSwgYW5kIGl0J3MgYSBzaW1wbGUg
YXJyYXkNCm9mIGdyYW50IGVudHJpZXMuwqAgRW50cmllcyAwIHRocnUgNyBhcmUgcmVzZXJ2ZWQg
Zm9yIHN5c3RlbSB1c2UsIGFuZA0KaW5kZWVkIHR3byBlbnRyaWVzIChvbmUgZm9yIHhlbnN0b3Jl
LCBvbmUgZm9yIHhlbmNvbnNvbGUpIGFyZSBzZXQgdXAgb24NCnRoZSBndWVzdCBrZXJuZWwncyBi
ZWhhbGYgYnkgdGhlIGRvbWFpbiBidWlsZGVyLsKgIEVudHJpZXMgOCB0aHJ1ICROIGFyZQ0KZW50
aXJlbHkgdW5kZXIgdGhlIGd1ZXN0J3MgY29udHJvbC4NCg0KQSBndWVzdCBrZXJuZWwgKGRvbUEp
IGNyZWF0ZXMgYSBncmFudCBieSBmaWxsaW5nIGluIGEgZ3JhbnQgdGFibGUgZW50cnksDQphbmQg
cGFzc2luZyB0aGUgZ3JhbnQgcmVmZXJlbmNlICh0aGUgZW50cnkncyBpbmRleCBpbiB0aGUgdGFi
bGUpIHRvIHNvbWUNCm90aGVyIGVudGl0eSBpbiB0aGUgc3lzdGVtIChpbiB0aGlzIGNhc2UsIGRv
bUIpLg0KDQpUaGUgZ3JhbnQgdGFibGUgZW50cnkgaXMgZm9ybWVkIG9mOg0KDQp1MTYgZmxhZ3MN
CnUxNiBkb21pZA0KdTMyIGZyYW1lDQoNCnNvIGZvciBkb21BIHRvIGdyYW50IGEgZnJhbWUgdG8g
ZG9tQiwgaXQgd291bGQgcGljayBhIGZyZWUgZ3JlZiAoYW55DQplbnRyeSBpbiB0aGUgdGFibGUg
d2l0aCBmbGFncz0wKSBhbmQgZmlsbCBpbjoNCg0KZnJhbWUgPSBmDQpkb21pZCA9IGRvbUINCnNt
cF93bWIoKQ0KZmxhZ3MgPSBHVEZfcGVybWl0X2FjY2VzcyAodGhpbmsgImdyYW50IHVzYWJsZSIp
DQoNCkdGVF9yZWFkb25seSBpcyBhbm90aGVyIHJlbGV2YW50IGZsYWcgdGhhdCBkb21BIG1pZ2h0
IGNob29zZSB0byBzZXQuDQoNClRoZW4sIGRvbUIgd291bGQgdGFrZSB0aGUgZ3JlZiBpdCBoYXMg
YmVlbiBnaXZlbiBieSBkb21BLCBhbmQgbWFrZSBhDQpnbnR0YWJfb3BfbWFwKCkgaHlwZXJjYWxs
LCBwYXNzaW5nIHtkb21BLCBncmVmfSBhcyBhbiBpbnB1dC4NCg0KWGVuIGxvb2tzIHVwIGdyZWYg
aW4gZG9tQSdzIGdyYW50IHRhYmxlLCBjaGVja3MgZS5nLiBkb21BIGdyYW50ZWQgYWNjZXNzDQp0
byBkb21CLCBhbmQgaWYgZXZlcnl0aGluZyBpcyBoYXBweSwgc2V0cyB0aGUgdGhlIEdGVF97cmVh
ZGluZyx3cml0aW5nfQ0KZmxhZ3MgKGFzIGFwcHJvcHJpYXRlKSBpbiBmbGFncy7CoCBUaGlzIHRl
bGxzIGRvbUEgdGhhdCB0aGUgZ3JhbnQgaXMNCmN1cnJlbnRseSBtYXBwZWQgcmVhZGFibHkgYW5k
L29yIHdyaXRlYWJseS4NCg0KTGF0ZXIsIHdoZW4gZG9tQiB1bm1hcHMgdGhlIGdyYW50LCBYZW4g
Y2xlYXJzIHRoZSBHRlRfe3JlYWRpbmcsd3JpdGluZ30NCmJpdHMsIHRlbGxpbmcgZG9tQSB0aGF0
IHRoZSBncmFudCBpcyBubyBsb25nZXIgaW4gdXNlLg0KDQpEb21BIHRoZW4gY2xlYXJzIEdURl9w
ZXJtaXRfYWNjZXNzIHRvIG1hcmsgdGhpcyBhcyBncmVmIGFzIGludmFsaWQsIGFuZA0KY2FuIHRo
ZW4gZnJlZSB0aGUgZnJhbWUuDQoNCg0KTm93LCB0aGF0J3MgdGhlIHNpbXBsZSBvdmVydmlldy7C
oCBUbyBhbnN3ZXIgc29tZSBvZiB5b3VyIHNwZWNpZmljIHF1ZXN0aW9uczoNCg0KRG9tQSBpcyBw
ZXJmZWN0bHkgZnJlZSB0byBncmFudCBhd2F5IHRoZSBzYW1lIGZyYW1lIG11bHRpcGxlIHRpbWVz
LsKgDQpEb21BIGRvZXMgdGhpcyBieSB3cml0aW5nIG11bHRpcGxlIGRpZmZlcmVudCBncmVmcyB3
aXRoIHRoZSBzYW1lIGZyYW1lDQpmaWVsZC7CoCBUaGVzZSBncmVmcyBjb3VsZCBiZSB0byB0aGUg
c2FtZSwgb3IgZGlmZmVyZW50IGRvbWFpbnMsIGFuZCBjYW4NCmhhdmUgYW55ICh2YWxpZCkgY29t
YmluYXRpb24gb2YgZmxhZ3MuDQoNCkRvbUIgaXMgcGVyZmVjdGx5IGZyZWUgdG8gbWFwIHRoZSBz
YW1lIGdyZWYgbXVsdGlwbGUgdGltZXMuwqAgVGhpcyBpcw0KYWN0dWFsbHkgYSBuZWNlc3NpdHkg
Zm9yIHg4NiBQViBndWVzdHMsIGJlY2F1c2Ugb2YgaG93IHdlIHJlZmVyZW5jZQ0KY291bnQgcGFn
ZXRhYmxlIGVudHJpZXMuwqAgSXQgaXMgbm90IG5lY2Vzc2FyeSBmb3IgYW55IGtpbmQgb2YgZ3Vl
c3Qgb2YNCkhWTSBndWVzdCAoeDg2IG9yIEFSTSkgYmVjYXVzZSBvZiBob3cgZ3Vlc3QgcGh5c2lj
YWwgYWRkcmVzcyBzcGFjZSB3b3Jrcy4NCg0KSU1PIGl0IHNob3VsZCBoYXZlIGJlZW4gcmVzdHJp
Y3RlZCB3aGVuIHRoZSBIVk0gQUJJIHdhcyBkZXNpZ25lZCwgYnV0DQphbGFzLsKgIEluIHByYWN0
aWNlLCBYZW4gaGFzIGFuIGludGVybmFsIHJlZmNvdW50IHdoaWNoIHByZXZlbnRzIGEgZ3JlZg0K
YmVpbmcgbWFwcGVkIG1vcmUgdGhhbiAxMjcgdGltZXMgSUlSQy4NCg0KV2hpbGUgYSBncmVmIGlz
IG1hcHBlZCwgZG9tQSBpcyBub3QgcGVybWl0dGVkIHRvIGVkaXQgdGhlIGFzc29jaWF0ZWQNCmVu
dHJ5LsKgIERvaW5nIHNvIHNob3VsZG4ndCBjYXVzZSBhIHNlY3VyaXR5IHZpb2xhdGlvbiAoWGVu
IGhhcyBhIGxvY2FsDQpjb3B5IG9mIHRoZSBlbnRyeSBpbiB0aGUgbWFwdHJhY2sgdGFibGUpLCBi
dXQgd2lsbCBhdCBsZWFzdCBjb25mdXNlDQpkaWFnbm9zdGljcyBvZiB0aGUgZ3JhbnRlZCBzdGF0
ZS4NCg0KSW1wb3J0YW50bHksIGFuZCB3aGF0IG1heSBjb21lIGFzIGEgc3VycHJpc2UsIGlzIHRo
YXQgZG9tQSBoYXMgbm8gd2F5IHRvDQpyZXZva2UgYSBjdXJyZW50bHktbWFwcGVkIGdyYW50LsKg
IEZpeGluZyB0aGlzIGxpbWl0YXRpb24gaGFzIGJlZW4NCmRpc2N1c3NlZCBzZXZlcmFsIHRpbWVz
OyB0aGVyZSBhcmUgc29tZSB2ZXJ5IGNvbXBsaWNhdGVkIGNvcm5lciBjYXNlcywNCmFuZCBJJ20g
bm90IGF3YXJlIG9mIGFueSB3b3JrIGhhdmluZyBzdGFydGVkIGluIGVhcm5lc3QuDQoNClhlbiBk
b2VzIGhhdmUgbG9naWMgdG8gdW5tYXAgZ3JhbnRzIG9mIFZNcyB3aGljaCBoYXZlIHNodXQgZG93
biAoZm9yDQp3aGF0ZXZlciByZWFzb24pIHdpdGggZ3JhbnRzIHN0aWxsIG1hcHBlZC7CoCBUaGlz
IHByZXZlbnRzIGRlYWRsb2Nrcw0KKGUuZy4gdHdvIGRvbWFpbnMgZ3JhbnQgdG8gZWFjaCBvdGhl
ciwgdGhlbiBib3RoIGNyYXNoIGRlbGliZXJhdGVseSkuDQoNCg0KRnJvbSBhIGdyYW50IHBlcnNw
ZWN0aXZlLCBYZW4gZG9lc24ndCBlbmZvcmNlIGFueSBwb2xpY3kuwqAgZG9tQSdzIGdyZWZzDQpj
YW4gYmUgbWFwcGVkIGluIHRoZSBtYW5uZXIgcGVybWl0dGVkIGJ5IHdoYXQgZG9tQSB3cm90ZSBp
bnRvIHRoZSBncmFudA0KdGFibGUuDQoNCklmIHlvdSB3YW50IHRvIGdldCBpbnRvIHBvbGljaWVz
IHRoYXQgWGVuIG1heSBlbmZvcmNlLCB0aGF0IHdvdWxkIGJlIGENCmRpc2N1c3Npb24gYWJvdXQg
WFNNLCBYZW4gU2VjdXJpdHkgTW9kdWxlcy4NCg0KRG9lcyBhbnkgb2YgdGhpcyBoZWxwPw0KDQp+
QW5kcmV3DQo=

