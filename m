Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDAB510F0F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 04:57:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314287.532274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njXra-0006qs-0l; Wed, 27 Apr 2022 02:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314287.532274; Wed, 27 Apr 2022 02:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njXrZ-0006nn-Tu; Wed, 27 Apr 2022 02:57:09 +0000
Received: by outflank-mailman (input) for mailman id 314287;
 Wed, 27 Apr 2022 02:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q6ah=VF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1njXrY-0006nh-UH
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 02:57:09 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9120876-c5d5-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 04:57:07 +0200 (CEST)
Received: from AS8PR04CA0122.eurprd04.prod.outlook.com (2603:10a6:20b:127::7)
 by AM0PR08MB3874.eurprd08.prod.outlook.com (2603:10a6:208:108::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 27 Apr
 2022 02:57:02 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::c1) by AS8PR04CA0122.outlook.office365.com
 (2603:10a6:20b:127::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23 via Frontend
 Transport; Wed, 27 Apr 2022 02:57:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 02:57:02 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Wed, 27 Apr 2022 02:57:01 +0000
Received: from fdcfb8b21f48.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9DC56541-3E2D-488E-A026-C58694ADF2F4.1; 
 Wed, 27 Apr 2022 02:56:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fdcfb8b21f48.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 02:56:56 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBBPR08MB4822.eurprd08.prod.outlook.com (2603:10a6:10:da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 02:56:48 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 02:56:47 +0000
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
X-Inumbo-ID: b9120876-c5d5-11ec-a405-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZGr+4liXdb4ROwukegBJSPuvtq3fqY0mGWmBEd9TmEYx6y65YLpQQYT4OcOn5SGUugmI2AZ5vGj3e5LK3Y/rEF9hWpIBqi6UJ5CWUxlWIQnNJswAnm34Pl8fP+MShOSMDzS7KOmJqFLE//VoFaXTNnStvxlUz+aObCwbQ2zJWMKDSZ1qMHMstZf7Ho71OhOy1JZFO4H1eCo0sssxt0xc9xWNvlrNwtrCkgjkol2O3IT4altq5ALBUzBEIBGJLuU9MfkO+EzjuqchA+eQ17LFk27lhVPYnvEsMp/7f85JbBf7uHNjMYaGY42DJwJ71Wkx72tow4eYhqErJ/NbGCIm2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eiHFMmyAILD3D274G2StM4c98d3voMhn9ruOzklON8=;
 b=FxlkGlyAQ5DPobpSycKLkLyMKGKfsuHeUKtuCY9uTNPVbscYE1vygqvHy1QTi9PGNg/wA8Cxz//maC4EbyWdMds6FmtYfwCjwbesqroYOxQB7WzWHiIIuDZfKXlgqlQcX2PQsj5Lwes731wlvhIYwR/rM0sRyvURSMoGnU61rqkOxocC4Fful9FY94RtP6JYbEDDfvvP2Vm+uIVQUk4PSwcZc9IzCacXVI3+1FvtlxGUcRrljoDjP2pqG6ceuiGCtkAq5JEPRpYzm3JQex+UiSIaoq/g/IB6SapaI6lIjUbE7HBbI/VJZwWPxzN4/nCs6bZdLEKF6Y3R9h39lJ40GQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eiHFMmyAILD3D274G2StM4c98d3voMhn9ruOzklON8=;
 b=4yvd5ZCC5mZRxZsffTWJckUj7E17a793KGEbx6yzbgM1tMuKNE5YmHGVBxf547Tbai4Mozf4XBY8T1txrSgIlNnbuZVXnShlyxq0/f0muHRxUY2oHeBZYQrziTZnxP9KIftx6p8DXcCCPqMku0SKNdmaq6PJAXWN4rI50XmIJ4o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7aHnPdJoazaEZdN8bq6xfGG5U449DmZws6qM1GSoRpciLs2ULZ7kjyqN7E4tibRUlqQKvL/dYfprL/y53pIc2FrmNkH6xh0Cz/hqqZkfnJhQPInc7sP2y22+b+6J2KbpPL86yiQfve1eX9+74HB8U/XPO24Es0YzAovKtFHeAcueqh3dFg9qdY+9CPmhHGs1xSsYdn9HW/SfFLMrkXrxaYaZqxGQlTDwuQUByZRJ3EZNeOTiXCUfwM1euumN8m1iofOJ/UBmH77pw9mVUA4SFXm6vJ4u9prRF3whuAmVmRFI8OPJ4fsI5KEO0iRfDetfZS8DsLR0W3QkdeqW3U23g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eiHFMmyAILD3D274G2StM4c98d3voMhn9ruOzklON8=;
 b=EqMvgq17B8ICDG7ZkZx9p8+9ElNmJpi6jY9sPjKaOgbJTYdEqAmajhL7xgjfjP/7qKT9YK/bvDxUDuaTAoEF664hb6Og08bfKLK9myEBDVffGDKyJQJ+LJtl/Th1A7aSSAxVhL5Kv1WDsKetLosoJ64mIAGtEN2/LyxS3R28HJ5Fx2Iv2BpXeQttvghHEpbHqePMSeiy10bQ8mibvVHqSKvJAuwHKwauX4IyvO7132YrhgvxhD2tbsUgAj9YjogBN9DUHO9+ctiiLbuJ1RPw+8waapZXTn8Kpld9t2TQgkpnrV3SxMbB8QSYwTG9o43bT2/fdAIsdSzWP+wiqsLEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+eiHFMmyAILD3D274G2StM4c98d3voMhn9ruOzklON8=;
 b=4yvd5ZCC5mZRxZsffTWJckUj7E17a793KGEbx6yzbgM1tMuKNE5YmHGVBxf547Tbai4Mozf4XBY8T1txrSgIlNnbuZVXnShlyxq0/f0muHRxUY2oHeBZYQrziTZnxP9KIftx6p8DXcCCPqMku0SKNdmaq6PJAXWN4rI50XmIJ4o=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2 02/10] xen/x86: move reusable EFI stub functions from
 x86 to common
Thread-Topic: [PATCH v2 02/10] xen/x86: move reusable EFI stub functions from
 x86 to common
Thread-Index: AQHYUwP3lRK/2WFhVk685C9kDsNXZq0B8EgAgAAdAwCAAEFBgIAAx9fQ
Date: Wed, 27 Apr 2022 02:56:47 +0000
Message-ID:
 <PAXPR08MB74202E608E9A967458664E7A9EFA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-3-wei.chen@arm.com>
 <3e5b9708-7732-a56c-f2e8-d5d39fd2093e@suse.com>
 <ed949bf4-ba9e-9ad7-b2fe-c63526ca42e5@arm.com>
 <413651ff-55a4-61cf-efed-7ac82f7c6723@suse.com>
In-Reply-To: <413651ff-55a4-61cf-efed-7ac82f7c6723@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E096F2BC68C35D489F3FF3C3650CF201.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7b45806c-ede2-4b63-62b6-08da27f99aac
x-ms-traffictypediagnostic:
	DBBPR08MB4822:EE_|VE1EUR03FT020:EE_|AM0PR08MB3874:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB387483A9B3CF8A4D4B318FC69EFA9@AM0PR08MB3874.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AYU7rvYAX/95ANRIuo+SBB2GZHHMJ0RpoO9YXSeqPNN+iAU3muHCZ6EJ6/MLQuLFw97xok74eJPq33fNXuVsyjFVIjZd1jJywzVzEjmThUN5BzKDj6bDv4/R+tTE5zTy9ZMD2gqTy9Ppx7+CdrCab7lNzhVdgDkAIy0W0ERFQERiiB6+VQ3SzmnOvwAmVUjui+9BgNlLLr4ZXp5SqSY7ZBtt+bZhOnpb33RSJjVixreybPJSAcGv/AEdMnQRspEVHj2jwomu1+wP82d7QgKjEQdef3eog7odt8TaWwzTuArmMQBN8CHM7QhH0v0aaXvLTjcdkTdqJ6EDtSEVyTEj+VlguS8WI77YMKH58S+POFGR7/WR2OgHOpObyWrRq2XpwR2N7iRzFKQPGE+brKKUk4CpWnEem6lokmGkRLsIdgjvBNvsD9gbWkU4bHxwzcdIvedjCxmuvXXgKKjdNI7vaG+pF9doxB6+bgZPTkdTQF6Zc6TVH2z2ZfQfyJ17+D+Tdf8otr4Teb6Ziu/vvjjTbgjcIA6fTQXMGQ7csywcMscMZcKvud6DiMeWIAWZzoA0olg2V+fkIycUog38F1HinKavDIbAHuuMjFu4+Al0DTmOc7ABBUJ+VNB2/6cff5oIKOvuLTCmrKIPPfvwUIvspjPwJXR3eSzRsuDvw6VHI9QZNpGBBZwSJAgB6u57wXsUm3mocEbKBxqmJQ9B4hPESA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(9686003)(5660300002)(83380400001)(26005)(8936002)(52536014)(54906003)(6916009)(33656002)(6506007)(186003)(53546011)(7696005)(122000001)(38100700002)(2906002)(508600001)(38070700005)(86362001)(71200400001)(55016003)(66476007)(76116006)(8676002)(4326008)(66946007)(66556008)(64756008)(66446008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4822
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dee6a041-c748-47eb-f8d8-08da27f99208
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JoCj1iP74FWdaNPH7zVoIgGhSMJ7cRNBV/N0M7eFCQriH6Up3OeGpjSuWNMl2zt9jekKW27sjQR5jjPECdyfWy/Xq8myLVGl5WouvbHxxwc0eAKgU9yXQ89Ri6M5BUmtR/ywoHOgYojENEk87vu+Orl4Q7++1ioSnoZJr4U7v74TPlNodBxMkcuakVGBImquFRwdJiInEtVAZlk/RjLe3d/9YdWURsx2XOHWhLboScKWUL6OgT9CWJGql+c4sCi+vgKCrfSAEQ3c8pNCSL9WLVqRO8ReNopwwxgWF3fLD/lbOP2HUsQZWDsOUObdCgTH/yLKmdJk30c/m2/42+n2Brh95xJL+YIgJn+GJiQZWYKkt1yELOJP1kP5og1nXzNmSlTX/sGampgqZ9QuKR+TLKHaIHwhl1oNv0rQ1O7Ufcid/GEIM23KUiGVivRROYCmWuZjG6F1UDJJsXd2kIXuwA/GNIfBDLSXRKOwt+I/h0VwySER0dE4UIXVOVyuh1pBDnBmqOpp51ZTFrkRrUlXnvG8LQmk8TmberY/4NDAuLlBVf4MyWTc42oGyU0kVRdoj3N9/EvWHAdvxLXwn6MfV+pSyZPlMfbpQyHWi96kUZ2qfrLw4OPWf8UatMSSmcqCqsJ3Wcu7uY1H5pFUi7c6hYQykAJ6UZeE39VMoQfIs42e9HlAR/AWHTDpcsfF4lVi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(55016003)(508600001)(82310400005)(316002)(52536014)(33656002)(5660300002)(70206006)(8936002)(8676002)(83380400001)(336012)(81166007)(54906003)(47076005)(6862004)(4326008)(86362001)(70586007)(26005)(40460700003)(186003)(2906002)(356005)(36860700001)(6506007)(9686003)(7696005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 02:57:02.0269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b45806c-ede2-4b63-62b6-08da27f99aac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3874

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDTmnIgyNuaXpSAyMjozMQ0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBuZCA8bmRAYXJtLmNvbT47
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUNCj4g
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4t
DQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIg
MDIvMTBdIHhlbi94ODY6IG1vdmUgcmV1c2FibGUgRUZJIHN0dWIgZnVuY3Rpb25zDQo+IGZyb20g
eDg2IHRvIGNvbW1vbg0KPiANCj4gT24gMjYuMDQuMjAyMiAxMjozNywgV2VpIENoZW4gd3JvdGU6
DQo+ID4gT24gMjAyMi80LzI2IDE2OjUzLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4gT24gMTgu
MDQuMjAyMiAxMTowNywgV2VpIENoZW4gd3JvdGU6DQo+ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L2VmaS9zdHViLmMgYi94ZW4vYXJjaC94ODYvZWZpL3N0dWIteDg2LmMNCj4gPj4+IHNp
bWlsYXJpdHkgaW5kZXggNzElDQo+ID4+PiByZW5hbWUgZnJvbSB4ZW4vYXJjaC94ODYvZWZpL3N0
dWIuYw0KPiA+Pj4gcmVuYW1lIHRvIHhlbi9hcmNoL3g4Ni9lZmkvc3R1Yi14ODYuYw0KPiA+Pj4g
aW5kZXggOTk4NDkzMjYyNi4uMmNkNWM4ZDRkYyAxMDA2NDQNCj4gPj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9lZmkvc3R1Yi5jDQo+ID4+PiArKysgYi94ZW4vYXJjaC94ODYvZWZpL3N0dWIteDg2LmMN
Cj4gPj4NCj4gPj4gSSdtIG5vdCBoYXBweSB0byBzZWUgYSBmaWxlIG5hbWVkICp4ODYqLltjaF0g
dW5kZXIgeDg2Ly4gSSB0aGluayB0aGUNCj4gPj4geDg2IGZpbGUgd2FudHMgdG8gc2ltcGx5IGlu
Y2x1ZGUgdGhlIGNvbW1vbiBvbmUgKGFuZCB0aGUgc3ltbGlua2luZw0KPiA+PiBiZSBzdXBwcmVz
c2VkIHdoZW4gYSByZWFsIGZpbGUgYWxyZWFkeSBleGlzdHMpLiBOYW1pbmcgdGhlIGNvbW1vbg0K
PiA+PiBmaWxlIHN0dWItY29tbW9uLmMgd291bGRuJ3QgaGVscCwgYXMgYSBzaW1pbGFyIGFub21h
bHkgd291bGQgcmVzdWx0Lg0KPiA+Pg0KPiA+DQo+ID4gSG93IGFib3V0IHVzaW5nIHN0dWItYXJj
aC5jIHRvIGluZGljYXRlIHRoaXMgc3R1YiBmaWxlIG9ubHkgY29udGFpbnMNCj4gPiB0aGUgYXJj
aCBzcGVjaWZpYyBjb250ZW50cz8gSG93ZXZlciwgd2UgY2Fubm90IHByZWRpY3Qgd2hhdCBsaW5r
IGZpbGVzDQo+ID4gd2lsbCBiZSBjcmVhdGVkIGluIHRoaXMgZGlyZWN0b3J5IGluIHRoZSBmdXR1
cmUuIElmIHNvbWVvbmUgbmVlZHMgdG8NCj4gPiBjcmVhdGUgYSBzdHViLWFyY2guYyBsaW5rIGZp
bGUgaW4gdGhlIGZ1dHVyZSwgY2FuIHdlIHNvbHZlIGl0IGF0IHRoYXQNCj4gPiB0aW1lPyAgT3Ig
ZG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zPw0KPiANCj4gSSBkaWQgcHJvdmlkZSBteSBzdWdn
ZXN0aW9uLiBJIGRvIG5vdCBsaWtlIHN0dWItYXJjaC5jIGFueSBiZXR0ZXIgdGhhbg0KPiBzdHVi
LXg4Ni5jIG9yIHN0dWItY29tbW9uLmMuDQo+IA0KDQpXaXRoIG15IGxpbWl0ZWQgRW5nbGlzaCBs
ZXZlbCwgSSBjYW4gb25seSBzZWUgdGhhdCB5b3UgZG9uJ3QgbGlrZSB0aGlzLCBidXQNCkkgY2Fu
J3QgZ2V0IHdoYXQgeW91IHdhbnQgY2xlYXJseSBmcm9tIHlvdXIgY29tbWVudHMuIEkgY2FuIG9u
bHkgZ3Vlc3M6DQpGb3IgIng4NiBmaWxlIHdhbnRzIHRvIHNpbXBseSBpbmNsdWRlIHRoZSBjb21t
b24gb25lIjoNCjEuIERpZCB5b3UgbWVhbiwgeDg2IHN0aWxsIGtlZXBzIGl0IHN0dWIuYyBhbmQg
aW5jbHVkZXMgYWxsIGl0cyBvcmlnaW5hbA0KICAgY29udGVudHMuIFRoZSBjb21tb24vZWZpL3N0
dWIuYyBsaW5rIGJlaGF2aW9yIHdpbGwgYmUgaWdub3JlZCwgYmVjYXVzZQ0KICAgb2YgeDg2IGhh
cyBhIHJlYWwgc3R1Yi5jPyBBbmQgY29tbW9uL2VmaS9zdHViLmMgc3RpbGwgY2FuIHdvcmtzIGZv
cg0KICAgb3RoZXIgYXJjaGl0ZWN0dXJlcyBsaWtlIEFybSB3aG9tIGRvZXNuJ3QgaGF2ZSBhIHJl
YWwgc3R1Yi5jPw0KICAgQnV0IGluIHByZXZpb3VzIHZlcnNpb24ncyBkaXNjdXNzaW9uLCBJIGhh
ZCBzYWlkIEkgY3JlYXRlZCBhIHN0dWIuYyBpbg0KICAgQXJtL2VmaSwgYW5kIGNvcGllZCBBcm0g
cmVxdWlyZWQgZnVuY3Rpb25zIGZyb20geDg2L2VmaS9zdHViLmMuIEJ1dA0KICAgcGVvcGxlIGRp
ZG4ndCBsaWtlIGl0LiBJZiBteSBndWVzcyBpcyBjb3JyZWN0LCBJIGRvbid0IGtub3cgd2hhdCBp
cw0KICAgdGhlIGVzc2VudGlhbCBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIHR3byBhcHByb2FjaGVz
Lg0KMi4gS2VlcHMgc3R1Yi5jIGluIHg4Ni9lZmksIGFuZCB1c2UgaXQgdG8gaW5jbHVkZSBjb21t
b24vc3R1Yi5jLg0KICAgSSB0aGluayB0aGlzIG1heSBub3QgYmUgdGhlIHJpZ2h0IHVuZGVyc3Rh
bmRpbmcsIGJ1dCBJIGNhbid0IHRoaW5rDQogICBvZiBhbnkgb3RoZXIgdW5kZXJzdGFuZGluZy4N
CiAgIEFuZCBwbGVhc2UgZm9yZ2l2ZSBteSBsaW1pdGVkIHJlYWRpbmcgbGV2ZWwgYWdhaW4hDQoN
Cj4gPj4+IC0tLSAvZGV2L251bGwNCj4gPj4+ICsrKyBiL3hlbi9jb21tb24vZWZpL3N0dWIuYw0K
PiA+Pj4gQEAgLTAsMCArMSwzOCBAQA0KPiA+Pj4gKyNpbmNsdWRlIDx4ZW4vZWZpLmg+DQo+ID4+
PiArI2luY2x1ZGUgPHhlbi9lcnJuby5oPg0KPiA+Pj4gKyNpbmNsdWRlIDx4ZW4vbGliLmg+DQo+
ID4+PiArDQo+ID4+PiArYm9vbCBlZmlfZW5hYmxlZCh1bnNpZ25lZCBpbnQgZmVhdHVyZSkNCj4g
Pj4+ICt7DQo+ID4+PiArICAgIHJldHVybiBmYWxzZTsNCj4gPj4+ICt9DQo+ID4+PiArDQo+ID4+
PiArYm9vbCBlZmlfcnNfdXNpbmdfcGd0YWJsZXModm9pZCkNCj4gPj4+ICt7DQo+ID4+PiArICAg
IHJldHVybiBmYWxzZTsNCj4gPj4+ICt9DQo+ID4+PiArDQo+ID4+PiArdW5zaWduZWQgbG9uZyBl
ZmlfZ2V0X3RpbWUodm9pZCkNCj4gPj4+ICt7DQo+ID4+PiArICAgIEJVRygpOw0KPiA+Pj4gKyAg
ICByZXR1cm4gMDsNCj4gPj4+ICt9DQo+ID4+PiArDQo+ID4+PiArdm9pZCBlZmlfaGFsdF9zeXN0
ZW0odm9pZCkgeyB9DQo+ID4+PiArdm9pZCBlZmlfcmVzZXRfc3lzdGVtKGJvb2wgd2FybSkgeyB9
DQo+ID4+PiArDQo+ID4+PiAraW50IGVmaV9nZXRfaW5mbyh1aW50MzJfdCBpZHgsIHVuaW9uIHhl
bnBmX2VmaV9pbmZvICppbmZvKQ0KPiA+Pj4gK3sNCj4gPj4+ICsgICAgcmV0dXJuIC1FTk9TWVM7
DQo+ID4+PiArfQ0KPiA+Pj4gKw0KPiA+Pj4gK2ludCBlZmlfY29tcGF0X2dldF9pbmZvKHVpbnQz
Ml90IGlkeCwgdW5pb24gY29tcGF0X3BmX2VmaV9pbmZvICopDQo+ID4+PiArICAgIF9fYXR0cmli
dXRlX18oKF9fYWxpYXNfXygiZWZpX2dldF9pbmZvIikpKTsNCj4gPj4NCj4gPj4gSSBkb3VidCB5
b3UgbmVlZCB0aGlzIG91dHNpZGUgb2YgeDg2Lg0KPiA+Pg0KPiA+Pj4gK2ludCBlZmlfcnVudGlt
ZV9jYWxsKHN0cnVjdCB4ZW5wZl9lZmlfcnVudGltZV9jYWxsICpvcCkNCj4gPj4+ICt7DQo+ID4+
PiArICAgIHJldHVybiAtRU5PU1lTOw0KPiA+Pj4gK30NCj4gPj4+ICsNCj4gPj4+ICtpbnQgZWZp
X2NvbXBhdF9ydW50aW1lX2NhbGwoc3RydWN0IGNvbXBhdF9wZl9lZmlfcnVudGltZV9jYWxsICop
DQo+ID4+PiArICAgIF9fYXR0cmlidXRlX18oKF9fYWxpYXNfXygiZWZpX3J1bnRpbWVfY2FsbCIp
KSk7DQo+ID4+DQo+ID4+IFNhbWUgaGVyZS4NCj4gPj4NCj4gPg0KPiA+IFlvdSdyZSBjb3JyZWN0
LCBJIGNoZWNrIHRoZSBjb2RlLCBBcm0gZG9lc24ndCBuZWVkIGFib3ZlIHR3bw0KPiA+IGNvbXBh
dCBmdW5jdGlvbnMuIEkgd2lsbCByZXN0b3JlIHRoZW0gdG8geDg2IHNwZWNpZmljIGZpbGUuDQo+
ID4NCj4gPj4gRXZlbiBmb3IgdGhlIG5vbi1jb21wYXQgdmFyaWFudHMgdGhlIG5lZWQgaXMgdW4t
b2J2aW91czogQXJlIHlvdQ0KPiA+PiBpbnRlbmRpbmcgdG8gd2lyZSB0aGVzZSB1cCBhbnl3aGVy
ZSBpbiBBcm0gb3IgY29tbW9uIGNvZGU/IFRoaXMNCj4gPj4gb2YgY291cnNlIGlzIG9uY2UgYWdh
aW4gcG9pbnRpbmcgb3V0IHRoYXQgc3VjaCBjb2RlIG1vdmVtZW50IHdvdWxkDQo+ID4+IGJldHRl
ciBiZSBkb25lIHdoZW4gdGhlIG5ldyBjb25zdW1lcnMgYWN0dWFsbHkgYXBwZWFyLCBzdWNoIHRo
YXQNCj4gPj4gaXQncyBjbGVhciB3aHkgdGhlIG1vdmVtZW50IGlzIGRvbmUgLSBmb3IgZXZlcnkg
aW5kaXZpZHVhbCBpdGVtLg0KPiA+Pg0KPiA+DQo+ID4gWWVzLCBidXQgSSBkaWRuJ3QgZGVsaWJl
cmF0ZWx5IGlnbm9yZSB5b3VyIGNvbW1lbnQgZnJvbSB0aGUgbGFzdA0KPiA+IHNlcmllcy4gSSBh
bHNvIGhlc2l0YXRlZCBmb3IgYSB3aGlsZSB3aGVuIGNvbnN0cnVjdGluZyB0aGlzIHBhdGNoLg0K
PiA+IEkgZmVsdCB0aGF0IHRoaXMgaW5kZXBlbmRlbnQgd29yaywgbWF5YmUgaXQgd291bGQgYmUg
YmV0dGVyIHRvIHVzZQ0KPiA+IGFuIGluZGVwZW5kZW50IHBhdGNoLg0KPiANCj4gV2VsbCwgaXQg
b2YgY291cnNlIGRlcGVuZHMgb24gZnVydGhlciBhc3BlY3RzLiBJZiBpdCBoYWQgYmVlbiBjbGVh
cg0KPiB0aGF0IHdoYXQgaXMgbW92ZWQgaXMgYWN0dWFsbHkgZ29pbmcgdG8gYmUgd2lyZWQgdXAs
IHRoaXMgYmVpbmcgYQ0KPiBzdGFuZGFsb25lIHBhdGNoIHdvdWxkIGJlIG9rYXktaXNoLiBCdXQg
d2l0aCB0aGlzIHVuY2xlYXIgKGFuZCwgYXMNCj4gcGVyIGFib3ZlLCBhY3R1YWxseSBoYXZpbmcg
Z29uZSB0b28gZmFyKSBpdCdzIGltbyBiZXR0ZXIgdG8gbW92ZQ0KPiB0aGluZ3MgYXMgdGhleSBn
ZXQgcmUtdXNlZC4NCj4gDQoNCk9rLCBJIHVuZGVyc3RhbmQgaXQgbm93Lg0KDQpUaGFua3MsDQpX
ZWkgQ2hlbg0KDQo+IEphbg0KDQo=

