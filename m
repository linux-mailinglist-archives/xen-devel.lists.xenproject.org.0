Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE288445BC5
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 22:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221907.383835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mikWK-0002Yp-Og; Thu, 04 Nov 2021 21:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221907.383835; Thu, 04 Nov 2021 21:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mikWK-0002WM-LX; Thu, 04 Nov 2021 21:43:40 +0000
Received: by outflank-mailman (input) for mailman id 221907;
 Thu, 04 Nov 2021 21:43:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t6+c=PX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mikWJ-0002WG-HM
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 21:43:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43d4b1fa-3db8-11ec-9787-a32c541c8605;
 Thu, 04 Nov 2021 22:43:37 +0100 (CET)
Received: from AS9PR06CA0028.eurprd06.prod.outlook.com (2603:10a6:20b:462::16)
 by AS8PR08MB6263.eurprd08.prod.outlook.com (2603:10a6:20b:290::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 21:43:34 +0000
Received: from VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::c1) by AS9PR06CA0028.outlook.office365.com
 (2603:10a6:20b:462::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Thu, 4 Nov 2021 21:43:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT037.mail.protection.outlook.com (10.152.19.70) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Thu, 4 Nov 2021 21:43:32 +0000
Received: ("Tessian outbound d49ee2bec50d:v108");
 Thu, 04 Nov 2021 21:43:32 +0000
Received: from d0445c77d051.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F8B96258-7C71-4142-BFBB-0E0444EED0B3.1; 
 Thu, 04 Nov 2021 21:43:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d0445c77d051.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 Nov 2021 21:43:21 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6575.eurprd08.prod.outlook.com (2603:10a6:102:156::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Thu, 4 Nov
 2021 21:43:19 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Thu, 4 Nov 2021
 21:43:19 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0116.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:c::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 21:43:18 +0000
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
X-Inumbo-ID: 43d4b1fa-3db8-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjGjs5IFfPBLprncu1qpCBVOm0VVfMuJ2lAecmxQRBw=;
 b=aKycb4pgR0COXw6egKz17jb9uj93jaEg/piyUbLiFBxpKsQF/WJwGfPrao+tazahVf9mQkmdWboLqYWBgYSrjrdKa49TYGbCH6q1CBwVLOKY3QsWdY77LiUNT7pp8vtaq6Li9WjntWrZSVB6UaRhWEeUbo8APpffuZVjV00N1Zg=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=temperror action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4eed59951c45e2eb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5AuFLyZGrhCf0hLwkUSHVAxTNKmAg8CXUJx3XHBrKPytxyA81izc0qnrVeT1QYTykXMI5vhb55ENfUHGMC2CHeXuMwJ1Usu8+amEZLBgVWhVFVSjYAQZGSiwSdpOQQLABSs/jqaPPLxUItfhxPXf7SMapo4StTcjRcsqqhROLyE8U95ulpae8OQ8oqm1jknX2HBdSWaEDVOIG2/63166zMy1mT7ejnTp/zx73orhshxDecd/lnuye8FUWf+MCBGVlqLLNjH8BnOl2Hrpdzn8qv9GoY0+mi7wkmR1jh+q9Qa1qgXQ2QpQqzstBO1zXSNH8NZfG+L2JZjVo8m1qab8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjGjs5IFfPBLprncu1qpCBVOm0VVfMuJ2lAecmxQRBw=;
 b=dBggIqhw8J3LZWfLMptT0fOrwlQ8gXuyOhfT4DwIKX2THA8JMIXkFQ+m17ZnJVCLAAQtgWOAaPdzGsbMWt8ne6AT2PiuI0GX9GNCaIZLu/TEBVzoj4ELdHP0RIjsbWeVpk1ADoP7uTB8t4+tbF9a7YZJ5nWHPDOGEpl/WTVjrcSN9CmcSB/xl2xtbIEZkZUwoLclr/KpIp2fWPngounxHHoDK2Vq0vThAL+syCFL27TZDx/dm0LUGfdqF5uyieUJHP3aFLhrVeYFLUKxKNJWSaRsT6szJHbapDZkyFZpYYiC6hyWJ6aLAQbPN75kOR2DP9FYyx0z9rJRLQ+skGvc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjGjs5IFfPBLprncu1qpCBVOm0VVfMuJ2lAecmxQRBw=;
 b=aKycb4pgR0COXw6egKz17jb9uj93jaEg/piyUbLiFBxpKsQF/WJwGfPrao+tazahVf9mQkmdWboLqYWBgYSrjrdKa49TYGbCH6q1CBwVLOKY3QsWdY77LiUNT7pp8vtaq6Li9WjntWrZSVB6UaRhWEeUbo8APpffuZVjV00N1Zg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
Date: Thu, 4 Nov 2021 21:43:12 +0000
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::32) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59f44a63-8cca-4eec-82a3-08d99fdc25d5
X-MS-TrafficTypeDiagnostic: PAXPR08MB6575:|AS8PR08MB6263:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB62636830F900379A074E8E87E48D9@AS8PR08MB6263.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:353;OLM:353;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 wSxjAt5QBRGINJ/3XLYn3CJRJxNX6C7f1SPRfMt7oaHb/XuvGaKo/hKvmeCtftJRVobU3sGYH6ZNf4eZgWq8gpRGWFqar4pI4kLSSzAWfpv6TlxFRpMOsmyr+r/8rnR4yr9j759QsWMjxEgG2h/NBwNiwxL1ce1untY5y0Wqdiy1ZwdBQJcyIqoAUcxDfDrpb447EwopMcsKyd331fWwJFzekC3CBvXS30gUp3d6NBPz7/uaFhyipggnsbCULBF8gvuI2GA9u/bmrHj36GblZFI3ymtIdOU+3VR1n2bh87Sz+k3x/bfb26Bi3UsCyf0dJp9anHKuC0ZovUrjdZtq5qc1onCXoWvRWxmZDSjCuGHLM4b17A4uNVdeD31s1dhb+R9GDopijcBQZ2CM5Bgq8xdO4ld5yKPfHIJLnmllnGg6Kq2OhauFeyAPpj4OkG/6j/XtLXHCwSbFWd53q1GojD7wCLpoIgnUvi+De9iBN/lsqt4Nnm06mmGdJMSltwElKcPQ17zvySED2L3Eb2dEctUuph3aeTgATA4BHXN9b5HAMoTeeQlkD3wbenn0EJuZ24mt0xonb4DjvnB35epBKIOKYdHWFrScvE5iFeQ4auVqn+oMZZSiB2bIglOMVq9CCTqFHvduYNE64eV+vtbF2IsWd8aRrl9xOsjkWcGrf5tqixlb/hV/CZ3xeVMBkqYFx9I4uIYfpazN2VMh8aC50e3g+11W/nkJADRANk8Qi2PjwwG2PeMt0NVPZHbRCwD+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(4326008)(83380400001)(66476007)(66556008)(956004)(8936002)(36756003)(33656002)(6916009)(26005)(44832011)(54906003)(8676002)(5660300002)(6486002)(66946007)(86362001)(52116002)(38100700002)(6666004)(316002)(38350700002)(508600001)(6506007)(53546011)(2906002)(2616005)(186003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6575
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	05a315ac-36b7-4fab-28d2-08d99fdc1ddb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+q4kVTG3PG0455zZVXxLgGVaOdu/3fv1QuRE1ukXstSUIsAb/akzsjUSnyUUC671ellQ8rixMRsNixbf03nduZbcm+w3n/TQnkfeo6EPRnICvpItKHAEMhbvj3DfYO0S/83v2Skc28MLqUe3c4agMQMGGqr2kBKL1rPoi/PbRoqTCudiRQn9arTs5MR1dZMY2QAxwg0uXUpWuwXx8AssDY4yIpPxMnSxmbgudpayQdsl/euQXuqUsCihh4iuSFJvZKfpvFmnfyV+LzpeXbe+NxQjvBLOBmmyUyb2LZ1bcxB0klFyYechNbkMR460q3dzh+jyQnOUu6pyfV1CHuEouwfF/moQ/G1ePlsXIOREV1MnKweztlTlrJR0vSs3AhL2srirGU6SoXvCBcAQ7ZAm+6lKECWHkLwCwFM+g/NdWCiASaC21U77ezmGFXhzgQMWDosCskbZ3cFuDTPlSWUViaUSz3kfO/bz+RVvAw68UZyCVs3g2xOvk45B66Y/ew5DA5ofMOUEC4wwKrIFjq+AjiOku8dOyzRSAJsP7ZtmLrr/fYe1Z8x27Fk9Wvaktbat74PWJvUG5qrGFn8jqT9wYhgaxrW+SywAdiaqPex3keRtBdghyrWOII3FEnuvHrSE3DRvXr62Fpe6VOX6Dg7srvbSliGdOMzLb1VprN9MdazW/clEp3W6h7ciy91jcZxYdoeBd5FNzYshZbg83Bx1PNjPzByhb54UVIPs4xFniIs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(2906002)(4326008)(86362001)(54906003)(356005)(508600001)(6862004)(6666004)(81166007)(70206006)(316002)(6512007)(33656002)(70586007)(36860700001)(8936002)(336012)(186003)(47076005)(36756003)(26005)(82310400003)(956004)(83380400001)(2616005)(44832011)(5660300002)(53546011)(6506007)(8676002)(63370400001)(6486002)(63350400001)(45980500001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 21:43:32.4614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f44a63-8cca-4eec-82a3-08d99fdc25d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6263



> On 4 Nov 2021, at 21:35, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Thu, 4 Nov 2021, Luca Fancellu wrote:
>>> On 4 Nov 2021, at 20:56, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>=20
>>> On Thu, 4 Nov 2021, Jan Beulich wrote:
>>>> On 04.11.2021 15:12, Luca Fancellu wrote:
>>>>> --- a/xen/common/efi/boot.c
>>>>> +++ b/xen/common/efi/boot.c
>>>>> @@ -449,6 +449,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(=
EFI_LOADED_IMAGE *loaded_image,
>>>>>    CHAR16 *pathend, *ptr;
>>>>>    EFI_STATUS ret;
>>>>>=20
>>>>> +    /*
>>>>> +     * Grub2 running on top of EDK2 has been observed to supply a NU=
LL
>>>>> +     * DeviceHandle. We can't use that to gain access to the filesys=
tem.
>>>>> +     * However the system can still boot if it doesn=E2=80=99t requi=
re access to the
>>>>> +     * filesystem.
>>>>> +     */
>>>>> +    if ( !loaded_image->DeviceHandle )
>>>>> +        return NULL;
>>>>> +
>>>>>    do {
>>>>>        EFI_FILE_IO_INTERFACE *fio;
>>>>>=20
>>>>> @@ -581,6 +590,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_=
handle, CHAR16 *name,
>>>>>    EFI_STATUS ret;
>>>>>    const CHAR16 *what =3D NULL;
>>>>>=20
>>>>> +    if ( !dir_handle )
>>>>> +        blexit(L"Error: No access to the filesystem");
>>>>>    if ( !name )
>>>>>        PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
>>>>>    ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
>>>>> @@ -1333,8 +1344,18 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_T=
ABLE *SystemTable)
>>>>>            EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
>>>>>                                                       &file_name);
>>>>>=20
>>>>> -            handle->Close(handle);
>>>>> -            *argv =3D file_name;
>>>>> +            if ( !handle )
>>>>> +            {
>>>>> +                PrintErr(L"Error retrieving image name: no filesyste=
m access."
>>>>> +                         L" Setting default to xen.efi");
>>>>> +                PrintErr(newline);
>>>>> +                *argv =3D L"xen.efi";
>>>>> +            }
>>>>> +            else
>>>>> +            {
>>>>> +                handle->Close(handle);
>>>>> +                *argv =3D file_name;
>>>>> +            }
>>>>>        }
>>>>>=20
>>>>>        name.s =3D get_value(&cfg, section.s, "options");
>>>>> @@ -1369,7 +1390,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TA=
BLE *SystemTable)
>>>>>    /* Get the number of boot modules specified on the DT or an error =
(<0) */
>>>>>    dt_modules_found =3D efi_check_dt_boot(dir_handle);
>>>>>=20
>>>>> -    dir_handle->Close(dir_handle);
>>>>> +    if ( dir_handle )
>>>>> +        dir_handle->Close(dir_handle);
>>>>>=20
>>>>>    if ( dt_modules_found < 0 )
>>>>>        /* efi_check_dt_boot throws some error */
>>>>>=20
>>>>=20
>>>> I'm sorry, but I think we need to take a step back here and revisit
>>>> the earlier change. If that hadn't moved obtaining dir_handle out by
>>>> one level of scope, nothing bad would have happened to the case that
>>>> you're now trying to fix, I understand? So perhaps that part wants
>>>> undoing, with efi_check_dt_boot() instead getting passed loaded_image.
>>>> That way, down the call tree the needed handle can be obtained via
>>>> another call to get_parent_handle(), and quite likely in the scenario
>>>> you're trying to fix here execution wouldn't even make it there. This
>>>> then wouldn't be much different to the image name retrieval calling
>>>> get_parent_handle() a 2nd time, rather than trying to re-use
>>>> dir_handle.
>>>>=20
>>>> Net effect being that I think get_parent_handle() would then again
>>>> only be called when the returned handle is actually needed, and hence
>>>> when failure of HandleProtocol() (for DeviceHandle being NULL just
>>>> like for any other reason) is indeed an error that needs reporting.
>>>=20
>>> In my opinion the current version is good enough. Regardless, I looked
>>> at your suggestion into details. As it took me some time to understand
>>> it, I thought I would share the code changes that I think correspond to
>>> what you wrote. Does everything check out?
>>>=20
>>> If so, I think it looks fine, maybe a bit better than the current
>>> version. I'll leave that to you and Luca.
>>>=20
>>>=20
>>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>>> index c3ae9751ab..9dcd8547cd 100644
>>> --- a/xen/arch/arm/efi/efi-boot.h
>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>> @@ -8,6 +8,8 @@
>>> #include <asm/setup.h>
>>> #include <asm/smp.h>
>>>=20
>>> +extern EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *load=
ed_image,
>>> +                                                CHAR16 **leaf);
>>> typedef struct {
>>>    char *name;
>>>    unsigned int name_len;
>>> @@ -54,7 +56,7 @@ static int handle_module_node(EFI_FILE_HANDLE dir_han=
dle,
>>>                              bool is_domu_module);
>>> static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>>>                                       int domain_node);
>>> -static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
>>> +static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
>>>=20
>>> #define DEVICE_TREE_GUID \
>>> {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa,=
 0xe0}}
>>> @@ -851,10 +853,14 @@ static int __init handle_dom0less_domain_node(EFI=
_FILE_HANDLE dir_handle,
>>> * dom0 and domU guests to be loaded.
>>> * Returns the number of multiboot modules found or a negative number fo=
r error.
>>> */
>>> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>>> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>>> {
>>>    int chosen, node, addr_len, size_len;
>>>    unsigned int i =3D 0, modules_found =3D 0;
>>> +    EFI_FILE_HANDLE dir_handle;
>>> +    CHAR16 *file_name;
>>> +
>>> +    dir_handle =3D get_parent_handle(loaded_image, &file_name);
>>=20
>> We can=E2=80=99t use get_parent_handle here because we will end up with =
the same problem,
>> we would need to use the filesystem if and only if we need to use it,=20
>=20
> Understood, but it would work the same way as this version of the patch:
> if we end up calling read_file with dir_handle =3D=3D NULL, then read_fil=
e
> would do:
>=20
>  blexit(L"Error: No access to the filesystem");
>=20
> If we don't end up calling read_file, then everything works even if
> dir_handle =3D=3D NULL. Right?

Oh yes sorry my bad Stefano! Having this version of the patch, it will work=
.

My understanding was instead that the Jan suggestion is to revert the place
of call of get_parent_handle (like in your code diff), but also to remove t=
he
changes to get_parent_handle and read_file.
I guess Jan will specify his preference, but if he meant the last one, then
the only way I see...

>=20
>=20
>> so the way I see
>> is to pass loaded_image down to the stack until allocate_module_file(=E2=
=80=A6), in this
>> function we can use get_parent_handle(=E2=80=A6) because the user wants =
us to do that.
>> The downside is that we must close the handle there, so for each loaded =
file we will
>> request and close the handle. Is this something we don=E2=80=99t bother =
too much?
>=20
> Yeah, that doesn't seem ideal.

=E2=80=A6 is this one.

>=20
>=20
>>>=20
>>>    /* Check for the chosen node in the current DTB */
>>>    chosen =3D setup_chosen_node(fdt, &addr_len, &size_len);
>>> @@ -895,6 +901,8 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE=
 dir_handle)
>>>        efi_bs->FreePool(modules[i].name);
>>>    }
>>>=20
>>> +    dir_handle->Close(dir_handle);
>>> +
>>>    return modules_found;
>>> }
>>>=20
>>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>>> index 112b7e7571..2407671a7d 100644
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -167,7 +167,7 @@ static void __init PrintErr(const CHAR16 *s)
>>> }
>>>=20
>>> #ifndef CONFIG_HAS_DEVICE_TREE
>>> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>>> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>>> {
>>>    return 0;
>>> }
>>> @@ -439,8 +439,8 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
>>>    return argc;
>>> }
>>>=20
>>> -static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *load=
ed_image,
>>> -                                                CHAR16 **leaf)
>>> +EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_imag=
e,
>>> +                                         CHAR16 **leaf)
>>> {
>>>    static EFI_GUID __initdata fs_protocol =3D SIMPLE_FILE_SYSTEM_PROTOC=
OL;
>>>    static CHAR16 __initdata buffer[512];
>>> @@ -1236,9 +1236,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>>=20
>>>    efi_arch_relocate_image(0);
>>>=20
>>> -    /* Get the file system interface. */
>>> -    dir_handle =3D get_parent_handle(loaded_image, &file_name);
>>> -
>>>    if ( use_cfg_file )
>>>    {
>>>        UINTN depth, cols, rows, size;
>>> @@ -1251,6 +1248,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>>=20
>>>        gop =3D efi_get_gop();
>>>=20
>>> +        /* Get the file system interface. */
>>> +        dir_handle =3D get_parent_handle(loaded_image, &file_name);
>>> +
>>>        /* Read and parse the config file. */
>>>        if ( read_section(loaded_image, L"config", &cfg, NULL) )
>>>            PrintStr(L"Using builtin config file\r\n");
>>> @@ -1344,18 +1344,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>>            EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
>>>                                                       &file_name);
>>>=20
>>> -            if ( !handle )
>>> -            {
>>> -                PrintErr(L"Error retrieving image name: no filesystem =
access."
>>> -                         L" Setting default to xen.efi");
>>> -                PrintErr(newline);
>>> -                *argv =3D L"xen.efi";
>>> -            }
>>> -            else
>>> -            {
>>> -                handle->Close(handle);
>>> -                *argv =3D file_name;
>>> -            }
>>> +            handle->Close(handle);
>>> +            *argv =3D file_name;
>>>        }
>>>=20
>>>        name.s =3D get_value(&cfg, section.s, "options");
>>> @@ -1383,15 +1373,14 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TA=
BLE *SystemTable)
>>>        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>>>        cfg.addr =3D 0;
>>>=20
>>> +        dir_handle->Close(dir_handle);
>>> +
>>>        if ( gop && !base_video )
>>>            gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>>>    }
>>>=20
>>>    /* Get the number of boot modules specified on the DT or an error (<=
0) */
>>> -    dt_modules_found =3D efi_check_dt_boot(dir_handle);
>>> -
>>> -    if ( dir_handle )
>>> -        dir_handle->Close(dir_handle);
>>> +    dt_modules_found =3D efi_check_dt_boot(loaded_image);
>>>=20
>>>    if ( dt_modules_found < 0 )
>>>        /* efi_check_dt_boot throws some error */


