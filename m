Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB291415CA1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:15:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193744.345128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMh4-0000oV-Sy; Thu, 23 Sep 2021 11:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193744.345128; Thu, 23 Sep 2021 11:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMh4-0000mh-PF; Thu, 23 Sep 2021 11:15:10 +0000
Received: by outflank-mailman (input) for mailman id 193744;
 Thu, 23 Sep 2021 11:15:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y7SS=ON=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mTMh4-0000mb-1p
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:15:10 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::61f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 245d3c0e-71fe-4172-b3be-10396d6c39bb;
 Thu, 23 Sep 2021 11:15:07 +0000 (UTC)
Received: from AM6PR08CA0010.eurprd08.prod.outlook.com (2603:10a6:20b:b2::22)
 by PR3PR08MB5851.eurprd08.prod.outlook.com (2603:10a6:102:85::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 11:15:05 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::9c) by AM6PR08CA0010.outlook.office365.com
 (2603:10a6:20b:b2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 11:15:05 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 11:15:04 +0000
Received: ("Tessian outbound 173d710607ad:v103");
 Thu, 23 Sep 2021 11:15:03 +0000
Received: from 29ef04d864ad.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10DE5F4C-10BC-4397-9545-CADF79FECDAE.1; 
 Thu, 23 Sep 2021 11:14:52 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 29ef04d864ad.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 11:14:52 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB7026.eurprd08.prod.outlook.com (2603:10a6:20b:34d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 11:14:50 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%7]) with mapi id 15.20.4544.014; Thu, 23 Sep 2021
 11:14:50 +0000
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
X-Inumbo-ID: 245d3c0e-71fe-4172-b3be-10396d6c39bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGOPPHVn3iO3ThBFgg3V+W+0iB/6oRHnxU04VoSJulc=;
 b=OJRUVtT4VTWZU0+lPadUAM+bzahVASGVkK2fO35+jj7bhKY+mElMsvEtETeUVaFEF8ik+DyyCrPc1P7FVf1mp3S8jwIFAsChW59nK0fRtVf+k1JEgHW2LejaPbfa+7QVU81pt+EaZnxcM0Qjub49FYTyTuuqIU6TjcqqXMj+Q+A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ad4955db1dd7cdd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wx6FyFJ2GzTZbL277U9TUdMqXHllcVWA4g/VsrQuyynFd3s0ZWycieWIL2Y5ivlkGP25mnDTls/Qk3xW0802Oe5U17gbgU07P5GKz2GpqhQfdq4tF6kd3i5dXhHHjR5pJSwU6fv3h//YvGXUx+HNeGtg61t56JQgygaASzhZgDTr+nii+C/hec5k10JRoDoLVGI+t4qcroFmiMkixwb6SLIYv+RoPRsvd5yz9sW9Tz9OJ66OYz/g8fq/PmMCB37/JdUk04MEywS762BSUEijCZJusFnKyWcEJAhdJ2nD99CKz25d0dt+kUc94c1fgVyeA6/vDfQe6B3ybbUvKHnRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=uGOPPHVn3iO3ThBFgg3V+W+0iB/6oRHnxU04VoSJulc=;
 b=Z0QZuQrdro6eqflNnZ9R1+lHeNgL4BPIop4idpQrlz97Dm30PIGLqEkx+ytD8nxRJg0xDegws55ah/sgSKt9Ne/d3d7SV8M75oy3udOOoj0dWixgSlftn9ZqK2eGknE0MH9C7Luidymv1dEkaoZH5oXBXzj5c21qPO+8qtajOf/fVd+GXn78g5YQpuzWNZO3x+0bzSO5KyxXgUTKVfqFxGgGd6a/fNaNg7Ez+2ay/NfluWlSYxiJqtYCMZgn1JCl4NtIh9M6a+DMjH2laAxNn/nKOosY65CDjHJy4Lj3cAvHpmbgK3SP/oaFdgVvSqVOhwI+HiyHdLZxLOjQM/gEIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGOPPHVn3iO3ThBFgg3V+W+0iB/6oRHnxU04VoSJulc=;
 b=OJRUVtT4VTWZU0+lPadUAM+bzahVASGVkK2fO35+jj7bhKY+mElMsvEtETeUVaFEF8ik+DyyCrPc1P7FVf1mp3S8jwIFAsChW59nK0fRtVf+k1JEgHW2LejaPbfa+7QVU81pt+EaZnxcM0Qjub49FYTyTuuqIU6TjcqqXMj+Q+A=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien.grall.oss@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 02/17] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
Thread-Topic: [PATCH v2 02/17] xen/pci: solve compilation error on ARM with
 HAS_PCI enabled
Thread-Index: AQHXr6YM7M3wnWXhpk+HlxEaE7sJMauw4CUAgACZAIA=
Date: Thu, 23 Sep 2021 11:14:50 +0000
Message-ID: <3E7CE8E4-367F-44BF-9FE6-3A99E7301610@arm.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <b6a9c007061f963332af63da544e5031e18a7850.1632307952.git.rahul.singh@arm.com>
 <CAJ=z9a32OsxxMbPnOEO4cEJweiBkF61U0niZDX2Z77gv+-zAQQ@mail.gmail.com>
In-Reply-To:
 <CAJ=z9a32OsxxMbPnOEO4cEJweiBkF61U0niZDX2Z77gv+-zAQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 43c8511b-0032-49c9-9442-08d97e8364f1
x-ms-traffictypediagnostic: AS8PR08MB7026:|PR3PR08MB5851:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB585182BB6173B71280003E05FCA39@PR3PR08MB5851.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AaSQp1FVkWzVR4P4BO/OCvDyD8DRnku1SKLgR5J2mNu/ozZJIZg0MVSYyjXVo1r+qij70jGMrdGFdqHgLqD7qqGb5o+sMlTqOxsW6xCiaJkcSHyf3ulxNOkGM/Yu+2rlCeZJdot0eeQIu1SD56w9xvTMVwI68Gghgf8/Kj/Olvb+BlXeswMTgt6nu8B+CmkH14AvhXW6/oeZbjUwftkMkPAOhhFziCkm9Xo2wB3/LdlemfgmNm7X+CH+rbsRLmMtYeHLfJHERwm9aQzG4Vaxz3twE6xw9hgQHkguDNep5w/6ZY2V7xLIvK4mMADQz7667UlghajvLvIoNJ4jozkerev/2HmSsakx1CfUgS8E+k9bAFcvtg+Oe/witPLX4sv94GCOHdqruBbVsXfvVVpXHc+JO0QLLHN6Ry+dF6aAUCSL8viaysMADIQEl/eCfW9qttUzFRRZiqfLtgg5vR6xFa5VIP+kESwfoVN5JFj59Lf/cBT8eE51OUdwcRpN/Q+stSAIR0tk29cdkLR8Mh3anKMYKduQjQGFlm+2iAWxtc+GFwpUyxScxfsp0TRYtjc7XYfcEqsmD3bY5+W083OhAdUG5w+hOHDD5okg+hx9epcVtPsBVwGLQ+db+iIintwAETOastfqAegNuDGF8qQt0S8t6Z4L9Wn4JpUU3I14jEgHXIYpPtzI6czahmJS2YW/NbSRk4TG+DtJefC3c4wp45+DNmfmzrsKgERkSLDH3M0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(6486002)(122000001)(6512007)(4744005)(91956017)(508600001)(8936002)(66446008)(64756008)(66556008)(66476007)(76116006)(66946007)(33656002)(53546011)(316002)(5660300002)(86362001)(54906003)(4326008)(6506007)(71200400001)(2616005)(2906002)(186003)(26005)(83380400001)(8676002)(36756003)(6916009)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3CEB873553E6264CB448622A7ADF9D29@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7026
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44cd5c64-f8d1-4da5-5ec3-08d97e835c8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xDB6e4+elvXKEqzFrsERurE5qehjn5sdeTiV2can+0vQKY2k2pcr3dZvmnxF286yh9KRShpEHvadf5Kq8ilo/L6/IAlIfchNG1CapzwaSfme5cC7zaY86CF3KebZOttr7+z374qje1Kiy7Q86fi6bHkkeQeg26b7Tz+aPHxMozPzTrOIjCQ0RRxSjmbeXECfQglixPOnsOOIp6FJYhZl6T5PCrLwyp84kj6oTp9yhCPlHbj8P1nA7JLt1aKDPgrK2QmNCsZ4QsiT8dvpKi+rM/Y7xCsdIhLDBdBumZgb+bt8ExoD0zfbhAvlQ4LZxwYOz7Nmsnaa/2x1LwFytTiyb/8rWldVd/NbJQGOcLK/WcoPsrvv/Yd/+8UyOijysPJpgVYQj0W7vyotnjmaCFY4XkivKdOqmwrRqgiMqm3NPGtCWYuzwTb4IvJF8bNui9Jselkhuz+hV2qNjc8TMaYdF36AVy+phuXy6BkRDsD4HHF2aV/0r1FZwCUr6QtyU6CElHA+Un3/Aam0gCuVVW8gckEu05IzJsduAukwZPuY7Jf6l8nYJlFy7S2e4deozqSg9wkQiuC3MR4xNT5N9xlShWu7u6en76wfOZqD6iPugPKnNslkojQFUYKIKl9ClusoZDP/xpY5JpUCRRXLf5pW7FpUFQSBkUj3PfOjc4evRwNco+owDTSXzq9qqtey0yOdMFschNe+bXDfY6J0Gp0JPQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(5660300002)(8936002)(8676002)(336012)(107886003)(53546011)(36860700001)(4326008)(70586007)(83380400001)(70206006)(86362001)(82310400003)(47076005)(6486002)(186003)(6506007)(54906003)(316002)(6512007)(508600001)(81166007)(26005)(6862004)(2906002)(2616005)(33656002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 11:15:04.8395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c8511b-0032-49c9-9442-08d97e8364f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5851

Hi Julien

> On 23 Sep 2021, at 3:07 am, Julien Grall <julien.grall.oss@gmail.com> wro=
te:
>=20
> Hi,
>=20
> On Wed, 22 Sep 2021, 16:36 Rahul Singh, <rahul.singh@arm.com> wrote:
> Compilation error is observed when HAS_PCI is enabled for ARM
> architecture.
>=20
> In general, when I read "compilation error" I interpret as a user can tri=
gger it in the current staging.
>=20
> However, without the full series applied, HAS_PCI cannot be selected on A=
rm.
>=20
> So I think the message is a bit misleading because this is more implement=
ing stubs to enable a feature rather than fixing compilation errors (AFAICT=
 all of them are not fixed here).
>=20
> How about the following commit message:
>=20
> xen/arm: pci: Add stubs to allow selecting HAS_PCI
>=20
> In a follow-up we will enable PCI support in Xen on Arm (i.e select HAS_P=
CI).
>=20
> The generic code expects the arch to implement a few functions:
>=20
> <List the functions>
>=20
> Note that this is not yet sufficient to enable HAS_PCI and will be addres=
sed in follow-ups.
>=20

Ok. I will modify the commit message in next version.

Regards,
Rahul
 =

