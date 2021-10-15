Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ADE42F6C6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210808.367809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOud-0004jn-Ll; Fri, 15 Oct 2021 15:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210808.367809; Fri, 15 Oct 2021 15:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOud-0004hW-Il; Fri, 15 Oct 2021 15:14:23 +0000
Received: by outflank-mailman (input) for mailman id 210808;
 Fri, 15 Oct 2021 15:14:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbOuc-0004hQ-55
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:14:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::621])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8fd49e19-2950-4055-9c5a-6574bc69148f;
 Fri, 15 Oct 2021 15:14:20 +0000 (UTC)
Received: from AS8PR04CA0089.eurprd04.prod.outlook.com (2603:10a6:20b:313::34)
 by AM0PR08MB3217.eurprd08.prod.outlook.com (2603:10a6:208:5e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Fri, 15 Oct
 2021 15:14:15 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::c1) by AS8PR04CA0089.outlook.office365.com
 (2603:10a6:20b:313::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Fri, 15 Oct 2021 15:14:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 15:14:15 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Fri, 15 Oct 2021 15:14:15 +0000
Received: from ddf242b6634c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 508684CD-8537-4992-892B-4297CCA8CF12.1; 
 Fri, 15 Oct 2021 15:14:08 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddf242b6634c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 15:14:08 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB9PR08MB6714.eurprd08.prod.outlook.com (2603:10a6:10:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 15:14:05 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 15:14:04 +0000
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
X-Inumbo-ID: 8fd49e19-2950-4055-9c5a-6574bc69148f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yf2VFPezLaqTJAgzasJxu6h/fBw8U0G5tjKhMyiq014=;
 b=TO1DQQy/nsx99IZBMCGotOREDLSygxVH3lVrI7OpSKLFz3fcJPtHcjUWjLUbZaMoDzHxrqOR6eFCOLM0hhzeujGEJu5vEhGSfAB+t/UvPYxzkWFc4TBiD51cfpD6SktuYHcAwsc80LmNlJ137Yq7BlUYa2bybzb2HUQp6Jof5+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: aae02257d0f47096
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrqS19EdtTFajPFsBLzFmeAZn5Dz1viBUA3nwDmpqD7UHaHAnFHoiBXS0d2xPa6co7J/VS+g3V79zg6t4DPtvhOoqxvvqjQl0Z0GXZMH1DMWoIkcq4gBFCdPariMTk4ElI+BK4Jaj7962vvgWEd/TI0tIxYa9I/9+i3MaqsXV3Zmgg/guMv/NCXaepaoROVvw7oz7MUssFYwT4n0vFZ/NnnCtR8t0gJn74Kjo44zyBX6dfZrAKe7k4kix26+xmXhiqHiTkEuG9HNR/1A8C9p4lpUswdpvOfAio/oWo3/7NR4/qD/Y+Gk5uVyZuodk52ejVpTOLDp8hLNmohcYpL19Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yf2VFPezLaqTJAgzasJxu6h/fBw8U0G5tjKhMyiq014=;
 b=E2Dsd5mufUXTaG7+SRbeh6yGuBU4Lf2R2Cyqc8/wSVe/dxe4E6VxBo+X4tUQFPmum4BQwHk+Zl2+vcqVzgUDWBDePjvQPRbeCUu+2NpHPazHqUb3nf9ECs8b/ypVdV01OWYcqyFhvvX1KXfZNBkzwT3Gt0jIWg0KoeZcBpZ27+VjHADwtSzB2FNLbQW2ZAFAoVIshCTmWts4AGRaQr9LxSI2sdSIHzLPtR122Nfg169naXucNGrFENNhQkEqiBDRk1bG3hbom6+FU9SO8Fwt4ieJ1/yMbgXW3BSlFs/UAJ+Pj/rowYLtsYP7jJff8lo31fNA73OnSIlHU2X+CVf87Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yf2VFPezLaqTJAgzasJxu6h/fBw8U0G5tjKhMyiq014=;
 b=TO1DQQy/nsx99IZBMCGotOREDLSygxVH3lVrI7OpSKLFz3fcJPtHcjUWjLUbZaMoDzHxrqOR6eFCOLM0hhzeujGEJu5vEhGSfAB+t/UvPYxzkWFc4TBiD51cfpD6SktuYHcAwsc80LmNlJ137Yq7BlUYa2bybzb2HUQp6Jof5+M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Topic: [PATCH v7 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
Thread-Index: AQHXwcz8unryLt1qUEeMdpd7xMjDNavUKeYAgAABFAA=
Date: Fri, 15 Oct 2021 15:14:04 +0000
Message-ID: <D471145B-813F-457C-BB81-23BE1FFACB93@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
 <847d430fdeb19e695176ddea71eeb11dcef8b23e.1634305870.git.bertrand.marquis@arm.com>
 <ec52b9e9-5908-7fd0-dfbf-31906eb8398d@xen.org>
In-Reply-To: <ec52b9e9-5908-7fd0-dfbf-31906eb8398d@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ba98799b-b9b1-406c-eaa9-08d98fee73b6
x-ms-traffictypediagnostic: DB9PR08MB6714:|AM0PR08MB3217:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB321750473B7603D9B3673BA19DB99@AM0PR08MB3217.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ox1YHyAKCORteb0Ns7EBD9TZD7K8c2eUCogHXDLtr1ScdMzwJiRH/ZtvV96BQdmNSyYMptj7vclebWtLwvaGf/XHpv/r2J5kQo5ZrKRUpcW3W3pH2b5yx8rmtMiIrEHGzEmdKsnjsSZJQkxh654dZKloEAIjcSaE0kUaHNCOekOBOmqBjAzpuDGD/ne+vbjCWe4wbQoPTt+59+1ULPcfpIoSM2BDiQgxbGzAYBjbCQA36HHgYtq4qX6vqbTzIx1pF+2rdVFwZPjMhY3xdALApG75JGcBRZ4leb59u23ZFmh2cqiRDZ2IQf4+uzrJiHkFCcG8Zc2yAPNlIwTE7TLebQYkKhkBkflUlershBP6UYZFeHHHEmhOU/1A6l1CW0OAtwfpSm9eXCPnRlqD0MwESnl5jkr8Glv8Tp1JtG3/KSf3uD96LmUagupaIf9OLITbDgOJvuBkYfpyMdAfFTCGCBvJMrdE0o9nmcjFt6M19MtZ2c0LJzoqr3Ee2bryWKEkPlfPlU8Vn+YePnq1HXwJMd9oK9H9v3+pqegB13UKvTnrhl9i9VZfVQ/OT+Zi9Ha5NkHoOlHaheOpmBhKiyhWcFigLWwS7UBedGyo/AzsHsH81cFvp3da+zcFjRBX3gowa9efzy4+EvA71X5pjonOmOSPVwF1ftTrqbIqmmZ7kJVdNGr7ICcsnTFD9/adFAijFywY0HGtvdar2aJcLE+Z+O6bAxtKrJNgOmKDnx+5bNaCi3Qpfwd1UXzr6UIMz/EG
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(8676002)(7416002)(6916009)(64756008)(66446008)(71200400001)(2616005)(66556008)(8936002)(66476007)(66946007)(91956017)(76116006)(6512007)(6486002)(186003)(2906002)(36756003)(33656002)(38070700005)(508600001)(122000001)(4326008)(53546011)(6506007)(38100700002)(86362001)(5660300002)(54906003)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <84E2D78D66D19541A847372643D678ED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6714
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea15857e-98f8-485f-44ed-08d98fee6d56
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W5SDbrd65SxH2OidZNEqsT7h+Yrt4S5Enk/tvxBjAUPlwRhTYAp7o6mxZPD4V0e8gOyvPUf1O+FtNyMoWaj+/+Cuqb2bSAYTUMnWK42az9zX0l5406kibxNLsUFWsN32QHxSPXM3Dn4c92LgbhiB1+93FZZI2X6ONssLBW1b8kR31WGnLHnZ5jJqBaWNMLh4tHRR7Q8Kimnf4F6j3mU0paUM9vjHiCOnmPHLCZa9HixKpQ7dHnTAYiEx5A8+fy73bBolh4khgvT6ywBwNbiVD0zEY20c/c3LXvYBxYUHpKdVYHhijzlFgXujAMGWSaPlmxCH1bTcy2U9NIseTnn3SG3+HJTLhQzd6ZeOmbB0F+t04v6YDMnlaoSrkzjoxx+3+j4r8ACRFJAeHlBcm+cy5+6eyo0StsNJGYcqZtAKJyVbsitlEuZtrFUT961oTSqE7LG/eDOaQVDp6DYs4TciyqJK2ooqHr4szvlhHo2Trp9Yy21CAywY5UvI+ayML3rXQRAxYxT30vijcNi6DBaMKHx16n2vKsyBtXLiJ5Oz26Fh9ksOQmoexJ6vndu+VmrMd2SFlHvbzFlraej3BMD/mu+JJ/0xK6tJg8Z9WMJ9F2ejgUJ5B+dq0oOMxeD2UAsRK3KgYiRpUZ8sjk3HINIPg9UKTOQNY5tuyxQ9QIH5CqUWbL8x5kuarhvfxRIrbl3GfdKBWCJrwRAi3RdZ9CEvwA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(53546011)(336012)(5660300002)(508600001)(8936002)(47076005)(81166007)(26005)(186003)(4326008)(82310400003)(6506007)(316002)(2906002)(6862004)(356005)(6486002)(70206006)(8676002)(54906003)(6512007)(36756003)(2616005)(33656002)(70586007)(36860700001)(107886003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 15:14:15.4908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba98799b-b9b1-406c-eaa9-08d98fee73b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3217

Hi,

> On 15 Oct 2021, at 16:10, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 15/10/2021 14:59, Bertrand Marquis wrote:
>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci=
.c
>> index 3aa8c3175f..082892c8a2 100644
>> --- a/xen/drivers/passthrough/pci.c
>> +++ b/xen/drivers/passthrough/pci.c
>> @@ -766,7 +766,21 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>          list_add(&pdev->domain_list, &hardware_domain->pdev_list);
>>      }
>>      else
>> +    {
>> +#ifdef CONFIG_ARM
>> +        /*
>> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci =
handler
>> +         * when Dom0 inform XEN to add the PCI devices in XEN.
>> +         */
>> +        ret =3D vpci_add_handlers(pdev);
>=20
> Sorry for only noticing it now. Looking at the last staging
> vpci_add_handlers() is annotated with __hwdom_init. On Arm, __hwdom_init =
means the function will disappear after boot.
>=20
> However, pci_add_device() can be called from a physdev op. So I think we =
would need to drop __hwdom_init. I can't seem to find this change in this s=
eries. Did I miss anything?

Good catch and not this is not in the serie.

Can we consider that a bug so that I can send a new patch or should I send =
a v8 ?

Cheers
Bertrand

>=20
> The rest of the changes LGTM.
>=20
> Cheers,
>=20
> --=20
> Julien Grall


