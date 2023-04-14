Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A10B6E1E80
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 10:41:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521046.809312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnEzV-0000SU-Jk; Fri, 14 Apr 2023 08:41:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521046.809312; Fri, 14 Apr 2023 08:41:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnEzV-0000Pg-H1; Fri, 14 Apr 2023 08:41:09 +0000
Received: by outflank-mailman (input) for mailman id 521046;
 Fri, 14 Apr 2023 08:41:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tlWx=AF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1pnEzU-0000Pa-5B
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 08:41:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18e770d6-daa0-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 10:41:07 +0200 (CEST)
Received: from AS9PR06CA0159.eurprd06.prod.outlook.com (2603:10a6:20b:45c::26)
 by AS8PR08MB9744.eurprd08.prod.outlook.com (2603:10a6:20b:614::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 08:41:03 +0000
Received: from AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45c:cafe::2) by AS9PR06CA0159.outlook.office365.com
 (2603:10a6:20b:45c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.33 via Frontend
 Transport; Fri, 14 Apr 2023 08:41:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT007.mail.protection.outlook.com (100.127.140.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.33 via Frontend Transport; Fri, 14 Apr 2023 08:41:02 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136");
 Fri, 14 Apr 2023 08:41:02 +0000
Received: from 9d7f2be32ea3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F29C5BC1-AE1A-480C-A63D-C2C66DE582EA.1; 
 Fri, 14 Apr 2023 08:40:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d7f2be32ea3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Apr 2023 08:40:54 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB6680.eurprd08.prod.outlook.com (2603:10a6:20b:397::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 08:40:52 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8e01:7058:6f40:90e1%7]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 08:40:52 +0000
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
X-Inumbo-ID: 18e770d6-daa0-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zcc1odVblejsig4qsy4m9Anh6zU8rGuBdxTtNo7iqtY=;
 b=rjM82foaOvVrJeDUNzBYaqDBUkQ7q/N6kQmBKIWPbGQ64nxm7N/XghyuXsT2F9jFm2fqF9/X/1iM0Xh0e0mci/vNEGlgHfeC6PROoMlzWo/WNuhKwMcAm5LT9MzRxvG7I4L3UfBlf7hFWFCsVlBO8PzGkIWF3kLtjIN0YrE+lPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6e812a435e6285eb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGaWOVDDZhIFh6UqPXMqVrOuDnGiNONs1nQr8gs1Fjc2xy/KUjF9O2VigdgqG+vEKxrlBxJzw/SZzjOy16ES0VUfWpoVEP1w/+RemFwfj1PtWYKdi/9205hmsG7Dkg8aiEFRsm661qSa58g1HOlPN18sWkaxGLIA/sbasKhXcNq6whyO/uRArI6FmEbLPBEwPC3xnOdT5H5ft6Xz3H23yHKo7Yxtzb7OPl6qTiFz5rXLZ/Gd+xtS/JsnldsoFP6llkNRMQidEuOkZW82tdZylUW1/512QQrdlfqXR0M6ji+UqvBjnLch5xBOxWoxxf97lg8IY/UPnMmAVltEZk+2bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zcc1odVblejsig4qsy4m9Anh6zU8rGuBdxTtNo7iqtY=;
 b=iRVPrKcXXz/mkMJ036ZPu/stLqYRmqdqxzC+tnTPID8hHuo+/S6BE69CmSFgNXSFhYqr+0NiA0iwVlwrYmDpgHKObretvQbtwEd4RGz5132iJ4JDWgsLF9jFC3VqKlgOiXaYlsF1hom196XG+UhdW85KzLEUPEdg6a2bsE8cH58ECZmZp/IBTEqxoVI049HZUVDjYQ+82K3ekkSiDKbxEugXb6omFQMXdVgPt82+INbyGXxXxSzrbujfpC9jAyDdcLGbPPYqNxcbwI7V+QJa1Bt5cIIq8Q/mGl910WSSdjm4aUe01v7dqGD84EP6sEjXG4bZ1h2T71ihcktNgLj2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zcc1odVblejsig4qsy4m9Anh6zU8rGuBdxTtNo7iqtY=;
 b=rjM82foaOvVrJeDUNzBYaqDBUkQ7q/N6kQmBKIWPbGQ64nxm7N/XghyuXsT2F9jFm2fqF9/X/1iM0Xh0e0mci/vNEGlgHfeC6PROoMlzWo/WNuhKwMcAm5LT9MzRxvG7I4L3UfBlf7hFWFCsVlBO8PzGkIWF3kLtjIN0YrE+lPE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 04/12] xen/arm: add SVE exception class handling
Thread-Topic: [PATCH v5 04/12] xen/arm: add SVE exception class handling
Thread-Index: AQHZbSQpoCrJkjjTIkyQmrtaVCm5Lq8qf08A
Date: Fri, 14 Apr 2023 08:40:52 +0000
Message-ID: <92137CCE-1E08-4C95-9BC1-A4B83EEEC91E@arm.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-5-luca.fancellu@arm.com>
In-Reply-To: <20230412094938.2693890-5-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB6680:EE_|AM7EUR03FT007:EE_|AS8PR08MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: fc49b2fa-9d1c-4e92-8de3-08db3cc3fad6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nxPwmzvnFSe/USa0o86JHXqtJ8idwvBwzFgRoNlf0un8jL+zjegRhRi7xD9R5AhwpxdRhZ86VWtoEQHHrBgr0D3y/Vo+7JZmgcq1GowFVyU/4g6/HyyTXDsgTHFxUKx5yxx1jwAwCDM3qAVpk7M60Xc0xPQ8I1DSWhurczxIg+APipw62UW5fzwiDux/9BmaL+MjU+Mes5ofatHZXyelqPaxEJZYyrkIbgeCamVLOOKGkSgLBtYck2Rv8dhk/vQSdNSqAOy9NpQHL4Ba4MEtiyDWOfA0liWPV5M8hBsske2lIpi5744LdDcoKTOec7kqVNai37gScUEeE2ZJMjTUU2aa5ELgAohAVL41IQkYjON5GgcIX4YSJu6EzR3Ayv6m5UFXsbuXsPDrNwliFQfqd/azj+ixqGfG8B8VhZO/gbyf9PbLrD7R6CYYmze3qFVOsS2lFPYaP+3eys8SRuzUlVc/kMYJDHOJyoWKW+rjDMf4rOw3Lr4QEPJenGTi4HjIyZjDYU5VLHgXYbJkNRlw1yAxyNT+EyjA2yqjcdRBMF47FMIW6rdsHyVeK9nW3IejdotPjJ0T6C4hfeR1rJKUHky7TkeCLuNLNswTgAsRNS+tT1CVfs1Zh1auJ0ypigP4irLabV/VtNrUMcUibaUTsw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(451199021)(38070700005)(6512007)(186003)(6506007)(53546011)(6636002)(54906003)(37006003)(33656002)(478600001)(122000001)(2906002)(8676002)(8936002)(6862004)(83380400001)(41300700001)(5660300002)(2616005)(38100700002)(316002)(4326008)(66946007)(66556008)(91956017)(76116006)(66476007)(64756008)(66446008)(86362001)(6486002)(71200400001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <63ACCED0B18DAF439FB2E33AA5279782@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6680
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f0ba49c-1d48-4352-3563-08db3cc3f4aa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rW9+y1RYA701dmMxyj8bWYIpK/JC3KNLWzq1A6HxjeQaQlehXnZDK4UjZtXGApYYB/2ItkaaPdk/G/Q3rCzhI3TYF2k1ukAAeami+xtpwpzyJ4jyOkzh0x4lxXKPxek+qVTo6NQX9NFiISf/XM8ZXltRf5R7ghIf0h/jXnXfmLk6ZqplhtTbLLqSAD+IHrSgXhWLXg3SZekUBGSYUKPhdP7p/m+OPlxXUBZl3f1TTvPqU5w5ccAjUIeZj2cty2Y4UZjgjQLi8xaCkWkpdiYXuyUIYAhCvT+8FBhgtNsVm02ojMkLg3cuWhYsdkF7mlNdkm9+0vgQs5CA2irTa+1f6SHuhLx2/n2853Lc9L0CpMnGhjQ8TUqxi/olI5PE3Uq+BDXI87yMZxRMXR5ce/F8/X2zgrM/WLH4ofR84N1JDuOszpTnnW9tDof2Kf3/ENnnnH5mjbEGcajTdm+3y+LoaiyPjRJYZCN+oc/4N6sn5kIYgBb7C8pfCFW5Z02nZvOupYr8IwdNIIUoux/09pJUeHZCnhYKFgbTuibPhMdKq95tZz76uqWZr0908qpfTcDeN6GcfLliC8yYvIZsazCWF2VT6C+iNGbIgrolUheKwaXeWPxy2U3ql2yBe3Cti+hUx8vXirk7gNH36FCuppMEH0R7AJzO+KJDIsO7i33SJWWhOxLQFtK2FjfoQekhcOdp393CVxmrrqbsLS10eYMf0g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(46966006)(36840700001)(40470700004)(36860700001)(6862004)(47076005)(2616005)(336012)(83380400001)(54906003)(6486002)(478600001)(356005)(33656002)(37006003)(6512007)(186003)(6636002)(26005)(6506007)(107886003)(2906002)(36756003)(5660300002)(70206006)(4326008)(81166007)(41300700001)(53546011)(82310400005)(70586007)(40480700001)(8676002)(82740400003)(86362001)(316002)(40460700003)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 08:41:02.7086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc49b2fa-9d1c-4e92-8de3-08db3cc3fad6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9744

Hi Luca,

> On 12 Apr 2023, at 11:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> SVE has a new exception class with code 0x19, introduce the new code
> and handle the exception.
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

With the comments from Julien handled you can add my:
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> Changes from v4:
> - No changes
> Changes from v3:
> - No changes
> Changes from v2:
> - No changes
> Changes from v1:
> - No changes
> Changes from RFC:
> - No changes
> ---
> xen/arch/arm/include/asm/processor.h |  1 +
> xen/arch/arm/traps.c                 | 12 ++++++++++++
> 2 files changed, 13 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/=
asm/processor.h
> index bc683334125c..7e42ff8811fc 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -426,6 +426,7 @@
> #define HSR_EC_HVC64                0x16
> #define HSR_EC_SMC64                0x17
> #define HSR_EC_SYSREG               0x18
> +#define HSR_EC_SVE                  0x19
> #endif
> #define HSR_EC_INSTR_ABORT_LOWER_EL 0x20
> #define HSR_EC_INSTR_ABORT_CURR_EL  0x21
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index a78a99ddadd0..c2e30feafd5a 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -2160,6 +2160,13 @@ void do_trap_guest_sync(struct cpu_user_regs *regs=
)
>         perfc_incr(trap_sysreg);
>         do_sysreg(regs, hsr);
>         break;
> +    case HSR_EC_SVE:
> +        GUEST_BUG_ON(regs_mode_is_32bit(regs));
> +        gprintk(XENLOG_WARNING,
> +                "Domain id %d tried to use SVE while not allowed\n",
> +                current->domain->domain_id);
> +        inject_undef_exception(regs, hsr);
> +        break;
> #endif
>=20
>     case HSR_EC_INSTR_ABORT_LOWER_EL:
> @@ -2189,6 +2196,11 @@ void do_trap_hyp_sync(struct cpu_user_regs *regs)
>     case HSR_EC_BRK:
>         do_trap_brk(regs, hsr);
>         break;
> +    case HSR_EC_SVE:
> +        /* An SVE exception is a bug somewhere in hypervisor code */
> +        printk("SVE trap at EL2.\n");
> +        do_unexpected_trap("Hypervisor", regs);
> +        break;
> #endif
>     case HSR_EC_DATA_ABORT_CURR_EL:
>     case HSR_EC_INSTR_ABORT_CURR_EL:
> --=20
> 2.34.1
>=20


