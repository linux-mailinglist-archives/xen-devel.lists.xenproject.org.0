Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C49D4458945
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 07:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228560.395557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp2eT-0005OL-Rz; Mon, 22 Nov 2021 06:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228560.395557; Mon, 22 Nov 2021 06:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mp2eT-0005Lr-Oo; Mon, 22 Nov 2021 06:18:05 +0000
Received: by outflank-mailman (input) for mailman id 228560;
 Mon, 22 Nov 2021 06:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHiU=QJ=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1mp2eS-0005Ll-7M
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 06:18:04 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe07::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efce2172-4b5b-11ec-9787-a32c541c8605;
 Mon, 22 Nov 2021 07:18:01 +0100 (CET)
Received: from AS9PR05CA0049.eurprd05.prod.outlook.com (2603:10a6:20b:489::9)
 by AM7PR08MB5383.eurprd08.prod.outlook.com (2603:10a6:20b:102::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Mon, 22 Nov
 2021 06:17:55 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::5c) by AS9PR05CA0049.outlook.office365.com
 (2603:10a6:20b:489::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 06:17:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 06:17:54 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Mon, 22 Nov 2021 06:17:54 +0000
Received: from 9757cb2f4bac.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8589E4F5-153E-4D8C-BA14-3711E810DAAA.1; 
 Mon, 22 Nov 2021 06:17:48 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9757cb2f4bac.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Nov 2021 06:17:48 +0000
Received: from AS8PR08MB6853.eurprd08.prod.outlook.com (2603:10a6:20b:39e::19)
 by AM5PR0802MB2484.eurprd08.prod.outlook.com (2603:10a6:203:a1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 06:17:39 +0000
Received: from AS8PR08MB6853.eurprd08.prod.outlook.com
 ([fe80::653f:85ca:8df1:43ea]) by AS8PR08MB6853.eurprd08.prod.outlook.com
 ([fe80::653f:85ca:8df1:43ea%8]) with mapi id 15.20.4669.022; Mon, 22 Nov 2021
 06:17:39 +0000
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
X-Inumbo-ID: efce2172-4b5b-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWtEHi1TYYJnQrO6Z9kmB231k4cmmji7H4nQiIQ07QA=;
 b=mmQUdA+LKM7cnDwGDXYOEvy4qHG3Dzyqb9u6LAxIyqsUpNX5ipYAbddQ5YGES+/DcjyU6DhEmXX4q4L0meLrEOvpuaZdcvS04CR3Y6LqdJ0vHncLZqsFQjNyiDjSZsKqu2g2jvn/RuKU/XJshLiPzhFGCUiDq2SYt+ViyDF7Xhk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RZ80Lqg9C4H6avbTOtSVKyLU/po3ANfAF/5iIPLHJt63nYXCr5zfXtbnn+bXbknGCyGXfhU7X6AhpTdXWbq56uI1fU/Uz8iH0v1zrzyFbSuwOBqcZIC4xZ3XGhsIdqcqzVkyMXOJKEr3+URXpMoK7Q17eVuX3wLB3Vstg2JA6uU9VgTun4+tLopGJq2533vx0LYC/ZeejWiq1Xmu5GYo3U4cToiGeycM1tCGkvl5l/Nw7n2Ba1FLrM4IGuJWDkepE7UF+vBUtpGddw05LlwyBCPSNpqwwuSCSMH6y8yglDr4CcoJjuIcSbWzZhZqx6D6K2LiU10BfqALIC/fBdtZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWtEHi1TYYJnQrO6Z9kmB231k4cmmji7H4nQiIQ07QA=;
 b=Sr8pv7vhTPafbMEuqGW2+9/a12IEi397zZvYU59kOsCak9mQSc+X6MNC1iM7mTJ+yfdJgoJqv0T5VGdE9lAF3FDdwzCejQPICdabJJ1b/gmup/81QxhLa4CyfSoir6HL+UZR3G/9lAIm8pD5T2syemv6xDDnIrAAEnGLIvRrEjKeAsA4K8JzF1VmrJWn4eUgqwy9Co51UEQmCTQjE1TCyI0XUaBZU/s4j/qGstW49+ZSSwz1lEjmrmNnq2ya3U1dOfvTfCri7oVU/oe5wLa/aGib/evLArah2PpM1obdx+PS/dBV9pWdGSJelAZb+i2n097gi/M6XjqIHyE+PyQM5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWtEHi1TYYJnQrO6Z9kmB231k4cmmji7H4nQiIQ07QA=;
 b=mmQUdA+LKM7cnDwGDXYOEvy4qHG3Dzyqb9u6LAxIyqsUpNX5ipYAbddQ5YGES+/DcjyU6DhEmXX4q4L0meLrEOvpuaZdcvS04CR3Y6LqdJ0vHncLZqsFQjNyiDjSZsKqu2g2jvn/RuKU/XJshLiPzhFGCUiDq2SYt+ViyDF7Xhk=
From: Wei Chen <Wei.Chen@arm.com>
To: Andrew Cooper <amc96@srcf.net>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH] xen/smp: Support NULL IPI function pointers
Thread-Topic: [PATCH] xen/smp: Support NULL IPI function pointers
Thread-Index: AQHX29MbtakJhW21+kadE2GfQer0SKwJDiCAgAAKIICABfsJwA==
Date: Mon, 22 Nov 2021 06:17:39 +0000
Message-ID:
 <AS8PR08MB6853ED0FC8A586AE211B76979E9F9@AS8PR08MB6853.eurprd08.prod.outlook.com>
References: <20211117164852.16394-1-andrew.cooper3@citrix.com>
 <c1dc1fed-8f07-5074-592e-b240f2bbdd44@suse.com>
 <9ce22608-a1ef-adbd-6455-8ae1af88b388@srcf.net>
In-Reply-To: <9ce22608-a1ef-adbd-6455-8ae1af88b388@srcf.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E66CD8949DD29E468046A4A74C0D17EF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2299789e-bf97-4a8c-5691-08d9ad7fd20e
x-ms-traffictypediagnostic: AM5PR0802MB2484:|AM7PR08MB5383:
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB5383F60BAE28512C296D27DA9E9F9@AM7PR08MB5383.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wPGXZyNmjtTQ+8dxca0ryvDtEIjmhDOR9EoM40yUDIDz/2K2AeB1rcKIhWKoHLdYCT9ECwlMhEfhzcc30/dREZFEPHaNcBTVwMEIUW9kKUuPmcjypitVXBYV2fMQmh+V7w2d2iYVsxMhARUjocXGV2RGtmcppldHZuw19GBJFR0UucbWQvTkOHbCxz4Dzz4mOvatKfHWLlHRYrpwg21frTm7XNh/yGoZ51pNMXNJ23yz8gcveJHv3er1dUUEwLUvq9rJDv+R64D2ECk0fICx9qP7XWQihbQk76HDrqCB91j5Mn4Q6q5IbJv/nfphhT/xD25jOSl6EVVGvZOT4Ro5Zb6ufLH+2CG2UoMaCQoLchwOX008UtpLx71wuTg6hpFO3DhQP/0KPVlW4VBNS4+p9Wqp8vguatohhQs2kZWg4+iwGyHfGB1KWqE1OuyV1amYOyQMijW6HgrZvaRJHCuoMmPY76I0t7luLATmzjYcF9U/nENJt1cfjwUOZ8udzw3V7VsnZj5rJYL9ZHEJr0Z7Ckku5/INupAcUI5yzyQ5ddyd2hfbupr1QhNjmOBBZnPg3Cctvsne6V/eAJEhSKMsAvXV5TzDoTWAuoF0hNVOfq9xZLWYDegibrbIRzwQvjuqP4PZEoF2qQ5HzzcBO80jynZx1mlsnYLLaCO5CYeKcvXMGc3O8NwqLb2ejKsTvp67NzeKwGaETUZ90hCsTXUWBQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6853.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(55016002)(71200400001)(66946007)(66476007)(86362001)(5660300002)(8936002)(316002)(6506007)(53546011)(9686003)(54906003)(110136005)(33656002)(7696005)(186003)(83380400001)(38100700002)(122000001)(26005)(66446008)(64756008)(52536014)(66556008)(38070700005)(4326008)(508600001)(76116006)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2484
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8b7f9895-568f-42e4-0019-08d9ad7fc917
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XOCxHd4JAgMUsqnkBRscqLibLf/H6FrILyQJ53n9Hi9bfqAAfDel0kVDZTjQSkI75kqsM3og3pRnrr0q7cXfwOlCmeAP22ZO4r+PWaqCefgVZjk24kx+2vfRQ9SfenMp8MubczI13iNKghjCFAY7LbJaXU03EHYhYJSrExTl3svj5jYXJhy2dF+XGsRZz5B/ziPY4aHU0PE6o8TGo06pGJKUDv4C4ura6ly8Qv8edrCScXEoOUnG19lImEpAV4YlM3rncymnVXBGMIVw8SF0ZCwf1Y1K6EdjbGVi/1TxNJUikMO9n8YCjYeawM2mNRW1iZNjySxAK3qe3yRSeAUjqtx3U/xGAu7TDuHwUwEoMZw7ijbMvSC/J3WJVC5EzgGH5woezYeiCDvwpWqzYHhsYpDlASwdK92Hf7evGm47Dz4y2ZKfZaPOrSKKuSOg8QoMoEPJgmV07sPbPk/L3RYjj1yNyORWSxZX4Z70iaXA+BPuOUpkJoT2Mr2JAXzZyHzYWXWATuyg35UWaJ8rCvrFTB20Ow56441Ep6mzmnEXvzQcuKJ70ZWJiEnWYC3YIDYoRwWWDue7gGzLZA2wby7TyMe5VKUmRaBLU+X69i6U9wwBE5015ZMh7ESYPFTJ++zTs99sSmld97QZVNMbmotV/Mx9oK6wG66febCpzIgbtgg/vQcZb0n0Zpy83gjlmsGay4U/CZZfca87aGx2U9gNag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(33656002)(7696005)(81166007)(55016002)(26005)(83380400001)(8676002)(47076005)(508600001)(86362001)(110136005)(36860700001)(54906003)(6506007)(2906002)(336012)(356005)(82310400003)(186003)(53546011)(70586007)(4326008)(8936002)(52536014)(9686003)(5660300002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 06:17:54.5682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2299789e-bf97-4a8c-5691-08d9ad7fd20e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5383

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBDb29wZXIgPGFtYzk2QHNyY2YubmV0Pg0KPiBTZW50OiAyMDIx5bm0MTHmnIgxOOaXpSAxODoz
NQ0KPiBUbzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Blcg0K
PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29t
Pg0KPiBDYzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1
IDx3bEB4ZW4ub3JnPjsgWGVuLQ0KPiBkZXZlbCA8eGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB4ZW4vc21wOiBTdXBwb3J0IE5VTEwgSVBJIGZ1
bmN0aW9uIHBvaW50ZXJzDQo+IA0KPiBPbiAxOC8xMS8yMDIxIDA5OjU4LCBKYW4gQmV1bGljaCB3
cm90ZToNCj4gPiBPbiAxNy4xMS4yMDIxIDE3OjQ4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPiA+
PiBUaGVyZSBhcmUgc2V2ZXJhbCBjYXNlcyB3aGVyZSB0aGUgYWN0IG9mIGludGVycnVwdGluZyBh
IHJlbW90ZQ0KPiBwcm9jZXNzb3IgaGFzDQo+ID4+IHRoZSByZXF1aXJlZCBzaWRlIGVmZmVjdC4g
IEV4cGxpY2l0bHkgYWxsb3cgTlVMTCBmdW5jdGlvbiBwb2ludGVycyBzbw0KPiB0aGUNCj4gPj4g
Y2FsbGluZyBjb2RlIGRvZXNuJ3QgaGF2ZSB0byBwcm92aWRlIGEgc3R1YiBpbXBsZW1lbnRhdGlv
bi4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gPj4gLS0tDQo+ID4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hA
c3VzZS5jb20+DQo+ID4+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4NCj4gPj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+DQo+ID4+DQo+ID4+IFRoZSB3YWl0IHBh
cmFtZXRlciBpcyBhIGxpdHRsZSB3ZWlyZC4gIEl0IHNlcnZlcyBkb3VibGUgZHV0eSBhbmQgd2ls
bA0KPiBjb25maXJtDQo+ID4+IHRoYXQgdGhlIElQSSBoYXMgYmVlbiB0YWtlbi4gIEFsbCBpdCBk
b2VzIGlzIGxldCB5b3UgY29udHJvbCB3aGV0aGVyDQo+IHlvdSBhbHNvDQo+ID4+IHdhaXQgZm9y
IHRoZSBoYW5kbGVyIHRvIGNvbXBsZXRlIGZpcnN0LiAgQXMgc3VjaCwgaXQgaXMgZWZmZWN0aXZl
bHkNCj4gdXNlbGVzcw0KPiA+PiB3aXRoIGEgc3R1YiBmdW5jdGlvbi4NCj4gPj4NCj4gPj4gSSBk
b24ndCBwYXJ0aWN1bGFybHkgbGlrZSBmb2xkaW5nIGludG8gdGhlIC53YWl0KCkgcGF0aCBsaWtl
IHRoYXQsIGJ1dA0KPiBJDQo+ID4+IGRpc2xpa2UgaXQgbGVzcyB0aGFuIGFuIGlmKCkvZWxzZSBp
ZigpIGFuZCBhZGRpbmcgYSAzcmQNCj4gY3B1bWFza19jbGVhcl9jcHUoKQ0KPiA+PiBpbnRvIHRo
ZSBjb25mdXNpb24gd2hpY2ggaXMgdGhpcyBsb2dpYy4NCj4gPiBJIGNhbiBhY2NlcHQgdGhpcywg
YWxiZWl0IHBlcnNvbmFsbHkgSSB3b3VsZCBoYXZlIHByZWZlcnJlZCB0aGUgZXh0cmENCj4gaWYo
KQ0KPiA+IG92ZXIgdGhlIGdvdG8uDQo+IA0KPiBKdXN0IHNvIGl0J3MgYmVlbiBwb3N0ZWQuwqAg
VGhpcyBpcyB3aGF0IHRoZSBpZi9lbHNlIGxvb2tzIGxpa2U6DQo+IA0KPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9zbXAuYyBiL3hlbi9jb21tb24vc21wLmMNCj4gaW5kZXggNzlmNGViZDE0NTAy
Li5mZjU2OWJiZTlkNTMgMTAwNjQ0DQo+IC0tLSBhL3hlbi9jb21tb24vc21wLmMNCj4gKysrIGIv
eGVuL2NvbW1vbi9zbXAuYw0KPiBAQCAtODcsNyArODcsMTEgQEAgdm9pZCBzbXBfY2FsbF9mdW5j
dGlvbl9pbnRlcnJ1cHQodm9pZCkNCj4gDQo+IMKgwqDCoMKgIGlycV9lbnRlcigpOw0KPiANCj4g
LcKgwqDCoCBpZiAoIGNhbGxfZGF0YS53YWl0ICkNCj4gK8KgwqDCoCBpZiAoIHVubGlrZWx5KCFm
dW5jKSApDQo+ICvCoMKgwqAgew0KPiArwqDCoMKgwqDCoMKgwqAgY3B1bWFza19jbGVhcl9jcHUo
Y3B1LCAmY2FsbF9kYXRhLnNlbGVjdGVkKTsNCj4gK8KgwqDCoCB9DQo+ICvCoMKgwqAgZWxzZSBp
ZiAoIGNhbGxfZGF0YS53YWl0ICkNCj4gwqDCoMKgwqAgew0KPiDCoMKgwqDCoMKgwqDCoMKgICgq
ZnVuYykoaW5mbyk7DQo+IMKgwqDCoMKgwqDCoMKgwqAgc21wX21iKCk7DQo+IA0KPiANCj4gR0ND
IGRvZXMgbWFuYWdlIHRvIGZvbGQgdGhpcyBpbnRvIHRoZSBnb3RvIHZlcnNpb24gcHJlc2VudGVk
IG9yaWdpbmFsbHkuDQo+IA0KPiBJZiBldmVyeW9uZSBlbHNlIHRoaW5rcyB0aGlzIHZlcnNpb24g
aXMgY2xlYXJlciB0byByZWFkIHRoZW4gSSdsbCBnbw0KPiB3aXRoIGl0Lg0KDQpUaGlzIHZlcnNp
b24gaXMgbXVjaCBjbGVhcmVyIHRvIHJlYWQuIEJ1dCBpZiB0aGVyZSB3aWxsIGJlIHNvbWUgY29k
ZQ0KY29tbWVudHMgaW4gZ290byB2ZXJzaW9uIHRvIG1ha2UgaXQgZWFzeSB0byByZWFkLiBJIGFt
IG9rIGZvciBlaXRoZXIuDQoNCj4gDQo+IH5BbmRyZXcNCg==

