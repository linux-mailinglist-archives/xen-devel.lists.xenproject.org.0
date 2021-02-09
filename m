Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC02F314CE9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 11:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83185.154237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9QDD-00023C-5x; Tue, 09 Feb 2021 10:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83185.154237; Tue, 09 Feb 2021 10:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9QDD-00022m-1h; Tue, 09 Feb 2021 10:25:39 +0000
Received: by outflank-mailman (input) for mailman id 83185;
 Tue, 09 Feb 2021 10:25:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kDMm=HL=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l9QDA-00022h-Qr
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 10:25:37 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::617])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b8d5cb1-0ecb-43e5-8892-2ec872e26aa7;
 Tue, 09 Feb 2021 10:25:34 +0000 (UTC)
Received: from AM3PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:207::28) by
 AM5PR0802MB2420.eurprd08.prod.outlook.com (2603:10a6:203:9e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Tue, 9 Feb
 2021 10:25:32 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:0:cafe::19) by AM3PR04CA0144.outlook.office365.com
 (2603:10a6:207::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Tue, 9 Feb 2021 10:25:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 9 Feb 2021 10:25:31 +0000
Received: ("Tessian outbound 4d8113405d55:v71");
 Tue, 09 Feb 2021 10:25:31 +0000
Received: from 7662cbe77fa4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C91F0C8F-5AE5-4C19-9420-27A919CAF9FE.1; 
 Tue, 09 Feb 2021 10:25:25 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7662cbe77fa4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 09 Feb 2021 10:25:25 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB5422.eurprd08.prod.outlook.com (2603:10a6:803:12e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Tue, 9 Feb
 2021 10:25:24 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 10:25:23 +0000
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
X-Inumbo-ID: 2b8d5cb1-0ecb-43e5-8892-2ec872e26aa7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zefSISgaWRNh6z2H7QFf3Laz3IEn6VRp+GE51AU420=;
 b=BwUZASTQ5k2vxxYeS+zqTpJZdxHJmtNXZsWNdgKuB8pDPUWvFUsAoPuPVJ099ji1WOWnPlh1pxRv8JTw/Tm7tRAsED3LqYY+0KjTHUXcaM9cEdR5cieL1ZNHoO2+bqAMYTLLWhruTaMZXU4rR6AQJXyV0rr7HzO1Z3HVxS7Bmd0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99f6bfaa43d52bf2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyKAtDA5Ltc/W6PP8tDrYE8ywTAtc2FaphIXjVtvAmBWiwjYXFRtL9jgUtl+fa2YQd88pFP3WAVP2QUF4yqZUOURggAYN8Rxv0wAZR0kzgKuVXzBb7xBk92ts3ppVk/cKOzMj7oWyzYJ4qGvg++RuCiuX7Wn3iH28uNSxTtszAH1pBpbUBljqgc9bXmvpaMo+YdAk+pSqGvTsjgLLVK8SAdNlL4ioYAA1aa0/1k94nkuVt6zbnjchXalVh0W36TB8zZttMhiMzERIIZLf9vvC+MXLymbQO20HTp5BkF0FZVSG1kkNcBaR/ZSLt56fwC0HgnufIPwKQ/tBh8gYJrkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zefSISgaWRNh6z2H7QFf3Laz3IEn6VRp+GE51AU420=;
 b=b/3/ab8QrgFK3gQFEVl+ZTGUPA3Anbs6qJ2ZMtE3vXbrbBeTy0TnIPPxg1euaLAHnZNDmFNDcJvwvhAy3bP0Wc2KxiOxSOgaHx166qQsm4/Lph0iwv557bBNgvdDfmomqrSh53B/6eS7Zwv9PM4ADwfqNv3UkutSgiqHqm1PukIMBW1PuQDKnIEgjhtvG0wjfhMb//n0GH+BjjhWO4IN2lB4HTdDLEjrnvkcnrGfmp9sTKl1P6Z4glL5U16ZsIHv56AIY8/NgilDj3IZCEp6crpiIvK/Sg1eJ7NeZBribseydkQ297phOkCffaAFnejGDLXn0Vnijd/PaX1Wx+Zlhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3zefSISgaWRNh6z2H7QFf3Laz3IEn6VRp+GE51AU420=;
 b=BwUZASTQ5k2vxxYeS+zqTpJZdxHJmtNXZsWNdgKuB8pDPUWvFUsAoPuPVJ099ji1WOWnPlh1pxRv8JTw/Tm7tRAsED3LqYY+0KjTHUXcaM9cEdR5cieL1ZNHoO2+bqAMYTLLWhruTaMZXU4rR6AQJXyV0rr7HzO1Z3HVxS7Bmd0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"ehem+xen@m5p.com" <ehem+xen@m5p.com>
Subject: Re: [PATCH] xen: workaround missing device_type property in pci/pcie
 nodes
Thread-Topic: [PATCH] xen: workaround missing device_type property in pci/pcie
 nodes
Thread-Index: AQHW/nYULOKwv72r4kWh+gedUrMffqpPntOA
Date: Tue, 9 Feb 2021 10:25:23 +0000
Message-ID: <22372A39-83F4-41AB-8FCC-B3A9C8551604@arm.com>
References: <alpine.DEB.2.21.2102081544230.8948@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102081544230.8948@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6d8790b3-3c75-403c-3f4b-08d8cce50757
x-ms-traffictypediagnostic: VI1PR08MB5422:|AM5PR0802MB2420:
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB2420D38C4D29B269A4B40E559D8E9@AM5PR0802MB2420.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zCFSRXgVwNbvvt1Q1Icbqk4aBBrQWeapFX5u+/QaKx36jvAE3D0T/DguxfPIqEYuUtLvsMWE+jHvOIpagJn7Bwv/oVwzwUJBLUjEJRFy2bngLe4dcpXDGOIgcCXCJTJPpKyCCeGr/yb2EC5ZlCQaBu1udwAizYGqFlizO+4ZA5It6bKbHHqbvE+gZWp4uS0KSSD2AHy7Rb1jNelZQ0At8+1qP24aXWe39O2EEnwJWZTKT+n8WLircnUbPHQNuiCnSyMiLZ9kiKSHy6dFqfkQUZaqnjIwipEPR1vSvOcPWkjwOK02cCqphK+ApXysuTL6bSyOdG8fQSe1MF23pw5AHo2d+h7LFtd376W70W/tfdjmDpr7UvwthGuVHDfFxJZpFw2HJ/jdrxshNP1AdRLi2EQ+fhxzF9USd4RwE7uOpbtB7wtXL3hcGLAlEPqinwRjlK1SmrzwkZzeOupGxktf+Oju+yvzd6jYGBt6xmQe7yGhhyRrfTcLP4hBPsjy5vhy/sulUduIhX0s/MssS7/Zzr7cG5O1R/I3xm2FgNEX1mER2ktBZ0YWHhlTLwJLhwUaUGp9O3PrVz/RVsfJdOmX0g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39830400003)(366004)(346002)(396003)(186003)(2616005)(5660300002)(6512007)(26005)(83380400001)(2906002)(316002)(8936002)(66946007)(4326008)(8676002)(478600001)(6486002)(66446008)(64756008)(53546011)(66556008)(66476007)(55236004)(76116006)(91956017)(36756003)(54906003)(6916009)(71200400001)(33656002)(6506007)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?NVA1N29od2lUWmhEeldkZGIraDlGV0wzLzJqamdZNEFpNU5zWUk4MkJ1bDhV?=
 =?utf-8?B?YkNFbkhiM3YveGlSZTNxN3MzNnc0NHlSaUV2SkRtQ2N6WDZEWUExUGRKQUtY?=
 =?utf-8?B?ZUVKYkgvTEpwZUZ6ZVNJSkRqV2VFRE8zdnptb1lhWjRyMkxvWHdEbyt5RlhQ?=
 =?utf-8?B?N3RNVnRBZnNqRU9mSldjUk5YK1pUaDV1YWtUZkR6MjJ3UStmTVMrTDFaUXdJ?=
 =?utf-8?B?bUV2WjFGVk5URU9Qd3hZdy82TXl3T0NWSzNNZnU0eGFZbnkyemI0R2ZoMmxO?=
 =?utf-8?B?anN0b2lTYmpHOGhLU2lsY1VpOEpGK285UTVRMTRFMGtHRlhRSldBVTZNY0xs?=
 =?utf-8?B?K3VRM2s1MTZBZFVJcVE0ZHVwNlpLcmFoSTF2TDNQWWhra29TRXd4SVIxN012?=
 =?utf-8?B?SjRFZEg1c2RSVHJDOHVHcTFTRTFPZCtFNmhaN1pQQ2FqellkZ0RUNCswYWNq?=
 =?utf-8?B?bTFQL3lWNkkycThOcG1qbGhkSzFHZTVGWkExVFRFZWRGZ2pJeTRrZjl3UkJX?=
 =?utf-8?B?M1NBNVdiOGxEb2x5WVA5OThoN2FnVjAyWkEwb0wzZDJGTkUybUpITGdEMGhr?=
 =?utf-8?B?YzdBYm9taU9HVXVmTnVVMFZIVk41ZjJ5M1h0RjZvdm50RWFZS1BoWEVkZWhx?=
 =?utf-8?B?NzBEZHFEalNDbVIxQkpOUmErbG1na1M2cTdlaG1xcVA0c0Ivd2tKMmhuZll2?=
 =?utf-8?B?T2JjUnFSc0ttb1gwb3dkRFNlRytGMGJsOWFFM1dnQWxYV2dtdHBrSEhib0ky?=
 =?utf-8?B?dUYvakhlUEhqOUMxMDM4Um0yWnYxR2tiajVxVkxvQksyMTFvWUJZSjd1VXFl?=
 =?utf-8?B?ZytDWm1ldzg1L2NmaXM5dGRFWkl5bXJkK056aVJBUWhYSWJUNjhBWHVJZ2ZV?=
 =?utf-8?B?NExnWmZkWVZuRlhCNTk5OGlzNnB3elpZeEVxc1BJZnBydVkreEVJSGREeERj?=
 =?utf-8?B?NUlvbmdRQ3RUWjlPQ1l5UWpab2FXRThOVUV6Y1M5UE9NYnpWcVhrbVU1RFBB?=
 =?utf-8?B?cEJDMDhJT3JsTkNyemZDdjFwMGlWUkQzMGFXbUF4dmlYZVNFeUtBYWZRR25G?=
 =?utf-8?B?a1FvWlI4M2xOeXF1K3ZaNTlYdEhVL2ZJclRWckovYWg1NEpGaS9vZStZWi9x?=
 =?utf-8?B?ZTNnLzBmT1JTWTlHb2FBYnRyN1d0SzFFSW9NVFY4R21aTVg1UnYxQkFlb0Rq?=
 =?utf-8?B?ZlFwNHU1dlM0NDRJNlI5eWxTMnNzclBiR3lZYUMxbGlZY3lKL3NtMXMrb0Ji?=
 =?utf-8?B?THdhaVJvOStkTHZtOEJzcXNBeHhoSTMyRHBaOHY4Y0l6K3VtVEdQd2Y5VHRk?=
 =?utf-8?B?cmhOZkNWbUdWT29FRGs2WVF0MW1BLzRQUVM5eGlvaXFpK0JTeURVUlFaU0JR?=
 =?utf-8?B?QVIyT3RkMVp4THZmQ2hNWW1abnVUVG9NRitNOGdta2VNalVyWWtsclVDZTdM?=
 =?utf-8?B?MmhkWU5PaEhZZ21iRTNIN0dxdmdyb0JYc29DbDBJYUlZV2dJcXRyYkYzT0JD?=
 =?utf-8?B?Z0RZRHMrTUZ6SktZNkNKVVAyYldWNy93SUxnMGtYcUhJUXVKeTl1ZFNrV050?=
 =?utf-8?B?djIyMjdJQmV6YXd4dFAvUzZCTVU1dWpyRFIwQWlFcXRCakliakM2SU5zMFdO?=
 =?utf-8?B?OVlkYVN3SURPQkd3LzgxM3NBRUhHTnRVbUNBSkpSSlNUY1UxaHgrSjRKVnBP?=
 =?utf-8?B?RENMUnBTTmNFK2Vmdm1NVEkrdDNscUVnNEk2TEQ4L2ZFV0JxV1FDdURldVlJ?=
 =?utf-8?Q?25jPSYNgpHTj5OaU0DCB6afMUjWgm/n8uKg+1/s?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F09C2EC468212A419652F4B41F6A10BE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5422
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	07f1a390-3123-4474-f9c6-08d8cce502c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uX+drHPHnUfxeO9CQLD1zVRKVLE3KECNDsIt7YOoZ/ZaiJMn/YDwXAg62T6B5j33fUGaVjuIKT7WiSwDTo+D3mn9hvrTzxOVEEq3JqIPL+eIci8rxT6m2PRhtVQxFdW5G3LTgClbwhMpwxpNy8BhNre3YYFLkDz6avZt8gq9CGgdOKsryAOatVk7GaNDfxb4BASLZfIcoREPacT9UsdNfrBq3XrNPxoHWrfuA8+U77LQEpavwH1ua1IUIXdvkav9gMFbpD9gnE8Dfhp64QVWwPjigGNGXdE2Wsf9HJaPhj6Uaiwwc18yUwARkk+Z5qeg8KWRxYaYtldDeekUvMLEHrHbRRqkEY/nnfYGOfBc6sl/eo2fSd6WfriWtU/WPQyQ5mWjEZcIZBH4+YQ+ZkTIZSXciH0UdYPgS9XstzUjJhBMxXKsliIWZOVWk7ajvmpYdHtMaikfgnUxMlP90lgm66KZqAFGzHfBI8RcTH+fnpzZ4Bd3X47K0naq+8hmejbTvXG9QMPhPebVU9zLTopBTEIjx7pN8ulKr8a4ySSq0KbU5dIiICMmlNkJz9InIQ0lGgsbrdoO4psRdewnGEGTwnO40/ewxUBv6FH8NqTRXo7WImxsywfr/sNU3NanYnsXiQ6NzfDD3zlC6KuIeXNYZaZKtZoSIz7UaPBebKh1z+A=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39830400003)(396003)(136003)(346002)(376002)(46966006)(36840700001)(36860700001)(33656002)(47076005)(356005)(81166007)(70206006)(2906002)(316002)(54906003)(36756003)(2616005)(8936002)(55236004)(6862004)(6512007)(186003)(53546011)(4326008)(6486002)(82310400003)(86362001)(6506007)(26005)(8676002)(83380400001)(478600001)(336012)(70586007)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 10:25:31.3371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8790b3-3c75-403c-3f4b-08d8cce50757
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2420

SGkgU3RlZmFubywNCg0KPiBPbiA4IEZlYiAyMDIxLCBhdCAyMzo1NiwgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IFBDSSBidXNlcyBkaWZm
ZXIgZnJvbSBkZWZhdWx0IGJ1c2VzIGluIGEgZmV3IGltcG9ydGFudCB3YXlzLCBzbyBpdCBpcw0K
PiBpbXBvcnRhbnQgdG8gZGV0ZWN0IHRoZW0gcHJvcGVybHkuIE5vcm1hbGx5LCBQQ0kgYnVzZXMg
YXJlIGV4cGVjdGVkIHRvDQo+IGhhdmUgdGhlIGZvbGxvd2luZyBwcm9wZXJ0eToNCj4gDQo+ICAg
IGRldmljZV90eXBlID0gInBjaSINCj4gDQo+IEluIHJlYWxpdHksIGl0IGlzIG5vdCBhbHdheXMg
dGhlIGNhc2UuIFRvIGhhbmRsZSBQQ0kgYnVzIG5vZGVzIHRoYXQNCj4gZG9uJ3QgaGF2ZSB0aGUg
ZGV2aWNlX3R5cGUgcHJvcGVydHksIGFsc28gY29uc2lkZXIgdGhlIG5vZGUgbmFtZTogaWYgdGhl
DQo+IG5vZGUgbmFtZSBpcyAicGNpZSIgb3IgInBjaSIgdGhlbiBjb25zaWRlciB0aGUgYnVzIGFz
IGEgUENJIGJ1cy4NCj4gDQo+IFRoaXMgY29tbWl0IGlzIGJhc2VkIG9uIHRoZSBMaW51eCBrZXJu
ZWwgY29tbWl0DQo+IGQxYWMwMDAyZGQyOSAib2Y6IGFkZHJlc3M6IFdvcmsgYXJvdW5kIG1pc3Np
bmcgZGV2aWNlX3R5cGUgcHJvcGVydHkgaW4NCj4gcGNpZSBub2RlcyIuDQo+IA0KPiBUaGlzIGZp
eGVzIFhlbiBib290IG9uIFJQaTQuDQoNCldlIGFyZSByZWFsbHkgaGFuZGxpbmcgaGVyZSBhIHdy
b25nIGRldmljZS10cmVlIGJ1ZyB0aGF0IGNvdWxkIGVhc2lseSBiZSBmaXhlZA0KYnkgdGhlIHVz
ZXIuDQpXZSBzaG91bGQgYXQgbGVhc3QgbWVudGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhh
dCB0aGlzIGlzIGEgd29ya2Fyb3VuZA0KdG8gc29sdmUgUlBpNCBidWdneSBkZXZpY2UgdHJlZS4N
Cg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJl
bGxpbmlAeGlsaW54LmNvbT4NCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RldmljZV90
cmVlLmMgYi94ZW4vY29tbW9uL2RldmljZV90cmVlLmMNCj4gaW5kZXggMTg4MjVlMzMzZS4uZjFh
OTZhM2I5MCAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jDQo+ICsrKyBi
L3hlbi9jb21tb24vZGV2aWNlX3RyZWUuYw0KPiBAQCAtNTYzLDE0ICs1NjMsMjggQEAgc3RhdGlj
IHVuc2lnbmVkIGludCBkdF9idXNfZGVmYXVsdF9nZXRfZmxhZ3MoY29uc3QgX19iZTMyICphZGRy
KQ0KPiAgKiBQQ0kgYnVzIHNwZWNpZmljIHRyYW5zbGF0b3INCj4gICovDQo+IA0KPiArc3RhdGlj
IGJvb2xfdCBkdF9ub2RlX2lzX3BjaShjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wKQ0K
PiArew0KPiArICAgIGJvb2wgaXNfcGNpID0gIXN0cmNtcChucC0+bmFtZSwgInBjaWUiKSB8fCAh
c3RyY21wKG5wLT5uYW1lLCAicGNpIik7DQoNClRoZSBMaW51eCBjb21taXQgaXMgYSBiaXQgbW9y
ZSByZXN0cmljdGl2ZSBhbmQgb25seSBkb2VzIHRoYXQgZm9yIOKAnHBjaWXigJ0uDQpBbnkgcmVh
c29uIHdoeSB5b3UgYWxzbyB3YW50IHRvIGhhdmUgdGhpcyB3b3JrYXJvdW5kIGRvbmUgYWxzbyBm
b3Ig4oCccGNp4oCdID8NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+ICsNCj4gKyAgICBpZiAoaXNf
cGNpKQ0KPiArICAgICAgICBwcmludGsoWEVOTE9HX1dBUk5JTkcgIiVzOiBNaXNzaW5nIGRldmlj
ZV90eXBlXG4iLCBucC0+ZnVsbF9uYW1lKTsNCj4gKw0KPiArICAgIHJldHVybiBpc19wY2k7DQo+
ICt9DQo+ICsNCj4gc3RhdGljIGJvb2xfdCBkdF9idXNfcGNpX21hdGNoKGNvbnN0IHN0cnVjdCBk
dF9kZXZpY2Vfbm9kZSAqbnApDQo+IHsNCj4gICAgIC8qDQo+ICAgICAgKiAicGNpZXgiIGlzIFBD
SSBFeHByZXNzICJ2Y2kiIGlzIGZvciB0aGUgL2NoYW9zIGJyaWRnZSBvbiAxc3QtZ2VuIFBDSQ0K
PiAgICAgICogcG93ZXJtYWNzICJodCIgaXMgaHlwZXJ0cmFuc3BvcnQNCj4gKyAgICAgKg0KPiAr
ICAgICAqIElmIG5vbmUgb2YgdGhlIGRldmljZV90eXBlIG1hdGNoLCBhbmQgdGhhdCB0aGUgbm9k
ZSBuYW1lIGlzDQo+ICsgICAgICogInBjaWUiIG9yICJwY2kiLCBhY2NlcHQgdGhlIGRldmljZSBh
cyBQQ0kgKHdpdGggYSB3YXJuaW5nKS4NCj4gICAgICAqLw0KPiAgICAgcmV0dXJuICFzdHJjbXAo
bnAtPnR5cGUsICJwY2kiKSB8fCAhc3RyY21wKG5wLT50eXBlLCAicGNpZXgiKSB8fA0KPiAtICAg
ICAgICAhc3RyY21wKG5wLT50eXBlLCAidmNpIikgfHwgIXN0cmNtcChucC0+dHlwZSwgImh0Iik7
DQo+ICsgICAgICAgICFzdHJjbXAobnAtPnR5cGUsICJ2Y2kiKSB8fCAhc3RyY21wKG5wLT50eXBl
LCAiaHQiKSB8fA0KPiArICAgICAgICBkdF9ub2RlX2lzX3BjaShucCk7DQo+IH0NCj4gDQo+IHN0
YXRpYyB2b2lkIGR0X2J1c19wY2lfY291bnRfY2VsbHMoY29uc3Qgc3RydWN0IGR0X2RldmljZV9u
b2RlICpucCwNCj4gDQoNCg==

