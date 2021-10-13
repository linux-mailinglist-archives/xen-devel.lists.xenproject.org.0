Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFACF42BC62
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 12:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208171.364219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mab5X-0007Sy-QL; Wed, 13 Oct 2021 10:02:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208171.364219; Wed, 13 Oct 2021 10:02:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mab5X-0007Qx-N0; Wed, 13 Oct 2021 10:02:19 +0000
Received: by outflank-mailman (input) for mailman id 208171;
 Wed, 13 Oct 2021 10:02:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0M7b=PB=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mab5W-0007Qr-Jn
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 10:02:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.55]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5b6ef42-2c0c-11ec-8168-12813bfff9fa;
 Wed, 13 Oct 2021 10:02:17 +0000 (UTC)
Received: from AS8PR05CA0004.eurprd05.prod.outlook.com (2603:10a6:20b:311::9)
 by DBBPR08MB6300.eurprd08.prod.outlook.com (2603:10a6:10:209::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 10:02:16 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::d) by AS8PR05CA0004.outlook.office365.com
 (2603:10a6:20b:311::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.26 via Frontend
 Transport; Wed, 13 Oct 2021 10:02:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Wed, 13 Oct 2021 10:02:15 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Wed, 13 Oct 2021 10:02:15 +0000
Received: from cc36979be8e6.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9B6FCC67-C7BC-49F8-B3B3-99B8BE93CCD1.1; 
 Wed, 13 Oct 2021 10:02:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc36979be8e6.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 13 Oct 2021 10:02:04 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB7PR08MB3660.eurprd08.prod.outlook.com (2603:10a6:10:46::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 10:02:01 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 10:02:01 +0000
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
X-Inumbo-ID: a5b6ef42-2c0c-11ec-8168-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDr41HcM0x0JwfgkdMC8DHHsRnkRZDVRMQ66f2DsX4g=;
 b=3soQacc6GsXiXfLwY8DywBtS3GiYeXldiOL10/GFI/AqrGfznwb2vlCYmcmapEF/KePtNFVJ2/A9bJ2r8RMkOfXGPSIkvez8SesbOhElyepQQ95fb0/CC01JfrpmBmExNXRMYf5/M6AAv2YBOShTzLCaOx924by+G9tBxJEYQzo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c52b391468107ede
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zk53OGEMmGIG+uPtFcRzBzbp4fPDdK5iXTmyJdBkwF04T6/z861V9pw+vvJbBWf/eRY6x7OoZkaeY+uH4z938pBWmB1bk8s+dRVJSHiOTu/ePlz0eMJ8lNI6wJC2WbZ43CKzgE24KgqoIYRwml3ZGaVPWU430U1Fjk/vARSH1aOSfBU8CuIHWlZ/8pyEzb0qrFzqMTQGpeVrWierQxM3g1V52S4CDv9/dLeN4CpqfVhZ9QDclPBGKs0aseanGGiEc3gYxXzeN+gxDw30qcFctB7vg8spX3JRG8nvBMOQuUNiZdnx8tzyuLXihYhmqrubfJ5zn1bEK+0Awlx/jC3V5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDr41HcM0x0JwfgkdMC8DHHsRnkRZDVRMQ66f2DsX4g=;
 b=LRNBa9nn6GaY4le8/LspPY+Ojuf9Q9th5tmRsfi2gcaABwAAeT7brJcrai4nAYeqVX9y6qLzSbiLWPIt8p0YwRGioayjNKTWAgR86+m6RSyk4cBjAZrFntUWJBgHUG3sgIPq/1neUXo0OlF6hMiANyFFAPWtRRFe7yrBcJwQP6uhc1Tj237j3EWae3at6FKfgTWLrqubPKIFRNH8CfjlBL9lrMvllpPpGa+JrLKzzEsYhpQ3RZU9K0xqa2QKX7DFCdFz2JR+g20OBgQiRdOPs3iwKDaw9yqVO0kGmZlE/IZ25ZWf7p87Ce2jh0pw9wE8RmDLzCPVMddIic6nR7e3lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDr41HcM0x0JwfgkdMC8DHHsRnkRZDVRMQ66f2DsX4g=;
 b=3soQacc6GsXiXfLwY8DywBtS3GiYeXldiOL10/GFI/AqrGfznwb2vlCYmcmapEF/KePtNFVJ2/A9bJ2r8RMkOfXGPSIkvez8SesbOhElyepQQ95fb0/CC01JfrpmBmExNXRMYf5/M6AAv2YBOShTzLCaOx924by+G9tBxJEYQzo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Rahul Singh
	<Rahul.Singh@arm.com>, Andre Przywara <Andre.Przywara@arm.com>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index:
 AQHXutl3YqS5dHXsYk6KpdKt4d14RavHjPqAgAY38oCAAAe6AIAAByIAgAAKAoCAAEVOAIAA5tqAgADjBgCAAI9hAIAAQK4A
Date: Wed, 13 Oct 2021 10:02:01 +0000
Message-ID: <DDD004E5-E8E7-485A-9FDE-298744C32DDE@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
 <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
 <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
 <A8DEBD07-FB45-4E4E-A2C3-7AF8B393B032@arm.com>
 <59c9e102-c710-64d3-2a1a-cc8dcbcceead@suse.com>
 <alpine.DEB.2.21.2110111105180.25528@sstabellini-ThinkPad-T480s>
 <2fa4d2e2-7daf-6d52-ff4c-38a482af1fb9@suse.com>
 <alpine.DEB.2.21.2110121436020.9408@sstabellini-ThinkPad-T480s>
 <f15de716-4c4f-47b8-b6ba-ea549c61369c@suse.com>
In-Reply-To: <f15de716-4c4f-47b8-b6ba-ea549c61369c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c90d4472-d947-4fbe-8975-08d98e308920
x-ms-traffictypediagnostic: DB7PR08MB3660:|DBBPR08MB6300:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6300D406F245943E0241AB389DB79@DBBPR08MB6300.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ACl4Pm4JUoqtYb+4ha18Em+SGFFAWjMn9yfHRsemNJb82GFAH9yO9nATw3x9Q4fCiZOyn69gpH+VbeO06e57LOYxJKKGY8em+xSnTrDp5cINuax/q08hOuW4wZCVx6mto8D7x8k2QVXbl836H/4O/gnKS5pNMsMZ26pOH3ZM1U81CJJYDt2uHVOjIGcuDHCzCWHymSN1iEQzpcCSwyhlmjp7hKQ07Js9xpt4MUhCwg3u4s4+dSTN7G8EQ6QvF7ZrD4hWtO/A6rOI8OIypRqcoxAgD4eUa0zlObj5Cgdnaj3nd3fWVPnan1ys6zuMq328dY3XoMss1kBVvdNHmmlbBQz9tW/t6Qy3H8tnF6lHNqlb+F5DHWgy+YMr+KVkHf4fCoGFw6aeeP1yvh3dQBwpOXgdF/1sUJXP2Ei4m23sN+yaqb66zjTBdeU0mpHjGeIgBLsC12HOAiVLI+gNDZITSwD1gzsYiCoCDZJxq2BVhGUIgJc7c+4bbCNHOpmXS3wlbm2Bx2t8Zg9dRAQMnR1nmjS4d2t5qoqT1XP5GHaDel9nBnsBH7WxRDTT/q/rB6b+usnrAad9inruh6SixTY5SvD5U6A5J/uJcEZxCO/lM5PxdyT1gk5c8eoVvIjq05jtLOIaetu8SoP89yd4Hpcp9Y/W4MrmtpntycIISbiqdIjNFUNS89Z/wZQaPvk/pHbomL6iL6pTfw1BQyLfD4gvkLQkYZekpT+ZhI1+cKudCfBD89nYSIDDyFAsvXjr76Pk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(76116006)(6512007)(71200400001)(54906003)(91956017)(66446008)(8676002)(83380400001)(64756008)(66556008)(66476007)(33656002)(6916009)(8936002)(66946007)(2616005)(86362001)(26005)(36756003)(38070700005)(122000001)(186003)(53546011)(6506007)(2906002)(7416002)(508600001)(38100700002)(6486002)(316002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <BC75DBF1445DED4C975C8FA1FD07BA21@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3660
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	971b6754-31e8-4adc-b093-08d98e308088
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3yEjfGlOawvt1Zb73d/7MSKaYDleQP9TvA/snwnq+zym88741cEOBPPLEQ5SOMdbs5e8Eysl/hWvTp36+mMgzt2tfm8emfXmqx/Uzf4C++9rVE9ADGdRqL0/3+LXotjVLKOKVlkSdldClx65LysCgBA+ucyjPDXt2FmM0odXiduukQHPiHRPpnw0M2zYObrtwn1hf/NZ24f8oyj8F6G3L7HXZ6yAEoPJl18P1ui8GN/0dWyoun2r2aSskNvxnEcNGEDb5GGV7Cj4Wnsr7jU3+VO1ntHht3sceg6yLbKvCoa8fcjq7Kky5RIan2kQN7kW+qoc1Afh6HAZjesEbdURDnTPu0QdAqwE/Flw7nDVFfvNcBBHmXWuDxr2PD/PAP3xWuNWXaa/bMrZXsLpaUJIPSuPiq7vJ8i/3JiGRdoHPr6zVhSy3ENjx3TX6coHX6yDOnDV4ffv5JQU52pTfYz90w2rv6a0X8IbBt2HCuuS4M0fXakOOyWYl5gIQXWwDTF9QRF0UP+a93D5rcn85gv5vvRME1UbTFyIgAFy+duryjkUrzdmO82nlKPpg7BdXXuINno+XvrcuqSa7mfvl39edY55YpBJQuvV8HC6pL53gX1VtWGAS8kVLiCuQoVa1ualfX0/wDC2Pv2vvGfJ7UxqCSk4Cb93ZEONG5V4vbLtzfX2fZvNVdlox16LVD3mdu8nQN4S0iGMl9vDHMZvNE67BQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6862004)(81166007)(33656002)(82310400003)(6506007)(6512007)(53546011)(8936002)(4326008)(508600001)(36756003)(2906002)(47076005)(83380400001)(36860700001)(186003)(336012)(8676002)(86362001)(2616005)(5660300002)(316002)(6486002)(54906003)(70206006)(26005)(70586007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 10:02:15.8741
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c90d4472-d947-4fbe-8975-08d98e308920
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6300

Hi Jan,

> On 13 Oct 2021, at 07:10, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 12.10.2021 23:37, Stefano Stabellini wrote:
>> On Tue, 12 Oct 2021, Jan Beulich wrote:
>>> On 11.10.2021 20:18, Stefano Stabellini wrote:
>>>> On Mon, 11 Oct 2021, Jan Beulich wrote:
>>>>> On 11.10.2021 15:34, Bertrand Marquis wrote:
>>>>>>> On 11 Oct 2021, at 14:09, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 11.10.2021 14:41, Bertrand Marquis wrote:
>>>>>>>> But digging deeper into this, I would have 2 questions:
>>>>>>>>=20
>>>>>>>> - msi_cleanup was done there after a request from Stefano, but is =
not
>>>>>>>> done in case or iommu error, is there an issue to solve here ?
>>>>>>>=20
>>>>>>> Maybe, but I'm not sure. This very much depends on what a domain
>>>>>>> could in principle do with a partly set-up device. Plus let's
>>>>>>> not forget that we're talking of only Dom0 here (for now at least,
>>>>>>> i.e. not considering the dom0less case).
>>>>>>>=20
>>>>>>> But I'd also like to further defer to Stefano.
>>>>>>=20
>>>>>> Ok, I must admit I do not really see at that stage why doing an MSI =
cleanup
>>>>>> could be needed so I will wait for Stefano to know if I need to keep=
 this when
>>>>>> moving the block up (at the end it is theoretical right now as this =
is empty).
>>>>=20
>>>> I know that MSIs are not supported yet on ARM (pci_cleanup_msi does
>>>> nothing). But I wanted to make sure that the pci_cleanup_msi() calls a=
re
>>>> present anywhere necessary, especially on the error paths. So that onc=
e
>>>> we add MSI support, we don't need to search through the code to find a=
ll
>>>> the error paths missing a pci_cleanup_msi() call.
>>>>=20
>>>> To answer your first question: you are right, we are also missing a
>>>> pci_cleanup_msi() call in the case of IOMMU error. So it might be bett=
er
>>>> to move the call to pci_cleanup_msi() under the "out" label so that we
>>>> can do it once for both cases.
>>>>=20
>>>> To answer your second point about whether it is necessary at all: if
>>>> MSIs and MSI-Xs cannot be already setup at this point at all (not even
>>>> the enable bit), then we don't need any call to pci_cleanup_msi() in
>>>> pci_add_device.
>>>=20
>>> Well, at the very least MSI can't be set up ahead of the traps getting
>>> put in place. Whether partial success of putting traps in place may
>>> allow a cunning guest to set up MSI may depend on further aspects.
>>=20
>> Good point about MSIs not being setup before the traps. We should remove
>> the call to pci_cleanup_msi() in the error path then.
>=20
> Your reply makes me fear you didn't pay enough attention to the "partial"
> in my earlier reply. The traps for the various registers can't all be set
> up atomically, so there may be a transient period where enough traps are
> already in place for a cunning guest to arrange for setup. Unless, as
> said, there are further setup steps needed before a guest could succeed
> in doing so.
>=20
> But even if partial trap setup alone was sufficient, I think the cleaning
> up of MSI then might still better go on the error path there than on that
> of pci_add_device().

I think I should put the msi_cleanup in the exit path if pdev is not null b=
ut
we got a non null ret (in an else if ( pdev ) ).
This would cover all exit paths, especially as I will move the add_handler
before the iommu init.

Would that be ok for everyone ?

Cheers
Bertrand


