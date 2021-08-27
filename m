Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29763F9705
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 11:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173532.316625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJYCV-0006bM-UB; Fri, 27 Aug 2021 09:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173532.316625; Fri, 27 Aug 2021 09:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJYCV-0006Yr-P1; Fri, 27 Aug 2021 09:31:03 +0000
Received: by outflank-mailman (input) for mailman id 173532;
 Fri, 27 Aug 2021 09:31:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zv0+=NS=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJYCU-0006W4-2c
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 09:31:02 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.52]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 20d1a9d9-f645-4b06-8cdb-4b02e9835f45;
 Fri, 27 Aug 2021 09:30:59 +0000 (UTC)
Received: from AM3PR04CA0131.eurprd04.prod.outlook.com (2603:10a6:207::15) by
 AM9PR08MB6755.eurprd08.prod.outlook.com (2603:10a6:20b:2fe::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Fri, 27 Aug 2021 09:30:57 +0000
Received: from VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:0:cafe::82) by AM3PR04CA0131.outlook.office365.com
 (2603:10a6:207::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Fri, 27 Aug 2021 09:30:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT019.mail.protection.outlook.com (10.152.18.153) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Fri, 27 Aug 2021 09:30:56 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Fri, 27 Aug 2021 09:30:56 +0000
Received: from d48c125907ed.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E18F8C7-18B1-4FC7-AEAC-905F30281783.1; 
 Fri, 27 Aug 2021 09:30:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d48c125907ed.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 27 Aug 2021 09:30:45 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB4170.eurprd08.prod.outlook.com (2603:10a6:10:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Fri, 27 Aug
 2021 09:30:43 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Fri, 27 Aug 2021
 09:30:43 +0000
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
X-Inumbo-ID: 20d1a9d9-f645-4b06-8cdb-4b02e9835f45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKwOE9CIQ7wvTXB+KKQpeE0sWLpA78WeQ1lCNFeWIyg=;
 b=dBbGpN34NGFymoZZ1lClxJuDm/5MaHWpHOv+wMJpjm0pEAbq5/ZPsTtrAqjkjPcNfty7J83YW+kJJELWZQmesTfNdQNYaVKlABIoRC6dTELQZaggZbIX/hrY9Q4JXfSUFE3b+gdcfI7sELiswpu7/VL1FnUn/g5ApmTmytMdxAU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aP7IuvzXXYedF8TD0MBxFEAfP5fqbopr9/qbQEVxXF0rhGBredMACYFW6XGbGO2Ca/RMTGj8Wfpn3gR1XM6xbZusypQ37k+wwJo3kHFD1rPL2K84I+vqQWTprocPcgcoUKXVqMJw+F1By2oPsh8KgKGwoHwCIatSO6FWxHJEdLFLRl45gFjFJ+fIhi0t3v9mcsyxgXTaeFXsj7ocyt3+MRKWMVe68xjvsn1tfCt3/bOcG6NePLvZjVBP0ZAC/ZE8eJfWpqWgQKcIEfTTiNAbSN8riCYvZ0T3whQ3QDNi9/mDi4Ie1KRi0a6Av6hvIxRrHYz1A3W8r+lM246ANSbbow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKwOE9CIQ7wvTXB+KKQpeE0sWLpA78WeQ1lCNFeWIyg=;
 b=e+4qj6dpgVp1ufCBY+NuOscd2jvLozMAbcImku2xZ6h5CHMjHi1QBFDRPJ/KvNG6cBN0zdKHHVPBp6hH671THr7upIrbCUsaS5pYojev8O91/mlciAz2VrisRH8CyicNzEN8m7eWPcj7IVRKqwCXotqLlux1j/TnmYBYc7L7yoQ4nzi6T/pdUy8vXNP5c29k6vKgw0zud0SN/t5xdALmxZrHiZI9K/67uNO87f4ekIKdKVIiU9wfCz1TtrCcyggULNrzN+BTH9I14zvJCSPIKE0cKrrnEOw2lOMDX+ipLvzTjUQwO8mMBDO90vE0NhtCahC9ALCkRxgiZljkigNbKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKwOE9CIQ7wvTXB+KKQpeE0sWLpA78WeQ1lCNFeWIyg=;
 b=dBbGpN34NGFymoZZ1lClxJuDm/5MaHWpHOv+wMJpjm0pEAbq5/ZPsTtrAqjkjPcNfty7J83YW+kJJELWZQmesTfNdQNYaVKlABIoRC6dTELQZaggZbIX/hrY9Q4JXfSUFE3b+gdcfI7sELiswpu7/VL1FnUn/g5ApmTmytMdxAU=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 20/40] xen/arm: implement node distance helpers
 for Arm64
Thread-Topic: [XEN RFC PATCH 20/40] xen/arm: implement node distance helpers
 for Arm64
Thread-Index: AQHXjptKzHjWbZa4RUeHJ1WuHVYtaKuGjaEAgACfwcA=
Date: Fri, 27 Aug 2021 09:30:43 +0000
Message-ID:
 <DB9PR08MB685775EC7B0EC878F3A99B1A9EC89@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-21-wei.chen@arm.com>
 <alpine.DEB.2.21.2108261640590.24433@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2108261640590.24433@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 79B604744C1C8F44A3186A878CD8E436.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9048732a-8f08-4ed8-c5a8-08d9693d5faa
x-ms-traffictypediagnostic: DB8PR08MB4170:|AM9PR08MB6755:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB67552D194A3165983BAFAAF09EC89@AM9PR08MB6755.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AogTUliAmjQb/QcW/nzQIlia0rUL64GnvEvyKOqO1qVEUMw4Qn+TLNt3a9al76FS32gbmG7m3iMmRW2ZbzyDK+AG0xFs6nQQ9g/ym8u+/9MpjfQnHnWBOXAD2Rq8jI+SAhpsYEfpmnsh87bj2jv2qD9RHxGBcR8XT9a4eD+vzX8bxGmMVVg9/+hd4mTHv45Pm92sfOQHNCf7Zr4+kudCNLBGBR7jtTfq0CDuk19ToUSIbKzREWfxFQISazB+50MX6LT6MzvHpiJnAkd4bXNdBJQKAN1cFlwNqXU52KnzF59VsNoePTcL8AKoNBb7yf2X+stezA9ivG+2hY8Rdi9+zupr5u1I2HU/qoFUCCe78uYNXbmnwNa81O0Po9CNKlOaW8IP6srpJ9fAl1HboEJ0HwRFYouTJjcWnFHo3NHlxRoMpu0wTdO7DMxewSJTlSG1XVAe80DakOxS1Fx9zgfsXKg5TypzDzCXsq7EYM7tPIRB/IIY6FmtOV++0gRj37Yu9gAI3OO8+Xyq8GHtHD9fIFLZgKsKw9kBSE9jWeBDiLEDO73uX7npT1AqaEThJEVmj9bLl2shgZOt9TmOCh0WD3zU054WDtYkiFmFLP306LuHozMie1dnikIefXLFIbDmeKnFxq1ECSz59W6rqf+RVbcCZTwlUcgz+732SSDvOGSjdYr9HQlNPLFcghGEgQDyCXk3EaP0vpYcv7h50w9nXQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(53546011)(86362001)(508600001)(8676002)(5660300002)(4326008)(6916009)(26005)(316002)(76116006)(66556008)(66446008)(64756008)(54906003)(7696005)(66946007)(8936002)(66476007)(122000001)(71200400001)(55016002)(38070700005)(33656002)(38100700002)(2906002)(186003)(9686003)(52536014)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?RkZYa3FxM1YyZE9xazhMRTlLOXN1eDhVVUhQeXhtdVJTeHZ6Sk1uRE1qZmFS?=
 =?gb2312?B?WmJlakl4UjRsUVJTQVozR01nRmdUSWhUZmZ4NEtRS3FUMURWTGlqeG9qK1pz?=
 =?gb2312?B?QURsUDA3S0xuRUtyYmFBbk9RcEZCTzIzTkJpRkkrZC81TXh4QWdQUU1UZG1S?=
 =?gb2312?B?amcvS3BXNjh3UHNnZk5TY0VpWGRNV25GQktUZzVBd1Bobi84eW5oZ0RtL0Jz?=
 =?gb2312?B?aTNDWkFiSFhxdGVTSVU5ZHEzbkNyYm5DZnhqVzFkWUNHa2dTeDB0TkZ0Y1RL?=
 =?gb2312?B?S3lteVorWWFLdE9CYld1REppUjBBaWd1UENJKy9saUNWZVo2Uk1HV1BLUEJL?=
 =?gb2312?B?OWJpWnBoaUVIcFhoUG1pTlYybjBGbmxjU21abklSaFhsc3YrMGhDUy92THpl?=
 =?gb2312?B?MXBjUUZsSHhpRVJld0NvRDhFYk9yNzBNTks2KzlSR0J0elprdEZrS29kR2pC?=
 =?gb2312?B?TEpneXpHQ053d3pQYTlDZ0VERXJIekx0SVg2dVprQ2hWY1FZZldtZHJ4TGc2?=
 =?gb2312?B?dEJrQmhPS09LaWNLd3ZnVHdYYzg3OHNtcWVpeVBKcUZMa2poUkllWVlhL1ZZ?=
 =?gb2312?B?cnF2a0V4VUFZUVk2NSsyWWhXdWdtVFdIcmFIcDRxY08yRGlVdElPekxtcVlI?=
 =?gb2312?B?SFBCNFA3Q2ZNcmUzUm9xZm84Rnd2aExNQUFGZG8rcW9PdVdPSWE4emhDbmdl?=
 =?gb2312?B?UHpNcTJ3RTdxaWZZV2JvZlFlK0dVNXc1aEZzTTNraEJibENvOWRMcHNuWXFn?=
 =?gb2312?B?YkppSExRZTlCTmpSbWFaK2ZVMDJ2ZCsrMnQ2RkJYOHZmRW1IL3pyWllpeTho?=
 =?gb2312?B?SUFZdzlxOWU2aHBTbEhycE1jTFNqZ3E4L3hoVjlBakZad0t5S3NFVmRkNkFh?=
 =?gb2312?B?eUNQOW9FQVhPdnEwSnpnT3hxSjZ0ektRa1pxRHFyOGpsYkxmMXF5Z2VLdm1l?=
 =?gb2312?B?THpwbEkvaUt4V2xhRm52WjNUeVlrR0hwQUpsVm81YjNLRVVOYzZ1TnVEWVNO?=
 =?gb2312?B?NWg1bWp2WEJ6eHlhV3pvVStIaEppN1NpRWUzeGpjazhWYVRjOHRkc1VuQUVi?=
 =?gb2312?B?MitFR0oxZjlmMkVPd3RYeHAveTVqVUwza2J2NlFmVk9qQmsrcWVxS09rdjFF?=
 =?gb2312?B?TG5BSjBESUZRa1RXdTBQRjhMTmtnVjhyRzYwWm1HencwT3AwY2lDUThuUXVt?=
 =?gb2312?B?SUJES0ZvbnFjRkUvU3VoUm9XM0VMK1o2QURIVFBtbkFhR1N5QkliZU8vekFJ?=
 =?gb2312?B?ZEE5VngwY1JIWkVQclJYNXJLVTFSR0lLTjhEU1VwZjRqMmVNUHlWeUlLSlUy?=
 =?gb2312?B?RnZiM1lTWFI2QlBpWmVwcUVqUWZqUzJTMlNKV0IzczFUNGwwb2NTZW5iRmh0?=
 =?gb2312?B?SENhRWsxQTBCVVpVN2VmN01adFZKUU54cnU2V0hueUJQbmNXck83Qko3K3Nw?=
 =?gb2312?B?b09lN2RhdmorYkxyZGFZdGhzM0Zya0FkTjJjWjBVSWZpa3MxdDZUVnVkVmZB?=
 =?gb2312?B?OHlqdm1QZDhhL0d6Um91Ykp4eFNRS0RpcnNXREZBdStKdnlva0tmV3JLbTU2?=
 =?gb2312?B?MnQ4OFplTGFnaENuOHJvWmlLT2wwcmNMTjZ2bnFDdTVUUlFWYmRuMFByWVJI?=
 =?gb2312?B?a2t2SXVMZCtRcllnR2VXc1BSU1FoWlF6WnQydm5IZDlPL2FZVE5pc2RyUTVX?=
 =?gb2312?B?VEJFeGFvYk12ZncwRnJ6V2JGL2thMTZ3Y0llMTVvajlTcGEzbkdxSmhnbEc3?=
 =?gb2312?Q?8ugcf4F/+6wLYUL7TU35niVIIE1qs2jZ4JsTCB7?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4170
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b978a51-5a82-40fb-6830-08d9693d5788
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZCy/gzdjDwizkzxUiY3RYiWoQqwVlQ77NhkEC4RWYi7ks8iQK6weVwrt7T8UOuTUSz5FDwqI5YFVgHAJn9RU5IvJUEdLP5miPy5yL44bzwhI9KAGZzMUxC3XenIVMS0O5d7ZUw/86pnK9XrVqGpv1kpXZvLRbBMfzfg6AZCbYDKKRfS/rkmd1d+w8RJbaiPgN3UWCa2WSUZv/+hIh8VDYpFiWfKKt74kahsrOVtRQ8PReJeP9EeAcuL6+3gqCrdWzifuOXrz0WO7jxcoBW70xzT+dAG10/FVa8acMuZ0ZhGynqmzkGDM6f3UztTJjXsoC5/coKmnqioJev/DxZSo1qivOeD5xwhSd+6k5zZhLJGId4q1CR2ju75oSINQ7rP13M7/riUWy/hiori/Fk2NVtNiYV/rpGvS0el3UUbH3CpZfFek+WRSY2Td16KUtioXKXRV1f/QrZTxv36fSaAukunAw5ehiAYmQYGojymhY43ZWGf4Qv6ff3DgB+MxM4OWstOwRiEXWj3Z2GRvBsD4A6+H7I/t5kmbJZr269fAV2WJefMXVkx4s+r6d5rvbN/YBQSAXSR9vHwryPap5ga50lL7W/F2m24gl2cBJ7Z2N/3OQsFx/b747fmgDRoThzJ4lQi37RWdUMnd0oYu4E+uyFT4AAEqmj6KpGAYdm/ymS5n/+AjZiWazxw0W7K08t/6KqSdA32OEo4Gj4RojwP+3A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(46966006)(36840700001)(53546011)(7696005)(82740400003)(86362001)(186003)(33656002)(6862004)(4326008)(47076005)(70586007)(70206006)(478600001)(9686003)(55016002)(6506007)(8936002)(52536014)(54906003)(356005)(336012)(81166007)(2906002)(36860700001)(8676002)(26005)(316002)(83380400001)(82310400003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 09:30:56.7175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9048732a-8f08-4ed8-c5a8-08d9693d5faa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6755

SGkgU3RlZmFubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjHE6jjU
wjI3yNUgNzo1Mg0KPiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGp1bGll
bkB4ZW4ub3JnOw0KPiBqYmV1bGljaEBzdXNlLmNvbTsgQmVydHJhbmQgTWFycXVpcyA8QmVydHJh
bmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMjAvNDBd
IHhlbi9hcm06IGltcGxlbWVudCBub2RlIGRpc3RhbmNlDQo+IGhlbHBlcnMgZm9yIEFybTY0DQo+
IA0KPiBPbiBXZWQsIDExIEF1ZyAyMDIxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBJbiBjdXJyZW50
IFhlbiBjb2RlLCBfX25vZGVfZGlzdGFuY2UgaXMgYSBmYWtlIEFQSSwgaXQgYWx3YXlzDQo+ID4g
cmV0dXJucyBOVU1BX1JFTU9URV9ESVNUQU5DRSgyMCkuIE5vdyB3ZSB1c2UgYSBtYXRyaXggdG8g
cmVjb3JkDQo+ID4gdGhlIGRpc3RhbmNlIGJldHdlZW4gYW55IHR3byBub2Rlcy4gQWNjb3JkaW5n
bHksIHdlIHByb3ZpZGUgYQ0KPiA+IHNldF9ub2RlX2Rpc3RhbmNlIEFQSSB0byBzZXQgdGhlIGRp
c3RhbmNlIGZvciBhbnkgdHdvIG5vZGVzIGluDQo+ID4gdGhpcyBwYXRjaC4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICB4
ZW4vYXJjaC9hcm0vbnVtYS5jICAgICAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIHwgMTIgKysrKysr
KysrKy0NCj4gPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9udW1hLmggfCAgMSAtDQo+ID4gIHhlbi9p
bmNsdWRlL3hlbi9udW1hLmggICAgIHwgIDIgKy0NCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA1NiBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9udW1hLmMgYi94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4gaW5kZXggNTY2YWQxZTUy
Yi4uZjYxYThkZjY0NSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4g
KysrIGIveGVuL2FyY2gvYXJtL251bWEuYw0KPiA+IEBAIC0yMyw2ICsyMywxMSBAQA0KPiA+ICAj
aW5jbHVkZSA8eGVuL3Bmbi5oPg0KPiA+ICAjaW5jbHVkZSA8YXNtL3NldHVwLmg+DQo+ID4NCj4g
PiArc3RhdGljIHVpbnQ4X3QgX19yZWFkX21vc3RseQ0KPiA+ICtub2RlX2Rpc3RhbmNlX21hcFtN
QVhfTlVNTk9ERVNdW01BWF9OVU1OT0RFU10gPSB7DQo+ID4gKyAgICB7IE5VTUFfUkVNT1RFX0RJ
U1RBTkNFIH0NCj4gPiArfTsNCj4gPiArDQo+ID4gIHZvaWQgbnVtYV9zZXRfbm9kZShpbnQgY3B1
LCBub2RlaWRfdCBuaWQpDQo+ID4gIHsNCj4gPiAgICAgIGlmICggbmlkID49IE1BWF9OVU1OT0RF
UyB8fA0KPiA+IEBAIC0zMiw2ICszNyw0NSBAQCB2b2lkIG51bWFfc2V0X25vZGUoaW50IGNwdSwg
bm9kZWlkX3QgbmlkKQ0KPiA+ICAgICAgY3B1X3RvX25vZGVbY3B1XSA9IG5pZDsNCj4gPiAgfQ0K
PiA+DQo+ID4gK3ZvaWQgX19pbml0IG51bWFfc2V0X2Rpc3RhbmNlKG5vZGVpZF90IGZyb20sIG5v
ZGVpZF90IHRvLCB1aW50MzJfdA0KPiBkaXN0YW5jZSkNCj4gPiArew0KPiA+ICsgICAgaWYgKCBm
cm9tID49IE1BWF9OVU1OT0RFUyB8fCB0byA+PSBNQVhfTlVNTk9ERVMgKQ0KPiA+ICsgICAgew0K
PiA+ICsgICAgICAgIHByaW50ayhLRVJOX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAgIk5VTUEg
bm9kZXMgYXJlIG91dCBvZiBtYXRyaXgsIGZyb209JXUgdG89JXUgZGlzdGFuY2U9JXVcbiIsDQo+
ID4gKyAgICAgICAgICAgIGZyb20sIHRvLCBkaXN0YW5jZSk7DQo+IA0KPiBOSVQ6IHBsZWFzZSBh
bGlnbi4gRXhhbXBsZToNCj4gDQo+IHByaW50ayhLRVJOX1dBUk5JTkcNCj4gICAgICAgICJOVU1B
IG5vZGVzIGFyZSBvdXQgb2YgbWF0cml4LCBmcm9tPSV1IHRvPSV1IGRpc3RhbmNlPSV1XG4iLA0K
PiANCj4gQWxzbyBwbGVhc2UgdXNlIFBSSXUzMiBmb3IgdWludDMyX3QuIFByb2JhYmx5IHNob3Vs
ZCB1c2UgUFJJdTggZm9yDQo+IG5vZGVpZHMuDQo+IA0KDQpPSw0KDQo+IA0KPiA+ICsgICAgICAg
IHJldHVybjsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICAvKiBOVU1BIGRlZmluZXMgMHhm
ZiBhcyBhbiB1bnJlYWNoYWJsZSBub2RlIGFuZCAwLTkgYXJlIHVuZGVmaW5lZA0KPiAqLw0KPiA+
ICsgICAgaWYgKCBkaXN0YW5jZSA+PSBOVU1BX05PX0RJU1RBTkNFIHx8DQo+ID4gKyAgICAgICAg
KGRpc3RhbmNlID49IE5VTUFfRElTVEFOQ0VfVURGX01JTiAmJg0KPiA+ICsgICAgICAgICBkaXN0
YW5jZSA8PSBOVU1BX0RJU1RBTkNFX1VERl9NQVgpIHx8DQo+ID4gKyAgICAgICAgKGZyb20gPT0g
dG8gJiYgZGlzdGFuY2UgIT0gTlVNQV9MT0NBTF9ESVNUQU5DRSkgKQ0KPiA+ICsgICAgew0KPiA+
ICsgICAgICAgIHByaW50ayhLRVJOX1dBUk5JTkcNCj4gPiArICAgICAgICAgICAgIkludmFsaWQg
TlVNQSBub2RlIGRpc3RhbmNlLCBmcm9tOiVkIHRvOiVkIGRpc3RhbmNlPSVkXG4iLA0KPiA+ICsg
ICAgICAgICAgICBmcm9tLCB0bywgZGlzdGFuY2UpOw0KPiANCj4gTklUOiBwbGVhc2UgYWxpZ24N
Cj4gDQo+IEFsc28geW91IHVzZWQgJXUgYmVmb3JlIGZvciBub2RlaWRzLCB3aGljaCBpcyBiZXR0
ZXIgYmVjYXVzZSBmcm9tIGFuZCB0bw0KPiBhcmUgdW5zaWduZWQuIERpc3RhbmNlIHNob3VsZCBi
ZSB1aW50MzJfdC4NCj4gDQoNCk9LDQoNCj4gDQo+ID4gKyAgICAgICAgcmV0dXJuOw0KPiA+ICsg
ICAgfQ0KPiA+ICsNCj4gPiArICAgIG5vZGVfZGlzdGFuY2VfbWFwW2Zyb21dW3RvXSA9IGRpc3Rh
bmNlOw0KPiANCj4gU2hvdWxkbid0IHdlIGFsc28gYmUgc2V0dGluZzoNCj4gDQo+ICAgICBub2Rl
X2Rpc3RhbmNlX21hcFt0b11bZnJvbV0gPSBkaXN0YW5jZTsNCj4gDQo+ID8NCj4gDQoNCk5vLCB3
ZSB3YW50IG51bWFfc2V0X2Rpc3RhbmNlIGJlaGF2aW9yIGlzIHNpbmdsZS4NCiJub2RlX2Rpc3Rh
bmNlX21hcFt0b11bZnJvbV0gPSBkaXN0YW5jZSIgaXMgaGFuZGxlZCBpbiBjYWxsZXIuDQoNCj4g
DQo+ID4gK30NCj4gPiArDQo+ID4gK3VpbnQ4X3QgX19ub2RlX2Rpc3RhbmNlKG5vZGVpZF90IGZy
b20sIG5vZGVpZF90IHRvKQ0KPiA+ICt7DQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogQ2hlY2sg
d2hldGhlciB0aGUgbm9kZXMgYXJlIGluIHRoZSBtYXRyaXggcmFuZ2UuDQo+ID4gKyAgICAgKiBX
aGVuIGFueSBub2RlIGlzIG91dCBvZiByYW5nZSwgZXhjZXB0IGZyb20gYW5kIHRvIG5vZGVzIGFy
ZSB0aGUNCj4gPiArICAgICAqIHNhbWUsIHdlIHRyZWF0IHRoZW0gYXMgdW5yZWFjaGFibGUgKHJl
dHVybiAweEZGKQ0KPiA+ICsgICAgICovDQo+ID4gKyAgICBpZiAoIGZyb20gPj0gTUFYX05VTU5P
REVTIHx8IHRvID49IE1BWF9OVU1OT0RFUyApDQo+ID4gKyAgICAgICAgcmV0dXJuIGZyb20gPT0g
dG8gPyBOVU1BX0xPQ0FMX0RJU1RBTkNFIDogTlVNQV9OT19ESVNUQU5DRTsNCj4gPiArDQo+ID4g
KyAgICByZXR1cm4gbm9kZV9kaXN0YW5jZV9tYXBbZnJvbV1bdG9dOw0KPiA+ICt9DQo+ID4gK0VY
UE9SVF9TWU1CT0woX19ub2RlX2Rpc3RhbmNlKTsNCj4gPiArDQo+ID4gIHZvaWQgX19pbml0IG51
bWFfaW5pdChib29sIGFjcGlfb2ZmKQ0KPiA+ICB7DQo+ID4gICAgICB1aW50MzJfdCBpZHg7DQo+
ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIGIveGVuL2luY2x1ZGUv
YXNtLWFybS9udW1hLmgNCj4gPiBpbmRleCBiYjQ5NWEyNGUxLi41NTliMDI4YTAxIDEwMDY0NA0K
PiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gKysrIGIveGVuL2luY2x1
ZGUvYXNtLWFybS9udW1hLmgNCj4gPiBAQCAtMTIsOCArMTIsMTkgQEAgdHlwZWRlZiB1OCBub2Rl
aWRfdDsNCj4gPiAgICogc2V0IHRoZSBudW1iZXIgb2YgTlVNQSBtZW1vcnkgYmxvY2sgbnVtYmVy
IHRvIDEyOC4NCj4gPiAgICovDQo+ID4gICNkZWZpbmUgTk9ERVNfU0hJRlQgICAgICA2DQo+ID4g
Ky8qDQo+ID4gKyAqIEluIEFDUEkgc3BlYywgMC05IGFyZSB0aGUgcmVzZXJ2ZWQgdmFsdWVzIGZv
ciBub2RlIGRpc3RhbmNlLA0KPiA+ICsgKiAxMCBpbmRpY2F0ZXMgbG9jYWwgbm9kZSBkaXN0YW5j
ZSwgMjAgaW5kaWNhdGVzIHJlbW90ZSBub2RlDQo+ID4gKyAqIGRpc3RhbmNlLiBTZXQgbm9kZSBk
aXN0YW5jZSBtYXAgaW4gZGV2aWNlIHRyZWUgd2lsbCBmb2xsb3cNCj4gPiArICogdGhlIEFDUEkn
cyBkZWZpbml0aW9uLg0KPiA+ICsgKi8NCj4gPiArI2RlZmluZSBOVU1BX0RJU1RBTkNFX1VERl9N
SU4gICAwDQo+ID4gKyNkZWZpbmUgTlVNQV9ESVNUQU5DRV9VREZfTUFYICAgOQ0KPiA+ICsjZGVm
aW5lIE5VTUFfTE9DQUxfRElTVEFOQ0UgICAgIDEwDQo+ID4gKyNkZWZpbmUgTlVNQV9SRU1PVEVf
RElTVEFOQ0UgICAgMjANCj4gPg0KPiA+ICBleHRlcm4gdm9pZCBudW1hX2luaXQoYm9vbCBhY3Bp
X29mZik7DQo+ID4gK2V4dGVybiB2b2lkIG51bWFfc2V0X2Rpc3RhbmNlKG5vZGVpZF90IGZyb20s
IG5vZGVpZF90IHRvLCB1aW50MzJfdA0KPiBkaXN0YW5jZSk7DQo+ID4NCj4gPiAgLyoNCj4gPiAg
ICogVGVtcG9yYXJ5IGZvciBmYWtlIE5VTUEgbm9kZSwgd2hlbiBDUFUsIG1lbW9yeSBhbmQgZGlz
dGFuY2UNCj4gPiBAQCAtMjEsNyArMzIsNiBAQCBleHRlcm4gdm9pZCBudW1hX2luaXQoYm9vbCBh
Y3BpX29mZik7DQo+ID4gICAqIHN5bWJvbHMgd2lsbCBiZSByZW1vdmVkLg0KPiA+ICAgKi8NCj4g
PiAgZXh0ZXJuIG1mbl90IGZpcnN0X3ZhbGlkX21mbjsNCj4gPiAtI2RlZmluZSBfX25vZGVfZGlz
dGFuY2UoYSwgYikgKDIwKQ0KPiA+DQo+ID4gICNlbHNlDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9udW1hLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L251bWEuaA0K
PiA+IGluZGV4IDVhNTdhNTFlMjYuLmUwMjUzYzIwYjcgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9udW1hLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L251bWEu
aA0KPiA+IEBAIC0yMSw3ICsyMSw2IEBAIGV4dGVybiBub2RlaWRfdCBhcGljaWRfdG9fbm9kZVtd
Ow0KPiA+ICBleHRlcm4gdm9pZCBpbml0X2NwdV90b19ub2RlKHZvaWQpOw0KPiA+DQo+ID4gIHZv
aWQgc3JhdF9wYXJzZV9yZWdpb25zKHU2NCBhZGRyKTsNCj4gPiAtZXh0ZXJuIHU4IF9fbm9kZV9k
aXN0YW5jZShub2RlaWRfdCBhLCBub2RlaWRfdCBiKTsNCj4gPiAgdW5zaWduZWQgaW50IGFyY2hf
Z2V0X2RtYV9iaXRzaXplKHZvaWQpOw0KPiA+DQo+ID4gICNlbmRpZg0KPiA+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oIGIveGVuL2luY2x1ZGUveGVuL251bWEuaA0KPiA+IGlu
ZGV4IGNiMDhkMmVjYTkuLjA0NzU4MjNiMTMgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL251bWEuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4gPiBAQCAtNTgs
NyArNTgsNyBAQCBzdGF0aWMgaW5saW5lIF9fYXR0cmlidXRlX18oKHB1cmUpKSBub2RlaWRfdA0K
PiBwaHlzX3RvX25pZChwYWRkcl90IGFkZHIpDQo+ID4gICNkZWZpbmUgbm9kZV9zcGFubmVkX3Bh
Z2VzKG5pZCkJKE5PREVfREFUQShuaWQpLT5ub2RlX3NwYW5uZWRfcGFnZXMpDQo+ID4gICNkZWZp
bmUgbm9kZV9lbmRfcGZuKG5pZCkgICAgICAgKE5PREVfREFUQShuaWQpLT5ub2RlX3N0YXJ0X3Bm
biArIFwNCj4gPiAgCQkJCSBOT0RFX0RBVEEobmlkKS0+bm9kZV9zcGFubmVkX3BhZ2VzKQ0KPiA+
IC0NCj4gPiArZXh0ZXJuIHU4IF9fbm9kZV9kaXN0YW5jZShub2RlaWRfdCBhLCBub2RlaWRfdCBi
KTsNCj4gPiAgZXh0ZXJuIHZvaWQgbnVtYV9hZGRfY3B1KGludCBjcHUpOw0KPiA+DQo+ID4gIHN0
cnVjdCBub2RlIHsNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=

