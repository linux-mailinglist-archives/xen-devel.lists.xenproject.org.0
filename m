Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 702953ECEDD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 08:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167181.305144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFWVO-0004Lu-3e; Mon, 16 Aug 2021 06:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167181.305144; Mon, 16 Aug 2021 06:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFWVO-0004Jk-0L; Mon, 16 Aug 2021 06:53:54 +0000
Received: by outflank-mailman (input) for mailman id 167181;
 Mon, 16 Aug 2021 06:53:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eR/w=NH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mFWVM-0004Je-Pm
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 06:53:52 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6222800-fe5e-11eb-a444-12813bfff9fa;
 Mon, 16 Aug 2021 06:53:50 +0000 (UTC)
Received: from DBBPR09CA0031.eurprd09.prod.outlook.com (2603:10a6:10:d4::19)
 by DB7PR08MB3017.eurprd08.prod.outlook.com (2603:10a6:5:1f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Mon, 16 Aug
 2021 06:53:40 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::4f) by DBBPR09CA0031.outlook.office365.com
 (2603:10a6:10:d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Mon, 16 Aug 2021 06:53:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 06:53:40 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Mon, 16 Aug 2021 06:53:40 +0000
Received: from e5421e735887.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBF9B9A0-121D-4B3C-AEC7-1237AAB4F293.1; 
 Mon, 16 Aug 2021 06:53:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e5421e735887.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Aug 2021 06:53:34 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB4672.eurprd08.prod.outlook.com (2603:10a6:802:a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 06:53:28 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4415.022; Mon, 16 Aug 2021
 06:53:28 +0000
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
X-Inumbo-ID: b6222800-fe5e-11eb-a444-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ3Z+6TOAiht3xRCIb175VCSVQUdnZDbOMKYc+Ef+q8=;
 b=Z7/OhZG7Hd0VsjfJSpnIJninTDwxaelEABXgRDXsjbWqWZWrKVjvRtDWE5maX3FVxiwKMOkULOaQyCY42bI5W0IHdkXLdpfivEZpOgUhfuw2KOUVEcNzDuRBBkWdCupkc/WB+o94f1nb2TxwThnpFao20BFVIzIQ4yJpcvBkS9c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqIdeIupNbK9xJTzbqWd4fO1tZJBamI7eTHpjd444huIrl6rSBJ870Z7z0NVAK5t6NXAkhJN8gqI0fQoRk6D13FRjjpv0DneBLGo6CHZXuj0ETKiZm2W6N05Mr+rQicZzax9piFz/D1mUvkq47VJJFUN+EPL+KIUlGyJZE5txRQfFm4zUXtW9I7A8s69W1Jq4Jj/jfPq64PKktn8sBYnGTFEZcAbLLjHkSZasJQylGEl4p1X6X1z6mCyXOuIXjMD1KHA7G7cTOYwegCraRF+S8IGHol4oOUpJqMNq0wPb5IPAuM7hzp6yDhMlneOMVAHhMg6VbqDlEgHvm5HpNwLbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ3Z+6TOAiht3xRCIb175VCSVQUdnZDbOMKYc+Ef+q8=;
 b=el6dnMHs3ZuQwvoS8X9ppdNP9FqJfSfVTKBdZx94KjRj3X5YJkytTo4iP6pgcbQyAvqT81YfIwzY1bSZFV7JC9Khg8sfQIbVLbTCKeitYertkMmmcu3XUxxhZe1+XsY7lk/3dvAsz6AiJfqAvq5uc4sQwt4gQGTMmm2vYofKbRGHSyuTYyAeUaV/RzDSjAxnse1/2xZnhkdz5O08RM2ELkOcKa7RMeXEsHU6O0vDDSRg9RRMQHUH60V1pBgKI9PDBwBu3a0rKte9i11e3wNhNbMAwdkMQF9VDr00V0U39rBkQCBJuuVbkpXZzqiZAtzHlH/x6JsnswvTAAHl/er7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ3Z+6TOAiht3xRCIb175VCSVQUdnZDbOMKYc+Ef+q8=;
 b=Z7/OhZG7Hd0VsjfJSpnIJninTDwxaelEABXgRDXsjbWqWZWrKVjvRtDWE5maX3FVxiwKMOkULOaQyCY42bI5W0IHdkXLdpfivEZpOgUhfuw2KOUVEcNzDuRBBkWdCupkc/WB+o94f1nb2TxwThnpFao20BFVIzIQ4yJpcvBkS9c=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH V4 09/10] xen/arm: check "xen,static-mem" property during
 domain construction
Thread-Topic: [PATCH V4 09/10] xen/arm: check "xen,static-mem" property during
 domain construction
Thread-Index: AQHXg5tiMODi8hcS0EmLPkxlV9QLy6txgnSAgARLnoA=
Date: Mon, 16 Aug 2021 06:53:27 +0000
Message-ID:
 <VE1PR08MB5215636D42110D632C6EF471F7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-10-penny.zheng@arm.com>
 <bf4f8cb1-b8c1-a8f5-0aa4-1616cf161f2b@xen.org>
In-Reply-To: <bf4f8cb1-b8c1-a8f5-0aa4-1616cf161f2b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 76609259E8DE2145B9FF6495E179B941.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4f5f1c19-96c5-4832-2eca-08d9608294b8
x-ms-traffictypediagnostic: VE1PR08MB4672:|DB7PR08MB3017:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3017898B792B11BE515F881BF7FD9@DB7PR08MB3017.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +3sm2JrPb/w0eydsZj76nf6VThpAhcNcDsru8J1UX36YJbQXlTzjxdjxtOYfRXybRQRRhpCsRUmTs4BOvSMcruadWV3nwbRjI8WIPhQIJgKI2i+3i3sCW2HYCr6Fw+pUnBhNv/e5BYoFiakxGJvYBMRADCOmbVa0khgBy2OURFs1aeWYf4BBJujrQAtSv9eTfCqN4dIOUKSY6VK5eASgeFV60p5alhYa2zg3LG31WXbFbO1IkcndcxrPebkkpKmGtHAZHgKull11bzc/3qsprh/AL0L2Pf3Vnt1gNS8nSM1PPP7+9HrJA3Er2kUEHpMzLq0KMXSOjjNzqwrFg12g+HD4hzOkM1wq/5UgnQQicvuFdom9ITB0XpTNTUfJ81DH+VSskrC0DxBq3TFzdhw+gIDtfDXlDT1bFYmnNdIUtUiejqbgJZkXHUclBJF6wtNFxZDr8EU044Aqa3rFoATGmiK3mQ45Hbhzz/0TZmbaqsGA81bhDerGoN89bHI8hmpNOXITVJzPvkkUScZHTvb5uz0m6XJDgy9H8spmBI4nwpjn9Lg1YtWXmetK29XRvBbOYcJBCc887jpXlOFaLP/jJECcbTaEzQKTxoRW21ztVSLTRBM/G/tJAFyvhAjnwUtnKy7VOsfSincRnzs7+Rb0VApD/EcpVaJHoNa1+u658FrW5YLj9Ehe1OisFpwvjpHd9xLe7RIztbsg83fE3Bq+VQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39840400004)(86362001)(4326008)(8676002)(8936002)(33656002)(2906002)(71200400001)(38100700002)(83380400001)(478600001)(55016002)(186003)(38070700005)(7696005)(5660300002)(53546011)(6506007)(26005)(52536014)(316002)(110136005)(54906003)(66446008)(64756008)(122000001)(76116006)(66476007)(66556008)(66946007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnUwK2Z2NUNNRk1meUpwcmtqR0ZRTXYvQTlJTUZOOUhwVlNKUmVNUjlPWVFC?=
 =?utf-8?B?czJnNk1vaXRnd2I5U0RORmR4M1pIRlk4T09zckdKbVJKMENwVlJQNUpXamZ6?=
 =?utf-8?B?bGJuMUo0bXRWd0QwYWEwK2VlMDhrbCs3Q20xVE5oa2MwRzcvekhSZDZzdm1Z?=
 =?utf-8?B?NWlMcGh3Y2dnaXhmTXU5TTJuUWNjY3Jzc09qKzBjWGJ4S2d0eVNMeExJRzF6?=
 =?utf-8?B?YnFpZFlkZVMzYkxMcnYyczY0ZnlSZUJzN1dkakNPYjlCaW40aDcrVEZGdFhU?=
 =?utf-8?B?Z010ajJKdEJZNHNOem4zQmQvdjVrT0gzNmZra256eE1Fa01RRlBweHluakph?=
 =?utf-8?B?Q1Zpazd3N01YUHlRUmpSb0p5ODF6OVoyWSsrQVhQV2JOUDc5Skk2d1ZTRmlM?=
 =?utf-8?B?NkZSbFRwZVF4N08xMk43QkpCdXNGMW1NOTM2ejdyR1d2ekkvT0pOaUZPWkw0?=
 =?utf-8?B?NkVnQXRoWU4yQmpRZFg2WUNYSXBJRURhNy9hMHd3RHI5WnFQSCtpSXhXbkQ0?=
 =?utf-8?B?dDlkNkcyNDNrRDJJTHpWRnJpZEdDM2lUWVpnMTNnNjZZRjcrWklJTmFxK0pY?=
 =?utf-8?B?VjdxNyt6aWVjTjJMSyt1VzU3UWFDemFrVUtIRzB0aUZSdm92YnNUdzlKQWtw?=
 =?utf-8?B?VEZwM1NiYkhoNEszSXZFNWpkaWYzTUFkc1ZsMXhEektaQXlUQkt5VEVVaHg3?=
 =?utf-8?B?UFJiTEFUaytteENEWEZqTHVyNGduMnJJMDhGeExlZHQ0NFg3R1FqUU41MXpl?=
 =?utf-8?B?RkphYmhuMzNnU2szRXArVUZDVUFONGNFMThuQndCb1FteGRORE95OEpJWC9V?=
 =?utf-8?B?eVdXK0FLVUV0anFxSzAxTkJQU1k5eUtYSUxFRGF0RG45U0dodlBrWHI3c0Zu?=
 =?utf-8?B?N2hCM2hFQkV4UzNKZ3FEN2hSUjFrK2tEdHE0Q21vK3VZRVlpbVRtZDNQZytj?=
 =?utf-8?B?K1hwVjJSQkd1bjlndkpVKzVRQ2tDaWdsQjJ1VmFER3VHNU44YmRvaWJneHow?=
 =?utf-8?B?RHpvdjFNbUZDY2svSExWcGJkMXBOb2lSV3R2S3o3eTE4TjRKd2t3ektxclBm?=
 =?utf-8?B?U0wvU29UbEp5UHpTSS9RVm83djlkSUNBbURPY2dvcVVoeXVLLzJBK014MlAr?=
 =?utf-8?B?WVlNSW1wYVp5TXBoZ1ZQcVN6Y2pCZU1Nd2Q4YWRMWUFVMkc5eVkwclo5ZUR2?=
 =?utf-8?B?QVJUN2tDV0ZOTmJNcDJsRWdjUGZIRno5QTRYQlNxd3lQVjJEQWkwUE9iSmU3?=
 =?utf-8?B?amxWTzFaV1ptNnppRkZkRVZYUVAyVnhlc3dXSkVxWGFFaUkxZi9ieVZtaXpp?=
 =?utf-8?B?cWdoVmx5UC8xZS9LbGFTNFhvTTZIRWQ4QnpaVk1hdDRQUTVsVWwvV1J3MjVD?=
 =?utf-8?B?eXMyRWVNbWxOSkdDRVMxM3F6OUhmK3ZKZDEzM3VsTmxMMEhDVUlZclp3bW5W?=
 =?utf-8?B?c2l4Vk9vNnp4UFh3MWE4MzZtZC9HVDFPRTJmbUtVUWxqcHByTnBLM3FEaENW?=
 =?utf-8?B?cHp6ejdwNW5zSXVWeTdxNFViaE8yQUpSU2ZyTjRlZkYxOGF0QU0rYjFaakIy?=
 =?utf-8?B?U3BrUzUyYUE5NElORnVKRFdqcVYvaDg0LzZHRHd3bXZZMTA3aUtaRTNGcUZR?=
 =?utf-8?B?QjdDVGlMSmZxRnpHbkR6dDd4VXV3MW1yaWRVRlZXb282VEh5MnhZb1FvTHN3?=
 =?utf-8?B?Wk92cVcyWGVOVExZcGQzNVRLb29Hclppc2E0M3JsU21BMmFOTndaeDVtcnhH?=
 =?utf-8?Q?gbpwAP4NEOc0AT7efz7Hbb10kZJonfsts/xbo7i?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4672
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b494757-bcf4-4de9-08bc-08d960828d3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6XCUewJPZXvucTSXtzvpSAewep+DsvKqSX9YjfDHraRPmLLqdA1i6qJydecVpZajh0IVbqwWAUebuzG0RNK4FJS87hDUWvuAU/zU+pD9u9H0/tHP92fBYcDkzBgL2ofCumYpb6ciJ4YWY2vxeWRGcp7yzqx1T++NUbRhiEPcchSgk1z7Eig1EpZOpdE43fOqiIRiPlB34ipqDhqPzkbwSFk/FOKrxeqAHhumV94zOJpJsbS6+Qn+EfFvOu2zs5EeqC8k6LO3VsJBWV/7Ylb9rQoVophtAqepzVK0d/V0X+dxIQconDP2mqPz61XuVS9ZQyDoLF+CGR1cIOeZtaYClveVEbUh7S6jIGsdsEIBDvy0qb/O0N4Z5e3F18Q+28XvUDIzVth7MQ863ajnA7ePV/oobuNlrtgoZ1e7KsAF6M4aDuc3kGk9COI8mVE/VqiCF8q7quWxypjIaEEfB0zsO73Rex9Ad2QvY4n4MuSQHJ6RavAKJv9goVHTbBvAiKzdTP8dw9KRvO4BVL0MwQE55oRzwqfz125DaOkvKABvATbsjX+E0KgXf6SWOWuieNLDTGqYXV/0111vc2aP+aq541t8+fpajAaEcZZUZI4Fcq9Vse/zLNNKaQ10x66K6YyJQ3snbKDsIHmAJbRodX9Dw67SSJ5GzUBV5Hp0ziIgeoabjzAqmR6KEPjjop4tH/LNrneka5DXswHGqKc1uBf47Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(70586007)(82310400003)(186003)(4326008)(9686003)(36860700001)(47076005)(70206006)(55016002)(8676002)(26005)(8936002)(508600001)(6506007)(53546011)(86362001)(110136005)(33656002)(5660300002)(336012)(52536014)(81166007)(83380400001)(316002)(356005)(54906003)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 06:53:40.6669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5f1c19-96c5-4832-2eca-08d9608294b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3017

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMTMsIDIwMjEg
OToxMiBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmcNCj4gQ2M6
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+
IDxXZWkuQ2hlbkBhcm0uY29tPjsgbmQgPG5kQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggVjQgMDkvMTBdIHhlbi9hcm06IGNoZWNrICJ4ZW4sc3RhdGljLW1lbSIgcHJvcGVydHkNCj4g
ZHVyaW5nIGRvbWFpbiBjb25zdHJ1Y3Rpb24NCj4gDQo+IEhpLA0KPiANCj4gT24gMjgvMDcvMjAy
MSAxMToyNywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gVGhpcyBjb21taXQgY2hlY2tzICJ4ZW4s
c3RhdGljLW1lbSIgZGV2aWNlIHRyZWUgcHJvcGVydHkgaW4gL2RvbVV4DQo+ID4gbm9kZSwgdG8g
ZGV0ZXJtaW5lIHdoZXRoZXIgZG9tYWluIGlzIG9uIFN0YXRpYyBBbGxvY2F0aW9uLCB3aGVuDQo+
ID4gY29uc3RydWN0aW5nIGRvbWFpbiBkdXJpbmcgYm9vdC11cC4NCj4gPg0KPiA+IFJpZ2h0IG5v
dywgdGhlIGltcGxlbWVudGF0aW9uIG9mIGFsbG9jYXRlX3N0YXRpY19tZW1vcnkgaXMgbWlzc2lu
ZywNCj4gPiBhbmQgd2lsbCBiZSBpbnRyb2R1Y2VkIGxhdGVyLiBJdCBqdXN0IEJVRygpIG91dCBh
dCB0aGUgbW9tZW50Lg0KPiANCj4gSSB0aGluayB0aGUgY29kZSBpcyBzbWFsbCBlbm91Z2ggdG8g
Zm9sZCBpdCBpbiBwYXRjaCAjMTAuIEluIGZhY3QuLi4NCj4gDQoNCk9rLiBJJ2xsIGNvbWJpbmUu
DQoNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0u
Y29tPg0KPiA+IC0tLQ0KPiA+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMzcNCj4g
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDM2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMNCj4gPiBpbmRleCA2Yzg2ZDUyNzgxLi5jZGIxNmYyMDg2IDEwMDY0NA0KPiA+IC0tLSBhL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYw0KPiA+IEBAIC0yNDI1LDYgKzI0MjUsMzcgQEAgc3RhdGljIGludCBfX2luaXQgY29u
c3RydWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAgICAgICBzdHJ1Y3Qga2VybmVsX2lu
Zm8ga2luZm8gPSB7fTsNCj4gPiAgICAgICBpbnQgcmM7DQo+ID4gICAgICAgdTY0IG1lbTsNCj4g
PiArICAgIGNvbnN0IHN0cnVjdCBkdF9wcm9wZXJ0eSAqc3RhdGljX21lbV9wcm9wOw0KPiA+ICsg
ICAgdTMyIHN0YXRpY19tZW1fYWRkcl9jZWxscywgc3RhdGljX21lbV9zaXplX2NlbGxzOw0KPiA+
ICsgICAgYm9vbCBzdGF0aWNfbWVtID0gZmFsc2U7DQo+IA0KPiBZb3UgZG9uJ3QgbmVlZCB0aG9z
ZSBpbmZvcm1hdGlvbiBvdXRzaWRlIG9mIGFsbG9jYXRlX3N0YXRpY19tZW1vcnkoKS4gU28gSQ0K
PiB0aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIG1vdmUgdGhlIGNvZGUgaW4gdGhhdCBmdW5jdGlv
bi4NCj4gDQoNClN1cmUuDQoNCj4gPiArDQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogR3Vlc3Qg
UkFNIGNvdWxkIGJlIHN0YXRpYyBtZW1vcnkgd2hpY2ggd2lsbCBiZSBzcGVjaWZpZWQgdGhyb3Vn
aA0KPiA+ICsgICAgICogInhlbixzdGF0aWMtbWVtIiBwcm9wZXJ0eS4NCj4gPiArICAgICAqLw0K
PiA+ICsgICAgc3RhdGljX21lbV9wcm9wID0gZHRfZmluZF9wcm9wZXJ0eShub2RlLCAieGVuLHN0
YXRpYy1tZW0iLCBOVUxMKTsNCj4gPiArICAgIGlmICggc3RhdGljX21lbV9wcm9wICkNCj4gPiAr
ICAgIHsNCj4gPiArICAgICAgICBzdGF0aWNfbWVtID0gdHJ1ZTsNCj4gPiArDQo+ID4gKyAgICAg
ICAgaWYgKCAhZHRfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgIiN4ZW4sc3RhdGljLW1lbS1hZGRy
ZXNzLWNlbGxzIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3Rh
dGljX21lbV9hZGRyX2NlbGxzKSApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBw
cmludGsoIkVycm9yIGJ1aWxkaW5nIERvbVU6IGNhbm5vdCByZWFkICINCj4gPiArICAgICAgICAg
ICAgICAgICAgICJcIiN4ZW4sc3RhdGljLW1lbS1hZGRyZXNzLWNlbGxzXCIgcHJvcGVydHlcbiIp
Ow0KPiBXZSBkb24ndCBzcGxpdCBjb21tZW50IG92ZXIgbXVsdGktbGluZSAoZXZlbiB0aGV5IGFy
ZSBtb3JlIHRoYW4gODANCj4gY2hhcmFjdGVycykuIFRoaXMgaXMgdG8gaGVscCBncmVwIG1lc3Nh
Z2UgaW4gdGhlIGNvZGUuDQo+IA0KPiBBbHRob3VnaCBmb3IgdGhpcyBvbmUgSSB3b3VsZCByZXBs
YWNlZCAiRXJyb3IgYnVpbGRpbmcgRG9tdToiIHdpdGggc2ltcGx5DQo+IHdpdGggdGhlIGRvbWFp
biBJRCAoeW91IGNhbiB1c2UgJXBkIGFuZCAnZCcpLiBUaGUgY2FsbGVyIHdpbGwgdGhlbiBwcmlu
dCB0aGVyZQ0KPiB3YXMgYW4gZXJyb3IgZHVyaW5nIGJ1aWxkaW5nLg0KPiANCg0KVGhhbmtzIGZv
ciB0aGUgZXhwbGFuYXRpb24sIGxlYXJuZWQuDQoNCj4gDQo+ID4gKyAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOw0KPiA+ICsgICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKCAhZHRf
cHJvcGVydHlfcmVhZF91MzIobm9kZSwgIiN4ZW4sc3RhdGljLW1lbS1zaXplLWNlbGxzIiwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmc3RhdGljX21lbV9zaXplX2Nl
bGxzKSApDQo+ID4gKyAgICAgICAgew0KPiA+ICsgICAgICAgICAgICBwcmludGsoIkVycm9yIGJ1
aWxkaW5nIERvbVU6IGNhbm5vdCByZWFkICINCj4gPiArICAgICAgICAgICAgICAgICAgICJcIiN4
ZW4sc3RhdGljLW1lbS1zaXplLWNlbGxzXCIgcHJvcGVydHlcbiIpOw0KPiANCj4gTXkgcmVtYXJr
IGFwcGxpZXMgaGVyZSBhcyB3ZWxsLg0KPiANCj4gPiArICAgICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7DQo+ID4gKyAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICBCVUdfT04oc3RhdGljX21l
bV9zaXplX2NlbGxzID4gMiB8fCBzdGF0aWNfbWVtX2FkZHJfY2VsbHMgPg0KPiA+ICsgMik7DQo+
IA0KPiBEaWQgd2UgdmFsaWRhdGUgdGhlIERUIGJlZm9yZSBoYW5kPyBJZiBub3QsIHRoZW4gSSB0
aGluaw0KPiANCg0KWWVhaC4uLiBJIHRoaW5rIEkgZGlkIHRoZSBjaGVjayBpbiBmaXJzdCBwYXJz
ZS4gSXQncyByZWR1bmRhbnQuDQoNCj4gPiArICAgIH0NCj4gDQo+IA0KPiA+DQo+ID4gICAgICAg
cmMgPSBkdF9wcm9wZXJ0eV9yZWFkX3U2NChub2RlLCAibWVtb3J5IiwgJm1lbSk7DQo+ID4gICAg
ICAgaWYgKCAhcmMgKQ0KPiA+IEBAIC0yNDUyLDcgKzI0ODMsMTEgQEAgc3RhdGljIGludCBfX2lu
aXQgY29uc3RydWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwNCj4gPiAgICAgICAvKiB0eXBlIG11
c3QgYmUgc2V0IGJlZm9yZSBhbGxvY2F0ZSBtZW1vcnkgKi8NCj4gPiAgICAgICBkLT5hcmNoLnR5
cGUgPSBraW5mby50eXBlOw0KPiA+ICAgI2VuZGlmDQo+ID4gLSAgICBhbGxvY2F0ZV9tZW1vcnko
ZCwgJmtpbmZvKTsNCj4gPiArICAgIGlmICggIXN0YXRpY19tZW0gKQ0KPiANCj4gV2l0aCBteSBz
dWdnZXN0aW9uIGFib3ZlLCB0aGUgY2hlY2sgY2FuIGJlIHJlcGxhY2VkIHdpdGg6DQo+IA0KPiBp
ZiAoICFkdF9maW5kX3Byb3BlcnR5KG5vZGUsICJ4ZW4sc3RhdGljLW1lbSIsIE5VTEwpICkNCj4g
DQoNClN1cmUsIFRoYXTigJlzIG1vcmUgc2ltcGxlLg0KDQo+ID4gKyAgICAgICAgYWxsb2NhdGVf
bWVtb3J5KGQsICZraW5mbyk7DQo+ID4gKyAgICBlbHNlDQo+ID4gKyAgICAgICAgLyogVE9ETzog
YWxsb2NhdGVfc3RhdGljX21lbW9yeSguLi4pLiAqLw0KPiA+ICsgICAgICAgIEJVRygpOw0KPiA+
DQo+ID4gICAgICAgcmMgPSBwcmVwYXJlX2R0Yl9kb21VKGQsICZraW5mbyk7DQo+ID4gICAgICAg
aWYgKCByYyA8IDAgKQ0KPiA+DQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KDQpDaGVlcnMNCg0K
LS0NClBlbm55DQo+IEp1bGllbiBHcmFsbA0K

