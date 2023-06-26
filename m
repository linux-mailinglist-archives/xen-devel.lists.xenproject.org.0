Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299ED73D7E2
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 08:44:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555330.867024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDfxG-0002Lc-Mg; Mon, 26 Jun 2023 06:44:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555330.867024; Mon, 26 Jun 2023 06:44:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDfxG-0002In-J7; Mon, 26 Jun 2023 06:44:06 +0000
Received: by outflank-mailman (input) for mailman id 555330;
 Mon, 26 Jun 2023 06:44:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VCbL=CO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qDfxE-0002Ig-VP
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 06:44:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6bbb829-13ec-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 08:44:03 +0200 (CEST)
Received: from DB9PR06CA0003.eurprd06.prod.outlook.com (2603:10a6:10:1db::8)
 by PAWPR08MB10168.eurprd08.prod.outlook.com (2603:10a6:102:365::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 06:43:56 +0000
Received: from DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::62) by DB9PR06CA0003.outlook.office365.com
 (2603:10a6:10:1db::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 06:43:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT059.mail.protection.outlook.com (100.127.142.102) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 06:43:55 +0000
Received: ("Tessian outbound e2424c13b707:v142");
 Mon, 26 Jun 2023 06:43:55 +0000
Received: from f56bda53f7c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2C37B6FE-FD5F-4A34-9096-D86F580541D0.1; 
 Mon, 26 Jun 2023 06:43:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f56bda53f7c8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Jun 2023 06:43:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by VI1PR08MB10076.eurprd08.prod.outlook.com (2603:10a6:800:1bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 06:43:40 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%7]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 06:43:40 +0000
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
X-Inumbo-ID: d6bbb829-13ec-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/Kps7qecb5gahzM/SpqUwmWytmxzmEO6Mj21PiKjsE=;
 b=Ccoq3VtneGin40tHBZIG2p3jsnA8GVEP3FFnw74VgL6OOhFvGsJYKH9jH+0eSq6nEdHfqwsayBw6N9dyqoloGGXS2kz0ve8RICbo1kJwdiyMQ+GJVdL6vpdeAmbTC+QiydaxKGoe7/bWUfyKRc9anUe+c5NrSMm3Kjl6Ehue1NU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTgrrTxWctqjKr+e4b0F2zKTPBg5BXVXcfsI+bRTx8UZd2P1v0eHjKC/IphLOMOhF0Mb9JiUf3KNleD1r+InU+E/1gd3qD8JIeSV7xtLCBrfY1+1HyzTlckefeA+Dgv8b0lr6RhkCCipwk35F8BaVBQhQzX8kdRy9B7EpczyoqG47pgQYR1iTHtlqb7GOHeqKZ5nC7BoTbhOqr5pGeO5GQwWjI63cCkL1PBC523o7RtlWAWXz9oKOWM6I/Bapy/L2TKUsdGPcl6QYLxdiJHYc0XVx4OTPzcg60cHLor/DHLgxku8Ik8ixVLRK8j1UItuc5Mez2kkknS1Oca6jMJOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/Kps7qecb5gahzM/SpqUwmWytmxzmEO6Mj21PiKjsE=;
 b=mWnP8MGvmh30mflek3nvWho0Ucre8onv6rPwbqXNWtZIT4kl9TjvVcupsCefQhtEhwdnCzzZlp9WHgj8ZRLUrUJBisz626mqzmu8Wi/YcMimDb4Lcq6oVSJEq8/wPUr3U1M7Ca7DCgurBv7TQHc4IYt51ePnQz5qk5nYbJZ6YguNpQgnBxS0YMnIC7Ii2hQawPrkCk2aoulHM07idlYB9HVXNrREeh1ql5xf+PbOlSBcEBRlHnLHz9Sa6ucUlHx1OeG4VTMIV4if0uO/rtfRUgQ5s8qJLjpPUlR8fsqE6Gph2uT0NN8NZ4xMeP7U5jp/g5HynofCeGCMWvLtfUaxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/Kps7qecb5gahzM/SpqUwmWytmxzmEO6Mj21PiKjsE=;
 b=Ccoq3VtneGin40tHBZIG2p3jsnA8GVEP3FFnw74VgL6OOhFvGsJYKH9jH+0eSq6nEdHfqwsayBw6N9dyqoloGGXS2kz0ve8RICbo1kJwdiyMQ+GJVdL6vpdeAmbTC+QiydaxKGoe7/bWUfyKRc9anUe+c5NrSMm3Kjl6Ehue1NU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 9/9] xen/arm32: vfp: Add missing U for shifted constant
Thread-Topic: [PATCH 9/9] xen/arm32: vfp: Add missing U for shifted constant
Thread-Index: AQHZp6aOcmGkZ2VYKUmiFKMJReLdUq+co60w
Date: Mon, 26 Jun 2023 06:43:40 +0000
Message-ID:
 <AS8PR08MB7991082A6DA7A62AA38F36B49226A@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-10-julien@xen.org>
In-Reply-To: <20230625204907.57291-10-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 5112000859ADEB4CA84E0D603B3B451A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|VI1PR08MB10076:EE_|DBAEUR03FT059:EE_|PAWPR08MB10168:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f2d2056-b3b4-4394-fa11-08db7610b698
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 z7KexkqJJiU236GlP70/EKYEqn1GebXEcyrriq7ZKfFBTGSLiQ6P5XYdEm/dseuz3C9T0CLEu70BXTyA222736oxs4Frrin1v9KNXshynjSNvqhDJohpndeS7h13cpRFMAIQ7bZUNWV4caqREpl5qt2FJix4nSSMLruR7PyhKcy9gMlwVwIW7WaI2KSuXAJbKz1eYMm5CppH2diIw4XD1GJXGfc4HziFEcCOMkTG6IezgnDQa0ozEryT94I1TDgk+Orb5s5Vbjej3YyC0XTUatifaJtyFpKu9Ytv5Jx4Yqkp8HwpzzogOBFScw31t1U8bqQ1RQoBu6rFd/BpMO4fCY+Dw5O3PmnfeWANGnTQwCO9pk27nnxuPDFGwNogJZXx0Dg9v60f93nPQsyZB6Iznt83l/9WgKKo/0zN+qDG1dkcC2Rpzie03uSMnnH3E+QZnS0XHEXQyFOwNc1L3NqWvbA6X67yWfR6KxuhnB5IbAhQb8Oh8SxwOl5AMCpvvEKZg00zGa7x0LFsAB+o2x7I4lWWeeiV/JUWZusL+fKuLLnEuEGJdCDYpRZXR5GuPz+84BEe63R14M81gKtDEnx873Wu2U1KTxrGX1xzb4CTpEDQdcF5B0IQffjdpRJxoV5I
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(376002)(39850400004)(366004)(451199021)(5660300002)(52536014)(4326008)(76116006)(66946007)(66556008)(66446008)(33656002)(64756008)(66476007)(478600001)(316002)(8676002)(8936002)(2906002)(4744005)(55016003)(110136005)(54906003)(38070700005)(86362001)(41300700001)(7696005)(9686003)(6506007)(26005)(186003)(38100700002)(122000001)(71200400001)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10076
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3905d48-6b7b-4846-361f-08db7610ad48
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lnuv6B7vtB8S2qafM2c62R1Bwafd8VeJFXigTZ042x3f/NgLF07YHw37zLtK4mFeQUpfMoToAyftp/u4iHG6d3sxI6Pma2Bwzdo8QzJW5xG6y99Kko3JLhvbJISudYqsbJhEYpCXzDrNBSDLvaiUnkU6hw+R56U9bVXyUzPwJn4r+8t0irldlbSTNwLEMhFm9JKx1ssPV4yJCegxlvFHxDER6MJz4S0Gx38Xt3l5H4atM6bsr3aLOcHNye22d4UTK84zzXAGU09XmFaMLPr61z9jV/JcdsZeuJZTqzpnM9ZfKrO0C6NaCL1uXFEQo/BCSTztdLDr8mFOJQS5Bqof2egL6poWPskLBSEf8CeTksZuEnGhC4N5CDgn2DvXNnjrK4XdbX111VjAA5isjuhKZqpemR9qmzPLEzWBFttAiOlYKE92TyTa2LoK7lUli+5CPSdpN+2+gUTGxn2dCmIqDbxMCK2nedxkV2Pbt/lwZsLxl84djDS7GXiP8N9omsxHbANZv0ZAqmcmptCfW5mxXafmyf8/ER1qU49lw6He3PLeZqK1PWYIIXTdLtn0HcApAIkbbLKvd3QsGG6ks+CS+TqT3A6r8POsVaiciKtVTGiyrknmaXYAWolB9JAFEAXalQKDe4uXUdZzFCB6xUjkyrwPOGXVNlquFPRuwsI9b/BI9e/EqvOmrFT16kCfoR6KM+hIOWLPscaMS/dwjn2mShbxA+P+FVTiq71Qv/5ExstkznDW+9Rj9kJe1ld+HYA/
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(36840700001)(40470700004)(46966006)(5660300002)(82310400005)(41300700001)(7696005)(70206006)(70586007)(4326008)(316002)(110136005)(86362001)(40460700003)(54906003)(83380400001)(186003)(47076005)(336012)(26005)(81166007)(478600001)(9686003)(107886003)(356005)(4744005)(82740400003)(55016003)(33656002)(52536014)(2906002)(8936002)(8676002)(36860700001)(6506007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 06:43:55.8090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f2d2056-b3b4-4394-fa11-08db7610b698
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10168

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 9/9] xen/arm32: vfp: Add missing U for shifted constant
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> When enabling UBSAN on arm32, the following splat will be printed:
>=20
> (XEN)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> (XEN) UBSAN: Undefined behaviour in arch/arm/arm32/vfp.c:75:22
> (XEN) left shift of 255 by 24 places cannot be represented in type 'int'
>=20
> This is referring to the shift in FPSID_IMPLEMENTER_MASK. While we could
> only add the U to the value shift there, it would be better to be
> consistent and also add it for every value shifted.
>=20
> This should also addressing MISRA Rule 7.2:
>=20
>     A "u" or "U" suffix shall be applied to all integer constants that
>     are represented in an unsigned type
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

