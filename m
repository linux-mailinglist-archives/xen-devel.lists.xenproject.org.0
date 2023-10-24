Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7B7D51C9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621959.968961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHTE-0003bl-F1; Tue, 24 Oct 2023 13:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621959.968961; Tue, 24 Oct 2023 13:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHTE-0003ZJ-BG; Tue, 24 Oct 2023 13:29:20 +0000
Received: by outflank-mailman (input) for mailman id 621959;
 Tue, 24 Oct 2023 13:29:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q5Q5=GG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qvHTC-0003Fc-T4
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:29:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20625.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53fb207b-7271-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 15:29:16 +0200 (CEST)
Received: from AS4P189CA0009.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::13)
 by AS8PR08MB10026.eurprd08.prod.outlook.com (2603:10a6:20b:632::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 13:29:13 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::e9) by AS4P189CA0009.outlook.office365.com
 (2603:10a6:20b:5d7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Tue, 24 Oct 2023 13:29:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Tue, 24 Oct 2023 13:29:13 +0000
Received: ("Tessian outbound d9a8e74be042:v215");
 Tue, 24 Oct 2023 13:29:13 +0000
Received: from c30ea2029b17.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81359613-7EE7-499E-BDB0-CDE8ED87E598.1; 
 Tue, 24 Oct 2023 13:29:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c30ea2029b17.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Oct 2023 13:29:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8345.eurprd08.prod.outlook.com (2603:10a6:10:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Tue, 24 Oct
 2023 13:29:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::1635:b3e9:e4e7:943d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::1635:b3e9:e4e7:943d%6]) with mapi id 15.20.6907.025; Tue, 24 Oct 2023
 13:29:01 +0000
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
X-Inumbo-ID: 53fb207b-7271-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p10cVJ7BPWinbcn7KONl6JhZ0yaQr4n3DUu9Sc9DwA8=;
 b=2m8fQ9PVbPNuvmAn1JhZpXlAL7V8eKVT/h3GJn/hmNfiGx6DIC+mE6iyiP5icwgDGVhO0oyo16WxKUmD/HJZEN3cSK85ZuPEM5oIxIf8tW4FjD9SCGwetMbtfs72+aSqxIgc9AQ+iRMt0VxxeUPdhKJs6DOjcDQnNOZVyt3fn6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c94a2fc2fec4336
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3kSKww3Ce4gx1xXXTtHhzg+CoSlstTk8OiU4Z9DtUxMMrWEMAVe1XLk8OWucUeyNgrU9olLAMgh4O/qg6BNeUo+QeiTY3LQ+VEpVULEHhmg9qXnAQZWONCtB1imqzcHZjHO7M0tuQMkdRYkCEbpNCCB+OasFxvNU40/p1lwKqzdND1naO0XS8o70H9MmOsc/1b9Kyu1M5rAcn8GEF2LQBhEkth5fEgEyGQWBMoa0KWHIwM9Q6D1HVzmTa3zyHptIPnkWwyS3h2M59TsjX1L14Zqiz8ROJqwOJ5PBYB9NZdKi7upeEiDrSTtadD3q3268dlcyKESR4+XfEzdQA8ONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p10cVJ7BPWinbcn7KONl6JhZ0yaQr4n3DUu9Sc9DwA8=;
 b=OKmAow5+jMYouzVL0MPrCkhIAmZOvInDRhBT0i+8lXy/SK4LI7ulvNRZvIOT0icBl6LYlP/W656wgTnP9r1Tdf6qSwqKGWEtdWLDasZOLT6QqIjh/sBZfyyEHDAooLqW28u/xG9vmcrx4MfW/Y5DZNsh+cVcwjUE19eHarLgjEoyXCaL6PFsIYdBN6fNpCyJoCLm7lSDOZbvjEAPyiedLU2+z5dQParnZbkvhWNy1lrGuBezIa2tqooA4BuqgOpP+32yit+CFDDkfQkDcGfhjK2hWJKFrp2NDJ3PbfcQWb8f2OK62OyG5TOE36Oh/XLPdKTjgjcVThEZfNnV/HNBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p10cVJ7BPWinbcn7KONl6JhZ0yaQr4n3DUu9Sc9DwA8=;
 b=2m8fQ9PVbPNuvmAn1JhZpXlAL7V8eKVT/h3GJn/hmNfiGx6DIC+mE6iyiP5icwgDGVhO0oyo16WxKUmD/HJZEN3cSK85ZuPEM5oIxIf8tW4FjD9SCGwetMbtfs72+aSqxIgc9AQ+iRMt0VxxeUPdhKJs6DOjcDQnNOZVyt3fn6w=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH] MAINTAINERS: make Michal Orzel ARM Maintainer
Thread-Topic: [PATCH] MAINTAINERS: make Michal Orzel ARM Maintainer
Thread-Index: AQHaBfOErYec89nqn0qDmTjIsZJqaLBY8CaA
Date: Tue, 24 Oct 2023 13:29:01 +0000
Message-ID: <9B50559C-A4BD-4A84-8396-5298B596D1EA@arm.com>
References:
 <alpine.DEB.2.22.394.2310231356210.3516@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2310231356210.3516@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8345:EE_|AMS0EPF000001A9:EE_|AS8PR08MB10026:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ea87c3-2269-43ee-a947-08dbd49536ae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ealenn0xgqanqfOlk8HtL7oE0k5qtEjod5Wig9O0JcogYCrukRLcREkHQ+5yrBSZIHGRlrM57eRbyH5gVHb+VeP0zXIWyKAM5EeO0E5zvBRDLKu/KkJKC/qRmcWut8T44CSumLfU6TsyEJ3o+90KYdyX2ILtc2bINuYgBSCiKPp84OC6S+XOb8cQ4l2Aj1Apwrhu+SL/nYhPhYlcvmcOHaIZ5NNz46iHErOMPNSCrcDVMGL3opPoA8aDkTckvrmmtrovS66gESgCEGpB+28Qo9HFOXtM0dneeLJUeqUFcZgPNTbmA97eCK2aG2MiMvtpWv2FmXm79NfvYa1xnb0oI64dDsdggk0ZFybazVcL9XyLvy70kq+W//0LqaBPLrhA3d9KAA5j+fVxXdFlXUQtzwuLM5sAAUvZoaie7fJr73opJjTt9LWQwXz0guYaVzJ+0A4W7sBQMtSTUBQXfxk5f7JiaPW4sNakbuXf1ib6H4+BJGzEZxl90u0+Dh0zgVlILdbWXjzHsHytdI/D/UA1uks3wYAMoYJhuhtvpi8cG6m1IpoZVl62eYEvaRfLfcw7HAYKIiuEpjhxyuBOheEUkUGcZYL4pSn4nWl0JxovuSTER+BOTyIdp9vWmwjt+09iOEkqsaSxjlsiZwq3sI0kOw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(6486002)(6506007)(38070700009)(316002)(54906003)(71200400001)(66946007)(6916009)(64756008)(66446008)(76116006)(66556008)(66476007)(86362001)(8936002)(33656002)(8676002)(91956017)(478600001)(36756003)(5660300002)(4326008)(4744005)(38100700002)(41300700001)(2616005)(53546011)(2906002)(122000001)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D9B1526F4E936446B6B0CE5422EE244C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8345
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a178b825-9e86-4792-3a47-08dbd4952fb6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OGxERS+6SKhngnCg+RQ0Dywz/4d0E/zHeF2/ufT5Po+2hkdgR6pDHERj+9MgubFA4/jyh9FFfI1Qxrd00F1FoFZM6YtRYHE9zSlw+6V+8lZ3RAWoNpLQ39z/pHlNhOOMGNYhAFhXPNne7RWh0mEEA7hoxQB9q9/2eBrq7mTud+ZkqjtdwRiQQ+zwi9OZVoNJIV07z5xib+MlGgDantUCqCpGW8SZWtFddHJBSeGm9t8Xn+3y4jqqcYxeu+Rs0f/pp9lXIiNXD2aYX3qhbZQbVdW4aLfST7IXM6fCn1FN4f5BD7af6WF/N5aJhNy5/8ZKpuRXhcUjL5ePX7fAKdEH4xR0WH8pxijRsd7E0wv0U13kYExUl/JeuVSn+WeGnE/Ud0BXmJjhCIpzeNi3lCpGCaQeZ9eg+/8YGdwJa4A3iPZeTIkPwnpwxOcAc0oBLhaMDM1IEsK28dfWxcG0CINL2QF4dhEKAMBEU4cCeyxJWyMlPqESSya7DWgjH/JxYKxIqf41w3pgdSSFyDWHSvWREgsgvP3QxAfzAA6QZ7q9eBYv/hTcxhbSMMOsY4uVoox4nqDU9S6nTXtqFY2KE0Nb9aheIcxLVbFIbtz86Ob+wmF1ZErH3rxqtXUV7Vg1NEHkAF5CgLcgZ0eX4V5ZNcW0+qe/CwoI9PmukwaOdSiUu5oSjNcPYSERbRhEGZc2Zs9pEFyZ/zAVQvoZYdgb3Ut46ihgT5TZEEJjY8PSWKMNTZs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(64100799003)(82310400011)(186009)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(2906002)(81166007)(4744005)(36860700001)(6862004)(8936002)(36756003)(4326008)(33656002)(8676002)(53546011)(82740400003)(47076005)(2616005)(356005)(26005)(336012)(40480700001)(5660300002)(6506007)(316002)(6486002)(478600001)(6512007)(54906003)(86362001)(41300700001)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 13:29:13.4282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ea87c3-2269-43ee-a947-08dbd49536ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10026

Hi Stefano,

> On 23 Oct 2023, at 22:56, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> MAINTAINERS | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f61b5a32a1..a5a5f2bffb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -246,6 +246,7 @@ ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
> M: Stefano Stabellini <sstabellini@kernel.org>
> M: Julien Grall <julien@xen.org>
> M: Bertrand Marquis <bertrand.marquis@arm.com>
> +M: Michal Orzel <michal.orzel@amd.com>
> R: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> S: Supported
> L: xen-devel@lists.xenproject.org
> --=20
> 2.25.1
>=20


