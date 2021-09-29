Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FEA41C35F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 13:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199008.352809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVXg1-0001AX-Ew; Wed, 29 Sep 2021 11:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199008.352809; Wed, 29 Sep 2021 11:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVXg1-00018N-Bl; Wed, 29 Sep 2021 11:23:05 +0000
Received: by outflank-mailman (input) for mailman id 199008;
 Wed, 29 Sep 2021 11:23:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzIg=OT=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mVXfz-00018H-Vo
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 11:23:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b6485a4-2117-11ec-bce3-12813bfff9fa;
 Wed, 29 Sep 2021 11:23:02 +0000 (UTC)
Received: from DU2PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:10:232::16)
 by DB7PR08MB3593.eurprd08.prod.outlook.com (2603:10a6:10:49::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 11:22:48 +0000
Received: from DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::c5) by DU2PR04CA0071.outlook.office365.com
 (2603:10a6:10:232::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Wed, 29 Sep 2021 11:22:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT029.mail.protection.outlook.com (10.152.20.131) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 11:22:48 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Wed, 29 Sep 2021 11:22:46 +0000
Received: from 8725d1e8244a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7698802B-D068-4C98-9568-35C73FBFB507.1; 
 Wed, 29 Sep 2021 11:22:35 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8725d1e8244a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 11:22:35 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB4794.eurprd08.prod.outlook.com (2603:10a6:101:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 11:22:32 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 11:22:32 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:150::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.13 via Frontend Transport; Wed, 29 Sep 2021 11:22:32 +0000
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
X-Inumbo-ID: 9b6485a4-2117-11ec-bce3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDZ4UAaVY9nZhTYxXxBTCLNMI93JXhz8iuH2JFsvWMQ=;
 b=mEtFnTgHzI2lfLE9tWtWu4pJS5E/JVBjDHI1J92iETLnBn8sZm/+tIH424v+9b5JfK1+RgQzQWrLYU5C3k7rDraPuIWtLJ1vRIpYvlKnHI2XJ3qHh74t0+xzLrJZoFgtMRbGn7Kn07zqw8bc5kCf+LvxzUjrHbAOTFRMcB8Ch8k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e46c1532b93b9f67
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AUiQDHmyooUefWf8Jgd6m0vQo6gNlTzPzAmcvGbevnsxdwVM/ruJViCctaXKiur9Mamo8Obwo4prHQp/kAMSG2VJE/rtc9NVYTABbgU9dqdB6/qOG53WvsIBxyYdGLrSz3mnfqsaJnvif7OeezbfLz15FLapnYwt2+ea94VUJbDTswRlMrq+O/qrKlLk3k8dBlL5J8ARhMMAMsoU3wpk67dagwg2ZgmvvdcjdX8I5oyCYvoyyt1b9HGPHxLoUrQDVt7GqnIiT2VfLcXtXIDuUoym53otMLxW+BjRNmZusn5b8bzBhvsnaCin1D+s/8G6k7b5EPGv95ganxaZuL2z0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=NDZ4UAaVY9nZhTYxXxBTCLNMI93JXhz8iuH2JFsvWMQ=;
 b=G+6Fn+5xDQN/HFYtn2EqfDNLrMtmcl2W/UQiY7RAAYMwPUyfduef3Danhnkh1bi8+GB0zqHbQtFVTz2A/+ktD4hcfAWNsBWFPCbfqCLIJSn+8UdSUKIS3eAwW8gzpQ2aoCUv2gtBgf7iHOnbjkqUd76YS7pe42hFnWeEtE+G4CAhqf0hdp93WOHej4G9SRgRGVWmosLEnG+InCxQf1+Lox0qfU/fWhS57aDuETkf9tz34/1E3coiOjHiJn3UrXdMIFmiIdcXDdtIwVKAujfdyjPk382BJM/92Yxct/21MljZwoNeGERLpctMj44830R28ktuzMwfcftrtWYpmtqvoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDZ4UAaVY9nZhTYxXxBTCLNMI93JXhz8iuH2JFsvWMQ=;
 b=mEtFnTgHzI2lfLE9tWtWu4pJS5E/JVBjDHI1J92iETLnBn8sZm/+tIH424v+9b5JfK1+RgQzQWrLYU5C3k7rDraPuIWtLJ1vRIpYvlKnHI2XJ3qHh74t0+xzLrJZoFgtMRbGn7Kn07zqw8bc5kCf+LvxzUjrHbAOTFRMcB8Ch8k=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v3 3/3] arm/efi: load dom0 modules from DT using UEFI
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <8f7422f7-8408-f33b-af2d-8e84dc0eab0a@suse.com>
Date: Wed, 29 Sep 2021 12:22:25 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9ABAA1A6-9756-461C-868D-145637B67EEC@arm.com>
References: <20210928163209.49611-1-luca.fancellu@arm.com>
 <20210928163209.49611-4-luca.fancellu@arm.com>
 <8f7422f7-8408-f33b-af2d-8e84dc0eab0a@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::8) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5d3579b-a2c5-490e-c5dd-08d9833b77b1
X-MS-TrafficTypeDiagnostic: PR2PR08MB4794:|DB7PR08MB3593:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB359378DAB3A738B94AEBAA81E4A99@DB7PR08MB3593.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 aUCgG8b4Gnc0DONUwyfFuCSfwSnGDeMaclzML7BRC0jcEN7W6K4/IeU62GL/vOSdRwvobUV5FmszsLsbPjTyT7g6xiaOw3yzJ1prz0sXWY2WsTChYPIi2g8YdUBBcrCUuvoRgre3uJtiWIm1n8Gvr6OX12IVoFzg9fhbo4xk2zWGZKecGYZFKOTqi4Hlk7XrQRBunM667azDSFDwY3toQ1egu/6Cw2RY1mW6TG/8qb/lbGI+C8Z0oUSU+t/15KNkvU47E8p1r1UsYq1F8PN1ED5uxV6C/gUXJqRl/reB29T2IuPX7B/vBFu2r/7sZWZ26Vc5NXTOTO4zP70MHdKSIfe/3UJn4n7QI/zUbpEMxQ+ZTG14z5kxTl0VosrXsAwKQEa1M9DVR4cjv4Rso2HXvasmNMVXs5Xc9k7H5kMV8xeQreg8+EPTHTi9F62tC+PecGzqxgy3Z1DSwr/8r8i0hYar0jvXnd8hE77oWqk9663C9mZ/UsgwxhZlSajymIHXmnXdjL/Wpn309XkG0eRfFSOM1wbGceDJYzuxhEnMaBZ5i3oc/TJztNof7e7+KkkhVfDf9imhMfhGDYF//6ZDVIiOucjNFMcgEUJGfF0lXrDHTkd8Ahfgc8ooNOgKv/9YA23LKWCi4AzYSVR3RcpZuXsbuDGnJyxiSGrtz92PDhUAk4VzOK8BWYETQNFXle3jvXUPn6st+7USDxjv8U0FC7klHqDSnjImsh/pmNuPymUQ75+mvfbR9Ap99GdSHwvw
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(38100700002)(38350700002)(8676002)(86362001)(6506007)(53546011)(508600001)(956004)(36756003)(6512007)(6486002)(2616005)(83380400001)(6666004)(6916009)(5660300002)(66476007)(66556008)(4326008)(33656002)(26005)(66946007)(8936002)(186003)(2906002)(316002)(44832011)(54906003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4794
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e58d8091-fba9-41b6-dc34-08d9833b6e42
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ziF6rQTcwJwlBtRd0OMkcM+ECSRw+uqud9BJOD8EetjwxGAC9LR1LFbZaar+2WQjebDcKHss1xY90Sky6kjZGzbsn/362DuuW1Iywh+IPWdPxZnu4QzsoWA8evem7vJKbWwZmJFGALNzppixnkIFALt+s0GL4+BPf63VE+Nm9tk9WANeAIE7bLrwatjnPNkKGNMC9IadzBY1Pgdcr9Bsc0bfp3XCPx7lBTpgIkZsThucr2idrGXlRECg4Sb1UWwHTUSPFY24jj2H+10tdL5tmvbEVsiOQNjlnXD5H+C/b4TGhdnw7Be05iXro4TmYfqWorPtWVwAU5kA3a7kjlOhabirTq5iY+vuDrNKVpO56wE2oL8uMxDBYty3EjVztPrPQj4cB2RGK2dIz+8lqKU2mqaw1H9ZKQa6MRgsIKUI4y0hFS5nUobl8Va7Npa1Abr8IgnReF0nXsxmaRzYMTC4K3EWd8yLaXslONGaZGUCGiDFUqAGB5ClmTWgFsyCfOGtTIiDaogxt/zaGjUHM4VhylBjwE779/8/sBjBs7KrmPpUcQJt20g83Ay4yK0SauFoV2KNLjgMfSzhg+7nMQkeh4O736G30Za5zmpVfCH8jkqVbn127s5TzSf7P/PmJf+ztbnbkfCvr1rmZIoo89EcVSxjDhr/YoWoWA3xEjwE8TepH1BGHDRtda5gAg9AiUZY7l4p7ZzfQW+KuEZ0l7cSnQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(4326008)(81166007)(956004)(5660300002)(54906003)(2906002)(6506007)(6862004)(44832011)(6486002)(316002)(26005)(70586007)(508600001)(336012)(356005)(53546011)(2616005)(186003)(8676002)(83380400001)(33656002)(8936002)(36756003)(70206006)(47076005)(82310400003)(36860700001)(6512007)(6666004)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 11:22:48.4014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d3579b-a2c5-490e-c5dd-08d9833b77b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3593



> On 29 Sep 2021, at 09:00, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 28.09.2021 18:32, Luca Fancellu wrote:
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1296,11 +1296,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>         {
>>             read_file(dir_handle, s2w(&name), &kernel, option_str);
>>             efi_bs->FreePool(name.w);
>> -
>> -            if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NUL=
L,
>> -                            (void **)&shim_lock)) &&
>> -                 (status =3D shim_lock->Verify(kernel.ptr, kernel.size)=
) !=3D EFI_SUCCESS )
>> -                PrintErrMesg(L"Dom0 kernel image could not be verified"=
, status);
>>         }
>>=20
>>         if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
>> @@ -1372,6 +1367,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>>     if (dt_module_found < 0)
>>         /* efi_arch_check_dt_boot throws some error */
>>         blexit(L"Error processing boot modules on DT.");
>> +
>> +    /* If Dom0 is specified, verify it */
>> +    if ( kernel.ptr &&
>> +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
>> +                                           (void **)&shim_lock)) &&
>> +        (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D EF=
I_SUCCESS )
>> +        PrintErrMesg(L"Dom0 kernel image could not be verified", status=
);
>=20
> Why does this code need moving in the first place? That's (to me at least=
)
> not obvious from looking just at the common (i.e. non-Arm-specific) part.
> Hence I would wish for the comment to be slightly extended to indicate
> that the kernel image may also have been loaded by <whichever function>.
>=20

Sure I will improve the comment to explain that.

> Also, two nits: You've broken indentation here (you've lost a space too
> much compared to the original code) and ...

Yes sorry for that, we didn=E2=80=99t see it, I will fix it.

>=20
>>     /*
>>      * Check if a proper configuration is provided to start Xen:
>>      *  - Dom0 specified (minimum required)
>>=20
>=20
> ... you will want to insert a blank line not only before, but also after
> your insertion (or, imo less desirable, neither of the two blank lines).
>=20
> Further I wonder whether your addition wouldn't better be after the code
> following this comment.
>=20
> And finally I wonder (looking back at the earlier patch) why you use
> kernel.addr there when kernel.ptr is being used here. Unless there's a
> reason for the difference, being consistent would be better.

I will do all of the above for the v4.

Thanks for all the feedbacks.

Cheers,
Luca

>=20
> Jan
>=20


