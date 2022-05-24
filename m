Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948D55324E7
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 10:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336397.560705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPY5-00006m-80; Tue, 24 May 2022 08:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336397.560705; Tue, 24 May 2022 08:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPY5-0008Vj-3E; Tue, 24 May 2022 08:05:49 +0000
Received: by outflank-mailman (input) for mailman id 336397;
 Tue, 24 May 2022 08:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n1r1=WA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1ntPY3-0007vs-Fc
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 08:05:47 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe08::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50dc81b9-db38-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 10:05:46 +0200 (CEST)
Received: from AM5PR0402CA0007.eurprd04.prod.outlook.com
 (2603:10a6:203:90::17) by DB4PR08MB8029.eurprd08.prod.outlook.com
 (2603:10a6:10:38b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Tue, 24 May
 2022 08:05:45 +0000
Received: from VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::df) by AM5PR0402CA0007.outlook.office365.com
 (2603:10a6:203:90::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23 via Frontend
 Transport; Tue, 24 May 2022 08:05:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT034.mail.protection.outlook.com (10.152.18.85) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14 via Frontend Transport; Tue, 24 May 2022 08:05:44 +0000
Received: ("Tessian outbound 42cead292588:v119");
 Tue, 24 May 2022 08:05:44 +0000
Received: from 0f4f214dbc1c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A84BC0EC-5C27-4073-8557-7B5A8FA3DD0D.1; 
 Tue, 24 May 2022 08:05:36 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f4f214dbc1c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 May 2022 08:05:36 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by VE1PR08MB5871.eurprd08.prod.outlook.com (2603:10a6:800:1ae::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Tue, 24 May
 2022 08:05:34 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 08:05:34 +0000
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
X-Inumbo-ID: 50dc81b9-db38-11ec-837e-e5687231ffcc
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VJD5RoN2m1Pkvm/9pS03WbM+PHY7H8gbxfWmUgLzBJLJSG3JzGgqmlPu/bP48VEBEPyLH/x3Je09vqOHX3TTt6NELlKd2fTwG+KQ6QHb/3oNPWaFLY4s380rPY0ZbrzM+3YBmFew3IOj+VF3K4gJn3keS1/9JnweDfVwIUGN3SBRx16mJSJk8VzLgYxknPkcFUMv1ieFDFG3EULhAM1vrJZwCseDTyLuFhqol7+5jw9vCWEOplHUQIqsPyr1SxpyxR2Fp6esMHcQeFE2Yl+1F66tZ035jlOxQX9jPXhmzLZIJXrTZIkl81FprWuBe64ytO8002gtzeZffqUta4PAwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0V/0EKDU4QbvIsakOyVn8J9zQAXeEYdpiceoXmiTHA=;
 b=nf/pJ8jeQgQv1uD7HP/eGqfIlWa6QkeCCV60NGBftJRL8GOx9m0WMnKiJu9CCcmqnxF6fjcAKcaOViB3ACL7sVlK80vPmQDyM91nol9e0PRR9x+D4cxwLRuG5znmnFWE49sbNGkCwQrnvq2WM0Ukx5+XAPdlr9LGUC+muos5ZfIZvV0PinIaRuW1YH3Oz9k9FJ7dOZI2GHh5S8dFCLcoSPnCMdhYR/ejzrL+Dyq25vEVf78Kv1z7XHBiXb+HDRJJ3pU6FmBKGnhhbbJ+iaRWeBzURsyQ4pSvNhem0IJOmT4JJWwuLsQdMrNR039+7vJCZJe/KsxKKEzL1s28wt9VXA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0V/0EKDU4QbvIsakOyVn8J9zQAXeEYdpiceoXmiTHA=;
 b=EKKJ2fMEQJpmh3yoDQz+i0+xWE4DCsqvaR0JWXsFUmGbCG8WmvVfZfqyVp85nX2fGe080uGnSD7Yp3+JSKUt27Tcg1dLfZuVzgn9YQCWlwWtIco88w6lMwtRsK0zgvUq2t4xtAe3FPTIfieCvxmibyFUxxgu6fX8zhQUNHKhGT0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbda18aa1b180e9c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+54EepMqXWJ0I90wBcuEXj7cMsStKMaWQxVukDO05FRxhLJKKyJ7GUD0i89MMSVhIFdIDscA70QPys9QrgLR9EBYY02zJBtghR4WA0hTvuaViOo/47JjeMpm/qH8AvUY0VMPQqfhnvUAwScDtsrG30IkEf3GMnSdDYeLJVwse7MeS9rMeasMiPnXzy58/515+ERCj+MNmoxNAUO15qAPKPCOwiyKKKDelHWOWwzru3qWKDXxphCayL0YPhwhQDxtuOoOT5tho6JmgY9gniXL/kCli8cnfYomOlSHd3wnsdxdshHnFCKWA4qWXOV34QgLq6y1xNFlCvPeFCfrTzENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0V/0EKDU4QbvIsakOyVn8J9zQAXeEYdpiceoXmiTHA=;
 b=U0B+mw/84B61kkx+PSb2LzYtEMo2UsDHELGUN7irUj5VxFrgF2mitJFU7VWSEr9r00azfE08v8C8Fyx1YPF+OAS8fo2/l+YitlxIKMZemwqo9syOj5lALhCYz2TjCEgeKUleQVbR/gqelMETnutuR0n+IJHvAEYQ2u9ZlolpCs3yZTOhyY1gsPI2FbvNkk0azYAkkarn7HWcNMkESMuCqSikufNCVDFie3OA3ZJW1FAXKq7DagV8m3kgreDE+I/lzNTbLCjB2JmAWo3Ny5ikrEDKmzuzjahOmSNP2Z9irGVPUcx/5Hzywia8JBKeo9w7ZSWbAP5xGXXb7FcSUOPKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0V/0EKDU4QbvIsakOyVn8J9zQAXeEYdpiceoXmiTHA=;
 b=EKKJ2fMEQJpmh3yoDQz+i0+xWE4DCsqvaR0JWXsFUmGbCG8WmvVfZfqyVp85nX2fGe080uGnSD7Yp3+JSKUt27Tcg1dLfZuVzgn9YQCWlwWtIco88w6lMwtRsK0zgvUq2t4xtAe3FPTIfieCvxmibyFUxxgu6fX8zhQUNHKhGT0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Topic: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
Thread-Index: AQHYbt5OQ+9i9MqGEE+kzOfwd/8WE60trFiA
Date: Tue, 24 May 2022 08:05:34 +0000
Message-ID: <F2040FC0-C040-46F5-8DD0-79EE0E1B3A1E@arm.com>
References: <20220523194953.70636-1-julien@xen.org>
In-Reply-To: <20220523194953.70636-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: bbcdfd4e-3a36-41da-210d-08da3d5c3407
x-ms-traffictypediagnostic:
	VE1PR08MB5871:EE_|VE1EUR03FT034:EE_|DB4PR08MB8029:EE_
X-Microsoft-Antispam-PRVS:
	<DB4PR08MB8029F6FF006B9E079CF8C9659DD79@DB4PR08MB8029.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8F7BNQtNyPz7EsacUQhZT2nyq+BcUSFV4h3PE1mkSUZP8uzUfcSij539YYjPK9KOPZ1TJDaTSUwjc/WFs9fDY1dw1PYeXllDwLT3pSP5GqlO+WLHQK9JebQ/vdGgZxEnXxGTUFq/4FPQZbr/bDFFX1r5E6XtqIHyEJedufhrW72ZtzvbaDEsRdmmy8n4Q2pX7UAixRvrvu1uDZaUWGf+yNC25eyWKRM2osZyeB1EKHOUToFvnNe+jiJSROLGYWDniBCei6o569mVMp6gE+luStiyZu8XAsr3+0wH7U3BgDu1+onxqmDXRTQA6jRfo3VpNyW6P02BrKBTiWGdcNiHzeIYe0EqHk52ZfuTlaeOTP6ycsKAenARmFduXIG8g539z6eD/Yz2H2b5uT9BSTjdfa+Gzf1yOPmTCVqu6srUu0OSLc0Ox6dIUbD6qWF5PAYrQStuxuS7vPzqP8IXIO8x0aL7AAWRiV26iXjkIJjiPRNjQr25rcJV5yaDqJiZaq30DFMX0xGh1G/eko/W7iX4lITxpmf8P9KRRWmRYJh9h5kLUWyvtAfjTDsNtmOp+TDO5YscswFDEAyV93EzFG80kaw+l4RU36x6wdI+aRXXZoBMUR5G+xibAlymytMmBSsYrkQDtYFcfg8H5pc6l+yRICul14QpKVF+f7H/hMG1PfWk1obKw0TBY0RoZbBc1+s87W/FinA+i+WY2tMFpo00apu5/hLYUOhcforxHXH8o/xwn51OeQVVJVWES526w1jy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(8676002)(2616005)(4326008)(38070700005)(5660300002)(33656002)(38100700002)(122000001)(2906002)(86362001)(316002)(26005)(6916009)(64756008)(91956017)(66446008)(66556008)(66476007)(36756003)(6512007)(54906003)(76116006)(83380400001)(6486002)(186003)(6506007)(8936002)(71200400001)(508600001)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EB105B420724E84BB45A9EF4429D4DD6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5871
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a7bfc055-cc57-4af8-4c4c-08da3d5c2ddd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HJkThgCNDdxhh8SCBbKJ6m2dc48g4k7+HNm9Oa0bvuO2p9UXt8DajnquEMC8oMek20dmGkxBQNDB1GEghrlpnv35TeTiJV9Xq4Xm25q4elVasZxWwyqIVyXoP9FgxxI7fuQcULfBq/12uQYzx/u6I2g3qpVo3uBuCaAr7OlEV2rynD2GRYQX10ihS4w1barfoVrURAvRdg+sbqxtKORfD4EY/cxJKnV9EtAi7a92nV/oPdILsz8nwQIcoZP7vAoUXJQ5kxdlcIQ36zDxaLMFuqgDc8nEX6T/FCFNK5mvM85ZBwmKbFibMC+Ev3eEvy/AFuLC14AFHNl/DVlzcfBIFEjAm455frb+sPD1ud/XszOfAgrb/yhEMMPeMsED77c+99L2Wd4oEexkEN9ldvTJRqd5/ujA+w+wOXsLd/YiNivDGU2cJ3phgEDS3UsIHM7MrX/L0qKgj1YBA5n7BW3d801BXdonGQOG1QY3Ibc63l+gu8rBF3nt2lbFSKKLesE6OkUknVmKk8lK0CVbg1ZYqSgi9IzKqkgt/KbZUAU9hfb04FeQAtnHnp3uJK+E/5IN/P4r7FFT+KyN6zVANXxGMKy5Tc1xmMPoEMhfYVkXbjHRGagdS7VHb8OpYkwu1GUBcx20ZVxZrocqJ3WLC4IQ32Vj893ApM6NTh30M1v76H9Sl0TSyBwiA9ZNNi/Fo8u1
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(53546011)(2616005)(6506007)(70206006)(6862004)(107886003)(2906002)(86362001)(82310400005)(316002)(36756003)(70586007)(4326008)(8676002)(54906003)(36860700001)(356005)(5660300002)(33656002)(508600001)(26005)(6512007)(186003)(83380400001)(40460700003)(8936002)(47076005)(336012)(6486002)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 08:05:44.4108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbcdfd4e-3a36-41da-210d-08da3d5c3407
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8029

Hi Julien,

> On 23 May 2022, at 20:49, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, *_VIRT_END may either point to the address after the end
> or the last address of the region.
>=20
> The lack of consistency make quite difficult to reason with them.
>=20
> Furthermore, there is a risk of overflow in the case where the address
> points past to the end. I am not aware of any cases, so this is only a
> latent bug.
>=20
> Start to solve the problem by removing all the *_VIRT_END exclusively use=
d
> by the Arm code and add *_VIRT_SIZE when it is not present.
>=20
> Take the opportunity to rename BOOT_FDT_SLOT_SIZE to BOOT_FDT_VIRT_SIZE
> for better consistency and use _AT(vaddr_t, ).

Thanks to have remembered this one :-)

>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ----
>=20
> I noticed that a few functions in Xen expect [start, end[. This is risky
> as we may end up with end < start if the region is defined right at the
> top of the address space.
>=20
> I haven't yet tackle this issue. But I would at least like to get rid
> of *_VIRT_END.
> ---
> xen/arch/arm/include/asm/config.h | 18 ++++++++----------
> xen/arch/arm/livepatch.c          |  2 +-
> xen/arch/arm/mm.c                 | 13 ++++++++-----
> 3 files changed, 17 insertions(+), 16 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm=
/config.h
> index 3e2a55a91058..66db618b34e7 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -111,12 +111,11 @@
> #define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
>=20
> #define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
> -#define BOOT_FDT_SLOT_SIZE     MB(4)
> -#define BOOT_FDT_VIRT_END      (BOOT_FDT_VIRT_START + BOOT_FDT_SLOT_SIZE=
)
> +#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
>=20
> #ifdef CONFIG_LIVEPATCH
> #define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
> -#define LIVEPATCH_VMAP_END     (LIVEPATCH_VMAP_START + MB(2))
> +#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
> #endif
>=20
> #define HYPERVISOR_VIRT_START  XEN_VIRT_START
> @@ -132,18 +131,18 @@
> #define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE -=
 1)
>=20
> #define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
> +#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))

This looks a bit odd, any reason not to use MB(768) ?
If not then there might be something worse explaining with a comment here.

>=20
> #define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
> -#define XENHEAP_VIRT_END       _AT(vaddr_t,0x7fffffff)
> -#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
> -#define DOMHEAP_VIRT_END       _AT(vaddr_t,0xffffffff)
> +#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
>=20
> -#define VMAP_VIRT_END    XENHEAP_VIRT_START
> +#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
> +#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
>=20
> #define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
>=20
> /* Number of domheap pagetable pages required at the second level (2MB ma=
ppings) */
> -#define DOMHEAP_SECOND_PAGES ((DOMHEAP_VIRT_END - DOMHEAP_VIRT_START + 1=
) >> FIRST_SHIFT)
> +#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
>=20
> #else /* ARM_64 */
>=20
> @@ -152,12 +151,11 @@
> #define SLOT0_ENTRY_SIZE  SLOT0(1)
>=20
> #define VMAP_VIRT_START  GB(1)
> -#define VMAP_VIRT_END    (VMAP_VIRT_START + GB(1))
> +#define VMAP_VIRT_SIZE   GB(1)
>=20
> #define FRAMETABLE_VIRT_START  GB(32)
> #define FRAMETABLE_SIZE        GB(32)
> #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
> -#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE =
- 1)
>=20
> #define DIRECTMAP_VIRT_START   SLOT0(256)
> #define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
> diff --git a/xen/arch/arm/livepatch.c b/xen/arch/arm/livepatch.c
> index 75e8adcfd6a1..57abc746e60b 100644
> --- a/xen/arch/arm/livepatch.c
> +++ b/xen/arch/arm/livepatch.c
> @@ -175,7 +175,7 @@ void __init arch_livepatch_init(void)
>     void *start, *end;
>=20
>     start =3D (void *)LIVEPATCH_VMAP_START;
> -    end =3D (void *)LIVEPATCH_VMAP_END;
> +    end =3D start + LIVEPATCH_VMAP_SIZE;
>=20
>     vm_init_type(VMAP_XEN, start, end);
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index be37176a4725..0607c65f95cd 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -128,9 +128,11 @@ static DEFINE_PAGE_TABLE(xen_first);
> /* xen_pgtable =3D=3D root of the trie (zeroeth level on 64-bit, first on=
 32-bit) */
> static DEFINE_PER_CPU(lpae_t *, xen_pgtable);
> #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
> -/* xen_dommap =3D=3D pages used by map_domain_page, these pages contain
> +/*
> + * xen_dommap =3D=3D pages used by map_domain_page, these pages contain
>  * the second level pagetables which map the domheap region
> - * DOMHEAP_VIRT_START...DOMHEAP_VIRT_END in 2MB chunks. */
> + * starting at DOMHEAP_VIRT_START in 2MB chunks.
> + */

Please just mention that you also fixed a comment coding style in the commi=
t message.

> static DEFINE_PER_CPU(lpae_t *, xen_dommap);
> /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated *=
/
> static DEFINE_PAGE_TABLE(cpu0_pgtable);
> @@ -476,7 +478,7 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
>     int slot =3D (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
>     unsigned long offset =3D (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
>=20
> -    if ( va >=3D VMAP_VIRT_START && va < VMAP_VIRT_END )
> +    if ( (va >=3D VMAP_VIRT_START) && ((VMAP_VIRT_START - va) < VMAP_VIR=
T_SIZE) )
>         return virt_to_mfn(va);
>=20
>     ASSERT(slot >=3D 0 && slot < DOMHEAP_ENTRIES);
> @@ -570,7 +572,8 @@ void __init remove_early_mappings(void)
>     int rc;
>=20
>     /* destroy the _PAGE_BLOCK mapping */
> -    rc =3D modify_xen_mappings(BOOT_FDT_VIRT_START, BOOT_FDT_VIRT_END,
> +    rc =3D modify_xen_mappings(BOOT_FDT_VIRT_START,
> +                             BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE,
>                              _PAGE_BLOCK);
>     BUG_ON(rc);
> }
> @@ -850,7 +853,7 @@ void __init setup_frametable_mappings(paddr_t ps, pad=
dr_t pe)
>=20
> void *__init arch_vmap_virt_end(void)
> {
> -    return (void *)VMAP_VIRT_END;
> +    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
> }
>=20
> /*
> --=20
> 2.32.0
>=20

Cheers
Bertrand


