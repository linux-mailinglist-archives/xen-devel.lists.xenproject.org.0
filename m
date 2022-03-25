Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660CC4E7476
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 14:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294721.501291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkIl-0000qx-TC; Fri, 25 Mar 2022 13:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294721.501291; Fri, 25 Mar 2022 13:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXkIl-0000o6-Pn; Fri, 25 Mar 2022 13:48:27 +0000
Received: by outflank-mailman (input) for mailman id 294721;
 Fri, 25 Mar 2022 13:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wXB3=UE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nXkIk-0000jo-PB
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 13:48:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ea7ebe2-ac42-11ec-a405-831a346695d4;
 Fri, 25 Mar 2022 14:48:26 +0100 (CET)
Received: from AM6PR10CA0031.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::44)
 by DB6PR0802MB2232.eurprd08.prod.outlook.com (2603:10a6:4:83::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 13:48:13 +0000
Received: from VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::bb) by AM6PR10CA0031.outlook.office365.com
 (2603:10a6:209:89::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Fri, 25 Mar 2022 13:48:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT054.mail.protection.outlook.com (10.152.19.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 13:48:12 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Fri, 25 Mar 2022 13:48:11 +0000
Received: from 9d9745c24d63.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FFE78679-8E7C-41B5-9749-F4EA6923FE90.1; 
 Fri, 25 Mar 2022 13:48:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d9745c24d63.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Mar 2022 13:48:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VI1PR08MB4495.eurprd08.prod.outlook.com (2603:10a6:803:f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 13:47:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c9ab:6cb2:6d11:ac62%3]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 13:47:57 +0000
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
X-Inumbo-ID: 3ea7ebe2-ac42-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fj7GYhBrsnQ4w3KkcRmRKIsvbffpcrQTmYodiqEFvHg=;
 b=oEOfn3eWo1a46igVv96Bk8AON+aMHkBjZwxBVcSAHK4P9HFtaqKOSyAe1R1ONVGaSOaZ27fzLZRqTXBf/dDWqmgBFNWRjNEiRfi3jScG9dfhACrn3S8uXoEjn/ZsCxrpq8p7N/cRkawEH4Av65eVvZxyLadEThhWET4U9KtlR88=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d29d2feb38527d5d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IXszteOPP0Y1bLzZh33OmeFvLnJ9fyp5NlHiyGvbhNbQKLMYJJCslRsxOlSoJN0CMWYtp2saaJizrKUPEn1CwdsjMPs6G9goGhLNLfRrSDMpLF0bbrMgX58BaHOHFi/W9ONnvVpcCkNqGUxfzjlYakbLd/DEtPfmpGO/7vSupY9q9MxMJ41S45dOlOV1rfmY/nArvsBL3v4fCfygssqqVKW6PFit8LMQbTajZyw855gTw+nxmvJ7uHjg34/W4Jnl4UvxpQWi76LmdUuYbseIz0FX5FGmCIyocaI2eX1OOPpT86ttcnMYCIGgF3Y/Y5GLSPBsHS1f263+UcCGZ0yo1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fj7GYhBrsnQ4w3KkcRmRKIsvbffpcrQTmYodiqEFvHg=;
 b=l/ltz8kzrpT8C58WFIFh52Zs/6zY46ygayonsbZE1p4fSdYPGu/LX+VMsdh8AThcbw3wp+o1wDMq15d9i06L3PtrPKwYNaHuITJsGBR5fnxKl+ZLdizNsak93uMZQLuXIM4HYqWXyko2DEglBlR+P51gGoKLA+d6GmXgQWoZPT2LAe3dVfQqg1GR/XiSA5t6EjeLDt8eURCjwg7aWQrrVy2RAtI56J6mN1WCgBN9zo82lwFxgfsw3sKSNMmOwF7JZqMt7jxdiAZVlj9MZ2ftmC3SdynzdvrkcwJSGZgEMFyNOI1KgHrtXdri7p4oeK4w2OQN1SPKvy+gutNc/ze4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fj7GYhBrsnQ4w3KkcRmRKIsvbffpcrQTmYodiqEFvHg=;
 b=oEOfn3eWo1a46igVv96Bk8AON+aMHkBjZwxBVcSAHK4P9HFtaqKOSyAe1R1ONVGaSOaZ27fzLZRqTXBf/dDWqmgBFNWRjNEiRfi3jScG9dfhACrn3S8uXoEjn/ZsCxrpq8p7N/cRkawEH4Av65eVvZxyLadEThhWET4U9KtlR88=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"marco.solieri@minervasys.tech" <marco.solieri@minervasys.tech>,
	"lucmiccio@gmail.com" <lucmiccio@gmail.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
Thread-Topic: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
Thread-Index: AQHYM6fbReeSkSu3okSScrrMlkjRu6zQNoyA
Date: Fri, 25 Mar 2022 13:47:56 +0000
Message-ID: <140E78FF-8281-48BA-BE13-C4B3E12F34A5@arm.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-5-julien@xen.org>
In-Reply-To: <20220309112048.17377-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2d6c171f-fe02-49ab-9405-08da0e661ab9
x-ms-traffictypediagnostic:
	VI1PR08MB4495:EE_|VE1EUR03FT054:EE_|DB6PR0802MB2232:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB22321B81232911B6A4F31A5A9D1A9@DB6PR0802MB2232.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 i3lSTmoowfbOuepu36sRvr4pmDKbdfedyOLwjaMUBV91PG9e1ZF+4lMr2SM4CUjK5L92bEKxFPtuXPMH7muaTdiiZte+H0RITgd4BQEpzsPCQNR32kVwO+PTzK4eMFb+IrZROZmu7LpO5k6taIiKDxG7ocvtQmlFMXBzC+xg9NGPjLCF00Q17lu/iNd0bJAGozprZXLPNRUBtHZrC5VT7jAfinjC+/QVgFbh0hoLn0yD0WVRgE+Lr18xqKzKIiV+7PSnOrc0QW53bD3KG1jy9DrQcHTkUUKrVuGKIRmLdNI85wAOMo+NW9vfq9kJLgMa+PoU8M+kZJy4690wZl5Ut+bBsIyQlqH2Y/CzvNgtmuzUEYu5Ke4EbgFvrFpylppJvX2H71MNfCY0ojgmm9Wi27pskfkcQ/0RBeTOXuRcK7WlGvb65PpX6IhL3pFh0FJp889s2yTb7G3cEP6tNscw/xohkGZavbqrVZsbPL7FJ9Ns18apz6/r2gKFkwQ4qpxyMkkaDcS9gDqg35gkHstYeowg4UGZtdJ3cErqD+Pr6x8cVesCfb/OAmYVbDqbCJNJRAI0mNUOXZYv3jYiag32IQsItDjHNBuHXw73tr36brsjgb1/uPY2kEH1eiLZLnNAbLijQtBWR6M0fRsFvxDTa9ezpipUpI8L9DIz/+Qulptqs3RzMfe81NamE+PNGuBBNOQPURW0uOFyVkmurac7fvYH5ZFquiAAQ3XZgZxKFz9zQtY7wL3E6aEyg+Q30OtOOXJ8Lu1+Rny4i4y1MTFVaw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(91956017)(66476007)(186003)(26005)(66556008)(76116006)(5660300002)(66946007)(122000001)(6512007)(6506007)(508600001)(6486002)(2616005)(66446008)(38070700005)(38100700002)(316002)(54906003)(8676002)(71200400001)(6916009)(86362001)(64756008)(53546011)(4326008)(36756003)(2906002)(33656002)(83380400001)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FB6EE65817E0848802A1BA0B8403CC7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4495
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b172fb9c-d903-415f-237c-08da0e66118c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gGhW7u8RzjGvbJB7fwthWPsvses+6XJ9IDGrb4LxsuQSP/NVjLxP+FBGZPdqiitpHTyxiDDv58WEQbekrVyVJpyaXTTfLWlUhATrprnAKay1NwWgeQaYMxesuG2Cyw/oZjektchrSRfYHNDzf1IDYTL5Utl64gGSKV3VRoDxObVCinnHpUF9JdkDgv/UXI4RFC92Ny348ClQVSY+tmiJHeB5Wy7CdixFDUb49AEEAurrU/PViuP2d9zJQBgvdBlRCPF6O9CkF5+9T5KbHDeXPGSh2U9tTj3dBALA1SYkGgBkJ/EtZAMpSwIjfhrlRqcRoLV2vWhEY9hibgXG2z4sYRLY8i2zPz88jihtsIDbqYdCUQJWkLkzpyozogIid2uBDVFOGayYuO0JRcL3JUPNoyZ6MddnxN/paeVlkEWqjwwQa/9CjdCn3/lkq4MxkWCIgl8+0tVF5Jazdw7HU7V8mBHQmnjw/BR8itYK7N+ORFfbB+m+OiOdmjsgn9u2DYdFnYjaI7EoRF974G3bpb2qcmTXXVSATm6aEQi7Vfj9nwbN8Ir/3V84KFyfGO2V3Z47TM9/cC99rSLx+N+LlKZGU8zqTJz3fAPY1tVhvnd4HMRVsQRFwEEHXvW8g9gZRpxv2k8qONVdEzlM9AqcodJNma2R/eRAC/pySmoPA7nh3sIto8RsEbNUY7ZrWhbYxz8fWsvpSGmKialWAyyn2Ol07w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(36756003)(2906002)(70586007)(356005)(53546011)(4326008)(33656002)(36860700001)(336012)(83380400001)(40460700003)(47076005)(5660300002)(81166007)(8936002)(107886003)(6862004)(26005)(6512007)(186003)(70206006)(6486002)(8676002)(316002)(82310400004)(86362001)(54906003)(508600001)(6506007)(2616005)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 13:48:12.2763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6c171f-fe02-49ab-9405-08da0e661ab9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2232

SGkgSnVsaWVuLA0KDQo+IE9uIDkgTWFyIDIwMjIsIGF0IDEyOjIwLCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFt
YXpvbi5jb20+DQo+IA0KPiBBdCB0aGUgbW9tZW50LCBzd2l0Y2hfdHRicigpIGlzIHN3aXRjaGlu
ZyB0aGUgVFRCUiB3aGlsc3QgdGhlIE1NVSBpcw0KPiBzdGlsbCBvbi4NCj4gDQo+IFN3aXRjaGlu
ZyBUVEJSIGlzIGxpa2UgcmVwbGFjaW5nIGV4aXN0aW5nIG1hcHBpbmdzIHdpdGggbmV3IG9uZXMu
IFNvDQo+IHdlIG5lZWQgdG8gZm9sbG93IHRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4N
Cj4gDQo+IEluIHRoaXMgY2FzZSwgaXQgbWVhbnMgdGhlIE1NVSBuZWVkcyB0byBiZSBzd2l0Y2hl
ZCBvZmYgd2hpbGUgdGhlDQo+IFRUQlIgaXMgdXBkYXRlZC4gSW4gb3JkZXIgdG8gZGlzYWJsZSB0
aGUgTU1VLCB3ZSBuZWVkIHRvIGZpcnN0DQo+IGp1bXAgdG8gYW4gaWRlbnRpdHkgbWFwcGluZy4N
Cj4gDQo+IFJlbmFtZSBzd2l0Y2hfdHRicigpIHRvIHN3aXRjaF90dGJyX2lkKCkgYW5kIGNyZWF0
ZSBhbiBoZWxwZXIgb24NCj4gdG9wIHRvIHRlbXBvcmFyeSBtYXAgdGhlIGlkZW50aXR5IG1hcHBp
bmcgYW5kIGNhbGwgc3dpdGNoX3R0YnIoKQ0KPiB2aWEgdGhlIGlkZW50aXR5IGFkZHJlc3MuDQo+
IA0KPiBzd2l0Y2hfdHRicl9pZCgpIGlzIG5vdyByZXdvcmtlZCB0byB0ZW1wb3JhcmlseSB0dXJu
IG9mZiB0aGUgTU1VDQo+IGJlZm9yZSB1cGRhdGluZyB0aGUgVFRCUi4NCj4gDQo+IFdlIGFsc28g
bmVlZCB0byBtYWtlIHN1cmUgdGhlIGhlbHBlciBzd2l0Y2hfdHRicigpIGlzIHBhcnQgb2YgdGhl
DQo+IGlkZW50aXR5IG1hcHBpbmcuIFNvIG1vdmUgX2VuZF9ib290IHBhc3QgaXQuDQo+IA0KPiBU
YWtlIHRoZSBvcHBvcnR1bml0eSB0byBpbnN0cnVjdGlvbiBjYWNoZSBmbHVzaCBhcyB0aGUgb3Bl
cmF0aW9uIGlzDQo+IG9ubHkgbmVjZXNzYXJ5IHdoZW4gdGhlIG1lbW9yeSBpcyB1cGRhdGVkLg0K
DQpZb3VyIGNvZGUgaXMgYWN0dWFsbHkgcmVtb3ZlIHRoZSBpbnN0cnVjdGlvbiBjYWNoZSBpbnZh
bGlkYXRpb24gc28NCnRoaXMgc2VudGVuY2UgaXMgYSBiaXQgbWlzbGVhZGluZy4NCg0KQWxzbyBh
biBvcGVuIHF1ZXN0aW9uOiBzaG91bGRu4oCZdCB3ZSBmbHVzaCB0aGUgZGF0YSBjYWNoZSA/DQpB
cyB3ZSBzd2l0Y2ggZnJvbSBvbmUgVFRCUiB0byBhbiBvdGhlciwgdGhlcmUgbWlnaHQgYmUgc29t
ZSBkYXRhDQppbiB0aGUgY2FjaGUgZGVwZW5kZW50IHRoYXQgY291bGQgYmUgZmx1c2hlZCB3aGls
ZSB0aGUgTU1VIGlzIG9mZiBvcg0KdGhhdCB3b3VsZCBoYXZlIG5vIG1hcHBpbmcgb25jZSBpdCBp
cyByZWFjdGl2YXRlZC4NCg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY29tPg0KPiANCj4gLS0tDQo+IA0KPiAgICBUT0RPOg0KPiAgICAgICAgKiBS
ZW5hbWUgX2VuZF9ib290IHRvIF9lbmRfaWRfbWFwcGluZyBvciBzaW1pbGFyDQo+ICAgICAgICAq
IENoZWNrIHRoZSBtZW1vcnkgYmFycmllcnMNCj4gICAgICAgICogSSBzdXNwZWN0IHRoZSBpbnN0
cnVjdGlvbiBjYWNoZSBmbHVzaCB3aWxsIGJlIG5lY2Vzc2FyeQ0KPiAgICAgICAgICBmb3IgY2Fj
aGUgY29sb3JpbmcuDQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TIHwgMzEgKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiB4ZW4vYXJjaC9hcm0vbW0uYyAgICAgICAg
IHwgMTQgKysrKysrKysrKysrKy0NCj4gMiBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCsp
LCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0KPiBpbmRleCA4Nzg2NDkyODBkNzMu
LmM1Y2M3MmI4ZmU2ZiAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUw0K
PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TDQo+IEBAIC04MDMsMzYgKzgwMyw0NSBA
QCBmYWlsOiAgIFBSSU5UKCItIEJvb3QgZmFpbGVkIC1cclxuIikNCj4gICAgICAgICBiICAgICAx
Yg0KPiBFTkRQUk9DKGZhaWwpDQo+IA0KPiAtR0xPQkFMKF9lbmRfYm9vdCkNCj4gLQ0KPiAvKg0K
PiAgKiBTd2l0Y2ggVFRCUg0KPiAgKg0KPiAgKiB4MCAgICB0dGJyDQo+ICAqDQo+IC0gKiBUT0RP
OiBUaGlzIGNvZGUgZG9lcyBub3QgY29tcGx5IHdpdGggYnJlYWstYmVmb3JlLW1ha2UuDQo+ICsg
KiBYWFg6IENoZWNrIHRoZSBiYXJyaWVycw0KPiAgKi8NCj4gLUVOVFJZKHN3aXRjaF90dGJyKQ0K
PiArRU5UUlkoc3dpdGNoX3R0YnJfaWQpDQo+ICAgICAgICAgZHNiICAgc3kgICAgICAgICAgICAg
ICAgICAgICAvKiBFbnN1cmUgdGhlIGZsdXNoZXMgaGFwcGVuIGJlZm9yZQ0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICogY29udGludWluZyAqLw0KPiAgICAgICAgIGlz
YiAgICAgICAgICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIHN5bmNocm9uaXphdGlvbiB3aXRo
IHByZXZpb3VzDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKiBjaGFu
Z2VzIHRvIHRleHQgKi8NCj4gKw0KPiArICAgICAgICAvKiBUdXJuIG9mZiBNTVUgKi8NCj4gKyAg
ICAgICAgbXJzICAgIHgxLCBTQ1RMUl9FTDINCj4gKyAgICAgICAgYmljICAgIHgxLCB4MSwgI1ND
VExSX0F4eF9FTHhfTQ0KPiArICAgICAgICBtc3IgICAgU0NUTFJfRUwyLCB4MQ0KPiArICAgICAg
ICBkc2IgICAgc3kNCj4gKyAgICAgICAgaXNiDQo+ICsNCj4gICAgICAgICB0bGJpICAgYWxsZTIg
ICAgICAgICAgICAgICAgIC8qIEZsdXNoIGh5cGVydmlzb3IgVExCICovDQo+IC0gICAgICAgIGlj
ICAgICBpYWxsdSAgICAgICAgICAgICAgICAgLyogRmx1c2ggSS1jYWNoZSAqLw0KPiAgICAgICAg
IGRzYiAgICBzeSAgICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIGNvbXBsZXRpb24gb2YgVExC
IGZsdXNoICovDQo+ICAgICAgICAgaXNiDQo+IA0KPiAtICAgICAgICBtc3IgICAgVFRCUjBfRUwy
LCB4MA0KPiArICAgICAgICBtc3IgICBUVEJSMF9FTDIsIHgwDQo+ICsNCj4gKyAgICAgICAgbXJz
ICAgeDEsIFNDVExSX0VMMg0KPiArICAgICAgICBvcnIgICB4MSwgeDEsICNTQ1RMUl9BeHhfRUx4
X00gIC8qIEVuYWJsZSBNTVUgKi8NCj4gKyAgICAgICAgbXNyICAgU0NUTFJfRUwyLCB4MQ0KPiAN
Cj4gICAgICAgICBpc2IgICAgICAgICAgICAgICAgICAgICAgICAgIC8qIEVuc3VyZSBzeW5jaHJv
bml6YXRpb24gd2l0aCBwcmV2aW91cw0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICogY2hhbmdlcyB0byB0ZXh0ICovDQo+IC0gICAgICAgIHRsYmkgICBhbGxlMiAgICAg
ICAgICAgICAgICAgLyogRmx1c2ggaHlwZXJ2aXNvciBUTEIgKi8NCj4gLSAgICAgICAgaWMgICAg
IGlhbGx1ICAgICAgICAgICAgICAgICAvKiBGbHVzaCBJLWNhY2hlICovDQo+IC0gICAgICAgIGRz
YiAgICBzeSAgICAgICAgICAgICAgICAgICAgLyogRW5zdXJlIGNvbXBsZXRpb24gb2YgVExCIGZs
dXNoICovDQo+IC0gICAgICAgIGlzYg0KPiArICAgICAgICAvKiBUdXJuIG9uIHRoZSBNTVUgKi8N
Cj4gKw0KPiANCj4gICAgICAgICByZXQNCj4gLUVORFBST0Moc3dpdGNoX3R0YnIpDQo+ICtFTkRQ
Uk9DKHN3aXRjaF90dGJyX2lkKQ0KPiArDQo+ICtHTE9CQUwoX2VuZF9ib290KQ0KPiANCj4gI2lm
ZGVmIENPTkZJR19FQVJMWV9QUklOVEsNCj4gLyoNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMNCj4gaW5kZXggNWM0ZGVjZTE2ZjdmLi5hNTM3NjBh
ZjdhZjAgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9tbS5jDQo+ICsrKyBiL3hlbi9hcmNo
L2FybS9tbS5jDQo+IEBAIC02NjAsNyArNjYwLDE5IEBAIHN0YXRpYyB2b2lkIHhlbl9wdF9lbmZv
cmNlX3dueCh2b2lkKQ0KPiAgICAgZmx1c2hfeGVuX3RsYl9sb2NhbCgpOw0KPiB9DQo+IA0KPiAt
ZXh0ZXJuIHZvaWQgc3dpdGNoX3R0YnIodWludDY0X3QgdHRicik7DQo+ICtleHRlcm4gdm9pZCBz
d2l0Y2hfdHRicl9pZCh1aW50NjRfdCB0dGJyKTsNCj4gKw0KPiArdHlwZWRlZiB2b2lkIChzd2l0
Y2hfdHRicl9mbikodWludDY0X3QgdHRicik7DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHN3aXRjaF90
dGJyKHVpbnQ2NF90IHR0YnIpDQo+ICt7DQo+ICsgICAgdmFkZHJfdCBpZF9hZGRyID0gdmlydF90
b19tYWRkcihzd2l0Y2hfdHRicl9pZCk7DQo+ICsgICAgc3dpdGNoX3R0YnJfZm4gKmZuID0gKHN3
aXRjaF90dGJyX2ZuICopaWRfYWRkcjsNCj4gKw0KPiArICAgIHVwZGF0ZV9pZGVudGl0eV9tYXBw
aW5nKHRydWUpOw0KPiArICAgIGZuKHR0YnIpOw0KPiArICAgIHVwZGF0ZV9pZGVudGl0eV9tYXBw
aW5nKGZhbHNlKTsNCj4gK30NCj4gDQo+IC8qIENsZWFyIGEgdHJhbnNsYXRpb24gdGFibGUgYW5k
IGNsZWFuICYgaW52YWxpZGF0ZSB0aGUgY2FjaGUgKi8NCj4gc3RhdGljIHZvaWQgY2xlYXJfdGFi
bGUodm9pZCAqdGFibGUpDQo+IC0tIA0KPiAyLjMyLjANCj4gDQoNCkNoZWVycw0KQmVydHJhbmQN
Cg0KDQo=

