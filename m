Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD2E66D809
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 09:22:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479070.742668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhEx-0006A0-Nk; Tue, 17 Jan 2023 08:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479070.742668; Tue, 17 Jan 2023 08:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhEx-00067A-Kd; Tue, 17 Jan 2023 08:22:43 +0000
Received: by outflank-mailman (input) for mailman id 479070;
 Tue, 17 Jan 2023 08:22:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mnn9=5O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pHhEv-000674-Pa
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 08:22:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2044.outbound.protection.outlook.com [40.107.14.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a93e32d-9640-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 09:22:38 +0100 (CET)
Received: from AM6PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:20b:c0::23)
 by VE1PR08MB5757.eurprd08.prod.outlook.com (2603:10a6:800:1a4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 08:22:36 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::9a) by AM6PR08CA0035.outlook.office365.com
 (2603:10a6:20b:c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 08:22:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 08:22:36 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Tue, 17 Jan 2023 08:22:35 +0000
Received: from 8e562291a90e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24E76A8C-1525-432E-946E-953E528C3343.1; 
 Tue, 17 Jan 2023 08:22:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e562291a90e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Jan 2023 08:22:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB7392.eurprd08.prod.outlook.com (2603:10a6:10:353::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 08:22:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.5986.018; Tue, 17 Jan 2023
 08:22:22 +0000
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
X-Inumbo-ID: 1a93e32d-9640-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZNfsjqiMrKTyOZAMsDTnFWGOL7CzY82zZphDBIVogw=;
 b=vifCtKYAHC5L/ztjU+M2LgKfDlySkh5zlTrxtUXFCHGVZZ+68av4PDsNNOhoM7yNAZdtSDgT4GCAgnfDj+9or5VmLnF4S7wVYg74SCJQ+57gb/9krKE2aY6PNtaysbdBX7mLV8FDh1ShhSg97JQdlum/pNL0xq6Mky/zA5yIPME=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Th1uo7D0OFDEoki4odNQnGHRfruO5fDa1VQN3/BSh/CzO1Nv8rbTiDidqoX3+JS3nQIdRllxEuBIPWFYnM0453rPR+fWGSzlFAageGXcXdbjKC7Ew27mCE5UGcqcMmgJXxWJWsoIll7dLpchNrMAwx28YWJRRfcBv0e7p0iJnTlmPaywZZdBXNQhiXRfxwojPQlO9xQxr01tnyqQpeo2WSyNEhGO3x9Uj4A9cloFgtfv0LHH0igS42nehlXn/PtyzZhz+sPm5lqepTm8wdNDBpWpa1Kh26TDeC4IBUGIvF+AHSDGSPhBSrVszQl/ouvGoOvYOQOl7H+C2oKeqjU7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZNfsjqiMrKTyOZAMsDTnFWGOL7CzY82zZphDBIVogw=;
 b=QgBRVFPXw0LuiUbSRnIsuB4g3DcSIa8rgiwLxEIlyoOkz9CJvoa0M8SPwHYoiJgudKuhAZFsCJWWFmIFs7TA6GgtcVSX3loEV8c6XyFe2icz0lULeQKrAEMlWYLks+uYbfa4ijWupr+9El9opvoeJ/l+1f55ZCeaTaHMzgKjP1cXsvSBIgbiT+aVGjXnFgC0o+1IwTO64R/LCXIWEvYQTldqFJC65c2JJPsp3ru2pKq0WkEp679VpYSYF4UKCsKZQ4npirq2iIOZV+DAPkNkcpHce4y3n780WXzyvT78QUrYnQK3aV4KJ9hY7qoW258kxgYPf1J5dVcLV+Sb7nHRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZNfsjqiMrKTyOZAMsDTnFWGOL7CzY82zZphDBIVogw=;
 b=vifCtKYAHC5L/ztjU+M2LgKfDlySkh5zlTrxtUXFCHGVZZ+68av4PDsNNOhoM7yNAZdtSDgT4GCAgnfDj+9or5VmLnF4S7wVYg74SCJQ+57gb/9krKE2aY6PNtaysbdBX7mLV8FDh1ShhSg97JQdlum/pNL0xq6Mky/zA5yIPME=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Thread-Topic: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Thread-Index: AQHZKbkuhF2CydVKlkSWMcq+jFNCca6h0FvQgAB02YCAAABNQA==
Date: Tue, 17 Jan 2023 08:22:22 +0000
Message-ID:
 <AS8PR08MB79918757235E971524BD11A592C69@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
 <20230116144106.12544-2-michal.orzel@amd.com>
 <AS8PR08MB7991378797D89AF18F735C7C92C69@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <f1db1e82-d6f7-5424-2925-d1c6d35fee11@amd.com>
In-Reply-To: <f1db1e82-d6f7-5424-2925-d1c6d35fee11@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F4E6C348F80CA6458E987B8D3135E74B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB7392:EE_|AM7EUR03FT027:EE_|VE1PR08MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: cb922907-8a70-4e60-797f-08daf863fd48
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XfoL6SeiPq1R+b28VJZoOdK3g1eAbTonGU6N+rn5Ky2buk7o8Vz9JHZM7JPLC/IwLMB9RiMEu2XtuRBeOrWJAE3KxhG92bxYtxfJBGpbgEcvrEXfzgzmhERrV/7/WhveetHRXdbpZggRC8xHNN6PtWsq66I5+FjuL7ZvcTLwf9wIyUTxbxvy82lfGWPa+BCskpEzkPxi/7EL04SVrCQAjjD/FKuwOOxKY9+ZXjnDaqNZ/kGhtoD2ZYdGChhgf7ZBWOCUdLImyg5NmcEbhpadehaRv0i3apGTlmCiyiZZzwRHddp+u/Wrt7pfnXKEU+nqrSK/YxqhangG04OuGUnxeXUoUks7ASZij2c82ITOVmVwDdx66TM/PwmWL+9kp/YmCzJ7CGGSnJj9otKJ77Iwe8rGHvnGTpK2dF78+VIlbxq+X0zF+CgT0N9utK09d6zFadoheAlEgMLdigI21m7c0rVmmfGUvghT2+IgGDkv9zRlOo9gYYW6WHDGqX1OBPGuRLSNb7QtaaTIrR34zFiUXM8sqFuaC0W8SasUMAkrV9AuoWLXreD52SrZu0BqIbE0GRRur/eJnhyVVZiRygPdWTdUDagxa5aLwZXG63uFqZ59C5LhrfvTzH8tf5BSevJLgyYf0UPbKizQboZ31Fwgax5hN0NqDZYBHLo9N3lisJN2RK+rjc6Dhpvm6JG03x6hfyfN/w57A7stTEFiRm3XKA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199015)(55016003)(33656002)(4326008)(8676002)(41300700001)(76116006)(66556008)(5660300002)(64756008)(66946007)(66476007)(8936002)(52536014)(83380400001)(9686003)(478600001)(186003)(26005)(6506007)(66446008)(110136005)(54906003)(316002)(7696005)(71200400001)(38070700005)(86362001)(2906002)(38100700002)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7392
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9891350b-8fbe-406f-7e54-08daf863f549
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MI8xduAdXr20URh4RCsnzILIXH3crR4wfwudw20Kj2cxRtAhmeoalAhflbH4uexOKmY6Iaeht476flN478j8iYV6Kf0bJivrso1mV8zSRf5hMKcMtC7vlTe67NQtImz9Srdfyn+IDcwtPmqSRoua6iE4Xg2S9A0PrJkagSKico6WpAwuldPvJ7+UakIleG+pkyxMHR0GusJ89iopN7XnkYfotfbTQUoTqsXe6qTwDa+1BPQVn6jRK6gGqiYhs/eB+seCwbeePSwAMKVOAam2J1U5ni+C6tbyXc2v0K2k3cCuXsMk8+RjQgV/SbdHYdxevtBGX8fRy0zymEUurDu2CIcqE7FwD4hS/PrOkgxVlYxl1D7V/dDDf9KmsIy0E9dSwLcSXj1Cg26TuioJlghusZI6bS8sMB+rJwHeAN6edAbsGemhPfXURtDJGr/eLD7IdnLUFNCHZw6Iqos3HmeE9HfxFBD6JJRL3iv62/+em7ztfRfXl9ja4ZN8IdcmHbsV6pmZYPcpRJCBLvlbUYY5Ck6Yl+2nIGPormghc2fBQeFfRXhBQe06j0W/CnS7aRvtD74MWpSRNeOMD5bqagrxOTt5RLD6QZxBGgeiAilhhGMVFRKD1BVbTWUXlxuHm2QeMfO7AnT5O5f3UgDc/kcWMd76y1du7h54oc2HHWGjytJxq7QKtVCSiqgMROe84mXL/WL6pGm5YM8fsgnvL97FWg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(2906002)(82740400003)(356005)(86362001)(81166007)(40460700003)(47076005)(33656002)(40480700001)(55016003)(82310400005)(110136005)(54906003)(7696005)(316002)(83380400001)(70586007)(5660300002)(70206006)(6506007)(8676002)(41300700001)(4326008)(8936002)(52536014)(107886003)(478600001)(336012)(26005)(186003)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 08:22:36.0557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb922907-8a70-4e60-797f-08daf863fd48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5757

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHhl
bi9hcm02NDogRml4IGluY29ycmVjdCBESVJFQ1RNQVBfU0laRSBjYWxjdWxhdGlvbg0KPiANCj4g
SGkgSGVucnksDQo+IA0KPiA+PiAtI2RlZmluZSBESVJFQ1RNQVBfU0laRSAgICAgICAgIChTTE9U
MF9FTlRSWV9TSVpFICogKDI2NS0yNTYpKQ0KPiA+PiArI2RlZmluZSBESVJFQ1RNQVBfU0laRSAg
ICAgICAgIChTTE9UMF9FTlRSWV9TSVpFICogKDI2NiAtIDI1NikpDQo+ID4NCj4gPiBGcm9tIHRo
ZSBjb21taXQgbWVzc2FnZSAiTDAgc2xvdHMgZnJvbSAyNTYgdG8gMjY1IChpLmUuIDEwIHNsb3Rz
KSIsIEkgdGhpbmsNCj4gPiB0aGUgYWN0dWFsIHJhbmdlIGlzIFsyNTYsIDI2NV0gc28gcHJvYmFi
bHkgdXNpbmcgIigyNjUgLSAyNTYgKyAxKSIgaGVyZSBpcyBhDQo+ID4gYml0IGJldHRlcj8gSXQg
c2VlbXMgdG8gbWUgdGhhdCB0aGUgbnVtYmVyIDI2NiBsb29rcyBsaWtlIGEgbWFnaWMgbnVtYmVy
DQo+ID4gYmVjYXVzZSAyNjYgaXMgbm90IGluIHRoZSByYW5nZS4gQnV0IHRoaXMgaXMgbXkgcGVy
c29uYWwgdGFzdGUgdGhvdWdoIGFuZCBJDQo+ID4gYW0gb3BlbiB0byBkaXNjdXNzaW9uIGlmIHlv
dSBvciBtYWludGFpbmVycyBoYXZlIG90aGVyIG9waW5pb25zLg0KPg0KPiBJIHRoaW5rIHRoaXMg
aXMgYSBtYXR0ZXIgb2YgdGFzdGUuDQoNClllcyBpbmRlZWQsIHNvIEkgd291bGRuJ3QgYXJndWUg
Zm9yIHlvdXIgZXhwbGFuYXRpb24uLi4NCg0KPiBJIHByZWZlciBpdCB0aGUgd2F5IGl0IGlzIGJl
Y2F1c2UgYXQgbGVhc3QgaXQgbWF0Y2hlcw0KPiBob3cgeDg2IGRlZmluZXMgdGhlIERJUkVDVE1B
UF9TSVpFIGFuZCBpdCBhbHNvIG1hdGNoZXMgdGhlIHVzdWFsIHdheSBvZg0KPiBjYWxjdWxhdGlu
ZyB0aGUgc2l6ZQ0KPiB3aGljaCBpcyBzdWJ0cmFjdGluZyB0aGUgc3RhcnQgYWRkcmVzcyBvZiB0
aGF0IHJlZ2lvbiBmcm9tIHRoZSBzdGFydCBhZGRyZXNzIG9mDQo+IHRoZSBuZXh0IHJlZ2lvbg0K
PiAoZS5nLiBWTUFQX1ZJUlRfU0laRSBjYWxjdWxhdGlvbiBvbiBhcm0zMikuDQoNCi4uLmhlcmUg
YW5kIHlvdSBjYW4gaGF2ZSBteToNCg0KUmV2aWV3ZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5Lldh
bmdAYXJtLmNvbT4NCg0KPiANCj4gPg0KPiA+IE1heWJlIHdlIGNhbiBhbHNvIHB1dHRpbmcgYSBj
b21tZW50IG9uIHRvcCBvZiB0aGUgbWFjcm8gdG8gZXhwbGFpbiB0aGlzDQo+ID4gY2FsY3VsYXRp
b24uDQo+ID4NCj4gPiBJIGRpZCB0ZXN0IHRoaXMgcGF0Y2ggb24gRlZQIHVzaW5nIFhUUCBpbiBi
b3RoIGFybTMyIGFuZCBhcm02NCBleGVjdXRpb24NCj4gPiBtb2RlLCBhbmQgdGhpcyBwYXRjaCBp
cyBnb29kLCBzbzoNCj4gPg0KPiA+IFRlc3RlZC1ieTogSGVucnkgV2FuZyA8SGVucnkuV2FuZ0Bh
cm0uY29tPg0KPiBUaGFua3MuDQoNClBsZWFzdXJlLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0K
DQo+IA0KPiA+DQo+ID4gS2luZCByZWdhcmRzLA0KPiA+IEhlbnJ5DQo+IA0KPiB+TWljaGFsDQo=

