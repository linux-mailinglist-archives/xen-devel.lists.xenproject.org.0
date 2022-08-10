Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB73358EA41
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 12:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383508.618683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLidK-0001CS-UH; Wed, 10 Aug 2022 10:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383508.618683; Wed, 10 Aug 2022 10:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLidK-000190-RS; Wed, 10 Aug 2022 10:08:14 +0000
Received: by outflank-mailman (input) for mailman id 383508;
 Wed, 10 Aug 2022 10:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHWZ=YO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oLidI-00018u-LP
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 10:08:12 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00059.outbound.protection.outlook.com [40.107.0.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 568c9003-1894-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 12:08:11 +0200 (CEST)
Received: from AS9PR06CA0666.eurprd06.prod.outlook.com (2603:10a6:20b:49c::11)
 by AS8PR08MB7025.eurprd08.prod.outlook.com (2603:10a6:20b:34c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 10:08:08 +0000
Received: from AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::5b) by AS9PR06CA0666.outlook.office365.com
 (2603:10a6:20b:49c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15 via Frontend
 Transport; Wed, 10 Aug 2022 10:08:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT003.mail.protection.outlook.com (10.152.16.149) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Wed, 10 Aug 2022 10:08:06 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Wed, 10 Aug 2022 10:08:06 +0000
Received: from dd2f168fbf44.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E9802422-2A09-40AB-9085-6CB38ECC2E6A.1; 
 Wed, 10 Aug 2022 10:07:59 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dd2f168fbf44.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Aug 2022 10:07:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6784.eurprd08.prod.outlook.com (2603:10a6:102:139::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 10:07:57 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 10:07:57 +0000
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
X-Inumbo-ID: 568c9003-1894-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gtWioYClUGyarODH/Tn0X+uMah09sLzit9ov5+jSLc4T8tZz/gmdonDleyLyfS0aiNrmOz/1E9zjXkRD8bCZf4d5dQPOPhq3kIvN0Y8Jl9O4xa/ZnV5aRXTRBmIQ75I535pTwVSbnuTrmEOxLU5p6qwqh2kcTW+z3z3PoXZXP3wKtfo+4gCWXiQbE/y/Mj80PUssWVUbgBuntrS5OocYZ5e+G5/SWhUpD6Vj3jxNa6ft7tgZjRX4zHReKgKwpwPrk6j4xt/0Y0AdmhU7tqh/baKV/m2DYRQ3vROsdYaip+Ave9r6vNe6ltz4kW9XcUEFWNbqKmHJdjxaHi5mmJADEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZNhXIe12mODZAWTu2NFKAjjkycBWBTxGat3A+noRa4=;
 b=Y6cKD8TdLV5wPx5n5Th5ZEgVZ4Ay5W88dFT68JpkFuMQHJLfCm6aJcMsqB1Q9p0dX1wyHyNbsvJF0YykQx9sFB9YiIwuZJWDumViR2qaEqZk+YoskWGcrjaNAPpEkv/zDJ+bwCatwcdE4HTP2bSTTWQkZ5rSVXR4IFtnpDOet2Oi7BbksIyhMLkFyungMej6WK5jGkI+XdQpVYf/4UguFCbLejdp3ET2Wb4AUhd2E0V0SFjdLJbR6j6tZhqHKSwU0vDg+5toL+mKwzCkVprfVBKbvJvxsheR0OMSyeidznKk8sxFBudcrtXwuimf0pWnwjJeb9FbIY1UMAuAhyzd/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZNhXIe12mODZAWTu2NFKAjjkycBWBTxGat3A+noRa4=;
 b=4N0KopabY6S30Fk9Spv9F9Jqau1+l6CI3XybFkqdZg2J5Tdk5ydVhy1owXvIxJWuJNojIJjRS2EyQ1G7Y15OI+S20gUP4D0wDQTEHUS7GyuuJQC6xShMp0cS5USUq8QnQ+BB3qvxx9FxkG3M9fd7uNxYV4c0L1NlevaOO8soNlU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 330dd1085240d701
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RcMlhib3kGBOpdEt/nxE3ofj1XqOBTPBui0Cv+lw8hk7Me6ys3YtD6HyrOi7UnhAEjkMcSd2jBaCAp5Xdbk3IqpinFECP/9tlQjrobNy+lbD6Y5LQVwqSpLDp3BY2luPqJXsQ9Tr8Ip8dLHJqFLZgg7rcOtPXr99hanznC5CRRFlouZGacYia9BR40biomOSdjYT3PpfLBYQAKekPFcT/3N77qiPXvMLNSvNN60FJtv8q76MbHl8mNdlntkgoBMKtX/I0ggF2KnaKDiji4o8GGsqdQciYBrJcVdc5UW7W8UiyyqCp2AWJiQOf5WzxRzU+r8V6/zsWGM+ZuM8AXBiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZNhXIe12mODZAWTu2NFKAjjkycBWBTxGat3A+noRa4=;
 b=ZOqxgXVqdxhv/rXWMggZryoIBwnOnLbZlTCyH1ybpI2FLgh9R+wmasF6f231y6fMgxKxODS04D2QnUK61tjEZlTTc4/MBojOkPaJ+XUTwJ7+bGv9y0ALq4Y276GVPhql+NH41qFwYkY5U41hBN3yZ1qEkCLwL2FsD1o9v5WxZn19W99/FPIPxyR3v2bW+xVY+mt81ThDYkm4EXZ6KEG9Xg7UM4d1vj73pXId1hgsBtGh5m2ePbH7Uqa8a2tT0v4NryajJfLhBmR0K3UQYLI3yd3fBadXAJ/HSstw36NiogS4+lwASiNbWeQA5OBMM3GJMYH5IAgSCLJbdiHqA3fqOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZNhXIe12mODZAWTu2NFKAjjkycBWBTxGat3A+noRa4=;
 b=4N0KopabY6S30Fk9Spv9F9Jqau1+l6CI3XybFkqdZg2J5Tdk5ydVhy1owXvIxJWuJNojIJjRS2EyQ1G7Y15OI+S20gUP4D0wDQTEHUS7GyuuJQC6xShMp0cS5USUq8QnQ+BB3qvxx9FxkG3M9fd7uNxYV4c0L1NlevaOO8soNlU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vgic: Fix coding style in macro REG_RANK_INDEX()
Thread-Topic: [PATCH] xen/arm: vgic: Fix coding style in macro
 REG_RANK_INDEX()
Thread-Index: AQHYrJ8rGrSNIysILUarIEyFwudE/62n6OAA
Date: Wed, 10 Aug 2022 10:07:57 +0000
Message-ID: <23155CA0-7D7A-4D36-9D3A-ECEE81048138@arm.com>
References: <20220810095356.1906405-1-burzalodowa@gmail.com>
In-Reply-To: <20220810095356.1906405-1-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 109aa320-2688-42d6-faac-08da7ab83865
x-ms-traffictypediagnostic:
	PAXPR08MB6784:EE_|AM5EUR03FT003:EE_|AS8PR08MB7025:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xORgs2VNblnbklWfo0jyJ4akxxBqZO/16vJ2A9edHCOpFBo1uWwmLVka0ZX0u0oCJjMfl9qUcfHB90yoAQnfgij8FJiHwF7tYpMQqlwaux5KhPGvs4tS+Z2yCrbmpL29hCPSzGxBDHi/5k+Y379ydVCtDFDcaUqtsiGZIkjm3H9wfPasxWVyoSF+xYyWJw9ewUgy8dUuVdDlqv5jj8JXfgB946xPE4TOdMJymkeq9ctXicz/D+erRWd9RnoCWY3G12rew/WRY6UT1pl35Wobanj3uvaLi5FR0Cse/XSjq8efFPhCeThB1cj86E7q0q/5yPhGVWchOlM59U+cXa1sEj/Y0cvwCVo+rWrAM0dRRqgEJEcpsY9wYGqCxxGa+OxhMEEU/THXBoK1oS25KPGVYOxp1yCaLCr2rZkQpBbD3RYMBAdKDhddt5XASvBHWph7qY5HRIyhTwwB6mZSbHbjDSyW2WXsOjb0hKYjIhErwV7Bi7FHJHI0S8mIYh4hq+JMFGZxy8J7SCBfCZL+JJnZK/GcLPNL9QVBACIHjgFhoroV3ZD3dyhX8EU2HEQu/spCumiSWqID8r7J3SADeo6Bcy/Y5bWiKq33pzgC7DM6Or7luX5JdB6PgvGQuccOwYXDIrkTUQ22/figB6eyuOONJqVlMLFNCAqsAOc0y+Z/a4jIl2+8a36zxheT2Wjg7kHBJ/vDzlGEbYYYpQELA4cLUAcZHieEk377dOfNNQHLMqYfFzFQW4JfutWBTPj+OpUP4bFWgHUpwt4V2y+JEsiPhaxZc92kou0sYr57ofxyFlUVmTFZrltQ14o/oNEsF6imCZDsz1bZKfMUpAhY7g2VPw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(86362001)(53546011)(41300700001)(6506007)(6512007)(26005)(2616005)(122000001)(38100700002)(38070700005)(186003)(83380400001)(2906002)(36756003)(91956017)(66476007)(8936002)(5660300002)(66446008)(33656002)(76116006)(316002)(54906003)(478600001)(6916009)(66556008)(6486002)(4326008)(71200400001)(66946007)(8676002)(64756008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FE78957F9525414D96793152D9D9D432@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6784
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ff6fad6e-64eb-41f9-5ea5-08da7ab83315
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2jDKlIuwSbnl29TSvYGIt/sBkyZvk4xc/9gbbFNuOWhL9UAJkS8fU1MqhBvZRVfhGfSdaTGOEtcu3kkq5QPCzb+SgQvYlG0ZNBHYcY2aUqaKPAkbFt0BQV426CVGMJvDq/JSKN0dTR/HmxRQ5asA02xKOR8vY38GLBj9CDmsBI1jeTrb8v58BFn7aB71KZ/1xR8XYZ4b8qMQgsyzchUbK8RorwVQlu/NaVYc+VQry19dDgH4FdeoQL5bPW0OQ1wTUU21BMNaSOmmg7AmiKKp+Kv8kkUN07voEhbJM1l/gFcPQ5qHbF6zhFrRcYlW2JwyNyC6YM0hTI3dCMiJwATDWbOL1RK6an/o/y3jRfB+FodWRx1zc77O7gInIV+aK7nQT5hXHk95KB74FuoFk07N2tawMlCFW5glTBSoVd4UTv0FaxLroq/3ojouLruo+ancsAhfEccj3GpvC8o7LmMb7c2VhCHfabpH47qi9R+5Dv4LTfDeuWyA3QSmO6GntCzLJjb4gJSBvTBkSpd7oXsjI4qTW/TVTNiF1SVNzBKPX/ACYAHgwz09RyVITpaxOM5V3ZF+XXNDqq0/gpUJQ1xiuKKVkkaYhOGArwQQBrTVkW62LyHMM1MevOMvLl616hLyJqAHFmk1+FlW+vsQNi9h6yv+vK94hFuokvCOstEDWoIAYtfpY2UDjU3rqE5wo4CO7+RoZRqQA+LFw3vWyTkm0Q6Wt1RqMUHft6aW0ZIu8t9Z1UlqXr095RZocV1hMToWQeSm1VaU4lu6SBhvS03vs4Qn9MQ4Nbh8RwgXh2JCiyNgYsmffkTZvRhOOJRPa+xI
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(46966006)(36840700001)(40470700004)(83380400001)(33656002)(6506007)(70586007)(53546011)(186003)(41300700001)(70206006)(4326008)(40480700001)(82310400005)(82740400003)(2616005)(316002)(336012)(54906003)(47076005)(107886003)(8676002)(6512007)(26005)(36756003)(86362001)(2906002)(40460700003)(8936002)(81166007)(6862004)(478600001)(6486002)(356005)(36860700001)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 10:08:06.4656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 109aa320-2688-42d6-faac-08da7ab83865
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7025

Hi Xenia,

> On 10 Aug 2022, at 10:53, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> Add parentheses around the macro parameter 's' to prevent against uninten=
ded
> expansions. This, also, resolves a MISRA C 2012 Rule 20.7 violation warni=
ng.
>=20
> Add white spaces around the subtraction operator.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/include/asm/vgic.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index d2a9fc7d83..3d44868039 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -286,7 +286,7 @@ static inline paddr_t vgic_dist_base(const struct vgi=
c_dist *vgic)
>  * Offset of GICD_<FOO><n> with its rank, for GICD_<FOO> size <s> with
>  * <b>-bits-per-interrupt.
>  */
> -#define REG_RANK_INDEX(b, n, s) ((((n) >> s) & ((b)-1)) % 32)
> +#define REG_RANK_INDEX(b, n, s) ((((n) >> (s)) & ((b) - 1)) % 32)
>=20
>=20
> extern struct vcpu *vgic_get_target_vcpu(struct vcpu *v, unsigned int vir=
q);
> --=20
> 2.34.1
>=20


