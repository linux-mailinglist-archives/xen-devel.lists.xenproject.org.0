Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E006F421F9B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 09:45:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202061.356730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXf8U-0007gq-St; Tue, 05 Oct 2021 07:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202061.356730; Tue, 05 Oct 2021 07:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXf8U-0007eL-Pt; Tue, 05 Oct 2021 07:45:14 +0000
Received: by outflank-mailman (input) for mailman id 202061;
 Tue, 05 Oct 2021 07:45:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4De=OZ=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mXf8T-0007eB-65
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 07:45:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bb9d0d6-25b0-11ec-becf-12813bfff9fa;
 Tue, 05 Oct 2021 07:45:12 +0000 (UTC)
Received: from AS8PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:20b:313::24)
 by AS8PR08MB6405.eurprd08.prod.outlook.com (2603:10a6:20b:332::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16; Tue, 5 Oct
 2021 07:45:09 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::15) by AS8PR04CA0079.outlook.office365.com
 (2603:10a6:20b:313::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 07:45:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Tue, 5 Oct 2021 07:45:08 +0000
Received: ("Tessian outbound ab2dc3678fa9:v103");
 Tue, 05 Oct 2021 07:45:05 +0000
Received: from bf461cf99ffe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CC14D42E-3832-4E4E-985C-0872EDAA90B2.1; 
 Tue, 05 Oct 2021 07:35:44 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bf461cf99ffe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Oct 2021 07:35:44 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6791.eurprd08.prod.outlook.com (2603:10a6:20b:392::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Tue, 5 Oct
 2021 07:35:41 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::51ee:e7de:6c0a:bcf9%7]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 07:35:41 +0000
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
X-Inumbo-ID: 2bb9d0d6-25b0-11ec-becf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAXEff3KZooyXzT37QuFAswDLIBVtvYoESXRlRAfQac=;
 b=AJdfdnuFlV8EpzQslzAljcA01aFSx9ywXhQbLGcFyoTu8LKlgotc0gKdv9HVhqO6r7gnvLDCab0UdCI+FybgMgpxI3CZjAe8JLsKUgFi/5hZ6UbCxv6bB7Lkf98JolK5zzYU2b0U/rCuwwrqLXfeukBrNP/sd25ylb1q1esYpcI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 60a2218a3891971d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrRS7IOczDA0ekmqM7JBqh1IJGy8x013LTnOuvxp542O2afKNTL58dCQmVucQ+HJ1n6JREashRN36jB6SMnLGagOdp093B8/lfj5M5aHqIDtXlHapGbOvZcbyJpWi+vIa+wzlzjUFuPrh7xnXQL18n5+04PgwOpO0LcncArVHsNeCAMoeMcpPlfVTRV//QHgf+xZJq/Wx+kdFTdPUJBDLBk0jQkXDI/MrGagQaMVIlCx8LlRKbG1G4WW1VQqPFHWIozfwFGf0BcDGsUGXJbM4gUJaK8l5vfeMXWsO5n6IBas6JjOG/aiASGCAn7upBPTU8eA4oab2HFD9BCyJdac3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAXEff3KZooyXzT37QuFAswDLIBVtvYoESXRlRAfQac=;
 b=J0eQk5yR9DzM8dHCCZXBUMVAYYhwQuk2/zTUcGLWB0mvv6IJRhX8d7TMMfYCFxzh9l3vl+1jYwQo/DqIz2GWK64BS6nSNELW/M2bU3safpCjXMC87sztFJpka8jRWUDXLASY84bdWftr2e2NAzpXOyR6kUMga1NitChLsYoligxN/X6NIo2ofrinS0uTt6+hBEljoGoqmSRf3rFzHhywPPSbSO1GgdgAhILM0u0kblkCV0OK7f4+johVWR32KbpufU2hZn16X7EgkCf0cxTUTSYALTXhyeICRb8nKROfIgUWAut7I2iaqt7/57qt+U9hAeEmgRN5OVUJmGC0sECXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAXEff3KZooyXzT37QuFAswDLIBVtvYoESXRlRAfQac=;
 b=AJdfdnuFlV8EpzQslzAljcA01aFSx9ywXhQbLGcFyoTu8LKlgotc0gKdv9HVhqO6r7gnvLDCab0UdCI+FybgMgpxI3CZjAe8JLsKUgFi/5hZ6UbCxv6bB7Lkf98JolK5zzYU2b0U/rCuwwrqLXfeukBrNP/sd25ylb1q1esYpcI=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v4 00/14] PCI devices passthrough on Arm
Thread-Topic: [PATCH v4 00/14] PCI devices passthrough on Arm
Thread-Index: AQHXuRZgSgnn8xNCK0GEb4YjlRTuVKvDlcSAgABvQYA=
Date: Tue, 5 Oct 2021 07:35:41 +0000
Message-ID: <C28F78BC-576B-438E-90B5-3F78664FCC47@arm.com>
References: <cover.1633340795.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2110041753090.3209@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110041753090.3209@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d8810af4-7f34-47fb-d0c1-08d987d40df2
x-ms-traffictypediagnostic: AS8PR08MB6791:|AS8PR08MB6405:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6405C6B9A5B06775D56C76F4FCAF9@AS8PR08MB6405.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fVTppeT6dKMRqjB+3DjA9AuSnK2M+qgP6euc5wavbfnAvyDy9O+KVFqul7LdX1eQCFDrreu4BaF9wH0sejFM0B+8AvAmZi4ppesK22BLorQIoccwa0I2gsAQrxRcleDXBnrPLosWbvbYIm9/ImU4baExDv2g1T9cluJX8OhXdJ1CJCJVZYihRVHKSj/Jdl/XpiyM2Le8OI3eE/i6mWzqjTAbCjx+kCrleWdt0wt1/a6Vr2NqQoXhdF8sVyWSYd3dUezqD0Z2C9K8WUc3U1Rfru2F7F9tKRCa4mhCK7d+pdC/5B2lWIUVTbYVIgeryQxVeQb1aCA+bXoIf9iBpXCUxDjdDneL6qpgU5J7W0ZSX++EXXdn3sMv6Us+Nmyc1d79QW1ILnwDKLLHq6wWaBE9nFhS54OCXb7S1pt0DygGPRvvxEFSixNXTAEVott2M0+rEIfawaeM49yBE/gLbbh1xBXOv7pZ0xdZSyw4qIYwNsq2tG1EqmlOMnklZQ+vN1CnqKdyr6Z5VryINaqgXCuOgejND2WNag9lwSurQWpvIKB3GZWed+bhBa58vALjFPC+9vFhr3EaU3cFfpOcWTPhrJ1rr8kD9SVtNJF9Lb3Xq8H5ffwn3jSt7BjVR5YBg761GdYE2Hwj8LtVjnGaWO6vYjCWfpPHRAhQgnvKNdeLxnMlbQ0RQyVjhPmqRyGcNjt/U9a2oQ1waaPdtfZM4+sJx69T9bpmwVRND8htu9+kua3KTniJI8itB+p5yHIHEciy
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(558084003)(38070700005)(86362001)(122000001)(316002)(2616005)(38100700002)(6916009)(33656002)(6506007)(6512007)(71200400001)(8936002)(4326008)(8676002)(36756003)(6486002)(508600001)(91956017)(54906003)(2906002)(186003)(53546011)(26005)(66946007)(64756008)(66446008)(66556008)(66476007)(7416002)(5660300002)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <03A2730646014D468C3E114B0CBAAB5A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6791
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0bc1b350-a796-4ea8-3cde-08d987d2bc1e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PKJ82Mp3p8O0W28Un1c6d0pKzeWepHlvnGrxBLzcb5VSgSXzHWqigNHFnEbg1BREwH0kgJo+cc9pAx4WMyYsZ4tDGFTDQP5YtEVeFihr6V55aFPl+phqQKkZA8PgI8BW5PA6v2jWBsTNwp3jDL63gSuNf5tg4T3wc6Deq1vSe34dZKp+Qlt4gfAFdcvjwdqT9gg8dJyQuIbAKXzbYpRfeVvKuwlpLGm/EBREa2NB7BAk0MI+0+pmJsVBrdgF9L8dwbsLJak6P1Dk0Z5HsM/a+p7hWAkUIvI4QRkvVG08DqDZm11q4hx171R5Y3cJe4UYC66ukwUQwAdXAm4SWPNYQGCNtklxwUHF3OsFOUYqcZ3WqKx33bdW0cnbGfAIA3BbGIg9bPbqGCprH82pTTYnnOL5s+Cy45ZokEdv2qmd5yFh+BENVvEMXqH/XXnKk58NdYDnww22YrENDy6qpJ7lH+s2a/kJw7R3f6fzsoDSgy9lcZn3voity6j0whT3QhqP5PBeFeH2He7YN6B7/jFxYyhBz98kuO2SdcB1NGZRNQbKvKr/+tCf0bxsuzJ5Gig33xFcB607M5/ckWkLGIYkrmghSkwjS/qkYQ9CcuinLQrssfj9gxD9FQiVo5pVIJGxMMV5yKMiGK07BWh9sEoKUlwg1UcRfQtGz0nKucijlyIM4wDPpd3V6nTZ/cII3+ynDvhC9mRoAZ9J8JArOSfBGA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(336012)(2906002)(36756003)(6862004)(70206006)(54906003)(33656002)(8936002)(36860700001)(6506007)(508600001)(53546011)(6486002)(107886003)(70586007)(8676002)(2616005)(186003)(47076005)(5660300002)(6512007)(86362001)(82310400003)(316002)(558084003)(26005)(356005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 07:45:08.5079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8810af4-7f34-47fb-d0c1-08d987d40df2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6405

Hi Stefano,

> On 5 Oct 2021, at 1:57 am, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>=20
> I committed patches #1, #4, #5 of this series
>=20

Thank you.

Regards,
Rahul
 =

