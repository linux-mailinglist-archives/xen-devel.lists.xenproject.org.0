Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A93C444481
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:17:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220992.382487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miI0R-0005Ft-N2; Wed, 03 Nov 2021 15:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220992.382487; Wed, 03 Nov 2021 15:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miI0R-0005DI-J2; Wed, 03 Nov 2021 15:16:51 +0000
Received: by outflank-mailman (input) for mailman id 220992;
 Wed, 03 Nov 2021 15:16:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PtR=PW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1miI0P-0005D6-TF
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:16:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0615.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fe96920-3cb9-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 16:16:47 +0100 (CET)
Received: from AS9PR06CA0117.eurprd06.prod.outlook.com (2603:10a6:20b:465::32)
 by DB9PR08MB7471.eurprd08.prod.outlook.com (2603:10a6:10:36d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 15:16:46 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::79) by AS9PR06CA0117.outlook.office365.com
 (2603:10a6:20b:465::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 15:16:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 3 Nov 2021 15:16:45 +0000
Received: ("Tessian outbound 6ebd41198c5d:v108");
 Wed, 03 Nov 2021 15:16:45 +0000
Received: from e0a9c11d5a42.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 630179E6-568A-4729-8DC5-05B0971B12E2.1; 
 Wed, 03 Nov 2021 15:16:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0a9c11d5a42.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Nov 2021 15:16:35 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6206.eurprd08.prod.outlook.com (2603:10a6:102:ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Wed, 3 Nov
 2021 15:16:32 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 15:16:32 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0165.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 15:16:32 +0000
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
X-Inumbo-ID: 0fe96920-3cb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkaGPG38pcNYLgdAHpkY2CIwtUuOV0u+KZq/w0kKhI0=;
 b=tJJrA2BaauooHCNRuXylfajuf/qRI+7rHIm4JOElDQlO9gpn0EG0QgaR2WQN3xOf8y6KVVqoPh0h7cXxx2CNzcJMwM4kWGTEB8Gm1bH1KjohWJ+26SsurrmK34sbb4jLE1wN7IhPylq9tCckebu9cKcEgW0l8GdcCUaewbRebis=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ab5fa06ebb18518
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7CR2z7lW6tpqvlxYI4SdLRVQE2EQXeLb2HJfuGnJPxYp6d6qSvsMjPZ/2lbjGh0AvcTSdpZXMqrzQV/prWK2Z3mR0POLM4byS3IyLMO/ieHA6wapPT8ShjwLmu6LwG8KIpgWDh3t1hrraZI4hVo3swaNpF68ZCDh68ncpmatzmcMAVQThvNiR7tnOlS1oLi0VoxIuGJqL2T/Pi8JDHNixrmooXhXWZWIGlo+KEhj+TcXQDH+NnilDQ0BM+f/auSkm0Lka7QMCA0G+tBPhM8j4wNCCwUvfIc3bME7QZf8S13tzMebOhu7RcIImKjkQV33BjxQjWGoidcAJD1LUqWKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkaGPG38pcNYLgdAHpkY2CIwtUuOV0u+KZq/w0kKhI0=;
 b=c9qE9s7YpeqxbJFxl7RbJGK7QLG77ImfFRBsV4DRicYcVxaWbJ38FX7QZo/au8vl9WEDObzSyqTprdvJNO6RUYSG2xGPav7hKlLrjXPmYHC0rLP9SQ4+cFhsZ/QMKi7ZdxTt/MQSucT3730eo5dGeP45b3Uj2c3C0qvURvFJaoHcXxrvIdqYSKy2n0hqWdwOn2N4j96KX1FUv7EE75pm5Aeur4ZyxynByZ9Uskb7l1sNAEm/45cHyZTWkW3L48lWmn3TQp5i4Mm+QQ0xlpFngXqFJArotDo3s5aV6FIfXqBgCKj+UAMeR6aAWjszXOgGSZDqVspCPkngFpQgh76F/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkaGPG38pcNYLgdAHpkY2CIwtUuOV0u+KZq/w0kKhI0=;
 b=tJJrA2BaauooHCNRuXylfajuf/qRI+7rHIm4JOElDQlO9gpn0EG0QgaR2WQN3xOf8y6KVVqoPh0h7cXxx2CNzcJMwM4kWGTEB8Gm1bH1KjohWJ+26SsurrmK34sbb4jLE1wN7IhPylq9tCckebu9cKcEgW0l8GdcCUaewbRebis=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <ad621757-afac-f36f-0b3c-7fe1ddb83a66@suse.com>
Date: Wed, 3 Nov 2021 15:16:25 +0000
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB5E1F4C-36BC-413B-88DA-487BA573BFCC@arm.com>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
 <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
 <6a8ecb5b-7ea4-7dd8-4acf-587b51862aed@suse.com>
 <845D8368-B9DA-4A5C-8F8D-6AAE55E326A0@arm.com>
 <16c6757d-1bb3-361f-a41f-26b9bc89a2b4@suse.com>
 <83E4F969-892C-4AA2-829D-67C02B4B5885@arm.com>
 <ad621757-afac-f36f-0b3c-7fe1ddb83a66@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0165.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::8) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebe2edb0-17af-420d-5c65-08d99edcf305
X-MS-TrafficTypeDiagnostic: PA4PR08MB6206:|DB9PR08MB7471:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB7471B2F874B356A7E153BBC5E48C9@DB9PR08MB7471.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K6pWWo2Lmi9e0UAEKHNNFq4V4eJPah5K/AY92igl563t22lDPgSitMX9M5gpUCPkEr8uiy89grv+Z8Q8NOvPUxOSoyrXP3l1TGroS479at/oWb3vhzot5DklPKnhfpzHF4YvAg+IhnC3dtr7u6aXbtGFXe43KiVUSlXowSIzrOrd3eM+8PODs/6QZKlFbitRlBZGw6CjA4MzDRZI0odZHhKGnpq/CBg8TLKxx4bn8aJvJSojaxm8ve9B/OnNRf/4iyheifjg6BtI2ogjTfvrFVL/tMBgP3Jhuui3tTBlGOR+FwYjZ61Uq3Ss0hEjApT18Eno0GgYxhPflMJvc1hd5kA8zLZXV/uiZXSUnEw50EvultC3FC/IqK4kuQ7fFxP42egE+A+4m88OBI5kDgldl2HcZJxbzxHJVLln0FsCRte+Gi/gKe/8DUm6y1Nc4wPNc5XAD1gncmdTKVcqdFUuoKkzczidOviWmE8E6oGHnHu+DHlYs9fHSa65NLG1GRRM9G6Z+J2+2P4FEQsENQKgQdjDfEp5oBI9hLahFsbAyyx5wQwU5+JXnz/dh2UQq4sFK55ONp4NQhV8f+9ISxkqGOBT68Lw80jgTI9a5ZLFl2EEimPC0UwmcRZRiwPZBGua7hMLrgITgxwxr2Nlq04+AN8Y7byOncUQTKOfvSeTgLNR70RASJ2m49viMbp7MQA0GY7q10ybZEqrAlDgHeJQC6GwTkDXVQZv5vsgjha57IQRrcyQH831BpzleWIlcUf1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(44832011)(6916009)(2616005)(6486002)(5660300002)(8676002)(33656002)(8936002)(6666004)(956004)(38350700002)(38100700002)(86362001)(508600001)(6512007)(66946007)(66556008)(66476007)(53546011)(6506007)(26005)(52116002)(83380400001)(2906002)(36756003)(316002)(54906003)(186003)(4326008)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6206
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f248f5f-78ce-4582-dc3d-08d99edceb21
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LUnEwlJjEQxbON9kyYNc+5NeXnmKXFEKuIhOwhwLXyuGKBOzBKG8s9zlgsclPdx38EgZcAYxxWnV6d6FgQVmjnuy4O4TwC293+hx7LmWzgTeMxZwMbVIdaHCajdMWj4nLvBVdhy/Xp84uT1l2lzspN2cbkRIWg/EMk2Vaif4dk4MWA0SCsNDTu3JtSbDOmoUGPNex/D6ds0duHWmBaHtaQiRntFkpouFLZqiExt2vjbrnq683Xa5bQHh6drDlEq+XGXL5vkiW2djexzWPo3RhXR0yxunx3iugO1J0uzIvW3pkf0vjd1MsA0fGswVz9+Dsvw9BnBKYVhOQEwreKN60Qnfm0YTg+BT5nU3mX2q973JOyVnJEihDLjHvIOnreEJBc6PyHGzxBVQULe5YPH39mmI5pXMfsdFMBHPbku1IE5c3eRqtV9+ZX0M45UN3w7AyOr9VfmRi3Yo69yM6hRhgBF6alc1XSBPLdTVOUaM0Bej3y22ETG5Naev8LlIj/83ZJbRYBd9OApvpoa+JIizdgR4HGsSswVen5q3mqjRWQZpVsNy5Yim9Gxd90XkYRRb+ga+uTVbGEbifkY7jY5pZdS51k4pWno4YSfLCHK57uwqkTAipzclJFYeQMG/X/g8Vhd0RXe/vjslnitsu/kuV/JMJ/1VU4jicMIr3K3a2J/O393enl3c095zq7Coc+eQ1om6g0kpF7y5Pai2L+uAyA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(8936002)(8676002)(2906002)(33656002)(54906003)(86362001)(81166007)(316002)(4326008)(356005)(70586007)(36860700001)(508600001)(5660300002)(186003)(6486002)(36756003)(6666004)(26005)(6862004)(47076005)(2616005)(956004)(82310400003)(44832011)(53546011)(6506007)(6512007)(83380400001)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:16:45.5505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe2edb0-17af-420d-5c65-08d99edcf305
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7471



> On 3 Nov 2021, at 14:30, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 03.11.2021 15:09, Luca Fancellu wrote:
>>> On 3 Nov 2021, at 11:28, Jan Beulich <jbeulich@suse.com> wrote:
>>> On 03.11.2021 11:20, Luca Fancellu wrote:
>>>>> On 3 Nov 2021, at 08:20, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 02.11.2021 18:12, Luca Fancellu wrote:
>>>>>>> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>> On 02.11.2021 15:05, Luca Fancellu wrote:
>>>>>>>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9=
b882
>>>>>>>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>>>>>>>> introducing a problem to boot Xen using Grub2 on ARM machine using=
 EDK2.
>>>>>>>>=20
>>>>>>>> The problem comes from the function get_parent_handle(...) that in=
side
>>>>>>>> uses the HandleProtocol on loaded_image->DeviceHandle, but the las=
t
>>>>>>>> is NULL, making Xen stop the UEFI boot.
>>>>>>>=20
>>>>>>> According to my reading the UEFI spec doesn't (explicitly) allow fo=
r
>>>>>>> this to be NULL. Could you clarify why this is the case? What other
>>>>>>> information may end up being invalid / absent? Is e.g. read_section=
()
>>>>>>> safe to use?
>>>>>>=20
>>>>>> My test on an arm machine running Grub2 on top of EDK2 showed that
>>>>>> when Xen is started, the get_parent_handle(=E2=80=A6) call was faili=
ng and stopping
>>>>>> the boot because the efi_bs->HandleProtocol(=E2=80=A6) was called wi=
th the
>>>>>> loaded_image->DeviceHandle argument NULL and the call was returning
>>>>>> a EFI_INVALID_PARAMETER.
>>>>>> So the parent handle can=E2=80=99t be requested and the filesystem c=
an=E2=80=99t be used,
>>>>>> but any other code that doesn=E2=80=99t use the handle provided by g=
et_parent_handle(=E2=80=A6)
>>>>>> can be used without problem like read_section(...).
>>>>>=20
>>>>> I understand this. My question was for the reason of ->DeviceHandle
>>>>> being NULL. IOW I'm wondering whether we're actually talking about a
>>>>> firmware or GrUB bug, in which case your change is a workaround for
>>>>> that rather than (primarily) a fix for the earlier Xen change.
>>>>=20
>>>> The issue was found only when using EDK2+Grub2, no issue when booting
>>>> directly from EDK2.
>>>> This is a fix for the regression, because without the EFI changes, Gru=
b2 was
>>>> booting successfully Xen. Using grub2 to boot Xen on arm is a very com=
mon
>>>> solution so not supporting this anymore could lead to lots of people h=
aving
>>>> issues if they update to Xen 4.16.
>>>=20
>>> I'm not objecting to addressing the issue. But the description needs
>>> to make clear where the origin of the problem lies, and afaict that's
>>> not the earlier Xen change. That one merely uncovered what, according
>>> to your reply, might then be a GrUB bug. Unless, as said earlier, I
>>> merely haven't been able to spot provisions in the spec for the field
>>> in question to be NULL.
>>=20
>> Maybe I can rephrase to be more specific from:
>>=20
>> The problem comes from the function get_parent_handle(...) that inside
>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>> is NULL, making Xen stop the UEFI boot.
>>=20
>> To:
>>=20
>> Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandle,
>> that is used by efi_bs->HandleProtocol(=E2=80=A6) inside get_parent_hand=
le(=E2=80=A6),
>> causing Xen to stop the boot getting an EFI_INVALID_PARAMETER error.
>>=20
>> Do you think it can be ok like this?
>=20
> Much better, yes, but I wonder what "returning" refers to. You want to
> describe the origin of the NULL handle as precisely as possible. And
> considering this turns out as a workaround, in a suitable place you
> will also want to add a code comment, such that a later reader won't
> decide this is all dead code and can be done in a simpler way.

Ok I can write the issue from the beginning to be sure:

Despite UEFI specification, EDK2+Grub2 is returning a NULL DeviceHandle
inside the interface given by the LOADED_IMAGE_PROTOCOL service, this
handle is used later by efi_bs->HandleProtocol(=E2=80=A6) inside get_parent=
_handle(=E2=80=A6)
when requesting the SIMPLE_FILE_SYSTEM_PROTOCOL interface,
causing Xen to stop the boot because of an EFI_INVALID_PARAMETER error.

Regarding the comment, I can rephrase this comment:
/*
 * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PROTOCOL
 * to have access to the filesystem.
 */

To be:

/*
 * If DeviceHandle is NULL, the firmware offering the UEFI services might n=
ot be
 * compliant to the standard and we can't use the SIMPLE_FILE_SYSTEM_PROTOC=
OL
 * to have access to the filesystem. However the system can boot if and onl=
y if it doesn=E2=80=99t
 * require access to the filesystem. (e.g. Xen image has everything built i=
n or the
 * bootloader did previously load every needed binary in memory)
 */

What do you think?

Cheers,
Luca

>=20
> Jan


