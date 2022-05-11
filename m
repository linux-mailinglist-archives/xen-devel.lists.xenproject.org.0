Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7335235CD
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 16:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327002.549708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonWm-00015Y-2p; Wed, 11 May 2022 14:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327002.549708; Wed, 11 May 2022 14:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nonWl-00012j-Ud; Wed, 11 May 2022 14:41:23 +0000
Received: by outflank-mailman (input) for mailman id 327002;
 Wed, 11 May 2022 14:41:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nonWj-0000iw-Ss
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 14:41:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c879c16-d138-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 16:41:21 +0200 (CEST)
Received: from AS8PR05CA0008.eurprd05.prod.outlook.com (2603:10a6:20b:311::13)
 by AM7PR08MB5511.eurprd08.prod.outlook.com (2603:10a6:20b:10d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Wed, 11 May
 2022 14:41:19 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::c5) by AS8PR05CA0008.outlook.office365.com
 (2603:10a6:20b:311::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13 via Frontend
 Transport; Wed, 11 May 2022 14:41:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Wed, 11 May 2022 14:41:18 +0000
Received: ("Tessian outbound 361d68419a2f:v119");
 Wed, 11 May 2022 14:41:17 +0000
Received: from 7d4d06cea99c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB5EF05E-ADE7-45F1-A0D3-B1D45A3C92D5.1; 
 Wed, 11 May 2022 14:41:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7d4d06cea99c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 May 2022 14:41:10 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4391.eurprd08.prod.outlook.com (2603:10a6:20b:73::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 14:41:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 14:41:08 +0000
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
X-Inumbo-ID: 6c879c16-d138-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SKTcOsHhunRIv0CeZzTa9Hk6PpPJWQDg2oJiiQNhxhfeRjhsfXAIVY4vVy9pZ/PROIzWUZBGm2H24u1nwMjQ6T8Ncw+zzHQwxOaeo5qQ9r5hDHQHn2NWkd1xyjauEiJGlq9tD4Jkid5krjelzCXFdN6IF6irIpuHl86NUMBFX+Um+sgq0woOEGT6Ch1f4LAsH3nYqvIOwWR52E3ScA4lmERGGOJELYAVQyytIj8R3+HLLe0IDAyXlTLvB2NO1voZ+tsmKVoHBihCG/C99gdjBwhE0WTWck5XmTobR4xR4tJT3x0DgP+eNSyHlIe4fpnE9H5UaI6vN0La9sOk3FS/gQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh0wc3nBi40lNGNt4U2dKuDBsSaiYWBhotMUpKSSRVs=;
 b=l479fw11cGHFLekwx/BnldMykGUmpyNk4kB9dbCeGs1MZWYIatTmk9ZOJP54ICOnPpk7VAyPQjawKwVA9BU9MAqX3X6HikNToA+cvA6dDY3cf8PXhxBeiKodVwGhN5+q2kIJzdi8gfk5wkXpNSN1Z9PZS4F4MqfCl1vXzv1LU/7dnGC0Gu9lttIt1dGehGnwkw4+fHosNqLjApt3EjcVkRe1/XofG2vgdyYivAxaOJBr3UpKSYov8WDJt3cHFQF5IirGsKtPiCNO1fZYrzofMEgRWMUThvC9gvxUCr04ehhm8lm81EvZ++J6oRkEXAFpS2sk/3tCjoIXDakurmsm5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh0wc3nBi40lNGNt4U2dKuDBsSaiYWBhotMUpKSSRVs=;
 b=AjbukX8HO1zP1kMFHpdDX6KkF2RpC87R8kVBpEga74K1HAoe4CEWQDhhErv5Uqgij56TOmzB5ErdBtnbJp0EZBkVFEE5XhWgMofy33u3o6qYosftrMwkBmjExfpdK62L56jfiiYFX8WUGrzpqpoKNadsqiIX7k0DqGzXmtMjD8g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e38c0b7506d69c0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WFnmGq0+acuTo85Vu09UDyD8EKzwp3Y5KcbQlDeJH5VEhrgXiRkEDMmy61REOJEUQ12K0uabfpWkpKg5Xrf1ldhBaf5ag6DhUWrV5gSoOz4vnDpXOqv1fe44NOvIURvnD0EhtRqWapVe5LFGI5a1MnIAoCPeNaHCEVgiyNHMu4xZsSbD0piCJU6AlJ43m6mOYDZhOK+bc/z3kiJHCsex3yNjzgmeQ0iN+CkCZJzzSnBSu6cM8PuHtXa+WHl7twltM54KP3jG+UUShaJiKTH+Cp74kPhwrKjycSzdLhg0jQ+5fOYDu/iNpSVUqYjjF0atCpvJtbPWSx1IU3+mQcfDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh0wc3nBi40lNGNt4U2dKuDBsSaiYWBhotMUpKSSRVs=;
 b=GAI6AKo4u3ASFU4dVWmhp6rn++50XQMa6hgUkQO4RvK50iwe8mm7y103XHwDuubCz029qLkVjoh5AMsnFrG7mtozIZQq9bhrXo937C73uyWFqVUJEh2DTLv0Z/fCdktB9gYs+Y8pdXxyEhoLc9dGzxX6BsYdgXzhgJONmFRx/KoUQVceR+msLN0CVjQ+QyXdJUg/+/PtILXOOax/Sm8KqMDFnEBIP+jg7zw66VseY/R5KFs3e3Ea7+QrzzikEBoDThnZO+GA1GnKW89Gh8CCeJhJyEvWFIIrIXgWn6R/FWsAYWse9KmMZ1+kJAEtKEfIvmFmTuWihDg6iD7/3kd61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh0wc3nBi40lNGNt4U2dKuDBsSaiYWBhotMUpKSSRVs=;
 b=AjbukX8HO1zP1kMFHpdDX6KkF2RpC87R8kVBpEga74K1HAoe4CEWQDhhErv5Uqgij56TOmzB5ErdBtnbJp0EZBkVFEE5XhWgMofy33u3o6qYosftrMwkBmjExfpdK62L56jfiiYFX8WUGrzpqpoKNadsqiIX7k0DqGzXmtMjD8g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
Thread-Topic: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux
 5.18-rc3
Thread-Index: AQHYXtGhqgeBKorGIE+S3ZHm07cmGK0XZv2AgAJlrAA=
Date: Wed, 11 May 2022 14:41:08 +0000
Message-ID: <13F6ADF2-574F-4E80-91B4-F646E629B120@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.22.394.2205091854090.43560@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2205091854090.43560@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: f3217c24-52c5-40cc-c584-08da335c4f40
x-ms-traffictypediagnostic:
	AM6PR08MB4391:EE_|VE1EUR03FT049:EE_|AM7PR08MB5511:EE_
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB55119A823A6BFDE137C354289DC89@AM7PR08MB5511.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p4Bot5+MmIwtX0WOPpwOktVEjiRoaJc73gYr8W/ya3iZfb5sc3P64vBK9FY9sRN/Gg70xltLKWpA472wk+Oiy0CVJVNHBdfvYsI+BAFZGA83ZeLublVSknhnC4YYCILZfKiBut4f6H/Y43F6GPi8ttUC2z6xpPgRWfMjVwCeS+wp2qsJdBBAWoob7N48hKpZTPhUl3g8icpy2zQYpJcCfUPyPvZAtQIgbCj/TGbZ0HJgv8y0SWJWz9l6nazgJyMgBMOReliY3646rsQ4qZWCqWZDnXXzSYFwG35KSJBnx4wy4cPBllXekwZYH/wzi4uc8WlgOiWTc+6WZrw+KEGg6XXTZTMTfhV5/h/Ce/zNh0CbtyOEYfE2RiC0dy+3X0sHfWSooKzHdlH7EvCU8EuXxBLaMlVfVKoGcelq4AqvoOHwReC8NifD88GFe2UnW1oimGwnnrU1cq4fskXsz6FjnGysv0YLN+bK6Gkh07WzowDeDIXFix+gXyPrUgVbBSzWBkLnB1IUi169TE3j82ke3tiPrv+rI8nqChtyPaQyuYxd7S5L4/dpV+pRU7G4QlxW3Rg1thvmJNrbyNagpXo82+1TUf9oumLpr8n+1/wT3kiN3T6Hflhst2KdNKhxrGdNfvJbJH1qxdWdJpBM9tJf2e1Rr1c7oGdAmmt6g9O5PM80DT/0oP3v4faMKYdXiYNK7EbNSWMGarHhb0s1BlzJ1zuD8ji5NMDLpUQOwuQh+eETnVpEDBEnD5o93YCYOlRZ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(36756003)(30864003)(2906002)(38070700005)(38100700002)(8936002)(5660300002)(186003)(508600001)(33656002)(66946007)(8676002)(91956017)(2616005)(66556008)(64756008)(66446008)(66476007)(76116006)(83380400001)(316002)(54906003)(53546011)(6916009)(6506007)(6486002)(6512007)(26005)(71200400001)(86362001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7CD9CE4190080441BD22E0C59362C623@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4391
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0d964278-2930-45d8-5186-08da335c493b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jlwXEuQGF8to9Us+s+Y8AeQ26QxbTRshEhs5yRPvHO6g8HxYLC23aZCrjkMSBUHet7EMiYfOgGq9ILEVSQHDnWDN+KR86I6d2IHMTiZyKHGMBi6JfjuEmBXsoDTMURi4leJ0mC9wnrKzILQszE3D72VmYJNshlYMBQB6Pz2ZaD4Z9+PtO7NwRIbUiNjbW61plJ9NxAkgDHbzEM5eT0hZHOBBtgcEPA0M7Ir1LbnUlQcnYB5+HLJHx32Qsm0Wca72xQyZwNYJ35YgrvIJpN6rXBr4IgBerIODToEI8sJ8+wpuiRVMTFC/x43794JJGjwymoi9ogNOsYfYER3gb/mytLJO4clJ1Ja4AaV+/0QIE7TbVCs7dbZz1ILE8mbq6OXo8hedE4MwxWmfdaTy/zF07+82qUjHRJ0906EYOFh7GES+PNMi12amyR216GTVbYZiLzYyIj776W3LPNLEl6F7/gKEMbKWZHRj3sN9QXvOxKcZU4CQBOlzGbVef9AZPo/75+i/3uIMRjzthGcbaRWFnXyCiRVR/hY2WorV468pxn2D245//KJu0xu4/5C7v+aYBYwxivyubwfP4PtthsoQRJlPd4r/zI+F59TONmtrjKVZq2Fy80OKfqa+l+wSt3oPis5RdWbHziDLn9qvkkOGWaVBOGqMRXsewndD+RAbyHwz6ho5WTMODKeFvVybJii7
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400005)(33656002)(2616005)(26005)(356005)(53546011)(5660300002)(86362001)(36756003)(83380400001)(6506007)(8936002)(107886003)(316002)(6486002)(6512007)(508600001)(47076005)(70586007)(30864003)(70206006)(8676002)(54906003)(6862004)(4326008)(336012)(81166007)(40460700003)(186003)(2906002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 14:41:18.4491
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3217c24-52c5-40cc-c584-08da335c4f40
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5511

Hi Stefano,

> On 10 May 2022, at 03:04, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Tue, 3 May 2022, Bertrand Marquis wrote:
>> Sync arm64 sysreg bit shift definitions with status of Linux kernel as
>> of 5.18-rc3 version (linux commit b2d229d4ddb1).
>> Sync ID registers sanitization with the status of Linux 5.18-rc3 and add
>> sanitization of ISAR2 registers.
>> Complete AA64ISAR2 and AA64MMFR1 with more fields.
>> While there add a comment for MMFR bitfields as for other registers in
>> the cpuinfo structure definition.
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/arch/arm/arm64/cpufeature.c | 18 +++++-
>> xen/arch/arm/include/asm/arm64/sysregs.h | 76 ++++++++++++++++++++----
>=20
> Linux cpufeature.c has a couple more structures compared to Xen. So I
> would add the word "existing" in the commit message:
>=20
> "Sync existing ID registers sanitization with the status of Linux
> 5.18-rc3 and add sanitization of ISAR2 registers."

Ok will do.

>=20
> A couple of comments about the cpufeature.h changes below.
>=20
>=20
>> xen/arch/arm/include/asm/cpufeature.h | 14 ++++-
>> 3 files changed, 91 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufea=
ture.c
>> index 6e5d30dc7b..d9039d37b2 100644
>> --- a/xen/arch/arm/arm64/cpufeature.c
>> +++ b/xen/arch/arm/arm64/cpufeature.c
>> @@ -143,6 +143,16 @@ static const struct arm64_ftr_bits ftr_id_aa64isar1=
[] =3D {
>> 	ARM64_FTR_END,
>> };
>>=20
>> +static const struct arm64_ftr_bits ftr_id_aa64isar2[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_AA64ISAR2_C=
LEARBHB_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>> +		 FTR_STRICT, FTR_EXACT, ID_AA64ISAR2_APA3_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>> +		 FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR2_GPA3_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64ISAR=
2_RPRES_SHIFT, 4, 0),
>> +	ARM64_FTR_END,
>> +};
>> +
>> static const struct arm64_ftr_bits ftr_id_aa64pfr0[] =3D {
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_C=
SV3_SHIFT, 4, 0),
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_C=
SV2_SHIFT, 4, 0),
>> @@ -158,8 +168,8 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr0[]=
 =3D {
>> 	S_ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR0_F=
P_SHIFT, 4, ID_AA64PFR0_FP_NI),
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_E=
L3_SHIFT, 4, 0),
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_E=
L2_SHIFT, 4, 0),
>> -	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
EL1_SHIFT, 4, ID_AA64PFR0_EL1_64BIT_ONLY),
>> -	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
EL0_SHIFT, 4, ID_AA64PFR0_EL0_64BIT_ONLY),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
EL1_SHIFT, 4, ID_AA64PFR0_ELx_64BIT_ONLY),
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR0_=
EL0_SHIFT, 4, ID_AA64PFR0_ELx_64BIT_ONLY),
>> 	ARM64_FTR_END,
>> };
>>=20
>> @@ -197,7 +207,7 @@ static const struct arm64_ftr_bits ftr_id_aa64zfr0[]=
 =3D {
>> };
>>=20
>> static const struct arm64_ftr_bits ftr_id_aa64mmfr0[] =3D {
>> -	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_EC=
V_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_E=
CV_SHIFT, 4, 0),
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_FGT=
_SHIFT, 4, 0),
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR0_EXS=
_SHIFT, 4, 0),
>> 	/*
>> @@ -243,6 +253,7 @@ static const struct arm64_ftr_bits ftr_id_aa64mmfr0[=
] =3D {
>> };
>>=20
>> static const struct arm64_ftr_bits ftr_id_aa64mmfr1[] =3D {
>> +	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_A=
FP_SHIFT, 4, 0),
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_ETS=
_SHIFT, 4, 0),
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_TWE=
D_SHIFT, 4, 0),
>> 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64MMFR1_XNX=
_SHIFT, 4, 0),
>> @@ -588,6 +599,7 @@ void update_system_features(const struct cpuinfo_arm=
 *new)
>>=20
>> 	SANITIZE_ID_REG(isa64, 0, aa64isar0);
>> 	SANITIZE_ID_REG(isa64, 1, aa64isar1);
>> +	SANITIZE_ID_REG(isa64, 2, aa64isar2);
>>=20
>> 	SANITIZE_ID_REG(zfr64, 0, aa64zfr0);
>>=20
>> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/inc=
lude/asm/arm64/sysregs.h
>> index eac08ed33f..54670084c3 100644
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -144,6 +144,30 @@
>>=20
>> /* id_aa64isar2 */
>> #define ID_AA64ISAR2_CLEARBHB_SHIFT 28
>> +#define ID_AA64ISAR2_APA3_SHIFT 12
>> +#define ID_AA64ISAR2_GPA3_SHIFT 8
>> +#define ID_AA64ISAR2_RPRES_SHIFT 4
>> +#define ID_AA64ISAR2_WFXT_SHIFT 0
>> +
>> +#define ID_AA64ISAR2_RPRES_8BIT 0x0
>> +#define ID_AA64ISAR2_RPRES_12BIT 0x1
>> +/*
>> + * Value 0x1 has been removed from the architecture, and is
>> + * reserved, but has not yet been removed from the ARM ARM
>> + * as of ARM DDI 0487G.b.
>> + */
>> +#define ID_AA64ISAR2_WFXT_NI 0x0
>> +#define ID_AA64ISAR2_WFXT_SUPPORTED 0x2
>> +
>> +#define ID_AA64ISAR2_APA3_NI 0x0
>> +#define ID_AA64ISAR2_APA3_ARCHITECTED 0x1
>> +#define ID_AA64ISAR2_APA3_ARCH_EPAC 0x2
>> +#define ID_AA64ISAR2_APA3_ARCH_EPAC2 0x3
>> +#define ID_AA64ISAR2_APA3_ARCH_EPAC2_FPAC 0x4
>> +#define ID_AA64ISAR2_APA3_ARCH_EPAC2_FPAC_CMB 0x5
>> +
>> +#define ID_AA64ISAR2_GPA3_NI 0x0
>> +#define ID_AA64ISAR2_GPA3_ARCHITECTED 0x1
>>=20
>> /* id_aa64pfr0 */
>> #define ID_AA64PFR0_CSV3_SHIFT 60
>> @@ -165,14 +189,13 @@
>> #define ID_AA64PFR0_AMU 0x1
>> #define ID_AA64PFR0_SVE 0x1
>> #define ID_AA64PFR0_RAS_V1 0x1
>> +#define ID_AA64PFR0_RAS_V1P1 0x2
>> #define ID_AA64PFR0_FP_NI 0xf
>> #define ID_AA64PFR0_FP_SUPPORTED 0x0
>> #define ID_AA64PFR0_ASIMD_NI 0xf
>> #define ID_AA64PFR0_ASIMD_SUPPORTED 0x0
>> -#define ID_AA64PFR0_EL1_64BIT_ONLY 0x1
>> -#define ID_AA64PFR0_EL1_32BIT_64BIT 0x2
>> -#define ID_AA64PFR0_EL0_64BIT_ONLY 0x1
>> -#define ID_AA64PFR0_EL0_32BIT_64BIT 0x2
>> +#define ID_AA64PFR0_ELx_64BIT_ONLY 0x1
>> +#define ID_AA64PFR0_ELx_32BIT_64BIT 0x2
>>=20
>> /* id_aa64pfr1 */
>> #define ID_AA64PFR1_MPAMFRAC_SHIFT 16
>> @@ -189,6 +212,7 @@
>> #define ID_AA64PFR1_MTE_NI 0x0
>> #define ID_AA64PFR1_MTE_EL0 0x1
>> #define ID_AA64PFR1_MTE 0x2
>> +#define ID_AA64PFR1_MTE_ASYMM 0x3
>>=20
>> /* id_aa64zfr0 */
>> #define ID_AA64ZFR0_F64MM_SHIFT 56
>> @@ -228,17 +252,37 @@
>> #define ID_AA64MMFR0_ASID_SHIFT 4
>> #define ID_AA64MMFR0_PARANGE_SHIFT 0
>>=20
>> -#define ID_AA64MMFR0_TGRAN4_NI 0xf
>> -#define ID_AA64MMFR0_TGRAN4_SUPPORTED 0x0
>> -#define ID_AA64MMFR0_TGRAN64_NI 0xf
>> -#define ID_AA64MMFR0_TGRAN64_SUPPORTED 0x0
>> -#define ID_AA64MMFR0_TGRAN16_NI 0x0
>> -#define ID_AA64MMFR0_TGRAN16_SUPPORTED 0x1
>> +#define ID_AA64MMFR0_ASID_8 0x0
>> +#define ID_AA64MMFR0_ASID_16 0x2
>> +
>> +#define ID_AA64MMFR0_TGRAN4_NI 0xf
>> +#define ID_AA64MMFR0_TGRAN4_SUPPORTED_MIN 0x0
>> +#define ID_AA64MMFR0_TGRAN4_SUPPORTED_MAX 0x7
>> +#define ID_AA64MMFR0_TGRAN64_NI 0xf
>> +#define ID_AA64MMFR0_TGRAN64_SUPPORTED_MIN 0x0
>> +#define ID_AA64MMFR0_TGRAN64_SUPPORTED_MAX 0x7
>> +#define ID_AA64MMFR0_TGRAN16_NI 0x0
>> +#define ID_AA64MMFR0_TGRAN16_SUPPORTED_MIN 0x1
>> +#define ID_AA64MMFR0_TGRAN16_SUPPORTED_MAX 0xf
>> +
>> +#define ID_AA64MMFR0_PARANGE_32 0x0
>> +#define ID_AA64MMFR0_PARANGE_36 0x1
>> +#define ID_AA64MMFR0_PARANGE_40 0x2
>> +#define ID_AA64MMFR0_PARANGE_42 0x3
>> +#define ID_AA64MMFR0_PARANGE_44 0x4
>> #define ID_AA64MMFR0_PARANGE_48 0x5
>> #define ID_AA64MMFR0_PARANGE_52 0x6
>>=20
>> +#define ARM64_MIN_PARANGE_BITS 32
>> +
>> +#define ID_AA64MMFR0_TGRAN_2_SUPPORTED_DEFAULT 0x0
>> +#define ID_AA64MMFR0_TGRAN_2_SUPPORTED_NONE 0x1
>> +#define ID_AA64MMFR0_TGRAN_2_SUPPORTED_MIN 0x2
>> +#define ID_AA64MMFR0_TGRAN_2_SUPPORTED_MAX 0x7
>> +
>> /* id_aa64mmfr1 */
>> #define ID_AA64MMFR1_ECBHB_SHIFT 60
>> +#define ID_AA64MMFR1_AFP_SHIFT 44
>> #define ID_AA64MMFR1_ETS_SHIFT 36
>> #define ID_AA64MMFR1_TWED_SHIFT 32
>> #define ID_AA64MMFR1_XNX_SHIFT 28
>> @@ -271,6 +315,9 @@
>> #define ID_AA64MMFR2_CNP_SHIFT 0
>>=20
>> /* id_aa64dfr0 */
>> +#define ID_AA64DFR0_MTPMU_SHIFT 48
>> +#define ID_AA64DFR0_TRBE_SHIFT 44
>> +#define ID_AA64DFR0_TRACE_FILT_SHIFT 40
>> #define ID_AA64DFR0_DOUBLELOCK_SHIFT 36
>> #define ID_AA64DFR0_PMSVER_SHIFT 32
>> #define ID_AA64DFR0_CTX_CMPS_SHIFT 28
>> @@ -284,11 +331,18 @@
>> #define ID_AA64DFR0_PMUVER_8_1 0x4
>> #define ID_AA64DFR0_PMUVER_8_4 0x5
>> #define ID_AA64DFR0_PMUVER_8_5 0x6
>> +#define ID_AA64DFR0_PMUVER_8_7 0x7
>> #define ID_AA64DFR0_PMUVER_IMP_DEF 0xf
>>=20
>> +#define ID_AA64DFR0_PMSVER_8_2 0x1
>> +#define ID_AA64DFR0_PMSVER_8_3 0x2
>> +
>> #define ID_DFR0_PERFMON_SHIFT 24
>>=20
>> -#define ID_DFR0_PERFMON_8_1 0x4
>> +#define ID_DFR0_PERFMON_8_0 0x3
>> +#define ID_DFR0_PERFMON_8_1 0x4
>> +#define ID_DFR0_PERFMON_8_4 0x5
>> +#define ID_DFR0_PERFMON_8_5 0x6
>>=20
>> #define ID_ISAR4_SWP_FRAC_SHIFT 28
>> #define ID_ISAR4_PSR_M_SHIFT 24
>> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/includ=
e/asm/cpufeature.h
>> index f7368766c0..4719de47f3 100644
>> --- a/xen/arch/arm/include/asm/cpufeature.h
>> +++ b/xen/arch/arm/include/asm/cpufeature.h
>> @@ -230,6 +230,7 @@ struct cpuinfo_arm {
>> union {
>> register_t bits[3];
>> struct {
>> + /* MMFR0 */
>> unsigned long pa_range:4;
>> unsigned long asid_bits:4;
>> unsigned long bigend:4;
>> @@ -240,16 +241,21 @@ struct cpuinfo_arm {
>> unsigned long tgranule_4K:4;
>> unsigned long __res0:32;
>>=20
>> + /* MMFR1 */
>> unsigned long hafdbs:4;
>> unsigned long vmid_bits:4;
>> unsigned long vh:4;
>> unsigned long hpds:4;
>> unsigned long lo:4;
>> unsigned long pan:4;
>> - unsigned long __res1:8;
>> - unsigned long __res2:28;
>> + unsigned long specsei:4;
>> + unsigned long xnx:4;
>> + unsigned long twed:4;
>> + unsigned long ets:4;
>> + unsigned long __res1:20;
>=20
> We might as well complete the fields by also adding hcx, afp, ntlbpa,
> tidcp1, cmow. What do you think?

Ok.

>=20
>=20
>> unsigned long ecbhb:4;
>>=20
>> + /* MMFR2 */
>> unsigned long __res3:64;
>> };
>> } mm64;
>> @@ -293,7 +299,9 @@ struct cpuinfo_arm {
>> unsigned long __res2:8;
>>=20
>> /* ISAR2 */
>> - unsigned long __res3:28;
>> + unsigned long wfxt:4;
>> + unsigned long rpres:4;
>> + unsigned long __res3:20;
>=20
> Also here we can add gpa3, apa3, mops, bc, and pac_frac?

Ok.

Cheers
Bertrand

>=20
>=20
>> unsigned long clearbhb:4;
>>=20
>> unsigned long __res4:32;


