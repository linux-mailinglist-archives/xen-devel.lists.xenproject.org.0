Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348537CA95B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 15:29:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617561.960247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNeO-00025d-NZ; Mon, 16 Oct 2023 13:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617561.960247; Mon, 16 Oct 2023 13:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsNeO-00022x-Km; Mon, 16 Oct 2023 13:28:52 +0000
Received: by outflank-mailman (input) for mailman id 617561;
 Mon, 16 Oct 2023 13:28:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UvS=F6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qsNeN-00022r-Cz
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 13:28:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe02::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1372ee0-6c27-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 15:28:50 +0200 (CEST)
Received: from AS9PR05CA0305.eurprd05.prod.outlook.com (2603:10a6:20b:491::17)
 by AM8PR08MB6355.eurprd08.prod.outlook.com (2603:10a6:20b:363::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 13:28:42 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:491:cafe::b) by AS9PR05CA0305.outlook.office365.com
 (2603:10a6:20b:491::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34 via Frontend
 Transport; Mon, 16 Oct 2023 13:28:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.22 via Frontend Transport; Mon, 16 Oct 2023 13:28:41 +0000
Received: ("Tessian outbound fdf44c93bd44:v211");
 Mon, 16 Oct 2023 13:28:41 +0000
Received: from c1b9297f750f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 174E06AE-977C-4E6E-A2FD-AEA5CE7B2C2A.1; 
 Mon, 16 Oct 2023 13:28:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1b9297f750f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 16 Oct 2023 13:28:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS4PR08MB8096.eurprd08.prod.outlook.com (2603:10a6:20b:58b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 13:28:32 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::30ea:681d:5fa7:8bfb%2]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 13:28:32 +0000
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
X-Inumbo-ID: f1372ee0-6c27-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtcWUclDk/W5Tue5yT/++53BeADNS5nlT3W4XvC0V/I=;
 b=A8fu2t9UoKaCGum6x5u1rqAA2Kvfz8H4i5DINetlZQghiIWyU3JUcMD+knTFJtTwMmgLTfJMvkqBdkwydYfMit3A4G90CnSONr0COHK9/TjcOv1bl/vOFmI6eSwXc6XTmdGkREoXUX6wYjRASrNqAOTSKymEKljL53E5Qwg4IiU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0ce871b3b12df3c7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjmqAvBxDd7fp8ZaR5ttw/6wO8fiNFMnOawlWohj1txscNl9XQaBzEhMRg4l1y8/5DCKdLsEwJAsPwNS3hj9ObB9yBKg19NzWl1zF8d7kOIoSbdgkBNPkGYDb9QYWFXgFt6rc8UjOJwaSs1W+wxR+mr3gQ45YUv/NKTiGa8HJrM+ypajUzm61oAEql6OFJfB99qpQtp4Qw4Dw2h21ilQSWL9q2TJtWihIdJnrBOzuTTjM9kCDzVxqL9YARsMkMXPN7n4trz+sAzGTDDXSdfAwmHyOLQuZxY1ReU4RULDTOLmA4yLK8CB5JW4Gv4nBzoon+ffxCCikAqLOfsThuiJGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtcWUclDk/W5Tue5yT/++53BeADNS5nlT3W4XvC0V/I=;
 b=hpuZLyM5Zp8NWxqIL0VNRMUoYsVaolO/uUFx1ltKLEdZOrYJzk4GiJQzqK/5x9UEBpLUqWliMP4xPbmKyl6ER8GEhDV+nEKBqbK+vc4Ltow9egEDrwBY/lU5f5IwhNNxJqmcMK7SGwSkVb+rdw6TXZgzVfjgsccQRq2CUC1Wvkl/POGBuNyb3PhYCEcWFW51MgRQuLNIpY6RMoY+35YYBS1OxCBE/7fny4jggbhAjQltp0TvDGKsMs/qPsU5ePZWUoS1JGs+QNIRzudRlHPO4CtbkyDiJFbHvPPkyT63+JW1cjR/PLLosv5r4PdIByvA//FrpUom+iggNQ/Asa5p3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtcWUclDk/W5Tue5yT/++53BeADNS5nlT3W4XvC0V/I=;
 b=A8fu2t9UoKaCGum6x5u1rqAA2Kvfz8H4i5DINetlZQghiIWyU3JUcMD+knTFJtTwMmgLTfJMvkqBdkwydYfMit3A4G90CnSONr0COHK9/TjcOv1bl/vOFmI6eSwXc6XTmdGkREoXUX6wYjRASrNqAOTSKymEKljL53E5Qwg4IiU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [for-4.18][PATCH] xen/arm: Check return code from recursive calls
 to scan_pfdt_node()
Thread-Topic: [for-4.18][PATCH] xen/arm: Check return code from recursive
 calls to scan_pfdt_node()
Thread-Index: AQHaAC7Lie8jJuWlekOvxY+/BGzxtLBMaOWA
Date: Mon, 16 Oct 2023 13:28:32 +0000
Message-ID: <18D03C43-2224-43EE-B9BA-B04802A7FF5F@arm.com>
References: <20231016124559.8220-1-michal.orzel@amd.com>
In-Reply-To: <20231016124559.8220-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS4PR08MB8096:EE_|AMS1EPF00000044:EE_|AM8PR08MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a660c1-2ce9-45fa-c2f2-08dbce4bd050
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Xl3BwCpEq5ACKRNtnjBce8ORrkDK9jYBcVcExH5kbQc9bDR9K+LDxV8g7Gp/+6FJ0zRRl2amE7cY0fhkEzpxSi1x9amXJuqnsOPKiFl554+YyroPDZlmZCvF8JQWwKrD5MAfsdj8OamQ3nELeHcJPVWiILYVCOmYr1IjE3QZstT0467NiqJIKZuh/LEpi5ypoW8ZoeRQmX8IeEPpMaebvWr7saf4ODj8LyUJ7sM8lSUPlKYnc2dZNpyxybHums0Nb3Anqc0jQE6DQQr857MjfCp92a6U4OlSiJtR8hyC6eQLD/Hcyn6cpJ5NEUEfWaUCar4vHjQg9c1YIuoKVhpozKgrq0cvssrKEaGhCSJBJwZZpKwcCnWfD21Z5Oe7R5BsMZs8uldjt050DQXF0Fc4bZ8Qjo3RlTbH2tbojxbgFg+hpVQC52jZ++n/uYLTMWocbnYZnPc4taEWwmevk7EoFyBGDRBtJZNJHy+T39Imm47s8uJPpnttyG8THbb8Jib7b9gsQG7wWH9FAZy4dkR81dYI9sJNuhDWh058YGyH/bTISYTZgipgo2OlqnozUMfJAALEzw+g91cPHP0gLDwFZ5nKHF6opWwvD05/XXqDcaWNh3qerzIyzoClPoc78YLUMXEhV5d1X7kPgBw4rqYh7w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(376002)(346002)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(33656002)(6512007)(38100700002)(38070700005)(26005)(122000001)(2616005)(478600001)(6486002)(5660300002)(8936002)(4326008)(86362001)(2906002)(54906003)(6916009)(316002)(91956017)(66556008)(64756008)(66446008)(36756003)(66476007)(41300700001)(76116006)(66946007)(71200400001)(8676002)(53546011)(6506007)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2331426FCE09FE4E837069C749D6EC37@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8096
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	64ca27b5-2764-4d4c-a7d2-08dbce4bcaf3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DAAIvBtzpYtHXJhBgnpHaSaN8QsgYN1U1N2+Rtetj1i5dzoA59xGS16LjbldxE+kYDB7QF2kMrWT7UHuZI8DPUEsfYSmWNn9WK53vzdLdzg3e0aV7uBuMUH9HEKzwaDWpBLv7H2Jq+J1wE8iYsM58NO1diOuWQXZZwdATBAcI1S/2cHoebqQFYYk3oC80cLUndFctxX9qYBpiLVi+J3IRZoT152jjm8Sphze72UW1qFXygzjJiKtUAVCz1cx/BsYspMS8Iwv/6V2l3sJbBn+P3GwaVinR36NKdn00O7w11DVhErF3MH2IY67IsrKLVJGoo8vesZG6S2/6fg+MKxt0Rj/ZyDR54l6DS6qRTEvuU2X353W1uDEY+2Nla94kYcin1X8wOnHVYoFM6DO/a64Tmm3AWHFdFxi30AM1XWZ5qbKIj/DUduKAK7VIFe1UkmSXXGWEIjkX+XkBFxwQaWKo1w7/CWLBKZHgu7LjfKsTHTbgZVUyZD9mkt7d3B3sq5ZdHklSMS5Ci95aud0wlQqhPZ95/W3b9OL0Sv7BJuKYKCYTm6cRxCkgGSD044i/mnvrczSRtRIJKqTquX10lJpkCUM9d5dZiBfOlEeMZ/ikaEVpEj7r5nMoArYJayIUoJZNNsefTd8JiraG/XGHz4OGnVP4nnGd/RveK+FhTy67uwhmIQV2iesJu+MhxvxCQ+yeSa4JbvE5jPUiwvNSCNaz/EDac5Yud65chllIzlwrkgEAhN8X3+2eD437t3W1R7B
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(186009)(1800799009)(82310400011)(64100799003)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(336012)(36860700001)(2616005)(83380400001)(6512007)(47076005)(54906003)(70206006)(6862004)(8676002)(4326008)(316002)(8936002)(70586007)(53546011)(41300700001)(6506007)(81166007)(5660300002)(478600001)(2906002)(6486002)(82740400003)(356005)(33656002)(40480700001)(86362001)(36756003)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 13:28:41.5411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a660c1-2ce9-45fa-c2f2-08dbce4bd050
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6355

Hi Michal,

> On 16 Oct 2023, at 14:45, Michal Orzel <michal.orzel@amd.com> wrote:
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

Good finding :-)

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

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


