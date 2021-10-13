Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE442BF8B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:12:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208318.364395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mad7A-0003d6-IY; Wed, 13 Oct 2021 12:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208318.364395; Wed, 13 Oct 2021 12:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mad7A-0003bK-Ev; Wed, 13 Oct 2021 12:12:08 +0000
Received: by outflank-mailman (input) for mailman id 208318;
 Wed, 13 Oct 2021 12:12:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0M7b=PB=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mad78-0003bE-R0
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:12:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.69]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c79e70e6-2c1e-11ec-816d-12813bfff9fa;
 Wed, 13 Oct 2021 12:12:05 +0000 (UTC)
Received: from AM6P193CA0047.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::24)
 by AS8PR08MB7046.eurprd08.prod.outlook.com (2603:10a6:20b:346::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 12:11:46 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::3) by AM6P193CA0047.outlook.office365.com
 (2603:10a6:209:8e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 13 Oct 2021 12:11:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 12:11:46 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Wed, 13 Oct 2021 12:11:45 +0000
Received: from a25a82c6b005.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A966DB8F-59DD-4F8F-B3C5-AB7463EF4464.1; 
 Wed, 13 Oct 2021 12:11:35 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a25a82c6b005.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Oct 2021 12:11:35 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB4601.eurprd08.prod.outlook.com (2603:10a6:10:30::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 12:11:31 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 12:11:30 +0000
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
X-Inumbo-ID: c79e70e6-2c1e-11ec-816d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwMYQ1g5ZE8bVRXL4ibtdUpb6Os9usTBYPvK82x2kCc=;
 b=tsCHNGvl3ZoJb9aylZU4vjxIeBjLtQX3XaPTCtsVc14fz5thsHJZrVv7asalbrhh6akeVVbzf1+edq4w8gGUt0cb3+yMX263PSa/P37xyGuX0mkzPIOfbGYPuWvuH8bkASNed07VuL2SBxNlFyZjum1ZiLx1AgINZeP9hDh6C04=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5f2d82d7c7cfd2b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeIYqpBQk3WM0z9GML25L6xUei/8zxsX8NNx0oNKrrtW2zaTi6mb9yE3Do2yjq9jxYj1rmnbu7Uy9X+stuRMfAKfo8GSAlDTBegWwqU60EQAjhGNgItiU4YWx7AVCyoSN1oAG7mtobaFKXAPGpn8+HsYptw+oSyAOpcDJNm7IzYqR/6LtDKlJ8J4lg3Yg6GBxqfgC0E/7GVdFLr9Gq6YWUqTK4FZoy1AFZX3FtQiW4s9IWrI0TNcSGDReJlBBWTEuP/dtRssHMM2xFinGVJHY87FhfzaQythPvSAtl11HaTgf7j1D+/8sk72x8juXeGOBAltjvTmc5JFpzBQyC2Biw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwMYQ1g5ZE8bVRXL4ibtdUpb6Os9usTBYPvK82x2kCc=;
 b=KwYdSbBk7q38YzZrwSnscbhuBaj4g80bzwb5b5S9rZWSWxJG+K9OjlgYFCO8OMEb3chgUSFxdq7ZF2iEKi3XPcAE/sHQtLG+/BjltLH0JKMEKCJv2mGobGW3oqVshRdMmfiazf9q0gyaCKs5FMM1QdvLNuohGHunUk/ZlouYmpc27bEYuIBvzNuYJItll3n0OSRrhbQh0j13csQDz78A6cBr0R0dpJ2zY9aBxKXgc3oMFwF2TNYY7YZRyFVuIe+bYZG3ZZomP8mt/47jcps0ji5CQS1GRxFL4JdxefjdsygSApmZ/eV5mDkQYXy2wsG4HHIiAv3IZDHNCAM9DvxpTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwMYQ1g5ZE8bVRXL4ibtdUpb6Os9usTBYPvK82x2kCc=;
 b=tsCHNGvl3ZoJb9aylZU4vjxIeBjLtQX3XaPTCtsVc14fz5thsHJZrVv7asalbrhh6akeVVbzf1+edq4w8gGUt0cb3+yMX263PSa/P37xyGuX0mkzPIOfbGYPuWvuH8bkASNed07VuL2SBxNlFyZjum1ZiLx1AgINZeP9hDh6C04=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Michal Orzel <Michal.Orzel@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andre
 Przywara <Andre.Przywara@arm.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Thread-Topic: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
Thread-Index:
 AQHXutmFlM61oLukkkqK7dSQSsVJ1qvNjrkAgAGmMoCAAW6PgIAAEkkAgAAWnQCAABTUgA==
Date: Wed, 13 Oct 2021 12:11:30 +0000
Message-ID: <9C5C0FE2-67EA-4CD7-893B-82C156F5F77A@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
 <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com>
 <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
 <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com>
 <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local>
In-Reply-To: <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 51405a69-2da6-4625-df82-08d98e42a0a4
x-ms-traffictypediagnostic: DB7PR08MB4601:|AS8PR08MB7046:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB704638BD7CAC23368F5802D99DB79@AS8PR08MB7046.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eYXzt1ZDEK+T6eLtzBSlorMHiFPN7shzz5F9hSDIU6G8gYmUg6+rzrzztEpsUbNnr2kkFQ/7eDTGod1sxblkTQ6XrHYGkpnNLCrMQigTQlSrSxLH6jiIPNxzIBca24l++U3Zcr+sp4fieEAI5YST99CO5Qf341tWSc8SrycnTKd2n4EUxU3wja9vqLy24Q1iLKqO04bFDaMKVR0liUsCDYSeLP2LpoECHtqZAzZGS31wQzoyTJDYjecyWlmUWxaa3QOGnWE9rZ1qOSuvv4rrPFH0ZOC1DY3YgdipSF0NsAg2wyPVUBtcbhaFyun222SM2r2gqpz7t8RR6C7s8b/fSZViR1p9gSQhSIh0Qq1iNmC5Fz7siZYxdqRDapXx5afFw1iqbz2MimMy5F6x2hCyUv+jy89sWEMXNcI2A/2S2WaJa3bs+P//B55eFGBHLHDW1KGYAJ72q0DCzQJ4Sg3Gb92pL9V+7MSxWH+aAhV1Zqc8/qw5mWZFvXE8m3pX5EthaQrtl0IW6VU9CEa5FhGJNmUC/cs1hG3GQpnYfBU8oZKu5VDepTMxwSi9hrmdCUqwbyfdxajqZN08eeCmEGTcuw+rMhzo+g3Cg/y+mUAF7HD65pWKRmQR4VJBFuyov9sGejNTDZa9GbnMqgSn85645UZKixI2o/+BwWvHD3LRHKzrhfa3qIazB+BvdIDGkNmJNRcMmTbxU9MD9bI4i4yc9WJatK+3v41F2pLXfVMCwlEmYr2NZMT2+zwUo/JeiTfA
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(33656002)(64756008)(5660300002)(38100700002)(66446008)(38070700005)(2906002)(53546011)(6506007)(91956017)(4326008)(6916009)(66556008)(122000001)(86362001)(8936002)(83380400001)(2616005)(508600001)(6512007)(316002)(66476007)(186003)(26005)(66946007)(6486002)(7416002)(36756003)(76116006)(8676002)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <37BF04DAAE1FA24489DCA4B3F39FDF0E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4601
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7adf50b3-7af4-4701-915f-08d98e429752
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	slYgyZfXKyFv3j9X8k6WlB4qOEiei18RnOoQgfzJTqheCphhcVZgSITKNJyYQiDyASkkDnR9U0Rtx9fMbKUDH7WZthSkbkpK9kQcKzGfoMzon+CQQ896naQqyGBFLNMRvlIJaTkWqWYHmnd+PxL/5taXIBTxi6fFIF5F49oObJ8o7I/9BdUtEJI6hfyQvB9fm/O2EWRa9fctZcbXZXzjPOijcq7hf0+1X80GfD89TO7o3VEIJ39joLLBDkx+mFOJj4GZufRorITkk8wCAbLPuC5lVyVTnWgMoIkGVfVK37WqPm/LlcSk0sNig9Tk6GuosFJhwfJVzXr/reQ5QjJ94yowLtlznBWOp2q401FnlpzMzDTwQ6TfpNQEhi0eYHjEWeSs9kiiFpQOxthU01xmGKfDnkehSN932nJIN6nQkhqS8SXF94KOJmFp2XYNe2HrntNnY00O96l7/MBGu0NJ5C67vf9DQeAFkZIIzR4skUGS7a5KLEkbrP9VakU5GWjlcArVXBkz0P86SEfIakRT62Nbr7lAs4r+4vnqrWIaY08ME4+DXij34zL4wKxZ6emgBfjI5SDIMnhCEP4eBy4hbUvMLm7bu6oC8ErqvWvo8kEa+dPO6pcah1DFZjX/dPTyLGbVOSDkIshYR3rePNh50lv2X1fAs3hxzlslCiAOeH4mKVsWpK4hmIwowt6tHrPmwgeon3GswKifCDd5SNRvYA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(186003)(47076005)(81166007)(70206006)(6486002)(54906003)(6862004)(2616005)(508600001)(83380400001)(86362001)(33656002)(36860700001)(53546011)(336012)(8936002)(6512007)(6506007)(107886003)(316002)(8676002)(36756003)(26005)(82310400003)(356005)(2906002)(5660300002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 12:11:46.2251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51405a69-2da6-4625-df82-08d98e42a0a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7046

SGkgUm9nZXIsDQoNCj4gT24gMTMgT2N0IDIwMjEsIGF0IDExOjU2LCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIE9jdCAxMywgMjAy
MSBhdCAwOTozNjowMUFNICswMDAwLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4gSGkgUm9n
ZXIsDQo+PiANCj4+PiBPbiAxMyBPY3QgMjAyMSwgYXQgMDk6MzAsIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiBUdWUsIE9jdCAxMiwg
MjAyMSBhdCAxMjozODozNVBNICswMjAwLCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+Pj4+IEhpIFJv
Z2VyLA0KPj4+PiANCj4+Pj4gT24gMTEuMTAuMjAyMSAxMToyNywgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToNCj4+Pj4+IE9uIFdlZCwgT2N0IDA2LCAyMDIxIGF0IDA2OjQwOjMzUE0gKzAxMDAsIFJh
aHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4+IEludHJvZHVjZSBYRU5fRE9NQ1RMX0NERl92cGNpIGZs
YWcgdG8gZW5hYmxlIFZQQ0kgc3VwcG9ydCBpbiBYRU4uDQo+Pj4+Pj4gUmVqZWN0IHRoZSB1c2Ug
b2YgdGhpcyBuZXcgZmxhZyBmb3IgeDg2IGFzIFZQQ0kgaXMgbm90IHN1cHBvcnRlZCBmb3INCj4+
Pj4+PiBET01VIGd1ZXN0cyBmb3IgeDg2Lg0KPj4+Pj4gDQo+Pj4+PiBJIGRvbid0IGxpa2UgdGhp
cyBhcHByb2FjaCwgWEVOX0RPTUNUTF9DREZfdnBjaSBzaG91bGQgYmUgc2V0IGZvciB4ODYNCj4+
Pj4+IFBWSCBkb20wLCBsaWtlIHdlIGRvIGZvciBhbnkgb3RoZXIgQ0RGIGZsYWdzIHdoZW4gWGVu
IGJ1aWxkcyBkb20wLg0KPj4+Pj4gDQo+Pj4+PiBUaGluZ3MgbGlrZSBQVkggdnMgUFYgZ2V0IHRy
YW5zbGF0ZWQgaW50byBDREYgZmxhZ3MgYnkgY3JlYXRlX2RvbTAsDQo+Pj4+PiBhbmQgcHJvY2Vz
c2VkIG5vcm1hbGx5IGJ5IHRoZSBzYW5pdGlzZV9kb21haW5fY29uZmlnIGxvZ2ljLCB2UENJDQo+
Pj4+PiBzaG91bGQgYmUgaGFuZGxlZCB0aGF0IHdheS4NCj4+Pj4+IA0KPj4+Pj4gRG8geW91IHRo
aW5rIHlvdSBjb3VsZCBzZWUgYWJvdXQgZml4aW5nIHRoaXM/DQo+Pj4+PiANCj4+Pj4+IFRoYW5r
cywgUm9nZXIuDQo+Pj4+PiANCj4+Pj4gDQo+Pj4+IEkgaGF2ZSBvbmUgcXVlc3Rpb24gYWJvdXQg
dGhpcyBmaXguDQo+Pj4+IElmIEkgc2V0IFhFTl9ET01DVExfQ0RGX3ZwY2kgZm9yIGRvbTAgcHZo
IGluIGNyZWF0ZV9kb20wLCB0aGVuIGluDQo+Pj4+IHNhbml0aXNlX2RvbWFpbl9jb25maWcgb3Ig
YXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnIEkgaGF2ZSBubw0KPj4+PiBrbm93bGVkZ2Ugb24g
d2hldGhlciBJIGFtIGRvbTAgb3Igbm90LiBJIGNhbiBjaGVjayBpZiBJJ20gUFZIIGJ1dCBub3Qg
aWYgZG9tMC4NCj4+Pj4gVGhpcyB3b3VsZCBiZSBuZWVkZWQgdG8gYWRkIGEgd2FybmluZyBpZiB0
aGlzIGZsYWcgaXMgc2V0IGJ1dCB3ZSBhcmUgbm90IGRvbTAgcHZoLg0KPj4+PiANCj4+Pj4gQW55
IGlkZWFzPw0KPj4+IA0KPj4+IEkndmUganVzdCByZWFsaXplZCB0aGlzIGlzIG1vcmUgd3Jvbmcg
dGhhdCBJIHRob3VnaHQuIHZQQ0kgaXMNCj4+PiBzaWduYWxlZCBvbiB4ODYgaW4geGVuX2FyY2hf
ZG9tYWluY29uZmlnLmVtdWxhdGlvbl9mbGFncywgc28NCj4+PiBpbnRyb2R1Y2luZyBhIHRvcCBs
ZXZlbCBvcHRpb24gZm9yIGl0IHdpdGhvdXQgcmVtb3ZpbmcgdGhlIGFyY2gNCj4+PiBzcGVjaWZp
YyBvbmUgaXMgd3JvbmcsIGFzIHRoZW4gb24geDg2IHdlIGhhdmUgYSBkdXBsaWNhdGVkIG9wdGlv
bi4NCj4+PiANCj4+PiBUaGVuIEknbSBhbHNvIG5vdCBzdXJlIHdoZXRoZXIgd2Ugd2FudCB0byBt
b3ZlIGl0IGZyb20NCj4+PiBlbXVsYXRpb25fZmxhZ3MsIGl0IHNlZW1zIGxpa2UgdGhlIG1vcmUg
bmF0dXJhbCBwbGFjZSBmb3IgaXQgdG8gbGl2ZQ0KPj4+IG9uIHg4Ni4NCj4+PiANCj4+PiBJZiB3
ZSByZWFsbHkgd2FudCB0byBtYWtlIHZQQ0kgYSBDREYgb3B0aW9uIHdlIG11c3QgZGVhbCB3aXRo
IHRoZQ0KPj4+IHJlbW92YWwgb2YgWEVOX1g4Nl9FTVVfVlBDSSwgb3IgZWxzZSB5b3UgY291bGQg
aW50cm9kdWNlIGFuIGFyY2gNCj4+PiBzcGVjaWZpYyBmbGFnIGZvciB2UENJIG9uIEFybS4NCj4+
IA0KPj4gRmlyc3QgaXNzdWUgdGhhdCB3ZSBoYXZlIGhlcmUgaXMgdGhhdCB0aGVyZSBpcyBubyBl
bXVsYXRpb25fZmxhZ3MgcmlnaHQgbm93IG9uIGFybS4NCj4gDQo+IFlvdSBkb24ndCBleHBsaWNp
dGx5IG5lZWQgYW4gZW11bGF0aW9uX2ZsYWdzIGZpZWxkLCB5b3UgY291bGQgYWRkIGENCj4gdWlu
dDhfdCB2cGNpIG9yIHNvbWUgc3VjaCB0byB4ZW5fYXJjaF9kb21haW5jb25maWcgZm9yIEFybSBp
ZiB5b3UNCj4gZG9uJ3QgdGhpbmsgdGhlcmUncyBhIG5lZWQgdG8gc2VsZWN0IG1vcmUgZW11bGF0
aW9uLiBUaGF0J3MgdXAgdG8gQXJtDQo+IGZvbGtzLg0KDQpPbmUgd2F5IG9yIGFuIG90aGVyIGl0
IGlzIHN0aWxsIGNoYW5naW5nIHRoZSBpbnRlcmZhY2UuDQoNCj4gDQo+PiBTbyBJIHRoaW5rIHRo
ZXJlIGFyZSAyIHNvbHV0aW9uczoNCj4+IA0KPj4gLSBpbnRyb2R1Y2UgUEhZU0NBUC4gVGhlIHBy
b2JsZW0gaGVyZSBpcyB0aGF0IGl0IGlzIG5vdCBhIHBoeXNpY2FsIGNhcGFjaXR5IGFuZA0KPj4g
SSB0aGluayB0aGF0IHdpbGwgaGl0IHVzIGluIHRoZSBmdXR1cmUgZm9yIGV4YW1wbGUgaWYgd2Ug
d2FudCB0byB1c2UgdnBjaSBmb3IgVklSVElPDQo+PiBldmVuIGlmIHRoZXJlIGlzIG5vdCBwaHlz
aWNhbCBQQ0kgb24gdGhlIHBsYXRmb3JtLg0KPiANCj4gSG0sIFBIWVNDQVAgaXMgYSBiaXQgd2Vp
cmQsIGZvciBleGFtcGxlIFhlbiBzaWduYWxzIHNoYWRvdyBwYWdpbmcNCj4gc3VwcG9ydCB1c2lu
ZyBQSFlTQ0FQIHdoaWNoIGRvZXNuJ3QgZGVwZW5kIG9uIGFueSBoYXJkd2FyZSBmZWF0dXJlLg0K
PiANCj4gSSB0aGluayB5b3UgY291bGQgc2lnbmFsIHZQQ0kgcmVnYXJkbGVzcyBvZiB3aGV0aGVy
IHRoZSB1bmRlcmx5aW5nDQo+IHBsYXRmb3JtIGhhcyBQQ0kgZGV2aWNlcyBvciBub3QsIGFzIHZQ
Q0kgaXMgcHVyZWx5IGEgc29mdHdhcmUNCj4gY29tcG9uZW50Lg0KDQpCdXQgaW4gdGhlIHg4NiBj
YXNlIHRoaXMgaXMgc29tZXRoaW5nIG5vdCBzdXBwb3J0ZWQgaW4gYWxsIGNhc2VzIGFuZCBhY3R1
YWxseSBvbmx5IGJ5IGRvbTAgcHZoLg0KU28gaGF2aW5nIHNvbWV0aGluZyBsaWtlIHRoYXQgZGVm
aW5lZCBhcyBhIFBIWVNDQVAgaXMgYSBiaXQgd2VpcmQuDQoNCj4gDQo+IFJlZ2FyZGluZyBWaXJ0
SU8sIHdvbid0IGl0IGJlIGltcGxlbWVudGVkIHVzaW5nIGlvcmVxcyBpbiB1c2VyLXNwYWNlLA0K
PiBhbmQgdGh1cyB3b24ndCBkZXBlbmQgb24gdlBDST8NCg0KWWVzIHRoYXTigJlzIGEgc29sdXRp
b24gYnV0IHlvdSBjYW4gbGlzdCB0aGVtIHRocm91Z2ggYSBQQ0kgaW50ZXJmYWNlIHRvIGxldCBh
IGd1ZXN0IGRpc2NvdmVyIHRoZW0uDQpJIGFtIG5vdCBzYXlpbmcgdGhhdCB3ZSB3aWxsIGRvIHRo
YXQgYnV0IHRoYXQgd2FzIGFuIGV4YW1wbGUgb2YgY2FzZSB3aGVyZSB3ZSBjb3VsZCB1c2UgdlBD
SSB3aXRob3V0IGhhcmR3YXJlIFBDSSBwcmVzZW50Lg0KDQo+IA0KPj4gLSBpbnRyb2R1Y2UgYW4g
ZW11bGF0aW9uIGZsYWcgb24gYXJtLiBUaGUgcHJvYmxlbSBoZXJlIGlzIHRoYXQgdGhlcmUgaXMg
bm8gZW11bGF0aW9uDQo+PiBmbGFnIHJpZ2h0IG5vdyBvbiBhcm0gc28gYWRkaW5nIHRoaXMgZmVh
dHVyZSB3aWxsIHJlcXVpcmUgYSBjaGFuZ2Ugb2YgaW50ZXJmYWNlIGluDQo+PiBhcmNoLWFybS5o
IGFuZCBpbiB4ZW4gZG9tY3RsIGludGVyZmFjZS4gQnV0IGlmIHdlIGludHJvZHVjZSBvbmUgb24g
QXJtLCBpdCB3b3VsZCBhbGxvdw0KPj4gdGhlIHRvb2xzIHRvIGNoZWNrIGlmIENERl92cGNpIGNh
biBiZSBzZXQgb3Igbm90IHdoaWNoIHdvdWxkIHNvbHZlIGN1cnJlbnQgaXNzdWVzLg0KPiANCj4g
SSdtIG5vdCBzdXJlIEkgZm9sbG93LiBJZiB3ZSBnbyB0aGUgZW11bGF0aW9uIGZsYWdzIHJvdXRl
IHRoaXMgd2lsbCBhbGwNCj4gYmUgc2V0IGluIHhlbl9hcmNoX2RvbWFpbmNvbmZpZywgYW5kIENE
Rl92cGNpIHdpbGwgY29tcGxldGVseSBnbyBhd2F5Lg0KDQpUaGlzIGlzIGEgbWlzdGFrZSBvbiBt
eSBzaWRlLiBZb3UgYXJlIHJpZ2h0IHVzaW5nIGVtdWxhdGlvbiBmbGFncyB3aWxsIHJlcXVpcmUg
dG8gcmVtb3ZlIENERl92cGNpLg0KDQo+IA0KPj4gSSB0aGluayB0aGUgc2Vjb25kIHNvbHV0aW9u
IGlzIHRoZSByaWdodCBvbmUgYnV0IGl0IGNhbm5vdCBiZSBkb25lIHNvIG5lYXIgZnJvbSB0aGUN
Cj4+IGZlYXR1cmUgZnJlZXplLg0KPj4gDQo+PiBUaGUgQ0RGIGZsYWcgYXMgaW50cm9kdWNlZCBy
aWdodCBub3cgaXMgbm90IGNyZWF0aW5nIGFueSBpc3N1ZSBhbmQgd2lsbCBiZSB1c2VkIG9uY2UN
Cj4+IHRoZSBlbXVsYXRpb24gZmxhZyB3aWxsIGJlIGludHJvZHVjZS4gV2Ugd2lsbCBiZSBhYmxl
IGF0IHRoaXMgc3RhZ2UgdG8gc2V0IHRoaXMgcHJvcGVybHkNCj4+IGFsc28gb24geDg2IChmb3Ig
ZG9tMCBwdmgpLg0KPj4gTW9yZW92ZXIga2VlcGluZyBpdCB3aWxsIGFsbG93IHRvIGNvbnRpbnVl
IHRvIG1lcmdlIHRoZSByZW1haW5pbmcgcGFydCBvZiB0aGUgUENJDQo+PiBwYXNzdGhyb3VnaCB3
aGljaCBhcmUgb3RoZXJ3aXNlIG5vdCBwb3NzaWJsZSB0byBiZSBkb25lIGFzIHRoZXkgYXJlIGRl
cGVuZGVudCBvbiB0aGlzIGZsYWcuDQo+PiANCj4+IENhbiB3ZSBhZ3JlZSBvbiBrZWVwIHRoZSBE
T01DVExfQ0RGX3ZwY2kgZmxhZyBhbmQgaW50cm9kdWNlIHRoZSBlbXVsYXRpb24NCj4+IGZsYWcg
b24gQXJtIGFmdGVyIDQuMTYgcmVsZWFzZSA/DQo+IA0KPiBJZiB2UENJIGZvciBBcm0gb24gNC4x
NiBpcyBub3QgZ29pbmcgdG8gYmUgZnVuY3Rpb25hbCwgd2h5IHNvIG11Y2gNCj4gcHJlc3N1cmUg
aW4gcHVzaGluZyB0aG9zZSBwYXRjaGVzIHNvIGZhc3Q/IEkgdW5kZXJzdGFuZCB0aGUgbmVlZCB0
bw0KPiByZW1vdmUgc3R1ZmYgZnJvbSB0aGUgcXVldWUsIGJ1dCBJIGRvbid0IHRoaW5rIGl0J3Mg
d29ydGggdGhlIGNvc3Qgb2YNCj4gaW50cm9kdWNpbmcgYSBicm9rZW4gaW50ZXJmYWNlIGRlbGli
ZXJhdGVseSBvbiBhIHJlbGVhc2UuDQoNCldlIGRpZCBub3QgcHVzaCB0aGF0IGZhc3QsIHRob3Nl
IGhhdmUgYmVlbiBvbiB0aGUgbWFpbGluZyBsaXN0IGZvciBhIHdoaWxlICh0aGlzIGlzIHRoZSA1
dGggdmVyc2lvbiBvZiB0aGUgc2VyaWUpLg0KUENJIHBhc3N0aHJvdWdoIGlzIGEgYmlnIGNoYW5n
ZSByZXF1aXJpbmcgbG90cyBvZiBwYXRjaGVzIGFuZCB3ZSBkZWNpZGVkIHRvIHB1c2ggaXQgcGll
Y2UgYnkgcGllY2UgdG8gbWFrZQ0KdGhlIHJldmlldyBlYXNpZXIuDQoNCj4gDQo+IEkgdGhpbmsg
d2UgbmVlZCB0byBhdCBsZWFzdCBzZXR0bGUgb24gd2hldGhlciB3ZSB3YW50IHRvIGtlZXANCj4g
Q0RGX3ZwY2kgb3IgdXNlIGFuIGFyY2ggc3BlY2lmaWMgc2lnbmFsIG1lY2hhbmlzbSBpbiBvcmRl
ciB0byBkZWNpZGUNCj4gd2hhdCB0byBkbyByZWdhcmRpbmcgdGhlIHJlbGVhc2UuDQoNCkFncmVl
IGFuZCBJIGhhdmUgbm8gZGVmaW5pdGl2ZSBpZGVhIG9uIHRoaXMgc28gYnV0IHN3aXRjaGluZyB3
aWxsIHJlcXVpcmUgdG8gcmV2ZXJ0IHRoZSBwYXRjaCBhZGRpbmcgQ0RGX3ZwY2kNCmFuZCBjaGFu
Z2UgdGhlIHN1YnNlcXVlbnQgcGF0Y2hlcy4NCg0KUmVnYXJkcw0KQmVydHJhbmQNCg0KPiANCj4g
VGhhbmtzLCBSb2dlci4NCg0K

