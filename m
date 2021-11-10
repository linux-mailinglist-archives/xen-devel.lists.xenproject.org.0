Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC7A44C1DD
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 14:06:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224286.387512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mknJ2-0001Hd-EJ; Wed, 10 Nov 2021 13:06:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224286.387512; Wed, 10 Nov 2021 13:06:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mknJ2-0001EM-AM; Wed, 10 Nov 2021 13:06:24 +0000
Received: by outflank-mailman (input) for mailman id 224286;
 Wed, 10 Nov 2021 13:06:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1fV=P5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mknIz-0001E0-T5
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 13:06:22 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1e::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fea3a938-4226-11ec-a9d2-d9f7a1cc8784;
 Wed, 10 Nov 2021 14:06:19 +0100 (CET)
Received: from AM6PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:20b:c0::24)
 by PA4PR08MB6126.eurprd08.prod.outlook.com (2603:10a6:102:ea::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 13:06:17 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::fb) by AM6PR08CA0036.outlook.office365.com
 (2603:10a6:20b:c0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Wed, 10 Nov 2021 13:06:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 10 Nov 2021 13:06:16 +0000
Received: ("Tessian outbound 4ce13939bd4a:v108");
 Wed, 10 Nov 2021 13:06:15 +0000
Received: from 521044f6bb07.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88E2DD8D-6D6E-4047-B643-43B2222B7260.1; 
 Wed, 10 Nov 2021 13:06:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 521044f6bb07.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Nov 2021 13:06:04 +0000
Received: from AS8PR08MB6808.eurprd08.prod.outlook.com (2603:10a6:20b:39c::6)
 by AM6PR08MB5031.eurprd08.prod.outlook.com (2603:10a6:20b:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 13:06:02 +0000
Received: from AS8PR08MB6808.eurprd08.prod.outlook.com
 ([fe80::3d99:b3e8:1c0:6fcd]) by AS8PR08MB6808.eurprd08.prod.outlook.com
 ([fe80::3d99:b3e8:1c0:6fcd%9]) with mapi id 15.20.4669.010; Wed, 10 Nov 2021
 13:06:02 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0258.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8a::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Wed, 10 Nov 2021 13:06:01 +0000
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
X-Inumbo-ID: fea3a938-4226-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVub0t/zECIKPopKQ01IPXA2uKz1pvwslS3cPqLQxZ4=;
 b=73eFRk4jVFJBcwu+tFgoczHcEgVfXTrL+UE73zSTDBhF6jfXAccdZIotAfRB+g1/OWE47ZjrduZaPa+nz8eC/WSEcV40FnY3llWzE6BVsXPONQNyRr3O2BHg+StIAGgNsXkRDyDOR0g2/Wxr7vYlP+3aPdA8vRkjOsHZFw6+gAc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc1ce19b17cf10ab
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUJW90kRbPLNu4BQIvuFR00aqGuDcs6kukhOKTucQ0f7lwXoupvCkDf5bRNAXaObkwxZLMKdvVj5wRXH6iQ3UU0fWQPVEeV4zQz8D5oLV6RZAZ+px1sOiJW8t1p/hWmNWK5UC+rudkRKm36maEef/5sX/5O8L5J0ZKfPNCiVAvcHSElUHZBPR3IQS8nJH9ol2tYsHO97UMwX/pxBrnfgI0DCJnW1l0WK1LBoh9ZZeWVofG6BhOHkEAG1/urnqVrUNh+ymEVNL8VsRdM16GLmmBTIL4OiSFrfwY0mGz5P7zwX0WdeTf3pYHFrnKIS/97dawUlP8p+dqGcUbeZR+7ayQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVub0t/zECIKPopKQ01IPXA2uKz1pvwslS3cPqLQxZ4=;
 b=gui9mzLuFwZElOsNPobuRoJsWy3B2vNRxzbGq/jXSJaZ59PmmCAhfd/x2hoBK0yKjkXngHHjARM0yzBie1+FrJLTjN7eRdLesgg+zCUEJLq+d9/YFHUIUXaI2iGYYP5mha8S/wLSoO5Mcf2QpKz5S58MFvVF1mY3UkElUHKvdIXqDguTuTpN0f6J9eKtTNPTLP+9Reh2EtV7Fxif0tW9ihs7AW9qDpYhOzCjcswid9T3v8/1C8odvqqkiBlMFeBCwdAtJyOlKqHOakqHvUmIlB1D61G80/Cw0odpVCPaYQsbEdznG1JR64mAAtYMTjBOuJHMBWuTwrpib1vmsx+JSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cVub0t/zECIKPopKQ01IPXA2uKz1pvwslS3cPqLQxZ4=;
 b=73eFRk4jVFJBcwu+tFgoczHcEgVfXTrL+UE73zSTDBhF6jfXAccdZIotAfRB+g1/OWE47ZjrduZaPa+nz8eC/WSEcV40FnY3llWzE6BVsXPONQNyRr3O2BHg+StIAGgNsXkRDyDOR0g2/Wxr7vYlP+3aPdA8vRkjOsHZFw6+gAc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
Date: Wed, 10 Nov 2021 13:05:55 +0000
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3B8E0C6E-0522-4F73-B6C2-827FA45C87BA@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
 <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
 <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0258.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::30) To AS8PR08MB6808.eurprd08.prod.outlook.com
 (2603:10a6:20b:39c::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 846dea20-7ab9-487d-d773-08d9a44ae139
X-MS-TrafficTypeDiagnostic: AM6PR08MB5031:|PA4PR08MB6126:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB6126623B5D0D6EFD25080B28E4939@PA4PR08MB6126.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Uip0AxUIikfgvZj+x24wiKd5MbrU7PjJZE9gzBAbSBDF2SO2gf1YNtlyzCMlq0WJSw14wwyO7HDEnGya2+HUgFaOpE1y/EOlTmvkhhzr6x2vs1X0LfA5hQiFJ6LdZZWN6GAzGbItN1s80M/oSxwNz2qG4TTmmPoIt5TLf0pRFxVFlRRJnFN0bHe2RnMlxMZzH10rLqNYJePFA9xqHX6b1de5YqnUEXltGv3lXcujJgaEqaO9C/36rVSrHnoStAFHKslfq3hZ/lHRiW31G+U8cvAVewuajKQQmDIgSY2LGdgin20AAFeNmO2po9hZ0+8LXViC/hjs4BLTDWwU4Vm45mDkUAvkt12g1yeVslCMyipiXMbHXpdFZSgdiQUoZ4aYuXRuSC3/dhLFAnjMrZspEHgrkxCbBKascq8jEzaUcS13ggZHNFhnRpkiGimCQ5AVfIL5D/TzknWBLnecqi7xD33o36AePQ8cBMenzEpbFNaHbfzuYhLLxv7up1zMNIdazRtD46DLbSKdgRHg31p0zqTHZiBdIHw1QjUjyjjqTF+yle7SZ0tGHz5Mn2NOYUOy4qNq83L/lPiYNp6s34nTuEUvbk8HRQtId8/x/rCVYnINzCP1TFxAlnXKuRGkOzrFVengydGXpTxHbVL5RLlRVjptu3xDYuuGAf0Z9O3BkV8YkyXCM0hlVdLH8Jp13JBTXO1Tkbl6dsLgPEa9u7tbQI97aTc3z0N1OS/nKdS6r0s=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6808.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(26005)(508600001)(6506007)(38350700002)(66556008)(8936002)(186003)(6486002)(54906003)(2906002)(6916009)(316002)(6666004)(6512007)(4326008)(5660300002)(53546011)(86362001)(956004)(83380400001)(44832011)(2616005)(36756003)(33656002)(52116002)(66946007)(38100700002)(66476007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5031
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55b3e69e-6930-47db-49c0-08d9a44ad8db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ggQ2aeu1xOLRhsmGDWgrAq1jLBazJ0fKWqiZnGMl0MBlJYgcDCZwwIyQaZ3D6b3ZNvgCrlCbLzZqEVwe5XQtQSUUzbqUnmzY/p4qE4E76meNr/xIbpxxnIFZSggKyasqRVtD+a7NOQyWHp0aspIoMdZbuFxPi5jUPcrdokWBhLqEXlmBjYQfocfKpEZUWQBSpl2YhKSurHZ+35vKUpxR/KoGE20JGuN+ckBx/PTmTbdiQ42HynD/+ZAMSoqfMuuvo4gNIBgYbNN2Zszt8Khzuy5fLHjaFKiwIniy2ddpfHwBaUl2IwVxQvmmVoYL9lCpBD1VG5h19zR+g93c4SV6RUb0zk5PV2biqkyu9GBgyIkSEbXmSpROAay8phOpLNQFlMInnzjs+EuTv/ejB9YiW8pFi1XxSIhEQR91kOEZ7RZYRyNapQdZQChDaeG5ka3Qs64Sq7Nl6pZqFYhnyL0PYM5wCNkuwqsN2BI1DanOL8d9yXEWHnSppFEC3aFZyWSS7+KgrUbjrT44daSkvsSVOXDsPxZMv0eORgC9CVeevcWdbn7dtmJI7dWBziSvbl1DrBHVi9knnx9ykLNMvWGkCiNRyEp1YI/gcRD6BCyVEqzReaLDv/R+l5n/dLTGFMVjQOn9nryddIemqD/qiZhDZBWst0yy5/yP7UxwtoxfjVmt++Mqr8bzqznvz5MzplFM+BB4isr0kfrvWhQxqa3QDQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(8936002)(8676002)(6862004)(508600001)(356005)(26005)(36756003)(6486002)(47076005)(33656002)(5660300002)(6512007)(6666004)(4326008)(70586007)(36860700001)(70206006)(44832011)(186003)(2616005)(956004)(86362001)(336012)(83380400001)(316002)(81166007)(82310400003)(6506007)(53546011)(54906003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 13:06:16.1385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 846dea20-7ab9-487d-d773-08d9a44ae139
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6126



> On 9 Nov 2021, at 21:52, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Tue, 9 Nov 2021, Jan Beulich wrote:
>> On 09.11.2021 03:11, Stefano Stabellini wrote:
>>> On Mon, 8 Nov 2021, Jan Beulich wrote:
>>>> On 05.11.2021 16:33, Stefano Stabellini wrote:
>>>>> My main concern is performance and resource utilization. With v3 of t=
he
>>>>> patch get_parent_handle will get called for every module to be loaded=
.
>>>>> With dom0less, it could easily get called 10 times or more. Taking a
>>>>> look at get_parent_handle, the Xen side doesn't seem small and I have
>>>>> no idea how the EDK2 side looks. I am just worried that it would
>>>>> actually have an impact on boot times (also depending on the bootload=
er
>>>>> implementation).
>>>>=20
>>>> The biggest part of the function deals with determining the "residual"=
 of
>>>> the file name. That part looks to be of no interest at all to
>>>> allocate_module_file() (whether that's actually correct I can't tell).=
 I
>>>> don't see why this couldn't be made conditional (e.g. by passing in NU=
LL
>>>> for "leaf").
>>>=20
>>> I understand the idea of passing NULL instead of "leaf", but I tried
>>> having a look and I can't tell what we would be able to skip in
>>> get_parent_handle.
>>=20
>> My bad - I did overlook that dir_handle gets updated even past the
>> initial loop.
>>=20
>>> Should we have a global variable to keep the dir_handle open during
>>> dom0less module loading?
>>=20
>> If that's contained within Arm-specific code, I (obviously) don't mind.
>> Otherwise I remain to be convinced.
>=20
> I think we can do something decent entirely within
> xen/arch/arm/efi/efi-boot.h.
>=20
> Luca, see below as reference; it is untested and incomplete but should
> explain the idea better than words. With the below, we only open/close
> the handle once for the all dom0less modules.
>=20
>=20
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 458cfbbed4..b5218d5228 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -24,6 +24,7 @@ static struct file __initdata module_binary;
> static module_name __initdata modules[MAX_UEFI_MODULES];
> static unsigned int __initdata modules_available =3D MAX_UEFI_MODULES;
> static unsigned int __initdata modules_idx;
> +static EFI_FILE_HANDLE __initdata dir_handle;
>=20
> #define ERROR_BINARY_FILE_NOT_FOUND (-1)
> #define ERROR_ALLOC_MODULE_NO_SPACE (-1)
> @@ -651,9 +652,7 @@ static int __init allocate_module_file(EFI_LOADED_IMA=
GE *loaded_image,
>                                        const char *name,
>                                        unsigned int name_len)
> {
> -    EFI_FILE_HANDLE dir_handle;
>     module_name *file_name;
> -    CHAR16 *fname;
>     union string module_name;
>     int ret;
>=20
> @@ -685,14 +684,9 @@ static int __init allocate_module_file(EFI_LOADED_IM=
AGE *loaded_image,
>     strlcpy(file_name->name, name, name_len + 1);
>     file_name->name_len =3D name_len;
>=20
> -    /* Get the file system interface. */
> -    dir_handle =3D get_parent_handle(loaded_image, &fname);
> -
>     /* Load the binary in memory */
>     read_file(dir_handle, s2w(&module_name), &module_binary, NULL);
>=20
> -    dir_handle->Close(dir_handle);
> -
>     /* Save address and size */
>     file_name->addr =3D module_binary.addr;
>     file_name->size =3D module_binary.size;
> @@ -862,6 +856,7 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE =
*loaded_image)
> {
>     int chosen, node, addr_len, size_len;
>     unsigned int i =3D 0, modules_found =3D 0;
> +    CHAR16 *fname;
>=20
>     /* Check for the chosen node in the current DTB */
>     chosen =3D setup_chosen_node(fdt, &addr_len, &size_len);
> @@ -871,6 +866,8 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE =
*loaded_image)
>         return ERROR_DT_CHOSEN_NODE;
>     }
>=20
> +    dir_handle =3D get_parent_handle(loaded_image, &fname);
> +
>     /* Check for nodes compatible with xen,domain under the chosen node *=
/
>     for ( node =3D fdt_first_subnode(fdt, chosen);
>           node > 0;
> @@ -902,6 +899,8 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE =
*loaded_image)
>         efi_bs->FreePool(modules[i].name);
>     }
>=20
> +    if ( dir_handle )
> +        dir_handle->Close(dir_handle);
>     return modules_found;
> }
>=20

Hi Stefano,

I thought having the EFI_FILE_HANDLE global in efi-boot.h was a =E2=80=9Cno=
 go=E2=80=9D, but if it=E2=80=99s not then instead of
calling get_parent_handle in efi_check_dt_boot (that is the main issue with=
 EDK2+Grub2), we can do
something like this:

diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 458cfbbed4..169bbfc215 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -24,6 +24,7 @@ static struct file __initdata module_binary;
 static module_name __initdata modules[MAX_UEFI_MODULES];
 static unsigned int __initdata modules_available =3D MAX_UEFI_MODULES;
 static unsigned int __initdata modules_idx;
+static EFI_FILE_HANDLE __initdata fs_dir_handle;
=20
 #define ERROR_BINARY_FILE_NOT_FOUND (-1)
 #define ERROR_ALLOC_MODULE_NO_SPACE (-1)
@@ -651,7 +652,6 @@ static int __init allocate_module_file(EFI_LOADED_IMAGE=
 *loaded_image,
                                        const char *name,
                                        unsigned int name_len)
 {
-    EFI_FILE_HANDLE dir_handle;
     module_name *file_name;
     CHAR16 *fname;
     union string module_name;
@@ -686,12 +686,11 @@ static int __init allocate_module_file(EFI_LOADED_IMA=
GE *loaded_image,
     file_name->name_len =3D name_len;
=20
     /* Get the file system interface. */
-    dir_handle =3D get_parent_handle(loaded_image, &fname);
+    if ( !fs_dir_handle )
+        fs_dir_handle =3D get_parent_handle(loaded_image, &fname);
=20
     /* Load the binary in memory */
-    read_file(dir_handle, s2w(&module_name), &module_binary, NULL);
-
-    dir_handle->Close(dir_handle);
+    read_file(fs_dir_handle, s2w(&module_name), &module_binary, NULL);
=20
     /* Save address and size */
     file_name->addr =3D module_binary.addr;
@@ -895,6 +894,10 @@ static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *=
loaded_image)
         modules_found +=3D ret;
     }
=20
+    /* allocate_module_file could have allocated the handle, if so, close =
it */
+    if ( fs_dir_handle )
+        fs_dir_handle->Close(fs_dir_handle);
+
     /* Free boot modules file names if any */
     for ( ; i < modules_idx; i++ )
     {


I=E2=80=99ve not tested these changes, but I=E2=80=99ve built them for arm/=
x86 and they build.

What everyone think about that?

Cheers,
Luca


