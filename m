Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1834D2F7874
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 13:15:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68028.121675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Nzt-0002lf-DN; Fri, 15 Jan 2021 12:14:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68028.121675; Fri, 15 Jan 2021 12:14:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Nzt-0002lG-AH; Fri, 15 Jan 2021 12:14:33 +0000
Received: by outflank-mailman (input) for mailman id 68028;
 Fri, 15 Jan 2021 12:14:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sc3p=GS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l0Nzr-0002lB-Ud
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 12:14:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id facf29c9-6a05-48d6-923b-50e303ed7963;
 Fri, 15 Jan 2021 12:14:29 +0000 (UTC)
Received: from DB6PR0802CA0028.eurprd08.prod.outlook.com (2603:10a6:4:a3::14)
 by DB7PR08MB3084.eurprd08.prod.outlook.com (2603:10a6:5:22::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Fri, 15 Jan
 2021 12:14:24 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::5f) by DB6PR0802CA0028.outlook.office365.com
 (2603:10a6:4:a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Fri, 15 Jan 2021 12:14:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 15 Jan 2021 12:14:24 +0000
Received: ("Tessian outbound 2b57fdd78668:v71");
 Fri, 15 Jan 2021 12:14:24 +0000
Received: from 2a58a3c8674a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E85143F1-DD5A-45F5-A11A-7214F9062F0D.1; 
 Fri, 15 Jan 2021 12:14:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2a58a3c8674a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Jan 2021 12:14:19 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBAPR08MB5814.eurprd08.prod.outlook.com (2603:10a6:10:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Fri, 15 Jan
 2021 12:14:18 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3742.013; Fri, 15 Jan 2021
 12:14:17 +0000
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
X-Inumbo-ID: facf29c9-6a05-48d6-923b-50e303ed7963
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLLvG005XmfcSyFhb1Tq+qVKrm0fXQ65rYQRcjoLWcE=;
 b=oDcO9spD5LeZ7fv6+aTPF74rIV1mbcIZ/6LJLMPkhenFSyaxH+CaRx6KkriUx+X3ZHaTlEniPv8mmRCQ8HaVukFNXI167RoE/lf+HBucBckBAQyYUmru6lS1iuOlW+kgHJbLUbR5/rnGVsuTqcXRZxoNBYoRfncIGz3E1i5jB30=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9de7722ee42b6e48
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtWPhPsDFMMOrp8Tsba4+8++Pr/XobWMq59SOAKK2ANypgaDtznU2YS4gTW0+d1nPG2sHYlUhOxTMH/MwsJsXZzSSL0F3ysntZCK8Ptmsel4oQSk9QdGEulYYjrvaQ/j4RmFtS7C1c4RQ9Gt3KI0efrj6BJr/0KQ5yRvo2NYy8JuYUmBmJ9TQ4VVTeMjdn6K4U3dfSfGGfHpqzxjIzjGdcRUNrj/0Aeq8BIR/OzMzsakiHwIiX+Y8/sldvGfQ/UPE0bte2D5ATPTNtHDaasMZ5DSbq+wcAfmmSpRr05Z4nV3DoLY46btu8VvfC4k9m9qIR20tCGm7UADizbPp0C7lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLLvG005XmfcSyFhb1Tq+qVKrm0fXQ65rYQRcjoLWcE=;
 b=OH7xSaj+CjyyDaG6uVv82JW/jX1CuukF/tpH9SoJhPEDHP6y7pRpMqv0gkixY2XZcaQBzzXVdnWdbDmRaY2ELCW1WWCnxsPnNllKIPNOJYQri9q+P5Y+yzX9b86GBWPtnI+EsiJARq6PrySfNb9L/cB2BOFARv5wUQLZ+qxfZxnoDdkcATwU48+ds8dsCH+iAEj4nAUL51Q6+2wJKXsy4clL+GbKFNS4H8Gpuyerpi2uiQ8X23YRL9NGYwcosAPBn7MGOaan7p9ibBvKoxw4UfegAoI+8eX1+bkJLqUR/8xuuvINinUYr9LL0PwV73blQLAKIrQ3uJmYSzPIYlDGCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLLvG005XmfcSyFhb1Tq+qVKrm0fXQ65rYQRcjoLWcE=;
 b=oDcO9spD5LeZ7fv6+aTPF74rIV1mbcIZ/6LJLMPkhenFSyaxH+CaRx6KkriUx+X3ZHaTlEniPv8mmRCQ8HaVukFNXI167RoE/lf+HBucBckBAQyYUmru6lS1iuOlW+kgHJbLUbR5/rnGVsuTqcXRZxoNBYoRfncIGz3E1i5jB30=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
Thread-Topic: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
Thread-Index: AQHW5c272wDpW7M2fUCol5kPEXm0sqoj5EGAgADGGoCAAjJ8AIAA9tOAgADQnoA=
Date: Fri, 15 Jan 2021 12:14:17 +0000
Message-ID: <EA49F7DE-22AF-4F95-9158-0EE42519FE7A@arm.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com>
 <9dd27a7d-a77a-14ff-c62c-c813b21fb34e@suse.com>
 <alpine.DEB.2.21.2101121521500.2495@sstabellini-ThinkPad-T480s>
 <ce896f84-917b-14e8-40e4-46b5ce3cb2f6@suse.com>
 <alpine.DEB.2.21.2101141546350.31265@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101141546350.31265@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e7cd2dd-bff5-4aae-8ac2-08d8b94f1903
x-ms-traffictypediagnostic: DBAPR08MB5814:|DB7PR08MB3084:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB308490DB1B10EA7CB713C0F2FCA70@DB7PR08MB3084.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DkjiULSLmUUDWEsy4bBlaDcDw9ZhvnIDVjpgBmbxIWynPrhvJ6DLrp8CsIDuLDx0qA6HDiIH1lmRO8pLh4hCC18HBYIwnNc1m3sdKbkNnSzU8js1gJJrIXxAM4FYZZd4BzI0O8Jfhnm038HQ7FbuZou0DTwLQHGt/QQ1kLJonhTNwa6FU5CsSIDvDPp9e2NdrpN7VyO9XR/uGM1k9tJnVKP+E9dNcGhPbGTA6pazg5aRmO6/YkXGzP8mJCGxxV06RcBEi5wJgHUVj2/OQAYpUGWkrhadVJoPtSGprF7f3/Y5dF3v14dGdd08VpWEndTf6sDIBGH8B2vx0KFpG3NmvyE4B+/Lb+jmVkMaq6+a7ct7uci58K6/wkqAkmQpKXMQBrUVdDcKO6uk/1QmdRIXagRFnicjDwFzv2kd9zKURDCfZzNjaaJuz0uPhISCPameNEFS8ph3hos7/gqTfHbvyy24LCrokk2UflhLyKxFDw5qb2obVLcUo06YsZt3UiomrodVzkwTneviqy4dBtlsTi/lbkVJKxorXqBCWhM4t2tlFtUr+xkXQcO+QXCcvHq7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(4326008)(66556008)(26005)(53546011)(64756008)(6486002)(6506007)(83380400001)(86362001)(6916009)(54906003)(2616005)(966005)(36756003)(76116006)(186003)(2906002)(71200400001)(478600001)(8936002)(66446008)(8676002)(6512007)(91956017)(66946007)(66476007)(316002)(33656002)(5660300002)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?ZDVncTRRcFliT0FFYytURC9EYTRjMGxpN3BZTi82R0wyMUh3OFRWNml6M2s0?=
 =?utf-8?B?YWl2ejhjNlhnM2tEVWxBN3FRcDlTUXZCT0ZTUUwxVFNsbndDVG4rMWcySUdq?=
 =?utf-8?B?QXBUWEpBY2p3UUxDTDdvQkRjZnJpa0pMZG4wT081NWtLV1JRaWRTWllOZy9N?=
 =?utf-8?B?U2RHTnYwVUtWUEhsaU9mMDl2Qkk0Z2dGS3pUdmM5TjBQdW05NmlNemNyc01m?=
 =?utf-8?B?OHdIWkdDbHM0S05OSTQxbWhMY1JqR2RxSlRHVHFDK1ZJQUtlMUsrdzR4d3BR?=
 =?utf-8?B?MVYvOGdCMkl4Umpad2dsVUtsVnhmNDIrRlVLdUxpYkxnRXZLV2lmMDdneHda?=
 =?utf-8?B?TzNmZDQrSndNZjloK21VQnFOK3ptckhxeUNIcFFEa3dDdnBRWjU4Z3BGcmRM?=
 =?utf-8?B?Y01jOWdvMGV3UlUrK0lBMHNKVVMzM21RYUpkdlVtalltUTJFY2dsL24yakph?=
 =?utf-8?B?TTl6QVU5eWtoNDRMdzBYREhlYmJkR3ZmSHI5R1dtWHhZeFVsUzRNR0JSYjkv?=
 =?utf-8?B?MXBtNHYvUjliRk0rUlJaRzN5K0NhZVJtaXc4L2twd3Ayenk0QlpkWXhWUnhW?=
 =?utf-8?B?aDJ1N0loVmVHbExscDBoak1NanIzbitTS3lhNk1MQ3ZPK0Y0S0MzYnJRZmJm?=
 =?utf-8?B?TDlUM2FMVUhtaUF4aXcveXhRV1RpeVhLVEs4cVEzQVhIOFhEOXZWelVhWkln?=
 =?utf-8?B?KzMzZEVEUnEzc1dUSHFqTXBkSU5HamdsOVQveHlSemhIZ2ZTVFovWkw2TXdr?=
 =?utf-8?B?RDRGcHhpSFMwR1o0T1NiTjBuS3BwdHE2OW03bzRjT2V0N0dqVjVpQWdhRHg1?=
 =?utf-8?B?ODZUNTR4ZG0zQXloWVNBdjhnaStFOVpka3F4aS9IL0R3cDdIaHhPcFJ2em1K?=
 =?utf-8?B?VDNqRlBqMmM1NHM4NXRGUVJERzFWRzdRbGdXRTJHM1RBOGRCMnVoSnV5d2Jw?=
 =?utf-8?B?dVZzTXE0MXRYQzh0VGZTR3ZUd2JvL0NLVlZTU1crajJtOE84WkhwQ3NhaGc5?=
 =?utf-8?B?QTMrbjdvM0Q0NWdBREVMOUFnNEZCRWVQQk5YWWdzeGRqRHNYTVE4aGlkUTBF?=
 =?utf-8?B?bjZLUlViRjJaSnNXOUt0UkorTkIwdGdSUFJTMUpWZlRuWGlZZi9KOS9TN01R?=
 =?utf-8?B?dEp5YWJZSTNEdytDTmIvMnVndm1YYnllcENJWmRHWG1NYzZBRjd6N29tUitz?=
 =?utf-8?B?dXBkKzNmR1lJbHNId3R0aWZsUFhCY1hFZnA3VlQ2dm1HWSsrZ0dXZUJSeklQ?=
 =?utf-8?B?aHJXKzkyYlI2OVloZThTRVJOclhBS1dJUnNXVU9nS0tRSy9aODZUa2UrYlVa?=
 =?utf-8?Q?hevm4+P3UtZesI55+cGQA+CPq8dKhBUaVu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <917C057F3F84C541BDC7AD932E8CA294@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5814
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	34ffcfec-ca72-476b-8c19-08d8b94f14f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mOYBl7tPuRRGiB5yVhmD+6t9ZMgjfhS3iunzX86zGY+9XtCX2+T9+RntjBq1NzYoq7iXUMW73si+DI0LVA0eTWZY5vUu1kkD5LrzXs+rEGyIsxN8/EV3zGzpWerQQHO53qXazNui9K2eV8t+1M2415B9EEJFVVMPM50kZXE/gYv5+It3dpkZ6JhpDbWzNLrn4JJU+trWbdnNK9YKKPkPgL+HLnL7O8VkvMQiJt5BlpYjw8aveo2C3awHd0QeOAONRiO31kZ+YFEZEiqWbapeTkfl1jaIjzOTb+1R64hIZwssnHkXHL+Un8iazQ0d9fSYfwbD+M0UtKbmfqP1uvbA0x3Q7ZbdLmAyVcAHGkH8gDne7bSnQUf4onf9kOR2vnN0YWygS+8Q38aYR+4AL0btqs93WP3Mxi/rqGaUFgpO1mld6Z3ypW+k75KbKc7g57cC+xEsBagJASKai+LfDbDJPP1X17XuX4a5PPw/0sZr1dXmPpcNQJ+Gy+v0pHfPvenNp6nZph2Rcmh6wZ/cXnbYhzfmSbixoBUdcaFZ4hQu/t/wqYQuvJFhO3djMlr/jSJHftMF74F82m/tq98nu8zMyyQdGhfjQ+ZVJ2G2h8ACMmM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(46966006)(36756003)(8936002)(2616005)(6512007)(6486002)(316002)(47076005)(6506007)(2906002)(356005)(81166007)(82310400003)(33656002)(26005)(70586007)(186003)(82740400003)(966005)(478600001)(86362001)(336012)(4326008)(53546011)(5660300002)(70206006)(8676002)(34020700004)(83380400001)(6862004)(54906003)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 12:14:24.6072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7cd2dd-bff5-4aae-8ac2-08d8b94f1903
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3084

SGVsbG8sDQoNCj4gT24gMTQgSmFuIDIwMjEsIGF0IDExOjQ3IHBtLCBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVGh1LCAxNCBKYW4g
MjAyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAxMy4wMS4yMDIxIDAwOjMwLCBTdGVmYW5v
IFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4gT24gVHVlLCAxMiBKYW4gMjAyMSwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+Pj4+IE9uIDA4LjAxLjIwMjEgMTU6NDYsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+
Pj4gLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCB3YXJucyB3aGVuIGEgc3dpdGNoIGNhc2UgZmFsbHMg
dGhyb3VnaC4gV2FybmluZw0KPj4+Pj4gY2FuIGJlIHN1cHByZXNzIGJ5IGVpdGhlciBhZGRpbmcg
YSAvKiBmYWxsdGhyb3VnaCAqLyBjb21tZW50LCBvciBieQ0KPj4+Pj4gdXNpbmcgYSBudWxsIHN0
YXRlbWVudDogX19hdHRyaWJ1dGVfXyAoKGZhbGx0aHJvdWdoKSkNCj4+Pj4gDQo+Pj4+IFdoeSBp
cyB0aGUgY29tbWVudCB2YXJpYW50ICh3aGljaCB3ZSB1c2UgaW4gbWFueSBwbGFjZXMgYWxyZWFk
eSwNCj4+Pj4gYWxiZWl0IHdpdGggdmFyeWluZyB3b3JkaW5nKSBub3QgdGhlIHJvdXRlIG9mIGNo
b2ljZT8NCj4+PiANCj4+PiBTZWUgcHJldmlvdXMgZGlzY3Vzc2lvbjoNCj4+PiANCj4+PiBodHRw
czovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNjA3MDcyNzQ1MTcyNzANCj4+PiBodHRwczov
L21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNjA3MzM3NDI4MTA2MDUNCj4+PiBodHRwczovL21h
cmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNjA3MzM4NTIwMTEwMjMNCj4+PiANCj4+PiBXZSB0aG91
Z2h0IGl0IHdvdWxkIGJlIGJlc3QgdG8gaW50cm9kdWNlICJmYWxsdGhyb3VnaCIgYW5kIG9ubHkg
cmVzb3J0DQo+Pj4gdG8gY29tbWVudHMgYXMgYSBwbGFuIEIuIFRoZSB1c2FnZSBvZiB0aGUga2V5
d29yZCBzaG91bGQgYWxsb3cgR0NDIHRvIGRvDQo+Pj4gYmV0dGVyIGNoZWNrcy4NCj4+IA0KPj4g
SG1tLCB0aGlzIGVhcmxpZXIgZGlzY3Vzc2lvbiB3YXMgb24gYW4gQXJtLXNwZWNpZmljIHRocmVh
ZCwgYW5kIEkNCj4+IGhhdmUgdG8gYWRtaXQgSSBjYW4ndCBzZWUgYXJndW1lbnRzIHRoZXJlIHBy
byBhbmQvb3IgY29uIGVpdGhlcg0KPj4gb2YgdGhlIHR3byBhbHRlcm5hdGl2ZXMuDQo+PiANCj4+
Pj4+IERlZmluZSB0aGUgcHNldWRvIGtleXdvcmQgJ2ZhbGx0aHJvdWdoJyBmb3IgdGhlIGFiaWxp
dHkgdG8gY29udmVydCB0aGUNCj4+Pj4+IHZhcmlvdXMgY2FzZSBibG9jayAvKiBmYWxsdGhyb3Vn
aCAqLyBzdHlsZSBjb21tZW50cyB0byBudWxsIHN0YXRlbWVudA0KPj4+Pj4gIl9fYXR0cmlidXRl
X18oKF9fZmFsbHRocm91Z2hfXykpIg0KPj4+Pj4gDQo+Pj4+PiBJbiBDIG1vZGUsIEdDQyBzdXBw
b3J0cyB0aGUgX19mYWxsdGhyb3VnaF9fIGF0dHJpYnV0ZSBzaW5jZSA3LjEsDQo+Pj4+PiB0aGUg
c2FtZSB0aW1lIHRoZSB3YXJuaW5nIGFuZCB0aGUgY29tbWVudCBwYXJzaW5nIHdlcmUgaW50cm9k
dWNlZC4NCj4+Pj4+IA0KPj4+Pj4gZmFsbHRocm91Z2ggZGV2b2x2ZXMgdG8gYW4gZW1wdHkgImRv
IHt9IHdoaWxlICgwKSIgaWYgdGhlIGNvbXBpbGVyDQo+Pj4+PiB2ZXJzaW9uIChhbnkgdmVyc2lv
biBsZXNzIHRoYW4gZ2NjIDcpIGRvZXMgbm90IHN1cHBvcnQgdGhlIGF0dHJpYnV0ZS4NCj4+Pj4g
DQo+Pj4+IFdoYXQgYWJvdXQgQ292ZXJpdHk/IEl0IHdvdWxkIGJlIG5pY2UgaWYgd2Ugd291bGRu
J3QgbmVlZCB0byBhZGQNCj4+Pj4gdHdvIHNlcGFyYXRlIGNvbnN0cnVjdHMgZXZlcnl3aGVyZSB0
byBtYWtlIGJvdGggY29tcGlsZXIgYW5kIHN0YXRpYw0KPj4+PiBjb2RlIGNoZWNrZXIgaGFwcHku
DQo+Pj4gDQo+Pj4gSSBkb24ndCB0aGluayBJIGZ1bGx5IHVuZGVyc3RhbmQgeW91ciByZXBseSBo
ZXJlOiBDb3Zlcml0eSBkb2Vzbid0IGNvbWUNCj4+PiBpbnRvIHRoZSBwaWN0dXJlLiBHaXZlbiB0
aGF0IEdDQyBwcm92aWRlcyBhIHNwZWNpYWwga2V5d29yZCB0byBpbXBsZW1lbnQNCj4+PiBmYWxs
dGhyb3VnaCwgaXQgbWFrZXMgc2Vuc2UgdG8gdXNlIGl0IHdoZW4gYXZhaWxhYmxlLiBXaGVuIGl0
IGlzIG5vdA0KPj4+IGF2YWlsYWJsZSAoZS5nLiBjbGFuZyBvciBvbGRlciBHQ0MpIHdlIG5lZWQg
dG8gaGF2ZSBhbiBhbHRlcm5hdGl2ZSB0bw0KPj4+IHN1cHByZXNzIHRoZSBjb21waWxlciB3YXJu
aW5ncy4gSGVuY2UgdGhlIG5lZWQgZm9yIHRoaXMgY2hlY2s6DQo+Pj4gDQo+Pj4gICNpZiAoIWRl
ZmluZWQoX19jbGFuZ19fKSAmJiAoX19HTlVDX18gPj0gNykpDQo+PiANCj4+IEknbSBub3Qgc3Vy
ZSBob3cgdGhpcyBpbnRlcmFjdHMgd2l0aCBDb3Zlcml0eS4gTXkgcG9pbnQgYnJpbmdpbmcgdXAN
Cj4+IHRoYXQgb25lIGlzIHRoYXQgd2hhdGV2ZXIgZ2V0cyBkb25lIGhlcmUgc2hvdWxkIF9hbHNv
XyByZXN1bHQgaW4NCj4+IENvdmVyaXR5IHJlY29nbml6aW5nIHRoZSBmYWxsLXRocm91Z2ggYXMg
aW50ZW50aW9uYWwsIG9yIGVsc2Ugd2UnbGwNCj4+IGVuZCB1cCB3aXRoIG1hbnkgdW53YW50ZWQg
cmVwb3J0cyBvZiBuZXcgaXNzdWVzIG9uY2UgdGhlIHBzZXVkby0NCj4+IGtleXdvcmQgZ2V0cyBt
YWRlIHVzZSBvZi4gVGhlIGNvbW1lbnQgbW9kZWwgaXMgd2hhdCB3ZSBjdXJyZW50bHkNCj4+IHVz
ZSB0byAic2lsZW5jZSIgQ292ZXJpdHk7IEknZCBsaWtlIGl0IHRvIGJlIGNsZWFyIHVwIGZyb250
IHRoYXQNCj4+IGFueSBuZXcgYWx0ZXJuYXRpdmUgdG8gYmUgdXNlZCBpcyBhbHNvIGdvaW5nIHRv
ICJzYXRpc2Z5IiBpdC4NCj4gDQo+IFRoYXQgaXMgYSBnb29kIHBvaW50LCBhbmQgSSBhZ3JlZSB3
aXRoIHRoYXQuIFJhaHVsLCBkbyB5b3UgaGF2ZSBhY2Nlc3MNCj4gdG8gYSBDb3Zlcml0eSBpbnN0
YW5jZSB0byBydW4gYSB0ZXN0PyANCg0KTm8gSSBkb27igJl0IGhhdmUgYWNjZXNzIHRvIENvdmVy
aXR5IHRvIHJ1biBhIHRlc3QuV2hhdCBJIGZvdW5kIG91dCB0aGF0IGZyb20gdGhlIExpbnV4IGtl
cm5lbCBtYWlsaW5nIGxpc3QgQ292ZXJpdHkgdW5kZXJzdGFuZCB0aGUgIl9fYXR0cmlidXRlX18o
KF9fZmFsbHRocm91Z2hfXykp4oCdIGtleXdvcmQuDQpJZiBzb21lb25lIGVsc2UgY2FuIHJ1biBh
IENvdmVyaXR5IHRlc3QgdGhhbiBpdCB3aWxsIGJlIHZlcnkgaGVscGZ1bC4NCg0KWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxODEwMjExODI5MjYuR0I2NjgzQGtyb2FoLmNvbS8N
ClsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTEwODU3Ny8NCg0K
UmVnYXJkcywNClJhaHVs

