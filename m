Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07887825DC
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:54:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587405.918774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0gG-0007Ie-3D; Mon, 21 Aug 2023 08:54:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587405.918774; Mon, 21 Aug 2023 08:54:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY0gF-0007FU-W1; Mon, 21 Aug 2023 08:54:35 +0000
Received: by outflank-mailman (input) for mailman id 587405;
 Mon, 21 Aug 2023 08:54:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=79xF=EG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qY0gE-0007FO-4v
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:54:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5803aaf4-4000-11ee-9b0c-b553b5be7939;
 Mon, 21 Aug 2023 10:54:31 +0200 (CEST)
Received: from DUZPR01CA0181.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::22) by DB9PR08MB7510.eurprd08.prod.outlook.com
 (2603:10a6:10:301::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 08:54:28 +0000
Received: from DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::32) by DUZPR01CA0181.outlook.office365.com
 (2603:10a6:10:4b3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 08:54:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT047.mail.protection.outlook.com (100.127.143.25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6723.11 via Frontend Transport; Mon, 21 Aug 2023 08:54:28 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175");
 Mon, 21 Aug 2023 08:54:27 +0000
Received: from decdf67073bd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 87B3C6FE-FB05-4D74-9BED-90E6443AF19E.1; 
 Mon, 21 Aug 2023 08:54:20 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id decdf67073bd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Aug 2023 08:54:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB9552.eurprd08.prod.outlook.com (2603:10a6:20b:61b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 08:54:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 08:54:19 +0000
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
X-Inumbo-ID: 5803aaf4-4000-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT+Iwelypa5jSG7/ijsvg7irY2o5+ZrC4sNzUyV+gmM=;
 b=pPaDOG4DCTiH5AS6OK69abTGIoO/HXBgF+I9kQ62vDvck60sH/97o/f1Xgaxo3tn4G0iksDuH0elxoIGVXOu+u+wlAJD5M4A136LhvaVecKAukheJe1SlxU+ms2fTemses2cx4XWZ99ai/vUO5xMR7kfaD5KJn9qwDzmNAzRxoU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0494657980b76d3f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPxqoNShdTS+izJpwsLU0KNrJ5zDjG48PdY/4K8HzsRJWxA5e/Gw6a4eYgepDy+O021lyPbAFsgfFjoh9bFtx2vlA+AWAyJBHBi5pfmxW0Yw2XuOncgxfkaYmd100Fm0JwUbDfCKjQszp0oFkGzw77V99/+qemehnlNMIPR23yhRsoyQIk4MtauI6SjgsAw0StC1GN2edY/XPEhmBTBR3p6GC28g7qQGL18ltN2ayTXp7co0aU9w/Kprse6UyYj2jEijXMI4gvQwhLo/h7ZELZAY0X3MNyGD8FKVOMLLZH6/tnoh0bdQibXsfkiiPidx9uy8HOt+QEf4o/4U0OujFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tT+Iwelypa5jSG7/ijsvg7irY2o5+ZrC4sNzUyV+gmM=;
 b=nHy9yb+id5idXI4rmUvThobco6ojQzakG5el8mSxzvnXZfEQAM7p4tp55VtRfyPiaS0vMcc56r09KwEECcO9wFH9VrryTZt15VgNjqAgQtNRyn9+WiQrhtRYPzFRLg3dqlTXoomlfCcC3gxW9OZ/KbTPeKu/ynWhdSNHPZgAwNTsGmh1uyLgJ5XEiDynbCuMm1E9dRw+3+mVQlKwXHVrj/CsJuwt0w1aud6IfmFK8V8I8p2h8wT2hZwsPuYvyU051EAJ/z/zhlcZZyM680Mi6t/oDtk2lwODctfRgxr/AVNyod/qYXPrRwhNT4iiyx6PHVEOokLbxj0kyqFXNoag1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tT+Iwelypa5jSG7/ijsvg7irY2o5+ZrC4sNzUyV+gmM=;
 b=pPaDOG4DCTiH5AS6OK69abTGIoO/HXBgF+I9kQ62vDvck60sH/97o/f1Xgaxo3tn4G0iksDuH0elxoIGVXOu+u+wlAJD5M4A136LhvaVecKAukheJe1SlxU+ms2fTemses2cx4XWZ99ai/vUO5xMR7kfaD5KJn9qwDzmNAzRxoU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <Penny.Zheng@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH v5 03/13] xen/arm64: prepare for moving MMU related code
 from head.S
Thread-Topic: [PATCH v5 03/13] xen/arm64: prepare for moving MMU related code
 from head.S
Thread-Index: AQHZzmd24OlLZqf0JE+rdrv6VmJecK/0eo+AgAACuQA=
Date: Mon, 21 Aug 2023 08:54:19 +0000
Message-ID: <0D2191B5-C084-4AE7-852E-A18A555C93CB@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-4-Henry.Wang@arm.com>
 <d6afb536-e0b6-42fd-81ea-cc37c00192f7@xen.org>
In-Reply-To: <d6afb536-e0b6-42fd-81ea-cc37c00192f7@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB9552:EE_|DBAEUR03FT047:EE_|DB9PR08MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f77d40-8c0e-4ffd-1dad-08dba2243a20
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FdumkueKND1gDXvI99T29ZBT0HtWst4RTGwasLjTgZQklH1GsXk1RSFFOdxn+Hw8g0wMlILKJZHHhlaTYsrYft7A219ibal2T2FpUvLk2ZfeHvz86KE+OaVHRJExO4aPt02SpHJQp+GBseFwo+9nrmBWBENhCZJAMkBSEjGFsQ3uY2uTFrZZQ5xSnzRStJalX7z1EuT2er3e1HRKJrZsbo8WTrydGfzLHmH/e41ac3YAclDGFCqWjW6lfyp/4A6cMFLkSoapq/BN/LbQk0QMJE++PnQKKQuWG78649Za2cF6T8j+2ZZXRlHu0F+TKjUd80sF1KNo65PQkfLA0QYiAcGIsuXmvymLeY4AKFsVNm/yMPKmZnnMaMeRqS3VpKyQB3fIfZsavGnztQlfOMFlX3ZKyLRSdiGq5JHMi6BlYyPTcN+Gq9BJvnW+2XIALa69uLdEJo8JPXviadFrUkYA0wHcZUAxASnUy+kgTZVEooQGr35dfLHyYUFGfWNCyvlQE4zZ2Fi5iddWrkk0v57ReoCp5hqlf97y+Tf/DC2wtyB04nswonEWsmzwitZw3qfCwdYQURm0Mu/a5A6rPk0VhUM9y7BbmrYj5zIdX9Vh1a7O5cFchNVNVv7/7bn9Ob62IKHeWCEvkSBdaMknpD7lhw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199024)(186009)(1800799009)(2906002)(83380400001)(53546011)(38100700002)(38070700005)(6506007)(6486002)(5660300002)(33656002)(26005)(86362001)(8676002)(2616005)(8936002)(4326008)(316002)(66946007)(6512007)(64756008)(6916009)(54906003)(66446008)(66556008)(76116006)(66476007)(91956017)(478600001)(122000001)(71200400001)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CE1D9712BF6B7B4B8B3167AF4798F650@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9552
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4e891464-c14d-49da-6c04-08dba22434c6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yx64Sg9OABuvx8QIuiATND2oZA20gbMwBglSlNh+vz9jmZ/fEL7Q9Szuw3BhGGBQZDazCYUSAKkoUrKSPKoGJJC5bEtDiWCbF8He+Z3qCo9mCUsc4p4yDfeZkamVur+HSQsQj5xnHGEeNOw0Twdc2XatjIqOACfbTdjIZUav1x7mhDN2hd5MIhclWmER+dyHhqoPO+00Za4cf72B2DonL77dvxMxrELG7OWhmurxJkjN766+rmKj6jaSXjfWTLycyK7MDtYA5kYSRxVy5kCVfZ/XpBIu1ai5+UliKg9D8WxAjGUiWzuCsmN4HvoO0NWvWzGGrFjpaQMc5KOxQ/pB2M/tTYdK4HnMpVURZJZdXmcbCTc9HvDKd/8DhniaX1xZ8bOCgGsU/KIJi2OQnPUd4AQ0K6bKjPyGBi3LUyevGG61RYvbHabDLImUvbwf9UnzIpx8kWdlPGj4QzOkMEz3tfXRsdxwbALfwRwbmiGdcLfWGloyVsklf6ETIrx4AAZLSJnU6Gyz0bgzYQtgB2R77/Lx+zYQf41C1Um5QL1CPz0P0saoLYJzasPJH7pOSWlnGMjCzBjUYKKXZWTmPV3QPVh5vZCLl92Z9Rf+0FijCa1g/BzjoYvnWp50WpZABrI5RSwNCjMre87EkxHvGpSP+WPaJjp+e6Hpiz8qWmG+JYe0/RiLcKwKd7EtgJq+IthO1MYJYtJFNIrM5ivgCpKp4hSdtQah65lLXbZdwzBj/TM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(82310400011)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(83380400001)(53546011)(40480700001)(6506007)(6486002)(5660300002)(336012)(33656002)(26005)(86362001)(36860700001)(47076005)(8676002)(2616005)(8936002)(6862004)(107886003)(4326008)(70206006)(316002)(6512007)(54906003)(70586007)(478600001)(82740400003)(356005)(81166007)(40460700003)(41300700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 08:54:28.0606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f77d40-8c0e-4ffd-1dad-08dba2243a20
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7510

Hi Julien,

> On Aug 21, 2023, at 16:44, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Henry,
>=20
> On 14/08/2023 05:25, Henry Wang wrote:
>> From: Wei Chen <wei.chen@arm.com>
>> We want to reuse head.S for MPU systems, but there are some
>> code are implemented for MMU systems only. We will move such
>> code to another MMU specific file. But before that we will
>> do some indentations fix in this patch to make them be easier
>> for reviewing:
>> 1. Fix the indentations and incorrect style of code comments.
>> 2. Fix the indentations for .text.header section.
>> 3. Rename puts() to asm_puts() for global export
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>=20
> Is this patch depends on the first two? If not, I will commit it before v=
6.

Good point, no this patch is independent from the first two. Also I just
tested applying this patch on top of staging and building with and without
Earlyprintk. Xen and Dom0 boot fine on FVP for both cases.

So please commit this patch if you have time. Thanks!

Kind regards,
Henry

>=20
> Cheers,
>=20
> --=20
> Julien Grall


