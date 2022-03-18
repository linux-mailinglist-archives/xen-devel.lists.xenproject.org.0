Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ACD4DD860
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 11:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291972.495908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVA6A-0001BK-9E; Fri, 18 Mar 2022 10:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291972.495908; Fri, 18 Mar 2022 10:44:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVA6A-00018l-4m; Fri, 18 Mar 2022 10:44:46 +0000
Received: by outflank-mailman (input) for mailman id 291972;
 Fri, 18 Mar 2022 10:44:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eO1Z=T5=arm.com=Hongda.Deng@srs-se1.protection.inumbo.net>)
 id 1nVA68-00018f-Fz
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 10:44:44 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0600.outbound.protection.outlook.com
 [2a01:111:f400:fe05::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6acae4ab-a6a8-11ec-8eba-a37418f5ba1a;
 Fri, 18 Mar 2022 11:44:42 +0100 (CET)
Received: from DB9PR01CA0005.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::10) by AM6PR08MB4628.eurprd08.prod.outlook.com
 (2603:10a6:20b:c6::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Fri, 18 Mar
 2022 10:44:39 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::6a) by DB9PR01CA0005.outlook.office365.com
 (2603:10a6:10:1d8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17 via Frontend
 Transport; Fri, 18 Mar 2022 10:44:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Fri, 18 Mar 2022 10:44:39 +0000
Received: ("Tessian outbound 2877e54fe176:v113");
 Fri, 18 Mar 2022 10:44:39 +0000
Received: from c66dd8f3c567.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 953A755E-EFF4-419E-82D2-5353E788A6D0.1; 
 Fri, 18 Mar 2022 10:44:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c66dd8f3c567.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Mar 2022 10:44:28 +0000
Received: from DBAPR08MB5670.eurprd08.prod.outlook.com (2603:10a6:10:1a6::24)
 by DBBPR08MB4888.eurprd08.prod.outlook.com (2603:10a6:10:db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Fri, 18 Mar
 2022 10:44:27 +0000
Received: from DBAPR08MB5670.eurprd08.prod.outlook.com
 ([fe80::5c2f:44a7:10ba:1605]) by DBAPR08MB5670.eurprd08.prod.outlook.com
 ([fe80::5c2f:44a7:10ba:1605%5]) with mapi id 15.20.5081.015; Fri, 18 Mar 2022
 10:44:27 +0000
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
X-Inumbo-ID: 6acae4ab-a6a8-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMe/W6yiUE58/gP+OtO63/luhthU9svKfqgfdW/Eg7o=;
 b=NDKStIZfUvntaG9nA2jDSj47QjCAe4SpnDVGPfCmAZSjbKTsroEpiG/GisStr+gAg+Pk7TSmR4rke/ZFdXKuyvvAtyf9ljMNvmd3L8/WxjuPf0O80p+P1NROh1ZqYEoRUhutmU+f1Sgi3dmAk3D2qUjv8j0x7qKNPcdk8zfzyDM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVvp2SpREyaEVGeWFyeNvPFq0uanRIWhKxtNKnHmK5/VRBgXgPMBUf2lylQd9eU8cH+nVtnzSjIbHqfPwInmEn4+eXvyjjMRi/23xPfwx90r6yCIt7vaeWrVzGdefiY+z4Z+7EjxpGt4y8DpV7EJfNbbZzZFBB0W/dnp/AlZOmrL05qlMqNrD7YG2Armn/IZFuMbzn/i3uMFNqqmOgAaOB3KhA7t3+wvVl3KQYWFXLqLNQsVtEZJSBJ8q9XnJNr0F0nju0DN7nxD4zIguSlVD9iA6uUzNYJLxeyvg9Z9ODvmxbJuu0gF8E+m8V6qGWVZKnrpfS6WSvybFvhiQoo4nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMe/W6yiUE58/gP+OtO63/luhthU9svKfqgfdW/Eg7o=;
 b=Lktv72yZSKTKFFF8meExwKDdeONu1qRrTSPfg1Pr0enWemE4HwhtgC4q+9e2tbEbNboGldTkg1eRRt0GRIVlTiU4DjedIKulUp4D0wE6y5XvJ3kh7eQVqcqK0/NaFy2eWbSPD0A4Tnw5+g1/f+wBO2pU58JA20xsDnl3daJcP2EJ3e9qfX0Tkja1D7oKg4tP7BorVaVwfnuMTDkWNng24fwUqo6LF8ftNUBCapRxJp8ICAGiw6JxSOp2LfGNK7sdhKGgJmShowp8lu40vZqxnd0Tjs4G79CQFAWgug3ZvleDavBvZve/DHcsyo34b66bmAwRwRndvAQegsW/KGt2RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMe/W6yiUE58/gP+OtO63/luhthU9svKfqgfdW/Eg7o=;
 b=NDKStIZfUvntaG9nA2jDSj47QjCAe4SpnDVGPfCmAZSjbKTsroEpiG/GisStr+gAg+Pk7TSmR4rke/ZFdXKuyvvAtyf9ljMNvmd3L8/WxjuPf0O80p+P1NROh1ZqYEoRUhutmU+f1Sgi3dmAk3D2qUjv8j0x7qKNPcdk8zfzyDM=
From: Hongda Deng <Hongda.Deng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v3 09/19] xen/arm32: mm: Check if the virtual address is
 shared before updating it
Thread-Topic: [PATCH v3 09/19] xen/arm32: mm: Check if the virtual address is
 shared before updating it
Thread-Index: AQHYJwz7RRsWd4YAY025+kUgGPgDkazE99jw
Date: Fri, 18 Mar 2022 10:44:27 +0000
Message-ID:
 <DBAPR08MB56703D6319722AD86C10A77FE6139@DBAPR08MB5670.eurprd08.prod.outlook.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-10-julien@xen.org>
In-Reply-To: <20220221102218.33785-10-julien@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: CC2C79793D1146419EBB18C8CAB05D8E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 2274842f-e77b-444f-95d9-08da08cc4d90
x-ms-traffictypediagnostic:
	DBBPR08MB4888:EE_|DB5EUR03FT042:EE_|AM6PR08MB4628:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4628871666C88123A5AA7147E6139@AM6PR08MB4628.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9xaBoPjMV4Typi/e8hHl8dxqLiOUM2c9ueKNb3pN5d6ezfiU0B/gbq2S397aoOsHZ2/llmjQbqLsKkCL1ghMmYnft6Zkr0BDaw3T9IpWh8Mwv7I/7M616Z7EuXg0jqQCkrDF/IwvClBgds6JaoCzsoNOXjEFCfEuLwtNIe2jJNzTmDOeVasmTlFg7ZoAIxVPDqQNFgrxe9zKpEqbRZMUFI1xdAdnsdgt2Hq3Z/WhQhpQTDfcbYkBlY82J+iOAroxsmhmN/V0mlWx7a2ku8jN1pONcgO+zIp5vUw+98h7BGomQSDlNyuoVgvs9KUjjHFYBlmBn6598x9lVNffOOCnRZDSWihKvM7TYCU7nTRkYvsHPwH9hI3V3KnnQuYJiW5svAELHK8BWHDja99+NLwL/4mjjjUOWJQJ2XobrnY8rySRmTsdIbL1oh5UH+L4+Vjndd5bQZV8tJ11zV0+D+bqdQp/WvgEZwG3zNUXT7HdKL+b1ZTDvihnOVXBVZnpH6c+I5r5JCHyu+768qwPymzIy13wDfcS0h3fEHl6vfGeYgn3CAxI4x6em5JdIjDvFK5sGJTCdm+sYpwHPw6o/+xMn/7+Z3n8lWjKKREk/LQXLueKz3DUBf+5APNjt+AcbSsT9WKeTEAih96u2XfU8Hrz8zYMveUlXfxS7hH4+95Ko/qAYveFFXWq4oLgUQ1hVOFFeXPhZ1YG7vEGa10HGjMQ0+KZjbV4a9PXnL6RnwlWO5M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5670.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(66476007)(66446008)(64756008)(26005)(66946007)(52536014)(33656002)(66556008)(55016003)(8676002)(110136005)(76116006)(4326008)(6506007)(316002)(508600001)(7696005)(53546011)(54906003)(55236004)(5660300002)(9686003)(86362001)(38100700002)(83380400001)(71200400001)(8936002)(122000001)(2906002)(38070700005)(21314003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4888
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8cc51a03-4118-4af3-7554-08da08cc465a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c3wFQQAI4tkPw7ZDOSh+7hTFSXD/CVvRWYRJMHvTL+nZvBqoweZOWC7tVkkYeHbDPiWwhu5DrLY5x0W3O1zKZuZ3ErnEJuN7zrrwra8Ti61dtOz3l/yzH6IS1HQv7Wit0OVHRAUqcJdT7FtyWFZ0ZQo57+qbe/iPoZbKb8r+UKJDWuAAwobfNipGFyx8U/dgNXqnKhhCoKgBWGS7O/qp2fhxWy9wATGZkoa3SOq+ilPefaGs97uUU7UmBLl60nB/3hEMiCIIzEB5exkRrf88FFCLYowkUh+bI1Wm+JdtHh18APJwRcwXB2T0LuS5uoEm5tGavYFTSJZ5/5a/pfqI9q2H+cSO7snIrWy9MxVeDQCOoOdE8o2enDt5ZVBZnvmXpYZJfMeD3AMj57cNopHDtJErCYvJT5z+vUa5Q0jMNaiKrDFXSHo7XE7eGAwWNDl0/G5MCJNkG4SqKII5Pi5Fpeirxx+ZzbzVGS37cBE65f6LS1/h/NLvYFQPuy+Cek/RtVX21gLhencc4fXzZ331f83NhuHXIpWqawssOKhFbXwwzPexl7Aj+sG4GnnQ3ZqZokfpQdDhbKKAKUPoQiyjv0ZlY0cjEOR9j2elN+giSi54T9zbpDucGAq2XBZvhGfUmRCroYKbKeKksTFY9BOwR+k/aZaeoUMqQDj0M9314d674TgjW8HscyhFsrkhI+oxfhKC5lsjIOVznGy29Qwnog==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(53546011)(7696005)(26005)(186003)(6506007)(9686003)(316002)(2906002)(40460700003)(107886003)(54906003)(8676002)(508600001)(36860700001)(336012)(55016003)(52536014)(83380400001)(47076005)(356005)(33656002)(70586007)(86362001)(5660300002)(110136005)(4326008)(70206006)(82310400004)(81166007)(8936002)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 10:44:39.4018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2274842f-e77b-444f-95d9-08da08cc4d90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4628

Hi Julien,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jul=
ien
> Grall
> Sent: 2022=1B$BG/=1B(B2=1B$B7n=1B(B21=1B$BF|=1B(B 18:22
> To: xen-devel@lists.xenproject.org
> Cc: julien@xen.org; Julien Grall <jgrall@amazon.com>; Stefano Stabellini
> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> Subject: [PATCH v3 09/19] xen/arm32: mm: Check if the virtual address is =
shared
> before updating it
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Only the first 2GB of the virtual address space is shared between all
> the page-tables on Arm32.
>=20
> There is a long outstanding TODO in xen_pt_update() stating that the
> function can only work with shared mapping. Nobody has ever called
> the function with private mapping, however as we add more callers
> there is a risk to mess things up.
>=20
> Introduce a new define to mark the end of the shared mappings and use
> it in xen_pt_update() to verify if the address is correct.
>=20
> Note that on Arm64, all the mappings are shared. Some compiler may
> complain about an always true check, so the new define is not introduced
> for arm64 and the code is protected with an #ifdef.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/include/asm/config.h |  4 ++++
>  xen/arch/arm/mm.c                 | 11 +++++++++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/include/asm/config.h
> b/xen/arch/arm/include/asm/config.h
> index c7b77912013e..85d4a510ce8a 100644
> --- a/xen/arch/arm/include/asm/config.h
> +++ b/xen/arch/arm/include/asm/config.h
> @@ -137,6 +137,10 @@
>=20
>  #define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
>  #define XENHEAP_VIRT_END       _AT(vaddr_t,0x7fffffff)
> +
> +/* The first 2GB is always shared between all the page-tables. */
> +#define SHARED_VIRT_END        _AT(vaddr_t, 0x7fffffff)
> +
>  #define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
>  #define DOMHEAP_VIRT_END       _AT(vaddr_t,0xffffffff)
>=20
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 24de8dcb9042..f18f65745595 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1365,11 +1365,18 @@ static int xen_pt_update(unsigned long virt,
>       * For arm32, page-tables are different on each CPUs. Yet, they shar=
e
>       * some common mappings. It is assumed that only common mappings
>       * will be modified with this function.
> -     *
> -     * XXX: Add a check.
>       */
>      const mfn_t root =3D virt_to_mfn(THIS_CPU_PGTABLE);
>=20
> +#ifdef SHARED_VIRT_END
> +    if ( virt > SHARED_VIRT_END ||
> +         (SHARED_VIRT_END - virt) < nr_mfns )

Why not convert (SHARED_VIRT_END - virt) to page number before comparation?=
=20
I think nr_mfns is something related to page numbers, so maybe something li=
ke PAGE_SHIFT or round_pgdown is needed.

I am just wondering, and forgive me if I am wrong.=20

> +    {
> +        mm_printk("Trying to map outside of the shared area.\n");
> +        return -EINVAL;
> +    }
> +#endif
> +
>      /*
>       * The hardware was configured to forbid mapping both writeable and
>       * executable.
> --
> 2.32.0
>=20

Cheers,
---
Hongda

