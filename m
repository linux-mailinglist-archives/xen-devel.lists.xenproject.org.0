Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81C399824
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jun 2021 04:46:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136348.252849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lodMM-0008Uw-Oj; Thu, 03 Jun 2021 02:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136348.252849; Thu, 03 Jun 2021 02:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lodMM-0008SF-L7; Thu, 03 Jun 2021 02:45:26 +0000
Received: by outflank-mailman (input) for mailman id 136348;
 Thu, 03 Jun 2021 02:45:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mEXH=K5=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lodMK-0008S9-Uo
 for xen-devel@lists.xenproject.org; Thu, 03 Jun 2021 02:45:25 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4888d3bb-0bde-4d3b-abee-b0e7bd5f5cd0;
 Thu, 03 Jun 2021 02:45:23 +0000 (UTC)
Received: from DU2PR04CA0349.eurprd04.prod.outlook.com (2603:10a6:10:2b4::6)
 by AM0PR08MB3987.eurprd08.prod.outlook.com (2603:10a6:208:134::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 3 Jun
 2021 02:45:20 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b4:cafe::e8) by DU2PR04CA0349.outlook.office365.com
 (2603:10a6:10:2b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Thu, 3 Jun 2021 02:45:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Thu, 3 Jun 2021 02:45:19 +0000
Received: ("Tessian outbound a5ae8c02e74f:v93");
 Thu, 03 Jun 2021 02:45:19 +0000
Received: from 360ec6a86785.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 85CF783B-64B2-454F-A173-5CAECD0C341E.1; 
 Thu, 03 Jun 2021 02:45:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 360ec6a86785.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Jun 2021 02:45:13 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3149.eurprd08.prod.outlook.com (2603:10a6:803:41::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Thu, 3 Jun
 2021 02:44:58 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4173.030; Thu, 3 Jun 2021
 02:44:57 +0000
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
X-Inumbo-ID: 4888d3bb-0bde-4d3b-abee-b0e7bd5f5cd0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pCinxDI/FW/OY2j76PpngpyU91JFm3uGEUde7fyv80=;
 b=0R9ede7dUlNl36Y65SxSZ9PZ1ipMW3EQ/o5ZCwCjDaBUCkFlum28rvoYqUSUNucMscUnUJPNNKNZ6uNwHHS+doVUJ5oCBy2xTk1CdyOWuWdAQcpIzeREnidTonEfvf0zvXyje3+8iJYzd9kJRQec0LxonptMm5Ybh2ca3UEbsGU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gjQe3vOnUM0HDYi+f7D/Rm+AmxWDiuz4G4SPPlo0WMwpYtE2F7HesEy6bAsgmqL/49Ryesun94LIzTABbC6XOZGHbuOIqX4KgJS9zDkzsfS3HUAOt8wGlqmh8Kv26dssBrmO1TeeulaGBKJHWI3vWXmj9FTfSKwgIiUHIwu3jRkZV2USCXf+jq6HI6oRhtCGYTfK56Q7QZ3Sf9gv4VvvDgdkFYmIBqUlbe+OSEApYp3OTl8MkklJVlkR5hvtFNeB02lnz0Jbzr6YO8eOloxGqMbthEmiaNFY7Z/dXSbBzG36c+1pmWvo5gLD3yBk8zscfphX/xd3yg9WG1P41T9Oww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pCinxDI/FW/OY2j76PpngpyU91JFm3uGEUde7fyv80=;
 b=j1VLpl22rTmbRtZfk0tyCRaMXMj6e1rNd/rBpKIqGvZU0DiBgR0xisFH1SKaTmD3w3aTxgIeWzHBfPJcT3JsA7hMnG7+R6A3Ubfduwx9TUOkQdQlXne95JIPHW5LCvswd7yQ+H6JcKGF1QeargQgI2aYOaeqMo4rad9cVEcBrvbaV8OoXpCW4tVxsXU5S6SRRfevbV7zMhL7G2cUQMzA1a+tNvwa1Y1uJECj3RkTAshoS9YRs+io9RbCsVt3HSQY8pt9a5ANE6YpQO+hb0XeOP+8mQUs6+I1PVOFuZoIJLC5ZfBv1Zqo42YdukpUJV+O4FJJPmXGPRc8bLIm8LDoFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pCinxDI/FW/OY2j76PpngpyU91JFm3uGEUde7fyv80=;
 b=0R9ede7dUlNl36Y65SxSZ9PZ1ipMW3EQ/o5ZCwCjDaBUCkFlum28rvoYqUSUNucMscUnUJPNNKNZ6uNwHHS+doVUJ5oCBy2xTk1CdyOWuWdAQcpIzeREnidTonEfvf0zvXyje3+8iJYzd9kJRQec0LxonptMm5Ybh2ca3UEbsGU=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>
Subject: RE: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Thread-Topic: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Thread-Index:
 AQHXS6W/k/joZEkeaUiDjrfYH3jVEaro2ToAgAAR3sCAAC37gIAEZlqwgAAJrgCAFCGXIA==
Date: Thu, 3 Jun 2021 02:44:55 +0000
Message-ID:
 <VE1PR08MB52153C97BC35C39223897F92F73C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-8-penny.zheng@arm.com>
 <7e4706dc-70ea-4dc9-3d70-f07396b462d8@suse.com>
 <VE1PR08MB521528492991FDFC87AC361BF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <4389b5be-7d23-31d7-67e0-0068cba79934@suse.com>
 <VE1PR08MB521538B39E6290BBA0842F97F7299@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <cc03d9d9-227a-0788-1a88-b35a77f5f18d@suse.com>
In-Reply-To: <cc03d9d9-227a-0788-1a88-b35a77f5f18d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7B83CCE92746BE4AB485D11C59BDE16E.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.112]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 35558da4-c829-42d6-451f-08d92639a093
x-ms-traffictypediagnostic: VI1PR08MB3149:|AM0PR08MB3987:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3987694ED0FDFD1AA5581736F73C9@AM0PR08MB3987.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7GGQJzPp3OB0ALrEyTZiuemUpnYUjBWzzEO0q3VFmR08GVa4vrqL/68y9fPBrm3QzPVY6GCHgWB4lw1yxc5LUUqpjHtHAOPDrlDlfGndmxxzzRKEtu3qn830wZFGOwVnZUiMUFGHs82hDZJNKnKtKj0dpL7MgeMwpFdtX/xrUKAmAZfAh01n0wc6Fp21lj1EuaOF5Ma+nEwnEWzBVGv9FBjHQ5ELka+0mQRQsu/MAu2A7J+9aUlaJTLTK4XAB6JnqnFTSfHkgMxkLzXXgaL+mXnnPzsPk6+ryxgw8XjDBoeKm6VFR8VPy0URm7bphAl3LqRxkANo/dBmt2lNa1w0svMXzMCRXAItaq5kSQzgxae2Zhw7teg6Q5GdakdKWLcIlXClDPUaJWo9JsmWnqSacBs39y1/q2197fIxi5XP0t/+uDqW1HKc0P+yIbV5eEKcRQ4zG7Cbe5GM5O9llAEGsLBBB1bwa7m4BY7rqQVVU2atASL8LDC7snT9TYZ//QaykgO0dgKgdnrHD2r9bCHhT2zwvDBCxeXtYi6IUWPSAW7z/osyPx2j2UcmiIPVKf3pMB7LoC7ZXTfxpwNYKLwXvrtLPoIPda5BxlcDjfsCL+g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(7696005)(52536014)(4326008)(26005)(55016002)(186003)(2906002)(316002)(66446008)(66476007)(64756008)(66946007)(66556008)(76116006)(9686003)(54906003)(33656002)(38100700002)(122000001)(71200400001)(478600001)(83380400001)(86362001)(53546011)(8936002)(8676002)(5660300002)(6506007)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?Y0M1TnBIZkhJaEhVcVluWU93RmRPczJIQTdtMGtJQlladE41dnZMK21GSkFQ?=
 =?utf-8?B?R2Q1TVlZeDZFdWJDZlhEelFDZ1N1TTcwbGhwcmxHVXlCT25WYjNrczk2TmNk?=
 =?utf-8?B?Sit2MWtjK1FPL3M2MU41ZmRCdzhPdFlUenE0aGNoU0ZabE5JUWtXZ3NCdjFV?=
 =?utf-8?B?bHVUcUFmNnRQblBJWXpVSTZYaEIvMHZNYUY2ZDIrU3hWTjZlMk9TZzlZak9R?=
 =?utf-8?B?WEVVc2FZVzg0L3pYSEN6Z0FSQUxKeUdJeXo3QVdoaE1FblcrYmFybEZuMXIv?=
 =?utf-8?B?N295bnJqZnUxdkF5RHlZYzJ1OG52NVVyb3Fidmg0M3kxMTFwWFJ6SlB2WXpF?=
 =?utf-8?B?cTlmSmhMdXhFam03bmVxWWRTT3FqOGdFWTZzelRCNlNBTGI2bUwvYWRyWmlH?=
 =?utf-8?B?R1pGRFhlZ2NnU3cxZk56SGdkaGx3S0l0MzRZbzdoSVBpbUFjMzR0dlJ6QVlm?=
 =?utf-8?B?ai8wMWpMTnpZQmRCT0tkYVExSWM5V0tmMnVEOTZUOUZkTjZROThlWlR2ZWRX?=
 =?utf-8?B?MDFPSzY0UzROR3I4LzdPekNCMW5TM1BkQjhpbDhBY3QvOVR1eGEwQzVCeHhh?=
 =?utf-8?B?Yi9QMUF5VVd4cjVXaEcvLy95bVYxUnJ3dzNGaUlnRlBLVHlIbGVZQUlhQ05m?=
 =?utf-8?B?dmdTaWZWemgramhBMnpydDlwbUJtbHJ4UFM3WndacmRtbWtVVWEyNkx0Y1RO?=
 =?utf-8?B?alNlZVVOWXpyVDdZR29yem9qMHVHS0dIK25sU2xoZWQvcjNneVByWlFsYUti?=
 =?utf-8?B?ak1IWTZsTHdHcjBhQmlGMEFWMzFYWmVOSGRYYkczNUowTXpMWDBKZVJCUWxK?=
 =?utf-8?B?N09qdy9GdUdQc3llbWZnVEFBQVhGeGJOUFdKcmxndHc0cUZiRzBQMHRuNU9p?=
 =?utf-8?B?dUY4RjZPSGpsOGFOMWV1RzdCY2JySTNxbURSR2FMM0xadUVwM2tHTTRld2RD?=
 =?utf-8?B?eVN1WGg2VzdGZDg5aXJ1ODVDLzUzNEtzU29rSGorM0dEekU2a2NRSkVQaDdt?=
 =?utf-8?B?Q21nTHpsVjd0YWJtUVViK1lBSVQyNU0wejcwbDd5bUhJVDlJRG44UzBHRTVz?=
 =?utf-8?B?THM3TXJCN1VmRGoxNlpWb3BBS0FsME9TL2JQWjRGbzMwV2VpbXZQQnVSTnlw?=
 =?utf-8?B?YnRFZ251Z01vdE9JcHpPZ1lsczE2K1ZyOTFqN2dGNzV1UXFWMkkydU9nSjNF?=
 =?utf-8?B?dTVqcXpoWjBZeWJwK2ZKdGkzRGtWSjNoRjZYOCtLVnRENW9rcnFRVDJoRTln?=
 =?utf-8?B?Mk5iT3pnZ1ZDcUNlNnVOVU13UFZoVjI5RjlOdUtVWTJjWGkyRXlqd0VReWRw?=
 =?utf-8?B?bXdSRWpTV0hKNFhvYkdZRVFLdVlpN3lwU3FPdC9xaWtxa2xsbjhJcS9jMU9E?=
 =?utf-8?B?YlRVVDVERElhR0grZkxQaktxRFl4NFVCUXgwSWN5czdFaDdZK3F6L3BJSElE?=
 =?utf-8?B?Zkh6bmMzWkszV3RmZGowTWZiRjFQTmI1VHM4WUtvb0d1ZnRlWE1TWU1IUFov?=
 =?utf-8?B?VTB2UU1MQjdMN1JqeWwzZjVMOUlYMjkveWE4N05mMHRpNUphN3BCM1ZaeTdI?=
 =?utf-8?B?Z3ZLWml1a0VVZjlMTlBwWGliZlJnZkVIbTc5cmhtci92RUxIbjhOQ2xWSGc2?=
 =?utf-8?B?ejMvMW1lMjAyN1laelQyRDdxMkMvdnZaUnY5Rm1MQmpGTVNWSEhBM2FPN0hD?=
 =?utf-8?B?OGxNaHZJTnZPNFd0dElmb3lRQm8rZVlGWG1uWXNGQm1MVDRWOHlqcHozT04r?=
 =?utf-8?Q?7iS+E4o4h5gO0pUzW2K4Z3ervU+TfqgUUq/BdZO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3149
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6a73d5d-880c-412f-ae7b-08d926399377
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tRJDA4eyc8N7pZudgBhrt6E5rldvRiEzlkPjbRa0vRzfzPA+WthYEcqtoCfp91gMBm2pgoBaR0ZUIonBckfP1N/ydXWfQZIlXO78EmH4HG2gZyrmo+5ECbrqVrXOnlyzu0rPw/Q9dOjsOvXydxqPVNTzlzkrX+qvZAbiBirwC88VSBKLn/u+gvVX9FpnqVdUplMU0FaZxjASr022O1dMtCKz/o2FOA5Nc7qpyjOSi7v4nyCSv4HybD4iHdOeWJCuJARkKwx58QBK4IhuWz0jRGWwG13Zfn8pUrAL/brBbtm9Uu7SjxannU9dzNePj2hxvJmxPkFMCU8Ykkcs1PydKY15GIhepnVrTVP95Cqsb+ESQVBO4+AXwZ16teysHFEF3yJJg6u6K2bcEtfAsK6j1NnwIDy+8NRrKJukH+htdXWKwoDBV2MRlYuHxerzHMghQGlLh3Ud+pZZZObQPm0ywqGLo2Pyr4TnCjWry5OzCRqNrag1QOakzSKGi9VHpB6Q5Dbc2woXliXoMDsu/ZmZPUSDUsNbiQzSVZsAFpSD9ZmKBfmv7s8BiNvdoufGYzHguOw2KMcGP5APP7LBqHuLuXPFXpVlROmGJXC7AOdQw6oYi9mdBK5cfp61p+ztDTiTTite+XuviH+fkSNT+U8W881/EKzT1gj0LR+DC0VlMd8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966006)(36840700001)(36860700001)(86362001)(33656002)(186003)(8676002)(81166007)(54906003)(356005)(5660300002)(47076005)(6506007)(53546011)(9686003)(52536014)(6862004)(478600001)(82310400003)(83380400001)(70586007)(82740400003)(55016002)(70206006)(2906002)(316002)(336012)(7696005)(4326008)(26005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2021 02:45:19.8553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35558da4-c829-42d6-451f-08d92639a093
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3987

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBGcmlkYXksIE1heSAyMSwgMjAyMSAzOjA5
IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IEJlcnRy
YW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+IDxXZWku
Q2hlbkBhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGllbkB4ZW4ub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggMDcvMTBdIHhlbi9hcm06IGludHJ1ZHVjZSBhbGxvY19kb21zdGF0aWNf
cGFnZXMNCj4gDQo+IE9uIDIxLjA1LjIwMjEgMDg6NDEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
IEhpIEphbg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgTWF5
IDE4LCAyMDIxIDc6MjMgUE0NCj4gPj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0u
Y29tPg0KPiA+PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29t
PjsgV2VpIENoZW4NCj4gPj4gPFdlaS5DaGVuQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT47IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gPj4gc3N0YWJlbGxpbmlAa2VybmVsLm9y
ZzsganVsaWVuQHhlbi5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCAwNy8xMF0geGVuL2Fy
bTogaW50cnVkdWNlIGFsbG9jX2RvbXN0YXRpY19wYWdlcw0KPiA+Pg0KPiA+PiBPbiAxOC4wNS4y
MDIxIDEwOjU3LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+PiBGcm9tOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+ID4+Pj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDM6
MzUgUE0NCj4gPj4+Pg0KPiA+Pj4+IE9uIDE4LjA1LjIwMjEgMDc6MjEsIFBlbm55IFpoZW5nIHdy
b3RlOg0KPiA+Pj4+PiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+Pj4+PiArKysg
Yi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiA+Pj4+PiBAQCAtMjQ0Nyw2ICsyNDQ3LDkgQEAg
aW50IGFzc2lnbl9wYWdlcygNCj4gPj4+Pj4gICAgICB7DQo+ID4+Pj4+ICAgICAgICAgIEFTU0VS
VChwYWdlX2dldF9vd25lcigmcGdbaV0pID09IE5VTEwpOw0KPiA+Pj4+PiAgICAgICAgICBwYWdl
X3NldF9vd25lcigmcGdbaV0sIGQpOw0KPiA+Pj4+PiArICAgICAgICAvKiB1c2UgcGFnZV9zZXRf
cmVzZXJ2ZWRfb3duZXIgdG8gc2V0IGl0cyByZXNlcnZlZCBkb21haW4gb3duZXIuDQo+ID4+Pj4g
Ki8NCj4gPj4+Pj4gKyAgICAgICAgaWYgKCAocGdbaV0uY291bnRfaW5mbyAmIFBHQ19yZXNlcnZl
ZCkgKQ0KPiA+Pj4+PiArICAgICAgICAgICAgcGFnZV9zZXRfcmVzZXJ2ZWRfb3duZXIoJnBnW2ld
LCBkKTsNCj4gPj4+Pg0KPiA+Pj4+IE5vdyB0aGlzIGlzIHB1enpsaW5nOiBXaGF0J3MgdGhlIHBv
aW50IG9mIHNldHRpbmcgdHdvIG93bmVyIGZpZWxkcw0KPiA+Pj4+IHRvIHRoZSBzYW1lIHZhbHVl
PyBJIGFsc28gZG9uJ3QgcmVjYWxsIHlvdSBoYXZpbmcgaW50cm9kdWNlZA0KPiA+Pj4+IHBhZ2Vf
c2V0X3Jlc2VydmVkX293bmVyKCkgZm9yIHg4Niwgc28gaG93IGlzIHRoaXMgZ29pbmcgdG8gYnVp
bGQgdGhlcmU/DQo+ID4+Pj4NCj4gPj4+DQo+ID4+PiBUaGFua3MgZm9yIHBvaW50aW5nIG91dCB0
aGF0IGl0IHdpbGwgZmFpbCBvbiB4ODYuDQo+ID4+PiBBcyBmb3IgdGhlIHNhbWUgdmFsdWUsIHN1
cmUsIEkgc2hhbGwgY2hhbmdlIGl0IHRvIGRvbWlkX3QgZG9taWQgdG8NCj4gPj4+IHJlY29yZCBp
dHMNCj4gPj4gcmVzZXJ2ZWQgb3duZXIuDQo+ID4+PiBPbmx5IGRvbWlkIGlzIGVub3VnaCBmb3Ig
ZGlmZmVyZW50aWF0ZS4NCj4gPj4+IEFuZCBldmVuIHdoZW4gZG9tYWluIGdldCByZWJvb3RlZCwg
c3RydWN0IGRvbWFpbiBtYXkgYmUgZGVzdHJveWVkLA0KPiA+Pj4gYnV0IGRvbWlkIHdpbGwgc3Rh
eXMgVGhlIHNhbWUuDQo+ID4+DQo+ID4+IFdpbGwgaXQ/IEFyZSB5b3UgaW50ZW5kaW5nIHRvIHB1
dCBpbiBwbGFjZSByZXN0cmljdGlvbnMgdGhhdCBtYWtlIGl0DQo+ID4+IGltcG9zc2libGUgZm9y
IHRoZSBJRCB0byBnZXQgcmUtdXNlZCBieSBhbm90aGVyIGRvbWFpbj8NCj4gPj4NCj4gPj4+IE1h
am9yIHVzZXIgY2FzZXMgZm9yIGRvbWFpbiBvbiBzdGF0aWMgYWxsb2NhdGlvbiBhcmUgcmVmZXJy
aW5nIHRvDQo+ID4+PiB0aGUgd2hvbGUgc3lzdGVtIGFyZSBzdGF0aWMsIE5vIHJ1bnRpbWUgY3Jl
YXRpb24uDQo+ID4+DQo+ID4+IFJpZ2h0LCBidXQgdGhhdCdzIG5vdCBjdXJyZW50bHkgZW5mb3Jj
ZWQgYWZhaWNzLiBJZiB5b3Ugd291bGQgZW5mb3JjZQ0KPiA+PiBpdCwgaXQgbWF5IHNpbXBsaWZ5
IGEgbnVtYmVyIG9mIHRoaW5ncy4NCj4gPj4NCj4gPj4+Pj4gQEAgLTI1MDksNiArMjUxMiw1NiBA
QCBzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19kb21oZWFwX3BhZ2VzKA0KPiA+Pj4+PiAgICAgIHJl
dHVybiBwZzsNCj4gPj4+Pj4gIH0NCj4gPj4+Pj4NCj4gPj4+Pj4gKy8qDQo+ID4+Pj4+ICsgKiBB
bGxvY2F0ZSBucl9wZm5zIGNvbnRpZ3VvdXMgcGFnZXMsIHN0YXJ0aW5nIGF0ICNzdGFydCwgb2YN
Cj4gPj4+Pj4gK3N0YXRpYyBtZW1vcnksDQo+ID4+Pj4+ICsgKiB0aGVuIGFzc2lnbiB0aGVtIHRv
IG9uZSBzcGVjaWZpYyBkb21haW4gI2QuDQo+ID4+Pj4+ICsgKiBJdCBpcyB0aGUgZXF1aXZhbGVu
dCBvZiBhbGxvY19kb21oZWFwX3BhZ2VzIGZvciBzdGF0aWMgbWVtb3J5Lg0KPiA+Pj4+PiArICov
DQo+ID4+Pj4+ICtzdHJ1Y3QgcGFnZV9pbmZvICphbGxvY19kb21zdGF0aWNfcGFnZXMoDQo+ID4+
Pj4+ICsgICAgICAgIHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgbnJfcGZucywgcGFk
ZHJfdCBzdGFydCwNCj4gPj4+Pj4gKyAgICAgICAgdW5zaWduZWQgaW50IG1lbWZsYWdzKQ0KPiA+
Pj4+PiArew0KPiA+Pj4+PiArICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnID0gTlVMTDsNCj4gPj4+
Pj4gKyAgICB1bnNpZ25lZCBsb25nIGRtYV9zaXplOw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAg
QVNTRVJUKCFpbl9pcnEoKSk7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgICBpZiAoIG1lbWZsYWdz
ICYgTUVNRl9ub19vd25lciApDQo+ID4+Pj4+ICsgICAgICAgIG1lbWZsYWdzIHw9IE1FTUZfbm9f
cmVmY291bnQ7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgICBpZiAoICFkbWFfYml0c2l6ZSApDQo+
ID4+Pj4+ICsgICAgICAgIG1lbWZsYWdzICY9IH5NRU1GX25vX2RtYTsNCj4gPj4+Pj4gKyAgICBl
bHNlDQo+ID4+Pj4+ICsgICAgew0KPiA+Pj4+PiArICAgICAgICBkbWFfc2l6ZSA9IDF1bCA8PCBi
aXRzX3RvX3pvbmUoZG1hX2JpdHNpemUpOw0KPiA+Pj4+PiArICAgICAgICAvKiBTdGFydGluZyBh
ZGRyZXNzIHNoYWxsIG1lZXQgdGhlIERNQSBsaW1pdGF0aW9uLiAqLw0KPiA+Pj4+PiArICAgICAg
ICBpZiAoIGRtYV9zaXplICYmIHN0YXJ0IDwgZG1hX3NpemUgKQ0KPiA+Pj4+PiArICAgICAgICAg
ICAgcmV0dXJuIE5VTEw7DQo+ID4+Pj4NCj4gPj4+PiBJdCBpcyB0aGUgZW50aXJlIHJhbmdlIChp
LmUuIGluIHBhcnRpY3VsYXIgdGhlIGxhc3QgYnl0ZSkgd2hpY2gNCj4gPj4+PiBuZWVkcyB0byBt
ZWV0IHN1Y2ggYSByZXN0cmljdGlvbi4gSSdtIG5vdCBjb252aW5jZWQgdGhvdWdoIHRoYXQgRE1B
DQo+ID4+Pj4gd2lkdGggcmVzdHJpY3Rpb25zIGFuZCBzdGF0aWMgYWxsb2NhdGlvbiBhcmUgc2Vu
c2libGUgdG8gY29leGlzdC4NCj4gPj4+Pg0KPiA+Pj4NCj4gPj4+IEZXSVQsIGlmIHN0YXJ0aW5n
IGFkZHJlc3MgbWVldHMgdGhlIGxpbWl0YXRpb24sIHRoZSBsYXN0IGJ5dGUsDQo+ID4+PiBncmVh
dGVyIHRoYW4gc3RhcnRpbmcgYWRkcmVzcyBzaGFsbCBtZWV0IGl0IHRvby4NCj4gPj4NCj4gPj4g
SSdtIGFmcmFpZCBJIGRvbid0IGtub3cgd2hhdCB5b3UncmUgbWVhbmluZyB0byB0ZWxsIG1lIGhl
cmUuDQo+ID4+DQo+ID4NCj4gPiBSZWZlcnJpbmcgdG8gYWxsb2NfZG9taGVhcF9wYWdlcywgaWYg
YGRtYV9iaXRzaXplYCBpcyBub25lLXplcm8gdmFsdWUsDQo+ID4gaXQgd2lsbCB1c2UgIGFsbG9j
X2hlYXBfcGFnZXMgdG8gYWxsb2NhdGUgcGFnZXMgZnJvbSBbZG1hX3pvbmUgKyAxLA0KPiA+IHpv
bmVfaGldLCBgZG1hX3pvbmUgKyAxYCBwb2ludGluZyB0byBhZGRyZXNzIGxhcmdlciB0aGFuIDJe
KGRtYV96b25lICsgMSkuDQo+ID4gU28gSSB3YXMgc2V0dGluZyBhZGRyZXNzIGxpbWl0YXRpb24g
Zm9yIHRoZSBzdGFydGluZyBhZGRyZXNzLg0KPiANCj4gQnV0IGRvZXMgdGhpcyB6b25lIGNvbmNl
cHQgYXBwbHkgdG8gc3RhdGljIHBhZ2VzIGF0IGFsbD8NCj4gDQoNCk9oLCBzbyBzb3JyeS4gSSBm
aW5hbGx5IGdvdCB3aGF0IHlvdSB3ZXJlIGFza2luZyBoZXJlLiBIbW0sIEkgd2FzIHVzaW5nIHRo
ZSBsb2dpYyBpbg0KYml0c190b196b25lIHRvIGRvIHRoZSBhZGRyZXNzIGJpdHMgdHJhbnNsYXRp
b24uIEJ1dCBJIGdvdCwgaXQgd2lsbCBicmluZyBjb25mdXNpb24uIEknbGwNCmZpeCBpdC4gVGh4
Lg0KDQo+IEphbg0K

