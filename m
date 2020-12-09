Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE2E2D4921
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 19:37:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48643.86036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn4LQ-0003Yj-Vv; Wed, 09 Dec 2020 18:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48643.86036; Wed, 09 Dec 2020 18:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn4LQ-0003YI-Rg; Wed, 09 Dec 2020 18:37:44 +0000
Received: by outflank-mailman (input) for mailman id 48643;
 Wed, 09 Dec 2020 18:37:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ynM+=FN=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kn4LP-0003YD-Ds
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 18:37:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::605])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4db0852c-cd14-4aec-a625-9c928c52c284;
 Wed, 09 Dec 2020 18:37:40 +0000 (UTC)
Received: from DB6P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::21) by
 AM6PR08MB3270.eurprd08.prod.outlook.com (2603:10a6:209:50::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12; Wed, 9 Dec 2020 18:37:38 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::29) by DB6P191CA0011.outlook.office365.com
 (2603:10a6:6:28::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 18:37:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 18:37:38 +0000
Received: ("Tessian outbound 39646a0fd094:v71");
 Wed, 09 Dec 2020 18:37:38 +0000
Received: from c212a79a3008.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 978C5B05-98E4-4725-9ECA-A72C3EDAE846.1; 
 Wed, 09 Dec 2020 18:37:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c212a79a3008.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 18:37:10 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB5932.eurprd08.prod.outlook.com (2603:10a6:10:207::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Wed, 9 Dec
 2020 18:37:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125%5]) with mapi id 15.20.3654.013; Wed, 9 Dec 2020
 18:37:08 +0000
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
X-Inumbo-ID: 4db0852c-cd14-4aec-a625-9c928c52c284
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajGJisMwZEtO0TjadzZL+EJYvuJe7ZlzAnjlmFp6Mh8=;
 b=fURaqMvyISW8ZHIa+7IM+NNKFvix76ESfvQ5Y+CDp/8SIigjodV9Bzs2h5sYcUnBHjDGlGAOF0PKs5OkMb9VBssZumxZxhgTuFxZ29xq8OkUQ8W49urcUhMyULDuaCWi4KO8DYZkgKh6OqonM771ag59wOnNuYzMldLetPYwQx8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b60c993a5d4aa2cd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NywbdgJcJ7ncXVP+Dgj1ShrT9XmD6sh6NV1Tp61CMV5Uh8UQhHvPA3t3x/+y+Jg7RIryIWU0XLR/leptYQ+6nAI6+2/Xbna+s1y6rVPDBh4xLeqX7lM9BZ0XDxDV/3KKlyKifxMWM64jgC27Ioww9YTBt0isPxoCcKpVDsSeboPqsz/v9jcmdOUa0vRsSZ6bT4kLy7Y8GkInpf8QyHkvgKi4kgEvxu/9rKvhFquK21suKhAbi0rymztcZwgWev2O1AtzllbGkeRQdP9ESY6zsM2SX8KRfUMiAXDcPyRg+Lcd8LZ4a34IRM5Am3FD5prhgHhktta+mdoBy/87xc82EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajGJisMwZEtO0TjadzZL+EJYvuJe7ZlzAnjlmFp6Mh8=;
 b=OHq+zC2+tUFfQharKyIx5hbYiLLC4Uo1zffx2wTA9JWkcQANZYS/6mwnwI8i2kDJINpYyLiwC/nbaWyp4CgUdUU/bob3cE/V3g8+5wRgAluDQ17lH7oDsee8ibUMgFxmY1Rhp6QIjByJoBjfsfJMNp8KRVbAOdGDeqI5DqUE0e4cfcUe2G58BOF7eJs9CYegCJIWlH/TmCN7+tLGAAQtMblShV0sqVtwG2XPsoSum7JgcuFrI+KL86RjQH9omqldNFDHBEu5tMKRquL63MSknnPDH7ymYFtFhQZCX35HpoelqIrdLMZejgmAKBY+tiRS4zLXroQe9y6CorjORwLoVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajGJisMwZEtO0TjadzZL+EJYvuJe7ZlzAnjlmFp6Mh8=;
 b=fURaqMvyISW8ZHIa+7IM+NNKFvix76ESfvQ5Y+CDp/8SIigjodV9Bzs2h5sYcUnBHjDGlGAOF0PKs5OkMb9VBssZumxZxhgTuFxZ29xq8OkUQ8W49urcUhMyULDuaCWi4KO8DYZkgKh6OqonM771ag59wOnNuYzMldLetPYwQx8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
Thread-Topic: [PATCH v2 8/8] xen/arm: Add support for SMMUv3 driver
Thread-Index:
 AQHWxBX/ttp8YMNqT0KunkbXuSldmKnkBpwAgAeVnoCAAFuAgIAAEZOAgAGYzQCAAGhiAIAAbqQAgAAXOgCAAJwRgA==
Date: Wed, 9 Dec 2020 18:37:08 +0000
Message-ID: <FEBC2AAF-C15B-4CEC-9FCC-FEA94714421D@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <de2101687020d18172a2b153f8977a5116d0cd66.1606406359.git.rahul.singh@arm.com>
 <a67bb114-a4a9-651a-338b-123b350ac4b3@xen.org>
 <9C890E87-D438-4232-8647-8EC64FF32C42@arm.com>
 <bb6a710e-4a7a-5db2-fece-b5845e06d092@xen.org>
 <9F9A955B-815C-4771-9EC0-073E9CF3E995@arm.com>
 <156ab0f5-e46d-6b96-7ff1-28ad3a748950@xen.org>
 <alpine.DEB.2.21.2012081711200.20986@sstabellini-ThinkPad-T480s>
 <BE0F99C1-AAA7-4EC7-A800-7CDEA24177DF@arm.com>
 <47bf1e5d-9e9e-d455-f6d8-5ddec0367ef2@xen.org>
In-Reply-To: <47bf1e5d-9e9e-d455-f6d8-5ddec0367ef2@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3af195a1-94c4-494a-bd31-08d89c718117
x-ms-traffictypediagnostic: DBBPR08MB5932:|AM6PR08MB3270:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3270433F1BDE71DB2E7A3950FCCC0@AM6PR08MB3270.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iSeF+GI6aEwKVbBCRgHDzaeascSKNjxrf4cqVn9id/8S1ipVyAkWYP7GG/GsaHwApXvF3sbrEySkWxU1EcGz1wDpBjOVaqh1AgJkFzXyJWrgEirYNbcBlpIVXw7cI4xTAdYj63VaHLMWuuS0fhoYx5Q7q/OPlofAW7sgsioPot/7TlfriKVAxZLRjyqAcbmL6UAshZNkq8oO64gdFoG/QW7rca6uumOe17xEE+k3Gf0pmkrQdocTIhgc+SAr7hW6TKz1piEbl1BNC/i9Z0LF5o3C+Mi5ZcqXS9qj6ifSFVEcyWvAJONRRwH56FzHLJlcmVEGN4Gl9URSi8gcNM8rm8BD4TmDBQsM4l/KERWJuKWvX+ju3f03Z0DD++c/DTR6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(26005)(2906002)(6512007)(66476007)(66946007)(8936002)(91956017)(8676002)(6486002)(33656002)(64756008)(71200400001)(66556008)(316002)(6916009)(6506007)(86362001)(5660300002)(66446008)(478600001)(186003)(83380400001)(36756003)(76116006)(4326008)(7416002)(53546011)(54906003)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?amJCc3EvVjdpMGhzUVQ5em5FQXFBSmNTOS9sbnlRdGVoZ3ZFblpyR05qMi83?=
 =?utf-8?B?NG80NFNiZlA3NU9xL3FRQkladEJ4ajlJa0drYU92R1VDOVJSUmtOMldBS3E2?=
 =?utf-8?B?UFdBMnFHZU95SUFLYWFUc1MreFA3T09IOUVFUXBaNERFRi8xdWtrNlNFSndo?=
 =?utf-8?B?TGNYVU5FZlp6djUyenlYc1BvZzc2KzM3T0ZUcEk3ZTZmOWk3dEtpYVJRM05m?=
 =?utf-8?B?MGV2MnVtMUpJZ2JSUTBHTWt6NTBpbER5OGZmcmRiYkN3dlM4TDNYY2VTN09a?=
 =?utf-8?B?V2JNUWRVdFFabU5EWVlMaFNBNkhoYkRJVzkwWnJJeEF3dkk4NWRvS29KcnE2?=
 =?utf-8?B?bmxVVEZRckxWYlVJUEZpVHhuSG9QUWtUOG8xYjk1a2phcyt0QXpIanZSb0t6?=
 =?utf-8?B?T1JDQkZMcWxPbFJKK2FCVE9IdUNjaU5NcFlBa1FSUjdyeTVnTmlKMzYyeDRU?=
 =?utf-8?B?NzdNV3IzUE84bktCL3pvWlFWUFBTNENpemRydjRxTEIzcmNtTnFzWjc2d1pG?=
 =?utf-8?B?U0RSKytqYnI5QTlaZlFtRlU2cmh6d0gwVFdicVZrcFhnOTRVTzJwUkN5THc3?=
 =?utf-8?B?eGk4UHJJZUVpWHFyc1ZVWlZiSllsUkU1V1RQc2V0a1FLOXZ0OGsxbE8weG5V?=
 =?utf-8?B?YktVS0VHOXp2dVlZZjlLaXVsWjliZXptY1JLT29hdkM1dkdXS250SGNSa2Z4?=
 =?utf-8?B?Q3BqSUtkQjZqTmdCYlp5YkRhdVJaNllDUTZMbENyemt1SEZFdTR6M29SenZO?=
 =?utf-8?B?L3BVbm9JTmt0ZHI3SXEyT3JHbytLQ0RNT2J3VHZhcVBxOUtVcWs1UlcxWmR3?=
 =?utf-8?B?MXFpQi81Q1VyQ2RxTDZ3S1dVbUVVVmkyN2k2UnRESS9sVWJMejFqcUt2K0Ni?=
 =?utf-8?B?aVZoUG9xVmE0MUIvbmNhLzczODZIUkNNbjNTQytaVU5hUjRTTkRQM3NBYzY1?=
 =?utf-8?B?bE90WGZQWmtKZ2ppU2hpWTdQTXlTQklLTW9FZlUvQyt2L2E0WTJvZ3FSTmFC?=
 =?utf-8?B?S1cyc3pxNGgzNk9KRDhJZ2YzUVNZeTBCL2RWTmptVkZaSkcwZ0grekJMSVFw?=
 =?utf-8?B?cnNXbTZ4eW1xRHc1Vk1DSGZEZysyUlQraWRZeEhZaklpbzlYcUJHT3FnR3JE?=
 =?utf-8?B?QzRPejhUdEs0U0R3cVBxVTdzMHhpUlhvc0dDbkNiVEhuZmwyQXNQZHRUZWx4?=
 =?utf-8?B?NmtaVHNKRTF0L3cvc3c5anpISEJ3eHk5ekIvMjEwK2FsWFE0eWRDVDZHV2Vw?=
 =?utf-8?B?TVBNejcrb09RT2VFYVlDRU1XaWdwcGp1YjVuL0ttenJEa01TNnJic29sSUE3?=
 =?utf-8?Q?j20d3dq1a2MTj+kFhF1mFvQF8kzvqPuDte?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <08CE1E9A660C024B966B0AF893954D52@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5932
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4531b9dd-8c67-45aa-958b-08d89c716f28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a3UOaIlPO5PoLpUmFsUDuSAFEPtK7bWXjEWetQ2Cq1kDK3MZYbkCXBNF1l8+/IDSCAT7skOac64DXreJ7OdsH+l6ejjs7s2tSApy8N9n9QogECLV9qDv2quXB1Ro8fAjDcJ/T4jiVwFDSkCx37Tb5nV4HMIwxOPg6JPURoLRK1a6Pcr4s6oLouab0gUlwqYYKbI9c8ZdxP8Lh8tbE6RwT305uO99Ewit1VE+78mcYwIBYhpKB9RsR/2gIBErrsj1RkcBd4aD6frcpEWxNFnCDvcgIuXmES2ucb7leyRCvNkkeXuLv7/MlIoXms0TurxFzrytvNn1HK9j7YuwNoskXIETCg2Yfq6lbNMJznwXJbVcfmETp9Du34izEueum5xfMnd2JTqJBes/LVmenuIpuQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(46966005)(336012)(4326008)(86362001)(53546011)(6862004)(508600001)(70586007)(70206006)(6506007)(6486002)(107886003)(186003)(2616005)(83380400001)(81166007)(26005)(54906003)(356005)(36756003)(33656002)(47076004)(5660300002)(82310400003)(6512007)(2906002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 18:37:38.3914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af195a1-94c4-494a-bd31-08d89c718117
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3270

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDkgRGVjIDIwMjAsIGF0IDk6MTggYW0sIEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwOS8xMi8yMDIwIDA3
OjU1LCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGksDQo+IA0KPiBIaSwNCj4gDQo+PiBJ
IGFsc28gYWdyZWUgd2l0aCB0aGUgaXNzdWUgb24gdGhlIHNwaW5sb2NrIGJ1dCB3ZSBoYXZlIG5v
IGVxdWl2YWxlbnQgb2Ygc29tZXRoaW5nDQo+PiBsb29raW5nIGxpa2UgYSBtdXRleCBmb3Igbm93
IGluIFhlbiBzbyB0aGlzIHdvdWxkIHJlcXVpcmUgc29tZSBtYWpvciByZWRlc2lnbiBhbmQNCj4+
IHdpbGwgdGFrZSB1cyBmYXIgZnJvbSB0aGUgbGludXggZHJpdmVyLg0KPiANCj4gSSBhZ3JlZSB0
aGF0IGtlZXBpbmcgdGhlIFhlbiBpbXBsZW1lbnRhdGlvbiBjbG9zZSB0byB0aGUgTGludXggb25l
IGlzIGltcG9ydGFudC4gSG93ZXZlciwgSSB2aWV3IHRoaXMgaGFzIGEgdGhlIHNlY29uZGFyeSBn
b2FsLiBUaGUgcHJpbWFyeSBnb2FsIGlzIHRvIGhhdmUgYSBzYWZlIGFuZCBzZWN1cmUgZHJpdmVy
Lg0KPiANCj4gSWYgaXQgbWVhbnMgaW50cm9kdWNpbmcgYSBuZXcgc2V0IG9mIGxvY2sgb3IgZGl2
ZXJnaW5nIGZyb20gTGludXgsIHRoZW4gc28gaXQgYmUuDQo+PiBJIHdvdWxkIHN1Z2dlc3QgdG8g
YWRkIGEgY29tbWVudCBiZWZvcmUgdGhpcyBwYXJ0IG9mIHRoZSBjb2RlIHdpdGggYSDigJxUT0RP
4oCdIHNvIHRoYXQNCj4+IGl0IGlzIGNsZWFyIGluc2lkZSB0aGUgY29kZS4NCj4+IFdlIGNvdWxk
IGFsc28gYWRkIHNvbWUgY29tbWVudCBpbiBLY29uZmlnIHRvIG1lbnRpb24gdGhpcyBwb3NzaWJs
ZSDigJxmYXVsdHnigJ0gYmVoYXZpb3VyLg0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBlbm91
Z2ggdG8gd3JpdGUgaW4gdGhlIEtjb25maWcgdGhhdCB0aGUgZHJpdmVyIGlzICJleHBlcmltZW50
YWwgYW5kIHNob3VsZCBub3QgYmUgdXNlZCBpbiBwcm9kdWN0aW9u4oCdLg0KDQpPayAuIEkgd2ls
bCBhZGQgaW4gS2NvbmZpZy4NCj4gDQo+IElkZWFsbHksIEkgd291bGQgbGlrZSBhIGxpc3Qgb2Yg
a25vd24gaXNzdWVzIGZvciB0aGUgZHJpdmVyIChjb3VsZCBiZSBpbiB0aGUgY292ZXIgbGV0dGVy
IG9yL2FuZCBhdCB0aGUgdG9wIG9mIHRoZSBzb3VyY2UgZmlsZSkgc28gd2UgY2FuIHRyYWNrIHdo
YXQncyBtaXNzaW5nIHRvIGdldCBpdCBzdXBwb3J0ZWQuDQoNCkkgd2lsbCBsaXN0IGFsbCBrbm93
biBpc3N1ZXMgYW5kIHNob3J0IGNvbWluZyBvZiB0aGUgZHJpdmVyIGF0IHRoZSB0b3Agb2YgdGhl
IHNvdXJjZSBmaWxlLg0KDQpSZWdhcmRzLA0KUmFodWwNCj4gDQo+IENoZWVycywNCj4gDQo+IC0t
IA0KPiBKdWxpZW4gR3JhbGwNCg0K

