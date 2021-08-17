Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F5C3EE462
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 04:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167551.305860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFoq5-0005LO-Kp; Tue, 17 Aug 2021 02:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167551.305860; Tue, 17 Aug 2021 02:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFoq5-0005Il-Gs; Tue, 17 Aug 2021 02:28:29 +0000
Received: by outflank-mailman (input) for mailman id 167551;
 Tue, 17 Aug 2021 02:28:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5rO=NI=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mFoq4-0005If-0y
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 02:28:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc8f0fc8-ff02-11eb-a485-12813bfff9fa;
 Tue, 17 Aug 2021 02:28:25 +0000 (UTC)
Received: from AM6PR0502CA0058.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::35) by AM4PR0802MB2371.eurprd08.prod.outlook.com
 (2603:10a6:200:5d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Tue, 17 Aug
 2021 02:28:24 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::1e) by AM6PR0502CA0058.outlook.office365.com
 (2603:10a6:20b:56::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Tue, 17 Aug 2021 02:28:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Tue, 17 Aug 2021 02:28:23 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Tue, 17 Aug 2021 02:28:22 +0000
Received: from ce19f5d90b09.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7DAC1939-E67F-4208-BD13-4D5F0AD5F3A7.1; 
 Tue, 17 Aug 2021 02:28:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ce19f5d90b09.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Aug 2021 02:28:17 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB4511.eurprd08.prod.outlook.com (2603:10a6:803:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Tue, 17 Aug
 2021 02:28:14 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::adf8:8d6f:2a30:b60c%5]) with mapi id 15.20.4415.022; Tue, 17 Aug 2021
 02:28:14 +0000
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
X-Inumbo-ID: cc8f0fc8-ff02-11eb-a485-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl0OLRvXX3erALVsL0Xk+roz4xkcrfTlCGTOcQl5vkg=;
 b=ekfhwFIZOOyP+xUp+MMUXtRnWPazDhi9KM3BcQ+LkBSwF88V5L/hKBkrbd+IpK9GA0Wm09AOxsdffD+PRvvF13L9HBG7jNITnLbMowLu0etwK6sn+6SDXYymhl0OK807GqlUeu1HR9n/07/kdwLYhHKPvYmUGzpX2Dpd5xefn80=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mX4S55iVNiUcZt9gBd4S99NcizAipxjSHhvaI7y/6PFYlzAQIwWKCwsljBJTrw2gwqxjhDHFye9PIosqXUF+5bwRvfjo0hTOOkePHFpwRPmVaXUPFzCstAjfGvM5JTVSr4vM0XEGYPXcdM8YLn9ESnbHE4cVE39UyVk//DMKJf+DgMuot5jFcy4KqLJGopK9xwH2kRURTDQZAZ9MPr7SabIqS/c76g6gO3U+GAinj4bHDMCORD5xvNe8d0ujzx9txyNotrODS6lXl8o/eYPzRm9lJE5zcBeLZz4u87S33at6Q3ncGIU+FQOkqlS3gt64+lt4UUczpTly4gy73TVVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl0OLRvXX3erALVsL0Xk+roz4xkcrfTlCGTOcQl5vkg=;
 b=HuFw4z0FUtcUfoPBf/8dDgGGqOagxZ3gwQIHNlVVpXw9lepoh3LUyLi2bbwTkEr9BRY99O/nR5yuzhjXImC12NDJ5Fb4PPWiSevF23RrRwmcAPaCu1pcnbNMKwpI+3VUU8N2QseCQfCAg2apoInEuScRkqUoOzOcjWb1x+/mSOr/5d5vtbt0wEOhI8MR93cTzKE6UrITJlc0hH/1VTUS0KD/inrqoLscahxGO7aHGOQ56bQJbyO96yukgYgZA1hqcUm5itLnjE4VfIHcDQSgJhINUTZC/2OH90DSCIvmwihrvayjJZLnIWFs0caZR4ZJFc/jSAziKRmtkxCMS75HjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rl0OLRvXX3erALVsL0Xk+roz4xkcrfTlCGTOcQl5vkg=;
 b=ekfhwFIZOOyP+xUp+MMUXtRnWPazDhi9KM3BcQ+LkBSwF88V5L/hKBkrbd+IpK9GA0Wm09AOxsdffD+PRvvF13L9HBG7jNITnLbMowLu0etwK6sn+6SDXYymhl0OK807GqlUeu1HR9n/07/kdwLYhHKPvYmUGzpX2Dpd5xefn80=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH V4 01/10] xen/arm: introduce domain on Static Allocation
Thread-Topic: [PATCH V4 01/10] xen/arm: introduce domain on Static Allocation
Thread-Index: AQHXg5tT+SWyG6li/k6wFxy4MgT6GKtuY1iAgAcolICAAPTrAIAAlbCA
Date: Tue, 17 Aug 2021 02:28:13 +0000
Message-ID:
 <VE1PR08MB5215EB625C7E380553C10B25F7FE9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-2-penny.zheng@arm.com>
 <7c99d0dd-ef62-10a8-a11e-d2ca52910591@xen.org>
 <VE1PR08MB521506FADC3CC8096D9B98DFF7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <9a6e7689-50e2-f046-4ebb-ebbafc769f26@xen.org>
In-Reply-To: <9a6e7689-50e2-f046-4ebb-ebbafc769f26@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F06AFA94B7AAF043B05E7A1C30F25E2C.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ddf25594-4996-4024-97f8-08d96126afcc
x-ms-traffictypediagnostic: VI1PR08MB4511:|AM4PR0802MB2371:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB2371AE0DDFE197E68EB54481F7FE9@AM4PR0802MB2371.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LRdHMNARCD+DVGh2oVNoulxL+cdXQ82QJzL3jJQoYeyZ5I3aUZU3s9ChI0xnl0j/3M7RCcj/OminmBcMyf2s+/V7e72Orflm3+2Bbgf5AJi3aJu9onvChCGZ8++LVOHswMgPFVQw8PDdioUumegdcoBqKO6VO4OeQQ/fhxPXVxBUxwRihAz7SLLaTcz1TIFZmKpU9uGQtPKt2jsn16oPLFKD/gAUQn/vATvHqaZ/vOp30NtRodFFNjcNn/50mgjOMtuRJC0zOsCWQwpEK5rTRAYz+MUd+F+pM4dOk5D00sE3taKVgGHFXWlyBZgGH3BpSg9Xh/hicXWtXw6ItAc3LQpaKCtuFVb70kr6xjJL5iV+p2bX1cH/Ni1R+QSP3XRmJHhx7GhjbFa7f6Z200M/DWnmHuzPg9z5DVYz2rpY6W4aJJJG/UN+vb2Ef63hcrRO+ehOaYzIC8L8ZPqyA7gLC1urLRKim3Fn2U8h22C0qSUz/Uke5ArDH/ardK5OvteHh5O+9aJ5gkfOZVfWCliW8BxFHPIaSYxQhizdtw5JGf+HrFuTtj/Ov8Xug/6sj8DgVjCdGHwzIwCn2ORMCqUPjbzZyaZfWPD/yYHBX2n3z8apC0rACXU2MrIPOVfOip3BL8EtE5j2oJ87plCIwcLTvDA+dnKeALC/EdU+hvQJJ7UGjmA/fRRXY62rnSd210VMk/WFkRkLAwhCl9GEmcW4Bg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(71200400001)(55016002)(316002)(478600001)(83380400001)(66946007)(76116006)(6506007)(53546011)(52536014)(186003)(4326008)(9686003)(122000001)(86362001)(33656002)(8676002)(64756008)(7696005)(66556008)(110136005)(5660300002)(66446008)(2906002)(54906003)(38070700005)(8936002)(38100700002)(66476007)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c3pFNG1LTWdlZzZ3UmFWdnBnNnFBdG1MeWRjaHZnOGtHd2RRcUU4WkZKUUVh?=
 =?utf-8?B?b2NoZmdIWENDL2hDYWRDaVpkZWpwNS85L3I4RU1hdFgreW0wcmIvUXJ2U1Qv?=
 =?utf-8?B?SFVzRFRySDlRUGQvNW11U3lENlZvL2d2NUFwcW1yZkYya1hCVEVlcnVZUXZi?=
 =?utf-8?B?NzJNREJZOTk0RjBGYUFSaEVwU3IvM0QvUnAwQU9YeDZTUTgvS2RjS09pU0ZN?=
 =?utf-8?B?bG1WaHlBci95eENNN3hoM3ZBaUpSM1J1N0Mzb0FnTXlWdVErZXI3RmZpNmgv?=
 =?utf-8?B?RDJ2M0toQXRCYVZwVU1nYlJDRkpNc2xpdXQ3N0c4VjFVQ2Q3QnJydVg4MTZ1?=
 =?utf-8?B?ZzZJOGVVMFlORHZaR0RUUkJYdGczYmNZRU04WG92SkJabEJ6bFRvcy9MNU96?=
 =?utf-8?B?dE00NHhFK2dSWjhhcGliK2dOc1Y2ZEFHTmtoZGF1aTZ6MlhGRXdTMWY5akZl?=
 =?utf-8?B?M010NURlMUZ6RFlWWVVXUEV1MjgxMnFvSVRjMHV2bmdrcFQ4Y2VyN3pkeVN0?=
 =?utf-8?B?TDhPZlJWLzNCd2p4VXZXUU5UYkltRWlMNmxuL253dnZneTdpQUNMQy9ncmhn?=
 =?utf-8?B?SllKRDA5V3UvNHhNZWV0Nmlmak93U3N4RlN3cEpLUWhoenpEKzI4Q3lkRnJW?=
 =?utf-8?B?aW80Zzg1WVpmcVcyNkgxSG95aTZBbHBKSFljSE9vNDVxa2JnWkozK1ZmSzc2?=
 =?utf-8?B?OTBvU2RaeVg3ZDZaa2xCYzFRbTI5dUFJdEp3R21yam1uam9ZMThqa2ZiWHFD?=
 =?utf-8?B?dTVSQ0JTM3h6N011d3hmaVlGdjFYVGpvK3NKTXIvU01ub0hwdlJGbGd0dU9Q?=
 =?utf-8?B?WS9QWE1PMEljOFFxSUl1UUpvcHljRlZSVEErOGhjSjhadU5QOWlIY0czYkNL?=
 =?utf-8?B?T1JianBpZUdCeGZsZlg0dVE5dW1JRHpENjZKczI1QzFPZG5OemZWUTJRL0xp?=
 =?utf-8?B?b3ZEQ3BqbW1MV2hQTHUzWkNvQ0tmMjBvMHVrdHE5SmtyNXQ3SXQ1Zklhdlhl?=
 =?utf-8?B?ckNWU1VHT0R5VHIwejRPQVZ2aVNTbUszOWZpcFNkRlR3YXZkeHE1NmlXUTZv?=
 =?utf-8?B?ZjE0RFZ0VFV2WngrbmozSXNVWWcyN2ZoQUd4ZXk5TkJxc0RnRFAwVkswMnVI?=
 =?utf-8?B?UlFNa3NadFJEcUgrR1phZE14WlgvNjRsVVN2dDN5QmtqclBGV0NJZldGV01q?=
 =?utf-8?B?RDlRWGR1VTUwSy8rZ283M1hVYVMvWGlFakhHbm5XKzg3V1FJblFFMWUyci9u?=
 =?utf-8?B?cEpQclkwOUFlTGdSMi9mQVdWdkIzQWwzQlVtbkZuT05MWGNiTUZ3ckJMNGJO?=
 =?utf-8?B?eFd4d1JHUHM4YW1KT1N3cGNUdnAyQ0xmSVNXMmFYdWw0VWg5ZnYwT2xHZkV5?=
 =?utf-8?B?U21CZ0QzanJlUkx3OEJ1WVl1UHpXaWtmeTRXcllWS3B0eXpoMHZMR2NSMmtE?=
 =?utf-8?B?bjE0RWRkTm01UkQ3azhSQys1K1lVZUtDOVlpdXRLdGUwMDQwL2t2L01GOVNY?=
 =?utf-8?B?Y0JnZENHakRDRlIwTzExV3cxT2MyRXBSVTh1U0JabUIzTkU0NFRjSXpFQktl?=
 =?utf-8?B?cm40bEZLSGNiVDNBNXBhMW9BMy94S29TYitYYVNiRlU4VHJKTVkrTUNxeFpm?=
 =?utf-8?B?UnYvYlFlMGVtWnNzM25tU3c2OWMvMFRqTGgvaTRCOWhZYnR6UzhkWGRJL1BE?=
 =?utf-8?B?Z3A2ZjFOMk1WK0ZHamdobXFoZVVHcUFuQ2JwV0tjZjJzSCtDakREby9zT3dV?=
 =?utf-8?Q?/+WhDNmZ/0ybRXSlyhHu2SMwyK694O6Qr49BzOQ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4511
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5df4618d-2636-403c-1f2d-08d96126aa24
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GJ8LYfMhC1kSJ8jGxqTxr0BpJIZBwXIndmyHopmZFn4L+UEVCfqY+f1TDpgBjxSviPVwj4GvymysgflmU7tsZe8NXI6R1o9BmsnglrvGcCVIQ0ZhH43P7dfBPuVzWajTQs/1DqSdrXnY+8c5PuacxT5bZ3buYT0g7vezJ54wiQCKizzG+UdCzN0nxc9BkqH0tvlpkM0mGWlkFzkDpS5OrQSSxD+6WWRNSykScQfXpOoMAIoHme+qpvh85/o7NH+/WSY+eQKEXKyYo5xMXLgg6RzVIBYgIbgjx4aagJEwlOOsaA8maH6W1GRnA6XtT6oSpAUOm7jnIeEyS3q0LWmM+g+zjeekUzIhncYTVfNFBQPN0J5+5uJJI3ex0ajKXO9cjAr2eFl6sliW/y5nPIf/wOZDCt5+lJ6N3l3Hf1MhEcjM0LcfrF4L5Y+jQ9zDPTqsMTcGHNbD3/qDqiQnzhIgqxhohfYiIZBQ6iRUXjngLNqSU08i59Xs+RUJkf8XTsC4R7Et+qtBM05X9qlmUBaK9uHf1VqkeGr+e3isx0Tq5/N7BwaDgpP3SVLEoLGlIoXvTm29XgCN/1/41Rfhc13o45Yk0kZe2gt2KL/KMmxgHEe83Vtpz3Wm56CMsHzS25ICjcBYDVEmRgEUy0O3o4MrcE6kS5kT9H2VOeNejEc/zzZMnyTEdHgLUEKboYuyXVED9hJgN7CBiWN0IBp9pMekDg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(36840700001)(46966006)(33656002)(316002)(54906003)(9686003)(55016002)(4326008)(36860700001)(7696005)(47076005)(110136005)(70206006)(5660300002)(26005)(81166007)(356005)(83380400001)(82740400003)(6506007)(8676002)(478600001)(8936002)(52536014)(70586007)(2906002)(336012)(186003)(82310400003)(53546011)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 02:28:23.4958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf25594-4996-4024-97f8-08d96126afcc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2371

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDE3LCAyMDIx
IDE6MjggQU0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENj
OiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0K
PiA8V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIFY0IDAxLzEwXSB4ZW4vYXJtOiBpbnRyb2R1Y2UgZG9tYWluIG9uIFN0YXRpYyBBbGxvY2F0
aW9uDQo+IA0KPiANCj4gDQo+IE9uIDE2LzA4LzIwMjEgMDY6MjEsIFBlbm55IFpoZW5nIHdyb3Rl
Og0KPiA+IEhpIEp1bGllbg0KPiANCj4gSGkgUGVubnksDQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0K
PiA+PiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAxMSwgMjAyMSA5OjMyIFBNDQo+ID4+IFRvOiBQ
ZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT47DQo+ID4+IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZw0KPiA+PiBDYzogQmVydHJhbmQg
TWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPj4gPFdlaS5D
aGVuQGFybS5jb20+OyBuZCA8bmRAYXJtLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCBW
NCAwMS8xMF0geGVuL2FybTogaW50cm9kdWNlIGRvbWFpbiBvbiBTdGF0aWMNCj4gPj4gQWxsb2Nh
dGlvbg0KPiA+Pg0KPiA+PiBIaSBQZW5ueSwNCj4gPj4NCj4gPj4gT24gMjgvMDcvMjAyMSAxMToy
NywgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+PiBTdGF0aWMgQWxsb2NhdGlvbiByZWZlcnMgdG8g
c3lzdGVtIG9yIHN1Yi1zeXN0ZW0oZG9tYWlucykgZm9yIHdoaWNoDQo+ID4+PiBtZW1vcnkgYXJl
YXMgYXJlIHByZS1kZWZpbmVkIGJ5IGNvbmZpZ3VyYXRpb24gdXNpbmcgcGh5c2ljYWwgYWRkcmVz
cw0KPiA+PiByYW5nZXMuDQo+ID4+PiBUaG9zZSBwcmUtZGVmaW5lZCBtZW1vcnksIC0tIFN0YXRp
YyBNZW1vcnksIGFzIHBhcnRzIG9mIFJBTSByZXNlcnZlZA0KPiA+Pj4gaW4gdGhlIGJlZ2lubmlu
Zywgc2hhbGwgbmV2ZXIgZ28gdG8gaGVhcCBhbGxvY2F0b3Igb3IgYm9vdCBhbGxvY2F0b3INCj4g
Pj4+IGZvciBhbnkNCj4gPj4gdXNlLg0KPiA+Pj4NCj4gPj4+IERvbWFpbnMgb24gU3RhdGljIEFs
bG9jYXRpb24gaXMgc3VwcG9ydGVkIHRocm91Z2ggZGV2aWNlIHRyZWUNCj4gPj4+IHByb3BlcnR5
IGB4ZW4sc3RhdGljLW1lbWAgc3BlY2lmeWluZyByZXNlcnZlZCBSQU0gYmFua3MgYXMgdGhpcyBk
b21haW4ncw0KPiBndWVzdCBSQU0uDQo+ID4+PiBCeSBkZWZhdWx0LCB0aGV5IHNoYWxsIGJlIG1h
cHBlZCB0byB0aGUgZml4ZWQgZ3Vlc3QgUkFNIGFkZHJlc3MNCj4gPj4+IGBHVUVTVF9SQU0wX0JB
U0VgLCBgR1VFU1RfUkFNMV9CQVNFYC4NCj4gPj4+DQo+ID4+PiBUaGlzIHBhdGNoIGludHJvZHVj
ZXMgdGhpcyBuZXcgYHhlbixzdGF0aWMtbWVtYCBmZWF0dXJlLCBhbmQgYWxzbw0KPiA+Pj4gZG9j
dW1lbnRzIGFuZCBwYXJzZXMgdGhpcyBuZXcgYXR0cmlidXRlIGF0IGJvb3QgdGltZSBhbmQgc3Rv
cmVzDQo+ID4+PiByZWxhdGVkIGluZm8gaW4gc3RhdGljX21lbSBmb3IgbGF0ZXIgaW5pdGlhbGl6
YXRpb24uDQo+ID4+Pg0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55Lnpo
ZW5nQGFybS5jb20+DQo+ID4+PiAtLS0NCj4gPj4+ICAgIGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRy
ZWUvYm9vdGluZy50eHQgfCA0MCArKysrKysrKysrKysrKysrKysrKysNCj4gPj4+ICAgIHhlbi9h
cmNoL2FybS9ib290ZmR0LmMgICAgICAgICAgICAgICAgfCA1MSArKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gPj4+ICAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaCAgICAgICAgICAg
fCAgMiArKw0KPiA+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspDQo+ID4+
Pg0KPiA+Pj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50
eHQNCj4gPj4+IGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dA0KPiA+Pj4g
aW5kZXggNTI0M2JjN2ZkMy4uMmExZGRjYTI5YiAxMDA2NDQNCj4gPj4+IC0tLSBhL2RvY3MvbWlz
Yy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQNCj4gPj4+ICsrKyBiL2RvY3MvbWlzYy9hcm0v
ZGV2aWNlLXRyZWUvYm9vdGluZy50eHQNCj4gPj4+IEBAIC0yNjgsMyArMjY4LDQzIEBAIFRoZSBE
VEIgZnJhZ21lbnQgaXMgbG9hZGVkIGF0IDB4YzAwMDAwMCBpbiB0aGUNCj4gPj4gZXhhbXBsZSBh
Ym92ZS4gSXQgc2hvdWxkDQo+ID4+PiAgICBmb2xsb3cgdGhlIGNvbnZlbnRpb24gZXhwbGFpbmVk
IGluIGRvY3MvbWlzYy9hcm0vcGFzc3Rocm91Z2gudHh0LiBUaGUNCj4gPj4+ICAgIERUQiBmcmFn
bWVudCB3aWxsIGJlIGFkZGVkIHRvIHRoZSBndWVzdCBkZXZpY2UgdHJlZSwgc28gdGhhdCB0aGUg
Z3Vlc3QNCj4gPj4+ICAgIGtlcm5lbCB3aWxsIGJlIGFibGUgdG8gZGlzY292ZXIgdGhlIGRldmlj
ZS4NCj4gPj4+ICsNCj4gPj4+ICsNCj4gPj4+ICtTdGF0aWMgQWxsb2NhdGlvbg0KPiA+Pj4gKz09
PT09PT09PT09PT0NCj4gPj4+ICsNCj4gPj4+ICtTdGF0aWMgQWxsb2NhdGlvbiByZWZlcnMgdG8g
c3lzdGVtIG9yIHN1Yi1zeXN0ZW0oZG9tYWlucykgZm9yIHdoaWNoDQo+ID4+PiArbWVtb3J5IGFy
ZWFzIGFyZSBwcmUtZGVmaW5lZCBieSBjb25maWd1cmF0aW9uIHVzaW5nIHBoeXNpY2FsDQo+ID4+
PiArYWRkcmVzcw0KPiA+PiByYW5nZXMuDQo+ID4+PiArVGhvc2UgcHJlLWRlZmluZWQgbWVtb3J5
LCAtLSBTdGF0aWMgTWVtb3J5LCBhcyBwYXJ0cyBvZiBSQU0NCj4gPj4+ICtyZXNlcnZlZCBpbiB0
aGUgYmVnaW5uaW5nLCBzaGFsbCBuZXZlciBnbyB0byBoZWFwIGFsbG9jYXRvciBvciBib290DQo+
ID4+PiArYWxsb2NhdG9yIGZvciBhbnkNCj4gPj4gdXNlLg0KPiA+Pg0KPiA+PiBJIGRvbid0IHVu
ZGVyc3RhbmQgImFzIHBhcnRzIG9mIFJBTSByZXNlcnZlZCBpbiB0aGUgYmVnaW5uaW5nIi4gQ291
bGQNCj4gPj4geW91IGNsYXJpZnkgaXQ/DQo+ID4+DQo+ID4NCj4gPiBJIG1lYW4sIHN0YXRpYyBt
ZW1vcnkgaXMgdmVyeSBhbGlrZSByZXNlcnZlZCBtZW1vcnksIHJlc2VydmVkIGR1cmluZw0KPiA+
IHN5c3RlbSBib290IHRpbWUsIG5vdCBkeW5hbWljYWxseSBhbGxvY2F0ZWQgYXQgcnVudGltZS4N
Cj4gDQo+IFRoYW5rcyBmb3IgdGhlIGNsYXJpZmljYXRpb24uIFRoZSBkb2N1bWVudGF0aW9uIGlz
IG1lYW50IHRvIGJlIGZvciB0aGUgdXNlcnMsIHNvDQo+IEkgd291bGQgc3VnZ2VzdCB0byBkcm9w
IHRoZSAiLS0gU3RhdGljIG1lbW9yeSwgYXMgcGFyc2Ugb2YgUkFNIHJlc2VydmVkIg0KPiBiZWNh
dXNlIGl0IGRvZXNuJ3QgYWRkIGFueSB2YWx1ZSB0byBrbm93IHdlIHRyZWF0IHRoZSBzdGF0aWMg
bWVtb3J5IGFuZA0KPiByZXNlcnZlZCBtZW1vcnkgdGhlIHNhbWUgd2F5Lg0KPiANCg0KR290IGl0
LiBUaHgNCg0KPiA+Pj4gKw0KPiA+Pj4gK1RoZSBkdGIgcHJvcGVydHkgc2hvdWxkIGxvb2sgbGlr
ZSBhcyBmb2xsb3dzOg0KPiA+Pg0KPiA+PiBEbyB5b3UgbWVhbiAibm9kZSIgcmF0aGVyIHRoYW4g
InByb3BlcnR5Ij8NCj4gPj4NCj4gPg0KPiA+IE9oLCBzdXJlLiBNYXliZSAiYXMgYW4gZXhhbXBs
ZSIgc2hhbGwgYmUgbW9yZSBjbGFyaWZpZWQuDQo+IA0KPiBJIHdvdWxkIHdyaXRlICJCZWxvdyBh
biBleGFtcGxlIG9uIGhvdyB0byBzcGVjaWZpYyB0aGUgc3RhdGljIG1lbW9yeSByZWdpb24NCj4g
aW4gdGhlIGRldmljZS10cmVlIi4NCj4gDQoNClRoYW5rcyBmb3IgdGhlIGV4YW1wbGUuIFdpbGwg
ZG8gDQoNCj4gPg0KPiA+Pj4gKyAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInhlbixkb21h
aW4iOw0KPiA+Pj4gKyAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwweDI+Ow0KPiA+
Pj4gKyAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDI+Ow0KPiA+Pj4gKyAgICAgICAg
ICAgICAgICBjcHVzID0gPDI+Ow0KPiA+Pj4gKyAgICAgICAgICAgICAgICAjeGVuLHN0YXRpYy1t
ZW0tYWRkcmVzcy1jZWxscyA9IDwweDE+Ow0KPiA+Pj4gKyAgICAgICAgICAgICAgICAjeGVuLHN0
YXRpYy1tZW0tc2l6ZS1jZWxscyA9IDwweDE+Ow0KPiA+Pj4gKyAgICAgICAgICAgICAgICB4ZW4s
c3RhdGljLW1lbSA9IDwweDMwMDAwMDAwIDB4MjAwMDAwMDA+Ow0KPiA+Pj4gKyAgICAgICAgICAg
ICAgICAuLi4NCj4gPj4+ICsgICAgICAgICAgICB9Ow0KPiA+Pj4gKyAgICAgICAgfTsNCj4gPj4+
ICsgICAgfTsNCj4gPj4+ICsNCj4gPj4+ICtEb21VMSB3aWxsIGhhdmUgYSBzdGF0aWMgbWVtb3J5
IG9mIDUxMk1CIHJlc2VydmVkIGZyb20gdGhlIHBoeXNpY2FsDQo+ID4+PiArYWRkcmVzcw0KPiA+
Pj4gKzB4MzAwMDAwMDAgdG8gMHg1MDAwMDAwMC4NCj4gPj4NCj4gPj4gSSB3b3VsZCB3cml0ZSAi
VGhpcyB3aWxsIHJlc2VydmUgYSA1MTJNQiByZWdpb24gc3RhcnRpbmcgYXQgdGhlIGhvc3QNCj4g
Pj4gcGh5c2ljYWwgYWRkcmVzcyAweDMwMDAwMDAwIHRvIGJlIGV4Y2x1c2l2ZWx5IHVzZWQgYnkg
RG9tVTEiLg0KPiA+Pg0KPiA+DQo+ID4gU3VyZSwgdGh4Lg0KPiA+DQo+ID4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgaW5kZXgN
Cj4gPj4+IDQ3NmUzMmUwZjUuLmQyNzE0NDQ2ZTEgMTAwNjQ0DQo+ID4+PiAtLS0gYS94ZW4vYXJj
aC9hcm0vYm9vdGZkdC5jDQo+ID4+PiArKysgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jDQo+ID4+
PiBAQCAtMTkzLDYgKzE5Myw1NSBAQCBzdGF0aWMgaW50IF9faW5pdA0KPiA+PiBwcm9jZXNzX3Jl
c2VydmVkX21lbW9yeV9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsDQo+ID4+PiAgICAg
ICAgcmV0dXJuIDA7DQo+ID4+PiAgICB9DQo+ID4+Pg0KPiA+Pj4gK3N0YXRpYyBpbnQgX19pbml0
IHByb2Nlc3Nfc3RhdGljX21lbW9yeShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLA0KPiA+Pj4g
K3ZvaWQgKmRhdGEpIHsNCj4gPj4NCj4gPj4gVGhpcyBpcyBwcmV0dHkgbXVjaCBhIGNvcHkgb2Yg
cHJvY2Vzc19tZW1vcnlfbm9kZSgpLiBTbyBjYW4gd2UgYXZvaWQNCj4gPj4gdGhlIGR1cGxpY2F0
aW9uPw0KPiA+Pg0KPiA+PiBJIHRoaW5rIEkgbWVudGlvbm5lZCBpdCBpbiB0aGUgcGFzdCBidXQg
SSBjYW4ndCBmaW5kIHRoZSBvdXRjb21lLg0KPiA+Pg0KPiA+Pj4gKyAgICBpbnQgaSA9IDAsIGJh
bmtzOw0KPiA+Pj4gKyAgICBjb25zdCBfX2JlMzIgKmNlbGw7DQo+ID4+PiArICAgIHBhZGRyX3Qg
c3RhcnQsIHNpemU7DQo+ID4+PiArICAgIHUzMiBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzLCBy
ZWdfY2VsbHM7DQo+ID4+PiArICAgIHN0cnVjdCBtZW1pbmZvICptZW0gPSBkYXRhOw0KPiA+Pj4g
KyAgICBjb25zdCBzdHJ1Y3QgZmR0X3Byb3BlcnR5ICpwcm9wOw0KPiA+Pj4gKw0KPiA+Pj4gKw0K
PiA+Pj4gKyAgICBhZGRyZXNzX2NlbGxzID0gZGV2aWNlX3RyZWVfZ2V0X3UzMihmZHQsIG5vZGUs
DQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIjeGVuLHN0
YXRpYy1tZW0tYWRkcmVzcy1jZWxscyIsIDApOw0KPiA+Pj4gKyAgICBzaXplX2NlbGxzID0gZGV2
aWNlX3RyZWVfZ2V0X3UzMihmZHQsIG5vZGUsDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICIjeGVuLHN0YXRpYy1tZW0tc2l6ZS1jZWxscyIsIDApOw0KPiA+Pj4g
KyAgICBpZiAoIChhZGRyZXNzX2NlbGxzID09IDApIHx8IChzaXplX2NlbGxzID09IDApICkNCj4g
Pj4+ICsgICAgew0KPiA+Pj4gKyAgICAgICAgIHByaW50aygiTWlzc2luZyBcIiN4ZW4sc3RhdGlj
LW1lbS1hZGRyZXNzLWNlbGxcIiBvciAiDQo+ID4+PiArICAgICAgICAgICAgICAgICAiXCIjeGVu
LHN0YXRpYy1tZW0tYWRkcmVzcy1jZWxsXCIuXG4iKTsNCj4gPj4+ICsgICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4gPj4+ICsgICAgfQ0KPiA+Pj4gKyAgICByZWdfY2VsbHMgPSBhZGRyZXNzX2Nl
bGxzICsgc2l6ZV9jZWxsczsNCj4gPj4+ICsNCj4gPj4+ICsgICAgcHJvcCA9IGZkdF9nZXRfcHJv
cGVydHkoZmR0LCBub2RlLCAieGVuLHN0YXRpYy1tZW0iLCBOVUxMKTsNCj4gPj4+ICsgICAgLyoN
Cj4gPj4+ICsgICAgICogU3RhdGljIG1lbW9yeSBzaGFsbCBiZWxvbmcgdG8gYSBzcGVjaWZpYyBk
b21haW4sIHRoYXQgaXMsDQo+ID4+PiArICAgICAqIGl0cyBub2RlIGBkb21VeGAgaGFzIGNvbXBh
dGlibGUgc3RyaW5nICJ4ZW4sZG9tYWluIi4NCj4gPj4+ICsgICAgICovDQo+ID4+DQo+ID4+IFRo
aXMgY29kZSBpcyBqdXN0IGNoZWNraW5nIHRoZSBub2RlIGNvbXBhdGlibGUgaXMgInhlbixkb21h
aW4iLiBTbyBJDQo+ID4+IHdvdWxkIGRyb3AgdGhlICJkb21VeCIuIFRoaXMgaXMgYWxzby4uLg0K
PiA+Pg0KPiA+Pj4gKyAgICBpZiAoIGZkdF9ub2RlX2NoZWNrX2NvbXBhdGlibGUoZmR0LCBub2Rl
LCAieGVuLGRvbWFpbiIpICE9IDAgKQ0KPiA+Pj4gKyAgICB7DQo+ID4+PiArICAgICAgICBwcmlu
dGsoInhlbixzdGF0aWMtbWVtIHByb3BlcnR5IGNhbiBvbmx5IGJlIGxvY2F0ZWQgdW5kZXINCj4g
Pj4+ICsgL2RvbVV4IG5vZGUuXG4iKTsNCj4gPj4NCj4gPj4gLi4uIG5vdCBjb3JyZWN0Lg0KPiA+
Pg0KPiA+DQo+ID4gSSBjaGVja2VkIGl0IGhlcmUsIHRvIG1ha2Ugc3VyZSB0aGUgInhlbixzdGF0
aWMtbWVtIiBwcm9wZXJ0eSBtdXN0IGJlDQo+ID4gdXNlZCBpbiBhIGRvbWFpbiBub2RlLCBzaW5j
ZSBmb3Igbm93LCBzdGF0aWMgbWVtb3J5IGNvdWxkIGJlIG9ubHkNCj4gY29uZmlndXJlZCBhcyBn
dWVzdCBSQU0uDQo+ID4NCj4gPiBXaGljaCBwYXJ0IGRvIHlvdSB0aGluayBpdCBpcyBub3QgYXBw
cm9wcmlhdGUgaGVyZT8NCj4gDQo+IFlvdSB3cm90ZSAiLi4uIGNhbiBvbmx5IGJlIGxvY2F0ZWQg
dW5kZXIgL2RvbVV4Ii4gVGhhdCdzIG5vdCBjb3JyZWN0IGJlY2F1c2UNCj4gd2UgZG9uJ3QgZm9y
Y2UgKG9yIGV2ZW4gbWVudGlvbiB0bykgdGhlIHVzZXIgdG8gbmFtZSB0aGUgbm9kZSB0aGF0IHdh
eS4NCj4gDQo+IA0KPiA+DQo+ID4+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPj4+ICsg
ICAgfQ0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBjZWxsID0gKGNvbnN0IF9fYmUzMiAqKXByb3AtPmRh
dGE7DQo+ID4+PiArICAgIGJhbmtzID0gZmR0MzJfdG9fY3B1KHByb3AtPmxlbikgLyAocmVnX2Nl
bGxzICogc2l6ZW9mICh1MzIpKTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgZm9yICggOyBpIDwgYmFu
a3MgJiYgbWVtLT5ucl9iYW5rcyA8IE5SX01FTV9CQU5LUzsgaSsrICkNCj4gPj4+ICsgICAgew0K
PiA+Pj4gKyAgICAgICAgZGV2aWNlX3RyZWVfZ2V0X3JlZygmY2VsbCwgYWRkcmVzc19jZWxscywg
c2l6ZV9jZWxscywgJnN0YXJ0LCAmc2l6ZSk7DQo+ID4+PiArICAgICAgICBtZW0tPmJhbmtbbWVt
LT5ucl9iYW5rc10uc3RhcnQgPSBzdGFydDsNCj4gPj4+ICsgICAgICAgIG1lbS0+YmFua1ttZW0t
Pm5yX2JhbmtzXS5zaXplID0gc2l6ZTsNCj4gPj4+ICsgICAgICAgIG1lbS0+bnJfYmFua3MrKzsN
Cj4gPj4+ICsgICAgfQ0KPiA+Pj4gKw0KPiA+Pj4gKyAgICBpZiAoIGkgPCBiYW5rcyApDQo+ID4+
PiArICAgICAgICByZXR1cm4gLUVOT1NQQzsNCj4gPj4+ICsgICAgcmV0dXJuIDA7DQo+ID4+PiAr
fQ0KPiA+Pj4gKw0KPiA+Pj4gICAgc3RhdGljIGludCBfX2luaXQgcHJvY2Vzc19yZXNlcnZlZF9t
ZW1vcnkoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwNCj4gPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsIGludCBkZXB0aCwN
Cj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBh
ZGRyZXNzX2NlbGxzLCB1MzINCj4gPj4+IHNpemVfY2VsbHMpIEBAIC0zNDYsNiArMzk1LDggQEAg
c3RhdGljIGludCBfX2luaXQNCj4gPj4+IGVhcmx5X3NjYW5fbm9kZShjb25zdA0KPiA+PiB2b2lk
ICpmZHQsDQo+ID4+PiAgICAgICAgICAgIHByb2Nlc3NfbXVsdGlib290X25vZGUoZmR0LCBub2Rl
LCBuYW1lLCBhZGRyZXNzX2NlbGxzLCBzaXplX2NlbGxzKTsNCj4gPj4+ICAgICAgICBlbHNlIGlm
ICggZGVwdGggPT0gMSAmJiBkZXZpY2VfdHJlZV9ub2RlX21hdGNoZXMoZmR0LCBub2RlLA0KPiAi
Y2hvc2VuIikgKQ0KPiA+Pj4gICAgICAgICAgICBwcm9jZXNzX2Nob3Nlbl9ub2RlKGZkdCwgbm9k
ZSwgbmFtZSwgYWRkcmVzc19jZWxscywNCj4gPj4+IHNpemVfY2VsbHMpOw0KPiA+Pj4gKyAgICBl
bHNlIGlmICggZGVwdGggPT0gMiAmJiBmZHRfZ2V0X3Byb3BlcnR5KGZkdCwgbm9kZSwNCj4gPj4+
ICsgInhlbixzdGF0aWMtbWVtIiwgTlVMTCkgKQ0KPiA+Pg0KPiA+PiBIb3cgYWJvdXQgY2hlY2tp
bmcgdGhlIGNvbXBhdGlibGUgaW5zdGVhZD8NCj4gPj4NCj4gPg0KPiA+IGhtbSwgc2luY2UgaXQg
aXMgYSBwcm9wZXJ0eSwgbm90IGEgbm9kZS4gc28uLi4NCj4gUmlnaHQsIGJ1dCB5b3UgY291bGQg
d3JpdGU6DQo+IA0KPiBkZXZpY2VfdHJlZV9ub2RlX2NvbXBhdGlibGUoZmR0LCBub2RlLCAieGVu
LGRvbWFpbiIpDQo+IA0KPiBUaGlzIHdvdWxkIGJlIG1vcmUgY29ycmVjdCBiZWNhdXNlIHdlIGFy
ZSBpbnRlcmVzdGVkIGluIG5vZGUgdXNpbmcgdGhlIFhlbg0KPiBkb21haW4gYmluZGluZyB0aGF0
IGNvbnRhaW5zIHRoZSBwcm9wZXJ0eSAieGVuLHN0YXRpYy1tZW0iLg0KPiANCj4gQWxsIHRoZSBv
dGhlciBub2RlcyB3aXRoIHRoZSBwcm9wZXJ0eSAieGVuLHN0YXRpYy1tZW0iIHNob3VsZCBiZSBs
ZWZ0IGFsb25lDQo+IGJlY2F1c2UgaXQgbWF5IGhhdmUgYSBkaWZmZXJlbnQgbWVhbmluZy4NCj4g
DQoNClRydWUsIHRydWUuIFdpbGwgZG8NCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4g
R3JhbGwNCg==

