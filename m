Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A35DA3BC752
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 09:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150835.278850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fch-0008Eg-9z; Tue, 06 Jul 2021 07:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150835.278850; Tue, 06 Jul 2021 07:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0fch-0008BU-5i; Tue, 06 Jul 2021 07:36:03 +0000
Received: by outflank-mailman (input) for mailman id 150835;
 Tue, 06 Jul 2021 07:36:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dpqu=L6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m0fce-0008BD-UM
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 07:36:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8295f26-e8a2-4210-80c8-3517b08e2b53;
 Tue, 06 Jul 2021 07:35:58 +0000 (UTC)
Received: from DB6P18901CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::32)
 by DB6PR0801MB1814.eurprd08.prod.outlook.com (2603:10a6:4:37::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 6 Jul
 2021 07:35:56 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::88) by DB6P18901CA0022.outlook.office365.com
 (2603:10a6:4:16::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 07:35:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 07:35:56 +0000
Received: ("Tessian outbound 5d90d3e3ebc7:v97");
 Tue, 06 Jul 2021 07:35:56 +0000
Received: from 9ace0824680b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A7B56D33-7E73-45C7-ADC9-2C1BE9783B65.1; 
 Tue, 06 Jul 2021 07:35:46 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9ace0824680b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 07:35:46 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB5806.eurprd08.prod.outlook.com (2603:10a6:800:1b1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 07:35:44 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 07:35:44 +0000
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
X-Inumbo-ID: b8295f26-e8a2-4210-80c8-3517b08e2b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MeDDTV6qBBaPLsA5ugMyPtUcvA9uoDSFo0OqGJKU24=;
 b=TPWVURH3XpWEg0l3Wq0/tqdY1QH3Dz2BZDOROpN6GmRzj63eGdSisCl3XTv+8ycWG8w9wNOlmLuZ39f1m35Ycmdo5JoBiJ53tyhHZH0RfAHd3Nz6QAhsMk8fcdXwUyzvPEePEj6lP6dy230ImFKaQRmsYJ2Ogi0xgMyW5MYXxYM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGRm82UyA6ZWWqzyl4hihmSaKQk3S/KG2Ar5HFGaCXs7rJzXpitglUB47MNL1bwvoA0r7pxZnkVELrxUzSZjnqCoc0dQqjkl9x5zQrcMU6SAkwhMJzzxlOVP3qod/Oq90m19ti0WioT64rvMrqyPRH/uR8/ovnyu+Gea0YrHEvlpnqGCxDwBBv40v4+9J+CpUpOI2NPHSLwkxnMliTKZj3HZPYLsnBi/kHmuAgZQkuVV62qPQI1h7l9ZC24rziCifJPCPsH6+oE/yplwwD7VTW9jItQUdybme7evcupc/4HE+eiQmLOkYymM1jIhzxpDkMSud+zs4qL+Dd1GngWbgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MeDDTV6qBBaPLsA5ugMyPtUcvA9uoDSFo0OqGJKU24=;
 b=UqQ8fNFsCyalXHtlWgf5ZLQSk2C2IjwGc5zrL2K/JeE+3d6jNCg4R5AaGSJwCl32SiGjkSF0Nmz9LYcD+KGCcVYn7yMj5eIXfnwVydaEACFR8b4gPcJXmxigJ/OtSaI2YozOECK6nuyRNLGAwaXEfNujQI3FFY3ogQlAjQ0U5aESrhgEFcmJzLS0vcafunOF7IfsoQGycTge1zkFtTyENQuVagcY2qurEyaEHjslHIesxAh3YKVhywEuV3vE7ZpRCjqu5D61Hgp2LFn2+TTTnqj4U9t4AMtViJuhmVqhc09I+wKB0w3ll9AZ197u1Ou4sP9nzjgYhEPkSZp1/lgTWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9MeDDTV6qBBaPLsA5ugMyPtUcvA9uoDSFo0OqGJKU24=;
 b=TPWVURH3XpWEg0l3Wq0/tqdY1QH3Dz2BZDOROpN6GmRzj63eGdSisCl3XTv+8ycWG8w9wNOlmLuZ39f1m35Ycmdo5JoBiJ53tyhHZH0RfAHd3Nz6QAhsMk8fcdXwUyzvPEePEj6lP6dy230ImFKaQRmsYJ2Ogi0xgMyW5MYXxYM=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>
Subject: RE: [PATCH 8/9] xen/arm: check `xen,static-mem` property during
 domain construction
Thread-Topic: [PATCH 8/9] xen/arm: check `xen,static-mem` property during
 domain construction
Thread-Index: AQHXW0cAUmDBqGSIy0OSAkpietHoXKsxZ2CAgAQ9d/CAAA0IgIAACf8w
Date: Tue, 6 Jul 2021 07:35:44 +0000
Message-ID:
 <VE1PR08MB52154870D6D6EA339EFFA869F71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-9-penny.zheng@arm.com>
 <f613372a-eac8-f79b-2941-b7cce3e1e0e7@xen.org>
 <VE1PR08MB52155D35A7B716DC7337311DF71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <20e825e2-0266-3120-2d32-3fde50fe46a6@suse.com>
In-Reply-To: <20e825e2-0266-3120-2d32-3fde50fe46a6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0169DCEF70709447B1097E76AB668101.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 46d67b44-7b0a-4796-5ea3-08d94050b172
x-ms-traffictypediagnostic: VE1PR08MB5806:|DB6PR0801MB1814:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1814D05495485C7ABCA9BB5EF71B9@DB6PR0801MB1814.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ruIQT1B07oJbyPE3d8ZNZtH63J8bBIndtxq2L0QnKUTkRBlqsZD5wJZUX++A5Weetxlnle0gAFvG9GPI3mcPawOIwhXyiZKQ9dHtSwdhp3T7AZ7MWupEHIC0IJWJyR24Ks9j7KbhhnfrUraMbMYTA8gkNJi2U1oevb4bkphnLOMN427dQrA5qtGvHgHbniWDFd5lSHzaEhtU1uNwh+MzWp+AZ3zN5b+7e5a4BvmVyQMxjxS26Cr2WwQ4ahU4fhhf9hgGzKyIT59OhTfUuXQSqnNkOxmv79uSuV2fyvU5HKfiAhm+h+cWZibgcakP2d9foVQP/kE5nH+LsHLoUY1glj7Y07hj6jMYALpDWEcr4QOb4EfG/9ZoZbH30J3rmsUpmrBkRdxTor6PW9/Q1PvjUXVyME/dW1y6L/gIDS3D4Uw/cNHKJd6tDj9jguo8Vy8pEm3uOkhjQLji6FIUMpvXLDmjZjIcfKVYE05KRq+Fd4odrOa2F2ymFYxsyCSeImuF0RMpoY8vmMDr/DEAmTju0iB6HdDBBbvV00/naiQfOI6UY31+S49xi4E5zwVXk7P9Y9Fc/nUVtecbQS+56Zdv1rX/auzS4q41u383EDDAnT5xDKtk9xj2aZJfwqrs3UKroiuO++vA7kvZxz6I8WhEdoluidsvCVrC9MuJwJ5QRqgiD8J75awup5e0W1yM4e2tEXzrpmkTmdJeToQGyADb4g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(6506007)(53546011)(4744005)(186003)(26005)(2906002)(316002)(55016002)(71200400001)(54906003)(9686003)(83380400001)(76116006)(4326008)(7696005)(52536014)(6916009)(86362001)(478600001)(38100700002)(5660300002)(122000001)(66556008)(66476007)(66446008)(64756008)(8936002)(66946007)(33656002)(8676002)(81973001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SmxvK0RjT2s0MVEzdDAvWUNENEhYRG9oYXVwRllaSWVRVXl4cXArSXA4SWNZ?=
 =?utf-8?B?cmFseUNpa0gvM013YmpNMkw0elFvMWlweFpCeWJaSXEzSDBGRVQ1ZmxEcEpU?=
 =?utf-8?B?NlBWN1IvbXlVQjhwY1R2NEtWSElEYWNNbmJvT2IyWUZjZWpBMjNHcHcyWXhn?=
 =?utf-8?B?SEI1ZkpTdHRrZ3EwZ3Qwb1B5RWlhd0djbkFuN2NWT3Bwc3h1ZU1CNXJvcUhm?=
 =?utf-8?B?L0VEWXpEeDU0MHR3MnlmbUs0OXlnQzRrSEx2WnFUN1ptMUJHUlNxTnpKcUhH?=
 =?utf-8?B?SUY0ekJST1hjbzNiUEVSaWs3TzNFVGxwV2J1ZlJUZWpsTmlyd1B5dFoyZExV?=
 =?utf-8?B?VzZKdWNXb1Zsdy9KWEo3VkFwcXdERGt4Rm9Jc0pwd3BZSE9mU2VYVDJLYTlU?=
 =?utf-8?B?QW9oRlJJVXlqd2wvcm9hTTFDNlFaQlYvQkdGUklhNkpSY0ZvNGl2cWgxc0ph?=
 =?utf-8?B?SklzRmkrNXhiZWZJZTdnQ3I5V0pLS2RDU0p3SVN3SUJQOG0wTTkwQnpiQ2w0?=
 =?utf-8?B?b1NaNVFWYkhNNnZXWDBGemVwYnVnd3ZnSU1zM2ErY1ludEQ5T3VoSkU1dmtQ?=
 =?utf-8?B?dzNkblp0MDdoN3hlMDRxMzJqWlo2WHUwek9YRVZURk8zRnM4VXQ5Rno3MTBH?=
 =?utf-8?B?UDBKSURQTUZ0V3NnQVpwYWZ1eVJ3OU5halZyNWZMODhBaElQdU4wM1lmUlZw?=
 =?utf-8?B?T1laREVmblowc2dDVHloQXpqWHBBUEp3OUFxOW96eE5kMWZrSCs4cm5KRDhp?=
 =?utf-8?B?eitlZlc3eXBRVm04TkN6NzV4UXVKakhMR3krZmlWeW4yUE5xc24wMEl4aTIv?=
 =?utf-8?B?UUNGL01uTC83bWZTT01rVnJ4emJBYVNPbFR1ZXFwZ0NoY1pDL2dJZU1ZY0JV?=
 =?utf-8?B?TGhKMVRod0xjd1ZRZFl1RVd3NkxyMEpNSmRzTERQK1ZZcEVpU1ViaC9aR1Aw?=
 =?utf-8?B?LzhCRjVablZTdlA5M2JlZzlyNUNaQ1FmZ1JQZVUvaDZOSVBTVnZ5WkRjUWxq?=
 =?utf-8?B?cEtaL3VadHVZVWNUek90TUwyZ0xFby80dlBLWHg1dUtJUEQvSWNpSjdZdVp6?=
 =?utf-8?B?ZEcxMzk2VG5RLzZ0ZHFlbGJFV2hIRk5mR0xDVnppZHRxWDh2N1BkUE9sYkdV?=
 =?utf-8?B?YU9Db0tHMHhvWjV3eU1MZmZaT3hUSlpXNlMyVWw3dWpuMnNHZnA0dEpQamx6?=
 =?utf-8?B?aGNOelNIMGtEc1k3U1NEVW82QlE3WHIrc2w4SU91bGdId0lwVEl6a0t0QlZK?=
 =?utf-8?B?ZTNxeWhUYXJkcGt6SXFDZkY0SUR3WXkwMW5RWHZWM0QyWkpwajdINjUyeWtt?=
 =?utf-8?B?WDRNNGR5TU1hQlNFVG9oMTVodDRsd0JZOW0zd3FZZlBZREFNK1JSY1hwRFd4?=
 =?utf-8?B?NEg1aVVJd2ZZQmplTE5FK21xR1NTdlBEb2h1aThiUDNtWkRUSVhpaklaU213?=
 =?utf-8?B?WUlnazVaTnM1MWttNnRUWEkyZUdCWWlDcGhSMFhaZHY0RExYQnBHT3JIa3RK?=
 =?utf-8?B?VUYrNXpyaDUzOW92YWs3MzFzUnZMNVJEaElTTjF1ZmV6OElwMnJKeGRxdXY2?=
 =?utf-8?B?ekk1L0NXcWd4bE9mM1dwSUwzSTk4MHZwMlJRaHc5andWNUtwVEVqUG53TkRi?=
 =?utf-8?B?Z0drOGo5SXN6SkhybnpKT3ExSjVZSnFEK3kyL2FNNGo1U0Y0bDc0NFB1cWgy?=
 =?utf-8?B?b3VWbDF1SEVob2M3L2NRT3pPdTk2MG5iOUNyUVVVRTJCZytHbStRS3BSR0o3?=
 =?utf-8?Q?7hdnM8DIHEU0x0lZh73PGAq+s7Tgw94IrWjARO/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5806
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b0aecfa2-7f2b-4bd2-146a-08d94050aa00
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/rTsr+3O2KPLWN5nMjLlfJMs/MzWQzsAl7Z3C1JyZNcvvHQ3wxcNLMZpQ5/b2NyfSa0CYDwZZpkdn1/7lL6fO0tevb15yP2x6XOQaYO3C9MHVAxq2lB9Tyak+tPXjGm4FuwpLBJ0xZLZQZ1NIPTERn5/46LDFz34v3cMfxmfczq8V80uKmt2IKiWF33p8EbPt0ajSAjX5oOC71wO6trCIzPKGgbAtl7rriEKFgi5yN+WkWhMk3lbLSgDZhPCWaCnbhs0mekwiVZjUQ+gHdg5H7UUKgGG7PVb5dg/V8FYcgsKgPO15D9TtpF5D5kWsriGE4LoLuWaZ35e/2UfkZoN1VfzaPChgcMqmRpyiE+2R0WXZN5pdw4oIl0Gwo8brNnC/StXb1jB9p9DZCL8ZyfDUoQYJtUSIr5zQOJlxrX8Nwe70bYfmYGivTul0dGNWVaUIwoYKR3E2x14mzdS2/YMR1yyPmuKP7qdGNoKIZeS32apS7N/BR0h55BNOiCGDxCC15bXLsmMtb5MRvTdlVfD5d6/q6gshv42D/mtiVks3K019O0am9G0a4A0XkIifu2+vw4cVN8/dkt3N6X4LXZSSWnabMJfsMr9waDLq9UOCN+UePofEkEc6vBSRTq3EO0N/7LtDwAY/Clbx+nSq51sX35CnuJu514eM9eLMI6RD5Z/ENm8+4gAv481JgamH7KzNFfhsE+RGYs83f22jkOsyKeBOa4xxRMCLvS9nnfB5nk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39860400002)(376002)(46966006)(36840700001)(83380400001)(4326008)(52536014)(9686003)(82310400003)(336012)(186003)(6506007)(478600001)(53546011)(33656002)(6862004)(5660300002)(2906002)(86362001)(316002)(70586007)(8936002)(36860700001)(26005)(54906003)(82740400003)(47076005)(4744005)(70206006)(8676002)(55016002)(7696005)(356005)(81166007)(81973001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 07:35:56.8144
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d67b44-7b0a-4796-5ea3-08d94050b172
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1814

SGkgamFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDYsIDIwMjEgMjo1
OCBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFy
cXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+OyBzc3RhYmVsbGlu
aUBrZXJuZWwub3JnOyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggOC85XSB4ZW4vYXJtOiBjaGVjayBgeGVuLHN0YXRpYy1tZW1gIHByb3Bl
cnR5IGR1cmluZw0KPiBkb21haW4gY29uc3RydWN0aW9uDQo+IA0KPiBPbiAwNi4wNy4yMDIxIDA4
OjMxLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiBIaQ0KPiANCj4gSSdtIHNvcnJ5LCBidXQgc2lu
Y2UgdGhpcyBoYXMgYmVlbiBvbmdvaW5nOiBDYW4gdGhlIHR3byBvZiB5b3UgcGxlYXNlIHByb3Bl
cmx5DQo+IHNlcGFyYXRlIGJldHdlZW4gVG86IGFuZCBDYzouIEZvciBxdWl0ZSBzb21lIHBhcnRz
IG9mIHRoaXMgb3ZlcmFsbCB0aHJlYWQgSSd2ZQ0KPiBiZWVuIG9uIHRoZSBUbzogbGlzdCBmb3Ig
bm8gcmVhc29uIGF0IGFsbCwgYWZhaWN0Lg0KPiANCg0KU28gc29ycnksIEknbGwgY2hlY2sgdGhl
IFRvOiBhbmQgQ2M6IG1vcmUgY2FyZWZ1bGx5Lg0KDQo+IFRoYW5rcywgSmFuDQoNClRoYW5rcyxw
ZW5ueQ0KDQo=

