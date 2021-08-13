Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B9B3EB16B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Aug 2021 09:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166656.304200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mERas-0001ZF-Jx; Fri, 13 Aug 2021 07:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166656.304200; Fri, 13 Aug 2021 07:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mERas-0001WR-Gc; Fri, 13 Aug 2021 07:27:06 +0000
Received: by outflank-mailman (input) for mailman id 166656;
 Fri, 13 Aug 2021 07:27:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9ox=NE=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mERar-0001WL-7u
 for xen-devel@lists.xenproject.org; Fri, 13 Aug 2021 07:27:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14f422ac-4f5e-4891-a199-b7a1aab9edcd;
 Fri, 13 Aug 2021 07:27:02 +0000 (UTC)
Received: from AM7PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:20b:110::31)
 by AS8PR08MB5877.eurprd08.prod.outlook.com (2603:10a6:20b:291::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Fri, 13 Aug
 2021 07:26:52 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::1f) by AM7PR04CA0021.outlook.office365.com
 (2603:10a6:20b:110::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Fri, 13 Aug 2021 07:26:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Fri, 13 Aug 2021 07:26:51 +0000
Received: ("Tessian outbound 8b41f5fb4e9e:v103");
 Fri, 13 Aug 2021 07:26:51 +0000
Received: from 130f74c92ffb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A4E689D-B6B2-4EE6-A469-858037017277.1; 
 Fri, 13 Aug 2021 07:26:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 130f74c92ffb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Aug 2021 07:26:40 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6412.eurprd08.prod.outlook.com (2603:10a6:10:23d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Fri, 13 Aug
 2021 07:26:38 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%6]) with mapi id 15.20.4415.019; Fri, 13 Aug 2021
 07:26:38 +0000
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
X-Inumbo-ID: 14f422ac-4f5e-4891-a199-b7a1aab9edcd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waBnRL6mZlYP/FHo3pZ55grBJQsKkASeMrp/wNsqN6E=;
 b=6qvwWXIxix74XPvaZzIB6K6ItFu98WxJEAd9mJmlQd2kR5FXBUfoIFi37agJ2YTFq0v208rcm8dK1H9/6nTV8wBBBdwNQAeOfYAtgHMmHC7HKY7OvQRZ5QATyScfhOQPy+hgfyfOe7qNEUCuJilchYtVtGaEO3GbILiRdFBRD0E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1YLTtOQ2psqFrzwrR5MIoDbY6CUyNBsptglAILBj1VOorMGU+gLWlrUBtHS9xB/eeE39vf0DsyZGrigaaNHpLhGg2NJp+02aokHaCD9BDpJQcetsozy+mWLXXz+41sWXmXoJNoWdIRBrEarn686Y1GIua14slHYilzdLrLh1Q7EkfQOiAjv+JH9jTALWfiSLRLJuQxYeSeP1rIwGEhh3sUU7WL9vjVIeSxIs/4Rz9OqdGN0oEnSnxGDzrTGuRJYUXAKnkjhAKugtUXxgnshcpzeoHpWyAIa69D7quLj89X56wNiq/h1Sldobjqe0r8UEo3mFvVYVW25qa9z5LK7JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waBnRL6mZlYP/FHo3pZ55grBJQsKkASeMrp/wNsqN6E=;
 b=dhOxhHrtmrRZx1YHgSzhAyDQFNX2lTTN+aBgzQkgMzXK+blZeypRPK8Jc8MUJUuJpnQtT2BlqCH91DVU//yCBJfwASGOsYd2IuFzSxVtEn+ZApEuh6tDFKP0HA8oMcXu6sWeFXmi7kYFoUtnVSQrXlh4pweFb5UNNj+2iQcsvGLTRnsbBjyG9Jhjbhm5BFWuSIp93wbHwRil+KYoFdN6H073McmjZ1dK2G4BwvGAWo97lWB4wKG+XPMDzWI/cFuVDIxAaqTZ/FN2qKJB6lgoLOqitQfDJdpYWcPqBpv/KNjPoUQclVs5E40zG6u2a4jZZI1yd5rTuN2zdhV9MQ58Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waBnRL6mZlYP/FHo3pZ55grBJQsKkASeMrp/wNsqN6E=;
 b=6qvwWXIxix74XPvaZzIB6K6ItFu98WxJEAd9mJmlQd2kR5FXBUfoIFi37agJ2YTFq0v208rcm8dK1H9/6nTV8wBBBdwNQAeOfYAtgHMmHC7HKY7OvQRZ5QATyScfhOQPy+hgfyfOe7qNEUCuJilchYtVtGaEO3GbILiRdFBRD0E=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [XEN RFC PATCH 03/40] xen/x86: Initialize memnodemapsize while
 faking NUMA node
Thread-Topic: [XEN RFC PATCH 03/40] xen/x86: Initialize memnodemapsize while
 faking NUMA node
Thread-Index: AQHXjpsc6z0fOQXTYEKFO+6xoMr0S6twAXCAgAECu5A=
Date: Fri, 13 Aug 2021 07:26:38 +0000
Message-ID:
 <DB9PR08MB68571676C6528B0AA56CB1659EFA9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-4-wei.chen@arm.com>
 <106dff13-e997-db8d-babf-0d6a73146ca3@suse.com>
In-Reply-To: <106dff13-e997-db8d-babf-0d6a73146ca3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9302568A130EB449BFFB7C695C85EF43.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 51a8d2fe-ca10-4890-c695-08d95e2bb84d
x-ms-traffictypediagnostic: DB9PR08MB6412:|AS8PR08MB5877:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB5877F3FBB2F95A06C9B687039EFA9@AS8PR08MB5877.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VvD0YaOONismAnExJSMh+G9A3lYBbE7FCcOOJJ+UmTRavpJkfMHs5GGj52C24gfWPKxs6E87sZkd1gJVszCAJxcSU5Y2s6yioIhKY9nNf5qGqDLg7ohS09pkJ6yXQeHitBo0tTKMmGEF7OpVNC3gxjyn2LTersX/1hkjOHoIzbTMLfSo292wQYP/CVEDiS7r4QCxR9R/9tJHs1JEJojMBI8E8DyDcLa3pD+uSnX8pfjuPtCbdpwbwpRq71zNs//XA5sf9Y+eyQfFGsrS+K7JalxhWx/43+1Ad+iJTEGNWHaqjYW3kwr/z9EorPfFiNu9L8a5SCFhhoDb3Jopq7c9rAh1EowUe/izRd7riJ9kRdOzQxPOaONp9pLC5uVt0v1qkeqqq1fvYFpJYRJH7XMfVy3BBhxebPPFwSOa/pkviCpfQTXTNO2HUVRecKYwJNuuypHpQUHHglbZXSTWPWgy+G34A0bqjojW54p2c9O63dXRvhd3FMKvhzGcJqToarSdhtHHJJyRkIguBgEWeoRVavncKyjT1FIFadq7q4qsD/zuB5hSiKkHHE4tq5RmKtaUJIl16JbHBiW2vHLsnysPdEANBtUdixQhhZEHhoIhlMcy0fSeGsy3ytpMqL0GHErvNFok+jgXj6DbmcwRABN25I0x20SN7clrtn8CEmU5JDVV7KD4LEaeCdo44i+uCRQ7xU2kOnGSaLzphSt3ecTT6g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(346002)(366004)(376002)(83380400001)(8676002)(86362001)(33656002)(478600001)(2906002)(316002)(6916009)(186003)(66446008)(52536014)(4326008)(66476007)(66946007)(64756008)(26005)(9686003)(66556008)(7696005)(8936002)(38070700005)(54906003)(53546011)(6506007)(5660300002)(76116006)(71200400001)(38100700002)(55016002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ekJkc0U4TGJaTkxEamNRb2lWZzJBeHdDMk91dkdVTnhGYkZaeXNVUHNXTkNI?=
 =?utf-8?B?UjVqY1FzWWhLWEExY3FpRVhBQ092TW1sYWV1dG9yK2VjNU5TSmVhVjd6TmRK?=
 =?utf-8?B?S1ZOZE84YzBNcUFNaFZIM0xlSWlReWlIa1V4WmRmRi94TVYyY1pjaVBuN3ZC?=
 =?utf-8?B?d1VPU0RJa2JpNXZMMVoyQlMvcmJSOGlCcVpQZW5HblFrTm04a3NaUWNNRHFs?=
 =?utf-8?B?RFpjRDNMK2RYZFhyWGwwWTAxSjFIVWNPaFJFU2JXNFozQW1UK3BUSk5sa1k4?=
 =?utf-8?B?dEJXR2M2d0FSRWlGejF3ditudzFiYlNndnNkZ1llYUlQQThEanpuWUpaNzBT?=
 =?utf-8?B?NFBoUklHREhCNmluR0ZabDBnQ3FUcXkreFptU1l6TEp6VVlQcC9GMzRFc1Jr?=
 =?utf-8?B?bDhRYkZIM0orTDA5TTdBUTkyVmdDb29QbUxGbm5jVzMxRndKM1dIN01TamtV?=
 =?utf-8?B?ckh1eDJtYUZDV3ZZQk9YZS96SG1HWW91eWZGeDgwanJ6MXNueHpLSEw0bXpo?=
 =?utf-8?B?ZkVwVzZvanRidzMvc0pZVW5oVnc4NnpmcWNhY1ROVXhSSkJ4V25HQjBhQUR0?=
 =?utf-8?B?OThNY3NZZHdLZEZBVGdaT051OForb2luZDNZc1JmYlExRWU0TFF6aXlPcEFX?=
 =?utf-8?B?Nkkvc2NvM2pURWI3ZGxuYnpVYmxlTWI5TUFoZGkzNVNoTm5qMDhQeTNiNFZP?=
 =?utf-8?B?NjQxSjZFbmtTMTZ5TFVRWmhQcGtsVURuNE1mSTVIbmFWV1BTYlJpYjVGcVZ6?=
 =?utf-8?B?a2I1UG9SZ282WnRnSm1JSk1wdWlqVUtXaldTZHI0NzE4VGdCcG9wVm81OXVv?=
 =?utf-8?B?bDBsUHB2OGlPM0dHZVdLSG1XU2VuNWx2SDNSNGlZNDRHekxKUkxPckdTbjVG?=
 =?utf-8?B?OEZWc1hIcVFYd2RSMlplQnNjaUhaN056ZkFjcGhtelJycEN1SG5QRzZld0Zo?=
 =?utf-8?B?K0kxSHJuUk5vT1BmSzVKODUwNXhwenZPTVl1VTZyNGphRXRVb2hCNi81QUVW?=
 =?utf-8?B?ZUUyZXZFWCtNWTMwR1oyWHpvdXhCTkpvRkZtL25IblR2ZzBpTVRaZE1KQWJM?=
 =?utf-8?B?ODZoRC85cFhxSHZOM3NDbVEveDFpT1JvNzZWVEFuaktncmhBa1JWUkJDamg1?=
 =?utf-8?B?c3hPc0hTYWsvZkM3RjN6WEJzeFQ2cHRFWUFCK2tXR2xSTEhEVU9uNGhFQ0Rp?=
 =?utf-8?B?UXpZTkVUUHBJV1c3UWpWV2Q3UDV4RE1oR0lZSWZLZVo1ZWpXcG4vTXVMTmdR?=
 =?utf-8?B?Ukxad0xOQkIya0FPcDcxblRUTjhPaVcvVlFUR0RHc0pjRm8xK3AxcWdWN243?=
 =?utf-8?B?ME5qSUwwcy9nMW5pcWZhbC9xM1QvbHVtNm5NSmw3VDA0Vi9lVDNjME92c2Vj?=
 =?utf-8?B?bzhNU25QTzdEdmE1UUVSOUZLYWRZa2MrZ3cwUVl6eVhiK3VCMUR2Z2o0QTF5?=
 =?utf-8?B?YmJzVFl6N0xBbEVBaDhqMU94UW0ycC92cVpETUZOeXUxT2JRV21COE1oa1dh?=
 =?utf-8?B?b3RENll2aVRGUjBWV3BwNVFjbWFBUG5Ja20wRThHRGZHQ29yZFJTREZtaHdl?=
 =?utf-8?B?Y3JZakZrQkM0ck5zR1NVVkRUVjFDY3p4TVh0S2lCK3NaMUhad1lUWVNWeWtz?=
 =?utf-8?B?WmNEa2RFWC82Qk9iWENuT1dtTTNPdXZudEUxL0tKdWROVDZoa21NQ3ZuZjc4?=
 =?utf-8?B?QWNEMEQ3NHo3ZFJrVkcxckdENTA0aUsvc3IzUjQ4WXBGNjc0ZlJEbTlZcTZt?=
 =?utf-8?Q?p2zuKnoA94ya2OELs1thfdP092X76cVuS9gryAH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6412
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae1ba68e-38ae-4a13-373c-08d95e2bb08d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DGy81ql8dhE6WdVXCXx/CK1CLZIz6RZOPda1JKuFUlVaa6z4MjxTAh7NYBDfv5zo8DwQpv6fWAivQOs+n4sE1kFyFTqlqpD/yVnYFdqdsWoOWlQWqX4kOvl6QiaxsDQju2bUmPUjdn1XYyyfK4ESr7tswqsQrcxWV/NST2/IIRardgMYROxLJ54SVmpHl/oNUTu82g3SODxFTXwAd85YeRtPMBuE00jO+RuccRVNDIyWualgSLw+sRQ6vkvhCGBYQINS6/MT6noqT11xrn08VeCa5Erg2vv0jYGNICQPpYJ8cJSJ4QLH/QaWEmxaNW3fZkShulEgVMhjNJDKXIDqwsiYyoQvTtr+3PwsV1S558vAEhauhRa4UDdPrr3dRiFUv4VHxZcTYpVWps1Sr6uS72nM8cHI2oe66rUhB3B+C3bnkg+S7cVAL620lG2myLxxP2w3czGYSj1r5WzsLfderyeDsNNh2GjUiZII+1yX10S5UDVjUjKJOGdmeute4ZCvDMjn9wtgh9OPe5kcZfyE4lT79nloOMnZhfsty1BX59Tj2qGoHnxHFLvfOuifDYZPODlbTYxpfGEt9hgWViinwSh22fhdURX+SfhQysmFl61WfIkRrWMHOTcNh6DfumkjF1sBquqSzl3VtMx2cbHEDwhagHXx72QpsWqk7uDIyHyhhDf9PpMCA54Z8ejmg9BiW1hlXL1K2ZI2viWo/kd63g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(376002)(136003)(36840700001)(46966006)(55016002)(36860700001)(5660300002)(81166007)(82740400003)(186003)(356005)(8936002)(8676002)(478600001)(70206006)(52536014)(86362001)(53546011)(2906002)(9686003)(6506007)(26005)(336012)(83380400001)(6862004)(33656002)(47076005)(316002)(4326008)(54906003)(7696005)(70586007)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2021 07:26:51.7745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a8d2fe-ca10-4890-c695-08d95e2bb84d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5877

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDjmnIgxMuaXpSAyMzozMw0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDMvNDBdIHhlbi94ODY6IEluaXRpYWxpemUgbWVtbm9kZW1h
cHNpemUNCj4gd2hpbGUgZmFraW5nIE5VTUEgbm9kZQ0KPiANCj4gT24gMTEuMDguMjAyMSAxMjoy
MywgV2VpIENoZW4gd3JvdGU6DQo+ID4gV2hlbiBzeXN0ZW0gdHVybnMgTlVNQSBvZmYgb3Igc3lz
dGVtIGxhY2tzIG9mIE5VTUEgc3VwcG9ydCwNCj4gPiBYZW4gd2lsbCBmYWtlIGEgTlVNQSBub2Rl
IHRvIG1ha2Ugc3lzdGVtIHdvcmtzIGFzIGEgc2luZ2xlDQo+ID4gbm9kZSBOVU1BIHN5c3RlbS4N
Cj4gPg0KPiA+IEluIHRoaXMgY2FzZSB0aGUgbWVtb3J5IG5vZGUgbWFwIGRvZXNuJ3QgbmVlZCB0
byBiZSBhbGxvY2F0ZWQNCj4gPiBmcm9tIGJvb3QgcGFnZXMuIEJ1dCB3ZSBzaG91bGQgc2V0IHRo
ZSBtZW1ub2RlbWFwc2l6ZSB0byB0aGUNCj4gPiBhcnJheSBzaXplIG9mIF9tZW1ub2RlbWFwLiBY
ZW4gaGFkbid0IGRvbmUgaXQsIGFuZCBYZW4gc2hvdWxkDQo+ID4gYXNzZXJ0IGluIHBoeXNfdG9f
bmlkLiBCdXQgYmVjYXVzZSB4ODYgd2FzIHVzaW5nIGFuIGVtcHR5DQo+ID4gbWFjcm8gIlZJUlRV
QUxfQlVHX09OIiB0byByZXBsYWNlIEFTU0VSVCwgdGhpcyBidWcgd2lsbCBub3QNCj4gPiBiZSB0
cmlnZ2VyZWQuDQo+IA0KPiBIb3cgYWJvdXQgd2UgcHJvbW90ZSBWSVJUVUFMX0JVR19PTigpIHRv
IGV4cGFuZCB0byBhdCBsZWFzdCBBU1NFUlQoKT8NCj4gDQoNClRoYXQgd291bGQgYmUgZ29vZC4g
RnJhbmtseSwgd2UgZGlzY292ZXJlZCB0aGlzIGJlY2F1c2Ugd2UgdXNlZCBBU1NFUlQNCmluIEFy
bSBhbmQgdGhlbiBub3RpY2VkIHRoYXQgeDg2IHdhcyB1c2luZyBWSVJUVUFMX0JVR19PTi4NCg0K
PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9udW1hLmMNCj4gPiArKysgYi94ZW4vYXJjaC94ODYvbnVt
YS5jDQo+ID4gQEAgLTI3MCw2ICsyNzAsOCBAQCB2b2lkIF9faW5pdCBudW1hX2luaXRtZW1faW5p
dCh1bnNpZ25lZCBsb25nDQo+IHN0YXJ0X3BmbiwgdW5zaWduZWQgbG9uZyBlbmRfcGZuKQ0KPiA+
ICAgICAgLyogc2V0dXAgZHVtbXkgbm9kZSBjb3ZlcmluZyBhbGwgbWVtb3J5ICovDQo+ID4gICAg
ICBtZW1ub2RlX3NoaWZ0ID0gQklUU19QRVJfTE9ORyAtIDE7DQo+ID4gICAgICBtZW1ub2RlbWFw
ID0gX21lbW5vZGVtYXA7DQo+ID4gKyAgICBtZW1ub2RlbWFwc2l6ZSA9IEFSUkFZX1NJWkUoX21l
bW5vZGVtYXApOw0KPiANCj4gQnV0IHRoaXMgZG9lc24ndCByZWZsZWN0IHJlYWxpdHkgdGhlbiwg
ZG9lcyBpdD8gV2UnZCByYXRoZXIgd2FudCB0bw0KPiBzZXQgdGhlIHNpemUgdG8gMSwgSSB3b3Vs
ZCB0aGluay4NCj4gDQoNClllcywgeW91J3JlIHJpZ2h0LiBBY3R1YWxseSwgd2UganVzdCBvbmx5
IHVzZWQgMSBzbG90LiBCdXQgZnVydGhlcm1vcmUsDQptZW1ub2RlbWFwWzBdIG1heSBiZSBzZXQg
aW4gYWNwaV9zY2FuX25vZGVzLCBidXQgYWNwaV9zY2FuX25vZGVzIGRvZXNuJ3QNCnJlc2V0IG1l
bW5vZGVtYXAgd2hlbiBpdCBmYWlsZWQuIEkgdGhpbmsgbWF5YmUgd2UgY2FuIGFkZDoNCiAgICBt
ZW1ub2RlbWFwWzBdID0gMDsNCiAgICBtZW1ub2RlbWFwc2l6ZSA9IDE7DQpIb3cgZG8geW91IHRo
aW5rIGFib3V0IGl0Pw0KDQo+IEphbg0KDQo=

