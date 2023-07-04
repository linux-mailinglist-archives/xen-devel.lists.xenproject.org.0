Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A127473D0
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 16:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558389.872436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgmT-0007oZ-MR; Tue, 04 Jul 2023 14:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558389.872436; Tue, 04 Jul 2023 14:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgmT-0007ms-JJ; Tue, 04 Jul 2023 14:13:25 +0000
Received: by outflank-mailman (input) for mailman id 558389;
 Tue, 04 Jul 2023 14:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kGqQ=CW=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qGgmR-0007mm-Nk
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 14:13:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee77fe87-1a74-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 16:13:21 +0200 (CEST)
Received: from AS9PR06CA0612.eurprd06.prod.outlook.com (2603:10a6:20b:46e::19)
 by AS8PR08MB8490.eurprd08.prod.outlook.com (2603:10a6:20b:567::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:12:52 +0000
Received: from AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::4f) by AS9PR06CA0612.outlook.office365.com
 (2603:10a6:20b:46e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Tue, 4 Jul 2023 14:12:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT055.mail.protection.outlook.com (100.127.141.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 14:12:51 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142");
 Tue, 04 Jul 2023 14:12:51 +0000
Received: from 8ad9a455646d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83C93626-230B-4196-887B-5DE607006AE6.1; 
 Tue, 04 Jul 2023 14:12:40 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8ad9a455646d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 04 Jul 2023 14:12:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:12:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 14:12:38 +0000
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
X-Inumbo-ID: ee77fe87-1a74-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEE8KzgJlSHeDg/R+ZsjJ/WFXESyQ2awb5p+KmS80/4=;
 b=uLnIWMwTeXgU2rI3r1b6y1mUNF4NYYJtvTbW4OU7z3HiEWd8fp1h3uh/5Zs3TzAp1+UWm+czHfRbkc9XXVn3p9IpUXtz214ujTCnHcUeesfwpKQmPE4Oxo8WEvJb3oghsXCnoPjpOWox3yDl3NkBqdwMsjx+lzLIpJWoc/0TXJY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bc67a2cc176925e3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QMXZxLY1tkKhEZ3mhtS12VF0i8KxFvQOfNNRclrNZFUNs/eScF2ppk3y86tVRKYoJq9enNEhYIu+ZAWQ/ytT5U91Nitm8K1d2cRAsY1J9C3lV/VzBj6bKDeiZdyJMx0qyeQrSqzq/A7ckBXFWRBBoX8fo6eejuag4oo1c2uxbG2sWDJdNvF3IlPuEudnv8WTZznAo6WsYOE+VdXY8o/IbTLuo3inOn+/rvPI5ORUh3DuRBn14zzgmnKioHO4u6f1JjIduI8/J35hS5wd/+tNpkQgG4CB6UemFdIYSrSIFQsGO9FJN2RatYOBMfxW84pe0e8B2g8+oWyhKnZPcOBNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IEE8KzgJlSHeDg/R+ZsjJ/WFXESyQ2awb5p+KmS80/4=;
 b=mBBGZgz4fLXBCedR4hjQ0TRFMSvUDiVejSEbCh0nXDiMcgKEdq2Sx7dvU5vOmoGjuz+MPDbVE80eQRIl9r5WdnBDKmlhA/NM/kxT/3DI8pEw45xUOKGs9YSUCAApCLQEPGrWGwft0lNHpjycL2nZweowF+I5g54DS3OpeXdALWBruh7dUGPNqaOuc+bxc66YOmoZHv3LupdiGilNVD4cmbIMBjI5fr3nfBUBo9W9Mwh5F615BobJ4QPvG1VQvNzV5GA4hpgLI32uw9Soe2vz3MgxrXPwBnC0WtPBuPArYs5MctJStk9D+gwVyKQeeyX5lKYvXsu3YPgNJ3jV2X1cjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEE8KzgJlSHeDg/R+ZsjJ/WFXESyQ2awb5p+KmS80/4=;
 b=uLnIWMwTeXgU2rI3r1b6y1mUNF4NYYJtvTbW4OU7z3HiEWd8fp1h3uh/5Zs3TzAp1+UWm+czHfRbkc9XXVn3p9IpUXtz214ujTCnHcUeesfwpKQmPE4Oxo8WEvJb3oghsXCnoPjpOWox3yDl3NkBqdwMsjx+lzLIpJWoc/0TXJY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, Henry
 Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: Re: [v2 2/4] xen/arm32: head: Don't map too much in boot_third
Thread-Topic: [v2 2/4] xen/arm32: head: Don't map too much in boot_third
Thread-Index: AQHZqsXz4VnOLQ2i/U6Z6/jlIuCSGK+prZQA
Date: Tue, 4 Jul 2023 14:12:38 +0000
Message-ID: <CC83991E-F43E-441C-B13E-4EF976815F7A@arm.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-3-julien@xen.org>
In-Reply-To: <20230629201129.12934-3-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS2PR08MB10055:EE_|AM7EUR03FT055:EE_|AS8PR08MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bd1ef2-fda8-47d7-7a67-08db7c98c0e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1+e09frmHXiQweB3W+FBMHcjqkZYfHxxuOPEOxMN4NTRexyy/yKXidlQXikXWsEGM1uX5DftTCAf1VBQfEvm5VSMHJBM4V9UY+kdgxWNxn83BAs04xK+rYwOyA+BBX1O2koheCUAUkNFuD4qzJJ4QKyrq97E4oQElbQgqD2QjTTnyP8tCQxlpDanwUwK84rL7tMdPsWMjOsDWPPSbf8lzkyRm1PQrUV1YZo+uerlg8fuU0177kpiBTJVaD5ijFmr96YbsgmML6G2KwV0O4A9Rkwq1SMBswFJ0zpsd4siXMJCSTFirMSvgSGvXJrT1voAaESFTnUOSh84zvNDrB0Tu5UxMTu8X71RWrXzSZLDtbUzBJe/vn4NIzyM4peRxKwukDzDZsURGTYtPuCTka3llPbo0FdhA0+wvEReoKEwHQoXg+Tqg+HUYdzf/FzMjPesS9YytzD03OnQfqeccym0mMei6xlqWcvXXqma+cBxlwsOnu0kODuUnHqO/wOZFSUcFjJZjBGRkvMdAndfnSIqrwQB5bRtzUTtB3RSftaY2cpIj1OPCQ9TihL7/X3FOdhmZUxFDN1XI+A0koyZ4BCiS9SKtC7drD2DdqT6GQQYPSs+aFIiNHAadCJOKv6UVHlsVQGn9lr4tVht/BWyjOS2Mw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(38100700002)(71200400001)(33656002)(2906002)(6486002)(8936002)(38070700005)(8676002)(54906003)(36756003)(41300700001)(5660300002)(478600001)(76116006)(6916009)(66946007)(66556008)(66476007)(64756008)(53546011)(91956017)(66446008)(6512007)(186003)(6506007)(86362001)(4326008)(316002)(2616005)(122000001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C482A17C08921546B465F6F869432BC0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b867d68a-a0bd-4c33-db23-08db7c98b91f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T8WQrfGY15rnX5DnFwho78mzR0tV326B1lOXSbEJWx3SemNG+y8YeE6fpQ7bL9hlTWqRgr0IJfx8td/Qb27J2ADVMve+KsJRU8cyiMw9yQSgI3Fv6ikK+4VoJSE/QGtZ1j0cHcCmtE6pKDvEMx/8w5yCqtx1STeA1JSaStDCm70Y+b+W3jrvMxLcg/LXa7hVWzhxymf+GIMOtj+rWuKnbaVhkUt2gzXofKKkObu5/xkwVpQoWGvrqY27JPAsPFKUMBdHODIwoX4968HGHVhmAsIQYlI9E6wQwnJM4pPL0yAgb1zkIDiFQ44hZMAnjGKDAMcwAGCyCDD2Sx7nYqCNimWCrhJ70x4nmbMGdIlnNVI/Onubsxe6RySED8fDW/Cx2FL/dpSbZVIY/x2ZTHYxld8qzbiaEvNFBuK8oykU1liToCH3kxDRpcoU10eX2+RgrtHvzuum8Q9OP5Vycg2rb9CuRdD9hPDLQ2cI/EBnpceXO3RT5JdSGsR2/7QIgnavvonChxso+HWdNAprihkh+46mKz8naudjhB5cmV0YyqdU3A6+JKq+ug/JAxutxHVAa+wvV7uloceKyRSGvV51Fs7mQ+ukCXP4MN8sxMZ7w+xdcURCGOncMKiwg422cE1rgP+k9jyXoMTaDL+Twysg+T2BOgh655pJv6YKG3Fie5QeYZhj4HFGxpUVNVYmW18s/uKK7oQaMCAcvoOqcNz7N6BZzNhalOuooe4BoDBflNUzNeKYOSF2P4bioD+jsVTf
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(107886003)(26005)(478600001)(6506007)(82740400003)(6512007)(86362001)(2616005)(186003)(53546011)(81166007)(54906003)(4326008)(70586007)(36860700001)(83380400001)(356005)(336012)(6486002)(316002)(70206006)(47076005)(8676002)(8936002)(6862004)(40460700003)(41300700001)(2906002)(40480700001)(5660300002)(33656002)(82310400005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:12:51.5832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bd1ef2-fda8-47d7-7a67-08db7c98c0e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8490

Hi Julien,

> On 29 Jun 2023, at 22:11, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, we are mapping the size of the reserved area for Xen
> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
> after Xen, so it is not a good idea to map more than necessary for a
> couple of reasons:
>    * We would need to use break-before-make if the extra PTE needs to
>      be updated to point to another region
>    * The extra area mapped may be mapped again by Xen with different
>      memory attribute. This would result to attribute mismatch.
>=20
> Therefore, rework the logic in create_page_tables() to map only what's
> necessary. To simplify the logic, we also want to make sure _end
> is page-aligned. So align the symbol in the linker and add an assert
> to catch any change.

The last 2 sentences actually belongs to patch 1 and have been copied
here. Please remove them on commit as alignment of _end is not in
this patch.

>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>=20
With commit message fixed on commit:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
>    Changes in v2:
>        - Fix typo
>        - Add Michal's reviewed-by tag
> ---
> xen/arch/arm/arm32/head.S | 15 ++++++++++++++-
> 1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 1ad981b67460..5e3692eb3abf 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -459,6 +459,19 @@ create_page_tables:
>         create_table_entry boot_pgtable, boot_second, r0, 1
>         create_table_entry boot_second, boot_third, r0, 2
>=20
> +        /*
> +         * Find the size of Xen in pages and multiply by the size of a
> +         * PTE. This will then be compared in the mapping loop below.
> +         *
> +         * Note the multiplication is just to avoid using an extra
> +         * register/instruction per iteration.
> +         */
> +        mov_w r0, _start            /* r0 :=3D vaddr(_start) */
> +        mov_w r1, _end              /* r1 :=3D vaddr(_end) */
> +        sub   r0, r1, r0            /* r0 :=3D effective size of Xen */
> +        lsr   r0, r0, #PAGE_SHIFT   /* r0 :=3D Number of pages for Xen *=
/
> +        lsl   r0, r0, #3            /* r0 :=3D Number of pages * PTE siz=
e */
> +
>         /* Setup boot_third: */
>         adr_l r4, boot_third
>=20
> @@ -473,7 +486,7 @@ create_page_tables:
> 1:      strd  r2, r3, [r4, r1]       /* Map vaddr(start) */
>         add   r2, r2, #PAGE_SIZE     /* Next page */
>         add   r1, r1, #8             /* Next slot */
> -        cmp   r1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512*8-byte entries per pa=
ge */
> +        cmp   r1, r0                 /* Loop until we map all of Xen */
>         blo   1b
>=20
>         /*
> --=20
> 2.40.1
>=20
>=20


