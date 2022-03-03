Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15844CC142
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 16:29:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283449.482457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnOH-00032D-OC; Thu, 03 Mar 2022 15:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283449.482457; Thu, 03 Mar 2022 15:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPnOH-0002zB-K5; Thu, 03 Mar 2022 15:29:17 +0000
Received: by outflank-mailman (input) for mailman id 283449;
 Thu, 03 Mar 2022 15:29:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uwof=TO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nPnOF-0002z5-TH
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 15:29:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae8c9605-9b06-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 16:29:14 +0100 (CET)
Received: from AM6PR10CA0059.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::36)
 by DB8PR08MB4076.eurprd08.prod.outlook.com (2603:10a6:10:b0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 15:29:12 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::37) by AM6PR10CA0059.outlook.office365.com
 (2603:10a6:209:80::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Thu, 3 Mar 2022 15:29:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Thu, 3 Mar 2022 15:29:12 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 03 Mar 2022 15:29:11 +0000
Received: from 44784216ffa6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 977E7A4B-2273-4EBF-A794-B964D41AB26E.1; 
 Thu, 03 Mar 2022 15:29:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 44784216ffa6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 03 Mar 2022 15:29:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBBPR08MB4904.eurprd08.prod.outlook.com (2603:10a6:10:f2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Thu, 3 Mar
 2022 15:29:01 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c84a:82d0:c7fd:fc7c]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::c84a:82d0:c7fd:fc7c%7]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 15:29:01 +0000
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
X-Inumbo-ID: ae8c9605-9b06-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPACNY/YM8vRwcBogPoDlodhILeMLXLUuKMzwdU0nhI=;
 b=KwFqBfFi607WquVIvjlxjNRFgGa2enYCvEXIcjVa59vNTpPusIf2QvagI/hWfjYZY4KjBltLIItOj+Vj2ibumjmJdl5C9CneY0YIZ3Q7AxK2hKZiTg6wFJHBuZCF3APJAWUhzmwdjwqMcVOvPOHC4IQl1XF5PxIV1jtjvjyHiGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 08792da1cc3ba224
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJX0D+d4ugGFFnxLFrweu7GFjiL+ZPEFOT00nwYLBO4L1S0j66x8sWKQ6sE2xqjXkR3Rplv8G6qGIU55bmtRVE96lXxJY8yNSgzpoR0VCcaBZ5+1aDW790iS+73kcA58LaZWnDWtUqLIuA7mJ8l+dnAP9yIL55zfvkhfzF4KiyM6Y/NFsoBC1yzs44cVdj8Q25gmy4FkLYZPxQz4DDL6mMtP6Z2z2tcVgMDi7Fxs2eP/1F5TXEBU8oPe5E4UxF/v0QtyWllCb0oy5BUdukJqSNw+QhCSLIAdmTHYQr060NKaSKu6pNSZU3qFFpMlBNSDbFnQCSb15Q0Mu/72UbHeWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UPACNY/YM8vRwcBogPoDlodhILeMLXLUuKMzwdU0nhI=;
 b=CvO1f/KKwDYapBmoRrbol12qRgtpetSP+JjfU85bI8aZN1T+id26485dzFPzTr/F92UybhtiLwkL5VYS7CQ91jcL9oLmzdA/YIY+cYoD01DsQ5ytl/90Q3/G5U2V85X1NUQiJ5Eq9m6bhhyN4HQ+OH5Mgf0a0J/JTod9NOlALkMcpRj4e28rUgZekh6AifXTIyqAxQqtvxaNeWVw0JZHKkEFkAcU9GTZafojCHUVhpeFUnD0k5PqZGFsZ49n+2SgVjJhwm3Hl3KNkXsyuoP2VY0POi7Vwbn2OYvx/XjoMB8pp/scsU5aetNqG9nozI4e26YdzC0QChCLitBfZmlgUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UPACNY/YM8vRwcBogPoDlodhILeMLXLUuKMzwdU0nhI=;
 b=KwFqBfFi607WquVIvjlxjNRFgGa2enYCvEXIcjVa59vNTpPusIf2QvagI/hWfjYZY4KjBltLIItOj+Vj2ibumjmJdl5C9CneY0YIZ3Q7AxK2hKZiTg6wFJHBuZCF3APJAWUhzmwdjwqMcVOvPOHC4IQl1XF5PxIV1jtjvjyHiGM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Kconfig: defaults for UNSUPPORTED
Thread-Topic: Kconfig: defaults for UNSUPPORTED
Thread-Index: AQHYLUXTrzQbHj+avkybd4n9OCZXjaytzEMA
Date: Thu, 3 Mar 2022 15:29:01 +0000
Message-ID: <CB788B25-A304-4675-909E-95426EF4189D@arm.com>
References: <ac19413d-d5a0-4234-819a-fa99afc31592@suse.com>
In-Reply-To: <ac19413d-d5a0-4234-819a-fa99afc31592@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: b0cf85a8-c581-48e2-e0cb-08d9fd2a9193
x-ms-traffictypediagnostic:
	DBBPR08MB4904:EE_|VE1EUR03FT058:EE_|DB8PR08MB4076:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB40766B8D8DD64AB491B4D7B09D049@DB8PR08MB4076.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Hbxyes55HyhQ1pBIbgJg8SNiBD54T5V2Ek+R6wUH+brIkFyi5ElKNMj2/wVTM7rLqv42ZKobZmnG+JsdWEqIq84xUsCVec7fTyweVdBihDr32pyKhdmpzggiuQj+6/AcY/1uzUATKd27vyZF9hSvWOgEAzQjVX99AflMdqAgLCo32MkjwXOBjcBQyyifOCGcwNOREVv1hVh7/DEvVhuXKMCsbr8RpuIQoPRrPQ8AjanXlvOSAEDQtNQhsq3/0B4R1ptxYae7geUasYVQ3FQ6Qw5eN0JG/EWQKbT50GXkfYeEQDtmlgAROF+JcAOvTDXgg8Hy2WO22C/X9WbVlkWM+Ul4NT4p3YXsYss3SPq7pmSZONgC4pAdPJNXyppNT5ucVnJWWUnTzvng1vCFnwdfpb37VJs4c6mIHeXa8X4nxLA/1C31fWwwptTXF8EZpuicYjlvpkVNiKNrXoGFTWCUkdQqj2z0QpUUWpMdva4FbOgSDdKP5QR/g8z+tPM7ZKFKnLBYDbraR18t2KbmjJnOW88zApH1UU3G0ZRsfCbjn65fXADTvIFceoCjNtyPJo2uJ11ohhcPFmh2D6ud9rSgYeWfHQaajYvAw2GYn1SAFXzQUrKeUrVvCi0v+EbvASqTs9COwCbpT/3jJvRL6kKQqKdRbEAEd+G9NmrRgb7IR/4VFG1b+ISKNNIqUqI+3XNea4nPJ4VdtSaWVnRyTqLgxd43U+vCWvuLmWldvfllJF92Fr3f8ONbRDL6c32MTcao
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(38100700002)(2616005)(4744005)(6506007)(53546011)(2906002)(86362001)(6512007)(4326008)(316002)(8676002)(91956017)(66476007)(66446008)(66556008)(64756008)(122000001)(66946007)(76116006)(5660300002)(186003)(26005)(8936002)(6916009)(508600001)(33656002)(36756003)(6486002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DD30292D31AF5146A678DA7227F25C8C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9b7512d-33e9-4d73-12b8-08d9fd2a8b30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F4wDXnc0NXFewHsGK+VKjCUbfSxGH7YgN35NzT+U+LPpJTFZOXIHII8SbiSsYrw/9A9kw75ZH94dB6ihfv05/0KcwuUntTEgk2kgDSbfUwdiiLaEFTaRbu2kQbppihjg7fw27fQrMbjY5CPaqTUO2kFuSO8Q4ZHYOZeHEOoTBzBon/rS+MEAtMvcSllJXzJ+efpSejQyo3c8o8Bcg4YO4IqNN5jNX5UIxCVnliXzbtQW4uZlticH0/8PS8FyIkKjP7+QaWpsWiYVIvbQqcUBJFFOD8iKkmhldelNbo8QDQz2XuGyss4NErXeAQjtKNDpyEFuNy7Ozkv8BvIJeWUZXrfEkznZCZJ12hWm8K1hTWI/5DZ4LapmU7zYAjXh3H1OToZtdSC3k5zuRASkIPLFucDxd+UQER4KWdDa8Vn4SOVkzx7ngob+mjFIjkRi5oMmlZMsSAToSwN6+WrqGgCprFdCd9WT2OmorQMojxHAhSGDpDW7O/Evd5OviiiE1SkPiYcl9VlAqLhAhhLNQ8VEkVIeE8VSvC0ib7DphzWtIVCyTK9hx5hBxOHpKxYtAGkI/6UYpYY+EMYdc/hDUkuOkcGMk3esSzCqYUDHqYNbQWFmvrO/0ANv1w6WP1ose8mbJDIbe7LQ+Jn+pPMd+B8V2MdSCi7JYk94BxNAH7wyzhRo5qKTgta0mJuiuDqP59Hz
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(5660300002)(4744005)(508600001)(53546011)(33656002)(47076005)(6506007)(81166007)(356005)(6486002)(36756003)(6512007)(316002)(2616005)(36860700001)(86362001)(186003)(70206006)(70586007)(82310400004)(40460700003)(26005)(8676002)(6862004)(8936002)(336012)(2906002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:29:12.1424
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cf85a8-c581-48e2-e0cb-08d9fd2a9193
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4076

Hi,

> On 1 Mar 2022, at 08:24, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Hello,
>=20
> when commit d96e5e6c1214 added UNSUPPORTED, it left x86'es TBOOT
> default untouched. This means we default-enable an unsupported
> setting, which doesn't look to be what's generally wanted. I can
> see defaulting to DEBUG as reasonable, and SCHED_NULL's defaulting
> to enabled when PV_SHIM can imo also be justified (there it's
> rather that UNSUPPORTED is inapplicable for the shim case, and the
> adjustment was also done subsequent to the named commit).
>=20
> Shouldn't we therefore have a rule of thumb that UNSUPPORTED
> entries only ever have no "default" (implying "n") or default to
> no more than DEBUG?

In general that would definitely make sense yes even though there might be
exceptions due to for example a dependency to an other unsupported paramete=
r.

I would definitely agree with this.

Cheers
Bertrand

>=20
> Thanks for opinions,
> Jan
>=20
>=20


