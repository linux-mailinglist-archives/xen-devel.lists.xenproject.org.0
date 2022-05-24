Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC88532481
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:55:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336360.560662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPNe-0004hQ-0F; Tue, 24 May 2022 07:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336360.560662; Tue, 24 May 2022 07:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPNd-0004eF-Rm; Tue, 24 May 2022 07:55:01 +0000
Received: by outflank-mailman (input) for mailman id 336360;
 Tue, 24 May 2022 07:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1r1=WA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ntPNc-0004e2-Sm
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:55:01 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe05::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf8637b9-db36-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 09:55:00 +0200 (CEST)
Received: from AS9PR04CA0099.eurprd04.prod.outlook.com (2603:10a6:20b:50e::22)
 by PAXPR08MB6910.eurprd08.prod.outlook.com (2603:10a6:102:132::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Tue, 24 May
 2022 07:54:58 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::fe) by AS9PR04CA0099.outlook.office365.com
 (2603:10a6:20b:50e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23 via Frontend
 Transport; Tue, 24 May 2022 07:54:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 07:54:56 +0000
Received: ("Tessian outbound 9a0893f586e2:v119");
 Tue, 24 May 2022 07:54:56 +0000
Received: from 98c5cdd63b57.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FDC5B9E4-1F08-48EE-BC04-DA0092F08C9C.1; 
 Tue, 24 May 2022 07:54:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98c5cdd63b57.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 07:54:50 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6851.eurprd08.prod.outlook.com (2603:10a6:20b:305::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Tue, 24 May
 2022 07:54:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 07:54:49 +0000
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
X-Inumbo-ID: cf8637b9-db36-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b6L8jXnHLpL5vKq/GYxvuphxjOJNbOFpi7iCwga1FoxBtDS1cdzEXw/oXuqTOEAWOhqJDPZAJ92RkA/4Fjmk/KqKkKgWwET/6TGOxI/5IC8wpvt5zgP8mqmmvWjHi2QnwCrlExz9pPvtnmDjDHxDc6r1o5HldbY3vcE2NKMreFzUAWwHCHZSGctHqR8qREFi043pScneD1g02W4OGmbgJo7M+yLoaUnkMEUlKoH7mK+/uH+X+HNCk97uZnZRAEI2/00hcAMmeShU4oS3h7IuASib1ZvJxAPqCgLWyxWIQNtRTJu1M3S9atAz9vRDop9A905PMjFa0XySWlSDqpJEdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v45FNKZHlF0GnLYYuSmMGrMkCffo4bOgTyZdlwQFxP4=;
 b=UQFLv5FnmANDvughLj0L1QF4qocGLMK47iS+daKgK7mW3MBML4NDn15/RRzwoGU0g/gGBuYSxBsW0h3d+VxugSkVc6lHY3nk2EFot9uUjqhlLr77tZtMOdfWuxEgVHfxDT7zgw/ZFsps3XN2lMhHM+OM0jvkWzYVk8mfCofEHC8fxyHX2+kVh2KCqg/MAooU3rdbDpc6oL4eHaxE3o2F12sPJ3XJ6A3AWxN24gyiIU08ELxwTssfN5QKFurHH1b7g5ntw2mKAb+QEYnjPDlzVuc0RbQqc30I8N9bNieInOrc+cQCTH/MbQ+VlWVJr3ed8aqYiYHVUkhB+g6sleZGPA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=timeout (key query
 timeout) header.d=armh.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v45FNKZHlF0GnLYYuSmMGrMkCffo4bOgTyZdlwQFxP4=;
 b=EP4llLCzmdgc8l9ulxgEY0sleJ0IThkLbQXkhdtM+HTdGNitjUeWw1kXiUiPgxyfByw3yB9kMZpYJJqUiQ2dmDq78BxLRnPa8m0aYKVkZhVc6OHX2wGg4KDvs/bM+sjyXLlj3Qkbkq9lsiy0lHqagruAFEjfPf4XXuOn+Ec814E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=timeout (key query timeout)
 header.d=armh.onmicrosoft.com;dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 491f5a1e2d897338
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONseBJqNOrKzGGzzhXMagDlR9SmXR8grM7OeHq3GPsP1cGD4SEGnNDgcDzEB5nyXO4AetiS3PGpLjWCidS25vU5ngIiR1bTBTgSc12jPEa6RMVohZU3/HHe72UXJ/IWpjU2FAevm2YrHmJ10uTVyhamAnARbHzHsYTS83PfdADBqWpCKxrMmnM/IeaRqZBYzxkJ/e109EPH740hRfyP2gcXMeSsd7ezwIP0BmvJC5okk7ENDjfoyS3gDFERnChdVtfm9j1LiUqF3R2xrBrOj0CwjIxtbh4QqDExU6PRSUtoL8f1gc5gsjPD6zBPYY5Wgefke+RAplVyQ5/oj/0Rlaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v45FNKZHlF0GnLYYuSmMGrMkCffo4bOgTyZdlwQFxP4=;
 b=lGh2+bG0gBX0ZV7vOx6r69Xe5wtsgOrkA8LgEZxn4MHR9UcSheSTKzJ/b2MEr+grJ+xA2S/9ePAoNGN6XMgl7PchCyvh6tcVNRI89YUQZwrJhuuAIEHmKmWpwFT9kyJJCxD0PNXyVkTeK6n/4jCrB69EYu80GJbzWCAOOg7O8fBSC9NWT0BbhsPScCIO6TrqqSFJw/08mUSOdygHLIS3DYxOO+9BtrsbSqSmKjBkSd9cp6ZIHyQ73WkX88+6665vddFI6EUyves9XXSGwsEMyfrQWxrGtZA9VX59d5KM4Vke0+kOKxRkmDPKjtISiNDO+h9a7T0kKQ1JZSSdPnlQzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v45FNKZHlF0GnLYYuSmMGrMkCffo4bOgTyZdlwQFxP4=;
 b=EP4llLCzmdgc8l9ulxgEY0sleJ0IThkLbQXkhdtM+HTdGNitjUeWw1kXiUiPgxyfByw3yB9kMZpYJJqUiQ2dmDq78BxLRnPa8m0aYKVkZhVc6OHX2wGg4KDvs/bM+sjyXLlj3Qkbkq9lsiy0lHqagruAFEjfPf4XXuOn+Ec814E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/iommu: dt: Check the return value of
 xsm_deassign_dtdevice()
Thread-Topic: [PATCH] xen/iommu: dt: Check the return value of
 xsm_deassign_dtdevice()
Thread-Index: AQHYbf1I/4cyEYG0EkCW5QIQgj3DOK0tqxkA
Date: Tue, 24 May 2022 07:54:49 +0000
Message-ID: <A7BBA491-2CF9-4D4B-A7C3-56AB004EF842@arm.com>
References: <20220522165900.83104-1-julien@xen.org>
In-Reply-To: <20220522165900.83104-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5ebfd2b1-e7ef-49b7-a9df-08da3d5ab216
x-ms-traffictypediagnostic:
	AM9PR08MB6851:EE_|AM5EUR03FT051:EE_|PAXPR08MB6910:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB691049295ADCDE4EFA241AA49DD79@PAXPR08MB6910.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7buXZEDYrCjCc8QUfS1lh+wzF9U4EX4gdL7mVoNjCseUBhuiDXZ/09z/ek8+Pbejjb/NI3UTUBqlj4LpUX50abZSW5zTtrQmmnY3PGvrLJLWAwOuZ8Dg39nv5r7pSuFYWgDaHLf8pgiaF8m9HhUZ82OV5hoQVTN9ZADrkt7TeMuAoHqlsbLt4sdKDNRvo/cGqfDeqP+yK2fAQvxqhpD5q9gfVmQUsukKAdHldvhdOPHU6AehtzZ0JPYkDD4/J9jlVzHGSScTL8zn02lecPUPIItI1D+O+US3ktTJsxeuDA8x1oYVyAA5YFz8A8PREUbrTOoawnJ2IXRrvoRXRbL0plXLTC8KWSOS/t71Omt0hc15G7VqoII8g4t10gsdE+d86ldFotsUP8HLscpCVb8m6PXV9uCQTWXxNW8TH22zeBFhYm3ATw9UK2T2uH4coudIEgMqGaO2dNUvodJfOgMiMCmKtJFtIgAAWhBH//00mBx53aIzRFTD5G885tGU5yxrGVWudibtbgxoU28QTW7/fowohHW9vVJTgLIndgIgbNKIn1AekRFhGSvfDBrVZMsgf8pxlHFoyZLEZRodR+m3XeGjVk1zfEO0uZVATl/LtaSmOvGCBbrnlVNS8AEcPEE8201Fc/DyTi0YZzzGuV/ixiMOFKybuPMDEwWJ/RxLXOGC2TZ3dw95cuKbkQ+F+vB7Rw9hVwf1RLUEzmI9zw7Q8nAGGojymSQNE/fAAkpJnrfa/SjjyO7fUbU0lKTfHpZN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8936002)(66446008)(6506007)(53546011)(86362001)(5660300002)(64756008)(66476007)(66946007)(38070700005)(54906003)(6916009)(508600001)(122000001)(316002)(71200400001)(6486002)(186003)(2616005)(83380400001)(2906002)(36756003)(38100700002)(76116006)(6512007)(66556008)(33656002)(26005)(8676002)(4326008)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0731EF46F44DEF40973568AEF9C60819@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6851
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	11e53d1f-5ef9-4653-b021-08da3d5aad88
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Na356/+GfXADQc29ADwqX8JlOBO71K6sOjPQ7e1QAg3uvKi/LEfcHoSJdSfvP9BY+TLy7qPYn4UldGPqC29xM9b6whBh+zCZWd3wrGTQWEEih5+ddIAUmNGyxN3n2NUwsgKm2Nn8yHU5Mkc/ql9nI0a3GL5BiUilUvr+ORuzbjzgqh2xpztxOlOpSmQkQlPXc637mRMAzkoBO0RMHoQaM34OUmbQuanVvQ2UlTsuQQ9iJUgvsEPYpsdO9+RLnt1cYtMBGnNRg+6Tbh2BHQ9tWudRpdkiYAOc9UWaq3QdeglWuBgH+/VIIx5FccBz+t4HUho/QI4TpHwu16ryQcvI15bjr3Fj4B9ILV2EwCJKa1D3bTV8pg1ljqZ4TK06/45sRRWcF67pWr+4BN4tqsBgVQommx75yFyMLMx64Bab+ygVnJxaBC215Z5OWnPUMPw8mtbeKNS7XbzZLfuLUQvuwRvmqTMdyrUppNUunu1fus2z4h0CntDc/LP0KWpvUcaZRaKiJWEGc+pJ52ho9zxhMjUFZ+XvsjwbpB3Yf2AVoS8Z/81esOxwkJVaVCFQvsMcss+NUyTf8QmGvOJaGZDUadzhAwU4ToIysUR1dZF/iPkrT+ej0b+DizrZh1JI6JgE9Z5gaYBc8lAiE3LI5QGRwjQwfft3ZyG5J/aq0XeqLQG6z3f2aUEW8jxTfp3BpHt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(508600001)(6486002)(6512007)(2906002)(70586007)(70206006)(54906003)(316002)(26005)(53546011)(33656002)(86362001)(107886003)(8936002)(36756003)(5660300002)(2616005)(4326008)(8676002)(6862004)(40460700003)(82310400005)(81166007)(336012)(47076005)(186003)(83380400001)(6506007)(356005)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 07:54:56.9993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ebfd2b1-e7ef-49b7-a9df-08da3d5ab216
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6910

Hi Julien,

> On 22 May 2022, at 17:59, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> xsm_deasign_dtdevice() will indicate whether the caller is allowed
> to issue the operation. So the return value has to be checked.
>=20
> Spotted by clang static analyzer.
>=20
> Fixes: fe36cccc483c ("xen/passthrough: Extend XEN_DOMCTL_*assign_device t=
o support DT device")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

With the typo spotted by Michal solved (can be done on commit):
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>=20
> Platform device-passthrough is not security supported. Hence why this is
> sent directly to xen-devel.
> ---
> xen/drivers/passthrough/device_tree.c | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthro=
ugh/device_tree.c
> index 98f2aa0dad68..1c32d7b50cce 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -269,6 +269,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, str=
uct domain *d,
>             break;
>=20
>         ret =3D xsm_deassign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev)=
);
> +        if ( ret )
> +            break;
>=20
>         if ( d =3D=3D dom_io )
>             return -EINVAL;
> --=20
> 2.32.0
>=20
>=20


