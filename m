Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FDA424F69
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 10:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203445.358576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYP3N-0005Hp-CK; Thu, 07 Oct 2021 08:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203445.358576; Thu, 07 Oct 2021 08:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYP3N-0005Ey-8W; Thu, 07 Oct 2021 08:47:01 +0000
Received: by outflank-mailman (input) for mailman id 203445;
 Thu, 07 Oct 2021 08:47:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9/ki=O3=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mYP3M-0005Eo-1t
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 08:47:00 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c759247-6715-4eac-a10d-47f69fa3e820;
 Thu, 07 Oct 2021 08:46:57 +0000 (UTC)
Received: from AM6P192CA0070.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::47)
 by AM0PR08MB3812.eurprd08.prod.outlook.com (2603:10a6:208:fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 08:46:55 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::e4) by AM6P192CA0070.outlook.office365.com
 (2603:10a6:209:82::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Thu, 7 Oct 2021 08:46:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 08:46:54 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Thu, 07 Oct 2021 08:46:54 +0000
Received: from 32413ee495e1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B255A63D-BF80-4460-8435-A14CF2BC5EA5.1; 
 Thu, 07 Oct 2021 08:46:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32413ee495e1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Oct 2021 08:46:43 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4936.eurprd08.prod.outlook.com (2603:10a6:20b:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 7 Oct
 2021 08:46:40 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 08:46:40 +0000
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
X-Inumbo-ID: 7c759247-6715-4eac-a10d-47f69fa3e820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzwrjXhO4vzIE2eN1xn7sIV5wV9FYbP9LVTo7KNN3K4=;
 b=qFLgEoU7U2Aj6GkCh2S6LCHxObAaBQxuYIfRWr2ob6w/jVl+WZxrfL0BjXMpOtJFt4QOtG83QVrSvxb1nQ3DYN2s8SnSj+7nyvKTrIWH/bWHsWb2Yon/qJl7409NvSd9EQ0L7nV5GfTzlUWUT+BjXeEiGtS1/HnVtkE8o/s+a0Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1a62b60f4e97bbe6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3OO78jcQH16R/aO/GYoRd8LpCbmg4adOxAZQWKoENVB5BhSr/BmOQuYyjIlSpGbAtOsNNaZ62jI9QmJoN+cDUEsUw+jNhpQ/jMxDaegZIRmZm6yNzoKHGhSMc7I0w+gW/SnEtCmiaBIHZu+Av/pzldbOUH8M/iBwiJbKJo6zgCJlHNPPUgCQ5/k8WHsmKZXoAa+jNp2g/uwedBQAMcQf2GW+UFxOkXpypmGEfnFFiFEi97TNcBIpX30f9rTaCGlgQBoQk2iSqExsHloBK8hi6STZ72TKWQMS9hlduMotWBBKxBlyd0ul0wTRVpWT8hrqXLfTOcjzr/wG0Jej3s2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzwrjXhO4vzIE2eN1xn7sIV5wV9FYbP9LVTo7KNN3K4=;
 b=QtdXxlUThlxY0oqNiIgEW9N1QRDXFkk6vKI0q/+WTCtIuve3U5S8obm/NL6H/HuaLXOofrZzAXbayCSv/SldlYw0uH4Oci/MivatQxKlwjm1aOau9pXxUdfgTf3G+JH+7SH21jr80GFgz846afWyUr9aLBXNCakjK+LHygKT2R8YE4lFVblsx9Oiz8iVFRgwiJNPq1kgZtz8Gf5/Owj5lpkhss7KDb5rYZEjyacl+zsZqCkSRv2dAFOSQuRG5UpBx4uPzZ5SxKMarT3R4T6ISKptmgqu2l7dR0XkGBzRx7VBXAAT5RNjTZ2s4RCwxWk1rp/bNgFS6rhkC3nzquU9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzwrjXhO4vzIE2eN1xn7sIV5wV9FYbP9LVTo7KNN3K4=;
 b=qFLgEoU7U2Aj6GkCh2S6LCHxObAaBQxuYIfRWr2ob6w/jVl+WZxrfL0BjXMpOtJFt4QOtG83QVrSvxb1nQ3DYN2s8SnSj+7nyvKTrIWH/bWHsWb2Yon/qJl7409NvSd9EQ0L7nV5GfTzlUWUT+BjXeEiGtS1/HnVtkE8o/s+a0Q=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andre Przywara
	<Andre.Przywara@arm.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Topic: [PATCH v4 13/14] arm/libxl: Emulated PCI device tree node in
 libxl
Thread-Index:
 AQHXuRciClWhjFX7R0aQhsW/aixhyqvDkJEAgACf3oCAAL5hgIAAzJaAgAAXDgCAAALtgIAABFYAgABk+ICAAAU6gIAA+ZkA
Date: Thu, 7 Oct 2021 08:46:40 +0000
Message-ID: <6B3C248F-21EB-40A1-A316-3B77C0203B8C@arm.com>
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
 <f602b716-63b9-a3d2-237b-2048f8fabbcf@xen.org>
In-Reply-To: <f602b716-63b9-a3d2-237b-2048f8fabbcf@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 4994ad59-7b66-4944-ffad-08d9896f03ea
x-ms-traffictypediagnostic: AM6PR08MB4936:|AM0PR08MB3812:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB38124A759CBEDE2F9ED43EECFCB19@AM0PR08MB3812.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NjnknEpZap9ibXt5wiUN7GNB179oGnZ1vPOf8Se0QcvG2s6uUBWnSfwKqvt0+S6ECXxQu1Nxw9qcvXLYEq05ZlR9gFX9A7sPmW8Vnnw5PRMD4E0lIInEkVKGcJCBDBDwmmSYi7IMKpmecs65XFhzf6WYt3YHzyOMgQn3sDjYQc2chWXLlFxnDx/DWK5xqtbB4g57a/j87pOMpsYgwKKbTwBOURwuueWkAwrMKRNBM1rMZUCERJ7DFMufWMe/pym9zuilMiFhyfVGtG0XflD8MZJSTj2DlsaW/Wy4O4pxCTcwtFj4UP/a6QMRe0sqXE4eGkKOmUOeBDSUCWgPG6tKsYvJEZSGA4aVwDgbJeJCT2F8BonZFpDmGs13KRVCOrJwDJwDGpyFt2PDa8QlbGzOCvlcoyltxn9uscPSd/7tu/LFwriqHujVd4CkeK9u0w+rn3L3GuOLTvbSmpD/QqUfjH0RrfRU+XPI2teUt1Zn6HVzI3gD8cxuWg5U2Q5MrLltXsSy8QYeX8TdqCegrHU6T6lLhjhzBZSNCnvtwYA7g6AyNWCpHHxJ/7X4KhQ+5mdr388+b4f/1rMgwQ/I7ATUGAU9SwJwx4Xl6CMoFZ8d3O8AytWEVpbgji2SCA5pC79nvyz3f3poGWTlsqFaln/4YbR9m+xqFTVIOvmI2+GEgfudkedCBA42Kghph+tUt+vPo+MNvQ1EuyH5D1n17LRwbnJAFgw6ozzj20gSmxMC9pEwQriqiRo78ta+eSDDjRZB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6916009)(4326008)(8676002)(8936002)(316002)(83380400001)(2906002)(54906003)(86362001)(2616005)(186003)(36756003)(6512007)(64756008)(66556008)(91956017)(66446008)(76116006)(71200400001)(66476007)(6506007)(5660300002)(53546011)(26005)(508600001)(6486002)(66946007)(33656002)(38070700005)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2725A911B90646489177D488DF73881F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4936
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88785320-1d56-477d-02b7-08d9896efb6a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FEbL2loo6GMr0sNv3228S/xLqJ7iL65Qi4CYumZ+P412Rxo/wmjmOvE7nAl7IrpevV8vPCkJNk1l77dwJCuK3X4YUbTyC0ny/DX7SpZJPixibphsMcLkhM3bHWNsT1uoZruSH70794g2c4HPDYOkiMYKA+u4ngteTfcq1JEcnAfZ4PpauKQn0pNidqnawIGUMX6hF0h55e1khQLFxrRkjeeweeiBdZTv5nrVBXCZeJhKEQftY34SLkE3KZNuwhAwbylK4M1VWSG2J7JXBhTiW0zT40vZ5yFnnYZwW66e0UjMxHDHE167qhP0Oc0gsVzy1hPDeBLk16v2E7Ym8caDyhKu4B4F5bOaxhjh6lvpCfN6nhoCIgSRSdI6jrpjaKWlhPwrHTm11GVM4IUIjAUow3oVM1A1Hmsu8X6MNY1f0tNhDdV2owlcl1E3BEqikfaNoIW5L1vrnL59M/M+frFlGRHwrHPrTMDRMt083cxQnBbDM+BhUB6HQ8vMR2nF6/HvPQzLWNsF8Pw5dnRd5gyKgBe7x4GlpdpDC1wPvf43o4RL0RJeIADeo89wMk7OHrPQ61AzfgsZjjtVSV1jQHyRYlWNHsx3PQSh4uFL3cz8qzR9sAjh8JSSGpcmjAXNudEmiLHRHho29CK/6xtBfpBUFNwfu86ZyluQ4dOyc+l9D8jpJdETfBMbOrFgrkqmmp4V4bauZWG6LP0Or5pFsMit0Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(508600001)(47076005)(5660300002)(336012)(53546011)(8676002)(8936002)(6486002)(82310400003)(86362001)(54906003)(4326008)(356005)(6506007)(81166007)(83380400001)(186003)(36860700001)(2906002)(316002)(26005)(33656002)(2616005)(70586007)(107886003)(36756003)(6512007)(6862004)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 08:46:54.8983
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4994ad59-7b66-4944-ffad-08d9896f03ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3812

SGkgSnVsaWVuLA0KDQo+IE9uIDYgT2N0IDIwMjEsIGF0IDY6NTMgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gSGkgUmFodWwsDQo+IA0KPiBPbiAwNi8xMC8y
MDIxIDE5OjM0LCBSYWh1bCBTaW5naCB3cm90ZToNCj4+PiBPbiA2IE9jdCAyMDIxLCBhdCAxMjoz
MyBwbSwgSWFuIEphY2tzb24gPGl3akB4ZW5wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4g
UmFodWwgU2luZ2ggd3JpdGVzICgiUmU6IFtQQVRDSCB2NCAxMy8xNF0gYXJtL2xpYnhsOiBFbXVs
YXRlZCBQQ0kgZGV2aWNlIHRyZWUgbm9kZSBpbiBsaWJ4bCIpOg0KPj4+PiBIaSBJYW4JDQo+Pj4+
PiBXaGF0IGlzIHdyb25nIHdpdGggcHV0dGluZyBpdCBpbg0KPj4+Pj4gbGlieGxfX2FyY2hfZG9t
YWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdA0KPj4+Pj4gd2hpY2ggSSB0aGluayBleGlzdHMgcHJl
Y2lzZWx5IGZvciB0aGlzIGtpbmQgb2YgdGhpbmcgPw0KPj4+PiANCj4+Pj4gQXMgd2UgaGF2ZSB0
byBzZXQgdGhlIGFyY2hfYXJtLnZwY2kgdG8gZmFsc2UgZm9yIHg4NiBhbmQgQVJNIEkNCj4+Pj4g
dGhvdWdodCBpdCBpcyByaWdodCB0byBtb3ZlIHRoZSBjb2RlIHRvIGNvbW1vbiBjb2RlIHRvIGF2
b2lkDQo+Pj4+IGR1cGxpY2F0aW9uLg0KPj4+PiANCj4+Pj4gQXJlIHlvdSBzdWdnZXN0aW5nIHRv
IHB1dCAiDQo+Pj4+IGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT5hcmNoX2FybS52
cGNpLCBmYWxzZSnDr8W8xZNpbg0KPj4+PiBsaWJ4bF9fYXJjaF9kb21haW5fYnVpbGRfaW5mb19z
ZXRkZWZhdWx0KCkgZm9yIHg4NiBhbmQgQVJNDQo+Pj4+IGRpZmZlcmVudGx5Lg0KPj4+IA0KPj4+
IEkndmUgZ29uZSBiYWNrIGFuZCByZXJlYWQgdGhlIHdob2xlIHRocmVhZCwgd2hpY2ggSSBwcm9i
YWJseSBzaG91bGQNCj4+PiBoYXZlIGRvbmUgdG8gc3RhcnQgd2l0aC4uLi4NCj4+PiANCj4+PiBT
bzoNCj4+PiANCj4+Pj4+PiAjaWYgZGVmaW5lZChfX2FybV9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2
NF9fKQ0KPj4+Pj4+ICAgLyoNCj4+Pj4+PiAgICAqIEVuYWJsZSBWUENJIHN1cHBvcnQgZm9yIEFS
TS4gVlBDSSBzdXBwb3J0IGZvciBET01VIGd1ZXN0cyBpcyBub3QNCj4+Pj4+PiAgICAqIHN1cHBv
cnRlZCBmb3IgeDg2Lg0KPj4+Pj4+ICAgICovDQo+Pj4+Pj4gICBpZiAoZF9jb25maWctPm51bV9w
Y2lkZXZzKQ0KPj4+Pj4+ICAgICBsaWJ4bF9kZWZib29sX3NldCgmYl9pbmZvLT5hcmNoX2FybS52
cGNpLCB0cnVlKTsNCj4+Pj4+PiAjZW5kaWYNCj4+PiANCj4+PiBJIHRoaW5rIHRoaXMgbG9naWMg
cHJvYmFibHkgb3VnaHQgdG8gYmUgaW4gbGlieGwsIG5vdCBpbiB4bC4NCj4+IEkgd2lsbCBtb3Zl
IHRoZSBjb2RlIHRvICJsaWJ4bF9hcm0uYyJ0byBhdm9pZCAjaWZkZWYgaW4gY29tbW9uIGNvZGUg
YW5kIGFsc28gIHRvIGF2b2lkIHNldHRpbmcgdGhlIHZwY2kgZm9yIHg4Ng0KPj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfYXJtLmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhs
X2FybS5jDQo+PiBpbmRleCBlMzE0MGE2ZTAwLi4yYmUyMDhiOTliIDEwMDY0NA0KPj4gLS0tIGEv
dG9vbHMvbGlicy9saWdodC9saWJ4bF9hcm0uYw0KPj4gKysrIGIvdG9vbHMvbGlicy9saWdodC9s
aWJ4bF9hcm0uYw0KPj4gQEAgLTEwMSw2ICsxMDEsMTIgQEAgaW50IGxpYnhsX19hcmNoX2RvbWFp
bl9wcmVwYXJlX2NvbmZpZyhsaWJ4bF9fZ2MgKmdjLA0KPj4gICAgICAgICAgcmV0dXJuIEVSUk9S
X0ZBSUw7DQo+PiAgICAgIH0NCj4+ICArICAgIC8qIEVuYWJsZSBWUENJIHN1cHBvcnQuICovDQo+
PiArICAgIGlmIChkX2NvbmZpZy0+bnVtX3BjaWRldnMpIHsNCj4+ICsgICAgICAgIGNvbmZpZy0+
ZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfdnBjaTsNCj4+ICsgICAgICAgIGxpYnhsX2RlZmJvb2xf
c2V0KCZkX2NvbmZpZy0+Yl9pbmZvLmFyY2hfYXJtLnZwY2ksIHRydWUpOw0KPj4gKyAgICB9DQo+
PiArDQo+PiAgICAgIHJldHVybiAwOw0KPj4gIH0NCj4+PiAgV2UgdHJ5DQo+Pj4gdG8gbWFrZSB0
aGUgbGlieGwgQVBJICJkbyB0aGUgcmlnaHQgdGhpbmciIGJ5IGRlZmF1bHQuICBJbiB0aGlzIGNh
c2UgSQ0KPj4+IHRoaW5rIHRoYXQgbWVhbnMgdG8gZW5hYmxlIFZQQ0kgKGkpIG9uIHBsYXRmb3Jt
cyB3aGVyZSBpdCdzIGF2YWlsYWJsZQ0KPj4+IChpaSkgaWYgdGhlIGd1ZXN0IGhhcyBQQ0kgcGFz
c3Rocm91Z2ggZGV2aWNlcy4gIElzIHRoYXQgcmlnaHQgPw0KPj4gWWVzIHlvdSBhcmUgcmlnaHQg
VlBDSSB3aWxsIGJlIGVuYWJsZWQgZm9yIGd1ZXN0IHdoZW4gZ3Vlc3QgaGFzIFBDSSBwYXNzdGhy
b3VnaCBkZXZpY2UNCj4+IGFzc2lnbmVkIGFuZCBWUENJIHN1cHBvcnQgaXMgYXZhaWxhYmxlLg0K
Pj4+IA0KPj4+IFNvcnJ5IHRvIGFzayB0aGVzZSBxdWVzdGlvbiBub3csIGFuZCBwbGVhc2UgZm9y
Z2l2ZSBteSBpZ25vcmFuY2U6DQo+Pj4gDQo+Pj4gSXMgVlBDSSBpbmhlcmVudGx5IGFuIEFSTS1z
cGVjaWZpYyBBQkkgb3IgcHJvdG9jb2wgPw0KPj4gQXMgb2Ygbm93IFZQQ0kgZm9yIERPTVUgZ3Vl
c3RzIGlzIG9ubHkgaW1wbGVtZW50ZWQgIGZvciBBUk0uDQo+IA0KPiBXZSBuZWVkIHRvIGRpZmZl
cmVudGlhdGUgYmV0d2VlbiB3aGF0IGl0IGlzIGN1cnJlbnRseSBpbXBsZW1lbnRlZCBhbmQgaG93
IGl0IGNhbiBiZSB1c2VkIGluIHRoZSBmdXR1cmUuDQo+IA0KPiBJbiBwYXJ0aWN1bGFyLCB0aGUg
bGF5b3V0IG9mIGJfaW5mbyBpcyBleHBvc2VkIHRvIGV4dGVybmFsIHRvb2xzdGFjayAoZS5nLiBs
aWJ2aXJ0KS4gU28gd2UgY2FuJ3QgZWFzaWx5IHJlbW92ZSBhbiBvcHRpb24uIEluIG90aGVyIHdv
cmQsIGlmIHdlIGVuZCB1cCB0byBuZWVkIGl0IGZvciBhbiBvdGhlciBhcmNoIHRoZW4gd2Ugd2ls
bCBoYXZlIHRvIGtlZXAgc29tZSBjb21wYXQgY29kZS4NCj4gDQo+IEluIHRoaXMgY2FzZSwgSSB0
aGluayB0aGlzIG9wdGlvbiBpcyBub3QgYXJtIHNwZWNpZmljLiBTbyB0aGUgZmllbGQgb3VnaHQg
dG8gYmUgb3V0c2lkZSBvZiBhcmNoX2FybS4NCg0KQXMgd2UgYXJlIGRpc2N1c3Npbmcgd2hldGhl
ciB3ZSBuZWVkIHRoaXMgZmllbGQgb3Igbm90IElmIHdlIHJlYWNoIHRvIHRoZSBjb25jbHVzaW9u
IHRoZSB3ZSBuZWVkIHRoaXMgZmllbGQgSSB3aWxsIG1vdmUgdGhpcyBvdXRzaWRlIG9mIGFyY2hf
YXJtLg0KPiANCj4+ICANCj4+PiAgV2hlbiBtaWdodCBhbg0KPj4+IGFkbWluIHdhbnQgdG8gdHVy
biBpdCBvbiBleHBsaWNpdGx5ID8NCj4+IEl0IHdpbGwgYmUgZW5hYmxlZCBkeW5hbWljYWxseSB3
aGVuIGFkbWluIGFzc2lnbiBhbnkgUENJIGRldmljZSB0byBndWVzdC4NCj4+PiANCj4+PiBIb3cg
ZG9lcyB0aGlzIGFsbCByZWxhdGUgdG8gdGhlIChub24tYXJjaC1zcGVjaWZpYykgInBhc3N0aHJv
dWdoIg0KPj4+IG9wdGlvbiA/DQo+PiBWUENJIHdpbGwgYmUgZW5hYmxlZCBvbmx5IHdoZW4gdGhl
cmUgaXMgYW55IFBDSSBkZXZpY2UgYXNzaWduZWQgdG8gZ3Vlc3QgdGhlcmVmb3JlIEkgdXNlZA0K
Pj4gImRfY29uZmlnLT5udW1fcGNpZGV2c+KAnSB0byBlbmFibGUgVlBDSS4NCj4gDQo+IE9rLiBT
byB3ZSBkb24ndCBleHBlY3QgJ3hsJyBvciBhbm90aGVyIHRvb2xzdGFjayB0byBlZmZlY3RpdmVs
eSB0b3VjaCB0aGUgZmllbGQgZm9yIHRoZSB0aW1lIGJlaW5nLiBJcyB0aGF0IGNvcnJlY3Q/DQoN
ClllcyBpdCBpcyBjb3JyZWN0LiBPbmx5IHVzZSBvZiB0aGlzIGZpZWxkIGlzIHVzZWQgdG8gY3Jl
YXRlIHRoZSBET01VIGVtdWxhdGVkIFBDSSBkZXZpY2UgdHJlZSBub2RlIHdoZW4gUENJIGRldmlj
ZSBpcyBhc3NpZ25lZCB0byBndWVzdCAoIGRfY29uZmlnLT5udW1fcGNpZGV2cyAhPSBOVUxMICkN
Cj4gDQo+IElmIHNvLCB0aGVuIEkgdGhpbmsgdGhpcyBvcHRpb24gc2hvdWxkIGJlIGhpZGRlbiBm
cm9tIGV4dGVybmFsIHRvb2xzdGFjayB1bnRpbCB3ZSBzZWUgYSB1c2UuDQoNClN0ZWZhbm8gc3Vn
Z2VzdGVkIGluIGFub3RoZXIgZW1haWwgaG93IHdlIGNhbiByZW1vdmUgdGhpcyBmaWVsZC4gSSB3
aWxsIHdvcmsgb24gdG8gcmVtb3ZlIHRoaXMgZmllbGQuDQoNClJlZ2FyZHMsDQpSYWh1bCANCj4g
DQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

