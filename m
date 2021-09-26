Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29C5418818
	for <lists+xen-devel@lfdr.de>; Sun, 26 Sep 2021 12:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196061.348912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mURLg-0005UP-93; Sun, 26 Sep 2021 10:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196061.348912; Sun, 26 Sep 2021 10:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mURLg-0005Sc-5o; Sun, 26 Sep 2021 10:25:32 +0000
Received: by outflank-mailman (input) for mailman id 196061;
 Sun, 26 Sep 2021 10:25:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ODXE=OQ=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mURLe-0005SW-N3
 for xen-devel@lists.xenproject.org; Sun, 26 Sep 2021 10:25:30 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82dad72b-8b05-4805-98a4-8c6ad714aea4;
 Sun, 26 Sep 2021 10:25:28 +0000 (UTC)
Received: from DB3PR06CA0026.eurprd06.prod.outlook.com (2603:10a6:8:1::39) by
 AM6PR08MB4422.eurprd08.prod.outlook.com (2603:10a6:20b:be::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.18; Sun, 26 Sep 2021 10:25:26 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::48) by DB3PR06CA0026.outlook.office365.com
 (2603:10a6:8:1::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Sun, 26 Sep 2021 10:25:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Sun, 26 Sep 2021 10:25:26 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Sun, 26 Sep 2021 10:25:25 +0000
Received: from e34a45c9b2b0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DA91558F-6C9E-4A19-923C-CAFC5879EC0B.1; 
 Sun, 26 Sep 2021 10:25:13 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e34a45c9b2b0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sun, 26 Sep 2021 10:25:13 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB6PR0801MB1623.eurprd08.prod.outlook.com (2603:10a6:4:3b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.20; Sun, 26 Sep
 2021 10:25:10 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.021; Sun, 26 Sep 2021
 10:25:10 +0000
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
X-Inumbo-ID: 82dad72b-8b05-4805-98a4-8c6ad714aea4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79FInNMSLaherc7NshKSNL14rlvm3gvZlBDeqKAzniM=;
 b=AebD2hzzcvTxUVr3fll+TsGA+sbkHgOxUAiSD0ZkUxNxxlCE7z3CgV0faWyrTQiUpzqfrbo4+/kXVSdKEfvX8vnJd5+o9LgPWNBZ1tTheqE6BatF2o5D7+uG7+YIsr7U/hj4WKSU8+WbRuS5CpbV24TafoTPQ+uh5iYWWBnQEiU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEdCQ/d7ENQlI69RI81Y3IVugb0qRZbiIsXKV8SAIGUHy4oh8ItCGbLzq+SJ1IOXvUC61fDOOarzKR/eiD1/YMcL1pqymU947PBl9wiXo35zp2dTIHSsVRvRFfMedtMn3hcjjfwy+wyskubKwYvbAj8Dey6Yv9a96/r+DeAbr8/ZZ3/dLJZPVYusHaUduDIF02aiBGIG5WmpNxml066ByehQhVySFMfhLZuHmYVM0iJOatdFu4hCOp9UUOrMCrR34bnAO8d8qTyTfgEVIsyaNUjpsskI7+ZKGbjpDODMpl0X1BGkvejcqDDKRESqO8hFNWD1ap9UWf+dyxNW9L8VUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=79FInNMSLaherc7NshKSNL14rlvm3gvZlBDeqKAzniM=;
 b=IBBMoGaW+QU6R806yZ/sUgJlMlTK3rgqGOwaEg17NLci5Lnatq3+2oCf574t94QbzmpEC8vddipkgUV71FaLIzBmyaDysdNViLUk025doWwzZ2XMMKH/B208o8gwz3/cuMBNhmbaS3c/3bKap7ypP0R2grJZH3w8c8RDKjETiUFTYarj1iLcDUsADj9QGWBqVC/kYIzd54AeCsqKmhiVYjZkR5rxEyXrQ6WYAgifG7VIpAV6sr4FHvOYGB9wgpDG13oIuzqFgNMGCagFAjhReu60ymd4ff2gdX4C0SbSXIxrO1hZTVuyNhNo1VV5zPb8yrPRET9WKoUbBpHvIC+Kiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79FInNMSLaherc7NshKSNL14rlvm3gvZlBDeqKAzniM=;
 b=AebD2hzzcvTxUVr3fll+TsGA+sbkHgOxUAiSD0ZkUxNxxlCE7z3CgV0faWyrTQiUpzqfrbo4+/kXVSdKEfvX8vnJd5+o9LgPWNBZ1tTheqE6BatF2o5D7+uG7+YIsr7U/hj4WKSU8+WbRuS5CpbV24TafoTPQ+uh5iYWWBnQEiU=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Topic: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
Thread-Index:
 AQHXsHMtR+l18+MmpE6rl/RjSXTBgquyYmkAgAA2xQCAADnbAIAAKWhQgAAGUwCAAxtPwA==
Date: Sun, 26 Sep 2021 10:25:10 +0000
Message-ID:
 <DB9PR08MB6857EE6294A1062EE0FAF0289EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-21-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s>
 <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <b4433faf-bb70-d083-126c-0224da3d9a82@suse.com>
 <DB9PR08MB685742B691E39FD3161BFE289EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <a295cc34-9cc0-468b-c85a-2e5d1238d9a3@suse.com>
In-Reply-To: <a295cc34-9cc0-468b-c85a-2e5d1238d9a3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0BCB7650B8379645A2B386A0009AA27D.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ae0de3af-cc24-423d-88b7-08d980d7f4bf
x-ms-traffictypediagnostic: DB6PR0801MB1623:|AM6PR08MB4422:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4422EC8B427A0EA235431B239EA69@AM6PR08MB4422.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p4ROah0PDcr1MryGF8rtOy8LHnXNqVW0jEdoBoxi1LRFMYuFTC6Y4E9j5CDIqZXJdetORsV+GMZ542yGjEmhzkBn292xO1MGhTZeSQOAGLfDDGcOSOoL55/9ByU3eLrjP3hM5bzhiX18wIpk8zJO48dQhQH7Wf9uvghjfD4L0clVbunr/BTXUcZ2TNkIqhYvrNX+7Q0Ok3Ymm56p93/6YQyaOj4eVdo0ye3DMxd/ipvIiw94yOihWUixbq+4oTgxIDsoq8QI2Q34QNqdv0qtbOyB4MReIIxpR5cAMGQK9Fmw6Tqpxb2b+eUcw4EJO5GiY08vrS8xBcHps7O2JF1sBmwidkh4PllKFk/5tkYmyygoRHyTHoicXh5Uo7wnL78xS/wOjY/1+OdATrIAF0YEWfVJ5egWuqktzOemLq6/khMKb+hbC5qtSmfUBM8RjRi7QFMeo3wFSRe7oXxUG9bqtcbr4ocgRDB592qELa86TyqBqsEdVm4Y5yPmIWneoSfLDsoTXFgC4aLgXt2xxPf/een/OqisUIF0EuD/A7eD9rn9wKyljQi+lGhyfkZO85IXTyQmrN3h92lcSdgtMWyDiMf9B55qX27Cc5btTpZ6KSNbhm8xrG9f+vlxgAc2zyHZ1BJotuHka2QXzwq9XE6KtzHF5F978iQ4u7Pk2v0oADA/mvMyDvKZqMp9+MUAhSWLb0ZtzsgABjyf9NYaOAgdNXEDpHZs3b0oWjDxKBJ5qLxlTQlzR0SlWpBLLXMJluJbXWlubUU+/tJD/eVJPFvkZVtckr4GK8cIyrkOlLtNEBs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(52536014)(55016002)(6506007)(53546011)(33656002)(7696005)(86362001)(76116006)(316002)(66476007)(4326008)(66446008)(83380400001)(2906002)(508600001)(54906003)(64756008)(66946007)(66556008)(71200400001)(9686003)(6916009)(38070700005)(186003)(8676002)(122000001)(8936002)(38100700002)(966005)(26005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1623
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8a3058b8-99bc-4f72-94d1-08d980d7eb94
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZToLLbwpmrTMAYv/errTNUGVl7c61dHijqZDtNhBZSFDR3O7W7eINMb68NzkFZozhaQDnh/tITjWxkD91Q1qbNbkz4pOtmhfMuSVLqnrsYV8+ssFKDrgTWJa4qBOJloeKs/tz0ap6Jz0wIE1sbD7L4THjNwUGXtZ07W2jP3eVVfB32t2R7w/JP0FVF1zbDIAI956TuW0Mx7nrDerVcev67ZGvKARaNpII+AUq+KRECllIWdtVtBmkmSzc/66UGmeQZFWc+1LdQneamEP8Aq4NTjTmIzSCl1hRczcCPRkOybMZmsDjwKUCMwINvmX6ZAxUJxpBjGcmtxPf+BYhUYZkFoj+engp4GIT+NpWts+Sae9an/a/5cYWV0czuaZlmR2pk7kSOWjPlb8jeyhAd7P/Cw7dDWjhHYZzLcoPA6GIrK5b+E2xjQWO21SlQUh+cwZtoPX6c1doR4a0Z5/M+TKeAmqwWiDOsBIDRvQX2NpAktwj7U8OgK8IgFLqZkxK2dPgEyvv/8fGjcmKK0T2B1TWGLuT4+6sR0Rsh/F3Bitdcnc6OpODffQQigUGW5RA6VL2cAPtVaMi47p0nyasDSB5zllOvDs4eHk9/r50xFaeSdcMd8IekeKYJd7wtEtzMyzZdVcJ2/i3QWVSD3xz72pGC0TKz5TJvNWBY7HYhj8FySekWb+eZB2GzQk0XHMim1q8MEQqphVsmFAibDB0FcMmEP0JRrOQz4q12deB8U0xaQvyHIfpII4VFttk4zTLugvUcX3Dz5SoNjVlxahFLyel2MdzSzru1p/wwXDiHvPkf8=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(86362001)(36860700001)(316002)(8936002)(4326008)(336012)(9686003)(7696005)(966005)(52536014)(33656002)(82310400003)(2906002)(107886003)(47076005)(186003)(55016002)(356005)(83380400001)(70586007)(53546011)(26005)(508600001)(81166007)(6506007)(70206006)(6862004)(8676002)(54906003)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2021 10:25:26.2092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0de3af-cc24-423d-88b7-08d980d7f4bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4422

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFhlbi1kZXZl
bCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBK
YW4NCj4gQmV1bGljaA0KPiBTZW50OiAyMDIxxOo51MIyNMjVIDE4OjQ5DQo+IFRvOiBXZWkgQ2hl
biA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZzsganVsaWVuQHhlbi5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1aXNA
YXJtLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAyMC8zN10geGVuOiBpbnRyb2R1Y2UgQ09ORklHX0VGSSB0byBz
dHViIEFQSSBmb3Igbm9uLQ0KPiBFRkkgYXJjaGl0ZWN0dXJlDQo+IA0KPiBPbiAyNC4wOS4yMDIx
IDEyOjMxLCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPiA+PiBTZW50OiAyMDIxxOo51MIyNMjVIDE1OjU5DQo+ID4+DQo+ID4+IE9u
IDI0LjA5LjIwMjEgMDY6MzQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4+IEZyb206IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPj4+PiBTZW50OiAyMDIxxOo5
1MIyNMjVIDk6MTUNCj4gPj4+Pg0KPiA+Pj4+IE9uIFRodSwgMjMgU2VwIDIwMjEsIFdlaSBDaGVu
IHdyb3RlOg0KPiA+Pj4+PiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcNCj4gPj4+Pj4gKysrIGIv
eGVuL2NvbW1vbi9LY29uZmlnDQo+ID4+Pj4+IEBAIC0xMSw2ICsxMSwxNiBAQCBjb25maWcgQ09N
UEFUDQo+ID4+Pj4+ICBjb25maWcgQ09SRV9QQVJLSU5HDQo+ID4+Pj4+ICAJYm9vbA0KPiA+Pj4+
Pg0KPiA+Pj4+PiArY29uZmlnIEVGSQ0KPiA+Pj4+PiArCWJvb2wNCj4gPj4+Pg0KPiA+Pj4+IFdp
dGhvdXQgdGhlIHRpdGxlIHRoZSBvcHRpb24gaXMgbm90IHVzZXItc2VsZWN0YWJsZSAob3IgZGUt
DQo+IHNlbGVjdGFibGUpLg0KPiA+Pj4+IFNvIHRoZSBoZWxwIG1lc3NhZ2UgYmVsb3cgY2FuIG5l
dmVyIGJlIHNlZW4uDQo+ID4+Pj4NCj4gPj4+PiBFaXRoZXIgYWRkIGEgdGl0bGUsIGUuZy46DQo+
ID4+Pj4NCj4gPj4+PiBib29sICJFRkkgc3VwcG9ydCINCj4gPj4+Pg0KPiA+Pj4+IE9yIGZ1bGx5
IG1ha2UgdGhlIG9wdGlvbiBhIHNpbGVudCBvcHRpb24gYnkgcmVtb3ZpbmcgdGhlIGhlbHAgdGV4
dC4NCj4gPj4+DQo+ID4+PiBPSywgaW4gY3VycmVudCBYZW4gY29kZSwgRUZJIGlzIHVuY29uZGl0
aW9uYWxseSBjb21waWxlZC4gQmVmb3JlDQo+ID4+PiB3ZSBjaGFuZ2UgcmVsYXRlZCBjb2RlLCBJ
IHByZWZlciB0byByZW1vdmUgdGhlIGhlbHAgdGV4dC4NCj4gPj4NCj4gPj4gQnV0IHRoYXQncyBu
b3QgdHJ1ZTogQXQgbGVhc3Qgb24geDg2IEVGSSBnZXRzIGNvbXBpbGVkIGRlcGVuZGluZyBvbg0K
PiA+PiB0b29sIGNoYWluIGNhcGFiaWxpdGllcy4gVWx0aW1hdGVseSB3ZSBtYXkgaW5kZWVkIHdh
bnQgYSB1c2VyDQo+ID4+IHNlbGVjdGFibGUgb3B0aW9uIGhlcmUsIGJ1dCB1bnRpbCB0aGVuIEkn
bSBhZnJhaWQgaGF2aW5nIHRoaXMgb3B0aW9uDQo+ID4+IGF0IGFsbCBtYXkgYmUgbWlzbGVhZGlu
ZyBvbiB4ODYuDQo+ID4+DQo+ID4NCj4gPiBJIGNoZWNrIHRoZSBidWlsZCBzY3JpcHRzLCB5ZXMs
IHlvdSdyZSByaWdodC4gRm9yIHg4NiwgRUZJIGlzIG5vdCBhDQo+ID4gc2VsZWN0YWJsZSBvcHRp
b24gaW4gS2NvbmZpZy4gSSBhZ3JlZSB3aXRoIHlvdSwgd2UgY2FuJ3QgdXNlIEtjb25maWcNCj4g
PiBzeXN0ZW0gdG8gZGVjaWRlIHRvIGVuYWJsZSBFRkkgYnVpbGQgZm9yIHg4NiBvciBub3QuDQo+
ID4NCj4gPiBTbyBob3cgYWJvdXQgd2UganVzdCB1c2UgdGhpcyBFRkkgb3B0aW9uIGZvciBBcm0g
b25seT8gQmVjYXVzZSBvbiBBcm0sDQo+ID4gd2UgZG8gbm90IGhhdmUgc3VjaCB0b29sY2hhaW4g
ZGVwZW5kZW5jeS4NCj4gDQo+IFRvIGJlIGhvbmVzdCAtIGRvbid0IGtub3cuIFRoYXQncyBiZWNh
dXNlIEkgZG9uJ3Qga25vdyB3aGF0IHlvdSB3YW50DQo+IHRvIHVzZSB0aGUgb3B0aW9uIGZvciBz
dWJzZXF1ZW50bHkuDQo+IA0KDQpJbiBsYXN0IHZlcnNpb24sIEkgaGFkIGludHJvZHVjZWQgYW4g
YXJjaC1oZWxwZXIgdG8gc3R1YiBFRklfQk9PVA0KaW4gQXJtJ3MgY29tbW9uIGNvZGUgZm9yIEFy
bTMyLiBCZWNhdXNlIEFybTMyIGRvZXNuJ3Qgc3VwcG9ydCBFRkkuDQpTbyBKdWxpZW4gc3VnZ2Vz
dGVkIG1lIHRvIGludHJvZHVjZSBhIENPTkZJR19FRkkgb3B0aW9uIGZvciBub24tRUZJDQpzdXBw
b3J0ZWQgYXJjaGl0ZWN0dXJlcyB0byBzdHViIGluIEVGSSBsYXllci4NCg0KWzFdIGh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMS0wOC9tc2cw
MDgwOC5odG1sDQoNCj4gSmFuDQo+IA0KDQo=

