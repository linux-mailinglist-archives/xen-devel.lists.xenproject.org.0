Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFFB426BD1
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 15:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204742.359909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYq4v-00079M-Nl; Fri, 08 Oct 2021 13:38:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204742.359909; Fri, 08 Oct 2021 13:38:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYq4v-00076J-KN; Fri, 08 Oct 2021 13:38:25 +0000
Received: by outflank-mailman (input) for mailman id 204742;
 Fri, 08 Oct 2021 13:38:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z9mS=O4=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mYq4u-00076D-2V
 for xen-devel@lists.xenproject.org; Fri, 08 Oct 2021 13:38:24 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00f19da4-283d-11ec-803f-12813bfff9fa;
 Fri, 08 Oct 2021 13:38:22 +0000 (UTC)
Received: from DU2PR04CA0177.eurprd04.prod.outlook.com (2603:10a6:10:2b0::32)
 by AM6PR08MB5079.eurprd08.prod.outlook.com (2603:10a6:20b:e8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 13:38:19 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::32) by DU2PR04CA0177.outlook.office365.com
 (2603:10a6:10:2b0::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Fri, 8 Oct 2021 13:38:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 13:38:19 +0000
Received: ("Tessian outbound 8e26f7114b75:v103");
 Fri, 08 Oct 2021 13:38:19 +0000
Received: from 56fb6f9cdbf3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 91A8C578-14E5-4037-BD6A-092DA4480A70.1; 
 Fri, 08 Oct 2021 13:38:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56fb6f9cdbf3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Oct 2021 13:38:13 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6847.eurprd08.prod.outlook.com (2603:10a6:102:13d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 13:38:12 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 13:38:12 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:a6::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 13:38:11 +0000
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
X-Inumbo-ID: 00f19da4-283d-11ec-803f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv2ml6lyyNW+SNI4IoANswTuv0imJQXHfHwkQibWpDU=;
 b=cKySTScKqwOJXsKG6TWrwQ+LD/4+J94gv6Dd+KoJ4qpdSjdcVcetie0OtiRD3AaXWlGhh6YR604DQ4I/ssl7kY4lgx2gFkst1nEpDOai8Vkdou3PXhU+oprC7C69+Ly3e8SliUiTVCOccSMgcEko8Q3gSLGz3Gmfxvezfw34I1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99a8b8938184e80f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN8x+5uepIMKiUci7EW0JeFdBIVGfX0VMzq7sIa9HXUp4vk2fBwPhunvzqTAttNOfKa0UdsFq7PvCIkoywLt4D9zYZL7NEcs1e5IseyZUK4fPytxXTkgkhHloCp1Jp0u4nSUgy5yVefKKIFA+m9wxNeszx2dE1qqD/MdFAWljW13kNLe9nGx7HO4mbO3GpAEIaEBY4SZIkI4dcmzFwLPo1e13NslmOjj5Ym7n+sBie6QIMypyiALK70PNPItEjUr7o35A6KrIWYZ3fr88vtIp1XUap4pDvIptzP4PCFKnYUHiZJ2mJax4sY7SK5AUYpA0AWmQ6Pwzmai6bjlcTUczA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sv2ml6lyyNW+SNI4IoANswTuv0imJQXHfHwkQibWpDU=;
 b=E04vHmkFYR72N67u+wAdYqDOPvrLnMFrby+736oMQcWHr2IIqkPrSqgr1Me48VFzNuDdSE7r91C1uh4fRRMk1LM2iOqQ+8WEfmBv87Uz6dAn8rFL0oFhTzA2Clo/VlSJ5PByN/XwplfcLxGuCvWWal3OkWD+MnFZpe4OvF0F69JrR8m74IYdXkVBt0nLT3TEWFHH9at9Xb5LkY6iZpupu6SK2SJCVFYB32HwFDrj9go48CZKCVNmgWs8MCj5VKN4egCLXmeyKagGxYlN0wZihwPNGA4nncABHqzKSDZzaa85xGXeXgkd28LlHVCFCc6Q2PhYb8kHHiIvgxVwrtNl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sv2ml6lyyNW+SNI4IoANswTuv0imJQXHfHwkQibWpDU=;
 b=cKySTScKqwOJXsKG6TWrwQ+LD/4+J94gv6Dd+KoJ4qpdSjdcVcetie0OtiRD3AaXWlGhh6YR604DQ4I/ssl7kY4lgx2gFkst1nEpDOai8Vkdou3PXhU+oprC7C69+Ly3e8SliUiTVCOccSMgcEko8Q3gSLGz3Gmfxvezfw34I1M=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v4 2/3] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <00328991-2c85-fed8-40d6-c33ecac7e1e8@suse.com>
Date: Fri, 8 Oct 2021 14:38:03 +0100
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
Message-Id: <EA18C41E-43FD-4C21-B11B-E776DC260974@arm.com>
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-3-luca.fancellu@arm.com>
 <2fa4be34-9c69-21cb-632f-f566caf622ca@suse.com>
 <6DFF05BA-8250-4C6C-86DF-67997F8DAD46@arm.com>
 <ce8e7fda-4d74-4bce-78bd-387f9b7a395f@suse.com>
 <55D6C05A-C0B4-4503-A7F8-D0BA11E0779B@arm.com>
 <00328991-2c85-fed8-40d6-c33ecac7e1e8@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::33) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19e721a5-2a80-44dc-8071-08d98a60e3ee
X-MS-TrafficTypeDiagnostic: PAXPR08MB6847:|AM6PR08MB5079:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB507977BFC3F9AF8E4EE1D772E4B29@AM6PR08MB5079.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ufEpF3MhaEg/az4qfiM+nxSL2m8YEjLrbM8mlsVS+ONY4TaFNlTvzZeoHu6W8bQCgU8Svg5UWOQn1ORC0RjxYSVX0eSFsnFOKChes69wpYoEwsiH+qPa2nRMLF7zZb75jLJp3mmfyzj2UGQi7jqeG/beeCsj2bqRao8b2AFfUgDziZWq/bmvApNbsl8u7mG6I5JpJ6tdcGMIZbx9lNugn9w52blr9anv5L9uHs1f/aYxMdqaGgovJeiIVFuDz5wFYvvi1DSkldyPa9imJXknJLG8ps1V1lGgG46hVbLJoMSwK3G/iXHTn98OPwLTYF2LxGO+TX9CoT0cxcyj16H1KhHuDoK22z0UWqhp3Xdmng8hT01VyUVVbHTEgAVJUlNPUoxVhOxY4GfidGwNg7YYmzuLfh8P8+UzwJo8hxEYSh7/1c96sCLPdjF9rAboSdshGWUNhkRBQPotTlYhI09l1M2+TEK7qpt0mK25cykcYKkT42UpDRZBr2poCHbLHzGFdVmz+M8TZzE5noD90SA7BxFu9qSRb0oPs0lEnoGOxl7a5Nh5r6pc2cwIIEZxBozfn0KL0HYGVPxk2h+9/IQCnIowWvxTVme9vmgw17i131V3QqrAa66t9qdYCamsT8mKHZdxYI4horzZB5vfchIVUz0U9ZG0j7fOp2wW0gfTTPlq9lcmGNhD4se3NthDX/OKm5eutr1cm6YPubxr6T6UG6+SxNfJQIcv+1x47frHni5Wm6ID/yjWFBUkFm0W0D5Y
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(5660300002)(66556008)(316002)(66946007)(53546011)(6512007)(6506007)(8936002)(36756003)(6486002)(52116002)(8676002)(38350700002)(38100700002)(83380400001)(54906003)(44832011)(2906002)(6666004)(33656002)(4326008)(2616005)(6916009)(26005)(86362001)(508600001)(956004)(186003)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6847
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b28d624d-d4cd-4554-e1f7-08d98a60df70
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pDI7HByheMn9I5PElPPXVLXDH1UbThhyQAZ94/ZU/FpDxO/jLYeV0nxARtiWEtSzCFhCtt6/MOZ7t7ry1Zjefdo79uXET4qtYZBv/R9pgjcX9/NMJGpvwJRgIbflz+RRoVwsBH58bb/Jst7OLpBrA8/gfV+uFQH9ZqiCGaBgbL3Vf0rGcxQdaHZ21c3iTHiSH2VvPmQbA8r6cQPAbYM5ev9Srjuswi7siXvLYYbc54WXT59HHL+BojhzRyC3tidKP6VjemkOej1Y6LRCn4gzZDN8/Z1vnjujR/wc4d7M37Tt0+p8pFzvCc/F4oG0heqmyr0lMks6l82lji9ZFBHGpy01P61PEyiIWDtpVcuO9/3SA0NZesv0eOK8qaOlX1gIQ7alAn1oAEV/ZMYIvAUBUeV41cMod3bN9AvfeCNGunUVYH8brSYEvI01Rxgn4BxHoEN8rLpxyQPR+iQxRfhDt3QRY9O+zOl35KKgizTFItOCZq3EEHewsfmoIMPrO0M2hmBPQfLFBTEBpXzluzJUx31oVpIelQ8E6BKtb8Ah//xwzIagq1EjeSuLCyO+f+VgWOgr9Xt2zd8BTD1JYBnZATksXWRGTJTf6FTPo0zRQXsJ60CRjyeZ6dfiXBirY4swz3HzJ+w428M+L+IJxPlWNTs/qR0AWz5PkRCQXH+OykR7LAgDwmDk5o2uznv5bA9huxHH9tMVCr/U5ua/GGafjTBQX14qtDqMc8feWxiWeDU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(6862004)(6486002)(2906002)(26005)(36756003)(82310400003)(356005)(508600001)(33656002)(6666004)(4326008)(5660300002)(53546011)(316002)(86362001)(8936002)(6512007)(70586007)(47076005)(54906003)(336012)(36860700001)(2616005)(8676002)(6506007)(186003)(44832011)(83380400001)(956004)(70206006)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 13:38:19.5117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e721a5-2a80-44dc-8071-08d98a60e3ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5079



> On 7 Oct 2021, at 08:15, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 01.10.2021 17:13, Luca Fancellu wrote:
>>=20
>>=20
>>> On 1 Oct 2021, at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 01.10.2021 15:55, Luca Fancellu wrote:
>>>>> On 1 Oct 2021, at 12:02, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 30.09.2021 16:28, Luca Fancellu wrote:
>>>>>> @@ -1361,12 +1361,30 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM=
_TABLE *SystemTable)
>>>>>>       efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>>>>>>       cfg.addr =3D 0;
>>>>>>=20
>>>>>> -        dir_handle->Close(dir_handle);
>>>>>> -
>>>>>>       if ( gop && !base_video )
>>>>>>           gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>>>>>>   }
>>>>>>=20
>>>>>> +#ifdef CONFIG_HAS_DEVICE_TREE
>>>>>> +    /* Get the number of boot modules specified on the DT or an err=
or (<0) */
>>>>>> +    dt_modules_found =3D efi_arch_check_dt_boot(dir_handle);
>>>>>> +#endif
>>>>>=20
>>>>> So I had asked to add a stub enclosed in such an #ifdef, to avoid the
>>>>> #ifdef here. I may be willing to let you keep things as you have them
>>>>> now, but I'd like to understand why you've picked that different
>>>>> approach despite the prior discussion.
>>>>=20
>>>> There must be a misunderstanding, your message in the v3 was:
>>>>=20
>>>> "Every time I see this addition I'm getting puzzled. As a result I'm
>>>> afraid I now need to finally ask you to do something about this (and
>>>> I'm sorry for doing so only now). There would better be no notion of
>>>> DT in x86 code, and there would better also not be a need for
>>>> architectures not supporting DT to each supply such a stub. Instead
>>>> I think you want to put this stub in xen/common/efi/boot.c, inside a
>>>> suitable #ifdef.=E2=80=9D
>>>>=20
>>>> So I thought you wanted me to remove the stub in x86 (since it doesn=
=E2=80=99t support DT)
>>>> and put this call under #ifdef so it won=E2=80=99t be compiled for arc=
h not supporting DT.
>>>=20
>>> So FTAOD I'll repeat the crucial part: "I think you want to put this
>>> stub in xen/common/efi/boot.c". There was nothing about removing the
>>> stub altogether.
>>=20
>> Oh ok, now I see, so in your opinion this is a better idea:
>>=20
>> #ifndef CONFIG_HAS_DEVICE_TREE
>> static inline int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_hand=
le)
>> {
>>    return 0;
>> }
>> #endif
>>=20
>> But I would like to understand the advantage respect of my approach, cou=
ld you
>> explain me?
>=20
> Well, to a degree it's a matter of taste. Your approach may lead to a lon=
g
> series of various #ifdef sections in a single function, harming readabili=
ty.
> Having stubs instead (usually placed in headers, albeit not in this case)
> allows the main bodies of code to remain more tidy.

Yes right, in this case I did in another way because declaring the stub in =
the .c file
was (in my opinion) not the right thing to do, since also the name (efi_arc=
h_*) recalls
something arch oriented and so not to be put in the common code.

In this way any future architecture supporting DT, can just provide the fun=
ction (or a=20
stub) and we don=E2=80=99t have stubs in architectures that won=E2=80=99t e=
ver support DT.

In your opinion that solution could be acceptable?

Cheers,
Luca

>=20
> Jan


