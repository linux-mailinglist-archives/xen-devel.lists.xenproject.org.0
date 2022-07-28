Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BB55839B8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 09:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376648.609555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyCA-0002Ro-OU; Thu, 28 Jul 2022 07:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376648.609555; Thu, 28 Jul 2022 07:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGyCA-0002OM-Ld; Thu, 28 Jul 2022 07:44:34 +0000
Received: by outflank-mailman (input) for mailman id 376648;
 Thu, 28 Jul 2022 07:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/qu6=YB=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oGyC8-0002OG-Ic
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 07:44:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2044.outbound.protection.outlook.com [40.107.20.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d11a36d-0e49-11ed-924f-1f966e50362f;
 Thu, 28 Jul 2022 09:44:30 +0200 (CEST)
Received: from AS9PR05CA0041.eurprd05.prod.outlook.com (2603:10a6:20b:489::21)
 by AM0PR08MB4337.eurprd08.prod.outlook.com (2603:10a6:208:13d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 28 Jul
 2022 07:44:28 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::40) by AS9PR05CA0041.outlook.office365.com
 (2603:10a6:20b:489::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Thu, 28 Jul 2022 07:44:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Thu, 28 Jul 2022 07:44:27 +0000
Received: ("Tessian outbound 2af316122c7a:v123");
 Thu, 28 Jul 2022 07:44:27 +0000
Received: from 10c67d2d28b3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A79A3FED-A548-4252-8E13-1954450F25DE.1; 
 Thu, 28 Jul 2022 07:44:20 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 10c67d2d28b3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 28 Jul 2022 07:44:20 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AM9PR08MB6228.eurprd08.prod.outlook.com (2603:10a6:20b:281::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 07:44:18 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.024; Thu, 28 Jul 2022
 07:44:17 +0000
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
X-Inumbo-ID: 1d11a36d-0e49-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=TzOGbTxrGHnT668Nl9x8u4HAOcXYxSnqro7b6XCS+e33TunDA1e1DH9ow4V87fVWjv2P0V+HIGtydcULblkoryKPHIarfqeq/rRytfwfdlMf27y9vzgeH665m2yw+RPx+mJrkwzG3OPs3LJ6LlXbsbqOX2dmkeWQTkRNlTym1be9QTx7H5R+G6yPXuMlzuaF+ie7OgcnRs0VkJhhYoUncpmaelmR/quvwmED3AeQHvJW9PRdAlJ82g20HzW3qwZhOiAAObh/ufEJ5yvPOVGprBgT3jWMODzsJElHr0jCEoWqStlJsch8YUChuKnp3pkx59GqcP7yX/Y6p3d3GwVi4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrUADJBNWozHG+GIAokSBOrpOcYUlc9ScSm+9yKHsLU=;
 b=UoKHJehtqpybJRn2jVkrH7MhZjn7YlxFkj0GEi/cOSa+A1bLx6fLJwJOLlmPGVuHQy6FHCh4daZ7/yW3PMwZjM+NoYUGToaUDk5fVab7kj5JE03dR5DnMasFvn/BZHBsobHkzwMGDqWq0fmdVtNqQxrWqoUARJuaQo6x1LfH2qILQNp3vXWfENNYSHJA4V76cD2B2Jz/eFghCWchtsp4vFjIOgsY8k0iXSzxkpmf9QKOfY0N7DuX3FsrJ3b8zc4UwdYoLsph/i3a5rPhs1dZcP6OFbT9Ik7I3vWUqCGG38kfzKWX1bqH/u804Pb4YZS+BVu66atenREE4wyy38xRIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrUADJBNWozHG+GIAokSBOrpOcYUlc9ScSm+9yKHsLU=;
 b=DWFszjmxdHWvVGznT1vHAbLnaQg1UhhaUhwDpyTNfic8x5XE/WkcmXztuxbmtzilNoq24m+peH/ZCMFMg0YA3WjfMpl4Qhv8Zeme1x8e8bQ6Qq3CEa3xSRRS1+A3EfIuH3LEz5IlcM6wDonrsJxubnTsveAEM0ig5nc1gmAtIGY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 97e52c562a3af1ca
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9XQZoCBfouhFfm3Q/6ZEURpoVVg2HK8A2+7ZRbIzS2RGY/L9YwqjT3LC0yC5Tufn+jYwy5QwciujRgCwZmM1bGWg8U3qmq7ZCnYDMfmHw6kmJLuNXQ6JL62vigTj/exiBbbHmIJ+WvQLLbnJw/KNBZ0Dvl2WCHCcfvOOQelMRsdkDZgIuLqnkHdu2duOmP3DUNc2nr6TjrSEkrsAcZA7DUfOEU96mvVPjOseBPc6GDaz+rym0EpXGvFU1wik1EDapQhzc1NwsdtU02hBbvebHorkDY9YZkXSJmTpHr8qsJ0bfyRrsx2T1MWpcrl0xa1HvfKOrg/KDFwe2WnOgE0PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrUADJBNWozHG+GIAokSBOrpOcYUlc9ScSm+9yKHsLU=;
 b=O+dRkq86pPMcDgjt/k+onmXgorxI7PSJdKcGf4n2DZmqMEpEMaQHpfsqVBbjjMcjFBTRgRTMuh73Jl0GxVQwUlpzY2UBu7jsY5rsc9GVt1FgKpkMI2tT+/J8IxXbGxFJUq1HbwtGR+zd+cT9/V0Qya4C0OwOPqBdPu1FsxLKYaMDYdT11JgKk6a7czggXhNSf9btpLI7rlUbK135tq0hTdrXqgH1VQ5oTdlfs5UT4at1l0dBwEAinZraai0ijayvPlhAlrgjD7EsVxgoPlFWOqvmnYTjLRo9pyx8Or5B3z5IU4zMDzHYsXZffOtRARsfLG0qf9spu3rn/DIaTmh8mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrUADJBNWozHG+GIAokSBOrpOcYUlc9ScSm+9yKHsLU=;
 b=DWFszjmxdHWvVGznT1vHAbLnaQg1UhhaUhwDpyTNfic8x5XE/WkcmXztuxbmtzilNoq24m+peH/ZCMFMg0YA3WjfMpl4Qhv8Zeme1x8e8bQ6Qq3CEa3xSRRS1+A3EfIuH3LEz5IlcM6wDonrsJxubnTsveAEM0ig5nc1gmAtIGY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Xenia Ragiadakou <burzalodowa@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xen/xsm: dummy.h: Fix MISRA C 2012 Directive 4.10
 violation
Thread-Topic: [PATCH] xen/xsm: dummy.h: Fix MISRA C 2012 Directive 4.10
 violation
Thread-Index: AQHYocxnMww85Hdpe0SsTcfV9898uq2TaBWA
Date: Thu, 28 Jul 2022 07:44:17 +0000
Message-ID: <2899DC8B-39B3-41CE-B5DA-60350C8F0677@arm.com>
References: <20220727151953.1125331-1-burzalodowa@gmail.com>
In-Reply-To: <20220727151953.1125331-1-burzalodowa@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 18e2872f-196a-41d0-de61-08da706cffde
x-ms-traffictypediagnostic:
	AM9PR08MB6228:EE_|VE1EUR03FT046:EE_|AM0PR08MB4337:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hP6zPl2loZf6rjtWzCHVnYNOs0qpeLSHWcoWy13ydqqq0XHtUghSHV2lO84GlMbAKZhVXl6JY+SOG0WxLfJJfYRhBEir7l2FZZfK3/3OhVF4d7jB89j7oAFsI+Wiw/BfT2zo6NhWXHSNE+uaUdaJvsrzZGxsde1yCxs1c5U5OPU8Nc8Y+rrvyBhWceB4r+uZeS/bNTNvOkj+S7BIxXXhOtwz31fiWE8AdMETsDkuW7fEkOZtISoOfioXM/temyHpEzKuIX0iAPIW5YaPqaM81iNpEyr6zoxI7b82rdfX8nSvEp+tRZDX3T6qZ1hn5Cjt2bCU+HB2jM3Ko/Gd71bg0ZI+Q454Mv9gVdGOUj/gFsh/H+Y1jz+1se5JCfxjdWBWXNNcC4/X2C6TbWpYKsHHP1t1dRv53t9tc0wygkLsDLa8ZFuj+D3epx1EMfaZF8wlecUUKsYBBuprSH+abq5NpBk+oP9o1pgW92Ari/Aks/hkpsLOJmykXH9BCYK28Y+XHkBYjCGcihtq7QhkLmSZyMPZGI6FYcpuP3ghyZ38KR+FJXQnAXLG0lnvkNsD52LQznXl0VdK6ANsfSDUhG8BeM1JynJwpSKOBBS69FNRJk5tDc9NWO0uEHbQZHG20iBWf/y7fh+D6EaEOYJjnw/QRuvLdbKykPadmoWzbhlDzvO71GlPXS9eJnCvotT7blWNypC/HF8QQnMaI6RO2v2qH6Sol1g7WLqn6xlRQ6kGE8zGtwdxP6/Woa720pTwk3HWrV59bXX2QaWQVj7AbGEexnALkO8uHhSkok2iqgmdGMsyk9GnfPXUHq4jJN5KPQQfu0RsB9D0fljP7KXVI36L2w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(86362001)(38100700002)(66476007)(38070700005)(66556008)(66446008)(66946007)(76116006)(64756008)(8676002)(122000001)(4326008)(316002)(6916009)(54906003)(91956017)(2906002)(8936002)(26005)(5660300002)(6512007)(6506007)(53546011)(2616005)(186003)(41300700001)(6486002)(478600001)(71200400001)(33656002)(558084003)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7E079A4025C4714A9DEB294E3772A0CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6228
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	caafb22a-6b23-4af7-6f0a-08da706cf9da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QGMSQs7VPPk5DrSa9UwXqn3gGON//JmakYBYTJnzEuq+JdrcoVibhYdAfckQ2Eu62NjCDkuHrR9GkFrxcBslMS66iQaP/yZjDEQLEPjfQs+KM4Id1DrOU9GmJru8rSIwGdcT1BM8UE5b3k69f3xGWjDmXCyvkWs1iG81A7BR1fHVqd8OK0ucsmmV9HxVTx7/ma6QX6k+TYlZAnUOlVyd1xG1iksRo6mCbiHFJX49ofvxfADboUz3/ipBOyNyW4USclg7me2bvxNoUnixAOCX/orVChQ71qtc1hTNb0dZnazmDEGVogEAMoKcb3RXkwIbdqGSM+xmQEeTGhuFisJ2ov3uN2AY76aX4VHjJY0CPUOeziiGFUYFRMnY+xdd38uG3oUo+watDafCfghYXm8c4+TKz+YPkakNJSCZRwyTsNRUxetsLvtfdTjy2qkI/JJQhu0J3aTdrqED7tZNJmkdCNqqKuDHQHbgmcDSXcGPABrcSF2YY0WbIqn/p+z0aYcn67RdV4engttYXXNmJRX3BW5WbBCykusNqbCkxpVSQbZFnhpqEe7CO5WTSx7u+YzP/oXDxkaNiWsdW4Q64UoMbGAuADVBlSvd3Rk7aSJJM8xdKsiI5Ic/5KV4DHFAAtrdaSX8BvJpgcaQTs+W92lQhxvE8UmBLSzN/Gsoq1zxH0U4mG+GsjWtEnjHgaghMn1Xw7moEqJx1xFZPap8ZwSho5hnh4KbJh5DRRvsNfyx2U+ck9oTSHeccZHzOAxxAKY1QRE0LmJbW48BnWT6YsjM9OBfgh8Ip9LHN6xyedD+6rxEKPcZOz/Ei6JqUJHw1r9Z
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(40470700004)(46966006)(36860700001)(82310400005)(53546011)(8936002)(86362001)(40460700003)(356005)(6486002)(478600001)(316002)(558084003)(82740400003)(81166007)(5660300002)(33656002)(107886003)(40480700001)(47076005)(70206006)(54906003)(70586007)(83380400001)(4326008)(186003)(2616005)(2906002)(6506007)(8676002)(336012)(41300700001)(26005)(6512007)(6862004)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 07:44:27.6823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e2872f-196a-41d0-de61-08da706cffde
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4337



> On 27 Jul 2022, at 16:19, Xenia Ragiadakou <burzalodowa@gmail.com> wrote:
>=20
> Protect header file from being included more than once by adding ifndef g=
uard.
>=20
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

It makes sense!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



