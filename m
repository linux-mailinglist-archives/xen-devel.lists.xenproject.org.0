Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F5B41F0FB
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 17:14:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200746.355311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWKEn-0002kc-Fw; Fri, 01 Oct 2021 15:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200746.355311; Fri, 01 Oct 2021 15:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWKEn-0002iF-Ce; Fri, 01 Oct 2021 15:14:13 +0000
Received: by outflank-mailman (input) for mailman id 200746;
 Fri, 01 Oct 2021 15:14:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCz3=OV=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mWKEl-0002i3-JU
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 15:14:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.81]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a3cd7c2-22ca-11ec-bdb3-12813bfff9fa;
 Fri, 01 Oct 2021 15:14:10 +0000 (UTC)
Received: from AM6P195CA0017.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::30)
 by AM9PR08MB7053.eurprd08.prod.outlook.com (2603:10a6:20b:410::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Fri, 1 Oct
 2021 15:14:00 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::11) by AM6P195CA0017.outlook.office365.com
 (2603:10a6:209:81::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 15:14:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 15:13:59 +0000
Received: ("Tessian outbound c21c48fbc857:v103");
 Fri, 01 Oct 2021 15:13:58 +0000
Received: from 506da9928403.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A2EB8E77-DA12-432E-8606-FDCEB36E1DB3.1; 
 Fri, 01 Oct 2021 15:13:47 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 506da9928403.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Oct 2021 15:13:46 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5754.eurprd08.prod.outlook.com (2603:10a6:102:91::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 15:13:44 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4566.015; Fri, 1 Oct 2021
 15:13:43 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0208.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 15:13:43 +0000
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
X-Inumbo-ID: 3a3cd7c2-22ca-11ec-bdb3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2nTysSJReSsS5P/E2b3SW9+rjjhEy4D2yd+3EaRrrk=;
 b=xnN7Gn8z2+Fr46nfLZ9JbnoKEeUTkkyL1xq5kmnKH7AodIYJvwrr1FJrroKNLe+XbggqEOzs1tZ/EB5ML+YyTeYiiG0wYdh6JM50vUfE9pesNPy5ig9bFk3Zz7h73SyGoA17RlloZCXnetAYHKhROR11u0LuLAqfTZaTcGhh8hA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac90298bd2fb9610
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlX+HrW+YtUm7lbxcNzrDIl9j0g2jDAJ63OOniBpSvkYufkX3DZ11C47o/EO03W3RCbprQBBY2rN2Iyv1YQEvof1oIoZ+hW3O3ARniGbUzmaoIM1A2ekgxQXzERwQxgIRLW9b1Jy+r7dQ2x3cvwvI6d6rq1Oi7e87S7uuepXMWZQXP9LYQW9W05vxQH9HtSFlRz4uCIB5hImCaUqWqweCnwmmHcb6GG6nA1nRLRXVefsBMa1DyQiw7Oq9PSyhT5Lhzex0OHJdqQEsvPEuhL+tYPR2XJdmEYyKWY3yDvWxrPzpv6pGGSem4xcjg/s6nOp8LQGxtsqydsahPeCXizsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2nTysSJReSsS5P/E2b3SW9+rjjhEy4D2yd+3EaRrrk=;
 b=ck7z8BnRxrDgER1VRnnrgn4f/cktcrRUc8XgpPgSc3BsLlah9ZkS3cvZzhCr651p/xzNEWe3cy93xg2vd6yFa0wClRPChM3KYiQcaYBPeIPv4xEaYuaXye0BPaeYpTFU7wNRUadmPUDBvl4092d9GBkRfG58QnaBh/CJwYybAuyeDfwAxDm2pVF0KZaH9lySat2z5togUUWgETtUBkV1LxFDqP2MODLC+RNZZiiqAnfwbj54e2wFkheSKRo3E+GOPKiXbdzlK2Cxy9mZoM7RFxJOCXqSGRrYYumHp6UM4AvgLHXXYl0L89+IQT81GhnplMaZvMs8cZ35OjYNc22Aig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2nTysSJReSsS5P/E2b3SW9+rjjhEy4D2yd+3EaRrrk=;
 b=xnN7Gn8z2+Fr46nfLZ9JbnoKEeUTkkyL1xq5kmnKH7AodIYJvwrr1FJrroKNLe+XbggqEOzs1tZ/EB5ML+YyTeYiiG0wYdh6JM50vUfE9pesNPy5ig9bFk3Zz7h73SyGoA17RlloZCXnetAYHKhROR11u0LuLAqfTZaTcGhh8hA=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v4 2/3] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <ce8e7fda-4d74-4bce-78bd-387f9b7a395f@suse.com>
Date: Fri, 1 Oct 2021 16:13:37 +0100
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
Message-Id: <55D6C05A-C0B4-4503-A7F8-D0BA11E0779B@arm.com>
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-3-luca.fancellu@arm.com>
 <2fa4be34-9c69-21cb-632f-f566caf622ca@suse.com>
 <6DFF05BA-8250-4C6C-86DF-67997F8DAD46@arm.com>
 <ce8e7fda-4d74-4bce-78bd-387f9b7a395f@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0208.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::28) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60c22685-9744-4961-da12-08d984ee188b
X-MS-TrafficTypeDiagnostic: PR3PR08MB5754:|AM9PR08MB7053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7053938762421C0CF8A741D0E4AB9@AM9PR08MB7053.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NlQyih+uS55X1pUizs96tGiP1vMoJQZtVE6TlJwl7U6QGNpiDtoqaNqB+pZV7EYa1XdVg/z2eOX1xXzDM24+DmJfHDlopk183pyHc6oDW49Utyi6qS/ZfLigeltDDuCL2oK+pP3P/I4oQtAJrKCYpeFrkbcVL5RclYqsg78fiIyX4qNzi3cb3/E+gRjrIvNnQlpqaa/gCiLIk0f9zcsl88kWVxppoux27gr+9Cej/liMNkSoxaSrXDeSTnpygIazkjpZe97beyq9R+N0Wrid4dGXHeBSG0W4eHjU0uyHYle+8grpCTPT3aGoIr4DOjach3D8WBkxl+B3z8T61AkzndYf9Wt5aV9FxgJtHjwdveNRnl5Hm1yihvCLVolbIynxETeTf+iddThPsKeej/AkiQKA1ERP5icQzR39SeWU/4F7XofYuz1zM9co/9REiFcFO/FnrQcJ8bEIxMVCH81iHPiNaYf44aFismuCNFKwlkSKqXaul6eDZO4YNl7i6un7w/+KcetK/lOTtwusGTnKd1cc7x3+okFdiwRW0DT661lybC9V6d/JeUkF8OtjW+1O1oezyhF/3D6URdIQfNOOt5eejcQCyLv7PMvDNqU3IXr6WVvJXu7iKwcEVMySzPoV5CU7JcJF7Pc9JQwpG1pjikNS0iv7H6TPOSr5H91qPwwYBVqTz3aDaI3SJfxt/2v88c95/kJvs/T8fyubt3DZywtOdUAPc/9QEDQSXtFpFXLk8S2IQ+/uQYFmv3r11323kSctBTubUOJazxq4WjozMA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(5660300002)(86362001)(38100700002)(38350700002)(316002)(508600001)(6666004)(44832011)(8936002)(66556008)(66476007)(54906003)(6512007)(66946007)(2906002)(6916009)(83380400001)(52116002)(33656002)(6486002)(36756003)(186003)(2616005)(956004)(6506007)(26005)(4326008)(53546011)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5754
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	addb74ce-5bab-45bf-58d8-08d984ee0ef7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hWmNk1fz8UPYHF+facAvqXXSLzH5VTfBm6e3aMVAE1RsyC+SZSJSxaNyAxz1VNFYTtQXa7DStWgNpnM8a2LybVNtbq1ipCKGV+Ex5dJZ3jRxUFQibaa3XbpotUCaTXS6XbPUnU6YbbualI1akPFJXXENYxFcpEUKPqrBFcBLmzSdKEusHqY4i/wp4DXACG1BDlbn+dqqmoZMyQdgg7n2SwVZFeewHbYVG6IIXPVgT0FIhjKVf9bgdcGGWPn4qlDynrLkgBWNN5cNPNx+OvF30KpWU71WfKQs0j/La/u36q5XM3W5nDvYUa9JOe6p9Ht8zJbOYI/KB0rnDe2BiIGmDIfxeXCrZW4WZOQdc1i9HZoooxNFHpn14bpsDZN/0Sh35RHcIp03fhN9i4KeFVLnZ2r+npv40L/zI7CueiGWxlYc6sVYTjnbKNkEyXcs/8C/mQpJGegxvl9XqqQ5OmUWxMo0ymnD1OrxI924uTgqrYz6R3dWwLEJsxMsLubYoE8rie4DVn+685fxkMeyYd4Kty1LQ2fudlRVhF42SmE+7XAqqqBffCWosSJ5J0IuvHWHgN08qkgNHtCep72KLLMrkgXMy0e/ldu30bhHvbdkd/BxS5wYLKQlI0hVxtNWvsNv6rMPtagAUe482qsn3fIk8yEfjF8JNQXu+PvqEpQ41hgzp7o/xal5HX3YQNwOzPJ66WS0l54zHk8gkpg5vP06XdjgAahWUDP3CoWZopnJVDA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(33656002)(4326008)(83380400001)(336012)(6486002)(54906003)(36860700001)(36756003)(53546011)(6862004)(26005)(6506007)(8676002)(6512007)(8936002)(186003)(44832011)(5660300002)(356005)(956004)(81166007)(82310400003)(2906002)(508600001)(86362001)(2616005)(6666004)(47076005)(70586007)(70206006)(316002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 15:13:59.7507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60c22685-9744-4961-da12-08d984ee188b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7053



> On 1 Oct 2021, at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 01.10.2021 15:55, Luca Fancellu wrote:
>>> On 1 Oct 2021, at 12:02, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 30.09.2021 16:28, Luca Fancellu wrote:
>>>> @@ -1361,12 +1361,30 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_T=
ABLE *SystemTable)
>>>>        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>>>>        cfg.addr =3D 0;
>>>>=20
>>>> -        dir_handle->Close(dir_handle);
>>>> -
>>>>        if ( gop && !base_video )
>>>>            gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>>>>    }
>>>>=20
>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>> +    /* Get the number of boot modules specified on the DT or an error=
 (<0) */
>>>> +    dt_modules_found =3D efi_arch_check_dt_boot(dir_handle);
>>>> +#endif
>>>=20
>>> So I had asked to add a stub enclosed in such an #ifdef, to avoid the
>>> #ifdef here. I may be willing to let you keep things as you have them
>>> now, but I'd like to understand why you've picked that different
>>> approach despite the prior discussion.
>>=20
>> There must be a misunderstanding, your message in the v3 was:
>>=20
>> "Every time I see this addition I'm getting puzzled. As a result I'm
>> afraid I now need to finally ask you to do something about this (and
>> I'm sorry for doing so only now). There would better be no notion of
>> DT in x86 code, and there would better also not be a need for
>> architectures not supporting DT to each supply such a stub. Instead
>> I think you want to put this stub in xen/common/efi/boot.c, inside a
>> suitable #ifdef.=E2=80=9D
>>=20
>> So I thought you wanted me to remove the stub in x86 (since it doesn=E2=
=80=99t support DT)
>> and put this call under #ifdef so it won=E2=80=99t be compiled for arch =
not supporting DT.
>=20
> So FTAOD I'll repeat the crucial part: "I think you want to put this
> stub in xen/common/efi/boot.c". There was nothing about removing the
> stub altogether.

Oh ok, now I see, so in your opinion this is a better idea:

#ifndef CONFIG_HAS_DEVICE_TREE
static inline int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_handle)
{
    return 0;
}
#endif

But I would like to understand the advantage respect of my approach, could =
you
explain me?

Cheers,
Luca


>=20
> Jan
>=20


