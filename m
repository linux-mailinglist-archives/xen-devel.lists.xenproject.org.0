Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849777361F9
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 05:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551381.860912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRi7-0005rb-La; Tue, 20 Jun 2023 03:07:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551381.860912; Tue, 20 Jun 2023 03:07:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRi7-0005oS-Ht; Tue, 20 Jun 2023 03:07:15 +0000
Received: by outflank-mailman (input) for mailman id 551381;
 Tue, 20 Jun 2023 03:07:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+cFY=CI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qBRi6-000587-Jy
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 03:07:14 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe16::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d048fc1-0f17-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 05:07:12 +0200 (CEST)
Received: from AM7PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:20b:130::28)
 by DB4PR08MB8029.eurprd08.prod.outlook.com (2603:10a6:10:38b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:07:10 +0000
Received: from AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::56) by AM7PR03CA0018.outlook.office365.com
 (2603:10a6:20b:130::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 03:07:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT007.mail.protection.outlook.com (100.127.140.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 03:07:08 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Tue, 20 Jun 2023 03:07:08 +0000
Received: from e3e61fc7a9c1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9F49879E-A137-457E-96D8-B5F8CAF48A11.1; 
 Tue, 20 Jun 2023 03:07:02 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3e61fc7a9c1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 03:07:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9142.eurprd08.prod.outlook.com (2603:10a6:10:3fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:07:01 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 03:07:01 +0000
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
X-Inumbo-ID: 8d048fc1-0f17-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHQGWmgQkcGLOBwc/CasTNLYO5cP02ymYlqWyo/t2P4=;
 b=frZ6COZVC0Jn0kvgyF+7FWzNNCrU7N401OHYU2vPMQSs+s5WA28KcSXanyXz/gYPpN3hoamJdTOP7Wwzk+xAsbQCPTX8Jdy/F03XDSC8lTdTb81x5z0Jt6jWIKDtcBuuqZE0Zf9bKOowSWmL5YO7pH+WqVvrEFnGhBTs5QhmuAI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkl2UmyVMSa/aQrGf5s0EqG1NAEJBjgoE+4mhiiBkUMb7AFQTGwLvN0ONAxUR9n2UxiEJvPwjSpcyntx0+IS1EhXmUvxs0XUwQfd/AKGkikPSYIQph6W95h7A9pTECjphR+Db2RuTnK9awvkfRhqyNG6NhfdBF2vnOyoItm2gcyHoRBx8EfSxtaRFuZrGIp9weQL7XBvRasH4R1DdR554lY8P3h2ImTzVzwGTQ5/hXk3NjYb9OY4OvwERD3//MhOWgnLAZx2SZsXfbjeNdPqu1AG4SDu9KdQYsQNDcnW/JeP9zILESplpLFhsZ/y1s8uxCWKmYurVX0TVzY/CaJufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHQGWmgQkcGLOBwc/CasTNLYO5cP02ymYlqWyo/t2P4=;
 b=kRFAbfiOx7ncQdtBrUwalbhZKHM7yvMR5Wa8WByn1sJpdV/CzzfNKKWH2QoCZmB+FxynOSYktRGoB9SyQrmflHHqIZ0hgGtc0WD1m4Gq1bUC94zSNy8WHFwgqI67zMcaQzyPMP+RHNCqvScwf0DJjpzEf3v4vYSbPxKAgdunFE3wss9QC87b+BY1wRbQIQHEWR1Ba2nSZxySjSk8mwPwaGFxYstTeDSt+Hf8iaPZjyp+y1mlknkivcnEGAN5e7TCfckJ/y5DE+v1CnGURka3GiZUsKJg8VJtRQBDT3j4evYmSKop9PXrKqXKpb4JvyxBwRAKHsy77EbVKsti+2KGwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHQGWmgQkcGLOBwc/CasTNLYO5cP02ymYlqWyo/t2P4=;
 b=frZ6COZVC0Jn0kvgyF+7FWzNNCrU7N401OHYU2vPMQSs+s5WA28KcSXanyXz/gYPpN3hoamJdTOP7Wwzk+xAsbQCPTX8Jdy/F03XDSC8lTdTb81x5z0Jt6jWIKDtcBuuqZE0Zf9bKOowSWmL5YO7pH+WqVvrEFnGhBTs5QhmuAI=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 4/7] xen/arm: page: Consolidate write_pte() and clarify
 the documentation
Thread-Topic: [PATCH 4/7] xen/arm: page: Consolidate write_pte() and clarify
 the documentation
Thread-Index: AQHZos+4baq/guSYd0SnZjeCa2WkwK+S1pFw
Date: Tue, 20 Jun 2023 03:07:01 +0000
Message-ID:
 <AS8PR08MB799157EA3BFF602F2A87D12C925CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-5-julien@xen.org>
In-Reply-To: <20230619170115.81398-5-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CE0751F3BA9BA84198B2E3A211D9596D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9142:EE_|AM7EUR03FT007:EE_|DB4PR08MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e02e68-dec7-4196-5557-08db713b6f5c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w+Kiur7q5E3u18k22Qk5+HX8fMViLLh0YF6WXYuMt5X4WXjJhUXjpYapRNHVRfu340qogcPkHrCi9YRjOKhpOEHctrB87AaNXEzlAzcDCDmQttUdURjYWXMFEwvhxay0QW/SKYQumVP9mdvXql+ElF3S0TIJR8TK9zhW3zjL5Yqp8cCQW+Oe3e3FzTHEp+g8XjX6/q0X9sJhA2IZetOJYgkf2Rumy+l3lQSmb1CKDeksy6cfpTiZRyetEkNZ02ksBRdmG0V1uuROob4LyAvMs2UFjCKzA66w5winnAxn1edolLnPmhhIC9185So+G7T1vVcJyrO6LSe4hg1iEUxbKcjiLUIcPwFsglpam0pGkvHMGTPFSX1dPKIdIPPfthC6+lbt76FxOjt78hqb/SLw7sFOUtR3CEhlqD1HWyAWjm+5gOQxTcZd0egZ0iOGrqOfyEAxQZKn1IJh6TpHRpLtTk1L5dGgbChVHxML7sCTNO98Osm9ldARtQFrMEbBtMeBPypEn60i4lShf5EqLVPwIsJoJGGtAMXG68CAIB0GQr4eok7uMMPF5eenP3GMl2BtnAr2ZqGEc3gaGM6TTfhkqBlP2+z3NUUgivIrQtpNYXSwkAx/djsg3ySf4saLzHdn
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(71200400001)(7696005)(478600001)(33656002)(83380400001)(186003)(9686003)(6506007)(26005)(38100700002)(38070700005)(86362001)(122000001)(55016003)(8936002)(52536014)(8676002)(5660300002)(316002)(4326008)(2906002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9142
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a7af1ddd-23ec-4dfa-d874-08db713b6aea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	shyYwF4soTWgX/PChdmJi3I748y0dZK1EqtKk+r9UXVW9gK2A+Mk9dg3FjrqfskPl71DlloR1oeQYXncBRjkZbb2W4foMl7Py3sLqzm/HGF+7hVj/TIkpxvDoTNKc2RZlvgLD+YKroEzTsWkxFQOYdslkVf/3hSC636XmtjyYmwd4wWlrnCx3n1nQ2ibIeEMmMBn/Li45kzfZsRaVSWDQkDDCf1QyZsEp6unPxvEKMtXXt9tsPMu0EJNfQZUWrg6G1sxnNTvnMrLu2y4L8nbRaCPkb5grb7vDkJ0N6AfziwurRam0uIocvg/cGjOVENYQYyTRs7eZiXECk2KuqM27brPt5uONuYoekdXOHhCyAEoppt/Adpwoxb75DyjnLzSBikPJSFtFwCLWDqLrP2bwZqwskgftKN3ED8bWflaPqPkW4XoiVnHh2CNN6bmTNLiHrvhopZf21oCGUH34FnjFpceFYk1HqSkIkiTupKns9w13kJYUW7opq3rmh5NJMgE6MT70GSiZXetlHhorffSQVvaBWvPgDZYxNIO19gUolcPgWHrNcyuQveouoYMD0u89nqxav+NQkNzTIp9wDCoSmrukwbudiZUpbTXxiHimGcMjeL+fMu/Hwqdd3L6ieu8v49/Dtm0yQxESgM97w1xwoyrIiRdLAHXyxkQzkQPDEQcEKFz1ha48HKx1BR44ZGFpRoGcWzpPLBGE4tK4DZXhNjzu5WqlBNb5IhZlZAJqRhh5EesDS8VnEDjYMkqp/Jn
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199021)(46966006)(40470700004)(36840700001)(55016003)(4326008)(316002)(70586007)(70206006)(40460700003)(86362001)(2906002)(47076005)(336012)(82310400005)(83380400001)(36860700001)(8676002)(8936002)(52536014)(107886003)(5660300002)(33656002)(81166007)(356005)(82740400003)(40480700001)(186003)(26005)(9686003)(6506007)(110136005)(41300700001)(7696005)(54906003)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 03:07:08.7763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e02e68-dec7-4196-5557-08db713b6f5c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8029

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 4/7] xen/arm: page: Consolidate write_pte() and clarify t=
he
> documentation
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The implementation of write_pte() is pretty much the same on arm32
> and arm64. So it would be good to consolidate it as this would help
> to clarify the requirements when using the helper.
>=20
> Take the opportunity to switch from assembly to call macros. Note there
> is a difference on arm32 because the option was not specified. But this
> meant 'sy' (system wide).
>=20
> Futhermore, the requirements for the ISB is incomplete. Per the Arm Arm,
> (Armv7 DDI406C.d A3.8.3 and Armv8 DDI 0487J.a B2.3.12), DSB will only
> affect explicit accesses. So an ISB is necessary after DSB to ensure
> the completion. Having an ISB after each update to the page-tables is
> probably too much, so let the caller add the instruction when it is
> convenient.
>=20
> Lastly, the barrier in write_pte() may be too restrictive but I haven't
> yet find the proper section(s) in the Arm Arm.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I've also tested this patch on top of today's staging by our internal CI, a=
nd
this patch looks good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


