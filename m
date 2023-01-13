Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CF7669D0C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 17:00:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477470.740183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGMSY-0001yX-8X; Fri, 13 Jan 2023 15:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477470.740183; Fri, 13 Jan 2023 15:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGMSY-0001vN-5i; Fri, 13 Jan 2023 15:59:14 +0000
Received: by outflank-mailman (input) for mailman id 477470;
 Fri, 13 Jan 2023 15:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Kou=5K=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pGMSW-0001uz-1v
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 15:59:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3798980f-935b-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 16:59:10 +0100 (CET)
Received: from FR3P281CA0149.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:95::20)
 by DU0PR08MB8496.eurprd08.prod.outlook.com (2603:10a6:10:403::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Fri, 13 Jan
 2023 15:58:57 +0000
Received: from VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:95:cafe::aa) by FR3P281CA0149.outlook.office365.com
 (2603:10a6:d10:95::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 15:58:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT062.mail.protection.outlook.com (100.127.145.26) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 15:58:56 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Fri, 13 Jan 2023 15:58:56 +0000
Received: from 81341a76693d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 54A43F98-019A-4BA8-A382-E0DA14D79A81.1; 
 Fri, 13 Jan 2023 15:58:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 81341a76693d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 13 Jan 2023 15:58:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAVPR08MB8847.eurprd08.prod.outlook.com (2603:10a6:102:2fd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 15:58:42 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::b14f:1c13:afa:4eda%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 15:58:42 +0000
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
X-Inumbo-ID: 3798980f-935b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clfzVTHlDVmaPbdKsxMGI5DA11N6Bv2LitzaPGgp0Js=;
 b=gNtdpQ8b/CnURpuS5gqvPFCOm4M95Ip/Qy31IhMhw40SlgK/FaJBU3jf1djSqQ+skXIIxqcUak+f++6ZGZsVAUklJgjAFv+wQw2F3Z2GLlB+MYaWmzHOkU15bBEFb3nWSKMTyJW+liFtPTasj9IhVCvxQ73LF37slY3kMJvsEEI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef19e6cca0ba1596
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV9NAC+i/YRM15z50dViSHOVRC/Xl0Abg6Y7+5Gy3cXXRoX9WBcGCuOmKxJsiiDjF6uSvGkthaQ5Oier1ya2zXTnDRi5C9RPkpJykXE4fF8pgKD0YR4M7/R+u7tNrP6Juh8cbVg4ldfn5DQxxudEP8mD91assmoC7vC7sD9Q6q8r3bamgZynynWjJ0IvwemSHBcwpL2IrhHgWDnWHQIAoYIe0ejBM5okk6ubFYpThc3tDFUQ7zhqV91OxWMChCYypVaeEEmhvn+osyruw18Wdp1USPMDd/+Dk1PiVG7aS3wX3c5fKgWoxlelp5mCZDi0BjP9OuTVG/rvMt2WqWE49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clfzVTHlDVmaPbdKsxMGI5DA11N6Bv2LitzaPGgp0Js=;
 b=N1fMGWb2SaYEvluVNemtrlkc38nrYU7WMLkXodPz+GnTobAhK+IhUVg4cgufhbME1CjBqF+alFvVz09pcNXSrxviOHPBI7UaR9rUnZaX7n7K+Etq9aduWm+i9o2Gf+wwNnBB14+jFPWhG3FgOIGdVHeV0/M4wL1dYTOB2+wy9ShWBh2rO2lI3jo/No2xSTJLmeep9R05KgSY9FwZEUGR+9I2oT/4XGhWSb8SWLpO1s9gY4/G/c70+eQVQ3BKDuMZgV1rWGFpRbiD55cCf3/SOpSmtxwoRgkrGUC6puqs0pOfTD4yrsA3UzmenA8oVPAL2y00PKJBSbgNXLlOuzRlQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clfzVTHlDVmaPbdKsxMGI5DA11N6Bv2LitzaPGgp0Js=;
 b=gNtdpQ8b/CnURpuS5gqvPFCOm4M95Ip/Qy31IhMhw40SlgK/FaJBU3jf1djSqQ+skXIIxqcUak+f++6ZGZsVAUklJgjAFv+wQw2F3Z2GLlB+MYaWmzHOkU15bBEFb3nWSKMTyJW+liFtPTasj9IhVCvxQ73LF37slY3kMJvsEEI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 11/14] xen/arm64: Rework the memory layout
Thread-Topic: [PATCH v4 11/14] xen/arm64: Rework the memory layout
Thread-Index: AQHZJzoOgS7RtMe29EyEfBRXKSrWh66cgU+A
Date: Fri, 13 Jan 2023 15:58:42 +0000
Message-ID: <0733C610-F5F4-48B3-A78D-5D9D22C96F0B@arm.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-12-julien@xen.org>
In-Reply-To: <20230113101136.479-12-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAVPR08MB8847:EE_|VI1EUR03FT062:EE_|DU0PR08MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5b7ba1-8350-4386-9b80-08daf57f13ae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kvL4L0HOoxRF1D4L/ACzp2YQJPs0YroA+E2AsEGva8jl8QVJ2IwF3fQ188HQoVTjTZkVL+gbxftV5Oc8WGum+IENvp13Jj9dG5MnWVGudCVcvSvduCqofq/sXvIAQw8Ze60w6U33sPod07ArNGU6DUZjobjAP+hXmr06lW5Meyalo/o5FPzXTLa71Qi+sv05+a/KSj2f8zMKmT1ELhKHv5L0fhLCpoKGPht+ya7u5C5a5z4BvSlBCcv5X9+Qz6vj0xp7/xb1b3Ok511CEoaqtXVP32/UbwcRgRk6/M45mm/YdjmU35Puwu3MsoLBfavK0gGIDVlrZvUH8oDJjGhtewCPQ6648ESkxrBTlON8V1P6vokEyhacS9Y1p9GqSZLxsaIXBfiFWm7pR47ATY8viTz/QQUlmOL6mLnT4BavT1TjAV2miyxA0NTNao4Jx2t0/qLSHK3C1LX3SmtTCCvrXzezUI8iBH9R1CeZWhCHs0RlzprX20C+rSR6lyuocCVtj52dxiBOiQ3aOoHXmKeBr3inXeZIciAvfQ0KciHsCIpo6woV2Cx7BKzo8rbgCIhG/vU6riTBW5d8TjN0OdW5hLgM7uGZMFMFICsUrIFSqn3eN7rBqfYdl2fs5Vq4mVulTvB5WEYsEME2Og+HouLl4DEHdbvrBq0GALL4bDcn6fYMsBGnyk1AA3Mx/1TLSCDAElbgdVXpLnlqERdfwVm5sKJf/kJrM72/ugLHugcGl34=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(451199015)(83380400001)(91956017)(33656002)(76116006)(64756008)(66446008)(4326008)(66556008)(8676002)(66476007)(66946007)(8936002)(36756003)(41300700001)(2616005)(71200400001)(6512007)(186003)(6486002)(38100700002)(26005)(478600001)(38070700005)(6916009)(122000001)(54906003)(6506007)(53546011)(316002)(86362001)(5660300002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <790FCEA043C5C9478AA722FE69CB2527@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8847
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	383ab280-6c50-4002-1a60-08daf57f0b3b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9lCaziK8+YVNX4jQKesJEEGnBiJFRXXrwhFskvz7DY8mXb46vocYGOht8n9WD1khgdRO/M0X15Jx7o/nJwQhCaslaoj7i+sF+B3d5gjz6Df0Ssla4pclib9kniOKCdiRTwid3O5AhqT6YzIu+joqpFtlr7npJLDOo6PnSb7/gcr8WGmp6OsF13dJSDBLooQJhplf35WxRmM0QpUSEWwLwXzPSItrnhVCtvFcUjJ2L6ml42DdIk6UNe170UhVVdRgmAbWBdHmeWJMIerOTVcwbPfEm7ihnC3abWgcgh2p3u6A4n77vzZ87uGUs0XF+psMCI1MMZQs2IvHAU11jYsJpYEHCDBiQXk18xL9FGxRmGcLWoDNZv89zFZe/xZltpkhZ6G1QWoNUSvBB8eRqP89tEKpKUopGJy47ZVroM3Gdjbjrf9OoNu+T0DgsaL3dJBcZ1zHEx+nqJV4LLx4UkHKBFCWY005VOFZlq0WMcLUQ3ir4sx2jJS162J/4e3cLTH1GAuCKHN5W4vB/Ql7pF6o+jpN18OPb+CvJBEs/Ko1P/MV3vXTFzq87zdqnkA/sHctNkd/VtqQxcchnwEJDz5bscdV9emNO21i+PhJT5hiK5eU2UKQUjfkpLHgZBEiym1+QORorCugwxWV1qSxisdZkavLZ05gdtdO2BbSR6GtmgBuoQQPdRHNVVTThVBPpUvg6WBq+JtKBgoJfS9Wyzdulw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(33656002)(40480700001)(40460700003)(47076005)(4326008)(336012)(41300700001)(8676002)(70586007)(83380400001)(5660300002)(70206006)(8936002)(6862004)(6486002)(478600001)(26005)(186003)(53546011)(6512007)(107886003)(2616005)(316002)(36756003)(356005)(82310400005)(54906003)(86362001)(2906002)(82740400003)(36860700001)(81166007)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 15:58:56.5114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5b7ba1-8350-4386-9b80-08daf57f13ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8496

DQoNCj4gT24gMTMgSmFuIDIwMjMsIGF0IDEwOjExLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+
DQo+IA0KPiBYZW4gaXMgY3VycmVudGx5IG5vdCBmdWxseSBjb21wbGlhbnQgd2l0aCB0aGUgQXJt
IEFybSBiZWNhdXNlIGl0IHdpbGwNCj4gc3dpdGNoIHRoZSBUVEJSIHdpdGggdGhlIE1NVSBvbi4N
Cj4gDQo+IEluIG9yZGVyIHRvIGJlIGNvbXBsaWFudCwgd2UgbmVlZCB0byBkaXNhYmxlIHRoZSBN
TVUgYmVmb3JlDQo+IHN3aXRjaGluZyB0aGUgVFRCUi4gVGhlIGltcGxpY2F0aW9uIGlzIHRoZSBw
YWdlLXRhYmxlcyBzaG91bGQNCj4gY29udGFpbiBhbiBpZGVudGl0eSBtYXBwaW5nIG9mIHRoZSBj
b2RlIHN3aXRjaGluZyB0aGUgVFRCUi4NCj4gDQo+IEluIG1vc3Qgb2YgdGhlIGNhc2Ugd2UgZXhw
ZWN0IFhlbiB0byBiZSBsb2FkZWQgaW4gbG93IG1lbW9yeS4gSSBhbSBhd2FyZQ0KPiBvZiBvbmUg
cGxhdGZvcm0gKGkuZSBBTUQgU2VhdHRsZSkgd2hlcmUgdGhlIG1lbW9yeSBzdGFydCBhYm92ZSA1
MTJHQi4NCj4gVG8gZ2l2ZSB1cyBzb21lIHNsYWNrLCBjb25zaWRlciB0aGF0IFhlbiBtYXkgYmUg
bG9hZGVkIGluIHRoZSBmaXJzdCAyVEINCj4gb2YgdGhlIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2Uu
DQo+IA0KPiBUaGUgbWVtb3J5IGxheW91dCBpcyByZXNodWZmbGVkIHRvIGtlZXAgdGhlIGZpcnN0
IHR3byBzbG90cyBvZiB0aGUgemVyb2V0aA0KPiBsZXZlbCBmcmVlLiBYZW4gd2lsbCBub3cgYmUg
bG9hZGVkIGF0ICgyVEIgKyAyTUIpLiBUaGlzIHJlcXVpcmVzIGEgc2xpZ2h0DQo+IHR3ZWFrIG9m
IHRoZSBib290IGNvZGUgYmVjYXVzZSBYRU5fVklSVF9TVEFSVCBjYW5ub3QgYmUgdXNlZCBhcyBh
bg0KPiBpbW1lZGlhdGUuDQo+IA0KPiBUaGlzIHJlc2h1ZmZsZSB3aWxsIG1ha2UgdHJpdmlhbCB0
byBjcmVhdGUgYSAxOjEgbWFwcGluZyB3aGVuIFhlbiBpcw0KPiBsb2FkZWQgYmVsb3cgMlRCLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4NCj4g
LS0tLQ0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29t
Pg0KDQpJ4oCZdmUgYWxzbyBidWlsdCBmb3IgYXJtNjQgYW5kIHRlc3QgdGhpcyBwYXRjaCBvbiBm
dnAsIGJvb3RpbmcgRG9tMA0KYW5kIGNyZWF0aW5nL3J1bm5pbmcvZGVzdHJveWluZyBzb21lIGd1
ZXN0cw0KDQpUZXN0ZWQtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4N
Cg0KDQo=

