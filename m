Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61232D6228
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 17:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49544.87635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOzp-0004YH-DR; Thu, 10 Dec 2020 16:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49544.87635; Thu, 10 Dec 2020 16:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOzp-0004Xr-8q; Thu, 10 Dec 2020 16:40:49 +0000
Received: by outflank-mailman (input) for mailman id 49544;
 Thu, 10 Dec 2020 16:40:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/MM=FO=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1knOzn-0004Xl-8r
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 16:40:47 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84137fcd-450c-4775-9506-5a0673421800;
 Thu, 10 Dec 2020 16:40:45 +0000 (UTC)
Received: from DB6P18901CA0006.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::16)
 by AM5PR0801MB1747.eurprd08.prod.outlook.com (2603:10a6:203:36::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 16:40:41 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::84) by DB6P18901CA0006.outlook.office365.com
 (2603:10a6:4:16::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 10 Dec 2020 16:40:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 10 Dec 2020 16:40:41 +0000
Received: ("Tessian outbound 39646a0fd094:v71");
 Thu, 10 Dec 2020 16:40:41 +0000
Received: from c07450a69764.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9099E05-965C-4A88-910C-049916B030BA.1; 
 Thu, 10 Dec 2020 16:40:26 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c07450a69764.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 10 Dec 2020 16:40:26 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB6PR08MB2694.eurprd08.prod.outlook.com (2603:10a6:6:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Thu, 10 Dec
 2020 16:40:24 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 16:40:24 +0000
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
X-Inumbo-ID: 84137fcd-450c-4775-9506-5a0673421800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGzAees7ci6ehURaIMSQQi31zPIrWQ3jAjGAbguxcnA=;
 b=KA5FM8Mv0MXr6x/1aROzPtaUY1H6huXEeeTdqJDYfhLgIdBtzil5x6+7c2JZUa2+Vm2vyfTQdgSxeiCL+azMVsLDfiO9TumzCzmguZ274+rFxeZvxeWhX59tq6C6VTjKGrtSDAKHZ8kbBfE89vLYzrGc4YpKmpbb9RMGik2OlYs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d298e4cc75ccdc2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfIMHxySovn6b9fkBKjXfD2hitAFv4bu7WPSk8DyOT/EXDRY0I2yJuWI5yWUD2r2EfKcdxZL7xnkMfwr4J1a4d9cROV0eBJbtV1KsG4IFwZIsY1AO2t+J5HICPClfXT4DEDrvq6BFMa/EC2hAQoLHN8NEeQ9BjRYRq/S5cNqteDNEg6CHwfc1tcjnShJD16F+gO+1oGgz2cPQOSN/MLp7+QFQgP2uQcssnRyIbzNMXM3gmfL3FCShSph73xscqrLXGTPbYb5plio9xsRgA3Q7kwluOnWO+v9ZUCthWIKHgLwTOQLiu5WmRtcYsJMwFjjiLvohJ2r1uR4cFXVR8Ze1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGzAees7ci6ehURaIMSQQi31zPIrWQ3jAjGAbguxcnA=;
 b=W/uxqol6q2MepPE1akUJcD2oiBYrJfj3CEzAhBAonxoRrwgvtHNrNgLw9pjIPTK7RMeQgDaboi/6RyeqG3Hm2YXayTXRQKN/ke+iENHnoDCXE5UGq0DSgr3T121lcEBX2sTFWc4pMwRP/SpdFx/MjK3YICwo4/e3rifYVVvnR9g9kyws4eougkkyIK78vX1L4r9j2bZpaEhHRKSeVvO1e17yxbmFK0/0jsu81UZA5MtyjMvybKbKDVLyh1Lj1bTxgwekQkA2EafxhAaXwl2r4hPDLZAPyqx5wXUWg7Zf5Gx15FGt6oG1CXBtc9XAEWF+C3e19D32D5XSKC3vYzitzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGzAees7ci6ehURaIMSQQi31zPIrWQ3jAjGAbguxcnA=;
 b=KA5FM8Mv0MXr6x/1aROzPtaUY1H6huXEeeTdqJDYfhLgIdBtzil5x6+7c2JZUa2+Vm2vyfTQdgSxeiCL+azMVsLDfiO9TumzCzmguZ274+rFxeZvxeWhX59tq6C6VTjKGrtSDAKHZ8kbBfE89vLYzrGc4YpKmpbb9RMGik2OlYs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #843419
Thread-Topic: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #843419
Thread-Index: AQHWzuFTbv9qCLSEMEiMd7L0GnVOBKnwiIyA
Date: Thu, 10 Dec 2020 16:40:24 +0000
Message-ID: <0D0CD227-43F4-449D-A7E2-E00C6442F19F@arm.com>
References: <20201210104258.111-1-luca.fancellu@arm.com>
In-Reply-To: <20201210104258.111-1-luca.fancellu@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: e99aa3ec-2574-46de-89da-08d89d2a5529
x-ms-traffictypediagnostic: DB6PR08MB2694:|AM5PR0801MB1747:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1747B18C54B3360C1F82C67C9DCB0@AM5PR0801MB1747.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8BTXaeWOWB6N5JWSlkwYw9ATCZv5U8zna+GDxw8Aks/0vzWI6xPvQohBIPsQ9+rE+XIfSgObxbgl3UOh8ZPE7Sm7WM6MiEuWoeDPyVxb1iGlZUYG2x7oDxnJH4NEVaKKm7H3ERg6snfEykpbynvDds/fkbDRK8AMB8oUlLdhyQ8tHdXhsToQmJ3cg7w6/RA594OSUbyATO8W/Fc6kpVm7ZJhWQ+8AYBcTMHJobnZIrZMnO9XU/shwWoR85L9nv5WEpwJfL8guGqXEDTYC2Qjbc6A80M8P2Kobs9rRaBsTk9lU++csdd7W0VFjiWBQ+UKXckIVSWaYvyNf86D/Ga+a/2e1zSkMn06Z9NKVZF7NxhAVRM8v7TLaEwGAindY28W
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(6636002)(71200400001)(33656002)(6506007)(2616005)(76116006)(91956017)(86362001)(53546011)(478600001)(66946007)(66556008)(4326008)(37006003)(66446008)(64756008)(54906003)(66476007)(5660300002)(8676002)(8936002)(6512007)(83380400001)(316002)(26005)(6862004)(186003)(36756003)(6486002)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?s1Tk+tZEwum91sgEy46LgzSzsNDRA4WGFebnuz5IjcR1omLjfEMECJsSPOlc?=
 =?us-ascii?Q?Yl8eXuLEWe5Ob8RuV7SKl3VETP3he0jXTafFIc4imc01ZD7fuZ1rwW1Lr9Pp?=
 =?us-ascii?Q?e7koCtJvpZ+J9PtBPKeoYMEx/qxd2H1eR+NpkUGn4t26571dHXn81H1rl8Mj?=
 =?us-ascii?Q?B48WPwPsH8KEVbDUNWY0KUAWP9h2VPv0YvnQowmv/9k/ZAjfa5weif/okGd3?=
 =?us-ascii?Q?sl3hNIsxYW3UsCI2+pbbJm7z8w685YU8iEooziXmuQx8JzxyRGh4QtYEaL1A?=
 =?us-ascii?Q?l3o9LL6EieOKJD1txEI1J2tGCxqZ3krIEPxIFMOGb2T71otOGzTFVj/jLYPh?=
 =?us-ascii?Q?gC5/luOoN60an79wC6iCmU/u9ukP2hgg+84WcPShipdGM+OYXtSDdncLw0Va?=
 =?us-ascii?Q?dUXUli7zvLDJkRIKt3ReraY2NHei1pdZ81HhAUYJt2yJZs3CYAlG7TSg2cgm?=
 =?us-ascii?Q?O/ftyyBIeK37EP9ZGZfn7WGXBrviDDI2dNYEr9kUpJ6HxL8myGuvqRKbFZv8?=
 =?us-ascii?Q?rtyTdun24LCswipNLdF16EHoNbppaJEWWMmTDUUIiH+2irp1KvmHHeHowZ+i?=
 =?us-ascii?Q?wTESNasrhNTI7xt8vuhXeKCpDrYiyo0EMPojdfoJaqKPNfa2ixV7ABVH/lB4?=
 =?us-ascii?Q?2sgARb0Wycz4VmPKa/usCqlqJQxqC+GmSWdwG0Gcx9cu3BJRO7ybjzC1yuef?=
 =?us-ascii?Q?EfRKM2rJAUgzB0C7jjlNQt1VhgHPZR++57rUHxWVnmTRSq1LzzaJAQkQcPdQ?=
 =?us-ascii?Q?O/47XmTCZpmGwUGg51/5wnnF2gF+j6aHPzy+1bVIjm3xQwioC84htcTCKtF9?=
 =?us-ascii?Q?5aFNB00I9eiKd8RhcXEXFIqestaQNUiWo7NDxjYcescZBrysWOdmyIOhEILR?=
 =?us-ascii?Q?qVBwtozx5pKW4T5SDbFz6OX5RmJWJEetK5D6lq2uRpI6jKhCmnTbWT6eMMRD?=
 =?us-ascii?Q?aSOPmvtVmx5CMyMlh4DdQ/KsxPFI/qwNNujqDewcLOBMrkzX3H3tX2SCnIrX?=
 =?us-ascii?Q?h9PA?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D004B980C62DC849B638A3B9F0B83B4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2694
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c42438bf-d68a-4a5f-8e1e-08d89d2a4b09
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	44I82oNRHECozS+0aybbjN3gIMcAC3uP7h75eV/jqkR+YklOyXoMPjbqgA3kuMC8Tb/B7zWxe73QqS5MPpHxcz1iSlDkbHqeYCtBviGd8Y7JKgtyU/ASRVlbwbwg4xm/P2Zz4uparPvCj6wOQAo5uaM3g74Grtee/MfH2971MNe/w6Q7CijdXLO89ObTJ+qYIb/eMO9V30NKgUBKpD5G0JRQmIyeI1YJ/sL8FGdQN7TCDqNE3s0J8RBsztEafTO3I9yQLmxO6D7wz8lkKn09qMj3XO9H8jYohukUC/EvZdraYmeh3Ely+Nkcp/tWk7BdoC09t/8t5o+2DJs3PV/lT2Vnb30nDWN5dTvxToC4PieEbutJDW9RAohMY3BbEBIIY/VR85zEoxDJiW1mQ94eqQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(82740400003)(81166007)(6506007)(6636002)(6486002)(37006003)(356005)(83380400001)(86362001)(8936002)(4326008)(8676002)(2616005)(478600001)(26005)(70206006)(47076004)(316002)(82310400003)(54906003)(5660300002)(336012)(186003)(36756003)(6512007)(53546011)(6862004)(33656002)(2906002)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2020 16:40:41.5833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e99aa3ec-2574-46de-89da-08d89d2a5529
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1747

Hi Luca,

> On 10 Dec 2020, at 10:42, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> On the Cortex A53, when executing in AArch64 state, a load or store instr=
uction
> which uses the result of an ADRP instruction as a base register, or which=
 uses
> a base register written by an instruction immediately after an ADRP to th=
e
> same register, might access an incorrect address.
>=20
> The workaround is to enable the linker flag --fix-cortex-a53-843419
> if present, to check and fix the affected sequence. Otherwise print a war=
ning
> that Xen may be susceptible to this errata
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks
Cheers
Bertrand

> ---
> docs/misc/arm/silicon-errata.txt |  1 +
> xen/arch/arm/Kconfig             | 19 +++++++++++++++++++
> xen/arch/arm/Makefile            |  8 ++++++++
> xen/scripts/Kbuild.include       | 12 ++++++++++++
> 4 files changed, 40 insertions(+)
>=20
> diff --git a/docs/misc/arm/silicon-errata.txt b/docs/misc/arm/silicon-err=
ata.txt
> index 27bf957ebf..1925d8fd4e 100644
> --- a/docs/misc/arm/silicon-errata.txt
> +++ b/docs/misc/arm/silicon-errata.txt
> @@ -45,6 +45,7 @@ stable hypervisors.
> | ARM            | Cortex-A53      | #827319         | ARM64_ERRATUM_8273=
19    |
> | ARM            | Cortex-A53      | #824069         | ARM64_ERRATUM_8240=
69    |
> | ARM            | Cortex-A53      | #819472         | ARM64_ERRATUM_8194=
72    |
> +| ARM            | Cortex-A53      | #843419         | ARM64_ERRATUM_843=
419    |
> | ARM            | Cortex-A55      | #1530923        | N/A               =
      |
> | ARM            | Cortex-A57      | #852523         | N/A               =
      |
> | ARM            | Cortex-A57      | #832075         | ARM64_ERRATUM_8320=
75    |
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index f5b1bcda03..41bde2f401 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -186,6 +186,25 @@ config ARM64_ERRATUM_819472
>=20
> 	  If unsure, say Y.
>=20
> +config ARM64_ERRATUM_843419
> +	bool "Cortex-A53: 843419: A load or store might access an incorrect add=
ress"
> +	default y
> +	depends on ARM_64
> +	help
> +	  This option adds an alternative code sequence to work around ARM
> +	  erratum 843419 on Cortex-A53 parts up to r0p4.
> +
> +	  When executing in AArch64 state, a load or store instruction which us=
es
> +	  the result of an ADRP instruction as a base register, or which uses a
> +	  base register written by an instruction immediately after an ADRP to =
the
> +	  same register, might access an incorrect address.
> +
> +	  The workaround enables the linker to check if the affected sequence i=
s
> +	  produced and it will fix it with an alternative not affected sequence
> +	  that produce the same behavior.
> +
> +	  If unsure, say Y.
> +
> config ARM64_ERRATUM_832075
> 	bool "Cortex-A57: 832075: possible deadlock on mixing exclusive memory a=
ccesses with device loads"
> 	default y
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 296c5e68bb..ad2d497c45 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -101,6 +101,14 @@ prelink.o: $(ALL_OBJS) FORCE
> 	$(call if_changed,ld)
> endif
>=20
> +ifeq ($(CONFIG_ARM64_ERRATUM_843419),y)
> +    ifeq ($(call ld-option, --fix-cortex-a53-843419),n)
> +        $(warning ld does not support --fix-cortex-a53-843419; xen may b=
e susceptible to erratum)
> +    else
> +        XEN_LDFLAGS +=3D --fix-cortex-a53-843419
> +    endif
> +endif
> +
> targets +=3D prelink.o
>=20
> $(TARGET)-syms: prelink.o xen.lds
> diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
> index e62eddc365..83c7e1457b 100644
> --- a/xen/scripts/Kbuild.include
> +++ b/xen/scripts/Kbuild.include
> @@ -43,6 +43,18 @@ define as-option-add-closure
>     endif
> endef
>=20
> +# $(if-success,<command>,<then>,<else>)
> +# Return <then> if <command> exits with 0, <else> otherwise.
> +if-success =3D $(shell { $(1); } >/dev/null 2>&1 && echo "$(2)" || echo =
"$(3)")
> +
> +# $(success,<command>)
> +# Return y if <command> exits with 0, n otherwise
> +success =3D $(call if-success,$(1),y,n)
> +
> +# $(ld-option,<flag>)
> +# Return y if the linker supports <flag>, n otherwise
> +ld-option =3D $(call success,$(LD) -v $(1))
> +
> # cc-ifversion
> # Usage:  EXTRA_CFLAGS +=3D $(call cc-ifversion, -lt, 0402, -O1)
> cc-ifversion =3D $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo =
$(3) || echo $(4))
> --=20
> 2.17.1
>=20


