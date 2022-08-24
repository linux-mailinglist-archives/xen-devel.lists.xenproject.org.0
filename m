Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C04F159FF9B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 18:37:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392864.631471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQtMU-0003YK-HM; Wed, 24 Aug 2022 16:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392864.631471; Wed, 24 Aug 2022 16:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQtMU-0003Vd-EL; Wed, 24 Aug 2022 16:36:14 +0000
Received: by outflank-mailman (input) for mailman id 392864;
 Wed, 24 Aug 2022 16:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EISj=Y4=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oQtMS-0003VX-Vz
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 16:36:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d92c95c1-23ca-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 18:36:05 +0200 (CEST)
Received: from AM6P195CA0105.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::46)
 by PR2PR08MB4860.eurprd08.prod.outlook.com (2603:10a6:101:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Wed, 24 Aug
 2022 16:36:02 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::d6) by AM6P195CA0105.outlook.office365.com
 (2603:10a6:209:86::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Wed, 24 Aug 2022 16:36:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Wed, 24 Aug 2022 16:36:02 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 24 Aug 2022 16:36:01 +0000
Received: from 2bf9aedde708.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 93BEAA61-5851-4F66-B541-A8AF890CA317.1; 
 Wed, 24 Aug 2022 16:35:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2bf9aedde708.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Aug 2022 16:35:50 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Wed, 24 Aug
 2022 16:35:48 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5546.022; Wed, 24 Aug 2022
 16:35:48 +0000
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
X-Inumbo-ID: d92c95c1-23ca-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gm37RKRHN94aowyBJ7cl7oGsQfgb0xwpHNBWa++ILQBp6XjW5+WCXlOLaPl9MDzBDOPkVXIARMOFJsrrazzYf7DYk067zyeUjE9ehULcZBhNCkUWQVV8fphMhmZm/K+3KtjOqD03Ryjvm0BjXeHQ39Pkx68W6jHuC0BO/dp/+lrfXlgx9rGdAtITDLciLoNniz097ESz7zxXWwF0VNiSNDaWrXkwLwSSHSeDOySbsgtJ9mAA+ac2cx59zmQausL7Y0vyL9fKmRlzA9ApVEnaEyBMUkgR22kFl2cm5jpf2EFNGLT3YYDQ+RSxDEShGIGtaEMX9Ixu1ceYYfDDNomLOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0niOUQVCBZIIyutWexX4tLjOMCiDYws5zD9S8C5rUnE=;
 b=UGTASAf28+iqKIIJTipwUf/c1vjga6gwiGdfx/MYW8F52FIbfdVNODTXTW88mum1APH0yNY6fAZXcTo/3AWsmObPpiqs/uYzpGJfjIyZHczCoUbyhIi/Q1IrlJGt3JXLVm3SvygO35v8CBH1lWygmE9HyuoqTUotPA07Te9mK/WoLmyYrbxExB8W3zSLlJcI5WxFM2oueDo9KwCd+VkqAzU+4Z9Ie2TI0AHs495aj7AJgbFV/lezp7yktWt93ub21KOxSd4bWpukUWqk3CC1Ugx3MnmkBpdQOnNT1CmAgkLMUTOFtHKDI26sP2Afo2Dv2C1u0RNCleg5NcBleeZk2A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0niOUQVCBZIIyutWexX4tLjOMCiDYws5zD9S8C5rUnE=;
 b=gKlWeDKN9nOIv4p5lDoeH0fPhPdT3bi7dZzkJqx7YcXzzrz/hIsd8Yzfq8un7cgJirGQie2znvhPhAL3/e7fKj/RsoUuspNtTnVWAAc/Kn3BYs2m/I/TcERmYVxVhbqM8/S9+DHWMm7At0WV/z8y9dM7OTMZ6kd5we9esr+qnlY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b4331e5bf44e06b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Niz7DjKnrQPPhlZhpk8Axmuq5lK1PBQ0B3sOoAtNQrPCS3vgT18oHt20g0KhBNPSQVv/ydOvORbHjfnRB6r7TAGSsOfhD6HgXIt9lJwr0sxqdssCMZ1BqNghqsay7OUFGi+ZJLXZnVGHBttmq9IZv8zYMSV3pc/lwGH/HCwr6WMpYT/P1tteI8MXsE034gqbkjBMFgpbpmoPzP4tam67jePTTF9XyARA50PbAxz/cQMa6XSmlkVC5lExkjKWU4Mtp6B22URhGgKV704RccZjlyqbbvzWycdcmf/VWN14hFfxWwHt+A3Bv2mrW/2MSMy39RU9l0BpeiagKEGUwa0Grg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0niOUQVCBZIIyutWexX4tLjOMCiDYws5zD9S8C5rUnE=;
 b=UFpfZbtmK5mMyYc/rkbmwg7NbVYM0EwfKQHYcaEDL/GFpG8yPnBA8pWiwoa+sjl/xl25m3Tjl98aKzwJGIkP5TrBQJPyoLySacDIxlCd8yNPhyzPTYdXNR+qKkgZ3FFE8K0GyiOt+tfAX8PnX4wGWEDfqA9EI7KgC6FjmtLvl/QxzUHpF/eB0Wh5bjdL6rXSUcOL5laDJBPSwvZxJ9wAfsMo6v75AYULbUMMq87iNXiRupKr+xC6oZo7KP3VMkUVsTOOM/DD16VkUR+Fmv69MAL+nyUYfe3ubkO2QPvobfPBpQIDrFpt4aU9OKYVhBrM6shMdIIUvkD23XE9MTTETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0niOUQVCBZIIyutWexX4tLjOMCiDYws5zD9S8C5rUnE=;
 b=gKlWeDKN9nOIv4p5lDoeH0fPhPdT3bi7dZzkJqx7YcXzzrz/hIsd8Yzfq8un7cgJirGQie2znvhPhAL3/e7fKj/RsoUuspNtTnVWAAc/Kn3BYs2m/I/TcERmYVxVhbqM8/S9+DHWMm7At0WV/z8y9dM7OTMZ6kd5we9esr+qnlY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYs7NVSZ6RtK1DJkmDvOUuzqeVhq28SEyAgAG2wACAAAxAgIAAHKoAgAAPToCAABB1gA==
Date: Wed, 24 Aug 2022 16:35:48 +0000
Message-ID: <474E0887-7EFC-4A0C-9815-DFBDAE9A93A9@arm.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
 <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
 <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com>
 <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
 <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com>
 <685e53cc-1b83-8d66-7086-dad4135c0587@xen.org>
In-Reply-To: <685e53cc-1b83-8d66-7086-dad4135c0587@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 96217c4a-c47f-4da0-5f10-08da85eebb8d
x-ms-traffictypediagnostic:
	AM6PR08MB5078:EE_|VE1EUR03FT041:EE_|PR2PR08MB4860:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DYqhWBvU6+eCgMke3Mo8zdHI7BKTXPFfOLt4jkjmBH/uGA61j58zrtXNmD9EPTNCfSc0doViZxJaRPCbKlHRsbEx8l9NqE6GowvrG6dMMFgEGPdTJTifK2KoiNFUnvOAeDuqsc73oxPR7ZSysYHB4A371rPkZGWV6N6GaEsdlCoGJbw0WKXfQfy213lPfWZhhnPF9ac0gYB6ex6ClEK6X8ZcI5XbxBSt18yESMCpVdCcKL1TZNRwPnAiRsGC25JKxyt6UPw93+HiUBaBiDbqnIEGlFhCpJsyGdlSKwmK/cyGokl4Odwn+FhBL4wZeefkQhGXVl3OsoU3DMal3O1jkgUpAylhzUtkIJXxuNGypO6ehYaDw2oupGhE36lGCqFAcmcdX7nNCZaEBSA//U5TqJxagnQuj5RnOMWa6JLUqyuGJstWOyFEbWkVkBYZ5Qw/gEHPbucnmt076mquOvrXGPF2z45puXAvxUftpNQJOUSslXOSsRFCI6vKoURDTWY0YXOfHdo6wdqDYvhDMXXq2QZIMX3dhLrtH8QrshL1ZcuiW2LDqtlLbwb87m9MagPbAnKk9MJgnvi7bnMeg7v7+pWYkx1oG6AE/24zHZPhNt8nrNnX0eAMdpCwSTBkA/0ZCx45hzkAUHr1JVmiV+c3JkUi89e38zUPHewM1RpH03JSDxiTMLAPF1Ad4yAffwEDlnMua7nrzMyMZCcjj83/tvTTRroTV42ZkOyjypAF6UEj7z8gIAURpc2d9seBtHRxPx62V5b/tIByCa8SGoMw/56tuR13ZioRuNsEtnHsd+4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(91956017)(36756003)(86362001)(76116006)(66946007)(8676002)(66556008)(66446008)(66476007)(4326008)(64756008)(122000001)(38100700002)(38070700005)(33656002)(6486002)(26005)(6512007)(2616005)(41300700001)(71200400001)(53546011)(83380400001)(8936002)(478600001)(54906003)(6506007)(6916009)(316002)(186003)(2906002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <89EFD628C03B3C4ABA71305C492CB006@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	934d451a-014e-4d51-25a7-08da85eeb348
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wLV4P/AVWQpvo4KcHz9uwj1wWU7tqEMZj/hWZ3RpG1LAq4Sjtgi1bAbvmqDTML1exsQ4uY89NQqR4a/ulkXtR7FTqUSPjmUNMGH4fYt5ApOdR0xrlpRIfzxivTK7sMd8g7CGJ3+7E0OMjrQNui66WWeKDOUqcy8NVEhTPhcuvvlIbJe3UxzPe7iH/u/C7DndGGFElM08PGLtpk6Ii5Cmx0PUjaI8z/65Js9/AhOjhXTu5kXc1nzgecVu5LaUW1P8dsKR+vPRadJd+yu101BS8VV5VU3Zyp+lkwh20eQ5cJXsl4gPMnj3lcmcnkkDFKGHpBlECIvedEQZwc8KCGewae97jbS3Pe301ddqL9kvkLV4EUTTxfCQNGlhHGdQJdyOuYeUmrgKgr5XEjr9TEi7Kub9bF6NTxeppW3UZhmby7++U73jJa8jr7hqSt/1bEW07P1FEUIxTFzy+lv/xis94k9l/S404YYqgy873Js+WoCsCDfbrN9q6WIu8PTM97Sgo+ldLH39fKjwSZdPdpaVJf6h21A/oHHv+MJbF9USKjwDKD9KDru8Zw8SH6XS5+j8jqxYrkBTAddZD89sBqe/x60sD0RvbZ2jpRnpDtpvifWER9/XZpfw+uSI2a4dVWI6/FFt4LrPBjiOXK+RSSdX5yleKMIQ3VspRJ2H2hdayC7sTRoFFrpi9aHhm5EJcWgbfZntkZfmotkoH3PHkiraysDIBDqD2620QvMQ7SQfdb32fvrhs0TYZsctlOl7Rj1Uems2sjfxHg3y4WIA5U9b5w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966006)(40470700004)(36840700001)(83380400001)(40460700003)(81166007)(356005)(40480700001)(36756003)(82740400003)(36860700001)(70206006)(70586007)(82310400005)(33656002)(4326008)(8676002)(6862004)(6486002)(5660300002)(6506007)(478600001)(316002)(26005)(6512007)(54906003)(53546011)(86362001)(47076005)(186003)(2616005)(107886003)(336012)(2906002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 16:36:02.0478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96217c4a-c47f-4da0-5f10-08da85eebb8d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4860

SGkgSnVsaWVuDQoNCj4gT24gMjQgQXVnIDIwMjIsIGF0IDQ6MzYgcG0sIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gT24gMjQvMDgvMjAyMiAxNTo0MiwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+Pj4gT24gMjQgQXVnIDIwMjIsIGF0IDE6NTkgcG0sIEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IA0KPj4+IA0KPj4+IE9uIDI0LzA4
LzIwMjIgMTM6MTUsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+PiBIaSBKdWxpZW4sDQo+Pj4gDQo+
Pj4gSGkgUmFodWwsDQo+Pj4gDQo+Pj4+IFBsZWFzZSBsZXQgbWUga25vdyB5b3VyIHZpZXcgb24g
dGhpcy4NCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPj4+PiBpbmRleCBiZmU3YmM2YjM2Li5hMWUyM2Vl
ZTU5IDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4g
KysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4+IEBAIC0zNTYyLDEyICszNTYy
LDcgQEAgc3RhdGljIGludCBfX2luaXQgY29uc3RydWN0X2RvbVUoc3RydWN0IGRvbWFpbiAqZCwN
Cj4+Pj4gICAgaWYgKCByYyA9PSAtRUlMU0VRIHx8DQo+Pj4+ICAgICAgcmMgPT0gLUVOT0RBVEEg
fHwNCj4+Pj4gICAgICAocmMgPT0gMCAmJiAhc3RyY21wKGRvbTBsZXNzX2VuaGFuY2VkLCDigJxl
bmFibGVk4oCdKSkgKQ0KPj4+PiAtICB7DQo+Pj4+IC0gICAgaWYgKCBoYXJkd2FyZV9kb21haW4g
KQ0KPj4+PiAgICAgICAga2luZm8uZG9tMGxlc3NfZW5oYW5jZWQgPSB0cnVlOw0KPj4+PiAtICAg
IGVsc2UNCj4+Pj4gLSAgICAgIHBhbmljKOKAnFRyaWVkIHRvIHVzZSB4ZW4sZW5oYW5jZWQgd2l0
aG91dCBkb20wXG7igJ0pOw0KPj4+PiAtICB9DQo+Pj4gDQo+Pj4gWW91IGNhbid0IHVzZSAieGVu
LGVuaGFuY2VkIiB3aXRob3V0IGRvbTAuIEluIGZhY3QsIHlvdSB3aWxsIGVuZCB1cCB0byBkZXJl
ZmVyZW5jZSBOVUxMIGluIGFsbG9jX3hlbnN0b3JlX2V2dGNobigpLiBUaGF0J3MgYmVjYXVzZSAi
eGVuLGVuaGFuY2VkIiBtZWFucyB0aGUgZG9tYWluIHdpbGwgYmUgYWJsZSB0byB1c2UgWGVuc3Rv
cmVkLg0KPj4+IA0KPj4+IE5vdyBpZiB5b3Ugd2FudCB0byBzdXBwb3J0IHlvdXIgZmVhdHVyZSB3
aXRob3V0IGEgZG9tMC4gVGhlbiBJIHRoaW5rIHdlIHdhbnQgdG8gaW50cm9kdWNlIGFuIG9wdGlv
biB3aGljaCB3b3VsZCBiZSB0aGUgc2FtZSBhcyAieGVuLGVuaGFuY2VkIiBidXQgZG9lc24ndCBl
eHBvc2UgWGVuc3RvcmVkLg0KPj4gSWYgd2UgbW9kaWZ5IHRoZSBwYXRjaCBhcyBiZWxvdyB3ZSBj
YW4gdXNlIHRoZSAieGVuLGVuaGFuY2VkIiBmb3IgZG9tVXMgd2l0aG91dCBkb20wLg0KPj4gSSB0
ZXN0ZWQgdGhlIHBhdGNoIGFuZCBpdHMgd29ya3MgZmluZS4gRG8geW91IHNlZSBhbnkgaXNzdWUg
d2l0aCB0aGlzIGFwcHJvYWNoPw0KPiANCj4gWWVzLiBGb3IgdHdvIHJlYXNvbnM6DQo+IDEpIEl0
IGlzIG11ZGR5aW5nIHRoZSBtZWFuaW5nIG9mICJ4ZW4sZW5oYW5jZWQiLiBJbiBwYXJ0aWN1bGFy
IGEgdXNlciBtYXkgbm90IHJlYWxpemUgdGhhdCBYZW5zdG9yZSBpcyBub3QgYXZhaWxhYmxlIGlm
IGRvbTAgaXMgbm90IHByZXNlbnQuDQo+IDIpIEl0IHdvdWxkIGJlIG1vcmUgY29tcGxpY2F0ZWQg
dG8gaGFuZGxlIHRoZSBjYXNlIHdoZXJlIFhlbnN0b3JlZCBsaXZlcyBpbiBhIG5vbi1kb20wIGRv
bWFpbi4gSSBhbSBub3QgYXdhcmUgb2YgYW55b25lIHdhbnRpbmcgdGhpcyBvbiBBcm0geWV0LCBi
dXQgSSBkb24ndCB3YW50IHRvIGNsb3NlIHRoZSBkb29yLg0KPiANCj4gU28gaWYgeW91IHdhbnQg
dG8gc3VwcG9ydCBjcmVhdGUgInhlbix4ZW4iIHdpdGhvdXQgYWxsIHRoZSByZXN0LiBUaGVuIEkg
dGhpbmsgd2UgbmVlZCBhIGRpZmZlcmVudCBwcm9wZXJ0eSB2YWx1ZS4gSSBkb24ndCBoYXZlIGEg
Z29vZCBzdWdnZXN0aW9uIGZvciB0aGUgbmFtZS4NCg0KSXMgdGhhdCBva2F5IGlmIHdlIHVzZSB0
aGUgZWFybGllciBhcHByb2FjaCwgd2hlbiB1c2VyIHNldCAgInhlbixlbmhhbmNlZCA9IGV2dGNo
buKAnSB3ZSB3aWxsIG5vdCBjYWxsIGFsbG9jX3hlbnN0b3JlX2V2dGNobigpICANCmJ1dCB3ZSBj
cmVhdGUgaHlwZXJ2aXNvciBub2RlIHdpdGggYWxsIGZpZWxkcy4NCiANCg0KUmVnYXJkcywNClJh
aHVs

