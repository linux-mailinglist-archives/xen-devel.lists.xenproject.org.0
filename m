Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7D070B9F9
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 12:21:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537841.837405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q12f9-0002tO-WA; Mon, 22 May 2023 10:21:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537841.837405; Mon, 22 May 2023 10:21:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q12f9-0002rQ-TK; Mon, 22 May 2023 10:21:11 +0000
Received: by outflank-mailman (input) for mailman id 537841;
 Mon, 22 May 2023 10:21:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvIk=BL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q12f8-0002rK-SZ
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 10:21:11 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a8270f7-f88a-11ed-b22d-6b7b168915f2;
 Mon, 22 May 2023 12:21:03 +0200 (CEST)
Received: from AS8PR04CA0119.eurprd04.prod.outlook.com (2603:10a6:20b:31e::34)
 by PAWPR08MB9544.eurprd08.prod.outlook.com (2603:10a6:102:2f2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 10:21:01 +0000
Received: from AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31e:cafe::a6) by AS8PR04CA0119.outlook.office365.com
 (2603:10a6:20b:31e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 10:21:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT007.mail.protection.outlook.com (100.127.140.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.13 via Frontend Transport; Mon, 22 May 2023 10:21:00 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Mon, 22 May 2023 10:20:59 +0000
Received: from de28df80fec4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 08E058C5-F028-498B-ABC8-D78B25A1E059.1; 
 Mon, 22 May 2023 10:20:53 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de28df80fec4.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 May 2023 10:20:53 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AM7PR08MB5461.eurprd08.prod.outlook.com (2603:10a6:20b:10e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 10:20:51 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 10:20:51 +0000
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
X-Inumbo-ID: 5a8270f7-f88a-11ed-b22d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veH7LOmkRutYLp6hm7b/yDxduAHVlwwYtauf6OoXvuo=;
 b=8v1jcDX0bZafPoqPUg+10f6SZaVo7xlhRhuuxf6Un91SfR1vLPM6nJdvZbHDVOojwD7V/rnwN23ZMQIwDhhPpd1lAjNYrcQK2M3Yb4vZJ+1B0kD+8ejTpqFEXYDvWPHkJLQvy+qqHa9q8rTkndQ8p4FaTfm2gcfBrYmPEty+raM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f7ca24b43d32f231
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxSHU5KBPRoxeEBRjCFibyEZBx8xkhVW4nxA5M+c70hLP/6otgR/XJG27jJVVy5HYJmp5oKazYt64O/zxDUfZrNUya+891iO0DNbZe5G+u7czPz8sc8/yY2lHSYifjuAO1Yc0e75RSfFcw2dmvbPj3w3QVJnL66ugxid70uEe/FNr2rrILYnUHYDQQfYRBhFSYMnrjgca4W76wa41IGsJKnMIZqDDPBWtcop0kUUhYfrmbAfPW3ziLi9tR2+jpuOHfzVWfaCuUfqPrk/6cUixwGy1wvPZjDEgOt0QpmQlb4oL0YXTDkToBc8+gKq5As6joZy9J41fH9eEW0nU45Ndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veH7LOmkRutYLp6hm7b/yDxduAHVlwwYtauf6OoXvuo=;
 b=gmxxKL5Dy4mW8tTqfWpQSwbHo88LRN9aaThbVHBgjaVCo5in3KWPFWUy1G2jUFZb9hREO+BYTbE39pECeD+h5kC/oLRrUOSDrc/iGrwtryadldzu5hEfPhDfuOgq+9zdmzwa7vM3Ek+rXhg5OfotWv0Tz0g+oJjO8LJYpfyCdnaLmFsdIb9MJzSoRnsHpRVqagTSomr5/w5wuSDjoZv8NxPfoo3U7qXVPOOd9jzuc8MW2LJlbXvGkE4Bh6rGSnNnYH0ztZ0CIstukRW0Qkwqvi3xRxnvBN+ocdLTWtWp40/apUG4V+NBkZQ2nDkFFibTfoSawIIHBrhEkR6WBqirMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veH7LOmkRutYLp6hm7b/yDxduAHVlwwYtauf6OoXvuo=;
 b=8v1jcDX0bZafPoqPUg+10f6SZaVo7xlhRhuuxf6Un91SfR1vLPM6nJdvZbHDVOojwD7V/rnwN23ZMQIwDhhPpd1lAjNYrcQK2M3Yb4vZJ+1B0kD+8ejTpqFEXYDvWPHkJLQvy+qqHa9q8rTkndQ8p4FaTfm2gcfBrYmPEty+raM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v6 05/12] arm/sve: save/restore SVE context switch
Thread-Topic: [PATCH v6 05/12] arm/sve: save/restore SVE context switch
Thread-Index: AQHZdnJ92qfFeC693kK/O74mILlnGa9ggLQAgAXAhAA=
Date: Mon, 22 May 2023 10:20:51 +0000
Message-ID: <288F275C-D76F-4E89-B8C6-C8D9AD54D1D9@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-6-luca.fancellu@arm.com>
 <779e46a5-a3d0-187a-6d15-e1a12f71278f@xen.org>
In-Reply-To: <779e46a5-a3d0-187a-6d15-e1a12f71278f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AM7PR08MB5461:EE_|AM7EUR03FT007:EE_|PAWPR08MB9544:EE_
X-MS-Office365-Filtering-Correlation-Id: de384282-e346-44b5-0a0c-08db5aae3d55
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FbpIZuaEpAMOD8KSSv6ofwBax7dxYAfoMKlLMlWPJ2iuULFR2IZdge/cfyw1Ws82EMh+Q99JD3Dvv03+v+FaJf8Xsvxz1ZptDDacivbI+kC/xOcwrluMYKNG+3AHoXIaWKUtFT8iiuv1murLBHScuvxQX8hvZ2FWFTTUo4xx3AADxdYyFjgvPTYuUhlmVO0Fk7R4Wd2mJ5bMhRYTy92FtQK+hAWmDXJNRAzhKv/s9//UWCAY+P0/dMK7Whg9+5L26OUabLmwlnot1bRg8t1GdduH7GbZDtZlAKeQu7MwuIe2CdeU+Mh2ZxDgXNKH3CZyJTOh2qsPd7da02ttNC1gGd0rVJU3uZWosbklNYJ0jtL/GEW7VyqqwtLZUeChXubjwO7QEmuQidBCyNRzqc8cRynzYoFepUcdI8GUIc5YRuCnJPQSRrd3H+F+wkZKalodcGaLik1Ql0l9PgCPcf13QN7G5/LilzJUgAhUd/8oX5prtPoXhsVfHII0Fn/Oc2WYT27MtxKPxWONknH7sBq2ZPIiJt3WXr9d0bLGXckTA+PfptuRhm0TXKKJesb4IyOpyhgDJyLZJ7QiAKvueeh5qViPkosjrEREdj0HwsgWM9qbmxbvtdN01Um0mWgCyPVWbpRhcPhZOrdvr6p6fVG9ZQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(376002)(366004)(136003)(346002)(451199021)(38070700005)(122000001)(38100700002)(33656002)(86362001)(36756003)(53546011)(6512007)(6506007)(8676002)(8936002)(2616005)(4744005)(2906002)(186003)(54906003)(478600001)(64756008)(316002)(4326008)(6916009)(26005)(41300700001)(71200400001)(66446008)(5660300002)(6486002)(66476007)(76116006)(66556008)(91956017)(66946007)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8A713054C6B28438C57AE8D0526B272@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5461
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8d914038-8d9d-4965-2e8a-08db5aae37fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6BFrHOhBqIRpT7ePMuou1fCmXDFYczScVGtHb+FVS85EYrLHr70OpDzn/3uoIrFRDH4V3o+NPEN0YZ6nXMzVXk5nyvvSWYdpFl3GAQg6UgTBy/d7SzjlmgKc39SvMSDHcDLb6X6RGqpb3qD5aXAv/02NICQ/Pfsv8QB/DdL7YlfV6MxvSmUGMteBmCsRjM96YX1tyz6Mlj4TpU7hO3NlsUQ/0URfhVgpOF/XV1Jz+RXxk0xVZjc6qL9Wbc5XkS1uTzQVwlJni2OUlFer1WfDmeJCPTAGwKoMLDgdE6wTuHLSJszTYsf5WfkIOW3jwN0QMZaABnY/deDmlrELXgz3jhi5lN/UAT5nvsX2UZb1prmzlNbaVXpJi65VH5uD0rkAq6OuERTG9aY8DF8gdBmVf5wXjp1kCC3IUG79301s23PGHRo1YRze9c7GhWTV/7mewN5tEDEa1zMCLcCuRMEMbw2TDV/NyQF9dn1nqE67apKqKd+r6x6MsQxq5SLOI9OM9v1aBlVPsv2uLXBldzpAJiriVkIwRXBvtjV9k/v9OhBHC0as/0VZygJBNjlKaGb1i8VkiTRjduojKvrBa6s6CpoCrkh8Os00CUMHk5adh3Ha4ai5YEh/48WfSHbsR01tBRCDYxbvVoPupdykD2mwcD9EKIKHwb1g576ytK6I1yHVV4x/4KtwWOQT6qKRzYZVXRrVZK2svsKpcQ79b12QEAKvyKbnfmAdaYZaPFfn1Nc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(6862004)(8676002)(8936002)(5660300002)(36860700001)(82310400005)(47076005)(83380400001)(186003)(26005)(53546011)(6506007)(6512007)(86362001)(107886003)(2616005)(81166007)(356005)(82740400003)(336012)(40460700003)(41300700001)(6486002)(40480700001)(33656002)(70206006)(70586007)(316002)(4326008)(36756003)(478600001)(54906003)(4744005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 10:21:00.2224
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de384282-e346-44b5-0a0c-08db5aae3d55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9544

DQoNCj4gT24gMTggTWF5IDIwMjMsIGF0IDE5OjMwLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbmUgbW9yZSByZW1hcmsuDQo+IA0K
PiBPbiAyNC8wNC8yMDIzIDA3OjAyLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gICNlbHNlIC8q
ICFDT05GSUdfQVJNNjRfU1ZFICovDQo+PiAgQEAgLTQ2LDYgKzUwLDE1IEBAIHN0YXRpYyBpbmxp
bmUgdW5zaWduZWQgaW50IGdldF9zeXNfdmxfbGVuKHZvaWQpDQo+PiAgICAgIHJldHVybiAwOw0K
Pj4gIH0NCj4+ICArc3RhdGljIGlubGluZSBpbnQgc3ZlX2NvbnRleHRfaW5pdChzdHJ1Y3QgdmNw
dSAqdikNCj4+ICt7DQo+PiArICAgIHJldHVybiAwOw0KPiANCj4gVGhlIGNhbGwgaXMgcHJvdGVj
dGVkIGJ5IGlzX2RvbWFpbl9zdmUoKS4gU28gSSB0aGluayB3ZSB3YW50IHRvIHJldHVybiBhbiBl
cnJvciBqdXN0IGluIGNhc2Ugc29tZW9uZSBpcyBjYWxsaW5nIGl0IG91dHNpZGUgb2YgaXRzIGlu
dGVuZGVkIHVzZS4NCg0KUmVnYXJkaW5nIHRoaXMgb25lLCBzaW5jZSBpdCBzaG91bGQgbm90IGJl
IGNhbGxlZCB3aGVuIFNWRSBpcyBub3QgZW5hYmxlZCwgYXJlIHlvdSBvayBpZiBJ4oCZbGwgZG8g
dGhpczoNCg0Kc3RhdGljIGlubGluZSBpbnQgc3ZlX2NvbnRleHRfaW5pdChzdHJ1Y3QgdmNwdSAq
dikNCnsNCkFTU0VSVF9VTlJFQUNIQUJMRSgpOw0KcmV0dXJuIDA7DQp9DQoNCg0KPiANCj4+ICt9
DQo+PiArDQo+PiArc3RhdGljIGlubGluZSB2b2lkIHN2ZV9jb250ZXh0X2ZyZWUoc3RydWN0IHZj
cHUgKnYpIHt9DQo+PiArc3RhdGljIGlubGluZSB2b2lkIHN2ZV9zYXZlX3N0YXRlKHN0cnVjdCB2
Y3B1ICp2KSB7fQ0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBzdmVfcmVzdG9yZV9zdGF0ZShzdHJ1
Y3QgdmNwdSAqdikge30NCj4+ICsNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

