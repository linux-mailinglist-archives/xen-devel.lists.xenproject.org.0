Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C067CB7DE
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 03:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617982.961172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYdR-0008Kf-0O; Tue, 17 Oct 2023 01:12:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617982.961172; Tue, 17 Oct 2023 01:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYdQ-0008Hb-Sp; Tue, 17 Oct 2023 01:12:36 +0000
Received: by outflank-mailman (input) for mailman id 617982;
 Tue, 17 Oct 2023 01:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhkS=F7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qsYdP-0008HV-Bc
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 01:12:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4029afb2-6c8a-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 03:12:34 +0200 (CEST)
Received: from AS9PR06CA0122.eurprd06.prod.outlook.com (2603:10a6:20b:467::8)
 by AM9PR08MB6706.eurprd08.prod.outlook.com (2603:10a6:20b:303::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Tue, 17 Oct
 2023 01:12:29 +0000
Received: from AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::b3) by AS9PR06CA0122.outlook.office365.com
 (2603:10a6:20b:467::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Tue, 17 Oct 2023 01:12:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT052.mail.protection.outlook.com (100.127.140.214) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 01:12:29 +0000
Received: ("Tessian outbound 6d14f3380669:v211");
 Tue, 17 Oct 2023 01:12:28 +0000
Received: from 906f395cd9d3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2DED9383-C922-4B21-84B2-8813ECD2C64E.1; 
 Tue, 17 Oct 2023 01:12:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 906f395cd9d3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Oct 2023 01:12:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV1PR08MB7380.eurprd08.prod.outlook.com (2603:10a6:150:24::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 01:12:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 01:12:13 +0000
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
X-Inumbo-ID: 4029afb2-6c8a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xp9bRPTSC8h0ttFQuqpuJUs8smcqU46z5nqWMmvS5N4=;
 b=vCXePs39kfv/++RBo5P4q6Rr3SGabntL41aGYvfpXglnu0toBtYl4igdKaNqRtksXaHo1U0cRNpREv2SOXlkSbj+yKekd/U/40faNvy9E+0L1Htj0lwNaKvnIdOko2DNLhCB8ymOlTcB1iQ6sQPdBTF5f7kbhzFZzo1r1VnGLEU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ef7ef0a82154ca8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nryqDKRHfMSDomrlXPhBuu/9+g2GlxrbHaH+xRjd1wfxXEouhtj0jAAehGkuEnc5fTtpGDfp1qI++gFepoAUzDCBWvIxwdPbSjpz1nuIv23ch66eTQ8eEIuGWry0n2PwpMXeYsY+WDbMqHml4ORBX3cZsUTGy4VHvTs/34ehgr7vPjvBasRQeAmoquizpk0Ph9lUse/kZ/uj5DNordMSHFXPB8uEoIMmt06MjB80dCxq+Xb/3q+fTuSZ78JMF1En8tM2lOwt2abeeVL1jOEWdkFSU24DIRAd7eyd4FxUUHrZ0tqNfnqQUsXm6Y8lNGCIhqTK4h68mGsF76E1Bzq1xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xp9bRPTSC8h0ttFQuqpuJUs8smcqU46z5nqWMmvS5N4=;
 b=fl1VVvIqQv3vI/afGzgfCT7g/qAiZlWLEAxVcpnvAp1AyN/xWfSCCaswMM6KC9cyg5prf4l8VMF0arLM9toubhth0TALJgrT2lttl8iK+DX59jPdOXvxj889MuCiO56IJtmfwTl+0PhmYVNS8w4kL7en2ssAllmQbjcrJAB7vKijIrC6talo9Eewxt552P2362w/wY4kjpM3nIWeiIisaXnuHo94ao1YvwksExiqHi78Q1el813EJStAnINUulJMFvqhhFq5eY3w+2r5DaAiYDN6wCAkuzfPeIw5WLlo1nvRby7ydZ1BUvXPPk11/UOsXpYlTsuphLAVhEXIDjTcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xp9bRPTSC8h0ttFQuqpuJUs8smcqU46z5nqWMmvS5N4=;
 b=vCXePs39kfv/++RBo5P4q6Rr3SGabntL41aGYvfpXglnu0toBtYl4igdKaNqRtksXaHo1U0cRNpREv2SOXlkSbj+yKekd/U/40faNvy9E+0L1Htj0lwNaKvnIdOko2DNLhCB8ymOlTcB1iQ6sQPdBTF5f7kbhzFZzo1r1VnGLEU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
	<Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Topic: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Thread-Index: AQHZ+kyDxYKGSy7Hi0WFFm+WJG77tLBID9YAgAB2kICABCQvAIAAjrAA
Date: Tue, 17 Oct 2023 01:12:13 +0000
Message-ID: <2761E03D-0C3B-4B3D-8923-73B18564A9A6@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-9-Henry.Wang@arm.com>
 <af6a376c-a224-45d7-9972-d69ee44239d6@xen.org>
 <4607C809-7625-4C8E-A26E-8B8F641CEB29@arm.com>
 <0299c7f0-6235-421a-b57d-63b0ad4a650f@xen.org>
In-Reply-To: <0299c7f0-6235-421a-b57d-63b0ad4a650f@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV1PR08MB7380:EE_|AM7EUR03FT052:EE_|AM9PR08MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: d93a0135-f157-47cb-1d6f-08dbceae2217
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3DE8oK7kHvx+vYg8GYu4Jzm+NRZGqaNSfGFY7uN/5zCHQOScjUTl+FcfdTnhN17G0s/K5YilFK51uQawZ+ysdz795tqOeJQbhlftwG6SvyWyv6aG/mxkBnz7c6diT0o8Ibf2wjVAbVkDKJYfRmuKgJu3sg6xa+jX+gI6/iIeRmVRDiB7HW26vUxw+C04sU115dyHnHD/1ZEKSFNyhNHTIrWTW2H7b6Qwo7kMUo3fn1v1c+DDiESW8y3D6HFvVfmz6QR5vMDm/u9rxR5AWAPy0MKYSzzg4w4AJgVV/sKxWnCX87DuuMdhpU3jk3MAsFgzZZgyeujgXChCFzk5AfcTV+2JGy/xfuEMhXmKFoRCIgxGlfrSAhc/324Nj8Rsz85VRDO0SxFL6GnQBQjgKLvHqujnLz1diYbTMQEy9CuKix7NqWnZuz2YbC7iqxncUSmJZVSb4/22ichbnyJ08Z9/ogjatbnPrSeOWRrjMHS3lriCLWGychlk/8d7RWz6dw+EQjxYYVSEyKlwRdOC6bQ8JMgluJs/G6MGgGMPvqFENI/21+9Ss3noi0s79/1t5lYfiG+AhAs6puMQPI9+SBiiCvu0Ib3JeLt/rPbh9FTNxbiGSYNze/ZGT4Rs7BFh41uLIh/S/j0QDPIeq0+7po89vQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(478600001)(66476007)(91956017)(6486002)(66556008)(76116006)(6916009)(66946007)(54906003)(64756008)(66446008)(71200400001)(26005)(53546011)(6506007)(41300700001)(2616005)(6512007)(8936002)(8676002)(2906002)(4326008)(5660300002)(38070700005)(36756003)(33656002)(122000001)(86362001)(38100700002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D4DC9A3E05FD94D862D28C8EF56795F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7380
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	505d009a-6ed0-48d7-ba8b-08dbceae1895
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E11mONUn8VBv54+JbCF+b451qm3nNcbm4/BO1xio79Be3mhts/6EDpVb1TLIP61Vphnd8HOKTayZmgmj0yNWombPeWlTS0jP3ou+lbb4LJcOR6FJsQ3ipvQQNPTP2xxFhMLZGsHZlHEPJX0rFOzQJLPmF0tL1nkgRWTBjufwdxBK6X6t4E69tTU/B+QPVFBJjY3NaQ+qrjzbP5SavohskqVeCb+9GQNH6MhmF/WadQ+Wy0NX6iR8fkJ+bCZArBAEQZsG+1cN1EWCgrTi7EU4iQo8ZoeoshelJwGPgi1aMVyshCzOiYFygqsr9yHJoikRnvpIt0CHLOsUMQC9L2+VZd6zmfuT6d4fjqW2RZ922FbA5SZ2W66hRn+vZlReOXBKfr5LuyNCEi+ayDIgOUNChSeQAn/JMGxUonZjD1ymONA30RrVe3fJtoeE+axk+mZTzCmpLz1qonzdYDk6doWbkXRnxkFdx1xJBYRFaG2p6QtTxSfh5vwhHT3Y2T9TXu6KVFY9CxZPchw6Z7/t2Oe+1V+EvcrqPVlTCCgYL6mGGgrQerq8AxTQuAassVCKNUP24mWIacse0Qlr6BnkAwvsyVbxnVcsZkVVjoA3neJaN9sT8kksuGKYorPOT6VQAoImi56K3dvhNmaUvCC7X3zzLATJRyICipXMGzlaD0rjG73PfR/FOWg6oIl8bdUGhzWLXktKFY7NeI0p3c192tkvbYsWhSxXaOGn8frCjDKBXz43TswVsCWGWH4uDNnNGraN
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799009)(40470700004)(46966006)(36840700001)(6506007)(53546011)(336012)(2616005)(81166007)(40480700001)(6512007)(40460700003)(26005)(82740400003)(356005)(316002)(70206006)(70586007)(54906003)(36860700001)(33656002)(5660300002)(41300700001)(2906002)(86362001)(36756003)(8936002)(6862004)(4326008)(8676002)(47076005)(6486002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 01:12:29.3847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d93a0135-f157-47cb-1d6f-08dbceae2217
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6706

SGkgSnVsaWVuLA0KDQo+IE9uIE9jdCAxNywgMjAyMywgYXQgMDA6NDEsIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiBPbiAxNC8xMC8yMDIzIDAyOjI2LCBIZW5yeSBXYW5n
IHdyb3RlOg0KPj4gSGkgSnVsaWVuLA0KPiANCj4gSGkgSGVucnksDQo+IA0KPj4+IE9uIE9jdCAx
NCwgMjAyMywgYXQgMDI6MjIsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0K
Pj4+IA0KPj4+IEhpIEhlbnJ5LA0KPj4+IA0KPj4+IE9uIDA5LzEwLzIwMjMgMDI6MDMsIEhlbnJ5
IFdhbmcgd3JvdGU6DQo+Pj4+IEZyb206IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29t
Pg0KPj4+PiBDdXJyZW50IFAyTSBpbXBsZW1lbnRhdGlvbiBpcyBkZXNpZ25lZCBmb3IgTU1VIHN5
c3RlbSBvbmx5Lg0KPj4+PiBXZSBtb3ZlIHRoZSBNTVUtc3BlY2lmaWMgY29kZXMgaW50byBtbXUv
cDJtLmMsIGFuZCBvbmx5IGtlZXAgZ2VuZXJpYw0KPj4+PiBjb2RlcyBpbiBwMm0uYywgbGlrZSBW
TUlEIGFsbG9jYXRvciwgZXRjLiBXZSBhbHNvIG1vdmUgTU1VLXNwZWNpZmljDQo+Pj4+IGRlZmlu
aXRpb25zIGFuZCBkZWNsYXJhdGlvbnMgdG8gbW11L3AybS5oLCBzdWNoIGFzIHAybV90bGJfZmx1
c2hfc3luYygpLg0KPj4+PiBBbHNvIGV4cG9zZSBwcmV2aW91c2x5IHN0YXRpYyBmdW5jdGlvbnMg
cDJtX3ZtaWRfYWxsb2NhdG9yX2luaXQoKSwNCj4+Pj4gcDJtX2FsbG9jX3ZtaWQoKSwgYW5kIHNl
dHVwX3ZpcnRfcGFnaW5nX29uZSgpIGZvciBmdXJ0aGVyIE1QVSB1c2FnZS4NCj4+Pj4gV2l0aCB0
aGUgY29kZSBtb3ZlbWVudCwgZ2xvYmFsIHZhcmlhYmxlIG1heF92bWlkIGlzIHVzZWQgaW4gbXVs
dGlwbGUNCj4+Pj4gZmlsZXMgaW5zdGVhZCBvZiBhIHNpbmdsZSBmaWxlIChhbmQgd2lsbCBiZSB1
c2VkIGluIE1QVSBQMk0NCj4+Pj4gaW1wbGVtZW50YXRpb24pLCBkZWNsYXJlIGl0IGluIHRoZSBo
ZWFkZXIgYW5kIHJlbW92ZSB0aGUgInN0YXRpYyIgb2YNCj4+Pj4gdGhpcyB2YXJpYWJsZS4NCj4+
Pj4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+Pj4+
IFNpZ25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBIZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+Pj4gDQo+Pj4gU29tZSBy
ZW1hcmtzIGFib3V0IHNvbWUgb2YgdGhlIGNvZGUgbm90IG1vdmVkOg0KPj4+ICogc3RydWN0IHAy
bV9kb21haW46IFRoZSBidWxrIG9mIHRoZSBmaWVsZHMgc2VlbXMgdG8gYmUgTU1VIHNwZWNpZmlj
LiBTbyBkZXBlbmRpbmcgb24gdGhlIG51bWJlciBvZiBjb21tb24gZmllbGRzIHdlIGVpdGhlciB3
YW50IHRvIHNwbGl0IG9yIG1vdmUgdGhlIHN0cnVjdHVyZSB0byBwMm1fZG9tYWluLiBJIHdvdWxk
IGJlIG9rIHRvIHdhaXQgdW50aWwgdGhlIE1QVSBjb2RlIGlzIHByZXNlbnQuDQo+Pj4gKiBwMm1f
dHlwZV90OiBJdCBpcyBub3QgeWV0IGNsZWFyIGhvdyB0aGlzIHdpbGwgYXBwbHkgdG8gdGhlIE1Q
VS4gSSBhbSBvayB0byB3YWl0IGJlZm9yZSBtb3ZpbmcgaXQuDQo+PiBBZ3JlZSB3aXRoIGJvdGgg
aGVyZSwgbGV04oCZcyBjb250aW51ZSB0aGUgZGlzY3Vzc2lvbiBpbiB0aGUgYWN0dWFsIE1QVSBw
YXRjaCBmb3IgUDJNDQo+PiB0aGVuLCBidXQgSSBhbSB0aGVuIGEgYml0IGNvbmZ1c2VkIGFib3V0
Li4uDQo+Pj4gKiBwMm1fY2FjaGVfZmx1c2hfcmFuZ2UoKTogSSBleHBlY3QgdGhlIGNvZGUgd2ls
bCBuZWVkIHNvbWUgY2hhbmdlIGJlY2F1c2UgeW91IG1heSBnZXQgbGFyZ2UgY2h1bmsgb2YgbWVt
b3J5IGZvciB0aGUgTVBVLg0KPj4+ICogcDJtX3NldF93YXlfZmx1c2goKS9wMm1fdG9nZ2xlX2Nh
Y2hlKCk6IFRoaXMgd2FzIGEgZ2lhbnQgaGFjayB0byBzdXBwb3J0IGNhY2hlIGZsdXNoIG9wZXJh
dGlvbnMgdmlhIHNldC93YXkuIFRvIG1ha2UgaXQgZWZmaWNpZW50LCB3ZSB0cmFjayB0aGUgcGFn
ZXMgdGhhdCBoYXZlIGJlZW4gdG91Y2hlZCBhbmQgb25seSBmbHVzaCB0aGVtLiBGb3IgdGhlIE1Q
VSwgdGhpcyB3b3VsZCBub3Qgd29yay4gQ2FuIHdlIGF0dGVtcHQgdG8gbm90IGVtdWxhdGUgdGhl
IGluc3RydWN0aW9ucz8NCj4+IOKApnRoZXNlIHR3byByZW1hcmtzIGhlcmUsIGRvIHlvdSBleHBl
Y3QgbWUgdG8gZG8gc29tZSBjaGFuZ2VzIHdpdGggdGhlc2UgdGhyZWUNCj4+IGZ1bmN0aW9ucyBp
biB0aGlzIHBhdGNoPyBPciB3ZSBjYW4gZGVmZXIgdGhlIHJlcXVpcmVkIGNoYW5nZXMgdG8gdGhl
IE1QVSBwYXRjaCBmb3INCj4+IFAyTT8NCj4gDQo+IE15IG9yaWdpbmFsIGludGVudGlvbiB3YXMg
dG8gYXNrIHRvIG1vdmUgdGhlbSByaWdodCBub3cuIEJ1dCBpZiBpdCBpcyB1bmNsZWFyIHdoZXRo
ZXIgdGhleSB3b3VsZCBiZSB1c2VkLCB0aGVuIGl0IHdvdWxkIGJlIGJlc3QgdG8gZGVmZXIgdW50
aWwgd2UgaGF2ZSBhIGJldHRlciB1bmRlcnN0YW5kaW5nLg0KDQpTdXJlLCBJIHRoaW5rIEkgd2ls
bCBkZWZlciBpdCB0aGVuLg0KDQo+IA0KPj4gSSB0aGluayBJIGFtIGhpZ2hseSBsaWtlbHkgdG8g
bWFrZSBhIG1pc3Rha2UgaGVyZSBidXQgSSB0b29rIGEgbG9vayBhdCB0aGUgTVBVDQo+PiBpbXBs
ZW1lbnRhdGlvbiBbMV0gYW5kIGl0IGxvb2tzIGxpa2UgdGhlIE1QVSBjb2RlIGNhbiB1c2UgdGhl
c2UgdHJlZSBmdW5jdGlvbnMNCj4+IHdpdGhvdXQgY2hhbmdlcyAtIHByb2JhYmx5IGJlY2F1c2Ug
dGhlc2UgZnVuY3Rpb25zIGFyZSBzaW1wbHkgdXNlZCBieQ0KPj4gKDEpIGRvbWN0bCBhbmQgd2Ug
b25seSBoYXZlIGRvbTBsZXNzIERvbVVzIG9uIE1QVQ0KPj4gKDIpIHRyYXAgaGFuZGxlcnMNCj4+
IHdoaWNoIG1lYW5zIHRoZXNlIGZ1bmN0aW9ucyBhcmUgc2ltcGx5IG5vdCBjYWxsZWTigKYNCj4g
DQo+IEkgYW0gbm90IHN1cmUgSSBmdWxseSB1bmRlcnN0YW5kIHdoeSB3b3VsZCB0aGUgdHJhcCBo
YW5kbGVycyBub3QgY2FsbGVkLiBJcyB0aGlzIHN1Z2dlc3RpbmcgdGhhdCBhIGRvbTBsZXNzIGRv
bVVzIGNhbiBub3QgdXNlIHNldC93YXkgaW5zdHJ1Y3Rpb25zPw0KDQpObyBJIHdhcyB3cm9uZywg
c29ycnkgZm9yIHRoZSBjb25mdXNpb24sIEkgc29tZWhvdyDigJxtaXMtbGlua2Vk4oCdIHRoZSDi
gJx0cmFw4oCdIHRvIOKAnHBhbmlj4oCdIDovDQoNCkJ1dCBhcyBJIHNhdyB5b3VyIHJlcGx5IGFi
b3ZlLCBzbyBJIHRoaW5rIHByb2JhYmx5IHdlIGNhbiBkZWZlciB0aGUgbW92ZW1lbnQgb2YgdGhl
c2UgZnVuY3Rpb25zDQp0byBmdXJ0aGVyIGRpc2N1c3Npb25zIGluIE1QVSBzZXJpZXMuDQoNCktp
bmQgcmVnYXJkcywNCkhlbnJ5DQoNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGll
biBHcmFsbA0KDQo=

