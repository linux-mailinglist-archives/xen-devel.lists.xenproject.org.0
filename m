Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F19D93321FF
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 10:31:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95278.179801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJYhl-0004J3-N3; Tue, 09 Mar 2021 09:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95278.179801; Tue, 09 Mar 2021 09:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJYhl-0004Id-Jk; Tue, 09 Mar 2021 09:31:05 +0000
Received: by outflank-mailman (input) for mailman id 95278;
 Tue, 09 Mar 2021 09:31:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBbt=IH=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lJYhk-0004IW-40
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 09:31:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1b16599-24d5-4f79-bbab-808a529c4fef;
 Tue, 09 Mar 2021 09:31:03 +0000 (UTC)
Received: from AM6PR05CA0016.eurprd05.prod.outlook.com (2603:10a6:20b:2e::29)
 by DBBPR08MB6187.eurprd08.prod.outlook.com (2603:10a6:10:209::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Tue, 9 Mar
 2021 09:31:01 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::75) by AM6PR05CA0016.outlook.office365.com
 (2603:10a6:20b:2e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Tue, 9 Mar 2021 09:31:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Tue, 9 Mar 2021 09:31:00 +0000
Received: ("Tessian outbound ef5d1dda26b7:v71");
 Tue, 09 Mar 2021 09:31:00 +0000
Received: from 3597a2845fc9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 687FCC7A-046E-48F1-909C-DF892C5B649E.1; 
 Tue, 09 Mar 2021 09:30:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3597a2845fc9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Mar 2021 09:30:54 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3309.eurprd08.prod.outlook.com (2603:10a6:803:41::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.28; Tue, 9 Mar
 2021 09:30:52 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3912.027; Tue, 9 Mar 2021
 09:30:51 +0000
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
X-Inumbo-ID: d1b16599-24d5-4f79-bbab-808a529c4fef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0fRbCNFTtVArDKOiyLJMs/Wyh2MBw5YmDDsro7bUTQ=;
 b=aH8r8Hifuzk+buCvqmx52u7+JPQOhJBy4oq/Iq/CMFPsMBMjWC37ivo4F39TI4XgPSIoBAY6VXY32Ifby5LF4+oDS+bPhdMe3ZvcLgEUe838MkM6CgIgQYpmN6IhFCwBeK+I0k33aWyjL+fZReE/o78azUN14FBYpQyLVDFZhts=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0cefcb835c940aa6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SRWLKVFSmxIxH4xwSmpNu6NRSQHYliG3CWRswP2Ca2rkx1avRvnvxQsN+wLCbPx2kETPyriB3dpRA8ex72A1dYLkodaXUi5Pc1jvR2dNl/zHLp7sXnLqqzNMc9pHBi+pasZEQrOm0t1OzWznrqMcBaCNZU99xzLctTBG7aSJ35DGEBf3HY/qliqvpOOGlHy3WZ+HkwgL+4qVqWJN72CYdtrVLbRWUeDPBQeG53kkZEu0hBClmySjER+r2F8DV1w0v/32yzF4NdU6x6Ni6CsrrDAB3weV24EdxnZT5lEoqwUD1ze6Ba3buAr6dY4cHxwijF/vHyjJEhAK+BrVaiqL9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0fRbCNFTtVArDKOiyLJMs/Wyh2MBw5YmDDsro7bUTQ=;
 b=Do5UGpGmPAA3G4z7eahlc4YI1Ru3oKwTeBUp7ZcFFx5HdOaLUYua5BGCQ31tdOoE3bx5/NzuCjt8yElKU3z/idxtLYDDU85oDmCpgG2ca1iAzSbB6/e1kAGjvxLi+ZilWpsMyjzWna3ReksASykQdg00FwkEkLRhWOlm6+SD+VQ+eCvR85S7C4dkQuXm/guDLnBmzZyz9cAOz8xCWaxOPvxLd0oNb3cxN1uzU1eXBzAIo3aiwnXp22NQTh6iC4OIlmluNGjZEpBGBcikhcRkK0lqv4XTUPHWET/k464bOAq6TzrOlK4mWXJOwkmeys6pMYiPUh8LTyneo8Ocez7gBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0fRbCNFTtVArDKOiyLJMs/Wyh2MBw5YmDDsro7bUTQ=;
 b=aH8r8Hifuzk+buCvqmx52u7+JPQOhJBy4oq/Iq/CMFPsMBMjWC37ivo4F39TI4XgPSIoBAY6VXY32Ifby5LF4+oDS+bPhdMe3ZvcLgEUe838MkM6CgIgQYpmN6IhFCwBeK+I0k33aWyjL+fZReE/o78azUN14FBYpQyLVDFZhts=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Use register_t type in cpuinfo entries
Thread-Topic: [PATCH] xen/arm: Use register_t type in cpuinfo entries
Thread-Index: AQHXFFQNaLCX4oSw+0OC1jGtjtl2z6p7ZSKA
Date: Tue, 9 Mar 2021 09:30:51 +0000
Message-ID: <62BD194F-C673-42CD-AEA0-BE4AFA21849E@arm.com>
References:
 <b65f29a67f87de8b25cd23b5fa111c50a2efb1d0.1615209093.git.bertrand.marquis@arm.com>
 <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
In-Reply-To: <712d7c6a-3ace-a6b7-a188-faeb4f1258d3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [2a01:cb10:335:200:3195:51a5:b958:cac1]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ecca6e50-48ee-4dd1-687c-08d8e2de0d45
x-ms-traffictypediagnostic: VI1PR08MB3309:|DBBPR08MB6187:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6187E0F5847194F362DC34D29D929@DBBPR08MB6187.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GNoBPgk3GKBWD4fk5YPla4yCUhDHsG9BsczkYCQUQi1nqhIaWWwXjV4T0oMO58f3F2sFd/ozFd8KCJBE/0+LkHgYBmhmXdV+7unzRu9/DfcsC+MvRtPuP1/22yS97QEPjSr47HDzci4JM7GeLPJsxILnDpCLekk5j0/E8qr/oWnuOV5aiTuxsh2bygCFc5ZxmM7PZa22B88uUNoOck5eX2kgWX41Ej/2Ijc6Sb3H2LFOqkSA5pSyKgkDfvSa6SL+2ArsUA52WkV+Z1NHi8HpJcEiqCWu4QJj6c6V0gM6pYnjnoj+LCM8IYX5wUZ0QIXcqYbx9aOuM/CZJ7wja95K1JBnH0TkwvEUGPtiqEzsaZxaK7FmFvbD5e19kv5TExeKfcof3JhKVTnK97FoXvAt8WhFCev1N3hjl1i3w66nCPzvF7sb12sVHiJ2hPJO9O3RAS0rkAcl9/r9hV6VOSn5uwx3xuqStNHzd+IceAmixjtgT/z0eSmHFNNIsphQUBZzAP8nRRXZgv2MEN+v0+gfPGIM3maoL8vHWdey5JcbHoSAR7k6aChiV02Ln3M2s6sKEaweEB5Qs8U4usCNUEXVHg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(2616005)(6916009)(8936002)(66556008)(66446008)(64756008)(6506007)(6512007)(2906002)(5660300002)(91956017)(478600001)(8676002)(53546011)(4326008)(71200400001)(86362001)(66946007)(54906003)(76116006)(83380400001)(33656002)(316002)(6486002)(66476007)(36756003)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?OWhodXZpM0NhYm5RYjRWeTNKUnJTUUJCZkxZeWNHZ1V6QlhvazJrL2g3cXBl?=
 =?utf-8?B?TFJHSStNRzVGaHdqT2xRVVNJUks1VzZQMys4ZUQvUnZmdmZOYkhCTnZJYVNI?=
 =?utf-8?B?VXBGL2xlRWtQWjJsZUdZVThrK0RkR0J6UVNBUFR0TDl2N09ZOHlxYUROYTZh?=
 =?utf-8?B?MWNjbUZ1M0J3WkZZTFhjb3I3dHJRMHhoaW5rTE1YU2cxc2NjOVlaNTlkRWZs?=
 =?utf-8?B?MkNtYVpsc3lIV3VjM29nSWYvTXFjUmhOaWdjSGZ5T21UT1VKZ3NmcUhBYzBz?=
 =?utf-8?B?Y0dNVlorcWxWQVA1SVpjSTR1REF3RGlrc2ZIbjd1RXlZVWFPUUxDMW5HVU5t?=
 =?utf-8?B?RFFiOEJ0Y3lXbVlPMSsxVVZBbnNhQWFGdWs3SERDb2ZlaEpCZTMvTFRzR0kz?=
 =?utf-8?B?SytURVhONGlrUGhEeG1YNVhBbXdPZ0wwU2lCVjRLUWVITkhXekI5cDRHM1ly?=
 =?utf-8?B?RFVBUFdYOXZVZzUyOUZNYnR5RnZPTVN2NjVxYUpuZCtZUGZWYUJtZmMzQTNZ?=
 =?utf-8?B?ZVY1SjN1WFhWcks1NnRpUjZseDZSY2JYWDNxNCtTNzM3SFZ4U28vTnRNbGRB?=
 =?utf-8?B?UUpMQit6SURpMFpOS085SUlLdG5YcmZRTFdDTHYxVEFBS0p3eVNYRHYyNmg1?=
 =?utf-8?B?WWhDaWRFaWQ1Yk5DY0t2VWtRbW5nbjlUNndaQmpXYjZ4K0VtVExGNjdjOE5k?=
 =?utf-8?B?RDRjamlwMzRXRk5mZ3hvRUE2dmRVWjRoMEJ5ZkE1dmVyLzhieW1kdEdqTmNH?=
 =?utf-8?B?aG1oOURKd1N6ZGRlUGxGSlVUS1VzVjNUeVdlM3VFYkNGRDhrbXVyMWtCYXFo?=
 =?utf-8?B?SkFnS0FqZ2I3M1V1Z0hnOU9vNExHRERFeUF5U2x0L2tqenhWRU1RT28reWkz?=
 =?utf-8?B?VUJYRHVraUh4NVRDZmRVbnhiT3cvVG8wa1BQbTJaeEF2R0xpdDREbXd5Q09R?=
 =?utf-8?B?QlZTTW1wVXhjdHdqOExtc0Uzd3A0SHAvQUJ5ZVorWWl2eGd3UnNFd0pWeUVN?=
 =?utf-8?B?YmhBZU5ZaW56YlhKNDBlK2hPcy90U3RselA1SnU5ZXl2Z29aNU9YaGJTejF2?=
 =?utf-8?B?RlovYUNnR3FpZFQxRll2NStaQVFoajNUdXBSUjFnWlovUUJiQUlZcnpzWlRm?=
 =?utf-8?B?U1U1QU5lbS8veVIydExlRHE4MVl2S2hFMHQ3TXJHOEhoS2x2VEJmRTBxcEZD?=
 =?utf-8?B?YXN6Q3B3UzA0Sy84WDBuWUNCNzQ2RUtQQjhzVmNWTDNoUTlWd1BEU0hQTGV1?=
 =?utf-8?B?VExvZmh1UVJXL3FRbnJOZU5nK2VYTHlkMVJuK0R6TTNmeU92VUYvaE9iUk4w?=
 =?utf-8?B?MDlQZzE1WFFPTUdMUUF5Tk9xMm83RjBObU5BYTZrTU04V09vK1BrdmtNQkZI?=
 =?utf-8?B?RzlJOWI5YllPTnpCTFIvN09OUUIwSDdVaXZ5SWQ5VXd4YURCK0hKeHY0T2FJ?=
 =?utf-8?B?cEtJTWtZRE9rWjZCZjdlUEFvUVZNYlZwc0YrSjI3NThJMHgzWVlTYjVaZW4y?=
 =?utf-8?B?a3ROSG5Ham5DWVZJTUVtd3lndGNWRDRReUc0QzBQSDllU25aS3VQNUNlVE82?=
 =?utf-8?B?Tjk4SmhHWXFBVGRhZTBpclBoVEJ1dUJVNVJrWktmWFVPL3RpMnR1M3ZUcDlr?=
 =?utf-8?B?bk1MaFN3Z1FpaEtKU002MGhSREZWaVVheExXcDB0bVp4OUJyY2lodjY0OENk?=
 =?utf-8?B?QWIzRnhsb2I5T3pxTWtzT3V1emZyRnR5c1RJN2p4ZVRvVVJ4elptak4xZTJT?=
 =?utf-8?B?dkF5Vnl6eWVFN1o5ckliczlDOGdQNkJuMDRvLytwaE4rRlBnVVZ3MHhIdWVt?=
 =?utf-8?B?WVZTMDdSNUQrQ2kyUXFKb09sbmZoQzhUQWM0aldSdHhxRnlZRmNwT0pWSHRM?=
 =?utf-8?Q?p0R3fljn9JRRN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C6DB9E8D4BB1D49821A8C72A9B6E1AA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3309
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	48d8898a-cf87-4475-15a5-08d8e2de081f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HfvsTx7FzBTseAlZsBkyaCwOapGgZjxLOJNV69PUiqr4UaSrWv/kOQMqFi4JT+/ngoctJnp/dGtOa+4wWNoU3zTDqzQrH69CvKjKUemN7M1w9ut1M5ro3l4aJkrMDgi4tdSpnTm1PEXLe5k3vxoqlxLC/q+YFxL0yTPNlXTgEHLMjUR8EIPE9574YPij6dN1Qs5jFpqArZJIUsHpjDZB720IZ5kz1FdXk5IolLPjcqI31oGoacO5MBPAghaBj6VD2tKvhSIrOtZ8o9U1VqYzbnoINF3wG8tC4KjlgXPmf8H5LDqNTTmpndv4K9zv207D22rzXy6WKU58/3eSSkRPsOFiAKCuT8G+QHl6RPiPcjIrO2zigM+QKFUFQKmtYphKSWSA9w/xKsB/siV/ulvAZCfZjbZJc93LhYy22XWGe337jkqd9m7TM6JssbZF/8NEmDX+8lOTj8f6X/1/thkO6dkyBAw+7FSOVji7LTvWN4X5SIbUK5mePpOdrkgJWdtmuu5wPLO8+kEGnC6MFQdVaeGP2mlx4QPEsbVDG7Ztd+ZkE27G03rlF6jy6OnFAcIEAHrRx8l3LeWBYmBKDeqIe2U7kMWCeEgdXuwTKCOzRJIvXooODtWXx69DeIYI5gjIhpO+G11sz2b/CiGwD3zOC/d3vOQ29d6I7gNCUD+BHcU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(46966006)(36840700001)(5660300002)(356005)(83380400001)(70586007)(8936002)(336012)(6506007)(82740400003)(82310400003)(4326008)(53546011)(6862004)(70206006)(36756003)(26005)(54906003)(6486002)(2906002)(6512007)(316002)(8676002)(36860700001)(47076005)(81166007)(33656002)(186003)(107886003)(86362001)(478600001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 09:31:00.5585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecca6e50-48ee-4dd1-687c-08d8e2de0d45
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6187

SGkgSnVsaWVuLA0KDQo+IE9uIDggTWFyIDIwMjEsIGF0IDIwOjQ4LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiANCj4gT24gMDgvMDMv
MjAyMSAxNzoxOCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEFsbCBjcHUgaWRlbnRpZmlj
YXRpb24gcmVnaXN0ZXJzIHRoYXQgd2Ugc3RvcmUgaW4gdGhlIGNwdWluZm8gc3RydWN0dXJlDQo+
PiBhcmUgNjRiaXQgb24gYXJtNjQgYW5kIDMyYml0IG9uIGFybTMyIHNvIHN0b3JpbmcgdGhlIHZh
bHVlcyBpbiAzMmJpdCBvbg0KPj4gYXJtNjQgaXMgcmVtb3ZpbmcgdGhlIGhpZ2hlciBiaXRzIHdo
aWNoIG1pZ2h0IGNvbnRhaW4gaW5mb3JtYXRpb24gaW4gdGhlDQo+PiBmdXR1cmUuDQo+PiBUaGlz
IHBhdGNoIGlzIGNoYW5naW5nIHRoZSB0eXBlcyBpbiBjcHVpbmZvIHRvIHJlZ2lzdGVyX3QgKHdo
aWNoIGlzDQo+PiAzMmJpdCBvbiBhcm0zMiBhbmQgNjRiaXQgb24gYXJtNjQpIGFuZCBhZGRpbmcg
dGhlIG5lY2Vzc2FyeSBwYWRkaW5ncw0KPj4gaW5zaWRlIHRoZSB1bmlvbnMuDQo+IA0KPiBJIHJl
YWQgdGhpcyBhcyB3ZSB3b3VsZCByZXBsYWNlIHVpbnQzMl90IHdpdGggcmVnaXN0ZXJfdC4gSG93
ZXZlciwgdGhlcmUgYXJlIGEgZmV3IGluc3RhbmNlcyB3aGVyZSB5b3UsIHZhbGlkbHksIHJlcGxh
Y2UgdWludDY0X3Qgd2l0aCByZWdpc3Rlcl90LiBJIHdvdWxkIHN1Z2dlc3QgdG8gY2xhcmlmeSBp
dCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCkhvdyBhYm91dCBhZGRpbmcgdGhlIGZvbGxvd2lu
ZyBzZW50ZW5jZTog4oCcRm9yIGNvaGVyZW5jeSB1aW50NjRfdCBlbnRyaWVzIGFyZSBhbHNvIGNo
YW5nZWQgdG8gcmVnaXN0ZXJfdCBvbiA2NGJpdCBzeXN0ZW1zLiINCg0KPiANCj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vc21wYm9vdC5jIGIveGVuL2FyY2gvYXJtL3NtcGJvb3QuYw0KPj4g
aW5kZXggY2FlMjE3OTEyNi4uZWEwZGQzNDUxZSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9zbXBib290LmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4+IEBAIC0zMjEs
NyArMzIxLDggQEAgdm9pZCBzdGFydF9zZWNvbmRhcnkodm9pZCkNCj4+ICAgICAgaWYgKCAhb3B0
X2htcF91bnNhZmUgJiYNCj4+ICAgICAgICAgICBjdXJyZW50X2NwdV9kYXRhLm1pZHIuYml0cyAh
PSBib290X2NwdV9kYXRhLm1pZHIuYml0cyApDQo+PiAgICAgIHsNCj4+IC0gICAgICAgIHByaW50
ayhYRU5MT0dfRVJSICJDUFUldSBNSURSICgweCV4KSBkb2VzIG5vdCBtYXRjaCBib290IENQVSBN
SURSICgweCV4KSxcbiINCj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJDUFUldSBNSURS
ICgweCUiUFJJcmVnaXN0ZXIiKSBkb2VzIG5vdCBtYXRjaCBib290ICINCj4+ICsgICAgICAgICAg
ICAgICAiQ1BVIE1JRFIgKDB4JSJQUklyZWdpc3RlciIpLFxuIg0KPiANCj4gRm9yIHByaW50ayBt
ZXNzYWdlcywgd2UgZG9uJ3QgdGVuZCB0byBzcGxpdCBpdCBsaWtlIHRoYXQgKGV2ZW4gZm9yIG1v
cmUgdGhhbiA4MCBjaGFyYWN0ZXJzIG9uZSkuIEluc3RlYWQsIHRoZSBwcmVmZXJyZWQgYXBwcm9h
Y2ggaXM6DQo+IA0KPiBwcmludGsoWEVOTE9HX0VSUg0KPiAgICAgICAibGluZSAxXG4iDQo+ICAg
ICAgICJsaW5lIDJcbiIpDQoNCk9rLg0KDQpEbyB5b3Ugd2FudCBtZSB0byBzZW5kIGEgdjIgb3Ig
Y2FuIHlvdSBmaXggdGhpcyBkdXJpbmcgdGhlIGNvbW1pdCA/DQoNCj4gDQo+IA0KPiBUaGUgcmVz
dCBvZiB0aGUgY29kZSBsb29rcyBnb29kIHRvIG1lOg0KPiANCj4gQWNrZWQtYnk6IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQoNClRoYW5rcyA6LSkNCg0KQ2hlZXJzDQpCZXJ0cmFu
ZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

