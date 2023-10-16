Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A83BD7CA8D5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:09:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617536.960198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNL9-0002d1-0O; Mon, 16 Oct 2023 13:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617536.960198; Mon, 16 Oct 2023 13:08:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNL8-0002Zu-Tk; Mon, 16 Oct 2023 13:08:58 +0000
Received: by outflank-mailman (input) for mailman id 617536;
 Mon, 16 Oct 2023 13:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fsKw=F6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qsNL7-0002Zo-77
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:08:57 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 283917e3-6c25-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 15:08:54 +0200 (CEST)
Received: from AS9PR06CA0753.eurprd06.prod.outlook.com (2603:10a6:20b:484::9)
 by AM9PR08MB6291.eurprd08.prod.outlook.com (2603:10a6:20b:284::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 13:08:51 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:484:cafe::20) by AS9PR06CA0753.outlook.office365.com
 (2603:10a6:20b:484::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 13:08:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Mon, 16 Oct 2023 13:08:51 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Mon, 16 Oct 2023 13:08:50 +0000
Received: from 7e551297891f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A40BFDB4-125E-4A7D-872D-E4955B770E92.1; 
 Mon, 16 Oct 2023 13:08:39 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e551297891f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 13:08:39 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB9238.eurprd08.prod.outlook.com (2603:10a6:10:3fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:08:34 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:08:33 +0000
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
X-Inumbo-ID: 283917e3-6c25-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CRzj+Q6M5bEy6OHMLiujjYexY74oi0euhwRqE5xxKU=;
 b=v7Bq8zaqWwjLbEJzOZaQ1+UQxRD6JzoUJp8qXBzArsqF5tipI7uOdBZ+b2HZgLspNN/HETmKOH62Gi7+eMx+ac6e0ocvmaibj0vxDKAsRuvBwSu1UcDwXyIW9uqEIiu3qKVq0LS3kP4/9s/4JnABegJEKJFILkYkXcixC33bjMo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d0c0be91ec4a6991
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAzILOXH+zQjSRe5m6ggjTOWUQ52FNNSiImCodb6EaiXRCl1Qu6E961Jj2Oc9LKOG6JpqDGNOoKDAnwj6f4gWVVLX8OSc4Ckrb1W7KaMOwIvtI0SiolizbXLTrR5Tij5BdN7pwm5afYOovr1fF5C+23hMA0LZwxefiqbMvi0ISuV1VPGgV3yK9RRKGbZ1ckDpiB3Tk2e+4Zt2GG2hy9cKT0EaiTjQ8ih5hZzo47JbahFPR3vIsCzonmiAxd+AZOhh2erY91MAM2hEyozAiUvR8XdCaDYIb6Wv02wXwOI64OfEN18DEQEKWBGIHrQkIdS2FiOvTVTd+ihjUf0XR8JbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CRzj+Q6M5bEy6OHMLiujjYexY74oi0euhwRqE5xxKU=;
 b=clhP4m8IswwSlaK7drC40XEluaED9fRHQavOV9JTjVlF7++9CDeOW0N8M5cMZGV+XpBdOMpiW1eAKFXbaQpJxL/HfEWhqxVlzl+yRvkYMIFYQbOAnfM1LKa4coITcvCQfWaCV7BUYOUf/DtBTD5MaFo6gDtQyFHlRpYAUrgOSmgn1nFPrMtNxjHMdbI9ssNE1ApenUCM0WsTBvO/Vyh6IqbVYDe186bWm8mamuBOABj7yRPKcOHGYU1yBu5f+1ysBX9XdhYIB8SHwzX4mDw9D8qM8uIPZbgShQRsI4S62am9OpeaKYL6kmMYHF4zToTsFUCCAmKM7vlAT/lxnOgY6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CRzj+Q6M5bEy6OHMLiujjYexY74oi0euhwRqE5xxKU=;
 b=v7Bq8zaqWwjLbEJzOZaQ1+UQxRD6JzoUJp8qXBzArsqF5tipI7uOdBZ+b2HZgLspNN/HETmKOH62Gi7+eMx+ac6e0ocvmaibj0vxDKAsRuvBwSu1UcDwXyIW9uqEIiu3qKVq0LS3kP4/9s/4JnABegJEKJFILkYkXcixC33bjMo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.18][PATCH] xen/arm: Check return code from recursive calls
 to scan_pfdt_node()
Thread-Topic: [for-4.18][PATCH] xen/arm: Check return code from recursive
 calls to scan_pfdt_node()
Thread-Index: AQHaAC7Tqepkd8B7bkmUvN4/EZGGUrBMY1AA
Date: Mon, 16 Oct 2023 13:08:33 +0000
Message-ID: <AE8C023B-4C82-4D6E-8E7C-32E560CD874B@arm.com>
References: <20231016124559.8220-1-michal.orzel@amd.com>
In-Reply-To: <20231016124559.8220-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB9238:EE_|AM7EUR03FT003:EE_|AM9PR08MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 8aa8be33-8258-44f1-8bc4-08dbce490ac3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JA3BqsUwjwLc9vw4uxpZ4dbMzKXlNcMHvWx7BZ53dWqrslY3AMVkKqRnZhzk9i3M7rK3P/JBYT1Ka942iaheUiStBgD8z2D1VcIfoa+GsG6VFV70AUQHjxulkXgbF7bUugJBG7LnU9b6CR5Le9CmA0AHDkKWkZZLwd/s6d6Lgp7Q5nteFPug2xEOMlos24LyKhUzAmkurEbuEElMbx8oiXBRqA1ktJgZNrHwSbKJND0CdyCrAoHsK7ycS/E5DUf9TMEyBrzXeUVa8Xn3k49o665MYQjz2fUvu3/Dyz4lJ2WTR84XbnAMLBb9xmA0XwC7k4yGVzXeA0nYq033ynpp9AQHJWizG5YlD1kQ8UzlC9qP7qJIrPx+Zntk5C14x+OeryIhQp2nDb+OVfchZv+ErDcEZPymD2lxHy3kHKKP9MTcFgGkzgLdV4BMN+fz9wlEXcq2ipoJ5XclMJrWi3GZWo/IXg4aC+B9U1klqYPW0ZRlyVxTjSuitwaefLyYDFY3I7i3G+v4kJpnwpowMThO1D2r/eV+HoGlHvcOFJX/PmP2L0wNJIiDCRqn9nB7grcIf8L1i5snvzMlPY/+4xUuig10gPvSqwjBg4jdMggh/KiF4n0DFxdL2BnmA+3mMBTnyEQ0WuNBgezpHeL1cRmk0w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39850400004)(346002)(396003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(66446008)(478600001)(76116006)(6916009)(66476007)(66556008)(66946007)(64756008)(91956017)(2616005)(316002)(6506007)(71200400001)(6512007)(26005)(53546011)(54906003)(5660300002)(8676002)(8936002)(4326008)(2906002)(41300700001)(86362001)(33656002)(36756003)(122000001)(38070700005)(38100700002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <475A0AA6B6A2704DBF86CE9F3F56ADA2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9238
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	910fca28-ae21-4cb2-4a1d-08dbce49002f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cqnx45v+Tg0mBW80u2ysRG2tdbZ08eQX9wZDjIXFsIc0xm1ew4n0wwZrBHcu//4nvEpsC2FYImrLzccbr1yGxRM16+4D2ogUuHgtu7fydrpc1byY+aTwbeLArdIaUw8gGO3M5x8R+j1wWv/r389uaXoOExl9g6N6wpM8aBaSv1QFK4Vlj6ettCBhfKgHnq24mHyGHcS4hpRSxrmmxNfGFt2pyoll8mNBeSBtSH7colOEp7rxfwvlGQs2A9sTOqWSzVZulhmQTRhAkhuTjmnQ3nKv1tuYNVZhkvaHCpIURalXFUCFlUBAknn3HOHzk8MpYR0IrbaG568wQogiFdlb3zFsqnAnH3WfA9s1P4lj1VRMpkj01Mxjb3wuN0SdXIk1tbdok5lN29qtxQ5NFkO+qmQAtwHYirG+7TRVnpWNs3Yqf97C5CtW5FhpqExgUB5yz7zSJGWMBQN6MQYyA5GFImx+8hCTsS8LqxLJVhYhJzY+fjLCNTrWq/2joGpxrmKIimVSMEXgJy4KuVaK4CymgiAkGLOf5Va39Hv8LXxOri7fM1KuZfuiBK+FG1d5DogRACfYDMKnd0l2J1kYqnSqicMFOcBaEeDnJDteU+RDFIErFP2VyIeQlidC/Nz7Dokk8oUXLs61RPRDIKDFbonXaPsOd53qeVTTUNGuwrG5Uryf81m1TfxscqZ+BRX1/DVSJimtLxAfPyGJSNxPCcH7aZ8M4+nWtJSX8P37wHrLyV9DDzMJp8Yq4dZEXDjJMJOx
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(33656002)(40480700001)(8936002)(8676002)(6862004)(4326008)(5660300002)(2906002)(41300700001)(40460700003)(86362001)(36756003)(6506007)(82740400003)(356005)(81166007)(2616005)(26005)(83380400001)(6512007)(478600001)(336012)(36860700001)(6486002)(47076005)(53546011)(316002)(54906003)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:08:51.0954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aa8be33-8258-44f1-8bc4-08dbce490ac3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6291



> On 16 Oct 2023, at 13:45, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> At the moment, we do not check a return code from scan_pfdt_node()
> called recursively. This means that any issue that may occur while
> parsing and copying the passthrough nodes is hidden and Xen continues
> to boot a domain despite errors. This may lead to incorrect device tree
> generation and various guest issues (e.g. trap on attempt to access MMIO
> not mapped in P2M). Fix it.
>=20
> Fixes: 669ecdf8d6cd ("xen/arm: copy dtb fragment to guest dtb")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Hi Michal,

Yes makes sense!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


> ---
> @Henry:
> This is a bug fix, so I think we should have it in 4.18 given the possibl=
e
> consequences I described in the commit msg. I don't see any risks as this=
 change
> only checks the return code for an error.
> ---
> xen/arch/arm/domain_build.c | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 24c9019cc43c..49792dd590ee 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2872,8 +2872,11 @@ static int __init scan_pfdt_node(struct kernel_inf=
o *kinfo, const void *pfdt,
>     node_next =3D fdt_first_subnode(pfdt, nodeoff);
>     while ( node_next > 0 )
>     {
> -        scan_pfdt_node(kinfo, pfdt, node_next, address_cells, size_cells=
,
> -                       scan_passthrough_prop);
> +        rc =3D scan_pfdt_node(kinfo, pfdt, node_next, address_cells, siz=
e_cells,
> +                            scan_passthrough_prop);
> +        if ( rc )
> +            return rc;
> +
>         node_next =3D fdt_next_subnode(pfdt, node_next);
>     }
>=20
> --=20
> 2.25.1
>=20
>=20


