Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A9E42F4D7
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 16:08:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210676.367644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNsC-0006KF-Ic; Fri, 15 Oct 2021 14:07:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210676.367644; Fri, 15 Oct 2021 14:07:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNsC-0006I3-FV; Fri, 15 Oct 2021 14:07:48 +0000
Received: by outflank-mailman (input) for mailman id 210676;
 Fri, 15 Oct 2021 14:07:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWEc=PD=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mbNlT-00020z-9S
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 14:00:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1b::624])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a07e0c3-9b87-4de3-b537-013db65077d6;
 Fri, 15 Oct 2021 14:00:47 +0000 (UTC)
Received: from DB6P191CA0022.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::32) by
 DB9PR08MB7115.eurprd08.prod.outlook.com (2603:10a6:10:2c8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Fri, 15 Oct 2021 14:00:43 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::63) by DB6P191CA0022.outlook.office365.com
 (2603:10a6:6:28::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Fri, 15 Oct 2021 14:00:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 14:00:43 +0000
Received: ("Tessian outbound f1898412aff1:v103");
 Fri, 15 Oct 2021 14:00:43 +0000
Received: from 646f281e39fb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9A46B6CC-C3C3-49B3-A354-15CE6714070C.1; 
 Fri, 15 Oct 2021 14:00:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 646f281e39fb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 14:00:32 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB4892.eurprd08.prod.outlook.com (2603:10a6:101:24::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 14:00:29 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 14:00:29 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:a6::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16 via Frontend Transport; Fri, 15 Oct 2021 14:00:28 +0000
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
X-Inumbo-ID: 9a07e0c3-9b87-4de3-b537-013db65077d6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoPwl1Fpwipzy4xVQrWJajg9fFL6J9cj58tmr0JHQnM=;
 b=UauxhzbZRPXD9SyRk7xcJPpjf58cJiGNOE2j7mX5slqH84YC48vpujp8g2WucwbVQbpim40+E6XGeq4cqpu+E0uSNXsAZ5t+JhzWvq/GqcVdScYcxlrfAWmtYaGYFNcsZAXYv4njn+VYkEgOFToi8Ea9fa4oM5wYJ6scxjcLDx0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 276e0a3b289fe71b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTytjeNInz7DhJg7usOmdiOqRA5rttB3DYOBXk2T3ePhXhYr/BTsr3/3pjjxL9vYSceX9rKgTkZHTQ0nLcNLJ+kaDt4DB0y/M+qoTqZjjo/TsboZP3Oc72KzDjzGhu70bHoT/MkgciPdkmf+FwxvrzWX+3va+WuwrbcyUAtQ1ItYTmoh3pkbMOXAiv5Rt/wbeOhrFIeq/YXhFGs6cNpYYjqY9O113s7QkUCjF4WpV6gC5mIQlfdGXyyDhcFNIuMapfmMqkhbg8TinQaelXhkPvfJTw0cnUleFomLrifLOsLUMgtJDM3HNOF02eH1fP+un0K59zaYlAVSdnmyjvgi8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoPwl1Fpwipzy4xVQrWJajg9fFL6J9cj58tmr0JHQnM=;
 b=TYcvH6qOP91UJpPPpvyGciYVeA9IMzkr/CpY8mCW+p5pyeFmt1oX5HS37uxwFdL04bEsMsCNKUN0ZTnro3ugCtPmQvSQv8xTZ9WB4Z5Fpj/BVKitVQHYEM4OWH3VrCb+O+jQ9DQfYC3eoxl2fD6Mxms8sS6dd8SSrJinDZUwRc71/zuk3/hM275lYHY3qJLblPMSN4W025pfm/QCGhJdQlC6HgImsipjq8KKmDBvYvMiZM5PvcGznybuFtkLwdrKFiaz6NCaLV9UZzZwjhOeLtZvUH508kIYqK0EN5B8wnJphJiVNXy+w5YcIbJAae4DWGoqbMRQF9YnXS3scoM2ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoPwl1Fpwipzy4xVQrWJajg9fFL6J9cj58tmr0JHQnM=;
 b=UauxhzbZRPXD9SyRk7xcJPpjf58cJiGNOE2j7mX5slqH84YC48vpujp8g2WucwbVQbpim40+E6XGeq4cqpu+E0uSNXsAZ5t+JhzWvq/GqcVdScYcxlrfAWmtYaGYFNcsZAXYv4njn+VYkEgOFToi8Ea9fa4oM5wYJ6scxjcLDx0=
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <YWmGbzPdCxmwfdIX@MacBook-Air-de-Roger.local>
Date: Fri, 15 Oct 2021 15:00:21 +0100
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <90FEC0F8-A5CA-4B7F-8E94-38223FE3F6D2@arm.com>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
 <1c298c02-5791-8935-f996-516da2409f24@suse.com>
 <BFC005A8-4C72-41C5-93F4-98BB9CBAB198@arm.com>
 <cd81cc31-617c-c750-01f4-b02bcb9e3a9e@suse.com>
 <B57498FA-F205-4DC1-ACE0-414558400293@arm.com>
 <YWmGbzPdCxmwfdIX@MacBook-Air-de-Roger.local>
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::33) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65a440e5-8d5f-4883-0567-08d98fe42df8
X-MS-TrafficTypeDiagnostic: PR2PR08MB4892:|DB9PR08MB7115:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB71151FF5012A6A6625EE769EE4B99@DB9PR08MB7115.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 US716nvkSayxs1Y0mxuDgxUOmEn3NhYR2TEKKpdrP69ODspq5469ttfi9elJUX2gq+fZCmantjtfiapVtxbfk9ZTOCUnhGOWx45b5ZvvoWh1v17yBDyaxv+2MWc/f/5QS3YXvfnKNFiNwixseHuhgxCl5bWcSRgo6ZAG8bzyzH2RSzcf9wpFuVmUJ6LmKjenTBvfza3c5ajEK67LPNDBCe0liAhfFSdDCENMbDHZeWgvX5IRL2/1afji1v4Nr/KJvlsQWw6x0M9kWnnHYrcUcRs1EQZZjdeZcTxhnfWA/mZK76eJlO5uyc1e22t6SkKFktBfhYbwJobkkPLEbkaDts1a1hB/w9fH0+vsZyBSAKOehQOkhrmywNurykEQ2a97J3B+PkE+kjASa8Uj84xANgooc7EDQYP+VULvcNwvJNlIU4iaPf0DofdM3zmYwimGHknVthiVeVWwkI6nqQGwpfBrbkkPXnTsDexfuugFrI4YLKa0rQu/rn8ICjQf897gXqcRCURN8WSlmo8vavyMpchKHkvoObQR4fNb6sBVVW+xtCVhCEz8FU0YbfhepL85Yh6kLA0DUBbN8Bo9AWsqyDSBATSMoC6Ih9gCQKYk83iQUQagw9Zq/6LReBjkZbr65F3KJR2NVO++4UEcSUgUbfM/pTBUZ3hBcJ394lJcn1rGt0y/n2Beb2x7Q5At0g7Fy+0PumJnnYUPdd8Yx5VBQCl5Ftpk0jEGKfwk51XHjx8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(54906003)(6486002)(6506007)(8936002)(86362001)(52116002)(7416002)(8676002)(4326008)(508600001)(316002)(26005)(6916009)(36756003)(6512007)(83380400001)(186003)(5660300002)(6666004)(66476007)(2906002)(66556008)(33656002)(38350700002)(66946007)(38100700002)(44832011)(956004)(2616005)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4892
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2bcac0b-9dc2-4422-07f0-08d98fe4250d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0vmlJasXEIlIP1YmFhgjIYBwlFDDMir3eL3Yu1VidER/It9WBuwmb6ZnVzqSh/Yxc5t2frmrpj2dGLplbrYFIR1NAfVrDxRsHLNV6Fe3s09vP6aX9hZCClpi6G08whUJruKAh2qrGC9PBdgy3OVD8iedYoR2nG14zfW0/3iH89vVcuPGcNVUTk3IwvQI4t88g8HcA1ItO5Qw6A+N9NICtum+elrWrl8Eqv0MF1m4GjliWEd96rKTn2ELv6+KcYyn+spKAPgONUoS5o6x5imxyJXbAe7D20hlQSS4PghMGmgM9zI1mRbcI536se8z0j2zwNsYiRSO2BDTAx7LO+9tq5cn/evebOZmMM0m3FzAjYKDrXr+ZUaQp5odnjLOaWc8Iyp5TIK9KM2CFjh1FM4GZ46BVG4V7XFSToxdpygTUXKEOlFYJ47fBrah2J5brpKO8DVvpyKtwBHdLCUyu85DWUZyAiI2W71ZvHW5dGxKjuAOK8BKmcYEfCsuiixfViHHgzbLXt/3vt7aerIToe0vcSj5fMB2HZFv/7S4+agOtjtSzZO/v5LfWfOHN7e3ocXrVgzp17Nx4VdsjAhrkLJgtPdVm/pjuNDE0QWfIF0miqlclGylt4FhXs42okouhqZ6Z5HwuBAMle9k9etVp8aEMlgGDAKvPLuWzjQio94sF/uKnth7n5y4yfP5rK8BPZwnW2cwIQhx9cZaR8sOAB7H4g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(4326008)(6486002)(6666004)(81166007)(186003)(36756003)(70206006)(6512007)(6862004)(107886003)(356005)(336012)(70586007)(86362001)(2616005)(26005)(44832011)(2906002)(5660300002)(956004)(8676002)(53546011)(8936002)(54906003)(33656002)(47076005)(508600001)(316002)(6506007)(82310400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 14:00:43.6100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a440e5-8d5f-4883-0567-08d98fe42df8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7115



> On 15 Oct 2021, at 14:47, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wro=
te:
>=20
> On Fri, Oct 15, 2021 at 10:48:41AM +0000, Bertrand Marquis wrote:
>> Hi Jan,
>>=20
>>> On 15 Oct 2021, at 11:41, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 15.10.2021 12:33, Bertrand Marquis wrote:
>>>>> On 15 Oct 2021, at 11:24, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 15.10.2021 11:52, Bertrand Marquis wrote:
>>>>>>> On 15 Oct 2021, at 09:32, Roger Pau Monn=C3=A9 <roger.pau@citrix.co=
m> wrote:
>>>>>>> On Thu, Oct 14, 2021 at 03:49:50PM +0100, Bertrand Marquis wrote:
>>>>>>>> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>>>>>=20
>>>>>>>>  check_pdev(pdev);
>>>>>>>>=20
>>>>>>>> +#ifdef CONFIG_ARM
>>>>>>>> +    /*
>>>>>>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpc=
i handler when
>>>>>>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>>>>>>>> +     */
>>>>>>>> +    ret =3D vpci_add_handlers(pdev);
>>>>>>>> +    if ( ret )
>>>>>>>> +    {
>>>>>>>> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
>>>>>>>> +        goto out;
>>>>>>>> +    }
>>>>>>>> +#endif
>>>>>>>=20
>>>>>>> I think vpci_add_handlers should be called after checking that
>>>>>>> pdev->domain is !=3D NULL, so I would move this chunk a bit below.
>>>>>>=20
>>>>>> On arm this would prevent the dom0less use case or to have the PCI
>>>>>> bus enumerated from an other domain.
>>>>>> @oleksandr: can you comment on this one, you might have a better
>>>>>> answer than me on this ?
>>>>>=20
>>>>> Well, without Xen doing the enumeration, some other entity would need
>>>>> to do so, including the reporting to Xen. Obviously without a Dom0 it
>>>>> would be ambiguous which domain to assign the device to; perhaps it
>>>>> should be the caller in this case? That would make that caller domain
>>>>> a pseudo-hwdom though, as far as PCI is concerned, which may not be
>>>>> desirable according to my (limited) understanding of dom0less.
>>>>=20
>>>> This is not really related to this patch but the plan is the following=
:
>>>> - enumeration would have to be done by the firmware or boot loader bef=
ore
>>>> - xen will have some code to detect PCI devices
>>>> - dom0less can be used to assign PCI devices to guest
>>>>=20
>>>> Anyway does not change the fact that this must be called when domain i=
s
>>>> not NULL and I will fix that.
>>>=20
>>> Since we now all seem to agree that the NULL would have been a problem,
>>> may I ask in how far any of this has actually been tested?
>>=20
>> With the whole serie currently on gitlab we have extensively tested pass=
ing
>> through PCI devices on Arm in several configuration (number of device, M=
SI,
>> MSI-X) and check that PCI was still functional on x86.
>>=20
>> With the patches pushed to Xen right now it was checked that:
>> - xen compiles properly on arm32, arm64 and x86
>> - xen compiles properly with VPCI activated (using a patch) on arm32 and=
 arm64
>> - xen on x86 is functionnal (using basic test on QEMU)
>> - xen on arm64 is functionnal (with some extensive tests on different ta=
rgets)
>=20
> I thinks it's unlikely, but since I haven't checked myself, could you
> see if the vpci user-space test harness (tools/tests/vpci) still
> builds and functions properly?

Hi Roger,

Bertrand is going to send the v7, however I=E2=80=99m keen to do this test =
but unfortunately
I=E2=80=99ve never used it before and I don=E2=80=99t have an x86 environme=
nt, do you have any
resource that I can read or some guidance?

Cheers,
Luca

>=20
> Thanks, Roger.
>=20


