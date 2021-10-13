Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E142BBBF
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 11:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208127.364162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maagK-0001i3-Fp; Wed, 13 Oct 2021 09:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208127.364162; Wed, 13 Oct 2021 09:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maagK-0001fr-Bq; Wed, 13 Oct 2021 09:36:16 +0000
Received: by outflank-mailman (input) for mailman id 208127;
 Wed, 13 Oct 2021 09:36:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0M7b=PB=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maagJ-0001fl-Fs
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 09:36:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.65]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 275cf0a6-3c67-404f-b862-6c84931855ce;
 Wed, 13 Oct 2021 09:36:13 +0000 (UTC)
Received: from AM6P193CA0098.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::39)
 by AM5PR0802MB2484.eurprd08.prod.outlook.com (2603:10a6:203:a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 09:36:10 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::1d) by AM6P193CA0098.outlook.office365.com
 (2603:10a6:209:88::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 09:36:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 09:36:09 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Wed, 13 Oct 2021 09:36:09 +0000
Received: from 7fe779da9699.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D78291B1-78A8-4E0C-8C38-9797000B114C.1; 
 Wed, 13 Oct 2021 09:36:03 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7fe779da9699.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Oct 2021 09:36:03 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB5498.eurprd08.prod.outlook.com (2603:10a6:10:11c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 09:36:01 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 09:36:01 +0000
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
X-Inumbo-ID: 275cf0a6-3c67-404f-b862-6c84931855ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raRbqoRtl/8bp6k7UArUhXheVAvcHhHyfZT2zcMkpak=;
 b=qa98AzczCJPCrGJQxTGRHoXSeeN0Eqb8f3LfoQI96BGvS6W7wYgdXEj/pI1OyGMmLnT6ap3VLF0CSN7lkWrTMZ1U0H7AQ+N5CpVj9rnaAMSTRcutxJqPfAG6pKgFB79nWHIZ7IE1fZ8LnATwWbaeb44C7qE6sDZEyAH5Dx05ecE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e4f8158cbb334bb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ME+fXWM+d2UKijXHSJjmcFCr8cNVgrgkBRbbrSD5YncTXemca1YBxx7wy7sMB91OGapB7Bur2j855cqIKvHhrKlNrfDYQqWzLnmPRBqRfEM+40KpiMrFx17JoLP9hl5x8D5L3e3pqb7IT1lp5HuZLPSTUrNt3UDoSNc0lPXLovQXamMgl14/6BITyOyI+R4I8H4eo8I+rIT71197uVVKfUiQnyWgH8wpidrg2n5aJrrttLkm6SihZynf+cYa5z7dsh6KC61FispjMx04YopcNJH+qhVQVS6E4bA+ceGr+6e+PFIXIS6UG20RqrV29MoOqNYoITlFM8I0grubZMuL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raRbqoRtl/8bp6k7UArUhXheVAvcHhHyfZT2zcMkpak=;
 b=FlDQav6QF/Pcw51AVz0vRXRQ0xOV+NKJ/4HWKFzATzKMAgWOtRsmzCboTzCtAJs3o8r4yXQ3a29+SxF5yPrwCZHCPf7agVdUCpwX6/UlLJviED4OSz7NPRvz6mNiclQefjtvD2ueYE/rsfTFWSZQ9lN/O8N8mnW3OxOFA2kTMOh1//fkjV/MsSgbIfpeDswSDKTL41hVqm3XNBQAO1PFgR0jqH9s1VCVSp+VTWW6dAX6COMABZrj2Vaf1bIulDONjkJBgKRApxZ3S1cqm8Jp/41YnYzg/8roMoIf4bcEa5fLsiNUPweo2gig3yk5HSzQlIWha89J8c9dG8JRzkgR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raRbqoRtl/8bp6k7UArUhXheVAvcHhHyfZT2zcMkpak=;
 b=qa98AzczCJPCrGJQxTGRHoXSeeN0Eqb8f3LfoQI96BGvS6W7wYgdXEj/pI1OyGMmLnT6ap3VLF0CSN7lkWrTMZ1U0H7AQ+N5CpVj9rnaAMSTRcutxJqPfAG6pKgFB79nWHIZ7IE1fZ8LnATwWbaeb44C7qE6sDZEyAH5Dx05ecE=
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
Thread-Index: AQHXutmFlM61oLukkkqK7dSQSsVJ1qvNjrkAgAGmMoCAAW6PgIAAEkkA
Date: Wed, 13 Oct 2021 09:36:01 +0000
Message-ID: <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
 <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com>
 <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
In-Reply-To: <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 66fd4687-db23-4e51-2506-08d98e2ce3ac
x-ms-traffictypediagnostic: DB8PR08MB5498:|AM5PR0802MB2484:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB248429723BD137459C4D54DF9DB79@AM5PR0802MB2484.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F7g6wkn4G0EJSYjAHyDYbYSGJQj9JhvG9Dd5ZIvBwEGXzDcSYK7CIBzoryGD9/i2nC7BoJLa25prux/a2XGIQHzHabo6dY/Hcfr+84tBvUZs74JpSHDMrEadK37lMQjcX3EWxHqwLA664c/Zvv80fI7MoT1kApNOQCj3jzTva81FD6HhABSCOY4p3k/2QZJf4EtrV1V9efu3504UVik4SRuUZ5BCoxtlAkskt2XStl1Ugfs1qSO1E6keSg5aznVTVyYW9AFyE+ws1RC1fDA9iR1Y0HeeDDR3z4NSpYvfSc1SeXiAwe4oeS3fXS/twWKWA+M+Ff5mpgyRR2r1rnAjJhp1R3doY2A5LRwpHetk+xDAMwPCWgqKwQlDwjlsjwkQ60WBTpsI5vNlGbntemoqJfvJ7h1tczjYHWVUHc+dzZmn/KT9snns7YyDfhfWeVYYxwLtQCqymIM+kXEaS3jUXjQFua6o1TTzlKisakcHm39MVBveEBUvl2Ck5LDSIaJcoiNX+gggvM9K4c0OfU7WneOUHqzpS6AVZBEpNF3ZRLLRSEYD97c7wKmKhRvTM/WXNQ9bkZkTqLiQk2J4IAHlqxLLUeAlMfkK+ZDIJdSQyb9Vb6oeOFJLGqZmM0mUEq3nySc6v28cB+tdBKtIzQy/DnarIWHUlXE6SAjCbyDhNpJMDeNEL6qqVoxTiKVYhOTk4MBrz2LLsfIxmMJnpnXln7Gs9Ot2jAejc6z1ul+6z10PaEGtNIg6qCBNZmHT1/i6
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(66946007)(64756008)(66556008)(66476007)(8676002)(53546011)(508600001)(91956017)(6486002)(36756003)(2906002)(83380400001)(122000001)(38100700002)(4326008)(6916009)(71200400001)(5660300002)(76116006)(33656002)(316002)(8936002)(54906003)(26005)(7416002)(6506007)(38070700005)(186003)(86362001)(2616005)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECCCBE60E4886B4F811E862C4DF8CDE9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5498
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fb16cd06-d26e-4481-43a7-08d98e2cded0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cij4UHeoWEFvHx+6FJvIzTMkG5Qk4jeGo8SGqa2r+a4EqXejIYP56S26RC97NDcr1cktIjLZYRcbqTNpCjtOY0mxqNQ5i8WqTJHYdYN8L6VJYQtlBF+dp1He1cmV0SG+JkEj4dmOEq0D1Pey0M7xZgZXQZsCN9ifedaq0SgEZCJCQBKIdIeInlcMoGhRTtq89HoW4wJIgNdUQgwPleFb5LdkVz3e4DzjiEWhW0VU6pu+IhV0GIwXYpUI3avaRIJyiGLvAYJXGKNmGaH9PaCDg9HOuKHI1aeNDkLrYq42rwN64wKRa/AekHsqPLrEhnN/TtaBXLuUr0U7L6mhQVrqxbMoMKZBu7MREUEP89++eqpwE5mLc9wxOCHWsRQOzRHwUn7Rijs5KkidiMMUkZ60ScPNRY+4+h1p0mtsHjoUT3bk/CrcAuaQqxGsH1RylD6j00DROMG+llubMo44qn/XOBJPL5N2CVlP8jmtt4tJvlGe3ZAK29bcjIouFdK2TcfAOVuf+O42Ll2+jPa6hC8jvq7mrBnysieOHgBjC7GZ9zfdDF26E2Am9NjL/8dGJWIebUCW9i9+oa8VFOvIbEALMkDRsaCzZrr5MJy09hAhL2oU8ZhglX8Hx+w7LlgwPu10cxRFSZAYrtbt5aKe0CFaq2Y1qWdt94IjH+6oDgyIHm9vgkguiNZvWiQbuPZzpCqazXZUBg4i5PBgBY1yqsyVMA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(82310400003)(316002)(6862004)(8936002)(5660300002)(81166007)(6512007)(70206006)(2616005)(356005)(26005)(4326008)(83380400001)(186003)(107886003)(54906003)(36756003)(508600001)(47076005)(8676002)(336012)(33656002)(6486002)(86362001)(6506007)(2906002)(70586007)(36860700001)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 09:36:09.7951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fd4687-db23-4e51-2506-08d98e2ce3ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2484

SGkgUm9nZXIsDQoNCj4gT24gMTMgT2N0IDIwMjEsIGF0IDA5OjMwLCBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIE9jdCAxMiwgMjAy
MSBhdCAxMjozODozNVBNICswMjAwLCBNaWNoYWwgT3J6ZWwgd3JvdGU6DQo+PiBIaSBSb2dlciwN
Cj4+IA0KPj4gT24gMTEuMTAuMjAyMSAxMToyNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+
PiBPbiBXZWQsIE9jdCAwNiwgMjAyMSBhdCAwNjo0MDozM1BNICswMTAwLCBSYWh1bCBTaW5naCB3
cm90ZToNCj4+Pj4gSW50cm9kdWNlIFhFTl9ET01DVExfQ0RGX3ZwY2kgZmxhZyB0byBlbmFibGUg
VlBDSSBzdXBwb3J0IGluIFhFTi4NCj4+Pj4gUmVqZWN0IHRoZSB1c2Ugb2YgdGhpcyBuZXcgZmxh
ZyBmb3IgeDg2IGFzIFZQQ0kgaXMgbm90IHN1cHBvcnRlZCBmb3INCj4+Pj4gRE9NVSBndWVzdHMg
Zm9yIHg4Ni4NCj4+PiANCj4+PiBJIGRvbid0IGxpa2UgdGhpcyBhcHByb2FjaCwgWEVOX0RPTUNU
TF9DREZfdnBjaSBzaG91bGQgYmUgc2V0IGZvciB4ODYNCj4+PiBQVkggZG9tMCwgbGlrZSB3ZSBk
byBmb3IgYW55IG90aGVyIENERiBmbGFncyB3aGVuIFhlbiBidWlsZHMgZG9tMC4NCj4+PiANCj4+
PiBUaGluZ3MgbGlrZSBQVkggdnMgUFYgZ2V0IHRyYW5zbGF0ZWQgaW50byBDREYgZmxhZ3MgYnkg
Y3JlYXRlX2RvbTAsDQo+Pj4gYW5kIHByb2Nlc3NlZCBub3JtYWxseSBieSB0aGUgc2FuaXRpc2Vf
ZG9tYWluX2NvbmZpZyBsb2dpYywgdlBDSQ0KPj4+IHNob3VsZCBiZSBoYW5kbGVkIHRoYXQgd2F5
Lg0KPj4+IA0KPj4+IERvIHlvdSB0aGluayB5b3UgY291bGQgc2VlIGFib3V0IGZpeGluZyB0aGlz
Pw0KPj4+IA0KPj4+IFRoYW5rcywgUm9nZXIuDQo+Pj4gDQo+PiANCj4+IEkgaGF2ZSBvbmUgcXVl
c3Rpb24gYWJvdXQgdGhpcyBmaXguDQo+PiBJZiBJIHNldCBYRU5fRE9NQ1RMX0NERl92cGNpIGZv
ciBkb20wIHB2aCBpbiBjcmVhdGVfZG9tMCwgdGhlbiBpbg0KPj4gc2FuaXRpc2VfZG9tYWluX2Nv
bmZpZyBvciBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcgSSBoYXZlIG5vDQo+PiBrbm93bGVk
Z2Ugb24gd2hldGhlciBJIGFtIGRvbTAgb3Igbm90LiBJIGNhbiBjaGVjayBpZiBJJ20gUFZIIGJ1
dCBub3QgaWYgZG9tMC4NCj4+IFRoaXMgd291bGQgYmUgbmVlZGVkIHRvIGFkZCBhIHdhcm5pbmcg
aWYgdGhpcyBmbGFnIGlzIHNldCBidXQgd2UgYXJlIG5vdCBkb20wIHB2aC4NCj4+IA0KPj4gQW55
IGlkZWFzPw0KPiANCj4gSSd2ZSBqdXN0IHJlYWxpemVkIHRoaXMgaXMgbW9yZSB3cm9uZyB0aGF0
IEkgdGhvdWdodC4gdlBDSSBpcw0KPiBzaWduYWxlZCBvbiB4ODYgaW4geGVuX2FyY2hfZG9tYWlu
Y29uZmlnLmVtdWxhdGlvbl9mbGFncywgc28NCj4gaW50cm9kdWNpbmcgYSB0b3AgbGV2ZWwgb3B0
aW9uIGZvciBpdCB3aXRob3V0IHJlbW92aW5nIHRoZSBhcmNoDQo+IHNwZWNpZmljIG9uZSBpcyB3
cm9uZywgYXMgdGhlbiBvbiB4ODYgd2UgaGF2ZSBhIGR1cGxpY2F0ZWQgb3B0aW9uLg0KPiANCj4g
VGhlbiBJJ20gYWxzbyBub3Qgc3VyZSB3aGV0aGVyIHdlIHdhbnQgdG8gbW92ZSBpdCBmcm9tDQo+
IGVtdWxhdGlvbl9mbGFncywgaXQgc2VlbXMgbGlrZSB0aGUgbW9yZSBuYXR1cmFsIHBsYWNlIGZv
ciBpdCB0byBsaXZlDQo+IG9uIHg4Ni4NCj4gDQo+IElmIHdlIHJlYWxseSB3YW50IHRvIG1ha2Ug
dlBDSSBhIENERiBvcHRpb24gd2UgbXVzdCBkZWFsIHdpdGggdGhlDQo+IHJlbW92YWwgb2YgWEVO
X1g4Nl9FTVVfVlBDSSwgb3IgZWxzZSB5b3UgY291bGQgaW50cm9kdWNlIGFuIGFyY2gNCj4gc3Bl
Y2lmaWMgZmxhZyBmb3IgdlBDSSBvbiBBcm0uDQoNCkZpcnN0IGlzc3VlIHRoYXQgd2UgaGF2ZSBo
ZXJlIGlzIHRoYXQgdGhlcmUgaXMgbm8gZW11bGF0aW9uX2ZsYWdzIHJpZ2h0IG5vdyBvbiBhcm0u
DQoNClNvIEkgdGhpbmsgdGhlcmUgYXJlIDIgc29sdXRpb25zOg0KDQotIGludHJvZHVjZSBQSFlT
Q0FQLiBUaGUgcHJvYmxlbSBoZXJlIGlzIHRoYXQgaXQgaXMgbm90IGEgcGh5c2ljYWwgY2FwYWNp
dHkgYW5kDQpJIHRoaW5rIHRoYXQgd2lsbCBoaXQgdXMgaW4gdGhlIGZ1dHVyZSBmb3IgZXhhbXBs
ZSBpZiB3ZSB3YW50IHRvIHVzZSB2cGNpIGZvciBWSVJUSU8NCmV2ZW4gaWYgdGhlcmUgaXMgbm90
IHBoeXNpY2FsIFBDSSBvbiB0aGUgcGxhdGZvcm0uDQoNCi0gaW50cm9kdWNlIGFuIGVtdWxhdGlv
biBmbGFnIG9uIGFybS4gVGhlIHByb2JsZW0gaGVyZSBpcyB0aGF0IHRoZXJlIGlzIG5vIGVtdWxh
dGlvbg0KZmxhZyByaWdodCBub3cgb24gYXJtIHNvIGFkZGluZyB0aGlzIGZlYXR1cmUgd2lsbCBy
ZXF1aXJlIGEgY2hhbmdlIG9mIGludGVyZmFjZSBpbg0KYXJjaC1hcm0uaCBhbmQgaW4geGVuIGRv
bWN0bCBpbnRlcmZhY2UuIEJ1dCBpZiB3ZSBpbnRyb2R1Y2Ugb25lIG9uIEFybSwgaXQgd291bGQg
YWxsb3cNCnRoZSB0b29scyB0byBjaGVjayBpZiBDREZfdnBjaSBjYW4gYmUgc2V0IG9yIG5vdCB3
aGljaCB3b3VsZCBzb2x2ZSBjdXJyZW50IGlzc3Vlcy4NCg0KSSB0aGluayB0aGUgc2Vjb25kIHNv
bHV0aW9uIGlzIHRoZSByaWdodCBvbmUgYnV0IGl0IGNhbm5vdCBiZSBkb25lIHNvIG5lYXIgZnJv
bSB0aGUNCmZlYXR1cmUgZnJlZXplLg0KDQpUaGUgQ0RGIGZsYWcgYXMgaW50cm9kdWNlZCByaWdo
dCBub3cgaXMgbm90IGNyZWF0aW5nIGFueSBpc3N1ZSBhbmQgd2lsbCBiZSB1c2VkIG9uY2UNCnRo
ZSBlbXVsYXRpb24gZmxhZyB3aWxsIGJlIGludHJvZHVjZS4gV2Ugd2lsbCBiZSBhYmxlIGF0IHRo
aXMgc3RhZ2UgdG8gc2V0IHRoaXMgcHJvcGVybHkNCmFsc28gb24geDg2IChmb3IgZG9tMCBwdmgp
Lg0KTW9yZW92ZXIga2VlcGluZyBpdCB3aWxsIGFsbG93IHRvIGNvbnRpbnVlIHRvIG1lcmdlIHRo
ZSByZW1haW5pbmcgcGFydCBvZiB0aGUgUENJDQpwYXNzdGhyb3VnaCB3aGljaCBhcmUgb3RoZXJ3
aXNlIG5vdCBwb3NzaWJsZSB0byBiZSBkb25lIGFzIHRoZXkgYXJlIGRlcGVuZGVudCBvbiB0aGlz
IGZsYWcuDQoNCkNhbiB3ZSBhZ3JlZSBvbiBrZWVwIHRoZSBET01DVExfQ0RGX3ZwY2kgZmxhZyBh
bmQgaW50cm9kdWNlIHRoZSBlbXVsYXRpb24NCmZsYWcgb24gQXJtIGFmdGVyIDQuMTYgcmVsZWFz
ZSA/DQoNCkNoZWVycw0KQmVydHJhbmQNCg0K

