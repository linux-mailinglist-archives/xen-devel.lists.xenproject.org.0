Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 899BF40DD96
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 17:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188554.337747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQszk-0007f6-VM; Thu, 16 Sep 2021 15:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188554.337747; Thu, 16 Sep 2021 15:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQszk-0007dA-SA; Thu, 16 Sep 2021 15:08:12 +0000
Received: by outflank-mailman (input) for mailman id 188554;
 Thu, 16 Sep 2021 15:08:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U6Su=OG=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mQszj-0007d4-2J
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 15:08:11 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.88]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e69fbe20-16ff-11ec-b60b-12813bfff9fa;
 Thu, 16 Sep 2021 15:08:08 +0000 (UTC)
Received: from AM5PR1001CA0051.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::28) by PAXPR08MB7153.eurprd08.prod.outlook.com
 (2603:10a6:102:205::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 15:08:06 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::c1) by AM5PR1001CA0051.outlook.office365.com
 (2603:10a6:206:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Thu, 16 Sep 2021 15:08:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 15:08:05 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Thu, 16 Sep 2021 15:08:05 +0000
Received: from 64bdb17df644.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C358068C-8D72-4BBC-85D1-8C4DFFDE716A.1; 
 Thu, 16 Sep 2021 15:07:51 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64bdb17df644.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Sep 2021 15:07:51 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6141.eurprd08.prod.outlook.com (2603:10a6:102:f2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Thu, 16 Sep
 2021 15:07:48 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 15:07:47 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0192.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:1a4::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 15:07:46 +0000
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
X-Inumbo-ID: e69fbe20-16ff-11ec-b60b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuDY7kva6TB+DFTqavYUDWtKCiVsaC/k4SIMhEkr47k=;
 b=TfIQPoGVjjYzTLiZ7HrEOwUGgx76fFx4NHAgUnqC7bTTAgXzAy6SZwmLCo0WEEtMDG/5MvE5CH5a8V+BWFbs9byqlK2FyJW4dHAJr+b52mb1WnP+IZQMP7bk3ZsuOtkgVjbSbu94orTACzetM9Pj7nhICzu/CqnYDiHBVdeYjAk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9447dfae84be5384
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vy7ojjr1QGzINLrWdtFc45jCxnNzbY8hpNzTzXH4ihyetVIcvwj0MCwgRPWjUj5fsI7QPskbcNy38KVUCEAGFx8vE0cfIFdQmoXSDDkxomaLwewJlo2HVnAJ5QNeIkybbqVX0hPuW3cYH8kfd7w3cGZFFz+KHvbD/Wj0jIsAq+9uCt4OzdwjfWC/AjMKlZ2LKYv1b42tOJMYHWXvw+jIyZElXe7FsBDd6AzdMsUOztNTYpemBP/YHXZT0eluw+BOqaA2qaYfiG1woNSnyRZk6qaGGHGPtWy1DYYRsnKztj4stBpoYyc696kOJbR0eMi7V161m3EzbBNxs0AOb8Bctw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=OuDY7kva6TB+DFTqavYUDWtKCiVsaC/k4SIMhEkr47k=;
 b=Qf/eRcgLoBxvAkydXg+uKcxScqHaVkz16Bfrmwn93as0gQEDuJfY3exDKlmOJlHpWsttjNXLV3Z3Upep/G2kcVBcdN1jRy8f2FhLPaT6HOLxn2Wmic5ktYCvzaiS3yNgKmcHwXufhwAhgIyRBwdUvIUr/zykAxuAySyR2LhXiKT8UQ5RYBWPi4dEFxOuZQV/mfVYScEwveBk5qvUh+4SE+73JmxkLVd99nIHGniF0wvt8QqIN9MmnD72UFV1eLtZgAqu92JXiKhyEk/v06CxSYnA8N4ehIxR0URcn2fVE+U78e+hOPntABTmZFMzzaQDgNhD6tCCl9VWnLUciY99Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OuDY7kva6TB+DFTqavYUDWtKCiVsaC/k4SIMhEkr47k=;
 b=TfIQPoGVjjYzTLiZ7HrEOwUGgx76fFx4NHAgUnqC7bTTAgXzAy6SZwmLCo0WEEtMDG/5MvE5CH5a8V+BWFbs9byqlK2FyJW4dHAJr+b52mb1WnP+IZQMP7bk3ZsuOtkgVjbSbu94orTACzetM9Pj7nhICzu/CqnYDiHBVdeYjAk=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <5bfb2544-402b-d6e1-9a8a-027e36a60acd@suse.com>
Date: Thu, 16 Sep 2021 16:07:40 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <29091674-DCAE-4289-901E-9158FD029D96@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com>
 <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com>
 <5bfb2544-402b-d6e1-9a8a-027e36a60acd@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0192.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::17) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 488a7de5-8727-4ee3-9b79-08d97923c941
X-MS-TrafficTypeDiagnostic: PA4PR08MB6141:|PAXPR08MB7153:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB7153A70A9F57C57AB7B2A001E4DC9@PAXPR08MB7153.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EaEyweubzC1matEdu9ye2yaTz9YvBAvG49affzWTtmHZ0Hk2K8S5im9YUtmMz6YqbiG8LFitvIKpH4Ynd/rFXNh7NsR8zm3jqwZwk0W+kC5nXNc6VSHB+4R3RtbU+bThlL2U5oTlad3HtWRVkVGgGKOZ6bA6dlPi/kC7aRTcwyo4/dx65f5fuA2GI8KPaLdjSwrq4GDN+CDWBnWiUCuNeMK9Bu1Q8ZwB/a5ax+WfOpxHZl0Qb173Xzne/G0BmP1zMeH77UHqmHn7MZ5iS73Tnn/yiIR45ZCu/lBAj9ak1xCouLxHrAAIPYjQfdPLuccHtI4EJGtpCi6MZg413yPN9qjUDhCeUIFwCC+tcmrubaXSQ9NtxwOcEZQwnWMwhzxPPqMKUSWZa+pCQ+AR2mVXhDZ/j1k0gl8BCGKK0OI5C3I4dM6fZHA3CXyyXHIFFqXfL2kMxwpSxaXZdBwgVPhxbWKCkVBlcJGNheaAz8j5Oxnzl1aq3fp439BWaRDN0y4S1WkQhDSr2VVNw4nDBtAUS+PlJS+lwHMWFvq0jzlmmc3IQZSp3xJ03IM75wTk/xxCVV27n6qK7sKR2JJmE0isCD4N6l1hawAZ/c62FFwobVg05KP0iEMAAReNxf2EQtfexIzglzPoDZz6RUJRiZPRdiubx57APfgdHFLXCngknBClfYbpxFFOAuymJvmYwPjraesOnLCjOXtYzuslBEPHSLlRhSEWEMfIZyR5FHEBsvWDeZlYNsUGAONQ1d1hCvxi
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(54906003)(8676002)(38100700002)(38350700002)(8936002)(6486002)(6512007)(44832011)(83380400001)(2616005)(956004)(86362001)(6666004)(6506007)(6916009)(26005)(52116002)(33656002)(66476007)(36756003)(508600001)(2906002)(66556008)(186003)(53546011)(66946007)(5660300002)(316002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6141
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c6a587a-c057-49a2-a4f4-08d97923be4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AFF481TkD4ZIYn/1ATyTbN8BiwmQG00/IGrTbowX6rgJWWUnrpjZi1GzjKeQ7D32o/fcgkF2mc0gWES6B3GX1x78zWuV1Un2nWsOmwvFKNd/zjkuA9eS90B6xFJTx/JlIEKK5S2qI/4jy4Pia3ecnb+nRulgIR4oGFbSBpypAwGxAooFVIFHSWD9zAVOZEfHxmBWSvzGhy1iriPbAPOi9+EQwUEMUDhf4v+dn2Em7Xi0dVo4FkT8SWAJwrJ1xV0QVvVS6ir81Uw6JVvVUXK6zLcIZ7bNTKo8Z9kUqixC7u3US067av7vJAaS9GFXmzGR2YaJZ+N6fCKe88d9ILpiQfIZmLPByHBsgoc3Pn80jKS3j47keaCTHhnta+mrlaWD9SZWd3Ou55NmfTxVaU3nN1zp4NUlr73fVRjc+QxcbqSByAlXlU/PjAT+lQ/89OiS5TVRqkMFH/I4KWR6SVqKXzfrYgozo11UFAVyeg4DElWS62IvDvilVKN6dWxq81oNNX3k1aBV9GQOX78T+f+n5NtFsMMm1J2e0rpOqpZOs9ypxNFY/fZr/mL7HoUaqjbiC2fFG6oo0WB+KgfzbcamT+cIXEZzkIrkbR8ZlgfW4nDILSeJbpLo0AJzFuToPG+hdXXR9e6q71F5s06deOy1HW0ep3qkHt0a5z9yHsaiZHPalNM229m2RoxpFtNCVs9HEyvS987MfnJ5IAkB47IcDuk5JbHSkcncj0FrrDtFVes=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(46966006)(36840700001)(2616005)(6862004)(54906003)(316002)(356005)(81166007)(36756003)(70206006)(86362001)(82740400003)(82310400003)(47076005)(36860700001)(478600001)(6486002)(6666004)(8936002)(6512007)(8676002)(26005)(6506007)(5660300002)(53546011)(186003)(83380400001)(4326008)(2906002)(336012)(70586007)(44832011)(33656002)(956004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 15:08:05.6412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 488a7de5-8727-4ee3-9b79-08d97923c941
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7153



> On 16 Sep 2021, at 13:15, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 16.09.2021 13:28, Luca Fancellu wrote:
>>> On 16 Sep 2021, at 09:46, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 15.09.2021 16:26, Luca Fancellu wrote:
>>>> --- a/xen/arch/arm/efi/efi-boot.h
>>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>>> @@ -8,9 +8,39 @@
>>>> #include <asm/setup.h>
>>>> #include <asm/smp.h>
>>>>=20
>>>> +typedef struct {
>>>> +    char* name;
>>>=20
>>> Misplaced *.
>>=20
>> I was looking in the CODING_STYLE and I didn=E2=80=99t found anything th=
at mandates
>> char *name; instead of char* name; but if you prefer I can change it sin=
ce I have
>> to do some modification to the patch.
>=20
> I don't think it's reasonable to spell out there every little detail.
> You should also take adjacent code into consideration, making yours
> match. Issues only arise when there's bad code that you happen to
> look at.
>=20
>>>> @@ -1285,14 +1286,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_T=
ABLE *SystemTable)
>>>>            efi_bs->FreePool(name.w);
>>>>        }
>>>>=20
>>>> -        if ( !name.s )
>>>> -            blexit(L"No Dom0 kernel image specified.");
>>>> -
>>>>        efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
>>>>=20
>>>> -        option_str =3D split_string(name.s);
>>>> +#ifdef CONFIG_ARM
>>>> +        /* dom0less feature is supported only on ARM */
>>>> +        dom0less_found =3D check_dom0less_efi_boot(dir_handle);
>>>> +#endif
>>>> +
>>>> +        if ( !name.s && !dom0less_found )
>>>=20
>>> Here you (properly ) use !name.s,
>>=20
>> This is not my code, I just added && !dom0less
>=20
> Correct, which is why this is fine.
>=20
>>>> +            blexit(L"No Dom0 kernel image specified.");
>>>> +
>>>> +        if ( name.s !=3D NULL )
>>>=20
>>> Here you then mean to omit the "!=3D NULL" for consistency and brevity.
>>=20
>> I usually check explicitely pointers with NULL, is it something to be av=
oided in Xen?
>> There are some industrial coding standards that says to avoid the use of=
 ! operator
>> with pointers. Is it important here to do !name.s instead of the solutio=
n above?
>=20
> As you can see from neighboring code, we prefer the shorter forms,
> for being easier/shorter to read.

Ok

>=20
>>>> +            option_str =3D split_string(name.s);
>>>>=20
>>>> -        if ( !read_section(loaded_image, L"kernel", &kernel, option_s=
tr) )
>>>> +        if ( (!read_section(loaded_image, L"kernel", &kernel, option_=
str)) &&
>>>=20
>>> Stray parentheses.
>>=20
>> Will fix
>>=20
>>>=20
>>>> +             (name.s !=3D NULL) )
>>>=20
>>> See above.
>>=20
>> Will fix
>>=20
>>>=20
>>> I also don't think this logic is quite right: If you're dom0less,
>>> why would you want to look for an embedded Dom0 kernel image?
>>=20
>> This is common code, that check is not from my patch.
>=20
> It is you who is adding the name.s !=3D NULL part, isn't it?

Ok I think the logic needs to be explained because also the name dom0less
Is a little bit misleading, I will explain below.

Short answer for now: if there is no dom0 kernel embedded in Xen and name.s=
 is NULL,
do not try to load something or check dom0 command line because there is no=
 dom0.

>=20
>> Before this serie, EFI boot requires that a dom0 module was passed, othe=
rwise
>> the boot was stopped.
>>=20
>> This serie instead removes this requirement, letting the boot continue i=
f there is no dom0
>> kernel.
>>=20
>> However (as in the old code) if the user embed the dom0 kernel in the im=
age, then it is
>> legit to use it and if there are also other domUs specified by DT, then =
the system will
>> start the dom0 kernel and the domUs kernel as well.
>=20
> This doesn't match what I would expect - if configuration tells
> to boot dom0less, why would an embedded Dom0 kernel matter? I can
> see that views might differ here; you will want to write down
> somewhere what the intended behavior in such a case is.

I explain here my understanding on dom0less, this feature is used to start =
domUs at
Xen boot in parallel, the name is misleading but it doesn=E2=80=99t require=
 dom0 to be absent.

So if you have a dom0 kernel embed in the image, it's completely fine to st=
art it and it=20
doesn=E2=80=99t have to be skipped.

Here the possible user cases:
1) start only dom0 [dom0 modules on xen.cfg or embedded in Xen image]
2) start only domUs, true dom0less [no dom0 modules on xen.cfg or embedded =
in Xen image, domUs on DT]
3) start dom0 and domUs [(dom0 modules on xen.cfg or embedded in Xen image)=
 and domUs on DT]

Let me know your thoughts about that.

Cheers,

Luca


>=20
> Jan
>=20
>=20


