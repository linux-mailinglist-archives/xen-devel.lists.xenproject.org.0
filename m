Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB08566F14
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 15:20:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361247.590658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iTU-00089r-TN; Tue, 05 Jul 2022 13:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361247.590658; Tue, 05 Jul 2022 13:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8iTU-00087I-QD; Tue, 05 Jul 2022 13:20:20 +0000
Received: by outflank-mailman (input) for mailman id 361247;
 Tue, 05 Jul 2022 13:20:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skT/=XK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o8iTT-000878-9a
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 13:20:19 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50058.outbound.protection.outlook.com [40.107.5.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 369ad09b-fc65-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 15:20:18 +0200 (CEST)
Received: from AS9PR05CA0010.eurprd05.prod.outlook.com (2603:10a6:20b:488::15)
 by VI1PR08MB4205.eurprd08.prod.outlook.com (2603:10a6:803:e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 13:20:15 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:488:cafe::e8) by AS9PR05CA0010.outlook.office365.com
 (2603:10a6:20b:488::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21 via Frontend
 Transport; Tue, 5 Jul 2022 13:20:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.14 via Frontend Transport; Tue, 5 Jul 2022 13:20:14 +0000
Received: ("Tessian outbound 3c5325c30453:v121");
 Tue, 05 Jul 2022 13:20:14 +0000
Received: from c7c9d785d429.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FE22F2D3-D998-4E62-8CC4-4362272A2115.1; 
 Tue, 05 Jul 2022 13:20:07 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7c9d785d429.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jul 2022 13:20:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6512.eurprd08.prod.outlook.com (2603:10a6:102:15a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 13:20:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5395.018; Tue, 5 Jul 2022
 13:20:05 +0000
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
X-Inumbo-ID: 369ad09b-fc65-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CurmtmGSN0fdKwHr+ltWMq1AbwVwIsRjin2elxIXV53XYYVUc4hEowok3CSabqxq/jx0mUv7gj7zdLEcf+na7fpqSV29gKxIBIiYgfONyZZGhjNt9NHIx+lkyerHOiA/ZZuH+uniQh4/0SyzW2PDrE3WwHQW472L2uQu6/MZb5iq7GmGzBUFfVgSxsbB3BNyeXtbJtha+T8jBAlcFeXIH1S+ZATk8Mj3wb4dkxofSj97s81TDv6hcMSeO/MUFtzvxx8cDGxEvkVLGHGPNZGRsmBv/Wm3m8cSKa2oP4LAsmbnNSFaXGuN+kBPsrbTUpRMU9F2jZsRQtDf7FOZ4TF4Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Do4TXdwFH3Dl/akG+UCNj7tGRJat+YqVatLtKicll0U=;
 b=ltapiPZ9k9qktbCzTZ5ELptmlBkw3U5HIg47E/VPQdeOAkCL40lpGGBvMLcqr16P9OYAc0dir+7XGb4J31Hmujy7BdixNVvqv6+sEjx+Zj/funVB+xVSaqhEPQUEY/nHUGSgZure4AF5N01rSIq4rnWgdLZrJ3dSPaH2j16G630b4RqTZ0krB8Z8Zf/KQkDB/UdXst1j6d25EW7EZnYvcSSzqGt3zUESPvVqiQE1q6+LtRECOKd4QmnZNzA1vzSCtxxBLp40VkBlqJVQlr/MtsF8AICYC4mFIDfr/KhApBdjSJPS9ORhBhPJEpLwEKUqwMRASh/Od7o2Ttc2ClVfEQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do4TXdwFH3Dl/akG+UCNj7tGRJat+YqVatLtKicll0U=;
 b=gsmCWmJTrmmrpFhinmHgUnF8T9gwjjMonHNUBVVaQGIPsCalfXwP5yG5v0vCOW1b471bkR7rq0fCwAEbYKajFvukIX4SLPNynwgiUKxJQOyaUCPGpkOe59gRFNUd8DTDnESMuOKVYzL3nISQGuBk/Da1ZA8ypkGrVafigjRj01Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31bd33e983dad591
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8eCAZwIwKKrovszybfkKaJllHEdjgRV4qaNVu2IV4vJrOgMhRljWaRsAgpGcvTADxqgv+8gF7CFIvBCWCR4BVKawxVkNAjn+Sk8PIE5uNsUED7zVBMF3iA4IIfuTg6B7tASSf0Fai2XWWMkwSZ/RruRm9grYjBatpat12ZU7FYrXpu0YqGEWJ682oAbIC4EFg7MUt2o62cAtW7x6KGWTiJ5didqNlwtloIeZha+ixZtMx2hp6qWinAsC+1G3JC/TsAR9VHk7h6Xx5A+TA8DOZI5Dnjyfso1nYRarM6gVctkJoMAKCOe5m2AkNpgE/QN0KGgYnY5FTwL+tZY76kjWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Do4TXdwFH3Dl/akG+UCNj7tGRJat+YqVatLtKicll0U=;
 b=EfTDrX9ctvyxHR+pKbQRtoId5bzpluElc7aaUv0Jzh0G9H/8niALWoZH/LBNXKveb486OMAfS/pTSmHMpw+ZRfBb12/lVKqHtQQn+Oal2dtR+DqbygM9L2h6VV6R9s2egYD5fCpAGLWVKGYZcFnnB6PV9+vLNHc34eSaW+L/aaieO+8oRwM89tPy/rgbQrlcAqsHi7aUJEJedA6SyKhhFIzNxxeYlr8Kz2sZ/N77tYkn2pbzkuU+5Pr16C9yxBOmsI2Tu93tOxlDUbhiEfOmpDC0+pAGmz4DSxpFEYljAV6j5Dco2t1XKaoBs33iJSIJSdyrcmgCbbw+t9vm8q0XPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Do4TXdwFH3Dl/akG+UCNj7tGRJat+YqVatLtKicll0U=;
 b=gsmCWmJTrmmrpFhinmHgUnF8T9gwjjMonHNUBVVaQGIPsCalfXwP5yG5v0vCOW1b471bkR7rq0fCwAEbYKajFvukIX4SLPNynwgiUKxJQOyaUCPGpkOe59gRFNUd8DTDnESMuOKVYzL3nISQGuBk/Da1ZA8ypkGrVafigjRj01Q=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v3 13/25] tools/libs/util: cleanup Makefile
Thread-Topic: [XEN PATCH v3 13/25] tools/libs/util: cleanup Makefile
Thread-Index: AQHYh+QwbYCKsLocd0aY57rJQgVGX61v1BiA
Date: Tue, 5 Jul 2022 13:20:05 +0000
Message-ID: <05F4A5A8-56CF-4189-B5EA-160482F0912A@arm.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
 <20220624160422.53457-14-anthony.perard@citrix.com>
In-Reply-To: <20220624160422.53457-14-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0c3b2cdb-eb18-4159-b30e-08da5e8918df
x-ms-traffictypediagnostic:
	PAXPR08MB6512:EE_|AM5EUR03FT004:EE_|VI1PR08MB4205:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ewr//1jYV1jc0fbwpgKBizeZveYGTcT3Rtkpk3uLDr8YkesvXcGdJabh36Y4hKabUEF6IbDTk57qOxVPjQxsgTaQieiXXoZJAHPaoYtcYHn2IPhoY8avraz+VUEjPYlZGe5L8cppTfcmmCFczYJZTf75kfQiByLEr524kuETCv5Umigua9+m9gx/wu7BB+yydvAQ4JgYrs8h2iwE8A5b9O0ZAXKl0wxNLNp1ca3pOd4payYyzbA3CtWB9DEWqdu/UhTWwT6AzbQlEBrD0hLNGnU//LGzor3l0HslvHCscsTT4LmCBUnNGIVuvdbUrjYPl5VwPvSNnrEoAAMiudXe3lmx8N1VWkzZBTlUXhhTD/xrLCOOor7ZUpcmFeSVKOxMIHdSRRvWJtLiN+LQgX30NVir6cF+1IGr43mk4jwqkuLiu5EDJdDrOn2TASAzSfeLlvg1CSVs7sEs36hTZXFQXzBKwxmws8Nme3eiiLz/mjo2B1LDmmOU+WGRVIBiSwTnFnhv+OGMJu5V0JsVCF2hmXYQW6Ry1AUHqClZq4hlKVBJghv8VfDKRQ9mrmK1KBQeKpCL7LyThIP8MTXpr/I3ZA7LU7wALPhEyWY92KzC/xET5EbF+93wNJbduTpirIxDUr73zp5gevWXsSX9SXDIXFETl8K1T+/TAwuAnb/uuIRP+tNfUOpH9abRF9QmIb6ILh33aOBbtNqVs2RYQgir+EGOi5CWuou2rpp3kJPPCQRRvyVjFWyyr5lAm5ydAR+zDwXkR9GU7JiOxi+X6/eyM0/zcaNaEdUx/4WwIwdE/iz+YSifc4jsy5Fls9R/JInA6M71x/fyHsIORSYGnuahPGcxM0x0NcfWucfTnCqpxFk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(39860400002)(366004)(346002)(4326008)(66476007)(64756008)(66446008)(91956017)(8676002)(6506007)(66556008)(76116006)(66946007)(41300700001)(71200400001)(6916009)(316002)(54906003)(6486002)(478600001)(8936002)(5660300002)(2906002)(38100700002)(36756003)(86362001)(33656002)(38070700005)(122000001)(186003)(2616005)(83380400001)(6512007)(26005)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DE7E17861B93424382E79D29F8A1DC6F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6512
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0dbab758-7b1f-4fb7-97a0-08da5e89136a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G9slQcgV6fQg7mPTeE6JH71175xAIed0Q++hRNfl7hblUX1loyVCL/VrmGMMvp/1RLYjFcYIzjLcAUXXZrmeMoANcgShZhWZhAXZpwExO0Ju6LuQqWSLKOkxCpGTg1BlTFJXLRI9J8fwgbpadtpCkA4zRGK1cA6/Yd+/uQrBWEPJHlbd+RoIkTwIu6hHeYgebecR0XLm+GARFldyNgsauX7Ws1CvYa0FdOtd5WPVCZqeReHEaFzyLzw6FcEhqFfP9ToBnSzUSxm5OSbQDNV94G0RQcSoAWcW6qqgXgbJ/bYm18JWEsX219KiGw0y4JvllcmBuXQRAHOPosFuyzsBPt9zFVE1+Pj2JqEQZbg96/zJhhRBOBNndRmUv0xHr/LqW+rng51u8hzNntKUW9vU2hvNzBUVWyKEho2wBMIHlkS3t9eMZwF+ukFOWpwH4Vw/OSorLpXQbOXTi9wtYsLPMIZyK9AleZsX6olq5l+IYiaS7OqLkr/cEtcB0gw6U5Tsfb63U4kcXvt0/6+RovbVopUyQyQ78KOVbDKlxRsC2/Vz/NLaAVwDwVjbVyHneQTYXQY/6JeMx67odfrpUkjAEeyoP5I/6xDvKuKGW5iKOFxuwH8SdKSGjOh03msYWyel5RqbhjnkSrIdcJo6zBxQODq49ulM6u0rn5V/3K0f7ERO55Oa4UdLLE8FMEsdhI/dJyF9D+bURUU+nZcA0dzJtsmoUPWP7B+/fLzbALijGmq98Bv7fhkKGFa2DoY8K5oJvtXPAZxNLbwFDiPo+YCWqa68lVK7CcKDg9Yd3X9QKl5wlLFBqRfjlahvMPFnZOWL
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(346002)(40470700004)(36840700001)(46966006)(36756003)(86362001)(81166007)(33656002)(36860700001)(82740400003)(83380400001)(107886003)(186003)(6512007)(53546011)(336012)(47076005)(356005)(26005)(2616005)(41300700001)(4326008)(70206006)(8676002)(6506007)(316002)(70586007)(6486002)(478600001)(5660300002)(2906002)(40480700001)(6862004)(8936002)(40460700003)(54906003)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 13:20:14.6565
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3b2cdb-eb18-4159-b30e-08da5e8918df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4205

Hi Anthony,

> On 24 Jun 2022, at 17:04, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Remove -I. from CFLAGS, it isn't necessary.
>=20
> Removed $(AUTOSRCS), it isn't used.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> tools/libs/util/Makefile | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
> index ffe507b379..493d2e00be 100644
> --- a/tools/libs/util/Makefile
> +++ b/tools/libs/util/Makefile
> @@ -11,7 +11,7 @@ OBJS-y +=3D libxlu_pci.o
>=20
> CFLAGS +=3D -Wno-format-zero-length -Wmissing-declarations \
> 	-Wno-declaration-after-statement -Wformat-nonliteral
> -CFLAGS +=3D -I. $(CFLAGS_libxenctrl)
> +CFLAGS +=3D $(CFLAGS_libxenctrl)
>=20
> CFLAGS +=3D $(PTHREAD_CFLAGS)
> LDFLAGS +=3D $(PTHREAD_LDFLAGS)
> @@ -29,7 +29,6 @@ ifeq ($(BISON),)
> endif
>=20
> AUTOINCS =3D libxlu_cfg_y.h libxlu_cfg_l.h libxlu_disk_l.h
> -AUTOSRCS =3D libxlu_cfg_y.c libxlu_cfg_l.c
>=20
> LIBHEADER :=3D libxlutil.h
> PKG_CONFIG_NAME :=3D Xlutil
> --=20
> Anthony PERARD
>=20
>=20


