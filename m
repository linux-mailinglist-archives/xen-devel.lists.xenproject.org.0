Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95856008F1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 10:43:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424175.671420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLir-0005uH-GP; Mon, 17 Oct 2022 08:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424175.671420; Mon, 17 Oct 2022 08:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLir-0005rB-Co; Mon, 17 Oct 2022 08:43:45 +0000
Received: by outflank-mailman (input) for mailman id 424175;
 Mon, 17 Oct 2022 08:43:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rSUT=2S=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1okLip-0005qH-GE
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 08:43:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd826545-4df7-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 10:43:42 +0200 (CEST)
Received: from DU2PR04CA0184.eurprd04.prod.outlook.com (2603:10a6:10:28d::9)
 by AS8PR08MB8899.eurprd08.prod.outlook.com (2603:10a6:20b:5b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 08:43:39 +0000
Received: from DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::86) by DU2PR04CA0184.outlook.office365.com
 (2603:10a6:10:28d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Mon, 17 Oct 2022 08:43:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT040.mail.protection.outlook.com (100.127.142.157) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Mon, 17 Oct 2022 08:43:39 +0000
Received: ("Tessian outbound 2ff13c8f2c05:v130");
 Mon, 17 Oct 2022 08:43:39 +0000
Received: from d1bec5c5ff8d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA95BB1B-0DF5-43FB-9716-BE63709C4001.1; 
 Mon, 17 Oct 2022 08:43:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1bec5c5ff8d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Oct 2022 08:43:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5703.eurprd08.prod.outlook.com (2603:10a6:10:1ad::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Mon, 17 Oct
 2022 08:43:25 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.032; Mon, 17 Oct 2022
 08:43:25 +0000
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
X-Inumbo-ID: cd826545-4df7-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PP8uce3Zx10pkIM9quo2C6wweLsQhpJPXyxTu5BkVriFCEpiwEVYpDyOm9QHRjXnV24ziu4vBjXRqwCMj18Tk2DHwYMXddIUfNK4RQw1WAWDeP8Woie47Rp1zaS61EPUSBK4sJbmo8OBIZE4eGDUHIObIRaK5Pzo/0cXV8TGKbfP2ZTejmSpeaN0OHYuhU5OuvP/Yoyf/vwgoGzaOcuVrwfiwu4TIGaqG2Msb/zg1m6KmDtpuD7KFRfGDmpGhg4GycxCy+PgLyNByGUL6CYOA1FIlZpAC2HjVKfnh87DKh+7rMctbybmx17J4aEOtzQzlNBa7F6KiE/lELWZC1OH5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7t2ZzJlBiNTtLVHmLpMV3QEkEAT7aLIzdqvyTDY8mA=;
 b=N1i3NJnUBis55iE1nxQlM20WbbJtYthgc/XaRYA4Fr68wuVh+x/kMr3he7lrXxGO7BTwTcsZO3NLg5GXlodKHsHzco5+52/Mu8IVgMI5UY59m+tN54bUTgiZXPkUDIWBS3wPqq6kKL0m0cdW//t5Bqk0dWuRIu7W6K0Vpr+qytlBhRb/nYYBOCWilHA17CIpByWnVCro0c3YqjVU9G1Z6lXyTi7V54BCh9GybERnuq0nDjQWw5mmz2pUVkJiehPmOWC/IUF+aXOg2Y66TjLQOG1ZBSL5TtMAgkRGH8d4jQsHPPHX0LH7XrnvVFK8a0R95LQChTvfK0q7dPiPc5x7eg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7t2ZzJlBiNTtLVHmLpMV3QEkEAT7aLIzdqvyTDY8mA=;
 b=VxmnIDIxQiVv4Ttu6w4ZJ9XzBC+9Pk7Ytvauj1U1rlNUKBNa5Mbu7Xk9PWxp0Lof1bm1GRDKSNMbfW7O0tBz7xsMi2LJq97dA/v+wMeNTKBO2p7LQmoZXx1K6GTtmqVkKyjnqi9RfVFnOkyuE25ai3oGlaJELpFPjluvsKKNmm8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmqykeYNBgdPO30Yet95nSFAKQdPNxqraFkxNubeju3x2sUgKPsgqGa3Al/fpDmOgRw3OF4tP5twXdZfW1Bj54eZ29lxaQjeQh+sFkPhM8TJQSxFBMTw/md+59+IZgkL11PC26dOwTFWlo5J1IQwISh6KrjsVDgiegcSU1crFoU2C1AT7HNWdyHynmUktoJ6sQE0ylN/UbJprbpBQ0DyhIlAdCc5jYBCMM9N0gZC9vlVONh/ut7xsJevvCEKgWxombijN0iBZ6QGyD8KaFhV7eZ69Eu3QE+HTK+KZ5+WuupG3wlseaDsx4v9PMTmvPwlNtEgJ7KND4H9PbAS1MdQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7t2ZzJlBiNTtLVHmLpMV3QEkEAT7aLIzdqvyTDY8mA=;
 b=MArEMaaFBPxX5YE01+Jr1QHHdw96uHVELtSHvMkL8QW8Nx5SRjvH5OF1s+FqQ8OOaglT4VdWPYOZdPJyt6VzOgIXtCmjGpHTrsZMNLXlZG3mjD0t/OgfkFzSn20BIkkU0CFRCMgHgsc9qhGmNaMURkr1b4Ke6YTsce/lo1by8YwQ2yXJHf1z0Xp6YXx6YftisibtfIzyAIScPk8t5BujjZuDnVC6fnTn2DqH6db+9BT0OQ0mBQmW7yBz9T644A+TXm1WNuhrRAG4ZQAXPO1rwjUjTC+HfUlMDe3ShuGI8HsDlWroS5oYCLT0eMOrtqWIn8s9T1hFblZHXcg26YLGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7t2ZzJlBiNTtLVHmLpMV3QEkEAT7aLIzdqvyTDY8mA=;
 b=VxmnIDIxQiVv4Ttu6w4ZJ9XzBC+9Pk7Ytvauj1U1rlNUKBNa5Mbu7Xk9PWxp0Lof1bm1GRDKSNMbfW7O0tBz7xsMi2LJq97dA/v+wMeNTKBO2p7LQmoZXx1K6GTtmqVkKyjnqi9RfVFnOkyuE25ai3oGlaJELpFPjluvsKKNmm8=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index:
 AQHY36RSrOIThkYtnEq9RrtWc+uYX64NsO2AgAACdYCAAZeJAIAAAyvQgAL68gCAAABLsA==
Date: Mon, 17 Oct 2022 08:43:25 +0000
Message-ID:
 <AS8PR08MB7991A3DF126C3B68E198AD2792299@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org>
 <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
 <AS8PR08MB7991976335ACE7B47A3FCB9792279@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9c82cde3-fe46-3a3c-20c1-70bd99eb28f2@suse.com>
In-Reply-To: <9c82cde3-fe46-3a3c-20c1-70bd99eb28f2@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 74C8657F287BD74FA36B03CE775C962B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBAPR08MB5703:EE_|DBAEUR03FT040:EE_|AS8PR08MB8899:EE_
X-MS-Office365-Filtering-Correlation-Id: f7488095-cae1-4ed9-b0ff-08dab01bb048
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d497Ng4/r5ylmxQzfHlE2yE+/PK2Ql/D36wKNYHq/AJPeaRPzm/MsV9fkGsGUygOvQvwrnahVEO6XohiZnEtwCnF45ahplowJzAWpcUC9eWLsNzOQMy5P/wPMw7oJe/jIu1gDrL0RX0oioS9/fJKu0cWZxOXU9JGLp7VrzgpTLayeq0Qwh2HKtXXGdvfcDnRaXM2hgptPFGXzuZU+EO8eQg1kF1NpyYeXhLQDGiUCPCdTZXuzsBJWN/jo6c/fF5QMYZLACBoQmDxbF61pOUWrA5Ids6SgoDJOIBUkam9CU4CF7FaLeEgT77DkygZ2pfqKsHfwI6vQ/mvkUJu8bKrd2uoSTj1hXIxj1aB014sX8AgmfqWH5iqzHSfsRNLc/k3yGDyuGHD6xHEIwJHmMcrZuN0chwx6/o7hpOZLIkGl10D73n2gG5wmeo1/zW4uYF+vrJ0wEW+6mY6ENcmsuAFeYdE5e9mFEL9z6DSsQUqhVV7Uckm3CGUmSl8c1TeyRQYCg+nxMOzlDpGbaztfyGggT7l4lqB/LQ6qe4VUwkJgKt54027rjBg08/yjj6RVcT8W8zD1fpzRCUDkdCaj58IrruRXWq1EaoTYPi+qCb0qhbw8Lkvd5ETS4f+qyzp+m94to0aEZLdc2v29OYYeLhMy1uckiw/Wj0IMe83y9Zjhkahk7H9cyB7NzDqLhF5iKROsaW0F/ikNrsPNNvDkIUJJXLIgAJ+HJWPBTD9Ik6H6/18zsLiHXS8MO3I5WYRt8/DwSopdcpm60tajfPwx1mgrw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(451199015)(6916009)(4744005)(66556008)(54906003)(66446008)(8676002)(66476007)(76116006)(64756008)(316002)(478600001)(9686003)(7696005)(6506007)(4326008)(41300700001)(26005)(52536014)(186003)(71200400001)(2906002)(5660300002)(8936002)(38070700005)(83380400001)(38100700002)(66946007)(55016003)(122000001)(86362001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5703
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	29f607de-a8fa-4f22-4615-08dab01ba800
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LDgf4U2UJbhS69n0UhXrcKLU7umvq9FVagFJdr+rzqHwWA7Wl15Mzi2RFwYcToptuBG3OEq/DaJZMxtlTiSfltBJZ/YD6F7DoaKZMk5NzHKqla7qYStLgt3YYO/Io96n/BTojjsEDuNgy2MfF8pWOckGjinKTyhudjjmaCOMOUxNyKaePaARBEbl6dZMDth8peUB+5rW/CVnIaP1BZzlKTODvZLbGgYch7Ea5jEEiORkKiSpDdr9PkIst0FcPPB02uIQUZil5Q5J19PW5LYxT3s8wQRNhqZVpW7RdkNKpCfU1JchH+fsK2pEPKGaRS2rtx27gzz+AK3EZ+fNahIEM//g1y6x3svaFDDZdyG67LVmOGkai3PAcFwgp3teQeGbEAGJIG4VYqDkUzQ9ti1BgW0lS5AqmBkhlkqgLIyu1z1ihK6uiAx80kSkY2Z+6F1dtQiVyUWyUq16uxR+rsbq6eiGmz8qCmbjh3CJR5l75fPIRFruJS39VV09Ibp8+PKNic8Mu4e0vtpfOYinWezf9G1QxtVfEcbJ9LiEoUBcx5e8TmlfUB2BQy2WKQ8cpUYATj1yk0dbgBo6VfuathDZ21otaZyznV4zpOcAqvsEIXDZcZCWLvDkL2jX5OU8tUbLoTKYf1o+LX6JnMQPXMmodS4yPWWEfmXYwyeLV4h/mTe4CcWd5OZPVB2crf1yOE9wVDFmYTJ/D6g4iNx1SEBy6mDu+4Agny5BNwfo457lWPSpJRrqMQcBPbOrm+NdqWq/uhCwyWonw+0UO8IWSpiFDw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(4744005)(54906003)(8676002)(316002)(478600001)(9686003)(7696005)(6506007)(4326008)(41300700001)(26005)(52536014)(186003)(336012)(2906002)(6862004)(5660300002)(8936002)(82740400003)(356005)(81166007)(82310400005)(47076005)(36860700001)(83380400001)(70586007)(70206006)(40480700001)(55016003)(86362001)(33656002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2022 08:43:39.4349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7488095-cae1-4ed9-b0ff-08dab01bb048
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8899

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiBJIGFkZGVkIHRoZSBkb2MgYXNrZWQgaW4geW91
ciBwcmV2aW91cyBlbWFpbC4gQWxzbywgSSB3aWxsIHVzZSBhDQo+ID4NCj4gPiBBU1NFUlQocDJt
X3RlYXJkb3duKGQsIGZhbHNlKSA9PSAwKTsNCj4gPg0KPiA+IGluIHAybV9maW5hbF90ZWFyZG93
bigpIGhlcmUuDQo+IA0KPiBIb3BlZnVsbHkgdGhpcyB3YXMgbWVhbnQgb25seSBhcyBhbiBhYnN0
cmFjdCBwbGFuLCBub3QgdGhlIGV4YWN0IGNvZGUNCj4geW91IG1lYW4gdG8gYWRkPyBBU1NFUlQo
KSBleHByZXNzaW9ucyBnZW5lcmFsbHkgc2hvdWxkIG5vdCBoYXZlIHNpZGUNCj4gZWZmZWN0cyAo
d2hpY2ggaW5jbHVkZXMgZnVuY3Rpb24gY2FsbHMpLg0KDQpZZWFoLCB3aGVuIEkgd3JvdGUgdGhl
IHYzIGNvZGUgSSBub3RpY2VkIHRoYXQgQVNTRVJUIG1pZ2h0IGJlIGxpbWl0ZWQNCnRvIHRoZSBD
T05GSUdfREVCVUcgc28gaW4gdGhlIHYzIEkgc3dpdGNoZWQgdG8gQlVHX09OIHdoaWNoIElJVUMN
CmNhbiBtYWtlIHN1cmUgdGhlIGZ1bmN0aW9uIGNhbGwgaXMgdmFsaWQgYWxsIHRoZSB0aW1lLg0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQoNCg0KPiANCj4gSmFuDQo=

