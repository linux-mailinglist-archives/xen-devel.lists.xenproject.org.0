Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708626ED129
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 17:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525493.816730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxxv-0003re-4g; Mon, 24 Apr 2023 15:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525493.816730; Mon, 24 Apr 2023 15:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqxxv-0003p3-1r; Mon, 24 Apr 2023 15:18:55 +0000
Received: by outflank-mailman (input) for mailman id 525493;
 Mon, 24 Apr 2023 15:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhGg=AP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pqxxt-0003ov-IV
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 15:18:53 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 518e2e6e-e2b3-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 17:18:51 +0200 (CEST)
Received: from DUZPR01CA0043.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::6) by DB3PR08MB8842.eurprd08.prod.outlook.com
 (2603:10a6:10:437::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 15:18:45 +0000
Received: from DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::71) by DUZPR01CA0043.outlook.office365.com
 (2603:10a6:10:468::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 15:18:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT041.mail.protection.outlook.com (100.127.142.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 15:18:45 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Mon, 24 Apr 2023 15:18:45 +0000
Received: from d9775d042153.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CB07F9D7-35F0-4D6A-8F6C-25B90B6AFBAF.1; 
 Mon, 24 Apr 2023 15:18:39 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9775d042153.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Apr 2023 15:18:39 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB9310.eurprd08.prod.outlook.com (2603:10a6:10:3f6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 15:18:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6b4f:579f:6dca:8b91%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:18:37 +0000
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
X-Inumbo-ID: 518e2e6e-e2b3-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btgEbgqMdyE3nXB7sc6fc0uwwQB28LZdUobqEgBNANQ=;
 b=BQ2VNWfztvzjfNFFefYaAu1mT0JRD62gA+GXoVbwCfVV+V/UCqzhIJfbMSul9HOHbcM5oRWPNV31DUVijZa8ZAfdc2U9CcAsO6i3uCeanGXjQ0hSKOpzrxlnZnknJgQxUjKWaN+m64I8SBK6gkQodZcC4z/UnWm16BTwYGBH5F0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16b1daad3e056a46
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QK854+p+DMT6y0t+wvd2RNB1ubZGJehnM4sjzLK1pf13kauchIXASxUU4bW92Q7n98/0w/er8C4i8wkurbG+PmwSpcdpaMgOf155KRrEoFSOXhoCUwJ8XiFD009j51gNyKavGp3PRxj9JleyO4b7y+d4zeCJKOFLdV2dVwmd0aMre5Avz4foZr8jrNoxwmEenY1iSQpzSmyTNvZhjYcqc8Ni1/fh3sDAuIun99/7Zs/LOJpXzA0XIaUG2zfEVslXNUgLKtS0IhTdo716Ub1x7LGYdA9+nmj+PkakhKw516vElAFfUFWSg7RqizdbybPORLAU990wCZgbQjdffIIhCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btgEbgqMdyE3nXB7sc6fc0uwwQB28LZdUobqEgBNANQ=;
 b=QRVYrxKPT1JRgTpqSBrW/GUDOVfYo0pZYPFPt32H1hqPP0AynhFg4IFIVrNhHh2KfwHKKIrD0NkNHc5DSeFZU4u4vG08DmeKCqhF8pktP96SbvkbQ13dpxA6fLtnJbio5MvAVa0/Ih6T7VL1J9vLgftsKuu2oqQWxa/5Udv8iIDNAP4hzDyrNvsEtKoS0iAcJvcfvfW2mMfAfeGXqVBpUVTLeK3rrzXiUUKFXuR+c7Ys+uM0rm7kekMfXV7X31gWwpmH+b02BD6Hq+5iXm1fsny3O5z8HJR1oFAeTAz+p8djw2Nx/6JPx8ZqKND8i44fxQ1ClaM2UbYCw/v1fnFPiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=btgEbgqMdyE3nXB7sc6fc0uwwQB28LZdUobqEgBNANQ=;
 b=BQ2VNWfztvzjfNFFefYaAu1mT0JRD62gA+GXoVbwCfVV+V/UCqzhIJfbMSul9HOHbcM5oRWPNV31DUVijZa8ZAfdc2U9CcAsO6i3uCeanGXjQ0hSKOpzrxlnZnknJgQxUjKWaN+m64I8SBK6gkQodZcC4z/UnWm16BTwYGBH5F0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Topic: [PATCH v6 07/12] xen: enable Dom0 to use SVE feature
Thread-Index:
 AQHZdnKG11PjGcmQuE2MpJrElBiS3686VJGAgAAo1ICAAAFsAIAADk4AgAACvwCAAANFAA==
Date: Mon, 24 Apr 2023 15:18:37 +0000
Message-ID: <5535FDB0-989E-4536-AF7B-8F0BB561667A@arm.com>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-8-luca.fancellu@arm.com>
 <589fdeec-a0cf-1dc0-18b2-bd20c76832d2@suse.com>
 <7064B21E-414F-4FB5-BCC9-349388B32EA5@arm.com>
 <11e92082-6603-7180-f405-b96a14d430dd@suse.com>
 <37C35493-D5DA-4102-9B93-0045732E6F94@arm.com>
 <d49f1df6-ac49-27ef-d55f-b6284c76b055@suse.com>
In-Reply-To: <d49f1df6-ac49-27ef-d55f-b6284c76b055@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB9310:EE_|DBAEUR03FT041:EE_|DB3PR08MB8842:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a378f49-2400-409f-631f-08db44d73221
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jw0C7XNZX49Y7SSZxjYLOX+dXepkmhW5z2Fe1DH7wWDfN8a0012o50LmMzB4LR2Svm80XDNCVtL2FrrCYkAdOpArmdBzIBGoQy6gxJeDH88gWqoXEmkX3hbxMAvyIqKSDMPXQcvw942uHTPreGXHe8rFQOlm/0jjyPlgPqiY8LMohWNdLv6rWpNHTXSRFXdWNCTgt/kjX+Z4/WgVp5eeDMLrXTJnwl8zDdC5SkudukJwdTiSE1m6UVElbABFmPGABkLCkFFxuoYRbxQrLOiM/AsHcoHv1gol9f8TOnKWk6NkEhPHmB/32qC6k3r3EzvUP5qpC8Q7Ap6JE11ts6uPaGg/8H/RmUE589HAEpfFUIwFyIzBah1Plp1CIXF4bK+FCXh2hv16SWShsmYXVV2xLEdm0gvUzONEwuXiW60AeXSXK9wEqKcphenXgbHrAw/uUiRrOEMbmnjwlk+FqJc6X38XQpolXYC8f0qI3pP7E0QWcONBf1Htgb66S1Gvv2S/B59KTYTS/ep++TvXVlvu4qA4g8SGdZrhiMCSUFdgp2YscxkB4hGvejsyXWDeb0Y6sJVIya2j9OqucJEGEmZjPzTzr68mlptAg5UBJ280R7hnMODUO0SFCZExarZmBkft/8yJknUy2nrjVFKNqY3Xyw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(451199021)(54906003)(36756003)(38070700005)(478600001)(316002)(91956017)(4326008)(6916009)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(122000001)(41300700001)(2906002)(8936002)(8676002)(5660300002)(38100700002)(2616005)(6512007)(6506007)(26005)(53546011)(86362001)(186003)(33656002)(83380400001)(71200400001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC325CB17AFF7C48A15E5B5019F39EFC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9310
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	39a266ac-0072-46ab-cdf9-08db44d72d6b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xleCuQlsEayIgsAZw6YduaTQKTdEgSsRnmE3RZXWtV91wJJvPf+qCTyb6owAwjPEOVzUSr9ivhAKsCgX3dFdJLPZZVp5Dxsv4129mH4FkCF6TYRdYRe8OIYE5RO8TW7s8Gfl09PXOt+AaQX/Qf/QMqhLSnrQRNAj9KUbLgyNBHW6CKzSn0Qu64Sgo4dqFvu90B0Bso7ViZeUASQ59JxW4H44owOAhcUX0HCeU2MaF8rO6wn3aYkxQjPLjvW4MaEEeYos8k8Q2kgN1xutcU4ctCng0Nuouuq8bQNqeR3gIvhrA299t1oUFHcrv66ei4WXcHea9cChyNp25rVDGLcN3DqXl3ZmGl3FczpX3es/aFJO5Wdj3QXV4ADzwY+baXq/1l6imQta4Gd19NUDV+pNjjF6f0rBoqAcrKfOkTeY+Ed9itJ/h7kNc9vVl65IP7owdqZpoL2tev540e4i2hP2hl5I20MeXJPrCv2HKzZHB9I43WcwvsElT1QxrTClk4PFz9F5s9CjLOWNQcYvcyvopJ7k3d4ktEmGH8BMujpraTlhSatWmB4ya2wYXy8U4MrOC5PGZ9TdenNpOjCF4TBBAaigcBpa8xD3yi4GnMOQQNH9SWob0hV59ozhVlUFh1KkTDngNUgXHQoUKle70CBEm3dk0laj61DzUiMVO2UmO0lC1M82VVJGQZHPfPITO47O6qD0ANU6wNr7n6HU3kW+Sw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(376002)(346002)(396003)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(70206006)(70586007)(316002)(4326008)(6862004)(8676002)(8936002)(5660300002)(41300700001)(33656002)(82310400005)(36756003)(86362001)(40480700001)(356005)(6512007)(26005)(186003)(81166007)(53546011)(478600001)(6486002)(36860700001)(83380400001)(47076005)(2616005)(336012)(6506007)(82740400003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 15:18:45.2607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a378f49-2400-409f-631f-08db44d73221
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8842

DQoNCj4gT24gMjQgQXByIDIwMjMsIGF0IDE2OjA2LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjQuMDQuMjAyMyAxNjo1NywgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+PiBPbiAyNCBBcHIgMjAyMywgYXQgMTU6MDUsIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gT24gMjQuMDQuMjAyMyAxNjowMCwgTHVjYSBGYW5jZWxs
dSB3cm90ZToNCj4+Pj4+IE9uIDI0IEFwciAyMDIzLCBhdCAxMjozNCwgSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDI0LjA0LjIwMjMgMDg6MDIsIEx1Y2Eg
RmFuY2VsbHUgd3JvdGU6DQo+Pj4+Pj4gQEAgLTMwLDkgKzM3LDExIEBAIGludCBzdmVfY29udGV4
dF9pbml0KHN0cnVjdCB2Y3B1ICp2KTsNCj4+Pj4+PiB2b2lkIHN2ZV9jb250ZXh0X2ZyZWUoc3Ry
dWN0IHZjcHUgKnYpOw0KPj4+Pj4+IHZvaWQgc3ZlX3NhdmVfc3RhdGUoc3RydWN0IHZjcHUgKnYp
Ow0KPj4+Pj4+IHZvaWQgc3ZlX3Jlc3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpOw0KPj4+Pj4+
ICtib29sIHN2ZV9kb21jdGxfdmxfcGFyYW0oaW50IHZhbCwgdW5zaWduZWQgaW50ICpvdXQpOw0K
Pj4+Pj4+IA0KPj4+Pj4+ICNlbHNlIC8qICFDT05GSUdfQVJNNjRfU1ZFICovDQo+Pj4+Pj4gDQo+
Pj4+Pj4gKyNkZWZpbmUgb3B0X2RvbTBfc3ZlICAgICAoMCkNCj4+Pj4+PiAjZGVmaW5lIGlzX3N2
ZV9kb21haW4oZCkgKDApDQo+Pj4+Pj4gDQo+Pj4+Pj4gc3RhdGljIGlubGluZSByZWdpc3Rlcl90
IGNvbXB1dGVfbWF4X3pjcih2b2lkKQ0KPj4+Pj4+IEBAIC01OSw2ICs2OCwxMSBAQCBzdGF0aWMg
aW5saW5lIHZvaWQgc3ZlX2NvbnRleHRfZnJlZShzdHJ1Y3QgdmNwdSAqdikge30NCj4+Pj4+PiBz
dGF0aWMgaW5saW5lIHZvaWQgc3ZlX3NhdmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpIHt9DQo+Pj4+
Pj4gc3RhdGljIGlubGluZSB2b2lkIHN2ZV9yZXN0b3JlX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KSB7
fQ0KPj4+Pj4+IA0KPj4+Pj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgc3ZlX2RvbWN0bF92bF9wYXJh
bShpbnQgdmFsLCB1bnNpZ25lZCBpbnQgKm91dCkNCj4+Pj4+PiArew0KPj4+Pj4+ICsgICAgcmV0
dXJuIGZhbHNlOw0KPj4+Pj4+ICt9DQo+Pj4+PiANCj4+Pj4+IE9uY2UgYWdhaW4gSSBkb24ndCBz
ZWUgdGhlIG5lZWQgZm9yIHRoaXMgc3R1Yjogb3B0X2RvbTBfc3ZlIGlzICNkZWZpbmUtZA0KPj4+
Pj4gdG8gcGxhaW4gemVybyB3aGVuICFBUk02NF9TVkUsIHNvIHRoZSBvbmx5IGNhbGwgc2l0ZSBt
ZXJlbHkgcmVxdWlyZXMgYQ0KPj4+Pj4gdmlzaWJsZSBkZWNsYXJhdGlvbiwgYW5kIERDRSB3aWxs
IHRha2UgY2FyZSBvZiBlbGltaW5hdGluZyB0aGUgYWN0dWFsIGNhbGwuDQo+Pj4+IA0KPj4+PiBJ
4oCZdmUgdHJpZWQgdG8gZG8gdGhhdCwgSeKAmXZlIHB1dCB0aGUgZGVjbGFyYXRpb24gb3V0c2lk
ZSB0aGUgaWZkZWYgc28gdGhhdCBpdCB3YXMgYWx3YXlzIGluY2x1ZGVkDQo+Pj4+IGFuZCBJIHJl
bW92ZWQgdGhlIHN0dWIsIGJ1dCBJIGdvdCBlcnJvcnMgb24gY29tcGlsYXRpb24gYmVjYXVzZSBv
ZiB1bmRlZmluZWQgZnVuY3Rpb24uDQo+Pj4+IEZvciB0aGF0IHJlYXNvbiAgSSBsZWZ0IHRoYXQg
Y2hhbmdlIG91dC4NCj4+PiANCj4+PiBJbnRlcmVzdGluZy4gSSBkb24ndCBzZWUgd2hlcmUgdGhl
IHJlZmVyZW5jZSB3b3VsZCBiZSBjb21pbmcgZnJvbS4NCj4+IA0KPj4gQ291bGQgaXQgYmUgYmVj
YXVzZSB0aGUgZGVjbGFyYXRpb24gaXMgdmlzaWJsZSwgb3V0c2lkZSB0aGUgaWZkZWYsIGJ1dCB0
aGUgZGVmaW5pdGlvbiBpcyBub3QgY29tcGlsZWQgaW4/IA0KPiANCj4gV2VsbCwgeWVzLCBsaWtl
bHkuIEJ1dCB0aGUgcXVlc3Rpb24gaXNuJ3QgdGhhdCBidXQgIldoeSBkaWQgdGhlIHJlZmVyZW5j
ZQ0KPiBub3QgZ2V0IHJlbW92ZWQsIHdoZW4gaXQncyBpbnNpZGUgYW4gaWYoMCkgYmxvY2s/Ig0K
DQpPaCBvaywgSSBkb27igJl0IGtub3csIGhlcmUgd2hhdCBJIGdldCBpZiBmb3IgZXhhbXBsZSBJ
IGJ1aWxkIGFybTMyOg0KDQphcm0tbGludXgtZ251ZWFiaWhmLWxkIC1FTCAtVCBhcmNoL2FybS94
ZW4ubGRzIC1OIHByZWxpbmsubyBcDQouL2NvbW1vbi9zeW1ib2xzLWR1bW15Lm8gLW8gLi8ueGVu
LXN5bXMuMA0KYXJtLWxpbnV4LWdudWVhYmloZi1sZDogcHJlbGluay5vOiBpbiBmdW5jdGlvbiBg
Y3JlYXRlX2RvbVVzJzoNCiguaW5pdC50ZXh0KzB4MTM0NjQpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBzdmVfZG9tY3RsX3ZsX3BhcmFtJw0KYXJtLWxpbnV4LWdudWVhYmloZi1sZDogKC5pbml0
LnRleHQrMHgxMzZiNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHN2ZV9kb21jdGxfdmxfcGFy
YW0nDQphcm0tbGludXgtZ251ZWFiaWhmLWxkOiAuLy54ZW4tc3ltcy4wOiBoaWRkZW4gc3ltYm9s
IGBzdmVfZG9tY3RsX3ZsX3BhcmFtJyBpc24ndCBkZWZpbmVkDQphcm0tbGludXgtZ251ZWFiaWhm
LWxkOiBmaW5hbCBsaW5rIGZhaWxlZDogYmFkIHZhbHVlDQptYWtlWzNdOiAqKiogWy9kYXRhX3Nk
Yy9sdWNmYW4wMS9raXJrc3RvbmVfeGVuL3hlbi94ZW4vYXJjaC9hcm0vTWFrZWZpbGU6OTU6IHhl
bi1zeW1zXSBFcnJvciAxDQptYWtlWzJdOiAqKiogWy9kYXRhX3NkYy9sdWNmYW4wMS9raXJrc3Rv
bmVfeGVuL3hlbi94ZW4vLi9idWlsZC5tazo5MDogeGVuXSBFcnJvciAyDQptYWtlWzFdOiAqKiog
Wy9kYXRhX3NkYy9sdWNmYW4wMS9raXJrc3RvbmVfeGVuL3hlbi94ZW4vTWFrZWZpbGU6NTkwOiB4
ZW5dIEVycm9yIDINCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvZGF0YV9zZGMvbHVjZmFu
MDEva2lya3N0b25lX3hlbi9idWlsZC94ZW4tcWVtdS1hcm0zMicNCm1ha2U6ICoqKiBbTWFrZWZp
bGU6MTgxOiBfX3N1Yi1tYWtlXSBFcnJvciAyDQptYWtlOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2Rh
dGFfc2RjL2x1Y2ZhbjAxL2tpcmtzdG9uZV94ZW4veGVuL3hlbuKAmQ0KDQpUaGVzZSBhcmUgdGhl
IG1vZGlmaWNhdGlvbiBJ4oCZdmUgZG9uZToNCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9p
bmNsdWRlL2FzbS9hcm02NC9zdmUuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC9z
dmUuaA0KaW5kZXggNzFiZGRiNDFmMTljLi4zMzBjNDdlYTg4NjQgMTAwNjQ0DQotLS0gYS94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvc3ZlLmgNCisrKyBiL3hlbi9hcmNoL2FybS9pbmNs
dWRlL2FzbS9hcm02NC9zdmUuaA0KQEAgLTI0LDYgKzI0LDggQEAgc3RhdGljIGlubGluZSB1bnNp
Z25lZCBpbnQgc3ZlX2VuY29kZV92bCh1bnNpZ25lZCBpbnQgc3ZlX3ZsX2JpdHMpDQogICAgIHJl
dHVybiBzdmVfdmxfYml0cyAvIFNWRV9WTF9NVUxUSVBMRV9WQUw7DQogfQ0KIA0KK2Jvb2wgc3Zl
X2RvbWN0bF92bF9wYXJhbShpbnQgdmFsLCB1bnNpZ25lZCBpbnQgKm91dCk7DQorDQogI2lmZGVm
IENPTkZJR19BUk02NF9TVkUNCiANCiBleHRlcm4gaW50IG9wdF9kb20wX3N2ZTsNCkBAIC0zNyw3
ICszOSw2IEBAIGludCBzdmVfY29udGV4dF9pbml0KHN0cnVjdCB2Y3B1ICp2KTsNCiB2b2lkIHN2
ZV9jb250ZXh0X2ZyZWUoc3RydWN0IHZjcHUgKnYpOw0KIHZvaWQgc3ZlX3NhdmVfc3RhdGUoc3Ry
dWN0IHZjcHUgKnYpOw0KIHZvaWQgc3ZlX3Jlc3RvcmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpOw0K
LWJvb2wgc3ZlX2RvbWN0bF92bF9wYXJhbShpbnQgdmFsLCB1bnNpZ25lZCBpbnQgKm91dCk7DQog
DQogI2Vsc2UgLyogIUNPTkZJR19BUk02NF9TVkUgKi8NCiANCkBAIC02OCwxMSArNjksNiBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgc3ZlX2NvbnRleHRfZnJlZShzdHJ1Y3QgdmNwdSAqdikge30NCiBz
dGF0aWMgaW5saW5lIHZvaWQgc3ZlX3NhdmVfc3RhdGUoc3RydWN0IHZjcHUgKnYpIHt9DQogc3Rh
dGljIGlubGluZSB2b2lkIHN2ZV9yZXN0b3JlX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KSB7fQ0KIA0K
LXN0YXRpYyBpbmxpbmUgYm9vbCBzdmVfZG9tY3RsX3ZsX3BhcmFtKGludCB2YWwsIHVuc2lnbmVk
IGludCAqb3V0KQ0KLXsNCi0gICAgcmV0dXJuIGZhbHNlOw0KLX0NCi0NCiAjZW5kaWYgLyogQ09O
RklHX0FSTTY0X1NWRSAqLw0KIA0KICNlbmRpZiAvKiBfQVJNX0FSTTY0X1NWRV9IICovDQoNCg0K
PiANCj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9rZXJuZWwuYw0KPj4+PiArKysgYi94ZW4vY29tbW9u
L2tlcm5lbC5jDQo+Pj4+IEBAIC0zMjQsMTEgKzMyNCwxNCBAQCBpbnQgX19pbml0IHBhcnNlX3Np
Z25lZF9pbnRlZ2VyKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKnMsIGNvbnN0IGNoYXIg
KmUsDQo+Pj4+ICAgIHNsZW4gPSBlID8gKHsgQVNTRVJUKGUgPj0gcyk7IGUgLSBzOyB9KSA6IHN0
cmxlbihzKTsNCj4+Pj4gICAgbmxlbiA9IHN0cmxlbihuYW1lKTsNCj4+Pj4gDQo+Pj4+ICsgICAg
aWYgKCAhZSApDQo+Pj4+ICsgICAgICAgIGUgPSBzICsgc2xlbjsNCj4+Pj4gKw0KPj4+PiAgICAv
KiBDaGVjayB0aGF0IHRoaXMgaXMgdGhlIG5hbWUgd2UncmUgbG9va2luZyBmb3IgYW5kIGEgdmFs
dWUgd2FzIHByb3ZpZGVkICovDQo+Pj4+IC0gICAgaWYgKCAoc2xlbiA8PSBubGVuKSB8fCBzdHJu
Y21wKHMsIG5hbWUsIG5sZW4pIHx8IChzW25sZW5dICE9ICc9JykgKQ0KPj4+PiArICAgIGlmICgg
c2xlbiA8PSBubGVuIHx8IHN0cm5jbXAocywgbmFtZSwgbmxlbikgfHwgc1tubGVuXSAhPSAnPScg
KQ0KPj4+PiAgICAgICAgcmV0dXJuIC0xOw0KPj4+PiANCj4+Pj4gLSAgICBwdmFsID0gc2ltcGxl
X3N0cnRvbGwoJnNbbmxlbiArIDFdLCAmc3RyLCAwKTsNCj4+Pj4gKyAgICBwdmFsID0gc2ltcGxl
X3N0cnRvbGwoJnNbbmxlbiArIDFdLCAmc3RyLCAxMCk7DQo+Pj4+IA0KPj4+PiAgICAvKiBOdW1i
ZXIgbm90IHJlY29nbmlzZWQgKi8NCj4+Pj4gICAgaWYgKCBzdHIgIT0gZSApDQo+Pj4+IA0KPj4+
PiANCj4+Pj4gUGxlYXNlIG5vdGUgdGhhdCBJ4oCZdmUgYWxzbyBpbmNsdWRlZCB5b3VyIGNvbW1l
bnQgYWJvdXQgdGhlIGJhc2UsIHdoaWNoIEkgZm9yZ290IHRvIGFkZCwgYXBvbG9naWVzIGZvciB0
aGF0Lg0KPj4+PiANCj4+Pj4gc2xlbiA8PSBubGVuIGRvZXNu4oCZdCBzZWVtcyByZWR1bmRhbnQg
dG8gbWUsIEkgaGF2ZSB0aGF0IGJlY2F1c2UgSeKAmW0gYWNjZXNzaW5nIHNbbmxlbl0gYW5kIEkg
d291bGQgbGlrZQ0KPj4+PiB0aGUgc3RyaW5nIHMgdG8gYmUgYXQgbGVhc3QgPiBubGVuDQo+Pj4g
DQo+Pj4gUmlnaHQsIGJ1dCBkb2Vzbid0IHN0cm5jbXAoKSBndWFyYW50ZWUgdGhhdCBhbHJlYWR5
Pw0KPj4gDQo+PiBJIHRob3VnaHQgc3RybmNtcCgpIGd1YXJhbnRlZXMgcyBjb250YWlucyBhdCBs
ZWFzdCBubGVuIGNoYXJzLCBtZWFuaW5nIGZyb20gMCB0byBubGVuLTEsIGlzIG15IHVuZGVyc3Rh
bmRpbmcgd3Jvbmc/DQo+IA0KPiBUaGF0J3MgbXkgdW5kZXJzdGFuZGluZyB0b28uIFRyYW5zbGF0
ZWQgdG8gQyB0aGlzIG1lYW5zICJzbGVuID49IG5sZW4iLA0KPiBpLmUuIHRoZSAic2xlbiA8IG5s
ZW4iIGNhc2UgaXMgY292ZXJlZC4gVGhlICJzbGVuID09IG5sZW4iIGNhc2UgaXMgdGhlbg0KPiBj
b3ZlcmVkIGJ5ICJzW25sZW5dICE9ICc9JyIsIHdoaWNoIC0gZHVlIHRvIHRoZSBlYXJsaWVyIGd1
YXJhbnRlZSAtIGlzDQo+IGdvaW5nIHRvIGJlIGluIGJvdW5kcy4gVGhhdCdzIGJlY2F1c2UgZXZl
biB3aGVuIGUgaXMgbm9uLU5VTEwgYW5kIHBvaW50cw0KPiBhdCBub24tbnVsLCBpdCBzdGlsbCBw
b2ludHMgaW50byBhIHZhbGlkIG51bC10ZXJtaW5hdGVkIHN0cmluZy4gKEJ1dCB5ZXMsDQo+IEkg
c2VlIG5vdyB0aGF0IHRoZSAic2xlbiA9PSBubGVuIiBjYXNlIGlzIGEgbGl0dGxlIGhhaXJ5LCBz
byBwZXJoYXBzDQo+IGluZGVlZCBiZXN0IHRvIGtlZXAgdGhlIGNoZWNrIGFzIHlvdSBoYXZlIGl0
LikNCj4gDQo+IEphbg0KDQoNCg==

