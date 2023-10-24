Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 569637D51D1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621964.968972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHUq-0005G4-Pj; Tue, 24 Oct 2023 13:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621964.968972; Tue, 24 Oct 2023 13:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHUq-0005D8-Lh; Tue, 24 Oct 2023 13:31:00 +0000
Received: by outflank-mailman (input) for mailman id 621964;
 Tue, 24 Oct 2023 13:30:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q5Q5=GG=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qvHUp-0005Cx-ED
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:30:59 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f23df2c-7271-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 15:30:55 +0200 (CEST)
Received: from DUZPR01CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::18) by DU5PR08MB10414.eurprd08.prod.outlook.com
 (2603:10a6:10:51a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 13:30:47 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::9c) by DUZPR01CA0060.outlook.office365.com
 (2603:10a6:10:469::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Tue, 24 Oct 2023 13:30:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Tue, 24 Oct 2023 13:30:47 +0000
Received: ("Tessian outbound 028b72acc2da:v215");
 Tue, 24 Oct 2023 13:30:47 +0000
Received: from 8df8404cd17e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 122E7587-97F6-478D-91DD-187A18CB84FD.1; 
 Tue, 24 Oct 2023 13:30:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8df8404cd17e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Oct 2023 13:30:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DU0PR08MB8345.eurprd08.prod.outlook.com (2603:10a6:10:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Tue, 24 Oct
 2023 13:30:37 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::1635:b3e9:e4e7:943d]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::1635:b3e9:e4e7:943d%6]) with mapi id 15.20.6907.025; Tue, 24 Oct 2023
 13:30:37 +0000
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
X-Inumbo-ID: 8f23df2c-7271-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDl914DL1e4CHa25jGefuH4veiQO40Qko4gLth/JneY=;
 b=4BM0WeuICZ5j0RK+zdDxhetc+bglw1SkUAHWWBIqD2BwBfY/CEfXHappqCpK2xLIYUXq26K/FOv/DwBFjEJDUTqlEXTgvCfg4Z/+tvxnTCkbR9o2er7gheztWNmZfxsl7lcgARSQpv67JxaUqCLiiY53VE8lk4w6X4jN8SKgdQ0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24a1ffe71db7bd1c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9K0jkV0ScoocI9x5J9ApnygpzBNNg2JevdzXZUleeZxk4RgGTzyvqAp7r0yNLG11oA2wHYDwPLdK0PT8lhSuuLWyTN7KY00CGX+EFFeEQl6gQCxKOFPDMqeNx+e0CQkUGYsfLmK06OyzOJVUgEXUj7yO6ADiIxzQsH926AT1/JLRbQddDpaE0RBwzSsVhis4R/FN2SPGyxHx5FtUSnKubmYZtLzNAU30gNeWZ+kMBUqjOQz2DNUeIiAdN6oVrnStzr2SIHAIOcbh+TGmtnQYAq7cRtEMaRXiSwSaf4MCprcKiL2kbe8NTt7RXzHVGEs1ua8/+12krUew+/Nfj6Orw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDl914DL1e4CHa25jGefuH4veiQO40Qko4gLth/JneY=;
 b=UnYctvWEiRsCPzXNxPO/oGaoWuLWOnWqdNFbEUAg25Sp8csf9XSpVyUNRz46CVHCd/+XRC9xJ56Z3muT1dHZBA3fFrve6Qa6uBjyUbRPNOp9Nl+8bPBr3vWgTLfFZYxdGZKvDBmtJmEXJBqbTx7Fg/NQPxYpduOAA4z0JveBoU2Y7egXpVPy0d8X0LFA5UiPsq/DSYBSJ8s0BbvH8cUQ9O09L6J2eYspiaszdIhX4YHWeImqhKC1maGvDZv6QSaVds/ZBOB5/kCKyNfgIBVwKGmUMeFDPIBFjIJHkUempOkEZToE5s6q5VB2irGBDN7Z0Cx+UdGb3/jEc2BosSeRgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDl914DL1e4CHa25jGefuH4veiQO40Qko4gLth/JneY=;
 b=4BM0WeuICZ5j0RK+zdDxhetc+bglw1SkUAHWWBIqD2BwBfY/CEfXHappqCpK2xLIYUXq26K/FOv/DwBFjEJDUTqlEXTgvCfg4Z/+tvxnTCkbR9o2er7gheztWNmZfxsl7lcgARSQpv67JxaUqCLiiY53VE8lk4w6X4jN8SKgdQ0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, "michal.orzel@amd.com" <michal.orzel@amd.com>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.19 v2] docs/arm: Document where Xen should be loaded
 in memory
Thread-Topic: [PATCH for-4.19 v2] docs/arm: Document where Xen should be
 loaded in memory
Thread-Index: AQHaBmTvGf2mFF5QhEixkbFwkxFRMrBY77QA
Date: Tue, 24 Oct 2023 13:30:37 +0000
Message-ID: <F5195B0D-C337-4221-9395-56F625497671@arm.com>
References: <20231024102858.29067-1-julien@xen.org>
In-Reply-To: <20231024102858.29067-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DU0PR08MB8345:EE_|DB1PEPF00039232:EE_|DU5PR08MB10414:EE_
X-MS-Office365-Filtering-Correlation-Id: 136c43ca-e187-4a49-e819-08dbd4956e9b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5x2hLSnfRLEtFvOyhrrk7CWUVbeDBZov0CARaP5Gre41Fg3fClROuyYnzaQ/nFCBfESvVfWWCiIe6/7/kLjqyfIvVJEkF9u9m2ZdIjyEfJJ9Bq32F19PukeJYRHPlz61OZ7JmcJJrpJgO6C4FsMC9JSh+Nz0TrbKm5aPbVkqKcQMwz1LCmnRH3PVlVd7nHLgUxxElyfosR6gPWE7eKfp2LXczlZ/qBhVTTKH0QiUQss5Tc+if3i67zO5OdhNcUm/UyuWoAbmmA+rvCv/2J0RBxHre8Sg7NC4svczE9D1NIODYOt2kBz152nbujET5uVskj5ZVYSQc3CuKd9RmWeFnlRCHpN9bKIfmlRtXA8BcRQ+rqCzw6cWafj9NJC0O+atpoPWemK5VcP2KHV3tdCP1VUQ/LCQm6rQfiUvGCQIbgutJB8+lsnnFC4DMn06RO5TJ2yBUCtICyFgtVustilaY4kW0fIKKZry2JoDZsGZG0I0gHzZ1mdKXEC+beHVuwZqdjchP/svXruNL2ss4QG0n5uV9C+vKYHGqOX3bzkJvLARVIAD/SZ5S4smTM6px7HLkpmUbUud8QTj1mabrfa2K83aAwhlYN9FlXgqf641HjizAkpRP/FZD3hHx1oG4qSOAXxsZoGyOt0zegRBAuIEZg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(6486002)(6506007)(38070700009)(966005)(316002)(54906003)(71200400001)(66946007)(6916009)(64756008)(66446008)(76116006)(66556008)(66476007)(86362001)(8936002)(33656002)(8676002)(91956017)(478600001)(36756003)(5660300002)(4326008)(38100700002)(41300700001)(2616005)(53546011)(2906002)(83380400001)(122000001)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <78A84E3535A98E478C68BDF986AB7B16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8345
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6cf03327-cd72-4718-717c-08dbd4956875
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pp0xm9XeRYIvcnEQjmgYuSoGjlxS+RilToRKnpg4nIzwJR4JU9oeX9+qVLBf0aeBsEFgoqgPcv79UsIWCA6/75hpe1pr0v+eMI9BprqVMmv75aqB0bncK0JwFbjT9ejSsYQOXxMtnWRvlN8qRnwkn8bBquC9jeDxuBIqJjCrxDeA5J4Nzu+CTu+q3CSzsMd1N2BiBVns5344DtvVfVTfjyhq+Py36VvbQKnxwmlLd+svlvXExKurHSNh/fcSKY6VK4pA7eWOh18BYMr6c3c9PuJU1zU8p2bj4p/8JVzw1T5XTXk/4n1d+e8dt9ugRgRsu0k0627ukYbMLL8j0RST9hp9XWAV7xbM44LCkhzjLaYkrXiaXotPFAH2ho4/lLZkuCEMF5uChv/3x0Wg5WvuPylXF9CyCdSs+tEIR8c2dwOD6bqXdT7CNFe8kwa4pPIPHwu07d6GbwZNcghdKyps3EPNI8ZMO3H1CUi9uzhvp7OKL9fAb/DDfKALeZ8h1msBJzm18xx5zyJH2uFuhGxRxq8Jch+b420zFxwcqLHllN1ZjkvBhcJvXjOHlR/CQruOK9D2ucshrd2bI6vG5YnSNriqFXDvmLECtF9/LYtyBBGKwvy8y+2/S1tNMJOTomL1isrYKZoNiKcLOGOhshR6GhNFuvGi1nNqFkAJMk+tn++I1TBzrvy2M5Bxk7RzMvQVue6pce+IBCWzlu7mcWqkIjgtE3/LEy0aU6qipsk49xM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(26005)(2906002)(40460700003)(86362001)(36756003)(5660300002)(4326008)(8936002)(6862004)(8676002)(33656002)(478600001)(6506007)(2616005)(356005)(107886003)(81166007)(36860700001)(41300700001)(70206006)(54906003)(82740400003)(70586007)(316002)(83380400001)(6486002)(47076005)(966005)(6512007)(53546011)(40480700001)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 13:30:47.3671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 136c43ca-e187-4a49-e819-08dbd4956e9b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10414

Hi Julien,

> On 24 Oct 2023, at 12:28, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> In commit 9d267c049d92 ("xen/arm64: Rework the memory layout"),
> we decided to require Xen to be loaded below 2 TiB to simplify
> the logic to enable the MMU. The limit was decided based on
> how known platform boot plus some slack.
>=20
> We had a recent report that this is not sufficient on the AVA
> platform with a old firmware [1]. But the restriction is not
> going to change in Xen 4.18. So document the limit clearly
> in docs/misc/arm/booting.txt.
>=20
> [1] https://lore.kernel.org/20231013122658.1270506-3-leo.yan@linaro.org
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>=20
>    Changes in v2:
>        - The limit is 2 TiB no 5
>        - Remove unnecessary sentence in the docs
>        - Add missing link
>        - Add Michal's reviewed-by
>=20
> I couldn't find a nice way to document it in SUPPORT.md. So I decided
> to only document the restrict in docs/misc/arm/booting.txt for now.
>=20
> I also couldn't find any way from GRUB/UEFI (I didn't look much) to
> specify the loading address.
> ---
> docs/misc/arm/booting.txt | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 02f7bb65ec6d..547f58a7d981 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -21,7 +21,9 @@ The exceptions to this on 32-bit ARM are as follows:
>  zImage protocol should still be used and not the stricter "raw
>  (non-zImage)" protocol described in arm/Booting.
>=20
> -There are no exception on 64-bit ARM.
> +The exceptions to this on 64-bit ARM are as follows:
> +
> + Xen binary should be loaded in memory below 2 TiB.
>=20
> Booting Guests
> --------------
> --=20
> 2.40.1
>=20


