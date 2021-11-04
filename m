Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 240CD445B85
	for <lists+xen-devel@lfdr.de>; Thu,  4 Nov 2021 22:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221893.383813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mijy2-0006QO-T3; Thu, 04 Nov 2021 21:08:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221893.383813; Thu, 04 Nov 2021 21:08:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mijy2-0006N3-Oy; Thu, 04 Nov 2021 21:08:14 +0000
Received: by outflank-mailman (input) for mailman id 221893;
 Thu, 04 Nov 2021 21:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t6+c=PX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mijy1-0006Mx-QJ
 for xen-devel@lists.xenproject.org; Thu, 04 Nov 2021 21:08:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51a734a6-3db3-11ec-a9d2-d9f7a1cc8784;
 Thu, 04 Nov 2021 22:08:12 +0100 (CET)
Received: from DU2PR04CA0078.eurprd04.prod.outlook.com (2603:10a6:10:232::23)
 by VI1PR08MB3695.eurprd08.prod.outlook.com (2603:10a6:803:c4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Thu, 4 Nov
 2021 21:08:04 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::85) by DU2PR04CA0078.outlook.office365.com
 (2603:10a6:10:232::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Thu, 4 Nov 2021 21:08:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Thu, 4 Nov 2021 21:08:03 +0000
Received: ("Tessian outbound 2bb1f94ba47e:v108");
 Thu, 04 Nov 2021 21:08:03 +0000
Received: from 001c86edd1b5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 728837AD-63E8-4068-9BB7-9145D32321D8.1; 
 Thu, 04 Nov 2021 21:07:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 001c86edd1b5.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 Nov 2021 21:07:53 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB4778.eurprd08.prod.outlook.com (2603:10a6:101:21::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 4 Nov
 2021 21:07:50 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Thu, 4 Nov 2021
 21:07:50 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0057.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Thu, 4 Nov 2021 21:07:49 +0000
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
X-Inumbo-ID: 51a734a6-3db3-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAqMqeLlUmdZdU4YPJ925G9WTajx+NrU2nRO88OXSY0=;
 b=WNGytKE09EKuao3vRgF85KYbGxEJsuBmRRPA9uo3vXbJl3XjdJ8BfLnpE6kBaS9XoewVnHAngQ7kPbzGylMnyby9AC2YmYrDHW0Zq1mBjfH1FfSoY+iBv57+Mc5HprCCj7ZQTw9Pi6EM8qmlnG+5FDnNqPGTlBPfx16I1uKzpx8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 112ae79f2d09ca4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+YyINbtx+Hs6fDg2q80f/hGhgSWp3lkx+WI7Mw8/zFBfUG1cnBtG20tXg37Y91H5pxTHE3CJM15Kv3KYTN5vOCNjOxm5Y0c3BnusmwxE80uCNVDze/wjhArz5ZK+N1R1/ZW2MRfa+gDfwk45sC8RqOmGqbEg0+5IM0ccmQrY6jhaTT/QMAjGkv0my/mucW7SDzY5oMh0L9AvY6nLeECYk0s2Yxkn6W5VQ1Fju1oFeXrLDzl3ZsxmtbZEoTw86rJdp6wfCeLogBL3TgBPLsUV19PIqnGyd7UM2alA90+YbeOvshIa/J7LveiRNOe/AUTat3yiroFs9vzj+aLUo+kAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAqMqeLlUmdZdU4YPJ925G9WTajx+NrU2nRO88OXSY0=;
 b=ag0BL+sHcLfks7AiRLaXg1Es99km8cEQIvzwRU4ZWYZBs4imBVifiAZlNNROMZH3yccIz1U3MiGa3TYJH6WhZxfrYqFEgnYZ3L2YFGqj2q8pHFHJXG/Pu9fua6YmtAYZ5MWyXLT08HL0NSTAqzSLcdqSal8FH2gCsNp1k8ZH0ft/V/Qa0H8J9zdYov0Flrb1YTxV2kMNTUbnxBc239h1EfPYAYnVqqM2/fHtNhbLy/VT5mW5OndowHIT3G14Tw1srUIibjmlCtzgGF46psTGkO5gk4NlHPk4uBNxzB8zDM0Vc713JwCoTTg06P63IcmOZhXq8w+JMmbDvO0ExQtDvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAqMqeLlUmdZdU4YPJ925G9WTajx+NrU2nRO88OXSY0=;
 b=WNGytKE09EKuao3vRgF85KYbGxEJsuBmRRPA9uo3vXbJl3XjdJ8BfLnpE6kBaS9XoewVnHAngQ7kPbzGylMnyby9AC2YmYrDHW0Zq1mBjfH1FfSoY+iBv57+Mc5HprCCj7ZQTw9Pi6EM8qmlnG+5FDnNqPGTlBPfx16I1uKzpx8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
Date: Thu, 4 Nov 2021 21:07:43 +0000
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::21) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d42c212a-5c8d-4f97-e6fc-08d99fd730f8
X-MS-TrafficTypeDiagnostic: PR2PR08MB4778:|VI1PR08MB3695:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3695DEE2E1C5261540FC0BE2E48D9@VI1PR08MB3695.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:366;OLM:366;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sMQNKaVzUMqWUfCBVx3bCsWjDLZLkH2YuVVm0knRkWbLh1UhT7gDcu1UGUHaxzjAGX/nZx9fe+zMClEXnX49Mv9MGWamWsCCGjJjI0B+OICF5Btg+Q33IuYLDIXhwTcGRN5ldUlhdCf2m4HsAnTo5nxzaXAEjv+T7BHQJMESkQwspcWqu2FA14P1XxJzdWiBNq4YoG4Jb39L5xS0/8EWz0B97vHjeYMiFLfcV41wLLGjB3aHb55QOOtfkQ74XcouXSrCZQzIacb62OYzA/mpqBh9GXpSibH5/F9O3Qpn8S3LvZvgdXkBUorlWQcfWpM6ieI9X6Ot2JGfmy2rtu3agFchxG4dv8c7w/ysptLdqpQ5XBZH8mt/YX6xq8bbr89rNIzqESl/qCSbOFWAVYJT9zqx4FNcHiZw8uCIBua0PRhiBTnDHpPDIzLcpYBzCL78ONNqev7Pa4fg46pYIg9eT2U0prX6iWXK0fZn1DdQf/PIAsIPaoVwCqwv2/OHmPotqLxNGucUHqzwe3r61T/PORQDoieoR2KNz8HxmzC9rLqYxkc2rn6TZ+4/XxQXg9WbiVLhFmJr2p1A8Pr9gNcDRj9MiF3wEQ0XbuhGz64TJghQlZS455ToVJnKqKzociJPkjoYZpka3i0QvAvTnb/1QO0oLMNuWdR8dIgmclU5Azw3jOAH8SedFAcC23kmZ3m5R4bfGdj8VA3E2IanQ+8v5etzuc6t5uSsai7L/s4SZbI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(33656002)(8936002)(66556008)(66476007)(956004)(66946007)(38350700002)(8676002)(186003)(6666004)(44832011)(6506007)(26005)(2616005)(6916009)(54906003)(36756003)(2906002)(508600001)(316002)(86362001)(4326008)(6486002)(83380400001)(5660300002)(53546011)(52116002)(6512007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4778
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f66d6a60-eddd-4f8d-5874-08d99fd728d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s4vtpOeBL5gCV1HBIJtlZffE0cCLYZp9jU8EyZXb/+kgjjBYEKm2lQaK0J4AfqPDNkw+M0ioNzGgRe5CvwQ3eqZaI8R8fA2Bm1/3gxsgLympfwE0acSfYCUFTrK9uk2IYit42dq0HkzXIxJmwjIztSi8q785BUhcwA8+uuglMBIQVThe/sqZh3IbI9jmhT4XaEGsSUhEPd6mKCDdSapgIuq3G5tN6rMHr5tCnbvaaT6vNqpvjvKGxWxZZCFvkV6wPXy9RBHFbFeospj6Fd/inNli+pfTlqPoNM72aFZOccQ5MO+syGRseBCPJDh6hT5eo3gqDlkbB+Z60nGa4ChG02+AiybF9Qz/5oTiEzdxpU0zdsPDSPZjm1qwWlbskPPc8+hEwyno8gSm/gPfTEFQ9KZheOyGXCZOKjtb0aQOEUHM9kQY072RnlcVSbTfmjU82cpCWbfJ/CVah5nXUBdzkFj5P9EXxdV0AQPYiA9k7BRdz+zYKAroXlgixUdyq0FczXNtqfEKp76JZilht/O2CbQI/Hn3Ii1KzEl9cZABF3MNaemeCvcTci0imW6cJ/vo+OaMONk0YoEameyH1nOyuh7O84w63JvtYAGME7Y26/EYWx7qoVeQbNhzmcO3d4brWJcwtieYCDcxcRX/sbB4zEZLqVk2adIQ6KKa8sb0ezN0+EpcOmKp4o2TzjpAUVT3IqvVeBz4ATbmx8NfqM8nSw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36860700001)(316002)(6486002)(70206006)(70586007)(54906003)(33656002)(956004)(6512007)(6666004)(2616005)(6862004)(8936002)(2906002)(44832011)(4326008)(26005)(82310400003)(81166007)(53546011)(6506007)(8676002)(336012)(86362001)(5660300002)(36756003)(47076005)(508600001)(83380400001)(186003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 21:08:03.7894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d42c212a-5c8d-4f97-e6fc-08d99fd730f8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3695



> On 4 Nov 2021, at 20:56, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Thu, 4 Nov 2021, Jan Beulich wrote:
>> On 04.11.2021 15:12, Luca Fancellu wrote:
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -449,6 +449,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(EF=
I_LOADED_IMAGE *loaded_image,
>>>     CHAR16 *pathend, *ptr;
>>>     EFI_STATUS ret;
>>>=20
>>> +    /*
>>> +     * Grub2 running on top of EDK2 has been observed to supply a NULL
>>> +     * DeviceHandle. We can't use that to gain access to the filesyste=
m.
>>> +     * However the system can still boot if it doesn=E2=80=99t require=
 access to the
>>> +     * filesystem.
>>> +     */
>>> +    if ( !loaded_image->DeviceHandle )
>>> +        return NULL;
>>> +
>>>     do {
>>>         EFI_FILE_IO_INTERFACE *fio;
>>>=20
>>> @@ -581,6 +590,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_ha=
ndle, CHAR16 *name,
>>>     EFI_STATUS ret;
>>>     const CHAR16 *what =3D NULL;
>>>=20
>>> +    if ( !dir_handle )
>>> +        blexit(L"Error: No access to the filesystem");
>>>     if ( !name )
>>>         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
>>>     ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
>>> @@ -1333,8 +1344,18 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>>             EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
>>>                                                        &file_name);
>>>=20
>>> -            handle->Close(handle);
>>> -            *argv =3D file_name;
>>> +            if ( !handle )
>>> +            {
>>> +                PrintErr(L"Error retrieving image name: no filesystem =
access."
>>> +                         L" Setting default to xen.efi");
>>> +                PrintErr(newline);
>>> +                *argv =3D L"xen.efi";
>>> +            }
>>> +            else
>>> +            {
>>> +                handle->Close(handle);
>>> +                *argv =3D file_name;
>>> +            }
>>>         }
>>>=20
>>>         name.s =3D get_value(&cfg, section.s, "options");
>>> @@ -1369,7 +1390,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>>     /* Get the number of boot modules specified on the DT or an error (=
<0) */
>>>     dt_modules_found =3D efi_check_dt_boot(dir_handle);
>>>=20
>>> -    dir_handle->Close(dir_handle);
>>> +    if ( dir_handle )
>>> +        dir_handle->Close(dir_handle);
>>>=20
>>>     if ( dt_modules_found < 0 )
>>>         /* efi_check_dt_boot throws some error */
>>>=20
>>=20
>> I'm sorry, but I think we need to take a step back here and revisit
>> the earlier change. If that hadn't moved obtaining dir_handle out by
>> one level of scope, nothing bad would have happened to the case that
>> you're now trying to fix, I understand? So perhaps that part wants
>> undoing, with efi_check_dt_boot() instead getting passed loaded_image.
>> That way, down the call tree the needed handle can be obtained via
>> another call to get_parent_handle(), and quite likely in the scenario
>> you're trying to fix here execution wouldn't even make it there. This
>> then wouldn't be much different to the image name retrieval calling
>> get_parent_handle() a 2nd time, rather than trying to re-use
>> dir_handle.
>>=20
>> Net effect being that I think get_parent_handle() would then again
>> only be called when the returned handle is actually needed, and hence
>> when failure of HandleProtocol() (for DeviceHandle being NULL just
>> like for any other reason) is indeed an error that needs reporting.
>=20
> In my opinion the current version is good enough. Regardless, I looked
> at your suggestion into details. As it took me some time to understand
> it, I thought I would share the code changes that I think correspond to
> what you wrote. Does everything check out?
>=20
> If so, I think it looks fine, maybe a bit better than the current
> version. I'll leave that to you and Luca.
>=20
>=20
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index c3ae9751ab..9dcd8547cd 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -8,6 +8,8 @@
> #include <asm/setup.h>
> #include <asm/smp.h>
>=20
> +extern EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded=
_image,
> +                                                CHAR16 **leaf);
> typedef struct {
>     char *name;
>     unsigned int name_len;
> @@ -54,7 +56,7 @@ static int handle_module_node(EFI_FILE_HANDLE dir_handl=
e,
>                               bool is_domu_module);
> static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>                                        int domain_node);
> -static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
> +static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
>=20
> #define DEVICE_TREE_GUID \
> {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0=
xe0}}
> @@ -851,10 +853,14 @@ static int __init handle_dom0less_domain_node(EFI_F=
ILE_HANDLE dir_handle,
>  * dom0 and domU guests to be loaded.
>  * Returns the number of multiboot modules found or a negative number for=
 error.
>  */
> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
> {
>     int chosen, node, addr_len, size_len;
>     unsigned int i =3D 0, modules_found =3D 0;
> +    EFI_FILE_HANDLE dir_handle;
> +    CHAR16 *file_name;
> +
> +    dir_handle =3D get_parent_handle(loaded_image, &file_name);

We can=E2=80=99t use get_parent_handle here because we will end up with the=
 same problem,
we would need to use the filesystem if and only if we need to use it, so th=
e way I see
is to pass loaded_image down to the stack until allocate_module_file(=E2=80=
=A6), in this
function we can use get_parent_handle(=E2=80=A6) because the user wants us =
to do that.
The downside is that we must close the handle there, so for each loaded fil=
e we will
request and close the handle. Is this something we don=E2=80=99t bother too=
 much?

>=20
>     /* Check for the chosen node in the current DTB */
>     chosen =3D setup_chosen_node(fdt, &addr_len, &size_len);
> @@ -895,6 +901,8 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE d=
ir_handle)
>         efi_bs->FreePool(modules[i].name);
>     }
>=20
> +    dir_handle->Close(dir_handle);
> +
>     return modules_found;
> }
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 112b7e7571..2407671a7d 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -167,7 +167,7 @@ static void __init PrintErr(const CHAR16 *s)
> }
>=20
> #ifndef CONFIG_HAS_DEVICE_TREE
> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
> {
>     return 0;
> }
> @@ -439,8 +439,8 @@ static unsigned int __init get_argv(unsigned int argc=
, CHAR16 **argv,
>     return argc;
> }
>=20
> -static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded=
_image,
> -                                                CHAR16 **leaf)
> +EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded_image,
> +                                         CHAR16 **leaf)
> {
>     static EFI_GUID __initdata fs_protocol =3D SIMPLE_FILE_SYSTEM_PROTOCO=
L;
>     static CHAR16 __initdata buffer[512];
> @@ -1236,9 +1236,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
>=20
>     efi_arch_relocate_image(0);
>=20
> -    /* Get the file system interface. */
> -    dir_handle =3D get_parent_handle(loaded_image, &file_name);
> -
>     if ( use_cfg_file )
>     {
>         UINTN depth, cols, rows, size;
> @@ -1251,6 +1248,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
>=20
>         gop =3D efi_get_gop();
>=20
> +        /* Get the file system interface. */
> +        dir_handle =3D get_parent_handle(loaded_image, &file_name);
> +
>         /* Read and parse the config file. */
>         if ( read_section(loaded_image, L"config", &cfg, NULL) )
>             PrintStr(L"Using builtin config file\r\n");
> @@ -1344,18 +1344,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>             EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
>                                                        &file_name);
>=20
> -            if ( !handle )
> -            {
> -                PrintErr(L"Error retrieving image name: no filesystem ac=
cess."
> -                         L" Setting default to xen.efi");
> -                PrintErr(newline);
> -                *argv =3D L"xen.efi";
> -            }
> -            else
> -            {
> -                handle->Close(handle);
> -                *argv =3D file_name;
> -            }
> +            handle->Close(handle);
> +            *argv =3D file_name;
>         }
>=20
>         name.s =3D get_value(&cfg, section.s, "options");
> @@ -1383,15 +1373,14 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>         cfg.addr =3D 0;
>=20
> +        dir_handle->Close(dir_handle);
> +
>         if ( gop && !base_video )
>             gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>     }
>=20
>     /* Get the number of boot modules specified on the DT or an error (<0=
) */
> -    dt_modules_found =3D efi_check_dt_boot(dir_handle);
> -
> -    if ( dir_handle )
> -        dir_handle->Close(dir_handle);
> +    dt_modules_found =3D efi_check_dt_boot(loaded_image);
>=20
>     if ( dt_modules_found < 0 )
>         /* efi_check_dt_boot throws some error */


