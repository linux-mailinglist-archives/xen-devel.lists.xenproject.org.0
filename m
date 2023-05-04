Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662096F6CBD
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 15:15:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529741.824463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYnR-00069L-M6; Thu, 04 May 2023 13:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529741.824463; Thu, 04 May 2023 13:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puYnR-00067Q-I1; Thu, 04 May 2023 13:14:57 +0000
Received: by outflank-mailman (input) for mailman id 529741;
 Thu, 04 May 2023 13:14:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VaLI=AZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1puYnP-00067C-Se
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 13:14:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7ef1a09-ea7d-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 15:14:53 +0200 (CEST)
Received: from DB6PR0301CA0043.eurprd03.prod.outlook.com (2603:10a6:4:54::11)
 by AS8PR08MB7306.eurprd08.prod.outlook.com (2603:10a6:20b:441::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25; Thu, 4 May
 2023 13:14:49 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::67) by DB6PR0301CA0043.outlook.office365.com
 (2603:10a6:4:54::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21 via Frontend
 Transport; Thu, 4 May 2023 13:14:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22 via Frontend Transport; Thu, 4 May 2023 13:14:49 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Thu, 04 May 2023 13:14:49 +0000
Received: from e843eb7c2d31.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AF0832D5-E534-47FB-AD98-B11EF29AF27D.1; 
 Thu, 04 May 2023 13:14:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e843eb7c2d31.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 13:14:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7399.eurprd08.prod.outlook.com (2603:10a6:10:371::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Thu, 4 May
 2023 13:14:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::9283:e527:bed8:ab23]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::9283:e527:bed8:ab23%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 13:14:35 +0000
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
X-Inumbo-ID: a7ef1a09-ea7d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roH7IhSKNfhABtOeE1XmF3YdKI+Xv0DCyrgQ3HF6/MI=;
 b=Tq5C7d4Qi7OxmnLzcn9wfN9nV3v+hJnjt06Fl7KfRYpZ1QuhZQJZSaf0KH8MHx1174eMVL3OtsobNCuealxdk4EKrf/u3uXYdouwpWZLUWuhxK/Grsl0lo1yvUhgtYJzOvwXh3eNZBOzmC0JVl/L6gMNhKuXYBaklWAb32rQ5s0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c0a31e43e31591e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaUfYwiJc684TKhFtkWq6kGX71yD7YzPA5Nhi31uCuB5BuphFSD699gmbSebSW5Feag90DJEY8HvKd+jPnC8AWSLypruVVp0D20S2fpAW2DJ/Tme2TMNKu6lvOFHuhjPueKf/lNaM2YENq2lkW2xdMKIPoMv2B4tIg64Shp8RY4WL2JSUXKwJyoJg3PlG8NRxUfr42YLOjggrrnbOgT1pKif2LP8UiBrhuf2PE4DeFjsCVWut0SQgYwjl0OqAqAoKAWdm6basN0lNFolbgIDosGz9p7RxOrfgtu0TiZbbd/Af0N0uv8J4D0d/Z7LHxHf7Otz/AJ1ujV3oT02QxpHOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roH7IhSKNfhABtOeE1XmF3YdKI+Xv0DCyrgQ3HF6/MI=;
 b=UKvX6WVAagqDjeve7zt9i2EiLSdxUGZZo1AkM1623gIqzIIaSX8qz0pN35qWZwtVLaCFnubkTbDtAkWe0vU4dTm1GsHyuHVH9f0rBSAtZZMBCYPo7eKGHCdpX9JRHZZrlHr0wPS97x7AO58lNP/BDRTpSFFZJmqaGq2znr6FchCcIEB9qiUoP9PoUBozVqX+t9hKfyEB6210HW+nWZNTUO+9AINekwzlwyN+CGkNv1INloiHDnGWSNgzIcZl/+akbm8PozzuMAesZsWN23YFFkh1kptAqW0wockSoPbLYvu1gvsFrAk2Ywoik6yPF2G0Sh2QY6dpWuSWCVDUBussfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roH7IhSKNfhABtOeE1XmF3YdKI+Xv0DCyrgQ3HF6/MI=;
 b=Tq5C7d4Qi7OxmnLzcn9wfN9nV3v+hJnjt06Fl7KfRYpZ1QuhZQJZSaf0KH8MHx1174eMVL3OtsobNCuealxdk4EKrf/u3uXYdouwpWZLUWuhxK/Grsl0lo1yvUhgtYJzOvwXh3eNZBOzmC0JVl/L6gMNhKuXYBaklWAb32rQ5s0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
	Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jens Wiklander <jens.wiklander@linaro.org>
Subject: Re: [XEN PATCH v8 02/22] xen/arm: tee: add a primitive FF-A mediator
Thread-Topic: [XEN PATCH v8 02/22] xen/arm: tee: add a primitive FF-A mediator
Thread-Index: AQHZbdfHy/Y46nL9n0ej3opYe7XQ5q8pKpqAgAAQ9oCAAUdZgIAftheA
Date: Thu, 4 May 2023 13:14:33 +0000
Message-ID: <BF745983-F062-4237-B6B9-E3455E72233E@arm.com>
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-3-jens.wiklander@linaro.org>
 <ad1d5ebd-38e5-bab9-24ac-6facc8ccb95c@xen.org>
 <d7f18393-262b-f2b1-9af3-a371dae75994@citrix.com>
 <CAHUa44FYGeA-knf2HMR6t4B_q3JZ_WuEq9fpTmD2_sJLMwPoQw@mail.gmail.com>
In-Reply-To:
 <CAHUa44FYGeA-knf2HMR6t4B_q3JZ_WuEq9fpTmD2_sJLMwPoQw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB7399:EE_|DBAEUR03FT032:EE_|AS8PR08MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: a55a6ad9-75f6-4337-4b4f-08db4ca18a11
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Y7qKgTZ3ZQo3ElQhCLg+WiDHM8nyVwtz+rMDzhWzycgrHxtcKhWuQnWf4WhyyFs2+3vCJFuU+gluORp9TtQolgYPI2kOisld8yR0p7zpa1mvI6WNaGrIB6ItlpqIkUCmgTgT32ay4rZAZoMY+wraomatC66ooCt0LTVXrketbnRJ5cACxeP2TKxQJ2QUZOSrRjo8Ty14U3kC0bEsr948kJdxMFyy1o+bjSAq5w1Ik2RFhvBeL89lQ5slGloIEV6Y4sow//H9ovoByzg/ietZZiNs5uLR3ZIOgaKTHHdHApk1SN1oroXkRhCI/PbNYrcBTAFCqYYFfy/s3/oz9/nn6OH9I90vxEIL472DmegiAcYckttDuuMfT9x2dM+KOlHIshblN+e/ZQA+ZwVENul3IuXRaLx6GL/YGykpTAjyp8Zlr5bpj9aQzA3CnCmVHjuQLGSCnthjN65IBP6F6zuBcb4Nh20c5QrZ4fmcePVDggUcJRVIz804Gq12h8muKMqlrvlQuwU7QTIKjfwft732j4YO09pC/4P1v/KMxKqZVgxGNDRuQcDzAqXvCr+PQ6FpLhpR0E1FGibHK74AbGnycoToMRIViJ2bXM7MIafak1hsHNfw6bwGn0trmiTV86os3alYj0PWWSsu3Ls3jEoDrA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199021)(6486002)(186003)(71200400001)(83380400001)(6916009)(26005)(6506007)(6512007)(53546011)(54906003)(36756003)(2616005)(33656002)(478600001)(64756008)(66476007)(66446008)(76116006)(91956017)(66556008)(66946007)(316002)(122000001)(8676002)(38100700002)(8936002)(5660300002)(41300700001)(66899021)(86362001)(38070700005)(2906002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A3759B7A564D934B9E145235EFB31651@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7399
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c029c3c3-b624-4129-eaec-08db4ca180a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p9KoFi0dSxhBLDaEUz8086XVhxlMaxiEamJ0oEd3BSkabKcWXRoa6Pru4vkwkIQmIPMnHciaTpUXtp551wWCsOYHSWuIjQywwPzWvQVOjV0BSocWl0oY+kPszBS2tBcEFuUkB39MvLWG2F8kBPWk/z0dOyLewHVw2EF+OYktbeYAO7AvedOnfiixjLLwJEM6JLfPhsz9KUANXldCRTKmdC0ers/CiuvNTTEa2OrLEAiDQvUHX0vDbyYzaA6v528tWLystDh9UX5mzTJ6iVEvzd3IYsH9X0JPGSY0rq9Izan6+ATIWDqpIidRimHAL+DeQQr99GXeC0/CvY9GTFpuRMMG+dmKK7G5qn04M8niJFJ+2m7HPsU/jOcqHIavdQv6ndknS4xBqhhhPfSZK1KtBz6ELUUIIjcr81D1KRDPAmc40Jl1sMO9mtql0IUMURjLQL/UXkwLP8R8cqu0QlXMz4qIPgLp6+DmHxRhwzQcTwuTUNI0kEDj6+TL2f85Yqaq0VgQoLVRSe0JMz+C8oipGtuZ/4dcC1GGdcMVpV8bRFSSKHOwPX1qTIJDrfSq3JyM7hJ7FtjXqK2xVklgio+aq1PoYLFJBF2XZ5hWhfKDn1EZ1TSMuey/jAYnwgNLPcEQ5b2RqLDZR4NkZHUrOedE1E+PRWnCeOEQo9TkRLYn0PYkuavjSF93KWFFTO4t/WMnJCzqQNjs1RP+ghcix4am4lj7RPfAnATO8dTdgpOKxOo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(66899021)(70206006)(4326008)(478600001)(70586007)(6486002)(316002)(54906003)(33656002)(36756003)(86362001)(336012)(83380400001)(53546011)(107886003)(2616005)(6512007)(6506007)(36860700001)(26005)(47076005)(186003)(8676002)(41300700001)(6862004)(8936002)(2906002)(5660300002)(82310400005)(40480700001)(82740400003)(356005)(81166007)(34020700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 13:14:49.2891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a55a6ad9-75f6-4337-4b4f-08db4ca18a11
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7306

SGkgQW5kcmV3LA0KDQo+IE9uIDE0IEFwciAyMDIzLCBhdCAxMDo1OCwgSmVucyBXaWtsYW5kZXIg
PGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiBU
aHUsIEFwciAxMywgMjAyMyBhdCAzOjI34oCvUE0gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+PiANCj4+IE9uIDEzLzA0LzIwMjMgMToyNiBwbSwgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPj4+PiArc3RhdGljIGludCBmZmFfZG9tYWluX2luaXQoc3RydWN0
IGRvbWFpbiAqZCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBzdHJ1Y3QgZmZhX2N0eCAqY3R4Ow0KPj4+
PiArDQo+Pj4+ICsgICAgaWYgKCAhZmZhX3ZlcnNpb24gKQ0KPj4+PiArICAgICAgICByZXR1cm4g
LUVOT0RFVjsNCj4+Pj4gKw0KPj4+PiArICAgIGN0eCA9IHh6YWxsb2Moc3RydWN0IGZmYV9jdHgp
Ow0KPj4+PiArICAgIGlmICggIWN0eCApDQo+Pj4+ICsgICAgICAgIHJldHVybiAtRU5PTUVNOw0K
Pj4+PiArDQo+Pj4+ICsgICAgZC0+YXJjaC50ZWUgPSBjdHg7DQo+Pj4+ICsNCj4+Pj4gKyAgICBy
ZXR1cm4gMDsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiArLyogVGhpcyBmdW5jdGlvbiBpcyBzdXBw
b3NlZCB0byB1bmRvIHdoYXQgZmZhX2RvbWFpbl9pbml0KCkgaGFzIGRvbmUgKi8NCj4+PiANCj4+
PiBJIHRoaW5rIHRoZXJlIGlzIGEgcHJvYmxlbSBpbiB0aGUgVEVFIGZyYW1ld29yay4gVGhlIGNh
bGxiYWNrDQo+Pj4gLnJlbGlucXVpc2hfcmVzb3VyY2VzKCkgd2lsbCBub3QgYmUgY2FsbGVkIGlm
IGRvbWFpbl9jcmVhdGUoKSBmYWlsZWQuDQo+Pj4gU28gdGhpcyB3aWxsIHJlc3VsdCB0byBhIG1l
bW9yeSBsZWFrLg0KPj4+IA0KPj4+IFdlIGFsc28gY2FuJ3QgY2FsbCAucmVsaW5xdWlzaF9yZXNv
dXJjZXMoKSBvbiBlYXJseSBkb21haW4gY3JlYXRpb24NCj4+PiBmYWlsdXJlIGJlY2F1c2UgcmVs
aW5xdWlzaGluZyByZXNvdXJjZXMgY2FuIHRha2UgdGltZSBhbmQgdGhlcmVmb3JlDQo+Pj4gbmVl
ZHMgdG8gYmUgcHJlZW1wdGlibGUuDQo+Pj4gDQo+Pj4gU28gSSB0aGluayB3ZSBuZWVkIHRvIGlu
dHJvZHVjZSBhIG5ldyBjYWxsYmFjayBkb21haW5fZnJlZSgpIHRoYXQgd2lsbA0KPj4+IGJlIGNh
bGxlZCBhcmNoX2RvbWFpbl9kZXN0cm95KCkuIElzIHRoaXMgc29tZXRoaW5nIHlvdSBjYW4gbG9v
ayBhdD8NCj4+IA0KPj4gDQo+PiBDbGVhbnVwIG9mIGFuIGVhcmx5IGRvbWFpbiBjcmVhdGlvbiBm
YWlsdXJlLCBob3dldmVyIHlvdSBkbyBpdCwgaXMgYXQNCj4+IG1vc3QgInRoZSBzYW1lIGFtb3Vu
dCBvZiB0aW1lIGFnYWluIi4gIEl0IGNhbm5vdCAoYWJzZW50IG9mIGRldmVsb3BtZW50DQo+PiBl
cnJvcnMpIHRha2UgdGhlIHNhbWUgaW5kZWZpbml0ZSB0aW1lIHBlcmlvZHMgb2YgdGltZSB0aGF0
IGEgZnVsbA0KPj4gZG9tYWluX2Rlc3Ryb3koKSBjYW4uDQo+PiANCj4+IFRoZSBlcnJvciBwYXRo
IGluIGRvbWFpbl9jcmVhdGUoKSBleHBsaWNpdGx5IGRvZXMgY2FsbCBkb21haW5fdGVhcmRvd24o
KQ0KPj4gc28gd2UgY2FuIChldmVudHVhbGx5KSBwdXJnZSB0aGVzZSBkdXBsaWNhdGUgY2xlYW51
cCBwYXRocy4gIFRoZXJlIGFyZQ0KPj4gZmFyIHRvbyBtYW55IGVhc3kgZXJyb3JzIHRvIGJlIG1h
ZGUgd2hpY2ggb2NjdXIgZnJvbSBoYXZpbmcgc3BsaXQNCj4+IGNsZWFudXAsIGFuZCB3ZSBoYXZl
IGhhZCB0byBpc3N1ZSBYU0FzIGluIHRoZSBwYXN0IHRvIGFkZHJlc3Mgc29tZSBvZg0KPj4gdGhl
bS4gIChIZW5jZSB0aGUgZWZmb3J0IHRvIHRyeSBhbmQgc3BlY2lmaWNhbGx5IGNoYW5nZSB0aGlu
Z3MsIGFuZA0KPj4gcmVtb3ZlIHRoZSBhYmlsaXR5IHRvIGludHJvZHVjZSB0aGUgZXJyb3JzIGlu
IHRoZSBmaXJzdCBwbGFjZS4pDQo+PiANCj4+IA0KPj4gUmlnaHQgbm93LCBpdCBpcyBzcGVjaWZp
Y2FsbHkgYXdrd2FyZCB0byBkbyB0aGlzIG5pY2VseSBiZWNhdXNlDQo+PiBkb21haW5fdGVhcmRv
d24oKSBkb2Vzbid0IGNhbGwgaW50byBhIHN1aXRhYmxlIGFyY2ggaG9vay4NCj4+IA0KPj4gSU1P
IHRoZSBiZXN0IG9wdGlvbiBoZXJlIGlzIGV4dGVuZCBkb21haW5fdGVhcmRvd24oKSB3aXRoIGFu
DQo+PiBhcmNoX2RvbWFpbl90ZWFyZG93bigpIHN0YXRlL2hvb2ssIGFuZCB3aXJlIGluIHRoZSBU
RUUgY2xlYW51cCBwYXRoIGludG8NCj4+IHRoaXMgdG9vLg0KPj4gDQo+PiBBbnl0aGluZyBlbHNl
IGlzIGV4cGxpY2l0bHkgYWRkaW5nIHRvIHRlY2huaWNhbCBkZWJ0IHRoYXQgSSAob3Igc29tZW9u
ZQ0KPj4gZWxzZSkgaXMgZ29pbmcgdG8gaGF2ZSB0byByZXZlcnQgZnVydGhlciBkb3duIHRoZSBs
aW5lLg0KPj4gDQo+PiBJZiB5b3Ugd2FudCwgSSBhbSBoYXBweSB0byBwcm90b3R5cGUgdGhlIGFy
Y2hfZG9tYWluX3RlYXJkb3duKCkgYml0IG9mDQo+PiB0aGUgZml4LCBidXQgSSB3aWxsIGhhdmUg
dG8gZGVmZXIgd2lyaW5nIGluIHRoZSBURUUgcGFydCB0byBzb21lb25lDQo+PiBjYXBhYmxlIG9m
IHRlc3RpbmcgaXQuDQo+IA0KPiBZb3UncmUgbW9yZSB0aGFuIHdlbGNvbWUgdG8gcHJvdG90eXBl
IHRoZSBmaXgsIEkgY2FuIHRlc3QgaXQgYW5kIGFkZA0KPiBpdCB0byB0aGUgbmV4dCB2ZXJzaW9u
IG9mIHRoZSBwYXRjaCBzZXQgd2hlbiB3ZSdyZSBoYXBweSB3aXRoIHRoZQ0KPiByZXN1bHQuDQoN
Cg0KQ291bGQgeW91IHRlbGwgdXMgaWYgeW91IGFyZSBzdGlsbCBoYXBweSB0byB3b3JrIG9uIHRo
ZSBwcm90b3R5cGUgZm9yDQphcmNoX2RvbWFpbl90ZWFyZG93biBhbmQgd2hlbiB5b3Ugd291bGQg
YmUgYWJsZSB0byBnaXZlIGEgZmlyc3QgcHJvdG90eXBlID8NCg0KUmVnYXJkcw0KQmVydHJhbmQN
Cg0K

