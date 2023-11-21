Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3553F7F234A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 02:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637488.993306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5FsT-0008VD-KI; Tue, 21 Nov 2023 01:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637488.993306; Tue, 21 Nov 2023 01:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5FsT-0008TE-HZ; Tue, 21 Nov 2023 01:48:37 +0000
Received: by outflank-mailman (input) for mailman id 637488;
 Tue, 21 Nov 2023 01:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JpOm=HC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r5FsR-0008SY-BL
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 01:48:35 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20623.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14a7c965-8810-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 02:48:34 +0100 (CET)
Received: from DUZPR01CA0130.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::25) by AS2PR08MB10350.eurprd08.prod.outlook.com
 (2603:10a6:20b:57a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 01:48:31 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::7d) by DUZPR01CA0130.outlook.office365.com
 (2603:10a6:10:4bc::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Tue, 21 Nov 2023 01:48:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 01:48:30 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Tue, 21 Nov 2023 01:48:30 +0000
Received: from b6f63852ef03.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CEDE5A61-068F-4310-B7E8-1F115C53AE9B.1; 
 Tue, 21 Nov 2023 01:48:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6f63852ef03.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 21 Nov 2023 01:48:23 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU5PR08MB10551.eurprd08.prod.outlook.com (2603:10a6:10:525::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 01:48:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7002.027; Tue, 21 Nov 2023
 01:48:22 +0000
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
X-Inumbo-ID: 14a7c965-8810-11ee-98e0-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eOMgsYZR8cBw8JBooz922l0e1ZFS2d4GpR20hXcZjybnmnB+bHPJdygNYSp7KvU5NQtWLbuMyALHxaHscQzbTRVyoKGQdObQw99j+8JKyLFSwYJJCgCSknUVHmE+aaW0yeklodPHU16YnaR5XFduggpjrSZ4bzo466SVklt4Y5Th06x1kXeoECbycgLldSo31DdMkjQVqDO8LJr7337HOeYIb0gNcMkEGvlWdxE7cdX5ZaGIlb1LQXaD3+KSMRqN8DlpdJwJv/BCrGJaqPNDxe4Ab6fpgXYHWvph8pGMNxvb2gqu5akSAweg1rn8ezFr2RW1tJsRFZw4UdOhAlWKEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VefzFxbKnmIG0LKKDI/jJyL+PevigPQAQzRNMOEJ5hw=;
 b=GyANyWMJ5iO2RLqk8pkDO/K9NaN94YFwANpI2xFxK5Gs5Y58SeAzUQl0Q/oFCD+5/rfrv+42H5w2Dgl9sNyL4uSm/Uw2KgwoNIlcvauSvSxVLQrbix6fdb1YhDY7GfTYZSY16PN8DI26OTbHmVfrJRhp3J5hoIYLbkMlf0FBv3/AkLKibgo2XPAk4pAocJRUrDEfB+321F1a8GXhPEqZGyaiCheskdwOPxRzPhS8aXw4ZUrWKLNTX2jpbcUQEslCV3m7P+CPRPjJ/3UvsaNY4TWRpoluI/XiDXPbcu3l3lHmzJ4PseFHv4KMPbKens9tmGqG136Zxs7i2ONQSGKoAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VefzFxbKnmIG0LKKDI/jJyL+PevigPQAQzRNMOEJ5hw=;
 b=fw1V0TXKJ2Fah9mOCIlUlxMa+sAhFlDY8CQWUSudFS5dcvpAuKQT/g9llunnx+rbarTkyW3svaJTZUIpZ8AHjAq0Th/GGSOu13mS3lmaTfr4450mFGtQckCLXPQPAOYnR1Wz4C94poFTROTePmYBbon2OAdDpsD1bMBaVtevc+8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 702d44e4ddb273cd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXroTrDPfw5bWCWqKC06Vg1MfERS8JUnD0yJmDCWpcwq/hsjtVEmHrh1BTdhW54JqrIl55SF7Dpl57HO+31iw4O8eLWim3bdmt0zRWyYAJ5/KfW65NIWMjRjGk+vCNLTHr09y+lcwoakMEK9tRLNvBdB+BICa0Bu3HYGyuJhoFEOKDlsVEb3AYyPPKvlgurLAc8wlgJlX5zUEpqnR3m0UxwQnzlUwgoT/w2+oUTvTViQzTBmE9S4wrBsiDq23d6iq9UxP5Jlafxo4S62I5e20UmWCPXEVIvINnxmMhCC88dOXlDo+cmdJ2XAnQH7aqll/BoD73weCWq+Dmk8lTQ70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VefzFxbKnmIG0LKKDI/jJyL+PevigPQAQzRNMOEJ5hw=;
 b=Prmfwc8vNFA+ZVtTGMV5AULnNw82Xa4zUdN1D/97B1SZDjFh+5UquXW1s8TPMcxsFpFjaxiz2mdcMR3o356ZuxEgMiuG9O/0zs2dNP/1nwOBb6qGph7nA6L4kS0l56RUHVjeWpPzzKFyLy6d2VGlE10V0WDjpJZmvG3UF5MNECLLPNnhzXD9LrjcpdeFKrxyHVfHqc/lsQDRR5af50phQXXMu0Ig01ReCzJTXKrrsgY1eiwonuOuhNosRNKd199xxKcGsVrcgG1JrAIxrV2PgcBwKj47Ao2coXrL5txlRf2MhVixMSKAelxT0EtEVxcGkpThcy2xFDMg4frbA5qYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VefzFxbKnmIG0LKKDI/jJyL+PevigPQAQzRNMOEJ5hw=;
 b=fw1V0TXKJ2Fah9mOCIlUlxMa+sAhFlDY8CQWUSudFS5dcvpAuKQT/g9llunnx+rbarTkyW3svaJTZUIpZ8AHjAq0Th/GGSOu13mS3lmaTfr4450mFGtQckCLXPQPAOYnR1Wz4C94poFTROTePmYBbon2OAdDpsD1bMBaVtevc+8=
From: Henry Wang <Henry.Wang@arm.com>
To: Oleksii <oleksii.kurochko@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Kelly Choi
	<kelly.choi@cloud.com>, "marc.ungeschikts@vates.tech"
	<marc.ungeschikts@vates.tech>, "olivier.lambert@vates.fr"
	<olivier.lambert@vates.fr>, "marc.ungeschikts@vates.fr"
	<marc.ungeschikts@vates.fr>
Subject: Re: Interest in Release Manager Role
Thread-Topic: Interest in Release Manager Role
Thread-Index: AQHaG7q/4Smwh/BADkqpFBh5xoW8dbCEAhuA
Date: Tue, 21 Nov 2023 01:48:22 +0000
Message-ID: <ED06FBCD-A346-4B73-A88A-E52F8080AF1F@arm.com>
References: <0cb1254f433536a9995c278c919372e226059934.camel@gmail.com>
In-Reply-To: <0cb1254f433536a9995c278c919372e226059934.camel@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU5PR08MB10551:EE_|DB5PEPF00014B89:EE_|AS2PR08MB10350:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e899a5-719c-4944-5e35-08dbea33f6b8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sgH9esQ68lO8Sc/A7+B8uLemu7ORygBYa0u6puUtOhnlJxHsUTqw6u+OWCNAKG0eI/w4r/0IZoNCD/iaiktpO1kdDE6/OObkQ+cmCieSwoAZ0CMspbJzL4CEpMvslqtQoGeRFk854S+mbKPTu/VzgdyJrjc+pGDYwkQmTFTByy37hLZDNrVUk6cG33y0q3ivUXilgVCnHQ1jFA/Xz0MjB9sjwX255cIliH1GeW9qN8FiQ91gpO2EfLEiQfrdHARsEa/xnBmXnjJiq2nX7na0EcjD+L5CP5k38mAog+rM9AWmeoEhNzhws3TQHJTekqlvqjuyDrW6vloxB36dQW1I2qNmcIYN+PP8erZTlKeZoRmOKNfhuRdjm2UAAF8x311+FUDaPccmVYJOVb3topT4av4JZe5UNHT4d8KplwEKOlpuPaNmFehDFsb+g7m+uIewI3xRDdhnJhUZ9gnVYLKrdS9SbW+8D7Ar/w76g6cetWiDQaGq+vXXIok19BQLoVV3Xgcc3zG+Jj/0YklOzykCkm/EMPjJutDKOisXvUjaA0Jx+1ktqJ55gHcqwSjXKcCbg9W3uvNfXyfzi2hnbEBT5mzMDHweuX0dMzDrrJpL3e+4nEDfhDpIB1Y4ATV3qsFF9BExiEgCv7BmWMPb8YQv/A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(5660300002)(86362001)(2906002)(4744005)(316002)(6916009)(54906003)(76116006)(64756008)(66946007)(66556008)(66476007)(66446008)(91956017)(8676002)(4326008)(8936002)(36756003)(38070700009)(33656002)(41300700001)(71200400001)(26005)(2616005)(83380400001)(53546011)(6506007)(122000001)(6512007)(6486002)(38100700002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0ABA5D3DBE3CA14BA539530B280E2BBF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10551
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	225f5a65-e544-43a8-bca9-08dbea33f1af
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tpn+AnEGOuGDgargVPT3gPV47GSlG4diCdQlFTn4yPSjwhKlSLZEaPcXaV4FGS8iNE0gpkcmywU3dWqLBN314ITMw79+7s5oqP780VkNb+swQbN2ryL8ifg0XEr/qbmUBTUxZ0Fy876vkbYTz3GOUfOCEYkWoY4F8Uno8CoUFR3L6s21NplDbhB7CgjRSPuWImQaA+83dJ116UnertwPxbW719JF8DLbyEIE7kBEZvGiTjDhrr1Ow7OicV0+UzjnsFp1P+fUzf/Xz9jCfYa5d8VX+zUDMMGva5qw7HYVqG4Pbi1EX7YWpU+2me9k4TaDMygqLypVdWTViRegRaY5KFY/g4AGUhxbcu9Lct+iSPtA9JstIzUnPt8lOeW0Jhfl082vUUVb6fTPXRZOhL7lh62FkrrevD4QdFn63a9grrssumHNAzX6LAI4e6Ia2FZlHFygTGY3vAJdmJ/JoXCeQtfpRXWDNBkGTgmRymwJdoKJDMzyxaMBLoXR6oxreMCqiMjYb2CC0alFoq3vbioLFsQgtRb0fPZuOIn9cfREhNUmZ2qGvRaTbo7QrmpKfeCeYJrlvbA9j+mwgGTFov+b/lZQ/R2Ntvcqj+rsCwclU+RleXf3hife3DjVkkGnkqJMp036VaNegWYpmB8VwcNbbfKhlPneTBh1Jam5cGJkLIu46ytwEjJPeoWfPvKq8MFBOGxABFMyTP0TA8Iw2DtEu/QrNqreWPDjaOoANKfuRgqlwarffoac6So8yzBEKFz8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(346002)(136003)(230922051799003)(186009)(1800799012)(82310400011)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(2616005)(107886003)(336012)(82740400003)(26005)(6512007)(83380400001)(53546011)(6506007)(356005)(81166007)(70586007)(70206006)(40480700001)(6486002)(478600001)(47076005)(36860700001)(54906003)(316002)(86362001)(5660300002)(4744005)(40460700003)(2906002)(4326008)(8936002)(8676002)(6862004)(33656002)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 01:48:30.6566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e899a5-719c-4944-5e35-08dbea33f6b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10350

Hi Oleksii,

> On Nov 20, 2023, at 22:06, Oleksii <oleksii.kurochko@gmail.com> wrote:
>=20
> Dear Xen Community,
>=20
> I am keen on stepping into the role of a Release Manager for our next
> release.

Thanks for the email! This sounds good to me and as Kelly says, please
mention this in December community call and we can formalise this.

> Despite not having direct experience yet, I am eager to learn,
> adapt, and grow into this role with your guidance and support.

I will help on that, no worries.

Kind regards,
Henry

>=20
> Have a nice week.
>=20
> Best regards,
> Oleksii


