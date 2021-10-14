Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FAF42DFF1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 19:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209524.366011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb4ET-0006eC-58; Thu, 14 Oct 2021 17:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209524.366011; Thu, 14 Oct 2021 17:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb4ET-0006bE-1Y; Thu, 14 Oct 2021 17:09:29 +0000
Received: by outflank-mailman (input) for mailman id 209524;
 Thu, 14 Oct 2021 17:09:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCUr=PC=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mb4EQ-0006b8-RO
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 17:09:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::618])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47b437a1-8a99-42f4-a886-2ecd74e4c965;
 Thu, 14 Oct 2021 17:09:24 +0000 (UTC)
Received: from DU2PR04CA0257.eurprd04.prod.outlook.com (2603:10a6:10:28e::22)
 by PR2PR08MB4668.eurprd08.prod.outlook.com (2603:10a6:101:1e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 17:09:21 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28e:cafe::7c) by DU2PR04CA0257.outlook.office365.com
 (2603:10a6:10:28e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Thu, 14 Oct 2021 17:09:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 17:09:21 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Thu, 14 Oct 2021 17:09:21 +0000
Received: from 1861f38ef180.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D166E6F2-03F4-481B-822F-9EC77E4B953D.1; 
 Thu, 14 Oct 2021 17:09:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1861f38ef180.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Oct 2021 17:09:15 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DBBPR08MB5964.eurprd08.prod.outlook.com (2603:10a6:10:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Thu, 14 Oct
 2021 17:09:13 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.030; Thu, 14 Oct 2021
 17:09:13 +0000
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
X-Inumbo-ID: 47b437a1-8a99-42f4-a886-2ecd74e4c965
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmhQBTVvUuyxXV7WXVw/cvM6vkj3esMFCHh/mnXRJis=;
 b=jKzO4aCvyi+4EisriUD3NOIeNDjvvyohNL5HppUjg6qz+ofXsqa3RZeeCOmFBJgwEacpOjzzedB10vfYHuR85YbaYylxguP97DBlIqIBjcFXfL3W7i4pVHr8NBH53cxtA1L5fWrVwMYp2SY3ADrQUXOIN9orOmx5mU6Hsow5K3s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fea2fa26f0415de6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PzEJYANeVw391c3efRAmOo1eTaq4WWXTh2hQQikgF9GWEtSPLMo4z78K4jSf3c8lMocd11bXghDsdrEoh0FPRn+0X5pT6WNmSX2G4QF8+8tThuDpNs3A9whP/n416ND3Nx+jVwfN1WyDS/3hvqCpworCmDdYWU47SbwipkrIVgLSvEe5SJ9ky7CzwBAJC3lKu20l5Af4fOElFjAMh7212ASQg9LgxtajgA55xLx78VLOJDcCa9NhBCMVWCSrMi9f2HpdgadsC05L6h5LLeElV6T/MmSPWTvKe56xD5wfGxcaO7UGNVna3Ef0qPSmIAnipQL9mvCD5qxLgnMi2MJwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmhQBTVvUuyxXV7WXVw/cvM6vkj3esMFCHh/mnXRJis=;
 b=dP3BGXSxmuzXLSHTJecwjh0ZIvmMJFMi1/eDxfhYstFTDjY+ojYd2kidFv7Bn+DQv6DXf8T7nZeD4K+2ut6B1+tOhNfFoUB2YUj13gJ8DY6SQs6hAmf/RJC3MokR9gJ1tu6KC8QKG5LlKI9i+Gd0oRqPZjwlcLJlqOKfDB74LAZk7L5qGMc1T4TmqZX2TusDhdxpHUNj58LhNdE6yaTPfcz8RNVH8MK/qpD6zfToHVWp85sQKHaabrCNNoNutbhu9JLVD6RyrSloxhmvaXVfPATIUVxixwbR8Qgph5uyWpOwPah9lc+zx/3p/sJTNoFHdhSuqhvmZRa/KNNQDqcV6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmhQBTVvUuyxXV7WXVw/cvM6vkj3esMFCHh/mnXRJis=;
 b=jKzO4aCvyi+4EisriUD3NOIeNDjvvyohNL5HppUjg6qz+ofXsqa3RZeeCOmFBJgwEacpOjzzedB10vfYHuR85YbaYylxguP97DBlIqIBjcFXfL3W7i4pVHr8NBH53cxtA1L5fWrVwMYp2SY3ADrQUXOIN9orOmx5mU6Hsow5K3s=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, Paul Durrant <paul@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Thread-Topic: [PATCH v6 1/3] xen/vpci: Move ecam access functions to common
 code
Thread-Index: AQHXwQraA42SZeh0QUGI/xX7keuWA6vSqLgAgAARnQA=
Date: Thu, 14 Oct 2021 17:09:13 +0000
Message-ID: <6C71E132-0A78-4DA4-AA52-E62833912145@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <ced6f870dbfabcfe8584555cc80f9a37a0655a0c.1634221830.git.bertrand.marquis@arm.com>
 <20c73f4e-5a8b-c127-f3a7-b841f50b1a4a@suse.com>
In-Reply-To: <20c73f4e-5a8b-c127-f3a7-b841f50b1a4a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 376e9490-87fd-45e5-da00-08d98f355d94
x-ms-traffictypediagnostic: DBBPR08MB5964:|PR2PR08MB4668:
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB4668342325EF4E02222C5E259DB89@PR2PR08MB4668.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZgY3JtzxnW/1O+m6Oef0T6oCDHFMnvnOIMq7SyFbLPstkyXXILN6PfXJGKyTvLS59jdPUqnayiAE2xB7Jb8fQ1gh2474NVla7fGoDoMw5FzEMVnX9E4bOzNkxzKpkbGzt9dr3yxDJ3DjI0FrsYBxUHfPSDsCY9XghRAYrYy06hL8xTzHIlfJCqyC7rHNEgU6nQG8wXlLf58tMFz7PN3VYooYja+9TSBA2QiXKN+9imn5lHNTRuPProObLQ2vloWIzMv5GgK4cil1W7Zg7PcHG/xhYq97He/df/uMHACCzkiXoWGEia1bPRXQzLAgPZNywrUMNMDtIDj8Z6Ozt0jxwIz9N/azbg1+ohYYjbZhUj23nMbUm/iLg18MlSy51XT10RKhl+Dp0yVe8LeJ9Z/jTGHSG+dfPqA13rqfJIp7S/c8kd8RMPbI+xWEUfYe2FhtrgIjux8kXfZUWAcK0OtV1xlEE7E0uyk72NIYNN/tglNfak6ww1ruhuSDD06+RXxU8bNrsP1sAw9Rq6EYRfyIfn6QNa/2zepT1oixyQrUnmfdDvOEQeuoejUb2KqLgRley9StLEB4w4YNJW9TBAjHqjmtVXs526cdWMVeB8sOOnZcCuB+mvbA7OO1MWHOaJ+AhhhqtdUS5jr5s24O7JYPAtzwVlTbLE1+E9dF/5qh1bn/qiDMIY40FEBfa+6K/hBCFTxEkaq3HR8R7aVQxI6667FXY8y2D0htGsc2jC5lgWmxmsejc94R9qCZnOtz8vC9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(186003)(64756008)(66556008)(6512007)(26005)(66446008)(66476007)(83380400001)(122000001)(91956017)(2616005)(71200400001)(76116006)(66946007)(6486002)(508600001)(2906002)(4326008)(33656002)(86362001)(38100700002)(316002)(6916009)(36756003)(54906003)(53546011)(8676002)(6506007)(8936002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <80053813B4DE8A44936E959605BC24DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5964
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50fb1412-8416-4673-6b18-08d98f3558d5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KxdNZeE6m59fAHHMOCz1aCC3gC2KxPDGLbwTgIHEn/EimcgLCL5pAxc+mVxK/xo1t4/pgZ9qP8URG9JScZzrs61ESO3p++yxt2QxoeZG/PQOi+Iw1Cdf+DzGNNaEZzkyiBfZY6zu0LX2hurWSPWMk8RucpFPeBj3Y30YYcOXHUdgJXpreW/kVbrlQFg0qKJGunhge7cI/yO3P6jyMJKn1XTzxfEGi+NkonY3+yDlw4Hvh6+lrHIbp0wNvCSowtr3+gEloXNAtwW6D1C/FMj0MicJIz4Ps59HBrc9hcbhj8SkxxVEdadG19B+JcheQf30RirXHeEZ59CI7ldylDrIPDM1zWh3ORrE5eNGgB5xa3/Xlx3TQLK+nclhWXEW/mifgISnRc0gJ+MwPcltwlqaUsWUaRlNHkaqr468M5dbuokfzApQe6/mfzyvhloBwW1y36ob3wCQaFwkz5yCp3QoUPgfOKfV2dJlZE4XYvyz7xPHOVqAUlwd4PtimgeFlpn1VQpYF36ucmEH7hka709dpRAjo8Bxviu15AyX0xG4NofPEfER+Rz3pPb05Kyar0OnQ9wfAnlZOdkqikOBRPcQfl82EFrZb08IyQjgovVTMtx+7JwKihA+lyd2bLv7bBPMbphb8IwkZfj8vZLjWshVN/qdwUAoTr5VYzHRZ54bzKQkAe28/DWKYJ0+aIM/t9f0G3mkww2SvmAugS8mP44zMg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8676002)(2906002)(5660300002)(2616005)(53546011)(54906003)(26005)(508600001)(316002)(8936002)(47076005)(33656002)(6506007)(83380400001)(82310400003)(86362001)(70206006)(36860700001)(186003)(81166007)(336012)(70586007)(6862004)(6512007)(356005)(4326008)(6486002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 17:09:21.5630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 376e9490-87fd-45e5-da00-08d98f355d94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4668

SGkgSmFuLA0KDQo+IE9uIDE0IE9jdCAyMDIxLCBhdCAxNzowNiwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDE0LjEwLjIwMjEgMTY6NDksIEJlcnRyYW5k
IE1hcnF1aXMgd3JvdGU6DQo+PiBAQCAtMzA1LDcgKzI5MSw3IEBAIHN0YXRpYyBpbnQgdnBjaV9w
b3J0aW9fcmVhZChjb25zdCBzdHJ1Y3QgaHZtX2lvX2hhbmRsZXIgKmhhbmRsZXIsDQo+PiANCj4+
ICAgICByZWcgPSBodm1fcGNpX2RlY29kZV9hZGRyKGNmOCwgYWRkciwgJnNiZGYpOw0KPj4gDQo+
PiAtICAgIGlmICggIXZwY2lfYWNjZXNzX2FsbG93ZWQocmVnLCBzaXplKSApDQo+PiArICAgIGlm
ICggIXZwY2lfZWNhbV9hY2Nlc3NfYWxsb3dlZChyZWcsIHNpemUpICkNCj4+ICAgICAgICAgcmV0
dXJuIFg4NkVNVUxfT0tBWTsNCj4+IA0KPj4gICAgICpkYXRhID0gdnBjaV9yZWFkKHNiZGYsIHJl
Zywgc2l6ZSk7DQo+PiBAQCAtMzM1LDcgKzMyMSw3IEBAIHN0YXRpYyBpbnQgdnBjaV9wb3J0aW9f
d3JpdGUoY29uc3Qgc3RydWN0IGh2bV9pb19oYW5kbGVyICpoYW5kbGVyLA0KPj4gDQo+PiAgICAg
cmVnID0gaHZtX3BjaV9kZWNvZGVfYWRkcihjZjgsIGFkZHIsICZzYmRmKTsNCj4+IA0KPj4gLSAg
ICBpZiAoICF2cGNpX2FjY2Vzc19hbGxvd2VkKHJlZywgc2l6ZSkgKQ0KPj4gKyAgICBpZiAoICF2
cGNpX2VjYW1fYWNjZXNzX2FsbG93ZWQocmVnLCBzaXplKSApDQo+PiAgICAgICAgIHJldHVybiBY
ODZFTVVMX09LQVk7DQo+PiANCj4+ICAgICB2cGNpX3dyaXRlKHNiZGYsIHJlZywgc2l6ZSwgZGF0
YSk7DQo+IA0KPiBXaHkgd291bGQgcG9ydCBJL08gZnVuY3Rpb25zIGNhbGwgYW4gRUNBTSBoZWxw
ZXI/IEFuZCBpbiBob3cgZmFyIGlzDQo+IHRoYXQgaGVscGVyIGFjdHVhbGx5IEVDQU0tc3BlY2lm
aWM/DQoNClRoZSBmdW5jdGlvbiB3YXMgZ2xvYmFsIGJlZm9yZS4NCg0KPiANCj4+IEBAIC00MzQs
MjUgKzQyMCw4IEBAIHN0YXRpYyBpbnQgdnBjaV9tbWNmZ19yZWFkKHN0cnVjdCB2Y3B1ICp2LCB1
bnNpZ25lZCBsb25nIGFkZHIsDQo+PiAgICAgcmVnID0gdnBjaV9tbWNmZ19kZWNvZGVfYWRkciht
bWNmZywgYWRkciwgJnNiZGYpOw0KPj4gICAgIHJlYWRfdW5sb2NrKCZkLT5hcmNoLmh2bS5tbWNm
Z19sb2NrKTsNCj4+IA0KPj4gLSAgICBpZiAoICF2cGNpX2FjY2Vzc19hbGxvd2VkKHJlZywgbGVu
KSB8fA0KPj4gLSAgICAgICAgIChyZWcgKyBsZW4pID4gUENJX0NGR19TUEFDRV9FWFBfU0laRSAp
DQo+PiAtICAgICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOw0KPiANCj4gV2hpbGUgSSBhc3N1bWUg
dGhpcyBlYXJsaWVyIGJlaGF2aW9yIGlzIHRoZSByZWFzb24gZm9yIC4uLg0KDQpZZXMgOi0pDQoN
Cj4gDQo+PiAtICAgIC8qDQo+PiAtICAgICAqIEFjY29yZGluZyB0byB0aGUgUENJZSAzLjFBIHNw
ZWNpZmljYXRpb246DQo+PiAtICAgICAqICAtIENvbmZpZ3VyYXRpb24gUmVhZHMgYW5kIFdyaXRl
cyBtdXN0IHVzdWFsbHkgYmUgRFdPUkQgb3Igc21hbGxlcg0KPj4gLSAgICAgKiAgICBpbiBzaXpl
Lg0KPj4gLSAgICAgKiAgLSBCZWNhdXNlIFJvb3QgQ29tcGxleCBpbXBsZW1lbnRhdGlvbnMgYXJl
IG5vdCByZXF1aXJlZCB0byBzdXBwb3J0DQo+PiAtICAgICAqICAgIGFjY2Vzc2VzIHRvIGEgUkNS
QiB0aGF0IGNyb3NzIERXIGJvdW5kYXJpZXMgWy4uLl0gc29mdHdhcmUNCj4+IC0gICAgICogICAg
c2hvdWxkIHRha2UgY2FyZSBub3QgdG8gY2F1c2UgdGhlIGdlbmVyYXRpb24gb2Ygc3VjaCBhY2Nl
c3Nlcw0KPj4gLSAgICAgKiAgICB3aGVuIGFjY2Vzc2luZyBhIFJDUkIgdW5sZXNzIHRoZSBSb290
IENvbXBsZXggd2lsbCBzdXBwb3J0IHRoZQ0KPj4gLSAgICAgKiAgICBhY2Nlc3MuDQo+PiAtICAg
ICAqICBYZW4gaG93ZXZlciBzdXBwb3J0cyA4Ynl0ZSBhY2Nlc3NlcyBieSBzcGxpdHRpbmcgdGhl
bSBpbnRvIHR3bw0KPj4gLSAgICAgKiAgNGJ5dGUgYWNjZXNzZXMuDQo+PiAtICAgICAqLw0KPj4g
LSAgICAqZGF0YSA9IHZwY2lfcmVhZChzYmRmLCByZWcsIG1pbig0dSwgbGVuKSk7DQo+PiAtICAg
IGlmICggbGVuID09IDggKQ0KPj4gLSAgICAgICAgKmRhdGEgfD0gKHVpbnQ2NF90KXZwY2lfcmVh
ZChzYmRmLCByZWcgKyA0LCA0KSA8PCAzMjsNCj4+ICsgICAgLyogSWdub3JlIHJldHVybiBjb2Rl
ICovDQo+PiArICAgIHZwY2lfZWNhbV9tbWlvX3JlYWQoc2JkZiwgcmVnLCBsZW4sIGRhdGEpOw0K
PiANCj4gLi4uIHRoZSBjb21tZW50ZWQtdXBvbiBpZ25vcmluZyBvZiB0aGUgcmV0dXJuIHZhbHVl
LCBJIGRvbid0IHRoaW5rDQo+IHRoYXQncyBhIGdvb2Qgd2F5IHRvIGRlYWwgd2l0aCB0aGluZ3Mg
YW55bW9yZS4gSW5zdGVhZCBJIHRoaW5rDQo+ICpkYXRhIHNob3VsZCBiZSB3cml0dGVuIHRvIH4w
IHVwb24gZmFpbHVyZSwgdW5sZXNzIGl0IGlzIGludGVuZGVkDQo+IGZvciB2cGNpX2VjYW1fbW1p
b19yZWFkKCkgdG8gdGFrZSBjYXJlIG9mIHRoYXQgY2FzZSAoaW4gd2hpY2ggY2FzZQ0KPiBJJ20g
bm90IHN1cmUgSSB3b3VsZCBzZWUgd2h5IGl0IG5lZWRzIHRvIHJldHVybiBhbiBlcnJvciBpbmRp
Y2F0b3INCj4gaW4gdGhlIGZpcnN0IHBsYWNlKS4NCg0KSSBhbSBub3Qgc3VyZSBpbiB0aGUgZmly
c3QgcGxhY2Ugd2h5IHRoaXMgaXMgYWN0dWFsbHkgaWdub3JlZCBhbmQganVzdA0KcmV0dXJuaW5n
IGEgLTEgdmFsdWUuDQpJZiBhbiBhY2Nlc3MgaXMgbm90IHJpZ2h0LCBhbiBleGNlcHRpb24gc2hv
dWxkIGJlIGdlbmVyYXRlZCB0byB0aGUNCkd1ZXN0IGluc3RlYWQuDQpXaGVuIHdlIGRvIHRoYXQg
b24gYXJtIHRoZSBmdW5jdGlvbiBpcyByZXR1cm5pbmcgYW4gZXJyb3IgdG8gdGhlIHVwcGVyDQps
YXllciBpbiB0aGF0IGNhc2UsIHRoYXTigJlzIHdoeSBJIGRpZCBrZWVwIGEgZ2VuZXJpYyBmdW5j
dGlvbiBpbmZvcm1pbmcgdGhlDQpjYWxsZXIuDQoNClNvIEkgdGhpbmsgaXQgaXMgcmlnaHQgZm9y
IHRoZSBmdW5jdGlvbiB0byByZXR1cm4gYW4gZXJyb3IgaWYgdGhlIGFjY2VzcyBpcyBub3QgYWxs
b3dlZCBidXQgSSBhZ3JlZSB0aGUgY29tbWVudCBvbiB4ODYgY291bGQgZ2V0IGEgYmV0dGVyIGp1
c3RpZmljYXRpb24uDQpAUm9nZXI6IGNvdWxkIHlvdSBoZWxwIGZpbmRpbmcgb25lIGhlcmUgYXMg
SSBkbyBub3QgcXVpdGUgdW5kZXJzdGFuZCB3aHkgaXQgaXMgb2sgdG8gaWdub3JlIHRoaXMgY2Fz
ZSA/DQoNCj4gDQo+PiBAQCAtNDc2LDEzICs0NDUsOCBAQCBzdGF0aWMgaW50IHZwY2lfbW1jZmdf
d3JpdGUoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGxvbmcgYWRkciwNCj4+ICAgICByZWcgPSB2
cGNpX21tY2ZnX2RlY29kZV9hZGRyKG1tY2ZnLCBhZGRyLCAmc2JkZik7DQo+PiAgICAgcmVhZF91
bmxvY2soJmQtPmFyY2guaHZtLm1tY2ZnX2xvY2spOw0KPj4gDQo+PiAtICAgIGlmICggIXZwY2lf
YWNjZXNzX2FsbG93ZWQocmVnLCBsZW4pIHx8DQo+PiAtICAgICAgICAgKHJlZyArIGxlbikgPiBQ
Q0lfQ0ZHX1NQQUNFX0VYUF9TSVpFICkNCj4+IC0gICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7
DQo+PiAtDQo+PiAtICAgIHZwY2lfd3JpdGUoc2JkZiwgcmVnLCBtaW4oNHUsIGxlbiksIGRhdGEp
Ow0KPj4gLSAgICBpZiAoIGxlbiA9PSA4ICkNCj4+IC0gICAgICAgIHZwY2lfd3JpdGUoc2JkZiwg
cmVnICsgNCwgNCwgZGF0YSA+PiAzMik7DQo+PiArICAgIC8qIElnbm9yZSByZXR1cm4gY29kZSAq
Lw0KPj4gKyAgICB2cGNpX2VjYW1fbW1pb193cml0ZShzYmRmLCByZWcsIGxlbiwgZGF0YSk7DQo+
IA0KPiBIZXJlIGlnbm9yaW5nIGlzIGZpbmUgaW1vLCBidXQgaWYgeW91IGZlZWwgaXQgaXMgaW1w
b3J0YW50IHRvDQo+IGNvbW1lbnQgb24gdGhpcywgdGhlbiBJIHRoaW5rIHlvdSBuZWVkIHRvIHBy
ZWZlciAid2h5IiBvdmVyICJ3aGF0Ii4NCg0KQWdyZWUgSSB3b3VsZCBqdXN0IG5lZWQgc29tZSBo
ZWxwIG9uIHRoZSB3aHkuDQpOb3cgdGhlcmUgd2FzIG5vIGNvbW1lbnQgYmVmb3JlIHRvIGV4cGxh
aW4gd2h5IHNvIEkgY291bGQgYWxzbw0KcmVtb3ZlIHRoZSBjb21tZW50IGFsdG9nZXRoZXIuDQoN
Cj4gDQo+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4gKysrIGIveGVuL2RyaXZl
cnMvdnBjaS92cGNpLmMNCj4+IEBAIC00NzgsNiArNDc4LDY2IEBAIHZvaWQgdnBjaV93cml0ZShw
Y2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBzaXplLA0KPj4g
ICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+IH0NCj4+IA0KPj4gKy8qIEhl
bHBlciBmdW5jdGlvbiB0byBjaGVjayBhbiBhY2Nlc3Mgc2l6ZSBhbmQgYWxpZ25tZW50IG9uIHZw
Y2kgc3BhY2UuICovDQo+PiArYm9vbCB2cGNpX2VjYW1fYWNjZXNzX2FsbG93ZWQodW5zaWduZWQg
aW50IHJlZywgdW5zaWduZWQgaW50IGxlbikNCj4+ICt7DQo+PiArICAgIC8qDQo+PiArICAgICAq
IENoZWNrIGFjY2VzcyBzaXplLg0KPj4gKyAgICAgKg0KPj4gKyAgICAgKiBPbiBhcm0zMiBvciBm
b3IgMzJiaXQgZ3Vlc3RzIG9uIGFybSwgNjRiaXQgYWNjZXNzZXMgc2hvdWxkIGJlIGZvcmJpZGRl
bg0KPj4gKyAgICAgKiBidXQgYXMgZm9yIHRob3NlIHBsYXRmb3JtIElTViByZWdpc3Rlciwgd2hp
Y2ggZ2l2ZXMgdGhlIGFjY2VzcyBzaXplLA0KPj4gKyAgICAgKiBjYW5ub3QgaGF2ZSBhIHZhbHVl
IDMsIGNoZWNraW5nIHRoaXMgd291bGQganVzdCBoYXJkZW4gdGhlIGNvZGUuDQo+PiArICAgICAq
Lw0KPj4gKyAgICBpZiAoIGxlbiAhPSAxICYmIGxlbiAhPSAyICYmIGxlbiAhPSA0ICYmIGxlbiAh
PSA4ICkNCj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsNCj4gDQo+IEknbSBub3QgY29udmluY2Vk
IHRhbGtpbmcgYWJvdXQgQXJtIHNwZWNpZmljYWxseSBoZXJlIGlzDQo+IHdhcnJhbnRlZCwgdW5s
ZXNzIHRoZXJlJ3Mgc29tZXRoaW5nIHRoZXJlIHRoYXQncyBjbGVhcmx5DQo+IGRpZmZlcmVudCBm
cm9tIGFsbCBvdGhlciBhcmNoaXRlY3R1cmVzLiBPdGhlcndpc2UgdGhlIGNvbW1lbnQNCj4gc2hv
dWxkIGltbyBiZSB3cml0dGVuIGluIG1vcmUgZ2VuZXJhbCB0ZXJtcy4NCg0KT3RoZXIgYXJjaGl0
ZWN0dXJlcyBtaWdodCBhbGxvdyB0aGlzIGNhc2UuIFNvIHRoaXMgaXMgc3BlY2lmaWMgdG8gQXJt
Lg0KDQo+IA0KPj4gK2ludCB2cGNpX2VjYW1fbW1pb193cml0ZShwY2lfc2JkZl90IHNiZGYsIHVu
c2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCBsZW4sDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgZGF0YSkNCj4+ICt7DQo+PiArICAgIGlmICggIXZwY2lfZWNh
bV9hY2Nlc3NfYWxsb3dlZChyZWcsIGxlbikgfHwNCj4+ICsgICAgICAgICAocmVnICsgbGVuKSA+
IFBDSV9DRkdfU1BBQ0VfRVhQX1NJWkUgKQ0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+
PiArICAgIHZwY2lfd3JpdGUoc2JkZiwgcmVnLCBtaW4oNHUsIGxlbiksIGRhdGEpOw0KPj4gKyAg
ICBpZiAoIGxlbiA9PSA4ICkNCj4+ICsgICAgICAgIHZwY2lfd3JpdGUoc2JkZiwgcmVnICsgNCwg
NCwgZGF0YSA+PiAzMik7DQo+PiArDQo+PiArICAgIHJldHVybiAxOw0KPj4gK30NCj4+ICsNCj4+
ICtpbnQgdnBjaV9lY2FtX21taW9fcmVhZChwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCBy
ZWcsIHVuc2lnbmVkIGludCBsZW4sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgbG9uZyAqZGF0YSkNCj4+ICt7DQo+PiArICAgIGlmICggIXZwY2lfZWNhbV9hY2Nlc3NfYWxs
b3dlZChyZWcsIGxlbikgfHwNCj4+ICsgICAgICAgICAocmVnICsgbGVuKSA+IFBDSV9DRkdfU1BB
Q0VfRVhQX1NJWkUgKQ0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArICAgIC8qDQo+
PiArICAgICAqIEFjY29yZGluZyB0byB0aGUgUENJZSAzLjFBIHNwZWNpZmljYXRpb246DQo+PiAr
ICAgICAqICAtIENvbmZpZ3VyYXRpb24gUmVhZHMgYW5kIFdyaXRlcyBtdXN0IHVzdWFsbHkgYmUg
RFdPUkQgb3Igc21hbGxlcg0KPj4gKyAgICAgKiAgICBpbiBzaXplLg0KPj4gKyAgICAgKiAgLSBC
ZWNhdXNlIFJvb3QgQ29tcGxleCBpbXBsZW1lbnRhdGlvbnMgYXJlIG5vdCByZXF1aXJlZCB0byBz
dXBwb3J0DQo+PiArICAgICAqICAgIGFjY2Vzc2VzIHRvIGEgUkNSQiB0aGF0IGNyb3NzIERXIGJv
dW5kYXJpZXMgWy4uLl0gc29mdHdhcmUNCj4+ICsgICAgICogICAgc2hvdWxkIHRha2UgY2FyZSBu
b3QgdG8gY2F1c2UgdGhlIGdlbmVyYXRpb24gb2Ygc3VjaCBhY2Nlc3Nlcw0KPj4gKyAgICAgKiAg
ICB3aGVuIGFjY2Vzc2luZyBhIFJDUkIgdW5sZXNzIHRoZSBSb290IENvbXBsZXggd2lsbCBzdXBw
b3J0IHRoZQ0KPj4gKyAgICAgKiAgICBhY2Nlc3MuDQo+PiArICAgICAqICBYZW4gaG93ZXZlciBz
dXBwb3J0cyA4Ynl0ZSBhY2Nlc3NlcyBieSBzcGxpdHRpbmcgdGhlbSBpbnRvIHR3bw0KPj4gKyAg
ICAgKiAgNGJ5dGUgYWNjZXNzZXMuDQo+PiArICAgICAqLw0KPj4gKyAgICAqZGF0YSA9IHZwY2lf
cmVhZChzYmRmLCByZWcsIG1pbig0dSwgbGVuKSk7DQo+PiArICAgIGlmICggbGVuID09IDggKQ0K
Pj4gKyAgICAgICAgKmRhdGEgfD0gKHVpbnQ2NF90KXZwY2lfcmVhZChzYmRmLCByZWcgKyA0LCA0
KSA8PCAzMjsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIDE7DQo+PiArfQ0KPiANCj4gV2h5IGRvIHRo
ZXNlIHR3byBmdW5jdGlvbnMgcmV0dXJuIGludC8wLzEgaW5zdGVhZCBvZg0KPiBib29sL2ZhbHNl
L3RydWUgKGFzc3VtaW5nLCBhcyBwZXIgYWJvdmUsIHRoYXQgdGhlbSByZXR1cm5pbmcgbm9uLQ0K
PiB2b2lkIGlzIHdhcnJhbnRlZCBhdCBhbGwpPw0KDQpUaGlzIGlzIHdoYXQgdGhlIG1taW8gaGFu
ZGxlcnMgc2hvdWxkIHJldHVybiB0byBzYXkgdGhhdCBhbiBhY2Nlc3MNCndhcyBvayBvciBub3Qg
c28gdGhlIGZ1bmN0aW9uIHN0aWNrIHRvIHRoaXMgc3RhbmRhcmQuDQoNCj4gDQo+IEFsc28gYm90
aCBvZiB0aGVzZSBmdW5jdGlvbnMgd2lsbCBzaWxlbnRseSBtaXNiZWhhdmUgb24gMzItYml0IGR1
ZSB0bw0KPiB0aGUgdXNlIG9mIHVuc2lnbmVkIGxvbmcgaW4gdGhlIHBhcmFtZXRlciB0eXBlcy4g
SSB0aGluayB5b3Ugd2FudCBlLmcuDQo+IENPTkZJR182NEJJVCBjb25kaXRpb25hbHMgaGVyZSBh
cyB3ZWxsIGFzIGluIHZwY2lfYWNjZXNzX2FsbG93ZWQoKQ0KPiAob21pdHRpbmcgdGhlIHF1ZXN0
aW9uYWJsZSAiZWNhbSIgcGFydCBvZiB0aGUgbmFtZSkgdG8gcmVqZWN0IGxlbiA9PSA4DQo+IHRo
ZXJlIGluIHRoYXQgY2FzZS4NCg0KUmlnaHQgdXNpbmcgQ09ORklHXzY0QklUIGlzIGEgZ29vZCBp
ZGVhIGhlcmUgaW4gZmFjdC4NCkkgY2FuIGRvIHRoYXQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0K
PiANCj4gRmluYWxseSwgdG8gbWUsIGhhdmluZyBib3RoICJlY2FtIiBhbmQgIm1taW8iIGluIHRo
ZSBuYW1lcyBmZWVscw0KPiByZWR1bmRhbnQgLSB0aGUgUENJIHNwZWMgZG9lc24ndCBtZW50aW9u
IGFueSBub24tTU1JTyBtZWNoYW5pc20gdGhlcmUNCj4gYWZhaWNzLg0KDQpJIHdhcyB0aGlua2lu
ZyB0aGUgbW1pbyBoZXJlIHN0YW5kcyBtb3JlIGZvciDigJxtbWlvIGhhbmRsZXLigJ0gYXMgdG8g
ZnVuY3Rpb24NCmhhbmRsaW5nIGVtdWxhdGlvbiB0aHJvdWdoIG1taW8gYWNjZXNzLg0KSSBoYXZl
IG5vIG9iamVjdGlvbiB0byByZW1vdmUgdGhlIG1taW8gcGFydCB0aG91Z2guDQoNClJlZ2FyZHMN
CkJlcnRyYW5kDQoNCj4gDQo+IEphbg0KPiANCg0K

