Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ElpDSvTAWryjwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:01:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFF250E71F
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306136.1578202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQFn-00028n-0i; Mon, 11 May 2026 13:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306136.1578202; Mon, 11 May 2026 13:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQFm-00025z-TA; Mon, 11 May 2026 13:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1306136;
 Mon, 11 May 2026 13:00:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wMQFl-00025t-DR
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:00:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMQFj-004lzR-8M
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:00:56 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01d2fe-2eae-0a2a0a5409dd-0a2a4504d2ec-30
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:00:56 +0200
Received: from [52.101.66.1]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a01d307-1dec-0a2a45040019-3465420141cf-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:00:55 +0200
Received: from CWLP265CA0539.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18d::16)
 by AS8PR08MB6279.eurprd08.prod.outlook.com (2603:10a6:20b:294::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 13:00:53 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:400:18d:cafe::f6) by CWLP265CA0539.outlook.office365.com
 (2603:10a6:400:18d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 13:00:51 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 13:00:51 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU5PR08MB10635.eurprd08.prod.outlook.com (2603:10a6:10:51d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 12:59:45 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 12:59:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LdRvRyiZ1uU2e8OAejhISg1E23+bu1rIY2h1LZsDAeKSSFqEsuZHP/wcpCPnRIiPFLjE9KYSfWKAXiGm1aYCeH1FpGospFCWSFhprcBAlEX9CkSBnuf+DjRHDijGhNEUX3HgB5hR8z+JoFeWvIsNuQ+3DxB/rnL+26535FrtHcIBmlaYqdaTisyMEgEE99FcOuvzT1x9FncvbK2ABMa2AM9CAabBxmiTVwaHtnmEqlYWDWq7ldaFxMhdtIGfZZfLlm6R35g7CEe9jtdVGkI2l0nrt6lWY2uB/pNBbVTyJwZ+1cDKRjWDFyO9+IiqR9CMKfe2rknekEGgkVhT3H/kYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHQ6ELv4z7rKgce1afPVoeXUmD67Zg8B2xFMpYIteCI=;
 b=qNwQcS2kP0h7/GRQmvXW/KBP0bsDVjwjgaC9lVd2v6zP7FDy6QKPROMtwVFJ3jU4xmLHo9kmyrCe7vU1E0OCSz9+h2AemGKeIbteXlDBFUn5/xaOLVM/CVRTMJlsxdkn19ExTSixFf/S24MJ9yR4SUmBTKRVHcx/tSD7z7oTxK62ZGewOM06CaGH7FTiptuhSdNBxoz7yhdS0fFgTeOi4ve3jdDHOAVUaP6tOG0XV1zpwv1h/K4Fbu/F4nYd0pAsnrRBMDma3WA/To2PpMMvSo46j8imkJRCW/XKDx1+OOKAkEvDuSki7FmF+Kcvqa1XJ2O3Ol4ZVGmCVdwg9+r46w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHQ6ELv4z7rKgce1afPVoeXUmD67Zg8B2xFMpYIteCI=;
 b=qGFh8gqYm8kJcjM+UbQ3weSKsb4w9sP8LMA+8FU6JcHYZO84eofSzOgnQq6D3uJjZevAN3inJlybYqizeOoPONqJH0zuEQFjQVwH9oIeGXOFE3AWBIpXUe2EMwd3D88TttdJNOfOuqkFQ65vpl0hOXbPTOiyi5fPLesGjC8tS4c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDb/3JVLSh4wHM3Nq7qgA7VICSqjyaaenJpPJ1NPtuZBOXpLMByDeVns1bkeZtg7zRN+51G1kJuKO3DBLk1MKdhg9qMEc4m726c9Wrtm2j8VpilKdVMFjZ1tmyBkTjOsuB8lU/a/Z3nBGmrI5CVryUIgKbnR78HdQsiOnpDMs0Db9bD04Q1sVkJLtNw9QRetiN1n09pzti+L8uHWvxo5nPgxYvRhs3Hq5jqx+z+9tUE/VXTx2XYDCVFsA7TUuKmNVBIyZdEi+SS3/pwYWfx9dJkqr9ZeDPjPxyfyvwOIHDbq9T25P4SKb8thgBNgdoI4JxbIHMZyUQd3pfJoUpgfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHQ6ELv4z7rKgce1afPVoeXUmD67Zg8B2xFMpYIteCI=;
 b=y3L7qbZZxoLGH4ESxXuFDr1vEn/EHRLY18GAYhCs8F2NcpHuPt+a1kkob6igYFgV3BuXzGn2EqRM7SDUBaiQ2CvVGlPkobv1UgFSAsXgFEXGNCZjE/j0s8mvbip7S2/p5UATL6pQ9L/URXKFp29pDHjQ8jcVDwMPg5nVlG5+lKVB7IM3ZI0uW9OrHqMiuQNIXaqitZYMBqXCm+B2NApK6rBLaIcvT18F5JSPHul3ZL/QD0DFCJkM0/l0ietnQ2u8gx+UgLuFThMipPQoZ3cc0az7hrP6olEzj1iuBs0EphNXldrROteFlFvN/cOBU1KQjmRtjTPzU2tWrBjbQNdXCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHQ6ELv4z7rKgce1afPVoeXUmD67Zg8B2xFMpYIteCI=;
 b=qGFh8gqYm8kJcjM+UbQ3weSKsb4w9sP8LMA+8FU6JcHYZO84eofSzOgnQq6D3uJjZevAN3inJlybYqizeOoPONqJH0zuEQFjQVwH9oIeGXOFE3AWBIpXUe2EMwd3D88TttdJNOfOuqkFQ65vpl0hOXbPTOiyi5fPLesGjC8tS4c=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Topic: [PATCH v5 2/3] arm/mpu: Introduce `v8r_el1_msa` device tree
 property for domains
Thread-Index: AQHc3vfGpFkxMscyakiMWMN4gJbZfLYIlReAgAA46oA=
Date: Mon, 11 May 2026 12:59:45 +0000
Message-ID: <33A78E1B-35CA-44A1-BF1F-C9C7E968DC77@arm.com>
References: <20260508143353.3512004-1-luca.fancellu@arm.com>
 <20260508143353.3512004-3-luca.fancellu@arm.com>
 <d18d7536-99a3-4680-af55-316e64b9e01b@suse.com>
In-Reply-To: <d18d7536-99a3-4680-af55-316e64b9e01b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU5PR08MB10635:EE_|AM4PEPF00027A63:EE_|AS8PR08MB6279:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa5fd0d-5593-4b4b-93f5-08deaf5d5442
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|11063799003|38070700021|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 K1qGPb3Qrn1iSQ2GjaNO8n1Zy68J3riD170K+gXPAjKHNFDxRQ2wmCBU2xzB531gLj0E+M36xrHOfDtPxS0KYiinHBHZJsfmR1ctwX5R+laHb1te8cRMw/f59wEHdoPfn4ed9sZ7igPqFehq8D6qJdVCFY5ZiUDisGTbmsbZYRyg2zLqYgX3DcZEhgYOyRg3xIwZewE/UwJgxk0bJtO02Z7otdxeGY0i5TvkcY0/g03mhTWICyfvU6WC+ZO1w68JxRDllX8pAmwk1edX1XJG/1oCPKy/0j2zSB3/MZLXA8+HGCQwYV8BNOa8fS4KSaAMaoP1HeUpY7rt1yBOB9JMPaBBKsZl2X7xszOI3ZmIOBPQ5fI08UYvTTXf6x0dqh0uCLv75MvW1dgENiRpxr06Qxdoh+nehTqHSF1CMXZCywTLnZko/ApJoFoLwb+j8bzl20OMlVhzoPsYHhOFAd9lo77/iTpwa/SjszKpcwA5IAmOowlkhj39bRGcluFPtclduO42tPi/+Is4IUf5LwYqeZJR0/kYgVAu56K1Pwnuqeqa566IZZXvqVCwVwugLgwVD6eMlCvcDNSHV0Fc9FoQ8n3bbPxuuN1wjHPWbgjq5PRf3DnjC4qQB9Ge2RRkUSMYBGs66RcIHOstPjpWphyjj+L7rfmkPFMID/CjGSC/k5NId2sz3zfq9D3o968N79/ffkFIXcpVPIGNRZ2ZC9KYXZO89tbyDOMLVjskPFhukehEQiwSjiMqjndpz6haVdyc
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(11063799003)(38070700021)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <006B0AE553B5A64680A592BE9F1D2912@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 WK5chqChn2EuZuJzaRDmx0DH9LuuPkydCL/S1F5IVhiJnVfIFBT7lqbrXwKOZav94Itqwl9+HNQi2PfY0I2zAV7UrAeq83h2b13DCT+Xlwv+xYH1yzmjJOsCKPuWuqAFJR5XV6s3yXmWMjdsqAse/uQDa3ieldW2qcyynll3GH8iFSwnIXF87RXhgFQ5glh25u5E1FyJ1xgIaekgDw38QIG2amq3pQPiRnlIebvSFdAKkQnoBxqlcCqbFQL0ZWY5lpX2tgyTXnYXUmhQ+u92pUCYQCsfqZSTgTWmwv90Yk/Y5bLmzGWicx7XxU7JARI4Upw6/GrfKcXBaTb9zrAXfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10635
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5c367e5d-7e87-470e-4575-08deaf5d2cfe
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|82310400026|35042699022|376014|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bq529S4e6R6175dYH+gqth/HhtLPnH3AQW8exWJxXzjD2DRnYar2Pkd6j8SNCnNlmuK6bqXbjulaeMVF/gDlYRufc+6syVlKPbzI3B+6a3vfJyR2yx/EBcNE00/76tDp2pnUtAKsNqcWqCJfInGuJDVbGFJhE8OGS3hWIfA++PZ8FOYOT9xzF0G4reIaJxySyZMGMN14/7ue+F7OTIh6oFfszwV2Yd2RhKdCukFQYLVduVbsFT/18zio+KE8KDKG/b0pKF8aXLZIVX1nnjvLQ6Mff5yWNesj4DWzpR3QotTvKuLS0OpqxoGCPsiZSMc7KO8TM5pwT2Pr7JhTYpjHrhJ/KkNT+CAGFwWIwxmur4dNBPbDobfqC2ZNh6/3dDhO0zcZO8rtk61P8ujeHStyjndy71uCtVKzSzX5z+Gd9Zg3SHXuPtCmaqeAUDXImmnsI7ezyDPzB+mKlpDORZa5P5UPU/VcN3yyDOvy6bTdLUIopuykxAgNJNQNZ9F4tDhOYSHSnwr3XcC3N1ERM1C5Wsv8pYr9f4z3Z5kST8ljH++NE9b9FckROjM5DYJvDF4tnI+A+INmAnIC8xbHLGZRdtNJwYCZnm636IYBGORMou6BBrvW4kJLb81RcVTuSDMAoW8bLu+N9phXL9hyppnZHDnaH/P1G4J5SN+tv0QkUSv8dWZI5LmZsQ6JaoxTy5Ny4tvZZSAeNLgNLsCsVQpEceuUOO5dPeYaGR1VCc2dtOE=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(82310400026)(35042699022)(376014)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IDL4av6ioJS9Oz+LN0A3wyXW9KUsY892AKLoasavoXFrQO3eiK+HDjzQf8A108JdxPURxKs8Pyut9bRbIuyEpyBPVFo6k60VaSeezCnfBHPDulXVEijJiGenNgZss7JF25s65+0+FMYjakfkW89gOaBYlFqNFahfOmOsTUHlhMtQgTN0UbHPnNdvjFqm+fTJ+rMpGUpowBcHP9N0vB6+kOBIas+2xAXMMJ3yDOUlJwfNFIRVzD9UdcfyqUR630/2MUcHAU2cwQQDUNXjn6Tf78gT8/aueRt9+RI5cmI67zhggJAc/ViziEHPVaYMPtmXHFr7sJiARAhkviHNS4O/ftVCH5ZpD6H9OiFM9LvKSxl90Pc7mfEkpajtEupjikrbPXfME1L89pAh4Af1/hLxSCr2Waa2OnRPiDAe52DaRJH/V1XNFXDw+Rc1csWWwbwS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 13:00:51.2695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa5fd0d-5593-4b4b-93f5-08deaf5d5442
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6279
X-purgate-ID: tlsNG-ebf023/1778504456-413773FF-5903C9D4/0/0
X-purgate-type: clean
X-purgate-size: 1504
X-Rspamd-Queue-Id: 0BFF250E71F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Harry.Ramsey@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim,suse.com:email]
X-Rspamd-Action: no action

Hi Jan,

> On 11 May 2026, at 10:35, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 08.05.2026 16:33, Luca Fancellu wrote:
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -330,6 +330,10 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>> #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>> #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>>=20
>> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_NONE    0
>> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_PMSA    1
>> +#define XEN_DOMCTL_CONFIG_ARM_V8R_EL1_MSA_VMSA    2
>> +
>> struct xen_arch_domainconfig {
>>     /* IN/OUT */
>>     uint8_t gic_version;
>> @@ -355,6 +359,8 @@ struct xen_arch_domainconfig {
>>     uint32_t clock_frequency;
>>     /* IN */
>>     uint8_t arm_sci_type;
>> +    /* IN */
>> +    uint8_t v8r_el1_msa;
>> };
>=20
> Can you please take the opportunity and insert (and check) explicit
> padding, so that the next uint8_t field addition won't require ...
>=20
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -30,9 +30,9 @@
>>  * fields) don't require a change of the version.
>>  * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
>>  *
>> - * Last version bump: Xen 4.19
>> + * Last version bump: Xen 4.22
>>  */
>> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
>> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
>=20
> ... such a bump?

Yes, will be part of v6, thanks for your review.

Cheers,
Luca


