Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4516E7966
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 14:10:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523403.813418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6d8-0004Yp-BL; Wed, 19 Apr 2023 12:09:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523403.813418; Wed, 19 Apr 2023 12:09:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp6d8-0004Wx-7M; Wed, 19 Apr 2023 12:09:46 +0000
Received: by outflank-mailman (input) for mailman id 523403;
 Wed, 19 Apr 2023 12:09:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWR0=AK=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pp6d5-0004Wp-Rn
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 12:09:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f1441e4-deab-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 14:09:39 +0200 (CEST)
Received: from DB6PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:6:2d::16) by
 DU0PR08MB9749.eurprd08.prod.outlook.com (2603:10a6:10:447::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Wed, 19 Apr 2023 12:09:35 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::97) by DB6PR07CA0006.outlook.office365.com
 (2603:10a6:6:2d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 12:09:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 12:09:35 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Wed, 19 Apr 2023 12:09:35 +0000
Received: from 11222cb61d24.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F95AF0CE-BD80-46A7-9061-333E9A9CD6A9.1; 
 Wed, 19 Apr 2023 12:09:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11222cb61d24.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Apr 2023 12:09:28 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8186.eurprd08.prod.outlook.com (2603:10a6:10:3ed::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 12:09:26 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6319.021; Wed, 19 Apr 2023
 12:09:26 +0000
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
X-Inumbo-ID: 0f1441e4-deab-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awbrBfCio7YdH3xda32FMegz90Dh6jCKwnYTiPnYrKU=;
 b=KFWcSGvsGrtadckYupMKVEmG2WrZFPeFvfMwlpC6vMeisVsk7HgSWOzTmR6xS4ItaLAwopT8qG+dJpBjR4tupZNq0odjCgUvR6kU/n+AK95dDJSIijJY/4mY6r3wtk7V88iiYm/CdttLrIEK83TWwr8WgFPn1tvzEWw+oYNBsUg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6c29f8f1fbe5ec7a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W81b7/9WFx25EUuLy69CDM1G/YnhyrJXvFdZUwouYAczQnz3d5aQxy6o2xbTOfaBbuvYZPr4GM96+3jg86dZXjGjLWYLiD1u2q++OyQT/dFgVvPnAv8HlZ9hdXZWJeUTmQjxl2E8x+TCok28J3D+ivglhnTQ5QQlu87XmEilLQkQChKeawk3VEB/szuEh7Ti7Ub7VrTyUTLVVdl7XAtYOrheRN3jYZJhTHiJ4YhS+x5TCi929JXyEmc7tRKAv3i4B33riGZgpxQjD+wE5coQc/NwlUWnt/uqPlzUrs/J+m7gqF/pOmzd0r4ldcBClqKgP8+kPXgCG/mQM7sNaS8E/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awbrBfCio7YdH3xda32FMegz90Dh6jCKwnYTiPnYrKU=;
 b=IgufVjchQE6v/pgjCsVzIecKXcnwV3qunpeOuRLLEQFPwwyIxZNs9KnMWMHEXWPqYLc5msKfu3NkQCKuoxT8eL6ufvNQch1mAchgMmYDce8s5NHBWQJMfRqM0aC/TxoYDaFp2HYAzofDxK6CLEZ5ufmr6QqOmMN02sW2UdxKj3LdarT5P2jSM8dVTbF6gfGiYfNYam3+Sw8A0JAVpEgp2CF0S8IknlWwmeAX8LtxoIfOM04TU0+yeGpOe7hsm2Yll1Ehruc2J2QTm6f+enDrZ71uxRy40qfHdejfA5U5D0zBXy8gNTABMRYPKV0+JcSjun96wlgKeEbdqAADDXXyoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awbrBfCio7YdH3xda32FMegz90Dh6jCKwnYTiPnYrKU=;
 b=KFWcSGvsGrtadckYupMKVEmG2WrZFPeFvfMwlpC6vMeisVsk7HgSWOzTmR6xS4ItaLAwopT8qG+dJpBjR4tupZNq0odjCgUvR6kU/n+AK95dDJSIijJY/4mY6r3wtk7V88iiYm/CdttLrIEK83TWwr8WgFPn1tvzEWw+oYNBsUg=
From: Henry Wang <Henry.Wang@arm.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Community Manager <community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: RE: [PATCH v2] xen/vcpu: ignore VCPU_SSHOTTMR_future
Thread-Topic: [PATCH v2] xen/vcpu: ignore VCPU_SSHOTTMR_future
Thread-Index: AQHZcrSSidx067y7IEiVJ78Xlkkoda8yiarw
Date: Wed, 19 Apr 2023 12:09:26 +0000
Message-ID:
 <AS8PR08MB79911D8D4C0B64076EDCF11E92629@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230419114556.34856-1-roger.pau@citrix.com>
In-Reply-To: <20230419114556.34856-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B09FA0A7610A0A498DFA606086FD79EC.0
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8186:EE_|DBAEUR03FT042:EE_|DU0PR08MB9749:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de764b0-610a-43cf-2469-08db40cef108
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JQMp6prhlB+S2Bp+R5I6g8DtZqV48HYrpQfmltsw4uA69FhMc49XjjaZEdRWecEii/IL1eU3DJFdLrijQ71FPkKIMuDKURjU7DshG+7Sc8zjKvm4Beseauk+YZY/8KOw3hn0RDyX0tXM3tf9hBnIdeqQpk4u8SRAPaGH0xPDSnbM2XOls6Iypxz5J931iZ/6EvR8M+pXkFT+PUzpyVIAT2/WsqTxr+8ClrdX9WYv8qk3rlqnP7MxbSy9lY0UzvIGFYrx3XXP9FziQkYL4Q9PePpH1eEuDZaRU/VW6RKHpSm6TZXxwDiBtsdA9Ffat+GYiskBSFwn/sbBlBw94dPXzsIbk28zku1LHwkmcVHG+1eg5G0BKOIfOYCi9cM9469k7bCRwBdk6u3phlkni3HNrcJj1kgR7HC/H51LsI38MUrcHWsniZHcJWVBEOEUcRvEe8WErcwcN/6IsGxvs2P9T0pA7O4191JUdxxH33tLGa8gOnk+cmh4F3Yk/6XFWwzqg1DFvF6Gd242Y0wyYbvWyMqBGW5bmaBkpLqfXZ6M7sKbpRz9OXz35uAJFZlVuuWXRb5SzUxKlHRumoahCBa8Glz1y0ill8TVJjrsHEe6UuC6BX/wbgThUuZZE1PY02Ej
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(54906003)(4326008)(110136005)(66946007)(66556008)(316002)(66446008)(64756008)(76116006)(66476007)(7696005)(478600001)(38070700005)(8936002)(71200400001)(41300700001)(8676002)(5660300002)(122000001)(52536014)(33656002)(86362001)(55016003)(2906002)(83380400001)(6506007)(9686003)(26005)(186003)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8186
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea9a9f6b-95a5-4316-cedc-08db40ceeba8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XUQgNHeL69TSas7WEI0R5C2XXirKHAA+LmjzLWusgxfCwePTPPEG10J+q1fxXzUaVkh+PcfuSpzsnav6ZgSpB6MzdCRar/LD2hp+KtS7kDqSULVQ5AqNdeXR/qIALTD7mi9WdE+zCKLeP5LAsn+yqq6hti7FjGrORY0ykqbhzzKgAWK01Yqj/bZ4oCngpo71VBTEV7i8WfNy4tSyU5sXYcJPgiBiegcEdVJjHHFmzI5Ryh3sKjRtE5bfK2kd09S1UHeGX8FZSES38QzDCeFLmjxXQoXEU0EYC31htDeQ0deSgRfCIXkFCO9zzK72YgC/9Sxyt70VxIcv3ABPM1zS0+vCdlApwqgB354ZMR4e5q6cPRVhpzH0/FzPMPylvrfj+2ouiw1TuUlkDBbz64hZkScvopAZKUooj+kSx9QOajx/uu1gBASexwFaliHClegJgqqA95+UWFH7hVS9NSz3vBeSFugg95eGjcCncC9+i98BlxCkJTYcQEnQHqd8y9/vD9SmzulAmjTq7rL0BmS1hagd4qb7NRwMr/1EVvaKo7gZy3X5bta0pdkOuI3hB6pgzj9108m32Wk6aI2Dh90OnJUFfQZ18N69GRQrXiyp3lAuc+uOF/MaU2NgdNuQuYGUCfPnOKVMaplp2J/VheSjWR72ooRbyp14klxjlbDEpnlcRKWYFF4+71s/JV0wrc/yufrnXCSnBQ8C8nhzyGdsZN9WjKh8OmHEgmSk9ckyQuIQE/6oxXYpJAPcVA20UzVa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(86362001)(8676002)(41300700001)(70206006)(70586007)(8936002)(4326008)(5660300002)(52536014)(316002)(110136005)(7696005)(356005)(54906003)(82310400005)(82740400003)(81166007)(478600001)(40460700003)(26005)(47076005)(33656002)(36860700001)(6506007)(83380400001)(336012)(55016003)(9686003)(186003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 12:09:35.4184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de764b0-610a-43cf-2469-08db40cef108
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9749

SGkgUm9nZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyXSB4
ZW4vdmNwdTogaWdub3JlIFZDUFVfU1NIT1RUTVJfZnV0dXJlDQo+IA0KPiBUaGUgdXNhZ2Ugb2Yg
VkNQVV9TU0hPVFRNUl9mdXR1cmUgaW4gTGludXggcHJpb3IgdG8gNC43IGlzIGJvZ3VzLg0KPiBX
aGVuIHRoZSBoeXBlcnZpc29yIHJldHVybnMgLUVOT1RJTUUgKHRpbWVvdXQgaW4gdGhlIHBhc3Qp
IExpbnV4IGtlZXBzDQo+IHJldHJ5aW5nIHRvIHNldHVwIHRoZSB0aW1lciB3aXRoIGEgaGlnaGVy
IHRpbWVvdXQgaW5zdGVhZCBvZg0KPiBzZWxmLWluamVjdGluZyBhIHRpbWVyIGludGVycnVwdC4N
Cj4gDQo+IE9uIGJveGVzIHdpdGhvdXQgYW55IGhhcmR3YXJlIGFzc2lzdGFuY2UgZm9yIGxvZ2Rp
cnR5IHdlIGhhdmUgc2VlbiBIVk0NCj4gTGludXggZ3Vlc3RzIDwgNC43IHdpdGggMzJ2Q1BVcyBn
aXZlIHVwIHRyeWluZyB0byBzZXR1cCB0aGUgdGltZXIgd2hlbg0KPiBsb2dkaXJ0eSBpcyBlbmFi
bGVkOg0KPiANCj4gQ0U6IFJlcHJvZ3JhbW1pbmcgZmFpbHVyZS4gR2l2aW5nIHVwDQo+IENFOiB4
ZW4gaW5jcmVhc2VkIG1pbl9kZWx0YV9ucyB0byAxMDAwMDAwIG5zZWMNCj4gQ0U6IFJlcHJvZ3Jh
bW1pbmcgZmFpbHVyZS4gR2l2aW5nIHVwDQo+IENFOiBSZXByb2dyYW1taW5nIGZhaWx1cmUuIEdp
dmluZyB1cA0KPiBDRTogeGVuIGluY3JlYXNlZCBtaW5fZGVsdGFfbnMgdG8gNTA2MjUwIG5zZWMN
Cj4gQ0U6IHhlbiBpbmNyZWFzZWQgbWluX2RlbHRhX25zIHRvIDc1OTM3NSBuc2VjDQo+IENFOiB4
ZW4gaW5jcmVhc2VkIG1pbl9kZWx0YV9ucyB0byAxMDAwMDAwIG5zZWMNCj4gQ0U6IFJlcHJvZ3Jh
bW1pbmcgZmFpbHVyZS4gR2l2aW5nIHVwDQo+IENFOiBSZXByb2dyYW1taW5nIGZhaWx1cmUuIEdp
dmluZyB1cA0KPiBDRTogUmVwcm9ncmFtbWluZyBmYWlsdXJlLiBHaXZpbmcgdXANCj4gRnJlZXpp
bmcgdXNlciBzcGFjZSBwcm9jZXNzZXMgLi4uDQo+IElORk86IHJjdV9zY2hlZCBkZXRlY3RlZCBz
dGFsbHMgb24gQ1BVcy90YXNrczogeyAxNH0gKGRldGVjdGVkIGJ5IDEwLCB0PTYwMDAyDQo+IGpp
ZmZpZXMsIGc9NDAwNiwgYz00MDA1LCBxPTE0MTMwKQ0KPiBUYXNrIGR1bXAgZm9yIENQVSAxNDoN
Cj4gc3dhcHBlci8xNCAgICAgIFIgIHJ1bm5pbmcgdGFzayAgICAgICAgMCAgICAgMCAgICAgIDEg
MHgwMDAwMDAwMA0KPiBDYWxsIFRyYWNlOg0KPiAgWzxmZmZmZmZmZjkwMTYwZjVkPl0gPyByY3Vf
ZXFzX2VudGVyX2NvbW1vbi5pc3JhLjMwKzB4M2QvMHhmMA0KPiAgWzxmZmZmZmZmZjkwN2I5YmRl
Pl0gPyBkZWZhdWx0X2lkbGUrMHgxZS8weGQwDQo+ICBbPGZmZmZmZmZmOTAwMzk1NzA+XSA/IGFy
Y2hfY3B1X2lkbGUrMHgyMC8weGMwDQo+ICBbPGZmZmZmZmZmOTAxMDgyMGE+XSA/IGNwdV9zdGFy
dHVwX2VudHJ5KzB4MTRhLzB4MWUwDQo+ICBbPGZmZmZmZmZmOTAwNWQzYTc+XSA/IHN0YXJ0X3Nl
Y29uZGFyeSsweDFmNy8weDI3MA0KPiAgWzxmZmZmZmZmZjkwMDAwMGQ1Pl0gPyBzdGFydF9jcHUr
MHg1LzB4MTQNCj4gSU5GTzogcmN1X3NjaGVkIGRldGVjdGVkIHN0YWxscyBvbiBDUFVzL3Rhc2tz
OiB7IDI2fSAoZGV0ZWN0ZWQgYnkgMjQsIHQ9NjAwMDINCj4gamlmZmllcywgZz02OTIyLCBjPTY5
MjEsIHE9NzAxMykNCj4gVGFzayBkdW1wIGZvciBDUFUgMjY6DQo+IHN3YXBwZXIvMjYgICAgICBS
ICBydW5uaW5nIHRhc2sgICAgICAgIDAgICAgIDAgICAgICAxIDB4MDAwMDAwMDANCj4gQ2FsbCBU
cmFjZToNCj4gIFs8ZmZmZmZmZmY5MDE2MGY1ZD5dID8gcmN1X2Vxc19lbnRlcl9jb21tb24uaXNy
YS4zMCsweDNkLzB4ZjANCj4gIFs8ZmZmZmZmZmY5MDdiOWJkZT5dID8gZGVmYXVsdF9pZGxlKzB4
MWUvMHhkMA0KPiAgWzxmZmZmZmZmZjkwMDM5NTcwPl0gPyBhcmNoX2NwdV9pZGxlKzB4MjAvMHhj
MA0KPiAgWzxmZmZmZmZmZjkwMTA4MjBhPl0gPyBjcHVfc3RhcnR1cF9lbnRyeSsweDE0YS8weDFl
MA0KPiAgWzxmZmZmZmZmZjkwMDVkM2E3Pl0gPyBzdGFydF9zZWNvbmRhcnkrMHgxZjcvMHgyNzAN
Cj4gIFs8ZmZmZmZmZmY5MDAwMDBkNT5dID8gc3RhcnRfY3B1KzB4NS8weDE0DQo+IElORk86IHJj
dV9zY2hlZCBkZXRlY3RlZCBzdGFsbHMgb24gQ1BVcy90YXNrczogeyAyNn0gKGRldGVjdGVkIGJ5
IDI0LCB0PTYwMDAyDQo+IGppZmZpZXMsIGc9ODQ5OSwgYz04NDk4LCBxPTc2NjQpDQo+IFRhc2sg
ZHVtcCBmb3IgQ1BVIDI2Og0KPiBzd2FwcGVyLzI2ICAgICAgUiAgcnVubmluZyB0YXNrICAgICAg
ICAwICAgICAwICAgICAgMSAweDAwMDAwMDAwDQo+IENhbGwgVHJhY2U6DQo+ICBbPGZmZmZmZmZm
OTAxNjBmNWQ+XSA/IHJjdV9lcXNfZW50ZXJfY29tbW9uLmlzcmEuMzArMHgzZC8weGYwDQo+ICBb
PGZmZmZmZmZmOTA3YjliZGU+XSA/IGRlZmF1bHRfaWRsZSsweDFlLzB4ZDANCj4gIFs8ZmZmZmZm
ZmY5MDAzOTU3MD5dID8gYXJjaF9jcHVfaWRsZSsweDIwLzB4YzANCj4gIFs8ZmZmZmZmZmY5MDEw
ODIwYT5dID8gY3B1X3N0YXJ0dXBfZW50cnkrMHgxNGEvMHgxZTANCj4gIFs8ZmZmZmZmZmY5MDA1
ZDNhNz5dID8gc3RhcnRfc2Vjb25kYXJ5KzB4MWY3LzB4MjcwDQo+ICBbPGZmZmZmZmZmOTAwMDAw
ZDU+XSA/IHN0YXJ0X2NwdSsweDUvMHgxNA0KPiANCj4gVGh1cyBsZWFkaW5nIHRvIENQVSBzdGFs
bHMgYW5kIGEgYnJva2VuIHN5c3RlbSBhcyBhIHJlc3VsdC4NCj4gDQo+IFdvcmthcm91bmQgdGhp
cyBib2d1cyB1c2FnZSBieSBpZ25vcmluZyB0aGUgVkNQVV9TU0hPVFRNUl9mdXR1cmUgaW4NCj4g
dGhlIGh5cGVydmlzb3IuICBPbGQgTGludXggdmVyc2lvbnMgYXJlIHRoZSBvbmx5IG9uZXMga25v
d24gdG8gaGF2ZQ0KPiAod3JvbmdseSkgYXR0ZW1wdGVkIHRvIHVzZSB0aGUgZmxhZywgYW5kIGln
bm9yaW5nIGl0IGlzIGNvbXBhdGlibGUNCj4gd2l0aCB0aGUgYmVoYXZpb3IgZXhwZWN0ZWQgYnkg
YW55IGd1ZXN0cyBzZXR0aW5nIHRoYXQgZmxhZy4NCj4gDQo+IE5vdGUgdGhlIHVzYWdlIG9mIHRo
ZSBmbGFnIGhhcyBiZWVuIHJlbW92ZWQgZnJvbSBMaW51eCBieSBjb21taXQ6DQo+IA0KPiBjMDZi
NmQ3MGZlYjMgeGVuL3g4NjogZG9uJ3QgbG9zZSBldmVudCBpbnRlcnJ1cHRzDQo+IA0KPiBXaGlj
aCBsYW5kZWQgaW4gTGludXggNC43Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNCkFja2VkLWJ5OiBIZW5yeSBXYW5nIDxIZW5y
eS5XYW5nQGFybS5jb20+ICMgQ0hBTkdFTE9HDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

