Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F62F792185
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 11:36:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595526.929120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdST5-0006xS-NQ; Tue, 05 Sep 2023 09:35:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595526.929120; Tue, 05 Sep 2023 09:35:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdST5-0006vU-Kd; Tue, 05 Sep 2023 09:35:31 +0000
Received: by outflank-mailman (input) for mailman id 595526;
 Tue, 05 Sep 2023 09:35:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qilU=EV=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qdST3-0006vO-UO
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 09:35:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c4acc29-4bcf-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 11:35:28 +0200 (CEST)
Received: from AS8P250CA0017.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::22)
 by GV1PR08MB8425.eurprd08.prod.outlook.com (2603:10a6:150:a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 09:35:23 +0000
Received: from AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::b0) by AS8P250CA0017.outlook.office365.com
 (2603:10a6:20b:330::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 09:35:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT057.mail.protection.outlook.com (100.127.140.117) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 09:35:22 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Tue, 05 Sep 2023 09:35:22 +0000
Received: from 3d6908e7a7fe.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F9F396E-6503-4591-9E63-702AAFADFB38.1; 
 Tue, 05 Sep 2023 09:35:11 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3d6908e7a7fe.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Sep 2023 09:35:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB5521.eurprd08.prod.outlook.com (2603:10a6:208:18a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.28; Tue, 5 Sep
 2023 09:35:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 09:35:06 +0000
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
X-Inumbo-ID: 8c4acc29-4bcf-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHH9LdOUMyvfQ+SoksI+W005evFIR5HJ4xQEUQDYeOI=;
 b=nOXzSLudAjwxQ1U17zbx0xZ78043hn75yaVju3ZVPX2j8HHu/CkmPGbboGz4AC8j2azhKQlAlzG3aPlzEt/EGr4A7KQsW2DihCLl7As6fqovXjQSY8Pez72bnENI7FaXDBgADio4DmTAeKjUun4FwEe+QAQ/aonEzT0ZOImARRo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 387d8ff7161e4d91
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dAuu+rnDGYS04dYXY2GA3O5MbfSlkLXXaZKZoCdxjYtACxLBDw06lTfwM6NkRu4tRpdby6MVkE6GOcPh6/z0wKXT4Lf0bLPc++FC5ixJhEnrWouD+Yo9bbKNbEaCpqXswodajfxT/z3UIkdgFrHH4Ka4YyDCscv8GCoQQsuo/52LWBfOYVlfLLEucy8hUDLnSVUQ08Ihsip8g8coNrZhXe0lQsE1Zp+Mx711PlLaWRNy+wa9CFTzj1+V5bBLRm/pKrcvJpCfupXIpyDxsIOPWr9ybonwtVv5LsxXKvCgx9x7bYjMJhr2nBMzopRMThPBhwXXQjCW22o2bZ3L85Os2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHH9LdOUMyvfQ+SoksI+W005evFIR5HJ4xQEUQDYeOI=;
 b=hCgEjNFXddv3u1H9UEa4vZMiJKSlUqW0IlEKUwwyEroopINqGInCLk/KfMGf76w7gmpjv1cCt7xUw5BZFhMWvvUL3LI6awJUa+tDn5OJejcfsN3Kq0sTjmxZ/IwsDs8xb/74P8YDMnUj7YmzDt3FIkesi1Zhe6ibdVwjV1KtsWTDpHb3zXFgVnxTIksfBO3wOkXCBuWO/MjCGla41JIBG3yjuj2H+xlif/ztyoo2B271eISnXGYtw0ZKur4xveWX4SnLS2t1n9qMm1QmVs8jfaXEhQqvPGyQe43cVVziwO9U0MbrOO9g4kS+rJFPxj+JwEUDUI/W45q7rvgvRuE84g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHH9LdOUMyvfQ+SoksI+W005evFIR5HJ4xQEUQDYeOI=;
 b=nOXzSLudAjwxQ1U17zbx0xZ78043hn75yaVju3ZVPX2j8HHu/CkmPGbboGz4AC8j2azhKQlAlzG3aPlzEt/EGr4A7KQsW2DihCLl7As6fqovXjQSY8Pez72bnENI7FaXDBgADio4DmTAeKjUun4FwEe+QAQ/aonEzT0ZOImARRo=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: Re: [PATCH v2] Arm: constrain {,u}int64_aligned_t in public header
Thread-Topic: [PATCH v2] Arm: constrain {,u}int64_aligned_t in public header
Thread-Index: AQHZ39K3OzaUe4swdEmgFg74tOYCyLAL+M4A
Date: Tue, 5 Sep 2023 09:35:06 +0000
Message-ID: <DAF26DA2-3438-4B44-B783-2C7445618CF1@arm.com>
References: <6bea2061-e6df-2cea-4bff-858b0f44a0c2@suse.com>
In-Reply-To: <6bea2061-e6df-2cea-4bff-858b0f44a0c2@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM0PR08MB5521:EE_|AM7EUR03FT057:EE_|GV1PR08MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 03f16717-a5e8-45a5-9381-08dbadf36d88
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 t8Ms+td0wyd6Oaquq1llnb+tVQ2aaDaaJZ+rjtZRMhKHrYoebqL/yO1eXQH0r9CcNDz7zY/Fk366cD2x4ZRV0BBEM0vWyIoMWJZDj5auc2QYmgufmXCrK8sIbuthDA7WZYNCsx6PbErH/R6bWuJ2xptYZICYFHIkpQToUEM/LB8CUVjultxzJmP3LS8hZ1xTWItnuyamUWjzSzwc/7G6yeg1BMbgk/6qhu93vIVx2kS8eP9SntB88bY70cZUQQMDWN2oxT7lPsVYf3wG+eIlYyAYo2XzXXUfOMzOyQ6ggxuOyNwq4+/qz+SAcT9ve441x+cVwDC+63T/FN+Vr7VAu3sdE0HARmqi23wg3RXW/F+0RcYIzGOgcf/6smoB1eTc5f64ldgFEQmo3LTel2y85SxOqY40CDxWywCfNfe3f3IVrxB3+Jj63Bd2tHwpVKmA+RTjAf3PuNJqDEqvHqDlwufjyizmCFhEGJTLhnae83QVx+PWtMnY8+i9rarYeibEqkarCNl7X7U3nVagnH62zFEBjT4fmyN6w0+d6exrJs7GdqX/jIzIOQogUEpUVSX318Y3c4EjMKZ5nnJZMmgsyiAEhMGkeGWl8IXIW3USnvZoG1dp9UZshyRswUbOTqaNGx+wvPhK6c15BQzFwoYLPg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(346002)(396003)(1800799009)(186009)(451199024)(478600001)(71200400001)(91956017)(66556008)(54906003)(66446008)(76116006)(26005)(2616005)(6506007)(66476007)(66946007)(64756008)(316002)(6486002)(53546011)(4744005)(8676002)(4326008)(2906002)(6512007)(8936002)(6916009)(5660300002)(86362001)(36756003)(122000001)(38100700002)(38070700005)(33656002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A2F1E2B9AD19B542A97E94A6422ED83A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5521
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e8c80fd-1924-498d-4fec-08dbadf363d0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tmJuB9NBDKdjP6WHxCskb4Lcz/hqoHNMN+L4z3sTwnH2OwxbmlMw/SMfoD9+/2sv3ix+ltGAmozouuCMRXkngyNL1LNkC70bgjgt1AdKMDoUCq90p1k3+Z9ZZtG4JaxqnkGFRHABphFSTaSRvN6A+kCuhStNda4at1JH/B0364yK9x/lc0rGS9bRIh1CjE2f0rzYdY80+NBZDm2ZLrB30NYad8a099Y6ILjW4v4mwgpDyxk/8mkf18/WHw315MpddBpd3iuu8mthfDnGNHW9uBvLPQ1/Q1S1ATF1cV1CZqHG3RYEtG0Li/TBDmVLB0BOUFccGziwv/fQPKtmaLnQ+GRcTpGKVsAiKui3cRzSg46gB9uZFVw2SbfRRLxtHRheAbqYojU1OMTrDVTvNA5dOtyVyviuzeuhJcpCnUc52tHkhVMz2j5iLuQozeLzGY4AxNE+I0ZYbLP6Px0Qpta4hy7fbTK+kxlC9dikV/9htspTnG/NGG56cww+UmoyUi+zwg2kKALjFAPfwgewZ6OlpaDJmTGBYpwRi6aQ69JWm8XOe1eHImDqnk2ftgSFJkxvNrhYpWRdHzHhrSYYbLxRDga64cKBHcZZpSUgbrduaN3XbU1xoT9ZBU3SMXPiFwjx1xyuRFI9yqID52c2jhb5oKO5X76nv1OMOBxCdBwKNL0z48XJJF9R7ejtBTRNZPBP0t3IMIvsjasAD1C0/drLzRqQ149tE0iPxoZgj0tzrek=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199024)(186009)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(53546011)(26005)(5660300002)(2616005)(6512007)(54906003)(70586007)(316002)(6506007)(41300700001)(70206006)(40480700001)(82740400003)(356005)(81166007)(4326008)(6862004)(8676002)(8936002)(478600001)(6486002)(336012)(2906002)(47076005)(36860700001)(40460700003)(4744005)(86362001)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 09:35:22.8913
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03f16717-a5e8-45a5-9381-08dbadf36d88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8425

Hi Jan,

> On Sep 5, 2023, at 16:26, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> For using a GNU extension, it may not be exposed in general, just like
> is done on x86 (except that here we need to also work around not all of
> the tool stack actually defining __XEN_TOOLS__). External consumers (not
> using gcc or a compatible compiler) need to make this type available up
> front (just like we expect {,u}int<N>_t to be supplied) - unlike on x86
> the type is actually needed outside of tools-only interfaces, because
> guest handle definitions use it.
>=20
> While there also add underscores around "aligned".
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I used the same testing approach to redo the test for v2, and everything
works fine this time.

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

