Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498515A8A81
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 03:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396151.636181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTYrv-0004TB-VS; Thu, 01 Sep 2022 01:19:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396151.636181; Thu, 01 Sep 2022 01:19:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTYrv-0004Qa-Ri; Thu, 01 Sep 2022 01:19:43 +0000
Received: by outflank-mailman (input) for mailman id 396151;
 Thu, 01 Sep 2022 01:19:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjVP=ZE=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oTYru-0004QU-8q
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 01:19:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130054.outbound.protection.outlook.com [40.107.13.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26adf8f1-2994-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 03:19:39 +0200 (CEST)
Received: from AS9PR06CA0726.eurprd06.prod.outlook.com (2603:10a6:20b:487::8)
 by GV2PR08MB8025.eurprd08.prod.outlook.com (2603:10a6:150:ad::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Thu, 1 Sep
 2022 01:03:52 +0000
Received: from AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:487:cafe::ca) by AS9PR06CA0726.outlook.office365.com
 (2603:10a6:20b:487::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12 via Frontend
 Transport; Thu, 1 Sep 2022 01:03:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT042.mail.protection.outlook.com (100.127.140.209) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 01:03:52 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Thu, 01 Sep 2022 01:03:51 +0000
Received: from bbb180d4c6ca.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D442AFD9-15E9-430F-B58D-7ED9D8157217.1; 
 Thu, 01 Sep 2022 01:03:46 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bbb180d4c6ca.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 01:03:46 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by PAWPR08MB9447.eurprd08.prod.outlook.com (2603:10a6:102:2e5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Thu, 1 Sep
 2022 01:03:44 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::a809:872b:d8c7:5aa2]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::a809:872b:d8c7:5aa2%3]) with mapi id 15.20.5588.010; Thu, 1 Sep 2022
 01:03:43 +0000
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
X-Inumbo-ID: 26adf8f1-2994-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b0D1u/kIBrfrMQq8X2uAfYeCEPoWk/MIKYo2flGw6ESNklcgkaE0iiyeZjjPZosCD/eXwBg1XMIWr/4pn4s6RUYZNTKtgVXD4WNaZyzBcTwEMOpfpObck/fiktYbxl5oTiM63dubJNF8GJDayLvZFdms2EyCRQ2ZaxkIMUZWyQizfSlX/pwuDrTInJXbMU47ePYnsxoAQi0g/W32etDjSb3d9d0Bf+mJBm2XQaNF49N+shibdqYxbxFd8GN8MlP4Vk218BGIDELrLnqiUhr2bN3Ns2C2umTV5oLS76lWtmVFeZp8E9mHaW9J13BW+wEj6yeTvdCnv65xz0Gm/TMVMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcbC8kkJvMSKdojttAwGwtjlVEAJaFx+DC4gz7xzm+Y=;
 b=De7aioC45ciCBpwuKzJBiiTXBzJ7MR40E6aw/5cMORJDl21cBm7NTb3C0UzVVB7CRDBGmdyMcR02s1+G4XkiNw1/MIDAKiSGe2MDFH4BuZ03y2dHoZmPvidD1/z2dEZbQ06i8PtHOBeqUuEcbUNNmlv2V5CPyMAEGdeHTiRykbD653gz4Lk+NTmaQVOtH1zc60pYjGY6nbToQbtQQgaLihPKYo66ZsLN6K7NHLjRaf8Y16O4113mpZusCE1kZK2gI8tYIBCoE2C2Pk51pt1FX39LWURsK/7R7UVKR47QLVFZapl4+qSkYimOl483PyeUxisMSxIf6S+U2Zxz1pPzOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcbC8kkJvMSKdojttAwGwtjlVEAJaFx+DC4gz7xzm+Y=;
 b=mHmrLhFnrAoeOB9gDZ9amFAFrxR/MNflb2E4cDQYf0ApYqWH457yYBhNrxgISd2xU/BNvi+rP/1wLLyFSDjgdqWY/97gv3EPOJGwkWvfAuIxxi60LyLlRvzEdKmA+7KZ+ide7tK20giWw2/MEAr3KGo6bz1KAFpO/W3ZnBsiLtE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgqLxZiyop9RMTT98xssl6j8jdQxqcjc0m+TNpRnBdQadGOfo3Jd+yUob+PjXmp3SFw7Cb+kvLDYhGoWhK97ur51xy1ez+D8uGdWQERF9IwScz/GHSmdd7O4mLnTxQaVkoEXPC2Vm1o+vPXNAtjnNuVgbUFif1hQMZ6VjfnGd/t86Vhw/vWLs50jXlW6ErjnHZFUIjRkyQhtYfHewhr3Uw5pWUArZIr0kA34Tb2THJaGiPbYJmRLCUS2fRRqm9BimrRNZ1iVY109Hui75ZUgDi+Dq975qhx4elspwPBkCh7WB3TirCGBQ3zhy4XlXYIM4bSHIxjcPQsPgiDvd7yUbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcbC8kkJvMSKdojttAwGwtjlVEAJaFx+DC4gz7xzm+Y=;
 b=QdLlXEvu5tiHAHAp5grWV8T0vCTHg01aMUNa0cx28PmTciwNVhO83ZtHcE5EEpomDMPkDeXavO8JKB9zdJk1uqPFDDPPxiAXXCCng/QCU01acdD9r6xrMENnxQQ7tFkZD9mmODQjrbQGyXS3jEmK2ShKROv1oanqCMSDKYyKgdiDGT9AgiK2r6r0yR/S6o/3Q/6JnTuOvTGlemWudUj7w+/u+IDiDd/MFKFXZ0lgQ70gjPRY1XJCEVo8nvL/0IgFbz870Dd0SpsplvmpbpXJxb3A9GkCC8ryNDjMb/HBb5k+zPE6kL2BU6iIP/0Pt0Uxcza5RH/6eaACiNe9c6lWbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcbC8kkJvMSKdojttAwGwtjlVEAJaFx+DC4gz7xzm+Y=;
 b=mHmrLhFnrAoeOB9gDZ9amFAFrxR/MNflb2E4cDQYf0ApYqWH457yYBhNrxgISd2xU/BNvi+rP/1wLLyFSDjgdqWY/97gv3EPOJGwkWvfAuIxxi60LyLlRvzEdKmA+7KZ+ide7tK20giWw2/MEAr3KGo6bz1KAFpO/W3ZnBsiLtE=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
CC: Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Michal Orzel <michal.orzel@amd.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index: AQHYt4ugTfbCAM/WyEil7pMplK0r3q2/e0SAgAeAsxCAABaogIACundA
Date: Thu, 1 Sep 2022 01:03:43 +0000
Message-ID:
 <GV2PR08MB800143A62FFD20D318D66947927B9@GV2PR08MB8001.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
 <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
In-Reply-To: <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 7CE5F7DD7971084B9E240009A0C1CF57.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9d18511b-a308-4c7b-f982-08da8bb5d5fe
x-ms-traffictypediagnostic:
	PAWPR08MB9447:EE_|AM7EUR03FT042:EE_|GV2PR08MB8025:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 E8vCqgqv2MdCoLSkwwoEtXDAcRLv8UXRFCiHr8YeucTda6e+2ygjSLtdqufdL0Ksc5oU13uMD3vKGVK9kb4S/W6Ygc5HDplZTOX0KqA1XDUQHqOFWjYZ4HVUw64nVQLzbGHCPN3pLPokG32j2I40ZurqqJPC0GOgsny4hG7AXbGA8saKZVUl6f0iYyMS9+wz+gQjd3E4i4hXhjWS89SFRkoX97N7cot7yQ46VxWBJZNe+bCZj+RFaitLtEx4j1Rgp8hji1IjdKIhg/gCystUnS9rOkYcgJITvNtHwiwTEyBXb+ab32lDrGii4CtXMqhiOODlRijHK7OFShath8NE87cNcOe/vg4tWkFzyLmiqRj+CHc+WQ+g2JHIBsg8FUYsKDlVWp9ClZ5o8TW3MtCXKQBAE9DcVoNn5yiCheIXa+FylZ9ZbbOpp01Yph4XQAlcmP1Zfimd9ivP8RhSoy377L5XZmprQv6bXR+AOY/TfKzvfyORRMhsBsIDs4gFYfUMfhq/O741AO+A+QGwr+zfycOOedzD8dgPMJlS5QzNgAU7X/WxU8WsGZRdH29urLR+Ij7Y+et8xAbR9zxBlf3waMOTjlGzeDFvSgOD7AA8Vpjdn3O6Mxb0aA43HeDhsK2us5NglwvkVoLMICL0c3F23keRw1H9OCU3Uq3yExAuJM9O0/w58XnC8lBn2ybNkI58alGO3xGiORY1oSB7T3rqie7tqVNPmwxNJpQ0IIJ2I1lSW+MARWsKvSy6lQxw22xQ80VyMZY/knl9oEHXVW78ow==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(53546011)(76116006)(64756008)(66476007)(41300700001)(66556008)(6506007)(7696005)(52536014)(8676002)(8936002)(5660300002)(66946007)(86362001)(55016003)(83380400001)(186003)(4326008)(478600001)(66446008)(33656002)(9686003)(26005)(2906002)(122000001)(38100700002)(38070700005)(71200400001)(110136005)(54906003)(316002)(6636002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9447
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b13fee9e-7dba-4520-9c16-08da8bb5d0df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qm7CwS4GghRu9qcrz0NRCbfxKZIhuo2liWkLtJ3VSY2lJbR1O4rUYGDmIbExX7t6iM6PDpSVwSUGBtrA4xPKeymd5imXx/ynNqYx7kdD4QFRTz6Jfpdrj7VqVaw/8UH8AK5tympREWYzxo/u5qlZnQfvKKlsxOpbmXxLqHcr2E8PUA9X6vI3VfPJaHSJXQbjfq6JbzG2kvxCggeMr9VFkph3+pZeGX6Dz0MI001gl+yO5YBbqZBS8i3XDyQ0Fl1aZ7GuTji5M28s4rt1rL0loZgNyyFgwJtWrcA9vpE63NQgKij+iZ67TI5kDHKZyePzJ3cHO1ODLnXcDO4o5C1TbOnRrWk3s0tZOT2K5wTPh74zmCeJgORyM5HRBT3DtVAp/SU23nPxCBP2UsneAu1ChIQtheICabauXZ+h6T9H3bV7CQn6h/97mz/7IrFUdjcL1BJ+yki1uIW5S4y/mKo1nLTqjZcGGOjZUqrdp9N2bbXCSyBPHWc6sXNkPxHC93j2FnAxj/3Vuiv5zAUDv3Zr5eRezQ/TcgpbUppJBsoEGU9lF0WmcUXh19n9dPCKr1JTel5aqFTEa8p78Il1kz13iaVpBBx2HZ0qZdM80p+CODUQ2edNu5zvjIVU01VqZAqTvEE0yIQX8N71ofqUYCRKZr+VS/VMNBscZSWri95ky/pGGbejy7A8EfDUlbkPhuqijzzZNu2oVkTlnDZTrgszwi/p51rO7Oni/1szYXhPam/LqO/BhiQdGCKaP5nk+6j0VjshVSVuctw3H+yh48WjBQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966006)(40470700004)(36840700001)(53546011)(2906002)(82310400005)(82740400003)(7696005)(83380400001)(6506007)(55016003)(9686003)(336012)(33656002)(186003)(47076005)(40480700001)(36860700001)(4326008)(86362001)(70206006)(8676002)(40460700003)(70586007)(110136005)(26005)(81166007)(6636002)(316002)(54906003)(52536014)(41300700001)(356005)(5660300002)(8936002)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 01:03:52.1320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d18511b-a308-4c7b-f982-08da8bb5d5fe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8025

SGkgQXJtIG1haW50YWluZXJzLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEhp
IEhlbnJ5LA0KPiANCj4gT24gMzAvMDgvMjAyMiAwODoxMSwgSGVucnkgV2FuZyB3cm90ZToNCj4g
Pg0KPiA+IEhpIE1pY2hhbCwNCj4gPg0KPiA+IFNvcnJ5IGFib3V0IHRoZSBsYXRlIHJlcGx5IC0g
SSBoYWQgYSBjb3VwbGUgb2YgZGF5cyBvZmYuIFRoYW5rIHlvdSB2ZXJ5DQo+ID4gbXVjaCBmb3Ig
dGhlIHJldmlldyEgSSB3aWxsIGFkZCBteSByZXBseSBhbmQgYW5zd2VyIHNvbWUgb2YgeW91cg0K
PiA+IHF1ZXN0aW9ucyBiZWxvdy4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+PiBGcm9tOiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KPiA+PiBT
dWJqZWN0OiBSZTogW1BBVENIIDIvMl0geGVuL2FybTogSGFuZGxlIHJlc2VydmVkIGhlYXAgcGFn
ZXMgaW4gYm9vdA0KPiBhbmQNCj4gPj4gaGVhcCBhbGxvY2F0b3INCj4gPj4NCj4gPj4+IFRoaXMg
Y29tbWl0IGZpcnN0bHkgYWRkcyBhIGdsb2JhbCB2YXJpYWJsZSBgcmVzZXJ2ZWRfaGVhcGAuDQo+
ID4+PiBUaGlzIG5ld2x5IGludHJvZHVjZWQgZ2xvYmFsIHZhcmlhYmxlIGlzIHNldCBhdCB0aGUg
ZGV2aWNlIHRyZWUNCj4gPj4+IHBhcnNpbmcgdGltZSBpZiB0aGUgcmVzZXJ2ZWQgaGVhcCByYW5n
ZXMgYXJlIGRlZmluZWQgaW4gdGhlIGRldmljZQ0KPiA+Pj4gdHJlZSBjaG9zZW4gbm9kZS4NCj4g
Pj4+DQo+ID4+IERpZCB5b3UgY29uc2lkZXIgcHV0dGluZyByZXNlcnZlZF9oZWFwIGludG8gYm9v
dGluZm8gc3RydWN0dXJlPw0KPiA+DQo+ID4gQWN0dWFsbHkgSSBkaWQsIGJ1dCBJIHNhdyBjdXJy
ZW50IGJvb3RpbmZvIG9ubHkgY29udGFpbnMgc29tZSBzdHJ1Y3RzIHNvDQo+ID4gSSB3YXMgbm90
IHN1cmUgaWYgdGhpcyBpcyB0aGUgcHJlZmVycmVkIHdheSwgYnV0IHNpbmNlIHlvdSBhcmUgcmFp
c2luZyB0aGlzDQo+ID4gcXVlc3Rpb24sIEkgd2lsbCBmb2xsb3cgdGhpcyBtZXRob2QgaW4gdjIu
DQo+DQo+IFRoaXMgaXMgd2hhdCBJIHRoaW5rIHdvdWxkIGJlIGJldHRlciBidXQgbWFpbnRhaW5l
cnMgd2lsbCBoYXZlIGEgZGVjaXNpdmUgdm90ZS4NCg0KSSB0aGluayB0aGlzIGlzIHRoZSBvbmx5
IHVuY2VydGFpbiBjb21tZW50IHRoYXQgSSByZWNlaXZlZCBkdXJpbmcgdGhlIGxhdGVzdA0KcmV2
aWV3IG9mIHRoaXMgc2VyaWVzLiBJIGFncmVlIHRoYXQgTWljaGFsIGlzIG1ha2luZyBhIGdvb2Qg
cG9pbnQgKFRoYW5rcyEpIGJ1dCB3ZQ0KYXJlIGN1cmlvdXMgYWJvdXQgd2hhdCBtYWludGFpbmVy
cyB0aGluay4gQ291bGQgeW91IHBsZWFzZSBraW5kbHkgc2hhcmUgeW91cg0Kb3BpbmlvbiBvbiB0
aGUgbW9yZSBwcmVmZXJyZWQgYXBwcm9hY2g/IEkgd2lsbCBkbyB0aGF0IGluIHYyLiBUaGFua3Mg
dmVyeSBtdWNoIQ0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo=

