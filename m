Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3032A416B05
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 06:37:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194887.347249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcx9-00073R-0E; Fri, 24 Sep 2021 04:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194887.347249; Fri, 24 Sep 2021 04:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTcx8-000706-SV; Fri, 24 Sep 2021 04:36:50 +0000
Received: by outflank-mailman (input) for mailman id 194887;
 Fri, 24 Sep 2021 04:36:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OJ83=OO=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTcx7-0006zs-72
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 04:36:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::621])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5770aee-7044-4e82-bf57-dc7579dfddd1;
 Fri, 24 Sep 2021 04:36:47 +0000 (UTC)
Received: from AS9PR06CA0269.eurprd06.prod.outlook.com (2603:10a6:20b:45f::32)
 by PR2PR08MB4681.eurprd08.prod.outlook.com (2603:10a6:101:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 04:36:37 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45f:cafe::a1) by AS9PR06CA0269.outlook.office365.com
 (2603:10a6:20b:45f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 04:36:37 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 04:36:37 +0000
Received: ("Tessian outbound 1fd2edb24cb2:v103");
 Fri, 24 Sep 2021 04:36:36 +0000
Received: from a2a297f5982e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C50575E-169D-440D-8ED5-037014C52036.1; 
 Fri, 24 Sep 2021 04:36:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a2a297f5982e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Sep 2021 04:36:26 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBAPR08MB5622.eurprd08.prod.outlook.com (2603:10a6:10:1af::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 04:36:23 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%9]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 04:36:23 +0000
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
X-Inumbo-ID: f5770aee-7044-4e82-bf57-dc7579dfddd1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVeTKmFk2chsP5nTlMY3FXuEgOnCDrECEp7oEM9EoLA=;
 b=INBqV41BacFudr+LACwxwgQrRYmvZqZUQHsSjjDb7WVuYSsu+7fe8MTvEFn8gXZWNLvyDMjqgjwk7Ewd3Ti/b4bw0lyClFUVjrTUw5dlgVqEUe/3Ozjsgqj756oSEi7lcdbJp7KIXvTmfyH/j6WbbMk1dFSpLeCpzKV8LIYrQaU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0YaAbO4+wLePv7LipsZqiyGWC5zHj40dnARG6uKWiJb72M+QO6XLopW4UOh/rOJl1cboIiAynhY5pO4W/h3KPyo7VAHCxyK06BrkO0nV4BSoCliwEHuMylf9PB4VxcuyDyRKkBbc6dTYhE26Wt/O5FEIbWG2FWc283FFRfZeqmDaobGQRmjRewBFFnftxoqhQey6xWqBHEHkglTPZrNXABRs9/CcZJotpaYf/yVURF0MjF07Zts/8Djb5lDaNnjxedNb7q152iCQYMqo84mWTt+jwCFj3QcucWyM/Jy5Jy7rGkik8XNHqBZHRVj/lS39mYeRiPKetYe/csNf98saQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tVeTKmFk2chsP5nTlMY3FXuEgOnCDrECEp7oEM9EoLA=;
 b=jSCLauedtxenkTU4xL6LdPcLdQgVkPp0RXk6kJpY0Y5AAPjojRbHwi+iUzsR1Hh2/Mhg/1EZKZd67hdX6KChm3Zs9kljWDLWoQ+mOBmjUbbMLldmTP7sDH/wDM9Q8B5j6JD12zoUSkDnwkubgjEOnldMQUQCKiRCA6idCHZ/OUgIjORHeFbm5d2k4RjcxsA8MrBXZFpLMYhfc3WrWQR0yK1YAjTUpixK52kOOojU2++y6M3k4+mStSlm8dpo5PAIffnBW3CEitHo6gDSbL2J4KyjNY1t3ck9UDYRUseFF7PhW0bHcORalWFnu9qYvrqCkhNdvDGJ/WWLaWJ5ZKNuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVeTKmFk2chsP5nTlMY3FXuEgOnCDrECEp7oEM9EoLA=;
 b=INBqV41BacFudr+LACwxwgQrRYmvZqZUQHsSjjDb7WVuYSsu+7fe8MTvEFn8gXZWNLvyDMjqgjwk7Ewd3Ti/b4bw0lyClFUVjrTUw5dlgVqEUe/3Ozjsgqj756oSEi7lcdbJp7KIXvTmfyH/j6WbbMk1dFSpLeCpzKV8LIYrQaU=
From: Wei Chen <Wei.Chen@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: RE: [PATCH 21/37] xen/arm: Keep memory nodes in dtb for NUMA when
 boot from EFI
Thread-Topic: [PATCH 21/37] xen/arm: Keep memory nodes in dtb for NUMA when
 boot from EFI
Thread-Index: AQHXsHMrd58EkQofR0OqZuXsqMtGrKuyZJkAgAA1glA=
Date: Fri, 24 Sep 2021 04:36:23 +0000
Message-ID:
 <DB9PR08MB685714E62F7FAC1E2E137FE59EA49@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-22-wei.chen@arm.com>
 <alpine.DEB.2.21.2109231822090.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109231822090.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 42CA5B9B816F1941868DFDE0F90CA2FC.0
x-checkrecipientchecked: true
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 0a8b42f1-f1b4-48c1-e63c-08d97f14e54c
x-ms-traffictypediagnostic: DBAPR08MB5622:|PR2PR08MB4681:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB4681FC28D450B356DD4459499EA49@PR2PR08MB4681.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BsnWqRxFEKXP7GWTUWS+4cP6bPrzZj2LDWs522yrjoEJwnFvmWmLEGcYAP3WCzi+k7H8F8sEW6QJsTYZfMxJEJmVosug1UcLGtFBx9cQad+qrCmBBu+F2wBC5I70svzroBuILdGsDOCquBE6OIQ3dhaE5oNAEGRgqdONi2RVZUGfRw6TP46gZTIxTZ7gLokrBBxKHv5d9B4AxcBcT1+SubFLNUFFfGTnnLolLvY10Zf6yYi48Lx6LZGLgRdxpLuFEKRyejvEwkYv/nzWzNPLkeMQnUmH7+em+31nmlFYtQFv0EugLEk0jFluLtbY9UCd7uvKuH63kXMoDZorw13yw//+Blqr2urxn04EreJMUn+qdAv9gs7iwB+fFjsxBkmJpFFTHTIx9BEuLFzs5ShE1c8LRljAzpz9QTh5an6+hUvr/v2ePnxRpETvsx2EJhdy8y3lkzwMsm4aZb54ttVeUcraj7Hhpzx/32l78UaASy0IcRrXnLRXO7XyL49PuNIbKwEczj0zA+gdrNGS3PzKknOZS7C42BsGdmaoe3rgu/As90UyMCkXSs6nfSLW16zBDhjVvypEdIrmHMKqmTwnKGKivXFq8BM4j77kODr/Qc2hjgGCluCpsH4ecC4pK8I4hlpBdQpJTuxsXQxkOoQwTQrMsqeYJoje3tkhSjRRXH/1h7oyQQwLoFl87Utyt3heD4eMHRCz0JTTUqHOqbPXEw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(8936002)(26005)(53546011)(7696005)(55016002)(38070700005)(5660300002)(66446008)(76116006)(64756008)(66946007)(66476007)(66556008)(186003)(52536014)(8676002)(83380400001)(9686003)(33656002)(122000001)(6916009)(508600001)(71200400001)(38100700002)(86362001)(4326008)(54906003)(2906002)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5622
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	02e277ab-fda3-418c-f7fc-08d97f14dd17
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1axZoOUNCREROq/nmQ6vUlF8+PXv0gJJR1kR3eGCcV6wHhTX5oCDE8psIjkeu4Qw6sLNUNJ4WuPwswQtphee65xGxPSGRe5mpcPUHFSfnGp75CjF+8Y1iHTyD9lzHmzVr680njitNqfCd04km9FlZZU+DlOuvoae5YMt+frMkNwlTAqF7lghcf5Ixd6eDLc4h4843VIgwxbMjTaUKqle+FD50E3/3mHjuxUcneCmx8uGwlYZirngPWZdSp3KauBHZEM3NDjUODtHWXV0t1ihXUwC9bz5jtG1o1ly6KQlYKHK21603tLuT5mNDKl9Hu3M3JPQlh5KRb5Fghyq9pNvyzEu4vl7ZaPqChdMqII2fzt/dbTCVGHwywQ9VZeUmwiIDyE5wgjLnTgQHmyKp9mvoJ2h7GPTupdc9tpa9WOOHIb/lTOrLy4N8I6HAQMDwCKpWUywZzJuZoE1yKuketIfT9ORq8o16SVWRZtEiU6BmwbZlgkMd4BE91oPznxvXI80dMsXkQTILgB9+kZ/G98V94lv8Tsdrf6NRvXhdXIG7kXBTGQYDDO6jpXQl5T7dxbJfzpMyPjmUkKIpe49G5dUn5QA116crP31BBbd/QRq+JIuCABlYxzJnSz64+7UMf3Q+vuZskufIXDW5KpxgS6/+iMHyNWr0MtIYURcuUKJNF+aXtwH2O/C+VRbNbxO1nM94a7EcWW+BmbgRwHTo4ssfg==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(8676002)(83380400001)(336012)(7696005)(5660300002)(316002)(70206006)(70586007)(508600001)(53546011)(26005)(54906003)(33656002)(36860700001)(2906002)(9686003)(6862004)(47076005)(52536014)(55016002)(186003)(8936002)(356005)(81166007)(86362001)(4326008)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 04:36:37.1349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a8b42f1-f1b4-48c1-e63c-08d97f14e54c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4681

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyMcTqOdTCMjTI1SA5OjIzDQo+
IFRvOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgc3N0YWJlbGxpbmlAa2VybmVsLm9yZzsganVsaWVuQHhlbi5vcmc7DQo+
IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAyMS8zN10geGVuL2FybTogS2VlcCBtZW1vcnkgbm9kZXMgaW4gZHRiIGZvciBO
VU1BIHdoZW4NCj4gYm9vdCBmcm9tIEVGSQ0KPiANCj4gT24gVGh1LCAyMyBTZXAgMjAyMSwgV2Vp
IENoZW4gd3JvdGU6DQo+ID4gRUZJIGNhbiBnZXQgbWVtb3J5IG1hcCBmcm9tIEVGSSBzeXN0ZW0g
dGFibGUuIEJ1dCBFRkkgc3lzdGVtDQo+ID4gdGFibGUgZG9lc24ndCBjb250YWluIG1lbW9yeSBO
VU1BIGluZm9ybWF0aW9uLCBFRkkgZGVwZW5kcyBvbg0KPiA+IEFDUEkgU1JBVCBvciBkZXZpY2Ug
dHJlZSBtZW1vcnkgbm9kZSB0byBwYXJzZSBtZW1vcnkgYmxvY2tzJw0KPiA+IE5VTUEgbWFwcGlu
Zy4NCj4gPg0KPiA+IEJ1dCBpbiBjdXJyZW50IGNvZGUsIHdoZW4gWGVuIGlzIGJvb3RpbmcgZnJv
bSBFRkksIGl0IHdpbGwNCj4gPiBkZWxldGUgYWxsIG1lbW9yeSBub2RlcyBpbiBkZXZpY2UgdHJl
ZS4gU28gaW4gVUVGSSArIERUQg0KPiA+IGJvb3QsIHdlIGRvbid0IGhhdmUgbnVtYS1ub2RlLWlk
IGZvciBtZW1vcnkgYmxvY2tzIGFueSBtb3JlLg0KPiA+DQo+ID4gU28gaW4gdGhpcyBwYXRjaCwg
d2Ugd2lsbCBrZWVwIG1lbW9yeSBub2RlcyBpbiBkZXZpY2UgdHJlZSBmb3INCj4gPiBOVU1BIGNv
ZGUgdG8gcGFyc2UgbWVtb3J5IG51bWEtbm9kZS1pZCBsYXRlci4NCj4gPg0KPiA+IEFzIGEgc2lk
ZSBlZmZlY3QsIGlmIHdlIHN0aWxsIHBhcnNlIGJvb3QgbWVtb3J5IGluZm9ybWF0aW9uIGluDQo+
ID4gZWFybHlfc2Nhbl9ub2RlLCBib290bWVtLmluZm8gd2lsbCBjYWxjdWxhdGUgbWVtb3J5IHJh
bmdlcyBpbg0KPiA+IG1lbW9yeSBub2RlcyB0d2ljZS4gU28gd2UgaGF2ZSB0byBwcmV2ZW50IGVh
cmx5X3NjYW5fbm9kZSB0bw0KPiA+IHBhcnNlIG1lbW9yeSBub2RlcyBpbiBFRkkgYm9vdC4NCj4g
Pg0KPiA+IEFzIEVGSSBBUElzIG9ubHkgY2FuIGJlIHVzZWQgaW4gQXJtNjQsIHNvIHdlIGludHJv
ZHVjZWQgYSBzdHViDQo+ID4gQVBJIGZvciBub24tRUZJIHN1cHBvcnRlZCBBcm0zMi4gVGhpcyB3
aWxsIHByZXZlbnQNCj4gDQo+IFRoaXMgbGFzdCBzZW50ZW5jZSBpcyBpbmNvbXBsZXRlLg0KPiAN
Cj4gQnV0IGFzaWRlIGZyb20gdGhhdCwgdGhpcyBwYXRjaCBsb29rcyBnb29kIHRvIG1lLg0KPiAN
Cg0KQWgsIGl0IHRydW5jYXRlZCBieSBhY2NpZGVudC4gSSB3aWxsIGZpeCBpdC4NCg0KPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4g
PiAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyAgICAgIHwgIDggKysrKysrKy0NCj4gPiAgeGVuL2Fy
Y2gvYXJtL2VmaS9lZmktYm9vdC5oIHwgMjUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+
ICB4ZW4vaW5jbHVkZS94ZW4vZWZpLmggICAgICAgfCAgNyArKysrKysrDQo+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290ZmR0LmMN
Cj4gPiBpbmRleCBhZmFhMGUyNDliLi42YmM1YTQ2NWVjIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9h
cmNoL2FybS9ib290ZmR0LmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jDQo+ID4g
QEAgLTExLDYgKzExLDcgQEANCj4gPiAgI2luY2x1ZGUgPHhlbi9saWIuaD4NCj4gPiAgI2luY2x1
ZGUgPHhlbi9rZXJuZWwuaD4NCj4gPiAgI2luY2x1ZGUgPHhlbi9pbml0Lmg+DQo+ID4gKyNpbmNs
dWRlIDx4ZW4vZWZpLmg+DQo+ID4gICNpbmNsdWRlIDx4ZW4vZGV2aWNlX3RyZWUuaD4NCj4gPiAg
I2luY2x1ZGUgPHhlbi9saWJmZHQvbGliZmR0Lmg+DQo+ID4gICNpbmNsdWRlIDx4ZW4vc29ydC5o
Pg0KPiA+IEBAIC0zNzAsNyArMzcxLDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IGVhcmx5X3NjYW5f
bm9kZShjb25zdCB2b2lkICpmZHQsDQo+ID4gIHsNCj4gPiAgICAgIGludCByYyA9IDA7DQo+ID4N
Cj4gPiAtICAgIGlmICggZGV2aWNlX3RyZWVfbm9kZV9tYXRjaGVzKGZkdCwgbm9kZSwgIm1lbW9y
eSIpICkNCj4gPiArICAgIC8qDQo+ID4gKyAgICAgKiBJZiBYZW4gaGFzIGJlZW4gYm9vdGVkIHZp
YSBVRUZJLCB0aGUgbWVtb3J5IGJhbmtzIHdpbGwgYWxyZWFkeQ0KPiA+ICsgICAgICogYmUgcG9w
dWxhdGVkLiBTbyB3ZSBzaG91bGQgc2tpcCB0aGUgcGFyc2luZy4NCj4gPiArICAgICAqLw0KPiA+
ICsgICAgaWYgKCAhZWZpX2VuYWJsZWQoRUZJX0JPT1QpICYmDQo+ID4gKyAgICAgICAgIGRldmlj
ZV90cmVlX25vZGVfbWF0Y2hlcyhmZHQsIG5vZGUsICJtZW1vcnkiKSkNCj4gPiAgICAgICAgICBy
YyA9IHByb2Nlc3NfbWVtb3J5X25vZGUoZmR0LCBub2RlLCBuYW1lLCBkZXB0aCwNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRkcmVzc19jZWxscywgc2l6ZV9jZWxscywN
Cj4gJmJvb3RpbmZvLm1lbSk7DQo+ID4gICAgICBlbHNlIGlmICggZGVwdGggPT0gMSAmJiAhZHRf
bm9kZV9jbXAobmFtZSwgInJlc2VydmVkLW1lbW9yeSIpICkNCj4gPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oIGIveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oDQo+
ID4gaW5kZXggY2Y5YzM3MTUzZi4uZDBhOTk4N2ZhNCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJj
aC9hcm0vZWZpL2VmaS1ib290LmgNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290
LmgNCj4gPiBAQCAtMTk3LDMzICsxOTcsOCBAQCBFRklfU1RBVFVTIF9faW5pdA0KPiBmZHRfYWRk
X3VlZmlfbm9kZXMoRUZJX1NZU1RFTV9UQUJMRSAqc3lzX3RhYmxlLA0KPiA+ICAgICAgaW50IHN0
YXR1czsNCj4gPiAgICAgIHUzMiBmZHRfdmFsMzI7DQo+ID4gICAgICB1NjQgZmR0X3ZhbDY0Ow0K
PiA+IC0gICAgaW50IHByZXY7DQo+ID4gICAgICBpbnQgbnVtX3JzdjsNCj4gPg0KPiA+IC0gICAg
LyoNCj4gPiAtICAgICAqIERlbGV0ZSBhbnkgbWVtb3J5IG5vZGVzIHByZXNlbnQuICBUaGUgRUZJ
IG1lbW9yeSBtYXAgaXMgdGhlIG9ubHkNCj4gPiAtICAgICAqIG1lbW9yeSBkZXNjcmlwdGlvbiBw
cm92aWRlZCB0byBYZW4uDQo+ID4gLSAgICAgKi8NCj4gPiAtICAgIHByZXYgPSAwOw0KPiA+IC0g
ICAgZm9yICg7OykNCj4gPiAtICAgIHsNCj4gPiAtICAgICAgICBjb25zdCBjaGFyICp0eXBlOw0K
PiA+IC0gICAgICAgIGludCBsZW47DQo+ID4gLQ0KPiA+IC0gICAgICAgIG5vZGUgPSBmZHRfbmV4
dF9ub2RlKGZkdCwgcHJldiwgTlVMTCk7DQo+ID4gLSAgICAgICAgaWYgKCBub2RlIDwgMCApDQo+
ID4gLSAgICAgICAgICAgIGJyZWFrOw0KPiA+IC0NCj4gPiAtICAgICAgICB0eXBlID0gZmR0X2dl
dHByb3AoZmR0LCBub2RlLCAiZGV2aWNlX3R5cGUiLCAmbGVuKTsNCj4gPiAtICAgICAgICBpZiAo
IHR5cGUgJiYgc3RybmNtcCh0eXBlLCAibWVtb3J5IiwgbGVuKSA9PSAwICkNCj4gPiAtICAgICAg
ICB7DQo+ID4gLSAgICAgICAgICAgIGZkdF9kZWxfbm9kZShmZHQsIG5vZGUpOw0KPiA+IC0gICAg
ICAgICAgICBjb250aW51ZTsNCj4gPiAtICAgICAgICB9DQo+ID4gLQ0KPiA+IC0gICAgICAgIHBy
ZXYgPSBub2RlOw0KPiA+IC0gICAgfQ0KPiA+IC0NCj4gPiAgICAgLyoNCj4gPiAgICAgICogRGVs
ZXRlIGFsbCBtZW1vcnkgcmVzZXJ2ZSBtYXAgZW50cmllcy4gV2hlbiBib290aW5nIHZpYSBVRUZJ
LA0KPiA+ICAgICAgKiBrZXJuZWwgd2lsbCB1c2UgdGhlIFVFRkkgbWVtb3J5IG1hcCB0byBmaW5k
IHJlc2VydmVkIHJlZ2lvbnMuDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9lZmku
aCBiL3hlbi9pbmNsdWRlL3hlbi9lZmkuaA0KPiA+IGluZGV4IDY2MWE0ODI4NmEuLmI1MmE0Njc4
ZTkgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2VmaS5oDQo+ID4gKysrIGIveGVu
L2luY2x1ZGUveGVuL2VmaS5oDQo+ID4gQEAgLTQ3LDYgKzQ3LDEzIEBAIGludCBlZmlfcnVudGlt
ZV9jYWxsKHN0cnVjdCB4ZW5wZl9lZmlfcnVudGltZV9jYWxsICopOw0KPiA+ICBpbnQgZWZpX2Nv
bXBhdF9nZXRfaW5mbyh1aW50MzJfdCBpZHgsIHVuaW9uIGNvbXBhdF9wZl9lZmlfaW5mbyAqKTsN
Cj4gPiAgaW50IGVmaV9jb21wYXRfcnVudGltZV9jYWxsKHN0cnVjdCBjb21wYXRfcGZfZWZpX3J1
bnRpbWVfY2FsbCAqKTsNCj4gPg0KPiA+ICsjZWxzZQ0KPiA+ICsNCj4gPiArc3RhdGljIGlubGlu
ZSBib29sIGVmaV9lbmFibGVkKHVuc2lnbmVkIGludCBmZWF0dXJlKQ0KPiA+ICt7DQo+ID4gKyAg
ICByZXR1cm4gZmFsc2U7DQo+ID4gK30NCj4gPiArDQo+ID4gICNlbmRpZiAvKiBDT05GSUdfRUZJ
Ki8NCj4gPg0KPiA+ICAjZW5kaWYgLyogIV9fQVNTRU1CTFlfXyAqLw0KPiA+IC0tDQo+ID4gMi4y
NS4xDQo+ID4NCg==

