Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9D35A5CD1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 09:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394841.634409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSvZe-0005px-81; Tue, 30 Aug 2022 07:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394841.634409; Tue, 30 Aug 2022 07:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSvZe-0005o1-4u; Tue, 30 Aug 2022 07:22:14 +0000
Received: by outflank-mailman (input) for mailman id 394841;
 Tue, 30 Aug 2022 07:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y69e=ZC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oSvZc-0005ns-NR
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 07:22:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7590ab7e-2834-11ed-a60c-1f1ba7de4fb0;
 Tue, 30 Aug 2022 09:22:10 +0200 (CEST)
Received: from AM6P193CA0037.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::14)
 by AM0PR08MB5026.eurprd08.prod.outlook.com (2603:10a6:208:158::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Tue, 30 Aug
 2022 07:22:06 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::d0) by AM6P193CA0037.outlook.office365.com
 (2603:10a6:209:8e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Tue, 30 Aug 2022 07:22:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 07:22:06 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Tue, 30 Aug 2022 07:22:06 +0000
Received: from 79bcc75e3737.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3E889365-5C49-483A-A6D9-8935C4D8A943.1; 
 Tue, 30 Aug 2022 07:22:05 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 79bcc75e3737.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 Aug 2022 07:22:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM6PR08MB5111.eurprd08.prod.outlook.com (2603:10a6:20b:e9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Tue, 30 Aug
 2022 07:21:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 07:21:51 +0000
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
X-Inumbo-ID: 7590ab7e-2834-11ed-a60c-1f1ba7de4fb0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Kay72jjnYjmXcITWQAate6tMiBezKUF9BEKoDxyvxOTR2Kf9KKxoXf8n6RjLIBW+g0/haQYoMxUiHpMVUyIQsJWWhNNaW0KidfNktA2H2YfjZIqvbsQf/Yld6OHbIIeHgDrt2OApZ6R05FI5owu6tKkdbEK3q7k02lc7j3aD5xGat+/aLLwe7ivRlK3l34sbjO0Lq3ejiSTT1Fx8LJI9n9IvHuO/JtL9rGy0vhMmVoR/Cu7Pov0AHeJ4skhnaXqqtXcN3MBVgM3nmk60DD0dAhuYJkk6w5La5o4bEA9gUL/T7tdb1GQOJ36xsE5bN3+zdo3wI18Ir846+HoQkfO8Ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNP6QTHI8SWLwulHpMP8dT2bA+gEKV1LB+/9qIpcgPI=;
 b=Md6aZbS6+NcnHkjJ1MbmXg8bEBzM1z7Ii+YY64BEflGr0xRQ+//0HvSI42a53Pw4Y6ZYWZZ4f1EmVKfWl9/0TVdokD8iM9biapcdb7Dqo/SblvqhkeQMpS2juNV7LjIL+seEFiAXS87ais1xUPikkerPfKJkRk42CW+RuQOMn8xrf5xi5bWe5Gi8+mu4LGEZZ5WapGIMT2DX33QQa7YKiOFInnHR6GDNOh/e5C3u0tLUW+zfBOCiXuocF3XmDhQxja6T+H7uMZjivlC3O9d6tkAsh8kOtRSuz9Kd3S1eNmicSUoiPbARQB0DxPI/6/XtdWqOasAK/iNqyP3so92nkw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNP6QTHI8SWLwulHpMP8dT2bA+gEKV1LB+/9qIpcgPI=;
 b=K2dxRtwMjQ4OHoUTTIvWLw3pCqhvEKcO4juFwESYWJacG0/klvDANHBWVEjc2xz9Xpo8ncGmHqRWlWn347N4V2ogSbqcsS0chd0+GKxrs++lPKJzrl3GzK3+GdUgyCA8auIILoZL5caluPz/NloTJaH+5MpCK83/Ou7+J1NbNCE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkdxNRzvXDVHQwF7SD0iT97njGNUOrIMqH/jLybWEsb8QnNDeGi8iPBT8Ao8I59WeYlNSOd7MznBnyjt/Yc8MavAToWrP0tsqS06PlA1EdQ09kFsXKBCj2sh5J9Sx0qbdnqj89lH0bRScPVya1ufRZ6YVVmOy2itH/eJdV03MUl1NdOJCes7cUC+W2NcpkNeRhqYNuUYxqAL2sxmh1gsud7sZ3gKahIk3xxuTZEVXaGQfLyRiTm3XFqImg4OhwXgxLAlaa13mfx8q+n0bfiGrUjvP83LEKMsMlZ2U+CEyX/CFqHnVsQ/YRI+NZsYAW3YX/sHEXXID20EqZFJWgaBTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNP6QTHI8SWLwulHpMP8dT2bA+gEKV1LB+/9qIpcgPI=;
 b=n2on0P3A61HIRQJbPZXdoGeYdCEPrTzj2BAGZ3WIKceenJp+sjNY2ndEOt45v+bIwhrP9+qwN1r7nTplgRsARGGkSO1U3pYxyafxFc30tlgMj61NLWXHsqPfn24CfOpt7pMSCkYynS24CtZwyfEifcaYrgCg5LCSYELoJRuUBwjwPndf/3zErUTwuQ7MPpOBEUHABvEd2h/rzyYydFzRR3QLm31kxZ0V1d6D7L4hpRhfJw0qNqJJpGTFzdu8BYaM2kaFwBKyMrrJrMEX2FulbIRGZhG/d0ziibv1i1NIJDp1Nu38yRykRrfb018g5IW25ox27dUEL0aAgvajyOwmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNP6QTHI8SWLwulHpMP8dT2bA+gEKV1LB+/9qIpcgPI=;
 b=K2dxRtwMjQ4OHoUTTIvWLw3pCqhvEKcO4juFwESYWJacG0/klvDANHBWVEjc2xz9Xpo8ncGmHqRWlWn347N4V2ogSbqcsS0chd0+GKxrs++lPKJzrl3GzK3+GdUgyCA8auIILoZL5caluPz/NloTJaH+5MpCK83/Ou7+J1NbNCE=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Penny
 Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Topic: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Index:
 AQHYt4ueuuTQX+2f5E69518db+C55q2+ENkAgAC6AOCAB9oWAIAAAi5wgABddICAAAuRgIAAAO4A
Date: Tue, 30 Aug 2022 07:21:51 +0000
Message-ID:
 <AS8PR08MB79918F9EB171110585B198C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-2-Henry.Wang@arm.com>
 <af2f8888-7223-429e-cc7e-b0950f759608@amd.com>
 <AS8PR08MB7991A2A6EF808136FBF090F392729@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2208291745550.1134492@ubuntu-linux-20-04-desktop>
 <AS8PR08MB7991EC7FAD3D1EDBD379D9C892799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e02175e4-0930-012e-8e79-d4ac8d3be78b@amd.com>
 <9dd32db7-19af-a88c-b09b-fe94828cab93@amd.com>
In-Reply-To: <9dd32db7-19af-a88c-b09b-fe94828cab93@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 477C56B2B7F36041A5D1A932B876781F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4dd9150c-5d04-4201-68ea-08da8a585808
x-ms-traffictypediagnostic:
	AM6PR08MB5111:EE_|VE1EUR03FT040:EE_|AM0PR08MB5026:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 J7qFDzFT9x9fgNOcBDkglHqzJDIxgg1GGcT1BOMbyr/IyiDTv1HAiAo8kbEpxELvCOWQDheVOWqg1HZvBr7CBB0mdKFF15f3Wifjiqj4/qXl2LErtxlejzXqDuJoQzoLCq4QNAwvvbm/Adi9h3I0+s/nPjVMRwT1T0BlLQ1JNj+2oY2UQPJ/Om+yF6u1Bp9LYHSlmteTXEXkbiimUK8SWYHfpt5yWUrMrV9ShiJMdPOfE/U2e008q/sT4kLOmDg7OHFwlhV8fZkrxDAa5tyda1upNq73rHh4cBh3veeCNuws7JrqJcvE0M0WxjggWWvlpod9Evik6iRxAlOykHzrDOAdh6AcZYg/+QAz+vmm369lPB9ADFz635Wf+2MzcfpJ6LrOozVqwkE5u0njv13flVh1vKka3SUdX4TyO71nuzyF+S0iqfzMlGNY4od3sb3HrgsiKC3rd5djCTEgICXHdABobUb7ZN3tAuLLXBBmmjPKipE2163AmBDtbYcbs7O0qT5ebbhVEbufvKopAyHGq116Vjmo1wxFCe8U7RAxCRI/EMjJ+WHlFgOVTi/Wf9R4v6Gc0jGW7dqjjKbcuuN+LBPQUVf2X73tQpBaNVrv/uC+xBpal7bkPSpCO1poYvbmz4PesR4/ZiHsytdhkKWpBzxkQpu758ds7RTPd3wd8T8u6F8hGCPfNnoVPgrAMSL/zHe1UWqyU/lkuF4MEqkS50wFhhLZQD9RbhsCpAVHjpVTN0aw41suIWb3kMHACrQXpsQXz81hCHxb1Kk5FS5/Aw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(122000001)(38070700005)(86362001)(83380400001)(186003)(38100700002)(52536014)(5660300002)(8676002)(66556008)(76116006)(66476007)(64756008)(66946007)(4326008)(66446008)(55016003)(2906002)(26005)(478600001)(71200400001)(41300700001)(7696005)(8936002)(6506007)(110136005)(9686003)(33656002)(54906003)(316002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5111
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55139ace-92ed-4611-6c7c-08da8a584ee9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mSO1CCEFwz4usVhz0reQVBOaOJAOh1MCT9I4O1YCQvn0Efs6Bd2oFBaYMsVUSAXQ2MNsJxIMmHwdYqsLY9mhGSOGY2VjEZyKWcLYUhp3Pl5eeOrfL99/g6mGCglKpvOOOoVHqtWlFu93uUG2aJ/jFO7YpEEIyiGeWREURcvfNCXe1n6E2KbKGMMDkGdq4B08xe/zc1LYg2F0Kzex6SyKfIjjSmLWg+tp/9w5XK4QIod78p7+5xxy8fzZEGzlapcWxh1PBjXBPAIDN8jICRfdPBVZ0v1qS0EX497buCDRUkP+B7qRopE7YXn9dH1UaGD0CdRoQITo0e/pb7eSYMX1ZqOoF8ABExFxgZrhylw8LIw+CHJEN/JWwjTO9j8vQYbElU0NadtktLwtOvFIATsJtlPmUzea7/9pZ2iAvzuJVGr5O0pVoJEnc2bRQf8D/gjvEkbNdnIvSMl0C1TazyVjtAnvybs5tvdG8daW2WFtW4qB81yEjMcvTici9yBptjLA5kq3GmdoKW0XoQY2aoaQiV/m9vmdvmEdKBlyW9VPnUkxDTtjXxXEjvtQgRsm2MgHLrjrpaB7dCYOZX1jOm7QlJ4CQ6KgS1cjYL9sCqVj790ErMtEZxBj0Cwd34VYVP7wMINHtHMN7ZiAtEaNYHMoYd3cw9CMzc5E45Dm4FoZiLj+1iPjo0OeCs5l+GaG+B63zJJzWTrwK8XP1QT7kxnMwv8YDGqY/1MruJbEWU43RbErW9P43KHnQDBokYC84by46vXtD28iPBqk6/ERrOpT8g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(40470700004)(33656002)(81166007)(356005)(82310400005)(316002)(110136005)(54906003)(82740400003)(36860700001)(40480700001)(55016003)(86362001)(40460700003)(47076005)(52536014)(2906002)(8936002)(6506007)(336012)(478600001)(4326008)(186003)(41300700001)(83380400001)(5660300002)(70586007)(70206006)(8676002)(7696005)(26005)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 07:22:06.3954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd9150c-5d04-4201-68ea-08da8a585808
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5026

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4+Pj4+PiArICAgICAgICBwcmludGso
IkNoZWNraW5nIGZvciByZXNlcnZlZCBoZWFwIGluIC9jaG9zZW5cbiIpOw0KPiA+Pj4+Pj4gKyAg
ICAgICAgaWYgKCBhZGRyZXNzX2NlbGxzIDwgMSB8fCBzaXplX2NlbGxzIDwgMSApDQo+ID4+Pj4+
IGFkZHJlc3NfY2VsbHMgYW5kIHNpemVfY2VsbHMgY2Fubm90IGJlIG5lZ2F0aXZlIHNvIHlvdSBj
b3VsZCBqdXN0IGNoZWNrDQo+IGlmDQo+ID4+Pj4+IHRoZXJlIGFyZSAwLg0KPiA+Pj4+DQo+ID4+
Pj4gSW4gYm9vdGZkdC5jIGZ1bmN0aW9uIGRldmljZV90cmVlX2dldF9tZW1pbmZvKCksIHRoZSBh
ZGRyZXNzIGFuZCBzaXplDQo+IGNlbGxzDQo+ID4+Pj4gYXJlIGNoZWNrZWQgdXNpbmcgPDEgaW5z
dGVhZCBvZiA9MC4gSSBhZ3JlZSB0aGV5IGNhbm5vdCBiZSBuZWdhdGl2ZSwgYnV0DQo+IEkNCj4g
Pj4+IGFtDQo+ID4+Pj4gbm90IHZlcnkgc3VyZSBpZiB0aGVyZSB3ZXJlIG90aGVyIHJlYXNvbnMg
dG8gZG8gdGhlICI8MSIgY2hlY2sgaW4NCj4gPj4+PiBkZXZpY2VfdHJlZV9nZXRfbWVtaW5mbygp
LiBBcmUgeW91IGZpbmUgd2l0aCB3ZSBkb24ndCBrZWVwIHRoZQ0KPiA+Pj4gY29uc2lzdGVuY3kN
Cj4gPj4+PiBoZXJlPw0KPiA+Pj4NCj4gPj4+IEkgd291bGQga2VlcCB0aGUgPCAxIGNoZWNrIGJ1
dCBpdCBkb2Vzbid0IG1ha2UgbXVjaCBkaWZmZXJlbmNlIGVpdGhlcg0KPiA+Pj4gd2F5DQo+ID4+
DQo+ID4+IEkgYWxzbyB3b3VsZCBwcmVmZXIgdG8ga2VlcCB0aGVzZSB0d28gcGxhY2VzIGNvbnNp
c3RlbnQgYW5kIEkgYWdyZWUgTWljaGFsDQo+IGlzDQo+ID4+IG1ha2luZyBhIGdvb2QgcG9pbnQu
DQo+ID4gSSdtIG9rIHdpdGggdGhhdCBzbyBsZXQncyBrZWVwIHRoZSBjb25zaXN0ZW5jeS4NCj4g
QWN0dWFsbHksIHdoeSBkbyB3ZSB3YW50IHRvIGR1cGxpY2F0ZSBleGFjdGx5IHRoZSBzYW1lIGNo
ZWNrIGluDQo+IHByb2Nlc3NfY2hvc2VuX25vZGUgdGhhdCBpcyBhbHJlYWR5DQo+IHByZXNlbnQg
aW4gZGV2aWNlX3RyZWVfZ2V0X21lbWluZm8/IFRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoYXQgc28g
anVzdA0KPiByZW1vdmUgaXQgZnJvbSBwcm9jZXNzX2Nob3Nlbl9ub2RlLg0KDQpXZWxsLCB5ZXMg
YW5kIG5vIElNSE8sIGJlY2F1c2Ugd2UgYXJlIHVzaW5nICIjeGVuLHN0YXRpYy1oZWFwLWFkZHJl
c3MtY2VsbHMiDQphbmQgIiN4ZW4sc3RhdGljLWhlYXAtc2l6ZS1jZWxscyIgaW5zdGVhZCBvZiBu
b3JtYWwgIiNhZGRyZXNzLWNlbGxzIiBhbmQNCiIjc2l6ZS1jZWxscyIuIFRoZXNlIHByb3BlcnRp
ZXMgYXJlIGRlcGVuZGVudCBvbiB1c2VyJ3MgaW5wdXQgc28gSSB3b3VsZCBzYXkNCmFkZGluZyBh
IGNoZWNrIGFuZCBwcm9wZXIgcHJpbnRrIHRvIGluZm9ybSB1c2VyIHdpdGggdGhlIHJlbGF0ZWQg
aW5mb3JtYXRpb24NCndvdWxkIGJlIGEgZ29vZCBpZGVhLiBBbHNvIEkgdGhpbmsgY2F0Y2hpbmcg
dGhlIGluY29ycmVjdA0KIiN4ZW4sc3RhdGljLWhlYXAtYWRkcmVzcy1jZWxscyIgYW5kICIjeGVu
LHN0YXRpYy1oZWFwLXNpemUtY2VsbHMiIGFuZCByZXR1cm4NCmVhcmx5IHdvdWxkIGFsc28gYmUg
YSBnb29kIGlkZWEuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg==

