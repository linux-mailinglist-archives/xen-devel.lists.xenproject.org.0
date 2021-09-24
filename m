Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9863141705F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 12:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.195245.347883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiWn-000275-3F; Fri, 24 Sep 2021 10:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195245.347883; Fri, 24 Sep 2021 10:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTiWm-00024f-W8; Fri, 24 Sep 2021 10:34:00 +0000
Received: by outflank-mailman (input) for mailman id 195245;
 Fri, 24 Sep 2021 10:33:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTiWl-00023q-06
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 10:33:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec739dfd-1d22-11ec-babb-12813bfff9fa;
 Fri, 24 Sep 2021 10:33:58 +0000 (UTC)
Received: from AM5PR0701CA0063.eurprd07.prod.outlook.com (2603:10a6:203:2::25)
 by AS8PR08MB7047.eurprd08.prod.outlook.com (2603:10a6:20b:347::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 10:33:50 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::28) by AM5PR0701CA0063.outlook.office365.com
 (2603:10a6:203:2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.7 via Frontend
 Transport; Fri, 24 Sep 2021 10:33:50 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 10:33:49 +0000
Received: ("Tessian outbound b324a1dbd9be:v103");
 Fri, 24 Sep 2021 10:33:45 +0000
Received: from 1c83914c6937.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BD9AD9D4-FCC2-4B9A-A60A-1ABCD5D31AC6.1; 
 Fri, 24 Sep 2021 10:33:34 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c83914c6937.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 10:33:34 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6959.eurprd08.prod.outlook.com (2603:10a6:10:2bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 10:33:32 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 10:33:32 +0000
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
X-Inumbo-ID: ec739dfd-1d22-11ec-babb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrlQQVZM2whjIHVadx7f0f/C77QMIN1PZzvyKX895Sg=;
 b=+GprZigTHLRYYoFRBqETpbyO36KImJXu5mUTNM5EFxkoqQ+QX+09eRKucK4UlG0RMBDyq8U41moTArTKdR6snG4fs7PfYDGozlsEeV6yJnU7W+albjicfXePnh/tjGg1SzSE6jXK93N0PZ+w6FlAJFM7Y+ypjVi4yU+6dgqXj6Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B805XAQ03J4Pp3AOwMHMaOZIMPxjs44QiOkCy3AqOvx+40z4ehpHrr09hq7ICNvMmXQG+0ELSUHSUK0PVczuCxJC6XzXLQmRWA8atq76JTezwXXtKnvGvFJDbw95Wh9tJyZgXeRj5UK2mdCQDs8LWXXnra8GjVKGGE7iVVVP6CYGzOoaLrHteJfx+GoQTjLo7QHmAAGK3mW+96d4VwPpKcpaWlLrqDhGxu3fMTccnmdekj7lBO8KdCOsfGTWgAe3Co3GXWT/kFdMPqafebqw8gwcHPmFaebGW1zpi9AQzhwohCk0AjRg4ZWdJstdmd67ZvY5LKff3BqVhEUj/cR3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NrlQQVZM2whjIHVadx7f0f/C77QMIN1PZzvyKX895Sg=;
 b=J1UiPMHekcWbdEXABqBq2ygvS/B8OmmJwQ0M5BJa5dCMkhJ6/Ejpqo+hwoJJfaHc2gLf/gr6Y5IeCczQB2ZM0uDFhAILat0JPnAdWw2+8jTbLBigp2pMNsbUkkVGGcaG6AF+CZYaIgGEqMvaKCvfYgSyGsXhyZpj8mMLwsbzOsJIYi9V4w+wRvmhZ7E0Vch/9pfjX7ddHLRZTjgS+WNw0TthVWnbrXUDVolQQHCHFgT6wIK43D+vhqf0bFwy0RqqKsjKAyJ/2rSu+HiQ+6BhaW8lql1+tZ1PNSKNRV/fGBZojVFcY3S0q6qxODnVEn5rVZog+tT/9U0fPxGcKj9l5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrlQQVZM2whjIHVadx7f0f/C77QMIN1PZzvyKX895Sg=;
 b=+GprZigTHLRYYoFRBqETpbyO36KImJXu5mUTNM5EFxkoqQ+QX+09eRKucK4UlG0RMBDyq8U41moTArTKdR6snG4fs7PfYDGozlsEeV6yJnU7W+albjicfXePnh/tjGg1SzSE6jXK93N0PZ+w6FlAJFM7Y+ypjVi4yU+6dgqXj6Q=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 02/37] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Topic: [PATCH 02/37] xen: introduce a Kconfig option to configure NUMA
 nodes number
Thread-Index: AQHXsHMKuuhjNuZvvk2uWABlJOqp6quy4w2AgAAazgA=
Date: Fri, 24 Sep 2021 10:33:31 +0000
Message-ID:
 <DB9PR08MB6857E123564C930D7BC1E2BF9EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-3-wei.chen@arm.com>
 <9bec4214-5f50-9ea5-0212-52d248b63ca6@suse.com>
In-Reply-To: <9bec4214-5f50-9ea5-0212-52d248b63ca6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 439BC191470FD1479D88350AB35075D3.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8970f3e1-eb0c-4fde-56b2-08d97f46cc2f
x-ms-traffictypediagnostic: DB9PR08MB6959:|AS8PR08MB7047:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB7047CE069F4715DB1143EA929EA49@AS8PR08MB7047.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Q7BexfQiy2eSahceS3/lePYT7wHscCkdraL5arT1UvcevuSZ8/lFw0cq6Y2lwOT/3IatZf0v9G8UbM+lFjrAR9JJJVgQGqsenLqYYyTJR79mltiQBwFlvnTOAV4xRSrzxVvtIICdSFepzDhtPtKhZeQroEzdEE9ZXx3fwAgdUXl0M/nmP0Vuap6h58/uXf52QW0LqEfynDdnYSrGjU0av9ewefTIVt41hGll5gNP+IsMpAO0XZFXKVmaQe8KTJI9XFPpRfdpzkcc1eEnkJ/aPTnWGyrwZdvSf5nlZ/BAuOyZpIgWOsUhUrdQhoDQVE4cPX/z9E24J7lk6EijHp2J1f5L8d5+ZdKUcLPjrUtYbpD/TZC1f9e5LSeB6kxJQ/ZyxpA4JRJ8+J/WEv0+R1gZP7mMRlGPDf9xLnObgiFVav1Ohm7pq2YftlL1EtVRB2prW4lISsmNP/jaDoJhKSYaRhqkNKVpcWzgh7PqhkODTQ3+QvmMThPCi+1lHffIOQmbTYKXgT14h7z7UVnkEkUBh5lzqYP4EYsB8MRKpgD4dCYpzyyMtBKSZ9npypA3LGluiNMRFlcudi93tj3LxsZp7+VmQPVkpRDtfjhDWqAvKDMW6+fR5JnCcOam5xQmMixeIgybZ0kQhB/T1YVl7ehcYnar6qzJ2c4m0kZ2QP+JH0iTrBO3hUBzA53ye0jvEBs475HftZcCQ6rNYjSv6rJS6A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(4326008)(54906003)(66446008)(71200400001)(66476007)(66556008)(8676002)(186003)(5660300002)(66946007)(9686003)(316002)(33656002)(8936002)(76116006)(55016002)(508600001)(86362001)(6916009)(38070700005)(26005)(122000001)(53546011)(52536014)(83380400001)(6506007)(7696005)(38100700002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6959
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51ea5b40-3288-4e7b-ae97-08d97f46c1a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SR6krs5aFaXipFny0Ma33KOc27TGS/GXCCi4y8bFIHHBlDyhi/YGbgLT1aOSfTzPTGpixXAvmikEw5n5R/o43mVyY4lbYDIeqZiKejCSN13Ip8vYgzysbSRGbt8CtEayCav8+mJQvSGTB7d9MBA8/bW5qBs6119rF5uOfhH0VtKNCRt/GmdY1kx+ihjx2f7zKAKTh9DfgydrO/9UQU4MMZoqm6FS/9kfRNbYM4r4iVbO0IVqYniIwUS6DEq9qfYSHONgQBkVKLU8CdlRPwwHeU2/W222ubehaNVMXE1e8LBMna5jfDx896NPQzafPSw15YQxbnDsX3CVhMsF70okRY1TxkAixSyZ2jYNHlg9Bc++X250Vc+7sxg+EbPTThRwhGotFSSv9qpEXKONFhREqkgBBmm6haDknHWFQ2+gp1Hc/fwdPFlu3l1m2/phFPzS3k0bi/XDi2UrVHqzJPgJ5o9XkwvuUA6QL7EFJBIBd0ze7cby+Zdc/mW8TLTj4cXlOfp1uK5DKLJxrIdfLblIltNGlEtKWi0DHMOKWYzgRG4gaSrC+hluOgExUjEwlW4f/V+BWU+AIRcQ9+Tx9IARgCvHBWtSVu8sQ3ZWHCAK5nGje+JaLnOaGEeHO1v6c8Mp4lLVlvhjnCokvouG9RdPnYrLexV4IsF+dIGrby5B0aZ2lriyaAqWwEMOxZwyZXQZ+LEh5P/Jr6ebZTL7+w/QRw==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(55016002)(53546011)(82310400003)(70586007)(83380400001)(86362001)(2906002)(186003)(8676002)(33656002)(8936002)(36860700001)(356005)(81166007)(70206006)(6506007)(47076005)(7696005)(54906003)(5660300002)(26005)(9686003)(52536014)(6862004)(336012)(4326008)(508600001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 10:33:49.8679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8970f3e1-eb0c-4fde-56b2-08d97f46cc2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7047

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDnmnIgyNOaXpSAxNjo1Ng0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDAyLzM3XSB4ZW46IGludHJvZHVjZSBhIEtjb25maWcgb3B0aW9uIHRvIGNv
bmZpZ3VyZQ0KPiBOVU1BIG5vZGVzIG51bWJlcg0KPiANCj4gT24gMjMuMDkuMjAyMSAxNDowMiwg
V2VpIENoZW4gd3JvdGU6DQo+ID4gQ3VycmVudCBOVU1BIG5vZGVzIG51bWJlciBpcyBhIGhhcmRj
b2RlIGNvbmZpZ3VyYXRpb24uIFRoaXMNCj4gPiBjb25maWd1cmF0aW9uIGlzIGRpZmZpY3VsdCBm
b3IgYW4gYWRtaW5pc3RyYXRvciB0byBjaGFuZ2UNCj4gPiB1bmxlc3MgY2hhbmdpbmcgdGhlIGNv
ZGUuDQo+ID4NCj4gPiBTbyBpbiB0aGlzIHBhdGNoLCB3ZSBpbnRyb2R1Y2UgdGhpcyBuZXcgS2Nv
bmZpZyBvcHRpb24gZm9yDQo+ID4gYWRtaW5pc3RyYXRvcnMgdG8gY2hhbmdlIE5VTUEgbm9kZXMg
bnVtYmVyIGNvbnZlbmllbnRseS4NCj4gPiBBbHNvIGNvbnNpZGVyaW5nIHRoYXQgbm90IGFsbCBh
cmNoaXRlY3R1cmVzIHN1cHBvcnQgTlVNQSwNCj4gPiB0aGlzIEtjb25maWcgb3B0aW9uIG9ubHkg
Y2FuIGJlIHZpc2libGUgb24gTlVNQSBlbmFibGVkDQo+ID4gYXJjaGl0ZWN0dXJlcy4gTm9uLU5V
TUEgc3VwcG9ydGVkIGFyY2hpdGVjdHVyZXMgY2FuIHN0aWxsDQo+ID4gdXNlIDEgYXMgTUFYX05V
TU5PREVTLg0KPiANCj4gRG8geW91IHJlYWxseSBtZWFuIGFkbWluaXN0cmF0b3JzIGhlcmU/IFRv
IG1lIGNvbW1hbmQgbGluZSBvcHRpb25zDQo+IGFyZSBmb3IgYWRtaW5pc3RyYXRvcnMsIGJ1dCBi
dWlsZCBkZWNpc2lvbnMgYXJlIHVzdWFsbHkgdGFrZW4gYnkNCj4gYnVpbGQgbWFuYWdlcnMgb2Yg
ZGlzdHJvcy4NCj4gDQo+ID4gLS0tIGEveGVuL2FyY2gvS2NvbmZpZw0KPiA+ICsrKyBiL3hlbi9h
cmNoL0tjb25maWcNCj4gPiBAQCAtMTcsMyArMTcsMTQgQEAgY29uZmlnIE5SX0NQVVMNCj4gPiAg
CSAgRm9yIENQVSBjb3JlcyB3aGljaCBzdXBwb3J0IFNpbXVsdGFuZW91cyBNdWx0aS1UaHJlYWRp
bmcgb3INCj4gc2ltaWxhcg0KPiA+ICAJICB0ZWNobm9sb2dpZXMsIHRoaXMgdGhlIG51bWJlciBv
ZiBsb2dpY2FsIHRocmVhZHMgd2hpY2ggWGVuIHdpbGwNCj4gPiAgCSAgc3VwcG9ydC4NCj4gPiAr
DQo+ID4gK2NvbmZpZyBOUl9OVU1BX05PREVTDQo+ID4gKwlpbnQgIk1heGltdW0gbnVtYmVyIG9m
IE5VTUEgbm9kZXMgc3VwcG9ydGVkIg0KPiA+ICsJcmFuZ2UgMSA0MDk1DQo+IA0KPiBIb3cgd2Fz
IHRoaXMgdXBwZXIgYm91bmQgZXN0YWJsaXNoZWQ/IFNlZWluZyA0MDk1IGlzIHRoZSBsaW1pdCBv
ZiB0aGUNCj4gbnVtYmVyIG9mIENQVXMsIGRvIHdlIHJlYWxseSBleHBlY3QgYSBDUFUgcGVyIG5v
ZGUgb24gc3VjaCBodWdlDQo+IHN5c3RlbXM/IEFuZCBkaWQgeW91IGNoZWNrIHRoYXQgd2hpY2hl
dmVyIGludm9sdmVkIGRhdGEgdHlwZXMgYW5kDQo+IHN0cnVjdHVyZXMgYXJlIGFjdHVhbGx5IHN1
aXRhYmxlPyBJJ20gdGhpbmtpbmcgZS5nLiBvZiB0aGluZ3MgbGlrZSAuLi4NCj4gDQo+ID4gLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9udW1hLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
eDg2L251bWEuaA0KPiA+IEBAIC0zLDggKzMsNiBAQA0KPiA+DQo+ID4gICNpbmNsdWRlIDx4ZW4v
Y3B1bWFzay5oPg0KPiA+DQo+ID4gLSNkZWZpbmUgTk9ERVNfU0hJRlQgNg0KPiA+IC0NCj4gPiAg
dHlwZWRlZiB1OCBub2RlaWRfdDsNCj4gDQo+IC4uLiB0aGlzLg0KPiANCg0KeW91J3JlIHJpZ2h0
LCB3ZSB1c2UgdTggYXMgbm9kZWlkX3QuIDQwOTUgZm9yIG5vZGUgbnVtYmVyIGluIHRoaXMgb3B0
aW9uDQppcyBub3QgcmVhc29uYWJsZS4gTWF5YmUgYSAyNTUgdXBwZXIgYm91bmQgaXMgZ29vZD8N
Cg0KPiBKYW4NCg0K

