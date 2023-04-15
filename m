Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64E46E2F15
	for <lists+xen-devel@lfdr.de>; Sat, 15 Apr 2023 07:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521434.810128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnY0D-0002oM-4J; Sat, 15 Apr 2023 04:59:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521434.810128; Sat, 15 Apr 2023 04:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnY0D-0002md-1D; Sat, 15 Apr 2023 04:59:09 +0000
Received: by outflank-mailman (input) for mailman id 521434;
 Sat, 15 Apr 2023 04:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rrIm=AG=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pnY0B-0002mX-Ib
 for xen-devel@lists.xenproject.org; Sat, 15 Apr 2023 04:59:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e3724dc-db4a-11ed-8611-37d641c3527e;
 Sat, 15 Apr 2023 06:59:03 +0200 (CEST)
Received: from AS8P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::34)
 by PAVPR08MB9013.eurprd08.prod.outlook.com (2603:10a6:102:320::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 04:58:25 +0000
Received: from AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:330:cafe::af) by AS8P250CA0029.outlook.office365.com
 (2603:10a6:20b:330::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Sat, 15 Apr 2023 04:58:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT041.mail.protection.outlook.com (100.127.140.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Sat, 15 Apr 2023 04:58:24 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Sat, 15 Apr 2023 04:58:23 +0000
Received: from dc3e42969725.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C967FC9F-5404-4FA0-9D2B-05D2ECF1C896.1; 
 Sat, 15 Apr 2023 04:58:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc3e42969725.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 15 Apr 2023 04:58:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB8561.eurprd08.prod.outlook.com (2603:10a6:10:406::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Sat, 15 Apr
 2023 04:58:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 04:58:10 +0000
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
X-Inumbo-ID: 3e3724dc-db4a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrA8IWKKeeFG1W6ZwODIRDwRgiC2u6YdYMqxGQUzm+o=;
 b=WvOAY2AT389Io0Y6Q6dPdDw9PO3iTpM1ToxUBgWFRZUu1kyHN6lnyeKmr7cNGF4LDHXiy2RUXLZ4AU0gEjefE8sJBMpM3cmyA8jsSBaFeWjXummJ2GreWLB2Yx9PFExsnEj3PvQLAGeHxHKVP7cmSqj/GPvOvpdBQlZq2VTiYZw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4a3+jcFMIgHiG6inAn23eq7VZsLQrTlxxRrVXbGo4ggRBdMCpEQodGQozjdfiSn9DsDQ7WOhg/eTaM6jyk1V1CjE74JinKwpIgvipIY2cEm6IxJUwrZl6HpHjs1+7gLZQlwy8Oc9hJZ5fLILLMzrsUks7ofhUXUttA1GU0j9eVMUn1fcsTABV3wRx9NowgVnFcDbfyF55WGh7akwNJsGwjgSYS8iVndodf1tH3e0blp8OqpmUEWkQnWMs7y6iCke4GQVWmG2WTtRnHO/Uw8eeNn52SDp+4XR+1+EIXfk/iRSJ+CJFHHn9QWjl8jNRa8DMPGgFYAO0YdiLtVHE0KCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrA8IWKKeeFG1W6ZwODIRDwRgiC2u6YdYMqxGQUzm+o=;
 b=PoMstpCu/sgGcSt0zb2x8VJED3l9I3I9zt6BcfPZUI7peaHsAN7EYG6JzptDQwZctBHT2Ul3DWn9qQple7549qfWvv/op1as+fUJWBnbeFraEjTV9g6hcHQbVVxHR8SG6pCrkjzx1KIakrViIC4DN8HBMdgpE2YTZWdsAR8YiWPl1iPSqDIPNN1Oz4JTK4zcaPTEzo06mYQm3SjDFVIJ5MfGfTxGvqYTZV85v32OC9ZajMojSlclkw4YiGIag/lbIv+M8TsRUOJOz4oSMDTS3CX42Bh5ojHCvV8MejhnrPmu5ccb3pifru9Aa/xe+8k3/jes3SCSY2F4kWRg8EH5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KrA8IWKKeeFG1W6ZwODIRDwRgiC2u6YdYMqxGQUzm+o=;
 b=WvOAY2AT389Io0Y6Q6dPdDw9PO3iTpM1ToxUBgWFRZUu1kyHN6lnyeKmr7cNGF4LDHXiy2RUXLZ4AU0gEjefE8sJBMpM3cmyA8jsSBaFeWjXummJ2GreWLB2Yx9PFExsnEj3PvQLAGeHxHKVP7cmSqj/GPvOvpdBQlZq2VTiYZw=
From: Henry Wang <Henry.Wang@arm.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: RE: [PATCH 1/3] xen/arm: mark __guest_cmpxchg always_inline
Thread-Topic: [PATCH 1/3] xen/arm: mark __guest_cmpxchg always_inline
Thread-Index: AQHZbwMWeR0W8wxF2kqEL5lhRIkFbK8rm8pA
Date: Sat, 15 Apr 2023 04:58:10 +0000
Message-ID:
 <AS8PR08MB7991C281B7B33DB58BB1C130929E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230414185714.292881-1-stewart.hildebrand@amd.com>
 <20230414185714.292881-2-stewart.hildebrand@amd.com>
In-Reply-To: <20230414185714.292881-2-stewart.hildebrand@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 68CADEA0DBE95F40B02926A97DCB8709.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB8561:EE_|AM7EUR03FT041:EE_|PAVPR08MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a172917-0d1d-4062-7c39-08db3d6e0adc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Bf77KFEU5xIfyKkQXnB75sRY9w0y466ImvIDqLcbCu/Bv++ZbLIKoiuGFvfBg3yArxXI4KYZOi+IGPF/I/uxQsU1NZpDtjwZkrg3X58SfnSFiXfrxIEsh5zyuha5jFacGvSephY23H7egJKgVkqzaKEFNzPq7UkRscaGF9qBXgzrQnTAuiQJHlUOWrq8ynTBnmmTwNcGI0pChB0zN0puw9dQyChPXYlohMivcG7P3pb2vBCN+1s3j8sjGAUQbxAZBjbSVDIDdNXL6xJk0L48isSfFJJb0ft0jrrJBKpzJFTWxw1ztMh93CMm5j2UkhSWwwqCYc6ALlZxEKJcSNEs1V8LXTztghgz6e0XPKMIGz9XWFlsaqeNhDTm20gcuKmP50WaTEVYxkNR+hgGEVLwiBQsSJz4kQCYZxXmW+V+n8mCL93DoV9vMMYZ8oMkMnEhyD+ziiU6EHZwTB7rNT3WU5f2kXYbhCTAAizBhcmF9Ukns8RJ283igFaCEl9LLZbm6DHhgxKHPpZdrziWIOHHqmyGKHcPd5EW6kArnx5s65HdfMZSxhI5jYiy6BDjhrzd3lIyyDIfXxyoycvS4eeGT7NlfEUuQlPM0b3gec4U2M4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(54906003)(478600001)(55016003)(83380400001)(7696005)(71200400001)(6506007)(9686003)(26005)(66946007)(66446008)(66556008)(76116006)(66476007)(316002)(64756008)(4326008)(110136005)(186003)(5660300002)(52536014)(8676002)(8936002)(38100700002)(2906002)(122000001)(4744005)(38070700005)(41300700001)(86362001)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8561
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1899a41a-b261-4853-8d4c-08db3d6e029a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uHNtbOtWbnOrdkFRUL/AmeF+1tf1lotI/4DvYK5QV8tOroZDETIBIxqVI1sLhupSLo8ihoiqUvTCacRLQPlXhwLpOfNf7haJf9i50awwKV2UA5kuBO/NWhJ4npnoARgo+XvdgMfvEu5qI5woHIcbDaqbt3l+DTluWOGKbPAX1MkYdVJRQM8SA1tByD8nrdG68rRvBCCaLNKpPc1AMhJgIkaURhcq4gmiwymFgm5nCjy8ZLqAxbnwt1vmK3X2x7gHoKkamSO8HtnAFeGe+rts0wZgsg1wlT61qANAJ45/Eh/+SWbFqofIVi/kd67IFwfw4RasoIi8LjibgUxoEwBGiZIb2EXLZ19UxxkkcXHFmDa+eB0arDCBwLP+GUmxCL3EkzP2NHkoGQSXEGLfSHh1aPg2cowh2V1Nq/dmkoABwxmsZ8TnNi0jCuT631R+Q4e0gQhIU8wVsSu7es40yLShXzhFLnrUWCdlb0we1WtQrkLZhp6Htq9Nualywcixl0Tg3H2Yt88oWSasepSOj164Q0yBbS9nacYENrM9+9EslVm+VbqOHqxf4eyvyTut1JFKZimW8yPI3FvlDjwOhAyod9HdLhMn1sabeERTo/SbE5//TmnIWIEIpP8qvOcqa0wIrhlQg1tU78L1UG+B6iXzO3Q62mY+FPtRrplakhdNrCSLG4BAys0os7p1SfpDXsQWv7ubCNGCSBo7VBdmWbY+wA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(7696005)(41300700001)(478600001)(107886003)(81166007)(26005)(82740400003)(110136005)(54906003)(33656002)(356005)(36860700001)(6506007)(40460700003)(9686003)(82310400005)(8936002)(4326008)(336012)(52536014)(83380400001)(8676002)(47076005)(55016003)(40480700001)(70586007)(2906002)(70206006)(5660300002)(86362001)(186003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2023 04:58:24.0507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a172917-0d1d-4062-7c39-08db3d6e0adc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9013

Hi Stewart,

> -----Original Message-----
> Subject: [PATCH 1/3] xen/arm: mark __guest_cmpxchg always_inline
>=20
> When building the hypervisor with -Og, we run into a __bad_cmpxchg link
> error:
>=20
> aarch64-none-linux-gnu-ld: prelink.o: in function `__int_cmpxchg':
> .../xen/./arch/arm/include/asm/arm64/cmpxchg.h:117: undefined reference
> to `__bad_cmpxchg'
> aarch64-none-linux-gnu-
> ld: .../xen/./arch/arm/include/asm/arm64/cmpxchg.h:117: undefined
> reference to `__bad_cmpxchg'
> aarch64-none-linux-gnu-ld: ./.xen-syms.0: hidden symbol `__bad_cmpxchg'
> isn't defined
> aarch64-none-linux-gnu-ld: final link failed: bad value
>=20
> This is due to the function __guest_cmpxchg not being inlined in the -Og =
build
> with gcc 12. Fix this by marking __guest_cmpxchg always_inline.
>=20
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com

Hmmm I think you missed the ">" in the end of your signoff...But anyway the
patch looks good to me so:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

