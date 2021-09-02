Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504C23FEC05
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 12:19:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.177222.322524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLjoR-0001O6-Uk; Thu, 02 Sep 2021 10:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177222.322524; Thu, 02 Sep 2021 10:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLjoR-0001L8-RZ; Thu, 02 Sep 2021 10:19:15 +0000
Received: by outflank-mailman (input) for mailman id 177222;
 Thu, 02 Sep 2021 10:19:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+khH=NY=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mLjoQ-0001L0-6E
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 10:19:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.61]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3817619c-0bd7-11ec-ae51-12813bfff9fa;
 Thu, 02 Sep 2021 10:19:13 +0000 (UTC)
Received: from AM5PR0301CA0029.eurprd03.prod.outlook.com
 (2603:10a6:206:14::42) by AM0PR08MB5362.eurprd08.prod.outlook.com
 (2603:10a6:208:180::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 10:19:01 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:14:cafe::80) by AM5PR0301CA0029.outlook.office365.com
 (2603:10a6:206:14::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Thu, 2 Sep 2021 10:19:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 10:19:00 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Thu, 02 Sep 2021 10:18:59 +0000
Received: from d07b1656b146.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D95FE19C-E716-48ED-95B2-C1F361DBC423.1; 
 Thu, 02 Sep 2021 10:18:53 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d07b1656b146.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Sep 2021 10:18:53 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5609.eurprd08.prod.outlook.com (2603:10a6:102:81::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 10:18:52 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4457.024; Thu, 2 Sep 2021
 10:18:51 +0000
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
X-Inumbo-ID: 3817619c-0bd7-11ec-ae51-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tw0iUjtKkLEHPRfdJHIx0kRvdubuEIfM3/VmTTJDH0E=;
 b=pIxoocTFccO3R5idc6ai9owoztQn/16d+Jzrx3AZaG0vlt5pudj3Avkjro6+JCVJl/XQQq1ZOQzRRbraqsqCqpV6eWPVT7dTc3JckYZPEZp5Z0NioeaKSrsWM28T1g0o/JzAPY/R3TwVahdBntrbG2uGAKMYIzD3Ud2Ph7TuCUE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc87c5284b92ed52
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndCVH+jAGAx+eRStRkwsQR+B/x0NyUKClrH5eqMnlKMPxGDZdbsl7yuWdVG2Kz/sHwKZlkLKvgqVV4FFcmc0I+PNdY1cEVeL5Z56vlIvOnoksuKYzkcgFufZANnfUboKtMxglh+RFff1sGNEe3AxHCGeMV73F+nikE+uyI/i91kqbe3m77L0yZN9LWUFzqbqBJNohX1KT9FMJ4jHqNipj5OwFs09hYuu/yu/idnXCxxXn5AuX2jgxF/KTowOOqPRZkkYcdFVFbdXh4oFBdlLZH+9oXNQSbzo2guT+v9HGYPlvPPR1Vy03/MrLgF9Guc7+T3kTXrRdC1/5ksNgujjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tw0iUjtKkLEHPRfdJHIx0kRvdubuEIfM3/VmTTJDH0E=;
 b=D9ZA2XDmD0KPb0VrJdkBm6igUQGAHhF4oqY+CeVvynWliKuuV+gY5sKVE/WimiwYzXUPyoPr2M4v8pylxElmR6DyjSy17rfpNRctp1WbrynpJH9w1ZwFhNhtPgy5TlBADlVol4nF+DhHSwNW/p2dNs46URXba8wJVPdPVJXd27t1B+voTL12yPqFCe5mTkqEZM/ptt4L/ixqHmN6AMtt4VgBOh/n9t9/okoJPXpS3/vbqqykY6bD0D8wd3moPHvnpGAgGELsGkTJjdrMOQGJfb932OJtm4xQtIURGmqQY/GaV1F90pBG7piMPZswr+dizlF0feEXI2i3ShziPt9fpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tw0iUjtKkLEHPRfdJHIx0kRvdubuEIfM3/VmTTJDH0E=;
 b=pIxoocTFccO3R5idc6ai9owoztQn/16d+Jzrx3AZaG0vlt5pudj3Avkjro6+JCVJl/XQQq1ZOQzRRbraqsqCqpV6eWPVT7dTc3JckYZPEZp5Z0NioeaKSrsWM28T1g0o/JzAPY/R3TwVahdBntrbG2uGAKMYIzD3Ud2Ph7TuCUE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<Michal.Orzel@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Introduce pmu_access parameter
Thread-Topic: [PATCH] xen/arm: Introduce pmu_access parameter
Thread-Index:
 AQHXny72/ET98Hho/USYtlrYv98fUauPIugAgAAENgCAABSIgIAAOtOAgAAK3QCAAOCVgIAAEW+AgAAWIYA=
Date: Thu, 2 Sep 2021 10:18:51 +0000
Message-ID: <8B5CFAFE-FB9E-40EE-B162-35554B71EE68@arm.com>
References: <20210901124308.31573-1-michal.orzel@arm.com>
 <599515f0-4b8a-3a71-caea-b17ec27c9123@xen.org>
 <44B48162-EB44-4295-9629-2D95A40D7232@arm.com>
 <46e36ba5-8b3d-2d43-6297-b92d2654ab72@xen.org>
 <alpine.DEB.2.21.2109011045440.17925@sstabellini-ThinkPad-T480s>
 <0e72fb05-a477-ef79-c26f-bc011393a403@xen.org>
 <5B7B9C01-FF1D-44F9-8815-A422E51916A0@arm.com>
 <a7920989-f0e3-3eb1-5317-09e6bcd67211@xen.org>
In-Reply-To: <a7920989-f0e3-3eb1-5317-09e6bcd67211@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: a756ad49-82f9-45a8-9fd0-08d96dfb14fa
x-ms-traffictypediagnostic: PR3PR08MB5609:|AM0PR08MB5362:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB53629577A4D7BF78AEB4365F9DCE9@AM0PR08MB5362.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UYW4hFDjfb3a7zWLI/JLtDJNG25czlp28CopXaYChrWMKGJnoBLyNPvG2hMbEoTi7vflQrqrvp/1dWH5+G5rbaQIb0amIA/qUCLCLlsgawtq92ODTa6tcEI2973Ivh+CNVYqTMywIh8iZGZ/P48TGSSVYX/n5ftZ82U1lIc/qENGWU9DLZRr8MVUSPX7PgQV9FkkocPLlAB3MTi9o3BwZiUAtXJTBrVio18kWZnd1naT07RmdDxKA+0+zJZViPdMTiptApCukK9Snk0h0AXht/Go3NIUrmQy9L241csQsitZVUZCGcYnbFSlFIEAHj1rPHtLmdhZANqEDJbhlUVkUGlLW8hfjLAtZtAv9z2UNwa+tHsTEjnhaGKLDKSwGtl/5NL7ss+/t5RzrA2scp55ePw7GCjrOVcChT2u6n1VT5xb+53g3yY7TzItBe/BH9T1F/U25k3y90Tk8H+qYVqvmKFusB8RPAt+A+nWJatAZM/ADuSbjGffyjJesB2L/mMjWPen4PE5I0zbsClem034toacp8Syai5NGeFnqEJEGX4ZeFmGRzZTP3MQBgjXl9caVjeYWX043eMl1vhKIfg9iGx4aiTuV2ySCI7bWsKqmvtyoNZWuC5cgWUQA6Qv52xl7PPQlqxB/Qb7nzJH5oKwk7qq16gkahNpLSTyjcwBrgh6iQ+1N2gsbTfUkldhXapcUSHr/tRk9d5xJUBQqDJ7WQUyzxR5X/CL8biZA+4rnIkkXwe2bIlBu+aqe7hWlGH1IMBjIzeWuMbAcDpAyuk/ZA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(2906002)(83380400001)(6486002)(5660300002)(8676002)(76116006)(91956017)(38070700005)(4326008)(26005)(6512007)(478600001)(64756008)(66556008)(66476007)(6916009)(66446008)(33656002)(66946007)(316002)(6506007)(54906003)(53546011)(2616005)(36756003)(186003)(71200400001)(38100700002)(122000001)(8936002)(86362001)(21314003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D444033A09F3D147883758DE0D76CB92@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5609
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f2252119-6265-4c78-bf74-08d96dfb0fd8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dQ2DjelHeRHZVrg7zwS+YIdP4sY2qy8UQ+J+jrq66N4WJvzjyBOhvxiV4HbKuP4qAQHhfxlC3q8/lJOItk27f1ySscJL+bz5kLPu9KD9DeOpXrFWsAjEqABmxEvAhOOwTcvN3PXt5kvSAZdsTeb/uIZVT5o4o6HruheQ5YATxMcQfsI0SGVF0LlUBY3x/aZgjM/iLuIMrZkM7g+2A76iCuH4h8qP7orsvDDYtKStD4MR1pJwEdn8qO7RteCMHH4lB0WtgqllIjBCBvzv4s4tek8sj/IoifURTq2xAXLnPmsOh2vxrLLW8X9phB3OzNmor65ZhEPXyTNkDg8wmK0UARUf4dviICqaqth273yqHnOYr3AruituQBwLM+MYQZEwZ7xHGhGg1KEj7Ok6mBI26HPDySJ0h+Nds9nb24LnKpnxbB9WelFsO/pFwf4laWmsxhY/3PK9bCOVP9mB6thnpjDJZwDIRdiR8BfRXMRRCWPgW21y19UjUm5Xn8C52BtRU01U6g68Gnhe/aiZODLMbRRNlNzCMVSEuz1FVY/68qgRyfKIuhTAdnXaUFBsEOIfRhI3EGlsalTsE07vwwpT1b2yFBzFw+w8tF6TzYjM3nTPXXTY0HIKdSfyfPmwflks5D7tZi3XdmB8nHvLplPFPEe+z42ipHEPl4nY7SpTecPr5yqQcJncB90t0CGaNRA8shHMd2mzj7iL00VPQLQ5+Emku9l7yBAXYe1XtMhwxjE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(36840700001)(46966006)(6486002)(5660300002)(8676002)(33656002)(70586007)(8936002)(6512007)(82310400003)(81166007)(82740400003)(356005)(70206006)(36860700001)(47076005)(6862004)(83380400001)(4326008)(86362001)(107886003)(478600001)(36756003)(2906002)(54906003)(2616005)(336012)(6506007)(316002)(26005)(186003)(53546011)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 10:19:00.4954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a756ad49-82f9-45a8-9fd0-08d96dfb14fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5362

Hi,

> On 2 Sep 2021, at 09:59, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 02/09/2021 08:57, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>> If I understand it right, you want a per guest parameter to be able to a=
llow PMU accesses.
>> This would require:
>> - to save/restore MDCR on context switch
>> - introduce a new config parameter for guests (might or might not need a=
 tool change)
>> - have a xen command line parameter to have a solution to Allow PMU for =
dom0 (or maybe a DTB one)
> Yes.
>=20
>> But this would NOT include:
>> - interrupt support (only needed to get informed of overflow)
>> - provide PMU virtualization (not even sure something like that could ma=
ke much sense)
>=20
> I am guessing the following is also included here:
>=20
> - provide a PMU node in the DTB for the domain.
>=20
> Without those 3, I feel we are exposing an half backed PMU to the guest. =
But this would still be a good first step, so I would be OK if they are not=
 implemented in the first shot.
>=20
>> I am not saying that we will do that now but as I need to unblock this I=
 could evaluate the effort and see if it could be possible to do this in th=
e future.
>=20
> Well... Below the patch I wrote during my breakfast this morning. This ha=
s not been tested and miss some documentation.

Impressive but be careful not to put jam on your keyboard :-)

We are clearly not at your level of expertise and this would have taken us =
a lot more time, even if we tried without eating in parallel.

>=20
> From 690a92cffed82451dcbd8b966e8dee31c1dce5fc Mon Sep 17 00:00:00 2001
> From: Julien Grall <jgrall@amazon.com>
> Date: Thu, 2 Sep 2021 08:46:12 +0000
> Subject: [PATCH] xen/arm: Expose the PMU to the guest
>=20
> There are requests to expose the PMU (even in a hackish/non-secure way)
> to the guests. This is taking the first steps by adding a per-domain
> flag to disable the PMU traps.
>=20
> Long term, we will want to at least expose the PMU interrupts, device-tre=
e
> binding. For more use cases, we will also need to save/restore the
> PMU context.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> tools/include/libxl.h            |  2 ++
> tools/libs/light/libxl_arm.c     |  3 +++
> tools/libs/light/libxl_types.idl |  2 ++
> tools/xl/xl_parse.c              |  3 +++
> xen/arch/arm/domain.c            | 10 ++++++++--
> xen/include/asm-arm/domain.h     |  1 +
> xen/include/public/domctl.h      |  4 ++++
> 7 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d69869..d3e795a38670 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -502,6 +502,8 @@
>  */
> #define LIBXL_HAVE_X86_MSR_RELAXED 1
>=20
> +#define LIBXL_HAVE_ARM_VPMU 1
> +
> /*
>  * libxl ABI compatibility
>  *
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index e3140a6e0039..89865a90dd3e 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -29,6 +29,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>     uint32_t vuart_irq;
>     bool vuart_enabled =3D false;
>=20
> +    if (d_config->b_info.arch.vpmu)
> +        config->flags |=3D XEN_DOMCTL_CDF_PMU;
> +
>     /*
>      * If pl011 vuart is enabled then increment the nr_spis to allow allo=
cation
>      * of SPI VIRQ for pl011.
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 3f9fff653a4a..daf768cba568 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -644,6 +644,8 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>=20
>     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                ("vuart", libxl_vuart_type),
> +                              # XXX: Can this be common?
> +                               ("vpmu", boolean)
>                               ])),
>     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                               ])),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 17dddb4cd534..6e497cc0b67e 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2729,6 +2729,9 @@ skip_usbdev:
>         }
>     }
>=20
> +    /* XXX: This probably want to be common or #ifdef-ed */
> +    xlu_cfg_get_defbool(config, "vpmu", &b_info->arch_arm.vpmu, 0);
> +
>     if (!xlu_cfg_get_string (config, "tee", &buf, 1)) {
>         e =3D libxl_tee_type_from_string(buf, &b_info->tee);
>         if (e) {
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 19c756ac3d46..a0e2321008ab 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -276,6 +276,9 @@ static void ctxt_switch_to(struct vcpu *n)
>      * timer. The interrupt needs to be injected into the guest. */
>     WRITE_SYSREG(n->arch.cntkctl, CNTKCTL_EL1);
>     virt_timer_restore(n);
> +
> +    /* XXX: Check the position and synchronization requirement */
> +    WRITE_SYSREG(n->arch.mdcr_el2, MDCR_EL2);
> }
>=20
> /* Update per-VCPU guest runstate shared memory area (if registered). */
> @@ -585,6 +588,9 @@ int arch_vcpu_create(struct vcpu *v)
>     v->arch.vmpidr =3D MPIDR_SMP | vcpuid_to_vaffinity(v->vcpu_id);
>=20
>     v->arch.hcr_el2 =3D get_default_hcr_flags();
> +    v->arch.mdcr_el2 =3D HDCR_TDRA|HDCR_TDOSA|HDCR_TDA;
> +    if ( !(v->domain->options & XEN_DOMCTL_CDF_PMU) )
> +        v->arch.mdcr_el2 |=3D HDCR_TPM|HDCR_TPMCR;
>=20
>     if ( (rc =3D vcpu_vgic_init(v)) !=3D 0 )
>         goto fail;
> @@ -622,8 +628,8 @@ int arch_sanitise_domain_config(struct xen_domctl_cre=
atedomain *config)
> {
>     unsigned int max_vcpus;
>=20
> -    /* HVM and HAP must be set. IOMMU may or may not be */
> -    if ( (config->flags & ~XEN_DOMCTL_CDF_iommu) !=3D
> +    /* HVM and HAP must be set. IOMMU and PMU may or may not be */
> +    if ( (config->flags & ~(XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_pmu)) =
!=3D
>          (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap) )
>     {
>         dprintk(XENLOG_INFO, "Unsupported configuration %#x\n",
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index c9277b5c6d94..14e575288f77 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -166,6 +166,7 @@ struct arch_vcpu
>=20
>     /* HYP configuration */
>     register_t hcr_el2;
> +    register_t mdcr_el2;
>=20
>     uint32_t teecr, teehbr; /* ThumbEE, 32-bit guests only */
> #ifdef CONFIG_ARM_32
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 96696e3842da..db9539ddd579 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -71,6 +71,10 @@ struct xen_domctl_createdomain {
> #define _XEN_DOMCTL_CDF_nested_virt   6
> #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
>=20
> +/* Should we expose the vPMU to the guest? */
> +#define _XEN_DOMCTL_CDF_pmu           6
> +#define XEN_DOMCTL_CDF_pmu            (1U<<_XEN_DOMCTL_CDF_pmu)
> +
> /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> #define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
>=20
>> In the meantime we will start maintaining an internal branch with patche=
s refused upstream as this is blocking us.
>=20
> For the future, please consider a per-domain option from the beginning. T=
his is not much extra effort (see the patch above) and would make the accep=
tance of a patch more likely.

We wanted to share something we did internally which we thought could be us=
eful for others.
We will be more careful in the future.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


