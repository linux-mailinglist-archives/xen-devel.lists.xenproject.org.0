Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B9452B67E
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 11:51:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331841.555448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGLJ-0008Tz-Cg; Wed, 18 May 2022 09:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331841.555448; Wed, 18 May 2022 09:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrGLJ-0008RW-9j; Wed, 18 May 2022 09:51:45 +0000
Received: by outflank-mailman (input) for mailman id 331841;
 Wed, 18 May 2022 09:51:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qF5t=V2=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nrGLH-00089g-Im
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 09:51:43 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe06::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e949848-d690-11ec-837e-e5687231ffcc;
 Wed, 18 May 2022 11:51:41 +0200 (CEST)
Received: from AM5P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::34)
 by VI1PR08MB2925.eurprd08.prod.outlook.com (2603:10a6:802:19::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 09:51:39 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::98) by AM5P194CA0024.outlook.office365.com
 (2603:10a6:203:8f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Wed, 18 May 2022 09:51:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 09:51:38 +0000
Received: ("Tessian outbound 07c1c99345b0:v119");
 Wed, 18 May 2022 09:51:38 +0000
Received: from 4844ad5d50d2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04BA4D00-30BB-4199-B3E6-E2447BF20AEA.1; 
 Wed, 18 May 2022 09:51:32 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4844ad5d50d2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 May 2022 09:51:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB4546.eurprd08.prod.outlook.com (2603:10a6:208:148::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 09:51:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::91a2:f704:9c0d:fca6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::91a2:f704:9c0d:fca6%6]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 09:51:30 +0000
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
X-Inumbo-ID: 1e949848-d690-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Tooc3TRk8d1pt3dU9Wlu46SuaCaeXhN+O41DG+6bbvGHSBoTrWMqItvhV+nfWCQ4eLtGBPdChejrUaUAXAaw6ggPxnqWEXOzon98Y1rWHFA4Aj5U+3yslMkRQUYFRGBo23rxL/d5aDYim/BzevZYEvhhX4RIIcq1tLR/XG3unvuqorj54a8juzR1IZVY7lCxQYPdn7dr6TKBuvYQArzru15yHBscER2lLeF85VM8y2TqdpmgTWZLyP9EY5xoMypdqXlxjit21U1dtZKPKJBtKj+h8NC8PvlxPZaIvPEE5ooXoSWvkGQDAMgca4we1EQSTRX3lTlOZirY2YWn7eZ+PA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOh5A7i9lGFJOjz3cXf56oM0PXfKs4c/dTM0+6GHCuQ=;
 b=k7zkqOUukw6MZ1E9nu3qmxYvr4pOZ4GTYkE5dYuktTrI4yETiM2vgpOBRu4i1hGsxOcTsZwGZ3QfS4Y90CuX5K8RBRD9n3pyrcatr7OARPLFJoMVTwXxMx27cD7C5buBVHqjI7cZlGHPxlb6gZ9RmBxc06pX7tzXzfvy8AnIGm43ahIVs7Puq50VYsu4smuFkr8hGYmtAdXwFMUVpLUu2azhOFJCAbXuJlNg6cbL5MVcGSlC8JZCzZ/YyzbRIdYdeTAHeJnLkEJzuSN5HBmzIPXGYnEnUh28LaSnF6mNgGNdwPMmePoDjt0do1QuiEkiIwV4p8VZARIR8qLACEDC4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOh5A7i9lGFJOjz3cXf56oM0PXfKs4c/dTM0+6GHCuQ=;
 b=JOUCHsB5CpVhPK+nyYJlTv4wmcBGNGhKa64D2oNE6Uz3VtQ/X1E3TwxTUsu1wYeoKyMOvEttuks/Dh6OxDvrTlZPyFWUufSIy99bWmiVrBNLPYG4Hra1LoTZM+RQvwzLnIFr8sbvPG6Jr+vMB9BRr+a6TcQnzuwr4kF5oTKjGXU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhnC7wImcM0dAcF8OT1MG9ahngODwJyALH+Lx3+WcSssn3SMLXvOTBYCVN60mZuRMxNjiC3PsIdrMQNTjHl0bzTw4pj9zlIHhx35MOk3+wayCQeTcQyJlgKeqfV3jfwqanagquFT52iAVfQvOaG5EgNiAAZCJZhNuJGr/0SsJofp0Obb00QQx04M6AYlWKtrnWuU27p8GSkn32KnaeQB0icC0wpedMkbF6QATcb8ogpmob74e2ee5/OYhYl2epkVYeBtNrjG0k9GrCi9IQiG64zZSs35Yu3x5r21uJtBAFcEM4vLbA1aQHEusyR/M31mwt1pQRnP1yhvj6YwknaUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOh5A7i9lGFJOjz3cXf56oM0PXfKs4c/dTM0+6GHCuQ=;
 b=HgEPMKn/e1u4rVTEQzL8AD996nEhZROg7h1WrtdcoKqk+gnicwfLvu8FBuGsVAtC/xSs0G/y9b7f2IbTxB8AhEi7DLGA7OhuB0mdNJWIc1lxCz0okL5ExGWjKzp/7dEsdS+l9dz69NpljuNJCNoj+6wP3tHNJOTb0CroCGIT7F/PjUqCd1tFWm4badmA5PNvDsi3n+IUnNDkyoEF/EPxdOI2LLE4HjWXfzaS+BV71PrueHgnlJ93gjFCX/Z2/NdSB/U9fWH9DD4c7ptUV/7BUEXTTxErGhGlLfMUvoFcug0TWxOiXWG+KqwfZ0C3ii5zr2kKx+XV1/08rMfyhDnSiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOh5A7i9lGFJOjz3cXf56oM0PXfKs4c/dTM0+6GHCuQ=;
 b=JOUCHsB5CpVhPK+nyYJlTv4wmcBGNGhKa64D2oNE6Uz3VtQ/X1E3TwxTUsu1wYeoKyMOvEttuks/Dh6OxDvrTlZPyFWUufSIy99bWmiVrBNLPYG4Hra1LoTZM+RQvwzLnIFr8sbvPG6Jr+vMB9BRr+a6TcQnzuwr4kF5oTKjGXU=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Community Manager
	<community.manager@xenproject.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Topic: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Thread-Index: AQHYagM6tDpJ92rV50ONWDPDxej1sa0kY+2AgAABBzA=
Date: Wed, 18 May 2022 09:51:30 +0000
Message-ID:
 <AS8PR08MB799171E2FE25B734B6331AFB92D19@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <6b5362c8-2a41-d2c8-b25e-2e9c421d6da2@suse.com>
In-Reply-To: <6b5362c8-2a41-d2c8-b25e-2e9c421d6da2@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1CFB2696FC852645B69C9AC31A52DEFB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 91e8caf3-b73d-4fa0-e5aa-08da38b400d4
x-ms-traffictypediagnostic:
	AM0PR08MB4546:EE_|AM5EUR03FT015:EE_|VI1PR08MB2925:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB292592570E313A418D8C988592D19@VI1PR08MB2925.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LRey6OFt3x13rGXXmP9C0c2N6C1iA25od2ralE6L7xLqIwP0Tt7XcvziRNmnEY0XjLIqLbzo00Zqpxq0/++GqhEgpWmuUjTU1oUvtzh0otOvdGbW0zx4Iwz+wd+MWB0SiwGjKWRe1qwD8CMV1uEgtPWg6IPjHWpttIjRiuWrsa1LZdkQvWy9nk4BlY+U8unEwiBDJcLTOHvxjC+DdttIRpd7jsCACLZSFgrD4vTrXusUfR10WoLcy3YdL/WOLheL60UF6GxuHqBpcICMSqGJ8xE8ILd/9vfMJyAuwifdgAAZZi8762rp8zgeOEYXdF9piG6pysEfQClvfgBHq+/4L5Vnoi5MBt3nNYAVIDLPdNhOUIbUsNSqA2mdRq2jSSgvTVyzq+MZ5jqUwc9XiMm8STVq8bqrAOvmsf7hZXkafxCaa3jFa2TweRcgjLDBx+SrkFLHvIJoSBiTam45b9QDHxsKmyEfe5QCrdlgLMZgeeDHg36u9Q4kQN2mFiEA6mraCEnM4gV715BzQPdczf5hJ0cxFF2C1IVdgbnBIco6xCU40XBEHrmM+Wcgf6fXmdDl7hP5CrbzpzR56aIi/IjQXVUN6yERH/cTTD6MEvEYXOWFykSyG4iF5Kf5/dEaEi/7i188lUnNdLVTtt0NhSo0RKOq0BJ/4ahBMmXOXcmIKhHzi85or2kEVIznkgng+QQR8awI9xjs+/fgFldOm0RnAQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(71200400001)(83380400001)(316002)(38070700005)(7696005)(6506007)(53546011)(66446008)(38100700002)(9686003)(86362001)(122000001)(54906003)(110136005)(8936002)(52536014)(26005)(4326008)(8676002)(64756008)(66476007)(66556008)(66946007)(76116006)(55016003)(5660300002)(33656002)(2906002)(186003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4546
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e2f7271-25e9-4c15-2a4f-08da38b3fbd4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TCH1CQhBRS+PXGYmEPrl/dCskf0z8tY/0sLLukOoqDNYOntNXBGwowF6PqJcJn6s8DMxPqmNXuxNpg7OCeyrG6sV4WEi1MpIqq6oElLq2HyYz3961CXZICrKWUSGSK1lJFLQAq2Fj8MfMKtEkeL7ODui7BUDxLUDxR67mtVytsscTIauc8IVpldTybSP4TKdYYv5004xgiDGca+R+kHNXUweAs2CuMV2Oy5rQ9KCAsd0jDKvX2EgSgtGZRaMNN7/7hRfX8IO2tjH5BWTXC198LaoSOrqNbBYfNfaEneLCcwGg9RNSMO1xcmfn0/23Is/bGDRyecQOBXTnCKJs9A1FJvpplUhmL3DNQtxmDgFtfPCtu0Uvcnq8fSLveDPC+U6CXSoLFhPqvyUP0UNcEGRSD4KU2PnJr5mSKubIr4j3DT2twwHPZCgSC+FYaZeorOwvDIZqtptoz1kXxLz//Tni2Ij6d5mcHu6OoZeZ/gKtvSoZMCfZKxIwMOtYv+I2rf5yAEfa6unyIUH1M8+IXipjDpvHwVsLEZqqgVDBGgfV5PxbVei0RqH5csf1cCtRDikuUNoAKPI/MZJWENdSPwmx8jUqFgpHTGtEjlSZWQj/yf4a56aqcJIsE4vcU1e7AT+x0MUZzWvQ3deKAhvAmTyeHFUkCgtr8v/swpAgD3NZ6H9EJHvg25ZJJxKpdpiBJDs
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(40460700003)(8676002)(316002)(83380400001)(54906003)(336012)(81166007)(9686003)(110136005)(7696005)(4326008)(86362001)(47076005)(356005)(186003)(6506007)(70586007)(55016003)(52536014)(8936002)(82310400005)(36860700001)(508600001)(53546011)(2906002)(26005)(70206006)(5660300002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 09:51:38.4942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91e8caf3-b73d-4fa0-e5aa-08da38b400d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2925

SGkgSmFuLCBSb2dlciBhbmQgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IE9uIDE3LjA1
LjIwMjIgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToNCj4gPiBIZWxsbywNCj4gPg0KPiA+
IFRoZSBmb2xsb3dpbmcgc2VyaWVzIGltcGxlbWVudHMgc3VwcG9ydCBmb3IgTVNSX1ZJUlRfU1BF
Q19DVFJMDQo+ID4gKFZJUlRfU1NCRCkgb24gZGlmZmVyZW50IEFNRCBDUFUgZmFtaWxpZXMuDQo+
ID4NCj4gPiBOb3RlIHRoYXQgdGhlIHN1cHBvcnQgaXMgYWRkZWQgYmFja3dhcmRzLCBzdGFydGlu
ZyB3aXRoIHRoZSBuZXdlciBDUFVzDQo+ID4gdGhhdCBzdXBwb3J0IE1TUl9TUEVDX0NUUkwgYW5k
IG1vdmluZyB0byB0aGUgb2xkZXIgb25lcyBlaXRoZXIgdXNpbmcNCj4gPiBNU1JfVklSVF9TUEVD
X0NUUkwgb3IgdGhlIFNTQkQgYml0IGluIExTX0NGRy4NCj4gPg0KPiA+IFhlbiBpcyBzdGlsbCBm
cmVlIHRvIHVzZSBpdCdzIG93biBTU0JEIHNldHRpbmcsIGFzIHRoZSBzZWxlY3Rpb24gaXMNCj4g
PiBjb250ZXh0IHN3aXRjaGVkIG9uIHZte2VudHJ5LGV4aXR9Lg0KPiA+DQo+ID4gT24gWmVuMiBh
bmQgbGF0ZXIsIFNQRUNfQ1RSTC5TU0JEIHNob3VsZCBleGlzdCBhbmQgc2hvdWxkIGJlIHVzZWQg
aW4NCj4gPiBwcmVmZXJlbmNlIHRvIFZJUlRfU1BFQ19DVFJMLlNTQkQuICBIb3dldmVyLCBmb3Ig
bWlncmF0aW9uDQo+ID4gY29tcGF0aWJpbGl0eSwgWGVuIG9mZmVycyBWSVJUX1NTQkQgdG8gZ3Vl
c3RzIChpbiB0aGUgbWF4IGNwdWlkIHBvbGljeSwNCj4gPiBub3QgZGVmYXVsdCkgaW1wbGVtZW50
ZWQgaW4gdGVybXMgb2YgU1BFQ19DVFJMLlNTQkQuDQo+ID4NCj4gPiBPbiBGYW0xNWggdGhydSBa
ZW4xLCBYZW4gZXhwb3NlcyBWSVJUX1NTQkQgdG8gZ3Vlc3RzIGJ5IGRlZmF1bHQgdG8NCj4gPiBh
YnN0cmFjdCBhd2F5IHRoZSBtb2RlbCBhbmQvb3IgaHlwZXJ2aXNvciBzcGVjaWZpYyBkaWZmZXJl
bmNlcyBpbg0KPiA+IE1TUl9MU19DRkcvTVNSX1ZJUlRfU1BFQ19DVFJMLg0KPiA+DQo+ID4gU28g
dGhlIGltcGxlbWVudGF0aW9uIG9mIFZJUlRfU1NCRCBleHBvc2VkIHRvIEhWTSBndWVzdHMgd2ls
bCB1c2Ugb25lDQo+IG9mDQo+ID4gdGhlIGZvbGxvd2luZyB1bmRlcmx5aW5nIG1lY2hhbmlzbXMs
IGluIHRoZSBwcmVmZXJlbmNlIG9yZGVyIGxpc3RlZA0KPiA+IGJlbG93Og0KPiA+DQo+ID4gICog
U1BFQ19DVFJMLlNTQkQ6IHBhdGNoIDENCj4gPiAgKiBWSVJUX1NQRUNfQ1RSTC5TU0JEOiBwYXRj
aCAyLg0KPiA+ICAqIE5vbi1hcmNoaXRlY3R1cmFsIHdheSB1c2luZyBMU19DRkc6IHBhdGNoIDMu
DQo+ID4NCj4gPiBOQjogcGF0Y2ggMyBpbnRyb2R1Y2VzIHNvbWUgbG9naWMgaW4gR0lGPTAgY29u
dGV4dCwgc3VjaCBsb2dpYyBoYXMgYmVlbg0KPiA+IGtlcHQgdG8gYSBtaW5pbXVtIGR1ZSB0byB0
aGUgc3BlY2lhbCBjb250ZXh0IGl0J3MgcnVubmluZyBvbi4NCj4gPg0KPiA+IFJvZ2VyIFBhdSBN
b25uZSAoMyk6DQo+ID4gICBhbWQvbXNyOiBpbXBsZW1lbnQgVklSVF9TUEVDX0NUUkwgZm9yIEhW
TSBndWVzdHMgb24gdG9wIG9mDQo+IFNQRUNfQ1RSTA0KPiA+ICAgYW1kL21zcjogYWxsb3cgcGFz
c3Rocm91Z2ggb2YgVklSVF9TUEVDX0NUUkwgZm9yIEhWTSBndWVzdHMNCj4gPiAgIGFtZC9tc3I6
IGltcGxlbWVudCBWSVJUX1NQRUNfQ1RSTCBmb3IgSFZNIGd1ZXN0cyB1c2luZyBsZWdhY3kgU1NC
RA0KPiANCj4gRlRBT0QsIHdoaWxlIGJlc2lkZXMgYSBtaXNzaW5nIGFjayBmb3IgLi4uDQo+IA0K
PiA+ICBDSEFOR0VMT0cubWQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAzICsN
Cj4gDQo+IC4uLiB0aGlzIGFkZGl0aW9uIHRoZSBzZXJpZXMgd291bGQgbm93IGxvb2sgdG8gYmUg
cmVhZHkgdG8gZ28gaW4sDQo+IEknZCBsaWtlIHRvIGhhdmUgc29tZSBmb3JtIG9mIGNvbmZpcm1h
dGlvbiBieSB5b3UsIEFuZHJldywgdGhhdA0KPiB5b3Ugbm93IHZpZXcgdGhpcyBhcyBtZWV0aW5n
IHRoZSBjb21tZW50cyB5b3UgZ2F2ZSBvbiBhbiBlYXJsaWVyDQo+IHZlcnNpb24uDQoNCk5vdCBj
b21wbGV0ZWx5IHN1cmUgaWYgSSBhbSBwcm9wZXIgdG8gZG8gdGhhdCBidXQgZm9yIHRoZSBDSEFO
R0VMT0cubWQNCmNoYW5nZToNCg0KQWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJt
LmNvbT4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiANCj4gSmFuDQoNCg==

