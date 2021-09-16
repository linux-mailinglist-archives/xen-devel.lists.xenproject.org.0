Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CC40D838
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 13:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188394.337541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQpMz-0006XC-Uo; Thu, 16 Sep 2021 11:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188394.337541; Thu, 16 Sep 2021 11:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQpMz-0006V0-RW; Thu, 16 Sep 2021 11:15:57 +0000
Received: by outflank-mailman (input) for mailman id 188394;
 Thu, 16 Sep 2021 11:15:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U6Su=OG=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mQpMy-0006Uu-6I
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 11:15:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.70]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 963249f7-c872-4988-ba42-d2f9df553403;
 Thu, 16 Sep 2021 11:15:54 +0000 (UTC)
Received: from DB6PR0501CA0017.eurprd05.prod.outlook.com (2603:10a6:4:8f::27)
 by DB8PR08MB5243.eurprd08.prod.outlook.com (2603:10a6:10:bf::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 11:15:50 +0000
Received: from DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::1b) by DB6PR0501CA0017.outlook.office365.com
 (2603:10a6:4:8f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 11:15:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT053.mail.protection.outlook.com (10.152.21.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 11:15:50 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Thu, 16 Sep 2021 11:15:50 +0000
Received: from 1d6c56a0c8ba.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7D90F02A-1F8F-41F7-9240-E53A85E92364.1; 
 Thu, 16 Sep 2021 11:15:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d6c56a0c8ba.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Sep 2021 11:15:30 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6751.eurprd08.prod.outlook.com (2603:10a6:102:136::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 11:15:26 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 11:15:25 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0352.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 11:15:25 +0000
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
X-Inumbo-ID: 963249f7-c872-4988-ba42-d2f9df553403
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9PCvFEzWeUMI44mSEn15pFntTzThpq9UYi4y4WWXWY=;
 b=k9zmlBFQStr7N2gW0GNQAR3Yc9QC7H1aHLaIxllfU63J8FeC6vvN+ypmgQtFzVLo0vLlIskRjmFhT0y4VB9iUFjyxCHjhgrsgSzNuMOSeohawfoHSQKnhEUQfwtk/rlTqS8/64uORw//xUpIzrXgSPJxjcmCltteUMTfa0xCQ04=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 75b474b7284c900c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deBNPJu4aItrLgDgRDcWU3GaMaCHQ/TkoLN5nVXtI5VeKKL35vpJOaGSohvy8uUgLP2wR9Tvp5WnBWfFOESswJibkbMgejg1tp4vZCiUPLtazP3yzN6VmmJQJfg3zVkEeDP3o3kYgM8lSpPgeKrZ/5TLwN6XHrSwAVQl8I8h6mmTnUI1qVtuOclrx05Emw2CVioOnQxK7g00nxjdlm2LLWI/tHFoHNCXQS5P8iJKdSQFnx1OMSY1VpDc9jXi14CWF2zEWJd9flsyDnwhxGMbOhKMwsXv2IxjlLAjx0qzkNPgDXTAAdkP10FGv9r9N57j1G/uigZQmHDptpy1g5d1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=p9PCvFEzWeUMI44mSEn15pFntTzThpq9UYi4y4WWXWY=;
 b=Dv72jQgQZFc3wpRl26D3VfhCx2ywR11tJz7077nAQSOg/XShWK3ef6J9I8sXErkHZ2OlV539+Q7XP+YTGNDB7VpBhoPLjHXDxT9dKyd0puBlDpeXm78hRbJL5HI3waoKrdkwivytLKcsDKFmz4MRmeuoUeZh9H0soRt3poNnhM0ZclfNmaekkG96IlRojHwk2vVv8PiqUl1f0Cy+syz5XsjhO4T11wkW3QJv7WXgaaqDu6Qu5pM8dJCcv9ADCay73yFbTst0aV5cQWxSrNMSr21nfdWgiHQbhEHU6u7npeESSismzR9SE03eBZWVR0Dr8jxqu1ujUqC2XysIe62r7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p9PCvFEzWeUMI44mSEn15pFntTzThpq9UYi4y4WWXWY=;
 b=k9zmlBFQStr7N2gW0GNQAR3Yc9QC7H1aHLaIxllfU63J8FeC6vvN+ypmgQtFzVLo0vLlIskRjmFhT0y4VB9iUFjyxCHjhgrsgSzNuMOSeohawfoHSQKnhEUQfwtk/rlTqS8/64uORw//xUpIzrXgSPJxjcmCltteUMTfa0xCQ04=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <5e272a26-e1f7-a861-feb1-350293a9f809@suse.com>
Date: Thu, 16 Sep 2021 12:15:18 +0100
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0E1E73EE-5F48-499A-89DA-EFE78642A2AD@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2109151721210.21985@sstabellini-ThinkPad-T480s>
 <5e272a26-e1f7-a861-feb1-350293a9f809@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0352.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::15) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5271f72c-dbb7-444b-0b4c-08d979035755
X-MS-TrafficTypeDiagnostic: PAXPR08MB6751:|DB8PR08MB5243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB52431DCFD003B047D171B971E4DC9@DB8PR08MB5243.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +XUDdkDonzyLRHM3tgJSXAw9KK3DpwzjZH7BL/YYyzVGwCuyx6CCz9oyNMQAKWCR+7aRtL88RiChO+aqqpmqkWw8cXAW8t6aT4IAa5jl4S/+2BUp3RivX/E+/vhEmJohcYxMD1XSCMJWGKqhYIHYfHWNjowSZVqHHZJNsqMEnIvY5O8yG+kxph7l45jqYJZlKRxsmU7mQBVtUszgwcvZozWd5pok0w5HxqoqQvRqGWZNZ7jzpqrAmdv6y1IJrPpfHtH11hb5OarszR6tldFF/fskRkiaJwHEjzJI625JmEs15f4OEzdoLp68oZAtSkEMB/Xm8c2y4caUr7CXyQ6qhTcKQmJS7qjAnANhhtOFc6r2qGpUVSyQrDo/NGh73VVtxOQoWE0XWcXqGEnAm/1n5MNLm4Bz24ky2Pm1530XukqRfowIJkNoIQTocVd+bs5GUVmmI8XzJzPoYcGF7w+XOfU12dDy/jMdBRcDd1IHWDRwRoh91NB76pxE5uPdzzvsnqVMCut6TdPnsdpLKeA0S8Ultm9TAKbhG5eVn7ZP2RrVR2oATjG+vnV1WhJIVxLWcdjyM2v/0/7aecRAR2B3f3UpSlRBpIYu/ETEzkMRzWgPTbee08P5GcV/s8gqOARAj7MHi7FTF1AWJD+ydOEqT9abC2i/+MqwShuEWEqebaXUPN16269tXkzMQVTimSadCXp1amDzRarVGlq1y9bDMV4zkfN3+iRb9fH0U1IYJZy3TtKySPJtwkcN4FLQEfKszvol1dqIoy+W6Sj6QZDh9w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(6486002)(6916009)(316002)(38350700002)(38100700002)(44832011)(83380400001)(33656002)(8936002)(2906002)(52116002)(6666004)(6512007)(4326008)(54906003)(2616005)(956004)(186003)(36756003)(53546011)(6506007)(26005)(508600001)(5660300002)(66946007)(66556008)(66476007)(86362001)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6751
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	40396318-0295-4180-7814-08d97903483f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sV1FsolW3AvGFsAJNU9O4NnU/qiI/xuwcfA2neYE/xYhUe7McGnqDVv+bWpX2bNDFBf3FV5JM0m20yiOmDOpwKf40jZhSQ4RpFGdx4KdDLwFCWOUvVjqyfezEacXKOWv5y1HF9xHAIug/cNcGGy7stxnxR4zesydhS6HeQ+GizugtcVu4OPLY5ofVFLEAOqvLis5O3Oc+iEZEx2LwHzUkVitm7/UeTpV9Z/CbuDsKSl6bi7lNP9ajxRa8dYt3FEl/7uQJFWlih40iioDPnIIvcZ6ITVq05EYZD0N+12cLjyQpRtpVevjDKrHkeYIDZ6JQULB8BY1Hjp/cwQIJN6J/9zi24npXEbEmUPnhkJd9h66YHOoUd4AZZfODnvm2IhJe5c3EH/rnnEu6DzighnN5b+jsoCJuUF/mgnGRFAM2Ar9Tmm619RHm/aGW1IxHX9AY7FlVnRSnxcO9XaE4arfQOQUWqAuvlhMLNJt4w6IP7iUdzTxPm0z7fp9uHBHiMjNa7VHWtufIdkvLS9m0VeURsyZxywA1SUlYmM/8wFS+Yy4b5M7xUmmy1INX8f03DePTSL0vSlBnUWsysmhf5ok4RsLD4/5hmWWBlKT/h3Qs5NZVrPPNtpItSkgeYHyH1sBEyXjpeZ+3VfoW6iiCbusYDYNkAnjzMLkkB4XlhJ3tpm/OINEkvJMRcpT6AZ1PUzSDwP12/QLMNjypUWTEhR9LIS9fsR7fXpbEvQRwFBXcjw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(54906003)(86362001)(356005)(4326008)(70586007)(107886003)(81166007)(33656002)(508600001)(6506007)(70206006)(336012)(53546011)(6666004)(26005)(2906002)(82310400003)(186003)(47076005)(36860700001)(6486002)(44832011)(6512007)(5660300002)(956004)(2616005)(83380400001)(6862004)(8936002)(36756003)(316002)(8676002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:15:50.6619
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5271f72c-dbb7-444b-0b4c-08d979035755
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5243



> On 16 Sep 2021, at 07:50, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 16.09.2021 03:16, Stefano Stabellini wrote:
>> On Wed, 15 Sep 2021, Luca Fancellu wrote:
>>> +static void __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_han=
dle,
>>> +                                               int domain_node,
>>> +                                               int addr_cells,
>>> +                                               int size_cells)
>>> +{
>>> +    /*
>>> +     * Check for nodes compatible with multiboot,{kernel,ramdisk,devic=
e-tree}
>>> +     * inside this node
>>> +     */
>>> +    for ( int module_node =3D fdt_first_subnode(fdt, domain_node);
>>=20
>> int module_node;
>>=20
>> for ( module_node =3D fdt_first_subnode(fdt, domain_node);
>=20
> Not just here iirc from briefly looking over the patch as a whole
> yesterday: Use of plain "int" would better be limited to cases where
> values may also be negative. I don't suppose that's possible here as
> well as in a number of other cases.

Hi Jan,

fdt_first_subnode(=E2=80=A6) can return -FDT_ERR_NOTFOUND.

>=20
>>> @@ -1285,14 +1286,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TA=
BLE *SystemTable)
>>>             efi_bs->FreePool(name.w);
>>>         }
>>>=20
>>> -        if ( !name.s )
>>> -            blexit(L"No Dom0 kernel image specified.");
>>> -
>>>         efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
>>>=20
>>> -        option_str =3D split_string(name.s);
>>> +#ifdef CONFIG_ARM
>>> +        /* dom0less feature is supported only on ARM */
>>> +        dom0less_found =3D check_dom0less_efi_boot(dir_handle);
>>> +#endif
>>=20
>> Rather than an #ifdef here you can simply implement
>> check_dom0less_efi_boot on x86 as a static inline returning always
>> false.
>=20
> Indeed, and the properly named (efi_arch_...()).

Ok, I was unsure if a solution like that was going to be accepted, I will u=
pdate the code then.

Cheers,
Luca

>=20
> Jan
>=20


