Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 994413FEF41
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 16:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177307.322665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLnUv-0007QY-AR; Thu, 02 Sep 2021 14:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177307.322665; Thu, 02 Sep 2021 14:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLnUv-0007O6-7S; Thu, 02 Sep 2021 14:15:21 +0000
Received: by outflank-mailman (input) for mailman id 177307;
 Thu, 02 Sep 2021 14:15:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=do2V=NY=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mLnUt-0007O0-ET
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 14:15:19 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.66]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32558fec-0bf8-11ec-ae73-12813bfff9fa;
 Thu, 02 Sep 2021 14:15:17 +0000 (UTC)
Received: from PR2PR09CA0011.eurprd09.prod.outlook.com (2603:10a6:101:16::23)
 by VE1PR08MB5728.eurprd08.prod.outlook.com (2603:10a6:800:1a0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 14:15:15 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:101:16:cafe::c3) by PR2PR09CA0011.outlook.office365.com
 (2603:10a6:101:16::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 14:15:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 14:15:14 +0000
Received: ("Tessian outbound 32695b2df2f8:v103");
 Thu, 02 Sep 2021 14:15:14 +0000
Received: from 538ca24e630e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7C765AFF-7C4E-4C69-A812-4351BC845DCA.1; 
 Thu, 02 Sep 2021 14:14:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 538ca24e630e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Sep 2021 14:14:41 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB5338.eurprd08.prod.outlook.com (2603:10a6:10:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 14:14:39 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 14:14:39 +0000
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
X-Inumbo-ID: 32558fec-0bf8-11ec-ae73-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLCyG1nPoAs2Scph3OKb7y5oaPlFomSVrHudFHc5/fc=;
 b=WpwIzIXJ2EkBEz40BicJDri6QWkBKr9N4lQiLGICtkCCphNCNGXsGaKI1Cr6hqWzYDl+aRelrj95Rx/KQKYOLuevqAjEptfPBDoluKv5ExVRf3xxqGuZjqNJaRDTShN9DkjxXLKhqR/P/CmMTFIyeiLBJD0Wh7fYcPAQPzs17i0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7981e90009dcd52
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moCUcvJ5s7tImV10RgKRly2fUr3/fPEx/jpYw5FEcq1PjStFa9HTATLx3SIrSalqFdmg6REV89lDkmAKXKq22MG84i0GI37SA/VJAn9JM9MfsZ8zmzDU21my0sZPhNrxjQVv8mvVeRCdoSFuFIgmUPJultXQ6IA8qKXT3+4S4bQ9LmmbaNqY4YxYwgSY6OqKOFB5zgG/slnsNq+wL64g95OtkqS0nuhLVcu1hATExVOgX7hfbBdJC0Qn1bpayQtrLbxGfcBjhrcxDg8HjCAiL5Yi0RKTKjy6dFxuJRZLGvB42OjY0dcP4UQwvDo1PVDEsqs88gVMJUp0RguZmiVFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLCyG1nPoAs2Scph3OKb7y5oaPlFomSVrHudFHc5/fc=;
 b=K5t81NQeQcE4eW9LoZlPFzwAl+zF+zWaQUlcU4tyC3DmP6cW8lxlc7vMBsHAep6UxZMyxmxrdTlFvr3zbadpWPeJ0WVIX7RZdUDfcJAWVRb3Ei1dlgQKqbkj5jWIPuaJRXNDsANM+yfvjLDrYrg8iYwWDKK44/0BM/FmNPtaiGBBIwvkO+sEHzCNyaZIP11zCWfPV+dEJGSJFnFwdePD7AtJ0KeN1LU876miW6WZiXSlkAVk/mKdM/BIGzUGSenEOAtkcqs3ytgs3kFgJrF7vo287RKgTTWU9pwWHUOjQQ7l9QmkOUW8Uv39/0hpI5IpaM70Coma8Uqfj98i8zByoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLCyG1nPoAs2Scph3OKb7y5oaPlFomSVrHudFHc5/fc=;
 b=WpwIzIXJ2EkBEz40BicJDri6QWkBKr9N4lQiLGICtkCCphNCNGXsGaKI1Cr6hqWzYDl+aRelrj95Rx/KQKYOLuevqAjEptfPBDoluKv5ExVRf3xxqGuZjqNJaRDTShN9DkjxXLKhqR/P/CmMTFIyeiLBJD0Wh7fYcPAQPzs17i0=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse device
 tree NUMA distance map
Thread-Topic: [XEN RFC PATCH 24/40] xen/arm: introduce a helper to parse
 device tree NUMA distance map
Thread-Index:
 AQHXjps+iLbrOQu8n06b5z+EtCRt06uM5puAgABnI4CAAPWOAIAA3gOAgABcYACAAOS/gIAAh9fw
Date: Thu, 2 Sep 2021 14:14:39 +0000
Message-ID:
 <DB9PR08MB6857CBC9AFAC5DFBA423B1929ECE9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-25-wei.chen@arm.com>
 <alpine.DEB.2.21.2108301740500.17851@sstabellini-ThinkPad-T480s>
 <DB9PR08MB685715E39333597911BAB6FD9ECC9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2108311428040.18862@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857F9954D269AE5EC45093B9ECD9@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <alpine.DEB.2.21.2109010920220.17925@sstabellini-ThinkPad-T480s>
 <e28f6230-56cc-e716-0dbb-8e1dacec7df2@suse.com>
In-Reply-To: <e28f6230-56cc-e716-0dbb-8e1dacec7df2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B1C2CBA5107FD847AC1096268755BBB9.0
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e9a6306c-039d-43a2-3ef7-08d96e1c1591
x-ms-traffictypediagnostic: DB8PR08MB5338:|VE1PR08MB5728:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5728AB2B277CB2C62D7E4C2F9ECE9@VE1PR08MB5728.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AU9cInyw5hjhDGKCSUDbvl5Jmyrjowh5uiLTNQj3qfWKOcn47uBsFFlddhEaYBrH4RWrZVeTZyy3gYd0U+n29oUXFO+NxKwijwyypgXk+DTtD0pO4usfeHyBp9Dk9RRsQ9KTC1YlRZY0lUihA7+1Lucl4+DgUZYfaB+SdwJKLZIB1P9r4xk6nIXQ3hoNBYVEE3V9/suO45gGAsV2yGwT2bHIw/RvpDY3XCQPYG42l2huNKNn/ibNkGWnkPwX/3UTR9E/bQufojZMIkYhV6NKV89BJkGNB20TCE64Zg+Gm7KGdqEKgxu/VaAWie+mGqpQeKJTDpraFMZSV7Wx9dMxnt8tJ8z2tVwOz7FTo5A1W/9KephntsHlGkO/ti27AHii8jsX8A11NbsoeC19soPqgR0RFJ3YnuFRRHFWmzLEzXBbFRJBUh+bEgcWjXnYfFoUJ53meskxoXG9Zkbp3RS3I/rH8WZG32A25J/rzYGZ2572wtgUkewDloUbX9ZnyPdEgcQZTmWMIjxrHgfRSlHMQ0dM1/EGjmJcKRByfA/JxXv6Sbc/Q6JKZzZLiRYMeFM/Z1eWFVOYG/lbzyvWWzeYeCmfYLCcXilvjkloVq3TBMCoDj2wIK8iJPmp4VsoUVGt3/FA0BHmU0Vm9n3TcWbrIE1v8bP7ymiaDg27MBwTLbPguET7H6ueVeDQKJv9KZ/cXcTnl4fr8qzxQ8jrcp0I3kTNikJGLzFesZpcDBGk4Fgpiv39HRk/nhUzeUor2SAq0TpQcoVxIsipdGH5AYqdtBRVzBHonTRm1Mqso8a+ONI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(66556008)(7696005)(26005)(66446008)(4326008)(8936002)(64756008)(186003)(66476007)(8676002)(2906002)(76116006)(83380400001)(9686003)(38100700002)(71200400001)(66946007)(53546011)(33656002)(6506007)(122000001)(86362001)(966005)(54906003)(38070700005)(478600001)(55016002)(52536014)(110136005)(316002)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5338
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97570c57-bd19-4693-31e7-08d96e1c0046
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vw8ZSKFXU6tuCrSTm8mmzGA/gyPH+swrt8FKGcN8api9LzHseRs3nt6gy+bdG7WuHRLw6e64SHOchze2+knt6XVy4C9tD9E+kVOnN6fv+jxkVrCARzSALYeVXpx049HzKlAIUUy3F/G0VQGkKXB5eceb31cUqBuMmJFArjqLkO+Q15JeEWZlMDK0CeESbcZ3Cc+ewWVVf+N//vOeYtCoh6mH4bzAkBe301mkoEFmd2P+bHonFVh8vIqOTTzKt1mJMlkF3ufT5YL80desO0dBosWRBsAmaB21wOyxB/SLzKzrTczl4ipWRQOAbkoww28gi0cwx9gj2oKSK/GNoypuFNZsQYaQlCgBGs7mKIzhHBOAh/v/hxjx0QHXy2u/5P+IVEzmwE+Y0qFq6436P257FUJddddbo2FhWPytt6RgF+2XLDlAJsWiSWbA2LCw5aimh7jUHSs9AuRixai0CQX8d5PGrvqWJh2ZhEP39ElnSzalaaDCoz3IsGIj+OtN1FRC/QGhBXR+fYwmFN4pe94AXJX03mq5iOoRRUVPGz3p7afvZxbbJ2rqaTnJMpRHsQ+1f7FFR8wHvjbU7IiE3AruH4vjaeVMmsnMxDpLx7KAYt2HjcqTQ06FnzuDsT8T0CRbi47qIX8gPO3kVaN0dyhibC5VInd+Qf3EnTpM76B/6/EjBaT3Ttlcr6K4PLUctFdqfV4moLNp1zy60WnL1JwmdpmfD9PSIkcClu9cWuUZQzQHVvXnoISBcMUA4dR1DtsbiouGYTkvUA1JzJbo8qhPEhOES8gO3C0q0JxOSJ9ChvY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(46966006)(36840700001)(966005)(2906002)(81166007)(4326008)(336012)(5660300002)(478600001)(8676002)(356005)(54906003)(55016002)(52536014)(9686003)(86362001)(82740400003)(110136005)(8936002)(70586007)(33656002)(83380400001)(70206006)(47076005)(36860700001)(316002)(6506007)(26005)(186003)(7696005)(82310400003)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 14:15:14.8216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a6306c-039d-43a2-3ef7-08d96e1c1591
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5728

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDnmnIgy5pelIDE0OjAwDQo+
IFRvOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgQ2hl
bg0KPiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZzsganVsaWVuQHhlbi5vcmc7IEJlcnRyYW5kIE1hcnF1aXMNCj4gPEJlcnRyYW5kLk1hcnF1
aXNAYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtYRU4gUkZDIFBBVENIIDI0LzQwXSB4ZW4vYXJt
OiBpbnRyb2R1Y2UgYSBoZWxwZXIgdG8gcGFyc2UNCj4gZGV2aWNlIHRyZWUgTlVNQSBkaXN0YW5j
ZSBtYXANCj4gDQo+IE9uIDAxLjA5LjIwMjEgMTg6MjEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToNCj4gPiBPbiBXZWQsIDEgU2VwIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4gU3RlZmFu
byBTdGFiZWxsaW5pDQo+ID4+PiBTZW50OiAyMDIx5bm0OeaciDHml6UgNTozNg0KPiA+Pj4NCj4g
Pj4+IE9uIFR1ZSwgMzEgQXVnIDIwMjEsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4+IEkgZG9uJ3Qg
cmVhbGx5IGxpa2UgdGhpcyBpbXBsZW1lbnRhdGlvbi4gSSB3YW50IHRoZSBiZWhhdmlvciBvZg0K
PiA+Pj4+IG51bWFfc2V0X2Rpc3RhbmNlIGp1c3QgbGlrZSB0aGUgZnVuY3Rpb24gbmFtZSwgZG8g
bm90IGluY2x1ZGUNCj4gPj4+PiBpbXBsaWNpdCBvcGVyYXRpb25zLiBPdGhlcndpc2UsIGV4Y2Vw
dCB0aGUgdXNlciByZWFkIHRoaXMgZnVuY3Rpb24NCj4gPj4+PiBpbXBsZW1lbnRhdGlvbiBiZWZv
cmUgaGUgdXNlIGl0LCBoZSBwcm9iYWJseSBkb2Vzbid0IGtub3cgdGhpcw0KPiA+Pj4+IGZ1bmN0
aW9uIGhhcyBkb25lIHNvIG1hbnkgdGhpbmdzLg0KPiA+Pj4NCj4gPj4+IFlvdSBjYW4gbGVhdmUg
bnVtYV9zZXRfZGlzdGFuY2UgYXMtaXMgd2l0aG91dCBhbnkgaW1wbGljaXQgb3BlcmF0aW9ucy4N
Cj4gPj4+DQo+ID4+PiBJbiB0aGF0IGNhc2UsIGp1c3QgY2FsbCBudW1hX3NldF9kaXN0YW5jZSB0
d2ljZSBmcm9tIG51bWFfc2V0X2Rpc3RhbmNlDQo+ID4+PiBmb3IgYm90aCBmcm9tL3RvIGFuZCB0
by9mcm9tLiBudW1hX3NldF9kaXN0YW5jZSBjb3VsZCByZXR1cm4gZXJyb3IgaXMNCj4gPj4NCj4g
Pj4gSSBhbSBPSyBmb3IgdGhlIGZpcnN0IHNlbnRlbmNlLiBCdXQuLi4NCj4gPj4NCj4gPj4+IHRo
ZSBlbnRyeSB3YXMgYWxyZWFkeSBzZXQgdG8gYSBkaWZmZXJlbnQgdmFsdWUgb3Igc3VjY2VzcyBv
dGhlcndpc2UNCj4gPj4+IChhbHNvIGluIHRoZSBjYXNlIGl0IHdhcyBhbHJlYWR5IHNldCB0byB0
aGUgc2FtZSB2YWx1ZSkuIFRoaXMgd291bGQNCj4gPj4NCj4gPj4gLi4uIEkgcHJlZmVyIG5vdCB0
byBjaGVjayB0aGUgcHJldmlvdXMgdmFsdWUuIFN1YnNlcXVlbnQNCj4gbnVtYV9zZXRfZGlzdGFu
Y2UNCj4gPj4gY2FsbCB3aWxsIG92ZXJyaWRlIHByZXZpb3VzIGNhbGxzLiBLZWVwIG51bWFfc2V0
X2Rpc3RhbmNlIGFzIHNpbXBsZSBhcw0KPiA+PiBpdCBjYW4uIEFuZCB3aGVuIHlvdSBwYXNzIG5l
dyBkYXRhIHRvIG51bWFfc2V0X2Rpc3RhbmNlLCBpdCBkb2Vzbid0DQo+ID4+IGtub3cgd2hldGhl
ciB0aGUgcHJldmlvdXMgZGF0YSB3YXMgY29ycmVjdCBvciB0aGUgbmV3IGRhdGEgaXMgY29ycmVj
dC4NCj4gPj4gT25seSBjYWxsZXIgbWF5IGhhdmUga25vd24uDQo+ID4NCj4gPiBUaGF0IG1pZ2h0
IGJlIE9LIGJ1dCBpZiBub3QgbnVtYV9zZXRfZGlzdGFuY2UgdGhlbiBzb21lYm9keSBlbHNlIG5l
ZWRzDQo+ID4gdG8gY2hlY2sgYWdhaW5zdCBvdmVyd3JpdGluZyBwcmV2aW91cyB2YWx1ZXMuIFRo
YXQgaXMgdG8gYmUgYWJsZSB0byBzcG90DQo+ID4gYmFkIGRldmljZSB0cmVlIGNhc2VzIGxpa2U6
DQo+ID4NCj4gPiAgIDAgMSAyMA0KPiA+ICAgMSAwIDQwDQo+IA0KPiBXaGF0J3Mgd3Jvbmcgd2l0
aCB0aGlzPyBBdCBsZWFzdCB0aGUgQUNQSSBzcGVjIGNhcmVzIHRvIHNwZWNpZmljYWxseQ0KPiBw
ZXJtaXQgdGhpcyBjYXNlOg0KPiANCg0KVGhpcyBpcyBiZWNhdXNlIHNvbWUgbm90ZXMgZGVzY3Jp
cHRpb24gaW4gZGV2aWNlIHRyZWUgTlVNQSBiaW5kaW5nOg0KLSBkaXN0YW5jZS1tYXRyaXgNCiAg
VGhpcyBwcm9wZXJ0eSBkZWZpbmVzIGEgbWF0cml4IHRvIGRlc2NyaWJlIHRoZSByZWxhdGl2ZSBk
aXN0YW5jZXMNCiAgYmV0d2VlbiBhbGwgbnVtYSBub2Rlcy4NCiAgSXQgaXMgcmVwcmVzZW50ZWQg
YXMgYSBsaXN0IG9mIG5vZGUgcGFpcnMgYW5kIHRoZWlyIHJlbGF0aXZlIGRpc3RhbmNlLg0KDQog
IE5vdGU6DQoJMS4gRWFjaCBlbnRyeSByZXByZXNlbnRzIGRpc3RhbmNlIGZyb20gZmlyc3Qgbm9k
ZSB0byBzZWNvbmQgbm9kZS4NCglUaGUgZGlzdGFuY2VzIGFyZSBlcXVhbCBpbiBlaXRoZXIgZGly
ZWN0aW9uLg0KaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL251bWEudHh0DQoNClNvIHdlIHRyZWF0IHRoaXMgY2FzZSBpcyB3cm9uZyBp
biBEVC4gQnV0IGFzIHlvdSBzYWlkIEFDUEkgYWxsb3cgc3VjaA0KY2FzZSwgdGhhdCBtZWFucyBy
ZWFsIG1hY2hpbmVzIGFsbG93IGRpZmZlcmVudCBkaXN0YW5jZXMgZm9yIG9uZSBwYWlyDQpub2Rl
cyBpbiBkaWZmZXJlbnQgZGlyZWN0aW9ucy4NCg0KPiAiRXhjZXB0IGZvciB0aGUgcmVsYXRpdmUg
ZGlzdGFuY2UgZnJvbSBhIFN5c3RlbSBMb2NhbGl0eSB0byBpdHNlbGYsDQo+ICBlYWNoIHJlbGF0
aXZlIGRpc3RhbmNlIGlzIHN0b3JlZCB0d2ljZSBpbiB0aGUgbWF0cml4LiBUaGlzIHByb3ZpZGVz
DQo+ICB0aGUgY2FwYWJpbGl0eSB0byBkZXNjcmliZSB0aGUgc2NlbmFyaW8gd2hlcmUgdGhlIHJl
bGF0aXZlIGRpc3RhbmNlcw0KPiAgZm9yIHRoZSB0d28gZGlyZWN0aW9ucyBiZXR3ZWVuIFN5c3Rl
bSBMb2NhbGl0aWVzIGlzIGRpZmZlcmVudC4iDQo+IA0KPiBKYW4NCg0K

