Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C2793D5E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 15:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596611.930549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdsCF-0004Cu-MI; Wed, 06 Sep 2023 13:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596611.930549; Wed, 06 Sep 2023 13:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdsCF-0004B2-In; Wed, 06 Sep 2023 13:03:51 +0000
Received: by outflank-mailman (input) for mailman id 596611;
 Wed, 06 Sep 2023 13:03:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nrw9=EW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qdsCE-0004As-5a
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 13:03:50 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0606.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0e3687e-4cb5-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 15:03:47 +0200 (CEST)
Received: from AM6P191CA0081.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::22)
 by DU0PR08MB9226.eurprd08.prod.outlook.com (2603:10a6:10:419::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 13:03:45 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::31) by AM6P191CA0081.outlook.office365.com
 (2603:10a6:209:8a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 13:03:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.26 via Frontend Transport; Wed, 6 Sep 2023 13:03:44 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Wed, 06 Sep 2023 13:03:43 +0000
Received: from d0f614c2f8ea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0E88C96E-561D-4746-A9CD-B63BC678A653.1; 
 Wed, 06 Sep 2023 13:03:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0f614c2f8ea.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Sep 2023 13:03:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6161.eurprd08.prod.outlook.com (2603:10a6:20b:280::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 13:03:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 13:03:32 +0000
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
X-Inumbo-ID: d0e3687e-4cb5-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDDKiPi2SJZz1lihIr4tQG8oTuJ3FdEoTC23ddjXaNk=;
 b=1YK3mLPSXTiGhj2xeficd5ytJhHQgYs8kDgDIx3QHtvnCEZXyYwGe/w5jb2OmHsZyqEg50IPi9GNjtDfW2/dz7oQOyiujf6C4zTT01GhVBCQybFciAZGAhGmbSGvaTbp/JM6ho6AH3jx6CzYqzGFQ1gbpS1gjOtz+PM00RvlsHE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ab2117cfaeef6cf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaE6ICVqDf6UwPq3LjbNdi6b2eLvBNKn662T13y+pNbZHkJTbypsRJPTrVcinHUD1vzzSHDDSIuoourR36kGRB3zIhQk/tAxquN1Y3jyrNW3txw85UGRlXJW5shSMF1dpkAXru+GT+FbFBcRC3paEPLcbSaXQSYH4OShRZrvgCujV5tHJCfOzocmM3Hm/466N7AmrkNzsqm/6PjkwyXTmW4Kh+wXZMtRZt3degp5/ANft3DDJr5RNK1aNLy5Bi2Dd/+Ps4ywqTB2iGXFzbUJIRUS/rw8LsfggmUFgRjKhGDK9kZqNr796A0w8xzXyA/NKv+ENDeUgIrMiKL+JmCirw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDDKiPi2SJZz1lihIr4tQG8oTuJ3FdEoTC23ddjXaNk=;
 b=mjejVZBK2rPibK+FD2eDiMTflM3yiNubOfJY1JQ73v71GumE6BsURz/zXUERWcPVF9hm4ZVtiI7UyPiLvUG+Y/eGGnQsWNvqr5TGfefv9VzOAowmRgVeWTvAB7VAergafSDGX+ojIqfhEPjbYzXDn4+ICSPnd4t8xGMr69HY/9pTos4ri6LOnRF+q+QSC2PqzcS4q35RLX7WLJYaIoVdR4qg+U929HoT6WQF8QXyduCmX1PeaGHfxc4Wwo7v1TLZt9PTaa9zQA1U5oYmfJfK/KWmC0CqyYcpyJax0eKVpvM4oQUSWjYXXvi2LshjYuD3b7NOUHTEMXs8Y72SiXU1ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDDKiPi2SJZz1lihIr4tQG8oTuJ3FdEoTC23ddjXaNk=;
 b=1YK3mLPSXTiGhj2xeficd5ytJhHQgYs8kDgDIx3QHtvnCEZXyYwGe/w5jb2OmHsZyqEg50IPi9GNjtDfW2/dz7oQOyiujf6C4zTT01GhVBCQybFciAZGAhGmbSGvaTbp/JM6ho6AH3jx6CzYqzGFQ1gbpS1gjOtz+PM00RvlsHE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksii <oleksii.kurochko@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>, Connor Davis
	<connojdavis@gmail.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
Thread-Topic: [PATCH v4 1/2] xen: asm-generic support
Thread-Index: AQHZ3O2/QR3JeW3CfU20DuxQPAN2rLAKsJgAgAMCtQCAABfdgA==
Date: Wed, 6 Sep 2023 13:03:32 +0000
Message-ID: <E2C450BC-F080-41DB-B025-9DD1949C835A@arm.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
 <3DCD5649-C172-4400-AA75-A28F5C0A106D@arm.com>
 <b90c2e4dc9ec84ef6487f1dd980d7858d7903e89.camel@gmail.com>
In-Reply-To: <b90c2e4dc9ec84ef6487f1dd980d7858d7903e89.camel@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM9PR08MB6161:EE_|AM7EUR03FT063:EE_|DU0PR08MB9226:EE_
X-MS-Office365-Filtering-Correlation-Id: 282b9681-4d6b-4e51-b8c9-08dbaed9b395
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Wer60jYhAIUB2JSYPAjTMrVK7E7pLGDgnmVLHvTi8wtIRh+h75WZ/BUwJn96WfdqEwtrlDH7d483n1Q4rGalT3cZgm0+fnpq9x3FpzKU6JbRf8ldocNs0BCa2lO2JI1EW32Sl3AQD38ki8P1KSESLc0Ph5sdtVQU1LrI729IWSKU33r0S8N8IpI0XFsCxPRUp5lfRmYVtwxxXViQcc8bvtay32CilO26sMbr0DEnBbLwh7QcFJCNBD7kIXjtZYkm+Dqzw3JgkxWsKJupy1F7hiwjkelS+LoVPvDBtVGN9ghIr3jw/bmizZ8ZYvlOqRGvZRlerwzpMB3gxhg4jWzYELPGdr+BPWr2THmx9P/rnk5ZRwtHB+UN1KSSswDpj4zirf4h3b9ljsAfBLktp38f2NhSucw24jT+XvG83XcWh1t7it0nM2SIsmjW/r+aBlE1f7Q5vTfE3dDHZSsiBOYYggcXF8Ql37V1epJx5PmnKlQI6JZ14mzLNcfyY5426xvhIblFDyzg3CYFFf92Ao4+c3O9m3pYyYfYc1Fkn+jBv0+WCY8cgyloAG/VVwWEi17m/HgQkVtCua1pVgluZPL8OB8y7Ai3l4EqIQ3YqRA6TXfkAGSdpABX2ASgU24ADCG63nmc9dOGH6Unuk3+OnxkYhxCHNPn41At6VpsXYKpQEc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(6486002)(6512007)(53546011)(71200400001)(478600001)(2616005)(2906002)(7416002)(41300700001)(66556008)(64756008)(316002)(54906003)(66446008)(6916009)(66476007)(5660300002)(91956017)(8676002)(66946007)(8936002)(4326008)(76116006)(36756003)(38100700002)(33656002)(86362001)(38070700005)(122000001)(41533002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3031BFB4F6B16143A9851B9BC4C348A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6161
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	151ecfba-59e5-4751-9fdf-08dbaed9ac28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HDA7icMdtCakBASsS9X/udfPgVzJGFKGK/Rtt1PIk7iUVTXH45/QAKiebHeKwnkBm8Q6jdJNkk0U5vAQnM0TfCGXlEOLqUvzDQCLRfSAORiX6Rjx3XZ5lW5ZFOHsBf+IIhdENVLA3sgFxo9K5N+UvDBMQfSOntwMqIPjxOtnRNUql938lMGa7LL0Sd+Mf5ERGTIQjU++mlvZFixGyHGBE93beNMkEkqCs/j15nk/z5LJToh4agSiKNQGi9kArD1ZY6ilVlLooF35GoiX47T9myF00AUVbFFNgwcJSkwgseH3uYOikuJFiud1xz/qpYSA5XBZI167Y0RAACetN7pNa5MGIRp3hYbfktXtZVFDyNNz5AGPI+XjNH6a37k09jx1FdouIoYS+ZGhgOAMe9E6jc4RKYAdDNFFcj5cPgDTmBPRrBoL4mqYd5b0hTKSsLO6qpehUSFvsmagiyycuT21+lX4cIerRRR9NJBgeBKBlCyho9YiF5/fWHqG2o17mtMFtwR/GfsnRm9/BmmodlwUK0jVdk1DpYrBtc0NbWRvf2T0NcCkui7En9jrcWK6n0GlapssHC3m1xApfQv8Fa3ikYg14ZGFafqJwuN68EPCLDXbORjdm39XNhFo9Re2NPv8//hzX09L6aYxUYrQMuOQzHjzxOy4hHB62aBbVnYZlaxf/i5mtfXB3C/3xm63poNZ43HEIPKnqx/yRfAYaibTLG/KNo/qaVYzSZmPWKs5dIxe0/PPzrZHWsY0jB7hGE0F5CeM5py6OH4pdAROjmFISA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(346002)(136003)(186009)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(36756003)(33656002)(316002)(2906002)(41300700001)(40460700003)(82740400003)(40480700001)(86362001)(356005)(81166007)(5660300002)(36860700001)(47076005)(4326008)(8936002)(8676002)(6862004)(2616005)(107886003)(26005)(6512007)(53546011)(336012)(6506007)(6486002)(478600001)(54906003)(70586007)(70206006)(41533002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 13:03:44.6189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 282b9681-4d6b-4e51-b8c9-08dbaed9b395
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9226

SGkgT2xla3NpaSwNCg0KPiBPbiA2IFNlcCAyMDIzLCBhdCAxMzozNywgT2xla3NpaSA8b2xla3Np
aS5rdXJvY2hrb0BnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gSGVsbG8gQmVydHJhbmQNCj4gDQo+
IE9uIE1vbiwgMjAyMy0wOS0wNCBhdCAxMzozOSArMDAwMCwgQmVydHJhbmQgTWFycXVpcyB3cm90
ZToNCj4+PiBkaWZmIC0tZ2l0IGEveGVuL3NjcmlwdHMvTWFrZWZpbGUuYXNtLWdlbmVyaWMNCj4+
PiBiL3hlbi9zY3JpcHRzL01ha2VmaWxlLmFzbS1nZW5lcmljDQo+Pj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwLi4wYWFjM2Y1MGI4DQo+Pj4gLS0tIC9kZXYvbnVs
bA0KPj4+ICsrKyBiL3hlbi9zY3JpcHRzL01ha2VmaWxlLmFzbS1nZW5lcmljDQo+Pj4gQEAgLTAs
MCArMSwyMyBAQA0KPj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+Pj4g
KyMgaW5jbHVkZS9hc20tZ2VuZXJpYyBjb250YWlucyBhIGxvdCBvZiBmaWxlcyB0aGF0IGFyZSB1
c2VkDQo+Pj4gKyMgdmVyYmF0aW0gYnkgc2V2ZXJhbCBhcmNoaXRlY3R1cmVzLg0KPj4+ICsjDQo+
Pj4gKyMgVGhpcyBNYWtlZmlsZSByZWFkcyB0aGUgZmlsZSBhcmNoLyQoU1JDQVJDSCkvaW5jbHVk
ZS9hc20vS2J1aWxkDQo+Pj4gKyMgYW5kIGZvciBlYWNoIGZpbGUgbGlzdGVkIGluIHRoaXMgZmls
ZSB3aXRoIGdlbmVyaWMteSBjcmVhdGVzDQo+Pj4gKyMgYSBzbWFsbCB3cmFwcGVyIGZpbGUgaW4g
JChvYmopDQo+Pj4gKGFyY2gvJChTUkNBUkNIKS9pbmNsdWRlL2dlbmVyYXRlZC9hc20pDQo+Pj4g
Kw0KPj4+ICtrYnVpbGQtZmlsZSA6PSAkKHNyY3RyZWUpL2FyY2gvJChTUkNBUkNIKS9pbmNsdWRl
L2FzbS9LYnVpbGQNCj4+PiAraW5jbHVkZSAkKGtidWlsZC1maWxlKQ0KPj4+ICsNCj4+PiAraW5j
bHVkZSBzY3JpcHRzL0tidWlsZC5pbmNsdWRlDQo+Pj4gKw0KPj4+ICsjIENyZWF0ZSBvdXRwdXQg
ZGlyZWN0b3J5IGlmIG5vdCBhbHJlYWR5IHByZXNlbnQNCj4+PiArX2R1bW15IDo9ICQoc2hlbGwg
WyAtZCAkKG9iaikgXSB8fCBta2RpciAtcCAkKG9iaikpDQo+Pj4gKw0KPj4+ICtxdWlldF9jbWRf
d3JhcCA9IFdSQVAgICAgJEANCj4+PiArY21kX3dyYXAgPSBlY2hvICJcI2luY2x1ZGUgPGFzbS1n
ZW5lcmljLyQqLmg+IiA+JEANCj4+PiArDQo+Pj4gK2FsbDogJChwYXRzdWJzdCAlLCAkKG9iaikv
JSwgJChnZW5lcmljLXkpKQ0KPj4+ICsNCj4+PiArJChvYmopLyUuaDoNCj4+PiArICQoY2FsbCBj
bWQsd3JhcCkNCj4+IA0KPj4gSW4gZmFjdCBpIHRoaW5rIHlvdXIgZmlsZXMgYXJlIG5vdCBnZW5l
cmF0ZWQgaW4gdGhlIHNyY3RyZWUgc28gdGhpcw0KPj4gd2lsbCBicmVhayBpZiB5b3UgdXNlIG91
dCBvZiB0cmVlIGNvbXBpbGF0aW9uLg0KPiBJIGNoZWNrZWQgdGhhdCBhbmQgaW4gYm90aCBjYXNl
cyBpdCBnZW5lcmF0ZWQgaW4gY29ycmVjdCBwbGFjZS4NCj4gDQo+IEZpcnN0IGNhc2U6DQo+ICQg
Q09OVEFJTkVSX05PX1BVTEw9MSBDT05UQUlORVI9cmlzY3Y2NA0KPiAuL2F1dG9tYXRpb24vc2Ny
aXB0cy9jb250YWluZXJpemUgbWFrZSBYRU5fVEFSR0VUX0FSQ0g9cmlzY3Y2NCAtQyB4ZW4NCj4g
YnVpbGQNCj4gDQo+ICQgbHMgLWxhIHhlbi9hcmNoL3Jpc2N2L2luY2x1ZGUvZ2VuZXJhdGVkL2Fz
bS92bV9ldmVudC5oIA0KPiAtcnctci0tci0tLiAxIG9rIG9rIDM0INCy0LXRgCAgNiAxNDozMg0K
PiB4ZW4vYXJjaC9yaXNjdi9pbmNsdWRlL2dlbmVyYXRlZC9hc20vdm1fZXZlbnQuaA0KPiANCj4g
U2Vjb25kIGNhc2U6ICggb3V0LW9mLXRyZWUgKQ0KPiAkIENPTlRBSU5FUl9OT19QVUxMPTEgQ09O
VEFJTkVSPXJpc2N2NjQNCj4gLi9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplIG1ha2Ug
Tz14ZW5fYnVpbGQNCj4gWEVOX1RBUkdFVF9BUkNIPXJpc2N2NjQgLUMgeGVuIGJ1aWxkIFY9MQ0K
PiANCj4gJCBscyAtbGEgeGVuL3hlbl9idWlsZC9hcmNoL3Jpc2N2L2luY2x1ZGUvZ2VuZXJhdGVk
L2FzbS92bV9ldmVudC5oIA0KPiAtcnctci0tci0tLiAxIG9rIG9rIDM0INCy0LXRgCAgNiAxNDoz
NA0KPiB4ZW4veGVuX2J1aWxkL2FyY2gvcmlzY3YvaW5jbHVkZS9nZW5lcmF0ZWQvYXNtL3ZtX2V2
ZW50LmgNCj4gDQo+IENvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSBpZiB0aGVyZSdzIHNvbWl0aGlu
ZyBJIG1pZ2h0IGhhdmUgb3Zlcmxvb2tlZD8NCg0KTm8gSSBkbyBub3QgdGhpbmsgeW91IGRpZC4N
Cg0KU28gb2JqIGlzIGVtcHR5IEkgd291bGQgZ3Vlc3MuDQpBbnl3YXkgeW91IGp1c3QgbmVlZCB0
byBtYWtlIHN1cmUgdGhhdCBDRkxBR1MgaXMgY29oZXJlbnQgd2l0aCB3aGF0IHlvdSBnZW5lcmF0
ZS4NClNvIGlmIHlvdSBnZW5lcmF0ZSBpbiAkKG9iaikgeW91IG5lZWQgdG8gbWFrZSBzdXJlIHlv
dSB1c2UgdGhlIHNhbWUgaW4gQ0ZMQUdTIGkgd291bGQgc2F5Lg0KDQpAYW50aG9ueTogYW55IGFk
dmljZSBoZXJlID8NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQoNCg0KPiANCj4gfiBPbGVrc2lpDQo+
IA0KPiANCj4gDQoNCg==

