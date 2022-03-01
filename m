Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A58F4C8CD6
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 14:42:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281469.479813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2lc-0005cx-FU; Tue, 01 Mar 2022 13:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281469.479813; Tue, 01 Mar 2022 13:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2lc-0005Zt-BT; Tue, 01 Mar 2022 13:42:16 +0000
Received: by outflank-mailman (input) for mailman id 281469;
 Tue, 01 Mar 2022 13:42:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNgs=TM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nP2la-0005Zl-OA
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 13:42:14 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66a805c0-9965-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 14:42:14 +0100 (CET)
Received: from DB6P18901CA0007.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::17)
 by AM0PR08MB5460.eurprd08.prod.outlook.com (2603:10a6:208:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 1 Mar
 2022 13:42:04 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::bd) by DB6P18901CA0007.outlook.office365.com
 (2603:10a6:4:16::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Tue, 1 Mar 2022 13:42:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 13:42:04 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Tue, 01 Mar 2022 13:42:04 +0000
Received: from e39459335042.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7498BAF1-A7B9-4C84-A273-F72C58736038.1; 
 Tue, 01 Mar 2022 13:41:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e39459335042.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Mar 2022 13:41:53 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by AM5PR0801MB1938.eurprd08.prod.outlook.com (2603:10a6:203:4a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 13:41:51 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 13:41:51 +0000
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
X-Inumbo-ID: 66a805c0-9965-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7+NjUtIl4PtuQwZtk4J6GpMswcXb9VYN05c0Y1IzzQ=;
 b=7FVaZbuiYq5Uml/8omSPN8vgoQcK81rdMR753/l+07uCQSn8MZYYi0mBQhNBB9bvGYCXYiSrZUTqd68uFEpENkbwnp0udHpSXxq5kobBKH/RjKXX1gfqGoIjeO504k/orltwyy9pqifZHg7GGKwK5LUOWFXxHxBrbZdXJso8eYo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 434c5e17371c0bf4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfvXUOfQB1FtJc2fD/wR4pcc9MW6xp3IG7SsL6tyzYFHbgWQE1kwvs3j4o/dNblp8SktFyEqGEeslTO+laAQzcXMX7/VZjL8NircxpYBosbuAJ0yB6DmODd8M5Hrm5nDwG4T4vWjjOE4NY+9DbCa5cbemHf6Dk++LMYSzEYba5RGAUDMorB0l3TS48CVYcUIj1iqFUloZR04mmM96I28kVSsoV0Jlg6PpANJ4arLcNRA7fIxwKaGPHaWtikK9/HtPpx08jx/w7zphn7E33STav4JTlF7F5dcJP8X5YjYjjHtxoCKUEzJmNCP+qpM9JCwm4IzAnG8VZ2UcG4hqE8Knw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7+NjUtIl4PtuQwZtk4J6GpMswcXb9VYN05c0Y1IzzQ=;
 b=jSx+lcmEn7bWLI76bG14n2JpdV14ThzaEO4ojm7vtH/TOT/N4zYES5GQLGRkeaXFco8y2q/GDI9HrRXT7hKgK2W+F3ZWg5p2oWLFAfxIidJEgMACKJmUUxrrMWyxOL8roAVzt1It75fzjtoB4inSXQhMFy2+z+oCasN/v2aARc1m0LW9WhYhQv155WV8isouPvDTyEkuhpQR4ocqZ1W/QohfuG36EOpS5SBylpi5+GejFGpPZ7RF4AbY2kXLoQxH18lZGUhb5N9RTRzFET1lMR4/GP7mcl4sHRxQOMBnzZj3PNeHKCoCWl7gHhH6P0SR0BMyJbWyvCfxUDfbY2j8Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l7+NjUtIl4PtuQwZtk4J6GpMswcXb9VYN05c0Y1IzzQ=;
 b=7FVaZbuiYq5Uml/8omSPN8vgoQcK81rdMR753/l+07uCQSn8MZYYi0mBQhNBB9bvGYCXYiSrZUTqd68uFEpENkbwnp0udHpSXxq5kobBKH/RjKXX1gfqGoIjeO504k/orltwyy9pqifZHg7GGKwK5LUOWFXxHxBrbZdXJso8eYo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michal
 Orzel <Michal.Orzel@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm32: head: Don't set r12 and update the
 documentation
Thread-Topic: [PATCH v2] xen/arm32: head: Don't set r12 and update the
 documentation
Thread-Index: AQHYLKgtSgsY3bUkq0KDQmgeSYVnA6yqiuQA
Date: Tue, 1 Mar 2022 13:41:51 +0000
Message-ID: <A1D67828-D79B-4EC4-820E-5253984A501A@arm.com>
References: <20220228133536.57004-1-julien@xen.org>
In-Reply-To: <20220228133536.57004-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: db0658ff-01ab-4a3e-8490-08d9fb894590
x-ms-traffictypediagnostic:
	AM5PR0801MB1938:EE_|DB5EUR03FT024:EE_|AM0PR08MB5460:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB546084A01A2E99C2C71139F69D029@AM0PR08MB5460.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 urG9u9MkH6bk74nbenzEnNotWncfAi9iCIy31oe4G4nvFAc1Mtkf7fDKCG9EHVEa2j+HjvES654/TdJ/dtpbC/nlEF35S108/8+A0gksdZNagSKs6CBWZTLQqs2ySjx5fr4+sg2OOQE/MAhdfT6Ot27eqT60XyctY1i3eAiH2JGcZlE4kcq/TJqR1jOp8BJuzmsZNl7VyqfwjCHWtQ692w62VhiMmaAhmO+rq/vIuWvsSIrFC5rrzfmJ4asneOweOYAV2da8UAC2nEUqdnIpHB19gLHUofj1GbZHA+QrO9D2Woo768qpdffn8yZuFhlpjr888kvW898LheMBx2ov8a7LD5ZIJXspkj52iq6KtSGcG1T7vyDceMtaKiIuSeG6SSX+/1gwQ9GT1SihbEqjkcKdEm2MiDSaycHRJrPFpOZqsHEd47Y34z3gsClHTtLj7wh+IVhkEvyGeqj04tz7AWfritkFg0D1HB1msMdTV3J8ip5mB1AAFH2VU5/1lXSD8zPWX7R6z0dzXng8Mtyk5Fa87Vy2zg8vyxOt3mlfjONX/13lGS47MSKcQ8GZpHEhJrBjTbHxCFjx1a1fZ0FMF7yyFFf94Ei/UcRdtOouBoGyQHCL1y/BEkAU39drzpaCr6vEKXsz8DH2glWX4HqNXkFKwPQaXFBGDzoesmBShRX1bQAb8TeUVF5JQXyTOMJyzywfpz6axyxN7oq9XJCYvahK7Mu43ySw9D5tt8dIwMY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(66446008)(64756008)(66946007)(66476007)(54906003)(66556008)(86362001)(5660300002)(508600001)(83380400001)(4326008)(8676002)(122000001)(71200400001)(38070700005)(6512007)(38100700002)(91956017)(76116006)(36756003)(33656002)(2906002)(316002)(6486002)(8936002)(15650500001)(6916009)(186003)(26005)(6506007)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <466B31CA86310446BFEB74B70AFDD278@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1938
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3ca181af-f5fa-467f-9ffa-08d9fb893db5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6fL3EEJ09M4B/sV7OaQsmi+enpSNBEjHUtqRxt1Z6MHDxs9rzaDDp+Kw2gvy201tbe/r4ytecbRt4ebhDwmAmLCLNqUxjp0+0I5J41htpi/s8FfUxHBDFfm0d3y2T5rp65frgZwq1tdFdRkLDVsZikU6JiKtpXBbybA5NSoRAzKNQkJ1rSxJf8Iun+rDrAld7cRbEV8PP+J7X/lzvut5wvLIZu98VSQUA6JbksWZhLm3uX/7oUT1+0YYz0OvUKJTL4Idu7h7iwO8FYWMR2J9ydu4Ik3fnM/lm1HdzE6Q544YB9ul+pTTGvN+hdPrSE0lCfEHEw9J8ABB9yo0jbV5E0T9HbCU3BA2RMOgJA7gJmTvcVcDFO7bQ9UwVNi9IWTp4okeW9YqW3VvAjDcWgEsRSvpEPw6YruxknpCpWDLJ/pT9VXuN9tFIHRqtq/B5twG7AAmf3AsnzuJXfuiQyoMdTzRv0sKZgW1t3dBSkokQVm7KKiYzdWASvZUZzxdN62z1TPj8nfDRsrNzk22u9RKWnxhPwoOBDaLxmH679D6u6A3xDcnCsGtO+/eNOWq9OxZvp9Ww6yPtVFtOdS2Zu7hRpMJTm5OqZDFECOYyYwccoNO8295CVuM/I8nYeFuZOcAp5eSwRGuVMta3bqJhvt+U0lM3Mp1UETw2c+flxX7u+m0koAjbeZGnQtNig1pKH6f
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(83380400001)(8676002)(6862004)(4326008)(86362001)(336012)(70586007)(70206006)(47076005)(186003)(6506007)(2616005)(107886003)(26005)(36756003)(316002)(54906003)(6512007)(53546011)(36860700001)(508600001)(40460700003)(33656002)(6486002)(8936002)(356005)(82310400004)(81166007)(15650500001)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 13:42:04.5751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db0658ff-01ab-4a3e-8490-08d9fb894590
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5460

Hi Julien,

> On 28 Feb 2022, at 13:35, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Since commit 54c4ae18d158 ("xen/arm32: head: Rework and document
> launch()"), the boot code is setting r12 but not read it.
>=20
> So remove the two instructions setting r12 and update the documentation
> to show r12 has no specific purpose.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>    Changes in v2:
>        - Don't set r12.
> ---
> xen/arch/arm/arm32/head.S | 6 +-----
> 1 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 13cfc837d39c..7a906167efca 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -79,7 +79,7 @@
>  *   r9  - paddr(start)
>  *   r10 - phys offset
>  *   r11 - UART address
> - *   r12 - is_secondary_cpu
> + *   r12 -
>  *   r13 - SP
>  *   r14 - LR
>  *   r15 - PC
> @@ -166,8 +166,6 @@ past_zImage:
> #endif
>         PRINT("- Boot CPU booting -\r\n")
>=20
> -        mov   r12, #0                /* r12 :=3D is_secondary_cpu */
> -
>         bl    check_cpu_mode
>         bl    cpu_init
>         bl    create_page_tables
> @@ -206,8 +204,6 @@ GLOBAL(init_secondary)
>         adr   r9, start              /* r9  :=3D paddr (start) */
>         sub   r10, r9, r0            /* r10 :=3D phys-offset */
>=20
> -        mov   r12, #1                /* r12 :=3D is_secondary_cpu */
> -
>         mrc   CP32(r1, MPIDR)
>         bic   r7, r1, #(~MPIDR_HWID_MASK) /* Mask out flags to get CPU ID=
 */
>=20
> --=20
> 2.32.0
>=20
>=20


