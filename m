Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC135067BA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 11:30:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307956.523381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngkBL-0008Fs-G7; Tue, 19 Apr 2022 09:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307956.523381; Tue, 19 Apr 2022 09:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngkBL-0008DS-Cc; Tue, 19 Apr 2022 09:29:59 +0000
Received: by outflank-mailman (input) for mailman id 307956;
 Tue, 19 Apr 2022 09:29:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=abXu=U5=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngkBK-0008DH-Ba
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 09:29:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4663e64d-bfc3-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 11:29:56 +0200 (CEST)
Received: from DB6PR0301CA0027.eurprd03.prod.outlook.com (2603:10a6:4:3e::37)
 by DB7PR08MB3450.eurprd08.prod.outlook.com (2603:10a6:10:41::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:29:53 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::84) by DB6PR0301CA0027.outlook.office365.com
 (2603:10a6:4:3e::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Tue, 19 Apr 2022 09:29:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Tue, 19 Apr 2022 09:29:53 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Tue, 19 Apr 2022 09:29:53 +0000
Received: from 53ddf43e1e63.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BEBFFECA-41E6-49DD-8B5A-EA2365A506F8.1; 
 Tue, 19 Apr 2022 09:29:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 53ddf43e1e63.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 19 Apr 2022 09:29:42 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AM6PR08MB3910.eurprd08.prod.outlook.com (2603:10a6:20b:6f::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 09:29:40 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 09:29:39 +0000
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
X-Inumbo-ID: 4663e64d-bfc3-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYB1xsnZrfBvXM4s2nBQ5KwVbxk5S5TrOZDf1jh+21w=;
 b=GPsrJGLSEfamGCYM+XcCQRx8Vp7s/4V6lGMg/HJfXc3PspMqtK4Vx2Z6q2C0YD5H1DzVEXO0oBOuiF/kRtXQtrnlXmhcwBRrB8otWXjb/WAQ9NlZcK4f7iPQr6ZFimq5gxHFJ1N7qaLUfYg4iM2i7rNpu8+zhgjuD3YWA3sX8AM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5l7kDf8gRM0uDOrxQzAJIvGBKId197IE1Zd9twVG/fMEuHZYa3wX4TLAVhB9KAQnQaAQ52xYsgixHuS0Ho5I7XrOhfHSjs4bRpu0Yrm4jhFSQIuHZvAKjmSxCiyfJSdXsXdK8jLQ5afx4AM5v6fK4G0ze89ZPys47MtmNVAARGx74IY42MmCg3+fxZ5qMZj2XuM9bv3O4p+PVL3P6G/x9GtBMKmAti5Csbdsr6ZOFPSsuhaXyIT/c3fPb1ytggMk/x7fOv6lo8paty+EJfVlha02wdu2YIYQnASVxPTuk5A9ZZpNDxMYFDWE/s3TjHPDWWZ03YVqvn0zmwAV95qzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYB1xsnZrfBvXM4s2nBQ5KwVbxk5S5TrOZDf1jh+21w=;
 b=T0k5Kmqe60MCBbRZIxDSbhCSLtElZQT/MdD5OExYadxH6/ENgWpwFLZ6ztVdChcBQEb4LK/eq77a52mKJA6S8abbdmggYSn01H945BhVt5SjEWFPNXbH6nGH/adpavH9wAUY+O82JuPmq2b9nk2FDCxcvHb3nmuZ5UBPUUfh9bEl3evf2Ci5lDZL5qLcqaFVwF59kwvQCz/r8EF0aPznztV7KZFuK4KYbCzC5QD8nGEoN7UUYIwIjGxiO+VljNYCIJraMdmddfou7iRESC1S2Zx0TdAWxwYt/GI4t4+a4wKsvW57UIHhoQxqPz6ytS+2CyEVLEWYQb+rPhztIq63dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYB1xsnZrfBvXM4s2nBQ5KwVbxk5S5TrOZDf1jh+21w=;
 b=GPsrJGLSEfamGCYM+XcCQRx8Vp7s/4V6lGMg/HJfXc3PspMqtK4Vx2Z6q2C0YD5H1DzVEXO0oBOuiF/kRtXQtrnlXmhcwBRrB8otWXjb/WAQ9NlZcK4f7iPQr6ZFimq5gxHFJ1N7qaLUfYg4iM2i7rNpu8+zhgjuD3YWA3sX8AM=
From: Wei Chen <Wei.Chen@arm.com>
To: Wei Chen <Wei.Chen@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [PATCH v2 00/10] Device tree based NUMA support for Arm - Part#1
Thread-Topic: [PATCH v2 00/10] Device tree based NUMA support for Arm - Part#1
Thread-Index: AQHYUwPmql26OclSj0Gd0xQ7ylUCkaz2+O3g
Date: Tue, 19 Apr 2022 09:29:39 +0000
Message-ID:
 <PAXPR08MB7420F854241B245C4F0F60029EF29@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B0D29BCBCC8F894FB573066EDFA0A9C9.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 79f99f35-6998-4be0-bfc7-08da21e728f3
x-ms-traffictypediagnostic:
	AM6PR08MB3910:EE_|DB5EUR03FT060:EE_|DB7PR08MB3450:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3450E2E519B37DBF1B159ED09EF29@DB7PR08MB3450.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GKQ23ku2MLbiU2B4DIkDeTTX7qH5nCZEBWDCJYalhAe0xCPf8pcCgTxNJ1kV/m5ghjb8AHeB8FWJbXkk9wI6d1mJ2WvGR1BK/exqOUvg3+bi3tsoUdhHX6RTWzCcAF2h2Qs212/tY2P07ySDsuUsPbjPqMkNJeicsi/fGhCHMofHBCWM8moo3g/H/NFu5QHtQm5SnSHeJGJOF21DIQd/uk0X16+ZAHTXzRm2PGO8qCBOseNowhsaYAgLKoQW8jL4gCCvlt8Li9+hFerGFC+JfuE2+bQ59ajQdz0HdgPIseTMI+N3Yh1U8Myq6noO8GVweiQTmNACTOgi4iY+exj+Dp5jCkx74pM3yKwKHJBWUd509sDQdock+HugBGe1YMfZwOunsXj2YvOlgQPyTFC21cbD/wPADgWSl9mgUGohtSDKjyImv3KNI9YnLBjh8MbIKCmkoktTMQoVjpslzIQnXvj3TFVcu5J/IrQI1L9Hb88Ik1hJPmKDi4fc7uvrRQnmr6IwCC40sE1mYUSYSIiaOG4D1Z2nijqVmqxuCNj8zOYytzyJJMfLmL6xA2ldP62XiEj4s7YoocvEjqsLxwRVUQoGXqOy21j3cbVM/lya+MGgazHBQ0PcBDNfvUsQqTiHPXreERWkf/jWgp1C+bAXfw01Pszf8w0W3vKmVh4aAb6+7LbEUNNY0vGIsa70VUIOPsAmukR6xcx305KnGYQDpp3WwmQEPGIHF7/1w7SMTEE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(55016003)(66446008)(8676002)(64756008)(26005)(76116006)(9686003)(38100700002)(38070700005)(8936002)(7696005)(52536014)(6506007)(33656002)(54906003)(66946007)(4326008)(66556008)(110136005)(5660300002)(83380400001)(66476007)(53546011)(86362001)(71200400001)(508600001)(2906002)(316002)(186003)(17413003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3910
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	32f19ebb-e43b-4c84-e165-08da21e720c7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ssD42tI6Pbd73vyAWkfTLVJNZz9jwR2r8L32+wFRfJFvM9tlYnfDzxoGWaGkZDJvWO75ZhoRgg1SB8GgZTrrgYGpONH9Kx+aTRKZcgDzGKwCZfNx/wtRWrxuZIX1FBGnW6oBVY8aNYelZtkKSTPloeZfxTBe4ILPILEv0O7gL/mBCziJS7qudvnIuf5cA5ywlCNM6Q3H534NRq9uU0xV6vOsfl1OLlc0yaL8oV6IE7OHxjc3/ldilNOpPojY/hZXHMDW2tW7hV1dnJwfrqb8amMdW3cGIkMgTtz6egKIeJNGjvsZXONxdIZhTdltNWD2wda40dXACQi1FDv1J4pITiAm+rNvRYbhpdpRLSF2uMiC2pCX0J7cYpH2mw3xkTPHZgJzB+ZaQqim5ARoxNAowMNh+nHEGGbvvpTlJd34yQDyLEMbXeQ5nRfFZQCw/zgz3Vj7bj3YbXzhVmbnkKfY4XbEK8yxMkd5iTKh4ksA5tH/v3zZhibTZDywtktZy2pDLBoG2nXR9ZbyZehAEUE+8gZ7vpcSaUaXBRQZmMsQKBp7w/12mZOlpSYvWt8goAs7mzaY706eGfikwf7zA7PUnLkrDrTJbtcMW/ZTPA8m0Gj1E1L9azCaNmPb8as7tIXw60bKse2pYLrCqIxIc+DocxXFbbAo1ayXreNbKooyQ4mRcUlUcaeAuGq3JZGmOBWMmNSnrYXkpQ9N6aQO4AyEXg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(81166007)(186003)(2906002)(7696005)(36860700001)(40460700003)(53546011)(52536014)(26005)(8936002)(5660300002)(498600001)(9686003)(6506007)(33656002)(4326008)(83380400001)(86362001)(55016003)(47076005)(336012)(54906003)(110136005)(107886003)(70206006)(8676002)(70586007)(82310400005)(17413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 09:29:53.4415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f99f35-6998-4be0-bfc7-08da21e728f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3450

SGksDQoNCkkgYW0gc29ycnksIEkgaGFkIGFkZGVkIGEgd3JvbmcgYWRkcmVzcy0tdG89eGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQppbiB0aGlzIHNlcmllcycgcmVjaXBpZW50IGFkZHJl
c3MgYnkgbWlzdGFrZS4gV2hlbiB5b3UgcmVwbHkgdG8gdGhpcyBzZXJpZXMsDQpwbGVhc2UgcmVt
ZW1iZXIgdG8gcmVtb3ZlIGl0LiBJJ20gc29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNlIGFnYWlu
IQ0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiBTZW50OiAyMDIyxOo01MIxOMjV
IDE3OjA3DQo+IFRvOiAtLXRvPXhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBuZCA8bmRAYXJtLmNvbT47IFdlaSBDaGVu
IDxXZWkuQ2hlbkBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47IEphbiBCZXVsaWNoDQo+
IDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDAwLzEwXSBEZXZpY2Ug
dHJlZSBiYXNlZCBOVU1BIHN1cHBvcnQgZm9yIEFybSAtIFBhcnQjMQ0KPiANCj4gKFRoZSBBcm0g
ZGV2aWNlIHRyZWUgYmFzZWQgTlVNQSBzdXBwb3J0IHBhdGNoIHNldCBjb250YWlucyAzNQ0KPiBw
YXRjaGVzLiBJbiBvcmRlciB0byBtYWtlIHN0dWZmIGVhc2llciBmb3IgcmV2aWV3ZXJzLCBJIHNw
bGl0DQo+IHRoZW0gaW50byAzIHBhcnRzOg0KPiAxLiBQcmVwYXJhdGlvbi4gSSBoYXZlIHJlLXNv
cnRlZCB0aGUgcGF0Y2ggc2VyaWVzLiBBbmQgbW92ZWQNCj4gICAgaW5kZXBlbmRlbnQgcGF0Y2hl
cyB0byB0aGUgaGVhZCBvZiB0aGUgc2VyaWVzLg0KPiAyLiBNb3ZlIGdlbmVyaWNhbGx5IHVzYWJs
ZSBjb2RlIGZyb20geDg2IHRvIGNvbW1vbi4NCj4gMy4gQWRkIG5ldyBjb2RlIHRvIHN1cHBvcnQg
QXJtLg0KPiANCj4gVGhpcyBzZXJpZXMgb25seSBjb250YWlucyB0aGUgZmlyc3QgcGFydCBwYXRj
aGVzLg0KPiBUaGUgZnVsbCBwYXRjaCBsaXN0IGNhbiBiZSBmb3VuZCBpbiB0aGlzIGNvdmVyIGxl
dHRlci4pDQo+IA0KPiBYZW4gbWVtb3J5IGFsbG9jYXRpb24gYW5kIHNjaGVkdWxlciBtb2R1bGVz
IGFyZSBOVU1BIGF3YXJlLg0KPiBCdXQgYWN0dWFsbHksIG9uIHg4NiBoYXMgaW1wbGVtZW50ZWQg
dGhlIGFyY2hpdGVjdHVyZSBBUElzDQo+IHRvIHN1cHBvcnQgTlVNQS4gQXJtIHdhcyBwcm92aWRp
bmcgYSBzZXQgb2YgZmFrZSBhcmNoaXRlY3R1cmUNCj4gQVBJcyB0byBtYWtlIGl0IGNvbXBhdGli
bGUgd2l0aCBOVU1BIGF3YXJlZCBtZW1vcnkgYWxsb2NhdGlvbg0KPiBhbmQgc2NoZWR1bGVyLg0K
PiANCj4gQXJtIHN5c3RlbSB3YXMgd29ya2luZyB3ZWxsIGFzIGEgc2luZ2xlIG5vZGUgTlVNQSBz
eXN0ZW0gd2l0aA0KPiB0aGVzZSBmYWtlIEFQSXMsIGJlY2F1c2Ugd2UgZGlkbid0IGhhdmUgbXVs
dGlwbGUgbm9kZXMgTlVNQQ0KPiBzeXN0ZW0gb24gQXJtLiBCdXQgaW4gcmVjZW50IHllYXJzLCBt
b3JlIGFuZCBtb3JlIEFybSBkZXZpY2VzDQo+IHN1cHBvcnQgbXVsdGlwbGUgbm9kZXMgTlVNQSBz
eXN0ZW0uDQo+IA0KPiBTbyBub3cgd2UgaGF2ZSBhIG5ldyBwcm9ibGVtLiBXaGVuIFhlbiBpcyBy
dW5uaW5nIG9uIHRoZXNlIEFybQ0KPiBkZXZpY2VzLCBYZW4gc3RpbGwgdHJlYXQgdGhlbSBhcyBz
aW5nbGUgbm9kZSBTTVAgc3lzdGVtcy4gVGhlDQo+IE5VTUEgYWZmaW5pdHkgY2FwYWJpbGl0eSBv
ZiBYZW4gbWVtb3J5IGFsbG9jYXRpb24gYW5kIHNjaGVkdWxlcg0KPiBiZWNvbWVzIG1lYW5pbmds
ZXNzLiBCZWNhdXNlIHRoZXkgcmVseSBvbiBpbnB1dCBkYXRhIHRoYXQgZG9lcw0KPiBub3QgcmVm
bGVjdCByZWFsIE5VTUEgbGF5b3V0Lg0KPiANCj4gWGVuIHN0aWxsIHRoaW5rIHRoZSBhY2Nlc3Mg
dGltZSBmb3IgYWxsIG9mIHRoZSBtZW1vcnkgaXMgdGhlDQo+IHNhbWUgZm9yIGFsbCBDUFVzLiBI
b3dldmVyLCBYZW4gbWF5IGFsbG9jYXRlIG1lbW9yeSB0byBhIFZNDQo+IGZyb20gZGlmZmVyZW50
IE5VTUEgbm9kZXMgd2l0aCBkaWZmZXJlbnQgYWNjZXNzIHNwZWVkcy4gVGhpcw0KPiBkaWZmZXJl
bmNlIGNhbiBiZSBhbXBsaWZpZWQgaW4gd29ya2xvYWRzIGluc2lkZSBWTSwgY2F1c2luZw0KPiBw
ZXJmb3JtYW5jZSBpbnN0YWJpbGl0eSBhbmQgdGltZW91dHMuDQo+IA0KPiBTbyBpbiB0aGlzIHBh
dGNoIHNlcmllcywgd2UgaW1wbGVtZW50IGEgc2V0IG9mIE5VTUEgQVBJIHRvIHVzZQ0KPiBkZXZp
Y2UgdHJlZSB0byBkZXNjcmliZSB0aGUgTlVNQSBsYXlvdXQuIFdlIHJldXNlIG1vc3Qgb2YgdGhl
DQo+IGNvZGUgb2YgeDg2IE5VTUEgdG8gY3JlYXRlIGFuZCBtYWludGFpbiB0aGUgbWFwcGluZyBi
ZXR3ZWVuDQo+IG1lbW9yeSBhbmQgQ1BVLCBjcmVhdGUgdGhlIG1hdHJpeCBiZXR3ZWVuIGFueSB0
d28gTlVNQSBub2Rlcy4NCj4gRXhjZXB0IEFDUEkgYW5kIHNvbWUgeDg2IHNwZWNpZmllZCBjb2Rl
LCB3ZSBoYXZlIG1vdmVkIG90aGVyDQo+IGNvZGUgdG8gY29tbW9uLiBJbiBuZXh0IHN0YWdlLCB3
aGVuIHdlIGltcGxlbWVudCBBQ1BJIGJhc2VkDQo+IE5VTUEgZm9yIEFybTY0LCB3ZSBtYXkgbW92
ZSB0aGUgQUNQSSBOVU1BIGNvZGUgdG8gY29tbW9uIHRvbywNCj4gYnV0IGluIGN1cnJlbnQgc3Rh
Z2UsIHdlIGtlZXAgaXQgYXMgeDg2IG9ubHkuDQo+IA0KPiBUaGlzIHBhdGNoIHNlcmlyZXMgaGFz
IGJlZW4gdGVzdGVkIGFuZCBib290ZWQgd2VsbCBvbiBvbmUNCj4gQXJtNjQgTlVNQSBtYWNoaW5l
IGFuZCBvbmUgSFBFIHg4NiBOVU1BIG1hY2hpbmUuDQo+IA0KPiAtLS0NCj4gUGFydDEgdjEtPnYy
Og0KPiAxLiBNb3ZlIGluZGVwZW5kZW50IHBhdGNoZXMgZnJvbSBsYXRlciB0byBlYXJseSBvZiB0
aGlzIHNlcmllcy4NCj4gMi4gRHJvcCB0aGUgY29weSBvZiBFRkkgc3R1Yi5jIGZyb20gQXJtLiBT
aGFyZSBjb21tb24gY29kZXMgb2YNCj4gICAgeDg2IEVGSSBzdHViIGZvciBBcm0uDQo+IDMuIFVz
ZSBDT05GSUdfQVJNX0VGSSB0byByZXBsYWNlIENPTkZJR19FRkkgYW5kIHJlbW92ZSBoZWxwIHRl
eHQNCj4gICAgYW5kIG1ha2UgQ09ORklHX0FSTV9FRkkgaW52aXNpYmxlLg0KPiA0LiBVc2UgQVNT
RVJUIHRvIHJlcGxhY2UgVklSVFVBTF9CVUdfT04gaW4gcGh5c190b19uaWQuDQo+IDUuIE1vdmUg
TUFYX05VTU5PREVTIGZyb20geGVuL251bWEuaCB0byBhc20vbnVtYS5oIGZvciB4ODYuDQo+IDYu
IEV4dGVuZCB0aGUgZGVzY3JpcHRpb24gb2YgQXJtJ3Mgd29ya2Fyb3VuZCBmb3IgcmVzZXJ2ZSBE
TUENCj4gICAgYWxsb2NhdGlvbnMgdG8gYXZvaWQgdGhlIHNhbWUgZGlzY3Vzc2lvbiBldmVyeSB0
aW1lIGZvcg0KPiAgICBhcmNoX2hhdmVfZGVmYXVsdF9kbWF6b25lLg0KPiA3LiBVcGRhdGUgY29t
bWl0IG1lc3NhZ2VzLg0KPiANCj4gV2VpIENoZW4gKDEwKToNCj4gICB4ZW4vYXJtOiBQcmludCBh
IDY0LWJpdCBudW1iZXIgaW4gaGV4IGZyb20gZWFybHkgdWFydA0KPiAgIHhlbi94ODY6IG1vdmUg
cmV1c2FibGUgRUZJIHN0dWIgZnVuY3Rpb25zIGZyb20geDg2IHRvIGNvbW1vbg0KPiAgIHhlbi9h
cm06IGFkZCBDT05GSUdfQVJNX0VGSSB0byBzdHViIEVGSSBBUEkNCj4gICB4ZW4vYXJtOiBLZWVw
IG1lbW9yeSBub2RlcyBpbiBkZXZpY2UgdHJlZSB3aGVuIFhlbiBib290cyBmcm9tIEVGSQ0KPiAg
IHhlbi94ODY6IFVzZSBBU1NFUlQgaW5zdGVhZCBvZiBWSVJUVUFMX0JVR19PTiBmb3IgcGh5c190
b19uaWQNCj4gICB4ZW46IGludHJvZHVjZSBhbiBhcmNoIGhlbHBlciBmb3IgZGVmYXVsdCBkbWEg
em9uZSBzdGF0dXMNCj4gICB4ZW46IGRlY291cGxlIE5VTUEgZnJvbSBBQ1BJIGluIEtjb25maWcN
Cj4gICB4ZW4vYXJtOiB1c2UgIUNPTkZJR19OVU1BIHRvIGtlZXAgZmFrZSBOVU1BIEFQSQ0KPiAg
IHhlbi94ODY6IHVzZSBwYWRkcl90IGZvciBhZGRyZXNzZXMgaW4gTlVNQSBub2RlIHN0cnVjdHVy
ZQ0KPiAgIHhlbi94ODY6IGFkZCBkZXRlY3Rpb24gb2YgbWVtb3J5IGludGVybGVhdmVzIGZvciBk
aWZmZXJlbnQgbm9kZXMNCj4gDQo+IFBBUlQyOg0KPiAgIHhlbi94ODY6IGludHJvZHVjZSBhIGhl
bHBlciB0byB1cGRhdGUgbWVtb3J5IGhvdHBsdWcgZW5kDQo+ICAgeGVuL3g4NjogVXNlIGVudW1l
cmF0aW9ucyB0byBpbmRpY2F0ZSBOVU1BIHN0YXR1cw0KPiAgIHhlbi94ODY6IG1vdmUgZ2VuZXJp
Y2FsbHkgdXNhYmxlIE5VTUEgY29kZSBmcm9tIHg4NiB0byBjb21tb24NCj4gICB4ZW4veDg2OiB1
c2UgYXJjaF9nZXRfbWVtb3J5X21hcCB0byBnZXQgaW5mb3JtYXRpb24gZnJvbSBFODIwIG1hcA0K
PiAgIHhlbi94ODY6IG1vdmUgTlVNQSBzY2FuIG5vZGVzIGNvZGVzIGZyb20geDg2IHRvIGNvbW1v
bg0KPiAgIHhlbi94ODY6IHJlbmFtZSBiYWRfc3JhdCB0byBudW1hX2JhZA0KPiANCj4gUEFSVDM6
DQo+ICAgeGVuOiByZW5hbWUgYWNwaV9zY2FuX25vZGVzIHRvIG51bWFfc2Nhbl9ub2Rlcw0KPiAg
IHhlbjogaW50cm9kdWNlIGEgS2NvbmZpZyBvcHRpb24gdG8gY29uZmlndXJlIE5VTUEgbm9kZXMg
bnVtYmVyDQo+ICAgeGVuL2FybTogdXNlIE5SX01FTV9CQU5LUyB0byBvdmVycmlkZSBkZWZhdWx0
IE5SX05PREVfTUVNQkxLUw0KPiAgIHhlbi9hcm06IGltcGxlbWVudCBoZWxwZXJzIHRvIGdldCBh
bmQgdXBkYXRlIE5VTUEgc3RhdHVzDQo+ICAgeGVuL2FybTogaW1wbGVtZW50IG5vZGUgZGlzdGFu
Y2UgaGVscGVycyBmb3IgQXJtDQo+ICAgeGVuL2FybTogdXNlIGFyY2hfZ2V0X21lbW9yeV9tYXAg
dG8gbWVtb3J5IGJhbmsgZnJvbSBib290aW5mbw0KPiAgIHhlbi9hcm06IGJ1aWxkIE5VTUEgY3B1
X3RvX25vZGUgbWFwIGluIGR0X3NtcF9pbml0X2NwdXMNCj4gICB4ZW4vYXJtOiBBZGQgYm9vdCBh
bmQgc2Vjb25kYXJ5IENQVSB0byBOVU1BIHN5c3RlbQ0KPiAgIHhlbi9hcm06IHN0dWIgbWVtX2hv
dHBsdWdfdXBkYXRlX2JvdW5kYXJ5IGZvciBBcm0NCj4gICB4ZW4vYXJtOiBpbnRyb2R1Y2UgYSBo
ZWxwZXIgdG8gcGFyc2UgZGV2aWNlIHRyZWUgcHJvY2Vzc29yIG5vZGUNCj4gICB4ZW4vYXJtOiBp
bnRyb2R1Y2UgYSBoZWxwZXIgdG8gcGFyc2UgZGV2aWNlIHRyZWUgbWVtb3J5IG5vZGUNCj4gICB4
ZW4vYXJtOiBpbnRyb2R1Y2UgYSBoZWxwZXIgdG8gcGFyc2UgZGV2aWNlIHRyZWUgTlVNQSBkaXN0
YW5jZSBtYXANCj4gICB4ZW4vYXJtOiB1bmlmaWVkIGVudHJ5IHRvIHBhcnNlIGFsbCBOVU1BIGRh
dGEgZnJvbSBkZXZpY2UgdHJlZQ0KPiAgIHhlbi9hcm06IGtlZXAgZ3Vlc3Qgc3RpbGwgYmUgTlVN
QSB1bndhcmUNCj4gICB4ZW4vYXJtOiBlbmFibGUgZGV2aWNlIHRyZWUgYmFzZWQgTlVNQSBpbiBz
eXN0ZW0gaW5pdA0KPiAgIHhlbi9hcm06IGltcGxlbWVudCBhIGR1bW15IDE6MSBub2RlIHRvIHB4
bSBtYXBwaW5nDQo+ICAgeGVuL2FybTogdXNlIENPTkZJR19OVU1BIHRvIGdhdGUgbm9kZV9vbmxp
bmVfbWFwIGluIHNtcGJvb3QNCj4gICB4ZW4vYXJtOiBQcm92aWRlIEtjb25maWcgb3B0aW9ucyBm
b3IgQXJtIHRvIGVuYWJsZSBOVU1BDQo+ICAgZG9jczogdXBkYXRlIG51bWEgY29tbWFuZCBsaW5l
IHRvIHN1cHBvcnQgQXJtDQo+IA0KPiAgeGVuL2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgIHwgIDUgKysNCj4gIHhlbi9hcmNoL2FybS9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICB8ICAyICstDQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TICAgICAgICAgICAgICAgfCAx
MiArKy0tDQo+ICB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jICAgICAgICAgICAgICAgICAgfCAgOCAr
Ky0NCj4gIHhlbi9hcmNoL2FybS9lZmkvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICA1ICsrDQo+
ICB4ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmggICAgICAgICAgICAgfCAyNSAtLS0tLS0tLS0N
Cj4gIHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9udW1hLmggICAgICAgICB8ICA2ICsrDQo+ICB4
ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPiAgeGVuL2Fy
Y2gveDg2L2VmaS9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgIDQgKy0NCj4gIHhlbi9hcmNoL3g4
Ni9lZmkve3N0dWIuYyA9PiBzdHViLXg4Ni5jfSB8IDM3IC0tLS0tLS0tLS0tLS0NCj4gIHhlbi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9jb25maWcuaCAgICAgICB8ICAxIC0NCj4gIHhlbi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9udW1hLmggICAgICAgICB8IDE1ICsrLS0tDQo+ICB4ZW4vYXJjaC94ODYv
bnVtYS5jICAgICAgICAgICAgICAgICAgICAgfCAzMCArKysrKy0tLS0tDQo+ICB4ZW4vYXJjaC94
ODYvc3JhdC5jICAgICAgICAgICAgICAgICAgICAgfCA3NCArKysrKysrKysrKysrKysrKysrLS0t
LS0tDQo+ICB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgMyArDQo+
ICB4ZW4vY29tbW9uL2VmaS9zdHViLmMgICAgICAgICAgICAgICAgICAgfCAzOCArKysrKysrKysr
KysrDQo+ICB4ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgICAgfCAgMiArLQ0K
PiAgeGVuL2RyaXZlcnMvYWNwaS9LY29uZmlnICAgICAgICAgICAgICAgIHwgIDMgKy0NCj4gIHhl
bi9kcml2ZXJzL2FjcGkvTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAyICstDQo+ICB4ZW4vaW5j
bHVkZS94ZW4vbnVtYS5oICAgICAgICAgICAgICAgICAgfCAgMiArDQo+ICAyMCBmaWxlcyBjaGFu
Z2VkLCAxNjIgaW5zZXJ0aW9ucygrKSwgMTE0IGRlbGV0aW9ucygtKQ0KPiAgcmVuYW1lIHhlbi9h
cmNoL3g4Ni9lZmkve3N0dWIuYyA9PiBzdHViLXg4Ni5jfSAoNzElKQ0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9jb21tb24vZWZpL3N0dWIuYw0KPiANCj4gLS0NCj4gMi4yNS4xDQoNCg==

