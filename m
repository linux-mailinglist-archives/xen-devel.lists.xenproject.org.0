Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631822D26BE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 10:00:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47213.83614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmYqK-0003GB-KE; Tue, 08 Dec 2020 08:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47213.83614; Tue, 08 Dec 2020 08:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmYqK-0003Fo-GW; Tue, 08 Dec 2020 08:59:32 +0000
Received: by outflank-mailman (input) for mailman id 47213;
 Tue, 08 Dec 2020 08:59:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IVKH=FM=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kmYqI-0003Fj-Ja
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 08:59:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f17c2b0-4480-4f38-a6b4-857704fba4ba;
 Tue, 08 Dec 2020 08:59:29 +0000 (UTC)
Received: from DBBPR09CA0041.eurprd09.prod.outlook.com (2603:10a6:10:d4::29)
 by AS8PR08MB6072.eurprd08.prod.outlook.com (2603:10a6:20b:296::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 8 Dec
 2020 08:59:26 +0000
Received: from DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::b9) by DBBPR09CA0041.outlook.office365.com
 (2603:10a6:10:d4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 08:59:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT039.mail.protection.outlook.com (10.152.21.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 8 Dec 2020 08:59:26 +0000
Received: ("Tessian outbound eeda57fffe7b:v71");
 Tue, 08 Dec 2020 08:59:26 +0000
Received: from fe243f909d03.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B30D710-0BA2-460A-B68D-9E5054E7798C.1; 
 Tue, 08 Dec 2020 08:59:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe243f909d03.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Dec 2020 08:59:10 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3516.eurprd08.prod.outlook.com (2603:10a6:10:4f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 8 Dec
 2020 08:59:08 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Tue, 8 Dec 2020
 08:59:08 +0000
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
X-Inumbo-ID: 6f17c2b0-4480-4f38-a6b4-857704fba4ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4dZok7Zgkqh1353jUTUNHppHiK1fvd1ufgwHyoPiv0=;
 b=ACLWdNdd88Vm0LCQ0D58umM4qnDpepMzLXi/inloUFgOBd7DZGWYXpRbE0AUO4dzidUnPFNXUS8ZJi1QzDEmwe7PgF9OLC19NVw103uB69348itwQpVu+HhQYRiAW6/iqIKD77Kr+8k+rDJeRnFX8zG3WOPMUy5dqEyyrJLVhGU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 84ed3635e08cdbc4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5eDL0zz6nhdhVIrUaEEnsiZJ/gS3uhLxma5VAKP+IWKYswiKaiPT0PAc8K5GXho4+LTcUrLyVC9zcMk9ucZhPqdVcfJWVjhp/syf+FDnnqDvplQrMMkQsDZVK/gt7VtLsH52GlKkagiyRqwm5obI5h4IPkvAd7WXhl6asINOJ+mwBS2a+6HYMvSZPnGgDQYOkARSqitLvZJHhS/w/IeulotW9uF11ebCaEJ8Y5l7WKvRyuuk0RxTO36qK/HT69FhtBQONr5acKqvPm4gNS+K+mmpgNOtpCZM+/BwAA6hVyP2Htfz5DMXje3IVozKzuz4DuGtfK4FhnK4npx2MDJGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4dZok7Zgkqh1353jUTUNHppHiK1fvd1ufgwHyoPiv0=;
 b=WKAB7qXHAbdo5JnH/tueHHrwACP+8QqB97d8/F38uY7i59KhF/Rj/4vuLlB87QkrSk4OBYqVGlUvrCRko54ETMG1WklJSKe24QjZl0bARuSyKmStl6C7BxjcitHRkPUfBvKzyj83jzGon/hUPX2oZFXPpaELQwyIx+pG4CU+V3V71HYUqUtpxsQMR69ntHtPBx3c/J8FH/1cdlt+2GHdpp6sW8Py5D+hJ7hcIkFlCovauNtEbhYijgM0iVCg8gHlDRtJ4ePJ7XfDo55SNr6JGxpuPEHMFK0iKCn5whoplVO1r0FaE3s9ERSKB3vnYWlDxx46d1XFrjOAq3gcX3gjpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4dZok7Zgkqh1353jUTUNHppHiK1fvd1ufgwHyoPiv0=;
 b=ACLWdNdd88Vm0LCQ0D58umM4qnDpepMzLXi/inloUFgOBd7DZGWYXpRbE0AUO4dzidUnPFNXUS8ZJi1QzDEmwe7PgF9OLC19NVw103uB69348itwQpVu+HhQYRiAW6/iqIKD77Kr+8k+rDJeRnFX8zG3WOPMUy5dqEyyrJLVhGU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #845719
Thread-Topic: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #845719
Thread-Index: AQHWzTMYnytbZyotvEaEgHJUGuOUO6ns5mAA
Date: Tue, 8 Dec 2020 08:59:08 +0000
Message-ID: <8634155E-0EF2-4367-9DC1-243DFB148563@arm.com>
References: <20201208072327.11890-1-michal.orzel@arm.com>
In-Reply-To: <20201208072327.11890-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb6d340c-6ed4-4fe4-05e3-08d89b5790b0
x-ms-traffictypediagnostic: DB7PR08MB3516:|AS8PR08MB6072:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB607221CDB8E6507B6A9658EC9DCD0@AS8PR08MB6072.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 57I/ta41ITOLgF/dxAj9CoUPoAnjAOTbLC+J9ITz1ey5RCgNJfBbxhXknsYjEe0fxw9rHGGKsJRVdX7eIeDcK46IJKDz/kw3t6lU4eqCKkj5mjClOvGfWdO69RpXdQqOgxnuMMUjBnQByVFCZ7sAC4XXZJaZkiVfiXutaBT3qXcIS1fbzoFUHcYTxsyk+DEZWLIopAn6Ad/LpybzQd26dMLdLyPiskDCdpRT7NgscrShUlvbPJNhu4pSDuvCqUa4teSVSt0xMzpHvw5uigiOm5OTyIegsm5mpwWyaDAbXlbiXhwUx+TgdP9E9MkEuHA6uuQLSuVVGZAugEop2FbqodUjyHfdU9DvBVwLQGqIdeLqrB+AwyMHkHP6PD/bpB+9
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(346002)(4326008)(71200400001)(2906002)(33656002)(86362001)(5660300002)(6512007)(6486002)(53546011)(6506007)(76116006)(91956017)(186003)(6636002)(66476007)(64756008)(66446008)(66556008)(6862004)(66946007)(2616005)(54906003)(508600001)(8676002)(83380400001)(8936002)(36756003)(26005)(37006003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?HBtT1PBlpfkIP2YVE4Hxw9eW+YxlVHHisS8BlfMz2hwMrmAEd3kjE+jz4pEw?=
 =?us-ascii?Q?6vWsso/rq/1F2NSey3S35JzWgdEl/NJ3JiGqZz4MnYN3mFBWTLW462QPOrgL?=
 =?us-ascii?Q?5x2oLjodZOjdvuTJZG9wTWxUowYak9i9GF/oT25KhNS3Wl8ulP832M2fa+Fj?=
 =?us-ascii?Q?BPMh2DFNBxzlNqSEwxUCXzg+zx+HhqIEzndlJO6GZp5DeQMOcHc6h2g+iOkj?=
 =?us-ascii?Q?UNlAoYJDAO7auDTwqyvKquLoXBVktu+023CQaOspuD1Pn0L3wNSNMBnziyGt?=
 =?us-ascii?Q?8vokWh4cMC1Udf3+mNnsJYqIAOPFhH/9MyVmYVBzCR4LU8iPgXsdgVAs1cZS?=
 =?us-ascii?Q?xf7Oojrkk5ycNYokmc+fBnAgKZCbpwkQs+6PA2Or9uMxXRneYnKYRCvLrGKm?=
 =?us-ascii?Q?5xbaJ9CS/S0wQ5sFEhdoOQtgCsyuaSlS1SpE8oPI86vMj624IIn/9vlreF59?=
 =?us-ascii?Q?dynJOMMS4kCJ1yS6RK+vnNzq9JwrEEb6awPppIjmQ888/vTzW/lkzurx17a1?=
 =?us-ascii?Q?wOE3PHELlI/durJzP7q7fhJ+3MIm5jgGR0P7ld9R0wUMuy/0MoesEhE48eoK?=
 =?us-ascii?Q?q0nL+0OkPz6qIbl7xclzNkV20K8Nz2cT7i6Ls0lbIkET18gbjIY0M9DmGqK4?=
 =?us-ascii?Q?9mIHwHzsBN+tsms2oKfXvD4iOpNi7Qwb0AFV0qaIJizc34LNI25M7+z5tpce?=
 =?us-ascii?Q?z0dERT2AxA0dhts0Lksbz6vA78Ej1PYlGzlvY8ALZIwgepzK3mRIj8htImev?=
 =?us-ascii?Q?31uEEKXFdUb4KpZkP5mgtOiWfViwGoVV7CjT3dvLeaj/dLpmYgziNIiQhfes?=
 =?us-ascii?Q?QVaiX2KNMHOvgijmS1B+7N2bRmHSGFgbKjy5UZbajacA4iEB3vI2l5YqXt3w?=
 =?us-ascii?Q?MenByCWt2ADqAAG7oHRHygxzHx2CxS/Vj9jsWsuQ6UOUGcRtDIKud88Ax41X?=
 =?us-ascii?Q?CHxAAjQ08vE2/1GrNwDhS79Y9xlRKEwBHfNF0R9IdYZ6sbFB1+BjgEq9b5BH?=
 =?us-ascii?Q?Ex+/?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <262C9EB671EC97429409E3D1A50F4491@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3516
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7fc97c66-0214-49fb-ce7a-08d89b57861d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3wKYObZZKuJpajBt1M9Kq6KnJuaPwTca3lgtmgHyIaUZ9v7PnHeqVgpWX3lTLe1/taIKB9b5q68xMm11WWzjFJWRtQ5/bzweHaHBlxHbQKeYudQh2nS+m4ga9U1puUa3eN7BmCDSJayLRfqGtuArcmnfunR46Kwwxz7hLljeqjhLh7jlYNwrOBrc9KjYNvHmNqJcT8IfbfzroO5G4csSnmT/h3wYcOUZ1yLpcKct3QevcW8NbRWD+ZAM85cyvswpd7Yp6xjTFjFmPCZk71ebvcIDCXmwWEQorUskf7zLA619o6/Zem3uTZZKyrUY5lMdY9WVDLLrE0EjEZ2/9BNAfCIJwDwck6SHFeI7iacJLUK4dXAoyyLrn01EXqNkgVjPLDesHUkslD2e0ZeG5Hmdtg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(46966005)(6636002)(33656002)(47076004)(8936002)(8676002)(37006003)(2616005)(54906003)(508600001)(86362001)(70206006)(82310400003)(70586007)(6512007)(26005)(2906002)(53546011)(186003)(36756003)(6506007)(4326008)(83380400001)(6486002)(5660300002)(81166007)(356005)(6862004)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 08:59:26.4665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6d340c-6ed4-4fe4-05e3-08d89b5790b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6072

Hi,

> On 8 Dec 2020, at 07:23, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> When executing in aarch32 state at EL0, a load at EL0 from a
> virtual address that matches the bottom 32 bits of the virtual address
> used by a recent load at (aarch64) EL1 might return incorrect data.
>=20
> The workaround is to insert a write of the contextidr_el1 register
> on exception return to an aarch32 guest.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks
Bertrand

> ---
> docs/misc/arm/silicon-errata.txt |  1 +
> xen/arch/arm/Kconfig             | 19 +++++++++++++++++++
> xen/arch/arm/arm64/entry.S       |  9 +++++++++
> xen/arch/arm/cpuerrata.c         |  8 ++++++++
> xen/include/asm-arm/cpufeature.h |  3 ++-
> 5 files changed, 39 insertions(+), 1 deletion(-)
>=20
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-err=
ata.txt
> index 27bf957ebf..fa3d9af63d 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -45,6 +45,7 @@ stable hypervisors.
> | ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_8273=
19    |
> | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_8240=
69    |
> | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_8194=
72    |
> +| ARM            | Cortex-A53      | #845719         | ARM64_ERRATUM_845=
719    |
> | ARM            | Cortex-A55      | #1530923        | N/A               =
      |
> | ARM            | Cortex-A57      | #852523         | N/A               =
      |
> | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_8320=
75    |
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index f5b1bcda03..6bea393555 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -244,6 +244,25 @@ config ARM_ERRATUM_858921
>=20
> 	  If unsure, say Y.
>=20
> +config ARM64_ERRATUM_845719
> +	bool "Cortex-A53: 845719: A load might read incorrect data"
> +	default y
> +	help
> +	  This option adds an alternative code sequence to work around ARM
> +	  erratum 845719 on Cortex-A53 parts up to r0p4.
> +
> +	  When executing in aarch32 state at EL0, a load at EL0 from a
> +	  virtual address that matches the bottom 32 bits of the virtual addres=
s
> +	  used by a recent load at (aarch64) EL1 might return incorrect data.
> +
> +	  The workaround is to insert a write of the contextidr_el1 register
> +	  on exception return to an aarch32 guest.
> +	  Please note that this does not necessarily enable the workaround,
> +	  as it depends on the alternative framework, which will only patch
> +	  the kernel if an affected CPU is detected.
> +
> +	  If unsure, say Y.
> +
> config ARM64_WORKAROUND_REPEAT_TLBI
> 	bool
>=20
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index 175ea2981e..ef3336f34a 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -96,6 +96,15 @@
>         msr     SPSR_fiq, x22
>         msr     SPSR_irq, x23
>=20
> +#ifdef CONFIG_ARM64_ERRATUM_845719
> +alternative_if ARM64_WORKAROUND_845719
> +        /* contextidr_el1 is not accessible from aarch32 guest so we can
> +         * write xzr to it
> +         */
> +        msr     contextidr_el1, xzr
> +alternative_else_nop_endif
> +#endif
> +
>         add     x21, sp, #UREGS_SPSR_und
>         ldp     w22, w23, [x21]
>         msr     SPSR_und, x22
> diff --git a/xen/arch/arm/cpuerrata.c b/xen/arch/arm/cpuerrata.c
> index b398d480f1..8959d4d4dc 100644
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -491,6 +491,14 @@ static const struct arm_cpu_capabilities arm_errata[=
] =3D {
>         .capability =3D ARM_WORKAROUND_858921,
>         MIDR_ALL_VERSIONS(MIDR_CORTEX_A73),
>     },
> +#endif
> +#ifdef CONFIG_ARM64_ERRATUM_845719
> +    {
> +        /* Cortex-A53 r0p[01234] */
> +        .desc =3D "ARM erratum 845719",
> +        .capability =3D ARM64_WORKAROUND_845719,
> +        MIDR_RANGE(MIDR_CORTEX_A53, 0x00, 0x04),
> +    },
> #endif
>     {
>         /* Neoverse r0p0 - r2p0 */
> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufe=
ature.h
> index c7b5052992..1165a1eb62 100644
> --- a/xen/include/asm-arm/cpufeature.h
> +++ b/xen/include/asm-arm/cpufeature.h
> @@ -47,8 +47,9 @@
> #define ARM64_WORKAROUND_AT_SPECULATE 9
> #define ARM_WORKAROUND_858921 10
> #define ARM64_WORKAROUND_REPEAT_TLBI 11
> +#define ARM64_WORKAROUND_845719 12
>=20
> -#define ARM_NCAPS           12
> +#define ARM_NCAPS           13
>=20
> #ifndef __ASSEMBLY__
>=20
> --=20
> 2.28.0
>=20


