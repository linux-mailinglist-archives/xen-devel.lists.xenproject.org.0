Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE83428E12
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 15:35:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206010.361464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvSI-0000x6-BM; Mon, 11 Oct 2021 13:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206010.361464; Mon, 11 Oct 2021 13:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZvSI-0000uU-75; Mon, 11 Oct 2021 13:35:02 +0000
Received: by outflank-mailman (input) for mailman id 206010;
 Mon, 11 Oct 2021 13:35:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LfEM=O7=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mZvSG-0000uO-NS
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:35:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80b00963-55a7-474d-b32f-b0c6b24fd271;
 Mon, 11 Oct 2021 13:34:58 +0000 (UTC)
Received: from AM6PR05CA0033.eurprd05.prod.outlook.com (2603:10a6:20b:2e::46)
 by AS8PR08MB6838.eurprd08.prod.outlook.com (2603:10a6:20b:353::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 13:34:56 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::1) by AM6PR05CA0033.outlook.office365.com
 (2603:10a6:20b:2e::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.27 via Frontend
 Transport; Mon, 11 Oct 2021 13:34:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 13:34:55 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Mon, 11 Oct 2021 13:34:54 +0000
Received: from e2a40f08536e.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 617DE395-B2DD-446D-BDFF-DB8728061DCB.1; 
 Mon, 11 Oct 2021 13:34:43 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2a40f08536e.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 13:34:43 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB3369.eurprd08.prod.outlook.com (2603:10a6:10:44::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 13:34:41 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 13:34:41 +0000
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
X-Inumbo-ID: 80b00963-55a7-474d-b32f-b0c6b24fd271
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/5z6cFxpvEYcJSvVT0f09ajvwhHu3nE5OcRBCHhQD4=;
 b=wA2W3zOFL9fBQqM9ImOachNvjFFUqC/3eeliShi0vdynSbuS5a5ZAPl6PMbKf5eMP6MUY/WXSfaU3NobhNK9tjdWFqKZY5uZwB0yL1fJUsjDmSJqctSqfoeQLRjnQt3ESlb3g16+SCqbMRxUC4IWIeUnZ6S7qhPIZWwJcbXNnmY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fd589959859da261
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MSORPbyFjmwcMuyLVX8nmU8jyC/v+uOewM15pdzZesHiRdzBjBGDfQMpiZUKHnBCK7eMdN5s1QcmcgAFnN1WP4EPeFw4u/EhG91FBurnIrJL2vk9GLc/mhygKkDDpRyCDauBGmG7rl+GQrxx3N/X1EFxN4u/W4CJXYcenuzGMXGIlEPhJxKwHfW6mwss5ZYJ6WlPyJqmSQrxCNTpThK2LxiJaQ8/lv6KPGgdFUWEDjefesHbMQZLWWVbTZRaqrokNVCpKEKC5MzZZA01HVP5I/puZC7eT2oS25bIi5bse6fC1KkmsPyYIjYgnn9Otk00+Yq2YRiRajTcFmoEXt0pCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/5z6cFxpvEYcJSvVT0f09ajvwhHu3nE5OcRBCHhQD4=;
 b=Fkkok0oPYCETuU9ylV6YZ+OL5tNOI3XPpfBI/8zE03MC9TILaRbAmnOL5Jg21d+49g7ZAZ+FspJFd8AoslmyP5jItP0e4gezmh+yWyZwomdMKy/2pYGGUT7RHrHwNJ7KuMJcoAMalCYcBu62u0K5WjLOt/UQJnakh5LkPtLiDYJBEVX/47QwhCz795CaxkIG3C18gAXsr8dRw9FdY63eslU4kIwhHRfgvKDDo+9y5NIaDe8RFtfgPmSOWUo3ZAvYO4aAv1LzAs8KfTLo806h0zG/EaGDRlU5S4JZzdo/Fc6CoqXtKiYaNpPndNwhmWVSag2EvsHCbWvzSz6H/3Bkrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/5z6cFxpvEYcJSvVT0f09ajvwhHu3nE5OcRBCHhQD4=;
 b=wA2W3zOFL9fBQqM9ImOachNvjFFUqC/3eeliShi0vdynSbuS5a5ZAPl6PMbKf5eMP6MUY/WXSfaU3NobhNK9tjdWFqKZY5uZwB0yL1fJUsjDmSJqctSqfoeQLRjnQt3ESlb3g16+SCqbMRxUC4IWIeUnZ6S7qhPIZWwJcbXNnmY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <Rahul.Singh@arm.com>, Andre Przywara
	<Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXutl3YqS5dHXsYk6KpdKt4d14RavHjPqAgAY38oCAAAe6AIAAByIA
Date: Mon, 11 Oct 2021 13:34:41 +0000
Message-ID: <A8DEBD07-FB45-4E4E-A2C3-7AF8B393B032@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
 <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
 <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
In-Reply-To: <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b3e9df3d-a861-4ed9-0662-08d98cbbe999
x-ms-traffictypediagnostic: DB7PR08MB3369:|AS8PR08MB6838:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB68381ACEC12DFA8EEDBB0E089DB59@AS8PR08MB6838.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 efvdKWMSH+/hHUNZ5y/Rn57ew3oR/dj6eHyUys8qMtQhK7MgpGxkXHiXdz2DnfHtveUAkpOEignqtKcenX+pHWyT0PuLhf7qNLvQl/WGpDCL3lXo5gH+NzDksMxqJc+BRvmSjsdx44+geqpxB1sElAsR+cr/jZqW1MnvwfaMcJXTwGlkcMr7WPAk7VyTXcz/dgpAw+TcyEyNhAETcc608NBpsUUb9vs1FFn5zxnk9dPl2OH6XjCYpgYuRNw2/9N3/0SMky+kwRUPtb1UPMZshBKR4ew2jaKrBrbaadTobcAbyQ/Qga19vbuiCr/n+y+161m6YufC27AVy3Yiwf/HfbsTNVI3kQC6ep2k33nrrfF34XgeGeABdikKMg41KU4rT6eO0+U8a1+d1PiRMuZOzkCk7BagFWZKY2OSx5jtjVMq8Hryvx5u96iFGDqo2DrHvSGykrnEnfzDhS+YJZF2OJi0XVrWfuy7cm1No9PZPdWR7Wc1D060LTI9DkpCKFgIcR1FvKUWE12aaL1O8knS5FFlvoiMXc1tpKOpq7PkitmLMY2BnxT9W9ehUOI0jumgurflqjTBy0r5OUm7ytFsO0WGWLCj736fi/S4kjE66Dvwg96zwO1wEqQe+yMNjsdaqJ45CMYXcrZ1Ahwei7pcJB8WKnn2aiuV4cTbt0MDTeh0HACiWt8//Ya6QmWT/lPW/dqfPI4bs8B8lfWsb22rH22m+hXKtGRq3v7jgD4CLxWzIrU+6WqXzk71H9PBMhpSzo/wCTyLQkls4JZHsjO0ow==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(8676002)(6486002)(26005)(71200400001)(4326008)(91956017)(2906002)(54906003)(36756003)(76116006)(6916009)(122000001)(66476007)(38100700002)(66946007)(508600001)(66446008)(66556008)(38070700005)(64756008)(2616005)(83380400001)(33656002)(7416002)(5660300002)(53546011)(6506007)(316002)(8936002)(86362001)(6512007)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <354CC74C8456E7498DBED2F78AB31E1A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3369
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	26ba0c5b-ec5d-4cdd-186f-08d98cbbe10a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WYfym34iWdsFjza+aPiuLC+tUjiBpDRN2Gj+Qg3BJsLHeFE/KoKuj8nezp4cYFxeKKYQHS4XCECk+6FCk+swKo/Zt2X2uBHfVGoePFqx8LSwtbNiX5PBFW7khA4ZC5RTi0qjsmZ/pqc7SDUhCThX1relSNjcO1ENUqmxHptzMA30PolqsJw9YABKRU1acoY+pt2ofny2Z02nMsYRxBHDec3vWsWLOZL9e1OSMMcTEJs3AQlAHh9Ob/0EoG4ICXm27Bj9Fyp/TGI+XprzN9VQtW3zUKu7O3zPIsuuDrtCA4e4822gDnXfUAH4/i7TFPWZdzXhUSwUcoHYXDAAfGMfsqjMCSK1SRLUdZ2BilgeONpxNW6SJJ5pK7w7cQeiAuRQiVNA6KSswSb9lf8w35hL1cuYGfa+pNziBfACx5cwfBFoSYjstm0TWYYM3UA9KvJ2WBhsqcjJjN1efeGm0t232gwemEIZcjTS1jUDKbeI7h19jaK3rWkaUUSfExiLbAxjRA7cc7kD8/Badu3bR7q7s1M44ZIxgVVd7KAN64xjzILopfX6Duaf6Acex72FpnNvHyxjRKXejAkatlUQQhd7kCLPG5H/jutKztJBB7hoOiOv/Uc9Io9Da6vWFpaf98o4yEzOV/X/ouaReJPv085+ukYW27MQ4407QZY15wJ4Fp7R4zTJN3sew5JBdCbyrSlnjbqUrfhcrBx94NaW3HG07Asdmy0Pqcg9aF1U2TVifwI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2906002)(316002)(36860700001)(356005)(81166007)(4326008)(6862004)(82310400003)(33656002)(70206006)(86362001)(2616005)(70586007)(6486002)(336012)(6506007)(47076005)(53546011)(54906003)(6512007)(8936002)(186003)(508600001)(26005)(5660300002)(83380400001)(8676002)(36756003)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 13:34:55.4709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e9df3d-a861-4ed9-0662-08d98cbbe999
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6838

Hi Jan,

> On 11 Oct 2021, at 14:09, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 11.10.2021 14:41, Bertrand Marquis wrote:
>>> On 7 Oct 2021, at 14:43, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 06.10.2021 19:40, Rahul Singh wrote:
>>>> --- /dev/null
>>>> +++ b/xen/arch/arm/vpci.c
>>>> @@ -0,0 +1,102 @@
>>>> +/*
>>>> + * xen/arch/arm/vpci.c
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modi=
fy
>>>> + * it under the terms of the GNU General Public License as published =
by
>>>> + * the Free Software Foundation; either version 2 of the License, or
>>>> + * (at your option) any later version.
>>>> + *
>>>> + * This program is distributed in the hope that it will be useful,
>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> + * GNU General Public License for more details.
>>>> + */
>>>> +#include <xen/sched.h>
>>>> +
>>>> +#include <asm/mmio.h>
>>>> +
>>>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>>>=20
>>> Nit: Stray blank (like you had in an earlier version for MMCFG_BDF()).
>>> Also isn't this effectively part of the public interface (along with
>>> MMCFG_BDF()), alongside GUEST_VPCI_ECAM_{BASE,SIZE}?
>>=20
>> I will move that in the next version to xen/pci.h and rename itMMCFG_REG=
_OFFSET.
>> Would that be ok ?
>=20
> That would be okay and make sense when put next to MMCFG_BDF(), but
> it would not address my comment: That still wouldn't be the public
> interface. Otoh you only mimic hardware behavior, so perhaps the
> splitting of the address isn't as relevant to put there as would be
> GUEST_VPCI_ECAM_{BASE,SIZE}.

Ok now I get what you wanted.

You would actually like both MMCFG_BDF and MMCFG_REG_OFFSET to
be moved to arch-arm.h.

Then I am not quite sure to follow why.
Those are not macros coming out of a way we have to define this but from
how it works in standard PCI.
The base and size are needed to know where the PCI bus will be.

So why should those be needed in public headers ?

>=20
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -766,6 +766,24 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>    else
>>>>        iommu_enable_device(pdev);
>>>=20
>>> Please note the context above; ...
>>>=20
>>>> +#ifdef CONFIG_ARM
>>>> +    /*
>>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci ha=
ndler when
>>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>>>> +     */
>>>> +    ret =3D vpci_add_handlers(pdev);
>>>> +    if ( ret )
>>>> +    {
>>>> +        printk(XENLOG_ERR "setup of vPCI failed: %d\n", ret);
>>>> +        pci_cleanup_msi(pdev);
>>>> +        ret =3D iommu_remove_device(pdev);
>>>> +        if ( pdev->domain )
>>>> +            list_del(&pdev->domain_list);
>>>> +        free_pdev(pseg, pdev);
>>>=20
>>> ... you unconditionally undo the if() part of the earlier conditional;
>>> is there any guarantee that the other path can't ever be taken, now
>>> and forever? If it can't be taken now (which I think is the case as
>>> long as Dom0 wouldn't report the same device twice), then at least some
>>> precaution wants taking. Maybe moving your addition into that if()
>>> could be an option.
>>>=20
>>> Furthermore I continue to wonder whether this ordering is indeed
>>> preferable over doing software setup before hardware arrangements. This
>>> would address the above issue as well as long as vpci_add_handlers() is
>>> idempotent. And it would likely simplify error cleanup.
>>=20
>> I agree with you so I will move this code block before iommu part.
>>=20
>> But digging deeper into this, I would have 2 questions:
>>=20
>> - msi_cleanup was done there after a request from Stefano, but is not
>> done in case or iommu error, is there an issue to solve here ?
>=20
> Maybe, but I'm not sure. This very much depends on what a domain
> could in principle do with a partly set-up device. Plus let's
> not forget that we're talking of only Dom0 here (for now at least,
> i.e. not considering the dom0less case).
>=20
> But I'd also like to further defer to Stefano.

Ok, I must admit I do not really see at that stage why doing an MSI cleanup
could be needed so I will wait for Stefano to know if I need to keep this w=
hen
moving the block up (at the end it is theoretical right now as this is empt=
y).

>=20
>> Same could also go for the free_pdev ?
>=20
> I think it's wrong to free_pdev() here. We want to internally keep
> record of the device, even if the device ends up unusable. The only
> place where free_pdev() ought to be called is imo pci_remove_device().

Ok.

>=20
>> - cleanup code was exactly the same as pci_remove_device code.
>> Should the question about the path also be checked there ?
>=20
> I'm sorry, but I'm afraid I don't see what "the path" refers to
> here. You can't mean the conditional in pci_add_device() selecting
> between iommu_add_device() and iommu_enable_device(), as "remove"
> can only mean "remove", never "disable".

I will try to explain: when we just enable we do not add an entry in the li=
st but
we still remove an entry from the list every time (as the condition becomes
always true because pdev->domain is at the end always set)

Regards
Bertrand

>=20
> Jan
>=20


