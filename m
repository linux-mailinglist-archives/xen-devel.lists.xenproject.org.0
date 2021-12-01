Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C029B4649E5
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 09:40:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235677.408816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLAB-0007TH-9w; Wed, 01 Dec 2021 08:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235677.408816; Wed, 01 Dec 2021 08:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLAB-0007R6-5p; Wed, 01 Dec 2021 08:40:27 +0000
Received: by outflank-mailman (input) for mailman id 235677;
 Wed, 01 Dec 2021 08:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0lDA=QS=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1msLAA-0007R0-8u
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 08:40:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7d00::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53601f4f-5282-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 09:40:24 +0100 (CET)
Received: from DB6PR07CA0172.eurprd07.prod.outlook.com (2603:10a6:6:43::26) by
 VI1PR08MB4509.eurprd08.prod.outlook.com (2603:10a6:803:f2::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23; Wed, 1 Dec 2021 08:40:21 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::1) by DB6PR07CA0172.outlook.office365.com
 (2603:10a6:6:43::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.9 via Frontend
 Transport; Wed, 1 Dec 2021 08:40:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 08:40:21 +0000
Received: ("Tessian outbound dbb52aec1fa6:v110");
 Wed, 01 Dec 2021 08:40:21 +0000
Received: from c9e023cf4a0a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 66F62572-C50E-4554-BE19-21DF20A8B925.1; 
 Wed, 01 Dec 2021 08:40:09 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9e023cf4a0a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Dec 2021 08:40:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB3271.eurprd08.prod.outlook.com (2603:10a6:209:47::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Wed, 1 Dec
 2021 08:40:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 08:40:07 +0000
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
X-Inumbo-ID: 53601f4f-5282-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wX4hGHg4Q/HE943kglFck1XuUUR0YZyCHmfbkFLWcms=;
 b=PSfVNfMuzRflZVWOg3FeVhCl1GWRMD4UVBiLnSxyVw8VC8aBYfX/EXh73o1PW4Ts9uojqkNvPskzMQTqqXqxevyEWT0XkPFhPExmLzc+2Or4NAOCq0suRs13O56C6tjrdmC7jta600XmsEbHQDoJPABMAaqNbXzho+syvDNwqwM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1ced442fe261afc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yr0vUNpoPLgbl3PE6ZvyboDoCoZD1d6JrTwt/K2fTWMZmM8lXPf3h1qaNzEM9tVF68afpkfAtRM4jI60BvGspzbD1B1mLmth6oW9abyFzcU8YnxtkqOZv2S3vE9xgpuuTp0Cg+Au/0+M/6PCGA6Divg8mRcJyzf/mDtx6D/BGtsBXvn//XlsCb3vtR478B6CLHVUxXg7qPMOR5l8YX2suMW+RAP8m4TFAh4kCVWbwqODt9cJwfB0MVt9awxTghO1UDgZfDcn4JGJ+5SLZpOXo8Y61DR30v/Bbwa57a0NeYP5TVQkua8XY/oxR/IEN9VGOOhTO6siGvg/OJYfhy/vKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wX4hGHg4Q/HE943kglFck1XuUUR0YZyCHmfbkFLWcms=;
 b=oFQNGwr/OKHt9XKbRVsaeU91NKGgqRPEbTEsL8FSkU5x4Wjno53zhDUUb29ilZNWPFVolvByLTFF/R4OG4TFPDX5RIZRyChO1etMvW8sEj7bb/6wy+FmA8BECPysEODCQDPULRE8tu+cYe68mCEjLSHyVMgp6v6uH7R1qO6CMqkKJLk2nY8yZzIz9YhKcBWFtVtRZLqVm+SHifJRSPJPMWWR+WilzP079rWeViyQaRps4CAYKmhUUH4ByKYC1sM2ADvOWijyJ50zoOAtrNrxty9N4JoMuZpUOnqkweeTPL44nLaVVhvUBmbBWhhgsOexWAskjSHdssM+6s1mkm9wTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wX4hGHg4Q/HE943kglFck1XuUUR0YZyCHmfbkFLWcms=;
 b=PSfVNfMuzRflZVWOg3FeVhCl1GWRMD4UVBiLnSxyVw8VC8aBYfX/EXh73o1PW4Ts9uojqkNvPskzMQTqqXqxevyEWT0XkPFhPExmLzc+2Or4NAOCq0suRs13O56C6tjrdmC7jta600XmsEbHQDoJPABMAaqNbXzho+syvDNwqwM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Ayan
 Kumar Halder <ayankuma@xilinx.com>, Andre Przywara <Andre.Przywara@arm.com>
Subject: Re: [PATCH v2] bitops: Fix incorrect value in comment
Thread-Topic: [PATCH v2] bitops: Fix incorrect value in comment
Thread-Index: AQHX5hXspsh6iwLz8EufEuavNpo0T6wdUegA
Date: Wed, 1 Dec 2021 08:40:07 +0000
Message-ID: <03B8C4BA-A11A-4CC3-BE61-A0CEE9F5B302@arm.com>
References: <20211130181238.5501-1-ayankuma@xilinx.com>
In-Reply-To: <20211130181238.5501-1-ayankuma@xilinx.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f5452b4d-c3ce-4069-2a21-08d9b4a635ef
x-ms-traffictypediagnostic: AM6PR08MB3271:|VI1PR08MB4509:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4509D94A29393D6C3C9B462F9D689@VI1PR08MB4509.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1002;OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mG9LT4TgnbUZoGnHIRCBcrUmGHPPBfwhd3v4MzNo1p9TfAzrtkRElXUg4NLhR7ZrsEFqdTLMnO0JA7H/NDdfAvmn0rw5aRw+rf1Vt6+sckd4ZXo6fuQFwMR5IwW0LunD7P3GUoNiK8Z92pSwjkOxQELgZpCvNc1kKhSIxCXzWt35Cj/oGUFrSHYsvqXYiUwnwjzxxMbsOoC6PiCyeAHITYDejtVVn9P6l6M9QEggrR8P/oqh6T5wN/9vPKVet7SWOvoTEDSi55Ey4fE6LK/w9DdaLMvlH5gcaHip+rFIqmDEotlkIfg4hn+qV82t2hIUySx8GyCAmo/6rtL6xZi7OZyYTsvAPiE5NtMHCgMym4AgA9bEna1nR5+MTlK3VnP4ymHmBIpL1r4yQQCj7HI1hMp5GTOjvduyeW/Kgq0jS/X1KfYr+YzanPXSayT79E/fzNgkR3040rdy/G9rxOJVh1cSDKbY6PJ/+KqOAYYm33P/2I+BMTHMkLGDOj4uHdtjgr51nK0pxfijUQlxX9PQlN3clxi+PxWp1RBGk9ozuGgRcN+wnA3NOenrxy9s7wl/GMW77l91e7eBlMrnUgHSlUTijqXm7SeXuWayfrGydsHNvf/3frM/KrIkSsVfRQX7qHlZcfRcu8Sa0QXT1250F68O6d+qKU5qorcdbsk1VYnbihHNmQhh90nbhppKbBd/BMqPpgik8U8L2rIhtj22xVWjiYM0jtBq0+Qu7Dy4WjQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(76116006)(33656002)(64756008)(6916009)(2616005)(38100700002)(38070700005)(316002)(66476007)(66946007)(66446008)(83380400001)(6486002)(4326008)(6512007)(122000001)(508600001)(91956017)(2906002)(71200400001)(8936002)(54906003)(186003)(86362001)(53546011)(8676002)(36756003)(5660300002)(6506007)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C3E1EFEA95C6204197843255430E41D7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3271
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f30894eb-71e2-4da9-14ca-08d9b4a62db6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NJLLz100L4LGr4Hk4IMzvO5lSxkPx4Y+0coNQTh2SOY5AYxRkH+zEpttXfgNCiVRxJrLu5VAmEcGwZyHnOzwpsFWX6PTYS0v0EazZaYUPeNGSxiAWul1LlSV4S0W0+7S9PUdcO+9ZWGLsEBoz9GByOwKesc5mj0V91wtgblBqCY6qg6NsVducB2K6Lbh49ZwQeLr2QU8XJR8gOaA4b3enxVmUgmA+uOE4xv7kb0yuKCymXpuxKgT+U9LF38p4tpt1Hp42zXpIMvsnZoGDT3224Qt/ki0WgGrmLZAgnoO4xkNnNfAsmM90zV9PBdaShTJvWIh2rSU5tq7bwA1TbVw9PGPdEFRnfUehei8MyHfeH5fY1yVWFOCsZpUu5viW6AuQ9nmhN0Tjhjl7zLLcYNeaN7YN1UYuOgpESdCag+QfDTGHXdOuM4vbhhZ4BFlSb9pCl8GTW0fSBmDe08HRTQiQ4sIaYf12Y4bRUh3jiCqXddW5REmp9yzezSkc+3IN3LBU5l9ZxkgRdU5zF0l/UakocMIuW/uk6hav9AeBgJKG1jUTtW0joBpQ5R0egJKlowtLQ0zEKisdqDASdRYQmQexiQA4jrwsSWaO3zBuKrXOh4gruPCMQTk5+4w5tvXVW8AxRQjX2xLA3mZBHDaY03iTs7j2qznJN+Khh+mfJb0SFoeO+I6UFyNPXrLG8dheLIblzXW6MGw6kIuSVoKmoX/Sw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(81166007)(26005)(6512007)(508600001)(82310400004)(2906002)(8936002)(2616005)(5660300002)(36756003)(54906003)(316002)(36860700001)(33656002)(6506007)(86362001)(53546011)(70586007)(4326008)(6862004)(6486002)(186003)(83380400001)(336012)(356005)(47076005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 08:40:21.1988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5452b4d-c3ce-4069-2a21-08d9b4a635ef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4509

Hi Ayan,

> On 30 Nov 2021, at 18:12, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com=
> wrote:
>=20
> GENMASK(30, 21) should be 0x7fe00000. Fixed this in the comment
> in bitops.h.
>=20
> Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changelog :-
> v2 :- 1. Replaced the word "vector" with "value" in comment.
> 2. Changed 0x07fe00000 to 0x7fe00000.
> 3. Updated the commit message to make it meaningful.
> (All suggested by Jan Beulich)
>=20
> xen/include/xen/bitops.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> index a64595f68e..dad4b5aa1e 100644
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -5,7 +5,7 @@
> /*
>  * Create a contiguous bitmask starting at bit position @l and ending at
>  * position @h. For example
> - * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
> + * GENMASK(30, 21) gives us the 32bit value 0x7fe00000.
>  */
> #define GENMASK(h, l) \
>     (((~0UL) << (l)) & (~0UL >> (BITS_PER_LONG - 1 - (h))))
> --=20
> 2.17.1
>=20


