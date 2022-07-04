Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A33564EE6
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 09:42:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359879.589141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Gi6-00037M-Dl; Mon, 04 Jul 2022 07:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359879.589141; Mon, 04 Jul 2022 07:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Gi6-00034m-AC; Mon, 04 Jul 2022 07:41:34 +0000
Received: by outflank-mailman (input) for mailman id 359879;
 Mon, 04 Jul 2022 07:41:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TmxG=XJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8Gi4-00034g-UU
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 07:41:33 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30076.outbound.protection.outlook.com [40.107.3.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b88ccaa1-fb6c-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 09:41:31 +0200 (CEST)
Received: from AS9P250CA0018.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::21)
 by PAXPR08MB6988.eurprd08.prod.outlook.com (2603:10a6:102:200::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Mon, 4 Jul
 2022 07:41:29 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::d6) by AS9P250CA0018.outlook.office365.com
 (2603:10a6:20b:532::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Mon, 4 Jul 2022 07:41:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 07:41:28 +0000
Received: ("Tessian outbound 514db98d9a19:v121");
 Mon, 04 Jul 2022 07:41:28 +0000
Received: from 898169eada01.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24DBA0AC-BC38-4424-9F8B-81F2FC773353.1; 
 Mon, 04 Jul 2022 07:41:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 898169eada01.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Jul 2022 07:41:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV2PR08MB8099.eurprd08.prod.outlook.com (2603:10a6:150:7d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Mon, 4 Jul
 2022 07:41:20 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Mon, 4 Jul 2022
 07:41:20 +0000
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
X-Inumbo-ID: b88ccaa1-fb6c-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HlCJhP5afByl/2EQVFqQ+/tdEB62vei1sR9iP5kCvyUlPgBnCmvBY/WBcyJgpaqnIM2h1VmoUOhtTKbvXXsOw+xLOtIn5YoEvybbzrbj7paVVrK6Y7Jq3QbmJdfqnOadelvCdKxtzhfNY8WnOkYMWXFS5pFyUsdg5JsR4szIvcK7VF/3h8kElpVKI+ShOHqy7lob2+NcQBY3nptFsCOEA1h3EhDKxSLCk4VkXAmtI2SqkYH2/paEi84eA0XY2gTcAb8smJE9WMWxwOilIRWpLeX7EyYECvFKgVv4p1IJDzft4/cdM5l/SZZxyG5unjQRYGbo03THY/X/cFPBJaCfLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UPOhzPV33OghZIqesvi+kHzrRT/L2wAe/j2XuIUoak=;
 b=Dc9P4xjyQiyLWbV1XskyKTHYuovpyc3YdysMMO1pqRwYnVH6Y8YWAqEL8seujq9Iji9KXAA+EvEkXwL0yH6YC/e+7gRzcKB2GNM4quk4eqON6T3Um0dJUPrzzsaZGMnFG+OJn8CcaRYudhpMe5OLAOqYPggJE2+huDB9755jCJtsb5Dv7MsTMsvquwZWpwyLMXzZACTSHRTpNKSZ6fBI8z644J4rJBU2IShpEggXNBxTSqmzKC4wnqzsNKai1dOcARda0WxGTJjKWTDIk2Xqt67BvsTTRwmvoCZ8LWh0+vpNa8bC1Wm8jVF8W0B3y34IYo1D6X5aD2LUgwBrETTbmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UPOhzPV33OghZIqesvi+kHzrRT/L2wAe/j2XuIUoak=;
 b=rrcMAqoNq6Buvt8erY8Yj0IwVTZ6O179+bnvSMbQDXBJi2z1ltim/nqUCDiqAnqgxq9oZncil1Kd4QjgwTooSr9Nu+c1g+b1jhMFfvaU7tr9grw3nwhLSpGEfmXtrW0IxRNRrNAIKwN9rWHeAsRORAUu7YsO1QzNhJcboYY09Aw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 85a90d0a167cd021
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUM4T7afCwwKOohvnvwbJ0WbM0EAWpclP7tkfNY1UqsErOiFwpml0MTTnUrMvfDIw4TgmBdugEvpVEQRi+FFv9AZA36EyaUv9l7wInYZWVT4oJWZtiYAHHnkaKuorEOKIQtxQkqZn1TOgtcOo/QBJRpf2Ebu60hsRXuGcV4zRf7D6iqRfhaOqfaHgbO924Rdgty3hhi8581IfJ+z9jSwJ2mP8tXWFpm8ghCAJ36p65vSMd8gDrju36KCtSncApugA8E+ZmE0XTp26eebmxWvkJCAJcJxLTS6YVS36bG8gofqZz7QQTiYGiIYxbpoi79Q2TN7epXqacBLAqWzCltiSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UPOhzPV33OghZIqesvi+kHzrRT/L2wAe/j2XuIUoak=;
 b=IcVrKMhfBOgC6vjDwnx7xiAQNqPj8F2165gMujuLtpckLR28CcDUPS+g2SdohrnBq9KubF7BrNTu4HWT9TTuiIyjQcpCGT3DOinvaq4JMZhZ8+bXNkIzNCDBXMQnjOUypPZLuR2iLYa53exCuOGt1oXN21B0Elnw421acFivI68pZ7zgajoyVhrDZUHfs+rWZsAXArnlLaMZDuKtIF76RD5I5DHWNawvlI35+W4g6K7j0xUT2dN6fgxHBv9dg1kO1cKENZicLtDlE3MehyjgroGSjcprme5gfKWm2TBJo99DNGOiSI6uAR+3px+8rDend9YTqwT+5HLbg23T3LlK+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UPOhzPV33OghZIqesvi+kHzrRT/L2wAe/j2XuIUoak=;
 b=rrcMAqoNq6Buvt8erY8Yj0IwVTZ6O179+bnvSMbQDXBJi2z1ltim/nqUCDiqAnqgxq9oZncil1Kd4QjgwTooSr9Nu+c1g+b1jhMFfvaU7tr9grw3nwhLSpGEfmXtrW0IxRNRrNAIKwN9rWHeAsRORAUu7YsO1QzNhJcboYY09Aw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Thread-Topic: [PATCH] xen/arm: traps: fix MISRA C 2012 Rule 8.7 violation
Thread-Index: AQHYj3bjMrWoDl4sYkqZXzEqwsl1S61t0/kA
Date: Mon, 4 Jul 2022 07:41:20 +0000
Message-ID: <EB360E93-8353-48D0-844F-CB529B94B9C1@arm.com>
References: <20220704072232.117517-1-burzalodowa@gmail.com>
In-Reply-To: <20220704072232.117517-1-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6349b243-6b6f-4cdf-609b-08da5d909b15
x-ms-traffictypediagnostic:
	GV2PR08MB8099:EE_|AM5EUR03FT030:EE_|PAXPR08MB6988:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Fcy/CVRPkSNMTuzrZfwxcj+0OqWfnnb8QKoU4g6lHBHV1x3q0EJfjA7hmvCaiQBORVwzRYnrRhMAIhqk69c+BI6BU7yr2NngfE/pwmdGh/YDCjO8u71cQU/3g/AbcRqRihW9de64cKAOrBNti+HV//aYtoZEoAQGyqAA6gSwnCGkJJSLAXH4gBZAEcNachVi/ii7JpxktSLt8boS60ch1J5hxq71mLVXdexsBHfOxQMN7kwYHPowhSCNnrvL5qmkhuagCYO24e3zVzUYyAVv1YiJ/v9b87fWzTuQl5LqddxXHKxV1aMz+LlHUPr1qhgGDm+ejwriJ6DQ0VX2rpzsKJv2ZMWH7Pvm0gc2T/uxXqyIPj79Mp5oku/S3n9mWYfoFMqMmhvlKfBAMPNbe5E7XoySZnFX1VxxeePNhHunDn1/x/T2AJ7w30gP//A0ZRaTK1GeTgAEoZkS/xIxbxWOCuOmR+PnhkRWMetzLMPcptCkjZCRQQSLA1lxw+CjfBRXXiG3VpZfNUkh+ETO/s4xG7uip8bBJvLu69QQ6kgf5+5k4zKwXPa5Zsy0K7LgPCkbsJoZnVKk9yOXgAtbA7UEhNMeKDuutrW5WGXCXd4WU6BUMJizYgBpG7BjOV9sm7H9UHzj/ght2jtGyqW2QvN3la+8oS2tql6c5kQeAVun3qrOYrYp4f6ORQd4XECYeIGiu3mHv+KbeMxlD/2h+X7EIDsPujLWaie+L4mtAVFgHZH252bv+PuOasFzzLd04NHpM0UmXullNT46mW2h6iMt76GdoJpfcxZEALdak8gUz9EKSmU8DULyqe8JK2UiMEbkAXIxSQS0T+zqW/Y4zixXfooDi/btHEG6wRsOvfkUvxA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(86362001)(83380400001)(38070700005)(122000001)(38100700002)(8936002)(54906003)(36756003)(71200400001)(6916009)(33656002)(66556008)(8676002)(4326008)(66446008)(64756008)(66476007)(66946007)(76116006)(6486002)(91956017)(316002)(26005)(2906002)(2616005)(186003)(6512007)(5660300002)(6506007)(478600001)(53546011)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C0222A86A124254D87BBC2B1FD1367D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8099
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2756db60-aa7c-463c-0787-08da5d909654
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QY3jETHQ1XGPCX7daW9PUISiS+rkLe75G3TSpCJoHVSM1zqaSxrR8B7KRdkQ33Ta4mK98TbqYeNWNpskLUl/Qly20LLWN3K6XsJ11XZh5EXPkz0MCT6nwLgfTExfBHS2vL+EUK09P2oh6xHuB/d67PPTmDXkSMZC8mTYyTlUomBLmIjD+PIMuh9wX3BSOAmcJpiZ+tPJZ487HmM9a5h8RJzlcrJN5DdmWZ0FrerPvatShznXM7VlBd8pmE9JpEwigrG+hQnL0I9/v9/sv5qxW3tWhRxxFknu13J5k+cGb4U0LUOQKYRxm2p9apu/BQfgUYeOpKDS6Mzkd5CyeE0ByCgKPmskYfz5SF6bbVIkNMqcsy8mYFJ5KvG7j/vWEUTwPazImQIFReoUlHKz2TpYxDD3ULAZnWy42Nu5Y+E9zLFFB18IZfnOPRSwfbhr6rNvjS16qs8ZaqnHQ5W+dVB+bitW2yGZ7d9OFgj0hnWveTa9si1omBMYoM28Bs2CDtNFGA23b3Ui7FXQ1U4J9PaJJzf7MhGZ19/KUTob/t83QDNv0NG2JXGHQSKnai4JMYFdf3LwSTjlLW5gmPWc6ei7JmLAclQ66nFHGsB8xy9SyDM0RnbliAqyh1H1Wsf4eJsTAJgejO2TGxtt4lXpcGub9bOK/RC8sIlTm1yBeKsvjO3a45SkY6sKkEkjuCg+/2FVG7luJQkuBMMvCs+hpsMFU4eM8C48x5+Lur0TqywOp+Xr4kOTWjGqU5zDzPYYWlFF6wCmztUfE6cgqpoDXj+Ec48JlIxhMCt1uBvPWa2+q9vX0qtdY+h/l714/WPJ6dgS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(36840700001)(46966006)(40470700004)(6486002)(86362001)(478600001)(26005)(4326008)(6512007)(53546011)(6506007)(316002)(70586007)(70206006)(40460700003)(8676002)(54906003)(82310400005)(41300700001)(36860700001)(82740400003)(81166007)(356005)(2616005)(186003)(107886003)(336012)(47076005)(83380400001)(5660300002)(40480700001)(6862004)(33656002)(2906002)(8936002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 07:41:28.4264
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6349b243-6b6f-4cdf-609b-08da5d909b15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6988

Hi Xenia,

> On 4 Jul 2022, at 08:22, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> The functions show_registers() and show_stack() are referenced only in tr=
aps.c.
> Change their linkage from external to internal by adding the storage-clas=
s
> specifier static to their definitions and by removing show_registers() fr=
om
> asm/processor.h header file.
>=20
> Also, this patch resolves a MISRA C 2012 Rule 8.4 violation warning about=
 the
> function show_stack().
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> ---
> I am not 100% sure about this patch.
> I think show_stack() should be declared the same way as show_registers().
> So either both of them will be declared with external linkage or both of =
them
> will be declared with internal linkage.

I think that those 2 should be declared with external linkage with a commen=
t
explaining why they are. For me those are useful when developing or debuggi=
ng
and I sometime call those to force dumping the status.
So I would vote to keep the external linkage.

> I decided to declare both of them static because they are referenced only=
 in
> traps.c but I could have, also, add the declaration of show_stack() in
> asm/processor.h header instead. Rule 8.7 is advisory.

As said I would vote for external linkage here but would be nice to have ot=
her
developers view on this.

Cheers
Bertrand

>=20
> xen/arch/arm/include/asm/processor.h | 1 -
> xen/arch/arm/traps.c                 | 4 ++--
> 2 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/=
asm/processor.h
> index 4188ec6bfb..75c680ae9a 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -558,7 +558,6 @@ extern register_t __cpu_logical_map[];
> void panic_PAR(uint64_t par);
>=20
> void show_execution_state(const struct cpu_user_regs *regs);
> -void show_registers(const struct cpu_user_regs *regs);
> //#define dump_execution_state() run_in_exception_handler(show_execution_=
state)
> #define dump_execution_state() WARN()
>=20
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index 785f2121d1..9398ceeed5 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -931,7 +931,7 @@ static void _show_registers(const struct cpu_user_reg=
s *regs,
>     printk("\n");
> }
>=20
> -void show_registers(const struct cpu_user_regs *regs)
> +static void show_registers(const struct cpu_user_regs *regs)
> {
>     struct reg_ctxt ctxt;
>     ctxt.sctlr_el1 =3D READ_SYSREG(SCTLR_EL1);
> @@ -1146,7 +1146,7 @@ static void show_trace(const struct cpu_user_regs *=
regs)
>     printk("\n");
> }
>=20
> -void show_stack(const struct cpu_user_regs *regs)
> +static void show_stack(const struct cpu_user_regs *regs)
> {
>     register_t *stack =3D STACK_BEFORE_EXCEPTION(regs), addr;
>     int i;
> --=20
> 2.34.1
>=20


