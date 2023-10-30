Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E803D7DBCCA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625214.974272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUK8-0003zm-VY; Mon, 30 Oct 2023 15:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625214.974272; Mon, 30 Oct 2023 15:37:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUK8-0003xz-Sl; Mon, 30 Oct 2023 15:37:04 +0000
Received: by outflank-mailman (input) for mailman id 625214;
 Mon, 30 Oct 2023 15:37:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIyV=GM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qxUK7-0003xr-G5
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:37:03 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ad76397-773a-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 16:37:00 +0100 (CET)
Received: from AM6PR10CA0099.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::40)
 by DU0PR08MB9300.eurprd08.prod.outlook.com (2603:10a6:10:41f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26; Mon, 30 Oct
 2023 15:36:57 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:209:8c:cafe::c0) by AM6PR10CA0099.outlook.office365.com
 (2603:10a6:209:8c::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Mon, 30 Oct 2023 15:36:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 15:36:56 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Mon, 30 Oct 2023 15:36:55 +0000
Received: from efd34c24d4d0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02BCC3FD-E6EE-4A5B-8B8D-BD5ED2689553.1; 
 Mon, 30 Oct 2023 15:36:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id efd34c24d4d0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 Oct 2023 15:36:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6610.eurprd08.prod.outlook.com (2603:10a6:20b:36a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Mon, 30 Oct
 2023 15:36:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::ce62:ebc6:8559:67e9]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::ce62:ebc6:8559:67e9%4]) with mapi id 15.20.6933.019; Mon, 30 Oct 2023
 15:36:46 +0000
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
X-Inumbo-ID: 2ad76397-773a-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NDDqJ2XqjafexZUO7PuQ4PRKWceemdqO3Wd2VSrtZ4DVHIOkGrweoc11c7KuCNBYeiuTIp4A9h87/LBU/SbaaAxZz20tCT3WWe6aI7ja4PT739XKdMb6JE8I/e2sTTegsZZXlOsalsOIfv5rJD+yAm5ks+R1iCXoGDM23oGP0BhM4nauFaaazhKpuyjs6VQJ+UrdfSVMk+5FIInmDGRffqmWymuC4Kt40mAh/8WN+OhG38ePSx6BdqUCMgtnrvoSlUYokJNXTBpXQ10Wg5hbhkcQaGP7SV/iCSOrsii4VCmg3ROnUE+FspTmkylh2e2Q/Lu/AmFIk3VSNFeu8XhmsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwr/EL4ijqwFB8uewRyhrarUhK0sfr5Bn6uvcIuLe7Q=;
 b=evdGVxYfCCU6TNpWpycKAgSrXBcU0J72MFezhGl0Hg5YxvZbnMQIlrTWUUTlBm7L7PTGWaIyRnQ0+Iw7QpI3KDCSt262KZT4Fe9dndyDMW9yEuOeQdtePSvdsCy/4Nf8tWzZ+J6YwuwJfL/rXPjQoYAqy1dmtPJ2Gd/zK5LF65ePNaebUbW/7bLLTkXXRGouwm+PlXpzJ1cMZWg3bgidxOtIG/GVRBvNRuyuzWNq7PAZoNAiy4Cch5WX/16MSgVDI2oksU1eVx2dl0rftE5qUrL8ODfMDMLUH8/Zzk9aEmdiCuKaS29LR1ZzKWV5z5mPdRa+OyQHPss9GVHGgUo1AA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwr/EL4ijqwFB8uewRyhrarUhK0sfr5Bn6uvcIuLe7Q=;
 b=3bgCSeQrX8Hel0K+9/6Nb5Z4bS3122NRIYMbuNcsfnHwTVZP8B4oTyhIHf7KvNtqillR4xWZHuKD8/QWRF7gIMbjCohxbpV6/uKHPnvp8d0VT/n/WLhT0RlgRrSgLVOeyPuPtD9cVepM3p0HRGeVnF3TDj/EllH5+jUpkc5KJ0g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5e65401750c4872
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKX+XPa4U/1gcGrY5ydRBidQC7XCyzdydiLA+Jhi7jEK2F9SG823R8iChdLZghu6+pm6nikv2y1LIWb0VeHp4oTzEXZxhCzx0jfiYqMEY59D3cNq0GDg1VyO6Um8n5be+Dy+iCaCic/9Vpv0ijfK/fM57770ibZuDUgRUDA6dC7IhMt3p67KR8qmiGh+3sSNZXbb3CIrfo37QmFcOgaDRGkwexX5hrnaSqnm7fnGIzfHxUUhnVJSyEi05CsNbXFhjfUJMHbybO4CCMpD35D3JDWI8BNUs3GfuDR+wIrhaxj29VZi0GlOdzDVajzB4+8wXr+F0LrbSHu+i+JIomwyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwr/EL4ijqwFB8uewRyhrarUhK0sfr5Bn6uvcIuLe7Q=;
 b=J3Umu5BSQIjTL+6O5efepmZE7yAbcdMNxFfaLZwLcM/g0sGEO2lQspFaSpSoy6xlTqXS4esEpX4sbfvSBWMwWWxQuFEq4iZWBE4ye52ObvM/buAPb0osn/wR0RhqykBQIfO58u2D9WcQ+Ef2c0IBGu1q2eTI61WxxX6+oyHTZ0Oe3kgvg19igoB9H+4txu5Bl7yLWlNqIoyH5CLZwVzm5vIzj7MiSW5K1JupQ6o7pKqFPLpWqxEw7byDoXV3oIawoI16MOxXi69hZhzZL/BSyCwYoGZqdI4n1/oXU4L7e3BLzvfOP13rGFdklUeT1rrGXqFUWlEpkhUwgrMcMrNVQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwr/EL4ijqwFB8uewRyhrarUhK0sfr5Bn6uvcIuLe7Q=;
 b=3bgCSeQrX8Hel0K+9/6Nb5Z4bS3122NRIYMbuNcsfnHwTVZP8B4oTyhIHf7KvNtqillR4xWZHuKD8/QWRF7gIMbjCohxbpV6/uKHPnvp8d0VT/n/WLhT0RlgRrSgLVOeyPuPtD9cVepM3p0HRGeVnF3TDj/EllH5+jUpkc5KJ0g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] xenoprof: move asm/ include
Thread-Topic: [PATCH] xenoprof: move asm/ include
Thread-Index: AQHaCzO1xyz/ZGFYC0K8JSTClKiKnrBid1QA
Date: Mon, 30 Oct 2023 15:36:46 +0000
Message-ID: <4105ED46-8287-4EA0-BE96-66AC52BB609E@arm.com>
References: <4fda4793-6fdc-70e6-575d-062f72c8c0dc@suse.com>
In-Reply-To: <4fda4793-6fdc-70e6-575d-062f72c8c0dc@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB6610:EE_|AMS1EPF0000004D:EE_|DU0PR08MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: dc06e05a-5833-49eb-dc77-08dbd95e0c8c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vLbUMX6+NoLvbLCwLy+X8mvlQIZb/SkGVs3rjM0+uaF9cO6QNI0bmQuH0qpV114z3D7+y6gqdbhm8QEkmOOdg44CnbSFRokL+CaaWPSYD5POoq+m3MczaX49W1CE0k4jJREAntiDwSRyzaTmX7wcocMR29Eq47yFqrKkLOzXksi5fCk6DZ+xOjMGc6TM8I/5DsnjCXubqsAMk+HYUrB2jFcZvBxb53HVyXV+VkDgy58SNYpGStPoIDm8z85ygD1GmzRo6aK3M5uDkZH47s+eHzaVfDXHXWJII5I0ecs5PdwOG8KBqj4R7VA9/K0YXJEY+9TAhdY7OhmHNT43Q+uJaxbmar2k7oDiqqbpOGHnbU2PefnXuVMQ3NvvNOPogOOKtNX7G2fgudysy0IS+Y2BKfK685wHoTdxhsjPhbAjsFgFcRmgMGreMfqdwUXSTG+iP6sAK3bM0zsWDfRWkYvnqeP0WGXiJHqtnEobrO5AiyMNzYxHMzRd/4NeVo+AtLOMjDhbjm4WFbA94nRQVnA1xyAp616FrKqdyBX7pndUBzIy9DUs5yQ0Z8J5OiLEkwDF4RVoOkbax6j/I8tRR3Jqn6Sanu/6YMc19Z5gQKXhNvDu/ikg4GUzkgEJREZkywb/U74J3OSgL+S6mRfmrS9TTg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(136003)(366004)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(2616005)(91956017)(71200400001)(478600001)(6506007)(53546011)(6512007)(122000001)(64756008)(66476007)(66446008)(66946007)(36756003)(86362001)(33656002)(6486002)(76116006)(54906003)(66556008)(83380400001)(8936002)(38100700002)(41300700001)(8676002)(4326008)(38070700009)(7416002)(5660300002)(6916009)(2906002)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <220A884601EC60439A16D952B181573F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6610
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e2e4723-bc7f-4380-4de1-08dbd95e06d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+6s/J28EPzrbab824uq0PAJ0ZkAeZVnY458ONWHM+/9xcHCdZT8DWVu3V6I5uMVysvJUlY07z5Db4nzB9RrUQfbs5UAXc0ixyPNBmvc9zQK/X/NRZo7ymOevE/C4TB1drQCqO/yyYvbO/uHvzdV2fXYdprXxUTXGZufFblQnNtBGOqLOfR3RkT+bVO6rIhgYsYzS7LszyTsdVPPnpVA3BTRU4D47oP1ojbAglVfa/2psxAD3LP/yOyXzd1KGGqYIZeoQBLqDkHEfJXleUtXY6DgXKKI9jPLU36BrrAICfHOWY4iagbgYhsmFqiDNjfvzpkkBasYBMoQZe3RIHvjCWFfadveKdHbXEVPDrjk61wmyMuTv0GTGerFwTTs1wUUIgjtOX9Qa5EF/ryPe0Uvou5LViH9G5hMoU193O+kAyu0gT6KH/wIQ53iNDY1z+dqCZWETLcPnE+BAfyzQzZ6YCyxW6ebBeMz5NNzkpj+ItnM3Yo3nGmSrJBnlvQ+03onvPqw/4r54g5i6vHdzphkBYbip+tqkOA2jMIG0AFWt3WEOGpblCRNfeCVXf0iYDhVfENHlSOzRZz9HjUQB1bmE6TFbeQs/0XFkiaFzjh2PierNbPdkuv+ZbCMc+frsTDS1X8ilzaMbg99vP6PcULZYrSt51YnMSHyAgrTqRXi4XffNJpM/lyH+fOUrUYaobjrfa1CvQrfekB4+QJgASlF4M8nAdSKzVNUPvDl/2W/sFN8WgsLb/0cAEd0AqTSkMyjd
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(82310400011)(451199024)(1800799009)(186009)(64100799003)(40470700004)(46966006)(36840700001)(41300700001)(107886003)(8936002)(6862004)(8676002)(4326008)(6512007)(6506007)(54906003)(316002)(36860700001)(70586007)(2906002)(2616005)(33656002)(70206006)(336012)(83380400001)(26005)(5660300002)(356005)(86362001)(81166007)(82740400003)(40480700001)(53546011)(478600001)(47076005)(6486002)(40460700003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:36:56.3143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc06e05a-5833-49eb-dc77-08dbd95e0c8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9300

Hi Jan,

> On 30 Oct 2023, at 14:19, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> There's no need for xen/xenoprof.h to include the arch header when the
> respective config option is off. The only compensation needed is for
> svm.c to explicitly include the arch header instead of the common one
> (matching what vmx.c and traps.c do).
>=20
> With that Arm's header can be deleted, and neither RISC-V nor PPC will
> need to introduce one.
>=20
> While there also adjust and move the (prior) inclusion of inttypes.h.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Always nice to remove a useless empty file :-)

For the arm part:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --- a/xen/arch/arm/include/asm/xenoprof.h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -#ifndef __ASM_XENOPROF_H__
> -#define __ASM_XENOPROF_H__
> -
> -#endif /* __ASM_XENOPROF_H__ */
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -12,7 +12,6 @@
> #include <xen/lib.h>
> #include <xen/sched.h>
> #include <xen/trace.h>
> -#include <xen/xenoprof.h>
>=20
> #include <asm/amd.h>
> #include <asm/apic.h>
> @@ -38,6 +37,7 @@
> #include <asm/processor.h>
> #include <asm/p2m.h>
> #include <asm/x86_emulate.h>
> +#include <asm/xenoprof.h>
>=20
> #include <public/sched.h>
>=20
> --- a/xen/include/xen/xenoprof.h
> +++ b/xen/include/xen/xenoprof.h
> @@ -10,15 +10,15 @@
> #ifndef __XEN_XENOPROF_H__
> #define __XEN_XENOPROF_H__
>=20
> -#include <xen/inttypes.h>
> -#include <asm/xenoprof.h>
> -
> #define PMU_OWNER_NONE          0
> #define PMU_OWNER_XENOPROF      1
> #define PMU_OWNER_HVM           2
>=20
> #ifdef CONFIG_XENOPROF
>=20
> +#include <xen/stdint.h>
> +#include <asm/xenoprof.h>
> +
> struct domain;
> struct vcpu;
> struct cpu_user_regs;


