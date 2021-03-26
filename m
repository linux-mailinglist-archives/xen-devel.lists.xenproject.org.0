Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C0B34A633
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 12:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101704.194642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPkPc-0005ek-3l; Fri, 26 Mar 2021 11:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101704.194642; Fri, 26 Mar 2021 11:13:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPkPc-0005eL-0O; Fri, 26 Mar 2021 11:13:56 +0000
Received: by outflank-mailman (input) for mailman id 101704;
 Fri, 26 Mar 2021 11:13:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+7B=IY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lPkPa-0005eG-W1
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 11:13:55 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d1f0550-bd61-474e-94f7-04ed8bea9f20;
 Fri, 26 Mar 2021 11:13:53 +0000 (UTC)
Received: from DB6P18901CA0019.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::29)
 by AM8PR08MB5857.eurprd08.prod.outlook.com (2603:10a6:20b:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Fri, 26 Mar
 2021 11:13:51 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::8f) by DB6P18901CA0019.outlook.office365.com
 (2603:10a6:4:16::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Fri, 26 Mar 2021 11:13:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Fri, 26 Mar 2021 11:13:51 +0000
Received: ("Tessian outbound 7d88ebbbfeee:v89");
 Fri, 26 Mar 2021 11:13:51 +0000
Received: from c827c22ef2a0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 25ABC507-B923-497D-9986-428EEEF3259F.1; 
 Fri, 26 Mar 2021 11:13:44 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c827c22ef2a0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 26 Mar 2021 11:13:44 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR0801MB1855.eurprd08.prod.outlook.com (2603:10a6:800:59::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Fri, 26 Mar
 2021 11:13:42 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 11:13:42 +0000
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
X-Inumbo-ID: 5d1f0550-bd61-474e-94f7-04ed8bea9f20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuCaZ7gsXzEwZppptp7blhyz5WSWnO/47QN5rSTEGV4=;
 b=uH5F/dXa8ZoRTSQDYWvK65/dwXExttBiedyrXvSjXgPcZafqVlQsjemsTfUC6jGCgVLW1wFpIq8ZAqJBwYicuiSy0h4c1Sf+uszHCwys52Y6L3GDR0B/J4IEud/A1/pab6sQvIaKwtoDBmjSAyY/hfqLDyTJFcu9DwQ39hFICZA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80fcea024003efab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGC6zjXXKMipGr0Yi/eL3nv+61B9+6UPVpzpHwWNghOCFr6S8E/M2F0DuYi/1qybzMCNcWsL2Ci3FbwMmk/Ln6z9D4mUqKCCFC9rSUeKxZoAKLooFiteFLbUAJ1BCReZ/6EKdGQ/dEFi2L0yx8CWQpoqdOfcvcJ27WQu4+z45ZmaIqYkFgSIRCT1kov8KtH7ogft65i9AmL0Aq3g15IgOXdAFW8lq/VPZlwAKJFPRdBj8c8d4GftD1yhBAfmV1TUmn8J0LSWPiNu3KsMiY4PH2PtH7w6oUYbCYoE1ZjLfllKOxGTnyv/sOyR0aQSJ87Ulu7GlPILSa78EY9wlhLFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuCaZ7gsXzEwZppptp7blhyz5WSWnO/47QN5rSTEGV4=;
 b=C4wRT1rxMi4GQXMfXywrYk5MRunzMGn99iwWB9IOEcCrMyrcsmfrB5JOf6QgPfQqW1Vbq68nYDSsNy0koERh2Oyf4a5eicnmF98IhBelJBMVaRoqeccPbNlNNyasKmY09DbZ+6MSraTi/iyCXzBuhzm9OscknyB9iNlzQpCM+561Z6F0q9J7wJOydXJ97xr+OoRokCEsQuIDoIYrrTdmNgwTOpqNFEmP54IofIkJoTXhWB5J2SY3+4d92zfhTxc3nUIXEeYBy/Jjg+A8nzBbNeMbBD8+RH1XdoOv5OQKpVGmLCAKNULjP91GxIoXbyn3ZyDTeeFBVvQ75D0V7xTydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuCaZ7gsXzEwZppptp7blhyz5WSWnO/47QN5rSTEGV4=;
 b=uH5F/dXa8ZoRTSQDYWvK65/dwXExttBiedyrXvSjXgPcZafqVlQsjemsTfUC6jGCgVLW1wFpIq8ZAqJBwYicuiSy0h4c1Sf+uszHCwys52Y6L3GDR0B/J4IEud/A1/pab6sQvIaKwtoDBmjSAyY/hfqLDyTJFcu9DwQ39hFICZA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen.org security team
	<security@xen.org>
Subject: Re: [PATCH for-next v2 2/2] xen/arm64: Place a speculation barrier
 following an ret instruction
Thread-Topic: [PATCH for-next v2 2/2] xen/arm64: Place a speculation barrier
 following an ret instruction
Thread-Index: AQHXGCLUePNZXth41EOpDgjR62uDxqqISyAAgASaOICACUyKAA==
Date: Fri, 26 Mar 2021 11:13:42 +0000
Message-ID: <342BA51C-80BE-4393-997E-6C5830CB57A1@arm.com>
References: <20210313160611.18665-1-julien@xen.org>
 <20210313160611.18665-3-julien@xen.org>
 <C0FD2269-4D00-480A-94AC-61663E0C9E94@arm.com>
 <50175d48-6f0b-2d96-8ea9-33f4f65f920f@xen.org>
In-Reply-To: <50175d48-6f0b-2d96-8ea9-33f4f65f920f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 97b3818b-7036-419f-dac8-08d8f0483c43
x-ms-traffictypediagnostic: VI1PR0801MB1855:|AM8PR08MB5857:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5857D40B1D3BE184B30DF44D9D619@AM8PR08MB5857.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CW3pnr4TJVqJZ/DvNRwJRd/ZhfS3xJL6vmIvx2iflsbw0BHTBzbzaDqHEL9VOlnPynC5Yiz3QOv9z1F/N+SEb1aLfpoZM1TNpK7z3p9gXl81OJJJHcxZmD13s8FKcscjRGAFAc0hSO+pJ798nJhSOK1cXwsH3WI04M1mjT89v/vGkdcN51g7RcGnTwRMUbT5ycTJ25bcns+WMg7xhKMK/7MJsKPnSTR9f7kCVd3aGYhhHjMAhD0sPkfaSNzUDhsKxN/kolJT9jLBYrfVxD4kwR6EREi5Zgra/DV8Aq5boohPkI5UghVKE68HwVzaHP5bkAw5Z3ZPKwCp/2EwusR49Dp7hrLD/hgPOrEngSBxeFkSXnfXYWRkajKDJm++CoV0iA+vtxrJjmYeZAJZ99XcSovXr8CpwYaw3oErXRHTbMw0OFUx3S5h4ephyk4KV/4Be0Zmx6IdzePO2AlFRzsvZOtAfiiFi0wjeNJ1oTqFpqc6qsYx2jvB7KEeNWnoI4R/OtIIw+ysEaZVDZl/NKQ1fS7DkpWo/DzLnMjSeI6siDZtWmTqADteyABq7wqNVA7nnkhhqrZk6+VnLXQhoKrMfOPcMKjun6QP1DGS7tr7NCXuCm7mkqB9C69czOvTDtVxVyeu0XyDYvwreURsB9BGzSo+zSbfb8HJZXxayk8lubKVC825sNcbVZV3PIo5z08ckk4xzWaRxOAdrVOKeJDUto2+WalWww4QE8eJrOgb6S3hvejJl8Dmn5sveU8BX2SVOc7aPo5p/XVM5E+34IjIQw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39860400002)(136003)(396003)(346002)(2906002)(4326008)(6486002)(8676002)(71200400001)(6916009)(38100700001)(478600001)(966005)(6512007)(86362001)(8936002)(66476007)(66556008)(64756008)(33656002)(66446008)(26005)(66946007)(91956017)(83380400001)(36756003)(5660300002)(2616005)(6506007)(53546011)(55236004)(76116006)(54906003)(186003)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?RlAwVThoYllIZ2cwcWtYb3liZ3NGT0NDcUdocHJYU2pQUEYrK1dyMzZyZXoz?=
 =?utf-8?B?S0tlTzBjTHJ2cGhmVitWL3VtQmdRdWh0TGVpeXB1MWh3c0x4NXM4UzRvWTlU?=
 =?utf-8?B?blkxMEt1QUNNM0RQeGg4WUpkYUpjY2VKTFRyUUhxTGpaZS9VdjlYcmpQdHVm?=
 =?utf-8?B?a24zOHpRQmx3VHRMbG5yRDZreWNzWEJoWkltdlIrZjA2VzhRNnQzQmV0OG1i?=
 =?utf-8?B?VTJ5QWI2bXRMNksvS2VTb1A4Q1ZKbUlqQ0RPRFRqUzVrSjRCSWh0Rmx5bWpl?=
 =?utf-8?B?TnJ0UWw2NWZpRzNxcUFnK3ZNTXdHQ2ZNU0xtOWozODJsd0puZldCTzRaYkhS?=
 =?utf-8?B?ZklQWEJURnB5T1I2dDVTWjhlWUhYZTNRZE5ERnFKMU13b1BsRTNuMXEyOHhj?=
 =?utf-8?B?MkRUZ3F2bE5uNTJCWnFFZUdHeHZaemZLNFRuTU1mVDJWQy91YzRFUmpjUjRW?=
 =?utf-8?B?Q3VPV3g1SVI2VDh4aWQ2bFM2Z0RON1diajgxdjJHeHo3RlZqbFNQdTVMOHdI?=
 =?utf-8?B?QVd4M2I4YnVaWm9sYVlWZEhQdXNkTXdEM2FSdktNVktSQmM3eDg1TVVMeUp2?=
 =?utf-8?B?L1ZXZEpEeXBJUGlqVDlkQXFkR0RNYkFrSHdCd2kwVjJKSm5QYTQ2bEE0V0Zv?=
 =?utf-8?B?OCtKK0hOUlhlWDRwUHY1UlI0WGZBZUpjSjdPL1pTMnFtbTZGU055MmtLVEQr?=
 =?utf-8?B?bTJmQTYxVFlIdFZKSFYzOXRHbzZ0SzZUOWZ5WGVaVHBFT2kxbGRWZjRJYzhP?=
 =?utf-8?B?Q1Rac3hHS3BjcU1RVXhycmRkZlNGdCtMVmxpQ2pjbERnakxNbmovRzlUcHBq?=
 =?utf-8?B?azY5bno1VjAzSUQxN0RzdHI5ZjJjZW9JY241N3I1RmRqbXAyMUdNNEVkb1dD?=
 =?utf-8?B?RVpzUXpEeEJXQjFkbGZ5Ym4xbXZEazRZbUJrQ2prZ2VkRjExSmVCRXdmK0pM?=
 =?utf-8?B?UXZMMjcvRmdOQXZaNW9TNWpvcGpWZUhoSUhqeWMzZUkzbXVlbEk4N2Z0YTN1?=
 =?utf-8?B?V1IrNzRRa3BEVUJBREdxTTBzME83cGZmT0R1WmN1MWVhcFIvTW4venovNU5k?=
 =?utf-8?B?YVNEQVNFWjR6S1JwbS8vd2NQeEFuMWthbUVWSUpINHJuT2J1NUNia1VhbEg3?=
 =?utf-8?B?VGFwcVRoTnAzNm5RTXR1Uzd3dm43ZzJVS1lLTnV5Y2gwNTRPVGZrNlgrcFFB?=
 =?utf-8?B?ZEFscEV0dXVYVGVCU2RWQU1DdHA0ZmhicWRpSHI2UGhCa3RNTmVzOVJja2RH?=
 =?utf-8?B?SWhQU2t4ODZxcGhscXBMNGpNQjJNb2I5MVJOL3FZUWhIcnNnQlBGdEViNlVV?=
 =?utf-8?B?NjhuVGlmeFJ3c3A2d01TSGR2VGc0TldzOS95RHlpekxpdlpKdDF6amFHdXRH?=
 =?utf-8?B?WjlaVEcrNU5VOXpDTWhDdEtPZFd6MXVzQXZMaWN3dWlDMmFSbk93bk1QWG9u?=
 =?utf-8?B?TTR6YXVOQ0pmaTNhb2w0c1J3T3ZEa2xPbFBUM2ZvQjJhd2pNcGE5SzMyT1lT?=
 =?utf-8?B?L2NsUWswT0poLzhPWTdvaHpJN3JNMXVlZzdZblZ6emJvOUxnM3FKenJ5SStC?=
 =?utf-8?B?ejJqQ0ptQXBrR1JCTmNNZDdYczNwendmSm16WmZIcnlMZ3d3bjJzVURPRkZW?=
 =?utf-8?B?QXdGVVFMekVZejBGbGxWeGRuVytZTFJrN241bHJwU25oMm9uNHlGTGVhbkc2?=
 =?utf-8?B?ZHJOMzJvK1J1UDJtVWtMS2RLNk5kNGZiSXFOdkJKc1FWSUxiVStCVGpqTWhE?=
 =?utf-8?Q?ptxdmumw1rbHZSka1KO0mecOaQ6JLh9/dPCFspJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <10BE7326D85BD540838205914D95FFF6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1855
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92548d86-ddf1-4325-3727-08d8f048371b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nmzl+K1iBkaZrkOfMPIMn30IilizLJtFuChK2HpMwPUYlb4FKO2fnmgNMKEJY2VKyURDu7MNJEk4dDnzGMHF16LDQgv6lhzMWzaIkfArRTxzZyPJgChwawMFllC3KHIgq7OxAR7sCSE/0xjPVkBFfPtiKRvP/2F5MDxueN5I2TSqqY9d3vUJPbqxd0F1k/3eTephbxq7WSdr0IFZPejjfaHsApf/JcooEBBN5wiBtHHlDT8BytaR7HTZd/xOX4gIlNQz6rfQTvaZsSrS36uGYoguXqoXNmJorS4EGmaMvYp5c2p4BdpgadhYTEvWNQGJ+kz3h9KjNe/N0bxaT3NETNxWWvZu1v9hbsEc0ufcIMhy0jgPzWznXDT2YSeVR3fyaKajJEUgh07bGTr4CIY8Yn3EeuQCYz3PBok54zJD+ZvCwVMEDtmfhA53DL5/7oHpjxinBAE++Vbvb3CnQvlXBLd93+6nNDi2zJ1jjFeHWrYt/GDm2U4LRBWkg8RbP1Tq2xNnecYx/cNdT5FLCM8K7KNeZUZcAB4XQMVKXft2+h9UffHelw0TgS/0LT3MRrAPfnSDfabhc1BSn91YF2XHBAX50zMxIYhOrcA8HUlvbkfuSbZAx5QPuTsT2ajjMjTk4Xr9ahehSTAsztk4ij6Aye/L0fBtIhc1DfSMsEq7MkSAWYPLfPRtztWoH/k2BdKdfkSF3SzqB2NbNvjKMskaEZ4+h/zz8V8/KH+DJnnLG2U=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966006)(36840700001)(53546011)(356005)(478600001)(8936002)(55236004)(54906003)(26005)(86362001)(966005)(6506007)(33656002)(6862004)(4326008)(316002)(8676002)(82310400003)(47076005)(70206006)(6512007)(36756003)(82740400003)(70586007)(83380400001)(5660300002)(81166007)(6486002)(2906002)(186003)(36860700001)(2616005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 11:13:51.2246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b3818b-7036-419f-dac8-08d8f0483c43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5857

SGkgSnVsaWVuLA0KDQooc29ycnkgZm9yIHRoZSBkZWxheSkNCg0KPiBPbiAyMCBNYXIgMjAyMSwg
YXQgMTM6MTMsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPiANCj4gKCsg
U2VjdXJpdHkpDQo+IA0KPiANCj4gT24gMTcvMDMvMjAyMSAxNDo1NiwgQmVydHJhbmQgTWFycXVp
cyB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiANCj4+PiBPbiAx
MyBNYXIgMjAyMSwgYXQgMTY6MDYsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3Rl
Og0KPj4+IA0KPj4+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+Pj4g
DQo+Pj4gU29tZSBDUFVzIGNhbiBzcGVjdWxhdGUgcGFzdCBhIFJFVCBpbnN0cnVjdGlvbiBhbmQg
cG90ZW50aWFsbHkgcGVyZm9ybQ0KPj4+IHNwZWN1bGF0aXZlIGFjY2Vzc2VzIHRvIG1lbW9yeSBi
ZWZvcmUgcHJvY2Vzc2luZyB0aGUgcmV0dXJuLg0KPj4+IA0KPj4+IFRoZXJlIGlzIG5vIGtub3du
IGdhZGdldCBhdmFpbGFibGUgYWZ0ZXIgdGhlIFJFVCBpbnN0cnVjdGlvbiB0b2RheS4NCj4+PiBI
b3dldmVyIHNvbWUgb2YgdGhlIHJlZ2lzdGVycyAoc3VjaCBhcyBpbiBjaGVja19wZW5kaW5nX2d1
ZXN0X3NlcnJvcigpKQ0KPj4+IG1heSBjb250YWluIGEgdmFsdWUgcHJvdmlkZWQgYnkgdGhlIGd1
ZXN0Lg0KPj4+IA0KPj4+IEluIG9yZGVyIHRvIGhhcmRlbiB0aGUgY29kZSwgaXQgd291bGQgYmUg
YmV0dGVyIHRvIGFkZCBhIHNwZWN1bGF0aW9uDQo+Pj4gYmFycmllciBhZnRlciBlYWNoIFJFVCBp
bnN0cnVjdGlvbi4gVGhlIHBlcmZvcm1hbmNlIGltcGFjdCBpcyBtZWFudCB0bw0KPj4+IGJlIG5l
Z2xpZ2VhYmxlIGFzIHRoZSBzcGVjdWxhdGlvbiBiYXJyaWVyIGlzIG5vdCBtZWFudCB0byBiZQ0K
Pj4+IGFyY2hpdGVjdHVyYWxseSBleGVjdXRlZC4NCj4+PiANCj4+PiBSYXRoZXIgdGhhbiBtYW51
YWxseSBpbnNlcnRpbmcgYSBzcGVjdWxhdGlvbiBiYXJyaWVyLCB1c2UgYSBtYWNybw0KPj4+IHdo
aWNoIG92ZXJyaWRlcyB0aGUgbW5lbW9uaWMgUkVUIGFuZCByZXBsYWNlIHdpdGggUkVUICsgU0Iu
IFdlIG5lZWQgdG8NCj4+PiB1c2UgdGhlIG9wY29kZSBmb3IgUkVUIHRvIHByZXZlbnQgYW55IG1h
Y3JvIHJlY3Vyc2lvbi4NCj4+PiANCj4+PiBUaGlzIHBhdGNoIGlzIG9ubHkgY292ZXJpbmcgdGhl
IGFzc2VtYmx5IGNvZGUuIEMgY29kZSB3b3VsZCBuZWVkIHRvIGJlDQo+Pj4gY292ZXJlZCBzZXBh
cmF0ZWx5IHVzaW5nIHRoZSBjb21waWxlciBzdXBwb3J0Lg0KPj4+IA0KPj4+IFRoaXMgaXMgcGFy
dCBvZiB0aGUgd29yayB0byBtaXRpZ2F0ZSBzdHJhaWdodC1saW5lIHNwZWN1bGF0aW9uLg0KPj4+
IA0KPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+
PiBUaGUgbWFjcm8gc29sdXRpb24gaXMgZGVmaW5pdGVseSBhIGdyZWF0IGltcHJvdmVtZW50IGNv
bXBhcmVkIHRvIHYxIGFuZCBJIGNvdWxkDQo+PiBjb25maXJtIHRoZSBwcmVzZW5jZSBvZiB0aGUg
c2IgaW4gdGhlIGdlbmVyYXRlZCBjb2RlLg0KPiANCj4gVGhhbmtzIGZvciB0ZXN0aW5nISBJdCBp
cyBpbmRlZWQgYSBsb3QgbmljZXIgYW5kIGxlc3MgZXJyb3ItcHJvbmUuIFdlIGNhbiB0aGFuc2sg
SmFuIGZvciB0aGUgaWRlYSBhcyBoZSBvcmlnaW5hbGx5IGludHJvZHVjZWQgaXQgb24geDg2IDop
Lg0KPiANCj4+IEkgYWxzbyB0aGluayB0aGF0IHRoZSBtaXRpZ2F0aW9uIG9uIGFybTMyL3Y3IHdv
dWxkIGJlIG1lc3N5IHRvIGRvLg0KPiANCj4gSXQgaXMgbWVzc3kgYnV0IG5vdCBpbXBvc3NpYmxl
IDopLiBTb21lIG9mIHRoZSBhc3NlbWJseSBmdW5jdGlvbiBjb3VsZCBiZSByZXdyaXR0ZW4gaW4g
QyB0byB0YWtlIGFkdmFudGFnZSBvZiB0aGUgY29tcGlsZXIgbWl0aWdhdGlvbnMuDQo+IA0KPiBJ
IHdlbnQgdGhyb3VnaCB0aGUgcGFwZXIgYWdhaW4gdG9kYXkuIFN0cmFpZ2h0LWxpbmUgbWl0aWdh
dGlvbiBvbmx5IHJlZmVycyB0byB1bmNvbmRpdGlvbmFsIGNvbnRyb2wgZmxvdyBjaGFuZ2UgKGUu
Zy4gUkVUKSBvbiBBQXJjaDY0IEFybXY4Lg0KPiANCj4gQSByZWNlbnQgc3VibWlzc2lvbiB0byBM
TFZNIHNlZW1zIHRvIHN1Z2dlc3QgdGhhdCBBcm12NyBhbmQgQUFyY2gzMiBBcm12OCBpcyBhbHNv
IGFmZmVjdGVkIFsyXS4NCg0KVGhhbmtzIGZvciB0aGUgcG9pbnRlciA6LSkNCg0KPiANCj4gU28g
SSB0aGluayB3ZSBvbmx5IG5lZWQgdG8gY2FyZSBvZiB1bmNvbmRpdGlvbmFsIHJldHVybiBpbnN0
cnVjdGlvbiAoZS5nLiBtb3YgcGMsIGxyKS4NCj4gDQo+IEZvciBjb25kaXRpb25hbCByZXR1cm4g
aW5zdHJ1Y3Rpb25zLCB0aGV5IHdvdWxkIGJlIHRyZWF0ZWQgYXMgc3BlY3RyZSB2MiB3aGljaCB3
ZSBhbHJlYWR5IG1pdGlnYXRlLg0KDQpUaGF0IHdvdWxkIGJlIGEgZ29vZCBpZGVhIGJ1dCB0aGF0
IHdvdWxkIG1lYW4gbG90cyBvZiBpbnZhc2l2ZSBjaGFuZ2VzIG9uIGFybXY3IGFuZCB0aGlzIGlz
IG5vdCB0aGUgbW9zdGx5IHRlc3RlZCBhcmNoaXRlY3R1cmUgd2l0aCBYZW4uDQpBbnl3YXkgSSBh
bSBoYXBweSB0byBoZWxwIHJldmlld2luZyB0aGlzIGlmIGl0IGlzIGRvbmUuDQoNCj4gDQo+PiBT
aGFsbCB3ZSBtYXJrIHY3L2FhcmNoMzIgYXMgbm90IHNlY3VyaXR5IHN1cHBvcnRlZCA/DQo+IFRo
aXMgd291bGQgaGF2ZSBjb25zZXF1ZW5jZSBiZXlvbmQganVzdCBzcGVjdWxhdGlvbi4gVGhlcmUg
bWlnaHQgYmUgcHJvY2Vzc29yIG91dCB3aGljaCBhcmUgbm90IGFmZmVjdGVkIGJ5IHN0cmFpZ2h0
LWxpbmUgc3BlY3VsYXRpb24gYW5kIHdlIHdvdWxkIG5vdCBpc3N1ZSBhbnkgc2VjdXJpdHkgdXBk
YXRlIGZvciB0aGVtLiBTbyBJIGFtIG5vdCBpbiBmYXZvciB3aXRoIHRoaXMgYXBwcm9hY2guDQo+
IA0KPiBXaGF0IHdlIGNvdWxkIGNvbnNpZGVyIGlzIG1lbnRpb25pbmcgaW4gU1VQUE9SVC5NRCB0
aGF0IHNwZWN1bGF0aW9uIGF0dGFjayB1c2luZyBTdHJhaWdodC1MaW5lIHNwZWN1bGF0aW9uIGFy
ZSBub3Qgc2VjdXJpdHkgc3VwcG9ydCBvbiBBcm0gKHRoZSA2NC1iaXQgaXMgbm90IGZ1bGx5IG1p
dGlnYXRlZCkuDQoNCldlaXJkIHRvIHNheSDigJxub3Qgc2VjdXJpdHkgc3VwcG9ydGVk4oCdIG1h
eWJlIHNheWluZyBub3QgbWl0aWdhdGVkIGJ5IFhlbiB3b3VsZCBiZSBtb3JlIGNsZWFyLg0KDQpB
bnl3YXkgSSBhZ3JlZSB3aXRoIHRoZSBwcmluY2lwbGUgdG8gZG8gdGhpcy4NCg0KQ2hlZXJzDQpC
ZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBbMV0gaHR0cHM6Ly9yZXZpZXdzLmxsdm0u
b3JnL0Q5MjM5NQ0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

