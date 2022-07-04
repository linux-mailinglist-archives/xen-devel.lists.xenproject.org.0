Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6535659E7
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 17:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360426.589800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8O3p-00051A-3k; Mon, 04 Jul 2022 15:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360426.589800; Mon, 04 Jul 2022 15:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8O3p-0004yY-0j; Mon, 04 Jul 2022 15:32:29 +0000
Received: by outflank-mailman (input) for mailman id 360426;
 Mon, 04 Jul 2022 15:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TmxG=XJ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8O3n-0004yS-94
 for xen-devel@lists.xenproject.org; Mon, 04 Jul 2022 15:32:27 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10084.outbound.protection.outlook.com [40.107.1.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 812a9c96-fbae-11ec-bd2d-47488cf2e6aa;
 Mon, 04 Jul 2022 17:32:25 +0200 (CEST)
Received: from AM7PR03CA0006.eurprd03.prod.outlook.com (2603:10a6:20b:130::16)
 by AM9PR08MB7273.eurprd08.prod.outlook.com (2603:10a6:20b:434::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 15:32:23 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::8b) by AM7PR03CA0006.outlook.office365.com
 (2603:10a6:20b:130::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20 via Frontend
 Transport; Mon, 4 Jul 2022 15:32:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Mon, 4 Jul 2022 15:32:22 +0000
Received: ("Tessian outbound 4748bc5c2894:v121");
 Mon, 04 Jul 2022 15:32:22 +0000
Received: from 939c21efd9c7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 759CFC7A-C2B2-4285-9EF1-AA5119A3223F.1; 
 Mon, 04 Jul 2022 15:32:12 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 939c21efd9c7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 04 Jul 2022 15:32:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PR3PR08MB5643.eurprd08.prod.outlook.com (2603:10a6:102:84::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 15:32:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Mon, 4 Jul 2022
 15:32:08 +0000
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
X-Inumbo-ID: 812a9c96-fbae-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XtNjUZxnEX3FRJNYZdyoZukY/y4vUoYGsKGMiav0Q/ISCvyO2/NXkFoMmuwyH5tFfv6mm6kC/rRCt24u4ivPO9lJ6VUtdidcYxEzvpd+K8QS8J0V85jf+svCbPGxipUMiYlPYlN6Q+oBkV4kZAJkrNUW+udP8L87Sc8G8qhS534VU9N5Ecjg1LzPejIdeEgWMOUEMi4RrGSHVayw0Ir0+gbRnw7P8unqghQvqtM/n8/hT6UJTRFl9T5p9SvZaMmZ0nfC2RCq9RwSNCop0IbAvypruD1bCdotoE4R6pYHx1nilR3CN/Yl3uwb0xydcn3PTdi894lb03sxmz3Q4H+/Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6wIlNqk0sRucQ1IocjiLeLyZ6yR1ecS/X+7m7HfrW8=;
 b=CcE38tGKYeSbers1kRvkare34tpb9aAaMg/k7lYN3Z9DAI6w1ddKgF/uWfh8siuA6chaZZnyaLUBY9sapjovZrmemFRFLlMR5zVF4PfizecCta2PHI8VP6TfezFGwS1E9lKxwK+wep5hwsH/Ms2N0o/lXP6zhNlqT33h1f4Uig2ulOIAGFSbNU3NEh26w0uPBzJG7k+28leVG0gVT7c+nU3uFRlgW/lTB31ebO7vgXBF2L/2odQZQcsyn3u/QPu6xbHlbL5rUJYosgmS0LjzEQaT4V9fVIjLnCR+CYoItXnqcyAyQMZ/YZPpbTLEA+5ph1GKshA2FPuM46yzW3rh9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6wIlNqk0sRucQ1IocjiLeLyZ6yR1ecS/X+7m7HfrW8=;
 b=D62sJj3fjKTy053eptOG+4eahW2izN/xHyU/Nsdr2/cxsirbqVccgLUJcxW23bYI+ZTwjpen3jOnM0rEjfeROT4RjLAOcLE6grwloZb+RGrjGDWeXe/pfOsl9CwFZ9Nx4yvGm9WEDPogwrsbC5j5+hoK2zofiA+ZUcH+AkE2fxc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5ebd7ef240e01c3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK5MXp7SbcIyJZJB2YLMxuwmTFB3vlgQB7Id/FK+It8AQznaUrVizn1ewDA+NCr9lEv/CA/IHjgk8ORulqdrJG+5xJh2hxTZjdgwlPg7Cu2cwUR6F7dZMtA8Et58J27rmXkWh5U/KKg5FX+zLN4ddD50qH75zsOVOGviiJhf24r0r1oGkOpTjMyUL9Q8IA2hyF15rmiJ9q5NwWMMv82y4d2NNTDPdpD2ZOnNNZ2rD1MtKMLF7bwzblidUt9/cRlrA0vybAke1GPjgnFFjPgsTzrdAFSa683hOEIi7cMKGL+o3n9dm2nFIs9QKiWSjeVTnJ4F6h9c9tz8PK8hXv9+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6wIlNqk0sRucQ1IocjiLeLyZ6yR1ecS/X+7m7HfrW8=;
 b=UbAGwzIg46gwH9SwZ3Uo2WG0oDkZ95NPJNaNeOSNYouzF5Jj5hG0FcDt2XK2kOSI03LiAIPqihDofkd8wevzURrruNnXuBhR/vOdWNq/IOxEFh3zllPlwFJr+m6V8ehxvY+QZ6MCIUomBnZ7YbhzMgr/H4XXPsEsaqJzHx6iDyMevUBSp2s2VoGnRcj+I4pgQZJHAm0a9kK0CAIXOWyx1SLmJSLXA6C7hKzN6moBmxnkXttBoy9xYsGJqzRSVuhoDKqQdXBjYgD0SgLk6cjQLcNmnbpdWHB6BPZ3OknD5bvvL6keIXyWov8Hdsw+DCgkzpsmTV26LxeHcTXQzEQS0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6wIlNqk0sRucQ1IocjiLeLyZ6yR1ecS/X+7m7HfrW8=;
 b=D62sJj3fjKTy053eptOG+4eahW2izN/xHyU/Nsdr2/cxsirbqVccgLUJcxW23bYI+ZTwjpen3jOnM0rEjfeROT4RjLAOcLE6grwloZb+RGrjGDWeXe/pfOsl9CwFZ9Nx4yvGm9WEDPogwrsbC5j5+hoK2zofiA+ZUcH+AkE2fxc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/helpers: fix snprintf argument in init-dom0less.c
Thread-Topic: [PATCH] tools/helpers: fix snprintf argument in init-dom0less.c
Thread-Index: AQHYi7a+fNYcHW6FA0KjaTcd3mPyJK1uXwKA
Date: Mon, 4 Jul 2022 15:32:08 +0000
Message-ID: <4DB9F3AE-0BCC-45BA-9934-0304FBF84E82@arm.com>
References: <20220629124938.26498-1-luca.fancellu@arm.com>
In-Reply-To: <20220629124938.26498-1-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0334637d-ce75-43d3-bcd5-08da5dd263f7
x-ms-traffictypediagnostic:
	PR3PR08MB5643:EE_|AM5EUR03FT060:EE_|AM9PR08MB7273:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 s1EV+8GiNDH29PxdoVaf1Sr1WJoLmxNMar61SaXK3hCmRsxeIIvw51H4zrz3xsYn5mHFQZ4OJznPTGYN1w8xnsN0w8zPJg2YtCvNnM0GSZG3uwqa/1ZXtGQYiy0pSfJj/+XicyP7CcsSFIPliaEq1B2ULlLPDlsbE7poZbV8xV7hLPcCgOCuXbAburCIhDtJPAw/ljcqkb0taWbl3NI//TEsdSPUY/2VJB5kGKqBBn/PdaxZ692Iciv4iqp1Xod58clm4aGWBY2b56mOQKC7HKiRfmFXVmlAx2gC7Q2dKGRjMFPJ+kUQfvIL13z7W4Cu9Yf6UUTj/oahTYoQ5TUD8l1DwgEff95UANgCdKWi4iPd8EGrREznJg2n5o78iNRwGroe+UHo2+bQn+47Vh+l855htcWy2hUULPz5nzJLDS2XymLvuT6wb1w0aiwbfHjV56c5dFcp633nccD4pdbDIDFNTMrVesDYhlLkpYR8FhMP8Y/Xd0tTLKrq/lLAbYhoKLUCI/8RYZ693eyxl3oaDovWyjTxQfDvxHnX6GmdB1R75bIbYYVi3lQALqDo1NCKm5kK4zNG0IBFMT9JNNGIiRCNqL90m3kfXCY5XoNe8Y8+RCwo9T9cAIMSjDAoJDJSDdrTzwVNTSjKHBRvL/5CYMnumAJ3Cw3oBhq20K3ypzVMVMU3Ls30ATJvHLzZBCGUIKJEgJJyPGYuOexCjX6x5VwBzz8TzQtSqkNbahPPGTNzWNM4/iNY81g6CDq+uhMX5P80b3sSTGJxM758pAVm6CaQbfFHxLu/j9w1aTt+/NcJ+A0jF0b+gOvDRcLAeki6wJFpI85d7PInhk5cDA5CMaExGc+Nid+j+8Nc371J9uk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(54906003)(6636002)(37006003)(316002)(38100700002)(8936002)(66556008)(6862004)(2906002)(64756008)(6506007)(8676002)(5660300002)(66946007)(38070700005)(53546011)(76116006)(4326008)(26005)(6512007)(83380400001)(66446008)(66476007)(91956017)(122000001)(33656002)(36756003)(86362001)(6486002)(478600001)(71200400001)(41300700001)(186003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <68B7B7D08C9547498E0ABB2E101B3D4B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5643
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da95a06c-51b3-4eba-a991-08da5dd25b5f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a/FwSjaTI+YywV35kMUpci4rL4SHRvWDXbWlxJ2RnDjlRfWBtp1f1SDCBMB2H2K6kDn+m1kKglx/pteZVaPrx1VmSR1ySkrSZq8FVuP7yAL4q6XH37wfyxijvIeY9v+P/nL8UrXO4ldqmCRDVj+4aqwwOXRTMqAws46G1zPu4wrzIPM7pAgmta+1M+DMFqj29s6a/w/213NriMe2yHg8i7iSrXA1CIBossDDT7mn09hm1XwXaYnsDSzfiPPww1UOHjCYPT4Z8IPPF3L79wQotKBAppLjWq365AXL46GrxrBBRtyxrP6IPW0ECHURdq0Nvig017MWbvQvRN2sVD/ilEdMsbojzTloLOl0EJFxiecPNtvLDS5RixsmZ0Tr2Ra1XTK99K7EWSnDHt3AQv0eQuIgaGGV/U50mjKP7JXMY9gvjgiHiLS4mdLQTgKcaQPXr23hr/lBZzCcIw6MVFA/tyQM5bJxFzRvrtSQV/Yqhp17ibuvqFGDnBQB1iH7c2x7PuC2SCmsEqSeyoGFYVRUcUVPOgk916TpHRmvThLUoXOF28R8JBfSadYg0IspMRMY2wOizhBEDdthxq+jNY1jTCvuzZfaFDRMJCSno8CDymVO0PJpHkNT1ODHXdXLNR8B9y5i1P7YBSAEOGTJeT2M4cr3q0yuz+byVFt8BUxoCL6C5HzmjXQJNPxPKWtW2bmtkmlkK2OD53MLABTKcIkR7dgzSP9DCJ1hWRjSAOTUymVgaasDhGZjr6kIUc+3/wEvXH3GJZ8WdjqDFDtD0b459YssfnWCzf/OGjCTfN3hO+M4EsNkCE4A59m7CE6dKpEX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966006)(36840700001)(40470700004)(83380400001)(82740400003)(36860700001)(336012)(2906002)(6486002)(356005)(40460700003)(186003)(478600001)(33656002)(47076005)(40480700001)(36756003)(82310400005)(4326008)(6512007)(316002)(70586007)(70206006)(86362001)(2616005)(107886003)(6862004)(6636002)(8936002)(54906003)(5660300002)(37006003)(53546011)(26005)(8676002)(6506007)(41300700001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2022 15:32:22.7447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0334637d-ce75-43d3-bcd5-08da5dd263f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7273

Hi Luca,

> On 29 Jun 2022, at 13:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Fix snprintf argument in init-dom0less.c because two instances of
> the function are using libxl_dominfo struct members that are uint64_t
> types, so change "%lu" to "%"PRIu64 to handle it properly when
> building on arm32 and arm64.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> tools/helpers/init-dom0less.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.=
c
> index 4c90dd6a0c8f..fee93459c4b9 100644
> --- a/tools/helpers/init-dom0less.c
> +++ b/tools/helpers/init-dom0less.c
> @@ -5,6 +5,7 @@
> #include <stdlib.h>
> #include <sys/mman.h>
> #include <sys/time.h>
> +#include <inttypes.h>
> #include <xenstore.h>
> #include <xenctrl.h>
> #include <xenguest.h>
> @@ -138,10 +139,10 @@ static int create_xenstore(struct xs_handle *xsh,
>                   "vm/" LIBXL_UUID_FMT, LIBXL_UUID_BYTES(uuid));
>     if (rc < 0 || rc >=3D STR_MAX_LENGTH)
>         return rc;
> -    rc =3D snprintf(max_memkb_str, STR_MAX_LENGTH, "%lu", info->max_memk=
b);
> +    rc =3D snprintf(max_memkb_str, STR_MAX_LENGTH, "%"PRIu64, info->max_=
memkb);
>     if (rc < 0 || rc >=3D STR_MAX_LENGTH)
>         return rc;
> -    rc =3D snprintf(target_memkb_str, STR_MAX_LENGTH, "%lu", info->curre=
nt_memkb);
> +    rc =3D snprintf(target_memkb_str, STR_MAX_LENGTH, "%"PRIu64, info->c=
urrent_memkb);
>     if (rc < 0 || rc >=3D STR_MAX_LENGTH)
>         return rc;
>     rc =3D snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
> --=20
> 2.17.1
>=20


