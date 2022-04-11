Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D815D4FB9AD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 12:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302912.516795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrJW-0003UY-Ag; Mon, 11 Apr 2022 10:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302912.516795; Mon, 11 Apr 2022 10:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrJW-0003RA-7A; Mon, 11 Apr 2022 10:30:30 +0000
Received: by outflank-mailman (input) for mailman id 302912;
 Mon, 11 Apr 2022 10:30:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R/O6=UV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ndrJU-0001w4-Be
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 10:30:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on060c.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66bf093a-b982-11ec-a405-831a346695d4;
 Mon, 11 Apr 2022 12:30:26 +0200 (CEST)
Received: from AS9PR0301CA0033.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::20) by PAXPR08MB7645.eurprd08.prod.outlook.com
 (2603:10a6:102:240::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 11 Apr
 2022 10:30:20 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::28) by AS9PR0301CA0033.outlook.office365.com
 (2603:10a6:20b:469::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29 via Frontend
 Transport; Mon, 11 Apr 2022 10:30:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.21 via Frontend Transport; Mon, 11 Apr 2022 10:30:19 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Mon, 11 Apr 2022 10:30:18 +0000
Received: from 2b38f63b04e9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F52459F0-C8B3-4E88-86A1-A7F01B4DE102.1; 
 Mon, 11 Apr 2022 10:30:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2b38f63b04e9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Apr 2022 10:30:12 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by HE1PR08MB2794.eurprd08.prod.outlook.com (2603:10a6:7:31::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 10:30:08 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::8cab:4b29:9cb1:580a%4]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 10:30:08 +0000
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
X-Inumbo-ID: 66bf093a-b982-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAyjsZx5cmju+dituP6BVFgtIbgbazbp+jdCt1AZX04=;
 b=yGS8qwBIwGEkSIsB/DHjEGW7OA3hs5+Uazl6dIaIUWtTTVB8o4uMXNBo/EkNSJgxyyk0MZVUL7LAsz90DN7JpykgjaVt1pu7y0pxa1A9ydIDg2RdFbPIGldym6E7J0TKnjALDetctPWN5I+AkD/OUbAnnp5eyJfFp94qijYnyGs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuiZUlfueD5MP8XYQWU3QMllTY7DiKEEhbzIQwphQ1pcCkaIHVSQWpwC3DxbddkRUD929vX0A/Sp6F4bVnX1vPEwfJ2sZD9I3CeL929U3E0bSRgPTD25KMXgYcalh/FsQEJv9jrBWA+4JO8xPTU8E7bw8y0YQYxh/udN4BC3wSJ6ooPDaaMq5ZliD6R0j2/8wx03/MFh5Ayylr98xPSOrEaUTLJxUov2ZzVm1kDbqXodjYar9Z5hzXQeKL+h0ynQQopGZBcEcDvUpluWyInIM4WyL9iqgPbaL2u3gnwI5h73LTe1NEODW3BwcjYbJZJBjlS3n8axbg5P4vUQz3mRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAyjsZx5cmju+dituP6BVFgtIbgbazbp+jdCt1AZX04=;
 b=QldxOjqShHHyzjIYl4nwXBZI5Xp43xZE8UcZ5N3KGWOUM7SITP5XwAU3XY2Orf6NxIUgx12/t5XUTdYmCV3NWEvwf3aGlOLoTJ062YEdgsbI1uDaTyLKPnp9lsfIgjbj2Y653uzIobJ/D8sPanehYjBCW9rY+7CDQxB7mA6q/RAdKM3tcB3cdg2D4wl3qAsq5nkPYc7pl6gL7eAwDLuO6+HQOrFw19hGhdkSEaEdN9gENgqDaabXCLUsn3ORtxjvlG+opBEAeWOclAMB+R+CJQy0idtxbtFVM/Mkwj7koDSaV5B7AWBAB9looiEKIXf0b3I3yPhUe8ohG2sc7U7jBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAyjsZx5cmju+dituP6BVFgtIbgbazbp+jdCt1AZX04=;
 b=yGS8qwBIwGEkSIsB/DHjEGW7OA3hs5+Uazl6dIaIUWtTTVB8o4uMXNBo/EkNSJgxyyk0MZVUL7LAsz90DN7JpykgjaVt1pu7y0pxa1A9ydIDg2RdFbPIGldym6E7J0TKnjALDetctPWN5I+AkD/OUbAnnp5eyJfFp94qijYnyGs=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: RE: Ping: [PATCH v4 1/8] x86/boot: make "vga=current" work with
 graphics modes
Thread-Topic: Ping: [PATCH v4 1/8] x86/boot: make "vga=current" work with
 graphics modes
Thread-Index:
 AQHYROPtcJBl4i95okO8HDmAStvYzazhCTMAgAHwwACAB49yAIAAA21AgAADKoCAAABk4A==
Date: Mon, 11 Apr 2022 10:30:07 +0000
Message-ID:
 <PA4PR08MB6253B284F858ABC28613E98E92EA9@PA4PR08MB6253.eurprd08.prod.outlook.com>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <3fb7f3e9-a6cf-4f8e-1141-100848b1bdd0@suse.com>
 <YkwBpKcyrnuXyNPa@Air-de-Roger>
 <65d3068b-fde5-951b-9a60-4ba1dcd89a49@suse.com>
 <01992254-1a4d-850d-78c5-7e4ee738cffe@suse.com>
 <PA4PR08MB6253CEB380333171F2829F7492EA9@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <c940dfcc-322d-afa6-7f30-bc0a1b981581@suse.com>
In-Reply-To: <c940dfcc-322d-afa6-7f30-bc0a1b981581@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 99F60CF210479742A28BE1764F929C3A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0c82e923-02e0-474f-0acc-08da1ba646e6
x-ms-traffictypediagnostic:
	HE1PR08MB2794:EE_|VE1EUR03FT007:EE_|PAXPR08MB7645:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB76457501E333158E3CD4DD0D92EA9@PAXPR08MB7645.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 BRVRVl3teQzDlKBY/B9ky/wfXU4O6M+aiH/fCaN4qX+BuySgluKllZxiY96qCdlUKgoiZuddPkfMS+RcpqCAmhDT/zRuH32xogjfqBb00G7Ok/+Lxi4XoD5b9wBpV6SwvePGrsW9DFcje/SsECv/9rI2GrkBTEj73pgpwVvCEsGJsXqS4rt/SkfTOQDbd/BOMPUUZSFo4ndnO43qrJ2Kg84E8UmP+kFOA8HTq62RjODbLeluNPlr5wBP1RrFz+skktPLHwAZXmlBOkV8Nc7Upa+AfS8PRjqx37nkfuaKN2MuzWLrpaYSwhyZ7eQm3PTXbhb9KZ0+/6J79ID8qQEYADlCysgC9EQRBOyMzqCybaVWGAk8wOOLi+HcjxAlmpgUhxmRm7Ynjm0rQzdBXoyitH4m4rSiLegsfgKuL0zdcT0GyPyjyWcjL56wL1TAkMexO0y/r442ELdPAvaddG8aq8++sahQ3yBJK+uuB/RRDaKC5uSqxRQDT9zz/VTjH6vkPvj96cUaDehrsVIfI6sSTQVrKgfW0WWIRmvLfCbHtQuufDDdEgAp4JbgdRxkrgm0P1tdIjZ3DMfo5p6QEZPZJQjyXgBgT/q0ldYDb7pEuGdkb5G4MoYP6znHxg7SCiEWkwQYREIo77t+MExgjqJmXOtbYT41ZakW/IEkrtqbt5/d2SorFm6Jp90x5vwwcjvENMTwPYZ7RIaRZEqpLRWUKQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(76116006)(66946007)(5660300002)(55016003)(122000001)(4744005)(8936002)(52536014)(66446008)(64756008)(86362001)(2906002)(38100700002)(38070700005)(7696005)(26005)(66556008)(4326008)(66476007)(186003)(8676002)(83380400001)(9686003)(6506007)(316002)(508600001)(54906003)(6916009)(71200400001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2794
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f897e951-9568-4932-f71a-08da1ba64070
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y1KYsFEFA8bCknmAA1cbrDnhMA+dIJLGz+A0AcHyN7ig4cU3IkicJdkAJt5NwpZmfDgUrLLsqYP5OmK3JW805itkfxYmU6thRN8MZmXa+rKIonbIOuVd6j1MAr8YQFwy+Hyknd9kaWjRD1JQ/n1v9IgQWyeBfsz7W5j8aYBr+a/rmr4tuDMAwiezKzHYolXtez9CxN25ZZSdGzxZAuq6CXVocQh9KVRTl3SnF4EnvEqj+iCoIcoOOkdsK+1JhzLUhWC86YFkTER+K7RquZLadwHpHcsp6n8y4bIo+YVGVi4ahT82uX+InANCFddk+h8gyAUfUy+TfueJKPqKcuwnmHqTac9IxqRHhwc7yBLoi8PzvdbR8GblYW3yFKC8Zf2vorrDPONmyCNxz7dJJ6+CmyvG9pRGM1VlGgFjCnmitqHWLGjDpO0PVWLRZiqicbiJVZ4fcaVD5Di49/AlX7Td5+FD4ncTjV4Tn4rYc5x8S3E1xiPvql4ArGxaKqmY1/T9f5kkVfvC+DiGkvmUhyMIGWt2MH4A20lOMxaJ9ogffLqEXYvHSocRBj4A35ZN/gX6OwdbMpf05T7j5+nQd+tPEGLJDG6dzw1acEc7C0DH9uf6FRjmme3LXkGbSL2qLZQi68oefcLX0XT1+GmLyQeoiTrZcBthqqqckTd4W+ryP/OwytuhbuLXmGXUbOucpMdb
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(47076005)(8676002)(336012)(508600001)(2906002)(83380400001)(33656002)(5660300002)(107886003)(356005)(86362001)(7696005)(6506007)(52536014)(26005)(82310400005)(186003)(8936002)(54906003)(4744005)(9686003)(40460700003)(6862004)(55016003)(36860700001)(81166007)(316002)(70586007)(4326008)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 10:30:19.3411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c82e923-02e0-474f-0acc-08da1ba646e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7645

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiBTaW5jZSB5b3UgYWxzbyBtZW50aW9uZWQgdGhl
IGNoYW5nZWxvZyBlbnRyeSwgSSB3aWxsIHRha2UgYSBub3RlIG9mIHRoaXMNCj4gPiBzZXJpZXMg
YW5kIHdlIGNhbiBoYXZlIGEgZGlzY3Vzc2lvbiBhYm91dCBhZGRpbmcgaXQgd2hlbiB3ZSBkbyB0
aGUNCj4gPiBuZXh0IFhlbiByZWxlYXNlICg0LjE3KS4gV291bGQgdGhhdCBzb3VuZCBvayB3aXRo
IHlvdT8NCj4gDQo+ICJBZGRpbmcgaXQiIHdoZXJlPyBNYXliZSB5b3UgbWVhbiB0byB0aGUgcmVs
ZWFzZSBub3RlcywgYnV0IHRoYXQncyBub3QNCj4gZW50aXJlbHkgY2xlYXIuDQoNClllYWgsIEkg
bWVhbnQgdGhlIHJlbGVhc2Ugbm90ZXMuIFRoYW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoYXQgSSBk
aWQgbm90IHVzZQ0KYWNjdXJhdGUgd29yZGluZy4NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0K
PiANCj4gSmFuDQoNCg==

