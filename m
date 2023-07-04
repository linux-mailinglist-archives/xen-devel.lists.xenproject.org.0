Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8263F747483
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558454.872567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhO7-0002FZ-Vo; Tue, 04 Jul 2023 14:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558454.872567; Tue, 04 Jul 2023 14:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGhO7-0002D7-Rq; Tue, 04 Jul 2023 14:52:19 +0000
Received: by outflank-mailman (input) for mailman id 558454;
 Tue, 04 Jul 2023 14:52:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGhO5-0001fU-PL
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:52:17 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe02::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dca2be9-1a7a-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 16:52:16 +0200 (CEST)
Received: from DB6PR0301CA0067.eurprd03.prod.outlook.com (2603:10a6:6:30::14)
 by AM8PR08MB6498.eurprd08.prod.outlook.com (2603:10a6:20b:364::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:52:14 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::8c) by DB6PR0301CA0067.outlook.office365.com
 (2603:10a6:6:30::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.30 via Frontend
 Transport; Tue, 4 Jul 2023 14:52:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.17 via Frontend Transport; Tue, 4 Jul 2023 14:52:13 +0000
Received: ("Tessian outbound 546d04a74417:v142");
 Tue, 04 Jul 2023 14:52:13 +0000
Received: from f509a4f0b285.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6053224-CF54-4E13-8901-698587C4F315.1; 
 Tue, 04 Jul 2023 14:52:07 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f509a4f0b285.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 14:52:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB10155.eurprd08.prod.outlook.com (2603:10a6:20b:62d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:52:03 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:52:03 +0000
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
X-Inumbo-ID: 5dca2be9-1a7a-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Mw5zgDD5rJ+Dxf4QZVM1g1KXBfXUpQaXzRUtGGCiUk=;
 b=mF+4OjHj4CwSwbUGPNAfmxNv8r8Bx4d8ZMqHuh6Yhj41nCH9N5Qroiws5ToJWoAEE78xfnS808hZ/jSamfeGiz29vOjuX2aYeJ+x8sbouD7btSZnbn3mmnMWtMX5SUrjgldqVJPcRbY0tErfilOPhWWrD6cPOvXvBWannUaEg6E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3cffa5dd4ad0ebea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSOe5x25NyjqX7tghhCkfatI1FdhS5X6vK3Pm+2Uet9zlaJHxXOx9V5OHu9KnTdMfPHunnb7HPtGcULbPbVri7CZOiXgz11jhQK9rxoPL0rCbUEYPZS+CZPRKDiNvZoIb6aXxCXSRnyh+RsyNQZ4Flh0+7ciBck5CZ6dXDyD2wA6Z4M2WhXh6RitQya1RVsMvwUFazL8mOtTpVCLIPB1zMPz1PFAK6cU8wLgIBBwTxYz+0Vi1IEnVyXJLwIs1mhx4E1eBP0puHaqMFTLuKjfQ7cbRA1Xywsk6s/GR7Qz/XawywTNndLCFVayPqi0sCZ4CsOvcGlUNluXNPbRgL2zdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Mw5zgDD5rJ+Dxf4QZVM1g1KXBfXUpQaXzRUtGGCiUk=;
 b=bZFFZoXxOrFzEAeqKnD+cZ4/plULC2yADeYXgkdR0c4BEC55WR1NZh77UwtFfO9DSOvtvmuUgIbU/GGZABX2NnZUUFdpPOm2rz7IQgLPkFivRaz++Cuml03iCifFgosXIIBe1kzn3tqnc+pcQTw2negEFshK8K82lRlAtipAtFlFRnOu0pDDZcK9Xcltd6pxz6FrJAHtmmdo4A5yVlOZzGZ0gVsuXItCSvMac9yrNkSfZHB40tIFA9EAVu8419EbEjWHprELYyyvRfOxA8q99TEUxrOxsrfI2yI978WPaLUbn6ScQVC6CkQHCP8ilgXnryyGygbPS/9SSuLbHkq9Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Mw5zgDD5rJ+Dxf4QZVM1g1KXBfXUpQaXzRUtGGCiUk=;
 b=mF+4OjHj4CwSwbUGPNAfmxNv8r8Bx4d8ZMqHuh6Yhj41nCH9N5Qroiws5ToJWoAEE78xfnS808hZ/jSamfeGiz29vOjuX2aYeJ+x8sbouD7btSZnbn3mmnMWtMX5SUrjgldqVJPcRbY0tErfilOPhWWrD6cPOvXvBWannUaEg6E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, Henry
 Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/7] xen/arm32: head: Add mising isb in
 switch_to_runtime_mapping()
Thread-Topic: [PATCH 2/7] xen/arm32: head: Add mising isb in
 switch_to_runtime_mapping()
Thread-Index: AQHZos+1DMO9eCrkWkO1W1uZVBjVB6+pyIMA
Date: Tue, 4 Jul 2023 14:52:03 +0000
Message-ID: <A3F57CB5-E79C-48AD-BB08-148F720C8B2D@arm.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-3-julien@xen.org>
In-Reply-To: <20230619170115.81398-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB10155:EE_|DBAEUR03FT061:EE_|AM8PR08MB6498:EE_
X-MS-Office365-Filtering-Correlation-Id: 14eb60a6-628b-4d75-26c2-08db7c9e40ef
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MVhNHnaGpjG50AH0bU34qVBnLhtm6oJPKbbHmounJN0NXdyJv8zVFzRukBlzn8pv2dh0SUvaASsFqD2W4A6Rlwm6/FsDuKByLXEyufkm/RkGEWB0yHzBOlx49J9atzuSrBRjOD7crS2Hy6HsMSpVWZhQih7YAo5rF+8BHGtmQ6dsr3nOGejTd3BYFvZV8gS+/Jt81ACe1up0SHFg5Vk+9emB1BEJFV9R02JPETHvOtdZ/JYVPN9KuXGCQojyg5YZ7shGClNdiZ5cvS/vrNqHQLDncsqUC8vtb3K9PAYNVlBu8YJ8Pb0g+/w8motnlLL+MpuQqiDcIgiDT3s5XhSfhmIsJQ/oUCaQl5TmO0XLoQKHEE6LWQwtD70MyQB5JjB/q16suVWjFOD9wFig4ArtnSDcWNRfPsJ2fiAKvL+byD0d8wLRtBHHuPuyI5HKYc/Wy5Vw+p2MD5vO4VH7PCEt2MLl9X9VImOw0mOFnEGgE7OzNP20w6bg3NLe4nv5w4Cu7tkm0MToYJ2ejRYCEgcwGA5T2EtslXFE7dPccqIjy/+jwENBBl+R2YW2WDoSE2NwDyt3khi4V50I6MnB5dVXUyCX7h6vyFyYLz22oCthcFc/zDvR3KVvNB2sHfqjEgClxGufeCfnhoUgc1iw51Vp7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199021)(186003)(478600001)(6512007)(53546011)(6506007)(38100700002)(86362001)(71200400001)(2616005)(91956017)(6916009)(54906003)(4326008)(66446008)(76116006)(66476007)(64756008)(66946007)(66556008)(83380400001)(316002)(122000001)(6486002)(5660300002)(41300700001)(38070700005)(2906002)(36756003)(8936002)(33656002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3F3EDBF9439185469C9B040B867E2B59@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10155
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93d41ff5-83d4-43f1-9d64-08db7c9e3a8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DwD8eB2t93uz3kmQ0od+sOM1Dqs70hCS62GqWDd5JKJInQ+jKhVjU01xwdwoSuthUzB6392arHawJvZheQ1THHcv+yXKbn1FHs4h/1AddsZRIrH5fUWeTzZ0rH8MJ+ydECQ6KT2YdooHqX0m6Pv/5hnMkPDNsdcCMDP1ABHso0XDZ9wIh1AMKD48hRlom5sSNHSHb24evcShlc2a4V4c0kXbEMqUN9Ez5C29KodTMTte41Meb4HAsrUMO/tTZchGVQ/5BhS1hp40+HxjrPZDX94L1c6g693hC+ICYvKk71sMnyihBHLhDZqGlGaj+Qm6eUqZcfU1Gjdow9Y3safJjRFSNlEa/upSNEbCtRgbphrUTdFD9at5oYgj/uX+hUavm8ZbaBnqQBf174LeqIgJFDPxM6RnTjCcRvt8ohIdaL00YRKY7263oNeAi38mRbbBJPqThyXIXi2B+JqDjCgkOJue+/SglCquYQ8HPJKaHYqQrrFYyacExlBNmoiUYT4UZ3qaZBGJe8yigBeOJel1sLh+9HaKL71m4ckxs7IBSoWwlyn6PSC+fA5T3Mi01ghvvP1B6w6G451IrLz+4XlEtbs3s4mId/ano6GBrwX9qeifpO5e1g7Dz3S9twnjM0RoVlj7zl9QQYjmPhawTaNnHdNlRhnUS7ggLecJMWqp1T8DDN04XFHSQvOjenff+YN1o/FuNRdEuA9woX6KQBlllKDvH499v0NqWyvxTDcTC+197get3kkauxpXpPgWim9D
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(2906002)(41300700001)(5660300002)(6862004)(8936002)(8676002)(82310400005)(33656002)(36756003)(40480700001)(86362001)(6512007)(6486002)(107886003)(478600001)(83380400001)(47076005)(36860700001)(336012)(186003)(53546011)(54906003)(2616005)(26005)(4326008)(82740400003)(70586007)(81166007)(356005)(6506007)(70206006)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:52:13.8836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14eb60a6-628b-4d75-26c2-08db7c9e40ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6498

Hi Julien,

> On 19 Jun 2023, at 19:01, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per the Arm Arm (ARM DDI 0406C.d A3.8.3):
>=20
> "The DMB and DSB memory barriers affect reads and writes to the memory
> system generated by load/store instructions and data or unified cache
> maintenance operations being executed by the processor. Instruction
> fetches or accesses caused by a hardware translation table access are
> not explicit accesses."
>=20
> The function switch_to_runtime_mapping() is responsible to map the
> Xen at its runtime address if we were using the temporary area before
> jumping returning using a runtime address. So we need to ensure the
> 'dsb' has completed before continuing. Therefore add an 'isb'.
>=20
> Fixes: fbd9b5fb4c26 ("xen/arm32: head: Remove restriction where to load X=
en")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/arm32/head.S | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 6ca3329138e3..b942e7e54d08 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -656,6 +656,11 @@ switch_to_runtime_mapping:
>=20
>         /* Ensure any page table updates are visible before continuing */
>         dsb   nsh
> +        /*
> +         * The function will return on the runtime mapping. So we want
> +         * to prevent instruction fetch before the dsb completes.
> +         */
> +        isb
>=20
> ready_to_switch:
>         mov   pc, lr
> --=20
> 2.40.1
>=20


