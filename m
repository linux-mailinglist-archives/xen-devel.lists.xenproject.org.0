Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E24E6286
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 12:34:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294262.500259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXLiQ-0002ZR-QA; Thu, 24 Mar 2022 11:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294262.500259; Thu, 24 Mar 2022 11:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXLiQ-0002Xf-ML; Thu, 24 Mar 2022 11:33:18 +0000
Received: by outflank-mailman (input) for mailman id 294262;
 Thu, 24 Mar 2022 11:33:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EJ9a=UD=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nXLiP-0002XZ-4I
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 11:33:17 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe05::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31612c71-ab66-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 12:33:15 +0100 (CET)
Received: from DB6PR0202CA0028.eurprd02.prod.outlook.com (2603:10a6:4:a5::14)
 by DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Thu, 24 Mar
 2022 11:33:05 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a5:cafe::99) by DB6PR0202CA0028.outlook.office365.com
 (2603:10a6:4:a5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Thu, 24 Mar 2022 11:33:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Thu, 24 Mar 2022 11:33:04 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Thu, 24 Mar 2022 11:33:04 +0000
Received: from cc00089bd1ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10CD6074-D573-413C-8CEC-8D98C74CF1F0.1; 
 Thu, 24 Mar 2022 11:32:54 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc00089bd1ec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Mar 2022 11:32:54 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by PAXPR08MB6781.eurprd08.prod.outlook.com
 (2603:10a6:102:136::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 24 Mar
 2022 11:32:51 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::253a:4d6c:61c9:af60%10]) with mapi id 15.20.5102.018; Thu, 24 Mar
 2022 11:32:51 +0000
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
X-Inumbo-ID: 31612c71-ab66-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qVVI+e45OeAtR/wisvphh6cSQR0Vx7wWW3N5O+uwso=;
 b=A4PwLgWCvGlaTG7HvBP0DPhigV/MPrqeFtwD57JXm4H/68Ztk0Vf/KiG++fVkQrXfRktr8Yo3pz1ORZ8I0h9sPSgDqi/Vi/BjcyxaRorkoFbWeG/tkcNfnNibhzURsE0yW31NDEA6DUdSIc9j59SeQVxews6NxmO/6gsolGcTAI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fdb416d9e95da524
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgB3ebEWtmnp/ai+2ZVbDX3qf8Aaphe2ALBhe6Vlw9NmdGe9BqKdP92Q+VHZ6TP5t2/OZGdXvhkgm6OBWdDSIiMeUENL37GAtwNImws/34haxN2uGm0ybJfEwLz7himjRGqJDcl0GgYv2wCvCC+kpStgHgzsx+UXf5exZ/WfG14M0aV8Uy3uOo/fYI8px9+sDhH8RtmSXEUSeKCdQahOcq+NN1WANFk1ckdc+05PC8QwycbygLB7ho5sbYVKkBmHC/JrkNAR2CdRWZJTDLH4aXjz/XTPIAXjaYWNwv0c1xC3OJhG917JW8RuUAqLxSRvAPiU4h9340mPWP7ryHygEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qVVI+e45OeAtR/wisvphh6cSQR0Vx7wWW3N5O+uwso=;
 b=SznSQoCMFIX0yp3o+W2c0B9Auprozb+rBYxwJvkVZGogte8kzYIQQpc+7B37EDLGRNHASMhK0DUEX6/ul1u9cbL7ZV5xX4TANBnmQXDgVoP8XIRh1qNKTEDRtApTfLd6pT10ySdL2eB9+UkIgNxOj1IYdLgPtMVYSxceOJjM8a7yGlMCmk1vUPk5vUjDf4ZfTX9NdmSr1iGpnevOL5jkL1IE2fQWYch8rnsGooa0SyxXcmGPdFV+5Sy9El7sryJPfwnkBG9PRuXOCK0G6mgvQE9fkSvEKDT5Qi9i/Eybs23GKGurUWz/csK2ZEgE38znfT9D39fHHhRDc2whdgeClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qVVI+e45OeAtR/wisvphh6cSQR0Vx7wWW3N5O+uwso=;
 b=A4PwLgWCvGlaTG7HvBP0DPhigV/MPrqeFtwD57JXm4H/68Ztk0Vf/KiG++fVkQrXfRktr8Yo3pz1ORZ8I0h9sPSgDqi/Vi/BjcyxaRorkoFbWeG/tkcNfnNibhzURsE0yW31NDEA6DUdSIc9j59SeQVxews6NxmO/6gsolGcTAI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] xen/evtchn: Add design for static event channel signaling
 for domUs..
Thread-Topic: [PATCH] xen/evtchn: Add design for static event channel
 signaling for domUs..
Thread-Index: AQHYPsy9MfyfmFhecEGJuSNYyusIgKzNIqYAgAFFiQA=
Date: Thu, 24 Mar 2022 11:32:51 +0000
Message-ID: <0782E68E-8736-4EB7-B8A3-4FC103F22E14@arm.com>
References:
 <4836304496e6fbbea41348ed8cc9fcf6b0f3e893.1648049827.git.rahul.singh@arm.com>
 <36c2a426-5354-fc38-1917-af7045bdf268@suse.com>
In-Reply-To: <36c2a426-5354-fc38-1917-af7045bdf268@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b1948514-1abe-45af-14d6-08da0d8a0fa8
x-ms-traffictypediagnostic:
	PAXPR08MB6781:EE_|DB5EUR03FT030:EE_|DB6PR0801MB2024:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB20246F710925F369990B84E6FC199@DB6PR0801MB2024.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eMA0obWg4wTCT3xKQIJuZA4ARC+09LO86wbrcauSoR1t3JKPYAWqMVFdB8z7yeUZs06+UWFdwNJds1w5CqPiIziC9Ai5q539/dmo+n6ekbQD+DaZEkzCdfE90LdzPSBXERdYnzPR5ZCTlQ+4TL4lZs32wp+7TR0egb7nTT2grQfyAg1pkbXmDxvNaN/fTb3UviCQo/ggfMzrJ2S7idsZlh+8RQFv2h+rwYAlyw89dLynEidPnnTPHtqojMupExsqOKQ0JVqzo5QV59KQR+/AGr6F7b7Dn8gzhXD3TQRsDWQNYKdtaj1Kv+VWLjHK/CDxA+f7Fv9GaDwBd0SW8m2nltW/N5XJbNhazqZIrvbS+9QTZzah0bQ9rm/ZfHrOq3SV9X8bd74tC28pe9O+WdjQBAIVNceTa2+b83lAfD8acHf2v+aS5Z/xMt39slNOSP2kdUGtAdnft42Ts+ukocGSzR+LPsEWPo0TA+2r+aMHBBp7eEV2FttaxWyobE5JD/fXwE+nXM6DHFQXkqkQ2Ff0EP0rE3xC0UQSSpYA2bYGGWIMHQsoQsI3cdyWtEYW+ANe6x8HubKtR0QrNrXrI2I3RtVx9baQOkCnogR3FyJQCpTN6KGuRDiDHtt9dxGBPmvv5D8jWVuQuujmGltNRwrr6qBARm7EKxTyc/ACS1Z5oW+091GTLvzV3VPEKgXekYFOfz1jBp+2vYV0tS5oonvbIE7HbP/wNfy0VS9Z1UfWPao=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(64756008)(186003)(76116006)(8676002)(6506007)(66946007)(66446008)(66556008)(4326008)(316002)(508600001)(2616005)(71200400001)(6486002)(91956017)(83380400001)(36756003)(86362001)(33656002)(8936002)(38100700002)(5660300002)(26005)(6916009)(53546011)(6512007)(2906002)(54906003)(38070700005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1F50BA56CB325438FE7E15B0DBA910E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6781
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6fbcde7-6851-4006-1e13-08da0d8a0802
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tFXwccAeUjvzBfC6dsmWGeDIAPxoaEhS1a7HgmTeMLMjv4Pln5j8L/Jyv7kR5uhcLLApYJlv1iMbia3IYNwHtlD8Q0JgYJ+XVXS+FLOMyYd2F35zS8Fw6dmzlP5GsOS+iKtEhPHT85e6sklI5ap3y+wBP2GCqiZkdy/qe4yR3bPhowUAXvM70Xag9ho/T4Ow8iB2vAJXWGwaRdI0/L3cyCbuiH7H7fjs1d8ozKXsZmlAW2RQKKjqKD633zkO58i63kPYP1ehDBx3gz609B9OO4FCY33fyBFTJxZPQFvWOaKCyD9BWGvpJ2JBkZiS55i+qr+hj2Bf7aDTTEnsms+Cyngo2huycAZ9UOeMuWP3lGpI/yrpidnYr91UuKKD0YT29QD1upe0JO2KQDCLbMzmQ5OwOjFbNo6P0qaLQlnDSmrDjrXLWBOJ/1/QeOcOhS261pb/ZOZBCn22cYXhJWbECdDzJuSon5n39ExlFG6VGWwY9OyG/yuDHYPsTsAbAag4xJcmmk00ylpNoYYevm5bfm31VSMtQVUVO7Az+7fjreQbAxR2vlwGLRmVM1brA7E3vlxiJoHE5W5y2ekv3EsEPBiGNeVImLNVa2Rrys2NVdLcBOJtA+AVEXiVrdpMpZRVpX1keq6+oZBMPYCb5OFkM18eZILonAgRPUT+BN4ftdp4nHWtLdP7eMoJWhoWmfrw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(6862004)(6506007)(36860700001)(6512007)(186003)(36756003)(54906003)(26005)(40460700003)(53546011)(8676002)(4326008)(81166007)(83380400001)(86362001)(356005)(33656002)(6486002)(82310400004)(8936002)(316002)(5660300002)(2906002)(70586007)(70206006)(508600001)(47076005)(2616005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 11:33:04.5573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1948514-1abe-45af-14d6-08da0d8a0fa8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2024

SGVsbG8gSmFuLA0KDQpUaGFua3MgZm9yIHJldmlld2luZyB0aGUgZGVzaWduLg0KDQo+IE9uIDIz
IE1hciAyMDIyLCBhdCA0OjA3IHBtLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOg0KPiANCj4gT24gMjMuMDMuMjAyMiAxNjo0MywgUmFodWwgU2luZ2ggd3JvdGU6DQo+PiBp
biBkb20wbGVzcyBzeXN0ZW0uIFRoaXMgcGF0Y2ggaW50cm9kdWNlIHRoZSBuZXcgZmVhdHVyZSB0
byBzdXBwb3J0IHRoZQ0KPj4gc2lnbmFsaW5nIGJldHdlZW4gdHdvIGRvbVVzIGluIGRvbTBsZXNz
IHN5c3RlbS4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdo
QGFybS5jb20+DQo+PiAtLS0NCj4+IGRvY3MvZGVzaWducy9kb20wbGVzcy1ldnRjaG4ubWQgfCA5
NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IDEgZmlsZSBjaGFuZ2VkLCA5
NiBpbnNlcnRpb25zKCspDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9kZXNpZ25zL2RvbTBs
ZXNzLWV2dGNobi5tZA0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvZG9jcy9kZXNpZ25zL2RvbTBsZXNz
LWV2dGNobi5tZCBiL2RvY3MvZGVzaWducy9kb20wbGVzcy1ldnRjaG4ubWQNCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwLi42YTFiN2U4YzIyDQo+PiAtLS0gL2Rl
di9udWxsDQo+PiArKysgYi9kb2NzL2Rlc2lnbnMvZG9tMGxlc3MtZXZ0Y2huLm1kDQo+PiBAQCAt
MCwwICsxLDk2IEBADQo+PiArIyBTaWduYWxpbmcgc3VwcG9ydCBiZXR3ZWVuIHR3byBkb21VcyBv
biBkb20wbGVzcyBzeXN0ZW0NCj4+ICsNCj4+ICsjIyBDdXJyZW50IHN0YXRlOuKAr0RyYWZ0IHZl
cnNpb24NCj4+ICsNCj4+ICsjIyBQcm9wb3NlcihzKTogUmFodWwgU2luZ2gsIEJlcnRyYW5kIE1h
cnF1aXMNCj4+ICsNCj4+ICsjIyBQcm9ibGVtIFN0YXRlbWVudDoNCj4+ICsNCj4+ICtUaGUgZ29h
bCBvZiB0aGlzIHdvcmsgaXMgdG8gZGVmaW5lIGEgc2ltcGxlIHNpZ25hbGluZyBzeXN0ZW0gYmV0
d2VlbiBYZW4gZ3Vlc3RzDQo+PiAraW4gZG9tMGxlc3Mgc3lzdGVtcy4NCj4+ICsNCj4+ICtJbiBk
b20wbGVzcyBzeXN0ZW0sIHdlIGNhbm5vdCBtYWtlIHVzZSBvZiB4ZW5idXMgYW5kIHhlbnN0b3Jl
IHRoYXQgYXJlIHVzZWQgaW4NCj4+ICtub3JtYWwgc3lzdGVtcyB3aXRoIGR5bmFtaWMgVk1zIHRv
IGNvbW11bmljYXRlIGJldHdlZW4gZG9tYWlucyBieSBwcm92aWRpbmcgYQ0KPj4gK2J1cyBhYnN0
cmFjdGlvbiBmb3IgcGFyYXZpcnR1YWxpemVkIGRyaXZlcnMuDQo+PiArDQo+PiArT25lIHBvc3Np
YmxlIHNvbHV0aW9uIHRvIGltcGxlbWVudCB0aGUgc2lnbmFsaW5nIHN5c3RlbSBiZXR3ZWVuIGRv
bVVzIGlzIGJhc2VkDQo+PiArb24gZXZlbnQgY2hhbm5lbHMuDQo+PiArDQo+PiArIyMgUHJvcG9z
YWw6DQo+PiArDQo+PiArRXZlbnQgY2hhbm5lbHMgYXJlIHRoZSBiYXNpYyBwcmltaXRpdmUgcHJv
dmlkZWQgYnkgWGVuIGZvciBldmVudCBub3RpZmljYXRpb25zLg0KPj4gK0FuIGV2ZW50IGNoYW5u
ZWwgaXMgYSBsb2dpY2FsIGNvbm5lY3Rpb24gYmV0d2VlbiAyIGRvbWFpbnMgKG1vcmUgc3BlY2lm
aWNhbGx5DQo+PiArYmV0d2VlbiBkb20xLHBvcnQxIGFuZCBkb20yLHBvcnQyKS4gVGhleSBlc3Nl
bnRpYWxseSBzdG9yZSBvbmUgYml0IG9mDQo+PiAraW5mb3JtYXRpb24sIHRoZSBldmVudCBvZiBp
bnRlcmVzdCBpcyBzaWduYWxsZWQgYnkgdHJhbnNpdGlvbmluZyB0aGlzIGJpdCBmcm9tDQo+PiAr
MCB0byAxLiBBbiBldmVudCBpcyBhbiBlcXVpdmFsZW50IG9mIGEgaGFyZHdhcmUgaW50ZXJydXB0
Lg0KPiANCj4gTml0OiBTaW5jZSB5b3UncmUgdGFsa2luZyBvZiBjaGFubmVscyBoZXJlLCBub3Qg
cG9ydHMsIHN0cmljdGx5IHNwZWFraW5nDQo+IGl0J3MgdHdvIGJpdHMgLSBvbmUgb24gZWFjaCBz
aWRlLiBBbHRlcm5hdGl2ZWx5IGluc3RlYWQgb2YgIlRoZXkgLi4uIg0KPiB5b3UgY291bGQgc2F5
ICJFYWNoIHBvcnQgLi4uIi4NCj4gDQoNCkFjay4gSSB3aWxsIGNvcnJlY3QgaXQgaW4gbmV4dCB2
ZXJzaW9uLg0KDQo+PiArTm90aWZpY2F0aW9ucyBhcmUgcmVjZWl2ZWQgYnkgYSBndWVzdCB2aWEg
YW4gaW50ZXJydXB0IGZyb20gWGVuIHRvIHRoZSBndWVzdCwNCj4+ICtpbmRpY2F0aW5nIHdoZW4g
YW4gZXZlbnQgYXJyaXZlcyAoc2V0dGluZyB0aGUgYml0KS4gRnVydGhlciBub3RpZmljYXRpb25z
IGFyZQ0KPj4gK21hc2tlZCB1bnRpbCB0aGUgYml0IGlzIGNsZWFyZWQgYWdhaW4uIFdoZW4gYSBk
b21haW4gd2FudHMgdG8gd2FpdCBmb3IgZGF0YSBpdA0KPj4gK3dpbGwgYmxvY2sgdW50aWwgYW4g
ZXZlbnQgYXJyaXZlcywgYW5kIHRoZW4gc2VuZCBhbiBldmVudCB0byBzaWduYWwgdGhhdCBkYXRh
DQo+PiAraGFzIGJlZW4gY29uc3VtZWQuIEV2ZW50cyBhcmUgZGVsaXZlcmVkIGFzeW5jaHJvbm91
c2x5IHRvIGd1ZXN0cyBhbmQgYXJlDQo+PiArZW5xdWV1ZWQgd2hlbiB0aGUgZ3Vlc3QgaXMgbm90
IHJ1bm5pbmcuDQo+PiArDQo+PiArRXZlbnQgY2hhbm5lbCBjb21tdW5pY2F0aW9uIHdpbGwgYmUg
ZXN0YWJsaXNoZWQgc3RhdGljYWxseSBiZXR3ZWVuIHR3byBkb21VDQo+PiArZ3Vlc3RzIGJlZm9y
ZSB1bnBhdXNpbmcgdGhlIGRvbWFpbnMgYWZ0ZXIgZG9tYWluIGNyZWF0aW9uLiBFdmVudCBjaGFu
bmVsDQo+PiArY29ubmVjdGlvbiBpbmZvcm1hdGlvbiBiZXR3ZWVuIGRvbVVzIHdpbGwgYmUgcGFz
c2VkIHRvIFhFTiB2aWEgZGV2aWNlIHRyZWUNCj4+ICtub2RlLg0KPj4gKw0KPj4gK1VuZGVyIHRo
ZSAvY2hvc2VuIG5vZGUsIHRoZXJlIG5lZWRzIHRvIGJlIHN1YiBub2RlcyB3aXRoIGNvbXBhdGli
bGUNCj4+ICsieGVuLGV2dGNobiIgdGhhdCBkZXNjaWJlcyB0aGUgZXZlbnQgY2hhbm5lbCBjb25u
ZWN0aW9uIGJldHdlZW4gdHdvIGRvbVVzLg0KPj4gKw0KPj4gK1RoZSBldmVudCBjaGFubmVsIHN1
Yi1ub2RlIGhhcyB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6DQo+PiArDQo+PiArLSBjb21wYXRp
YmxlDQo+PiArDQo+PiArICAgICJ4ZW4sZXZ0Y2huIg0KPj4gKw0KPj4gKy0geGVuLGV2dGNobg0K
Pj4gKw0KPj4gKyAgICBUaGUgcHJvcGVydHkgaXMgZm91ciBudW1iZXJzIG9mIHR1cGxlcyBvZg0K
Pj4gKyAgICAobG9jYWwtcG9ydC1kb21VMSxkb21VMS1waGFuZGxlLGxvY2FsLXBvcnQtZG9tVTIs
ZG9tVTItcGhhbmRsZSkgd2hlcmU6DQo+IA0KPiBOaXQ6IEkgdGhpbmsgeW91IG1lYW4gInR1cGxl
cyBvZiBmb3VyIG51bWJlcnMiPw0KDQpZZXMsIHlvdSBhcmUgcmlnaHQgSSB3aWxsIGZpeCB0aGlz
Lg0KPiANCj4+ICsgICAgbG9jYWwtcG9ydC1kb21VMSBpcyBhbiBpbnRlZ2VyIHZhbHVlIHRoYXQg
d2lsbCBiZSB1c2VkIHRvIGFsbG9jdGUgbG9jYWwNCj4+ICsgICAgcG9ydCBmb3IgZG9tVTEgdG8g
c2VuZCBhbiBldmVudCBub3RpZmljYXRpb24gdG8gdGhlIHJlbW90ZSBkb21haW4uDQo+PiArDQo+
PiArICAgIGRvbVUxLXBoYW5kbGUgaXMgYSBzaW5nbGUgcGhhbmRsZSB0byBhbiBkb21haW4gdG8g
d2hpY2ggbG9jYWwtcG9ydC1kb21VMQ0KPj4gKyAgICB3aWxsIGJlIGFsbG9jYXRlZC4NCj4+ICsN
Cj4+ICsgICAgbG9jYWwtcG9ydC1kb21VMiBpcyBhbiBpbnRlZ2VyIHZhbHVlIHRoYXQgd2lsbCBi
ZSB1c2VkIHRvIGFsbG9jdGUgbG9jYWwNCj4+ICsgICAgcG9ydCBmb3IgZG9tVTIgdG8gc2VuZCBh
biBldmVudCBub3RpZmljYXRpb24gdG8gdGhlIHJlbW90ZSBkb21haW4uDQo+PiArDQo+PiArICAg
IGRvbVUyLXBoYW5kbGUgaXMgYSBzaW5nbGUgcGhhbmRsZSB0byBhbiBkb21haW4gdG8gd2hpY2gg
bG9jYWwtcG9ydC1kb21VMg0KPj4gKyAgICB3aWxsIGJlIGFsbG9jYXRlZC4NCj4+ICsNCj4+ICtF
eGFtcGxlOg0KPj4gKw0KPj4gKyAgICBjaG9zZW4gew0KPj4gKyAgICAgICAgLi4uLg0KPj4gKw0K
Pj4gKyAgICAgICAgZG9tVTE6IGRvbVUxIHsNCj4+ICsgICAgICAgICAgICAuLi4uLi4NCj4+ICsg
ICAgICAgIH07DQo+PiArDQo+PiArICAgICAgICBkb21VMjogZG9tVTIgew0KPj4gKyAgICAgICAg
ICAgIC4uLi4uLg0KPj4gKyAgICAgICAgfTsNCj4+ICsNCj4+ICsgICAgICAgIGV2dGNobkAxIHsN
Cj4+ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gInhlbixldnRjaG4iOw0KPj4gKyAgICAgICAg
ICAgIHhlbixldnRjaG4gPSA8MHhhICZkb21VMSAweGIgJmRvbVUyPjsNCj4+ICsgICAgICAgIH07
DQo+PiArDQo+PiArICAgICAgICBldnRjaG5AMiB7DQo+PiArICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJ4ZW4sZXZ0Y2huIjsNCj4+ICsgICAgICAgICAgICB4ZW4sZXZ0Y2huID0gPDB4YyAmZG9t
VTEgMHhkICZkb21VMj47DQo+PiArICAgICAgICB9Ow0KPj4gKyAgICB9Ow0KPj4gKw0KPj4gK0lu
IGFib3ZlIGV4YW1wbGUgdHdvIGV2ZW50IGNoYW5uZWwgY29tdW5pY2F0aW9uIHdpbGwgYmUgZXN0
YWJsaXNoZWQgYmV0d2Vlbg0KPj4gK2RvbVUxIGFuZCBkb21VMi4NCj4+ICsNCj4+ICsgICAgZG9t
VTEgKHBvcnQgMHhhKSA8LS0tLS0tLS0tLS0tLS0tLS0+IGRvbVUyIChwb3J0IDB4YikNCj4+ICsg
ICAgZG9tVTEgKHBvcnQgMHhjKSA8LS0tLS0tLS0tLS0tLS0tLS0+IGRvbVUyIChwb3J0IDB4ZCkN
Cj4+ICsNCj4+ICtkb21VMSBhbmQgZG9tVTIgY2FuIHNlbmQgdGhlIHNpZ25hbCB0byByZW1vdGUg
ZG9tYWluIHZpYSBoeXBlcmNhbGwNCj4+ICtFVlRDSE5PUF9zZW5kKC4pIG9uIGxvY2FsIHBvcnQu
DQo+IA0KPiBIb3cgZG8gdGhlIERvbVUtcyBsZWFybiBvZiB0aGVzZSBwb3J0cz8gSSBndWVzcyBp
bmZvcm1hdGlvbiBpcyB0byBiZQ0KPiBleHRyYWN0ZWQgaW50byB0aGVpciBpbmRpdmlkdWFsIERU
IHJlcHJlc2VudGF0aW9uLCBidXQgdGhpcyBjb3VsZCBkbw0KPiB3aXRoIHNwZWxsaW5nIG91dCwg
aW5jbHVkaW5nIGhvdyB0aG9zZSBub2RlcyAob3IgaG93ZXZlciB0aGUgZGF0YQ0KPiBpdGVtcyBh
cmUgY2FsbGVkIGluIERUKSB3b3VsZCBiZSBuYW1lZCBhbmQgd2hhdCBkYXRhIHRoZXkgd291bGQN
Cj4gY29udGFpbi4NCg0KVGhlcmUgYXJlIHR3byBvcHRpb25zIGhvdyB0aGUgZ3Vlc3QgbGVhcm4g
dGhlIGxvY2FsIHBvcnRzLg0KDQoxLiBEb2N1bWVudCB0aGUgZXZlbnQgY2hhbm5lbCBjb25uZWN0
aW9uIGluZm9ybWF0aW9uIGZvciB0aGUgZW5kLXVzZXIgaW4NCiAgICB0aGUgZW5kIHVzZXIgZG9j
dW1lbnRhdGlvbi4gVGhlIGludGVncmF0b3Igd2lsbCBtYWtlIHVzZSBvZiB0aGUgbG9jYWwgcG9y
dCBpbmZvcm1hdGlvbg0KICAgIHRvIHdyaXRlIGEgdXNlcnNwYWNlIGFwcGxpY2F0aW9uIHRvIHNl
bmQgZXZlbnRzIHRvIHRoZSByZW1vdGUgZG9tYWluLiBGb3IgTGludXgsIGluIHRoaXMNCiAgICBj
YXNlLCB3ZSBuZWVkIHRvIG1vZGlmeSB0aGUgY3VycmVudCAgImRyaXZlcnMveGVuL2V2dGNobi5j
4oCdIHRvIGluY2x1ZGUgYSBuZXcgSU9DVEwgdG8NCiAgICBiaW5kIHRoZSBsb2NhbCBwb3J0IHRv
IHRoZSB1c2VyIGFuZCBzZXQgdXAgdGhlIGludGVycnVwdCBoYW5kbGVyLiBUaGUgYXBwbGljYXRp
b24gY2FuIHVzZSB0aGUgaW9jdGwNCiAgICBJT0NUTF9TVEFUSUNfRVZUQ0hOX0JJTkQgYW5kIElP
Q1RMX0VWVENITl9OT1RJRlkgdG8gbm90aWZ5IHRoZSByZW1vdGUgZG9tYWluLg0KDQoJY2FzZSBJ
T0NUTF9TVEFUSUNfRVZUQ0hOX0JJTkQ6IHsNCgkJc3RydWN0IGlvY3RsX2V2dGNobl9iaW5kIGJp
bmQ7DQoNCgkJcmMgPSAtRUZBVUxUOw0KCQlpZiAoY29weV9mcm9tX3VzZXIoJmJpbmQsIHVhcmcs
IHNpemVvZihiaW5kKSkpDQoJCQlicmVhazsNCg0KCQlyYyA9IGV2dGNobl9iaW5kX3RvX3VzZXIo
dSwgYmluZC5wb3J0KTsNCgkJZXZ0Y2huX2JpbmRfaW50ZXJkb21fbmV4dF92Y3B1KGJpbmQucG9y
dCk7DQoJCWJyZWFrOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIA0KICAgIH0NCg0KICAgV2UgY2FuIGFsc28gaW1wbGVtZW50
IHRoZSBuZXcgaHlwZXJjYWxsIGZvciBlcnJvciBjaGVja2luZyBpZiB0aGUgcG9ydCByZXF1ZXN0
ZWQgZnJvbSB1c2VyIGFwcGxpY2F0aW9uIGlzIHN0YXRpYyBwb3J0DQogICBhbmQgYWxyZWFkeSBj
cmVhdGVkIGluIFhFTi4NCg0KMi4gQ3JlYXRlIHRoZSBEVCBub2RlIGZvciBndWVzdCBhbmQgcGFz
cyB0aGUgbG9jYWwgcG9ydCBpbmZvcm1hdGlvbiB0byBndWVzdC4gR3Vlc3QgY2FuDQogICAgbWFr
ZSB1c2UgdGhpcyBEVCBub2RlIHRvIGNyZWF0ZSBkZXZpY2Ugbm9kZSDigJwgL2Rldi94ZW4vZXZl
bnRjaG4tbG9jYWxwb3J0IiBvciBzb21ldGhpbmcgZWxzZSBpbiBMaW51eC4NCiAgICBJbiB0aGlz
IGNhc2Ugd2UgbWF5IG5lZWQgdG8gd3JpdGUgdGhlIG5ldyBkcml2ZXIgaW4gbGludXggdG8gc3Vw
cG9ydCB0aGlzLg0KIA0KPiANCj4gRnVydGhlciBJIGFzc3VtZSB0aGlzIGJlaW5nIGVuY29kZWQg
aW4gdGhlIERUIHBhc3NlZCB0byBYZW4gbWVhbnMNCj4gaW1wbGljaXQgY29uc2VudCBvZiB0aGUg
YWRtaW4gc2VjdXJpdHktd2lzZS4gSWYgc28sIHRoaXMgY291bGQgZG8NCj4gd2l0aCBtYWtpbmcg
ZXhwbGljaXQgYXMgd2VsbC4gSWYgbm90LCB0aGUgc2VjdXJpdHkgb2YgdGhpcyB3b3VsZA0KPiBu
ZWVkIGRpc2N1c3NpbmcgaW4gZXZlbiBicm9hZGVyIGEgc2NvcGUuDQoNClllcywgaXQgaXMgcmVz
cG9uc2liaWxpdHkgb2YgdGhlIGFkbWluIHRvIHRha2UgY2FyZSBvZiBzZWN1cml0eSB3aGVuIA0K
ZGVmaW5pbmcgdGhlIGV2ZW50IGNoYW5uZWwgaW4gRFQuDQo+IA0KPiBGaW5hbGx5IEkgYXNzdW1l
IHN1Y2ggY2hhbm5lbHMgYXJlIGVzdGFibGlzaGVkIGZ1bGx5IGJvdW5kLCBpLmUuDQo+IHRoZXJl
J3Mgbm90aGluZyB0byBkbyBieSBndWVzdHMgaW4gb3JkZXIgdG8gZXN0YWJsaXNoIGNvbW11bmlj
YXRpb24uDQo+IFRoaXMgaXMgYW5vdGhlciBhc3BlY3QgdGhhdCB3b3VsZCBpbW8gYmV0dGVyIGJl
IHNhaWQgZXhwbGljaXRseS4NCj4gDQoNClllcywgeW91IGFyZSByaWdodCBldmVudCBjaGFubmVs
IHdpbGwgYmUgY3JlYXRlZCBhbmQgZXN0YWJsaXNoZWQgYmVmb3JlaGFuZCBpbiBYRU4gYmVmb3Jl
DQpndWVzdHMgc3RhcnRlZC4gVGhlIGd1ZXN0IGRvZXNu4oCZdCBuZWVkIHRvIGRvIGFueSBvcGVy
YXRpb24gdG8gZXN0YWJsaXNoIGEgY29ubmVjdGlvbi4gR3Vlc3QgDQpvbmx5IG5lZWRzIGh5cGVy
Y2FsbCBFVlRDSE5PUF9zZW5kKGxvY2FsIHBvcnQpIHRvIHNlbmQgbm90aWZpY2F0aW9ucyB0byB0
aGUgcmVtb3RlIGd1ZXN0Lg0KDQpSZWdhcmRzLA0KUmFodWwNCj4gSmFuDQoNCg==

