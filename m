Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597C42EE72
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:09:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210133.366875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK9V-0004NQ-T4; Fri, 15 Oct 2021 10:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210133.366875; Fri, 15 Oct 2021 10:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbK9V-0004L0-PT; Fri, 15 Oct 2021 10:09:25 +0000
Received: by outflank-mailman (input) for mailman id 210133;
 Fri, 15 Oct 2021 10:09:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbK9V-0004He-1h
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:09:25 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33ba2ead-6df8-497a-b42c-527ce4b91460;
 Fri, 15 Oct 2021 10:09:24 +0000 (UTC)
Received: from DU2PR04CA0181.eurprd04.prod.outlook.com (2603:10a6:10:28d::6)
 by AM5PR0801MB2002.eurprd08.prod.outlook.com (2603:10a6:203:49::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 10:09:21 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::24) by DU2PR04CA0181.outlook.office365.com
 (2603:10a6:10:28d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Fri, 15 Oct 2021 10:09:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 10:09:21 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Fri, 15 Oct 2021 10:09:21 +0000
Received: from 54aa9056040b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A323C787-AF16-4B27-BEF8-E968EDEF0AB4.1; 
 Fri, 15 Oct 2021 10:09:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 54aa9056040b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 10:09:13 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR08MB2677.eurprd08.prod.outlook.com (2603:10a6:6:1c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 10:09:11 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 10:09:11 +0000
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
X-Inumbo-ID: 33ba2ead-6df8-497a-b42c-527ce4b91460
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ennNuK/Wq7Q2ZVgzWxwtNJOmEZblBDQgnZ0q1aBiXyg=;
 b=crTVwVoLXdnLJSf+oBYdsosMPytDBdFLq7FLWfHXWy4E8MbDqqLuTgt7UHajeO8SWUaGQvEYQiZpWq46v2TPdHkxWPikCl8IgTE0WuDc+s9ncU2zE9logiAE2hUc8Tj2E+g+2eEH35sC0SigJGcmcfSY1Baia6rLTzsNxUihn+E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cb11f23102aaab6d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DA0OpZu35m3ns0UOdCCQy7/TmGF6YPxSUX7A8BPKa7BDgUFJepgLNTaPZrj7K++/DnmC3l0MFurXxr/lEs5bWATwGFQwORUxiIpXVoaH/EMV27Lx85kGkUlahsdUeSyGSvbs/ISAtl+1Axl48eq0G4wIEhGVN1YSHgKqf1hDah12EhAMTz0iTbOi1adddhMNk9gRzTcdAhp438punmXetcjwgbO/kXbuw5A+hYgjwisi6DPNGEZjR4Q9U9al2Doe3tVFjZb44qQQ4ie9JLHOs3LuX/vPXQop/d55D2PDaOxQAGSfEA6W0vyfNb5IRgcty8jq181iU1tu6smqgviWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ennNuK/Wq7Q2ZVgzWxwtNJOmEZblBDQgnZ0q1aBiXyg=;
 b=iCdPvYwqiRd18E2TkPMnqbaZ9cHhaYsSmK42dBRHgiC18q9+HtYP1FyDJxDACNiXMyL2S9ZR459BWBScvzdIKS1QHh70i6AwGZ6VBOq6UAdhyvzzPympfM4oZ3G8VQodbcJ3T3sFtvEbGHaDQOhs9GDFPSyG4G0J9WLBGYFsE9D2Fztmw0h4rQAz5Q0CqTQYTP1Btg8onYlkm78sZ7vF/CS/btdjI1w3Qe1z7A9drZRV0FoKFTc93szEUb/7Z/Uv0hqFHAs5/EdqmacljCr9GL/HEO22HaN3xEHxvaKHsLTNRRM766B3T0gr//daY26xJ0FA7jZi/XoQbc+OvfhkSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ennNuK/Wq7Q2ZVgzWxwtNJOmEZblBDQgnZ0q1aBiXyg=;
 b=crTVwVoLXdnLJSf+oBYdsosMPytDBdFLq7FLWfHXWy4E8MbDqqLuTgt7UHajeO8SWUaGQvEYQiZpWq46v2TPdHkxWPikCl8IgTE0WuDc+s9ncU2zE9logiAE2hUc8Tj2E+g+2eEH35sC0SigJGcmcfSY1Baia6rLTzsNxUihn+E=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"iwj@xenproject.org" <iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXwQrjS6mPrKT7Q06z3N66FcsDAKvTs1WAgAAj+QA=
Date: Fri, 15 Oct 2021 10:09:11 +0000
Message-ID: <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
In-Reply-To: <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 34ace1d2-8d42-4031-83b7-08d98fc3db54
x-ms-traffictypediagnostic: DB6PR08MB2677:|AM5PR0801MB2002:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB20023564B319AC67C5B995709DB99@AM5PR0801MB2002.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 smCvQEaEV0ttsD2NcTDYfv3pnlAUbtvpKbLGkdPfKXx2IhCqP0Yl6DP7t1ytYd9UPf5kDsl/p2WNaY8NOX0hF1LoRoJN5PIzXBwCF2g2D5UBVjs8doCt0zs10sjXEG33ZUO3nTWzXyd9EcH/5Txf6cz4Q3VRm9DhGYwb4zbFpn+dAda5ZzROnISFbuLhcKyf0vWSoT4PSrydGq6P6+ehzO7JxL+cvFZGI9KyH6xNimo49IX6pprvzM1m8bpQRJ56lGM985GRseRRApmCfnCgq1yILo6e1+V9V57AR5N5HGn7moCQCVP52eF4M+N7ZPcCwia+zfAorQapfzyYV4U4rwOZIkPfzRum8GR/Y7jgRuEpXaSfY0S4EmcTxXZkG2vKhEpgjGNCEax97oC6YHxZYqXEF6/2gUVWGZWlicTu1HYhW6hoCHzF+NS33CdAm0heCvKrblr2bcoE9IFl4tJ2fU2kbI1WD/L8k0cCFwoQRkzFXE196eLOUFPCwORCskH5jvOgw/1+MViMCvk0szayLpoe4zEIDWVQfbvSJPIJRcS+qIG31dWJshgpnRjIlG34UBspAq0dsjIBHGu+vKNkDqMz7Q3hZRIVKkzftr79whVcrw5d8AyDhlaakNAy7yYqwMdqtCJg/G6udcSgTxXZOvFd8n5soaJnAeZE4umuYEoXVEEAy3v838QAiS3zP9MZArdr5sHrP6nIQuf9DwxUDe002K/cT3Hz5wmAi/Mn8Vo9u6i2t4xfM/NQZ3j7EUAP
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(8676002)(53546011)(508600001)(2616005)(4326008)(33656002)(71200400001)(83380400001)(6506007)(54906003)(36756003)(6512007)(186003)(66446008)(64756008)(66946007)(66556008)(66476007)(38070700005)(8936002)(7416002)(6916009)(76116006)(6486002)(86362001)(2906002)(5660300002)(38100700002)(91956017)(26005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <75F9127404561B49A51A22E81F49C6D0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2677
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2f54eca4-191d-418a-2582-08d98fc3d586
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VqQMfVygePHw+2Ys9489TySsaXcY4QNHdTn/QCtOA1PT3x8Hx7HQQ9ll3gJttOQ8FpKwWEHxllrOWyiJp1noTkJz4kIVNc5nlmh7CYRRRLLEkKRNrSJsL+YFoQPAaeQm90ZKZqFc9mQRpgqhKMMi0Yxl3Um9SrCjRvLvh4TqmMLqH8ikMIEoDa19+hgrI8KqdPDltQmLeWggiOhsCPKysx6sGVVwnHXBeh/n7UF+srxAdCXwZffHl/vttymz6CMnZ4KDlZegT+K+goE/Xns7G8sQq9PLYz5OUl4R52zMLHNBlCJY92qbg7ertJF67uDT4LWqEA/+j77g58K98RuYu3us1bs55HD/cw14+jfnY21yx1VlSL9VIPDMkNXdH7dWYVhoBFS7wjO34+Hmo5L3yUp1CUzEtsU+yJ0WBzzbGzkO5afpTgxTtH9Y3/CSVr9rakYENH0qUc9nA7f+RW2pia7XJLKYF7NovCirKwr2Lni1mjgXiMwtULqUp/BSE8na4JeMM9TAo+H+UJTUKme+CTTwDcJMCdA10l/wvmX2dtxvY1bH4YMJf06pCQheZG8ZiKHXwKBTYVhwFuLyGu1jD7jz70simpL2wNf82M3zXTB2gxQIQucviQAt3ZQBS11k/IbRZAoe/jM5vM1Woh3JIjc7qsp/GPyOHdxMow2v2Hgl3LxtqDA6q0paArZtM+OwdYl4ku1Gp79PxqNQ/xA1Bg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(33656002)(186003)(6862004)(6486002)(336012)(316002)(54906003)(4326008)(2906002)(83380400001)(26005)(70206006)(5660300002)(70586007)(36756003)(2616005)(8676002)(82310400003)(8936002)(356005)(6506007)(81166007)(508600001)(53546011)(6512007)(36860700001)(47076005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:09:21.0699
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ace1d2-8d42-4031-83b7-08d98fc3db54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2002

Hi Jan,

> On 15 Oct 2021, at 09:00, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 14.10.2021 16:49, Bertrand Marquis wrote:
>> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>=20
>>     check_pdev(pdev);
>>=20
>> +#ifdef CONFIG_ARM
>> +    /*
>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci hand=
ler when
>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>> +     */
>> +    ret =3D vpci_add_handlers(pdev);
>> +    if ( ret )
>> +    {
>> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>> +        goto out;
>> +    }
>> +#endif
>> +
>>     ret =3D 0;
>>     if ( !pdev->domain )
>=20
> Elsewhere I did point out that you need to be careful wrt pdev->domain
> being NULL. As the code in context clearly documents, you're now
> adding handlers before that field was set. In comments to a prior
> version I did already suggest to consider placing the new code inside
> the if() in question (albeit at the time this was mainly to make clear
> that error cleanup may not fiddle with things not put in place by the
> iommu_enable_device() alternative path). This would have the further
> benefit of making is crystal clear that here only handlers for Dom0
> would get put in place (and hence their installing for DomU-s would
> need to be looked for elsewhere).

I asked Oleksandr for confirmation here but on arm there will be 2 other us=
e cases:
- PCI own by a DomD so device enumeration done from there
- dom0less with devices detection done inside Xen

>=20
>> @@ -784,6 +797,9 @@ out:
>>                    &PCI_SBDF(seg, bus, slot, func));
>>         }
>>     }
>> +    else if ( pdev )
>> +        pci_cleanup_msi(pdev);
>=20
> Have you thoroughly checked that this call is benign on x86? There's
> no wording to that effect in the description afaics, and I can't
> easily convince myself that it would be correct when the
> iommu_enable_device() path was taken. (I'm also not going to
> exclude that it should have been there even prior to your work,
> albeit then adding this would want to be a separate bugfix patch.)

This was not in the original serie and requested by Stefano. I must admit
I am not completely sure on the details here so I am really ok to remove th=
is
but this would go against what was requested on the previous versions (4 an=
d 5).

>=20
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -374,7 +374,8 @@ static void bar_write(const struct pci_dev *pdev, un=
signed int reg,
>>         if ( val !=3D (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>>             gprintk(XENLOG_WARNING,
>>                     "%pp: ignored BAR %lu write with memory decoding ena=
bled\n",
>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>> +                    &pdev->sbdf,
>> +                    (unsigned long)(bar - pdev->vpci->header.bars + hi)=
);
>=20
> This looks like an entirely unrelated change which I'm afraid I don't
> even understand why it needs making. The description says this is for
> Arm32, but it remains unclear what the compilation error would have
> been. My best guess is that perhaps you really mean to change the
> format specifier to %zu (really this should be %td, but our vsprintf()
> doesn't support 't' for whatever reason).

Compilation error is about an invalid %lu print for an unsigned int value
when compiled for arm32.

I will use zu instead in the next version and remove the cast.

>=20
> Please recall that we try to avoid casts where possible.

Sure I will.

>=20
>> --- a/xen/drivers/vpci/vpci.c
>> +++ b/xen/drivers/vpci/vpci.c
>> @@ -507,7 +507,7 @@ int vpci_ecam_mmio_write(pci_sbdf_t sbdf, unsigned i=
nt reg, unsigned int len,
>>=20
>>     vpci_write(sbdf, reg, min(4u, len), data);
>>     if ( len =3D=3D 8 )
>> -        vpci_write(sbdf, reg + 4, 4, data >> 32);
>> +        vpci_write(sbdf, reg + 4, 4, (uint64_t)data >> 32);
>=20
> I assume  the need for this change will go away with the use of
> CONFIG_64BIT in the earlier patch.

Yes

>=20
>> --- a/xen/include/xen/pci.h
>> +++ b/xen/include/xen/pci.h
>> @@ -40,6 +40,9 @@
>> #define PCI_SBDF3(s,b,df) \
>>     ((pci_sbdf_t){ .sbdf =3D (((s) & 0xffff) << 16) | PCI_BDF2(b, df) })
>>=20
>> +#define ECAM_BDF(addr)         ( ((addr) & 0x0ffff000) >> 12)
>> +#define ECAM_REG_OFFSET(addr)  ((addr) & 0x00000fff)
>=20
> The latter is fine to be put here (i.e. FTAOD I'm fine with it
> staying here). For the former I even question its original placement
> in asm-x86/pci.h: It's not generally correct as per the PCI spec, as
> the bus portion of the address can be anywhere from 1 to 8 bits. And
> in fact there is a reason why this macro was/is used in only a
> single place, but not e.g. in x86'es handling of physical MCFG. It
> is merely an implementation choice in vPCI that the entire segment 0
> has a linear address range covering all 256 buses. Hence I think
> this wants to move to xen/vpci.h and then perhaps also be named
> VPCI_ECAM_BDF().

On previous version it was request to renamed this to ECAM and agreed
to put is here. Now you want me to rename it to VPCI and move it again.
I would like to have a confirmation that this is ok and the final move if p=
ossible.

@Roger can you confirm this is what is wanted ?

Also if I have to do this I will do the same for REG_OFFSET of course.


>=20
> Also, as already pointed out on a much earlier version, while the
> blank following the opening parenthesis was warranted in
> asm-x86/pci.h for alignment reasons, it is no longer warranted here.
> It was certainly gone in v4 and v5.

Yes my mistake during the process I did a copy and paste from the original
one and did not modify. I will fix that.

>=20
> And one final nit: I don't think we commonly use full stops in patch
> titles. (Personally I therefore also think titles shouldn't start
> with a capital letter, but I know others think differently.)

Ok I will fix the patch name.

Cheers
Bertrand

>=20
> Jan
>=20


