Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD6A36E700
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 10:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119783.226453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc21G-0006p7-W0; Thu, 29 Apr 2021 08:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119783.226453; Thu, 29 Apr 2021 08:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc21G-0006oi-SY; Thu, 29 Apr 2021 08:27:34 +0000
Received: by outflank-mailman (input) for mailman id 119783;
 Thu, 29 Apr 2021 08:27:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKbL=J2=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lc21F-0006od-HQ
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 08:27:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::624])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62de9204-a0fa-41e8-8824-33f21f5b5783;
 Thu, 29 Apr 2021 08:27:31 +0000 (UTC)
Received: from DB6PR07CA0018.eurprd07.prod.outlook.com (2603:10a6:6:2d::28) by
 AM0PR08MB4161.eurprd08.prod.outlook.com (2603:10a6:208:134::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Thu, 29 Apr
 2021 08:27:27 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::3c) by DB6PR07CA0018.outlook.office365.com
 (2603:10a6:6:2d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.8 via Frontend
 Transport; Thu, 29 Apr 2021 08:27:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Thu, 29 Apr 2021 08:27:27 +0000
Received: ("Tessian outbound e566ed09e411:v91");
 Thu, 29 Apr 2021 08:27:27 +0000
Received: from 895957f84f1e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBE3441B-F156-465B-A2D4-64A4FF9E2582.1; 
 Thu, 29 Apr 2021 08:27:17 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 895957f84f1e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 29 Apr 2021 08:27:17 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4437.eurprd08.prod.outlook.com (2603:10a6:20b:bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 29 Apr
 2021 08:27:14 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50%4]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 08:27:14 +0000
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
X-Inumbo-ID: 62de9204-a0fa-41e8-8824-33f21f5b5783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqafzmGHUxx2gy76AV37qLVoESIMB1wY4moj2vZiXqI=;
 b=K3PpzrnTfPQEQw+j1uxRT4P9y2+SzPp8RIvVHmuZW0xLRmb+LAXRSC9dOYWZ0OyijWCbwXgwWlE0AiZC0j1epEOechclFmWI6biOp5TSoxrN1Xl7zz5M+JBO3Mz2CFPutAGyUDynwF4yhYB06jKVJwnKtnFo8PTHkU/6XpJ8W3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a89511d88cfbe72d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3axqdCOv/3VUTV5lmddNVwOdKAfZnnixLF7Y15F8/yzW4nLmAK1g5X31AZmbgrBQKNkcb48Q5AQ4IS4u0y9fWrsPRAd/qdv3cUr9fw/zAgDryvOqjxNJwTXL2iOVq6KPRKNe7YMKAgyuVTSPyRKwO+eOSt3GUsIHsZ1AWZEkVjH5PkzbSREkaMNGr9OnZX/jodAVauPJX1ZK761mhR0APD7G5x6PIvii4U9a3qX/+lS9RuSZi07Vl4nfjjuGNujRhGLh8C4DKED1YBibkmX3T8iTw9AyxcnaFdF5GHMfdUeSULmlL5o4YILR8Ig0DG0ahZXFvjIQRK1GkKmquJsuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqafzmGHUxx2gy76AV37qLVoESIMB1wY4moj2vZiXqI=;
 b=jO5amxRqYdlPDRk3D//bJosyF8VDDcp4f26fT7SST8IEpd7C3d4W8YgntZ40Eq8hdifwcE74+TuDBL/EbUu0qjEOS6oqDuIO4celzYIviEfgj3lD1iYg/OCz3xsfbKguWj9iYgRQiVXjHPIkJhrLfvNvKZuJy0WWjdEkff8rOtmLO59ETA+CM4i1nJOr5V//enTZ/2+V73dRXl97ofFKjo7niFSkyGG0Bs/yZKqpZVad6uZVEyRGU5KRtO2EEn7KsLEhohv41qV6Vo+rmRPQUtqwn+GJBFn2FrwggraCaMy7tCwhnYm3wQy2UUi0E0zfnqygN/lXP8bwwBodVdvmnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqafzmGHUxx2gy76AV37qLVoESIMB1wY4moj2vZiXqI=;
 b=K3PpzrnTfPQEQw+j1uxRT4P9y2+SzPp8RIvVHmuZW0xLRmb+LAXRSC9dOYWZ0OyijWCbwXgwWlE0AiZC0j1epEOechclFmWI6biOp5TSoxrN1Xl7zz5M+JBO3Mz2CFPutAGyUDynwF4yhYB06jKVJwnKtnFo8PTHkU/6XpJ8W3I=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v3 2/3] xen/pci: Refactor PCI MSI intercept related code
Thread-Topic: [PATCH v3 2/3] xen/pci: Refactor PCI MSI intercept related code
Thread-Index: AQHXOrhr42FH3XtdSEulNtIMBWAh5arJwQ+AgAA2a4CAATX+gA==
Date: Thu, 29 Apr 2021 08:27:14 +0000
Message-ID: <24B38FDC-A474-44CE-B4F9-A0146B535D93@arm.com>
References: <cover.1619453100.git.rahul.singh@arm.com>
 <480947d549c46270fccc4c6d83ae8beca3c0fce6.1619453100.git.rahul.singh@arm.com>
 <YIk8MYCeKi0eKkrg@Air-de-Roger>
 <f0120aa9-f0f5-8756-d8e5-3190c2494618@suse.com>
In-Reply-To: <f0120aa9-f0f5-8756-d8e5-3190c2494618@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: fcd4c73e-10f3-4dac-1ef0-08d90ae89f7e
x-ms-traffictypediagnostic: AM6PR08MB4437:|AM0PR08MB4161:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4161FF290364DE18CF058E4BFC5F9@AM0PR08MB4161.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2nB3RTu3zRGOZjbBI4Xh96w9G24QmV6K7zDKMUL7wqYmGg3meWRbi9jY7Ky7WbLZtfA9DyJ1D2RPouguudygevrRIaXkB3S8godRsTq3rEYKl7cp28XnbbedevBHzUi/EKPAPmkneZQtNvIgxqqGy1i4m+0m7y7K9y5sZielREYvmtpSsIQdYCwtCmj/pFmoy9YrXpo5Xll8YnmjXwgMx41Bl9oS5oyiB3fHwaItjQMi6eAzV7/RD3qpPYvfoQj3G6bhh1EqAQh2Mw2ztThSW9KnudDYr3Nsfx5283yIaFmeGl3UxnqrhaBV+8muMKJugcl2EpTym7RI5eLZ2qh4q3ttVcIeJncWlxpkhpYBP9/TgGEnxKDOacbvEW7nykJVVASY2dbNSwllgiE5fKemYfwmfKmLhOtsv61fBgjStAR1xS8cQbADgfKR86ME7SmkNHcFGjSo5/3JtAYn7m9knsjHsHFEX79nMviooHhFNtzus/3xICsa++jisdYZMQr115fy0K2algYIYysBtSxJrhvSwgmqp1tA9tyey6X4yCgglbuEu1ZLfMSsqMjmo4j0L2d3+DnkeXrh+5Mm/DNWVMRW2H+u9UkIupzVtqSD+sRKrZUjt1UFb6MDc9vDNbZ6TjmFn4wzLGgPL1CYVAPY4BJNEBae6PLss0hR35JYQ8Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(366004)(396003)(136003)(6506007)(122000001)(36756003)(6512007)(53546011)(186003)(7416002)(4326008)(5660300002)(38100700002)(2616005)(54906003)(4744005)(66946007)(76116006)(91956017)(64756008)(316002)(6916009)(2906002)(8936002)(8676002)(71200400001)(66476007)(66556008)(33656002)(478600001)(66446008)(26005)(6486002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?M1FyTTY4SXNwci9ZMjkrYXYxUGpwWUpPcVlMdGg5dW1HQUx2eFkrN05ScS9T?=
 =?utf-8?B?TzRaOXVtTnB0NEZ1RTdEMXBuV0s5cFFRNy9Ka2krTG83TVRQdXErTXhPazZo?=
 =?utf-8?B?dkQxM1BtM3RBbW5aZEU0L2tPM1NLdlZYS1lGU3lCWFpXM0JWY09sTWtwd3pu?=
 =?utf-8?B?bkRSVUlVWFdTTjZDdlA2L1BMRHlVZFRqKzZTRlBOMkpDV29MbGw4SVVRVGsz?=
 =?utf-8?B?RkVlclc1SFdnaEdQbTBsY0xHYzB1a0NQYi93U0c1ZytEN0NYNndoMmI3ZjdL?=
 =?utf-8?B?by8rbHdyT2RJdVI5OU5NVnFUUXo3YnYvbk51RHg3M3BaVHV5N3ZQZGFYTVZK?=
 =?utf-8?B?Mnc2NkJUaFJZNEhHMGYzR0xsaXdlMi93YmtNd3I0VkdXRjNocFhIeGY1d0ZH?=
 =?utf-8?B?eS8wZ3BINXo1WFBBcllXaGZONmU3TVcraURFR2M3TzZVWXVGUEk0V0h6d0ov?=
 =?utf-8?B?bzVTQmdMOG11L05hUzEvWVpPUGZ2VlBmc2FyTlVCSFBuN3lWd0N2dU96NWp4?=
 =?utf-8?B?aGY5M1R3aEMrWHJva0RlbE45RWRsUjYwWVlEU1JVdW9RcXdsWVFWREUyempV?=
 =?utf-8?B?bkF1RW1uU2k4dHh2RUNGcWlBN2YrTk9SblY0NHFqMkpOSm1sOFZHRnNoYW1Q?=
 =?utf-8?B?S3NxaU40MDRGdU1HbmtMUGdjSmQzNURKSFBFTU8zSkZLcEhpY3c1bC9zaEpl?=
 =?utf-8?B?eGFjT3NEdkt5aytDaTF4S0szNmpEKy9OMWFldkRVS0FZZ2hzM3hvZ0RtMTFJ?=
 =?utf-8?B?TjdoMlFqQklFdWdGZkdZVU15S0x6a3Z2dTluWEY4RzVwVXF0Z3JxWDRkWWxv?=
 =?utf-8?B?dlhNMUFRUjdrQ1hoVHlSQ2F6a2p0RzVVT2xYQzl0VmNzS2ZQN25Zc3FjWkkw?=
 =?utf-8?B?L1ozeklScFZreWZzZWtPbHUxZmd1UFgwR1U0OFMyUmxIOFhFWlpCMWY3NzRk?=
 =?utf-8?B?TUkvTzFieEgzZTNKeWtBQkl6d2dSdU1GMDgrTEVra3YrdTNaR2lnelZFSmQr?=
 =?utf-8?B?NWdIZDBGdmxyb0dZZ2NsaW1tWnR1Wk5XUEZCMm1pcm5BRGlDcWRtWmNJQU03?=
 =?utf-8?B?MkdER0dqYVFzdmFOVzN1TmtzQUtzM0VKeGNjM0tSWDRxVXhTcWlkS0FsWkdO?=
 =?utf-8?B?eFRxSzBZVFZrR1ZaOVFtWnJMMTFzZ2xRWmNIU29DSWRIM0VEK0RPbW80Tzcv?=
 =?utf-8?B?YVRmbzFnbWpiK2RwUFcwWndGN2s0VERWVHFhb2pBVzhuT29JSmVZTStqSExi?=
 =?utf-8?B?RDRMQU5IbHNzMnk2MWRJMkw5SVV6K2Y1S0VIcXFFNWRIQm9Vb2t0aVBlNUU5?=
 =?utf-8?B?OG9aMGlQNFlkTzdlUG1ncnVQenFqRlBUNXJ5SE5IZThicGxyVzI3dVlZNWFm?=
 =?utf-8?B?UmRqNzZlRHdaZEZvNWsrUmU4ZGR3U3doVk5HbnRpbjFtdTY5T3U0blQvQ2dF?=
 =?utf-8?B?NVVROGwwMDM2c3FoQ3AvZXliUFJpbW1WVGdocklmVjJVb1VzMS9pNFF6c0Js?=
 =?utf-8?B?NXpKcWtrUEsvT2kxVnRWTmNpYm5rdDA4SHJGK2hvTGVzWFpZdWdqRXREYXVs?=
 =?utf-8?B?a2tTd1l4Q0xhZm83NHVBaG5PWHVoRy80Qit5MzBST1MxSUVYYVZZbmdqVnhC?=
 =?utf-8?B?anRicE11VGtIUThBOCtjTEw4SUkvTWJBWmZCTHI4aG1MUHJPOFpqMUczd2VI?=
 =?utf-8?B?Y3ZtVStIVFdldE5JQjVNSUpqNFgvbGlSNi9sSklGSmZ1RmdQT0pDS3dKYWVp?=
 =?utf-8?Q?4txeGBS8xtwK/n2JKjYNi9IAp1eaSBvYXYXJZRQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F37068A0E743245B61DDFC4E4A03728@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4437
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d8d9ec5f-da06-4347-0e83-08d90ae897e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hwWcd8zhqo73hQhW6bg2L0VuUWmwZvIm4ENlLtjZNvsgk7edQKb6GWNInFAlm2b49d6vvWl6QYvSH8DhT+NwJL+DwF6tHArliSIC/2IpHNM++8pO3SJxhJRhlXBArPkm8cIUS7Mx3RtE0Mp88uz3Opa94aj5DfsAmJN0EGm8JXF/vYklEygNW1i2lhY1me6iLM4oJSsEvvj7E5Bmk00MQmh7VBbNXihTMDpQHhDWCWO0403rkvABTPThWU+bnijNxgoh8KyT4fKZAEvVhWShaGSP3s7b+djuQoK6pJxCSgyFRKiFDVJVW30QBPE0iol/Dtxn4VAeaGmVGhh7E9IFbKTeLT/ArUm+h4+Rha8MVkpFMOTW5pk8dqPdkxIuumTrMF3RIq9Eu7L+FObJg5RFBkb6NW4xpt4CAxU+XhzV1kfSpBGd2R/pSrwHjkeoZkzQwRSMeBO1iw+9aGUbtvO8UU0NlXnF3IMCXBj/lTyVDllbppMg0HD863fVPIfWW9sXEwK5GzsmCtk6eqINrvdKDB89ylm+1LxiN7QGtvuePpPX+VLjQlCFCFNJ0BMb0PRtZX6Lu/7fwLslWCKlotEMBvCNg5di2xY29T2pY6so6tnCrxrQrBQcqnBhU2yodIsVhQDFHzmswhfRGO/hwliA2dZj0kRFN0RifFZ4ePJWihDolYsWLM+eHddXYr6n5elN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(36840700001)(46966006)(336012)(54906003)(2906002)(5660300002)(70206006)(4744005)(81166007)(26005)(356005)(47076005)(6486002)(186003)(70586007)(33656002)(478600001)(82310400003)(53546011)(4326008)(86362001)(8676002)(6506007)(6512007)(8936002)(36756003)(82740400003)(6862004)(36860700001)(2616005)(34020700004)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 08:27:27.4099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd4c73e-10f3-4dac-1ef0-08d90ae89f7e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4161

SGkgSmFuLA0KDQo+IE9uIDI4IEFwciAyMDIxLCBhdCAyOjU3IHBtLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjguMDQuMjAyMSAxMjo0MiwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIE1vbiwgQXByIDI2LCAyMDIxIGF0IDA1OjIxOjI2UE0g
KzAxMDAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmln
DQo+Pj4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcNCj4+PiBAQCAtMjAsNiArMjAsNyBAQCBj
b25maWcgWDg2DQo+Pj4gCXNlbGVjdCBIQVNfTlMxNjU1MA0KPj4+IAlzZWxlY3QgSEFTX1BBU1NU
SFJPVUdIDQo+Pj4gCXNlbGVjdCBIQVNfUENJDQo+Pj4gKwlzZWxlY3QgUENJX01TSV9JTlRFUkNF
UFQNCj4+PiAJc2VsZWN0IEhBU19QRFgNCj4+PiAJc2VsZWN0IEhBU19TQ0hFRF9HUkFOVUxBUklU
WQ0KPj4+IAlzZWxlY3QgSEFTX1VCU0FODQo+PiANCj4+IFRoaXMgbGlzdCBpcyBzb3J0ZWQgYWxw
aGFiZXRpY2FsbHkgQUZBSUNULCBhbmQgbmV3IGFkZGl0aW9ucyBzaG91bGQNCj4+IHJlc3BlY3Qg
dGhhdC4NCj4gDQo+IFNpbmNlIHRoaXMgaXNuJ3QgYSB1c2VyIHZpc2libGUgb3B0aW9uLCBwZXJo
YXBzIGl0IHdhbnRzIHRvIGJlDQo+IEhBU19QQ0lfTVNJX0lOVEVSQ0VQVCBhbnl3YXk/DQo+IA0K
DQpZZXMgSSBhZ3JlZSB3aXRoIHlvdSBJIHdpbGwgY2hhbmdlIHRoZSBuYW1lIHRvIEhBU19QQ0lf
TVNJX0lOVEVSQ0VQVCBpbiBuZXh0IHZlcnNpb24uDQoNClJlZ2FyZHMsDQpSYWh1bA0KPiBKYW4N
Cj4gDQoNCg==

