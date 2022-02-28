Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC644C6C54
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 13:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280491.478438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOf4e-00042M-3J; Mon, 28 Feb 2022 12:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280491.478438; Mon, 28 Feb 2022 12:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOf4e-0003zl-0G; Mon, 28 Feb 2022 12:24:20 +0000
Received: by outflank-mailman (input) for mailman id 280491;
 Mon, 28 Feb 2022 12:24:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+aRg=TL=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nOf4c-0003zf-4B
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 12:24:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57fca620-9891-11ec-8eba-a37418f5ba1a;
 Mon, 28 Feb 2022 13:24:16 +0100 (CET)
Received: from AS8PR04CA0149.eurprd04.prod.outlook.com (2603:10a6:20b:127::34)
 by AM9PR08MB7168.eurprd08.prod.outlook.com (2603:10a6:20b:3de::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 12:24:13 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::28) by AS8PR04CA0149.outlook.office365.com
 (2603:10a6:20b:127::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25 via Frontend
 Transport; Mon, 28 Feb 2022 12:24:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Mon, 28 Feb 2022 12:24:13 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Mon, 28 Feb 2022 12:24:13 +0000
Received: from eeee43340899.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D2F6062D-3CF1-469D-BC6B-062ED4F6AF9E.1; 
 Mon, 28 Feb 2022 12:24:02 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eeee43340899.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Feb 2022 12:24:02 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by AM7PR08MB5335.eurprd08.prod.outlook.com
 (2603:10a6:20b:101::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Mon, 28 Feb
 2022 12:24:00 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60%10]) with mapi id 15.20.5017.026; Mon, 28 Feb
 2022 12:23:54 +0000
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
X-Inumbo-ID: 57fca620-9891-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6n9352ehEXwn+lvoYM1eerHSAe4r5q+VxS07xN90xU=;
 b=MTXIGynY0oed0feumJ9Kt/NQ+WCLGuKX1kCTHcZ4GYhSebxoNvOlNVNRpoEecJVZGxbAOzQtjJ9X68nzUfIOUix6ceCOvfNseFMpDiv1hixGQ8QLR9Xx9/m//EzGMehA2ZsHpKzT6COqNtSSr5BO4wpV4YwNMvA84RrsQFwn6+Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c8062bceb6f2b1d6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5EkRqJtHnTWF+Krep/Kea9/H5xJ57PgmstkE+NFj1jQVWSpgE37CdOjMgmFGJW5lwkd46hb1fE9zgIicyVdTf6zTCHf6MO3dWa2EZKv7f+YuphDMc6KoK7FhRVkF5UOwjIymt5ghmRnfrxUqReLbnQ4Ldh+d67T2+K7ktooAZVTPG49w99iQOdGf8eRUPds/eyWqqCTCv87bKnBqJYHdYr8p2D4WOg5lLWwrpTk6u14oCe6qlsPGWZzSFJQvZCSvG78OZGyjifc2zASTQB7vMWAvhCLq6uILf2sg3A+gRttGjo0iHk/8KMxXTmqCKW6u3mME7J4LfGqP+bNZjCqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6n9352ehEXwn+lvoYM1eerHSAe4r5q+VxS07xN90xU=;
 b=m9NYQFGwWYO6UnB9xchp1IEW6EzsbUmvdWXQdvBkrxRkzNCk/h5jqBMysy7EvfXRBlXcgIUakxiZHBIbxAuPdXSdIWmpmTHq1NXsuTBuRLKg5JJjtz2kPHpAzwFtMol9T0lopaJoUYvDXGevnhsmYXsoulcYzaFqbf56hejASiOlZDqXYBB8bZdc20LS/YAyB4ThmnNz5xbXDY2bpP8XbMdKqhu4juEc3yzIBnetgt2YgoEpzagryYz5/jHJI8OZTyyacgMt8WbsNthixREiPJ43J1EC7PmtPxKAzyeL9e6FCEK2XojQJWQ8JaIG+tqDcizNUwM2S6aX7e3LZCM22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6n9352ehEXwn+lvoYM1eerHSAe4r5q+VxS07xN90xU=;
 b=MTXIGynY0oed0feumJ9Kt/NQ+WCLGuKX1kCTHcZ4GYhSebxoNvOlNVNRpoEecJVZGxbAOzQtjJ9X68nzUfIOUix6ceCOvfNseFMpDiv1hixGQ8QLR9Xx9/m//EzGMehA2ZsHpKzT6COqNtSSr5BO4wpV4YwNMvA84RrsQFwn6+Y=
From: Rahul Singh <Rahul.Singh@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/3] xen/vpci: msix: move read/write call to MSI-X PBA
 entry to arch file
Thread-Topic: [PATCH v2 3/3] xen/vpci: msix: move read/write call to MSI-X PBA
 entry to arch file
Thread-Index: AQHYIoCRIEW4rFyZskGyHhvFMB0R0ayj/BWAgAT7AwA=
Date: Mon, 28 Feb 2022 12:23:54 +0000
Message-ID: <CB924115-A4F7-4052-90D1-A9C5A63AAA60@arm.com>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <3e47316052dce3c85bde04ab6b72ba4f48fa0bb8.1644937405.git.rahul.singh@arm.com>
 <YhiRS11TlQjuefHR@Air-de-Roger>
In-Reply-To: <YhiRS11TlQjuefHR@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 84c828c0-ca72-45fe-fc4a-08d9fab53afd
x-ms-traffictypediagnostic:
	AM7PR08MB5335:EE_|AM5EUR03FT007:EE_|AM9PR08MB7168:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB716835D171B71A9720B82888FC019@AM9PR08MB7168.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WploVoJ5b8BOtK0c3G+S+Rgzb1ptcN5sz/z1eqT0n3gpjkhxFmxT+mtOwT25maFwdCuerw3oKeee2ok8HNN/73vesaYNcKkjCVS8dbxHftb7wpgvAxEqyeFHJUlJGKHMwuQf9MBy7RycDM8j2jxkt3sWPFRC34nwrHuDkXgPD6Nbm10ujoy3IIqnJk+f+K8WbOA1hdCb8Yw6HuMaCGDqxJkmzN/7bpbkkzGXjnBZXETwa2yo2Ks3shiTeue6O2zX3ELSjoMlAFuJ+FJH6GW8mE8D51H14WDt31Bl43oaP2+3JdRRUWt2FCjSft3TcmoBagGipr5Eash3fWkoaj0iPn3dfOupOac5aqPMqVawpekBzcDmFwXgPODKPmQ2VkuzhySZvNBwrtIhGy98DpF3+RDY+hw6Odx7uiVCbfoPv6B8hdL6Nzb2o+IMcNqJyyNHTIr+B4hfIoBkUPQnJdvKrAsaQ1gPdJ2pKC9D0eCnZTPNBG9PR0IkGlc6QGoeLN2gfqulM6f2dgrZ2GApemqWDAFAH028blzUOj8GQ0/O2b5fftDXxLZSm4K9M3VPMIuHrdCzntvTQIqINLR435mbDkGU3zi/YY0U6ugaELDL4UsqmQR58yJVFqWeaw1ZyKqyJ73QGL97TVy9ZWslCrebyGql1kTlH1v2V1S+s3Jatgw/09OQKu6f7XQjfPG0OODDgJalbna5BHIyPz2xYUIQOhlF5o6dbBghD9i8hsIbUGN26aY2A6cowV7Z0RSPGmE8
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(33656002)(76116006)(66946007)(316002)(508600001)(66476007)(6916009)(66556008)(54906003)(91956017)(6506007)(122000001)(8936002)(83380400001)(66446008)(26005)(71200400001)(64756008)(5660300002)(36756003)(2616005)(6486002)(6512007)(86362001)(8676002)(2906002)(53546011)(38100700002)(4326008)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E2326BAD72E0E44B58ADDF988066320@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b46e63c-30e2-401e-7938-08d9fab52fe5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8yJ5wNaNlORzBBUAliYsueBJI1GB/XlC0M2BSLTT42yauFYUdVLQp0nZ/ERNT3g481eGn6gW1nYnUMYGE5bh8Ez2y+45YUaFTUkM5CtkmtXTyBsWZBkK9wF/jQcHWErN/GGvjnynqGw47jbZPeL3DFSJKau7di9esi97+i/mvWikygaKiLCvca73dt66VOlZ2SLBBmlrOOu9w1YcqqnMWbpktDyJUmx7qd2sRsk6VOMpa18+5EuB9fqKburIJS3CpRttC1kWMQ6/giFlglOEFYPkcXFssIYwAW6Oghdx32/NircQKuLQB6iZWde3H7Vuq68c3OTiRaNM2w56B4r/EM3eyUc6oEl7Hc+ZLFtRWiuVnUR32Y8Dh5DTOLMt4ynaMpgii86cqKDCAUA3Db5zv3sQQkHVwRGtZcVLUphATBpJmPpxMLnqf+rpd6AK72yyNWQlrhbnSPOxDqGYfU9hoEXxvvCdX6siERkqbWCaYNcthWnmBnakQ9j4Z3SnRtEmrLCWwVkdLxTuQWRujuxEJVDHajNzcjDaw5fcAjMJWOUZnmN1aVQ69VhV3j5C6A6GEb7xanMC8tmBLnSTICx20EExrjYaFxDT2ahU+QdP3V6B1pAiWjwefZTo1vhpv4JwwfdmPQFYoxaqUkYumVUKNmvv8WZ5yy0YF7Ly3VIEtsZn9Zc4OkJLsikguVlkusA6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36860700001)(40460700003)(36756003)(82310400004)(356005)(81166007)(33656002)(336012)(186003)(26005)(86362001)(2616005)(54906003)(316002)(4326008)(6862004)(70586007)(70206006)(6506007)(6512007)(53546011)(8676002)(6486002)(508600001)(47076005)(2906002)(8936002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 12:24:13.4759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c828c0-ca72-45fe-fc4a-08d9fab53afd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7168

SGkgUm9nZXIsDQoNCj4gT24gMjUgRmViIDIwMjIsIGF0IDg6MjAgYW0sIFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgRmViIDE1LCAy
MDIyIGF0IDAzOjI1OjE4UE0gKzAwMDAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4ge3JlYWQsd3Jp
dGV9e2wscX0gZnVuY3Rpb24gYXJndW1lbnQgaXMgZGlmZmVyZW50IGZvciBBUk0gYW5kIHg4Ni4N
Cj4+IEFSTSB7cmVhZCx3cmllfShsLHF9IGZ1bmN0aW9uIGFyZ3VtZW50IGlzIHBvaW50ZXIgd2hl
cmVhcyBYODYNCj4+IHtyZWFkLHdyaWV9KGwscX0gZnVuY3Rpb24gYXJndW1lbnQgaXMgYWRkcmVz
cyBpdHNlbGYuDQo+PiANCj4+IHtyZWFkLHdyaXRlfXtsLHF9IGlzIG9ubHkgdXNlZCBpbiBjb21t
b24gZmlsZSB0byBhY2Nlc3MgdGhlIE1TSS1YIFBCQQ0KPj4gc3RydWN0dXJlLiBUbyBhdm9pZCBp
bXBhY3Rpbmcgb3RoZXIgeDg2IGNvZGUgYW5kIHRvIG1ha2UgdGhlIGNvZGUgY29tbW9uDQo+PiBt
b3ZlIHRoZSByZWFkL3dyaXRlIGNhbGwgdG8gTVNJLVggUEJBIHRvIGFyY2ggc3BlY2lmaWMgZmls
ZS4NCj4gDQo+IEkgdGhpbmsgd2UgYWdyZWVkIHdoZXJlIGdvaW5nIHRvIHVuaWZ5IHtyZWFkLHdy
aXRlfXtsLHF9IHNvIHRoZXkgY291bGQNCj4gYmUgdXNlZCBpbiBhcmNoLWFnbm9zdGljIGNvZGU/
DQoNCldlIGFncmVlZCB0byBtb2RpZnkgdGhlIHZQQ0kgTVNJeCBjb2RlIHRvIHVzZSBhIHBvaW50
ZXIsIGJ1dCB0aGF0IG5vdCANCmhlbHBlZCBtZSB0byBtYWtlIGNvZGUgYXJjaC1hZ25vc3RpYy4g
SSBkZWNpZGVkIHRvIG1vdmUgdGhlIFBCQSBoYW5kbGluZyBjb2RlIHRvIGFuIA0KYXJjaC1zcGVj
aWZpYyBmaWxlIHRvIG1ha2UgdGhlIGNvZGUgdXNhYmxlLg0KDQpUaGFua3MgZm9yIHRoZSBzZXJp
ZXMgICJ2cGNpL21zaXg6IGZpeCBQQkEgYWNjZXNlc+KAnSBzZXJpZXMgdGhhdCB3aWxsIGhlbHAg
dG8gdXNlIHRoZSANCmNvZGUgZm9yIEFSTSBhcmNoIGFsc28gd2l0aG91dCBhbnkgbW9kaWZpY2F0
aW9uIHRvIHtyZWFkLHdyaXRlfXtsLHF9IC4NCg0KUmVnYXJkcywNClJhaHVsDQo+IA0KPiBUaGFu
a3MsIFJvZ2VyLg0KPiANCg0K

