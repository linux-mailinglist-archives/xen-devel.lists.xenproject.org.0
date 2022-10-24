Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA160A4F0
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 14:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429064.679848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omwQ9-0002VY-Vi; Mon, 24 Oct 2022 12:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429064.679848; Mon, 24 Oct 2022 12:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omwQ9-0002S7-S2; Mon, 24 Oct 2022 12:19:09 +0000
Received: by outflank-mailman (input) for mailman id 429064;
 Mon, 24 Oct 2022 12:19:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akEN=2Z=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1omwQ8-0002S1-KU
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 12:19:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0debc15f-5396-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 14:19:06 +0200 (CEST)
Received: from AS8P250CA0004.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::9)
 by DBBPR08MB6236.eurprd08.prod.outlook.com (2603:10a6:10:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.25; Mon, 24 Oct
 2022 12:19:03 +0000
Received: from AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::ea) by AS8P250CA0004.outlook.office365.com
 (2603:10a6:20b:330::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23 via Frontend
 Transport; Mon, 24 Oct 2022 12:19:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT030.mail.protection.outlook.com (100.127.140.180) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.32 via Frontend Transport; Mon, 24 Oct 2022 12:19:03 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Mon, 24 Oct 2022 12:19:03 +0000
Received: from 600f78acfc7a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 79D5DB03-A37E-4A84-BB17-081611B25DA2.1; 
 Mon, 24 Oct 2022 12:18:56 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 600f78acfc7a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Oct 2022 12:18:56 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by PR3PR08MB5708.eurprd08.prod.outlook.com (2603:10a6:102:84::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Mon, 24 Oct
 2022 12:18:45 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 12:18:45 +0000
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
X-Inumbo-ID: 0debc15f-5396-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NbgB3KFhAHU4LMWr+knGtuHhErRgbPb1yqFZoby2qwOd5q1+g8ltdpAKQiKNa2aBVVTooVjgVn1zrVqvWC7MTSdmrxy397R1MrMx5DB/LqHs3OOx2O0ON9hwKGiZAoMLOFyc1PmKRNwk7qAsC/D2tFa64DdN1vQiV98ry2cOhGrWexcgQwo1qN5P7vMX+oKsEMj8dGqSgRwc1XNJgd9NwLvN7kgKGVSmHr8VcwOStlHTlQxCN+uRe1uK+0Om516h4m/jbXinf6iNVaWoc9acwiJ0QCqE5WJlqKTHyfc3hJO9D0KT/QMMc43SHvIzKpN6VR0S6COPWUykAU5v32iNkA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/Sjc6jRJdXwkBkdhTMQhKo8EjZykD/bE39uMjhYWMw=;
 b=E45Y+tLl7ugXNUPmhufNmylMObqM7tScVUWPahyIKw8hTP12jWdTHUvLPkj50cQe2CE8ZdlkWmw0vTd0kV0x1UbGnzvc53m+7dWs4C4Tkc5o2uhtAt3BEtRKruDllbglW1VtmktdLAM1FKy9lxkuurHxJl0FNOKzwr9xmBFcEeRQ/jjE58nC2fbYBMlk3spnyAQokDcMybEpbzg0VqQYfTHTpdpmw/O01BPdIlV8Kn62m7T6fHL/yMvtc+rp/7TI6yvL8g9UjYi+1Wm3S2Bk29380kRIhg5Ru/K8//UGLA6Zstuyc0eFdJWEP7flFDaO1Q746yvLqDjkWH2eSa8KWQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/Sjc6jRJdXwkBkdhTMQhKo8EjZykD/bE39uMjhYWMw=;
 b=jkjdBp4o8/BbUMrzm94m6PJyKOF4bSJc4RVnuvAh2Megxo/mjstBn5F78UC2VYWr+89fsHubkP16A0/FrHs3b3z7ctqV7tI/NwRkUKdVyLaqr/MmPPII2+K8KeD6WLnTjUPnl3oZrm1xjNJMszT5RLZDXESkU9zfny6yeaKGcWw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e9cc4604d2963f6f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OH4kBTp0Xv4jAbnhaP+8eVdkqZq3gzfKtc7RVA7iqacYNrjZMtaXz9KMwJjKHKFOmWgOKoeIiEa4IlY3Zsv5Ai9h4kgjNxc6t7CncyQcMqMK6+8s0vPDWfiWibpQIzSqjhQ+7Few8FKbXE0NdaW48Jim+R2l11hqQOWWNXwGqcQZdRlu/uKbQdo2GN5DCKmINHf2moj8R8RyyyJLfD9GUs47SV2TSDfxzZfPN0li5JAlSwrF/tnLfZKmDPgc5e/CSPRWfSMwZ9yQf7Ioy8FNKZHdl3QdsqHz2FkaKKUpeLAoRGTQ3Y67r7qw6qV9IQFOjBTsn9VJQFAkcQ1/ciGZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/Sjc6jRJdXwkBkdhTMQhKo8EjZykD/bE39uMjhYWMw=;
 b=HLNk+WA9TyLkqPAyQ6CzXW9VYpPX2mUeM1UZzMcXstNGCtcP5658Qsc+jpPBLPUviN4M64AeCgcphq/aV+bjaF77DSFkO2WR73PkRiyNRTg7bzRcQcCupb65XIJ7xsR+BjYvZgRTf4psCnN8Gv5qi2+p0OKh3Zm9Bv6KlVSkpBzH25XYjC/IKYeo2hGQAl6Gvr7P14TKVH8ZS9U79eAfd2Eoe1ZeC3vdKtPQXeHa4ssgvmr2I+hjDtFZBukEtg0cZyq4Rb6wGiHt1FbiVUThv2nurveiXPcMl32QhbS3gR/SsjxjQx8AMOqtO1Z95mJhYrzDuCxg6QgzxOFk0ckSzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/Sjc6jRJdXwkBkdhTMQhKo8EjZykD/bE39uMjhYWMw=;
 b=jkjdBp4o8/BbUMrzm94m6PJyKOF4bSJc4RVnuvAh2Megxo/mjstBn5F78UC2VYWr+89fsHubkP16A0/FrHs3b3z7ctqV7tI/NwRkUKdVyLaqr/MmPPII2+K8KeD6WLnTjUPnl3oZrm1xjNJMszT5RLZDXESkU9zfny6yeaKGcWw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
Thread-Topic: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of
 hardcoded values
Thread-Index: AQHY55BMcvguN056m0ylAZ3lyVdtTa4ddmQA
Date: Mon, 24 Oct 2022 12:18:45 +0000
Message-ID: <F48F1AE0-C4B3-4614-A428-539DBFC284C8@arm.com>
References: <20221024100536.12874-1-michal.orzel@amd.com>
In-Reply-To: <20221024100536.12874-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|PR3PR08MB5708:EE_|AM7EUR03FT030:EE_|DBBPR08MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: da0214f6-6d94-4902-8023-08dab5b9f074
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SpK4zaxTIKUn/mek5g0jWpZ8aazCREFdTXW+asN3jVwHQPkM3FBKd+awHCPHlyWo5RbDkz3c6VQ2+rKO8JPbZgGCb1FkMi71c30peswsMjnExjmW21K1Ru+PzaRCMlCsuk6RQgvcShEc6Nk929mTcp+jah7loOAxEPxciV+hNr3FIdPGimPhoz9ss1RiSSMEJC4bEBThpE7qqELqC5tjPJD9r9B/WZ5K6WxlJiEiMLGDlf/qGsmIFCKQ8xCK4IM9fNo5txKzXvC/tlz1MYrZVGj8/xOHpBwAQ5e93IRnyTGmSZqrqmBxygTIpVEEW/YoNLBLJWPixXqPSW3BH53zgO89YGf5XPcODNg3Uy2O90mLu3IuP5ACyWxw0C9Jjj8MHaofEvYpCvspfTmXSg3OrjghnYbNpCALRd7OuUglTQ9eO4JWJrlQLZgvOd96INWoOBchXVkPNdRycsfoBF58P0rBfYPrsico2fsAIHddHphI/g/6QxGRc7z/RQwEXG1z8w6PgHHbRb6qdehe+JNRe4qoekpqUOmVVhb1xVoQlYPDMzIV9hn27xHnZZEFm6UqQakzvvLsQoZcZ55L9HX1pCOq09+Yp5fnTVQ96v2VwhJoDH82sOOCIhzuwzAG7EnNcC85zdDXuATmg8ZQ4YolbaLDUqYc9Bnb6CtA4pIMeJ/N2qZUG2J0P9QSprk6z6SOHF9HL6QF+Iysfzn5LhPqO8Mzp9JZJS/py4PN7evbYQupXP9+jhISsSfSuZtndRmpSX9/YGK1PpSrN/rH278chKHcMoIk/ilJ26ahGDjUzJE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(451199015)(6916009)(4326008)(54906003)(8936002)(76116006)(66946007)(66556008)(66476007)(66446008)(26005)(91956017)(64756008)(8676002)(53546011)(41300700001)(6512007)(5660300002)(6506007)(36756003)(186003)(38070700005)(38100700002)(122000001)(4744005)(2616005)(316002)(2906002)(86362001)(478600001)(6486002)(71200400001)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <23710C4E9D5F364A97A84346415CD0D9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5708
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ad6d901-45ae-4732-582e-08dab5b9e5cd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eFdDhIOAH5SzRdv8JhPs1XboGfUhF6BNXJ278f9g4prw3938aPfHHMWI778c/sjJQUtZ6kFg2cGwei9fEq9MQBLcoBLhTLcR+VROBW+6+uNweZaegc4z6bpXnX2oRpcj3zqDfNfUOdWdfaaEtvpxMq7XQaJiYAiwGI9JplJlzcws0IJKN220FCYZHtvUWQnHT7/PVVXvIP286nM9sUeDXDUwFWzqy3boEHvB8085Uvi96RMfqrJbnewJ1UQSfhBdLOloJdxkTdn5FDghE9R8uvHwCSfIG1UdZ7EQoFNztgHwkrgDL5Q/Uim/D4eQqyA856FzQ3Px7JH04FVT+RCkn9ugMNDzpj2Sx/qWIgKys+a5c5SLaCEhm69YMQmCn27NQrlD1wVa6IjyZA64jytmb2qEG18iTFgvH+KdT90aOVRXNwRk9wuVf8eg4911gcrpYOgWNBYlExp5edT7RxfMXhBaB3A/PHOP7neUDex3ivGodV2wHvUytaQE5mS6d9UXfG7KGBjGk2d8nGR8q/Lnp6m0vcEShosRjWvSkk011Dlx83Wcunm8as0dm7f+uSVF7w5/kGoeZjeHLT+eSmeOGPA4FiHkJUSwu8bHRHU6Xus/iRft/cbhkpfCnWIHOKQUQLNfx7zgDxGXIaaQ4HyUQNbWXLa8OpdsZ8nMwCgjjQrr9P27QqnH8E+UpmijZh8rzkv7p2YsBIlh1tEERwhov5ZM1uE5b+j7hj8zTuRjFfrz5qrNpfgSaXP4qmAke67OPiYCnjnTV4LjSTD0HsEEog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(36840700001)(40470700004)(46966006)(2906002)(36756003)(4744005)(316002)(41300700001)(4326008)(70206006)(70586007)(8676002)(5660300002)(478600001)(33656002)(6862004)(54906003)(8936002)(40480700001)(6486002)(356005)(81166007)(82740400003)(107886003)(36860700001)(26005)(53546011)(6506007)(86362001)(47076005)(336012)(2616005)(6512007)(186003)(40460700003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 12:19:03.3465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da0214f6-6d94-4902-8023-08dab5b9f074
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6236



> On 24 Oct 2022, at 11:05, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Make use of the macros defined in asm/pl011-uart.h instead of hardcoding
> the values. Also, take the opportunity to fix the file extension in a
> top-level comment.
>=20
> No functional change intended.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Hi Michal,

Seems good to me!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



