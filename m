Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B021066E443
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 17:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479628.743592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHpIk-0001qu-5r; Tue, 17 Jan 2023 16:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479628.743592; Tue, 17 Jan 2023 16:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHpIk-0001os-1t; Tue, 17 Jan 2023 16:59:10 +0000
Received: by outflank-mailman (input) for mailman id 479628;
 Tue, 17 Jan 2023 16:59:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKDY=5O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pHpIj-0001om-5N
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 16:59:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 410ef49c-9688-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 17:59:07 +0100 (CET)
Received: from FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::16)
 by DB9PR08MB6443.eurprd08.prod.outlook.com (2603:10a6:10:261::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 16:58:46 +0000
Received: from VI1EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::9d) by FR3P281CA0142.outlook.office365.com
 (2603:10a6:d10:95::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Tue, 17 Jan 2023 16:58:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT051.mail.protection.outlook.com (100.127.144.138) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 16:58:45 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Tue, 17 Jan 2023 16:58:45 +0000
Received: from 8bf8efe9d6fe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A659724B-20F9-4BFD-A41E-4DEA91FA5564.1; 
 Tue, 17 Jan 2023 16:58:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8bf8efe9d6fe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Jan 2023 16:58:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB7692.eurprd08.prod.outlook.com (2603:10a6:10:3a4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 16:58:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 16:58:35 +0000
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
X-Inumbo-ID: 410ef49c-9688-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYdEvaRF12y9D6I+kU42P8nMQ/30uTiKnkvwqrx5g7Y=;
 b=TzlZcqxVV5M7CRuMpiLOlG6LsA/xbuzjGFHZENV8qTWW5fFZkffrJC7njIe3z2YCzJCrEOFraQHGq6XHrhW/EuNP32qqqDX0mgq+aeBPN2zI8ZDsF7kR2OvdWUQxFIfO82GA4LgPgHZzdBkvEyPvWK3iyxTa9O7RNfEH3UfbHuU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d0eb2f63df388a77
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJxuRSNWokEJETZGnpQ5fWidAlb15KgO2eeIgqlHqBD3/hQ4oGozXPpBYA8C+8SNCa7zEv6V/YxNiBkYHc6e//e92Bu5ogoNPHvBDwW7h2C9NoEJxClovKHjnFMmqiM7hx7w+4g5rclM5lTxAV2l0fLvFk6QSPfyRfE3J8hZPusSkY6+U3moRWzvtE5wo02ToiXZVNteFFNm8kA2xiSJ1iD5nOnAOFORXOaJXJaQrkUJHMIN8cVe6f2KVcDHx9nkgfaFhwxEu5YqOQJ5782vXrt+VwLObRZu41q0ckBktphnGLyKblkSJSo1nmNwRgXF4wtg941j12Mh8VM/562+pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYdEvaRF12y9D6I+kU42P8nMQ/30uTiKnkvwqrx5g7Y=;
 b=MA0hpfWHtbptL5pCN/T4mw7H3OU3BDirHSSae5gvc32wIeEH8ywaiA4cGH3i8VIH3Wmc7iEHUrkc78BITQIhtd3ooM0NPEv0zMfHR7we3b3y6QB82uNgkxQ9q9KWklEutugOHXL3hLqViiRnb8OMQgQTAFrQWl7Ngs/G7XUheQSrGcfOjirH56rRuttt0qrQtrNBV+mekpqZI9yAYKWwAFaypSZIj3S8OMs5Vz55aEwSJCHc0J6gl1svDZr02jOx+bL9ZBrr6vw2Jj0X12J2Dbn0yBzydL/fvo7/SgaZ9QKwBQ+NOsqUissyDYEixilYjUalgPh2xwPg67sRHHwKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYdEvaRF12y9D6I+kU42P8nMQ/30uTiKnkvwqrx5g7Y=;
 b=TzlZcqxVV5M7CRuMpiLOlG6LsA/xbuzjGFHZENV8qTWW5fFZkffrJC7njIe3z2YCzJCrEOFraQHGq6XHrhW/EuNP32qqqDX0mgq+aeBPN2zI8ZDsF7kR2OvdWUQxFIfO82GA4LgPgHZzdBkvEyPvWK3iyxTa9O7RNfEH3UfbHuU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Thread-Topic: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Thread-Index: AQHZKdYEuIagcBo/xkCEsH1joQzNJq6ix9mAgAANiICAAADFAA==
Date: Tue, 17 Jan 2023 16:58:35 +0000
Message-ID: <E93CF214-6AE5-4292-8392-41D38C0D5426@arm.com>
References: <20230116181048.30704-1-anthony.perard@citrix.com>
 <20230116181048.30704-2-anthony.perard@citrix.com>
 <399DE18D-39B4-4BC6-940F-09864D4BEEE5@arm.com>
 <Y8bTC3Ftr494imCr@perard.uk.xensource.com>
In-Reply-To: <Y8bTC3Ftr494imCr@perard.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB7692:EE_|VI1EUR03FT051:EE_|DB9PR08MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: eeafb44d-f38c-41aa-8ae3-08daf8ac1856
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PZ6fqUsHe5n2e3NFBWzqU9tQ5i0aqVEwMWSxffvGy91w0ohxYKeC5b/QXOZb1/EPv6EmJAX7pjcNBrSQpbj+uqQoRCbzLAhsHxj5UkJGh+AJrugOayNKwWREMzUACiLpe0XPORQfRzZOKSrmrgcx8sGBbnzRM8BsxzooepOubp+WNA2NaMqLw5ejfrnBLDB1TSnusmMWVR7sGw1bf2xGXUA/uwHNhrurNhjyCbfIGEBjYCOAOiQF9n3AsKhA416zkQReKXUH+NvXjlvtRM4cNUy4tWggwixer4w7grE3133XiQmamC9mBGVq8XKfOgP8BuQj8RHxtBtymbvk1cywKjRG4L+AJNhmieb9ccS5LCEDFe9Ky4fx/IrLuPzP+r47ZM+NSwS/gLmYMTNvAqreXtD9eIxvtHmYu8ZsfKt/FmV4YpFKHVB4oOUEOGntgwwcM+tPqp89RZijYtkwJUgCbToz2Wrf0gxU2GmHJ3fPtfqOuoDa7GQlB+hJ105wMsexIUobu4CiZHBvZbOOBbvADvMEbS4dzEhGHZl8MRU4j6SQ64eivebpmZsK7P+NjjNEY8QrpJK0qWRvfO5Ctr+qG2PO0w/tGyAbP0+zpJqrhH/uL1bWF40ZIDBHFsQvZxz9T1Z7ngmiz6D161ggJBCTchM4Y1wWL0IE8N1oCIhfWex8JQn2uB/ACYUQZxGNrUdbhw/Je4cZwf6Lbbou6g0TYLbxmYYn2eXkzTfkUwW17Sg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(451199015)(33656002)(36756003)(8676002)(41300700001)(66446008)(66556008)(76116006)(5660300002)(478600001)(26005)(6512007)(186003)(8936002)(53546011)(6486002)(66476007)(91956017)(64756008)(6506007)(66946007)(54906003)(71200400001)(316002)(6916009)(4326008)(2616005)(38070700005)(2906002)(38100700002)(122000001)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A748656BD7D9EF4BAF8A91C5762AFE89@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7692
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ab803b80-e792-4ad0-287c-08daf8ac1243
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N16JnLE1kH2UmAdEcN+F3OsKBPCxLdI/rjbPln1kdQY/5WWdMvIDAiZGUW/vbkTM6wE6VzNtZzK1UEvd4uhx3VD+n6i2sNFcM8tml2EsYw3bDi9fvwYIq5y/4Bepb7YN8NfxcrbqpCXhZDn8jfKkAetDpnanHIgWmdrwpwpN8pAK+D5xStb67CMjDGtla6GWOjm/rq35+v3wHu44KXns2zAAnOPPLRYDBzNUSF7aVOXKx51yjh5pQOYYlclR9f3Wm1/rwk1o/wCO/kwMrvZ6JsXbtt5auykcnRw5Tm8lYp3EOtuMFDljpIW/+1Do9ZurFte5OhIQcz1FVRzJoX/2y7BxxlG26jnTLiFlAHvMg2XgDUt/7KlARY2vOUzC5i7MHVkQ1MS2z/+X5hoseQhKLvmZNhn9JxdxIMTUSeEVm2CQWvlfQNck2jWd83sRDVM+g/7tGe7cVYN4fuWcE2okvBxG3zKUxNh1JfRTEzXDaS8spO5FaZSKX6ghjsEHJvK+Uw8kQBmXiT1y0uQN/4lqahxtDcgisvqv+2vTisCrQk2IBdOsP36zVfDnQvtRx11DF7jg8dBmZHMaDtOJKE8Sz40L5tajpFClU78MUjxffBnBfdjbX1tfWLU45eJmeXWNg+y3DxwLfrhdkOlrCxMBx26rYj+L7y1+bDtxJ2xK4szo6hxgpUNA25enuenWPlaC+ICaUObCb8AuU7fLHQK9PQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(6862004)(41300700001)(2616005)(36756003)(8936002)(316002)(4326008)(336012)(54906003)(70586007)(8676002)(70206006)(47076005)(82310400005)(356005)(81166007)(82740400003)(86362001)(2906002)(5660300002)(40460700003)(40480700001)(33656002)(186003)(26005)(6512007)(478600001)(6486002)(36860700001)(53546011)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 16:58:45.1641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeafb44d-f38c-41aa-8ae3-08daf8ac1856
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6443

DQoNCj4gT24gMTcgSmFuIDIwMjMsIGF0IDE2OjU1LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIEphbiAxNywgMjAyMyBhdCAw
NDowNzoyNFBNICswMDAwLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4+IE9uIDE2IEphbiAyMDIz
LCBhdCAxODoxMCwgQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+IHdy
b3RlOg0KPj4+IGRpZmYgLS1naXQgYS94ZW4vdG9vbHMvY29tcGF0LXhsYXQtaGVhZGVyLnB5IGIv
eGVuL3Rvb2xzL2NvbXBhdC14bGF0LWhlYWRlci5weQ0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
DQo+Pj4gaW5kZXggMDAwMDAwMDAwMC4uYzFiMzYxYWM1Ng0KPj4+IC0tLSAvZGV2L251bGwNCj4+
PiArKysgYi94ZW4vdG9vbHMvY29tcGF0LXhsYXQtaGVhZGVyLnB5DQo+Pj4gQEAgLTAsMCArMSw0
NjggQEANCj4+PiArIyEvdXNyL2Jpbi9lbnYgcHl0aG9uDQo+PiANCj4+IFdvdWxkIGl0IG1ha2Ug
c2Vuc2UgdG8gc3RhcnQgd2l0aCBweXRob24zIHNpbmNlIGl0IGlzIGEgbmV3IHNjcmlwdD8NCj4g
DQo+IFRoYXQgc2hlYmFuZyBpc24ndCBldmVuIHVzZWQgYXMgdGhlIHNjcmlwdCBkb2Vzbid0IGV2
ZW4gaGF2ZSB0aGUNCj4gZXhlY3V0aW9uIGJpdCBzZXQuIFNvIHdoeSBkbyB5b3Ugc2F5IHRoYXQg
dGhlIHNjcmlwdCBpc24ndCBweXRob24zPyBOb3QNCj4gcmVhbGx5IGFza2luZywganVzdCBiZWVu
IHBlZGFudGljIDotKQ0KDQpZZXMgSSBkaWRu4oCZdCBwYXkgYXR0ZW50aW9uIHRvIHRoYXQNCg0K
PiANCj4gRXZlbiBpZiBpdCdzIGEgbmV3IHNjcmlwdCwgaXQgaXNuJ3QgYSBuZXcgcHJvamVjdC4g
V2UgY2FuJ3QgZGVwZW5kIG9uDQo+IGJyYW5kIG5ldyBmdW5jdGlvbmFsaXR5IGZyb20gb3VyIGRl
cGVuZGVuY2llcy4gV2UgbmVlZCB0byBiZSBhYmxlIHRvDQo+IGJ1aWxkIHRoZSBoeXBlcnZpc29y
IHdpdGggb2xkIGJ1aWxkIHRvb2xjaGFpbiAvIGRpc3RyaWJ1dGlvbi4NCj4gDQo+IEFueXdheSwg
SSBkaWQgc3RhcnQgYnkgd3JpdGluZyBhIHB5dGhvbjMgc2NyaXB0IGluIGFsbCBpdHMgZ2xvcnkg
KG9yIGF0DQo+IGxlYXN0IHNvbWUgb2YgdGhlIG5ldyBwYXJ0IG9mIHRoZSBsYW5ndWFnZSB0aGF0
IEkga25vdyBhYm91dCksIGJ1dCBJIGhhZA0KPiB0byByZXdvcmsgaXQgdG8gYmUgYWJsZSB0byB1
c2UgaXQgb24gb2xkZXIgZGlzdHJpYnV0aW9uLiBPdXIgY2VudG9zNw0KPiBjb250YWluZXIgaW4g
b3VyIEdpdExhYiBDSSBzZWVtcyB0byB1c2UgcHl0aG9uMi43Lg0KDQpUaGF0IG1ha2VzIHNlbnNl
LCB0aGFua3MgZm9yIHRoZSBleHBsYW5hdGlvbi4NCg0KPiANCj4gU28gSSBoYWQgdG8gc3RvcCB1
c2luZyBzdHIucmVtb3ZlcHJlZml4KCkgYW5kIEkgaW50cm9kdWNlIHNvbWUgZnVuY3Rpb24NCj4g
ZG9pbmcgdGhlIHNhbWUgdGhpbmcgaW5zdGVhZCAoc28gdGhhdCB3b3JrcyB3aXRoIG9sZGVyIHRo
YW4gcHl0aG9uIDMuOSkuDQo+IFRoZW4gSSBoYWQgdG8gc3RvcCB1c2luZyBmLXN0cmluZ3MgYW5k
IHVzZSAlLWZvcm1hdHRpbmcgaW5zdGVhZC4NCj4gVGhlbiB1c2UgIm0uZ3JvdXBzKClbMF0iIGlu
c3RlYWQgb2YgIm1bMV0iIHdoZXJlICJtIiBpcyBhIG1hdGNoIHJlc3VsdA0KPiBmcm9tIHJlLm1h
dGNoKCkgYW5kIG90aGVyLg0KPiBBbmQgdXNlIHRoZSBjbGFzc2luZyAiZnJvbSBfX2Z1dHVyZV9f
IC4uLiIgcHJlYW1ibGUuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gQW50aG9ueSBQRVJB
UkQNCg0K

