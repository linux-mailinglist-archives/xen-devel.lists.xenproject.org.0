Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AEB40F596
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 12:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.189224.338786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRAmV-0004T3-2P; Fri, 17 Sep 2021 10:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189224.338786; Fri, 17 Sep 2021 10:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRAmU-0004Pw-UP; Fri, 17 Sep 2021 10:07:42 +0000
Received: by outflank-mailman (input) for mailman id 189224;
 Fri, 17 Sep 2021 10:07:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HF0=OH=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mRAmT-0004Pq-F9
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 10:07:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c939480-0d8a-4b5e-861d-6d702d42010e;
 Fri, 17 Sep 2021 10:07:39 +0000 (UTC)
Received: from AM6PR0202CA0067.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::44) by VI1PR08MB3101.eurprd08.prod.outlook.com
 (2603:10a6:803:45::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 10:06:35 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::6) by AM6PR0202CA0067.outlook.office365.com
 (2603:10a6:20b:3a::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 10:06:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 10:06:30 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Fri, 17 Sep 2021 10:06:30 +0000
Received: from 7b96f042fc11.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 48D2558C-2D16-40D9-95A5-0C830A8DFB52.1; 
 Fri, 17 Sep 2021 10:06:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7b96f042fc11.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Sep 2021 10:06:24 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5561.eurprd08.prod.outlook.com (2603:10a6:102:83::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 10:06:22 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::c029:ed0:82e7:3c2f%6]) with mapi id 15.20.4478.025; Fri, 17 Sep 2021
 10:06:21 +0000
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
X-Inumbo-ID: 6c939480-0d8a-4b5e-861d-6d702d42010e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZgxB81np4TnDRupKJrs1tz6pX5AZNgDbrypJd0tpdI=;
 b=k+jRcEvtwvIMpV/0halT1BHR9teOQ9+RWwSufpItSv7F5x3fMcW54ujqF+vHcuOL676xNsPUnW6tqcd82cT2QK+UTkHe6JzkASTYZb6xSG3fHWWTa1gbhC9MGDwL31BF0InMbfaBIYRS+PFfbdxKUY4V95CLWUj0K4DNZRwzeLw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c21c397768a0fde
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnLO3iWIt2iBNCmR90L9f7xCk7xKzBPSMk4+cTplwtKKjUY2v/CtSqtuUYVPT1Kn8m6vpGtOYH3bzTdIW1No1Djrv30DUkfRrGBYWS0c1Tcg9TA/I33fzOn0lnbAkS/I8jCFgnEdcDWauluKmW6Z1zmg5fa8iYFuKd+CFnGYJcFA+RkwxAxcKI/+hoWuF64rGTCCY+chZVOY9QJoRaxRBi2ir77r+n+dJ6EJjgYwh5k5PRDxIBcTIYEvXBQP2kVpspOc5VL04aoD3fGJmL1hY8e6L0y+gLFQ1B6wibhN4vrw5i3bCIKFdSLIm2oZV8EgP79+VAunySKH4NhfGKqVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=IZgxB81np4TnDRupKJrs1tz6pX5AZNgDbrypJd0tpdI=;
 b=WquEaa5v/++1/G0PzAe1ugq2uSDHWRa8D5FSv3yqUCJ+6n94ehC8g5iFeE5L5c3aw0aIhjVZwUj9qE3ipFocwoPHBNMC5IHpQ45RirF5tSrwDC2b3crL3wQUe8QotfN8dLW5qxFYE7+AipdEZoVYFYJXdxGB4mec3NvabFWddf3ljL4D2eSwZ9ZsbueZy251ppueDnw6LuQFv075IDpLoSh2aiE649I3zxjEEXLGfLv+r7EJZ9QfOEW+L5c3RCtwFMV6cER0oPqrsVI7DS+GPgCmpwpl/xUB2ktZTiksDcHMcraHimApcHuKXzywf7dHcAF215zgypYAoNjLK+oUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZgxB81np4TnDRupKJrs1tz6pX5AZNgDbrypJd0tpdI=;
 b=k+jRcEvtwvIMpV/0halT1BHR9teOQ9+RWwSufpItSv7F5x3fMcW54ujqF+vHcuOL676xNsPUnW6tqcd82cT2QK+UTkHe6JzkASTYZb6xSG3fHWWTa1gbhC9MGDwL31BF0InMbfaBIYRS+PFfbdxKUY4V95CLWUj0K4DNZRwzeLw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] page-alloc: further adjust assign_page{,s}()
Thread-Topic: [PATCH] page-alloc: further adjust assign_page{,s}()
Thread-Index: AQHXq6qu/1IFuhFez06uzu67oLNGcaun//6A
Date: Fri, 17 Sep 2021 10:06:21 +0000
Message-ID: <3164A827-E883-44C5-9E47-6D3FC3EAC42F@arm.com>
References: <90df9041-4f1f-9911-d64e-f8d7b2a99534@suse.com>
In-Reply-To: <90df9041-4f1f-9911-d64e-f8d7b2a99534@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c0f4ce43-13be-47cc-8c2d-08d979c2d252
x-ms-traffictypediagnostic: PR3PR08MB5561:|VI1PR08MB3101:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3101F18C6B8225CBE076CD059DDD9@VI1PR08MB3101.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:291;OLM:291;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +SO0adpP4NfNdUtKPHxhZmJOXmxFxxcdyAQgG47geNkhYKDvMjVHSRjaIQo0s/c2+9RwjNMTGtM+N3q9MLhU2vmnmgKYdfqngsuGfyL45c15UH8XWiKkh6ouz94PfCF0bqZThBljjjcU1TxcViLGYE92J2j5uzX/1qWYzMxcaNbpzvH1h1rGM5aG/Y9S8BnKWYvLVSoyZfsxuI1dHb24YFodQrayxlfZyXBjcYN4Smu/cc8mKSFyhjUHuHG3rw+tSh5xBo7rVYtR3JAucedxLkO34Hcy1a8l3uoDm9ktgbRschYS47ra82GXQ+ixq8ulrTp1yGPx7rHllLzf1lcmz//Ev/B5VQDcJrby18xSt/wfklHY20NGwFiH7lZmeVbocRSymM5foqmPy8FKovdEXbmilziP1XE5T3mlc1Rxst57H9x3nQk9jMpiG/h4rjG1gf3Pn3Lxb79x4v6iLGlBld01vj36lW4PyoM2QnZkt98GtF3r2D2+L0w4pFXWRIsyJsSbkfchN35HS/oI67sSWzoQWqxB1v5aVQ6rbfqcWR5kgPHeKiEgaWdu6kFb9wUvgg7zZJusQQhjD24ywuRHHx8gPPsFVTO67QA8J4VHcMHQNkMWSvTXwQovEPjAsCVI1XnDiOuIECa0U3MR+p/p6jxR536dY2joepttmh80YMVr+260IJQzqtYlIyyshYyEojaYaRKngmrJOVrREXNEziDgnn7IDBNcGnWYcKf1U3o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(33656002)(71200400001)(36756003)(38070700005)(6506007)(53546011)(316002)(86362001)(2616005)(6916009)(66946007)(66476007)(66556008)(2906002)(64756008)(66446008)(38100700002)(54906003)(76116006)(6486002)(122000001)(8676002)(83380400001)(26005)(186003)(6512007)(4744005)(5660300002)(508600001)(8936002)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D322D72FC88BE45B7DE1C9EA2CF0242@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5561
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6053ca45-dffd-4170-1094-08d979c2ccd4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KYSN0PRFF831Oiqw1gWeXselAT+DlicMF9uRigxNDGZRC8bh1RuXVNxyLctuKnSHA6Ezg5q0464O/epVpvDjys8+1Ndue5RUVHQVxwdLtMkT3WXstuVrmVTPq/xXPaYfHSrCUeDp/gHh8TkPQhaBRdibATGlotUxDwDTfBV4GnN5TUT4hUabzof6VoyDWzu8RHwt+g+TtK2xfSD1NCL6q187SgruDpMNn/xK90nCqHI3EhtfLa3KBc25DAN4/SshBcG6en/Iy4TxjtUnnIbxHoR4XZGUVjk+t1UhFajj+94x1zHeZ53Qa4pptmQO0Rg7XQsBCbjhU91TGSVCKuMHbZS40PpGjQKfLOnAqumIm0pLe5WKo/wHl/9Wcrl0gVE0hy3EpASGEINrZujBSwX0D+kOMLfFXTNFGVaMVUnwvCZNN9yVNSP5XqJFesrWVMXzqpHo099i3wJAqSHCW7btVVsJI1YxgximEqlshBxov9NkT4UYppX/NLfZEKU3+ffSad5tYRNlij7V5cef1JTaVtoZBb9bw7lU+G0odNaJ2mQ0iXLfrUMe6/GRtDIXAi2ExjueDC3iUzbhWnhXQ7bxpFErQQ0FOmwiGiC0t22t3N1/aUAmsevh8KQu1bL4CTaDkFngf3h+lX5fm+yymc1WZnbdJLJ1w2HnrXEr7f6x0kdcNUGHZYJB+nRhifzKeFzEY/wPupaP21Jfx/9RgKMzlg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6862004)(336012)(2906002)(186003)(4326008)(6512007)(36756003)(36860700001)(54906003)(33656002)(70206006)(70586007)(8676002)(47076005)(4744005)(83380400001)(81166007)(8936002)(6486002)(6506007)(53546011)(356005)(86362001)(82310400003)(5660300002)(498600001)(26005)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 10:06:30.8337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f4ce43-13be-47cc-8c2d-08d979c2d252
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3101

Hi Jan,

> On 17 Sep 2021, at 10:58, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> The on-commit editing of 5260e8fb93f0 ("xen: re-define assign_pages and
> introduce a new function assign_page") didn't go quite far enough: A
> local variable and a function argument also would have wanted adjusting.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2269,7 +2269,7 @@ int assign_pages(
>     unsigned int memflags)
> {
>     int rc =3D 0;
> -    unsigned long i;
> +    unsigned int i;
>=20
>     spin_lock(&d->page_alloc_lock);
>=20
> @@ -2339,7 +2339,7 @@ int assign_pages(
> int assign_page(struct page_info *pg, unsigned int order, struct domain *=
d,
>                 unsigned int memflags)
> {
> -    return assign_pages(pg, 1UL << order, d, memflags);
> +    return assign_pages(pg, 1U << order, d, memflags);
> }
>=20
> struct page_info *alloc_domheap_pages(
>=20
>=20


