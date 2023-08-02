Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEE376CF10
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 15:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574948.900594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRC8x-0008FP-M5; Wed, 02 Aug 2023 13:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574948.900594; Wed, 02 Aug 2023 13:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRC8x-0008DM-IZ; Wed, 02 Aug 2023 13:44:03 +0000
Received: by outflank-mailman (input) for mailman id 574948;
 Wed, 02 Aug 2023 13:44:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F4LG=DT=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1qRC8w-0008DG-QV
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 13:44:02 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2079.outbound.protection.outlook.com [40.107.7.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a213386f-313a-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 15:43:59 +0200 (CEST)
Received: from AS4P192CA0029.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::14)
 by DU0PR08MB7787.eurprd08.prod.outlook.com (2603:10a6:10:3b8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.19; Wed, 2 Aug
 2023 13:43:24 +0000
Received: from AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5e1:cafe::f) by AS4P192CA0029.outlook.office365.com
 (2603:10a6:20b:5e1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45 via Frontend
 Transport; Wed, 2 Aug 2023 13:43:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT056.mail.protection.outlook.com (100.127.140.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.45 via Frontend Transport; Wed, 2 Aug 2023 13:43:24 +0000
Received: ("Tessian outbound d7adc65d10b4:v145");
 Wed, 02 Aug 2023 13:43:24 +0000
Received: from 0fe65365a262.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3798346E-7498-4EA4-AA87-B1F5C51D0A84.1; 
 Wed, 02 Aug 2023 13:43:17 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0fe65365a262.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Aug 2023 13:43:17 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by GV1PR08MB7874.eurprd08.prod.outlook.com (2603:10a6:150:5d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 13:43:15 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::4560:65a:d8e2:719c]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::4560:65a:d8e2:719c%4]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 13:43:15 +0000
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
X-Inumbo-ID: a213386f-313a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH3bkCIKuTVL3DEWeAq83+jifAYz5QQcYRZXgDudh9o=;
 b=9YI2vjXMulWiI2h0aKhWfS5vdlW4lQAFs/oGD4l7O/hiW64iIbGWtV+vQBvDMrRT+nhD5l/EO87HgG4E4nANtTTFwV7kyb4jU//mfsG80hJe9o1Xq0OmgKVdtnYmpM2himo9RKyuz6oGT1pIm/NSKXOpXLduw/1T5Ln/lG1EXPA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: defbb318eaf48460
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJl2nDPo5fg2hg0Zt8KnunawWc0VWZQnBixHtdKqm1NfRQKJglask/48OGsxJj8lYIa4/U4bxPjnoNvyXc6Tnrz1YGuglgjnPD3gBT3v4bwBNB3TNJlEiV2H0b5ic5sN2henElRV/TL54JrGuhu/GsYP7DvDBsg8NEvsSw7Z3y06rOXAxr2+dsyqa4PmSfBSSticPI1cWNixLA79xOzWRysAdDb9JOlkKUcBMyqz6fVJbTGochlA8Su73Hp/KayBoTSCvya2aNgBlbAPiOx2Olz8VP7+FRnzBu6atcdRcZVuwFPwdkyov7WxsT8/UVyR7vQZk18+6vdXFI74cnNDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pH3bkCIKuTVL3DEWeAq83+jifAYz5QQcYRZXgDudh9o=;
 b=mTJ6mc+tr25rFk2VhNELclXvhanAqHGyCnlAr+cV6GM/rqTldqgGndKPkQU2mYtGDHgfn83qIn+4D0Yu3EK9/DCjVW+OZZ2+Uo1KPjoF/KjVV7QjUpUZb21dPP215BKZ9XDdr3JOPKXG5s8UfaH8CfbVQc9EgszmG7l6UQvljUeynWJrrHMTv2ON/FV/43QOOrzYYV6WRNQeSKBJz4mKa0VXYCr0gx/RO3TmLkvGvY8T65/eP7/pRAWFqMWkR6ZJVRgmHnJgJ2DY6ObaWKU+2ACT8OaNQHluykKDr4PoaZV6tTP0lRYca9F1eeAtOkWZj+94nS14mvxFOf7Z07NhJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH3bkCIKuTVL3DEWeAq83+jifAYz5QQcYRZXgDudh9o=;
 b=9YI2vjXMulWiI2h0aKhWfS5vdlW4lQAFs/oGD4l7O/hiW64iIbGWtV+vQBvDMrRT+nhD5l/EO87HgG4E4nANtTTFwV7kyb4jU//mfsG80hJe9o1Xq0OmgKVdtnYmpM2himo9RKyuz6oGT1pIm/NSKXOpXLduw/1T5Ln/lG1EXPA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Yue Haibing <yuehaibing@huawei.com>
CC: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "oleksandr_tyshchenko@epam.com"
	<oleksandr_tyshchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH -next] xen/evtchn: Remove unused function declaration
 xen_set_affinity_evtchn()
Thread-Topic: [PATCH -next] xen/evtchn: Remove unused function declaration
 xen_set_affinity_evtchn()
Thread-Index: AQHZxIgYKn4PxeouQUGx1NvFxt0zwq/XBWqA
Date: Wed, 2 Aug 2023 13:43:14 +0000
Message-ID: <A433CFA7-7DDA-4E17-96F7-1B6C254A9B36@arm.com>
References: <20230801145413.40684-1-yuehaibing@huawei.com>
In-Reply-To: <20230801145413.40684-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|GV1PR08MB7874:EE_|AM7EUR03FT056:EE_|DU0PR08MB7787:EE_
X-MS-Office365-Filtering-Correlation-Id: cea9dbd8-298a-429e-baed-08db935e7187
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MKcNWW86242y84aKVs4eI/wpBzyJngqjRj4k3KQUytlLa22KspP/lde6WAoL4gCaR6clbbWosFEFiuEkWX4Hc+UoSmnoWauHIzYu41F34kDXj9UzTpD////PCsCdMYQQxbbN5zHPjyyw+SCr6vUVd4wh2nbmt1xvqz0MsRFY+rmco8DGadj64ExszH6AaHydt1j3W7GhOR+VballePgmhNz5n/OvoTKdS6feurki9g9tpdwOMaLYyZrYMBTy/ltJbYJieB7E9TykHs0Yx+PivsT4eXmyeHvlowQiLg7s0kA8TsB7NwfybCl3Hq2QvfGSjVwof6dyCC7ngvHMNmP8UupZIX3h8ykJ4k6dOIoEb+0wS7eQjMdw4pNO64Wa0dz2FwQkL+Jf8bsUFmVQYE+K8loFmabZpZ+09eZle8Bq1p90CiBJgMmT+8M4sAJJKuqvNXei8YhrF/GO7bT9zE1yrolS9uEkXCY60gLmydRBUKdHzbUI2bcod0oZE1SjJ8/dtMIBuXg5cJrD3czGCDCWRkO1CE5Cr7BN9p2Ukz9ckynQtDth337S7FajI35x3u2ohiz3amL/dowHW8PgH3I+7lZT8QvfyK7VHDQoo8QW91d9ejAEa9qa/tumJfB3RQk3R5lzY4RBvFIFgDyNP6nY2Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(41300700001)(36756003)(71200400001)(86362001)(33656002)(478600001)(6512007)(316002)(6486002)(66446008)(66556008)(76116006)(66946007)(64756008)(91956017)(4326008)(6916009)(66476007)(5660300002)(26005)(8676002)(8936002)(6506007)(38070700005)(53546011)(186003)(54906003)(4744005)(2616005)(38100700002)(2906002)(122000001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FBD42BE14DD97041807DD902243D5163@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7874
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	764144d6-9545-4a8d-2f6e-08db935e6bc2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YH/iUHCXV48rjkEatsu5HjgSAa0c91E+SaYggz0ziNoesbWNNvK1kThVGW5doc7hiN2GpzUy8wBSHGPFBzgd4VYVA+U6o2JXCL6xwfO4ppY5r7Gnh+C8IxMkBpZdPl9+fTaGoN/vh0QaZMNrrEYMhUWcf67hBwPdxxVVn7h/EXEyo6dOAY5Q/k3pqDB8TyWHR8VyrfIlAjY05eoFAxOWr537tejf4aVB49yrVfRpiXolqa9PQRWTdITQF/2kJtP65BUm8IUGdfrvITTfOYdHoiefXu29wDiM1walTlCfbFWnzEPzPaez1XmhDNUDQ9ePz0AdpO03zet2sx4GC+EKy04yVfast9iQLjgqi0ODJknPiKZUa7FKospUkl3nPzDZaWBWuutIbH0XQ8S1jjeYcSKnsnm3BR9763GeiAbRH4LvmExeBocU049Tc23gfMeiiVFUymyBNrDtjr0GQ5Ow4UaTWzhWlH5mNBKVfD7mbfDZa86CD/Pr8PMZHoDqxpzPGk/iCSdkOEFt8yWCjJmVjjSGJiC3lQg5U0eh67nm3iyH4VJcjwMwEkOMTYfCyMieqcH46h84yyAGMM4Ch4is1wkNMikH+bi0rDaP0ttM49cx1zUzVzcNTadpxI7jHEXSYAdaK7D3T0JAZr7Zy25S0YuGN3vzVMnj0AsfSF3TMFjslN5PTOZFi0NoMvidoP4SUp4Mt1WaEyQW7N1PqEhkBzjfLH7n9ghJZorbM61frs8X2dGqRWwt3LKfDCcK3B/7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(4744005)(33656002)(36756003)(40480700001)(86362001)(478600001)(6512007)(6486002)(8676002)(6862004)(8936002)(41300700001)(316002)(5660300002)(4326008)(40460700003)(36860700001)(47076005)(83380400001)(54906003)(2906002)(70586007)(70206006)(26005)(81166007)(356005)(82740400003)(2616005)(186003)(6506007)(336012)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 13:43:24.3361
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cea9dbd8-298a-429e-baed-08db935e7187
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7787

Hi Yue,

> On 1 Aug 2023, at 3:54 pm, Yue Haibing <yuehaibing@huawei.com> wrote:
>=20
> Commit 67473b8194bc ("xen/events: Remove disfunct affinity spreading")
> leave this unused declaration.
>=20
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul Singh

> ---
> include/xen/events.h | 1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/include/xen/events.h b/include/xen/events.h
> index 95970a2f7695..95d5e28de324 100644
> --- a/include/xen/events.h
> +++ b/include/xen/events.h
> @@ -75,7 +75,6 @@ void evtchn_put(evtchn_port_t evtchn);
>=20
> void xen_send_IPI_one(unsigned int cpu, enum ipi_vector vector);
> void rebind_evtchn_irq(evtchn_port_t evtchn, int irq);
> -int xen_set_affinity_evtchn(struct irq_desc *desc, unsigned int tcpu);
>=20
> static inline void notify_remote_via_evtchn(evtchn_port_t port)
> {
> --=20
> 2.34.1
>=20


