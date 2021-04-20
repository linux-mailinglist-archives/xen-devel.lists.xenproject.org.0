Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8202365A98
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 15:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113719.216710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYqoF-0007il-GM; Tue, 20 Apr 2021 13:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113719.216710; Tue, 20 Apr 2021 13:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYqoF-0007iM-D1; Tue, 20 Apr 2021 13:52:59 +0000
Received: by outflank-mailman (input) for mailman id 113719;
 Tue, 20 Apr 2021 13:52:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iarR=JR=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lYqoD-0007iH-F2
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 13:52:57 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::624])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e361d813-44d9-4f4d-a574-d7a3798d24f5;
 Tue, 20 Apr 2021 13:52:55 +0000 (UTC)
Received: from AM7PR04CA0019.eurprd04.prod.outlook.com (2603:10a6:20b:110::29)
 by DBBPR08MB6314.eurprd08.prod.outlook.com (2603:10a6:10:20f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 13:52:49 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::c6) by AM7PR04CA0019.outlook.office365.com
 (2603:10a6:20b:110::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Tue, 20 Apr 2021 13:52:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 13:52:49 +0000
Received: ("Tessian outbound 81a4524e9a48:v90");
 Tue, 20 Apr 2021 13:52:48 +0000
Received: from 434284249ca9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B0D45D7B-4238-4E8C-B5AB-E6CFF11C2AA3.1; 
 Tue, 20 Apr 2021 13:52:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 434284249ca9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Apr 2021 13:52:29 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6342.eurprd08.prod.outlook.com (2603:10a6:20b:31a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.23; Tue, 20 Apr
 2021 13:52:18 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50%4]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 13:52:18 +0000
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
X-Inumbo-ID: e361d813-44d9-4f4d-a574-d7a3798d24f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLXnj9cphiBy7I4e7y8HWcmj0qssuZibWTsQVAQTSgg=;
 b=oJH+9HbDLdS5V5n/RIDRy0NIyVUMNhJlS2M269Z/scvHy2BkHSW5akhpcqTDZRH7RcCFFbQQYav3jqEWIp0mhr7Eh44vy+hbRGtzWyu4k/RKqqeacN/k+brBL40lhtrRR2OIuQqYOzvvJ0E2/1aVHX3ze0I9HPwkXyqQ+fYmFwI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba0c6cea14c1a917
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UOstzjx097fXp4LtiNE3g9lWKQBzyQi5bzAHBRi1C1xltjvxfL6VL7UWKczpP2QkEZTFbXbAMmrHz+mol4AIT/VXggCECdGkG8fu/mm4+tP+dlhlsg9bjey+4xqnoKIpCm1ukmzDxcHJmNmr3bQfRgtFogBP846z98vI2Q4voq00S0xBO9Mq3uHYEvL9FbtgnbYwMONZYPsjKXVsasoubTr9LKYMuxE5ehiFGCxulTLpKyQ1Uij1xtoOQvfJX6+NifHT5qKh7iomVrKgJQ1gC5ccDgrPtIElqIAYxl7V05sjPRlao0PBoFOtZVIIRSkUQ0HRaUBf05EGrsAk6Iqgig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLXnj9cphiBy7I4e7y8HWcmj0qssuZibWTsQVAQTSgg=;
 b=iMywlgZ3yxZizXgC8EmA2AUn52NJsHQm9+IrCgQ0kX4C2Zal++69sA0nycp7HcXgZJo663TYsRq+kZrv7dG3sR4axTCoeVlgIXwkwxFSaV8VDR4KmI0Q1+imBJAetzyOopWXnWDN6PCj/lioAlMwcnM+HjuYIMujchpXKMAOkLr/tn7bVIq5rZStQt08iOQnVnIH7Xx+HdxRZk5ytbF/uTAcue86c1rI4HweDr2ADD7uf6X95Q7PwE7ck06j3Q1EgwukW+g/tm2+7dOVKQlXDVtY+l+5fOgiZH3jOWD3P5Y7a3qeRe5eTR8G9H5AKH4g0Glzo/L+En2l5BHfxNJtag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLXnj9cphiBy7I4e7y8HWcmj0qssuZibWTsQVAQTSgg=;
 b=oJH+9HbDLdS5V5n/RIDRy0NIyVUMNhJlS2M269Z/scvHy2BkHSW5akhpcqTDZRH7RcCFFbQQYav3jqEWIp0mhr7Eh44vy+hbRGtzWyu4k/RKqqeacN/k+brBL40lhtrRR2OIuQqYOzvvJ0E2/1aVHX3ze0I9HPwkXyqQ+fYmFwI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Topic: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Index:
 AQHXMrMxW8Hpcs9A7Ei4/6fuLjr236q3NfuAgAAHXICAAAYsgIAAC7YAgAAA/oCAAAkFAIADN4qAgAEgwACAAFkRgIABVHgAgAAUSoA=
Date: Tue, 20 Apr 2021 13:52:17 +0000
Message-ID: <798D0262-38C9-4520-94DF-1B884A2DCCD0@arm.com>
References:
 <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
 <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org>
 <E2FE265F-B7A4-45C3-BA9C-3EF9109F8B5E@arm.com>
 <8569c856-8838-e5d1-b653-e7eb476dacdc@xen.org>
 <4C9CE5FC-551A-4F26-B975-FC7F33877FF2@arm.com>
 <78c30978-c3be-4357-fecc-5b2f24bf563f@xen.org>
 <348C921E-1150-4247-A693-1D81933FC3F7@arm.com>
 <996b5db1-da59-f03c-9e04-9ac283aa38f2@xen.org>
 <279F74CA-647D-458B-97C0-968E1795E494@arm.com>
 <alpine.DEB.2.21.2104190920160.4885@sstabellini-ThinkPad-T480s>
 <a972d85e-0791-86d0-471b-5854fc40ccd6@xen.org>
In-Reply-To: <a972d85e-0791-86d0-471b-5854fc40ccd6@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 594b38ed-2ee7-48dc-45a2-08d9040395ac
x-ms-traffictypediagnostic: AS8PR08MB6342:|DBBPR08MB6314:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6314C81A7DD33F9CC40723F1FC489@DBBPR08MB6314.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YYnDQnPyJ0qL6olla5WcIViuyob5ieFwswZ0y62QzxHU5RgxJevnxf4zJ+iQCcckNymVh0dlKza4ED4a8/Ip4E1PX/C0ARemP9CF1eY9VWSyiz7d8QX7P/eMvDW5w+AQn0k/SbO60gghUppUHwLCERuuz3XMYiNdXQpiMb82qAknpKIUf6YFhSbROHMNkZASwEeP9ZdNlw9d9A3xTSfrxmvtyU/1jJuEZ9kVwqyt+4d9YOPum2wOGjy8SkOCVrP24wu1cri8epNdNr15vQ4CLkVL0zt0oV0DPFunWq7EOlNf0NVE7/cTg6KVvG9zlLPsZPY/Xy9arKxlzlDkvjajjqP45IcG+a1s5AtIW3riPapB8ZpEHBZrXYqE/TwXDZTrwsRa7uUoHAbfS3DmyN9fHI/3M08XHQ15ieG119RdYc5R4cnYrJkXpNmOwasb5j5wuKWqcHvNji9xl/zFAPfAGC/Tt5v4ZV46xxUgbV/Kn8rSXJbNQb/P9aZ5ibmEy8l+ctFNdpMGgpT0dS5JCvXmN5tFlHdlYqxqrCWkn/OUAy6rgevJ8w7zmkucRqFZ65pm/cmKcBJzFKgljUyeBxHex4WchnsRMYmdcDpPRIv/KOjset+cLk21IXivUzXkIhUBqLRza8GZFukyyYu5HvAxqiIREv+iiaP3ZSCHuJOVHDM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39860400002)(366004)(478600001)(38100700002)(36756003)(2906002)(6486002)(26005)(66446008)(6506007)(64756008)(66946007)(4326008)(6512007)(83380400001)(53546011)(71200400001)(122000001)(54906003)(8936002)(66556008)(33656002)(316002)(5660300002)(76116006)(91956017)(2616005)(86362001)(186003)(66476007)(6916009)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?amZvQkQ0bE1ucXVoQXNsZXVURlllZXI3WXFpOG5VN24xeGkzcjkzSGtsNlB6?=
 =?utf-8?B?eDd3Y1ZWdHFjeDRQcXAxNytiNUQ0ZFJUQWV5YzhTWmxmSW9QYnIzUE5VQ0cv?=
 =?utf-8?B?WGZKQU8rS3lzT3dhNUVPU1huT2o1d05lMHJQUDZqOFkrSEhITUxYb3o5WmNN?=
 =?utf-8?B?c0NmOUlrbWVsbFFBaDRISC9oVnplMmY4ellrSGNYYlBtWUo2Mnd3TGp6VFlk?=
 =?utf-8?B?NnFnVTBaZG9jWU8vTVBaaWZ2aVNwSkRwYXl0dHdHSWUyYUFtMzRYM2ZIYlVs?=
 =?utf-8?B?WmNYVURlY0RIaldkRng3Z2ptRjViYXphcExvM3IybUNKZ21MNGM2aUVGSVFr?=
 =?utf-8?B?WThJY3U4M3pFd3U2cm1FMGNTSjhmM3V5K293MWJCT1gvNHVSVDVZcGo3UjVn?=
 =?utf-8?B?MzdKVGNKOGhPT2hYNzVzZ1FHcnFFSXhvUHhsMXBubHhjOVR6bTFRMU83ZUp5?=
 =?utf-8?B?cXJKc0FIQTlRVzQ0NVFMRnZPanNyYTU2d1JwL2x4czdFT1pyWi84ZWc1TXdU?=
 =?utf-8?B?T3hHSHhvYTFkY2NNc2EzZGwvMHB1NWxOV0VuMUc5bFBza2NzTXJ5R3NxWWJ4?=
 =?utf-8?B?U2tzWFJiNVBZclIzRnhVcERhUytmalFQbmJRdVVSUERPUVl0OGRoVWtKZk16?=
 =?utf-8?B?bUU2VkRvckhlVUU4T01tSXFGdEdiVkIvZE9oeFc1QXVYaDBtU0pyRnUwbzJr?=
 =?utf-8?B?WTdwS1NjU24rYllDa2ZIQUFPVncxeW1nZTl5KzJadTM1cExyTWcyTGpqRWkw?=
 =?utf-8?B?eFF0TEVrTUFtdjV5WFA0U2FsUU41ZElQSGp2MjZvUUtNYWtHSmpTNzgwRGdU?=
 =?utf-8?B?RmtyemU5bzc0WnhnSFpZWU1PaUlOYmpLU0ZPVzlmK3prVzVXcS9BcWY4am01?=
 =?utf-8?B?eUp1UlMyRmlqc3MzMFZaUVlvMks2V0xaaW1iSk1ZdTBpRXR1N3JVY1l5blM1?=
 =?utf-8?B?a1dORStFSTFQelFDcG1sb2lCbVlYY1oyRFBNYWVUd0gxSlQ4K3ozSDlwQXZN?=
 =?utf-8?B?YnNFang4Yzh2WXZOYiswMldVS2xncGp3Q1RTcndIdUlXaHkxcktncUd4RGlq?=
 =?utf-8?B?VFJETVpyb3BYc2hWVkQ0Q1piOEtWMjFjYVZ2WllGdmk2MVhuK05WS1NzRE96?=
 =?utf-8?B?S3BrN2YwZDhIZDNTUkdNdUR4V2gyUHpTNVlpTHFWeGVNQVB3dFlsQjNPZ1hP?=
 =?utf-8?B?ak9oZ1JObmlkYmU2dndhZWVGdGhPajJCdzVvN2hDQWV2ZSt5UWlDRUNVSnFR?=
 =?utf-8?B?ako3RU1mNG1KT2tuYlNLdjg3bEhyc1h0REpzL2VBcWtQTk81ZzRoOHlPeWo4?=
 =?utf-8?B?Q2pCdFFOZWFoQkIwUFVLencraGpxZHRTTGFibzJoKzFXQU5hamRjNFJWTDV0?=
 =?utf-8?B?SitzeHA1NllXbDJpQTdNUms1c0hWQ3RwcDNNTlR2MHp2N3lqbDhzRWw2dWEr?=
 =?utf-8?B?K3B3bHhkNmNxT0E4MDZ4SGw1SXhKVEJ6WDY3TjZvWmZ6Wno3Vk5oVml1ZE04?=
 =?utf-8?B?bUZRcVIxVjZXSFlQeVY4azcxOWxlenNqc1RMdmxEdUNNQWJLckx3MEs0Wkcy?=
 =?utf-8?B?NitVeHUzSThNdjlZOExZRkkxbWFud1FqZWFnRHhnVUNMVE1jbzV1SHdxREFq?=
 =?utf-8?B?KzhmWVo4dWh5MzM3bnBYejhxWE5Ic2lxSzJvbUdGMFdzMmRyUElGc3NtajdB?=
 =?utf-8?B?d0lpOHpxdUV1WGt3NlFRd0ZzN0U1TlpwVmZkclo4dGovTE93QzVCdlNBNjAz?=
 =?utf-8?Q?OJE2LKkmVyaJVaRyq9PNH+jKtXU9gcCXqePLwiI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CACF7B7E9DBA0C418B3472AB485E039A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6342
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22fc738d-e8bf-4115-75a1-08d904038317
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VcUNScRw/rHiFr3fJIPeD3xpFvUCf1kVEm2HVThy8Fd2ntuyNCvnIaWuZEbyZHMffHR8R5iXq7sEErTYZe5Rl5x7J3+0s+qTApn306vrfhLw0rLUEDcczhBRet60hC1/jT6oFxzN2DUiZ5E4obq4N0Tgb8+Mizkwt5Vw5/yXUb11RANjbaU9/Q6Ws8WBKFqcadjlJXNkf5b//bf7VPWyz/bapd4BZ4UcTtrZmtkUDoePU0zwhsK0Wkbl8BW85Y+uJTP4tBdRJIc5agxHIMdfuMj4H6TaGvxeknWzAmuIEm9TxPKyd56o67sYPKqfLP3aSgnOBhn03r8saS9HY9D/uRRNHhUmqFQGRypVmRyxy9vnJSt4pn8aa5Pnzc0mpv9LdB8XsP0+E1iTfGbVvH+D7ExuUG0cVCg7XPRO/XSO5eUANFEd1HQSE9BxW4lEsieZbGiIy9erSUrBDxSpTLZcEuRu/VxewhmyOJUzn54X0sbipAVF4kUOtC69ioqvgaX1T7qkob+77IZy/PF0vtu1CFTlZ2KkqTMDuWg6XolxsIgKR1RkJxLSwcSVgvpUue3A1D9W7sVd+9B9cArWFf499oqzJLyGR69d9hxCNcy9KrzZsSQ2mde1nu6uD47D5okqdT4v0ydf2Jr7JttaOYkmsZsJbNRA/mA/zYEpCnndM28=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(36840700001)(46966006)(36860700001)(82310400003)(8676002)(53546011)(2906002)(82740400003)(6506007)(26005)(107886003)(70206006)(70586007)(36756003)(6862004)(6486002)(86362001)(186003)(478600001)(54906003)(316002)(5660300002)(83380400001)(33656002)(356005)(336012)(6512007)(81166007)(4326008)(8936002)(2616005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 13:52:49.1524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 594b38ed-2ee7-48dc-45a2-08d9040395ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6314

SGkgSnVsaWVuLA0KDQo+IE9uIDIwIEFwciAyMDIxLCBhdCAxOjM5IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMTkvMDQvMjAyMSAx
NzoyMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gT24gTW9uLCAxOSBBcHIgMjAyMSwg
UmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gSGkgSnVsaWVuLA0KPj4+IA0KPj4+PiBPbiAxOCBBcHIg
MjAyMSwgYXQgNjo0OCBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+
Pj4+IA0KPj4+PiANCj4+Pj4gDQo+Pj4+IE9uIDE2LzA0LzIwMjEgMTc6NDEsIFJhaHVsIFNpbmdo
IHdyb3RlOg0KPj4+Pj4gSGkgSnVsaWVuDQo+Pj4+IA0KPj4+PiBIaSBSYWh1bCwNCj4+Pj4gDQo+
Pj4+Pj4gT24gMTYgQXByIDIwMjEsIGF0IDU6MDggcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IA0KPj4+Pj4+IE9uIDE2LzA0
LzIwMjEgMTc6MDUsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+Pj4gT24gMTYgQXByIDIwMjEs
IGF0IDQ6MjMgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+Pj4+
Pj4gDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gT24gMTYvMDQvMjAyMSAxNjowMSwg
UmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+Pj4gSGkgSnVsaWVuLA0KPj4+Pj4+Pj4gDQo+Pj4+
Pj4+PiBIaSBSYWh1bCwNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+PiBPbiAxNiBBcHIgMjAyMSwgYXQg
MzozNSBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4+Pj4+
IA0KPj4+Pj4+Pj4+PiBIaSwNCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IE9uIDE2LzA0LzIwMjEg
MTI6MjUsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4gUmV2ZXJ0IHRoZSBjb2RlIHRo
YXQgYXNzb2NpYXRlcyB0aGUgZ3JvdXAgcG9pbnRlciB3aXRoIHRoZSBTMkNSIGFzIHRoaXMNCj4+
Pj4+Pj4+Pj4+IGNvZGUgY2F1c2luZyBhbiBpc3N1ZSB3aGVuIHRoZSBTTU1VIGRldmljZSBoYXMg
bW9yZSB0aGFuIG9uZSBtYXN0ZXINCj4+Pj4+Pj4+Pj4+IGRldmljZS4NCj4+Pj4+Pj4+Pj4gDQo+
Pj4+Pj4+Pj4+IEl0IGlzIG5vdCBjbGVhciB0byBtZSB3aHkgdGhpcyBjaGFuZ2Ugd2FzIGZpcnN0
IGFkZGVkLiBBcmUgd2UgbWlzc2luZyBhbnkgZmVhdHVyZSB3aGVuIHJldmVydGluZyBpdD8NCj4+
Pj4+Pj4+PiBUaGlzIGZlYXR1cmUgd2FzIGFkZGVkIHdoZW4gd2UgYmFja3BvcnRlZCB0aGUgY29k
ZSBmcm9tIExpbnV4IHRvIGZpeCB0aGUgc3RyZWFtIG1hdGNoIGNvbmZsaWN0IGlzc3VlDQo+Pj4+
Pj4+Pj4gYXMgcGFydCBvZiBjb21taXQgInhlbi9hcm06IHNtbXV2MTogSW50ZWxsaWdlbnQgU01S
IGFsbG9jYXRpb27igJ0uDQo+Pj4+Pj4+Pj4gVGhpcyBpcyBhbiBleHRyYSBmZWF0dXJlIGFkZGVk
IHRvIGFsbG9jYXRlIElPTU1VIGdyb3VwIGJhc2VkIG9uIHN0cmVhbS1pZC4gSWYgdHdvIGRldmlj
ZSBoYXMgdGhlDQo+Pj4+Pj4+Pj4gc2FtZSBzdHJlYW0taWQgdGhlbiB3ZSBhc3NpZ24gdGhvc2Ug
ZGV2aWNlcyB0byB0aGUgc2FtZSBncm91cC4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gSWYgd2UgcmV2
ZXJ0IHRoZSBwYXRjaCwgdGhlbiBpdCB3b3VsZCBub3QgYmUgcG9zc2libGUgdG8gdXNlIHRoZSBT
TU1VIGlmIHR3byBkZXZpY2VzIHVzZSB0aGUgc2FtZSBzdHJlYW0taWQuIElzIHRoYXQgY29ycmVj
dD8NCj4+Pj4+Pj4gTm8uIElmIHdlIHJldmVydCB0aGUgcGF0Y2ggd2UgY2FuIHVzZSB0aGUgU01N
VSBpZiB0d28gZGV2aWNlcyB1c2UgdGhlIHNhbWUgc3RyZWFtLWlkIHdpdGhvdXQgYW55IGlzc3Vl
IGJ1dCBlYWNoIGRldmljZSB3aWxsIGJlIGluIGEgc2VwYXJhdGUgZ3JvdXAuVGhpcyBpcyBzYW1l
IGJlaGF2aW91ciBiZWZvcmUgdGhlIGNvZGUgaXMgbWVyZ2VkLg0KPj4+Pj4+IA0KPj4+Pj4+IE9r
LiBTbyB0aGVyZSBpcyBubyBjaGFuZ2UgaW4gYmVoYXZpb3IuIEdvb2QuIENhbiB5b3UgcHJvcG9z
ZSBhIGNvbW1pdCBtZXNzYWdlIGNsYXJpZnlpbmcgdGhhdD8NCj4+Pj4+IFBsZWFzZSBoYXZlIGEg
bG9vayBpZiBpdCBtYWtlIHNlbnNlLg0KPj4+Pj4geGVuL2FybTogc21tdXYxOiBSZXZlcnQgYXNz
b2NpYXRpbmcgdGhlIGdyb3VwIHBvaW50ZXIgd2l0aCB0aGUgUzJDUg0KPj4+Pj4gUmV2ZXJ0IHRo
ZSBjb2RlIHRoYXQgYXNzb2NpYXRlcyB0aGUgZ3JvdXAgcG9pbnRlciB3aXRoIHRoZSBTMkNSIGFz
IHRoaXMNCj4+Pj4+IGNvZGUgY2F1c2luZyBhbiBpc3N1ZSB3aGVuIHRoZSBTTU1VIGRldmljZSBo
YXMgbW9yZSB0aGFuIG9uZSBtYXN0ZXINCj4+Pj4+IGRldmljZSB3aXRoIHNhbWUgc3RyZWFtLWlk
LiBUaGlzIGlzc3VlIGlzIGludHJvZHVjZWQgYnkgdGhlIGJlbG93IGNvbW1pdDoNCj4+Pj4+IOKA
nDA0MzU3ODRjYzc1ZGNmZWYzYjVmNTljMjlkZWIxZGJiODQyNjVkZGI6eGVuL2FybTogc21tdXYx
OiBJbnRlbGxpZ2VudCBTTVIgYWxsb2NhdGlvbuKAnQ0KPj4+Pj4gIFJldmVydGluZyB0aGUgY29k
ZSB3aWxsIG5vdCBpbXBhY3QgdG8gdXNlIG9mIFNNTVUgaWYgdHdvIGRldmljZXMgdXNlIHRoZQ0K
Pj4+Pj4gc2FtZSBzdHJlYW0taWQgYnV0IGVhY2ggZGV2aWNlIHdpbGwgYmUgaW4gYSBzZXBhcmF0
ZSBncm91cC4gVGhpcyBpcyB0aGUgc2FtZQ0KPj4+Pj4gYmVoYXZpb3VyIGJlZm9yZSB0aGUgY29k
ZSBpcyBtZXJnZWQuDQo+Pj4+IA0KPj4+PiBMb29rIGdvb2QgdG8gbWUuIElzIHRoaXMgcGF0Y2gg
dG8gYmUgYXBwbGllZCBvbiB0b3Agb2YgU3RlZmFubydzIHNlcmllcz8gSWYgbm90LCBpcyB0aGVy
ZSBnb2luZyB0byBiZSBtb3JlIGNsYXNoPw0KPj4+PiANCj4+PiANCj4+PiBBcyBwZXIgU3RlZmFu
bydzIG1haWwgaGUgYWxyZWFkeSB0ZXN0ZWQgaGlzIHBhdGNoIHNlcmllcyBvbiB0b3Agb2YgdGhp
cyBwYXRjaC4gSSB0aGluayB0aGlzIHBhdGNoIGhhcyB0byBtZXJnZWQgYmVmb3JlIFN0ZWZhbm/i
gJlzIHBhdGNoIHNlcmllcw0KPj4+IExldCBTdGVmYW5vIGFsc28gY29uZmlybSB0aGF0Lg0KPj4+
IA0KPj4+IEkgdGhpbmsgdGhlcmUgd2lsbCBiZSBubyBtb3JlIGNsYXNoZXMuDQo+PiBZZXMsIHRo
aXMgcGF0Y2ggaXMgdG8gYmUgY29tbWl0dGVkICpiZWZvcmUqIG15IHNlcmllcyBhbmQgSSBoYXZl
IGFscmVhZHkNCj4+IHRlc3RlZCB0aGlzIHBhdGNoIGFsb25lIGFuZCB3aXRoIG15IHNlcmllcyBv
biB0b3AuIEJvdGggY2FzZXMgd29yayBmaW5lLg0KPiANCj4gQ29vbC4gVGhhbmtzIGZvciB0aGUg
Y29uZmlybWF0aW9uLiBJIGhhdmUgY29tbWl0dGVkIHRoZSBwYXRjaCB3aXRoIHRoZSBuZXcgY29t
bWl0IG1lc3NhZ2UgKGFsdGhvdWdoLCBJIHR3ZWFrZWQgYSBsaXR0bGUgYml0IHRvIHVzZSB0aGUg
YWJicmV2aWF0ZWQgdmVyc2lvbiBvZiB0aGUgY29tbWl0IElEKS4NCj4gDQoNClRoYW5rcyEgDQoN
ClJlZ2FyZHMsDQpSYWh1bA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoN
Cg==

