Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D266E4B2010
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 09:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270198.464402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIRC9-0006Ew-Ib; Fri, 11 Feb 2022 08:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270198.464402; Fri, 11 Feb 2022 08:22:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIRC9-0006BY-FN; Fri, 11 Feb 2022 08:22:21 +0000
Received: by outflank-mailman (input) for mailman id 270198;
 Fri, 11 Feb 2022 08:22:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9nq0=S2=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nIRC7-0006BS-BU
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 08:22:19 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe08::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9792579-8b13-11ec-8eb8-a37418f5ba1a;
 Fri, 11 Feb 2022 09:22:17 +0100 (CET)
Received: from DB6P195CA0014.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::24) by
 AM0PR08MB3492.eurprd08.prod.outlook.com (2603:10a6:208:da::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.17; Fri, 11 Feb 2022 08:22:15 +0000
Received: from DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::7) by DB6P195CA0014.outlook.office365.com
 (2603:10a6:4:cb::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Fri, 11 Feb 2022 08:22:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT011.mail.protection.outlook.com (10.152.20.95) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Fri, 11 Feb 2022 08:22:15 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Fri, 11 Feb 2022 08:22:15 +0000
Received: from 2fff6e63634f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E592DE96-D3A4-49C9-AF2D-2E138C9E0FD8.1; 
 Fri, 11 Feb 2022 08:22:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2fff6e63634f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Feb 2022 08:22:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM4PR08MB2884.eurprd08.prod.outlook.com (2603:10a6:205:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 11 Feb
 2022 08:22:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%4]) with mapi id 15.20.4951.019; Fri, 11 Feb 2022
 08:22:05 +0000
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
X-Inumbo-ID: b9792579-8b13-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwUW1WWO/9TRhAGRLI00rX5A1L7bwEs9SmpAZ/pAHNQ=;
 b=9ISlnCjWqo0yDMjVgkCFszQ+Bd/7Saf86RF6nYuleXYeAz8kZ5d/mTMpVTP3xgG688Bd/jGEfSfVZ39z8oJhM8msjc01WdIjNgm2M/5+vQJWOHvDQhE695wPmzka0tHT9XZ1lCy3qO0aoApc+jDub497PI+mMAqfdWnw+MLnmGg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a200308a4bdaf289
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqmE+cCjgP/1hd9B83JH6BP1T3Y+sNNQis17qVPUGnKVvbg2pyw32x4i9YI110iOsq3vFMQT2upsQ6o3tWI1vtQybuK6Fj0EelcSXw9UF2eWInFcDyxbUXHFN5EdGQh4Iph9DFYB+284LunS1m0vBSL4G4nyAqzzAbke19wGrvUUL9Cz3QMeO0yT/QzjyNN4fLkL2ZCcw7qrVoCkD6sTin0+EXZCI0+Ugof8PaH9v8NHtNgjB2BCi2KN54WosTBt99eOCxTDiKRKMNCl0g6YGdG4SdX75oa6DpO9mGXNw+qo2rriXYQ/lGefArGzuW546I3Mnx3L66GmIfKV9g4xJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NwUW1WWO/9TRhAGRLI00rX5A1L7bwEs9SmpAZ/pAHNQ=;
 b=LtXDWwOGqBPhsJivFXKPr7+DOxQdB/2u6j/ouVoJZBDLEnKwS3Yq/y9bQE7FdyjetQqih942qOSNNei0kNlBN5MAK2RgFEBQ1KAM1vn48XvmehYrzDmhwkAkpSle0MNGdIvkTBOq0L0nV1mqysv42VVh12PsUJ0tHSw7Nzx8oVCZ3cnqfxNDPBChMgRt9LvOjsmqo50xTtzQyFMNaG7ss6OK1DEtevCDmFkOog+X8ac0HCBZnausLWdi1G/xqCiHLG1B3PXYjLihfSkmBasTzaho7e9EulPQp9BeL3emzYKSzsBd7NdEVWtYWGySN52JERoc+WxJYeE9/Mjmf3AN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NwUW1WWO/9TRhAGRLI00rX5A1L7bwEs9SmpAZ/pAHNQ=;
 b=9ISlnCjWqo0yDMjVgkCFszQ+Bd/7Saf86RF6nYuleXYeAz8kZ5d/mTMpVTP3xgG688Bd/jGEfSfVZ39z8oJhM8msjc01WdIjNgm2M/5+vQJWOHvDQhE695wPmzka0tHT9XZ1lCy3qO0aoApc+jDub497PI+mMAqfdWnw+MLnmGg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] MAINTAINERS: make Bertrand ARM maintainer
Thread-Topic: [PATCH] MAINTAINERS: make Bertrand ARM maintainer
Thread-Index: AQHYHrGorW8uOCkvJkWS+UW+UYW3L6yOA4GA
Date: Fri, 11 Feb 2022 08:22:05 +0000
Message-ID: <6847D807-EDF0-43C4-B09B-C79EFE99639F@arm.com>
References:
 <alpine.DEB.2.22.394.2202101026360.2091381@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2202101026360.2091381@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 60bac160-dd5d-497d-b77f-08d9ed379c50
x-ms-traffictypediagnostic:
	AM4PR08MB2884:EE_|DB5EUR03FT011:EE_|AM0PR08MB3492:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB34923A016C821FAD578D208F9D309@AM0PR08MB3492.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:549;OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G0lxOdVv978PPyjv+rut/9vQxLHq3rSgym5hWydA5+RetzdCys5Qe6eWxVU4+r4c8sjVKK6LsxHrhf8gfubliPH7zjEhQ8+8yAC6q/NCSBvERP0YAC1hDp85giPcamJNftstar0mHKmF7z8B1v0waFqY4clZabPPfwi9GmcA2fBJF/zOUb1N5r3NYr3wivHfXFXyi9tmKrn3Wudl7YJ2oY8NGUNahvyXHSSbtbGhYfzWwTdlhVxDdvKbbwbgxlmCP9OTISK0gcaWki4ufHaipG6Lfnx40eXHalu9eyGL8ZknzrGy7h7i6BsTfttzt8bvA3nT2lBvX5MstcY8sG9ScaaBPUXfXRaU/U+vQP0Iczf2tYLj3lIBI4Ta2h67R6eRWd9qXuxux7NY5Bl6bS/dH2WOxP00rdaA9Dqls96DRLhvjfhO7TCJyNMXlQHDDnuxaHnxVH7DtrlNGZv+OQ5WXbhVaEM5h0IMeMyOwXIQysfYaHOEjDGT2PK6cz3cZ7b4WbR1lL5HdIs7xajjijq7jMFOZUIr7y5Pf0wlTgAYN/gE2a6qTzM7WyGMzRMr/maDqCmhuYDTFbOiY47MNe0OXf6i/Jz0OxHJ9DKjqe8UdF+Xtbh2UmUXhudTVnJh8uhMn7+6xA6ZYWaPvI05/jttZvq5F5p0dT4nwpFihQsOsaxcQW8UF0uyiyih7+Dp1nSCloD36MA8t0acJg+LgqoANhaIFCjrut98AXazwwmEnHxzdy4cq4krY6q6vWDwGa5E
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(66446008)(316002)(4326008)(91956017)(6506007)(8936002)(122000001)(38070700005)(6512007)(71200400001)(8676002)(66476007)(54906003)(66946007)(2906002)(53546011)(66556008)(86362001)(6916009)(508600001)(33656002)(76116006)(38100700002)(26005)(186003)(4744005)(36756003)(6486002)(2616005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <262A513260206843B0210D4176DD5762@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2884
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8c16e8b6-ee39-4473-397e-08d9ed3796c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tg/rWLrCvhsQxTDHkNEIYoN9mpAg6XccqsRy5G0/OsZU4lmPeMHegWzZf9Zn3subjtKVr+rSpaS9iCzHg/QTjtCixZ6Ys1N9i50p7iMsRsrll511GxRYWVr54gBUNh2Wt3CiCfV/6jo3hhcXeCWbDuxbDFdw1ZBJk9eBp023QAUCxPu55kvxzNkReLzCNi9a28g7pVmt5KmZj2Tbxr6TU9He5ad4HsykNSSKzVW5/P6tgv9HqBRKzm8KxfXuegCzDxvuHMTz+2o1PFIZMgAYKTTxEQNrCMRiMW5KvLtbtJWRF6gsjUDIv1l/oi60DpYVoXs+tjPMN3OGVR5SnC6UAC+6QkppttStMWyUVqihJJs7vSGDy3rDrLK0X9YTszwdAj0adwkCs5djTY70yCQnPM+70DMpTQDy+vIaZbFEqq/0OS7HSwWF54f9mHrJQb/ywddfNaFbiq7UCAHonpv0HK+mwvVv2cY5f/2fLcWatb8FCbO2F/CrZMUWDpCfcOl7cVooR1GTfacyu8gVispc9RbGpj/w2HNJcmuxODmTsLFw6aB7AY4MvT+0que6lY6c7i3trJSqyOitmuco3/ZJnj8EstKbPFYEwN+1R9Xw4B0e9hrzASwMRsxdUrb9yb9+EdRpRTdtZhxN+vV0NUOk8IM1cYCEihPYhiuMhxzzan9frZTEhQdpgKZC29kOfnRm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(54906003)(8936002)(36860700001)(107886003)(6506007)(4326008)(6862004)(33656002)(8676002)(26005)(6512007)(2906002)(53546011)(47076005)(508600001)(316002)(36756003)(40460700003)(5660300002)(86362001)(6486002)(336012)(70206006)(70586007)(2616005)(4744005)(81166007)(82310400004)(186003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 08:22:15.1075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60bac160-dd5d-497d-b77f-08d9ed379c50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3492

Hi Stefano,

Thanks a lot :-)

> On 10 Feb 2022, at 19:08, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Asked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 64934cc070..d41572128b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -230,8 +230,8 @@ F:	tools/libs/ctrl/xc_arinc653.c
> ARM (W/ VIRTUALISATION EXTENSIONS) ARCHITECTURE
> M:	Stefano Stabellini <sstabellini@kernel.org>
> M:	Julien Grall <julien@xen.org>
> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
> R:	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> -R:	Bertrand Marquis <bertrand.marquis@arm.com>
> S:	Supported
> L:	xen-devel@lists.xenproject.org
> F:	docs/misc/arm/


