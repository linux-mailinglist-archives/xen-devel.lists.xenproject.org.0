Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D728F620721
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 04:02:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439696.693733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osEsL-0002Va-0a; Tue, 08 Nov 2022 03:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439696.693733; Tue, 08 Nov 2022 03:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osEsK-0002Si-Tp; Tue, 08 Nov 2022 03:02:08 +0000
Received: by outflank-mailman (input) for mailman id 439696;
 Tue, 08 Nov 2022 03:02:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ysao=3I=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1osEsJ-0002Sc-Bn
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 03:02:07 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140078.outbound.protection.outlook.com [40.107.14.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9d9d2a3-5f11-11ed-91b5-6bf2151ebd3b;
 Tue, 08 Nov 2022 04:02:06 +0100 (CET)
Received: from AS8PR04CA0136.eurprd04.prod.outlook.com (2603:10a6:20b:127::21)
 by DB9PR08MB9610.eurprd08.prod.outlook.com (2603:10a6:10:454::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 03:01:52 +0000
Received: from VI1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::be) by AS8PR04CA0136.outlook.office365.com
 (2603:10a6:20b:127::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Tue, 8 Nov 2022 03:01:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT030.mail.protection.outlook.com (100.127.144.128) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 03:01:51 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Tue, 08 Nov 2022 03:01:51 +0000
Received: from 3578c3333cac.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9D43F05-68E5-4344-9F67-3447DD530437.1; 
 Tue, 08 Nov 2022 03:01:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3578c3333cac.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 03:01:45 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by PAWPR08MB9519.eurprd08.prod.outlook.com (2603:10a6:102:2f1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 03:01:42 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::461b:c1cb:368c:707e]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::461b:c1cb:368c:707e%5]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 03:01:42 +0000
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
X-Inumbo-ID: b9d9d2a3-5f11-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=abvVDdCBzNImLoMZbpH2lfnJdn/w81V7aABMgNg5RatNeX/2qDGndF7p2JUqaPP3tT1ZyiUIdGOtXE7HlgRUuhUPjrgFncdqcbMcGz0rqVs+j1yA+TPmJDrCbNyuPzV9fyf9baNu/Uhsb+y/bJQQCF4YWtXsWTDqiVEHHIcx0HGQI7x2cpk8Ta5pRgYehK+ta0AfgkRu/Vkzg3YPaKHtHgQWSxKR57cFJCOueJdzh5LGA3/jY2CT9jdJCCygVuE1dFMp4JUtTKZaab/FilQSG7FuHNztCYnh71dBtCYoFGbTKbOejk8wdxijDoQzmv6IiRBHLfgwyCSSunGtU/R6bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jkLaB4R+FaIlTOUeDTc4Xb+ckoCt2cWhkOFAmxpWyk=;
 b=h8PNzZS2cALTb2TtazDfIqqCW/8/sjtGfwne/EfsEel4Bf84fSCIjS6HZ603sp0p7PEwXvck/tFKn96QMZX4LoGE+4AiZfD1gGQUAiAadC5F2pl5lr4cGCOeqSgi1/6DzEdO1r3/QHontbmN6Hv1NuEiXfJ/fNxA1dWMmiKnfbxV27n07Rzn2VS+GtusX1pf0jGR55AfovfhX2/u6I+LszYBIQtyd+EIxReExDReaPQ/3zaLkwgDA6VvuA8Wy/vHkMwAvVWoGM0YIMeuYsjMGv6oaCR8VucHGtCktEHXTudaH+Pjcq/UieMLFIx7ISSxVrW1dTa1hla05y8/kqLQoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jkLaB4R+FaIlTOUeDTc4Xb+ckoCt2cWhkOFAmxpWyk=;
 b=mfju1FBxZsXTxPYZfJZS22DtXnJfP43NfsnabXctPiAjBF16fo9/dDtLKAfADrZQKEV3d28tlDKCwEqI2GTW+L0fq2pw93Gx6LEkLjnlYrqMoKmX99nobPZA4f3cXAkDSYsoHVkXueAqrn6BbqLJv0FKOnVtaFert2V/9YFO11o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLE7a1Q1o8BIu3bkB3S+iy1XULwJOT8VLQx4A4ug1L/1Gu2RczO2+sbnLiEaMBiCRILK1v/rOYD/rsUiiJknWYo0C8qSICB2BI7x84iw0fmVCpBfG3DMIzVfG0EeNW+XZYQ2vrAw46qZyHv9VKZaLqGyusGOqFJRcCM1aEwzPUDydZILTQKUdg0SkMJpBWrofZkPEQmGQbFRuo5BBumIaXkWFPNUF6H4A0NzXBLYg+3Pbzmen3vdnuUspBmz10R7aIl1pMQ2qKU69mAfR0OhevV1rA/zF10HoK5kgo1toIFCLD8u/lCj7EedHWJY0LuXppQDHax14ytO5LJ4NHBIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jkLaB4R+FaIlTOUeDTc4Xb+ckoCt2cWhkOFAmxpWyk=;
 b=QH3M1Gs/eCmmE9XwETB8mLnepwaxHSvqBUssa5UVGNDh3kpXYxoQi6RQossQG8k9bzF/Ecz6nBRvir6v4hpqXCY070EMxBDQ5YT6HMGUkGbyE48WbRffhAjG7QGxSM3s738Hwhq852Ua0g3yrs4a5Pmk2q4PEBSpjPoHeqpN78Z2EofOBS9ooVp1lOCjZ4VmFHuLAl503vsWAziH8Uv1AVvNYHz0fGRJCzUdZ4rp4zvuJakaHK0YF5RdfFIFgUWCB3HfI5QDmpdz6gwy82u3arMkQv9lnMpma97V228xbQIv44HJxfjhSPp9h0NuS+dOLs6yFmob7MMIOxQDZ5rV6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jkLaB4R+FaIlTOUeDTc4Xb+ckoCt2cWhkOFAmxpWyk=;
 b=mfju1FBxZsXTxPYZfJZS22DtXnJfP43NfsnabXctPiAjBF16fo9/dDtLKAfADrZQKEV3d28tlDKCwEqI2GTW+L0fq2pw93Gx6LEkLjnlYrqMoKmX99nobPZA4f3cXAkDSYsoHVkXueAqrn6BbqLJv0FKOnVtaFert2V/9YFO11o=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 10/11] xen/arm64: introduce helpers for MPU
 enable/disable
Thread-Topic: [PATCH v6 10/11] xen/arm64: introduce helpers for MPU
 enable/disable
Thread-Index: AQHY8DVttaMHoZmFwkey/b3g/gof864yY/8AgADDtcCAACIBAIABDoXw
Date: Tue, 8 Nov 2022 03:01:42 +0000
Message-ID:
 <AM0PR08MB45308E166332199F9D274853F73F9@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-11-wei.chen@arm.com>
 <54d6e747-c791-c321-3c75-87613393d789@xen.org>
 <AM0PR08MB45308C4FF75C1D1B6605DC95F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <09e0dfa1-0167-a4b2-63cf-5cf8619fa417@xen.org>
In-Reply-To: <09e0dfa1-0167-a4b2-63cf-5cf8619fa417@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 38D48341A1657F42BBEE45FAC726F389.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|PAWPR08MB9519:EE_|VI1EUR03FT030:EE_|DB9PR08MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c730682-be91-49c4-c0d1-08dac13595db
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 y3pQ+7k+hb8VjPka4awcvN5Iuho+EEon+0QiXoI0Pzgp5ze04TSjdnGFSUpdcawCIUPfhVUtONQBV+Eq2D1ZB0EkOs/xI9qwy4lVSA4so6rU4vPvKQUDLMw7zZ/4z8yhT4biHlkFHr12DwxV+K84c1GtGErPZN86BRIBrlrvGFB7f0UvAhPN7KH3xBFhJYSPiKRFWTxyXvcQsOqmFR8LBdasLeoay+KgXaMr/aLBuLUjZTF79tovSgct2/uu/bqqZGxfhmefhcy8jZf7slJcw4c161hb29x+iecKKkN4+8rFfoqa2Q0/e3R2blkdIljeShgr23GRph3kfL95DW28ZmPMiZWcezcGLfqt4hmysJCBEK9JASzr3ErIO8Wj49iJvT2Takb4KlmW05Ld+P/bNJquRG5ngD0p6/Mp1nu9klmCDStTUVS1FfbDqgNgOxRuNFokjQDtN5DBOFcbtyED5imUllKp6QPIkfL6BCujzx8ggOm77SX+3oBiGleFwMODQu84oP1rpm19TYuvVDFz5qcxFImRcob1NOydYjuzqyPMoT5WDP//q8MHxEUTUWcec5JGfS9MCKr6+jyeEtcyn7iY4w6DCO6yPoH5+tm8SAAJTOZOPe9C5aTTm7MCAcZ0xCaKx6zcMBDQuZoNSqtgHH53InJJMAdeCNd1OGj1t2DmEIcjUhLgDUgq+iOTMXvqlC2hA8hnT8/1w2MtgU6S/8nX6fOvqwHRZMkllmj/lGSbsTuUl6qHfwTCcLOULccIkPsVa2tXcBVL425/W/juPg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199015)(33656002)(86362001)(38070700005)(66476007)(6506007)(55016003)(2906002)(9686003)(186003)(26005)(53546011)(122000001)(83380400001)(7696005)(66446008)(66946007)(66556008)(8676002)(4326008)(54906003)(316002)(64756008)(110136005)(52536014)(478600001)(76116006)(8936002)(71200400001)(41300700001)(38100700002)(5660300002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9519
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	795fb82a-a2d2-46be-d7a4-08dac135905a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RkZzWX3B1frnclZg7d9u8fMdZHbk8+bRPGph/0VTCQctqf8QWZL4liOJIz5KvsNRO5mBIzoUdp9fGaAgEopO3LsRyfpGWgnE7D5Y3ZFHIj7460HeN09fxhdEbjjJDCrgF/iFXoFIwMmvJewc2tZY7+bvWcTT1rtBLR5ZRnG7fvrECQWwHT26uan8lQ5kp6dEyMNHeeZvLfix50Qo4Numykoz8o93mM/+crfoPND7z8ETFt12xUa3WOJxiTy+w2U+aDW6nJ0OBJSjdC20U26e41q31rkxZ2pJ9fCtSv6KXVHiqULC/rTr2ca4aM2BoCvlzy+iHymyFIx/3j3jkm40pM9tVbfZFATRTFgAntEVZ+VJU1VeSm7UWdnxTfWI+lMhf2NmWupdSx+/tkbBubUcLlxW7mtxzEBwrPRfKrMXPklP/bSWIMgRpMVOXqx6sIwfT+zbUPVu/C7WxJKuAZfUI27CAHSGmT1JerrcbGi5O+bwvfFxkcYnGYW+Ky3LplkSSq469m90kgPVMw32BUcSnQnbllJ6/tOtKFMBiuDdNY25DIV5eOu+EwXyBcUcbjhNMpRFeHHGGY5YFd5S3NlvG19DI76cmEr0PzFiXmurXP/QuQhfSvAXZbqXl/YRcYxKj/5TtaueXPtUHXWsGgbrCVSHZTvyEG8wp0ImRFNxxgAHw+jndF/bHpm1l5eHnCnc4s46bZvgR/ikxnYV0sMvAj9/U2FEELQK/bTWzZDilm/+rr9l3129X8gzVjXUgLzRLOwf7xkyN6eXqI5FUWImmg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(110136005)(107886003)(54906003)(6506007)(7696005)(316002)(26005)(70586007)(9686003)(70206006)(8676002)(53546011)(4326008)(478600001)(336012)(2906002)(47076005)(5660300002)(86362001)(33656002)(8936002)(52536014)(41300700001)(83380400001)(82740400003)(36860700001)(81166007)(356005)(40460700003)(186003)(82310400005)(55016003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 03:01:51.6418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c730682-be91-49c4-c0d1-08dac13595db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9610

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBOb3ZlbWJlciA3LCAyMDIyIDY6MzggUE0N
Cj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPFdl
aS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IG5k
IDxuZEBhcm0uY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgQmVydHJhbmQNCj4gTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5
bXlyIEJhYmNodWsNCj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHY2IDEwLzExXSB4ZW4vYXJtNjQ6IGludHJvZHVjZSBoZWxwZXJzIGZvciBNUFUN
Cj4gZW5hYmxlL2Rpc2FibGUNCj4gDQo+IA0KPiANCj4gT24gMDcvMTEvMjAyMiAwOTo1NywgUGVu
bnkgWmhlbmcgd3JvdGU6DQo+ID4gSGkgSnVsaWVuDQo+IA0KPiBIaSBQZW5ueSwNCg0KSGkgSnVs
aWVuDQoNCj4gDQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJv
bTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24g
QmVoYWxmIE9mDQo+ID4+IEp1bGllbiBHcmFsbA0KPiA+PiBTZW50OiBNb25kYXksIE5vdmVtYmVy
IDcsIDIwMjIgNDo1NiBBTQ0KPiA+PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4gQ2M6IG5kIDxuZEBhcm0uY29tPjsg
UGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+OyBTdGVmYW5vDQo+ID4+IFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBCZXJ0cmFuZCBNYXJxdWlzDQo+ID4+IDxCZXJ0
cmFuZC5NYXJxdWlzQGFybS5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA+PiA8Vm9sb2R5bXly
X0JhYmNodWtAZXBhbS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjYgMTAvMTFdIHhl
bi9hcm02NDogaW50cm9kdWNlIGhlbHBlcnMgZm9yIE1QVQ0KPiA+PiBlbmFibGUvZGlzYWJsZQ0K
PiA+Pg0KPiA+PiBIaSBXZWksDQo+ID4+DQo+ID4+IE9uIDA0LzExLzIwMjIgMTA6MDcsIFdlaSBD
aGVuIHdyb3RlOg0KPiA+Pj4gRnJvbTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+
DQo+ID4+Pg0KPiA+Pj4gV2UgbmVlZCBzb21lIGhlbHBlcnMgZm9yIFhlbiB0byBlbmFibGUvZGlz
YWJsZSBNUFUgaW4gYm9vdC10aW1lIGFuZA0KPiA+Pj4gcnVudGltZS4gRm9yIE1QVSBlbmFibGUg
aGVscGVyLCB3ZSBrbm93IHRoYXQgaXQncyBhbiBlc3NlbnRpYWwNCj4gPj4+IHJlcXVpcmVtZW50
IG9mIE1QVSBzeXN0ZW0uIEJ1dCBmb3IgTVBVIGRpc2FibGUsIHdlIG5lZWQgdG8gdXNlIGl0DQo+
ID4+PiBmb3Igc29tZSBzcGVjaWFsIHNpdHVhdGlvbnMuIEZvciBleGFtcGxlLCBpbiB0aGUgcHJv
Z3Jlc3Mgb2YNCj4gPj4+IHRyYW5mZXJyaW5nIGZyb20gYm9vdC10aW1lIHRvIHJ1bnRpbWUsIHdl
IG5lZWQgdG8gdXBkYXRlIHRoZSBNUFUNCj4gPj4+IHByb3RlY3Rpb24gcmVnaW9ucyBjb25maWd1
cmF0aW9uLCBidXQgd2UgY2FuJ3QgbW9kaWZ5IGFuIE1QVQ0KPiA+Pj4gcHJvdGVjdGlvbiByZWdp
b24gaWYgdGhlcmUgaXMgc29tZSBkYXRhIGFjY2Vzc2VkIGJ5IFhlbi4gQnV0IGluDQo+ID4+PiBi
b290LXRpbWUgYWxsIG9mIFhlbiB0ZXh0LCBkYXRhIGFuZCBCU1MgYXJlIGluIG9uZSBNUFUgcHJv
dGVjdGlvbg0KPiA+Pj4gcmVnaW9uLCBpZiBYZW4gd2FudCB0byB1cGRhdGUgdGhpcyBwcm90ZWN0
aW9uIHJlZ2lvbiwgYWJvdmUgcmVzdHJpY3Rpb24gd2lsbA0KPiBiZSB0cmlnZ2VyZWQuDQo+ID4+
DQo+ID4+IFRoaXMgcmFpc2VzIHRoZSBmb2xsb3dpbmcgcXVlc3Rpb246IFdoeSBjYW4ndCB3ZSBj
cmVhdGUgdGhlIHNwbGl0DQo+ID4+IHJlZ2lvbnMgcmlnaHQgbm93Pw0KPiA+Pg0KPiA+DQo+ID4g
VGhlIHJlYXNvbiB3aHkgd2UgYXJlIG5vdCBjcmVhdGluZyB0aGUgc3BsaXQgcmVnaW9ucyByaWdo
dCBub3cgaXMgdGhhdA0KPiA+IHdlIGFyZSB0cnlpbmcgdG8gZ28gdGhlIHNhbWUgcGF0aCBNTVUg
Z29lcy4NCj4gDQo+IFRoZSBNTVUgY29kZSBpcyBnb2luZyB0byBjaGFuZ2UgcHJldHR5IHNvb24g
KHNlZSBbMV0gZm9yIHNvbWUgZ3JvdW5kDQo+IHdvcmspLiBUaGUgcnVudGltZSBwYWdlLXRhYmxl
cyBmb3IgQ1BVMCB3aWxsIGJlIGNyZWF0ZWQgaW4gYXNzZW1ibHkgY29kZQ0KPiBhbmQgbmV2ZXIg
c3dpdGNoZWQgYWZ0ZXIgKGFzaWRlIHdoZW4gdXNpbmcgY2FjaGUgY29sb3JpbmcpLg0KPiANCj4g
QWx0aG91Z2gsIEkgZG9uJ3QgdGhpbmsgSSB3aWxsIGFwcGx5IHRoZSBwcm9wZXIgcGVybWlzc2lv
bnMgaW4gYXNzZW1ibHkgKHRoaXMgaXMNCj4gYSBiaXQgdHJpY2tpZXIgdGhhbiB3aXRoIHRoZSBN
UFUpLg0KPiANCj4gPiBUaGVuIHdlIGNvdWxkIHJldXNlIGFzIG11Y2gNCj4gPiBzYW1lIGludGVy
ZmFjZXMgYXMgd2UgY291bGQsIGluIG9yZGVyIHRvIG5vdCBsZWF2ZSAjaWZkZWYNCj4gPiBDT05G
SUdfSEFTX01QVSBhbGwgb3ZlciB0aGUgcGxhY2UuDQo+IERvIHlvdSBoYXZlIGEgbGlzdCBvZiB0
aG9zZSBpbnRlcmZhY2VzIHRoYXQgd291bGQgcmVxdWlyZSAjaWZkZWY/DQo+IA0KPiA+DQo+ID4+
IEluIHBhcnRpY3VsYXIsIGRpc2FibGluZyB0aGUgTU1VL0NhY2hlIGlzIGZhaXJseSByaXNreSBi
ZWNhdXNlIHlvdQ0KPiA+PiBuZWVkIHRvIGVuc3VyZSB0aGF0IGFueXRoaW5nIGluIHRoZSBjYWNo
ZSB5b3UgY2FyZSBhYm91dCBoYXZlIGJlZW4NCj4gPj4gd3JpdHRlbiBiYWNrIHRvIHRoZSBSQU0p
Lg0KPiA+Pg0KPiA+DQo+ID4gSG9wZSBJIGNvdWxkIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuIHRv
dGFsbHksIHlvdSBhcmUgd29ycnlpbmcgYWJvdXQNCj4gPiBzdGFsZSBpbmZvIGxlZnQgaW4gdGhl
IGNhY2hlLCBldmVuIGlmIGl0J3MgYWx3YXlzIDE6MSBtYXBwaW5nIG9uIHRoZQ0KPiA+IE1QVSBz
eXN0ZW0sIG1lbW9yeSBhdHRyaWJ1dGVzIGNvdWxkIGJlIGRpZmZlcmVudCBiZWZvcmUgYW5kIGFm
dGVyPw0KPiANCj4gTm8uIEkgYW0gbW9yZSBjb25jZXJuZWQgYWJvdXQuLi4NCj4gDQo+ID4gU28g
aXQgaXMgbmV2ZXIgZW5vdWdoIHRoYXQgd2Ugb25seSBmbHVzaCB0aGUgdmFyaWFibGVzIHdoaWNo
IHdlIHdpbGwNCj4gPiB1c2UgZHVyaW5nIHRoZSBkaXNhYmxpbmcgdGltZSwgaXQgc2hvdWxkIGJl
IGV2ZXJ5dGhpbmcgaW4gdGhlDQo+ID4gY2FjaGUuLi46Lw0KPiANCj4gLi4uIHRoaXMuIFdlIGRv
bid0IG9ubHkgbmVlZCB0byBmbHVzaCBiZWZvcmUgdGhleSBhcmUgYWNjZXNzZWQgYnV0IGFsc28g
YWZ0ZXIgaWYNCj4gdGhleSBhcmUgbW9kaWZpZWQuDQo+IA0KPiBJdCBpcyBwb3NzaWJsZSB0byBk
byBpdCBjb3JyZWN0bHksIGJ1dCBpdCByZXF1aXJlcyB0byBiZSB2ZXJ5IGNhcmVmdWwuDQo+IFNv
IGlmIHdlIGNhbiBhdm9pZCBkaXNhYmxpbmcgdGhlIGNhY2hlL01QVSB0aGVuIGl0IHdpbGwgYmUg
YSBsb3QgYmV0dGVyLg0KPiANCj4gPg0KPiA+IFNpbmNlIGluIGN1cnJlbnQgZGVzaWduLCB0aGVy
ZSBhcmUgdHdvIHRpbWUgcG9pbnRzIGluIGJvb3QgdGltZSB3aGVyZQ0KPiA+IHdlIHdpbGwgZGlz
YWJsZSBNUFUvQ2FjaGUgdG8gY29uZmlndXJlIE1QVS4NCj4gPg0KPiA+IE9uZSBpcyBpbiBzZXR1
cF9tbSwgaGVyZSwgd2Ugd2lsbCBtYXAgWEVOIGNvbXBvbmVudHMgYnkgY29tcG9uZW50cywNCj4g
PiBlYWNoIE1QVSBtZW1vcnkgcmVnaW9uIGZvciBhIGRpZmZlcmVudCBjb21wb25lbnQuDQo+ID4g
VGhlIG90aGVyIGlzIG5lYXIgdGhlIGVuZCBvZiBib290IHRpbWUsIHdlIHdpbGwgcmVvcmcgdGhl
IHdob2xlIE1QVQ0KPiA+IG1lbW9yeSByZWdpb24gbGF5b3V0IGJlZm9yZSBnb2luZyBydW50aW1l
LCBhbmQgd2Ugd2lsbCBrZWVwIHVuY2hhbmdpbmcNCj4gcmVnaW9ucyBpbiB0aGUgZnJvbnQgYW5k
IGZsZXhpYmxlIG9uZXMgaW4gdGhlIHJlYXIuDQo+IA0KPiBZb3Ugc2hvdWxkIG5vdCBuZWVkIGFu
eSByZW9yZyBpZiB5b3UgbWFwIHRoZSBib290LW9ubHkgc2VjdGlvbiB0b3dhcmRzIGluDQo+IHRo
ZSBoaWdoZXIgc2xvdCBpbmRleCAob3IganVzdCBhZnRlciB0aGUgZml4ZWQgb25lcykuDQo+IA0K
DQoiaW4gdGhlIGhpZ2hlciBzbG90IGluZGV4IiBpcyByZWFsbHkgc2hpbmluZyBhIGxpZ2h0IGlu
IG15IG1pbmQgOykgQW5kIEknbGwgdHJ5IHRvIGVuYWJsZSBpdA0KaW4gdjIuDQoNCj4gQ2hlZXJz
LA0KPiANCj4gWzFdIDIwMjIxMDIyMTUwNDIyLjE3NzA3LTEtanVsaWVuQHhlbi5vcmcNCj4gDQo+
IC0tDQo+IEp1bGllbiBHcmFsbA0K

