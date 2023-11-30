Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 581A07FEFE0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 14:18:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644689.1006073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8gvh-00013f-KC; Thu, 30 Nov 2023 13:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644689.1006073; Thu, 30 Nov 2023 13:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8gvh-00011C-G2; Thu, 30 Nov 2023 13:18:09 +0000
Received: by outflank-mailman (input) for mailman id 644689;
 Thu, 30 Nov 2023 13:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ATR2=HL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r8gvf-000116-K7
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 13:18:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e51b4add-8f82-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 14:18:05 +0100 (CET)
Received: from AS9PR01CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:540::29) by AS8PR08MB6389.eurprd08.prod.outlook.com
 (2603:10a6:20b:33e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 13:17:59 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:20b:540:cafe::10) by AS9PR01CA0024.outlook.office365.com
 (2603:10a6:20b:540::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24 via Frontend
 Transport; Thu, 30 Nov 2023 13:17:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.1 via Frontend Transport; Thu, 30 Nov 2023 13:17:59 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Thu, 30 Nov 2023 13:17:59 +0000
Received: from a7c3931eab3f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 064CBFA7-AECC-46E8-8921-1268237E35F1.1; 
 Thu, 30 Nov 2023 13:17:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a7c3931eab3f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Nov 2023 13:17:48 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PR3PR08MB5563.eurprd08.prod.outlook.com (2603:10a6:102:89::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 13:17:46 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 13:17:46 +0000
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
X-Inumbo-ID: e51b4add-8f82-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=keSW1HYwdbmTjxwB2PfaavIMO8M5l+rcx03qJsNxm9UgutD2d0yw53fHOIiykvTUkXqfEqaQlUtM00eVQdmnFKrvy0IxYXAyj+1S9RGI3LM1EdH/ousWxdQDuBqoLKzlgb+7wrsJHE6zUwVbTwFytLxhJOaJxqB2kWQeh7Pk67JnOQa4Uy3DaPtNGuaEv6M7OsC3M3n7LCd/WOULWBVPAJ1nr8cK59p9YTH926yw+eWPY1wrltPm5JQKRxXW5L/36rFUY/JqZ5Uqpr8+Eh11DPz3aTpSIwCV81fyvvBZJ6CuGAMKeUhNuensrH0xziF/eW/KcMk4EYG8Na1n4iZH1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhmCmeazCrVjVTIlI8sjbwjNGKrZZLrBpFK10H5oIZc=;
 b=boTG4wV27cRipYLuqpo9J8cPxllnJYrfoqLLR6jM4JOP2OmPEn3HEYSBr3H9GLmNpQGFvOm5EnzLd3iaL48F9FpNALyWfZAPn/UkjoFxaTK+sujieTULoKfUKhKS5d8ygrT4GYGB+PPy327q+VMH2ZNynpwu6Tc+PHv1MuNlyF4EfXKs2ABocRIVHDveiztob35IHdFlcajKVhqQNVC+U1ljKYo3hJwF412fdqXMCoy5odMB5YPTAAxprDtRxY6T7xcibnlRQVaT36kKNMbrbHyrup0R1kSPDENF8jzhl4XA6WiT3kYrI9Mcu8EYZeZcJulQ9R5QvnkmbV2jvoRZbw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhmCmeazCrVjVTIlI8sjbwjNGKrZZLrBpFK10H5oIZc=;
 b=jFSwWpDiOqHTvDl2nW1yfkKNPjCBgkAWCLg7GiXZnmBp0HGwxHnpzkh11SNVq9DPIRbsPuJbP3KsB1AwS++ThsZQDlU/keRWPbMBKOxYVJ4OHo6xDDsWKLGkwP7Qq+FfOVJM0fFuKmeGoNGhRE0+cJngV3K+m013GLG+s8hfdIA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2550852a209e32f9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/0O+5gzmy2arHa7i/zWH4BKSACzdWtdkWEdaYhrVZ7OU6Cg7J7Sg8seTsRWbp+v0IUH2ZY1PKA8pVn7pQ8u8ptVEQ2x9kgsyfmudNoo+IIVaFM/j4Ktywp/DWFSqQLVVWRWsz9MWtRaNQ+/Kj2AKLSD+G15G1FogRvyF0wZEYbYk3h1Gz2D10GoY/SRLB7PGs1LR99NUTeUPPN1fDM6IDr3sa3AFcsUegvs49RKZR6Vc2jRfl3CahrYnoy52i58+HdyVwWtwNEH7DbrmnPukYy6dGFDsJVlsi9ZXpqVfL4iX2F6YjH/SKJ8X3TiJv0LITblL7K+0QkEKS2PnUzaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhmCmeazCrVjVTIlI8sjbwjNGKrZZLrBpFK10H5oIZc=;
 b=T1Dz7eo7c7zU6QKSGQ1x7iFjNUtSAJaXT5oTlDFiZzJnC6MLS23S9kbwAhmzb8wb+2hWaoKYqMgzUyAj0//UScHqhn26daUGVmg/eBZj2fApSw49VAza5tJAdt9Sa/pt6KAsoQr6dEYebXWHe2vpGwl7aLLXCj69m8qFlxAZaIlNl5vMkgEWqjywFK58WS79ZjqsewjdF7wxy1D3C+ZSKEI6RQAdTCeKaa3RRL2RiPPwv+6buQToQPuU6u8ypv5kXQZbYvYn311sIa76/ZJztt54g/5zQLiEjwF2TRge1HZAy6A7XmNqnXZ9/DBG1C7akwDKAth5v59dEqKeSEqNZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhmCmeazCrVjVTIlI8sjbwjNGKrZZLrBpFK10H5oIZc=;
 b=jFSwWpDiOqHTvDl2nW1yfkKNPjCBgkAWCLg7GiXZnmBp0HGwxHnpzkh11SNVq9DPIRbsPuJbP3KsB1AwS++ThsZQDlU/keRWPbMBKOxYVJ4OHo6xDDsWKLGkwP7Qq+FfOVJM0fFuKmeGoNGhRE0+cJngV3K+m013GLG+s8hfdIA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm: Move static event channel feature to a
 separate module
Thread-Topic: [PATCH v2] xen/arm: Move static event channel feature to a
 separate module
Thread-Index: AQHaI3PLyHz5Q1Ih30+bcD6BASdasLCS2EKA
Date: Thu, 30 Nov 2023 13:17:46 +0000
Message-ID: <915388E2-F755-4F62-B796-63A174DFF3C1@arm.com>
References: <20231130095757.11162-1-michal.orzel@amd.com>
In-Reply-To: <20231130095757.11162-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PR3PR08MB5563:EE_|AM4PEPF00025F98:EE_|AS8PR08MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 01fc7e9f-8c9f-4a1a-03a5-08dbf1a6c646
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DqshuKJ9pgGpbDlMXsfgRumlnIoBsZ5mNO4hqmfZYYSLmXAloVqG3KNjtAnZQMmoYr29m+HixKVhLd574bvO6wjEcH0z69BtGVZGRcX3aJoEqu5wvg1JdNdjP5KRHSwNLHNrJwNHGJUm99peCyllaSU2vnkCgv9cTM8U9evp6s21N1gjljwCa/gtHEX4jlw/gnj/gAJISSQ5Yg0bwG3oMX+T0y/QIp3qJYyMK++nscOHJZmiezL9A+nbFDSzIdeI4rZYN702Ticz6m0SNs+FV/twjV6itoBMN3lG64WIDZbPlu8sHwKOMqjpHKgDeeAkVwmmmSWsOVz5xiyk7uRP4yvZ8up/B650VjoJwGy1tufrG2O997LmY1OQmNSecyh5xPWgNZbedFNIijauROY56kdQILYBNdgScKyQ9uairegre6ZWPcUcPle2fU5rEg/dOhMwUZJQWuY9fsriz0AuzQ5KMSObMpj/8UiSBH+DyAxe0VFr4VJI8heOkUWExCa6vBE3QK2M/Z7+ujyrz7gYCgwjSa+CilRazonE72jwym9sv+KRJWsX4QfnoGbJR9VeGUue6yRo29tofSbuhjUgCkdXqviUTdBwYmgGwpH1xW06msh+/N66g0GENL293C5kijJxJb9DCxNwRFenPwD7SaKOW+Fc07dZ5af2UfRzaHsXmGGZ2DIWeCwjGfVz7AIa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(396003)(366004)(346002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(1800799012)(186009)(451199024)(53546011)(478600001)(2616005)(6512007)(26005)(6486002)(71200400001)(6506007)(2906002)(54906003)(83380400001)(41300700001)(4744005)(5660300002)(66556008)(66476007)(66446008)(76116006)(66946007)(64756008)(6916009)(91956017)(8936002)(316002)(8676002)(4326008)(38100700002)(122000001)(38070700009)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8A5E2AA972DD9849A2126F78D5A7A7C0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5563
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2797c19e-94e0-458b-f168-08dbf1a6be41
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7UuyUuJACvqaVoyVqWUPfAfI2qArG+Icnrtr4NXX+BKHISMM4SW1yei6C0w6cAd43kbssMoifA8D7jOb23Lcyiwd1/5ZTPAkP9075zZiO4ZEpGJ/qa4cpjgW4oEXMBM8vyWSEgdpxBQ09MYc6lJLB0fPYRiCxzk1tm8uaKj8eZi3Ii/xJ9w9Wy6jc/xJWkxJJUwHc4ZqDjC6l6x1OfKQ7vHohZGqmc7Zi/VYWsaRyXYLT/tfXXgf282qp/D5RdKAvjRsTSZEa8ko65mSpSXz/hbY57FLEnlXYBFHHnHrvvL4wDtrcV2WH+Py3TkrH8V7A9kVmmcbtmKPUyi2DKxdz4UgW6bszeDOqvdWOi7qOSBSRHKC7JLLAgrFgyQ0fah6ZVVVkddZtU7yN/3TidykKLk6/cPS29IlOc1sP2G173QF12Zz4pex2FdnaoUJu16/1BK0BuoEOC94AEEPuilMJie8saoJpOh4qcxPrRI6ljH5ONW+pVlFFzIlRX3o1vZDh2DDJLZaqXcFAKqXCVixn2qDU6wVfFYyCcDnMa2GOM2RJ5xSf3f3hnb5wSHTtHuY3/diCqDPgQMjh+ajgzLWdYFq70UoAyPP+lIibNZIKxsnce055Od5F/gNsw1O84ugtS9cf/0DzKEb6dO31GaWx4QOehVJ/Ey5aQ6szDS4NYLDGga8+5wJozDY7ocshK9roXwa4+fLO1MzQ7m1hRXkQ19XGn70Sl9g9himmNBQNSLjQCnw2CL0La3omf0Dh+q3ZLAY0dk1YzWVLZWE8TQSaKTDunHPScWIRq184ABGyyI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(376002)(396003)(39860400002)(230273577357003)(230922051799003)(230173577357003)(451199024)(64100799003)(1800799012)(186009)(82310400011)(36840700001)(40470700004)(46966006)(8676002)(8936002)(6862004)(4326008)(36756003)(316002)(70206006)(70586007)(54906003)(2906002)(41300700001)(33656002)(40460700003)(86362001)(5660300002)(81166007)(47076005)(356005)(26005)(107886003)(40480700001)(83380400001)(82740400003)(336012)(36860700001)(478600001)(6486002)(6512007)(2616005)(6506007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 13:17:59.5930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01fc7e9f-8c9f-4a1a-03a5-08dbf1a6c646
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6389



> On 30 Nov 2023, at 09:57, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Move static event channel feature related code to a separate module
> (static-evtchn.{c,h}) in the spirit of fine granular configuration, so
> that the feature can be disabled if not needed.
>=20
> Introduce Kconfig option CONFIG_STATIC_EVTCHN, enabled by default (to
> keep the current behavior) dependent on CONFIG_DOM0LESS. While it could
> be possible to create a loopback connection for dom0 only, this use case
> does not really need this feature and all the docs and commit messages
> refer explicitly to the use in dom0less system.
>=20
> The only function visible externally is alloc_static_evtchn(), so move
> the prototype to static-evtchn.h and provide a stub in case a feature
> is disabled. Guard static_evtchn_created in struct dt_device_node as
> well as its helpers.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Hi Michal,

FWIW because it is already Ack-ed.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




