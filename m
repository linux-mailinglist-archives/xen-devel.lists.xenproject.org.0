Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AAE42F688
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210768.367755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOlW-0000mC-FX; Fri, 15 Oct 2021 15:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210768.367755; Fri, 15 Oct 2021 15:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOlW-0000kP-Bk; Fri, 15 Oct 2021 15:04:58 +0000
Received: by outflank-mailman (input) for mailman id 210768;
 Fri, 15 Oct 2021 15:04:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fqmt=PD=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mbOlU-0000kJ-IT
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:04:56 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.86]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e680471-be91-47c7-a531-90f7b9b93526;
 Fri, 15 Oct 2021 15:04:54 +0000 (UTC)
Received: from AM6P194CA0028.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::41)
 by HE1PR0802MB2540.eurprd08.prod.outlook.com (2603:10a6:3:d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Fri, 15 Oct
 2021 15:04:52 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::b1) by AM6P194CA0028.outlook.office365.com
 (2603:10a6:209:90::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Fri, 15 Oct 2021 15:04:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Fri, 15 Oct 2021 15:04:52 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Fri, 15 Oct 2021 15:04:51 +0000
Received: from c9771da20a92.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F903488B-5160-4AC5-9F6D-47ECF7A9B007.1; 
 Fri, 15 Oct 2021 15:04:41 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9771da20a92.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 15 Oct 2021 15:04:41 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR0801MB1862.eurprd08.prod.outlook.com (2603:10a6:4:75::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 15:04:37 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.031; Fri, 15 Oct 2021
 15:04:37 +0000
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
X-Inumbo-ID: 0e680471-be91-47c7-a531-90f7b9b93526
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrKl4S1boW/FetRzJ4k3nbpvsIkHmkx/mkFE6eNhl0E=;
 b=EQxt72PfQKXiWB2zaAS68pBK2aLXTO+S7izchvLuyuIx0TUwlZ44vbN9I/92tutrezQCIVnZzFBscc/We1mTAtgPFKDlRdnIIt6DkemS8B4s6Ez4w2vQCCorfJLa5UIWBFRJPF49o3rCTAioiRZTCK8qfHHWW9m8ZP7lHn6CnWw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a37943207c259c67
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQxZVBsu5FOPR1PDGVl1Nfxjs9NUsfSMc+IAic9rRCspJXqFkR3HfWLhtH0r+cC6ECRRnDe3pyoMtXeattgRbje47289dKDa2MU4Rvfo+3Nle5KElfP24rMPP3sXmgcJnlmQOUPLC9+p6L+mclBKmAdprGlhstC+v0jndOpg6qDEQMIxjH4f0wg0nNuR1scwH7yWDbeC0PEOR3gD8WoJkfNKY0HWrCuRhchT3802P8h0+XHvdZu4XtzvBbywiPSy2UU24GeNjo5MG0vCvlWexb3wUnFYv69o7a4cf/X+1EUnQpXEDYgulhdUCQFTcQnBzk3M3jxj5zVmUk7EFFRQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrKl4S1boW/FetRzJ4k3nbpvsIkHmkx/mkFE6eNhl0E=;
 b=hnGUi7JI3lZvVHdgAYF9NP7wQ1Dq6GjWus1+4tg8fhTj82anoG4bPIzANcYNGNA/NOqiFyf5gL0+UvDYYinEVu9WEVkax6bEnWKY/FofSQ/0vJCz7EI+pQAW/jw4erg5+ttTHdFXyl5YFISetUPBQv25SgLzjukL8czXOsjOpb5PGhWEs+Je9BKHFiVIct9seaCgfgt9ND6U+iadt9bVskhl70u45uEEoMLG2aK9f0ukI03vv22Tlq4MWtYYBlCYQXxMPKQNJmUIf16jKJ2d6JldW7eMNswM7og4xk11J95PnPq6TvfIpryq0Ko7Eegyl0//qlbTj6G3WXdtj7Bcag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrKl4S1boW/FetRzJ4k3nbpvsIkHmkx/mkFE6eNhl0E=;
 b=EQxt72PfQKXiWB2zaAS68pBK2aLXTO+S7izchvLuyuIx0TUwlZ44vbN9I/92tutrezQCIVnZzFBscc/We1mTAtgPFKDlRdnIIt6DkemS8B4s6Ez4w2vQCCorfJLa5UIWBFRJPF49o3rCTAioiRZTCK8qfHHWW9m8ZP7lHn6CnWw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>, Rahul Singh <Rahul.Singh@arm.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Michal Orzel <Michal.Orzel@arm.com>
Subject: Re: [PATCH v7 5/5] arm/libxl: Emulated PCI device tree node in libxl
Thread-Topic: [PATCH v7 5/5] arm/libxl: Emulated PCI device tree node in libxl
Thread-Index: AQHXwczxs7P/2oORBkqz9VQaBzYYAavUJQ2AgAADSAA=
Date: Fri, 15 Oct 2021 15:04:37 +0000
Message-ID: <BFD982F5-7567-445F-9819-57E512326222@arm.com>
References: <cover.1634305870.git.bertrand.marquis@arm.com>
 <4a22121e6474adfb1c5166e0fdaddff47c6dae46.1634305870.git.bertrand.marquis@arm.com>
 <0204f92a-4637-d3cd-5420-979e9c03f237@xen.org>
In-Reply-To: <0204f92a-4637-d3cd-5420-979e9c03f237@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 36cf4fbd-5574-48fc-ba11-08d98fed23fc
x-ms-traffictypediagnostic: DB6PR0801MB1862:|HE1PR0802MB2540:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2540EFE5A1CD078F184F13B59DB99@HE1PR0802MB2540.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XmPjekALAf9YxKze5ML1KLB9K69eNprhxPYTuxRdkpq1rlkKkOsx98mJCctT0+rdPwWBA8nIhMQrJvQ2EcMzw8G/A76xomgcWwjCaCJwNMgGxOlXy8duWZ+0hHBEieKkVIkQ9LQo5sGgptKoW6JRiORKHcbIhIRk4LT+gGjL2nAwo/xC57V5lsWvJbbARoe6JdTFBKpSPZ/1va3U7fvMCFBonHAQJ2uup8C5CpRz7BivAzGkYYx37Ox3dkDMEn25X6XTPdXCcMoPWM8qKkEXFFTJi1fOrBG7+sSzxWlj6QUGw/6ygg57gjjpe0V9MRulitUZU4Qk0dAyPsPvAPl6v+jlhl5DSJKDyImjnJTxRC9TYf/Z/O4Apmhc1TdEEFc19SxqhpZEpIBRRO/LFeKG1bnC2FBnQ212nf7/Xas+nEsN7KVRQegKpTn4IugCT51/I1APk0esWwJM1P3yow+A8z0BRlvNVqpeQTfsVMQ072vhXbItOkclTz4mbvo4lzN7lTMpDpY0ZSdCqe+ynsad/o2JT2wBcNyb1eb39WVMjIDzASoCTtfAZcMhO+ul9pj5asBLc3w7BQXRRRduq1HI9Vxqza2w4WWMUOaifMR/24KcsC8fp5P1slH3OSswmbDPEQjO/9O4fIkklOUkDIO0A44KJOL9kQE9ImzE0ZJ5oXtFIYeHp0ukpi7FZaXYZR/noMggZaqpgibbi5HdReNbFYGyuMowrkQ11m4Fo5uEo8HZQg3cy/6n9yt1EXKoMSXv
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(8936002)(33656002)(53546011)(8676002)(38070700005)(4326008)(6512007)(54906003)(38100700002)(6506007)(36756003)(122000001)(64756008)(186003)(66476007)(66556008)(71200400001)(76116006)(66946007)(2906002)(66446008)(26005)(6916009)(5660300002)(86362001)(508600001)(2616005)(316002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F173153BFA83894DBA7046B57FA2C3C9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1862
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50c6f9ab-f79d-4f89-2657-08d98fed1b3d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vkF9EEwCrzpOJVkHAZ7LEjNg99MzncZtujnvi145T58HlGgiPQdgFQO+VPe29H0RgaNxhzKqTvsdiC8maJrIdHz+xHGx3oUfzJFzijDLCvw1gvJg5NukY/IvoTq5Hlg1nG8Ablb36P7XgiHbiq7vfdlmpkJg6IiSmCiaLTa5D5GjJhj/+4oqmUkHH/fON6y8IT9LGSakXGJJPCffe2RpEHtlsp8m2k5i5/35SMmce+XWNjpglM2j4UDFDWGmgcjgauIZTOpN8iYAIKJo3PGYqUXoc6AZMrckecIyfouJ8TkJKICJZ6GjCnU5OddLm7iCkkZopgHJSAjVasS27ALmiZtmRinf8fAm5kd0q/EEH9w9ph/Dx+ncanhdtChI2q4d86c6uvZLakHxjyeNiA59lUYgRlj7CLGoZe387zsIEMHHiJyHVfqBsBW592rq3hJP17wBepsm43sRXXMifJjp+3DTqZLkNT45CNqjL8poUY63Oz1Q/K8Junlq6mbnUFYj3JEKx4edpo379aQi5jOVKa1Y+OBsE5/mUJ4fvR5IDd41WubiC4KGmjyEnu077df0HmDoxD7rd7gt4JsC+w0z+vXhQYyjtDCZsgMj+MotNZrk3KsJ0UwISI5W/z88W51PKlqkaHzFNNKskvMTIULwTto1LQPz5UU9EkmX4Od8GbO/lnINOdxSAT3gpI2/gBGlK9JGRNXM1nVUEZTmCEcs1g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(70206006)(47076005)(8936002)(5660300002)(356005)(54906003)(81166007)(508600001)(6486002)(82310400003)(36860700001)(33656002)(70586007)(26005)(6512007)(36756003)(316002)(2616005)(6862004)(186003)(2906002)(8676002)(336012)(86362001)(6506007)(4326008)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 15:04:52.2062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cf4fbd-5574-48fc-ba11-08d98fed23fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2540

Hi Julien,

> On 15 Oct 2021, at 15:52, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 15/10/2021 14:59, Bertrand Marquis wrote:
>> From: Rahul Singh <rahul.singh@arm.com>
>> libxl will create an emulated PCI device tree node in the device tree to
>> enable the guest OS to discover the virtual PCI during guest boot.
>> Emulated PCI device tree node will only be created when there is any
>> device assigned to guest.
>> A new area has been reserved in the arm guest physical map at
>> which the VPCI bus is declared in the device tree (reg and ranges
>> parameters of the node).
>> Note that currently we are using num_pcidevs instead of
>> c_info->passthrough to decide whether to create a vPCI DT node.
>> This will be insufficient if and when ARM does PCI hotplug.
>> Add this note inside libxl_create.c where c_info->passthrough
>> is set.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>=20
> I believe you need to add your signed-off-by here as you sent the new ver=
sion on xen-devel.

I packed it together but the changes where done by Michal so I did not add =
it.

Could it be added on commit ?

>=20
> With one remark below (not to be handled for 4.16):
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks

>=20
>> +static int make_vpci_node(libxl__gc *gc, void *fdt,
>> +                          const struct arch_info *ainfo,
>> +                          struct xc_dom_image *dom)
>> +{
>> +    int res;
>> +    const uint64_t vpci_ecam_base =3D GUEST_VPCI_ECAM_BASE;
>> +    const uint64_t vpci_ecam_size =3D GUEST_VPCI_ECAM_SIZE;
>> +    const char *name =3D GCSPRINTF("pcie@%"PRIx64, vpci_ecam_base);
>> +
>> +    res =3D fdt_begin_node(fdt, name);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_compat(gc, fdt, 1, "pci-host-ecam-generic");
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_string(fdt, "device_type", "pci");
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_regs(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>> +            GUEST_ROOT_SIZE_CELLS, 1, vpci_ecam_base, vpci_ecam_size);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_values(gc, fdt, "bus-range", 2, 0, 255);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_cell(fdt, "#address-cells", 3);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_cell(fdt, "#size-cells", 2);
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_string(fdt, "status", "okay");
>> +    if (res) return res;
>> +
>> +    res =3D fdt_property_vpci_ranges(gc, fdt, GUEST_ROOT_ADDRESS_CELLS,
>> +        GUEST_ROOT_SIZE_CELLS, 2,
>> +        GUEST_VPCI_ADDR_TYPE_MEM, GUEST_VPCI_MEM_ADDR, GUEST_VPCI_MEM_S=
IZE,
>> +        GUEST_VPCI_ADDR_TYPE_PREFETCH_MEM, GUEST_VPCI_PREFETCH_MEM_ADDR=
,
>=20
> From my understanding, the prefetch memory region is optional. Is it goin=
g to be a problem to expose one for the vCPI when the host PCI hostbridge m=
ay not support it?

Good point but I would guess no as the host bridge should not use it.
I keep that as a point to check with Rahul.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


