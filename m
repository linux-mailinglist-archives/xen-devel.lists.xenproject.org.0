Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3BC43F830
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 09:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218424.378851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgMg9-0003g8-18; Fri, 29 Oct 2021 07:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218424.378851; Fri, 29 Oct 2021 07:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgMg8-0003e6-U1; Fri, 29 Oct 2021 07:51:56 +0000
Received: by outflank-mailman (input) for mailman id 218424;
 Fri, 29 Oct 2021 07:51:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZHrx=PR=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mgMg6-0003dv-SG
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 07:51:55 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.87]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa106ed8-f393-43de-89d9-2e42496420b3;
 Fri, 29 Oct 2021 07:51:52 +0000 (UTC)
Received: from AM5P194CA0016.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::26)
 by VI1PR0802MB2365.eurprd08.prod.outlook.com (2603:10a6:800:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 29 Oct
 2021 07:51:50 +0000
Received: from AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::29) by AM5P194CA0016.outlook.office365.com
 (2603:10a6:203:8f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Fri, 29 Oct 2021 07:51:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT050.mail.protection.outlook.com (10.152.17.47) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 07:51:49 +0000
Received: ("Tessian outbound 4ce13939bd4a:v108");
 Fri, 29 Oct 2021 07:51:49 +0000
Received: from e03c7cb1c5a0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B80FD207-E6BE-44F5-8E9A-F86949033244.1; 
 Fri, 29 Oct 2021 07:51:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e03c7cb1c5a0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 29 Oct 2021 07:51:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM6PR08MB4674.eurprd08.prod.outlook.com (2603:10a6:20b:c7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 07:51:40 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::69d7:e26:6610:ebd8%4]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 07:51:40 +0000
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
X-Inumbo-ID: aa106ed8-f393-43de-89d9-2e42496420b3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMoLwd/Uw5OFVjuUUsn5qr/Fc3hsQlU/rFYH58TLTTo=;
 b=OLQEhOwQiyWfa+Mf8gg/9HEIfis//nAtQzcnuQgP43drHMPORFUn5CLBKOG0Hh0Ia/ajLhfLeTxIfUqCh+oPHIL0GPO2yjvSESD+KNv/loz3+9DNAMbyY3jxg+88mkynYSKOFVyAKePCiJaGAGI3kIKlX4dVlWOZkvJYlcyfNOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6880f59315649ec3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khj19kLCe1rTM18C/4LNvYBWaf95rnpMyohfP5CfKSMkmCQiv8qnTRZslAtyKvYqQgdOrMJvCNVrPSgG3rKfEOpDo5zCCaxjGVQuSq/+eYpgFlHiCx8GsvBnjdqfyGSVMgyGscsVUFxuSYxZ3lT0sBSLBGCvJHPlGeHgYsHA9CiQZ5y/UceKiSDSYVgfy4oaepilUhpM2jdWDt7Qcb7D3q8LqdfJzBUgq1iR6Mp7qx5V+oW9pADFqukAbm47h2LDPJQ0t2i+HeC7+68wblm4qA5mPZiqUwi5mkLbFIuPakXzgCqsqG3WC0/nmA2dt2Ct1jaCYg7pPl3J0/EG9c4ECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMoLwd/Uw5OFVjuUUsn5qr/Fc3hsQlU/rFYH58TLTTo=;
 b=hyird8WxVsWnDiHpIqc/Zle9uEZvi4/PH62dEMZeEK+gT9gJ7Le7sI9wFsHE57LHfSiG3mU2F4KIapdpg7TXMAXjjAl1I6XtpK8XS3czSCP6GV+PU4+knGRgVkem9kUWn9RG41izufirYrXj5HGRv32N9//wEIgQWpMIpdLNWqlGxI5mbrLJ2Vmq1HMqou0Dk4mlzxwn2AJXPoqkM5r4DxJwr5bvmQfyxqyzH3S0Fuusfa8AlQiHDs29epW8KeepUDKjvDiLmz/nnqCN0erTgw5+JjXL5I+7lTNonpzi9IB1GcnS00Y3gL1sm7KMRgxLD4uhdbUVIp4KbFH9cg1BkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMoLwd/Uw5OFVjuUUsn5qr/Fc3hsQlU/rFYH58TLTTo=;
 b=OLQEhOwQiyWfa+Mf8gg/9HEIfis//nAtQzcnuQgP43drHMPORFUn5CLBKOG0Hh0Ia/ajLhfLeTxIfUqCh+oPHIL0GPO2yjvSESD+KNv/loz3+9DNAMbyY3jxg+88mkynYSKOFVyAKePCiJaGAGI3kIKlX4dVlWOZkvJYlcyfNOs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>,
	Michal Orzel <Michal.Orzel@arm.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
Thread-Topic: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
Thread-Index:
 AQHXymUg+0MR4ITOT0Gs5iPzJutqzKvleE2AgAAH0ICAASmBgIAAanYAgABn5gCAAAgVgIAACmyAgACjWoCAAK7mAIAAvhaA
Date: Fri, 29 Oct 2021 07:51:40 +0000
Message-ID: <992FE375-4754-4268-8D27-C27C32FDD4F4@arm.com>
References: <20211026122903.15042-1-michal.orzel@arm.com>
 <e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org>
 <70c30a6c-b779-805e-079a-41bb484894b9@xen.org>
 <cb452c0c-ccde-7798-c403-f972b48a2c46@arm.com>
 <01545115-e82e-2a9d-a8e4-da9676080c0f@xen.org>
 <alpine.DEB.2.21.2110271557570.20134@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2SSgG7a87_xTGT5LeNLgubOLQf1+dbnrsTsP8_p5ErJg@mail.gmail.com>
 <alpine.DEB.2.21.2110271658330.20134@sstabellini-ThinkPad-T480s>
 <4554621d-63da-ea3e-e56a-4e01d0cef347@xen.org>
 <alpine.DEB.2.21.2110281311030.20134@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110281311030.20134@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7e9243c8-b848-4826-efd1-08d99ab0f6e6
x-ms-traffictypediagnostic: AM6PR08MB4674:|VI1PR0802MB2365:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2365D0C187FBF7E5A5FB9CCC9D879@VI1PR0802MB2365.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5L/GarYcnaJqgu0OgS5RqblHM8Kaf+XWtjRKeIs9SZ0co89YZDR6l7vgsnxBx8CsKdNb7h5kA2vcCRVnrm8nqDnolY7cKrA1W0MWIQUzAHGtIWDhXqjTPhx+3yDnrhQFbgDDNbI1Ob32hWzFvl//VgUzV9kFxiuPBpF2f8HGfOb2b5pwlkxXYEwIYU1L2lqSAl/9h8hS/yN1FsXEVrH6nqA75whgPzcJO6hY4r2JOWYXr+RunZ3T5UUr+7f4PWGE7RjTNawoUpKcqpu8j9LhcN+7DhsWAu/Eykeoq5D+BIkWctp/+gC+f+PltqeTZ+TxdcfCNP32Zf8Og5g1H99xfIz2nFGB96gtb97TTw8+sCBaStZTMrClk7gdteQVieVF+S188LSJwWxZhFkZqSc5DPOfLNwsgXpNEWngMrYHDx1pGF3FzWCHONSxHMevx+Llb/PKntIKx1LHiwRI8QZjPnbofA34/SI4FhnmAUF08sxLAcAIUGwNZma/4iU8g4y5b1zWBL+9sMFV0vh+iloOif59fJ5SKR2ubOzBCDKWyKdBfPHdtJk66/Y22mf+GqrDXSlFTpiMYCZ3MBQhAWk4UrJLTcrMfyN+CmqmwnqjUeTzXTYBTtPCnvqwz3qXaa9oVAArcmlmGaFYADWPq31dzen3An4Wy9KrRky/EqbLTa1BoiF2vqxkVJMSwnPSB2MdVgMnlWrId8v9XGp9f1YFvpyTr8n77A6j8oit1sjw2kXzo60Qn9y4kRxcrV0OtgnJ
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(66946007)(64756008)(66476007)(66446008)(66556008)(86362001)(8676002)(91956017)(2906002)(26005)(186003)(38070700005)(8936002)(36756003)(122000001)(83380400001)(38100700002)(71200400001)(6916009)(33656002)(53546011)(5660300002)(6506007)(4326008)(316002)(2616005)(6512007)(54906003)(6486002)(508600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8CB87B2915D6A143BF1393DA919DE68C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4674
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	edaffebd-76bb-4d8a-7645-08d99ab0f172
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HsuTxIaZ4WSmLQ6fThC4GIMFpXOnhFK9ztCv+Ht9GvZrYR/YeZ19cuFc+1B8mNewQKZOFmo9DoKrxoSYbrRQGMEi8GK5Zaaasbdnj8oUqujgei8D+JGmOiUcI5EhNjM6dFlg+9neCS3a9BmJyxO/d5B8031a1gUQhAhv5iPVfdQ3Tme8aaUGZ3md16NW832XK0cTY3tVI9DuS4MOPJbZDzBjSSmc/MHn2Txi8TRNDWv1Z4q5CxpbUMNRQh05NFbRCwrx84SbOeCm96ebr/cfP+kN2j8b3P+obQQZlXBgyd1/OCRBvOo6nW7mi6JVlzNdgp4uTnWOXLSDl8mNNOGKUSt/5ZAu5IZCpD9/r4He6jFHh86dqPljaVDrFLH7DZGuEdfwxNCfTSQzjVnuIdaYju5scyy88t3IBlDdAmw8gksDY/zybbEEhJ/Rj5wVPVkzuCiyhXnIHywZ6Xpo4RsEJiGPTUBjU1LsC11ZJ7Kb8l2VmK1x3cgMughm4vMqvJ5iv4eiJ9uhL7VI9+A6QoaMdSUmlhcVTEzgC3qUpIXLtDVLXynfl4sDBZ5h/JDLnTg40wmcZPuHmEbha1GtvwtBK94x5MJMWcRY/NLvkWWOEqkJHcmEdvhFx3WQuxURagQtJWvqgF8BlCGb6g2VkNDLR8dDI08U0CQJt7zx51qHW5Cm9BNTenpcBy1dbQyX0N/j5o/o5cXjiAlkt4mdhtkqbw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8676002)(70586007)(54906003)(6512007)(336012)(82310400003)(86362001)(2616005)(36756003)(8936002)(81166007)(508600001)(186003)(70206006)(53546011)(5660300002)(83380400001)(2906002)(33656002)(4326008)(316002)(36860700001)(47076005)(6862004)(6506007)(26005)(356005)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 07:51:49.6177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9243c8-b848-4826-efd1-08d99ab0f6e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2365

Hi,

> On 28 Oct 2021, at 21:31, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 28 Oct 2021, Julien Grall wrote:
>> Hi Stefano,
>>=20
>> First apologies for sending the previous e-mails in HTML (thanks for poi=
nting
>> that out!).
>>=20
>> On 28/10/2021 01:20, Stefano Stabellini wrote:
>>> On Thu, 28 Oct 2021, Julien Grall wrote:
>>>> On Thu, 28 Oct 2021, 00:14 Stefano Stabellini, <sstabellini@kernel.org=
>
>>>> wrote:
>>>>       On Wed, 27 Oct 2021, Julien Grall wrote:
>>>>>>>>> +    return ret;
>>>>>>>>>     }
>>>>>>>>>     static int register_smmu_master(struct arm_smmu_device
>>>> *smmu,
>>>>>>>>> @@ -2056,7 +2066,10 @@ static int
>>>> arm_smmu_add_device(struct device
>>>>>>>>> *dev)
>>>>>>>>>         } else {
>>>>>>>>>             struct arm_smmu_master *master;
>>>>>>>>> +        spin_lock(&arm_smmu_devices_lock);
>>>>>>>>>             master =3D find_smmu_master(smmu, dev->of_node);
>>>>>>>>> +        spin_unlock(&arm_smmu_devices_lock);
>>>>>>>>=20
>>>>>>>> At the moment, unlocking here is fine because we don't
>>>> remove the
>>>>>>>> device. However, there are a series to supporting removing
>>>> a device (see
>>>>>>>> [1]). So I think it would be preferable to unlock after the
>>>> last use of
>>>>>>>> 'cfg'.
>>>>>>>>=20
>>>>>> Ok. I will move unlocking to the end of this else {} block. I
>>>> was not aware
>>>>>> of the patch you are referring to.
>>>>>=20
>>>>> I think the end of the else is still too early. This needs to at
>>>> least be past
>>>>> iommu_group_set_iommudata() because we store cfg.
>>>>>=20
>>>>> Potentially, the lock wants to also englobe
>>>> arm_smmu_master_alloc_smes(). So I
>>>>> am wondering whether it would be simpler to hold the lock for the
>>>> whole
>>>>> duration of arm_smmu_add_device() (I can see value when we will
>>>> want to
>>>>> interlock with the remove code).
>>>>=20
>>>>       The patch was to protect the smmu master list. From that point o=
f
>>>> view
>>>>       the unlock right after find_smmu_master would be sufficient, rig=
ht?
>>>>=20
>>>>=20
>>>> Yes. However this is not fixing all the problems (see below).
>>>>=20
>>>>=20
>>>>       We only need to protect cfg if we are worried that the same devi=
ce
>>>> is
>>>>       added in two different ways at the same time. Did I get it right=
?
>>>> If so,
>>>>       I would say that that case should not be possible? Am I missing
>>>> another
>>>>       potential conflict?
>>>>=20
>>>>=20
>>>> It should not be possible to add the same device twice. The problem is
>>>> more when we are going to remove the device. In this case, "master"
>>>> may disappear at any point.
>>>>=20
>>>> The support for removing device is not yet implemented in the tree. Bu=
t
>>>> there is already a patch on the ML. So I think it would be
>>>> shortsighted to only move the lock to just solve concurrent access to =
the
>>>> list.
>>>  That makes sense now: the other source of conflict is concurrent add a=
nd
>>> remove of the same device. Sorry it wasn't clear to me before.
>> At the moment, we are relying on the upper layer (e.g. PCI or DT subsyst=
em) to
>> prevent concurrent add/remove/assignment. The trouble is we don't have a
>> common lock between PCI and DT.
>>=20
>> One possibility would be to add a common in the uper layer, but it feels=
 to me
>> this is a bit fragile and may also require longer locking section than
>> necessary.
>>=20
>> That said, add/remove/assignment operations are meant to be rare. So thi=
s is
>> could be an option. This would also have the advantage to cover all the
>> IOMMUs.
>>=20
>>>=20
>>>>       I am pointing this out for two reasons:
>>>>=20
>>>>       Protecting the list is different from protecting each element fr=
om
>>>>       concurrent modification of the element itself. If the latter is =
a
>>>>       potential problem, I wonder if arm_smmu_add_device is the only
>>>> function
>>>>       affected?
>>>>=20
>>>>=20
>>>> I had a brief looked at the code and couldn't find any other places wh=
ere
>>>> this may be an issue.
>>>>=20
>>>>=20
>>>>       The second reason is that extending the lock past
>>>>       arm_smmu_master_alloc_smes is a bit worrying because it causes
>>>>       &arm_smmu_devices_lock and smmu->stream_map_lock to nest, which
>>>> wasn't
>>>>       the case before.
>>>>=20
>>>>=20
>>>> Nested locks are common. I don't believe there would be a problem here
>>>> with this one.
>>>>=20
>>>>=20
>>>>       I am not saying that it is a bad idea to extend the lock past
>>>>       arm_smmu_master_alloc_smes -- it might be the right thing to do.
>>>>=20
>>>>=20
>>>> I don't usually suggest locking changes blindly ;).
>>>>=20
>>>>       But I
>>>>=20
>>>>       am merely saying that it might be best to think twice about it.
>>>>=20
>>>>       and/or do
>>>>       that after 4.16.
>>>>=20
>>>>=20
>>=20
>> [...]
>>=20
>>> The other thing that is not clear to me is whether we would need also t=
o
>>> protect places where we use (not allocate) masters and/or cfg, e.g.
>>> arm_smmu_attach_dev, arm_smmu_domain_add_master.
>>=20
>> I think both should be with the lock. Now the question is will other IOM=
MUs
>> driver requires the same locking?
>>=20
>> If yes, then maybe that locking should be in the common code.
>>=20
>>>> That said we can work towards a new locking approach for 4.17.
>>>> However, I would want to have a proposal from your side or at least
>>>> some details on why the suggested locking is not suitable.
>>>  The suggested locking approach up until the last suggestion looks
>>> totally fine to me. The last suggestion is a bit harder to tell because
>>> the PCI removal hook is not there yet, so I am having troubles seeing
>>> exactly what needs to be protected.
>>=20
>> The PCI removal hook is the same as the platform device one. There are a=
lready
>> a patch on the ML (see [1]) for that.
>>=20
>> We have two interlocking problem to resolve:
>>  1) Concurrent request between PCI and platform/DT subsystem
>>  2) Removal vs add vs (re)assign
>>=20
>> The two approaches I can think of are:
>>=20
>> Approach A:
>>  - The driver is responsible to protect against 1)
>>  - Each subsystem (DT and PCI) are responsible for 2)
>>=20
>> Approach B:
>>  The driver is responsible to protect for 1) 2).
>>=20
>> From my understanding, the proposed patch for Michal is following approa=
ch A
>> whilst my proposal is going towards approach B.
>>=20
>> I am open to use approach A, however I think this needs to be documented=
 as
>> the lock to use will depend on whether the device is a PCI device or not=
.
>=20
> Thanks for the explanation, now everything is a lot clearer. I don't
> have feedback on approach A vs. B -- it looks like both could work well.
>=20
> In regards to this specific patch and also the conversation about 4.16
> or 4.17: I think it would be fine to take this patch in 4.16 in its
> current form. Although it is not required because PCI passthrough is
> not going to be complete in 4.16 anyway, I like that this patch makes
> the code consistent in terms of protection of rbtree accesses.  With
> this patch the arm_smmu_master rbtree is consistently protected from
> concurrent accesses. Without this patch, it is sometimes protected and
> sometimes not, which is not great.
>=20
> So I think that is something that could be good to have in 4.16. But
> like you said, the patch is not strictly required so it is fine either
> way.

I think that this patch should be added in 4.16 as it addressing an issue (=
even
if it could not be triggered) as it will serve also as a reminder when the =
rest of
the PCI serie will be added.

So I would say: merge with changes in commit message (needs a v2).

>=20
> Other changes on top of it, e.g. a complete implementation of Approach A
> or Approach B, I think it would be best to target 4.17 so that we can
> evaluate them together with the other outstanding PCI patches. I think
> it would make the review a lot easier (at least for me.)

For the rest, having the full picture with the rest of the PCI patches will=
 help as
most of this code will be modified by it anyway.

Cheers
Bertrand


