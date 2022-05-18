Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACCC52B0A8
	for <lists+xen-devel@lfdr.de>; Wed, 18 May 2022 05:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331583.555116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrA9Y-00015M-FG; Wed, 18 May 2022 03:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331583.555116; Wed, 18 May 2022 03:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrA9Y-00013S-Af; Wed, 18 May 2022 03:15:12 +0000
Received: by outflank-mailman (input) for mailman id 331583;
 Wed, 18 May 2022 03:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H9Io=V2=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nrA9W-00013K-0n
 for xen-devel@lists.xenproject.org; Wed, 18 May 2022 03:15:10 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe09::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b828e8c0-d658-11ec-bd2c-47488cf2e6aa;
 Wed, 18 May 2022 05:15:08 +0200 (CEST)
Received: from AS9PR06CA0340.eurprd06.prod.outlook.com (2603:10a6:20b:466::35)
 by AM6PR08MB4390.eurprd08.prod.outlook.com (2603:10a6:20b:be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Wed, 18 May
 2022 03:14:49 +0000
Received: from AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::8f) by AS9PR06CA0340.outlook.office365.com
 (2603:10a6:20b:466::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Wed, 18 May 2022 03:14:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT064.mail.protection.outlook.com (10.152.17.53) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 18 May 2022 03:14:48 +0000
Received: ("Tessian outbound 42cead292588:v119");
 Wed, 18 May 2022 03:14:48 +0000
Received: from abf7c8cd6b19.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6EC7DBD-4C43-4BF4-B562-ADC66058223C.1; 
 Wed, 18 May 2022 03:14:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id abf7c8cd6b19.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 18 May 2022 03:14:41 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM0PR08MB4499.eurprd08.prod.outlook.com (2603:10a6:208:140::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 18 May
 2022 03:14:40 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::a4bc:d09e:df69:27a9%3]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 03:14:40 +0000
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
X-Inumbo-ID: b828e8c0-d658-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gG1xP9Jot7bB0NesIBCHiebkYf7fOn5vD21XZzf4d0JPzjLvDKDlbhrRqjWiJT6UgEoJH+dN6OvYTiEc+pGMxkOFW4Ls05eg3FULe92iaOTSKPvGzHP1Z7LBrSGbVmhvN1YCd6vT5BrKxbuS/4wnFgCSp1KsHOkmTMm2cK4jbjnRHWS61vmfuM7zYU40MAx7DwRDwqMN1jta73IbpsrK0o6PVafFVkDuU6yPHTkUn5cHNiDs5IN8ihhtsRhEg02QTi71u/RlmUifd47SgtfVI1VdW1zyFjkv2s3nToYhsD2v6/k/aI1VOS7afNSwDkk0AT33HtZPoyWOSaIeBTW9Qw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HhYL52tTZTDhLbx2gR/TD6d5xasAT8tHbEkgABTjBw=;
 b=GCDl5vFTUDb+qfozLbFnjStvW6imMMjBr8niNdrFlTJKvt+We1/VriDnmdf2o5N7glvmQlKIGNppwE+R3HTcTmXOp+P5BCKtmHcYVdX8MCoXYR5e8thaI4mtHvQglRpdMImkXjWBjTVB0+/OfGmHjiCta613xI68G1DTtPgABTGcNU3zBWujjmZVifrveZrVn2M6yWz+yj5zD0bY2srvjvVUy/krrvezRvW/tQmZq11QReCfEAB238SUDRWCSnyUepgCPp/WH6B8yzwEBH2D1Kdz5hgd7sab0vLY1hN4kS4py4y6kKDqMeqjPJO/xL7GQ+PkPOKEQNV4ZdKLC5vd1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HhYL52tTZTDhLbx2gR/TD6d5xasAT8tHbEkgABTjBw=;
 b=cZ7V69ATWOQd5/QxGjNlp+SWnIMkyXokHHnuqoTUNo/krDQeweg+Jg3O89kEESSZU9W5buhv3/oSVtO/RobYcLT5WfhONzLhxF+RkqkKLVcOVrwbtOcP7oMXHvT5bE35Nj9DhOG9/dJtR/qserTWJ34mo9yXEoQcqtA4+aTUAA4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldeBN9w7MHV3xS4PXwD01jfnWJChXBGhfhr97wEedTa5S+pm8fBn0J+bQ8AReyU6DVc7i1AnSjbqeOllM9CZWwV76reHNjkjWJMBWn1hP8rRwOV9meL7VolCtrBHszjJrtPbQuBaF0O3QWUljkL4bW8E2X7aRn1+mRIUTrlGk2E0DH49t4cS6S7uaIOIA/xJAuZzwKAvRZihomdrUVMQav10fp9V3cxyJ0j6aoxSaesCdR3HcHVPvn0SHzWTKbynBgsFF0D3VMRJNgnJPvZfQzbfs/jX+tHpqcYqIwKmdR/KoTG/U7qPVfMXmlA16ueIZMivnvmGBKpChNZCfJDYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HhYL52tTZTDhLbx2gR/TD6d5xasAT8tHbEkgABTjBw=;
 b=Y5jyPCkTObr/sve/TFt81ibuykeH7J7y50PbXlQ5u8RrRTawOzdOkJu0HNcF72NazZ+38O4vL2snqsaGXnr2cjdobp0l2k4JzwjBsbJDjUozD03LS49c9hMaYqQL7/7yUhGK+Hchi04MFDC0PO7vxK9izbc45ww6eZx7WX1AZ422AtNCoEBZzoAJFyQICQwZL0OpNI2K7R2pxJoFQDUSCwB9pstZr3SJFujfo45VIGuJJ+aRUpkQ/lPjmEBUnm9RHJb2kkIcYp7YnjKP3p59x0lFrCfcf4Yi9T1wG2DPzGEkBDMLOrB6sekGrHKAIKt1FC8wr8bwgZlvwvGC0kZWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HhYL52tTZTDhLbx2gR/TD6d5xasAT8tHbEkgABTjBw=;
 b=cZ7V69ATWOQd5/QxGjNlp+SWnIMkyXokHHnuqoTUNo/krDQeweg+Jg3O89kEESSZU9W5buhv3/oSVtO/RobYcLT5WfhONzLhxF+RkqkKLVcOVrwbtOcP7oMXHvT5bE35Nj9DhOG9/dJtR/qserTWJ34mo9yXEoQcqtA4+aTUAA4=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v4 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
Thread-Topic: [PATCH v4 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
Thread-Index: AQHYac1fSwyDVJqZLUSNuimuDmM9e60jOyEAgACwTiA=
Date: Wed, 18 May 2022 03:14:40 +0000
Message-ID:
 <DU2PR08MB7325ACBD82A63879F770F8BBF7D19@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220517090529.3140417-1-Penny.Zheng@arm.com>
 <20220517090529.3140417-3-Penny.Zheng@arm.com>
 <e587d965-819c-993f-f5fc-0d863d372507@suse.com>
In-Reply-To: <e587d965-819c-993f-f5fc-0d863d372507@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B8A2DC5DB9E28A4DAFCE65AF32C1AA77.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c1aab616-3836-48a9-345d-08da387c90fc
x-ms-traffictypediagnostic:
	AM0PR08MB4499:EE_|AM5EUR03FT064:EE_|AM6PR08MB4390:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4390C62E59889D9ECE019B80F7D19@AM6PR08MB4390.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 abLBaiwsp2irU4F9TlDBj+ijGCl+L5RIvi1qLqzdjvUv3VfzAhUsuAbCJSUPBKA/nSM2Mh1R574YZPpZjuFfFQ4q2geB2p+00LfBEgMxhycjLnuOGSEOIxq+kTQxLamGulaA2jBXNOHxP2T7tqAll6v5aS1YQgrBJ8fOwd2rF2DiuAeB9OIf9lxkZEX5FN5HZjY9/tGsjxh2VcF3O9XswDbPzBiWsHcwg8fzgWIVb0DuMjrGA62c/X/7irUoPsDm/pr87xrLpzqqpT3p0DIzoybUkElV+A5AIa55hFqLP8WUj45Sp0cZRfBYlKSmTMh8N0Jjj++8NYf6M7EwOo8IwecSA/cv1NZaDNXvL+ofvnER3GeLt7G0CSvVL6m7kdNJwNUiK/sVKvYyrBoCEOPSbNFjQbo4yEeKZFkgzBdvKnM0YWV8ngRagoDwV21SJSce9xDHbTlxKMojrLdlDtW94CLBfUwSEfwa05VYksZfQ6EE2Dx0HJ9g8FCm3/IIjxwcE7/QKaNm11E5cymHfitoKtAZJK/4oGtaI0ac8htwmVGPXytmR5bAqsi46K7gMSIFNuXaeEi9nXGFTGPkKl5SIDQ3Ug6+4c0pZnhVPESNdl7jV1IOsscdghzexIRhxRxlzFxtXyuu9dUaeIs6Ev1BQXGAy16DvLdIHANVw0tyrLTed7vD+4v0Wm8fQ0CxqU6qzTYlyeZugyifD0lXzhZ/lDnPApIK33MyIsTudJkxwMc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(122000001)(2906002)(54906003)(38100700002)(38070700005)(6916009)(7696005)(5660300002)(186003)(8936002)(52536014)(33656002)(508600001)(55016003)(83380400001)(71200400001)(9686003)(6506007)(53546011)(66446008)(4326008)(66946007)(66556008)(66476007)(8676002)(26005)(64756008)(86362001)(76116006)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4499
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ca97d7bb-53d0-4e11-32ab-08da387c8bf5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Qdom2hlm8b2yqil4Ghy2VXjhD1S9FlWW5DvQtvPLsW0O0np9Nk7egxD48ZUpY5Q7gKs2P8eNvh1YrtdXcDARG5hdhS5gmJpMVtBwYTDyfNB+4X1W/GVANDBe4wH1lGs/fLXjJB7vtLwPXfhg2bVkaiuwvsEeB5UkKs+aeymBhp45Uygt1sSJHnwIopL7qwsmVKj/8G9Vo5XzZjVWlSqOTHAuY44Kbwgr/Xaq01DuMu2PlsNWQyMdweqpQV41ebeW0pJXn9UE5ap31GswCgVT+T2XhGJ6xucuWxMdqMCWhp5bRn2sHPDOy65/mgmBaK8PefW8UdFSxmgKXXm1sscUb2kbFhhnfR0W07qgsjpa7AklH9LGdr7WxUWOsD/eiOESKSEcqRLJTfhFCDWTTphirIbmlLCBiM5UuSzznKa4t6Nq/mKcyK4sbJrSi8BLNuLTtTvyKMoMWYfQ1S2KVOeKDGSIE88Mrx3Dz4dEPUrSZmK6z6bKHbeqFWQUlZKs4x6IXj/iPU091U1sGIwT5ir79VQo11NVTsFpzG+xAxLXA9wDOSxtJPE5uSD0+YPUHTcegq+b7RpqeLplli/FMrXrCl2voActFqdCKSZnHvpSnJbcR6lnknWKsQIsLoSicm9ReziyHdEtATlWSc0AQWfWBX5mjsrAYdxrDeqYvBce4qv9m3if3HkkaVsfm7ffdYwslcJCDwQshGZPJzDhHl+B8Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(81166007)(2906002)(83380400001)(47076005)(336012)(356005)(186003)(9686003)(82310400005)(316002)(36860700001)(33656002)(7696005)(4326008)(40460700003)(70206006)(8676002)(6862004)(52536014)(5660300002)(508600001)(70586007)(8936002)(55016003)(53546011)(6506007)(26005)(54906003)(86362001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 03:14:48.5269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1aab616-3836-48a9-345d-08da387c90fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4390

SGkgSmFuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBNYXkgMTgsIDIwMjIg
MTI6MDEgQU0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzog
V2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgQmVydHJh
bmQgTWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNo
dWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0
cml4LmNvbT47DQo+IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAyLzhdIHhlbi9hcm06IGFsbG9jYXRl
IHN0YXRpYyBzaGFyZWQgbWVtb3J5IHRvIHRoZQ0KPiBkZWZhdWx0IG93bmVyIGRvbV9pbw0KPiAN
Cj4gT24gMTcuMDUuMjAyMiAxMTowNSwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gLS0tIGEveGVu
L2NvbW1vbi9kb21haW4uYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vZG9tYWluLmMNCj4gPiBAQCAt
NzgwLDYgKzc4MCwxMSBAQCB2b2lkIF9faW5pdCBzZXR1cF9zeXN0ZW1fZG9tYWlucyh2b2lkKQ0K
PiA+ICAgICAgICogVGhpcyBkb21haW4gb3ducyBJL08gcGFnZXMgdGhhdCBhcmUgd2l0aGluIHRo
ZSByYW5nZSBvZiB0aGUgcGFnZV9pbmZvDQo+ID4gICAgICAgKiBhcnJheS4gTWFwcGluZ3Mgb2Nj
dXIgYXQgdGhlIHByaXYgb2YgdGhlIGNhbGxlci4NCj4gPiAgICAgICAqIFF1YXJhbnRpbmVkIFBD
SSBkZXZpY2VzIHdpbGwgYmUgYXNzb2NpYXRlZCB3aXRoIHRoaXMgZG9tYWluLg0KPiA+ICsgICAg
ICoNCj4gPiArICAgICAqIERPTUlEX0lPIGNvdWxkIGFsc28gYmUgdXNlZCBmb3IgbWFwcGluZyBt
ZW1vcnkgd2hlbiBubyBleHBsaWNpdA0KPiA+ICsgICAgICogZG9tYWluIGlzIHNwZWNpZmllZC4N
Cj4gPiArICAgICAqIEZvciBpbnN0YW5jZSwgRE9NSURfSU8gaXMgdGhlIG93bmVyIG9mIG1lbW9y
eSBwcmUtc2hhcmVkIGFtb25nDQo+ID4gKyAgICAgKiBtdWx0aXBsZSBkb21haW5zIGF0IGJvb3Qg
dGltZSwgd2hlbiBubyBleHBsaWNpdCBvd25lciBpcyBzcGVjaWZpZWQuDQo+ID4gICAgICAgKi8N
Cj4gPiAgICAgIGRvbV9pbyA9IGRvbWFpbl9jcmVhdGUoRE9NSURfSU8sIE5VTEwsIDApOw0KPiA+
ICAgICAgaWYgKCBJU19FUlIoZG9tX2lvKSApDQo+IA0KPiBJJ20gc29ycnk6IFRoZSBjb21tZW50
IGNoYW5nZSBpcyBkZWZpbml0ZWx5IGJldHRlciBub3cgdGhhbiBpdCB3YXMsIGJ1dCBpdCBpcw0K
PiBzdGlsbCB3cml0dGVuIGluIGEgd2F5IHJlcXVpcmluZyBmdXJ0aGVyIGtub3dsZWRnZSB0byB1
bmRlcnN0YW5kIHdoYXQgaXQgdGFsa3MNCj4gYWJvdXQuIFdpdGhvdXQgZnVydGhlciBjb250ZXh0
LCAid2hlbiBubyBleHBsaWNpdCBkb21haW4gaXMgc3BlY2lmaWVkIiBvbmx5DQo+IHJhaXNlcyBx
dWVzdGlvbnMuIEkgd291bGQgaGF2ZSB0cmllZCB0byBtYWtlIGEgc3VnZ2VzdGlvbiwgYnV0IEkg
Y2FuJ3QgcmVhbGx5DQo+IGZpZ3VyZSB3aGF0IGl0IGlzIHRoYXQgeW91IHdhbnQgdG8gZ2V0IGFj
cm9zcyBoZXJlLg0KDQpIb3cgYWJvdXQgSSBvbmx5IHJldGFpbiB0aGUgIkZvciBpbnN0YW5jZSwg
eHh4IiBhbmQgbWFrZSBpdCBtb3JlIGluIGRldGFpbHMuDQoiDQpET01JRF9JTyBpcyBhbHNvIHRo
ZSBkZWZhdWx0IG93bmVyIG9mIG1lbW9yeSBwcmUtc2hhcmVkIGFtb25nIG11bHRpcGxlIGRvbWFp
bnMgYXQNCmJvb3QgdGltZSwgd2hlbiBubyBleHBsaWNpdCBvd25lciBpcyBzcGVjaWZpZWQgd2l0
aCAib3duZXIiIHByb3BlcnR5IGluIHN0YXRpYyBzaGFyZWQNCm1lbW9yeSBkZXZpY2Ugbm9kZS4g
U2VlIHNlY3Rpb24gZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dDogU3RhdGlj
IFNoYXJlZCBNZW1vcnkNCmZvciBtb3JlIGRldGFpbHMuIA0KIg0KDQo+IA0KPiBKYW4NCg0K

