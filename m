Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DACE364030
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 13:03:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112804.215105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYRfk-0005V7-MK; Mon, 19 Apr 2021 11:02:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112804.215105; Mon, 19 Apr 2021 11:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYRfk-0005Uk-II; Mon, 19 Apr 2021 11:02:32 +0000
Received: by outflank-mailman (input) for mailman id 112804;
 Mon, 19 Apr 2021 11:02:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jNU4=JQ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lYRfj-0005Uc-Je
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 11:02:31 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c9d7597-7daa-47c7-a517-de5995542fd1;
 Mon, 19 Apr 2021 11:02:28 +0000 (UTC)
Received: from DB8PR03CA0013.eurprd03.prod.outlook.com (2603:10a6:10:be::26)
 by DB8PR08MB3932.eurprd08.prod.outlook.com (2603:10a6:10:a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 11:02:26 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::f3) by DB8PR03CA0013.outlook.office365.com
 (2603:10a6:10:be::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Mon, 19 Apr 2021 11:02:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 11:02:26 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Mon, 19 Apr 2021 11:02:26 +0000
Received: from ec593825496a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C4AC0E32-829B-4990-B9C2-E9055AE815D8.1; 
 Mon, 19 Apr 2021 11:02:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec593825496a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 19 Apr 2021 11:02:19 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6012.eurprd08.prod.outlook.com (2603:10a6:10:205::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Mon, 19 Apr
 2021 11:02:18 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::8957:8ec1:e77f:f34e]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::8957:8ec1:e77f:f34e%3]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 11:02:18 +0000
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
X-Inumbo-ID: 6c9d7597-7daa-47c7-a517-de5995542fd1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhKBcJdFIOkj799DhDRNcBVy0hfGBY2bh7C2KK6g9pE=;
 b=OEDIkcm5xYXxsOD4gyJgFVFtoFosAsVOFt/YxbnuV1+4nUmfvSrsDFnyhjFCdpnWCMVZgKoz9gQh9PjzmGRTwXi+v2vU7Huy3pJlFJnR4UPDjhxAqM9LN4+fsrjHfP6vdLQYasoeh2aNTMjYFCV67mFMUz4/FaxuRxTWD0JMXwk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b9282143c47319cd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+qj2khMyh9/Y11O/TEBreuVi+l2vmJ/P5Jo+dvCn8uJTj9+FjDIr75my0wxv4O+7ToZkOZ7wC1QhcVZegXYPdporXyI9zohenMBvLp1viY2v6f0WnazvGeBq7/1xnd4+2EhPuSh/E4YHtZI4unR3ctewd488bVI/2gaLIWA9mT8yOt0aPS+8kJNbFWnDsHSXGhaWfDjGX16KpotNAfymWBCREIzhmqU+bX9foe1lhOL/H/x380tAkup64LSj8W9sbRB4vEqlhuOjH5N6KZ/UaPzZJ41fk5abRCKw0S+HPDk3EHMVpyGOJ8OQ8C4G4jcTUe38PlyR0jLWgr7ve1miQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhKBcJdFIOkj799DhDRNcBVy0hfGBY2bh7C2KK6g9pE=;
 b=PqD8qPq7DkXlqwQ/JOc0aBIYKBRjWdrJyPrZyfdOTWtll1CkyOEoJh11kQGfcTO1s16uM4k57NjL7g+Y4esKlWXfDdm2P/42cRgtvxjbBoW9MKbkW23MyFi0sjPmcXeqKgTngTrygOhiDMaWVQvGMpPsoNb1UEovbw7V9c4NvoDkd/vpD/kOPR+5ITrnMgxWo6/IGZVGrBwjHTJOaf44R0SpKz8aoXRs0kAD3I29Rr0LOgkS+yfUZGG5ri2gTG8G0t233hpdkvrEIyN6W0dTWtHLF8Zo8Xj8iyHiKtULW8cXBJLEswgelZ4tXupoMCSJltFUqQTcUj6hI7IKm9iJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhKBcJdFIOkj799DhDRNcBVy0hfGBY2bh7C2KK6g9pE=;
 b=OEDIkcm5xYXxsOD4gyJgFVFtoFosAsVOFt/YxbnuV1+4nUmfvSrsDFnyhjFCdpnWCMVZgKoz9gQh9PjzmGRTwXi+v2vU7Huy3pJlFJnR4UPDjhxAqM9LN4+fsrjHfP6vdLQYasoeh2aNTMjYFCV67mFMUz4/FaxuRxTWD0JMXwk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Topic: [PATCH] xen/arm: smmuv1: Revert associating the group pointer
 with the S2CR
Thread-Index:
 AQHXMrMxW8Hpcs9A7Ei4/6fuLjr236q3NfuAgAAHXICAAAYsgIAAC7YAgAAA/oCAAAkFAIADN4qAgAEgwAA=
Date: Mon, 19 Apr 2021 11:02:18 +0000
Message-ID: <279F74CA-647D-458B-97C0-968E1795E494@arm.com>
References:
 <d2e4ed0eaf25a6b581fdec63cd31a742f3182118.1618572178.git.rahul.singh@arm.com>
 <6e75d112-6cc1-4b7c-9751-4064b3250dbf@xen.org>
 <E2FE265F-B7A4-45C3-BA9C-3EF9109F8B5E@arm.com>
 <8569c856-8838-e5d1-b653-e7eb476dacdc@xen.org>
 <4C9CE5FC-551A-4F26-B975-FC7F33877FF2@arm.com>
 <78c30978-c3be-4357-fecc-5b2f24bf563f@xen.org>
 <348C921E-1150-4247-A693-1D81933FC3F7@arm.com>
 <996b5db1-da59-f03c-9e04-9ac283aa38f2@xen.org>
In-Reply-To: <996b5db1-da59-f03c-9e04-9ac283aa38f2@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 69f0b28a-9094-4fdd-2dc0-08d903229dd2
x-ms-traffictypediagnostic: DBBPR08MB6012:|DB8PR08MB3932:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB39324286D1538FC2FA73BC9DFC499@DB8PR08MB3932.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TYKIrEEP8gd0XCxmZDYFJav1ozJJ2A/I157226Qmc81om5UBFcDZ5elbwECTIK16NVBzC3im+WO2DM9JQsi9On9eG4AlDVG51tDJvNpHIjXrHv1rRXe0Vq0I1t9UK1rGwehJbtwrWNNlEXwiElT1tEUL3YvmU0FUw/hxi9Ej0BOnZHXu78E6Fz0JehHkavDW7MwSBB6V0GTOjC/BG4xPV5GYJfZf6vt4HYdf0BpPrm/7W6xhayYjcXpMph8Fz02voPqDjhoWbtWWu3dDhyGiPV4OkQmhC5vMW33g9gDnXzqXesTlh52TO5orimWXikb4uBWqMrehILwtHS5gsJwisIagX7NLiSx76o3zDQgiDeIVYi3wtR4WHbF4uHyByepMrS1tvcElcgDm2rrnu4lB+HoTXkCTp5+SNFUId470zSPZ91jfORwnFtaCbBeQg3hBg1lN+CaT1hcBbvWUJN3s/k2zTKJ1i9hUpp48McCTItg6xliWppFjsB1bAFXKLtfERE3tMeZKC4Kf+BJAyrlFnQLtUDwffV2HWAZRBhdu6shK6d3ZwOKVfVXfWvev6O+LH/xhIZ8lv2gSWNhmmVGfwgErMA7IsIP9texXBD6o5pnYrKrp59NteQoAo0Rcdp+TRo5cHLRKp0fLXHl4mGqfyDINvCJW6E9a1H3mBeTU0UE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(83380400001)(316002)(26005)(478600001)(186003)(54906003)(6486002)(4326008)(5660300002)(2906002)(6512007)(86362001)(76116006)(71200400001)(6916009)(66946007)(53546011)(91956017)(36756003)(66556008)(66446008)(8936002)(2616005)(66476007)(6506007)(64756008)(38100700002)(122000001)(8676002)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?SzR1bzlyai9uT1RoN2JvUURHeFFnTEpMTU1XZGFnSzNnc2ZsbUtka0cvL1I0?=
 =?utf-8?B?c2p2Q29UZnIzZzlOTnhXNjBxM3F5cnBaZUt1djJ2bVBDcGRPQ0puaFkzekJV?=
 =?utf-8?B?bklKUktEV2xJMFc2TndhdmhWMGQwOThGYU9jYjR5bk9lN2g2OGRpWDBPcFgz?=
 =?utf-8?B?SmFPWVBuN2daL1FPT0RycldWWE8wc0htZ3czZ1hoR1huNHJZYk1pTElvV2Yy?=
 =?utf-8?B?VXhubGhhdm9EZDRDWk1VczR3NE9QOXFZWHBRZDVCV2lRUllQR0F3T0xKZFMr?=
 =?utf-8?B?WjZwM2tXV3FqOThJM3dJVUhWaDBGTVF2VlhKSEdaRFFTdjFJS1NUMGlKd3F3?=
 =?utf-8?B?b0ZBc3dJczltRTVJZ1F3c2FqV2tLajZyT0tNbTNmbmd1RHdEQk1JSjBUM21D?=
 =?utf-8?B?MUxMY3hDMXNuTHM4Zk5qd2QyUDJwQ3M4R09uLy8ycEVwVmdtNERuY0JxbWdn?=
 =?utf-8?B?cWhEbHpreE9IUCtzL0N0SlFXNlhTTGRTb0hVdkd4TmNxZ05QVkZMMEZQQXli?=
 =?utf-8?B?Z0pWeTlIYzBaZ20zYXYwbzA5ZXZMR0N2bVY0VkorUVVET0dvbzlXTGdaT1By?=
 =?utf-8?B?UXhJSGRWNmNoNVY0QVVMM2dCSjJENERuNEc3R1puY0k2cUVNdGtGTmNvaXIy?=
 =?utf-8?B?WFlEaHdYaW1yQlRHM3lZTmZONjhtVlRSZHRHa09ROENQazBhSW9yY2JleUdU?=
 =?utf-8?B?NzZOOXNucmoyS2wvYzFkWStPdWJ2M1NJM2wvTkF5YThDdTdYRTdmZnNHTkJJ?=
 =?utf-8?B?dEdaaWVPcFV2NnAwcDNkbUlYeWhGUWZPUnphUGRGVUlvak5iNmUvWis3KzZ4?=
 =?utf-8?B?bk9JMUR1M09wYmI2RUtQSUlSb2tPL3VMUVVFRWpDZWlRdXlaNEIzaEg4SG1p?=
 =?utf-8?B?TWtmME5KYy9iZ2lRK2tFTzc5ZDJZaTFXOFJzbUNsTEl4cm1TQ25VNGl5ZHJ1?=
 =?utf-8?B?NzlMeVJRaFpzOG1JWTdqVWRxWUpOTkxQRzlCc1pZZEhvVVFSNDQyc1FJMDFw?=
 =?utf-8?B?eXROUXpJWFZzclFYNkhhK0RKQ2hXT0tRSG4raVFmNi9jeEJiMmxObmJ1c09v?=
 =?utf-8?B?Y2dtT3J4Zy9KVW1heXI1LzE2eThWUFJkQ3B5bzMwVE15SFpIUVR5NVR0K0tY?=
 =?utf-8?B?ZkIrYitra3ZHbEtucXpLbFRHUnhrZFhMTHdNalg5ZzRYb0prUk9DSHpCT05j?=
 =?utf-8?B?NEdQWXNsTGowUjhYQ0prbTBiZzJka0JaUU8rRldEYmF5dnhyVElmK213THVL?=
 =?utf-8?B?YXBUZXdDSUlveXpSQ1JhODE3bVF0aWtSeVI0WjdiUlVhNndUWXMyWC9GZXJK?=
 =?utf-8?B?bm5vTUhoQW9adEo5andyR2lwTXNwNFlpOWFoOGZReXExUm5xdXBIMW5MeFVz?=
 =?utf-8?B?a2ZBQ0FQRjhGMTQ4REYyT1lhVzg1STY5aTFCek5rL0g2L2JTLy9OLzFXVW0w?=
 =?utf-8?B?RzVZQTRzSXY1RjdHOGJiUlVhTnNDcTFHNTVqWWxIdmc2Z3o5SzFFVEFvY3Jo?=
 =?utf-8?B?VTZKbThvTmlGazRsbE45azRTbWNjeithYnBwUTlZZjBkcnNnU3VzQ21RN3d2?=
 =?utf-8?B?L21JaFVwZEwxOFV1WWxNY1VNT2lwTmdZNkZCRHdZSTExT21ueXd0K28zZWdY?=
 =?utf-8?B?a3k0L0JOZGV2ajY5aDBOR1pDQ1ZnVFdMUDQyOXRhL21ncERNUWxjNm8rb0FF?=
 =?utf-8?B?TFdiUTRmeEQ1U2lJVzhHNkNwRjRiTXBYSG93SUIrZWlmVy9OR01EUUNtUVo5?=
 =?utf-8?Q?FWp6vMt48rLUbJ2+qKhisavWG+iHf0E43D/FTAD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D848BCE62DFF68479B6D00C0D2A7289D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6012
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c46187fa-07d4-411e-334a-08d903229987
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0gMpJmlOQ3E9uLm3cbN+N9CKVUIpIW7C297R3zFl/WtCE71o6lQor7QFyg6tDbfGDHc+R+K6ned6aLRKZXSqWcXeTkjB1A2tcnWJXCiD/AcNkj8UwN53l8HTvnJHRiyShamAj3A+pvnesGgcEDn9TKk3Y65l6rvH4+IcCI2AjNJ7bN5QA0s+MUL/KKhEIlXxTzTBTfdHi9wsGrajFrg9y9fXGOUd3L3DlqRosMO4uIK0EFs5qhRcQ9X7nJUXl/u8nM5jIuVVmebfMuBNYaMNj+Hk34LqpGya+LF+4FdGdT7P8p0IkPzXRSxCKbIaR0ZeDXnsXiD3qpY15i2+kvG3KtuCrvYFdPWDCkFjJKbiTrlMlEdUoFUkefm4zvmaNTsWYjmi9UlNAKyZlTyuahhSZwnT2/muf4rCma6JOLs3irhJzUdtNSE1XzgDAy+VSugI+TJ3iYVxkLwMXjcHrLXIVmCxGV5laWDqeyXDhE93oHX5/NhtYYaKD7KVYm3DQgi8ZwkniM/jZW5mrgCwtym/kifhVkYQUpvM+bMlmoaTLGshftLhz3Ji647RH5icnJDYHQN0+juVK9X++VgrryljlewxrBH0TPJ7+0oL6qUKWvskEyFC5Q5HcYOXnQ9cSh5UC91FV13gknYfcMiH3roUC8M6Apk7jFzhgdYwqbe9Wvk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(46966006)(36840700001)(82310400003)(336012)(33656002)(6486002)(2906002)(83380400001)(86362001)(36756003)(47076005)(82740400003)(54906003)(2616005)(356005)(70206006)(6862004)(8676002)(6506007)(53546011)(70586007)(6512007)(316002)(478600001)(4326008)(36860700001)(81166007)(26005)(5660300002)(107886003)(8936002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 11:02:26.1139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f0b28a-9094-4fdd-2dc0-08d903229dd2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3932

SGkgSnVsaWVuLA0KDQo+IE9uIDE4IEFwciAyMDIxLCBhdCA2OjQ4IHBtLCBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMTYvMDQvMjAyMSAxNzo0
MSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBIaSBKdWxpZW4NCj4gDQo+IEhpIFJhaHVsLA0KPiAN
Cj4+PiBPbiAxNiBBcHIgMjAyMSwgYXQgNTowOCBwbSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4gT24gMTYvMDQvMjAyMSAxNzowNSwg
UmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+PiBPbiAxNiBBcHIgMjAyMSwgYXQgNDoyMyBwbSwgSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+PiANCj4+Pj4+IA0KPj4+Pj4g
DQo+Pj4+PiBPbiAxNi8wNC8yMDIxIDE2OjAxLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+PiBI
aSBKdWxpZW4sDQo+Pj4+PiANCj4+Pj4+IEhpIFJhaHVsLA0KPj4+Pj4gDQo+Pj4+Pj4+IE9uIDE2
IEFwciAyMDIxLCBhdCAzOjM1IHBtLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90
ZToNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IEhpLA0KPj4+Pj4+PiANCj4+Pj4+Pj4gT24gMTYvMDQvMjAy
MSAxMjoyNSwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+Pj4+PiBSZXZlcnQgdGhlIGNvZGUgdGhh
dCBhc3NvY2lhdGVzIHRoZSBncm91cCBwb2ludGVyIHdpdGggdGhlIFMyQ1IgYXMgdGhpcw0KPj4+
Pj4+Pj4gY29kZSBjYXVzaW5nIGFuIGlzc3VlIHdoZW4gdGhlIFNNTVUgZGV2aWNlIGhhcyBtb3Jl
IHRoYW4gb25lIG1hc3Rlcg0KPj4+Pj4+Pj4gZGV2aWNlLg0KPj4+Pj4+PiANCj4+Pj4+Pj4gSXQg
aXMgbm90IGNsZWFyIHRvIG1lIHdoeSB0aGlzIGNoYW5nZSB3YXMgZmlyc3QgYWRkZWQuIEFyZSB3
ZSBtaXNzaW5nIGFueSBmZWF0dXJlIHdoZW4gcmV2ZXJ0aW5nIGl0Pw0KPj4+Pj4+IFRoaXMgZmVh
dHVyZSB3YXMgYWRkZWQgd2hlbiB3ZSBiYWNrcG9ydGVkIHRoZSBjb2RlIGZyb20gTGludXggdG8g
Zml4IHRoZSBzdHJlYW0gbWF0Y2ggY29uZmxpY3QgaXNzdWUNCj4+Pj4+PiBhcyBwYXJ0IG9mIGNv
bW1pdCAieGVuL2FybTogc21tdXYxOiBJbnRlbGxpZ2VudCBTTVIgYWxsb2NhdGlvbuKAnS4NCj4+
Pj4+PiBUaGlzIGlzIGFuIGV4dHJhIGZlYXR1cmUgYWRkZWQgdG8gYWxsb2NhdGUgSU9NTVUgZ3Jv
dXAgYmFzZWQgb24gc3RyZWFtLWlkLiBJZiB0d28gZGV2aWNlIGhhcyB0aGUNCj4+Pj4+PiBzYW1l
IHN0cmVhbS1pZCB0aGVuIHdlIGFzc2lnbiB0aG9zZSBkZXZpY2VzIHRvIHRoZSBzYW1lIGdyb3Vw
Lg0KPj4+Pj4gDQo+Pj4+PiBJZiB3ZSByZXZlcnQgdGhlIHBhdGNoLCB0aGVuIGl0IHdvdWxkIG5v
dCBiZSBwb3NzaWJsZSB0byB1c2UgdGhlIFNNTVUgaWYgdHdvIGRldmljZXMgdXNlIHRoZSBzYW1l
IHN0cmVhbS1pZC4gSXMgdGhhdCBjb3JyZWN0Pw0KPj4+PiBOby4gSWYgd2UgcmV2ZXJ0IHRoZSBw
YXRjaCB3ZSBjYW4gdXNlIHRoZSBTTU1VIGlmIHR3byBkZXZpY2VzIHVzZSB0aGUgc2FtZSBzdHJl
YW0taWQgd2l0aG91dCBhbnkgaXNzdWUgYnV0IGVhY2ggZGV2aWNlIHdpbGwgYmUgaW4gYSBzZXBh
cmF0ZSBncm91cC5UaGlzIGlzIHNhbWUgYmVoYXZpb3VyIGJlZm9yZSB0aGUgY29kZSBpcyBtZXJn
ZWQuDQo+Pj4gDQo+Pj4gT2suIFNvIHRoZXJlIGlzIG5vIGNoYW5nZSBpbiBiZWhhdmlvci4gR29v
ZC4gQ2FuIHlvdSBwcm9wb3NlIGEgY29tbWl0IG1lc3NhZ2UgY2xhcmlmeWluZyB0aGF0Pw0KPj4g
UGxlYXNlIGhhdmUgYSBsb29rIGlmIGl0IG1ha2Ugc2Vuc2UuDQo+PiB4ZW4vYXJtOiBzbW11djE6
IFJldmVydCBhc3NvY2lhdGluZyB0aGUgZ3JvdXAgcG9pbnRlciB3aXRoIHRoZSBTMkNSDQo+PiBS
ZXZlcnQgdGhlIGNvZGUgdGhhdCBhc3NvY2lhdGVzIHRoZSBncm91cCBwb2ludGVyIHdpdGggdGhl
IFMyQ1IgYXMgdGhpcw0KPj4gY29kZSBjYXVzaW5nIGFuIGlzc3VlIHdoZW4gdGhlIFNNTVUgZGV2
aWNlIGhhcyBtb3JlIHRoYW4gb25lIG1hc3Rlcg0KPj4gZGV2aWNlIHdpdGggc2FtZSBzdHJlYW0t
aWQuIFRoaXMgaXNzdWUgaXMgaW50cm9kdWNlZCBieSB0aGUgYmVsb3cgY29tbWl0Og0KPj4g4oCc
MDQzNTc4NGNjNzVkY2ZlZjNiNWY1OWMyOWRlYjFkYmI4NDI2NWRkYjp4ZW4vYXJtOiBzbW11djE6
IEludGVsbGlnZW50IFNNUiBhbGxvY2F0aW9u4oCdDQo+PiAgUmV2ZXJ0aW5nIHRoZSBjb2RlIHdp
bGwgbm90IGltcGFjdCB0byB1c2Ugb2YgU01NVSBpZiB0d28gZGV2aWNlcyB1c2UgdGhlDQo+PiBz
YW1lIHN0cmVhbS1pZCBidXQgZWFjaCBkZXZpY2Ugd2lsbCBiZSBpbiBhIHNlcGFyYXRlIGdyb3Vw
LiBUaGlzIGlzIHRoZSBzYW1lDQo+PiBiZWhhdmlvdXIgYmVmb3JlIHRoZSBjb2RlIGlzIG1lcmdl
ZC4NCj4gDQo+IExvb2sgZ29vZCB0byBtZS4gSXMgdGhpcyBwYXRjaCB0byBiZSBhcHBsaWVkIG9u
IHRvcCBvZiBTdGVmYW5vJ3Mgc2VyaWVzPyBJZiBub3QsIGlzIHRoZXJlIGdvaW5nIHRvIGJlIG1v
cmUgY2xhc2g/DQo+IA0KDQpBcyBwZXIgU3RlZmFubydzIG1haWwgaGUgYWxyZWFkeSB0ZXN0ZWQg
aGlzIHBhdGNoIHNlcmllcyBvbiB0b3Agb2YgdGhpcyBwYXRjaC4gSSB0aGluayB0aGlzIHBhdGNo
IGhhcyB0byBtZXJnZWQgYmVmb3JlIFN0ZWZhbm/igJlzIHBhdGNoIHNlcmllcyANCkxldCBTdGVm
YW5vIGFsc28gY29uZmlybSB0aGF0Lg0KDQpJIHRoaW5rIHRoZXJlIHdpbGwgYmUgbm8gbW9yZSBj
bGFzaGVzLg0KDQoNClJlZ2FyZHMsDQpSYWh1bA0KDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBK
dWxpZW4gR3JhbGwNCg0K

