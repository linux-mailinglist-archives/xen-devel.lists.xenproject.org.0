Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65C4FB683
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 10:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302745.516474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndpoq-0007uO-4P; Mon, 11 Apr 2022 08:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302745.516474; Mon, 11 Apr 2022 08:54:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndpoq-0007sQ-1A; Mon, 11 Apr 2022 08:54:44 +0000
Received: by outflank-mailman (input) for mailman id 302745;
 Mon, 11 Apr 2022 08:54:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dfOQ=UV=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ndpoo-0007sK-NH
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 08:54:42 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06a519fb-b975-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 10:54:41 +0200 (CEST)
Received: from DU2PR04CA0290.eurprd04.prod.outlook.com (2603:10a6:10:28c::25)
 by DBBPR08MB4888.eurprd08.prod.outlook.com (2603:10a6:10:db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 08:54:26 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::63) by DU2PR04CA0290.outlook.office365.com
 (2603:10a6:10:28c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 08:54:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Mon, 11 Apr 2022 08:54:26 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Mon, 11 Apr 2022 08:54:26 +0000
Received: from cc78e266f94b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5807EA48-B95C-4E03-A570-D2CCE3E93A43.1; 
 Mon, 11 Apr 2022 08:54:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc78e266f94b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Apr 2022 08:54:16 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by HE1PR0801MB2011.eurprd08.prod.outlook.com (2603:10a6:3:49::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 08:54:12 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 08:54:12 +0000
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
X-Inumbo-ID: 06a519fb-b975-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnbKtJligJnRP+5Lj7UlTsJYXM05nvpkuqK7qPSGwYw=;
 b=i8PR6jMAWft4uvIDlAGoTkRVXfd4fBYZbeSPwGGpFEOfAKTTiZTQx2WC/xqGUuuOLD4aQcHhYS7SXgC6cgUvV7wrgb5OeT3CM68pokbiIkTgHqiHPyS4r2dWrjej1fP3x8tn6Zk/oBnNR7eoQNFUSI59yUiQi5b8Rrx7WiBg4UI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 64b73ced43ed90ff
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dF5Cs08mAifiaX3XDxf7VAxLaXvkg6So9pcAZI+l0KEFuBk+1bFs4NuqCgTTNbeMgS9Gy8GiNlquKEgFTrKPoQrF2C/U4m/TmXnkg3EjiAUAoNzuYUPl3Bjmycm6XLrfBQbScDLHBCP0N+iBeaCbwZ5QZaHtCEAd5HrGiRiSMUiZT4yzlCpTIViwa7dVYiwNXaKA1jqBju1MJBtkzL/ibQiYrVB+OP5xJ+MGvAVz5iF+3CwMM7OME3F6GaK/JnehbxbqQZc7GVWoCdItQE+mUUwnAnpGlE/18wUAq9QaUQ7SfRG8bbufW8RRtUwPuKzKdakTwkkyAeaeMtGQTvipig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnbKtJligJnRP+5Lj7UlTsJYXM05nvpkuqK7qPSGwYw=;
 b=E/FK8cvdnKedKxBb3lPLG3IdDEWvFXWbDf8fHrfE2bNrpIr1Udvjy18/UzwzbNze5ApOOe6TLFerT+wLoOCFn4nufjkadRp7/MKQbL1niJbTTYMNUw+qAN/Sj79d+XB29Vc6dgca9fnPeSOqzZTS9wKRf9n/2rFxwASGViZzK3spCnRUNHEfPq/M7fuVqKFjn6dLMPkYGjAm/COM9Ysp+wsczaQf9ewrnLX1QGeFrQvzqqzXDbiG3HejnGGQZQbhPgJH+5/kTH6cHbyDQ955ohXand9c3AJWwx1D3Tsf8M7ySqAiXGQZojfCnHFxButQxpDH2F4A7QujL3KWRI9TTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jnbKtJligJnRP+5Lj7UlTsJYXM05nvpkuqK7qPSGwYw=;
 b=i8PR6jMAWft4uvIDlAGoTkRVXfd4fBYZbeSPwGGpFEOfAKTTiZTQx2WC/xqGUuuOLD4aQcHhYS7SXgC6cgUvV7wrgb5OeT3CM68pokbiIkTgHqiHPyS4r2dWrjej1fP3x8tn6Zk/oBnNR7eoQNFUSI59yUiQi5b8Rrx7WiBg4UI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Thread-Topic: [PATCH v6 5/6] arm/dom0less: assign dom0less guests to cpupools
Thread-Index:
 AQHYSyUS0CLVSvR2nk+ITbzc2Ry0wKzlusgAgAAH7oCAAAy5gIAADjGAgAAPS4CABIA3gA==
Date: Mon, 11 Apr 2022 08:54:12 +0000
Message-ID: <DC3522A8-ADA1-4F6A-A3CF-C8095C2F639D@arm.com>
References: <20220408084517.33082-1-luca.fancellu@arm.com>
 <20220408084517.33082-6-luca.fancellu@arm.com>
 <d8c2e194-be59-f7d7-fcc6-9ef7a06ffd1c@suse.com>
 <16C482BB-BC45-4BD3-8357-87AA942F4D14@arm.com>
 <cacbaa1c-8ae8-9314-9364-97e5a53d876b@suse.com>
 <61DEEA58-E570-4FEF-9B71-27316C7F8D7C@arm.com>
 <0a85f239-dbf8-2e06-0158-75a1c1c40a4c@suse.com>
In-Reply-To: <0a85f239-dbf8-2e06-0158-75a1c1c40a4c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 12378a40-90fc-4ce9-6df5-08da1b98e1d1
x-ms-traffictypediagnostic:
	HE1PR0801MB2011:EE_|DB5EUR03FT058:EE_|DBBPR08MB4888:EE_
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4888186D7D4054FE6903416BE4EA9@DBBPR08MB4888.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lR6z9WrIE37VU8KW0IgYjIk1cX+IpDizXpqKITctyG01jzwL4oe5nyVjO8qH8N9ddAGZ8IgPloC3zzKBxFJf9ut7dfhxNm07n0vWJTCtrV8NYqSDW0HEqVeVF++7RfD57mAXQ1md+ZaWv+DnSsklHh2SHmhQow2JQXoW1mxCtcPIkoj9HsK4mY9Qf3W6DH+TD/FTZU6niIdECQhg/wuWpkQYXDnpIwXr1Fw10Ptj+jkkwg2pK/jGuUZOMs9gj2gwMuJjJbX7WTCUI5SZO96k4SmRY8C7XnrZzPUUgyf55g0prY8QPwk6O+8LUONY1xAthpe64q5fplUSBMFF9a0LlYITeYKtfTePF12/aJ8I57cDl04H15BuSa6oWVOGaZmovuzCcIdUEXu75JmuQYRnZmiiJXZ2xN7EfLJ9+Z5YxXTS0Eo9HH9ctV1pYk1Lf0PMoAdzEEKk3AavoP60PNwG576362aPcGIUYcw4ZVOf2uk6TKPYItGGNv5tvIcY/ekuKtOYEH6itbHbSn+SFD9recwWfdrV/9aEGeIJ5H0UzYUcKQmOXSK4ZNP2WPKcKU3Q5kA7bu2hBFei1q6y8Gq5FAlq7yFBiAaDoS+B+f0O7Y+nm9YVzx8ODeobfEAZMnqJn7i3Jmmjjm90ZFpM4M+XGF38j/3SxlkWJYfk4+TfN26c3UBpkvG7Ef4QoIpHgurNYohpDFi3juxVSS7nnEm3ASCVYxT0k9R5u7IzygAa5QrWDoXBx5nC2LkSXFBKLyw5GkY/QC08YIFJ841gjwQmCw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(26005)(186003)(91956017)(66574015)(6506007)(38070700005)(83380400001)(8936002)(86362001)(76116006)(64756008)(71200400001)(8676002)(4326008)(66476007)(66446008)(66556008)(66946007)(5660300002)(2616005)(122000001)(6486002)(38100700002)(508600001)(6512007)(33656002)(53546011)(316002)(55236004)(2906002)(54906003)(6916009)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3F9250C6BF41C4FAF741EB8BB592BD7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2011
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5efc6448-1fa1-4c76-caf3-08da1b98d9a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M4cjj0u4JKBaVIQLKZq1BRbz+5vcaY4ge9XMoluwKnaD7mamMZ/Bzb6PgcGwR4g31xobrtCwmYiOgtH8TvzztXRNvrclRntmINHwkqCwMBFPGxZ4fo6XrXigRnpkOzaODG8eFs78ap0eG9esJLixRfLdiXbumHtrFgsbxWCvF37B/yv7et+aXQk2NrcB8JaUZ40ZUB7kGRy6Ji+6pu5qoUT+ocOxZGJmXALw8aRS33Hwx0qJOEGkdF8VkuCztcNMB9J+RgKGCC37QJpeJQ8MuVCx003nMMGZRnSM8VaSVmeF+oq9TWDmEezBuqd3XFqKRE9AJR5wYarq+1lVa0okKAAgEWnR6go6JIepbMHOWIaq0VNQQWubXi6/SHJwED2Sh0i6HpD6eeQ2/sbbZEAp82h4ag3+NB30UjtvfYb5r2ZwmSXyu15CjyJh45b+PYGgN24bEWjBoQF+rxnM7b6gnK21/kXmaKsdYyvKunp72AWiXYq5ePvZMaqCn3248Cdv+Jp29wZi+F9D5uRDyfbnxGCVSNT03v64B5GFBuT+4YtzOI/LTOiDYR5uweWfDqVvDj1EhR40R63sHr1/LPHwiv1ChiAEPKycgIByHXtlwGvzMso+euwNV4EVZMAO25/Y7B2KoRKFNVmtUIrnDoRO1jR+Yz6TTDYzq2hTWEZcJIBM6vfqeE7KlfbG4yvozI795i2TL4o8YC0NKHFqlB0P+g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(26005)(40460700003)(54906003)(66574015)(6486002)(186003)(2616005)(47076005)(82310400005)(33656002)(336012)(36756003)(36860700001)(508600001)(6862004)(8936002)(70206006)(70586007)(81166007)(2906002)(8676002)(5660300002)(356005)(4326008)(83380400001)(53546011)(6506007)(6512007)(316002)(86362001)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 08:54:26.3767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12378a40-90fc-4ce9-6df5-08da1b98e1d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4888

DQoNCj4gT24gOCBBcHIgMjAyMiwgYXQgMTM6MTAsIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwOC4wNC4yMDIyIDEzOjE1LCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4gDQo+PiANCj4+PiBPbiA4IEFwciAyMDIyLCBhdCAxMToyNCwgSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAwOC4wNC4yMDIyIDExOjM5
LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+PiANCj4+Pj4gDQo+Pj4+PiBPbiA4IEFwciAyMDIy
LCBhdCAxMDoxMCwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+
IA0KPj4+Pj4gT24gMDguMDQuMjAyMiAxMDo0NSwgTHVjYSBGYW5jZWxsdSB3cm90ZToNCj4+Pj4+
PiBAQCAtMTA2LDYgKzEwNiw4IEBAIHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiB7DQo+
Pj4+Pj4gLyogUGVyLXZDUFUgYnVmZmVyIHNpemUgaW4gYnl0ZXMuIDAgdG8gZGlzYWJsZS4gKi8N
Cj4+Pj4+PiB1aW50MzJfdCB2bXRyYWNlX3NpemU7DQo+Pj4+Pj4gDQo+Pj4+Pj4gKyB1aW50MzJf
dCBjcHVwb29sX2lkOw0KPj4+Pj4gDQo+Pj4+PiBUaGlzIGNvdWxkIGRvIHdpdGggYSBjb21tZW50
IGV4cGxhaW5pbmcgZGVmYXVsdCBiZWhhdmlvci4gSW4gcGFydGljdWxhcg0KPj4+Pj4gSSB3b25k
ZXIgd2hhdCAwIG1lYW5zOiBMb29raW5nIGF0IGNwdXBvb2xfZGVzdHJveSgpIEkgY2FuJ3Qgc2Vl
IHRoYXQgaXQNCj4+Pj4+IHdvdWxkIGJlIGltcG9zc2libGUgdG8gZGVsZXRlIHBvb2wgMCAoYnV0
IHRoZXJlIG1heSBvZiBjb3Vyc2UgYmUNCj4+Pj4+IHJlYXNvbnMgZWxzZXdoZXJlLCBlLmcuIHBy
ZXZlbnRpbmcgcG9vbCAwIHRvIGV2ZXIgZ28gZW1wdHkpIC0gSsO8cmdlbj8NCj4+Pj4+IFlldCBp
ZiBwb29sIDAgY2FuIGJlIHJlbW92ZWQsIHplcm8gYmVpbmcgcGFzc2VkIGluIGhlcmUgc2hvdWxk
IGltbyBub3QNCj4+Pj4+IGxlYWQgdG8gZmFpbHVyZSBvZiBWTSBjcmVhdGlvbi4gT3RvaCBJIHVu
ZGVyc3RhbmQgdGhhdCB0aGlzIHdvdWxkDQo+Pj4+PiBhbHJlYWR5IGhhcHBlbiBhaGVhZCBvZiB5
b3VyIGNoYW5nZSwgcHJldmVudGluZyBvZiB3aGljaCB3b3VsZA0KPj4+Pj4gYXBwYXJlbnRseSBw
b3NzaWJsZSBvbmx5IHZpYSBwYXNzaW5nIENQVVBPT0xJRF9OT05FIGhlcmUuDQo+Pj4+IA0KPj4+
PiBQb29sLTAgY2Fu4oCZdCBiZSBlbXB0aWVkIGJlY2F1c2UgRG9tMCBpcyBzaXR0aW5nIHRoZXJl
ICh0aGUgcGF0Y2ggaXMgbW9kaWZ5aW5nDQo+Pj4+IGNwdXBvb2xfaWQgb25seSBmb3IgRG9tVXMp
Lg0KPj4+IA0KPj4+IEJ1dCB3ZSdyZSB0YWxraW5nIGFib3V0IGRvbTBsZXNzIGFzIHBlciB0aGUg
c3ViamVjdCBvZiB0aGUgcGF0Y2ggaGVyZS4NCj4+IA0KPj4gRG9tYWlucyBzdGFydGVkIHVzaW5n
IGRvbTBsZXNzIGZlYXR1cmUgYXJlIG5vdCBwcml2aWxlZ2VkIGFuZCBjYW7igJl0IGRvIGFueSBv
cGVyYXRpb24NCj4+IG9uIGNwdSBwb29scywgdGhhdOKAmXMgd2h5IEkgdGhvdWdodCBhYm91dCBE
b20wLg0KPiANCj4gSXQncyBhbGwgYSBtYXR0ZXIgb2YgWFNNIHBvbGljeSB3aGF0IGEgZG9tYWlu
IG1heSBvciBtYXkgbm90IGJlIGFibGUNCj4gdG8gY2Fycnkgb3V0Lg0KDQpZZXMgeW91IGFyZSBy
aWdodCwgaG93ZXZlciBJIGRpZG7igJl0IHNlZSBzbyBmYXIgdGhpcyB1c2UgY2FzZSB3aXRoIGEg
ZG9tVSBhbmQgdGhlIHRvb2wgc3RhY2ssDQpwcm9iYWJseSBiZWNhdXNlIGl0IHdvdWxkIG5lZWQg
YWxzbyB4ZW5zdG9yZSBldGPigKYgSeKAmW0gYXdhcmUgdGhhdCB0aGVyZSBpcyBzb21lIHdvcmsg
Z29pbmcNCm9uIHRvIGVuYWJsZSBpdCBhbHNvIGZvciBkb20wbGVzcyBkb21Vcywgc28gbXkgcXVl
c3Rpb24gaXM6DQoNCkRvIHlvdSBzZWUgdGhpcyBhcyBhIGJsb2NrZXIgZm9yIHRoaXMgcGF0Y2g/
IEFyZSB5b3Ugb2sgaWYgSSBzZW5kIHRoaXMgcGF0Y2ggd2l0aCBqdXN0IHRoZSBjb21tZW50DQpi
ZWxvdyBvciBpbiB5b3VyIG9waW5pb24gdGhpcyBwYXRjaCByZXF1aXJlcyBzb21lIG90aGVyIHdv
cms/DQoNCj4gDQo+Pj4+IEkgdGhvdWdodCB0aGUgbmFtZSB3YXMgc2VsZiBleHBsYW5hdG9yeSwg
YnV0IGlmIEkgaGF2ZSB0byBwdXQgYSBjb21tZW50LCB3b3VsZA0KPj4+PiBJdCB3b3JrIHNvbWV0
aGluZyBsaWtlIHRoYXQ6DQo+Pj4+IA0KPj4+PiAvKiBDcHVwb29sIGlkIHdoZXJlIHRoZSBkb21h
aW4gd2lsbCBiZSBhc3NpZ25lZCBvbiBjcmVhdGlvbiAqLw0KPj4+IA0KPj4+IEkgZG9uJ3Qgdmll
dyB0aGlzIGtpbmQgb2YgY29tbWVudCBhcyBuZWNlc3NhcnkuIEkgd2FzIHJlYWxseSBhZnRlcg0K
Pj4+IGNhbGxpbmcgb3V0IGRlZmF1bHQgYmVoYXZpb3IsIGFsb25nIHRoZSBsaW5lcyBvZiAiMCB0
byBkaXNhYmxlIiB0aGF0DQo+Pj4geW91IGNhbiBzZWUgaW4gcGF0Y2ggY29udGV4dC4NCj4+IA0K
Pj4gT2ssIGNvdWxkIHRoaXMgd29yaz8NCj4+IA0KPj4gLyogRG9tYWluIGNwdXBvb2wgaWQgb24g
Y3JlYXRpb24uIERlZmF1bHQgMCBhcyBQb29sLTAgaXMgYWx3YXlzIHByZXNlbnQuICovDQo+IA0K
PiBIbW0sIEkgbWF5IGhhdmUgbWlzZ3VpZGVkIHlvdSBieSB0YWxraW5nIGFib3V0ICJkZWZhdWx0
Ii4gVGhlcmUncyBubw0KPiBkZWZhdWx0IGhlcmUsIGFzIGl0J3MgdGhlIGNhbGxlcidzIHJlc3Bv
bnNpYmlsaXR5IHRvIHNldCB0aGUgZmllbGQsDQo+IGFuZCB3aGF0J3MgdGhlcmUgd2lsbCBiZSB1
c2VkLiBNYXliZSAiQ1BVIHBvb2wgdG8gdXNlOyBzcGVjaWZ5IDANCj4gdW5sZXNzIGEgc3BlY2lm
aWMgZXhpc3RpbmcgcG9vbCBpcyB0byBiZSB1c2VkIi4NCg0KVGhhbmsgeW91LCBJIHdpbGwgdXNl
IGl0IGFuZCB1cGRhdGUgdGhlIHBhdGNoLg0KDQo+IA0KPiBKYW4NCg0K

