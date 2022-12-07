Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCFC6457BA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 11:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456147.713871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rbz-0005a3-AP; Wed, 07 Dec 2022 10:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456147.713871; Wed, 07 Dec 2022 10:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2rbz-0005YA-7N; Wed, 07 Dec 2022 10:25:11 +0000
Received: by outflank-mailman (input) for mailman id 456147;
 Wed, 07 Dec 2022 10:25:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VSrc=4F=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p2rby-0005Y2-Es
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 10:25:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c148885-7619-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 11:25:08 +0100 (CET)
Received: from DUZPR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::19) by PAXPR08MB6367.eurprd08.prod.outlook.com
 (2603:10a6:102:15b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 10:24:39 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46b:cafe::ba) by DUZPR01CA0030.outlook.office365.com
 (2603:10a6:10:46b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 10:24:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.14 via Frontend Transport; Wed, 7 Dec 2022 10:24:38 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Wed, 07 Dec 2022 10:24:38 +0000
Received: from 63426c14dccd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5298E9EB-EF7A-48D0-8A6F-48E46DC605DC.1; 
 Wed, 07 Dec 2022 10:24:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 63426c14dccd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Dec 2022 10:24:30 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by PAWPR08MB9445.eurprd08.prod.outlook.com (2603:10a6:102:2e1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Wed, 7 Dec
 2022 10:24:29 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 10:24:28 +0000
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
X-Inumbo-ID: 6c148885-7619-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJZS1IVI6fv4hWohCsorFnxW7Fbo5KKmpvO2jdUKRuw=;
 b=5ZIADmInggH2iGIo5PLDLIO/tO3OzS88NoFjNzUvlXWZ8Ysbf+5OuU3CY/eDkclRmyP+9oLaHQZWZL11ugzwFzXTsONRiuNjWr74CeIugdPVG++7aoTD6EBSXI9tdBGVghiD0fiBIrWv+y+MalMb2VEzYjnwMJ8GEWOWbWZ4Jec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fdbeaf332f4b1a4c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LfJGgGUhUYzsgJ3SonsV2fNtT76KwKdP+/X/dnNMG43oQSgDJ/udRG/nnjxXJbqj+YfRsRSdnsXse54dD4WS43XUJkTxRWqFjuXLJvwl4AG9Z1J1sDHyPcRceGp6azgRmlMO0OOZBpDnfxlo6IrSi+YISEgeA47KUutp2szmfBfpP8a6r7drMBKU57OCSuH58DFzWs/c+01DsnemzN4n1M26vPkCYRG06R4z1vu8sM9W629YUg5VIe5dtew1Ki3SiSHOdvjgSBcKIBNynWqdM7Ee25D4A9/l5KkhoyyFZ4Rb71AdDovmYACWVeP9ekoFxfB5Q2NObJY88vnS8+hyjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJZS1IVI6fv4hWohCsorFnxW7Fbo5KKmpvO2jdUKRuw=;
 b=T4a9gtmFNpMutlVt5LX7R9GM+Bdj0ngbdi3M+Th+rq1p64EHBmW2BkLOsFEoRZ4CetJbEonxnRuH3EFmj5125etLAexrqEof9tS7jHhiF0E4PRNAS6bdyln/COpD5dXf/KaK06y96SjkXEGrCkHucbFF7Rdc3zH5i9lbyAZVqkGNX62FG7JburV1FQcVjOztginByw94I6jDHcXoFwBEC1qWm+vidbhnj3T9MwWF5OnBtOYnGgsyOWV+349hInTW6i5gdVfn5fjGnBasHoAmkOhQtWcp4J9GS8t/tT/Se/WSkceuoTkJW055MVJBR4CZe+M6+X8Ikm8GWJMGJIVP+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJZS1IVI6fv4hWohCsorFnxW7Fbo5KKmpvO2jdUKRuw=;
 b=5ZIADmInggH2iGIo5PLDLIO/tO3OzS88NoFjNzUvlXWZ8Ysbf+5OuU3CY/eDkclRmyP+9oLaHQZWZL11ugzwFzXTsONRiuNjWr74CeIugdPVG++7aoTD6EBSXI9tdBGVghiD0fiBIrWv+y+MalMb2VEzYjnwMJ8GEWOWbWZ4Jec=
From: Rahul Singh <Rahul.Singh@arm.com>
To: sisyphean <sisyphean@zlw.email>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [BUG]SMMU-V3 queue need no-cache memory
Thread-Topic: [BUG]SMMU-V3 queue need no-cache memory
Thread-Index: AQHZCfprdLwUdaBZYka2kYynmoAiD65iOCsA
Date: Wed, 7 Dec 2022 10:24:28 +0000
Message-ID: <75D89B2C-BBE4-419A-80B7-FEE39445ABB2@arm.com>
References: <e1e0e347-6530-7b68-92f7-ef52defa55ac@zlw.email>
In-Reply-To: <e1e0e347-6530-7b68-92f7-ef52defa55ac@zlw.email>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|PAWPR08MB9445:EE_|DBAEUR03FT008:EE_|PAXPR08MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d57e0df-78b6-4587-acc6-08dad83d3eba
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mCOmUK1IHByyNmM0xdJWHelaAs4YqrqRwrFkn+U5E834xCc77q9C7dpQQz1i/xdOXhcRZj87i7fNpgzRswgnIPxunuOG+59yKY/t9yFcbvc0FZS19Q9fgOEn6gP9faQWYrGS2vLjXcKdkXE6PL0yjhTCZVUI/IpoSrfgqkhFCfgpU5Dv7R4WjYxhp/qDFdti/jNui5gBOTlPqdAsvkGkWzYiqLcpJlpOc7maR/gZkxrsovQOsnNBlbBdjcFrJujrHfpgHzKheCOyP2Uh0VNcVkEbsAGkrAPa3FZf7+zgIMdf3mtW4Htz4IPqmbsjGmyvHOjoWUHPk2hlaToJb1+K/TJcu7cT3ABTvxrnn2lq396eqnpkcY9G8sEE74MfaIrvRVxPNAHgsU4wQEGjeUzoDXF6/cKqbwRErhkIcf466p97f/dZ54xSLfWL0SzwSOKeIM5N2DkN7xuA5aKTZDb9jpJlMnuwbcaJiQpjzyozn0tTv1QMX6KGJ/ZhgZMuIrJ5IhsdEDZhw/1acT8J2FtzXk6GuwXc3aEfsRM9wSxHLAEVNrCN3IXqQbUf0TaUUXnJEQEyB1NeWVphyS1zGxQ6zGj/BllJ7roDu/9s7S+BJ1FMKCR8YQuu80LLdL1ulMCtfHGj/Zf5FHKyuMQRHVG7m/ler5OtVQ5sSPsRoJfgBaw6kjJHcymaTOFhBVj/nh9AqVrNpELiUnL1zNxc9WZGMVCKdKgAAUvYnnZBRPwMw9Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(451199015)(122000001)(38100700002)(2906002)(8936002)(36756003)(86362001)(186003)(33656002)(83380400001)(478600001)(2616005)(6916009)(6486002)(66556008)(316002)(76116006)(41300700001)(64756008)(66446008)(38070700005)(91956017)(53546011)(66946007)(71200400001)(26005)(4326008)(8676002)(5660300002)(6506007)(6512007)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFE600A665338949BFFFE370A6B3FDE4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9445
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea9fafca-ee64-4c34-bbd3-08dad83d391e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LM8fiVxKcXEQte4TG5ZKnmy25KnWHsZwjw5wIh5RZVQbsndohfNbplPUcxK3Zpnwihfc9GilQKZ/m2mcjibNDgNhRPKPm4UX7kXodPnwGypKh3VviKNxzbO6+AjGgh43V0MlNJj53IsnFgpS4YibCPvOaQwj2Xlcn9XiZY1WRmvxi5bOBLA5QG3jtAny3oLkpl6PEiWA500XZfX5tALUyL5hqYqNQpymU9GlJURZoA7zJ1NDmW1cho5HbWgfLmCq3xe4YS3EiTcvceEnOyIxJugmlSsG4E61aeQ8l8cpxWT6hwVCRf/92KAkIbjFmA8m2fzLQaks5gAHXeMONGYLKgGHgPYXgh7Y+iv0Oz8U1BYSVnLmLIIoW1/xf54BsObGOdhx39UC2DTA2YpXhBcbt1XZMyYJyiPAxwObeoUJN7IltFYX4A78oy6pg4sZuaftwF6/Ihqkrn0UoZ5HeWulryTbWL2BQZsQiMabgQlPWqJMk1R1Qi1pKXuhgV6C+IG2389JpMFuyole+FXjoLzIN/7ktRmofo3E3l6DXaIi8AmJW3muQ7pPAWTGP2PRPHqVPE04J5hEthpcnk68wiEXLpy8Mb5bkfsjszqq7m2wxij0cKp7mFHRxWJ28gHLKL1hWFxA7B2MMB1aDvaXjTtIsBq0HjV+zn3tRzevQafFFc/irb62biDzVSiyYfY2TRwy4hDFPkupRzBvSBSwpAu+mQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(186003)(356005)(336012)(2616005)(33656002)(40480700001)(81166007)(36756003)(36860700001)(40460700003)(82740400003)(86362001)(47076005)(83380400001)(316002)(6862004)(82310400005)(70586007)(5660300002)(70206006)(41300700001)(4326008)(8676002)(8936002)(2906002)(26005)(6506007)(53546011)(6512007)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 10:24:38.3216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d57e0df-78b6-4587-acc6-08dad83d3eba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6367

SGkgU2lzeXBoZWFuLA0KDQo+IE9uIDcgRGVjIDIwMjIsIGF0IDI6MDQgYW0sIHNpc3lwaGVhbiA8
c2lzeXBoZWFuQHpsdy5lbWFpbD4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+ICAgICBJIHRyeSB0
byBydW4gWEVOIG9uIG15IEFSTSBib2FyZChTb3JyeSwgZm9yIHNvbWUgY29tbWVyY2lhbCByZWFz
b25zLCBJIGNhbid0IHRlbGwgeW91DQo+ICAgICBvbiB3aGljaCBwbGF0Zm9ybSBJIHJ1biBYRU4p
ICBhbmQgZW5hYmxlIFNNTVUtVjMsIGJ1dCBhbGwgY21kcyBpbiBjbWRxIGZhaWxlZCB3aGVuIFhF
TiBzdGFydGVkLg0KPiANCj4gICAgIEFmdGVyIHVzaW5nIHRoZSBkZWJ1Z2dlciB0byB0cmFjayBk
ZWJ1Z2dpbmcsIHRoZSByZWFzb24gZm9yIHRoaXMgcHJvYmxlbSBpcyB0aGF0DQo+ICAgICB0aGUg
cXVldWUgaW4gdGhlIHNtbXUtdjMgZHJpdmVyIGlzIG5vdCBuby1jYWNoZSwgc28gYWZ0ZXIgdGhl
IGZ1bmN0aW9uIGFybV9zbW11X2NtZHFfYnVpbGRfY21kDQo+ICAgICBpcyBleGVjdXRlZCwgdGhl
IGNtZCBpcyBzdGlsbCBpbiBjYWNoZS5UaGVyZWZvcmUsIHRoZSBTTU1VLVYzIGhhcmR3YXJlIGNh
bm5vdCBvYnRhaW4gdGhlIGNvcnJlY3QgY21kDQo+ICAgICBmcm9tIHRoZSBtZW1vcnkgZm9yIGV4
ZWN1dGlvbi4NCg0KWWVzIHlvdSBhcmUgcmlnaHQgYXMgb2Ygbm93IHdlIGFyZSBhbGxvY2F0aW5n
IHRoZSBtZW1vcnkgZm9yIGNtZHF1ZXVlIHZpYSBfeHphbGxvYygpIHdoaWNoIGlzIGNhY2hlZA0K
bWVtb3J5IGJlY2F1c2Ugb2YgdGhhdCB5b3UgYXJlIG9ic2VydmluZyB0aGUgaXNzdWUuIFdlIGhh
dmUgdGVzdGVkIHRoZSBYZW4gU01NVXYzIGRyaXZlciBvbiBTT0MNCndoZXJlIFNNTVV2MyBIVyBp
cyBpbiB0aGUgY29oZXJlbmN5IGRvbWFpbiwgYW5kIGJlY2F1c2Ugb2YgdGhhdCB3ZSBoYXZlIG5v
dCBlbmNvdW50ZXJlZCB0aGlzIGlzc3VlLg0KDQpJIHRoaW5rIEluIHlvdXIgY2FzZSBTTU1VdjMg
SFcgaXMgbm90IGluIHRoZSBjb2hlcmVuY3kgZG9tYWluLiBQbGVhc2UgY29uZmlybSBmcm9tIHlv
dXIgc2lkZSBpZiB0aGUNCiJkbWEtY29oZXJlbnTigJ0gcHJvcGVydHkgaXMgbm90IHNldCBpbiBE
VC4NCg0KSSB0aGluayB0aGVyZSBpcyBubyBmdW5jdGlvbiBhdmFpbGFibGUgYXMgb2Ygbm93IHRv
IHJlcXVlc3QgWGVuIHRvIGFsbG9jYXRlIG1lbW9yeSB0aGF0IGlzIG5vdCBjYWNoZWQuDQoNCkBK
dWxpZW4gYW5kIEBTdGVmYW5vIGRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIG9uIGhvdyB3ZSBj
YW4gcmVxdWVzdCBtZW1vcnkgZnJvbSBYZW4gdGhhdCBpcyBub3QNCmNhY2hlZCBzb21ldGhpbmcg
bGlrZSBkbWFfYWxsb2NfY29oZXJlbnQoKSBpbiBMaW51eC4NCg0KUmVnYXJkcywNClJhaHVs

