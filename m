Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DF77918F5
	for <lists+xen-devel@lfdr.de>; Mon,  4 Sep 2023 15:43:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595232.928730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd9qx-0000yI-Ru; Mon, 04 Sep 2023 13:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595232.928730; Mon, 04 Sep 2023 13:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qd9qx-0000vO-OW; Mon, 04 Sep 2023 13:42:55 +0000
Received: by outflank-mailman (input) for mailman id 595232;
 Mon, 04 Sep 2023 13:42:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pUi+=EU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qd9qw-0000vI-Js
 for xen-devel@lists.xenproject.org; Mon, 04 Sep 2023 13:42:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2085.outbound.protection.outlook.com [40.107.7.85])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1c0b3a6-4b28-11ee-9b0d-b553b5be7939;
 Mon, 04 Sep 2023 15:42:52 +0200 (CEST)
Received: from AS4PR09CA0026.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::9)
 by VI1PR08MB10220.eurprd08.prod.outlook.com (2603:10a6:800:1bd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 13:42:22 +0000
Received: from AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d4:cafe::74) by AS4PR09CA0026.outlook.office365.com
 (2603:10a6:20b:5d4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.32 via Frontend
 Transport; Mon, 4 Sep 2023 13:42:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT048.mail.protection.outlook.com (100.127.140.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.24 via Frontend Transport; Mon, 4 Sep 2023 13:42:22 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Mon, 04 Sep 2023 13:42:21 +0000
Received: from 12cae7b2be09.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30DBA455-C699-4CD8-9FC6-C2C62EBBE5EF.1; 
 Mon, 04 Sep 2023 13:42:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12cae7b2be09.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Sep 2023 13:42:15 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB6281.eurprd08.prod.outlook.com (2603:10a6:10:1f6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30; Mon, 4 Sep
 2023 13:42:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::3cb8:2053:e853:92fe%4]) with mapi id 15.20.6745.030; Mon, 4 Sep 2023
 13:42:12 +0000
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
X-Inumbo-ID: f1c0b3a6-4b28-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agG9ptatKdCvR+p02190YvNp1Ai7bkxLcXwFOTCqJQE=;
 b=iEb56VOvwCHzlkiTIPYsc0N5QyOLvINjGn7ARhwLYFno23OqboXoTKw9rwrE4LnFq6Nj0jPaiPuBp2CPoAUrc7T7Q1tF3LBoKtUcyudLQ7gRbbBOslWMjQKxBye33md+fWGrqN8hjiCNb511lLs+JEXSV1oxHt//6AqF2KzJLSY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43d910ac2d884510
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlGmXPEaT7BRe3W0pnaZZGj4YBZ2xii8DBKqGObW74rCcbqcBvMjHUfNXs+ZbemhvBX6gZR56Hkur0l2GdRhylXd6ky0sQ3N8Tzt3tuRU3PU05ix3jTLh461bZZsUq6nM0xXfGK07VE3doteIoyuybuQVGVP+GZ1VSX88u3HM4kSAzQ4/lSWYe2XmnIkgMZIfo5Tmfs6bDi5Xt7GlrsRsNIfW2ngu/VNqoW5MR0XePgJ1vIZLYnvHFztjJWG3XkFJBnNnKKSzLCt/lATKjyiuAioVVOY0gx18wF+yKoQTKnDmLBSVtRNLZdV/UbWn4Hc6dV41tWdgTIqiq4pUSJxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agG9ptatKdCvR+p02190YvNp1Ai7bkxLcXwFOTCqJQE=;
 b=ldc7rSX48YIfGpgSENqPpHvVUnenvRgTYC3Dl5UgITWfgJim1GU+B6oLEJHxarWu3HY+922AYpCw0pXbB/j/DFW3QlKn0KKNg43lZ5/JDGs21CBKYEmpgeHkLWrfa9zvj1N6CD1o9LWWSJJ3Uv8YUZf/dLTsIrfDrGNOmY79g4dkXXyolKVw1q0V3fy9AIHiFDkySu2zskDu9Qa+SrA5vjMggDDbvN54slRHZHDQGOMwkpLhHMQ0Y2fSC6dZxJXeNbNZ52LQwDadyyOUWbMkCy2zXXGbqW77m4vbNDE4bhzvGyjzzGrVS65HzeogmU+K27pM3CSHLFOUVS2YLz8gqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agG9ptatKdCvR+p02190YvNp1Ai7bkxLcXwFOTCqJQE=;
 b=iEb56VOvwCHzlkiTIPYsc0N5QyOLvINjGn7ARhwLYFno23OqboXoTKw9rwrE4LnFq6Nj0jPaiPuBp2CPoAUrc7T7Q1tF3LBoKtUcyudLQ7gRbbBOslWMjQKxBye33md+fWGrqN8hjiCNb511lLs+JEXSV1oxHt//6AqF2KzJLSY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Thread-Topic: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Thread-Index: AQHZ3KWtdw8jwJKuHkKXZbII/FmnYbAKsd6A
Date: Mon, 4 Sep 2023 13:42:12 +0000
Message-ID: <7D7DA9F4-8B0B-447C-B35F-6BF53E5D0E52@arm.com>
References: <56bb2024-dea0-79e6-6a51-66e6c35a2733@suse.com>
In-Reply-To: <56bb2024-dea0-79e6-6a51-66e6c35a2733@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DBBPR08MB6281:EE_|AM7EUR03FT048:EE_|VI1PR08MB10220:EE_
X-MS-Office365-Filtering-Correlation-Id: 853213da-bb28-4c97-066f-08dbad4cc412
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 fLHuLRgW8BEpfJXvWpfI1bZr83Sm41AJVicmyhOJxhw04OA9buBmfFlYkhdHYb+zhthk8r2mrKY17swTVOv1BKvC10KKXHTuICqd1ihAY/k4l2BkcbKZeKLRU4RvbVDqoNaUyEbVx5pkuDcoKIjpnVAjxDDtfvzvFZvNvwEOF2XblxJ8IKthyHWpDSF6DY8DvMZ3/WeeC8TYdbQR9CcFGG5nKapHSeVc14YxkdagKlwsvMP7PgRmPT94B69kghnSRe6d0i9IWXNZ95rBdLBeYpRRjbFDG4CgRG1fxBVYTqb/Id0nKPPXwfGaD+L1wTJZuRplPl8TuFxIUVgJaZTUcLHIQhP+KwGtUNAeMDxYR72sWzENDHxKFmm1U1qXoAydc5c5r/7ajw6K4fy0XaE/ht6BPOgYeRBFn5VQwdXMVq7+HdkgIHto60inX+ZKgDcVvx+a29WpdIF5aoHyo9VreC0uTjlybgsWDO/NUP0/N2g/dKlhXiwqEwqUHzxOseo11cIeAxq1O4TCndl8G+HUQERUz/aQNPDh00dpzeM0C8gTuaEjh9C7CviqzvnCuVHG2o36HRDiNhBNWfptjB+aExV24onpc+mWfCWCo9Kxxg9IFWw6A1AQfYK9PzjYYBjkjQfMN85twOAzxVUrKniacg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199024)(186009)(1800799009)(8936002)(41300700001)(478600001)(2906002)(71200400001)(66946007)(5660300002)(76116006)(8676002)(91956017)(66476007)(6916009)(54906003)(64756008)(66556008)(66446008)(316002)(4326008)(6512007)(2616005)(6506007)(26005)(53546011)(6486002)(36756003)(38100700002)(38070700005)(122000001)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <15DFFDF37ABA2E46892F7068DFE9DFBE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6281
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	53889e97-4b3a-45ed-d3be-08dbad4cbe57
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ad0ub0CpejJzyVVTxkHuPtUHYoboARbhttxzY8E0aEFlfREzy+4zmUoTxXNJHKcyeubuO2vdFIMrrcbdHcDXgGZxUFrhzUf39hMmUNU7wQZ7IlTmzoUDWRD7wtxqB5PkLusiPWmUiKeriLgaXDZkn4PjrZ5Ldit8RZxF67LYJB2tv5xShX5WN+rs4MnZJAOPsySJ6SEDU7ZyH2I0dwi+6rAWovHkDa5cCfRI/HJzyYZsqey6/ASqt0P+wpsRqKVWA+j2Pi6ukQOoZAL0mzk1OuyDOQRl8crpY3ToOyL+Q6i8S9AbLBVxEzQa9bVSSArJwyn69vfKqycWdyzGFtIXktbgw6/I+s2GkrEPygOmWfDEYXFaIAJmN/784PDEvIxvje+EbIxgKCjJwOyZy5o8qLo4sipLrRB+Tdb39BDlgpRhf2uxn7+pFZ6QhVAA3rMX5s9CTOFL30jdpOhGD8Jc4Z8iJlvsATLm2A8h+cBc5T7Kz8HZAukcwnV+ZFBdXZB3k84y5qeqaGSDxH5w0zZvgGE1On0vO6eoIPqUZmhP5sKNXmbVTttlQLKDupNX4wNThJVCZNTQMTGFJgu/D7cHtD/RZSUOS5EJtUZAX55Spe5XHqLxEZldHPHQaD4mg8ER1YYOLj7v2yuDOUYLsr/3qBxrjmz41IEsnzfS8KbsF/bWBeLlI7Mx0xUIlSY2vYdK7Da7walawRjpRzGxhmrbrzbxLCd+7mu/vnpqCpvsFNg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39850400004)(136003)(186009)(1800799009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(41300700001)(40460700003)(356005)(82740400003)(81166007)(33656002)(86362001)(478600001)(2616005)(26005)(336012)(107886003)(6512007)(36860700001)(6506007)(6486002)(53546011)(40480700001)(47076005)(70206006)(70586007)(36756003)(2906002)(316002)(54906003)(8936002)(8676002)(6862004)(5660300002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2023 13:42:22.1067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 853213da-bb28-4c97-066f-08dbad4cc412
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10220

Hi Jan,

> On 1 Sep 2023, at 09:26, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> This using a GNU extension, it may not be exposed in general, just like

Nit: Missing "is"

> is done on x86. External consumers need to make this type available up
> front (just like we expect {,u}int<N>_t to be supplied) - unlike on x86
> the type is actually needed outside of tools-only interfaces, because
> guest handle definitions use it.
>=20
> While there also add underscores around "aligned".
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With the Nit fixed (can be done on commit):

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -152,8 +152,10 @@
>=20
> #define XEN_HYPERCALL_TAG   0XEA1
>=20
> -#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
> -#define uint64_aligned_t uint64_t __attribute__((aligned(8)))
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +#define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
> +#define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
> +#endif
>=20
> #ifndef __ASSEMBLY__
> #define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \


