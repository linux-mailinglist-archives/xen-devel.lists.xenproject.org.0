Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927915F7665
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 11:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.417525.662240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjsN-0001Ie-Gk; Fri, 07 Oct 2022 09:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 417525.662240; Fri, 07 Oct 2022 09:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogjsN-0001Gp-Du; Fri, 07 Oct 2022 09:42:39 +0000
Received: by outflank-mailman (input) for mailman id 417525;
 Fri, 07 Oct 2022 09:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XcYz=2I=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ogjsL-0001Gg-Um
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 09:42:38 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2055.outbound.protection.outlook.com [40.107.249.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e95be1c-4624-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 11:42:35 +0200 (CEST)
Received: from AM6PR0502CA0059.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::36) by AS8PR08MB8182.eurprd08.prod.outlook.com
 (2603:10a6:20b:54f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 09:42:32 +0000
Received: from AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::9a) by AM6PR0502CA0059.outlook.office365.com
 (2603:10a6:20b:56::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36 via Frontend
 Transport; Fri, 7 Oct 2022 09:42:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT027.mail.protection.outlook.com (100.127.140.124) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Fri, 7 Oct 2022 09:42:31 +0000
Received: ("Tessian outbound 7e4a920b87c0:v128");
 Fri, 07 Oct 2022 09:42:30 +0000
Received: from 932391c6ceb5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1FF08CF9-2C01-4503-8508-24E4494CB6D8.1; 
 Fri, 07 Oct 2022 09:42:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 932391c6ceb5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 07 Oct 2022 09:42:24 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9606.eurprd08.prod.outlook.com (2603:10a6:10:44a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Fri, 7 Oct
 2022 09:42:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::10bf:2915:c966:b45a%3]) with mapi id 15.20.5676.038; Fri, 7 Oct 2022
 09:42:20 +0000
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
X-Inumbo-ID: 5e95be1c-4624-11ed-9377-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XdCRNqKSvjPB20hVaesLySiWmEyYtSnCfingOOQ8f293dltACHvFjYDkys2jmLNSvknLCPR9SyOMfYtBmZ/awY9CiSN7z3y33bNDEEsdZEEuP14+XYp3Uz7EFXHT22fP9jsYuyfkjArGvNcS7hD9IKkRjVLnxQWULzuKSK+uG+ZiTPvSl5n1ctk2RUmwlQYMev7ntJ3xq+OPTTmpww/M/sSHDQ0yRMBKotHadm6BztvzQc8d8djiFvtUaSa5mYWsPpJoHKxi9ag8coWlxWy7UEKerRvfwA60MksRr0DECDHWJJUSbg2vDbx6GfSs3pkESNZULPt0WA4aDY7dMd2tMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9UZ5GkaKMKwDiuD29pmC/BCaBkruEG+uGZG3skHUWM=;
 b=PE987zfPAM+v4MEDjF3huZhPDFX9jqdESlrE9HCiJHBFntYgQ4uLJFt9uRaluuOV9trfKpETxhryuPRmSlyoTvZIdvp6MVWkHvfaWPQuVDHaLF/UxRXvOg6T0lhwVf2qIDzSKbkCx/jeS5pUEXUa0mKk965OjxKXKGiai4B/nSce6kYcHMkm8hAaOm3I1NiZqA18trqPeh8/Tj1J/CwNcciHHosAgXC5ee6q2MBpJXdc3GS2yzB9DH2RczPQjBGx+7PcnEAH4LfG63+Z1AJZz+7bLkHrHYMDo+dRSn38XKCx7jN3PvZwb1ls6whwmSxi1C4JYlpq3WIPBrmpUgv5rQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9UZ5GkaKMKwDiuD29pmC/BCaBkruEG+uGZG3skHUWM=;
 b=ftIQal2E/NeOchJ5aOEXCu+CkYYcy32fPs3AIv0wqf9RnDwKk6qPFaJXBmlzI4xCaewMoGL6k2uaez08soQ6GL3Galtl7h6wya4SCFGbLWQz9XaMUPOLewz5n5v/FjEUFuMidVSEG4uOM8ANfSgftuSwQJfuwHIvz8BL5tCCHMs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TfjOtLyhee2AMKQ1C0uYD8mZgt9Xi5gXSZTuXaJeSJOMkH4PhYtKeHWfD53OgO59U2Mo1AX/4IYWRHADKwiFBpdBWowCMeG0ShwqZZLsmnAU3zROt4umBaDE7fDGqypTLHx849giRTVi9ciSBwRn+OIdh/4520wfLRr7yeAV2ab1AcMNjDa5oDVYe1oS0+SB64XL9k4B0Ik3x7nqBrK2+0grtcsBKiLYKQ0TH+F/pA7OoW3mVNPTCGfNGUcTlgQxZ7IPZdBVJEGfxSvJJJR6FnhCQaiyRdQIzh97PdKARRmymv9+JW3Qt0uJ2jzVQLBedIJnqf6Y/c+tNV9mQfwLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9UZ5GkaKMKwDiuD29pmC/BCaBkruEG+uGZG3skHUWM=;
 b=mUREbw9byL3knNwtk8BzHL+fCCFINkBIKNxmDU8xPNRRlDMr6pyX0pJDY0zNoMLv0qK6BvecYYcWVrDOuUfQyNcL20mxCrYYdWRvZEzaoHi7KiAGTIW46vE6xHKXLAa0LMKzQ2ySwx0vVd+PINFxr61MwvEebhukw0wONc4uVoQ+Hs7+Nhrg7wd04labwyQZHbni0rsAVJFuXeryXyFo84BdjSHmE5jqIHWn/Xdu44t9Fc9yYQd9lvRiprjjABZ2hnZQ7I9/CBmMTBlU45qc22Lyp8IIVZss4sQif0oyWVqV6AkUgmM5VPPew8W0Mk45I9Cz81VadNcR9qDKp7KyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9UZ5GkaKMKwDiuD29pmC/BCaBkruEG+uGZG3skHUWM=;
 b=ftIQal2E/NeOchJ5aOEXCu+CkYYcy32fPs3AIv0wqf9RnDwKk6qPFaJXBmlzI4xCaewMoGL6k2uaez08soQ6GL3Galtl7h6wya4SCFGbLWQz9XaMUPOLewz5n5v/FjEUFuMidVSEG4uOM8ANfSgftuSwQJfuwHIvz8BL5tCCHMs=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: RE: [PATCH 1/3] process/release-technician-checklist: Explain how the
 banner in README is generated
Thread-Topic: [PATCH 1/3] process/release-technician-checklist: Explain how
 the banner in README is generated
Thread-Index: AQHY2i0gGhV+BlE4RkGVTxUJhCuKKq4Crayg
Date: Fri, 7 Oct 2022 09:42:19 +0000
Message-ID:
 <AS8PR08MB799156D43366686870951A3D925F9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221007091341.58542-1-julien@xen.org>
 <20221007091341.58542-2-julien@xen.org>
In-Reply-To: <20221007091341.58542-2-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D3A78B58310C0446BD84D1CDED0DEF33.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9606:EE_|AM7EUR03FT027:EE_|AS8PR08MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 277ffbe0-aa5f-4354-84a6-08daa8484155
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2zITKZR3cNqeAR8MZ28oGMkTfOgjAyIz3E4OvOmVKS36ccb9Ic5gr8sSqA/+7xmanqA1wJv1J1FdbzNpA5MVI4OwsGQEAAVtB3tILDNzxN0N9eX05Po/AK+XVwIgt1tfZNnbVlD3sIAQ4OLla5pO/9iYsFQMtXq6tvfSTH41TEEpB3ZBWqkcbE11tmW1rysERnq5YznyNJFjFcqejZgVJfMgo1NOO6URx8V1KEiZdsCtDZ1UvQdIjBSvDf/h7I3GoY5XRJPflNRiynOeb9nCVInLUoUza2T4yZRigQIPqXzbIHCg40FFtVI2pWzdHHNUsnNHeNwA6vd1CF9lcyBned23BNyeYS5ARErtz0c1553cVx0MldRO2hUjf+G0EKxJiGWMY018BXJUNNsuqkbhoD5R5l1N8106v8jrrMh/FvsA9yhSrcE6DjXT24LICicaPMFv9TF3+jkqkFMFF8P5zuAZQ70XajhZl70PWCMzGUMX+ROYpGnHrYaNd1N1YFJQQHcvnwf7ccjc2W1LoDJiY3hTVDlQp2WDNDiiwvolBa9gRhnqYtHWsxzizLxXmley3HuRksv8/L/Ids1SHEay2rfASNK3USedcwQB7mHbejwDLDSPvk9NYSdb2iDMN5UlLRlxYZ14IOTnbjWCiQ6MwSOtH1dArsxBGNoYkCCKiPb5/G9QSTPNSIqVzRveo/MJGBxDK85Jeybj7WJDS2XAiQpVn8w55FvkQR7QjwNuc6F+EiqIjrYteSvWXH++D9nuIy8HEAkOrWwluj39Ip7u7Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199015)(54906003)(64756008)(66946007)(66476007)(8676002)(4326008)(66556008)(66446008)(86362001)(38070700005)(558084003)(38100700002)(2906002)(186003)(71200400001)(110136005)(122000001)(6506007)(7696005)(5660300002)(33656002)(52536014)(9686003)(76116006)(26005)(83380400001)(55016003)(41300700001)(316002)(8936002)(478600001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9606
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5e9284b-2569-4606-c099-08daa8483a29
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IUtdNOKSXK5NWGNsU6wL/79GmjD9+MCeOz19E6Q6W5M+hkutXuVrqfIo3nEESCSnguGBrGH05Gtw2YJ5scWBD54wxR5fKDM1rUC5Q6u7qfJFoTOzGDkt3i9BxnzRDNGZvMKGKHteFAvux96YAbWcVmsC33E8whNsJjgfn21wmhEFskOc55RXNPcVa8CIfUZfhPET7vOqtyaRtni5rNSXSLnnbE6HNLK1AXLzpu3CWpiihyQEuoQAOV2Xq5chW+97pjS2RRbePTDyuCvcSCnNBgfKbYAEj1i1qI3X0yKOEosd+Ef7BLQ+/5k8gOAkugP+tWHMLUntTeP5cM7qv1yD6w64e+RN0V5mge/v0PNnKj/9Uyzq2ccfVewpVuQ937Krtd0XTBzHxShKr4VCDA/cr0n+r3FMll7x7VGq/6lNDKYMS9/d5wSoXNreA4CjYkkPdQIf4n7Vb4oI3Eq20FKLXFU8pDGLbThlPkTYDXrPM5ZAxOpiZwAVbgWudqpIbazfMgYnhwMG7M9JmSOs/c7mXZQMLsZyzIvtkOYFmn/KWu8bCfm1ZNuwsHW1ZFVY5H/E2y2pOqIo3snGI4Ribs+bfY7vIxcVdNkSzpyN5/VCs495QaIrKxkfLz2yT5n4BcCv7rw+wo56zcPMWtoqS2HmPgXsrEY46/EyGblVXryjzZfL8oqcHLRGdk62U/N1Y217ckPYNSIFCXXtCW7PzhH1Lb6C8wWK09qLO5RhMhBUOKIZNmS3WAb2EN18gPX9VCpG6Hy9EPvBsGYWxnWWdqS+Ag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(26005)(7696005)(6506007)(478600001)(9686003)(47076005)(83380400001)(336012)(186003)(40460700003)(4744005)(40480700001)(2906002)(55016003)(82310400005)(110136005)(54906003)(70206006)(316002)(8676002)(8936002)(52536014)(41300700001)(5660300002)(70586007)(4326008)(356005)(81166007)(33656002)(86362001)(36860700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 09:42:31.2956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 277ffbe0-aa5f-4354-84a6-08daa8484155
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8182

Hi Julien,

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Subject: [PATCH 1/3] process/release-technician-checklist: Explain how th=
e
> banner in README is generated
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


