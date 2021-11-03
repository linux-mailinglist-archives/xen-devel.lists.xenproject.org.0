Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0B44456C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 17:08:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221073.382593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miInl-0007JW-9H; Wed, 03 Nov 2021 16:07:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221073.382593; Wed, 03 Nov 2021 16:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miInl-0007H7-62; Wed, 03 Nov 2021 16:07:49 +0000
Received: by outflank-mailman (input) for mailman id 221073;
 Wed, 03 Nov 2021 16:07:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PtR=PW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1miInj-0007Gt-2Z
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 16:07:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e11b547-3cc0-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 17:07:45 +0100 (CET)
Received: from DB6PR07CA0166.eurprd07.prod.outlook.com (2603:10a6:6:43::20) by
 DB9PR08MB7006.eurprd08.prod.outlook.com (2603:10a6:10:2c7::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10; Wed, 3 Nov 2021 16:07:42 +0000
Received: from DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::ec) by DB6PR07CA0166.outlook.office365.com
 (2603:10a6:6:43::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.4 via Frontend
 Transport; Wed, 3 Nov 2021 16:07:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT041.mail.protection.outlook.com (10.152.21.4) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 3 Nov 2021 16:07:41 +0000
Received: ("Tessian outbound 2bb1f94ba47e:v108");
 Wed, 03 Nov 2021 16:07:41 +0000
Received: from cb1468ac0cc7.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F05DB63A-86A9-4301-8A3E-C5DFAD49A67C.1; 
 Wed, 03 Nov 2021 16:07:25 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb1468ac0cc7.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Nov 2021 16:07:25 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6495.eurprd08.prod.outlook.com (2603:10a6:102:dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 16:07:23 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 16:07:22 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0126.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:192::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 3 Nov 2021 16:07:22 +0000
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
X-Inumbo-ID: 2e11b547-3cc0-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMzRqRCXP00W+MueiHojl3OajnY7XnqQcfJg8A5FYXQ=;
 b=7Et4LERTT++IBj2CtYt68j3M1k9ZSECfbkTboP0Gz69WuDl4xVa9tsyjN6bhoeRdcIId4DQ9RcUkP7bbRtZOwlqM2jd2CYpDA4pMnq/S4uOI/kKmwMc4qjn3FEMIdjcY9yqJ2Xdkhp3dUyuIJlOQOupI4xzhhRVrjwLO+bglk6M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2effdc7b911a0c3a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XzERY7cscE8y5RpwmGOzfIpeRAn0h/8/0ZEfpIH3IUfGQMlAr50V5tB9RWBYrxFTIUMhwA/KbEE5e7emi4F7ckwHCEyhGOu8iwRMDNyyWuIWaSUVc4l2HlzUSAvhM8QVCS4vHl6R1BNs9r586WvdMdsH0MrOl8ZDrxUW9jg/6nlLcn4daIkA+CdIN4nNx0Jrp6O5MuuqcDrgUaOoKg3oBu/SBwsD6eOwTD51SybR8iNLYWQz6mAOFZ6mnKaDyLzP1NDwPPQ8znlUGfNE1RDOUFtXudzOBY5e9P3XncC9QhExrncQUadH9Z7gWJJZAHD4/neelsFELuey1jiw0VdMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMzRqRCXP00W+MueiHojl3OajnY7XnqQcfJg8A5FYXQ=;
 b=aDkCINZuHCv+1rNVnKkYhD0as/1QDnDoTJPCMWiDAXXHgJEUxX1wTjiOvc09oEV+H/tdLVOwM2aBD57EzZa5/mFYHgD2psmWG+xbk0UZBP6yjUPKmtxR1NFuYdWrEleewiCz3fZSbvlZtIGs1yiatueYdKIR8mxk7ayvPLIuIsG6TJjHM2w5OjbKw/7QmDBvLIw/DfH8lL9Lm/qhWGA+O6ef5W0u1AMFfl1dsYHjdhPlriPFEeKbNIhS5exfMPJIyT8hvRs7LgJ9URmsIyh75DxPbmnV8V6hQYQtCOD1dFonYW6pKWY6IGEf0KVJBwUmX9NM1+GP81wZq2mmRCABoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mMzRqRCXP00W+MueiHojl3OajnY7XnqQcfJg8A5FYXQ=;
 b=7Et4LERTT++IBj2CtYt68j3M1k9ZSECfbkTboP0Gz69WuDl4xVa9tsyjN6bhoeRdcIId4DQ9RcUkP7bbRtZOwlqM2jd2CYpDA4pMnq/S4uOI/kKmwMc4qjn3FEMIdjcY9yqJ2Xdkhp3dUyuIJlOQOupI4xzhhRVrjwLO+bglk6M=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <9729d03e-efae-d862-d685-0308608c3771@suse.com>
Date: Wed, 3 Nov 2021 16:07:15 +0000
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <25B03CAA-716F-498E-9F0C-6C71B9ECFA8E@arm.com>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
 <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
 <6a8ecb5b-7ea4-7dd8-4acf-587b51862aed@suse.com>
 <845D8368-B9DA-4A5C-8F8D-6AAE55E326A0@arm.com>
 <16c6757d-1bb3-361f-a41f-26b9bc89a2b4@suse.com>
 <83E4F969-892C-4AA2-829D-67C02B4B5885@arm.com>
 <ad621757-afac-f36f-0b3c-7fe1ddb83a66@suse.com>
 <AB5E1F4C-36BC-413B-88DA-487BA573BFCC@arm.com>
 <b3d140fa-019e-a469-be16-47b6e42e124d@suse.com>
 <AB3CD75D-3E18-4802-91E5-7FBBA0734170@arm.com>
 <9729d03e-efae-d862-d685-0308608c3771@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0126.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::23) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8619a5e-ade8-4c84-088a-08d99ee410ab
X-MS-TrafficTypeDiagnostic: PAXPR08MB6495:|DB9PR08MB7006:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7006D8E5D8D2385A1D96BBD7E48C9@DB9PR08MB7006.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 eBJCkRTpiOlx/hYMNYrt49EK80hPt97Esaqz8wL9R/ME1OT1UiaawT/FgOuY96w1j2ThG9JBKpPlEmOHA6ZIRkCGP6938CPT3FfsdHYhUUhLVz6eTpSY/GiXEpLk+dJiIpTbmst7O+ev5a3BH8oP3vBLhDQ3OCEE17mSlnhKFkllUbNhjeP2OWRS9xz7c5jYsZ/6QuT73NYw2KLzZsuvQPUv/oOcaFNV4FXXBwyHFN4gVuGHYz/AsFDcPeT6w2N01igs8KuBgggMcaMhXkWn0boYgmEjMOGt9pv/0mxWECSTJ/GcXqllwJsFj3y0b79YiQ7qVCamxsa7GqSyBqJfCc8hHOXs01hrMF/87yqAszj9mN2vFGDjxarVxHlVYW6gOAnGjKc6IECK9JPDT3xoCQjl/kQ827FDyg3DbgmhHLRsI6c9lfgnEYXvBAaShxRvFI17M9gBXLsR9D0iIzHow2H+QkqRh/VIqL7Ye6zDNg4Qe/STPa8O1cBfZdVdBFfl/In0wyTPBHyyOf9kYRtCcAhL4/9n7tjG6HZpPSvxPkc03eSyKq8dWTAChQCJCoekPYa55s1xFeKWaUvCqqsHoOO+Q/GHb1Tlpm0aR7zj2dX3HEuFuaiY8AyV/9uG++XPutH0yBPLKwiYKEtmSXeKJpX/iCjPmwcHhHMeHF8Ro181DHn4QbUdPK4D/KRweAWXe2rnzlx6y2Zj+DHf+/e96+AqK4dUvObEZ6O0WSJHsmu9v58PCYvvOA9iek4eg4UU
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(6486002)(86362001)(33656002)(53546011)(26005)(508600001)(2906002)(6506007)(66556008)(8676002)(186003)(5660300002)(44832011)(316002)(6916009)(956004)(38100700002)(66946007)(6512007)(36756003)(2616005)(8936002)(52116002)(38350700002)(6666004)(54906003)(83380400001)(66476007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6495
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2c9e0aba-70ac-4717-95b0-08d99ee40524
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UPCJsjdtTml+M6qoWXeck8jgaelhf+azx59M/riqC6VoobdXb6UGcpddjsg6Ug4Udna4qniYNnpTMTUPFLUGjV0RCYrBG3STjlvNjCayGiXIZisG+7ZzthJy+tUrikkaXyCxp0LgrtqS0PrFuUcVRfUUF0SO45szOuhfcQatnvZ9Gh6mxAlX/R9hPpsAn49aUzMzdCFlSHbKwVuVbHdSOq8bpGKBIVaQzN5G4pjqMr97yADSSSbl42ePwpay+6Ka0BOC29JtnaB6vJ3LFoFPHWb+H5i0YYexzE2PToWCkbKf7cR75oudvfhTkR/NenLGiPGN1ApPTdmm+l9NJCZ4cmC4veimTAFSJbn6Kun8+eNp9E5YsTBKIwk5OufNGKjeFJklzPQ639w6ACNnIODccgoKoruGn2tTidTxX1SE2q1+hjg0Z5guyqMv+H7KyfFF3Y/8pVTd83vk8Vn3AYjNjRUxtCgOPMXeHmcXRaKwDECrl9mrNB+1gji3UyvvRzjrq1qwJXWa4nbMGl447MziJE/3wNDgai62NS/lDOFbEqIiSLFDhzkkGAqbL/9HFHSxo9v086Lntun/ZFuVyDv9DyFzTwIGMZcJnm6N7oJD6Ts+yUTZki0bkk+U/XkG+uhAC4rFFn57vDFi/ZWvx1uWqD10CTDFlzlPuHpzaMmqp9f9sIHPpRE1vkXKrbtfBeHFF3g44uV8floLVivAfZqQ8g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(2906002)(81166007)(36860700001)(336012)(6666004)(6862004)(186003)(356005)(5660300002)(53546011)(6506007)(8936002)(4326008)(26005)(47076005)(956004)(70586007)(86362001)(316002)(82310400003)(54906003)(33656002)(70206006)(36756003)(8676002)(508600001)(6486002)(6512007)(2616005)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 16:07:41.8932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8619a5e-ade8-4c84-088a-08d99ee410ab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7006



> On 3 Nov 2021, at 15:51, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 03.11.2021 16:41, Bertrand Marquis wrote:
>> Hi Jan,
>>=20
>>> On 3 Nov 2021, at 15:30, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 03.11.2021 16:16, Luca Fancellu wrote:
>>>>=20
>>>>=20
>>>>> On 3 Nov 2021, at 14:30, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>=20
>>>>> On 03.11.2021 15:09, Luca Fancellu wrote:
>>>>>>> On 3 Nov 2021, at 11:28, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 03.11.2021 11:20, Luca Fancellu wrote:
>>>>>>>>> On 3 Nov 2021, at 08:20, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>> On 02.11.2021 18:12, Luca Fancellu wrote:
>>>>>>>>>>> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>>>> On 02.11.2021 15:05, Luca Fancellu wrote:
>>>>>>>>>>>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf21=
4fd9b882
>>>>>>>>>>>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>>>>>>>>>>>> introducing a problem to boot Xen using Grub2 on ARM machine u=
sing EDK2.
>>>>>>>>>>>>=20
>>>>>>>>>>>> The problem comes from the function get_parent_handle(...) tha=
t inside
>>>>>>>>>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the=
 last
>>>>>>>>>>>> is NULL, making Xen stop the UEFI boot.
>>>>>>>>>>>=20
>>>>>>>>>>> According to my reading the UEFI spec doesn't (explicitly) allo=
w for
>>>>>>>>>>> this to be NULL. Could you clarify why this is the case? What o=
ther
>>>>>>>>>>> information may end up being invalid / absent? Is e.g. read_sec=
tion()
>>>>>>>>>>> safe to use?
>>>>>>>>>>=20
>>>>>>>>>> My test on an arm machine running Grub2 on top of EDK2 showed th=
at
>>>>>>>>>> when Xen is started, the get_parent_handle(=E2=80=A6) call was f=
ailing and stopping
>>>>>>>>>> the boot because the efi_bs->HandleProtocol(=E2=80=A6) was calle=
d with the
>>>>>>>>>> loaded_image->DeviceHandle argument NULL and the call was return=
ing
>>>>>>>>>> a EFI_INVALID_PARAMETER.
>>>>>>>>>> So the parent handle can=E2=80=99t be requested and the filesyst=
em can=E2=80=99t be used,
>>>>>>>>>> but any other code that doesn=E2=80=99t use the handle provided =
by get_parent_handle(=E2=80=A6)
>>>>>>>>>> can be used without problem like read_section(...).
>>>>>>>>>=20
>>>>>>>>> I understand this. My question was for the reason of ->DeviceHand=
le
>>>>>>>>> being NULL. IOW I'm wondering whether we're actually talking abou=
t a
>>>>>>>>> firmware or GrUB bug, in which case your change is a workaround f=
or
>>>>>>>>> that rather than (primarily) a fix for the earlier Xen change.
>>>>>>>>=20
>>>>>>>> The issue was found only when using EDK2+Grub2, no issue when boot=
ing
>>>>>>>> directly from EDK2.
>>>>>>>> This is a fix for the regression, because without the EFI changes,=
 Grub2 was
>>>>>>>> booting successfully Xen. Using grub2 to boot Xen on arm is a very=
 common
>>>>>>>> solution so not supporting this anymore could lead to lots of peop=
le having
>>>>>>>> issues if they update to Xen 4.16.
>>>>>>>=20
>>>>>>> I'm not objecting to addressing the issue. But the description need=
s
>>>>>>> to make clear where the origin of the problem lies, and afaict that=
's
>>>>>>> not the earlier Xen change. That one merely uncovered what, accordi=
ng
>>>>>>> to your reply, might then be a GrUB bug. Unless, as said earlier, I
>>>>>>> merely haven't been able to spot provisions in the spec for the fie=
ld
>>>>>>> in question to be NULL.
>>>>>>=20
>>>>>> Maybe I can rephrase to be more specific from:
>>>>>>=20
>>>>>> The problem comes from the function get_parent_handle(...) that insi=
de
>>>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>>>>>> is NULL, making Xen stop the UEFI boot.
>>>>>>=20
>>>>>> To:
>>>>>>=20
>>>>>> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHan=
dle,
>>>>>> that is used by efi_bs->HandleProtocol(=E2=80=A6) inside get_parent_=
handle(=E2=80=A6),
>>>>>> causing Xen to stop the boot getting an EFI_INVALID_PARAMETER error.
>>>>>>=20
>>>>>> Do you think it can be ok like this?
>>>>>=20
>>>>> Much better, yes, but I wonder what "returning" refers to. You want t=
o
>>>>> describe the origin of the NULL handle as precisely as possible. And
>>>>> considering this turns out as a workaround, in a suitable place you
>>>>> will also want to add a code comment, such that a later reader won't
>>>>> decide this is all dead code and can be done in a simpler way.
>>>>=20
>>>> Ok I can write the issue from the beginning to be sure:
>>>>=20
>>>> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandl=
e
>>>> inside the interface given by the LOADED_IMAGE_PROTOCOL service, this
>>>> handle is used later by efi_bs->HandleProtocol(=E2=80=A6) inside get_p=
arent_handle(=E2=80=A6)
>>>> when requesting the SIMPLE_FILE_SYSTEM_PROTOCOL interface,
>>>> causing Xen to stop the boot because of an EFI_INVALID_PARAMETER error=
.
>>>>=20
>>>> Regarding the comment, I can rephrase this comment:
>>>> /*
>>>> * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PROTOCO=
L
>>>> * to have access to the filesystem.
>>>> */
>>>>=20
>>>> To be:
>>>>=20
>>>> /*
>>>> * If DeviceHandle is NULL, the firmware offering the UEFI services mig=
ht not be
>>>> * compliant to the standard and we can't use the SIMPLE_FILE_SYSTEM_PR=
OTOCOL
>>>> * to have access to the filesystem. However the system can boot if and=
 only if it doesn=E2=80=99t
>>>> * require access to the filesystem. (e.g. Xen image has everything bui=
lt in or the
>>>> * bootloader did previously load every needed binary in memory)
>>>> */
>>>>=20
>>>> What do you think?
>>>=20
>>> Largely okay, albeit you don't mention GrUB at all (which isn't really =
part
>>> of the firmware, but which looks to be the culprit) and it gets a littl=
e
>>> too verbose. Provided the facts have been verified, how about
>>>=20
>>>   /*
>>>    * GrUB has been observed to supply a NULL DeviceHandle. We can't use
>>>    * that to gain access to the filesystem. However the system can stil=
l
>>>    * boot if it doesn=E2=80=99t require access to the filesystem.
>>>    */
>>>=20
>>> (and it's up to you whether you include your further "e.g. ..." then, b=
ut
>>> if you do I think the parenthesized part belong before the final full
>>> stop, and the last "in" would want to be "into")? It's still dubious to=
 me
>>> how they can get away with such a NULL handle (and why that happens onl=
y
>>> on Arm), but I guess it would go too far to try to understand the
>>> background.
>>=20
>> This might not be a problem in Grub but actually in EDK2 or due to the f=
act that
>> EDK2 is starting Grub which is starting Xen. Grub is not modifying this =
explicitly
>> from what we found during our investigations.
>=20
> Otoh Luca said that there's no problem without GrUB. So maybe "GrUB
> in combination with EDK2 ..."?

Yes as Bertrand suggested and following your wording is more complete to sa=
y:

    /*
     * Grub2 running on top of EDK2 has been observed to supply a NULL
     * DeviceHandle. We can't use that to gain access to the filesystem.
     * However the system can still boot if it doesn=E2=80=99t require acce=
ss to the
     * filesystem.
     */

>=20
> Thinking more about it, this may also be partly related to our
> limitation to loading files from file systems (and not e.g. networks
> or RAM). Yet even then I couldn't see how a NULL device handle could
> be used for anything.
>=20
> Jan


