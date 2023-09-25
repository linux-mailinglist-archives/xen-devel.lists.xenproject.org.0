Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3395D7AD057
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 08:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607621.945875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfGj-00056v-QE; Mon, 25 Sep 2023 06:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607621.945875; Mon, 25 Sep 2023 06:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfGj-00054N-MW; Mon, 25 Sep 2023 06:40:33 +0000
Received: by outflank-mailman (input) for mailman id 607621;
 Mon, 25 Sep 2023 06:40:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qkfGi-00054H-9p
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 06:40:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c049980-5b6e-11ee-878a-cb3800f73035;
 Mon, 25 Sep 2023 08:40:31 +0200 (CEST)
Received: from DB7PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:10:36::40)
 by GV1PR08MB7731.eurprd08.prod.outlook.com (2603:10a6:150:52::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 25 Sep
 2023 06:40:22 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:36:cafe::fc) by DB7PR05CA0027.outlook.office365.com
 (2603:10a6:10:36::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 06:40:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Mon, 25 Sep 2023 06:40:22 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 25 Sep 2023 06:40:22 +0000
Received: from 5737b35c8588.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 31CF8D8E-0A2A-4371-A0C7-3A5FEF07F4B0.1; 
 Mon, 25 Sep 2023 06:40:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5737b35c8588.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 06:40:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9261.eurprd08.prod.outlook.com (2603:10a6:10:3fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 06:40:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 06:40:06 +0000
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
X-Inumbo-ID: 6c049980-5b6e-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dzeIPvVU4WWTITOfMKectdXicpkMBPQfetlDL/n6dI=;
 b=vyglOw0TCRvvXf+EM6eujDu5SARSS38J5CEnk0UJMOvImWlgwIbxkGXLLzKk3bBh+iz99gSzNdHgCVsvYLXUbnRZ3CCX0aA4TzBv3KzxdRFPxXjoRuFy8e3X4ldic21RZFB1LpuLubBs8RqCtyKoSCYeNXffPtbqV53+xfHBzOk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ab8f3cb0ec2ed4a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dqIWMTFgfFDs6v+UlEntKv6vQ4QH3DnxZT/H0WZE4HPc614WIRBBokDLyN+8PEzK6KC3gwvf/c9+YHP2Wigdj0F29OgIiwhXCFOX898Tenu7w1xLUY+wLRXPDakE5OaHlKTSm8NvHSW3b200uYB+jyqRLi52ZIg8YIxNtXAKB9ce3NDE1puwpM9/raoYoKoWwUY8ZUbVcQWx+/JoAX9mA2pQvmjAo83GmA4h5wihKxMpOK2sj306/qSoA93FnvOBYGyrLrUGM5BP/VsucNogdylQ95dkMR1SHc1ZBz89rk9ZXdwp8Ml6NwBLXZxFUPg1HnSKlYTNOQ6r5cSUCLf8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dzeIPvVU4WWTITOfMKectdXicpkMBPQfetlDL/n6dI=;
 b=QOszFlzhAVisrvMU8Sb9GQcGOtKrMEhVp2yywzBcNoFyE0p7aMMnDUHRv+3GXyPCEixvztOHgCBMY9yE6rjgbGdHOKaGZS9hHMhMhSGiTeXyAFirEj8dxuU+npvD1X2XMw2JZ9WA23hK5/v+MpFsS+z88xCH+S/9KyFyyMfSTy1crZ2EPfZIWpwNSkekXct0vFK5p90wZOryaQjCcwjdhrG0i6AbAqeFo0/CXij1YTWbud9y2vz908sGutVJV7B2rN60R5NKVE15BGY4zRCslqTLaXqObyH4C0xFHYE3MjBwG840d5O7XG2ZNqGqg49H79XEqoAxg5DEvJukivbZvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dzeIPvVU4WWTITOfMKectdXicpkMBPQfetlDL/n6dI=;
 b=vyglOw0TCRvvXf+EM6eujDu5SARSS38J5CEnk0UJMOvImWlgwIbxkGXLLzKk3bBh+iz99gSzNdHgCVsvYLXUbnRZ3CCX0aA4TzBv3KzxdRFPxXjoRuFy8e3X4ldic21RZFB1LpuLubBs8RqCtyKoSCYeNXffPtbqV53+xfHBzOk=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "committers@xenproject.org"
	<committers@xenproject.org>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "jgross@suse.com" <jgross@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, "community.manager@xenproject.org"
	<community.manager@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
Thread-Topic: Xen 4.18 release: Reminder about code freeze
Thread-Index: AQHZ705Dwyrpd4I60kahQfZlaJ2JtLArFXGAgAACIQA=
Date: Mon, 25 Sep 2023 06:40:06 +0000
Message-ID: <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com>
References:
 <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com>
In-Reply-To: <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9261:EE_|DBAEUR03FT026:EE_|GV1PR08MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 072b0844-a87d-4c13-2d93-08dbbd924ad5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FndHPxJQdTlUKsv8eFXunm0pkWO6WGfsSyOG8HkE7TFQNQWopYssd+oagUKDJ3aOj9XviLjB+j0xgoan6a0eqDx78niUscNpU8pvl8LCyV9XAbURXs/1yCTI5A0ObbLpy3UI7MQvhVCVKMWWjL8h+zdu4xcX1WPQaAKTsMdHHKAweqE3lTdYwD5rmAC2PSuBNH8he9Sp3qG7HeNvYq1oJA/Byp00Wo/LhrhZbt4FyKu+RREvQAGpIrFcNu6YTXvsyZ2CyWR9/9Q9CGE4VZY3XnyYHfeisi7U914pAfprsfAM5FCZgiYXOlfOgy/xHPHDBZY6KNudcMe2whcezx5C2pqbL/bUe6m0fT18hhV2lZKoCphSa8WOKA20Lecf/Yttt5Qadb69F8cJsJ73OnDta0C4HatqINQbUZfmFCqZUwVV9A4pTbaV+FYI/6DQZJAgVzupCaxpPUwT0Uvihu/me5XzVyI9tHreg9nMQJ7IzOdTENeR4ny5RSaJ0I/u4zyd6gka0qDdb7dWxckNRtFmRE5q3jp0qsq0kXAq8Hxhg6iCtjW2HPGBrBIeG+vWKa1DVP7DQLC4UstjURvAb5pvmhjfZ16OUMiZlOUqBNCmj5uMPmjznJn63XTBieQ2EyCW2Jakl5HLglWiXTnlRQcnxyJSYqqjmt64gwgGWLxsJrU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(136003)(346002)(366004)(376002)(230922051799003)(186009)(1800799009)(451199024)(6512007)(66899024)(53546011)(71200400001)(6506007)(6486002)(83380400001)(122000001)(33656002)(86362001)(38100700002)(38070700005)(36756003)(2616005)(26005)(2906002)(41300700001)(316002)(7416002)(66446008)(76116006)(91956017)(54906003)(64756008)(66946007)(66476007)(478600001)(110136005)(966005)(8936002)(4326008)(8676002)(5660300002)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <614E67252565F249BCD72EDBF96E612B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9261
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2968183a-f0bf-42ee-de9a-08dbbd92415d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wx+Np9fIwOj4MArnDuR61ALsc//ibMt8SlxJbQCH0SBLUtLgIHo6jbLSpxk1gYoTVFO9U2evr1domCsnWOKAoEp4UZqB+r+HRD/mDJdSCmHM0ujOLl6ZcLw3sgMiw+KHNmqNgIM4Rby3Y+8sJ+gGVVEN5XlaN9yqoiyCYrG8WHY49qB8nErGY3wvGffDMk5YVZ9mUOFAo0z4WPx0yQJTqD4P7QPShALvA0x1G6VvgJT+fL8jcbtjQmOgMPAcmcJ0PI972R15DwkhDA8pKkFflailgIEO+DCgNhQ8CVLmlwSCsRCxqGuYAfPEAcd1qS2AxYkGwXI8sjSsRi7eysYLCiM/d+geBEFdwixlt4jrbAf4cQ/RatbwTuXxZ5haDfihjCzbT+mI+gmOQMMCdJ66QLOTtVqwuhSO5RkZfpeJvIEVd2Fa99dHKuPXufDqk9Ar6OqqWVlggtMVSZ2bqXLwxkZgO3v+WT/QssU3BV46wWj8/NZVUHtGz9aSSg4zeGPQkmsKnOEnXiQZ36lG/BQZ9vhseva83kMQKcXSxi4YI5FOI1eGP0JoNaeoWj22zBrQBzJXWj5vDY8hJE7Xg7/tQsKGSPiVUZ+aWH0pvkIOHdiG94Y15r7QYleGcBh+E+YANXFtYv4LARb89sDj3mZmeeKt+mSGZy+gUktCPzEWgDBirYyjL68lPed2LLabLDRv7O3UTZapgbxqCcWg2C3fXgKip2GC2OkNOrOdMfNcXBJiSufQ0/ZIyYLmMPtp7fTHyEaP2LOPXirU20qDiaUB8Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(966005)(83380400001)(110136005)(41300700001)(478600001)(40480700001)(8676002)(5660300002)(2906002)(316002)(4326008)(70206006)(70586007)(54906003)(8936002)(6512007)(6486002)(66899024)(40460700003)(26005)(2616005)(336012)(6506007)(36860700001)(33656002)(36756003)(47076005)(86362001)(81166007)(356005)(53546011)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 06:40:22.1416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 072b0844-a87d-4c13-2d93-08dbbd924ad5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7731

SGkgSmFuLA0KDQo+IE9uIFNlcCAyNSwgMjAyMywgYXQgMTQ6MzIsIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyNS4wOS4yMDIzIDAzOjI1LCBIZW5yeSBX
YW5nIHdyb3RlOg0KPj4gSGkgZXZlcnlvbmUsDQo+PiANCj4+IFRoaXMgaXMgdGhlIHJlbWluZGVy
IHRoYXQgd2UgYXJlIGN1cnJlbnRseSBpbiBjb2RlIGZyZWV6ZS4gVGhlIGhhcmQgY29kZQ0KPj4g
ZnJlZXplIGRhdGUgd2lsbCBiZSBpbiB0d28gd2Vla3MsIGkuZS4gRnJpIE9jdCA2LCAyMDIzLg0K
PiANCj4gQ291bGQgeW91IGZ1cnRoZXIgcmVtaW5kIHVzIGFib3V0IHdoYXQgaXMgKG5vdCkgcGVy
bWl0dGVkIHRvIGdvIGluIGR1cmluZw0KPiB0aGlzIHRpbWU/DQoNClNvcnJ5LCBteSBiYWQuIEZy
b20gY29kZSBmcmVlemUsIHRlY2huaWNhbGx5IG9ubHkgYnVnZml4ZXMgYW5kIHJlbGVhc2UNCkJs
b2NrZXJzIGNhbiBnbyBpbi4NCg0KPiBJIGFsc28gdW5kZXJzdGFuZCBhbGwgY29tbWl0cyBuZWVk
IGEgcmVsZWFzZSBhY2sgZnJvbSBub3cgb24/DQoNCkkgdGhpbmsgc28uDQoNCj4gKEknbSBzb3Jy
eSwgd2UncmUgZG9pbmcgcmVsZWFzZXMgb25seSBldmVyeSBvbmNlIGluIGEgd2hpbGUsIHNvIGl0
IGlzDQo+IGFsd2F5cyBnb29kIGZvciB0aGluZ3MgdG8gYmUgcmUtc3BlbGxlZCBvdXQsIGkuZS4g
ZXZlbiBpZiB0aGV5IGhhdmVuJ3QNCj4gY2hhbmdlZCBmcm9tIGVhcmxpZXIgcmVsZWFzZXMuKQ0K
DQpBY3R1YWxseSwgdGhhbmtzIGZvciBhc2tpbmchIEZvciBNSVNSQSB3b3JrLi4uDQoNCg0KPiBU
aGlzLCBmb3IgZXhhbXBsZSwgd291bGQgdGhlbiBsaWtlbHkgbWVhbg0KPiB0aGF0IGFsbCBNaXNy
YSB3b3JrIG5vdyBuZWVkcyBxdWV1aW5nIGZvciBhZnRlciB0aGUgdHJlZSByZS1vcGVucyAuLi4N
Cg0K4oCmSSBhbHNvIHRob3VnaHQgYWJvdXQgdGhpcywgdG8gYmUgaG9uZXN0IEkgYW0gdGVtcHRl
ZCB0byBsb29zZSB0aGUgY29udHJvbA0Kb3IgYXQgbGVhc3Qgb2ZmZXIgc29tZSBmbGV4aWJpbGl0
eSBvbiB0aGlzIHNwZWNpZmljIHBhcnQsIGFzIG5vcm1hbGx5IE1JU1JBDQpyZWxhdGVkIGNoYW5n
ZXMgYXJlIGhhcm1sZXNzIGFuZCBhY3R1YWxseSBoYXJkZW4gdGhlIGNvZGUuIEkgYW0gd29uZGVy
aW5nDQppZiB0aGVyZSBhcmUgYW55IG9iamVjdGlvbnMgZnJvbSBvdGhlcnPigKYNCg0KQ29tbWl0
dGVycywgd291bGQgeW91IG1pbmQgc2hhcmluZyB5b3VyIG9waW5pb24gb24gdGhpcyBvbmU/IFRo
YW5rcyENCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gVGhhbmtzLCBKYW4NCj4gDQo+
PiBUaGUgcGxhbm5lZCBkYXRlIGZvciA0LjE4IHJjMSBpcyB0aGlzIEZyaWRheSwgaS5lLiBTZXAg
MjksIDIwMjMuDQo+PiANCj4+IEFsc28sIGJlbG93IGlzIHRoZSAodXBkYXRlZCkgY3JpdGljYWwg
aXRlbXMgb24gbXkgbGlzdCBmb3IgNC4xOCByZWxlYXNlOg0KPj4gMS4gW1BBVENIIDAvN10gdG9v
bHM6IE1vcmUgUHl0aG9uIDMgZml4ZXMgKHBhcnQgMSBvZiBOKQ0KPj4gaHR0cHM6Ly9naXRsYWIu
Y29tL3hlbi1wcm9qZWN0L3hlbi8tL2lzc3Vlcy8xMTQNCj4+IA0KPj4gMi4gdG9vbHM6IFN3aXRj
aCB0byBub24tdHJ1bmNhdGluZyBYRU5WRVJfKiBvcHMNCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3hlbi1kZXZlbC8yMDIzMDExNzEzNTMzNi4xMTY2Mi0xLWFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20vDQo+PiANCj4+IDMuIGRvbTBsZXNzIHZzIHhlbnN0b3JlZCBzZXR1cCByYWNlIFdhczog
eGVuIHwgRmFpbGVkIHBpcGVsaW5lIGZvciBzdGFnaW5nIHwgNmE0N2JhMmYNCj4+IGh0dHBzOi8v
bWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE2ODMxMjQ2ODgwODk3Nw0KPj4gaHR0cHM6Ly9tYXJj
LmluZm8vP2w9eGVuLWRldmVsJm09MTY4MzEyNjg3NjEwMjgzDQo+PiANCj4+IDQuIFtQQVRDSCB2
MiAwLzhdIEZpeGVzIHRvIGRlYnVnZ2luZyBmYWNpbGl0aWVzDQo+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy94ZW4tZGV2ZWwvMjFjYzI4YjktOTFkMS0xZTZlLTIzYWMtMDBjNDRmM2VjMDhlQGdt
YWlsLmNvbS8NCj4+IA0KPj4gS2luZCByZWdhcmRzLA0KPj4gSGVucnkNCj4+IA0KPiANCg0K

