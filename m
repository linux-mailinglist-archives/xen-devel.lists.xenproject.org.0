Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9A76ECADB
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 13:03:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525292.816406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqtxj-0002Fs-LY; Mon, 24 Apr 2023 11:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525292.816406; Mon, 24 Apr 2023 11:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqtxj-0002Dy-IW; Mon, 24 Apr 2023 11:02:27 +0000
Received: by outflank-mailman (input) for mailman id 525292;
 Mon, 24 Apr 2023 11:02:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qjkp=AP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pqtxi-0002Ds-3W
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 11:02:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20613.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d428243-e28f-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 13:02:23 +0200 (CEST)
Received: from DUZPR01CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::10) by AS2PR08MB10296.eurprd08.prod.outlook.com
 (2603:10a6:20b:648::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 11:02:21 +0000
Received: from DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4bb:cafe::59) by DUZPR01CA0097.outlook.office365.com
 (2603:10a6:10:4bb::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33 via Frontend
 Transport; Mon, 24 Apr 2023 11:02:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT048.mail.protection.outlook.com (100.127.142.200) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19 via Frontend Transport; Mon, 24 Apr 2023 11:02:21 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Mon, 24 Apr 2023 11:02:20 +0000
Received: from 15fe30c1be06.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 12F808F9-0FC5-4426-A8DA-9FBCD0EE061B.1; 
 Mon, 24 Apr 2023 11:02:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15fe30c1be06.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Apr 2023 11:02:15 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by PAVPR08MB9859.eurprd08.prod.outlook.com (2603:10a6:102:30f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 11:02:12 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::b95e:f68f:2747:5b86]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::b95e:f68f:2747:5b86%6]) with mapi id 15.20.6319.032; Mon, 24 Apr 2023
 11:02:12 +0000
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
X-Inumbo-ID: 7d428243-e28f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCuXoG30wTYkeE6MqC1JmC1YalYftOOrnEMgM01rwBw=;
 b=6cwi8+jGTCevZy/lDkVbcWLfEy1mjngo6JcC7TYqLI2X/1cDoPOTgGQpCtCMBM8DnzcqWGUIHj79PgCRiejpqIExFXAbrDfektg/1ohMKxigtvcD7IC7WGz4roq/46ivSXfrcENb0hkrETXmzerZxOjr5euln7X7eH9bS9jI2ic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfk5zpn3YJA1tZR3+tZmjNqgfz/SurNmhEhjU+Ye2QYRyZ/qk+IQTR139xRVIrwas7jzAkLtmoZG4IBh0sM+NQyHXRNo05MmyBs5Qp0KrH0vZ6Ryxv+drBJk8/1tvaNDrrd8n9EKBjcGLgdTRUEdmk2m1g87q+4bO92FyJV/60/tK+gJjsMBI3pHkSJlixkPFkbdrbabfeslK5nUjcq8CUKCVaWn+ItzMG9sqfrM2xlnqqvITCAaKQAFAQ5y+WBoz2LuKHXbb9ktD7+6kWo/7BPTYhv4NChi0qjHirkG0OXIHq0eveNYnrFsaii2JgdbqIkTyoaLX75Anrxf1HSubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCuXoG30wTYkeE6MqC1JmC1YalYftOOrnEMgM01rwBw=;
 b=BYn0p+/rpsXylCgPLZM3vpyGeyOYJfTnF+so+rWh2vQWGSo+/Ns9daPrtlF5vNAdnoPt3EyqJ9VMMJLL8nolJdzv0qiSbcEzzHg3+3GZDPWUrnfRgiFBR/e4Q1SzNcLFOI8cQ2+w5WV+t91EfmrfN0dt4aK3UfWaudn8FVncFLG33I5KGhhNztaGdkG7fN1u1ku1x4+XI/xPDNMsKJ7VZawXtevuShYNWjtmRFvLWBhLphdIceqwZNjUSjbDK8SPLpp1QdfwRk3DDA7vgcjWorlsXEnOBPLcniLgf937N6VUvZf04Tj9iAgKiSS1OtZDSVSAr+CZO/PQkLHsD9Pt9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCuXoG30wTYkeE6MqC1JmC1YalYftOOrnEMgM01rwBw=;
 b=6cwi8+jGTCevZy/lDkVbcWLfEy1mjngo6JcC7TYqLI2X/1cDoPOTgGQpCtCMBM8DnzcqWGUIHj79PgCRiejpqIExFXAbrDfektg/1ohMKxigtvcD7IC7WGz4roq/46ivSXfrcENb0hkrETXmzerZxOjr5euln7X7eH9bS9jI2ic=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 03/17] xen/arm: implement node distance helpers for Arm
Thread-Topic: [PATCH v3 03/17] xen/arm: implement node distance helpers for
 Arm
Thread-Index:
 AQHZc3rmCrt50C+BaEmmIgaK9uo9ea80IxGAgAFPzpCAABDqgIAC3lpQgAG3XoCAADcqoA==
Date: Mon, 24 Apr 2023 11:02:12 +0000
Message-ID:
 <GV2PR08MB8001D4A1EA5B854CA065B34992679@GV2PR08MB8001.eurprd08.prod.outlook.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
 <20230420112521.3272732-4-Henry.Wang@arm.com>
 <ac54e04c-58b7-d0c9-2443-bb09258c8bc8@suse.com>
 <AS8PR08MB79912F294EDAC48F835FBB7A92609@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bdf33169-4e29-8c50-ff76-16d05df81a14@suse.com>
 <AS8PR08MB7991576C75D0D4482595E7E292669@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e06fc93f-293f-a873-c9b9-2d5c941168f9@suse.com>
In-Reply-To: <e06fc93f-293f-a873-c9b9-2d5c941168f9@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4894548C962FCA4898B989D0104AC710.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB8001:EE_|PAVPR08MB9859:EE_|DBAEUR03FT048:EE_|AS2PR08MB10296:EE_
X-MS-Office365-Filtering-Correlation-Id: ecde4c3c-6966-4345-d622-08db44b36068
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 v9FN5PITsRa2y4U3ZTC82k2Q9Lmy07LVNaxBvS4RIpYYex1aSnVzqEuKRD0LEAK3DtR7lGAAla9SDGtTnWIcT+EYFV4wLLG3GIp7XwOP/1aYwmf+VewtgqyBrK5Y2xSxzr90HPGmtamE/hOPyXIuCg09TJ6p1LhNnJD2ncsllK6n2VqryHab7whBiv6hVaWS5Q3maRz+Fm6TlSPoDObomcTbatclTTU9zZjOpgOjkmqHE/mIF+27tsJbs6LNVLxnoe/cRMoW5REbonXu5Rd/3pa/tuF2W6fbmsRIvtF8rDL4EntYhyas1yywrnPEwsxTQ9m5ic8XYtj63IGsi3d2ItjNV/1W8VnUxQ+12NdgmjsbPk3V7Hq/HW77ZgQNAlUU2ZxEaQKa4oL5c4wcWB9O7ra+/W8u2GmoYxaJB59i4iRGKH63x4PvB+FH3a69W+9oAme/ni8+kWPkSnln6Bzswee1/y98NNPnZLYw04YhDBy9iJ6i3XMpeA+giEZPLRWRg0STtaEohlKSfxI7jNb2IocwKXTxMURlE0rffQbtSpiP4V9UTQGvTx/Nc7JxfRGgqhWyQ5gHT9dAmpT/6Ho4VSAfkX8++8mesNlJC4N2qFSLXW4+Xoy9yRupBDcoJBSJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199021)(9686003)(53546011)(6506007)(26005)(38070700005)(55016003)(83380400001)(186003)(38100700002)(122000001)(66946007)(478600001)(76116006)(86362001)(6916009)(64756008)(66556008)(66476007)(66446008)(8936002)(8676002)(54906003)(52536014)(5660300002)(71200400001)(7696005)(41300700001)(2906002)(4326008)(33656002)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9859
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b4d105e3-216d-4ee7-e9ea-08db44b35b1d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fCRI0q27uKMcspj6xtebGhse5ZZLRMBh+r9YanHTV0iknx9Wql8OjtBT47xWS2u83/QCulgofRQOVJt41251zHrook7WwcgvlPxSSYXnR600dhbDIRpxjxb/rvO1W4YlPY6X0QtgBaJi7sUZgC/epqvGeQikZEkyOtE1yTcjtcy57qsZZYUicbaD+2mw+viWRXVppORQwO0rrj5gZ9irUgYnwWet8CTAPrPFgecbKOvxAy0whxOGXCuBIhYLYejMSNSTfCLkxue/AZeNCSm1TfqH09+hq1x/cc9hp7d3l7Ekm5icVaP09NV7uU0uz4SDKymB8wfv7uS8Tz27IwQGLC4Bwv7rFb7Nj+Gf6W9cwnhHqAqwGWo5awrouziibKOyzMcmBJVNRPsbphSALLGcIc47XcmJ9mEbvSzmZmJX6PDbQdOfI5766L4yvW8lqYH7o9IDW2y+hpT4SCRDXPGrWNbwmcs+XwjTGNTInxu8pNILaft7s8/Nz7oeFOi3H7XqYUdIJ5933Wu2Hflzg5saWr4mwvKVGwE/gnEqTe1JseqX7v9hHuGm8lbndAiicEWHBNcX5Qtrdg3YMCR0gBpfdcjX2sb8MBMtyiUJrBgWJuYo8u2TIyHt/MmJt/rWE4MLmq1JjYeAp+MAXo0jOb00CA6Z7yzQk0YumiNqDlHDVUghu/MWVFVm8l+iE7fuPq6pg2EgWQ7MoaVcF52neeAN6w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(2906002)(7696005)(55016003)(9686003)(6506007)(26005)(53546011)(186003)(40480700001)(70586007)(70206006)(6862004)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(52536014)(54906003)(82740400003)(356005)(81166007)(82310400005)(86362001)(40460700003)(33656002)(36860700001)(47076005)(336012)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 11:02:21.0218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecde4c3c-6966-4345-d622-08db44b36068
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10296

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMy8xN10g
eGVuL2FybTogaW1wbGVtZW50IG5vZGUgZGlzdGFuY2UgaGVscGVycyBmb3INCj4gQXJtDQo+IA0K
PiBPbiAyMy4wNC4yMDIzIDA3OjM2LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+ID4+Pj4gSG93ZXZlciwgbG9va2luZyBhdCB0aGUgY29kZSBiZWxvdywgZG9uJ3QgeW91
IG1lYW4gdG8gaGF2ZSB0aGUgYXJyYXkNCj4gPj4+PiBwcmUtc2V0IHRvIGFsbCBOVU1BX05PX0RJ
U1RBTkNFPw0KPiA+Pj4NCj4gPj4+IC4uLkkgYW0gYSBiaXQgcHV6emxlZCBhYm91dCB3aHkgcHJl
LXNldHRpbmcgdGhlIGFycmF5IHRvIGFsbA0KPiA+Pj4gTlVNQV9OT19ESVNUQU5DRSBtYXR0ZXJz
IGhlcmUsIGFzIEkgdGhpbmsgdGhlIG5vZGUgZGlzdGFuY2UgbWFwIHdpbGwNCj4gPj4+IGJlIHBv
cHVsYXRlZCB3aGVuIHBhcnNpbmcgdGhlIGRldmljZSB0cmVlIGFueXdheSBubyBtYXR0ZXIgd2hh
dCB0aGVpcg0KPiA+Pj4gaW5pdGlhbCB2YWx1ZXMuDQo+ID4+DQo+ID4+IEZyb20gdGhpcyBwYXRj
aCBhbG9uZSBpdCBkb2Vzbid0IGJlY29tZSBjbGVhciB3aGV0aGVyIGluZGVlZCBhbGwgYXJyYXkN
Cj4gPj4gc2xvdHMgKGFuZCBub3QganVzdCBvbmVzIGZvciB2YWxpZCBub2Rlcykgd291bGQgYmUg
cG9wdWxhdGVkLiBJIHRoaW5rDQo+ID4+IHRoZSBjb2RlIGluIHRoZSBwYXRjaCBoZXJlIHdvdWxk
IGJldHRlciBub3QgbWFrZSBpdHNlbGYgZGVwZW5kZW50IG9uDQo+ID4+IGJlaGF2aW9yIG9mIGNv
ZGUgYWRkZWQgc3Vic2VxdWVudGx5ICh3aGljaCBtYXkgY2hhbmdlOyByZWNhbGwgdGhhdCBhDQo+
ID4+IHNlcmllcyBtYXkgYmUgY29tbWl0dGVkIGluIHBpZWNlcykuDQo+ID4NCj4gPiBDb3JyZWN0
LCBJIGFncmVlLiBJIGFkZGVkIGEgbnVtYV9pbml0X2Rpc3RhbmNlKCkgZnVuY3Rpb24gKGluIHBh
dGNoICMxMikgdG8NCj4gPiBzZXQgYWxsIHZhbHVlcyB0byBOVU1BX05PX0RJU1RBTkNFLiBUaGUg
bnVtYV9pbml0X2Rpc3RhbmNlKCkgd2lsbCBiZQ0KPiA+IGNhbGxlZCBpbiB0aGUgYmVnaW5uaW5n
IG9mIG51bWFfaW5pdCgpLg0KPiANCj4gV2h5IGRvIHlvdSBuZWVkIGEgZnVuY3Rpb24gZm9yIHRo
aXM/IEFzIHNhaWQsIHRoaXMgYXJyYXkgY2FuIGJlIHByZS1zZXQgYXQNCj4gY29tcGlsZSB0aW1l
ICh1bmxlc3MgSSdtIG92ZXJsb29raW5nIHNvbWV0aGluZykuDQoNClNvcnJ5IEkgb3Zlcmxvb2tl
ZCB0aGlzIGNvbW1lbnQsIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZywgYnV0IElJVUMgd2UNCmNh
biBvbmx5IHByZS1zZXQgdGhlIDJEIGFycmF5IHRvIDAgYXQgdGhlIGNvbXBpbGUgdGltZS4gQ291
bGQgeW91IHBsZWFzZQ0KZWxhYm9yYXRlIGEgYml0IG1vcmUgYWJvdXQgdGhlIGNvZGUgaW4geW91
ciBtaW5kPyBUaGFua3MhDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQo=

