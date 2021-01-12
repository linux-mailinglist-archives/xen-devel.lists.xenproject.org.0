Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C39D92F2BB7
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 10:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65553.116167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzGKp-0004yB-Lm; Tue, 12 Jan 2021 09:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65553.116167; Tue, 12 Jan 2021 09:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzGKp-0004xm-Ig; Tue, 12 Jan 2021 09:51:31 +0000
Received: by outflank-mailman (input) for mailman id 65553;
 Tue, 12 Jan 2021 09:51:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zMwe=GP=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kzGKo-0004xh-Uc
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 09:51:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38084e5a-a987-4c11-9f20-9db087c6b6cb;
 Tue, 12 Jan 2021 09:51:28 +0000 (UTC)
Received: from AM0PR03CA0034.eurprd03.prod.outlook.com (2603:10a6:208:14::47)
 by DB6PR0802MB2296.eurprd08.prod.outlook.com (2603:10a6:4:87::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 09:51:25 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:14:cafe::d9) by AM0PR03CA0034.outlook.office365.com
 (2603:10a6:208:14::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Tue, 12 Jan 2021 09:51:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 09:51:24 +0000
Received: ("Tessian outbound 2b57fdd78668:v71");
 Tue, 12 Jan 2021 09:51:24 +0000
Received: from d91020ec7bec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 073434A0-59CF-454A-BE26-59D982FAC512.1; 
 Tue, 12 Jan 2021 09:51:19 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d91020ec7bec.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 09:51:19 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB3616.eurprd08.prod.outlook.com (2603:10a6:803:7f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 12 Jan
 2021 09:51:17 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 09:51:17 +0000
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
X-Inumbo-ID: 38084e5a-a987-4c11-9f20-9db087c6b6cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck4ALEouIpBpOvDLMVT4DlldZFAuFcYI51aYDiAyw40=;
 b=nqh7PwVebCQD5MtycpI0uWIrqKh9rJab07+c2LR5s9Rdbd1bpW/IgLcoBdK4D32zi7Bbvv0qJftvK0+SIBmA0JwFCZJcK1Q4+pQ6mXEWe/kbhP9veQjJ/HatH1qTVtKtUjzMHgLdJL8FaMPONAIFkgmpUKEy2BfHlgCzrmKgOjQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a0a95a4345ad9306
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EB1qFtIiin7bre3E1tDtRA+1jRuCypg6cS3JxWxnqFoumqk7bHzvasZzKmd2jH+1od+ZdjD0E10LPG0Cgx22Y59SUBpT+gikeWp3PKGo5oSoz0CTMvqWZU7DcPFhkjUkFSWcwdteTh6lixSTvYy3pXGqDZUEuIbkTHAol+Wo+42yCKcJQc3aTLwa356suGqreGc7QZDmZ2cPn+jxFcbCVqbxfduZx8q27k7Hrwe2x1X76eKYRJkNyRnhP3PvlgbhDKqMBQO/fj1GVovlAcFrTCKhzHyPGmUVvegDIbmPRoCerJVXq4NqusbmXNgMDmDNuq8BdaG8X6XDRWg5bAQE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck4ALEouIpBpOvDLMVT4DlldZFAuFcYI51aYDiAyw40=;
 b=fJWStcgFN8RimM5/8vQsoL26s41JLFKij5YL214pRu4EKskK3aQ343acOHX7ibquONMhWGzJZzyjjhiHlMBIUyF7cSUJ+37f5wtkPpz8vXg+ROr3dclxqTwugRj388bIR4xaTE4UneWm4VL7war+/tKh7vBvmk1u4BmNGJQ7p9IUaBy6T7lOdGBhj91BH/L5Tq5OrsiY+PpahwVzJBeoo5pizmOgNbdyJrgRkPcKzxQXQTj5pUxcHzNvVw2Uz17qLAKdoN/4Ye7pZiumVqgQlZQQYUXXkdV4/B7KK/JyW1i0/cycfilHEbgm7PnXj7SnEIfpjwb9yYaAgGZ9ewC/Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck4ALEouIpBpOvDLMVT4DlldZFAuFcYI51aYDiAyw40=;
 b=nqh7PwVebCQD5MtycpI0uWIrqKh9rJab07+c2LR5s9Rdbd1bpW/IgLcoBdK4D32zi7Bbvv0qJftvK0+SIBmA0JwFCZJcK1Q4+pQ6mXEWe/kbhP9veQjJ/HatH1qTVtKtUjzMHgLdJL8FaMPONAIFkgmpUKEy2BfHlgCzrmKgOjQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] iommu/arm: ipmmu-vmsa: Use 1U << 31 rather than 1 << 31
Thread-Topic: [PATCH] iommu/arm: ipmmu-vmsa: Use 1U << 31 rather than 1 << 31
Thread-Index: AQHW6AVuxFxs65/4skyKik2n+IboV6ojwOaA
Date: Tue, 12 Jan 2021 09:51:17 +0000
Message-ID: <84F73044-4165-4CD5-B006-FD5133360276@arm.com>
References: <1610361235-32697-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610361235-32697-1-git-send-email-olekstysh@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 09bde663-153a-4ad8-faaf-08d8b6df9fef
x-ms-traffictypediagnostic: VI1PR08MB3616:|DB6PR0802MB2296:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2296B2D2BD3F5DE67ABE1FFA9DAA0@DB6PR0802MB2296.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h3NXBqxjZdEoo7jn/c2AZ+CI7vCGwqA/JFcpNDVpa/wSd1ToXc+ZvsXCCJlXKOKEVm4oIaBuyjFII/8mpsKoYq43ECswjsUZLoYFAPSKWpP8fB1Dk+tzpubpWo/6v57WAa9MohgNJENlIDKTi2wSiFCk9v1pUT3r9u3xExZshVjlQaU8QI9X3FeziOroNfI/h67yAWNT67SJZPleKXx0xIQ0WvOfNgCNnXd5pKW33MC1z+P+fGK/GzP3kDT9pDvmHe9YFWG5ZFnRSNUsWB8tJQhrA328W1d7Oo1FdjN9mqMww/rqWDFGAMftEYNmGkDpUFOQjWNzf9faeyryy9E57YEBrITVhxI7R9eEoETLMSneKw0++ALq1bgZbskfCyhjaNWbAeGOC17D5QIhjYlWpaQt18IjWDoufwFdDEaSr4JRXoqfNl9k3KKVhdqhcOmhJY/dxMJrYmirLfMWZubZCIoUFHH545iO0LniRIQFpUheMbQAn+UQMWAHzhBfq1AA8KE1cmXUXETssAbPpBfBog==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(71200400001)(4326008)(8676002)(6916009)(36756003)(316002)(2616005)(53546011)(6486002)(6506007)(26005)(55236004)(186003)(86362001)(478600001)(2906002)(54906003)(966005)(6512007)(83380400001)(33656002)(5660300002)(66946007)(91956017)(76116006)(66446008)(8936002)(64756008)(66476007)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?eNhgXi4arjl3+WapXyLrJKF77iS565zO1t29wQODQSlnjxCDsEGaAJlw+UHO?=
 =?us-ascii?Q?mfQyz1KBPHH1lLHXUWOWPpXKiflpG9Q26GV1uDQoUFMjVm8gEggJn5FG7R8H?=
 =?us-ascii?Q?HJOMWkvi6xQQ4QHVyYtyPEm0j+nLFTPpqPTtgVCW36KLP9Lm0HQOLQ6XdqzW?=
 =?us-ascii?Q?bg4H+tYW/Gz3rpU6gUAsBg+OjH2NVSSHG+jaz/ppbi31AP9IlEG59qZaK0Yi?=
 =?us-ascii?Q?wP8VTiTV8//rRJW03LZynmfq8f0pO4Na0qzAr+Q26bDdc15YsxN7TOzHOzPZ?=
 =?us-ascii?Q?NzgJF+P6twfFny6fRpsUN89mLZbv5yeD36h5glkKz+Nb3452c5fuC6ejWB0L?=
 =?us-ascii?Q?Qi0yhLwkGB+LHPWMdpCZ6Pkx4AZHJmaIIpp8PtTNCylc1WZaUWYL3oCn5c3C?=
 =?us-ascii?Q?BGwqiYheVoQ1oQebRPdVWB4Zk0xHXQ0YKpjak3f8zs4V5rC5AVAmD0uPAG4f?=
 =?us-ascii?Q?vdAo0EMC9P7IFHbfw+ZY34g6FpAwhbw39Boh0YhTKZkFWWqcYCxjsuuq8hRK?=
 =?us-ascii?Q?Mg8W3ZwY12g1QCNCgX2lGLXsO80U1tyBC6tgPSGwQ3uErLUd0wl44bU+1Q7i?=
 =?us-ascii?Q?kOXsUDOtlmg+EwCUOXqvylPL9I6ZDEeldZO87K3OPr1GGFyrU39a0V5ePAk7?=
 =?us-ascii?Q?OCouFa0pSCVR4iqgQYRIqjUOpolLXtKei3DT2Dp4HXNEEKkccWwSCAQHQHnt?=
 =?us-ascii?Q?reH8fCGxUZkmKb0Jmb44Pd3kOcUF2CVCjJXpZakvP4LvImB9DSgfS7pA8BSI?=
 =?us-ascii?Q?8XPVRN4OZfDTvn9GJJMXhvHIgbXWTdS8gk+Q5avLK4gA2BcnZPIaDSV34o0e?=
 =?us-ascii?Q?V0mRiQu/iqlhQHPmb0y1lpBWhm4ZYYynCWsxprx751cnzgajgkn7ZLeXGtbK?=
 =?us-ascii?Q?mG4wtyhm/jl2qKnwcWk1fW7NFWsxo7dsbyk0Lj5a2WLJcuhNf84wDrElN+R2?=
 =?us-ascii?Q?fvvVKEnMcsMR/cFezI+H3MM8UJ05xpDsOTeuVCBV7y/hkUCPg0zpE/YkTirq?=
 =?us-ascii?Q?juY/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <42CB4A4668B50745957A02382D52876A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3616
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bcc02d58-d23c-44c1-903a-08d8b6df9bb4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CnBpUBrua3e+97strePaAIXcDydpq9Nj36cqx8P084rnFTRVNAPoQqfSOJr/K/Ny44rx880/hWZcNM9+ZmpDS7zCFLOhVDPyc5Wwg6P7xrZ1tQgosGx6DHNZRWx2nCZPOSFuhAdntD/2Bm5r8gbmNl204+UPS9ksOnxP9u3xLSmyIfbLgx6Mz9wupaeUD2NGidoXL0jm3Fq3safoWPLrWnYos7bwpK3Ow4F8GSMVDKjBQTMCWT7Ozak2K1vVvX1n870xOtfFKtE0eJ4P1R/Guc7SV3xJOnkBNAMn2sp5KyAQLGmGLcxigA2wzQvBBacTM0N4s6t6X1yKa9n3YI2x9tEP9w289gOsTGnnpVDFq1O10RDil7uiZBCiVdwnOL4I+oYDxRtGDLN11exWu6E8Nvh7FrrWS4UBPjjwESVBtCo7/tXjlj63spyAkkx0wfGhhoWYhxDCWIZUpU7Dt9zBQE3y5E0VHuAbUt84HZa3/xwiCE9OWgJjidNptndya6nJAvwG8tLEkf0zU+fKMKrmoT+cMJ+yNJKwF20nUpiItk3s6pjtoScIsM/MF/Y0yZpm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(46966006)(82740400003)(86362001)(36756003)(8936002)(966005)(336012)(316002)(70586007)(6506007)(26005)(33656002)(356005)(70206006)(82310400003)(53546011)(34020700004)(83380400001)(54906003)(55236004)(5660300002)(81166007)(47076005)(4326008)(186003)(6862004)(8676002)(478600001)(6486002)(2906002)(107886003)(2616005)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 09:51:24.9572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09bde663-153a-4ad8-faaf-08d8b6df9fef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2296



> On 11 Jan 2021, at 10:33, Oleksandr Tyshchenko <olekstysh@gmail.com> wrot=
e:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Replace all the use of 1 << 31 with 1U << 31 to prevent undefined
> behavior in the IPMMU-VMSA driver.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> This is a follow-up to
> https://patchew.org/Xen/20201224152419.22453-1-julien@xen.org/
> ---
> xen/drivers/passthrough/arm/ipmmu-vmsa.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passt=
hrough/arm/ipmmu-vmsa.c
> index 346165c..aef358d 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -187,7 +187,7 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
> #define IMCAAR               0x0004
>=20
> #define IMTTBCR                        0x0008
> -#define IMTTBCR_EAE                    (1 << 31)
> +#define IMTTBCR_EAE                    (1U << 31)
> #define IMTTBCR_PMB                    (1 << 30)
> #define IMTTBCR_SH1_NON_SHAREABLE      (0 << 28)
> #define IMTTBCR_SH1_OUTER_SHAREABLE    (2 << 28)
> @@ -251,7 +251,7 @@ static DEFINE_SPINLOCK(ipmmu_devices_lock);
> #define IMUCTR(n)              ((n) < 32 ? IMUCTR0(n) : IMUCTR32(n))
> #define IMUCTR0(n)             (0x0300 + ((n) * 16))
> #define IMUCTR32(n)            (0x0600 + (((n) - 32) * 16))
> -#define IMUCTR_FIXADDEN        (1 << 31)
> +#define IMUCTR_FIXADDEN        (1U << 31)
> #define IMUCTR_FIXADD_MASK     (0xff << 16)
> #define IMUCTR_FIXADD_SHIFT    16
> #define IMUCTR_TTSEL_MMU(n)    ((n) << 4)
> --=20
> 2.7.4
>=20
>=20


