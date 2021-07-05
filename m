Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C01F93BB55D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 05:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149754.276996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0EzW-0007aQ-4e; Mon, 05 Jul 2021 03:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149754.276996; Mon, 05 Jul 2021 03:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0EzW-0007XP-1G; Mon, 05 Jul 2021 03:09:50 +0000
Received: by outflank-mailman (input) for mailman id 149754;
 Mon, 05 Jul 2021 03:09:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kFf=L5=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1m0EzT-0007XJ-NW
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 03:09:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbd37de5-cea5-4b67-a6f6-007332e21343;
 Mon, 05 Jul 2021 03:09:44 +0000 (UTC)
Received: from DB6P193CA0006.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::16) by
 VE1PR08MB4848.eurprd08.prod.outlook.com (2603:10a6:802:a7::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.27; Mon, 5 Jul 2021 03:09:41 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::30) by DB6P193CA0006.outlook.office365.com
 (2603:10a6:6:29::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Mon, 5 Jul 2021 03:09:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 03:09:41 +0000
Received: ("Tessian outbound f29a5a293366:v97");
 Mon, 05 Jul 2021 03:09:41 +0000
Received: from eb2d3a3425a8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2983975C-BBAA-46B7-918F-BB8C0C493DE3.1; 
 Mon, 05 Jul 2021 03:09:34 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eb2d3a3425a8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jul 2021 03:09:34 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB5392.eurprd08.prod.outlook.com (2603:10a6:803:131::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 03:09:32 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 03:09:32 +0000
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
X-Inumbo-ID: dbd37de5-cea5-4b67-a6f6-007332e21343
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xVWplOtYYC77d8mpvdrZFeZ/VyCcv1cqSvaZfi6Ieg=;
 b=9ocUjIbGQZvPA2JMrUlD6e0pwRaA4jtjuET4r+4q2dUNqtpZqaaeNmFaBCzIPRa7j5Lux9euTQcrCOTL65ccQaXbRVxOuG6z5LahyNiy4kmS2KaHJAJPR8AmUiXroee4IvZh8u1+We6KhpuSbluAIJB+4uPs3rfz+aChmF15T/Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNUMXFM+0MT/PkCH0pWa57hQxQ/QyCqWTAyxm5nv3XlbgfR83ut+mLEj9bI59fYXlSU5zv2EsoiLGEGHlf3O2Zp1g50MR2Jm+mV749xSPg7SPASdhnZtG79dXM4Usont1aCa36hrT472cgIm9CejB4sst2EBW1rcxpgcHe32LsMe/hEopV4jodcyVe4KT+s9tyAjRLewR/u3IJQd90ytMi0SBB2FDd+2r86649bMhet6iHutFOiCVuCz5oX6cEawPqYNMfS42xc5fTLd68yGZk5QHJRTYQxHT/7ZqxhNKFq4HaI/uH6KJtqKP8UXwXFKHRsWOLYDBIl2kvimD29HcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xVWplOtYYC77d8mpvdrZFeZ/VyCcv1cqSvaZfi6Ieg=;
 b=L7cC3f+feDMKAxguBPNPNyqydLwjFVxekOUiqe4f/BjbKr88BjvxIr/Ui7AlGt9bSyqApnV6UVGpkz+P7BuWIBkS0NBetyQJz3kGfiSiHHfvL310hofGGVLtnxeP7E1MU3aobGEs9xdar/gc3ZUrK2/XgKRzuCpBYegQg9YyqdyotKiHqn9Vzbje5CD1Dp5zKVQV1HgulSZj49TLDwtSLA5qkLsikOMO6QJWa4zo0mW+x1q6zzUe0bxeSPGVGLt+Bje8cukFhxLlCHQqYy0FYylv5WKv3FXJjG09rbjZoFrVtUvYAuR3WJiPMRhM2yuvi4dk56+dTNMgRTi6ITVjSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xVWplOtYYC77d8mpvdrZFeZ/VyCcv1cqSvaZfi6Ieg=;
 b=9ocUjIbGQZvPA2JMrUlD6e0pwRaA4jtjuET4r+4q2dUNqtpZqaaeNmFaBCzIPRa7j5Lux9euTQcrCOTL65ccQaXbRVxOuG6z5LahyNiy4kmS2KaHJAJPR8AmUiXroee4IvZh8u1+We6KhpuSbluAIJB+4uPs3rfz+aChmF15T/Y=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "jbeulich@suse.com" <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH 2/9] xen/arm: introduce PGC_reserved
Thread-Topic: [PATCH 2/9] xen/arm: introduce PGC_reserved
Thread-Index: AQHXW0bwHTQXl1IIhEKAMxa4O5onFKss+IkAgAbmToA=
Date: Mon, 5 Jul 2021 03:09:31 +0000
Message-ID:
 <VE1PR08MB52159420DF3B478AD65AB5B5F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-3-penny.zheng@arm.com>
 <1f1c1567-1a53-3b6a-2868-b7673d9180b3@xen.org>
In-Reply-To: <1f1c1567-1a53-3b6a-2868-b7673d9180b3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0020D2901BDBC644AFD49EC76997419B.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.113]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0915e13d-4faf-49ac-35d6-08d93f62550b
x-ms-traffictypediagnostic: VI1PR08MB5392:|VE1PR08MB4848:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB48481159EFB81F8A8D831AC3F71C9@VE1PR08MB4848.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 if3dEiRB+uxo3tWzY0MrZwMBZUGHz/6fBvYmQFWbq5oKbsNpR3gHQ2TqWmhJeeH0It4Nk0C1CaufF/GtMZC55Yidw2QtY3M6DPlyeOMMBoqXk8cuCgzWANj5/y4LUqGNlPFtxaBUQnVaicolbGc9nYkwL9his7FLtMuXpqKGbW/xfPqtH/Uf+n7/SMxdIMAQMy9lElRnhu0vJumMPFrFvKLqLomwlHQ7GdC6yMjmeZ9TpaN4rU3kS8qP1Vbez21YRyn/FyWnCDxkTy9/I4YG8kz2lQg+qgt4Xm1YfsOkMxhlAnYVjudYSjI0/rj7gCYXVyCwYjNLrvvqFnsOZBzImE/rEFPdJX7GFdA3DviE1uul2lO/oUdfKSoDgM7jkTjzruK4KwHp5cOwwDEPR4CRD3ILCH94+xf7PtijAKzLRMRcCANOMuLp6jPYNmywJ4KnZEjENrhKrKt/YYVsqlKeyRwKXgEM5HvXeZh6NrGmmfmkhyRZhQ1AF7EPdqPCrA2fMYWFF7V4zxY6uwCioaKC5gvBLE+32D6OKE5my0a48hazqiID29cg69vw86g6cW3e7igBPA+R+iAK6IDguesOqxuw/LH/S0abHlEU/IYhMC/fJMUvGdCcDHCid07QKS+QbH+kK+7pzMknFJOkehb9ag==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39850400004)(366004)(7696005)(186003)(8936002)(2906002)(33656002)(5660300002)(6506007)(53546011)(83380400001)(8676002)(52536014)(9686003)(66446008)(76116006)(66946007)(66476007)(66556008)(86362001)(122000001)(64756008)(38100700002)(26005)(55016002)(54906003)(110136005)(316002)(71200400001)(478600001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDE4OW55MmtEVEIyWU1Demx1VVY1c1FjZEE3R2dkZi9lRVQ4NUh5SkhYUG5O?=
 =?utf-8?B?UXVwTWxFd2dkRGVSVnE3SUd3R2M5M2E3VGduMEJJbmtyUTd2SWhxNVBYUXgw?=
 =?utf-8?B?QlR1OXNRdTVaUklsTVJGZDB4Rzh0a1NReWJRTVpzM1R2K1NCb2tXYnRYWjFH?=
 =?utf-8?B?bHozS2E4dnBBbVdoOXZva2ZQS2s4S1pVYjE3eHhmL01saFF0SFNNUERrdmEy?=
 =?utf-8?B?L2RNVTJEQkpTVkZ4NlZESS9nZzE4TkpiVWJmYWxqRkQ0ZjVpd3FaaWJqMkFN?=
 =?utf-8?B?MVJydTFkczUyeWpWWExGclhsMGhqeXhUWVJRdXVOdnU5VVQ5eklqaW04OHVM?=
 =?utf-8?B?OVJHWmhSeDRlbDFxUm5OQ2NWakl3UGRQUUo1MzhzQ1dyODlxZFVFdk5IY3dJ?=
 =?utf-8?B?ZHMwVVYzSjBCL1dDa2Vib21yUWJub0JCYkx5RTdDZDJWQjZrOWpuRVFKVDN1?=
 =?utf-8?B?MGdOeTBNSndPTll6U3ViSHZpOHFjaDZGKyt2WkRFclNzdGRiSDhCWXJINVhF?=
 =?utf-8?B?aXRTZUdDdXdJVzJ5VlJSdFV3bm5BTGNuT2RZejcrcG8yZ2x4TnhIeXB5ZzdB?=
 =?utf-8?B?dW1mVzFneWFtZTFQaGNEaGRUMHRZdkN1S2Y3NHR1blJGdmhUVXE0MThDb3Jh?=
 =?utf-8?B?R09xNDBXVWdqMG85TkxEdncrZ0Z2eTMwUkFFRCtlcnBNQ0dCRXlEWko0U2FE?=
 =?utf-8?B?NTFFQVRxZnFqdHNuT2NzYnErMEsrWE5GZUxOeG8rRTJlT1RjY2JiR2JHVith?=
 =?utf-8?B?T0NOVEgyL1JKbXBub01Id0xNOHNTRXZmWnBvdCszMUdueWxVaVZXME5pQ1VG?=
 =?utf-8?B?eUJJVDQ3S2ZNRi9BcS84MDhBczN6b3VINWpWcVFVMDR3b3NnVWNZME04YWdu?=
 =?utf-8?B?YmpBSmJ0c2RrdmF6dkhDeWVaNVJnbjNUMENETmFSOS95c3QxT2hRUU50bC95?=
 =?utf-8?B?aHN3NDFuMUZLeVdleGJPU2Jsa0I0a2tCUjZnV0RqUE1MK1h0YTU3MTNPekVP?=
 =?utf-8?B?Ym9oTFdsQ1gzNERXdjhXcHh2SXo4bVZjL0VMemZRbUwrY2RkMFpjS2d0WFJB?=
 =?utf-8?B?ZW1GM1ROWDh1NnNpZXBTWXByblNmT3AvaXlIMVhjMkE3WndBSFllazBEaWdu?=
 =?utf-8?B?Ym5PTnQvWU1NYTcrZkJhMHJHakFEb3RpMkdJL2tRVjRrVDNMd0RkR0RUdXcr?=
 =?utf-8?B?WVB5M0t3YkprME02cTl2SWI4SEh5QWluaGZHbUhhRnJSSG5kdkh3SXQ2TS9q?=
 =?utf-8?B?VSs4ZFZYT3RBVWQ4bWhxYjk1MVgzNnR3dHVybWRwUER3UDhTNlphb2NHdXVs?=
 =?utf-8?B?RGE0c3pLbllzcWtSc1Q0REh6bERKOTZVRThScGNvTTZBTHlvT3VkN1MxMkZy?=
 =?utf-8?B?WERhV1ZsaFoyd0FUY0oxSHhOYVhKT0lBcUhnY0swc0E4R0hPQm5ZUnJNd3Y1?=
 =?utf-8?B?UkJmL0dRTTNpdmpOOUtITUEwdnNJSGNyWGh1V1ZMSm5VcmV5N1RUd0VyS0dq?=
 =?utf-8?B?SktxRFB5eUtCVm9PUzhoWW5reVNMcTR4c0xySUtPWk9jY2pRUjhZTFpaL2sv?=
 =?utf-8?B?OHArYWl0RUp0MHZLcG5XdTU2SFgwR0FvelRqVVRiY3lOVkpDb25qcDJhRW84?=
 =?utf-8?B?MjRObFFJcUlSRksyTFRpc2ZGdGhtbng0QzFyYlprQ05QYnBQRjJjeHJtSW9z?=
 =?utf-8?B?ekFNZlFhS0d1OU5oMDlsVFV4b1ZxWDI1bDQ2WDBPQ0o2enJra3p4UUVJdisv?=
 =?utf-8?Q?h/yorh+oilpeFMTBt0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5392
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d8b8a36-8466-4673-6926-08d93f624f60
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cbpMzkf4y4BLHiiFRF/n4HHjR9SjLbYON/oDMn5zJKA0Zcsh6OfJzyFr4COzI4HLL0G5XrGoq7mySOm8o1RAS8Umq0EgYp+J78dg6SPbr1CtrMreuMJsryRdmzEq3mLd29wYAyWhBcI82ohybLyx7zBDkp06SCA8lJzPBFcYjvomBo4oiJhzRdeTzpxf1S1IgbQqgqq5bhmTL5oUVndEUX7NuABKni7dUvFI3FaIwLL9wIYKai6aeKdjT/DQD0A4iZwaAtKxsMyNbfSxd7Bm9/jL+f1H3SEEuSxu3V04P20S0JJZR583zxJtLdYEzt7Y9KlgU7EYnuHI2jG68dPwwqse6qc49+u5aSId9S4fuaB6IYNdkwy3DZDJPLE2mBYcE6II23CehXupe3iV3bua/Uz2XhyFyhu0SDTZIHnyi71cFqpbeTUwL6WNJe2q8geMIIs/5tXVUi/5POiqca1IdO78Y5XZgf1+gGUBC6EOZ6ShrBRROSS3HbDRRn2oav53tK116/Gkl/15Dk5GbwydgQ2I7+a/udPRJSyPdhfOujq8W/GFvGAPB9BLOZ6gnTYv82MoGy8K7ID3oL5KQhYIxygmJlwMHl51MVrXrWXcy0jTrtCQRN3jRWWxMTmYaxgNvDBVva6wJO42/CJNi+zZpdzLfyejOolOKVF9rU0XNlJ4/04/VIRe6eHbx5AJy3kynWE17zG9hdSKLnYRA9glPQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(46966006)(36840700001)(4326008)(36860700001)(82310400003)(70586007)(7696005)(70206006)(8676002)(5660300002)(47076005)(336012)(478600001)(186003)(8936002)(83380400001)(86362001)(33656002)(54906003)(356005)(53546011)(6506007)(110136005)(9686003)(52536014)(2906002)(81166007)(55016002)(82740400003)(316002)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 03:09:41.5698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0915e13d-4faf-49ac-35d6-08d93f62550b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4848

SGkgSnVsaWVuDQoNClNvcnJ5IGZvciBzbyBsb25nIHRvIHJlc3BvbmQsIGp1c3QgYmFjayBmcm9t
IGEgbG9uZyBob2xpZGF5LiDwn5iJDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
RnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEp1
bHkgMSwgMjAyMSAxOjQ0IEFNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNv
bT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsNCj4gc3N0YWJlbGxpbmlAa2VybmVs
Lm9yZzsgamJldWxpY2hAc3VzZS5jb20NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5k
Lk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+IDxXZWkuQ2hlbkBhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIDIvOV0geGVuL2FybTogaW50cm9kdWNlIFBHQ19yZXNlcnZlZA0KPiAN
Cj4gSGkgUGVubnksDQo+IA0KPiBPbiAwNy8wNi8yMDIxIDAzOjQzLCBQZW5ueSBaaGVuZyB3cm90
ZToNCj4gPiBJbiBvcmRlciB0byBkaWZmZXJlbnRpYXRlIHBhZ2VzIG9mIHN0YXRpYyBtZW1vcnks
IGZyb20gdGhvc2UgYWxsb2NhdGVkDQo+ID4gZnJvbSBoZWFwLCB0aGlzIHBhdGNoIGludHJvZHVj
ZXMgYSBuZXcgcGFnZSBmbGFnIFBHQ19yZXNlcnZlZCB0byB0ZWxsLg0KPiANCj4gSSB3b3VsZCBw
cmVmZXIgaWYgdGhpcyBwYXRjaCBpcyBmb2xkZWQgaW4gdGhlIHBhdGNoIGZpcnN0IHVzaW5nIGl0
LiBUaGlzIHdpbGwgYmUNCj4gZWFzaWVyIHRvIHVuZGVyc3RhbmQgaG93IHRoaXMgZmxhZyB3aWxs
IGJlIHVzZWQuDQo+IA0KPiBDaGVlcnMsDQoNClN1cmUsIEknbGwgcmUtb3JnYW5pemUgdGhpcyBj
b21taXQuDQoNCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZW5ueSBaaGVuZyA8cGVubnku
emhlbmdAYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiBjaGFuZ2VzIHYyOg0KPiA+IC0gcmVtb3ZlIHVu
dXNlZCByZXNlcnZlZCBmaWVsZCBpbiBzdHJ1Y3QgcGFnZV9pbmZvDQo+ID4gLSByZW1vdmUgdW51
c2VkIGhlbHBlciBwYWdlX2dldF9yZXNlcnZlZF9vd25lciBhbmQNCj4gPiBwYWdlX3NldF9yZXNl
cnZlZF9vd25lcg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9tbS5oIHwgMyAr
KysNCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL21t
LmgNCj4gaW5kZXgNCj4gPiAwYjdkZTMxMDJlLi43MDM0ZmFlMWI2IDEwMDY0NA0KPiA+IC0tLSBh
L3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0v
bW0uaA0KPiA+IEBAIC0xMDgsNiArMTA4LDkgQEAgc3RydWN0IHBhZ2VfaW5mbw0KPiA+ICAgICAv
KiBQYWdlIGlzIFhlbiBoZWFwPyAqLw0KPiA+ICAgI2RlZmluZSBfUEdDX3hlbl9oZWFwICAgICBQ
R19zaGlmdCgyKQ0KPiA+ICAgI2RlZmluZSBQR0NfeGVuX2hlYXAgICAgICBQR19tYXNrKDEsIDIp
DQo+ID4gKyAgLyogUGFnZSBpcyByZXNlcnZlZCAqLw0KPiA+ICsjZGVmaW5lIF9QR0NfcmVzZXJ2
ZWQgICAgIFBHX3NoaWZ0KDMpDQo+ID4gKyNkZWZpbmUgUEdDX3Jlc2VydmVkICAgICAgUEdfbWFz
aygxLCAzKQ0KPiA+ICAgLyogLi4uICovDQo+ID4gICAvKiBQYWdlIGlzIGJyb2tlbj8gKi8NCj4g
PiAgICNkZWZpbmUgX1BHQ19icm9rZW4gICAgICAgUEdfc2hpZnQoNykNCj4gPg0KPiANCj4gLS0N
Cj4gSnVsaWVuIEdyYWxsDQoNCg0KQ2hlZXJzDQoNCi0tDQpQZW5ueSBaaGVuZw0K

