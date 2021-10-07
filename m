Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7B425443
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 15:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203585.358729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYTaH-0006FQ-RI; Thu, 07 Oct 2021 13:37:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203585.358729; Thu, 07 Oct 2021 13:37:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYTaH-0006DI-Nd; Thu, 07 Oct 2021 13:37:17 +0000
Received: by outflank-mailman (input) for mailman id 203585;
 Thu, 07 Oct 2021 13:37:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/ki=O3=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mYTaF-0006DC-Po
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 13:37:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::61b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95b5de90-5c93-4ed2-8d06-c90607edbf70;
 Thu, 07 Oct 2021 13:37:12 +0000 (UTC)
Received: from DB9PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:10:1db::18)
 by DB6PR0801MB1653.eurprd08.prod.outlook.com (2603:10a6:4:3b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21; Thu, 7 Oct
 2021 13:37:02 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::38) by DB9PR06CA0013.outlook.office365.com
 (2603:10a6:10:1db::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 13:37:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 13:37:02 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Thu, 07 Oct 2021 13:37:02 +0000
Received: from a3d534c14fd9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F5E297D-8064-41BE-AEA4-C5E6440F2AB1.1; 
 Thu, 07 Oct 2021 13:36:50 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3d534c14fd9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Oct 2021 13:36:50 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6743.eurprd08.prod.outlook.com (2603:10a6:20b:399::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 13:36:48 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 13:36:48 +0000
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
X-Inumbo-ID: 95b5de90-5c93-4ed2-8d06-c90607edbf70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/6ht/emBIaV6NbUrkr7jRGEytZYuESeWz0oaJ8IphE=;
 b=PzEqL7lgDplV7Rm1bRMXT5uGxpeKFZinxWQgXtAFlljodAMHBMQSWiSvRgAP3DCVhci4eQyJuuJNM6Q+4kcWLwixe5spE3bHZMhSkLT0/S1EJvYl/GkwMI1LNU404lUMby4tYNT/J0+dpJUrodmXKeOTGzV3gk3vr2myCI2xLU4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c3c3e5a8b5f83d82
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PasIG+BxqX3KP0QDeBpNKZkqk59iuFpQVPOF/FX4MaxABtWxZ2khPXkTz2bIkFz2yQH1XDm1kAAhj4hBBEchZeVMSGf+DZSpQDtrIX2LlYVgeRSRM4ldsZQuFgcI0dPLkcP6a59Q6qOVFLlsiORp4qyC9KyjUTimkkZYqsPiPCW+mqv4rJnzU/fELOZ5zSZ9W2FAyOwUZfzWFHZn8jPZ4FGqcsH05kZ4gVkSXWWJgkdSO/mkoL94TG5scKCqfC12xxNhOGcidipihzrqn+0J020xqGZ5ZwZmCen75ixZ4QuUuOw7UhzV9zOgJJzFoD+IW0t6/k/Ww8jMKZ7x63u9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/6ht/emBIaV6NbUrkr7jRGEytZYuESeWz0oaJ8IphE=;
 b=iyLqXD4f3esYdImuMYW8FRslv3PmwJgLoV/hsWLp1mDeSafql+ZAPyCI+knXuDYKf1yrT50WMrIVSGuZaeTeexqBCHhKwH4l6sheVPuBLuG6PNh7w7GRT35qxQFY116BvKsvCOHtOxF6+zx7Ewpp6YMzeXKLdaZfzjTN2FfQ8DH/D/O/9LsjzE+KoXtnR+glRWsvsiuF4RCPAtPBqWAeFzviM+GdpWxnB87h4RI0rbt6tW4q3mnuF18H3JG8FxPM7pNDcjRtfvfdbGvQv8vFHA2X5Qj5QD4w12Nhlmwe6FUFcokSEp7JegqpTN+EqZA3H3gMaAH51tAG3WuJOySgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/6ht/emBIaV6NbUrkr7jRGEytZYuESeWz0oaJ8IphE=;
 b=PzEqL7lgDplV7Rm1bRMXT5uGxpeKFZinxWQgXtAFlljodAMHBMQSWiSvRgAP3DCVhci4eQyJuuJNM6Q+4kcWLwixe5spE3bHZMhSkLT0/S1EJvYl/GkwMI1LNU404lUMby4tYNT/J0+dpJUrodmXKeOTGzV3gk3vr2myCI2xLU4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index:
 AQHXuRciClWhjFX7R0aQhsW/aixhyqvDkJEAgACf3oCAAL5hgIAAzJaAgAAXDgCAAALtgIAABFYAgABk+ICAASF7AIAALmeA
Date: Thu, 7 Oct 2021 13:36:48 +0000
Message-ID: <13345692-69BF-4CAD-9880-FB5FB8076AB3@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
 <3ad42008f534671ae7f5b25da91253ce7cd4a3e9.1633340795.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2110041714410.3209@sstabellini-ThinkPad-T480s>
 <11F169C6-39A4-40F3-8E75-39B8C2CCF022@arm.com>
 <alpine.DEB.2.21.2110051421520.3209@sstabellini-ThinkPad-T480s>
 <8B848F95-977F-4DF4-B315-CFEA610BC1C3@arm.com>
 <24925.33634.554859.2131@mariner.uk.xensource.com>
 <BFC5AD62-3DA7-498F-8B6E-AB4C8CAA9731@arm.com>
 <24925.35194.369692.94259@mariner.uk.xensource.com>
 <5ADA6C46-A69D-459F-868C-DA579FEC36E2@arm.com>
 <24926.53506.270924.8163@mariner.uk.xensource.com>
In-Reply-To: <24926.53506.270924.8163@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xenproject.org; dkim=none (message not
 signed) header.d=none;xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f3d7b068-bb5b-4696-1ddd-08d989978b9b
x-ms-traffictypediagnostic: AS8PR08MB6743:|DB6PR0801MB1653:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB1653033AD01D7C03863DC7F1FCB19@DB6PR0801MB1653.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gf/UawF3RJL3IEM3evYnT0mt3UWTr+v7UQZQbkl/BI3PRizNdHYVQBSpD1BDXJhV74SThOrVDuXOW6ZF81FbtPxTGXzBP/s8yoIrzUdpAPp5VamUktInA3QzhzPphjweTlz1PK0AZsKRa/+7ZdzXYEPGxExl7ZOSrnHHOhF3+O/C2/xftsbzq10O4Qx/t9Z7yhHiOcCsRQRKYJdO1dZVGRVmwLaAeTZrg3eFWQOo7/fJtUfiOA/rICr39ByXp6K077i0DsjhqszsBAk7ee80sGYF+3Vkp+LH9TdvSiGPxpET7Wawo1ZlUbZqrXGaWxLSqJ/HDYOwy7Ssz2UPi89iPWADBsz1Vi6f4cYXTtzfCvoswbBX6rx4XcNycRC4LRlZmrfYA5uOvwetjEM3eDse2nWa5ntPRwVC78iaRBowEhZG7/JR2XaQCaBt+0vhNpIVyxtF3P6g6K9P70Mec87VpLVtKwSg6NFZEThETCgP0Xe0nuk3hjFNd61b1CIX+Dq7LTYuhr7oLwMIqhZsmOF5U6insbS9V9lIB8ItjKpWFIGFGMwk1PsJQXw9a3yPVJIWrFJ6Xk5IYa4yE/QRHD5SxKOJyj4NCQFJ8t9o1007ypvJqyL/xysLf38y773sXL+tXdlFYu1FlkK4ghozazk1tybPQlOMPceai0XRqpMyfs7Kft1RfC6Zl4zJ20QnWgAfLBdkonzK58XMQtJn6W4iuRhhhiuHdpTc/ur6XJ1HHEh51SnRR5OgJn0GLdBvviLV
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(186003)(83380400001)(66556008)(64756008)(26005)(6506007)(71200400001)(66946007)(91956017)(76116006)(66476007)(66446008)(2616005)(122000001)(6916009)(316002)(6486002)(508600001)(54906003)(4326008)(38100700002)(86362001)(33656002)(38070700005)(8676002)(5660300002)(8936002)(36756003)(6512007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DEA7F7886F90B4CAE750EC9E7303677@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6743
Original-Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cd5b5789-8fa8-4edb-cab9-08d98997832e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n+kX2iZX8kcnaAdMY8STQlDdZc3OCYIKjFDelEMDd+a18mLePRqttSL8391RlMrvsey8yvD7/IrYvPTOtES0abhYPN0r1prXA77mLHzh3lL4/O3VH6dKKUERlRZXX2u9N5HklS4YXC9JZFR0sdLJNUkgfRVkGlOLjUJqUUuDjnDAJ9G9g67hma5oHIyhiU+ERVc4jvMPiXKBZ3O47SwnxYuyHmiP9AeMWmatuY/3JB0xNmslr0/I1I9gmNZSaS714zPaOlar8Rfp1aqdq4g9JoK8emFoXhD2X16nu9Md09lX6AhBmUiY8WfrekefjWeod1hTbSZjUdz+sAceL9tblFaIf1oKcKDolRkShaWZngqpoaNC7tWawrnYt7fkXgsIeeJJjXhOc4pVd7og2K1wIFEqe2wtrranki1ceNjOx1niai9dyTrGt/6QzcBZx36Jy9/jaEySoSs5uD2Iyw0B0IL7KKqENBPwPC0O7LFlcDj8N8wljgHKTvIJwMzxHBZYM2ME2H5bzYVcIoA46rLGp1668alNtDF5XvNEkMgrAo1jFxHv04k9bKxb5mVbKzZ4KWx0GfcuSX+Qa9EImpjN0Nt7GVPz64H1QYUvWD7p4nWNmQfW/+Qww69Iyt1HiUceBHQ7rTq2H6uDqXeuwA/mj4wFZ3yKllcqnvJDox6qJzpwDL/4idcpxFDbau107d0N3nGyXMEvPml65dn/vih+vw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(36860700001)(6486002)(356005)(186003)(8936002)(53546011)(5660300002)(107886003)(83380400001)(26005)(86362001)(6506007)(54906003)(2616005)(47076005)(33656002)(81166007)(70206006)(336012)(6862004)(4326008)(2906002)(6512007)(36756003)(70586007)(8676002)(316002)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 13:37:02.4831
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d7b068-bb5b-4696-1ddd-08d989978b9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1653

SGkgSWFuDQoNCj4gT24gNyBPY3QgMjAyMSwgYXQgMTE6NTAgYW0sIElhbiBKYWNrc29uIDxpd2pA
eGVucHJvamVjdC5vcmc+IHdyb3RlOg0KPiANCj4gUmFodWwgU2luZ2ggd3JpdGVzICgiUmU6IFtQ
QVRDSCB2NCAxMy8xNF0gYXJtL2xpYnhsOiBFbXVsYXRlZCBQQ0kgZGV2aWNlIHRyZWUgbm9kZSBp
biBsaWJ4bCIpOg0KPj4gT24gNiBPY3QgMjAyMSwgYXQgMTI6MzMgcG0sIElhbiBKYWNrc29uIDxp
d2pAeGVucHJvamVjdC5vcmc+IHdyb3RlOg0KPj4+IFdlIHRyeQ0KPj4+IHRvIG1ha2UgdGhlIGxp
YnhsIEFQSSAiZG8gdGhlIHJpZ2h0IHRoaW5nIiBieSBkZWZhdWx0LiAgSW4gdGhpcyBjYXNlIEkN
Cj4+PiB0aGluayB0aGF0IG1lYW5zIHRvIGVuYWJsZSBWUENJIChpKSBvbiBwbGF0Zm9ybXMgd2hl
cmUgaXQncyBhdmFpbGFibGUNCj4+PiAoaWkpIGlmIHRoZSBndWVzdCBoYXMgUENJIHBhc3N0aHJv
dWdoIGRldmljZXMuICBJcyB0aGF0IHJpZ2h0ID8NCj4+IA0KPj4gWWVzIHlvdSBhcmUgcmlnaHQg
VlBDSSB3aWxsIGJlIGVuYWJsZWQgZm9yIGd1ZXN0IHdoZW4gZ3Vlc3QgaGFzIFBDSSBwYXNzdGhy
b3VnaCBkZXZpY2UgDQo+PiBhc3NpZ25lZCBhbmQgVlBDSSBzdXBwb3J0IGlzIGF2YWlsYWJsZS4g
IA0KPj4+IA0KPj4+IFNvcnJ5IHRvIGFzayB0aGVzZSBxdWVzdGlvbiBub3csIGFuZCBwbGVhc2Ug
Zm9yZ2l2ZSBteSBpZ25vcmFuY2U6DQo+Pj4gDQo+Pj4gSXMgVlBDSSBpbmhlcmVudGx5IGFuIEFS
TS1zcGVjaWZpYyBBQkkgb3IgcHJvdG9jb2wgPw0KPj4gDQo+PiBBcyBvZiBub3cgVlBDSSBmb3Ig
RE9NVSBndWVzdHMgaXMgb25seSBpbXBsZW1lbnRlZCAgZm9yIEFSTS4NCj4gDQo+IEknbSBzb3Jy
eS4gIEl0IGFwcGVhcnMgdGhhdCB0aGUgdGhydXN0IG9mIG15IHF1ZXN0aW9ucyB3YXNuJ3QNCj4g
c3VmZmljaWVudGx5IGNsZWFyLiAgWW91ciByZXBsaWVzIGFib3V0IGRldGFpbHMgYXJlIGZpbmUg
YnV0IHRoZXkNCj4gZG9uJ3Qgc2VlbSB0byBhZGRyZXNzIG15IHVuZGVybHlpbmcgY29uY2VybnMu
DQo+IA0KPiAiYXMgb2Ygbm93IC4uLiBvbmx5IGltcGxlbWVudGVkIGZvciBBUk0iIHN1Z2dlc3Rz
IHRvIG1lIHRoYXQgaXQgaXMNCj4gVlBDSSAqbm90KiBpbmhlcmVudGx5IEFSTS1zcGVjaWZpYy4g
IEllLCBpdCBpcyBhIHRoaW5nIHRoYXQgeDg2IChvcg0KPiByaXNjdiBvciB3aGF0ZXZlcikgbWln
aHQgc3VwcG9ydCBpbiBmdXR1cmUuICBJcyB0aGF0IHJpZ2h0ID8NCg0KU29ycnkgZm9yIHRoZSBj
b25mdXNpb24gVlBDSSBpcyBub3QgQVJNIGluaGVyZW50bHkgc3BlY2lmaWMuIHg4NiBvciBSSVND
IG1pZ2h0IHN1cHBvcnQgDQpWUENJIGluIHRoZSBmdXR1cmUgZm9yIERPTVUgZ3Vlc3RzLg0KDQo+
IA0KPiBIb3cgZG9lcyBWUENJIGZpdCBpbnRvIHRoZSB3aG9sZSBzeXN0ZW0gYXJjaGl0ZWN0dXJl
ID8gIElzIGl0DQo+ICpyZXF1aXJlZCogZm9yIFBDSSBwYXNzdGhyb3VnaCBvbiBBUk0gPyAgSWYg
bm90LCB3aGF0IGhhcHBlbnMgaWYgaXQgaXMNCj4gbm90IGVuYWJsZWQgPw0KDQpWUENJIGltcGxl
bWVudHMgdGhlIHZpcnR1YWwgUENJIGJ1cyB0b3BvbG9neSB0aHJvdWdoIElPIGVtdWxhdGlvbiBp
biBYRU4uIEVtdWxhdGVkIGRldmljZSB0cmVlIA0Kbm9kZSB3aWxsIGJlIGNyZWF0ZWQgZm9yIHRo
ZSBET01VIGd1ZXN0cyBhbmQgYWxsIHRoZSBhY2Nlc3MgdG8gdGhlIGNvbmZpZyBzcGFjZSB3aWxs
IGJlIGEgdHJhcCB0byANClhFTi5JL08gbWVtb3J5IHJlZ2lvbnMgZm9yIHRoZSBkZXZpY2Ugd2ls
bCBiZSBtYXBwZWQgdG8gdGhlIGd1ZXN0IGFuZCBNU0kvTVNJWCBpbnRlcnJ1cHRzIHdpbGwgDQpi
ZSByZWRpcmVjdGVkIHRvIHRoZSBndWVzdC4NCiANClllcyBWUENJIGlzIG1hbmRhdG9yeSBmb3Ig
UENJIHBhc3N0aHJvdWdoIG9uIEFSTS4gSWYgaXQgaXMgbm90IGVuYWJsZWQgd2Ugd2lsbCBub3Qg
YmUNCiBhYmxlIHRvIHBhc3MgdGhyb3VnaCBhbnkgUENJIGRldmljZSB0byB0aGUgZ3Vlc3QuDQoN
Cj4gDQo+IElmIFZQQ0kgKmlzKiBBUk0tc3BlY2lmaWMsIGhvdyBkbyB4ODYgc3lzdGVtcyAoc2F5
KSBhY2hpZXZlIHRoZSBnb2Fscw0KPiBtZXQgb24gQVJNIGJ5IFZQQ0kgPw0KDQpPbiB0aGUgeDg2
IHN5c3RlbSwgUUVNVSBlbXVsYXRlcyB0aGUgUENJIGJ1cyB0b3BvbG9neSBhbmQgUFYgZHJpdmVy
cyB1c2VkIGZvciBjb21tdW5pY2F0aW9uLg0KPiANCj4gT24gdGhlIG90aGVyIGhhbmQgaWYgVlBD
SSBpcyBub3QgaW5oZXJlbnRseSBBUk0tc3BlY2lmaWMgaXQgc2hvdWxkIG5vdA0KPiBiZSBpbiB0
aGUgQVJNIHBhcnQgb2YgdGhlIGxpYnhsIElETC4NCj4gDQo+Pj4gV2hlbiBtaWdodCBhbg0KPj4+
IGFkbWluIHdhbnQgdG8gdHVybiBpdCBvbiBleHBsaWNpdGx5ID8NCj4+IA0KPj4gSXQgd2lsbCBi
ZSBlbmFibGVkIGR5bmFtaWNhbGx5IHdoZW4gYWRtaW4gYXNzaWduIGFueSBQQ0kgZGV2aWNlIHRv
IGd1ZXN0Lg0KPiANCj4gV2hhdCBhYm91dCBob3RwbHVnID8NCg0KQXMgb2Ygbm93IGhvdHBsdWcg
aXMgbm90IGltcGxlbWVudGVkIGFuZCB0ZXN0ZWQuIFdlIG1pZ2h0IGltcGxlbWVudCANCnRoZSBo
b3RwbHVnIGluIGZ1dHVyZS4uDQoNCj4gDQo+Pj4gSG93IGRvZXMgdGhpcyBhbGwgcmVsYXRlIHRv
IHRoZSAobm9uLWFyY2gtc3BlY2lmaWMpICJwYXNzdGhyb3VnaCINCj4+PiBvcHRpb24gPw0KPj4g
DQo+PiBWUENJIHdpbGwgYmUgZW5hYmxlZCBvbmx5IHdoZW4gdGhlcmUgaXMgYW55IFBDSSBkZXZp
Y2UgYXNzaWduZWQgdG8NCj4+IGd1ZXN0IHRoZXJlZm9yZSBJIHVzZWQgImRfY29uZmlnLT5udW1f
cGNpZGV2c8OvxbzFkyB0byBlbmFibGUgVlBDSS4NCj4gDQo+IFRoZSBwdXJwb3NlIG9mIHRoZSAi
cGFzc3Rocm91Z2giIG9wdGlvbiBpcyB0byBhbGxvdyB0aGUgZ3Vlc3QgYWRtaW4gdG8NCj4gc3Bl
Y2lmeSB0aGF0IGEgZ3Vlc3QgaXMgZXhwZWN0ZWQgdG8gZ2FpbiBob3RwbHVnZ2VkIFBDSSBkZXZp
Y2VzIGluDQo+IGZ1dHVyZS4gIFRoYXQgd2F5LCBkb21haW4gZmVhdHVyZXMgdGhhdCBhcmUgcmVx
dWlyZWQgZm9yIFBDSQ0KPiBwYXNzdGhyb3VnaCBhcmUgYXV0b21hdGljYWxseSBlbmFibGVkLg0K
DQpPbmNlIHdlIGltcGxlbWVudCB0aGUgaG90cGx1ZyBmZWF0dXJlIHdlIHdpbGwgdXNlIHRoZSAi
cGFzc3Rocm91Z2g94oCcIG9wdGlvbnMuDQo+IA0KPiBQZXJoYXBzIHRoaXMgaXNuJ3QgZXhwbGFp
bmVkIGNsZWFybHkgZW5vdWdoIGluIHRoZSBkb2N1bWVudGF0aW9uLA0KPiB3aGljaCB0YWxrcyBh
Ym91dCBpb21tdSBtYXBwaW5ncy4NCj4gDQo+IERvZXMgUENJIHBhc3N0aHJ1Z2ggd29yayBvbiBB
Uk0gd2l0aG91dCBWUENJID8NCg0KVlBDSSBpcyByZXF1aXJlZCBvbiBBUk0gZm9yIFBDSSBwYXNz
dGhyb3VnaC4NCg0KUmVnYXJkcywNClJhaHVsDQo+IA0KPiBJIHRoaW5rIGl0IGxpa2VseSB0aGF0
IFZQQ0kgc2hvdWxkIGJlIGNvbnRyb2xsZWQgKG9yIGF0IGxlYXN0LCBpdHMNCj4gZGVmYXVsdCBz
ZXQpIGZyb20gdGhlICJwYXNzdGhyb3VnaCIgb3B0aW9uLiAgQnV0IEkgZG9uJ3QgdW5kZXJzdGFu
ZA0KPiBlbm91Z2ggb2YgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZSBwaWVjZXMuDQo+IA0K
PiBJYW4uDQoNCg==

