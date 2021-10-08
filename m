Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAC64265F6
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 10:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204545.359701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYlID-0002bn-CI; Fri, 08 Oct 2021 08:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204545.359701; Fri, 08 Oct 2021 08:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYlID-0002Yk-8V; Fri, 08 Oct 2021 08:31:49 +0000
Received: by outflank-mailman (input) for mailman id 204545;
 Fri, 08 Oct 2021 08:31:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/CyP=O4=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mYlIB-0002Ye-C1
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 08:31:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1777f4f-c01d-47d1-89b2-a5a67113e706;
 Fri, 08 Oct 2021 08:31:45 +0000 (UTC)
Received: from AM5PR0602CA0002.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::12) by PAXPR08MB6863.eurprd08.prod.outlook.com
 (2603:10a6:102:134::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 8 Oct
 2021 08:31:43 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::d) by AM5PR0602CA0002.outlook.office365.com
 (2603:10a6:203:a3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Fri, 8 Oct 2021 08:31:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 08:31:42 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Fri, 08 Oct 2021 08:31:42 +0000
Received: from 36151b71aa15.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0828CDED-3011-41AC-AFCA-72CCE53ED90F.1; 
 Fri, 08 Oct 2021 08:31:32 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 36151b71aa15.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Oct 2021 08:31:32 +0000
Received: from AM5PR0801MB2019.eurprd08.prod.outlook.com
 (2603:10a6:203:4b::22) by AM6PR08MB3271.eurprd08.prod.outlook.com
 (2603:10a6:209:47::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 08:31:27 +0000
Received: from AM5PR0801MB2019.eurprd08.prod.outlook.com
 ([fe80::80a2:ff50:fde5:5215]) by AM5PR0801MB2019.eurprd08.prod.outlook.com
 ([fe80::80a2:ff50:fde5:5215%3]) with mapi id 15.20.4587.020; Fri, 8 Oct 2021
 08:31:27 +0000
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
X-Inumbo-ID: e1777f4f-c01d-47d1-89b2-a5a67113e706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJGRQYFxVNhZI6sPgYj+GIwVGfedcWSu1Iu0VKlioNM=;
 b=s9B6+JVcJgNgLq/l8WEw2/nCCR2jl1dlMtGyAb6UhscJTbyyAtnp7PPbWAkrYFPG3j80nBkg3RfYIPu9xj/Hwa+DWJCFolxeqSfrm0OGt7qxCeJt6N5QhMKEUh7OPhwOawtJF+DvIAsYCsvwN/w/ukbh/TcPxt/reFFa+mNb6Jk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 436b9ea060441231
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W43bGnxY3hn0ANyunZz580wDgCrGvLtU7yd4ltJGZSrw5bpmooqdhUjVVnynVfu4c9nonSwDktPT9jkk0qqM5A1PBFBnXT1Sp2KxX6E7+bmGqW+fJC8YfCFTBxrX8Gu3uk4RMLZhCEjPCmkRPUFIaQeLLfHNQ5X4gnlOmddRb0iSJyaWBvtH8LMEVBY1jpC4opy/xfYgA2k9z+qOva7wAA8N8HQtO24l7CuKkDnbZQ0Cdko+uU6GTzlBTPovUPPbXnkIYSDJGaHBe0emXuFQfSNZyeLzVc27y5R0jsqKj7tHozF3tx+W6Yp7rM7zXDyG59gDofSx4Hgg21gQ3yrJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJGRQYFxVNhZI6sPgYj+GIwVGfedcWSu1Iu0VKlioNM=;
 b=VXhR/3h10F80WBTgqZs5yHTKL+/5pnjkDW8O3gpudLUrYEs3aG1CizzEHdPPsiEsldfZ9CAkMGTWZ7EFIOsAXMCDQkGxMM4BdJvIu+iNqJ62yX6zFIb5c4rMF3Q1IziFyLvciBw1t2VYqx3vPZLFPihSHEVV2LMSQGh7GhXkWNUecNWfSb+Rk48nVa3c/iq+Xqnnm3evSCnX6wUoeNZqyazS4xe8ma2dabUdDccUuO2fo0bTbVypiUIQygVeyAThPyWhA0y3yZFX4+jKpvD+7PHEShWOqUKy9EMOrBPg+bH91ksCGfPA6kziBS2hqdfwilDNVEv7is3Z5zjCyJn0vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJGRQYFxVNhZI6sPgYj+GIwVGfedcWSu1Iu0VKlioNM=;
 b=s9B6+JVcJgNgLq/l8WEw2/nCCR2jl1dlMtGyAb6UhscJTbyyAtnp7PPbWAkrYFPG3j80nBkg3RfYIPu9xj/Hwa+DWJCFolxeqSfrm0OGt7qxCeJt6N5QhMKEUh7OPhwOawtJF+DvIAsYCsvwN/w/ukbh/TcPxt/reFFa+mNb6Jk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
Subject: Re: [PATCH v3 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
Thread-Topic: [PATCH v3 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
Thread-Index: AQHXvB1PoezuefnKkUm8ItiBScrwd6vIxYqA
Date: Fri, 8 Oct 2021 08:31:27 +0000
Message-ID: <1230C29B-62DE-430D-BB50-3AC9A8BF9D93@arm.com>
References: <20211008081933.18546-1-michal.orzel@arm.com>
 <20211008081933.18546-2-michal.orzel@arm.com>
In-Reply-To: <20211008081933.18546-2-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e5eeff79-8224-472a-e95d-08d98a360e97
x-ms-traffictypediagnostic: AM6PR08MB3271:|PAXPR08MB6863:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB68634200B9B8B698617C14719DB29@PAXPR08MB6863.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:204;OLM:204;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PZun7ZbGYWhS4+Gtu3ab6PQaKFvDkbqnsDOQp9jkNlEeiEXpMRBbIBnHF6/dlQKwnOgtstQ5RhqwyMc0s3efxfQHllwz1RuSJeh8+dDPLglAthigTGSyPYtR48BLkohoGjWmaEWqwqV1zyjuaY43juEeCHciL+biie1aulgfnR20gzT7LiMqzR2OKZsTsL+JTo9NUenlZ/jAn9L4J/s8c5BaiLwv6L4sdYfk2B4aX7DOlbITgPve3A9gD4xiL8hUwh0BYLvhuqKJOy0OFeCbJwqYV544ArCUlUP52nwVPoaFFebjHOvcYj3/PewndU0uf5S5rHEdjoIIvn0hUyqWhuwEHSTNZKZs9RNtNYXRMic1KJDttBvn5flCAoqJzUdzv0BvMtHDbou5UCk7o0+sapRSDAjTEvK1dwnt3+WPCJOlW7jhsQzCVkPbajMfT5fWSHn0W90tKdalTnfFiX/ZlrB5DO1SASAhF9r2267PyKRTSXsQSk9vpAnRvuBvNMTEN10ognH4jSlWrkFtVq0BElsY/x6JyltKHDvBZGgnevQa9fM4bXvJTOKEkb1D2E+Jqi4ZJ3kEIm0E1ByMAVNX5uIfNrT5LD3aiD8ST2pxtHQCuGvACmMN17uNZxf4+wb7Dm5Y0HvtN/Jk9fl5CEJ1EknIn7pvYKr8aDA1eYjwTNaONPuqmHpbUsgYW5cLjdUHTTquM8L2bRkLYyHTozp4TRuPrADflWZ9fCaEBebq2rNhisqsKjFnivN3qKxAwULq
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2019.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(54906003)(26005)(53546011)(6506007)(7416002)(33656002)(2616005)(83380400001)(66556008)(6486002)(91956017)(66446008)(66476007)(64756008)(76116006)(6862004)(508600001)(66946007)(8936002)(2906002)(37006003)(6636002)(6512007)(5660300002)(38070700005)(186003)(71200400001)(38100700002)(122000001)(4326008)(36756003)(316002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6C23D492A3007041A492090A3869FA97@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3271
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4bcc05af-b364-4f48-6019-08d98a360583
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3xGTIw8xReed1tWR26W3VFmZ6LfEz3wtUK026pX428616cmFqO1YDn+vlb/quHvL0mIeZm85Q1+S3UgIbOxwBEAF5ta+r1NkLsyza9iJ9TrJILi8exRzkfdduAtj/wgGihntHXBmszA2mZ6tg6d2/yyfCzkpsX51UVBL9BYjNSg+Wuc5E/5so/Z7XGuIVkDEqBY3QGl+spChWXTjaBFjn5X+UvMFP2vqwibMN6r3rRa9WcoxAoMaWbe0ZmZSxhrdpwRoyPTu4M9+qfmXn/xGw/oTLncolfPSTSbv7byXt6uht2JiU+KHmzTAEELwN4ZXk7iOwcojjsXZNdiDaC/ejkDqOlAEAcpkHACM3QM5qvwHXeJ3HgPR0UeZiBpOUkdSTWV5HCbXAnVfc1zN0uH+U3S56xjaAJeRmDpBA1/zA7j06E3jM/ix/MDAjxt842tgYH0lcez6kQHi5HnWFZLmFWbcSPOb1ppopM1NiKUjwnvu3QxZRzguLM5t6SkEVUEjPOZQ1TNhCHvQH1g4mbsRdncl+xTzM7q+U94g2BPlnxUzhSeFuhqIGVFMVRboj6qXequbgwXYdkba9ULH+VDX6cjWsuI8+jYHnX/B6GAxqi8/n3sbZOtpuHNs6VNI2WwNvShRVF2efENsgroYxdhsqfYT6XFLMJprgYfYSi3/WOQ+Uk+8Dew5cmnCing7j4zVWdaqPsoTCHNDbijBtv3Yig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(336012)(2616005)(6506007)(36860700001)(54906003)(36756003)(82310400003)(47076005)(6512007)(53546011)(33656002)(6636002)(8676002)(5660300002)(2906002)(4326008)(508600001)(6862004)(70586007)(81166007)(37006003)(86362001)(8936002)(316002)(70206006)(26005)(356005)(107886003)(6486002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 08:31:42.6575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5eeff79-8224-472a-e95d-08d98a360e97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6863

Hi Michal

> On 8 Oct 2021, at 09:19, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Introduce flag XEN_SYSCTL_PHYSCAP_vpmu which
> indicates whether the platform supports vPMU
> functionality. Modify Xen and tools accordingly.
>=20
> Take the opportunity and fix XEN_SYSCTL_PHYSCAP_vmtrace
> definition in sysctl.h which wrongly use (1<<6)
> instead of (1u<<6).
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes since v2:
> -do not define bit position and mask separately
> Changes since v1:
> -new in v2
> ---
> tools/golang/xenlight/helpers.gen.go | 2 ++
> tools/golang/xenlight/types.gen.go   | 1 +
> tools/include/libxl.h                | 6 ++++++
> tools/libs/light/libxl.c             | 1 +
> tools/libs/light/libxl_types.idl     | 1 +
> tools/ocaml/libs/xc/xenctrl.ml       | 1 +
> tools/ocaml/libs/xc/xenctrl.mli      | 1 +
> tools/xl/xl_info.c                   | 5 +++--
> xen/common/domain.c                  | 2 ++
> xen/common/sysctl.c                  | 3 +++
> xen/include/public/sysctl.h          | 6 ++++--
> xen/include/xen/domain.h             | 2 ++
> 12 files changed, 27 insertions(+), 4 deletions(-)
>=20
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight=
/helpers.gen.go
> index bfc1e7f312..c8669837d8 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -3360,6 +3360,7 @@ x.CapHap =3D bool(xc.cap_hap)
> x.CapShadow =3D bool(xc.cap_shadow)
> x.CapIommuHapPtShare =3D bool(xc.cap_iommu_hap_pt_share)
> x.CapVmtrace =3D bool(xc.cap_vmtrace)
> +x.CapVpmu =3D bool(xc.cap_vpmu)
>=20
>  return nil}
>=20
> @@ -3391,6 +3392,7 @@ xc.cap_hap =3D C.bool(x.CapHap)
> xc.cap_shadow =3D C.bool(x.CapShadow)
> xc.cap_iommu_hap_pt_share =3D C.bool(x.CapIommuHapPtShare)
> xc.cap_vmtrace =3D C.bool(x.CapVmtrace)
> +xc.cap_vpmu =3D C.bool(x.CapVpmu)
>=20
>  return nil
>  }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/t=
ypes.gen.go
> index 09a3bb67e2..45f2cba3d2 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -1008,6 +1008,7 @@ CapHap bool
> CapShadow bool
> CapIommuHapPtShare bool
> CapVmtrace bool
> +CapVpmu bool
> }
>=20
> type Connectorinfo struct {
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index b9ba16d698..ec5e3badae 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -502,6 +502,12 @@
>  */
> #define LIBXL_HAVE_X86_MSR_RELAXED 1
>=20
> +/*
> + * LIBXL_HAVE_PHYSINFO_CAP_VPMU indicates that libxl_physinfo has a cap_=
vpmu
> + * field, which indicates the availability of vPMU functionality.
> + */
> +#define LIBXL_HAVE_PHYSINFO_CAP_VPMU 1
> +
> /*
>  * libxl ABI compatibility
>  *
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index 204eb0be2d..a032723fde 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -404,6 +404,7 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo=
 *physinfo)
>         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_iommu_hap_pt_shar=
e);
>     physinfo->cap_vmtrace =3D
>         !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_vmtrace);
> +    physinfo->cap_vpmu =3D !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSC=
AP_vpmu);
>=20
>     GC_FREE;
>     return 0;
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 3f9fff653a..993e83acca 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -1061,6 +1061,7 @@ libxl_physinfo =3D Struct("physinfo", [
>     ("cap_shadow", bool),
>     ("cap_iommu_hap_pt_share", bool),
>     ("cap_vmtrace", bool),
> +    ("cap_vpmu", bool),
>     ], dir=3DDIR_OUT)
>=20
> libxl_connectorinfo =3D Struct("connectorinfo", [
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl=
.ml
> index a5588c643f..6da3ed3c6f 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -121,6 +121,7 @@ type physinfo_cap_flag =3D
> 	| CAP_Shadow
> 	| CAP_IOMMU_HAP_PT_SHARE
> 	| CAP_Vmtrace
> +	| CAP_Vpmu
>=20
> type physinfo =3D
> {
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctr=
l.mli
> index 6e94940a8a..b8faff6721 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -106,6 +106,7 @@ type physinfo_cap_flag =3D
>   | CAP_Shadow
>   | CAP_IOMMU_HAP_PT_SHARE
>   | CAP_Vmtrace
> +  | CAP_Vpmu
>=20
> type physinfo =3D {
>   threads_per_core : int;
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 8383e4a6df..2c86b317b7 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -210,7 +210,7 @@ static void output_physinfo(void)
>          info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
>         );
>=20
> -    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s\n",
> +    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s\n",
>          info.cap_pv ? " pv" : "",
>          info.cap_hvm ? " hvm" : "",
>          info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
> @@ -218,7 +218,8 @@ static void output_physinfo(void)
>          info.cap_hap ? " hap" : "",
>          info.cap_shadow ? " shadow" : "",
>          info.cap_iommu_hap_pt_share ? " iommu_hap_pt_share" : "",
> -         info.cap_vmtrace ? " vmtrace" : ""
> +         info.cap_vmtrace ? " vmtrace" : "",
> +         info.cap_vpmu ? " vpmu" : ""
>         );
>=20
>     vinfo =3D libxl_get_version_info(ctx);
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 6ee5d033b0..4d0e909eec 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -84,6 +84,8 @@ vcpu_info_t dummy_vcpu_info;
>=20
> bool __read_mostly vmtrace_available;
>=20
> +bool __read_mostly vpmu_is_available;
> +
> static void __domain_finalise_shutdown(struct domain *d)
> {
>     struct vcpu *v;
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 3558641cd9..6e7189bb3c 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -280,6 +280,9 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u=
_sysctl)
>         if ( vmtrace_available )
>             pi->capabilities |=3D XEN_SYSCTL_PHYSCAP_vmtrace;
>=20
> +        if ( vpmu_is_available )
> +            pi->capabilities |=3D XEN_SYSCTL_PHYSCAP_vpmu;
> +
>         if ( copy_to_guest(u_sysctl, op, 1) )
>             ret =3D -EFAULT;
>     }
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 039ccf885c..b794c9d351 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -100,10 +100,12 @@ struct xen_sysctl_tbuf_op {
> #define _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share 5
> #define XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share  \
>     (1u << _XEN_SYSCTL_PHYSCAP_iommu_hap_pt_share)
> -#define XEN_SYSCTL_PHYSCAP_vmtrace       (1 << 6)
> +#define XEN_SYSCTL_PHYSCAP_vmtrace       (1u<<6)
> +/* The platform supports vPMU. */
> +#define XEN_SYSCTL_PHYSCAP_vpmu          (1u<<7)
>=20
> /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
> -#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_vmtrace
> +#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_vpmu
>=20
> struct xen_sysctl_physinfo {
>     uint32_t threads_per_core;
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 1708c36964..160c8dbdab 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -133,4 +133,6 @@ static inline void vnuma_destroy(struct vnuma_info *v=
numa) { ASSERT(!vnuma); }
>=20
> extern bool vmtrace_available;
>=20
> +extern bool vpmu_is_available;
> +
> #endif /* __XEN_DOMAIN_H__ */
> --=20
> 2.29.0
>=20
>=20


